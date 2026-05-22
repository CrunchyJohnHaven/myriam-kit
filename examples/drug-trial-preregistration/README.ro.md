*Traducere în limba română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit de pre-înregistrare a studiilor clinice de medicamente

Un exemplu turnkey de myriam-kit pentru sponsorii studiilor clinice și
investigatorii academici care doresc să pre-înregistreze un studiu
într-un mod evident la manipulare, ancorat în Bitcoin, **în plus
față de** înregistrarea la ClinicalTrials.gov, EU CTR sau alte
registre jurisdicționale.

## De ce să pre-înregistrezi *în plus* sub MYRIAM?

Registrele existente de studii clinice (ClinicalTrials.gov, EU CTR,
ISRCTN) au slăbiciuni documentate de integritate:

- ClinicalTrials.gov permite sponsorilor să actualizeze
  endpoint-urile, calculele dimensiunii eșantionului și planurile
  de analiză **după** înregistrarea originală, datele modificării
  fiind vizibile în registru, dar schimbările *conținutului* nu
  sunt întotdeauna ancorate criptografic.
- Mai multe studii mari (Goldacre et al., 2019; Mathieu et al.,
  2009) au documentat schimbarea sistematică post-hoc a
  endpoint-urilor în domeniu.
- Aplicarea editorială de către reviste (CONSORT, ICMJE) prinde
  unele cazuri; multe scapă.

Un sigiliu MYRIAM închide acest gol. Rădăcina Merkle + chitanța
Bitcoin OTS face orice schimbare post-hoc a endpoint-ului primar
*pre-înregistrat*, a planului de analiză statistică sau a listei
de subgrupuri detectabilă criptografic. Sigiliul este forensic mai
greu de retconnat decât registrul în sine.

Acest kit este un **complement la**, nu un înlocuitor pentru,
registrele jurisdicționale. Un studiu real ar trebui să se
înregistreze în registrul corespunzător ȘI să se sigileze sub
MYRIAM.

## Împotriva a ce se apără acest kit

Cazuri istorice de mortalitate cu care acesta ar fi ajutat:

- **Vioxx (Merck, 2004)**: evenimentele cardiovasculare au fost un
  endpoint pre-înregistrat în studiul APPROVe, dar analiza
  publicată a folosit o limită care a minimizat dauna aparentă.
  Un sigiliu al limitei pre-înregistrate ar fi făcut schimbarea
  limitei post-hoc detectabilă public înainte de lucrarea
  publicată.
- **Paxil/Studiul 329 (GSK/SmithKline, 2001)**: datele negative
  ale studiului privind suicidalitatea adolescenților au fost
  reîncadrate prin analiză post-hoc. Pre-înregistrarea sigilată a
  endpoint-urilor ar fi făcut reîncadrarea detectabilă public.
- **Mai multe studii de oncologie** unde endpoint-urile de
  supraviețuire au fost schimbate la endpoint-uri surogat
  (supraviețuire fără progresie, rata de răspuns) când beneficiul
  de supraviețuire nu s-a materializat.

**Moduri de eșec pe care le prinde direct sigiliul:**

- **Schimbarea endpoint-urilor**: promovarea post-hoc a unui
  endpoint secundar la „primar" când primarul real eșuează. FACT
  05 al sigiliului conține endpoint-ul primar pre-înregistrat;
  endpoint-ul primar publicat trebuie să se potrivească.
- **Cherry-picking-ul rezultatelor**: raportarea selectivă doar a
  analizelor care au funcționat. FACT 06 conține planul de analiză
  pre-înregistrat complet; analizele publicate trebuie să le
  includă pe toate cele pre-înregistrate.
- **Mineritul subgrupurilor post-hoc**: pretenția „medicamentul
  funcționează pentru subgrupul X" după vizualizarea datelor.
  FACT 07 conține lista de subgrupuri pre-înregistrate; orice
  alt subgrup trebuie etichetat post-hoc.
- **Revizuirea dimensiunii eșantionului**: creșterea dimensiunii
  eșantionului după vizualizarea tendințelor intermediare. FACT
  06 conține dimensiunea eșantionului pre-înregistrată și
  calculul de putere.
- **Eliminarea tăcută a endpoint-urilor secundare inconvenabile**:
  FACT 05 pre-ordonează endpoint-urile secundare pentru testare
  ierarhică; orice reordonare sau eliminare este detectabilă.
