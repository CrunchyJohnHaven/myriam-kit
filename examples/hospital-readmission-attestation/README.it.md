# Kit per l'Attestazione delle Riammissioni Ospedaliere

*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

Un esempio chiavi in mano di myriam-kit per ospedali, reti ospedaliere,
Chief Medical Officers, direttori della qualità, associazioni
ospedaliere statali e ricercatori di sanità pubblica che desiderano
pubblicare un sigillo mensile ancorato a Bitcoin e resistente a
manomissioni di *quali erano effettivamente i tassi di riammissione a
30 giorni dell'ospedale* e di *come sono stati misurati* — in modo che
la revisione silenziosa a posteriori del registro delle riammissioni,
la manipolazione dello stato di osservazione, la manipolazione dei
trasferimenti o la deriva metodologica tra periodi di reporting siano
pubblicamente rilevabili nel corso dei mesi.

Il sigillo è progettato per essere **confrontabile (diffabile) con il
sigillo del mese successivo**. Questa proprietà è l'intero scopo. Una
singola attestazione isolata è utile; il registro pubblico di un
ospedale che sigilla la stessa condizione mese dopo mese sotto la
stessa metodologia è l'artefatto portante.

---

## Cosa questo kit NON fa (leggere prima)

Il sigillo è un timestamp crittografico di QUALI ammissioni indice
sono state contate in QUALE coorte DRG / condizione, QUALI
riammissioni a 30 giorni sono state osservate, QUALI dimissioni in
stato di osservazione e QUALI trasferimenti sono stati registrati,
sotto QUALE versione della specifica CMS e QUALI criteri di
esclusione, firmato dal Chief Medical Officer certificante e
dall'ufficiale di qualità dell'ospedale. Non può rispondere a nessuna
domanda sulla qualità delle cure al di là di ciò. Quanto segue è
**fuori dal dominio del sigillo**:

1. **Dimostrare che le riammissioni erano inevitabili.** Una
   riammissione a 30 giorni può essere causata da pianificazione
   inadeguata della dimissione, progressione inevitabile della
   malattia, non aderenza del paziente, determinanti sociali al di
   fuori del controllo dell'ospedale, una nuova malattia indipendente
   o errori post-dimissione in una struttura a valle. Il sigillo
   registra il *conteggio*; non aggiudica la *causa*. Un ospedale
   con un alto tasso di riammissione sigillato non è quindi
   dimostrato negligente. Un ospedale con un basso tasso di
   riammissione sigillato non è quindi dimostrato eccellente.

2. **Migliorare l'ospedale.** Sigillare un numero non è un intervento
   di miglioramento della qualità. Il sigillo è uno strato di
   evidenza di manomissione su ciò che l'ospedale già riporta; non
   modifica la pianificazione della dimissione, il coordinamento
   delle cure, il follow-up post-acuto o qualsiasi altro input
   operativo al tasso di riammissione. Un ospedale che sigilla un
   tasso negativo ha un tasso negativo pubblicamente auditabile; la
   negatività rimane invariata finché il processo di cura sottostante
   non cambia. Il sigillo rende le affermazioni sul tasso
   auditabili; non rende il tasso buono.

3. **Difesa contro il bias di selezione pre-ammissione dei
   pazienti.** Un ospedale che indirizza silenziosamente i pazienti
   ad alto rischio lontano dall'ammissione (verso lo stato di
   osservazione, verso il trasferimento in un'altra struttura, verso
   la dimissione dal pronto soccorso senza ammissione) al
   front-end apparirà nei denominatori sigillati con un case mix
   apparentemente più sano. Il sigillo ancora ciò che l'ospedale ha
   contato come ammissione indice per la coorte; non può rilevare
   pazienti che non sono mai diventati ammissioni indice perché
   sono stati deviati. Il bias di selezione al front-end è a monte
   del sigillo.

4. **Difesa contro la dimissione a domicilio con servizi in modi
   che mascherano la continuazione delle cure.** Un paziente
   dimesso a un'agenzia di home health di proprietà dello stesso
   sistema sanitario, con cure intensive in corso che altrove
   sarebbero funzionalmente cure ospedaliere, non conta come
   riammissione se non viene ri-ammesso. Il sigillo registra
   le ri-ammissioni; non registra l'intensità delle cure continuative
   erogate sotto un'etichetta di dimissione. La modalità di
   fallimento "dimesso solo di nome" è a valle del codice di
   dimissione e non è ancorata dal sigillo.

