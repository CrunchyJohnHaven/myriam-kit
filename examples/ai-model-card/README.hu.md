*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# AI-modell viselkedéslezáró készlet

Kulcsrakész myriam-kit példa AI-laboratóriumok (kereskedelmi vagy nyílt
forráskódú) számára, amelyek egy modellt adnak ki, és a kiadás állításait —
súlyok azonossága, képességek, értékelési pontszámok, biztonsági átvizsgálás,
kiadás előtti kötelezettségvállalások — **kriptográfiailag lehorgonyzottá és
nyilvánosan ellenőrizhetővé** kívánják tenni.

A készlet az ellen a konkrét hibamód ellen véd, amikor az üzembe helyezett
modellek csendben elsodródnak, az értékelési pontszámokat utólag átírják,
vagy a kiadás előtti állításokat évekkel később úgy vitatják, hogy „ezt soha
nem mondtuk".

## Mit állít elő ez a készlet

Egy kriptográfiailag lepecsételt manifesztet, amely egy modellkiadásra
vonatkozóan az alábbiakat tartalmazza:

1. Modellazonosítás (név, architektúra, paraméterszám, licenc)
2. **Súlyok fájl SHA-256-a** — a kanonikus műtárgy-hash
3. Modellkártya-szöveg (képességek, tervezett használat, hatókörön kívüli
   használat, ismert hibamódok)
4. Kiadáskori értékelési eredmények (képességértékelések, biztonsági
   értékelések, kalibráció)
5. Kiadás előtti kötelezettségvállalások (azok a dolgok, amelyekre vállalod,
   hogy nem változtatod meg csendben a kiadás után)
6. Aláíró megbízó (a felelősséget vállaló ember + szervezet)

A pecsét ezek mindegyikét byte-stabillá, OpenTimestamps révén Bitcoinhoz
időhorgonyzottá, és IPFS-en keresztül bármely egyetlen hosting féltől
függetlenül lekérhetővé teszi.

