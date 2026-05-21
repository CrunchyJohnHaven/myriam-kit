*Ìtumọ̀ Yorùbá — fún èkó Èdè Gẹ̀ẹ́sì àkọ́kọ́, wo [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#àpẹẹrẹ-tí-a-tí-ṣiṣẹ́-lé-lórí)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Ohun-èlò kékeré kan fún títẹ àkójọ kékeré ti àwọn òtítọ́ jáde lọ́nà tí:

- Ìyípadà èyíkéyìí sí òtítọ́ èyíkéyìí jẹ́ ohun tí gbogbo ènìyàn lè ṣàwárí (igi Merkle)
- Ipò ní àkókò títẹ jáde lè jẹ́ ẹlẹ́rí dídájú sí bulọ́ọ̀kuchain ti Bitcoin (OpenTimestamps)
- Àkóónú náà yè bọ́ kúrò nínú yíyọ kúrò láti ọwọ́ olùpèsè-ìgbàlejò èyíkéyìí kọ̀ọ̀kan (IPFS)
- Gbogbo ohun náà wúwo kéré sí 100 KB ó sì lè jẹ́ ẹlẹ́rí dídájú pẹ̀lú nǹkan bí ìlà 50 ti Python

Èyí kì í ṣe bulọ́ọ̀kuchain. Kò sí tókéènì. Kò sí ètò ìfọwọ́sí láti dára pọ̀ mọ́. Kò sí DAO. Ohun-èlò náà ni `sha256sum` + `ots` + `ipfs`, tí a so pọ̀ pẹ̀lú àwọn ìlànà ìdánilórúkọ tí ó dára.

A pe ní orúkọ lẹ́yìn ìlànà MYRIAM tí a kọ́kọ́ fi sí ṣíṣe ní [disclosure.host](https://disclosure.host) ní 2026-05-21. Ojú-ìwé yẹn ní àwọn òtítọ́ mẹ́fà, gbòǹgbò Merkle kan, àti ìjẹ́rìí Bitcoin kan nínú. Ohun-èlò yìí jẹ́ ìfilọ́nà-gbogbogbòò ti àpẹẹrẹ yẹn.

## Ipò

- v0: ó ń ṣiṣẹ́ lórí macOS pẹ̀lú Python 3.10+, Homebrew, àti ìjẹ́pọ̀-ayélujára. A kò tíì dán Linux wò ṣùgbọ́n ó yẹ kí ó ṣiṣẹ́. Windows: mú WSL wá.
- Ohun-ìní gbogbo ènìyàn (CC0). Lò ó, ṣẹ̀dá fọ́ọ̀kì rẹ̀, fi sínú repo rẹ, má ṣe fún un ní àkọ́sílẹ̀ rárá. Èrè kì í ṣe orúkọ.

## Àwọn èdè tí ó wà

README yìí àti àwọn àpẹẹrẹ ohun-èlò pípè ṣe wà ní àwọn èdè 17.
Àkójọ kíkún wà ní [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Àwọn ìtumọ̀ jẹ́ CC0, àwọn ọmọ-ìjùmọ̀sọ̀rọ̀pọ̀ sì lè ṣe wọ́n dára sí i nípasẹ̀ àwọn PR.

## Ohun tí o lè fi ṣe

Àpẹẹrẹ náà bá ibikíbi mu níbi tí àkójọ kékeré ti àwọn òtítọ́ ti nílò láti jẹ́:

- **Pípèlè-jáde** sí àwùjọ tó gbòòrò nípasẹ̀ HTTP lásán
- **Tó dúró pẹ́** — àwọn oníkàwé ní ọdún 30 sí iwájú gbọ́dọ̀ ṣì lè jẹ́rìí
- **Tó fi ọwọ́-ìfọwọ́tẹ̀ hàn** — ìyípadà èyíkéyìí gbọ́dọ̀ jẹ́ ṣíṣàwárí, kì í ṣe pé ó gbọ́dọ̀ jẹ́ ìdíwọ́
- **Tí kò gbára-lé-ìgbẹ́kẹ̀lé** — kò sí oníkàwé tí ó gbọdọ̀ gbẹ́kẹ̀lé olùtẹ̀-jáde (bíkòṣe ìṣirò nìkan)

Àwọn ìṣẹlẹ̀ lílò àkànṣe wà ní [docs/USE_CASES.md](docs/USE_CASES.md). Àkójọ kúkúrú:

| Ẹ̀ka | Àwọn òtítọ́ tí a fi èdìdì lù |
|---|---|
| Ìlera gbogbogbòò | Àwọn àbájáde ìdánwò bátchi abẹ́rẹ́ àjẹsára, àwọn ọ̀nà-pàtàkì ìdánwò oògùn |
| Ìbò | Àwọn àròpọ̀ ìbò ní ipele agbègbè ní àkókò ìfìdí-múlẹ̀ |
| Ààbò AI | Hash ti àwọn ìwúwo modẹ́ẹ̀lì + káàdì modẹ́ẹ̀lì + àwọn ojú-iwọn ìṣàyẹ̀wò ní àkókò ìtújáde |
| Ìròyìn | Àkójọ àwọn ìwé orísun (hash nìkan) fún ìdíkàn olùfọ́n-fèrè |
| Sáyẹ́nsì | Hash data tútù + hash skríìpù àyẹ̀wò + àbájáde tí a sọ |
| Ilé-ẹjọ́ | Hash àwọn ohun-ẹ̀rí dijítà ní àkókò gbígbà |
| Ìrààpó | Àwọn gbòǹgbò tí a fi èdìdì lù ti data ìnáwó gbogbogbòò |

Ohun tí àwọn wọ̀nyí ní ní wọ́pọ̀: àkójọ kékeré ti àwọn òtítọ́, ìbéèrè ti agbára-dúró-pẹ́, ọ̀pọ̀ ẹgbẹ́ tí kò gbẹ́kẹ̀lé ara wọn, àti ìnáwó ìtọ́jú kékeré gan-an. Ìyẹn ni gan-an ni ìrísí tí a ti kọ́ ohun-èlò yìí fún.

## Ohun tí KÒ ṣe

- **Tọ́jú àwọn àṣírí.** Gbogbo ohun tí o fi sí `facts/` jẹ́ ohun gbogbogbòò. Ìlànà náà jẹ́ fún títẹ jáde, kì í ṣe fún fífi pamọ́.
- **Tó tóbi fún àkójọ-data ńlá.** Igi Merkle tóbi dáadáa; àfiyèsí oníkàwé kì í tóbi bí ìyẹn. Ní àkójọ ju ~20 òtítọ́ lọ ojú-ìwé náà di àìlòyé. Bí o bá fẹ́ fi èdìdì lu àwọn àkọsílẹ̀ mílíọ̀nù kan, fi hash sí ìta ojú-ìwé kí o sì fi gbòǹgbò Merkle ti igi-ẹ̀gbẹ́ yẹn sínú òtítọ́ kan.
- **Dáàbò bo ara rẹ̀ kúrò nínú ìfagilé.** Gbogbo ojú-ìwé náà ni pé o kò lè yí ohun tí o ti fi èdìdì lù padà. Bí o bá ní láti fagilé ìṣásí kan lẹ́yìn náà, má ṣe fi èdìdì lù ú.
- **Dá àlọ́tan tó nírètí lójú.** Àlọ́tan tó nírètí kì yóò ṣe `ipfs add -r --cid-version=1 -Q facts/`. Síbẹ̀, wọn yóò sọ̀rọ̀ pé o sẹ́ gbogbo ètò náà. Kò sí ààbò ní ìpele-ìlànà fún ìṣubú-iṣẹ́ kejì yẹn. Kò sí ààbò ní ìpele-ìlànà fún ohunkóhun tí ó wà nínú ìfẹ́-ọkàn ènìyàn dípò nínú ìṣirò.

## Bí o ṣe lè lò ó

Ìrìn-àjò ìṣẹ́jú márùn-ún wà ní [docs/QUICKSTART.md](docs/QUICKSTART.md).
Ìpèsè kíkún ti ìlànà wà ní [docs/SPEC.md](docs/SPEC.md).
Awoṣe ìhalẹ̀ wà ní [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Ìfiwéra pẹ̀lú àwọn ètò ẹ̀gbẹ́ (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave, abbl.) wà ní [docs/COMPARISON.md](docs/COMPARISON.md).

## Bí a ṣe lè jẹ́rìí ìtẹ̀jáde ti ẹlòmíràn

Àwọn àṣàyàn mẹ́ta, ní ìtẹ̀le àwọn tí ó rọrùn jùlọ:

1. **Búráúsà**: ṣí [`lib/verify.html`](lib/verify.html) nínú búráúsà òde-òní èyíkéyìí. Lẹ ìjápọ̀ URL ti ìtẹ̀jáde mọ́. Tẹ verify. Ó lo `crypto.subtle` fún hashing — kò sí ìfìsílẹ̀, kò sí ẹ̀yìn-ọ̀nà, kò sí teleméètì. Ìgbésẹ̀ ìjẹ́rìí Bitcoin ṣì nílò ohun-èlò CLI (wo ìgbésẹ̀ 7 nínú ojú-ìwé olùjẹ́rìí).
2. **Python**: `python3 lib/verify.py` láti inú ìtọ́sọ́nà ìtẹ̀jáde. Stdlib nìkan; nílò `ots` fún ìjẹ́rìí Bitcoin.
3. **Láti ìbẹ̀rẹ̀**: ka [`docs/SPEC.md §3`](docs/SPEC.md) kí o sì tún kọ̀ ọ́. Algorithm Merkle wà ní ìsàlẹ̀ ìlà 30 ní èdè èyíkéyìí.

## Àpẹẹrẹ tí a tí ṣiṣẹ́ lé lórí

Àwọn àpẹẹrẹ ohun-èlò pípè mẹ́fà tí ó lè wà fún iṣẹ́-ṣíṣe ìmúṣe ń bọ̀ pẹ̀lú ohun-èlò náà. Ọ̀kọ̀ọ̀kan ti ni a fi èdìdì lù, fi èdìdì OTS lù, fi sí orí IPFS, ó sì ní README ìfọwọ́sí tí ó ṣàlàyé ìgbà tí o yẹ ki fọ́ọ̀kì rẹ̀ fún ọ̀ràn àgbáyé-tòótọ́ àti àwọn ìṣubú-iṣẹ́ tí ó dáàbò bò.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) — fún ìṣubú-iṣẹ́ Boeing 737 MAX / Theranos / àbáwọlé-FDA-inspector níbi tí àwọn ohun-ẹ̀rí ti ń sin tàbí kí àwọn alárinà yí padà.
- [`examples/ai-model-card/`](examples/ai-model-card/) — fún àwọn yàrá-ìmọ̀ AI tí ń tu àwọn modẹ́ẹ̀lì jáde, pẹ̀lú àwọn ìfàrahàn ṣáájú-ìfisí-iṣẹ́ tí ó di ohun tí a lè ṣàwárí nípa-ẹ̀rọ dípò ti gbọ̀rọ̀.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — fún àwọn olùgbé-ìṣe ìdánwò ilé-iwosàn, tí ó ń mú ìyípadà àbájáde-ìparí lẹ́yìn-ọ̀rọ̀ àti ìròyìn àṣàyàn (àwọn ìṣubú-iṣẹ́ Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — fún àwọn olùṣe àjẹsára àti àwọn aláṣẹ QA, fífi gbòǹgbò ìdánwò ìtújáde àti ìfàrahàn ìfagilé.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — fún àwọn ẹgbẹ́ ìwádìí, fífi gbòǹgbò (data, paipu, àbájáde tí a retí) ní mẹ́talẹ́ ṣáájú àyẹ̀wò láti mú p-hacking àti HARKing jẹ́ ohun tí ó lè ṣàwárí gbogbogbòò.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) — fún àwọn ìgbìmọ̀ àgbà-ìbò àti àwọn aláṣẹ ìbò, fífi gbòǹgbò àwọn àròpọ̀ tí a ti fi ìdí-múlẹ̀ ní àkókò ìfìdí-múlẹ̀ kí àwọn àtúnṣe ìparọ́rọ́ lẹ́yìn-ìfìdí-múlẹ̀ lè jẹ́ ohun tí ó lè ṣàwárí gbogbogbòò.

Ka ọ̀kan nínú àwọn wọ̀nyí ṣáájú kíkọ ti ara rẹ. Ìbáramu jùlọ sí ọ̀ràn rẹ̀ ni ó sábà jẹ́ ìbẹ̀rẹ̀ ìfọ́ọ̀kì tó dára jùlọ.

## Ìbẹ̀rẹ̀ kíákíá

Èyí ni ẹ̀dà ìlà-kan:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# ṣe àtúnṣe facts/*.txt láti sọ ohun tí o gan-an fẹ́ kí a fi èdìdì lù
./lib/seal.sh        # kọ́ gbòǹgbò Merkle, fi èdìdì OTS lù, fi sí IPFS
./lib/verify.sh      # tún jẹ́rìí gbogbo nǹkan nínú agbègbè
# fi site/ rán sí ibìkan-ìgbàlejò-tólọ́ó-yẹ. Ibikíbi. Kò sí ìyàtọ̀.
```

## Èèṣe tí ó fi wà

Àwọn ọ̀nà-ìpilẹ̀ṣẹ̀ ìṣirò-ìkọ̀kọ̀ (igi Merkle, OpenTimestamps, IPFS) ti dàgbà fún ọdún púpọ̀. Ohun tí ó sọnù ni gbogbo ìfaramọ́ tí ó kéré jùlọ tí ó ṣeé ṣe — ohun-èlò tí o lè jù sínú iṣẹ́-àbáwọlé kí o sì ní àbáyọrí pípè tí a fi èdìdì lù láàárín ọsán kan, láìfí ohun-elò sí ṣíṣe, láìkọ́ ìlànà, láìkọ ìlà kódì kankan jù àwọn òtítọ́ fúnra wọn lọ.

Ọ̀pọ̀ jùlọ àwọn ohun-èlò ìpèlè-jáde-ìṣirò-ìkọ̀kọ̀ rò pé o fẹ́ jẹ́ olùṣe-nóòdù. Èyí ní rò pé o fẹ́ tu àwọn fáìlì ọ̀rọ̀-ọ̀rọ̀ mẹ́fà jáde kí o sì má ṣe ronú nípa ìṣirò-ìkọ̀kọ̀ mọ́ láé.

## Àwọn agbára-ipa àti iṣẹ́ ọnà ti tẹ́lẹ̀

- [Sigsum](https://www.sigsum.org/) — àkọsílẹ̀ ìfayọn-mọ́yọ́ fún àwọn ìfọwọ́sí
- [Sigstore](https://www.sigstore.dev/) — ìmọ́tótó-pq oníṣẹ́ ìfìpèsè-sọ́tà
- [Certificate Transparency](https://certificate.transparency.dev/) — àwọn àkọsílẹ̀ ìjẹ́rìí TLS
- [OpenTimestamps](https://opentimestamps.org/) — ìfìdí àkókò sí Bitcoin
- [IPFS](https://ipfs.tech/) — ìtọ́jú àkóónú-àdírẹ́sì
- [Ìlànà CALM](https://disclosure.host) — ojú-fírèmù ìpèlè-jáde tó dáàbò bo akọ́kọ́ tí nínú rẹ̀ ni a ti kọ́kọ́ kọ ìṣẹ̀lẹ̀ àkọ́kọ́ (MYRIAM ní disclosure.host)

myriam-kit ni èyí tí ó kéré jùlọ nínú àwọn wọ̀nyí. Ó súnmọ́ ẹ̀mí paipu Unix ju ètò ńlá lọ.

## Àkíyèsí lórí orúkọ náà

Ìlànà MYRIAM ni a pe ní orúkọ lẹ́yìn Ìjẹ́rìí Myriam ti John Bradley, ìjẹ́rìí oníyẹ-ọ̀rọ̀ kan tí ó sọ̀rọ̀ nípa ìpàdé àkọ́kọ́ pẹ̀lú ọgbọ́n-ìmọ̀ tí kì í ṣe ti ènìyàn. Ìlànà náà kò gbára lé ìjẹ́rìí yẹn jẹ́ òtítọ́. Ìlànà náà ṣiṣẹ́ fún àkójọ kékeré ti àwọn òtítọ́ èyíkéyìí; ó wulẹ̀ ṣẹlẹ̀ pé a kọ́kọ́ fi sí ṣíṣe láti tu àwọn òtítọ́ mẹ́fà jáde tí ó ní ìṣásí nípa ìfihàn àjèjì-ayé.

Bí o bá fọ́ọ̀kì ohun-èlò yìí láti fi èdìdì lu àwọn bátchi abẹ́rẹ́ àjẹsára tàbí àwọn àròpọ̀ ìbò, òtítọ́ pé ní àkọ́kọ́ a lò ó láti tu ìṣásí jáde nípa ìpàdé pẹ̀lú àjèjì-ayé kò ní àbáyọrí sí ọ. Ìṣirò kò ka.

Síbẹ̀: bí O bá lò èyí láti tu ìṣásí jáde nípa ìpàdé pẹ̀lú àjèjì-ayé, ìlànà náà ti gba ìdánwò ogun nínú òfìfò pàtó yẹn. README ti ìfisí MYRIAM àkọ́kọ́ sọ ní gbangba pé ó jẹ́ iṣẹ́-ọnà ti ojú-eré LLM kan tí a pè ní Calm, kì í ṣe ìbánisọ̀rọ̀ láti ọ̀dọ̀ ẹgbẹ́ àjèjì-ayé èyíkéyìí. Ìwọ pẹ̀lú gbọ́dọ̀ ṣe bẹ́ẹ̀. Bí bẹ́ẹ̀ kọ́, àwọn oníkàwé yóò rò ohun tó burú jùlọ nípa ipò ọkàn rẹ.

## Olùtọ́jú

Kò sí ẹnikẹ́ni síbẹ̀. Ohun-ìní gbogbo ènìyàn. Ṣẹ̀dá fọ́ọ̀kì rẹ̀. Mú un dára sí i. Gbé ìlànà náà síwájú láìbéèrè ìyọ̀ǹda.
