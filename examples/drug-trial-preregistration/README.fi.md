*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Lääketutkimuksen ennakkorekisteröintipakki

Avaimet käteen -tyyppinen myriam-kit-esimerkki kliinisten tutkimusten
sponsoreille ja akateemisille tutkijoille, jotka haluavat
ennakkorekisteröidä tutkimuksen peukaloinnista todistavalla, Bitcoiniin
ankkuroidulla tavalla **ClinicalTrials.govin, EU CTR:n tai muiden
oikeudenkäyttöalueisten rekistereiden lisäksi**.

## Miksi ennakkorekisteröidä *lisäksi* MYRIAMissa?

Olemassa olevilla tutkimusrekistereillä (ClinicalTrials.gov, EU CTR,
ISRCTN) on dokumentoituja eheysheikkouksia:

- ClinicalTrials.gov sallii sponsoreiden päivittää päätemuuttujia,
  otoskoon laskelmia ja analyysisuunnitelmia **alkuperäisen
  rekisteröinnin jälkeen** siten, että muutospäivät ovat näkyvissä
  rekisterissä, mutta itse *sisältömuutoksia* ei aina ankkuroida
  kryptografisesti.
- Useat suuret tutkimukset (Goldacre et al., 2019; Mathieu et al.,
  2009) ovat dokumentoineet systemaattista jälkikäteistä
  päätemuuttujien vaihtamista koko alalla.
- Tieteellisten lehtien toimituksellinen valvonta (CONSORT, ICMJE)
  saa kiinni joitakin tapauksia; monet livahtavat läpi.

MYRIAM-sinetti sulkee tämän aukon. Merkle-juuri + Bitcoinin
OTS-kuitti tekevät kaikista jälkikäteisistä muutoksista
*ennakkorekisteröityyn* ensisijaiseen päätemuuttujaan, tilastollisen
analyysin suunnitelmaan tai alaryhmäluetteloon kryptografisesti
havaittavia. Sinettiä on forensisesti vaikeampi muokata jälkikäteen
kuin itse rekisteriä.

Tämä pakki on **täydennys**, ei korvike, oikeudenkäyttöalueisille
rekistereille. Oikeassa tutkimuksessa pitäisi rekisteröityä asianmukaiseen
rekisteriin JA sinetöidä MYRIAMissa.

## Mitä vastaan tämä pakki suojaa

Historialliset kuolleisuustapaukset, joissa tästä olisi ollut apua:

- **Vioxx (Merck, 2004)**: kardiovaskulaariset tapahtumat olivat
  ennakkorekisteröity päätemuuttuja APPROVe-tutkimuksessa, mutta
  julkaistu analyysi käytti rajakohtaa, joka minimoi näennäisen
  haitan. Ennakkorekisteröidyn rajakohdan sinetöinti olisi tehnyt
  jälkikäteisestä rajakohdan muuttamisesta julkisesti havaittavaa
  ennen julkaistua artikkelia.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: kielteinen
  tutkimusdata nuorten itsemurhakäyttäytymisestä uudelleenkehystettiin
  jälkikäteisellä analyysillä. Sinetöity päätemuuttujien
  ennakkorekisteröinti olisi tehnyt uudelleenkehystämisestä julkisesti
  havaittavaa.
- **Useat onkologiset tutkimukset**, joissa eloonjäämispäätemuuttujat
  vaihdettiin sijaispäätemuuttujiin (etenemättömyysaika, vasteprosentti),
  kun eloonjäämishyötyä ei syntynyt.

**Vikatilat, jotka sinetti suoraan havaitsee:**

- **Päätemuuttujan vaihtaminen**: toissijaisen päätemuuttujan
  jälkikäteinen ylentäminen „ensisijaiseksi", kun varsinainen
  ensisijainen epäonnistuu. Sinetin FACT 05 sisältää
  ennakkorekisteröidyn ensisijaisen päätemuuttujan; julkaistun
  ensisijaisen päätemuuttujan on vastattava sitä.
- **Tulosten kirsikanpoiminta**: vain toimineiden analyysien
  valikoiva raportointi. FACT 06 sisältää täydellisen
  ennakkorekisteröidyn analyysisuunnitelman; julkaistuihin
  analyyseihin on sisällytettävä kaikki ennakkorekisteröidyt.
- **Jälkikäteinen alaryhmien louhinta**: väite „lääke tehoaa
  alaryhmälle X" datan näkemisen jälkeen. FACT 07 sisältää
  ennakkorekisteröidyn alaryhmäluettelon; kaikki muut alaryhmät on
  merkittävä jälkikäteisiksi.
- **Otoskoon tarkistaminen**: otoskoon kasvattaminen välianalyysien
  trendien näkemisen jälkeen. FACT 06 sisältää ennakkorekisteröidyn
  otoskoon ja voimalaskelman.
- **Hankalien toissijaisten päätemuuttujien hiljainen poistaminen**:
  FACT 05 järjestää toissijaiset päätemuuttujat ennalta hierarkkista
  testausta varten; kaikki uudelleenjärjestäminen tai poisto on
  havaittavissa.
