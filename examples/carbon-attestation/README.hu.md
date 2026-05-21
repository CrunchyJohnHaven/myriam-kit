*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Szén-attesztációs pecsételőkészlet

Egy kulcsrakész myriam-kit példa szénkredit-projektek fejlesztői,
harmadik felek általi ellenőrök és nyilvántartók számára, akik egy
Bitcoinhoz lehorgonyzott, manipulációt felfedő pecsétet kívánnak
közzétenni egy szénkredit-kibocsátási, eltávolítási ellenőrzési vagy
kibocsátási attesztációs eseményről a tanúsítás pontos pillanatában —
úgy, hogy a kibocsátás utáni csendes módosítások nyilvánosan
észlelhetővé váljanak.

---

## Amit ez a készlet NEM tesz (először olvassa el)

A szénkreditek politikailag és tudományosan vitatottak. A pecsét annak
kriptográfiai időbélyege, amit attesztáltak. Nem tudja ellenőrizni,
hogy amit attesztáltak, valós klímahasznot tükröz-e. Az alábbi
hibamódok **a pecsét területén kívül esnek**, és ezek képezik a
szénkreditekkel kapcsolatos érdemi integritási kérdések többségét:

1. **Addicionalitás.** A pecsét nem tudja ellenőrizni, hogy a
   kreditezett tevékenység szénfinanszírozás nélkül is bekövetkezett
   volna-e. A kontrafaktuális elvileg nem megfigyelhető. A pecsét a
   módszertan addicionalitási érvét rögzíti; nem dönt felőle.

2. **Permanencia.** A pecsét nem tudja ellenőrizni, hogy a
   megkötött szén megkötve marad-e a vonatkozó időhorizonton
   (évtizedek és évszázadok az erdei szén esetében, geológiai
   időskálák egyes eltávolításoknál). Friss szakirodalom (Badgley et
   al. 2022, Patterson et al. 2022) azt mutatja, hogy a
   puffermedencéket valós visszafordulási események jelentősen
   kimerítették. Egy lepecsételt kredit a permanencia *állítása*,
   amelyet meghatározott puffermedence-feltételezések mellett
   pecsételtek le, nem pedig a permanencia bizonyítéka.

3. **Szivárgás.** A pecsét nem tudja ellenőrizni, hogy a projekt
   területén elkerült kibocsátások nem egyszerűen egy nem-projekt
   területre tolódtak-e át. A módszertan szerinti alapértelmezett
   szivárgási levonások szabályozói helyettesítők, nem mérések. A
   pecsét az alkalmazott levonást horgonyozza le; nem tanúsítja
   helyesként.

4. **Társadalmi előnyök (co-benefits).** A pecsét nem tudja
   ellenőrizni a közösségfejlesztési vagy biodiverzitási
   állításokat. A társadalmi előnyök jellemzően önbevallottak és
   az ellenőr által átnézettek, nem a szén-kvantifikáció
   mélységében auditáltak. A pecsét a dokumentum-hash-eket
   horgonyozza le; semmi többet.

