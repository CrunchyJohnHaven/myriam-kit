# Title / Escrow Chain-of-Title Attestation Kit

A turnkey myriam-kit example for licensed title officers, escrow
agents, abstractors, and title underwriter representatives who want
to publish a Bitcoin-anchored, tamper-evident seal of *what the
public-record chain of title showed*, *at a specific effective date*,
*for a specific real-property parcel*, so that any subsequent buyer,
lender, refinance underwriter, or appellate-review title examiner
can verify against the same frozen artifact without re-doing the
whole search.

The U.S. title-insurance industry generates ~$20B/yr in premiums and
sits atop ~$50-100B/yr in total transaction-friction cost (escrow
fees, abstractor labor, lender's title insurance, re-issuance of
title commitments on every re-sale and refinance). Much of this
friction duplicates work that has already been done on the same
property: the same chain of title is re-walked on every transaction
because no subsequent party can trust the prior verification without
re-doing it. A sealed point-in-time chain-of-title attestation makes
the prior verification cheaply re-checkable.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of WHAT THE PUBLIC RECORD
SHOWED for a specific parcel, AT a specific effective date, as
reviewed by a specific licensed title officer using a specific
search methodology. It cannot answer any question beyond that. The
following are **outside the seal's domain**:

1. **It does not insure against loss.** Title insurance is a
   contractual indemnity from a licensed underwriter, backed by
   capital reserves and state insurance-department oversight. The
   seal is a forensic attestation of what the search showed; it is
   not a promise to pay if the search was wrong. A buyer relying on
   a sealed search without a title-insurance policy has no
   indemnity against undiscovered defects. The seal is **additive
   to** a title-insurance policy, not a substitute for one.

2. **It does not validate the underlying recordings.** If a deed
   was fraudulently recorded (forged signature, impersonation at
   the closing table, fabricated power of attorney), the recorder's
   office will accept the recording, and the sealed search will
   honestly report "this is what the recorder's index showed at
   the effective date." The seal commits to the search; it does
   not detect upstream recording fraud. The 2008-era robo-signing
   episodes, the MERS mortgage-assignment disputes of the same
   period, and various synthetic-identity title-fraud schemes all
   produced recordings that a search would have honestly returned
   as authentic. The seal makes the search verifiable; it does not
   audit the recorder's office.

3. **It does not substitute for the title-insurance underwriter.**
   The underwriter weighs the risk of undiscovered defects and
   prices a premium against capital. A sealed search reduces the
   underwriter's per-transaction labor cost but does not remove
   the underwriter's role. The kit's adoption value is in
   reducing the **labor** cost (duplicated abstractor and title-
   officer hours), not the **risk** cost (the indemnity itself).

4. **It does not defend against the title officer themselves being
   captured.** A licensed title officer who is bribed, coerced, or
   has an undisclosed conflict of interest can produce a
   cryptographically valid seal of a dishonest search. This is the
   coercion-amplification failure mode: the seal makes a dishonest
   signature MORE damaging, not less, because it is permanent and
   forensically tied to the officer's license number. The seal's
   value is conditional on the integrity of the signing principal;
   it does not create that integrity from thin air. Underwriter
   audit, state-licensing-board oversight, and ordinary fraud
   prosecution remain the primary defense against captured
   officers. The seal is a downstream amplifier of those
   defenses, not a replacement.

5. **It does not update.** A sealed search is point-in-time only.
   Any subsequent recording — a new deed, a new mortgage, a newly
   filed mechanic's lien, a judgment lien, a tax lien, a notice of
   pendency — invalidates the seal's **policy relevance** going
   forward, but does NOT invalidate the seal's **factual claim**
   about what the record showed at the effective date. The seal
   is a frozen snapshot. Subsequent buyers must run a "gap search"
   from the seal's effective date forward; the seal cheapens the
   work BEFORE its effective date, not after.

