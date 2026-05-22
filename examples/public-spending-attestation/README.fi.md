*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Sinetöintipakki julkisten menojen attestoinnille

Avaimet käteen -tyyppinen myriam-kit-esimerkki kunnallisille,
osavaltioiden, maakuntien ja kansallisille hallituksille, jotka
haluavat kryptografisesti ankkuroida budjetin toteutustietueet
(sopimusten myöntämiset, maksusuoritukset, toimitusten hyväksynnät)
myöntämishetkellä, jotta julkisten menojen tietueiden hiljainen
takautuva muokkaaminen tulee julkisesti havaittavaksi.

Sinetti on **forensinen ankkuri**, ei eheyssertifiointi. Se kirjaa
sen, mitä talousviranomainen ilmoitti raportointipäivänä, sellaisessa
muodossa, jota ei voida myöhemmin hiljaa tarkistaa ilman, että syntyy
julkisesti näkyvä kryptografinen ristiriita.

---

## Mitä tämä pakki EI tee (lue ensin)

Sinetti on kryptografinen aikaleima attestoinnin sisällöstä. Se ei voi
varmentaa, oliko attestoitu sisältö **laillinen, oikeudenmukainen tai
rehellinen**. Seuraavat vikatilat ovat **sinetin alueen ulkopuolella**:

1. **Ylävirran korruptio ja lahjukset.** Jos hankinta oli manipuloitu,
   toimittaja valittiin lahjuksen vuoksi, ainoa-lähde-perustelu oli
   keksitty tai sopimusta oli paisutettu sovitulla
   lahjusprosentilla — sinetti ankkuroi sellaisenaan kirjatun
   tapahtuman paisuneella hinnalla ja suosikkitoimittajalla
   korkealla eheydellä. Sinetti havainnoi talousjärjestelmän
   tuotosta; sillä ei ole näkyvyyttä myöntämisen ylävirran
   korruptioon. Brasilian *Operação Lava Jato* dokumentoi
   järjestelmällisiä ~3 %:n kartellin hallinnoimia lahjuksia
   tuhansissa Petrobrasin sopimuksissa, jotka olisi sinetöity
   myöntämishetkellä aivan kuin rutiininomaisina.

2. **Pöytälaatikkoyhtiöiden tosiasiallisen omistajuuden piilottaminen.**
   Sopimus, joka on myönnetty „Acme Construction Ltd:lle", sinetöidään
   julkisessa rekisterissä olevalla yhtiön nimellä. Jos „Acme" on
   tosiasiassa julkistamattoman poliittisesti vaikutusvaltaisen
   henkilön hallinnassa tai yksi kymmenistä yhden kartellin
   hallinnoimista pöytälaatikkoyhtiöistä, sinetti ankkuroi
   pintayhteisön. Tosiasiallisen omistajuuden läpinäkyvyys on ERILLINEN
   järjestelmä (FATF Recommendation 24, EU 5AMLD/6AMLD, US Corporate
   Transparency Act), jonka tuotos vaatii oman sinetöintiprotokollansa.

3. **Kirjanpitopetokset myöntämistä edeltävässä vaiheessa.** Jos
   talousviranomainen itse luo tietueen ennen sinetöintiä —
   haamusopimukset, haamutyöntekijät palkkalistoilla, fiktiiviset
   toimitusten hyväksynnät — sinetti ankkuroi väärennöksen. Sinetti
   ei voi havaita, että tietue on väärä sillä hetkellä, kun se
   kirjataan; se voi havaita vain sen, että tietue on muuttunut
   sinetöinnin JÄLKEEN.

4. **Selektiivinen julkaiseminen / kirsikanpoiminta.** Talousviranomainen
   voisi julkaista vain *osajoukon* tapahtumista — puhtaat — ja
   sinetöidä vain ne. Sinetti ankkuroi sen, mitä julkaisussa on; se ei
   ankkuroi sitä tapahtumien universumia, jonka olisi pitänyt olla
   julkaisussa. Tämän pakin FACT 07 (lisätiedot ja
   epäämistietue) on rakenteellinen puolustus, mutta se riippuu siitä,
   että myöntävä viranomainen on rehellinen siitä, mitä se päättää olla
   sinetöimättä.

