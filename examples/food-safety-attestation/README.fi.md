*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Elintarviketurvallisuuden attestaatiopakki

Avaimet käteen -mallinen myriam-kit-esimerkki elintarvikevalmistajille,
elintarviketurvallisuustarkastajille, kolmannen osapuolen
sertifioijille ja sääntelyviranomaisille, jotka haluavat julkaista
Bitcoiniin ankkuroidun, peukaloinnin paljastavan sinetin siitä, *mitä
vapautustestit kertoivat* ja *mikä vapautuspäätös tehtiin*, erän
vapautuksen tai tarkastusraportin allekirjoituksen hetkellä — niin
että vapautuksen jälkeinen testitietueen, vapautuspäätöksen tai
takaisinvetositoumusten hiljainen muokkaaminen on julkisesti
havaittavissa.

---

## Mitä tämä pakki EI tee (lue ensin)

Sinetti on kryptografinen aikaleima siitä, MITKÄ vapautustestit
suoritettiin MILLE erälle, MISTÄ akkreditoiduista laboratorioista,
MILLÄ menetelmillä, MILLÄ tuloksilla, ja minkä VAPAUTUSPÄÄTÖKSEN
laadunvarmistusviranomainen teki niiden tulosten perusteella. Se ei
voi vastata mihinkään elintarviketurvallisuuskysymykseen sen
ulkopuolelta. Seuraavat asiat ovat **sinetin toimialueen
ulkopuolella**:

1. **Saastumisen estäminen.** Pakki ankkuroi sen, mitä testitulokset
   SANOIVAT vapautuksessa. Saastumisella on monia syitä —
   heterogeeninen mikrobiologinen jakautuminen erän sisällä,
   vapautuksen jälkeinen lämpötilan väärinkäyttö jakelussa,
   vähittäiskäsittelyvirheet, kuluttajan valmistusvirheet, uudet tai
   seulomattomat vaarat (esim. melamiinin väärennös ennen kuin
   melamiinin seulonta oli rutiinia), toimitusketjun petos
   valmistajan testausta edeltävällä portaalla. Sinetti ei estä
   mitään näistä eikä väitä estävänsä.

2. **Sen takaaminen, että kaikki yksiköt läpäisseessä erässä ovat
   turvallisia.** Mikrobiologinen saastuminen elintarvikemassassa on
   HETEROGEENISTÄ. Listeria, Salmonella ja STEC-patogeenit esiintyvät
   matalan prevalenssin paikallisina kuumana pisteinä, eivät
   tasaisesti jakautuneena. ICMSF:n ja Codexin näytteenotto-
   suunnitelmissa on dokumentoitu, rajoitettu todennäköisyys havaita
   matalan prevalenssin saastuminen — todennäköisyys EI ole 1. Erä,
   joka läpäisee vapautusnäytteenoton, voi silti sisältää
   saastuneita yksiköitä, joita ei otettu näytteeksi. Sinetti
   ankkuroi NÄYTTEET, ei massaa. Tämä rajoite toistetaan
   nimenomaisesti TOSIASIASSA 03 ja on tämän pakin yksittäin tärkein
   rehellinen rajaus.

3. **Sen sertifiointi, että vapautustestit suoritettiin
   rehellisesti.** Sinetti ankkuroi sen, mitä testit raportoivat
   vapautuksessa. Laboratorio, joka raportoi petollisen LÄPÄISYN
   vapautuksessa, tuottaa kryptografisesti pätevän sinetin
   petollisesta LÄPÄISYSTÄ. Pakki tekee myöhempi hiljaisesta
   muokkaamisesta havaittavaa, mutta ei havaitse samanaikaista
   petosta. Samanaikaisen petoksen havaitseminen vaatii auditointia,
   laboratorioakkreditoinnin valvontaa (ISO 17025 -valvonta),
   pätevyystestiohjelmia ja sääntelijän tarkastuksia — kaikkia
   sinettiä edeltävältä portaalta.

4. **FSMA-, FSIS- tai EU:n toimivaltaisten viranomaisten
   sääntelyilmoitusten korvaaminen.** Vapautustietueet FSMA:n,
   FSIS:n, EU:n asetuksen (EY) 178/2002 ja Codex Alimentariuksen
   alaisuudessa pidetään yllä lain mukaan ja toimitetaan
   sääntelijän pyynnöstä. Sinetti lisää julkisen peukaloinnin
   paljastavan kerroksen näiden ilmoitusten PÄÄLLE; se EI korvaa
   niitä. Sinetöity julkaisu ei ole sääntelyilmoitus.

