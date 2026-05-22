*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw atestacji bezpieczeństwa żywności

Gotowy do użycia przykład myriam-kit dla producentów żywności,
inspektorów bezpieczeństwa żywności, niezależnych certyfikatorów oraz
organów regulacyjnych, którzy chcą opublikować zakotwiczoną w Bitcoinie,
odporną na manipulację pieczęć *tego, co powiedziały testy zwolnienia*
oraz *jaką decyzję o zwolnieniu podjęto*, w momencie zwolnienia partii
lub podpisania raportu inspekcyjnego — tak, aby ciche, po-zwolnieniowe
modyfikacje zapisu testów, decyzji o zwolnieniu lub zobowiązań do
wycofania były publicznie wykrywalne.

---

## Czego ten zestaw NIE robi (przeczytaj najpierw)

Pieczęć jest kryptograficznym znacznikiem czasu KTÓRE testy zwolnienia
były wykonane na KTÓREJ partii, przez KTÓRE akredytowane laboratoria,
według KTÓRYCH metod, z KTÓRYMI wynikami i jaką DECYZJĘ O ZWOLNIENIU
podjął organ QA na podstawie tych wyników. Nie może odpowiedzieć na
żadne pytanie dotyczące bezpieczeństwa żywności poza tym. Następujące
sprawy są **poza domeną pieczęci**:

1. **Zapobieganie skażeniu.** Zestaw zakotwicza, co MÓWIŁY wyniki
   testów przy zwolnieniu. Skażenie ma wiele przyczyn — heterogeniczna
   dystrybucja mikrobów w obrębie partii, nadużycia temperaturowe po
   zwolnieniu w dystrybucji, niepowodzenia obsługi w handlu
   detalicznym, niepowodzenia przygotowania przez konsumenta, nowe lub
   nieskryningowane zagrożenia (np. fałszowanie melaminą zanim
   skryning melaminy stał się rutyną), oszustwo w łańcuchu dostaw
   powyżej zakresu testowania producenta. Pieczęć nie zapobiega
   żadnemu z tych i nie twierdzi tego.

2. **Gwarantowanie, że wszystkie jednostki w przepuszczającej partii
   są bezpieczne.** Skażenie mikrobiologiczne w produkcie żywnościowym
   luzem jest HETEROGENICZNE. Patogeny Listeria, Salmonella i STEC
   występują w niskoczęstotliwościowych zlokalizowanych ogniskach, a
   nie równomiernie rozproszone. Plany pobierania próbek ICMSF i
   Codex mają udokumentowane, ograniczone prawdopodobieństwo
   wykrycia skażenia obecnego z niską częstotliwością —
   prawdopodobieństwo NIE wynosi 1. Partia, która przechodzi
   pobieranie próbek przy zwolnieniu, może nadal zawierać skażone
   jednostki, które nie zostały pobrane. Pieczęć zakotwicza
   PRÓBKI, nie masę luzem. To ograniczenie jest wyraźnie powtórzone
   w FAKCIE 03 i jest pojedynczo najważniejszym uczciwym
   ograniczeniem tego zestawu.

3. **Certyfikowanie, że testy zwolnienia były uczciwie
   przeprowadzone.** Pieczęć zakotwicza to, co testy zgłosiły przy
   zwolnieniu. Laboratorium, które zgłasza oszukańczy PASS przy
   zwolnieniu, produkuje kryptograficznie ważną pieczęć
   oszukańczego PASS. Zestaw sprawia, że późniejsza cicha
   modyfikacja jest wykrywalna, ale nie wykrywa oszustwa
   współczesnego. Wykrycie współczesnego oszustwa wymaga audytu,
   nadzoru akredytacji laboratorium (nadzór ISO 17025), programów
   badania biegłości i inspekcji regulatora — wszystko to jest
   powyżej pieczęci.

4. **Zastąpienie regulacyjnych zgłoszeń FSMA, FSIS lub właściwego
   organu UE.** Zapisy zwolnienia zgodnie z FSMA, FSIS,
   Rozporządzeniem UE (WE) 178/2002 i Codex Alimentarius są
   prowadzone zgodnie z ustawą i przedstawiane na żądanie
   regulatora. Pieczęć dodaje publiczną warstwę odporną na
   manipulację NA WIERZCH tych zgłoszeń; NIE zastępuje ich.
   Zapieczętowana publikacja nie jest zgłoszeniem regulacyjnym.

