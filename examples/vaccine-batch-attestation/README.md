# Vaccine Batch Attestation Kit

A turnkey myriam-kit example for vaccine manufacturers, quality
assurance authorities, and public health agencies wanting to publish a
Bitcoin-anchored, tamper-evident seal of a batch release.

## What this kit defends against

**Failure modes the seal catches:**

- **Silent retroactive modification of release test results.** All 8
  release-testing PDFs in the example are hashed. Re-hashing post-release
  reveals any modification.
- **Disputes about which specifications applied at release.** The
  sealed FACT 02 contains the canonical batch identification and
  manufacturing-record hash. Future "the spec was always X" disputes
  have a public anchor.
- **Silent recall-scope minimization.** Pharmacovigilance commitments
  in FACT 05 are sealed; failure to honor them is publicly observable.
- **Retroactive re-spec for an out-of-spec batch.** If a release-test
  result was actually a borderline PASS that gets reclassified as a
  FAIL post-release, the sealed report hashes prove what the original
  result PDF said.

**Failure modes NOT covered:**

- Fraud in the manufacturing process itself (the seal anchors test
  results, not manufacturing integrity).
- Adverse events that are biological consequences of an otherwise-
  passing batch (the seal doesn't certify clinical safety, only
  documentation integrity).
- Disputes about which version of a regulatory specification is
  authoritative.

## When to use this kit

Consider sealing a batch release if:

- You are a vaccine manufacturer wanting to demonstrate forensic
  integrity of release records beyond what regulators require
- You are a QA team adopting a "publish what we attest" practice
- You are a small/national-scale manufacturer in a jurisdiction with
  weaker regulatory infrastructure, wanting to anchor batch records
  against a global verifier
- You are a public-health agency or NGO running a non-commercial
  vaccine production program (e.g. for neglected diseases)

## Historical mortality precedent

- **Heparin contamination (2008, China):** counterfeit oversulfated
  chondroitin sulfate in heparin batches. A sealed release-test
  manifest would have made silent post-release modification of the
  testing record cryptographically detectable.
- **Tylenol cyanide (1982):** retroactive disputes about tampering
  point of origin. A sealed manufacturing-record hash anchors the
  pre-distribution state.
- **Various vaccine batch recalls** where the question "was this batch
  ever properly tested" becomes contested years later.

The kit is NOT a fix for ANY of these in a strict sense — but in each
case, sealed batch attestations would have provided a cleaner
forensic timeline.

## How to fork this kit for a real batch

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # replace fictional content with real batch
bash build/seal.sh        # SEAL BEFORE distribution begins
python3 build/verify.py   # confirm
```

**CRITICAL TIMING**: seal at the moment of QA release, BEFORE the batch
is distributed. A seal after distribution is forensically weaker.

## Integration with existing pharmaceutical infrastructure

- **eCTD submissions (FDA / EMA):** the sealed publication URL or IPFS
  CID can be referenced in the Module 3 (quality) section
- **WHO Prequalification:** the sealed manifest demonstrates the
  pre-release testing chain to non-FDA/EMA jurisdictions
- **Pharmacovigilance feedback:** FACT 05 commits the manufacturer to
  sealed reporting of aggregate AE counts at 6 and 12 months
- **Recall systems (RxConnect, MedWatch):** if a recall is needed, the
  recall scope itself is sealed under MYRIAM, providing public
  verification that all distributed lots are being addressed

## What this kit does NOT replace

- FDA / EMA / WHO regulatory submissions
- GMP audit trails (the seal anchors RESULTS, not raw process records)
- Pharmacovigilance databases (VAERS / EudraVigilance)
- Recall coordination systems

## License

Public domain (CC0). Fork it. No attribution required.
