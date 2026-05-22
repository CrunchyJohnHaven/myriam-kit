*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Toimitusketjun auditointiattestaation sinetöintipakki

Avaimet käteen -mallinen myriam-kit-esimerkki kolmannen osapuolen
sosiaali-/työ-/ympäristöauditoijille, sisäisille toimittajien
sääntöjenmukaisuustiimeille, NGO-toimitusketjututkijoille ja
työntekijöiden oikeuksien järjestöille, jotka haluavat julkaista
Bitcoiniin ankkuroidun, peukaloinnin paljastavan sinetin
auditointiraportista sen allekirjoituksen tarkalla hetkellä.

---

## Mitä tämä pakki EI tee (lue ensin)

Sinetti on kryptografinen aikaleima siitä, mitä auditoija
allekirjoitti. Se ei voi todentaa, onko allekirjoitettu **totta**.
Seuraavat vikatilanteet ovat **sinetin toimialueen ulkopuolella**:

1. **Toimialan kaappaama auditointi.** Brändin toimeksiantamilla
   auditeilla on pitkä, dokumentoitu historia siitä, että ne
   tuottavat pehmeitä havaintoja toimittajista, joiden jatkuva
   liiketoiminta toimeksiantavan brändin kanssa pitää
   auditointiputken virtaamassa. Kaapattu auditointi, kun se on
   sinetöity, tuottaa pysyvän forensisen tietueen kaapatusta
   auditoinnista. Sinetti ei korjaa kaappausta — se vain tekee
   auditoinnin-sellaisena-kuin-se-on-julkaistu muuttumattomaksi,
   jotta myöhemmällä totuudenetsintäprosessilla on jotakin konkreettista
   verrattavaa.

2. **Valmennetut työntekijät / valmistellut tuotantolaitokset.**
   Ilmoitetut tai puoliksi ilmoitetut auditit antavat johdolle
   päiviä tai viikkoja aikaa harjoitella työntekijöiden vastauksia,
   piilottaa alaikäisiä työntekijöitä, siivota asuntoloita, poistaa
   sääntöjenvastaisia laitteita ja ohjata työtä auditoimattomille
   alihankkijoille auditoinnin aikana. Sinetti ankkuroi sen, mitä
   auditoijille näytettiin, ei sitä, mitä heitä estettiin
   näkemästä.

3. **Piilotetut alihankinnat.** Tier 2- ja Tier 3-alihankinnat,
   kotityö ja epävirallinen sektori-tuotanto ovat laajalti
   näkymättömiä tehtaan tason auditeille. Sinetti ankkuroi
   Tier 1-auditin; se ei voi havaita, että Tier 1 ulkoistaa
   auditoimattomalle Tier 2:lle auditoinnin aikana tai
   rutiininomaisesti.

4. **Auditit, jotka järjestelmällisesti ohittavat
   väärinkäytökset, joita ne kohdistavat.** Rana Plaza, vuoden 2013
   Bangladeshin vaatetehtaan romahdus, joka tappoi 1 134 työntekijää,
   oli auditoitu useiden brändin toimeksiantamien auditointiohjelmien
   toimesta sitä edeltäneinä kuukausina. Halkeamat rakennuksessa
   eivät olleet sosiaalisen auditoinnin tarkistuslistalla;
   auditointijärjestelmällä ei ollut rakennusinsinöörin laajuutta.
   Auditit ankkuroivat sen, mitä on *laajuudessa*; laajuuden
   ulkopuolella olevat väärinkäytökset pysyvät näkymättöminä
   riippumatta siitä, kuinka peukaloinnin paljastava sinetti on.

5. **Allekirjoituksen jälkeiset kostotoimet työntekijöitä vastaan,
   jotka osallistuivat haastatteluihin.** Vaikka paikannustietoja
   kieltäydyttäisiin (TOSIASIA 07 R3), määrätietoinen vastustaja,
   joka tietää toimittajan tunnuksen, voi tunnistaa tuotantolaitoksen.
   Työntekijöiden suojelu vaatii enemmän kuin pelkkä
   henkilötietojen kieltäminen sinetissä — se vaatii anonymisoinnin
   auditointimenetelmän edellä. Sinetti tekee auditoinnin-sellaisena-
   kuin-se-on-julkaistu kestäväksi; se ei suojaa haastateltavia
   takautuvasti.