5. **Rozstrzyganie sporów o zakres wycofania.** Zestaw może
   zapieczętować zobowiązania do wycofania podjęte przy zwolnieniu
   (FAKT 06) i kolejny zakres wycofania jako nową publikację; ale
   granica tego, które partie są dotknięte, które jednostki
   wysłano, którzy detaliści je otrzymali i którzy konsumenci
   byli narażeni, jest nadal dochodzeniem śledzenia wstecz i w
   przód. Pieczęć zakotwicza to, do czego producent SIĘ
   ZOBOWIĄZAŁ i co później ZROBIŁ. Nie rozstrzyga podstawowego
   pytania epidemiologicznego.

6. **Wykrywanie umyślnego oszustwa w łańcuchu dostaw powyżej
   testowania.** Fałszowanie mleka i mieszanek dla niemowląt
   melaminą w Chinach w 2008 roku powiodło się, ponieważ melamina
   nie była w panelu analitów — był nim pomiar ekwiwalentu białka
   na podstawie zawartości azotu, a melamina go podrobiła.
   Zapieczętowany FAKT 03 z panelem analitów używanym wówczas
   zobowiązałby publicznie do tego panelu — ale nie zrobiłby nic,
   aby wykryć dodatek poza panelem. Wartość pieczęci w tym
   przypadku polegałaby na sądowym zakotwiczeniu "tego producent
   twierdził, że testuje", a NIE na zapobieganiu. Realny reżim
   bezpieczeństwa żywności rozwiązuje to poprzez niezapowiedziane
   pobieranie próbek przez regulatora ze skryningiem o szerokim
   zakresie (na przykład niesfokusowanymi metodami LC-MS), co jest
   powyżej pieczęci producenta.

7. **Zakotwiczanie dystrybucji po zwolnieniu i obsługi konsumenta.**
   Gdy partia opuści zakład, nadużycia temperatury podczas
   dystrybucji, nieprawidłowe obchodzenie się w handlu detalicznym,
   niepowodzenia przechowywania u konsumenta i błędy przygotowania
   przez konsumenta są poza zakresem. Pieczęć jest ograniczona do
   wydarzenia zwolnienia producenta. Odporność na manipulację w dół
   wymaga oddzielnych zestawów na poziomach dystrybutora, detalisty
   i (dla konsumentów instytucjonalnych, takich jak szkoły i
   szpitale) miejsca użycia.

8. **Ręczenie za bezpieczeństwo żywności w jakiejkolwiek konkretnej
   populacji.** Wyniki PASS w FAKCIE 03 nie wiążą się z
   bezpieczeństwem dla konsumentek w ciąży, niemowląt,
   immunokompromisowanych konsumentów ani osób starszych, dla
   których Listeria monocytogenes i Salmonella stanowią
   udokumentowane podwyższone ryzyko nawet przy stężeniach poniżej
   konwencjonalnych granic wykrywalności. Pieczęć nie może
   formułować twierdzenia o bezpieczeństwie specyficznym dla
   populacji i odmawia (reguła odmowy R6).

**Sekcja o uczciwych ograniczeniach powyżej jest nośną częścią tego
zestawu.** Producenci, którzy traktują "zapieczętowaliśmy nasz zapis
zwolnienia" jako równoważne "udowodniliśmy, że nasza żywność jest
bezpieczna", nadużywają prymitywu. Zestaw musi powiedzieć wprost: *to
jest prymityw nieodrzucalności dla współczesnych twierdzeń producenta
przy zwolnieniu, nie dowód bezpieczeństwa, nie substytut nadzoru
regulatora i nie obrona przed trybami awarii heterogenicznego
skażenia, oszustwa w łańcuchu dostaw lub niewłaściwej obsługi po
zwolnieniu, które zabiły ludzi w przeszłych wybuchach.*

---

## Czego ten zestaw MUSI ODMÓWIĆ pieczętowania

Zestaw jest skonfigurowany do odrzucania następujących wzorców
faktów, nawet jeśli zgłosi je użytkownik z ważnym uprawnieniem
podpisywania producenta:

- **Osobista identyfikacja jakiegokolwiek pracownika, kierownika,
  pracownika QA, wizytującego inspektora lub niezależnego audytora.**
  Imiona, identyfikatory pracowników, numery odznak, numery
  ubezpieczenia społecznego, adresy domowe, prywatne numery
  telefonów — żadne z tych nie pojawiają się w publicznej pieczęci.
  Role są publiczne; powiązania osoba-do-roli są pieczętowane
  oddzielnie i wykrywalne w ramach procesu regulacyjnego.
  Bezpieczeństwo pracowników przed odwetem i nękaniem jest
  ograniczeniem nośnym; atestacja bezpieczeństwa żywności może być
  wykonywana na poziomie ról. (R1)