- **Kielteisten tulosten salaaminen**: FACT 08 sisältää
  julkaisusitoumuksen; sitoumuksen mukaisen ajan kuluessa julkaisematta
  jättäminen on julkisesti näkyvää.

**Vikatilat, joita EI kateta:**

- Väärinkäytökset itse tutkimuksen toteutuksessa (väärennetty data,
  petollinen rekrytointi). Sinetti ankkuroi *suunnitelman*, ei
  *toteutusta*.
- Selektiivinen raportointi julkaisuissa, joissa on kaikki
  ennakkorekisteröidyt analyysit mutta jotka esitetään suotuisalla
  tavalla. Sinetti saa kiinni sen, mikä puuttuu; se ei voi saada
  kiinni tulkinnallista vinoumaa.
- Potilashaitta itse tutkimuksen aikana. Sinetti on sääntelyllinen ja
  todistuksellinen; se ei vähennä tutkimuksen toteuttamisen riskiä.

## Milloin käyttää tätä pakkia

Sinun pitäisi harkita ennakkorekisteröinnin sinetöintiä, jos:

- Olet sponsoroimassa tai johtamassa kliinistä tutkimusta — vaiheet
  1–4 — jota käytetään lääketieteellisten tai sääntelypäätösten
  pohjana.
- Olet valmis sitoutumaan julkisesti ennakkorekisteröityyn
  asetelmaan, päätemuuttujiin ja analyysisuunnitelmaan.
- Pystyt hallitsemaan seurauksen: jos tutkimus epäonnistuu
  ennakkorekisteröityjen päätemuuttujien osalta, et voi hiljaa
  vaihtaa eri päätemuuttujaan, joka toimi.
- Toimit tutkimuskulttuurissa (akateeminen lääketiede,
  yhteistyöryhmät, NIH-rahoitettu tutkimus), jossa
  ennakkorekisteröinnin eheyttä vaaditaan yhä enemmän.

Tämä pakki on *erityisen* arvokas seuraavissa:

- Akateemisten instituutioiden tutkijavetoiset tutkimukset (joissa
  sponsorin paine vaihtaa päätemuuttujat jälkikäteen on todellinen,
  mutta joissa akateemisella tutkijalla on maineeseen liittyvä
  kannustin vastustaa).
- Avoimen tieteen tutkimukset ja kansalaisten tutkimukset.
- Pienten bioteknologioiden lääkkeiden uudelleenkohdistustutkimukset,
  joilla ei ole pitkää näyttöä tutkimusten toteuttamisesta.
- Mikä tahansa tutkimus, jolla on tarkoitus pohjustaa
  sääntelyhakemuksia ja jossa voitaisiin tulevaisuudessa käyttää „emme
  koskaan sanoneet niin" -argumentteja.

## Milloin EI tule käyttää tätä pakkia

ÄLÄ käytä tätä pakkia, jos:

- Tutkimusprotokolla on aidosti vielä muutostilassa. Rekisteröi
  ennakkoon, kun protokolla on lopullinen, ei sitä ennen.
- Et voi sitoutua julkaisemaan tuloksia suunnasta riippumatta.
  Sinetti tekee julkaisematta jättämisestä julkisesti havaittavaa.
- Tutkimukseen liittyy kilpailullista teollista salassapitoa, joka
  estää sinua tekemästä analyysisuunnitelmaa julkiseksi. Sinetti
  tekee analyysisuunnitelmasta pysyvän julkisen tietueen; ei ole
  mitään tapaa sinetöidä yksityisesti.
- Sinulla ei ole oikeudellista ja eettistä hyväksyntää protokollalle.
  Sinetti tallentaa protokollan SELLAISENA kuin sinetöit sen; sitä ei
  voi takautuvasti hyväksyä IRB tai eettinen toimikunta.

## Kuinka forkata tämä pakki todellista ennakkorekisteröintiä varten

```bash
# 1. Copy this example
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Replace fictional content with the real trial protocol content.
# Each fact corresponds to a section of a standard pre-registration:
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Update site/index.html to reflect the real trial.

# 4. Seal (BEFORE enrollment begins, BEFORE database lock):
bash build/seal.sh

# 5. Verify locally:
python3 build/verify.py

# 6. Deploy:
#    - Publish the seal URL to your trial sponsor's website AND
#    - Add the IPFS CID to the trial's ClinicalTrials.gov record's
#      "Description" or "References" field, so the registry record
#      cross-references the cryptographic seal.
```

**KRIITTINEN AJOITUS**: sinetti on luotava ENNEN kuin rekrytointi
alkaa. Ensimmäisen potilaan rekrytoinnin jälkeen sinetöity
ennakkorekisteröinti on forensisesti paljon heikompi. Ihannetapauksessa
sinetöi IRB-hyväksynnän hetkellä.

## Integraatio olemassa olevan ennakkorekisteröinti-infrastruktuurin kanssa