5. **Kirjanpidon ulkopuoliset tai budjetin ulkopuoliset menot.**
   Valtionyhtiöiden, valtion sijoitusrahastojen,
   erityistarkoitusvälineiden tai budjetin ulkopuolisten
   hoitotilien kautta reititetyt julkiset menot eivät välttämättä esiinny
   sinetin ankkuroimassa budjetissa. Sinetti kirjaa sen, mitä
   ilmoitettiin budjettijärjestelmän sisällä; järjestelmän ulkopuoliset
   menot ovat sinetin alueen ulkopuolella. Irakin Coalition Provisional
   Authority (CPA) -kiistat vuosina 2003–2004 koskivat noin 9 miljardia
   USD käteisellä tehtyjä suorituksia, joiden tietueet osittain
   katosivat; olemassa olevien tietueiden sinetöinti suoritushetkellä
   olisi ankkuroinut ne, mutta ei olisi luonut tietueita, joita CPA ei
   pitänyt yllä.

6. **Myöntämisen jälkeinen „selittämispaine".** Sinetöity ylitys,
   sinetöity ainoa-lähde tai sinetöity muutoskäsky voidaan
   uudelleenkertoa myöhemmin niin, kuin poliittinen valta haluaa
   kehystää sen. Sinetti ankkuroi TOSIASIAT myöntämispäivänä, mutta se
   ei ennalta määrää tarinaa, jota nuo tosiasiat myöhemmin tukevat.

7. **Pakotettu attestointi.** Jos vastuullinen talousprinsipaali
   pakotetaan allekirjoittamaan attestointi, joka esittää tapahtumat
   väärin, sinetti ankkuroi pakotetun attestoinnin pakotetulla
   allekirjoituksella. Sinetti varmentaa, KUKA allekirjoitti (FACT 08),
   ei MIKSI he allekirjoittivat. Pakotetun attestoinnin sinetöinti
   tuottaa pysyvän julkisen tietueen pakotetusta tuotoksesta —
   hyödyllinen myöhempää vastuullisuutta varten, mutta ei puolustus
   pakottamista vastaan sillä hetkellä.

8. **Vertailu lainkäyttöalueiden välillä.** Sinetöity meno on luettavissa
   vain myöntävän lainkäyttöalueen oikeudellista järjestelmää vasten.
   „Miksi kunta X maksoi Y:lle palvelusta Z, kun kunta W maksoi vain
   V:n?" on vertaileva analyysikysymys sinetöinnin alavirrassa.
   Lainkäyttöalueiden välinen vertailu on analyyttinen tehtävä sinetöityyn
   dataan, ei sinetin ominaisuus.

**Yllä oleva rehellisten rajoitusten osio on tämän pakin kantava osa.**
Talousvirkamiehet ja poliitikot, jotka uskovat sinetöinnin olevan yhtä
kuin eheys, käyttävät tätä pakkia kilpenä. Pakin on sanottava selvästi:
tämä on *kiistämättömyysprimitiivi myöntämishetkelle*, ei todiste
menojen eheydestä.

---

## Mitä tämä pakki MUUTOIN KIELTÄYTYY sinetöimästä

Pakki on konfiguroitu hylkäämään seuraavat faktamallit, vaikka voimassa
oleva allekirjoitusvaltuuden omaava käyttäjä lähettäisi ne:

- **Yksittäisten valtion työntekijöiden nimet prinsipaali-
  allekirjoitustason alapuolelta.** Mikään faktoista ei saa nimetä
  yksittäisiä hankintatoimiston työntekijöitä, yksittäisiä rahastonhoitajia,
  yksittäisiä arviointipaneelin jäseniä tai ketään luonnollista
  henkilöä, joka ei ole julkisessa vastuuasemassa. Linjahenkilöstön
  kostotoimien riski ylittää läpinäkyvyyshyödyn; heidän henkilöllisyytensä
  sinetöidään sisäisissä kontrolleissa (FACT 05 hash hyväksyntälokista),
  ei attestoinnin tekstissä.

