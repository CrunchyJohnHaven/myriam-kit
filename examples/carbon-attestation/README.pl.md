# Zestaw pieczęci atestacji węglowej

*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

Gotowy do użycia przykład myriam-kit dla deweloperów projektów
węglowych, niezależnych weryfikatorów oraz rejestrów, którzy chcą
opublikować zakotwiczoną w Bitcoinie, manipulację-wykrywającą pieczęć
zdarzenia wydania kredytu węglowego, weryfikacji pochłonięcia lub
atestacji emisji w dokładnym momencie certyfikacji — tak aby ciche
modyfikacje po wydaniu stały się publicznie wykrywalne.

---

## Czego ten zestaw NIE robi (przeczytaj najpierw)

Kredyty węglowe są politycznie i naukowo kontrowersyjne. Pieczęć jest
kryptograficznym znacznikiem czasu tego, co zostało zaświadczone. Nie
może zweryfikować, czy zaświadczone odzwierciedla rzeczywistą korzyść
klimatyczną. Następujące tryby awarii są **poza domeną pieczęci** i to
one stanowią większość znaczących pytań o integralność kredytów
węglowych:

1. **Dodatkowość (Additionality).** Pieczęć nie może zweryfikować, że
   zaliczona działalność nie odbyłaby się bez finansowania węglowego.
   Scenariusz kontrfaktyczny jest z zasady nieobserwowalny. Pieczęć
   rejestruje argumentację dodatkowości metodologii; nie rozstrzyga jej.

2. **Trwałość (Permanence).** Pieczęć nie może zweryfikować, że
   sekwestrowany węgiel pozostanie zsekwestrowany w odpowiednim
   horyzoncie czasowym (dziesięciolecia do stuleci dla węgla leśnego,
   skale geologiczne dla niektórych pochłonięć). Najnowsza literatura
   (Badgley et al. 2022, Patterson et al. 2022) pokazuje, że pule
   buforowe zostały istotnie uszczuplone przez rzeczywiste zdarzenia
   odwrócenia. Zapieczętowany kredyt jest zapieczętowanym *roszczeniem*
   trwałości przy określonych założeniach dotyczących puli buforowej,
   a nie dowodem trwałości.

3. **Wycieki (Leakage).** Pieczęć nie może zweryfikować, że uniknięte
   emisje na obszarze projektu nie są po prostu przesunięte na obszar
   poza projektem. Domyślne metodologiczne odliczenia wycieków są
   regulacyjnymi zamiennikami, a nie pomiarami. Pieczęć zakotwicza
   zastosowane odliczenie; nie certyfikuje go jako poprawne.

4. **Współkorzyści (Co-benefits).** Pieczęć nie może zweryfikować
   twierdzeń o rozwoju społeczności ani o bioróżnorodności.
   Współkorzyści są zazwyczaj samo-zadeklarowane i przejrzane przez
   weryfikatora, a nie audytowane na głębokości kwantyfikacji węgla.
   Pieczęć zakotwicza hashe dokumentów; nic więcej.

5. **Wystarczalność wolnej, uprzedniej i świadomej zgody (FPIC).**
   Zgoda ludności rdzennej i społeczności w projektach węglowych ma
   udokumentowaną historię trybów awarii (zgoda wymuszona, zgoda od
   nieprzedstawicielskich ciał, post-hoc "zgoda" poprzez rekompensatę).
   Pieczęć zakotwicza dokumentację FPIC i hashe dziennika skarg; nie
   może certyfikować, że proces zgody był autentyczny.

6. **Niezależność weryfikatora.** Weryfikatorzy są opłacani przez
   deweloperów projektów. Jest to strukturalny konflikt interesów,
   którego żaden system akredytacji nie rozwiązał. Pieczęć zakotwicza
   oświadczenie niezależności weryfikatora; nie certyfikuje, że
   oświadczenie jest prawdziwe.