5. **Rilevamento della mortalità che sposta la riammissione.** Un
   paziente che muore a casa entro 30 giorni dalla dimissione non
   conta come riammissione. Se un ospedale con un alto tasso di
   spostamento della mortalità produce un basso tasso di
   riammissione, il tasso di riammissione sembra buono mentre
   l'esito sottostante è peggiore. Il sigillo registra le
   riammissioni; il follow-up della mortalità è una misurazione
   separata con un sigillo separato (e necessario). Sigillare i
   tassi di riammissione senza dati di mortalità accompagnatori può
   trarre in inganno. Il kit rifiuta questa configurazione (vedere
   regola di rifiuto R4 sotto).

6. **Sostituzione di CMS Hospital Compare, misurazioni risk-adjusted
   HRRP o qualsiasi programma statutario di reporting della
   qualità.** Le sottomissioni CMS dell'ospedale sotto Hospital
   Readmissions Reduction Program (HRRP), Hospital Inpatient
   Quality Reporting Program (HIQR), MIPS e qualsiasi requisito di
   reporting statale sono mantenute per legge e prodotte su
   richiesta del regolatore. Il sigillo aggiunge uno strato pubblico
   resistente a manomissioni SOPRA quelle sottomissioni; NON le
   sostituisce. Una pubblicazione sigillata non è una sottomissione
   CMS.

7. **Dimostrare che l'ospedale è "migliore" o "peggiore" di un
   altro ospedale.** Il confronto trasversale dei tassi grezzi di
   riammissione tra ospedali senza aggiustamento per case mix è
   metodologicamente infondato ed è esattamente il motivo per cui
   HRRP utilizza misurazioni risk-adjusted. Il sigillo pubblica
   tassi grezzi per condizione E i tassi risk-adjusted della
   versione delle specifiche CMS E i denominatori, in modo che un
   ricercatore possa derivare autonomamente il confronto aggiustato
   per case mix. Il sigillo in sé non classifica gli ospedali.

8. **Rilevamento di frode di codifica contemporanea.** Un team di
   codifica ospedaliera che classifica erroneamente una riammissione
   come una nuova ammissione al momento dell'ammissione produce un
   tasso sigillato internamente coerente con la codifica
   (fraudolenta). Il sigillo rende rilevabile la successiva
   modifica silenziosa, ma non rileva la codifica errata
   contemporanea. Il rilevamento di frode di codifica contemporanea
   richiede audit CMS Recovery Audit Contractor (RAC), revisione
   dell'Office of Inspector General (OIG), audit di codifica
   interni e divulgazioni di whistleblower — tutti a monte del
   sigillo.

**La sezione sui limiti onesti sopra è la parte portante di questo
kit.** Gli amministratori ospedalieri che trattano "abbiamo sigillato
il nostro tasso di riammissione" come equivalente a "abbiamo dimostrato
di fornire buone cure" abusano della primitiva. Il kit deve dire
chiaramente: *questa è una primitiva di non ripudio per le affermazioni
contemporanee dell'ospedale sul registro delle riammissioni, non una
misurazione della qualità, non una sostituzione della supervisione
CMS e non una difesa contro le modalità di fallimento di selezione al
front-end, spostamento della mortalità o spostamento delle cure che
rendono i tassi di riammissione da soli un quadro parziale della
qualità ospedaliera.*

---

## Cosa questo kit DEVE RIFIUTARE di sigillare

Il kit è configurato per rifiutare i seguenti pattern di fatti anche
se un utente con autorità di firma ospedaliera valida li invia:

- **Risultati per paziente.** Nessun fatto può nominare un paziente,
  collegare una riammissione a un paziente, esporre un numero di
  cartella clinica, esporre una combinazione data di nascita +
  data di ammissione che potrebbe essere re-identificativa in una
  piccola cella, o includere qualsiasi identificatore protetto da
  HIPAA. I conteggi aggregati a livello di condizione sono l'unità
  di analisi; qualsiasi cosa per paziente è rifiutata. (R1)

