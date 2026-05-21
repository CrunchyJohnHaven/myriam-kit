*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

# Kit di Sigillo di Pre-Certificazione dello Scrutinio Elettorale

Un esempio chiavi in mano di myriam-kit destinato ai consigli di
scrutinio di contea, alle autorità elettorali statali e agli osservatori
dell'integrità elettorale che desiderino pubblicare un sigillo dello
scrutinio ancorato a Bitcoin e che evidenzi qualsiasi manomissione, nel
momento esatto della certificazione.

**Chiude** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Ciò che questo kit NON fa (leggere per primo)

Il sigillo è una marca temporale crittografica di ciò che è stato
certificato. Non può verificare se ciò che è stato certificato fosse
corretto. I seguenti modi di fallimento sono **al di fuori del dominio
del sigillo**:

1. **Compromissione delle macchine di voto.** Se il firmware è stato
   manomesso o i totali dei voti sono stati conteggiati in modo errato,
   il sigillo ancora un numero sbagliato con elevata integrità. Il
   sigillo osserva gli output del sistema di tabulazione; non ha
   visibilità sul sistema stesso.

2. **Soppressione del voto / privazione strutturale del diritto di
   voto.** La chiusura dei seggi, le disparità nelle leggi
   sull'identificazione, il bias nei tassi di rigetto del voto per
   corrispondenza e le epurazioni delle liste elettorali sono a monte
   della certificazione. Il sigillo registra le schede conteggiate, non
   le schede che avrebbero dovuto essere conteggiate.

3. **Disinformazione elettorale.** Il sigillo non si pronuncia su
   affermazioni relative all'elezione fatte da candidati, media o
   piattaforme. Una certificazione sigillata può essere citata in una
   narrazione disinformativa con la stessa facilità con cui può essere
   citata a difesa contro di essa. Le marche temporali crittografiche
   sono neutrali rispetto al contenuto.

4. **Frode pre-certificazione durante la raccolta o il conteggio delle
   schede.** Irregolarità nella raccolta delle schede, manomissione
   delle urne, interruzioni della catena di custodia durante la
   finestra di conteggio — tutto ciò avviene prima del momento del
   sigillo. Il sigillo non può rilevarle retroattivamente.

5. **Coercizione dell'autorità certificante.** Una certificazione
   coercitiva produce un sigillo crittograficamente valido di un
   risultato coercitivo. Il sigillo verifica che un funzionario ha
   firmato, non il perché.

6. **Certificazioni errate che non vengono mai corrette in seguito.** Il
   valore del sigillo dipende da un successivo processo di accertamento
   della verità (audit, riconteggio, contenzioso) rispetto al quale il
   sigillo possa essere confrontato. Se un tale processo non viene mai
   eseguito, il sigillo rimane l'unico registro e può calcificare
   l'errore.

7. **Anomalie statistiche e rilevamento di pattern.** Il sigillo non
   segnala margini implausibili, anomalie geografiche o deviazioni
   dalla legge di Benford. Si tratta di compiti analitici sui dati
   sigillati, non di proprietà del sigillo.

8. **Contese in fondo alla scheda con tracce di audit deboli.** Le
   contese minori hanno trigger di riconteggio più deboli; un singolo
   sigillo non può coprire in modo significativo tutte le contese su
   una scheda senza una delimitazione per contesa.

**La sezione sui limiti onesti di cui sopra è la parte portante di
questo kit.** I funzionari che credono che sigillare equivalga a
legittimità lo useranno come scudo. Il kit deve affermare con chiarezza:
questa è una *primitiva di non-ripudio per il momento della
certificazione*, non una prova della correttezza dell'elezione.

---

## Ciò che questo kit DEVE RIFIUTARSI di sigillare

Il kit è configurato per rifiutare i seguenti pattern di fatto anche se
un utente con autorità di firma valida li sottopone:

- **Identificazione individuale dell'elettore.** Nessun fatto può
  nominare un elettore, collegare una scheda a un elettore, o esporre
  alcun campo che potrebbe re-identificare una persona.
- **Decisioni di confronto firma per singola scheda.** Cariche di PII;
  sigillarle crea registri permanenti di decisioni che potrebbero
  essere successivamente contestate.
- **Qualsiasi fatto la cui pubblicazione identificherebbe un elettore
  vulnerabile.** Comprende risultati a livello di seggio in seggi così
  piccoli che la scelta di voto è inferibile (tipicamente <50 schede).
- **Scrutini sigillati prima che tutte le schede siano state
  conteggiate.** Il kit rifiuta i conteggi parziali presentati come "lo
  scrutinio". Pre-certificazione significa *tutte le schede
  conteggiate, prima della certificazione ufficiale* — non *durante il
  conteggio*.