7. **Podwójne liczenie między rejestrami lub z krajowymi
   inwentaryzacjami.** Pieczęć zakotwicza migawkę stanu rejestru w
   momencie atestacji. Jeśli ta sama działalność jest również liczona
   przez kraj goszczący do jego NDC lub jest również deklarowana w
   innym rejestrze, pieczęć czyni stan rejestru porównywalnym, ale nie
   zapobiega podwójnemu liczeniu.

8. **Poprawność roszczenia kupującego.** Kupujący, który wycofuje
   zapieczętowany kredyt, aby wesprzeć roszczenie "net zero" lub
   "neutralny węglowo", formułuje roszczenie w dół łańcucha, którego
   pieczęć nie obejmuje. Pieczęć rejestruje wycofanie; ważność
   marketingowego roszczenia kupującego jest oddzielnym pytaniem w
   dół łańcucha.

9. **Poprawność metodologii.** Pieczęć rejestruje cytowanie
   metodologii + hash dokumentu obowiązujący w momencie atestacji. Nie
   stwierdza, że metodologia jest naukowo poprawna. Reforma metodologii
   się zdarza; pieczętowanie w ramach metodologii, która jest później
   zmieniona, nie czyni kredytów wstecznie "błędnymi" lub "poprawnymi"
   — zakotwicza, jakie reguły obowiązywały w momencie wydania.

**Powyższa sekcja o uczciwych granicach jest nośną częścią tego
zestawu.** Niemal każde znaczące pytanie o integralność kredytu
węglowego znajduje się w jednym z tych dziewięciu koszy. Pieczęć
zamyka wąską pozostałą lukę: cichą wsteczną modyfikację bajtów w
zapisie. Ta luka jest realna i warta zamknięcia, ale jest mała w
porównaniu do spornego terenu.

---

## Czego ten zestaw MUSI ODMÓWIĆ pieczętowania

Zestaw jest skonfigurowany tak, aby odrzucać następujące wzorce
faktów, nawet jeśli złoży je użytkownik z ważnym uprawnieniem do
podpisywania:

- **"Dodatkowość" przedstawiona jako fakt.** Pieczętowanie
  dodatkowości jako faktu tworzy mylący zapis. Zestaw akceptuje
  *argumenty* dodatkowości zgodne z metodologią, a nie *roszczenia*
  dodatkowości.
- **"Trwałość" bez jawnego ujawnienia horyzontu czasowego i puli
  buforowej.** Pieczętowanie trwałości bez tych parametrów zaciemnia,
  do czego projekt rzeczywiście się zobowiązuje.
- **"Brak wycieków" bez pomiaru specyficznego dla projektu.** Domyślne
  metodologiczne odliczenia wycieków nie są pomiarem i pieczęć nie
  będzie ich tak traktować.
- **Kwantyfikacje wygenerowane przed zakończeniem niezależnej
  weryfikacji.** Pieczęć przed weryfikacją tworzy fałszywie pozytywny
  zapis "zweryfikowany".
- **Rekordy wydania dla kredytów wydanych również w innym rejestrze
  bez jawnego ujawnienia między rejestrami** w FACT 06.
- **Rekordy wycofania, które nie nazywają beneficjenta wycofania.**
  Anonimowe wycofanie podważa publiczną funkcję wycofania; zestaw
  odmawia jego umożliwienia.
- **Roszczenia FPIC nieuzasadnione atestowalnymi hashami
  dokumentacji.**
- **Wydanie w ramach Artykułu 6.2 / 6.4 bez hashu listu autoryzacji
  (LoA) kraju goszczącego** zapieczętowanego w FACT 06.
- **Pieczętowanie na żądanie jakiejkolwiek strony innej niż deweloper
  projektu + weryfikator wspólnie** dla tego projektu.
- **Roszczenia współkorzyści zapieczętowane jako "certyfikowane"**,
  gdy są one tylko "samo-zadeklarowane i przejrzane przez
  weryfikatora".