6. **Työntekijän olosuhteet, jotka ovat laillisia mutta epäinhimillisiä.**
   Elämiseen riittävän palkan kuilut lainkäyttöalueilla, joilla
   laillinen vähimmäispalkka on alhaisempi kuin elämiseen riittävän
   palkan vertailuarvo, tuottavat "sääntöjenmukaisia" auditointi-
   havaintoja palkka- ja työaikalakeja vastaan ja "ei-sääntöjenmukaisia"
   havaintoja elämiseen riittävän palkan standardeja vastaan samassa
   auditoinnissa (tämän esimerkkipakin TOSIASIA 03 elementti 8).
   Sinetti ankkuroi sen, mitä kukin standardi raportoi; niiden
   yhteensovittaminen on alavirran politiikan tekemistä.

7. **Ilmasto-/ympäristöhaitat, joilla on hajaantunut syy-yhteys.**
   Hiilipäästöt, panokset metsähävitykseen, vesivarojen kuluminen
   ja saastekiintymät toimittajilta voidaan sinetöidä
   auditointihavaintoihin, mutta kausaalinen
   syy-yhteys tietyn brändin tilausvolyymeihin on metodologisesti
   kiistanalainen. Sinetti ankkuroi sen, mitä toimittajalta
   mitattiin; se ei jaa moraalista tai oikeudellista vastuuta.

8. **Riitoja siitä, mikä standardi on auktoritatiivinen.** SA8000
   vs. BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs.
   yrityskohtainen käytännesäännöstö: jokaisella on erilaiset
   laajuudet, vakavuudet ja korjausprosessit. Sinetti ankkuroi
   *yhden* auditin *yhdellä* standardilla. Standardien välinen
   vertailu on alavirran ongelma.

9. **Auditoijan pätevyys vs. auditoijan tutkintotodistus.**
   "Tutkintotodistuksen omaava" ei ole "pätevä". Auditoijat, jotka
   ovat suorittaneet akkreditoidut koulutusohjelmat, ovat ohittaneet
   vakavia väärinkäytöksiä auditoinneissa, jotka edelsivät
   julkisesti näkyviä katastrofeja. Sinetti ankkuroi
   tutkintotodistukset; se ei sertifioi pätevyyttä, jolla niitä on
   käytetty.

**Yllä oleva rehellisten rajojen osio on tämän pakin kantava osa.**
Brändi, joka haluaa oikeutusteatteria, käyttää sinetöityä auditointia
kilpenä. Pakin on sanottava selvästi: tämä on
*auditointiraportin allekirjoitushetken kiistämättömyysprimitiivi*,
ei todiste toimittajan sääntöjenmukaisuudesta tai työntekijöiden
hyvinvoinnista.

---

## Mitä tämän pakin TÄYTYY KIELTÄYTYÄ sinetöimästä

Pakki on konfiguroitu hylkäämään seuraavat tosiasiakuviot, vaikka
voimassa olevat auditointielimen valtuudet omaava käyttäjä
lähettäisi ne:

- **Yksittäisen työntekijän tunnistaminen.** Mikään tosiasia ei saa
  nimetä työntekijää, yhdistää lainausta työntekijään, paljastaa
  henkilökortin numeroa, linjan sijaintia, asuntolan huonetta,
  vuorojärjestelyä, demografista yhdistelmää, jossa N<5, tai mitään
  kenttää, joka voisi uudelleentunnistaa haastatteluihin osallistuneen
  henkilön. Työntekijöiden lainaukset käyttävät satunnaisia
  tunnisteita; vastaavuus ei koskaan sinetöidä.
- **Ilmiantajan/tiedonantajan lähteet.** Jos havainto perustuu
  paljastukseen yksilöltä, joka otti riskin paljastaakseen, yksilöä
  ei koskaan nimetä tai tunnisteta sinetöidyssä julkaisussa.
- **Tarkka paikkatieto.** Ei katuosoitetta, GPS:ää, satelliittikuvaa
  yli 1 km:n resoluutiolla tai ulkoisia rakennuksen valokuvia. Maa
  ja alue ovat sinetin maksimaalinen resoluutio. Perustelu:
  tuotantolaitoksen tunnistaminen mahdollistaa kostotoimet
  haastateltuja vastaan.
