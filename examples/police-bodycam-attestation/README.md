# Police Body-Camera Footage Attestation Kit

A turnkey myriam-kit example for U.S. law-enforcement agencies — police
departments, sheriff's offices, state police, transit police, and other
agencies that operate body-worn cameras (BWCs), in-car dashboard cameras
(dashcams), and interview-room recording systems — who want to publish a
Bitcoin-anchored, tamper-evident seal of *what footage was captured*,
*by which devices*, *under which case identifier*, and *how it was
handled in custody* — at the moment the agency's evidence-management
system finishes ingesting the recordings from an incident, so that
silent post-incident deletion, editing, redaction expansion, or
"the footage doesn't exist" claims later become publicly detectable.

The seal is designed to be **diffable against any future agency
production of the same incident's footage**. That property is the whole
point. If the sealed manifest at intake says "26 video segments
totaling 14.2 GB with the following per-file SHA-256s," and the
agency three months later produces only 18 segments and claims the
others "were never captured," the discrepancy is a cryptographic
fact, not a he-said-she-said.

---

## What this kit DOES NOT do (read first)

The seal is a cryptographic timestamp of WHICH BWC, dashcam, and
interview-room recording files were ingested into the agency's evidence-
management system at WHICH TIME, under WHICH INCIDENT NUMBER, with
WHICH device-side metadata, and through WHICH CHAIN OF CUSTODY, signed
by the supervising sergeant AND a separate internal-affairs (IA)
officer. It cannot answer any question about the incident beyond that.
The following are **outside the seal's domain**:

1. **Proving the footage captured properly.** A BWC can be properly
   activated and still produce useless footage — firmware bug, lens
   occlusion (by uniform, holster, or hand), low-light failure, audio-
   only capture due to optical fault, microphone obstruction, dead
   battery cutting off mid-incident, dropped frames on a corrupted
   chip. The seal anchors the bytes that the device wrote and the
   agency received. It does NOT certify those bytes constitute a
   useful record of what happened. A perfectly sealed manifest of
   useless footage is still a useless record of the incident — but
   it is a tamper-evident record that the useless footage is what the
   agency actually has, so a later "we have better footage" or "we
   have no footage" claim is publicly refutable.

2. **Compelling public release.** Body-camera footage release is
   governed by state law, agency policy, prosecutorial decisions
   (during open investigations), and court orders. The seal does not
   change any of that. An agency can seal a manifest privately within
   their evidence-management workflow and still lawfully withhold the
   underlying footage from FOIA or public-records requests under
   applicable exemptions. The seal anchors WHAT EXISTS; it does not
   compel disclosure of the contents. (Conversely: an agency that
   seals a manifest and then claims footage doesn't exist is publicly
   contradicting their own sealed record.)

3. **Making a department transparent.** Sealing is a primitive, not a
   policy. A department with chronic transparency failures will not
   become transparent merely because it adopts cryptographic sealing.
   The seal makes the department's contemporaneous claims AUDITABLE.
   Whether the department's culture, leadership, and oversight
   institutions act on auditable claims is a question of governance,
   not of cryptography. The seal moves disputes from "did the footage
   exist" to "the footage existed; now what."

4. **Defending against the sealing officer themselves being the
   subject of the incident — i.e. coercion amplification.** The kit
   uses a two-signer model (supervising sergeant + IA officer)
   specifically to mitigate the case where the sealing officer is
   directly implicated in the conduct captured on the footage. If
   BOTH signers are implicated, or if the agency's IA function is
   itself compromised (a documented historical pattern in some
   departments), the seal records a coerced version of events with
   cryptographic integrity. The kit is honest: it is a non-repudiation
   primitive for the agency's contemporaneous claims, not a proof
   those claims are uncoerced. The mitigation here is the IA co-
   signature; agencies under federal monitoring (consent decree, DOJ
   pattern-or-practice oversight) should consider a third signer
   from the monitor's office, and the kit supports that variant via
   fork-and-extend.

