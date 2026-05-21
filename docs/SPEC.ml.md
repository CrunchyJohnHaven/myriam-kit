# MYRIAM-kit Protocol Specification

*മലയാള പരിഭാഷ — യഥാർത്ഥ ഇംഗ്ലീഷ് പതിപ്പിന് [SPEC.md](SPEC.md) കാണുക*

## 0. ഉദ്ദേശ്യം

ഏതെങ്കിലും ഒറ്റ ഹോസ്റ്റിംഗ് ദാതാവിന്റെ takedown സംഭവിച്ചാലും നിലനിൽക്കുന്ന,
tamper-evident-ഉം cryptographically verifiable-ഉം ആയ രൂപത്തിൽ ഒരു ചെറിയ
കൂട്ടം ടെക്സ്റ്റ് വസ്തുതകൾ പ്രസിദ്ധീകരിക്കാനുള്ള ഒരു മിനിമൽ പ്രോട്ടോക്കോൾ
ഈ document specify ചെയ്യുന്നു.

[disclosure.host](https://disclosure.host)-ൽ "MYRIAM v1" എന്ന പേരിൽ ആദ്യമായി
deploy ചെയ്യപ്പെട്ട പ്രോട്ടോക്കോളിന്റെ generalisation ആണിത്.

## 1. Non-goals

- രഹസ്യ സംഭരണം. നിർമ്മാണത്തിലൂടെ എല്ലാം പൊതുവായതാണ്.
- വലിയ ഡാറ്റാസെറ്റുകൾ. ~20 വസ്തുതകൾക്കപ്പുറം, പ്രോട്ടോക്കോൾ തെറ്റായ shape
  ആണ്.
- തത്സമയ പ്രസിദ്ധീകരണം. ഓരോ പ്രസിദ്ധീകരണവും ഒരു discrete sealing event ആണ്.
- Retraction. പ്രോട്ടോക്കോൾ version level-ൽ append-only ആണ്.

## 2. ഫാക്ട് മോഡൽ

ഒരു FACT എന്നത് ഇനിപ്പറയുന്നവയുള്ള ഒരു UTF-8 ടെക്സ്റ്റ് ഫയലാണ്:

- ഫയൽനെയിം pattern: `NN_short_name.txt`, ഇവിടെ NN എന്നത് 01 മുതൽ ആരംഭിക്കുന്ന
  zero-padded രണ്ടക്ക index ആണ്.
- Canonical form: bytes as-written, normalisation ഇല്ല.
- Per-fact hash: `SHA-256(file_bytes)`-ന്റെ lowercase hex.

ഫാക്ട് SET എന്നത് `facts/`-ന് കീഴിലുള്ള pattern-മായി match ചെയ്യുന്ന എല്ലാ
ഫയലുകളുടെയും ordered ലിസ്റ്റ് ആണ്, lexicographic ക്രമത്തിൽ സോർട്ട് ചെയ്തത്.

Constraint: ഓരോ ഫാക്ട് body-യും ഒരു specific കക്ഷിക്ക് attribute ചെയ്യാവുന്ന
*naming event* അല്ലെങ്കിൽ *declaration event* ആയി SHOULD phrase ചെയ്യണം.
Ontological claims ("the moon is rock") verifiability gate-നെ
ദുർബലപ്പെടുത്തുന്നു; പ്രസിദ്ധീകരണ event മാത്രമേ verify ചെയ്യാനാകൂ, claim
അല്ല. "X has stated Y" എന്നതാണ് ശരിയായ form. "Y is true" അല്ല.

## 3. Merkle root

Deploy ചെയ്ത MYRIAM പ്രോട്ടോക്കോളിന്റെ v0-ലെ പോലെ Bitcoin-style:

1. Leaves: ഫാക്ട്-സെറ്റ് ക്രമത്തിലുള്ള per-fact SHA-256 hashes.
2. ഒരു level-ന് odd എണ്ണം നോഡുകൾ ഉണ്ടെങ്കിൽ, അവസാന നോഡ് duplicate ചെയ്യുക.
3. Adjacent നോഡുകൾ pair-hash ചെയ്യുക: `parent = SHA-256(left_bytes || right_bytes)`,
   ഇവിടെ `left_bytes`-ഉം `right_bytes`-ഉം raw 32-byte hash മൂല്യങ്ങളാണ്
   (അവയുടെ hex representations അല്ല).
4. ഒരു നോഡ് ശേഷിക്കുന്നതുവരെ ആവർത്തിക്കുക. അതാണ് Merkle root.

Root trailing newline ഇല്ലാതെ lowercase hex ആയി പ്രസിദ്ധീകരിക്കുന്നു.

### 3.1 ടെസ്റ്റ് വെക്ടറുകൾ

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

ഏതെങ്കിലും compliant implementation ഈ vectors MUST reproduce ചെയ്യണം.
യഥാർത്ഥ `lib/build.py`-ൽ നിന്നാണ് അവ derive ചെയ്തിരിക്കുന്നത്, ആ script
ഉപയോഗിച്ച് വീണ്ടും ജനറേറ്റ് ചെയ്യാം.

## 4. Bitcoin commitment

[OpenTimestamps](https://opentimestamps.org) വഴി Merkle root Bitcoin
ബ്ലോക്ക്‌ചെയിനിലേക്ക് commit ചെയ്യുന്നു. Default policy:

> സ്വതന്ത്ര administrative നിയന്ത്രണത്തിന് കീഴിലുള്ള കുറഞ്ഞത് രണ്ട്
> calendar operators-നെതിരെ Stamp ചെയ്യുക.

ഈ policy തൃപ്തിപ്പെടുത്തുന്ന ഒരു receipt `ots verify <receipt>.ots` റൺ
ചെയ്യാനും ഏതെങ്കിലും calendar-ന്റെ upgrade path-ൽ എത്താനും കഴിയുന്ന
ഏതെങ്കിലും കക്ഷിക്ക് verify ചെയ്യാവുന്നതാണ്.

`lib/seal.sh`-ൽ ഷിപ്പ് ചെയ്ത default operator pair:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementations MAY വ്യത്യസ്ത operators ഉപയോഗിക്കാം. Witness-diversity
policy (≥2 സ്വതന്ത്ര operators) normative ആണ്; specific operators അല്ല.

## 5. Content-addressed mirroring

പ്രസിദ്ധീകരിച്ച പേജും ഫാക്ട് ഫയലുകളും അടങ്ങിയ `site/` ഡയറക്ടറി IPFS-ലേക്ക്
SHOULD ചേർക്കണം:

```
ipfs add -r --cid-version=1 -Q site/
```

തത്ഫലമായുണ്ടാകുന്ന CIDv1 (dag-pb codec) ആണ് പ്രസിദ്ധീകരണത്തിന്റെ content
address. ഇത് `site/`-ന്റെ byte content-ൽ നിന്ന് deterministic ആണ്. `site/`-ന്
കീഴിലുള്ള ഏതെങ്കിലും ഫയലിലെ ഏതെങ്കിലും modification ഒരു വ്യത്യസ്ത CID
ഉത്പാദിപ്പിക്കുന്നു.

പ്രസാധകന്റെ ലോക്കൽ നോഡിന് അപ്പുറം അധിക സേവനങ്ങളിലേക്കുള്ള Pinning
ദീർഘായുസ്സിനായി ശക്തമായി ശുപാർശ ചെയ്യുന്നു; ഈ specification specific
സേവനങ്ങൾ mandate ചെയ്യുന്നില്ല.

## 6. Versioning

പ്രോട്ടോക്കോൾ **version level-ൽ append-only** ആണ്. ഓരോ മാറ്റത്തിനും ഒരു
പുതിയ സീൽ ചെയ്ത version ആവശ്യമാണ്:

- ഒരു പുതിയ (അല്ലെങ്കിൽ മാറ്റമില്ലാത്ത) specification revision
- ഒരു പുതിയ ഫാക്ട് സെറ്റ്, ഇത് മുൻ versions-ൽ നിന്നുള്ള വസ്തുതകൾ
  മാറ്റമില്ലാതെ MAY ഇൻഹെറിറ്റ് ചെയ്യാം
- ഒരു പുതിയ Merkle root
- ഒരു പുതിയ OpenTimestamps receipt
- ഒരു പുതിയ IPFS CID

എല്ലാ മുൻ versions-ഉം versioned URLs-ൽ പ്രസിദ്ധീകരിക്കപ്പെട്ടു നിലനിൽക്കും.
ഏതെങ്കിലും v(N) ഫാക്ടിലെ മാറ്റത്തിന് v(N+1) ആവശ്യമാണ്, രണ്ട് versions-ഉം
ദൃശ്യവും വീണ്ടും verify ചെയ്യാവുന്നതുമായിരിക്കും.

## 7. Verification

ഏതെങ്കിലും മൂന്നാം കക്ഷിക്ക് ഒരു പ്രസിദ്ധീകരണത്തിന്റെ സമഗ്രത ഇനിപ്പറയുന്ന
വിധത്തിൽ verify ചെയ്യാം:

1. ഫാക്ട് ഫയലുകൾ ഡൗൺലോഡ് ചെയ്ത് per-fact SHA-256 hashes വീണ്ടും കണക്കാക്കുക.
2. §3 പ്രകാരം Merkle root വീണ്ടും കണക്കാക്കി പ്രസിദ്ധീകരിച്ച root-മായി
   താരതമ്യം ചെയ്യുക.
3. കുറഞ്ഞത് ഒരു calendar-ന്റെ പൂർണ്ണ attestation-നായി Bitcoin
   ബ്ലോക്ക്‌ചെയിനിനെതിരെ OpenTimestamps receipt verify ചെയ്യുക.
4. `ipfs add -r --cid-version=1` വഴി IPFS CID സ്വതന്ത്രമായി വീണ്ടും
   കണക്കാക്കി പ്രസിദ്ധീകരിച്ച CID-മായി താരതമ്യം ചെയ്യുക.

Python stdlib-ഉം `ots` client-ഉം ഒഴികെ ബാഹ്യ dependencies ഇല്ലാതെ
`lib/verify.py` ഘട്ടങ്ങൾ 1–3 നടത്തുന്നു. ഘട്ടം 4-ന് `ipfs` client
ആവശ്യമാണ്.

## 8. Refusal gate

ഒരു പ്രസിദ്ധീകരണത്തിൽ ഇനിപ്പറയുന്നവയുള്ള ഒരു വസ്തുത MUST NOT ഉൾപ്പെടുത്തണം:

- പേരുപറയപ്പെടാൻ സമ്മതം നൽകാത്ത ഒരു സ്വകാര്യ മൂന്നാം കക്ഷിയെ
  identify ചെയ്യുന്നു.
- ഒരു hypothesis-നെ ഒരു confirmation ആയി അവതരിപ്പിക്കുന്നു.
- ഒരു verifiable naming/declaration event-ലേക്കോ ഒരു cryptographic
  artifact-ലേക്കോ reduce ചെയ്യാൻ കഴിയില്ല.
- പ്രസിദ്ധീകരണത്തിൽ തടയാവുന്ന മരണങ്ങളിൽ ന്യായമായ പ്രതീക്ഷിത വർദ്ധനവ്
  ഉണ്ട്.

നാലാമത്തെ നിയമം load-bearing ആണ്. ഇത് പ്രസാധകൻ human review step-ൽ
enforce ചെയ്യുന്നു. Refusal gate-ന് protocol-level enforcement ഇല്ല;
പ്രോട്ടോക്കോൾ നൽകുന്ന bytes എന്തുതന്നെയും പ്രസിദ്ധീകരിക്കുന്നു. Gate-ന്
പ്രസാധകൻ ഉത്തരവാദിയാണ്.

## 9. പരിമിതികളുടെ സത്യസന്ധമായ പ്രസ്താവന

- **Detectability, impossibility അല്ല.** പ്രോട്ടോക്കോൾ tampering-നെ
  detect ചെയ്യാവുന്നതാക്കുന്നു, impossible അല്ല. ഒരു ഉറച്ച attacker-ന്
  ഇപ്പോഴും ഒരു വ്യത്യസ്ത പ്രസിദ്ധീകരണം substitute ചെയ്യാനും ചില
  വായനക്കാരെ അത് യഥാർത്ഥമാണെന്ന് persuade ചെയ്യാനും കഴിയും. Check റൺ
  ചെയ്യുന്ന ഏതൊരാൾക്കും substitution cryptographically demonstrable
  ആകുന്നു എന്നതാണ് പ്രോട്ടോക്കോളിന്റെ മൂല്യം.
- **അസത്യം പ്രസിദ്ധീകരിക്കുന്നതിനെതിരെ പ്രതിരോധമില്ല.** പ്രസാധകൻ "X
  സംഭവിച്ചു" എന്ന് പറയുന്ന ഒരു വസ്തുത സീൽ ചെയ്യുകയും X സംഭവിച്ചിട്ടില്ലെങ്കിലും,
  സത്യമായവ സീൽ ചെയ്യുന്ന അതേ fidelity-യിൽ പ്രോട്ടോക്കോൾ false claim സീൽ
  ചെയ്യുന്നു. പ്രോട്ടോക്കോൾ *published* ചെയ്തതിന് attest ചെയ്യുന്നു,
  *true* ആയതിന് അല്ല.
- **Single-party signing.** Deploy ചെയ്ത MYRIAM-ന്റെ v1 ഒരൊറ്റ signing
  principal ഉപയോഗിക്കുന്നു. Multi-party signing future work ആണ്.
- **Pinning durability.** പ്രസാധകന്റെ നോഡിൽ മാത്രമുള്ള IPFS pinning
  "എന്റെ ലാപ്‌ടോപ്പ് ഓണായിരിക്കുമ്പോൾ ലഭ്യം + opportunistic gateway
  caching" മാത്രമാണ് നൽകുന്നത്. ദീർഘകാല ദീർഘായുസ്സിന് സ്വതന്ത്ര
  സേവനങ്ങളിലുടനീളം redundant pins ആവശ്യമാണ്.

പ്രോട്ടോക്കോൾ നൽകുന്നതിലധികം ഒരു വായനക്കാരനും അനുമാനിക്കാതിരിക്കാൻ ഈ
പരിമിതികൾ ഇവിടെ പ്രസ്താവിച്ചിരിക്കുന്നു.
