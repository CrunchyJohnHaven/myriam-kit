# Insurance Claim Attestation Kit

A turnkey myriam-kit example for licensed U.S. insurance adjusters
(auto, health, property & casualty, life, and specialty lines) who
want to publish a Bitcoin-anchored, tamper-evident seal of *what
evidence was on file*, *what the policy was read to mean*, and *what
was approved or denied*, at the moment of a coverage decision, so
post-facto revision of the record by either side becomes
cryptographically detectable.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of WHICH EVIDENCE was in the
claim file at the moment of decision, WHAT the carrier read the
policy to mean, and WHAT was approved or denied for HOW MUCH and on
WHAT REASON CODES. It cannot answer any other question about the
claim. The following are **outside the seal's domain**:

1. **The seal does NOT prove the claim was legitimate.** If a
   claimant doctored evidence *before* submission, the seal anchors
   the doctored evidence with the same integrity it would anchor
   genuine evidence. The seal's value begins at the moment the
   evidence enters the claim file; pre-submission fraud is invisible
   to it. The seal makes one specific thing harder — post-submission
   alteration on either side — not all forms of insurance fraud.

2. **The seal does NOT compel coverage that wasn't in the original
   policy.** The seal records the carrier's contemporaneous reading
   of the contract; it does not bind any court to that reading and it
   does not expand coverage beyond what the contract actually
   provides. A sealed approval of payment under a policy that did not
   in fact cover the loss is the carrier's voluntary decision to pay,
   not an enlargement of the contract.

3. **The seal does NOT defend against an adjuster who is themselves
   captured or biased.** A coerced or captured adjuster who seals a
   false decision produces a cryptographically valid seal of a false
   decision. The seal is honest about this: it is a non-repudiation
   primitive for the adjuster's contemporaneous decision, not a proof
   the decision is correct. This is the "coercion-amplification"
   failure mode common to all attestation primitives — a bad-faith
   actor with signing authority produces durable bad-faith records.
   The companion-disclosure structure in FACT 06 (incentive structure,
   prior claims, supervisor review, DOI complaint history) is designed
   to make captured-adjuster patterns more visible, but it does not
   eliminate the failure mode.

4. **The seal does NOT make the carrier solvent for the obligation.**
   A sealed approval by an insolvent carrier remains an unfunded
   promise. Carrier solvency is a state-DOI prudential matter and a
   state-guaranty-association backstop matter; the seal anchors the
   decision but not the carrier's ability to pay it.

5. **The seal does NOT replace the state DOI complaint process, the
   policy's appeal procedure, or bad-faith litigation.** Insureds and
   third-party claimants retain every right they had before the seal
   was generated. The seal is additive evidence in any later dispute,
   not a substitute for the dispute-resolution mechanisms the law
   already provides.

6. **The seal does NOT establish that the policy was in force at the
   date of loss.** Coverage in force is a premium-and-cancellation
   analysis, and a separate review track from the coverage-
   interpretation track recorded in FACT 04. A real claim attestation
   should be paired with the carrier's in-force-status determination,
   sealed separately or referenced by hash.

7. **The seal does NOT re-identify any private party.** Claimant SSN,
   DOB beyond what's needed to verify policy identity, full address,
   medical diagnoses, treatment specifics, and non-public witness
   names are all refused by the kit. See refusal-rules R1, R2, R3 in
   FACT 07.

**The honest-limits section above is the load-bearing part of this
kit.** Carriers who believe sealing equals correctness will use it as
a shield against legitimate post-payment scrutiny. Adjusters under
pressure to deny will be tempted to seal pre-investigation rejections
as if they were final decisions (refused by R4 / R8). Claimants who
believe sealing entitles them to payment they aren't owed under the
contract will be disappointed. The kit must say plainly: *this is a
non-repudiation primitive for the moment of the carrier's coverage
decision, not a proof the decision is correct, the claim is
legitimate, or the carrier can fund the obligation.*

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following patterns even if a
licensed adjuster of record with valid signing authority submits them
(full text in FACT 07):