5. **Takaisinvedon laajuuden riitojen ratkaiseminen.** Pakki voi
   sinetöidä vapautuksessa annetut takaisinvetositoumukset (TOSIASIA
   06) ja myöhemmän takaisinvedon laajuuden uutena julkaisuna; mutta
   raja sille, mitkä erät ovat vaikutuksen alaisina, mitkä yksiköt
   toimitettiin, mitkä vähittäismyyjät vastaanottivat ne ja mitkä
   kuluttajat altistuivat, on edelleen jäljitysprosessi taaksepäin
   ja eteenpäin. Sinetti ankkuroi sen, mihin valmistaja SITOUTUI ja
   mitä he myöhemmin TEKIVÄT. Se ei ratkaise taustalla olevaa
   epidemiologista kysymystä.

6. **Tarkoituksellisen toimitusketjupetoksen havaitseminen testausta
   edeltävällä portaalla.** Vuoden 2008 Kiinan
   melamiini-väärennöksessä maitoa ja äidinmaidonkorviketta vastaan
   onnistui, koska melamiini ei kuulunut analyyttipaneeliin —
   typpipitoisuuteen perustuva proteiiniekvivalenttimittaus kuului,
   ja melamiini huijasi sitä. Sinetöidyssä TOSIASIASSA 03, jossa
   olisi sen aikainen käytössä ollut analyyttipaneeli, olisi
   sitouduttu siihen paneeliin julkisesti — mutta se ei olisi
   tehnyt mitään paneelin ulkopuolisen väärennysaineen
   havaitsemiseksi. Sinetin arvo siinä tapauksessa olisi ollut
   forensinen ankkuri "tämä on se, mitä valmistaja väitti
   testaavansa", EI ennaltaehkäisy. Todellinen
   elintarviketurvallisuusjärjestelmä käsittelee tätä
   ilmoittamattoman sääntelijän näytteenoton kautta laajakirjoisella
   seulonnalla (esim. LC-MS-suuntaamattomat menetelmät), joka on
   valmistajan sinetöintiä edeltävällä portaalla.

7. **Vapautuksen jälkeisen jakelun ja kuluttajan käsittelyn
   ankkurointi.** Kun erä lähtee tuotantolaitoksesta, lämpötilan
   väärinkäyttö jakelussa, vähittäiskäsittelyn väärinkäyttö,
   kuluttajan säilytysvirheet ja kuluttajan valmistusvirheet ovat
   kaikki ulkopuolella. Sinetti on rajattu valmistajan
   vapautustapahtumaan. Alavirran peukaloinnin paljastaminen vaatii
   erilliset pakit jakelijan, vähittäismyyjän ja (instituutio-
   kuluttajille kuten kouluille ja sairaaloille) käyttöpaikkatasolla.

8. **Sen takaaminen, että ruoka on turvallista jollekin tietylle
   väestöryhmälle.** TOSIASIAN 03 LÄPÄISY-tulokset eivät merkitse
   turvallisuutta raskaana oleville kuluttajille, imeväisille,
   immuunipuutteisille kuluttajille tai iäkkäille, joille Listeria
   monocytogenes ja Salmonella muodostavat dokumentoidun
   kohonneen riskin myös pitoisuuksilla alle perinteisten
   havaintorajojen. Sinetti ei voi tehdä väestöspesifisiä
   turvallisuusväitteitä ja kieltäytyy siitä (kieltäytymissääntö R6).

**Yllä oleva rehellisten rajojen osio on tämän pakin kantava osa.**
Valmistajat, jotka kohtelevat lausetta "olemme sinetöineet
vapautustietueemme" vastineena lauseelle "olemme todistaneet
ruokamme turvalliseksi", väärinkäyttävät primitiiviä. Pakin on
sanottava selvästi: *tämä on valmistajan samanaikaisten väitteiden
kiistämättömyysprimitiivi vapautuksessa, ei todiste turvallisuudesta,
ei korvike sääntelijän valvonnalle, eikä puolustautuminen
heterogeenisen saastumisen, toimitusketjupetoksen tai vapautuksen
jälkeisen väärinkäsittelyn vikatilanteita vastaan, jotka ovat
tappaneet ihmisiä aiemmissa epidemioissa.*

---

## Mitä tämän pakin TÄYTYY KIELTÄYTYÄ sinetöimästä

Pakki on konfiguroitu hylkäämään seuraavat tosiasiakuviot, vaikka
voimassa olevat valmistajan allekirjoitusoikeudet omaava käyttäjä
lähettäisi ne:

- **Minkä tahansa työntekijän, esimiehen, laadunvarmistusta tekevän
  henkilöstön, vierailevan tarkastajan tai kolmannen osapuolen
  tarkastajan henkilökohtainen tunnistaminen.** Nimet, työsuhdetunnukset,
  henkilökortin numerot, henkilötunnukset, kotiosoitteet,
  henkilökohtaiset puhelinnumerot — mitään näistä ei näy julkisessa
  sinetissä. Roolit ovat julkisia; henkilö-rooli-sidokset sinetöidään
  erikseen ja niitä voi tutkia sääntelyprosessin alaisuudessa.
  Työntekijöiden turvallisuus kostotoimia ja häirintää vastaan on
  kantava rajoite; elintarviketurvallisuuden attestoinnin voi
  tehdä roolitasolla. (R1)

