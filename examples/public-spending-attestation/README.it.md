# Kit di sigillatura per attestazioni di spesa pubblica

*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

Un esempio chiavi in mano di myriam-kit per amministrazioni comunali,
statali, provinciali e nazionali che intendono ancorare crittografica-
mente i registri di esecuzione del bilancio (aggiudicazioni di
contratti, erogazioni, accettazioni di prestazioni) nel momento
dell'emissione, in modo che una modifica retroattiva silenziosa dei
registri di spesa pubblica diventi pubblicamente rilevabile.

Il sigillo è un **ancoraggio forense**, non una certificazione di
integrità. Registra ciò che l'autorità finanziaria ha riferito nel
giorno in cui lo ha riferito, in una forma che non può poi essere
silenziosamente revisionata senza produrre una discrepanza
crittografica pubblicamente visibile.

---

## Cosa questo kit NON fa (da leggere per primo)

Il sigillo è una marca temporale crittografica di ciò che è stato
attestato. Non può verificare se quanto attestato fosse **lecito,
equo o onesto**. Le seguenti modalità di fallimento sono **al di
fuori del dominio del sigillo**:

1. **Corruzione a monte e tangenti.** Se un appalto è stato truccato,
   un fornitore è stato selezionato a causa di una tangente, una
   giustificazione di affidamento diretto è stata fabbricata, o un
   contratto è stato gonfiato di una percentuale di tangente concordata
   — il sigillo ancora la transazione così come registrata, con il
   prezzo gonfiato e il fornitore prediletto, ad alta integrità. Il
   sigillo osserva l'output del sistema finanziario; non ha alcuna
   visibilità sulla corruzione a monte dell'emissione. La *Operação
   Lava Jato* brasiliana ha documentato tangenti sistematiche di circa
   il 3% amministrate da un cartello su migliaia di contratti
   Petrobras, che sarebbero stati sigillati all'emissione come se
   fossero del tutto ordinari.

2. **Occultamento della titolarità effettiva tramite società di
   comodo.** Un contratto aggiudicato a "Acme Construction Ltd." è
   sigillato con il nome dell'entità presente nel registro pubblico.
   Se "Acme" è di fatto controllata da una persona politicamente
   esposta non dichiarata, o è una delle decine di società di comodo
   controllate da un singolo cartello, il sigillo ancora l'entità di
   superficie. La trasparenza sulla titolarità effettiva è un regime
   SEPARATO (Raccomandazione 24 del FATF, 5AMLD/6AMLD dell'UE,
   Corporate Transparency Act degli USA) il cui output richiede un
   proprio protocollo di sigillatura.

3. **Frode contabile a monte dell'emissione.** Se l'autorità
   finanziaria stessa fabbrica il registro prima della sigillatura
   — contratti fantasma, dipendenti fittizi nel libro paga,
   accettazioni di prestazioni inventate — il sigillo ancora la
   fabbricazione. Il sigillo non può rilevare che il registro sia
   falso nel momento in cui viene registrato; può solo rilevare che
   il registro è stato modificato DOPO la sigillatura.

4. **Pubblicazione selettiva / cherry-picking.** Un'autorità
   finanziaria potrebbe pubblicare un *sottoinsieme* di transazioni
   — quelle pulite — e sigillare solo quelle. Il sigillo ancora ciò
   che è nella pubblicazione; non ancora l'universo delle transazioni
   che avrebbero dovuto esservi contenute. Il FATTO 07 di questo kit
   (informativa di accompagnamento e registro dei rifiuti) costituisce
   la difesa strutturale, ma dipende dall'onestà dell'autorità emittente
   riguardo a ciò che sceglie di non sigillare.

5. **Spesa fuori bilancio o extra-bilancio.** La spesa pubblica
   incanalata attraverso imprese statali, fondi sovrani, veicoli di
   scopo o conti fiduciari extra-bilancio può non comparire nel
   bilancio ancorato dal sigillo. Il sigillo registra ciò che è stato
   riferito all'interno del sistema di bilancio; la spesa esterna al
   sistema è al di fuori del dominio del sigillo. Le controversie
   sull'Autorità Provvisoria della Coalizione (CPA) in Iraq 2003–2004
   hanno riguardato circa 9 miliardi di dollari USA in erogazioni in
   contanti i cui registri sono andati parzialmente perduti; sigillare
   ciò che esisteva nel momento dell'erogazione li avrebbe ancorati,
   ma non avrebbe creato registri che la CPA non manteneva.