- **Claimant SSN, full DOB, full home address, or phone number.** The
  carrier's claim file binds these; the public seal does not need
  them and must not carry them. The public seal is not a re-
  identification index.
- **Diagnosis narratives, treatment specifics, or procedure codes
  that could identify rare or stigmatizing conditions.** Even by
  hash. The public seal carries CPT/HCPCS billing-code summaries and
  billed amounts only; ICD-10 diagnoses, mental-health detail, HIV
  status, substance-use treatment, reproductive-health detail, and
  rare-disease indicators are NEVER in the public seal, even by hash.
- **Witness legal names**, unless the witness is already public
  record (responding officer, public-agency representative). Witnesses
  are referred to by handle (W-1, W-2, ...) and bound to legal
  identities in the carrier's claim file under normal discovery.
- **Sealing a partial-investigation decision presented as final.** A
  "decision" that is actually an interim payment, a coverage
  reservation, or a pre-investigation rejection presented as final is
  refused. The disposition status and decision date must accurately
  label whether this is the final decision.
- **Sealing by anyone other than the licensed adjuster of record.**
  Only the licensed adjuster of record (or the appropriately licensed
  signing principal of a delegated TPA / MGA) may sign the seal under
  the carrier's name. Insureds and claimants may use the same kit to
  seal their own independent analysis (a feature, not a bug), but not
  to seal the carrier's decision under the carrier's name.
- **Claims of legal finality or preclusion.** The kit will not seal a
  fact body that claims the decision is "binding," "final and non-
  appealable," "preclusive," or any similar legal conclusion. Legal
  finality is a court function.
- **Retroactive coverage-interpretation changes in a purported
  "amendment" seal.** Revisions to the coverage interpretation or
  payment amounts MUST be sealed as a NEW publication referencing
  this seal by Merkle root, never as a modified re-seal under the
  same identifiers.
- **Denial seals whose reason code amounts to "investigation
  incomplete but denying for procedural reasons."** A denial seal
  must rest on substantive reason codes tied to specific policy
  provisions (FACT 04) and specific evidence (FACT 03).
- **Non-disclosure clauses operating against the claimant inside the
  seal body.** Coverage decisions made under threat of post-
  settlement claimant non-disclosure are an established bad-faith
  pattern; the kit refuses to be the vehicle. (Carriers may include
  NDA terms in a separate settlement agreement; just not inside the
  public seal.)
- **Sealing while bad-faith litigation against the carrier is pending
  on this claim, without express court concurrence.** A contested-
  record seal on the carrier's terms is a court function.

A refusal itself may be sealed as a fact ("Party X requested sealing
of pattern Y; the kit refused per refusal-rule Z"), creating a public
record of attempted misuse.

---

## What this kit DOES seal

8 facts at the moment of the coverage decision:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Claim identification** — claim number, carrier, NAIC code,
   policy form filing, policy effective dates, insured/claimant
   handles, date of loss, date claim reported, reporting channel,
   loss location (redacted to municipality / state), coverage at
   issue, date of decision.
3. **Evidence manifest** — per evidence item: SHA-256 hash, file
   size, source, submission date. Includes FNOL recording, insured
   statement, vehicle photos, police report, independent appraisal,
   repair estimate, third-party demand and bill summary (CPT/HCPCS
   only — see R2), witness statements (by handle — see R3),
   carrier-side scene photos, coverage analysis memo.
4. **Coverage interpretation** — policy form and endorsements
   governing the claim, the carrier's contemporaneous reading of the
   provisions at issue, exclusions reviewed and found not to apply,
   and the governing-law disclosure (carrier reading is the carrier's
   reading; final interpretation rests with a court).
5. **Payment decision** — overall disposition, per-item payment
   breakdown with substantive reason codes tied to FACT 04
   provisions, total carrier outlay, any reservations, and post-
   decision obligations.
6. **Companion disclosures** — pending coverage litigation on the
   same policy form, prior claims by the same insured, adjuster
   recusals and conflict-of-interest, supervisory override / review
   history, state DOI complaint history, reinsurer notifications,
   known vendor / valuation-software issues, applicable statutory
   regimes.
7. **Refusal record** — patterns the kit refused to seal (or, where
   no refusals were triggered, an explicit "none at decision time"
   attestation per refusal-rule discipline).
8. **Signing principal** — carrier identity + NAIC code + the
   licensed adjuster of record's legal name and state-DOI license
   number + supervisor co-signer + full escalation chain.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section above).

