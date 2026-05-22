*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Hiilipäästöjen attestoinnin sinettipakki

Avaimet käteen -mallinen myriam-kit-esimerkki hiiliprojektien
kehittäjille, kolmansien osapuolten todentajille ja rekistereille,
jotka haluavat julkaista Bitcoin-ankkuroidun, peukaloinnin paljastavan
sinetin hiilikrediittien myöntämisestä, poistovarmennuksesta tai
päästöjen attestointitapahtumasta täsmälleen sertifiointihetkellä —
jotta hiljaiset myöntämisen jälkeiset muutokset tulisivat julkisesti
havaittaviksi.

---

## Mitä tämä pakki EI tee (lue ensin)

Hiilikrediitit ovat poliittisesti ja tieteellisesti kiisteltyjä.
Sinetti on kryptografinen aikaleima siitä, mitä attestoitiin. Se ei
voi varmistaa, vastaako attestoitu todellista ilmastohyötyä.
Seuraavat vikatilanteet ovat **sinetin alueen ulkopuolella**, ja ne
muodostavat suurimman osan hiilikrediittien merkityksellisistä
integriteettikysymyksistä:

1. **Lisäisyys.** Sinetti ei voi varmistaa, että hyvitetty toiminta
   ei olisi tapahtunut ilman hiilirahoitusta. Vastateettinen
   tilanne on periaatteessa havaitsematon. Sinetti tallentaa
   metodologian lisäisyysargumentin; se ei ratkaise sitä.

2. **Pysyvyys.** Sinetti ei voi varmistaa, että sidottu hiili pysyy
   sidottuna asianmukaisella aikahorisontilla (vuosikymmenistä
   vuosisatoihin metsähiilelle, geologisille aikajaksoille joillekin
   poistoille). Tuoreissa tutkimuksissa (Badgley et al. 2022,
   Patterson et al. 2022) on osoitettu, että puskurivarastot ovat
   merkittävästi vähentyneet todellisten purkutapahtumien vuoksi.
   Sinetöity krediitti on sinetöity *väite* pysyvyydestä
   määritettyjen puskurivaraston oletusten perusteella, ei todiste
   pysyvyydestä.

3. **Vuoto.** Sinetti ei voi varmistaa, että vältetyt päästöt
   projektialueella eivät yksinkertaisesti siirry ei-projektialueelle.
   Metodologian oletusarvoiset vuotovähennykset ovat sääntelyn
   paikkamerkkejä, eivät mittauksia. Sinetti ankkuroi sovelletun
   vähennyksen; se ei sertifioi sitä oikeaksi.

4. **Sivuhyödyt.** Sinetti ei voi varmistaa yhteisön kehittämis- tai
   biodiversiteettiväitteitä. Sivuhyödyt ovat tyypillisesti
   itseilmoitettuja ja todentajan tarkastamia, ei tarkastettu
   hiilen kvantifioinnin syvyydellä. Sinetti ankkuroi
   asiakirja-tiivisteet; ei mitään muuta.

5. **Vapaan, ennakollisen ja informoidun suostumuksen (FPIC)
   riittävyys.** Alkuperäiskansojen ja yhteisöjen suostumuksella
   hiiliprojekteissa on dokumentoitu vikahistoria (pakotettu
   suostumus, suostumus ei-edustavilta elimiltä, jälkikäteinen
   "suostumus" korvauksen kautta). Sinetti ankkuroi FPIC-dokumentaation
   ja valitusrekisterin tiivisteet; se ei voi sertifioida, että
   suostumusprosessi oli aito.

6. **Todentajan riippumattomuus.** Projektien kehittäjät maksavat
   todentajille. Tämä on rakenteellinen eturistiriita, jota
   mikään akkreditointimekanismi ei ole ratkaissut. Sinetti
   ankkuroi todentajan riippumattomuusilmoituksen; se ei
   sertifioi, että ilmoitus on totta.

7. **Kaksoislaskenta rekistereiden välillä tai kansallisten
   inventaarioiden kanssa.** Sinetti ankkuroi rekisteritilan
   tilannekuvan attestointiaikana. Jos isäntämaa laskee samaa
   toimintaa NDC:hen tai sitä väitetään myös toisessa rekisterissä,
   sinetti tekee rekisteritilasta diffattavissa olevan, mutta ei
   estä kaksoislaskentaa.

