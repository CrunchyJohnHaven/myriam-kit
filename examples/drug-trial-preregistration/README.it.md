# Kit per la Pre-registrazione di Studi Clinici sui Farmaci

*Traduzione italiana — per la versione originale in inglese, vedi [README.md](README.md)*

Un esempio chiavi in mano di myriam-kit per sponsor di sperimentazioni cliniche e
sperimentatori accademici che desiderano pre-registrare uno studio in modo evidente
per manomissione e ancorato a Bitcoin **in aggiunta alla** registrazione su ClinicalTrials.gov,
EU CTR o altri registri giurisdizionali.

## Perché pre-registrare *in aggiunta* sotto MYRIAM?

I registri esistenti delle sperimentazioni (ClinicalTrials.gov, EU CTR, ISRCTN) presentano
debolezze di integrità documentate:

- ClinicalTrials.gov consente agli sponsor di aggiornare endpoint, calcoli
  della dimensione del campione e piani di analisi **dopo** la registrazione originale,
  con le date di modifica visibili nel registro ma le modifiche del *contenuto*
  non sempre crittograficamente ancorate.
- Diversi studi di ampia portata (Goldacre et al., 2019; Mathieu et al., 2009)
  hanno documentato lo scambio sistematico post-hoc degli endpoint in tutto il
  settore.
- L'applicazione editoriale da parte delle riviste (CONSORT, ICMJE) intercetta alcuni
  casi; molti sfuggono.

Un sigillo MYRIAM colma questa lacuna. La radice di Merkle + la ricevuta OTS su Bitcoin
rende crittograficamente rilevabile qualsiasi modifica post-hoc all'endpoint primario
*pre-registrato*, al piano statistico di analisi o all'elenco dei sottogruppi. Il sigillo
è forensicamente più difficile da retrodatare rispetto al registro stesso.

Questo kit è un **complemento a**, non un sostituto di, registri
giurisdizionali. Una sperimentazione reale dovrebbe registrarsi nel registro appropriato
E sigillarsi sotto MYRIAM.

## Da cosa protegge questo kit

Casi storici di mortalità in cui sarebbe stato d'aiuto:

- **Vioxx (Merck, 2004)**: gli eventi cardiovascolari erano un endpoint
  pre-registrato nello studio APPROVe ma l'analisi pubblicata utilizzò un
  cutoff che minimizzava il danno apparente. Un sigillo del cutoff
  pre-registrato avrebbe reso pubblicamente rilevabile la modifica post-hoc del cutoff
  prima dell'articolo pubblicato.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: dati negativi sulla suicidalità
  adolescenziale furono riformulati tramite analisi post-hoc. Una
  pre-registrazione sigillata degli endpoint avrebbe reso la riformulazione
  pubblicamente rilevabile.
- **Molteplici sperimentazioni oncologiche** in cui gli endpoint di sopravvivenza furono sostituiti
  con endpoint surrogati (sopravvivenza libera da progressione, tasso di risposta)
  quando il beneficio di sopravvivenza non si concretizzava.

**Modalità di fallimento che il sigillo intercetta direttamente:**

- **Scambio di endpoint**: promozione post-hoc di un endpoint secondario
  a "primario" quando il primario effettivo fallisce. Il FATTO 05 del sigillo
  contiene l'endpoint primario pre-registrato; l'endpoint primario pubblicato
  deve corrispondere.
- **Cherry-picking degli esiti**: rendicontare selettivamente solo le analisi
  che hanno funzionato. Il FATTO 06 contiene il piano di analisi pre-registrato completo;
  le analisi pubblicate devono includere tutte quelle pre-registrate.
- **Mining post-hoc dei sottogruppi**: affermare "il farmaco funziona per il sottogruppo X"
  dopo aver visto i dati. Il FATTO 07 contiene l'elenco dei sottogruppi pre-registrato;
  qualsiasi altro sottogruppo deve essere etichettato come post-hoc.
- **Revisione della dimensione del campione**: aumentare la dimensione del campione dopo aver visto
  tendenze intermedie. Il FATTO 06 contiene la dimensione del campione pre-registrata e
  il calcolo della potenza.
- **Rimozione silenziosa di endpoint secondari scomodi**: il FATTO 05
  pre-ordina gli endpoint secondari per il test gerarchico; qualsiasi
  riordinamento o rimozione è rilevabile.
