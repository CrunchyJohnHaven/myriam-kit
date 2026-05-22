# FDA Form 483 Inspection Finding Seal Kit

A turnkey myriam-kit example for FDA investigators (and the
supervisory chains that back them) who want to seal a Form
FDA-483 Inspectional Observations at the closing-meeting moment of
issuance — making any silent post-inspection softening, deletion,
or methodological revision cryptographically detectable.

The kit is U.S.-targeted. It is built around the actual FDA Form
483 / Establishment Inspection Report (EIR) workflow, 21 CFR Part
211 citations, NAI/VAI/OAI preliminary classifications, and
FDA-District-Office supervisory accountability.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of what a Form 483 said at the
closing-meeting moment of issuance. It cannot make the inspection
correct. The following failure modes are **outside the seal's domain**:

1. **Doesn't substitute for the FDA's official 483/EIR process.**
   The seal is strictly additive. The Form 483, the EIR, the District
   Office review, the Center compliance evaluation, and any subsequent
   Warning Letter / Consent Decree / AIP action are the legal
   instruments. The seal anchors what was issued at the closing
   meeting; it does not replace what comes after.

2. **Doesn't compel the firm to comply with cited observations.**
   The seal records the observation. The firm's response, corrective
   actions, and longer-term remediation are still required through
   the ordinary regulatory process. A sealed observation that the
   firm ignores is still an ignored observation — the seal just
   makes the ignoring publicly observable.

3. **Doesn't defend against the inspector themselves being captured.**
   The seal is a coercion-amplification primitive: if an inspector
   has been pressured to soften observations BEFORE closing meeting,
   the sealed Form 483 will record the softened version with high
   integrity. The kit refuses to seal under coercion (FACT 07 R7),
   but if the inspector does not invoke that refusal, the seal cannot
   detect the upstream capture.

4. **Doesn't make a NAI classification accurate.** If the inspector
   genuinely found nothing, the seal records "nothing found" with
   high integrity. The seal makes silent retroactive change visible;
   it does not adjudicate the underlying inspection quality.

5. **Doesn't anchor what the firm subsequently fixes.** Corrective
   actions, response letters, and remediation progress are properly
   sealed in NEW publications referencing this one by Merkle root —
   not edited into this one.

6. **Doesn't determine FDA enforcement.** Whether a Warning Letter
   issues, whether a Consent Decree is sought, whether the
   Application Integrity Policy is invoked — all those decisions are
   downstream of the closing-meeting Form 483 and are made by Center
   compliance officers, OGC, and DOJ counsel, not by the seal.

**The honest-limits section above is the load-bearing part of this
kit.** Inspectors and supervisors who believe sealing equals
regulatory force will misuse it as leverage. The kit must say plainly:
this is a *non-repudiation primitive for the closing-meeting moment*,
not a regulatory action in itself.

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if
a user with valid signing authority submits them:

- **Patient PII or trial-subject identifiers from cited adverse
  events.** Names, dates of birth, medical-record numbers, insurance
  IDs, and clinical-trial subject IDs MUST NOT appear in any sealed
  fact. Only de-identified case references are sealable.
- **Identities of employee whistleblowers who provided information
  to inspectors.** The whistleblower's name, role, dates of
  employment, identifying pattern of allegations, or any other
  re-identifying detail MUST NOT be sealed.
- **Trade-secret formulas or manufacturing processes.** Quantitative
  formula details, proprietary process parameters, and validation-
  batch process recipes MUST NOT be sealed verbatim. The seal
  references such documents by SHA-256 hash only, which proves the
  document existed without exposing its content.
- **Partial findings during ongoing inspection.** The kit refuses
  to seal a Form 483 mid-inspection. Sealing is permitted ONLY at
  the closing meeting, when all observations are finalized.
- **Sealing by anyone other than the actual investigator.** A
  District Director, Center reviewer, or any other party seeking to
  seal an inspection finding must do so as a SEPARATE publication
  attributed to themselves — not under the investigator's authority.

A refusal itself may be sealed as a fact ("This party requested
sealing of X; the kit refused per refusal-rule Y"), creating a
public record of attempted misuse.

---

## What this kit DOES seal

8 facts at the closing-meeting moment of Form 483 issuance:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Inspection identification** — establishment legal name, d/b/a,
   physical address, FEI + DUNS, inspection type, FACTS number,
   start and end dates, most-responsible person, investigators by
   name and role.
3. **Form 483 observations** — verbatim text of each observation
   with citation to the specific 21 CFR section violated, plus a
   per-observation SHA-256 so any single-observation rewording is
   independently detectable.
4. **Evidence manifest** — SHA-256 hashes of photographs, document
   copies obtained under 21 USC 374, and Form 484 sample collection
   records.
5. **Preliminary classification** — investigator's preliminary
   NAI / VAI / OAI determination at closing, with declared
   confidence and basis, plus investigator commitments to memo any
   later silent reclassification.
6. **Response window** — firm's deadline to respond (15 working
   days from issuance per Compliance Program 7356.002), method of
   issuance, and post-response commitments.
