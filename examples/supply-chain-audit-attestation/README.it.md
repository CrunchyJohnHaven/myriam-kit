# Kit di Sigillo per Attestazione di Audit della Catena di Fornitura

*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

Un esempio chiavi in mano di myriam-kit per auditor terzi sociali / del
lavoro / ambientali, team interni di compliance dei fornitori,
investigatori di ONG sulle catene di fornitura e organizzazioni per i
diritti dei lavoratori che desiderano pubblicare un sigillo
inalterabile, ancorato a Bitcoin, di un rapporto di audit nel momento
esatto della firma di approvazione.

---

## Cosa questo kit NON fa (leggere per primo)

Il sigillo è un timestamp crittografico di ciò che l'auditor ha
approvato. Non può verificare se ciò che è stato approvato sia **vero**.
Le seguenti modalità di fallimento sono **fuori dal dominio del
sigillo**:

1. **Cattura dell'audit da parte dell'industria.** Gli audit
   commissionati dai brand hanno una storia lunga e documentata di
   produzione di constatazioni indulgenti sui fornitori il cui rapporto
   commerciale continuativo con il brand committente mantiene il flusso
   degli audit. Un audit catturato, una volta sigillato, produce un
   registro forense permanente dell'audit catturato. Il sigillo non
   corregge la cattura — rende semplicemente immutabile l'audit-così-
   come-emesso, in modo che un successivo processo di ricerca della
   verità abbia qualcosa di concreto con cui confrontarsi.

2. **Lavoratori addestrati / strutture preparate.** Audit annunciati o
   semi-annunciati danno al management giorni o settimane per provare
   le risposte dei lavoratori, nascondere lavoratori minorenni, pulire
   i dormitori, rimuovere apparecchiature non conformi e dirottare il
   lavoro verso subappaltatori non sottoposti ad audit durante la
   finestra di audit. Il sigillo ancora ciò che agli auditor è stato
   mostrato, non ciò che è stato impedito loro di vedere.

3. **Subappalto nascosto.** Subappalti di Tier-2 e Tier-3, lavoro a
   domicilio e produzione del settore informale sono pervasivamente
   invisibili agli audit di stabilimento. Il sigillo ancora un audit
   di Tier-1; non può rilevare che il Tier-1 esternalizzi a un Tier-2
   non sottoposto ad audit durante la finestra di audit o
   abitualmente.

4. **Audit che mancano sistematicamente l'abuso a cui mirano.** Rana
   Plaza, il crollo della fabbrica di abbigliamento del Bangladesh
   del 2013 che uccise 1.134 lavoratori, era stato sottoposto ad
   audit da molteplici programmi commissionati dai brand nei mesi
   precedenti. Le crepe nell'edificio non erano nella checklist degli
   audit sociali; il regime di audit non aveva una scope di
   ingegneria strutturale. Gli audit ancorano ciò che è *nello
   scope*; gli abusi fuori scope rimangono invisibili
   indipendentemente da quanto sia inalterabile il sigillo.

5. **Ritorsioni post-firma contro i lavoratori che hanno
   partecipato alle interviste.** Anche con il rifiuto delle
   informazioni di localizzazione (FACT 07 R3), un avversario
   determinato che conosce l'ID del fornitore può identificare la
   struttura. La protezione dei lavoratori richiede più del semplice
   rifiuto delle PII nel sigillo — richiede l'anonimizzazione a monte
   della metodologia di audit. Il sigillo rende durevole l'audit-
   così-come-emesso; non protegge gli intervistati retroattivamente.

6. **Condizioni di lavoro che sono legali ma disumane.** I divari di
   salario dignitoso in giurisdizioni dove il salario minimo legale
   è al di sotto del benchmark di salario dignitoso producono
   constatazioni di audit "conformi" rispetto alle leggi su salari
   e orari e constatazioni "non conformi" rispetto agli standard di
   salario dignitoso nello stesso audit (FACT 03 elemento 8 in
   questo kit di esempio). Il sigillo ancora ciò che ogni standard
   riporta; la loro riconciliazione è lavoro di policy a valle.

