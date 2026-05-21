*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

# Kit di Sigillo per Attestazione di Carbonio

Un esempio chiavi in mano di myriam-kit per sviluppatori di progetti
di carbonio, verificatori terzi e registri che desiderano pubblicare un
sigillo ancorato a Bitcoin ed evidente in caso di manomissione,
relativo all'emissione di un credito di carbonio, alla verifica di una
rimozione o a un evento di attestazione delle emissioni nell'esatto
momento della certificazione — affinché le modifiche silenziose
successive all'emissione diventino pubblicamente rilevabili.

---

## Cosa questo kit NON fa (da leggere per primo)

I crediti di carbonio sono politicamente e scientificamente contestati.
Il sigillo è una marca temporale crittografica di ciò che è stato
attestato. Non può verificare se quanto attestato rifletta un reale
beneficio climatico. Le seguenti modalità di fallimento sono **fuori
dal dominio del sigillo** e rappresentano la maggior parte delle
questioni significative di integrità relative ai crediti di carbonio:

1. **Addizionalità.** Il sigillo non può verificare che l'attività
   accreditata non si sarebbe verificata senza il finanziamento di
   carbonio. La controfattuale è, in linea di principio, inosservabile.
   Il sigillo registra l'argomentazione di addizionalità della
   metodologia; non la giudica.

2. **Permanenza.** Il sigillo non può verificare che il carbonio
   sequestrato resterà sequestrato per l'orizzonte temporale di
   riferimento (decenni o secoli per il carbonio forestale, scale
   geologiche per alcune rimozioni). La letteratura recente (Badgley
   et al. 2022, Patterson et al. 2022) mostra che le riserve di
   compensazione (buffer pool) sono state sostanzialmente depauperate
   da eventi reali di reversione. Un credito sigillato è una
   *dichiarazione* sigillata di permanenza sotto specifiche ipotesi
   sulla riserva di compensazione, non una prova di permanenza.

3. **Leakage (rilocazione delle emissioni).** Il sigillo non può
   verificare che le emissioni evitate nell'area del progetto non
   siano semplicemente spostate verso un'area esterna al progetto. Le
   deduzioni di default per leakage previste dalla metodologia sono
   surrogati regolatori, non misurazioni. Il sigillo ancora la
   deduzione applicata; non la certifica come corretta.

4. **Co-benefici.** Il sigillo non può verificare rivendicazioni di
   sviluppo comunitario o di biodiversità. I co-benefici sono in
   genere auto-dichiarati e riesaminati dal verificatore, non
   sottoposti ad audit della stessa profondità della quantificazione
   del carbonio. Il sigillo ancora gli hash dei documenti; nulla di
   più.

5. **Sufficienza del Consenso Libero, Previo e Informato (FPIC).** Il
   consenso delle comunità indigene e locali nei progetti di carbonio
   ha una documentata storia di modalità di fallimento (consenso
   coercitivo, consenso da parte di organismi non rappresentativi,
   "consenso" a posteriori tramite compensazione). Il sigillo ancora
   la documentazione FPIC e gli hash dei registri di reclamo; non può
   certificare che il processo di consenso sia stato genuino.

6. **Indipendenza del verificatore.** I verificatori sono pagati dagli
   sviluppatori dei progetti. Si tratta di un conflitto strutturale
   d'interessi che nessuno schema di accreditamento ha risolto. Il
   sigillo ancora la dichiarazione di indipendenza del verificatore;
   non certifica che tale dichiarazione sia veridica.

7. **Doppio conteggio tra registri o con gli inventari nazionali.** Il
   sigillo ancora lo snapshot dello stato del registro al momento
   dell'attestazione. Se la stessa attività viene contabilizzata anche
   da uno Stato ospitante ai fini del proprio NDC, o rivendicata su un
   altro registro, il sigillo rende lo stato del registro diffabile ma
   non impedisce il doppio conteggio.

8. **Correttezza delle rivendicazioni dell'acquirente.** Un acquirente
   che ritira un credito sigillato a sostegno di una rivendicazione
   "net zero" o "carbon neutral" sta formulando una rivendicazione a
   valle che il sigillo non copre. Il sigillo registra il ritiro; la
   validità della rivendicazione di marketing dell'acquirente è una
   questione separata, a valle.

