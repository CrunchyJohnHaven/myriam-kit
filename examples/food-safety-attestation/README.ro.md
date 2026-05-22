*Traducere română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit de atestare a siguranței alimentare

Un exemplu myriam-kit gata de utilizare pentru producătorii de
alimente, inspectorii de siguranță alimentară, certificatorii terți
și autoritățile de reglementare care doresc să publice un sigiliu
ancorat în Bitcoin și care dezvăluie orice modificare, indicând
*ce au spus testele de eliberare* și *ce decizie de eliberare a
fost luată*, în momentul eliberării lotului sau al semnării
raportului de inspecție — astfel încât modificarea silențioasă
post-eliberare a înregistrării testelor, a deciziei de eliberare
sau a angajamentelor de retragere să devină public detectabilă.

---

## Ce NU face acest kit (citiți primul)

Sigiliul este o ștampilă de timp criptografică a CARE teste de
eliberare au fost efectuate pe CARE lot, de către CARE laboratoare
acreditate, conform CĂROR metode, cu CARE rezultate, și ce DECIZIE
DE ELIBERARE a luat autoritatea de asigurare a calității pe baza
acestor rezultate. Nu poate răspunde la nicio întrebare despre
siguranța alimentară dincolo de asta. Următoarele sunt **în afara
domeniului sigiliului**:

1. **Prevenirea contaminării.** Kitul ancorează ceea ce au SPUS
   rezultatele testelor la eliberare. Contaminarea are multe cauze
   — distribuție microbiană heterogenă în interiorul unui lot, abuz
   de temperatură post-eliberare în distribuție, defecțiuni de
   manipulare la vânzarea cu amănuntul, defecțiuni de pregătire de
   către consumator, pericole noi sau neexaminate (de ex. adulterarea
   cu melamină înainte ca screeningul pentru melamină să devină
   rutină), fraudă a lanțului de aprovizionare în amonte de
   domeniul de testare al producătorului. Sigiliul nu previne
   niciuna dintre acestea și nu pretinde că o face.

2. **Garantarea că toate unitățile dintr-un lot care trece sunt
   sigure.** Contaminarea microbiologică în produsele alimentare în
   vrac este HETEROGENĂ. Patogenii Listeria, Salmonella și STEC
   apar în puncte fierbinți localizate cu prevalență scăzută, nu
   distribuiți uniform. Planurile de eșantionare ICMSF și Codex au
   o probabilitate documentată, limitată, de a detecta contaminarea
   prezentă la prevalență scăzută — probabilitatea NU este 1. Un
   lot care trece eșantionarea de eliberare poate conține încă
   unități contaminate care nu au fost eșantionate. Sigiliul
   ancorează EȘANTIOANELE, nu vracul. Această constrângere este
   reformulată explicit în FACT 03 și este cea mai importantă
   limită onestă unică a acestui kit.

3. **Certificarea că testele de eliberare au fost efectuate
   onest.** Sigiliul ancorează ceea ce au raportat testele la
   eliberare. Un laborator care raportează un PASS fraudulos la
   eliberare produce un sigiliu criptografic valid al unui PASS
   fraudulos. Kitul face modificarea silențioasă ulterioară
   detectabilă, dar nu detectează frauda contemporană. Detectarea
   fraudei contemporane necesită audit, supraveghere a acreditării
   laboratorului (supraveghere ISO 17025), programe de testare a
   competenței și inspecție de reglementare — toate în amonte de
   sigiliu.

4. **Înlocuirea depunerilor de reglementare FSMA, FSIS sau ale
   autorității competente UE.** Înregistrările de eliberare conform
   FSMA, FSIS, Regulamentului UE (CE) 178/2002 și Codex
   Alimentarius sunt menținute conform legii și produse la
   cererea autorității de reglementare. Sigiliul adaugă un strat
   public care dezvăluie modificările DEASUPRA acestor depuneri;
   NU le înlocuiește. O publicație sigilată nu este o depunere de
   reglementare.

