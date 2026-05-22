#!/usr/bin/env bash
# myriam-domain-init.sh — generate a new domain-specific attestation kit scaffold
#
# Usage:
#   bash lib/myriam-domain-init.sh <kit-name>
#
# This produces a directory under examples/<kit-name>/ containing:
#   - README.md (constraint-first template with TODOs for your domain)
#   - facts/01_example_notice.txt through 08_signing_principal.txt
#   - build/{build.py,seal.sh,verify.py} (standard, identical across kits)
#
# After running, fill in:
#   - The "DOES NOT do" failure modes specific to your domain
#   - The "MUST REFUSE" patterns specific to your domain
#   - The 8 facts you want to seal
#   - Historical cases the kit would have produced anchors for
#   - When to use / when NOT to use guidance
#
# Then: bash build/seal.sh
#
# CC0. The point of this script is to make producing a new attestation kit
# take ~5 minutes instead of ~5 hours. If you build one, please open a PR
# back to myriam-kit so others can fork it.

set -euo pipefail

KIT_NAME="${1:-}"
if [[ -z "$KIT_NAME" ]]; then
  echo "Usage: bash lib/myriam-domain-init.sh <kit-name>" >&2
  echo "Example: bash lib/myriam-domain-init.sh organ-allocation-attestation" >&2
  exit 1
fi

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
KIT_DIR="$REPO_ROOT/examples/$KIT_NAME"
TEMPLATE_KIT="$REPO_ROOT/examples/election-tally-precertification"

if [[ -d "$KIT_DIR" ]]; then
  echo "ERROR: $KIT_DIR already exists. Pick a different name or delete it first." >&2
  exit 1
fi

if [[ ! -d "$TEMPLATE_KIT" ]]; then
  echo "ERROR: Template kit not found at $TEMPLATE_KIT" >&2
  exit 1
fi

mkdir -p "$KIT_DIR/facts" "$KIT_DIR/build" "$KIT_DIR/site"

# Copy build infrastructure verbatim (identical across all kits — this is by design)
cp "$TEMPLATE_KIT/build/build.py"  "$KIT_DIR/build/build.py"
cp "$TEMPLATE_KIT/build/verify.py" "$KIT_DIR/build/verify.py"
cp "$TEMPLATE_KIT/build/seal.sh"   "$KIT_DIR/build/seal.sh"
chmod +x "$KIT_DIR/build/build.py" "$KIT_DIR/build/verify.py" "$KIT_DIR/build/seal.sh"

# Generate README template with constraint-first structure
cat > "$KIT_DIR/README.md" <<EOF
# $(echo "$KIT_NAME" | tr '-' ' ' | sed 's/.*/\u&/')

*A myriam-kit worked example for [TODO: describe what domain this seals].*

[TODO: 2-3 sentence summary of why this kit exists and who would adopt it.]

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of what was attested. It cannot
verify whether what was attested was correct. The following failure modes
are **outside the seal's domain**:

