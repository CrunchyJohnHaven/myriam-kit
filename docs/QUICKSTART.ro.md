*Traducere română — pentru versiunea originală în engleză, vezi [QUICKSTART.md](QUICKSTART.md)*

# Pornire rapidă

Cinci minute de la clonare la publicare sigilată. Testat pe macOS; ar trebui
să funcționeze pe Linux; utilizatorii Windows vor avea nevoie de WSL.

## 0. Cerințe prealabile

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Schelet

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Editați faptele

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Fiecare fișier este un singur fapt. UTF-8. Sfârșituri de linie LF. Tiparul
numelui de fișier este `NN_short_name.txt`, unde NN este completat cu zerouri.
Fișierele sunt sortate lexicografic în arborele Merkle, deci 02 vine întotdeauna
după 01.

Sfat: formulați fiecare fapt ca un *eveniment de denumire sau declarație*, nu
ca o afirmație ontologică despre lume. „Acme Corp a declarat că lotul X a
trecut testul Y” este verificabil. „Lotul X este sigur” nu este.

## 3. Porniți daemon-ul IPFS (o singură dată per mașină)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Sigilare

```bash
bash build/seal.sh
```

Aceasta va:
1. Calcula hash-ul (SHA-256) fiecărui fapt, calcula rădăcina Merkle în stil Bitcoin.
2. Ștampila rădăcina cu OpenTimestamps prin două calendare independente
   (alice + finney în mod implicit — suprascrieți prin `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Fixa directorul `site/` în IPFS și afișa CID-ul.

Total: ~10 secunde cu un daemon IPFS deja pornit.

## 5. Editați `site/index.html`

Înlocuiți marcajele de loc din șablon cu faptele, hash-urile și rădăcina Merkle
reale. Hash-urile per-fapt afișate trebuie să se potrivească cu fișierele per-fapt,
altfel pagina eșuează propria auto-verificare.

Pentru fiecare fapt, copiați corpul fișierului .txt într-un bloc
`<div class="fact">` și puneți SHA-256-ul într-un `<div class="hash">` direct
sub el. Rădăcina Merkle merge în secțiunea sigiliului criptografic.

(Da, acest lucru ar putea fi generat automat. Nu este, în mod deliberat: pasul
manual este pasul de revizuire umană. Protocolul nu protejează împotriva
publicării a ceva ce nu ați citit.)

## 6. Verificare locală

```bash
python3 build/verify.py
```

Ieșire așteptată:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

Mesajul „Pending” este normal — calendarul OTS va promova atestarea la o
atestare Bitcoin completă în câteva ore.

## 7. Implementare

Alegeți oricare:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → trageți `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` în `site/`, faceți push către repo, activați Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (cu hosting static activ)
- **Orice VPS simplu**: `scp -r site/* user@host:/var/www/html/`

CID-ul IPFS de la pasul 4 vă oferă un URL suplimentar adresat prin conținut:
`https://<CID>.ipfs.dweb.link/`. Folosiți-l.

## 8. Promovați chitanța OTS (mai târziu)

În ~câteva ore de la sigilare, rulați:

```bash
ots upgrade build/merkle_root.txt.ots
```

Aceasta convertește atestarea în așteptare a fiecărui calendar într-o atestare
Bitcoin completă care face referire la un bloc specific. Reimplementați fișierul
`.ots` pe gazdele voastre după promovare.

## 9. Asta e tot

Ați publicat un set restrâns de fapte într-un mod în care orice terță parte poate:

- Prelua toate faptele prin HTTP simplu de la gazda voastră
- Recalcula rădăcina Merkle din octeții faptelor
- Compara cu rădăcina voastră publicată
- Verifica faptul că rădăcina a fost confirmată în Bitcoin la momentul ștampilat de OTS
- Prelua independent aceleași fapte prin IPFS la CID-ul publicat
- Confirma faptul că toate hash-urile se potrivesc

Dacă oricare dintre acești pași eșuează, a avut loc o alterare. Cititorul nu
trebuie să aibă încredere în voi. Trebuie doar să facă matematica.
