*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Ellátási lánc auditálási tanúsítási pecsételő készlet

Kulcsrakész myriam-kit példa harmadik fél szociális/munkaügyi/
környezeti auditorok, házon belüli beszállítói megfelelési csapatok,
NGO ellátási lánc nyomozók és munkavállalói jogi szervezetek
számára, akik egy Bitcoinhoz lehorgonyzott, manipulációt felfedő
pecsétjét egy auditjelentésnek pontosan az aláírás pillanatában
kívánnak közzétenni.

---

## Mit NEM tesz ez a készlet (olvassa el először)

A pecsét egy kriptográfiai időbélyeg arra, amit az auditor
aláírt. Nem tudja igazolni, hogy amit aláírt, az **igaz**-e. A
következő hibamódok **a pecsét hatókörén kívül esnek**:

1. **Iparág általi audit-megragadás.** A márka által megrendelt
   auditoknak hosszú, dokumentált történelmük van a beszállítókra
   vonatkozó puha megállapítások előállítására, amelyek folyamatos
   üzleti kapcsolata a megrendelő márkával az auditkanalizációt
   áramoltatja. Egy megragadott audit lepecsételve állandó
   forenzikus nyilvántartást hoz létre a megragadott auditról. A
   pecsét nem javítja a megragadást — csak az aláírt auditot
   változtathatatlanná teszi, hogy egy későbbi
   igazságkereső folyamatnak legyen valami konkrét, amivel
   összehasonlíthat.

2. **Betanított munkások / előkészített létesítmények.** Bejelentett
   vagy félig bejelentett auditok napokat vagy heteket adnak a
   vezetésnek arra, hogy bevágják a munkások válaszait, elrejtsék
   a kiskorú munkavállalókat, kitakarítsák a lakóhelyiségeket,
   eltávolítsák a nem megfelelő berendezéseket, és átirányítsák
   a munkát nem auditált alvállalkozókhoz az audit ablakában. A
   pecsét azt horgonyozza le, amit az auditoroknak megmutattak,
   nem azt, amit megakadályoztak, hogy lássanak.

3. **Rejtett alvállalkozás.** A Tier-2 és Tier-3 alvállalkozás, az
   otthoni munkavégzés, és az informális szektorban való gyártás
   átfogóan láthatatlan a gyárpadlón végzett auditok számára. A
   pecsét egy Tier-1 auditot horgonyoz le; nem tudja észlelni,
   hogy a Tier-1 az audit ablakában vagy rutinszerűen
   alvállalkozóként kiszervez egy nem auditált Tier-2-nek.

4. **Auditok, amelyek rendszeresen elkerülik a célzott
   visszaélést.** A Rana Plaza, a 2013-as bangladesi
   konfekcióüzem-összeomlás, amely 1.134 munkavállalót ölt meg,
   a megelőző hónapokban több márka által megrendelt
   auditprogram által auditálva volt. Az épület repedései nem
   voltak a szociális-audit ellenőrzőlistán; az auditrendszerben
   nem volt szerkezeti-mérnöki hatókör. Az auditok azt
   horgonyozzák le, ami *hatókörben* van; a hatókörön kívüli
   visszaélések láthatatlanok maradnak függetlenül attól, mennyire
   manipuláció-evidens a pecsét.

5. **Aláírás utáni megtorlás interjún résztvevő munkások
   ellen.** Még elutasított helymeghatározási információval (FACT
   07 R3) is egy elszánt ellenfél, aki ismeri a beszállító ID-t,
   azonosíthatja a létesítményt. A munkavédelmi védelem többet
   igényel, mint pusztán a PII elutasítása a pecsétben — az
   audit-módszertan előtt anonimizálást igényel. A pecsét tartóssá
   teszi az aláírt auditot; nem védi visszamenőleg a megkérdezetteket.

6. **Munkakörülmények, amelyek jogszerűek, de embertelenek.**
   A megélhetési bér-rések olyan joghatóságokban, ahol a jogi
   minimálbér a megélhetési-bér viszonyítási alap alatt van,
   „megfelelő" audit-megállapításokat eredményeznek a
   bér-és-óra törvényekkel szemben, és „nem megfelelő"
   megállapításokat a megélhetési-bér standardokkal szemben
   ugyanabban az auditban (FACT 03 elem 8 ebben a példakészletben).
   A pecsét azt horgonyozza le, amit minden standard jelent;
   ezek összeegyeztetése későbbi politikai munka.

