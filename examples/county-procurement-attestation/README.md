# County Procurement Attestation Seal Kit

A turnkey myriam-kit example for U.S. **county-level** procurement
officers, county CFOs, and county inspectors-general who want to
cryptographically anchor a quarterly snapshot of the county's
procurement activity — contracts awarded, change orders issued, vendor
payments made, sole-source justifications filed — at the exact moment
the quarter closes, so that silent post-facto revision of any of those
records becomes publicly detectable.

The seal is a **forensic anchor on a single county's quarterly
purchasing**, not an integrity certification of any individual contract.
It records what the procurement office reported on the day it closed
the books, in a form that cannot later be silently revised without
producing a publicly visible cryptographic discrepancy.

---

## Why a county-scoped kit (separate from the national `public-spending-attestation`)

U.S. counties spend roughly **USD 500 billion per year** on procurement
— jails, schools, roads, bridges, water systems, public health, IT,
fleet, professional services. The trust gap from documented patterns of
corruption, sole-source rigging, and post-award change-order inflation
is estimated by procurement-reform literature at **10–30% deadweight
loss**.

A national or federal `public-spending-attestation` kit is too coarse
for the county failure modes that actually dominate the U.S. trust gap:

- The change-order is the unit of corruption at the county level. A
  contract may be awarded cleanly under competitive bid and then
  silently inflated 30–60% through post-award change orders that never
  see competitive scrutiny.
- The sole-source justification is the second unit of corruption. A
  county procurement officer can declare almost anything "sole source"
  under emergency or specialty-knowledge clauses; the only check is
  whether the justification is on the record and survives later audit.
- Vendor payments aggregate to a different signal than contract awards:
  a vendor with 6 small contracts under the bid threshold and a payment
  total of USD 4.2M is a different risk pattern than a vendor with 1
  contract at USD 4.2M, and only the payment aggregate makes it visible.

A national-scoped kit anchors all of those signals at too high a level
of aggregation to be diffable against a single county's reality. A
**single-county quarterly attestation** anchors them at the level
where the trust gap actually sits: the county procurement officer,
the county CFO, and the county IG, signing once per quarter, naming
every contract above a publishable threshold, every change order, every
sole-source, and every vendor payment aggregate.

This kit is *complementary to*, not a *replacement for*, the broader
`public-spending-attestation/` kit:

- `public-spending-attestation/` is jurisdiction-agnostic (municipal,
  state, provincial, national) and emphasizes appropriation execution
  against a budget instrument.
- `county-procurement-attestation/` (this kit) is U.S.-county-specific
  and emphasizes the procurement-cycle-level signals (award method,
  change orders, sole-source disclosures, vendor payment aggregates,
  IG-record state) that are the specific failure surfaces in U.S.
  county procurement.

A county can run both, anchoring its budget-execution reporting under
the broader kit and its procurement-cycle reporting under this one,
with cross-references between the two Merkle roots.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of what was attested. It cannot
verify whether what was attested was **lawful, fair, or honest**. The
following failure modes are **outside the seal's domain**:

1. **The seal does NOT prove contracts were not corruptly awarded.**
   A contract awarded as a result of a rigged competitive bid, a
   fabricated sole-source justification, or a kickback agreement
   reached before the contract reached the procurement office is
   sealed at the inflated price and the favored vendor at high
   integrity. The seal observes the OUTPUT of the procurement
   process; it has no visibility into the corruption upstream of
   issuance. The seal only fixes the record so the corruption
   cannot be silently rewritten later.

2. **The seal does NOT capture pre-award kickbacks embedded in
   vendor price.** If a vendor's bid was pre-inflated by an agreed
   kickback percentage routed back to a county official, the kickback
   is invisible to the seal — only the inflated price reaches the
   procurement record. Detecting kickbacks is a forensic-accounting
   and prosecutorial function downstream of sealing.

3. **The seal does NOT make the procurement officer honest.** It
   only makes the procurement officer's disclosures *auditable* and
   *non-repudiable*. A dishonest procurement officer can still seal
   a dishonest record; the seal makes the dishonesty permanent and
   publicly diffable against later truth-finding, but it does not
   compel honesty in the act of attestation.

4. **The seal does NOT defend against the certifying officer
   themselves being corrupt (coercion-amplification clause).** If
   the county procurement officer, county CFO, and county IG are
   all captured by the same corruption network, a sealed
   coordinated misstatement is a cryptographically valid record of
   a coordinated lie. The seal verifies WHO signed (FACT 08), not
   WHY they signed. The defense against captured certifying
   officers is structural: the kit's dual-signature requirement
   (procurement officer + CFO) plus the independent IG seal raise
   the cost of capture, but cannot eliminate it. A sealed coordinated
   coverup, when later exposed, becomes the most damning evidence
   against the conspirators — *the primitive cuts both ways; that is
   its honesty*.