- **Suprimarea rezultatelor negative**: FACT 08 conține
  angajamentul de publicare; nereușita publicării în fereastra
  angajată este vizibilă public.

**Moduri de eșec NEACOPERITE:**

- Conduită necorespunzătoare în însăși execuția studiului (date
  falsificate, înrolare frauduloasă). Sigiliul ancorează
  *planul*, nu *execuția*.
- Raportarea selectivă în publicațiile care includ toate
  analizele pre-înregistrate, dar le interpretează favorabil.
  Sigiliul prinde ce lipsește; nu poate prinde bias-ul
  interpretativ.
- Vătămarea pacientului în timpul studiului în sine. Sigiliul
  este de reglementare și probatoriu; nu reduce riscul de
  desfășurare al studiului.

## Când să folosești acest kit

Ar trebui să iei în considerare sigilarea unei pre-înregistrări dacă:

- Sponsorizezi sau conduci un studiu clinic — Faza 1 până la 4 —
  care va fi folosit pentru a informa decizii medicale sau de
  reglementare.
- Ești dispus să fii public legat de proiectul, endpoint-urile și
  planul de analiză pre-înregistrate.
- Poți face față consecinței: dacă studiul eșuează la
  endpoint-urile pre-înregistrate, nu poți retconne în liniște la
  un alt endpoint care a funcționat.
- Participi la o cultură de cercetare (medicină academică,
  grupuri cooperative, cercetare finanțată de NIH) unde
  integritatea pre-înregistrării este din ce în ce mai cerută.

Acest kit este *în special* valoros pentru:

- Studiile inițiate de investigator la instituții academice (unde
  presiunea sponsorului de a schimba endpoint-urile post-hoc este
  reală, dar unde investigatorul academic are stimulent
  reputațional să reziste).
- Studiile de știință deschisă și studiile de știință cetățenească.
- Studiile de reutilizare a medicamentelor în biotech mici fără
  istoric lung de desfășurare a studiilor.
- Orice studiu destinat să informeze depunerile de reglementare
  unde s-ar putea face argumente viitoare de „nu am spus
  niciodată asta".

## Când să NU folosești acest kit

NU folosi acest kit dacă:

- Protocolul studiului este într-adevăr încă în flux.
  Pre-înregistrează când protocolul este final, nu înainte.
- Nu te poți angaja să publici rezultatele indiferent de direcție.
  Sigiliul face nereușita publicării detectabilă public.
- Studiul implică secrete competitive ale industriei care te
  împiedică să faci public planul de analiză. Sigiliul face
  planul de analiză o înregistrare publică permanentă; nu există
  nicio modalitate de a sigila ceva privat.
- Nu ai aprobare legală și etică a protocolului. Sigiliul
  înregistrează protocolul așa cum l-ai sigilat TU; nu poate fi
  retroactiv aprobat de un IRB sau comitet de etică.

## Cum să faci fork acestui kit pentru o pre-înregistrare reală

```bash
# 1. Copiază acest exemplu
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Înlocuiește conținutul fictiv cu conținutul real al protocolului de studiu.
# Fiecare fapt corespunde unei secțiuni a unei pre-înregistrări standard:
$EDITOR facts/01_example_notice.txt   # ÎNLOCUIEȘTE cu declarația de copertă reală
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMAR + SECUNDAR + EXPLORATOR
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Actualizează site/index.html pentru a reflecta studiul real.

# 4. Sigilează (ÎNAINTE de începerea înrolării, ÎNAINTE de blocarea bazei de date):
bash build/seal.sh

# 5. Verifică local:
python3 build/verify.py

# 6. Implementează:
#    - Publică URL-ul sigiliului pe site-ul sponsorului studiului ȘI
#    - Adaugă CID-ul IPFS la câmpul „Description" sau „References" al
#      înregistrării ClinicalTrials.gov a studiului, astfel încât
#      înregistrarea registrului să facă referințe încrucișate la
#      sigiliul criptografic.
```

**SINCRONIZARE CRITICĂ**: sigiliul trebuie creat ÎNAINTE de
începerea înrolării. O pre-înregistrare sigilată după înrolarea
primului pacient este forensic mult mai slabă. Ideal, sigilează în
momentul aprobării IRB.

