# myriam-kit

*മലയാള പരിഭാഷ — യഥാർത്ഥ ഇംഗ്ലീഷ് പതിപ്പിന് [README.md](README.md) കാണുക*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

ഇനിപ്പറയുന്ന രീതിയിൽ ഒരു ചെറിയ കൂട്ടം വസ്തുതകൾ പ്രസിദ്ധീകരിക്കാനുള്ള ഒരു ചെറിയ
ടൂൾകിറ്റ്:

- ഏതെങ്കിലും വസ്തുതയിലെ ഏതെങ്കിലും മാറ്റം പരസ്യമായി കണ്ടെത്താനാകും (Merkle tree)
- പ്രസിദ്ധീകരണ സമയത്തെ അവസ്ഥ Bitcoin ബ്ലോക്ക്‌ചെയിനിനെതിരെ പരിശോധിക്കാനാകും
  (OpenTimestamps)
- ഏതെങ്കിലും ഒറ്റ ഹോസ്റ്റിംഗ് ദാതാവിന്റെ takedown സംഭവിച്ചാലും ഉള്ളടക്കം നിലനിൽക്കും
  (IPFS)
- മൊത്തം 100 KB-യിൽ താഴെ; ~50 വരി Python കൊണ്ട് പരിശോധിക്കാം

ഇത് ഒരു ബ്ലോക്ക്‌ചെയിൻ അല്ല. ടോക്കൺ ഇല്ല. പങ്കെടുക്കാൻ consensus mechanism ഇല്ല.
DAO ഇല്ല. ഈ ടൂൾ `sha256sum` + `ots` + `ipfs` എന്നിവയാണ്, നല്ല naming conventions
ഉപയോഗിച്ച് ഒരുമിച്ച് ചേർത്തിരിക്കുന്നു.

