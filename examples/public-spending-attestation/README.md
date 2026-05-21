# Public Spending Attestation Seal Kit

A turnkey myriam-kit example for municipal, state, provincial, and
national governments who want to cryptographically anchor budget-
execution records (contract awards, disbursements, deliverable
acceptances) at the moment of issuance, so that silent retroactive
modification of public-spending records becomes publicly detectable.

The seal is a **forensic anchor**, not an integrity certification. It
records what the finance authority reported on the day it was reported,
in a form that cannot later be silently revised without producing a
publicly visible cryptographic discrepancy.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of what was attested. It cannot
verify whether what was attested was **lawful, fair, or honest**. The
following failure modes are **outside the seal's domain**:

1. **Upstream corruption and kickbacks.** If a procurement was rigged,
   a vendor was selected because of bribery, a sole-source justification
   was fabricated, or a contract was inflated by an agreed-upon kickback
   percentage — the seal anchors the as-recorded transaction with the
   inflated price and the favored vendor at high integrity. The seal
   observes the output of the finance system; it has no visibility
   into the corruption upstream of issuance. Brazil's *Operação Lava
   Jato* documented systematic ~3% cartel-administered kickbacks across
   thousands of Petrobras contracts that would have been sealed at
   issuance as if entirely routine.

2. **Shell-company concealment of beneficial ownership.** A contract
   awarded to "Acme Construction Ltd." is sealed with the entity name
   on the public registry. If "Acme" is in fact controlled by an
   undisclosed politically exposed person, or is one of dozens of shell
   companies controlled by a single cartel, the seal anchors the
   surface entity. Beneficial-ownership transparency is a SEPARATE
   regime (FATF Recommendation 24, EU 5AMLD/6AMLD, US Corporate
   Transparency Act) whose output requires its own sealing protocol.

3. **Accounting fraud upstream of issuance.** If the finance authority
   itself fabricates the record before it is sealed — phantom
   contracts, ghost employees on the payroll, fictitious deliverable
   acceptances — the seal anchors the fabrication. The seal cannot
   detect that the record is false at the moment it is recorded; it
   can only detect that the record has been changed AFTER sealing.

4. **Selective publication / cherry-picking.** A finance authority
   could publish a *subset* of transactions — the clean ones — and
   seal those alone. The seal anchors what is in the publication; it
   does not anchor the universe of transactions that should have been
   in the publication. This kit's FACT 07 (companion disclosures and
   refusal record) is the structural defense, but it depends on the
   issuing authority being honest about what it is choosing not to
   seal.

5. **Off-books or extrabudgetary spending.** Public expenditure routed
   through state-owned enterprises, sovereign wealth funds, special-
   purpose vehicles, or extrabudgetary trust accounts may not appear
   in the budget the seal anchors. The seal records what was reported
   inside the budgetary system; spending outside the system is outside
   the seal's domain. The Iraq Coalition Provisional Authority (CPA)
   2003–2004 disputes involved roughly USD 9 billion in cash
   disbursements whose records were partially lost; sealing what
   records existed at the moment of disbursement would have anchored
   them, but would not have created records that the CPA did not
   maintain.

6. **Post-issuance "explanation" pressure.** A sealed overrun, a
   sealed sole-source, or a sealed change order can be re-narrated
   later with whatever framing political authority desires. The seal
   anchors the FACTS at the date of issuance, but it does not
   prejudge the narrative those facts will later support.

7. **Coerced attestation.** If the responsible finance principal is
   coerced into signing an attestation that misrepresents
   transactions, the seal anchors the coerced attestation with the
   coerced signature. The seal verifies WHO signed (FACT 08), not
   WHY they signed. Sealing a coerced attestation produces a
   permanent public record of the coerced output — useful for later
   accountability, but not a defense against coercion in the moment.

8. **Comparison across jurisdictions.** A sealed expenditure is
   readable only against the legal regime of its issuing jurisdiction.
   "Why did Municipality X pay Y for service Z when Municipality W
   paid only V?" is a comparative-analysis question downstream of
   sealing. Cross-jurisdiction benchmarking is an analytical task on
   sealed data, not a property of the seal.

