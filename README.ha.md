# myriam-kit

*Fassarar Hausa — don asalin sigar Turanci, duba [README.md](README.md)*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Karamin kayan aiki don buga karamin tarin gaskiya ta yadda:

- Duk wani canji ga kowace gaskiya za a iya gano shi a fili (Merkle tree)
- Yanayin a lokacin bugawa ana iya tabbatar da shi gaba da blockchain na Bitcoin (OpenTimestamps)
- Abun cikin yana rayuwa har idan an cire shi daga kowane mai gida daya (IPFS)
- Duka abun yana da nauyi kasa da 100 KB kuma ana iya tabbatar da shi da kusan layuka 50 na Python

Wannan ba blockchain ba ne. Babu token. Babu tsarin yarjejeniya
da za a shiga. Babu DAO. Kayan aikin shi ne `sha256sum` + `ots` + `ipfs`,
hade tare da kyawawan tsarin suna.

An ba shi suna bayan tsarin MYRIAM da aka fara kafa shi a
[disclosure.host](https://disclosure.host) a 2026-05-21. Wancan shafin ya kunshi
gaskiya shida, tushen Merkle, da shaidar Bitcoin. Wannan kayan aikin shine
gama-garin wannan tsarin.

## Matsayi

- v0: yana aiki a kan macOS tare da Python 3.10+, Homebrew, da haɗin
  intanet. Ba a gwada Linux ba amma ya kamata ya yi aiki. Windows: kawo WSL.
- Mallakar jama'a (CC0). Yi amfani da shi, sakar shi, sanya shi a cikin repo dinka, kar ka
  taɓa yaba shi. Manufar ba yabo ba ce.

## Harsunan da ake samu

Wannan README da misalan kayan aiki da yawa ana samun su a cikin harsuna 17.
Cikakken jeri a [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Fassarori suna CC0 kuma al'umma za su iya inganta su ta hanyar PRs.

## Abin da za ka iya yi da shi

Wannan tsarin yana dacewa duk inda karamin tarin gaskiya ke buƙatar:

- **Bugawa** ga manyan masu sauraro a kan HTTP mai sauki
- **Dorewa** — masu karatu a cikin shekaru 30 su iya tabbatar da shi
- **Bayyana-tampering** — duk wani canji dole ne a iya gano shi, ba lallai a hana shi ba
- **Rashin amincewa** — babu mai karatu da zai amince da mai bugawa (kawai lissafi)

Misalai na zahiri a cikin [docs/USE_CASES.md](docs/USE_CASES.md). Jeri mai gajere:

| Yanki | Gaskiya da aka rufe |
|---|---|
| Lafiyar jama'a | Sakamakon gwajin batch na rigakafi, alamomin gwaji na magunguna |
| Zaɓe | Adadin kuri'u na kowace cibiyar zaɓe a lokacin tabbatarwa |
| Tsaron AI | Hash na nauyin samfuri + katin samfuri + makin gwaji yayin fitarwa |
| Aikin jarida | Manifest na takardun tushe (hashes kawai) don zubowar masu fallasa |
| Kimiyya | Hash na bayanai na asali + hash na rubutun nazari + sakamakon da aka da'awa |
| Kotuna | Hashes na shaidun dijital a lokacin samun su |
| Sayayya | Tushen da aka rufe na bayanan kashe kuɗi na jama'a |

Abin da wadannan suka hada: karamin tarin gaskiya, bukatar dorewa mai karfi,
ɓangarori daban-daban da ba su amince da juna ba, da karamar kasafi na ajiya.
Wannan shi ne ainihin siffar da aka gina wannan kayan aikin don ta.

## Abin da BA YA yi

- **Adana sirri.** Duk abin da ka sa a `facts/` na jama'a ne. Tsarin yana
  don bugawa ne, ba don ɓoyewa ba.
- **Ƙwallon zuwa manyan bayanai.** Itacen Merkle yana ƙwallowa lafiya; hankalin
  mai karatu ba ya. Bayan kimanin gaskiya 20 shafin ya zama wanda ba a iya karantawa. Idan
  kana son rufe miliyan tarihi, hash su daga shafi kuma sa
  tushen Merkle na wannan reshe a cikin gaskiya daya.
- **Kare daga ja da baya.** Manufar gabaɗaya ita ce ba za ka iya canza
  abin da ka rufe ba. Idan zaka iya so ka ja da'awa daga baya, kar ka
  rufe shi.
- **Lallashe mai shakka mai ƙarfi.** Mai shakka mai ƙarfi ba zai gudanar da
  `ipfs add -r --cid-version=1 -Q facts/` ba. Amma, zai
  zarge ka da ƙirƙira dukan tsarin. Babu kariya a matakin tsari
  daga rashin nasara na biyu. Babu kariya a matakin tsari
  daga duk abin da yake a cikin niyyar ɗan adam maimakon a cikin lissafi.

## Yadda ake amfani da shi

Tafiya mai mintuna biyar a cikin [docs/QUICKSTART.md](docs/QUICKSTART.md).
Cikakken bayanin tsari a cikin [docs/SPEC.md](docs/SPEC.md).
Tsarin barazana a cikin [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Kwatance da tsarurruka makwabta (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, da sauransu) a cikin [docs/COMPARISON.md](docs/COMPARISON.md).

## Yadda za a tabbatar da bugawar wani

Zaɓuɓɓuka uku, daga mafi sauƙi:

1. **Mai bincike**: buɗe [`lib/verify.html`](lib/verify.html) a cikin kowane
   mai binciken zamani. Manna URL na bugawa. Danna tabbatar. Yana amfani da
   `crypto.subtle` don hashing — babu shigarwa, babu backend, babu telemetry.
   Matakin shaidar Bitcoin har yanzu yana buƙatar kayan aikin CLI (duba mataki na 7 a
   shafin mai tabbatarwa).
2. **Python**: `python3 lib/verify.py` daga cikin directory na bugawa.
   Stdlib kawai; yana buƙatar `ots` don tabbatarwar Bitcoin.
3. **Daga farko**: karanta [`docs/SPEC.md §3`](docs/SPEC.md) kuma
   sake aiwatar da shi. Algorithm ɗin Merkle yana ƙasa da layuka 30 a kowane harshe.

## Misalan da aka gama aiki

Misalan kayan aiki shida masu inganci suna zuwa tare da kayan aikin. Kowane
an rufe shi, OTS-stamped, IPFS-pinned, kuma ya haɗa da README na karɓuwa
mai bayyana lokacin da za a sakar shi don shari'ar duniya ta gaske da kuma
yanayin rashin nasara da yake kare daga.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  don yanayin rashin nasara na Boeing 737 MAX / Theranos / rahoton-mai-binciken-FDA
  inda ake binne ko canza shaida ta hanyar masu shiga tsakani.
- [`examples/ai-model-card/`](examples/ai-model-card/) — don dakunan AI
  da ke fitar da samfurai, tare da alkawura kafin tura wadanda suka zama
  na'ura-da-na'ura-da-ake gano su maimakon na baki.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  don masu daukar nauyin gwaji na asibiti, kama canza maƙasudin gwajin bayan-da-bayan
  da rahoton zaɓi (yanayin rashin nasara na Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  don masu kera rigakafi da hukumomin QA, ƙarfafa sakamakon
  gwajin fitarwa da alkawuran murmurewa.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  don ƙungiyoyin bincike, ƙarfafa uku-uku (bayanai, pipeline, sakamakon da
  ake fata) KAFIN nazari don sanya p-hacking da HARKing
  a iya gano su a fili.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  don kwamitin tabbatar da kuri'u da hukumomin zaɓe, ƙarfafa
  adadin da aka tabbatar a lokacin tabbatarwa don a iya gano canje-canje
  na shiru bayan-tabbatarwa a fili.

Karanta ɗayan waɗannan kafin ka rubuta naka. Mafi kusa da shari'arka
shi ne yawanci farkon da ya dace don sakarwa.

## Farawa cikin sauri

Sigar layi ɗaya:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Me ya sa wannan ke wanzu

Abubuwan asali na cryptographic (Merkle trees, OpenTimestamps, IPFS) sun
balaga shekaru. Abin da ya rasa shi ne mafi ƙarancin tudu —
kayan aiki da za ka iya jefa shi cikin aikin gefe kuma ka sami
abun da ake bugawa da aka rufe a cikin yamma, ba tare da kafa
kayan aiki ba, ba tare da koyon tsare-tsare ba, ba tare da rubuta layi guda na lambobi
ba bayan gaskiya kanta.

Yawancin kayan aikin bugawa na cryptographic sun ɗauka kana son ka zama mai
gudanar da node. Wannan yana ɗauka kana son ka buga fayilolin matani shida kuma kar ka
sake tunani game da cryptography.

## Tasiri da fasaha ta gaba

- [Sigsum](https://www.sigsum.org/) — bayanan gaskiya don sa hannu
- [Sigstore](https://www.sigstore.dev/) — amincin sarkar samar da software
- [Certificate Transparency](https://certificate.transparency.dev/) — bayanan takardun TLS
- [OpenTimestamps](https://opentimestamps.org/) — alama lokaci ta Bitcoin
- [IPFS](https://ipfs.tech/) — ajiya da aka adireshi ta abun ciki
- [The CALM protocol](https://disclosure.host) — tsarin bugawa mai-kare-mai-mallaka
  da aka rubuta a misalin farko (MYRIAM a disclosure.host)

myriam-kit shi ne mafi ƙarancin waɗannan. Yana kusa da ruhin Unix
pipeline fiye da tsari.

## Bayanin kula game da sunan

An ba tsarin MYRIAM sunan bayan Myriam Proof na John Bradley, hujja
ta dabaru da aka furta game da matsayi na farko na lamba ga
hankali maras mutum. Tsarin ba ya dogara da gaskiyar wannan hujja. Tsarin
yana aiki don kowane karamin tarin gaskiya gabaɗaya; kawai ya faru
da aka fara turawa don buga gaskiya shida da suka haɗa da da'awa game da
fallasa baƙin sama.

Idan ka saki wannan kayan aikin don rufe batch na rigakafi ko adadin zaɓe,
gaskiyar cewa an fara amfani da shi don buga da'awa game da hulɗa da baƙin sama
ba ta da alaƙa da kai. Lissafi ba ya kula.

Wancan ya ce: idan KA yi amfani da wannan don buga da'awa game da hulɗa da baƙin sama,
an gwada tsarin a fagen yaƙi a wannan fage takamaiman. README na
turawa MYRIAM na farko ya bayyana a fili cewa shi ne aikin fasaha na
LLM persona mai suna Calm, ba sako daga kowane bangare na waje ba.
Wataƙila ka yi haka. Masu karatu za su yi tunani mafi muni game da
yanayin tunaninka in ba haka ba.

## Wanda ke kula

Babu wanda yake har yanzu. Mallakar jama'a. Sakar shi. Inganta shi. Ka
ɗauki tsarin gaba ba tare da neman izini ba.