5. **Substituting for FOIA, public-records requests, court-ordered
   discovery, or civilian-oversight subpoenas.** The seal is
   additive to existing release mechanisms. A sealed manifest
   reduces the need for "we don't know what we have" responses to
   public-records requests, but it does not by itself produce the
   footage to the requestor. Production happens through whatever
   release process applies in the jurisdiction. The seal commits
   to what the agency MUST be able to produce, on demand of a
   process with authority to demand it.

6. **Adjudicating use of force, officer misconduct, or any conduct
   question.** The seal anchors bytes and metadata. Whether the
   conduct depicted in those bytes was lawful, proper, within
   policy, criminal, or actionable in civil court is a question
   for prosecutors, IA, civilian oversight boards, juries, and
   courts. The seal contributes to the evidentiary record those
   institutions consider; it does not substitute for their
   adjudication.

7. **Preventing pre-capture failure modes.** "The camera fell off,"
   "the battery died," "the officer forgot to activate," "the
   wireless triggering failed" — these are pre-capture failures
   that produce no footage to seal in the first place. The seal
   anchors what WAS captured. A sealed manifest that shows fewer
   devices recording than the agency's activation policy would
   require is itself a useful contemporaneous record of the gap;
   it does not retroactively produce missing footage.

8. **Preventing front-end classification fraud.** An agency that
   silently classifies an incident as "no enforcement contact" at
   the moment of capture (which triggers shorter retention windows
   and may exempt the footage from public-records categories)
   produces a sealed manifest of an incident classified that way.
   The seal commits to the classification AT capture, so a later
   reclassification "we never considered that an enforcement
   contact" is publicly refutable; but the original (mis)classification
   is sealed with cryptographic integrity. The kit refuses to seal
   classification changes without a sealed amendment chain (refusal
   rule R8 below) — but it cannot detect contemporaneous
   misclassification at the moment it happens.

**The honest-limits section above is the load-bearing part of this
kit.** Departments that treat "we sealed our body-cam footage" as
equivalent to "we proved our officers acted properly" misuse the
primitive. The kit must say plainly: *this is a non-repudiation
primitive for the agency's contemporaneous claims about what footage
exists, when it was captured, what was done with it in custody, and
what was redacted from it — NOT a proof of officer conduct, NOT a
substitute for prosecutorial review, civilian oversight, or court
process, and NOT a defense against the pre-capture or contemporaneous-
classification failure modes that no cryptographic primitive can
catch.*

---

## What this kit MUST REFUSE to seal

The kit is configured to reject the following fact patterns even if a
user with valid agency signing authority submits them:

- **Identifying information for confidential informants.** No fact may
  name a CI, expose a CI's role in the case, reveal a CI-provided
  detail that would re-identify them within the local context, or
  include any informant code-name that maps to a specific person.
  CI safety is a frequent pre-condition of cooperation; a public
  Bitcoin-anchored ledger is not a venue for any CI-identifying
  data, even by hash, even with the agency's belief that the data
  is non-identifying. (R1)

- **Identifying information for victims of sexual assault, minors,
  or other statutorily protected categories.** No fact may name a
  sexual-assault victim, name a minor, expose a date-of-birth that
  combined with the incident context would re-identify a minor,
  reference a victim's address or routine, or include any hash or
  fingerprint that could be used to re-identify a protected-category
  victim. State victim-rights statutes and federal protections
  (Violence Against Women Act, Child Victims Act analogs, juvenile-
  record sealing statutes) categorically exclude such data from
  public disclosure; the seal must not become a re-identification
  vector. (R2)

- **Faces of bystanders who are not party to the incident.** A
  redacted/blurred version of the footage may be sealed (and the
  redaction event is itself a sealed fact under FACT 06). The kit
  REFUSES to seal an unredacted-bystander manifest as a public
  attestation. The unredacted footage remains in the agency's
  evidence-management system under the agency's retention policy;
  the public seal references redacted-bystander versions where
  bystanders are clearly visible. (R3)

