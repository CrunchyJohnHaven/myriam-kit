*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

# Kit di Riproducibilità Scientifica

Un esempio myriam-kit chiavi in mano per gruppi di ricerca, riviste e
istituzioni focalizzate sulla riproducibilità che desiderano pubblicare,
accanto a un articolo o a un preprint, un manifesto di riproducibilità
ancorato a Bitcoin e a prova di manomissione (tamper-evident).

## Cosa produce questo kit

Una pubblicazione sigillata che contiene, per un singolo studio:

1. Identificazione dello studio (titolo dell'articolo, autori,
   istituzione, finanziatori, conflitti di interesse)
2. **SHA-256 dell'archivio dei dati grezzi** — il dataset canonico
3. **Hash della pipeline di analisi** — script + digest dell'immagine
   Docker + dipendenze fissate (pinned)
4. **Hash del bundle di output atteso** — ciò che un riproduttore
   fedele dovrebbe produrre
5. Protocollo di riproduzione + impegni di pubblicazione post-risultato
6. Principale firmatario (o principali firmatari)

Il sigillo è pensato per la fase **pre-analisi**: dati congelati,
pipeline finalizzata, output atteso calcolato, TUTTO prima che siano
visti risultati al fine di scrivere l'articolo.

## Contro cosa difende questo kit

**Modi di fallimento intercettati dal sigillo:**

- **p-hacking**: modifiche post-hoc all'analisi dopo aver visto i
  risultati sono rilevabili tramite diff tra il FACT 04 sigillato e
  la pipeline pubblicata.
- **HARKing** (Hypothesizing After Results are Known): l'ipotesi
  pre-registrata in FACT 02 è stabile a livello di byte.
- **Manipolazione dei dati post-articolo**: ricalcolare l'hash
  dell'archivio dati rispetto a FACT 03 rivela qualsiasi modifica.
- **Drift della pipeline**: ricalcolare l'hash della pipeline di
  analisi rispetto a FACT 04 intercetta modifiche silenziose.
- **Manipolazione della paternità (authorship gaming)**: aggiungere o
  rimuovere silenziosamente autori dopo la pubblicazione diventa
  rilevabile rispetto al FACT 02 sigillato.

**Modi di fallimento NON coperti:**

- Frode nella raccolta dei dati grezzi (il sigillo ancora i dati al
  momento della sigillatura, non della raccolta)
- Non-riproducibilità biologica / empirica (il sigillo ancora solo la
  riproducibilità computazionale)
- Problemi di dimensione del campione o di validità della popolazione
  (sono questioni di disegno dello studio)
- La verità della rivendicazione sottostante (il sigillo ancora ciò
  che è stato affermato, non se il mondo corrisponda all'affermazione)

## Quando usare questo kit

Considerate la sigillatura se:

- Siete un gruppo di ricerca che conduce un'analisi ad alto rischio
  (trial clinico, valutazione di un sistema di IA, studio di
  replicazione) e desiderate integrità forense oltre i time-stamp
  di OSF / GitHub
- Siete un ricercatore in fase iniziale di carriera che desidera una
  protezione reputazionale asimmetrica: una pre-analisi sigillata
  significa che future critiche del tipo "hanno fatto p-hacking"
  avranno un falsificatore pubblico
- Siete un editor di rivista o responsabile di un progetto di
  replicazione che desidera incoraggiare una pre-registrazione di
  livello crittografico per un sottoinsieme di articoli
- State lavorando a un'analisi in cui ritocchi post-hoc abbiano
  conseguenze significative sul campo (psicologia, economia
  comportamentale, ricerca medica)

## Precedente storico di mortalità / danno

La pertinenza in termini di mortalità di questo kit è indiretta:

- **Non-riproducibilità nella ricerca su cellule staminali / cancro:**
  diversi articoli hanno portato a danni per i pazienti tramite trial
  clinici mal indirizzati. Una pre-registrazione sigillata della
  pipeline originale avrebbe ancorato il confronto.
- **Controversia sull'efficacia del Tamiflu:** la revisione Cochrane
  richiese anni in parte perché l'accesso ai dati grezzi era
  contestato. Hash dei dati sigillati al momento della pubblicazione
  avrebbero reso le dispute sull'accesso ai dati immediatamente
  risolvibili.
- **Crisi generale di non-riproducibilità:** il costo in termini di
  mortalità a livello di campo della ricerca biomedica non
  riproducibile è significativo (Begley & Ellis 2012 hanno stimato
  che oltre il 50% delle scoperte precliniche è non riproducibile).
  L'ancoraggio crittografico è una leva strutturale.

## Come fare un fork di questo kit

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICO: fatelo PRIMA di vedere qualsiasi risultato
shasum -a 256 raw_data_v0.tar.gz       # calcola l'hash canonico dei dati
shasum -a 256 analysis.py              # esegui l'hash della pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # popolate con valori reali
bash build/seal.sh                     # sigillate PRIMA di eseguire l'analisi
python3 build/verify.py                # confermate

# Ora eseguite l'analisi. Calcolate l'hash dell'output e confermate che corrisponda a FACT 05.
# Se non corrisponde, la pipeline non è deterministica; correggete e ri-sigillate.
```

## Integrazione con l'infrastruttura accademica esistente

- **arXiv / bioRxiv / medRxiv**: includere l'URL del sigillo MYRIAM o
  il CID IPFS nell'abstract o nei materiali supplementari
- **OSF**: allegare l'artefatto del sigillo al progetto OSF accanto
  al modulo convenzionale di pre-registrazione
- **AsPredicted**: includere l'URL del sigillo MYRIAM nel documento
  di pre-registrazione
- **GitHub**: l'hash del commit della pipeline di analisi è ciò che
  FACT 04 ancora; GitHub fornisce il sorgente, MYRIAM ancora i byte
- **Zenodo / Figshare / OpenAIRE**: depositate i dati grezzi, quindi
  sigillate l'hash del deposito; il sigillo è forensicamente più
  difficile da sostituire silenziosamente rispetto ai metadati del
  deposito
- **Materiali supplementari della rivista**: includere l'artefatto
  del sigillo MYRIAM come file supplementare al momento della
  sottomissione

## Cosa questo kit NON sostituisce

- Approvazione di IRB / comitato etico
- Revisione tra pari
- Studi di replicazione (riproducibilità computazionale ≠
  riproducibilità empirica)
- Accordi di accesso ai dati per dati sensibili

## Una nota sull'ordine degli autori e sul credito

Il sigillo ancora la LISTA DEGLI AUTORI al momento della sigillatura.
Le dispute sulla paternità che insorgono post-pubblicazione possono
essere valutate rispetto alla lista sigillata. Si tratta di una piccola
leva di responsabilità — importante per i ricercatori in fase iniziale
di carriera che vengono aggiunti o rimossi silenziosamente.

## Licenza

Dominio pubblico (CC0). Usatelo, modificatelo, ignoratelo, fatene un
fork.