7. **Diffúz okosággal rendelkező éghajlati / környezeti károk.**
   A széndioxid-kibocsátások, az erdőirtáshoz való hozzájárulások,
   a vízkimerítés és a szennyezőanyag-kibocsátások a beszállítóktól
   lepecsételhetők az audit-megállapításokban, de egy adott márka
   rendelési mennyiségéhez való ok-okozati hozzárendelés
   módszertanilag vitatott. A pecsét azt horgonyozza le, amit
   a beszállítónál mértek; nem rendel hozzá erkölcsi vagy jogi
   felelősséget.

8. **Viták arról, hogy melyik standard a hiteles.** SA8000 vs.
   BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs.
   vállalat-specifikus magatartási kódex: mindegyiknek más a
   hatóköre, a súlyossága és a kárelhárítási folyamata. A pecsét
   *egy* auditot horgonyoz le *egy* standard alatt.
   Cross-standard összehasonlítás egy későbbi probléma.

9. **Auditor kompetenciája vs. auditor hitelesítése.** A
   „hitelesített" nem „kompetens". Akkreditált képzési programokat
   befejező auditorok elkerülték a súlyos visszaéléseket a
   nyilvánosan látható katasztrófákat megelőző auditokban. A
   pecsét hitelesítéseket horgonyoz le; nem tanúsítja a
   kompetenciát, amellyel gyakorolták azokat.

**A becsületes határok fenti szakasza a készlet teherviselő
része.** Egy legitimitási színházat akaró márka lepecsételt
auditot fog használni pajzsként. A készletnek világosan ki kell
mondania: ez egy *nem-letagadási primitív az
auditjelentés-aláírási pillanatra*, nem a beszállítói megfelelés
vagy munkavállalói jólét bizonyítása.

---

## Mit KELL ELUTASÍTANIA a készletnek

A készlet úgy van konfigurálva, hogy elutasítsa a következő
ténymintázatokat, még akkor is, ha érvényes audit-testületi
jogosultsággal rendelkező felhasználó nyújtja be őket:

- **Egyéni munkavállaló azonosítása.** Egyetlen tény sem nevezhet
  meg munkást, nem köthet össze idézetet munkással, nem tehet
  közzé jelvényszámot, sori pozíciót, lakóhelyi szobát, műszak-
  beosztást, demográfiai kombinációt N<5-tel, vagy bármely olyan
  mezőt, amely újra azonosíthat valakit, aki interjún vett részt.
  A munkavállalói idézetek véletlenszerű tokeneket használnak; a
  leképezés soha nincs pecsételve.
- **Whistleblower / informátor források.** Ha egy megállapítás
  olyan egyén közzétételén alapul, aki kockázatot vállalt a
  közzététellel, az egyén soha nincs megnevezve vagy
  azonosítva a lepecsételt közzétételben.
- **Pontos helymeghatározási információ.** Nincs utcacím, GPS,
  >1km felbontású műholdkép vagy külső épületfotó. Az ország és
  régió a pecsételt maximális felbontás. Indoklás: a
  létesítmény-azonosítás lehetővé teszi a megtorlást az
  interjú-résztvevőkkel szemben.
- **Tiszta audit certifikációs igény.** A készlet elutasítja olyan
  keretezés pecsételését, amelynek formája „ez az audit
  bizonyítja, hogy a beszállító megfelelő" vagy „nincsenek
  szabálysértések". A tisztasági igények az audit-módszertan
  által episztemikusan nem támogatottak.
- **Pecsét-mint-tanúsítvány helyettesítés.** Egy közzététel, amely
  kihagyja a módszertant (FACT 04), függetlenséget (FACT 06),
  vagy elutasításokat (FACT 07) nem legitim MYRIAM-közzététel e
  készlet alatt.
- **Tervezet / aláírás előtti auditok.** A pecsételés az aláíráskor
  történik, nem előtte. Az előzetes auditok hamis bizonyosságot
  hoznak létre.
- **Utólagos kedvező újrapecsételés.** Egy módosított audit ÚJ
  lepecsételt közzétételt igényel, amely Merkle gyökérrel
  hivatkozik az eredetire. Az eredeti lepecsételt audit
  állandóan láthatóan az aláírt auditként marad.
- **Pecsételés bármely más fél által, mint az audit-testület.**
  Egy márka, beszállító, tanúsítási testület vagy harmadik fél
  nem pecsételheti le „az auditot" az audit-testület helyett,
  amely a jelentést aláírta.