6. **It does not certify the legal effect of any recorded
   instrument.** Whether a particular deed conveyed marketable
   title under applicable state law, whether a particular
   mortgage was validly assigned, whether a particular easement
   binds successor owners — all of these are legal questions that
   the licensed title officer interprets in the search but that
   are ultimately for a court to decide if disputed. The seal
   commits to the officer's contemporaneous reading; it does not
   bind a future court to agree with that reading.

7. **It does not establish marketable title.** Marketability is a
   contract-law standard (the title that a willing buyer would
   accept from a willing seller under the contract of sale); it
   varies by jurisdiction and by the terms of the specific
   purchase agreement. The seal records what the search showed;
   whether that record establishes marketable title for a
   specific transaction is for the parties (and, if disputed, a
   court) to decide.

8. **It does not anchor private title-plant data.** Many title-
   insurance companies maintain proprietary "title plants" — pre-
   indexed copies of the public record optimized for fast search.
   The seal anchors what the OFFICER SAW in the search, which may
   draw from a title plant or directly from the recorder's
   office. The plant itself is private commercial data and is not
   anchored by the seal; the plant's own integrity is the
   underwriter's internal-audit problem.

**The honest-limits section above is the load-bearing part of this
kit.** Buyers, lenders, and re-sellers who believe a sealed search
equals title insurance will use the seal as a shield. The kit must
say plainly: *this is a non-repudiation primitive for the search
moment, not a guarantee of title, not a substitute for an
underwriter's indemnity, and not a defense against upstream
recording fraud or downstream officer capture.*

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if
a user with valid title-officer signing authority submits them:

- **Identifying information of beneficiaries of liens held in
  trust.** Many liens (judgment liens, tax liens, support liens)
  identify the lien creditor; many other liens are held in trust,
  through an LLC, or through a privacy-preserving custodian
  precisely because the beneficial owner's identity is sensitive
  (estranged-family judgments, child-support arrears, abused-
  spouse-protected creditors, sealed-court matters). The kit
  publishes the recorded encumbrance and the recorded beneficiary
  of record but REFUSES to publish, even by derived hash, any
  identifying information about a beneficial owner who is not the
  beneficiary of record. The recorded beneficiary is public; the
  beneficial-owner identity behind a privacy-preserving structure
  is not the search's to publish. (Refusal-rule R1.)

- **Sealing without the licensed title officer's actual
  signature.** A clerk, an assistant, or an automated batch
  process MAY NOT seal in the licensed officer's name. The
  officer must be the live signer at the moment of sealing,
  using a cryptographic key bound to the officer's license. A
  clerk-as-proxy seal is the most likely vector for
  unauthorized attestation and the kit refuses it categorically.
  (Refusal-rule R2.)

- **Sealing partial searches as complete.** A search that
  covered only the deed-index but not the lien-index, or that
  searched only one of two counties for a parcel straddling a
  county line, or that ran only forward from a prior search's
  effective date without a full back-chain re-walk, MUST be
  sealed as a "supplemental" or "limited-scope" search with
  the explicit scope limitation stated in FACT 05 (search
  methodology) and FACT 06 (exceptions). A limited-scope
  search sealed as a "full" search is a refusal pattern.
  (Refusal-rule R3.)

- **Sealing chain-of-title for properties where the searcher
  knows of unresolved disputes.** If the title officer is
  contemporaneously aware of a pending quiet-title action, a
  contested probate, a contested divorce affecting the
  property, a contested partition, a contested adverse-
  possession claim, a contested boundary survey, or any other
  matter that would render the chain-of-title state itself
  the subject of active legal contestation, the kit MUST
  refuse to seal until the contestation is disclosed in FACT
  07 (companion disclosures) as a known pending matter. A
  seal that hides known unresolved disputes is a refusal
  pattern even if every recorded instrument is honestly
  reported. (Refusal-rule R4.)

