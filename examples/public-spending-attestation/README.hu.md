*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Közkiadások tanúsítási pecsételő készlet

Kulcsrakész myriam-kit példa önkormányzati, állami, tartományi és
nemzeti kormányok számára, akik a költségvetés-végrehajtási
nyilvántartásokat (szerződéskötések, kifizetések, teljesítések
elfogadása) kriptográfiailag lehorgonyozni kívánják a kibocsátás
pillanatában, hogy a közkiadási nyilvántartások csendes utólagos
módosítása nyilvánosan észlelhetővé váljon.

A pecsét egy **forenzikus horgony**, nem integritási tanúsítvány.
Azt rögzíti, hogy a pénzügyi hatóság mit jelentett azon a napon,
amelyen jelentette, olyan formában, amely később nem módosítható
csendesen anélkül, hogy nyilvánosan látható kriptográfiai
eltérést ne keltene.

---

## Mit NEM tesz ez a készlet (olvassa el először)

A pecsét egy kriptográfiai időbélyeg arra, amit tanúsítottak. Nem
tudja igazolni, hogy amit tanúsítottak, az **jogszerű, méltányos
vagy becsületes** volt-e. A következő hibamódok **a pecsét
hatókörén kívül esnek**:

1. **Felső szintű korrupció és kenőpénzek.** Ha egy beszerzés
   manipulált volt, egy beszállítót megvesztegetés miatt
   választottak ki, egy egyetlen forrás indoklást koholtak, vagy
   egy szerződést egy megegyezett kenőpénz-százalékkal felfújtak —
   a pecsét a rögzített tranzakciót horgonyozza le a felfújt árral
   és a kedvezményezett beszállítóval magas integritással. A pecsét
   a pénzügyi rendszer kimenetét figyeli; nincs rálátása a
   kibocsátás előtti korrupcióra. A brazil *Operação Lava Jato*
   szisztematikus, ~3%-os kartell-koordinált kenőpénzeket
   dokumentált a Petrobras szerződések ezreiben, amelyek a
   kibocsátás pillanatában teljesen rutinszerűnek tűnően pecsételve
   lettek volna.

2. **Fedőcégek általi tényleges tulajdonosi rejtegetés.** Egy
   „Acme Construction Ltd."-nek odaítélt szerződés a nyilvános
   nyilvántartásban szereplő entitásnévvel pecsételve van. Ha az
   „Acme" valójában egy nem közzétett politikailag exponált
   személy ellenőrzése alatt áll, vagy egyike azoknak a fedőcégek
   tucatjainak, amelyeket egyetlen kartell irányít, a pecsét a
   felszíni entitást horgonyozza le. A tényleges tulajdonosi
   átláthatóság KÜLÖN rendszer (FATF 24. ajánlás, EU 5AMLD/6AMLD,
   US Corporate Transparency Act), amelynek kimenete saját
   pecsételési protokollt igényel.

3. **Kibocsátás előtti könyvelési csalás.** Ha maga a pénzügyi
   hatóság koholja a nyilvántartást a pecsételés előtt — fantom
   szerződések, fantom alkalmazottak a bérlistán, fiktív
   teljesítések elfogadása — a pecsét a koholmányt horgonyozza
   le. A pecsét nem tudja észlelni, hogy a nyilvántartás hamis a
   rögzítésének pillanatában; csak azt tudja észlelni, hogy a
   nyilvántartás a pecsételés UTÁN megváltozott.

4. **Szelektív közzététel / cherry-picking.** Egy pénzügyi hatóság
   közzétehetne egy *részhalmazát* a tranzakcióknak — a tisztákat —
   és csak ezeket pecsételhetné le. A pecsét azt horgonyozza le,
   ami a közzétételben van; nem horgonyozza le a tranzakciók
   univerzumát, amelyeknek a közzétételben kellett volna lenniük.
   E készlet FACT 07 (kísérő közzétételek és elutasítási
   nyilvántartás) a strukturális védelem, de attól függ, hogy a
   kibocsátó hatóság becsületes-e arról, amit nem pecsétel le.