- **Toimittajan PII.** Mikään faktoista ei saa sisältää toimittajan
  pankkitilinumeroita, yksittäisten toimittajan työntekijöiden nimiä,
  toimittajan kotiosoitteita, luonnollisten henkilöiden verotunnisteita,
  sisäisiä hinnoittelueritelmiä, jotka sisältävät toimittajan
  kustannusrakenteen, tai mitään muuta kaupallisen PII:n kenttää, jonka
  julkaiseminen vahingoittaa toimittajan etuja ilman korruptionvastaista
  hyötyä. Tällaista tietoa voidaan TIIVISTÄÄ (FACT 05), mutta ei
  julkaista.

- **Turvallisuusluokitellut menot.** Kansallisten turvallisuussäädösten
  alaisia luokiteltuja menoja EI voi sinetöidä tällä pakilla.
  Luokiteltujen tietojen käsittely on eri ongelma, jolla on eri
  kryptografiset ja oikeudelliset vaatimukset. Itse pois jättäminen
  julkistetaan FACT 07 R3:ssa, jotta lukija tietää, että julkaisu on
  suunnitelmallisesti osittainen.

- **Siviilioikeudellinen verovelvollisuuksien täytäntöönpano
  tunnistettavia luonnollisia henkilöitä vastaan.** Vaikka
  täytäntöönpanokustannukset ovat julkisia menoja, yksittäisten
  täytäntöönpanon kohteena olevien veronmaksajien nimeämistä kieltäydytään:
  yksityisyyshaitta ylittää läpinäkyvyyshyödyn, ja rinnakkaista
  läpinäkyvyyttä on olemassa verotuomioistuinraportoinnin kautta.

- **Myöntämistä edeltävät tapahtumat.** Ei sopimusta ennen virallista
  myöntämistä; ei suoritusta ennen virallista myöntämistä. Sopimusluonnoksen
  tai vireillä olevan maksun sinetöinti aivan kuin se olisi suoritettu
  luo virheellisen varmuuden.

- **Muut kuin vastuullinen talousprinsipaali sinetöitsijöinä.**
  Urakoitsija, toimittaja, valtuuston jäsen, toimittaja tai tarkkailija
  ei voi sinetöidä „julkista menotietuetta" sen myöntäneen
  talousviranomaisen sijaan. (He voivat sinetöidä omat havaintonsa
  oman prinsipaalinsa alla, erillisessä julkaisussa.)

- **„Korruptiosta vapaa" -kehystykset.** Pakki kieltäytyy sinetöimästä
  mitä tahansa muotoa „tämä meno oli laillinen ja korruptiosta vapaa"
  tai „hankinta oli osoitettavasti oikeudenmukainen". Tällaiset
  väitteet ovat epistemologisesti pakin alueen ulkopuolella.

- **Julkaisut, joista puuttuvat FACT 07 -lisätiedot.** Tapahtumien
  julkaisu ilman mukaan liitettyä julkistus- ja epäämistietuetta ei ole
  laillinen MYRIAM-julkaisu tämän pakin alla.

