*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Oikeuden todisteketjun säilytysketjun sinettipakki

Avaimet käteen -mallinen myriam-kit-esimerkki forensisille
hankintatiimeille — tietokoneforensiikan tutkijoille,
mobiililaitteiden poimintateknikoille, kehokameran todisteiden
säilyttäjille, laboratorioiden esimiehille — jotka haluavat julkaista
Bitcoiniin ankkuroidun, peukaloinnin paljastavan sinetin siitä,
*mitkä tavut hankittiin* ja *milloin*, digitaalisen todisteen
hankintahetkellä, jotta säilytysketjun kiistoilla on julkinen ankkuri.

---

## Mitä tämä pakki EI tee (lue ensin)

Sinetti on kryptografinen aikaleima siitä, MITKÄ FORENSISET KUVAT
hankittiin, MILLOIN ne hankittiin, MINKÄ VIRASTON toimesta, MINKÄ
ETSINTÄLUVAN nojalla, ja MINKÄ METODOLOGIAN kautta. Se ei voi
vastata mihinkään tapausta koskevaan kysymykseen tämän lisäksi.
Seuraavat asiat ovat **sinetin alueen ulkopuolella**:

1. **Hyväksyttävyys liittovaltion todistelusääntöjen (tai muun
   todistelukoodin) nojalla.** Sinetti ankkuroi tavut ja aikaleimat.
   Onko todiste hyväksyttävä — FRE 901 -autentikoinnin, FRE 702
   -asiantuntijatodistuksen / Daubertin, FRE 403
   -ennakkoluulopainotuksen tai osavaltiotason vastaavan nojalla —
   on oikeudellis-prosessuaalinen kysymys. Täydellisesti sinetöity
   hankinta voidaan silti todeta hyväksymättömäksi; sinetöimätön
   hankinta voidaan silti hyväksyä. Sinetti on lisätodiste
   eheydestä, ei korvike tuomioistuimen hyväksyttävyysratkaisulle.

2. **Oliko takavarikko laillinen.** Neljännen lisäyksen noudattaminen,
   etsintäluvan pätevyys, soveltamisalan noudattaminen,
   poissulkemissäännön sovellettavuus — kaikki nämä ovat
   ylävirrassa sinettistä. Sinetti tallentaa, että hankinta
   tapahtui etsintäluvan FICT-SW-2026-0188 nojalla; oliko
   etsintälupa laillisesti annettu ja laillisesti annettu tiedoksi,
   on tuomioistuimen asia.

3. **Onko todiste syyttävä, vapauttava tai neutraali.** Sinetti
   ankkuroi hash-arvot; tulkinnat siitä, mitä nämä hash-arvot
   sisältävät, kuuluvat forensiseen tutkimusraporttiin, joka on oma
   asiakirjansa, jolla on oma todistus- ja todistelukäytäntönsä.
   Sinetti kieltäytyy sinetöimästä "FAKTAA N: epäillyn kannettava
   sisälsi syyttävää materiaalia" — katso kieltäytymissääntö R4.

4. **Onko säilytysketju menettelyllisesti oikea sovellettavan
   osavaltion todistelulain nojalla.** Sinetti tallentaa viraston
   samanaikaisen säilytystapahtumalokin (FAKTA 05). Täyttääkö tämä
   loki tietyn osavaltion säilytysketjuvaatimukset, on
   tuomioistuimen asia todisteluistunnossa.

5. **Oliko forensinen metodologia luotettava.** Daubert ja sen
   jälkeläiset (ja osavaltiotason analogit, kuten Frye, missä se
   yhä soveltuu) arvioivat metodologista luotettavuutta. Sinetti
   tallentaa, MITKÄ työkalut ja versiot käytettiin (FAKTA 04);
   täyttävätkö nämä työkalut tietyn tuomioistuimen
   luotettavuusstandardin, on tuomioistuimen asia. Työkalujen
   virheitä on dokumentoitu hankinnan jälkeen aiemmissa
   tapauksissa; sinetin rooli on tehdä versio-ja-binääri-hash
   -tietueesta julkisesti kumottavissa, ei taata työkaluja itseään.