5. **The seal does NOT capture spending below the publishable
   threshold.** Contracts below USD 10,000 are aggregated, not
   itemized, because itemizing them at vendor-name level risks
   de-anonymizing individual sole proprietors (the local plumber
   who unblocked a courthouse drain) without serving any anti-
   corruption purpose. A pattern of repeated below-threshold
   awards to the same vendor — a documented bid-splitting tactic —
   is captured in the vendor-payment aggregate (FACT 06), not in
   the contract manifest (FACT 04).

6. **The seal does NOT capture procurement activity routed through
   off-county entities.** Spending routed through joint-powers
   authorities, related public-benefit corporations, special
   districts, or state pass-through grants may not appear in this
   attestation's scope. The scope is **the named county's own
   procurement during the named quarter**. Off-scope spending is
   outside the seal's domain and should be sealed under separate
   attestations by the entities that issued it.

7. **The seal does NOT make the procurement archive complete.**
   If the procurement office failed to record a contract at all
   — a verbal handshake deal, a contract paid through petty cash,
   an emergency procurement with no paper trail — the seal cannot
   anchor what was never recorded. The seal anchors records that
   exist; it does not create records that do not exist.

8. **The seal does NOT defend against post-attestation
   "explanation" pressure.** A sealed change order or sealed
   sole-source can be re-narrated after the fact with whatever
   framing political authority desires. The seal anchors the FACTS
   at the date of issuance; it does not prejudge the narrative
   those facts will later support.

**The honest-limits section above is the load-bearing part of this
kit.** County officials who believe sealing equals integrity will use
this kit as a shield. The kit must say plainly: this is a
*non-repudiation primitive for the quarterly close*, not a proof of
procurement integrity.

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if a
user with valid signing authority submits them:

- **Vendor names of contracts below USD 10,000.** Itemized vendor
  names on small-dollar awards create a de-anonymization risk for
  sole proprietors and small local vendors (the local locksmith,
  the local towing service, individual professional consultants
  paid out of petty-purchase authority) without serving any
  anti-corruption purpose. Aggregate totals by category appear in
  FACT 06; vendor names on small-dollar awards are explicitly
  refused.

- **Personal financial information of vendors.** Vendor bank
  account numbers, tax IDs of natural persons, individual vendor-
  employee names, vendor home addresses, supplier internal cost
  structures, or any commercial-PII field whose publication harms
  vendor interests without serving anti-corruption are refused.
  Such information may be HASHED (FACT 05) but not published.

- **Identities of whistleblower IG complainants.** The county IG
  receives complaints under whistleblower-protection statutes; the
  identities of complainants are NEVER sealed under this kit, even
  if the IG itself has unsealed them. FACT 06 records the IG's
  case state by case number and category only.

- **Sealing certifications by anyone not the actual procurement
  officer.** A contractor, vendor, county commissioner, citizen
  watchdog, journalist, or observer cannot seal "the county's
  procurement record" in lieu of the procurement officer who
  issued it. (They may seal their own observations under their own
  principal, in a separate publication.)

- **Sealing partial-quarter data presented as complete.** The kit
  refuses to seal a publication that frames Q-to-date data as a
  full-quarter close, or that omits transactions issued before
  the close date but recorded after. The attestation must reflect
  **all** procurement activity issued during the full quarter, as
  recorded at the moment of close.

- **"Free of corruption" framings.** The kit refuses to seal any
  framing of the form "this quarter's procurement was lawful and
  free of corruption" or "all sole-source justifications were
  demonstrably valid." Such claims are epistemically beyond the
  kit's domain.

- **Publications that omit FACT 08 refusal record.** A publication
  of procurement activity without the accompanying refusal record
  is not a legitimate MYRIAM publication under this kit. The
  refusal record is the structural defense against selective
  sealing.