---

## What this kit defends against

- **Silent post-payment denial reversal.** Carriers occasionally
  reverse payment decisions after the fact, asserting clerical error
  or re-investigation. The sealed FACT 05 anchors the decision; a
  post-decision reversal is publicly detectable as a new action
  inconsistent with the seal, not an "always-was" rewrite.
- **Retroactive coverage reinterpretation.** A later carrier claim
  that "the policy always excluded loss type X" is publicly refutable
  against the FACT 04 contemporaneous reading.
- **Post-facto evidence-tampering accusations against honest
  claimants.** An honest claimant whose submitted evidence is later
  alleged to have been doctored can re-hash the evidence they
  submitted and demonstrate it matches the FACT 03 manifest sealed at
  decision time. The seal puts the burden of proof on the accuser to
  identify a hash mismatch.
- **Post-facto reduction of the approved amount.** A carrier that
  later attempts to pay less than the approved amount in FACT 05
  faces a publicly anchored record of what was approved.
- **"Claim was never received" / "we have no record" gaslighting.**
  The sealed FNOL recording hash, claim number, and decision date
  prove the claim was on file and decided as of the seal date.
- **Selective omission of evidence.** FACT 03's enumeration of all
  evidence in the file at decision time means a later "we never had
  that police report" claim is publicly refutable. Conversely, an
  insured's later "I submitted X and you ignored it" is refutable if
  X is not in the manifest (and the insured can independently seal
  what they submitted, creating a counter-seal that the carrier's
  seal would have to address).
- **Substitution of a different adjuster's name on the decision.**
  FACT 08 anchors the licensed adjuster of record and the full
  escalation chain; a later "rogue adjuster acted alone" defense is
  testable against this record.
- **Coverage-interpretation drift between similar claims.** Sealed
  coverage interpretations across the carrier's similar-fact-pattern
  claims become publicly diffable; selective interpretation favoring
  the carrier in some cases and the insured in others is publicly
  detectable.

The kit does **not** defend against contemporaneous bad faith — a
captured adjuster who seals a false decision under pressure produces
a cryptographically valid seal of a false decision. The primitive is
honest about that: it is a non-repudiation primitive for the
adjuster's contemporaneous claim, not a proof the claim is correct.
The companion-disclosure structure in FACT 06 is designed to surface
captured-adjuster patterns (incentive structure, prior claims history,
DOI complaint history, supervisor review) but cannot eliminate the
failure mode.

---

## Historical context

The kit would have produced a useful anchor — *not a resolution* —
in past episodes where insurance-claim record integrity became a
disputed issue:

- **Hurricane Katrina (2005) and the "make me money" memo
  controversy.** A major P&C carrier was alleged to have used
  consulting-firm guidance that prioritized claim-cost reduction over
  contract reading; multiple bad-faith actions and a $2.5M punitive
  judgment followed. Sealed coverage interpretations (FACT 04) and
  sealed adjuster incentive disclosures (FACT 06 C3) at the moment of
  each Katrina-era decision would have made the alleged pattern of
  systematic under-payment publicly diffable across claims, rather
  than reconstructible only through years of litigation discovery.

- **9/11 World Trade Center first-responder health claims.** Post-
  9/11 health and workers' compensation claims involving WTC-exposed
  first responders saw a documented pattern of post-facto coverage
  narrowing as the long-term health-effect picture evolved. Sealed
  coverage interpretations at the moment of each initial decision
  would have made later interpretive narrowing publicly detectable
  and would have given the Zadroga Act-era policymakers a cleaner
  forensic baseline.