**The honest-limits section above is the load-bearing part of this kit.**
Finance officials and politicians who believe sealing equals integrity
will use this kit as a shield. The kit must say plainly: this is a
*non-repudiation primitive for the moment of issuance*, not a proof of
expenditure integrity.

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if a
user with valid signing authority submits them:

- **Individual government-employee names below principal-signing
  level.** No fact may name individual procurement-office staff,
  individual treasury clerks, individual scoring-panel members, or
  any natural person not in a public-facing accountability role. The
  exposure-to-retaliation risk for line staff exceeds the
  transparency benefit; their identities are sealed in internal
  controls (FACT 05 hash of sign-off log), not in the body of the
  attestation.

- **Vendor PII.** No fact may include supplier bank account numbers,
  individual supplier-employee names, supplier home addresses,
  supplier tax IDs of natural persons, internal pricing breakdowns
  that contain supplier cost structure, or any other commercial-PII
  field whose publication harms supplier interests without serving
  anti-corruption. Such information may be HASHED (FACT 05) but not
  published.

- **Security-classified expenditures.** Expenditures classified under
  national-security statutes are NOT eligible for sealing under this
  kit. Classified handling is a different problem with different
  cryptographic and legal requirements. The exclusion itself is
  disclosed in FACT 07 R3 so the reader knows the publication is
  partial by design.

- **Civil enforcement of tax obligations against identified natural
  persons.** Even though enforcement costs are public expenditures,
  naming individual taxpayers under enforcement is refused: the
  privacy harm exceeds the transparency benefit, and parallel
  transparency exists under tax-court reporting.

- **Pre-issuance transactions.** No contract before formal award; no
  disbursement before formal issuance. Sealing a draft contract or
  a pending payment as if it were executed creates false certainty.

- **Sealing by anyone other than the responsible finance principal.**
  A contractor, vendor, council member, journalist, or observer
  cannot seal "the public spending record" in lieu of the finance
  authority that issued it. (They may seal their own observations
  under their own principal, in a separate publication.)

- **"Free of corruption" framings.** The kit refuses to seal any
  framing of the form "this expenditure was lawful and free of
  corruption" or "the procurement was demonstrably fair." Such
  claims are epistemically beyond the kit's domain.

- **Publications that omit FACT 07 companion disclosures.** A
  publication of transactions without the accompanying disclosure
  and refusal record is not a legitimate MYRIAM publication under
  this kit.

A refusal itself may be sealed as a fact ("This party requested
sealing of X; the kit refused per refusal-rule Y"), creating a public
record of attempted misuse. In a domain where political pressure on
finance officials is documented, a record of *refused* requests is
itself an integrity signal.

---

## What this kit DOES seal

8 facts at the moment of budget-execution attestation:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Jurisdiction and legal basis** — which government entity is
   issuing, under what statutory authority, in which fiscal period.
3. **Appropriation or budget reference** — the specific lines in the
   adopted budget being executed, with hashes of the budget instrument
   and any amendments / transfers / reprogrammings applied.
4. **Contract or disbursement manifest** — per-transaction record:
   amount, vendor legal entity name (no individual PII), purpose,
   date, procurement type, award basis, contract document hash.
5. **Supporting document hashes** — SHA-256 of solicitations,
   evaluations, executed contracts, change orders, pay applications,
   deliverable acceptance forms, treasury ledger entries, controls
   sign-off logs. Hashes only, not contents — to protect commercial
   and personal PII while enabling re-hash verification.
6. **Audit and oversight state** — which inspector-general body has
   jurisdiction, which supreme audit institution, which prosecutorial
   body has corruption-offense jurisdiction, audit deadlines, current
   state of any ongoing review.
7. **Companion disclosures and refusal record** — pending procurement
   protests, pending internal investigations, outstanding FOI
   requests, dissenting reviews, known budget-line overruns; explicit
   list of patterns the kit refused to seal.
8. **Signing principal** — responsible finance official + role +
   statutory accountability + co-signatories under dual control;
   what each signatory is and is not personally attesting to.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section).

