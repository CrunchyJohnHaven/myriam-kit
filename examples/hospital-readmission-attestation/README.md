# Hospital Readmission Attestation Kit

A turnkey myriam-kit example for hospitals, hospital networks, Chief
Medical Officers, Quality directors, state hospital associations, and
public-health researchers who want to publish a Bitcoin-anchored,
tamper-evident monthly seal of *what the hospital's 30-day readmission
rates actually were* and *how they were measured* — so that silent
post-facto revision of the readmission record, observation-status
gaming, transfer gaming, or methodology drift between reporting periods
is publicly detectable across months.

The seal is designed to be **diffable against next month's seal**.
That property is the whole point. A single attestation in isolation is
useful; the public record of a hospital sealing the same condition
month after month under the same methodology is the load-bearing
artifact.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of WHICH index admissions were
counted in WHICH DRG / condition cohort, WHICH 30-day readmissions
were observed, WHICH observation-status discharges and WHICH transfers
were recorded, under WHICH CMS specification version and WHICH
exclusion criteria, signed by the certifying Chief Medical Officer
and Quality officer of the hospital. It cannot answer any question
about quality of care beyond that. The following are **outside the
seal's domain**:

1. **Proving the readmissions were unavoidable.** A 30-day
   readmission can be caused by inadequate discharge planning, by
   unavoidable disease progression, by patient non-adherence, by
   social determinants outside the hospital's control, by a new
   independent illness, or by post-discharge errors at a downstream
   facility. The seal records the *count*; it does not adjudicate
   the *cause*. A hospital with a high sealed readmission rate is
   not thereby proven negligent. A hospital with a low sealed
   readmission rate is not thereby proven excellent.

2. **Making the hospital better.** Sealing a number is not a
   quality-improvement intervention. The seal is a tamper-evidence
   layer on what the hospital already reports; it does not change
   discharge planning, care coordination, post-acute follow-up,
   or any other operational input to the readmission rate. A
   hospital that seals a bad rate has a publicly auditable bad
   rate; the badness is unchanged until the underlying care
   process changes. The seal makes claims about the rate
   auditable; it does not make the rate good.

3. **Defending against pre-admission patient-selection bias.** A
   hospital that quietly steers high-risk patients away from
   admission (to observation status, to transfer to another
   facility, to discharge from the ED without admission) at the
   front end will appear in the sealed denominators with a
   healthier-looking case mix. The seal anchors what the hospital
   counted as an index admission for the cohort; it cannot detect
   patients who never became index admissions because they were
   diverted. Front-end selection bias is upstream of the seal.

4. **Defending against discharging to home-with-services in ways
   that mask continued care.** A patient discharged to a home-
   health agency owned by the same health system, with intensive
   ongoing care that would functionally be inpatient care
   elsewhere, does not count as a readmission if they are not
   re-admitted. The seal records re-admissions; it does not record
   the intensity of continued care delivered under a discharge
   label. The "discharged in name only" failure mode is downstream
   of the discharge code and not anchored by the seal.

5. **Detecting mortality that displaces readmission.** A patient
   who dies at home within 30 days of discharge does not count as
   a readmission. If a hospital with a high mortality-shift rate
   produces a low readmission rate, the readmission rate looks
   good while the underlying outcome is worse. The seal records
   readmissions; mortality follow-up is a separate measure with a
   separate (and necessary) seal. Sealing readmission rates
   without companion mortality data can mislead. The kit refuses
   this configuration (see refusal rule R4 below).

6. **Substituting for CMS Hospital Compare, HRRP risk-adjusted
   measures, or any statutory quality-reporting program.** The
   hospital's CMS submissions under the Hospital Readmissions
   Reduction Program (HRRP), the Hospital Inpatient Quality
   Reporting Program (HIQR), MIPS, and any state reporting
   requirement are maintained per statute and produced on
   regulator demand. The seal adds a public tamper-evident layer
   ON TOP of those submissions; it does NOT replace them. A
   sealed publication is not a CMS submission.