8. **Ostajan väitteen oikeellisuus.** Ostaja, joka käyttää
   sinetöidyn krediitin tukeakseen "net zero" tai "hiilineutraali"
   -väitettä, esittää jälkikäteistä väitettä, jota sinetti ei
   kata. Sinetti tallentaa peruutuksen; ostajan markkinointiväitteen
   pätevyys on erillinen, jälkikäteinen kysymys.

9. **Metodologian oikeellisuus.** Sinetti tallentaa metodologian
   viittauksen + asiakirja-tiivisteen, joka oli voimassa
   attestointiaikana. Se ei väitä, että metodologia on
   tieteellisesti pätevä. Metodologian uudistus tapahtuu;
   sinetöinti metodologialla, jota myöhemmin tarkistetaan, ei
   tee krediiteistä takautuvasti "väärää" tai "oikeaa" — se
   ankkuroi, mitkä säännöt sovellettiin myöntämisessä.

**Yllä oleva rehellisten rajojen osio on tämän pakin kantava osa.**
Lähes jokainen merkityksellinen integriteettikysymys hiilikrediitistä
elää jossakin näistä yhdeksästä kategoriasta. Sinetti sulkee
kapean jäljellä olevan aukon: tallennettujen tavujen hiljaisen
takautuvan muokkauksen. Tuo aukko on todellinen ja sulkemisen
arvoinen, mutta se on pieni kiistanalaisen maaston suhteen.

---

## Mitä tämän pakin TÄYTYY KIELTÄYTYÄ sinetöimästä

Pakki on konfiguroitu hylkäämään seuraavat faktakuviot, vaikka
käyttäjä, jolla on pätevä allekirjoitusvalta, lähettää ne:

- **"Lisäisyys" todettuna faktana.** Lisäisyyden sinetöinti faktana
  luo harhaanjohtavan tietueen. Pakki hyväksyy metodologian
  mukaiset lisäisyys*argumentit*, ei lisäisyys*väitteitä*.
- **"Pysyvyys" ilman selkeää aikahorisontin ja puskurivaraston
  ilmoitusta.** Pysyvyyden sinetöinti ilman näitä parametreja
  hämärtää, mihin projekti todellisuudessa sitoutuu.
- **"Ei vuotoa" ilman projektikohtaista mittausta.** Metodologian
  oletusarvoiset vuotovähennykset eivät ole mittaus, eikä sinetti
  kohtele niitä sellaisina.
- **Kvantifioinnit, jotka on luotu ennen kolmannen osapuolen
  todentamisen valmistumista.** Esitodennusta edeltävä sinetti luo
  väärän positiivisen "todennetun" tietueen.
- **Myöntämistietueet krediiteille, jotka on myös myönnetty eri
  rekisterissä ilman selkeää rekisterien välistä ilmoitusta**
  FACT 06:ssa.
- **Peruutustietueet, jotka eivät nimeä peruutuksen edunsaajaa.**
  Anonyymi peruutus heikentää peruutuksen julkishyödyllistä
  toimintaa; pakki kieltäytyy mahdollistamasta sitä.
- **FPIC-väitteet, joita ei tueta attestoitavissa olevilla
  asiakirja-tiivisteillä.**
- **Article 6.2 / 6.4 -myöntäminen ilman isäntämaan valtuutuskirjeen
  (LoA) tiivistettä**, joka on sinetöity FACT 06:ssa.
- **Sinetöinti minkä tahansa muun osapuolen kuin projektin
  kehittäjän + todentajan yhteisestä pyynnöstä** kyseiselle
  projektille.
- **Sivuhyötyväitteet sinetöity "sertifioituna"**, kun ne ovat
  vain "itseilmoitettuja ja todentajan tarkastamia."

