# Food Safety Attestation Kit

A turnkey myriam-kit example for food manufacturers, food-safety
inspectors, third-party certifiers, and regulatory authorities who
want to publish a Bitcoin-anchored, tamper-evident seal of *what
release tests said* and *what release decision was made*, at the
moment of batch release or inspection-report sign-off — so that
silent post-release modification of the testing record, the release
decision, or the recall commitments is publicly detectable.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of WHICH release tests were
performed on WHICH lot, by WHICH accredited laboratories, under
WHICH methods, with WHICH results, and what RELEASE DECISION the QA
authority made on the basis of those results. It cannot answer any
question about food safety beyond that. The following are
**outside the seal's domain**:

1. **Preventing contamination.** The kit anchors what test results
   SAID at release. Contamination has many causes — heterogeneous
   microbial distribution within a lot, post-release temperature
   abuse in distribution, retail handling failures, consumer
   preparation failures, novel or unscreened hazards (e.g. melamine
   adulteration before melamine screening was routine), supply-
   chain fraud upstream of the manufacturer's testing scope. The
   seal does not prevent any of these and does not claim to.

2. **Guaranteeing that all units in a passing lot are safe.**
   Microbiological contamination in bulk food product is
   HETEROGENEOUS. Listeria, Salmonella, and STEC pathogens occur
   in low-prevalence localized hotspots, not uniformly distributed.
   ICMSF and Codex sampling plans have a documented, bounded
   probability of detecting contamination present at low
   prevalence — the probability is NOT 1. A lot that passes
   release sampling can still contain contaminated units that
   were not sampled. The seal anchors the SAMPLES, not the bulk.
   This constraint is restated explicitly in FACT 03 and is the
   single most important honest-limit of this kit.

3. **Certifying that release tests were honestly run.** The seal
   anchors what the tests reported at release. A laboratory that
   reports a fraudulent PASS at release produces a cryptographically
   valid seal of a fraudulent PASS. The kit makes later silent
   modification detectable, but does not detect contemporaneous
   fraud. Detection of contemporaneous fraud requires audit, lab
   accreditation oversight (ISO 17025 surveillance), proficiency-
   testing programs, and regulator inspection — all of which are
   upstream of the seal.

4. **Substituting for FSMA, FSIS, or EU competent-authority
   regulatory submissions.** Release records under FSMA, FSIS,
   EU Regulation (EC) 178/2002, and Codex Alimentarius are
   maintained per statute and produced on regulator demand. The
   seal adds a public tamper-evident layer ON TOP of those
   submissions; it does NOT replace them. A sealed publication is
   not a regulatory filing.

5. **Resolving recall scope disputes.** The kit can seal the
   recall commitments made at release (FACT 06) and a subsequent
   recall scope as a new publication; but the boundary of which
   lots are affected, which units shipped, which retailers
   received them, and which consumers were exposed is still a
   trace-back-and-forward investigation. The seal anchors what
   the manufacturer COMMITTED to and what they later DID. It does
   not resolve the underlying epidemiological question.

6. **Detecting deliberate supply-chain fraud upstream of testing.**
   The 2008 melamine adulteration of milk and infant formula in
   China succeeded because melamine was not in the analyte panel —
   nitrogen-content protein-equivalent measurement was, and
   melamine spoofed it. A sealed FACT 03 with the analyte panel
   in use at the time would have committed to that panel
   publicly — but would have done nothing to detect the
   adulterant outside the panel. The seal's value in that case
   would have been forensic anchoring of "this is what the
   manufacturer claimed to test for," NOT prevention. A real
   food-safety regime addresses this through unannounced regulator
   sampling with broad-scope screening (LC-MS untargeted methods,
   for instance), which is upstream of the manufacturer's seal.

7. **Anchoring post-release distribution and consumer handling.**
   Once the lot leaves the facility, temperature abuse during
   distribution, mishandling at retail, consumer storage
   failures, and consumer preparation errors are all out of scope.
   The seal is scoped to the manufacturer's release event.
   Downstream tamper-evidence requires separate kits at the
   distributor, retailer, and (for institutional consumers like
   schools and hospitals) point-of-use levels.

8. **Vouching for the safety of food in any specific population.**
   FACT 03 PASS results do not entail safety for pregnant
   consumers, infants, immunocompromised consumers, or the
   elderly, for whom Listeria monocytogenes and Salmonella
   present documented elevated risk even at concentrations below
   conventional detection limits. The seal cannot make a
   population-specific safety claim and refuses to (refusal-rule
   R6).

