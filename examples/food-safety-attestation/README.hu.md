*Magyar fordítás — az eredeti angol verzióért lásd [README.md](README.md)*

# Élelmiszer-biztonsági tanúsítvány készlet

Egy kulcsrakész myriam-kit példa élelmiszergyártóknak,
élelmiszer-biztonsági ellenőröknek, harmadik felek általi
tanúsítóknak és szabályozó hatóságoknak, akik közzé akarnak
tenni egy Bitcoin-lehorgonyzott, manipulációt felfedő pecsétet
arról, hogy *mit mondtak a kiadási tesztek* és *milyen kiadási
döntés született* a tételkiadás vagy az ellenőrzési jelentés
aláírásának pillanatában — úgy, hogy a tesztelési nyilvántartás,
a kiadási döntés vagy a visszahívási kötelezettségek
csendes, utólagos módosítása nyilvánosan észlelhetővé váljon.

---

## Amit ez a készlet NEM tesz (először olvassa el)

A pecsét egy kriptográfiai időbélyeg arról, hogy MELYIK kiadási
teszteket végezték el MELYIK tételen, MELYIK akkreditált
laboratóriumok, MELYIK módszerekkel, MILYEN eredményekkel, és
milyen KIADÁSI DÖNTÉST hozott a QA-hatóság ezen eredmények
alapján. Az élelmiszer-biztonsággal kapcsolatos egyetlen
kérdésre sem tud választ adni ezen túlmenően. Az alábbiak
**a pecsét területén kívül esnek**:

1. **A szennyeződés megelőzése.** A készlet azt horgonyozza le,
   amit a teszteredmények a kiadáskor MONDTAK. A szennyeződésnek
   sok oka van — egy tételen belüli heterogén mikrobiális
   eloszlás, hőmérsékleti visszaélés a forgalmazás során, a
   kiskereskedelmi kezelés hibái, a fogyasztói előkészítés
   hibái, új vagy nem szűrt veszélyek (pl. melamin-hamisítás,
   mielőtt a melamin szűrése rutinszerűvé vált), ellátási
   lánc-csalás a gyártó tesztelési hatókörén túl. A pecsét
   ezek közül egyiket sem akadályozza meg, és nem is állítja
   ezt.

2. **Annak garantálása, hogy egy elfogadott tétel minden
   egysége biztonságos.** Az ömlesztett élelmiszertermékben
   található mikrobiológiai szennyeződés HETEROGÉN. A
   Listeria, Salmonella és STEC patogének alacsony
   prevalenciájú, lokalizált gócokban fordulnak elő, nem
   egyenletesen eloszlva. Az ICMSF és a Codex mintavételi
   tervek dokumentált, korlátozott valószínűséggel detektálják
   az alacsony prevalenciájú szennyeződést — ez a valószínűség
   NEM 1. Egy tétel, amely átmegy a kiadási mintavételen, még
   mindig tartalmazhat olyan szennyezett egységeket, amelyeket
   nem vettek mintázásra. A pecsét a MINTÁKAT horgonyozza le,
   nem az ömlesztett anyagot. Ezt a korlátot a FACT 03 explicit
   módon megismétli, és ez a készlet legfontosabb őszinte
   korlátja.

3. **Annak tanúsítása, hogy a kiadási teszteket becsületesen
   futtatták le.** A pecsét azt horgonyozza le, amit a tesztek
   a kiadáskor jelentettek. Egy olyan laboratórium, amely
   csalárd PASS-t jelent a kiadáskor, kriptográfiailag
   érvényes pecsétet termel egy csalárd PASS-ról. A készlet
   a későbbi csendes módosítást észlelhetővé teszi, de nem
   észleli az egyidejű csalást. Az egyidejű csalás
   észleléséhez audit, laboratóriumi akkreditációs felügyelet
   (ISO 17025 felügyelet), jártassági vizsgálati programok és
   szabályozói ellenőrzés szükséges — mindezek a pecsét
   felett helyezkednek el.

4. **Az FSMA, FSIS vagy EU illetékes hatósági szabályozói
   beadványok helyettesítése.** Az FSMA, FSIS, EU 178/2002/EK
   rendelet és Codex Alimentarius szerinti kiadási
   nyilvántartásokat törvény szerint tartják fenn, és
   szabályozói felszólításra mutatják be. A pecsét egy
   nyilvános, manipulációt felfedő réteget AD HOZZÁ ezekhez a
   beadványokhoz; NEM helyettesíti őket. Egy lepecsételt
   közzététel nem szabályozói bejelentés.