Kieltäytyminen itse voidaan sinetöidä faktana ("Tämä osapuoli
pyysi X:n sinetöintiä; pakki kieltäytyi kieltäytymissäännön Y
mukaisesti"), mikä luo julkisen rekisterin yritetystä
väärinkäytöstä.

---

## Mitä tämä pakki SINETÖI

8 faktaa attestointihetkellä:

1. **Esimerkki-ilmoitus** — julistaa, että julkaisu on esimerkki
   (todelliset attestoinnit poistavat tai korvaavat tämän).
2. **Projektin tunnistaminen** — projektin nimi, rekisteri,
   rekisteriprojektin ID, metodologiaviittaus + tiiviste,
   maantieteellisen rajan tiiviste, vuosikerta, projektin
   kehittäjä, sivuhyötyväite, FPIC-tila.
3. **Päästöjen tai poiston kvantifiointi** — bruttotonnit CO2e,
   peruslinjan vastateettinen tilanne, vuotovähennys,
   puskurivaraston osuus, epävarmuusvähennys, nettohyvitettävä
   väite, jokaisen numeerisen syötteen tiivisteet.
4. **Mittausmetodologia** — kaukokartoituksen tietolähteet,
   maatotuusverkosto, instrumenttien kalibroinnin lokin tiiviste,
   luokittelijamallin tiiviste + tarkkuustilastot,
   hiilitiheysmalli, koodin alkuperä + toistettavuusmanifesti.
5. **Kolmannen osapuolen todentaminen** — todentajaorganisaatio,
   akkreditointi, riippumattomuusilmoituksen tiiviste, aiemmat
   sitoutumiset kehittäjän kanssa, paikkakäyntien valokuva-arkiston
   tiiviste, esiin tuodut + ratkaistut havainnot, todentamislausunnon
   asiakirjan tiiviste.
6. **Myöntämis- tai peruutustietue** — myöntämispyyntö +
   hyväksyntä, myönnettyjen krediittien kokonaismäärä, sarja-alue,
   rekisterien välinen ilmoitus, isäntämaan LoA-tiiviste tarvittaessa,
   peruutuksen sarja-alueet + edunsaajat (peruutusattestoinneille),
   rekisteritilan tilannekuvan tiivisteet.
7. **Kumppaniilmoitukset ja kieltäytymistietue** — vireillä olevat
   metodologiakiistat, ei-pysyvyysriski, vuotovaraukset,
   lisäisyysvaraukset, FPIC + valitusrekisterin tiivisteet,
   sivuhyötyvarauma, aiempi todentajasitoutuminen; selkeä luettelo
   kuvioista, joita pakki kieltäytyi sinetöimästä.
8. **Allekirjoitusta edustava taho** — projektin kehittäjä +
   todentaja + rekisteri, kukin rooli + attestoinnin laajuus +
   kryptografisen avaimen tiedot.

Jokainen fakta päättyy kieltäytymisportti-konventioon: *"Tämä
fakta väittää vain X. Se ei väitä Y"* (jossa Y on lähin vikatilanne
yllä olevasta "EI tee" -osiosta).

---

## Mitä vastaan tämä pakki puolustaa

- **Hiljainen myöntämisen jälkeinen kvantifioinnin muokkaus.** Mikä
  tahansa kokonaisluvun muutos FACT 03:ssa tuottaa erilaisen
  SHA-256:n, erilaisen Merkle-juuren, epäonnistuu OTS-verifioinnissa.
- **Hiljainen metodologian vaihto.** FACT 02 jäädyttää
  metodologiaviittauksen + asiakirja-tiivisteen myöntämisessä.
  Rekisterin myöntämisen jälkeinen vaihtaminen eri metodologiaversioon
  on julkisesti diffattavissa.
- **Hiljainen peruslinjan tarkistus.** FACT 03:n peruslinjan
  skenaariomallin tulosteen tiiviste on sinetöity. Jälkikäteinen
  peruslinjan uudelleenviritys useampien krediittien tuottamiseksi
  on havaittavissa.
- **Hiljainen todentajan lausunnon vaihto.** FACT 05:n
  lausuntoasiakirjan tiiviste on sinetöity. Myöntämisen jälkeinen
  "todentaja sanoi aina X" -uudelleenkirjoitus on havaittavissa.
- **Hiljainen peruutustietueen katoaminen.** FACT 06:n
  rekisteritilan tilannekuva on sinetöity. Krediitit, jotka
  salaperäisesti tulevat "saataville" uudelleen sen jälkeen, kun
  ne on merkitty peruutetuiksi, ovat havaittavissa sinettiä vasten.
