# Carbon Attestation Seal Kit

A turnkey myriam-kit example for carbon project developers,
third-party verifiers, and registries who want to publish a
Bitcoin-anchored, tamper-evident seal of a carbon-credit issuance,
removal verification, or emissions-attestation event at the exact
moment of certification — so that silent post-issuance modifications
become publicly detectable.

---

## What this kit DOES NOT do (read first)

Carbon credits are politically and scientifically contested. The seal
is a cryptographic timestamp of what was attested. It cannot verify
whether what was attested reflects real climate benefit. The
following failure modes are **outside the seal's domain**, and they
account for most of the meaningful integrity questions about carbon
credits:

1. **Additionality.** The seal cannot verify that the credited
   activity would not have happened without carbon finance. The
   counterfactual is unobservable in principle. The seal records the
   methodology's additionality argument; it does not adjudicate it.

2. **Permanence.** The seal cannot verify that sequestered carbon
   will remain sequestered over the relevant time horizon (decades
   to centuries for forest carbon, geological timescales for some
   removals). Recent literature (Badgley et al. 2022, Patterson et
   al. 2022) shows buffer pools have been substantively depleted by
   real reversal events. A sealed credit is a sealed *claim* of
   permanence under specified buffer-pool assumptions, not proof of
   permanence.

3. **Leakage.** The seal cannot verify that avoided emissions in the
   project area are not simply displaced to a non-project area.
   Methodology-default leakage deductions are regulatory placeholders,
   not measurements. The seal anchors the deduction applied; it does
   not certify it as correct.

4. **Co-benefits.** The seal cannot verify community-development or
   biodiversity claims. Co-benefits are typically self-asserted and
   verifier-reviewed, not audited at the depth of carbon
   quantification. The seal anchors the document hashes; nothing
   more.

5. **Free-Prior-and-Informed-Consent (FPIC) sufficiency.** Indigenous
   and community consent in carbon projects has a documented history
   of failure modes (coerced consent, consent from non-representative
   bodies, post-hoc "consent" through compensation). The seal anchors
   FPIC documentation and grievance-log hashes; it cannot certify
   that the consent process was genuine.

6. **Verifier independence.** Verifiers are paid by project
   developers. This is a structural conflict of interest that no
   accreditation scheme has resolved. The seal anchors the verifier's
   independence declaration; it does not certify that the declaration
   is true.

7. **Double-counting across registries or with national
   inventories.** The seal anchors the registry-state snapshot at
   attestation time. If the same activity is also being counted by a
   host country toward its NDC, or also being claimed on another
   registry, the seal makes the registry state diffable but does not
   prevent the double count.

8. **Buyer claim correctness.** A buyer who retires a sealed credit
   to support a "net zero" or "carbon neutral" claim is making a
   downstream claim the seal does not cover. The seal records the
   retirement; the validity of the buyer's marketing claim is a
   separate, downstream question.

9. **Methodology correctness.** The seal records the methodology
   citation + document hash in effect at attestation time. It does
   not assert the methodology is scientifically valid. Methodology
   reform happens; sealing under a methodology that is later revised
   does not retroactively make the credits "wrong" or "right" — it
   anchors what rules applied at issuance.

**The honest-limits section above is the load-bearing part of this
kit.** Almost every meaningful integrity question about a carbon
credit lives in one of those nine buckets. The seal closes the
narrow remaining gap: silent retroactive modification of bytes-on-
record. That gap is real and worth closing, but it is small relative
to the contested terrain.

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if
a user with valid signing authority submits them:

- **"Additionality" stated as a fact.** Sealing additionality as
  fact creates a misleading record. The kit accepts methodology-
  compliant additionality *arguments*, not additionality *claims*.
- **"Permanence" without explicit time-horizon and buffer-pool
  disclosure.** Sealing permanence without those parameters obscures
  what the project is actually committing to.
- **"No leakage" without project-specific measurement.** Methodology-
  default leakage deductions are not measurement and the seal will
  not treat them as such.
- **Quantifications generated before third-party verification is
  complete.** A pre-verification seal creates a false-positive
  "verified" record.
- **Issuance records for credits also issued on a different registry
  without explicit cross-registry disclosure** in FACT 06.
- **Retirement records that fail to name the retirement
  beneficiary.** Anonymous retirement undermines the public-good
  function of retirement; the kit refuses to enable it.
- **FPIC claims unsupported by attestable documentation hashes.**
- **Article 6.2 / 6.4 issuance without a host-country letter-of-
  authorization (LoA) hash** sealed in FACT 06.
- **Sealing at the request of any party other than the project
  developer + verifier jointly** for that project.
- **Co-benefits claims sealed as "certified"** when they are only
  "self-asserted and verifier-reviewed."

