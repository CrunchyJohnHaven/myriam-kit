*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

# Kit di Sigillo per la Catena di Custodia di Reperti Giudiziari

Un esempio chiavi in mano del myriam-kit per le squadre di acquisizione forense — esaminatori di informatica forense, tecnici di estrazione da dispositivi mobili, custodi dei reperti delle bodycam, supervisori di laboratorio — che desiderano pubblicare un sigillo ancorato a Bitcoin, evidente alla manomissione, di *quali byte sono stati acquisiti* e *quando*, nel momento dell'acquisizione del reperto digitale, in modo che le controversie sulla catena di custodia abbiano un'ancora pubblica.

---

## Cosa questo kit NON fa (leggere per primo)

Il sigillo è un'attestazione temporale crittografica di QUALI IMMAGINI FORENSI sono state acquisite, QUANDO sono state acquisite, da QUALE AUTORITÀ, in forza di QUALE MANDATO e attraverso QUALE METODOLOGIA. Non può rispondere a nessuna domanda sul caso al di là di questo. Le questioni seguenti sono **fuori dal dominio del sigillo**:

1. **Ammissibilità ai sensi delle Federal Rules of Evidence (o di qualsiasi altro codice probatorio).** Il sigillo ancora byte e attestazioni temporali. Se un reperto sia ammissibile — ai sensi dell'autenticazione FRE 901, della testimonianza tecnica FRE 702 / Daubert, del bilanciamento del pregiudizio FRE 403, o di un qualsiasi equivalente di una corte statale — è una questione di procedura legale. Un'acquisizione perfettamente sigillata può comunque essere dichiarata inammissibile; un'acquisizione non sigillata può comunque essere ammessa. Il sigillo è prova aggiuntiva di integrità, non un sostituto della decisione di ammissibilità del tribunale.

2. **Se il sequestro sia stato legittimo.** Conformità al Quarto Emendamento, validità del mandato, rispetto dell'ambito, applicabilità della regola di esclusione — tutto questo è a monte del sigillo. Il sigillo registra che l'acquisizione è avvenuta in forza del mandato FICT-SW-2026-0188; se il mandato sia stato emesso ed eseguito legittimamente spetta al tribunale.

3. **Se la prova sia incriminante, esculpatoria o neutra.** Il sigillo ancora hash; le interpretazioni di ciò che tali hash contengono appartengono al rapporto di esame forense, che è un proprio documento con un proprio regime di discovery e probatorio. Il sigillo rifiuterà di sigillare "FATTO N: il laptop del sospettato conteneva materiale incriminante" — vedere la regola di rifiuto R4.

4. **Se la catena di custodia sia proceduralmente corretta ai sensi del diritto probatorio dello Stato applicabile.** Il sigillo registra il registro contemporaneo degli eventi di custodia dell'autorità (FATTO 05). Se tale registro soddisfi i requisiti di catena di custodia di un particolare Stato spetta al tribunale in sede di udienza probatoria.

5. **Se la metodologia forense fosse affidabile.** Daubert e la sua progenie (e gli analoghi a livello statale come Frye, ove ancora si applichi) valutano l'affidabilità metodologica. Il sigillo registra QUALI strumenti e versioni siano stati usati (FATTO 04); se tali strumenti soddisfino lo standard di affidabilità di un qualsiasi tribunale spetta al tribunale. Bug degli strumenti sono stati documentati post-acquisizione in casi precedenti; il ruolo del sigillo è rendere il registro di versione-e-hash-del-binario pubblicamente confutabile, non garantire per gli strumenti stessi.

6. **Se la prova sia stata manomessa PRIMA dell'acquisizione.** Il sigillo ancora i byte dal momento dell'imaging in avanti. Se un sospettato, un agente o un terzo ha alterato il dispositivo sorgente prima che ne venisse fatta l'immagine, il sigillo non può rilevarlo — sigillerà i byte alterati con la stessa integrità con cui sigillerebbe l'originale. Il valore del sigillo inizia all'attestazione temporale dell'imaging.

7. **Se l'ambito del mandato sia stato rispettato.** L'allegato del mandato definisce ciò che può essere acquisito; il sigillo registra ciò che È STATO acquisito. Se l'acquisizione abbia ecceduto l'ambito del mandato è, di nuovo, una questione legale con un proprio rimedio (istanza di soppressione ai sensi della procedura dello Stato competente).

8. **Re-identificare alcuna parte privata dell'indagine.** Il sigillo rifiuta di pubblicare qualsiasi nome, identificatore o impronta che possa re-identificare un sospettato, imputato, vittima, testimone o occupante delle premesse. Il riferimento al fascicolo del caso è l'identificatore appropriato per le parti legittimate a localizzare il caso.