- **Hiljainen FPIC-asiakirjan vaihto.** FACT 07:n FPIC +
  valitusrekisterin tiivisteet on sinetöity. Korvaavat
  suostumusasiakirjat ovat havaittavissa.
- **Hiljainen epäsuotuisten ilmoitusten poistaminen.** FACT 07:n
  kumppaniilmoitustila on sinetöity. Ei-pysyvyysvarauman hiljainen
  poistaminen projektin kuvaussivulta on havaittavissa sinetöityjä
  tavuja vasten.

Pakki EI puolusta perustavanlaatuisia integriteettikysymyksiä
vastaan (lisäisyys, pysyvyys, vuoto, FPIC-riittävyys, todentajan
riippumattomuus, metodologian pätevyys). Ne ovat vaikeampia
ongelmia, eikä sinetti voi ratkaista niitä.

---

## Historialliset tai lähes-historialliset tapaukset, joissa pakki olisi auttanut

Pakki olisi tuottanut hyödyllisen ankkurin — *ei korjausta* —
tapauksissa, jotka koskevat hiiliattestointitietueiden hiljaista
takautuvaa muokkausta. Se EI olisi ratkaissut perustavanlaatuisia
kiisteltyjä kysymyksiä missään näistä tapauksista.

- **The Guardianin / Die Zeitin / SourceMaterialin vuoden 2023
  tutkimus Verran sademetsäkrediiteistä.** Tutkijat havaitsivat,
  että useimmat tutkitut REDD+-projektit tuottivat krediittejä,
  joiden väitetyt vältetyt päästöt eivät vastanneet myöhempää
  kaukokartoituksen uudelleenanalyysia. Tutkimus vaati
  projektidokumentaation rekonstruoimista takautuvasti muokattuja
  rekisteritietueita vasten. Sinetöity julkaisu jokaisessa
  myöntämissyklissä olisi tarjonnut yksiselitteiset viitebyytit
  siitä, mitä attestoitiin kussakin syklissä — ei korjausta
  perustavanlaatuiseen peruslinjaongelmaan, vaan puhtaan forenssisen
  aikajanan.

- **Vuoden 2020 Kalifornian metsähyvitysten purkutapahtumat.**
  Useat metsähiiliprojektit Kalifornian sääntelymarkkinassa
  kokivat maastopalojen purkuja, jotka ylittivät heille varatun
  puskurivaraston reservin. Sen rekonstruointi, mitä kukin projekti
  oli attestoinut ei-pysyvyysriskistä *myöntämisessä* (verrattuna
  siihen, mitä projekti myöhemmin väitti attestoineensa), on
  tällä hetkellä vaikeaa. Vuosikerta-sinetit olisivat tehneet
  paloa edeltäneistä attestoinneista kanonisesti haettavissa
  olevia.

- **Useat REDD+-projektit, joissa viitealueen peruslinjamekanismeja
  on takautuvasti kritisoitu liioitelluiksi.** Sinetöity
  metodologia-asiakirjan tiiviste myöntämisaikana olisi ankkuroinut
  sen, mikä metodologiaversio todellisuudessa sovellettiin mihin
  vuosikertaan, tehden "metodologia oli aina X" -puolustuksesta
  diffattavissa olevan.

- **Useat australialaisten hiilikrediittiyksiköiden (ACCU) ihmisen
  aiheuttaman uudistumisen projektikiistat (2022-2023).**
  Akateeminen kritiikki siitä, oliko uudistuminen todella
  projektin aikaansaamaa vai luonnollista, on palannut kiistoiksi
  siitä, mitä projekti alun perin väitti. Sinetöidyt attestoinnit
  olisivat tarjonneet yksiselitteiset vuosikertakohtaiset tietueet.

- **Hiilihyvitysperuutustietueet, jotka ovat vaihtaneet tilaa.**
  Useita dokumentoituja tapauksia vapaaehtoismarkkinarekisterien
  peruutustietueista, jotka näyttävät muuttavan tilaa peruutuksen
  jälkeen (tulevat "peruutetuiksi" eri syystä tai liitetään eri
  edunsaajaan jälkikäteen). Per-peruutus-sinetit olisivat
  ankkuroineet tilan alkuperäisen peruutuksen hetkellä.

