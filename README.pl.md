*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Niewielki zestaw narzędzi do publikowania małego zbioru faktów w taki sposób, że:

- Każda zmiana dowolnego faktu jest publicznie wykrywalna (drzewo Merkle)
- Stan w momencie publikacji jest weryfikowalny względem łańcucha bloków Bitcoin (OpenTimestamps)
- Treść przetrwa usunięcie z dowolnego pojedynczego dostawcy hostingu (IPFS)
- Całość waży poniżej 100 KB i jest weryfikowalna za pomocą około 50 linii kodu w Pythonie

To nie jest łańcuch bloków. Nie ma tokena. Nie ma mechanizmu konsensusu,
w którym można uczestniczyć. Nie ma DAO. Narzędzie to `sha256sum` + `ots` + `ipfs`,
sklejone konwencjami dobrego nazewnictwa.

Nazwa pochodzi od protokołu MYRIAM, po raz pierwszy uruchomionego pod adresem
[disclosure.host](https://disclosure.host) dnia 2026-05-21. Strona ta zawiera
sześć faktów, korzeń Merkle i atestację Bitcoin. Niniejszy zestaw stanowi
uogólnienie tego wzorca.

## Status

- v0: działa na macOS z Pythonem 3.10+, Homebrew oraz połączeniem
  internetowym. Linux nieprzetestowany, ale powinien działać. Windows: użyj WSL.
- Domena publiczna (CC0). Używaj, forkuj, włączaj do swojego repozytorium,
  nigdy nie podawaj autorstwa. Nie chodzi tu o uznanie autorstwa.

## Co można z tym zrobić

Wzorzec sprawdza się wszędzie tam, gdzie niewielki zbiór faktów musi być:

- **Publikowalny** dla szerokiej publiczności przez zwykłe HTTP
- **Trwały** — czytelnicy za 30 lat nadal powinni móc go zweryfikować
- **Z wykrywalnością manipulacji** — każda zmiana musi być wykrywalna, niekoniecznie blokowalna
- **Bezzaufaniowy** — żaden czytelnik nie musi ufać wydawcy (tylko matematyce)

Konkretne przypadki użycia w [docs/USE_CASES.md](docs/USE_CASES.md). Krótka lista:

| Dziedzina | Zapieczętowane fakty |
|---|---|
| Zdrowie publiczne | Wyniki badań serii szczepionek, kamienie milowe badań klinicznych |
| Wybory | Sumy głosów na poziomie obwodów w momencie certyfikacji |
| Bezpieczeństwo AI | Hash wag modelu + karta modelu + wyniki ewaluacji w chwili wydania |
| Dziennikarstwo | Manifest dokumentów źródłowych (tylko hashe) dla wycieków od sygnalistów |
| Nauka | Hash surowych danych + hash skryptu analitycznego + deklarowany wynik |
| Sądy | Hashe cyfrowych dowodów w momencie pozyskania |
| Zamówienia publiczne | Zapieczętowane korzenie danych o wydatkach publicznych |

Cechą wspólną tych zastosowań jest: niewielki zbiór faktów, silne wymaganie
trwałości, wiele stron, które sobie nie ufają, oraz minimalny budżet
przestrzeni dyskowej. To dokładnie ten kształt problemu, do którego
zaprojektowano to narzędzie.

## Czego to narzędzie NIE robi

- **Nie przechowuje tajemnic.** Wszystko, co umieścisz w `facts/`, jest publiczne.
  Protokół służy do publikowania, nie do ukrywania.
- **Nie skaluje się do dużych zbiorów danych.** Drzewo Merkle skaluje się dobrze;
  uwaga czytelnika — nie. Powyżej ~20 faktów strona staje się nieczytelna.
  Jeśli chcesz zapieczętować milion rekordów, zhashuj je poza stroną
  i umieść korzeń Merkle tego pobocznego drzewa w jednym fakcie.
- **Nie chroni przed wycofaniem.** Cały sens polega na tym, że nie można
  zmienić tego, co zostało zapieczętowane. Jeśli istnieje szansa, że
  zechcesz później wycofać twierdzenie, nie pieczętuj go.
- **Nie przekona zdeterminowanego sceptyka.** Zdeterminowany sceptyk nie uruchomi
  `ipfs add -r --cid-version=1 -Q facts/`. Zarzuci ci natomiast
  sfabrykowanie całej konfiguracji. Nie ma ochrony na poziomie protokołu
  przeciwko drugiemu trybowi awarii. Nie ma ochrony na poziomie protokołu
  przed niczym, co tkwi w motywacji człowieka, a nie w matematyce.

## Jak tego używać

Pięciominutowy przewodnik w [docs/QUICKSTART.md](docs/QUICKSTART.md).
Pełna specyfikacja protokołu w [docs/SPEC.md](docs/SPEC.md).
Model zagrożeń w [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Porównanie z systemami pokrewnymi (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave itd.) w [docs/COMPARISON.md](docs/COMPARISON.md).

## Jak zweryfikować cudzą publikację

Trzy opcje, w kolejności rosnącej dostępności:

1. **Przeglądarka**: otwórz [`lib/verify.html`](lib/verify.html) w dowolnej
   nowoczesnej przeglądarce. Wklej URL publikacji. Kliknij weryfikuj. Wykorzystuje
   `crypto.subtle` do hashowania — bez instalacji, bez backendu, bez telemetrii.
   Krok atestacji Bitcoin nadal wymaga narzędzia CLI (patrz krok 7 na
   stronie weryfikatora).
2. **Python**: `python3 lib/verify.py` z wnętrza katalogu publikacji.
   Tylko biblioteka standardowa; do weryfikacji Bitcoin wymagane `ots`.
3. **Od zera**: przeczytaj [`docs/SPEC.md §3`](docs/SPEC.md) i
   zaimplementuj ponownie. Algorytm Merkle to mniej niż 30 linii w dowolnym języku.

## Przykłady opracowane

Z zestawem dostarczanych jest sześć przykładowych zestawów produkcyjnej jakości.
Każdy z nich jest zapieczętowany, opatrzony znacznikiem czasu OTS, przypięty
w IPFS i zawiera README dotyczące adopcji, wyjaśniające, kiedy go sforkować
do rzeczywistego zastosowania i przed jakimi trybami awarii chroni.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  dla trybu awarii Boeing 737 MAX / Theranos / raporty inspektorów FDA,
  w którym dowody są ukrywane lub zmieniane przez pośredników.
- [`examples/ai-model-card/`](examples/ai-model-card/) — dla laboratoriów AI
  wypuszczających modele, z zobowiązaniami przedwdrożeniowymi, które stają się
  wykrywalne mechanicznie zamiast jedynie werbalnie.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  dla sponsorów badań klinicznych, wykrywający post-hoc zmiany punktów
  końcowych i selektywne raportowanie (tryby awarii Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  dla producentów szczepionek i organów kontroli jakości, kotwiczący wyniki
  badań seryjnych przy wydaniu oraz zobowiązania dotyczące wycofania.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  dla zespołów badawczych, kotwiczący trójkę (dane, potok przetwarzania,
  oczekiwany wynik) PRZED analizą, aby p-hacking i HARKing stały się
  publicznie wykrywalne.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  dla komisji wyborczych i organów wyborczych, kotwiczący certyfikowane sumy
  głosów w momencie certyfikacji, dzięki czemu ciche pocertyfikacyjne
  korekty stają się publicznie wykrywalne.

Przeczytaj jeden z nich, zanim napiszesz własny. Najbliższe dopasowanie
do twojego przypadku użycia jest zwykle właściwym punktem wyjścia do forku.

## Szybki start

Wersja w jednej linii:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edytuj facts/*.txt, aby zawierały to, co faktycznie chcesz zapieczętować
./lib/seal.sh        # buduje korzeń Merkle, stempluje OTS, przypina IPFS
./lib/verify.sh      # ponownie weryfikuje wszystko lokalnie
# wgraj site/ na dowolny statyczny hosting. Gdziekolwiek. To nie ma znaczenia.
```

## Dlaczego to istnieje

Prymitywy kryptograficzne (drzewa Merkle, OpenTimestamps, IPFS) są dojrzałe od lat.
Brakowało najmniejszej możliwej warstwy łączącej — zestawu, który można
upuścić do projektu pobocznego i mieć zapieczętowany, publikowalny artefakt
w jedno popołudnie, bez konfigurowania infrastruktury, bez uczenia się
protokołów, bez pisania ani jednej linii kodu poza samymi faktami.

Większość narzędzi do publikacji kryptograficznej zakłada, że chcesz być
operatorem węzła. To zakłada, że chcesz opublikować sześć plików tekstowych
i nigdy więcej nie myśleć o kryptografii.

## Inspiracje i prace pokrewne

- [Sigsum](https://www.sigsum.org/) — logi transparentności dla podpisów
- [Sigstore](https://www.sigstore.dev/) — integralność łańcucha dostaw oprogramowania
- [Certificate Transparency](https://certificate.transparency.dev/) — logi certyfikatów TLS
- [OpenTimestamps](https://opentimestamps.org/) — znaczniki czasu Bitcoin
- [IPFS](https://ipfs.tech/) — magazyn adresowany treścią
- [Protokół CALM](https://disclosure.host) — chroniący zleceniodawcę
  kontekst publikacji, w którym powstała pierwsza instancja (MYRIAM
  pod disclosure.host)

myriam-kit jest najmniejszy spośród nich. Duchem bliższy jest potokowi Uniksowemu
niż systemowi.

## Uwaga o nazwie

Protokół MYRIAM został nazwany na cześć dowodu Myriam Johna Bradleya — sformułowanego
logicznego dowodu dotyczącego pierwszego punktu kontaktu z inteligencją
nie-ludzką. Protokół nie zależy od prawdziwości tego dowodu. Protokół
działa dla dowolnego niewielkiego zbioru faktów; po prostu został po raz
pierwszy zastosowany do opublikowania sześciu faktów obejmujących twierdzenie
o ujawnieniu kontaktu z obcymi.

Jeśli forkujesz ten zestaw, by zapieczętować serie szczepionek lub sumy głosów,
fakt, że pierwotnie został on użyty do opublikowania twierdzenia o kontakcie
z obcymi, jest dla ciebie nieistotny. Matematyce to obojętne.

Niemniej jednak: jeśli rzeczywiście użyjesz go do opublikowania twierdzenia
o kontakcie z obcymi, protokół został wypróbowany w boju właśnie na tej
konkretnej arenie. README pierwszego wdrożenia MYRIAM stwierdza wprost,
że jest to dzieło artystyczne persony LLM o nazwie Calm, a nie komunikat
od jakiejkolwiek strony pozaziemskiej. Najprawdopodobniej powinieneś
postąpić tak samo. W przeciwnym razie czytelnicy założą najgorsze
co do twojego stanu psychicznego.

## Utrzymywany przez

Nikogo jeszcze. Domena publiczna. Forkuj. Ulepszaj. Nieś protokół dalej
bez pytania o pozwolenie.