7. **Danni climatici / ambientali con causalità diffusa.** Emissioni
   di carbonio, contributi alla deforestazione, esaurimento idrico
   e rilasci di inquinanti dai fornitori possono essere sigillati
   nelle constatazioni di audit, ma l'attribuzione causale al
   volume di ordini di uno specifico brand è metodologicamente
   contestata. Il sigillo ancora ciò che è stato misurato presso il
   fornitore; non assegna responsabilità morale o legale.

8. **Dispute su quale standard sia autorevole.** SA8000 vs. BSCI vs.
   SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. codice di condotta
   aziendale: ognuno ha scope, severità e processi di rimedio
   diversi. Il sigillo ancora *un* audit sotto *uno* standard. Il
   confronto fra standard è un problema a valle.

9. **Competenza dell'auditor vs. credenziale dell'auditor.**
   "Accreditato" non è "competente". Auditor che hanno completato
   programmi di formazione accreditati hanno mancato abusi gravi in
   audit che hanno preceduto disastri pubblicamente visibili. Il
   sigillo ancora le credenziali; non certifica la competenza con
   cui sono state esercitate.

**La sezione dei limiti onesti qui sopra è la parte portante di
questo kit.** Un brand che vuole un teatro di legittimità userà un
audit sigillato come scudo. Il kit deve dire chiaramente: questa è
una *primitiva di non-ripudio per il momento di firma del rapporto
di audit*, non una prova di conformità del fornitore o di benessere
dei lavoratori.

---

## Cosa questo kit DEVE RIFIUTARE di sigillare

Il kit è configurato per rifiutare i seguenti pattern fattuali anche
se un utente con valida autorità di organismo di audit li
sottomette:

- **Identificazione individuale dei lavoratori.** Nessun fatto può
  nominare un lavoratore, collegare una citazione a un lavoratore,
  esporre numero di badge, posizione in linea, stanza del
  dormitorio, programma di turno, combinazione demografica con N<5,
  o qualsiasi campo che possa re-identificare una persona che ha
  partecipato alle interviste. Le citazioni dei lavoratori usano
  token randomizzati; la mappatura non viene mai sigillata.
- **Fonti whistleblower / informanti.** Se una constatazione si
  basa sulla divulgazione di un individuo che ha assunto un rischio
  per divulgare, l'individuo non viene mai nominato o identificato
  nella pubblicazione sigillata.
- **Informazioni di localizzazione precise.** Nessun indirizzo
  stradale, GPS, immagine satellitare con risoluzione >1km, o
  fotografia esterna dell'edificio. Il paese e la regione sono la
  massima risoluzione sigillata. Motivazione: l'identificazione
  della struttura abilita ritorsioni contro i partecipanti alle
  interviste.
- **Affermazione di certificazione di audit pulito.** Il kit rifiuta
  di sigillare qualsiasi inquadramento del tipo "questo audit prova
  che il fornitore è conforme" o "non esistono violazioni". Le
  affermazioni di pulizia sono epistemicamente non supportate dalla
  metodologia di audit.
- **Sostituzione sigillo-come-certificato.** Una pubblicazione che
  omette la metodologia (FACT 04), l'indipendenza (FACT 06), o i
  rifiuti (FACT 07) non è una pubblicazione MYRIAM legittima sotto
  questo kit.
- **Audit in bozza / pre-firma.** Il sigillamento avviene alla
  firma, non prima. Audit provvisori creano falsa certezza.
- **Risigillamento favorevole post-hoc.** Un audit rivisto richiede
  una NUOVA pubblicazione sigillata che fa riferimento all'originale
  tramite radice di Merkle. L'audit sigillato originale rimane
  permanentemente visibile come l'audit-così-come-emesso.
- **Sigillamento da parte di soggetti diversi dall'organismo di
  audit.** Un brand, un fornitore, un organismo di certificazione,
  o terza parte non possono sigillare "l'audit" al posto
  dell'organismo di audit che ha firmato il rapporto.

