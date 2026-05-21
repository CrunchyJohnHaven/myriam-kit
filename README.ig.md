# myriam-kit

*Ntụgharị Igbo — maka mbipụta bụ́ isi nke Bekee, lee [README.md](README.md)*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Obere ngwá ọrụ maka ibipụta obere ihe ndị eziokwu n'ụzọ nke:

- Mgbanwe ọ bụla a na-eme na eziokwu ọ bụla bụ ihe a ga-achọpụta n'ihu ọha (osisi Merkle)
- Ọnọdụ mgbe e bipụtara ya bụ ihe a pụrụ ịkwado megide blọkchain Bitcoin (OpenTimestamps)
- Ọdịnaya na-adịgide ma a kwụsịrị ọ bụla onye na-eweta ngalaba ngwá ọrụ (IPFS)
- Ihe niile ahụ dị n'okpuru 100 KB, a pụkwara ịkwado ya site n'ihe dị ka ahịrị Python 50

Nke a abụghị blọkchain. Enweghị token. Enweghị usoro nkwado a ga-esonye na ya.
Enweghị DAO. Ngwá ọrụ ahụ bụ `sha256sum` + `ots` + `ipfs`, jikọtara ya
ọnụ site n'ezigbo omenala nkpọ aha.

A kpọrọ ya aha mgbe ụsọrọ MYRIAM ka emepụtara ya na mbụ na
[disclosure.host](https://disclosure.host) na 2026-05-21. Ibe ahụ nwere
eziokwu isii, mgbọrọgwụ Merkle, na akwụkwọ ọtụtụ Bitcoin. Ngwa a bụ
nkọwapụta nke usoro ahụ.

## Ọnọdụ

- v0: ọ na-arụ ọrụ na macOS site na Python 3.10+, Homebrew, na
  njikọ ịntanetị. A nwabeghị Linux mana ọ kwesịrị ịrụ ọrụ. Windows: weta WSL.
- Ngalaba ọha (CC0). Jiri ya, weghachite ya, tinye ya na repo gị, ekwukwala
  banyere ya. Isi ihe abụghị otuto.

## Asụsụ ndị dị

Mbipụta isi a na ọtụtụ ngwa ihe atụ dị n'asụsụ iri na asaa.
Ndepụta zuru ezu na [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Ntụgharị okwu bụ CC0, ndị obodo nwere ike ime ka ha kaa mma site na PR.

## Ihe ị nwere ike iji ya mee

Usoro a dabara ebe ọ bụla obere ihe eziokwu kwesịrị ịbụ:

- **Nke a ga-ebipụta** nye ọha sara mbara site n'ụzọ HTTP nkịtị
- **Na-adịgide** — ndị na-agụ ya n'afọ 30 kwesịrị ịnwerịrị ike ịkwado ya
- **Nke a na-achọpụta mmebi** — ekwesịrị ịchọpụta mgbanwe ọ bụla, ọ bụghịkwa nke a ga-egbochi
- **Na-adịghị achọ ntụkwasị obi** — onye na-agụ ọ bụla aghaghị ịtụkwasị onye na-ebipụta obi (naanị mgbakọ na mwepụ)

A ga-ahụ ihe ngosi pụta ìhè na [docs/USE_CASES.md](docs/USE_CASES.md). Ndepụta dị mkpirikpi:

| Ngalaba | Eziokwu ndị akwụdoro |
|---|---|
| Ahụike ọha | Nsonaazụ nnwale nkebi ọgwụ mgbochi, ihe nrịbama nnwale ọgwụ |
| Nhoputa ndi ochichi | Mkpokọta ọnụọgụ n'ọkwa precinct na mgbe e nyere asambodo |
| Nchekwa AI | Hash nke nkà ihe ọmụma na kaadị ihe nlereanya na akara nyocha mgbe ewepụtara |
| Ọrụ akụkọ | Manifesto nke akwụkwọ isi (naanị hash) maka nbuda ndị whistleblower |
| Sayensị | Hash data dị irè + hash script nyocha + nsonaazụ a kwuru |
| Ụlọikpe | Hash nke ihe ngosi dijitalụ mgbe a nwetara ha |
| Azụmahịa ọchịchị | Mgbọrọgwụ ndị akara nke data nke ego ọha |

Ihe ndị a nwere ihe jikọrọ ha: obere ihe eziokwu, ọchịchọ siri ike maka nnọgide,
ọtụtụ nkeji na-atụkwasịghị ibe ha obi, na ngalaba nchekwa pere mpe.
Nke ahụ kpọmkwem bụ udi nke a wuru ngwá ọrụ a maka ya.

## Ihe ọ NA-ADỊGHỊ eme

- **Chekwaa ihe nzuzo.** Ihe ọ bụla ị tinyere na `facts/` bụ ihe ọha.
  Usoro ahụ bụ maka ibipụta, ọ bụghị maka izochi.
- **Igbasawanye gaa na nnukwu dataset.** Osisi Merkle na-agbasa nke ọma; uche nke
  onye na-agụ enweghị. Karịa ihe dị ka eziokwu 20, peeji ahụ na-aghọ nke a na-apụghị ịgụ.
  Ọ bụrụ na ịchọrọ ịkwado nde ndekọ, hash ha n'èzí ibe ma tinye mgbọrọgwụ
  Merkle nke osisi akụkụ ahụ n'ime otu eziokwu.
- **Gbochie nlaghachi azụ.** Ihe niile na-aga n'ihu bụ na ị nweghị ike ịgbanwe
  ihe ị kwadoro. Ọ bụrụ na ị nwere ike ịchọrọ ịlaghachi azụ na nzọrọ na ọdịnihu, akwụdoghị ya.
- **Mee ka onye na-enwe obi abụọ siri ike kwere.** Onye na-enwe obi abụọ siri ike
  agaghị agba `ipfs add -r --cid-version=1 -Q facts/`. Mana, ha ga-eboro gị ebubo
  nke ịkpụzi ihe niile a. Enweghị nchebe n'ọkwa usoro megide ụdị ọdịda nke abụọ ahụ.
  Enweghị nchebe n'ọkwa usoro megide ihe ọ bụla biri n'okwu mmasị mmadụ kama mgbakọ na mwepụ.

## Otú esi eji ya

Nnyocha nkenke nkeji ise na [docs/QUICKSTART.md](docs/QUICKSTART.md).
Nkọwa usoro zuru oke na [docs/SPEC.md](docs/SPEC.md).
Ihe nlereanya iyi egwu na [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Ntụnyere na sistemụ ndị metụtara ya (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, wdg.) na [docs/COMPARISON.md](docs/COMPARISON.md).

## Otú e si akwado mbipụta nke onye ọzọ

Nhọrọ atọ, n'usoro nke ịdị mfe:

1. **Ihe nchọgharị**: mepee [`lib/verify.html`](lib/verify.html) n'ime ihe nchọgharị
   ọ bụla ọgbara ọhụrụ. Tinye URL mbipụta. Pịa kwado. Ọ na-eji
   `crypto.subtle` maka hashing — ọ dịghị nrụnye, ọ dịghị backend, ọ dịghị telemetry.
   Nzọụkwụ akwụkwọ ọtụtụ Bitcoin ka chọrọ ngwá ọrụ CLI (lee nzọụkwụ 7 na
   peeji nkwado).
2. **Python**: `python3 lib/verify.py` site n'ime ndekọ aha mbipụta.
   Naanị stdlib; chọrọ `ots` maka nkwado Bitcoin.
3. **Site na mmalite**: gụọ [`docs/SPEC.md §3`](docs/SPEC.md) ma
   mejigharị ya ọzọ. Algọridim Merkle dị n'okpuru ahịrị 30 n'asụsụ ọ bụla.

## Ihe atụ ndị arụworo ọrụ

Ngwa ihe atụ isii dị ọkwa mmepụta nke na-eso ngwá ọrụ ahụ. A kwadoro nke ọ bụla,
katara OTS, mara IPFS, ma gụnye README nke nakwere nke na-akọwa mgbe ị ga-eweghachite
maka ọnọdụ ezi uwa na ụdị ọdịda ọ na-egbochi.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  maka ụdị ọdịda Boeing 737 MAX / Theranos / akụkọ nyocha FDA-inspector
  ebe ndị ogbu ọzọ na-eli ma ọ bụ gbanwee ihe akaebe.
- [`examples/ai-model-card/`](examples/ai-model-card/) — maka ụlọ nyocha AI
  na-ahapụ ihe nlereanya, na nkwa tupu mbukota nke ghọrọ ihe a chọpụtara
  na igwe kama n'okwu ọnụ.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  maka ndị na-akwado nnwale ọgwụ ụlọ ọgwụ, na-ejide mgbanwe ihe ngosi mgbe
  nnwale gachara na nkọ ahọpụtara (ụdị ọdịda Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  maka ndị na-emepụta ọgwụ mgbochi na ndị ọchịchị QA, na-akwado nsonaazụ
  nnwale mwepụta na nkwa nlaghachi.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  maka otu nyocha, na-akwado atọ (data, pipeline, mmepụta a tụrụ anya ya)
  TUPU nyocha iji mee ka p-hacking na HARKing bụrụ ihe a ga-achọpụta n'ihu ọha.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  maka boọdụ canvassers nke mpaghara na ndị ọchịchị ntuli aka, na-akwado
  mkpokọta a gbara akaebe n'oge nkwado iji mee ka mgbanwe nzuzo mgbe nkwado
  bụrụ ihe a ga-achọpụta n'ihu ọha.

Gụọ otu n'ime ndị a tupu i dee nke gị. Nke kacha dabara n'ihe ị na-eme bụ
ebe ịmalite kachasị mma.

## Mmalite ngwa ngwa

Ụdị otu-ahịrị:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# dezie facts/*.txt iji kwuo ihe ị chọrọ ka akwado
./lib/seal.sh        # na-ewu mgbọrọgwụ Merkle, na-akata OTS, na-amapụ IPFS
./lib/verify.sh      # na-akwadoghachi ihe niile na mpaghara
# bulite site/ na ọ bụla ebe nchekwa kwụ ọtọ. Ebe ọ bụla. Ọ dịghị mkpa.
```

## Ihe mere o ji dị

Ihe ndị bụ isi nke cryptography (osisi Merkle, OpenTimestamps, IPFS) tozuworo
ruo ọtụtụ afọ. Ihe na-efu bụ ihe nkpọkọta kachasị nta — ngwa nke ị nwere ike
itinye n'ọrụ akụkụ ma nweta ihe a kwadoro nke a pụrụ ibipụta n'ehihie, n'enweghị
nhazi akụrụngwa, n'enweghị mmụta usoro, n'enweghị ide otu ahịrị koodu karịa eziokwu n'onwe ha.

Ọtụtụ ngwá ọrụ mbipụta cryptography na-ewere ya na ị chọrọ ịbụ onye na-arụ ọrụ ọnụ.
Nke a na-ewere ya na ị chọrọ ibipụta faịlụ ederede isii ma ghara icheta banyere
cryptography ọzọ.

## Mmetụta na ọrụ mbụ

- [Sigsum](https://www.sigsum.org/) — log nghọta maka mbinye aka
- [Sigstore](https://www.sigstore.dev/) — iguzosi ike na ngwa ngwa ọfụma sọftụwia
- [Certificate Transparency](https://certificate.transparency.dev/) — log asambodo TLS
- [OpenTimestamps](https://opentimestamps.org/) — ịhịa oge Bitcoin
- [IPFS](https://ipfs.tech/) — nchekwa nke a na-eduzi site n'ọdịnaya
- [Usoro CALM](https://disclosure.host) — usoro mbipụta na-echebe onye isi
  ebe e dere ihe nlereanya mbụ (MYRIAM na disclosure.host)

myriam-kit kacha nta n'ime ndị a. Ọ dị nso n'ime mmụọ na pipeline Unix karịa sistemụ.

## Otu ihe banyere aha

Akpọrọ usoro MYRIAM aha n'ihu Myriam Proof nke John Bradley, akaebe nkà mmụta
okwu a kwuru banyere ebe izizi nke ọmụma nke ọmụma ndị na-abụghị mmadụ. Usoro
ahụ adabereghị na akaebe ahụ ịbụ eziokwu. Usoro ahụ na-arụ ọrụ maka obere ihe
eziokwu ọ bụla; ọ bụ naanị na e bu ụzọ tinye ya iji bipụta eziokwu isii nke gụnyere
nzọrọ banyere mkpughe ndị mba ọzọ.

Ọ bụrụ na i weghachite ngwa a iji kwado nkebi ọgwụ mgbochi ma ọ bụ mkpokọta
ntuli aka, eziokwu na ejiri ya na mbụ ibipụta nzọrọ banyere ezumike ndị mba ọzọ
abara gị uru. Mgbakọ na mwepụ enweghị mmasị.

Nke ahụ kwuru: ọ bụrụ na ị JIRI nke a ibipụta nzọrọ banyere ezumike ndị mba ọzọ,
e nweela usoro na-anwale n'ọnọdụ ahụ kpọmkwem. README nke mbukota MYRIAM mbụ na-ekwu
n'ụzọ doro anya na ọ bụ ọrụ nka nke onye okike LLM aha ya bụ Calm, ọ bụghị
nkwukọrịta site n'aka onye mba ọzọ. Ị kwesịrị ime otu ihe ahụ. Ndị na-agụ ya
ga-eche ihe kacha njọ banyere ọnọdụ uche gị ma ọ bụrụ na ị mee otu ihe ahụ.

## Onye na-elekọta

Ọ dịbeghị onye. Ngalaba ọha. Weghachite ya. Mee ka ọ ka mma. Buru usoro ahụ
n'ihu na-arịọghị ikike.