6. **Oliko todistetta peukaloitu ENNEN hankintaa.** Sinetti ankkuroi
   tavut kuvantamishetkestä eteenpäin. Jos epäilty, virkamies tai
   kolmas osapuoli muutti lähdetlaitteen ennen kuvantamista,
   sinetti ei voi havaita sitä — se sinetöi muutetut tavut samalla
   eheydellä, jolla se sinetöisi alkuperäisen. Sinetin arvo alkaa
   kuvantamisen aikaleimasta.

7. **Noudatettiinko etsintäluvan soveltamisalaa.** Etsintäluvan
   ohje määrittelee, mitä voidaan hankkia; sinetti tallentaa, mitä
   HANKITTIIN. Ylittikö hankinta etsintäluvan soveltamisalan, on
   jälleen oikeudellinen kysymys omalla oikeussuojakeinollaan
   (sopivan osavaltion menettelyn mukainen vaatimus näytön
   sulkemisesta).

8. **Tutkinnan minkä tahansa yksityisen osapuolen
   uudelleentunnistaminen.** Sinetti kieltäytyy julkaisemasta mitään
   nimeä, tunnistetta tai sormenjälkeä, joka voisi
   uudelleentunnistaa epäillyn, vastaajan, uhrin, todistajan tai
   tilan haltijan. Asianumeroviite on sopiva kahva osapuolille,
   joilla on asianosaisuusasema paikantaa tapaus.

**Edellä oleva rehellisiä rajoja koskeva osio on tämän pakin
kantava osa.** Forensiset tiimit, jotka uskovat sinetöinnin
vastaavan hyväksyttävyyttä, käyttävät sitä kilpenä. Pakin täytyy
sanoa selvästi: *tämä on hankintahetken kiistämättömyysprimitiivi,
ei todiste laillisesta hankinnasta, metodologisesta luotettavuudesta
tai tuomioistuimen tunnustamasta säilytysketjusta.*

---

## Mitä tämän pakin TÄYTYY KIELTÄYTYÄ sinetöimästä

Pakki on konfiguroitu hylkäämään seuraavat tosiseikkamallit, vaikka
käyttäjä, jolla on pätevä viraston allekirjoitusvaltuus, lähettäisi
ne:

- **Epäiltyjen, vastaajien, uhrien, todistajien tai minkään
  yksityisen kolmannen osapuolen henkilökohtainen tunnistaminen.**
  Asianumeroviite on kahva osapuolille, joilla on asianosaisuus;
  julkinen sinetti ei saa olla uudelleentunnistamisindeksi.
- **Forensisten tutkijoiden tai muun viraston henkilöstön
  henkilökohtaiset nimet julkisessa sinetissä.** Roolit ovat
  julkisia; henkilö-rooli-sidokset sinetöidään erikseen ja ne ovat
  selvitettävissä tuomioistuinprosessin nojalla.
- **Tiedostotason hash-arvot (tai sormenjäljet) epäillyistä lasten
  seksuaalisen hyväksikäytön materiaaleista, biometrisistä
  malleista tai muista haavoittuvia henkilöitä uudelleen
  tunnistavista tiedoista — edes hash-arvona.** Yksittäisen
  tiedoston SHA-256 on pysyvä haettavissa oleva tunniste; sen
  julkaiseminen julkisessa pääkirjassa voi uudelleenuhriuttaa
  henkilöitä yksityisten tietokantojen korrelaation kautta.
  Kuvatason (forensisen-kuvatason) hash-arvot kokonaisista levyistä
  ovat hyväksyttäviä; tällaisen materiaalin tiedostotason
  hash-arvot eivät KOSKAAN ole hyväksyttäviä.
- **Tutkimustulokset, tulkinnat, mielipiteet tai johtopäätökset
  siitä, mitä tavut tarkoittavat.** Sinetti ankkuroi, MITKÄ TAVUT
  hankittiin ja MILLOIN. Tulkinta kuuluu selvitettävään
  tutkimusraporttiin, ei peukaloinnin paljastavaan julkiseen
  pääkirjaan.