7. **Proving the hospital is "better" or "worse" than another
   hospital.** Cross-hospital comparison of raw readmission rates
   without case-mix adjustment is methodologically unsound and
   is exactly why HRRP uses risk-adjusted measures. The seal
   publishes raw rates per condition AND the CMS-specification-
   version risk-adjusted rates AND the denominators, so a
   researcher can re-derive the case-mix-adjusted comparison
   themselves. The seal itself does not rank hospitals.

8. **Catching contemporaneous coding fraud.** A hospital coding
   team that misclassifies a readmission as a new admission at
   the moment of admission produces a sealed rate that is
   internally consistent with the (fraudulent) coding. The seal
   makes later silent modification detectable, but does not
   detect contemporaneous mis-coding. Detection of contemporaneous
   coding fraud requires CMS Recovery Audit Contractor (RAC)
   audits, Office of Inspector General (OIG) review, internal
   coding audits, and whistleblower disclosures — all of which
   are upstream of the seal.

**The honest-limits section above is the load-bearing part of this
kit.** Hospital administrators who treat "we sealed our readmission
rate" as equivalent to "we proved we provide good care" misuse the
primitive. The kit must say plainly: *this is a non-repudiation
primitive for the hospital's contemporaneous claims about the
readmission record, not a quality measure, not a substitute for
CMS oversight, and not a defense against the front-end-selection,
mortality-displacement, or care-shifting failure modes that make
readmission rates by themselves a partial picture of hospital
quality.*

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if
a user with valid hospital signing authority submits them:

- **Per-patient outcomes.** No fact may name a patient, link a
  readmission to a patient, expose a medical record number, expose
  a date-of-birth + admission-date combination that could be re-
  identifying in a small cell, or include any HIPAA-protected
  identifier. Aggregate counts at the condition level are the
  unit of analysis; per-patient anything is refused. (R1)

- **Per-physician outcomes.** No fact may attribute readmission
  counts to a named attending physician, named hospitalist, named
  surgeon, or named discharging clinician. This is non-negotiable
  for two reasons: (a) per-physician readmission rates are
  statistically noisy at the volumes most physicians see in a
  month and are widely misused; (b) more importantly, public
  per-physician scoring creates direct retaliation vectors against
  clinicians who advocate for sicker, higher-risk, less
  insurance-favorable patients, against clinicians who report
  safety problems, and against clinicians who decline to game the
  measure. The seal must not become a tool for chilling clinician
  advocacy. Per-physician quality measurement, where appropriate,
  belongs in internal peer review and credentialing committees
  with their own due-process protections — not on Bitcoin. (R2)

- **Risk-adjusted-only rates without raw rates.** The kit refuses
  to seal a fact body that contains ONLY the CMS risk-adjusted
  hospital-wide readmission rate (or any other adjusted measure)
  without the corresponding raw numerator, raw denominator, and
  raw rate. Risk-adjustment is a black box from the perspective
  of an external auditor; without the raw rates, a methodology
  change between months is invisible. The seal MUST include
  raw counts so that next month's seal can be diffed against
  this month's seal at the level of raw data. (R3)

- **Aggregate hospital-wide rates without per-condition
  breakdown.** A single hospital-wide readmission rate hides the
  exact gaming vector the seal is designed to make visible — a
  hospital might silently shift case mix away from high-
  readmission DRGs and toward low-readmission DRGs while the
  hospital-wide rate looks stable or improving. Per-condition
  rates (at minimum: AMI, heart failure, pneumonia, COPD, CABG,
  THA/TKA, the HRRP cohorts) MUST appear, with per-condition
  denominators. The hospital-wide rate, if reported, is in
  addition to (not instead of) the per-condition rates. (R4)

- **Anything that wouldn't be diffable against the next month's
  seal.** The whole forensic value of this kit comes from
  month-over-month comparability. The kit refuses fact bodies
  that are structured so that next month's seal can't be diffed
  against this one — for example, a free-text "our readmission
  rate is approximately X percent" without a fixed numerator,
  denominator, methodology version, and exclusion-criteria list.
  If the next month's analyst can't compute "this number went
  from X to Y because of A and B," the fact is malformed and the
  kit refuses to seal it. (R5)

