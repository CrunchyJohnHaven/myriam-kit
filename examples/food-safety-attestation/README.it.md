*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

# Kit di Attestazione di Sicurezza Alimentare

Un esempio chiavi in mano di myriam-kit per produttori di alimenti,
ispettori per la sicurezza alimentare, certificatori terzi e autorità
regolatorie che desiderano pubblicare un sigillo ancorato a Bitcoin
ed evidente in caso di manomissione, che attesti *ciò che i test di
rilascio hanno detto* e *quale decisione di rilascio è stata presa*,
nel momento del rilascio del lotto o della firma del rapporto di
ispezione — affinché la modifica silenziosa, successiva al rilascio,
del registro delle prove, della decisione di rilascio o degli impegni
di richiamo diventi pubblicamente rilevabile.

---

## Cosa questo kit NON fa (da leggere per primo)

Il sigillo è una marca temporale crittografica di QUALI test di
rilascio sono stati eseguiti su QUALE lotto, da QUALI laboratori
accreditati, secondo QUALI metodi, con QUALI risultati, e di QUALE
DECISIONE DI RILASCIO l'autorità di assicurazione qualità ha preso
sulla base di tali risultati. Non può rispondere ad alcuna domanda
sulla sicurezza alimentare oltre a questo. Quanto segue è **fuori
dal dominio del sigillo**:

1. **Prevenire la contaminazione.** Il kit ancora ciò che i risultati
   dei test HANNO DETTO al rilascio. La contaminazione ha molte
   cause — distribuzione microbica eterogenea all'interno di un lotto,
   abuso di temperatura post-rilascio nella distribuzione, errori di
   manipolazione al dettaglio, errori di preparazione da parte del
   consumatore, pericoli nuovi o non sottoposti a screening (per es.
   adulterazione con melamina prima che lo screening della melamina
   fosse di routine), frode nella catena di approvvigionamento a monte
   dell'ambito di test del produttore. Il sigillo non previene nessuno
   di questi fenomeni e non pretende di farlo.

2. **Garantire che tutte le unità di un lotto conforme siano sicure.**
   La contaminazione microbiologica nel prodotto alimentare sfuso è
   ETEROGENEA. Listeria, Salmonella e i patogeni STEC compaiono in
   focolai localizzati a bassa prevalenza, non distribuiti in modo
   uniforme. I piani di campionamento dell'ICMSF e del Codex hanno una
   probabilità documentata e limitata di rilevare contaminazione
   presente a bassa prevalenza — tale probabilità NON è 1. Un lotto
   che supera il campionamento di rilascio può comunque contenere
   unità contaminate non campionate. Il sigillo ancora i CAMPIONI, non
   lo sfuso. Questo vincolo è ribadito esplicitamente nel FACT 03 ed è
   il singolo limite onesto più importante di questo kit.

3. **Certificare che i test di rilascio siano stati eseguiti
   onestamente.** Il sigillo ancora ciò che i test hanno riportato al
   rilascio. Un laboratorio che riporta un PASS fraudolento al rilascio
   produce un sigillo crittograficamente valido di un PASS fraudolento.
   Il kit rende rilevabile la successiva modifica silenziosa, ma non
   rileva la frode contemporanea. La rilevazione della frode
   contemporanea richiede audit, supervisione dell'accreditamento di
   laboratorio (sorveglianza ISO 17025), programmi di proficiency
   testing e ispezione regolatoria — tutti a monte del sigillo.

4. **Sostituire le submission regolatorie ai sensi di FSMA, FSIS o
   competent-authority dell'UE.** I registri di rilascio ai sensi di
   FSMA, FSIS, Regolamento UE (CE) 178/2002 e Codex Alimentarius sono
   mantenuti per legge e prodotti su richiesta del regolatore. Il
   sigillo aggiunge uno strato pubblico evidente in caso di
   manomissione SOPRA tali submission; NON le sostituisce. Una
   pubblicazione sigillata non è un deposito regolatorio.

