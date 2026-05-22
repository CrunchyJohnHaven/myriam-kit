*Traducere în limba română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# Kit de sigilare a manifestului avertizorilor de integritate

Un exemplu turnkey de myriam-kit pentru avertizorii de integritate care
se confruntă cu modul de eșec specific în care **dovezile sunt
îngropate, editate sau contestate de intermediari între avertizor și
public**. Cazurile istorice canonice împotriva cărora apără:

- Boeing 737 MAX (rapoartele interne de siguranță au fost
  desconsiderate/îngropate)
- Theranos (preocupările privind testele de laborator au fost
  suprimate ani de zile)
- Rapoartele inspectorilor FDA editate după depunere
- Frances Haugen / Facebook (un manifest sigilat ar fi dovedit că
  documentele erau autentice și existau la momentul invocat)

Împotriva a ce apără acest kit (în termeni de protocol):

- T1–T3 din [FACT 05](facts/05_threat_model.txt): contestarea publică
  a conținutului documentelor, afirmațiile că documentele nu erau
  sigilate la momentul invocat, afirmațiile de fabricare retroactivă.
- T9: terți care înmânează jurnaliștilor copii alterate.

Împotriva a ce **nu** apără acest kit:

- Represalii personale împotriva avertizorului (T7).
- Presiunea asupra avertizorului pentru a-și retracta (T4, parțial
  atenuată de FACT 07 care face retractarea tăcută detectabilă public).
- Acțiuni legale împotriva avertizorului pentru însăși dezvăluirea
  (T5).
- Discreditarea caracterului avertizorului (T8).
- Intermediarii care abandonează tăcut povestea (T10).

Dacă ești un avertizor de integritate care ia în considerare
utilizarea acestui kit, **citește mai întâi acest README în
întregime**. Protocolul este un instrument. Protocolul nu este un
substitut pentru consilier juridic, un jurnalist, un reglementator
sau o securitate operațională atentă.

## Ce produce acest kit

Un *manifest* sigilat criptografic al dovezilor (nu dovezile însele)
care demonstrează:

1. Octeții specifici ai fiecărui fișier de dovezi existau la momentul
   sigilării.
2. Sigilarea s-a întâmplat la sau înainte de un moment specific (prin
   atestare Bitcoin OTS).
3. Proveniența, acuzația, modelul de amenințare, protocolul
   destinatarului și angajamentul de a nu retracta tăcut au fost
   toate declarate împreună.

Documentele subiacente rămân în posesia ta până când le trimiți unui
destinatar. Destinatarii verifică că au primit aceiași octeți pe care
i-ai sigilat.

## Când să folosești acest kit

Ar trebui să iei în considerare sigilarea unui manifest **înainte** de
a transmite dovezi unui jurnalist, reglementator sau avocat, dacă
toate următoarele sunt adevărate:

- Ai dovezi în formă digitală (PDF-uri, e-mailuri, imagini etc.) pe
  care vrei să le păstrezi ca autentice la nivel de octet.
- Te aștepți ca intermediarii să poată altera, contesta sau îngropa
  dovezile.
- Poți păstra documentele subiacente în posesia ta până la transmitere.
- Poți publica manifestul public **fără** să dezvălui conținutul
  documentelor (doar hash-urile sunt publice).
- Ai cântărit riscurile de a deveni identificabil public ca avertizor
  (câmpul principal de semnare). Dacă ești anonim, folosește un
  pseudonim consistent în toate publicațiile asociate.
- Ai consultat un avocat despre legea de protecție a avertizorilor
  din jurisdicția ta.

## Când să NU folosești acest kit

NU folosi acest kit dacă:

- Documentele însele conțin informații personale despre terți
  (pacienți, clienți, angajați) care nu ar trebui să fie făcute
  hashabile public. Hash-ează o versiune redactată, nu originalul.
- Actul de publicare al manifestului în sine ar identifica
  avertizorul într-un mod la care nu și-a dat consimțământul.
- Nu ai consultat încă un avocat. Protocolul este un instrument;
  legea de protecție a avertizorilor este specifică jurisdicției și
  trăiește în afara protocolului.
- S-ar putea să vrei mai târziu să retractezi orice acuzație
  individuală. Sigiliul este permanent; noi corecții sigilate sunt
  singurul mod onest de a revizui.
- Faci aceasta sub coerciție sau presiune temporală. Protocolul
  amplifică coerciția; poarta de refuz (myriam-kit `SPEC §8`) se
  aplică atât avertizorilor cât și editorilor.

## Cum să faci fork acestui kit pentru o dezvăluire reală

