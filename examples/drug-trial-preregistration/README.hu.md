*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Gyógyszervizsgálat előregisztrációs csomag

Egy kulcsrakész myriam-kit példa klinikai vizsgálatok szponzorai és
akadémiai kutatók számára, akik egy vizsgálatot manipuláció-leleplező,
Bitcoinban lehorgonyzott módon szeretnének előregisztrálni a
ClinicalTrials.gov, az EU CTR vagy más joghatósági regiszterek
regisztrációja **mellett**.

## Miért érdemes *kiegészítésként* MYRIAM alatt előregisztrálni?

A meglévő vizsgálati regiszterek (ClinicalTrials.gov, EU CTR, ISRCTN)
dokumentált integritási gyengeségekkel rendelkeznek:

- A ClinicalTrials.gov megengedi, hogy a szponzorok az eredeti
  regisztráció **után** módosítsák a végpontokat, a mintaméretszámításokat
  és az elemzési terveket, ahol a módosítási dátumok láthatók a
  regiszterben, de a *tartalmi* változások nem mindig kriptográfiailag
  lehorgonyzottak.
- Több nagy tanulmány (Goldacre et al., 2019; Mathieu et al., 2009)
  dokumentálta a végpontok szisztematikus post-hoc cseréjét az egész
  területen.
- A folyóiratok szerkesztői felügyelete (CONSORT, ICMJE) néhány esetet
  elkap; sok átcsúszik.

Egy MYRIAM-pecsét bezárja ezt a rést. A Merkle-gyökér + a Bitcoin
OTS-nyugta minden post-hoc változtatást az *előregisztrált* elsődleges
végpontban, a statisztikai elemzési tervben vagy az alcsoportlistán
kriptográfiailag detektálhatóvá tesz. A pecsétet forenzikailag
nehezebb visszamenőlegesen átírni, mint magát a regisztert.

Ez a csomag a joghatósági regiszterek **kiegészítése**, nem
helyettesítése. Egy valódi vizsgálatot a megfelelő regiszterben KELL
regisztrálni, ÉS MYRIAM alatt lepecsételni.

## Mi ellen véd ez a csomag

Történelmi halálozási esetek, amelyekben ez segített volna:

- **Vioxx (Merck, 2004)**: a kardiovaszkuláris események
  előregisztrált végpontok voltak az APPROVe vizsgálatban, de a
  publikált elemzés olyan határértéket használt, amely minimalizálta
  a látszólagos kárt. Az előregisztrált határérték lepecsételése
  nyilvánosan detektálhatóvá tette volna a post-hoc
  határérték-változtatást a publikált cikk előtt.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: a serdülőkori
  öngyilkossági hajlamra vonatkozó negatív vizsgálati adatokat
  post-hoc elemzéssel átkeretezték. A végpontok lepecsételt
  előregisztrációja nyilvánosan detektálhatóvá tette volna az
  átkeretezést.
- **Több onkológiai vizsgálat**, ahol a túlélési végpontokat
  helyettesítő végpontokra (progressziómentes túlélés, válaszarány)
  cserélték, amikor a túlélési előny nem valósult meg.

**Faliresikók, amelyeket a pecsét közvetlenül elkap:**

- **Végpont-csere**: egy másodlagos végpont post-hoc előléptetése
  "elsődlegessé", amikor a tényleges elsődleges megbukik. A pecsét
  FACT 05 mezője tartalmazza az előregisztrált elsődleges végpontot;
  a publikált elsődleges végpontnak meg kell egyeznie.
- **Eredmény-szelektálás**: csak a működő elemzések szelektív
  jelentése. A FACT 06 tartalmazza a teljes előregisztrált elemzési
  tervet; a publikált elemzéseknek tartalmazniuk kell az összes
  előregisztráltat.
- **Post-hoc alcsoport-bányászat**: "a gyógyszer működik az X
  alcsoporton" állítása az adatok láttán. A FACT 07 tartalmazza az
  előregisztrált alcsoportlistát; bármely másik alcsoportot
  post-hoc-ként kell jelölni.
- **Mintaméret-felülvizsgálat**: a mintaméret növelése a köztes
  trendek láttán. A FACT 06 tartalmazza az előregisztrált
  mintaméretet és erőszámítást.
- **Kényelmetlen másodlagos végpontok csendes eltávolítása**: a
  FACT 05 előre meghatározza a másodlagos végpontok sorrendjét a
  hierarchikus teszteléshez; bármilyen átrendezés vagy eltávolítás
  detektálható.
- **Negatív eredmények elnyomása**: a FACT 08 tartalmazza a
  publikációs kötelezettségvállalást; a kötelezett időablakon belüli
  publikálás elmaradása nyilvánosan látható.

**Faliresikók, amelyeket NEM fed le:**

