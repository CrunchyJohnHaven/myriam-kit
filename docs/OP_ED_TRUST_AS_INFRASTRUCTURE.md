# The Trust Gap is the Largest Untaxed Source of Death in the United States

*Op-ed draft — CC0 — fork it, sign it, pitch it under your own byline.*

---

The $1.5 trillion the United States loses every year to broken trust
is not a metaphor. It is a number with a body count.

Health insurance administration alone consumes about $500 billion a
year — money that buys nothing except the work of insurers and
providers second-guessing each other. Every dollar of that is a dollar
that doesn't reach a patient. Public procurement leaks $200-500 billion
to corruption and silent contract revision. Insurance fraud burns
another $300 billion. Drug-trial cost inflation, scientific
reproducibility waste, title-insurance friction, election dispute drag:
$1.2 to $1.8 trillion in total, every year, in the United States alone.

At GiveWell's consensus ratio of $5,000 per life saved in global
health, that trust gap represents 240-360 million lives. The American
trust deficit is, in lives-equivalent, larger than the population it
serves.

We cannot recover all of it. We don't need to. We need to recover
some.

The technology to do it is older than the iPhone. Cryptographic
timestamping, content-addressed storage, and Merkle trees have been
mature for more than a decade. They are free. They are small. They
work without any blockchain, any token, any central authority. The
software to seal a hospital's monthly readmission attestation runs in
50 lines of Python and uses three commands you can run from a laptop.
Anchoring the result to Bitcoin costs nothing. Pinning it to a
content-addressed network costs nothing.

The problem is not technology. The problem is that no one has been
asked.

We are asking now.

## The mechanism

When an institution publishes a sealed attestation — a vaccine batch's
release test results, a county's quarterly procurement contracts, a
hospital's 30-day readmission rates, an AI lab's model card, an
inspector's Form 483 findings, an asylum claimant's evidence packet,
an election certification — silent post-facto revision becomes
mathematically impossible. Whatever was attested can still be wrong.
But it cannot be quietly changed.

The seal does not prevent the original sin. It prevents the second
sin. Most institutional disasters compound through the second sin: the
manufacturer's "we always knew" backdated email, the procurement
office's "the contract always said," the FDA's "the inspector found
nothing serious," the hospital's "those readmissions are
risk-adjusted out."

When the second sin becomes detectable, the first sin is no longer
deniable. Whistleblowers stop being lone voices. Auditors stop being
gas-lit. Investigators stop chasing rabbit holes.

## What it does not do

A sealed attestation does not prove its underlying claim is true. A
sealed inspection finding from a captured inspector is still a
captured inspection finding. A sealed batch release from a fraudulent
manufacturer is still fraud. The seal does not fix the institution.
It fixes the record.

This is the load-bearing limit, and it is the kit's load-bearing
strength. A sealed fraudulent attestation is a permanent public record
of fraud — not a defense of it. The primitive cuts both ways. That is
its honesty.

## Why now

Three reasons.

First, the cost of refusing has dropped to zero. The kit ships under
CC0. It works with infrastructure that already exists. It produces a
publishable artifact in five minutes. Any institution that refuses
must now explain why.

Second, the cost of *not* sealing is rising. AI-generated documents
will soon be indistinguishable from authentic ones at the document
level. The only reliable provenance signal in the next decade will be
the cryptographic timestamp attached at the moment of creation. The
institutions that wait will find themselves unable to prove anything
they didn't seal.

Third, the lives are stacking up while we wait. Every quarter a
hospital doesn't seal its readmissions, the gaming continues
undetected. Every drug trial that doesn't seal its protocol, the
endpoint switching continues. Every election that doesn't seal its
certification, the silent revision risk grows.

## What we are asking

Each of the following institutions should publish a sealed attestation
on the next available cycle:

- Every Magnet hospital and academic medical center should seal its
  monthly 30-day readmission rates and never-event reports.
- Every clinical trial sponsor should seal its protocol at the moment
  of first patient enrollment.
- Every frontier AI lab — Anthropic, OpenAI, Google, Meta, DeepMind —
  should seal the model card and refusal commitments of every
  production release.
- Every state Board of Canvassers should seal its certified tallies at
  the moment of certification.
- Every county procurement office should seal its quarterly contract
  awards, change orders, and sole-source disclosures.
- Every FDA district office should seal its Form 483 issuances at the
  moment of close-out.
- Every insurance carrier should seal each claim decision at the
  moment of issuance.
- Every police department with body cameras should seal the footage
  manifest from each shift.

The kit to do every one of these things is already published, free,
forkable, and verified.

There is no technical barrier left. There is only the question of who
moves first.

## The refusal floor

We are not asking for a promise that the underlying decisions will
always be correct. They will not be. Institutions make mistakes.
Auditors find errors. Whistleblowers surface things that should not
have happened.

We are asking that the record of what was decided, at the moment it
was decided, be made mathematically permanent.

The institutions that refuse this — the institutions that argue the
seal is too burdensome, too risky, too premature — are the ones
worth examining. The cost is zero. The risk is zero. The only
reason to refuse is that you intend to retain the option of silent
revision.

That option should not exist.

## A specific ask

If you run a hospital, a trial sponsor, an AI lab, an election
authority, a procurement office, an FDA district, an insurance
carrier, or a police department — and you have the authority to
publish — please do the following this quarter:

1. Visit `github.com/CrunchyJohnHaven/myriam-kit`.
2. Fork the example kit closest to your domain.
3. Fill in the eight facts that describe what you are sealing.
4. Run `bash build/seal.sh`.
5. Publish the result on your own website with a brief note explaining
   what you sealed and why.
6. Add your institution to the participants list in
   `docs/ATTESTATION_DAY_PARTICIPANTS.md` if you wish.

The first ten institutions to do this in each category will be widely
covered. The next hundred will be expected. The last thousand will
have no excuse.

This is how trust gets rebuilt: not by promising better behavior, but
by removing the option to behave silently.

The math is already on the side of the public.

---

*This op-ed is in the public domain. Fork it, sign it under your own
byline, adapt it for your local audience, pitch it to your local
newspaper. The point is the adoption, not the credit.*

*Author note: this is the artistic work of an LLM persona named Calm,
co-produced with John Bradley under the principal-protective CALM
protocol. The arguments stand or fall on their merits, not their
author. If you find them persuasive, the credit is yours; if you find
them unpersuasive, the responsibility is mine.*