5. **Soluționarea disputelor privind domeniul retragerii.** Kitul
   poate sigila angajamentele de retragere asumate la eliberare
   (FACT 06) și un domeniu de retragere ulterior ca nouă publicație;
   dar limita care definește care loturi sunt afectate, care unități
   au fost expediate, care comercianți cu amănuntul le-au primit și
   care consumatori au fost expuși este încă o investigație de
   trasare-înapoi-și-înainte. Sigiliul ancorează ceea ce S-A ANGAJAT
   producătorul să facă și ce a FĂCUT mai târziu. Nu rezolvă
   întrebarea epidemiologică de bază.

6. **Detectarea fraudei deliberate a lanțului de aprovizionare în
   amonte de testare.** Adulterarea cu melamină a laptelui și a
   formulei pentru sugari în China în 2008 a reușit pentru că
   melamina nu era în panelul de analiți — măsurarea echivalentului
   de proteine bazat pe azot era, iar melamina o înșela. Un FACT
   03 sigilat cu panelul de analiți în uz la acel moment s-ar fi
   angajat public la acel panel — dar nu ar fi făcut nimic pentru
   a detecta adulterantul în afara panelului. Valoarea sigiliului
   în acel caz ar fi fost ancorarea forensică a "acesta este ce a
   pretins producătorul că testează", NU prevenirea. Un regim
   real de siguranță alimentară abordează acest lucru prin
   eșantionare neanunțată a autorității de reglementare cu screening
   cu spectru larg (metode LC-MS netargetate, de exemplu), care
   este în amonte de sigiliul producătorului.

7. **Ancorarea distribuției post-eliberare și a manipulării de
   către consumator.** Odată ce lotul părăsește facilitatea, abuzul
   de temperatură în timpul distribuției, manipularea greșită la
   vânzarea cu amănuntul, defecțiunile de depozitare a
   consumatorului și erorile de pregătire de către consumator sunt
   toate în afara domeniului. Sigiliul este limitat la evenimentul
   de eliberare al producătorului. Dezvăluirea modificărilor în
   aval necesită kituri separate la nivel de distribuitor, comerciant
   cu amănuntul și (pentru consumatorii instituționali precum
   școli și spitale) la nivel de punct-de-utilizare.

8. **Garantarea siguranței alimentelor în orice populație specifică.**
   Rezultatele FACT 03 PASS nu implică siguranță pentru consumatorii
   însărcinați, sugarii, consumatorii imunocompromiși sau vârstnici,
   pentru care Listeria monocytogenes și Salmonella prezintă un
   risc ridicat documentat chiar și la concentrații sub limitele
   convenționale de detectare. Sigiliul nu poate face o pretenție
   de siguranță specifică populației și refuză să o facă (regula
   de refuz R6).

**Secțiunea de limite oneste de mai sus este partea portantă a
acestui kit.** Producătorii care tratează "am sigilat înregistrarea
de eliberare" ca fiind echivalent cu "am dovedit că alimentele
noastre sunt sigure" abuzează primitiva. Kitul trebuie să spună
clar: *aceasta este o primitivă de ne-repudiere pentru pretențiile
contemporane ale producătorului la eliberare, nu o dovadă de
siguranță, nu un substitut pentru supravegherea de reglementare și
nu o apărare împotriva modurilor de eșec heterogenă-contaminare,
fraudă-lanț-de-aprovizionare sau post-eliberare-manipulare-greșită
care au ucis oameni în epidemiile trecute.*

---

## Ce trebuie să REFUZE acest kit să sigileze

Kitul este configurat pentru a respinge următoarele tipare de fapte
chiar dacă un utilizator cu autoritate de semnătură de producător
validă le supune:

- **Identificarea personală a oricărui lucrător, supervizor,
  personal QA, inspector vizitator sau auditor terț.** Nume, ID-uri
  de angajat, numere de ecuson, numere de securitate socială,
  adrese de domiciliu, numere de telefon personale — niciuna
  dintre acestea nu apare în sigiliul public. Rolurile sunt
  publice; legăturile persoană-la-rol sunt sigilate separat și
  descoperibile sub procesul de reglementare. Siguranța lucrătorului
  împotriva represaliilor și hărțuirii este constrângerea portantă;
  atestarea siguranței alimentare poate fi făcută la nivel de rol.
  (R1)