- **Puhdas-auditointi-sertifiointiväitteet.** Pakki kieltäytyy
  sinetöimästä mitään muotoa "tämä auditointi todistaa, että
  toimittaja noudattaa sääntöjä" tai "rikkomuksia ei ole".
  Puhdasväitteet ovat epistemisesti tukemattomia
  auditointimenetelmällisesti.
- **Sinetti-todistus-korvaaminen.** Julkaisu, joka jättää pois
  menetelmän (TOSIASIA 04), riippumattomuuden (TOSIASIA 06) tai
  kieltäytymiset (TOSIASIA 07), ei ole laillinen MYRIAM-julkaisu
  tämän pakin alla.
- **Luonnos- / allekirjoitusta edeltävät auditit.** Sinetöinti
  tapahtuu allekirjoituksessa, ei ennen. Väliaikaiset auditit
  luovat väärää varmuutta.
- **Jälkikäteinen suotuisa uudelleensinetöinti.** Tarkistettu
  auditointi vaatii UUDEN sinetöidyn julkaisun, joka viittaa
  alkuperäiseen Merkle-juurellaan. Alkuperäinen sinetöity auditointi
  pysyy pysyvästi näkyvänä auditointina-sellaisena-kuin-se-on-julkaistu.
- **Sinetöinti minkä tahansa muun osapuolen kuin auditointielimen
  toimesta.** Brändi, toimittaja, sertifiointielin tai kolmas
  osapuoli ei voi sinetöidä "auditointia" auditointielimen sijasta,
  joka allekirjoitti raportin.

Kieltäytyminen voidaan itsessään sinetöidä tosiasiana ("Tämä
osapuoli pyysi sinetöimään X:n; pakki kieltäytyi
kieltäytymissäännön Y mukaisesti"), mikä luo julkisen tietueen
yritetystä väärinkäytöstä. **Toimialalla, jossa auditoinnin
kaappaaminen on laajalle levinnyttä, kieltäytyminen-sinetöimästä voi
itsessään olla merkityksellinen signaali:** auditointielimellä, joka
ei sinetöi, koska brändi painosti havaintojen pehmentämistä, on
mahdollisuus julkisesti kirjata kieltäytyminen omalla päämiehellään.

---

## Mitä tämä pakki TODELLA sinetöi

8 tosiasiaa auditoinnin allekirjoituksen hetkellä:

1. **Esimerkki-ilmoitus** — ilmoittaa julkaisun esimerkiksi (oikeat
   attestaatiot poistavat tai korvaavat tämän).
2. **Auditoinnin laajuus ja kohde** — auditointistandardi,
   auditointielin, johtava auditoija, auditointitiimin koko,
   toimittajan tunnus (ei tarkkaa paikkatietoa), auditointi-ikkuna,
   ilmoituksen tyyppi (ilmoitettu / puoliksi ilmoitettu /
   ilmoittamaton), auditointiraportin päivämäärä, allekirjoituksen
   versio, nimetyt vastaanottaja-brändit, toimeksiantava osapuoli.
3. **Auditointihavaintojen manifesti** — elementtikohtainen
   yhdenmukaisuus / lievä-NC / merkittävä-NC / kriittinen-NC
   standardia vastaan, kukin täydellisen havainnon kirjoituksen
   SHA-256-tiivisteen kanssa. Aggregaattisummat.
   Sertifiointisuositus allekirjoituksessa.
4. **Menetelmä ja todisteet** — paikan päällä vietetyn ajan
   jakautuminen, haastattelujen lukumäärät (stratifikoituna:
   sukupuoli, maahanmuuttajastatus, työsuhteen kesto),
   haastattelumuodon jakautuminen, tulkin suhde,
   dokumenttiarviointi näytteenkokoineen ja sisällön hasheineen,
   paikan päällä käynnin artefaktit (työntekijöiden kasvot
   sumennettuna), tunnetut menetelmälliset rajoitukset.
5. **Sitoutuneet korjaavat toimet** — kullekin
   merkittävälle-NC:lle ja lievälle-NC:lle CAP, jossa on ilmoitettu
   juurisyy, määräaika, todennusmekanismi, eskaloitumissitoumukset,
   ei-hiljaista-lievennystä -sitoumus.
6. **Auditoijan pätevyydet ja riippumattomuus** —
   auditointielimen akkreditointi, asiakaskeskittyminen, johtavan
   auditoijan tutkintotodistukset ja kielitaito, sektorikokemus,
   riippumattomuuden vakuutukset (auditoija-toimittaja,
   auditoija-brändi, sertifiointielimen erottaminen).
7. **Liiteliitteet ja kieltäytymistietue** — eturistiriidat
   (nimenomaisesti), aiempi auditointihistoria, työntekijöiden
   äänikanavat ilmoitettuna, rinnakkaiset tutkinnat,
   auditointielimen sisäinen erimielisyys, kieltäytymissääntöjen
   luettelo, tämän auditoinnin aikana todella käytetyt
   kieltäytymiset.
8. **Allekirjoittava päämies** — auditointielin, johtava auditoija,
   auditointitiimi, valtuuttava virkamies, kryptografiset
   avaintiedot.

Jokainen tosiasia päättyy kieltäytymisportin sopimukseen: *"Tämä
tosiasia väittää vain X. Se ei väitä Y"* (jossa Y on lähin
vikatila "EI TEE"-osiosta).

