*Traduzione italiana — per la versione originale in inglese, vedi [QUICKSTART.md](QUICKSTART.md)*

# Avvio rapido

Cinque minuti dal clone alla pubblicazione sigillata. Testato su macOS; dovrebbe
funzionare su Linux; gli utenti Windows avranno bisogno di WSL.

## 0. Prerequisiti

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Impalcatura

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Modificare i fatti

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Ogni file è un fatto. UTF-8. Fine riga LF. Lo schema del nome del file è
`NN_short_name.txt` dove NN ha lo zero iniziale. I file sono ordinati
lessicograficamente nell'albero di Merkle, quindi 02 viene sempre dopo 01.

Suggerimento: formulate ogni fatto come un *evento di denominazione o di
dichiarazione*, non come un'affermazione ontologica sul mondo. "Acme Corp ha
dichiarato che il lotto X ha superato il test Y" è verificabile. "Il lotto X è
sicuro" non lo è.

## 3. Avviare il daemon IPFS (una sola volta per macchina)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Sigillare

```bash
bash build/seal.sh
```

Lo script:
1. Calcola l'hash di ciascun fatto (SHA-256) e la radice di Merkle in stile Bitcoin.
2. Marca temporalmente la radice tramite OpenTimestamps utilizzando due calendari
   indipendenti (alice + finney come predefiniti — sovrascrivibili tramite
   `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Fissa la directory `site/` su IPFS e stampa il CID.

Totale: ~10 secondi con un daemon IPFS già attivo.

## 5. Modificare `site/index.html`

Sostituite i segnaposto del template con i vostri fatti effettivi, gli hash e
la radice di Merkle. Gli hash per fatto visualizzati devono corrispondere ai
file dei singoli fatti, altrimenti la pagina fallisce la propria
autoverifica.

Per ciascun fatto, copiate il corpo del file .txt in un blocco
`<div class="fact">` e inserite il SHA-256 in un `<div class="hash">`
direttamente sotto di esso. La radice di Merkle va nella sezione del sigillo
crittografico.

(Sì, questo potrebbe essere generato automaticamente. Non lo è, deliberatamente:
il passaggio manuale è il passaggio di revisione umana. Il protocollo non vi
protegge dalla pubblicazione di qualcosa che non avete letto.)

## 6. Verificare in locale

```bash
python3 build/verify.py
```

Output atteso:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

Il "Pending" è normale — il calendario OTS aggiornerà l'attestazione
trasformandola in un'attestazione Bitcoin completa entro poche ore.

## 7. Distribuire

Scegliete una delle opzioni seguenti:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → trascinate `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` in `site/`, push verso il repo, attivate Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (hosting statico attivo)
- **Qualsiasi VPS semplice**: `scp -r site/* user@host:/var/www/html/`

Il CID IPFS del passaggio 4 vi fornisce un URL aggiuntivo indirizzato per
contenuto: `https://<CID>.ipfs.dweb.link/`. Usatelo.

## 8. Aggiornare la ricevuta OTS (in seguito)

Entro circa qualche ora dalla sigillatura, eseguite:

```bash
ots upgrade build/merkle_root.txt.ots
```

Questo converte l'attestazione in attesa di ciascun calendario in
un'attestazione Bitcoin completa che fa riferimento a un blocco specifico.
Ridistribuite il file `.ots` ai vostri host dopo l'aggiornamento.

## 9. Tutto qui

Avete pubblicato un piccolo insieme di fatti in un modo che permette a
qualsiasi terza parte di:

- Recuperare tutti i fatti via HTTP semplice dal vostro host
- Ricalcolare la radice di Merkle dai byte dei fatti
- Confrontarla con la vostra radice pubblicata
- Verificare che la radice sia stata impegnata su Bitcoin al momento marcato da OTS
- Recuperare in modo indipendente gli stessi fatti via IPFS al CID pubblicato
- Confermare che tutti gli hash corrispondano

Se uno qualsiasi di questi passaggi fallisce, è avvenuta una manomissione. Il
lettore non deve fidarsi di voi. Deve solo fare i calcoli.