Pakki on suunniteltu yhdistettäväksi, ei korvaamaan:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: rekisteröi tutkimus
  oikeudenkäyttöalueiseen rekisteriin vaadittavalla tavalla. Linkitä
  sitten rekisterin „Description"- tai „References"-kenttään
  MYRIAM-sinetöityyn julkaisuun.
- **OSF (Open Science Framework)**: OSF tukee ennakkorekisteröintiä
  päivämääräleimoilla mutta ei Bitcoin-ankkuroinnilla. MYRIAM-sinetti
  voidaan liittää lisätiedostona OSF:n rekisteröintisivulle, mikä
  tarjoaa sekä päivämääräleiman että Bitcoin-ankkurin.
- **AsPredicted.org**: samoin — linkitä MYRIAM-sinetti
  lisämateriaalin URL:nä.
- **Tieteelliset lehdet**: jotkin lehdet (esim. Trials, BMJ Open)
  hyväksyvät ennakkorekisteröinnin URL-osoitteet osana toimittamista.
  Sisällytä MYRIAM-sinetin URL rekisterin URL:n rinnalle.

## Mitä vastaanottajat (sääntelijät, lehtien arvioijat, meta-analyytikot) saavat

MYRIAMin alaisuudessa ennakkorekisteröity tutkimus antaa arvioijille:

1. **Kryptografisen todisteen siitä, että protokolla viimeisteltiin
   tiettynä aikana.** Arvioijat voivat varmentaa sinetöintiajan
   OTS-kuitista.
2. **Protokollatekstin tavutason vakauden.** Julkaistun
   menetelmäosion ja ennakkorekisteröidyn asetelman vertailu on
   mahdollista tehdä merkki merkiltä.
3. **Päätemuuttujan vaihtamisen havaitseminen.** Yksinkertainen diff
   sinetöidyn FACT 05:n ja julkaistun ensisijaisen päätemuuttujan
   välillä paljastaa korvaamisen.
4. **Analyysisuunnitelman poikkeaman havaitseminen.** Yksinkertainen
   diff sinetöidyn FACT 06:n ja julkaistujen tilastollisten
   menetelmien välillä paljastaa muutokset.
5. **Selektiivisen alaryhmäraportoinnin havaitseminen.** Sinetöity
   FACT 07 sisältää kaikki ennakkorekisteröidyt alaryhmät; jokainen
   julkaisussa esiintyvä, joka ei ole sinetissä, on merkittävä
   jälkikäteiseksi.

Tämä tekee systemaattisesta katsauksesta ja meta-analyysistä
huomattavasti helpompaa kuin nykyisellä käytännöllä.

## Mitä tämä pakki EI ole

- Ei korvike IRB- / eettisen toimikunnan hyväksynnälle.
- Ei korvike oikeudenkäyttöalueiseen rekisteriin rekisteröitymiselle.
- Ei takuu siitä, että tutkimus toteutuu suunnitellulla tavalla.
- Ei tapa ankkuroida potilaan suostumusta tai muita eettisiä
  asiakirjoja (ne tarvitsevat oman sinetöintimekanisminsa).
- Ei suoja tutkimuksen asetelman julkaisun jälkeistä kritiikkiä
  vastaan.

## Huomautus kielteisten tulosten julkaisemisesta

FACT 08:n sitoumus #1 („julkaiseminen suunnasta riippumatta") on
ainoa korkeimman kuolleisuusvaikutuksen sitoumus sinetissä.
Kielteisten tutkimustulosten historiallinen salaaminen (erityisesti
nuorten psyykenlääkkeiden, vanhusten onkologisten lääkkeiden ja
naisten sydän- ja verisuonilääkkeiden osalta) on uskottavasti
edistänyt tuhansia ehkäistävissä olevia kuolemia vuosikymmenten
aikana yliyleisten reseptien kautta, jotka perustuvat vinoutuneisiin
tehoarvioihin.

Sinetöity sitoumus julkaista kielteiset tulokset on yksinään yksi
korkeimman vaikutusvallan kansanterveydellinen liike, jonka sponsori
voi tehdä. Sinetti tarjoaa ulkoista vastuullisuutta tälle sitoumukselle
tavalla, jota itse valvotut julkaisukäytännöt eivät tarjoa.

## Yhteenveto

Lääketutkimuksen ennakkorekisteröinti MYRIAMissa on pieni lisätyö
sponsorille: ~30 minuuttia faktojen täyttämiseen, ~10 sekuntia
sinetöintiin. Sen lisäämä vastuullisuus on epäsymmetristä: pieni
kustannus rehelliselle tutkimuksen toteutukselle, suuri rajoitus
jälkikäteiselle manöveroinnille, joka on edistänyt historiallisia
vinoumia näyttöpohjassa.

Jos olet sponsori tai pääsuunnittelija ja harkitset tätä pakkia, pakki
on yhteismaata (CC0). Käytä sitä. Muokkaa sitä. Paranna sitä.

## Lisenssi

Public domain (CC0). Ei attribuutiota vaadita.