5. **Risolvere controversie sull'ambito del richiamo.** Il kit può
   sigillare gli impegni di richiamo presi al rilascio (FACT 06) e un
   successivo ambito di richiamo come nuova pubblicazione; ma il
   confine di quali lotti sono interessati, quali unità sono state
   spedite, quali rivenditori le hanno ricevute e quali consumatori
   sono stati esposti rimane un'indagine di trace-back e
   trace-forward. Il sigillo ancora ciò a cui il produttore SI È
   IMPEGNATO e ciò che ha successivamente FATTO. Non risolve la
   sottostante questione epidemiologica.

6. **Rilevare frode deliberata nella catena di approvvigionamento a
   monte dei test.** L'adulterazione con melamina di latte e formula
   per lattanti in Cina nel 2008 ebbe successo perché la melamina non
   era nel pannello di analiti — la misurazione equivalente-proteine
   da contenuto di azoto lo era, e la melamina la ingannava. Un FACT
   03 sigillato con il pannello di analiti in uso all'epoca si sarebbe
   impegnato pubblicamente a quel pannello — ma non avrebbe fatto
   nulla per rilevare l'adulterante fuori dal pannello. Il valore del
   sigillo in quel caso sarebbe stato il radicamento forense di "ecco
   ciò che il produttore ha dichiarato di testare", NON la prevenzione.
   Un vero regime di sicurezza alimentare affronta questo aspetto
   attraverso il campionamento non annunciato da parte del regolatore
   con screening ad ampio spettro (metodi LC-MS non mirati, ad
   esempio), che è a monte del sigillo del produttore.

7. **Ancorare la distribuzione post-rilascio e la manipolazione da
   parte del consumatore.** Una volta che il lotto lascia lo
   stabilimento, l'abuso di temperatura durante la distribuzione, gli
   errori di manipolazione al dettaglio, gli errori di conservazione
   da parte del consumatore e gli errori di preparazione da parte del
   consumatore sono tutti fuori ambito. Il sigillo è circoscritto
   all'evento di rilascio del produttore. L'evidenza di manomissione a
   valle richiede kit separati a livello del distributore, del
   rivenditore e (per i consumatori istituzionali come scuole e
   ospedali) del punto di utilizzo.

8. **Garantire la sicurezza degli alimenti per qualunque popolazione
   specifica.** I risultati PASS del FACT 03 non implicano sicurezza
   per consumatrici in gravidanza, lattanti, consumatori
   immunocompromessi o anziani, per i quali Listeria monocytogenes e
   Salmonella presentano un rischio documentato elevato anche a
   concentrazioni inferiori ai limiti convenzionali di rilevazione. Il
   sigillo non può formulare una rivendicazione di sicurezza
   popolazione-specifica e si rifiuta di farlo (regola di rifiuto R6).

**La sezione sui limiti onesti qui sopra è la parte portante di questo
kit.** I produttori che trattano "abbiamo sigillato il nostro registro
di rilascio" come equivalente a "abbiamo dimostrato che il nostro
alimento è sicuro" fanno un uso improprio della primitiva. Il kit deve
dirlo chiaramente: *questa è una primitiva di non ripudio per le
rivendicazioni contemporanee del produttore al rilascio, non una
prova di sicurezza, non un sostituto della vigilanza regolatoria e
non una difesa contro le modalità di fallimento da contaminazione
eterogenea, frode nella catena di approvvigionamento o cattiva
manipolazione post-rilascio che hanno ucciso persone in focolai
passati.*

---

## Cosa questo kit DEVE RIFIUTARSI di sigillare

Il kit è configurato per respingere i seguenti schemi fattuali anche
se un utente con valida autorità di firma del produttore li sottopone:

- **Identificazione personale di qualunque lavoratore, supervisore,
  personale QA, ispettore in visita o auditor terzo.** Nomi, ID
  dipendente, numeri di badge, numeri di previdenza sociale, indirizzi
  di casa, numeri di telefono personali — nessuno di questi compare
  nel sigillo pubblico. I ruoli sono pubblici; gli abbinamenti
  persona-ruolo sono sigillati separatamente e ottenibili tramite
  procedura regolatoria. La sicurezza dei lavoratori contro ritorsioni
  e molestie è il vincolo portante; l'attestazione di sicurezza
  alimentare può essere eseguita a livello di ruolo. (R1)

