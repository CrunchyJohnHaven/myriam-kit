*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [QUICKSTART.md](QUICKSTART.md)*

# Snelstart

Vijf minuten van klonen tot verzegelde publicatie. Getest op macOS; Linux zou moeten werken; Windows-gebruikers hebben WSL nodig.

## 0. Vereisten

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Stellage opzetten

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Feiten bewerken

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Elk bestand is één feit. UTF-8. LF-regeleinden. Het bestandsnaampatroon is
`NN_short_name.txt` waarbij NN met nullen is opgevuld. Ze worden lexicografisch
gesorteerd in de Merkle-boom, dus 02 komt altijd na 01.

Tip: formuleer elk feit als een *benoemings- of verklaringsgebeurtenis*, niet als een
ontologische bewering over de wereld. "Acme Corp heeft verklaard dat batch X
test Y heeft doorstaan" is verifieerbaar. "Batch X is veilig" niet.

## 3. Start de IPFS-daemon (eenmalig per machine)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Verzegelen

```bash
bash build/seal.sh
```

Dit doet het volgende:
1. Hasht elk feit (SHA-256), berekent de Bitcoin-stijl Merkle-wortel.
2. Stempelt de wortel met OpenTimestamps via twee onafhankelijke kalenders
   (standaard alice + finney — overschrijf via `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Pint de map `site/` aan IPFS en print de CID.

Totaal: ~10 seconden met een warme IPFS-daemon.

## 5. Bewerk `site/index.html`

Vervang de tijdelijke aanduidingen in de sjabloon door uw werkelijke feiten, hashes en
Merkle-wortel. De getoonde hashes per feit moeten overeenkomen met de bestanden per feit,
anders faalt de pagina haar eigen zelfverificatie.

Voor elk feit kopieert u de inhoud van het .txt-bestand in een blok
`<div class="fact">` en plaatst u de SHA-256 in een `<div class="hash">` direct eronder.
De Merkle-wortel komt in de sectie cryptografisch zegel.

(Ja, dit zou automatisch gegenereerd kunnen worden. Dat is bewust niet zo gedaan: de
handmatige stap is de menselijke beoordelingsstap. Het protocol beschermt niet
tegen het publiceren van iets dat u niet hebt gelezen.)

## 6. Lokaal verifiëren

```bash
python3 build/verify.py
```

Verwachte uitvoer:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

De "Pending" is normaal — de OTS-kalender zal de attestatie binnen
enkele uren upgraden naar een volledige Bitcoin-attestatie.

## 7. Uitrollen

Kies een van:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → sleep `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` in `site/`, push naar repo, schakel Pages in
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (statische hosting aan)
- **Elke gewone VPS**: `scp -r site/* user@host:/var/www/html/`

De IPFS-CID uit stap 4 geeft u een aanvullende inhoud-geadresseerde
URL: `https://<CID>.ipfs.dweb.link/`. Gebruik die.

## 8. Het OTS-bewijs upgraden (later)

Voer binnen ~enkele uren na verzegelen uit:

```bash
ots upgrade build/merkle_root.txt.ots
```

Dit converteert de pending attestatie van elke kalender naar een volledige
Bitcoin-attestatie die naar een specifiek blok verwijst. Rol het `.ots`-bestand na het
upgraden opnieuw uit naar uw hosts.

## 9. Klaar

U heeft een kleine verzameling feiten gepubliceerd op een manier waarop elke derde partij kan:

- Alle feiten ophalen via gewone HTTP vanaf uw host
- De Merkle-wortel herberekenen uit de feitbytes
- Vergelijken met uw gepubliceerde wortel
- Verifiëren dat de wortel was vastgelegd op Bitcoin op het OTS-gestempelde tijdstip
- Onafhankelijk dezelfde feiten ophalen via IPFS op de gepubliceerde CID
- Bevestigen dat alle hashes overeenkomen

Als een van deze stappen mislukt, is er sprake van manipulatie. De lezer hoeft
u niet te vertrouwen. Hij hoeft alleen de wiskunde te doen.