Missään näistä tapauksista pakki ei olisi ratkaissut, edustiko
perustavanlaatuinen krediitti todellista ilmastohyötyä. Pakki
ankkuroi tietueita; se on kaikki, mitä se tekee.

---

## Milloin tätä pakkia käytetään

- Olet projektin kehittäjä, joka haluaa julkaista peukaloinnin
  paljastavan attestoinnin tavanomaisen rekisteritallennuksen
  ohella.
- Olet kolmannen osapuolen todentaja, joka haluaa
  todentamislausuntonsa olevan julkisesti tarkistettavissa
  rekisterin myöhempää esitystä vastaan siitä, "mitä todentaja
  sanoi."
- Olet rekisteri, joka haluaa tarjota lisäintegriteettikerroksen
  myöntämis- ja peruutustietueille — erityisesti lainkäyttöalueilla,
  joilla on heikommat oikeusvaltioiden tuet rekisterin
  integriteetille.
- Olet toimittaja, akateemikko tai kansalaisjärjestö, joka
  suorittaa monivuotista pitkittäisanalyysiä hiiliprojekteista ja
  tarvitsee julkisen ankkurin diffataksesi projektin myöhempiä
  esityksiä sen myöntämisajan tavuja vasten.
- Olet ostaja (yritysten net zero, lentoyhtiöiden vaatimustenmukaisuus),
  joka haluaa, että peruuttamasi krediitit peruutetaan julkisesti
  ankkuroituja tietueita vasten, jotta jälkikäteistä
  markkinointiväitettäsi voidaan tarkastaa vakaan forenssisen
  aikajanan kanssa.

## Milloin tätä pakkia EI käytetä

- **Älä käytä korvaavana akkreditoidulle kolmannen osapuolen
  todentamiselle.** Sinetti ei korvaa ISO 14064-3 -todentamista;
  se yhdistyy sen kanssa.
- **Älä käytä väittääksesi, että projekti on "lisäinen",
  "pysyvä" tai "vähän vuotava."** Sinetti ei voi varmistaa näitä
  ominaisuuksia. Sinetin käyttäminen niiden väittämiseen on
  väärinkäyttöä.
- **Älä käytä legitimiteettiteatterina huonolaatuisille
  krediiteille.** Kryptografinen sinetti huonolaatuiselle
  krediitille on pysyvä forenssinen tietue huonosta laadusta, ei
  puolustus sille. Primitiivi leikkaa molempiin suuntiin; se on
  sen rehellisyys.
- **Älä käytä sinetöimään krediittejä, joita isäntämaa myös
  laskee NDC:hen** ilman selkeää vastaavaa säätöä koskevaa
  ilmoitusta FACT 06:ssa.
- **Älä sinetöi ennen todentamista.** Sinetti ennen todentajan
  lausunnon viimeistelyä luo väärän positiivisen "todennetun"
  tietueen.
- **Älä käytä paineen alla jättääksesi pois kumppanifaktan
  ilmoitusta FACT 07:ssa** (vireillä olevat metodologiakiistat,
  FPIC-ongelmat, aiempi todentajasitoutuminen). Kieltäydy ja
  sinetöi kieltäytyminen.
- **Älä käytä markkinointimerkkinä.** "MYRIAM-sinetöity" ei ole
  laatuväite; se on forenssinen ominaisuus. Sen kohteleminen
  laatumerkkinä on tarkalleen se väärinkäyttö, jota
  rajoitus-ensin-suunnittelu yrittää estää.

## Kuinka forkata tämä pakki todelliseen attestointiin

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Kriittinen ajoitus:** sinetöi rekisterin virallisen
myöntämistapahtuman AIKANA tai SEN JÄLKEEN, EI ennen sitä.
Myöntämistä edeltävä sinetti luo väärän positiivisen "myönnetyn"
tietueen. Peruutusattestoinneille sinetöi peruutuksen hetkellä.
Jatkuville seuranta-attestoinneille myöntämisen ja peruutuksen
välillä, sinetöi kussakin todentajan allekirjoittamassa
seurantasyklissä — mutta tee selväksi FACT 01:ssä, että
attestointi on seurantapäivitys, ei myöntäminen.