- **Posizione precisa dello stabilimento.** La regione dello
  stabilimento (stato o regione multi-stato) è accettabile; indirizzo
  preciso, coordinate GPS o qualunque identificatore di granularità
  sufficiente a identificare fisicamente l'impianto su una mappa NON
  è accettabile. Il numero di stabilimento regolatorio è la maniglia
  del regolatore per la struttura; considerazioni di sicurezza fisica
  e di sicurezza dei lavoratori sconsigliano la pubblicazione di un
  indirizzo pubblico su Bitcoin. (R2)

- **Schemi individuali del personale per turno di produzione.** Orari
  dei turni, rotazioni dei singoli lavoratori, ID personali degli
  operatori di linea — nessuno di questi compare nel sigillo. Lo
  schema di vita dei singoli lavoratori non deve essere derivabile
  dall'attestazione pubblica. (R3)

- **Identità dei fornitori che compromettono i contratti.** Nomi dei
  fornitori, ubicazione degli stabilimenti dei fornitori, codici di
  lotto del fornitore (eccetto nel caso di contaminazione della catena
  di approvvigionamento in cui nominare il lotto contaminato di un
  fornitore è richiesto per la salute pubblica, e viene gestito
  tramite una pubblicazione sigillata separata) NON sono pubblicati
  nel sigillo di rilascio. Molti contratti di fornitura contengono
  clausole di riservatezza; il sigillo non le viola per default. (R4)

- **Elenchi clienti e destinazioni di distribuzione oltre il livello
  aggregato.** Il riepilogo regionale di alto livello è accettabile;
  elenchi clienti specifici (rivenditori, centri di distribuzione,
  account foodservice) NON sono accettabili. L'identità del cliente è
  contrattualmente riservata e competitivamente sensibile; il
  regolatore ottiene l'elenco clienti tramite i canali consolidati di
  coordinamento del richiamo. (R5)

- **Affermazioni di sicurezza o conclusioni legali.** Il kit non
  sigilla "questo prodotto è sicuro", "questo lotto soddisfa tutti
  gli standard di sicurezza alimentare applicabili", "questo è GRAS
  per questo uso" o qualunque altra affermazione di sicurezza o
  conclusione legale. Il kit ancora il registro dei test e la
  decisione di rilascio, NON una conclusione di sicurezza. (R6)

- **Schemi di re-identificazione di reclami da parte di lavoratori o
  segnalatori.** Il kit rifiuta di pubblicare qualunque schema che
  potrebbe re-identificare un lavoratore che ha presentato un reclamo
  OSHA, USDA o interno aziendale relativo a sicurezza alimentare o di
  lavoro. Tali segnalanti sono protetti ai sensi della Sezione 402
  FSMA e di statuti paralleli; il sigillo non deve diventare un
  vettore di re-identificazione. Le attestazioni di whistleblower
  hanno un proprio kit (`examples/whistleblower-manifest`) con regole
  di rifiuto calibrate per quel caso d'uso. (R7)

- **Sigillo da parte di soggetti diversi dal principale autorizzato
  del produttore rilasciante.** Un certificatore terzo, un team QA
  del cliente o un auditor indipendente possono utilizzare lo stesso
  kit per sigillare le PROPRIE conclusioni di audit; NON possono
  sigillare la decisione di rilascio originale a nome del produttore.
  Il soggetto firmatario del FACT 08 è l'unico firmatario valido per
  ciò. (R8)

