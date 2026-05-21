# Quickstart

*Ntụgharị Igbo — maka mbipụta Bekee mbụ, lee [QUICKSTART.md](QUICKSTART.md)*

Nkeji ise site na clone ruo mbipụta a kpọchiri akpọchi. A nwalere ya na macOS;
Linux kwesịrị ịrụ ọrụ; ndị ọrụ Windows ga-achọ WSL.

## 0. Ihe ndị achọrọ tupu mmalite

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Wuo ntọala

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Dezie eziokwu ndị ahụ

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Faịlụ ọ bụla bụ otu eziokwu. UTF-8. Njedebe ahịrị LF. Usoro aha faịlụ bụ
`NN_short_name.txt` ebe NN bụ ọnụọgụgụ abụọ jupụtara na efu. A na-ahazi ha
n'usoro mkpụrụ-okwu n'ime osisi Merkle, ya mere 02 na-eso 01 mgbe niile.

Ndụmọdụ: kọwaa eziokwu ọ bụla dị ka *ihe omume ịkpọ aha ma ọ bụ nkwupụta*,
ọ bụghị dị ka nkwupụta ontological banyere ụwa. "Acme Corp ekwupụtala na
batch X gafere nnwale Y" bụ ihe a pụrụ ịkwado. "Batch X dị nchebe" abụghị.

## 3. Bido ụlọọrụ IPFS (otu mgbe maka igwe ọ bụla)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Kpọchie ya

```bash
bash build/seal.sh
```

Nke a ga-eme:
1. Hash eziokwu ọ bụla (SHA-256), gbakọọ mgbọrọgwụ Merkle ụdị Bitcoin.
2. Tinye akara oge na mgbọrọgwụ ahụ site na OpenTimestamps site na kalenda
   abụọ na-emeghị nke ọ bụla (alice + finney site na ndabara — gbanwee site na
   `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Mara ndekọ aha `site/` na IPFS ma bipụta CID ahụ.

Mkpokọta: ihe dị ka sekọnd 10 site na ụlọọrụ IPFS na-ekpo ọkụ.

## 5. Dezie `site/index.html`

Dochie ihe ndị nnọchianya nke ụkpụrụ ahụ na ezigbo eziokwu gị, hash gị, na
mgbọrọgwụ Merkle gị. Hash kwa-eziokwu ndị a na-egosipụta aghaghị idakọrịta
faịlụ kwa-eziokwu, ma ọ bụghị otu a, ibe ahụ ga-ada nkwado nke ya.

Maka eziokwu ọ bụla, detuo ahụ nke faịlụ .txt n'ime ngọngọ `<div class="fact">`
ma tinye SHA-256 ahụ n'ime `<div class="hash">` ozugbo n'okpuru ya. Mgbọrọgwụ
Merkle ahụ na-aga na ngalaba mkpọchi cryptographic.

(Ee, a pụrụ ime nke a na-akpaghị aka. Anaghị eme ya, n'amaghị ama: nzọụkwụ
aka bụ nzọụkwụ nyocha mmadụ. Usoro ahụ anaghị echebe megide ibipụta ihe ị
na-agụghị.)

## 6. Kwado n'ógbè

```bash
python3 build/verify.py
```

Mmepụta a tụrụ anya ya:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" ahụ bụ ihe nkịtị — kalenda OTS ga-ebuli akwụkwọ ọtụtụ ahụ ka ọ ghọọ
akwụkwọ ọtụtụ Bitcoin zuru oke n'ime awa ole na ole.

## 7. Bupụ ya

Họrọ otu n'ime ndị a:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → drag `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` n'ime `site/`, kwadata na repo, kwado Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting on)
- **Ọ bụla VPS dị mfe**: `scp -r site/* user@host:/var/www/html/`

CID IPFS site na nzọụkwụ 4 na-enye gị URL ọzọ a na-eduzi site n'ọdịnaya:
`https://<CID>.ipfs.dweb.link/`. Jiri ya.

## 8. Bulite akwụkwọ nnata OTS (emechaa)

N'ime awa ole na ole nke mkpọchi, gbaa:

```bash
ots upgrade build/merkle_root.txt.ots
```

Nke a na-atụgharị akwụkwọ ọtụtụ na-eche nke kalenda ọ bụla ka ọ ghọọ akwụkwọ
ọtụtụ Bitcoin zuru oke nke na-ezo aka na ngọngọ kpọmkwem. Buputa faịlụ `.ots`
ahụ ọzọ na ndị nnabata gị mgbe ị bulisịrị ya.

## 9. Ọ bụ ya

Ị bipụtala obere ihe eziokwu n'ụzọ ndị ọzọ ọ bụla nwere ike ime:

- Weghachite eziokwu niile site na HTTP nkịtị site na onye nnabata gị
- Gbakọọzie mgbọrọgwụ Merkle site na bytes eziokwu
- Tụnyere ya na mgbọrọgwụ gị bipụtara
- Kwadoo na e tinyere mgbọrọgwụ ahụ na Bitcoin n'oge a kara akara OTS
- Weghachite n'onwe ya otu eziokwu ndị ahụ site na IPFS na CID e bipụtara
- Kwadoo na hash niile na-adakọrịta

Ọ bụrụ na otu n'ime nzọụkwụ ndị a ada, e meela ihe nbibi. Onye na-agụ
agaghị atụkwasị gị obi. Naanị ha kwesịrị ime mgbakọ na mwepụ.