---

## Mitä vastaan tämä pakki puolustaa

- **Allekirjoituksen jälkeinen hiljainen merkittävien
  vaatimustenvastaisuuksien pehmentäminen.** Mikä tahansa muutos
  TOSIASIASSA 03 (esim. MAJOR_NC uudelleenluokitellaan
  MINOR_NC:ksi tai havainto poistetaan kokonaan) tuottaa eri
  SHA-256:n, eri Merkle-juuren, epäonnistuu
  OTS-tarkistuksessa.
- **Korjaavien toimien sulkemisten päivämäärän takaperin
  asettaminen.** TOSIASIA 05 jäädyttää CAP:n ja sen määräajat
  allekirjoituksessa; mikä tahansa "suljimme sen NC:n viime
  kuussa" -väite, joka on ristiriidassa sinetöityjen määräaikojen
  kanssa, on julkisesti diff-vertailtava.
- **Menetelmällinen tarkistus.** TOSIASIA 04 jäädyttää
  haastattelujen lukumäärät, dokumentin näytteenkoot ja paikan
  päällä vietetyt tunnit allekirjoituksessa — estäen myöhemmän
  "teimme syvällisen tutkimuksen" -puolustuksen olemasta
  väärinpäin todistettavissa.
- **Valikoiva uudelleenjulkaisu, joka jättää pois
  epäedulliset havainnot.** Kaikki 8 tosiasiaa on sidottu yhdellä
  Merkle-juurella; joidenkin tosiasioiden lainaaminen jättäen
  muut pois on havaittavissa julkaistun lehtilistan perusteella.
- **Riippumattomuusväitteen ajautuminen.** TOSIASIA 06 jäädyttää
  riippumattomuuden vakuutukset allekirjoituksen hetkellä. Myöhempi
  "tämä auditointi oli ehdottoman riippumaton" -väite täytyy
  käsitellä sinetöityä asiakaskeskittymisprosenttia vastaan ja
  sinetöityä brändin maksaman toimeksiannon julkistamista vastaan.
- **Kieltäytymistietueen poistaminen.** TOSIASIA 07 jäädyttää
  mitkä tosiasiakuviot pakki kieltäytyi; mikä tahansa myöhempi
  "emme koskaan kieltäytyneet mistään" -väite on ristiriidassa
  sinetöidyn tietueen kanssa.

---

## Historiallisia tai melkein historiallisia tapauksia, joissa pakki olisi auttanut

Pakki olisi tuottanut hyödyllisen **forensisen ankkurin** — *ei
ratkaisua tai ennaltaehkäisyä* — tapauksissa, joissa on mukana:

- **Rana Plaza (Bangladesh, 2013).** Rana Plaza -rakennuksen
  romahdus tappoi 1 134 vaatetyöntekijää ja loukkasi ~2 500.
  Useat brändit, joiden tuotteet valmistettiin rakennuksessa,
  olivat auditoineet Tier 1 -toimittajia rakennuksessa lyhyesti
  ennen romahdusta. Auditit käyttivät sosiaalisen auditoinnin
  tarkistuslistoja, joihin ei sisältynyt rakennusinsinöörin
  laajuutta. Sinetöity menetelmätosiasia (TOSIASIA 04) kussakin
  noista audieista olisi tehnyt *laajuuden aukon* julkisesti
  näkyväksi allekirjoituksessa — ankkuroiden dokumentoidun
  rajoituksen, jota auditointiohjelmat takautuvasti väittivät, että
  niillä ei ole. Sinetti ei olisi estänyt romahdusta. Se olisi
  estänyt katastrofin jälkeisen toimialan väitteen, että "kukaan ei
  tiennyt", olemasta epistemisesti puolustettavissa.