5. **A szabad, előzetes és tájékozott beleegyezés (FPIC)
   elégségessége.** Az őslakos és közösségi beleegyezésnek a
   szénprojektekben dokumentált hibamód-előzményei vannak (kikényszerített
   beleegyezés, beleegyezés nem reprezentatív testületektől,
   utólagos „beleegyezés" kompenzáció útján). A pecsét lehorgonyozza
   az FPIC-dokumentációt és a panaszkönyv-hash-eket; nem tudja
   tanúsítani, hogy a beleegyezési folyamat valódi volt.

6. **Az ellenőr függetlensége.** Az ellenőröket a projektfejlesztők
   fizetik. Ez strukturális összeférhetetlenség, amelyet egyetlen
   akkreditációs rendszer sem oldott meg. A pecsét lehorgonyozza
   az ellenőr függetlenségi nyilatkozatát; nem tanúsítja, hogy a
   nyilatkozat igaz.

7. **Kettős könyvelés nyilvántartók között vagy nemzeti
   leltárakkal.** A pecsét a nyilvántartói állapot pillanatfelvételét
   horgonyozza le az attesztáció idején. Ha ugyanazt a tevékenységet
   egy fogadó ország is NDC-jébe számítja, vagy másik nyilvántartón
   is felszámítja, a pecsét a nyilvántartói állapotot
   összehasonlíthatóvá teszi, de nem akadályozza meg a kettős
   számítást.

8. **A vásárlói állítás helyessége.** Egy vásárló, aki egy
   lepecsételt kreditet visszavon „nettó zéró" vagy „szén-semleges"
   állítás alátámasztására, olyan láncon lejjebbi állítást tesz,
   amelyet a pecsét nem fed le. A pecsét a visszavonást rögzíti; a
   vásárló marketingállításának érvényessége külön, láncon lejjebbi
   kérdés.

9. **A módszertan helyessége.** A pecsét rögzíti az attesztáció
   idején érvényes módszertani hivatkozást + dokumentum-hash-t. Nem
   állítja, hogy a módszertan tudományosan érvényes. A módszertani
   reform megtörténik; egy később felülvizsgált módszertan alatt
   történt pecsételés nem teszi visszamenőlegesen „hibássá" vagy
   „helyessé" a krediteket — azt horgonyozza le, mely szabályok
   voltak érvényben kibocsátáskor.

**A fenti őszinte-korlátok szakasz a készlet tartóeleme.** Egy
szénkredittel kapcsolatos szinte minden érdemi integritási kérdés a
fenti kilenc kategória egyikébe tartozik. A pecsét azt a szűk
maradék rést zárja le: a bájtok-nyilvántartáson való csendes
visszamenőleges módosítása. Ez a rés valós és érdemes lezárni, de
kicsi a vitatott terephez képest.

---

## Amit ennek a készletnek MEG KELL TAGADNIA lepecsételni

A készlet úgy van konfigurálva, hogy az alábbi tényelőfordulásokat
elutasítsa, még akkor is, ha érvényes aláírási jogosultsággal
rendelkező felhasználó nyújtja be őket:

- **„Addicionalitás" tényként megfogalmazva.** Az addicionalitás
  tényként való lepecsételése félrevezető nyilvántartást hoz létre.
  A készlet a módszertannak megfelelő addicionalitási *érveket*
  fogad el, nem addicionalitási *állításokat*.
- **„Permanencia" kifejezett időhorizont- és puffermedence-közlés
  nélkül.** A permanencia ezen paraméterek nélküli lepecsételése
  elhomályosítja, hogy a projekt valójában mire vállal
  kötelezettséget.
- **„Nincs szivárgás" projektspecifikus mérés nélkül.** A
  módszertan szerinti alapértelmezett szivárgási levonások nem
  mérések, és a pecsét nem fogja annak tekinteni őket.
- **A harmadik fél általi ellenőrzés befejezése előtt generált
  kvantifikációk.** Egy előzetes ellenőrzés előtti pecsét hamis
  pozitív „ellenőrzött" nyilvántartást hoz létre.
- **Olyan kreditekre vonatkozó kibocsátási nyilvántartások,
  amelyeket más nyilvántartáson is kibocsátottak**, kifejezett
  nyilvántartások közötti közlés nélkül a FACT 06-ban.
- **Olyan visszavonási nyilvántartások, amelyek nem nevezik meg a
  visszavonás kedvezményezettjét.** Az anonim visszavonás aláássa a
  visszavonás közjó funkcióját; a készlet megtagadja, hogy ezt
  lehetővé tegye.
- **Attesztálható dokumentáció-hash-ekkel nem alátámasztott
  FPIC-állítások.**
- **6.2 / 6.4 cikk szerinti kibocsátás fogadó ország
  felhatalmazási levelének (LoA) hash-e nélkül**, lepecsételve a
  FACT 06-ban.
- **Pecsételés bármely más fél kérésére, mint a projektfejlesztő +
  ellenőr közösen** az adott projektre.
- **„Tanúsítottként" lepecsételt társadalmi előnyök-állítások**,
  amikor azok csak „önbevallottak és ellenőr által átnézettek".

Maga a visszautasítás tényként lepecsételhető („Ez a fél X
lepecsételését kérte; a készlet az Y visszautasítási szabály
szerint elutasította"), ami nyilvános nyilvántartást hoz létre a
megkísérelt visszaélésről.

---

## Amit ez a készlet LEPECSÉTEL

8 tény az attesztáció pillanatában:

1. **Példajelzés** — bejelenti, hogy a közzététel példa (a valós
   attesztációk ezt eltávolítják vagy lecserélik).
2. **Projektazonosítás** — projektnév, nyilvántartó, nyilvántartói
   projektazonosító, módszertani hivatkozás + hash, földrajzi
   határ hash, vintage, projektfejlesztő, társadalmi előnyök
   állítása, FPIC állapot.
3. **Kibocsátás vagy eltávolítás kvantifikációja** — bruttó tonna
   CO2e, alapforgatókönyvi kontrafaktuális, szivárgási levonás,
   puffermedence-hozzájárulás, bizonytalansági levonás, nettó
   kreditezhető állítás, minden numerikus bemenet hash-e.
4. **Mérési módszertan** — távérzékelési adatforrások,
   helyszíni-igazolási parcellahálózat, műszerkalibrációs napló
   hash, osztályozómodell-hash + pontossági statisztikák,
   szénsűrűségi modell, kód-eredet + reprodukálhatósági manifeszt.
5. **Harmadik fél általi ellenőrzés** — ellenőrző szervezet,
   akkreditáció, függetlenségi nyilatkozat hash, korábbi
   megbízatások a fejlesztővel, helyszíni-bejárási fotóarchívum
   hash, felvetett + megoldott megállapítások, ellenőrzési
   véleménydokumentum hash.
6. **Kibocsátási vagy visszavonási nyilvántartás** — kibocsátási
   kérelem + jóváhagyás, kibocsátott összes kredit, sorszámtartomány,
   nyilvántartók közötti nyilatkozat, fogadó ország LoA hash-e,
   ahol alkalmazható, visszavonási sorszámtartományok +
   kedvezményezettek (visszavonási attesztációk esetén),
   nyilvántartói-állapot pillanatfelvétel hash-ek.
7. **Kísérő közzétételek és visszautasítási nyilvántartás** —
   függőben lévő módszertani viták, nem-permanencia kockázat,
   szivárgási kikötések, addicionalitási kikötések, FPIC +
   panaszkönyv-hash-ek, társadalmi előnyök kikötés, korábbi
   ellenőri megbízatás; a készlet által lepecsételni
   visszautasított minták kifejezett listája.
8. **Aláíró megbízó** — projektfejlesztő + ellenőr + nyilvántartó,
   mindegyik a szerep + attesztálás hatóköre + kriptográfiai
   kulcsadatok feltüntetésével.

Minden tény a visszautasítási kapu konvencióval végződik:
*„Ez a tény csak X-et állítja. Nem állítja Y-t"* (ahol Y a
legközelebbi hibamód a fenti „NEM tesz" szakaszból).

---

## Mi ellen véd ez a készlet

- **A kvantifikáció kibocsátás utáni csendes módosítása.** A
  FACT 03 bármely egész szám változása más SHA-256-ot, más
  Merkle-gyökeret eredményez, megbukik az OTS-ellenőrzésen.
- **Csendes módszertan-helyettesítés.** A FACT 02 a kibocsátáskor
  befagyasztja a módszertani hivatkozást + dokumentum-hash-t. Egy
  nyilvántartói bevezetés egy eltérő módszertan-verzióra a
  kibocsátás után nyilvánosan összehasonlítható.
- **Csendes alapforgatókönyv-felülvizsgálat.** A FACT 03
  alapforgatókönyvi modell kimeneti hash-e le van pecsételve. Egy
  utólagos alapforgatókönyv-újrahangolás több kredit termelésére
  észlelhető.
- **Csendes ellenőri vélemény-helyettesítés.** A FACT 05 vélemény
  dokumentum-hash-e le van pecsételve. Egy kibocsátás utáni „az
  ellenőr mindig azt mondta, hogy X" típusú átírás észlelhető.
- **Csendes visszavonási nyilvántartás eltűnése.** A FACT 06
  nyilvántartói-állapot pillanatfelvétele le van pecsételve. A
  kreditek, amelyek titokzatosan ismét „elérhetővé" válnak,
  miután visszavontnak lettek jelölve, észlelhetők a pecséttel
  szemben.
- **Csendes FPIC-dokumentum-helyettesítés.** A FACT 07 FPIC +
  panaszkönyv-hash-ei le vannak pecsételve. A helyettesítő
  beleegyezési dokumentumok észlelhetők.
- **A kényelmetlen közzétételek csendes eltávolítása.** A FACT 07
  kísérő közzétételi állapota le van pecsételve. Egy
  nem-permanencia kikötés csendes törlése egy projektleíró
  oldalról észlelhető a lepecsételt bájtokkal szemben.

A készlet NEM véd az alapul szolgáló integritási kérdések ellen
(addicionalitás, permanencia, szivárgás, FPIC-elégségesség, ellenőr
függetlensége, módszertani érvényesség). Ezek a nehezebb problémák,
és a pecsét nem tudja megoldani őket.

---

## Történelmi vagy közel-történelmi esetek, amelyekben a készlet
   segített volna

A készlet hasznos lehorgonyzást — *nem megoldást* — biztosított
volna szén-attesztációs nyilvántartások csendes visszamenőleges
módosítását érintő esetekben. Ezen esetek egyikében sem oldotta
volna meg az alapul szolgáló vitatott kérdéseket.

- **A 2023-as Guardian / Die Zeit / SourceMaterial Verra
  esőerdő-kreditek vizsgálata.** A vizsgálók azt találták, hogy a
  vizsgált REDD+ projektek többsége olyan krediteket termelt,
  amelyek állítólagos elkerült kibocsátásai nem egyeztek a későbbi
  távérzékelési újraelemzéssel. A vizsgálat a projekt-dokumentáció
  rekonstrukcióját igényelte a visszamenőlegesen módosított
  nyilvántartói rekordokkal szemben. Egy lepecsételt közzététel
  minden kibocsátási ciklusnál egyértelmű referencia-bájtokat
  biztosított volna arra, mit attesztáltak minden ciklusban — nem
  egy megoldás az alapul szolgáló alapforgatókönyvi problémára,
  hanem egy tiszta forenzikus időbeli vonal.

- **A 2020-as kaliforniai erdő-offset visszafordulási események.**
  Több kaliforniai megfelelőségi piaci erdőszén-projekt erdőtűz-
  visszafordulásokat tapasztalt, amelyek meghaladták a számukra
  félretett puffermedence-tartalékot. Annak rekonstruálása, hogy
  minden projekt mit attesztált a nem-permanencia kockázatról *a
  kibocsátáskor* (szemben azzal, amit a projekt később állított,
  hogy attesztált), jelenleg nehéz. Per-vintage pecsétek
  kanonikusan visszakereshetővé tették volna a tűz előtti
  attesztációkat.

- **Különböző REDD+ projektek, amelyekben a referencia-régió
  alapforgatókönyvi módszertanokat visszamenőlegesen
  felfújtként kritizálták.** Egy lepecsételt módszertani
  dokumentum-hash a kibocsátás idején lehorgonyozta volna, hogy
  melyik módszertan-verzió alkalmazódott valójában melyik
  vintage-re, így a „módszertan mindig X volt" típusú védekezés
  összehasonlíthatóvá vált volna.

- **Számos Australian Carbon Credit Unit (ACCU) emberi
  beavatkozású regenerációs projekt vitája (2022–2023).**
  Akadémiai kritika arról, hogy a regeneráció valóban
  projekt-indukált volt-e vagy természetes, visszavezetett
  vitákhoz arról, mit állított eredetileg a projekt. Lepecsételt
  attesztációk egyértelmű per-vintage rekordokat biztosítottak
  volna.

- **Szén-offset visszavonási nyilvántartások, amelyek állapota
  megváltozott.** Számos dokumentált eset volt az önkéntes piaci
  nyilvántartók visszavonási rekordjairól, amelyek látszólag
  megváltoztatták állapotukat a visszavonás után (más okból
  „visszavontakká" váltak, vagy utólag más kedvezményezetthez
  rendelték őket). Per-visszavonási pecsétek lehorgonyozták volna
  az állapotot az eredeti visszavonás pillanatában.

Egyik ilyen esetben sem oldotta volna meg a készlet, hogy az
alapul szolgáló kredit valós klímahasznot képviselt-e. A készlet
nyilvántartásokat horgonyoz le; ennyi az, amit tesz.

---

## Mikor használjuk ezt a készletet

- Ön projektfejlesztő, aki manipulációt felfedő attesztációt kíván
  közzétenni a szabványos nyilvántartói beadvány mellett.
- Ön harmadik fél általi ellenőr, aki azt szeretné, hogy ellenőrzési
  véleménye nyilvánosan ellenőrizhető legyen egy nyilvántartó
  későbbi „mit mondott az ellenőr" reprezentációjával szemben.
- Ön nyilvántartó, aki további integritási réteget kíván biztosítani
  a kibocsátási és visszavonási nyilvántartásokon — különösen
  olyan joghatóságokban működő projekteknél, ahol a nyilvántartói
  integritás jogállam-támaszai gyengébbek.
- Ön újságíró, akadémikus vagy NGO, aki több éves longitudinális
  elemzést végez szénprojekteken, és nyilvános horgonyzásra van
  szüksége egy projekt későbbi reprezentációinak összehasonlításához
  a kibocsátáskori bájtokkal.
- Ön vásárló (vállalati nettó-zéró, légitársasági megfelelőség), aki
  azt szeretné, hogy az általa visszavont kreditek nyilvánosan
  lehorgonyzott nyilvántartásokkal szemben kerüljenek visszavonásra,
  hogy a láncon lejjebbi marketingállítása stabil forenzikus
  időbeli vonallal szemben auditálható legyen.

## Mikor NE használjuk ezt a készletet

- **Ne használja akkreditált harmadik fél általi ellenőrzés
  helyett.** A pecsét nem helyettesíti az ISO 14064-3 ellenőrzést;
  azzal együtt működik.
- **Ne használja annak állítására, hogy a projekt „addicionális",
  „permanens" vagy „alacsony szivárgású".** A pecsét nem tudja
  ellenőrizni ezeket a tulajdonságokat. Ezek állítására való
  használata visszaélés.
- **Ne használja gyenge minőségű kreditek legitimitási
  színházaként.** Egy gyenge minőségű kreditre rátett kriptográfiai
  pecsét a gyenge minőség állandó forenzikus nyilvántartása, nem
  védekezés ellene. A primitív mindkét irányba vág; ez az ő
  őszintesége.
- **Ne használja olyan kreditek lepecsételésére, amelyeket egy
  fogadó ország is NDC-jébe számít** kifejezett megfelelő-kiigazítási
  közlés nélkül a FACT 06-ban.
- **Ne pecsételjen ellenőrzés előtt.** Egy pecsét, mielőtt az
  ellenőr véleménye végleges lenne, hamis pozitív „ellenőrzött"
  nyilvántartást hoz létre.
- **Ne használja nyomás alatt egy FACT 07 kísérő-tény közlés
  elhagyására** (függőben lévő módszertani viták, FPIC-problémák,
  korábbi ellenőri megbízatás). Tagadja meg, és pecsételje le a
  visszautasítást.
- **Ne használja marketing-jelvényként.** A „MYRIAM-pecsételt" nem
  minőségi állítás; ez egy forenzikus tulajdonság. Minőségi
  jelvényként való kezelése pontosan az a visszaélés, amelyet a
  korlát-elsős tervezés megakadályozni próbál.

## Hogyan forkoljuk ezt a készletet valós attesztációhoz

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # cserélje le a fiktív tartalmat valósra
bash build/seal.sh         # PECSÉTELJEN a nyilvántartói kibocsátáskor VAGY UTÁNA, nem előtte
python3 build/verify.py    # erősítse meg
```

**Kritikus időzítés:** pecsételjen a nyilvántartó hivatalos
kibocsátási eseményekor VAGY UTÁNA, NEM előtte. Egy kibocsátás
előtti pecsét hamis pozitív „kibocsátott" nyilvántartást hoz létre.
Visszavonási attesztációknál pecsételjen a visszavonás pillanatában.
Folyamatos monitoring attesztációknál a kibocsátás és visszavonás
között, pecsételjen minden ellenőr-aláírt monitoring ciklusnál — de
tegye világossá a FACT 01-ben, hogy az attesztáció monitoring
frissítés, nem kibocsátás.

## Integráció a meglévő szén-infrastruktúrával

- **Verra (VCS).** A lepecsételt közzététel URL-je vagy IPFS CID-je
  csatolható a VCS-projektoldalhoz kiegészítő dokumentációként.
  A pecsét nem helyettesíti a VCS-ellenőrzést; azzal együtt működik.
- **Gold Standard.** Ugyanaz az integrációs modell — kiegészítő
  attesztáció a Gold Standard kibocsátási dokumentáció mellett. A
  Gold Standard hangsúlya a társadalmi előnyökön + közösségi
  haszondokumentáción természetesen leképeződik a FACT 02 +
  FACT 07-re.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Ugyanaz az integrációs modell.
- **6.4 cikk (Párizsi Megállapodás Felügyelő Testület mechanizmusa).**
  A fogadó ország LoA hash-e a FACT 06-ban kifejezetten a 6.4 / 6.2
  cikk ITMO-nyomonkövethetőséghez van tervezve. A megfelelő-kiigazítási
  közlés visszautasítási kapus mező.
- **EU ETS MRV.** A megfelelőségi piaci kibocsátók számára az MRV
  jelentés hash-e leképeződik a FACT 03 kvantifikációs táblázat
  hash-ére. A pecsét együtt működik — nem helyettesíti — a
  létesítményüzemeltető ellenőrzött kibocsátási jelentését.
- **CDP (Carbon Disclosure Project) vállalati közzététel.** A
  CDP-beadványokban visszavont kreditekre hivatkozó vállalatok
  számára a FACT 06 alatt lepecsételt visszavonási nyilvántartás a
  kanonikus visszakereshető rekord. A CDP-beadvány nyelvezete
  hivatkozhat a lepecsételt közzététel Merkle-gyökerére vagy
  IPFS CID-jére.
- **ISO 14064-2 (projekt) / ISO 14064-3 (ellenőrzés) / ISO 14065
  (akkreditáció).** A pecsét rögzíti a megfelelőségi állítást +
  hash-eket; nem végzi el a megfelelőségi értékelést.
- **TSVCM Core Carbon Principles (CCP) / ICVCM címkék.** Ahol egy
  projektet az ICVCM CCP-vel szemben értékeltek, az értékelési
  eredmény hash-e lepecsételhető a FACT 07-ben kísérő közzétételként.

## Amit ez a készlet NEM helyettesít

- Akkreditált harmadik fél általi ellenőrzés (ISO 14064-3)
- Nyilvántartói kibocsátási és visszavonási munkafolyamatok
- Módszertani megfelelőségi értékelés
- Fogadó ország felhatalmazási folyamatai 6. cikk szerinti
  tranzakciókhoz
- Megfelelőségi piaci MRV folyamatok (EU ETS, California
  Cap-and-Trade, RGGI stb.)
- Önkéntes piaci integritási kezdeményezések (ICVCM, VCMI)
- Független klímahatás-értékelés

## Miért létezik ez a készlet a v0.4.0+ -ban

Ez a myriam-kit-tel szállított 7. kidolgozott példa. A készlet azért
létezik, mert a szénkredit-piacoknak jól dokumentált előzményei
vannak a csendes visszamenőleges módosításnak — módszertanok,
amelyeket visszamenőlegesen újraértelmeznek, alapforgatókönyvek,
amelyeket visszamenőlegesen felülvizsgálnak, visszavonási
nyilvántartások, amelyek állapotot változtatnak, és projekt-közzétételek,
amelyek csendben elejtik a kényelmetlen kikötéseket az idő
folyamán.

A pecsét a bájtok-az-attesztáció-idején *szűk* rését zárja le. Nem
foglalkozik — és nem is foglalkozhat — az addicionalitás,
permanencia, szivárgás vagy társadalmi előnyök hitelességének
nagyobb vitatott kérdéseivel. A készlet őszinte keretezése erről a
korlátról a legfontosabb tulajdonsága.

## Licenc

Közkincs (CC0). Forkolja. Nincs szükség forrásmegjelölésre.
