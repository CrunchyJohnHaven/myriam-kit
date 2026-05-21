*Ìtumọ̀ sí Yorùbá — fún ìtẹ̀jáde Gẹ̀ẹ́sì àkọ́kọ́, wo [QUICKSTART.md](QUICKSTART.md)*

# Ìbẹ̀rẹ̀ Kíákíá

Ìṣẹ́jú márùn-ún láti clone dé ìtẹ̀jáde tí a fi èdìdì lù. A ti dán an wò lórí macOS;
Linux yẹ kí ó ṣiṣẹ́; àwọn olùlò Windows yóò nílò WSL.

## 0. Àwọn ohun tí a nílò ṣáájú

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Pèsè ètò

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Ṣe àtúnṣe àwọn òtítọ́

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Fáìlì kọ̀ọ̀kan jẹ́ òtítọ́ kan. UTF-8. Ìparí ìlà LF. Àpẹẹrẹ orúkọ fáìlì jẹ́
`NN_short_name.txt` níbi tí NN ti jẹ́ olùṣàfihàn nọ́mbà tí a fi òdo dí ní iwájú.
A ṣe àtòjọ wọn ní ìtẹ̀le àwọn ọ̀rọ̀ ní àkójọ inú igi Merkle, nítorí náà 02 máa ń wà
lẹ́yìn 01 nígbà gbogbo.

Ìmọ̀ràn: sọ òtítọ́ kọ̀ọ̀kan gẹ́gẹ́ bí *ìṣẹ̀lẹ̀ ìdánilórúkọ tàbí ìfìsílẹ̀-òfin*, kì í ṣe
gẹ́gẹ́ bí ẹ̀sùn ontolojíìkì nípa ayé. "Ilé-iṣẹ́ Acme ti fi ìdí múlẹ̀ pé bátchi X
kọjá ìdánwò Y" jẹ́ ohun tí a lè jẹ́rìí. "Bátchi X jẹ́ ààbò" kò jẹ́.

## 3. Bẹ̀rẹ̀ daemon IPFS (ìgbà kan ṣoṣo lórí ẹ̀rọ kọ̀ọ̀kan)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Fi èdìdì lù

```bash
bash build/seal.sh
```

Èyí yóò:
1. Ṣe hash òtítọ́ kọ̀ọ̀kan (SHA-256), ṣe ìṣirò gbòǹgbò Merkle ti aṣa Bitcoin.
2. Fi èdìdì OpenTimestamps lu gbòǹgbò náà nípasẹ̀ kalẹ́ńdà ọ̀tọ̀ọ̀tọ̀ méjì
   (alice + finney gẹ́gẹ́ bí àyàsọ́tọ̀ — fi `MYRIAM_CAL_A`/`MYRIAM_CAL_B` ṣe àtúnṣe).
3. Fi ìtọ́sọ́nà `site/` sí IPFS, kí ó sì tẹ CID jáde.

Àpapọ̀: nǹkan bí ìṣẹ́jú-aaya 10 pẹ̀lú daemon IPFS tí ó ti gbóná.

## 5. Ṣe àtúnṣe `site/index.html`

Fi àwọn òtítọ́ rẹ gan-an, àwọn hash, àti gbòǹgbò Merkle rọ́pò àwọn ààyè templeti.
Àwọn hash fún òtítọ́ kọ̀ọ̀kan tí a fi hàn gbọ́dọ̀ bá àwọn fáìlì òtítọ́ kọ̀ọ̀kan mu,
bí bẹ́ẹ̀ kọ́ ojú-ìwé náà yóò kùnà ìjẹ́rìí-ara-rẹ̀.

Fún òtítọ́ kọ̀ọ̀kan, dà ara fáìlì .txt sínú blọ́ọ̀kù `<div class="fact">`
kan kí o sì fi SHA-256 sí inú `<div class="hash">` tààrà ní ìsàlẹ̀ rẹ̀.
Gbòǹgbò Merkle náà ń lọ sí inú apá èdìdì-ìṣirò-ìkọ̀kọ̀.

(Bẹ́ẹ̀ni, èyí lè jẹ́ ohun tí a ṣe ní àdáṣe. Kò sì jẹ́ bẹ́ẹ̀, ní ìmọ̀ọ́mọ̀: ìgbésẹ̀
ọwọ́ ni ìgbésẹ̀ àyẹ̀wò ènìyàn. Ìlànà náà kò dáàbò bò ọ́ kúrò nínú títẹ ohun
jáde tí o kò kà.)

## 6. Jẹ́rìí nínú agbègbè

```bash
python3 build/verify.py
```

Àbáyọrí tí a retí:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" náà jẹ́ déédéé — kalẹ́ńdà OTS yóò gbé ìjẹ́rìí náà sókè sí ìjẹ́rìí
Bitcoin pípé láàárín wákàtí díẹ̀.

## 7. Tu sílẹ̀

Yan ọ̀kan nínú àwọn wọ̀nyí:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → fa `site/` wọlé
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` nínú `site/`, ti pẹ̀ sí repo, mú Pages ṣiṣẹ́
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (pẹ̀lú ìgbàlejò àìmúlọ́)
- **VPS lásán èyíkéyìí**: `scp -r site/* user@host:/var/www/html/`

CID IPFS láti ìgbésẹ̀ 4 fún ọ ní URL àfikún tí a dá lórí àkóónú-àdírẹ́sì:
`https://<CID>.ipfs.dweb.link/`. Lò ó.

## 8. Gbé ìjẹ́rìí OTS sókè (lẹ́yìn náà)

Láàárín wákàtí díẹ̀ ti fífi èdìdì lù, ṣiṣẹ́:

```bash
ots upgrade build/merkle_root.txt.ots
```

Èyí yí ìjẹ́rìí pẹ̀lú-ìduró ti kalẹ́ńdà kọ̀ọ̀kan padà sí ìjẹ́rìí Bitcoin pípé
tí ó tọ́ka sí blọ́ọ̀kù pàtó kan. Tún tu fáìlì `.ots` sílẹ̀ sí àwọn olùgbàlejò
rẹ lẹ́yìn gbígbé e sókè.

## 9. Ìyẹn rèé

O ti tẹ àkójọ kékeré ti àwọn òtítọ́ jáde lọ́nà tí ẹnikẹ́ni mìíràn lè:

- Mú gbogbo àwọn òtítọ́ nípasẹ̀ HTTP lásán láti ọ̀dọ̀ olùgbàlejò rẹ
- Tún ṣe ìṣirò gbòǹgbò Merkle láti àwọn báìtì òtítọ́
- Fi wé gbòǹgbò tí o ti tẹ jáde
- Jẹ́rìí pé a fi gbòǹgbò náà sí Bitcoin ní àkókò tí OTS fi èdìdì lù
- Lọ́nà-ọ̀tọ̀ọ̀tọ̀ mú àwọn òtítọ́ kannáà nípasẹ̀ IPFS ní CID tí a tẹ jáde
- Fìdí rẹ̀ múlẹ̀ pé gbogbo hash bá ara wọn mu

Bí ọ̀kan nínú àwọn ìgbésẹ̀ wọ̀nyẹn bá kùnà, ìfọwọ́sí ti ṣẹlẹ̀. Oníkàwé náà kò ní láti
gbẹ́kẹ̀lé ọ. Wọn nìkan ní láti ṣe ìṣirò náà.
