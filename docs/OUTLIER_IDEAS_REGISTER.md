# Outlier Ideas Register

*Wacky-but-cheap-to-test paths to life-saving the kit could enable.*

This is a public scratchpad. None of these are validated. Most won't
work. A few might. The point is to register them publicly so:

1. **Someone can falsify each one cheaply** instead of all of us
   converging on the same boring four use cases.
2. **Combinations get explored** — most of these are weak alone but
   stronger combined.
3. **The cost of being wrong is low** — markdown is cheap. The cost
   of not exploring is missed lives.

Each entry has: idea, why it might work, why it might not, cheapest
test, lives-equivalent if it lands.

---

## 1. Reverse legitimacy scoreboard

**Idea:** Publish [REFUSAL_SCOREBOARD.md](REFUSAL_SCOREBOARD.md) — a
registry of who refuses to seal. Refusal becomes the signal.

**Might work because:** flips adoption economics from "we need to
convince institutions" to "institutions need to defend their refusal."
The kit is CC0, free, low-risk; the only reason to refuse is something
they don't want made public.

**Might not work because:** scoreboards get ignored. Nominations might
not arrive. Institutions might successfully argue "we're considering
it" forever.

**Cheapest test:** publish the scoreboard. **DONE** (this commit).

**Lives if it lands:** unbounded — every institution that flips to
sealing under reputational pressure contributes lives saved through
reduced trust gap.

---

## 2. AI self-binding cascade

**Idea:** AI labs (Anthropic, OpenAI, DeepMind, Meta, Google) publish
sealed model-card commitments. First-mover gets a legitimacy boost;
followers face "what are you hiding?" pressure.

**Might work because:** labs already publish model cards. Adding
cryptographic permanence is cheap and signals capability + integrity.
The kit becomes part of AI safety governance without waiting for
regulators.

**Might not work because:** labs may prefer to keep model commitments
revisable. The "we'll iterate" defense is strong.

**Cheapest test:** produce a model-card kit ready to fork. **DONE**
(`examples/ai-model-card/`). Next step: one direct ask to one lab.

**Lives if it lands:** AI safety has long-tail catastrophic potential;
mechanically-detectable lab commitments could be civilization-scale.

---

## 3. Insurance premium reduction lever

**Idea:** Reinsurance riders / ESG fund inclusion criteria / bond
covenants that price-in sealed-vs-unsealed risk. One actuary adopts
→ premiums move → adoption follows the money.

**Might work because:** insurance pricing already differentiates on
verifiable governance. A hospital that seals readmissions has lower
litigation risk; that's a real number.

**Might not work because:** actuaries need decades of data. The kit is
too new to have priced risk reduction.

**Cheapest test:** write a one-pager an actuary could hand to
underwriting. Status: not yet written.

**Lives if it lands:** insurance is a ~$1T US market; even 1bp of
adoption-driven premium reduction = millions of lives at $5K/life.

---

## 4. AI-on-AI verification market

**Idea:** As LLM agents proliferate, they need cryptographic
attestations of inputs/outputs. Build a tiny market protocol where AI
agents pay tiny amounts for verifiable claims.

**Might work because:** agent-to-agent commerce is genuinely emerging
(2026); existing trust mechanisms don't scale to agent volume.

**Might not work because:** agents might converge on lighter-weight
attestation (just OAuth or DIDs).

**Cheapest test:** Claude-to-Claude demo: one agent sells a sealed
claim, another verifies. Status: not yet written.

**Lives if it lands:** indirect but compounds — agent-to-agent fraud
prevention scales with agent population.

---

## 5. Drone-strike target attestation

**Idea:** Sealed intelligence-used-for-strike records. Civilian casualty
disputes turn on "what did the operator know at strike time."

**Might work because:** post-strike review processes already exist;
making them tamper-evident is incremental.

**Might not work because:** classified data can't be publicly sealed.
Internal-only sealing has weaker accountability properties.

**Cheapest test:** write the kit anyway — even classified-internal use
matters. Status: not yet written.

**Lives if it lands:** disputed civilian casualty estimates run in the
thousands per year; forcing intelligence-quality re-evaluation could
prevent a fraction.

---

## 6. Vaccine cold-chain attestation

**Idea:** Sealed temperature logs throughout cold chain. Spoilage from
cold-chain failure kills people in low-resource settings.

**Might work because:** sensors are cheap; logging is already standard;
making it cryptographically auditable is incremental.

**Might not work because:** adoption requires sensor-vendor cooperation
and may face data-quality issues.

**Cheapest test:** kit + sample sensor-data ingest format. Status: not
yet written.

**Lives if it lands:** vaccine wastage in LMICs is 5-50% depending on
country; even 1pp reduction = hundreds of thousands of effective doses
= meaningful lives.

---

## 7. 911-call attestation

**Idea:** Sealed record of every emergency call BEFORE dispatch.
Prevents "the call never happened" lawsuits and dispatch-time gaming.

**Might work because:** 911 systems already log everything; sealing is
incremental.