**La sezione sui limiti onesti sopra è la parte portante di questo kit.** Le squadre forensi che credono che sigillare equivalga ad ammissibilità lo useranno come scudo. Il kit deve dire chiaramente: *questo è un primitivo di non-ripudio per il momento dell'acquisizione, non una prova di acquisizione lecita, solidità metodologica o catena di custodia riconosciuta dal tribunale.*

---

## Cosa questo kit DEVE RIFIUTARE di sigillare

Il kit è configurato per respingere i seguenti pattern di fatto anche se un utente con valida autorità di firma dell'autorità li sottopone:

- **Identificazione personale di sospettati, imputati, vittime, testimoni o qualsiasi terza parte privata.** Il riferimento al fascicolo è l'identificatore per le parti legittimate; il sigillo pubblico non deve essere un indice di re-identificazione.
- **Nomi personali di esaminatori forensi o altro personale dell'autorità nel sigillo pubblico.** I ruoli sono pubblici; i legami persona-ruolo sono sigillati separatamente e ottenibili tramite procedura giudiziaria.
- **Hash a livello di file (o impronte) di materiale sospettato di abuso sessuale minorile, modelli biometrici o qualsiasi dato re-identificativo di persone vulnerabili — anche tramite hash.** Un SHA-256 di un singolo file è un identificatore ricercabile permanente; pubblicarlo su un registro pubblico può ri-vittimizzare i soggetti tramite correlazione con database privati. Hash a livello di immagine (a livello di immagine forense) di dischi interi sono accettabili; hash a livello di file di tale materiale non sono MAI accettabili.
- **Risultanze di esame, interpretazioni, opinioni o conclusioni su cosa significhino i byte.** Il sigillo ancora QUALI BYTE siano stati acquisiti e QUANDO. L'interpretazione appartiene al rapporto d'esame esibibile in discovery, non a un registro pubblico evidente alla manomissione.
- **Affermazioni di ammissibilità o qualsiasi altra conclusione giuridica** ("questa prova è ammissibile", "il mandato era legittimo", "la catena di custodia era regolare ai sensi del §X.Y"). Le conclusioni giuridiche sono funzioni del tribunale.
- **Sigillo da parte di chiunque non sia il principale autorizzato dell'autorità acquirente.** Un perito della difesa può usare il kit per sigillare la propria verifica indipendente del manifesto; non può sigillare l'acquisizione ORIGINARIA a nome dell'autorità acquirente.
- **Legami ruolo-individuo all'interno del sigillo pubblico.** I legami sono sigillati in un registro complementare separato (sotto hash nel FATTO 05) soggetto al controllo di accesso dell'autorità.
- **Fatti investigativi pre-sequestro o pre-mandato.** Dichiarazioni di informatori, sorveglianza pre-mandato, input di costruzione parallela — nulla di tutto ciò appartiene al sigillo di acquisizione. Il sigillo è circoscritto all'evento di acquisizione.

Un rifiuto stesso può essere sigillato come fatto ("Questa autorità ha richiesto il sigillo di X; il kit ha rifiutato in forza della regola di rifiuto Y"), creando un registro pubblico di tentato uso improprio.

---

## Cosa questo kit sigilla DAVVERO

8 fatti al momento dell'acquisizione:

1. **Avviso di esempio** — dichiara che la pubblicazione è un esempio (le attestazioni reali rimuovono o sostituiscono questo).
2. **Contesto di acquisizione** — identificatore del caso, citazione del mandato, autorità acquirente, autorità richiedente, data/ora del sequestro e dell'acquisizione, luogo dell'acquisizione (il luogo del sequestro è redatto in un registro complementare sigillato separatamente per evitare la re-identificazione delle premesse).
3. **Manifesto dei reperti** — per voce di immagine forense: hash SHA-256, dimensione del file, identificatore anonimizzato del dispositivo sorgente, metodo di acquisizione, formato dell'immagine forense.
4. **Metodologia di acquisizione** — nomi degli strumenti forensi e versioni esatte (con hash dei binari degli strumenti), marca/modello e firmware del write-blocker, riferimento alla verifica NIST CFTT, procedura di verifica utilizzata, scelta del formato dell'immagine.
5. **Registro della catena di custodia** — cronologia per evento dal sequestro iniziale fino al termine dell'imaging, custodi identificati per RUOLO (non per nome), con hash di registri complementari sigillati separatamente (legame ruolo-individuo, log GPS del trasporto, log di accesso all'armadio reperti, fotografie dei sigilli antimanomissione, ecc.).
6. **Qualifiche dell'esaminatore per ruolo** — certificazioni detenute, stato di formazione continua, conteggio dell'esperienza precedente come perito-testimone, esposizione a Daubert, dichiarazioni di conflitto di interessi — tutto a livello di ruolo, non personale.
7. **Disclosure complementari e registro dei rifiuti** — indagini parallele, contestazioni pendenti del mandato, istanze di prova soppressa, protocollo di filtro di privilegio / taint team in vigore, precedenti tentativi di acquisizione, revisione del bug-tracker del fornitore; elenco esplicito dei pattern che il kit ha rifiutato di sigillare.
8. **Principale firmatario** — identificazione dell'autorità acquirente + firmatario a livello di ruolo (esaminatore principale) + co-firmatario a livello di ruolo (supervisore dell'unità) + informazioni sulla chiave crittografica.