- **Precyzyjna lokalizacja zakładu.** Region zakładu (stan lub
  region wielostanowy) jest akceptowalny; precyzyjny adres ulicy,
  współrzędne GPS lub jakikolwiek identyfikator o szczegółowości
  wystarczającej do fizycznej identyfikacji zakładu na mapie NIE
  jest akceptowalny. Numer rejestracji zakładu jest uchwytem
  regulatora do zakładu; względy bezpieczeństwa fizycznego i
  bezpieczeństwa pracowników przemawiają przeciwko publikowaniu
  publicznego adresu na Bitcoinie. (R2)

- **Indywidualne wzorce personelu zmianowego produkcji.** Grafiki
  zmian, indywidualne rotacje pracowników, identyfikatory osobiste
  operatorów linii — żadne z tych nie pojawiają się w pieczęci.
  Wzorzec życia pojedynczych pracowników nie może być wywiedziony
  z publicznej atestacji. (R3)

- **Tożsamości dostawców, które naruszają kontrakty.** Nazwy
  dostawców, lokalizacje zakładów dostawców, kody partii dostawców
  (z wyjątkiem przypadku skażenia z łańcucha dostaw, gdy nazwanie
  skażonej partii dostawcy jest wymagane dla zdrowia publicznego i
  jest obsługiwane przez oddzielną zapieczętowaną publikację) NIE
  są publikowane w pieczęci zwolnienia. Wiele umów dostaw zawiera
  postanowienia o poufności; pieczęć ich domyślnie nie narusza. (R4)

- **Listy klientów i miejsca przeznaczenia dystrybucji poza
  poziomem wysokim.** Wysokopoziomowe regionalne podsumowanie jest
  akceptowalne; konkretne listy klientów (detaliści, centra
  dystrybucji, konta gastronomii) NIE są akceptowalne. Tożsamość
  klienta jest umownie poufna i konkurencyjnie wrażliwa;
  regulator uzyskuje listę klientów przez ustalone kanały
  koordynacji wycofania. (R5)

- **Twierdzenia o bezpieczeństwie lub wnioski prawne.** Zestaw nie
  zapieczętuje "ten produkt jest bezpieczny", "ta partia spełnia
  wszystkie obowiązujące normy bezpieczeństwa żywności", "to jest
  GRAS dla tego użycia" ani żadnego innego wniosku o
  bezpieczeństwie lub wniosku prawnego. Zestaw zakotwicza zapis
  testów i decyzję o zwolnieniu, a NIE wniosek o bezpieczeństwie.
  (R6)

- **Wzorce ponownej identyfikacji skarg pracowników lub
  sygnalistów.** Zestaw odmawia publikowania jakiegokolwiek wzorca,
  który mógłby ponownie zidentyfikować pracownika, który złożył
  skargę OSHA, USDA lub wewnętrzną firmową o praktykach
  bezpieczeństwa żywności lub bezpieczeństwa miejsca pracy. Tacy
  skarżący są chronieni na podstawie sekcji 402 FSMA i
  równoległych ustaw; pieczęć nie może stać się wektorem ponownej
  identyfikacji. Atestacje sygnalistów mają własny zestaw
  (`examples/whistleblower-manifest`) z regułami odmowy dostrojonymi
  do tego przypadku użycia. (R7)

- **Pieczętowanie przez kogokolwiek innego niż upoważniony
  principal zwalniającego producenta.** Niezależny certyfikator,
  zespół QA klienta lub niezależny audytor mogą użyć tego samego
  zestawu, aby zapieczętować WŁASNE ustalenia audytu; NIE mogą
  zapieczętować oryginalnej decyzji o zwolnieniu pod nazwą
  producenta. Podpisujący principal w FAKCIE 08 jest jedynym
  ważnym podpisującym dla tego. (R8)

