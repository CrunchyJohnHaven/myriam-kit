# Farawa cikin sauri

*Fassara zuwa Hausa — don ainihin sigar Turanci, duba [QUICKSTART.md](QUICKSTART.md)*

Mintuna biyar daga clone zuwa bugawa da aka rufe. An gwada a kan macOS;
Linux ya kamata ya yi aiki; masu amfani da Windows za su buƙaci WSL.

## 0. Abubuwan da ake buƙata a baya

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Kafa tsari

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Gyara gaskiya

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Kowane fayil shi ne gaskiya guda ɗaya. UTF-8. Ƙarshen layi na LF. Tsarin
sunan fayil shi ne `NN_short_name.txt` inda NN yake da sifili a gaba.
Ana shirya su a tsarin haruffa cikin itacen Merkle, don haka 02 koyaushe
yana zuwa bayan 01.

Shawara: bayyana kowace gaskiya a matsayin *al'amarin suna ko sanarwa*,
ba a matsayin da'awa ta ontology game da duniya ba. "Acme Corp ta sanar
da cewa batch X ya wuce gwajin Y" ana iya tabbatar da shi. "Batch X yana
da aminci" ba ya.

## 3. Fara daemon na IPFS (sau ɗaya a kowace na'ura)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Rufe

```bash
bash build/seal.sh
```

Wannan zai:
1. Hash kowace gaskiya (SHA-256), lissafa tushen Merkle ta salon Bitcoin.
2. Sa hatimi a kan tushen tare da OpenTimestamps ta hanyar kalandodi biyu
   masu zaman kansu (alice + finney ta tsohuwa — sauya ta hanyar
   `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Pin directory na `site/` zuwa IPFS kuma buga CID.

Jimillar: kusan dakika 10 da daemon na IPFS mai zafi.

## 5. Gyara `site/index.html`

Maye gurbin wuraren riƙe na samfuri da ainihin gaskiyarka, hashes, da
tushen Merkle. Hashes na kowace gaskiya da aka nuna dole ne su yi
daidai da fayilolin kowace gaskiya, in ba haka ba shafin ya kasa
tabbatar da kansa.

Don kowace gaskiya, kwafa jikin fayil ɗin .txt cikin shingen
`<div class="fact">` kuma sanya SHA-256 a cikin `<div class="hash">`
kai tsaye a ƙarƙashinsa. Tushen Merkle yana shiga sashin hatimin
cryptographic.

(I, ana iya samar da wannan ta atomatik. Ba a yi shi haka ba da gangan:
matakin hannu shi ne matakin sake nazari na ɗan adam. Tsarin ba ya kare
daga buga abin da ba ka karanta ba.)

## 6. Tabbatar a gida

```bash
python3 build/verify.py
```

Sakamakon da ake tsammani:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" al'ada ne — kalandar OTS za ta haɓaka shaidar zuwa cikakkiyar
shaidar Bitcoin a cikin sa'o'i kaɗan.

## 7. Tura

Zaɓi kowane daga cikin:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → ja `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` a cikin `site/`, tura zuwa repo, kunna Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting on)
- **Kowane VPS mai sauƙi**: `scp -r site/* user@host:/var/www/html/`

CID na IPFS daga mataki na 4 yana ba ka ƙarin URL da aka adireshi ta
abun ciki: `https://<CID>.ipfs.dweb.link/`. Yi amfani da shi.

## 8. Haɓaka shaidar OTS (daga baya)

A cikin kusan sa'o'i kaɗan na rufewa, gudanar da:

```bash
ots upgrade build/merkle_root.txt.ots
```

Wannan yana mayar da shaidar kowace kalandar da ke jiran zuwa cikakkiyar
shaidar Bitcoin da ke nuni ga takamaiman block. Sake tura fayil ɗin
`.ots` zuwa rundunanka bayan haɓakawa.

## 9. Shi ke nan

Ka buga ƙaramin tarin gaskiya ta yadda kowane ɓangare na uku zai iya:

- Ɗauko duk gaskiya ta hanyar HTTP mai sauƙi daga rundunarka
- Sake lissafa tushen Merkle daga bytes na gaskiya
- Kwatanta da tushen da ka buga
- Tabbatar an ƙaddamar da tushen zuwa Bitcoin a lokacin da OTS ya yi hatimi
- Da kansa ɗauko gaskiya iri ɗaya ta IPFS a CID da aka buga
- Tabbatar da cewa duk hashes sun yi daidai

Idan kowane daga cikin waɗannan matakai ya kasa, an yi tampering. Mai
karatu ba lallai ya amince da kai ba. Kawai sai ya yi lissafin.