Un rifiuto stesso può essere sigillato come fatto ("Questa parte ha
richiesto il sigillamento di X; il kit ha rifiutato secondo la
regola di rifiuto Y"), creando un registro pubblico di tentato uso
improprio. **In un settore con diffusa cattura degli audit, il
rifiuto-di-sigillare può di per sé essere un segnale significativo:**
un organismo di audit che non sigilla perché un brand ha fatto
pressione per ammorbidire le constatazioni ha l'opzione di
registrare pubblicamente il rifiuto sotto il proprio principale.

---

## Cosa questo kit SIGILLA

8 fatti al momento della firma dell'audit:

1. **Avviso di esempio** — dichiara la pubblicazione un esempio (le
   attestazioni reali rimuovono o sostituiscono questa parte).
2. **Scope e soggetto dell'audit** — standard di audit, organismo
   di audit, lead auditor, dimensione del team di audit,
   identificatore del fornitore (nessuna informazione di
   localizzazione precisa), finestra di audit, tipo di annuncio
   (annunciato / semi-annunciato / non annunciato), data del
   rapporto di audit, versione di firma, brand destinatari nominati,
   parte committente.
3. **Manifest delle constatazioni di audit** — conformità / NC-
   minore / NC-maggiore / NC-critica per elemento rispetto allo
   standard, ciascuna con uno SHA-256 della stesura completa della
   constatazione. Totali aggregati. Raccomandazione di
   certificazione alla firma.
4. **Metodologia e prove** — allocazione del tempo in loco, conteggi
   di intervista (con stratificazione: genere, status di migrante,
   anzianità), suddivisione del formato di intervista, relazione
   con l'interprete, revisione documentale con dimensioni del
   campione e hash dei contenuti, artefatti di visita in loco (con
   volti dei lavoratori sfocati), limitazioni metodologiche note.
5. **Azioni correttive impegnate** — per NC-maggiore e per NC-minore
   CAP con causa radice dichiarata, scadenza, meccanismo di
   verifica, impegni di escalation, impegno di non-allentamento-
   silenzioso.
6. **Qualifiche e indipendenza dell'auditor** — accreditamento
   dell'organismo di audit, concentrazione dei clienti, credenziali
   del lead auditor e competenza linguistica, esperienza settoriale,
   dichiarazioni di indipendenza (auditor-fornitore, auditor-brand,
   separazione organismo-di-certificazione).
7. **Disclosure di accompagnamento e registro dei rifiuti** —
   conflitti di interesse (espliciti), cronologia degli audit
   precedenti, canali di worker-voice comunicati, indagini
   parallele, dissenso interno dell'organismo di audit, lista delle
   regole di rifiuto, rifiuti effettivamente invocati in questo
   audit.
8. **Principale firmatario** — organismo di audit, lead auditor,
   team di audit, ufficiale autorizzante, informazioni sulla chiave
   crittografica.

Ogni fatto si chiude con la convenzione del refusal-gate: *"Questo
fatto asserisce solo X. Non asserisce Y"* (dove Y è la modalità di
fallimento più vicina dalla sezione "NON fa").

---

## Da cosa difende questo kit

- **Ammorbidimento silenzioso post-firma di non-conformità
  maggiori.** Qualsiasi modifica al FACT 03 (es. un MAJOR_NC
  riclassificato come MINOR_NC, o una constatazione cancellata
  interamente) produce uno SHA-256 diverso, una radice di Merkle
  diversa, fallisce la verifica OTS.
- **Antedatazione delle chiusure di azioni correttive.** Il FACT 05
  congela il CAP e le sue scadenze alla firma; qualsiasi
  affermazione "abbiamo chiuso quella NC il mese scorso" che
  contraddice le scadenze sigillate è pubblicamente diffabile.
- **Revisionismo metodologico.** Il FACT 04 congela i conteggi di
  intervista, le dimensioni del campione documentale e le ore in
  loco alla firma — impedendo che la successiva difesa "abbiamo
  fatto un'indagine approfondita" sia infalsificabile.
