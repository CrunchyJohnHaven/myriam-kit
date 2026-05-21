# Supply-Chain Audit Attestation Seal Kit

A turnkey myriam-kit example for third-party social/labor/environmental
auditors, in-house supplier-compliance teams, NGO supply-chain
investigators, and worker-rights organizations who want to publish a
Bitcoin-anchored, tamper-evident seal of an audit report at the exact
moment of sign-off.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of what the auditor signed off.
It cannot verify whether what was signed off is **true**. The following
failure modes are **outside the seal's domain**:

1. **Audit capture by industry.** Brand-commissioned audits have a
   long, documented history of producing soft findings on suppliers
   whose continued business with the commissioning brand keeps the
   audit pipeline flowing. A captured audit, when sealed, produces a
   permanent forensic record of the captured audit. The seal does not
   correct capture — it just makes the audit-as-issued immutable, so a
   later truth-finding process has something concrete to compare.

2. **Coached workers / prepared facilities.** Announced or semi-
   announced audits give management days or weeks to rehearse worker
   answers, hide underage workers, clean dormitories, remove non-
   compliant equipment, and divert work to non-audited subcontractors
   during the audit window. The seal anchors what the auditors were
   shown, not what they were prevented from seeing.

3. **Hidden subcontracting.** Tier-2 and Tier-3 subcontracting,
   homeworking, and informal-sector production are pervasively
   invisible to factory-floor audits. The seal anchors a Tier-1
   audit; it cannot detect that Tier-1 outsources to an unaudited
   Tier-2 during the audit window or routinely.

4. **Audits that systematically miss the abuse they target.** Rana
   Plaza, the 2013 Bangladesh garment factory collapse that killed
   1,134 workers, had been audited by multiple brand-commissioned
   audit programs in the months prior. The cracks in the building
   were not on the social-audit checklist; the audit regime had no
   structural-engineering scope. Audits anchor what's *in scope*;
   abuses outside scope remain invisible regardless of how
   tamper-evident the seal is.

5. **Post-sign-off retaliation against workers who participated in
   interviews.** Even with refused locating information (FACT 07 R3),
   a determined adversary who knows the supplier ID can identify the
   facility. Worker-protection requires more than just refusing PII
   in the seal — it requires anonymization upstream of audit
   methodology. The seal makes the audit-as-issued durable; it does
   not protect interviewees retroactively.

6. **Worker conditions that are legal but inhumane.** Living-wage
   gaps in jurisdictions where the legal minimum wage is below the
   living-wage benchmark produce "compliant" audit findings against
   wage-and-hour laws and "non-compliant" findings against living-
   wage standards in the same audit (FACT 03 element 8 in this
   example kit). The seal anchors what each standard reports;
   reconciling them is downstream policy work.

7. **Climate / environmental harms with diffuse causality.** Carbon
   emissions, deforestation contributions, water depletion, and
   pollutant releases from suppliers can be sealed in audit findings,
   but causal attribution to a specific brand's order volume is
   methodologically contested. The seal anchors what was measured at
   the supplier; it does not assign moral or legal responsibility.

8. **Disputes about which standard is authoritative.** SA8000 vs.
   BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. company-
   specific code-of-conduct: each has different scopes, severities,
   and remediation processes. The seal anchors *one* audit under
   *one* standard. Cross-standard comparison is a downstream
   problem.

9. **Auditor competence vs. auditor credential.** "Credentialed" is
   not "competent." Auditors who completed accredited training
   programs have missed severe abuses in audits that preceded
   publicly visible disasters. The seal anchors credentials; it does
   not certify the competence with which they were exercised.

**The honest-limits section above is the load-bearing part of this kit.**
A brand that wants legitimacy theater will use a sealed audit as a
shield. The kit must say plainly: this is a *non-repudiation primitive
for the audit-report sign-off moment*, not a proof of supplier
compliance or worker welfare.

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if a
user with valid audit-body authority submits them:

- **Individual worker identification.** No fact may name a worker,
  link a quote to a worker, expose badge number, line position,
  dormitory room, shift schedule, demographic combination with N<5,
  or any field that could re-identify a person who participated in
  interviews. Worker quotes use randomized tokens; the mapping is
  never sealed.
