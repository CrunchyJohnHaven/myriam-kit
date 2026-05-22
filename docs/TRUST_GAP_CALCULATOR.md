# Trust Gap Calculator

This page estimates the financial value of sealing attestations using the
myriam-kit protocol, and converts that to a lives-saved equivalent using
standard global-health cost-effectiveness ratios.

This is a **calculator**, not a sales document. The numbers are upper-bound
order-of-magnitude estimates intended for back-of-envelope budgeting by
hospital CFOs, state procurement officers, regulators, and trial sponsors
deciding whether sealing a small fact set is a defensible expenditure of
attention.

This document is **CC0 / public domain**, matching the kit itself
(see [LICENSE](../LICENSE)). Re-use, re-publish, fork, and recompute the
numbers freely. No attribution required.

---

## 0. What is a "trust gap"?

A **trust gap** is the excess cost a system pays because the parties in
the system cannot cheaply verify each other's claims. Concretely:

- The duplicate audit a regulator runs because the regulated party's
  internal audit is not credible.
- The retrospective re-analysis a meta-analyst runs because the original
  trial's pre-registration is mutable.
- The contract dispute that goes to litigation because both sides recorded
  different ledger entries.
- The vaccine batch that gets recalled because the test results "may have
  been edited" — and the publisher cannot prove they weren't.

