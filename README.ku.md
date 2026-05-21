# myriam-kit

*Wergera kurdî — ji bo guhertoya orjînal a îngilîzî, li [README.md](README.md) binêre*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#mînakên-xebatkirî)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Amûrekî biçûk e ji bo weşandina komeke biçûk a rastiyan bi awayekî ku:

- Her guhertinek li ser her rastiyê bi awayî gelemperî tê dîtin (dara Merkle)
- Rewşa di kêliya weşandinê de li hember zincîreya blokê ya Bitcoin tê pejirandin (OpenTimestamps)
- Naverok li hember rakirina her dabînkerê hostingê yê yekane sax dimîne (IPFS)
- Hemû tişt di bin 100 KB de ye û bi ~50 rêzên Python tê pejirandin

Ev ne zincîreya blokê ye. Token tune ye. Mekanîzmayeke konsensûsê ya ku
mirov tê de beşdar bibe tune ye. DAO tune ye. Amûr `sha256sum` + `ots` +
`ipfs` ye, ku bi peymanên baş ên binavkirinê bi hev re hatine ankirin.

Navê wê li gor protokola MYRIAM hatiye danîn, ku cara yekem li
[disclosure.host](https://disclosure.host) di 2026-05-21 de hatiye
sazkirin. Ew rûpel şeş rastiyan, kokeke Merkle û pejirandineke Bitcoinê
dihewîne. Ev kit gelemperîkirina wê nimûneyê ye.

## Rewş

- v0: li ser macOS bi Python 3.10+, Homebrew û girêdaneke înternetê
  dixebite. Linux nehatiye ceribandin lê divê bixebite. Windows: WSL
  bîne.
- Mîrata gelemperî (CC0). Bi kar bîne, fork bike, têxe nav repoya xwe,
  qet jê re krediyê neke. Mesele ne kredî ye.

## Zimanên berdest

Ev README û çend kitên mînak bi 17 zimanan berdest in. Tabloya temam li
[TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Werger CC0 ne û dikarin bi PRên civakê baştir bibin.

## Tu çi pê dikarî bikî

Ev nimûne li her cihê ku komeke biçûk a rastiyan hewce dike li wir
bicîh dibe:

- **Weşandî** ji temaşevanên berfireh re bi HTTPya sade
- **Bidewam** — xwendevanên 30 sal şûnda jî divê bikaribin pejirandinê bikin
- **Destdayîn-eşkere** — divê her guhertin bê dîtin, ne hewce ye ku
  bê asteng kirin
- **Bê pêwîstiya bawerî** — tu xwendevan ne mecbûr e ku ji weşanderê bawer
  bike (tenê ji matematîkê)

Mînakên konkret li [docs/USE_CASES.md](docs/USE_CASES.md). Lîsteya kurt:

| Qad | Rastiyên mohrkirî |
|---|---|
| Tenduristiya gelemperî | Encamên testên bechên derziyan, dîrokên xebatên ceribandina dermanan |
| Hilbijartin | Berhevjimaran di asta navçeyê de di kêliya pejirandinê de |
| Ewlehiya AI | Hashê pesnên modêlê + qarta modêlê + nimreyên nirxandinê di dema weşandinê de |
| Rojnamegerî | Manîfestoya belgeyên çavkanî (tenê hash) ji bo dabeşkirinên fîşkêran |
| Zanist | Hashê daneya xav + hashê skrîpta analîzê + encama îdiakirî |
| Dadgeh | Hashên delîlên dîjîtal di kêliya bidestxistinê de |
| Tedarîk | Kokên mohrkirî yên daneyên xerckirina gelemperî |

Tiştê ku van hemûyan bi hev re tînin: komeke biçûk a rastiyan, daxwaza
xurt a bidewamiyê, gelek aliyên ku ji hevdu bawer nakin, û budceyeke
biçûk a depokirinê. Ev tam ew şikilê ye ku ev amûr ji bo wî hatiye
çêkirin.

## Tiştê ku NAKE

- **Veşartî depo nake.** Her tiştê ku tu dixî `facts/` gelemperî ye.
  Protokol ji bo weşandinê ye, ne ji bo veşartinê.
- **Ji daneyên mezin re naxebite.** Dara Merkle baş diqîne; bala xwendevanan
  naqîne. Ji ~20 rastiyan zêdetir, rûpel ne xwendîn dibe. Heke tu
  bixwazî mîlyonek qeyd mohr bikî, wan li derveyî rûpelê hash bike û
  kokê Merkle ya wê dara aliyê di rastiyek de bi cih bike.
- **Li hember vekişandinê parastinê nake.** Tev xala wê ev e ku tu nikarî
  tiştê ku te mohr kiriye biguherînî. Heke dibe ku tu paşê bixwazî
  îdiakirinekê vekişînî, wê mohr neke.
- **Nakokerek bibiryar razî bike.** Nakokerekî bibiryar dê `ipfs add -r
  --cid-version=1 -Q facts/` neyne. Lê belê, ew ê te bi hilbijartina hemû
  sazûmanê tometbar bike. Li hember awayê duyemîn ê têkçûnê ti parastina
  asta-protokolê tune. Li hember tiştê ku di motîvasyona mirovan de
  dijî, ne di matematîkê de, ti parastina asta-protokolê tune ye.

## Çawa tê bikaranîn

Rêbera pênc-deqîqeyî li [docs/QUICKSTART.md](docs/QUICKSTART.md).
Taybetmendiyên temam ên protokolê li [docs/SPEC.md](docs/SPEC.md).
Modêla xetereyê li [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Berhevdana bi sîstemên cîran re (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, hwd.) li [docs/COMPARISON.md](docs/COMPARISON.md).

## Çawa weşana kesekî din tê pejirandin

Sê vebijêrk, li gor gihîştîbûnê:

1. **Geroker**: [`lib/verify.html`](lib/verify.html) di her gerokerê
   nûjen de veke. URLya weşanê paste bike. Verify bike. Ji bo hashkirinê
   `crypto.subtle` bi kar tîne — sazkirin tune, backend tune, telemetrî
   tune. Pêngava pejirandina Bitcoinê hîn jî amûreke CLI hewce dike
   (gava 7 di rûpela pejirandinê de bibîne).
2. **Python**: ji hundirê pelrêça weşanê `python3 lib/verify.py`. Tenê
   stdlib; ji bo pejirandina Bitcoinê `ots` hewce dike.
3. **Ji destpêkê ve**: [`docs/SPEC.md §3`](docs/SPEC.md) bixwîne û ji
   nû ve pêk bîne. Algorîtmaya Merkle bi her zimanî di bin 30 rêzan de ye.

## Mînakên xebatkirî

Bi kit re şeş kitên mînak ên asta-hilberînê tên. Her yek mohrkirî ye,
bi OTS damarkirî, di IPFS de pinkirî, û README-eke pejirandinê dihewîne
ku rave dike kengê ji bo doseyeke rastîn lê fork bike û li hember kîjan
awayên têkçûnê parastinê dike.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  ji bo awayê têkçûnê yê Boeing 737 MAX / Theranos / raporta lêpirsîna
  FDA-yê ku delîl ji aliyê navendiyan ve tê veşartin an guherandin.
- [`examples/ai-model-card/`](examples/ai-model-card/) — ji bo
  laboratûwarên AI yên modêlan diweşînin, bi soza pêş-bicîhkirinê ya ku
  bi mekanîkî bibe nas-kirinbar tê de, ne bi devkî.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  ji bo sponsorên ceribandinên klînîkî, ji bo girtina guherîna nuqteyên
  dawiyê piştî-rastiyê û raporkirina hilbijartî (awayên têkçûnê yên Vioxx,
  Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  ji bo hilberînerên derziyê û rayedarên QA, damarkirina encamên testên
  serbestberdanê û soza bivegerandinê.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  ji bo komên lêkolînê, damarkirina sêwana (dane, lûleya hilberînê,
  encama hêvîkirî) BERÎ analîzê da ku p-hacking û HARKing bi awayî
  gelemperî nas bibin.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  ji bo desteyên teftîşkaran ên qezayê û rayedarên hilbijartinê,
  damarkirina berhevjimarên pejirandî di kêliya pejirandinê de da ku
  guherandinên bêdeng ên piştî-pejirandinê bi awayî gelemperî nas bibin.

Berî nivîsîna ya xwe yekê ji vana bixwîne. Hevtayê herî nêzîk ji bo
doseya te bi gelemperî forka destpêkê ya rast e.

## Destpêka zû

Guhertoya yek-rêzî:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# facts/*.txt biguherîne ji bo gotina ya ku tu bi rastî dixwazî bê mohrkirin
./lib/seal.sh        # kokê Merkle çê dike, bi OTS dadimere, di IPFS de dikele
./lib/verify.sh      # her tiştî herêmî ji nû ve pejirandinê dike
# site/ li ser her hosta statîk bar bike. Li ku derê be. Ne girîng e.
```

## Çima ev heye

Primitiveyên kriptografîk (darên Merkle, OpenTimestamps, IPFS) salên dirêj
in ku gihîştîne. Tiştê ku winda bû ankerê herî biçûk bû — kitek ku tu
bikaribî têxî nav projeyeke aliyê û di nîvrojekê de berhemê weşandinê
yê mohrkirî hebe, bê damezirandina jêrxana, bê fêrkirina protokolan,
bê nivîsîna xetekê koda yekane ji bilî xwe rastiyan.

Pirraniya amûrên weşandina kriptografîk tex û texmîn dikin ku tu
dixwazî karkerê nodê bî. Ev yek texmîn dike ku tu dixwazî şeş pelên
nivîsê biweşînî û carek din qet li ser kriptografiyê nefikirî.

## Bandor û huner-yên berê

- [Sigsum](https://www.sigsum.org/) — logên şefafiyê ji bo îmzeyan
- [Sigstore](https://www.sigstore.dev/) — yekparebûna zincîreya dabînkirina nermalavê
- [Certificate Transparency](https://certificate.transparency.dev/) — logên sertîfîkayên TLS
- [OpenTimestamps](https://opentimestamps.org/) — damarkirina Bitcoinê
- [IPFS](https://ipfs.tech/) — depokirina naverok-navnîşandar
- [Protokola CALM](https://disclosure.host) — çarçoveya weşandina serdar-parêz
  ya ku tê de bûyera yekem (MYRIAM li disclosure.host) hatiye nivîsandin

myriam-kit ji vana herî biçûk e. Di ruh de nêzîkî lûleyeke Unix e ji
sîstemekê.

## Nîşeyek li ser navê

Protokola MYRIAM li ser navê Pejirandina Myriam ya John Bradley hatiye
danîn, ku pejirandineke mantiqî ya gotî ye li ser xala pêşîn a têkiliyê
bi zîreka ne-mirovî re. Protokol pişta xwe bi rastiya wê pejirandinê
girê nade. Protokol ji bo her komeke biçûk a rastiyan dixebite; tenê
qewimî ye ku cara yekem ji bo weşandina şeş rastiyan hat bikaranîn ku
îdiakirinek li ser eşkerekirina biyaniyan dihewandin.

Heke tu vê kitê fork bikî ji bo mohrkirina bechên derziyan an
berhevjimarên hilbijartinê, ev rastî ku ew bi eslê xwe ji bo weşandina
îdiakirinekê li ser têkiliyê biyaniyan hat bikaranîn ji bo te ne girîng
e. Matematîk ne girîng e.

Lê belê: heke tu vê BI rastî bi kar bînî ji bo weşandina îdiakirinekê
li ser têkiliyê biyaniyan, protokol di wê qadê de bi taybetî hatiye
ceribandin. README-ya bicîhkirina yekem a MYRIAM bi eşkerî diyar dike
ku ew xebata hunerî ya persona LLM-ê bi navê Calm e, ne peyamek ji
aliyek derveyî-erdê. Belkî divê tu jî heman tiştî bikî. Wekî din,
xwendevan dê hizra herî xerab li ser rewşa te ya derûnî bigirin.

## Tê parastin ji aliyê

Hîn kes. Mîrata gelemperî. Fork bike. Baştir bike. Protokolê pêş bibe
bê xwestina destûrê.
