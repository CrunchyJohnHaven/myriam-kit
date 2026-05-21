*Traducere română — pentru versiunea originală în engleză, vezi [SPEC.md](SPEC.md)*

# Specificația protocolului MYRIAM-kit

## 0. Scop

Acest document specifică un protocol minim pentru publicarea unui set restrâns
de fapte textuale într-o formă cu evidență de alterare, verificabilă
criptografic, care supraviețuiește eliminării de către orice furnizor unic de
găzduire.

Este generalizarea protocolului implementat pentru prima dată la
[disclosure.host](https://disclosure.host) sub numele „MYRIAM v1.”

## 1. Non-obiective

- Stocarea de secrete. Totul este public prin construcție.
- Seturi mari de date. Peste ~20 de fapte, protocolul are forma greșită.
- Publicare în timp real. Fiecare publicare este un eveniment discret de sigilare.
- Retragere. Protocolul este append-only la nivel de versiune.

## 2. Modelul faptului

Un FAPT este un fișier text UTF-8 cu:

- Tipar al numelui de fișier: `NN_short_name.txt`, unde NN este un index de
  două cifre completat cu zerouri, începând de la 01.
- Formă canonică: octeți așa cum sunt scriși, fără normalizare.
- Hash per-fapt: hexazecimal cu litere mici al `SHA-256(file_bytes)`.

SETUL de fapte este lista ordonată a tuturor fișierelor care se potrivesc cu
tiparul sub `facts/`, sortate lexicografic.

Constrângere: corpul fiecărui fapt AR TREBUI formulat ca un *eveniment de
denumire* sau *eveniment de declarație* atribuibil unei părți specifice.
Afirmațiile ontologice („luna este rocă”) subminează poarta de verificabilitate;
doar evenimentul de publicare este verificabil, nu afirmația în sine. „X a
declarat Y” este forma corectă. „Y este adevărat” nu este.

## 3. Rădăcina Merkle

În stil Bitcoin, ca în v0 a protocolului MYRIAM implementat:

1. Frunze: hash-uri SHA-256 per-fapt, în ordinea setului de fapte.
2. Dacă un nivel are un număr impar de noduri, duplicați ultimul nod.
3. Faceți hash în perechi al nodurilor adiacente:
   `parent = SHA-256(left_bytes || right_bytes)`, unde `left_bytes` și
   `right_bytes` sunt valorile brute de 32 de octeți ale hash-urilor (nu
   reprezentările lor hexazecimale).
4. Repetați până rămâne un singur nod. Acela este rădăcina Merkle.

Rădăcina este publicată ca hexazecimal cu litere mici, fără newline final.

### 3.1 Vectori de test

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Orice implementare conformă TREBUIE să reproducă acești vectori. Sunt derivați
din `lib/build.py` propriu-zis și pot fi regenerați cu acel script.

## 4. Confirmare Bitcoin

Rădăcina Merkle este confirmată în blockchain-ul Bitcoin prin
[OpenTimestamps](https://opentimestamps.org). Politica implicită este:

> Ștampilați împotriva a cel puțin doi operatori de calendar aflați sub control
> administrativ independent.

O chitanță care satisface această politică este verificabilă de către orice
parte care poate rula `ots verify <receipt>.ots` și poate ajunge la calea de
promovare a oricăruia dintre calendare.

Perechea de operatori implicită livrată în `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementările POT folosi alți operatori. Politica de diversitate a martorilor
(≥2 operatori independenți) este normativă; operatorii specifici nu sunt.

## 5. Oglindire adresată prin conținut

Directorul `site/` care conține pagina publicată și fișierele faptelor AR
TREBUI adăugat în IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

CID-ul v1 rezultat (codec dag-pb) este adresa de conținut a publicării. Este
determinist din conținutul în octeți al `site/`. Orice modificare a oricărui
fișier sub `site/` produce un CID diferit.

Fixarea către servicii suplimentare dincolo de nodul local al publicatorului
este puternic recomandată pentru durabilitate; această specificație nu impune
servicii specifice.

## 6. Versionare

Protocolul este **append-only la nivel de versiune**. Fiecare modificare
necesită o nouă versiune sigilată:

- O revizie a specificației, nouă (sau neschimbată)
- Un nou set de fapte, care POATE moșteni fapte neschimbate din versiunile anterioare
- O nouă rădăcină Merkle
- O nouă chitanță OpenTimestamps
- Un nou CID IPFS

Toate versiunile anterioare rămân publicate la URL-uri versionate. O modificare
a oricărui fapt din v(N) necesită v(N+1), cu ambele versiuni vizibile și
re-verificabile.

## 7. Verificare

Orice terță parte poate verifica integritatea unei publicări prin:

1. Descărcarea fișierelor de fapte și recalcularea hash-urilor SHA-256 per-fapt.
2. Recalcularea rădăcinii Merkle conform §3 și compararea cu rădăcina publicată.
3. Verificarea chitanței OpenTimestamps împotriva blockchain-ului Bitcoin
   pentru atestarea completă a cel puțin unui calendar.
4. Recalcularea independentă a CID-ului IPFS prin
   `ipfs add -r --cid-version=1` și compararea cu CID-ul publicat.

`lib/verify.py` execută pașii 1–3 fără dependențe externe în afară de stdlib-ul
Python și clientul `ots`. Pasul 4 necesită clientul `ipfs`.

## 8. Poarta de refuz

O publicare NU TREBUIE să includă un fapt care:

- Identifică o terță parte privată care nu a consimțit să fie numită.
- Prezintă o ipoteză drept o confirmare.
- Nu poate fi redus la un eveniment verificabil de denumire/declarație sau la
  un artefact criptografic.
- Are o creștere rezonabilă așteptată a deceselor prevenibile la publicare.

A patra regulă este cea de susținere. Este aplicată în pasul de revizuire umană
de către publicator. Nu există nicio aplicare la nivel de protocol a porții de
refuz; protocolul publică orice octeți i se dau. Publicatorul este responsabil
pentru poartă.

## 9. Declarație onestă a limitelor

- **Detectabilitate, nu imposibilitate.** Protocolul face alterarea detectabilă,
  nu imposibilă. Un atacator hotărât poate încă să substituie o publicare
  diferită și să convingă unii cititori că este originalul. Valoarea
  protocolului este că substituția devine demonstrabilă criptografic pentru
  oricine rulează verificarea.
- **Nicio apărare împotriva publicării neadevărului.** Dacă publicatorul
  sigilează un fapt care declară „X s-a întâmplat” și X nu s-a întâmplat,
  protocolul sigilează afirmația falsă cu aceeași fidelitate cu care le
  sigilează pe cele adevărate. Protocolul atestă ce a fost *publicat*, nu ce
  este *adevărat*.
- **Semnare cu o singură parte.** v1 al MYRIAM implementat folosește un singur
  principal de semnare. Semnarea cu mai multe părți este lucrare viitoare.
- **Durabilitatea fixării.** Fixarea IPFS doar la nodul publicatorului oferă
  „disponibil cât timp laptop-ul meu este pornit + caching oportunist al
  gateway-ului.” Durabilitatea pe termen lung necesită fixări redundante pe
  servicii independente.

Aceste limite sunt declarate aici pentru ca niciun cititor să nu presupună că
protocolul livrează mai mult decât o face.