9. **Correttezza della metodologia.** Il sigillo registra la citazione
   della metodologia + l'hash del documento in vigore al momento
   dell'attestazione. Non afferma che la metodologia sia
   scientificamente valida. La riforma delle metodologie avviene; il
   fatto di sigillare sotto una metodologia successivamente rivista
   non rende retroattivamente i crediti "errati" o "corretti" —
   ancora quali regole si applicavano al momento dell'emissione.

**La sezione sui limiti onesti qui sopra è la parte portante di questo
kit.** Quasi ogni questione significativa di integrità relativa a un
credito di carbonio rientra in uno di quei nove ambiti. Il sigillo
chiude lo stretto residuo: la modifica retroattiva silenziosa dei byte
a registro. Tale residuo è reale e merita di essere chiuso, ma è
piccolo rispetto al terreno contestato.

---

## Cosa questo kit DEVE RIFIUTARSI di sigillare

Il kit è configurato per respingere i seguenti schemi fattuali anche
se un utente con valida autorità di firma li sottopone:

- **"Addizionalità" enunciata come fatto.** Sigillare l'addizionalità
  come fatto crea un record fuorviante. Il kit accetta *argomentazioni*
  di addizionalità conformi alla metodologia, non *rivendicazioni* di
  addizionalità.
- **"Permanenza" senza esplicita divulgazione dell'orizzonte temporale
  e della riserva di compensazione.** Sigillare la permanenza senza
  tali parametri occulta ciò a cui il progetto si sta effettivamente
  impegnando.
- **"Assenza di leakage" senza misurazione specifica del progetto.**
  Le deduzioni di default per leakage previste dalla metodologia non
  sono misurazione e il sigillo non le tratterà come tali.
- **Quantificazioni generate prima del completamento della verifica
  da parte di terzi.** Un sigillo pre-verifica crea un falso record
  "verificato".
- **Record di emissione per crediti emessi anche su un registro
  diverso senza esplicita divulgazione cross-registro** nel FACT 06.
- **Record di ritiro che non nominino il beneficiario del ritiro.** Il
  ritiro anonimo compromette la funzione di bene pubblico del ritiro;
  il kit rifiuta di abilitarlo.
- **Dichiarazioni FPIC non supportate da hash di documentazione
  attestabile.**
- **Emissione ai sensi dell'Articolo 6.2 / 6.4 senza l'hash di una
  lettera di autorizzazione (LoA) dello Stato ospitante** sigillato
  nel FACT 06.
- **Sigillo richiesto da una parte diversa dallo sviluppatore del
  progetto + verificatore congiuntamente** per quel progetto.
- **Rivendicazioni di co-benefici sigillate come "certificate"** quando
  sono soltanto "auto-dichiarate e riviste dal verificatore".

Un rifiuto stesso può essere sigillato come fatto ("Questa parte ha
richiesto il sigillo di X; il kit ha rifiutato in base alla regola di
rifiuto Y"), creando un record pubblico di tentato uso improprio.

---

## Cosa questo kit SIGILLA

8 fatti al momento dell'attestazione:

1. **Avviso di esempio** — dichiara la pubblicazione un esempio (le
   attestazioni reali rimuovono o sostituiscono questo avviso).
2. **Identificazione del progetto** — nome del progetto, registro, ID
   progetto nel registro, citazione della metodologia + hash, hash del
   confine geografico, vintage, sviluppatore del progetto,
   rivendicazione di co-benefici, stato FPIC.
3. **Quantificazione delle emissioni o della rimozione** — tonnellate
   lorde di CO2e, controfattuale di baseline, deduzione per leakage,
   contributo alla riserva di compensazione, deduzione per incertezza,
   rivendicazione netta accreditabile, hash di ogni input numerico.
4. **Metodologia di misurazione** — fonti di dati di telerilevamento,
   rete di plot di ground-truth, hash del registro di calibrazione
   strumenti, hash del modello classificatore + statistiche di
   accuratezza, modello di densità di carbonio, provenienza del codice
   + manifesto di riproducibilità.
5. **Verifica da parte di terzi** — organizzazione del verificatore,
   accreditamento, hash della dichiarazione di indipendenza, ingaggi
   precedenti con lo sviluppatore, hash dell'archivio fotografico della
   visita in sito, rilievi sollevati + risolti, hash del documento di
   opinione di verifica.
6. **Record di emissione o ritiro** — richiesta di emissione +
   approvazione, totale crediti emessi, intervallo di serie,
   dichiarazione cross-registro, hash della LoA dello Stato ospitante
   ove applicabile, intervalli di serie ritirate + beneficiari (per le
   attestazioni di ritiro), hash dello snapshot dello stato del
   registro.
7. **Disclosure di accompagnamento e record dei rifiuti** — controversie
   metodologiche pendenti, rischio di non-permanenza, caveat sul
   leakage, caveat sull'addizionalità, hash dei FPIC + registri di
   reclamo, caveat sui co-benefici, ingaggi precedenti del
   verificatore; elenco esplicito degli schemi che il kit ha rifiutato
   di sigillare.
8. **Soggetto firmatario** — sviluppatore del progetto + verificatore +
   registro, ciascuno con ruolo + ambito dell'attestazione +
   informazioni sulla chiave crittografica.

Ogni fatto termina con la convenzione del refusal-gate: *"Questo fatto
afferma soltanto X. Non afferma Y"* (dove Y è la modalità di
fallimento più prossima dalla sezione "NON fa" qui sopra).