Ogni fatto termina con la convenzione del cancello di rifiuto: *"Questo fatto afferma solo X. Non afferma Y"* (dove Y è il modo di fallimento più vicino dalla sezione "NON fa" sopra).

---

## Contro cosa difende questo kit

- **Alterazione silenziosa post-acquisizione di un'immagine forense.** Qualsiasi modifica a livello di byte di qualsiasi immagine produce un diverso SHA-256, e l'immagine post-modifica non verificherà rispetto al manifesto sigillato del FATTO 03.
- **Affermazione che "siano stati usati strumenti diversi".** Il FATTO 04 registra versioni esatte degli strumenti con hash dei binari; affermazioni successive del tipo "in realtà abbiamo usato la v4.7.0, non la v4.7.1" sono pubblicamente confutabili.
- **Affermazione che il write-blocker non fosse inserito, o fosse di modello diverso.** Il FATTO 04 congela il manifesto del write-blocker.
- **Alterazione del registro di custodia.** Qualsiasi modifica alla cronologia degli eventi di custodia del FATTO 05 (aggiunta, rimozione o ri-attestazione temporale di un evento) cambia l'hash del FATTO 05 ed è pubblicamente rilevabile.
- **Sostituzione delle credenziali di un diverso esaminatore.** Il FATTO 06 congela il profilo delle credenziali a livello di ruolo al momento dell'acquisizione.
- **Omissione selettiva di disclosure complementari.** Il FATTO 07 enumera le categorie di disclosure attese; una categoria vuota deve essere esplicitamente attestata ("nessuna al momento dell'acquisizione"), in modo che un successivo "non ci eravamo resi conto che fosse rilevante" sia pubblicamente confutabile.
- **Affermazioni post-acquisizione che l'esaminatore avesse un conflitto non dichiarato.** La dichiarazione di conflitto del FATTO 06 è congelata all'acquisizione; le contestazioni successive possono essere verificate rispetto ad essa.

Il kit **non** difende dalla corruzione contemporanea — una squadra che intenzionalmente sigilla metadati falsi al momento dell'acquisizione produce un sigillo crittograficamente valido di metadati falsi. Il primitivo è onesto al riguardo: è un primitivo di non-ripudio per le affermazioni contemporanee dell'autorità, non una prova che tali affermazioni siano corrette.

---

## Casi storici o quasi storici in cui il kit avrebbe aiutato

Il kit avrebbe prodotto un'ancora utile — *non una risoluzione* — in casi passati in cui la catena di custodia delle prove digitali è divenuta una questione probatoria controversa. Per evitare di nominare imputati (che sono parti private anche quando condannate), questi sono descritti per tipologia di caso, non per individuo nominato:

- **La controversia federale di metà anni 2010 sul bug di uno strumento forense** in cui uno strumento di imaging forense ampiamente utilizzato è stato scoperto, post-acquisizione, avere un bug in casi limite che interessava uno specifico tipo di supporto sorgente. Un manifesto di acquisizione sigillato con dati congelati di versione-strumento-e-hash-binario avrebbe permesso a difesa e accusa di concordare esattamente su quale versione fosse stata usata, eliminando un asse di disputa.

- **Molteplici casi statali riguardanti output controversi di estrazione da dispositivi mobili**, in cui il fornitore dello strumento di estrazione ha successivamente rilasciato una patch correttiva e la domanda è diventata "il bug ha interessato questo caso". Un fatto di metodologia sigillato permette di rispondere alla domanda rispetto a dati di versionamento congelati, anziché rispetto al ricordo corrente dell'autorità su quale versione fosse stata usata.