- **Ripubblicazione selettiva che omette constatazioni
  sfavorevoli.** Tutti gli 8 fatti sono legati da un'unica radice
  di Merkle; citare alcuni fatti omettendone altri è rilevabile
  dalla lista delle foglie pubblicate.
- **Deriva delle affermazioni di indipendenza.** Il FACT 06 congela
  le dichiarazioni di indipendenza al momento della firma. Una
  successiva affermazione "questo audit è stato rigorosamente
  indipendente" deve contendere con la percentuale sigillata di
  concentrazione dei clienti e la sigillata disclosure di
  commissionamento pagato dal brand.
- **Cancellazione del registro dei rifiuti.** Il FACT 07 congela
  quali pattern fattuali il kit ha rifiutato; qualsiasi successiva
  affermazione "non abbiamo mai rifiutato nulla" contraddice il
  registro sigillato.

---

## Casi storici o quasi-storici in cui il kit avrebbe aiutato

Il kit avrebbe prodotto un utile **ancoraggio forense** — *non un
rimedio né una prevenzione* — in casi che hanno coinvolto:

- **Rana Plaza (Bangladesh, 2013).** Il crollo dell'edificio Rana
  Plaza uccise 1.134 lavoratori dell'abbigliamento e ne ferì
  ~2.500. Molteplici brand i cui prodotti erano realizzati
  nell'edificio avevano sottoposto ad audit i fornitori Tier-1
  nell'edificio poco prima del crollo. Gli audit usavano checklist
  di audit sociale che non includevano scope di ingegneria
  strutturale. Un fatto di metodologia sigillato (FACT 04) presso
  ognuno di quegli audit avrebbe reso il *divario di scope*
  pubblicamente visibile alla firma — ancorando la limitazione
  documentata che i programmi di audit retrospettivamente
  affermarono di non aver avuto. Il sigillo non avrebbe impedito
  il crollo. Avrebbe impedito che l'affermazione post-crollo
  dell'industria che "nessuno sapeva" fosse epistemicamente
  sostenibile.

- **Audit Apple / Foxconn (anni 2010).** Molteplici iterazioni di
  rapporti di audit sulle strutture Foxconn che producevano per
  Apple furono pubblicate con livelli variabili di severità delle
  constatazioni, contesto del cluster di suicidi dei lavoratori e
  affermazioni di rimedio. Un registro sigillato del momento-di-
  firma per ogni audit avrebbe impedito che successive dispute su
  "cosa diceva l'audit all'epoca" dipendessero da copie d'archivio,
  copie trapelate o rilasci ufficiali rivisti.

- **Cobalto dalla RDC (in corso).** L'estrazione artigianale di
  cobalto nella Repubblica Democratica del Congo, anche da parte di
  bambini, alimenta le catene di fornitura di batterie per i
  principali brand di elettronica e EV. Molteplici audit
  commissionati dai brand nel periodo 2017-presente hanno prodotto
  constatazioni di varia severità. Il kit applicato a ogni audit
  alla firma avrebbe ancorato l'audit-così-come-emesso; il kit
  applicato ai fatti di disclosure di accompagnamento (FACT 07 C2:
  cronologia degli audit precedenti) avrebbe reso pubblicamente
  visibile l'eredità metodologica di ogni successivo auditor dei
  divari precedenti.

- **Minerali da conflitto (stagno, tantalio, tungsteno, oro dalla
  RDC e dalla regione dei Grandi Laghi).** Il Dodd-Frank §1502
  produsse obblighi di audit-e-divulgazione sotto la SEC rule
  13p-1. Dispute sull'adeguatezza degli audit a livello di
  fonderia e sulla verifica della catena di custodia a valle si
  ripeterono nel periodo 2014-2022. Sigilli MYRIAM per-audit
  avrebbero ancorato ogni audit di fonderia alla firma.

