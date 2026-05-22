*Traducere română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit de sigiliu pentru lanțul de custodie al probelor judiciare

Un exemplu myriam-kit gata de utilizare pentru echipele de achiziție
forensică — examinatori forensici de calculatoare, tehnicieni de
extragere a dispozitivelor mobile, custozi ai probelor de la camerele
corporale, supervizori de laborator — care doresc să publice un
sigiliu ancorat în Bitcoin și care dezvăluie orice modificare,
indicând *ce octeți au fost achiziționați* și *când*, în momentul
achiziției probelor digitale, astfel încât disputele privind lanțul
de custodie să aibă o ancoră publică.

---

## Ce NU face acest kit (citiți primul)

Sigiliul este o ștampilă de timp criptografică a CARE IMAGINI
FORENSICE au fost achiziționate, CÂND au fost achiziționate, de
către CARE AGENȚIE, sub CARE MANDAT și prin CARE METODOLOGIE. Nu
poate răspunde la nicio întrebare despre caz dincolo de asta.
Următoarele sunt **în afara domeniului sigiliului**:

1. **Admisibilitatea conform Federal Rules of Evidence (sau orice
   alt cod probatoriu).** Sigiliul ancorează octeți și ștampile de
   timp. Dacă o probă este admisibilă — conform FRE 901 (autentificare),
   FRE 702 (mărturie de expert / Daubert), FRE 403 (echilibru de
   prejudiciu) sau orice echivalent statal — este o chestiune de
   procedură legală. O achiziție perfect sigilată poate fi totuși
   declarată inadmisibilă; o achiziție nesigilată poate fi totuși
   admisă. Sigiliul este o probă suplimentară de integritate, nu un
   substitut pentru hotărârea de admisibilitate a instanței.

2. **Dacă confiscarea a fost legală.** Conformitatea cu al Patrulea
   Amendament, validitatea mandatului, respectarea domeniului,
   aplicabilitatea regulii de excludere — toate acestea sunt în
   amonte de sigiliu. Sigiliul înregistrează că achiziția s-a
   întâmplat sub mandatul FICT-SW-2026-0188; dacă mandatul a fost
   emis și servit legal este pentru instanță.

3. **Dacă proba este incriminatorie, dezvinovățitoare sau neutră.**
   Sigiliul ancorează hash-uri; interpretările a ceea ce conțin
   aceste hash-uri aparțin raportului de examinare forensică, care
   este propriul său document cu propriul său regim de descoperire
   și probatoriu. Sigiliul va refuza să sigileze "FACT N: laptopul
   suspectului conținea material incriminator" — vezi regula de
   refuz R4.

4. **Dacă lanțul de custodie este corect procedural conform legii
   probatorii a statului aplicabil.** Sigiliul înregistrează jurnalul
   evenimentelor de custodie contemporan al agenției (FACT 05). Dacă
   acest jurnal satisface cerințele de lanț de custodie ale unui
   anumit stat este pentru instanță la audiența probatorie.

5. **Dacă metodologia forensică a fost fiabilă.** Daubert și
   descendenții săi (și analogii la nivel de stat precum Frye, unde
   se aplică încă) evaluează fiabilitatea metodologică. Sigiliul
   înregistrează CARE instrumente și versiuni au fost utilizate
   (FACT 04); dacă aceste instrumente îndeplinesc standardul de
   fiabilitate al oricărei instanțe specifice este pentru instanță.
   Erori ale instrumentelor au fost documentate post-achiziție în
   cazuri trecute; rolul sigiliului este de a face înregistrarea
   versiune-și-hash-binar public refutabilă, nu de a garanta
   instrumentele însele.

6. **Dacă proba a fost manipulată ÎNAINTE de achiziție.** Sigiliul
   ancorează octeții din momentul imaginii înainte. Dacă un suspect,
   un ofițer sau o terță parte a modificat dispozitivul sursă
   înainte ca acesta să fie imaginat, sigiliul nu poate detecta acest
   lucru — sigilează octeții alterați cu aceeași integritate cu care
   ar sigila originalul. Valoarea sigiliului începe cu ștampila de
   timp a imaginii.