- **Soppressione di risultati negativi**: il FATTO 08 contiene
  l'impegno di pubblicazione; il mancato rispetto della finestra di
  pubblicazione impegnata è pubblicamente visibile.

**Modalità di fallimento NON coperte:**

- Cattiva condotta nell'esecuzione stessa dello studio (dati falsificati, arruolamento
  fraudolento). Il sigillo ancora il *piano*, non l'*esecuzione*.
- Rendicontazione selettiva in pubblicazioni che includono tutte le
  analisi pre-registrate ma le presentano con interpretazioni favorevoli. Il sigillo intercetta
  ciò che manca; non può intercettare i bias interpretativi.
- Danno ai pazienti durante lo studio stesso. Il sigillo è di natura regolatoria ed
  evidenziaria; non riduce il rischio di condotta dello studio.

## Quando usare questo kit

Dovreste considerare di sigillare una pre-registrazione se:

- State sponsorizzando o conducendo una sperimentazione clinica — Fase 1 fino a Fase 4 —
  che sarà utilizzata per informare decisioni mediche o regolatorie.
- Siete disposti a essere pubblicamente vincolati al disegno pre-registrato,
  agli endpoint e al piano di analisi.
- Siete in grado di gestire la conseguenza: se lo studio fallisce sui suoi
  endpoint pre-registrati, non potete silenziosamente retrodatare verso un endpoint
  diverso che ha funzionato.
- State partecipando a una cultura di ricerca (medicina accademica,
  gruppi cooperativi, ricerca finanziata da NIH) in cui l'integrità della
  pre-registrazione è sempre più richiesta.

Questo kit è *particolarmente* prezioso per:

- Sperimentazioni promosse da sperimentatori in istituzioni accademiche (dove
  la pressione dello sponsor a cambiare endpoint post-hoc è reale ma dove
  lo sperimentatore accademico ha un incentivo reputazionale a resistere).
- Sperimentazioni di scienza aperta e studi di citizen science.
- Sperimentazioni di riposizionamento di farmaci in piccole biotech senza
  lunghi storici di condotta degli studi.
- Qualsiasi sperimentazione destinata a informare sottoposizioni regolatorie in cui in futuro
  potrebbero essere avanzate argomentazioni del tipo "non l'abbiamo mai detto".

## Quando NON usare questo kit

NON usate questo kit se:

- Il protocollo dello studio è genuinamente ancora in evoluzione. Pre-registrate quando
  il protocollo è definitivo, non prima.
- Non potete impegnarvi a pubblicare i risultati indipendentemente dalla direzione.
  Il sigillo rende pubblicamente rilevabile il mancato adempimento della pubblicazione.
- La sperimentazione comporta segretezza industriale competitiva che vi impedisce
  di rendere pubblico il piano di analisi. Il sigillo rende il piano di
  analisi un registro pubblico permanente; non vi è modo di sigillare qualcosa
  privatamente.
- Non avete approvazione legale ed etica del protocollo. Il sigillo
  registra il protocollo COSÌ COME lo avete sigillato; non può essere retroattivamente
  approvato da un Comitato Etico o da una commissione etica.

## Come forkare questo kit per una pre-registrazione reale

```bash
# 1. Copiate questo esempio
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Sostituite il contenuto fittizio con il contenuto reale del protocollo dello studio.
# Ciascun fatto corrisponde a una sezione di una pre-registrazione standard:
$EDITOR facts/01_example_notice.txt   # SOSTITUITE con la dichiarazione di copertina reale
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARI + SECONDARI + ESPLORATIVI
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Aggiornate site/index.html per riflettere la sperimentazione reale.

# 4. Sigillate (PRIMA che inizi l'arruolamento, PRIMA del database lock):
bash build/seal.sh

# 5. Verificate in locale:
python3 build/verify.py

# 6. Deploy:
#    - Pubblicate l'URL del sigillo sul sito web dello sponsor dello studio E
#    - Aggiungete il CID IPFS al record ClinicalTrials.gov dello studio
#      nel campo "Description" o "References", in modo che il record del registro
#      faccia riferimento incrociato al sigillo crittografico.
```

**TEMPISTICA CRITICA**: il sigillo deve essere creato PRIMA che inizi l'arruolamento.
Una pre-registrazione sigillata dopo l'arruolamento del primo paziente è
forensicamente molto più debole. Idealmente, sigillate al momento dell'approvazione del Comitato Etico.

