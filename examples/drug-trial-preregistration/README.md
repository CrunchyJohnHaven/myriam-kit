# Drug Trial Pre-registration Kit

A turnkey myriam-kit example for clinical-trial sponsors and academic
investigators who want to pre-register a trial in a tamper-evident,
Bitcoin-anchored way **in addition to** registration at ClinicalTrials.gov,
EU CTR, or other jurisdictional registries.

## Why pre-register *additionally* under MYRIAM?

Existing trial registries (ClinicalTrials.gov, EU CTR, ISRCTN) have
documented integrity weaknesses:

- ClinicalTrials.gov permits sponsors to update endpoints, sample-size
  calculations, and analysis plans **after** the original registration,
  with the modification dates visible in the registry but the *content*
  changes not always cryptographically anchored.
- Several large studies (Goldacre et al., 2019; Mathieu et al., 2009)
  have documented systematic post-hoc endpoint switching across the
  field.
- Editorial enforcement by journals (CONSORT, ICMJE) catches some
  cases; many slip through.

A MYRIAM seal closes this gap. The Merkle root + Bitcoin OTS receipt
makes any post-hoc change to the *pre-registered* primary endpoint,
statistical analysis plan, or subgroup list cryptographically
detectable. The seal is forensically harder to retcon than the registry
itself.

This kit is a **complement to**, not a replacement for, jurisdictional
registries. A real trial should register in the appropriate registry
AND seal under MYRIAM.

## What this kit defends against

Historical mortality cases this would have helped with:

- **Vioxx (Merck, 2004)**: cardiovascular events were a pre-registered
  endpoint in the APPROVe trial but the published analysis used a
  cutoff that minimized the apparent harm. A seal of the pre-registered
  cutoff would have made the post-hoc cutoff change publicly detectable
  before the published paper.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: negative trial data on
  adolescent suicidality was reframed via post-hoc analysis. Sealed
  pre-registration of the endpoints would have made the reframing
  publicly detectable.
- **Multiple oncology trials** where survival endpoints were swapped
  to surrogate endpoints (progression-free survival, response rate)
  when survival benefit failed to materialize.

**Failure modes the seal directly catches:**

- **Endpoint switching**: post-hoc promotion of a secondary endpoint
  to "primary" when the actual primary fails. FACT 05 of the seal
  contains the pre-registered primary endpoint; the published primary
  endpoint must match.
- **Outcome cherry-picking**: selectively reporting only the analyses
  that worked. FACT 06 contains the full pre-registered analysis plan;
  the published analyses must include all pre-registered ones.
- **Post-hoc subgroup mining**: claiming "the drug works for subgroup X"
  after seeing the data. FACT 07 contains the pre-registered subgroup
  list; any other subgroup must be labeled post-hoc.
- **Sample size revision**: increasing the sample size after seeing
  interim trends. FACT 06 contains the pre-registered sample size and
  power calculation.
- **Silent removal of inconvenient secondary endpoints**: FACT 05
  pre-orders the secondary endpoints for hierarchical testing; any
  reordering or removal is detectable.
- **Suppression of negative results**: FACT 08 contains the
  publication commitment; failure to publish within the committed
  window is publicly visible.

**Failure modes NOT covered:**

- Misconduct in trial execution itself (faked data, fraudulent
  enrollment). The seal anchors the *plan*, not the *execution*.
- Selective reporting in publications that include all the
  pre-registered analyses but spin them favorably. The seal catches
  what's missing; it can't catch interpretive bias.
- Patient harm during the trial itself. The seal is regulatory and
  evidentiary; it doesn't reduce trial-conduct risk.

## When to use this kit

You should consider sealing a pre-registration if:

- You are sponsoring or running a clinical trial — Phase 1 through 4 —
  that will be used to inform medical or regulatory decisions.
- You are willing to be publicly bound to the pre-registered design,
  endpoints, and analysis plan.
- You can deal with the consequence: if the trial fails on its
  pre-registered endpoints, you cannot quietly retcon to a different
  endpoint that worked.
- You are participating in a research culture (academic medicine,
  cooperative groups, NIH-funded research) where pre-registration
  integrity is increasingly demanded.

This kit is *particularly* valuable for:

- Investigator-initiated trials at academic institutions (where
  sponsor pressure to change endpoints post-hoc is real but where
  the academic investigator has reputational incentive to resist).
- Open-science trials and citizen-science studies.
- Drug-repurposing trials in small biotechs without long
  trial-conduct track records.