7. **Dacă domeniul mandatului a fost respectat.** Anexa mandatului
   definește ce poate fi achiziționat; sigiliul înregistrează ce A
   fost achiziționat. Dacă achiziția a depășit domeniul mandatului
   este, din nou, o chestiune legală cu propriul său remediu (mișcare
   de suprimare conform procedurii statului corespunzător).

8. **Re-identificarea oricărei părți private a investigației.**
   Sigiliul refuză să publice orice nume, identificator sau amprentă
   care ar putea re-identifica un suspect, inculpat, victimă,
   martor sau ocupant al localului. Referința la dosarul cazului
   este mânerul corespunzător pentru părțile cu capacitate de a
   localiza cazul.

**Secțiunea de limite oneste de mai sus este partea portantă a
acestui kit.** Echipele forensice care cred că sigilarea echivalează
cu admisibilitatea îl vor folosi ca scut. Kitul trebuie să spună
clar: *aceasta este o primitivă de ne-repudiere pentru momentul
achiziției, nu o dovadă a achiziției legale, a soliditații metodologice
sau a lanțului de custodie recunoscut de instanță.*

---

## Ce trebuie să REFUZE acest kit să sigileze

Kitul este configurat pentru a respinge următoarele tipare de fapte
chiar dacă un utilizator cu autoritate de semnătură de agenție
validă le supune:

- **Identificare personală a suspecților, inculpaților, victimelor,
  martorilor sau a oricărei terțe părți private.** Referința la
  dosarul cazului este mânerul pentru părțile cu capacitate;
  sigiliul public nu trebuie să fie un index de re-identificare.
- **Nume personale ale examinatorilor forensici sau ale altui
  personal de agenție în sigiliul public.** Rolurile sunt publice;
  legăturile persoană-la-rol sunt sigilate separat și descoperibile
  sub procesul judiciar.
- **Hash-uri (sau amprente) la nivel de fișier ale materialului
  suspectat de abuz sexual asupra copiilor, șabloane biometrice sau
  orice date de re-identificare a persoanelor vulnerabile — chiar și
  prin hash.** Un SHA-256 al unui fișier individual este un
  identificator permanent căutabil; publicarea acestuia într-un
  registru public poate re-victimiza subiecții prin corelarea cu
  baze de date private. Hash-urile la nivel de imagine (la nivel
  de imagine-forensică) ale discurilor complete sunt acceptabile;
  hash-urile la nivel de fișier ale unui astfel de material NU sunt
  NICIODATĂ acceptabile.
- **Concluzii, interpretări, opinii sau concluzii de examinare
  despre ce înseamnă octeții.** Sigiliul ancorează CARE OCTEȚI au
  fost achiziționați și CÂND. Interpretarea aparține raportului de
  examinare descoperibil, nu unui registru public care dezvăluie
  modificările.
- **Pretenții de admisibilitate sau orice altă concluzie legală**
  ("această probă este admisibilă", "mandatul a fost legal",
  "lanțul de custodie a fost adecvat conform §X.Y"). Concluziile
  legale sunt funcții ale instanței.
- **Sigilare de către oricine altcineva în afara mandatarului
  autorizat al agenției achizitoare.** Un expert al apărării poate
  utiliza kitul pentru a sigila propria verificare independentă a
  manifestului; el nu poate sigila achiziția ORIGINALĂ sub numele
  agenției achizitoare.
- **Legături rol-la-individ în interiorul sigiliului public.**
  Legăturile sunt sigilate într-un registru însoțitor separat
  (hash-uit în FACT 05) sub controlul de acces al agenției.
- **Fapte investigative pre-confiscare sau pre-mandat.** Declarații
  ale informatorilor, supraveghere pre-mandat, intrări de construcție
  paralelă — niciuna dintre acestea nu aparține sigiliului achiziției.
  Sigiliul este limitat la evenimentul achiziției.

