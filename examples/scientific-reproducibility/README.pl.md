*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw Powtarzalności Naukowej

Gotowy do użycia przykład myriam-kit dla grup badawczych, czasopism oraz
instytucji skoncentrowanych na powtarzalności, które chcą publikować
manifest powtarzalności zakotwiczony w Bitcoinie i odporny na manipulacje,
wraz z artykułem lub preprintem.

## Co produkuje ten zestaw

Zapieczętowana publikacja zawierająca, dla jednego badania:

1. Identyfikację badania (tytuł pracy, autorzy, instytucja, fundatorzy, COI)
2. **SHA-256 archiwum surowych danych** — kanoniczny zbiór danych
3. **Hash potoku analitycznego** — skrypt + skrót obrazu Docker +
   przypięte zależności
4. **Hash pakietu oczekiwanych wyników** — co powinien wyprodukować
   wierny reproducer
5. Protokół reprodukcji + zobowiązania publikacyjne po uzyskaniu wyników
6. Sygnatariusz(e) zasadniczy

Pieczęć jest przeznaczona dla etapu **przed analizą**: dane zamrożone,
potok sfinalizowany, oczekiwany wynik obliczony, WSZYSTKO przed
zobaczeniem jakichkolwiek wyników w celu napisania artykułu.

## Przed czym broni ten zestaw

**Tryby awarii, które pieczęć wykrywa:**

- **p-hacking**: post-hoc zmiany w analizie po zobaczeniu wyników są
  wykrywalne poprzez diff między zapieczętowanym FACT 04 a opublikowanym
  potokiem.
- **HARKing** (Hypothesizing After Results are Known): hipoteza
  zarejestrowana wstępnie w FACT 02 jest stabilna bajtowo.
- **Manipulacja danymi po publikacji**: ponowne hashowanie archiwum
  danych względem FACT 03 ujawnia wszelkie modyfikacje.
- **Dryf potoku**: ponowne hashowanie potoku analitycznego względem
  FACT 04 wychwytuje ciche zmiany.
- **Manipulowanie autorstwem**: ciche dodawanie lub usuwanie autorów po
  publikacji staje się wykrywalne względem zapieczętowanego FACT 02.

**Tryby awarii NIE objęte:**

- Oszustwo przy zbieraniu surowych danych (pieczęć kotwiczy dane w
  momencie pieczętowania, nie zbierania)
- Biologiczna / empiryczna niepowtarzalność (pieczęć kotwiczy tylko
  powtarzalność obliczeniową)
- Problemy z rozmiarem próby lub trafnością populacyjną (są to pytania
  dotyczące projektu badania)
- Prawdziwość podstawowego twierdzenia (pieczęć kotwiczy to, co zostało
  stwierdzone, a nie to, czy świat odpowiada twierdzeniu)

## Kiedy używać tego zestawu

Rozważ zapieczętowanie, jeśli:

- Jesteś grupą badawczą prowadzącą analizę o wysokiej stawce (badanie
  kliniczne, ocena systemu AI, badanie replikacyjne) i chcesz uzyskać
  integralność forensyczną wykraczającą poza znaczniki czasu OSF / GitHub
- Jesteś badaczem na wczesnym etapie kariery, który chce asymetrycznej
  ochrony reputacji: zapieczętowana analiza wstępna oznacza, że
  przyszła krytyka typu "uprawiali p-hacking" ma publiczny falsyfikator
- Jesteś redaktorem czasopisma lub kierownikiem projektu replikacyjnego,
  który chce zachęcić do kryptograficznej rejestracji wstępnej dla
  podzbioru artykułów
- Pracujesz nad analizą, w której post-hoc dostrojenia mają znaczące
  konsekwencje dziedzinowe (psychologia, ekonomia behawioralna,
  badania medyczne)

## Historyczny precedens śmiertelności / szkody

Znaczenie tego zestawu dla śmiertelności jest pośrednie:

- **Niepowtarzalność badań nad komórkami macierzystymi / nowotworami:**
  kilka artykułów doprowadziło do szkody pacjentów poprzez błędnie
  ukierunkowane badania kliniczne. Zapieczętowana wstępna rejestracja
  oryginalnego potoku zakotwiczyłaby porównanie.
- **Kontrowersje wokół skuteczności Tamiflu:** przegląd Cochrane trwał
  lata częściowo dlatego, że dostęp do surowych danych był
  kwestionowany. Zapieczętowane hashe danych w momencie publikacji
  uczyniłyby spory o dostęp do danych natychmiast rozwiązywalnymi.
- **Ogólny kryzys niepowtarzalności:** koszt śmiertelności na poziomie
  dziedziny niepowtarzalnych badań biomedycznych jest znaczący
  (Begley & Ellis 2012 oszacowali, że >50% odkryć przedklinicznych jest
  niepowtarzalnych). Kotwiczenie kryptograficzne jest jedną z dźwigni
  strukturalnych.

## Jak zforkować ten zestaw

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## Integracja z istniejącą infrastrukturą naukową

- **arXiv / bioRxiv / medRxiv**: umieść URL pieczęci MYRIAM lub IPFS CID
  w streszczeniu lub materiałach uzupełniających
- **OSF**: dołącz artefakt pieczęci do projektu OSF obok konwencjonalnego
  formularza rejestracji wstępnej
- **AsPredicted**: umieść URL pieczęci MYRIAM w dokumencie rejestracji
  wstępnej
- **GitHub**: hash commita potoku analitycznego jest tym, co kotwiczy
  FACT 04; GitHub dostarcza źródła, MYRIAM kotwiczy bajty
- **Zenodo / Figshare / OpenAIRE**: zdeponuj surowe dane, a następnie
  zapieczętuj hash depozytu; pieczęć jest forensycznie trudniejsza do
  cichego zastąpienia niż metadane depozytu
- **Materiały uzupełniające czasopisma**: dołącz artefakt pieczęci
  MYRIAM jako plik uzupełniający przy składaniu

## Czego ten zestaw NIE zastępuje

- Zgody IRB / komisji etycznej
- Recenzji koleżeńskiej
- Badań replikacyjnych (powtarzalność obliczeniowa ≠ powtarzalność
  empiryczna)
- Umów o dostęp do danych dla danych wrażliwych

## Uwaga o kolejności autorów i atrybucji

Pieczęć kotwiczy AUTHOR LIST w momencie pieczętowania. Spory dotyczące
autorstwa, które pojawią się po publikacji, mogą być oceniane względem
zapieczętowanej listy. Jest to mała dźwignia odpowiedzialności — ważna
dla ECR, którzy są dodawani lub usuwani po cichu.

## Licencja

Domena publiczna (CC0). Użyj go, zmodyfikuj go, zignoruj go, zforkuj go.
