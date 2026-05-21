#!/usr/bin/env python3
"""myriam-kit verify: independent verification of a sealed publication.

Recomputes per-fact SHA-256 hashes and the Merkle root from facts/,
compares them to the published artifacts in build/, and (if the
OpenTimestamps `ots` client is installed) verifies the OTS receipt
against the Bitcoin blockchain.

Exit code 0 if verification passes; non-zero otherwise.

Stdlib only (plus optional `certifi` for OTS network calls on macOS).
Public domain.

Usage:
    python3 verify.py
    MYRIAM_FACTS_DIR=... python3 verify.py
"""
from __future__ import annotations

import hashlib
import os
import re
import shutil
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
FACTS_DIR = os.path.abspath(os.environ.get(
    "MYRIAM_FACTS_DIR", os.path.join(HERE, "..", "facts")
))
BUILD_DIR = HERE
FACT_RE = re.compile(r"^\d{2}_[a-z0-9_]+\.txt$")


def sha256_file(path: str) -> bytes:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        while True:
            chunk = f.read(65536)
            if not chunk:
                break
            h.update(chunk)
    return h.digest()


def merkle_root(leaves: list[bytes]) -> bytes:
    if not leaves:
        raise ValueError("empty leaf set")
    level = list(leaves)
    while len(level) > 1:
        if len(level) % 2 == 1:
            level.append(level[-1])
        next_level = []
        for i in range(0, len(level), 2):
            next_level.append(hashlib.sha256(level[i] + level[i + 1]).digest())
        level = next_level
    return level[0]


def main() -> int:
    ok = True

    # 1. Recompute leaves + root.
    if not os.path.isdir(FACTS_DIR):
        print(f"FAIL facts directory not found: {FACTS_DIR}", file=sys.stderr)
        return 1
    fact_files = sorted(fn for fn in os.listdir(FACTS_DIR) if FACT_RE.match(fn))
    if not fact_files:
        print(f"FAIL no facts matched in {FACTS_DIR}", file=sys.stderr)
        return 1
    leaves = [sha256_file(os.path.join(FACTS_DIR, fn)) for fn in fact_files]
    recomputed_root = merkle_root(leaves).hex()

    # 2. Compare to published root.
    root_file = os.path.join(BUILD_DIR, "merkle_root.txt")
    if not os.path.exists(root_file):
        print(f"FAIL merkle_root.txt not found at {root_file}", file=sys.stderr)
        return 1
    with open(root_file) as f:
        published_root = f.read().strip()

    if recomputed_root == published_root:
        print(f"OK  merkle root matches: {recomputed_root}")
    else:
        ok = False
        print(f"FAIL merkle root mismatch", file=sys.stderr)
        print(f"     recomputed: {recomputed_root}", file=sys.stderr)
        print(f"     published:  {published_root}", file=sys.stderr)

    # 3. Per-leaf check against leaf_hashes.txt.
    leaf_file = os.path.join(BUILD_DIR, "leaf_hashes.txt")
    if os.path.exists(leaf_file):
        with open(leaf_file) as f:
            published_leaves = [ln.strip() for ln in f if ln.strip()]
        recomputed_leaves = [f"{leaves[i].hex()}  {fact_files[i]}" for i in range(len(fact_files))]
        if published_leaves == recomputed_leaves:
            print(f"OK  {len(leaves)} leaf hashes match")
        else:
            ok = False
            print("FAIL leaf hash list mismatch", file=sys.stderr)

    # 4. OpenTimestamps verification (if available).
    ots_receipt = os.path.join(BUILD_DIR, "merkle_root.txt.ots")
    if os.path.exists(ots_receipt) and shutil.which("ots"):
        print("--- ots verify merkle_root.txt.ots ---")
        env = os.environ.copy()
        try:
            import certifi  # type: ignore
            env.setdefault("SSL_CERT_FILE", certifi.where())
        except ImportError:
            pass
        result = subprocess.run(
            ["ots", "verify", ots_receipt],
            capture_output=True, text=True, env=env,
        )
        sys.stdout.write(result.stdout)
        sys.stderr.write(result.stderr)
        if result.returncode != 0:
            if "Pending" not in (result.stdout + result.stderr):
                ok = False
    elif not os.path.exists(ots_receipt):
        print(f"INFO no OTS receipt yet ({ots_receipt} not found)")
    elif not shutil.which("ots"):
        print("INFO ots client not installed; skipping Bitcoin verification")

    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
