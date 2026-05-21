# Kit di Blocco del Comportamento del Modello IA

*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

Un esempio chiavi in mano di myriam-kit per laboratori di IA (commerciali
o open source) che rilasciano un modello e desiderano che le dichiarazioni
del rilascio — identità dei pesi, capacità, punteggi di valutazione,
revisione di sicurezza, impegni pre-deployment — siano
**crittograficamente ancorate e pubblicamente verificabili**.

Il kit difende dalla specifica modalità di fallimento in cui i modelli
distribuiti silenziosamente derivano, i punteggi di valutazione vengono
modificati a posteriori, o gli impegni pre-deployment vengono contestati
anni dopo come "non l'abbiamo mai detto".

## Cosa produce questo kit

Un manifesto crittograficamente sigillato che, per un singolo rilascio
di modello, contiene:

1. Identificazione del modello (nome, architettura, numero di parametri,
   licenza)
2. **SHA-256 del file dei pesi** — l'hash canonico dell'artefatto
3. Testo della scheda modello (capacità, uso previsto, uso fuori
   scopo, modalità di fallimento note)
4. Risultati di valutazione al rilascio (valutazioni di capacità,
   valutazioni di sicurezza, calibrazione)
5. Impegni pre-deployment (le cose che vi impegnate a non cambiare
   silenziosamente dopo il rilascio)
6. Principale firmatario (l'essere umano + l'organizzazione che si
   assume la responsabilità)

Il sigillo rende ciascuno di questi elementi byte-stabile,
temporalmente ancorato a Bitcoin tramite OpenTimestamps, e recuperabile
via IPFS indipendentemente da qualunque singolo soggetto ospitante.

Vedete l'esempio fittizio elaborato: [facts/](facts/) e il rendering
[site/index.html](site/index.html). L'esempio utilizza un modello
fittizio ("Calm-mini-v0"); un rilascio reale sostituirebbe il
contenuto d'esempio.

## Da cosa difende questo kit

**Modalità di fallimento che il sigillo cattura direttamente:**

- **Manomissione dei pesi** — lo SHA-256 del file dei pesi rilasciato è
  in FACT 03. Qualunque alterazione post-rilascio dei byte che un
  utente scarica è rilevabile mediante re-hashing.
- **Modifiche silenziose dei punteggi di valutazione** — i punteggi di
  valutazione al rilascio sono in FACT 05. Le future contestazioni "il
  punteggio di valutazione è sempre stato X" hanno un'ancora pubblica.
- **Deriva delle dichiarazioni di capacità** — il testo della scheda
  modello in FACT 04 è byte-stabile. Le future contestazioni "non
  abbiamo mai dichiarato la capacità X" sono pubblicamente verificabili
  rispetto al testo sigillato.
- **Ridistribuzione silenziosa di fine-tuning** — l'impegno pre-deployment
  n. 1 in FACT 06 (nell'esempio elaborato) è "nessun fine-tuning
  silenzioso sotto lo stesso nome". Rilevamento: qualunque nuovo hash
  dei pesi implica un nuovo nome di modello e una nuova pubblicazione
  sigillata, oppure l'impegno è violato.
- **Modalità di fallimento nascoste** — FACT 04 si impegna a una lista
  di modalità di fallimento note. La lista è monotona (può crescere,
  non rimpicciolirsi per un checkpoint congelato). Future scoperte di
  modalità di fallimento che il laboratorio conosceva internamente ma
  non ha pubblicato diventano prove contestabili.

**Modalità di fallimento NON coperte:**

- Uso improprio dei modelli da parte di utenti a valle (il sigillo
  prova ciò che è stato rilasciato, non ciò che gli utenti ne fanno).
- Fine-tuning avversario da parte di terzi (un fine-tune di terza
  parte produce un hash dei pesi diverso, quindi il sigillo originale
  è inalterato, ma il modello del terzo è al di fuori della
  protezione del sigillo).
- Cambiamenti di comportamento dovuti a cambiamenti dell'ambiente di
  deployment (diversi system prompt, configurazioni RAG, ecc.).
- Fallimenti che il laboratorio genuinamente non conosceva al momento
  del rilascio. Il sigillo impegna il laboratorio a *quello che
  sapeva*; non può ancorare quello che non sapeva.

## Quando usare questo kit

Dovreste prendere in considerazione di sigillare una scheda modello se:

- State rilasciando pesi di un modello pubblicamente OPPURE
  distribuendo un modello in un contesto dove gli utenti a valle si
  preoccupano della stabilità del comportamento.
- Il rilascio è abbastanza significativo che future dispute "non
  l'abbiamo mai detto" sono plausibili (qualsiasi modello distribuito
  su larga scala; qualsiasi modello critico per la sicurezza;
  qualsiasi rilascio accompagnato da dichiarazioni di capacità).
