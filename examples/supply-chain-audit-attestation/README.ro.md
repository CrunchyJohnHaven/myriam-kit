*Traducere în limba română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit de sigilare pentru atestarea auditurilor lanțului de aprovizionare

Un exemplu turnkey de myriam-kit pentru auditori terți (social/muncă/mediu),
echipe interne de conformitate-furnizori, investigatori din ONG-uri pe lanțul
de aprovizionare și organizații de drepturi ale lucrătorilor care doresc să
publice un sigiliu ancorat în Bitcoin și care evidențiază manipularea pentru
un raport de audit, în momentul exact al semnării finale.

---

## Ce NU face acest kit (citiți mai întâi)

Sigiliul este o marcă de timp criptografică a ceea ce auditorul a semnat
final. Nu poate verifica dacă ceea ce a fost semnat este **adevărat**.
Următoarele moduri de eșec sunt **în afara domeniului sigiliului**:

1. **Capturarea auditului de către industrie.** Auditurile comandate de
   brand au o istorie lungă și documentată de a produce constatări blânde
   asupra furnizorilor a căror continuare a relației comerciale cu brandul
   comanditar menține fluxul conductei de audit. Un audit capturat, când
   este sigilat, produce o înregistrare criminalistică permanentă a
   auditului capturat. Sigiliul nu corectează capturarea — doar face
   auditul-așa-cum-a-fost-emis imutabil, astfel încât un proces ulterior
   de descoperire a adevărului să aibă ceva concret cu care să compare.

2. **Lucrători instruiți / facilități pregătite.** Auditurile anunțate
   sau semi-anunțate dau managementului zile sau săptămâni pentru a
   repeta răspunsurile lucrătorilor, a ascunde lucrătorii minori, a curăța
   dormitoarele, a îndepărta echipamentele neconforme și a devia munca
   către subcontractanți neauditați în timpul ferestrei de audit. Sigiliul
   ancorează ceea ce le-a fost arătat auditorilor, nu ceea ce au fost
   împiedicați să vadă.

3. **Subcontractare ascunsă.** Subcontractarea de nivel Tier-2 și Tier-3,
   munca la domiciliu și producția din sectorul informal sunt în mod
   penetrant invizibile pentru auditurile la nivelul podelei fabricii.
   Sigiliul ancorează un audit Tier-1; nu poate detecta că Tier-1
   externalizează către un Tier-2 neauditat în timpul ferestrei de audit
   sau în mod rutinier.

4. **Audituri care ratează sistematic abuzul pe care îl vizează.** Rana
   Plaza, prăbușirea fabricii de îmbrăcăminte din Bangladesh din 2013
   care a ucis 1.134 de lucrători, fusese auditată de mai multe programe
   de audit comandate de brand în lunile anterioare. Fisurile clădirii
   nu erau pe lista de verificare a auditului social; regimul de audit
   nu avea sferă de aplicare în inginerie structurală. Auditurile
   ancorează ceea ce este *în sferă*; abuzurile în afara sferei rămân
   invizibile indiferent cât de evidentă pentru manipulare este sigilarea.

5. **Represalii după semnarea finală împotriva lucrătorilor care au
   participat la interviuri.** Chiar și cu informațiile de localizare
   refuzate (FACT 07 R3), un adversar hotărât care cunoaște ID-ul
   furnizorului poate identifica facilitatea. Protecția lucrătorilor
   necesită mai mult decât simpla refuzare a PII în sigiliu — necesită
   anonimizare în amonte de metodologia de audit. Sigiliul face
   auditul-așa-cum-a-fost-emis durabil; nu protejează retroactiv
   persoanele intervievate.

6. **Condiții de lucru legale dar inumane.** Decalajele de salariu de
   trai în jurisdicțiile unde salariul minim legal este sub reperul
   salariului de trai produc constatări de audit "conforme" cu legile
   privind salariile și orele și constatări "neconforme" cu standardele
   salariului de trai în același audit (FACT 03 elementul 8 în acest
   kit-exemplu). Sigiliul ancorează ceea ce raportează fiecare standard;
   reconcilierea lor este lucru politic în aval.