5. **Könyvön kívüli vagy költségvetésen kívüli kiadások.** Az
   állami vállalatokon, állami befektetési alapokon, speciális célú
   járműveken vagy költségvetésen kívüli alapszámlákon átfolyó
   közkiadások esetleg nem jelennek meg abban a költségvetésben,
   amelyet a pecsét lehorgonyoz. A pecsét azt rögzíti, amit a
   költségvetési rendszeren belül jelentettek; a rendszeren kívüli
   kiadások a pecsét hatókörén kívül esnek. Az iraki Coalition
   Provisional Authority (CPA) 2003–2004-es viták körülbelül 9
   milliárd USD készpénzes kifizetésről szóltak, amelyek
   nyilvántartásai részben elvesztek; a kifizetés pillanatában
   meglévő nyilvántartások lepecsételése lehorgonyozta volna őket,
   de nem teremtett volna olyan nyilvántartásokat, amelyeket a CPA
   nem vezetett.

6. **Kibocsátás utáni „magyarázat"-nyomás.** Egy lepecsételt
   túllépés, egy lepecsételt egyetlen forrás, vagy egy lepecsételt
   módosítás később bármilyen olyan keretezéssel újraelmondható,
   amilyet a politikai hatóság kíván. A pecsét a TÉNYEKET
   horgonyozza le a kibocsátás dátumán, de nem előlegezi meg a
   narratívát, amelyet ezek a tények később alátámasztanak majd.

7. **Kényszerített tanúsítás.** Ha a felelős pénzügyi megbízót
   arra kényszerítik, hogy aláírjon egy tanúsítást, amely
   tévesen ábrázolja a tranzakciókat, a pecsét a kényszerített
   tanúsítást horgonyozza le a kényszerített aláírással. A pecsét
   azt ellenőrzi, KI írt alá (FACT 08), nem azt, hogy MIÉRT írt
   alá. Egy kényszerített tanúsítás lepecsételése állandó
   nyilvános nyilvántartást hoz létre a kényszerített kimenetről —
   később elszámoltathatósághoz hasznos, de pillanatnyilag nem
   védelem a kényszer ellen.

8. **Joghatóságok közötti összehasonlítás.** Egy lepecsételt
   kiadás csak a kibocsátó joghatóságának jogrendszerével szemben
   olvasható. „Miért fizetett X önkormányzat Y-t Z szolgáltatásért,
   amikor W önkormányzat csak V-t fizetett?" — ez a pecsételésen
   túli komparatív elemzési kérdés. A joghatóságok közötti
   benchmarking egy lepecsételt adatokon végzett elemzési feladat,
   nem a pecsét tulajdonsága.

**A becsületes határok fenti szakasza a készlet teherviselő
része.** A pénzügyi tisztviselők és politikusok, akik úgy hiszik,
hogy a pecsételés egyenlő az integritással, pajzsként fogják
használni ezt a készletet. A készletnek világosan ki kell mondania:
ez egy *kibocsátás-pillanati nem-letagadási primitív*, nem a
kiadási integritás bizonyítása.

---

## Mit KELL ELUTASÍTANIA a készletnek

A készlet úgy van konfigurálva, hogy elutasítsa a következő
ténymintázatokat, még akkor is, ha érvényes aláírási
jogosultsággal rendelkező felhasználó nyújtja be őket:

- **Egyes kormánytisztviselők neve a megbízott aláíró szint
  alatt.** Egyetlen tény sem nevezhet meg egyes
  beszerzésiroda-alkalmazottakat, egyes pénztáros-tisztviselőket,
  egyes pontozási-bizottsági tagokat, vagy bármely természetes
  személyt, aki nincs nyilvánosan elszámoltatható szerepben. A
  vonalbeli személyzetre nehezedő megtorlási kockázat meghaladja
  az átláthatósági előnyt; identitásuk a belső ellenőrzésekben
  van pecsételve (FACT 05 az aláírási napló hash-e), nem a
  tanúsítás testében.