**The honest-limits section above is the load-bearing part of this
kit.** Manufacturers who treat "we sealed our release record" as
equivalent to "we proved our food is safe" misuse the primitive.
The kit must say plainly: *this is a non-repudiation primitive for
the manufacturer's contemporaneous claims at release, not a proof
of safety, not a substitute for regulator oversight, and not a
defense against the heterogeneous-contamination, supply-chain-
fraud, or post-release-mishandling failure modes that have killed
people in past outbreaks.*

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if
a user with valid manufacturer signing authority submits them:

- **Personal identification of any worker, supervisor, QA staff,
  visiting inspector, or third-party auditor.** Names, employee
  IDs, badge numbers, social security numbers, home addresses,
  personal phone numbers — none of these appear in the public seal.
  Roles are public; person-to-role bindings are sealed separately
  and discoverable under regulator process. Worker safety against
  retaliation and harassment is the load-bearing constraint;
  food-safety attestation can be done at role-level. (R1)

- **Precise facility location.** The facility region (state or
  multi-state region) is acceptable; precise street address, GPS
  coordinates, or any identifier of granularity sufficient to
  physically identify the plant on a map is NOT acceptable. The
  regulatory establishment number is the regulator's handle for
  the facility; physical-security and worker-safety considerations
  argue against publishing a public address on Bitcoin. (R2)

- **Individual production-shift personnel patterns.** Shift
  schedules, individual worker rotations, line operator personal
  IDs — none of these appear in the seal. Pattern-of-life of
  individual workers must not be derivable from the public
  attestation. (R3)

- **Supplier identities that compromise contracts.** Supplier
  names, supplier facility locations, supplier lot codes (except
  in the supply-chain-contamination case where naming a supplier's
  contaminated lot is required for public health, and is handled
  through a separate sealed publication) are NOT published in the
  release seal. Many supply contracts contain confidentiality
  provisions; the seal does not breach those by default. (R4)

- **Customer lists and distribution destinations beyond high-level.**
  High-level regional summary is acceptable; specific customer
  lists (retailers, distribution centers, foodservice accounts)
  are NOT acceptable. Customer identity is contractually
  confidential and competitively sensitive; the regulator obtains
  the customer list through established recall-coordination
  channels. (R5)

- **Safety claims or legal conclusions.** The kit will not seal
  "this product is safe," "this lot meets all applicable food-
  safety standards," "this is GRAS for this use," or any other
  safety or legal conclusion. The kit anchors the testing record
  and the release decision, NOT a safety conclusion. (R6)

- **Worker-complaint or whistleblower re-identification patterns.**
  The kit refuses to publish any pattern that could re-identify a
  worker who has filed an OSHA, USDA, or company-internal
  complaint about food-safety or workplace-safety practices. Such
  complainants are protected under FSMA Section 402 and parallel
  statutes; the seal must not become a re-identification vector.
  Whistleblower attestations have their own kit
  (`examples/whistleblower-manifest`) with refusal rules tuned for
  that use case. (R7)

- **Sealing by anyone other than the releasing manufacturer's
  authorized principal.** A third-party certifier, customer QA
  team, or independent auditor may use the same kit to seal THEIR
  own audit findings; they may NOT seal the original release
  decision under the manufacturer's name. The signing principal
  in FACT 08 is the only valid signer for that. (R8)

