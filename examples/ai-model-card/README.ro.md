*Traducere română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit pentru blocarea comportamentului modelelor AI

Un exemplu turnkey de myriam-kit pentru laboratoarele de AI (comerciale sau open-source)
care lansează un model și doresc să facă afirmațiile lansării —
identitatea ponderilor, capacitățile, scorurile de evaluare, revizuirea de siguranță,
angajamentele pre-implementare — **ancorate criptografic și
verificabile public**.

Kit-ul apără împotriva modului specific de eșec în care modelele implementate
derivează tăcut, scorurile de evaluare sunt rescrise retroactiv sau afirmațiile pre-implementare
sunt contestate ani mai târziu ca „nu am spus niciodată asta”.

## Ce produce acest kit

Un manifest sigilat criptografic conținând, pentru o singură lansare de model:

1. Identificarea modelului (nume, arhitectură, număr de parametri, licență)
2. **SHA-256 al fișierului de ponderi** — hash-ul canonic al artefactului
3. Textul model card-ului (capacități, utilizare intenționată, utilizare în afara domeniului,
   moduri de eșec cunoscute)
4. Rezultate de evaluare la lansare (evaluări de capacitate, evaluări de siguranță,
   calibrare)
5. Angajamente pre-implementare (lucrurile pe care vă angajați să nu le modificați
   tăcut după lansare)
6. Principalul semnatar (persoana fizică + organizația care își asumă responsabilitatea)

Sigilarea face fiecare dintre acestea stabil la nivel de octet, ancorat în timp în Bitcoin prin
OpenTimestamps și recuperabil prin IPFS independent de orice parte unică
de găzduire.

Vedeți exemplul fictiv elaborat: [facts/](facts/) și pagina randată
[site/index.html](site/index.html). Exemplul folosește un model fictiv
(„Calm-mini-v0”); o lansare reală ar înlocui conținutul exemplului.

## Împotriva căror eșecuri apără acest kit

**Modurile de eșec pe care sigilarea le surprinde direct:**

- **Falsificarea ponderilor** — SHA-256 al fișierului de ponderi lansat este în
  FACT 03. Orice alterare post-lansare a octeților pe care un utilizator îi descarcă
  este detectabilă prin rehash.
- **Rescrieri retroactive tăcute ale evaluărilor** — scorurile de evaluare la lansare sunt în FACT 05.
  Disputele viitoare de tipul „scorul de evaluare a fost întotdeauna X” au o ancoră publică.
- **Deriva afirmațiilor de capacitate** — textul model card-ului din FACT 04 este
  stabil la nivel de octet. Disputele viitoare de tipul „nu am revendicat niciodată capacitatea X” sunt
  verificabile public împotriva textului sigilat.
- **Redistribuirea tăcută a fine-tuning-ului** — angajamentul pre-implementare #1
  din FACT 06 (în exemplul elaborat) este „fără fine-tuning tăcut sub
  același nume”. Detectare: orice hash nou de ponderi înseamnă un nou nume de model
  și o nouă publicație sigilată, sau angajamentul este încălcat.
- **Moduri de eșec ascunse** — FACT 04 se angajează la o listă de moduri de eșec
  cunoscute. Lista este monotonă (poate crește, nu se poate micșora pentru un checkpoint
  înghețat). Descoperirile viitoare ale unor moduri de eșec despre care laboratorul știa
  intern, dar nu le-a publicat, devin dovezi contestabile.

**Moduri de eșec NEACOPERITE:**

- Modele utilizate greșit de utilizatori downstream (sigilarea dovedește ce a fost
  lansat, nu ce fac utilizatorii cu acesta).
- Fine-tuning adversarial de către terți (un fine-tune de la o terță parte
  produce un hash diferit de ponderi, astfel încât sigilarea originală nu este afectată,
  dar modelul terței părți este în afara protecției sigilării).
- Modificări de comportament datorate schimbărilor în mediul de implementare (diferite
  prompt-uri de sistem, configurații RAG etc.).
- Eșecuri despre care laboratorul cu adevărat nu știa la momentul lansării.
  Sigilarea angajează laboratorul față de *ceea ce știa*; nu poate ancora ceea ce
  nu știa.

## Când să folosiți acest kit

Ar trebui să luați în considerare sigilarea unui model card dacă:

- Lansați ponderi de model public SAU implementați un model într-un
  context în care utilizatorilor downstream le pasă de stabilitatea comportamentului.