Un rifiuto stesso può essere sigillato come fatto ("Questo produttore
ha richiesto il sigillo di X; il kit ha rifiutato in base alla regola
di rifiuto Y"), creando un record pubblico di tentato uso improprio.

---

## Cosa questo kit SIGILLA

8 fatti al momento del rilascio:

1. **Avviso di esempio** — dichiara la pubblicazione un esempio (le
   attestazioni reali rimuovono o sostituiscono questo avviso).
2. **Identificazione del prodotto e del lotto** — nome del prodotto,
   categoria, produttore, regione dello stabilimento (NON ubicazione
   precisa), versione del piano HACCP + hash, ID lotto, date di
   produzione / confezionamento / scadenza, numero di unità di consumo,
   requisiti di conservazione, i tre punti critici di controllo con
   hash dei record registrati (letalità di cottura, stabilizzazione di
   raffreddamento, ambiente RTE post-letalità).
3. **Risultati dei test di rilascio** — test microbiologici del
   prodotto finito (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), test chimici / residui (nitrito, residui
   veterinari, metalli pesanti), verifica del cross-contact degli
   allergeni, riepilogo del monitoraggio ambientale, ciascuno con lo
   SHA-256 del PDF di rapporto completo e il vincolo esplicito di
   interpretazione campione-vs-sfuso.
4. **Metodologia e qualifica del laboratorio** — quale metodo (e
   quale versione del documento di metodo) è stato utilizzato per
   ciascuna riga, quali laboratori hanno eseguito quali test, stato
   di accreditamento ISO/IEC 17025:2017 di ciascun laboratorio e hash
   del certificato, risultati recenti di proficiency-test,
   dichiarazione di indipendenza, registro di deviazioni / retest /
   OOS per questo lotto.
5. **Decisione di rilascio** — data di rilascio, autorità di rilascio
   a livello di ruolo + controfirma, riepilogo del record di supporto
   alla decisione, destinazioni di distribuzione di alto livello,
   obblighi post-rilascio riconosciuti al rilascio, impegno di
   tempistica-e-irreversibilità.
6. **Impegni di richiamo e di sorveglianza post-immissione sul
   mercato** — l'analogo di sicurezza alimentare della
   farmacovigilanza: trasparenza dei segnali di malattia, impegni di
   esecuzione del richiamo (soglie 24h / 72h / 98%), risposta alla
   contaminazione della catena di approvvigionamento, impegno di
   nessun-retesting-silenzioso, impegno di nessuna-modifica-di-spec-a
   -posteriori, condivisione aggregata dei segnali di sicurezza.
7. **Disclosure di accompagnamento e record dei rifiuti** — hash del
   log di indagine sull'azione correttiva, storia recente di
   ispezioni, storia di richiami, problemi noti aperti nei metodi di
   test utilizzati, abbinamento ruolo-individuo (sigillato
   separatamente, hashato qui), prontezza di tracciabilità del
   fornitore, elenco esplicito delle regole di rifiuto R1-R8 con gli
   eventuali rifiuti esercitati durante questo rilascio.
8. **Soggetto firmatario** — produttore + firmatario a livello di
   ruolo (Direttore QA) + controfirma a livello di ruolo (Plant
   Manager) + informazioni sulla chiave crittografica; motivazione
   per la pubblicazione a livello di ruolo.

Ogni fatto termina con la convenzione del refusal-gate: *"Questo fatto
afferma soltanto X. Non afferma Y"* (dove Y è la modalità di
fallimento più prossima dalla sezione "NON fa" qui sopra).

---

## Da cosa questo kit difende

- **Modifica retroattiva silenziosa dei risultati dei test di
  rilascio.** Tutti i PDF dei rapporti di test sono hashati. Un
  re-hashing post-rilascio rivela qualunque modifica.
- **Controversie su quali metodi, quali versioni del documento di
  metodo e quali laboratori siano stati utilizzati.** Il FACT 04
  congela la metodologia e lo stato di accreditamento di laboratorio
  al rilascio. Successive rivendicazioni del tipo "in realtà abbiamo
  utilizzato MLG 4.13, non 4.12" sono pubblicamente refutabili.
