*Magyar fordítás — az eredeti angol verzióért lásd [SPEC.md](SPEC.md)*

# MYRIAM-kit protokollspecifikáció

## 0. Cél

Ez a dokumentum egy minimális protokollt specifikál egy kis halmaz
szöveges tény közzétételére manipulációt felfedő, kriptográfiailag
ellenőrizhető formában, amely túléli bármely egyetlen tárhelyszolgáltató
eltávolítási intézkedését.

Ez annak a protokollnak az általánosítása, amelyet először a
[disclosure.host](https://disclosure.host) oldalon telepítettek
„MYRIAM v1" néven.

## 1. Nem-célok

- Titkok tárolása. Minden konstrukciónál fogva nyilvános.
- Nagy adathalmazok. ~20 ténynél többre a protokoll rossz formájú.
- Valós idejű közzététel. Minden közzététel egy diszkrét lepecsételési
  esemény.
- Visszavonás. A protokoll verzió szinten csak hozzáfűző (append-only).

## 2. Ténymodell

Egy TÉNY egy UTF-8 szöveges fájl, a következőkkel:

- Fájlnévminta: `NN_short_name.txt`, ahol NN nullával kitöltött
  kétjegyű index, 01-től kezdve.
- Kanonikus forma: a bájtok ahogy le vannak írva, normalizáció nélkül.
- Tényenkénti hash: kisbetűs hexadecimális `SHA-256(file_bytes)`.

A tény-HALMAZ a `facts/` alatt a mintára illeszkedő összes fájl
rendezett listája, lexikografikusan sorba állítva.

Megkötés: minden ténytörzset *elnevezési eseményként* vagy
*nyilatkozati eseményként* KELL megfogalmazni, amely egy konkrét
félhez köthető. Az ontológiai állítások („a Hold kőzet")
aláássák az ellenőrizhetőségi kaput; csak a közzétételi
esemény ellenőrizhető, maga az állítás nem. „X kijelentette, hogy Y"
a megfelelő forma. „Y igaz" nem az.

## 3. Merkle-gyökér

Bitcoin-stílusú, ahogy a telepített MYRIAM protokoll v0-jában:

1. Levelek: tényenkénti SHA-256 hash-ek a tényhalmaz sorrendjében.
2. Ha egy szinten páratlan számú csomópont van, duplikálja az utolsó
   csomópontot.
3. Páronkénti hash-elés a szomszédos csomópontoknál:
   `parent = SHA-256(left_bytes || right_bytes)`, ahol a `left_bytes`
   és `right_bytes` a nyers 32 bájtos hash-értékek (nem a hexadecimális
   reprezentációjuk).
4. Ismételje, amíg egyetlen csomópont marad. Az a Merkle-gyökér.

A gyökeret kisbetűs hexadecimálisként, záró újsor nélkül teszik közzé.

### 3.1 Tesztvektorok

| Vektor | Levelek (hash-elt UTF-8 bájtok) | Várt gyökér (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Bármely megfelelő implementációnak reprodukálnia KELL ezeket a
vektorokat. A tényleges `lib/build.py` szkriptből származnak, és
azzal újragenerálhatók.

## 4. Bitcoin-lehorgonyzás

A Merkle-gyökeret az
[OpenTimestamps](https://opentimestamps.org) szolgáltatáson keresztül
rögzítik a Bitcoin blokkláncon. Az alapértelmezett politika:

> Bélyegezzen legalább két, független adminisztratív irányítás alatt
> álló naptárüzemeltető ellen.

Az ezt a politikát kielégítő tanúsítványt bármely fél ellenőrizheti,
aki az `ots verify <receipt>.ots` parancsot le tudja futtatni, és el
tudja érni valamelyik naptár továbbléptetési útvonalát.

A `lib/seal.sh` által szállított alapértelmezett üzemeltetőpár:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Az implementációk EGYÉB üzemeltetőket is használhatnak. A
tanúsító-sokféleségi politika (≥2 független üzemeltető) normatív; a
konkrét üzemeltetők nem.

## 5. Tartalom-címzett tükrözés

A közzétett oldalt és a tényfájlokat tartalmazó `site/` könyvtárat
HOZZÁ KELLENE adni az IPFS-hez:

```
ipfs add -r --cid-version=1 -Q site/
```

Az eredményül kapott CIDv1 (dag-pb kodek) a közzététel
tartalom-címe. Determinisztikus a `site/` bájttartalmából. A `site/`
alatti bármely fájl bármilyen módosítása más CID-et eredményez.

A közzétevő helyi csomópontján túli további szolgáltatásokon való
rögzítés a tartósság érdekében erősen ajánlott; ez a specifikáció nem
ír elő konkrét szolgáltatásokat.

## 6. Verziókezelés

A protokoll **verzió szinten csak hozzáfűző (append-only)**. Minden
változás új lepecsételt verziót igényel:

- Egy új (vagy változatlan) specifikációs verzió
- Egy új tényhalmaz, amely változatlanul ÖRÖKÖLHET tényeket a korábbi
  verziókból
- Egy új Merkle-gyökér
- Egy új OpenTimestamps-tanúsítvány
- Egy új IPFS-CID

Minden korábbi verzió közzétéve marad verziózott URL-eken. Egy v(N)
tény bármilyen módosítása v(N+1)-et igényel, és mindkét verzió
látható és újraellenőrizhető marad.

## 7. Ellenőrzés

Bármely harmadik fél ellenőrizheti egy közzététel integritását a
következőképpen:

1. Letölti a tényfájlokat, és újraszámítja a tényenkénti SHA-256
   hash-eket.
2. Újraszámítja a Merkle-gyökeret a §3 szerint, és összehasonlítja a
   közzétett gyökérrel.
3. Az OpenTimestamps-tanúsítványt a Bitcoin blokklánccal szemben
   ellenőrzi legalább egy naptár teljes tanúsításáig.
4. Függetlenül újraszámítja az IPFS-CID-et az `ipfs add -r --cid-version=1`
   paranccsal, és összehasonlítja a közzétett CID-del.

A `lib/verify.py` az 1–3. lépéseket a Python standard könyvtáron és
az `ots` kliensen kívül semmilyen külső függőség nélkül elvégzi. A 4.
lépéshez az `ipfs` kliens szükséges.

## 8. Visszautasítási kapu

Egy közzététel NEM TARTALMAZHAT olyan tényt, amely:

- Olyan magánjellegű harmadik felet azonosít, aki nem járult hozzá a
  megnevezéséhez.
- Egy hipotézist megerősítésként mutat be.
- Nem redukálható egy ellenőrizhető elnevezési/nyilatkozati eseményre
  vagy egy kriptográfiai műtárgyra.
- Közzététele esetén ésszerűen várható az elkerülhető halálesetek
  számának növekedése.

A negyedik szabály a teherbíró. A közzétevő érvényesíti az emberi
felülvizsgálati lépésben. Protokollszinten nincs érvényesítése a
visszautasítási kapunak; a protokoll bármilyen bájtot közzétesz, amit
megkap. A kapu a közzétevő felelőssége.

## 9. A korlátok őszinte megfogalmazása

- **Észlelhetőség, nem lehetetlenség.** A protokoll a manipulációt
  észlelhetővé teszi, nem lehetetlenné. Egy elszánt támadó még mindig
  helyettesíthet egy másik közzétételt, és néhány olvasót meggyőzhet,
  hogy az az eredeti. A protokoll értéke abban áll, hogy a
  helyettesítés kriptográfiailag kimutathatóvá válik bárki számára,
  aki lefuttatja az ellenőrzést.
- **Nincs védelem a valótlanságok közzététele ellen.** Ha a
  közzétevő egy „X történt" állítást tartalmazó tényt pecsétel le,
  és X nem történt meg, a protokoll a hamis állítást ugyanazzal a
  pontossággal pecsételi le, mint az igazat. A protokoll arról
  tanúskodik, amit *közzétettek*, nem arról, ami *igaz*.
- **Egyetlen fél által végzett aláírás.** A telepített MYRIAM v1
  egyetlen aláíró megbízót használ. A többfeles aláírás jövőbeli
  munka.
- **Rögzítési tartósság.** Az IPFS-rögzítés kizárólag a közzétevő
  csomópontján csak annyit nyújt: „elérhető, amíg a laptopom be van
  kapcsolva + opportunisztikus átjáró-gyorsítótárazás". A
  hosszú távú tartósság redundáns rögzítéseket igényel
  független szolgáltatásokon át.

Ezeket a korlátokat itt fogalmazzuk meg, nehogy bármely olvasó azt
feltételezze, hogy a protokoll többet nyújt, mint amennyit valójában.
