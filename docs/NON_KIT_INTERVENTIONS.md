# Non-Kit Life-Saving Interventions

*Outlier ideation that drops the cryptographic-kit constraint.*

The myriam-kit family addresses the trust-gap branch of preventable death.
But trust-gap is one branch. The longer tail of life-saving paths includes
direct service interventions that don't require any cryptographic
primitive.

This document catalogues 10 such interventions, framed cheap-to-test, so
that the kit's repo can serve as a coordination point for life-saving
work beyond the kit itself.

Each entry: idea, why it might work, cheapest test, lives if it lands.

---

## 1. AI nurse for rural night shifts

**Idea:** Most preventable hospital deaths happen on under-staffed night
shifts when one nurse covers many patients. An AI agent watching cheap
vitals sensors + SMS-alerting the one on-call human reduces missed-
detection events.

**Why it might work:** alerting (not diagnosis) is regulatorily
unconstrained. Sensors are cheap. The bottleneck is the agent's
configuration to a specific hospital's protocols.

**Cheapest test:** prototype with one rural hospital. Use existing
patient-monitoring system outputs; just add an LLM-mediated alerting
layer.

**Lives if it lands:** ~10-30% reduction in unattended deteriorations
on graveyard shifts. Across ~3,000 rural US hospitals, low-mid 4-figure
lives/year.

---

## 2. WhatsApp maternal-health advice in 50 languages

**Idea:** Most maternal deaths in LMICs are from conditions (preeclampsia,
postpartum hemorrhage, sepsis) that good information would help families
recognize. A free WhatsApp AI bot in 50 languages walks pregnant women
and their families through warning signs.

**Why it might work:** WhatsApp has near-universal penetration in LMICs.
LLMs are free at the inference budget needed for ~30 seconds of
conversation. No app install required.

**Cheapest test:** deploy in Swahili. Partner with one maternal-health
NGO in Kenya. Measure usage rate and (eventually) outcome correlations.

**Lives if it lands:** ~295,000 women die in pregnancy/childbirth/yearly.
80% in LMICs. Even 1% information-driven reduction = ~2,360 lives/year.

---

## 3. Anti-suicide AI companion

**Idea:** Most suicides happen during acute crisis windows. A free 24/7
AI companion that any depressed person can talk to, with explicit
escalation to human crisis lines when warranted, fills the gap that
crisis lines themselves cannot (long wait times, intimidation barriers,
language barriers).

**Why it might work:** the threshold to text an AI is lower than to call
a human. Crisis lines themselves are now adopting AI augmentation.

**Cheapest test:** open-source the agent. Deploy on a free domain.
Measure r/SuicideWatch usage and crisis-line referral conversion.

**Lives if it lands:** ~50,000 US suicides/year, ~800,000 globally.
Even 0.1% reduction = 50-800 lives/year.

**Critical caveats:** must NOT replace crisis lines (the kit-style
honest-limit). Must escalate aggressively. Must NOT pretend to be human.
Must NOT collect identifying data without consent. The wrong
implementation would kill people.

---

## 4. Medication adherence AI tutor

**Idea:** Non-adherence to prescribed medication kills ~125,000
Americans/year. A simple AI that calls/texts patients in their language
to walk through their pillboxes addresses the most common cause:
forgetting or confusion.

**Why it might work:** the technology is trivial. The bottleneck is
integration with a clinic's EHR. Pilot programs exist.

**Cheapest test:** pilot with one community health center. Use opt-in
patient enrollment. Measure refill adherence as the proxy outcome.

**Lives if it lands:** even 10% reduction in non-adherence-driven
mortality = 12,500 US lives/year.

---

## 5. AI-powered legal aid for asylum claimants

**Idea:** Most asylum claims fail because of legal complexity, not lack
of merit. Rejection often equals deportation to documented harm. An AI
that helps any claimant produce a competent brief — in their native
language, with appropriate case citations, in the right format — closes
the legal-representation gap.

**Why it might work:** LLMs are now capable of producing competent
immigration briefs with appropriate prompting. The bottleneck is
delivery to claimants who cannot afford lawyers.

**Cheapest test:** deploy free at one refugee-aid org's site. Track
brief submission and (eventually) outcome correlations.

**Lives if it lands:** ~50,000 deportations/year to documented dangerous
countries. Even 5% rejection reduction = 2,500 lives/year (deportation
to death is the relevant comparison).

