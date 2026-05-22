*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Bírósági bizonyíték őrzési-lánc pecsétkészlet

Kulcsrakész myriam-kit példa törvényszéki adatszerzési csapatok
számára — számítógépes törvényszéki vizsgálók, mobileszköz-kinyerési
technikusok, testkamerás bizonyíték-őrzők, laboratóriumi felügyelők
— akik egy Bitcoinhoz lehorgonyzott, manipulációt felfedő pecsétet
kívánnak közzétenni arról, *mely bájtok* lettek megszerezve és
*mikor*, a digitális bizonyíték megszerzésének pillanatában, hogy
az őrzési-lánc-vitáknak legyen egy nyilvános horgonya.

---

## Mit NEM tesz ez a készlet (először olvasd el)

A pecsét egy kriptográfiai időbélyeg arról, MELYIK TÖRVÉNYSZÉKI
KÉPMÁSOKAT szerezték meg, MIKOR szerezték meg, MELYIK HATÓSÁG által,
MELYIK PARANCS alatt, és MILYEN MÓDSZERTANNAL. Az ügy egyetlen
további kérdésére sem tud választ adni. A következők **kívül esnek
a pecsét hatókörén**:

1. **Elfogadhatóság a Federal Rules of Evidence (vagy bármely más
   bizonyíték-kódex) szerint.** A pecsét bájtokat és időbélyegeket
   horgonyoz. Hogy a bizonyíték elfogadható-e — az FRE 901
   hitelesítés, FRE 702 szakértői tanúvallomás / Daubert, FRE 403
   előítélet-mérlegelés, vagy bármely állami bírósági ekvivalens
   szerint — jogi-eljárási kérdés. Egy tökéletesen lepecsételt
   adatszerzést is el lehet utasítani; egy pecsételetlen
   adatszerzést is el lehet fogadni. A pecsét az integritás
   kiegészítő bizonyítéka, nem a bíróság elfogadhatósági
   döntésének helyettesítője.

2. **Hogy a lefoglalás törvényes volt-e.** A Fourth Amendment
   betartása, a parancs érvényessége, a hatókör betartása, az
   exclusionary-rule alkalmazhatósága — mindez a pecsét előtt áll.
   A pecsét rögzíti, hogy az adatszerzés a FICT-SW-2026-0188 számú
   parancs alatt történt; hogy a parancsot jogszerűen adták-e ki
   és kézbesítették-e, az a bíróságra tartozik.

3. **Hogy a bizonyíték terhelő, mentő, vagy semleges.** A pecsét
   hash-eket horgonyoz; az értelmezések arról, hogy mit
   tartalmaznak ezek a hash-ek, a törvényszéki vizsgálati
   jelentésbe tartoznak, amely saját discovery és bizonyíték-
   szabályozási rezsimmel rendelkező saját dokumentum. A pecsét
   visszautasítja a "FACT N: a gyanúsított laptopja terhelő anyagot
   tartalmazott" lepecsételését — lásd refusal-rule R4.

4. **Hogy az őrzési-lánc eljárásilag helyes-e az alkalmazandó
   állam bizonyítéki joga szerint.** A pecsét rögzíti a hatóság
   egyidejű őrzési-eseménynaplóját (FACT 05). Hogy ez a napló
   megfelel-e egy adott állam őrzési-lánc követelményeinek, az a
   bíróságra tartozik a bizonyítási meghallgatáson.

5. **Hogy a törvényszéki módszertan megbízható volt-e.** A Daubert
   és leszármazottai (és az állami szintű analógok mint a Frye, ahol
   még alkalmazandó) értékelik a módszertani megbízhatóságot. A
   pecsét rögzíti, MELYIK eszközöket és verziókat használták
   (FACT 04); hogy ezek az eszközök megfelelnek-e egy adott bíróság
   megbízhatósági szabványának, az a bíróságra tartozik. Adatszerzés
   utáni eszközhibákat dokumentáltak korábbi ügyekben; a pecsét
   szerepe az, hogy a version-and-binary-hash rekordot nyilvánosan
   cáfolhatóvá tegye, nem pedig hogy az eszközökért magukért
   kezeskedjen.

6. **Hogy a bizonyítékot megváltoztatták-e az adatszerzés ELŐTT.** A
   pecsét a képmás-készítés pillanatától előrefelé horgonyoz
   bájtokat. Ha egy gyanúsított, egy tiszt, vagy egy harmadik fél
   módosította a forráseszközt, mielőtt képmás készült róla, a
   pecsét ezt nem tudja észlelni — ugyanazzal az integritással
   pecsételi le a megváltoztatott bájtokat, mint amellyel az
   eredetit pecsételné. A pecsét értéke a képmás-készítés
   időbélyegénél kezdődik.

