*Fandikan-teny Malagasy — ho an'ny kinova anglisy tany am-boalohany, jereo [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#ohatra-vita)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Fitaovana kely ho an'ny famoahana ankamantatra antokony kely amin'ny fomba toy izao:

- Ny fanovana rehetra atao amin'ny zava-misy iray dia hita ampahibemaso (hazo Merkle)
- Ny toetra amin'ny fotoana famoahana azo amarinina amin'ny blockchain Bitcoin (OpenTimestamps)
- Ny votoatiny dia tafita na dia esorin'ny mpampiantrano iray aza (IPFS)
- Latsaky ny 100 KB ny lanjany manontolo ary azo amarinina amin'ny andalana Python ~50 monja

Tsy blockchain io. Tsy misy token. Tsy misy fomba fifanarahana hidirana ao. Tsy misy DAO. `sha256sum` + `ots` + `ipfs` ny fitaovana, miray amin'ny fitsipiky ny fanomezana anarana tsara.

Nomena anarana avy amin'ny protokolan'i MYRIAM nampiharina voalohany tao amin'ny [disclosure.host](https://disclosure.host) tamin'ny 2026-05-21. Misy zava-misy enina, faka Merkle, ary fanamarinana Bitcoin ilay pejy. Fanitarana an'io lasitra io ity kit ity.

## Toe-javatra

- v0: miasa amin'ny macOS miaraka amin'ny Python 3.10+, Homebrew, ary fifandraisana
  amin'ny aterineto. Tsy mbola voasedra amin'ny Linux fa tokony hiasa. Windows: mitondrà WSL.
- Sehatra ho an'ny daholobe (CC0). Ampiasao, fork-na, ampidiro ao amin'ny tahirinao,
  aza miventy mihitsy. Tsy ny fiventiana no zava-dehibe.

## Fiteny misy

Ity README ity sy ireo kit ohatra maromaro dia misy amin'ny fiteny 17.
Lisitra feno ao amin'ny [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

CC0 ireo fandikan-teny ary azo hatsaraina amin'ny alalan'ny PR avy amin'ny vondrom-piarahamonina.

## Inona no azonao atao amin'izy ity

Mety amin'izay rehetra mila zava-misy antokony kely manana izao ny lasitra:

- **Azo havoaka** amin'ny mpamaky betsaka amin'ny alalan'ny HTTP tsotra
- **Maharitra** — tokony mbola ho afaka manamarina ny mpamaky aorian'ny 30 taona
- **Manondro fanovana** — tsy maintsy hita ny fanovana rehetra, fa tsy voatery ho sakanana
- **Tsy mitaky fitokisana** — tsy mila mino ny mpamoaka ny mpamaky (ny matematika ihany)

Tranga azo ampiharina mivantana ao amin'ny [docs/USE_CASES.md](docs/USE_CASES.md). Lisitra fohy:

| Sehatra | Zava-misy nasiana tombo-kase |
|---|---|
| Fahasalamam-bahoaka | Valin'ny fitsapana lots'ny vaksiny, dingana fitsapana zava-mahadomelina |
| Fifidianana | Isan'ny vato amin'ny ambaratonga biraom-pifidianana amin'ny fotoanan'ny fanamarinana |
| Filaminan'ny IA | Hash ny weights'ny modely + carte du modèle + naoty fanombanana amin'ny famoahana |
| Asa fanaovan-gazety | Lisitry ny tahirin-kevitra loharano (hash ihany) ho an'ny famoahan'ny mpitatitra antsokosoko |
| Siansa | Hash data hentitra + hash script fandinihana + valiny voambara |
| Fitsarana | Hash porofo numerika amin'ny fotoana nahazoana azy |
| Fividianana ho an'ny fanjakana | Faka voatombo-kase amin'ny angon-drakitra mikasika ny lany vola ho an'ny daholobe |

Izay iombonan'izy ireo: zava-misy antokony kely, fitakiana fahamafisana matanjaka, mpiantsehatra maro tsy mifampatoky, ary fitehirizana kely indrindra. Izany no endrika namoronana ity fitaovana ity.

## Ny zavatra TSY ataony

- **Mitehirizana zava-miafina.** Ho an'ny besinimaro daholo ny zavatra rehetra apetrakao ao
  amin'ny `facts/`. Ho an'ny famoahana ny protokoly, fa tsy ho an'ny fanafenana.