- **Tarkka tuotantolaitoksen sijainti.** Tuotantolaitoksen alue
  (osavaltio tai usean osavaltion alue) on hyväksyttävää; tarkka
  katuosoite, GPS-koordinaatit tai mikä tahansa tunnistin sellaisella
  granulaarisuudella, joka riittää tuotantolaitoksen fyysiseen
  tunnistamiseen kartalta, EI ole hyväksyttävä. Sääntelyn
  toimipaikkanumero on sääntelijän kahva tuotantolaitokselle;
  fyysisen turvallisuuden ja työntekijöiden turvallisuuden näkökohdat
  puhuvat julkisen osoitteen julkaisemista vastaan Bitcoinissa. (R2)

- **Yksittäiset tuotantovuoron henkilöstökuviot.** Vuorojärjestelyt,
  yksittäisten työntekijöiden rotaatiot, linjaoperaattoreiden
  henkilökohtaiset tunnukset — mitään näistä ei näy sinetissä.
  Yksittäisten työntekijöiden elämänkuvioita ei saa pystyä
  johtamaan julkisesta attestaatiosta. (R3)

- **Toimittajatunnisteet, jotka vaarantavat sopimukset.**
  Toimittajien nimet, toimittajien tuotantolaitosten sijainnit,
  toimittajien eräkoodit (paitsi toimitusketjun saastumistapauksessa,
  jossa toimittajan saastuneen erän nimeäminen on tarpeen
  kansanterveydellisistä syistä ja käsitellään erillisen sinetöidyn
  julkaisun kautta) EI julkaista vapautussinetissä. Monet
  toimitussopimukset sisältävät salassapitomääräyksiä; sinetti ei
  riko niitä oletusarvoisesti. (R4)

- **Asiakaslistat ja jakelukohteet korkeaa tasoa pidemmälle.**
  Korkean tason alueellinen yhteenveto on hyväksyttävää; tietyt
  asiakaslistat (vähittäismyyjät, jakelukeskukset,
  ammattikeittiötilit) EIVÄT ole hyväksyttäviä. Asiakkaan identiteetti
  on sopimuksellisesti luottamuksellinen ja kilpailullisesti
  herkkä; sääntelijä saa asiakaslistan vakiintuneiden
  takaisinvedon koordinointikanavien kautta. (R5)

- **Turvallisuusväitteet tai oikeudelliset johtopäätökset.** Pakki
  ei sinetöi väitteitä kuten "tämä tuote on turvallinen", "tämä
  erä täyttää kaikki sovellettavat elintarviketurvallisuusstandardit",
  "tämä on GRAS tähän käyttöön" tai mitään muuta turvallisuuteen tai
  oikeuteen liittyvää johtopäätöstä. Pakki ankkuroi testitietueen ja
  vapautuspäätöksen, EI turvallisuusjohtopäätöstä. (R6)

- **Työntekijän valitukseen tai ilmiantajaan liittyvät
  uudelleentunnistuskuviot.** Pakki kieltäytyy julkaisemasta mitään
  kuviota, joka voisi uudelleentunnistaa työntekijän, joka on
  jättänyt OSHA-, USDA- tai yhtiön sisäisen valituksen
  elintarviketurvallisuus- tai työpaikkaturvallisuuskäytäntöjä
  vastaan. Tällaiset valituksen tekijät ovat suojattuja FSMA:n
  pykälän 402 ja rinnakkaisten säädösten nojalla; sinetti ei saa
  muodostua uudelleentunnistusvektoriksi. Ilmiantajien
  attestaatioilla on oma pakkinsa (`examples/whistleblower-manifest`),
  jossa on sen käyttötarkoitukseen viritetyt kieltäytymissäännöt.
  (R7)

- **Sinetöinti kenenkään muun kuin vapautuksen tekevän valmistajan
  valtuutetun päämiehen toimesta.** Kolmannen osapuolen sertifioija,
  asiakkaan laadunvarmistustiimi tai riippumaton tarkastaja saa
  käyttää samaa pakkia OMIEN auditointiensa havaintojen
  sinetöimiseen; he EIVÄT saa sinetöidä alkuperäistä
  vapautuspäätöstä valmistajan nimissä. Allekirjoittava päämies
  TOSIASIASSA 08 on ainoa pätevä allekirjoittaja tähän. (R8)