- **Whistleblower / informant sources.** If a finding rests on
  disclosure by an individual who took risk to disclose, the
  individual is never named or identified in the sealed publication.
- **Precise locating information.** No street address, GPS, satellite
  image >1km resolution, or external building photograph. The country
  and region are the maximum resolution sealed. Rationale: facility
  identification enables retaliation against interview participants.
- **Clean-audit certification claim.** The kit refuses to seal any
  framing of the form "this audit proves the supplier is compliant"
  or "no violations exist." Cleanness claims are epistemically
  unsupported by audit methodology.
- **Seal-as-certificate substitution.** A publication that omits
  methodology (FACT 04), independence (FACT 06), or refusals (FACT 07)
  is not a legitimate MYRIAM publication under this kit.
- **Draft / pre-sign-off audits.** Sealing happens at sign-off, not
  before. Provisional audits create false certainty.
- **Post-hoc favorable resealing.** A revised audit requires a NEW
  sealed publication referencing the original by Merkle root. The
  original sealed audit remains permanently visible as the
  audit-as-issued.
- **Sealing by any party other than the audit body.** A brand,
  supplier, certification body, or third party cannot seal "the
  audit" in lieu of the audit body that signed the report.

A refusal itself may be sealed as a fact ("This party requested
sealing of X; the kit refused per refusal-rule Y"), creating a public
record of attempted misuse. **In an industry with widespread audit
capture, refusal-to-seal can itself be a meaningful signal:** an audit
body that won't seal because a brand pressured softening of findings
has the option to publicly record the refusal under their own
principal.

---

## What this kit DOES seal

8 facts at the moment of audit sign-off:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Audit scope and subject** — audit standard, audit body, lead
   auditor, audit-team size, supplier identifier (no precise locating
   information), audit window, announcement type (announced /
   semi-announced / unannounced), audit report date, sign-off
   version, named recipient brands, commissioning party.
3. **Audit findings manifest** — per-element conformance /
   minor-NC / major-NC / critical-NC against the standard, each with
   a SHA-256 of the full finding write-up. Aggregate totals.
   Certification recommendation at sign-off.
4. **Methodology and evidence** — on-site time allocation, interview
   counts (with stratification: gender, migrant status, tenure),
   interview-format breakdown, interpreter relationship, document
   review with sample sizes and content hashes, site-visit artifacts
   (with worker faces blurred), known methodology limitations.
5. **Corrective actions committed** — per major-NC and per minor-NC
   CAP with stated root cause, deadline, verification mechanism,
   escalation commitments, no-silent-relaxation commitment.
6. **Auditor qualifications and independence** — audit body
   accreditation, customer concentration, lead-auditor credentials
   and language competence, sector experience, independence
   declarations (auditor-supplier, auditor-brand, certification-body
   separation).
7. **Companion disclosures and refusal record** — conflicts of
   interest (explicit), prior audit history, worker-voice channels
   communicated, parallel investigations, audit-body internal
   dissent, refusal-rule list, refusals actually invoked this audit.
8. **Signing principal** — audit body, lead auditor, audit team,
   authorizing officer, cryptographic key info.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section).

---

## What this kit defends against

- **Silent post-sign-off softening of major non-conformances.** Any
  change to FACT 03 (e.g. a MAJOR_NC reclassified to MINOR_NC, or a
  finding deleted entirely) produces a different SHA-256, different
  Merkle root, fails OTS verification.
- **Backdating of corrective-action closures.** FACT 05 freezes the
  CAP and its deadlines at sign-off; any "we closed that NC last
  month" claim that conflicts with the sealed deadlines is publicly
  diffable.
- **Methodology revisionism.** FACT 04 freezes interview counts,
  document sample sizes, and on-site hours at sign-off — preventing
  the later "we did a deep investigation" defense from being
  unfalsifiable.
- **Selective republication that omits unfavorable findings.** All
  8 facts are bound by a single Merkle root; quoting some facts
  while omitting others is detectable from the published leaf list.
- **Independence-claim drift.** FACT 06 freezes the independence
  declarations as of sign-off. A later "this audit was rigorously
  independent" claim must contend with the sealed customer-
  concentration percentage and the sealed brand-paid commissioning
  disclosure.
