#!/usr/bin/env bash
# myriam-kit seal: full sealing pipeline.
#
# 1. build.py — compute leaf hashes + Bitcoin-style Merkle root
# 2. ots stamp — submit root to two independent OpenTimestamps calendars
#                (witness-diversity policy: not from a single operator)
# 3. ipfs add — pin the site/ directory and announce CID via DHT
#
# Stdlib + python3 + ots + ipfs. macOS-tested. Public domain.
#
# Usage:
#     bash seal.sh                     # uses ./facts/ and ./site/ in $PWD
#     MYRIAM_FACTS_DIR=... MYRIAM_SITE_DIR=... bash seal.sh
#
# Environment overrides:
#     MYRIAM_FACTS_DIR     default: ./facts
#     MYRIAM_SITE_DIR      default: ./site
#     MYRIAM_BUILD_DIR     default: ./build
#     MYRIAM_CAL_A         default: alice.btc.calendar.opentimestamps.org
#     MYRIAM_CAL_B         default: finney.calendar.eternitywall.com
#     MYRIAM_SKIP_IPFS     set to 1 to skip the IPFS pin step
#
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PUB_ROOT="$(pwd)"

FACTS_DIR="${MYRIAM_FACTS_DIR:-$PUB_ROOT/facts}"
SITE_DIR="${MYRIAM_SITE_DIR:-$PUB_ROOT/site}"
BUILD_DIR="${MYRIAM_BUILD_DIR:-$PUB_ROOT/build}"
CAL_A="${MYRIAM_CAL_A:-https://alice.btc.calendar.opentimestamps.org}"
CAL_B="${MYRIAM_CAL_B:-https://finney.calendar.eternitywall.com}"

mkdir -p "$BUILD_DIR"

# --- 1. Build root -----------------------------------------------------
echo "==> Building Merkle root from $FACTS_DIR"
MYRIAM_FACTS_DIR="$FACTS_DIR" python3 "$HERE/build.py"
# build.py writes into its own dir (lib/); move artifacts to BUILD_DIR.
for f in merkle_root.txt leaf_hashes.txt seal_time.txt; do
  if [ "$HERE/$f" != "$BUILD_DIR/$f" ] && [ -f "$HERE/$f" ]; then
    mv "$HERE/$f" "$BUILD_DIR/$f"
  fi
done
ROOT="$(cat "$BUILD_DIR/merkle_root.txt")"
echo "    root: $ROOT"
echo

# --- 2. OTS stamp against two independent calendars --------------------
echo "==> Stamping root with OpenTimestamps (witness diversity)"
echo "    cal A: $CAL_A"
echo "    cal B: $CAL_B"
if command -v ots >/dev/null 2>&1; then
  # On macOS the system Python sometimes lacks a CA bundle reachable by
  # the ots client's urllib. Point it at certifi if present.
  if python3 -c "import certifi" >/dev/null 2>&1; then
    export SSL_CERT_FILE="$(python3 -m certifi)"
  fi
  ots -v stamp -c "$CAL_A" -c "$CAL_B" -m 2 "$BUILD_DIR/merkle_root.txt"
  echo "    receipt: $BUILD_DIR/merkle_root.txt.ots"
else
  echo "    !! ots client not installed; skipping Bitcoin commitment." >&2
  echo "       install with: brew install opentimestamps-client" >&2
fi
echo

# --- 3. IPFS pin -------------------------------------------------------
if [ "${MYRIAM_SKIP_IPFS:-0}" != "1" ]; then
  echo "==> Pinning $SITE_DIR to IPFS"
  if command -v ipfs >/dev/null 2>&1; then
    # Make sure facts + build artifacts are inside the site dir
    mkdir -p "$SITE_DIR/facts" "$SITE_DIR/build"
    cp -r "$FACTS_DIR/"* "$SITE_DIR/facts/" 2>/dev/null || true
    cp "$BUILD_DIR/merkle_root.txt" "$SITE_DIR/" 2>/dev/null || true
    cp "$BUILD_DIR/merkle_root.txt.ots" "$SITE_DIR/" 2>/dev/null || true
    cp "$BUILD_DIR/leaf_hashes.txt" "$SITE_DIR/build/" 2>/dev/null || true
    cp "$BUILD_DIR/merkle_root.txt" "$SITE_DIR/build/" 2>/dev/null || true
    cp "$BUILD_DIR/merkle_root.txt.ots" "$SITE_DIR/build/" 2>/dev/null || true
    cp "$HERE/build.py" "$HERE/verify.py" "$SITE_DIR/build/" 2>/dev/null || true

    CID="$(ipfs add -r --cid-version=1 -Q "$SITE_DIR")"
    echo "    pinned: $CID"
    echo "$CID" > "$BUILD_DIR/site_cid.txt"
    # Announce to DHT (non-blocking)
    (ipfs routing provide "$CID" >/dev/null 2>&1 &) || true
    echo "    gateways (allow ~1 min for first-fetch caching):"
    echo "      https://ipfs.io/ipfs/$CID/"
    echo "      https://$CID.ipfs.dweb.link/"
  else
    echo "    !! ipfs client not installed; skipping content-addressed pin." >&2
    echo "       install with: brew install ipfs" >&2
  fi
  echo
fi

# --- 4. Summary --------------------------------------------------------
echo "============================================================"
echo "MYRIAM publication sealed"
echo "  facts:        $(ls "$FACTS_DIR"/[0-9][0-9]_*.txt 2>/dev/null | wc -l | tr -d ' ')"
echo "  merkle root:  $ROOT"
echo "  ots receipt:  $BUILD_DIR/merkle_root.txt.ots"
[ -f "$BUILD_DIR/site_cid.txt" ] && echo "  ipfs cid:     $(cat "$BUILD_DIR/site_cid.txt")"
echo
echo "Next:"
echo "  - deploy site/ to any static host (Cloudflare Pages, Netlify, GitHub Pages, S3)"
echo "  - share the URL (and/or the IPFS CID)"
echo "  - in ~few hours run 'ots upgrade $BUILD_DIR/merkle_root.txt.ots' to convert"
echo "    each pending calendar attestation into a full Bitcoin block reference"
echo "============================================================"