Un refuz însuși poate fi sigilat ca un fapt ("Această agenție a
solicitat sigilarea lui X; kitul a refuzat conform regulii de refuz
Y"), creând un registru public al încercării de abuz.

---

## Ce SIGILEAZĂ acest kit

8 fapte în momentul achiziției:

1. **Notă de exemplu** — declară publicația ca exemplu (atestările
   reale o îndepărtează sau o înlocuiesc).
2. **Contextul achiziției** — identificator al cazului, citație a
   mandatului, agenție achizitoare, autoritate solicitantă, data/ora
   confiscării și achiziției, locația achiziției (locația confiscării
   este redactată într-un registru însoțitor sigilat separat pentru
   a evita re-identificarea localului).
3. **Manifestul probelor** — pe element de imagine-forensică: hash
   SHA-256, dimensiunea fișierului, identificator anonimizat al
   dispozitivului sursă, metodă de achiziție, format de imagine
   forensică.
4. **Metodologia achiziției** — numele instrumentelor forensice și
   versiunile exacte (cu hash-uri binare ale instrumentelor),
   marca/modelul și firmware-ul write-blocker-ului, referința de
   verificare NIST CFTT, procedura de verificare utilizată, alegerea
   formatului de imagine.
5. **Jurnalul lanțului de custodie** — cronologie pe eveniment de
   la confiscarea inițială până la sfârșitul imaginii, custozii
   identificați prin ROL (nu prin nume), cu hash-uri ale registrelor
   însoțitoare sigilate separat (legătura rol-la-individ, jurnalul
   GPS de transport, jurnalul de acces la dulapul de probe, fotografii
   ale sigiliului anti-manipulare etc.).
6. **Calificările examinatorului pe rol** — certificări deținute,
   stadiul de educație continuă, numărul de experiență ca martor
   expert prealabil, expunere Daubert, divulgări de conflict de
   interese — toate la nivel de rol, nu personal.
7. **Divulgări însoțitoare și înregistrare de refuz** — investigații
   paralele, contestații de mandat în așteptare, mișcări de probe
   suprimate, protocol de filtru de privilegiu / echipă-de-tăcere în
   vigoare, încercări de achiziție anterioare, revizuirea
   bug-tracker-ului furnizorului; listă explicită a tiparelor pe care
   kitul a refuzat să le sigileze.
8. **Mandatar semnatar** — identificarea agenției achizitoare +
   semnatar la nivel de rol (examinator principal) + co-semnatar la
   nivel de rol (supervizor de unitate) + informații despre cheia
   criptografică.

Fiecare fapt se termină cu convenția de poartă-de-refuz: *"Acest
fapt afirmă doar X. Nu afirmă Y"* (unde Y este cel mai apropiat
mod de eșec din secțiunea "NU face" de mai sus).

---

## Ce apără acest kit

- **Alterare silențioasă post-achiziție a unei imagini forensice.**
  Orice modificare la nivel de octet a oricărei imagini produce un
  SHA-256 diferit, iar imaginea post-modificare nu va verifica
  împotriva manifestului sigilat din FACT 03.
- **Pretenția că "au fost utilizate instrumente diferite".** FACT
  04 înregistrează versiunile exacte ale instrumentelor cu hash-uri
  binare ale instrumentelor; pretențiile ulterioare "de fapt am
  folosit v4.7.0, nu v4.7.1" sunt public refutabile.
- **Pretenția că write-blocker-ul nu a fost activat sau s-a folosit
  un model diferit.** FACT 04 îngheață manifestul write-blocker.
- **Alterarea jurnalului de custodie.** Orice modificare a cronologiei
  evenimentelor de custodie din FACT 05 (adăugarea, eliminarea sau
  re-marcarea-timpului unui eveniment) modifică hash-ul FACT 05 și
  este public detectabilă.