Sama odmowa może być zapieczętowana jako fakt ("Ta strona zażądała
zapieczętowania X; zestaw odmówił na podstawie reguły odmowy Y"),
tworząc publiczny zapis próby nadużycia.

---

## Co ten zestaw JEDNAK pieczętuje

8 faktów w momencie atestacji:

1. **Powiadomienie-przykład** — deklaruje publikację jako przykład
   (rzeczywiste atestacje usuwają lub zastępują to).
2. **Identyfikacja projektu** — nazwa projektu, rejestr, ID projektu
   w rejestrze, cytowanie metodologii + hash, hash granic
   geograficznych, rocznik (vintage), deweloper projektu, roszczenie
   o współkorzyściach, status FPIC.
3. **Kwantyfikacja emisji lub pochłonięcia** — tony brutto CO2e,
   kontrfaktyczny scenariusz bazowy, odliczenie wycieków, wkład do
   puli buforowej, odliczenie z tytułu niepewności, roszczenie
   netto kredytowalne, hashe każdego wejścia liczbowego.
4. **Metodologia pomiaru** — źródła danych z teledetekcji, naziemna
   sieć poletek kontrolnych, hash dziennika kalibracji przyrządów,
   hash modelu klasyfikującego + statystyki dokładności, model
   gęstości węgla, manifest pochodzenia kodu + odtwarzalności.
5. **Niezależna weryfikacja** — organizacja weryfikatora, akredytacja,
   hash oświadczenia niezależności, wcześniejsze zaangażowania z
   deweloperem, hash archiwum zdjęć z wizyt terenowych, podniesione +
   rozwiązane uwagi, hash dokumentu opinii weryfikacyjnej.
6. **Rekord wydania lub wycofania** — wniosek o wydanie +
   zatwierdzenie, łączna liczba wydanych kredytów, zakres serii,
   deklaracja międzyrejestrowa, hash LoA kraju goszczącego tam, gdzie
   ma to zastosowanie, zakresy serii wycofania + beneficjenci (dla
   atestacji wycofania), hashe migawek stanu rejestru.
7. **Ujawnienia towarzyszące i rekord odmów** — toczące się spory
   metodologiczne, ryzyko nietrwałości, zastrzeżenia dotyczące
   wycieków, zastrzeżenia dotyczące dodatkowości, hashe FPIC +
   dziennika skarg, zastrzeżenia dotyczące współkorzyści, wcześniejsze
   zaangażowanie weryfikatora; jawna lista wzorców, których zestaw
   odmówił pieczętować.
8. **Sygnujący principal** — deweloper projektu + weryfikator +
   rejestr, każdy z rolą + zakresem atestacji + informacją o kluczu
   kryptograficznym.

Każdy fakt kończy się konwencją bramki-odmowy: *"Ten fakt stwierdza
tylko X. Nie stwierdza Y"* (gdzie Y jest najbliższym trybem awarii z
sekcji "NIE robi" powyżej).

---

## Przed czym broni ten zestaw

- **Cicha modyfikacja kwantyfikacji po wydaniu.** Każda zmiana liczby
  całkowitej w FACT 03 daje inny SHA-256, inny korzeń Merkle, nie
  przechodzi weryfikacji OTS.
- **Cicha podmiana metodologii.** FACT 02 zamraża cytowanie metodologii
  + hash dokumentu w momencie wydania. Podmiana metodologii przez
  rejestr na inną wersję po wydaniu jest publicznie porównywalna.
- **Cicha rewizja scenariusza bazowego.** Hash wyjścia modelu
  scenariusza bazowego w FACT 03 jest zapieczętowany. Post-hoc
  ponowne dostrojenie scenariusza bazowego w celu wytworzenia większej
  liczby kredytów jest wykrywalne.
- **Cicha podmiana opinii weryfikatora.** Hash dokumentu opinii w
  FACT 05 jest zapieczętowany. Przepisywanie "weryfikator zawsze
  mówił X" po wydaniu jest wykrywalne.
- **Cicha zniknięcie rekordu wycofania.** Migawka stanu rejestru w
  FACT 06 jest zapieczętowana. Kredyty, które tajemniczo stają się
  ponownie "dostępne" po oznaczeniu jako wycofane, są wykrywalne
  względem pieczęci.