- **Sealing by a single officer without IA co-signature.** Two-
  signer minimum: the supervising sergeant of the involved unit
  (or watch commander, depending on agency structure) AND a
  separate officer from internal affairs. This is non-negotiable.
  The gaming vectors here are exactly the kind that single-signer
  agency fraud has historically concealed; the entire point of
  IA co-signature is to break the failure mode where the same
  command structure that supervised the incident also controls
  the integrity record of the footage. Agencies whose IA function
  is itself disputed (under DOJ consent decree, under court-
  appointed monitor, etc.) should add a third signer from the
  monitoring authority — the kit supports this via fork-and-extend
  and refusal rule R4 enforces the two-signer floor. (R4)

- **Sealing partial-incident footage as if it were the complete
  incident record.** A sealed manifest that omits footage from
  officers known to have been present, or covers only the portion
  of the incident before/after a contested moment, is the
  paradigmatic gaming pattern. The kit requires FACT 03 (capture
  devices) to enumerate ALL devices known to have been recording
  during the incident window, and to explicitly list any device
  whose footage is NOT included in the seal (with the reason:
  "device offline," "device assigned to a different incident
  window," "footage on separate seal incident #XYZ"). A partial-
  incident seal without explicit gap disclosure is refused. (R5)

- **Sealing where the chain-of-custody log shows unexplained
  access gaps.** If FACT 05 (chain of custody) shows a period
  during which the footage was accessible without logged custody,
  or during which custody-log entries are missing, the kit
  refuses to seal until the gap is either explained in a sealed
  companion record or explicitly flagged as a "custody-log
  anomaly" with the gap's start, end, and known facts about who
  had access. The seal must not paper over a custody gap by
  silently ignoring it; sealing an explicit "we had an
  unexplained 4-hour gap" is acceptable (and is itself the
  load-bearing forensic record), but sealing a chain-of-custody
  log that has been retroactively smoothed over the gap is not. (R6)

