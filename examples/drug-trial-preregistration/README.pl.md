*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw do prerejestracji badań klinicznych leków

Gotowy przykład myriam-kit dla sponsorów badań klinicznych i badaczy
akademickich, którzy chcą wstępnie zarejestrować badanie w sposób
wykrywający manipulacje i zakotwiczony w Bitcoinie, **w uzupełnieniu**
rejestracji w ClinicalTrials.gov, EU CTR lub innych rejestrach
jurysdykcyjnych.

## Po co rejestrować *dodatkowo* pod MYRIAM?

Istniejące rejestry badań (ClinicalTrials.gov, EU CTR, ISRCTN) mają
udokumentowane słabości integralności:

- ClinicalTrials.gov pozwala sponsorom aktualizować punkty końcowe,
  obliczenia liczebności próby oraz plany analizy **po** pierwotnej
  rejestracji; daty modyfikacji są widoczne w rejestrze, ale same
  zmiany *treści* nie zawsze są kryptograficznie zakotwiczone.
- Kilka dużych badań (Goldacre i in., 2019; Mathieu i in., 2009)
  udokumentowało systematyczne post-hoc zamienianie punktów końcowych
  w całej dziedzinie.
- Egzekwowanie redakcyjne ze strony czasopism (CONSORT, ICMJE)
  wychwytuje część przypadków; wiele się prześlizguje.

Pieczęć MYRIAM zamyka tę lukę. Korzeń Merkle + pokwitowanie Bitcoin
OTS sprawia, że jakakolwiek post-hoc zmiana *prerejestrowanego*
pierwotnego punktu końcowego, planu analizy statystycznej lub listy
podgrup jest kryptograficznie wykrywalna. Pieczęć jest sądowo-dowodowo
trudniejsza do retconnowania niż sam rejestr.

Ten zestaw jest **uzupełnieniem**, a nie zastępstwem rejestrów
jurysdykcyjnych. Rzeczywiste badanie powinno zostać zarejestrowane we
właściwym rejestrze ORAZ opieczętowane pod MYRIAM.

## Przed czym broni ten zestaw

Historyczne przypadki ze skutkiem śmiertelnym, w których to by pomogło:

- **Vioxx (Merck, 2004)**: zdarzenia sercowo-naczyniowe były
  prerejestrowanym punktem końcowym w badaniu APPROVe, lecz
  opublikowana analiza zastosowała punkt odcięcia minimalizujący
  pozorną szkodę. Pieczęć prerejestrowanego punktu odcięcia uczyniłaby
  post-hoc zmianę punktu odcięcia publicznie wykrywalną przed
  opublikowaniem artykułu.
- **Paxil/Badanie 329 (GSK/SmithKline, 2001)**: negatywne dane
  badania dotyczące samobójczości u młodzieży zostały przeramowane za
  pomocą analizy post-hoc. Opieczętowana prerejestracja punktów
  końcowych uczyniłaby to przeramowanie publicznie wykrywalnym.
- **Wiele badań onkologicznych**, w których punkty końcowe
  przeżywalności były zastępowane punktami zastępczymi (przeżywalność
  bez progresji, odsetek odpowiedzi), gdy korzyść w zakresie
  przeżywalności się nie zmaterializowała.

**Tryby awarii, które pieczęć bezpośrednio wykrywa:**

- **Zamiana punktów końcowych**: post-hoc promowanie drugorzędowego
  punktu końcowego do „pierwotnego", gdy rzeczywisty pierwotny zawodzi.
  FAKT 05 pieczęci zawiera prerejestrowany pierwotny punkt końcowy;
  opublikowany pierwotny punkt końcowy musi się zgadzać.
- **Cherry-picking wyników**: selektywne raportowanie tylko tych
  analiz, które zadziałały. FAKT 06 zawiera pełny prerejestrowany plan
  analizy; opublikowane analizy muszą obejmować wszystkie
  prerejestrowane.
- **Post-hoc eksploracja podgrup**: twierdzenie „lek działa dla
  podgrupy X" po zobaczeniu danych. FAKT 07 zawiera prerejestrowaną
  listę podgrup; każda inna podgrupa musi być oznaczona jako post-hoc.
- **Rewizja liczebności próby**: zwiększenie liczebności próby po
  obserwacji trendów pośrednich. FAKT 06 zawiera prerejestrowaną
  liczebność próby i obliczenia mocy testu.
- **Ciche usuwanie niewygodnych drugorzędowych punktów końcowych**:
  FAKT 05 wstępnie porządkuje drugorzędowe punkty końcowe dla testowania
  hierarchicznego; każda zmiana kolejności lub usunięcie jest
  wykrywalne.
