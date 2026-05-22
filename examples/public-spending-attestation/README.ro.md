*Traducere în limba română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit de sigilare pentru atestarea cheltuielilor publice

Un exemplu turnkey de myriam-kit pentru guvernele municipale, statale,
provinciale și naționale care doresc să ancoreze criptografic înregistrările
de execuție a bugetului (atribuiri de contracte, debursări, acceptări de
livrabile) în momentul emiterii, astfel încât modificarea retroactivă tăcută
a înregistrărilor de cheltuieli publice să devină detectabilă public.

Sigiliul este o **ancoră criminalistică**, nu o certificare de integritate.
Înregistrează ceea ce autoritatea financiară a raportat în ziua în care a
fost raportat, într-o formă care nu poate fi ulterior revizuită tăcut fără
a produce o discrepanță criptografică vizibilă public.

---

## Ce NU face acest kit (citiți mai întâi)

Sigiliul este o marcă de timp criptografică a ceea ce a fost atestat. Nu
poate verifica dacă ceea ce a fost atestat era **legal, echitabil sau
onest**. Următoarele moduri de eșec sunt **în afara domeniului sigiliului**:

1. **Corupție în amonte și mită.** Dacă o achiziție a fost trucată, un
   vânzător a fost selectat din cauza mitei, o justificare de sursă
   unică a fost fabricată sau un contract a fost umflat cu un procent
   de mită convenit — sigiliul ancorează tranzacția-așa-cum-a-fost-
   înregistrată cu prețul umflat și furnizorul favorizat la integritate
   ridicată. Sigiliul observă ieșirea sistemului financiar; nu are
   vizibilitate în corupția în amonte de emitere. *Operação Lava Jato*
   din Brazilia a documentat mite sistematice administrate de cartel de
   ~3% pe mii de contracte Petrobras care ar fi fost sigilate la
   emitere ca și cum ar fi fost complet de rutină.

2. **Ascunderea proprietății beneficiarului prin companii-paravan.** Un
   contract atribuit „Acme Construction Ltd." este sigilat cu numele
   entității din registrul public. Dacă „Acme" este de fapt controlat
   de o persoană politic expusă nedezvăluită sau este una dintre
   zecile de companii-paravan controlate de un singur cartel, sigiliul
   ancorează entitatea de suprafață. Transparența privind proprietatea
   beneficiarului este un regim SEPARAT (FATF Recommendation 24, EU
   5AMLD/6AMLD, US Corporate Transparency Act) ale cărui ieșiri
   necesită propriul protocol de sigilare.

3. **Fraudă contabilă în amonte de emitere.** Dacă autoritatea
   financiară însăși fabrică înregistrarea înainte ca aceasta să fie
   sigilată — contracte fantomă, angajați fantomă pe statele de plată,
   acceptări fictive de livrabile — sigiliul ancorează fabricația.
   Sigiliul nu poate detecta că înregistrarea este falsă în momentul
   în care este înregistrată; poate detecta doar că înregistrarea a
   fost modificată DUPĂ sigilare.

4. **Publicare selectivă / cherry-picking.** O autoritate financiară
   ar putea publica un *subset* de tranzacții — cele curate — și să
   le sigileze doar pe acestea. Sigiliul ancorează ceea ce este în
   publicație; nu ancorează universul tranzacțiilor care ar fi
   trebuit să fie în publicație. FACT 07 (dezvăluiri însoțitoare și
   înregistrarea refuzurilor) al acestui kit este apărarea
   structurală, dar depinde de faptul că autoritatea emitentă este
   onestă cu privire la ceea ce alege să nu sigileze.

5. **Cheltuieli în afara registrelor sau extrabugetare.** Cheltuielile
   publice direcționate prin întreprinderi de stat, fonduri suverane
   de avuție, vehicule cu scop special sau conturi de trust
   extrabugetare ar putea să nu apară în bugetul pe care sigiliul îl
   ancorează. Sigiliul înregistrează ceea ce a fost raportat în
   interiorul sistemului bugetar; cheltuielile în afara sistemului
   sunt în afara domeniului sigiliului. Disputele Autorității de
   Coaliție Provizorie din Irak (CPA) din 2003-2004 au implicat
   aproximativ 9 miliarde USD în debursări de numerar ale căror
   înregistrări au fost parțial pierdute; sigilarea înregistrărilor
   existente în momentul debursării le-ar fi ancorat, dar nu ar fi
   creat înregistrări pe care CPA nu le-a păstrat.

