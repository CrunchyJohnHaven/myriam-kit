*Hiikkaa Afaan Oromoo — fakkii Afaan Ingilizii isa jalqabaa argachuuf, ilaali [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Meeshaalee xiqqaa tuuta xiqqaa dhugaalee karaa armaan gadiitiin maxxansuuf gargaaru:

- Jijjiirama dhugaa kamiyyuu irratti taasifame, uummataaf ifa ta'uun mirkanaa'u ni danda'a (mukni Merkle)
- Haalli yeroo maxxansaa keessa ture chain-Bitcoin (OpenTimestamps) waliin walbira qabamee mirkanaa'a
- Qabiyyeen sun, eega kennaa hosting tokko addaan kute booda iyyuu ni tura (IPFS)
- Waan walii galaan 100 KB gad ta'ee, sararoota Python ~50 qofaan mirkanaa'uu danda'a

Kun chain-block miti. Tokenni hin jiru. Tooftaan walii galtee namni keessa hirmaatu hin jiru.
DAOn hin jiru. Meeshichi `sha256sum` + `ots` + `ipfs`, akkaataa
moggaasa maqaa gaariin walitti maxxanfame qofa.

Inni maqaa qabateera kan jechuun protocol MYRIAM kan dhaabbii isaa jalqabaa
[disclosure.host](https://disclosure.host) keessatti guyyaa 2026-05-21 godhate. Fuulli sun
dhugaalee jaha, hidda Merkle tokko, fi mirkana Bitcoin tokko qabateera. Kiitiin kun ammoo
qajeelfama gamaa sun amma waluma galtee hojii kamiifuu fayyadu.

## Haala Amma

- v0: macOS irratti Python 3.10+, Homebrew, fi qunnamtii intarneetii waliin hojjeta.
  Linux irratti hin qoramne garuu hojjechuu qaba. Windows: WSL fidaa.
- Mirga uummataa (CC0). Itti fayyadamaa, fork godhaa, repo keessanitti gala godhaa, beekamtii hin kennitan.
  Yaada inni kun gaaffii beekamtii miti.

## Afaan jiran

README kun fi kiitii fakkeenya tokko tokko afaanota 17'n argamu.
Indeeksii guutuu [TRANSLATIONS.md](TRANSLATIONS.md) keessatti argattu.

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Hiikkaaleen CC0 ti, hawaasaan PR-iidhaan fooyya'uu ni danda'u.

## Maaltu isa irra hojjettan

Bifti kun, lafa kamiyyuu kan tuuta xiqqaa dhugaalee:

- **Maxxansiisuu** dandeessisuuf — HTTP salphaadhaan ummata bal'aaf
- **Turuu** dandeessisuuf — dubbistoonni waggaa 30 booda akkasumas mirkaneessuu danda'an
- **Jijjiiramni isaa kan ifa ta'u** — jijjiiramni kamiyyuu mirkanaa'uu qaba, garuu dhowwuun hin barbaachisu
- **Amantii malee** — dubbistoonni maxxansaa irratti amantaa kennuun hin jiru (lakkoofsi qofa fudhatamu)

Fakkeenyota ifa ta'an [docs/USE_CASES.md](docs/USE_CASES.md) keessatti argattu. Tarreen gabaabaan:

| Mata-duree | Dhugaalee chappaa kaa'an |
|---|---|
| Fayyaa uummataa | Bu'aa qorannoo batch talaalliifi, milestone qorannoo qoricha |
| Filannoo | Walitti qabama sagalee sadarkaa naannoo yeroo mirkanaa'aa |
| AI safety | Hash ulfaatina modeelaa + kaardii modeelaa + qabxiilee madaallii yeroo gad-dhiifame |
| Gaazexeessummaa | Tarree dhugaa galmee madda (hash qofa) iyyataa balaalaffannaa |
| Saayinsii | Hash daataa duraa + hash skiriiptii xiinxalaa + bu'aa himatame |
| Mana murtii | Hash ragaa dijitaalaa yeroo argatame |
| Bittaa mootummaa | Hidda chappeessitaa daataa baasii uummataa |

Kanneen waan walitti qabsiisu: tuuta xiqqaa dhugaalee, gaaffii turtii cimaa, garee qabatamoo dhuunfaa ofii hin amanne hedduu, fi qajeelfama kuusaa daataa xiqqaa.
Sun sirumayyuu, bifa meeshaan kun isaaf ijaarame.

## Maaltu inni HIN GODHU

- **Iccitii hin kuusu.** Wanti `facts/` keessa galchitan hundi uummata. Protocolli kun
  maxxansuuf, dhoksuuf miti.
- **Daataa guddaaf hin tarree.** Mukni Merkle gaariidhaan tarra'a;
  xiyyeeffannoo dubbisaa garuu miti. Eega dhugaalee ~20 booda fuulli dubbisamuu hin danda'amu.
  Galmee miliyoona tokko chappeessuu yoo barbaaddan, isaan fuula irraa hash godhaa,
  hidda Merkle muka-cinaa sanaa keessaa dhugaa tokko keessa kaa'aa.
- **Dachii deebi'uu (retraction) irraa hin ittisu.** Yaada hundee isaa kan akka hin jijjiramne
  chappeessuu argattan dha. Yoo isin himannaa booda deebistuu barbaaddan ta'e, hin chappeessinaa.
- **Skeptikii murteessitee hin amansiisu.** Skeptikiin murteessitee `ipfs add -r --cid-version=1 -Q facts/`
  hin lakkofnu. Inni garuu, qophii guutuu keessan akka qomoo (fabrication) ta'etti isin himachiisa.
  Mode failure isa lammataa irratti ittisni sadarkaa protocol-itti hin jiru.
  Wanti kaka'umsa namaa keessa jiraatu hundaaf, ittisni sadarkaa protocol-itti hin jiru.

## Akkamiin itti fayyadamtu

Naanno daqiiqaa shanii kan [docs/QUICKSTART.md](docs/QUICKSTART.md) keessa jira.
Caaseffama protocol guutuu [docs/SPEC.md](docs/SPEC.md) keessa jira.
Modelii balaa (Threat model) [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md) keessa jira.
Sirnoota cinaa wajjin (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, kkf) walbira qabuun [docs/COMPARISON.md](docs/COMPARISON.md) keessa jira.

## Maxxansa nama biroo akkamiin mirkaneessu

Filannoo sadii, akka argamuu salphinaatti:

1. **Browser**: brawuzara ammaa kamuu keessatti [`lib/verify.html`](lib/verify.html) bani.
   URL maxxansaa kaa'i. Mirkaneessuu cuqaasi. Hashing-iif `crypto.subtle`
   fayyadama — kaa'amni hin jiru, backend hin jiru, telemetry hin jiru.
   Tarkaanfiin mirkana Bitcoin amma iyyuu meeshaa CLI fudhata (tarkaanfii 7 fuula
   mirkaneessitichaa keessa ilaali).
2. **Python**: `python3 lib/verify.py` kaayyoo gara galmeesa maxxansaa keessa galtee.
   Stdlib qofa; mirkaneessuuf Bitcoin `ots` barbaachisa.
3. **Jalqabaa**: [`docs/SPEC.md §3`](docs/SPEC.md) dubbisii deebisuu ijaari.
   Algorithmiin Merkle afaan kamuu keessatti sararoota 30 gadi.

## Fakkeenyota hojjetaman

Kiitota fakkeenyaa sadarkaa oomishaa sadii toolkit-icha wajjin dhufu.
Tokkoon tokkoon isaanii chappeefamani, OTS-iin chappeefamanii, IPFS-iin pinned ta'anii,
fi README fudhatama qabatu — yoom akka isaa fork goonee dhimma addunyaa dhugaatti dhimma itti baasuu fi
qajeelfama failure-mode isa ittiisuu ibsa.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  failure-mode Boeing 737 MAX / Theranos / gabaasa qorataa-FDA-tii kan ragaan
  giddugaleessummaa namootaan dhokfamu yookin jijjiiramuuf.
- [`examples/ai-model-card/`](examples/ai-model-card/) — laboratooriilee AI
  modeelota gad-dhiisanii, waadaa dura-deemsaa kan afaaniin osoo hin taane,
  meeshaadhaan ifatti mirkanaa'uu danda'u qabaachisuuf.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  abbootii qorannoo kiliinikaal, akkaataa endpoint-iin sun booda akka jijjiraman
  fi gabaasa filataman (failure-mode-iin Vioxx, Paxil Study 329) qabachiisuuf.
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  oomishtoota talaallii fi abbootii QA, bu'aa qorannoo gad-dhiisaa
  fi waadaa deebisanii fudhachuu chappeessuuf.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  gareewwan qorannoo, (daataa, pipeline, bu'aa eegama) sadeen DUR-aa
  xiinxala chappeessuun p-hacking fi HARKing ifaan mirkanaa'uu akka danda'an gochuuf.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  boordii naannoo canvasser fi abbootii filannoo, sagalee mirkana'aa yeroo mirkana'aa chappeessuun
  jijjiirama mirkana'aa booda calalliisaa uummataaf ifa godhuuf.

Tokko isaan keessaa kan ofii keessanii barreessuun dura dubbisaa. Kan isin barbaadanitti
fakkaachuu kan caaluu yeroo baay'ee fork sirrii ta'a.

## Jalqabbii ariifachiisaa

Filannoo sarara tokko:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# facts/*.txt sirreessuun maaltu chappeessamuu akka qabu galchaa
./lib/seal.sh        # hidda Merkle ijaara, OTS chappeessa, IPFS pin godha
./lib/verify.sh      # nageenya hunda na'aanno mirkaneessa
# site/ bakka kuusaa static kamiyyu irratti ol fe'aa. Bakka kamuu. Hin dhimmu.
```

## Maaliif jiraate

Caasaa cryptografiiraa (mukoota Merkle, OpenTimestamps, IPFS) waggoota
hedduuf bilchaachaa turaniiru. Wanti hir'achaa ture jechuun maxxansaa walitti hidhaa xiqqaa —
kiitii projektii cinaa keessatti gad-dhaaftee galagala tokko keessatti
ragaa chappeefamee maxxansamuu danda'u argachuu, infrastruktcher ijaaruun ala, protocol
baruun ala, sarara koodii tokko illee dhugaalee mataa keessanii dabalee
barreessuu malee.

Meeshaalee maxxansaa kryptografi yeroo baay'ee isin qaama node ta'uu barbaaddan
seenuu. Kun garuu galmeewwan barreeffamaa jaha maxxansuu fi kryptografii
yoom illee yaaduu dhiisuu barbaaddan seenuu.

## Dhiibba fi waan duraan turan

- [Sigsum](https://www.sigsum.org/) — galmeewwan ifaagessaa kan mallattoo
- [Sigstore](https://www.sigstore.dev/) — qulqullummaa daldala-supply software-ii
- [Certificate Transparency](https://certificate.transparency.dev/) — galmeewwan ragaa TLS
- [OpenTimestamps](https://opentimestamps.org/) — yeroo chappeessuu Bitcoin
- [IPFS](https://ipfs.tech/) — kuusaa qabiyyee-irratti-bu'ureeffate
- [Protocol CALM](https://disclosure.host) — bifa maxxansaa kan
  abbaa-hudhamaa kan dhaabbii jalqabaa (MYRIAM disclosure.host irratti)
  itti barreeffame

myriam-kit isaan keessaa isa xiqqaadha. Yaada Unix pipeline-itti dhiyaata,
sirna mata isaatti miti.

## Yaada maqaa irratti

Protocol MYRIAM kan John Bradley'n "Myriam Proof" jedhameen moggaafame.
Inni mirkana logikii qabatamaa dhuunfaa qaama walqunnamtii jalqabaa
beekumsa namaa hin taane ilaalu dha. Protocolichi mirkana sun dhugaa ta'uu irratti
hin hundaa'u. Protocolli tuuta xiqqaa dhugaalee kamiifuu ni hojjeta;
inni jalqaba dhugaa jaha kan himannaa walqunnamtii namoota addunyaa biroo qabu
maxxansuuf gad-dhiifame qofa.

Yoo kiitii kana fork goonee batch talaallii yookin sagalee filannoo chappeessuuf
dhimma itti baatan, dhugaan inni jalqaba walqunnamtii alieenii ilaaluuf
ittiin dhimma itti bahame isiniif faayidaa hin qabu. Lakkoofsi dhimma itti hin baasu.

Sun jechuun: yoo isin himata walqunnamtii alieenii maxxansuu kana fayyadamuu yaaddan,
protocolli sun ofumaan dirree sana keessatti qoramee jira. README dhaabbii
MYRIAM jalqabaa ifaan jecha hojii artistiii LLM personii Calm jedhamuun
moggaa'eedha jechuun ibsa, qaama walqunnamtii biyya alaa kamuu kan akka isaanii
miti. Isin ammoo akkasuma gochuu qabdu. Dubbistoonni waa'ee qaama sammuu keessanii
yaadda'aanii waan hamaa keessan yaadu.

## Eeggalcha kan godhu

Hanga ammaa eenyuu miti. Mirga uummataa. Fork godhaa. Fooyya'aa.
Eyyama gaafachuun ala protocol-icha fuula duratti baadhaa.