Lásd a kidolgozott fiktív példát: [facts/](facts/) és a megjelenített
[site/index.html](site/index.html). A példa egy fiktív modellt használ
(„Calm-mini-v0"); egy valódi kiadás lecserélné a példa tartalmát.

## Mi ellen véd ez a készlet

**Hibamódok, amelyeket a pecsét közvetlenül megfog:**

- **Súlyok manipulálása** — a kiadott súlyok fájl SHA-256-a a FACT 03-ban van.
  A bájtok bármilyen kiadás utáni módosítása, amelyet a felhasználó letölt,
  újra-hasheléssel észlelhető.
- **Értékelések csendes átírása** — a kiadáskori értékelési pontszámok a
  FACT 05-ben vannak. A jövőbeli „az értékelési pontszám mindig X volt" típusú
  viták nyilvános horgonyt kapnak.
- **Képességállítások sodródása** — a FACT 04-ben szereplő modellkártya-szöveg
  byte-stabil. A jövőbeli „soha nem állítottuk az X képességet" típusú viták
  nyilvánosan ellenőrizhetők a lepecsételt szöveggel szemben.
- **Csendes finomhangolás-újraterjesztés** — a kiadás előtti #1
  kötelezettségvállalás a FACT 06-ban (a kidolgozott példában) az „azonos név
  alatti csendes finomhangolás tilalma". Felismerés: bármely új súly-hash új
  modellnevet és új lepecsételt közzétételt jelent, vagy a vállalás sérül.
- **Rejtett hibamódok** — a FACT 04 elkötelezi magát egy ismert-hibamódok
  lista mellett. A lista monoton (növekedhet, de nem zsugorodhat egy
  befagyasztott checkpoint esetén). A laboratórium által belsőleg ismert,
  de nem publikált hibamódok jövőbeli felfedezése vitatható bizonyítékká válik.

**Hibamódok, amelyeket NEM fed le:**

- A modellek visszaélésszerű használata utólagos felhasználók által (a pecsét
  azt bizonyítja, mi került kiadásra, nem azt, hogy a felhasználók mit
  csinálnak vele).
- Harmadik felek által végzett ellenséges finomhangolás (egy harmadik fél
  finomhangolása más súly-hasht állít elő, tehát az eredeti pecsétet nem
  érinti, de a harmadik fél modellje a pecsét védelmén kívül esik).
- Az üzembe helyezési környezet változásai miatti viselkedésváltozások (eltérő
  rendszerpromptok, RAG-konfigurációk stb.).
- Olyan hibák, amelyekről a laboratórium kiadáskor valóban nem tudott. A
  pecsét a laboratóriumot *ahhoz köti, amit tudott*; nem tudja lehorgonyozni
  azt, amit nem tudott.

## Mikor használd ezt a készletet

Fontold meg egy modellkártya lepecsételését, ha:

- Modellsúlyokat adsz ki nyilvánosan VAGY modellt helyezel üzembe olyan
  környezetben, ahol az utólagos felhasználók törődnek a viselkedés
  stabilitásával.
- A kiadás eléggé jelentős ahhoz, hogy a jövőbeli „ezt soha nem mondtuk"
  típusú viták valószínűek (bármely nagyméretben üzembe helyezett modell;
  bármely biztonságkritikus modell; bármely képességállításokkal kísért
  kiadás).
- A szervezeted hajlandó olyan kiadás előtti kötelezettségvállalásokat tenni,
  amelyek korlátozzák a jövőbeli intézkedéseket (ez a teherbíró rész — lásd
  a következő szakaszt).
- A kiadás pillanatában tudod számítani a súlyok fájl SHA-256-át.

## Mikor NE használd ezt a készletet

NE használd ezt a készletet, ha:

- Nem vagy hajlandó kötelezni magad a példa FACT 06-jában szereplő kiadás
  előtti kötelezettségvállalásokra. A pecsét mechanikailag észlelhetővé
  teszi a kötelezettségvállalásokat; ha nem állsz készen erre az
  elszámoltathatóságra, ne pecsételd le.
- A súlyok fájl gyakran fog változni (pl. folyamatos finomhangolási
  pipeline-ok). Minden súlyváltozás új lepecsételt kiadást igényel. A
  kiadásonkénti pecsételés súlyos; ez a készlet *befagyasztott*
  checkpointokra való.
- Még nem végezted el a biztonsági átvizsgálást. A pecsét rögzíti a
  biztonsági átvizsgálás megállapításait. Ha egy hiányos átvizsgálást
  pecsételsz le, állandó nyilvános dokumentumod lesz egy hiányos
  átvizsgálásról.
- Lehet, hogy később vissza akarsz vonni egy konkrét értékelési pontszámot.
  A pecsét végleges. Új lepecsételt közzétételek felülírhatják, de az
  eredetit nem lehet meg nem történtté tenni.

## A teherbíró kiadás előtti kötelezettségvállalások

A példa FACT 06-ja a kiadót az alábbiakra kötelezi:

1. **Nincs csendes finomhangolás azonos néven.** Bármely finomhangolás új
   modellnevet, új lepecsételt közzétételt, új súly-hasht eredményez. A
   megelőző változat marad kanonikusan a megnevezett verzió.

2. **Nincs csendes értékelés-frissítés.** Az újraértékelések új lepecsételt
   közzétételeket kapnak, amelyek Merkle-gyökér alapján hivatkoznak az
   eredetire. A verziókat követjük, nem írjuk felül.

3. **Az ismert hibamódok nőhetnek, soha nem zsugorodhatnak.** Egy
   befagyasztott checkpoint hibamódjait nem lehet javítani. Tehát a publikált
   lista gyakorlatilag monoton.

4. **Eltávolítás kezelése.** Ha a modellt kötelezően el kell távolítani a
   terjesztésből, a laboratórium vállalja, hogy közzétesz egy végső
   lepecsételt nyilatkozatot az eltávolításról.

Egy ezt a készletet átvevő laboratóriumnak el kell döntenie, mely
kötelezettségvállalásokat tudja valóban tiszteletben tartani. Ha mind a
négyet nem tudod tiszteletben tartani, *a pecsételés előtt* módosítsd a
FACT 06-ot, hogy az tükrözze, amit tiszteletben tudsz tartani, és fogadd el
a következő gyengébb védelmet. Olyan kötelezettségvállalások lepecsételése,
amelyeket nem áll szándékodban tiszteletben tartani, rosszabb, mint egyáltalán
nem pecsételni.

## Hogyan forkold ezt a készletet egy valódi kiadáshoz

```bash
# 1. Másold ezt a példát a kiadási pipeline-odba
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Szerkessz minden tényt a valódi kiadásodhoz
$EDITOR facts/01_example_notice.txt   # TÁVOLÍTSD EL — a kiadásod nem példa
                                       # Cseréld le egy kiadási értesítésre a modelledhez
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # a kanonikus modellkártya
$EDITOR facts/05_eval_results.txt     # tényleges értékelési eredmények
$EDITOR facts/06_release_commitments.txt # mely kötelezettségvállalásokat tudod tartani

# 3. Frissítsd a site/index.html-t, hogy tükrözze a valódi kiadást.

# 4. Pecsételj.
bash build/seal.sh

# 5. Ellenőrizd helyileg.
python3 build/verify.py

# 6. Telepítsd:
#    - A kiadási oldaladra (a modellkártya és a súlyok mellé)
#    - Az IPFS hálózatra (a seal.sh szkript ezt már megteszi)
#    - Opcionális: hivatkozz a lepecsételt közzétételre a Hugging Face / GitHub
#      kiadási jegyzeteidből
```

## Integráció meglévő kiadási pipeline-okkal

A készletet úgy tervezték, hogy meglévő eszközökkel együtt működjön, ne
helyettesítse őket:

- **Hugging Face**: foglald bele a lepecsételt közzététel URL-jét vagy
  IPFS CID-jét a modellkártya README.md-jébe. Irányítsd az olvasókat a
  pecsétre a byte-stabil kiadási állításokért.
- **GitHub kiadások**: foglald bele az OpenTimestamps nyugtát
  (`merkle_root.txt.ots`) kiadási eszközként. A jövőbeli „a kiadás megváltozott"
  típusú viták ekkor Bitcoinhoz vannak horgonyozva.
- **Modellkártya-szabványok (Mitchell et al. 2019)**: a készlet kompatibilis.
  A szabványos modellkártya-mezők a pecsét FACTS 02–05-jére képeződnek le. A
  modellkártyát normál módon állítod elő, és emellett le is pecsételed.
- **Értékelési harness-ek (lm-evaluation-harness, BIG-bench stb.)**: hash-eld
  a pontos harness-commit és a nyers output JSON-t; hivatkozz ezekre a
  hashekre a FACT 05-ben. A jövőbeli újrafuttatások ekkor függetlenül
  reprodukálhatók.

## A súlyok hash-ének kiszámítása

Egyetlen safetensors fájl esetén:

```bash
shasum -a 256 model.safetensors
```

Többfájlos checkpointok esetén (GGUF shardok, shardolt safetensors):

```bash
# Fűzd össze a hash-eket rendezett sorrendben, majd hash-eld újra
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

A végső hash kerül a FACT 03-ba. Foglald bele mind a sharden­kénti hash-eket,
mind a végső aggregált hash-t, hogy a felhasználók letöltés közben tudják
ellenőrizni az egyes shardokat.

## Mit kell tudniuk a címzetteknek (a modelled felhasználóinak)

Egy MYRIAM-lepecsételt közzététellel ellátott modellkiadás lehetővé teszi
a felhasználó számára, hogy:

1. **Ellenőrizze a letöltött súlyokat** újra-hasheléssel és a FACT 03-mal
   való összehasonlítással.
2. **Ellenőrizze, hogy a modellkártyát nem írták-e át utólag** a lepecsételt
   FACT 04 és a laboratórium aktuálisan publikált verziójának
   összehasonlításával.
3. **Ellenőrizze, hogy az értékelési pontszámok a kiadáskoriak-e** a
   laboratórium aktuális értékelési állításainak a lepecsételt FACT 05-tel
   való összevetésével.
4. **Felelősségre vonja a laboratóriumot a kiadás előtti
   kötelezettségvállalásaiért** a tényleges viselkedésnek a lepecsételt FACT
   06-tal való összevetésével.

Egy felhasználó, aki eltéréseket talál, kriptográfiai bizonyítékkal
rendelkezik az eltérésről. Közzéteheti ezt a bizonyítékot; az eredeti
lepecsételt közzététel a horgony.

## Mi NEM ez a készlet

- Nem helyettesíti a biztonsági átvizsgálás tényleges elvégzését. A pecsét a
  biztonsági átvizsgálás *jegyzőkönyve*, nem maga az átvizsgálás.
- Nem helyettesíti a tényleges értékeléseket. A pecsét lehorgonyozza az
  általad előállított pontszámokat; nem validálja a módszertant.
- Nem garancia arra, hogy a modell biztonságos. A pecsét dokumentálja, mit
  állít a laboratórium a modellről a kiadáskor; nem hitelesíti ezeket az
  állításokat.
- Nem védelem a modell utólagos felhasználók általi visszaélésszerű
  használata ellen.

## Megjegyzés az ellenséges finomhangolásról

Egy gyakori AI-biztonsági aggodalom: valaki finomhangolja a modelledet,
hogy eltávolítsa a biztonsági viselkedéseket, és újraterjeszti. A pecsét
ezt NEM tudja megakadályozni. Amit a pecsét tud tenni:

- Lehorgonyozza, mit kellett volna tennie az *eredeti* modellnek (FACT 04).
- Lehorgonyozza, hogy mik voltak az eredeti értékelési pontszámok (FACT 05).
- Olyan referenciapontot biztosít, amelyhez képest az ellenséges
  finomhangolások mérhetők.

Egy felhasználó, aki harmadik fél általi újraterjesztéssel találkozik,
ellenőrizheti, hogy a súlyok megegyeznek-e az eredeti lepecsételt hash-sel.
Ha nem, a felhasználó tudja, hogy nem eredeti modellje van, és a
laboratóriumnak tulajdonított bármely biztonsági állítás nem érvényes.

## Zárszó

Egy modellkiadás lepecsételése kis többletmunka a laboratórium számára:
~10 perc a hash-ek kiszámítása és a pecsételési szkript futtatása, majd
egy 30 másodperces döntés arról, mely kiadás előtti
kötelezettségvállalásokat foglalja bele. Az általa hozzáadott
elszámoltathatóság aszimmetrikus: kis költség a tisztességes laboratóriumok
számára, nagy korlát azokra a laboratóriumokra, amelyek egyébként csendben
elsodorták volna állításaikat.

Ha AI-laboratórium vagy, és az átvételét fontolgatod, a készlet közkincs
(CC0). Forkold. Módosítsd. A matematika a teherbíró rész, nem a konkrét
megvalósítás.

## Licenc

Közkincs (CC0). Attribúció nem szükséges.