- **Asbestos litigation (decades-long).** Disputes about *what was on
  the record when* — which policies were in force, which
  endorsements applied, which exclusions were asserted at which time
  — have driven asbestos coverage litigation for forty-plus years.
  Sealed per-claim attestations would not have prevented the
  underlying disputes about coverage and exposure, but would have
  removed one entire axis of dispute (which records said what at
  which time) from each individual claim file.

- **Health-insurance prior-authorization reversals.** A documented
  pattern across multiple carriers in which a prior authorization for
  a procedure is issued, the procedure is performed, and the claim is
  then denied on grounds that contradict the prior-auth language.
  Sealing the prior authorization as a coverage-interpretation
  decision under this kit would make the contradiction publicly
  detectable.

- **Disability-insurance claim file alteration cases.** Multiple
  reported cases of long-term disability carriers altering claim
  files after the initial favorable determination to support a later
  termination decision. The FACT 03 evidence manifest plus FACT 04
  coverage interpretation, sealed at the original favorable
  determination, would have made the post-determination file
  alteration publicly detectable.

The kit would NOT have resolved the underlying disputes about
coverage scope or claimant entitlement in any of these episodes. It
would have resolved one specific evidentiary sub-dispute: whether the
record at the moment of decision was what one side or the other
later claimed it was.

---

## When to use this kit

- You are a licensed adjuster of record (or a TPA / MGA with
  appropriately delegated signing authority) and your carrier permits
  voluntary public attestation of claim decisions.
- The claim involves stakes high enough that subsequent litigation or
  state-DOI examination is plausible (high-dollar P&C, third-party BI
  with policy-limits implications, disability with long tail, health
  with prior-auth complexity, life with contestability questions).
- You can publish the listed fact set without exposing claimant PII,
  PHI, or vulnerable-person re-identifying data. (The kit's refusal
  rules enforce this; if your facts would require a refusal-rule
  break, do not use the kit.)
- Carrier general counsel has reviewed the publication plan. Public
  publication of a claim-bearing artifact has implications for
  ongoing claims handling, reinsurance reporting, and state-DOI
  filings; counsel review is not optional.
- The carrier's claims-management system can produce stable
  byte-level snapshots of evidence files (so re-hashing later will
  reproduce the FACT 03 hashes).

## When NOT to use this kit

- **Do not use as a substitute for state-DOI compliance, NAIC model
  unfair-claims-practices compliance, ERISA claims-procedure
  compliance, or the carrier's regular claim-file documentation.**
  This kit is *additive*, not replacement.
- **Do not use if the claim involves PHI that cannot be reduced to
  CPT/HCPCS billing-code summaries without revealing diagnosis.** If
  the claim category inherently exposes diagnosis through billing
  (some rare-disease and specialty-pharmacy claims), the seal cannot
  be issued without breaking R2; do not use the kit on those claims.
- **Do not use to seal a denial driven by aggregate cost pressure
  rather than substantive coverage analysis.** Refusal-rule R8 is
  designed to catch this; if your reason codes cannot be tied to
  specific policy provisions and specific evidence, do not seal.
- **Do not use under pressure to seal before the investigation is
  complete.** A partial-investigation seal misrepresents the state.
  Refusal-rules R4 and R8 are designed to catch this.
- **Do not use as legitimacy theater.** A seal of a bad-faith decision
  is a permanent public record of the bad-faith decision, not a
  defense against it. The primitive cuts both ways; that is its
  honesty.
- **Do not use in claims where the carrier is already in bad-faith
  litigation regarding this claim, without express court
  concurrence** (refusal-rule R10).
- **Do not use to publish non-disclosure or non-disparagement
  obligations against the claimant** (refusal-rule R9).

## How to fork this kit for a real claim

```bash
cp -r ~/Genesis/myriam-kit/examples/insurance-claim-attestation ~/claim-CLM-XXXX
cd ~/claim-CLM-XXXX
$EDITOR facts/*.txt       # replace fictional content with real claim
                          # apply refusal rules R1-R10 throughout
bash build/seal.sh        # seal AT the moment of coverage decision
python3 build/verify.py   # confirm
```

