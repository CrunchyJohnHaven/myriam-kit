# Election Tally Pre-Certification Seal Kit

A turnkey myriam-kit example for county boards of canvassers, state
election authorities, and election-integrity observers who want to
publish a Bitcoin-anchored, tamper-evident seal of a tally at the exact
moment of certification.

**Closes** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of what was certified. It cannot
verify whether what was certified was correct. The following failure
modes are **outside the seal's domain**:

1. **Voting-machine compromise.** If firmware was tampered with or vote
   totals were miscounted, the seal anchors a wrong number with high
   integrity. The seal observes outputs of the tabulation system; it
   has no visibility into the system itself.

2. **Vote suppression / structural disenfranchisement.** Polling-place
   closures, ID-law disparities, mail-ballot rejection-rate bias, and
   registration purges are upstream of certification. The seal records
   ballots counted, not ballots that should have been counted.

3. **Election misinformation.** The seal does not adjudicate claims
   about the election made by candidates, media, or platforms. A sealed
   certification can be quoted in a misinformation narrative as easily
   as in defense against one. Cryptographic timestamps are content-neutral.

4. **Pre-certification fraud during ballot collection or counting.**
   Ballot-harvesting irregularities, drop-box tampering, chain-of-
   custody breaks during the count window — all occur before the seal
   moment. The seal cannot retroactively detect them.

5. **Coercion of the certifying authority.** A coerced certification
   produces a cryptographically valid seal of a coerced result. The
   seal verifies that an official signed, not why.

6. **Wrong certifications that are never later corrected.** The seal's
   value depends on a later truth-finding process (audit, recount,
   litigation) to which the seal can be compared. If no such process
   ever runs, the seal stands as the only record and may calcify error.

7. **Statistical anomalies and pattern detection.** The seal does not
   flag implausible margins, geographic anomalies, or Benford-law
   deviations. Those are analytical tasks on the sealed data, not
   properties of the seal.

8. **Down-ballot races with thin audit trails.** Smaller races have
   weaker recount triggers; a single seal cannot meaningfully cover
   all races on a ballot without per-race scoping.

**The honest-limits section above is the load-bearing part of this kit.**
Officials who believe sealing equals legitimacy will use it as a shield.
The kit must say plainly: this is a *non-repudiation primitive for the
certification moment*, not a proof of election correctness.

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if a
user with valid signing authority submits them:

- **Individual voter identification.** No fact may name a voter, link
  a ballot to a voter, or expose any field that could re-identify a
  person.
- **Per-ballot signature-match decisions.** PII-laden; sealing creates
  permanent records of decisions that may later be challenged.
- **Any fact whose publication would identify a vulnerable voter.**
  Includes precinct-level results in precincts so small that vote choice
  is inferable (typically <50 ballots).
- **Tallies sealed before all ballots are counted.** The kit refuses
  partial counts presented as "the tally." Pre-certification means
  *all ballots counted, before official certification* — not *during
  counting*.
- **Provisional or contingent certifications.** The seal must reflect
  a fact, not a conditional.
- **Counts that exclude pending litigation cohorts** without an explicit
  sealed companion-fact disclosing the exclusion.
- **Sealing by anyone other than the certifying authority** for that
  jurisdiction.