```bash
# 1. Copiază acest exemplu într-un nou director
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Elimină conținutul fictiv; înlocuiește-l cu faptele tale reale.
# Fiecare fișier din facts/ este un fapt. Citește-l și înlocuiește-l.
$EDITOR facts/01_example_notice.txt   # schimbă într-o declarație de copertă reală
$EDITOR facts/02_provenance.txt       # proveniența reală a dovezilor tale
$EDITOR facts/03_evidence_manifest.txt # hash-ează documentele tale reale și listează-le
$EDITOR facts/04_allegation_summary.txt # acuzația ta reală
$EDITOR facts/05_threat_model.txt     # răspunsurile tale reale așteptate
$EDITOR facts/06_recipient_protocol.txt # ajustează pentru destinatarul tău
$EDITOR facts/07_no_retraction_commitment.txt # declarația ta de neretractare
$EDITOR facts/08_signing_principal.txt # identitatea ta reală de semnare (sau pseudonim)

# 3. Actualizează site/index.html pentru a reflecta faptele reale.
# Scriptul seal.sh NU populează automat HTML-ul; editarea manuală
# este pasul de revizuire umană.
$EDITOR site/index.html

# 4. Sigilează.
bash build/seal.sh
# Iesiri: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Verifică local.
python3 build/verify.py

# 6. Publică manifestul (NU documentele) la oricare dintre:
#    - Un host static pe care îl controlezi (Cloudflare Pages, GitHub Pages etc.)
#    - Rețeaua IPFS la CID-ul tipărit
#    - Ambele (recomandat)

# 7. Separat, transmite documentele subiacente destinatarului
#    printr-un canal securizat ales de tine (Signal, SecureDrop etc.).
#    Destinatarul verifică hash-urile fișierelor împotriva manifestului tău.
```

## Calcularea hash-urilor pentru fișierele de dovezi reale

Pentru a hash-a un fișier de document cu SHA-256:

```bash
shasum -a 256 my_document.pdf
```

Primele 64 de caractere hex sunt SHA-256. Pune-le în manifest.

Poți hash-a multe fișiere deodată:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Asta îți dă datele pentru `facts/03_evidence_manifest.txt`.

## Note de securitate operațională

Protocolul MYRIAM NU oferă securitate operațională. Oferă
*durabilitate probatorie*. Ai în continuare nevoie de:

- Un canal de comunicare sigur cu avocatul tău
  ([Signal](https://signal.org/), în persoană, sau canalul sigur
  stabilit al avocatului tău)
- O locație de stocare sigură pentru documentele subiacente (criptate
  în repaus, nu pe servicii cloud la care angajatorul tău poate
  accesa)
- Un dispozitiv curat pentru sigilare (un laptop personal neasociat
  cu conturi de angajator; de preferință unul folosit doar în acest
  scop)
- O rețea curată pentru publicare (nu rețeaua angajatorului tău, nu
  IP-ul tău de acasă dacă angajatorul tău ar putea cita ISP-ul tău)

Lectură recomandată despre securitatea operațională pentru avertizori:

- [Documentația SecureDrop a The Intercept](https://securedrop.org/)
- [Resursele Freedom of the Press Foundation](https://freedom.press/)
- [Ghidul de autoapărare împotriva supravegherii al EFF](https://ssd.eff.org/)

Consultă-le ÎNAINTE de a începe procesul de sigilare. Protocolul nu
protejează împotriva alegerilor proaste de opsec făcute înainte ca
protocolul să fie invocat.

## Ce ar trebui să știe destinatarii

Trimite destinatarilor acest README împreună cu manifestul sigilat.
Manifestul însuși conține protocolul destinatarului (FACT 06), dar
README-ul extinde rolul destinatarului:

- **Jurnaliști**: verificați mai întâi integritatea manifestului în
  sine. Apoi solicitați documentele printr-un canal sigur separat.
  Verificați că SHA-256 al fiecărui document se potrivește cu
  manifestul înainte de publicare. NU publicați documentele fără
  consimțământul avertizorului; publicați existența manifestului
  sigilat și concluzia voastră de verificare.
- **Reglementatori**: același proces de verificare. Manifestul
  sigilat plus documentele care se potrivesc reprezintă cea mai
  puternică formă de probă disponibilă în afara colectării formale
  a lanțului de custodie.
- **Avocați**: manifestul sigilat oferă ancorare forensică pentru
  existența documentelor la momentul invocat. Dacă satisface
  regulile de probe ale unei jurisdicții specifice este pentru voi
  să determinați.

## Ce NU este acest kit

- Nu este un substitut pentru consilier juridic.
- Nu este o garanție că cineva va acționa pe baza dezvăluirii tale.
- Nu este o protecție împotriva represaliilor.
- Nu este o autentificare a conținutului documentelor (doar a
  octeților-la-momentul-sigilării).
- Nu este o modalitate de a comunica anonim cu cineva — sigiliul
  este public; dacă numele tău de semnare este real, ești identificat.

## Concluzie

Un manifest sigilat este un lucru mic. Este un singur flux de octeți
care dovedește că un set mai mare de fluxuri de octeți a existat
într-o formă particulară la un moment particular. Acea micime este
puterea sa: face un singur lucru, și face acel lucru pe durata de
viață a blockchain-ului Bitcoin.

Dacă citești asta pentru că iei în considerare să devii un
avertizor, te rog: vorbește mai întâi cu un avocat. Folosește
ghidurile de securitate operațională de mai sus. Apoi, dacă și
numai dacă toate acele considerații în amonte sunt în ordine,
consideră acest kit ca spinarea criptografică a dezvăluirii tale.
Cripto este partea ușoară. Tot ce este în amonte de cripto este
locul unde trăiește riscul real.

## Licență

Domeniu public (CC0). Forkează-l. Îmbunătățește-l. Folosește-l fără
a cere permisiunea.
