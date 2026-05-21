# Court Evidence Chain-of-Custody Seal Kit

A turnkey myriam-kit example for forensic acquisition teams — computer
forensics examiners, mobile-device extraction technicians, body-cam
evidence custodians, lab supervisors — who want to publish a Bitcoin-
anchored, tamper-evident seal of *what bytes were acquired* and *when*,
at the moment of digital evidence acquisition, so chain-of-custody
disputes have a public anchor.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of WHICH FORENSIC IMAGES were
acquired, WHEN they were acquired, by WHICH AGENCY, under WHICH WARRANT,
and through WHICH METHODOLOGY. It cannot answer any question about the
case beyond that. The following are **outside the seal's domain**:

1. **Admissibility under the Federal Rules of Evidence (or any other
   evidence code).** The seal anchors bytes and timestamps. Whether
   evidence is admissible — under FRE 901 authentication, FRE 702
   expert testimony / Daubert, FRE 403 prejudice balancing, or any
   state-court equivalent — is a legal-procedure question. A perfectly
   sealed acquisition can still be ruled inadmissible; an unsealed
   acquisition can still be admitted. The seal is additive evidence
   of integrity, not a substitute for the court's admissibility ruling.

2. **Whether the seizure was lawful.** Fourth Amendment compliance,
   warrant validity, scope adherence, exclusionary-rule applicability
   — all of these are upstream of the seal. The seal records that
   acquisition happened under warrant FICT-SW-2026-0188; whether the
   warrant was lawfully issued and lawfully served is for the court.

3. **Whether the evidence is incriminating, exculpatory, or neutral.**
   The seal anchors hashes; interpretations of what those hashes
   contain belong in the forensic examination report, which is its
   own document with its own discovery and evidentiary regime. The
   seal will refuse to seal "FACT N: the suspect's laptop contained
   incriminating material" — see refusal-rule R4.

4. **Whether the chain-of-custody is procedurally correct under the
   applicable state's evidence law.** The seal records the agency's
   contemporaneous custody-event log (FACT 05). Whether that log
   satisfies a particular state's chain-of-custody requirements is
   for the court at the evidentiary hearing.

5. **Whether the forensic methodology was reliable.** Daubert and
   its progeny (and state-level analogs like Frye, where it still
   applies) assess methodological reliability. The seal records WHICH
   tools and versions were used (FACT 04); whether those tools meet
   any specific court's reliability standard is for the court. Tool
   bugs have been documented post-acquisition in past cases; the
   seal's role is to make the version-and-binary-hash record publicly
   refutable, not to vouch for the tools themselves.

6. **Whether evidence was tampered with BEFORE acquisition.** The
   seal anchors bytes from the moment of imaging forward. If a
   suspect, an officer, or a third party altered the source device
   before it was imaged, the seal cannot detect that — it seals the
   altered bytes with the same integrity it would seal the original.
   The seal's value begins at the imaging timestamp.