- **Beszállítói PII.** Egyetlen tény sem tartalmazhat beszállítói
  bankszámlaszámokat, egyes beszállítói alkalmazotti neveket,
  beszállítói lakcímeket, természetes személyek beszállítói
  adóazonosítóit, beszállítói költségstruktúrát tartalmazó belső
  árlebontásokat, vagy bármely más kereskedelmi-PII mezőt, amelynek
  közzététele kárt okoz a beszállítói érdekekben anélkül, hogy
  korrupcióellenes célt szolgálna. Az ilyen információ HASH-elhető
  (FACT 05), de nem tehető közzé.

- **Biztonsági okból minősített kiadások.** A nemzetbiztonsági
  jogszabályok alapján minősített kiadások NEM jogosultak az e
  készlet általi pecsételésre. A minősített kezelés egy különálló
  probléma különböző kriptográfiai és jogi követelményekkel. Maga
  a kizárás közzé van téve a FACT 07 R3-ban, hogy az olvasó tudja,
  a közzététel szándékosan részleges.

- **Adózási kötelezettségek civil végrehajtása azonosított
  természetes személyekkel szemben.** Bár a végrehajtási költségek
  közkiadások, a végrehajtás alatt álló egyes adófizetők
  megnevezése elutasításra kerül: az adatvédelmi sérelem
  meghaladja az átláthatósági előnyt, és párhuzamos átláthatóság
  létezik az adóbírósági jelentés alatt.

- **Kibocsátás előtti tranzakciók.** Nincs szerződés a formális
  odaítélés előtt; nincs kifizetés a formális kibocsátás előtt.
  Egy szerződéstervezet vagy egy függőben lévő kifizetés
  lepecsételése, mintha végrehajtották volna, hamis bizonyosságot
  teremt.

- **Pecsételés a felelős pénzügyi megbízón kívül bárki más által.**
  Egy vállalkozó, beszállító, tanácstag, újságíró vagy megfigyelő
  nem pecsételheti le „a közkiadási nyilvántartást" a kibocsátó
  pénzügyi hatóság helyett. (Saját megfigyeléseiket saját
  megbízójuk alatt, külön közzétételben lepecsételhetik.)

- **„Korrupció-mentes" keretezések.** A készlet elutasítja olyan
  keretezések pecsételését, amelyek formája „ez a kiadás
  jogszerű és korrupciómentes volt" vagy „a beszerzés
  bizonyíthatóan tisztességes volt." Az ilyen állítások
  episztemikusan a készlet hatókörén kívül esnek.

- **FACT 07 kísérő közzétételeket kihagyó publikációk.** A
  tranzakciók közzététele a kísérő közzétételi és elutasítási
  nyilvántartás nélkül nem legitim MYRIAM-közzététel e készlet
  alatt.