- **Substituirea credențialelor unui examinator diferit.** FACT 06
  îngheață profilul credențialelor la nivel de rol la momentul
  achiziției.
- **Omisiunea selectivă a divulgărilor însoțitoare.** FACT 07
  enumeră categoriile de divulgare așteptate; o categorie goală
  trebuie atestată explicit ("niciuna la momentul achiziției"),
  astfel încât un ulterior "nu ne-am dat seama că asta era relevant"
  să fie public refutabil.
- **Pretenții post-achiziție că examinatorul avea un conflict care
  nu a fost divulgat.** Divulgarea conflictului din FACT 06 este
  înghețată la achiziție; provocările ulterioare pot fi testate
  împotriva ei.

Kitul **nu** apără împotriva corupției contemporane — o echipă care
sigilează intenționat metadate false la momentul achiziției produce
un sigiliu criptografic valid de metadate false. Primitiva este
onestă despre asta: este o primitivă de ne-repudiere pentru pretențiile
contemporane ale agenției, nu o dovadă că acele pretenții sunt
corecte.

---

## Cazuri istorice sau aproape istorice în care kitul ar fi ajutat

Kitul ar fi produs o ancoră utilă — *nu o rezoluție* — în cazuri
trecute în care lanțul de custodie al probelor digitale a devenit o
problemă probatorie disputată. Pentru a evita numirea inculpaților
(care sunt părți private chiar și atunci când sunt condamnați),
acestea sunt descrise pe tip de caz, nu pe individ numit:

- **Controversa federală privind eroarea instrumentului forensic de
  la mijlocul anilor 2010** în care un instrument de imagistică
  forensică larg utilizat a fost descoperit, post-achiziție, că are
  o eroare de caz extrem care afectează un anumit tip de mediu de
  sursă. Un manifest de achiziție sigilat cu date înghețate de
  versiune-și-hash-binar al instrumentului ar fi permis apărării și
  acuzării să fie de acord exact cu privire la ce versiune a fost
  utilizată, eliminând o axă de dispută.

- **Multiple cazuri statale care implică ieșiri disputate ale
  extragerii dispozitivelor mobile**, în care furnizorul
  instrumentului de extracție a lansat ulterior un patch de
  remediere a erorilor și întrebarea a devenit "a afectat eroarea
  acest caz". Un fapt metodologic sigilat permite ca întrebarea să
  fie răspunsă împotriva datelor de versiune înghețate, în loc de
  împotriva memoriei actuale a agenției despre care versiune a fost
  utilizată.

- **Dispute de predare a camerelor corporale** în cazuri în care
  sistemul de docking al furnizorului BWC a fost ulterior alegat că
  permitea modificarea filmărilor în tranzit. Un manifest sigilat al
  arhivei body-cam la momentul recepției de către agenție ancorează
  ce octeți a primit agenția de la sistemul de docking; editările
  ulterioare pe partea agenției sunt public detectabile.

- **Controverse de coliziune hash în cazuri de forensică
  informatică**, în care un expert al apărării a argumentat că MD5
  (încă în utilizare în unele fluxuri de lucru moștenite) era
  inadecvat. O achiziție sigilată care înregistrează ATÂT MD5 CÂT și
  SHA-256 permite ca SHA-256 să rămână chiar dacă MD5 este
  contestat.

- **Dispute privind evoluția metodologiei de examinare între
  achiziție și proces.** Când un caz stă între achiziție și proces
  ani de zile, metodologia care era standard la achiziție poate fi
  înlocuită până la momentul procesului. Înregistrarea sigilată
  permite instanței să evalueze metodologia împotriva standardului
  care era actual la momentul achiziției, nu împotriva standardului
  ulterior.

Kitul NU ar fi rezolvat disputele de bază privind vinovăția sau
nevinovăția în niciunul dintre aceste tipuri de cazuri. Ar fi
rezolvat o anumită sub-dispută probatorie: dacă octeții,
instrumentele și procedurile erau ceea ce agenția afirmă că au fost
la momentul în care agenția afirmă.