6. **Pressione di "rinarrazione" post-emissione.** Uno sforamento
   sigillato, un affidamento diretto sigillato o una variante
   contrattuale sigillata possono essere ri-narrati in seguito con
   l'inquadramento che l'autorità politica desidera. Il sigillo
   ancora i FATTI alla data di emissione, ma non pregiudica la
   narrazione che quei fatti supporteranno successivamente.

7. **Attestazione coercita.** Se il responsabile finanziario è
   costretto a firmare un'attestazione che travisa le transazioni,
   il sigillo ancora l'attestazione coercita con la firma coercita.
   Il sigillo verifica CHI ha firmato (FATTO 08), non PERCHÉ abbia
   firmato. Sigillare un'attestazione coercita produce un registro
   pubblico permanente dell'output coercito — utile per successive
   azioni di responsabilità, ma non una difesa contro la coercizione
   nel momento.

8. **Confronto tra giurisdizioni.** Una spesa sigillata è leggibile
   solo rispetto al regime giuridico della giurisdizione emittente.
   "Perché il Comune X ha pagato Y per il servizio Z quando il
   Comune W ha pagato solo V?" è una domanda di analisi comparativa
   a valle della sigillatura. Il benchmark interscambievole tra
   giurisdizioni è un compito analitico sui dati sigillati, non una
   proprietà del sigillo.

**La sezione sui limiti onesti qui sopra è la parte portante di
questo kit.** I funzionari finanziari e i politici che credono che
sigillare equivalga a integrità useranno questo kit come scudo. Il
kit deve dire chiaramente: questa è una *primitiva di
non-ripudio per il momento dell'emissione*, non una prova di
integrità della spesa.

---

## Cosa questo kit DEVE RIFIUTARE di sigillare

Il kit è configurato per respingere le seguenti casistiche di fatti
anche se un utente con valida autorità di firma le sottopone:

- **Nomi di singoli dipendenti pubblici al di sotto del livello di
  firma principale.** Nessun fatto può nominare singoli dipendenti
  degli uffici appalti, singoli cassieri di tesoreria, singoli
  componenti delle commissioni giudicatrici, o qualsiasi persona
  fisica non in un ruolo di responsabilità pubblica. Il rischio di
  esposizione a ritorsioni per il personale di linea supera il
  beneficio di trasparenza; le loro identità sono sigillate nei
  controlli interni (hash FATTO 05 del registro delle firme), non nel
  corpo dell'attestazione.

- **PII dei fornitori.** Nessun fatto può includere coordinate
  bancarie del fornitore, nomi di singoli dipendenti del fornitore,
  indirizzi di residenza del fornitore, codici fiscali di persone
  fisiche, scomposizioni interne dei prezzi che contengano la
  struttura dei costi del fornitore, o qualsiasi altro campo di
  PII commerciale la cui pubblicazione danneggi gli interessi del
  fornitore senza servire l'anticorruzione. Tali informazioni
  possono essere HASHATE (FATTO 05) ma non pubblicate.

- **Spese classificate per sicurezza.** Le spese classificate ai
  sensi di norme sulla sicurezza nazionale NON sono idonee alla
  sigillatura sotto questo kit. Il trattamento di materiale classificato
  è un problema diverso con requisiti crittografici e giuridici
  diversi. L'esclusione stessa è dichiarata nel FATTO 07 R3 affinché
  il lettore sappia che la pubblicazione è parziale per progettazione.

- **Esecuzione civile di obblighi tributari nei confronti di persone
  fisiche identificate.** Anche se i costi di esecuzione sono spese
  pubbliche, nominare singoli contribuenti soggetti a esecuzione è
  rifiutato: il danno alla privacy supera il beneficio di trasparenza
  e una trasparenza parallela esiste già nei rapporti della
  giustizia tributaria.