- **Re-specifica retroattiva per un lotto fuori specifica.** Se un
  risultato di test di rilascio era in realtà un PASS borderline che
  viene riclassificato come FAIL post-rilascio, gli hash dei rapporti
  sigillati dimostrano cosa diceva il PDF del risultato originale.
  Simmetricamente, un OOS borderline che venga silenziosamente
  ritestato in un PASS senza disclosure è rilevabile se l'impegno di
  nessun-retesting-silenzioso del FACT 06 viene successivamente
  confrontato con un emendamento non sigillato.
- **Minimizzazione silenziosa dell'ambito del richiamo.** Gli impegni
  di richiamo nel FACT 06 (notifica a 24h, avvio a 72h,
  recuperabilità del 98%) sono sigillati; il mancato rispetto è
  pubblicamente osservabile.
- **Ri-narrazione a posteriori della storia delle azioni correttive.**
  L'hash del log di azione correttiva del FACT 07 congela ciò che
  l'azienda HA DICHIARATO di aver fatto dopo la presuntiva dell'EMP;
  successive rivendicazioni del tipo "abbiamo fatto di più / meno di
  così" sono pubblicamente refutabili.
- **Omissione selettiva di disclosure di accompagnamento.** Il FACT
  07 enumera le categorie di disclosure attese (storia di ispezione,
  storia di richiamo, revisione di method-advisory, prontezza di
  traceback); una categoria vuota deve essere esplicitamente attestata
  ("nessuna al momento del rilascio"), così un successivo "non ci
  siamo resi conto che fosse rilevante" è pubblicamente refutabile.
- **Sostituzione dello stato di accreditamento di un laboratorio
  diverso.** Il FACT 04 congela l'ambito ISO 17025 di ciascun
  laboratorio e l'hash del certificato al rilascio; una successiva
  sostituzione di un laboratorio non accreditato è pubblicamente
  rilevabile.

Il kit **non** difende dalla corruzione contemporanea — un team che
sigilla intenzionalmente risultati di test falsi al momento del
rilascio produce un sigillo crittograficamente valido di risultati di
test falsi. La primitiva è onesta su questo punto: è una primitiva di
non ripudio per le rivendicazioni contemporanee del produttore, non
una prova che tali rivendicazioni siano corrette.

---

## Precedenti storici di mortalità

Il kit avrebbe prodotto un'utile àncora — *non una soluzione* — in
passati fallimenti di sicurezza alimentare. Per evitare di diffamare
individui (la maggior parte dei fallimenti di sicurezza alimentare è
aziendale, non individuale; alcuni sono perseguiti penalmente e altri
no), questi riferimenti descrivono il focolaio per anno e patogeno e
nominano l'entità coinvolta solo quando la contaminazione è stata
pubblicamente attribuita per avviso di richiamo o per atto giudiziario.

- **Adulterazione con melamina della formula per lattanti e dei
  latticini in Cina nel 2008 (Sanlu Group + altri).** Almeno sei
  decessi di lattanti e circa 300.000 patologie attribuibili a
  prodotti caseari addizionati di melamina, progettati per gonfiare
  in modo fraudolento il contenuto apparente di proteine nei dosaggi
  basati su azoto Kjeldahl. Sono seguite condanne nei tribunali
  cinesi, comprese sentenze capitali. *Il sigillo non avrebbe
  prevenuto questo evento* — la melamina era fuori dal pannello di
  analiti standard. Il sigillo si sarebbe impegnato pubblicamente a
  quale fosse il pannello, rendendo l'ambito dell'espansione
  post-incidente dello screening di routine forense chiaro.