5. **A visszahívási hatókörrel kapcsolatos viták megoldása.**
   A készlet le tudja pecsételni a kiadáskor tett visszahívási
   kötelezettségeket (FACT 06) és egy későbbi visszahívási
   hatókört új közzétételként; de annak a határa, hogy mely
   tételek érintettek, mely egységeket szállították, mely
   kiskereskedők kapták meg őket, és mely fogyasztók voltak
   kitéve, még mindig egy visszafelé és előrefelé történő
   nyomon követési vizsgálat. A pecsét azt horgonyozza le,
   amire a gyártó KÖTELEZETTSÉGET VÁLLALT, és amit később
   MEGTETT. Nem oldja meg az alapul szolgáló epidemiológiai
   kérdést.

6. **A tesztelés feletti, szándékos ellátási lánc-csalás
   észlelése.** A 2008-as kínai melamin-hamisítás a tejben és
   csecsemőtápszerben azért volt sikeres, mert a melamin nem
   szerepelt az analit-panelben — a nitrogén-tartalom
   fehérje-ekvivalens mérése igen, és a melamin ezt
   becsapta. Egy lepecsételt FACT 03 az akkor használt
   analit-panellel nyilvánosan elkötelezte volna magát azon
   panel mellett — de semmit sem tett volna a panelen
   kívüli hamisító észlelése érdekében. A pecsét értéke
   abban az esetben "ez az, amit a gyártó állított, hogy
   tesztel" forenzikus lehorgonyzása lett volna, NEM a
   megelőzés. Egy valódi élelmiszer-biztonsági rendszer ezt
   nem bejelentett szabályozói mintavétellel kezeli,
   széles hatókörű szűréssel (például LC-MS célzott módszerekkel),
   ami a gyártó pecsétje feletti szinten helyezkedik el.

7. **A kiadás utáni forgalmazás és fogyasztói kezelés
   lehorgonyzása.** Amint a tétel elhagyja a létesítményt, a
   forgalmazás során bekövetkező hőmérsékleti visszaélés, a
   kiskereskedelmi rossz kezelés, a fogyasztói tárolási hibák
   és a fogyasztói előkészítési hibák mind kívül esnek a
   hatókörön. A pecsét a gyártó kiadási eseményére van
   méretezve. A láncon lejjebb haladó manipuláció-felfedés
   külön készleteket igényel az elosztó, a kiskereskedő és
   (intézményes fogyasztók, például iskolák és kórházak
   esetén) a felhasználási pont szintjén.

8. **Az élelmiszer biztonságának kezeskedése bármely
   konkrét populációban.** A FACT 03 PASS eredmények nem
   vonják maguk után a biztonságot a terhes fogyasztók, a
   csecsemők, az immunhiányos fogyasztók vagy az idősek
   számára, akiknek a Listeria monocytogenes és a Salmonella
   dokumentáltan emelkedett kockázatot jelent még a
   hagyományos detektálási határértékek alatti
   koncentrációkban is. A pecsét nem tehet
   populáció-specifikus biztonsági állítást, és visszautasítja,
   hogy ezt tegye (R6 visszautasítási szabály).

**A fenti őszinte-korlátok szakasz a készlet tartóeleme.** Azok
a gyártók, akik a "lepecsételtük a kiadási nyilvántartásunkat"
kifejezést egyenlőnek tekintik azzal, hogy "bizonyítottuk, hogy
az élelmiszerünk biztonságos", visszaélnek a primitívvel. A
készletnek nyíltan ki kell mondania: *ez egy nem-megtagadhatósági
primitív a gyártó egyidejű állításaihoz a kiadáskor, nem a
biztonság bizonyítéka, nem helyettesíti a szabályozói felügyeletet,
és nem védekezés a heterogén szennyeződés, az ellátási
lánc-csalás vagy a kiadás utáni rossz kezelés hibamódok ellen,
amelyek emberek életébe kerültek a korábbi járványokban.*

---

## Amit ennek a készletnek MEG KELL TAGADNIA lepecsételni

A készlet úgy van beállítva, hogy az alábbi tényelőfordulásokat
elutasítsa, még akkor is, ha érvényes gyártói aláírási
jogosultsággal rendelkező felhasználó nyújtja be őket:

- **Bármely munkavállaló, felügyelő, QA-személyzet, látogató
  ellenőr vagy harmadik fél általi auditor személyes
  azonosítása.** A nyilvános pecsétben nem jelennek meg nevek,
  munkavállalói azonosítók, kártyaszámok, társadalombiztosítási
  számok, otthoni címek, személyes telefonszámok. A szerepek
  nyilvánosak; a személy-szerep kötések külön kerülnek
  lepecsételésre, és szabályozói eljárás keretében
  felfedhetők. A munkavállaló megtorlással és zaklatással
  szembeni biztonsága a tartóeleme; az élelmiszer-biztonsági
  tanúsítvány szerep szinten elvégezhető. (R1)