- A vizsgálat lefolytatása során elkövetett visszaélések (hamisított
  adatok, csalárd beiratkozás). A pecsét a *tervet* horgonyozza le,
  nem a *kivitelezést*.
- A szelektív jelentés olyan publikációkban, amelyek tartalmazzák az
  összes előregisztrált elemzést, de kedvező módon értelmezik őket.
  A pecsét azt kapja el, ami hiányzik; az értelmezési torzítást nem
  tudja elkapni.
- Betegkárosodás magában a vizsgálat során. A pecsét szabályozási és
  bizonyítási jellegű; nem csökkenti a vizsgálat lefolytatásával
  kapcsolatos kockázatot.

## Mikor használja ezt a csomagot

Fontolja meg az előregisztráció lepecsételését, ha:

- Ön egy klinikai vizsgálatot — 1. fázistól 4. fázisig — szponzorál
  vagy futtat, amelyet orvosi vagy szabályozási döntések
  megalapozására fognak használni.
- Hajlandó nyilvánosan kötelezni magát az előregisztrált tervhez,
  végpontokhoz és elemzési tervhez.
- Képes kezelni a következményeket: ha a vizsgálat megbukik az
  előregisztrált végpontjain, nem írhatja át csendben egy másik,
  működő végpontra.
- Olyan kutatási kultúrában vesz részt (akadémiai orvostudomány,
  kooperatív csoportok, NIH által finanszírozott kutatás), ahol az
  előregisztráció integritását egyre inkább elvárják.

Ez a csomag *különösen* értékes a következők számára:

- Akadémiai intézményekben kezdeményezett kutatói vizsgálatok (ahol
  a szponzori nyomás a végpontok post-hoc módosítására valós, de
  ahol az akadémiai kutatónak reputációs ösztönzője van az
  ellenállásra).
- Nyílt tudományos vizsgálatok és állampolgári tudományos
  tanulmányok.
- Gyógyszer-újrahasználati vizsgálatok kis biotechnológiai
  vállalatoknál hosszú vizsgálati lefolytatási előélet nélkül.
- Bármilyen vizsgálat, amelynek szabályozási benyújtásokat kell
  megalapoznia, ahol jövőbeli "soha nem mondtuk ezt" érvek
  felmerülhetnek.

## Mikor NE használja ezt a csomagot

NE használja ezt a csomagot, ha:

- A vizsgálati protokoll valóban még alakul. Akkor regisztráljon
  elő, amikor a protokoll végleges, nem előtte.
- Nem tud kötelezettséget vállalni az eredmények iránytól
  függetlenül történő publikálására. A pecsét nyilvánosan
  detektálhatóvá teszi a publikálás elmaradását.
- A vizsgálat kompetitív ipari titoktartást foglal magában, amely
  megakadályozza az elemzési terv nyilvánosságra hozatalát. A pecsét
  az elemzési tervet állandó nyilvános rekorddá teszi; nincs mód
  arra, hogy valamit privátan lepecsételjünk.
- Nincs jogi és etikai jóváhagyása a protokollra. A pecsét úgy
  rögzíti a protokollt, AHOGY Ön lepecsételte; nem hagyhatja jóvá
  visszamenőleg egy IRB vagy etikai bizottság.

## Hogyan forkolhatja ezt a csomagot egy valódi előregisztrációhoz

```bash
# 1. Másolja le ezt a példát
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Cserélje le a fiktív tartalmat a valódi vizsgálati protokoll
# tartalmával. Minden tény egy szabványos előregisztráció egy
# szakaszának felel meg:
$EDITOR facts/01_example_notice.txt   # CSERÉLJE LE valódi fedlap-nyilatkozatra
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # ELSŐDLEGES + MÁSODLAGOS + FELDERÍTŐ
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Frissítse a site/index.html-t a valódi vizsgálat tükrözésére.

# 4. Pecsételje le (a beiratkozás megkezdése ELŐTT, az adatbázis
# zárolása ELŐTT):
bash build/seal.sh

# 5. Helyileg ellenőrizze:
python3 build/verify.py

# 6. Telepítse:
#    - Publikálja a pecsét URL-jét a vizsgálati szponzor weboldalán ÉS
#    - Adja hozzá az IPFS CID-et a vizsgálat ClinicalTrials.gov
#      rekordjának "Description" vagy "References" mezőjéhez, hogy a
#      regiszter rekordja kereszthivatkozást tartalmazzon a
#      kriptográfiai pecsétre.
```

**KRITIKUS IDŐZÍTÉS**: a pecsétet a beiratkozás megkezdése ELŐTT kell
létrehozni. Az első beteg beiratkozása után lepecsételt
előregisztráció forenzikailag sokkal gyengébb. Ideális esetben az IRB
jóváhagyásának pillanatában pecsételje le.

## Integráció a meglévő előregisztrációs infrastruktúrával