- **Cicha podmiana dokumentu FPIC.** Hashe FPIC + dziennika skarg w
  FACT 07 są zapieczętowane. Dokumenty zastępcze zgody są wykrywalne.
- **Ciche usunięcie niewygodnych ujawnień.** Status ujawnień
  towarzyszących w FACT 07 jest zapieczętowany. Ciche usunięcie
  zastrzeżenia o nietrwałości ze strony opisu projektu jest wykrywalne
  względem zapieczętowanych bajtów.

Zestaw NIE broni przed leżącymi u podstaw pytaniami o integralność
(dodatkowość, trwałość, wycieki, wystarczalność FPIC, niezależność
weryfikatora, ważność metodologii). To są trudniejsze problemy i
pieczęć nie może ich rozwiązać.

---

## Przypadki historyczne lub quasi-historyczne, w których zestaw by pomógł

Zestaw stworzyłby użyteczną kotwicę — *nie naprawę* — w przypadkach
obejmujących cichą wsteczną modyfikację rekordów atestacji węglowej.
NIE rozwiązałby leżących u podstaw spornych pytań w żadnym z tych
przypadków.

- **Śledztwo Guardian / Die Zeit / SourceMaterial z 2023 r. dotyczące
  kredytów Verra na lasy tropikalne.** Śledczy stwierdzili, że
  większość badanych projektów REDD+ wytworzyła kredyty, których
  deklarowane uniknione emisje nie zgadzały się z późniejszą
  ponowną analizą danych teledetekcyjnych. Śledztwo wymagało
  rekonstrukcji dokumentacji projektu wobec wstecznie zmodyfikowanych
  rekordów rejestru. Zapieczętowana publikacja w każdym cyklu wydania
  zapewniłaby jednoznaczne referencyjne bajty tego, co zostało
  zaświadczone w każdym cyklu — nie naprawę leżącego u podstaw
  problemu scenariusza bazowego, ale czystą oś czasu śledczą.

- **Zdarzenia odwrócenia kalifornijskich offsetów leśnych z 2020 r.**
  Wiele leśnych projektów węglowych w ramach rynku regulacyjnego
  Kalifornii doświadczyło odwróceń wskutek pożarów lasów przekraczających
  zarezerwowaną dla nich rezerwę puli buforowej. Rekonstrukcja tego,
  co każdy projekt zaświadczył o ryzyku nietrwałości *w momencie
  wydania* (w przeciwieństwie do tego, co projekt później twierdził,
  że zaświadczył), jest obecnie trudna. Pieczęcie dla każdego rocznika
  uczyniłyby przedpożarowe atestacje kanonicznie odzyskiwalnymi.

- **Różne projekty REDD+, gdzie metodologie scenariusza bazowego
  regionu referencyjnego były wstecznie krytykowane jako zawyżone.**
  Hash dokumentu metodologii zapieczętowany w momencie wydania
  zakotwiczyłby, która wersja metodologii rzeczywiście miała
  zastosowanie do którego rocznika, czyniąc obronę "metodologia
  zawsze była X" porównywalną.

- **Kilka sporów dotyczących projektów regeneracji indukowanej
  człowiekiem w ramach Australian Carbon Credit Unit (ACCU)
  (2022–2023).** Akademicka krytyka, czy regeneracja była rzeczywiście
  indukowana projektem, a nie naturalna, przekształciła się w spory
  o to, co projekt pierwotnie twierdził. Zapieczętowane atestacje
  zapewniłyby jednoznaczne rekordy dla każdego rocznika.

- **Rekordy wycofania offsetów węglowych, które zmieniły stan.**
  Kilka udokumentowanych przypadków rekordów wycofania na rejestrach
  rynku dobrowolnego wydaje się zmieniać status po wycofaniu (stając
  się "wycofanymi" z innego powodu lub przypisywanymi innemu
  beneficjentowi po fakcie). Pieczęcie dla każdego wycofania
  zakotwiczyłyby stan w momencie pierwotnego wycofania.

