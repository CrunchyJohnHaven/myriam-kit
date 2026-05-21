*Norsk oversettelse — for den engelske originalen, se [QUICKSTART.md](QUICKSTART.md)*

# Hurtigstart

Fem minutter fra klon til forseglet publisering. Testet på macOS; Linux burde
fungere; Windows-brukere trenger WSL.

## 0. Forutsetninger

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Sett opp skjelett

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Rediger fakta

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Hver fil er ett faktum. UTF-8. LF-linjeskift. Filnavnsmønsteret er
`NN_short_name.txt`, der NN er nullutfylt. De sorteres leksikografisk
inn i Merkle-treet, slik at 02 alltid kommer etter 01.

Tips: formulér hvert faktum som en *navngivnings- eller deklarasjonshendelse*,
ikke som en ontologisk påstand om verden. "Acme Corp har erklært at parti X
besto test Y" er verifiserbart. "Parti X er trygt" er det ikke.

## 3. Start IPFS-daemonen (én gang per maskin)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Forsegl

```bash
bash build/seal.sh
```

Dette vil:
1. Hashe hvert faktum (SHA-256), beregne Merkle-roten i Bitcoin-stil.
2. Stemple roten med OpenTimestamps via to uavhengige kalendere
   (alice + finney som standard — overstyr via `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Feste `site/`-katalogen til IPFS og skrive ut CID-en.

Totalt: ~10 sekunder med en varm IPFS-daemon.

## 5. Rediger `site/index.html`

Bytt ut plassholderne i malen med dine faktiske fakta, hasher og
Merkle-rot. De viste hashene per faktum må matche faktum-filene,
ellers feiler siden sin egen selvverifisering.

For hvert faktum, kopier innholdet i .txt-filen inn i en `<div class="fact">`-blokk
og legg SHA-256 i en `<div class="hash">` rett under. Merkle-roten plasseres
i seksjonen for den kryptografiske forseglingen.

(Ja, dette kunne vært autogenerert. Det er ikke det, med vilje: det
manuelle trinnet er det menneskelige gjennomgangstrinnet. Protokollen beskytter
ikke mot å publisere noe du ikke har lest.)

## 6. Verifiser lokalt

```bash
python3 build/verify.py
```

Forventet utdata:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" er normalt — OTS-kalenderen vil oppgradere attestasjonen
til en fullstendig Bitcoin-attestasjon innen noen få timer.

## 7. Utrull

Velg en av følgende:

- **Cloudflare Pages**: dashbord → Pages → Direct upload → dra `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` i `site/`, push til repo, aktiver Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (statisk hosting på)
- **Hvilken som helst vanlig VPS**: `scp -r site/* user@host:/var/www/html/`

IPFS-CID-en fra trinn 4 gir deg en ekstra innholdsadressert
URL: `https://<CID>.ipfs.dweb.link/`. Bruk den.

## 8. Oppgrader OTS-kvitteringen (senere)

Innen ~noen timer etter forseglingen, kjør:

```bash
ots upgrade build/merkle_root.txt.ots
```

Dette konverterer hver kalenders ventende attestasjon til en fullstendig
Bitcoin-attestasjon som refererer til en spesifikk blokk. Utrull `.ots`-filen
på nytt til vertene dine etter oppgraderingen.

## 9. Det var det

Du har publisert et lite sett med fakta på en måte som hvilken som helst
tredjepart kan:

- Hente alle fakta via vanlig HTTP fra verten din
- Beregne Merkle-roten på nytt fra faktum-bytene
- Sammenligne med din publiserte rot
- Verifisere at roten ble forpliktet til Bitcoin på det OTS-stemplede tidspunktet
- Uavhengig hente de samme faktaene via IPFS ved den publiserte CID-en
- Bekrefte at alle hasher samsvarer

Hvis noen av disse trinnene feiler, har tukling skjedd. Leseren trenger ikke
å stole på deg. De trenger bare å regne ut matematikken.