- **Transazioni pre-emissione.** Nessun contratto prima
  dell'aggiudicazione formale; nessuna erogazione prima dell'emissione
  formale. Sigillare un contratto in bozza o un pagamento in attesa
  come se fosse stato eseguito crea una falsa certezza.

- **Sigillatura da parte di soggetti diversi dal responsabile
  finanziario.** Un appaltatore, fornitore, consigliere comunale,
  giornalista o osservatore non può sigillare "il registro della
  spesa pubblica" al posto dell'autorità finanziaria che l'ha emesso.
  (Possono sigillare le proprie osservazioni sotto il proprio
  principale firmatario, in una pubblicazione separata.)

- **Inquadramenti del tipo "esente da corruzione".** Il kit rifiuta
  di sigillare qualsiasi inquadramento della forma "questa spesa era
  lecita e priva di corruzione" o "l'appalto era dimostrabilmente
  equo". Tali affermazioni sono epistemicamente fuori dal dominio
  del kit.

- **Pubblicazioni che omettano l'informativa di accompagnamento del
  FATTO 07.** Una pubblicazione di transazioni senza l'accompagnatoria
  informativa e registro dei rifiuti non è una pubblicazione MYRIAM
  legittima sotto questo kit.

Un rifiuto stesso può essere sigillato come fatto ("Questa parte ha
richiesto la sigillatura di X; il kit ha rifiutato in base alla
regola di rifiuto Y"), creando un registro pubblico del tentato uso
improprio. In un dominio in cui la pressione politica sui funzionari
finanziari è documentata, un registro di richieste *rifiutate* è
esso stesso un segnale di integrità.

---

## Cosa questo kit SIGILLA

8 fatti nel momento dell'attestazione di esecuzione del bilancio:

1. **Avviso di esempio** — dichiara la pubblicazione un esempio (le
   attestazioni reali rimuovono o sostituiscono questo avviso).
2. **Giurisdizione e fondamento giuridico** — quale ente
   governativo emette, in base a quale autorità statutaria, in
   quale esercizio finanziario.
3. **Riferimento di stanziamento o di bilancio** — le specifiche
   voci nel bilancio approvato che vengono eseguite, con hash dello
   strumento di bilancio ed eventuali emendamenti / storni /
   riprogrammazioni applicati.
4. **Manifesto dei contratti o delle erogazioni** — registrazione per
   ogni transazione: importo, denominazione legale del fornitore
   (nessuna PII di persone fisiche), oggetto, data, tipo di procedura,
   base di aggiudicazione, hash del documento contrattuale.
5. **Hash dei documenti giustificativi** — SHA-256 di bandi,
   valutazioni, contratti stipulati, varianti, stati di avanzamento,
   verbali di accettazione delle prestazioni, registrazioni del libro
   mastro di tesoreria, registri dei controlli e delle firme di
   approvazione. Solo hash, non contenuti — per proteggere le PII
   commerciali e personali consentendo al contempo la verifica
   tramite ri-hashing.
6. **Stato dell'audit e della vigilanza** — quale organo di
   controllo interno ha giurisdizione, quale istituzione superiore
   di controllo, quale organo inquirente ha giurisdizione sui reati
   di corruzione, scadenze di audit, stato attuale di eventuali
   revisioni in corso.
7. **Informativa di accompagnamento e registro dei rifiuti** —
   ricorsi sulle procedure di affidamento in corso, indagini interne
   in corso, richieste di accesso (FOI) pendenti, revisioni dissenzienti,
   sforamenti noti delle voci di bilancio; elenco esplicito delle
   casistiche che il kit ha rifiutato di sigillare.
8. **Principale firmatario** — funzionario finanziario responsabile
   + ruolo + responsabilità statutaria + co-firmatari in regime di
   doppio controllo; ciò che ciascun firmatario sta e ciò che non sta
   personalmente attestando.

Ogni fatto si chiude con la convenzione di cancello-rifiuto: *"Questo
fatto asserisce solo X. Non asserisce Y"* (dove Y è la modalità di
fallimento più vicina dalla sezione "NON fa").

---

## Da cosa questo kit difende