---

## Când să utilizați acest kit

- Agenția dvs. are un SOP forensic stabil și dorește să adauge o
  atestare publică ancorată în Bitcoin ca strat care dezvăluie
  modificările deasupra lanțului-de-custodie hârtie-și-semnătură
  existent.
- Vă așteptați ca acest caz să implice provocări semnificative ale
  apărării asupra probelor forensice (caz cu miză mare, metodologie
  nouă, versiuni de instrumente contestate etc.).
- Puteți publica setul de fapte listat fără a expune PII sau date
  de re-identificare a persoanelor vulnerabile. (Regulile de refuz
  ale kitului impun acest lucru; dacă faptele dvs. ar necesita
  încălcarea unei reguli de refuz, nu utilizați kitul.)
- Consilierul general al agenției achizitoare și biroul procurorului
  au revizuit planul de publicare. Publicarea publică a unui artefact
  purtător de identificator de caz are implicații pentru investigații
  în curs; revizuirea de către consilier nu este opțională.
- Regulile de descoperire a apărării din jurisdicția dvs. sunt
  compatibile cu agenția care păstrează separat înregistrarea
  legăturii rol-la-individ (hash-uit în FACT 05). Dacă jurisdicția
  dvs. cere divulgarea publică a numelui examinatorului, trebuie să
  modificați kitul în consecință.

## Când să NU utilizați acest kit

- **Nu utilizați ca substitut pentru documentația existentă a
  lanțului-de-custodie a agenției.** Acest kit este *aditiv*, nu
  înlocuitor. CMS-ul agenției, jurnalul de custodie și obligațiile
  de producere a descoperirilor sunt neschimbate.
- **Nu utilizați dacă achiziția implică CSAM, șabloane biometrice
  sau alte date de re-identificare a persoanelor vulnerabile la
  nivel de fișier.** Hash-urile la nivel de imagine ale discurilor
  complete sunt acceptabile; hash-urile la nivel de fișier ale unui
  astfel de material NU sunt NICIODATĂ acceptabile, chiar și sub
  derogare a regulii de refuz. Dacă nu puteți construi un set de
  fapte fără a încălca R3, nu utilizați kitul.
- **Nu utilizați pentru a pretinde că mandatul a fost legal,
  confiscarea a fost corectă sau proba este admisibilă** — kitul nu
  poate face asta, iar regula de refuz R5 va respinge orice
  asemenea pretenție.
- **Nu utilizați sub presiunea de a sigila înainte ca achiziția să
  fie completă.** Un sigiliu de achiziție parțială denaturează
  starea.
- **Nu utilizați pentru a publica nume personale ale examinatorilor**
  decât dacă jurisdicția dvs. o cere în mod specific și examinatorii
  dvs. au consimțit individual. Implicit este publicarea la nivel
  de rol.
- **Nu utilizați în cazuri sigilate sau sub-sigiliu** fără permisiunea
  explicită a instanței. Publicarea unui identificator de caz pe
  Bitcoin este ireversibilă; dacă cazul este sigilat ulterior,
  sigiliul public nu poate fi retras. Kitul este doar pentru
  achiziții de înregistrare publică.
- **Nu utilizați ca teatru de legitimitate.** Un sigiliu al unei
  achiziții defectuoase este un registru public permanent al
  defectelor, nu o apărare împotriva lor. Primitiva taie în ambele
  sensuri; aceasta este onestitatea ei.

## Cum să bifurcați acest kit pentru o achiziție reală

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Timing critic:** sigilați LA sau imediat după încheierea imaginii
(FACT 05 eveniment E17 în cronologia exemplu). Un sigiliu în timpul
imaginii creează o înregistrare de achiziție parțială; un sigiliu
mult mai târziu creează o lacună în care agenția ar fi putut altera
imaginile. Fereastra corectă este imediat după ce verificarea
imaginii se completează pentru ultimul element din setul de probe.