**Critical timing:** seal AT the moment of the coverage decision —
same business day or next business day at the latest. A seal much
later creates a gap during which either side could have altered the
record. The right window is immediately after the decision is
rendered and reviewed by the supervisor and BEFORE the claimant
receives the decision letter — so the decision letter contains a
reference to the seal's Merkle root, locking the carrier's stated
reasoning to the seal.

**Critical review:** before sealing, run the publication through
carrier general counsel and (where applicable) the carrier's
reinsurance reporting team. Once sealed, the publication is
permanent.

## Integration with existing claims infrastructure

- **Carrier claims-management system (CMS):** the CMS remains the
  carrier's primary system of record. The seal does not replace the
  CMS; it commits to the evidence and reasoning the CMS records, so
  post-decision CMS edits are publicly detectable.
- **EDI / ACORD transaction record:** the FACT 05 decision aligns
  with the ACORD claim-status transaction; the seal's Merkle root
  can be carried as a free-form reference in the EDI payload, so
  downstream consumers (reinsurers, regulators, the insured's
  counsel) can verify the seal independently.
- **State Department of Insurance complaint process:** a complainant
  can reference the seal's Merkle root in a DOI complaint, allowing
  the DOI examiner to independently verify what was on file and what
  the carrier's reasoning was at decision time.
- **NAIC market-conduct examinations:** sealed decisions across a
  book of business produce a publicly auditable record of claims-
  handling patterns; a market-conduct examiner can run a sealed-
  decision diff across similar-fact-pattern claims for free.
- **Reinsurance reporting:** the seal's Merkle root in the cession
  report locks the carrier's claim-file reasoning at the moment of
  cession; the reinsurer can verify independently and post-cession
  carrier file alteration is detectable.
- **Bad-faith litigation discovery:** the seal pre-commits the
  carrier to the file state at decision time, removing one axis of
  discovery dispute (what was in the file when) and focusing
  discovery on the substantive bad-faith question (was the decision
  itself reasonable on the file state that existed).
- **Insured counter-seals:** an insured (or claimant counsel) can use
  the SAME kit to publish a hash of the evidence the insured
  believes they submitted; if the carrier's FACT 03 manifest omits
  the insured's hash, that omission is publicly detectable. This is
  the kit's primary value-add for the insured side and is
  permissionless — the carrier need not cooperate.

## What this kit does NOT replace

- State insurance code claims-handling requirements.
- The state's Unfair Claims Settlement Practices Act and the NAIC
  model regulations.
- ERISA § 1133 and 29 C.F.R. § 2560.503-1 claims procedures (for
  ERISA-governed health and disability claims).
- The McCarran-Ferguson Act's state-regulation framework.
- The carrier's claims SOPs, claim file documentation, or CMS.
- State DOI complaint processes.
- Policyholder appeal procedures specified in the policy.
- Bad-faith common-law remedies in the policyholder's jurisdiction.
- Subrogation, salvage, and recovery processes.
- Reinsurance reporting and audit processes.
- Court adjudication of contested coverage.

## Adoption value

U.S. insurance fraud across auto, health, P&C, life, and specialty
lines is estimated at approximately $300B / year in losses. Add
approximately $50B / year in disputed legitimate claims (bad-faith
litigation costs, prompt-pay statute penalties, settlement of
disputed-coverage cases) and the addressable surface is roughly
$350B / year. Even a 1% reduction — through deterrence of post-facto
record alteration on either side — would be $3.5B / year in saved
losses and saved dispute costs.

At a conservative $5,000 / life-saved equivalence (the WHO range for
cost-effective health interventions in low- and middle-income
contexts), $3.5B / year corresponds to a lives-equivalent figure on
the order of 700,000 lives per year. This figure is offered as an
order-of-magnitude framing of the social value of reducing the
disputed-claims surface, not as a direct mortality claim about U.S.
insurance fraud per se.

The seal is a primitive. Adoption is voluntary. The value compounds
across a book of business once the carrier's claim-file integrity
becomes publicly auditable.

## License

Public domain (CC0). Fork it. No attribution required.