- **Revisione silenziosa post-emissione degli importi contrattuali.**
  Qualsiasi modifica a qualsiasi importo nel FATTO 04 produce un
  diverso SHA-256, una diversa radice di Merkle, fa fallire la verifica
  OTS.
- **Sostituzione silenziosa del fornitore.** Sostituire "Fornitore A"
  con "Fornitore B" su un contratto già emesso è rilevabile dai byte
  sigillati.
- **Retrodatazione delle varianti.** Il FATTO 04 congela la data e la
  motivazione della variante all'emissione; qualsiasi successiva
  affermazione del tipo "questo era sempre stato l'ambito concordato"
  deve confrontarsi con il registro della variante sigillato.
- **Scomparsa silenziosa di transazioni sfavorevoli.** Tutte le
  transazioni emesse nel periodo sono nel FATTO 04 sotto un'unica
  radice di Merkle. La pubblicazione di un sottoinsieme è rilevabile
  dall'elenco degli hash foglia.
- **Soppressione delle informative di accompagnamento.** Il FATTO 07
  congela lo stato dei ricorsi pendenti, delle indagini pendenti e
  delle richieste FOI pendenti nel momento dell'attestazione.
  Qualsiasi successiva affermazione del tipo "non abbiamo mai saputo
  di quel ricorso" è pubblicamente confrontabile in diff.
- **Deriva della giurisdizione di audit.** Il FATTO 06 congela quali
  organi hanno giurisdizione di vigilanza sulle transazioni sigillate.
  Una successiva affermazione che un particolare organo di controllo
  "non avesse competenza" deve confrontarsi con il registro di
  giurisdizione sigillato.
- **Cancellazione del registro dei rifiuti.** Il FATTO 07 registra ciò
  che il kit ha rifiutato di sigillare; qualsiasi successiva affermazione
  del tipo "non abbiamo mai rifiutato nulla" contraddice il registro
  sigillato.

---

## Casi storici in cui il kit avrebbe aiutato

Il kit avrebbe prodotto un utile **ancoraggio forense** — *non una
soluzione, non una prevenzione, non un sostituto dell'azione penale* —
in casi documentati di pubblico dominio che coinvolgono modifica
retroattiva silenziosa di registri di spesa pubblica:

- **Brasile — filiera *Operação Lava Jato* / Petrobras (2014–2021).**
  I pubblici ministeri federali brasiliani hanno documentato un
  cartello di grandi imprese di costruzione che per oltre un
  decennio ha pagato tangenti pari in media a circa il 3% su contratti
  Petrobras e altri contratti federali di infrastruttura, con la
  tangente convogliata a politici e al coordinamento dei prezzi del
  cartello stesso. I contratti, così come emessi, apparivano ordinari;
  la corruzione era a monte dell'emissione. Un kit di sigillatura NON
  avrebbe prevenuto Lava Jato (le tangenti erano integrate nel prezzo
  PRIMA che il contratto raggiungesse il sigillo), ma avrebbe ancorato
  i termini contrattuali all'emissione — rendendo la successiva
  ricostruzione forense di "cosa diceva effettivamente ciascun
  contratto quando fu firmato" enormemente più economica. Gran parte
  del costo investigativo di Lava Jato è stato il costo di
  ricomposizione delle linee temporali da archivi incoerenti.

- **Unione Europea — controversie sui fondi di sviluppo regionale
  (più Stati membri, anni 2010–2020).** Le relazioni annuali della
  Corte dei conti europea hanno ripetutamente identificato tassi di
  errore materiale nelle spese del Fondo europeo strutturale e di
  investimento (ESIF) e del Fondo di coesione, in alcuni anni
  eccedenti la soglia di materialità. Le controversie su "cosa è
  stato effettivamente richiesto" rispetto a "cosa è stato
  effettivamente fornito" si ripetono perché la documentazione delle
  richieste può essere modificata tra sottomissione e audit. La
  sigillatura MYRIAM per ogni emissione della richiesta-così-come-
  sottoposta avrebbe ancorato i contenuti di ciascuna richiesta alla
  sottomissione, separando "cosa il beneficiario ha sostenuto in quel
  momento" da "cosa la ricostruzione post-audit ha concluso."