- Lansarea este suficient de semnificativă încât disputele viitoare de tipul „nu am spus niciodată asta”
  sunt plauzibile (orice model implementat la scară; orice model
  critic pentru siguranță; orice lansare însoțită de afirmații
  de capacitate).
- Organizația voastră este dispusă să facă angajamente pre-implementare
  care constrâng acțiunile viitoare (acesta este punctul critic — vedeți
  secțiunea următoare).
- Puteți calcula SHA-256 al fișierului de ponderi la lansare.

## Când să NU folosiți acest kit

NU folosiți acest kit dacă:

- Nu sunteți dispus să fiți obligat de angajamentele pre-implementare din
  FACT 06 din exemplu. Sigilarea face angajamentele detectabile mecanic;
  dacă nu sunteți pregătit pentru această răspundere, nu
  sigilați.
- Fișierul de ponderi se va schimba frecvent (de exemplu, pipeline-uri continue
  de fine-tuning). Fiecare modificare a ponderilor necesită o nouă lansare sigilată.
  Sigilarea per lansare este grea; acest kit este pentru checkpoint-uri *înghețate*.
- Nu ați făcut încă revizuirea de siguranță. Sigilarea angajează concluziile
  revizuirii de siguranță. Dacă sigilați o revizuire incompletă, aveți o
  înregistrare publică permanentă a unei revizuiri incomplete.
- Ați putea dori să retrageți ulterior un scor de evaluare specific. Sigilarea este
  permanentă. Noi publicații sigilate pot înlocui, dar originalul
  nu poate fi anulat.

## Angajamentele critice pre-implementare

FACT 06 din exemplu îl angajează pe publicator să:

1. **Fără fine-tuning tăcut sub același nume.** Orice fine-tune
   produce un nume nou de model, o nouă publicație sigilată, un hash nou de ponderi.
   Predecesorul rămâne canonic ca versiune denumită.

2. **Fără actualizări tăcute ale evaluărilor.** Re-evaluările primesc noi publicații sigilate
   care fac referire la original prin rădăcina Merkle. Versiunile sunt urmărite,
   nu suprascrise.

3. **Modurile de eșec cunoscute pot crește, niciodată nu se pot micșora.** Un checkpoint înghețat
   nu poate avea modurile de eșec reparate. Așadar, lista publicată este
   efectiv monotonă.

4. **Gestionarea retragerilor.** Dacă este obligat să elimine modelul din
   distribuție, laboratorul se angajează să publice o declarație finală sigilată
   a retragerii.

Un laborator care adoptă acest kit trebuie să decidă pe care dintre aceste angajamente
le poate onora efectiv. Dacă nu le puteți onora pe toate patru, modificați FACT 06 *înainte*
de sigilare pentru a reflecta ceea ce puteți onora și acceptați protecția
slăbită rezultată. Sigilarea unor angajamente pe care nu intenționați să le onorați este
mai rea decât a nu sigila deloc.

## Cum să faceți fork acestui kit pentru o lansare reală

```bash
# 1. Copiați acest exemplu în pipeline-ul vostru de lansare
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Editați fiecare fapt pentru lansarea voastră reală
$EDITOR facts/01_example_notice.txt   # ELIMINAȚI — lansarea voastră nu este un exemplu
                                       # Înlocuiți cu un anunț de lansare pentru modelul vostru
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # model card-ul canonic
$EDITOR facts/05_eval_results.txt     # rezultatele reale ale evaluării
$EDITOR facts/06_release_commitments.txt # ce angajamente puteți onora

# 3. Actualizați site/index.html pentru a reflecta lansarea reală.

# 4. Sigilați.
bash build/seal.sh

# 5. Verificați local.
python3 build/verify.py

# 6. Implementați la:
#    - Pagina voastră de lansare (lângă model card și ponderi)
#    - Rețeaua IPFS (scriptul seal.sh face deja acest lucru)
#    - Opțional: link către publicația sigilată din
#      notele de lansare Hugging Face / GitHub
```

## Integrarea cu pipeline-uri de lansare existente

Kit-ul este conceput să se compună cu instrumentele existente, nu să le înlocuiască:

- **Hugging Face**: includeți URL-ul sau IPFS CID al publicației sigilate în
  README.md al model card-ului. Direcționați cititorii către sigilare pentru afirmații
  de lansare stabile la nivel de octet.