- Any trial intended to inform regulatory submissions where future
  "we never said that" arguments could be made.

## When NOT to use this kit

Do NOT use this kit if:

- The trial protocol is genuinely still in flux. Pre-register when
  the protocol is final, not before.
- You cannot commit to publishing results regardless of direction.
  The seal makes failure-to-publish publicly detectable.
- The trial involves competitive industry secrecy that prevents you
  from making the analysis plan public. The seal makes the analysis
  plan a permanent public record; there is no way to seal something
  privately.
- You don't have legal and ethical sign-off on the protocol. The seal
  records the protocol as YOU sealed it; it cannot retroactively be
  endorsed by an IRB or ethics committee.

## How to fork this kit for a real pre-registration

```bash
# 1. Copy this example
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Replace fictional content with the real trial protocol content.
# Each fact corresponds to a section of a standard pre-registration:
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Update site/index.html to reflect the real trial.

# 4. Seal (BEFORE enrollment begins, BEFORE database lock):
bash build/seal.sh

# 5. Verify locally:
python3 build/verify.py

# 6. Deploy:
#    - Publish the seal URL to your trial sponsor's website AND
#    - Add the IPFS CID to the trial's ClinicalTrials.gov record's
#      "Description" or "References" field, so the registry record
#      cross-references the cryptographic seal.
```

**CRITICAL TIMING**: the seal must be created BEFORE enrollment begins.
A pre-registration sealed after the first patient is enrolled is
forensically much weaker. Ideally, seal at the moment of IRB approval.

## Integration with existing pre-registration infrastructure

The kit is designed to compose, not replace:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: register the trial in the
  jurisdictional registry as required. Then, in the registry's
  "Description" or "References" field, link to the MYRIAM-sealed
  publication.
- **OSF (Open Science Framework)**: OSF supports pre-registration with
  date stamps but not Bitcoin anchoring. The MYRIAM seal can be
  attached as a supplementary file on the OSF registration page,
  giving both date-stamp and Bitcoin-anchor.
- **AsPredicted.org**: similar — link the MYRIAM seal as a
  supplementary URL.
- **Journals**: some journals (e.g., Trials, BMJ Open) accept
  pre-registration URLs as part of submission. Include the MYRIAM
  seal URL alongside the registry URL.

## What recipients (regulators, journal reviewers, meta-analysts) get

A trial pre-registered under MYRIAM gives reviewers:

1. **Cryptographic proof the protocol was finalized at a specific time.**
   Reviewers can verify the seal time via the OTS receipt.
2. **Bytewise stability of the protocol text.** Reviewers comparing the
   published methods section to the pre-registered design can do so
   character-by-character.
3. **Detection of endpoint switching.** A simple diff between the sealed
   FACT 05 and the published primary endpoint reveals any
   substitution.
4. **Detection of analysis-plan deviation.** A simple diff between the
   sealed FACT 06 and the published statistical methods reveals
   modifications.
5. **Detection of selective subgroup reporting.** The sealed FACT 07
   contains all pre-registered subgroups; any in the publication not
   in the seal must be labeled post-hoc.

This makes systematic review and meta-analysis substantially easier
than current practice.

## What this kit is NOT

- Not a substitute for IRB / ethics-committee approval.
- Not a substitute for jurisdictional registry registration.
- Not a guarantee that the trial will be conducted as planned.
- Not a way to anchor patient consent or other ethical documents
  (those need their own sealing mechanism).
- Not protection against post-publication critique of trial design.

## A note on negative-result publication

Commitment #1 in FACT 08 ("publication regardless of direction") is the
single highest-mortality-impact commitment in the seal. The historical
suppression of negative trial results (particularly for psychiatric
drugs in adolescents, oncology drugs in elderly populations, and
cardiovascular drugs in women) has plausibly contributed to thousands
of preventable deaths over decades through over-prescription based on
biased efficacy estimates.

A sealed commitment to publish negative results is, by itself, one of
the highest-leverage public-health moves a sponsor can make. The seal
provides external accountability for that commitment in a way that
self-policed publication policies do not.

## Closing

Drug trial pre-registration under MYRIAM is small extra work for the
sponsor: ~30 minutes to populate the facts, ~10 seconds to seal. The
accountability it adds is asymmetric: small cost to honest trial
conduct, large constraint on the post-hoc maneuvering that has
contributed to historical biases in the evidence base.

If you are a sponsor or principal investigator considering this kit,
the kit is public domain (CC0). Use it. Modify it. Improve it.

## License

Public domain (CC0). No attribution required.