- **Focolaio europeo STEC O104:H4 del 2011 (germogli di fieno greco
  riconducibili a un'azienda agricola tedesca).** 53 decessi, circa
  3.950 patologie in più paesi europei; in definitiva tracciato a
  semi di fieno greco importati dall'Egitto e germogliati presso un
  produttore tedesco. Il traceback è stato ostacolato da
  documentazione a livello di lotto incoerente lungo la catena di
  approvvigionamento multi-paese. *Il sigillo non avrebbe prevenuto
  la contaminazione del lotto di semi* (la contaminazione era a monte
  dei test del germogliatore); avrebbe ancorato ciò che i test di
  rilascio del germogliatore dichiaravano e, se utilizzato a livello
  dell'importatore di semi, ciò che la gestione dei semi importati
  dichiarava, rendendo il traceback più rapido.

- **Focolaio di Listeria monocytogenes di Blue Bell Creameries del
  2015 (Stati Uniti).** 3 decessi, 10 patologie in più stati; ha
  portato a un richiamo nazionale e a una condanna penale federale di
  Blue Bell del 2020 per accuse di sicurezza alimentare di natura
  contravvenzionale, con l'azienda che ha sottoscritto un accordo di
  prosecuzione differita e pagato 19,35 milioni di dollari. Successivo
  contenzioso civile. *Il sigillo non avrebbe prevenuto* la
  contaminazione ambientale interna alla pianta da Listeria; avrebbe
  ancorato forensicamente i registri del programma di monitoraggio
  ambientale, rendendo qualunque domanda post-incidente del tipo
  "cosa mostrava l'EMP nei mesi precedenti il focolaio" rispondibile
  rispetto a un record con marca temporale evidente in caso di
  manomissione anziché rispetto a documenti prodotti successivamente.

- **Focolai multistato STEC O157:H7 del 2018 collegati a lattuga
  romana (regione di coltivazione di Yuma, poi regione di coltivazione
  di Salinas).** Almeno 5 decessi e circa 210 patologie in più
  focolai quell'anno. Il traceback è stato complicato da prodotto
  insacchettato di provenienza mista. *Il sigillo non avrebbe prevenuto*
  la contaminazione a livello del campo / dell'acqua di irrigazione
  (a monte del produttore); avrebbe ancorato forensicamente il
  registro dei test in ingresso e di rilascio di ciascun
  trasformatore, rendendo il trace-back più rapido e il record
  pubblico più difendibile crittograficamente contro future
  controversie.

- **Focolaio di Salmonella Typhimurium di Peanut Corporation of
  America (2008-2009, Stati Uniti).** 9 decessi, circa 714 patologie;
  ha portato a condanne penali federali del 2014-2015 di dirigenti di
  PCA, inclusa una sentenza di 28 anni di reclusione per il CEO per
  accuse di cospirazione e ostruzione. *Il sigillo non avrebbe
  prevenuto* la contaminazione, l'indagine insufficiente sui test
  positivi di Salmonella interni alla pianta o la decisione a livello
  dirigenziale di spedire prodotto contro tali esiti positivi.
  AVREBBE reso forensicamente chiaro, in fase processuale, cosa
  dicevano i risultati dei test al momento in cui erano stati
  generati — rendendo le prove dell'accusa contro le false-narrative
  email contemporanee sostanzialmente più ancorate contro la modifica
  documentale.

In ciascuno di questi casi, il kit avrebbe fornito una linea temporale
forense più pulita. In nessuno di questi casi il kit da solo avrebbe
prevenuto i decessi. Il sigillo è infrastruttura forense, non
infrastruttura di prevenzione. Tale distinzione è l'onestà del kit.

---

## Quando usare questo kit

- La vostra operazione di produzione ha un programma HACCP /
  Preventive Controls stabile e desidera aggiungere un'attestazione
  pubblica ancorata a Bitcoin come strato evidente in caso di
  manomissione sopra l'esistente flusso di documentazione di
  rilascio.
- Siete un produttore di piccole-medie dimensioni o un produttore
  in una giurisdizione con infrastruttura regolatoria più debole, e
  desiderate ancorare i registri di lotto rispetto a una linea
  temporale globalmente verificabile — per fiducia nel mercato di
  esportazione, per risposta ad audit del cliente o per
  partecipazione a iniziative volontarie di trasparenza.
- Siete un ispettore di sicurezza alimentare o un certificatore terzo
  e desiderate pubblicare un sigillo di esito di audit evidente in
  caso di manomissione alla firma, così che gli esiti di audit non
  possano essere silenziosamente emendati in seguito d'accordo tra
  produttore e certificatore.
- Vi aspettate che questo lotto subisca un significativo scrutinio a
  valle (mercato di esportazione, categoria ad alto rischio come
  carne RTE o formula per lattanti, ingrediente nuovo, storia recente
  di richiami).
- Potete pubblicare il set di fatti elencato senza violare le regole
  di rifiuto R1-R8. Se i vostri fatti richiederebbero la violazione
  di R1-R8, non usate il kit; correggete prima gli input di dati.
- Il consulente legale del produttore ha riesaminato il piano di
  pubblicazione. La pubblicazione pubblica di un manufatto
  identificante il lotto ha implicazioni per l'esposizione a
  responsabilità da prodotto; la revisione del consulente legale non
  è opzionale.

## Quando NON usare questo kit

- **Non usare in sostituzione dei registri regolatori FSMA / FSIS /
  UE.** Il sigillo è *additivo*, non sostitutivo. I vostri registri
  statutari di rilascio, il vostro piano HACCP, i vostri log CCP e
  il vostro piano di richiamo non vengono modificati.
- **Non usare come affermazione di sicurezza.** Sigillare un record
  di rilascio conforme non stabilisce che il prodotto sia sicuro;
  stabilisce che il record aveva questo contenuto in byte in questo
  momento. La regola di rifiuto R6 respingerà qualunque conclusione
  di sicurezza.
- **Non usare per pubblicare identità di fornitori, elenchi clienti,
  nomi dei lavoratori o indirizzi degli stabilimenti.** Le regole di
  rifiuto R1-R5 esistono per ragioni di sicurezza umana e
  contrattuali; non modificate il kit per aggirarle senza consultare
  il consulente legale.
- **Non usare sotto pressione per sigillare prima del completamento
  dei test di rilascio.** Un sigillo a dati parziali rappresenta in
  modo erroneo lo stato della decisione di rilascio.
- **Non usare come teatro di legittimità.** Un sigillo di un piano
  di campionamento mal progettato o di un pannello di analiti mal
  scelto è un record pubblico permanente dell'inadeguatezza, non una
  difesa contro di essa. La primitiva taglia in entrambe le
  direzioni; questa è la sua onestà.
- **Non usare durante una situazione di richiamo attivo come
  sostituto del coordinamento del richiamo da parte del regolatore.**
  Una nuova pubblicazione MYRIAM che ancora l'ambito del richiamo è
  appropriata DOPO che il richiamo coordinato dal regolatore è stato
  avviato; non è un sostituto del canale di richiamo del regolatore.

## Come forkare questo kit per un rilascio reale

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**TEMPISTICA CRITICA:** sigillare al momento del rilascio QA, PRIMA
che il lotto venga distribuito (prima che il primo camion lasci lo
stabilimento). Un sigillo dopo l'avvio della distribuzione ha
comunque valore ma non ancora pulitamente lo stato pre-distribuzione.
La finestra giusta è tra la firma di rilascio QA e il primo
movimento di distribuzione.

**REVISIONE CRITICA:** prima di sigillare, fate passare la
pubblicazione attraverso un secondo revisore QA (non il responsabile)
e attraverso il consulente legale dell'azienda. Una volta sigillata,
la pubblicazione è permanente.

## Integrazione con l'infrastruttura di sicurezza alimentare esistente

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).** L'URL
  della pubblicazione sigillata o il CID IPFS può essere referenziato
  nella documentazione del Food Safety Plan come manufatto di
  attestazione pubblica per questo lotto.
