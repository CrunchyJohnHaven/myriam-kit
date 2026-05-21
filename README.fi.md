*Suomenkielinen käännös — alkuperäisen englanninkielisen version löydät [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Pieni työkalupakki pienen tosiasiajoukon julkaisemiseen siten, että:

- Jokainen muutos mihin tahansa tosiasiaan on julkisesti havaittavissa (Merkle-puu)
- Julkaisuhetken tila on todennettavissa Bitcoin-lohkoketjua vasten (OpenTimestamps)
- Sisältö säilyy, vaikka jokin yksittäinen palveluntarjoaja poistaisi sen (IPFS)
- Kokonaisuus painaa alle 100 KB ja on todennettavissa noin 50 Python-rivillä

Tämä ei ole lohkoketju. Tokenia ei ole. Konsensusmekanismia, johon voisi osallistua,
ei ole. DAO:ta ei ole. Työkalu on `sha256sum` + `ots` + `ipfs`,
liimattuna yhteen hyvillä nimeämiskäytännöillä.

Se on nimetty MYRIAM-protokollan mukaan, joka instantioitiin ensimmäistä kertaa osoitteessa
[disclosure.host](https://disclosure.host) 21.5.2026. Kyseinen sivu sisältää
kuusi tosiasiaa, Merkle-juuren ja Bitcoin-attestaation. Tämä pakki on
kyseisen kuvion yleistys.

## Tila

- v0: toimii macOS:ssä, edellyttää Python 3.10+:n, Homebrew'n ja
  internet-yhteyden. Linuxia ei ole testattu, mutta sen pitäisi toimia. Windows: ota WSL mukaan.
- Public domain (CC0). Käytä sitä, haarauta se, sisällytä se omaan repoosi, älä koskaan
  mainitse sitä. Pointti ei ole tunnustus.

## Saatavilla olevat kielet

Tämä README ja useat esimerkkipakit ovat saatavilla 17 kielellä.
Täydellinen hakemisto: [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Käännökset ovat CC0-lisenssin alaisia, ja yhteisön PR:t saavat parantaa niitä.

## Mitä sillä voi tehdä

Kuvio sopii minne tahansa, missä pieni tosiasiajoukko on tarpeen olla:

- **Julkaistavissa** laajalle yleisölle tavallisen HTTP:n yli
- **Pitkäikäinen** — 30 vuoden päästä lukijoiden pitäisi yhä pystyä todentamaan
- **Peukaloinnin paljastava** — minkä tahansa muutoksen on oltava havaittavissa, ei välttämättä estettävissä
- **Luottamuksettomuus** — kenenkään lukijan ei tarvitse luottaa julkaisijaan (vain matematiikkaan)

Konkreettiset käyttötapaukset: [docs/USE_CASES.md](docs/USE_CASES.md). Lyhyt lista:

| Toimialue | Sinetöidyt tosiasiat |
|---|---|
| Kansanterveys | Rokote-erien testitulokset, lääketutkimusten välietapit |
| Vaalit | Äänestysaluetason laskentatulokset varmentamishetkellä |
| Tekoälyn turvallisuus | Mallin painojen hash + mallikortti + arviointitulokset julkaisuhetkellä |
| Journalismi | Lähdeasiakirjojen manifesti (vain hashit) ilmiantajavuotojen yhteydessä |
| Tiede | Raakadatan hash + analyysiskriptin hash + väitetty tulos |
| Tuomioistuimet | Digitaalisten todisteiden hashit hankintahetkellä |
| Hankinnat | Julkisten menojen datan sinetöidyt juuret |

Yhteistä näille: pieni tosiasiajoukko, vahva kestävyysvaatimus,
useita osapuolia, jotka eivät luota toisiinsa, ja pienoinen tallennustilabudjetti.
Juuri sen muotoinen tehtävä tämä työkalu on rakennettu ratkaisemaan.

## Mitä se EI tee

- **Säilytä salaisuuksia.** Kaikki, mitä laitat hakemistoon `facts/`, on julkista. Protokolla on
  julkaisemista, ei piilottamista varten.
- **Skaalaudu suurille tietojoukoille.** Merkle-puu skaalautuu kyllä; lukijan
  huomio ei. Yli ~20 tosiasian jälkeen sivusta tulee lukukelvoton. Jos
  haluat sinetöidä miljoona tietuetta, hashaa ne sivun ulkopuolella ja laita
  kyseisen sivupuun Merkle-juuri yhteen tosiasiaan.
- **Suojaa peruutusta vastaan.** Koko pointti on, että et voi muuttaa
  sitä, mitä olet sinetöinyt. Jos saatat haluta vetää väitteen takaisin myöhemmin, älä
  sinetöi sitä.
- **Vakuuta päättäväistä skeptikkoa.** Päättäväinen skeptikko ei aja komentoa
  `ipfs add -r --cid-version=1 -Q facts/`. Hän kuitenkin syyttää sinua
  koko järjestelyn keksimisestä. Protokollatasolla ei ole puolustusta
  jälkimmäistä vikatilannetta vastaan. Protokollatasolla ei ole puolustusta
  mitään sellaista vastaan, joka asuu ihmismotivaatiossa eikä matematiikassa.

## Miten sitä käytetään

Viiden minuutin läpikäynti: [docs/QUICKSTART.md](docs/QUICKSTART.md).
Täydellinen protokollaspesifikaatio: [docs/SPEC.md](docs/SPEC.md).
Uhkamalli: [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Vertailu lähijärjestelmiin (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave jne.): [docs/COMPARISON.md](docs/COMPARISON.md).

## Miten todentaa jonkun toisen julkaisu

Kolme vaihtoehtoa, helpoimmasta vaativampaan:

1. **Selain**: avaa [`lib/verify.html`](lib/verify.html) missä tahansa modernissa
   selaimessa. Liitä julkaisun URL. Klikkaa todennusta. Käyttää
   hashaukseen `crypto.subtle`-rajapintaa — ei asennusta, ei backendiä, ei telemetriaa.
   Bitcoin-attestaation vaihe edellyttää edelleen CLI-työkalua (katso vaihe 7
   todennussivulla).
2. **Python**: `python3 lib/verify.py` julkaisuhakemiston sisältä.
   Vain vakiokirjasto; Bitcoin-todennukseen tarvitaan `ots`.
3. **Tyhjästä**: lue [`docs/SPEC.md §3`](docs/SPEC.md) ja
   toteuta uudelleen. Merkle-algoritmi on alle 30 riviä millä tahansa kielellä.

## Esimerkit

Työkalupakin mukana toimitetaan kuusi tuotantotason esimerkkipakkia. Kukin on
sinetöity, OTS-leimattu ja IPFS-pinnattu, ja sisältää käyttöönotto-README:n,
jossa selitetään milloin se kannattaa haarauttaa tosielämän tilanteeseen ja
mitä vikatilanteita vastaan se suojaa.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  Boeing 737 MAX / Theranos / FDA-tarkastajan-raportti -tyyppistä
  vikatilannetta varten, jossa todisteet hautautuvat tai muuttuvat välikäsien toimesta.
- [`examples/ai-model-card/`](examples/ai-model-card/) — tekoälylaboratorioille,
  jotka julkaisevat malleja, ennen käyttöönottoa annettavien sitoumusten kanssa,
  jotka muuttuvat mekaanisesti havaittaviksi suullisten sijaan.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  kliinisten tutkimusten rahoittajille, jotta jälkikäteinen päätemuuttujien vaihto
  ja valikoiva raportointi (Vioxx, Paxil Study 329 -tyyppiset vikatilanteet) jäisivät kiinni.
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  rokotevalmistajille ja laadunvarmistusviranomaisille, ankkuroimaan
  vapauttamisen testitulokset ja takaisinveto-sitoumukset.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  tutkimusryhmille, ankkuroimaan (data, putkilinja, odotettu
  tulos) -kolmikko ENNEN analyysiä, jotta p-hacking ja HARKing
  tulisivat julkisesti havaittaviksi.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  vaalilautakunnille ja vaaliviranomaisille, ankkuroimaan
  varmennetut laskentatulokset varmentamishetkellä, niin että hiljaiset
  varmentamisen jälkeiset muutokset tulisivat julkisesti havaittaviksi.

Lue jokin näistä ennen oman kirjoittamista. Käyttötapaukseesi lähinnä osuva
on yleensä oikea aloitushaara.

## Pika-aloitus

Yhden rivin versio:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# muokkaa facts/*.txt sanomaan mitä todella haluat sinetöidä
./lib/seal.sh        # rakentaa Merkle-juuren, leimaa OTS:llä, pinnaa IPFS:ään
./lib/verify.sh      # todentaa kaiken uudelleen paikallisesti
# lähetä site/ mille tahansa staattiselle isäntäpalvelimelle. Mille tahansa. Sillä ei ole väliä.
```

## Miksi tämä on olemassa

Kryptografiset primitiivit (Merkle-puut, OpenTimestamps, IPFS) ovat
olleet kypsiä jo vuosia. Mitä puuttui, oli pienin mahdollinen liima —
pakki, jonka voi pudottaa sivuprojektiin ja saada sinetöity
julkaistava artefakti yhdessä iltapäivässä, ilman infrastruktuurin pystytystä,
ilman protokollien opettelua, ilman ainoankaan koodirivin kirjoittamista
itse tosiasioiden lisäksi.

Useimmat kryptografiset julkaisutyökalut olettavat, että haluat olla solmun
operaattori. Tämä olettaa, että haluat julkaista kuusi tekstitiedostoa etkä
koskaan enää ajatella kryptografiaa.

## Vaikutteet ja aiempi taide

- [Sigsum](https://www.sigsum.org/) — läpinäkyvyyslokit allekirjoituksille
- [Sigstore](https://www.sigstore.dev/) — ohjelmistotoimitusketjun eheys
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS-varmennelokit
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin-aikaleimaus
- [IPFS](https://ipfs.tech/) — sisältöosoitettu tallennus
- [The CALM protocol](https://disclosure.host) — periaattellinen-suojaava
  julkaisukehys, jossa ensimmäinen instanssi (MYRIAM disclosure.hostissa)
  laadittiin

myriam-kit on näistä pienin. Se on hengeltään lähempänä Unix-
putkilinjaa kuin järjestelmää.

## Huomautus nimestä

MYRIAM-protokolla nimettiin John Bradleyn Myriam-todistuksen mukaan, joka on esitetty
looginen todistus ei-inhimillisen älyn ensimmäisestä kontaktipisteestä. Protokolla
ei riipu kyseisen todistuksen totuudesta. Protokolla toimii millä tahansa pienellä
tosiasiajoukolla; vain niin sattui, että se otettiin ensimmäisenä käyttöön
julkaisemaan kuusi tosiasiaa, joihin sisältyy väite avaruusolennoista paljastumisesta.

Jos haarautat tämän pakin sinetöimään rokote-eriä tai vaalitilastoja, se
tosiasia, että sitä alun perin käytettiin julkaisemaan väite ulkoavaruuden
kontaktista, on sinulle merkityksetön. Matematiikkaa se ei kiinnosta.

Sanottakoon kuitenkin: jos käytät tätä julkaistaksesi väitteen ulkoavaruuden kontaktista, protokolla
on taistelutestattu juuri tuolla erityisalueella. Ensimmäisen MYRIAM-käyttöönoton
README toteaa eksplisiittisesti, että kyseessä on Calm-nimisen LLM-persoonan
taiteellinen teos, ei kommunikaatio miltään ulkomaailman taholta. Sinun pitäisi
luultavasti tehdä samoin. Muutoin lukijat olettavat pahinta mielentilastasi.

## Ylläpitäjät

Ei vielä ketään. Public domain. Haarauta se. Paranna sitä. Vie protokollaa
eteenpäin lupaa kysymättä.