- **Väitteet hyväksyttävyydestä tai mistä tahansa muusta
  oikeudellisesta johtopäätöksestä** ("tämä todiste on
  hyväksyttävä," "etsintälupa oli laillinen," "säilytysketju oli
  asianmukainen §X.Y:n mukaan"). Oikeudelliset johtopäätökset ovat
  tuomioistuimen tehtäviä.
- **Sinetöinti kenenkään muun kuin hankkivan viraston valtuutetun
  pääosapuolen toimesta.** Puolustuksen asiantuntija voi käyttää
  pakkia sinetöidäkseen oman riippumattoman manifestin
  tarkistuksensa; he eivät voi sinetöidä ALKUPERÄISTÄ hankintaa
  hankkivan viraston nimissä.
- **Rooli-henkilö-sidokset julkisen sinetin sisällä.** Sidokset
  sinetöidään erillisessä kumppanitietueessa (hashattu FAKTAAN 05)
  viraston pääsynvalvonnan alaisuudessa.
- **Takavarikkoa edeltävät tai etsintälupaa edeltävät tutkinnalliset
  tosiseikat.** Ilmoittajien lausunnot, etsintälupaa edeltävä
  valvonta, rinnakkaisrakennuksen syötteet — mikään näistä ei kuulu
  hankintasinettiin. Sinetin soveltamisala on hankintatapahtuma.

Kieltäytyminen itsessään voidaan sinetöidä tosiseikkana ("Tämä
virasto pyysi X:n sinetöintiä; pakki kieltäytyi kieltäytymissäännön
Y mukaisesti"), mikä luo julkisen tietueen yrityksestä väärinkäyttää.

---

## Mitä tämä pakki TEKEE sinetöi

8 tosiseikkaa hankintahetkellä:

1. **Esimerkki-ilmoitus** — julistaa julkaisun esimerkiksi (todelliset
   vakuutukset poistavat tai korvaavat tämän).
2. **Hankintakonteksti** — asianumero, etsintälupaviite, hankkiva
   virasto, pyytävä viranomainen, takavarikko- ja hankinta-aika ja
   -päivä, hankintapaikka (takavarikkopaikka on redaktoitu
   erikseen sinetöityyn kumppanitietueeseen, jotta vältetään tilan
   uudelleentunnistus).
3. **Todistemanifesti** — forensista-kuva-kohdetta kohden: SHA-256
   hash, tiedostokoko, lähdelaitteen anonymisoitu tunniste,
   hankintamenetelmä, forensinen kuvaformaatti.
4. **Hankintamenetelmä** — forensisten työkalujen nimet ja tarkat
   versiot (työkalubinaaristen hash-arvojen kanssa), kirjoituseston
   merkki/malli ja laiteohjelmisto, NIST CFTT
   -tarkistusviite, käytetty tarkistusmenettely, kuvaformaatin
   valinta.
5. **Säilytysketjun loki** — tapahtumakohtainen aikajana alkuperäisestä
   takavarikosta kuvantamisen loppuun, säilyttäjät tunnistettu
   ROOLIN (ei nimen) perusteella, erikseen sinetöityjen
   kumppanitietueiden hash-arvojen kanssa (rooli-henkilö-sidos,
   kuljetuksen GPS-loki, todistekaapin käyttöloki,
   peukalointisinettivalokuvat jne.).
6. **Tutkijan pätevyys roolin mukaan** — hallussa olevat
   sertifikaatit, jatkokoulutuksen tila, aiempi
   asiantuntijatodistuskokemuksen määrä, Daubert-altistus,
   eturistiriitailmoitukset — kaikki roolitasolla, ei
   henkilökohtaisia.
7. **Kumppani-ilmoitukset ja kieltäytymistietue** — rinnakkaiset
   tutkimukset, vireillä olevat etsintäluvan haasteet,
   näytön-sulkemisvaatimukset, käytössä oleva etuoikeussuodatin /
   saastutustiimi-protokolla, aiemmat hankintayritykset, toimittajan
   virhejäljityksen tarkistus; eksplisiittinen luettelo malleista,
   joita pakki kieltäytyi sinetöimästä.
8. **Allekirjoittava pääosapuoli** — hankkivan viraston tunniste +
   rooli-tason allekirjoittaja (johtava tutkija) + rooli-tason
   yhteissallekirjoittaja (yksikön esimies) + kryptografiset
   avaintiedot.

Jokainen tosiseikka päättyy kieltäytymisportin konventioon: *"Tämä
tosiseikka väittää vain X. Se ei väitä Y"* (jossa Y on lähin
vikatila yllä olevasta "EI TEE" -osiosta).

---

## Mitä vastaan tämä pakki puolustaa

- **Forensisen kuvan hiljainen muuttaminen hankinnan jälkeen.**
  Mikä tahansa tavutason muutos mihinkään kuvaan tuottaa erilaisen
  SHA-256:n, ja muutoksen jälkeinen kuva ei vahvistu sinetöidyn
  FAKTA 03 -manifestin kanssa.
- **Väite, että "eri työkaluja käytettiin."** FAKTA 04 tallentaa
  tarkat työkaluversiot työkalubinaaristen hash-arvojen kanssa;
  myöhemmät "käytimme itse asiassa v4.7.0:aa, ei v4.7.1:tä"
  -väitteet ovat julkisesti kumottavissa.
- **Väite, että kirjoituseston ei ollut käytössä tai siinä
  käytettiin eri mallia.** FAKTA 04 jäädyttää kirjoituseston
  manifestin.
- **Säilytyslokin muuttaminen.** Mikä tahansa muutos FAKTA 05
  -säilytystapahtumien aikajanaan (tapahtuman lisääminen,
  poistaminen tai uudelleenaikaleimaaminen) muuttaa FAKTA 05
  -hash-arvoa ja on julkisesti havaittavissa.
- **Eri tutkijan tunnistetietojen korvaaminen.** FAKTA 06
  jäädyttää rooli-tason tunnistetietoprofiilin hankinta-aikana.
- **Kumppani-ilmoitusten valikoiva pois jättäminen.** FAKTA 07
  luettelee odotetut ilmoitusluokat; tyhjä luokka on
  nimenomaisesti todistettava ("ei mitään hankinta-aikana"), joten
  myöhempi "emme tajunneet, että se oli relevanttia" on julkisesti
  kumottavissa.
- **Hankinnan jälkeiset väitteet siitä, että tutkijalla oli
  eturistiriita, jota ei ilmoitettu.** FAKTA 06:n
  eturistiriitailmoitus on jäädytetty hankinnan aikaan; myöhemmät
  haasteet voidaan testata sitä vastaan.

Pakki **ei** puolusta samanaikaista korruptiota vastaan — tiimi,
joka tarkoituksellisesti sinetöi väärää metatietoa hankinta-aikana,
tuottaa kryptografisesti pätevän sinetin väärästä metatiedosta.
Primitiivi on rehellinen tästä: se on kiistämättömyysprimitiivi
viraston samanaikaisille väitteille, ei todiste siitä, että nämä
väitteet ovat oikeita.

---

## Historialliset tai lähes-historialliset tapaukset, joissa pakki olisi auttanut

Pakki olisi tuottanut hyödyllisen ankkurin — *ei ratkaisua* —
aiemmissa tapauksissa, joissa digitaalisen todisteen
säilytysketjusta tuli kiistanalainen näyttökysymys. Vastaajien
nimeämisen välttämiseksi (jotka ovat yksityisiä osapuolia, vaikka
heidät olisi tuomittu), nämä on kuvattu tapaustyypin, ei nimetyn
yksilön mukaan:

- **2010-luvun puolivälin liittovaltion forensista-työkalu-vikaa
  koskeva kiista**, jossa laajalti käytetyssä forensisessa
  kuvantamisvälineessä havaittiin hankinnan jälkeen
  reunatapausvika, joka vaikutti tiettyyn lähdetietovälinetyyppiin.
  Sinetöity hankintamanifesti, jossa on jäädytetyt
  työkalu-versio-ja-binääri-hash-tiedot, olisi antanut puolustuksen
  ja syyttäjän sopia tarkalleen siitä, mitä versiota käytettiin,
  poistaen yhden kiista-akselin.

- **Useat osavaltiotapaukset, joissa oli kiistanalaisia
  mobiililaitteiden poimintatuloksia**, joissa poimintatyökalun
  toimittaja julkaisi myöhemmin virheenkorjauslaastarin ja
  kysymykseksi tuli "vaikuttiko vika tähän tapaukseen". Sinetöity
  metodologia-tosiseikka antaa kysymyksen vastata jäädytettyä
  versiointitietoa vastaan, eikä viraston tämänhetkistä muistia
  vastaan siitä, mitä versiota käytettiin.

- **Kehokameran luovutuskiistat** tapauksissa, joissa BWC-toimittajan
  telakointijärjestelmän väitettiin myöhemmin sallineen kuvamateriaalin
  muokkauksen kuljetuksen aikana. Sinetöity manifesti kehokameran
  arkistosta viraston vastaanottohetkellä ankkuroi, mitkä tavut
  virasto sai telakointijärjestelmästä; myöhemmät muokkaukset
  virastopuolella ovat julkisesti havaittavissa.

- **Hash-törmäyskiistat tietokoneforensiikan tapauksissa**, joissa
  puolustuksen asiantuntija väitti, että MD5 (yhä käytössä joissakin
  vanhemmissa työnkuluissa) oli riittämätön. Sinetöity hankinta,
  joka tallentaa SEKÄ MD5:n että SHA-256:n, antaa SHA-256:n pysyä,
  vaikka MD5 olisi vastaansanottu.

- **Kiistat tutkimusmetodologian kehityksestä hankinnan ja
  oikeudenkäynnin välillä.** Kun tapaus istuu hankinnan ja
  oikeudenkäynnin välillä vuosia, hankinnassa standardina ollut
  metodologia on saattanut olla syrjäytetty oikeudenkäynnin
  aikaan. Sinetöity tietue antaa tuomioistuimen arvioida
  metodologiaa hankintahetkellä nykyisenä olleen standardin, eikä
  myöhemmän standardin mukaan.

Pakki EI olisi ratkaissut taustalla olevia syyllisyyden tai
syyttömyyden kiistoja missään näistä tapaustyypeistä. Se olisi
ratkaissut yhden tietyn näytön ali-kiistan: olivatko tavut,
työkalut ja menettelyt sitä, mitä virasto väittää niiden olleen
sillä hetkellä, jolloin virasto väittää niitä.

---

## Milloin käyttää tätä pakkia

- Virastollasi on vakaa forensinen SOP, ja haluat lisätä
  Bitcoiniin ankkuroidun julkisen vakuutuksen peukaloinnin
  paljastavana kerroksena olemassa olevan paperi-ja-allekirjoitus
  -säilytysketjun päälle.
- Odotat tämän tapauksen koskevan merkittävää puolustuksen
  haastetta forensiselle todisteelle (suuripanoksinen tapaus, uusi
  metodologia, kiistanalaiset työkaluversiot jne.).
- Voit julkaista lueteltavan tosiseikkajoukon paljastamatta PII:tä
  tai haavoittuvia henkilöitä uudelleen tunnistavia tietoja. (Pakin
  kieltäytymissäännöt panevat tämän täytäntöön; jos
  tosiseikkasi vaatisivat kieltäytymissäännön rikkomista, älä käytä
  pakkia.)
- Hankkivan viraston yleinen oikeudellinen neuvonantaja ja
  syyttäjäviranomainen ovat tarkastaneet julkaisusuunnitelman.
  Asianumerolla varustetun artefaktin julkinen julkaiseminen
  vaikuttaa käynnissä oleviin tutkimuksiin; oikeudellisen
  neuvonantajan tarkastus ei ole valinnainen.
- Oman lainkäyttöalueesi puolustuksen tutkintamenettelysäännöt ovat
  yhteensopivia sen kanssa, että virasto pitää erikseen
  rooli-henkilö-sidostietuetta (hashattu FAKTAAN 05). Jos
  lainkäyttöalueesi vaatii julkista tutkijanimien paljastamista,
  sinun täytyy muokata pakkia vastaavasti.

## Milloin EI pidä käyttää tätä pakkia

- **Älä käytä viraston olemassa olevan säilytysketjun
  dokumentaation korvikkeena.** Tämä pakki on *lisäävä*, ei
  korvaava. Viraston CMS, säilytysloki ja tutkintatuotannon
  velvoitteet ovat ennallaan.
- **Älä käytä, jos hankinta sisältää CSAM:ää, biometrisiä malleja
  tai muita haavoittuvia henkilöitä uudelleen tunnistavia tietoja
  tiedostotasolla.** Kuvatason hash-arvot kokonaisista levyistä
  ovat hyväksyttäviä; tällaisen materiaalin tiedostotason
  hash-arvot eivät KOSKAAN ole hyväksyttäviä, ei edes
  kieltäytymissääntö-luopumisen alla. Jos et voi rakentaa
  tosiseikkajoukkoa rikkomatta R3:a, älä käytä pakkia.
- **Älä käytä väittääksesi, että etsintälupa oli laillinen,
  takavarikko oli asianmukainen tai todiste on hyväksyttävä** —
  pakki ei voi tehdä sitä, ja kieltäytymissääntö R5 hylkää minkä
  tahansa tällaisen väitteen.
- **Älä käytä paineen alla sinetöidäksesi ennen kuin hankinta on
  valmis.** Osittaishankinnan sinetti väärentää tilan.
- **Älä käytä julkaisemaan tutkijoiden henkilökohtaisia nimiä**,
  ellei lainkäyttöalueesi sitä erityisesti vaadi ja tutkijasi ole
  yksittäin suostuneet. Oletus on rooli-tason julkaisu.
- **Älä käytä sinetöidyissä tai sinetin alla olevissa tapauksissa**
  ilman tuomioistuimen nimenomaista lupaa. Asianumeron
  julkaiseminen Bitcoinissa on peruuttamatonta; jos tapaus
  myöhemmin sinetöidään, julkista sinettiä ei voi peruuttaa. Pakki
  on tarkoitettu vain julkisen rekisterin hankintoihin.
- **Älä käytä legitimiteettiteatterina.** Virheellisen hankinnan
  sinetti on virheiden pysyvä julkinen tietue, ei niitä vastaan
  puolustautuminen. Primitiivi leikkaa molemmin tavoin; se on sen
  rehellisyys.

## Kuinka forkata tämä pakki todellista hankintaa varten

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # korvaa fiktiivinen sisältö todellisella
                       # sovella kieltäytymissääntöjä R1-R8 läpikotaisin
bash build/seal.sh     # sinetöi kuvantamisen valmistumisen aikana tai juuri sen jälkeen
python3 build/verify.py
```

**Kriittinen ajoitus:** sinetöi VIIMEISTÄÄN tai juuri kuvantamisen
päättymisen jälkeen (FAKTA 05 -tapahtuma E17 esimerkin
aikajanassa). Sinetti kuvantamisen aikana luo osittaishankinnan
tietueen; sinetti paljon myöhemmin luo aukon, jonka aikana virasto
olisi voinut muuttaa kuvia. Oikea ikkuna on heti sen jälkeen, kun
kuvan tarkistus on valmis näyttelysarjan viimeiselle kohteelle.

**Kriittinen tarkistus:** ennen sinetöintiä, käy julkaisu läpi
toisen forensisen tutkijan (ei johtajan) ja viraston
oikeudellisen neuvonantajan kanssa. Kun sinetöity, julkaisu on
pysyvä.

## Integrointi olemassa olevan säilytysketjun infrastruktuurin kanssa

- **Viraston tapaushallintajärjestelmä (CMS).** CMS pysyy viraston
  ensisijaisena tietuejärjestelmänä. Sinetti ei korvaa CMS:ää; se
  sitoutuu CMS:n tallentamiin tavuihin ja metodologiaan, jotta
  CMS:n jälkikäteismuokkaukset ovat julkisesti havaittavissa.
- **Federal Rules of Evidence / Daubert / osavaltioiden
  todistelukoodit.** Sinetti edistää FRE 901 -autentikointitietueen
  toimittamista peukaloinnin paljastavalla eheydellä. Se EI
  tyydytä FRE 702:ta /Daubertia yksin; metodologian luotettavuus
  testataan edelleen todisteluistunnossa.
- **Puolustuksen tutkimus (FRCP 16, Brady, Giglio ja osavaltioiden
  vastaavat).** FAKTAAN 05 hashatut kumppanitietueet
  (rooli-henkilö-sidos, säilytysloki, peukalointisinettivalokuvat
  jne.) pysyvät normaalin tutkimuksen kohteena. Sinetti ankkuroi
  sen, mitä nämä tietueet väittivät hankintahetkellä, joten
  myöhempi "tietue oli erilainen tuolloin" -väite on julkisesti
  kumottavissa.
- **NIST Computer Forensics Tool Testing (CFTT).** Pakki viittaa
  CFTT-tarkistuslokeihin FAKTASSA 04 / FAKTASSA 05; viite on
  hash, ei itse loki, joten CFTT-prosessit eivät häiriinny.
- **Tuomioistuimen nimittämät neutraalit ja puolustuksen
  asiantuntijat.** Molemmat voivat uudelleen-hashata
  vastaanottamansa forensiset kuvat tutkinnassa FAKTA 03
  -manifestia vastaan, riippumatta viraston yhteistyöstä. Tämä on
  pakin ensisijainen arvonlisä puolustuksen puolelle.
- **Valitusoikeuden tarkastelu.** Vuosia myöhemmin
  valitustuomioistuimen forensinen tarkastaja voi vahvistaa
  alkuperäisen hankintametodologian sinetöityä FAKTA 04
  -tietuetta vastaan, eikä viraston mahdollisesti-kehittyneen
  nykyisen muistin mukaan.

## Mitä tämä pakki EI korvaa

- The Federal Rules of Evidence (tai mikään osavaltion
  todistelukoodi).
- Daubert / Frye -luotettavuusstandardit asiantuntijatodistuksessa.
- Viraston forensinen SOP ja CMS.
- Puolustuksen tutkintavelvoitteet FRCP 16 / Brady / Giglio /
  osavaltioiden vastaavien nojalla.
- Tuomioistuimen määräykset, näytön sulkemista koskevat vaatimukset,
  todisteluistunnot tai mikään muu tuomioistuimen hallinnoima
  menettely.
- NIST CFTT tai mikään muu työkalujen testausjärjestelmä.
- Viraston etuoikeussuodatin / saastutustiimi-protokolla.

## Miksi tämä pakki on olemassa versiossa v0.4.0+

Tämä on 8. työstetty esimerkki, joka toimitetaan myriam-kitin
mukana. Se seuraa rajoitus-ensin-rakennetta, jonka validoi
autotutkimus, joka on dokumentoitu osoitteessa
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — rajoitus-ensin-promptin
muunnelma pisteytti korkeimmalle painotetussa rubriikissa useissa
esimerkkialueissa. Avausosiot ovat pakin kantavia osia;
manifestin sisältö on helppo osa.

Pakin suunnittelu on tarkoituksellisesti konservatiivinen
tutkijoiden nimien julkaisemisessa ja aggressiivinen "tämä ei
vahvista hyväksyttävyyttä" -vastuuvapauslausekkeessa. Forensisella
yhteisöllä on dokumentoitu historia siitä, että sitä on hyökätty
forensisesta työstään; pakki defaulttaa turvallisempaan asentoon
tutkijoiden suhteen. Lainkäyttöalueet, joissa julkista
henkilökohtaista nimeämistä vaaditaan, voivat muokata forkkiaan
vastaavasti, mutta oletuskielto suosii tutkijoiden turvallisuutta.

## Lisenssi

Julkisalainen (CC0). Forkkaa sitä. Ei attribuointia vaadita.