7. **Companion disclosures and refusal record** — pending
   litigation, prior inspections at the facility, recusals from this
   inspection, known parallel FDA activity, on-record firm
   statements; explicit list of patterns the kit refused to seal.
8. **Signing principal** — lead investigator + co-investigator +
   subject-matter expert, with supervisory chain (supervisor / CSO /
   District Director) named for accountability.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section above).

---

## What this kit defends against

The seal makes the following failure modes cryptographically detectable:

- **Silent retroactive softening of observations.** Any post-issuance
  change to the verbatim text in FACT 03 produces a different SHA-256
  for the affected observation, a different leaf hash, and a
  different Merkle root — all of which fail OTS verification against
  the Bitcoin-anchored seal.
- **Post-inspection deletion of citations.** Removing an entire
  observation from the EIR (vs. what was issued at closing) changes
  the count and the per-observation hash list. Detectable by diff
  against FACT 03.
- **Methodology revision to soften a finding.** Changing a 21 CFR
  citation from a more severe section to a less severe one (e.g.
  211.192 to 211.180(e)) after issuance is a per-observation hash
  change.
- **Silent classification downgrade.** OAI at closing being silently
  reclassified to VAI before EIR publication is detectable against
  the sealed FACT 05 preliminary classification. The investigator
  retains forensic recourse to publish a new sealed memo describing
  the downgrade.
- **Silent extension or truncation of response window.** Any
  deviation from the 2026-06-04 (FACT 06) deadline that is not
  itself sealed as a new publication is detectable.
- **Substitution of evidence files.** Re-hashing any photograph,
  document copy, or sample collection record against FACT 04 reveals
  any post-issuance file substitution.
- **Pattern erasure.** Silent revision of prior-inspection EIRs
  (FACT 07 C2) to make the current findings look like a
  first-occurrence rather than a pattern is detectable against the
  sealed prior-EIR hashes.

## Historical or near-historical cases this kit would have helped with

The kit would have produced a useful anchor — *not a fix* — in cases
involving:

- **Theranos (FDA inspections, 2015-2016).** The Form 483 issued at
  the Newark facility was contested and there were allegations the
  observations were softened relative to what the inspectors
  initially found. A sealed closing-meeting Form 483 would have
  preserved the inspector-issued text as a public anchor against
  any later softer version.
- **Heparin contamination (2008).** Multiple FDA inspections of
  contract suppliers in China preceded the contamination event. The
  question of what FDA inspectors found, when they found it, and how
  the findings escalated through the District-Office and Center
  review chain has been the subject of subsequent investigation.
  Sealed closing-meeting Form 483s at each inspection point would
  have provided an unambiguous timeline.
- **Peanut Corporation of America (PCA, 2008-2009).** Prior FDA and
  state inspections at the Blakely, Georgia plant identified
  conditions that, in retrospect, were precursors to the
  Salmonella outbreak. Sealed historical Form 483s would have made
  the pattern of repeated findings — and the regulatory response,
  or absence thereof — publicly auditable at the time, not only
  in post-outbreak litigation.

The kit would NOT have resolved the underlying questions about
whether the inspections were thorough enough, whether the District
Office acted on the findings, or whether the Agency overall had
the resources and authority to compel firm compliance.

## When to use this kit

You should consider sealing a Form 483 closing-meeting issuance if:

- You are an FDA investigator (or lead of an inspection team) who
  has reason to believe — based on prior inspection history at the
  same firm, prior pressure on similar findings, or the politics of
  the firm's relationships — that the observations you are issuing
  today may be silently revised after issuance.
- You are a supervisory investigator or District Compliance Officer
  who wants to provide your investigators with a forensic backstop
  against silent post-issuance change.
- Your District Office is piloting publication of inspection
  findings under existing FOIA/EIR practices and wants to add
  cryptographic tamper-evidence as an integrity layer.
- You are participating in a public-health inspection (e.g. during
  an active outbreak) where contemporaneous record integrity is
  critical to subsequent epidemiological investigation.

## When NOT to use this kit

Do NOT use this kit if:

- **The inspection is not yet closed.** The kit refuses mid-inspection
  partial sealing. Wait for the closing meeting.