- **Identifying information for officers other than role-level
  identification of the sealing principals.** Individual on-scene
  officers are identified by ROLE and BADGE-LEVEL identifier (e.g.
  "Body Camera 17 was worn by Officer with badge number redacted
  to its last two digits — see role-to-badge binding hashed in
  FACT 05"). The supervising sergeant and IA officer who sign the
  attestation are named at the role level (sergeant of [Unit Y]
  on [date]; IA case officer assigned to [Incident #X]) but
  personal names are sealed separately in the agency record. The
  reason: officer-personal-naming on a public ledger creates a
  retaliation surface against the officers most likely to honestly
  attest to problematic numbers (whistleblowers, dissenters,
  members of historically-targeted demographic groups within the
  department). Agencies in jurisdictions where statute requires
  public personal-naming of sealing officers should amend their
  fork; the default refusal favors signer safety. (R7)

- **Sealing of a re-classified incident without a sealed amendment
  chain back to the original classification.** If the incident was
  initially classified one way at capture (e.g. "Type 4 — non-
  enforcement contact") and is later re-classified another way
  (e.g. "Type 1 — use of force"), the new seal MUST reference the
  prior seal's Merkle root in FACT 02 with the classification-
  change reason. The kit refuses to seal a re-classification as if
  it were the original classification. (R8)

A refusal itself may be sealed as a fact ("This agency requested
sealing of X; the kit refused per refusal-rule Y"), creating a public
record of attempted misuse.

---

## What this kit DOES seal

8 facts at the moment of evidence-management-system ingest completion:

1. **Example notice** — declares the publication an example (real
   attestations remove or replace this).
2. **Incident identification** — case/incident number, agency
   identification, ORI (FBI Originating Agency Identifier),
   jurisdiction, supervising sergeant role + IA officer role.
3. **Capture devices** — per-device serial numbers, firmware
   versions, recording start/stop times, activation triggers,
   battery state at start and end, any mid-recording fault flags.
4. **Footage manifest** — per-file SHA-256 hashes of all video
   segments, audio-only segments, and metadata sidecar files
   (.json activation logs, GPS tracks, accelerometer records),
   broken out by capture device.
5. **Chain of custody** — upload time from device-to-dock, dock-
   to-server transfer log, custodians by role, evidence-management-
   system access events, locations of storage, any access events
   by non-case personnel.
6. **Redaction log** — any blurring (face, body, license plate),
   audio bleeping (PII, profanity per agency policy, victim
   identification), reason for each redaction, reviewer role,
   and SHA-256 of the unredacted and redacted versions so the
   redaction is itself a tamper-evident change.
7. **Companion disclosures and refusal record** — pending IA
   investigations on involved officers, pending civil suits naming
   involved officers or the department, federal monitoring status
   (DOJ pattern-or-practice investigation, consent decree),
   recusal disclosures by either signer, prior officer-camera-
   policy violations within the prior 12 months; explicit list
   of patterns the kit refused to seal.
8. **Signing principal** — agency identification + supervising
   sergeant role + IA officer role + cryptographic key info,
   both signers required per refusal rule R4.

Each fact ends with the refusal-gate convention: *"This fact asserts
only X. It does not assert Y"* (where Y is the closest failure mode
from the "DOES NOT do" section above).

---

## What this kit defends against

- **Silent post-incident footage deletion.** Any post-seal removal
  of a video segment changes the FACT 04 manifest's expected count
  and any agency production missing a sealed segment is publicly
  refutable. A defense attorney, civil-rights plaintiff's counsel,
  IA investigator, civilian-oversight board member, journalist, or
  court-appointed neutral who possesses the sealed manifest can
  enumerate exactly what segments must exist and demand each one.
- **Retroactive "we never had that footage" claims.** FACT 04
  freezes the per-segment hash list at intake. A later claim that
  a segment never existed contradicts the seal.
- **Post-incident editing of footage content.** Any byte-level
  change to any sealed segment produces a different SHA-256. A
  defense expert or court-appointed neutral re-hashing the
  produced footage against the sealed FACT 04 detects the edit.
- **Post-incident redaction expansion.** FACT 06 freezes the
  redaction events that have been applied AT INTAKE. Additional
  redactions applied later require a new sealed amendment
  referencing this seal's Merkle root, so silent post-hoc
  redaction is publicly detectable.
- **"The camera malfunctioned" claims that arose only after public
  interest in the incident.** FACT 03 freezes the device's self-
  reported fault flags at intake. A later "the camera had a known
  bug at the time" claim that does not appear in the contemporary
  device fault flags is publicly refutable.
- **Post-arrest re-classification of recording metadata.** FACT 02
  freezes the incident classification at the time of ingest. A
  later re-classification requires a new sealed seal that
  references this one (per refusal rule R8), making the
  re-classification trajectory publicly walkable.
- **Chain-of-custody log alteration.** FACT 05 freezes the custody-
  event timeline. Adding, removing, or re-timestamping a custody
  event changes the FACT 05 hash and is publicly detectable.
- **Selective omission of companion disclosures.** FACT 07
  enumerates the expected disclosure categories (pending IA,
  pending litigation, federal monitoring, signer recusals,
  prior policy violations); an empty category must be
  explicitly attested ("none at intake time"), so a later
  "we didn't realize that was relevant" is publicly refutable.

The kit does **not** defend against contemporaneous fraud — a two-
signer team that intentionally seals false metadata at intake produces
a cryptographically valid seal of false metadata. The primitive is
honest about this: it is a non-repudiation primitive for the agency's
contemporaneous joint claim, not a proof that claim is correct. The
two-signer model and the companion disclosures raise the bar of
required collusion but do not eliminate it.

---

## Historical patterns the kit would have helped with

The kit would have produced a useful contemporaneous record — *not a
resolution* — in past cases where body-camera and dashcam footage
chain-of-custody became a disputed evidentiary or public-trust issue.
These are described by case type so the primitive's value-add is
visible without reducing any case to its forensic-record sub-dispute:

- **High-profile use-of-force cases where multiple officer body
  cameras were known to be present and only a subset of footage was
  released in the initial public disclosure.** The pattern across
  multiple cases in the 2014-2025 period was that early releases
  showed only some of the available BWC angles; additional footage
  surfaced later, sometimes weeks or months after the incident.
  A sealed FACT 04 manifest at intake would have made the universe
  of footage publicly known at the moment of intake; subsequent
  partial releases would be visibly partial against the sealed
  manifest, and any "we just discovered this additional footage"
  framing would be testable against the sealed record.

- **Cases involving delayed footage release.** In several
  documented cases, agencies released body-camera or dashcam
  footage weeks or months after the incident, sometimes only
  under court order or after significant public pressure. The
  seal does not compel release; it commits the agency to the
  fact that the footage existed and was in custody from intake
  onward. "We were still reviewing it" is a release-timing
  question; "we didn't have it" is a factual question the seal
  answers.

- **Cases where private cellphone video and official body-cam
  footage showed different timelines, and the official footage's
  start/stop times became a dispute.** The seal's FACT 03
  freezes the device's self-reported start/stop times and the
  activation trigger at intake. A later dispute about "when did
  the body camera turn on" is testable against the sealed
  device metadata, not against the agency's later recollection.

- **Routine 'the camera fell off' / 'battery died' / 'wasn't
  activated' claims across many smaller cases.** These claims
  are typically unfalsifiable after the fact. The seal makes
  them PRE-FALSIFIABLE: FACT 03 records the activation log,
  battery state, and mid-recording fault flags at intake.
  If the device's own contemporaneous log shows it was on and
  recording, a later "it wasn't on" claim is publicly refutable.
  If the device's log shows it was off, the seal anchors that
  fact too — making it harder to later claim it was on, and
  making it impossible to silently shift the answer either
  direction.

- **Cases involving interview-room footage where the room camera
  was alleged to have been turned off during portions of the
  interrogation.** A sealed FACT 04 manifest of the interview-
  room recording for the relevant session locks in what was
  captured and what gaps exist. Gaps are sealed as gaps; they
  cannot later be re-narrated as "the camera was always on" or
  "we never use that room's camera."

- **Multi-jurisdiction cases (joint federal/state task force,
  inter-agency assists) where chain-of-custody between agencies
  became contested.** FACT 05's per-event timeline makes the
  hand-off points explicit, and the receiving agency's separate
  seal of their intake creates a two-sided cryptographic
  attestation of what was transferred.

The kit would NOT have resolved the underlying disputes about
officer conduct, prosecutorial decisions, or civil liability in any
of these case types. It would have resolved one specific evidentiary
sub-dispute: whether the bytes, devices, custody trail, and
redaction events were what the agency claims they were at the time
the agency claims them.

---

## When to use this kit

- Your agency has a stable BWC / dashcam / interview-room
  evidence-management workflow and wants to add a Bitcoin-anchored
  public attestation as a tamper-evident layer on top of the
  existing chain-of-custody documentation.
- You expect this incident to involve significant defense
  challenge, civil-rights litigation, IA review, civilian-oversight
  scrutiny, or media interest in the footage record, and want a
  globally verifiable timestamp of what existed at intake.
- You can publish the listed fact set without exposing PII
  protected by refusal rules R1-R3.
- Your agency's general counsel and the prosecutor's office (where
  applicable) have reviewed the publication plan. Public publication
  of an incident-identifier-bearing artifact has implications for
  ongoing investigations; counsel review is not optional.
- Your jurisdiction's public-records and victim-rights statutes are
  compatible with the seal's fact set (the seal commits to what
  exists, not to releasing what exists — but the existence record
  itself may be subject to disclosure depending on jurisdiction).
- Your IA function is operationally independent enough that the
  IA co-signature is meaningful. If IA is captured (under federal
  monitoring suggests it might be), add a third signer from the
  monitoring authority.

## When NOT to use this kit

- **Do not use as a substitute for the agency's existing chain-of-
  custody documentation, evidence-management system, or release
  procedures.** This kit is *additive*, not replacement.
- **Do not use if the incident involves protected-category victims
  whose identifying data cannot be excluded from a meaningful fact
  set.** Refusal rules R1-R3 will reject these. Fix the data inputs
  first; if the fact set cannot be constructed without a refusal-
  rule break, do not use the kit.
- **Do not use as a substitute for FOIA, public-records requests,
  or court-ordered discovery.** The seal commits to existence; it
  does not compel disclosure.
- **Do not use to claim officer conduct was justified, lawful,
  within policy, or otherwise endorsed.** The seal anchors bytes,
  not conduct. Refusal patterns will reject conduct claims.
- **Do not use under pressure to seal partial footage as complete.**
  Refusal rule R5 enforces this; the right response is to seal
  an explicit partial-incident attestation that names the gaps.
- **Do not use to publish unredacted bystander faces.** Refusal
  rule R3.
- **Do not use single-signer to bypass the two-signer rule.**
  Refusal rule R4. If your IA function is unavailable, defer
  sealing until a qualified co-signer is available; the integrity
  of the two-signer model is the entire mitigation against
  single-signer institutional fraud.
- **Do not use as legitimacy theater.** A seal of an
  incident with documented chain-of-custody problems is a
  permanent public record of the problems, not a defense
  against them. The primitive cuts both ways; that is its
  honesty.

## How to fork this kit for a real incident

```bash
cp -r ~/Genesis/myriam-kit/examples/police-bodycam-attestation ~/incident-2026-NNNN
cd ~/incident-2026-NNNN
$EDITOR facts/*.txt        # replace fictional content with real
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL AT evidence-management ingest completion
                           # + supervising sergeant AND IA officer sign-off
python3 build/verify.py    # confirm
```

**CRITICAL TIMING:** seal AT or just after the evidence-management
system finishes ingesting ALL footage from the incident window. Do
not seal mid-ingest (a partial-ingest seal misrepresents the
manifest). Do not seal much later (a gap during which the agency
could have altered the footage undermines the seal's value). The
right window is between ingest completion and any external review
of the footage.

**CRITICAL REVIEW:** before sealing, the supervising sergeant and
IA officer must both independently verify the manifest. Each must
have read the facts. The two-signer model is a co-signature, not a
rubber stamp; both signers carry the same attestation weight under
their respective oaths.

**RE-CLASSIFICATION OR AMENDMENT:** if the incident is later re-
classified or additional footage surfaces, the new seal MUST
reference this one's Merkle root in FACT 02 (per refusal rule R8).
A chain of seals across the incident's life is publicly walkable
and shows the trajectory of the record.

## Integration with existing law-enforcement infrastructure

- **Agency Evidence-Management System (EMS) / Digital Evidence
  Management System (DEMS).** Vendors such as Axon (Evidence.com),
  Motorola (CommandCentral Vault), Genetec (Clearance), and
  in-house systems. The seal does not replace the DEMS; it commits
  to what the DEMS ingested.
- **FBI National Incident-Based Reporting System (NIBRS) / Uniform
  Crime Reporting (UCR).** The incident identifier in FACT 02 can
  cross-walk to NIBRS reporting; the seal does not replace NIBRS
  reporting.
- **State public-records laws (state Sunshine Act / FOIA analogs).**
  Compatible. The seal commits to what exists; release is governed
  by state law. The existence record itself may or may not be
  subject to disclosure depending on jurisdiction; counsel review
  required.
- **DOJ pattern-or-practice oversight and consent decrees.** When
  in effect, the monitor may require the seal to include a third
  signer from the monitoring office; the kit supports this via
  fork-and-extend.
- **Federal civil rights statutes (42 U.S.C. §1983 civil suits;
  18 U.S.C. §242 criminal civil-rights prosecutions).** The seal
  contributes to the evidentiary record; it does not adjudicate
  liability.
- **State officer-discipline review boards and police-and-fire
  commissions.** Compatible. The seal records what existed at
  intake; the discipline process evaluates conduct.
- **Civilian Oversight Boards (CCRB-style, Police Advisory
  Commissions, Independent Police Monitor offices).** The seal
  is the kind of contemporaneous integrity record civilian
  oversight has historically had difficulty obtaining; sealed
  publication makes the existence-record publicly accessible
  to the oversight body without requiring agency cooperation
  on the existence question.
- **Prosecutorial discovery obligations (Brady / Giglio / state
  equivalents).** The seal anchors the contemporaneous evidence
  manifest, which is the substrate Brady production runs against.
  Late-discovered Brady material that appears in the sealed
  manifest but was not produced is publicly detectable.

## What this kit does NOT replace

- The agency's chain-of-custody documentation and evidence-
  management system.
- State public-records / FOIA / Sunshine Act release procedures.
- Court-ordered discovery (FRCP 16, state equivalents, civil
  discovery rules).
- Prosecutorial Brady / Giglio production.
- IA investigation procedures and findings.
- Civilian oversight board investigations and findings.
- DOJ pattern-or-practice oversight and consent-decree
  monitoring.
- Federal civil-rights enforcement (DOJ Civil Rights Division;
  private 42 U.S.C. §1983 actions).
- State officer-discipline review.
- Coroner / medical-examiner investigations (in incidents
  involving death).
- The criminal trial of any officer or any other person.

## Adoption value and honest estimate of impact

The United States employs approximately 700,000 sworn local and
state law-enforcement officers across roughly 18,000 agencies. As
of the mid-2020s, an estimated 85 percent of those officers wear
body cameras during at least some duty shifts (DOJ Bureau of
Justice Statistics, periodic Law Enforcement Management and
Administrative Statistics survey; vendor-side market reports from
Axon and competitors). Municipal-government payouts in police
misconduct civil-rights lawsuits in the United States are
estimated in the multi-billions of dollars annually (peer-
reviewed estimates and journalism aggregating municipal
settlement data have placed the recent-years total in the $2-4
billion-per-year range, with substantial year-over-year and
jurisdictional variability; see Schwartz, *Notre Dame Law
Review* 2018 and follow-on work; *Washington Post* and
*New York Times* municipal-settlement databases for ongoing
aggregation).

**The honest impact estimate:**

A sealed body-camera footage manifest does not prevent
misconduct; it makes one category of evidentiary dispute (the
"did the footage exist / was it complete / was it altered"
category) cryptographically resolvable. If sealed attestations
are adopted by agencies representing ~10 percent of US sworn
officers over 5 years, and if even ~5 percent of currently-
contested civil-rights cases would be resolved more efficiently
(faster settlement, narrower factual disputes, fewer
prolonged-discovery battles) by an unimpeachable contemporaneous
footage manifest, the avoided cost of prolonged litigation and
mis-resolved cases is plausibly in the **low-to-mid hundreds of
millions of dollars per year** in averted municipal payouts and
litigation expense, plus reduced reputational damage to agencies
that voluntarily seal.

**Lives equivalent:** translation from municipal-payout savings to
lives is contested and the kit refuses to publish a single
authoritative casualty figure. The chain of inference from
"footage disputes resolved" to "different conduct in future
encounters" to "lives saved" runs through several poorly
identified parameters. A reasonable framing: at the GiveWell-
cited cost-effectiveness benchmark for the best-evidence global-
health interventions (~$5,000 per life saved), $150M/year in
averted social cost translates to a notional ~30,000 life-
equivalent value per year if redirected — but this is an
upper-bound thought experiment, not a forecast of literal lives
saved by sealing footage. The direct value is in dispute
resolution and the demonstration that the department's
contemporaneous claims are publicly auditable.

**The honest framing:**

The case for adoption is not "this kit will save N lives." It is:
*if you believe the published literature on body-camera
evidentiary disputes and municipal misconduct-payout patterns is
roughly correct, then a tamper-evident contemporaneous footage
manifest is the cheapest available primitive that resolves one
specific class of evidentiary dispute and makes one specific
class of post-incident agency claim publicly checkable. The seal
does not produce justice; it makes one input to justice
processes more honest. Adopt the kit on that understanding, not
on a lives-saved promise.*

The deterrent effect — officers who know the footage manifest is
sealed at intake are less likely to assume later editing or
deletion will conceal what they did — is real but unquantified.
The reputational gain for agencies that voluntarily seal is
also real and unquantified. The primary measurable value is in
the dispute-resolution channel.

The kit defaults are deliberately conservative on victim-
identifying data (refusal rules R1-R2), aggressive on
bystander privacy (refusal rule R3), and aggressive on the
"this is not a conduct claim" disclaimer. Agencies in
jurisdictions where statutory requirements differ can amend
their fork accordingly, but the default refusals favor
protected-category privacy, signer safety, and honest scope.

## License

Public domain (CC0). Fork it. No attribution required.