---

## 6. $1 open-source pulse oximeter

**Idea:** Pulse oximetry is the most underused critical-care device in
low-resource settings. It's how you triage pneumonia, monitor COVID,
titrate oxygen, and detect maternal/fetal distress. Commercial units
cost $25-200. The IP barrier is zero — the optics are 70 years old.

**Why it might work:** OpenOX project and similar have shown $5 units
are feasible. Pushing to $1 requires only commodity-component selection.

**Cheapest test:** publish the design + BOM under CC0. Partner with one
maker community in a target country (Bangladesh, Nigeria) for prototyping.

**Lives if it lands:** ~2.5M annual pneumonia deaths globally, most under
5. Pulse ox-guided oxygen therapy cuts severe-pneumonia mortality by
~35%. Even 1% deployment scale-up = thousands of lives/year.

---

## 7. AI-mediated landlord-tenant negotiation

**Idea:** Most eviction-to-homelessness pipelines start with a
communication breakdown. A neutral AI mediator that helps both parties
find non-eviction solutions reduces evictions. Homelessness shortens
US life expectancy by ~20 years; preventing homelessness is preventing
death.

**Why it might work:** the AI doesn't need legal authority — just to
surface compromises both parties would accept if they could communicate
without escalation.

**Cheapest test:** deploy free at one tenant union's site. Measure
eviction filing rates among engaged tenants.

**Lives if it lands:** ~3.6M annual US eviction filings; ~580K homeless
nightly. Even small reductions in homelessness scale to meaningful
life-expectancy gains.

---

## 8. Wildfire evacuation route optimizer

**Idea:** Late or wrong evacuation kills in wildfires. A real-time
optimizer from fire spread + traffic + sensor data routes evacuees
along safer paths than the routes they default to.

**Why it might work:** the data exists (CalFire, ALERTWildfire,
traffic). The integration doesn't.

**Cheapest test:** build for one CalFire region. Partner with one
county's emergency manager.

**Lives if it lands:** ~10-30 wildfire deaths/year in California; tens
to hundreds globally. Camp Fire alone killed 85 — many trapped on
ill-routed evacuation paths.

---

## 9. Free AI translator for ER conversations

**Idea:** Language barriers kill in emergency rooms. An open-source
AI translator on every ER tablet provides instant high-quality
interpretation.

**Why it might work:** existing translators (Stratus, MARTTI) are
expensive and slow. LLMs are now medical-quality for routine ER
exchanges.

**Cheapest test:** open-source on iPhone/Android, partnered with one
safety-net hospital ER for piloting.

**Lives if it lands:** estimated 1,500-9,000 US deaths/year attributable
to language-barrier mis-triage. Even 10% reduction = 150-900 lives/year.

---

## 10. Anti-domestic-violence safety-plan AI

**Idea:** DV deaths peak at attempted exit. An AI that helps victims
compose personalized safety plans — escape route, document checklist,
shelter contacts, financial mobilization — fills the gap when no
advocate is available.

**Why it might work:** the safety-plan template exists; personalization
is the bottleneck and LLMs do that well.

**Cheapest test:** deploy free at one shelter's intake portal. Partner
on outcome tracking.

**Lives if it lands:** ~1,300 US DV homicides/year. Even 1% reduction =
13 lives/year. Plus the larger downstream effect on non-fatal violence
and child trauma.

---

## Composition with the kit

Some of these compose with the trust-evidence kit. A sealed advance
directive (kit) plus AI advance-directive composition tool (intervention)
together prevents unwanted resuscitation more reliably than either
alone. A sealed organ-allocation record (kit) plus AI matching tool
(intervention) together prevents queue-jumping more reliably than
either alone.

The kit is a primitive. Primitives compose. The next generation of
adoption may come from composing kits with direct-service AI tools
that capture the populations the kits cannot reach alone.

---

## How to contribute

Open a PR with another intervention. Required fields: idea, why-it-
might-work, cheapest-test, lives-if-it-lands estimate.

Direct service interventions that save lives are welcome here even
when they have nothing to do with cryptographic attestation. The repo's
purpose is lives saved, not paradigm coherence.

---

## License

Public domain (CC0 1.0 Universal). Fork it. Build the interventions.
The cost of exploration is markdown; the cost of not exploring is lives.
