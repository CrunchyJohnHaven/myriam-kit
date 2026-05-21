# Kit di Attestazione di Lotti di Vaccino

*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

Un esempio chiavi in mano di myriam-kit per produttori di vaccini,
autorità di assicurazione della qualità e agenzie di sanità pubblica
che desiderano pubblicare un sigillo di rilascio di lotto ancorato a
Bitcoin ed evidente alla manomissione.

## Da cosa difende questo kit

**Modalità di fallimento che il sigillo intercetta:**

- **Modifica silenziosa e retroattiva dei risultati dei test di
  rilascio.** Tutti gli 8 PDF dei test di rilascio nell'esempio sono
  sottoposti a hash. Un nuovo hashing post-rilascio rivela qualsiasi
  modifica.
- **Controversie su quali specifiche fossero applicate al rilascio.**
  Il FACT 02 sigillato contiene l'identificazione canonica del lotto e
  l'hash del registro di produzione. Eventuali future controversie del
  tipo "la specifica è sempre stata X" hanno un ancoraggio pubblico.
- **Minimizzazione silenziosa dell'ambito di un richiamo.** Gli impegni
  di farmacovigilanza nel FACT 05 sono sigillati; la mancata osservanza
  di essi è pubblicamente osservabile.
- **Ri-specifica retroattiva di un lotto fuori specifica.** Se il
  risultato di un test di rilascio era in realtà un superamento (PASS)
  al limite che viene riclassificato come fallimento (FAIL) dopo il
  rilascio, gli hash sigillati del rapporto dimostrano cosa diceva
  originariamente il PDF dei risultati.

**Modalità di fallimento NON coperte:**

- Frode nel processo di produzione stesso (il sigillo ancora i risultati
  dei test, non l'integrità della produzione).
- Eventi avversi che sono conseguenze biologiche di un lotto altrimenti
  conforme (il sigillo non certifica la sicurezza clinica, soltanto
  l'integrità della documentazione).
- Controversie su quale versione di una specifica regolatoria sia
  autorevole.

## Quando usare questo kit

Considerate di sigillare un rilascio di lotto se:

- Siete un produttore di vaccini che desidera dimostrare l'integrità
  forense dei registri di rilascio oltre quanto richiesto dai
  regolatori
- Siete un team QA che adotta una pratica di "pubblicare ciò che
  attestiamo"
- Siete un produttore di scala piccola/nazionale in una giurisdizione
  con infrastruttura regolatoria più debole, che desidera ancorare i
  registri di lotto rispetto a un verificatore globale
- Siete un'agenzia di sanità pubblica o una ONG che gestisce un
  programma non commerciale di produzione di vaccini (ad es. per
  malattie trascurate)

## Precedenti storici di mortalità

- **Contaminazione di eparina (2008, Cina):** condroitina solfato
  iperossidata contraffatta nei lotti di eparina. Un manifesto di test
  di rilascio sigillato avrebbe reso la modifica silenziosa post-rilascio
  del registro dei test crittograficamente rilevabile.
- **Cianuro nel Tylenol (1982):** controversie retroattive sul punto di
  origine della manomissione. Un hash sigillato del registro di
  produzione ancora lo stato pre-distribuzione.
- **Vari richiami di lotti di vaccino** in cui la domanda "questo lotto
  è mai stato testato correttamente" diventa contestata anni dopo.

Il kit NON è una soluzione per NESSUNO di questi in senso stretto — ma
in ciascun caso, attestazioni di lotto sigillate avrebbero fornito una
linea temporale forense più pulita.

## Come fare fork di questo kit per un lotto reale

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # sostituite il contenuto fittizio con il lotto reale
bash build/seal.sh        # SIGILLATE PRIMA che inizi la distribuzione
python3 build/verify.py   # confermate
```

**TEMPISTICA CRITICA**: sigillate al momento del rilascio QA, PRIMA che
il lotto sia distribuito. Un sigillo dopo la distribuzione è
forensicamente più debole.

## Integrazione con l'infrastruttura farmaceutica esistente

- **Sottomissioni eCTD (FDA / EMA):** l'URL della pubblicazione
  sigillata o il CID IPFS possono essere referenziati nella sezione
  Module 3 (qualità)
- **Pre-qualificazione WHO:** il manifesto sigillato dimostra la
  catena dei test pre-rilascio a giurisdizioni non FDA/EMA
- **Feedback di farmacovigilanza:** il FACT 05 impegna il produttore
  alla rendicontazione sigillata dei conteggi aggregati di eventi
  avversi a 6 e 12 mesi
- **Sistemi di richiamo (RxConnect, MedWatch):** se è necessario un
  richiamo, l'ambito stesso del richiamo viene sigillato sotto MYRIAM,
  fornendo una verifica pubblica che tutti i lotti distribuiti vengano
  affrontati

## Ciò che questo kit NON sostituisce

- Sottomissioni regolatorie FDA / EMA / WHO
- Tracce di audit GMP (il sigillo ancora i RISULTATI, non i registri
  grezzi del processo)
- Database di farmacovigilanza (VAERS / EudraVigilance)
- Sistemi di coordinamento dei richiami

**Distinzione critica**: le affermazioni sigillate sono non-ripudio,
non una prova di sicurezza. Il sigillo dimostra cosa era documentato al
momento della sigillatura; non dimostra che il vaccino stesso sia
sicuro o che il processo di produzione fosse conforme alle GMP.

## Licenza

Dominio pubblico (CC0). Fate fork. Nessuna attribuzione richiesta.
