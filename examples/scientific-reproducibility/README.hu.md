*Magyar fordítás — az eredeti angol változatért lásd [README.md](README.md)*

# Tudományos reprodukálhatósági készlet

Kulcsrakész myriam-kit példa kutatócsoportok, folyóiratok és
reprodukálhatóságra fókuszáló intézmények számára, akik egy
Bitcoinhoz lehorgonyzott, manipulációt felfedő reprodukálhatósági
manifesztet kívánnak közzétenni egy cikk vagy preprint mellé.

## Mit állít elő ez a készlet

Egy lepecsételt közzététel, amely egy tanulmányra vonatkozóan az
alábbiakat tartalmazza:

1. Tanulmány azonosítása (cikk címe, szerzők, intézmény, finanszírozók,
   érdekellentét — COI)
2. **Nyers adat archívum SHA-256 hash-e** — a kanonikus adathalmaz
3. **Elemzési csővezeték hash-e** — szkript + Docker képmás digest +
   rögzített függőségek
4. **Várt kimeneti csomag hash-e** — amit egy hűséges reprodukálónak
   elő kell állítania
5. Reprodukciós protokoll + eredmények utáni közzétételi kötelezettségek
6. Aláíró megbízó(k)

A pecsét a **pre-analízis** szakaszra szól: az adatok lefagyasztva, a
csővezeték véglegesítve, a várt kimenet kiszámolva, MIND mielőtt
bárki bármilyen eredményt látna a cikk megírása céljából.

## Mi ellen véd ez a készlet

**Hibamódok, amelyeket a pecsét megfog:**

- **p-hackelés**: az elemzés eredmények láttán történő utólagos
  módosításai észlelhetők a lepecsételt FACT 04 és a publikált
  csővezeték közötti diff alapján.
- **HARKing** (Hypothesizing After Results are Known — az eredmények
  ismeretében utólag megfogalmazott hipotézis): az FACT 02-ben
  előzetesen regisztrált hipotézis byte-szinten stabil.
- **Cikk utáni adatmanipuláció**: az adatarchívum újra-hashelése az
  FACT 03-mal szemben minden módosítást felfed.
- **Csővezeték-sodródás**: az elemzési csővezeték újra-hashelése az
  FACT 04-gyel szemben elkapja a csendes változtatásokat.
- **Szerzőséggel való játszadozás**: a szerzők csendes hozzáadása vagy
  eltávolítása a publikáció után észlelhetővé válik a lepecsételt
  FACT 02-vel szemben.

**Hibamódok, amelyeket NEM fed le:**

- A nyers adatgyűjtésben elkövetett csalás (a pecsét az adatokat a
  pecsételés időpontjában, nem a gyűjtésben rögzíti)
- Biológiai / empirikus nem-reprodukálhatóság (a pecsét csak a
  számítási reprodukálhatóságot rögzíti)
- Mintaméret- vagy populációs érvényességi problémák (ezek
  tanulmánytervezési kérdések)
- Az alapul szolgáló állítás igazsága (a pecsét azt rögzíti, amit
  állítottak, nem azt, hogy a világ megfelel-e az állításnak)

## Mikor használjuk ezt a készletet

Fontolja meg a pecsételést, ha:

- Olyan kutatócsoport, amely nagy tétben futó elemzést végez
  (klinikai vizsgálat, MI-rendszer kiértékelése, replikációs
  vizsgálat), és az OSF / GitHub időbélyegeken túli forenzikus
  integritást kíván
- Pályakezdő kutató, aki aszimmetrikus hírnévvédelmet szeretne:
  lepecsételt pre-analízis azt jelenti, hogy a jövőbeli „p-hackeltek"
  kritikának van egy nyilvános falszifikálója
- Folyóirat-szerkesztő vagy replikációs projekt vezetője, aki
  kriptográfiai szintű előregisztrációt szeretne ösztönözni
  egy cikk-részhalmaz számára