- **Risultati per medico.** Nessun fatto può attribuire conteggi di
  riammissione a un medico curante nominato, un ospedaliero
  nominato, un chirurgo nominato o un clinico dimettente nominato.
  Questo è non negoziabile per due ragioni: (a) i tassi di
  riammissione per medico sono statisticamente rumorosi ai volumi
  che la maggior parte dei medici vede in un mese e sono
  ampiamente abusati; (b) più importante, il punteggio pubblico
  per medico crea vettori di ritorsione diretti contro i clinici
  che difendono pazienti più malati, ad alto rischio, meno
  favorevoli all'assicurazione, contro i clinici che segnalano
  problemi di sicurezza e contro i clinici che si rifiutano di
  manipolare la misurazione. Il sigillo non deve diventare uno
  strumento per raffreddare la difesa clinica. La misurazione
  della qualità per medico, dove appropriata, appartiene alla
  peer review interna e ai comitati di credenzialatura con le loro
  proprie protezioni di giusto processo — non su Bitcoin. (R2)

- **Tassi solo risk-adjusted senza tassi grezzi.** Il kit rifiuta
  di sigillare un corpo di fatto che contiene SOLO il tasso di
  riammissione risk-adjusted CMS a livello ospedaliero (o qualsiasi
  altra misurazione aggiustata) senza il corrispondente numeratore
  grezzo, denominatore grezzo e tasso grezzo. L'aggiustamento del
  rischio è una scatola nera dalla prospettiva di un auditor
  esterno; senza i tassi grezzi, un cambiamento metodologico tra
  mesi è invisibile. Il sigillo DEVE includere conteggi grezzi in
  modo che il sigillo del mese successivo possa essere confrontato
  con il sigillo di questo mese a livello di dati grezzi. (R3)

- **Tassi aggregati a livello ospedaliero senza ripartizione per
  condizione.** Un singolo tasso di riammissione a livello
  ospedaliero nasconde l'esatto vettore di manipolazione che il
  sigillo è progettato per rendere visibile — un ospedale potrebbe
  silenziosamente spostare il case mix lontano da DRG ad alta
  riammissione e verso DRG a bassa riammissione mentre il tasso a
  livello ospedaliero sembra stabile o in miglioramento. I tassi
  per condizione (al minimo: AMI, insufficienza cardiaca,
  polmonite, BPCO, CABG, THA/TKA, le coorti HRRP) DEVONO apparire,
  con denominatori per condizione. Il tasso a livello ospedaliero,
  se riportato, è in aggiunta (non al posto) ai tassi per
  condizione. (R4)

- **Qualsiasi cosa che non sarebbe confrontabile (diffabile) con il
  sigillo del mese successivo.** L'intero valore forense di questo
  kit deriva dalla comparabilità mese-su-mese. Il kit rifiuta corpi
  di fatto strutturati in modo che il sigillo del mese successivo
  non possa essere confrontato con questo — ad esempio, un testo
  libero "il nostro tasso di riammissione è circa X percento" senza
  un numeratore fisso, denominatore, versione della metodologia ed
  elenco dei criteri di esclusione. Se l'analista del mese
  successivo non può calcolare "questo numero è andato da X a Y a
  causa di A e B," il fatto è malformato e il kit rifiuta di
  sigillarlo. (R5)

- **Dati di mortalità senza attestazione di mortalità
  accompagnatoria.** Sigillare le riammissioni senza sigillare la
  mortalità a 30 giorni post-dimissione abilita il vettore di
  manipolazione "i pazienti che muoiono a casa non contano come
  riammissioni" che produce un tasso di riammissione
  ingannevolmente basso. Il kit rifiuta di sigillare un'attestazione
  di riammissione che non includa né (a) il conteggio della
  mortalità a 30 giorni post-dimissione nella stessa
  pubblicazione, né (b) un riferimento, tramite radice di Merkle,
  a un'attestazione di mortalità accompagnatoria per lo stesso
  periodo. (R6)

- **Conteggi dello stato di osservazione che escludono la categoria
  di giustificazione.** Il kit rifiuta di sigillare un conteggio
  dello stato di osservazione che non scomponga le categorie di
  giustificazione (esclusione del dolore toracico, sincope,
  disidratazione, ecc.) e la distribuzione della durata. Un
  conteggio di osservazione aggregato nudo abilita l'esatto pattern
  di manipolazione che questo sigillo è progettato per rendere
  visibile: uno spostamento silenzioso dall'ammissione di degenza
  allo stato di osservazione per casi che altrimenti sarebbero
  stati contati come ammissioni indice. (R7)

- **Conteggi di trasferimento che escludono la categoria della
  struttura ricevente e il flag within-system.** Un trasferimento a
  un ospedale sorella all'interno dello stesso sistema sanitario è
  funzionalmente diverso da un trasferimento a una struttura
  indipendente. Il kit rifiuta di sigillare conteggi di
  trasferimento senza la ripartizione within-system. (R8)

