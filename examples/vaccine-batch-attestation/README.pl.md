*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw atestacji serii szczepionki

Gotowy przykład myriam-kit dla producentów szczepionek, organów
zapewnienia jakości oraz agencji zdrowia publicznego, którzy chcą
opublikować zakotwiczoną w Bitcoinie pieczęć zwolnienia serii
z właściwością wykrywania manipulacji (tamper-evident).

## Przed czym broni ten zestaw

**Tryby awarii, które wykrywa pieczęć:**

- **Ciche retroaktywne modyfikacje wyników badań zwolnienia.** Wszystkie
  8 plików PDF z badaniami zwolnienia w przykładzie jest haszowanych.
  Ponowne haszowanie po zwolnieniu ujawnia każdą modyfikację.
- **Spory o to, które specyfikacje obowiązywały w momencie zwolnienia.**
  Zapieczętowany FACT 02 zawiera kanoniczną identyfikację serii oraz
  hash dokumentacji produkcji. Przyszłe spory w stylu „specyfikacja
  zawsze była X" otrzymują publiczną kotwicę.
- **Ciche zawężanie zakresu wycofania.** Zobowiązania w zakresie
  nadzoru nad bezpieczeństwem farmakoterapii (pharmacovigilance) w
  FACT 05 są zapieczętowane; ich niedotrzymanie jest publicznie
  obserwowalne.
- **Retroaktywna respecyfikacja serii niespełniającej specyfikacji.**
  Jeśli wynik badania zwolnienia był w istocie granicznym WYNIKIEM
  POZYTYWNYM, który następnie po zwolnieniu został przeklasyfikowany
  jako NEGATYWNY, hashe zapieczętowanych raportów dowodzą tego, co
  faktycznie stwierdzał oryginalny plik PDF z wynikiem.

**Tryby awarii NIE objęte:**

- Oszustwo w samym procesie produkcji (pieczęć kotwiczy wyniki badań,
  a nie integralność produkcji).
- Zdarzenia niepożądane będące biologicznymi konsekwencjami
  prawidłowo przebadanej serii (pieczęć nie certyfikuje
  bezpieczeństwa klinicznego, jedynie integralność dokumentacji).
- Spory o to, która wersja specyfikacji regulacyjnej jest miarodajna.

## Kiedy stosować ten zestaw

Rozważ opieczętowanie zwolnienia serii, jeśli:

- Jesteś producentem szczepionek i chcesz wykazać sądowo-dowodową
  integralność dokumentacji zwolnienia ponad to, czego wymagają
  regulatorzy
- Jesteś zespołem QA wdrażającym praktykę „publikujemy to, co
  atestujemy"
- Jesteś producentem małej/krajowej skali w jurysdykcji o słabszej
  infrastrukturze regulacyjnej i chcesz zakotwiczyć dokumentację serii
  względem globalnego weryfikatora
- Jesteś agencją zdrowia publicznego lub NGO prowadzącą niekomercyjny
  program produkcji szczepionek (np. dla chorób zaniedbanych)

## Historyczny precedens z ofiarami śmiertelnymi

- **Zanieczyszczenie heparyny (2008, Chiny):** podrobiony
  nadmiernie siarczanowany siarczan chondroityny w seriach heparyny.
  Zapieczętowany manifest badań zwolnienia uczyniłby cichą
  pozasprzedażową modyfikację zapisu badań kryptograficznie wykrywalną.
- **Cyjanek w Tylenolu (1982):** retroaktywne spory o punkt
  pochodzenia manipulacji. Zapieczętowany hash dokumentacji produkcji
  kotwiczy stan sprzed dystrybucji.
- **Różne wycofania serii szczepionek**, w których pytanie „czy ta
  seria została kiedykolwiek właściwie przebadana" staje się sporne
  po latach.

Zestaw NIE jest rozwiązaniem ŻADNEGO z tych przypadków w ścisłym
sensie — ale w każdym z nich zapieczętowane atestacje serii
zapewniłyby czystszą sądowo-dowodową oś czasu.

## Jak sforkować ten zestaw dla rzeczywistej serii

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # zastąp treść fikcyjną treścią rzeczywistej serii
bash build/seal.sh        # OPIECZĘTUJ PRZED rozpoczęciem dystrybucji
python3 build/verify.py   # potwierdź
```

**KRYTYCZNE WYCZUCIE CZASU**: opieczętuj w chwili zwolnienia przez QA,
PRZED rozpoczęciem dystrybucji serii. Pieczęć po dystrybucji jest
słabsza pod względem sądowo-dowodowym.

## Integracja z istniejącą infrastrukturą farmaceutyczną

- **Zgłoszenia eCTD (FDA / EMA):** URL opublikowanej pieczęci lub
  CID IPFS może być przywołany w sekcji Modułu 3 (jakość)
- **Prekwalifikacja WHO:** zapieczętowany manifest wykazuje łańcuch
  badań przed zwolnieniem dla jurysdykcji spoza FDA/EMA
- **Sprzężenie zwrotne z pharmacovigilance:** FACT 05 zobowiązuje
  producenta do zapieczętowanego raportowania zagregowanych
  wskaźników AE w 6 i 12 miesiącu
- **Systemy wycofań (RxConnect, MedWatch):** jeśli wymagane jest
  wycofanie, sam jego zakres jest pieczętowany pod MYRIAM, co zapewnia
  publiczną weryfikację, że wszystkie rozdystrybuowane partie są objęte

## Czego ten zestaw NIE zastępuje

- Zgłoszeń regulacyjnych FDA / EMA / WHO
- Ścieżek audytu GMP (pieczęć kotwiczy WYNIKI, a nie surowe zapisy
  procesowe)
- Baz danych pharmacovigilance (VAERS / EudraVigilance)
- Systemów koordynacji wycofań

## Licencja

Domena publiczna (CC0). Forkuj. Atrybucja nie jest wymagana.