---

## What this kit defends against

- **Silent post-issuance revision of contract amounts.** Any change to
  any amount in FACT 04 produces a different SHA-256, different
  Merkle root, fails OTS verification.
- **Silent vendor substitution.** Replacing "Vendor A" with "Vendor B"
  on an already-issued contract is detectable from the sealed bytes.
- **Backdating of change orders.** FACT 04 freezes the change-order
  date and rationale at issuance; any later claim of "this was always
  the agreed scope" must contend with the sealed change-order record.
- **Quiet disappearance of unfavorable transactions.** All
  transactions issued in the period are in FACT 04 under one Merkle
  root. Publishing a subset is detectable from the leaf-hash list.
- **Companion-disclosure suppression.** FACT 07 freezes the pending-
  protest, pending-investigation, and outstanding-FOI state at the
  moment of attestation. Any later "we never heard about that
  protest" claim is publicly diffable.
- **Audit-jurisdiction drift.** FACT 06 freezes which bodies have
  oversight jurisdiction over the sealed transactions. A later claim
  that a particular IG "didn't have authority" must contend with
  the sealed jurisdiction record.
- **Refusal-record erasure.** FACT 07 records what the kit refused
  to seal; any later "we never refused anything" claim contradicts
  the sealed record.

---

## Historical cases the kit would have helped with

The kit would have produced a useful **forensic anchor** — *not a fix,
not a prevention, not a substitute for criminal prosecution* — in
documented public-record cases involving silent retroactive
modification of public-spending records:

- **Brazil — *Operação Lava Jato* / Petrobras lineage (2014–2021).**
  Brazilian federal prosecutors documented a cartel of major
  construction firms that for over a decade paid kickbacks averaging
  ~3% on Petrobras and other federal infrastructure contracts, with
  the kickback routed to politicians and to the cartel's own price
  coordination. The contracts as issued appeared routine; the
  corruption was upstream of issuance. A sealing kit would NOT have
  prevented Lava Jato (the kickbacks were embedded in price BEFORE
  the contract reached the seal), but would have anchored the
  contract terms at issuance — making the later forensic
  reconstruction of "what each contract actually said when it was
  signed" enormously cheaper. Lava Jato's investigative cost was in
  large part the cost of reassembling timelines from inconsistent
  archived records.

- **European Union — regional development fund disputes (multiple
  member states, 2010s–2020s).** European Court of Auditors annual
  reports have repeatedly identified material error rates in
  European Structural and Investment Fund (ESIF) and Cohesion Fund
  expenditures, in some years exceeding the materiality threshold.
  Disputes about "what was actually claimed" versus "what was
  actually delivered" recur because claim documentation can be
  revised between submission and audit. Per-issuance MYRIAM sealing
  of the claim-as-submitted would have anchored each claim's
  contents at submission, separating "what the beneficiary claimed
  at the time" from "what the post-audit reconstruction concluded."

- **Iraq — Coalition Provisional Authority (CPA) disbursements,
  2003–2004.** The CPA disbursed roughly USD 9 billion in cash
  from the Development Fund for Iraq with documentation that the
  Special Inspector General for Iraq Reconstruction (SIGIR) and
  later audit reports characterized as substantially incomplete.
  Disputes about disbursement records persist two decades later.
  Sealing at the moment of disbursement would not have created
  records that the CPA did not maintain — but where any record did
  exist (handwritten ledgers, dated transfer authorizations), a
  contemporaneous seal would have anchored that record's bytewise
  state at the moment of issuance, separating "the record at the
  time" from "the record as later reconstructed."

- **Greece — sovereign debt and public-expenditure-reporting
  revisions (2009–2010).** Eurostat audits in 2009–2010 documented
  substantial revisions to previously reported Greek fiscal data,
  with the methodology of revision itself contested. Sealing of
  quarterly expenditure reports at the moment of original
  publication would have made the *delta* between original and
  revised reports publicly diffable rather than reconstructible only
  through archive comparison. The seal would not have prevented the
  underlying methodological dispute, but would have anchored each
  reported quarter at the moment of original report.

