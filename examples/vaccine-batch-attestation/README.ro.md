*Traducere în limba română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit de atestare a loturilor de vaccin

Un exemplu turnkey de myriam-kit pentru producătorii de vaccinuri,
autoritățile de asigurare a calității și agențiile de sănătate
publică care doresc să publice un sigiliu ancorat în Bitcoin, evident
la manipulare, al unei eliberări de lot.

## Împotriva a ce se apără acest kit

**Moduri de eșec pe care le prinde sigiliul:**

- **Modificarea tăcută retroactivă a rezultatelor testelor de
  eliberare.** Toate cele 8 PDF-uri de testare a eliberării din
  exemplu sunt hash-uite. Re-hash-uirea după eliberare dezvăluie
  orice modificare.
- **Dispute despre care specificații s-au aplicat la eliberare.**
  FACT 02 sigilat conține identificarea canonică a lotului și
  hash-ul înregistrării de fabricație. Viitoarele dispute „spec-ul
  a fost întotdeauna X" au o ancoră publică.
- **Minimizarea tăcută a sferei de recall.** Angajamentele de
  farmacovigilență din FACT 05 sunt sigilate; nerespectarea lor
  este observabilă public.
- **Re-specificarea retroactivă pentru un lot în afara
  specificațiilor.** Dacă un rezultat al testului de eliberare a
  fost de fapt un PASS la limită care este reclasificat ca FAIL
  după eliberare, hash-urile raportului sigilat dovedesc ce a spus
  PDF-ul original al rezultatului.

**Moduri de eșec NEACOPERITE:**

- Fraudă în însuși procesul de fabricație (sigiliul ancorează
  rezultatele testelor, nu integritatea fabricației).
- Evenimente adverse care sunt consecințe biologice ale unui lot
  altfel acceptat (sigiliul nu certifică siguranța clinică, doar
  integritatea documentației).
- Dispute despre care versiune a unei specificații de reglementare
  este autoritativă.

## Când să folosești acest kit

Ia în considerare sigilarea unei eliberări de lot dacă:

- Ești un producător de vaccinuri care dorește să demonstreze
  integritatea forensică a înregistrărilor de eliberare dincolo de
  ceea ce cer reglementatorii
- Ești o echipă QA care adoptă o practică de „publicăm ceea ce
  atestăm"
- Ești un producător la scară mică/națională într-o jurisdicție cu
  infrastructură de reglementare mai slabă, care dorește să
  ancoreze înregistrările de lot față de un verificator global
- Ești o agenție de sănătate publică sau ONG care rulează un
  program de producție de vaccinuri non-comercial (de ex. pentru
  boli neglijate)

## Precedent istoric de mortalitate

- **Contaminarea cu heparină (2008, China):** sulfat de
  condroitină supersulfatat contrafăcut în loturi de heparină. Un
  manifest sigilat de teste de eliberare ar fi făcut modificarea
  tăcută post-eliberare a înregistrării de testare detectabilă
  criptografic.
- **Cianura de Tylenol (1982):** dispute retroactive despre
  punctul de origine al manipulării. Un hash sigilat al
  înregistrării de fabricație ancorează starea pre-distribuție.
- **Diverse recall-uri de loturi de vaccin** unde întrebarea „a
  fost vreodată acest lot testat în mod corespunzător" devine
  contestată ani mai târziu.

Kit-ul NU este o reparație pentru NICIUNA dintre acestea în sens
strict — dar în fiecare caz, atestările sigilate de lot ar fi
furnizat o cronologie forensică mai curată.

## Cum să faci fork acestui kit pentru un lot real

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # înlocuiește conținutul fictiv cu lot real
bash build/seal.sh        # SIGILEAZĂ ÎNAINTE de începerea distribuției
python3 build/verify.py   # confirmă
```

**SINCRONIZARE CRITICĂ**: sigilează în momentul eliberării QA,
ÎNAINTE ca lotul să fie distribuit. Un sigiliu după distribuție
este forensic mai slab.

## Integrarea cu infrastructura farmaceutică existentă

- **Depuneri eCTD (FDA / EMA):** URL-ul publicării sigilate sau
  CID-ul IPFS poate fi referențiat în secțiunea Modul 3 (calitate)
- **Precalificare WHO:** manifestul sigilat demonstrează lanțul de
  testare pre-eliberare jurisdicțiilor non-FDA/EMA
- **Feedback de farmacovigilență:** FACT 05 obligă producătorul la
  raportarea sigilată a numerelor agregate de AE la 6 și 12 luni
- **Sisteme de recall (RxConnect, MedWatch):** dacă este necesar
  un recall, sfera de recall în sine este sigilată sub MYRIAM,
  oferind verificare publică că toate loturile distribuite sunt
  adresate

## Ce NU înlocuiește acest kit

- Depunerile de reglementare FDA / EMA / WHO
- Traseele de audit GMP (sigiliul ancorează REZULTATELE, nu
  înregistrările procesului brut)
- Bazele de date de farmacovigilență (VAERS / EudraVigilance)
- Sistemele de coordonare a recall-urilor

## Licență

Domeniu public (CC0). Forkează-l. Nu este necesară atribuirea.
