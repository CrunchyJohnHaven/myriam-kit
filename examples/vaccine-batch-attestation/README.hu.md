*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Vakcinatétel-attesztációs készlet

Egy kulcsrakész myriam-kit példa vakcinagyártók,
minőségbiztosítási hatóságok és közegészségügyi ügynökségek számára,
akik egy Bitcoinhoz lehorgonyzott, manipulációt felfedő pecsétet
kívánnak közzétenni egy tételkiadásról.

## Mi ellen véd ez a készlet

**Hibamódok, amelyeket a pecsét megfog:**

- **A kiadási teszteredmények csendes, visszamenőleges módosítása.**
  Mind a 8 kiadási tesztelési PDF a példában hash-elve van. A
  kiadás utáni újra-hash-elés bármilyen módosítást felfed.
- **Viták arról, mely specifikációk voltak érvényben a kiadáskor.**
  A lepecsételt FACT 02 a tétel kanonikus azonosítóját és a
  gyártási nyilvántartás hash-ét tartalmazza. A jövőbeli „a
  specifikáció mindig X volt" viták nyilvános horgonyt kapnak.
- **A visszahívási hatókör csendes minimalizálása.** A FACT 05-ben
  szereplő farmakovigilancia-kötelezettségek le vannak pecsételve;
  ezek be nem tartása nyilvánosan megfigyelhető.
- **Egy specifikációból kieső tétel visszamenőleges
  újra-specifikálása.** Ha egy kiadási teszteredmény valójában
  határeseti PASS volt, amelyet kiadás után FAIL-re reklasszifikálnak,
  a lepecsételt jelentés-hash-ek bizonyítják, mit mondott az eredeti
  eredmény PDF.

**Hibamódok, amelyeket NEM fed le:**

- Csalás magában a gyártási folyamatban (a pecsét a teszt-
  eredményeket horgonyozza le, nem a gyártási integritást).
- Káros események, amelyek egy egyébként átment tétel biológiai
  következményei (a pecsét nem tanúsítja a klinikai biztonságot,
  csak a dokumentációs integritást).
- Viták arról, hogy egy szabályozási specifikáció melyik verziója
  hiteles.

## Mikor használjuk ezt a készletet

Fontolja meg egy tételkiadás lepecsételését, ha:

- Ön olyan vakcinagyártó, aki demonstrálni szeretné a kiadási
  nyilvántartások forenzikus integritását azon túl, amit a
  szabályozók megkövetelnek
- Ön olyan QA-csapat, amely átveszi a „publikáljuk, amit attesztálunk"
  gyakorlatot
- Ön kis vagy nemzeti léptékű gyártó olyan joghatóságban, ahol a
  szabályozási infrastruktúra gyengébb, és tételnyilvántartásokat
  szeretne lehorgonyozni egy globális verifikátorral szemben
- Ön közegészségügyi ügynökség vagy NGO, amely nem-kereskedelmi
  vakcinatermelési programot futtat (pl. elhanyagolt betegségekre)

## Történelmi halálozási precedens

- **Heparin-szennyeződés (2008, Kína):** hamisított túl-szulfátozott
  kondroitin-szulfát a heparintételekben. Egy lepecsételt kiadási
  teszt manifeszt a tesztelési nyilvántartás kiadás utáni csendes
  módosítását kriptográfiailag észlelhetővé tette volna.
- **Tylenol-cianid (1982):** visszamenőleges viták a
  manipuláció eredeti pontjáról. Egy lepecsételt gyártási
  nyilvántartás hash-e lehorgonyozza a forgalmazás előtti állapotot.
- **Különböző vakcinatétel-visszahívások**, ahol az „vajon
  ezt a tételt valaha megfelelően tesztelték-e" kérdés évekkel
  később válik vitatottá.

A készlet ezek egyikére sem megoldás szigorú értelemben — de
minden esetben lepecsételt tétel-attesztációk tisztább forenzikus
időbeli vonalat biztosítottak volna.

## Hogyan forkoljuk ezt a készletet valós tételhez

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # cserélje le a fiktív tartalmat valós tételre
bash build/seal.sh        # PECSÉTELJEN MIELŐTT a forgalmazás elkezdődik
python3 build/verify.py   # erősítse meg
```

**KRITIKUS IDŐZÍTÉS**: pecsételjen a QA-kiadás pillanatában,
MIELŐTT a tételt forgalmazzák. A forgalmazás utáni pecsét
forenzikusan gyengébb.

## Integráció a meglévő farmaceutikai infrastruktúrával

- **eCTD-beadványok (FDA / EMA):** a lepecsételt közzététel URL-je
  vagy IPFS CID-je hivatkozható a 3. modul (minőség) szakaszában
- **WHO-előminősítés:** a lepecsételt manifeszt demonstrálja a
  kiadás előtti tesztelési láncot a nem FDA/EMA-joghatóságok felé
- **Farmakovigilancia-visszacsatolás:** a FACT 05 kötelezi a
  gyártót az aggregált AE-számok lepecsételt jelentésére 6 és 12
  hónapnál
- **Visszahívási rendszerek (RxConnect, MedWatch):** ha
  visszahívásra van szükség, maga a visszahívás hatóköre MYRIAM
  alatt le van pecsételve, ami nyilvános ellenőrzést biztosít
  arról, hogy minden forgalmazott tételt kezelnek

## Amit ez a készlet NEM helyettesít

- FDA / EMA / WHO szabályozói beadványok
- GMP audit-ketékek (a pecsét EREDMÉNYEKET horgonyoz le, nem nyers
  folyamat-nyilvántartásokat)
- Farmakovigilancia-adatbázisok (VAERS / EudraVigilance)
- Visszahívási koordinációs rendszerek

## Licenc

Közkincs (CC0). Forkolja. Nincs szükség forrásmegjelölésre.