- **Iraq — erogazioni dell'Autorità Provvisoria della Coalizione (CPA),
  2003–2004.** La CPA ha erogato circa 9 miliardi di dollari USA in
  contanti dal Fondo di Sviluppo per l'Iraq con documentazione che il
  Special Inspector General for Iraq Reconstruction (SIGIR) e le
  successive relazioni di audit hanno descritto come sostanzialmente
  incompleta. Le controversie sui registri delle erogazioni
  persistono a due decenni di distanza. La sigillatura al momento
  dell'erogazione non avrebbe creato registri che la CPA non manteneva
  — ma laddove un registro esisteva (libri mastri manoscritti,
  autorizzazioni di trasferimento datate), un sigillo contemporaneo
  avrebbe ancorato lo stato byte per byte di quel registro al momento
  dell'emissione, separando "il registro al tempo" da "il registro
  così come ricostruito in seguito."

- **Grecia — debito sovrano e revisioni della rendicontazione della
  spesa pubblica (2009–2010).** Gli audit di Eurostat del 2009–2010
  hanno documentato sostanziali revisioni dei dati fiscali greci
  precedentemente riportati, con la metodologia di revisione essa
  stessa contestata. La sigillatura dei rapporti trimestrali di
  spesa al momento della pubblicazione originale avrebbe reso il
  *delta* tra rapporti originali e revisionati pubblicamente
  confrontabile in diff anziché ricostruibile solo tramite confronto
  d'archivio. Il sigillo non avrebbe prevenuto la disputa metodologica
  sottostante, ma avrebbe ancorato ogni trimestre riportato al
  momento del rapporto originale.

- **Regno Unito — appalti pandemici (2020–2022).** Le relazioni
  del National Audit Office britannico e dei comitati parlamentari
  hanno identificato procedure di appalto durante il 2020–2021 in
  cui i contratti sono stati aggiudicati con clausole emergenziali e
  con ridotta concorrenza e ridotta documentazione; alcune
  aggiudicazioni sono state successivamente modificate, annullate o
  transatte. La sigillatura per ogni emissione di ciascuna
  aggiudicazione emergenziale avrebbe ancorato la motivazione e i
  termini dell'aggiudicazione al momento dell'aggiudicazione,
  rendendo le successive modifiche un delta pubblicamente visibile
  anziché un registro silenziosamente modificato.

- **Sudafrica — contratti di imprese pubbliche dell'era della
  "cattura dello Stato" (~2010–2018).** La Commissione Zondo ha
  documentato contratti presso varie imprese statali (Eskom,
  Transnet, Denel) la cui documentazione era variamente incompleta,
  rivista o contestata. La sigillatura di ciascuna aggiudicazione
  contrattuale all'emissione avrebbe ancorato lo stato così come
  aggiudicato del registro, separando i risultati della ricostruzione
  forense successiva dal registro contemporaneo.

Il kit NON avrebbe prevenuto la corruzione sottostante in nessuno
dei casi di cui sopra. In diversi casi il problema sottostante era
che la corruzione era *a monte dell'emissione* — il sigillo ancora
il contratto corrotto con alta integrità, che è un tipo di utilità
diverso (ancoraggio forense per la responsabilità successiva) ma
non lo stesso della prevenzione. In altri casi (contanti della CPA,
spesa fuori bilancio) il problema sottostante era che i registri da
sigillare non esistevano o non venivano mantenuti — il kit non può
creare registri che l'autorità non ha prodotto.

Questi casi storici sono citati solo con riferimento a riscontri
documentati pubblicamente (atti giudiziari, relazioni di comitati
parlamentari, pubblicazioni di organi di audit). Non viene formulata
alcuna affermazione su singoli individui; i riscontri istituzionali
documentati rimangono agli atti pubblici.

---

## Quando usare questo kit

- La vostra giurisdizione dispone di un processo consolidato di
  rendicontazione dell'esecuzione del bilancio e desidera aggiungere
  un ancoraggio pubblico immutabile.
- Vi aspettate scrutinio post-emissione (richieste FOI, audit,
  monitoraggio della società civile, indagine giornalistica) e
  desiderate un punto di riferimento evidente alle manomissioni.