**Might not work because:** PSAPs are conservative and risk-averse;
adoption needs FCC or state mandate.

**Cheapest test:** kit. Status: not yet written.

**Lives if it lands:** ~240M 911 calls/year in US; even tiny percentage
of dispute-driven delays affects survival outcomes for time-critical
emergencies.

---

## 8. Generic drug bioequivalence attestation

**Idea:** Sealed bioequivalence test data + manufacturing batch
attestation. Generic-drug quality scandals (Ranbaxy, Nostrum) killed
people through silent quality fade.

**Might work because:** FDA already requires the data; the kit just
makes silent post-approval revision detectable.

**Might not work because:** generics manufacturers may resist
visibility.

**Cheapest test:** kit. Status: not yet written.

**Lives if it lands:** generic drug quality affects billions of doses
annually; even tiny quality-fade prevention is large.

---

## 9. Hospital sentinel-event attestation

**Idea:** Sealed "never event" reports at moment-of-reporting. Joint
Commission sentinel-event reporting is notoriously gamed via post-hoc
reclassification.

**Might work because:** the Joint Commission's process is already in
place; sealing is additive.

**Might not work because:** hospitals have strong incentives to keep
events reclassifiable.

**Cheapest test:** kit, similar to hospital-readmission-attestation.
Status: not yet written.

**Lives if it lands:** ~440K Americans/year die from preventable
medical errors; even 1% prevention via auditable sentinel events =
4,400 lives/year.

---

## 10. Truth-vesting equity

**Idea:** Smart contract where people stake on truth of an attestation.
Stakers lose if proven false within N years; earn if it holds.

**Might work because:** prediction markets work for binary outcomes;
attestation truth is similar.

**Might not work because:** measurement and adjudication are hard. Who
decides if a claim was "true"?

**Cheapest test:** specify the protocol in markdown without
implementing the smart contract. Status: not yet written.

**Lives if it lands:** unclear — depends on whether the market becomes
liquid.

---

## 11. Asylum claim evidence attestation

**Idea:** Sealed evidence packets at moment of asylum claim. Prevents
silent record disposal during adjudication.

**Might work because:** asylum claimants currently have no leverage
when records "disappear."

**Might not work because:** adoption needs cooperation from immigration
NGOs and/or asylum-receiving governments.

**Cheapest test:** kit. Status: not yet written.

**Lives if it lands:** ~200K asylum decisions/year in US; small
fraction of rejected-for-record-loss cases = lives saved.

---

## 12. AI training-data provenance

**Idea:** Sealed "this dataset came from these consent-granted
records." Pre-empts copyright lawsuits and consent disputes.

**Might work because:** EU AI Act will require this anyway; first
movers get compliance head start.

**Might not work because:** labs may prefer to keep training data
opaque.

**Cheapest test:** kit. Status: not yet written.

**Lives if it lands:** indirect — better-grounded AI = fewer
hallucination-driven medical/legal errors.

---

## 13. Open-source maintainer attestation

**Idea:** Sealed "maintainer X reviewed this commit and approves."
Prevents xz-utils-style supply chain attacks.

**Might work because:** GitHub Actions integration is straightforward;
projects increasingly adopt provenance.

**Might not work because:** Sigstore already does much of this. Need
to specify the additive value.

**Cheapest test:** GitHub Action that wraps myriam-kit for commit
attestation. Status: not yet written.

**Lives if it lands:** supply chain compromises can cascade; xz-style
attacks could have caused massive infrastructure damage.

---

## 14. Hospital medication administration record (MAR) attestation

**Idea:** Sealed MAR entries at moment of administration. Prevents
post-incident chart alteration when wrong-dose / wrong-drug events
occur.

**Might work because:** MAR systems already exist; sealing is
incremental.

**Might not work because:** hospital IT departments are conservative.

**Cheapest test:** kit. Status: not yet written.

**Lives if it lands:** medication errors kill ~7000-9000 Americans/yr;
auditable MAR could prevent silent post-event alteration in fraction
of cases.

---

## 15. Climate sensor data attestation

**Idea:** Sealed amateur climate sensor data. Climate denial often
turns on "the data was fudged." Cryptographic attestation makes
amateur measurements harder to dismiss.

**Might work because:** sensor networks exist (PurpleAir, etc.);
sealing makes the data legally citable.

**Might not work because:** climate policy is gated on political will,
not data quality.

**Cheapest test:** kit + PurpleAir or equivalent integration. Status:
not yet written.

**Lives if it lands:** indirect — faster climate policy = lives saved
on multi-decade timescale.

---

## How to contribute

Open a PR adding an entry. Required fields:
- Idea (one sentence)
- Why it might work
- Why it might not
- Cheapest test (what's the minimum artifact to falsify or validate?)
- Lives-equivalent estimate if it lands (rough order of magnitude)

No idea is too wacky if the test is cheap.

---

## License

Public domain (CC0 1.0 Universal). Fork it. Add ideas. The cost of
exploration is markdown; the cost of not exploring is lives.