- **Sealing in jurisdictions where the kit operator lacks legal
  capacity.** Title work is licensed at the state level in the
  United States and is even more closely regulated in many
  jurisdictions outside the U.S. The kit refuses to seal a
  search in a jurisdiction where the signing officer's license
  does not authorize them to issue title opinions, even if the
  search was conducted competently. The signing officer's
  state of license and the property's state of situs MUST
  match (or the officer must affirmatively cite a multi-state
  authorization in FACT 08). (Refusal-rule R5.)

- **Personal identification of any natural-person owner beyond
  what is recorded in the public record.** The chain of title
  may identify owners by the name under which they took or
  conveyed title (which is itself public record); the kit does
  NOT supplement that with date of birth, current mailing
  address, social security number, current phone number, or any
  other personal identifier not in the recorded instrument
  itself. Where an owner of record is an entity (LLC, trust,
  partnership), the kit publishes the entity name as recorded
  and does NOT publish individual members, beneficiaries, or
  partners beyond what is itself recorded. (Refusal-rule R6.)

- **Sealing of a search that the officer has not personally
  reviewed.** An abstractor's raw output, a title-plant batch
  export, or a third-party search vendor's report MAY be the
  underlying data, but the licensed title officer must
  personally review the chain, exceptions, and methodology
  before sealing. A pass-through seal of unreviewed third-
  party output is refused. (Refusal-rule R7.)

- **Sealing as a substitute for the underwriter's commitment.**
  The seal is an attestation of the SEARCH; an underwriter's
  commitment is a separate contractual document. The kit
  refuses fact bodies that claim the seal IS a title commitment
  or that the seal binds the underwriter to indemnify. The
  underwriter's commitment may reference the seal; the seal does
  not become the commitment. (Refusal-rule R8.)