- **Refusal record erasure.** FACT 07 freezes which fact patterns
  the kit refused; any later "we never refused anything" claim
  contradicts the sealed record.

---

## Historical or near-historical cases the kit would have helped with

The kit would have produced a useful **forensic anchor** — *not a fix
or a prevention* — in cases involving:

- **Rana Plaza (Bangladesh, 2013).** The Rana Plaza building collapse
  killed 1,134 garment workers and injured ~2,500. Multiple brands
  whose products were made in the building had audited Tier-1
  suppliers within the building shortly before collapse. The audits
  used social-audit checklists that did not include structural-
  engineering scope. A sealed methodology fact (FACT 04) at each of
  those audits would have made the *scope gap* publicly visible at
  sign-off — anchoring the documented limitation that audit programs
  retroactively claimed not to have. The seal would not have prevented
  the collapse. It would have prevented the post-collapse industry
  claim that "no one knew" from being epistemically tenable.

- **Apple / Foxconn audits (2010s).** Multiple iterations of audit
  reports on Foxconn facilities producing for Apple were published
  with varying levels of finding severity, worker-suicide-cluster
  context, and remediation claims. A sealed sign-off-moment record
  for each audit would have prevented later disputes about "what the
  audit said at the time" from depending on archive copies, leaked
  copies, or revised official releases.

- **Cobalt from the DRC (ongoing).** Artisanal cobalt mining in the
  Democratic Republic of Congo, including by children, feeds into
  battery supply chains for major electronics and EV brands. Multiple
  brand-commissioned audits over the 2017–present period have
  produced findings of varying severity. The kit applied to each
  audit at sign-off would have anchored the audit-as-issued; the kit
  applied to companion-disclosure facts (FACT 07 C2: prior audit
  history) would have made each successive auditor's methodological
  inheritance of prior gaps publicly visible.

- **Conflict minerals (tin, tantalum, tungsten, gold from DRC and
  Great Lakes region).** Dodd-Frank §1502 produced audit-and-disclose
  obligations under SEC rule 13p-1. Disputes about the adequacy of
  smelter-level audits and downstream chain-of-custody verification
  recurred over the 2014–2022 period. Per-audit MYRIAM seals would
  have anchored each smelter audit at sign-off.

- **Brand-commissioned audits of Xinjiang cotton supply chains
  (2018–present).** Disputes about whether audits could be reliably
  conducted under PRC government restrictions on auditor access
  surfaced widely after 2020. A sealed methodology fact (FACT 04) at
  each audit would have anchored what access conditions actually
  applied — making "we conducted a rigorous audit" later claims
  diffable against sealed methodology constraints at the time.

- **Foxconn subcontracting and Apple supplier-responsibility reports
  in the 2010s — recurring discoveries of underage workers, hidden
  dormitories, hours violations.** Per-audit seals would have anchored
  the *negative findings* in audits that found nothing, alongside the
  *positive findings* in audits that found violations — preventing
  retrospective narrative cherry-picking from either direction.

The kit would NOT have prevented any of these. In several cases the
underlying problem was that the audit *missed* the abuse — sealing a
clean audit that should have found violations produces a permanent
record of a failed audit, which is a different kind of useful (it
anchors the failure for later accountability) but not the same as
prevention.

---

## When to use this kit

- You are an audit body adopting a "publish what we signed off"
  practice as a defense against post-sign-off softening pressure.
- You are an NGO running a parallel supply-chain investigation and
  want a tamper-evident reference point at the moment your
  investigation closes.
- You are a worker-rights organization that has obtained an audit
  report and wants to anchor its current contents before the
  audit body or brand has a chance to revise it.
- You are a brand committed to transparency about audits you have
  commissioned, and you want a verifiable forensic record.
- You are a journalist, regulator, or court anchoring a particular
  audit's contents at a specific moment for later litigation or
  reporting.

## When NOT to use this kit

- **Do not use as a substitute for worker-led monitoring,
  independent NGO investigations, or worker organizing.** The kit
  is *additive*, not a replacement for any of those.