Maga az elutasítás tényként pecsételhető („Ez a fél X
pecsételését kérte; a készlet Y elutasítási szabály szerint
elutasította"), nyilvános nyilvántartást hozva létre a kísérlet
történt visszaélésről. **Egy elterjedt audit-megragadással
rendelkező iparban a pecsételés-elutasítás maga is értelmes jel
lehet:** egy audit-testület, amely nem pecsétel, mert egy márka
nyomást gyakorolt a megállapítások puhítására, lehetősége van
arra, hogy a saját megbízója alatt nyilvánosan rögzítse az
elutasítást.

---

## Mit pecsétel le ez a készlet

8 tényt az audit aláírás pillanatában:

1. **Példa-értesítés** — kijelenti, hogy a közzététel példa
   (a valós tanúsítások eltávolítják vagy lecserélik ezt).
2. **Audit hatókör és alany** — auditstandard, audit-testület,
   vezető auditor, audit-csapat mérete, beszállító azonosító
   (nincs pontos helymeghatározási információ), audit ablak,
   bejelentés típusa (bejelentett / félig bejelentett / nem
   bejelentett), auditjelentés dátuma, aláírási verzió,
   megnevezett címzett márkák, megrendelő fél.
3. **Audit-megállapítások manifeszt** — elemenkénti megfelelés /
   minor-NC / major-NC / kritikus-NC a standarddal szemben,
   mindegyik a teljes megállapítás-leírás SHA-256-ával. Aggregált
   összegek. Tanúsítási ajánlás aláíráskor.
4. **Módszertan és bizonyíték** — helyszíni időallokáció,
   interjú-számok (rétegzéssel: nem, migráns státusz, szolgálati
   idő), interjú-formátum lebontása, tolmács kapcsolat,
   dokumentum-felülvizsgálat mintaméretekkel és
   tartalom-hash-ekkel, helyszíni-látogatási artefaktumok
   (elmosott munkás-arcokkal), ismert módszertani korlátozások.
5. **Elkötelezett kárelhárítási intézkedések** — major-NC és
   minor-NC szerinti CAP a kijelentett gyökér ok-ával, határidővel,
   ellenőrzési mechanizmussal, eszkalációs elkötelezettségekkel,
   no-silent-relaxation elkötelezettséggel.
6. **Auditor képesítések és függetlenség** — audit-testületi
   akkreditáció, ügyfél-koncentráció, vezető-auditor hitelesítések
   és nyelvi kompetencia, ágazati tapasztalat, függetlenségi
   nyilatkozatok (auditor-beszállító, auditor-márka,
   tanúsító-testület elválasztás).
7. **Kísérő közzétételek és elutasítási nyilvántartás** —
   érdekellentét (explicit), korábbi audit-történet, közölt
   munkavállalói-hang csatornák, párhuzamos vizsgálatok,
   audit-testületi belső nézeteltérés, elutasítási szabály
   lista, ez auditban ténylegesen alkalmazott elutasítások.
8. **Aláíró megbízó** — audit-testület, vezető auditor, audit-csapat,
   engedélyező tisztviselő, kriptográfiai kulcs-információ.

Minden tény az elutasítási kapu konvenciójával zárul: *„Ez a tény
csak X-et állítja. Nem állítja Y-t"* (ahol Y a „NEM tesz" szakasz
legközelebbi hibamódja).

---

## Mi ellen véd ez a készlet

- **Aláírás utáni csendes nagy nem-megfelelőségek puhítása.**
  A FACT 03 bármilyen módosítása (pl. egy MAJOR_NC átsorolása
  MINOR_NC-re, vagy egy megállapítás teljes törlése) más
  SHA-256-ot, más Merkle gyökeret eredményez, és nem felel meg
  az OTS ellenőrzésnek.
- **Kárelhárítási intézkedés-lezárások visszadátumozása.** A
  FACT 05 befagyasztja a CAP-ot és határidőit az aláíráskor;
  bármely „mi azt az NC-t múlt hónapban lezártuk" állítás, amely
  ellentmond a lepecsételt határidőknek, nyilvánosan diffolható.
- **Módszertani revíziónizmus.** A FACT 04 befagyasztja az
  interjú-számokat, dokumentum-mintaméreteket és helyszíni
  órákat az aláíráskor — megakadályozva, hogy a későbbi „mélyreható
  vizsgálatot végeztünk" védekezés cáfolhatatlan legyen.
