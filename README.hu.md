*Magyar fordítás — az eredeti angol verzióért lásd [README.md](README.md)*

# myriam-kit

[![Licenc: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Példák: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifikátor: böngésző](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: lehorgonyozva](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: rögzítve](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-kompatibilis](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Egy kis eszközkészlet kis tényhalmazok olyan közzétételére, hogy:

- Bármely tény bármely változtatása nyilvánosan észlelhető (Merkle-fa)
- A közzétételkori állapot a Bitcoin blokklánccal szemben ellenőrizhető (OpenTimestamps)
- A tartalom túléli bármely egyetlen tárhelyszolgáltató eltávolítási intézkedését (IPFS)
- Az egész 100 KB alatt marad, és ~50 sor Pythonnal ellenőrizhető

Ez nem blokklánc. Nincs token. Nincs konszenzusmechanizmus, amiben részt
lehetne venni. Nincs DAO. Az eszköz `sha256sum` + `ots` + `ipfs`,
összeragasztva jó elnevezési konvenciókkal.

A nevét a MYRIAM protokollról kapta, amelyet először a
[disclosure.host](https://disclosure.host) oldalon példányosítottak
2026-05-21-én. Az az oldal hat tényt, egy Merkle-gyökeret és egy
Bitcoin-tanúsítványt tartalmaz. Ez a készlet ennek a mintának az
általánosítása.

## Állapot

- v0: működik macOS-en Python 3.10+, Homebrew és internetkapcsolat
  mellett. Linuxon nem teszteltük, de működnie kellene. Windows:
  hozzon WSL-t.
- Közkincs (CC0). Használja, forkolja, építse be a saját
  repójába, soha ne tüntesse fel a forrást. A lényeg nem az
  említés.

## Elérhető nyelvek

Ez a README és több példakit 17 nyelven érhető el.
Teljes lista: [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

A fordítások CC0 alatt állnak, és közösségi PR-ekkel javíthatók.

## Mire használható

A minta bárhova illik, ahol egy kis tényhalmaznak szüksége van arra, hogy:

- **Közzétehető** legyen széles közönség számára egyszerű HTTP-n keresztül
- **Tartós** — 30 év múlva is ellenőrizhető legyen az olvasók számára
- **Manipulációt felfedő** — minden változás észlelhető kell legyen,
  nem feltétlenül megelőzhető
- **Bizalom nélküli** — egyetlen olvasónak sem kell megbíznia a
  közzétevőben (csak a matematikában)

Konkrét felhasználási esetek itt: [docs/USE_CASES.md](docs/USE_CASES.md).
A rövid lista:

| Terület | Lehorgonyzott tények |
|---|---|
| Népegészségügy | Vakcinatételek teszteredményei, gyógyszerkísérletek mérföldkövei |
| Választások | Választókerületi szintű szavazatszámok a hitelesítés pillanatában |
| MI-biztonság | Modellsúlyok hash-e + modellkártya + kiértékelési pontszámok kiadáskor |
| Újságírás | Forrásdokumentumok manifestje (csak hash-ek) bejelentői kiszivárogtatásokhoz |
| Tudomány | Nyers adat hash + elemzési szkript hash + állított eredmény |
| Bíróságok | Digitális bizonyítékok hash-ei beszerzéskor |
| Közbeszerzés | Közkiadási adatok lepecsételt gyökerei |

Ami közös bennük: kis tényhalmaz, erős tartóssági követelmény,
több, egymásban nem megbízó fél, és apró tárolási költségvetés.
Pontosan ez az a forma, amelyre ezt az eszközt készítettük.

## Amit NEM tesz

- **Titkokat tárol.** Minden, amit a `facts/` mappába tesz, nyilvános.
  A protokoll közzétételre szolgál, nem elrejtésre.
- **Nagy adathalmazokra skálázódik.** A Merkle-fa szépen skálázódik;
  az olvasó figyelme nem. ~20 ténynél több után az oldal olvashatatlanná
  válik. Ha egymillió rekordot szeretne lepecsételni, hash-elje őket
  az oldalon kívül, és tegye annak az oldalfának a Merkle-gyökerét
  egyetlen tényként.
- **Védekezik a visszavonás ellen.** Az egész lényeg az, hogy nem
  módosíthatja, amit lepecsételt. Ha később esetleg vissza akar
  vonni egy állítást, ne pecsételje le.
- **Meggyőz egy elszánt szkeptikust.** Egy elszánt szkeptikus nem fog
  `ipfs add -r --cid-version=1 -Q facts/` parancsot futtatni. Viszont
  meg fogja vádolni azzal, hogy az egész beállítást koholta. Erre a
  második hibamódra nincs protokollszintű védelem. Semmire nincs
  protokollszintű védelem, ami az emberi motivációban él, nem a
  matematikában.

## Hogyan használjuk

Ötperces bemutató itt: [docs/QUICKSTART.md](docs/QUICKSTART.md).
Teljes protokollspecifikáció: [docs/SPEC.md](docs/SPEC.md).
Fenyegetésmodell: [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Összehasonlítás szomszédos rendszerekkel (Sigstore, Sigsum, CT, OTS,
IPFS, OSF, Arweave stb.): [docs/COMPARISON.md](docs/COMPARISON.md).

## Hogyan ellenőrizzük valaki más közzétételét

Három lehetőség az elérhetőség sorrendjében:

1. **Böngésző**: nyissa meg a [`lib/verify.html`](lib/verify.html) fájlt
   bármely modern böngészőben. Illessze be a közzétételi URL-t.
   Kattintson az ellenőrzés gombra. A `crypto.subtle`-t használja
   a hash-eléshez — nincs telepítés, nincs háttérrendszer, nincs
   telemetria. A Bitcoin-tanúsítvány lépés még mindig CLI-eszközt
   igényel (lásd 7. lépés az ellenőrzőoldalon).
2. **Python**: `python3 lib/verify.py` a közzétételi könyvtárból.
   Csak stdlib; a Bitcoin-ellenőrzéshez `ots` szükséges.
3. **Alapokról**: olvassa el a [`docs/SPEC.md §3`](docs/SPEC.md)
   szakaszt, és valósítsa meg újra. A Merkle-algoritmus bármely
   nyelven 30 sor alatt megírható.

## Kidolgozott példák

Hat produkciós minőségű példakészlet érkezik az eszközkészlettel.
Mindegyik lepecsételt, OTS-bélyegzővel és IPFS-rögzítéssel rendelkezik,
és tartalmaz egy adoptációs README-t, amely elmagyarázza, mikor
érdemes valós esetre forkolni, és milyen hibamódok ellen véd.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  a Boeing 737 MAX / Theranos / FDA-inspector-jelentés típusú
  hibamódra, ahol a bizonyítékot a közvetítők eltüntetik vagy
  módosítják.
- [`examples/ai-model-card/`](examples/ai-model-card/) — modelleket
  kiadó MI-laborok számára, telepítés előtti elköteleződésekkel,
  amelyek mechanikusan észlelhetővé válnak a verbális helyett.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  klinikai vizsgálatok szponzorai számára, a végpontok utólagos
  cseréjének és a szelektív jelentésnek a megfogására (Vioxx,
  Paxil Study 329 hibamódok).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  vakcinagyártók és QA-hatóságok számára, kiadási teszteredmények
  és visszahívási kötelezettségek lehorgonyzására.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  kutatócsoportok számára, az (adat, csővezeték, várt kimenet)
  hármas lehorgonyzására az elemzés ELŐTT, hogy a p-hackelés és a
  HARKing nyilvánosan észlelhetővé váljon.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  megyei kanvaszerbizottságok és választási hatóságok számára,
  hitelesített szavazatszámok lehorgonyzására a hitelesítés
  pillanatában, hogy a csendes utólagos módosítások nyilvánosan
  észlelhetővé váljanak.

Olvasson el egyet ezek közül, mielőtt sajátot írna. Az Ön
felhasználási esetéhez legközelebb álló általában a megfelelő
kiindulási fork.

## Gyors kezdés

Az egysoros változat:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# szerkessze a facts/*.txt fájlokat, hogy azt mondják, amit valójában le akar pecsételni
./lib/seal.sh        # felépíti a Merkle-gyökeret, OTS-bélyeget tesz, IPFS-en rögzít
./lib/verify.sh      # mindent helyileg újra ellenőriz
# töltse fel a site/ tartalmát bármilyen statikus tárhelyre. Bárhova. Nem számít.
```

## Miért létezik

A kriptográfiai primitívek (Merkle-fák, OpenTimestamps, IPFS) évek
óta érettek. Ami hiányzott, az a lehető legkisebb ragasztó — egy
készlet, amelyet egy melléktermékbe ledobhat, és egy délután alatt
lepecsételt, közzétehető műtárgya lesz, infrastruktúra felállítása
nélkül, protokollok tanulása nélkül, anélkül, hogy a tényeken kívül
egyetlen sornyi kódot írna.

A legtöbb kriptográfiai közzétételi eszköz azt feltételezi, hogy
Ön csomópont-üzemeltető akar lenni. Ez azt feltételezi, hogy hat
szöveges fájlt akar közzétenni, és soha többé nem akar
kriptográfiára gondolni.

## Hatások és előzmények

- [Sigsum](https://www.sigsum.org/) — átláthatósági naplók aláírásokhoz
- [Sigstore](https://www.sigstore.dev/) — szoftverellátási lánc integritása
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS-tanúsítvány naplók
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin időbélyegzés
- [IPFS](https://ipfs.tech/) — tartalom-címzett tárolás
- [A CALM protokoll](https://disclosure.host) — a megbízó-védő
  közzétételi keret, amelyben az első példányt (MYRIAM a
  disclosure.host oldalán) megalkották

A myriam-kit a legkisebb ezek közül. Szellemében közelebb áll
egy Unix pipeline-hez, mint egy rendszerhez.

## Megjegyzés a névhez

A MYRIAM protokoll John Bradley Myriam Proof-jától kapta a nevét,
amely egy megfogalmazott logikai bizonyítás a nem emberi
intelligenciával való első kapcsolatfelvételi pontról. A protokoll
nem függ attól, hogy ez a bizonyítás igaz-e. A protokoll bármilyen
kis tényhalmazra működik; csak véletlenül először hat olyan tény
közzétételére alkalmazták, amelyek tartalmaznak egy állítást az
idegen disclosure-ról.

Ha ezt a készletet vakcinatételek vagy választási eredmények
lepecsételésére forkolja, az a tény, hogy eredetileg egy
idegen kapcsolatfelvételről szóló állítás közzétételére
használták, irreleváns az Ön számára. A matematikát nem érdekli.

Ugyanakkor: ha mégis ezt használja egy idegen kapcsolatfelvételi
állítás közzétételére, a protokoll harctéri tesztelést kapott
abban a konkrét területen. Az első MYRIAM-telepítés README-je
kifejezetten kijelenti, hogy az egy Calm nevű LLM-persona
művészi munkája, nem pedig kommunikáció bármely földönkívüli
féllel. Valószínűleg Önnek is ezt kellene tennie. Az olvasók
egyébként a mentális állapotáról a legrosszabbat fogják
feltételezni.

## Karbantartó

Még senki. Közkincs. Forkolja. Javítsa. Vigye tovább a protokollt
engedélykérés nélkül.