A refusal itself may be sealed as a fact ("This party requested
sealing of X; the kit refused per refusal-rule Y"), creating a public
record of attempted misuse. In a domain where political pressure on
county procurement officers is documented, a record of *refused*
requests is itself an integrity signal.

---

## What this kit DOES seal

8 facts at the moment of quarterly close:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Jurisdiction** — county name, FIPS code, certifying
   procurement officer + CFO + inspector general.
3. **Attestation period** — calendar quarter, quarter-close date,
   sealing timestamp.
4. **Contracts awarded** — per-contract: vendor, amount, award
   method (RFP / competitive sealed bid / sole-source / emergency),
   notice-to-proceed date, contract document hash.
5. **Change orders** — post-award modifications with reason codes,
   cumulative-change-as-percent-of-original, approving authority.
6. **Vendor payments** — totals paid per vendor in the period
   (including pre-existing-contract payments), plus aggregate
   below-threshold spending by category.
7. **Sole-source disclosures** — explicit list of sole-source
   awards with statutory citation, justification hash, IG-notice
   timestamp.
8. **Refusal record** — list of patterns the kit refused to seal
   during the period (selective-omission attempts, vendor-name
   redaction attempts on small-dollar awards, whistleblower-
   identity sealing attempts, partial-quarter framing attempts),
   plus the signing principals.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section).

---

## What this kit defends against

- **Silent post-quarter revision of contract amounts.** Any change
  to any amount in FACT 04 produces a different SHA-256, different
  Merkle root, fails OTS verification.
- **Silent vendor substitution on a sealed award.** Replacing
  "Vendor A" with "Vendor B" on a previously sealed contract is
  detectable from the sealed bytes.
- **Backdating of change orders.** FACT 05 freezes the change-order
  date and reason code at the moment of issuance; any later claim
  of "this was always the agreed scope" must contend with the
  sealed change-order record.
- **Cumulative change-order creep.** FACT 05's per-contract
  cumulative-change-as-percent-of-original column makes it
  detectable when a contract has grown materially beyond its
  original award — a signal that has surfaced multiple historical
  procurement scandals.
- **Quiet disappearance of unfavorable contracts.** All contracts
  issued in the period are in FACT 04 under one Merkle root.
  Publishing a subset is detectable from the leaf-hash list.
- **Sole-source disclosure suppression.** FACT 07 freezes the
  sole-source awards at the moment of attestation; any later
  claim that "this contract was always competitively bid" must
  contend with the sealed sole-source list.
- **Vendor-payment-aggregate manipulation (bid splitting).** FACT 06
  aggregates per-vendor payments across all contracts (large + small).
  A vendor receiving 8 contracts each at USD 9,500 (each below the
  USD 10,000 itemization threshold) appears as a USD 76,000 payment
  aggregate, surfacing the bid-splitting pattern.
- **Refusal-record erasure.** FACT 08 records what the kit refused
  to seal; any later "we never refused anything" claim contradicts
  the sealed record.

---

## Historical cases this would have helped surface

The kit would have produced a useful **forensic anchor** — *not a
fix, not a prevention, not a substitute for criminal prosecution* —
in documented public-record cases involving silent retroactive
modification of procurement records:

- **Iraq — Coalition Provisional Authority (CPA) / SIGIR
  (2003–2007).** The Special Inspector General for Iraq
  Reconstruction issued multiple reports identifying procurement
  records whose chain of custody and post-award modifications
  were variously incomplete, contested, or modified between
  issuance and audit. A per-issuance contemporaneous county-style
  procurement seal (applied to the CPA-administered procurement
  shops, which operated structurally like county procurement
  offices) would have anchored each award and each change order
  at the moment of issuance, making later reconstruction enormously
  cheaper. The CPA case is the canonical example of why anchoring
  AT issuance matters: the records that existed could not later be
  separated, byte-for-byte, from records that were subsequently
  modified, because no contemporaneous cryptographic anchor existed.

- **United Kingdom / Italy / United States — COVID-19 PPE
  procurement (2020–2021).** Multiple national audit bodies (UK
  National Audit Office, Italian Corte dei conti, US GAO and state
  inspectors general) issued reports identifying emergency
  procurement processes during the early pandemic in which
  contracts were awarded under emergency / sole-source provisions
  with reduced competition, reduced documentation, and in many
  cases material post-award modifications. Per-issuance sealing of
  each emergency award would have anchored the as-awarded state of
  each contract, making later modifications a publicly visible
  delta. The county-scoped kit is particularly relevant because
  much PPE procurement in the U.S. occurred at the county level
  (county hospitals, county jails, county emergency-management
  offices) rather than federally.