W żadnym z tych przypadków zestaw nie rozstrzygnąłby, czy leżący u
podstaw kredyt reprezentował rzeczywistą korzyść klimatyczną. Zestaw
zakotwicza rekordy; to wszystko, co robi.

---

## Kiedy używać tego zestawu

- Jesteś deweloperem projektu, który chce opublikować
  manipulację-wykrywającą atestację obok standardowego zgłoszenia do
  rejestru.
- Jesteś niezależnym weryfikatorem, który chce, aby twoja opinia
  weryfikacyjna była publicznie weryfikowalna względem późniejszego
  przedstawienia "tego, co powiedział weryfikator" przez rejestr.
- Jesteś rejestrem, który chce zapewnić dodatkową warstwę
  integralności rekordów wydania i wycofania — szczególnie dla
  projektów w jurysdykcjach ze słabszym zabezpieczeniem prawnym
  integralności rejestru.
- Jesteś dziennikarzem, naukowcem lub NGO prowadzącym wieloletnią
  analizę longitudinalną projektów węglowych i potrzebujesz publicznej
  kotwicy do porównania późniejszych przedstawień projektu z jego
  bajtami w momencie wydania.
- Jesteś kupującym (korporacyjny net-zero, zgodność linii lotniczej),
  który chce, aby kredyty, które wycofujesz, były wycofywane wobec
  publicznie zakotwiczonych rekordów, tak aby twoje marketingowe
  roszczenie w dół łańcucha mogło być audytowane wobec stabilnej osi
  czasu śledczej.

## Kiedy NIE używać tego zestawu

- **Nie używaj jako substytutu akredytowanej niezależnej weryfikacji.**
  Pieczęć nie zastępuje weryfikacji ISO 14064-3; komponuje się z nią.
- **Nie używaj, aby twierdzić, że projekt jest "dodatkowy", "trwały"
  lub "o niskich wyciekach".** Pieczęć nie może zweryfikować tych
  właściwości. Używanie pieczęci do ich stwierdzenia to nadużycie.
- **Nie używaj jako teatru legitymacji dla kredytów niskiej jakości.**
  Kryptograficzna pieczęć na kredycie niskiej jakości jest trwałym
  zapisem śledczym niskiej jakości, a nie obroną przed nią. Prymityw
  tnie w obie strony; to jego uczciwość.
- **Nie używaj do pieczętowania kredytów, które są również liczone
  przez kraj goszczący do jego NDC** bez jawnego ujawnienia
  odpowiedniego dostosowania w FACT 06.
- **Nie pieczętuj przed weryfikacją.** Pieczęć przed sfinalizowaniem
  opinii weryfikatora tworzy fałszywie pozytywny rekord "zweryfikowany".
- **Nie używaj pod presją, aby pominąć ujawnienie faktu towarzyszącego
  w FACT 07** (toczące się spory metodologiczne, problemy FPIC,
  wcześniejsze zaangażowanie weryfikatora). Odmów i zapieczętuj odmowę.
- **Nie używaj jako odznaki marketingowej.** "MYRIAM-zapieczętowane"
  to nie jest roszczenie jakości; to właściwość śledcza. Traktowanie
  tego jako odznaki jakości jest dokładnie tym nadużyciem, któremu
  projekt "ograniczenie-najpierw" próbuje zapobiec.