- **Mortality data without companion mortality attestation.**
  Sealing readmissions without sealing 30-day post-discharge
  mortality enables the "patients who die at home don't count as
  readmissions" gaming vector that produces a misleadingly low
  readmission rate. The kit refuses to seal a readmission
  attestation that does not either (a) include the 30-day post-
  discharge mortality count in the same publication, or (b)
  reference, by Merkle root, a companion mortality attestation
  for the same period. (R6)

- **Observation-status counts that exclude justification
  category.** The kit refuses to seal an observation-status
  count that does not break out the justification categories
  (chest pain rule-out, syncope, dehydration, etc.) and the
  duration distribution. A bare aggregate observation count
  enables the exact gaming pattern this seal is designed to make
  visible: a silent shift from inpatient admission to observation
  status for cases that would otherwise have been counted as
  index admissions. (R7)

- **Transfer counts that exclude the receiving facility category
  and the within-system flag.** A transfer to a sister hospital
  within the same health system is functionally different from a
  transfer to an independent facility. The kit refuses to seal
  transfer counts without the within-system breakdown. (R8)

- **Sealing by anyone other than the certifying Chief Medical
  Officer AND a separate Quality officer.** Two-signer minimum
  for hospital attestations, because the gaming vectors here are
  exactly the kind that single-signer institutional fraud
  conceals. A third-party quality consultant, an external
  registry, or a state hospital association may use the same
  kit to seal THEIR own independent analysis; they may NOT seal
  the hospital's primary readmission attestation under the
  hospital's name. (R9)

A refusal itself may be sealed as a fact ("This hospital requested
sealing of X; the kit refused per refusal-rule Y"), creating a
public record of attempted misuse.

---

## What this kit DOES seal

8 facts at the moment of monthly attestation:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Hospital identification** — hospital legal name, CMS
   Certification Number (CCN), facility region, certifying CMO
   role + Quality officer role + cryptographic key info.
3. **Attestation period** — calendar month covered, data-freeze
   date, attestation date, statement that no records have been
   modified after the data-freeze date for the period under
   attestation.
4. **Readmission rates** — per-DRG / per-condition 30-day all-
   cause readmission rates, raw numerator, raw denominator, raw
   rate with 95% confidence interval, AND the CMS-specification-
   version risk-adjusted rate alongside the raw rate (per
   refusal rule R3).
5. **Index admission counts** — denominators by condition, total
   inpatient discharges for the month, breakdown by primary
   payer (Medicare FFS / Medicare Advantage / Medicaid /
   commercial / self-pay / other) for case-mix transparency.
6. **Observation-status disclosure** — count of observation-
   status discharges, justification category breakdown, duration
   distribution (≤24h, 24-48h, >48h), and the inpatient-to-
   observation conversion count if any (the "two-midnight rule"
   adjacent gaming pattern).
7. **Transfer disclosure** — counts of patients transferred to
   other inpatient facilities, broken out by within-system vs.
   independent receiving facility, by reason category (level-of-
   care escalation, patient request, capacity, insurance), and
   counts of patients received as transfers (so net flow is
   computable).
8. **Methodology** — CMS specification version (HRRP measure
   year), exclusion criteria applied, planned-readmission
   exclusion handling, transfer-out attribution policy,
   observation-as-index-admission policy, statement of any
   change from the prior month's sealed methodology with a
   Merkle root reference to the prior period's seal, signing
   principal cryptographic key info.

Each fact ends with the refusal-gate convention: *"This fact
asserts only X. It does not assert Y"* (where Y is the closest
failure mode from the "DOES NOT do" section above).

---

## What this kit defends against

- **Silent retroactive revision of readmission rates.** All
  rate-bearing facts are hashed. Re-hashing post-attestation
  reveals any modification. A regulator, researcher, or
  whistleblower who has the prior month's sealed root can detect
  any silent change to the prior month's published rate when the
  hospital next reports.
- **Observation-status-as-discharge gaming becoming
  undetectable.** FACT 06 freezes the observation count, the
  justification category distribution, and the duration
  distribution at attestation. A month-over-month silent shift
  from inpatient discharge to observation status (which would
  remove what would have been the index admissions from the
  denominator) is publicly diffable across seals.