- **Szelektív újraközzététel, amely kihagyja a kedvezőtlen
  megállapításokat.** Mind a 8 tényt egyetlen Merkle gyökér köti
  össze; néhány tény idézése mások kihagyása mellett
  észlelhető a közzétett levél-listából.
- **Függetlenségi igény elmozdulása.** A FACT 06 befagyasztja a
  függetlenségi nyilatkozatokat aláíráskor. Egy későbbi „ez az
  audit szigorúan független volt" igénynek meg kell küzdenie a
  lepecsételt ügyfél-koncentrációs százalékkal és a lepecsételt
  márka-finanszírozott megrendelési közzététellel.
- **Elutasítási nyilvántartás törlése.** A FACT 07 befagyasztja
  azokat a ténymintákat, amelyeket a készlet elutasított;
  bármely későbbi „soha semmit nem utasítottunk el" állítás
  ellentmond a lepecsételt nyilvántartásnak.

---

## Történelmi vagy közel-történelmi esetek, amelyekkel a készlet segített volna

A készlet hasznos **forenzikus horgonyt** termelt volna — *nem
javítást vagy prevenciót* — a következőket érintő esetekben:

- **Rana Plaza (Banglades, 2013).** A Rana Plaza épület-összeomlás
  1.134 ruhaipari munkást ölt meg és kb. 2.500-at sebesített meg.
  Az épületben gyártott termékek több márkája auditálta a Tier-1
  beszállítókat az épületen belül röviddel az összeomlás előtt.
  Az auditok olyan szociális-audit ellenőrzőlistákat használtak,
  amelyek nem tartalmaztak szerkezeti-mérnöki hatókört. Az ezen
  auditok mindegyikénél egy lepecsételt módszertani tény (FACT
  04) nyilvánosan láthatóvá tette volna a *hatókör-rést*
  aláíráskor — lehorgonyozva a dokumentált korlátozást, amelyet
  az auditprogramok visszamenőleg nem állítottak, hogy lett volna.
  A pecsét nem előzte volna meg az összeomlást. Megakadályozta
  volna, hogy az összeomlás utáni iparági állítás, hogy „senki
  sem tudta", episztemikusan tartható legyen.

- **Apple / Foxconn auditok (2010-es évek).** A Foxconn
  létesítményeken végzett auditjelentések több iterációja,
  amelyek az Apple-nek gyártottak, eltérő szintű
  megállapítási súlyossággal, munkavállalói öngyilkossági klaszter
  kontextussal és kárelhárítási igényekkel kerültek közzétételre.
  Minden auditra vonatkozó lepecsételt aláírás-pillanati rekord
  megakadályozta volna a későbbi „mit mondott az audit akkor"
  vitákat attól, hogy archív másolatoktól, kiszivárgott
  másolatoktól vagy módosított hivatalos kiadásoktól függjenek.

- **Kobalt a DRC-ből (folyamatban).** A Demokratikus Kongói
  Köztársaságban folyó kézműves kobaltbányászat, beleértve a
  gyermekek által végzettet is, akkumulátor-ellátási láncokat
  táplál a fő elektronikai és EV márkák számára. A 2017-jelenlegi
  időszakban több márka által megrendelt audit különböző
  súlyosságú megállapításokat produkált. A készletet minden
  auditra alkalmazva aláíráskor lehorgonyozta volna a
  felvett-audit-állapotot; a kísérő-közzétételi tényekre (FACT 07
  C2: korábbi audit-történet) alkalmazva minden egyes auditor
  módszertani örökségét a korábbi résekből nyilvánosan láthatóvá
  tette volna.

- **Konfliktus-ásványok (ón, tantál, volfrám, arany a DRC-ből és
  Nagy Tavak régióból).** A Dodd-Frank §1502 audit-és-közzétételi
  kötelezettségeket termelt a SEC szabály 13p-1 alatt. A
  kohászati-szintű auditok megfelelőségéről és a downstream
  felügyeleti-lánc ellenőrzéséről szóló viták ismétlődtek a
  2014–2022 időszakban. Per-audit MYRIAM pecsétek minden
  kohászati auditot lehorgonyoztak volna aláíráskor.

- **Márka által megrendelt auditok a Hszincsiang gyapot ellátási
  láncairól (2018–jelenlegi).** Az auditok megbízhatóságáról
  szóló viták a PRC kormánynak az auditor-hozzáférésre vonatkozó
  korlátozásai alatt 2020 után széleskörűen felszínre kerültek.
  Minden auditra vonatkozó lepecsételt módszertani tény (FACT
  04) lehorgonyozta volna, hogy milyen hozzáférési feltételek
  ténylegesen alkalmazódtak — diffolhatóvá téve a későbbi
  „szigorú auditot végeztünk" állításokat a lepecsételt akkori
  módszertani korlátozásokkal szemben.