- Avete autorità giuridica in base alla normativa di trasparenza /
  accesso agli atti per pubblicare l'insieme dei fatti elencati,
  rispettando le esclusioni per privacy/sicurezza.
- Operate in un regime di audit statutario (controllo interno,
  istituzione superiore di controllo) e desiderate ancorare ciascuna
  chiusura trimestrale prima che il ciclo di audit la raggiunga.
- Pubblicate secondo l'Open Contracting Data Standard o IATI e
  desiderate un complemento crittografico alla pubblicazione su
  portale.

## Quando NON usare questo kit

- **Non usatelo come sostituto dell'audit statutario, della revisione
  da parte del controllo interno, dell'indagine inquirente o del
  monitoraggio della società civile.** Il kit è *additivo*, non un
  sostituto.
- **Non usatelo come certificato di legittimità.** Un registro di
  spesa sigillato non è un certificato di assenza di corruzione.
  Trattarlo come tale è esattamente la modalità di fallimento che la
  struttura vincoli-in-prima-istanza del kit esiste per prevenire.
- **Non usatelo a metà periodo.** Il kit è per il momento
  dell'emissione formale (chiusura trimestrale, aggiudicazione del
  contratto, erogazione di milestone). I sigilli a metà periodo
  creano riferimenti fuorvianti.
- **Non usatelo per affermare che la spesa fosse lecita, equa o non
  corrotta** — il kit non può farlo.
- **Non usatelo per sigillare spese classificate, PII di singoli
  dipendenti o PII commerciali del fornitore.** Il kit rifiuta queste
  casistiche; tentarle crea un registro dei rifiuti (FATTO 07).