---

## Da cosa questo kit difende

- **Modifica retroattiva silenziosa della quantificazione.** Qualsiasi
  variazione intera al FACT 03 produce uno SHA-256 differente, una
  radice di Merkle differente, fallisce la verifica OTS.
- **Sostituzione metodologica silenziosa.** Il FACT 02 congela la
  citazione della metodologia + l'hash del documento al momento
  dell'emissione. Un sostituto di una diversa versione di metodologia
  da parte del registro dopo l'emissione è pubblicamente diffabile.
- **Revisione silenziosa della baseline.** L'hash dell'output del
  modello di scenario di baseline del FACT 03 è sigillato. Una ritaratura
  a posteriori della baseline per produrre più crediti è rilevabile.
- **Sostituzione silenziosa dell'opinione del verificatore.** L'hash
  del documento di opinione del FACT 05 è sigillato. Una riscrittura
  post-emissione del tipo "il verificatore ha sempre detto X" è
  rilevabile.
- **Sparizione silenziosa del record di ritiro.** Lo snapshot dello
  stato del registro del FACT 06 è sigillato. Crediti che
  misteriosamente tornano "disponibili" dopo essere stati contrassegnati
  come ritirati sono rilevabili rispetto al sigillo.
- **Sostituzione silenziosa dei documenti FPIC.** Gli hash dei FPIC +
  registri di reclamo del FACT 07 sono sigillati. I documenti di
  consenso sostitutivi sono rilevabili.
- **Rimozione silenziosa di disclosure scomode.** Lo stato delle
  disclosure di accompagnamento del FACT 07 è sigillato. La discreta
  rimozione di un caveat di non-permanenza da una pagina di
  descrizione del progetto è rilevabile rispetto ai byte sigillati.

Il kit NON difende dalle questioni di integrità sottostanti
(addizionalità, permanenza, leakage, sufficienza FPIC, indipendenza
del verificatore, validità metodologica). Quelli sono i problemi più
difficili e il sigillo non può risolverli.

---

## Casi storici o quasi storici in cui il kit avrebbe aiutato

Il kit avrebbe prodotto un utile àncora — *non una soluzione* — in
casi che hanno comportato la modifica retroattiva silenziosa di record
di attestazione di carbonio. NON avrebbe risolto le questioni
contestate sottostanti in alcuno di questi casi.

- **L'inchiesta del 2023 di Guardian / Die Zeit / SourceMaterial sui
  crediti di foresta pluviale di Verra.** Gli inquirenti hanno
  riscontrato che la maggior parte dei progetti REDD+ studiati ha
  prodotto crediti le cui emissioni evitate dichiarate non
  corrispondevano alla rianalisi successiva via telerilevamento.
  L'inchiesta ha richiesto la ricostruzione della documentazione di
  progetto rispetto a record di registro retroattivamente modificati.
  Una pubblicazione sigillata a ciascun ciclo di emissione avrebbe
  fornito byte di riferimento inequivocabili su quanto attestato in
  ciascun ciclo — non una soluzione al problema sottostante della
  baseline, ma una linea temporale forense pulita.