Maga az elutasítás tényként pecsételhető („Ez a fél X
pecsételését kérte; a készlet Y elutasítási szabály szerint
elutasította"), nyilvános nyilvántartást hozva létre a kísérlet
történt visszaélésről. Olyan területen, ahol a pénzügyi
tisztviselőkre nehezedő politikai nyomás dokumentált, az
*elutasított* kérelmek nyilvántartása maga is integritási jel.

---

## Mit pecsétel le ez a készlet

8 tényt a költségvetés-végrehajtási tanúsítás pillanatában:

1. **Példa-értesítés** — kijelenti, hogy a közzététel példa
   (a valós tanúsítások eltávolítják vagy lecserélik ezt).
2. **Joghatóság és jogalap** — melyik kormányzati entitás bocsát
   ki, milyen jogszabályi felhatalmazás alapján, melyik pénzügyi
   időszakban.
3. **Költségvetési előirányzat vagy költségvetési hivatkozás** —
   az elfogadott költségvetésben végrehajtott konkrét sorok, a
   költségvetési eszköz és minden módosítás / átutalás /
   átcsoportosítás hash-ével.
4. **Szerződés- vagy kifizetési manifeszt** —
   tranzakciónkénti rekord: összeg, beszállító jogi entitásnév
   (nincs egyéni PII), cél, dátum, beszerzés típusa, odaítélési
   alap, szerződésdokumentum hash-e.
5. **Támogató dokumentumok hash-ei** — SHA-256 a kiírásokról,
   értékelésekről, végrehajtott szerződésekről, módosító
   megrendelésekről, fizetési kérelmekről, teljesítés-elfogadási
   űrlapokról, kincstári főkönyvi bejegyzésekről, ellenőrzési
   aláírási naplókról. Csak hash-ek, nem tartalom — a kereskedelmi
   és személyes PII védelme érdekében, miközben lehetővé teszi az
   újra-hash-eléses ellenőrzést.
6. **Audit és felügyeleti állapot** — melyik főfelügyelői testület
   rendelkezik joghatósággal, melyik legfőbb auditintézmény,
   melyik ügyészségi testületnek van joghatósága a korrupciós
   bűncselekmények felett, audithatáridők, bármely folyamatban
   lévő felülvizsgálat jelenlegi állapota.
7. **Kísérő közzétételek és elutasítási nyilvántartás** —
   függőben lévő beszerzési óvások, függőben lévő belső
   vizsgálatok, kintlévő FOI-kérelmek, eltérő felülvizsgálatok,
   ismert költségvetési sor túllépések; a készlet által
   pecsételésre elutasított minták explicit listája.
8. **Aláíró megbízó** — felelős pénzügyi tisztviselő + szerep +
   jogszabályi elszámoltathatóság + társaláírók kettős ellenőrzés
   alatt; mit tanúsít személyesen az egyes aláírók és mit nem.

Minden tény az elutasítási kapu konvenciójával zárul: *„Ez a tény
csak X-et állítja. Nem állítja Y-t"* (ahol Y a „NEM tesz" szakasz
legközelebbi hibamódja).

---

## Mi ellen véd ez a készlet

- **Szerződésösszegek csendes kibocsátás utáni felülvizsgálata.**
  A FACT 04 bármely összegének bármilyen módosítása más SHA-256-ot,
  más Merkle gyökeret eredményez, és nem felel meg az OTS
  ellenőrzésnek.
- **Csendes beszállító-csere.** Egy „A beszállító" lecserélése
  „B beszállítóra" egy már kibocsátott szerződésen észlelhető a
  lepecsételt bájtokból.
- **Módosítási megrendelések visszadátumozása.** A FACT 04
  befagyasztja a módosító megrendelés dátumát és indoklását a
  kibocsátáskor; minden későbbi „ez mindig is az egyetértett
  hatókör volt" állítás meg kell küzdjön a lepecsételt módosítási
  megrendelés nyilvántartással.
- **Kedvezőtlen tranzakciók csendes eltűnése.** Az időszakban
  kibocsátott összes tranzakció a FACT 04-ben egyetlen Merkle
  gyökér alatt található. Egy részhalmaz közzététele észlelhető a
  levél-hash listából.
- **Kísérő közzétételek elnyomása.** A FACT 07 befagyasztja a
  függőben lévő óvás, függőben lévő vizsgálat és kintlévő FOI
  állapotát a tanúsítás pillanatában. Bármely későbbi „soha nem
  hallottunk arról az óvásról" állítás nyilvánosan diffolható.
- **Audit-joghatósági elmozdulás.** A FACT 06 befagyasztja, mely
  testületek rendelkeznek felügyeleti joghatósággal a lepecsételt
  tranzakciók felett. Egy későbbi állítás, hogy egy adott
  főfelügyelőnek „nem volt hatásköre", meg kell küzdjön a
  lepecsételt joghatósági nyilvántartással.
- **Elutasítási nyilvántartás törlése.** A FACT 07 azt rögzíti,
  amit a készlet elutasított pecsételésre; bármely későbbi „soha
  semmit nem utasítottunk el" állítás ellentmond a lepecsételt
  nyilvántartásnak.

---

## Történelmi esetek, amelyekkel a készlet segített volna

A készlet hasznos **forenzikus horgonyt** termelt volna — *nem
javítást, nem prevenciót, nem büntetőeljárás helyettesítését* —
nyilvánosan dokumentált közkiadási nyilvántartások csendes
utólagos módosítását érintő esetekben:

- **Brazília — *Operação Lava Jato* / Petrobras vonalvezeték
  (2014–2021).** Brazil szövetségi ügyészek dokumentáltak egy
  nagy építőipari cégekből álló kartellt, amely több mint egy
  évtizeden át átlagosan ~3%-os kenőpénzeket fizetett a Petrobras
  és más szövetségi infrastruktúrás szerződéseken, a kenőpénzeket
  politikusokhoz és a kartell saját árkoordinációjához továbbítva.
  A kibocsátott szerződések rutinszerűnek tűntek; a korrupció a
  kibocsátás előtt volt. Egy pecsételő készlet NEM ELŐZTE volna meg
  a Lava Jato-t (a kenőpénzek a szerződésnek a pecsétig való
  eljutása ELŐTT az árba épültek), de lehorgonyozta volna a
  szerződésfeltételeket a kibocsátáskor — rendkívülien olcsóbbá
  téve a későbbi forenzikus rekonstrukciót arról, „hogy az egyes
  szerződések ténylegesen mit mondtak, amikor aláírták őket". A
  Lava Jato nyomozási költsége nagyrészt az inkonzisztens
  archivált nyilvántartásokból való időrendi rekonstrukció
  költsége volt.

- **Európai Unió — regionális fejlesztési alapokról szóló viták
  (több tagállam, 2010-es–2020-as évek).** Az Európai Számvevőszék
  éves jelentései ismételten azonosítottak lényeges hibaarányokat
  az Európai Strukturális és Beruházási Alapok (ESIF) és Kohéziós
  Alap kiadásokban, egyes években meghaladva a lényegességi
  küszöböt. „Amit ténylegesen igényeltek" és „amit ténylegesen
  szállítottak" közötti viták visszatérnek, mert az igénylési
  dokumentáció felülvizsgálható a benyújtás és az audit között.
  A benyújtott igénylés per-kibocsátási MYRIAM pecsételése
  lehorgonyozta volna minden igénylés tartalmát a benyújtáskor,
  szétválasztva a „mit állított a kedvezményezett akkor"-t az
  „auditkövető rekonstrukció mire jutott"-tól.

- **Irak — Coalition Provisional Authority (CPA) kifizetések,
  2003–2004.** A CPA körülbelül 9 milliárd USD-t fizetett ki
  készpénzben a Development Fund for Iraq-ból olyan
  dokumentációval, amelyet a Special Inspector General for Iraq
  Reconstruction (SIGIR) és későbbi auditjelentések jellemzően
  jelentősen hiányosnak jellemeztek. A kifizetési
  nyilvántartásokról szóló viták két évtizeddel később is
  fennállnak. A kifizetés pillanatában történő pecsételés nem
  hozott volna létre olyan nyilvántartásokat, amelyeket a CPA nem
  vezetett — de ahol valamilyen nyilvántartás létezett (kézzel
  írott főkönyvek, dátumozott átutalási engedélyek), egy
  egyidejű pecsét lehorgonyozta volna annak a nyilvántartásnak a
  bájtszerű állapotát a kibocsátás pillanatában, szétválasztva „a
  nyilvántartást akkor"-t a „nyilvántartástól, ahogy később
  rekonstruálták".

- **Görögország — államadósság és közkiadási jelentések
  felülvizsgálata (2009–2010).** Az Eurostat 2009–2010-es auditjai
  jelentős felülvizsgálatokat dokumentáltak a korábban jelentett
  görög fiskális adatokban, ahol maga a felülvizsgálati módszertan
  is vitatott volt. A negyedéves kiadási jelentések eredeti
  közzététel pillanatában történő pecsételése nyilvánosan
  diffolhatóvá tette volna az eredeti és felülvizsgált jelentések
  közötti *deltát*, ahelyett, hogy csak archív-összehasonlítással
  lett volna rekonstruálható. A pecsét nem előzte volna meg az
  alapul szolgáló módszertani vitát, de lehorgonyozta volna minden
  jelentett negyedévet az eredeti jelentés pillanatában.