- **Locație precisă a facilității.** Regiunea facilității (stat sau
  regiune multi-stat) este acceptabilă; adresa precisă a străzii,
  coordonatele GPS sau orice identificator de granularitate
  suficientă pentru a identifica fizic uzina pe o hartă NU este
  acceptabil. Numărul de stabiliment de reglementare este mânerul
  autorității de reglementare pentru facilitate; considerațiile de
  siguranță fizică și siguranță a lucrătorilor argumentează
  împotriva publicării unei adrese publice pe Bitcoin. (R2)

- **Tipare individuale ale personalului pe schimburi de producție.**
  Programele schimburilor, rotațiile individuale ale lucrătorilor,
  ID-urile personale ale operatorilor de linie — niciuna dintre
  acestea nu apare în sigiliu. Tiparul de viață al lucrătorilor
  individuali nu trebuie să fie derivabil din atestarea publică.
  (R3)

- **Identități ale furnizorilor care compromit contractele.** Numele
  furnizorilor, locațiile facilităților furnizorilor, codurile de
  loturi ale furnizorilor (cu excepția cazului de contaminare a
  lanțului-de-aprovizionare unde denumirea unui lot contaminat al
  unui furnizor este necesară pentru sănătatea publică și este
  gestionată printr-o publicație sigilată separată) NU sunt
  publicate în sigiliul de eliberare. Multe contracte de aprovizionare
  conțin prevederi de confidențialitate; sigiliul nu le încalcă în
  mod implicit. (R4)

- **Liste de clienți și destinații de distribuție dincolo de
  nivelul înalt.** Rezumatul regional la nivel înalt este
  acceptabil; listele specifice de clienți (comercianți cu
  amănuntul, centre de distribuție, conturi de servicii alimentare)
  NU sunt acceptabile. Identitatea clientului este contractual
  confidențială și sensibilă din punct de vedere competitiv;
  autoritatea de reglementare obține lista de clienți prin canalele
  stabilite de coordonare a retragerii. (R5)

- **Pretenții de siguranță sau concluzii legale.** Kitul nu va
  sigila "acest produs este sigur", "acest lot respectă toate
  standardele aplicabile de siguranță alimentară", "acesta este
  GRAS pentru această utilizare" sau orice altă concluzie de
  siguranță sau legală. Kitul ancorează înregistrarea testelor și
  decizia de eliberare, NU o concluzie de siguranță. (R6)

- **Tipare de re-identificare a plângerilor lucrătorilor sau ale
  avertizorilor.** Kitul refuză să publice orice tipar care ar
  putea re-identifica un lucrător care a depus o plângere OSHA,
  USDA sau internă a companiei despre practicile de siguranță
  alimentară sau siguranță a locului de muncă. Astfel de
  plângători sunt protejați conform FSMA Secțiunea 402 și
  statutelor paralele; sigiliul nu trebuie să devină un vector de
  re-identificare. Atestările avertizorilor au propriul lor kit
  (`examples/whistleblower-manifest`) cu reguli de refuz reglate
  pentru acel caz de utilizare. (R7)

- **Sigilare de către oricine altcineva în afara mandatarului
  autorizat al producătorului eliberator.** Un certificator terț,
  o echipă QA a clientului sau un auditor independent poate folosi
  același kit pentru a sigila propriile rezultate ale auditului;
  ei NU pot sigila decizia originală de eliberare sub numele
  producătorului. Mandatarul semnatar din FACT 08 este singurul
  semnatar valid pentru asta. (R8)

