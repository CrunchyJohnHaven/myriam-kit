# Coined Terminology for Trust-Gap Phenomena

*Naming the failure modes that the kit defends against. CC0.*

A phenomenon that has no name is invisible. "Greenwashing" shifted
billions of dollars in capital allocation because once it had a name,
people could recognize it. "Mansplaining" shifted norms because once it
had a name, it was identifiable in real time.

The trust-gap failure modes the myriam-kit family defends against
mostly do not yet have names. This document proposes names. Some may
stick; most won't. The cost of proposing is zero; the upside of one
sticking is large.

If a name catches on, the underlying failure mode becomes much harder
to perform without being publicly identified as performing it. That
shifts the equilibrium toward sealing.

---

## 1. Silent revision

*The practice of changing an institutional record after issuance
without disclosing the change.*

Examples: a hospital quietly reclassifying readmissions; an FDA
inspector softening a Form 483 finding weeks after issuance; a county
procurement office adding a change order to an existing contract
without separately recording it; an AI lab updating a model card to
walk back a prior commitment.

The kit's primary defense is against silent revision. If the term
becomes recognized, refusal to seal becomes legible as "this
institution intends to retain the option of silent revision."

---

## 2. Documentation theater

*The practice of producing compliance documentation in a form that
satisfies the regulator's surface requirements while ensuring the
documentation cannot constrain future behavior.*

Examples: a hospital filing exhaustive incident reports that are
prospectively reclassifiable; an audit firm producing reports
structured to leave the auditor maximum future deniability; a
corporation publishing "transparency reports" that disclose only
aggregates the company controls.

A sealed attestation defeats documentation theater because the
underlying facts become non-rewritable. Documentation theater that
won't seal is documentation theater that knows what it's doing.

---

## 3. The second sin

*The act of concealing a prior institutional error after it has been
identified internally.*

Most institutional disasters compound through the second sin: a
problem occurs, the institution recognizes it internally, then
silently buries it instead of acknowledging it. The original error
might have been forgivable. The cover-up rarely is.

The kit defends against the second sin specifically. If a sealed
record exists from the moment of the original event, the cover-up
becomes detectable as a divergence from the sealed record.

---

## 4. Refusal-as-signal

*The principle that an institution's refusal to seal a particular
class of attestation is itself informative.*

If sealing is free, low-risk, and additive (does not replace existing
processes), the only rational reason to refuse is the desire to
retain the option of silent revision. Refusal-as-signal converts
that desire into a public signal.

The Refusal Scoreboard at `docs/REFUSAL_SCOREBOARD.md` operationalizes
this principle.

---

## 5. Coercion-amplification

*The principle that cryptographic sealing of a coerced act records
the coerced act with high integrity, making the coercion's
consequences harder to revisit later.*

Every kit in the myriam-kit family acknowledges this as a load-bearing
limit. A sealed attestation by a captured inspector, a coerced
witness, a pressured adjuster, or a threatened election official
preserves their coerced output with cryptographic permanence.

The kit's mitigation is to require multiple independent signers, to
publish refusal-rules that capture-resistant institutions can
self-impose, and to be honest about the limit in every README.

The named phenomenon is the precondition for the design choice.
Without coercion-amplification as a recognized concept, the design
choice looks like over-engineering.

---

## 6. Cryptographic counter-seal

*A sealed attestation published by a counterparty to an institutional
attestation, providing the counterparty's record of the same event.*

Example: an insurance claimant publishes their own evidence-submission
hash; if the carrier later denies "we never received that," the
claimant's counter-seal contradicts the carrier's claim.

The counter-seal pattern lets the weaker party in an asymmetric
relationship participate in trust-evidence sealing even when the
stronger party refuses.

---

## 7. Refusal-floor

*The set of fact-patterns an institution explicitly commits in advance
to declining to seal, even when sealing would otherwise be required.*

Every kit's "MUST REFUSE" section is a refusal-floor. The point is
that the institution publishes the refusal-floor before any specific
attestation, so the floor cannot be tactically expanded to cover an
embarrassing fact.

A refusal-floor that did not exist before the fact arose is not a
refusal-floor; it is an excuse.

---

## 8. Witness diversity

*The principle that an attestation anchored to multiple independent
verifiers (calendars, blockchain timestamping providers, content-
addressed storage networks) is stronger than one anchored to a single
verifier.*

The kit specifies a two-calendar minimum for OpenTimestamps anchoring
specifically to prevent single-witness capture. The named principle
generalizes: any system that depends on a single verifier inherits
that verifier's vulnerabilities.

---

## 9. Trust-gap economy

*The portion of an economic system whose recurring transactional cost
is paid solely to compensate for the absence of verifiable claims.*

The U.S. trust-gap economy is estimated at $1.2-1.8 trillion per year.
Title insurance, prior authorization, KYC redundancy, escrow,
third-party verification, audit redundancy, and dispute resolution are
all trust-gap economy participants.

The named concept lets policymakers and economists treat trust-gap
spending as a measurable category rather than an invisible overhead.

---

## 10. Adoption cascade

*The dynamic by which one institution's adoption of an attestation
practice creates pressure on similar institutions to follow.*

The kit's design assumes adoption cascades will dominate adoption
math. The first hospital to seal monthly readmission rates establishes
a precedent. The second is expected. The hundredth has no excuse.

The Attestation Day mechanism (`docs/ATTESTATION_DAY.md`) is designed
to compress the cascade timeline by coordinating simultaneous initial
adoption.

---

## How to use this document

Cite these terms in your writing. Use them in conversation. Open PRs
adding new terms. Translate them into other languages.

If a term sticks, it shifts the discourse. The discourse shifts the
adoption rate. The adoption rate saves lives.

The cost of proposing a term is one paragraph. The cost of one term
sticking is potentially measurable in lives.

---

## License

Public domain (CC0 1.0 Universal). The terminology is yours.