## Integrointi olemassa olevan hiili-infrastruktuurin kanssa

- **Verra (VCS).** Sinetöidyn julkaisun URL tai IPFS CID voidaan
  liittää VCS-projektisivulle täydentävänä dokumentaationa.
  Sinetti ei korvaa VCS-todentamista; se yhdistyy sen kanssa.
- **Gold Standard.** Sama integraatiomalli — täydentävä
  attestointi Gold Standard -myöntämisdokumentaation rinnalla.
  Gold Standardin painotus sivuhyötyihin + yhteisön hyödyn
  dokumentaatioon kartoittuu luonnollisesti FACT 02 + FACT 07:ään.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Sama integraatiomalli.
- **Article 6.4 (Pariisin sopimuksen valvontaelinmekanismi).**
  Isäntämaan LoA-tiiviste FACT 06:ssa on suunniteltu erityisesti
  Article 6.4 / 6.2 ITMO-jäljitettävyyteen. Vastaavan säädön
  ilmoittaminen on kieltäytymisportilla varustettu kenttä.
- **EU ETS MRV.** Sääntelymarkkinan julkaisijoille MRV-raportin
  tiiviste kartoittuu FACT 03:n kvantifiointitaulukon tiivisteeseen.
  Sinetti yhdistyy — ei korvaa — operaattorin todennettua
  päästöraporttia.
- **CDP (Carbon Disclosure Project) yritysten ilmoittaminen.**
  Yrityksille, jotka mainitsevat peruutettuja krediittejä CDP-
  lähetyksissä, FACT 06:n alla sinetöity peruutustietue on
  kanoninen haettavissa oleva tietue. CDP-lähetyskieli voi viitata
  sinetöidyn julkaisun Merkle-juureen tai IPFS CID:hen.
- **ISO 14064-2 (projekti) / ISO 14064-3 (todentaminen) / ISO
  14065 (akkreditointi).** Sinetti tallentaa
  vaatimustenmukaisuusväitteen + tiivisteet; se ei suorita
  vaatimustenmukaisuusarviointia.
- **TSVCM Core Carbon Principles (CCP) / ICVCM-merkinnät.** Kun
  projekti on arvioitu ICVCM CCP:itä vasten, arviointituloksen
  tiiviste voidaan sinetöidä FACT 07:ssa kumppaniilmoituksena.

## Mitä tämä pakki EI korvaa

- Akkreditoitua kolmannen osapuolen todentamista (ISO 14064-3)
- Rekisterin myöntämis- ja peruutustyönkulkuja
- Metodologian vaatimustenmukaisuusarviointia
- Isäntämaan valtuutusprosesseja Article 6 -tapahtumille
- Sääntelymarkkinan MRV-prosesseja (EU ETS, California
  Cap-and-Trade, RGGI jne.)
- Vapaaehtoismarkkinan integriteetti-aloitteita (ICVCM, VCMI)
- Riippumatonta ilmastovaikutusten arviointia

## Miksi tämä pakki on olemassa v0.4.0+:ssa

Tämä on 7. työstetty esimerkki, joka toimitetaan myriam-kitin
kanssa. Pakki on olemassa, koska hiilikrediittimarkkinoilla on hyvin
dokumentoitu historia hiljaisesta takautuvasta muokkauksesta —
metodologioista, joita tulkitaan takautuvasti uudelleen,
peruslinjoista, joita tarkistetaan takautuvasti, peruutustietueista,
jotka vaihtavat tilaa, ja projektin ilmoituksista, jotka hiljaa
pudottavat epämukavia varaumia ajan myötä.

Sinetti sulkee *kapean* attestointihetken tavujen aukon. Se ei
käsittele — eikä voi käsitellä — suurempia kiisteltyjä kysymyksiä
lisäisyydestä, pysyvyydestä, vuodosta tai sivuhyötyjen
autenttisuudesta. Pakin rehellinen tämän rajoituksen kehystäminen
on sen tärkein ominaisuus.

## Lisenssi

Public domain (CC0). Forkkaa se. Attribuutiota ei vaadita.
