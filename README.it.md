# myriam-kit

*Traduzione italiana — per la versione originale in inglese, vedi [README.md](README.md)*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#esempi-pratici)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Un piccolo toolkit per pubblicare un insieme ridotto di fatti in modo tale che:

- Qualsiasi modifica a qualsiasi fatto sia pubblicamente rilevabile (albero di Merkle)
- Lo stato al momento della pubblicazione sia verificabile rispetto alla blockchain di Bitcoin (OpenTimestamps)
- Il contenuto sopravviva alla rimozione di qualunque singolo fornitore di hosting (IPFS)
- L'intero sistema pesi meno di 100 KB e sia verificabile con circa 50 righe di Python

Questa non è una blockchain. Non esiste alcun token. Non vi è alcun meccanismo
di consenso a cui partecipare. Non vi è alcuna DAO. Lo strumento è `sha256sum` + `ots` + `ipfs`,
tenuti insieme da buone convenzioni di denominazione.

Prende il nome dal protocollo MYRIAM, istanziato per la prima volta su
[disclosure.host](https://disclosure.host) il 2026-05-21. Quella pagina contiene
sei fatti, una radice di Merkle e un'attestazione Bitcoin. Questo kit è la
generalizzazione di tale schema.

## Stato

- v0: funziona su macOS con Python 3.10+, Homebrew e una connessione
  a Internet. Linux non è stato testato ma dovrebbe funzionare. Windows: serve WSL.
- Pubblico dominio (CC0). Usatelo, forkatelo, incorporatelo nel vostro repo, non
  attribuitelo mai. Il punto non è il riconoscimento.

## Cosa potete farci

Lo schema si adatta ovunque sia necessario che un piccolo insieme di fatti sia:

- **Pubblicabile** verso un pubblico ampio tramite semplice HTTP
- **Durevole** — lettori fra 30 anni dovrebbero ancora poterlo verificare
- **Evidente per manomissione** — qualsiasi modifica deve essere rilevabile, non necessariamente impedibile
- **Senza fiducia** — nessun lettore deve fidarsi del pubblicatore (solo della matematica)

Casi d'uso concreti in [docs/USE_CASES.md](docs/USE_CASES.md). L'elenco sintetico:

| Ambito | Fatti sigillati |
|---|---|
| Salute pubblica | Risultati di test di lotti vaccinali, milestone di studi clinici |
| Elezioni | Totali di scrutinio a livello di seggio al momento della certificazione |
| Sicurezza dell'IA | Hash dei pesi del modello + scheda modello + punteggi di valutazione al rilascio |
| Giornalismo | Manifesto dei documenti di origine (solo hash) per le fughe di notizie da whistleblower |
| Scienza | Hash dei dati grezzi + hash dello script di analisi + risultato dichiarato |
| Tribunali | Hash dei reperti digitali al momento dell'acquisizione |
| Appalti | Radici sigillate dei dati di spesa pubblica |

Ciò che questi casi hanno in comune: un piccolo insieme di fatti, un forte requisito di durabilità,
più parti che non si fidano l'una dell'altra e un budget di archiviazione minimo.
È esattamente la forma per cui questo strumento è stato concepito.

## Cosa NON fa

- **Conservare segreti.** Tutto ciò che inserite in `facts/` è pubblico. Il protocollo serve
  a pubblicare, non a nascondere.
- **Scalare a grandi dataset.** L'albero di Merkle scala bene; l'attenzione di un
  lettore no. Oltre i ~20 fatti la pagina diventa illeggibile. Se
  volete sigillare un milione di record, calcolatene l'hash fuori dalla pagina e inserite la
  radice di Merkle di quell'albero laterale in un singolo fatto.
- **Difendere dalla ritrattazione.** Il punto è proprio che non potete cambiare
  ciò che avete sigillato. Se potreste voler ritrattare un'affermazione in seguito, non
  sigillatela.
- **Convincere uno scettico determinato.** Uno scettico determinato non eseguirà
  `ipfs add -r --cid-version=1 -Q facts/`. Vi accuserà, invece,
  di aver fabbricato l'intero impianto. Non c'è alcuna difesa a livello di protocollo
  contro la seconda modalità di fallimento. Non c'è alcuna difesa a livello di protocollo
  contro qualsiasi cosa che risieda nella motivazione umana anziché nella matematica.

## Come usarlo

Guida rapida di cinque minuti in [docs/QUICKSTART.md](docs/QUICKSTART.md).
Specifica completa del protocollo in [docs/SPEC.md](docs/SPEC.md).
Modello di minaccia in [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Confronto con sistemi affini (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, ecc.) in [docs/COMPARISON.md](docs/COMPARISON.md).

## Come verificare la pubblicazione di qualcun altro

Tre opzioni, in ordine di accessibilità:

1. **Browser**: aprite [`lib/verify.html`](lib/verify.html) in qualsiasi browser
   moderno. Incollate l'URL della pubblicazione. Cliccate verifica. Utilizza
   `crypto.subtle` per il calcolo degli hash — niente installazione, niente backend, niente telemetria.
   Il passaggio di attestazione Bitcoin richiede ancora uno strumento CLI (vedete il passaggio 7 nella
   pagina del verificatore).
2. **Python**: `python3 lib/verify.py` dall'interno della directory di pubblicazione.
   Solo libreria standard; richiede `ots` per la verifica Bitcoin.
3. **Da zero**: leggete [`docs/SPEC.md §3`](docs/SPEC.md) e
   reimplementate. L'algoritmo di Merkle è meno di 30 righe in qualsiasi linguaggio.

## Esempi pratici

Insieme al toolkit sono distribuiti sei kit di esempio di qualità produttiva. Ciascuno è
sigillato, marcato OTS, fissato su IPFS e include un README di adozione
che spiega quando forkarlo per un caso reale e quali modalità
di fallimento contrasta.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  per la modalità di fallimento Boeing 737 MAX / Theranos / rapporti
  degli ispettori FDA, in cui le prove vengono occultate o alterate dagli intermediari.
- [`examples/ai-model-card/`](examples/ai-model-card/) — per laboratori di IA
  che rilasciano modelli, con impegni pre-deployment che diventano
  meccanicamente rilevabili anziché verbali.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  per sponsor di sperimentazioni cliniche, intercettando lo scambio post-hoc degli endpoint
  e la rendicontazione selettiva (modalità di fallimento Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  per produttori di vaccini e autorità di controllo qualità, ancorando i risultati
  dei test di rilascio e gli impegni di richiamo.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  per gruppi di ricerca, ancorando la tripla (dati, pipeline, output
  atteso) PRIMA dell'analisi per rendere pubblicamente rilevabili
  p-hacking e HARKing.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  per commissioni elettorali e autorità elettorali, ancorando gli
  scrutini certificati al momento della certificazione affinché silenziose
  revisioni post-certificazione diventino pubblicamente rilevabili.

Leggetene uno prima di scriverne uno vostro. La corrispondenza più stretta al vostro
caso d'uso è solitamente il fork di partenza giusto.

## Avvio rapido

La versione in una riga:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# modificate facts/*.txt per dichiarare ciò che volete effettivamente sigillare
./lib/seal.sh        # costruisce la radice di Merkle, marca con OTS, fissa su IPFS
./lib/verify.sh      # riverifica tutto in locale
# caricate site/ su qualsiasi host statico. Ovunque. Non importa.
```

## Perché esiste

Le primitive crittografiche (alberi di Merkle, OpenTimestamps, IPFS) sono
mature da anni. Ciò che mancava era il collante più piccolo possibile —
un kit che si potesse innestare in un progetto secondario e avere un artefatto
pubblicabile sigillato in un pomeriggio, senza configurare infrastrutture,
senza apprendere protocolli, senza scrivere una singola riga di codice oltre
ai fatti stessi.

La maggior parte degli strumenti di pubblicazione crittografica presuppone che vogliate diventare un
operatore di nodo. Questo presuppone che vogliate pubblicare sei file di testo e non
pensare mai più alla crittografia.

## Influenze e stato dell'arte

- [Sigsum](https://www.sigsum.org/) — log di trasparenza per firme
- [Sigstore](https://www.sigstore.dev/) — integrità della catena di approvvigionamento del software
- [Certificate Transparency](https://certificate.transparency.dev/) — log di certificati TLS
- [OpenTimestamps](https://opentimestamps.org/) — marcatura temporale su Bitcoin
- [IPFS](https://ipfs.tech/) — archiviazione indirizzata per contenuto
- [Il protocollo CALM](https://disclosure.host) — l'impianto di pubblicazione
  protettivo verso il principale all'interno del quale è stata scritta la prima istanza
  (MYRIAM su disclosure.host)

myriam-kit è il più piccolo fra questi. È più affine in spirito a una pipeline
Unix che a un sistema.

## Una nota sul nome

Il protocollo MYRIAM prende il nome dalla Myriam Proof di John Bradley, una
prova logica dichiarata riguardante il primo punto di contatto per l'intelligenza
non umana. Il protocollo non dipende dalla veridicità di tale prova. Il
protocollo funziona per qualsiasi piccolo insieme di fatti; è solo accaduto
che sia stato impiegato per la prima volta per pubblicare sei fatti che includono un'affermazione
sulla divulgazione aliena.

Se forkate questo kit per sigillare lotti vaccinali o scrutini elettorali, il
fatto che sia stato originariamente usato per pubblicare un'affermazione sul contatto alieno
è irrilevante per voi. Alla matematica non importa.

Detto questo: se LO usate per pubblicare un'affermazione sul contatto alieno, il
protocollo è stato testato sul campo in quell'ambito specifico. Il README del
primo deployment MYRIAM dichiara esplicitamente che si tratta dell'opera artistica di
una persona LLM di nome Calm, non di una comunicazione da parte di qualsiasi
parte extraterrestre. Probabilmente dovreste fare altrettanto. Altrimenti i lettori
faranno le ipotesi peggiori sul vostro stato mentale.

## Manutenuto da

Ancora nessuno. Pubblico dominio. Forkatelo. Miglioratelo. Portate avanti il protocollo
senza chiedere permesso.