Kieltäytyminen voidaan itsessään sinetöidä tosiasiana ("Tämä
valmistaja pyysi sinetöimään X:n; pakki kieltäytyi
kieltäytymissäännön Y mukaisesti"), mikä luo julkisen tietueen
yritetystä väärinkäytöstä.

---

## Mitä tämä pakki TODELLA sinetöi

8 tosiasiaa vapautuksen hetkellä:

1. **Esimerkki-ilmoitus** — ilmoittaa julkaisun esimerkiksi (oikeat
   attestaatiot poistavat tai korvaavat tämän).
2. **Tuotteen ja erän tunnistus** — tuotteen nimi, kategoria,
   valmistaja, tuotantolaitoksen alue (EI tarkka sijainti),
   HACCP-suunnitelman versio + hash, erän tunnus, tuotanto-/pakkaus-/
   parasta ennen -päivämäärät, kuluttajayksiköiden lukumäärä,
   säilytysvaatimukset, kolme kriittistä valvontapistettä lokitetun
   tietueen hasheineen (keiton letaliteetti, jäähdytyksen
   stabilisointi, letaliteetin jälkeinen RTE-ympäristö).
3. **Vapautustestauksen tulokset** — valmiin tuotteen
   mikrobiologiset testit (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), kemialliset / jäämätestit (nitriitit,
   eläinlääkkeiden jäämät, raskasmetallit), allergeeni-
   ristikontaminaation tarkistus, ympäristönvalvonnan yhteenveto,
   kukin täydellisen raportti-PDF:n SHA-256-tiivisteen ja
   nimenomaisen näyte-vs-massa-tulkintarajoitteen kanssa.
4. **Menetelmä ja laboratorion pätevyys** — mitä menetelmää (ja mitä
   menetelmäasiakirjan versiota) käytettiin riviä kohti, mitkä
   laboratoriot suorittivat mitkäkin testit, kunkin laboratorion
   ISO/IEC 17025:2017 -akkreditointitilanne ja todistuksen hash,
   tuoreet pätevyystestin tulokset, riippumattomuusvakuutus, tämän
   erän poikkeamat / uudelleentestaukset / OOS-tietueet.
5. **Vapautuspäätös** — vapautuspäivä, roolitason
   vapautusvaltuutus + vasta-allekirjoitus, päätöstä tukevien
   tietueiden yhteenveto, korkean tason jakelukohteet, vapautuksessa
   tunnustetut vapautuksen jälkeiset velvollisuudet, ajoituksen ja
   peruuttamattomuuden sitoumus.
6. **Takaisinvedon ja markkinoille tulon jälkeisen valvonnan
   sitoumukset** — elintarviketurvallisuuden vastine
   lääkevalvonnalle: sairaussignaalin läpinäkyvyys, takaisinvedon
   toteuttamissitoumukset (24 t / 72 t / 98 %:n kynnysarvot),
   toimitusketjun saastumisvaste, ei-hiljaisia-uudelleentestauksia
   -sitoumus, ei-jälkikäteisspesifikaatiomuutoksia -sitoumus,
   aggregoitu turvallisuussignaalin jakaminen.
7. **Liiteliitteet ja kieltäytymistietue** — korjaavien toimien
   tutkintalokin hash, tuore tarkastushistoria,
   takaisinvetohistoria, tunnetut avoimet ongelmat käytetyissä
   testimenetelmissä, rooli-yksilö-sidonta (sinetöity erikseen,
   hashattu tähän), toimitusketjun takaisinjäljityksen valmius,
   nimenomainen luettelo kieltäytymissäännöistä R1–R8 sekä mahdolliset
   tämän vapautuksen aikana käytetyt kieltäytymiset.
8. **Allekirjoittava päämies** — valmistaja + roolitason
   allekirjoittaja (laadunvarmistuksen johtaja) + roolitason
   vasta-allekirjoitus (tehdaspäällikkö) + kryptografiset
   avaintiedot; perustelut roolitason julkaisulle.

Jokainen tosiasia päättyy kieltäytymisportin sopimukseen: *"Tämä
tosiasia väittää vain X. Se ei väitä Y"* (jossa Y on lähin vikatila
yllä olevasta "EI TEE"-osiosta).

---

## Mitä vastaan tämä pakki puolustaa

- **Vapautustestien tulosten hiljainen takautuva muokkaaminen.**
  Kaikki testiraportin PDF:t on hashattu. Uudelleenhashaus
  vapautuksen jälkeen paljastaa minkä tahansa muokkauksen.
- **Riidat siitä, mitä menetelmiä, mitä menetelmäasiakirjan versioita
  ja mitä laboratorioita käytettiin.** TOSIASIA 04 jäädyttää
  menetelmän ja laboratorion akkreditointitilanteen vapautuksessa.
  Myöhemmät väitteet kuten "käytimme itse asiassa MLG 4.13:a, emme
  4.12:a" ovat julkisesti kumottavissa.