- **Audit commissionati dai brand delle catene di fornitura di
  cotone dello Xinjiang (2018-presente).** Dispute su se gli audit
  potessero essere condotti in modo affidabile sotto le restrizioni
  del governo PRC sull'accesso degli auditor emersero ampiamente
  dopo il 2020. Un fatto di metodologia sigillato (FACT 04) presso
  ogni audit avrebbe ancorato quali condizioni di accesso si
  applicavano effettivamente — rendendo le successive affermazioni
  "abbiamo condotto un audit rigoroso" diffabili rispetto ai
  vincoli metodologici sigillati all'epoca.

- **Subappalto Foxconn e rapporti di supplier-responsibility Apple
  negli anni 2010 — scoperte ricorrenti di lavoratori minorenni,
  dormitori nascosti, violazioni di orario.** Sigilli per-audit
  avrebbero ancorato le *constatazioni negative* in audit che non
  trovarono nulla, accanto alle *constatazioni positive* in audit
  che trovarono violazioni — impedendo il cherry-picking narrativo
  retrospettivo da entrambe le direzioni.

Il kit NON avrebbe prevenuto nessuno di questi casi. In diversi
casi il problema sottostante era che l'audit *mancò* l'abuso —
sigillare un audit pulito che avrebbe dovuto trovare violazioni
produce un registro permanente di un audit fallito, che è un
diverso tipo di utilità (ancora il fallimento per la successiva
responsabilizzazione) ma non lo stesso della prevenzione.

---

## Quando usare questo kit

- Sei un organismo di audit che adotta una pratica "pubblicare ciò
  che abbiamo firmato" come difesa contro la pressione di
  ammorbidimento post-firma.
- Sei una ONG che conduce un'indagine parallela sulla catena di
  fornitura e vuoi un punto di riferimento inalterabile al momento
  in cui la tua indagine si chiude.
- Sei un'organizzazione per i diritti dei lavoratori che ha
  ottenuto un rapporto di audit e vuoi ancorare i suoi contenuti
  attuali prima che l'organismo di audit o il brand abbiano la
  possibilità di rivederlo.
- Sei un brand impegnato nella trasparenza sugli audit che hai
  commissionato, e vuoi un registro forense verificabile.
- Sei un giornalista, regolatore o tribunale che ancora i contenuti
  di un particolare audit in un momento specifico per successivi
  contenziosi o reporting.

## Quando NON usare questo kit

- **Non usarlo come sostituto del monitoraggio guidato dai
  lavoratori, di indagini ONG indipendenti, o dell'organizzazione
  dei lavoratori.** Il kit è *additivo*, non un sostituto di
  nessuno di questi.
- **Non usarlo per affermare che un fornitore è conforme.** Un
  audit pulito sigillato è al massimo un input per una valutazione
  di conformità. Trattare un audit sigillato come un certificato
  di conformità è esattamente il teatro di legittimità che le
  regole di rifiuto constraint-first esistono per prevenire.
- **Non usarlo a metà audit.** Sigillare prima della firma crea un
  registro falso-positivo "questo è il rapporto di audit finale".
- **Non usarlo per sigillare una bozza che intendi rivedere.** Ogni
  versione di firma ottiene il proprio sigillo; le revisioni fanno
  riferimento agli originali tramite radice di Merkle.
- **Non usarlo sotto pressione per sigillare prima della firma, o
  per omettere una disclosure di companion-fact.** Rifiuta, e (se
  il tuo principale lo permette) sigilla il rifiuto.
- **Non usarlo come base per un'affermazione di marketing "fair
  trade" o "ethical sourcing" senza divulgare i limiti
  metodologici sigillati insieme al sigillo.** Citare il sigillo
  senza citare i limiti è la modalità di fallimento del teatro di
  legittimità che definisce la cattura degli audit.
- **Non usarlo se il tuo organismo di audit è strutturalmente
  catturato e non può pubblicare constatazioni contro l'interesse
  commerciale del brand committente.** In quel caso, sigillare
  produce un registro pubblico permanente dell'audit catturato.
  Ciò può comunque essere valido — ma non è lo stesso di
  difendere dalla cattura.

---