- **Dispute sulla consegna delle bodycam** in casi in cui è stato successivamente sostenuto che il sistema di docking del fornitore della BWC avesse consentito modifiche del filmato in transito. Un manifesto sigillato dell'archivio della bodycam al momento del ricevimento da parte dell'autorità ancora quali byte l'autorità abbia ricevuto dal sistema di docking; modifiche successive sul lato autorità sono pubblicamente rilevabili.

- **Controversie su collisioni di hash in casi di informatica forense**, in cui un perito della difesa ha sostenuto che MD5 (ancora in uso in alcuni flussi di lavoro legacy) fosse inadeguato. Un'acquisizione sigillata che registri SIA MD5 SIA SHA-256 consente al SHA-256 di reggere anche se l'MD5 viene impugnato.

- **Dispute sull'evoluzione della metodologia di esame tra acquisizione e processo.** Quando un caso resta tra acquisizione e processo per anni, la metodologia standard al momento dell'acquisizione può essere stata superata al momento del processo. Il registro sigillato permette al tribunale di valutare la metodologia rispetto allo standard vigente al momento dell'acquisizione, non rispetto allo standard successivo.

Il kit NON avrebbe risolto le controversie di fondo su colpevolezza o innocenza in nessuno di questi tipi di caso. Avrebbe risolto una specifica sub-controversia probatoria: se i byte, gli strumenti e le procedure fossero ciò che l'autorità afferma essere stati nel momento in cui l'autorità afferma siano stati.

---

## Quando usare questo kit

- La vostra autorità ha una SOP forense stabile e desidera aggiungere un'attestazione pubblica ancorata a Bitcoin come livello evidente alla manomissione sopra l'esistente catena di custodia cartacea e a firma.
- Vi aspettate che questo caso comporti significative contestazioni della difesa alle prove forensi (caso ad alto rischio, metodologia innovativa, versioni di strumenti contestate, ecc.).
- Potete pubblicare il set di fatti elencato senza esporre PII o dati re-identificativi di persone vulnerabili. (Le regole di rifiuto del kit lo impongono; se i vostri fatti richiedessero la rottura di una regola di rifiuto, non utilizzate il kit.)
- L'ufficio legale generale dell'autorità acquirente e l'ufficio del pubblico ministero hanno rivisto il piano di pubblicazione. La pubblicazione pubblica di un artefatto che reca un identificatore di caso ha implicazioni per le indagini in corso; la revisione legale non è facoltativa.
- Le regole di discovery della difesa nella vostra giurisdizione sono compatibili con il fatto che l'autorità detenga separatamente il registro di legame ruolo-individuo (sotto hash nel FATTO 05). Se la vostra giurisdizione richiede la divulgazione pubblica del nome dell'esaminatore, dovete emendare il kit di conseguenza.

## Quando NON usare questo kit

- **Non utilizzare in sostituzione della documentazione esistente di catena di custodia dell'autorità.** Questo kit è *aggiuntivo*, non sostitutivo. Il CMS dell'autorità, il registro di custodia e gli obblighi di produzione in discovery restano invariati.
- **Non utilizzare se l'acquisizione comporta CSAM, modelli biometrici o altri dati re-identificativi di persone vulnerabili a livello di file.** Hash a livello di immagine di dischi interi sono accettabili; hash a livello di file di tale materiale non sono MAI accettabili, nemmeno con deroga alla regola di rifiuto. Se non potete costruire un set di fatti senza violare la R3, non utilizzate il kit.
- **Non utilizzare per affermare che il mandato era legittimo, il sequestro è stato regolare o la prova è ammissibile** — il kit non può farlo, e la regola di rifiuto R5 respingerà qualsiasi affermazione del genere.
- **Non utilizzare sotto pressione per sigillare prima del completamento dell'acquisizione.** Un sigillo di acquisizione parziale travisa lo stato.
- **Non utilizzare per pubblicare nomi personali degli esaminatori** salvo che la vostra giurisdizione lo richieda specificamente e i vostri esaminatori abbiano individualmente acconsentito. L'impostazione predefinita è la pubblicazione a livello di ruolo.
- **Non utilizzare in casi sigillati o sotto sigillo** senza espressa autorizzazione del tribunale. Pubblicare un identificatore di caso su Bitcoin è irreversibile; se il caso viene successivamente sigillato, il sigillo pubblico non può essere ritrattato. Il kit è solo per acquisizioni di pubblico dominio.
- **Non utilizzare come teatro di legittimità.** Un sigillo di un'acquisizione viziata è un registro pubblico permanente dei vizi, non una difesa contro di essi. Il primitivo taglia in entrambi i sensi; questa è la sua onestà.

