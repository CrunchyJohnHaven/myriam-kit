*Traduzione italiana — per la versione originale in inglese, vedere [README.md](README.md)*

# Kit di sigillatura del manifesto per whistleblower

Un esempio chiavi in mano di myriam-kit per whistleblower che si trovano
di fronte alla specifica modalità di fallimento in cui **le prove
vengono sepolte, modificate o contestate da intermediari posti tra il
whistleblower e il pubblico**. I casi storici canonici contro cui
questo kit difende:

- Boeing 737 MAX (rapporti interni di sicurezza svalutati/sepolti)
- Theranos (preoccupazioni sui test di laboratorio soppresse per anni)
- Rapporti degli ispettori FDA modificati dopo la presentazione
- Frances Haugen / Facebook (un manifesto sigillato avrebbe dimostrato
  che i documenti erano autentici ed esistevano nel momento dichiarato)

Contro cosa difende questo kit (in termini di protocollo):

- T1–T3 in [FACT 05](facts/05_threat_model.txt): contestazione pubblica
  del contenuto dei documenti, affermazioni che i documenti non fossero
  sigillati nel momento dichiarato, affermazioni di fabbricazione
  retroattiva.
- T9: terze parti che consegnano ai giornalisti copie alterate.

Contro cosa questo kit **non** difende:

- Ritorsioni personali contro il whistleblower (T7).
- Pressioni sul whistleblower affinché si ritratti (T4, parzialmente
  mitigato dal FACT 07 che rende la ritrattazione silenziosa
  pubblicamente rilevabile).
- Azioni legali contro il whistleblower per la divulgazione stessa (T5).
- Discreditare il carattere del whistleblower (T8).
- Intermediari che abbandonano silenziosamente la storia (T10).

Se siete un whistleblower che sta considerando l'uso di questo kit,
**leggete prima per intero questa README**. Il protocollo è uno
strumento. Il protocollo non sostituisce la consulenza legale, un
giornalista, un regolatore o una disciplina accurata di sicurezza
operativa.

## Cosa produce questo kit

Un *manifesto* crittograficamente sigillato delle prove (non le prove
stesse) che dimostra che:

1. I byte specifici di ciascun file di prova esistevano nel momento
   della sigillatura.
2. La sigillatura è avvenuta in un momento specifico o prima di esso
   (mediante attestazione OTS su Bitcoin).
3. La provenienza, l'accusa, il modello di minaccia, il protocollo del
   destinatario e l'impegno di non-ritrattazione-silenziosa sono stati
   dichiarati tutti insieme.

I documenti sottostanti rimangono in vostro possesso fino a quando non
li inviate a un destinatario. I destinatari verificano di aver ricevuto
gli stessi byte che avete sigillato.

## Quando usare questo kit

Dovreste considerare di sigillare un manifesto **prima** di trasmettere
prove a un giornalista, regolatore o avvocato, se tutte le seguenti
condizioni sono vere:

- Avete prove in forma digitale (PDF, e-mail, immagini, ecc.) che
  desiderate preservare come autentiche byte per byte.
- Vi aspettate che gli intermediari possano alterare, contestare o
  seppellire le prove.
- Potete mantenere i documenti sottostanti in vostro possesso fino al
  momento della trasmissione.
- Potete pubblicare il manifesto pubblicamente **senza** rivelare il
  contenuto dei documenti (solo gli hash sono pubblici).
- Avete soppesato i rischi di diventare pubblicamente identificabili
  come whistleblower (il campo del principale firmatario). Se agite in
  modo anonimo, utilizzate uno pseudonimo in modo coerente in tutte le
  pubblicazioni correlate.
- Avete consultato un avvocato sulla legislazione di protezione del
  whistleblower nella vostra giurisdizione.

## Quando NON usare questo kit

NON utilizzate questo kit se:

- I documenti stessi contengono informazioni personali su terzi
  (pazienti, clienti, dipendenti) che non dovrebbero essere rese
  pubblicamente hashabili. Calcolate l'hash di una versione redatta,
  non dell'originale.
- Il solo atto di pubblicare il manifesto identificherebbe il
  whistleblower in un modo a cui egli non ha acconsentito.
- Non avete ancora consultato un avvocato. Il protocollo è uno
  strumento; la legislazione di protezione del whistleblower è
  specifica per ogni giurisdizione e vive al di fuori del protocollo.
- Potreste voler ritrattare in seguito una qualsiasi singola accusa.
  Il sigillo è permanente; nuove correzioni sigillate sono l'unica
  modalità onesta di revisione.
- State facendo questo sotto coercizione o pressione temporale. Il
  protocollo amplifica la coercizione; la barriera di rifiuto
  (myriam-kit `SPEC §8`) si applica ai whistleblower tanto quanto ai
  pubblicatori.

## Come forkare questo kit per una divulgazione reale