- **Brazil — Operação Lava Jato / Petrobras lineage (2014–2021).**
  Federal prosecutors documented systematic cartel-administered
  kickbacks on infrastructure contracts at and around Petrobras.
  While the Lava Jato cases were not county-level, the structural
  pattern — pre-award kickbacks embedded in the bid price, then
  competitive-looking awards, then change-order inflation —
  is exactly the pattern this kit's FACT 04 + FACT 05 are designed
  to anchor. The kit would not have prevented Lava Jato (the
  corruption was upstream of issuance), but would have made later
  forensic reconstruction of "what each contract actually said
  when it was signed" enormously cheaper. Lava Jato's investigative
  cost was in large part the cost of reassembling timelines from
  inconsistent archived records.

- **South Africa — state-capture-era public-enterprise procurement
  (~2010–2018).** The Zondo Commission documented procurement at
  several state-owned enterprises (Eskom, Transnet, Denel) whose
  documentation was variously incomplete, revised, or contested
  between issuance and audit. While these were state-enterprise-
  scale rather than county-scale, the **change-order-creep** and
  **sole-source-justification-fabrication** patterns the Commission
  documented are precisely the patterns FACT 05 (change orders)
  and FACT 07 (sole-source disclosures) are designed to anchor at
  issuance.

- **Eskom / Transnet (South Africa, 2014–2019).** Specifically,
  the Zondo Commission documented procurement awards at Eskom and
  Transnet where the original award documents and the later-
  produced documents differed materially. Per-issuance sealing
  would have made the bytewise delta between "what was on the
  record at award" and "what was on the record at audit"
  publicly diffable rather than reconstructible only through
  document-archive forensics.

- **Flint, Michigan — water contract / emergency-manager
  procurement (2014–2016).** The Flint water-system change-of-
  source decision was implemented through emergency-procurement
  authorities operating around the county / municipality boundary,
  with subsequent disputes about what was on the procurement
  record at each decision point and what was added or modified
  later. Per-issuance sealing of each emergency procurement (the
  water-treatment contract, the corrosion-inhibitor-omission
  decision, the parts orders, the change orders) would have
  anchored the contemporaneous procurement state, making the later
  reconstruction of "what the record actually said on Date X"
  a cryptographic question rather than an archive-forensics
  question.

The kit would NOT have prevented the underlying corruption,
incompetence, or political pressure in any of the above cases. In
several cases the underlying problem was that the corruption was
*upstream of issuance* — the seal anchors the corrupt contract at
high integrity, which is a different kind of useful (forensic anchor
for later accountability) but not the same as prevention.

These historical cases are named only with reference to publicly
documented findings (court records, parliamentary committee reports,
audit-body publications, federal investigative reports). No claim is
made about any individual; the documented institutional findings
stand on the public record.

---

## Adoption value

- U.S. counties spend roughly **USD 500 billion per year** on
  procurement.
- Procurement-reform literature estimates **10–30% deadweight loss**
  from corruption + sole-source rigging + post-award change-order
  inflation = roughly **USD 50–150 billion per year** in U.S.
  county-level procurement deadweight.
- If **1% of U.S. counties adopted** quarterly sealed procurement
  attestation (~30 counties out of ~3,000), and the seal produced
  even a **5% reduction in deadweight** at those counties (by
  making the change-order-creep, sole-source-fabrication, and
  bid-splitting patterns publicly diffable in advance of audit),
  the savings would be on the order of **USD 250 million per
  year** at those counties alone.
- The intervention cost is low: the kit is open-source, the
  attestation cycle is quarterly (already the natural cadence of
  county financial close), and the operational burden is roughly
  one procurement-office hour per quarter.
- The asymmetry between intervention cost (low) and potential
  savings (high) makes this a high-leverage transparency
  primitive even at low adoption.

These numbers are order-of-magnitude estimates from published
procurement-reform literature; the kit does not claim these
specific dollar savings will be realized at any specific county.

---

## When to use this kit

- Your county has an established quarterly procurement-close
  process and wants to add an immutable public anchor.
- You expect post-quarter scrutiny (FOI requests, citizen
  watchdog review, inspector-general review, journalistic
  investigation) and want a tamper-evident reference point.
- You have authority under your state's open-records law to
  publish the listed fact set, with the privacy/security
  exclusions honored.
- You operate under a statutory IG or independent-audit regime
  and want to anchor each quarterly close before the audit cycle
  reaches it.
- You publish procurement data under your state's open-data /
  open-checkbook portal and want a cryptographic complement to
  portal-based publication.

## When NOT to use this kit

- **Do not use as a substitute for statutory audit, inspector-
  general review, prosecutorial investigation, or citizen-watchdog
  monitoring.** The kit is *additive*, not a replacement.
- **Do not use as a legitimacy certificate.** A sealed quarter
  is not a corruption-free certificate. Treating it as one is
  exactly the failure mode the kit's constraint-first structure
  exists to prevent.