The trust gap is the **delta between the cost a system actually pays**
to operate at its current level of mutual suspicion, **and the cost it
would pay if claims were cryptographically verifiable**. Eliminating the
gap entirely is impossible (some suspicion is well-founded; the protocol
doesn't make the publisher more honest). Sealing reduces the *forensic
cost of resolving disputes after the fact* and the *audit cost of
preventing them in the first place*.

The honest claim: the kit lets a publisher convert a *recurring* trust
cost (every audit, every dispute, every "prove you didn't change this")
into a *one-time* sealing cost (~$0 in fees, ~10 minutes of human time).
The financial value is the difference, multiplied by the rate of recurrence.

---

## 1. The trust gap in U.S. economic terms

Estimates of dead-weight loss from trust failures in the U.S. economic
system. All figures are **annual, U.S. only, order-of-magnitude**.

| Sector | Annual cost of trust gap | Source / method |
|---|---:|---|
| Healthcare administrative overhead (verification, audit, billing dispute) | $500B | Himmelstein, Campbell & Woolhandler, *Annals of Internal Medicine* 2020 ("Health Care Administrative Costs in the United States and Canada, 2017"); Cutler, NEJM 2018 estimate of ~$265B for billing & insurance-related costs alone |
| Public procurement waste & fraud | $200–500B | OECD estimate that ~10–30% of public-contract value is lost to corruption/fraud/waste globally; applied to U.S. federal + state procurement spending (~$2T/yr) yields the upper band |
| Insurance fraud (excl. healthcare) | $300B | FBI estimate of ~$40B for non-health insurance fraud; National Health Care Anti-Fraud Association (NHCAA) places healthcare fraud at $68B–$272B; combined upper-band cited by Coalition Against Insurance Fraud |
| Drug-trial cost inflation from audit / monitoring redundancy | $40B | Sertkaya et al. 2016 (HHS-funded) put avg per-trial cost at $19M–$53M; ~10–15% of that is monitoring/auditing; applied across ~5,000 industry-sponsored trials/yr in the U.S. |
| Scientific reproducibility waste | $15–25B | Freedman, Cockburn & Simcoe, *PLOS Biology* 2015 ("The Economics of Reproducibility in Preclinical Research") — estimated ~$28B/yr in U.S. preclinical irreproducibility; we discount to reflect that not all of this is trust-gap-addressable |
| Title / escrow / third-party verification friction | $100–200B | American Land Title Association reports ~$22B/yr in title-insurance premiums alone; total real-estate verification friction (escrow, title, notary, recording) extrapolates to the upper band |
| Election / governance dispute drag | $50–200B | Highly contested; lower band from direct costs (recount, litigation, audit) per Brennan Center; upper band attempts to value reduced civic trust per Putnam-style social-capital analyses |

**Total addressable trust gap (U.S. only): ~$1.2–1.8 trillion / year.**

Bounds:
- **Low bound (~$1.0T)** if all sector estimates are at their lower end
  AND only ~60% of each sector's trust cost is *addressable* by
  cryptographic publication (the rest being human-process trust gaps
  that no protocol can touch).
- **High bound (~$1.8T)** if all sector estimates are at their upper
  end AND ~80% of each is in-principle addressable.

These bounds are not tight. Treat them as "in the trillions, in the U.S.,
in any reasonable analysis," not as a forecast.

### What this is NOT

- Not a global figure. Global trust gap is plausibly 3–5× the U.S.
  figure; this calculator stays U.S.-anchored because U.S. sectoral
  data is the most studied.
- Not GDP impact. Eliminating trust friction does not add to GDP
  one-for-one; some of the "wasted" spending is real wages paid to
  real auditors.
- Not what adoption of myriam-kit would capture. See §3.

---

## 2. Conversion to lives saved

We use GiveWell's recurring ~$5,000-per-life-saved figure from its top
charities (Against Malaria Foundation, Helen Keller International,
Malaria Consortium, New Incentives — figures consistent across the
2019–2025 reporting cycle).

**$1B captured ≈ 200,000 statutory-life-saved equivalents at the global-
health margin.**

If that conversion is incorrect by 2× (i.e. the marginal cost is closer
to $10,000/life), the figure is 100,000 lives per $1B. The lives-saved
column in §3 uses the GiveWell figure; halve it if you prefer the more
conservative number.

### Critical caveat

Dollar-saved in the U.S. is **not the same** as dollar-spent on global
health. The conversion is valid ONLY IF the dollars saved by reducing
the trust gap are actually reallocated to high-marginal-impact health
spending. They almost certainly will not be. Treat lives-equivalent as
an **upper-bound moral-significance multiplier**, not a forecast of
actual lives saved. The right reading is: *"if these dollars were spent
on the highest-impact global-health intervention available, that's how
many statistical lives would be saved."*

---

## 3. Per-kit estimates

For each worked example in `examples/`, the table below estimates:

- **Addressable market**: a conservative dollar figure for the slice of
  trust-gap spending the kit could in principle reduce.
- **Capture rate**: low / mid / high scenarios for what fraction of that
  market is actually addressed if the kit is adopted at the indicated
  penetration.
- **Annual savings**: addressable × capture × adoption.
- **Lives-equivalent**: annual savings ÷ $5,000.

All scenarios assume **1% adoption of the addressable market**. The kit
is one of many possible tools; 1% is a defensible "is this nontrivial"
floor, not a forecast.

### 3.1 vaccine-batch-attestation

Addressable: pharma recall investigation cost + regulator audit cost.
FDA inspectional findings cycle, plus industry recall remediation
(Tylenol-era benchmark: a single major recall is ~$100M; baseline
~50 biological-product recalls/yr in the U.S.).

| Scenario | Capture per sealed batch | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $1k / batch | $5M | 1,000 |
| Mid | $25k / batch | $125M | 25,000 |
| High | $200k / batch (one recall avoided across program) | $1B | 200,000 |

Assumption: ~50,000 commercial batch releases/yr in U.S. biologics;
1% sealing = 500 batches.

### 3.2 drug-trial-preregistration

Addressable: meta-analyst re-audit cost, retraction-driven loss, post-hoc
endpoint litigation. Per-trial value of an unfalsifiable pre-registration
estimated from Sertkaya 2016 monitoring slice.

| Scenario | Capture per sealed trial | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $50k | $2.5M | 500 |
| Mid | $500k | $25M | 5,000 |
| High | $5M (single retraction-prevented) | $250M | 50,000 |

Assumption: ~5,000 industry trials/yr in U.S.; 1% = 50 sealed trials.

### 3.3 election-tally-precertification

Addressable: post-certification recount, litigation, public-trust
remediation. Brennan Center estimates ~$50M direct cost per
seriously-contested cycle; civic-trust cost much higher and contested.

| Scenario | Capture per sealed precinct | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $100 / precinct | $180k | 36 |
| Mid | $2k / precinct | $3.6M | 720 |
| High | $50k / precinct (one major dispute averted) | $90M | 18,000 |

Assumption: ~180,000 U.S. precincts; 1% = 1,800 sealed precincts.

### 3.4 ai-model-card

Addressable: post-release safety-claim disputes, regulatory enforcement
under EU AI Act / future U.S. analogs, customer-trust audit.
Hard to bound; conservative estimate based on ~100 frontier model
releases/yr globally.

| Scenario | Capture per sealed release | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $10k | $10k | 2 |
| Mid | $1M | $1M | 200 |
| High | $100M (one liability claim averted) | $100M | 20,000 |

Assumption: ~100 frontier releases/yr; 1% = 1 sealed release.
Per-release value is high-variance because liability outcomes are
high-variance.

### 3.5 whistleblower-manifest

Addressable: source-protection legal cost + lost-document remediation.
Per-incident cost benchmarks from existing journalism-defense funds
(~$50k–$2M per significant case).

| Scenario | Capture per sealed drop | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $5k | $50k | 10 |
| Mid | $100k | $1M | 200 |
| High | $1M | $10M | 2,000 |

Assumption: ~1,000 significant whistleblower disclosures/yr in U.S.;
1% = 10 sealed manifests.

### 3.6 scientific-reproducibility

Addressable: Freedman 2015's $28B preclinical-irreproducibility figure.
Sealing pipelines + data hashes is necessary-not-sufficient for
reproducibility but moves the forensic burden onto the original lab.

| Scenario | Capture per sealed paper | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $1k | $1M | 200 |
| Mid | $20k | $20M | 4,000 |
| High | $200k | $200M | 40,000 |

Assumption: ~1M U.S. peer-reviewed publications/yr (Scopus); 1% = 10,000
sealed reproducibility manifests.

### 3.7 court-evidence-custody

Addressable: chain-of-custody disputes, suppression motions, evidence
re-acquisition cost. ~5M criminal cases/yr in U.S. state courts;
chain-of-custody is challenged in a small minority.

| Scenario | Capture per sealed exhibit | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $200 | $1M | 200 |
| Mid | $5k | $25M | 5,000 |
| High | $50k | $250M | 50,000 |

Assumption: ~500k digital exhibits/yr where sealing would be in-shape;
1% = 5,000 sealed exhibits.

### 3.8 public-spending-attestation

Addressable: per OECD, 10–30% of public procurement value is lost to
corruption/fraud/waste. Even a small reduction is large in absolute
terms because the denominator is ~$2T/yr U.S. public procurement.

| Scenario | Capture per sealed-monthly municipality | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $50k / yr | $5M | 1,000 |
| Mid | $500k / yr | $50M | 10,000 |
| High | $5M / yr | $500M | 100,000 |

Assumption: ~100 U.S. municipalities >100k population that publish
detailed monthly procurement; 1% = 1 municipality (so this table is
really "per pioneer adopter"). Scale linearly if more adopt.

### 3.9 supply-chain-audit-attestation

Addressable: supplier-audit redundancy + recall remediation in complex
supply chains. Heavily understudied; estimates extrapolated from
ISO 9001 audit cost per facility ($5k–$50k/yr).

| Scenario | Capture per sealed facility-year | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $2k | $2M | 400 |
| Mid | $20k | $20M | 4,000 |
| High | $200k | $200M | 40,000 |

Assumption: ~100k ISO-9001-certified U.S. facilities; 1% = 1,000 sealed
facilities.

### 3.10 food-safety-attestation

Addressable: foodborne-illness outbreak investigation + recall cost.
CDC estimates 48M foodborne illnesses/yr in U.S. (~$15.6B economic
cost per Scharff 2012). Outbreak-attribution cost is a fraction of that.

| Scenario | Capture per sealed facility-batch | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $100 / batch | $5M | 1,000 |
| Mid | $2k / batch | $100M | 20,000 |
| High | $20k / batch | $1B | 200,000 |

Assumption: ~5M FDA-regulated facility-batch events/yr; 1% = 50,000
sealed batches.

### 3.11 carbon-attestation

Addressable: greenwashing-litigation cost + voluntary-carbon-market
verification redundancy. Voluntary carbon market is ~$2B/yr (2024) with
~10–30% of credit value challenged in due diligence (per Sylvera,
BeZero ratings disputes).

| Scenario | Capture per sealed offset project | Annual savings @1% adoption | Lives-equivalent |
|---|---:|---:|---:|
| Low | $1k | $200k | 40 |
| Mid | $20k | $4M | 800 |
| High | $200k | $40M | 8,000 |

Assumption: ~20,000 active offset projects globally; 1% = 200 sealed
projects.

### 3.12 Totals across all kits

Summing the per-kit mid-scenario estimates: **~$375M / yr annualized
savings at 1% adoption, ~75,000 lives-equivalent / yr**.

Summing the high-scenario estimates: **~$3.6B / yr, ~720,000
lives-equivalent / yr**.

These are 1%-adoption figures. Scale linearly to 10% (~$3.7B mid,
~$36B high) and recall that the U.S. trust gap §1 quantified is in
the **trillions**, so even high-adoption myriam-kit captures less than
1% of the total trust gap. The kit is one tool among many.

---

## 4. Sealing cost per artifact

Direct cost to seal one MYRIAM artifact:

- **Bitcoin OTS stamping**: $0 (calendar operators run free public
  service; on-chain anchor amortized across ~1k stamps per block).
- **IPFS pinning** (local node): $0.
- **IPFS pinning** (commercial pinning service, e.g. Pinata, Web3.Storage):
  ~$0.05 / GB / month at retail; a typical kit publication is <100KB,
  so ~$0.000005 / month.
- **Human time**: ~10–60 minutes per publication for review, fact
  curation, refusal-gate check.

At U.S. median knowledge-worker fully-loaded rate (~$100/hr), a
sealed publication costs **~$15–$100 in human time and effectively
zero in infrastructure**.

Adoption is not bottlenecked by cost. It is bottlenecked by *attention*
and *organizational permission to publish facts in cryptographically
unrevisable form*.

---

## 5. Honest limits

- **These are not promises.** They are upper bounds on plausible impact.
  Adoption gates everything. The kit being available ≠ the kit being used.

- **Adoption is the bottleneck.** A publication kit with zero marginal
  cost can still see <0.1% adoption if no decision-maker in the relevant
  org sees publishing as their job. Every estimate in §3 assumes 1%
  adoption; 0.01% is also plausible.

- **Dollar-to-lives conversion is contested.** GiveWell's ratio is a
  global-health number derived from RCT-grade interventions in low- and
  middle-income countries. U.S. dollar savings don't transfer 1:1 to
  global-health interventions unless those savings are *actually
  re-allocated* to GiveWell-tier work. They almost never will be. Treat
  the lives-equivalent column as a moral-significance index, not a
  prediction.

- **The estimates double-count across kits at the sector level.** A
  hospital that adopts both vaccine-batch-attestation and food-safety-
  attestation captures *less than the sum* of the per-kit values, because
  some of the audit overhead is shared. The §3.12 totals are sums of
  marginal kits and should be discounted for overlap (~10–30%) when
  reasoning about a single adopter.

- **The refusal-gate ensures the math doesn't lie about itself.** A
  sealed fraudulent attestation produces a permanent record *of fraud*,
  not of legitimacy. The protocol attests to what was published, not
  to what is true (SPEC §9). If the addressable trust gap is reduced by
  sealing fraudulent claims with confidence, the gap re-emerges as
  recall, retraction, and litigation after the fraud is discovered. The
  sealing is then evidence *against* the publisher. The calculator
  assumes adopters are publishing claims they could defend at sealing
  time; bad-faith adopters worsen their position, not improve it.

- **Sigsum / Sigstore / Rekor are also free.** This calculator is not
  arguing myriam-kit is uniquely valuable. The trust-gap dollars in §1
  are addressable by *any* credible cryptographic-publication
  infrastructure. The kit's contribution is *removing the activation
  energy* for non-developer publishers; see [COMPARISON.md](COMPARISON.md).

- **Adverse adoption is possible.** A municipality could seal padded
  procurement totals just as easily as accurate ones. The refusal-gate is
  enforced by humans, not by the protocol. If the adopting party is
  themselves the fraudster, sealing accelerates discovery (good) but
  does not prevent the original fraud (bad). The calculator's mid-
  scenario figures assume good-faith adoption at the median.

- **Lives saved is not the only frame.** A reduced trust gap also buys
  legitimacy, faster regulatory cycles, lower litigation drag, less
  political-polarization-as-side-effect-of-disputed-facts. None of those
  are valued here. The lives frame is included because it forces a
  scale comparison; it is not the only valid frame.

---

## 6. How to run your own number

The conservative reader should:

1. Pick the kit closest to your domain in §3.
2. Replace the addressable-market assumption with the slice of your
   organization or sector you actually believe will adopt within 3 years.
3. Replace the capture-per-event assumption with your organization's
   actual recurring audit / dispute / re-verification cost per event.
4. Multiply.
5. Divide by $5,000 (or $10,000 if you prefer GiveWell's conservative
   margin) to get lives-equivalent.
6. Compare to the sealing cost (~$15–$100 per publication, §4).
7. If the ratio is >100×, seal. If it is <10×, the kit is not your
   bottleneck and you should ask why.

The calculator is meant to be **disconfirmable**. Disagree with any
estimate? Recompute the row with your own numbers. The point is not
this document's totals; the point is that the *back-of-envelope shape*
of the trade-off is favorable for adopters in most cases the kit was
designed for.

---

## 7. References

- Himmelstein DU, Campbell T, Woolhandler S. "Health Care Administrative
  Costs in the United States and Canada, 2017." *Annals of Internal
  Medicine* 2020; 172(2): 134–142.
- Cutler DM. "What is the U.S. Health Spending Problem?" *Health Affairs*
  2018; 37(3): 493–497. (~$265B BIR estimate.)
- Sertkaya A, Wong H-H, Jessup A, Beleche T. "Key cost drivers of
  pharmaceutical clinical trials in the United States." *Clinical
  Trials* 2016; 13(2): 117–126.
- Freedman LP, Cockburn IM, Simcoe TS. "The Economics of Reproducibility
  in Preclinical Research." *PLOS Biology* 2015; 13(6): e1002165.
- Scharff RL. "Economic Burden from Health Losses Due to Foodborne
  Illness in the United States." *Journal of Food Protection* 2012;
  75(1): 123–131.
- Bowles S, Gintis H. "Social Capital and Community Governance."
  *Economic Journal* 2002; 112(483): F419–F436. (Trust as economic
  input — theoretical underpinning for treating trust gap as a cost.)
- GiveWell, "Top Charities" (recurring annual report; ~$5k/life saved
  consensus 2019–2025). https://www.givewell.org/charities/top-charities
- OECD, "Preventing Corruption in Public Procurement." 2016. (10–30%
  loss figure.)
- NHCAA / FBI / Coalition Against Insurance Fraud. (Insurance-fraud
  estimates.)
- CMS HRRP (Hospital Readmissions Reduction Program) annual reports.
- Brennan Center for Justice. "The Cost of Elections" series.
- American Land Title Association. Industry premium data.
- Sylvera, BeZero. Voluntary-carbon-market rating dispute analyses.

All references are cited for the *factual basis* of the order-of-
magnitude figures, not as endorsements of myriam-kit. None of the cited
authors or organizations have endorsed this kit or its conclusions.

---

*This page is CC0 / public domain. Recompute, republish, fork freely.*
