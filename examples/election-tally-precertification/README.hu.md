*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Választási szavazatszámlálás előzetes hitelesítési pecsétkészlet

Egy kulcsrakész myriam-kit példa megyei szavazatszámláló bizottságok,
állami választási hatóságok és választási integritás megfigyelők számára,
akik Bitcoin-lehorgonyzott, manipulációt felfedő pecsétet kívánnak közzétenni
a szavazatszámlálásról a hitelesítés pontos pillanatában.

**Lezárja** a [#4-es kérdést](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Amit ez a készlet NEM csinál (először ezt olvassa el)

A pecsét kriptográfiai időbélyeg arról, hogy mit hitelesítettek. Nem tudja
ellenőrizni, hogy a hitelesített tartalom helyes volt-e. A következő
meghibásodási módok **kívül esnek a pecsét hatókörén**:

1. **Szavazógépek kompromittálása.** Ha a firmware-t manipulálták vagy a
   szavazati összegeket rosszul számolták, a pecsét nagy integritással
   horgonyozza le a hibás számot. A pecsét a számlálási rendszer kimeneteit
   figyeli; magába a rendszerbe nincs betekintése.

2. **Szavazatelnyomás / strukturális választójog-megfosztás.** Szavazóhelyek
   bezárása, személyazonosítási törvények egyenlőtlenségei, postai szavazási
   visszautasítási arányok torzítása és regisztrációs listák tisztogatása
   mind a hitelesítés előtt történik. A pecsét a *megszámlált* szavazatokat
   rögzíti, nem a megszámlálandó szavazatokat.

3. **Választási dezinformáció.** A pecsét nem dönt jelöltek, média vagy
   platformok által tett választási állításokról. Egy lepecsételt
   hitelesítés ugyanolyan könnyen idézhető dezinformációs narratívában,
   mint annak védelmében. A kriptográfiai időbélyegek tartalom-semlegesek.

4. **Hitelesítés előtti csalás a szavazatgyűjtés vagy számlálás során.**
   Szavazatbegyűjtési szabálytalanságok, urnaurna-manipuláció, a felügyeleti
   lánc megszakadása a számlálási időszakban — mind a pecsétidő előtt
   történnek. A pecsét nem tudja őket utólag észlelni.

5. **A hitelesítő hatóság kényszerítése.** A kényszerített hitelesítés
   kriptográfiailag érvényes pecsétet hoz létre egy kényszerített
   eredményről. A pecsét azt igazolja, hogy egy hivatalos személy aláírta,
   nem azt, hogy miért.

6. **Hibás hitelesítések, amelyeket később sosem javítanak ki.** A pecsét
   értéke egy későbbi igazságfeltáró folyamattól (audit, újraszámlálás,
   peres eljárás) függ, amelyhez a pecsét összehasonlítható. Ha ilyen
   folyamat sosem zajlik le, a pecsét marad az egyetlen feljegyzés, és
   beágyazhatja a hibát.

7. **Statisztikai anomáliák és mintázatfelismerés.** A pecsét nem jelzi
   a valószínűtlen különbségeket, földrajzi anomáliákat vagy
   Benford-törvénytől való eltéréseket. Ezek elemzési feladatok a
   lepecsételt adatokon, nem a pecsét tulajdonságai.

8. **Lefelé haladó szavazólapi versenyek vékony audit-nyomokkal.** Kisebb
   versenyek gyengébb újraszámlálási küszöbökkel rendelkeznek; egyetlen
   pecsét nem tudja értelmesen lefedni egy szavazólap összes versenyét
   versenyenkénti hatókör nélkül.

**A fenti őszinte-határok szakasz a készlet teherbíró eleme.** Olyan
hivatalnokok, akik úgy hiszik, hogy a pecsételés legitimitást jelent,
pajzsként fogják használni. A készletnek nyíltan ki kell mondania: ez
egy *letagadhatatlansági primitív a hitelesítés pillanatára*, nem a
választás helyességének bizonyítéka.

---

## Amit a készletnek EL KELL UTASÍTANIA pecsételni

A készlet úgy van konfigurálva, hogy elutasítsa a következő tényállásokat,
még ha érvényes aláírási jogosultsággal rendelkező felhasználó nyújtja
is be őket:

- **Egyéni szavazó-azonosítás.** Egyetlen tény sem nevezhet meg szavazót,
  nem köthet szavazólapot szavazóhoz, és nem fedhet fel olyan mezőt,
  amely egy személyt újra azonosíthatóvá tehetne.
- **Szavazólaponkénti aláírás-egyezési döntések.** Személyes adatokkal
  terheltek; pecsételésük tartós feljegyzéseket hoz létre olyan
  döntésekről, amelyek később vitathatók lehetnek.
- **Bármely tény, amelynek közzététele egy sebezhető szavazót
  azonosítana.** Beleértve a választókerületi szintű eredményeket olyan
  választókerületekben, amelyek olyan kicsik, hogy a szavazati választás
  kikövetkeztethető (jellemzően <50 szavazat).
- **Szavazatszámlálások pecsételése az összes szavazat megszámlálása
  előtt.** A készlet elutasítja a részleges számlálásokat "a
  szavazatszámlálás"-ként bemutatva. Az előzetes hitelesítés azt
  jelenti, *minden szavazat megszámlálva, a hivatalos hitelesítés előtt*
  — nem *a számlálás közben*.
- **Ideiglenes vagy feltételes hitelesítések.** A pecsétnek tényt kell
  tükröznie, nem feltételt.
- **Számlálások, amelyek függőben lévő peres kohorszokat zárnak ki**
  explicit lepecsételt kísérőtény nélkül, amely a kizárást nyilvánosságra
  hozza.
- **Pecsételés bárki más által, mint az adott joghatóság hitelesítő
  hatósága.**

Maga az elutasítás is lepecsételhető tényként ("Ez a hatóság X
pecsételését kérte; a készlet az Y elutasítási szabály alapján
elutasította"), nyilvános feljegyzést hozva létre a megkísérelt
visszaélésről.

---

## Amit ez a készlet pecsétel

8 tényt a hitelesítés pillanatában:

1. **Példa-értesítés** — kijelenti, hogy a közzététel példa (valós
   attesztációk eltávolítják vagy lecserélik ezt).
2. **Joghatóság azonosítása** — megye, választás dátuma, hitelesítő
   hatóság, hitelesítő tisztviselők név + szerepkör szerint.
3. **Hitelesített szavazatszámlálás** — versenyenkénti jelöltenkénti
   szavazatösszegek + felül-/alul-szavazatok + bekarikázott jelöltek.
4. **Szavazólap elszámolás és egyeztetés** — összes leadott, összes
   számlált, kategóriánként visszautasított összes, módonkénti bontás,
   regisztrált választói nevező.
5. **Berendezés és audit-nyomvonal manifeszt** — szavazatszámláló modell
   + firmware hash, CVR fájl hash, szavazólap-kép archívum hash,
   felügyeleti napló hash, aláírás-egyezési házirend hash.
6. **Küszöbök és kiváltók a hitelesítéskor** — hatályban lévő
   aláírás-egyezési küszöb, újraszámlálási kiváltó küszöbök, tényleges
   különbségek versenyenként, RLA-mag-kötelezettségvállalás.
7. **Kísérő nyilvánosságra hozatalok és elutasítási feljegyzés** —
   függőben lévő perek, vizsgálat alatt álló számlálás utáni anomáliák,
   kizárt kohorszok, eltérő véleményű bizottsági tagok; a készlet által
   pecsételni elutasított mintázatok explicit listája.
8. **Aláíró megbízó** — Szavazatszámláló Bizottság azonosítása + minden
   aláíró neve és pártja + kriptográfiai kulcs információ.

Mindegyik tény az elutasító-kapu konvenciójával zárul: *"Ez a tény csak
X-et állítja. Nem állítja Y-t"* (ahol Y a fenti "NEM csinál" szakasz
legközelebbi meghibásodási módja).

---

## Amit ez a készlet véd

- **Szavazatösszegek csendes hitelesítés utáni felülvizsgálata** — a
  FACT 03 bármely egész számbeli változása más SHA-256-ot, más
  Merkle-gyökeret eredményez, az OTS-ellenőrzés meghiúsul.
- **"Megtalált szavazólapok" csendes elnyelése** — a FACT 04 egyeztetési
  számtana rögzítve van a hitelesítéskor.
- **Firmware-helyettesítési állítások** — a FACT 05 befagyasztja a
  berendezési manifesztet a hitelesítéskor.
- **Audit-műtárgy-helyettesítés a hitelesítés után** — a FACT 05 hash
  manifesztje elkap minden hitelesítés utáni változást a CVR-en,
  szavazólap-képeken, felügyeleti naplókon vagy aláírás-egyezési
  házirenden.
- **Küszöb- és kiváltó-újradefiniálás** — a FACT 06 befagyasztja a
  hitelesítéskor hatályos szabályokat (aláírás-egyezési küszöb,
  újraszámlálási kiváltók, RLA-kockázati határ).

## Történelmi vagy közelmúltbéli esetek, amelyekben a készlet segíthetett volna

A készlet hasznos horgonyt — *nem javítást* — biztosított volna a
következő esetekben:

- **Antrim megye, Michigan (2020).** A kezdeti nem hivatalos eredmények
  jelölt-cserét mutattak, amelyet később az ellenkező eredményre
  javítottak. Egy javítás előtti pecsét nyilvános referenciát biztosított
  volna arról, hogy mit mondott az eredeti bejelentés és mit mondott a
  javítás, mindkettő kriptográfiailag tanúsítva.
- **Maricopa megye, Arizona (2020–2022).** Az újraszámlált/újra
  megvizsgált összegek több iterációja került forgalomba. Egy
  hitelesítés-pillanati pecsét egyértelmű referenciapontot biztosított
  volna, amelyhez minden későbbi számlálás összehasonlítható lett volna.
- **Florida 2000 (Bush kontra Gore szavazatszámlálás).** A megyénkénti
  hitelesített összegek az újraszámlálási nyomás alatt megváltoztak;
  egy megyénkénti újraszámlálás előtti pecsét megőrizte volna azt, amit
  minden megye hitelesített, mielőtt a kézi újraszámlálási eljárások
  elkezdődtek.
- **Különböző külföldi választások dokumentált hitelesítés utáni
  "javításokkal".** Joghatóság-agnosztikus.

A készlet NEM oldotta volna meg a gépintegritás körüli alapvető 2020-as
vitákat, a postai szavazási házirendi vitákat, vagy bármely választást,
ahol az alapvető kérdés vitatott tény, nem vitatott feljegyzés volt.

## Mikor használja ezt a készletet

- Az ön joghatósága stabil, auditált hitelesítési folyamattal rendelkezik
  és hozzá kíván adni egy megváltoztathatatlan nyilvános horgonyt.
- Ön hitelesítés utáni vizsgálatra számít, és manipulációt felfedő
  referenciapontot szeretne.
- Önnek jogi felhatalmazása van a felsorolt tényhalmaz közzétételére
  személyes adatok feltárása nélkül.
- Önnek van párhuzamos audit vagy RLA-folyamata, így a pecsét
  összehasonlítható az igazságfeltáró kimenettel.

## Mikor NE használja ezt a készletet

- **Ne használja kockázatkorlátozó auditok, kézi újraszámlálások vagy
  választás utáni auditok helyett.** Ez a készlet *kiegészítő*, nem
  helyettesítő.
- **Ne használja, ha a hitelesítő tisztviselő nem a tényleges
  döntéshozó** (hamis tulajdonítást hoz létre).
- **Ne használja a számlálás közben.** A készlet kifejezetten a
  hitelesítés pillanatára való. A részleges számlálás pecsétjei
  félrevezető referenciapontokat hoznak létre.
- **Ne használja annak állítására, hogy a választás tisztességes, pontos
  vagy legitim volt** — ezt nem tudja megtenni.
- **Ne használja nyomás alatt, hogy a hitelesítés pillanata előtt
  pecsételjen, vagy hogy kihagyjon egy kísérőtény-közzétételt.**
  Utasítsa el, és pecsételje az elutasítást.
- **Ne használja legitimitás-színházként.** Egy csalárd számlálás pecsétje
  a csalás tartós nyilvános feljegyzése, nem annak védelme. A primitív
  mindkét irányba vág; ez az ő őszintesége.

## Hogyan haarazza ezt a készletet valós hitelesítésre

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # cserélje le a fiktív tartalmat valóssal
bash build/seal.sh     # pecsételjen A hivatalos hitelesítési aláírásKOR vagy után
python3 build/verify.py
```

**Kritikus időzítés:** pecsételjen A hitelesítés pillanatában, NEM előtte.
Egy hivatalos hitelesítés előtti pecsét hamis pozitív "ez a hivatalos
eredmény" feljegyzést hoz létre. Egy utáni pecsét konvencionális
letagadhatatlanság.

## Integráció a meglévő választási infrastruktúrával

- **Állami Választási Bizottságok / EAC tanúsítás.** A készlet a
  hivatalos hitelesítési dokumentum mellett kerül közzétételre. Nem
  helyettesíti a törvényes hitelesítést.
- **Kockázatkorlátozó auditok.** A CVR-hash a FACT 05-ben ugyanaz a
  hash, amelyet az RLA-eszköz felhasznál. A pecsét összeköti az
  auditált CVR-t a hitelesített összeggel.
- **Újraszámlálási eljárások.** Az állami törvény szerint kiváltott
  újraszámlálás ÚJ pecsételt tényhalmazt eredményez (más időbélyeg,
  más hash-ek, ugyanaz a joghatóság). Mindkét pecsét együtt él; egyik
  sem írja felül a másikat. A pecsétek közti különbség az újraszámlálás
  változtatásának nyilvános feljegyzése.
- **Választási leírónyelv (EML) és Közös Adatformátum (CDF).** A
  ténytörzseknek levezethetőeknek kell lenniük a joghatóság meglévő
  EML/CDF-kimeneteiből, hogy a készlet adatformátum-agnosztikus maradjon.
- **Kétpárti szavazatszámláló-bizottsági aláírás.** Több aláírású
  változat ajánlott olyan joghatóságok számára, amelyek
  pártegyensúlyos szavazatszámláló bizottságokkal rendelkeznek.

## Amit ez a készlet NEM helyettesít

- Az állami választási törvény szerinti törvényes hitelesítést
- Az EAC szavazórendszer-tanúsítást
- Kockázatkorlátozó auditokat / kézi újraszámlálásokat
- Újraszámlálási eljárásokat és választás utáni auditokat
- Bírósági végzéseket vagy választási vita peres eljárását

## Miért létezik ez a készlet a v0.3.0+ verzióban

Ez a 6. kidolgozott példa, amely a myriam-kit-tel szállít. A készletet
Karpathy-stílusú autoresearch folyamattal állítottuk elő, amely a
`~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md` fájlban van dokumentálva.
Három prompt-változat (utánzás / első-elvű / korlátozás-elsőként)
párhuzamos készletvázakat hozott létre; a korlátozás-elsőként változat
érte el a legmagasabb pontszámot egy súlyozott rubrikán, és a végleges
készlet szintetizálja annak szerkezetét az utánzás-változat
kohéziójával és az első-elvű változat operatív részleteivel.

Magát az autoresearch-et prompt-mintaként dokumentáltuk a
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` fájlban későbbi felhasználásra.

## Licenc

Közkincs (CC0). Forkolja. Forrásfeltüntetés nem szükséges.