- **Methodology drift between CMS reporting periods.** FACT 08
  freezes the CMS specification version, the exclusion criteria,
  and the planned-readmission exclusion handling. Any change is
  required to be disclosed in the next month's FACT 08 with a
  reference to this month's Merkle root. A silent methodology
  change between months that produces a favorable rate movement
  is publicly detectable.
- **Transfer-out attribution gaming.** FACT 07 freezes transfer
  patterns including within-system flag and reason category. A
  silent shift toward transferring high-risk patients out before
  30 days (which would remove them from the readmission
  numerator under some specifications) is publicly detectable
  across months.
- **Case-mix gaming via payer or DRG shift.** FACT 05's per-
  condition denominator and payer breakdown freeze the case mix
  for the month. A silent shift away from high-readmission
  conditions (admitting fewer heart-failure patients while
  admitting more elective orthopedic patients, for example) is
  publicly diffable across months.
- **Conflation of raw and risk-adjusted rates.** FACT 04 requires
  both. A future "our risk-adjusted rate improved by X" claim
  is publicly checkable against the raw rate movement and the
  denominator movement together.
- **Post-hoc methodology re-narration.** FACT 08 is sealed at
  attestation. A future "we always used methodology Y" claim is
  publicly refutable against the sealed methodology of the
  period in question.

The kit does **not** defend against contemporaneous coding fraud — a
hospital that misclassifies a readmission as a new admission at the
moment of coding produces a cryptographically valid seal of a
fraudulent count. The primitive is honest about this: it is a non-
repudiation primitive for the hospital's contemporaneous claims, not
a proof those claims are correct.

---

## When to use this kit

- Your hospital has a stable case-mix-and-coding workflow and
  wants to add a Bitcoin-anchored monthly public attestation as
  a tamper-evident layer on top of the existing HRRP / HIQR
  reporting workflow.
- You are a hospital system wanting to publish system-level
  transparency across multiple facilities, sealed per-facility
  per-month, so that within-system variation is publicly
  comparable.
- You are a public-health researcher or state hospital
  association running a voluntary transparency program among
  participating hospitals, and want a common cryptographic
  primitive that all participating hospitals can use without
  trusting a central aggregator.
- You are a hospital in a jurisdiction whose statutory
  reporting infrastructure is weak or where you expect
  significant payer / patient / regulator scrutiny of your
  readmission claims, and want a globally verifiable timeline
  of those claims.
- You can publish the listed fact set without breaking refusal
  rules R1-R9. If your facts would require an R1-R9 break, do
  not use the kit; fix the data inputs first.
- Hospital counsel and compliance have reviewed the publication
  plan. Public publication of a CCN-bearing, rate-bearing
  artifact has implications under HIPAA (de-identification
  standards), HRRP (interaction with statutory reporting), and
  state regulators (interaction with state-level transparency
  laws). Counsel review is not optional.

## When NOT to use this kit

- **Do not use as a substitute for CMS HRRP / HIQR / Hospital
  Compare submissions.** The seal is *additive*, not
  replacement. Your statutory submissions, your CMS audit
  records, your internal quality program — unchanged.
- **Do not use as a quality claim.** Sealing a low readmission
  rate does not establish that the hospital provides good care;
  it establishes that the record had this byte content at this
  time. Refusal rules R1-R9 will reject patterns that conflate
  attestation with quality endorsement.
- **Do not use to publish per-patient or per-physician data.**
  Refusal rules R1-R2 exist for HIPAA, retaliation-prevention,
  and statistical-soundness reasons; do not amend the kit to
  defeat them without consulting counsel and ethics review.
- **Do not use under pressure to seal before the month's data
  freeze is final.** A partial-data seal misrepresents the
  attestation period and creates a misleading reference point.
- **Do not use without a companion mortality attestation.**
  Refusal rule R6 will reject readmission attestations that
  omit mortality. The two measures together are partial; either
  alone is misleading.
- **Do not use as legitimacy theater.** A seal of a gamed
  readmission record is a permanent public record of the
  gaming, not a defense against it. The primitive cuts both
  ways; that is its honesty.

## How to fork this kit for a real monthly attestation

