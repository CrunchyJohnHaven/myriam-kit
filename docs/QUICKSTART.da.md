*Dansk oversættelse — for den originale engelske version, se [QUICKSTART.md](QUICKSTART.md)*

# Hurtig start

Fem minutter fra klon til forseglet offentliggørelse. Testet på macOS; Linux
burde fungere; Windows-brugere skal bruge WSL.

## 0. Forudsætninger

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Skab skelet

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Rediger kendsgerninger

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Hver fil er én kendsgerning. UTF-8. LF-linjeskift. Filnavnemønstret er
`NN_short_name.txt`, hvor NN er nul-udfyldt. De sorteres leksikografisk
ind i Merkle-træet, så 02 kommer altid efter 01.

Tip: formulér hver kendsgerning som en *navngivnings- eller deklarationshændelse*,
ikke som et ontologisk krav om verden. "Acme Corp har erklæret, at parti X
bestod test Y" kan verificeres. "Parti X er sikkert" kan ikke.

## 3. Start IPFS-dæmonen (én gang per maskine)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Forsegl

```bash
bash build/seal.sh
```

Dette vil:
1. Hashe hver kendsgerning (SHA-256), beregne Merkle-roden i Bitcoin-stil.
2. Stemple roden med OpenTimestamps via to uafhængige kalendere
   (alice + finney som standard — tilsidesæt via `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Fastgøre `site/`-mappen til IPFS og udskrive CID'et.

I alt: ~10 sekunder med en varm IPFS-dæmon.

## 5. Rediger `site/index.html`

Erstat skabelonens pladsholdere med dine faktiske kendsgerninger, hashes og
Merkle-rod. De viste hashes pr. kendsgerning skal matche kendsgerningsfilerne,
ellers fejler siden sin egen selv-verifikation.

For hver kendsgerning, kopiér indholdet af .txt-filen ind i en `<div class="fact">`-blok
og placér SHA-256-værdien i en `<div class="hash">` direkte under den.
Merkle-roden skal i afsnittet med den kryptografiske forsegling.

(Ja, dette kunne autogenereres. Det er det ikke, bevidst: det
manuelle trin er det menneskelige gennemsynstrin. Protokollen beskytter
ikke mod, at du offentliggør noget, du ikke har læst.)

## 6. Verificér lokalt

```bash
python3 build/verify.py
```

Forventet output:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" er normalt — OTS-kalenderen vil opgradere attestationen
til en fuld Bitcoin-attestation inden for et par timer.

## 7. Udrul

Vælg en af følgende:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → træk `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` i `site/`, push til repo, aktivér Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (statisk hosting tændt)
- **En hvilken som helst almindelig VPS**: `scp -r site/* user@host:/var/www/html/`

IPFS-CID'et fra trin 4 giver dig en yderligere indholdsadresseret
URL: `https://<CID>.ipfs.dweb.link/`. Brug den.

## 8. Opgradér OTS-kvitteringen (senere)

Inden for ~få timer efter forseglingen, kør:

```bash
ots upgrade build/merkle_root.txt.ots
```

Dette konverterer hver kalenders afventende attestation til en fuld
Bitcoin-attestation, der refererer til en specifik blok. Genudrul `.ots`-filen
til dine værter efter opgraderingen.

## 9. Det er det

Du har offentliggjort et lille sæt af kendsgerninger på en måde, som enhver tredjepart kan:

- Hente alle kendsgerninger via almindelig HTTP fra din vært
- Genberegne Merkle-roden ud fra kendsgerningernes bytes
- Sammenligne med din offentliggjorte rod
- Verificere, at roden blev forpligtet til Bitcoin på det OTS-stemplede tidspunkt
- Uafhængigt hente de samme kendsgerninger via IPFS ved det offentliggjorte CID
- Bekræfte, at alle hashes matcher

Hvis nogen af disse trin fejler, er der sket manipulation. Læseren behøver
ikke at stole på dig. De skal bare regne matematikken efter.
