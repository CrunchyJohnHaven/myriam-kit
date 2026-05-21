# Whistleblower Manifest Seal Kit

A turnkey myriam-kit example for whistleblowers facing the specific
failure mode where **evidence gets buried, edited, or disputed by
intermediaries between the whistleblower and the public**. The
canonical historical cases this defends against:

- Boeing 737 MAX (internal safety reports discounted/buried)
- Theranos (lab-test concerns suppressed for years)
- FDA inspector reports edited post-submission
- Frances Haugen / Facebook (sealed manifest would have proven
  documents were authentic and existed at the asserted time)

What this kit defends against (in protocol terms):

- T1–T3 in [FACT 05](facts/05_threat_model.txt): public dispute of
  document contents, claims documents weren't sealed at the asserted
  time, claims of retroactive fabrication.
- T9: third parties handing journalists altered copies.

What this kit does **not** defend against:

- Personal retaliation against the whistleblower (T7).
- Pressure on the whistleblower to retract (T4, partially mitigated by
  FACT 07 making silent retraction publicly detectable).
- Legal action against the whistleblower for disclosure itself (T5).
- Discrediting the whistleblower's character (T8).
- Intermediaries silently dropping the story (T10).

If you are a whistleblower considering using this kit, **read this
entire README first**. The protocol is a tool. The protocol is not a
substitute for legal counsel, a journalist, a regulator, or careful
operational security.

## What this kit produces

A cryptographically sealed *manifest* of evidence (not the evidence
itself) that proves:

1. The specific bytes of each evidence file existed at the moment of
   sealing.
2. The sealing happened at or before a specific time (via Bitcoin OTS
   attestation).
3. The provenance, allegation, threat model, recipient protocol, and
   no-silent-retraction commitment were all declared together.

The underlying documents stay in your possession until you send them
to a recipient. Recipients verify they received the same bytes you
sealed.

## When to use this kit

You should consider sealing a manifest **before** transmitting evidence
to a journalist, regulator, or attorney, if all of the following are true:

- You have evidence in digital form (PDFs, emails, images, etc.) that
  you want preserved as bytewise authentic.
- You expect that intermediaries may alter, dispute, or bury the
  evidence.
- You can keep the underlying documents in your possession until
  transmission.
- You can publish the manifest publicly **without** revealing the
  contents of the documents (only the hashes are public).
- You have weighed the risks of becoming publicly identifiable as a
  whistleblower (the signing-principal field). If anonymous, use a
  pseudonym consistently across all related publications.
- You have consulted an attorney about whistleblower-protection law
  in your jurisdiction.

## When NOT to use this kit

Do NOT use this kit if:

- The documents themselves contain personal information about third
  parties (patients, customers, employees) that should not be made
  public-hashable. Hash a redacted version, not the original.
- The act of publishing the manifest itself would identify the
  whistleblower in a way they have not consented to.
- You have not yet consulted an attorney. The protocol is a tool;
  whistleblower-protection law is jurisdiction-specific and lives
  outside the protocol.
- You might want to retract any single allegation later. The seal is
  permanent; new sealed corrections are the only honest way to revise.
- You are doing this under duress or time pressure. The protocol
  amplifies coercion; the refusal gate (myriam-kit `SPEC §8`) applies
  to whistleblowers as well as to publishers.

## How to fork this kit for a real disclosure

```bash
# 1. Copy this example into a new directory
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Remove the fictional content; replace with your real facts.
# Each file under facts/ is one fact. Read each and replace.
$EDITOR facts/01_example_notice.txt   # change to a real cover statement
$EDITOR facts/02_provenance.txt       # real provenance of your evidence
$EDITOR facts/03_evidence_manifest.txt # hash your real documents and list them
$EDITOR facts/04_allegation_summary.txt # your real allegation
$EDITOR facts/05_threat_model.txt     # your real expected responses
$EDITOR facts/06_recipient_protocol.txt # adjust for your recipient
$EDITOR facts/07_no_retraction_commitment.txt # your no-retraction declaration
$EDITOR facts/08_signing_principal.txt # your real signing identity (or pseudonym)

# 3. Update site/index.html to reflect the real facts.
# The seal.sh script does NOT auto-populate the HTML; the manual edit
# is the human-review step.
$EDITOR site/index.html

# 4. Seal.
bash build/seal.sh
# Outputs: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Verify locally.
python3 build/verify.py

# 6. Publish the manifest (NOT the documents) to any of:
#    - A static host you control (Cloudflare Pages, GitHub Pages, etc.)
#    - The IPFS network at the printed CID
#    - Both (recommended)

# 7. Separately, transmit the underlying documents to the recipient
#    via a secure channel of your choice (Signal, SecureDrop, etc.).
#    The recipient verifies file hashes against your manifest.
```

## Computing hashes for the real evidence files

To hash a document file with SHA-256:

```bash
shasum -a 256 my_document.pdf
```

The first 64 hex characters are the SHA-256. Put that in the manifest.

You can hash many files at once:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

That gives you the data for `facts/03_evidence_manifest.txt`.

## Operational security notes

The MYRIAM protocol does NOT provide operational security. It provides
*evidentiary durability*. You still need:

- A secure communication channel to your attorney
  ([Signal](https://signal.org/), in-person, or your attorney's
  established secure channel)
- A secure storage location for the underlying documents (encrypted at
  rest, not on cloud services your employer can access)
- A clean device for the sealing (a personal laptop not associated
  with employer accounts; preferably one used only for this purpose)
- A clean network for publication (not your employer's network, not
  your home IP if your employer might subpoena your ISP)

Recommended reading on operational security for whistleblowers:

- [The Intercept's SecureDrop documentation](https://securedrop.org/)
- [Freedom of the Press Foundation's resources](https://freedom.press/)
- [EFF's surveillance self-defense guide](https://ssd.eff.org/)

Consult them BEFORE you start the sealing process. The protocol does
not protect against bad opsec choices made before the protocol is invoked.

## What recipients should know

Send recipients this README along with the sealed manifest. The manifest
itself contains the recipient protocol (FACT 06), but the README
expands the recipient role:

- **Journalists**: verify the manifest's own integrity first. Then
  request the documents through a separate secure channel. Verify
  each document's SHA-256 matches the manifest before publication.
  Do NOT publish the documents without the whistleblower's consent;
  do publish the existence of the sealed manifest and your verification
  conclusion.
- **Regulators**: same verification process. The sealed manifest plus
  matching documents is the strongest evidentiary form available
  outside of formal chain-of-custody collection.
- **Attorneys**: the sealed manifest provides forensic anchoring for
  the existence of the documents at the asserted time. Whether it
  satisfies any specific jurisdiction's evidence-rules is for you to
  determine.

## What this kit is NOT

- Not a substitute for legal counsel.
- Not a guarantee that anyone will act on your disclosure.
- Not a protection against retaliation.
- Not an authentication of the documents' contents (only of their
  bytes-at-time-of-sealing).
- Not a way to anonymously communicate with anyone — the seal is
  public; if your signing-principal name is real, you are identified.

## Closing

A sealed manifest is a small thing. It is one byte stream proving a
larger set of byte streams existed in a particular form at a particular
time. That smallness is its strength: it does only one thing, and it
does that one thing across the lifetime of the Bitcoin blockchain.

If you are reading this because you are considering becoming a
whistleblower, please: talk to an attorney first. Use the operational
security guides above. Then, if and only if all those upstream
considerations are in order, consider this kit as the cryptographic
backbone of your disclosure. The crypto is the easy part. Everything
upstream of the crypto is where the real risk lives.

## License

Public domain (CC0). Fork it. Improve it. Use it without asking permission.