A csomagot úgy tervezték, hogy összeálljon, ne helyettesítsen:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: regisztrálja a vizsgálatot
  a joghatósági regiszterben, ahogy megköveteli. Ezután a regiszter
  "Description" vagy "References" mezőjében hivatkozzon a
  MYRIAM-mal lepecsételt publikációra.
- **OSF (Open Science Framework)**: az OSF támogatja az
  előregisztrációt dátumbélyegekkel, de nem Bitcoin-lehorgonyzással.
  A MYRIAM-pecsét kiegészítő fájlként csatolható az OSF
  regisztrációs oldalához, mindkét — dátumbélyeg és
  Bitcoin-lehorgonyzás — megadva.
- **AsPredicted.org**: hasonló — kapcsolja a MYRIAM-pecsétet
  kiegészítő URL-ként.
- **Folyóiratok**: néhány folyóirat (pl. Trials, BMJ Open) elfogadja
  az előregisztrációs URL-eket a benyújtás részeként. Csatolja a
  MYRIAM-pecsét URL-jét a regiszter URL-je mellett.

## Mit kapnak a címzettek (szabályozók, folyóirat-szemlézők, meta-analitikusok)

Egy MYRIAM alatt előregisztrált vizsgálat a szemlézőknek a következőt
adja:

1. **Kriptográfiai bizonyíték arra, hogy a protokollt egy adott
   időpontban véglegesítették.** A szemlézők ellenőrizhetik a pecsét
   idejét az OTS-nyugtán keresztül.
2. **A protokoll-szöveg bájtszintű stabilitása.** A szemlézők
   karakterről karakterre összehasonlíthatják a publikált
   módszerek szakaszt az előregisztrált tervvel.
3. **Végpont-csere detektálása.** Egy egyszerű diff a lepecsételt
   FACT 05 és a publikált elsődleges végpont között feltárja a
   helyettesítést.
4. **Elemzési terv eltérésének detektálása.** Egy egyszerű diff a
   lepecsételt FACT 06 és a publikált statisztikai módszerek között
   feltárja a módosításokat.
5. **Szelektív alcsoport-jelentés detektálása.** A lepecsételt FACT 07
   tartalmazza az összes előregisztrált alcsoportot; bármelyik a
   publikációban, amely nincs a pecsétben, post-hoc-ként kell
   jelölni.

Ez lényegesen megkönnyíti a szisztematikus áttekintést és a
meta-elemzést a jelenlegi gyakorlathoz képest.

## Mi NEM ez a csomag

- Nem helyettesíti az IRB / etikai bizottság jóváhagyását.
- Nem helyettesíti a joghatósági regiszter regisztrációját.
- Nem garantálja, hogy a vizsgálatot a tervek szerint fogják
  lefolytatni.
- Nem mód a beteg-beleegyezés vagy más etikai dokumentumok
  lehorgonyzására (azoknak saját pecsételési mechanizmusra van
  szükségük).
- Nem védelem a vizsgálati terv publikáció utáni kritikája ellen.

## Megjegyzés a negatív eredmények publikálásáról

A FACT 08 1. számú kötelezettségvállalása ("publikáció iránytól
függetlenül") a pecsét egyetlen legmagasabb halálozási hatású
kötelezettségvállalása. A negatív vizsgálati eredmények történelmi
elnyomása (különösen a serdülőkben alkalmazott pszichiátriai
gyógyszerek, az idős populációkban alkalmazott onkológiai gyógyszerek
és a nőkben alkalmazott kardiovaszkuláris gyógyszerek esetében)
hihetően több ezer megelőzhető halálesethez járult hozzá évtizedek
során torzított hatékonysági becsléseken alapuló túlírás révén.

Egy lepecsételt kötelezettségvállalás a negatív eredmények
publikálására önmagában az egyik legnagyobb tőkeáttételű
közegészségügyi lépés, amelyet egy szponzor megtehet. A pecsét külső
elszámoltathatóságot biztosít ehhez a kötelezettségvállaláshoz olyan
módon, ahogyan az önkontroll alapú publikációs irányelvek nem.

## Záró megjegyzés

A gyógyszervizsgálat MYRIAM alatti előregisztrációja kis többletmunka
a szponzor számára: ~30 perc a tények kitöltésére, ~10 másodperc a
pecsételésre. Az általa hozzáadott elszámoltathatóság aszimmetrikus:
kis költség a becsületes vizsgálati lefolytatásra, nagy korlátozás a
post-hoc manőverezésre, amely hozzájárult az evidenciabázis
történelmi torzításaihoz.

Ha Ön szponzor vagy vezető kutató, aki fontolóra veszi ezt a
csomagot, a csomag publikus tulajdonban van (CC0). Használja.
Módosítsa. Tökéletesítse.

## Licenc

Publikus tulajdon (CC0). Nincs szükség attribucióra.