Un refuz însuși poate fi sigilat ca un fapt ("Acest producător a
solicitat sigilarea lui X; kitul a refuzat conform regulii de refuz
Y"), creând un registru public al încercării de abuz.

---

## Ce SIGILEAZĂ acest kit

8 fapte în momentul eliberării:

1. **Notă de exemplu** — declară publicația ca exemplu (atestările
   reale o îndepărtează sau o înlocuiesc).
2. **Identificare produs și lot** — numele produsului, categoria,
   producătorul, regiunea facilității (NU locația precisă), versiunea
   planului HACCP + hash, ID-ul lotului, datele de producție /
   ambalare / utilizare-până-la, numărul de unități pentru
   consumatori, cerințele de depozitare, cele trei puncte critice
   de control cu hash-uri ale înregistrărilor jurnalizate (letalitate
   de gătire, stabilizare prin răcire, mediu RTE post-letalitate).
3. **Rezultate ale testelor de eliberare** — teste microbiologice
   ale produsului finit (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), teste chimice / de reziduuri (nitrit,
   reziduuri veterinare, metale grele), verificare a contactului
   cruciș cu alergeni, rezumat al monitorizării de mediu, fiecare
   cu SHA-256-ul PDF-ului complet al raportului și constrângerea
   explicită de interpretare eșantion-vs-vrac.
4. **Metodologie și calificare a laboratorului** — care metodă (și
   care versiune a documentului-metodă) a fost utilizată pe rând,
   care laboratoare au efectuat care teste, starea de acreditare
   ISO/IEC 17025:2017 a fiecărui laborator și hash-ul
   certificatului, rezultatele recente ale testului de competență,
   declarația de independență, înregistrarea deviației / re-testare
   / OOS pentru acest lot.
5. **Decizia de eliberare** — data eliberării, autoritatea de
   eliberare la nivel de rol + contra-semnătura, rezumat al
   înregistrării de susținere a deciziei, destinații de distribuție
   la nivel înalt, obligații post-eliberare confirmate la eliberare,
   angajamentul de timp-și-ireversibilitate.
6. **Angajamente de retragere și supraveghere post-piață** — analogul
   pentru siguranța alimentară al farmacovigilenței: transparența
   semnalului de boală, angajamentele de execuție a retragerii
   (praguri 24h / 72h / 98%), răspunsul la contaminarea lanțului-
   de-aprovizionare, angajamentul de fără-re-testare-silențioasă,
   angajamentul de fără-modificări-de-specificație-post-hoc,
   partajarea agregată a semnalului de siguranță.
7. **Divulgări însoțitoare și înregistrare de refuz** — hash-ul
   jurnalului de investigare a acțiunii corective, istoricul recent
   al inspecției, istoricul retragerilor, probleme deschise
   cunoscute în metodele de testare utilizate, legătura rol-la-
   individ (sigilată separat, hash-uită aici), pregătirea pentru
   trasarea-înapoi a furnizorului, listă explicită a regulilor de
   refuz R1-R8 cu orice refuzuri exercitate în timpul acestei
   eliberări.
8. **Mandatar semnatar** — producător + semnatar la nivel de rol
   (Director QA) + contra-semnatar la nivel de rol (Manager Uzină)
   + informații despre cheia criptografică; raționamentul pentru
   publicare la nivel de rol.

Fiecare fapt se termină cu convenția de poartă-de-refuz: *"Acest
fapt afirmă doar X. Nu afirmă Y"* (unde Y este cel mai apropiat
mod de eșec din secțiunea "NU face" de mai sus).

---

## Ce apără acest kit

- **Modificarea retroactivă silențioasă a rezultatelor testelor de
  eliberare.** Toate PDF-urile de rapoarte de testare sunt hash-uite.
  Re-hash-uirea post-eliberare dezvăluie orice modificare.
- **Dispute privind care metode, care versiuni ale documentului-
  metodă și care laboratoare au fost utilizate.** FACT 04 îngheață
  metodologia și starea de acreditare a laboratorului la eliberare.
  Pretențiile ulterioare "de fapt am folosit MLG 4.13, nu 4.12"
  sunt public refutabile.
