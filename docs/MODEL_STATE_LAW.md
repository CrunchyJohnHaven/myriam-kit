# Model State Law: Public Institution Attestation Act

*A model statute, pre-drafted, pass-ready for any state legislator. CC0.*

Heritage Foundation, ALEC, and the Brennan Center all distribute model
legislation. This is the model statute for trust-evidence sealing of
public-institution attestations.

It is written to be passable in any U.S. state. It is intentionally
narrow in scope (apply only to specific institutional categories), low
in cost (CC0 software, no new agency required), and refusal-floored
(institutions retain explicit categories they may decline to seal).

---

## Title

**The Public Institution Attestation Act**

(Short title: PIAA. Adapt as needed for your state's drafting
conventions.)

---

## Findings

The legislature finds:

1. The public has an interest in the durability and integrity of the
   official records produced by public institutions and licensed
   private institutions performing public functions.

2. Modern cryptographic primitives — including SHA-256 hashing,
   Merkle trees, and OpenTimestamps anchoring — allow institutions
   to publish records in a form that makes silent post-publication
   revision mathematically detectable.

3. These primitives are mature, free of intellectual property
   restrictions, require no proprietary infrastructure, and impose
   negligible operational cost (typically less than five minutes of
   staff time per attestation).

4. The integrity of records produced by hospitals, certified election
   authorities, county procurement offices, FDA-regulated entities,
   licensed insurance carriers, and state-licensed forensic
   facilities directly affects the health, financial security, and
   civil rights of state residents.

5. Voluntary adoption of cryptographic attestation by such institutions
   serves the public interest without imposing new regulatory burden.

---

## Section 1. Definitions

(a) "Attestation" means a publicly published record of a specified set
    of facts produced by a covered institution in the ordinary course
    of its operations.

(b) "Sealed attestation" means an attestation that has been:
    (1) reduced to a deterministic byte-level representation,
    (2) hashed using the SHA-256 algorithm into a Merkle tree, and
    (3) anchored to the Bitcoin blockchain via an established
        timestamping protocol such as OpenTimestamps, with the
        resulting receipt published alongside the attestation.

(c) "Covered institution" means any of the following operating in this
    state:
    (1) A hospital licensed by the state Department of Health;
    (2) A county or municipal procurement office;
    (3) An election authority responsible for certifying election
        results;
    (4) An insurance carrier licensed by the state Department of
        Insurance;
    (5) A licensed forensic laboratory or evidence custodian;
    (6) Any institution receiving more than [$X] in state funds per
        fiscal year.

(d) "Refusal record" means a publicly published record stating that a
    proposed attestation was declined, the reason for the decline, and
    the date and authority of the refusal.

---

## Section 2. Required Disclosures

(a) Within 18 months of the effective date of this Act, each covered
    institution shall publish at least one sealed attestation per
    calendar quarter on its official website.

(b) The required sealed attestation shall cover a domain appropriate
    to the institution's primary function. By way of example:

    (1) Hospitals: monthly 30-day readmission rates by primary
        diagnosis, with companion mortality data.
    (2) Procurement offices: contracts awarded in the quarter, change
        orders issued, vendor payments by aggregate.
    (3) Election authorities: per-precinct certified tallies at the
        moment of certification.
    (4) Insurance carriers: aggregate claim decisions by line of
        business and disposition.
    (5) Forensic labs: chain-of-custody manifests for evidence
        intaken in the quarter.

(c) An institution may publish a refusal record in lieu of a sealed
    attestation for any specific category of facts where publication
    would:

    (1) violate state or federal privacy law (including HIPAA, FERPA,
        or state-equivalent statutes);
    (2) compromise an ongoing law enforcement investigation;
    (3) violate court-ordered confidentiality; or
    (4) expose a whistleblower's identity.

    A refusal record shall be published with the same prominence and
    durability as the attestation it replaces.

---