```bash
cp -r ~/Genesis/myriam-kit/examples/hospital-readmission-attestation ~/readmission-2026-04
cd ~/readmission-2026-04
$EDITOR facts/*.txt        # replace fictional content with real month
                           # apply refusal rules R1-R9 throughout
bash build/seal.sh         # SEAL AT month-end + data-freeze + CMO/QO sign-off
python3 build/verify.py    # confirm
```

**CRITICAL TIMING:** seal AT the monthly data-freeze + CMO and
Quality officer sign-off moment. Do not seal mid-month. Do not
seal after the hospital's internal review meeting has had a chance
to "adjust" the numbers — the whole point is to anchor what the
data said at the freeze before any adjustments. The right window
is between the formal data freeze and the first time the rate is
quoted publicly.

**CRITICAL REVIEW:** before sealing, run the publication through
the Quality officer (separate from the CMO), through coding /
compliance, and through counsel. The two-signer rule (FACT 02 and
FACT 08) exists to prevent single-signer institutional fraud.

**MONTHLY CADENCE:** the kit's value compounds across months.
Sealing once is useful; sealing every month for a year is the
artifact. Each new month's FACT 08 references the prior month's
Merkle root so that the chain of attestations is publicly
walkable.

## Integration with existing hospital quality infrastructure

- **CMS Hospital Readmissions Reduction Program (HRRP).** The
  sealed publication URL or IPFS CID can be referenced in the
  hospital's public-disclosure materials. The seal commits the
  per-condition raw and risk-adjusted rates that the hospital
  reports to CMS; later disputes about what was reported are
  publicly refutable.
- **CMS Hospital Inpatient Quality Reporting (HIQR) Program.**
  The seal commits the underlying counts that feed HIQR
  measures; the seal does not replace the HIQR submission.
- **CMS Hospital Compare / Care Compare public-facing site.**
  The seal sits alongside Hospital Compare as an independent
  attestation; the hospital can reference its sealed monthly
  publications in patient-facing materials.
- **State hospital association reporting (e.g. PHC4 in
  Pennsylvania, OSHPD/HCAI in California, NYSDOH in New York).**
  Compatible as an additive transparency layer; the seal's per-
  condition counts can be cross-walked to state reporting
  categories where definitions align.
- **The Leapfrog Group, US News & World Report rankings,
  Healthgrades, Vizient cohort programs.** Compatible. These
  programs aggregate hospital quality data; a sealed monthly
  attestation lets them (and the public) verify that the
  hospital's claims to them match the hospital's claims
  elsewhere.
- **The Joint Commission accreditation.** Compatible. Sealed
  attestations are documentary evidence the Joint Commission
  surveyor can verify during accreditation visits.
- **Internal credentialing and peer review (per Healthcare
  Quality Improvement Act of 1986).** Out of scope for the
  seal directly. Per-physician data does not appear in the
  seal (refusal rule R2). Internal peer review remains under
  HCQIA protections.
- **CMS MIPS (Merit-based Incentive Payment System) for
  individual physicians.** Out of scope; the seal is hospital-
  level only.

## What this kit does NOT replace

- CMS HRRP submission.
- CMS HIQR submission.
- CMS Hospital Compare / Care Compare data feed.
- State-level hospital reporting (PHC4, OSHPD/HCAI, NYSDOH,
  state equivalents).
- Joint Commission accreditation.
- Internal peer review and credentialing.
- CMS Recovery Audit Contractor (RAC) audits.
- HHS Office of Inspector General (OIG) oversight.
- CMS Quality Improvement Organization (QIO) review.
- Patient safety event reporting (CMS Conditions of
  Participation, state requirements, PSO reporting).
- Companion 30-day post-discharge mortality attestation
  (which should be sealed under a separate myriam-kit
  publication for the same period — see refusal rule R6).

## Adoption value and honest estimate of impact