- **Miasa amin'ny angon-drakitra lehibe.** Mety amin'ny hazo Merkle; tsy mety amin'ny
  fifantohan'ny mpamaky. Mihoatra ny ~20 zava-misy dia tsy azo vakiana intsony ny pejy. Raha
  mila manombo-kase firaketana iray tapitrisa ianao, hash-o ivelan'ny pejy izy ireo dia ataovy
  ho zava-misy iray ny faka Merkle ankehitriny.
- **Miaro amin'ny fanesorana.** Ny zava-dehibe dia tsy afaka manova izay efa notombohanao
  kase ianao. Raha mety hila manesotra fitakiana atsy ho atsy ianao, aza ataovy tombo-kase.
- **Mahaliana mpisalasala matanjaka.** Tsy hanao `ipfs add -r --cid-version=1 -Q facts/`
  ny mpisalasala matanjaka. Hampangainy anefa ianao ho nanao izao rafitra rehetra izao
  ho an'ny lainga. Tsy misy fiarovana amin'ny ambaratongan'ny protokoly amin'io tranga
  faharoa io. Tsy misy fiarovana amin'ny ambaratongan'ny protokoly amin'izay miaina ao
  amin'ny antony mampihetsika olombelona fa tsy ao amin'ny matematika.

## Fomba fampiasana azy

Fanazavana dimy minitra ao amin'ny [docs/QUICKSTART.md](docs/QUICKSTART.md).
Tsipiriana feno momba ny protokoly ao amin'ny [docs/SPEC.md](docs/SPEC.md).
Modely vahohaka ao amin'ny [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Fampitahana amin'ny rafitra mifanila (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, sns.) ao amin'ny [docs/COMPARISON.md](docs/COMPARISON.md).

## Fomba fanamarinana famoahan'ny olon-kafa

Safidy telo, araka ny fahafahana mampiasa azy:

1. **Mpitety tranonkala**: sokafy [`lib/verify.html`](lib/verify.html) amin'ny mpitety
   maoderina rehetra. Apetao ny URL famoahana. Tsindrio ny verify. Mampiasa
   `crypto.subtle` ho an'ny hashing — tsy misy hapetraka, tsy misy backend, tsy misy
   telemetry. Ny dingana fanamarinana Bitcoin mbola mila fitaovana CLI (jereo ny dingana
   faha-7 ao amin'ny pejy mpanamarina).
2. **Python**: `python3 lib/verify.py` ao anatin'ny lahatahiry famoahana. Stdlib ihany;
   mitaky `ots` ho an'ny fanamarinana Bitcoin.
3. **Manomboka any am-piandohana**: vakio ny [`docs/SPEC.md §3`](docs/SPEC.md) dia
   ampihaharo indray. Latsaky ny andalana 30 amin'ny fiteny rehetra ny algorithm Merkle.

## Ohatra vita

Kit ohatra enina amin'ny tena fitazonana mialoha no miaraka amin'ity fitaovana ity. Ny
tsirairay dia voatombo-kase, voasoratra OTS, voakambana amin'ny IPFS, ary ahitana README
fampiharana manazava rahoviana no fork-na ho amin'ny tranga tena izy sy ny tranga fialana
arovana.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) — ho an'ny tranga
  fialana toy ny Boeing 737 MAX / Theranos / tatitra mpanara-maso ny FDA, izay alevin'ny
  mpanelanelana ny porofo na ovany.