## Integrazione con l'infrastruttura di pre-registrazione esistente

Il kit è progettato per comporre, non per sostituire:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: registrate lo studio nel
  registro giurisdizionale come richiesto. Poi, nel campo "Description" o
  "References" del registro, collegate la pubblicazione sigillata MYRIAM.
- **OSF (Open Science Framework)**: OSF supporta la pre-registrazione con
  marche temporali ma senza ancoraggio Bitcoin. Il sigillo MYRIAM può essere
  allegato come file supplementare sulla pagina di registrazione OSF,
  fornendo sia la marca temporale sia l'ancoraggio Bitcoin.
- **AsPredicted.org**: analogamente — collegate il sigillo MYRIAM come
  URL supplementare.
- **Riviste**: alcune riviste (es. Trials, BMJ Open) accettano
  URL di pre-registrazione come parte della sottomissione. Includete l'URL del
  sigillo MYRIAM accanto all'URL del registro.

## Cosa ottengono i destinatari (regolatori, revisori di riviste, meta-analisti)

Una sperimentazione pre-registrata sotto MYRIAM offre ai revisori:

1. **Prova crittografica che il protocollo è stato finalizzato in un momento specifico.**
   I revisori possono verificare l'orario del sigillo tramite la ricevuta OTS.
2. **Stabilità byte per byte del testo del protocollo.** I revisori che confrontano
   la sezione metodi pubblicata con il disegno pre-registrato possono farlo
   carattere per carattere.
3. **Rilevamento dello scambio di endpoint.** Un semplice diff fra il FATTO 05
   sigillato e l'endpoint primario pubblicato rivela qualsiasi
   sostituzione.
4. **Rilevamento della deviazione dal piano di analisi.** Un semplice diff fra il
   FATTO 06 sigillato e i metodi statistici pubblicati rivela
   modifiche.
5. **Rilevamento della rendicontazione selettiva dei sottogruppi.** Il FATTO 07 sigillato
   contiene tutti i sottogruppi pre-registrati; qualsiasi sottogruppo nella pubblicazione che
   non sia nel sigillo deve essere etichettato come post-hoc.

Ciò rende le revisioni sistematiche e le meta-analisi sostanzialmente più semplici
rispetto alla pratica corrente.

## Cosa NON è questo kit

- Non è un sostituto dell'approvazione del Comitato Etico / commissione etica.
- Non è un sostituto della registrazione nel registro giurisdizionale.
- Non è una garanzia che lo studio sarà condotto come pianificato.
- Non è un modo per ancorare il consenso del paziente o altri documenti etici
  (questi necessitano di un proprio meccanismo di sigillatura).
- Non è una protezione contro la critica post-pubblicazione del disegno dello studio.

## Una nota sulla pubblicazione di risultati negativi

L'Impegno #1 nel FATTO 08 ("pubblicazione indipendentemente dalla direzione") è
il singolo impegno con il maggior impatto sulla mortalità nel sigillo. La storica
soppressione dei risultati negativi degli studi (in particolare per farmaci psichiatrici
in adolescenti, farmaci oncologici in popolazioni anziane e
farmaci cardiovascolari nelle donne) ha plausibilmente contribuito a migliaia
di morti prevenibili nel corso di decenni attraverso la prescrizione eccessiva basata su
stime di efficacia distorte.

Un impegno sigillato a pubblicare risultati negativi è, di per sé, una delle
mosse di salute pubblica a maggior leva che uno sponsor possa compiere. Il sigillo
fornisce responsabilizzazione esterna per tale impegno in un modo che
le politiche di pubblicazione autoregolate non offrono.

## Considerazioni conclusive

La pre-registrazione degli studi clinici sui farmaci sotto MYRIAM comporta un piccolo lavoro extra per lo
sponsor: ~30 minuti per popolare i fatti, ~10 secondi per sigillare. La
responsabilizzazione che aggiunge è asimmetrica: piccolo costo per la conduzione onesta dello studio,
grande vincolo sulle manovre post-hoc che hanno
contribuito a bias storici nella base evidenziaria.

Se siete uno sponsor o uno sperimentatore principale che sta valutando questo kit,
il kit è di pubblico dominio (CC0). Usatelo. Modificatelo. Miglioratelo.

## Licenza

Pubblico dominio (CC0). Nessuna attribuzione richiesta.