- **Pontos létesítmény-elhelyezkedés.** A létesítmény régiója
  (állam vagy több államot magában foglaló régió) elfogadható;
  a pontos utcacím, GPS-koordináták vagy bármilyen olyan
  azonosító, amely elegendő részletességgel azonosítja az
  üzemet egy térképen, NEM elfogadható. A szabályozási
  létesítményi szám a szabályozó kezelője a létesítményhez;
  fizikai biztonsági és munkavállalói biztonsági megfontolások
  szólnak a nyilvános cím Bitcoinra való közzététele ellen. (R2)

- **Egyéni termelési műszak-személyzeti minták.**
  Műszakbeosztások, egyéni munkavállalói rotációk, sorkezelő
  személyes azonosítói — ezek közül egyik sem jelenik meg a
  pecsétben. Az egyes munkavállalók életének mintáját nem
  szabad levezethetővé tenni a nyilvános tanúsítványból. (R3)

- **Beszállítói identitások, amelyek veszélyeztetik a
  szerződéseket.** A beszállítói nevek, a beszállítói
  létesítmény-elhelyezkedések, a beszállítói tételkódok (kivéve
  az ellátási lánc-szennyeződés esetén, amikor a beszállító
  szennyezett tételének megnevezése a közegészségügy érdekében
  szükséges, és külön lepecsételt közzététellel kezelendő)
  NEM jelennek meg a kiadási pecsétben. Sok ellátási szerződés
  tartalmaz titoktartási rendelkezéseket; a pecsét
  alapértelmezetten nem sérti meg ezeket. (R4)

- **Ügyféllisták és forgalmazási célállomások a magas szinten
  túl.** A magas szintű regionális összefoglaló elfogadható;
  a konkrét ügyféllisták (kiskereskedők, elosztóközpontok,
  vendéglátóipari ügyfelek) NEM elfogadhatók. Az ügyfél
  identitása szerződésileg bizalmas és versenyérzékeny; a
  szabályozó az ügyféllistát a kialakított visszahívási
  koordinációs csatornákon keresztül szerzi meg. (R5)

- **Biztonsági állítások vagy jogi következtetések.** A
  készlet nem fogja lepecsételni a következőket: "ez a
  termék biztonságos", "ez a tétel megfelel minden
  alkalmazandó élelmiszer-biztonsági szabványnak", "ez GRAS
  erre a felhasználásra", vagy bármilyen más biztonsági vagy
  jogi következtetést. A készlet a tesztelési nyilvántartást
  és a kiadási döntést horgonyozza le, NEM egy biztonsági
  következtetést. (R6)

- **Munkavállalói panaszok vagy bejelentői újraazonosítási
  minták.** A készlet megtagadja bármilyen olyan minta
  közzétételét, amely újra azonosíthatna egy olyan
  munkavállalót, aki OSHA, USDA vagy belső vállalati
  panaszt nyújtott be élelmiszer-biztonsági vagy
  munkahelyi biztonsági gyakorlatokról. Az ilyen panaszosokat
  az FSMA 402. szakasza és párhuzamos törvények védik; a
  pecsét nem válhat újraazonosítási vektorrá. A bejelentői
  tanúsítványoknak saját készletük van
  (`examples/whistleblower-manifest`), arra a felhasználási
  esetre hangolt visszautasítási szabályokkal. (R7)

- **Pecsételés bárki más, mint a kiadó gyártó felhatalmazott
  megbízója által.** Egy harmadik fél tanúsító, ügyfél
  QA-csapat vagy független auditor használhatja ugyanezt a
  készletet SAJÁT auditmegállapításainak lepecsételésére;
  NEM pecsételhetik le az eredeti kiadási döntést a gyártó
  neve alatt. A FACT 08-ban szereplő aláíró megbízó az
  egyetlen érvényes aláíró erre. (R8)