- **Takautuva erän uudelleenmäärittely epäonnistuneeksi.** Jos
  vapautustestin tulos oli itse asiassa rajatapauksen LÄPÄISY, joka
  uudelleenluokitellaan EPÄONNISTUMISEKSI vapautuksen jälkeen,
  sinetöidyt raportin hashit todistavat, mitä alkuperäinen
  tulos-PDF sanoi. Symmetrisesti, rajatapauksen OOS, joka hiljaa
  uudelleentestataan LÄPÄISYKSI ilman julkistamista, on
  havaittavissa, jos TOSIASIAN 06 ei-hiljaista-uudelleentestausta
  -sitoumus verrataan myöhemmin sinetöimättömään muutokseen.
- **Takaisinvedon laajuuden hiljainen minimointi.** TOSIASIAN 06
  takaisinvetositoumukset (24 t:n ilmoitus, 72 t:n aloitus,
  98 %:n palautuskyky) on sinetöity; niiden noudattamatta jättäminen
  on julkisesti havaittavissa.
- **Korjaavien toimien historian jälkikäteinen
  uudelleenkertominen.** TOSIASIAN 07 korjaavien toimien lokin
  hash jäädyttää sen, mitä yhtiö SANOI tehneensä
  EMP-presumptiivin jälkeen; myöhemmät väitteet kuten "teimme
  enemmän/vähemmän kuin sen" ovat julkisesti kumottavissa.
- **Liitteiden valikoiva poisjättäminen.** TOSIASIA 07 luettelee
  odotetut julkistuskategoriat (tarkastushistoria,
  takaisinvetohistoria, menetelmäneuvonnan tarkastelu,
  takaisinjäljityksen valmius); tyhjä kategoria on nimenomaisesti
  attestoitava ("ei mitään vapautushetkellä"), jotta myöhempi
  "emme tienneet, että se on relevanttia" on julkisesti
  kumottavissa.
- **Toisen laboratorion akkreditointitilanteen korvaaminen.**
  TOSIASIA 04 jäädyttää kunkin laboratorion ISO 17025 -laajuuden ja
  todistuksen hashin vapautuksessa; myöhempi ei-akkreditoidun
  laboratorion korvaaminen on julkisesti havaittavissa.

Pakki **ei** puolusta samanaikaista korruptiota vastaan — tiimi, joka
tahallisesti sinetöi vääriä testituloksia vapautushetkellä, tuottaa
kryptografisesti pätevän sinetin vääristä testituloksista. Primitiivi
on tästä rehellinen: se on valmistajan samanaikaisten väitteiden
kiistämättömyysprimitiivi, ei todiste siitä, että nuo väitteet ovat
oikein.

---

## Historiallisen kuolleisuuden ennakkotapauksia

Pakki olisi tuottanut hyödyllisen ankkurin — *ei ratkaisua* —
aiemmissa elintarviketurvallisuuden epäonnistumisissa. Yksilöiden
panettelun välttämiseksi (useimmat elintarviketurvallisuuden
epäonnistumiset ovat yritystason, eivät yksilötason; jotkut
oikeuden käyvät rikosoikeudellisesti ja jotkut eivät) nämä viittaukset
kuvaavat epidemian vuoden ja patogeenin mukaan ja nimeävät mukana
olleen organisaation vain silloin, kun saastuminen on ollut
julkisesti vahvistettu takaisinvetoilmoituksella tai oikeuden
päätöksellä.

- **Kiinan melamiini-väärennös äidinmaidonkorvikkeessa ja
  maitotuotteissa vuonna 2008 (Sanlu Group + muut).** Vähintään
  kuusi imeväiskuolemaa ja ~300 000 sairastumistapausta liittyivät
  melamiini-tartuntoihin maitotuotteissa, joiden tarkoituksena oli
  petollisesti pumpata näennäistä proteiinipitoisuutta Kjeldahlin
  typpiin perustuvissa määrityksissä. Tuomiot seurasivat Kiinan
  oikeudessa, mukaan lukien kuolemantuomioita. *Sinetti ei olisi
  estänyt tätä* — melamiini oli vakio-analyyttipaneelin
  ulkopuolella. Sinetti olisi sitoutunut julkisesti siihen, MIKÄ
  paneeli OLI, mikä olisi tehnyt tapahtuman jälkeisen rutiiniseulonnan
  laajennuksen laajuudesta forensisesti selvän.

- **Euroopan STEC O104:H4 -epidemia vuonna 2011 (sarvelaisen
  versot jäljitettiin saksalaiseen maatilaan).** 53 kuolemaa,
  ~3 950 sairastumistapausta useissa Euroopan maissa; jäljitettiin
  lopulta Egyptistä tuotuihin sarvelaisen siemeniin, jotka idätettiin
  saksalaisessa tuotantolaitoksessa. Takaisinjäljitystä haittasi
  epäjohdonmukainen eräkohtainen dokumentaatio monikansallisessa
  toimitusketjussa. *Sinetti ei olisi estänyt siemenerän
  saastumista* (saastuminen oli idättäjän testejä edeltävällä
  portaalla); se olisi ankkuroinut sen, mitä idättäjän
  vapautustestit väittivät, ja jos käytetty siementuojan tasolla,
  mitä tuotujen siementen käsittely väitti, mikä olisi nopeuttanut
  takaisinjäljitystä.