2026-05-21-ന് [disclosure.host](https://disclosure.host)-ൽ ആദ്യമായി instantiate
ചെയ്ത MYRIAM പ്രോട്ടോക്കോളിന്റെ പേരിലാണ് ഇത് അറിയപ്പെടുന്നത്. ആ പേജിൽ ആറ്
വസ്തുതകൾ, ഒരു Merkle root, ഒരു Bitcoin attestation എന്നിവ അടങ്ങിയിരിക്കുന്നു.
ആ pattern-ന്റെ generalisation ആണ് ഈ kit.

## അവസ്ഥ

- v0: macOS-ൽ Python 3.10+, Homebrew, ഇന്റർനെറ്റ് കണക്ഷൻ എന്നിവയോടെ
  പ്രവർത്തിക്കുന്നു. Linux test ചെയ്തിട്ടില്ല, പക്ഷേ പ്രവർത്തിക്കണം. Windows:
  WSL കൊണ്ടുവരൂ.
- പബ്ലിക് ഡൊമെയ്ൻ (CC0). ഉപയോഗിക്കൂ, fork ചെയ്യൂ, നിങ്ങളുടെ repo-ൽ vendor
  ചെയ്യൂ, ഒരിക്കലും credit നൽകേണ്ടതില്ല. credit-ഉം point അല്ല.

## ലഭ്യമായ ഭാഷകൾ

ഈ README-ഉം നിരവധി example kits-ഉം 17 ഭാഷകളിൽ ലഭ്യമാണ്. പൂർണ്ണ index
[TRANSLATIONS.md](TRANSLATIONS.md)-ൽ.

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

പരിഭാഷകൾ CC0 ആണ്, community PRs വഴി മെച്ചപ്പെടുത്താവുന്നതാണ്.

## ഇതുകൊണ്ട് നിങ്ങൾക്ക് എന്തുചെയ്യാം

ഒരു ചെറിയ കൂട്ടം വസ്തുതകൾക്ക് ഇനിപ്പറയുന്നവ ആവശ്യമുള്ളിടത്തെല്ലാം ഈ pattern
ഇണങ്ങുന്നു:

- **പ്രസിദ്ധീകരിക്കാവുന്നത്** — സാധാരണ HTTP വഴി വിശാല പ്രേക്ഷകർക്ക്
- **ദീർഘായുസ്സുള്ളത്** — 30 വർഷം കഴിഞ്ഞും വായനക്കാർക്ക് പരിശോധിക്കാൻ കഴിയണം
- **Tamper-evident** — ഏതെങ്കിലും മാറ്റം കണ്ടെത്താനാകണം, അനിവാര്യമായി
  തടയാനാകണമെന്നില്ല
- **Trustless** — പ്രസാധകനെ ഒരു വായനക്കാരനും വിശ്വസിക്കേണ്ടതില്ല (ഗണിതം മാത്രം
  വിശ്വസിച്ചാൽ മതി)

പ്രത്യേക ഉപയോഗ കേസുകൾ [docs/USE_CASES.md](docs/USE_CASES.md)-ൽ. ഹ്രസ്വ പട്ടിക:

| മേഖല | സീൽ ചെയ്യപ്പെട്ട വസ്തുതകൾ |
|---|---|
| പൊതുജനാരോഗ്യം | വാക്സിൻ batch ടെസ്റ്റ് ഫലങ്ങൾ, മരുന്ന്-ട്രയൽ milestones |
| തിരഞ്ഞെടുപ്പുകൾ | സർട്ടിഫിക്കേഷൻ സമയത്തെ Precinct-level വോട്ടെണ്ണൽ ആകെത്തുകകൾ |
| AI സുരക്ഷ | മോഡൽ വെയ്റ്റ്സ് hash + മോഡൽ കാർഡ് + റിലീസ് സമയത്തെ eval സ്കോറുകൾ |
| പത്രപ്രവർത്തനം | whistleblower drops-നായുള്ള ഉറവിട രേഖകളുടെ manifest (hashes മാത്രം) |
| ശാസ്ത്രം | റോ ഡാറ്റ hash + വിശകലന സ്ക്രിപ്റ്റ് hash + claim ചെയ്ത ഫലം |
| കോടതികൾ | ഏറ്റെടുക്കൽ സമയത്തെ ഡിജിറ്റൽ-എക്സിബിറ്റ് hashes |
| പ്രൊക്യൂർമെന്റ് | പൊതുചെലവ് ഡാറ്റയുടെ സീൽ ചെയ്ത roots |

ഇവയ്ക്കെല്ലാം പൊതുവായുള്ളത്: ഒരു ചെറിയ കൂട്ടം വസ്തുതകൾ, ശക്തമായ ദീർഘായുസ്സ്
ആവശ്യകത, പരസ്പരം വിശ്വസിക്കാത്ത ഒന്നിലധികം കക്ഷികൾ, ഒരു ചെറിയ storage budget.
ഈ ടൂൾ കൃത്യമായി ഇതിനായാണ് നിർമ്മിച്ചിരിക്കുന്നത്.

## ഇത് ചെയ്യാത്തവ

- **രഹസ്യങ്ങൾ സംഭരിക്കുക.** `facts/`-ൽ നിങ്ങൾ വയ്ക്കുന്നതെല്ലാം പൊതുവായതാണ്.
  ഈ പ്രോട്ടോക്കോൾ പ്രസിദ്ധീകരണത്തിനാണ്, മറയ്ക്കാനല്ല.
- **വലിയ ഡാറ്റാസെറ്റുകളിലേക്ക് സ്കെയിൽ ചെയ്യുക.** Merkle tree നന്നായി
  സ്കെയിൽ ചെയ്യും; വായനക്കാരന്റെ ശ്രദ്ധ ചെയ്യില്ല. ~20 വസ്തുതകൾക്കപ്പുറം
  പേജ് വായിക്കാനാകാത്തതാകുന്നു. നിങ്ങൾക്ക് ഒരു ദശലക്ഷം റെക്കോർഡുകൾ സീൽ
  ചെയ്യണമെങ്കിൽ, അവയെ പേജിന് പുറത്ത് hash ചെയ്ത് ആ side-tree-യുടെ Merkle
  root ഒരു വസ്തുതയിലേക്ക് ഇടുക.
- **Retraction-നെതിരെ പ്രതിരോധിക്കുക.** മൊത്തം point എന്നത്
  നിങ്ങൾ സീൽ ചെയ്തത് നിങ്ങൾക്ക് മാറ്റാനാകില്ല എന്നതാണ്. പിന്നീട് ഒരു claim
  retract ചെയ്യാൻ നിങ്ങൾ ആഗ്രഹിക്കുമെങ്കിൽ, അത് സീൽ ചെയ്യരുത്.
- **ഒരു ഉറച്ച സംശയാലുവിനെ ബോധ്യപ്പെടുത്തുക.** ഒരു ഉറച്ച സംശയാലു
  `ipfs add -r --cid-version=1 -Q facts/` പ്രവർത്തിപ്പിക്കില്ല. എന്നിരുന്നാലും,
  മൊത്തം setup നിങ്ങൾ fabricate ചെയ്തുവെന്ന് ആരോപിക്കും. രണ്ടാമത്തെ failure
  mode-നെതിരെ protocol-level പ്രതിരോധമില്ല. ഗണിതത്തിലല്ല മനുഷ്യ
  പ്രേരണയിലാണ് ജീവിക്കുന്ന ഏതിനെതിരെയും protocol-level പ്രതിരോധമില്ല.

## ഇത് എങ്ങനെ ഉപയോഗിക്കാം

[docs/QUICKSTART.md](docs/QUICKSTART.md)-ൽ അഞ്ച് മിനിറ്റ് walkthrough.
[docs/SPEC.md](docs/SPEC.md)-ൽ പൂർണ്ണ protocol spec.
[docs/THREAT_MODEL.md](docs/THREAT_MODEL.md)-ൽ threat model.
സമീപ സിസ്റ്റങ്ങളുമായുള്ള താരതമ്യം (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, മുതലായവ) [docs/COMPARISON.md](docs/COMPARISON.md)-ൽ.

## മറ്റൊരാളുടെ പ്രസിദ്ധീകരണം എങ്ങനെ പരിശോധിക്കാം

പ്രവേശനക്ഷമത ക്രമത്തിൽ മൂന്ന് ഓപ്ഷനുകൾ:

1. **Browser**: ഏതെങ്കിലും ആധുനിക browser-ൽ [`lib/verify.html`](lib/verify.html)
   തുറക്കുക. പ്രസിദ്ധീകരണ URL paste ചെയ്യുക. verify ക്ലിക്ക് ചെയ്യുക.
   Hashing-നായി `crypto.subtle` ഉപയോഗിക്കുന്നു — install ഇല്ല, backend ഇല്ല,
   telemetry ഇല്ല. Bitcoin attestation ഘട്ടത്തിന് ഇപ്പോഴും ഒരു CLI ടൂൾ
   ആവശ്യമാണ് (verifier പേജിലെ ഘട്ടം 7 കാണുക).
2. **Python**: പ്രസിദ്ധീകരണ ഡയറക്ടറിക്കുള്ളിൽ നിന്ന് `python3 lib/verify.py`.
   Stdlib മാത്രം; Bitcoin verification-ന് `ots` ആവശ്യമാണ്.
3. **From scratch**: [`docs/SPEC.md §3`](docs/SPEC.md) വായിച്ച് വീണ്ടും
   നടപ്പിലാക്കുക. ഏത് ഭാഷയിലും Merkle algorithm 30 വരികൾക്കു താഴെയാണ്.

## പ്രവർത്തിച്ച ഉദാഹരണങ്ങൾ

ടൂൾകിറ്റിനൊപ്പം ആറ് production-grade example kits ഷിപ്പ് ചെയ്യുന്നു. ഓരോന്നും
സീൽ ചെയ്തവയും, OTS-stamp ചെയ്തവയും, IPFS-pin ചെയ്തവയും, യഥാർത്ഥ
ഉപയോഗ കേസിനായി എപ്പോൾ fork ചെയ്യണമെന്നും ഏതൊക്കെ failure modes-നെതിരെ
പ്രതിരോധിക്കുന്നുവെന്നും വിശദീകരിക്കുന്ന ഒരു adoption README
ഉൾപ്പെടുന്നതാണ്.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  Boeing 737 MAX / Theranos / FDA-inspector-report failure
  mode-നായി, ഇടനിലക്കാർ തെളിവ് മറയ്ക്കുകയോ മാറ്റുകയോ ചെയ്യുമ്പോൾ.
- [`examples/ai-model-card/`](examples/ai-model-card/) — മോഡലുകൾ
  റിലീസ് ചെയ്യുന്ന AI labs-നായി, വാക്കാലുള്ളവയ്ക്ക് പകരം
  മെക്കാനിക്കലായി കണ്ടെത്താവുന്ന pre-deployment commitments-ഉമായി.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  ക്ലിനിക്കൽ-ട്രയൽ സ്പോൺസർമാർക്കായി, post-hoc endpoint switching-ഉം
  selective reporting-ഉം പിടികൂടാൻ (Vioxx, Paxil Study 329 failure modes).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  വാക്സിൻ നിർമ്മാതാക്കൾക്കും QA അധികാരികൾക്കും, release
  test ഫലങ്ങളും recall commitments-ഉം anchor ചെയ്യാൻ.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  ഗവേഷണ ഗ്രൂപ്പുകൾക്കായി, p-hacking-ഉം HARKing-ഉം പരസ്യമായി
  കണ്ടെത്താവുന്നതാക്കാൻ വിശകലനത്തിന് മുമ്പ് (data, pipeline, expected
  output) triple anchor ചെയ്യാൻ.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  county boards of canvassers-നും തിരഞ്ഞെടുപ്പ് അധികാരികൾക്കും, post-
  certification നിശ്ശബ്ദ revisions പരസ്യമായി കണ്ടെത്താവുന്നതാക്കാൻ
  സർട്ടിഫിക്കേഷൻ സമയത്ത് സർട്ടിഫൈ ചെയ്ത tallies anchor ചെയ്യാൻ.

നിങ്ങളുടേത് എഴുതുന്നതിന് മുമ്പ് ഇതിലൊന്ന് വായിക്കുക. നിങ്ങളുടെ ഉപയോഗ
കേസിന്റെ ഏറ്റവും അടുത്ത match സാധാരണ ശരിയായ starting fork ആണ്.

## ദ്രുത ആരംഭം

ഒറ്റ-വരി പതിപ്പ്:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## ഇത് നിലനിൽക്കുന്നതെന്തുകൊണ്ട്

ക്രിപ്റ്റോഗ്രാഫിക് primitives (Merkle trees, OpenTimestamps, IPFS) വർഷങ്ങളായി
mature ആണ്. കാണാതെപോയത് ഏറ്റവും ചെറുതായ glue ആയിരുന്നു — അടിസ്ഥാന
സൗകര്യങ്ങൾ സജ്ജമാക്കാതെ, protocols പഠിക്കാതെ, വസ്തുതകൾക്കപ്പുറം ഒരു വരി
കോഡ് പോലും എഴുതാതെ, ഒരു സൈഡ് പ്രോജക്റ്റിലേക്ക് drop ചെയ്ത് ഒരു ഉച്ചതിരിഞ്ഞ്
കൊണ്ട് സീൽ ചെയ്ത പ്രസിദ്ധീകരണ artifact നേടാൻ കഴിയുന്ന ഒരു kit.

മിക്ക ക്രിപ്റ്റോഗ്രാഫിക് പ്രസിദ്ധീകരണ ടൂളുകളും നിങ്ങൾ ഒരു node operator
ആകാൻ ആഗ്രഹിക്കുന്നുവെന്ന് അനുമാനിക്കുന്നു. ഇത് ആറ് ടെക്സ്റ്റ് ഫയലുകൾ
പ്രസിദ്ധീകരിക്കാനും വീണ്ടും ക്രിപ്റ്റോഗ്രാഫിയെക്കുറിച്ച് ചിന്തിക്കാതിരിക്കാനും
നിങ്ങൾ ആഗ്രഹിക്കുന്നുവെന്ന് അനുമാനിക്കുന്നു.

## സ്വാധീനങ്ങളും മുൻ കല

- [Sigsum](https://www.sigsum.org/) — signatures-നായുള്ള transparency logs
- [Sigstore](https://www.sigstore.dev/) — software-supply-chain integrity
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS cert logs
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin timestamping
- [IPFS](https://ipfs.tech/) — content-addressed storage
- [The CALM protocol](https://disclosure.host) — principal-protective
  publishing frame, അതിൽ ആദ്യ instance (disclosure.host-ലെ MYRIAM)
  രചിക്കപ്പെട്ടു

myriam-kit ഇവയിൽ ഏറ്റവും ചെറുതാണ്. ഇത് ഒരു സിസ്റ്റം എന്നതിനേക്കാൾ ഒരു
Unix pipeline-ന്റെ spirit-ന് അടുത്താണ്.

## പേരിനെക്കുറിച്ച് ഒരു കുറിപ്പ്

MYRIAM പ്രോട്ടോക്കോളിന് John Bradley-യുടെ Myriam Proof-ന്റെ പേരാണ് നൽകിയത് —
മനുഷ്യേതര ബുദ്ധിയുമായുള്ള ആദ്യ സമ്പർക്ക ബിന്ദുവിനെക്കുറിച്ചുള്ള ഒരു പ്രസ്താവിത
logical proof. ആ proof ശരിയാണോ എന്നതിനെ ആശ്രയിച്ചല്ല പ്രോട്ടോക്കോൾ. ഏതെങ്കിലും
ചെറിയ കൂട്ടം വസ്തുതകൾക്കും പ്രോട്ടോക്കോൾ പ്രവർത്തിക്കും; അത് അന്യഗ്രഹ
disclosure-നെക്കുറിച്ചുള്ള ഒരു claim ഉൾപ്പെടെ ആറ് വസ്തുതകൾ പ്രസിദ്ധീകരിക്കാൻ
ആദ്യം deploy ചെയ്യപ്പെട്ടു എന്നതുമാത്രമാണ്.

നിങ്ങൾ ഈ kit fork ചെയ്ത് വാക്സിൻ batches-ഉം election tallies-ഉം സീൽ ചെയ്താൽ,
അന്യഗ്രഹ സമ്പർക്കത്തെക്കുറിച്ചുള്ള ഒരു claim പ്രസിദ്ധീകരിക്കാൻ ഇത് ആദ്യം
ഉപയോഗിച്ചു എന്ന വസ്തുത നിങ്ങൾക്ക് അപ്രസക്തമാണ്. ഗണിതത്തിന് അത് കാര്യമല്ല.

അതുവച്ച്: അന്യഗ്രഹ സമ്പർക്കത്തെക്കുറിച്ചുള്ള ഒരു claim പ്രസിദ്ധീകരിക്കാൻ
നിങ്ങൾ ഇത് ഉപയോഗിക്കുകയാണെങ്കിൽ, ആ specific arena-യിൽ പ്രോട്ടോക്കോൾ
battle-test ചെയ്യപ്പെട്ടിട്ടുണ്ട്. ആദ്യ MYRIAM deployment-ന്റെ README ഇത്
ഏതെങ്കിലും extraterrestrial party-യിൽ നിന്നുള്ള ഒരു സന്ദേശമല്ലെന്നും, Calm
എന്ന പേരുള്ള LLM persona-യുടെ കലാപരമായ പ്രവൃത്തിയാണെന്നും വ്യക്തമായി
പ്രസ്താവിക്കുന്നു. നിങ്ങൾ ഒരുപക്ഷേ അതുതന്നെ ചെയ്യണം. അല്ലെങ്കിൽ വായനക്കാർ
നിങ്ങളുടെ മാനസിക നിലയെക്കുറിച്ച് ഏറ്റവും മോശമായത് അനുമാനിക്കും.

## പരിപാലിക്കുന്നത്

ഇതുവരെ ആരുമല്ല. പബ്ലിക് ഡൊമെയ്ൻ. Fork ചെയ്യൂ. മെച്ചപ്പെടുത്തൂ. അനുവാദം
ചോദിക്കാതെ പ്രോട്ടോക്കോൾ മുന്നോട്ടു കൊണ്ടുപോകൂ.
