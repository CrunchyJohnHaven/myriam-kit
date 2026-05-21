#!/usr/bin/env bash
# myriam-init: scaffold a new MYRIAM publication.
#
# Usage:
#     bash myriam-init.sh my-publication
#
# Creates ./my-publication/ with starter facts, a build dir, and a site
# template. Edit the facts, then run lib/seal.sh from inside the
# publication directory.
#
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "usage: $0 <publication-name>" >&2
  exit 1
fi

NAME="$1"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_ROOT="$(cd "$HERE/.." && pwd)"

if [ -e "$NAME" ]; then
  echo "error: $NAME already exists. Refusing to overwrite." >&2
  exit 1
fi

mkdir -p "$NAME/facts" "$NAME/build" "$NAME/site/facts" "$NAME/site/build"

# Copy the lib scripts so the publication is self-contained
cp "$HERE/build.py" "$HERE/verify.py" "$HERE/seal.sh" "$NAME/build/"

# Copy starter facts + site template
cp -r "$KIT_ROOT/template/facts/"* "$NAME/facts/" 2>/dev/null || true
cp "$KIT_ROOT/template/site/index.html" "$NAME/site/index.html" 2>/dev/null || true

cat > "$NAME/README.md" <<EOF
# $NAME

A MYRIAM publication scaffolded with [myriam-kit](https://github.com/...).

## What to edit

1. \`facts/\` — one file per fact, named \`NN_short_name.txt\`.
   The body is whatever you want sealed. UTF-8, LF line endings.
2. \`site/index.html\` — the public presentation of your facts.
   Update the per-fact display blocks and the displayed Merkle root.

## What to run

\`\`\`bash
cd $NAME
bash build/seal.sh        # build root + OTS stamp + IPFS pin
python3 build/verify.py   # confirm everything still verifies
\`\`\`

## What to deploy

The \`site/\` directory. Drag it into Cloudflare Pages, Netlify,
GitHub Pages, or any static host. The IPFS CID gives you a parallel
content-addressed copy that survives takedown.

## What to commit to memory

Once you have published, you cannot un-publish. The Merkle root and
the IPFS CID are public, permanent records. If you might want to
retract any fact, do not seal it.
EOF

echo "scaffolded: $NAME"
echo
echo "next:"
echo "  cd $NAME"
echo "  edit facts/*.txt"
echo "  bash build/seal.sh"