- **Non usatelo per sigillare bozze pre-emissione.** Le bozze possono
  essere sigillate sotto un diverso tipo di attestazione ("bozza
  per consultazione, non emessa"), ma non sotto il tipo di emissione
  di questo kit.
- **Non usatelo sotto pressione di omettere le informative del FATTO
  07.** Rifiutate e sigillate il rifiuto.
- **Non usatelo se la vostra autorità finanziaria è catturata.** Una
  spesa fraudolenta sigillata è un registro pubblico permanente
  della frode, non una difesa di essa. La primitiva taglia in
  entrambe le direzioni; quella è la sua onestà.

---

## Come forkare questo kit per un'attestazione reale

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # sostituite il contenuto fittizio con quello reale
bash build/seal.sh         # sigillate al momento dell'emissione formale
python3 build/verify.py    # confermate
```

**Timing critico:** sigillate AL momento dell'emissione formale —
ovvero il momento in cui il responsabile finanziario firma la
chiusura trimestrale, il momento in cui un contratto viene
formalmente aggiudicato o il momento in cui un'erogazione viene
formalmente emessa. Un sigillo prima dell'emissione formale crea un
falso positivo del tipo "questo è il registro ufficiale". Un sigillo
molto dopo l'emissione formale è forensicamente più debole contro
modifiche intervenute nel frattempo.

**Cadenza:** il kit è progettato per attestazioni trimestrali come
impostazione predefinita. Sono supportate cadenze sub-trimestrali
(chiusura mensile, sigillatura per singola transazione) ri-eseguendo
con ambito appropriato; il sigillo di una singola transazione di
alto valore è un uso legittimo.

---

## Integrazione con l'infrastruttura esistente di finanza pubblica

Il kit è progettato per comporsi con, non sostituire:

- **Open Contracting Data Standard (OCDS) v1.1.5.** I cinque punti
  di pubblicazione (planning, tender, award, contract, implementation)
  si mappano naturalmente sul FATTO 03 (planning → stanziamento),
  FATTO 04 (tender, award, contract, implementation → manifesto delle
  transazioni) e FATTO 05 (hash dei documenti giustificativi).
  L'esportazione JSON OCDS stessa è sigillata nel FATTO 05 (documenti
  di controllo). Una giurisdizione che esegue la pubblicazione OCDS
  può aggiungere la sigillatura MYRIAM come strato crittografico
  sopra il proprio portale esistente.

- **International Aid Transparency Initiative (IATI) standard v2.03.**
  Per spese finanziate in tutto o in parte da aiuti esterni, l'XML
  IATI può essere sigillato come documento di controllo; il sigillo
  fornisce un complemento crittografico al modello di pubblicazione
  basato su HTTP del Registro IATI.

- **Impegni della Open Government Partnership (OGP).** I Piani
  d'Azione Nazionali OGP includono frequentemente impegni di
  trasparenza fiscale; la sigillatura MYRIAM operativizza un impegno
  di "pubblicazione evidente alle manomissioni" in un modo che è
  verificabile indipendentemente dalla società civile senza
  richiedere fiducia nel portale del governo.

- **Raccomandazione OECD sull'Integrità Pubblica (2017).** Il kit
  supporta la Raccomandazione 4 (dati di governo aperto sulla
  finanza pubblica in forma leggibile da macchina e tempestiva)
  rendendo i dati crittograficamente ancorati oltre che leggibili da
  macchina.

- **Convenzione delle Nazioni Unite contro la Corruzione (UNCAC),
  in particolare gli Articoli 9 (appalti) e 13 (partecipazione della
  società).** Il kit fornisce una primitiva forense che supporta gli
  obblighi di trasparenza dell'Articolo 9 e la vigilanza della
  società civile dell'Articolo 13.

- **Istituzioni Superiori di Controllo (SAI) — quadro INTOSAI.** Le
  SAI che operano secondo gli standard INTOSAI (ISSAI) possono
  consumare le pubblicazioni sigillate come evidenza ad alta
  integrità; gli hash SHA-256 nel FATTO 05 sono gli stessi hash che
  gli strumenti di e-audit della SAI possono ricalcolare.

- **Uffici di controllo interno.** Gli uffici di controllo interno
  nazionali con giurisdizione sulle spese sigillate (FATTO 06)
  possono richiedere i corpi documentali i cui hash sono sigillati
  nel FATTO 05; il sigillo lega i corpi documentali ricevuti su
  richiesta a quelli che esistevano al momento dell'emissione.

- **Normativa di libertà d'informazione e accesso agli atti.** Il
  sigillo non esime l'autorità emittente dagli obblighi FOI
  continui; di fatto, rende rilevabile la risposta FOI selettiva
  come una deviazione dal registro sigillato. Il FATTO 07 C3 ancora
  le richieste FOI pendenti al momento dell'attestazione.

- **Registri della titolarità effettiva (Raccomandazione 24 del FATF,
  direttive AML UE, US Corporate Transparency Act).** I dati di
  titolarità effettiva NON sono sigillati sotto questo kit (il FATTO
  04 ricava l'identità del fornitore solo dalla denominazione legale
  registrata). Un'informativa sulla titolarità effettiva è un regime
  di sigillatura separato che può produrre una pubblicazione
  parallela referenziata tramite radice di Merkle.

- **Trasparenza amministrata dai tribunali (rendicontazione della
  spesa giudiziaria, procedure di recupero di beni).** Gli output
  dei procedimenti giudiziari connessi alla corruzione non rientrano
  nell'ambito di questo kit ma possono essere sigillati sotto tipi di
  attestazione paralleli.

## Cosa questo kit NON sostituisce

- L'audit statutario dell'esecuzione del bilancio da parte degli
  organi di controllo interno
- La revisione dell'istituzione superiore di controllo (GAO, NAO,
  TCU, CAG, AGN, BRH, Cour des comptes, Corte dei conti italiana,
  equivalenti)
- L'indagine inquirente sui reati di corruzione (pubblici ministeri
  nazionali anticorruzione, organismi ex Articolo 36 UNCAC)
- L'inchiesta giornalistica e della società civile
- I canali di segnalazione e i regimi di protezione del whistleblowing
- L'informativa sulla titolarità effettiva
- La revisione tra pari internazionale (OECD, Valutazione di
  Trasparenza Fiscale dell'IMF, semestre UE, registro IATI)
- I procedimenti giudiziari di recupero dei beni

Il sigillo è una primitiva forense che abbassa il costo e aumenta
l'affidabilità di tutti gli elementi di cui sopra. Non è, e non
può essere, un sostituto di nessuno di essi.

---

## Licenza

Pubblico dominio (CC0). Forkatelo. Nessuna attribuzione richiesta.
