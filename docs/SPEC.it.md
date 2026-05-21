*Traduzione italiana — per la versione originale in inglese, vedi [SPEC.md](SPEC.md)*

# Specifica del protocollo MYRIAM-kit

## 0. Scopo

Questo documento specifica un protocollo minimo per pubblicare un piccolo
insieme di fatti testuali in una forma evidente alla manomissione e
verificabile crittograficamente, che sopravvive alla rimozione da parte di
qualsiasi singolo fornitore di hosting.

È la generalizzazione del protocollo dispiegato per la prima volta su
[disclosure.host](https://disclosure.host) sotto il nome "MYRIAM v1".

## 1. Non-obiettivi

- Archiviazione di segreti. Tutto è pubblico per costruzione.
- Dataset di grandi dimensioni. Oltre i ~20 fatti, il protocollo è la forma
  sbagliata.
- Pubblicazione in tempo reale. Ogni pubblicazione è un evento discreto di
  sigillatura.
- Ritrattazione. Il protocollo è ad aggiunta-solo a livello di versione.

## 2. Modello del fatto

Un FATTO è un file di testo UTF-8 con:

- Schema del nome file: `NN_short_name.txt` dove NN è un indice a due cifre
  con zero iniziale che parte da 01.
- Forma canonica: byte così come scritti, senza normalizzazione.
- Hash per fatto: esadecimale minuscolo di `SHA-256(file_bytes)`.

L'INSIEME dei fatti è la lista ordinata di tutti i file che corrispondono allo
schema sotto `facts/`, ordinati lessicograficamente.

Vincolo: il corpo di ogni fatto DOVREBBE essere formulato come un *evento di
denominazione* o *evento di dichiarazione* attribuibile a una specifica parte.
Le affermazioni ontologiche ("la luna è roccia") indeboliscono il varco di
verificabilità; solo l'evento di pubblicazione è verificabile, non
l'affermazione. "X ha dichiarato Y" è la forma corretta. "Y è vero" non lo è.

## 3. Radice di Merkle

In stile Bitcoin, come nella v0 del protocollo MYRIAM dispiegato:

1. Foglie: hash SHA-256 per fatto nell'ordine dell'insieme dei fatti.
2. Se un livello ha un numero dispari di nodi, duplicate l'ultimo nodo.
3. Hash a coppie dei nodi adiacenti: `parent = SHA-256(left_bytes || right_bytes)`,
   dove `left_bytes` e `right_bytes` sono i valori hash grezzi di 32 byte
   (non le loro rappresentazioni esadecimali).
4. Ripetete finché non resta un solo nodo. Quella è la radice di Merkle.

La radice è pubblicata come esadecimale minuscolo senza newline finale.

### 3.1 Vettori di test

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Qualsiasi implementazione conforme DEVE riprodurre questi vettori. Sono
derivati dall'effettivo `lib/build.py` e possono essere rigenerati con quello
script.

## 4. Impegno su Bitcoin

La radice di Merkle è impegnata sulla blockchain di Bitcoin tramite
[OpenTimestamps](https://opentimestamps.org). La politica predefinita è:

> Marcare temporalmente contro almeno due operatori di calendario sotto
> controllo amministrativo indipendente.

Una ricevuta che soddisfi questa politica è verificabile da qualsiasi parte
che possa eseguire `ots verify <receipt>.ots` e raggiungere il percorso di
aggiornamento di uno dei calendari.

La coppia di operatori predefinita inclusa in `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Le implementazioni POSSONO usare operatori diversi. La politica di
diversità dei testimoni (≥2 operatori indipendenti) è normativa; gli
operatori specifici non lo sono.

## 5. Mirroring indirizzato per contenuto

La directory `site/` contenente la pagina pubblicata e i file dei fatti
DOVREBBE essere aggiunta a IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

Il CIDv1 risultante (codec dag-pb) è l'indirizzo di contenuto della
pubblicazione. È deterministico a partire dal contenuto in byte di `site/`.
Qualsiasi modifica a qualsiasi file sotto `site/` produce un CID diverso.

È fortemente raccomandato fissare il contenuto su servizi aggiuntivi oltre al
nodo locale dell'editore per garantire durabilità; questa specifica non
prescrive servizi specifici.

## 6. Versionamento

Il protocollo è **ad aggiunta-solo a livello di versione**. Ogni modifica
richiede una nuova versione sigillata:

- Una nuova revisione della specifica (oppure invariata)
- Un nuovo insieme di fatti, che PUÒ ereditare invariati i fatti dalle
  versioni precedenti
- Una nuova radice di Merkle
- Una nuova ricevuta OpenTimestamps
- Un nuovo CID IPFS

Tutte le versioni precedenti rimangono pubblicate su URL versionati. Una
modifica a qualsiasi fatto di v(N) richiede v(N+1), con entrambe le versioni
visibili e ri-verificabili.

## 7. Verifica

Qualsiasi terza parte può verificare l'integrità di una pubblicazione:

1. Scaricando i file dei fatti e ricalcolando gli hash SHA-256 per ciascun
   fatto.
2. Ricalcolando la radice di Merkle secondo §3 e confrontandola con la radice
   pubblicata.
3. Verificando la ricevuta OpenTimestamps contro la blockchain di Bitcoin per
   almeno un'attestazione completa di un calendario.
4. Ricalcolando in modo indipendente il CID IPFS tramite
   `ipfs add -r --cid-version=1` e confrontandolo con il CID pubblicato.

`lib/verify.py` esegue i passaggi 1–3 senza dipendenze esterne oltre alla
libreria standard di Python e al client `ots`. Il passaggio 4 richiede il
client `ipfs`.

## 8. Varco di rifiuto

Una pubblicazione NON DEVE includere un fatto che:

- Identifichi una terza parte privata che non abbia acconsentito a essere
  nominata.
- Presenti un'ipotesi come una conferma.
- Non possa essere ridotto a un evento verificabile di
  denominazione/dichiarazione o a un artefatto crittografico.
- Abbia un ragionevole aumento atteso di morti prevenibili al momento della
  pubblicazione.

La quarta regola è quella portante. È applicata nel passaggio di revisione
umana da parte dell'editore. Non c'è applicazione a livello di protocollo del
varco di rifiuto; il protocollo pubblica qualsiasi byte gli venga fornito.
L'editore è responsabile del varco.

## 9. Dichiarazione onesta dei limiti

- **Rilevabilità, non impossibilità.** Il protocollo rende la manomissione
  rilevabile, non impossibile. Un attaccante determinato può ancora sostituire
  una pubblicazione differente e persuadere alcuni lettori che si tratta
  dell'originale. Il valore del protocollo è che la sostituzione diventa
  crittograficamente dimostrabile a chiunque esegua il controllo.
- **Nessuna difesa contro la pubblicazione di falsità.** Se l'editore sigilla
  un fatto che afferma "X è accaduto" e X non è accaduto, il protocollo
  sigilla l'affermazione falsa con la stessa fedeltà con cui sigilla quelle
  vere. Il protocollo attesta ciò che è stato *pubblicato*, non ciò che è
  *vero*.
- **Firma di una singola parte.** La v1 del MYRIAM dispiegato utilizza un
  singolo principale firmatario. La firma multi-parte è lavoro futuro.
- **Durabilità del pinning.** Il pinning IPFS sul solo nodo dell'editore
  fornisce "disponibile mentre il mio laptop è acceso + caching opportunistico
  dei gateway". La durabilità a lungo termine richiede pin ridondanti su
  servizi indipendenti.

Questi limiti sono dichiarati qui affinché nessun lettore presuma che il
protocollo offra più di quanto offra.