- **Foxconn alvállalkozási és Apple beszállítói felelősségi
  jelentések a 2010-es években — kiskorú munkavállalók, rejtett
  lakóhelyek, óra-szabálysértések ismétlődő felfedezései.**
  Per-audit pecsétek lehorgonyozták volna a *negatív
  megállapításokat* az auditokban, amelyek semmit sem találtak,
  a *pozitív megállapítások* mellett az auditokban, amelyek
  szabálysértéseket találtak — megakadályozva a visszamenőleges
  narratív cherry-picking-et bármely irányból.

A készlet a fenti egyetlen ügyét sem ELŐZTE volna meg. Számos
esetben az alapul szolgáló probléma az volt, hogy az audit
*elkerülte* a visszaélést — egy tiszta audit pecsételése, amelynek
szabálysértéseket kellett volna találnia, állandó nyilvántartást
hoz létre egy sikertelen auditról, ami egy más fajta hasznosság
(lehorgonyozza a kudarcot későbbi elszámoltathatósághoz), de nem
ugyanaz, mint a prevenció.

---

## Mikor használjuk ezt a készletet

- Egy audit-testület vagy, amely „közzétesszük, amit aláírtunk"
  gyakorlatot vesz át védelemként az aláírás utáni
  puhítási nyomás ellen.
- Egy NGO vagy, amely párhuzamos ellátási lánc vizsgálatot futtat
  és manipuláció-evidens referenciapontot szeretne abban a
  pillanatban, amikor a vizsgálata lezárul.
- Egy munkavállalói jogi szervezet vagy, amely auditjelentést
  szerzett és szeretné lehorgonyozni jelenlegi tartalmát, mielőtt
  az audit-testületnek vagy márkának esélye lenne módosítani.
- Egy átláthatóságra elkötelezett márka vagy a megrendelt
  auditokról, és szeretne egy ellenőrizhető forenzikus
  nyilvántartást.
- Egy újságíró, szabályozó vagy bíróság vagy, aki egy adott audit
  tartalmát szeretné lehorgonyozni egy adott pillanatban későbbi
  perbeli vagy jelentési célra.

## Mikor NE használjuk ezt a készletet

- **Ne használja a munkavállalók által vezetett monitorozás,
  független NGO-vizsgálatok vagy munkavállalói szervezet
  helyettesítésére.** A készlet *kiegészítő*, nem helyettesít
  semmit ezek közül.
- **Ne használja annak állítására, hogy egy beszállító
  megfelelő.** Egy tiszta lepecsételt audit legfeljebb egy
  bemenet egy megfelelőségi értékeléshez. Egy lepecsételt audit
  megfelelőségi tanúsítványként való kezelése pontosan az a
  legitimitási színház, amelynek megelőzésére a korlátozás-első
  elutasítási szabályok léteznek.
- **Ne használja audit közepén.** Az aláírás előtti pecsételés
  hamis-pozitív „ez a végső auditjelentés" nyilvántartást hoz létre.
- **Ne használja olyan tervezet pecsételésére, amelyet
  módosítani szándékozik.** Minden aláírási verzió saját pecsétet
  kap; a módosítások az eredetiekre Merkle gyökérrel hivatkoznak.
- **Ne használja nyomás alatt korábbi pecsételésre az aláírásnál,
  vagy egy kísérő-tény közzététel kihagyására.** Utasítsa el, és
  (ha a megbízója megengedi) pecsételje le az elutasítást.
- **Ne használja „fair trade" vagy „etikus beszerzés" marketing
  igény alapjaként anélkül, hogy a lepecsételt módszertani
  korlátozásokat közzétenné a pecsét mellett.** A pecsét idézése
  a korlátozások idézése nélkül az a legitimitási-színház
  hibamód, amely meghatározza az audit-megragadást.
- **Ne használja, ha az audit-testülete strukturálisan
  megragadt és nem tud megállapításokat közzétenni a megrendelő
  márka kereskedelmi érdekei ellen.** Ebben az esetben a
  pecsételés állandó nyilvános nyilvántartást hoz létre a
  megragadott auditról. Ez még értékes lehet — de nem ugyanaz,
  mint a megragadás elleni védelem.

---