6. **Presiunea de „explicație" post-emitere.** O depășire sigilată, o
   sursă unică sigilată sau un ordin de schimbare sigilat pot fi
   re-narate mai târziu cu orice încadrare dorită de autoritatea
   politică. Sigiliul ancorează FAPTELE la data emiterii, dar nu
   prejudecă narațiunea pe care faptele o vor susține ulterior.

7. **Atestare coercitivă.** Dacă principalul financiar responsabil
   este constrâns să semneze o atestare care prezintă greșit
   tranzacțiile, sigiliul ancorează atestarea coercitivă cu semnătura
   coercitivă. Sigiliul verifică CINE a semnat (FACT 08), nu DE CE
   a semnat. Sigilarea unei atestări coercitive produce o înregistrare
   publică permanentă a ieșirii coercitive — utilă pentru
   responsabilitate ulterioară, dar nu o apărare împotriva coerciției
   în acel moment.

8. **Comparație între jurisdicții.** O cheltuială sigilată este
   lizibilă doar față de regimul juridic al jurisdicției sale
   emitente. „De ce a plătit Municipalitatea X Y pentru serviciul Z
   când Municipalitatea W a plătit doar V?" este o întrebare de
   analiză-comparativă în aval de sigilare. Benchmarking-ul între
   jurisdicții este o sarcină analitică pe date sigilate, nu o
   proprietate a sigiliului.

**Secțiunea cu limite oneste de mai sus este partea de rezistență a
acestui kit.** Oficialii financiari și politicienii care cred că
sigilarea este egală cu integritatea vor folosi acest kit ca scut.
Kit-ul trebuie să spună clar: aceasta este o *primitivă de
non-repudiere pentru momentul emiterii*, nu o dovadă a integrității
cheltuielilor.

---

## Ce TREBUIE acest kit SĂ REFUZE să sigileze

Kit-ul este configurat să respingă următoarele tipare de fapte chiar dacă
sunt trimise de un utilizator cu autoritate de semnare validă:

- **Numele individuale ale angajaților guvernamentali sub nivelul
  principalului-semnatar.** Niciun fapt nu poate numi membrii
  individuali ai personalului din biroul de achiziții, funcționarii
  individuali ai trezoreriei, membrii individuali ai panelului de
  scoring sau orice persoană naturală care nu se află într-un rol
  public de responsabilitate. Riscul de expunere la represalii pentru
  personalul de linie depășește beneficiul de transparență;
  identitățile lor sunt sigilate în controlul intern (FACT 05 hash al
  jurnalului de semnare), nu în corpul atestării.

- **PII al vânzătorilor.** Niciun fapt nu poate include numerele de
  cont bancar al furnizorilor, numele individuale ale angajaților
  furnizorilor, adresele de domiciliu ale furnizorilor, numerele de
  identificare fiscală ale persoanelor naturale, defalcările interne
  de prețuri care conțin structura de cost a furnizorului sau orice
  alt câmp PII-comercial a cărui publicare dăunează intereselor
  furnizorului fără a servi anti-corupția. Astfel de informații pot
  fi HASHED (FACT 05) dar nu publicate.

- **Cheltuieli clasificate de securitate.** Cheltuielile clasificate
  conform statutelor de securitate națională NU sunt eligibile pentru
  sigilare sub acest kit. Manipularea clasificată este o problemă
  diferită cu cerințe criptografice și legale diferite. Excluderea
  însăși este dezvăluită în FACT 07 R3, astfel încât cititorul să
  știe că publicația este parțială prin design.

- **Aplicarea civilă a obligațiilor fiscale împotriva persoanelor
  naturale identificate.** Chiar dacă costurile de aplicare sunt
  cheltuieli publice, numirea contribuabililor individuali sub
  aplicare este refuzată: dăunarea privacy depășește beneficiul de
  transparență, și transparența paralelă există sub raportarea
  curții fiscale.