- **Blue Bell Creameriesin Listeria monocytogenes -epidemia vuonna
  2015 (Yhdysvallat).** 3 kuolemaa, 10 sairastumistapausta useissa
  osavaltioissa; johti kansalliseen takaisinvetoon ja vuoden 2020
  liittovaltion rikosoikeudelliseen tuomioon Blue Belliä vastaan
  rikkomus-elintarviketurvallisuussyytteistä, joiden seurauksena
  yhtiö teki lykätyn syyttämissopimuksen ja maksoi 19,35 miljoonaa
  dollaria. Myöhemmin siviiliriita-asioita. *Sinetti ei olisi
  estänyt* tuotantolaitoksen sisäistä Listeria-ympäristösaastumista;
  se olisi forensisesti ankkuroinut ympäristönvalvontaohjelman
  tietueet, mikä olisi tehnyt jälkikäteisestä kysymyksestä "mitä EMP
  osoitti epidemiaa edeltäneinä kuukausina" vastattavissa peukaloinnin
  paljastavaa aikaleimattua tietuetta vastaan eikä myöhemmin
  tuotettuja asiakirjoja vastaan.

- **Useita osavaltioita koskevat STEC O157:H7 -epidemiat vuonna
  2018, jotka liittyivät romainsalaattiin (Yuman viljelyalue,
  sitten Salinasin viljelyalue).** Vähintään 5 kuolemaa ja ~210
  sairastumistapausta useissa kyseisen vuoden epidemioissa.
  Takaisinjäljitystä mutkisti sekoitettujen lähteiden pussituotanto.
  *Sinetti ei olisi estänyt* saastumista pelto-/kasteluveden
  tasolla (valmistajaa edeltävällä portaalla); se olisi
  forensisesti ankkuroinut kunkin jalostajan saapumistestauksen ja
  vapautustestauksen tietueen, mikä olisi nopeuttanut
  takaisinjäljitystä ja tehnyt julkisesta tietueesta
  kryptografisesti puolustuskykyisemmän myöhempiä riitoja vastaan.

- **Peanut Corporation of American Salmonella Typhimurium -epidemia
  (2008–2009, Yhdysvallat).** 9 kuolemaa, ~714 sairastumistapausta;
  johti vuosien 2014–2015 PCA:n johtajien liittovaltion
  rikosoikeudellisiin tuomioihin, mukaan lukien 28 vuoden vankeustuomio
  toimitusjohtajalle salaliitto- ja vastustamissyytteistä. *Sinetti
  ei olisi estänyt* saastumista, positiivisten tuotantolaitoksen
  sisäisten Salmonella-testien aliarviointia tai johtajatason
  päätöstä lähettää tuotetta niitä positiivisia havaintoja vastaan.
  Se OLISI tehnyt forensisesti selväksi oikeudessa, mitä
  testitulokset SANOIVAT sillä hetkellä, kun ne tuotettiin — mikä
  olisi tehnyt syyttäjän jutusta samanaikaisia vääriä
  tarinasähköposteja vastaan huomattavasti paremmin ankkuroidun
  asiakirjamuokkauksia vastaan.

Kaikissa näissä tapauksissa pakki olisi tarjonnut puhtaamman
forensisen aikajanan. Yhdessäkään näistä tapauksista pakki ei
yksinään olisi estänyt kuolemia. Sinetti on forensinen infrastruktuuri,
ei ennaltaehkäisevä infrastruktuuri. Tämä erottelu on pakin
rehellisyys.

---

## Milloin tätä pakkia kannattaa käyttää

- Valmistustoimintasi käyttää vakaata HACCP-/Preventive-Controls-
  ohjelmaa ja haluaa lisätä Bitcoiniin ankkuroidun julkisen
  attestaation peukaloinnin paljastavana kerroksena olemassa olevan
  vapautusdokumentaation työnkulun päälle.
- Olet pieni tai keskisuuri valmistaja tai valmistaja
  lainkäyttöalueella, jolla on heikompi sääntelyinfrastruktuuri, ja
  haluat ankkuroida eräasiakirjoja globaalisti todennettavaa
  aikajanaa vasten — vientimarkkinoiden luottamuksen, asiakkaan
  auditointivasteen tai vapaaehtoisiin läpinäkyvyysaloitteisiin
  osallistumisen vuoksi.
- Olet elintarviketurvallisuustarkastaja tai kolmannen osapuolen
  sertifioija ja haluat julkaista peukaloinnin paljastavan
  auditointihavainto-sinetin allekirjoituksen hetkellä, jotta
  auditointihavaintoja ei voida hiljaa muuttaa myöhemmin valmistajan
  ja sertifioijan välisellä sopimuksella.