Sama odmowa może być zapieczętowana jako fakt ("Ten producent
zażądał zapieczętowania X; zestaw odmówił zgodnie z regułą odmowy
Y"), tworząc publiczny zapis próby nadużycia.

---

## Co ten zestaw ZAPIECZĘTOWUJE

8 faktów w momencie zwolnienia:

1. **Powiadomienie przykładowe** — deklaruje publikację jako
   przykład (prawdziwe atestacje usuwają lub zastępują to).
2. **Identyfikacja produktu i partii** — nazwa produktu, kategoria,
   producent, region zakładu (NIE precyzyjna lokalizacja), wersja
   planu HACCP + hash, ID partii, daty produkcji / pakowania /
   przydatności do użycia, liczba jednostek konsumenckich, wymogi
   przechowywania, trzy krytyczne punkty kontrolne z hashami
   zapisanych logów (śmiertelność gotowania, stabilizacja
   chłodzenia, środowisko RTE po śmiertelności).
3. **Wyniki testów zwolnienia** — testy mikrobiologiczne produktu
   gotowego (Listeria, Salmonella, STEC, APC, Enterobacteriaceae),
   testy chemiczne / pozostałości (azotyn, pozostałości
   weterynaryjne, metale ciężkie), weryfikacja krzyżowego kontaktu
   z alergenami, podsumowanie monitoringu środowiskowego, każdy z
   SHA-256 pełnego raportu PDF i wyraźnym ograniczeniem
   interpretacji próbki kontra masy.
4. **Metodologia i kwalifikacja laboratorium** — która metoda (i
   która wersja dokumentu metody) była używana na wiersz, które
   laboratoria przeprowadziły które testy, status akredytacji
   ISO/IEC 17025:2017 każdego laboratorium i hash certyfikatu,
   ostatnie wyniki badania biegłości, oświadczenie o niezależności,
   zapis odchyleń / ponownych testów / OOS dla tej partii.
5. **Decyzja o zwolnieniu** — data zwolnienia, władza zwolnienia
   na poziomie roli + kontrasygnata, podsumowanie zapisu
   wspierającego decyzję, wysokopoziomowe miejsca przeznaczenia
   dystrybucji, zobowiązania po zwolnieniu uznane przy zwolnieniu,
   zobowiązanie dotyczące czasu i nieodwracalności.
6. **Zobowiązania do wycofania i nadzoru pomarketingowego** —
   żywnościowy odpowiednik nadzoru nad lekami: przejrzystość
   sygnałów chorobowych, zobowiązania wykonania wycofania (progi
   24 h / 72 h / 98%), reakcja na skażenie z łańcucha dostaw,
   zobowiązanie braku cichych ponownych testów, zobowiązanie braku
   po-hoc zmian specyfikacji, dzielenie zagregowanych sygnałów
   bezpieczeństwa.
7. **Ujawnienia towarzyszące i zapis odmów** — hash logu
   dochodzenia w sprawie działań naprawczych, ostatnia historia
   inspekcji, historia wycofań, znane otwarte kwestie w
   stosowanych metodach testów, powiązanie role-do-osoba
   (zapieczętowane oddzielnie, hashowane tu), gotowość
   śledzenia dostawców, jawna lista reguł odmowy R1-R8 z
   wszelkimi odmowami wykonanymi podczas tego zwolnienia.
8. **Principal podpisujący** — producent + sygnatariusz na
   poziomie roli (dyrektor QA) + kontrasygnata na poziomie roli
   (kierownik zakładu) + informacje o kluczu kryptograficznym;
   uzasadnienie publikacji na poziomie roli.

Każdy fakt kończy się konwencją bramy odmowy: *"Ten fakt
stwierdza tylko X. Nie stwierdza Y"* (gdzie Y jest najbliższym
trybem awarii z sekcji "NIE robi" powyżej).

---

## Przed czym ten zestaw broni

- **Cicha retroaktywna modyfikacja wyników testów zwolnienia.**
  Wszystkie PDF-y raportów testów są hashowane. Ponowne hashowanie
  po zwolnieniu ujawnia jakąkolwiek modyfikację.
- **Spory o to, które metody, które wersje dokumentów metod i
  które laboratoria były używane.** FAKT 04 zamraża metodologię
  i status akredytacji laboratorium przy zwolnieniu. Późniejsze
  twierdzenia "rzeczywiście użyliśmy MLG 4.13, a nie 4.12" są
  publicznie podlegające zaprzeczeniu.
- **Retroaktywne ponowne specyfikowanie dla partii
  niespełniającej specyfikacji.** Jeśli wynik testu zwolnienia
  był faktycznie graniczny PASS, który zostaje zreklasyfikowany
  jako FAIL po zwolnieniu, zapieczętowane hashe raportów dowodzą,
  co powiedział oryginalny PDF wyniku. Symetrycznie, graniczne
  OOS, które jest cicho ponownie testowane na PASS bez ujawnienia,
  jest wykrywalne, jeśli zobowiązanie FAKTU 06 braku cichych
  ponownych testów jest później porównywane z niezapieczętowaną
  poprawką.