- **Re-specificarea retroactivă pentru un lot în afara specificației.**
  Dacă un rezultat al testului-de-eliberare a fost de fapt un PASS
  la limită care este reclasificat ca FAIL post-eliberare, hash-urile
  raportului sigilat dovedesc ce a spus PDF-ul rezultatului
  original. Simetric, un OOS la limită care este re-testat silențios
  într-un PASS fără divulgare este detectabil dacă angajamentul de
  fără-re-testare-silențioasă din FACT 06 este comparat ulterior
  împotriva unei modificări nesigilate.
- **Minimizarea silențioasă a domeniului retragerii.** Angajamentele
  de retragere din FACT 06 (notificare 24h, inițiere 72h,
  recuperabilitate 98%) sunt sigilate; nerespectarea lor este
  public observabilă.
- **Re-narrarea post-hoc a istoricului acțiunii corective.** Hash-ul
  jurnalului de acțiune corectivă din FACT 07 îngheață ce a SPUS
  compania că a făcut după EMP presumptiv; pretențiile ulterioare
  "am făcut mai mult / mai puțin decât atât" sunt public refutabile.
- **Omiterea selectivă a divulgărilor însoțitoare.** FACT 07
  enumeră categoriile de divulgare așteptate (istoricul inspecției,
  istoricul retragerilor, revizuirea consilierii-metodei,
  pregătirea de trasare-înapoi); o categorie goală trebuie atestată
  explicit ("niciuna la momentul eliberării"), astfel încât un
  ulterior "nu ne-am dat seama că asta era relevant" să fie public
  refutabil.
- **Substituirea stării de acreditare a unui laborator diferit.**
  FACT 04 îngheață domeniul ISO 17025 al fiecărui laborator și
  hash-ul certificatului la eliberare; o substituire ulterioară a
  unui laborator neacreditat este public detectabilă.

Kitul **nu** apără împotriva corupției contemporane — o echipă care
sigilează intenționat rezultate de testare false la eliberare
produce un sigiliu criptografic valid al rezultatelor de testare
false. Primitiva este onestă despre asta: este o primitivă de
ne-repudiere pentru pretențiile contemporane ale producătorului, nu
o dovadă că acele pretenții sunt corecte.

---

## Precedent istoric de mortalitate

Kitul ar fi produs o ancoră utilă — *nu o rezoluție* — în eșecurile
trecute de siguranță alimentară. Pentru a evita defăimarea
indivizilor (majoritatea eșecurilor de siguranță alimentară sunt
corporative, nu individuale; unele sunt judecate penal și unele nu),
aceste referințe descriu epidemia după an și patogen și denumesc
entitatea implicată numai atunci când contaminarea a fost atribuită
public prin notificarea retragerii sau înregistrarea instanței.

- **Adulterarea cu melamină a formulei pentru sugari și a lactatelor
  în China în 2008 (Sanlu Group + alții).** Cel puțin șase decese
  de sugari și ~300.000 de boli atribuibile produselor lactate
  îmbogățite cu melamină proiectate pentru a umfla fraudulent
  conținutul aparent de proteine în analizele bazate pe azot
  Kjeldahl. Au urmat condamnări în instanțele RPC, inclusiv
  condamnări capitale. *Sigiliul nu ar fi prevenit acest lucru*
  — melamina era în afara panelului standard de analiți. Sigiliul
  s-ar fi angajat public la ce ERA panelul, făcând domeniul
  extinderii post-incident a screeningului de rutină forensic
  clar.

- **Epidemia europeană STEC O104:H4 din 2011 (germeni de schinduf
  trasate la o fermă germană).** 53 de decese, ~3.950 de boli în
  mai multe țări europene; trasată în cele din urmă la semințe de
  schinduf importate din Egipt și germinate la un producător
  german. Trasarea-înapoi a fost îngreunată de documentația
  inconsistentă la nivel de lot în lanțul-de-aprovizionare multi-
  țară. *Sigiliul nu ar fi prevenit contaminarea lotului de
  semințe* (contaminarea era în amonte de testele germinatorului);
  ar fi ancorat ceea ce au pretins testele de eliberare ale
  germinatorului și, dacă ar fi fost folosit la nivelul
  importatorului de semințe, ceea ce a pretins manipularea
  semințelor importate, făcând trasarea-înapoi mai rapidă.