7. **Hogy a parancs hatókörét tiszteletben tartották-e.** A parancs
   rider határozza meg, hogy mi szerezhető meg; a pecsét rögzíti,
   hogy MI lett megszerezve. Hogy az adatszerzés túllépte-e a
   parancs hatókörét, ismét egy jogi kérdés saját jogorvoslattal
   (az adott állam eljárása szerinti suppression motion).

8. **A vizsgálat bármely magán-résztvevőjének újra-azonosítása.** A
   pecsét visszautasítja bármely olyan név, azonosító, vagy
   ujjlenyomat közzétételét, amely újra-azonosíthatna egy
   gyanúsítottat, vádlottat, áldozatot, tanút, vagy helyszín-lakót.
   Az ügy docket-hivatkozása a megfelelő fogantyú azon felek
   számára, akiknek joguk van megtalálni az ügyet.

**A fenti honest-limits szakasz a készlet teherviselő része.** Azok
a törvényszéki csapatok, akik úgy hiszik, hogy a pecsételés
egyenlő az elfogadhatósággal, pajzsként fogják használni. A
készletnek világosan kell mondania: *ez egy non-repudiation
primitív az adatszerzés pillanatára, nem a törvényes adatszerzés,
módszertani megalapozottság, vagy bíróságilag elismert őrzési-
lánc bizonyítéka.*

---

## Mit kell a készletnek MEGTAGADNIA a pecsételésből

A készlet úgy van konfigurálva, hogy elutasítsa a következő tény-
mintázatokat, még akkor is, ha egy érvényes hatósági aláírási
jogosultsággal rendelkező felhasználó nyújtja be őket:

- **Gyanúsítottak, vádlottak, áldozatok, tanúk, vagy bármely magán
  harmadik fél személyes azonosítása.** Az ügy docket-hivatkozása a
  fogantyú azon felek számára, akiknek joguk van; a nyilvános
  pecsét nem lehet újra-azonosítási index.
- **Törvényszéki vizsgálók vagy más hatósági személyzet személyes
  nevei a nyilvános pecsétben.** A szerepek nyilvánosak; a
  személy-szerep kötések külön vannak lepecsételve és bírósági
  eljárás keretében discoverable-ek.
- **Gyanús CSAM, biometrikus sablonok, vagy bármely sérülékeny-
  személy újra-azonosító adat file-level hash-ei (vagy ujjlenyomatai)
  — még hash által is.** Egy egyedi fájl SHA-256-ja egy állandó
  kereshető azonosító; nyilvános ledgeren való közzététele
  re-viktimizálhatja az alanyokat magánadatbázisokkal való
  korreláción keresztül. A teljes lemezek image-level (törvényszéki-
  képmás-szintű) hash-ei elfogadhatók; az ilyen anyag file-level
  hash-ei SOHA nem elfogadhatók.
- **Vizsgálati megállapítások, értelmezések, vélemények, vagy
  következtetések arról, hogy mit jelentenek a bájtok.** A pecsét
  azt horgonyozza, MELYIK BÁJTOKAT szerezték meg és MIKOR. Az
  értelmezés a discoverable vizsgálati jelentésbe tartozik, nem
  egy manipulációt felfedő nyilvános ledgerre.