- **Certificazioni provvisorie o condizionate.** Il sigillo deve
  riflettere un fatto, non una condizione.
- **Conteggi che escludono coorti in contenzioso pendente** senza un
  fatto accompagnatore sigillato esplicito che riveli l'esclusione.
- **Sigillatura da parte di chiunque diverso dall'autorità certificante**
  per quella giurisdizione.

Un rifiuto stesso può essere sigillato come fatto ("Questa autorità ha
richiesto la sigillatura di X; il kit ha rifiutato secondo la regola di
rifiuto Y"), creando un registro pubblico di un tentato uso improprio.

---

## Ciò che questo kit SIGILLA effettivamente

8 fatti al momento della certificazione:

1. **Avviso di esempio** — dichiara la pubblicazione come esempio (le
   attestazioni reali rimuovono o sostituiscono questo avviso).
2. **Identificazione della giurisdizione** — contea, data dell'elezione,
   autorità certificante, funzionari certificanti per nome e ruolo.
3. **Scrutinio certificato** — totali dei voti per contesa e per
   candidato + sopra-/sotto-voti + nominativi scritti a mano (write-in).
4. **Contabilità e riconciliazione delle schede** — totale schede
   espresse, totale tabulate, totale rifiutate per categoria,
   ripartizione per modalità, denominatore degli elettori iscritti.
5. **Manifesto dell'equipaggiamento e del percorso di audit** — modello
   del tabulatore + hash del firmware, hash del file CVR, hash
   dell'archivio delle immagini delle schede, hash del registro di
   custodia, hash della politica di confronto firma.
6. **Soglie e trigger alla certificazione** — soglia di confronto firma
   in vigore, soglie di attivazione del riconteggio, margini effettivi
   per contesa, impegno (seed commitment) della RLA.
7. **Divulgazioni accompagnatorie e registro dei rifiuti** —
   contenziosi pendenti, anomalie post-conteggio in revisione, coorti
   escluse, membri dissenzienti del consiglio; elenco esplicito dei
   pattern che il kit ha rifiutato di sigillare.
8. **Principale firmatario** — identificazione del Consiglio di
   Scrutinio (Board of Canvassers) + nome e partito di ciascun
   firmatario + informazioni crittografiche della chiave.

Ogni fatto termina con la convenzione del cancello di rifiuto: *"Questo
fatto afferma solo X. Non afferma Y"* (dove Y è il modo di fallimento
più vicino dalla sezione "NON fa" di cui sopra).

---

## Contro cosa si difende questo kit

- **Revisione silenziosa post-certificazione dei totali dei voti** —
  qualsiasi cambiamento intero al FATTO 03 produce un diverso SHA-256,
  una diversa radice di Merkle, fa fallire la verifica OTS.
- **"Schede ritrovate" assorbite in silenzio** — l'aritmetica di
  riconciliazione del FATTO 04 è fissata alla certificazione.
- **Affermazioni di sostituzione del firmware** — il FATTO 05 congela il
  manifesto dell'equipaggiamento alla certificazione.
- **Sostituzione degli artefatti di audit post-certificazione** — il
  manifesto degli hash del FATTO 05 cattura qualsiasi modifica
  post-certificazione al CVR, alle immagini delle schede, ai registri
  di custodia o alla politica di confronto firma.
- **Ridefinizione di soglie e trigger** — il FATTO 06 congela le regole
  in vigore alla certificazione (soglia di confronto firma, trigger di
  riconteggio, limite di rischio della RLA).

## Casi storici o quasi-storici in cui il kit avrebbe aiutato

Il kit avrebbe prodotto un ancoraggio utile — *non una soluzione* — in
casi che coinvolgevano:

- **Antrim County, Michigan (2020).** I risultati ufficiosi iniziali
  mostravano uno scambio di candidato successivamente corretto
  nell'esito opposto. Un sigillo pre-correzione avrebbe fornito un
  riferimento pubblico per ciò che diceva l'annuncio originale rispetto
  a ciò che diceva la correzione, entrambi attestati
  crittograficamente.
- **Maricopa County, Arizona (2020–2022).** Sono circolate molteplici
  iterazioni di totali ricontati/riesaminati. Un sigillo del momento
  della certificazione avrebbe fornito un punto di riferimento
  inequivocabile rispetto al quale ogni conteggio successivo avrebbe
  potuto essere confrontato per differenza.
- **Florida 2000 (scrutinio Bush v. Gore).** I totali certificati
  contea per contea si sono spostati sotto la pressione del riconteggio;
  un sigillo pre-riconteggio per contea avrebbe preservato ciò che ogni
  contea aveva certificato prima dell'inizio delle procedure di
  riconteggio manuale.
- **Varie elezioni estere con "correzioni" post-certificazione
  documentate.** Agnostico rispetto alla giurisdizione.