- La vostra organizzazione è disposta ad assumere impegni
  pre-deployment che vincolano le azioni future (questo è il punto
  portante — vedete la sezione successiva).
- Potete calcolare lo SHA-256 del file dei pesi al rilascio.

## Quando NON usare questo kit

NON usate questo kit se:

- Non siete disposti ad essere vincolati dagli impegni pre-deployment
  in FACT 06 dell'esempio. Il sigillo rende gli impegni
  meccanicamente rilevabili; se non siete preparati a quella
  responsabilità, non sigillate.
- Il file dei pesi cambierà frequentemente (ad esempio, pipeline di
  fine-tuning continuo). Ogni cambiamento dei pesi richiede un nuovo
  rilascio sigillato. Sigillare a ogni rilascio è oneroso; questo kit
  è per checkpoint *congelati*.
- Non avete ancora fatto la revisione di sicurezza. Il sigillo
  impegna i risultati della revisione di sicurezza. Se sigillate una
  revisione incompleta, avete un registro pubblico permanente di una
  revisione incompleta.
- Potreste voler ritrattare in seguito un punteggio di valutazione
  specifico. Il sigillo è permanente. Nuove pubblicazioni sigillate
  possono soppiantarlo, ma l'originale non può essere disfatto.

## Gli impegni pre-deployment portanti

FACT 06 dell'esempio impegna il pubblicatore a:

1. **Nessun fine-tuning silenzioso sotto lo stesso nome.** Qualunque
   fine-tune produce un nuovo nome di modello, una nuova
   pubblicazione sigillata, un nuovo hash dei pesi. Il predecessore
   rimane canonicamente la versione denominata.

2. **Nessun aggiornamento silenzioso delle valutazioni.** Le
   ri-valutazioni ottengono nuove pubblicazioni sigillate che fanno
   riferimento all'originale tramite radice di Merkle. Le versioni
   sono tracciate, non sovrascritte.

3. **Le modalità di fallimento note possono crescere, mai
   rimpicciolirsi.** Un checkpoint congelato non può avere modalità
   di fallimento corrette. Quindi la lista pubblicata è di fatto
   monotona.

4. **Gestione delle rimozioni (takedown).** Se costretti a rimuovere
   il modello dalla distribuzione, il laboratorio si impegna a
   pubblicare un'attestazione sigillata finale della rimozione.

Un laboratorio che adotta questo kit deve decidere quali di tali
impegni può effettivamente onorare. Se non potete onorare tutti e
quattro, modificate FACT 06 *prima* di sigillare per riflettere ciò
che potete onorare, e accettate la conseguente protezione indebolita.
Sigillare impegni che non intendete onorare è peggio che non
sigillare affatto.

## Come forkare questo kit per un rilascio reale

```bash
# 1. Copiate questo esempio nella vostra pipeline di rilascio
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Modificate ciascun fatto per il vostro rilascio reale
$EDITOR facts/01_example_notice.txt   # RIMUOVERE — il vostro rilascio non è un esempio
                                       # Sostituite con un avviso di rilascio per il vostro modello
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # la scheda modello canonica
$EDITOR facts/05_eval_results.txt     # risultati effettivi delle valutazioni
$EDITOR facts/06_release_commitments.txt # gli impegni che potete onorare

# 3. Aggiornate site/index.html per riflettere il rilascio reale.

# 4. Sigillate.
bash build/seal.sh

# 5. Verificate localmente.
python3 build/verify.py

# 6. Distribuite su:
#    - La vostra pagina di rilascio (accanto alla scheda modello e ai pesi)
#    - La rete IPFS (lo script seal.sh lo fa già)
#    - Opzionalmente: collegate alla pubblicazione sigillata dalle
#      vostre note di rilascio Hugging Face / GitHub
```

## Integrazione con pipeline di rilascio esistenti

Il kit è progettato per comporsi con strumenti esistenti, non per
sostituirli:

- **Hugging Face**: includete l'URL della pubblicazione sigillata o il
  CID IPFS nel README.md della scheda modello. Indirizzate i lettori
  al sigillo per dichiarazioni di rilascio byte-stabili.