The Hospital Readmissions Reduction Program (HRRP) currently
imposes payment penalties on US hospitals whose risk-adjusted
30-day readmission rates exceed CMS's expected rate. Published
estimates of annual HRRP penalty totals are in the **mid-hundreds
of millions of dollars per year nationally** (the FY2023 penalty
total was reported by CMS at approximately $320 million; the
program's lifetime cumulative is in the billions). The penalty
structure creates measurable financial incentives for hospitals
to under-report readmissions through observation-status gaming,
transfer-out gaming, case-mix shift, and silent revision of
borderline cases — all of which are documented in the peer-
reviewed literature (Wadhera et al., JAMA 2018-2019; Khera et
al., JAMA 2018; Gupta et al., JAMA Cardiol 2018; Zuckerman et
al., NEJM 2016 and follow-on critiques).

**The honest impact estimate:**

A sealed monthly readmission attestation does not reduce the
incentive to game; it makes a category of gaming detectable.
If sealed attestations are adopted by hospitals representing
~20 percent of HRRP-eligible admissions over 5 years, and if
the resulting detectability deters even ~10 percent of the
gaming that would otherwise occur, the public-health value is
in better discharge planning for some fraction of patients who
would otherwise have been discharged-to-game rather than
discharged-to-actually-recover. Translating that to a count of
lives is difficult and the kit refuses to publish a single
casualty estimate that would be cited as authoritative — the
chain of inference from "gaming reduced by X" to "deaths
prevented by Y" runs through multiple poorly identified
parameters (what fraction of gamed discharges produced
preventable mortality, the counterfactual care quality, the
distribution of risk across gaming-susceptible cohorts) and
any specific number quoted as a casualty estimate would be
making up precision the data doesn't support.

**The honest framing:**

The case for adoption is not "this kit will save N lives." It
is: *if you believe the published HRRP-gaming literature
(Wadhera, Khera, Gupta, Zuckerman, and others) is roughly
correct that gaming is a measurable fraction of the apparent
HRRP improvement since 2012, then a tamper-evident monthly
attestation is the cheapest available primitive that makes
that gaming publicly diffable across months. The seal does
not stop gaming; it makes one channel of it auditable. That
auditability is what produces social pressure on hospitals
not to game. The social pressure is what produces (some
fraction of) the actual care improvement. The lives saved
are downstream of three causal steps the seal does not
itself perform. Adopt the kit on that understanding, not
on a lives-saved promise.*

The kit defaults are deliberately conservative on per-patient
data (refusal rule R1), aggressive on per-physician retaliation
prevention (refusal rule R2), and aggressive on the "this is
not a quality claim" disclaimer. Hospitals in jurisdictions
where specific public-disclosure requirements differ can amend
their fork accordingly, but the default refusals favor patient
privacy, clinician advocacy protection, and honest scope.

## Historical patterns the kit would have helped with

The kit would have produced a useful month-over-month forensic
record — *not a fix* — in the following documented patterns:

- **HRRP-era observation-status growth.** Multiple studies
  documented a substantial growth in observation-status
  discharges across US hospitals coinciding with HRRP
  implementation (Sheehy et al.; Zuckerman et al.). A
  per-hospital sealed monthly observation count with
  justification category breakdown (FACT 06) would have made
  the timing and magnitude of each hospital's contribution
  to that pattern publicly diffable, rather than visible only
  in retrospective national-aggregate research years later.
- **HRRP penalty disparities affecting safety-net hospitals.**
  Hospitals serving more disadvantaged populations face higher
  HRRP penalties under the standard risk adjustment (per
  multiple Khera et al. analyses); a sealed monthly payer
  breakdown (FACT 05) would let the public separately track
  case-mix changes from rate changes for each hospital,
  making it possible to distinguish actual rate improvement
  from case-mix shift.
- **Within-system transfer patterns at multi-facility health
  systems.** Some multi-hospital systems have been documented
  to route post-discharge needs through within-system
  facilities in ways that do not always show up as transfers
  in HRRP measures. A sealed monthly transfer count with
  within-system flag (FACT 07) would make this publicly
  trackable per facility per month.

The kit would NOT have resolved the underlying disputes about
HRRP risk adjustment methodology, about whether HRRP is on
balance helpful or harmful to patient outcomes, or about
whether the penalty structure should be changed. Those are
policy debates upstream of the seal.

## License

Public domain (CC0). Fork it. No attribution required.
