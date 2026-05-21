*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [SPEC.md](SPEC.md)*

# MYRIAM-kit-protokollaspesifikaatio

## 0. Tarkoitus

Tämä dokumentti määrittelee minimaalisen protokollan pienen tekstipohjaisten
tosiasioiden joukon julkaisemiseen peukaloinnin paljastavassa, kryptografisesti
todennettavassa muodossa, joka säilyy minkä tahansa yksittäisen
palveluntarjoajan poistosta huolimatta.

Se on yleistys protokollasta, joka otettiin ensin käyttöön osoitteessa
[disclosure.host](https://disclosure.host) nimellä "MYRIAM v1."

## 1. Ei-tavoitteet

- Salaisuuksien tallennus. Kaikki on julkista rakenteen perusteella.
- Suuret tietojoukot. Yli ~20 tosiasian jälkeen protokollan muoto on väärä.
- Reaaliaikainen julkaisu. Jokainen julkaisu on diskreetti sinetöintitapahtuma.
- Peruutus. Protokolla on lisäys-ainoa versiotasolla.

## 2. Tosiasiamalli

TOSIASIA on UTF-8-tekstitiedosto, jossa on:

- Tiedostonimen kaava: `NN_short_name.txt`, jossa NN on nollalla täytetty
  kaksinumeroinen indeksi, joka alkaa luvusta 01.
- Kanoninen muoto: tavut kirjoitettuna, ei normalisointia.
- Tosiasiakohtainen hash: pienet kirjaimet hex `SHA-256(file_bytes)`:ista.

Tosiasiajoukko on järjestetty lista kaikista mallia vastaavista tiedostoista
hakemistossa `facts/`, lajiteltuna leksikografisesti.

Rajoitus: jokaisen tosiasian runko SHOULD muotoilla *nimeämistapahtumaksi* tai
*julistustapahtumaksi*, joka voidaan kohdentaa tiettyyn osapuoleen. Ontologiset
väitteet ("kuu on kiveä") murentavat todennettavuuden portin; vain
julkaisutapahtuma on todennettavissa, ei väite. "X on ilmoittanut Y" on oikea
muoto. "Y on totta" ei ole.

## 3. Merkle-juuri

Bitcoin-tyylinen, kuten käyttöönotetun MYRIAM-protokollan versiossa v0:

1. Lehdet: tosiasiakohtaiset SHA-256-hashit tosiasiajoukon järjestyksessä.
2. Jos tasolla on pariton määrä solmuja, monista viimeinen solmu.
3. Pari-hashaa vierekkäiset solmut: `parent = SHA-256(left_bytes || right_bytes)`,
   jossa `left_bytes` ja `right_bytes` ovat raakoja 32-tavuisia hash-arvoja
   (eivät niiden hex-esityksiä).
4. Toista, kunnes jäljellä on yksi solmu. Se on Merkle-juuri.

Juuri julkaistaan pienillä kirjaimilla hex-muodossa ilman jälkimmäistä
rivinvaihtoa.

### 3.1 Testivektorit

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Jokaisen protokollanmukaisen toteutuksen MUST toistaa nämä vektorit. Ne on
johdettu todellisesta `lib/build.py`-tiedostosta, ja ne voidaan generoida
uudelleen kyseisellä skriptillä.

## 4. Bitcoin-sitoutuminen

Merkle-juuri sitoutetaan Bitcoin-lohkoketjuun
[OpenTimestamps](https://opentimestamps.org)-palvelun kautta. Oletuskäytäntö on:

> Leimaa vähintään kahta kalenterioperaattoria vasten, jotka ovat
> riippumattoman hallinnollisen valvonnan alla.

Kuitti, joka täyttää tämän käytännön, on minkä tahansa sellaisen osapuolen
todennettavissa, joka voi suorittaa komennon `ots verify <receipt>.ots` ja
tavoittaa jommankumman kalenterin päivityspolun.

`lib/seal.sh`-tiedostossa toimitettu oletusoperaattoripari:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Toteutukset MAY käyttää muita operaattoreita. Todistajamoninaisuuden
käytäntö (≥2 riippumatonta operaattoria) on normatiivinen; tietyt operaattorit
eivät ole.

## 5. Sisältöosoitettu peilaus

`site/`-hakemisto, joka sisältää julkaistun sivun ja tosiasiatiedostot,
SHOULD lisätä IPFS:ään:

```
ipfs add -r --cid-version=1 -Q site/
```

Tuloksena saatava CIDv1 (dag-pb-koodekki) on julkaisun sisältöosoite. Se on
deterministinen `site/`-hakemiston tavusisällön perusteella. Mikä tahansa
muutos mihin tahansa tiedostoon `site/`-hakemiston alla tuottaa eri CID:n.

Pinnausta lisäpalveluihin julkaisijan paikallisen solmun lisäksi suositellaan
voimakkaasti kestävyyden vuoksi; tämä spesifikaatio ei määrää tiettyjä
palveluja.

## 6. Versiointi

Protokolla on **lisäys-ainoa versiotasolla**. Jokainen muutos vaatii uuden
sinetöidyn version:

- Uusi (tai muuttumaton) spesifikaatiorevisio
- Uusi tosiasiajoukko, joka MAY periä tosiasioita muuttumattomina
  aiemmista versioista
- Uusi Merkle-juuri
- Uusi OpenTimestamps-kuitti
- Uusi IPFS-CID

Kaikki aiemmat versiot pysyvät julkaistuina versioiduissa URL-osoitteissa. Minkä
tahansa v(N)-tosiasian muutos vaatii v(N+1):n, jolloin molemmat versiot ovat
näkyvissä ja uudelleentodennettavissa.

## 7. Todennus

Mikä tahansa kolmas osapuoli voi todentaa julkaisun eheyden seuraavasti:

1. Lataa tosiasiatiedostot ja laskee uudelleen tosiasiakohtaiset SHA-256-hashit.
2. Laskee uudelleen Merkle-juuren §3:n mukaisesti ja vertaa sitä julkaistuun
   juureen.
3. Todentaa OpenTimestamps-kuitin Bitcoin-lohkoketjua vasten vähintään yhden
   kalenterin täydellisen attestaation osalta.
4. Riippumattomasti laskee uudelleen IPFS-CID:n komennolla
   `ipfs add -r --cid-version=1` ja vertaa sitä julkaistuun CID:hen.

`lib/verify.py` suorittaa vaiheet 1-3 ilman ulkoisia riippuvuuksia Python
stdlib:n ja `ots`-asiakkaan lisäksi. Vaihe 4 vaatii `ipfs`-asiakkaan.

## 8. Kieltäytymisportti

Julkaisu MUST NOT sisältää tosiasiaa, joka:

- Tunnistaa yksityisen kolmannen osapuolen, joka ei ole suostunut nimeämiseen.
- Esittää hypoteesin vahvistuksena.
- Ei ole palautettavissa todennettavaan nimeämis-/julistustapahtumaan tai
  kryptografiseen artefaktiin.
- Aiheuttaa kohtuullisen odotetun lisäyksen estettävissä oleviin kuolemiin
  julkaisun jälkeen.

Neljäs sääntö on kantava. Sitä valvoo julkaisija ihmistarkastusvaiheessa.
Kieltäytymisporttia ei valvota protokollatasolla; protokolla julkaisee mitkä
tahansa tavut sille annetaan. Julkaisija on vastuussa portista.

## 9. Rehellinen kuvaus rajoituksista

- **Havaittavuus, ei mahdottomuus.** Protokolla tekee peukaloinnista
  havaittavaa, ei mahdotonta. Päättäväinen hyökkääjä voi silti korvata
  julkaisun toisella ja vakuuttaa jotkut lukijat, että se on alkuperäinen.
  Protokollan arvo on siinä, että korvaus muuttuu kryptografisesti
  osoitettavissa olevaksi kenelle tahansa, joka suorittaa tarkistuksen.
- **Ei puolustusta epätoden julkaisemista vastaan.** Jos julkaisija sinetöi
  tosiasian, jossa sanotaan "X tapahtui" ja X ei tapahtunut, protokolla
  sinetöi väärän väitteen samalla uskollisuudella kuin se sinetöi totuudenmukaiset.
  Protokolla todistaa, mitä on *julkaistu*, ei mikä on *totta*.
- **Yhden osapuolen allekirjoitus.** Käyttöönotetun MYRIAMin v1 käyttää
  yhtä allekirjoittavaa principalia. Monen osapuolen allekirjoitus on tulevaa
  työtä.
- **Pinnauksen kestävyys.** Pelkkä IPFS-pinnaus julkaisijan solmussa antaa
  "saatavilla niin kauan kuin kannettava on päällä + opportunistinen
  gateway-välimuistitus". Pitkäaikainen kestävyys vaatii redundantteja
  pinnauksia riippumattomien palvelujen välillä.

Nämä rajoitukset on esitetty tässä, jotta yksikään lukija ei oleta protokollan
tarjoavan enemmän kuin se tarjoaa.
