*Český překlad — pro původní anglickou verzi viz [QUICKSTART.md](QUICKSTART.md)*

# Rychlý start

Pět minut od klonu k zapečetěné publikaci. Otestováno na macOS; Linux by
měl fungovat; uživatelé Windows budou potřebovat WSL.

## 0. Předpoklady

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Inicializace kostry

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Úprava faktů

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Každý soubor je jeden fakt. UTF-8. Konce řádků LF. Vzor názvu souboru je
`NN_short_name.txt`, kde NN je index doplněný nulami. Soubory jsou
lexikograficky seřazeny do Merkleho stromu, takže 02 vždy následuje za 01.

Tip: každý fakt formulujte jako *událost pojmenování nebo deklarace*,
nikoli jako ontologické tvrzení o světě. „Acme Corp prohlásila, že šarže X
prošla testem Y“ je ověřitelné. „Šarže X je bezpečná“ není.

## 3. Spuštění démona IPFS (jednorázově na stroji)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Zapečetění

```bash
bash build/seal.sh
```

Tento příkaz:
1. Zhashuje každý fakt (SHA-256) a vypočte kořen Merkleho stromu ve stylu Bitcoin.
2. Orazítkuje kořen pomocí OpenTimestamps přes dva nezávislé kalendáře
   (alice + finney ve výchozím nastavení — lze přepsat pomocí `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Připne adresář `site/` do IPFS a vypíše CID.

Celkem: ~10 sekund s rozehřátým démonem IPFS.

## 5. Úprava `site/index.html`

Nahraďte zástupné symboly šablony skutečnými fakty, hashi a kořenem
Merkleho stromu. Zobrazené hashe jednotlivých faktů se musí shodovat se
soubory faktů, jinak stránka neprojde vlastní samoověřením.

Pro každý fakt zkopírujte tělo souboru .txt do bloku `<div class="fact">`
a vložte SHA-256 do `<div class="hash">` přímo pod ním. Kořen Merkleho
stromu jde do sekce kryptografické pečeti.

(Ano, toto by se dalo vygenerovat automaticky. Záměrně se to nedělá:
manuální krok je krokem lidské revize. Protokol nechrání před
publikováním něčeho, co jste si nepřečetli.)

## 6. Lokální ověření

```bash
python3 build/verify.py
```

Očekávaný výstup:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

„Pending“ je normální — kalendář OTS během několika hodin povýší
atestaci na plnou atestaci Bitcoin.

## 7. Nasazení

Vyberte si jakoukoli z možností:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → přetáhněte `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` v `site/`, push do repozitáře, povolte Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (se zapnutým statickým hostingem)
- **Jakýkoli běžný VPS**: `scp -r site/* user@host:/var/www/html/`

CID z IPFS z kroku 4 vám dává další URL adresovanou obsahem:
`https://<CID>.ipfs.dweb.link/`. Použijte ji.

## 8. Povýšení potvrzenky OTS (později)

Během ~několika hodin po zapečetění spusťte:

```bash
ots upgrade build/merkle_root.txt.ots
```

To převede čekající atestaci každého kalendáře na plnou atestaci Bitcoin,
která odkazuje na konkrétní blok. Po povýšení znovu nasaďte soubor `.ots`
na své hostingy.

## 9. To je vše

Publikovali jste malou sadu faktů takovým způsobem, že libovolná třetí
strana může:

- Stáhnout všechny fakty přes obyčejné HTTP z vašeho hostingu
- Přepočítat kořen Merkleho stromu z bajtů faktů
- Porovnat ho s vaším publikovaným kořenem
- Ověřit, že kořen byl zakotven v Bitcoinu v čase razítkovaném OTS
- Nezávisle stáhnout tytéž fakty přes IPFS pod publikovaným CID
- Potvrdit, že všechny hashe odpovídají

Pokud kterýkoli z těchto kroků selže, došlo k manipulaci. Čtenář vám
nemusí důvěřovat. Stačí mu spočítat matematiku.