- **Apple / Foxconn -auditit (2010-luku).** Useita iteraatioita
  auditointiraporteista Foxconnin tuotantolaitoksilla, jotka
  tuottivat Applelle, julkaistiin vaihtelevin havaintojen
  vakavuuden tasoin, työntekijöiden itsemurhaklusterin kontekstilla
  ja korjausväitteillä. Sinetöity allekirjoitushetken tietue
  kullekin auditille olisi estänyt myöhemmät riidat siitä, "mitä
  auditointi sanoi sillä hetkellä", riippumassa arkistokopioista,
  vuodetuista kopioista tai tarkistetuista virallisista julkaisuista.

- **Kobaltti DRC:stä (jatkuva).** Käsityöläiskobalttikaivos
  Kongon demokraattisessa tasavallassa, mukaan lukien lasten
  toimesta, syöttää akkutuotannon toimitusketjuja suurille
  elektroniikka- ja sähköajoneuvomerkeille. Useat brändin
  toimeksiantamat auditit vuosien 2017–nykyhetken aikana ovat
  tuottaneet havaintoja eri vakavuuden tasoilla. Pakki sovellettuna
  kuhunkin auditiin allekirjoituksessa olisi ankkuroinut
  auditoinnin-sellaisena-kuin-se-on-julkaistu; pakki sovellettuna
  liite-tosiasioihin (TOSIASIA 07 C2: aiempi auditointihistoria)
  olisi tehnyt kunkin peräkkäisen auditoijan menetelmällisestä
  aiempien aukkojen perinnöstä julkisesti näkyväksi.

- **Konfliktimineraalit (tina, tantaali, volframi, kulta DRC:stä
  ja Suurten järvien alueelta).** Dodd-Frank §1502 tuotti
  auditointi-ja-paljasta -velvoitteet SEC-säännön 13p-1
  alaisuudessa. Riidat sulattamotason auditointien riittävyydestä ja
  alavirran säilytysketjun todentamisesta toistuivat vuosien
  2014–2022 aikana. Per-auditointi MYRIAM-sinetit olisivat
  ankkuroineet kunkin sulattamoauditoinnin allekirjoituksessa.

- **Brändin toimeksiantamat auditit Xinjiangin
  puuvillatoimitusketjuissa (2018–nykyhetki).** Riidat siitä,
  voidaanko auditit suorittaa luotettavasti Kiinan hallituksen
  rajoitusten alla auditoijan pääsystä, nousivat laajalti esiin
  vuoden 2020 jälkeen. Sinetöity menetelmätosiasia (TOSIASIA 04)
  kussakin auditoinnissa olisi ankkuroinut, mitkä
  pääsyolosuhteet todella sovellettiin — tehden "suoritimme
  perusteellisen auditoinnin" -myöhemmistä väitteistä diff-vertailtavia
  sinetöityjä menetelmällisiä rajoituksia vastaan sillä hetkellä.

- **Foxconnin alihankinta ja Applen toimittajien
  vastuullisuusraportit 2010-luvulla — toistuvia löytöjä
  alaikäisistä työntekijöistä, piilotetuista asuntoloista,
  tuntirikkomuksista.** Per-auditointi sinetit olisivat ankkuroineet
  *kielteiset havainnot* auditoinneissa, jotka eivät löytäneet
  mitään, *positiivisten havaintojen* rinnalla auditoinneissa, jotka
  löysivät rikkomuksia — estäen jälkikäteisen narratiivin
  poimimisen kummasta tahansa suunnasta.

Pakki ei olisi estänyt mitään näistä. Useissa tapauksissa taustalla
oleva ongelma oli, että auditointi *ohitti* väärinkäytöksen —
sinetöinti puhtaalle auditoinnille, jonka olisi pitänyt löytää
rikkomuksia, tuottaa pysyvän tietueen epäonnistuneesta auditoinnista,
joka on erilainen hyödyllinen (se ankkuroi epäonnistumisen
myöhempää vastuullisuutta varten), mutta ei sama kuin ennaltaehkäisy.