## Integrarea cu infrastructura de pre-înregistrare existentă

Kit-ul este conceput să se compună, nu să înlocuiască:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: înregistrează studiul
  în registrul jurisdicțional după cum este necesar. Apoi, în
  câmpul „Description" sau „References" al registrului, leagă la
  publicarea sigilată MYRIAM.
- **OSF (Open Science Framework)**: OSF acceptă pre-înregistrare
  cu marcaje de timp, dar nu cu ancorare Bitcoin. Sigiliul MYRIAM
  poate fi atașat ca fișier suplimentar pe pagina de
  înregistrare OSF, oferind atât marcaj de timp, cât și ancoră
  Bitcoin.
- **AsPredicted.org**: similar — leagă sigiliul MYRIAM ca URL
  suplimentar.
- **Reviste**: unele reviste (de ex., Trials, BMJ Open) acceptă
  URL-uri de pre-înregistrare ca parte din depunere. Include
  URL-ul sigiliului MYRIAM alături de URL-ul registrului.

## Ce primesc destinatarii (reglementatori, recenzori de reviste, meta-analiști)

Un studiu pre-înregistrat sub MYRIAM oferă recenzorilor:

1. **Dovada criptografică că protocolul a fost finalizat la o
   anumită oră.** Recenzorii pot verifica timpul sigilării prin
   chitanța OTS.
2. **Stabilitatea bytewise a textului protocolului.** Recenzorii
   care compară secțiunea de metode publicată cu proiectul
   pre-înregistrat pot face acest lucru caracter-cu-caracter.
3. **Detectarea schimbării endpoint-urilor.** Un diff simplu
   între FACT 05 sigilat și endpoint-ul primar publicat
   dezvăluie orice substituire.
4. **Detectarea abaterii planului de analiză.** Un diff simplu
   între FACT 06 sigilat și metodele statistice publicate
   dezvăluie modificările.
5. **Detectarea raportării selective a subgrupurilor.** FACT 07
   sigilat conține toate subgrupurile pre-înregistrate; orice din
   publicație care nu este în sigiliu trebuie etichetat post-hoc.

Acest lucru face revizuirea sistematică și meta-analiza substanțial
mai ușoare decât practica actuală.

## Ce NU este acest kit

- Nu este un substitut pentru aprobarea IRB / comitet de etică.
- Nu este un substitut pentru înregistrarea în registrul
  jurisdicțional.
- Nu este o garanție că studiul va fi desfășurat conform
  planului.
- Nu este o modalitate de a ancora consimțământul pacientului sau
  alte documente etice (acelea au nevoie de propriul lor mecanism
  de sigilare).
- Nu este o protecție împotriva criticii post-publicare a
  designului studiului.

## O notă despre publicarea rezultatelor negative

Angajamentul #1 din FACT 08 („publicarea indiferent de direcție")
este angajamentul cu cel mai mare impact-de-mortalitate din
sigiliu. Suprimarea istorică a rezultatelor negative ale studiilor
(în special pentru medicamentele psihiatrice la adolescenți,
medicamentele oncologice la populațiile vârstnice și medicamentele
cardiovasculare la femei) a contribuit plauzibil la mii de decese
preventabile de-a lungul deceniilor prin supra-prescriere bazată
pe estimări de eficacitate părtinitoare.

Un angajament sigilat de a publica rezultate negative este, prin
sine însuși, una dintre cele mai cu pârghie mișcări de sănătate
publică pe care le poate face un sponsor. Sigiliul oferă
responsabilitate externă pentru acel angajament într-un mod în
care politicile de publicare auto-poliționate nu o fac.

## Concluzie

Pre-înregistrarea studiilor de medicamente sub MYRIAM este o
muncă suplimentară mică pentru sponsor: ~30 minute pentru a
popula faptele, ~10 secunde pentru a sigila. Responsabilitatea pe
care o adaugă este asimetrică: cost mic pentru desfășurarea
onestă a studiului, constrângere mare asupra manevrelor post-hoc
care au contribuit la prejudecățile istorice în baza de dovezi.

Dacă ești un sponsor sau investigator principal care ia în
considerare acest kit, kit-ul este domeniu public (CC0). Folosește-l.
Modifică-l. Îmbunătățește-l.

## Licență

Domeniu public (CC0). Nu este necesară atribuirea.