A refusal itself may be sealed as a fact ("This manufacturer
requested sealing of X; the kit refused per refusal-rule Y"),
creating a public record of attempted misuse.

---

## What this kit DOES seal

8 facts at the moment of release:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Product and batch identification** — product name, category,
   manufacturer, facility region (NOT precise location), HACCP-
   plan version + hash, lot ID, production / pack / use-by dates,
   number of consumer units, storage requirements, the three
   critical control points with logged-record hashes (cook
   lethality, cooling stabilization, post-lethality RTE
   environment).
3. **Release testing results** — finished-product microbiological
   tests (Listeria, Salmonella, STEC, APC, Enterobacteriaceae),
   chemical / residue tests (nitrite, veterinary residues, heavy
   metals), allergen cross-contact verification, environmental
   monitoring summary, each with the SHA-256 of the full report
   PDF and the explicit sample-vs-bulk interpretation constraint.
4. **Methodology and laboratory qualification** — which method
   (and which method-document version) was used per row, which
   labs ran which tests, each lab's ISO/IEC 17025:2017
   accreditation status and certificate hash, recent proficiency-
   test results, independence statement, deviation / retest / OOS
   record for this lot.
5. **Release decision** — release date, role-level release
   authority + counter-sign, decision-supporting record summary,
   high-level distribution destinations, post-release obligations
   acknowledged at release, timing-and-irreversibility
   commitment.
6. **Recall and post-market surveillance commitments** — the
   food-safety analog of pharmacovigilance: illness-signal
   transparency, recall execution commitments (24h / 72h / 98%
   thresholds), supply-chain contamination response, no-silent-
   retesting commitment, no-post-hoc-specification-changes
   commitment, aggregate safety-signal sharing.
7. **Companion disclosures and refusal record** — corrective-
   action investigation log hash, recent inspection history,
   recall history, known open issues in testing methods used,
   role-to-individual binding (sealed separately, hashed here),
   supplier-traceback readiness, explicit list of refusal rules
   R1-R8 with any refusals exercised during this release.
8. **Signing principal** — manufacturer + role-level signatory
   (QA Director) + role-level counter-sign (Plant Manager) +
   cryptographic key info; rationale for role-level publication.

Each fact ends with the refusal-gate convention: *"This fact
asserts only X. It does not assert Y"* (where Y is the closest
failure mode from the "DOES NOT do" section above).

---

## What this kit defends against

- **Silent retroactive modification of release test results.**
  All test-report PDFs are hashed. Re-hashing post-release reveals
  any modification.
- **Disputes about which methods, which method-document versions,
  and which labs were used.** FACT 04 freezes the methodology and
  lab accreditation status at release. Later "we actually used
  MLG 4.13, not 4.12" claims are publicly refutable.
- **Retroactive re-spec for an out-of-spec batch.** If a release-
  test result was actually a borderline PASS that gets reclassified
  as a FAIL post-release, the sealed report hashes prove what the
  original result PDF said. Symmetrically, a borderline OOS that
  gets quietly retested into a PASS without disclosure is detectable
  if FACT 06's no-silent-retesting commitment is later compared
  against an unsealed amendment.
- **Silent recall scope minimization.** The recall commitments in
  FACT 06 (24h notification, 72h initiation, 98% recoverability)
  are sealed; failure to honor them is publicly observable.
- **Post-hoc re-narration of the corrective-action history.** The
  FACT 07 corrective-action log hash freezes what the company SAID
  it did after the EMP presumptive; later "we did more / less than
  that" claims are publicly refutable.