- **The signing investigator does not endorse the content.** A
  coerced seal is a permanent public record of coercion. If the
  observations as drafted do not reflect your findings, REFUSE
  to seal and (separately) publish a refusal-record.
- **The Form 483 contains PII or whistleblower-identifying content.**
  De-identify before sealing. The kit's refusal-rules R1 and R2
  apply and the underlying public-health interest in protecting
  patient privacy and whistleblower confidentiality is
  load-bearing.
- **You are sealing under pressure to publicly embarrass the firm
  rather than to memorialize a regulatory finding.** A sealed Form
  483 is a regulatory record, not a press release. Use of the
  primitive for non-regulatory purposes degrades its trust in
  regulatory use.

## How to fork this kit for a real Form 483 issuance

```bash
cp -r ~/Genesis/myriam-kit/examples/fda-inspection-finding-seal ~/INS-99-9999999
cd ~/INS-99-9999999
$EDITOR facts/*.txt        # replace fictional content with real Form 483
bash build/seal.sh         # SEAL AT closing meeting, after Form 483 issued
python3 build/verify.py    # confirm
```

**CRITICAL TIMING**: seal AT the closing meeting, AFTER the Form 483
is formally issued to the most-responsible person — not before. A seal
before closing-meeting issuance is refused by the kit (FACT 07 R4)
because the observations are not yet finalized. A seal long after
issuance is conventional non-repudiation but loses the strongest
anti-revision property.

## Integration with existing FDA inspection infrastructure

- **Form 483 itself.** The Form 483 is the legal instrument. The
  seal publishes the verbatim text + a SHA-256 alongside it. The
  seal does not modify, replace, or substitute for the Form 483.
- **Establishment Inspection Report (EIR).** The EIR is drafted
  after closing and published per FOIA. The sealed FACT 03 + FACT 05
  serve as a comparand: any later EIR that diverges from the sealed
  closing-meeting observations or classification is detectable.
- **District Office review.** The District Office's evaluation
  (Warning Letter recommendation, no-action, follow-up inspection)
  is downstream and unaffected by the seal. The investigator's
  declared commitments in FACT 05 (to memo any reclassification)
  give the investigator a forensic mechanism that operates inside
  the District Office process.
- **Center compliance evaluation (CDER / CBER / CDRH / CFSAN).**
  Center compliance officers make the final classification call.
  The seal does not bind them; it just makes silent disagreement
  with the investigator's preliminary classification visible.
- **Warning Letter / Consent Decree / AIP.** Subsequent regulatory
  actions are downstream. Observations cited in a Warning Letter
  can be compared to FACT 03; observations in FACT 03 that do not
  appear in a Warning Letter remain on the public record and
  remain available to citizen-petitioners, plaintiffs, and
  subsequent inspectors.
- **FACTS (FDA's inspection database).** The seal coexists with
  the FACTS internal record. The FACTS inspection number is
  carried in FACT 02 so the seal can be cross-referenced from
  FACTS-derived FOIA productions.
- **FOIA productions.** A sealed Form 483 is itself a candidate
  for routine FOIA disclosure (Form 483s are generally releasable
  after redaction). The seal publication URL or IPFS CID can be
  attached to the FOIA response so the requester gets both the
  redacted document and the cryptographic anchor.

## What this kit does NOT replace

- The Form 483 itself, as the legal record of inspectional
  observations under 21 USC 374
- The Establishment Inspection Report (EIR) under FDA Investigations
  Operations Manual procedures
- District Office review and Center compliance evaluation
- Warning Letter or other regulatory action by the Agency
- The firm's response under 21 CFR 10.30
- FOIA requests under 5 USC 552 for the underlying inspection records
- Whistleblower protection under 21 USC and OSC regulations

## Adoption-value sketch (non-quantitative)

The FDA conducts on the order of ~17,000 inspections per year across
drug, device, biologic, and food regulated industries. The vast
majority are routine and uncontested. A small fraction are contested,
sometimes vigorously. If even 1% of contested inspections involve
silent post-inspection revision — softening of observation language,
silent classification downgrade, quiet deletion of citations — then
sealed closing-meeting Form 483s would expose the pattern. Lives
saved is incalculable but plausibly large in the limit if it surfaces
even one Vioxx-scale or Heparin-scale scandal earlier than it
otherwise would have been surfaced. The relevant unit isn't average
benefit per seal; it's tail-event detection across decades.

The kit is small-cost-per-use: a few minutes per closing meeting,
no change to the underlying Form 483, no additional regulatory
authority required, fully compatible with existing FDA process. The
asymmetry favors adoption.

## License

Public domain (CC0). Fork it. No attribution required.
