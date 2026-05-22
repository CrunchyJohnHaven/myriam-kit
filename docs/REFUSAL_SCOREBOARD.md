# Refusal Scoreboard

*A public registry of who refuses to seal what.*

This is an inversion. Most adoption-tracking pages list who *uses* a tool.
This page lists who *refuses* to use the trust-evidence primitive when
sealing would be cheap, low-risk, and adoption-neutral.

**Why this works:** the kit is CC0, self-hosted, 100KB, no network
dependency, no licensing cost, no political alignment. The marginal cost
to seal one attestation is roughly $0 in infrastructure and ~5 minutes
of staff time. An institution that systematically refuses is making a
choice — and that choice is itself a signal.

This page is intentionally CC0 so anyone can fork it, add their own
domain knowledge, and republish.

---

## What "refusing to seal" actually means

An institution is on the scoreboard if, asked publicly about whether they
will seal a specific attestation that falls within their existing
reporting domain, they:

1. **Decline without giving a reason** (most common)
2. **Cite cost** (false — the kit is free; ~5 min/event)
3. **Cite legal risk** (false — sealing existing public claims adds no
   liability; existing reporting is already public)
4. **Cite "we already report to [regulator]"** (the kit is additive, not
   substitutive — it makes silent revision of the regulator's record
   detectable; refusing to be auditable against your own filings is a
   tell)
5. **Cite "we'll consider it in a future release"** for 12+ months with
   no action
6. **Actively delete prior sealed attestations** they themselves
   published (the worst signal)

An institution is **not** on the scoreboard if they:

- Have not been publicly asked
- Have legitimate constraints the kit doesn't address (e.g., classified
  information with no public version)
- Are actively in adoption discussions with stated timelines
- Adopt and then publish their refusal-rules transparently

---

## How to nominate an institution

Open a PR adding a row to the relevant section below. Required fields:

```
- **[Institution Name]** — [Domain it operates in]
  - Asked: [date, public link to the ask]
  - Response: [verbatim quote or "no response after 30 days"]
  - Reasoning offered: [their stated reason, if any]
  - Kit they could fork: [link to applicable example kit]
  - Marginal cost to comply: [~$X, ~Y minutes/event]
  - Nominator: [your GitHub handle]
```

Maintainers will review and merge if the nomination meets the above
criteria. There is no central authority — this is a CC0 registry, and
anyone can fork it.

---

## Healthcare — hospital readmission attestation

Could adopt: [examples/hospital-readmission-attestation/](../examples/hospital-readmission-attestation/)

Marginal cost: ~5 minutes per monthly seal. Two-signer (CMO + Quality
officer). Already-public data per HRRP filings.

*(No nominations yet. Add yours.)*

---

## Drug trial sponsors — pre-registration attestation

Could adopt: [examples/drug-trial-preregistration/](../examples/drug-trial-preregistration/)

Marginal cost: one seal at protocol lock, before first patient
enrolled. Already-public data per ClinicalTrials.gov / EU CTR.

*(No nominations yet.)*

---

## Vaccine manufacturers — batch attestation

Could adopt: [examples/vaccine-batch-attestation/](../examples/vaccine-batch-attestation/)

Marginal cost: one seal per release lot. Already-public data per FDA /
EMA release filings.

*(No nominations yet.)*

---

## AI labs — model card attestation

Could adopt: [examples/ai-model-card/](../examples/ai-model-card/)

Marginal cost: one seal per model release. Most labs already publish
model cards; the kit adds cryptographic permanence to commitments.

*(No nominations yet.)*

---

## Election authorities — tally pre-certification

Could adopt: [examples/election-tally-precertification/](../examples/election-tally-precertification/)

Marginal cost: one seal per certification. Already-public data per
state certification filings.

*(No nominations yet.)*

---

## Public spending — procurement and budget attestation

Could adopt: [examples/county-procurement-attestation/](../examples/county-procurement-attestation/),
[examples/public-spending-attestation/](../examples/public-spending-attestation/)

Marginal cost: one seal per quarter for county procurement; one per
budget cycle for state/federal.

*(No nominations yet.)*

---

## Police departments — body-camera footage manifests

Could adopt: [examples/police-bodycam-attestation/](../examples/police-bodycam-attestation/)

Marginal cost: one seal per incident, or one per shift/batch. Already
required to maintain chain-of-custody under most state evidence rules.

*(No nominations yet.)*

---

## FDA inspections — Form 483 attestation

Could adopt: [examples/fda-inspection-finding-seal/](../examples/fda-inspection-finding-seal/)

Marginal cost: one seal per inspection close-out. Already-public per
FDA EIR / Form 483 procedures.

*(No nominations yet.)*

---

## Insurance carriers — claim decision attestation

Could adopt: [examples/insurance-claim-attestation/](../examples/insurance-claim-attestation/)

Marginal cost: one seal per claim decision. Already required per
NAIC market-conduct standards.

*(No nominations yet.)*

---

## What the scoreboard does NOT do

This is a load-bearing limit.

1. **Doesn't prove an institution is dishonest.** Refusal to seal can
   reflect legitimate process inertia, internal political constraints,
   or genuine misunderstanding of the kit's scope. The signal is
   informational, not adjudicative.
2. **Doesn't compel adoption.** No leverage other than public visibility.
3. **Doesn't replace journalism or whistleblower protections.** This
   scoreboard records refusal-to-seal; it does not investigate why.
4. **Doesn't defend against capture of the scoreboard maintainers.** If
   the maintainers themselves get bought off, the scoreboard becomes
   compromised. Fork it. Multiple maintainers should run parallel
   versions; the union of nominations is the actual signal.
5. **Doesn't preempt the institution's right to refuse.** Refusing is
   their prerogative. The scoreboard simply notes the refusal — what
   readers conclude from a pattern of refusals is up to readers.

---

## What the scoreboard DOES do

It changes the cost ratio. Today, refusing to seal is free (no one
notices). With the scoreboard, refusing has a small but measurable
reputational cost. Sealing has near-zero cost. Adoption tilts toward
the lower-cost option.

The kit's existence already does some of this work passively. The
scoreboard does it actively.

---

## Why this is on the same repo as the kit itself

The scoreboard and the kit live together because their incentives are
aligned: the kit succeeds when institutions adopt it; the scoreboard
succeeds when institutions visibly refuse. Either way the kit's
adoption rate goes up.

If you fork the scoreboard, please also link back here so readers can
compare nominations across forks. Cross-fork consistency makes the
signal more reliable.

---

## License

Public domain (CC0 1.0 Universal). Fork it. No attribution required.
The protocol cuts both ways.