**Revizuire critică:** înainte de a sigila, rulați publicația printr-un
al doilea examinator forensic (nu cel principal) și prin consilierul
agenției. Odată sigilată, publicația este permanentă.

## Integrarea cu infrastructura existentă a lanțului-de-custodie

- **Sistemul de Management al Cazurilor (CMS) al agenției.** CMS-ul
  rămâne sistemul primar de înregistrare al agenției. Sigiliul nu
  înlocuiește CMS-ul; se angajează la octeții și metodologia pe care
  CMS-ul le înregistrează, astfel încât editările post-hoc ale
  CMS-ului să fie public detectabile.
- **Federal Rules of Evidence / Daubert / coduri probatorii
  statale.** Sigiliul contribuie la înregistrarea de autentificare
  FRE 901 furnizând integritate care dezvăluie modificările. NU
  satisface FRE 702 / Daubert prin sine însuși; fiabilitatea
  metodologică este încă testată la audiența probatorie.
- **Descoperirea apărării (FRCP 16, Brady, Giglio și echivalentele
  statale).** Înregistrările însoțitoare hash-uite în FACT 05
  (legătura rol-la-individ, jurnalul de custodie, fotografii ale
  sigiliului anti-manipulare etc.) rămân supuse descoperirii
  normale. Sigiliul ancorează ceea ce au pretins acele înregistrări
  la momentul achiziției, astfel încât o ulterioară "înregistrarea
  era diferită la acel moment" este public refutabilă.
- **NIST Computer Forensics Tool Testing (CFTT).** Kitul face
  referire la jurnalele de verificare CFTT în FACT 04 / FACT 05;
  referința este un hash, nu jurnalul în sine, astfel încât
  procesele CFTT să nu fie afectate.
- **Neutralii numiți de instanță și experții apărării.** Oricare
  dintre ei poate re-hash imaginile forensice pe care le primesc în
  descoperire împotriva manifestului FACT 03, independent de orice
  cooperare a agenției. Aceasta este valoarea adăugată primară a
  kitului pentru partea apărării.
- **Revizuire în apel.** Ani mai târziu, un revizor forensic de
  apel poate verifica metodologia originală de achiziție împotriva
  înregistrării sigilate FACT 04, în loc de împotriva amintirii
  actuale posibil-evoluate a agenției.

## Ce NU înlocuiește acest kit

- Federal Rules of Evidence (sau orice cod probatoriu statal).
- Standardele de fiabilitate Daubert / Frye pentru mărturia de
  expert.
- SOP-ul forensic și CMS-ul agenției.
- Obligațiile de descoperire a apărării sub FRCP 16 / Brady /
  Giglio / echivalentele statale.
- Ordinele judecătorești, mișcările de suprimare, audierile
  probatorii sau orice alt proces administrat de instanță.
- NIST CFTT sau orice alt regim de testare a instrumentelor.
- Protocolul de filtru de privilegiu / echipă-de-tăcere al agenției.

## De ce există acest kit în v0.4.0+

Acesta este al 8-lea exemplu lucrat livrat cu myriam-kit. Urmează
structura constraint-first validată de autoresearch-ul documentat în
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — varianta prompt constraint-
first a obținut scorul cel mai mare într-o rubrică ponderată în mai
multe domenii de exemplu. Secțiunile de deschidere sunt părțile
portante ale kitului; conținutul manifestului este partea ușoară.

Designul kitului este în mod deliberat conservator privind publicarea
numelui examinatorului și agresiv privind disclaimerul "aceasta nu
stabilește admisibilitatea". Comunitatea forensică are un istoric
documentat de a fi atacată pentru munca sa forensică; kitul implicit
ia poziția mai sigură pentru examinatori. Agențiile din jurisdicții
în care este necesară denumirea personală publică pot modifica
bifurcația lor în consecință, dar refuzul implicit favorizează
siguranța examinatorului.

## Licență

Domeniu public (CC0). Bifurcați-l. Nu este necesară atribuirea.