- **Do not use to claim a supplier is compliant.** A clean sealed
  audit is at best one input to a compliance assessment. Treating
  a sealed audit as a compliance certificate is exactly the
  legitimacy theater the constraint-first refusal rules exist to
  prevent.
- **Do not use mid-audit.** Sealing before sign-off creates a
  false-positive "this is the final audit report" record.
- **Do not use to seal a draft you intend to revise.** Each
  sign-off version gets its own seal; revisions reference originals
  by Merkle root.
- **Do not use under pressure to seal earlier than sign-off, or to
  omit a companion-fact disclosure.** Refuse, and (if your principal
  permits) seal the refusal.
- **Do not use as the basis for a "fair trade" or "ethical sourcing"
  marketing claim without disclosing the sealed methodology limits
  alongside the seal.** Citing the seal without citing the limits is
  the legitimacy-theater failure mode that defines audit capture.
- **Do not use if your audit body is structurally captured and
  cannot publish findings against the commissioning brand's
  commercial interest.** In that case, sealing produces a permanent
  public record of the captured audit. That may still be valuable —
  but it is not the same as defending against capture.

---

## How to fork this kit for a real audit

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Critical timing:** seal AT the sign-off moment — i.e., when the lead
auditor signs the final report and it becomes the audit body's
official position. A seal before sign-off creates a false-positive
"this is the final audit" record. A seal long after sign-off is
forensically weaker against intervening modifications.

---

## Integration with existing supply-chain audit infrastructure

The kit is designed to compose with, not replace:

- **SA8000 (Social Accountability International).** SA8000 audit
  reports and CAP documents map naturally to FACT 03 + FACT 05. The
  SAAS accreditation reference fits FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** RBA's audit findings map to FACT 03; the RBA's
  audit-firm independence rules map to FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** SMETA's 2-pillar
  and 4-pillar audit findings map to FACT 03; the Sedex platform
  hosts the raw report — the MYRIAM seal anchors a content hash
  of the platform-hosted report.
- **amfori BSCI.** BSCI A–E rating mechanics map to FACT 03
  certification recommendation; brand-membership commissioning maps
  to FACT 06 customer-concentration disclosure and FACT 07 C1.
- **FSC chain-of-custody.** For forest-product supply chains, the
  chain-of-custody certificates and re-audit schedules fit the
  audit-window and CAP structure.
- **B Lab / B Corp impact assessment.** B Corp's certification is
  not a third-party audit in the SA8000 sense, but the impact
  assessment's verifier reports can be sealed under this kit (with
  facts re-scoped to impact-assessment rather than labor audit).
- **ISO 26000.** ISO 26000 is guidance, not certifiable; the kit
  has no direct ISO 26000 audit-report integration but the social-
  responsibility taxonomy can inform FACT 03 element structure for
  in-house audits.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  other industry-sector regimes).** Sector-specific audit programs
  can be sealed under this kit; the FACT 02 audit-standard field
  identifies which.
- **Fair Labor Association.** FLA factory-monitoring reports map
  to FACT 03 + FACT 05; FLA's independent-monitor framework maps
  to FACT 06 independence declarations.
- **Higg Index (Sustainable Apparel Coalition).** Facility-level
  Higg FEM (Facility Environmental Module) and Higg FSLM (Facility
  Social & Labor Module) outputs can be sealed under this kit.
- **EU CSRD / CSDDD.** The EU Corporate Sustainability Reporting
  Directive and Corporate Sustainability Due Diligence Directive
  create disclosure obligations whose verification documents can
  be sealed under this kit. The kit anchors the disclosure-as-
  issued, not its substantive adequacy.

## What this kit does NOT replace

- Worker-led monitoring (the most reliable abuse-detection signal
  in any supply chain)
- Independent NGO investigations (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium, etc.)
- Regulatory inspection (national labor bureaus, OSHA-equivalents,
  ILO Country Office programs)
- Worker organizing and collective bargaining
- Litigation, arbitration, and remediation under domestic labor law
- Brand-side due-diligence frameworks (UNGP, OECD Due Diligence
  Guidance, EU CSDDD)

## License

Public domain (CC0). Fork it. No attribution required.