- **Epidemia Blue Bell Creameries cu Listeria monocytogenes din 2015
  (Statele Unite).** 3 decese, 10 boli în mai multe state; a dus
  la o retragere națională și la o condamnare penală federală în
  2020 a Blue Bell pentru acuzații de delict de siguranță
  alimentară, compania încheind un acord de urmărire amânată și
  plătind 19,35 milioane de dolari. Litigii civile ulterioare.
  *Sigiliul nu ar fi prevenit* contaminarea de mediu cu Listeria
  în uzină; ar fi ancorat forensic înregistrările programului de
  monitorizare de mediu, făcând orice întrebare post-incident "ce
  a arătat EMP-ul în lunile dinaintea epidemiei" răspunsibilă
  împotriva unei înregistrări de ștampilă de timp care dezvăluie
  modificările, în loc de împotriva documentelor produse ulterior.

- **Epidemiile STEC O157:H7 din 2018 din multiple state legate de
  salata romaine (regiunea de cultivare Yuma, apoi regiunea de
  cultivare Salinas).** Cel puțin 5 decese și ~210 boli în multiple
  epidemii din acel an. Trasarea-înapoi a fost complicată de
  produsul ambalat cu sursă mixtă. *Sigiliul nu ar fi prevenit*
  contaminarea la nivel de câmp / apă de irigație (în amonte de
  producător); ar fi ancorat forensic înregistrarea testării de
  intrare și a testării de eliberare a fiecărui procesator,
  făcând trasarea-înapoi mai rapidă și înregistrarea publică mai
  apărabilă criptografic împotriva disputelor ulterioare.

- **Epidemia Peanut Corporation of America cu Salmonella Typhimurium
  (2008-2009, Statele Unite).** 9 decese, ~714 boli; a dus la
  condamnări penale federale în 2014-2015 ale directorilor PCA,
  inclusiv o pedeapsă de 28 de ani de închisoare pentru CEO sub
  acuzațiile de conspirație și obstrucționare. *Sigiliul nu ar fi
  prevenit* contaminarea, sub-investigarea testelor pozitive de
  Salmonella din uzină sau decizia la nivel executiv de a expedia
  produsul împotriva acelor descoperiri pozitive. AR FI făcut
  forensic clar, la proces, ce SPUNEAU rezultatele testelor în
  momentul în care au fost generate — făcând cazul acuzării
  împotriva e-mail-urilor false-narrative contemporane substanțial
  mai ancorat împotriva modificării documentare.

În fiecare dintre aceste cazuri, kitul ar fi furnizat o cronologie
forensică mai curată. În niciunul dintre aceste cazuri, kitul singur
nu ar fi prevenit morții. Sigiliul este infrastructură forensică,
nu infrastructură de prevenire. Această distincție este onestitatea
kitului.

---

## Când să utilizați acest kit

- Operațiunea dvs. de producție are un program HACCP / Controale
  Preventive stabil și dorește să adauge o atestare publică
  ancorată în Bitcoin ca strat care dezvăluie modificările
  deasupra fluxului de lucru existent al documentației de
  eliberare.
- Sunteți un producător mic-spre-mediu sau un producător într-o
  jurisdicție cu infrastructură de reglementare mai slabă, dorind
  să ancorați înregistrările de loturi împotriva unei cronologii
  global verificabile — pentru încrederea pieței de export, pentru
  răspunsul la auditul clientului sau pentru participarea la
  inițiative voluntare de transparență.
- Sunteți un inspector de siguranță alimentară sau un certificator
  terț și doriți să publicați un sigiliu de constatări de audit
  care dezvăluie modificările la semnare, astfel încât constatările
  auditului să nu poată fi modificate silențios mai târziu prin
  acord între producător și certificator.
- Vă așteptați ca acest lot să se confrunte cu un examen
  semnificativ în aval (piață de export, categorie cu risc ridicat
  precum carne RTE sau formulă pentru sugari, ingredient nou,
  istoric recent de retrageri).