- [`examples/ai-model-card/`](examples/ai-model-card/) — ho an'ireo trano fikarohana IA
  mamoaka modely, miaraka amin'ny fanekena alohan'ny famoahana izay lasa azo hita
  amin'ny fomba mekanika fa tsy am-bava.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — ho an'ny
  mpamatsy fitsapana klinika, mba hahitana ny fanovana endpoint aoriana sy ny fitaterana
  voafantina (tranga Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — ho an'ny
  mpanamboatra vaksiny sy ny manampahefana QA, manombo-kase ny valin'ny fitsapana
  famoahana sy ny fanekena rappel.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — ho an'ny
  vondrom-pikarohana, manombo-kase ny telopoa (data, pipeline, vokatra andrasana) ALOHAN'NY
  fandinihana mba ho hita ampahibemaso ny p-hacking sy ny HARKing.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  ho an'ny biraon'ny mpanara-maso sy ny manampahefan'ny fifidianana, manombo-kase ny
  isam-bato voamarina amin'ny fotoanan'ny fanamarinana mba ho hita ampahibemaso ny
  fanovana mangina aorian'ny fanamarinana.

Vakio ny iray amin'ireo alohan'ny hanoratanao ny anao. Ny tena mifanaraka amin'ny tranganao
matetika no fork tsara hiandohana.

## Fanombohana haingana

Ny endrika andalana iray:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# ovay ny facts/*.txt mba hilaza izay tena tianao hotombohana kase
./lib/seal.sh        # manangana ny faka Merkle, manao tombo-kase OTS, mametaka amin'ny IPFS
./lib/verify.sh      # manamarina indray ny zava-drehetra eo an-toerana
# alefa amin'ny mpampiantrano static rehetra ny site/. Na aiza na aiza. Tsy mampaninona.
```

## Antony nahatongavany

Efa matotra hatry ny taona maro ny primitives kriptografika (hazo Merkle, OpenTimestamps,
IPFS). Izay tsy hita dia ny fameranana kely indrindra — kit izay azonao apetraka ao
amin'ny tetikasa anivony dia hanana zavatra voatombo-kase azo havoaka ao anatin'ny tolak'andro
iray, tsy mila mametra fotodrafitrasa, tsy mila mianatra protokoly, tsy mila manoratra andalana
kaody iray akory ankoatra ny zava-misy mihitsy.

Ny ankamaroan'ny fitaovana famoahana kriptografika dia mihevitra fa te-ho mpiasan'ny node
ianao. Ity dia mihevitra fa te hamoaka rakitra soratra enina ianao ary tsy hieritreritra
kriptografia intsony.

## Fitaomana sy asa nataony teo aloha

- [Sigsum](https://www.sigsum.org/) — diary mangarahara ho an'ny sonia
- [Sigstore](https://www.sigstore.dev/) — fahamarinan'ny rojo famatsiana lozisialy
- [Certificate Transparency](https://certificate.transparency.dev/) — diary fanamarinana TLS
- [OpenTimestamps](https://opentimestamps.org/) — tombo-kase amin'ny Bitcoin
- [IPFS](https://ipfs.tech/) — fitehirizana arahin'ny votoatiny
- [Ny protokolan'i CALM](https://disclosure.host) — ny lasitra famoahana miaro ny
  tomponandraikitra izay nanoratana ny tranga voalohany (MYRIAM tao amin'ny disclosure.host)

myriam-kit no kely indrindra amin'ireo. Akaiky kokoa ny fanahin'ny fantsona Unix izy
noho ny rafitra iray.

## Naoty momba ny anarana

Nomena anarana avy amin'ny Myriam Proof an'i John Bradley ny protokolan'i MYRIAM, izay
porofo lojika voambara momba ny teboka voalohany ifandraisana amin'ny saina tsy olombelona.
Tsy miankina amin'ny fahamarinan'io porofo io ny protokoly. Miasa ho an'ny zava-misy antokony
kely rehetra ny protokoly; nanjary nampiasaina voalohany hamoahana zava-misy enina misy
fitakiana mikasika ny famoahana am-pahibemaso momba ny vahiny avy any an-danitra fotsiny izy.

Raha fork-nao ity kit ity hanombo-kase ny lots'ny vaksiny na ny isam-baton'ny fifidianana,
tsy misy idirany aminao ny hoe nampiasaina voalohany hamoahana fitakiana momba ny
fifandraisana amin'ny vahiny avy any an-danitra izy. Tsy mahalala izany ny matematika.

Na izany aza: raha NAMPIASAINAO izy ity hamoahana fitakiana momba ny fifandraisana amin'ny
vahiny avy any an-danitra, dia voasedra teo amin'io sehatra manokana io ny protokoly.
Lazain'ny README'n'ny famoahana MYRIAM voalohany ampahibemaso fa asa kanto an'ny persona
LLM antsoina hoe Calm izy fa tsy fifandraisana avy amin'ny tonta vahiny avy any an-danitra
rehetra. Tokony hanao toy izany koa ianao. Raha tsy izany, hihevitra ny ratsy indrindra
momba ny toe-tsainao ny mpamaky.

## Tantanin'

Mbola tsy misy. Sehatra ho an'ny daholobe. Fork-o. Hatsarao. Ento mandroso ny protokoly
tsy mila mangataka alalana.