- **Tranzacții pre-emitere.** Niciun contract înainte de atribuirea
  formală; nicio debursare înainte de emiterea formală. Sigilarea
  unui contract în formă de schiță sau a unei plăți în așteptare ca
  și cum ar fi executată creează certitudine falsă.

- **Sigilarea de către oricine altcineva decât principalul financiar
  responsabil.** Un contractor, vânzător, membru de consiliu,
  jurnalist sau observator nu poate sigila „înregistrarea
  cheltuielilor publice" în locul autorității financiare care a
  emis-o. (Ei pot sigila propriile observații sub propriul principal,
  într-o publicație separată.)

- **Încadrări de „liber de corupție".** Kit-ul refuză să sigileze
  orice încadrare de forma „această cheltuială a fost legală și
  liberă de corupție" sau „achiziția a fost demonstrabil echitabilă."
  Astfel de pretenții sunt epistemic dincolo de domeniul kit-ului.

- **Publicații care omit dezvăluirile însoțitoare FACT 07.** O
  publicație de tranzacții fără înregistrarea însoțitoare de
  dezvăluire și refuz nu este o publicație MYRIAM legitimă sub acest
  kit.

Un refuz în sine poate fi sigilat ca fapt („Această parte a solicitat
sigilarea X; kit-ul a refuzat conform regulii de refuz Y"), creând o
înregistrare publică a tentativei de utilizare abuzivă. Într-un
domeniu unde presiunea politică asupra oficialilor financiari este
documentată, o înregistrare a cererilor *refuzate* este în sine un
semnal de integritate.

---

## Ce SIGILEAZĂ acest kit

8 fapte în momentul atestării execuției bugetare:

1. **Notă de exemplu** — declară publicația ca exemplu (atestările
   reale elimină sau înlocuiesc aceasta).
2. **Jurisdicție și bază legală** — care entitate guvernamentală
   emite, sub care autoritate statutară, în care perioadă fiscală.
3. **Referință de apropiere sau buget** — liniile specifice din
   bugetul adoptat care sunt executate, cu hash-uri ale instrumentului
   bugetar și ale oricăror amendamente / transferuri / reprogramări
   aplicate.
4. **Manifest de contracte sau debursări** — înregistrare per
   tranzacție: sumă, numele entității juridice a vânzătorului (fără
   PII individual), scop, dată, tip de achiziție, baza atribuirii,
   hash al documentului de contract.
5. **Hash-uri ale documentelor justificative** — SHA-256 al
   solicitărilor, evaluărilor, contractelor executate, ordinelor de
   schimbare, aplicațiilor de plată, formularelor de acceptare a
   livrabilelor, înregistrărilor registrului trezoreriei, jurnalelor
   de semnare a controalelor. Doar hash-uri, nu conținut — pentru a
   proteja PII comercial și personal, permițând în același timp
   verificarea re-hash.
6. **Stare de audit și supraveghere** — care organism inspector
   general are jurisdicție, care instituție supremă de audit, care
   organism procuratorial are jurisdicție pentru infracțiunile de
   corupție, termenele de audit, starea actuală a oricărei revizuiri
   în curs.
7. **Dezvăluiri însoțitoare și înregistrarea refuzurilor** — proteste
   de achiziții în așteptare, investigații interne în așteptare,
   cereri FOI restante, revizuiri divergente, depășiri cunoscute de
   linie bugetară; listă explicită a tiparelor pe care kit-ul a
   refuzat să le sigileze.
8. **Principal semnatar** — oficialul financiar responsabil + rol +
   responsabilitate statutară + co-semnatari sub control dublu; ce
   este și ce nu este atestat personal de fiecare semnatar.

Fiecare fapt se termină cu convenția poartă-de-refuz: *„Acest fapt
afirmă doar X. Nu afirmă Y"* (unde Y este cel mai apropiat mod de
eșec din secțiunea „NU face").

---

## Împotriva a ce apără acest kit

- **Revizuirea tăcută post-emitere a sumelor contractuale.** Orice
  modificare a oricărei sume din FACT 04 produce un SHA-256 diferit,
  o rădăcină Merkle diferită, eșuează verificarea OTS.
- **Substituirea tăcută a vânzătorului.** Înlocuirea „Vânzător A" cu
  „Vânzător B" pe un contract deja emis este detectabilă din
  octeții sigilați.
- **Antedatarea ordinelor de schimbare.** FACT 04 îngheață data
  ordinului de schimbare și raționamentul la emitere; orice
  pretenție ulterioară de „acesta a fost întotdeauna domeniul
  convenit" trebuie să se confrunte cu înregistrarea sigilată a
  ordinului de schimbare.
- **Dispariția silențioasă a tranzacțiilor nefavorabile.** Toate
  tranzacțiile emise în perioadă sunt în FACT 04 sub o rădăcină
  Merkle. Publicarea unui subset este detectabilă din lista de
  hash-uri-frunză.
- **Suprimarea dezvăluirilor însoțitoare.** FACT 07 îngheață
  starea protestului în așteptare, a investigației în așteptare și
  a FOI restantă în momentul atestării. Orice pretenție ulterioară
  de „nu am auzit niciodată despre acel protest" este public
  diff-abilă.
- **Deriva jurisdicției de audit.** FACT 06 îngheață care organisme
  au jurisdicție de supraveghere asupra tranzacțiilor sigilate. O
  pretenție ulterioară că un anumit IG „nu avea autoritate" trebuie
  să se confrunte cu înregistrarea sigilată a jurisdicției.
- **Ștergerea înregistrării refuzurilor.** FACT 07 înregistrează
  ceea ce kit-ul a refuzat să sigileze; orice pretenție ulterioară
  de „nu am refuzat niciodată nimic" contrazice înregistrarea
  sigilată.

---

## Cazuri istorice în care kit-ul ar fi ajutat

Kit-ul ar fi produs o **ancoră criminalistică** utilă — *nu o
reparație, nu o prevenire, nu un substitut pentru urmărirea penală* —
în cazuri publice-documentate care implică modificarea retroactivă
tăcută a înregistrărilor de cheltuieli publice:

- **Brazilia — descendența *Operação Lava Jato* / Petrobras
  (2014-2021).** Procurorii federali brazilieni au documentat un
  cartel al firmelor majore de construcții care, timp de peste un
  deceniu, au plătit mite cu o medie de ~3% pe contractele de
  infrastructură Petrobras și alte contracte federale, mita fiind
  direcționată către politicieni și către coordonarea propriilor
  prețuri ale cartelului. Contractele așa cum au fost emise păreau
  de rutină; corupția era în amonte de emitere. Un kit de sigilare
  NU ar fi prevenit Lava Jato (mitele erau încorporate în preț
  ÎNAINTE ca contractul să ajungă la sigiliu), dar ar fi ancorat
  termenii contractului la emitere — făcând reconstrucția
  criminalistică ulterioară a „ce a spus de fapt fiecare contract
  când a fost semnat" enorm mai ieftină. Costul investigativ al
  Lava Jato a fost în mare parte costul reasamblării cronologiei
  din înregistrările arhivate inconsistente.

- **Uniunea Europeană — dispute privind fondul de dezvoltare
  regională (state membre multiple, anii 2010-2020).** Rapoartele
  anuale ale Curții Europene de Conturi au identificat în mod
  repetat rate materiale de eroare în cheltuielile Fondului
  Structural și de Investiții Europene (ESIF) și ale Fondului de
  Coeziune, în unii ani depășind pragul de materialitate.
  Disputele despre „ce s-a pretins de fapt" versus „ce s-a livrat
  de fapt" reapar deoarece documentația pretenției poate fi
  revizuită între depunere și audit. Sigilarea MYRIAM per-emitere
  a pretenției-așa-cum-a-fost-depusă ar fi ancorat conținutul
  fiecărei pretenții la depunere, separând „ce a pretins
  beneficiarul la momentul respectiv" de „ce a concluzionat
  reconstrucția post-audit."

- **Irak — debursări ale Autorității de Coaliție Provizorie (CPA),
  2003-2004.** CPA a debursat aproximativ 9 miliarde USD în numerar
  din Fondul de Dezvoltare pentru Irak cu documentație pe care
  Inspectorul General Special pentru Reconstrucția Irakului (SIGIR)
  și rapoartele de audit ulterioare au caracterizat-o ca substanțial
  incompletă. Disputele privind înregistrările de debursare persistă
  două decenii mai târziu. Sigilarea în momentul debursării nu ar fi
  creat înregistrări pe care CPA nu le-a păstrat — dar acolo unde
  exista vreo înregistrare (registre scrise de mână, autorizații de
  transfer datate), un sigiliu contemporan ar fi ancorat starea
  octet-cu-octet a acelei înregistrări în momentul emiterii,
  separând „înregistrarea la momentul respectiv" de „înregistrarea
  așa cum a fost reconstruită mai târziu."

- **Grecia — datorii suverane și revizuiri ale raportării
  cheltuielilor publice (2009-2010).** Auditurile Eurostat din
  2009-2010 au documentat revizuiri substanțiale la datele fiscale
  grecești raportate anterior, cu metodologia revizuirii însăși
  contestată. Sigilarea rapoartelor trimestriale de cheltuieli în
  momentul publicării originale ar fi făcut *delta-ul* dintre
  rapoartele originale și revizuite public diff-abilă, mai degrabă
  decât reconstruibilă doar prin comparație de arhivă. Sigiliul nu
  ar fi prevenit disputa metodologică subiacentă, dar ar fi ancorat
  fiecare trimestru raportat în momentul raportului original.

- **Regatul Unit — achiziții în pandemie (2020-2022).** Biroul
  Național de Audit al Regatului Unit și rapoartele comitetelor
  parlamentare au identificat procese de achiziții în timpul
  2020-2021 în care contractele au fost atribuite sub dispoziții de
  urgență cu concurență redusă și documentație redusă; unele
  atribuiri au fost ulterior modificate, anulate sau soluționate.
  Sigilarea per-emitere a fiecărei atribuiri de achiziție-de-urgență
  ar fi ancorat raționamentul și termenii atribuirii în momentul
  atribuirii, făcând modificările ulterioare o delta vizibilă
  public, mai degrabă decât o înregistrare modificată tăcut.

- **Africa de Sud — contracte ale întreprinderilor publice din era
  capturării statului (~2010-2018).** Comisia Zondo a documentat
  contracte la mai multe întreprinderi de stat (Eskom, Transnet,
  Denel) a căror documentație a fost în diverse moduri incompletă,
  revizuită sau contestată. Sigilarea fiecărei atribuiri de
  contract la emitere ar fi ancorat starea-așa-cum-a-fost-atribuită
  a înregistrării, separând ieșirile de reconstrucție-criminalistică
  ulterioare de înregistrarea contemporană.

Kit-ul NU ar fi prevenit corupția subiacentă în niciunul dintre
cazurile de mai sus. În mai multe cazuri, problema subiacentă era că
corupția era *în amonte de emitere* — sigiliul ancorează contractul
corupt la integritate ridicată, ceea ce este un tip diferit de
utilitate (ancoră criminalistică pentru responsabilitate ulterioară),
dar nu este același lucru cu prevenirea. În alte cazuri (numerar CPA,
cheltuieli în afara bugetului), problema subiacentă era că
înregistrările care erau sigilate nu existau sau nu erau menținute —
kit-ul nu poate crea înregistrări pe care autoritatea nu le-a produs.

Aceste cazuri istorice sunt numite doar cu referire la constatări
documentate public (înregistrări judiciare, rapoarte ale comitetelor
parlamentare, publicații ale organismelor de audit). Nu se face
nicio pretenție despre vreun individ; constatările instituționale
documentate stau pe înregistrarea publică.

---

## Când să folosiți acest kit

- Jurisdicția dvs. are un proces de raportare stabilit pentru
  execuția bugetară și doriți să adăugați o ancoră publică
  imuabilă.
- Așteptați scrutinul post-emitere (cereri FOI, audit,
  monitorizarea societății civile, investigație jurnalistică) și
  doriți un punct de referință evident la manipulare.
- Aveți autoritate legală sub legea de transparență /
  registre-deschise să publicați setul de fapte listat, cu
  excluderile de privacy/securitate onorate.
- Operați sub un regim de audit statutar (inspector general,
  instituție supremă de audit) și doriți să ancorați fiecare
  închidere trimestrială înainte ca ciclul de audit să ajungă la
  ea.
- Publicați sub Open Contracting Data Standard sau IATI și doriți
  un complement criptografic la publicarea bazată pe portal.

## Când să NU folosiți acest kit

- **Nu folosiți ca substitut pentru auditul statutar, revizuirea
  inspectorului general, investigația procuratorială sau
  monitorizarea societății civile.** Kit-ul este *aditiv*, nu un
  înlocuitor.
- **Nu folosiți ca certificat de legitimitate.** O înregistrare de
  cheltuieli sigilată nu este un certificat fără-corupție.
  Tratarea ei ca atare este exact modul de eșec pe care structura
  bazată-pe-constrângeri a kit-ului există să îl prevină.
- **Nu folosiți la mijlocul perioadei.** Kit-ul este pentru momentul
  emiterii formale (închidere trimestrială, atribuire de contract,
  debursare de jalon). Sigilările la mijlocul perioadei creează
  puncte de referință înșelătoare.
- **Nu folosiți pentru a pretinde că cheltuiala a fost legală,
  echitabilă sau non-coruptă** — kit-ul nu poate face asta.
- **Nu folosiți pentru a sigila cheltuieli clasificate, PII
  individual al angajaților sau PII comercial al furnizorului.**
  Kit-ul refuză aceste tipare; încercarea lor creează o înregistrare
  de refuz (FACT 07).
- **Nu folosiți pentru a sigila schițe pre-emitere.** Schițele pot
  fi sigilate sub un tip de atestare diferit („schiță pentru
  comentarii, neemisă"), dar nu sub tipul de emitere al acestui
  kit.
- **Nu folosiți sub presiune pentru a omite dezvăluirile FACT 07.**
  Refuzați și sigilați refuzul.
- **Nu folosiți dacă autoritatea dvs. financiară este capturată.**
  O cheltuială frauduloasă sigilată este o înregistrare publică
  permanentă a fraudei, nu o apărare a acesteia. Primitiva taie în
  ambele sensuri; aceasta este onestitatea sa.

---

## Cum să faceți fork la acest kit pentru o atestare reală

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Sincronizare critică:** sigilați LA momentul emiterii formale —
adică, momentul în care principalul financiar responsabil semnează
închiderea trimestrială, momentul în care un contract este atribuit
formal sau momentul în care o debursare este emisă formal. Un sigiliu
înainte de emiterea formală creează o referință fals-pozitivă „aceasta
este înregistrarea oficială." Un sigiliu mult timp după emiterea
formală este criminalistic mai slab împotriva modificărilor
intervenite.

**Cadență:** kit-ul este proiectat pentru atestări trimestriale ca
valoare implicită. Cadențe sub-trimestriale (închidere lunară,
sigilare per-tranzacție) sunt susținute prin re-rularea cu sferă
adecvată; sigilul unei singure tranzacții de valoare ridicată este
o utilizare legitimă.

---

## Integrare cu infrastructura existentă de finanțe publice

Kit-ul este proiectat să se compună cu, nu să înlocuiască:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Cele cinci
  puncte de publicare (planificare, licitație, atribuire, contract,
  implementare) se mapează natural pe FACT 03 (planificare →
  apropiere), FACT 04 (licitație, atribuire, contract, implementare
  → manifest de tranzacții) și FACT 05 (hash-uri ale documentelor
  justificative). Exportul JSON OCDS în sine este sigilat în FACT 05
  (documente de control). O jurisdicție care rulează publicarea
  OCDS poate adăuga sigilarea MYRIAM ca un strat criptografic peste
  portalul său existent.

- **Standardul International Aid Transparency Initiative (IATI)
  v2.03.** Pentru cheltuieli finanțate în întregime sau parțial de
  ajutoare externe, XML IATI poate fi sigilat ca document de
  control; sigiliul oferă un complement criptografic la modelul de
  publicare bazat pe HTTP al Registrului IATI.

- **Angajamentele Open Government Partnership (OGP).** Planurile
  Naționale de Acțiune ale OGP includ frecvent angajamente de
  transparență fiscală; sigilarea MYRIAM operaționalizează un
  angajament de „publicare evidentă la manipulare" într-un mod
  care este verificabil independent de societatea civilă fără a
  necesita încredere în portalul guvernamental.

- **Recomandarea OECD privind Integritatea Publică (2017).** Kit-ul
  susține Recomandarea 4 (date guvernamentale deschise privind
  finanțele publice în formă citibilă-mașină, oportună) făcând
  datele ancorate criptografic precum și citibile-mașină.

- **Convenția ONU împotriva Corupției (UNCAC), în special Articolele
  9 (achiziții) și 13 (participarea societății).** Kit-ul oferă o
  primitivă criminalistică care susține obligațiile de transparență
  ale Articolului 9 și supravegherea societății civile a
  Articolului 13.

- **Instituții Supreme de Audit (SAI) — cadrul INTOSAI.** SAI care
  operează sub standardele INTOSAI (ISSAI) pot consuma publicațiile
  sigilate ca dovezi cu integritate ridicată; hash-urile SHA-256
  din FACT 05 sunt aceleași hash-uri pe care instrumentele e-audit
  ale SAI le pot re-calcula.

- **Birouri inspector-general.** Birourile IG domestice cu
  jurisdicție asupra cheltuielilor sigilate (FACT 06) pot cita
  corpurile de documente ale căror hash-uri sunt sigilate în
  FACT 05; sigiliul leagă corpurile de documente primite sub citație
  de corpurile care existau la emitere.

- **Statutele privind libertatea de informație și registrele
  deschise.** Sigiliul nu scutește autoritatea emitentă de
  obligațiile FOI continue; de fapt, face răspunsul FOI selectiv
  detectabil ca o deviere de la înregistrarea sigilată. FACT 07 C3
  ancorează cererile FOI restante la momentul atestării.

- **Registre de proprietate beneficiară (FATF Recommendation 24,
  EU AML directives, US Corporate Transparency Act).** Datele de
  proprietate beneficiară NU sunt sigilate sub acest kit (FACT 04
  sursează identitatea vânzătorului doar din numele entității
  juridice înregistrate). O dezvăluire de proprietate beneficiară
  este un regim de sigilare separat care poate produce o publicație
  paralelă referită prin rădăcina Merkle.

- **Transparența administrată de instanțe (raportarea cheltuielilor
  judiciare, proceduri de recuperare a activelor).** Ieșirile
  procedurilor judiciare legate de corupție nu sunt în sfera acestui
  kit, dar pot fi sigilate sub tipuri de atestare paralele.

## Ce NU înlocuiește acest kit

- Auditul statutar al execuției bugetare de către organismele
  inspector-general
- Revizuirea instituției supreme de audit (GAO, NAO, TCU, CAG,
  AGN, BRH, Cour des comptes, echivalent)
- Investigația procuratorială a infracțiunilor de corupție
  (procurori naționali anti-corupție, organisme UNCAC Articolul 36)
- Raportarea investigativă a societății civile și jurnalistică
- Canale pentru avertizori și regimuri de dezvăluire protejată
- Dezvăluirea proprietății beneficiare
- Revizuirea peer internațională (OECD, IMF Fiscal Transparency
  Evaluation, EU semester, IATI registry)
- Procedurile de recuperare a activelor administrate de instanțe

Sigiliul este o primitivă criminalistică care reduce costul și
crește fiabilitatea tuturor celor de mai sus. Nu este și nu poate fi
un înlocuitor pentru niciunul dintre ele.

---

## Licență

Domeniu public (CC0). Faceți fork la el. Nu este necesară
atribuirea.