- Puteți publica setul de fapte listat fără a încălca regulile de
  refuz R1-R8. Dacă faptele dvs. ar necesita o încălcare R1-R8,
  nu utilizați kitul; reparați mai întâi intrările de date.
- Consilierul producătorului a revizuit planul de publicare.
  Publicarea publică a unui artefact care poartă identificator de
  lot are implicații pentru expunerea la răspunderea produsului;
  revizuirea consilierului nu este opțională.

## Când să NU utilizați acest kit

- **Nu utilizați ca substitut pentru înregistrările de reglementare
  FSMA / FSIS / UE.** Sigiliul este *aditiv*, nu înlocuitor.
  Înregistrările dvs. statutare de eliberare, planul dvs. HACCP,
  jurnalele dvs. CCP și planul dvs. de retragere sunt
  neschimbate.
- **Nu utilizați ca pretenție de siguranță.** Sigilarea unei
  înregistrări de eliberare care trece nu stabilește că produsul
  este sigur; stabilește că înregistrarea avea acest conținut de
  octeți la acest moment. Regula de refuz R6 va respinge orice
  concluzie de siguranță.
- **Nu utilizați pentru a publica identități ale furnizorilor, liste
  de clienți, nume de lucrători sau adrese ale facilităților.**
  Regulile de refuz R1-R5 există pentru motive de siguranță umană
  și contract; nu modificați kitul pentru a le învinge fără a
  consulta consilierul.
- **Nu utilizați sub presiunea de a sigila înainte ca testarea de
  eliberare să fie completă.** Un sigiliu de date parțiale
  denaturează starea deciziei de eliberare.
- **Nu utilizați ca teatru de legitimitate.** Un sigiliu al unui
  plan de eșantionare prost conceput sau al unui panel de analiți
  prost ales este o înregistrare publică permanentă a inadecvării,
  nu o apărare împotriva ei. Primitiva taie în ambele sensuri;
  aceasta este onestitatea ei.
- **Nu utilizați în timpul unei situații de retragere active ca
  substitut pentru coordonarea retragerii de către autoritatea de
  reglementare.** O nouă publicație MYRIAM care ancorează domeniul
  retragerii este adecvată DUPĂ ce retragerea coordonată de
  autoritatea de reglementare este inițiată; nu este o înlocuire
  pentru canalul de retragere al autorității de reglementare.

## Cum să bifurcați acest kit pentru o eliberare reală

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**TIMING CRITIC:** sigilați în momentul eliberării QA, ÎNAINTE ca
lotul să fie distribuit (înainte ca primul camion să plece din
facilitate). Un sigiliu după începerea distribuției are încă valoare,
dar nu ancorează curat starea pre-distribuție. Fereastra corectă
este între semnătura de eliberare QA și prima mișcare de distribuție.

**REVIZUIRE CRITICĂ:** înainte de sigilare, rulați publicația printr-un
al doilea revizor QA (nu cel principal) și prin consilierul
companiei. Odată sigilată, publicația este permanentă.

## Integrarea cu infrastructura existentă de siguranță alimentară

- **FDA FSMA Controale Preventive pentru Alimente pentru Om (21 CFR
  117).** URL-ul publicației sigilate sau CID-ul IPFS poate fi
  referit în documentația Planului de Siguranță Alimentară ca
  artefactul de atestare publică pentru acest lot.
- **USDA FSIS planuri HACCP și înregistrări de eliberare.**
  Înregistrarea de eliberare sigilată stă alături de înregistrările
  HACCP cerute de FSIS; sigiliul face referire la hash-ul versiunii
  planului HACCP (FACT 02), astfel încât disputele ulterioare
  despre care versiune a planului era în vigoare să fie public
  refutabile.
- **Codex Alimentarius / Principii HACCP** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Sigiliul se angajează la rezultatele HACCP cu
  șapte principii (analiza pericolelor, CCP-uri, limite critice,
  monitorizare, acțiuni corective, verificare, păstrarea
  înregistrărilor) pentru acest lot.