- **United Kingdom — pandemic procurement (2020–2022).** UK National
  Audit Office and parliamentary committee reports identified
  procurement processes during 2020–2021 in which contracts were
  awarded under emergency provisions with reduced competition and
  reduced documentation; some awards were later modified, cancelled,
  or settled. Per-issuance sealing of each emergency-procurement
  award would have anchored the award rationale and terms at the
  moment of award, making later modifications a publicly visible
  delta rather than a quietly modified record.

- **South Africa — state-capture-era public-enterprise contracts
  (~2010–2018).** The Zondo Commission documented contracts at
  several state-owned enterprises (Eskom, Transnet, Denel) whose
  documentation was variously incomplete, revised, or contested.
  Sealing each contract award at issuance would have anchored the
  as-awarded state of the record, separating later forensic-
  reconstruction outputs from the contemporaneous record.

The kit would NOT have prevented the underlying corruption in any of
the above cases. In several cases the underlying problem was that the
corruption was *upstream of issuance* — the seal anchors the corrupt
contract at high integrity, which is a different kind of useful
(forensic anchor for later accountability) but not the same as
prevention. In other cases (CPA cash, off-budget spending) the
underlying problem was that the records being sealed didn't exist or
weren't maintained — the kit cannot create records that the authority
did not produce.

These historical cases are named only with reference to publicly
documented findings (court records, parliamentary committee reports,
audit-body publications). No claim is made about any individual; the
documented institutional findings stand on the public record.

---

## When to use this kit

- Your jurisdiction has an established budget-execution reporting
  process and wants to add an immutable public anchor.
- You expect post-issuance scrutiny (FOI requests, audit, civil-
  society monitoring, journalistic investigation) and want a tamper-
  evident reference point.
- You have legal authority under transparency / open-records law to
  publish the listed fact set, with the privacy/security exclusions
  honored.
- You operate under a statutory audit regime (inspector general,
  supreme audit institution) and want to anchor each quarterly close
  before the audit cycle reaches it.
- You publish under the Open Contracting Data Standard or IATI and
  want a cryptographic complement to portal-based publication.

## When NOT to use this kit

- **Do not use as a substitute for statutory audit, inspector-general
  review, prosecutorial investigation, or civil-society monitoring.**
  The kit is *additive*, not a replacement.
- **Do not use as a legitimacy certificate.** A sealed expenditure
  record is not a corruption-free certificate. Treating it as one
  is exactly the failure mode the kit's constraint-first structure
  exists to prevent.
- **Do not use mid-period.** The kit is for the moment of formal
  issuance (quarterly close, contract award, milestone disbursement).
  Mid-period seals create misleading reference points.
- **Do not use to claim the expenditure was lawful, fair, or non-
  corrupt** — the kit cannot do that.
- **Do not use to seal classified expenditures, individual employee
  PII, or supplier commercial PII.** The kit refuses these patterns;
  attempting them creates a refusal record (FACT 07).