- **Gli eventi di reversione di offset forestali della California del
  2020.** Diversi progetti di carbonio forestale nell'ambito del
  mercato di conformità della California hanno subito reversioni da
  incendi che hanno superato la riserva di compensazione accantonata
  per essi. Ricostruire ciò che ciascun progetto aveva attestato in
  merito al rischio di non-permanenza *al momento dell'emissione*
  (rispetto a ciò che il progetto ha successivamente affermato di aver
  attestato) è oggi difficile. Sigilli per vintage avrebbero reso le
  attestazioni pre-incendio canonicamente recuperabili.

- **Vari progetti REDD+ in cui le metodologie di baseline per
  regione di riferimento sono state retroattivamente criticate come
  gonfiate.** Un hash sigillato del documento di metodologia al momento
  dell'emissione avrebbe ancorato quale versione di metodologia si
  applicasse effettivamente a quale vintage, rendendo diffabile la
  difesa secondo cui "la metodologia è sempre stata X".

- **Diverse controversie su progetti di rigenerazione indotta
  dall'uomo (HIR) di Australian Carbon Credit Unit (ACCU) (2022–2023).**
  La critica accademica sul fatto che la rigenerazione fosse
  effettivamente indotta dal progetto rispetto a essere naturale è
  ricaduta in dispute su ciò che il progetto aveva originariamente
  dichiarato. Attestazioni sigillate avrebbero fornito record
  inequivocabili per vintage.

- **Record di ritiro di offset di carbonio che hanno cambiato stato.**
  Diversi casi documentati di record di ritiro su registri del
  mercato volontario che appaiono cambiare stato dopo il ritiro
  (diventando "ritirati" per un motivo diverso, oppure attribuiti a un
  beneficiario diverso a posteriori). Sigilli per singolo ritiro
  avrebbero ancorato lo stato al momento del ritiro originale.

In nessuno di questi casi il kit avrebbe risolto se il credito
sottostante rappresentasse un reale beneficio climatico. Il kit ancora
i record; questo è tutto ciò che fa.

---

## Quando usare questo kit

- Sei uno sviluppatore di progetti che desidera pubblicare
  un'attestazione evidente in caso di manomissione insieme al proprio
  deposito standard presso il registro.
- Sei un verificatore terzo che desidera che la propria opinione di
  verifica sia pubblicamente verificabile rispetto a una
  rappresentazione successiva del registro su "ciò che ha detto il
  verificatore".
- Sei un registro che desidera fornire un ulteriore livello di
  integrità sui record di emissione e ritiro — in particolare per
  progetti in giurisdizioni con tutele dello stato di diritto più
  deboli a sostegno dell'integrità del registro.
- Sei un giornalista, un accademico o una ONG che conduce un'analisi
  longitudinale pluriennale su progetti di carbonio e che ha bisogno
  di un àncora pubblica per diffare le rappresentazioni successive di
  un progetto rispetto ai suoi byte al momento dell'emissione.
- Sei un acquirente (net-zero aziendale, conformità delle compagnie
  aeree) che desidera che i crediti che ritira siano ritirati a fronte
  di record pubblicamente ancorati, così che la rivendicazione di
  marketing a valle possa essere sottoposta ad audit rispetto a una
  linea temporale forense stabile.

## Quando NON usare questo kit

- **Non usare in sostituzione di una verifica accreditata da parte di
  terzi.** Il sigillo non sostituisce la verifica ISO 14064-3; si
  compone con essa.
- **Non usare per affermare che un progetto sia "addizionale",
  "permanente" o "a basso leakage".** Il sigillo non può verificare
  tali proprietà. Usare il sigillo per asserirle è un uso improprio.
- **Non usare come teatro di legittimità per crediti di bassa
  qualità.** Un sigillo crittografico su un credito di scarsa qualità
  è un record forense permanente della scarsa qualità, non una sua
  difesa. La primitiva taglia in entrambe le direzioni; questa è la
  sua onestà.
- **Non usare per sigillare crediti che vengono anche conteggiati da
  uno Stato ospitante ai fini del proprio NDC** senza un'esplicita
  divulgazione dell'aggiustamento corrispondente nel FACT 06.
- **Non sigillare pre-verifica.** Un sigillo prima che l'opinione del
  verificatore sia definitiva crea un falso record "verificato".
- **Non usare sotto pressione per omettere una disclosure di
  accompagnamento nel FACT 07** (controversie metodologiche pendenti,
  questioni FPIC, ingaggi precedenti del verificatore). Rifiuta, e
  sigilla il rifiuto.