- **Egyesült Királyság — pandémiás beszerzések (2020–2022).** A UK
  National Audit Office és parlamenti bizottsági jelentések
  azonosítottak beszerzési folyamatokat 2020–2021-ben, amelyekben
  szerződéseket ítéltek oda vészhelyzeti rendelkezések alatt
  csökkentett versennyel és csökkentett dokumentációval; egyes
  odaítéléseket később módosítottak, töröltek vagy rendeztek. Az
  egyes vészhelyzeti beszerzési odaítélések per-kibocsátási
  pecsételése lehorgonyozta volna az odaítélési indoklást és
  feltételeket az odaítélés pillanatában, a későbbi módosításokat
  nyilvánosan látható deltává téve a csendesen módosított
  nyilvántartás helyett.

- **Dél-Afrika — state-capture-korszakbeli állami vállalati
  szerződések (~2010–2018).** A Zondo Bizottság szerződéseket
  dokumentált több állami vállalatnál (Eskom, Transnet, Denel),
  amelyek dokumentációja változatosan hiányos, felülvizsgált vagy
  vitatott volt. Minden szerződés odaítélésének pecsételése a
  kibocsátáskor lehorgonyozta volna az odaítélt állapotát a
  nyilvántartásnak, szétválasztva a későbbi forenzikus
  rekonstrukciós kimeneteket az egyidejű nyilvántartástól.

A készlet a fenti esetek egyikében sem ELŐZTE volna meg az
alapul szolgáló korrupciót. Számos esetben az alapul szolgáló
probléma az volt, hogy a korrupció a *kibocsátás előtt* zajlott —
a pecsét a korrupt szerződést lehorgonyozza magas integritással,
ami egy más fajta hasznosság (forenzikus horgony későbbi
elszámoltathatósághoz), de nem ugyanaz, mint a prevenció. Más
esetekben (CPA készpénz, költségvetésen kívüli kiadások) az alapul
szolgáló probléma az volt, hogy a pecsételendő nyilvántartások
nem léteztek vagy nem voltak megtartva — a készlet nem hozhat
létre olyan nyilvántartásokat, amelyeket a hatóság nem
készített.

Ezeket a történelmi eseteket csak nyilvánosan dokumentált
megállapításokkal (bírósági nyilvántartások, parlamenti bizottsági
jelentések, auditkar-testületi közzétételek) együtt nevezzük meg.
Nincs állítás egyetlen egyénről sem; a dokumentált
intézményi megállapítások a nyilvános nyilvántartáson állnak.

---

## Mikor használjuk ezt a készletet

- A joghatósága rendelkezik kialakult költségvetés-végrehajtási
  jelentési folyamattal, és szeretne hozzáadni egy
  megváltoztathatatlan nyilvános horgonyt.
- Kibocsátás utáni vizsgálatra számít (FOI-kérelmek, audit,
  civil-társadalmi monitoring, újságírói vizsgálat) és
  manipuláció-evidens referenciapontot szeretne.
- Jogi felhatalmazása van átláthatósági / nyitott-nyilvántartási
  jog alatt a felsorolt ténykészlet közzétételére, a
  magánéleti/biztonsági kizárások betartásával.
- Jogszabályi auditrendszer alatt működik (főfelügyelő, legfőbb
  auditintézmény), és szeretné lehorgonyozni minden negyedéves
  zárást, mielőtt az auditciklus elérné azt.
- Az Open Contracting Data Standard vagy IATI alatt tesz közzé,
  és szeretne egy kriptográfiai kiegészítőt a portál-alapú
  közzététel mellé.

## Mikor NE használjuk ezt a készletet

- **Ne használja jogszabályi audit, főfelügyelői felülvizsgálat,
  ügyészségi vizsgálat vagy civil-társadalmi monitoring
  helyettesítésére.** A készlet *kiegészítő*, nem helyettesítő.