- **GitHub releases**: includete la ricevuta OpenTimestamps
  (`merkle_root.txt.ots`) come asset di rilascio. Le future
  contestazioni "il rilascio è cambiato" sono quindi ancorate a
  Bitcoin.
- **Standard di schede modello (Mitchell et al. 2019)**: il kit è
  compatibile. I campi standard della scheda modello si mappano su
  FACTS 02–05 del sigillo. Producete la scheda modello normalmente, e
  in aggiunta la sigillate.
- **Eval harness (lm-evaluation-harness, BIG-bench, ecc.)**: calcolate
  l'hash dell'esatto commit dell'harness e del JSON di output grezzo;
  fate riferimento a tali hash in FACT 05. Le future ri-esecuzioni
  sono allora indipendentemente riproducibili.

## Calcolo dell'hash dei pesi

Per un singolo file safetensors:

```bash
shasum -a 256 model.safetensors
```

Per checkpoint multi-file (shard GGUF, safetensors frammentati):

```bash
# Concatenate gli hash in ordine ordinato, poi hashate di nuovo
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

L'hash finale è ciò che va in FACT 03. Includete sia gli hash per shard
che l'hash aggregato finale, in modo che gli utenti possano verificare
i singoli shard man mano che li scaricano.

## Cosa dovrebbero sapere i destinatari (utenti del vostro modello)

Un rilascio di modello con una pubblicazione sigillata MYRIAM permette
all'utente di:

1. **Verificare i pesi scaricati** ricalcolando l'hash e confrontandolo
   con FACT 03.
2. **Verificare che la scheda modello non sia stata modificata a
   posteriori** confrontando FACT 04 sigillata con la versione
   attualmente pubblicata dal laboratorio.
3. **Verificare che i punteggi di valutazione siano quelli al
   rilascio** confrontando le attuali dichiarazioni di valutazione del
   laboratorio con FACT 05 sigillata.
4. **Tenere il laboratorio responsabile dei suoi impegni
   pre-deployment** confrontando il comportamento effettivo con FACT
   06 sigillata.

Un utente che trova discrepanze ha la prova crittografica della
discrepanza. Può pubblicare quella prova; la pubblicazione sigillata
originale è l'ancora.

## Cosa NON è questo kit

- Non è un sostituto del fare effettivamente la revisione di sicurezza.
  Il sigillo è il *registro* della revisione di sicurezza, non la
  revisione stessa.
- Non è un sostituto delle valutazioni reali. Il sigillo ancora i
  punteggi che producete; non ne valida la metodologia.
- Non è una garanzia che il modello sia sicuro. Il sigillo documenta
  ciò che il laboratorio afferma sul modello al rilascio; non certifica
  tali affermazioni.
- Non è protezione contro l'uso improprio del modello da parte di
  utenti a valle.

## Una nota sul fine-tuning avversario

Una comune preoccupazione di AI-safety: qualcuno fa fine-tuning del
vostro modello per rimuovere i comportamenti di sicurezza e lo
ridistribuisce. Il sigillo NON PUÒ impedirlo. Ciò che il sigillo può
fare è:

- Ancorare ciò che il modello *originale* doveva fare (FACT 04).
- Ancorare quali erano i punteggi di valutazione originali (FACT 05).
- Fornire un punto di riferimento rispetto al quale i fine-tune
  avversari possano essere misurati.

Un utente che incontra una ridistribuzione di terza parte può
verificare se i pesi corrispondono all'hash sigillato originale. In
caso contrario, l'utente sa di avere un modello non originale e che
qualsiasi dichiarazione di sicurezza attribuita al laboratorio non si
applica.

## Conclusione

Sigillare un rilascio di modello è un piccolo lavoro extra per il
laboratorio: ~10 minuti per calcolare gli hash ed eseguire lo script
di sigillatura, poi una decisione di 30 secondi su quali impegni
pre-deployment includere. La responsabilità che aggiunge è
asimmetrica: piccolo costo per i laboratori onesti, grande vincolo per
i laboratori che altrimenti farebbero silenziosamente derivare le
proprie dichiarazioni.

Se siete un laboratorio di IA che sta considerando l'adozione, il kit
è di pubblico dominio (CC0). Forkatelo. Modificatelo. La matematica è
la parte portante, non l'implementazione specifica.

## Licenza

Pubblico dominio (CC0). Nessuna attribuzione richiesta.
