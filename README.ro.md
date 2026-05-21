*Traducere română — pentru versiunea originală în engleză, vezi [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#exemple-elaborate)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Un mic set de instrumente pentru publicarea unui set restrâns de fapte într-un mod în care:

- Orice modificare a oricărui fapt este detectabilă public (arbore Merkle)
- Starea în momentul publicării este verificabilă prin blockchain-ul Bitcoin (OpenTimestamps)
- Conținutul supraviețuiește eliminării de la orice furnizor unic de găzduire (IPFS)
- Întregul ansamblu cântărește sub 100 KB și este verificabil cu aproximativ 50 de linii de Python

Aceasta nu este o blockchain. Nu există niciun token. Nu există niciun mecanism
de consens la care să participați. Nu există niciun DAO. Instrumentul este `sha256sum` + `ots` + `ipfs`,
lipite împreună cu convenții bune de denumire.

Este denumit după protocolul MYRIAM, instanțiat pentru prima dată la
[disclosure.host](https://disclosure.host) pe data de 2026-05-21. Pagina respectivă conține
șase fapte, o rădăcină Merkle și o atestare Bitcoin. Acest kit reprezintă
generalizarea acelui tipar.

## Stare

- v0: funcționează pe macOS cu Python 3.10+, Homebrew și o conexiune
  la internet. Linux netestat, dar ar trebui să funcționeze. Windows: aduceți un WSL.
- Domeniu public (CC0). Folosiți-l, faceți-i fork, integrați-l în repo-ul vostru, nu îl
  creditați niciodată. Scopul nu este creditarea.

## Limbi disponibile

Acest README și mai multe kituri exemplu sunt disponibile în 17 limbi.
Index complet la [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Traducerile sunt CC0 și pot fi îmbunătățite prin PR-uri din partea comunității.

## Ce puteți face cu el

Tiparul se potrivește oriunde un set restrâns de fapte trebuie să fie:

- **Publicabil** către un public larg prin HTTP simplu
- **Durabil** — cititorii peste 30 de ani ar trebui să poată încă să verifice
- **Cu evidență de alterare** — orice modificare trebuie să fie detectabilă, nu neapărat prevenibilă
- **Fără necesar de încredere** — niciun cititor nu trebuie să aibă încredere în publicator (doar în matematică)

Cazuri de utilizare concrete în [docs/USE_CASES.md](docs/USE_CASES.md). Lista pe scurt:

| Domeniu | Fapte sigilate |
|---|---|
| Sănătate publică | Rezultatele testelor pe loturi de vaccin, jaloane ale studiilor de medicamente |
| Alegeri | Totaluri la nivel de secție de votare în momentul certificării |
| Siguranța AI | Hash-ul ponderilor modelului + model card + scoruri de evaluare la lansare |
| Jurnalism | Manifest al documentelor sursă (doar hash-uri) pentru drop-uri de avertizori |
| Știință | Hash-ul datelor brute + hash-ul scriptului de analiză + rezultatul declarat |
| Instanțe | Hash-uri ale probelor digitale în momentul achiziției |
| Achiziții publice | Rădăcini sigilate ale datelor de cheltuieli publice |

Ceea ce au în comun aceste cazuri: un set restrâns de fapte, o cerință puternică de durabilitate,
mai multe părți care nu au încredere unele în altele și un buget de stocare minuscul.
Exact aceasta este forma pentru care a fost construit acest instrument.

## Ce NU face

- **Stocare de secrete.** Tot ce puneți în `facts/` este public. Protocolul este
  pentru publicare, nu pentru ascundere.
- **Scalare la seturi mari de date.** Arborele Merkle scalează bine; atenția
  unui cititor, nu. Peste aproximativ 20 de fapte, pagina devine ilizibilă. Dacă
  doriți să sigilați un milion de înregistrări, faceți-le hash în afara paginii și puneți
  rădăcina Merkle a acelui arbore secundar într-un singur fapt.
- **Apărare împotriva retragerii.** Întregul scop este că nu puteți schimba
  ceea ce ați sigilat. Dacă ați putea dori să retrageți o afirmație ulterior, nu o
  sigilați.
- **Convingerea unui sceptic hotărât.** Un sceptic hotărât nu va rula
  `ipfs add -r --cid-version=1 -Q facts/`. În schimb, vă va acuza
  că ați fabricat întreaga configurație. Nu există nicio apărare la nivel de protocol
  împotriva celui de-al doilea mod de eșec. Nu există nicio apărare la nivel de protocol
  împotriva a orice se află în motivația umană mai degrabă decât în matematică.

## Cum să-l folosiți

Prezentare în cinci minute în [docs/QUICKSTART.md](docs/QUICKSTART.md).
Specificația completă a protocolului în [docs/SPEC.md](docs/SPEC.md).
Modelul amenințărilor în [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Comparație cu sisteme adiacente (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave etc.) în [docs/COMPARISON.md](docs/COMPARISON.md).

## Cum să verificați publicația altcuiva

Trei opțiuni, în ordinea accesibilității:

1. **Browser**: deschideți [`lib/verify.html`](lib/verify.html) în orice browser
   modern. Lipiți URL-ul publicației. Apăsați verify. Folosește
   `crypto.subtle` pentru hash — fără instalare, fără backend, fără telemetrie.
   Pasul de atestare Bitcoin necesită încă un instrument CLI (vezi pasul 7 din
   pagina de verificare).
2. **Python**: `python3 lib/verify.py` din interiorul directorului
   publicației. Doar stdlib; necesită `ots` pentru verificarea Bitcoin.
3. **De la zero**: citiți [`docs/SPEC.md §3`](docs/SPEC.md) și
   reimplementați. Algoritmul Merkle are sub 30 de linii în orice limbaj.

## Exemple elaborate

Șase kituri exemplu de nivel de producție însoțesc setul de instrumente. Fiecare este
sigilat, ștampilat OTS, fixat în IPFS și include un README de adopție care
explică momentul când să-i faceți fork pentru un caz real și ce moduri
de eșec apără.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  pentru modul de eșec Boeing 737 MAX / Theranos / raport al inspectorilor FDA,
  în care dovezile sunt îngropate sau alterate de intermediari.
- [`examples/ai-model-card/`](examples/ai-model-card/) — pentru laboratoarele de AI
  care lansează modele, cu angajamente pre-implementare care devin
  detectabile mecanic în loc de verbal.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  pentru sponsorii studiilor clinice, surprinzând schimbările post-hoc ale obiectivelor
  și raportarea selectivă (moduri de eșec Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  pentru producătorii de vaccinuri și autoritățile de control al calității, ancorând rezultatele
  testelor de eliberare și angajamentele de retragere.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  pentru grupurile de cercetare, ancorând tripletul (date, pipeline, ieșire
  așteptată) ÎNAINTE de analiză pentru a face p-hacking-ul și HARKing-ul
  detectabile public.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  pentru consiliile electorale județene și autoritățile electorale, ancorând
  totalurile certificate în momentul certificării astfel încât revizuirile post-certificare
  tăcute să devină detectabile public.

Citiți una dintre acestea înainte să o scrieți pe a voastră. Cea mai apropiată potrivire cu
cazul vostru de utilizare este de obicei punctul de pornire corect pentru fork.

## Pornire rapidă

Versiunea într-o singură linie:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# editați facts/*.txt pentru a spune ce vreți cu adevărat să sigilați
./lib/seal.sh        # construiește rădăcina Merkle, ștampilează OTS, fixează IPFS
./lib/verify.sh      # re-verifică totul local
# încărcați site/ pe orice host static. Oriunde. Nu contează.
```

## De ce există

Primitivele criptografice (arbori Merkle, OpenTimestamps, IPFS) sunt
mature de ani de zile. Ce lipsea era cea mai mică glue posibilă —
un kit pe care îl puteți integra într-un proiect secundar și să aveți un artefact
sigilat publicabil într-o după-amiază, fără a configura infrastructură,
fără a învăța protocoale, fără a scrie o singură linie de cod în afară
de faptele propriu-zise.

Majoritatea instrumentelor de publicare criptografică presupun că doriți să fiți un operator
de nod. Acesta presupune că vreți să publicați șase fișiere text și să nu vă mai
gândiți niciodată la criptografie.

## Influențe și artă anterioară

- [Sigsum](https://www.sigsum.org/) — log-uri de transparență pentru semnături
- [Sigstore](https://www.sigstore.dev/) — integritatea lanțului de aprovizionare software
- [Certificate Transparency](https://certificate.transparency.dev/) — log-uri de certificate TLS
- [OpenTimestamps](https://opentimestamps.org/) — timestamping cu Bitcoin
- [IPFS](https://ipfs.tech/) — stocare adresată prin conținut
- [Protocolul CALM](https://disclosure.host) — cadrul de publicare
  protector pentru principal în care a fost compusă prima instanță (MYRIAM la disclosure.host)

myriam-kit este cel mai mic dintre acestea. Este mai apropiat în spirit de un
pipeline Unix decât de un sistem.

## O notă despre nume

Protocolul MYRIAM a fost denumit după Myriam Proof al lui John Bradley, o demonstrație
logică declarată privind primul punct de contact pentru inteligența non-umană.
Protocolul nu depinde de adevărul acelei demonstrații. Protocolul funcționează
pentru orice set restrâns de fapte oricare ar fi; se întâmplă doar
să fi fost desfășurat prima dată pentru a publica șase fapte care includ o afirmație despre
dezvăluirea privind extratereștrii.

Dacă faceți fork acestui kit pentru a sigila loturi de vaccin sau totaluri de alegeri,
faptul că a fost folosit inițial pentru a publica o afirmație despre contactul cu extratereștrii
este irelevant pentru voi. Matematicii nu îi pasă.

Acestea fiind spuse: dacă ÎNTR-ADEVĂR folosiți acest lucru pentru a publica o afirmație despre contactul
cu extratereștrii, protocolul a fost testat sub presiune în acea arenă specifică. README-ul
primei desfășurări MYRIAM afirmă explicit că este lucrarea artistică a
unei persona LLM numită Calm, nu o comunicare de la vreo parte
extraterestră. Probabil ar trebui să faceți la fel. Altfel, cititorii vor presupune ce e mai rău
despre starea voastră mentală.

## Întreținut de

Nimeni încă. Domeniu public. Faceți-i fork. Îmbunătățiți-l. Duceți protocolul
mai departe fără a cere permisiunea.