7. **Daune climatice / de mediu cu cauzalitate difuză.** Emisiile de
   carbon, contribuțiile la defrișare, epuizarea apei și eliberările de
   poluanți de la furnizori pot fi sigilate în constatările de audit,
   dar atribuirea cauzală la volumul comenzilor unui anumit brand este
   metodologic contestată. Sigiliul ancorează ceea ce a fost măsurat la
   furnizor; nu atribuie responsabilitate morală sau juridică.

8. **Dispute despre care standard este autoritar.** SA8000 vs. BSCI vs.
   SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. cod de conduită
   specific companiei: fiecare are sfere, severități și procese de
   remediere diferite. Sigiliul ancorează *un* audit sub *un* standard.
   Comparația între standarde este o problemă în aval.

9. **Competența auditorului vs. acreditarea auditorului.** "Acreditat"
   nu înseamnă "competent." Auditorii care au absolvit programe de
   formare acreditate au ratat abuzuri severe în audituri care au
   precedat dezastre vizibile public. Sigiliul ancorează acreditările;
   nu certifică competența cu care au fost exercitate.

**Secțiunea cu limite oneste de mai sus este partea de rezistență a
acestui kit.** Un brand care vrea teatru de legitimitate va folosi un
audit sigilat ca scut. Kit-ul trebuie să spună clar: aceasta este o
*primitivă de non-repudiere pentru momentul semnării raportului de
audit*, nu o dovadă a conformității furnizorului sau a bunăstării
lucrătorilor.

---

## Ce TREBUIE acest kit SĂ REFUZE să sigileze

Kit-ul este configurat să respingă următoarele tipare de fapte chiar dacă
sunt trimise de un utilizator cu autoritate de corp de audit validă:

- **Identificarea individuală a lucrătorului.** Niciun fapt nu poate
  numi un lucrător, lega un citat de un lucrător, expune numărul de
  ecuson, poziția pe linie, camera de dormitor, programul de tură,
  combinația demografică cu N<5 sau orice câmp care ar putea
  re-identifica o persoană care a participat la interviuri. Citatele
  lucrătorilor folosesc token-uri randomizate; maparea nu este niciodată
  sigilată.
- **Surse de avertizori / informatori.** Dacă o constatare se bazează
  pe dezvăluirea făcută de o persoană care și-a asumat risc pentru a
  dezvălui, persoana nu este niciodată numită sau identificată în
  publicația sigilată.
- **Informații precise de localizare.** Nicio adresă stradală, GPS,
  imagine satelitară cu rezoluție >1km sau fotografie exterioară a
  clădirii. Țara și regiunea sunt rezoluția maximă sigilată. Raționament:
  identificarea facilității permite represalii împotriva participanților
  la interviu.
- **Cereri de certificare de audit curat.** Kit-ul refuză să sigileze
  orice formulare de forma "acest audit dovedește că furnizorul este
  conform" sau "nu există încălcări." Pretențiile de curățenie sunt
  epistemic nesusținute de metodologia de audit.
- **Substituirea sigiliului ca certificat.** O publicație care omite
  metodologia (FACT 04), independența (FACT 06) sau refuzurile (FACT 07)
  nu este o publicație MYRIAM legitimă sub acest kit.
- **Audituri în formă de schiță / pre-semnare finală.** Sigilarea se
  face la semnarea finală, nu înainte. Auditurile provizorii creează
  certitudine falsă.
- **Re-sigilare favorabilă post-hoc.** Un audit revizuit necesită o
  NOUĂ publicație sigilată care să facă referire la originalul prin
  rădăcina Merkle. Auditul original sigilat rămâne vizibil permanent
  ca audit-așa-cum-a-fost-emis.
- **Sigilarea de către orice altă parte decât corpul de audit.** Un
  brand, furnizor, organism de certificare sau terț nu poate sigila
  "auditul" în locul corpului de audit care a semnat raportul.