## Jak sforkować ten zestaw dla rzeczywistej atestacji

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # zastąp fikcyjną treść rzeczywistą
bash build/seal.sh         # PIECZĘTUJ W LUB PO wydaniu rejestrowym, nie wcześniej
python3 build/verify.py    # potwierdź
```

**Krytyczne momenty czasowe:** pieczętuj W LUB PO oficjalnym zdarzeniu
wydania rejestru, NIE wcześniej. Pieczęć przed wydaniem tworzy
fałszywie pozytywny rekord "wydany". Dla atestacji wycofania pieczętuj
W momencie wycofania. Dla atestacji ciągłego monitoringu między
wydaniem a wycofaniem pieczętuj w każdym cyklu monitoringu
podpisanym przez weryfikatora — ale wyraźnie zaznacz w FACT 01, że
atestacja jest aktualizacją monitoringu, a nie wydaniem.

## Integracja z istniejącą infrastrukturą węglową

- **Verra (VCS).** URL zapieczętowanej publikacji lub IPFS CID może
  być załączony do strony projektu VCS jako dokumentacja uzupełniająca.
  Pieczęć nie zastępuje weryfikacji VCS; komponuje się z nią.
- **Gold Standard.** Ten sam model integracji — atestacja uzupełniająca
  obok dokumentacji wydania Gold Standard. Nacisk Gold Standard na
  dokumentację współkorzyści + korzyści dla społeczności naturalnie
  odwzorowuje się na FACT 02 + FACT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Ten sam model integracji.
- **Artykuł 6.4 (mechanizm Organu Nadzorczego Porozumienia
  Paryskiego).** Hash LoA kraju goszczącego w FACT 06 jest specjalnie
  zaprojektowany dla śledzenia ITMO w ramach Artykułu 6.4 / 6.2.
  Ujawnienie odpowiedniego dostosowania to pole z bramką odmowy.
- **EU ETS MRV.** Dla emitentów rynku regulacyjnego hash raportu MRV
  odwzorowuje się na hash arkusza kwantyfikacyjnego FACT 03. Pieczęć
  komponuje się — nie zastępuje — zweryfikowanego raportu o emisjach
  operatora.
- **CDP (Carbon Disclosure Project) ujawnienia korporacyjne.** Dla
  korporacji cytujących wycofane kredyty w zgłoszeniach CDP, rekord
  wycofania zapieczętowany w FACT 06 jest kanonicznym, odzyskiwalnym
  rekordem. Język zgłoszenia CDP może odwoływać się do korzenia
  Merkle zapieczętowanej publikacji lub IPFS CID.
- **ISO 14064-2 (projekt) / ISO 14064-3 (weryfikacja) / ISO 14065
  (akredytacja).** Pieczęć rejestruje twierdzenie o zgodności + hashe;
  nie przeprowadza oceny zgodności.
- **TSVCM Core Carbon Principles (CCP) / etykiety ICVCM.** Tam, gdzie
  projekt był oceniany w stosunku do ICVCM CCPs, hash wyniku oceny
  może być zapieczętowany w FACT 07 jako ujawnienie towarzyszące.

## Czego ten zestaw NIE zastępuje

- Akredytowanej niezależnej weryfikacji (ISO 14064-3)
- Procesów wydania i wycofania w rejestrze
- Oceny zgodności metodologicznej
- Procesów autoryzacji kraju goszczącego dla transakcji Artykułu 6
- Procesów MRV rynku regulacyjnego (EU ETS, California Cap-and-Trade,
  RGGI itd.)
- Inicjatyw integralności rynku dobrowolnego (ICVCM, VCMI)
- Niezależnej oceny wpływu klimatycznego

## Dlaczego ten zestaw istnieje w v0.4.0+

To jest 7. opracowany przykład dostarczany z myriam-kit. Zestaw
istnieje, ponieważ rynki kredytów węglowych mają dobrze udokumentowaną
historię cichych modyfikacji wstecznych — metodologie, które są
wstecznie reinterpretowane, scenariusze bazowe, które są wstecznie
rewidowane, rekordy wycofania, które zmieniają stan, oraz ujawnienia
projektów, które po cichu opuszczają niewygodne zastrzeżenia z biegiem
czasu.

Pieczęć zamyka *wąską* lukę bajtów-w-momencie-atestacji. Nie zajmuje
się — i nie może zająć się — większymi spornymi pytaniami dodatkowości,
trwałości, wycieków lub autentyczności współkorzyści. Uczciwa
prezentacja tego ograniczenia przez zestaw jest jego najważniejszą
cechą.

## Licencja

Domena publiczna (CC0). Forkuj. Atrybucja nie jest wymagana.