Epääminen itse voidaan sinetöidä faktana („Tämä taho pyysi X:n
sinetöintiä; pakki kieltäytyi epäämissäännön Y mukaisesti"), mikä
luo julkisen tietueen yritetystä väärinkäytöstä. Sellaisella alueella,
jossa poliittinen paine talousvirkamiehiä kohtaan on dokumentoitua,
*evättyjen* pyyntöjen tietue on itsessään eheyssignaali.

---

## Mitä tämä pakki TODELLA sinetöi

8 faktaa budjetin toteutuksen attestointihetkellä:

1. **Esimerkkivaroitus** — ilmoittaa julkaisun esimerkiksi (oikeat
   attestoinnit poistavat tai korvaavat tämän).
2. **Lainkäyttöalue ja oikeudellinen perusta** — mikä hallintoyksikkö
   on myöntäjänä, millä lakisääteisellä toimivallalla, millä
   varainhoitokaudella.
3. **Määräraha- tai budjettiviite** — toteutettavat tietyt rivit
   hyväksytyssä budjetissa, sekä budjetti-instrumentin ja sovellettujen
   muutosten / siirtojen / uudelleenkohdennusten hashit.
4. **Sopimus- tai suoritusmanifest** — tapahtumakohtainen tietue:
   määrä, toimittajan oikeudellisen yksikön nimi (ei yksittäistä PII:tä),
   tarkoitus, päivämäärä, hankintatyyppi, myöntämisperusta,
   sopimusasiakirjan hash.
5. **Tukiasiakirjojen hashit** — SHA-256 tarjouspyynnöistä, arvioinneista,
   toteutetuista sopimuksista, muutoskäskyistä, maksuhakemuksista,
   toimitusten hyväksyntälomakkeista, valtiokonttorin kirjanpitomerkinnöistä,
   kontrollien hyväksyntälokeista. Vain hashit, ei sisältöjä — kaupallisen
   ja henkilökohtaisen PII:n suojelemiseksi samalla kun
   uudelleen-hashauksen varmentaminen on mahdollista.
6. **Tarkastus- ja valvontatila** — mikä yleistarkastajaelin on
   toimivaltainen, mikä ylin tarkastuselin, mikä syyttäjäelin on
   toimivaltainen korruptio-rikoksissa, tarkastusten määräajat,
   nykyinen tila kaikissa meneillään olevissa tarkasteluissa.
7. **Lisätiedot ja epäämistietue** — vireillä olevat hankintavalitukset,
   vireillä olevat sisäiset tutkinnat, käsittelemättömät
   tiedonsaantipyynnöt, eriävät tarkastukset, tunnetut budjettilinjojen
   ylitykset; eksplisiittinen luettelo malleista, joita pakki kieltäytyi
   sinetöimästä.
8. **Allekirjoittava prinsipaali** — vastuullinen talousviranomainen +
   rooli + lakisääteinen vastuu + kanssallekirjoittajat kaksoiskontrollin
   alaisina; mitä kukin allekirjoittaja henkilökohtaisesti attestoi ja
   mitä ei attestoi.

Jokainen fakta päättyy epäämisportti-konventioon: *„Tämä fakta väittää
vain X. Se ei väitä Y"* (jossa Y on lähin vikatila „EI tee" -osiosta).

---

## Mitä vastaan tämä pakki suojaa

- **Sopimusmäärien hiljainen takautuva tarkistus.** Mikä tahansa muutos
  mihin tahansa määrään FACT 04:ssä tuottaa eri SHA-256:n, eri
  Merkle-juuren, ja epäonnistuu OTS-varmennuksessa.
- **Hiljainen toimittajan korvaaminen.** „Toimittaja A":n korvaaminen
  „Toimittaja B":llä jo myönnetyssä sopimuksessa on havaittavissa
  sinetöidyistä tavuista.
- **Muutoskäskyjen takautuva päiväys.** FACT 04 jäädyttää muutoskäskyn
  päivämäärän ja perustelut myöntämishetkellä; myöhemmän väitteen „tämä
  oli aina sovittu laajuus" on otettava huomioon sinetöity
  muutoskäskyn tietue.
- **Epäedullisten tapahtumien hiljainen katoaminen.** Kaikki kaudella
  myönnetyt tapahtumat ovat FACT 04:ssä yhden Merkle-juuren alla.
  Osajoukon julkaiseminen on havaittavissa leaf-hash-luettelosta.
- **Lisätietojen tukahduttaminen.** FACT 07 jäädyttää vireillä olevien
  protestien, vireillä olevien tutkimusten ja käsittelemättömien
  tiedonsaantipyyntöjen tilan attestointihetkellä. Myöhempi „emme
  koskaan kuulleet tuosta protestista" -väite on julkisesti diffattava.
- **Tarkastusten toimivallan ajautuminen.** FACT 06 jäädyttää, millä
  elimillä on valvontatoimivalta sinetöityjen tapahtumien yli. Myöhemmän
  väitteen, että tietyllä IG:llä „ei ollut toimivaltaa", on otettava
  huomioon sinetöity toimivaltatietue.
- **Epäämistietueen pyyhkiminen.** FACT 07 kirjaa, mitä pakki
  kieltäytyi sinetöimästä; myöhempi „emme koskaan kieltäytyneet
  mistään" -väite on ristiriidassa sinetöidyn tietueen kanssa.

---

## Historialliset tapaukset, joissa pakista olisi ollut apua

Pakki olisi tuottanut hyödyllisen **forensisen ankkurin** — *ei
korjausta, ei estoa, ei korvike rikossyytteille* — dokumentoiduissa
julkisen tietueen tapauksissa, joissa esiintyy julkisten menotietueiden
hiljainen takautuva muokkaus:

- **Brasilia — *Operação Lava Jato* / Petrobras-linja (2014–2021).**
  Brasilian liittovaltion syyttäjät dokumentoivat suurten
  rakennusyritysten kartellin, joka yli vuosikymmenen ajan maksoi
  keskimäärin ~3 %:n lahjuksia Petrobrasin ja muiden liittovaltion
  infrastruktuurisopimusten yhteydessä, ja lahjus reititettiin
  poliitikoille ja kartellin omaan hinnoittelun koordinointiin.
  Myönnetyt sopimukset näyttivät rutiininomaisilta; korruptio oli
  myöntämisen ylävirrassa. Sinetöintipakki EI olisi estänyt Lava
  Jatoa (lahjukset olivat upotettuina hintaan ENNEN kuin sopimus
  saavutti sinetin), mutta olisi ankkuroinut sopimusehdot
  myöntämishetkellä — mikä tekisi myöhemmästä forensisesta
  rekonstruktiosta „mitä kukin sopimus todellisuudessa sanoi sen
  allekirjoitushetkellä" valtavasti halvempaa. Lava Jaton
  tutkimuskustannus oli suurelta osin kustannus aikajanan kokoamisesta
  uudelleen epäjohdonmukaisista arkistotietueista.

- **Euroopan unioni — alueellisia kehitysrahastoja koskevat kiistat
  (useita jäsenvaltioita, 2010-luku–2020-luku).** Euroopan tilintarkastustuomioistuimen
  vuosikertomukset ovat toistuvasti tunnistaneet aineellisia virhetasoja
  European Structural and Investment Fund (ESIF):n ja
  koheesiorahaston menoissa, joinakin vuosina materiaalisuusrajan
  ylittäen. Kiistat „mitä todellisuudessa vaadittiin" vs. „mitä
  todellisuudessa toimitettiin" toistuvat, koska vaatimusdokumentaatiota
  voidaan tarkistaa lähettämisen ja tarkastuksen välillä. Per-myöntämis-
  MYRIAM-sinetöinti vaatimuksesta-sellaisenaan-lähetetty olisi ankkuroinut
  jokaisen vaatimuksen sisällön lähettämishetkellä, erotellen „mitä
  edunsaaja vaati silloin" ja „mitä tarkastuksen jälkeinen rekonstruktio
  päätteli".

- **Irak — Coalition Provisional Authority (CPA) -suoritukset,
  2003–2004.** CPA maksoi noin 9 miljardia USD käteisenä Development
  Fund for Iraq:sta dokumentaatiolla, jonka Special Inspector General
  for Iraq Reconstruction (SIGIR) ja myöhemmät tarkastusraportit
  luonnehtivat olennaisesti puutteelliseksi. Kiistat
  suoritusrekisteröinneistä jatkuvat kahden vuosikymmenen jälkeen.
  Sinetöinti suoritushetkellä ei olisi luonut tietueita, joita CPA ei
  pitänyt yllä — mutta missä mikä tahansa tietue olikin olemassa
  (käsin kirjoitetut kirjanpidot, päivätyt siirtoluvat), samanaikainen
  sinetöinti olisi ankkuroinut sen tietueen tavutason tilan
  myöntämishetkellä, erotellen „tietue silloin" „tietueesta sellaisena
  kuin se myöhemmin rekonstruoitiin".

- **Kreikka — valtionvelan ja julkisten menoraporttien tarkistukset
  (2009–2010).** Eurostatin tarkastukset vuosina 2009–2010 dokumentoivat
  merkittäviä tarkistuksia aiemmin raportoituihin Kreikan finanssidatoihin,
  ja itse tarkistusmenetelmästä kiistettiin. Vuosineljänneksen
  menoraportin sinetöinti alkuperäisellä julkaisuhetkellä olisi tehnyt
  alkuperäisen ja tarkistetun raportin välisestä *deltasta* julkisesti
  diffattavan, eikä vain arkistovertailulla rekonstruoitavissa olevan.
  Sinetti ei olisi estänyt taustalla olevaa menetelmäkysymystä, mutta
  olisi ankkuroinut jokaisen raportoidun vuosineljänneksen alkuperäisen
  raportin hetkellä.

