# Bug Bounty

*A public invitation to attack the kit. Defects = lives.*

The kit's value depends on being un-forgeable in practice. The
mathematical primitives (SHA-256, Merkle trees, OpenTimestamps,
IPFS) are well-studied. What needs adversarial testing is the
kit's specific composition of them, its refusal-gate enforcement,
and its operational guidance.

This page invites adversarial review. The kit's adoption depends on
its robustness; its robustness depends on having been tried by
attackers.

---

## What we want you to attack

1. **Forge a sealed attestation.** Produce a Merkle root that verifies
   correctly but contains a fact that was not part of the originally
   sealed set, or that was later altered.

2. **Bypass the refusal-gate.** Use the kit to seal something it
   refuses to seal (PII, single-signer high-stakes, partial-completion,
   etc.) in a way the build script accepts.

3. **Compromise the witness diversity.** Find a way for an attestation
   to claim Bitcoin-anchored verification when the OTS receipts are
   actually invalid or from a single-calendar-only setup.

4. **Compromise the verifier.** Produce an attestation that
   `lib/verify.py` says is valid when it should be invalid (or
   vice versa).

5. **Produce a denial-of-service against IPFS pinning.** Cause an
   attestation to be sealed but un-retrievable via any IPFS gateway
   within a reasonable window after publication.

6. **Compromise an example kit's load-bearing honesty.** Identify a
   specific example kit (e.g. `examples/hospital-readmission-
   attestation/`) where the "DOES NOT do" section, the "MUST REFUSE"
   section, or the refusal-gate convention is weaker than it should
   be — i.e., the kit makes a load-bearing claim that doesn't actually
   hold.

7. **Find a sealed claim in the wild that is materially false.** If
   an institution publishes a sealed attestation containing a false
   claim, document it. The kit's value is precisely that false claims
   become permanent records of falsity; finding one is a win for the
   protocol, not a defect.

---

## What we will pay

Initially: nothing. The kit is unfunded; this is a public-domain
project. We are inviting adversarial review without a treasury behind
it.

If you find something, we ask for:

1. A clear written description of the attack, including reproducer.
2. An opportunity to fix it before public disclosure (we suggest
   30 days, but reasonable adversarial-disclosure timelines are
   acceptable).
3. Permission to credit you (or your handle) in the kit's
   `SECURITY.md` and changelog.

We will, in turn:

1. Acknowledge your finding within 7 days.
2. Publish a fix (or document the limitation) within 30 days.
3. Credit you publicly.
4. **If a sealed-bounty fund is later established, retroactively
   reward original finders.** A line in the registry is forever; a
   bounty is a function of future funding.

---

## How to submit

Open an issue on `github.com/CrunchyJohnHaven/myriam-kit` with the
prefix `[SECURITY]` in the title.

For sensitive issues (e.g. an institution has been gamed by a flaw in
the kit and you don't want the gaming surfaced before a fix):
encrypt your report to the maintainer's PGP key (TBD) and email it,
or use Signal to the maintainer (TBD). Until those channels are
established, use a private email and we will move to an encrypted
channel in response.

---

## What this DOES NOT do

- **Doesn't prevent silent attacks.** An attacker who never tells us
  about their attack still defeats the kit for whoever they target.
  The bounty incentivizes disclosure, not detection.

- **Doesn't replace formal security review.** A bug bounty is a
  community-review supplement, not a substitute for an audit by a
  qualified security firm. We welcome such audits and will publish
  their reports.

- **Doesn't insure adopters.** Institutions adopting the kit must
  understand that the kit's security depends on the soundness of its
  underlying primitives + its specific composition + the institution's
  own operational discipline. The bounty does not transfer risk.

---

## Why publish this now without a treasury

Because the only way to find the defects is to invite the search.
Adopters deserve to know whether the kit has been adversarially
reviewed. Publishing the invitation publicly is itself the signal
that adversarial review is welcome.

If your finding leads to a fix that prevents one false attestation
from being later weaponized against a vulnerable population, the
lives equivalent is potentially large. The bounty is, in a sense, a
moral debt rather than a financial one.

If you find something, please disclose. The kit's adoption rate (and
the trust gap it closes) depends on the kit being demonstrably
robust.

---

## License

Public domain (CC0 1.0 Universal). The bounty terms are CC0; the
defects you find are yours to disclose freely.