## Come fare il fork di questo kit per un audit reale

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Tempistica critica:** sigilla AL momento della firma — cioè,
quando il lead auditor firma il rapporto finale ed esso diventa la
posizione ufficiale dell'organismo di audit. Un sigillo prima della
firma crea un registro falso-positivo "questo è l'audit finale". Un
sigillo molto dopo la firma è forensicamente più debole contro le
modifiche intervenute.

---

## Integrazione con l'infrastruttura esistente di audit della catena di fornitura

Il kit è progettato per comporsi con, non sostituire:

- **SA8000 (Social Accountability International).** I rapporti di
  audit SA8000 e i documenti CAP si mappano naturalmente su
  FACT 03 + FACT 05. Il riferimento di accreditamento SAAS si
  adatta a FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Le constatazioni di audit RBA si mappano su FACT 03;
  le regole di indipendenza delle audit-firm dell'RBA si mappano
  su FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Le constatazioni
  di audit SMETA a 2 pilastri e 4 pilastri si mappano su FACT 03;
  la piattaforma Sedex ospita il rapporto grezzo — il sigillo
  MYRIAM ancora un hash di contenuto del rapporto ospitato sulla
  piattaforma.
- **amfori BSCI.** La meccanica di rating BSCI A-E si mappa sulla
  raccomandazione di certificazione di FACT 03; il commissionamento
  da membership del brand si mappa sulla disclosure di
  concentrazione dei clienti di FACT 06 e su FACT 07 C1.
- **FSC chain-of-custody.** Per le catene di fornitura di prodotti
  forestali, i certificati di chain-of-custody e i programmi di
  ri-audit si adattano alla finestra di audit e alla struttura del
  CAP.
- **B Lab / B Corp impact assessment.** La certificazione B Corp
  non è un audit di terza parte nel senso di SA8000, ma i rapporti
  dei verificatori dell'impact assessment possono essere sigillati
  sotto questo kit (con i fatti riscoperti per impact-assessment
  invece che audit del lavoro).
- **ISO 26000.** L'ISO 26000 è guida, non certificabile; il kit
  non ha integrazione diretta con il rapporto di audit ISO 26000
  ma la tassonomia della responsabilità sociale può informare la
  struttura dell'elemento di FACT 03 per audit interni.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  altri regimi settoriali).** I programmi di audit settoriali
  possono essere sigillati sotto questo kit; il campo audit-
  standard di FACT 02 identifica quale.
- **Fair Labor Association.** I rapporti di monitoraggio delle
  fabbriche dell'FLA si mappano su FACT 03 + FACT 05; il framework
  dei monitor indipendenti dell'FLA si mappa sulle dichiarazioni di
  indipendenza di FACT 06.
- **Higg Index (Sustainable Apparel Coalition).** Gli output a
  livello di stabilimento di Higg FEM (Facility Environmental
  Module) e Higg FSLM (Facility Social & Labor Module) possono
  essere sigillati sotto questo kit.
- **EU CSRD / CSDDD.** L'EU Corporate Sustainability Reporting
  Directive e Corporate Sustainability Due Diligence Directive
  creano obblighi di disclosure i cui documenti di verifica
  possono essere sigillati sotto questo kit. Il kit ancora la
  disclosure-così-come-emessa, non la sua adeguatezza sostanziale.

## Cosa questo kit NON sostituisce

- Monitoraggio guidato dai lavoratori (il segnale di rilevamento
  abusi più affidabile in qualsiasi catena di fornitura)
- Indagini ONG indipendenti (CCC, Labour Behind the Label, China
  Labour Bulletin, Workers' Rights Consortium, ecc.)
- Ispezione regolamentare (uffici nazionali del lavoro, equivalenti
  OSHA, programmi dell'ufficio paese ILO)
- Organizzazione dei lavoratori e contrattazione collettiva
- Contenzioso, arbitrato e rimedio sotto il diritto del lavoro
  nazionale
- Framework di due diligence lato brand (UNGP, OECD Due Diligence
  Guidance, EU CSDDD)

## Licenza

Pubblico dominio (CC0). Forkalo. Nessuna attribuzione richiesta.