- **Yhdistynyt kuningaskunta — pandemia-ajan hankinta (2020–2022).**
  UK National Audit Office ja parlamentin valiokunnan raportit
  tunnistivat hankintaprosesseja vuosina 2020–2021, joissa sopimuksia
  myönnettiin hätätilannekäytäntöjen mukaan vähennetyllä kilpailulla
  ja vähennetyllä dokumentaatiolla; jotkin myöntämiset muokattiin,
  peruttiin tai sovittiin myöhemmin. Per-myöntämis-sinetöinti jokaisen
  hätähankinnan myöntämisestä olisi ankkuroinut myöntämisen perustelun
  ja ehdot myöntämishetkellä, mikä tekisi myöhemmistä muokkauksista
  julkisesti näkyvän deltan eikä hiljaa muokatun tietueen.

- **Etelä-Afrikka — valtio-kaappaus-ajan julkisten yritysten sopimukset
  (~2010–2018).** Zondo-komissio dokumentoi useiden valtio-omisteisten
  yritysten (Eskom, Transnet, Denel) sopimuksia, joiden dokumentointi
  oli vaihtelevasti puutteellista, tarkistettua tai kiistanalaista.
  Jokaisen sopimuksen myöntämisen sinetöinti myöntämishetkellä olisi
  ankkuroinut tietueen sellaisena kuin myönnetty -tilan, erotellen
  myöhemmät forensiset rekonstruktiotuotokset samanaikaisesta tietueesta.

Pakki EI olisi estänyt yllä olevien tapausten taustalla olevaa
korruptiota. Useissa tapauksissa taustaongelma oli, että korruptio oli
*myöntämisen ylävirrassa* — sinetti ankkuroi korruptoituneen sopimuksen
korkealla eheydellä, mikä on erilainen hyödyllisyyden laji (forensinen
ankkuri myöhempää vastuullisuutta varten) mutta ei sama kuin esto.
Muissa tapauksissa (CPA-käteinen, budjetin ulkopuoliset menot)
taustaongelma oli, että sinetöitäviä tietueita ei ollut tai niitä ei
ylläpidetty — pakki ei voi luoda tietueita, joita viranomainen ei
tuottanut.

Nämä historialliset tapaukset on nimetty vain viittauksella julkisesti
dokumentoituihin havaintoihin (oikeudenkäynnistä, parlamentin valiokunnan
raporteista, tarkastusviranomaisten julkaisuista). Kenestäkään yksittäisestä
henkilöstä ei tehdä mitään väitettä; dokumentoidut institutionaaliset
havainnot ovat julkisessa tietueessa.

---

## Milloin käyttää tätä pakkia

- Lainkäyttöalueellasi on vakiintunut budjetin toteutuksen
  raportointiprosessi ja haluat lisätä siihen muuttumattoman julkisen
  ankkurin.
- Odotat myöntämisen jälkeistä tarkastelua (tiedonsaantipyynnöt,
  tarkastus, kansalaisyhteiskunnan valvonta, journalistinen tutkimus)
  ja haluat peukaloinnista todistavan viitekohdan.
- Sinulla on lakisääteinen valtuus läpinäkyvyys-/avoimien-tietueiden
  lain mukaan julkaista listattu faktajoukko, ja yksityisyys/
  turvallisuus-poikkeukset on otettu huomioon.
- Toimit lakisääteisen tarkastusjärjestelmän alla (yleistarkastaja,
  ylin tarkastuselin) ja haluat ankkuroida jokaisen vuosineljänneksen
  päätöksen ennen kuin tarkastuskierros saavuttaa sen.
- Julkaiset Open Contracting Data Standardin tai IATI:n mukaisesti ja
  haluat kryptografisen täydennyksen portaaliperustaiselle julkaisulle.

## Milloin EI käytä tätä pakkia

- **Älä käytä korvaamaan lakisääteistä tarkastusta,
  yleistarkastajan tarkastelua, syyttäjäntutkimusta tai
  kansalaisyhteiskunnan valvontaa.** Pakki on *lisäävä*, ei korvaava.
- **Älä käytä legitimiteettisertifikaattina.** Sinetöity menotietue ei
  ole korruptiosta vapaa -sertifikaatti. Sen kohteleminen sellaisena on
  juuri se vikatila, jonka estämiseksi pakin rajoitus-ensin-rakenne
  on olemassa.