- **Do not use to seal pre-issuance drafts.** Drafts can be sealed
  under a different attestation type ("draft for comment, not
  issued"), but not under this kit's issuance type.
- **Do not use under pressure to omit FACT 07 disclosures.** Refuse,
  and seal the refusal.
- **Do not use if your finance authority is captured.** A sealed
  fraudulent expenditure is a permanent public record of the fraud,
  not a defense of it. The primitive cuts both ways; that is its
  honesty.

---

## How to fork this kit for a real attestation

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Critical timing:** seal AT the formal issuance moment — i.e., the
moment the responsible finance principal signs the quarterly close,
the moment a contract is formally awarded, or the moment a
disbursement is formally issued. A seal before formal issuance creates
a false-positive "this is the official record" reference. A seal long
after formal issuance is forensically weaker against intervening
modifications.

**Cadence:** the kit is designed for quarterly attestations as the
default. Sub-quarterly cadences (monthly close, per-transaction
sealing) are supported by re-running with appropriate scope; the seal
of a single high-value transaction is a legitimate use.

---

## Integration with existing public-finance infrastructure

The kit is designed to compose with, not replace:

- **Open Contracting Data Standard (OCDS) v1.1.5.** The five
  publication points (planning, tender, award, contract,
  implementation) map naturally onto FACT 03 (planning →
  appropriation), FACT 04 (tender, award, contract, implementation
  → transaction manifest), and FACT 05 (supporting document hashes).
  The OCDS JSON export itself is sealed in FACT 05 (control documents).
  A jurisdiction running OCDS publication can add MYRIAM sealing as
  a cryptographic layer on top of its existing portal.

- **International Aid Transparency Initiative (IATI) standard v2.03.**
  For expenditures financed in whole or part by external aid, IATI
  XML can be sealed as a control document; the seal provides a
  cryptographic complement to the IATI Registry's HTTP-based
  publication model.

- **Open Government Partnership (OGP) commitments.** OGP National
  Action Plans frequently include fiscal-transparency commitments;
  MYRIAM sealing operationalizes a "tamper-evident publication"
  commitment in a way that is independently verifiable by civil
  society without requiring trust in the government's portal.

- **OECD Recommendation on Public Integrity (2017).** The kit
  supports Recommendation 4 (open government data on public finance
  in machine-readable, timely form) by making the data
  cryptographically anchored as well as machine-readable.

- **UN Convention against Corruption (UNCAC), particularly Articles
  9 (procurement) and 13 (participation of society).** The kit
  provides a forensic primitive that supports Article 9 transparency
  obligations and Article 13 civil-society oversight.

- **Supreme Audit Institutions (SAIs) — INTOSAI framework.** SAIs
  operating under INTOSAI standards (ISSAI) can consume sealed
  publications as evidence with high integrity; the SHA-256 hashes
  in FACT 05 are the same hashes the SAI's e-audit tools can
  re-compute.

- **Inspector-general offices.** Domestic IG offices with
  jurisdiction over the sealed expenditures (FACT 06) can subpoena
  the document bodies whose hashes are sealed in FACT 05; the seal
  binds the document bodies received under subpoena to the bodies
  that existed at issuance.

- **Freedom-of-information and open-records statutes.** The seal
  does not exempt the issuing authority from continuing FOI
  obligations; in fact, it makes selective FOI response detectable
  as a deviation from the sealed record. FACT 07 C3 anchors
  outstanding FOI requests at attestation time.

- **Beneficial-ownership registries (FATF Recommendation 24, EU
  AML directives, US Corporate Transparency Act).** Beneficial-
  ownership data is NOT sealed under this kit (FACT 04 sources
  vendor identity from registered legal-entity name only). A
  beneficial-ownership disclosure is a separate sealing regime that
  may produce a parallel publication referenced by Merkle root.

- **Court-administered transparency (judicial expenditure
  reporting, asset-recovery proceedings).** Outputs of corruption-
  related court proceedings are not within this kit's scope but can
  be sealed under parallel attestation types.

## What this kit does NOT replace

- Statutory budget-execution audit by inspector-general bodies
- Supreme-audit-institution review (GAO, NAO, TCU, CAG, AGN, BRH,
  Cour des comptes, equivalent)
- Prosecutorial investigation of corruption offenses (national
  anti-corruption prosecutors, UNCAC Article 36 bodies)
- Civil-society and journalistic investigative reporting
- Whistleblower channels and protected-disclosure regimes
- Beneficial-ownership disclosure
- International peer review (OECD, IMF Fiscal Transparency
  Evaluation, EU semester, IATI registry)
- Court-administered asset-recovery proceedings

The seal is a forensic primitive that lowers the cost and increases
the reliability of all of the above. It is not, and cannot be, a
replacement for any of them.

---

## License

Public domain (CC0). Fork it. No attribution required.