Un refuz în sine poate fi sigilat ca fapt ("Această parte a solicitat
sigilarea X; kit-ul a refuzat conform regulii de refuz Y"), creând o
înregistrare publică a tentativei de utilizare abuzivă. **Într-o
industrie cu capturare răspândită a auditului, refuzul-de-a-sigila poate
fi el însuși un semnal semnificativ:** un corp de audit care nu va
sigila pentru că un brand a presat înmuierea constatărilor are opțiunea
de a înregistra public refuzul sub propriul său principal.

---

## Ce SIGILEAZĂ acest kit

8 fapte în momentul semnării finale a auditului:

1. **Notă de exemplu** — declară publicația ca exemplu (atestările
   reale elimină sau înlocuiesc aceasta).
2. **Sferă și subiect de audit** — standardul de audit, corpul de
   audit, auditorul lider, dimensiunea echipei de audit, identificatorul
   furnizorului (fără informații precise de localizare), fereastra de
   audit, tipul de anunț (anunțat / semi-anunțat / neanunțat), data
   raportului de audit, versiunea semnării finale, brandurile
   destinatare denumite, partea comanditară.
3. **Manifest de constatări ale auditului** — conformitate / NC-minor /
   NC-major / NC-critic per element față de standard, fiecare cu un
   SHA-256 al redactării complete a constatării. Totaluri agregate.
   Recomandarea de certificare la semnarea finală.
4. **Metodologie și dovezi** — alocarea timpului la fața locului,
   numărul interviurilor (cu stratificare: gen, statut de migrant,
   vechime), defalcarea formatului interviurilor, relația cu
   interpretul, revizuirea documentelor cu dimensiuni de eșantion și
   hash-uri de conținut, artefacte de vizită la site (cu fețele
   lucrătorilor estompate), limitări cunoscute ale metodologiei.
5. **Acțiuni corective angajate** — per NC-major și NC-minor CAP cu
   cauza rădăcină declarată, termen-limită, mecanism de verificare,
   angajamente de escaladare, angajament de ne-relaxare tăcută.
6. **Calificările și independența auditorului** — acreditarea
   corpului de audit, concentrarea clienților, acreditările
   auditorului lider și competența lingvistică, experiența
   sectorială, declarațiile de independență (auditor-furnizor,
   auditor-brand, separarea corpului de certificare).
7. **Dezvăluiri însoțitoare și înregistrarea refuzurilor** — conflicte
   de interese (explicite), istoricul auditurilor anterioare, canale
   de voce ale lucrătorilor comunicate, investigații paralele,
   disenț intern al corpului de audit, lista regulilor de refuz,
   refuzurile efectiv invocate în acest audit.
8. **Principal semnatar** — corpul de audit, auditorul lider, echipa
   de audit, ofițerul autorizant, informații despre cheia
   criptografică.

Fiecare fapt se termină cu convenția poartă-de-refuz: *"Acest fapt
afirmă doar X. Nu afirmă Y"* (unde Y este cel mai apropiat mod de eșec
din secțiunea "NU face").

---

## Împotriva a ce apără acest kit

- **Înmuierea tăcută post-semnare a neconformităților majore.** Orice
  modificare a FACT 03 (de ex. un MAJOR_NC reclasificat la MINOR_NC,
  sau o constatare ștearsă în întregime) produce un SHA-256 diferit,
  o rădăcină Merkle diferită, eșuează verificarea OTS.
- **Antedatarea închiderii acțiunilor corective.** FACT 05 îngheață
  CAP-ul și termenele sale la semnarea finală; orice pretenție de
  "am închis acel NC luna trecută" care intră în conflict cu termenele
  sigilate este public diff-abilă.
- **Revizionism metodologic.** FACT 04 îngheață numărul de interviuri,
  dimensiunile eșantioanelor de documente și orele la fața locului la
  semnarea finală — împiedicând apărarea ulterioară "am făcut o
  investigație profundă" să fie nefalsificabilă.
- **Republicare selectivă care omite constatări nefavorabile.** Toate
  cele 8 fapte sunt legate de o singură rădăcină Merkle; citarea
  unor fapte în timp ce se omit altele este detectabilă din lista de
  frunze publicată.