- **Non usare come distintivo di marketing.** "MYRIAM-sealed" non è
  una rivendicazione di qualità; è una proprietà forense. Trattarla
  come un marchio di qualità è esattamente l'uso improprio che la
  progettazione constraint-first cerca di prevenire.

## Come forkare questo kit per un'attestazione reale

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Tempistica critica:** sigilla NEL momento o DOPO l'evento ufficiale
di emissione del registro, NON prima. Un sigillo pre-emissione crea
un falso record "emesso". Per le attestazioni di ritiro, sigilla NEL
momento del ritiro. Per le attestazioni di monitoraggio continuativo
tra emissione e ritiro, sigilla a ciascun ciclo di monitoraggio
controfirmato dal verificatore — ma chiarisci nel FACT 01 che
l'attestazione è un aggiornamento di monitoraggio, non un'emissione.

## Integrazione con l'infrastruttura di carbonio esistente

- **Verra (VCS).** L'URL della pubblicazione sigillata o il CID IPFS
  possono essere allegati alla pagina del progetto VCS come
  documentazione supplementare. Il sigillo non sostituisce la verifica
  VCS; si compone con essa.
- **Gold Standard.** Stesso modello di integrazione — attestazione
  supplementare insieme alla documentazione di emissione Gold Standard.
  L'enfasi di Gold Standard sui co-benefici + documentazione del
  beneficio per la comunità si mappa naturalmente su FACT 02 + FACT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Stesso modello di integrazione.
- **Articolo 6.4 (meccanismo dell'Organismo di Vigilanza dell'Accordo
  di Parigi).** L'hash della LoA dello Stato ospitante nel FACT 06 è
  specificamente progettato per la tracciabilità ITMO ai sensi
  dell'Articolo 6.4 / 6.2. La divulgazione dell'aggiustamento
  corrispondente è un campo soggetto a refusal-gate.
- **EU ETS MRV.** Per gli emittenti del mercato di conformità, l'hash
  del report MRV si mappa sull'hash del foglio di calcolo di
  quantificazione del FACT 03. Il sigillo si compone con — non
  sostituisce — il report di emissioni verificato dell'operatore.
- **CDP (Carbon Disclosure Project) disclosure aziendale.** Per le
  aziende che citano crediti ritirati nelle proprie submission CDP, il
  record di ritiro sigillato nel FACT 06 è il record canonico
  recuperabile. Il linguaggio di submission CDP può riferirsi alla
  radice di Merkle o al CID IPFS della pubblicazione sigillata.
- **ISO 14064-2 (progetto) / ISO 14064-3 (verifica) / ISO 14065
  (accreditamento).** Il sigillo registra l'asserzione di conformità +
  gli hash; non esegue la valutazione di conformità.
- **TSVCM Core Carbon Principles (CCP) / etichette ICVCM.** Laddove un
  progetto sia stato valutato rispetto ai CCP dell'ICVCM, l'hash
  del risultato della valutazione può essere sigillato nel FACT 07
  come disclosure di accompagnamento.

## Cosa questo kit NON sostituisce

- La verifica accreditata da parte di terzi (ISO 14064-3)
- I flussi di lavoro di emissione e ritiro del registro
- La valutazione di conformità metodologica
- I processi di autorizzazione dello Stato ospitante per le
  transazioni ai sensi dell'Articolo 6
- I processi MRV del mercato di conformità (EU ETS, California
  Cap-and-Trade, RGGI, ecc.)
- Le iniziative di integrità del mercato volontario (ICVCM, VCMI)
- La valutazione indipendente dell'impatto climatico

## Perché questo kit esiste in v0.4.0+

Questo è il 7° esempio lavorato distribuito con myriam-kit. Il kit
esiste perché i mercati dei crediti di carbonio hanno una
documentata storia di modifica retroattiva silenziosa — metodologie
reinterpretate retroattivamente, baseline riviste retroattivamente,
record di ritiro che cambiano stato e disclosure di progetto che nel
tempo abbandonano discretamente i caveat scomodi.

Il sigillo chiude lo *stretto* residuo dei byte al momento
dell'attestazione. Non affronta — e non può affrontare — le più ampie
questioni contestate di addizionalità, permanenza, leakage o
autenticità dei co-benefici. L'inquadramento onesto di tale
limitazione da parte del kit è la sua caratteristica più importante.

## Licenza

Pubblico dominio (CC0). Forkalo. Nessuna attribuzione richiesta.