- **Piani HACCP e registri di rilascio USDA FSIS.** Il record di
  rilascio sigillato si affianca ai registri HACCP richiesti dal
  FSIS; il sigillo referenzia l'hash della versione del piano HACCP
  (FACT 02) così che successive controversie su quale versione del
  piano fosse in vigore siano pubblicamente refutabili.
- **Principi Codex Alimentarius / HACCP** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Il sigillo si impegna agli output dei sette principi
  HACCP (analisi dei pericoli, CCP, limiti critici, monitoraggio,
  azioni correttive, verifica, mantenimento dei registri) per questo
  lotto.
- **ISO 22000:2018 (Sistemi di Gestione della Sicurezza Alimentare).**
  Il sigillo può essere referenziato come parte della traccia di
  evidenza della management-review; non sostituisce la certificazione
  ISO 22000.
- **Schema di certificazione FSSC 22000 v6.** Compatibile come strato
  di trasparenza additivo; l'auditor FSSC può verificare il sigillo
  durante la sorveglianza.
- **Regolamento UE (CE) 178/2002 (Legislazione Alimentare Generale)
  Articolo 18 (tracciabilità) e Articolo 19 (notifica di richiamo).**
  Il sigillo impegna la prontezza di traceback a un livello a monte
  del produttore (FACT 07) e gli impegni di richiamo (FACT 06); non
  sostituisce l'obbligo statutario di notifica ai sensi
  dell'Articolo 19.