- Olyan elemzésen dolgozik, ahol az utólagos finomhangolásnak
  érdemi területi következményei vannak (pszichológia, viselkedési
  közgazdaságtan, orvosi kutatás)

## Történelmi mortalitási / káros előzmény

E készlet mortalitási relevanciája közvetett:

- **Őssejt / rákkutatási nem-reprodukálhatóság:** több cikk
  vezetett betegek károsodásához rosszul irányított klinikai
  vizsgálatokon keresztül. Az eredeti csővezeték lepecsételt
  előregisztrációja lehorgonyozta volna az összehasonlítást.
- **A Tamiflu hatékonyságáról szóló vita:** a Cochrane-áttekintés
  részben azért tartott évekig, mert a nyers adatokhoz való
  hozzáférés vitatott volt. Lepecsételt adat-hash-ek a publikáció
  idején azonnal megoldhatóvá tették volna az adat-hozzáférési
  vitákat.
- **Általános nem-reprodukálhatósági krízis:** a nem reprodukálható
  biomedicinális kutatás területi szintű mortalitási költsége
  jelentős (Begley & Ellis 2012 a preklinikai eredmények >50%-át
  becsülte nem reprodukálhatónak). A kriptográfiai lehorgonyzás
  egy strukturális emelő.

## Hogyan forkoljuk ezt a készletet

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# KRITIKUS: ezt MIELŐTT bármilyen eredményt látna
shasum -a 256 raw_data_v0.tar.gz       # számolja ki a kanonikus adat-hash-t
shasum -a 256 analysis.py              # hashelje a csővezetékét
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # töltse fel valós értékekkel
bash build/seal.sh                     # pecsételjen az elemzés futtatása ELŐTT
python3 build/verify.py                # erősítse meg

# Most futtassa az elemzést. Hashelje a kimenetet és erősítse meg,
# hogy egyezik az FACT 05-tel. Ha nem egyezik, a csővezeték nem
# determinisztikus; javítsa és pecsételje újra.
```

## Integráció a meglévő tudományos infrastruktúrával

- **arXiv / bioRxiv / medRxiv**: helyezze el a MYRIAM-pecsét URL-jét
  vagy IPFS CID-jét az absztraktban vagy a kiegészítő anyagokban
- **OSF**: csatolja a pecsét-műtárgyat az OSF-projekthez a hagyományos
  előregisztrációs űrlap mellé
- **AsPredicted**: helyezze el a MYRIAM-pecsét URL-jét az
  előregisztrációs dokumentumban
- **GitHub**: az elemzési csővezeték commit hash-e az, amit az
  FACT 04 lehorgonyoz; a GitHub a forrást adja, a MYRIAM a
  byte-okat horgonyozza le
- **Zenodo / Figshare / OpenAIRE**: helyezze el a nyers adatokat,
  majd pecsételje le az elhelyezés hash-ét; a pecsétet forenzikusan
  nehezebb csendben lecserélni, mint az elhelyezés metaadatait
- **Folyóirat kiegészítő anyagok**: csatolja a MYRIAM-pecsét
  műtárgyát kiegészítő fájlként a benyújtáskor

## Amit ez a készlet NEM helyettesít

- IRB / etikai bizottsági jóváhagyás
- Lektorálás (peer review)
- Replikációs vizsgálatok (számítási reprodukálhatóság ≠ empirikus
  reprodukálhatóság)
- Adathozzáférési megállapodások érzékeny adatokhoz

## Megjegyzés a szerzői sorrendről és a kreditről

A pecsét a SZERZŐI LISTÁT a pecsételés idején rögzíti. A publikáció
után felmerülő szerzőségi viták a lepecsételt listával szemben
értékelhetők. Ez egy kis elszámoltathatósági emelő — fontos a
pályakezdő kutatók számára, akiket csendben hozzáadnak vagy
eltávolítanak.

## Licenc

Közkincs (CC0). Használja, módosítsa, hagyja figyelmen kívül, forkolja.