- **Deriva pretenției de independență.** FACT 06 îngheață declarațiile
  de independență la data semnării finale. O pretenție ulterioară
  "acest audit a fost riguros independent" trebuie să se confrunte cu
  procentul sigilat al concentrării clienților și cu dezvăluirea
  sigilată a comandării plătite de brand.
- **Ștergerea înregistrării refuzurilor.** FACT 07 îngheață ce
  tipare de fapte a refuzat kit-ul; orice pretenție ulterioară "nu am
  refuzat niciodată nimic" contrazice înregistrarea sigilată.

---

## Cazuri istorice sau aproape-istorice în care kit-ul ar fi ajutat

Kit-ul ar fi produs o **ancoră criminalistică** utilă — *nu o reparație
sau o prevenire* — în cazuri care implică:

- **Rana Plaza (Bangladesh, 2013).** Prăbușirea clădirii Rana Plaza a
  ucis 1.134 de lucrători din industria îmbrăcămintei și a rănit
  ~2.500. Mai multe branduri ale căror produse erau fabricate în
  clădire auditaseră furnizorii Tier-1 din interiorul clădirii cu
  puțin timp înainte de prăbușire. Auditurile au folosit liste de
  verificare de audit social care nu includeau sfera de aplicare a
  ingineriei structurale. Un fapt sigilat de metodologie (FACT 04) la
  fiecare dintre acele audituri ar fi făcut *decalajul de sferă*
  vizibil public la semnarea finală — ancorând limitarea documentată
  pe care programele de audit au pretins retroactiv că nu o au.
  Sigiliul nu ar fi prevenit prăbușirea. Ar fi împiedicat ca pretenția
  industriei post-prăbușire că "nimeni nu știa" să fie epistemic
  susținută.

- **Auditurile Apple / Foxconn (anii 2010).** Mai multe iterații ale
  rapoartelor de audit ale facilităților Foxconn care produceau pentru
  Apple au fost publicate cu niveluri variabile de severitate a
  constatărilor, contextul cluster-ului de sinucideri ale lucrătorilor
  și pretenții de remediere. O înregistrare sigilată în momentul
  semnării finale pentru fiecare audit ar fi împiedicat ca disputele
  ulterioare despre "ce a spus auditul la momentul respectiv" să
  depindă de copii de arhivă, copii scurse sau lansări oficiale
  revizuite.

- **Cobalt din RDC (în curs).** Mineritul artizanal de cobalt în
  Republica Democratică Congo, inclusiv de către copii, alimentează
  lanțurile de aprovizionare cu baterii pentru branduri majore de
  electronice și EV. Mai multe audituri comandate de brand în perioada
  2017-prezent au produs constatări de severitate variabilă. Kit-ul
  aplicat fiecărui audit la semnarea finală ar fi ancorat
  auditul-așa-cum-a-fost-emis; kit-ul aplicat faptelor de dezvăluire
  însoțitoare (FACT 07 C2: istoricul auditurilor anterioare) ar fi
  făcut moștenirea metodologică a fiecărui auditor succesiv din
  decalajele anterioare vizibilă public.

- **Minerale de conflict (staniu, tantal, tungsten, aur din RDC și
  regiunea Marilor Lacuri).** Dodd-Frank §1502 a produs obligații de
  audit-și-dezvăluire sub regula SEC 13p-1. Dispute despre adecvarea
  auditurilor la nivel de topitorie și verificarea în aval a
  lanțului de custodie au reapărut în perioada 2014-2022. Sigilii
  MYRIAM per audit ar fi ancorat fiecare audit de topitorie la
  semnarea finală.

- **Audituri comandate de brand ale lanțurilor de aprovizionare cu
  bumbac Xinjiang (2018-prezent).** Dispute despre dacă auditurile
  puteau fi efectuate în mod fiabil sub restricțiile guvernului RPC
  asupra accesului auditorilor au apărut pe scară largă după 2020.
  Un fapt sigilat de metodologie (FACT 04) la fiecare audit ar fi
  ancorat condițiile de acces care s-au aplicat efectiv — făcând
  pretențiile ulterioare de "am efectuat un audit riguros"
  diff-abile față de constrângerile metodologice sigilate la
  momentul respectiv.