Il kit NON avrebbe risolto le controversie sottostanti sull'integrità
delle macchine nel 2020, le controversie sulla politica del voto per
corrispondenza, o qualsiasi elezione in cui la questione centrale era
un fatto contestato piuttosto che un registro contestato.

## Quando usare questo kit

- La vostra giurisdizione dispone di un processo di certificazione
  stabile e sottoposto a audit e si vuole aggiungere un ancoraggio
  pubblico immutabile.
- Vi aspettate uno scrutinio post-certificazione e desiderate un punto
  di riferimento che evidenzi qualsiasi manomissione.
- Avete l'autorità legale per pubblicare l'insieme di fatti elencato
  senza esporre PII.
- Avete un processo parallelo di audit o di RLA in modo che il sigillo
  possa essere confrontato con l'output dell'accertamento della verità.

## Quando NON usare questo kit

- **Non usare come sostituto di audit a limite di rischio, riconteggi
  manuali o audit post-elettorali.** Questo kit è *additivo*, non
  sostitutivo.
- **Non usare se il funzionario certificante non è il vero
  decisore** (crea attribuzione falsa).
- **Non usare durante la tabulazione.** Il kit è specificamente per il
  momento della certificazione. I sigilli su conteggi parziali creano
  punti di riferimento fuorvianti.
- **Non usare per affermare che l'elezione sia stata equa, accurata o
  legittima** — non può farlo.
- **Non usare sotto pressione per sigillare prima del momento della
  certificazione, o per omettere una divulgazione in un fatto
  accompagnatore.** Rifiutare, e sigillare il rifiuto.
- **Non usare come teatro di legittimità.** Un sigillo di uno scrutinio
  fraudolento è un registro pubblico permanente della frode, non una
  difesa contro di essa. La primitiva taglia in entrambe le direzioni;
  questa è la sua onestà.

## Come forkare questo kit per una certificazione reale

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # sostituire il contenuto fittizio con quello reale
bash build/seal.sh     # sigillare AL o dopo il momento della firma di certificazione ufficiale
python3 build/verify.py
```

**Tempistica critica:** sigillate AL momento della certificazione, NON
prima. Un sigillo prima della certificazione ufficiale crea un registro
falso-positivo del tipo "questo è il risultato ufficiale". Un sigillo
dopo è non-ripudio convenzionale.

## Integrazione con l'infrastruttura elettorale esistente

- **State Boards of Elections / certificazione EAC.** Il kit pubblica
  accanto al documento di certificazione ufficiale. Non sostituisce la
  certificazione statutaria.
- **Audit a limite di rischio.** L'hash del CVR nel FATTO 05 è lo
  stesso hash che lo strumento RLA consuma. Il sigillo lega il CVR
  sottoposto ad audit al totale certificato.
- **Procedure di riconteggio.** Un riconteggio attivato dalla legge
  statale produce un NUOVO insieme di fatti sigillato (marca temporale
  diversa, hash diversi, stessa giurisdizione). Entrambi i sigilli
  coesistono; nessuno dei due sovrascrive l'altro. La differenza tra i
  sigilli è il registro pubblico di ciò che il riconteggio ha
  modificato.
- **Election Markup Language (EML) e Common Data Format (CDF).** I
  corpi dei fatti dovrebbero essere derivabili dagli output EML/CDF
  esistenti della giurisdizione, per mantenere il kit agnostico
  rispetto al formato dei dati.
- **Firma bipartisan del consiglio di scrutinio.** Variante a firma
  multipla raccomandata per giurisdizioni con consigli di scrutinio
  bilanciati partiticamente.

## Ciò che questo kit NON sostituisce

- La certificazione statutaria ai sensi della legge elettorale statale
- La certificazione del sistema di voto EAC
- Gli audit a limite di rischio / i riconteggi manuali
- Le procedure di riconteggio e gli audit post-elettorali
- Le ordinanze giudiziarie o il contenzioso di contestazione elettorale

## Perché questo kit esiste in v0.3.0+

Questo è il 6º esempio elaborato distribuito con myriam-kit. Il kit è
stato prodotto tramite un processo di autoricerca in stile Karpathy
documentato in `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Tre varianti
di prompt (imitazione / primi-principi / vincoli-prima) hanno prodotto
schemi di kit paralleli; la variante vincoli-prima ha ottenuto il
punteggio più alto in una griglia di valutazione pesata, e il kit finale
sintetizza la sua struttura con la coesione della variante di imitazione
e il dettaglio operativo della variante primi-principi.

L'autoricerca stessa è documentata come pattern di prompt in
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` per uso futuro.

## Licenza

Pubblico dominio (CC0). Forkatelo. Non è richiesta alcuna attribuzione.