A refusal itself may be sealed as a fact ("This authority requested
sealing of X; the kit refused per refusal-rule Y"), creating a public
record of attempted misuse.

---

## What this kit DOES seal

8 facts at the moment of certification:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Jurisdiction identification** — county, election date, certifying
   authority, certifying officials by name + role.
3. **Certified tally** — per-contest per-candidate vote totals + over/
   under-votes + write-ins.
4. **Ballot accounting and reconciliation** — total cast, total
   tabulated, total rejected by category, mode breakdown, registered-
   voter denominator.
5. **Equipment and audit-trail manifest** — tabulator model + firmware
   hash, CVR file hash, ballot-image archive hash, custody-log hash,
   signature-match policy hash.
6. **Thresholds and triggers at certification** — signature-match
   threshold in effect, recount-trigger thresholds, actual margins per
   contest, RLA seed commitment.
7. **Companion disclosures and refusal record** — pending litigation,
   post-count anomalies under review, excluded cohorts, dissenting
   board members; explicit list of patterns the kit refused to seal.
8. **Signing principal** — Board of Canvassers identification + each
   signatory's name and party + cryptographic key info.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section above).

---

## What this kit defends against

- **Silent post-certification revision of vote totals** — any integer
  change to FACT 03 produces a different SHA-256, different Merkle
  root, fails OTS verification.
- **"Found ballots" being silently absorbed** — FACT 04 reconciliation
  arithmetic is fixed at certification.
- **Firmware-substitution claims** — FACT 05 freezes the equipment
  manifest at certification.
- **Audit-artifact substitution post-certification** — FACT 05's hash
  manifest catches any post-cert change to CVR, ballot images, custody
  logs, or signature-match policy.
- **Threshold and trigger redefinition** — FACT 06 freezes the rules
  in effect at certification (signature-match threshold, recount
  triggers, RLA risk limit).

## Historical or near-historical cases the kit would have helped with

The kit would have produced a useful anchor — *not a fix* — in cases
involving:

- **Antrim County, Michigan (2020).** Initial unofficial results showed
  a candidate-swap later corrected to the opposite outcome. A pre-
  correction seal would have provided a public reference for what the
  original announcement said vs. what the correction said, with both
  cryptographically attested.
- **Maricopa County, Arizona (2020–2022).** Multiple iterations of
  recounted/re-examined totals circulated. A certification-moment seal
  would have provided an unambiguous reference point against which each
  subsequent count could be diffed.
- **Florida 2000 (Bush v. Gore canvass).** County-by-county certified
  totals shifted under recount pressure; a per-county pre-recount seal
  would have preserved what each county certified before manual recount
  procedures began.
- **Various foreign elections with documented post-certification
  "corrections."** Jurisdiction-agnostic.

The kit would NOT have resolved the underlying disputes about machine
integrity in 2020, mail-ballot policy disputes, or any election where
the core question was contested fact rather than contested record.

## When to use this kit

- Your jurisdiction has a stable, audited certification process and
  wants to add an immutable public anchor.
- You expect post-certification scrutiny and want a tamper-evident
  reference point.
- You have legal authority to publish the listed fact set without
  exposing PII.
- You have a parallel audit or RLA process so the seal can be compared
  to truth-finding output.

## When NOT to use this kit

- **Do not use as a substitute for risk-limiting audits, hand recounts,
  or post-election audits.** This kit is *additive*, not replacement.
- **Do not use if the certifying official is not the actual decision-
  maker** (creates false attribution).
- **Do not use mid-tabulation.** The kit is for the certification
  moment specifically. Partial-count seals create misleading reference
  points.
- **Do not use to claim the election was fair, accurate, or legitimate**
  — it cannot do that.
- **Do not use under pressure to seal earlier than the certification
  moment, or to omit a companion-fact disclosure.** Refuse, and seal
  the refusal.
- **Do not use as legitimacy theater.** A seal of a fraudulent tally
  is a permanent public record of fraud, not a defense of it. The
  primitive cuts both ways; that is its honesty.

## How to fork this kit for a real certification

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # replace fictional content with real
bash build/seal.sh     # seal AT or after the official certification signature
python3 build/verify.py
```

**Critical timing:** seal AT the certification moment, NOT before. A seal
before official certification creates a false-positive "this is the
official result" record. A seal after is conventional non-repudiation.

## Integration with existing election infrastructure

- **State Boards of Elections / EAC certification.** The kit publishes
  alongside the official certification document. It does not replace
  the statutory certification.
- **Risk-limiting audits.** The CVR hash in FACT 05 is the same hash
  the RLA tool consumes. The seal binds the audited CVR to the
  certified total.
- **Recount procedures.** A recount triggered under state law produces
  a NEW sealed fact-set (different timestamp, different hashes, same
  jurisdiction). Both seals coexist; neither overwrites the other. The
  diff between seals is the public record of what the recount changed.
- **Election Markup Language (EML) and Common Data Format (CDF).** Fact
  bodies should be derivable from the jurisdiction's existing EML/CDF
  outputs to keep the kit data-format-agnostic.
- **Bipartisan board-of-canvassers signing.** Multi-signature variant
  recommended for jurisdictions with partisan-balanced canvass boards.

## What this kit does NOT replace

- Statutory certification under state election law
- EAC voting-system certification
- Risk-limiting audits / hand recounts
- Recount procedures and post-election audits
- Court orders or election-contest litigation

## Why this kit exists in v0.3.0+

This is the 6th worked example shipped with myriam-kit. The kit was
produced via a Karpathy-style autoresearch process documented in
`~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Three prompt variants
(imitation / first-principles / constraint-first) produced parallel
kit outlines; the constraint-first variant scored highest on a weighted
rubric, and the final kit synthesizes its structure with the imitation
variant's cohesion and the first-principles variant's operational
detail.

The autoresearch itself is documented as a prompt pattern in
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` for future use.

## License

Public domain (CC0). Fork it. No attribution required.
