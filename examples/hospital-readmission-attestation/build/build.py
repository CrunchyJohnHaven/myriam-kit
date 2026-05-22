#!/usr/bin/env python3
"""myriam-kit build: compute per-fact SHA-256 + Bitcoin-style Merkle root.

Reads the canonical fact set from ../facts/ (or $MYRIAM_FACTS_DIR),
computes per-fact SHA-256 hashes, computes the Bitcoin-style Merkle root,
and writes the build artifacts.

Usage:
    python3 build.py
    MYRIAM_FACTS_DIR=/path/to/facts python3 build.py

Artifacts written into build/ (alongside this script):
    leaf_hashes.txt   one line per fact: "<sha256_hex>  <filename>"
    merkle_root.txt   single line, lowercase hex Merkle root, no newline
    seal_time.txt     ISO 8601 UTC timestamp of build run

Stdlib only. No external dependencies. Public domain.
"""
from __future__ import annotations

import hashlib
import os
import re
import sys
from datetime import datetime, timezone

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
    """Bitcoin-style Merkle root: pair-hash, duplicate-last-on-odd."""
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
    if not os.path.isdir(FACTS_DIR):
        print(f"error: facts directory not found: {FACTS_DIR}", file=sys.stderr)
        print(f"hint: set MYRIAM_FACTS_DIR or place facts at ../facts/", file=sys.stderr)
        return 1

    fact_files = sorted(
        fn for fn in os.listdir(FACTS_DIR) if FACT_RE.match(fn)
    )
    if not fact_files:
        print(f"error: no facts matched pattern NN_name.txt in {FACTS_DIR}", file=sys.stderr)
        return 1

    leaves: list[bytes] = []
    leaf_lines: list[str] = []
    for fn in fact_files:
        path = os.path.join(FACTS_DIR, fn)
        digest = sha256_file(path)
        leaves.append(digest)
        leaf_lines.append(f"{digest.hex()}  {fn}")

    root = merkle_root(leaves)
    root_hex = root.hex()
    seal_time = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    os.makedirs(BUILD_DIR, exist_ok=True)
    with open(os.path.join(BUILD_DIR, "leaf_hashes.txt"), "w") as f:
        f.write("\n".join(leaf_lines) + "\n")
    with open(os.path.join(BUILD_DIR, "merkle_root.txt"), "w") as f:
        f.write(root_hex)  # no trailing newline — exact bytes get OTS-stamped
    with open(os.path.join(BUILD_DIR, "seal_time.txt"), "w") as f:
        f.write(seal_time + "\n")

    print(f"facts:        {len(fact_files)}")
    print(f"merkle_root:  {root_hex}")
    print(f"seal_time:    {seal_time}")
    print(f"facts_dir:    {FACTS_DIR}")
    print(f"artifacts:    leaf_hashes.txt  merkle_root.txt  seal_time.txt")
    return 0


if __name__ == "__main__":
    sys.exit(main())