- **Do not use mid-quarter.** The kit is for the formal quarterly
  close moment, signed by the procurement officer + CFO + IG.
  Mid-quarter seals create misleading reference points.
- **Do not use to claim county procurement was lawful, fair, or
  non-corrupt** — the kit cannot do that.
- **Do not use to seal personal vendor PII, whistleblower
  identities, or vendor names on sub-threshold awards.** The kit
  refuses these patterns; attempting them creates a refusal record
  (FACT 08).
- **Do not use under pressure to omit FACT 08 disclosures.**
  Refuse, and seal the refusal.
- **Do not use if your county procurement office, CFO, and IG
  are all captured by the same corruption network.** A sealed
  coordinated coverup is a permanent public record of the
  coverup, not a defense of it. The primitive cuts both ways;
  that is its honesty.

---

## How to fork this kit for a real attestation

```bash
cp -r ~/Genesis/myriam-kit/examples/county-procurement-attestation ~/my-county-Q2-2026
cd ~/my-county-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal quarterly close
python3 build/verify.py    # confirm
```

**Critical timing:** seal AT the formal quarterly close — i.e., the
moment the procurement officer signs the quarter-close memorandum,
co-signed by the CFO, with the IG independently attesting that the
IG-case-state field has not been edited under pressure. A seal
before formal close creates a false-positive "this is the official
quarter" reference. A seal long after formal close is forensically
weaker against intervening modifications.

**Cadence:** the kit is designed for quarterly attestations as the
default. Sub-quarterly cadences (per-major-award sealing, monthly
close) are supported by re-running with appropriate scope; the seal
of a single high-value award is a legitimate use under this kit.

---

## Integration with existing county procurement infrastructure

The kit is designed to compose with, not replace:

- **County procurement portals (open-checkbook / open-contracting
  systems).** Many counties publish procurement data through
  state-mandated open-data portals (California's SB-272 inventory,
  New York's Open Book NY, Texas's transparency portals,
  equivalent). The county-scoped attestation seals a Merkle root
  of the portal's quarterly state at the close moment, making
  later silent portal modifications detectable.

- **Open Contracting Data Standard (OCDS) v1.1.5.** Where the
  county already publishes in OCDS, the OCDS quarterly export
  itself is sealed in FACT 04's contract-document-hash column.

- **State auditor offices (state-level oversight of county
  finances).** California State Auditor, Texas State Auditor,
  New York Office of the State Comptroller, equivalent. Sealed
  county quarterly attestations provide the state auditor with a
  bytewise-anchored reference point for what the county said it
  did at the moment of close, separating "the as-reported record"
  from "the post-audit reconstruction."

- **County inspectors general / county auditors.** A county IG
  with subpoena authority over the procurement office can compare
  the documents received under subpoena to the FACT 04/05 hashes
  in the sealed quarterly attestation. Any post-attestation
  modification is detectable.

- **State open-records law.** Each state's open-records / public-
  records / sunshine law applies separately to each county. The
  seal does not exempt the county from continuing open-records
  obligations; in fact, the seal makes selective open-records
  response detectable as a deviation from the sealed record.

- **Federal grant compliance (Uniform Guidance, 2 CFR Part 200).**
  Counties receiving federal grants are subject to federal
  procurement standards under 2 CFR Part 200. Per-quarter sealed
  attestations of federally funded procurement provide federal
  grant managers with a bytewise reference for what the county
  certified at the time of award.

- **Citizen watchdog and journalistic investigation.** Independent
  watchdogs (e.g., MuckRock for FOI, Project on Government
  Oversight, local investigative-journalism outlets) can use the
  sealed quarterly Merkle root as a reference point against which
  any later-published county procurement data can be diffed.

## What this kit does NOT replace

- Statutory audit by the county auditor / state auditor
- County inspector-general review (where the county has an
  independent IG)
- Prosecutorial investigation of corruption offenses (state
  attorneys general, U.S. attorneys' offices, federal corruption
  units)
- Citizen-watchdog and journalistic investigative reporting
- Whistleblower channels and protected-disclosure regimes under
  state and federal whistleblower-protection law
- Open-records / public-records / sunshine-law compliance
- Federal grant-compliance reviews under 2 CFR Part 200
- State auditor's office review of county finances

The seal is a forensic primitive that lowers the cost and increases
the reliability of all of the above. It is not, and cannot be, a
replacement for any of them.

---

## License

Public domain (CC0). Fork it. No attribution required.