- **Pacchetto Igiene UE (Regolamenti 852/2004, 853/2004, 854/2004,
  882/2004).** Compatibile; il sigillo referenzia l'equivalente dei
  registri HACCP e di auto-controllo del Pacchetto Igiene.
- **Schemi di standard privati BRCGS / SQF.** Compatibile come strato
  di trasparenza additivo.
- **Sistemi di sorveglianza per la salute pubblica (CDC PulseNet,
  FoodNet, IFSAC; EFSA / ECDC UE).** Fuori ambito per il sigillo
  direttamente, ma il FACT 06 impegna il produttore a partecipare e
  a sigillare qualunque evento di correlazione di segnale come nuove
  pubblicazioni MYRIAM.

## Cosa questo kit NON sostituisce

- La registrazione FDA Food Facility o l'approvazione USDA FSIS
  Establishment.
- Il vostro Food Safety Plan / piano HACCP scritto ai sensi di FSMA
  / FSIS.
- I log di monitoraggio CCP e i registri di azione correttiva.
- La supervisione dell'accreditamento di laboratorio ISO 17025.
- I programmi di proficiency testing.
- L'ispezione regolatoria (ispezione continua FSIS, ispezione
  periodica FDA, ispezione delle competent-authority UE).
- La sorveglianza per la salute pubblica (CDC, EFSA, ECDC,
  equivalenti nazionali).
- I canali di coordinamento del richiamo (FDA Reportable Food
  Registry, coordinamento del richiamo FSIS, RASFF UE, equivalenti
  nazionali).
- La sicurezza dei lavoratori e i programmi di formazione dei
  lavoratori alimentari.

## Perché questo kit esiste in v0.4.0+

Questo è uno degli esempi lavorati distribuiti con myriam-kit. Segue
la struttura README constraint-first validata dalla autoresearch
documentata in `~/Genesis/calc/PROMPT_LIBRARY_v0.md` — la variante di
prompt constraint-first ha ottenuto il punteggio più alto in un
rubric pesato attraverso più domini esemplificativi, perché
l'attestazione di sicurezza alimentare è esattamente il dominio in
cui sovrastimare ciò che il sigillo prova è pericoloso: persone
sono morte, moriranno, in fallimenti che il sigillo non può
prevenire. Le sezioni di apertura sono le parti portanti del kit; il
contenuto del manifest è la parte facile.

I default del kit sono deliberatamente conservativi sulla
pubblicazione dei nomi dei lavoratori, conservativi sulla precisione
dell'ubicazione dello stabilimento, conservativi sull'identità di
fornitori e clienti, e aggressivi sul disclaimer "questo non
stabilisce la sicurezza". La comunità di sicurezza alimentare ha una
documentata storia di linguaggio di certificazione sovrastimato; il
kit impostazione di default sulla posizione meno suscettibile di
essere letta come una garanzia di sicurezza. I produttori in
giurisdizioni in cui specifici requisiti di divulgazione pubblica
differiscono possono emendare il proprio fork di conseguenza, ma i
rifiuti di default favoriscono la sicurezza dei lavoratori e
l'ambito onesto.

## Licenza

Pubblico dominio (CC0). Forkalo. Nessuna attribuzione richiesta.