A refusal itself may be sealed as a fact ("This officer requested
sealing of X; the kit refused per refusal-rule Y"), creating a
public record of attempted misuse without exposing the underlying
sensitive content.

---

## What this kit DOES seal

8 facts at the moment of search completion:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Property identification** — APN / parcel ID, county, state,
   legal description hash, search effective date, search
   completion date, search type (full / limited / supplemental).
3. **Chain of title** — ordered sequence of owners with deed
   instrument numbers, recording dates, recording-office book/
   page or document number, and per-deed hash. Names appear as
   recorded; no supplemental personal identifiers.
4. **Encumbrances** — mortgages, deeds of trust, mechanic's
   liens, tax liens, judgment liens, easements, restrictive
   covenants, leases of record, options of record — as of the
   search effective date, with recording references and per-
   instrument hashes. Beneficial-owner identification beyond the
   recorded beneficiary is refused per R1.
5. **Search methodology** — county records covered, online vs.
   in-person review, date range searched, methodology version,
   title-plant data sources used (by name and version), gap-
   search protocol if any, lien-index coverage, federal-court-
   judgment search if any, bankruptcy-court search if any.
6. **Exceptions** — items the officer could not verify, items
   that fall outside coverage (off-record matters, survey
   matters, mineral and oil/gas estates if not searched, water
   rights if not searched, federal-tax-lien priority
   determinations, anything the underwriter's standard
   exceptions list also excludes).
7. **Companion disclosures** — pending litigation affecting the
   property, prior known title searches (if disclosed to the
   officer), recusals (officer's own conflicts disclosed), known
   pending contestations of the chain (per R4), tax-status
   note, HOA / CC&R status note, environmental-lien status note.
8. **Signing principal** — title officer name as licensed,
   state of license, license number, license expiration date,
   underwriter the officer is appointed to, cryptographic key
   bound to the license, and counter-signature by an
   underwriter representative or branch manager.

Each fact ends with the refusal-gate convention: *"This fact
asserts only X. It does not assert Y"* (where Y is the closest
failure mode from the "DOES NOT do" section above).

---

## What this kit defends against

- **Silent post-issuance revision of title commitments.** Once
  sealed, the chain of title at the effective date is anchored.
  Later edits to the commitment — adding an exception that
  wasn't there, removing one that was, re-classifying an
  insured matter — change the fact-body hashes and are publicly
  detectable.

- **Forgotten-then-revived liens.** A lien that the search
  found, disclosed, and either resolved or insured against
  cannot later be re-asserted as "we always knew about that"
  or "we didn't know about that" without contradicting the
  sealed FACT 04 encumbrances list.

- **Post-closing disputes over what the search showed.** When
  a defect surfaces months or years after closing, the parties
  often dispute what the search "should have" caught versus
  what it "actually" caught. The sealed FACT 04 / FACT 06
  freezes the contemporaneous record of both what was caught
  and what was explicitly excepted.

- **Mid-transaction title-state reinterpretation by the
  underwriter.** Underwriters sometimes reclassify a matter
  between commitment and closing (e.g., upgrading an easement
  to an exception, downgrading an exception to standard
  coverage). The sealed FACT 04 anchors the as-of-effective-
  date classification, so any later reinterpretation is
  publicly observable as a change from the sealed baseline.

- **Vanishing-county-record episodes.** When a recorder's
  office is destroyed (Hurricane Katrina; various courthouse
  fires) or its index is corrupted (multiple documented
  county-record-database failures in the 2010s), the sealed
  search becomes one of the few surviving artifacts that
  reports what the index showed before the loss. The seal
  does not reconstruct the missing records; it does anchor
  what the search saw before they went missing.

- **Robo-signing-era recurrence.** The 2008-2012 robo-signing
  episodes were possible in part because the mortgage-
  assignment chain was opaque and disputed. A sealed search
  freezes the assignment chain as of the search date,
  preventing later retroactive "we always had standing"
  claims that contradict the sealed record.

- **MERS-style assignment-chain ambiguity.** Mortgage
  Electronic Registration Systems (MERS) recording practices
  produced years of litigation over whether the recorded
  beneficiary of a mortgage was the real party in interest.
  A sealed search records the recorded beneficiary as of the
  effective date; any later claim that a different party held
  the mortgage at that date can be tested against the seal.

The kit does **not** defend against contemporaneous corruption —
a captured officer who seals a knowingly false search produces a
cryptographically valid seal of a knowingly false search. The
primitive is honest about that: it is a non-repudiation
primitive for the officer's contemporaneous claims, not a proof
those claims are correct. The countervailing forces are
underwriter audit, state-licensing-board oversight, and ordinary
fraud prosecution — all of which are STRENGTHENED, not replaced,
by a permanent forensic record bound to the officer's license.

---

## Historical or near-historical cases the kit would have helped with

The kit would have produced a useful anchor — *not a resolution* —
in past episodes where chain-of-title became a disputed forensic
issue. To avoid naming private parties, these are described by
event type, not by named individual:

- **2008-2012 robo-signing scandal.** Mortgage servicers and
  document-preparation firms produced large volumes of mortgage
  assignments and lost-note affidavits whose signatures and
  notarizations were later disputed. A sealed search performed
  by an honest title officer at any point during a property's
  pre-default history would have frozen the recorded mortgage
  chain as of the search date, providing a verifiable baseline
  against which later disputed instruments could be checked.

- **MERS assignment-tracking litigation.** Multiple state
  supreme-court rulings (~2010-2015) addressed whether MERS-
  recorded mortgages were validly held by the foreclosing
  party. A sealed search at the moment of MERS-era origination
  would have recorded the as-of-date beneficiary, simplifying
  later beneficial-ownership challenges.

- **Hurricane Katrina property-record destruction (2005).**
  Several Louisiana parish recorders' offices suffered partial
  or total loss of pre-Katrina records. Sealed pre-Katrina
  searches, had they existed, would have provided one
  surviving channel of what those records showed before the
  loss. The seal does not reconstruct missing records; it
  would have prevented "we have no record of that prior
  conveyance" from becoming the universal answer.

- **Various courthouse fires** (multiple recorded in the
  20th and early-21st centuries). Same pattern as the Katrina
  case: a sealed prior search is a surviving forensic anchor.

- **Multiple county-recorder database failures (2010s).**
  Several U.S. counties have experienced multi-day or multi-
  week recorder-database failures during which recordings
  either were lost or had to be retroactively re-entered. A
  sealed search performed before a known failure window
  freezes the pre-failure state.

- **Post-foreclosure title-chain disputes.** Many post-2008
  foreclosure cases involved later disputes about whether the
  chain of mortgage assignments leading to the foreclosing
  servicer was complete and properly recorded. A sealed
  pre-foreclosure search would have frozen the recorded
  assignment chain.

- **Synthetic-identity title-fraud cases.** Various reported
  cases (~2015 onward) involve fraudsters recording forged
  deeds purporting to convey property they do not own, then
  attempting to resell or mortgage it. A sealed search by an
  honest title officer establishes that, as of the effective
  date, the recorded chain did or did not include the
  fraudulent instrument. The seal does not detect the fraud
  upstream of recording (per item 2 in DOES NOT do); it does
  freeze the record state, so downstream parties can detect
  the fraudulent recording by the moment it appears.

- **Wildfire and flood property-record disasters (ongoing).**
  Climate-driven loss of records continues. The seal is one
  forensic-redundancy layer; it composes with state-mandated
  paper-and-microform backups, not replaces them.

The kit would NOT have prevented any of the underlying
recordings, frauds, or destructions. It would have produced
verifiable forensic anchors that subsequent parties could rely
on without re-doing the entire chain-of-title work from
scratch.

---

## When to use this kit

- You are a licensed title officer or escrow agent issuing a
  title commitment or escrow attestation, and your underwriter
  permits (or affirmatively encourages) tamper-evident
  publication of the search artifact.
- You are working on a property that is likely to be re-sold,
  refinanced, or otherwise re-titled within a short window, and
  you want to reduce the duplicate-search cost for the next
  transaction.
- You are working on a property in an area with documented
  history of recorder-office data loss (flood-prone counties,
  fire-prone counties, counties with documented database
  failures), and you want a forensic-redundancy anchor outside
  the county's own system.
- You are working on a property whose chain of title is dense
  with assignments, partial conveyances, or other features
  that future re-search would find expensive to re-walk, and
  you want to amortize that cost across future transactions.
- Your underwriter's commitment language has been reviewed by
  underwriter counsel to confirm that publishing the search
  artifact does not waive any underwriter rights and does not
  shift any underwriter liability to the officer personally.

## When NOT to use this kit

- **Do not use as a substitute for an underwriter's title-
  insurance policy.** This kit is *additive*, not replacement.
  Buyers and lenders should continue to require a policy.
- **Do not use without your underwriter's prior written
  approval of the publication.** Underwriters have a
  legitimate interest in what publications appear under
  appointments to them; unauthorized publication may be
  grounds for appointment termination and could expose the
  officer to E&O claims.
- **Do not use on a search where you cannot certify the
  methodology in FACT 05 to the underwriter's standard.** A
  cheap-and-fast partial search sealed as a full search is
  the worst possible failure mode and refusal-rule R3 will
  reject it.
- **Do not use on a property where you contemporaneously know
  of an unresolved dispute affecting the chain.** R4 requires
  disclosure in FACT 07; sealing without disclosure is a
  refusal pattern.
- **Do not use on a property where your state license does
  not authorize you to issue title work.** R5 refuses cross-
  jurisdictional sealing without explicit multi-state
  authorization in FACT 08.
- **Do not use as a substitute for a licensed surveyor.**
  Survey matters are explicitly outside the standard search;
  FACT 06 (exceptions) MUST cite the survey-matters exception.
- **Do not use to seal anything other than what the public
  record actually showed.** The kit will faithfully seal a
  knowingly false fact body; that is a fraud and a license
  violation. The countervailing oversight is the underwriter
  and the state licensing board, not the kit.
- **Do not use as legitimacy theater.** A seal of a sloppy
  search is a permanent public record of the sloppiness, not
  a defense against it. The primitive cuts both ways; that
  is its honesty.

## How to fork this kit for a real search

```bash
cp -r ~/Genesis/myriam-kit/examples/title-escrow-attestation ~/search-APN-XXXX
cd ~/search-APN-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
                          # apply refusal rules R1-R8 throughout
bash build/seal.sh        # seal AT search completion, BEFORE
                          # the commitment is issued to the
                          # transacting parties
python3 build/verify.py   # confirm
```

**Critical timing:** seal at search completion, BEFORE the
commitment is issued. A seal AFTER the commitment opens a
window during which the search artifact could be silently
revised to match a desired commitment outcome. The right
window is immediately after the officer's final review, just
before commitment issuance.

**Critical review:** before sealing, confirm with your
underwriter that the search satisfies their methodology
standard and that the publication plan is approved. Once
sealed, the publication is permanent.

## Integration with existing title-industry infrastructure

- **Underwriter commitment templates (ALTA forms, state
  variants).** The sealed publication URL (or IPFS CID) can be
  referenced in the commitment's "search exhibits" section.
  The commitment remains the contractual indemnity document;
  the seal is the verifiable record of the search behind it.
- **County recorder of deeds.** The seal does not displace the
  recorder; it freezes what the recorder's index returned at
  the search effective date. The recorder remains the system
  of record.
- **Title plant data.** Title-plant operators may continue to
  use the seal as one verification source for re-issuance of
  searches on the same property. The plant remains the
  operator's commercial asset; the seal is the public anchor
  of an individual officer's individual search.
- **MERS and other electronic-recording systems.** The seal
  records the as-of-date state of any MERS or e-recording
  references in the chain; it does not modify those systems.
- **ALTA / state-specific best-practices regimes.** The seal
  is compatible with ALTA Best Practices Pillar 3 (escrow
  trust accounting) and Pillar 5 (information security); it
  does not satisfy them. Compliance with those regimes
  remains a separate underwriter and audit responsibility.
- **State licensing boards.** The seal does not modify the
  officer's licensing obligations. A sealed publication that
  contains a false statement remains a license violation;
  the seal makes the violation more discoverable, not less.

## What this kit does NOT replace

- A title-insurance policy from a licensed underwriter.
- An ALTA-form commitment.
- The county recorder of deeds as the system of record.
- A licensed surveyor's plat or boundary survey.
- An environmental Phase I / Phase II assessment.
- An HOA / CC&R disclosure regime.
- An escrow agent's trust-accounting obligations.
- A state insurance department's regulatory oversight of
  the underwriter.
- A state real-estate-commission's regulatory oversight of
  brokers and licensees.

## Why this kit exists

This is one of the worked examples shipped with myriam-kit. The
title and escrow industry sits on ~$50-100B/yr of transaction
friction; even a 5% reduction (~$2.5-5B/yr) from making prior
searches re-checkable would be a substantial public-good
outcome. Properties that change hands or refinance multiple
times in a short window are the easiest case: the work has
already been done; the seal makes the prior work cheaply
verifiable so it does not need to be redone.

The kit's design is deliberately conservative on what it
refuses: privacy of lien beneficiaries (R1), authenticity of
signature (R2), completeness honesty (R3), known-dispute
disclosure (R4), jurisdictional capacity (R5), owner-PII
protection (R6), personal review (R7), and underwriter-role
distinction (R8). These refusals are the honesty floor that
makes the primitive trustable across decades.

## License

Public domain (CC0). Fork it. No attribution required.