- **Älä käytä kesken kauden.** Pakki on formaalia myöntämishetkeä
  varten (vuosineljänneksen päätös, sopimuksen myöntäminen, virstanpylvään
  suoritus). Kauden keskellä tehdyt sinetöinnit luovat harhaanjohtavia
  viitekohtia.
- **Älä käytä väittääksesi, että meno oli laillinen, oikeudenmukainen
  tai korruptoitumaton** — pakki ei voi tehdä sitä.
- **Älä käytä sinetöimään luokiteltuja menoja, yksittäisten työntekijöiden
  PII:tä tai toimittajien kaupallista PII:tä.** Pakki kieltäytyy näistä
  malleista; yritykset luovat epäämistietueen (FACT 07).
- **Älä käytä sinetöimään myöntämistä edeltäviä luonnoksia.** Luonnokset
  voidaan sinetöidä eri attestointityypin alla („luonnos kommentteja
  varten, ei myönnetty"), mutta ei tämän pakin myöntämistyypin alla.
- **Älä käytä paineen alla jättääksesi FACT 07 -julkistuksia pois.**
  Kieltäydy, ja sinetöi kieltäytyminen.
- **Älä käytä, jos talousviranomaisesi on vallattu.** Sinetöity
  petollinen meno on pysyvä julkinen tietue petoksesta, ei sen
  puolustus. Primitiivi leikkaa molempiin suuntiin; se on sen
  rehellisyys.

---

## Kuinka forkata tämä pakki todellista attestointia varten

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Kriittinen ajoitus:** sinetöi formaalin myöntämisen hetkellä — eli
sillä hetkellä, kun vastuullinen talousprinsipaali allekirjoittaa
vuosineljänneksen päätöksen, sillä hetkellä kun sopimus formaalisti
myönnetään, tai sillä hetkellä kun suoritus formaalisti myönnetään.
Sinetti ennen formaalia myöntämistä luo väärän positiivisen „tämä on
virallinen tietue" -viitteen. Sinetti kauan formaalin myöntämisen
jälkeen on forensisesti heikompi väliin tulleita muokkauksia vastaan.

**Kadenssi:** pakki on suunniteltu vuosineljänneksittäisille
attestoinneille oletuksena. Vuosineljännestä pienempiä kadensseja
(kuukausittainen päätös, transaktiokohtainen sinetöinti) tuetaan
ajamalla uudelleen sopivalla laajuudella; yhden korkean arvon
transaktion sinetöinti on laillinen käyttö.

---

## Integraatio olemassa olevan julkisen talouden infrastruktuurin kanssa

Pakki on suunniteltu yhdistettäväksi, ei korvaamaan:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Viisi
  julkaisupistettä (suunnittelu, tarjouspyyntö, myöntäminen, sopimus,
  toteutus) kartoittuvat luontevasti FACT 03:een (suunnittelu →
  määräraha), FACT 04:ään (tarjouspyyntö, myöntäminen, sopimus,
  toteutus → tapahtumamanifesti) ja FACT 05:een (tukiasiakirjojen
  hashit). Itse OCDS JSON-vienti sinetöidään FACT 05:ssä
  (kontrolliasiakirjat). OCDS-julkaisua ajava lainkäyttöalue voi lisätä
  MYRIAM-sinetöinnin kryptografiseksi kerrokseksi olemassa olevan
  portaalinsa päälle.

- **International Aid Transparency Initiative (IATI) -standardi v2.03.**
  Menoille, jotka rahoitetaan kokonaan tai osittain ulkoisella avulla,
  IATI XML voidaan sinetöidä kontrolliasiakirjana; sinetti tarjoaa
  kryptografisen täydennyksen IATI-rekisterin HTTP-pohjaiselle
  julkaisumallille.

- **Open Government Partnership (OGP) -sitoumukset.** OGP National
  Action Plans -suunnitelmat sisältävät usein finanssin
  läpinäkyvyyssitoumuksia; MYRIAM-sinetöinti operationalisoi
  „peukaloinnista todistavan julkaisun" -sitoumuksen tavalla, joka on
  itsenäisesti varmennettavissa kansalaisyhteiskunnan toimesta ilman,
  että hallituksen portaaliin on luotettava.

- **OECD:n suositus julkisesta eheydestä (2017).** Pakki tukee
  suositusta 4 (avoin hallituksen data julkisesta taloudesta
  konelukuisessa, ajantasaisessa muodossa) tekemällä datasta
  kryptografisesti ankkuroidun konelukuisuuden lisäksi.

- **YK:n korruptionvastainen yleissopimus (UNCAC), erityisesti artiklat
  9 (hankinta) ja 13 (yhteiskunnan osallistuminen).** Pakki tarjoaa
  forensisen primitiivin, joka tukee artiklan 9 läpinäkyvyysvelvoitteita
  ja artiklan 13 kansalaisyhteiskunnan valvontaa.

- **Ylimmät tarkastuselimet (SAI:t) — INTOSAI-kehys.** INTOSAI-
  standardien (ISSAI) mukaan toimivat SAI:t voivat kuluttaa sinetöityjä
  julkaisuja todisteena korkealla eheydellä; SHA-256-hashit FACT 05:ssä
  ovat samat hashit, jotka SAI:n e-tarkastustyökalut voivat laskea
  uudelleen.

- **Yleistarkastajan toimistot.** Sinetöityjen menojen yli
  toimivaltaiset kotimaiset IG-toimistot (FACT 06) voivat kutsua
  asiakirjojen sisällöt, joiden hashit on sinetöity FACT 05:ssä;
  sinetti sitoo kutsutut asiakirjasisällöt sisältöihin, jotka
  olivat olemassa myöntämishetkellä.

- **Tiedonsaanti- ja avoimien tietueiden lait.** Sinetti ei vapauta
  myöntävää viranomaista jatkuvista tiedonsaantivelvoitteista; itse
  asiassa se tekee selektiivisestä tiedonsaantivasteesta havaittavan
  poikkeamana sinetöidystä tietueesta. FACT 07 C3 ankkuroi
  käsittelemättömät tiedonsaantipyynnöt attestointihetkellä.

- **Tosiasiallisen omistajan rekisterit (FATF Recommendation 24, EU
  AML-direktiivit, US Corporate Transparency Act).** Tosiasiallisen
  omistajan tietoja EI sinetöidä tämän pakin alla (FACT 04 hakee
  toimittajan henkilöllisyyden vain rekisteröidystä oikeudellisen
  yksikön nimestä). Tosiasiallisen omistajuuden julkistus on erillinen
  sinetöintijärjestelmä, joka voi tuottaa rinnakkaisen julkaisun, johon
  viitataan Merkle-juurella.

- **Tuomioistuinten hallinnoima läpinäkyvyys (oikeudellinen menoraportointi,
  varojen takaisinperintämenettelyt).** Korruptioon liittyvien
  oikeudenkäyntien tuotokset eivät kuulu tämän pakin piiriin, mutta
  voidaan sinetöidä rinnakkaisten attestointityyppien alla.

## Mitä tämä pakki EI korvaa

- Lakisääteistä budjetin toteutuksen tarkastusta yleistarkastajaelinten
  toimesta
- Ylimpien tarkastuselinten tarkastelua (GAO, NAO, TCU, CAG, AGN, BRH,
  Cour des comptes, vastaava)
- Korruptio-rikosten syyttäjäntutkimusta (kansalliset
  korruptionvastaiset syyttäjät, UNCAC artiklan 36 elimet)
- Kansalaisyhteiskunnan ja journalistista tutkivaa raportointia
- Ilmoituskanavia ja suojattuja julkistusjärjestelmiä
- Tosiasiallisen omistajuuden julkistusta
- Kansainvälistä vertaisarviointia (OECD, IMF Fiscal Transparency
  Evaluation, EU-lukukausi, IATI-rekisteri)
- Tuomioistuinten hallinnoimia varojen takaisinperintämenettelyjä

Sinetti on forensinen primitiivi, joka alentaa kustannuksia ja lisää
luotettavuutta kaikessa yllä mainitussa. Se ei ole eikä voi olla
korvike millekään niistä.

---

## Lisenssi

Public domain (CC0). Forkkaa se. Ei attribuutiota vaadita.