- **Subcontractarea Foxconn și rapoartele de responsabilitate ale
  furnizorilor Apple în anii 2010 — descoperiri repetate de
  lucrători minori, dormitoare ascunse, încălcări ale orelor.**
  Sigilii per audit ar fi ancorat *constatările negative* în
  auditurile care nu au găsit nimic, alături de *constatările
  pozitive* în auditurile care au găsit încălcări — împiedicând
  cherry-picking-ul narativ retrospectiv din orice direcție.

Kit-ul NU ar fi prevenit niciunul dintre acestea. În mai multe cazuri,
problema de fond era că auditul a *ratat* abuzul — sigilarea unui audit
curat care ar fi trebuit să găsească încălcări produce o înregistrare
permanentă a unui audit eșuat, ceea ce este un tip diferit de utilitate
(ancorează eșecul pentru răspunderea ulterioară), dar nu este același
lucru cu prevenirea.

---

## Când să folosiți acest kit

- Sunteți un corp de audit care adoptă o practică de "publicăm ce am
  semnat final" ca apărare împotriva presiunii de înmuiere
  post-semnare finală.
- Sunteți un ONG care conduce o investigație paralelă a lanțului de
  aprovizionare și doriți un punct de referință evident la manipulare
  în momentul în care investigația dvs. se închide.
- Sunteți o organizație pentru drepturile lucrătorilor care a obținut
  un raport de audit și doriți să ancorați conținutul său actual
  înainte ca corpul de audit sau brandul să aibă șansa de a-l revizui.
- Sunteți un brand angajat în transparență în privința auditurilor pe
  care le-ați comandat și doriți o înregistrare criminalistică
  verificabilă.
- Sunteți un jurnalist, autoritate de reglementare sau instanță care
  ancorează conținutul unui anumit audit la un moment specific pentru
  litigii sau raportare ulterioară.

## Când să NU folosiți acest kit

- **Nu folosiți ca substitut pentru monitorizarea condusă de
  lucrători, investigații ONG independente sau organizare a
  lucrătorilor.** Kit-ul este *aditiv*, nu un înlocuitor pentru
  niciunul dintre acestea.
- **Nu folosiți pentru a pretinde că un furnizor este conform.** Un
  audit curat sigilat este cel mult un input pentru o evaluare a
  conformității. Tratarea unui audit sigilat ca un certificat de
  conformitate este exact teatrul de legitimitate pe care regulile de
  refuz bazate pe constrângeri există să îl prevină.
- **Nu folosiți la mijlocul auditului.** Sigilarea înainte de
  semnarea finală creează o înregistrare fals-pozitivă "acesta este
  raportul de audit final."
- **Nu folosiți pentru a sigila o schiță pe care intenționați să o
  revizuiți.** Fiecare versiune de semnare finală primește propriul
  său sigiliu; revizuirile fac referire la originale prin rădăcina
  Merkle.
- **Nu folosiți sub presiune pentru a sigila mai devreme decât
  semnarea finală sau pentru a omite o dezvăluire de fapt
  însoțitoare.** Refuzați și (dacă principalul dvs. permite) sigilați
  refuzul.
- **Nu folosiți ca bază pentru o pretenție de marketing "comerț
  echitabil" sau "aprovizionare etică" fără a dezvălui limitele
  metodologiei sigilate alături de sigiliu.** Citarea sigiliului fără
  citarea limitelor este modul de eșec al teatrului-de-legitimitate
  care definește capturarea auditului.
- **Nu folosiți dacă corpul dvs. de audit este structural capturat și
  nu poate publica constatări împotriva interesului comercial al
  brandului comanditar.** În acest caz, sigilarea produce o
  înregistrare publică permanentă a auditului capturat. Aceasta poate
  fi încă valoroasă — dar nu este același lucru cu apărarea împotriva
  capturării.