- **Selective omission of companion disclosures.** FACT 07
  enumerates the expected disclosure categories (inspection history,
  recall history, method-advisory review, traceback readiness); an
  empty category must be explicitly attested ("none at release
  time"), so a later "we didn't realize that was relevant" is
  publicly refutable.
- **Substitution of a different lab's accreditation status.**
  FACT 04 freezes each lab's ISO 17025 scope and certificate hash
  at release; a later substitution of a non-accredited lab is
  publicly detectable.

The kit does **not** defend against contemporaneous corruption — a
team that intentionally seals false test results at release time
produces a cryptographically valid seal of false test results. The
primitive is honest about this: it is a non-repudiation primitive
for the manufacturer's contemporaneous claims, not a proof those
claims are correct.

---

## Historical mortality precedent

The kit would have produced a useful anchor — *not a resolution* —
in past food-safety failures. To avoid defaming individuals (most
food-safety failures are corporate, not individual; some are
litigated criminally and some are not), these references describe
the outbreak by year and pathogen and name the involved entity
only when the contamination was publicly attributed by recall
notice or court record.

- **2008 China melamine adulteration of infant formula and dairy
  (Sanlu Group + others).** At least six infant deaths and ~300,000
  illnesses attributable to melamine-spiked dairy products designed
  to fraudulently inflate apparent protein content on Kjeldahl
  nitrogen-based assays. Convictions followed in PRC courts,
  including capital sentences. *The seal would not have prevented
  this* — melamine was outside the standard analyte panel. The seal
  would have committed publicly to what the panel WAS, making the
  scope of the post-incident expansion of routine screening
  forensically clear.

- **2011 European STEC O104:H4 outbreak (fenugreek sprouts traced
  to a German farm).** 53 deaths, ~3,950 illnesses across multiple
  European countries; ultimately traced to fenugreek seeds
  imported from Egypt and sprouted at a German producer. Traceback
  was hampered by inconsistent lot-level documentation across the
  multi-country supply chain. *The seal would not have prevented
  contamination of the seed lot* (the contamination was upstream
  of the sprouter's tests); it would have anchored what the
  sprouter's release tests claimed and, if used at the seed
  importer level, what the imported-seed handling claimed, making
  traceback faster.

- **2015 Blue Bell Creameries Listeria monocytogenes outbreak
  (United States).** 3 deaths, 10 illnesses across multiple
  states; led to a national recall and a 2020 federal criminal
  conviction of Blue Bell on misdemeanor food-safety charges, with
  the company entering a deferred-prosecution agreement and paying
  $19.35 million. Subsequent civil litigation. *The seal would not
  have prevented* the in-plant Listeria environmental
  contamination; it would have forensically anchored the
  environmental-monitoring program records, making any post-
  incident question of "what did the EMP show in the months before
  the outbreak" answerable against a tamper-evident timestamped
  record rather than against later-produced documents.

- **2018 multistate STEC O157:H7 outbreaks linked to romaine
  lettuce (Yuma growing region, then Salinas growing region).**
  At least 5 deaths and ~210 illnesses across multiple outbreaks
  that year. Traceback was complicated by mixed-source bagged
  product. *The seal would not have prevented* contamination at
  the field / irrigation-water level (upstream of the
  manufacturer); it would have forensically anchored each
  processor's intake-testing and release-testing record, making
  the trace-back faster and the public record more
  cryptographically defensible against later disputes.

- **Peanut Corporation of America Salmonella Typhimurium outbreak
  (2008-2009, United States).** 9 deaths, ~714 illnesses;
  resulted in 2014-2015 federal criminal convictions of PCA
  executives, including a 28-year prison sentence for the CEO on
  conspiracy and obstruction charges. *The seal would not have
  prevented* the contamination, the under-investigation of
  positive in-plant Salmonella tests, or the executive-level
  decision to ship product against those positive findings. It
  WOULD have made forensically clear, at trial, what the test
  results SAID at the moment they were generated — making the
  prosecution's case against contemporaneous false-narrative
  emails substantially more anchored against documentary
  modification.

In each of these cases, the kit would have provided a cleaner
forensic timeline. In none of these cases would the kit by itself
have prevented the deaths. The seal is forensic infrastructure, not
prevention infrastructure. That distinction is the kit's honesty.

---

## When to use this kit

- Your manufacturing operation has a stable HACCP / Preventive
  Controls program and wants to add a Bitcoin-anchored public
  attestation as a tamper-evident layer on top of the existing
  release-documentation workflow.
- You are a small-to-mid-sized manufacturer or a manufacturer in
  a jurisdiction with weaker regulatory infrastructure, wanting
  to anchor batch records against a globally verifiable timeline
  — for export-market trust, for customer-audit response, or for
  participation in voluntary transparency initiatives.
- You are a food-safety inspector or third-party certifier and
  want to publish a tamper-evident audit-finding seal at sign-off,
  so the audit findings cannot be silently amended later by
  agreement between the manufacturer and the certifier.
- You expect this lot to face significant downstream scrutiny
  (export market, high-risk category like RTE meat or infant
  formula, novel ingredient, recent recall history).
- You can publish the listed fact set without breaking refusal
  rules R1-R8. If your facts would require an R1-R8 break, do not
  use the kit; fix the data inputs first.
- Manufacturer counsel has reviewed the publication plan. Public
  publication of a lot-identifier-bearing artifact has
  implications for product-liability exposure; counsel review is
  not optional.

## When NOT to use this kit

- **Do not use as a substitute for FSMA / FSIS / EU regulatory
  records.** The seal is *additive*, not replacement. Your
  statutory release records, your HACCP plan, your CCP logs, and
  your recall plan are unchanged.
- **Do not use as a safety claim.** Sealing a passing release
  record does not establish that the product is safe; it
  establishes that the record had this byte content at this time.
  Refusal-rule R6 will reject any safety conclusion.
- **Do not use to publish supplier identities, customer lists,
  worker names, or facility addresses.** Refusal rules R1-R5
  exist for human-safety and contract reasons; do not amend the
  kit to defeat them without consulting counsel.
- **Do not use under pressure to seal before release testing is
  complete.** A partial-data seal misrepresents the state of the
  release decision.
- **Do not use as legitimacy theater.** A seal of a poorly
  designed sampling plan or a poorly chosen analyte panel is a
  permanent public record of the inadequacy, not a defense
  against it. The primitive cuts both ways; that is its
  honesty.
- **Do not use during an active recall situation as a substitute
  for the regulator's recall coordination.** A new MYRIAM
  publication anchoring the recall scope is appropriate AFTER
  the regulator-coordinated recall is initiated; it is not a
  replacement for the regulator's recall channel.

## How to fork this kit for a real release

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**CRITICAL TIMING:** seal at the moment of QA release, BEFORE the
lot is distributed (before the first truck departs the facility).
A seal after distribution begins still has value but does not
anchor the pre-distribution state cleanly. The right window is
between the QA release signature and the first distribution
movement.

**CRITICAL REVIEW:** before sealing, run the publication through a
second QA reviewer (not the lead) and through company counsel. Once
sealed, the publication is permanent.

## Integration with existing food-safety infrastructure

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  The sealed publication URL or IPFS CID can be referenced in
  the Food Safety Plan documentation as the public-attestation
  artifact for this lot.
- **USDA FSIS HACCP plans and release records.** The sealed
  release record sits alongside the FSIS-required HACCP records;
  the seal references the HACCP-plan-version hash (FACT 02) so
  later disputes about which plan version was in effect are
  publicly refutable.
- **Codex Alimentarius / HACCP principles** (Codex CAC/RCP 1-1969
  Rev. 4-2003). The seal commits to the seven-principle HACCP
  outputs (hazard analysis, CCPs, critical limits, monitoring,
  corrective actions, verification, recordkeeping) for this lot.
- **ISO 22000:2018 (Food Safety Management Systems).** The seal
  can be referenced as part of the management-review evidence
  trail; it does not replace the ISO 22000 certification.
- **FSSC 22000 v6 certification scheme.** Compatible as an
  additive transparency layer; FSSC's auditor can verify the seal
  during surveillance.
- **EU Regulation (EC) 178/2002 (General Food Law) Article 18
  (traceability) and Article 19 (recall notification).** The seal
  commits the manufacturer's one-tier-back traceback readiness
  (FACT 07) and recall commitments (FACT 06); it does not replace
  the statutory Article 19 notification obligation.
- **EU Hygiene Package (Regulations 852/2004, 853/2004, 854/2004,
  882/2004).** Compatible; the seal references the equivalent of
  the Hygiene Package's HACCP and own-checks records.
- **BRCGS / SQF private-standard schemes.** Compatible as an
  additive transparency layer.
- **Public-health surveillance systems (CDC PulseNet, FoodNet,
  IFSAC; EU EFSA / ECDC).** Out of scope for the seal directly,
  but FACT 06 commits the manufacturer to participating and to
  sealing any signal-correlation events as new MYRIAM
  publications.

## What this kit does NOT replace

- FDA Food Facility Registration or USDA FSIS Establishment
  approval.
- Your written Food Safety Plan / HACCP Plan under FSMA / FSIS.
- CCP monitoring logs and corrective-action records.
- ISO 17025 lab accreditation oversight.
- Proficiency testing programs.
- Regulator inspection (FSIS continuous inspection, FDA periodic
  inspection, EU competent-authority inspection).
- Public-health surveillance (CDC, EFSA, ECDC, national equivalents).
- Recall coordination channels (FDA Reportable Food Registry,
  FSIS recall coordination, EU RASFF, national equivalents).
- Worker safety and food-worker training programs.

## Why this kit exists in v0.4.0+

This is one of the worked examples shipped with myriam-kit. It
follows the constraint-first README structure validated by the
autoresearch documented in `~/Genesis/calc/PROMPT_LIBRARY_v0.md`
— the constraint-first prompt variant scored highest on a weighted
rubric across multiple example domains, because food-safety
attestation is exactly the domain where overstating what the seal
proves is dangerous: people have died, will die, in failures the
seal cannot prevent. The opening sections are the load-bearing
parts of the kit; the manifest content is the easy part.

The kit's defaults are deliberately conservative on worker-name
publication, conservative on facility-location precision,
conservative on supplier and customer identity, and aggressive on
the "this does not establish safety" disclaimer. The food-safety
community has a documented history of overstated certification
language; the kit defaults to the position least likely to be
read as a safety guarantee. Manufacturers in jurisdictions where
specific public-disclosure requirements differ can amend their
fork accordingly, but the default refusals favor worker safety
and honest scope.

## License

Public domain (CC0). Fork it. No attribution required.