A refusal itself may be sealed as a fact ("This party requested
sealing of X; the kit refused per refusal-rule Y"), creating a public
record of attempted misuse.

---

## What this kit DOES seal

8 facts at the moment of attestation:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Project identification** — project name, registry, registry
   project ID, methodology citation + hash, geographic boundary
   hash, vintage, project developer, co-benefits claim, FPIC status.
3. **Emissions or removal quantification** — gross tonnes CO2e,
   baseline counterfactual, leakage deduction, buffer-pool
   contribution, uncertainty deduction, net creditable claim, hashes
   of every numerical input.
4. **Measurement methodology** — remote-sensing data sources,
   ground-truth plot network, instrument calibration log hash,
   classifier model hash + accuracy stats, carbon-density model,
   code-provenance + reproducibility manifest.
5. **Third-party verification** — verifier organization,
   accreditation, independence declaration hash, prior engagements
   with developer, site-visit photo archive hash, findings raised +
   resolved, verification opinion document hash.
6. **Issuance or retirement record** — issuance request +
   approval, total credits issued, serial range, cross-registry
   declaration, host-country LoA hash where applicable, retirement
   serial ranges + beneficiaries (for retirement attestations),
   registry-state snapshot hashes.
7. **Companion disclosures and refusal record** — pending
   methodology disputes, non-permanence risk, leakage caveats,
   additionality caveats, FPIC + grievance-log hashes, co-benefits
   caveat, prior verifier engagement; explicit list of patterns the
   kit refused to seal.
8. **Signing principal** — project developer + verifier + registry,
   each with role + scope of attestation + cryptographic key info.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section above).

---

## What this kit defends against

- **Silent post-issuance modification of quantification.** Any
  integer change to FACT 03 produces a different SHA-256, different
  Merkle root, fails OTS verification.
- **Silent methodology substitution.** FACT 02 freezes the
  methodology citation + document hash at issuance. A registry
  swap-in of a different methodology version post-issuance is
  publicly diffable.
- **Silent baseline revision.** FACT 03's baseline scenario model
  output hash is sealed. A post-hoc baseline retune to produce more
  credits is detectable.
- **Silent verifier-opinion substitution.** FACT 05's opinion
  document hash is sealed. A post-issuance "the verifier always said
  X" rewrite is detectable.
- **Silent retirement-record disappearance.** FACT 06's registry-
  state snapshot is sealed. Credits that mysteriously become
  "available" again after being marked retired are detectable
  against the seal.
- **Silent FPIC document substitution.** FACT 07's FPIC + grievance-
  log hashes are sealed. Replacement consent documents are
  detectable.
- **Silent removal of inconvenient disclosures.** FACT 07 companion-
  disclosure status is sealed. Quiet deletion of a non-permanence
  caveat from a project description page is detectable against the
  sealed bytes.

The kit does NOT defend against the underlying integrity questions
(additionality, permanence, leakage, FPIC sufficiency, verifier
independence, methodology validity). Those are the harder problems
and the seal cannot solve them.

---

## Historical or near-historical cases the kit would have helped with

The kit would have produced a useful anchor — *not a fix* — in cases
involving silent retroactive modification of carbon-attestation
records. It would NOT have resolved the underlying contested
questions in any of these cases.

- **The 2023 Guardian / Die Zeit / SourceMaterial investigation of
  Verra rainforest credits.** Investigators found that most studied
  REDD+ projects produced credits whose claimed avoided emissions
  did not match later remote-sensing reanalysis. The investigation
  required reconstructing project documentation against retroactively
  modified registry records. A sealed publication at each issuance
  cycle would have provided unambiguous reference bytes for what was
  attested at each cycle — not a fix for the underlying baseline
  problem, but a clean forensic timeline.

- **The 2020 California forest-offset reversal events.** Multiple
  forest-carbon projects under California's compliance market
  experienced wildfire reversals exceeding the buffer-pool reserve
  set aside for them. Reconstructing what each project had attested
  about non-permanence risk *at issuance* (vs. what the project
  later claimed it had attested) is currently difficult. Per-vintage
  seals would have made the pre-fire attestations canonically
  retrievable.

- **Various REDD+ projects where reference-region baseline
  methodologies were retroactively criticized as inflated.** A
  sealed methodology-document hash at issuance time would have
  anchored which methodology version actually applied to which
  vintage, making the "methodology was always X" defense diffable.

- **Several Australian Carbon Credit Unit (ACCU) human-induced
  regeneration project disputes (2022–2023).** Academic critique of
  whether regeneration was actually project-induced vs. natural
  reverted to disputes about what the project had originally
  claimed. Sealed attestations would have provided unambiguous
  per-vintage records.

- **Carbon-offset retirement records that have shifted state.**
  Several documented cases of retirement records on voluntary-market
  registries appearing to change status post-retirement (becoming
  "retired" for a different reason, or being attributed to a
  different beneficiary after the fact). Per-retirement seals would
  have anchored the state at the moment of original retirement.

In none of these cases would the kit have resolved whether the
underlying credit represented real climate benefit. The kit anchors
records; that is all it does.

---

## When to use this kit