## Section 3. Minimum Technical Standards

A sealed attestation satisfies this Act if it includes:

(1) The set of facts being attested, expressed in deterministic plain
    text;
(2) The SHA-256 hash of each fact;
(3) The Merkle root computed over the facts using a Bitcoin-style
    pairwise concatenation algorithm;
(4) An OpenTimestamps receipt or equivalent Bitcoin-anchored proof of
    the Merkle root;
(5) The full text of the facts, made publicly available at a stable
    URL or content-addressed identifier;
(6) The identity of the signing principal (institution and named
    officer or role) responsible for the publication.

The institution may use any open-source toolchain meeting these
requirements. The state shall not endorse, license, or restrict any
particular toolchain.

---

## Section 4. Refusal Floor

(a) Notwithstanding Section 2, no institution may be required to
    seal an attestation that would:

    (1) expose personally identifiable information of a non-consenting
        individual;
    (2) violate a duty of confidentiality recognized by state or
        federal law;
    (3) expose a confidential informant, whistleblower, victim of
        sexual assault, or minor;
    (4) compromise the safety of any individual;
    (5) reveal a trade secret entitled to legal protection.

(b) Where a refusal under subsection (a) applies, the institution shall
    publish a refusal record stating the category of refusal without
    revealing the protected content.

---

## Section 5. Implementation Authority

The [Department of Administration / Office of the Inspector General /
appropriate state agency] shall:

(1) Publish, within 90 days of this Act's effective date, a list of
    open-source toolchains that meet the technical requirements of
    Section 3, including but not limited to the myriam-kit at
    `github.com/CrunchyJohnHaven/myriam-kit`.

(2) Provide free technical assistance to covered institutions
    implementing this Act.

(3) Maintain a public registry of sealed attestations published by
    covered institutions, organized by category and institution.

(4) Publish an annual report identifying covered institutions in
    compliance, in refusal, and in non-compliance.

The Department shall not require institutions to use any specific
software, vendor, or service.

---

## Section 6. No Private Cause of Action

This Act creates no new private cause of action. A failure to seal an
attestation does not, by itself, give rise to civil or criminal
liability. The intent of this Act is to provide transparency, not
litigation leverage.

---

## Section 7. Severability

If any provision of this Act is held invalid, the remaining provisions
shall remain in force.

---

## Section 8. Effective Date

This Act takes effect on [date], with full compliance required within
18 months thereafter.

---

## Fiscal Note

Estimated annual fiscal impact: $0-$50,000 for [Department] to
maintain the implementation registry. Per-institution compliance cost
is estimated at less than $1,000 annually (staff time only; software
is free of cost).

---

## Why this version is pass-ready

1. **No agency creation.** Implementation goes to an existing state
   department.
2. **No mandate to use any specific software.** Open-source agnosticism
   defeats vendor-capture objections.
3. **Refusal floor is robust.** Five specific categories of legitimately
   refused content protect privacy, safety, and trade secrets.
4. **No private cause of action.** Defeats the most common business-
   lobby objection (litigation risk).
5. **Narrow covered-institution definition.** Avoids overreach.
6. **18-month implementation window.** Defeats the "we need time" pushback.
7. **Zero fiscal impact in real terms.** Defeats the budget objection.
8. **Voluntary at the toolchain level.** Defeats the federalism objection.

---

## How to introduce this in your state

1. Find a legislator interested in good-government / trust-in-institutions
   issues. Both parties have these legislators.
2. Send them this draft along with a one-page summary tailored to your
   state's specific corruption or trust scandals.
3. Offer to find expert witnesses for committee hearings.
4. Coordinate with similar groups in other states for simultaneous
   introduction. Synchronicity creates news.

The first state to pass this will get national attention. The second
will get less. The 50th will be expected.

---

## License

Public domain (CC0 1.0 Universal). Adopt it. Adapt it. Pass it. The
point is the law, not the credit.