---

## Cum să faceți fork la acest kit pentru un audit real

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Sincronizare critică:** sigilați LA momentul semnării finale — adică,
atunci când auditorul lider semnează raportul final și acesta devine
poziția oficială a corpului de audit. Un sigiliu înainte de semnarea
finală creează o înregistrare fals-pozitivă "acesta este auditul final."
Un sigiliu mult timp după semnarea finală este criminalistic mai slab
împotriva modificărilor intervenite.

---

## Integrare cu infrastructura existentă de audit al lanțului de aprovizionare

Kit-ul este proiectat să se compună cu, nu să înlocuiască:

- **SA8000 (Social Accountability International).** Rapoartele de
  audit SA8000 și documentele CAP se mapează natural la FACT 03 +
  FACT 05. Referința de acreditare SAAS se potrivește cu FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Constatările de audit ale RBA se mapează la FACT 03;
  regulile de independență ale firmei de audit ale RBA se mapează la
  FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Constatările de
  audit cu 2 piloni și 4 piloni ale SMETA se mapează la FACT 03;
  platforma Sedex găzduiește raportul brut — sigiliul MYRIAM
  ancorează un hash de conținut al raportului găzduit pe platformă.
- **amfori BSCI.** Mecanica de evaluare BSCI A–E se mapează la
  recomandarea de certificare FACT 03; comandarea pe baza apartenenței
  brandului se mapează la dezvăluirea concentrării clienților FACT 06
  și FACT 07 C1.
- **Lanțul de custodie FSC.** Pentru lanțurile de aprovizionare cu
  produse forestiere, certificatele de lanț de custodie și programele
  de re-audit se potrivesc cu fereastra de audit și structura CAP.
- **B Lab / B Corp impact assessment.** Certificarea B Corp nu este
  un audit de terță parte în sensul SA8000, dar rapoartele
  verificatorului evaluării de impact pot fi sigilate sub acest kit
  (cu fapte re-stabilite să se refere la evaluarea de impact mai
  degrabă decât la auditul muncii).
- **ISO 26000.** ISO 26000 este orientare, nu certificabil; kit-ul nu
  are integrare directă a raportului de audit ISO 26000, dar
  taxonomia responsabilității sociale poate informa structura
  elementelor FACT 03 pentru audituri interne.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  alte regimuri specifice sectorului industrial).** Programele de
  audit specifice sectorului pot fi sigilate sub acest kit; câmpul
  standard-de-audit FACT 02 identifică care.
- **Fair Labor Association.** Rapoartele FLA de monitorizare a
  fabricilor se mapează la FACT 03 + FACT 05; cadrul independent-de
  monitorizare al FLA se mapează la declarațiile de independență
  FACT 06.
- **Higg Index (Sustainable Apparel Coalition).** Ieșirile la
  nivelul facilității Higg FEM (Facility Environmental Module) și
  Higg FSLM (Facility Social & Labor Module) pot fi sigilate sub
  acest kit.
- **EU CSRD / CSDDD.** Directiva UE privind raportarea durabilității
  corporative și Directiva privind diligența cuvenită în
  sustenabilitatea corporativă creează obligații de dezvăluire ale
  căror documente de verificare pot fi sigilate sub acest kit.
  Kit-ul ancorează dezvăluirea-așa-cum-a-fost-emisă, nu adecvarea
  sa substanțială.

## Ce NU înlocuiește acest kit

- Monitorizarea condusă de lucrători (cel mai fiabil semnal de
  detectare a abuzului în orice lanț de aprovizionare)
- Investigații ONG independente (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium, etc.)
- Inspecție de reglementare (birouri naționale ale muncii,
  echivalente OSHA, programe ale Biroului Național ILO)
- Organizarea lucrătorilor și negocierea colectivă
- Litigii, arbitraj și remediere conform legii muncii interne
- Cadre de due-diligence din partea brandului (UNGP, OECD Due
  Diligence Guidance, EU CSDDD)

## Licență

Domeniu public (CC0). Faceți fork la el. Nu este necesară atribuirea.