- Odotat tämän erän kohtaavan merkittävää alavirran tarkastelua
  (vientimarkkina, korkean riskin kategoria kuten RTE-liha tai
  äidinmaidonkorvike, uusi raaka-aine, tuore takaisinvetohistoria).
- Voit julkaista luetellun tosiasiajoukon rikkomatta
  kieltäytymissääntöjä R1–R8. Jos tosiasiasi vaatisivat R1–R8:n
  rikkomista, älä käytä pakkia; korjaa datasyötteet ensin.
- Valmistajan asianajaja on tarkastanut julkaisusuunnitelman. Eräs
  tunnistetta kantavan artefaktin julkinen julkaiseminen sisältää
  tuotevastuun altistumisen vaikutuksia; asianajajan tarkastus ei ole
  valinnaista.

## Milloin tätä pakkia EI saa käyttää

- **Älä käytä korvikkeena FSMA-/FSIS-/EU-sääntelytietueille.** Sinetti
  on *lisäys*, ei korvaaja. Lakimääräiset vapautustietueesi,
  HACCP-suunnitelmasi, CCP-lokisi ja takaisinvetosuunnitelmasi
  pysyvät muuttumattomina.
- **Älä käytä turvallisuusväitteenä.** Hyväksytyn vapautustietueen
  sinetöinti ei vahvista, että tuote on turvallinen; se vahvistaa,
  että tietueella oli tämä tavusisältö tällä hetkellä.
  Kieltäytymissääntö R6 hylkää minkä tahansa
  turvallisuusjohtopäätöksen.
- **Älä käytä toimittajatunnisteiden, asiakaslistojen,
  työntekijöiden nimien tai tuotantolaitosten osoitteiden
  julkaisemiseen.** Kieltäytymissäännöt R1–R5 ovat olemassa
  ihmisturvallisuuden ja sopimuksen syistä; älä muokkaa pakkia
  niiden kumoamiseksi neuvottelematta asianajajan kanssa.
- **Älä käytä paineen alla sinetöidäksesi ennen vapautustestauksen
  valmistumista.** Osittaisten tietojen sinetti antaa väärän kuvan
  vapautuspäätöksen tilasta.
- **Älä käytä oikeutusteatterina.** Sinetti huonosti suunnitellusta
  näytteenotto-suunnitelmasta tai huonosti valitusta
  analyyttipaneelista on pysyvä julkinen tietue puutteellisuudesta,
  ei puolustus sitä vastaan. Primitiivi leikkaa molempiin suuntiin;
  se on sen rehellisyys.
- **Älä käytä aktiivisen takaisinvetotilanteen aikana sääntelijän
  takaisinvedon koordinoinnin korvikkeena.** Uusi MYRIAM-julkaisu,
  joka ankkuroi takaisinvedon laajuuden, on asianmukainen sen
  JÄLKEEN, kun sääntelijän koordinoima takaisinveto on aloitettu;
  se ei ole korvike sääntelijän takaisinvetokanavalle.

## Kuinka haarauttaa tämä pakki todelliseen vapautukseen

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # korvaa fiktiivinen sisältö oikealla erällä
                           # sovella kieltäytymissääntöjä R1-R8 läpi