- You are a project developer who wants to publish a tamper-evident
  attestation alongside your standard registry filing.
- You are a third-party verifier who wants your verification opinion
  to be publicly verifiable against a registry's later representation
  of "what the verifier said."
- You are a registry who wants to provide an additional integrity
  layer on issuance and retirement records — particularly for
  projects in jurisdictions with weaker rule-of-law backstops for
  registry integrity.
- You are a journalist, academic, or NGO running a multi-year
  longitudinal analysis of carbon projects and need a public anchor
  to diff a project's later representations against its issuance-
  time bytes.
- You are a buyer (corporate net-zero, airline compliance) who wants
  the credits you retire to be retired against publicly anchored
  records, so your downstream marketing claim can be audited
  against a stable forensic timeline.

## When NOT to use this kit

- **Do not use as a substitute for accredited third-party
  verification.** The seal does not replace ISO 14064-3 verification;
  it composes with it.
- **Do not use to claim a project is "additional," "permanent," or
  "low-leakage."** The seal cannot verify those properties. Using
  the seal to assert them is misuse.
- **Do not use as legitimacy theater for low-quality credits.** A
  cryptographic seal on a poor-quality credit is a permanent
  forensic record of the poor quality, not a defense of it. The
  primitive cuts both ways; that is its honesty.
- **Do not use to seal credits that are also being counted by a host
  country toward its NDC** without explicit corresponding-adjustment
  disclosure in FACT 06.
- **Do not seal pre-verification.** A seal before the verifier's
  opinion is final creates a false-positive "verified" record.
- **Do not use under pressure to omit a companion-fact disclosure in
  FACT 07** (pending methodology disputes, FPIC issues, prior
  verifier engagement). Refuse, and seal the refusal.
- **Do not use as a marketing badge.** "MYRIAM-sealed" is not a
  quality claim; it is a forensic property. Treating it as a quality
  badge is exactly the misuse the constraint-first design tries to
  prevent.

## How to fork this kit for a real attestation

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Critical timing:** seal AT or AFTER the registry's official
issuance event, NOT before. A pre-issuance seal creates a false-
positive "issued" record. For retirement attestations, seal AT the
moment of retirement. For ongoing monitoring attestations between
issuance and retirement, seal at each verifier-signed monitoring
cycle — but make clear in FACT 01 that the attestation is a
monitoring update, not an issuance.

## Integration with existing carbon infrastructure

- **Verra (VCS).** The sealed publication URL or IPFS CID can be
  attached to the VCS project page as supplementary documentation.
  The seal does not replace VCS verification; it composes with it.
- **Gold Standard.** Same integration model — supplementary
  attestation alongside Gold Standard issuance documentation. Gold
  Standard's emphasis on co-benefits + community benefit
  documentation maps naturally onto FACT 02 + FACT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Same integration model.
- **Article 6.4 (Paris Agreement Supervisory Body mechanism).** The
  host-country LoA hash in FACT 06 is specifically designed for
  Article 6.4 / 6.2 ITMO traceability. Corresponding-adjustment
  disclosure is a refusal-gated field.
- **EU ETS MRV.** For compliance market issuers, the MRV report
  hash maps to FACT 03's quantification spreadsheet hash. The seal
  composes with — does not replace — the operator's verified
  emissions report.
- **CDP (Carbon Disclosure Project) corporate disclosure.** For
  corporates citing retired credits in CDP submissions, the
  retirement record sealed under FACT 06 is the canonical
  retrievable record. CDP submission language can reference the
  sealed publication's Merkle root or IPFS CID.
- **ISO 14064-2 (project) / ISO 14064-3 (verification) / ISO 14065
  (accreditation).** The seal records the conformance assertion +
  hashes; it does not perform the conformance assessment.
- **TSVCM Core Carbon Principles (CCP) / ICVCM labels.** Where a
  project has been assessed against the ICVCM CCPs, the assessment
  result hash can be sealed in FACT 07 as a companion disclosure.

## What this kit does NOT replace

- Accredited third-party verification (ISO 14064-3)
- Registry issuance and retirement workflows
- Methodology compliance assessment
- Host-country authorization processes for Article 6 transactions
- Compliance-market MRV processes (EU ETS, California Cap-and-Trade,
  RGGI, etc.)
- Voluntary-market integrity initiatives (ICVCM, VCMI)
- Independent climate-impact assessment

## Why this kit exists in v0.4.0+

This is the 7th worked example shipped with myriam-kit. The kit
exists because carbon-credit markets have a well-documented history
of silent retroactive modification — methodologies that get
retroactively reinterpreted, baselines that get retroactively
revised, retirement records that change state, and project
disclosures that quietly drop inconvenient caveats over time.

The seal closes the *narrow* gap of bytes-at-time-of-attestation.
It does not address — and cannot address — the larger contested
questions of additionality, permanence, leakage, or co-benefit
authenticity. The kit's honest framing of that limitation is its
most important feature.

## License

Public domain (CC0). Fork it. No attribution required.