- **Tłumienie negatywnych wyników**: FAKT 08 zawiera zobowiązanie do
  publikacji; niepublikowanie w uzgodnionym oknie czasowym jest
  publicznie widoczne.

**Tryby awarii NIE objęte:**

- Nadużycie podczas samego prowadzenia badania (sfałszowane dane,
  oszukańcza rekrutacja). Pieczęć kotwiczy *plan*, a nie *wykonanie*.
- Selektywne raportowanie w publikacjach, które zawierają wszystkie
  prerejestrowane analizy, lecz interpretują je korzystnie. Pieczęć
  wychwytuje to, czego brakuje; nie może wychwycić tendencyjności
  interpretacji.
- Szkody dla pacjentów w trakcie samego badania. Pieczęć jest
  regulacyjna i dowodowa; nie zmniejsza ryzyka prowadzenia badania.

## Kiedy stosować ten zestaw

Rozważ opieczętowanie prerejestracji, jeśli:

- Sponsorujesz lub prowadzisz badanie kliniczne — Fazy 1 do 4 — które
  będzie wykorzystywane do informowania decyzji medycznych lub
  regulacyjnych.
- Jesteś gotów publicznie związać się prerejestrowanym projektem,
  punktami końcowymi i planem analizy.
- Możesz unieść konsekwencję: jeśli badanie zawiedzie na swoich
  prerejestrowanych punktach końcowych, nie możesz po cichu
  retconnować do innego punktu końcowego, który zadziałał.
- Uczestniczysz w kulturze badawczej (medycyna akademicka, grupy
  kooperacyjne, badania finansowane przez NIH), w której coraz
  bardziej wymagana jest integralność prerejestracji.

Ten zestaw jest *szczególnie* wartościowy dla:

- Badań inicjowanych przez badaczy w instytucjach akademickich (gdzie
  presja sponsora na zmianę punktów końcowych post-hoc jest realna,
  ale badacz akademicki ma reputacyjny bodziec, by jej się
  przeciwstawić).
- Badań open-science i badań citizen-science.
- Badań przepozycjonowania leków w małych firmach biotechnologicznych
  bez długiego doświadczenia w prowadzeniu badań.
- Każdego badania mającego informować zgłoszenia regulacyjne, w
  którym w przyszłości mogłyby zostać podniesione argumenty „nigdy
  tak nie powiedzieliśmy".

## Kiedy NIE stosować tego zestawu

NIE używaj tego zestawu, jeśli:

- Protokół badania jest faktycznie wciąż w fazie zmian. Prerejestruj
  wówczas, gdy protokół jest ostateczny, nie wcześniej.
- Nie możesz zobowiązać się do publikowania wyników niezależnie od
  ich kierunku. Pieczęć czyni brak publikacji publicznie wykrywalnym.
- Badanie wiąże się z konkurencyjną tajemnicą przemysłową, która
  uniemożliwia ci upublicznienie planu analizy. Pieczęć czyni plan
  analizy trwałym zapisem publicznym; nie ma sposobu, by opieczętować
  coś prywatnie.
- Nie masz prawnej i etycznej akceptacji protokołu. Pieczęć utrwala
  protokół tak, jak TY go opieczętowałeś; nie może zostać retroaktywnie
  zatwierdzony przez IRB lub komisję etyczną.

## Jak sforkować ten zestaw dla rzeczywistej prerejestracji

```bash
# 1. Copy this example
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Replace fictional content with the real trial protocol content.
# Each fact corresponds to a section of a standard pre-registration:
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Update site/index.html to reflect the real trial.

# 4. Seal (BEFORE enrollment begins, BEFORE database lock):
bash build/seal.sh

# 5. Verify locally:
python3 build/verify.py

# 6. Deploy:
#    - Publish the seal URL to your trial sponsor's website AND
#    - Add the IPFS CID to the trial's ClinicalTrials.gov record's
#      "Description" or "References" field, so the registry record
#      cross-references the cryptographic seal.
```

**KRYTYCZNE WYCZUCIE CZASU**: pieczęć musi zostać utworzona PRZED
rozpoczęciem rekrutacji. Prerejestracja opieczętowana po włączeniu
pierwszego pacjenta jest sądowo-dowodowo znacznie słabsza. Idealnie
pieczętować w momencie zatwierdzenia przez IRB.

## Integracja z istniejącą infrastrukturą prerejestracji

Zestaw jest zaprojektowany do komponowania, a nie zastępowania:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: zarejestruj badanie
  w rejestrze jurysdykcyjnym zgodnie z wymaganiami. Następnie, w polu
  „Description" lub „References" wpisu rejestru, dodaj link do
  opieczętowanej pod MYRIAM publikacji.