## Hogyan forkoljuk ezt a készletet valós audithoz

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Kritikus időzítés:** pecsételjen az aláírási pillanatban — azaz
amikor a vezető auditor aláírja a végső jelentést és az az
audit-testület hivatalos álláspontjává válik. Egy aláírás előtti
pecsét hamis-pozitív „ez a végső audit" nyilvántartást hoz létre.
Egy aláírás utáni jóval későbbi pecsét forenzikusan gyengébb a
közbenső módosításokkal szemben.

---

## Integráció a meglévő ellátási lánc audit-infrastruktúrával

A készlet úgy van tervezve, hogy összekapcsolódjon, nem
helyettesítse a következőket:

- **SA8000 (Social Accountability International).** Az SA8000
  auditjelentések és CAP dokumentumok természetesen leképeződnek
  FACT 03 + FACT 05-re. A SAAS akkreditációs hivatkozás illik a
  FACT 06-ra.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Az RBA audit-megállapításai a FACT 03-ra
  leképeződnek; az RBA audit-cég függetlenségi szabályai a FACT
  06-ra leképeződnek.
- **SMETA (Sedex Members Ethical Trade Audit).** A SMETA 2-pillér
  és 4-pillér audit-megállapításai a FACT 03-ra leképeződnek; a
  Sedex platform hosztolja a nyers jelentést — a MYRIAM pecsét
  lehorgonyozza a platform-hosztolt jelentés tartalmi hash-ét.
- **amfori BSCI.** A BSCI A–E minősítési mechanika a FACT 03
  tanúsítási ajánlásra leképeződik; a márka-tagsági megrendelés a
  FACT 06 ügyfél-koncentrációs közzétételre és FACT 07 C1-re
  leképeződik.
- **FSC felügyeleti-lánc.** Erdészeti-termék ellátási láncok esetén
  a felügyeleti-lánc tanúsítványok és újraaudit ütemezések illenek
  az audit-ablak és CAP struktúrához.
- **B Lab / B Corp impact assessment.** A B Corp tanúsítás nem
  harmadik fél audit az SA8000 értelmében, de az impact assessment
  ellenőrzői jelentései e készlet alatt pecsételhetők (tényekkel
  átvágva impact-assessmentre, nem munkavédelmi auditra).
- **ISO 26000.** Az ISO 26000 útmutatás, nem tanúsítható; a
  készletnek nincs közvetlen ISO 26000 auditjelentés integrációja,
  de a szociális-felelősségi taxonómia tájékoztathatja a FACT 03
  elem-struktúrát házon belüli auditokhoz.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  egyéb iparági-ágazati rendszerek).** Ágazat-specifikus
  auditprogramok pecsételhetők e készlet alatt; a FACT 02
  audit-standard mező azonosítja, hogy melyik.
- **Fair Labor Association.** Az FLA gyári monitoring jelentések
  a FACT 03 + FACT 05-re leképeződnek; az FLA független-monitor
  keretrendszere a FACT 06 függetlenségi nyilatkozatokra
  leképeződik.
- **Higg Index (Sustainable Apparel Coalition).** A létesítmény-
  szintű Higg FEM (Facility Environmental Module) és Higg FSLM
  (Facility Social & Labor Module) kimenetei pecsételhetők
  e készlet alatt.
- **EU CSRD / CSDDD.** Az EU Corporate Sustainability Reporting
  Directive és Corporate Sustainability Due Diligence Directive
  közzétételi kötelezettségeket hoznak létre, amelyek
  ellenőrzési dokumentumai pecsételhetők e készlet alatt. A
  készlet a közzétételt-mint-kibocsátott horgonyozza le, nem a
  tartalmi megfelelőségét.

## Mit NEM helyettesít ez a készlet

- Munkavállalók által vezetett monitorozást (a legmegbízhatóbb
  visszaélés-felfedési jel bármely ellátási láncban)
- Független NGO-vizsgálatokat (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium, stb.)
- Szabályozói ellenőrzéseket (nemzeti munkaügyi hivatalok,
  OSHA-ekvivalensek, ILO Country Office programok)
- Munkavállalói szervezetet és kollektív szerződéskötést
- Pereskedést, választottbíráskodást és kárelhárítást a hazai
  munkavédelmi jog alatt
- Márka-oldali due-diligence keretrendszereket (UNGP, OECD Due
  Diligence Guidance, EU CSDDD)

## Licenc

Public domain (CC0). Forkold. Nincs szükség attribútumra.