## Come forkare questo kit per un'acquisizione reale

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # sostituite il contenuto fittizio con quello reale
                       # applicate le regole di rifiuto R1-R8 ovunque
bash build/seal.sh     # sigillate AL completamento dell'imaging o subito dopo
python3 build/verify.py
```

**Tempistica critica:** sigillate AL completamento dell'imaging o subito dopo (evento E17 del FATTO 05 nella cronologia di esempio). Un sigillo durante l'imaging crea un registro di acquisizione parziale; un sigillo molto successivo crea una lacuna durante la quale l'autorità avrebbe potuto alterare le immagini. La finestra corretta è immediatamente dopo il completamento della verifica dell'immagine per l'ultimo elemento del set probatorio.

**Revisione critica:** prima di sigillare, fate passare la pubblicazione attraverso un secondo esaminatore forense (non il principale) e attraverso l'ufficio legale dell'autorità. Una volta sigillata, la pubblicazione è permanente.

## Integrazione con l'infrastruttura esistente di catena di custodia

- **Sistema di gestione casi dell'autorità (CMS).** Il CMS resta il sistema primario di registrazione dell'autorità. Il sigillo non sostituisce il CMS; impegna ai byte e alla metodologia che il CMS registra, in modo che le modifiche successive al CMS siano pubblicamente rilevabili.
- **Federal Rules of Evidence / Daubert / codici probatori statali.** Il sigillo contribuisce al registro di autenticazione FRE 901 fornendo integrità evidente alla manomissione. NON soddisfa di per sé la FRE 702 / Daubert; l'affidabilità metodologica è ancora vagliata in udienza probatoria.
- **Discovery della difesa (FRCP 16, Brady, Giglio ed equivalenti statali).** I registri complementari sotto hash nel FATTO 05 (legame ruolo-individuo, registro di custodia, foto dei sigilli antimanomissione, ecc.) restano soggetti alla normale discovery. Il sigillo ancora ciò che tali registri affermavano al momento dell'acquisizione, in modo che una successiva affermazione "il registro era diverso al momento" sia pubblicamente confutabile.
- **NIST Computer Forensics Tool Testing (CFTT).** Il kit fa riferimento ai log di verifica CFTT nel FATTO 04 / FATTO 05; il riferimento è un hash, non il log stesso, sicché i processi CFTT non sono interessati.
- **Periti neutrali nominati dal tribunale e periti della difesa.** Entrambi possono ri-hashare le immagini forensi ricevute in discovery rispetto al manifesto del FATTO 03, indipendentemente da qualsiasi cooperazione dell'autorità. Questo è il principale valore aggiunto del kit per il lato difesa.
- **Revisione in appello.** Anni dopo, un revisore forense in appello può verificare la metodologia di acquisizione originale rispetto al registro sigillato del FATTO 04, anziché rispetto al possibile ricordo evoluto dell'autorità.

## Cosa questo kit NON sostituisce

- Le Federal Rules of Evidence (o qualsiasi codice probatorio statale).
- Gli standard di affidabilità Daubert / Frye per la testimonianza tecnica.
- La SOP forense e il CMS dell'autorità.
- Gli obblighi di discovery della difesa ai sensi della FRCP 16 / Brady / Giglio / equivalenti statali.
- Ordini del tribunale, istanze di soppressione, udienze probatorie o qualsiasi altro processo amministrato dal tribunale.
- NIST CFTT o qualsiasi altro regime di test degli strumenti.
- Il protocollo di filtro di privilegio / taint team dell'autorità.

## Perché questo kit esiste nella v0.4.0+

Questo è l'8° esempio lavorato distribuito con il myriam-kit. Segue la struttura "constraint-first" convalidata dall'autoresearch documentata in `~/Genesis/calc/PROMPT_LIBRARY_v0.md` — la variante di prompt "constraint-first" ha ottenuto il punteggio più alto in una rubrica ponderata su più domini di esempio. Le sezioni iniziali sono le parti portanti del kit; il contenuto del manifesto è la parte facile.

Il design del kit è deliberatamente conservativo sulla pubblicazione del nome dell'esaminatore e aggressivo sul disclaimer "ciò non stabilisce l'ammissibilità". La comunità forense ha una storia documentata di essere attaccata per il proprio lavoro forense; il kit assume per default la posizione più sicura per gli esaminatori. Le autorità in giurisdizioni in cui la nomina pubblica personale è richiesta possono emendare il proprio fork di conseguenza, ma il rifiuto predefinito favorisce la sicurezza dell'esaminatore.

## Licenza

Pubblico dominio (CC0). Forkatelo. Nessuna attribuzione richiesta.
