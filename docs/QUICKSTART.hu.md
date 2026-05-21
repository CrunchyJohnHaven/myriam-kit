*Magyar fordítás — az eredeti angol verzióért lásd [QUICKSTART.md](QUICKSTART.md)*

# Gyors kezdés

Öt perc a klónozástól a lepecsételt közzétételig. macOS-en tesztelve;
Linuxon működnie kellene; a Windows-felhasználóknak WSL kell.

## 0. Előfeltételek

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Váz felépítése

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Tények szerkesztése

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Minden fájl egy tény. UTF-8. LF sorvégek. A fájlnévminta
`NN_short_name.txt`, ahol NN nullával kitöltött. Lexikografikusan
rendeződnek a Merkle-fába, így a 02 mindig a 01 után jön.

Tipp: minden tényt *elnevezési vagy nyilatkozati eseményként*
fogalmazzon meg, ne ontológiai állításként a világról. „Az Acme Corp
kijelentette, hogy az X tétel átment az Y teszten" ellenőrizhető. „Az X
tétel biztonságos" nem.

## 3. Az IPFS-démon indítása (gépenként egyszer)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Lepecsételés

```bash
bash build/seal.sh
```

Ez a következőt teszi:
1. Minden tényt hash-el (SHA-256), kiszámolja a Bitcoin-stílusú
   Merkle-gyökeret.
2. A gyökeret OpenTimestamps-szal bélyegzi két független naptáron át
   (alapértelmezetten alice + finney — felülírható a
   `MYRIAM_CAL_A`/`MYRIAM_CAL_B` változókkal).
3. A `site/` könyvtárat IPFS-re rögzíti, és kiírja a CID-et.

Összesen: ~10 másodperc meleg IPFS-démonnal.

## 5. A `site/index.html` szerkesztése

Cserélje le a sablon helyőrzőit a tényleges tényekre, hash-ekre és
Merkle-gyökérre. A megjelenített, ténynként megadott hash-eknek meg
kell egyezniük a ténenkénti fájlokkal, különben az oldal megbukik a
saját önellenőrzésén.

Minden ténynél másolja a .txt fájl tartalmát egy `<div class="fact">`
blokkba, és tegye a SHA-256-ot egy közvetlenül alatta lévő
`<div class="hash">` elembe. A Merkle-gyökér a kriptográfiai pecsét
szakaszba kerül.

(Igen, ez automatikusan generálható lenne. Szándékosan nem az: a
kézi lépés az emberi felülvizsgálati lépés. A protokoll nem véd az
ellen, hogy közzétegyen valamit, amit nem olvasott.)

## 6. Helyi ellenőrzés

```bash
python3 build/verify.py
```

Várt kimenet:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

A „Pending" normális — az OTS-naptár néhány órán belül teljes
Bitcoin-tanúsítvánnyá léptetni a tanúsítást.

## 7. Telepítés

Válasszon bármelyiket:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → húzza be a `site/` mappát
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` a `site/` mappában, push a repóba, Pages bekapcsolása
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (statikus tárhely bekapcsolva)
- **Bármilyen sima VPS**: `scp -r site/* user@host:/var/www/html/`

A 4. lépésből származó IPFS-CID további tartalom-címzett URL-t ad
Önnek: `https://<CID>.ipfs.dweb.link/`. Használja.

## 8. Az OTS-tanúsítvány továbbléptetése (később)

A lepecsételés után ~néhány órán belül futtassa:

```bash
ots upgrade build/merkle_root.txt.ots
```

Ez minden naptár függőben lévő tanúsítását egy teljes
Bitcoin-tanúsítvánnyá alakítja, amely egy konkrét blokkra hivatkozik.
A továbbléptetés után telepítse újra az `.ots` fájlt a tárhelyeire.

## 9. Ennyi

Egy kis tényhalmazt úgy tett közzé, hogy bármely harmadik fél képes:

- Egyszerű HTTP-n keresztül lekérni az összes tényt a tárhelyéről
- Újraszámítani a Merkle-gyökeret a ténybájtokból
- Összevetni a közzétett gyökérrel
- Ellenőrizni, hogy a gyökeret az OTS-bélyegzett időpontban
  rögzítették a Bitcoinra
- Függetlenül lekérni ugyanazokat a tényeket IPFS-en a közzétett CID-en
- Megerősíteni, hogy minden hash egyezik

Ha ezek közül bármelyik lépés meghiúsul, manipuláció történt. Az
olvasónak nem kell megbíznia Önben. Csak el kell végeznie a matekot.