- **Ne használja legitimitási tanúsítványként.** Egy lepecsételt
  kiadási nyilvántartás nem korrupciómentes tanúsítvány. Ennek
  ilyenként kezelése pontosan az a hibamód, amelynek a készlet
  korlátozás-első struktúrája megelőzésére létezik.
- **Ne használja időszak közepén.** A készlet a formális
  kibocsátás pillanatára való (negyedéves zárás,
  szerződés-odaítélés, mérföldkő-kifizetés). Időszak közepi
  pecsétek félrevezető referenciapontokat hoznak létre.
- **Ne használja annak állítására, hogy a kiadás jogszerű,
  méltányos vagy nem korrupt volt** — a készlet ezt nem
  tudja megtenni.
- **Ne használja minősített kiadások, egyéni alkalmazotti PII vagy
  beszállítói kereskedelmi PII pecsételésére.** A készlet
  elutasítja ezeket a mintákat; megkísérlésük elutasítási
  nyilvántartást hoz létre (FACT 07).
- **Ne használja kibocsátás előtti tervezetek pecsételésére.**
  A tervezetek pecsételhetők egy más tanúsítástípus alatt
  („tervezet véleményezésre, nem kibocsátva"), de nem e készlet
  kibocsátási típusa alatt.
- **Ne használja nyomás alatt a FACT 07 közzétételek
  kihagyására.** Utasítsa el, és pecsételje le az elutasítást.
- **Ne használja, ha a pénzügyi hatósága megragadott.** Egy
  lepecsételt csaló kiadás a csalás állandó nyilvános
  nyilvántartása, nem annak védelme. A primitív mindkét irányba
  vág; ebben rejlik becsületessége.

---

## Hogyan forkoljuk ezt a készletet valós tanúsításhoz

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Kritikus időzítés:** pecsételjen a formális kibocsátás
pillanatában — azaz akkor, amikor a felelős pénzügyi megbízó
aláírja a negyedéves zárást, amikor egy szerződést formálisan
odaítélnek, vagy amikor egy kifizetést formálisan kibocsátanak.
Egy formális kibocsátás előtti pecsét hamis-pozitív „ez a
hivatalos nyilvántartás" referenciát hoz létre. Egy formális
kibocsátás utáni jóval későbbi pecsét forenzikusan gyengébb a
közbenső módosításokkal szemben.

**Kadencia:** a készlet alapértelmezésként negyedéves
tanúsításokra van tervezve. A negyedévnél rövidebb kadenciák
(havi zárás, per-tranzakciós pecsételés) támogatottak megfelelő
hatókörrel való újrafuttatással; egy egyetlen nagy értékű
tranzakció pecsétje legitim használat.

---

## Integráció a meglévő közpénzügyi infrastruktúrával

A készlet úgy van tervezve, hogy összekapcsolódjon, nem
helyettesítse a következőket:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Az öt
  közzétételi pont (tervezés, pályázat, odaítélés, szerződés,
  végrehajtás) természetesen leképeződik FACT 03-ra (tervezés →
  előirányzat), FACT 04-re (pályázat, odaítélés, szerződés,
  végrehajtás → tranzakciós manifeszt) és FACT 05-re (támogató
  dokumentum hash-ek). Maga az OCDS JSON exportja a FACT 05-ben
  van pecsételve (kontrolldokumentumok). Egy OCDS-közzétételt
  futtató joghatóság hozzáadhatja a MYRIAM pecsételést
  kriptográfiai rétegként a meglévő portálja tetejére.

- **International Aid Transparency Initiative (IATI) standard
  v2.03.** Egészben vagy részben külső segélyből finanszírozott
  kiadások esetén az IATI XML kontrolldokumentumként
  pecsételhető; a pecsét kriptográfiai kiegészítőt nyújt az IATI
  Registry HTTP-alapú közzétételi modellje mellé.

- **Open Government Partnership (OGP) elkötelezettségek.** Az OGP
  Nemzeti Cselekvési Tervek gyakran tartalmaznak fiskális
  átláthatósági elkötelezettségeket; a MYRIAM pecsételés
  „manipuláció-evidens közzététel" elkötelezettséget
  operacionalizál olyan módon, amely a kormányzati portálba vetett
  bizalom nélkül a civil-társadalom által függetlenül ellenőrizhető.

- **OECD Ajánlás a közintegritásról (2017).** A készlet támogatja
  a 4. ajánlást (gépileg olvasható, időszerű formában lévő nyitott
  kormányzati adatok a közpénzügyekről) azzal, hogy az adatokat
  kriptográfiailag lehorgonyzottá és gépileg olvashatóvá teszi.

- **ENSZ Korrupcióellenes Egyezmény (UNCAC), különösen a 9.
  (beszerzés) és 13. (társadalmi részvétel) cikk.** A készlet
  forenzikus primitívet nyújt, amely támogatja a 9. cikk
  átláthatósági kötelezettségeit és a 13. cikk
  civil-társadalmi felügyeletét.

- **Legfőbb Auditintézmények (SAIs) — INTOSAI keretrendszer.** Az
  INTOSAI standardok (ISSAI) alatt működő SAIs nagy integritással
  fogyaszthatják a lepecsételt közzétételeket bizonyítékként; a
  FACT 05-ben lévő SHA-256 hash-ek ugyanazok a hash-ek, amelyeket
  a SAI e-audit eszközei újra kiszámíthatnak.

- **Főfelügyelői irodák.** A lepecsételt kiadások felett
  joghatósággal rendelkező hazai főfelügyelői irodák (FACT 06)
  beidézhetik a FACT 05-ben pecsételt hash-ű dokumentumtesteket;
  a pecsét a beidézés alatt kapott dokumentumtesteket köti a
  kibocsátáskor létezett testekhez.

- **Információszabadsági és nyitott-nyilvántartási jogszabályok.**
  A pecsét nem mentesíti a kibocsátó hatóságot a folyamatos FOI
  kötelezettségek alól; sőt, észlelhetővé teszi a szelektív FOI
  választ a lepecsételt nyilvántartástól való eltérésként. A FACT
  07 C3 lehorgonyozza a kintlévő FOI-kérelmeket a tanúsítás
  idején.

- **Tényleges tulajdonos nyilvántartások (FATF 24. ajánlás, EU
  AML irányelvek, US Corporate Transparency Act).** A tényleges
  tulajdonosi adatok NEM kerülnek pecsételésre e készlet alatt (a
  FACT 04 a beszállító identitását csak a bejegyzett jogi
  entitásnévből származtatja). A tényleges tulajdonosi közzététel
  egy különálló pecsételési rendszer, amely Merkle gyökérrel
  hivatkozott párhuzamos közzétételt eredményezhet.

- **Bíróság által felügyelt átláthatóság (bírósági
  kiadási jelentés, vagyonvisszaszerzési eljárások).** A
  korrupcióval kapcsolatos bírósági eljárások kimenetei nem
  tartoznak e készlet hatókörébe, de párhuzamos tanúsítástípusok
  alatt pecsételhetők.

## Mit NEM helyettesít ez a készlet

- Jogszabályi költségvetés-végrehajtási auditot főfelügyelői
  testületek által
- Legfőbb-auditintézményi felülvizsgálatot (GAO, NAO, TCU, CAG,
  AGN, BRH, Cour des comptes, ekvivalens)
- Korrupciós bűncselekmények ügyészségi vizsgálatát (nemzeti
  korrupcióellenes ügyészek, UNCAC 36. cikk testületei)
- Civil-társadalmi és újságírói nyomozói riportokat
- Whistleblower csatornákat és védett közzétételi rendszereket
- Tényleges tulajdonosi közzétételt
- Nemzetközi peer review-t (OECD, IMF Fiscal Transparency
  Evaluation, EU szemeszter, IATI registry)
- Bíróság által felügyelt vagyonvisszaszerzési eljárásokat

A pecsét egy forenzikus primitív, amely csökkenti a fentiek
mindegyikének költségét és növeli megbízhatóságát. Nem
helyettesítője és nem is lehet azoknak.

---

## Licenc

Public domain (CC0). Forkold. Nincs szükség attribútumra.