bash build/seal.sh         # SINETÖI ENNEN ensimmäistä jakeluliikettä
python3 build/verify.py    # vahvista
```

**KRIITTINEN AJOITUS:** sinetöi laadunvarmistuksen vapautushetkellä,
ENNEN kuin erä jaetaan (ennen kuin ensimmäinen rekka lähtee
tuotantolaitoksesta). Sinetillä jakelun alkamisen jälkeen on
edelleen arvoa, mutta se ei ankkuroi jakelua edeltävää tilaa
puhtaasti. Oikea ikkuna on laadunvarmistuksen vapautusallekirjoituksen
ja ensimmäisen jakeluliikkeen välissä.

**KRIITTINEN TARKASTELU:** ennen sinetöintiä, käy julkaisu läpi
toisen laadunvarmistuksen tarkastajan (ei johtajan) ja yhtiön
asianajajan kanssa. Kun on sinetöity, julkaisu on pysyvä.

## Integraatio olemassa olevaan elintarviketurvallisuusinfrastruktuuriin

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  Sinetöidyn julkaisun URL tai IPFS-CID voidaan viitata Food Safety
  Plan -dokumentaatiossa tämän erän julkisena attestaatio-
  artefaktina.
- **USDA FSIS HACCP-suunnitelmat ja vapautustietueet.** Sinetöity
  vapautustietue sijaitsee FSIS:n vaatimien HACCP-tietueiden
  rinnalla; sinetti viittaa HACCP-suunnitelman version hashiin
  (TOSIASIA 02), joten myöhemmät riidat siitä, mikä suunnitelman
  versio oli voimassa, ovat julkisesti kumottavissa.
- **Codex Alimentarius / HACCP-periaatteet** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Sinetti sitoutuu seitsemän periaatteen HACCP-
  tuotoksiin (vaara-analyysi, CCP:t, kriittiset rajat, valvonta,
  korjaavat toimet, tarkistaminen, kirjaaminen) tälle erälle.
- **ISO 22000:2018 (Food Safety Management Systems).** Sinettiä voi
  viitata osana johdon katselmuksen näyttöjälkeä; se ei korvaa
  ISO 22000 -sertifiointia.
- **FSSC 22000 v6 -sertifiointimalli.** Yhteensopiva lisäävänä
  läpinäkyvyyskerroksena; FSSC:n auditoija voi tarkistaa sinetin
  valvonnan aikana.
- **EU:n asetus (EY) 178/2002 (Yleinen elintarvikelaki) Artikla 18
  (jäljitettävyys) ja Artikla 19 (takaisinvedon ilmoitus).** Sinetti
  sitouttaa valmistajan yhden portaan taaksepäin -takaisinjäljityksen
  valmiuden (TOSIASIA 07) ja takaisinvetositoumukset (TOSIASIA 06);
  se ei korvaa lakimääräistä Artikla 19 -ilmoitusvelvollisuutta.
- **EU:n hygieniapaketti (asetukset 852/2004, 853/2004, 854/2004,
  882/2004).** Yhteensopiva; sinetti viittaa hygieniapaketin HACCP-
  ja omavalvontatietueiden vastineisiin.
- **BRCGS / SQF yksityiset standardimallit.** Yhteensopivia
  lisäävänä läpinäkyvyyskerroksena.
- **Kansanterveyden valvontajärjestelmät (CDC PulseNet, FoodNet,
  IFSAC; EU EFSA / ECDC).** Sinetin suoraa toimialuetta
  ulkopuolella, mutta TOSIASIA 06 sitouttaa valmistajan
  osallistumaan ja sinetöimään minkä tahansa signaalin
  korrelaatiotapahtumat uusina MYRIAM-julkaisuina.

## Mitä tämä pakki EI korvaa

- FDA Food Facility Registration tai USDA FSIS
  Establishment-hyväksyntä.
- Kirjallinen Food Safety Plan / HACCP-suunnitelmasi FSMA:n /
  FSIS:n alla.
- CCP:n valvontalokit ja korjaavien toimien tietueet.
- ISO 17025 -laboratorioakkreditointivalvonta.
- Pätevyystestiohjelmat.
- Sääntelijän tarkastus (FSIS:n jatkuva tarkastus, FDA:n säännöllinen
  tarkastus, EU:n toimivaltaisen viranomaisen tarkastus).
- Kansanterveyden valvonta (CDC, EFSA, ECDC, kansalliset vastineet).
- Takaisinvedon koordinointikanavat (FDA Reportable Food Registry,
  FSIS:n takaisinvedon koordinointi, EU RASFF, kansalliset vastineet).
- Työntekijöiden turvallisuus- ja elintarviketyöntekijöiden
  koulutusohjelmat.

## Miksi tämä pakki on olemassa v0.4.0+

Tämä on yksi myriam-kitin mukana toimitetuista esimerkeistä. Se
noudattaa rajoiteperusteista README-rakennetta, jonka validoitiin
`~/Genesis/calc/PROMPT_LIBRARY_v0.md`-dokumentissa dokumentoidulla
autoresearch-prosessilla — rajoiteperusteinen kehotusvariantti sai
korkeimman pisteen painotetussa kriteeristössä useilla esimerkkialueilla,
koska elintarviketurvallisuuden attestaatio on juuri se ala, jossa
sen liioittelu, mitä sinetti todistaa, on vaarallista: ihmisiä on
kuollut ja kuolee epäonnistumisissa, joita sinetti ei voi estää.
Aloitusosiot ovat pakin kantavia osia; manifestin sisältö on helppo
osa.

Pakin oletukset ovat tarkoituksellisesti konservatiivisia työntekijöiden
nimien julkaisemisessa, konservatiivisia tuotantolaitoksen sijainnin
tarkkuudessa, konservatiivisia toimittaja- ja asiakastunnistuksessa ja
aggressiivisia "tämä ei vahvista turvallisuutta" -varauksessa.
Elintarviketurvallisuusyhteisöllä on dokumentoitu historia
liioitellusta sertifiointikielestä; pakki on oletuksena
asennossa, joka todennäköisimmin ei tulkita turvallisuustakuuksi.
Valmistajat lainkäyttöalueilla, joilla erityiset julkiset
julkaisuvaatimukset eroavat, voivat muuttaa haaraansa
vastaavasti, mutta oletuskieltäytymiset suosivat työntekijöiden
turvallisuutta ja rehellistä laajuutta.

## Lisenssi

Public domain (CC0). Haarauta se. Kreditointia ei vaadita.