Maga a visszautasítás tényként lepecsételhető ("Ez a gyártó
X lepecsételését kérte; a készlet az Y visszautasítási
szabály szerint elutasította"), ami nyilvános
nyilvántartást hoz létre a megkísérelt visszaélésről.

---

## Amit ez a készlet LEPECSÉTEL

8 tény a kiadás pillanatában:

1. **Példajelzés** — bejelenti, hogy a közzététel példa (a valós
   tanúsítványok ezt eltávolítják vagy lecserélik).
2. **Termék- és tételazonosítás** — terméknév, kategória,
   gyártó, létesítmény régiója (NEM pontos elhelyezkedés),
   HACCP-terv verziója + hash-e, tételazonosító, termelési /
   csomagolási / felhasználhatósági dátumok, fogyasztói
   egységek száma, tárolási követelmények, a három kritikus
   szabályozási pont naplózott rekord-hash-ekkel (főzési
   letalitás, hűtési stabilizáció, post-letalitás RTE
   környezet).
3. **Kiadási teszteredmények** — készterméki mikrobiológiai
   tesztek (Listeria, Salmonella, STEC, APC, Enterobacteriaceae),
   kémiai / maradékanyag tesztek (nitrit, állatorvosi
   maradékok, nehézfémek), allergén keresztszennyeződés
   ellenőrzése, környezeti monitoring összefoglaló, mindegyik
   a teljes jelentés PDF-jének SHA-256-jával és a kifejezett
   minta-vs-ömlesztett értelmezési korláttal.
4. **Módszertan és laboratóriumi minősítés** — melyik módszert
   (és melyik módszerdokumentum-verziót) használták soronként,
   melyik laborok futtatták melyik teszteket, mindegyik labor
   ISO/IEC 17025:2017 akkreditációs állapota és
   tanúsítványhash-e, közelmúltbeli jártasságvizsgálati
   eredmények, függetlenségi nyilatkozat, eltérési / újraellenőrzési /
   OOS nyilvántartás erre a tételre.
5. **Kiadási döntés** — kiadási dátum, szerep-szintű kiadási
   jogosultság + ellenjegyzés, döntést támogató
   nyilvántartás-összefoglaló, magas szintű forgalmazási
   célállomások, a kiadáskor elismert kiadás utáni
   kötelezettségek, időzítési és visszavonhatatlansági
   kötelezettségvállalás.
6. **Visszahívási és forgalombahozatal-utáni felügyeleti
   kötelezettségek** — a farmakovigilancia élelmiszer-biztonsági
   analógja: megbetegedés-jel átláthatóság, visszahívási
   végrehajtási kötelezettségek (24h / 72h / 98%-os
   küszöbértékek), ellátási lánc-szennyeződésre adott válasz,
   csendes újraellenőrzés tilalmára vonatkozó kötelezettség,
   utólagos specifikációváltoztatás tilalmára vonatkozó
   kötelezettség, aggregált biztonsági jel-megosztás.
7. **Kísérő közzétételek és visszautasítási nyilvántartás** —
   helyreigazító intézkedési vizsgálati napló hash-e,
   közelmúltbeli ellenőrzési előzmények, visszahívási
   előzmények, a használt tesztelési módszerek ismert nyitott
   problémái, szerep-egyén kötés (külön lepecsételve, itt
   hash-elve), beszállítói visszakövethetőségi felkészültség,
   az R1-R8 visszautasítási szabályok kifejezett listája, és
   bármely visszautasítás, amelyet ezen kiadás során
   gyakoroltak.
8. **Aláíró megbízó** — gyártó + szerep-szintű aláíró
   (QA-igazgató) + szerep-szintű ellenjegyző (üzemvezető) +
   kriptográfiai kulcsadatok; indoklás a szerep-szintű
   közzétételhez.

Minden tény a visszautasítási kapu konvencióval végződik:
*"Ez a tény csak X-et állítja. Nem állítja Y-t"* (ahol Y a
legközelebbi hibamód a fenti "NEM tesz" szakaszból).

---

## Mi ellen véd ez a készlet

- **A kiadási teszteredmények csendes, utólagos módosítása.**
  Minden teszt-jelentés PDF hash-elve van. A kiadás utáni
  újrahash-elés bármilyen módosítást felfed.
- **Viták arról, hogy mely módszereket, mely
  módszerdokumentum-verziókat és mely laborokat használták.**
  A FACT 04 a kiadáskor befagyasztja a módszertant és a
  laboratóriumi akkreditációs állapotot. A későbbi
  "valójában MLG 4.13-at használtunk, nem 4.12-t" típusú
  állítások nyilvánosan cáfolhatók.
- **Egy specifikációból kieső tétel utólagos újra-specifikálása.**
  Ha egy kiadási teszteredmény valójában egy határeseti
  PASS volt, amelyet a kiadás után FAIL-re reklasszifikálnak,
  a lepecsételt jelentés-hash-ek bizonyítják, mit mondott
  az eredeti eredmény PDF. Szimmetrikusan, egy határeseti
  OOS, amelyet csendben PASS-szá újratesztelnek
  közlés nélkül, észlelhető, ha a FACT 06 csendes
  újratesztelés tilalmára vonatkozó kötelezettségvállalását
  később egy lepecsételetlen módosítással összehasonlítják.
- **A visszahívási hatókör csendes minimalizálása.** A FACT 06
  visszahívási kötelezettségvállalásai (24h értesítés, 72h
  kezdeményezés, 98% visszanyerhetőség) lepecsételve vannak;
  ezek be nem tartása nyilvánosan megfigyelhető.
- **A helyreigazító intézkedési előzmények utólagos
  újraelbeszélése.** A FACT 07 helyreigazító intézkedési
  napló-hash befagyasztja, amit a cég MONDOTT, hogy tett
  az EMP-presumptive után; a későbbi "ennél többet / kevesebbet
  tettünk" típusú állítások nyilvánosan cáfolhatók.
- **A kísérő közzétételek szelektív kihagyása.** A FACT 07
  felsorolja a várt közzétételi kategóriákat (ellenőrzési
  előzmények, visszahívási előzmények, módszer-tanácsadási
  felülvizsgálat, visszakövethetőségi felkészültség); egy
  üres kategóriát kifejezetten igazolni kell ("nincs a
  kiadás időpontjában"), így a későbbi "nem vettük észre,
  hogy ez releváns" nyilvánosan cáfolható.
- **Egy másik labor akkreditációs állapotának behelyettesítése.**
  A FACT 04 a kiadáskor befagyasztja minden labor ISO 17025
  hatókörét és tanúsítványhash-ét; egy nem akkreditált
  labor későbbi behelyettesítése nyilvánosan észlelhető.

A készlet **nem** véd az egyidejű korrupció ellen — egy
csapat, amely szándékosan hamis teszteredményeket pecsétel le
a kiadás időpontjában, kriptográfiailag érvényes pecsétet
termel a hamis teszteredményekről. A primitív őszinte ezzel
kapcsolatban: ez egy nem-megtagadhatósági primitív a gyártó
egyidejű állításaihoz, nem annak bizonyítéka, hogy ezek az
állítások helyesek.

---

## Történelmi halálozási precedens

A készlet hasznos lehorgonyzást — *nem megoldást* — biztosított
volna a korábbi élelmiszer-biztonsági kudarcokban. Az egyének
megrágalmazásának elkerülése érdekében (a legtöbb
élelmiszer-biztonsági kudarc vállalati, nem egyéni; egyeseket
büntetőeljárás során perelnek, másokat nem), ezek a hivatkozások
év és patogén szerint írják le a járványkitörést, és a
résztvevő szervezetet csak akkor nevezik meg, ha a szennyeződést
visszahívási értesítés vagy bírósági nyilvántartás
nyilvánosan tulajdonította.

- **2008-as kínai melamin-hamisítás a csecsemőtápszerben és
  tejtermékekben (Sanlu Group és mások).** Legalább hat
  csecsemő halála és ~300 000 megbetegedés tulajdonítható a
  melaminnal feldúsított tejtermékeknek, amelyeket csalárd
  módon arra terveztek, hogy a Kjeldahl-féle nitrogén-alapú
  vizsgálatokon a látszólagos fehérjetartalmat felfújják.
  Elítélések követték a Kínai Népköztársaság bíróságain,
  beleértve a halálos ítéleteket. *A pecsét ezt nem
  akadályozta volna meg* — a melamin a standard analit-panelen
  kívül volt. A pecsét nyilvánosan elkötelezte volna magát
  amellett, hogy MI volt a panel, így a rutinszerű szűrés
  esemény utáni kibővítésének hatóköre forenzikusan
  világos lett volna.

- **2011-es európai STEC O104:H4 járvány (görögszéna-csíra,
  amelyet egy német farmra vezettek vissza).** 53 haláleset,
  ~3 950 megbetegedés több európai országban; végül egy
  Egyiptomból importált görögszéna magokra vezették vissza,
  amelyeket egy német termelőnél csíráztattak. A
  visszakövetést akadályozta a tételszintű dokumentáció
  inkonzisztens volta a több országot átfogó ellátási
  láncban. *A pecsét nem akadályozta volna meg a magtétel
  szennyeződését* (a szennyeződés a csíráztató tesztjei
  felett volt); lehorgonyozta volna, amit a csíráztató
  kiadási tesztjei állítottak, és ha a magimportáló szintjén
  is használták volna, amit az importált mag kezelése
  állított, gyorsabbá téve a visszakövetést.

- **2015-ös Blue Bell Creameries Listeria monocytogenes
  járvány (Egyesült Államok).** 3 haláleset, 10 megbetegedés
  több államban; országos visszahíváshoz és a Blue Bell
  2020-as szövetségi büntetőjogi elítéléséhez vezetett
  vétségi élelmiszer-biztonsági vádak alapján, a cég
  halasztott vádemelési megállapodást kötött és 19,35 millió
  dollárt fizetett. Ezt követő polgári peres eljárás.
  *A pecsét nem akadályozta volna meg* az üzemen belüli
  Listeria környezeti szennyeződést; forenzikusan lehorgonyozta
  volna a környezeti monitoring program nyilvántartásait,
  így a "mit mutatott az EMP a járvány előtti hónapokban"
  utólagos kérdést egy manipulációt felfedő időbélyegzett
  nyilvántartással szemben lehetett volna megválaszolni,
  nem pedig későbbi keltezésű dokumentumokkal szemben.

- **2018-as több államot érintő STEC O157:H7 járványok
  római salátához kapcsolódva (Yuma termőterület, majd
  Salinas termőterület).** Legalább 5 haláleset és ~210
  megbetegedés több járványkitörés során abban az évben.
  A visszakövetést a vegyes forrású csomagolt termék
  bonyolította. *A pecsét nem akadályozta volna meg* a
  szennyeződést a mező / öntözővíz szintjén (a gyártó
  felett); forenzikusan lehorgonyozta volna minden
  feldolgozó beérkezési és kiadási tesztelési
  nyilvántartását, gyorsabbá téve a visszakövetést, és
  a nyilvános nyilvántartást kriptográfiailag védhetőbbé
  téve a későbbi vitákkal szemben.

- **Peanut Corporation of America Salmonella Typhimurium
  járvány (2008-2009, Egyesült Államok).** 9 haláleset, ~714
  megbetegedés; ez 2014-2015-ös szövetségi büntetőjogi
  elítélésekhez vezetett a PCA vezetői ellen, beleértve a
  vezérigazgató 28 éves börtönbüntetését összeesküvés és
  akadályoztatás vádjával. *A pecsét nem akadályozta volna
  meg* a szennyeződést, a pozitív üzemi Salmonella-tesztek
  alulvizsgálatát, vagy a vezetői szintű döntést, hogy a
  termékeket ezen pozitív eredményekkel ellentétben szállítják.
  VISZONT forenzikusan világossá tette volna a tárgyaláson,
  mit mondtak a teszteredmények a generálásuk pillanatában —
  jelentősen erősebben lehorgonyozva tette volna az
  ügyészség ügyét az egyidejű hamis-narratív e-mailek
  ellen a dokumentumi módosítással szemben.

Mindezekben az esetekben a készlet tisztább forenzikus
idővonalat biztosított volna. Egyik esetben sem akadályozta
volna meg önmagában a haláleseteket. A pecsét forenzikus
infrastruktúra, nem megelőzési infrastruktúra. Ez a
különbségtétel a készlet őszintesége.

---

## Mikor használjuk ezt a készletet

- Az Ön gyártási műveletének stabil HACCP / Megelőző
  Szabályozási programja van, és egy Bitcoin-lehorgonyzott
  nyilvános tanúsítványt szeretne hozzáadni egy
  manipulációt felfedő rétegként a meglévő
  kiadás-dokumentációs munkafolyamat felett.
- Ön egy kis vagy középvállalkozású gyártó, vagy egy gyenge
  szabályozási infrastruktúrával rendelkező joghatóságban
  működő gyártó, aki tételnyilvántartásokat szeretne
  lehorgonyozni egy globálisan ellenőrizhető idővonalhoz
  — export-piaci bizalom érdekében, ügyfél-audit válaszhoz,
  vagy önkéntes átláthatósági kezdeményezésekben való
  részvételhez.
- Ön egy élelmiszer-biztonsági ellenőr vagy harmadik fél
  általi tanúsító, és manipulációt felfedő
  audit-megállapítási pecsétet szeretne közzétenni az
  aláíráskor, hogy az audit-megállapítások később ne
  módosíthatók csendben a gyártó és a tanúsító
  megállapodásával.
- Ön azt várja, hogy ez a tétel jelentős láncon lejjebb
  haladó vizsgálatnak lesz kitéve (export-piac, magas
  kockázatú kategória, mint például RTE hús vagy
  csecsemőtápszer, új összetevő, közelmúltbeli visszahívási
  előzmények).
- Ön közzé tudja tenni a felsorolt tényhalmazt anélkül,
  hogy megsértené az R1-R8 visszautasítási szabályokat. Ha
  a tényei R1-R8 megsértést igényelnének, ne használja a
  készletet; először javítsa az adatbemeneteket.
- A gyártó jogi tanácsadója felülvizsgálta a közzétételi
  tervet. Egy tételazonosítót tartalmazó műtárgy nyilvános
  közzététele következményekkel jár a termékfelelősségi
  kitettségre; a tanácsadói felülvizsgálat nem opcionális.

## Mikor NE használjuk ezt a készletet

- **Ne használja az FSMA / FSIS / EU szabályozási
  nyilvántartások helyettesítésére.** A pecsét *kiegészítő*,
  nem helyettesítő. Az Ön törvényi kiadási nyilvántartásai,
  HACCP-terve, CCP-naplói és visszahívási terve változatlan.
- **Ne használja biztonsági állításként.** Egy passzoló
  kiadási nyilvántartás lepecsételése nem állapítja meg,
  hogy a termék biztonságos; csak azt állapítja meg, hogy a
  nyilvántartásnak ez a bájttartalma volt ebben az
  időpontban. Az R6 visszautasítási szabály minden
  biztonsági következtetést elutasít.
- **Ne használja beszállítói identitások, ügyféllisták,
  munkavállalói nevek vagy létesítményi címek
  közzétételére.** Az R1-R5 visszautasítási szabályok
  emberbiztonsági és szerződéses okokból léteznek; ne
  módosítsa a készletet, hogy ezeket megkerülje, tanácsadó
  konzultációja nélkül.
- **Ne használja nyomás alatt a lepecsételésre, mielőtt a
  kiadási tesztelés befejeződne.** Egy részleges adat-pecsét
  félreértelmezi a kiadási döntés állapotát.
- **Ne használja legitimitási színházként.** Egy rosszul
  tervezett mintavételi terv vagy egy rosszul megválasztott
  analit-panel lepecsételése egy állandó nyilvános
  nyilvántartás az alkalmatlanságról, nem védekezés ellene.
  A primitív mindkét irányba vág; ez az ő őszintesége.
- **Ne használja egy aktív visszahívási helyzet alatt a
  szabályozó visszahívási koordinációja helyett.** Egy új
  MYRIAM-közzététel, amely lehorgonyozza a visszahívási
  hatókört, megfelelő AZUTÁN, hogy a szabályozó által
  koordinált visszahívás megindult; nem helyettesíti a
  szabályozó visszahívási csatornáját.

## Hogyan forkoljuk ezt a készletet valós kiadáshoz

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # cserélje le a fiktív tartalmat valós tételre
                           # alkalmazza az R1-R8 visszautasítási szabályokat végig
bash build/seal.sh         # PECSÉTELJEN az első forgalmazási mozgás ELŐTT
python3 build/verify.py    # erősítse meg
```

**KRITIKUS IDŐZÍTÉS:** pecsételjen a QA-kiadás pillanatában,
MIELŐTT a tétel forgalmazásra kerül (mielőtt az első kamion
elhagyja a létesítményt). A forgalmazás megkezdése utáni
pecsét még mindig értékes, de nem horgonyozza le tisztán a
forgalmazás előtti állapotot. A megfelelő időablak a QA-kiadási
aláírás és az első forgalmazási mozgás között van.

**KRITIKUS FELÜLVIZSGÁLAT:** a pecsételés előtt futtassa át a
közzétételt egy második QA-felülvizsgálón (nem a vezetőn) és
a cég tanácsadóján. Amint lepecsételték, a közzététel állandó.

## Integráció a meglévő élelmiszer-biztonsági infrastruktúrával

- **FDA FSMA Megelőző Szabályozás Emberi Élelmiszerekre
  (21 CFR 117).** A lepecsételt közzétételi URL vagy IPFS CID
  hivatkozható az Élelmiszer-biztonsági Terv
  dokumentációjában mint a nyilvános tanúsítvány-műtárgy
  erre a tételre.
- **USDA FSIS HACCP-tervek és kiadási nyilvántartások.** A
  lepecsételt kiadási nyilvántartás az FSIS által megkövetelt
  HACCP-nyilvántartások mellett helyezkedik el; a pecsét
  hivatkozik a HACCP-terv-verzió hash-ére (FACT 02), így a
  későbbi viták arról, hogy melyik tervváltozat volt
  érvényben, nyilvánosan cáfolhatók.
- **Codex Alimentarius / HACCP-elvek** (Codex CAC/RCP 1-1969
  Rev. 4-2003). A pecsét elkötelezi magát a hét HACCP-elv
  kimeneteinek (veszélyelemzés, CCP-k, kritikus határértékek,
  monitoring, helyreigazító intézkedések, ellenőrzés,
  nyilvántartás) erre a tételre.
- **ISO 22000:2018 (Élelmiszer-biztonsági irányítási
  rendszerek).** A pecsét hivatkozható a vezetői
  felülvizsgálati bizonyíték-nyom részeként; nem
  helyettesíti az ISO 22000 tanúsítást.
- **FSSC 22000 v6 tanúsítási séma.** Kompatibilis kiegészítő
  átláthatósági rétegként; az FSSC auditora ellenőrizheti a
  pecsétet a felügyelet során.
- **EU 178/2002/EK rendelet (Általános Élelmiszerjog) 18.
  cikk (visszakövethetőség) és 19. cikk (visszahívási
  értesítés).** A pecsét a gyártó egy-szint-vissza
  visszakövethetőségi felkészültségét (FACT 07) és
  visszahívási kötelezettségvállalásait (FACT 06)
  elkötelezi; nem helyettesíti a törvényi 19. cikk szerinti
  értesítési kötelezettséget.
- **EU Higiéniai csomag (852/2004, 853/2004, 854/2004,
  882/2004 rendeletek).** Kompatibilis; a pecsét hivatkozik
  a Higiéniai csomag HACCP- és önellenőrzési nyilvántartásai
  megfelelőjére.
- **BRCGS / SQF magán-szabványú sémák.** Kompatibilis
  kiegészítő átláthatósági rétegként.
- **Közegészségügyi felügyeleti rendszerek (CDC PulseNet,
  FoodNet, IFSAC; EU EFSA / ECDC).** Közvetlenül a pecséten
  kívül esik, de a FACT 06 elkötelezi a gyártót a
  részvételre és bármely jelkorrelációs esemény új
  MYRIAM-közzétételként való lepecsételésére.

## Amit ez a készlet NEM helyettesít

- FDA Élelmiszeripari Létesítmény-regisztráció vagy USDA
  FSIS Létesítmény-jóváhagyás.
- Az írott Élelmiszer-biztonsági Terv / HACCP-terv az
  FSMA / FSIS alatt.
- CCP-monitoring naplók és helyreigazító intézkedési
  nyilvántartások.
- ISO 17025 laboratóriumi akkreditációs felügyelet.
- Jártassági vizsgálati programok.
- Szabályozói ellenőrzés (FSIS folyamatos ellenőrzés,
  FDA periodikus ellenőrzés, EU illetékes hatósági
  ellenőrzés).
- Közegészségügyi felügyelet (CDC, EFSA, ECDC, nemzeti
  megfelelők).
- Visszahívási koordinációs csatornák (FDA Reportable Food
  Registry, FSIS visszahívási koordináció, EU RASFF,
  nemzeti megfelelők).
- Munkavállalói biztonsági és élelmiszer-munkavállalói
  képzési programok.

## Miért létezik ez a készlet a v0.4.0+ -ban

Ez egy a myriam-kit-tel szállított kidolgozott példák közül.
A korlát-elsős README-struktúrát követi, amelyet az
autoresearch validált, amelyet a
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` dokumentál — a
korlát-elsős prompt-változat ért el a legmagasabb pontszámot
egy súlyozott rubrikán több példa-területen, mivel az
élelmiszer-biztonsági tanúsítás pontosan az a terület, ahol a
pecsét által bizonyított dolgok túlhangsúlyozása veszélyes:
emberek haltak meg, és fognak meghalni olyan kudarcokban,
amelyeket a pecsét nem akadályozhat meg. A nyitó szakaszok a
készlet tartóelemei; a manifeszt tartalom a könnyű rész.

A készlet alapértelmezései szándékosan konzervatívak a
munkavállaló-név közzétételénél, konzervatívak a létesítmény-
elhelyezkedés pontosságánál, konzervatívak a beszállítói és
ügyfél identitásnál, és agresszívak a "ez nem állapítja meg a
biztonságot" nyilatkozatnál. Az élelmiszer-biztonsági közösségnek
dokumentált története van a túlhangsúlyozott tanúsítási
nyelvezetnek; a készlet alapértelmezetten arra a pozícióra
áll, amelyet a legkevésbé valószínű biztonsági garanciaként
olvasni. Azok a gyártók azon joghatóságokban, ahol a konkrét
nyilvános közzétételi követelmények eltérnek, ennek
megfelelően módosíthatják a forkjukat, de az alapértelmezett
visszautasítások a munkavállalói biztonságot és az őszinte
hatókört támogatják.

## Licenc

Közkincs (CC0). Forkolja. Nincs szükség forrásmegjelölésre.
