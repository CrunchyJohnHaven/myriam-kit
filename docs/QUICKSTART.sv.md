*Svensk översättning — för den ursprungliga engelska versionen, se [QUICKSTART.md](QUICKSTART.md)*

# Snabbstart

Fem minuter från klon till förseglad publicering. Testat på macOS; Linux bör
fungera; Windows-användare behöver WSL.

## 0. Förutsättningar

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Skapa skelett

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Redigera fakta

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Varje fil är ett faktum. UTF-8. LF-radslut. Filnamnsmönstret är
`NN_short_name.txt` där NN är nollutfyllt. De sorteras lexikografiskt
in i Merkle-trädet, så 02 kommer alltid efter 01.

Tips: formulera varje faktum som en *namngivnings- eller deklarationshändelse*,
inte som en ontologisk utsaga om världen. "Acme Corp har förklarat att parti X
klarade test Y" är verifierbart. "Parti X är säkert" är det inte.

## 3. Starta IPFS-daemonen (en gång per maskin)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Försegla

```bash
bash build/seal.sh
```

Detta kommer att:
1. Hasha varje faktum (SHA-256), beräkna Merkle-roten i Bitcoin-stil.
2. Stämpla roten med OpenTimestamps via två oberoende kalendrar
   (alice + finney som standard — åsidosätt via `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Fästa katalogen `site/` på IPFS och skriva ut CID:t.

Totalt: ~10 sekunder med en varm IPFS-daemon.

## 5. Redigera `site/index.html`

Byt ut platshållarna i mallen mot dina faktiska fakta, hashar och
Merkle-rot. De visade hasharna per faktum måste matcha faktumfilerna,
annars misslyckas sidans egen självverifiering.

För varje faktum, kopiera innehållet i .txt-filen till ett `<div class="fact">`-block
och lägg SHA-256-värdet i ett `<div class="hash">` direkt under det.
Merkle-roten placeras i avsnittet med den kryptografiska förseglingen.

(Ja, detta skulle kunna autogenereras. Det görs inte, avsiktligt: det
manuella steget är det mänskliga granskningssteget. Protokollet skyddar
inte mot att du publicerar något du inte har läst.)

## 6. Verifiera lokalt

```bash
python3 build/verify.py
```

Förväntad utdata:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" är normalt — OTS-kalendern kommer att uppgradera attesteringen
till en fullständig Bitcoin-attestering inom några timmar.

## 7. Driftsätt

Välj något av följande:

- **Cloudflare Pages**: panel → Pages → Direct upload → dra `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` i `site/`, pusha till repo, aktivera Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (statisk hosting aktiv)
- **Vilken vanlig VPS som helst**: `scp -r site/* user@host:/var/www/html/`

IPFS-CID:t från steg 4 ger dig en ytterligare innehållsadresserad
URL: `https://<CID>.ipfs.dweb.link/`. Använd den.

## 8. Uppgradera OTS-kvittot (senare)

Inom ~några timmar efter förseglingen, kör:

```bash
ots upgrade build/merkle_root.txt.ots
```

Detta omvandlar varje kalenders väntande attestering till en fullständig
Bitcoin-attestering som refererar till ett specifikt block. Driftsätt om
`.ots`-filen till dina värdar efter uppgraderingen.

## 9. Klart

Du har publicerat en liten mängd fakta på ett sätt som vilken tredje part som helst kan:

- Hämta alla fakta via vanlig HTTP från din värd
- Räkna om Merkle-roten från faktum-byten
- Jämföra mot din publicerade rot
- Verifiera att roten åtagits till Bitcoin vid den OTS-stämplade tidpunkten
- Oberoende hämta samma fakta via IPFS vid det publicerade CID:t
- Bekräfta att alla hashar matchar

Om något av dessa steg misslyckas har manipulering förekommit. Läsaren
behöver inte lita på dig. De behöver bara räkna matematiken.