```bash
# 1. Copiate questo esempio in una nuova directory
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Rimuovete il contenuto fittizio; sostituitelo con i vostri fatti reali.
# Ogni file sotto facts/ è un fatto. Leggete ciascuno e sostituitelo.
$EDITOR facts/01_example_notice.txt   # cambiate in una vera dichiarazione di copertura
$EDITOR facts/02_provenance.txt       # vera provenienza delle vostre prove
$EDITOR facts/03_evidence_manifest.txt # calcolate l'hash dei vostri documenti reali e elencateli
$EDITOR facts/04_allegation_summary.txt # la vostra accusa reale
$EDITOR facts/05_threat_model.txt     # le vostre risposte attese reali
$EDITOR facts/06_recipient_protocol.txt # adattatelo al vostro destinatario
$EDITOR facts/07_no_retraction_commitment.txt # la vostra dichiarazione di non-ritrattazione
$EDITOR facts/08_signing_principal.txt # la vostra identità di firma reale (o pseudonimo)

# 3. Aggiornate site/index.html per riflettere i fatti reali.
# Lo script seal.sh NON popola automaticamente l'HTML; la modifica manuale
# è il passaggio di revisione umana.
$EDITOR site/index.html

# 4. Sigillate.
bash build/seal.sh
# Output: merkle_root.txt, merkle_root.txt.ots, CID IPFS

# 5. Verificate localmente.
python3 build/verify.py

# 6. Pubblicate il manifesto (NON i documenti) su uno qualsiasi dei seguenti:
#    - Un host statico che controllate (Cloudflare Pages, GitHub Pages, ecc.)
#    - La rete IPFS al CID stampato
#    - Entrambi (raccomandato)

# 7. Separatamente, trasmettete i documenti sottostanti al destinatario
#    attraverso un canale sicuro di vostra scelta (Signal, SecureDrop, ecc.).
#    Il destinatario verifica gli hash dei file confrontandoli con il vostro manifesto.
```

## Calcolo degli hash per i file di prova reali

Per calcolare l'hash di un file documento con SHA-256:

```bash
shasum -a 256 my_document.pdf
```

I primi 64 caratteri esadecimali sono lo SHA-256. Inseritelo nel
manifesto.

Potete calcolare l'hash di molti file insieme:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Questo vi fornisce i dati per `facts/03_evidence_manifest.txt`.

## Note di sicurezza operativa

Il protocollo MYRIAM NON fornisce sicurezza operativa. Fornisce
*durabilità probatoria*. Avete comunque bisogno di:

- Un canale di comunicazione sicuro con il vostro avvocato
  ([Signal](https://signal.org/), di persona, oppure il canale sicuro
  consolidato del vostro avvocato)
- Una posizione di archiviazione sicura per i documenti sottostanti
  (crittografati a riposo, non su servizi cloud a cui il vostro datore
  di lavoro può accedere)
- Un dispositivo pulito per la sigillatura (un laptop personale non
  associato ad account del datore di lavoro; preferibilmente uno
  utilizzato esclusivamente per questo scopo)
- Una rete pulita per la pubblicazione (non la rete del vostro datore
  di lavoro, non il vostro IP domestico se il vostro datore di lavoro
  potrebbe citare in giudizio il vostro provider Internet)

Letture consigliate sulla sicurezza operativa per whistleblower:

- [La documentazione SecureDrop di The Intercept](https://securedrop.org/)
- [Le risorse della Freedom of the Press Foundation](https://freedom.press/)
- [La guida di autodifesa contro la sorveglianza dell'EFF](https://ssd.eff.org/)

Consultatele PRIMA di iniziare il processo di sigillatura. Il protocollo
non protegge da scelte di opsec errate fatte prima che il protocollo
venga invocato.

## Cosa dovrebbero sapere i destinatari

Inviate ai destinatari questa README insieme al manifesto sigillato. Il
manifesto stesso contiene il protocollo del destinatario (FACT 06), ma
la README espande il ruolo del destinatario:

- **Giornalisti**: verificate prima l'integrità del manifesto stesso.
  Poi richiedete i documenti attraverso un canale sicuro separato.
  Verificate che lo SHA-256 di ciascun documento corrisponda al
  manifesto prima della pubblicazione. NON pubblicate i documenti senza
  il consenso del whistleblower; pubblicate invece l'esistenza del
  manifesto sigillato e la vostra conclusione di verifica.
- **Regolatori**: lo stesso processo di verifica. Il manifesto sigillato
  con i documenti corrispondenti è la forma probatoria più solida
  disponibile al di fuori di una raccolta formale con catena di custodia.
- **Avvocati**: il manifesto sigillato fornisce un ancoraggio forense
  per l'esistenza dei documenti nel momento dichiarato. Spetta a voi
  determinare se soddisfi le regole probatorie di una specifica
  giurisdizione.

## Cosa questo kit NON è

- Non è un sostituto della consulenza legale.
- Non è una garanzia che qualcuno agirà sulla vostra divulgazione.
- Non è una protezione contro le ritorsioni.
- Non è un'autenticazione del contenuto dei documenti (solo dei loro
  byte nel momento della sigillatura).
- Non è un modo per comunicare anonimamente con chicchessia — il
  sigillo è pubblico; se il nome del vostro principale firmatario è
  reale, voi siete identificati. Anche con uno pseudonimo, un manifesto
  sigillato può essere usato per identificare un whistleblower se
  trapelano metadati; il protocollo non può difendere contro
  l'identificazione del principale tramite altri mezzi.

## Chiusura

Un manifesto sigillato è una cosa piccola. È un singolo flusso di byte
che dimostra che un insieme più ampio di flussi di byte esisteva in una
particolare forma in un particolare momento. Questa piccolezza è la sua
forza: fa una sola cosa, e fa quell'unica cosa per tutta la durata di
vita della blockchain di Bitcoin.

Se state leggendo questo perché state considerando di diventare un
whistleblower, per favore: parlate prima con un avvocato. Utilizzate le
guide di sicurezza operativa sopra indicate. Poi, se e solo se tutte
quelle considerazioni a monte sono in ordine, considerate questo kit
come la spina dorsale crittografica della vostra divulgazione. La
crittografia è la parte facile. Tutto ciò che è a monte della
crittografia è dove vive il vero rischio.

## Licenza

Pubblico dominio (CC0). Forkatelo. Miglioratelo. Usatelo senza chiedere
permesso.