7. **Whether the warrant scope was respected.** The warrant rider
   defines what may be acquired; the seal records what WAS acquired.
   Whether the acquisition exceeded warrant scope is, again, a legal
   question with its own remedy (suppression motion under the
   appropriate state's procedure).

8. **Re-identifying any private party to the investigation.** The
   seal refuses to publish any name, identifier, or fingerprint
   that could re-identify a suspect, defendant, victim, witness, or
   premises occupant. The case docket reference is the appropriate
   handle for parties with standing to locate the case.

**The honest-limits section above is the load-bearing part of this
kit.** Forensic teams who believe sealing equals admissibility will
use it as a shield. The kit must say plainly: *this is a non-
repudiation primitive for the acquisition moment, not a proof of
lawful acquisition, methodological soundness, or court-recognized
chain-of-custody.*

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if a
user with valid agency signing authority submits them:

- **Personal identification of suspects, defendants, victims,
  witnesses, or any private third party.** The case docket reference
  is the handle for parties with standing; the public seal must not
  be a re-identification index.
- **Personal names of forensic examiners or other agency staff in the
  public seal.** Roles are public; person-to-role bindings are sealed
  separately and discoverable under court process.
- **File-level hashes (or fingerprints) of suspected child sexual
  abuse material, biometric templates, or any vulnerable-person re-
  identifying data — even by hash.** A SHA-256 of an individual file
  is a permanent searchable identifier; publishing it on a public
  ledger can re-victimize subjects via correlation with private
  databases. Image-level (forensic-image-level) hashes of full disks
  are acceptable; file-level hashes of such material are NEVER
  acceptable.
- **Examination findings, interpretations, opinions, or conclusions
  about what the bytes mean.** The seal anchors WHAT BYTES were
  acquired and WHEN. The interpretation belongs in the discoverable
  examination report, not on a tamper-evident public ledger.
- **Claims of admissibility or any other legal conclusion** ("this
  evidence is admissible," "the warrant was lawful," "the chain-of-
  custody was proper under §X.Y"). Legal conclusions are court
  functions.
- **Sealing by anyone other than the acquiring agency's authorized
  principal.** A defense expert may use the kit to seal their own
  independent verification of the manifest; they may not seal the
  ORIGINAL acquisition under the acquiring agency's name.
- **Role-to-individual bindings inside the public seal.** Bindings
  are sealed in a separate companion record (hashed in FACT 05)
  under agency access control.
- **Pre-seizure or pre-warrant investigative facts.** Informant
  statements, pre-warrant surveillance, parallel-construction
  inputs — none of these belong on the acquisition seal. The seal
  is scoped to the acquisition event.

A refusal itself may be sealed as a fact ("This agency requested
sealing of X; the kit refused per refusal-rule Y"), creating a
public record of attempted misuse.

---

## What this kit DOES seal

8 facts at the moment of acquisition:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Acquisition context** — case identifier, warrant citation,
   acquiring agency, requesting authority, date/time of seizure and
   acquisition, location of acquisition (location of seizure is
   redacted to a separately-sealed companion record to avoid re-
   identifying the premises).
3. **Evidence manifest** — per forensic-image-item: SHA-256 hash,
   file size, source-device anonymized identifier, acquisition
   method, forensic image format.
4. **Acquisition methodology** — forensic tool names and exact
   versions (with tool-binary hashes), write-blocker make/model and
   firmware, NIST CFTT verification reference, verification
   procedure used, image-format choice.
5. **Chain-of-custody log** — per-event timeline from initial
   seizure through end of imaging, custodians identified by ROLE
   (not by name), with hashes of separately-sealed companion
   records (role-to-individual binding, transport GPS log, evidence-
   locker access log, tamper-seal photographs, etc.).
6. **Examiner qualifications by role** — certifications held,
   continuing-education status, prior expert-witness experience
   count, Daubert exposure, conflict-of-interest disclosures —
   all role-level, not personal.
7. **Companion disclosures and refusal record** — parallel
   investigations, pending warrant challenges, suppressed-evidence
   motions, privilege-filter / taint-team protocol in effect, prior
   acquisition attempts, vendor bug-tracker review; explicit list
   of patterns the kit refused to seal.
8. **Signing principal** — acquiring agency identification + role-
   level signatory (lead examiner) + role-level co-signatory (unit
   supervisor) + cryptographic key info.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section above).

---

## What this kit defends against

- **Silent post-acquisition alteration of a forensic image.** Any
  byte-level change to any image produces a different SHA-256, and
  the post-change image will not verify against the sealed FACT 03
  manifest.
- **Claim that "different tools were used."** FACT 04 records exact
  tool versions with tool-binary hashes; later "we actually used
  v4.7.0, not v4.7.1" claims are publicly refutable.
- **Claim that the write-blocker was not engaged, or used a
  different model.** FACT 04 freezes the write-blocker manifest.
- **Custody-log alteration.** Any change to the FACT 05 custody-
  event timeline (adding, removing, or re-timestamping an event)
  changes the FACT 05 hash and is publicly detectable.
- **Substitution of a different examiner's credentials.** FACT 06
  freezes the role-level credential profile at acquisition time.
- **Selective omission of companion disclosures.** FACT 07
  enumerates the expected disclosure categories; an empty category
  must be explicitly attested ("none at acquisition time"), so a
  later "we didn't realize that was relevant" is publicly refutable.
- **Post-acquisition claims that the examiner had a conflict that
  was not disclosed.** FACT 06's conflict disclosure is frozen at
  acquisition; later challenges can be tested against it.

The kit does **not** defend against contemporaneous corruption — a
team that intentionally seals false metadata at acquisition time
produces a cryptographically valid seal of false metadata. The
primitive is honest about that: it is a non-repudiation primitive
for the agency's contemporaneous claims, not a proof those claims
are correct.

---

## Historical or near-historical cases the kit would have helped with

The kit would have produced a useful anchor — *not a resolution* —
in past cases where digital evidence chain-of-custody became a
disputed evidentiary issue. To avoid naming defendants (who are
private parties even when convicted), these are described by case
type, not by named individual:

- **The mid-2010s federal forensic-tool-bug controversy** in which a
  widely-used forensic imaging tool was discovered, post-acquisition,
  to have an edge-case bug affecting a specific source-media type.
  A sealed acquisition manifest with frozen tool-version-and-binary-
  hash data would have let defense and prosecution agree on exactly
  which version was used, eliminating one axis of dispute.

- **Multiple state cases involving disputed mobile-device extraction
  outputs**, where the extraction tool's vendor later released a
  bug-fix patch and the question became "did the bug affect this
  case." A sealed methodology fact lets the question be answered
  against frozen versioning data, rather than against the agency's
  current memory of which version was used.

- **Body-worn-camera handoff disputes** in cases where the BWC
  vendor's docking system was later alleged to have allowed
  modification of footage in transit. A sealed manifest of the
  body-cam archive at the moment of agency receipt anchors what
  bytes the agency received from the docking system; later edits
  on the agency side are publicly detectable.

- **Hash-collision controversies in computer-forensics cases**,
  where a defense expert argued that MD5 (still in use in some
  legacy workflows) was inadequate. A sealed acquisition that
  records BOTH MD5 and SHA-256 lets the SHA-256 stand even if
  the MD5 is impeached.

- **Disputes over examination methodology evolution between
  acquisition and trial.** When a case sits between acquisition
  and trial for years, the methodology that was standard at
  acquisition may have been superseded by trial time. The sealed
  record lets the court evaluate methodology against the standard
  that was current at the moment of acquisition, not against the
  later standard.

The kit would NOT have resolved the underlying disputes about
guilt or innocence in any of these case types. It would have
resolved one specific evidentiary sub-dispute: whether the bytes,
tools, and procedures were what the agency claims they were at
the time the agency claims them.

---

## When to use this kit

- Your agency has a stable forensic SOP and wants to add a Bitcoin-
  anchored public attestation as a tamper-evident layer on top of
  the existing paper-and-signature chain-of-custody.
- You expect this case to involve significant defense challenge to
  forensic evidence (high-stakes case, novel methodology, contested
  tool versions, etc.).
- You can publish the listed fact set without exposing PII or
  vulnerable-person re-identifying data. (The kit's refusal rules
  enforce this; if your facts would require a refusal-rule break,
  do not use the kit.)
- The acquiring agency's general counsel and the prosecutor's office
  have reviewed the publication plan. Public publication of a case-
  identifier-bearing artifact has implications for ongoing
  investigations; counsel review is not optional.
- Your jurisdiction's defense discovery rules are compatible with
  the agency separately holding the role-to-individual binding
  record (hashed in FACT 05). If your jurisdiction requires public
  examiner-name disclosure, you must amend the kit accordingly.

## When NOT to use this kit

- **Do not use as a substitute for the agency's existing chain-of-
  custody documentation.** This kit is *additive*, not replacement.
  The agency's CMS, custody log, and discovery production
  obligations are unchanged.
- **Do not use if the acquisition involves CSAM, biometric
  templates, or other vulnerable-person re-identifying data at the
  file-level.** Image-level hashes of full disks are acceptable;
  file-level hashes of such material are NEVER acceptable, even
  under refusal-rule waiver. If you cannot construct a fact set
  without breaking R3, do not use the kit.
- **Do not use to claim the warrant was lawful, the seizure was
  proper, or the evidence is admissible** — the kit cannot do that,
  and refusal-rule R5 will reject any such claim.
- **Do not use under pressure to seal before acquisition is
  complete.** A partial-acquisition seal misrepresents the state.
- **Do not use to publish examiner personal names** unless your
  jurisdiction specifically requires it and your examiners have
  individually consented. The default is role-level publication.
- **Do not use in sealed or under-seal cases** without explicit
  court permission. Publishing a case identifier on Bitcoin is
  irreversible; if the case is later sealed, the public seal
  cannot be retracted. The kit is for public-record acquisitions
  only.
- **Do not use as legitimacy theater.** A seal of a flawed
  acquisition is a permanent public record of the flaws, not a
  defense against them. The primitive cuts both ways; that is its
  honesty.

## How to fork this kit for a real acquisition

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Critical timing:** seal AT or just after the conclusion of imaging
(FACT 05 event E17 in the example timeline). A seal during imaging
creates a partial-acquisition record; a seal much later creates a
gap during which the agency could have altered the images. The
right window is immediately after image verification completes for
the last item in the exhibit set.

**Critical review:** before sealing, run the publication through
a second forensic examiner (not the lead) and through agency
counsel. Once sealed, the publication is permanent.

## Integration with existing chain-of-custody infrastructure

- **Agency Case Management System (CMS).** The CMS remains the
  agency's primary system of record. The seal does not replace
  the CMS; it commits to the bytes and methodology the CMS records,
  so post-hoc CMS edits are publicly detectable.
- **Federal Rules of Evidence / Daubert / state evidence codes.**
  The seal contributes to the FRE 901 authentication record by
  providing tamper-evident integrity. It does NOT satisfy FRE 702
  /Daubert by itself; methodology reliability is still tested at
  the evidentiary hearing.
- **Defense discovery (FRCP 16, Brady, Giglio, and state
  equivalents).** The companion records hashed in FACT 05 (role-
  to-individual binding, custody log, tamper-seal photos, etc.)
  remain subject to normal discovery. The seal anchors what those
  records claimed at the moment of acquisition, so a later "the
  record was different at the time" claim is publicly refutable.
- **NIST Computer Forensics Tool Testing (CFTT).** The kit
  references CFTT verification logs in FACT 04 / FACT 05; the
  reference is a hash, not the log itself, so CFTT processes are
  unaffected.
- **Court-appointed neutrals and defense experts.** Either may
  re-hash the forensic images they receive in discovery against
  the FACT 03 manifest, independently of any agency cooperation.
  This is the kit's primary value-add for the defense side.
- **Appellate review.** Years later, an appellate forensic
  reviewer can verify the original acquisition methodology
  against the sealed FACT 04 record, rather than against the
  agency's possibly-evolved current recollection.

## What this kit does NOT replace

- The Federal Rules of Evidence (or any state evidence code).
- Daubert / Frye reliability standards for expert testimony.
- The agency's forensic SOP and CMS.
- Defense discovery obligations under FRCP 16 / Brady / Giglio /
  state equivalents.
- Court orders, suppression motions, evidentiary hearings, or any
  other court-administered process.
- NIST CFTT or any other tool-testing regime.
- The agency's privilege-filter / taint-team protocol.

## Why this kit exists in v0.4.0+

This is the 8th worked example shipped with myriam-kit. It follows
the constraint-first structure validated by the autoresearch
documented in `~/Genesis/calc/PROMPT_LIBRARY_v0.md` — the constraint-
first prompt variant scored highest on a weighted rubric across
multiple example domains. The opening sections are the load-bearing
parts of the kit; the manifest content is the easy part.

The kit's design is deliberately conservative on examiner-name
publication and aggressive on the "this does not establish
admissibility" disclaimer. The forensic community has a documented
history of being attacked for its forensic work; the kit defaults
to the safer position for examiners. Agencies in jurisdictions
where public personal-naming is required can amend their fork
accordingly, but the default refusal favors examiner safety.

## License

Public domain (CC0). Fork it. No attribution required.