- **Sigillatura da parte di chiunque diverso dal Chief Medical
  Officer certificante E da un Quality Officer separato.** Minimo
  di due firmatari per le attestazioni ospedaliere, perché i
  vettori di manipolazione qui sono esattamente del tipo che la
  frode istituzionale a firmatario singolo nasconde. Un consulente
  di qualità di terze parti, un registro esterno o
  un'associazione ospedaliera statale possono utilizzare lo stesso
  kit per sigillare la LORO propria analisi indipendente; NON
  possono sigillare l'attestazione primaria di riammissione
  dell'ospedale sotto il nome dell'ospedale. (R9)

Un rifiuto stesso può essere sigillato come un fatto ("Questo ospedale
ha richiesto la sigillatura di X; il kit ha rifiutato secondo la
regola di rifiuto Y"), creando un registro pubblico di tentato abuso.

---

## Cosa questo kit sigilla

8 fatti al momento dell'attestazione mensile:

1. **Avviso di esempio** — dichiara la pubblicazione un esempio (le
   vere attestazioni rimuovono o sostituiscono questo).
2. **Identificazione dell'ospedale** — denominazione legale
   dell'ospedale, CMS Certification Number (CCN), regione della
   struttura, ruolo del CMO certificante + ruolo del Quality
   Officer + informazioni sulla chiave crittografica.
3. **Periodo di attestazione** — mese di calendario coperto, data di
   congelamento dei dati, data di attestazione, dichiarazione che
   nessun record è stato modificato dopo la data di congelamento dei
   dati per il periodo sotto attestazione.
4. **Tassi di riammissione** — tassi di riammissione a 30 giorni
   per tutte le cause per DRG / per condizione, numeratore grezzo,
   denominatore grezzo, tasso grezzo con intervallo di confidenza al
   95%, E il tasso risk-adjusted della versione della specifica
   CMS accanto al tasso grezzo (secondo la regola di rifiuto R3).
5. **Conteggi delle ammissioni indice** — denominatori per
   condizione, dimissioni di degenza totali per il mese, ripartizione
   per pagatore primario (Medicare FFS / Medicare Advantage /
   Medicaid / commerciale / autopagante / altro) per la trasparenza
   del case mix.
6. **Divulgazione dello stato di osservazione** — conteggio delle
   dimissioni in stato di osservazione, ripartizione delle categorie
   di giustificazione, distribuzione della durata (≤24h, 24-48h,
   >48h) e conteggio della conversione da degenza a osservazione se
   presente (il pattern di manipolazione adiacente alla "regola delle
   due mezzanotti").
7. **Divulgazione dei trasferimenti** — conteggi di pazienti
   trasferiti ad altre strutture di degenza, suddivisi per
   within-system vs. struttura ricevente indipendente, per categoria
   di motivo (escalation del livello di cura, richiesta del
   paziente, capacità, assicurazione) e conteggi di pazienti
   ricevuti come trasferimenti (in modo che il flusso netto sia
   calcolabile).
8. **Metodologia** — versione della specifica CMS (anno di
   misurazione HRRP), criteri di esclusione applicati, gestione
   dell'esclusione delle riammissioni pianificate, politica di
   attribuzione del trasferimento in uscita, politica
   dell'osservazione-come-ammissione-indice, dichiarazione di
   qualsiasi modifica rispetto alla metodologia sigillata del mese
   precedente con un riferimento alla radice di Merkle del sigillo
   del periodo precedente, informazioni sulla chiave crittografica
   del principale firmatario.

Ogni fatto termina con la convenzione del gate di rifiuto: *"Questo
fatto asserisce solo X. Non asserisce Y"* (dove Y è la modalità di
fallimento più vicina dalla sezione "NON fa" sopra).

---

## Contro cosa difende questo kit

- **Revisione retroattiva silenziosa dei tassi di riammissione.**
  Tutti i fatti che portano tassi sono hashati. Il re-hashing
  post-attestazione rivela qualsiasi modifica. Un regolatore,
  ricercatore o whistleblower che ha la radice sigillata del mese
  precedente può rilevare qualsiasi modifica silenziosa al tasso
  pubblicato del mese precedente quando l'ospedale riporta la volta
  successiva.
- **Manipolazione dello stato-di-osservazione-come-dimissione che
  diventa non rilevabile.** FACT 06 congela il conteggio
  dell'osservazione, la distribuzione delle categorie di
  giustificazione e la distribuzione della durata all'attestazione.
  Uno spostamento silenzioso mese-su-mese dalla dimissione di
  degenza allo stato di osservazione (che rimuoverebbe ciò che
  sarebbero state le ammissioni indice dal denominatore) è
  pubblicamente confrontabile tra sigilli.
- **Deriva metodologica tra periodi di reporting CMS.** FACT 08
  congela la versione della specifica CMS, i criteri di esclusione
  e la gestione dell'esclusione delle riammissioni pianificate.
  Qualsiasi modifica deve essere divulgata nel FACT 08 del mese
  successivo con un riferimento alla radice di Merkle di questo
  mese. Una modifica metodologica silenziosa tra mesi che produce
  un movimento di tasso favorevole è pubblicamente rilevabile.
- **Manipolazione dell'attribuzione del trasferimento in uscita.**
  FACT 07 congela i pattern di trasferimento inclusi il flag
  within-system e la categoria di motivo. Uno spostamento silenzioso
  verso il trasferimento di pazienti ad alto rischio prima dei 30
  giorni (che li rimuoverebbe dal numeratore di riammissione sotto
  alcune specifiche) è pubblicamente rilevabile tra mesi.
- **Manipolazione del case mix tramite spostamento di pagatore o
  DRG.** Il denominatore per condizione e la ripartizione del
  pagatore di FACT 05 congelano il case mix per il mese. Uno
  spostamento silenzioso lontano da condizioni ad alta riammissione
  (ammettere meno pazienti con insufficienza cardiaca mentre si
  ammettono più pazienti ortopedici elettivi, ad esempio) è
  pubblicamente confrontabile tra mesi.
- **Confusione di tassi grezzi e risk-adjusted.** FACT 04 richiede
  entrambi. Una futura affermazione "il nostro tasso risk-adjusted
  è migliorato di X" è pubblicamente verificabile contro il
  movimento del tasso grezzo e il movimento del denominatore
  insieme.
- **Re-narrazione metodologica post-hoc.** FACT 08 è sigillato
  all'attestazione. Una futura affermazione "abbiamo sempre
  utilizzato la metodologia Y" è pubblicamente confutabile contro la
  metodologia sigillata del periodo in questione.

Il kit **non** difende contro la frode di codifica contemporanea — un
ospedale che classifica erroneamente una riammissione come una nuova
ammissione al momento della codifica produce un sigillo
crittograficamente valido di un conteggio fraudolento. La primitiva è
onesta riguardo a questo: è una primitiva di non ripudio per le
affermazioni contemporanee dell'ospedale, non una prova che tali
affermazioni siano corrette.

---

## Quando utilizzare questo kit

- Il vostro ospedale ha un flusso di lavoro stabile di case-mix e
  codifica e desidera aggiungere un'attestazione pubblica mensile
  ancorata a Bitcoin come uno strato resistente a manomissioni
  sopra il flusso di lavoro di reporting HRRP / HIQR esistente.
- Siete un sistema ospedaliero che desidera pubblicare la
  trasparenza a livello di sistema su più strutture, sigillate
  per-struttura per-mese, in modo che la variazione within-system
  sia pubblicamente comparabile.
- Siete un ricercatore di sanità pubblica o un'associazione
  ospedaliera statale che gestisce un programma volontario di
  trasparenza tra gli ospedali partecipanti, e desiderate una
  primitiva crittografica comune che tutti gli ospedali partecipanti
  possano utilizzare senza fidarsi di un aggregatore centrale.
- Siete un ospedale in una giurisdizione la cui infrastruttura di
  reporting statutaria è debole o dove vi aspettate un'attenta
  scrutinio significativo dei vostri reclami di riammissione da
  parte di pagatori / pazienti / regolatori, e desiderate una
  cronologia globalmente verificabile di tali reclami.
- Potete pubblicare l'insieme di fatti elencato senza violare le
  regole di rifiuto R1-R9. Se i vostri fatti richiederebbero una
  violazione R1-R9, non utilizzate il kit; correggete prima gli
  input dei dati.
- Il consigliere legale ospedaliero e la conformità hanno rivisto
  il piano di pubblicazione. La pubblicazione pubblica di un
  artefatto che porta CCN e tassi ha implicazioni sotto HIPAA
  (standard di de-identificazione), HRRP (interazione con il
  reporting statutario) e regolatori statali (interazione con le
  leggi statali sulla trasparenza). La revisione legale non è
  opzionale.

## Quando NON utilizzare questo kit

- **Non utilizzare come sostituto delle sottomissioni CMS HRRP /
  HIQR / Hospital Compare.** Il sigillo è *additivo*, non
  sostitutivo. Le vostre sottomissioni statutarie, i vostri
  registri di audit CMS, il vostro programma interno di qualità —
  invariati.
- **Non utilizzare come affermazione di qualità.** Sigillare un
  basso tasso di riammissione non stabilisce che l'ospedale fornisca
  buone cure; stabilisce che il registro aveva questo contenuto in
  byte in questo momento. Le regole di rifiuto R1-R9 rifiuteranno i
  pattern che confondono l'attestazione con l'avallo della qualità.
- **Non utilizzare per pubblicare dati per paziente o per medico.**
  Le regole di rifiuto R1-R2 esistono per ragioni di HIPAA,
  prevenzione delle ritorsioni e solidità statistica; non
  modificate il kit per eluderle senza consultare il consigliere
  legale e la revisione etica.
- **Non utilizzare sotto pressione per sigillare prima che il
  congelamento dei dati del mese sia finale.** Un sigillo con dati
  parziali rappresenta erroneamente il periodo di attestazione e
  crea un punto di riferimento ingannevole.
- **Non utilizzare senza un'attestazione di mortalità
  accompagnatoria.** La regola di rifiuto R6 rifiuterà le
  attestazioni di riammissione che omettono la mortalità. Le due
  misurazioni insieme sono parziali; ciascuna da sola è ingannevole.
- **Non utilizzare come teatro di legittimità.** Un sigillo di un
  registro di riammissione manipolato è un registro pubblico
  permanente della manipolazione, non una difesa contro di essa. La
  primitiva taglia in entrambe le direzioni; questa è la sua
  onestà.

## Come fare il fork di questo kit per una vera attestazione mensile

```bash
cp -r ~/Genesis/myriam-kit/examples/hospital-readmission-attestation ~/readmission-2026-04
cd ~/readmission-2026-04
$EDITOR facts/*.txt        # sostituite il contenuto fittizio con il mese reale
                           # applicate le regole di rifiuto R1-R9 ovunque
bash build/seal.sh         # SIGILLARE AL fine mese + congelamento dati + firma CMO/QO
python3 build/verify.py    # confermare
```

**TEMPISTICA CRITICA:** sigillate AL momento del congelamento mensile
dei dati + firma del CMO e del Quality Officer. Non sigillate a metà
mese. Non sigillate dopo che la riunione di revisione interna
dell'ospedale ha avuto la possibilità di "aggiustare" i numeri —
l'intero scopo è ancorare ciò che i dati dicevano al congelamento prima
di qualsiasi aggiustamento. La finestra giusta è tra il congelamento
formale dei dati e la prima volta in cui il tasso viene citato
pubblicamente.

**REVISIONE CRITICA:** prima di sigillare, fate passare la
pubblicazione attraverso il Quality Officer (separato dal CMO),
attraverso codifica / conformità e attraverso il consigliere legale.
La regola dei due firmatari (FACT 02 e FACT 08) esiste per prevenire
la frode istituzionale a firmatario singolo.

**CADENZA MENSILE:** il valore del kit si accumula nei mesi.
Sigillare una volta è utile; sigillare ogni mese per un anno è
l'artefatto. Il FACT 08 di ogni nuovo mese fa riferimento alla
radice di Merkle del mese precedente in modo che la catena di
attestazioni sia pubblicamente percorribile.

## Integrazione con l'infrastruttura ospedaliera di qualità esistente

- **CMS Hospital Readmissions Reduction Program (HRRP).** L'URL
  della pubblicazione sigillata o il CID IPFS può essere
  referenziato nei materiali di divulgazione pubblica dell'ospedale.
  Il sigillo impegna i tassi grezzi e risk-adjusted per condizione
  che l'ospedale riporta a CMS; le successive controversie su ciò
  che è stato riportato sono pubblicamente confutabili.
- **CMS Hospital Inpatient Quality Reporting (HIQR) Program.** Il
  sigillo impegna i conteggi sottostanti che alimentano le
  misurazioni HIQR; il sigillo non sostituisce la sottomissione
  HIQR.
- **Sito pubblico CMS Hospital Compare / Care Compare.** Il sigillo
  si trova accanto a Hospital Compare come attestazione
  indipendente; l'ospedale può referenziare le sue pubblicazioni
  mensili sigillate nei materiali rivolti ai pazienti.
- **Reporting delle associazioni ospedaliere statali (ad es. PHC4
  in Pennsylvania, OSHPD/HCAI in California, NYSDOH a New York).**
  Compatibile come strato di trasparenza additivo; i conteggi per
  condizione del sigillo possono essere incrociati con le categorie
  di reporting statale dove le definizioni si allineano.
- **The Leapfrog Group, classifiche US News & World Report,
  Healthgrades, programmi di coorte Vizient.** Compatibili. Questi
  programmi aggregano dati di qualità ospedaliera; un'attestazione
  mensile sigillata permette loro (e al pubblico) di verificare che
  le affermazioni dell'ospedale verso di loro corrispondano alle
  affermazioni dell'ospedale altrove.
- **Accreditamento della Joint Commission.** Compatibile. Le
  attestazioni sigillate sono prove documentarie che l'ispettore
  della Joint Commission può verificare durante le visite di
  accreditamento.
- **Credenzialatura interna e peer review (secondo Healthcare
  Quality Improvement Act del 1986).** Fuori dall'ambito del
  sigillo direttamente. I dati per medico non appaiono nel sigillo
  (regola di rifiuto R2). La peer review interna rimane sotto le
  protezioni HCQIA.
- **CMS MIPS (Merit-based Incentive Payment System) per i singoli
  medici.** Fuori dall'ambito; il sigillo è solo a livello
  ospedaliero.

## Cosa questo kit NON sostituisce

- Sottomissione CMS HRRP.
- Sottomissione CMS HIQR.
- Feed dati CMS Hospital Compare / Care Compare.
- Reporting ospedaliero a livello statale (PHC4, OSHPD/HCAI,
  NYSDOH, equivalenti statali).
- Accreditamento della Joint Commission.
- Peer review interna e credenzialatura.
- Audit CMS Recovery Audit Contractor (RAC).
- Supervisione dell'HHS Office of Inspector General (OIG).
- Revisione CMS Quality Improvement Organization (QIO).
- Reporting di eventi di sicurezza del paziente (CMS Conditions of
  Participation, requisiti statali, reporting PSO).
- Attestazione di mortalità accompagnatoria a 30 giorni
  post-dimissione (che dovrebbe essere sigillata sotto una
  pubblicazione myriam-kit separata per lo stesso periodo — vedere
  regola di rifiuto R6).

## Valore dell'adozione e stima onesta dell'impatto

L'Hospital Readmissions Reduction Program (HRRP) attualmente impone
penali di pagamento agli ospedali statunitensi i cui tassi di
riammissione a 30 giorni risk-adjusted superano il tasso atteso da
CMS. Le stime pubblicate dei totali annuali delle penali HRRP sono
nelle **medie centinaia di milioni di dollari all'anno a livello
nazionale** (il totale delle penali FY2023 è stato riportato da CMS a
circa 320 milioni di dollari; il cumulativo a vita del programma è
nei miliardi). La struttura delle penali crea incentivi finanziari
misurabili per gli ospedali a sottostimare le riammissioni attraverso
manipolazione dello stato di osservazione, manipolazione dei
trasferimenti in uscita, spostamento del case mix e revisione
silenziosa dei casi limite — tutti documentati nella letteratura peer-
reviewed (Wadhera et al., JAMA 2018-2019; Khera et al., JAMA 2018;
Gupta et al., JAMA Cardiol 2018; Zuckerman et al., NEJM 2016 e
critiche successive).

**La stima onesta dell'impatto:**

Un'attestazione mensile sigillata di riammissione non riduce
l'incentivo a manipolare; rende rilevabile una categoria di
manipolazione. Se le attestazioni sigillate sono adottate da ospedali
che rappresentano ~20 percento delle ammissioni eleggibili HRRP in 5
anni, e se la rilevabilità risultante scoraggia anche solo ~10
percento della manipolazione che altrimenti si verificherebbe, il
valore di sanità pubblica è in una migliore pianificazione della
dimissione per una frazione di pazienti che altrimenti sarebbero
stati dimessi-per-manipolare piuttosto che dimessi-per-effettivamente-
recuperare. Tradurre questo in un conteggio di vite è difficile e il
kit rifiuta di pubblicare una singola stima di vittime che verrebbe
citata come autorevole — la catena di inferenza da "manipolazione
ridotta di X" a "morti prevenute di Y" passa attraverso diversi
parametri scarsamente identificati (quale frazione di dimissioni
manipolate ha prodotto mortalità prevenibile, la qualità
controfattuale delle cure, la distribuzione del rischio tra coorti
suscettibili alla manipolazione) e qualsiasi numero specifico citato
come stima di vittime starebbe inventando una precisione che i dati
non supportano.

**L'inquadramento onesto:**

Il caso per l'adozione non è "questo kit salverà N vite". È: *se
credete che la letteratura pubblicata sulla manipolazione HRRP
(Wadhera, Khera, Gupta, Zuckerman e altri) sia approssimativamente
corretta nel dire che la manipolazione è una frazione misurabile del
miglioramento HRRP apparente dal 2012, allora un'attestazione
mensile resistente a manomissioni è la primitiva più economica
disponibile che rende quella manipolazione pubblicamente
confrontabile tra mesi. Il sigillo non ferma la manipolazione; rende
un canale di essa auditabile. Quella auditabilità è ciò che produce
pressione sociale sugli ospedali per non manipolare. La pressione
sociale è ciò che produce (una frazione del) miglioramento effettivo
delle cure. Le vite salvate sono a valle di tre passaggi causali che
il sigillo stesso non esegue. Adottate il kit con questa comprensione,
non con una promessa di vite salvate.*

I default del kit sono deliberatamente conservativi sui dati per
paziente (regola di rifiuto R1), aggressivi sulla prevenzione delle
ritorsioni per medico (regola di rifiuto R2) e aggressivi sul
disclaimer "questa non è un'affermazione di qualità". Gli ospedali
in giurisdizioni dove i requisiti specifici di divulgazione pubblica
differiscono possono modificare il loro fork di conseguenza, ma i
rifiuti predefiniti favoriscono la privacy del paziente, la
protezione della difesa clinica e l'ambito onesto.

## Pattern storici con cui il kit avrebbe aiutato

Il kit avrebbe prodotto un utile registro forense mese-su-mese — *non
una correzione* — nei seguenti pattern documentati:

- **Crescita dello stato di osservazione nell'era HRRP.** Diversi
  studi hanno documentato una crescita sostanziale delle dimissioni
  in stato di osservazione negli ospedali statunitensi coincidente
  con l'implementazione di HRRP (Sheehy et al.; Zuckerman et al.).
  Un conteggio di osservazione mensile sigillato per-ospedale con
  ripartizione delle categorie di giustificazione (FACT 06) avrebbe
  reso il timing e la magnitudine del contributo di ciascun ospedale
  a quel pattern pubblicamente confrontabile, piuttosto che visibile
  solo in ricerche retrospettive aggregate a livello nazionale anni
  dopo.
- **Disparità delle penali HRRP che colpiscono gli ospedali di rete
  di sicurezza.** Gli ospedali che servono popolazioni più
  svantaggiate affrontano penali HRRP più elevate sotto
  l'aggiustamento del rischio standard (secondo molteplici analisi
  di Khera et al.); una ripartizione mensile sigillata del pagatore
  (FACT 05) consentirebbe al pubblico di tracciare separatamente le
  modifiche del case mix dalle modifiche dei tassi per ciascun
  ospedale, rendendo possibile distinguere il miglioramento
  effettivo del tasso dallo spostamento del case mix.
- **Pattern di trasferimento within-system in sistemi sanitari a
  più strutture.** Alcuni sistemi multi-ospedalieri sono stati
  documentati per instradare le necessità post-dimissione attraverso
  strutture within-system in modi che non sempre appaiono come
  trasferimenti nelle misurazioni HRRP. Un conteggio di trasferimenti
  mensile sigillato con flag within-system (FACT 07) renderebbe
  questo pubblicamente tracciabile per struttura per mese.

Il kit NON avrebbe risolto le controversie sottostanti sulla
metodologia di aggiustamento del rischio HRRP, su se HRRP sia in
equilibrio utile o dannoso per gli esiti dei pazienti, o su se la
struttura delle penali debba essere modificata. Questi sono dibattiti
politici a monte del sigillo.

## Licenza

Pubblico dominio (CC0). Fatene il fork. Nessuna attribuzione richiesta.
