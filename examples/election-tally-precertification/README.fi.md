*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Vaalitulosten esisertifiointi-sinetöintipakki

Avaimet käteen -mallinen myriam-kit-esimerkki piirikuntien
laskentalautakunnille, osavaltioiden vaaliviranomaisille ja
vaalirehellisyyden tarkkailijoille, jotka haluavat julkaista
Bitcoiniin ankkuroidun, peukaloinnin paljastavan sinetin
laskentatuloksesta sertifiointihetken tarkalla hetkellä.

**Sulkee** [issue #4:n](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Mitä tämä pakki EI tee (lue ensin)

Sinetti on kryptografinen aikaleima siitä, mitä sertifioitiin. Se ei
voi todentaa, oliko sertifioitu oikein. Seuraavat vikatilanteet ovat
**sinetin toimialueen ulkopuolella**:

1. **Äänestyskoneiden kompromettoituminen.** Jos laiteohjelmistoa on
   peukaloitu tai äänisummia laskettu väärin, sinetti ankkuroi
   väärän luvun korkealla eheydellä. Sinetti tarkkailee
   laskentajärjestelmän ulostuloja; sillä ei ole näkyvyyttä itse
   järjestelmään.

2. **Äänestyksen estäminen / rakenteellinen äänioikeuden
   menettäminen.** Äänestyspaikkojen sulkemiset, henkilöllisyystodistus-
   lakien epätasapainot, postiäänestyslippujen hylkäysasteen
   vinoumat ja äänestäjärekisterien karsinnat tapahtuvat ennen
   sertifiointia. Sinetti kirjaa lasketut äänestysliput, ei niitä
   äänestyslippuja, jotka olisi pitänyt laskea.

3. **Vaaleihin liittyvä disinformaatio.** Sinetti ei tuomitse
   ehdokkaiden, median tai alustojen tekemiä väitteitä vaaleista.
   Sinetöityä sertifiointia voidaan lainata disinformaatiokerronnassa
   yhtä helposti kuin sitä vastaan puolustautumisessa. Kryptografiset
   aikaleimat ovat sisältöneutraaleja.

4. **Esisertifiointivaiheen petos äänestyslippujen keräyksen tai
   laskennan aikana.** Äänestyslippujen keräyksen epäsäännönmukaisuudet,
   pudotuslaatikoiden peukaloiminen, valvontaketjun katkeamiset
   laskenta-ikkunan aikana — kaikki tapahtuvat ennen sinetöintihetkeä.
   Sinetti ei voi takautuvasti havaita niitä.

5. **Sertifioivan viranomaisen pakottaminen.** Pakotettu sertifiointi
   tuottaa kryptografisesti pätevän sinetin pakotetusta tuloksesta.
   Sinetti todentaa, että virkamies allekirjoitti, ei sitä, miksi.

6. **Vääriä sertifiointeja, joita ei koskaan myöhemmin korjata.**
   Sinetin arvo riippuu myöhemmästä totuudenetsintäprosessista
   (auditointi, uudelleenlaskenta, oikeudenkäynti), johon sinettiä
   voidaan verrata. Jos sellaista prosessia ei koskaan suoriteta,
   sinetti seisoo ainoana tallenteena ja saattaa kovettaa virheen.

7. **Tilastolliset anomaliat ja kuvioiden tunnistus.** Sinetti ei
   merkitse epätodennäköisiä marginaaleja, maantieteellisiä
   anomalioita tai Benfordin lain poikkeamia. Nämä ovat analyyttisia
   tehtäviä sinetöidylle datalle, eivät sinetin ominaisuuksia.

8. **Alemman tason vaalit, joissa on ohuet auditointiketjut.**
   Pienemmillä vaaleilla on heikommat uudelleenlaskennan laukaisimet;
   yksi sinetti ei voi merkityksellisesti kattaa kaikkia
   äänestyslipun vaaleja ilman vaalikohtaista rajausta.

**Yllä oleva rehellisten rajojen osio on tämän pakin kantava osa.**
Virkamiehet, jotka uskovat sinetöinnin tarkoittavan oikeutusta,
käyttävät sitä kilpenä. Pakin on sanottava selvästi: tämä on
*sertifiointihetken kiistämättömyysprimitiivi*, ei todistus vaalien
oikeellisuudesta.

---

## Mitä tämän pakin TÄYTYY KIELTÄYTYÄ sinetöimästä

Pakki on konfiguroitu hylkäämään seuraavat tosiasiakuvio-mallit, vaikka
voimassaolevat allekirjoitusoikeudet omaava käyttäjä lähettäisi ne:

- **Yksittäisen äänestäjän tunnistaminen.** Mikään tosiasia ei saa
  nimetä äänestäjää, yhdistää äänestyslippua äänestäjään tai
  paljastaa mitään kenttää, joka voisi tunnistaa henkilön
  uudelleen.
- **Allekirjoituksen täsmäytyspäätökset per äänestyslippu.**
  Henkilötietoja sisältäviä; sinetöinti luo pysyviä tallenteita
  päätöksistä, joita voidaan myöhemmin riitauttaa.
- **Jokainen tosiasia, jonka julkaiseminen tunnistaisi
  haavoittuvan äänestäjän.** Sisältää äänestysaluetason
  tulokset niin pienillä alueilla, että äänivalinta on
  pääteltävissä (yleensä <50 äänestyslippua).
- **Sinetöity laskenta ennen kuin kaikki äänestysliput on
  laskettu.** Pakki kieltäytyy osittaisista lasketuista, joita
  esitellään "laskentana". Esisertifiointi tarkoittaa *kaikki
  äänestysliput laskettu, ennen virallista sertifiointia* — ei
  *laskennan aikana*.
- **Tilapäiset tai ehdolliset sertifioinnit.** Sinetin on
  heijastettava tosiasiaa, ei ehtoa.
- **Lasketut, jotka sulkevat pois vireillä olevia
  oikeudenkäyntikohortteja** ilman nimenomaista sinetöityä
  saatekohdan tosiasiaa, joka paljastaa poissulkemisen.
- **Sinetöinti muun kuin sertifioivan viranomaisen toimesta** kyseiselle
  lainkäyttöalueelle.

Kieltäytyminen itsessään voidaan sinetöidä tosiasiana ("Tämä
viranomainen pyysi X:n sinetöimistä; pakki kieltäytyi
kieltäytymissäännön Y mukaisesti") luoden julkisen tallenteen
yrityksestä väärinkäyttää pakkia.

---

## Mitä tämä pakki SINETÖI

8 tosiasiaa sertifiointihetkellä:

1. **Esimerkkihuomautus** — ilmoittaa julkaisun esimerkiksi (oikeat
   attestoinnit poistavat tai korvaavat tämän).
2. **Lainkäyttöalueen tunnistaminen** — piirikunta, vaalipäivä,
   sertifioiva viranomainen, sertifioivat virkamiehet nimineen +
   roolineen.
3. **Sertifioitu laskenta** — äänisummat per vaali per ehdokas +
   yli-/aliäänet + nimikirjoitukset.
4. **Äänestyslippujen kirjanpito ja täsmäytys** — yhteensä annetut,
   yhteensä laskettu, yhteensä hylätty kategorian mukaan,
   tila-erittely, rekisteröityjen äänestäjien jakaja.
5. **Laitteisto- ja auditointijälki-manifesti** — laskimen malli +
   laiteohjelmiston hash, CVR-tiedoston hash, äänestyslippukuva-
   arkiston hash, valvontalokin hash, allekirjoituksen
   täsmäytyskäytännön hash.
6. **Kynnysarvot ja laukaisimet sertifioinnissa** — voimassa oleva
   allekirjoituksen täsmäytyskynnys, uudelleenlaskennan
   laukaisukynnykset, todelliset marginaalit per vaali, RLA-siemen-
   sitoumus.
7. **Saatekohdan paljastukset ja kieltäytymistallenne** —
   vireillä olevat oikeudenkäynnit, jälkilaskennan tarkasteltavana
   olevat anomaliat, poissuljetut kohortit, eriävät lautakunnan
   jäsenet; nimenomainen lista kuvioista, joita pakki kieltäytyi
   sinetöimästä.
8. **Allekirjoittava päämies** — laskentalautakunnan tunnistaminen +
   jokaisen allekirjoittajan nimi ja puolue + kryptografiset
   avaintiedot.

Jokainen tosiasia päättyy kieltäytymisportti-konventioon:
*"Tämä tosiasia väittää vain X:n. Se ei väitä Y:tä"* (jossa Y on
lähin vikatilanne yllä olevasta "EI TEE" -osiosta).

---

## Mitä tämä pakki suojaa

- **Hiljainen sertifioinnin jälkeinen äänisummien revisio** — mikä
  tahansa kokonaislukumuutos FACT 03:een tuottaa eri SHA-256:n,
  eri Merkle-juuren, epäonnistuu OTS-todennuksessa.
- **"Löydetyt äänestysliput" hiljaisesti imeyttyvät** — FACT 04:n
  täsmäytysaritmetiikka on lukittu sertifioinnissa.
- **Laiteohjelmistojen vaihtoväitteet** — FACT 05 jäädyttää
  laitteistomanifestin sertifioinnissa.
- **Auditointiartefaktien vaihto sertifioinnin jälkeen** —
  FACT 05:n hash-manifesti saa kiinni jokaisen sertifioinnin
  jälkeisen muutoksen CVR:ään, äänestyslippukuviin, valvontalokeihin
  tai allekirjoituksen täsmäytyskäytäntöön.
- **Kynnysten ja laukaisimien uudelleenmäärittely** — FACT 06
  jäädyttää sertifioinnissa voimassa olleet säännöt
  (allekirjoituksen täsmäytyskynnys, uudelleenlaskennan
  laukaisimet, RLA-riskirajan).

## Historialliset tai lähes-historialliset tapaukset, joissa pakki
   olisi auttanut

Pakki olisi tuottanut hyödyllisen ankkurin — *ei korjausta* —
tapauksissa, jotka liittyvät:

- **Antrim County, Michigan (2020).** Alkuperäiset epäviralliset
  tulokset osoittivat ehdokas-vaihtoa, joka korjattiin myöhemmin
  vastakkaiseen lopputulokseen. Korjaustyötä edeltänyt sinetti
  olisi tarjonnut julkisen viitteen sille, mitä alkuperäinen
  ilmoitus sanoi vastoin sitä, mitä korjaus sanoi, molemmat
  kryptografisesti attestoituina.
- **Maricopa County, Arizona (2020–2022).** Useita iteraatioita
  uudelleen lasketuista/uudelleen tarkastetuista summista kiersi.
  Sertifiointihetken sinetti olisi tarjonnut yksiselitteisen
  viitepisteen, jota vasten jokaista myöhempää laskentaa olisi
  voitu verrata.
- **Florida 2000 (Bush v. Gore canvass).** Piirikuntakohtaiset
  sertifioidut summat siirtyivät uudelleenlaskentapaineen alla;
  per-piirikuntainen uudelleenlaskentaa edeltänyt sinetti olisi
  säilyttänyt sen, mitä kukin piirikunta sertifioi ennen kuin
  manuaaliset uudelleenlaskentamenettelyt alkoivat.
- **Erilaiset ulkomaiset vaalit, joissa on dokumentoituja
  sertifioinnin jälkeisiä "korjauksia".** Lainkäyttöalue-
  agnostinen.

Pakki EI olisi ratkaissut taustalla olevia kiistoja
konevarmuudesta vuonna 2020, postiäänestyspolitiikan kiistoja tai
mitään vaaleja, joissa ydinkysymys oli kiistanalainen tosiasia
eikä kiistanalainen tallenne.

## Milloin käyttää tätä pakkia

- Lainkäyttöalueellasi on vakaa, auditoitu sertifiointiprosessi ja
  haluat lisätä muuttumattoman julkisen ankkurin.
- Odotat sertifioinnin jälkeistä tarkastelua ja haluat peukaloinnin
  paljastavan viitepisteen.
- Sinulla on laillinen valta julkaista lueteltu tosiasiakokonaisuus
  paljastamatta henkilötietoja.
- Sinulla on rinnakkainen auditointi tai RLA-prosessi, jotta
  sinettiä voidaan verrata totuudenetsintätulokseen.

## Milloin EI käyttää tätä pakkia

- **Älä käytä korvikkeena riskiä rajoittaville auditoinneille,
  käsin uudelleenlaskennoille tai vaalien jälkeisille auditoinneille.**
  Tämä pakki on *additiivinen*, ei korvaava.
- **Älä käytä, jos sertifioiva virkamies ei ole varsinainen
  päätöksentekijä** (luo valheellisen attribuution).
- **Älä käytä laskennan keskellä.** Pakki on erityisesti
  sertifiointihetkelle. Osittaisen laskennan sinetit luovat
  harhaanjohtavia viitepisteitä.
- **Älä käytä väittämään, että vaalit olivat oikeudenmukaiset,
  tarkat tai oikeutetut** — se ei voi sitä tehdä.
- **Älä käytä paineen alla sinetöimään aiemmin kuin
  sertifiointihetkellä, tai jättämään pois saatekohdan tosiasian
  paljastusta.** Kieltäydy ja sinetöi kieltäytyminen.
- **Älä käytä oikeutusteatterina.** Petollisen laskentatuloksen
  sinetti on pysyvä julkinen tallenne petoksesta, ei sen puolustus.
  Primitiivi leikkaa molempiin suuntiin; se on sen rehellisyys.

## Miten haarauttaa tämä pakki todellista sertifiointia varten

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # korvaa fiktiivinen sisältö oikealla
bash build/seal.sh     # sinetöi VIRALLISESSA sertifiointiallekirjoituksessa tai sen jälkeen
python3 build/verify.py
```

**Kriittinen ajoitus:** sinetöi sertifiointihetkellä, EI ennen.
Sinetti ennen virallista sertifiointia luo väärän positiivisen
"tämä on virallinen tulos" -tallenteen. Sinetti jälkeenpäin on
tavanomainen kiistämättömyys.

## Integraatio olemassa olevaan vaali-infrastruktuuriin

- **Osavaltioiden vaalilautakunnat / EAC-sertifiointi.** Pakki
  julkaisee virallisen sertifiointiasiakirjan ohella. Se ei korvaa
  lakisääteistä sertifiointia.
- **Riskiä rajoittavat auditoinnit.** FACT 05:n CVR-hash on sama
  hash, jota RLA-työkalu kuluttaa. Sinetti sitoo auditoidun CVR:n
  sertifioituun summaan.
- **Uudelleenlaskentamenettelyt.** Osavaltion lain mukaan
  laukaistu uudelleenlaskenta tuottaa UUDEN sinetöidyn
  tosiasiajoukon (eri aikaleima, eri hashit, sama lainkäyttöalue).
  Molemmat sinetit ovat olemassa rinnakkain; kumpikaan ei kirjoita
  toista yli. Sinettien välinen erotus on julkinen tallenne siitä,
  mitä uudelleenlaskenta muutti.
- **Election Markup Language (EML) ja Common Data Format (CDF).**
  Tosiasiarunkojen tulee olla johdettavissa lainkäyttöalueen
  olemassa olevista EML/CDF-tulosteista, jotta pakki pysyy
  tietoformaatti-agnostisena.
- **Kahden puolueen laskentalautakunnan allekirjoitus.** Moni-
  allekirjoitusvariantti suositellaan lainkäyttöalueille, joissa
  on puolueittain tasapainotettu laskentalautakunta.

## Mitä tämä pakki EI korvaa

- Lakisääteistä sertifiointia osavaltion vaalilain mukaisesti
- EAC-sertifiointi äänestysjärjestelmästä
- Riskiä rajoittavia auditointeja / käsin uudelleenlaskentoja
- Uudelleenlaskentamenettelyjä ja vaalien jälkeisiä auditointeja
- Tuomioistuimen määräyksiä tai vaalien riitautusoikeudenkäyntejä

## Miksi tämä pakki on olemassa v0.3.0+ -versiossa

Tämä on 6. myriam-kitin mukana toimitettu työstetty esimerkki. Pakki
tuotettiin Karpathy-tyylisellä autoresearch-prosessilla, joka on
dokumentoitu tiedostossa `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`.
Kolme kehotevariantti (imitaatio / ensimmäiset periaatteet /
ensisijainen rajoite) tuotti rinnakkaisia pakkihahmotelmia;
ensisijainen rajoite -variantti sai korkeimman pistemäärän
painotetussa arviointimatriisissa, ja lopullinen pakki syntetisoi
sen rakenteen imitaatiovariantin yhtenäisyyden ja ensimmäiset
periaatteet -variantin operatiivisen yksityiskohdan kanssa.

Itse autoresearch on dokumentoitu kehotekuviona tiedostossa
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` tulevaa käyttöä varten.

## Lisenssi

Public domain (CC0). Haarauta se. Mainintaa ei tarvita.
