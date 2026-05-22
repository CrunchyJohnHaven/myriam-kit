*Traducere în limba română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit de sigilare a numărătorii voturilor pre-certificare

Un exemplu turnkey de myriam-kit pentru consiliile electorale județene,
autoritățile electorale de stat și observatorii integrității electorale
care doresc să publice un sigiliu ancorat în Bitcoin, evident la
manipulare, al unei numărători în momentul exact al certificării.

**Închide** [issue-ul #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Ce NU face acest kit (citește mai întâi)

Sigiliul este un timestamp criptografic al ceea ce a fost certificat.
Nu poate verifica dacă ceea ce a fost certificat era corect.
Următoarele moduri de eșec sunt **în afara domeniului sigiliului**:

1. **Compromiterea mașinii de vot.** Dacă firmware-ul a fost
   manipulat sau totalurile voturilor au fost numărate greșit,
   sigiliul ancorează un număr greșit cu integritate ridicată.
   Sigiliul observă ieșirile sistemului de tabulare; nu are
   vizibilitate asupra sistemului în sine.

2. **Suprimarea voturilor / privarea structurală de drepturi de
   vot.** Închiderile centrelor de votare, disparitățile în legile
   ID, prejudecățile în rata respingerii buletinelor poștale și
   epurările de înregistrare sunt în amonte de certificare.
   Sigiliul înregistrează buletinele numărate, nu buletinele care
   ar fi trebuit numărate.

3. **Dezinformare electorală.** Sigiliul nu judecă afirmațiile
   despre alegeri făcute de candidați, mass-media sau platforme.
   O certificare sigilată poate fi citată într-o narațiune de
   dezinformare la fel de ușor ca în apărarea împotriva uneia.
   Timestampurile criptografice sunt neutre din punct de vedere
   al conținutului.

4. **Fraudă pre-certificare în timpul colectării sau numărării
   buletinelor.** Neregulile de recoltare a buletinelor,
   manipularea cutiilor de depozit, întreruperile lanțului de
   custodie în timpul ferestrei de numărare — toate au loc
   înainte de momentul sigilării. Sigiliul nu le poate detecta
   retroactiv.

5. **Coerciția autorității de certificare.** O certificare
   coerced produce un sigiliu criptografic valid al unui rezultat
   coerced. Sigiliul verifică faptul că un oficial a semnat, nu
   de ce.

6. **Certificări greșite care nu sunt corectate ulterior.** Valoarea
   sigiliului depinde de un proces ulterior de descoperire a
   adevărului (audit, renumărare, litigiu) cu care sigiliul poate
   fi comparat. Dacă nu se desfășoară niciodată un astfel de
   proces, sigiliul rămâne ca singura înregistrare și poate
   calcifia eroarea.

7. **Anomalii statistice și detectarea tiparelor.** Sigiliul nu
   semnalează margini implauzibile, anomalii geografice sau
   deviații Benford. Acestea sunt sarcini analitice asupra datelor
   sigilate, nu proprietăți ale sigiliului.

8. **Curse mai jos pe buletin cu trasee de audit subțiri.** Cursele
   mai mici au declanșatori de renumărare mai slabi; un singur
   sigiliu nu poate acoperi semnificativ toate cursele de pe un
   buletin fără o scopaire pe cursă.

**Secțiunea de limite oneste de mai sus este partea portantă a
acestui kit.** Oficialii care cred că sigilarea echivalează cu
legitimitatea o vor folosi ca scut. Kit-ul trebuie să spună clar:
acesta este o *primitivă de ne-repudiere pentru momentul
certificării*, nu o dovadă a corectitudinii alegerilor.

---

## Ce trebuie să REFUZE acest kit să sigileze

Kit-ul este configurat să respingă următoarele tipare de fapte chiar
dacă un utilizator cu autoritate de semnare validă le trimite:

- **Identificarea individuală a votanților.** Niciun fapt nu poate
  numi un votant, nu poate lega un buletin de un votant, și nu
  poate expune niciun câmp care ar putea re-identifica o persoană.
- **Decizii de potrivire a semnăturii pe buletin.** Încărcate cu
  PII; sigilarea creează înregistrări permanente ale deciziilor
  care pot fi ulterior contestate.
- **Orice fapt a cărui publicare ar identifica un votant
  vulnerabil.** Include rezultate la nivel de secție de votare în
  secții atât de mici încât alegerea votului este deductibilă (de
  obicei <50 buletine).
- **Numărători sigilate înainte ca toate buletinele să fie
  numărate.** Kit-ul refuză numărările parțiale prezentate ca
  „numărătoarea". Pre-certificare înseamnă *toate buletinele
  numărate, înainte de certificarea oficială* — nu *în timpul
  numărării*.
- **Certificări provizorii sau condiționate.** Sigiliul trebuie să
  reflecte un fapt, nu o condiție.
- **Numărători care exclud cohorte de litigii pendinte** fără un
  fapt-companion sigilat explicit care să dezvăluie excluderea.
- **Sigilare de către altcineva decât autoritatea de certificare**
  pentru acea jurisdicție.

Un refuz în sine poate fi sigilat ca un fapt („Această autoritate
a solicitat sigilarea lui X; kit-ul a refuzat conform regulii de
refuz Y"), creând o înregistrare publică a tentativei de
utilizare necorespunzătoare.

---

## Ce sigilează acest kit

8 fapte în momentul certificării:

1. **Notificare de exemplu** — declară publicarea ca exemplu
   (atestările reale elimină sau înlocuiesc acest lucru).
2. **Identificarea jurisdicției** — județ, data alegerilor,
   autoritatea de certificare, oficialii care certifică după nume +
   rol.
3. **Numărătoarea certificată** — pe competiție pe candidat,
   totalurile voturilor + voturile excesive/insuficiente +
   write-ins.
4. **Contabilitatea și reconcilierea buletinelor** — total exprimate,
   total tabulate, total respinse pe categorii, defalcarea pe mod,
   numitorul de votanți înregistrați.
5. **Manifestul echipamentului și al traseului de audit** — model de
   tabulator + hash de firmware, hash-ul fișierului CVR, hash-ul
   arhivei de imagini de buletin, hash-ul jurnalului de custodie,
   hash-ul politicii de potrivire a semnăturilor.
6. **Praguri și declanșatori la certificare** — pragul de potrivire
   a semnăturilor în vigoare, pragurile de declanșare a
   renumărării, marginile reale pe competiție, angajamentul de
   sămânță RLA.
7. **Dezvăluiri-companion și înregistrare de refuz** — litigii
   pendinte, anomalii post-numărare sub revizuire, cohorte
   excluse, membri ai consiliului dizidenți; lista explicită a
   tiparelor pe care kit-ul a refuzat să le sigileze.
8. **Principalul de semnare** — identificarea Consiliului
   Electoral + numele și partidul fiecărui semnatar + informații
   despre cheia criptografică.

Fiecare fapt se încheie cu convenția porții de refuz: *„Acest fapt
afirmă doar X. Nu afirmă Y"* (unde Y este cel mai apropiat mod de
eșec din secțiunea „NU face" de mai sus).

---

## Împotriva a ce se apără acest kit

- **Revizuirea tăcută post-certificare a totalurilor voturilor** —
  orice schimbare de număr întreg la FACT 03 produce un SHA-256
  diferit, un Merkle root diferit, eșuează verificarea OTS.
- **„Buletinele găsite" absorbite tăcut** — aritmetica de
  reconciliere FACT 04 este fixă la certificare.
- **Afirmații de substituire a firmware-ului** — FACT 05
  îngheață manifestul echipamentului la certificare.
- **Substituirea artefactelor de audit post-certificare** —
  manifestul de hash al FACT 05 prinde orice schimbare post-cert
  a CVR, imaginilor de buletin, jurnalelor de custodie sau
  politicii de potrivire a semnăturilor.
- **Redefinirea pragurilor și declanșatorilor** — FACT 06
  îngheață regulile în vigoare la certificare (pragul de
  potrivire a semnăturilor, declanșatorii de renumărare, limita
  de risc RLA).

## Cazuri istorice sau aproape-istorice cu care kit-ul ar fi ajutat

Kit-ul ar fi produs o ancoră utilă — *nu o reparație* — în cazuri
care implică:

- **Antrim County, Michigan (2020).** Rezultatele inițiale
  neoficiale au arătat o schimbare de candidat corectată ulterior
  la rezultatul opus. Un sigiliu pre-corecție ar fi furnizat o
  referință publică pentru ceea ce spunea anunțul original vs.
  ceea ce spunea corecția, cu ambele atestate criptografic.
- **Maricopa County, Arizona (2020–2022).** Au circulat mai multe
  iterații de totaluri renumărate/re-examinate. Un sigiliu în
  momentul certificării ar fi furnizat un punct de referință
  neambiguu împotriva căruia fiecare numărătoare ulterioară putea
  fi comparată.
- **Florida 2000 (Bush v. Gore canvass).** Totalurile certificate
  pe județe s-au schimbat sub presiunea renumărării; un sigiliu
  pre-renumărare pe județ ar fi păstrat ceea ce fiecare județ a
  certificat înainte de începerea procedurilor de renumărare
  manuală.
- **Diverse alegeri străine cu „corecții" post-certificare
  documentate.** Agnostic față de jurisdicție.

Kit-ul NU ar fi rezolvat disputele subiacente despre integritatea
mașinilor în 2020, disputele de politică privind buletinele de
vot prin poștă sau orice alegeri în care întrebarea de bază era
faptul contestat mai degrabă decât înregistrarea contestată.

## Când să folosești acest kit

- Jurisdicția ta are un proces de certificare stabil, auditat și
  dorește să adauge o ancoră publică imuabilă.
- Te aștepți la o examinare post-certificare și dorești un punct
  de referință evident la manipulare.
- Ai autoritate legală să publici setul de fapte enumerate fără a
  expune PII.
- Ai un audit paralel sau un proces RLA, astfel încât sigiliul să
  poată fi comparat cu ieșirea de descoperire a adevărului.

## Când să NU folosești acest kit

- **Nu folosi ca substitut pentru auditurile cu limitare de risc,
  renumărările manuale sau auditurile post-electorale.** Acest
  kit este *aditiv*, nu de înlocuire.
- **Nu folosi dacă oficialul de certificare nu este decident-ul
  real** (creează atribuire falsă).
- **Nu folosi în mijlocul tabulării.** Kit-ul este pentru
  momentul certificării specific. Sigiliile de numărare parțială
  creează puncte de referință înșelătoare.
- **Nu folosi pentru a pretinde că alegerile au fost corecte,
  precise sau legitime** — nu poate face asta.
- **Nu folosi sub presiune să sigilezi mai devreme decât momentul
  certificării, sau să omiți o dezvăluire de fapt-companion.**
  Refuză, și sigilează refuzul.
- **Nu folosi ca teatru de legitimitate.** Un sigiliu al unei
  numărători frauduloase este o înregistrare publică permanentă
  a fraudei, nu o apărare a ei. Primitiva taie în ambele
  direcții; aceasta este onestitatea ei.

## Cum să faci fork acestui kit pentru o certificare reală

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # înlocuiește conținutul fictiv cu real
bash build/seal.sh     # sigilează LA sau după semnătura oficială de certificare
python3 build/verify.py
```

**Sincronizare critică:** sigilează LA momentul certificării, NU
înainte. Un sigiliu înainte de certificarea oficială creează o
înregistrare „acesta este rezultatul oficial" fals pozitivă. Un
sigiliu după este ne-repudiere convențională.

## Integrarea cu infrastructura electorală existentă

- **State Boards of Elections / Certificarea EAC.** Kit-ul
  publică alături de documentul oficial de certificare. Nu
  înlocuiește certificarea statutară.
- **Auditurile cu limitare de risc.** Hash-ul CVR din FACT 05
  este același hash pe care îl consumă instrumentul RLA.
  Sigiliul leagă CVR-ul auditat de totalul certificat.
- **Procedurile de renumărare.** O renumărare declanșată conform
  legii statului produce un NOU set de fapte sigilate (timestamp
  diferit, hash-uri diferite, aceeași jurisdicție). Ambele
  sigilii coexistă; niciunul nu îl suprascrie pe celălalt.
  Diferența dintre sigilii este înregistrarea publică a ceea ce
  a schimbat renumărarea.
- **Election Markup Language (EML) și Common Data Format (CDF).**
  Corpurile faptelor ar trebui să fie derivabile din ieșirile
  EML/CDF existente ale jurisdicției pentru a menține kit-ul
  agnostic față de formatul de date.
- **Semnarea bipartizană a Consiliului Electoral.** Variantă cu
  multi-semnătură recomandată pentru jurisdicțiile cu consilii
  electorale echilibrate partizan.

## Ce NU înlocuiește acest kit

- Certificarea statutară conform legii electorale de stat
- Certificarea sistemului de votare EAC
- Auditurile cu limitare de risc / renumărările manuale
- Procedurile de renumărare și auditurile post-electorale
- Ordinele judecătorești sau litigiile de contestare a alegerilor

## De ce există acest kit în v0.3.0+

Acesta este al 6-lea exemplu lucrat livrat cu myriam-kit. Kit-ul a
fost produs printr-un proces de autoresearch în stil Karpathy
documentat în `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Trei
variante de prompt (imitație / primele-principii /
constrângere-întâi) au produs schițe de kit paralele; varianta
constrângere-întâi a obținut cel mai mare scor pe o rubrică
ponderată, iar kit-ul final sintetizează structura sa cu coeziunea
variantei de imitație și detaliul operațional al variantei
primele-principii.

Autoresearch-ul în sine este documentat ca un tipar de prompt în
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` pentru utilizare ulterioară.

## Licență

Domeniu public (CC0). Forkează-l. Nu este necesară atribuirea.