- **Elfogadhatóság vagy bármely más jogi következtetés állításai**
  ("ez a bizonyíték elfogadható," "a parancs törvényes volt," "az
  őrzési-lánc megfelelő volt a §X.Y szerint"). A jogi
  következtetések bírósági funkciók.
- **Az adatszerző hatóság felhatalmazott principálján kívül bárki
  más általi pecsételés.** Egy védelmi szakértő használhatja a
  készletet, hogy lepecsételje a manifest saját független
  ellenőrzését; nem pecsételheti le az EREDETI adatszerzést az
  adatszerző hatóság nevében.
- **Szerep-egyén kötések a nyilvános pecséten belül.** A kötések
  egy külön kísérő rekordban vannak lepecsételve (a FACT 05-ben
  hash-elve) hatósági hozzáférés-szabályozás alatt.
- **Lefoglalás-előtti vagy parancs-előtti nyomozási tények.**
  Informátori nyilatkozatok, parancs-előtti megfigyelés, parallel-
  construction inputok — ezek egyike sem tartozik az adatszerzési
  pecsétre. A pecsét hatóköre az adatszerzési eseményre korlátozódik.

Maga egy megtagadás is lepecsételhető tényként ("Ez a hatóság X
pecsételését kérte; a készlet a refusal-rule Y szerint megtagadta"),
ami nyilvános rekordot hoz létre a visszaélés-kísérletről.

---

## Mit pecsétel le ez a készlet

8 tényt az adatszerzés pillanatában:

1. **Példa-értesítés** — kinyilvánítja, hogy a közzététel egy példa
   (a valós tanúsítványok ezt eltávolítják vagy lecserélik).
2. **Adatszerzési kontextus** — ügyazonosító, parancs-idézet,
   adatszerző hatóság, kérelmező hatóság, lefoglalás és
   adatszerzés dátuma/időpontja, az adatszerzés helye (a lefoglalás
   helyét egy külön lepecsételt kísérő rekordba redaktálják a
   helyszín újra-azonosításának elkerülése érdekében).
3. **Bizonyíték-manifest** — törvényszéki-képmás-tételenként:
   SHA-256 hash, fájlméret, forráseszköz anonimizált azonosító,
   adatszerzési módszer, törvényszéki képmás formátum.
4. **Adatszerzési módszertan** — törvényszéki eszköznevek és pontos
   verziók (eszköz-bináris hash-ekkel), write-blocker gyártó/modell
   és firmware, NIST CFTT ellenőrzési hivatkozás, használt
   ellenőrzési eljárás, képmás-formátum választás.
5. **Őrzési-lánc napló** — eseményenkénti idővonal a kezdeti
   lefoglalástól a képmás-készítés végéig, az őrzők szerep (nem
   név) szerint azonosítva, külön lepecsételt kísérő rekordok
   hash-eivel (szerep-egyén kötés, szállítási GPS-napló, evidence-
   locker hozzáférési napló, tamper-seal fényképek, stb.).
6. **Vizsgálói képesítések szerep szerint** — birtokolt
   tanúsítványok, continuing-education státusz, korábbi szakértő-
   tanú tapasztalat-szám, Daubert-expozíció, érdekellentét-
   nyilatkozatok — mind szerep-szintű, nem személyes.
7. **Kísérő nyilatkozatok és refusal-rekord** — párhuzamos
   nyomozások, függőben lévő parancs-kihívások, suppressed-evidence
   indítványok, hatályos privilege-filter / taint-team protokoll,
   korábbi adatszerzési kísérletek, vendor bug-tracker átvizsgálás;
   azon mintázatok kifejezett listája, amelyeket a készlet
   megtagadott lepecsételni.
8. **Aláíró principál** — adatszerző hatóság azonosítása + szerep-
   szintű aláíró (vezető vizsgáló) + szerep-szintű társ-aláíró
   (egységfelügyelő) + kriptográfiai kulcs-információ.

Minden tény a refusal-gate konvencióval végződik: *"Ez a tény csak
X-et állítja. Nem állítja Y-t"* (ahol Y a legközelebbi
hibamód a fenti "NEM tesz" szakaszból).

---

## Mi ellen véd ez a készlet

- **Egy törvényszéki képmás csendes adatszerzés-utáni
  megváltoztatása.** Bármely képmás bármely byte-szintű változása
  más SHA-256-ot eredményez, és a változás-utáni képmás nem fog
  hitelesülni a lepecsételt FACT 03 manifesttel szemben.
- **Az az állítás, hogy "más eszközöket használtak."** A FACT 04
  rögzíti a pontos eszközverziókat eszköz-bináris hash-ekkel; a
  későbbi "valójában v4.7.0-t használtunk, nem v4.7.1-et"
  állítások nyilvánosan cáfolhatók.
- **Az az állítás, hogy a write-blocker nem volt bekapcsolva, vagy
  más modellt használtak.** A FACT 04 lefagyasztja a write-blocker
  manifestet.
- **Őrzési-napló megváltoztatása.** Bármely változás a FACT 05
  őrzési-esemény idővonalon (esemény hozzáadása, eltávolítása,
  vagy újra-időbélyegzése) változtatja a FACT 05 hash-t, és
  nyilvánosan észlelhető.
- **Egy másik vizsgáló credentialjeinek helyettesítése.** A FACT 06
  lefagyasztja a szerep-szintű credential-profilt az adatszerzés
  idején.
- **Kísérő nyilatkozatok szelektív kihagyása.** A FACT 07 felsorolja
  a várt nyilatkozat-kategóriákat; egy üres kategóriát kifejezetten
  attesztálni kell ("egyik sem az adatszerzés idején"), így a
  későbbi "nem vettük észre, hogy ez releváns volt" nyilvánosan
  cáfolható.
- **Adatszerzés-utáni állítások, hogy a vizsgálónak nem
  nyilvánosságra hozott érdekellentéte volt.** A FACT 06
  érdekellentét-nyilatkozata az adatszerzéskor le van fagyasztva; a
  későbbi kihívások tesztelhetők ennek függvényében.

A készlet **nem** véd az egyidejű korrupció ellen — egy csapat,
amely szándékosan hamis metaadatot pecsétel le az adatszerzés
idején, hamis metaadat kriptográfiailag érvényes pecsétjét állítja
elő. A primitív őszinte ezzel kapcsolatban: ez a hatóság egyidejű
állításaihoz tartozó non-repudiation primitív, nem annak bizonyítéka,
hogy ezek az állítások helyesek.

---

## Történelmi vagy közel-történelmi ügyek, amelyekkel a készlet segített volna

A készlet hasznos horgonyt — *nem megoldást* — állított volna elő
azokban a múltbéli ügyekben, ahol a digitális bizonyíték őrzési-
lánca vitatott bizonyítéki kérdéssé vált. A vádlottak megnevezésének
elkerülése érdekében (akik magán-felek még elítélve is) ezek
ügytípus szerint vannak leírva, nem megnevezett egyén szerint:

- **A 2010-es évek közepi szövetségi forensic-tool-bug vita,**
  amelyben egy széles körben használt törvényszéki képmás-készítő
  eszközről utólag, adatszerzés után derült ki, hogy egy
  edge-case hibát tartalmaz, amely egy adott forrásmédia-típust
  érint. Egy lepecsételt adatszerzési manifest, lefagyasztott
  tool-version-and-binary-hash adatokkal, lehetővé tette volna,
  hogy a védelem és az ügyészség pontosan abban értsen egyet,
  melyik verziót használták, eliminálva a vita egyik tengelyét.

- **Több állami ügy vitatott mobil-eszköz-kinyerési kimenetekkel,**
  ahol a kinyerési eszköz gyártója később bug-fix javítást adott
  ki, és a kérdéssé vált "befolyásolta-e a hiba ezt az ügyet."
  Egy lepecsételt módszertani tény lehetővé teszi, hogy a kérdést
  a lefagyasztott versioning-adatok ellenében válaszolják meg, ne
  pedig a hatóság jelenlegi emlékezete ellenében arról, hogy
  melyik verziót használták.

- **Body-worn-camera kézátadási viták** azokban az ügyekben, ahol
  a BWC-gyártó docking rendszeréről később azt állították, hogy
  lehetővé tette a felvétel módosítását szállítás közben. A
  body-cam archív lepecsételt manifestje a hatósági átvétel
  pillanatában leköti, hogy a hatóság mely bájtokat kapta a
  docking rendszerből; a hatósági oldali későbbi szerkesztések
  nyilvánosan észlelhetők.

- **Hash-ütközési viták számítógép-törvényszéki ügyekben,** ahol
  egy védelmi szakértő azzal érvelt, hogy az MD5 (még mindig
  használatban néhány legacy munkafolyamatban) elégtelen volt.
  Egy olyan lepecsételt adatszerzés, amely MIND az MD5-öt MIND a
  SHA-256-ot rögzíti, megengedi, hogy a SHA-256 megálljon még
  akkor is, ha az MD5-öt megrendítik.

- **Viták a vizsgálati módszertan adatszerzés és tárgyalás közötti
  evolúciójáról.** Amikor egy ügy évekig ül adatszerzés és
  tárgyalás között, az a módszertan, amely szabványos volt az
  adatszerzéskor, a tárgyalás idejére túlhaladottá válhat. A
  lepecsételt rekord lehetővé teszi a bíróságnak, hogy a
  módszertant ahhoz a szabványhoz mérje, amely az adatszerzés
  pillanatában aktuális volt, ne pedig a későbbi szabványhoz.

A készlet ezen ügytípusok egyikében sem oldotta volna fel a bűnösség
vagy ártatlanság alapvető vitáit. Egy konkrét bizonyítéki al-vitát
oldott volna fel: hogy a bájtok, eszközök és eljárások azok voltak-e,
amelyekről a hatóság azt állítja, hogy abban az időpontban voltak,
amelyikről a hatóság azt állítja.

---

## Mikor használjuk ezt a készletet

- A hatósága stabil törvényszéki SOP-pal rendelkezik, és egy
  Bitcoin-lehorgonyzott nyilvános tanúsítványt szeretne hozzáadni
  manipulációt felfedő rétegként a meglévő paper-and-signature
  őrzési-lánc tetejére.
- Számít rá, hogy ez az ügy jelentős védelmi kihívást fog
  tartalmazni a törvényszéki bizonyítékkal szemben (nagy tétű ügy,
  új módszertan, vitatott eszközverziók, stb.).
- A felsorolt ténykészletet anélkül tudja közzétenni, hogy
  felfedne PII-t vagy sérülékeny-személy újra-azonosító adatot. (A
  készlet refusal-szabályai ezt érvényesítik; ha a tényei refusal-
  rule-megszegést igényelnének, ne használja a készletet.)
- Az adatszerző hatóság general counselje és az ügyészség
  átnézte a közzétételi tervet. Egy ügyazonosító-hordozó artifakt
  nyilvános közzétételének következményei vannak folyamatban lévő
  nyomozásokra; a counsel-felülvizsgálat nem opcionális.
- A jogrendszer védelmi discovery szabályai kompatibilisek azzal,
  hogy a hatóság külön tartja a szerep-egyén kötési rekordot
  (a FACT 05-ben hash-elve). Ha a jogrendszere nyilvános vizsgáló-
  név közzétételt követel meg, ennek megfelelően módosítania kell
  a készletet.

## Mikor NE használjuk ezt a készletet

- **Ne használja a hatóság meglévő őrzési-lánc dokumentációjának
  helyettesítőjeként.** Ez a készlet *kiegészítő*, nem helyettesítő.
  A hatóság CMS-e, őrzési naplója és discovery-előállítási
  kötelezettségei változatlanok.
- **Ne használja, ha az adatszerzés CSAM-ot, biometrikus
  sablonokat, vagy más sérülékeny-személy újra-azonosító adatot
  tartalmaz file-szinten.** A teljes lemezek image-szintű hash-ei
  elfogadhatók; az ilyen anyag file-szintű hash-ei SOHA nem
  elfogadhatók, refusal-rule-mentesség alatt sem. Ha nem tud
  ténykészletet alkotni R3 megsértése nélkül, ne használja a
  készletet.
- **Ne használja annak állítására, hogy a parancs törvényes volt,
  a lefoglalás megfelelő volt, vagy a bizonyíték elfogadható** —
  a készlet ezt nem tudja megtenni, és a refusal-rule R5
  elutasít minden ilyen állítást.
- **Ne használja az adatszerzés befejezése előtti pecsételésre
  vonatkozó nyomás alatt.** Egy részleges-adatszerzési pecsét
  félrevezetően ábrázolja az állapotot.
- **Ne használja vizsgáló-személyes nevek közzétételére,** kivéve,
  ha a jogrendszere kifejezetten megköveteli, és a vizsgálók
  egyénileg beleegyeztek. Az alapértelmezett a szerep-szintű
  közzététel.
- **Ne használja lepecsételt vagy under-seal ügyekben kifejezett
  bírósági engedély nélkül.** Egy ügyazonosító közzététele a
  Bitcoinon visszafordíthatatlan; ha az ügyet később lepecsételik,
  a nyilvános pecsétet nem lehet visszavonni. A készlet csak
  nyilvános-rekord adatszerzésekhez való.
- **Ne használja legitimitás-színházként.** Egy hibás adatszerzés
  pecsétje a hibák állandó nyilvános rekordja, nem védelem
  ellenük. A primitív mindkét irányban vág; ez az ő őszintesége.

## Hogyan forkoljuk ezt a készletet valós adatszerzéshez

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Kritikus időzítés:** pecsételje AKKOR, vagy közvetlenül a képmás-
készítés befejezése után (a példa-idővonalban FACT 05 E17
esemény). A képmás-készítés alatti pecsét részleges-adatszerzési
rekordot hoz létre; egy sokkal későbbi pecsét rést hoz létre,
amely alatt a hatóság megváltoztathatta a képmásokat. A megfelelő
ablak közvetlenül a kiállítási halmaz utolsó elemének képmás-
hitelesítése után van.

**Kritikus felülvizsgálat:** pecsételés előtt futtassa a közzétételt
egy második törvényszéki vizsgálón (nem a vezetőn) és a hatósági
counsel-en keresztül. Egyszer lepecsételve, a közzététel állandó.

## Integráció a meglévő őrzési-lánc infrastruktúrával

- **Hatósági ügyviteli rendszer (CMS).** A CMS marad a hatóság
  elsődleges rekord-rendszere. A pecsét nem helyettesíti a CMS-t;
  elkötelezi magát azon bájtok és módszertan mellett, amelyeket a
  CMS rögzít, így a post-hoc CMS-szerkesztések nyilvánosan
  észlelhetők.
- **Federal Rules of Evidence / Daubert / állami bizonyítéki
  kódexek.** A pecsét manipulációt felfedő integritás biztosításával
  hozzájárul a FRE 901 hitelesítési rekordhoz. Önmagában NEM
  elégíti ki az FRE 702 / Daubert-et; a módszertani megbízhatóságot
  továbbra is a bizonyítási meghallgatáson tesztelik.
- **Védelmi discovery (FRCP 16, Brady, Giglio, és állami
  ekvivalensek).** A FACT 05-ben hash-elt kísérő rekordok (szerep-
  egyén kötés, őrzési napló, tamper-seal fényképek, stb.) a
  normális discovery alatt maradnak. A pecsét leköti, hogy ezek a
  rekordok mit állítottak az adatszerzés pillanatában, így a
  későbbi "a rekord más volt akkoriban" állítás nyilvánosan
  cáfolható.
- **NIST Computer Forensics Tool Testing (CFTT).** A készlet
  hivatkozik a CFTT-hitelesítési naplókra a FACT 04 / FACT 05-ben;
  a hivatkozás egy hash, nem maga a napló, így a CFTT-folyamatokat
  ez nem érinti.
- **Bíróság által kinevezett semlegesek és védelmi szakértők.**
  Bármelyikük újra-hash-elheti a discovery-ben kapott törvényszéki
  képmásokat a FACT 03 manifesttel szemben, bármilyen hatósági
  együttműködéstől függetlenül. Ez a készlet elsődleges value-addja
  a védelem számára.
- **Fellebbviteli felülvizsgálat.** Évekkel később egy fellebbviteli
  törvényszéki felülvizsgáló ellenőrizheti az eredeti adatszerzési
  módszertant a lepecsételt FACT 04 rekord ellenében, nem pedig a
  hatóság esetleg-fejlődött jelenlegi emlékezete ellenében.

## Mit NEM helyettesít ez a készlet

- A Federal Rules of Evidence (vagy bármely állami bizonyíték-kódex).
- Daubert / Frye megbízhatósági szabványok szakértői tanúvallomáshoz.
- A hatóság törvényszéki SOP-ja és CMS-e.
- Védelmi discovery-kötelezettségek az FRCP 16 / Brady / Giglio /
  állami ekvivalensek alatt.
- Bírósági végzések, suppression indítványok, bizonyítási
  meghallgatások, vagy bármely más bíróság által adminisztrált
  eljárás.
- NIST CFTT vagy bármely más eszköz-tesztelési rezsim.
- A hatóság privilege-filter / taint-team protokollja.

## Miért létezik ez a készlet a v0.4.0+-ban

Ez a myriam-kittel szállított 8. kidolgozott példa. Követi a
`~/Genesis/calc/PROMPT_LIBRARY_v0.md`-ben dokumentált autoresearch
által validált constraint-first struktúrát — a constraint-first
prompt-változat érte el a legmagasabb pontszámot egy súlyozott
rubrikán több példa-területen át. A nyitó szakaszok a készlet
teherviselő részei; a manifest-tartalom a könnyű rész.

A készlet kialakítása szándékosan konzervatív a vizsgáló-név
közzététel kérdésében, és agresszív az "ez nem állapít meg
elfogadhatóságot" disclaimerben. A törvényszéki közösségnek
dokumentált története van arról, hogy megtámadták a törvényszéki
munkájáért; a készlet a biztonságosabb pozícióba alapértelmez a
vizsgálók számára. Azok a hatóságok azokban a jogrendszerekben,
ahol nyilvános személyes-megnevezés szükséges, ennek megfelelően
módosíthatják a forkukat, de az alapértelmezett refusal a vizsgáló
biztonságát részesíti előnyben.

## Licenc

Public domain (CC0). Forkold. Nem szükséges attribúció.