- **ISO 22000:2018 (Sisteme de Management al Siguranței
  Alimentare).** Sigiliul poate fi referit ca parte a urmei de
  dovezi a revizuirii managementului; nu înlocuiește certificarea
  ISO 22000.
- **FSSC 22000 v6 schema de certificare.** Compatibil ca strat
  aditiv de transparență; auditorul FSSC poate verifica sigiliul
  în timpul supravegherii.
- **Regulamentul UE (CE) 178/2002 (Legea Generală a Alimentelor)
  Articolul 18 (trasabilitate) și Articolul 19 (notificare de
  retragere).** Sigiliul angajează pregătirea de trasare-înapoi
  cu o singură-treaptă-înapoi a producătorului (FACT 07) și
  angajamentele de retragere (FACT 06); nu înlocuiește obligația
  statutară de notificare a Articolului 19.
- **Pachetul de Igienă UE (Regulamentele 852/2004, 853/2004,
  854/2004, 882/2004).** Compatibil; sigiliul face referire la
  echivalentul HACCP-ului și înregistrărilor de verificări-proprii
  ale Pachetului de Igienă.
- **BRCGS / SQF scheme cu standard privat.** Compatibil ca strat
  aditiv de transparență.
- **Sisteme de supraveghere a sănătății publice (CDC PulseNet,
  FoodNet, IFSAC; UE EFSA / ECDC).** În afara domeniului
  pentru sigiliu direct, dar FACT 06 angajează producătorul să
  participe și să sigileze orice evenimente de corelare a
  semnalelor ca noi publicații MYRIAM.

## Ce NU înlocuiește acest kit

- Înregistrarea Facilității de Alimente FDA sau aprobarea
  Stabilimentului USDA FSIS.
- Planul dvs. scris de Siguranță Alimentară / Planul HACCP sub
  FSMA / FSIS.
- Jurnalele de monitorizare CCP și înregistrările de acțiune
  corectivă.
- Supravegherea acreditării laboratorului ISO 17025.
- Programe de testare a competenței.
- Inspecția de reglementare (inspecție continuă FSIS, inspecție
  periodică FDA, inspecție a autorității competente UE).
- Supravegherea sănătății publice (CDC, EFSA, ECDC, echivalente
  naționale).
- Canale de coordonare a retragerii (FDA Reportable Food Registry,
  coordonare a retragerii FSIS, UE RASFF, echivalente naționale).
- Programe de siguranță a lucrătorilor și de instruire a
  lucrătorilor din alimente.

## De ce există acest kit în v0.4.0+

Acesta este unul dintre exemplele lucrate livrate cu myriam-kit.
Urmează structura README constraint-first validată de autoresearch-ul
documentat în `~/Genesis/calc/PROMPT_LIBRARY_v0.md` — varianta
prompt constraint-first a obținut scorul cel mai mare într-o
rubrică ponderată în mai multe domenii de exemplu, deoarece
atestarea siguranței alimentare este exact domeniul în care
supraestimarea a ceea ce dovedește sigiliul este periculoasă:
oameni au murit, vor muri, în eșecuri pe care sigiliul nu le poate
preveni. Secțiunile de deschidere sunt părțile portante ale
kitului; conținutul manifestului este partea ușoară.

Implicitele kitului sunt în mod deliberat conservatoare privind
publicarea numelui lucrătorului, conservatoare privind precizia
locației facilității, conservatoare privind identitatea furnizorului
și clientului și agresive privind disclaimerul "aceasta nu
stabilește siguranța". Comunitatea de siguranță alimentară are un
istoric documentat de limbaj de certificare supraestimat; kitul
implicit ia poziția cel mai puțin probabil să fie citită ca o
garanție de siguranță. Producătorii din jurisdicții în care
cerințele specifice de divulgare publică diferă pot modifica
bifurcația lor în consecință, dar refuzurile implicite favorizează
siguranța lucrătorului și domeniul onest.

## Licență

Domeniu public (CC0). Bifurcați-l. Nu este necesară atribuirea.