---

## Milloin tätä pakkia kannattaa käyttää

- Olet auditointielin, joka ottaa käyttöön "julkaisemme sen, mitä
  allekirjoitimme" -käytännön puolustautumiseksi allekirjoituksen
  jälkeistä pehmentämispainetta vastaan.
- Olet NGO, joka suorittaa rinnakkaista toimitusketjun tutkimusta
  ja haluaa peukaloinnin paljastavan viitepisteen tutkimuksen
  sulkeutumisen hetkellä.
- Olet työntekijöiden oikeuksien järjestö, joka on saanut
  auditointiraportin ja haluaa ankkuroida sen nykyisen sisällön
  ennen kuin auditointielimellä tai brändillä on mahdollisuus
  tarkistaa sitä.
- Olet brändi, joka on sitoutunut läpinäkyvyyteen toimeksiantamistasi
  auditoinneista ja haluat todennettavan forensisen tietueen.
- Olet toimittaja, sääntelijä tai tuomioistuin, joka ankkuroi
  tietyn auditoinnin sisällön tiettyyn hetkeen myöhempää
  oikeudenkäyntiä tai raportointia varten.

## Milloin tätä pakkia EI saa käyttää

- **Älä käytä korvikkeena työntekijöiden johtamalle valvonnalle,
  riippumattomille NGO-tutkimuksille tai työntekijöiden
  järjestäytymiselle.** Pakki on *lisäys*, ei korvaaja millekään
  niistä.
- **Älä käytä väittämään, että toimittaja on
  sääntöjenmukainen.** Puhdas sinetöity auditointi on parhaimmillaan
  yksi panos sääntöjenmukaisuusarviointiin. Sinetöidyn auditoinnin
  käsitteleminen sääntöjenmukaisuustodistuksena on juuri se
  oikeutusteatteri, jota rajoiteperusteiset kieltäytymissäännöt
  pyrkivät estämään.
- **Älä käytä auditoinnin keskellä.** Sinetöinti ennen
  allekirjoitusta luo väärän-positiivisen "tämä on lopullinen
  auditointiraportti" -tietueen.
- **Älä käytä sinetöidäksesi luonnoksen, jota aiot tarkistaa.**
  Jokainen allekirjoitusversio saa oman sinettinsä; tarkistukset
  viittaavat alkuperäisiin Merkle-juurella.
- **Älä käytä paineen alla sinetöidäksesi aiemmin kuin
  allekirjoituksessa tai jätä pois liitetosiasian julkistus.**
  Kieltäydy, ja (jos päämiehesi sallii) sinetöi kieltäytyminen.
- **Älä käytä perustana "reilun kaupan" tai "eettisen
  hankinnan" markkinointiväitteelle paljastamatta sinetöityjä
  menetelmällisiä rajoituksia sinetin rinnalla.** Sinetin lainaaminen
  ilman rajoitusten lainaamista on oikeutusteatterin vikatila, joka
  määrittelee auditoinnin kaappauksen.
- **Älä käytä, jos auditointielimesi on rakenteellisesti kaapattu
  eikä voi julkaista havaintoja toimeksiantavan brändin
  kaupallista etua vastaan.** Siinä tapauksessa sinetöinti tuottaa
  pysyvän julkisen tietueen kaapatusta auditoinnista. Se voi
  silti olla arvokas — mutta se ei ole sama kuin
  puolustautuminen kaappausta vastaan.

---