- **Cicha minimalizacja zakresu wycofania.** Zobowiązania do
  wycofania w FAKCIE 06 (powiadomienie 24 h, inicjacja 72 h, 98%
  odzyskiwalności) są zapieczętowane; niedotrzymanie ich jest
  publicznie obserwowalne.
- **Po-hoc ponowna narracja historii działań naprawczych.** Hash
  logu działań naprawczych FAKTU 07 zamraża to, co firma
  POWIEDZIAŁA, że zrobiła po presumptywnym EMP; późniejsze
  twierdzenia "zrobiliśmy więcej / mniej niż to" są publicznie
  podlegające zaprzeczeniu.
- **Selektywne pominięcie ujawnień towarzyszących.** FAKT 07
  wylicza oczekiwane kategorie ujawnień (historia inspekcji,
  historia wycofań, przegląd zaleceń metod, gotowość śledzenia);
  pusta kategoria musi być wyraźnie zaświadczona ("brak w czasie
  zwolnienia"), więc późniejsze "nie zdaliśmy sobie sprawy, że
  to było istotne" jest publicznie podlegające zaprzeczeniu.
- **Podstawienie statusu akredytacji innego laboratorium.** FAKT
  04 zamraża zakres ISO 17025 każdego laboratorium i hash
  certyfikatu przy zwolnieniu; późniejsze podstawienie
  laboratorium nieakredytowanego jest publicznie wykrywalne.

Zestaw **nie** broni przed współczesną korupcją — zespół, który
celowo pieczętuje fałszywe wyniki testów w czasie zwolnienia,
produkuje kryptograficznie ważną pieczęć fałszywych wyników
testów. Prymityw jest co do tego uczciwy: to prymityw
nieodrzucalności dla współczesnych twierdzeń producenta, nie
dowód, że te twierdzenia są poprawne.

---

## Historyczny precedens śmiertelności

Zestaw wytworzyłby użyteczny zakotwiczenie — *nie rozwiązanie* —
w przeszłych niepowodzeniach bezpieczeństwa żywności. Aby uniknąć
zniesławienia osób (większość niepowodzeń bezpieczeństwa
żywności jest korporacyjna, nie indywidualna; niektóre są ścigane
karnie, a niektóre nie), te odniesienia opisują wybuch przez rok
i patogen oraz nazywają zaangażowany podmiot tylko wtedy, gdy
skażenie zostało publicznie przypisane przez powiadomienie o
wycofaniu lub zapis sądowy.

- **Fałszowanie melaminą mieszanek dla niemowląt i nabiału w
  Chinach w 2008 roku (Sanlu Group i inne).** Co najmniej sześć
  zgonów niemowląt i ~300 000 zachorowań przypisywanych
  produktom mlecznym z dodatkiem melaminy zaprojektowanych do
  oszukańczego zawyżania pozornej zawartości białka w testach
  azotu metodą Kjeldahla. Skazania nastąpiły w sądach ChRL,
  w tym wyroki śmierci. *Pieczęć nie zapobiegłaby temu* —
  melamina była poza standardowym panelem analitów. Pieczęć
  publicznie zobowiązałaby do tego, JAKI był panel, czyniąc
  zakres po-incydentowego rozszerzenia rutynowego skryningu
  jurydycznie jasnym.

- **Europejski wybuch STEC O104:H4 w 2011 roku (kiełki
  kozieradki śledzone do niemieckiej farmy).** 53 zgony, ~3950
  zachorowań w wielu krajach europejskich; ostatecznie śledzone
  do nasion kozieradki importowanych z Egiptu i wykiełkowanych
  u niemieckiego producenta. Śledzenie było utrudnione przez
  niespójną dokumentację na poziomie partii w wielokrajowym
  łańcuchu dostaw. *Pieczęć nie zapobiegłaby skażeniu partii
  nasion* (skażenie było powyżej testów producenta kiełków);
  zakotwiczyłaby to, co twierdziły testy zwolnienia producenta
  kiełków, a jeśli używana na poziomie importera nasion, co
  twierdziła obsługa importowanych nasion, czyniąc śledzenie
  szybszym.

- **Wybuch Listeria monocytogenes Blue Bell Creameries w 2015
  roku (Stany Zjednoczone).** 3 zgony, 10 zachorowań w wielu
  stanach; doprowadził do krajowego wycofania i federalnego
  skazania karnego Blue Bell w 2020 roku za wykroczeniowe
  zarzuty bezpieczeństwa żywności, przy czym firma zawarła
  umowę o odroczonym ściganiu i zapłaciła 19,35 miliona
  dolarów. Późniejsze postępowania cywilne. *Pieczęć nie
  zapobiegłaby* wewnątrzzakładowemu środowiskowemu skażeniu
  Listeria; zakotwiczyłaby jurydycznie zapisy programu
  monitoringu środowiskowego, czyniąc każde po-incydentowe
  pytanie "co pokazał EMP w miesiącach przed wybuchem"
  odpowiedzialne przeciwko odpornemu na manipulację zapisowi z
  znacznikiem czasu, a nie przeciwko później wytworzonym
  dokumentom.

- **Wieloczasowe wybuchy STEC O157:H7 w 2018 roku związane z
  sałatą rzymską (region uprawowy Yuma, potem region uprawowy
  Salinas).** Co najmniej 5 zgonów i ~210 zachorowań w
  wielokrotnych wybuchach tego roku. Śledzenie było skomplikowane
  przez produkt pakowany z mieszanego źródła. *Pieczęć nie
  zapobiegłaby* skażeniu na poziomie pola / wody nawadniającej
  (powyżej producenta); zakotwiczyłaby jurydycznie zapis
  testowania wejściowego i testowania zwolnienia każdego
  przetwórcy, czyniąc śledzenie szybszym, a publiczny zapis
  bardziej kryptograficznie obronnym przeciwko późniejszym
  sporom.

- **Wybuch Salmonella Typhimurium Peanut Corporation of America
  (2008-2009, Stany Zjednoczone).** 9 zgonów, ~714 zachorowań;
  spowodował federalne skazania karne kierownictwa PCA w
  2014-2015, w tym 28-letni wyrok więzienia dla CEO za spisek
  i utrudnianie. *Pieczęć nie zapobiegłaby* skażeniu,
  nie-dochodzeniu pozytywnych wewnątrzzakładowych testów
  Salmonella ani decyzji kierownictwa o wysyłce produktu
  wbrew tym pozytywnym ustaleniom. UCZYNIŁABY jurydycznie
  jasnym, na procesie, co POWIEDZIAŁY wyniki testów w
  momencie ich wygenerowania — czyniąc sprawę oskarżenia
  przeciwko współczesnym e-mailom z fałszywą narracją znacznie
  bardziej zakotwiczoną przeciwko modyfikacji dokumentacyjnej.

W każdym z tych przypadków zestaw zapewniłby czystszą jurydyczną
linię czasu. W żadnym z tych przypadków sam zestaw nie zapobiegłby
zgonom. Pieczęć jest infrastrukturą jurydyczną, nie infrastrukturą
zapobiegawczą. To rozróżnienie jest uczciwością zestawu.

---

## Kiedy używać tego zestawu

- Twoja operacja produkcyjna ma stabilny program HACCP / Kontroli
  Zapobiegawczych i chce dodać zakotwiczoną w Bitcoinie publiczną
  atestację jako warstwę odporną na manipulację na wierzch
  istniejącego przepływu pracy dokumentacji zwolnienia.
- Jesteś małym do średniej wielkości producentem lub producentem
  w jurysdykcji ze słabszą infrastrukturą regulacyjną i chcesz
  zakotwiczyć zapisy partii przeciwko globalnie weryfikowalnej
  linii czasu — dla zaufania na rynku eksportowym, dla reakcji
  na audyt klienta lub dla udziału w dobrowolnych inicjatywach
  przejrzystości.
- Jesteś inspektorem bezpieczeństwa żywności lub niezależnym
  certyfikatorem i chcesz opublikować odporną na manipulację
  pieczęć ustaleń audytowych przy podpisaniu, aby ustalenia
  audytowe nie mogły być cicho zmienione później na podstawie
  porozumienia między producentem a certyfikatorem.
- Spodziewasz się, że ta partia stanie w obliczu znacznej
  kontroli w dół (rynek eksportowy, kategoria wysokiego ryzyka
  jak RTE mięso lub mieszanki dla niemowląt, nowy składnik,
  ostatnia historia wycofań).
- Możesz opublikować wymieniony zestaw faktów bez łamania reguł
  odmowy R1-R8. Jeśli twoje fakty wymagałyby naruszenia R1-R8,
  nie używaj zestawu; najpierw popraw wejścia danych.
- Doradca producenta sprawdził plan publikacji. Publiczna
  publikacja artefaktu zawierającego identyfikator partii ma
  implikacje dla narażenia na odpowiedzialność za produkt;
  przegląd doradcy nie jest opcjonalny.

## Kiedy NIE używać tego zestawu

- **Nie używaj jako substytutu zapisów FSMA / FSIS / UE
  regulacyjnych.** Pieczęć jest *dodatkowa*, nie zastępcza.
  Twoje ustawowe zapisy zwolnienia, twój plan HACCP, twoje logi
  CCP i twój plan wycofania są niezmienione.
- **Nie używaj jako twierdzenia o bezpieczeństwie.**
  Zapieczętowanie przepuszczającego zapisu zwolnienia nie ustala,
  że produkt jest bezpieczny; ustala, że zapis miał tę
  zawartość bajtów w tym czasie. Reguła odmowy R6 odrzuci
  jakikolwiek wniosek o bezpieczeństwie.
- **Nie używaj do publikowania tożsamości dostawców, list
  klientów, imion pracowników ani adresów zakładów.** Reguły
  odmowy R1-R5 istnieją z powodów bezpieczeństwa ludzkiego i
  kontraktowych; nie modyfikuj zestawu, aby je obejść, bez
  konsultacji z doradcą.
- **Nie używaj pod presją zapieczętowania przed zakończeniem
  testowania zwolnienia.** Pieczęć z częściowymi danymi błędnie
  przedstawia stan decyzji o zwolnieniu.
- **Nie używaj jako teatru legitymizacji.** Pieczęć źle
  zaprojektowanego planu pobierania próbek lub źle wybranego
  panelu analitów jest trwałym publicznym zapisem
  nieadekwatności, nie obroną przed nią. Prymityw tnie w obie
  strony; to jest jego uczciwość.
- **Nie używaj podczas aktywnej sytuacji wycofania jako
  substytutu koordynacji wycofania przez regulatora.** Nowa
  publikacja MYRIAM zakotwicząjąca zakres wycofania jest
  odpowiednia PO inicjacji wycofania koordynowanego przez
  regulatora; nie jest substytutem kanału wycofania regulatora.

## Jak rozwidlić ten zestaw dla prawdziwego zwolnienia

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # zamień fikcyjną treść prawdziwą partią
                           # zastosuj reguły odmowy R1-R8 wszędzie
bash build/seal.sh         # ZAPIECZĘTUJ PRZED pierwszym ruchem dystrybucji
python3 build/verify.py    # potwierdź
```

**KRYTYCZNE TIMING:** zapieczętuj w momencie zwolnienia QA,
ZANIM partia zostanie dystrybuowana (zanim pierwsza ciężarówka
opuści zakład). Pieczęć po rozpoczęciu dystrybucji nadal ma
wartość, ale nie zakotwicza czysto stanu przed dystrybucją.
Właściwe okno to między podpisem zwolnienia QA a pierwszym
ruchem dystrybucji.

**KRYTYCZNY PRZEGLĄD:** przed zapieczętowaniem przepuść
publikację przez drugiego recenzenta QA (nie lidera) i przez
doradcę firmy. Po zapieczętowaniu publikacja jest trwała.

## Integracja z istniejącą infrastrukturą bezpieczeństwa żywności

- **FDA FSMA Kontrole Zapobiegawcze dla Żywności Ludzkiej (21
  CFR 117).** URL zapieczętowanej publikacji lub IPFS CID można
  odwoływać w dokumentacji Planu Bezpieczeństwa Żywności jako
  artefakt publicznej atestacji dla tej partii.
- **USDA FSIS plany HACCP i zapisy zwolnienia.** Zapieczętowany
  zapis zwolnienia znajduje się obok zapisów HACCP wymaganych
  przez FSIS; pieczęć odwołuje hash wersji planu HACCP (FAKT
  02), więc późniejsze spory o to, która wersja planu była w
  mocy, są publicznie podlegające zaprzeczeniu.
- **Codex Alimentarius / zasady HACCP** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Pieczęć zobowiązuje do wyjść siedmiu zasad
  HACCP (analiza zagrożeń, CCP, krytyczne limity, monitoring,
  działania naprawcze, weryfikacja, ewidencja) dla tej partii.
- **ISO 22000:2018 (Systemy Zarządzania Bezpieczeństwem
  Żywności).** Pieczęć można odwoływać jako część śladu dowodów
  przeglądu kierownictwa; nie zastępuje certyfikacji ISO 22000.
- **Schemat certyfikacji FSSC 22000 v6.** Kompatybilny jako
  dodatkowa warstwa przejrzystości; audytor FSSC może
  zweryfikować pieczęć podczas nadzoru.
- **Rozporządzenie UE (WE) 178/2002 (Ogólne Prawo Żywnościowe)
  Artykuł 18 (śledzenie) i Artykuł 19 (powiadomienie o
  wycofaniu).** Pieczęć zobowiązuje producenta do gotowości
  śledzenia jeden poziom wstecz (FAKT 07) i zobowiązań do
  wycofania (FAKT 06); nie zastępuje ustawowego zobowiązania
  powiadomienia z Artykułu 19.
- **Pakiet Higieniczny UE (Rozporządzenia 852/2004, 853/2004,
  854/2004, 882/2004).** Kompatybilny; pieczęć odwołuje
  ekwiwalent zapisów HACCP i własnych kontroli Pakietu
  Higienicznego.
- **Schematy prywatnych standardów BRCGS / SQF.** Kompatybilne
  jako dodatkowa warstwa przejrzystości.
- **Systemy nadzoru zdrowia publicznego (CDC PulseNet, FoodNet,
  IFSAC; UE EFSA / ECDC).** Bezpośrednio poza zakresem
  pieczęci, ale FAKT 06 zobowiązuje producenta do uczestnictwa
  i zapieczętowania jakichkolwiek zdarzeń korelacji sygnałów
  jako nowych publikacji MYRIAM.

## Czego ten zestaw NIE zastępuje

- Rejestracji Zakładu Żywnościowego FDA lub zatwierdzenia
  Zakładu USDA FSIS.
- Twojego pisemnego Planu Bezpieczeństwa Żywności / Planu HACCP
  zgodnie z FSMA / FSIS.
- Logów monitoringu CCP i zapisów działań naprawczych.
- Nadzoru akredytacji laboratoriów ISO 17025.
- Programów badania biegłości.
- Inspekcji regulatora (ciągła inspekcja FSIS, okresowa
  inspekcja FDA, inspekcja właściwego organu UE).
- Nadzoru zdrowia publicznego (CDC, EFSA, ECDC, krajowe
  ekwiwalenty).
- Kanałów koordynacji wycofania (FDA Reportable Food Registry,
  koordynacja wycofania FSIS, UE RASFF, krajowe ekwiwalenty).
- Bezpieczeństwa pracowników i programów szkoleniowych
  pracowników żywności.

## Dlaczego ten zestaw istnieje w v0.4.0+

To jeden z opracowanych przykładów dostarczanych z myriam-kit.
Stosuje strukturę README zorientowaną najpierw na ograniczenia,
zwalidowaną przez autoresearch udokumentowane w
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — wariant podpowiedzi
zorientowany najpierw na ograniczenia uzyskał najwyższą ocenę w
ważonej rubryce w wielu domenach przykładowych, ponieważ atestacja
bezpieczeństwa żywności to dokładnie ta domena, w której zawyżanie
tego, co pieczęć udowadnia, jest niebezpieczne: ludzie umarli,
umrą, w niepowodzeniach, którym pieczęć nie może zapobiec.
Początkowe sekcje są nośnymi częściami zestawu; treść manifestu
jest częścią łatwą.

Domyślne ustawienia zestawu są celowo konserwatywne co do
publikacji imion pracowników, konserwatywne co do precyzji
lokalizacji zakładu, konserwatywne co do tożsamości dostawców i
klientów oraz agresywne co do zastrzeżenia "to nie ustanawia
bezpieczeństwa". Społeczność bezpieczeństwa żywności ma
udokumentowaną historię zawyżanego języka certyfikacyjnego;
zestaw domyślnie przyjmuje pozycję najmniej prawdopodobną do
odczytania jako gwarancja bezpieczeństwa. Producenci w
jurysdykcjach, w których konkretne wymagania publicznego
ujawnienia różnią się, mogą odpowiednio zmodyfikować swoje
rozwidlenie, ale domyślne odmowy faworyzują bezpieczeństwo
pracowników i uczciwy zakres.

## Licencja

Domena publiczna (CC0). Rozwidl. Atrybucja niewymagana.