- **OSF (Open Science Framework)**: OSF obsługuje prerejestrację z
  pieczątkami czasu, ale bez zakotwiczenia w Bitcoinie. Pieczęć
  MYRIAM można dołączyć jako plik uzupełniający na stronie
  rejestracji OSF, dostarczając zarówno pieczęć czasu, jak i
  zakotwiczenie w Bitcoinie.
- **AsPredicted.org**: analogicznie — dołącz URL pieczęci MYRIAM
  jako uzupełniający URL.
- **Czasopisma**: niektóre czasopisma (np. Trials, BMJ Open)
  akceptują adresy URL prerejestracji jako część zgłoszenia. Załącz
  URL pieczęci MYRIAM obok URL rejestru.

## Co otrzymują odbiorcy (regulatorzy, recenzenci czasopism, meta-analitycy)

Badanie prerejestrowane pod MYRIAM daje recenzentom:

1. **Kryptograficzny dowód, że protokół został sfinalizowany w
   określonym czasie.** Recenzenci mogą zweryfikować czas pieczęci za
   pomocą pokwitowania OTS.
2. **Bajtową stabilność tekstu protokołu.** Recenzenci porównujący
   opublikowaną sekcję metod z prerejestrowanym projektem mogą to
   zrobić znak po znaku.
3. **Wykrywanie zamiany punktów końcowych.** Prosty diff pomiędzy
   opieczętowanym FAKTEM 05 a opublikowanym pierwotnym punktem
   końcowym ujawnia każdą podmianę.
4. **Wykrywanie odchyleń od planu analizy.** Prosty diff pomiędzy
   opieczętowanym FAKTEM 06 a opublikowanymi metodami statystycznymi
   ujawnia modyfikacje.
5. **Wykrywanie selektywnego raportowania podgrup.** Opieczętowany
   FAKT 07 zawiera wszystkie prerejestrowane podgrupy; każda podgrupa
   w publikacji nieobecna w pieczęci musi być oznaczona jako post-hoc.

To czyni przeglądy systematyczne i meta-analizy znacząco łatwiejszymi
niż przy obecnej praktyce.

## Czym ten zestaw NIE jest

- Nie jest substytutem zatwierdzenia przez IRB / komisję etyczną.
- Nie jest substytutem rejestracji w rejestrze jurysdykcyjnym.
- Nie jest gwarancją, że badanie zostanie przeprowadzone zgodnie
  z planem.
- Nie jest sposobem na zakotwiczenie zgody pacjenta lub innych
  dokumentów etycznych (te wymagają własnego mechanizmu
  pieczętowania).
- Nie jest ochroną przed post-publikacyjną krytyką projektu badania.

## Uwaga o publikacji wyników negatywnych

Zobowiązanie #1 w FAKCIE 08 („publikacja niezależnie od kierunku")
jest pojedynczym zobowiązaniem o największym wpływie na śmiertelność
w całej pieczęci. Historyczne tłumienie negatywnych wyników badań
(zwłaszcza dla leków psychiatrycznych u młodzieży, leków
onkologicznych w populacjach starszych oraz leków sercowo-naczyniowych
u kobiet) wiarygodnie przyczyniło się do tysięcy możliwych do
uniknięcia zgonów w ciągu dekad, poprzez nadmierne przepisywanie
oparte na obciążonych szacunkach skuteczności.

Opieczętowane zobowiązanie do publikowania negatywnych wyników jest
samo w sobie jednym z najsilniej dźwigniowych ruchów dla zdrowia
publicznego, jakie może wykonać sponsor. Pieczęć dostarcza zewnętrznej
rozliczalności dla tego zobowiązania w sposób, którego samodzielnie
egzekwowane polityki publikacji nie zapewniają.

## Zakończenie

Prerejestracja badania klinicznego leku pod MYRIAM oznacza niewielką
dodatkową pracę dla sponsora: ~30 minut na wypełnienie faktów,
~10 sekund na opieczętowanie. Dodawana rozliczalność jest
asymetryczna: mały koszt dla uczciwego prowadzenia badania, duże
ograniczenie post-hoc manewrowania, które przyczyniło się do
historycznych obciążeń bazy dowodowej.

Jeśli jesteś sponsorem lub głównym badaczem rozważającym ten zestaw —
zestaw jest w domenie publicznej (CC0). Używaj go. Modyfikuj go.
Ulepszaj go.

## Licencja

Domena publiczna (CC0). Atrybucja nie jest wymagana.