1. [TODO: failure mode #1 specific to your domain]
2. [TODO: failure mode #2]
3. [TODO: failure mode #3 — include the coercion-amplification clause:
   if the signing officer is themselves captured/coerced, the seal
   records the captured event with cryptographic integrity but does not
   defend against the capture]
4. [TODO: failure mode #4 — what the kit does NOT replace]

**The honest-limits section above is the load-bearing part of this kit.**
Adopters who believe sealing equals legitimacy will use it as a shield.
The kit must say plainly what it does and does not assert.

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if a user
with valid signing authority submits them:

- **R1.** [TODO: refuse pattern #1 — typically PII protection]
- **R2.** [TODO: refuse pattern #2]
- **R3.** [TODO: refuse pattern #3]
- **R4.** [TODO: refuse pattern #4]
- **R5.** [TODO: refuse pattern #5 — typically: no single-signer for high-stakes domains]

A refusal itself may be sealed as a fact ("This authority requested
sealing of X; the kit refused per refusal-rule Y"), creating a public
record of attempted misuse.

---

## What this kit DOES seal

8 facts at the moment of attestation:

1. **Example notice** — declares the publication an example
2. **[TODO: fact 2 name]** — [TODO: what it contains]
3. **[TODO: fact 3 name]** — [TODO: what it contains]
4. **[TODO: fact 4 name]** — [TODO: what it contains]
5. **[TODO: fact 5 name]** — [TODO: what it contains]
6. **[TODO: fact 6 name]** — [TODO: what it contains]
7. **[TODO: fact 7 name]** — [TODO: companion disclosures + refusal record]
8. **[TODO: fact 8 name]** — typically signing principal(s)

Each fact ends with the refusal-gate convention: *"This fact asserts only
X. It does not assert Y"* (where Y is the closest failure mode from the
"DOES NOT do" section above).

---

## What this kit defends against

- [TODO: defense #1]
- [TODO: defense #2]
- [TODO: defense #3]

---

## Historical cases this kit would have helped with

[TODO: list 2-4 historical cases where the kit would have produced a
useful anchor — NOT a fix. Be honest about what the kit would and would
not have prevented.]

---

## When to use this kit

- [TODO: condition #1]
- [TODO: condition #2]

## When NOT to use this kit

- [TODO: anti-pattern #1 — usually "as legitimacy theater"]
- [TODO: anti-pattern #2]

---

## How to fork this kit for a real attestation

\`\`\`bash
cp -r ~/Genesis/myriam-kit/examples/$KIT_NAME ~/my-attestation
cd ~/my-attestation
\$EDITOR facts/*.txt    # replace template content with real
bash build/seal.sh     # seal AT or after the official moment, NOT before
python3 build/verify.py
\`\`\`

**Critical timing:** seal AT or after the moment of attestation. A seal
before creates a false-positive "this is the official record" tag.

---

## Integration with existing infrastructure

[TODO: list relevant existing regulatory / industry frameworks the kit
composes with, e.g., FDA Form 483, CMS HRRP, OCDS, etc.]

---

## What this kit does NOT replace

[TODO: explicit list of upstream regimes the kit is additive to.]

---

## Adoption value

[TODO: rough estimate of the trust gap addressed in your domain, framed
honestly. Use the methodology from \`docs/TRUST_GAP_CALCULATOR.md\` —
provide low/mid/high estimates with explicit assumptions. Do not promise
lives saved; do estimate addressable savings and convert to lives-equivalent
with the standard caveats.]

---

## License

Public domain (CC0). Fork it. No attribution required.
EOF

# Generate fact file templates
cat > "$KIT_DIR/facts/01_example_notice.txt" <<'EOF'
EXAMPLE NOTICE

This is an EXAMPLE attestation kit. All content below is fictional and
illustrative. Do not rely on any specific claim in this kit as factual.

Real attestations should replace this notice with a removal acknowledgment
and substitute actual data in the remaining seven facts.

The myriam-kit refusal-gate (SPEC §7) applies to this kit. Do not seal
content that violates the MUST REFUSE rules in README.md.

This fact asserts only that this is an example. It does not assert that
the rest of the kit's content is real.
EOF

for i in 02 03 04 05 06 07; do
  cat > "$KIT_DIR/facts/${i}_fact_${i}_template.txt" <<EOF
TODO: FACT ${i} CONTENT

Replace this file with the actual content for fact ${i}.

The fact body should be plain text, deterministic (re-running the seal
should produce the same hash if the underlying facts haven't changed),
and use ASCII line endings (LF, not CRLF).

End with the refusal-gate convention:

This fact asserts only [the specific narrow claim]. It does not assert
[the closest failure mode from the "DOES NOT do" section].
EOF
done

cat > "$KIT_DIR/facts/08_signing_principal.txt" <<'EOF'
TODO: SIGNING PRINCIPAL

For high-stakes attestations, use a two-signer minimum (one operational
authority + one independent oversight role). For lower-stakes
attestations, single-signer with explicit acknowledgment of the lower
strength is acceptable.

Required fields:
  - Signing entity name (organization)
  - Signing role(s)
  - Signing person(s) full legal name(s)
  - Public credential reference (license number, employee ID, etc.)
  - Supervisor chain of accountability
  - Cryptographic key information (PGP fingerprint, X.509 cert, etc.)

This fact asserts only that the named principals signed at the named
moment. It does not assert that the principals were uncoerced, that they
had the legal authority to sign, or that the underlying claims they
signed are true.
EOF

echo "✓ Created $KIT_DIR"
echo ""
echo "Next steps:"
echo "  1. Edit README.md — fill in the TODOs to describe your domain"
echo "  2. Edit facts/*.txt — replace template content with real (or example) data"
echo "  3. cd $KIT_DIR && bash build/seal.sh"
echo "  4. python3 build/verify.py"
echo ""
echo "When you're satisfied, open a PR back to myriam-kit so others can"
echo "fork your kit. The point is to make trust-evidence primitives"
echo "available across every domain that needs them, faster than any"
echo "single author could produce them alone."
echo ""
echo "CC0. No attribution required."