## Kuinka haarauttaa tämä pakki todelliseen auditointiin

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # korvaa fiktiivinen sisältö oikealla
bash build/seal.sh        # SINETÖI ALLEKIRJOITUKSESSA, ei ennen, ei jälkeen
python3 build/verify.py   # vahvista
```

**Kriittinen ajoitus:** sinetöi allekirjoitushetkellä — eli kun
johtava auditoija allekirjoittaa lopullisen raportin ja siitä tulee
auditointielimen virallinen kanta. Sinetti ennen allekirjoitusta
luo väärän-positiivisen "tämä on lopullinen auditointi" -tietueen.
Sinetti paljon allekirjoituksen jälkeen on forensisesti heikompi
välipäin tehtyjä muokkauksia vastaan.

---

## Integraatio olemassa olevaan toimitusketjun auditointi-infrastruktuuriin

Pakki on suunniteltu yhteen sovittautumaan, ei korvaamaan:

- **SA8000 (Social Accountability International).** SA8000-
  auditointiraportit ja CAP-asiakirjat kartoittuvat luonnollisesti
  TOSIASIAAN 03 + TOSIASIAAN 05. SAAS-akkreditointiviittaus sopii
  TOSIASIAAN 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** RBA:n auditointihavainnot kartoittuvat
  TOSIASIAAN 03; RBA:n auditointiyrityksen riippumattomuussäännöt
  kartoittuvat TOSIASIAAN 06.
- **SMETA (Sedex Members Ethical Trade Audit).** SMETA:n
  2-pilarin ja 4-pilarin auditointihavainnot kartoittuvat
  TOSIASIAAN 03; Sedex-alusta isännöi raakaraporttia —
  MYRIAM-sinetti ankkuroi alustalla isännöidyn raportin sisällön
  hashin.
- **amfori BSCI.** BSCI A–E -arvosanamekaniikka kartoittuu
  TOSIASIAN 03 sertifiointisuositukseen; brändijäsenten
  toimeksianto kartoittuu TOSIASIAN 06
  asiakaskeskittymisjulkistukseen ja TOSIASIAAN 07 C1.
- **FSC chain-of-custody.** Metsätuoteiden toimitusketjuille
  säilytysketjun todistukset ja uusinta-auditoinnin aikataulut
  sopivat auditointi-ikkunan ja CAP-rakenteen sisään.
- **B Lab / B Corp -vaikutusarviointi.** B Corp -sertifiointi ei
  ole kolmannen osapuolen auditointi SA8000:n mielessä, mutta
  vaikutusarvioinnin verifioijaraportit voidaan sinetöidä tämän
  pakin alla (tosiasiat uudelleen rajattuna vaikutusarviointiin
  pikemminkin kuin työauditointiin).
- **ISO 26000.** ISO 26000 on ohjeistus, ei sertifioitavissa
  oleva; pakilla ei ole suoraa ISO 26000 -auditointiraportti-
  integraatiota, mutta sosiaalisen vastuun taksonomia voi
  informoida TOSIASIAN 03 elementtirakennetta sisäisille
  auditeille.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  muut toimialakohtaiset järjestelmät).** Toimialaspesifiset
  auditointiohjelmat voidaan sinetöidä tämän pakin alla;
  TOSIASIAN 02 auditointistandardikenttä tunnistaa, mikä.
- **Fair Labor Association.** FLA:n tehtaan
  valvontaraportit kartoittuvat TOSIASIAAN 03 + TOSIASIAAN 05;
  FLA:n riippumaton-valvontakehys kartoittuu TOSIASIAN 06
  riippumattomuusvakuutuksiin.
- **Higg Index (Sustainable Apparel Coalition).** Tuotantolaitos-
  tason Higg FEM (Facility Environmental Module) ja Higg FSLM
  (Facility Social & Labor Module) -tulosteet voidaan sinetöidä
  tämän pakin alla.
- **EU CSRD / CSDDD.** EU:n yritysvastuun raportointidirektiivi ja
  yritysvastuun due diligence -direktiivi luovat
  julkistusvelvoitteita, joiden todennusasiakirjat voidaan
  sinetöidä tämän pakin alla. Pakki ankkuroi julkistuksen-
  sellaisena-kuin-se-on-julkaistu, ei sen sisältöriittävyyttä.

## Mitä tämä pakki EI korvaa

- Työntekijöiden johtamaa valvontaa (luotettavin väärinkäytösten
  havaitsemissignaali missä tahansa toimitusketjussa)
- Riippumattomia NGO-tutkimuksia (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium jne.)
- Sääntelytarkastusta (kansalliset työvoimavirastot,
  OSHA-vastineet, ILO:n maatoimisto-ohjelmat)
- Työntekijöiden järjestäytymistä ja työehtosopimusneuvotteluja
- Oikeudenkäyntiä, välimiesmenettelyä ja korjaustoimia kansallisen
  työlainsäädännön alaisuudessa
- Brändin puolen due diligence -kehyksiä (UNGP, OECD Due
  Diligence Guidance, EU CSDDD)

## Lisenssi

Public domain (CC0). Haarauta se. Kreditointia ei vaadita.
