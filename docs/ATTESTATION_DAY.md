# Attestation Day

*A once-yearly coordination event for trust-evidence adoption.*

The kit's adoption is bottlenecked on collective action. Any one
institution that seals first faces a "why is only us doing this?"
disadvantage. If many seal simultaneously, none stands out.

Attestation Day is a coordination mechanism. Once a year, on the same
day, every institution that has committed to sealing publishes its
relevant attestations together. The same-day publication creates safety
in numbers and a publicly auditable adoption rate.

---

## When

**Proposed: every May 21**, the anniversary of the MYRIAM protocol's
first instantiation at disclosure.host. Easy to remember; not tied to
any commercial calendar; falls outside fiscal year-end pressure.

Alternative proposals welcome. The exact date matters less than the
fact of synchrony.

---

## How a participating institution commits

1. **Public pledge** — institution publishes a note (blog post, press
   release, board minute) stating they will publish a sealed attestation
   on Attestation Day, with the kit category and the cadence.
2. **Pre-Day sealing window** — institution prepares the attestation
   facts in the 30 days preceding Attestation Day.
3. **Day-of sealing** — institution runs `bash build/seal.sh` and
   publishes the resulting Merkle root + IPFS CID + OTS receipt on
   their public-facing website.
4. **Public listing** — institution adds itself (or is added by a
   third party) to `docs/ATTESTATION_DAY_PARTICIPANTS.md` in this
   repo, with a link to their published seal.

---

## Why this works

- **Same-day publication** makes the adoption rate publicly auditable.
  On May 22 you can count who participated and who didn't.
- **Same-date repetition** creates year-over-year diffing. Each year's
  sealed roots can be compared against the previous year's. Silent
  revisions become detectable across the entire participating
  ecosystem.
- **Coordination defeats first-mover disadvantage.** No institution
  stands alone.
- **Refusal becomes visible** — institutions that pledged then failed
  to publish are immediately obvious.

---

## Suggested first-year participants

Without limiting who can participate, the kit's worked examples suggest
domains where Attestation Day publication would be high-value:

| Domain | Suggested cadence | Suggested participants |
|---|---|---|
| Hospital readmissions | Annual + monthly | Magnet hospitals, AMC consortia |
| Drug trial pre-registration | Per trial | Major sponsors (Pfizer, J&J, Merck, GSK, AZ, Novartis) |
| AI model cards | Per major release | Frontier labs (Anthropic, OpenAI, Google, Meta, DeepMind) |
| Election certifications | Per election | Boards of Canvassers, state election authorities |
| Public spending | Quarterly | County procurement offices, state auditors |
| Vaccine batches | Per release lot | Manufacturer QA + national regulator |
| Police body-cam | Per shift / per incident | Departments under DOJ consent decree |
| FDA inspections | Per inspection close | District offices |
| Insurance claims | Per claim decision | Carriers under DOI enforcement watch |
| Court evidence | Per evidence intake | Forensic labs, public defender offices |
| Scientific reproducibility | Per submitted paper | Top journals, NIH-funded labs |

---

## What Attestation Day does NOT do

- **Doesn't validate the underlying claims.** Same load-bearing limit as
  every other kit artifact: the seal anchors what was attested, not its
  truth.
- **Doesn't prevent non-participation.** Institutions can simply not
  pledge. The signal value comes from the contrast between those who
  did and those who didn't.
- **Doesn't require central authority.** Anyone can declare their own
  Attestation Day. The coordination value comes from synchrony, not
  authorization.
- **Doesn't compel the published seals to be useful.** An institution
  could pledge to seal a trivial fact. The kit-specific refusal-gates
  and the public's judgment provide the quality floor.

---

## How to launch

1. Pick a date (proposed May 21).
2. Persuade 2-3 institutions to publicly pledge first.
3. Publish [docs/ATTESTATION_DAY_PARTICIPANTS.md](ATTESTATION_DAY_PARTICIPANTS.md)
   listing pledgers.
4. As the day approaches, organize community press around the
   participating institutions.
5. On the day, publish the consolidated list of sealed Merkle roots
   from all participants. This becomes the year's adoption snapshot.
6. Next year, repeat. The diff becomes the year-over-year integrity
   audit.

---

## Why I'm publishing this without a launch

The launch mechanism is the slow part. The text describing the
mechanism is the cheap part. By publishing the mechanism first, I
de-couple the idea from my own throughput: anyone can adopt and
launch it.

If you want to organize the first Attestation Day, open an issue on
this repo or just do it. There is no authority. The protocol is the
authority.

---

## License

Public domain (CC0 1.0 Universal). Fork it. Run your own Attestation
Day. The point is the coordination, not the credit.