- **Lansări GitHub**: includeți chitanța OpenTimestamps
  (`merkle_root.txt.ots`) ca activ de lansare. Disputele viitoare de tipul „lansarea
  s-a schimbat” sunt apoi ancorate în Bitcoin.
- **Standardele de model card (Mitchell et al. 2019)**: kit-ul este
  compatibil. Câmpurile standard ale model card-ului corespund FACTS 02–05 din
  sigilare. Produceți model card-ul în mod normal și, în plus, îl sigilați.
- **Harness-uri de evaluare (lm-evaluation-harness, BIG-bench etc.)**: faceți hash
  pentru commit-ul exact al harness-ului și pentru JSON-ul brut de ieșire; faceți referință la aceste hash-uri
  în FACT 05. Re-rulările viitoare devin apoi reproductibile independent.

## Calcularea hash-ului ponderilor

Pentru un singur fișier safetensors:

```bash
shasum -a 256 model.safetensors
```

Pentru checkpoint-uri cu mai multe fișiere (shard-uri GGUF, safetensors fragmentat):

```bash
# Concatenați hash-urile în ordine sortată, apoi faceți hash din nou
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Hash-ul final este cel care merge în FACT 03. Includeți atât hash-urile per shard,
cât și hash-ul agregat final, astfel încât utilizatorii să poată verifica shard-uri
individuale pe măsură ce le descarcă.

## Ce ar trebui să știe destinatarii (utilizatorii modelului vostru)

O lansare de model cu o publicație sigilată MYRIAM îi permite utilizatorului să:

1. **Verifice ponderile descărcate** prin rehash și comparare
   cu FACT 03.
2. **Verifice că model card-ul nu a fost rescris retroactiv** prin verificarea
   FACT 04 sigilat împotriva versiunii curente publicate a laboratorului.
3. **Verifice că scorurile de evaluare sunt cele de la lansare** prin compararea
   afirmațiilor curente de evaluare ale laboratorului cu FACT 05 sigilat.
4. **Tragă laboratorul la răspundere pentru angajamentele sale pre-implementare** prin
   verificarea comportamentului real împotriva FACT 06 sigilat.

Un utilizator care găsește discrepanțe are dovezi criptografice ale
discrepanței. Acesta poate publica acele dovezi; publicația sigilată
originală este ancora.

## Ce NU este acest kit

- Nu este un substitut pentru efectuarea efectivă a revizuirii de siguranță. Sigilarea este
  *înregistrarea* revizuirii de siguranță, nu revizuirea în sine.
- Nu este un substitut pentru evaluări reale. Sigilarea ancorează scorurile pe care
  le produceți; nu validează metodologia.
- Nu este o garanție că modelul este sigur. Sigilarea documentează ceea ce laboratorul
  afirmă despre model la lansare; nu certifică acele afirmații.
- Nu este protecție împotriva utilizării greșite a modelului de către utilizatorii downstream.

## O notă despre fine-tuning-ul adversarial

O preocupare comună în siguranța AI: cineva face fine-tuning modelului vostru pentru a elimina
comportamentele de siguranță și îl redistribuie. Sigilarea NU POATE preveni acest lucru.
Ce poate face sigilarea este:

- Să ancoreze ce ar fi trebuit să facă modelul *original* (FACT 04).
- Să ancoreze care au fost scorurile de evaluare originale (FACT 05).
- Să ofere un punct de referință în raport cu care fine-tune-urile adversariale pot
  fi măsurate.

Un utilizator care întâlnește o redistribuire de la o terță parte poate verifica dacă
ponderile corespund hash-ului original sigilat. Dacă nu, utilizatorul știe
că are un model non-original și că orice afirmații de siguranță atribuite
laboratorului nu se aplică.

## Încheiere

Sigilarea unei lansări de model este o muncă suplimentară mică pentru laborator: ~10 minute
pentru a calcula hash-urile și a rula scriptul de sigilare, apoi o decizie de 30 de secunde
despre ce angajamente pre-implementare să includă. Răspunderea
pe care o adaugă este asimetrică: cost mic pentru laboratoarele oneste, constrângere mare asupra
laboratoarelor care altfel și-ar deriva tăcut afirmațiile.

Dacă sunteți un laborator de AI care ia în considerare adoptarea, kit-ul este domeniu public
(CC0). Faceți-i fork. Modificați-l. Matematica este partea critică, nu
implementarea specifică.

## Licență

Domeniu public (CC0). Nu este necesară nicio atribuire.
