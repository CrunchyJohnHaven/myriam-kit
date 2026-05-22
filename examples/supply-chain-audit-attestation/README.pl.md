*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw pieczęci atestacji audytu łańcucha dostaw

Gotowy do użycia przykład myriam-kit dla niezależnych audytorów
społecznych / pracowniczych / środowiskowych, wewnętrznych zespołów
zgodności dostawców, śledczych łańcucha dostaw z organizacji
pozarządowych oraz organizacji praw pracowniczych, którzy chcą
opublikować zakotwiczoną w Bitcoinie, odporną na manipulację pieczęć
raportu audytowego w dokładnym momencie podpisania.

---

## Czego ten zestaw NIE robi (przeczytaj najpierw)

Pieczęć jest kryptograficznym znacznikiem czasu tego, co audytor
podpisał. Nie może zweryfikować, czy to, co zostało podpisane, jest
**prawdziwe**. Następujące tryby awarii są **poza domeną pieczęci**:

1. **Przejęcie audytu przez przemysł.** Audyty zlecane przez marki
   mają długą, udokumentowaną historię produkowania miękkich
   ustaleń wobec dostawców, których kontynuowana współpraca z marką
   zlecającą utrzymuje płynność potoku audytów. Przejęty audyt, gdy
   zostanie zapieczętowany, produkuje trwały zapis sądowy
   przejętego audytu. Pieczęć nie koryguje przejęcia — czyni tylko
   audyt-tak-jak-wydany niezmiennym, aby późniejszy proces
   poszukiwania prawdy miał coś konkretnego do porównania.

2. **Przeszkoleni pracownicy / przygotowane zakłady.** Zapowiadane
   lub półzapowiadane audyty dają kierownictwu dni lub tygodnie na
   przećwiczenie odpowiedzi pracowników, ukrycie nieletnich
   pracowników, posprzątanie sypialni, usunięcie niezgodnego
   sprzętu i przekierowanie pracy do nieaudytowanych
   podwykonawców podczas okna audytowego. Pieczęć zakotwicza to,
   co audytorom pokazano, nie to, czego im nie pozwolono zobaczyć.

3. **Ukryte podwykonawstwo.** Podwykonawstwo Tier-2 i Tier-3,
   praca chałupnicza i produkcja w sektorze nieformalnym są
   powszechnie niewidoczne dla audytów na poziomie zakładu.
   Pieczęć zakotwicza audyt Tier-1; nie może wykryć, że Tier-1
   zleca podwykonawstwo nieaudytowanemu Tier-2 podczas okna
   audytowego lub rutynowo.

4. **Audyty, które systematycznie nie dostrzegają nadużyć, na
   które są ukierunkowane.** Rana Plaza, zawalenie budynku
   fabryki odzieżowej w Bangladeszu w 2013 roku, które zabiło
   1134 pracowników, było audytowane przez wiele programów
   audytowych zleconych przez marki w miesiącach poprzedzających.
   Pęknięcia w budynku nie były na liście kontrolnej audytu
   społecznego; reżim audytowy nie miał zakresu inżynierii
   strukturalnej. Audyty zakotwiczają to, co jest *w zakresie*;
   nadużycia poza zakresem pozostają niewidoczne, niezależnie od
   tego, jak odporna na manipulację jest pieczęć.

5. **Odwet po podpisaniu wobec pracowników uczestniczących w
   wywiadach.** Nawet przy odmówionych informacjach lokalizacyjnych
   (FAKT 07 R3), zdeterminowany przeciwnik znający ID dostawcy
   może zidentyfikować zakład. Ochrona pracowników wymaga więcej
   niż tylko odmowy PII w pieczęci — wymaga anonimizacji powyżej
   w metodologii audytu. Pieczęć czyni audyt-tak-jak-wydany
   trwałym; nie chroni wstecznie przeprowadzonych z wywiadami.

6. **Warunki pracownicze legalne, ale nieludzkie.** Luki płacy
   życiowej w jurysdykcjach, w których prawne minimum płacy jest
   poniżej wskaźnika płacy życiowej, produkują "zgodne" ustalenia
   audytowe wobec praw o płacach i godzinach pracy oraz
   "niezgodne" ustalenia wobec standardów płacy życiowej w tym
   samym audycie (FAKT 03 element 8 w tym przykładowym zestawie).
   Pieczęć zakotwicza to, co zgłasza każdy standard; pogodzenie
   ich jest pracą polityczną w dół.

7. **Szkody klimatyczne / środowiskowe z rozproszoną przyczynowością.**
   Emisje węgla, wkład w wylesianie, wyczerpanie wody i uwolnienia
   zanieczyszczeń od dostawców mogą być zapieczętowane w
   ustaleniach audytowych, ale przyczynowe przypisanie do wolumenu
   zamówień konkretnej marki jest metodologicznie sporne. Pieczęć
   zakotwicza to, co zostało zmierzone u dostawcy; nie przypisuje
   odpowiedzialności moralnej ani prawnej.

8. **Spory o to, który standard jest miarodajny.** SA8000 vs.
   BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs.
   kodeks postępowania specyficzny dla firmy: każdy ma inne
   zakresy, surowości i procesy naprawcze. Pieczęć zakotwicza
   *jeden* audyt według *jednego* standardu. Porównanie
   międzystandardowe jest problemem w dół.

9. **Kompetencja audytora vs. poświadczenie audytora.**
   "Poświadczony" to nie "kompetentny". Audytorzy, którzy ukończyli
   akredytowane programy szkoleniowe, przeoczyli poważne nadużycia
   w audytach poprzedzających publicznie widoczne katastrofy.
   Pieczęć zakotwicza poświadczenia; nie certyfikuje kompetencji,
   z jaką zostały wykonane.

**Sekcja o uczciwych ograniczeniach powyżej jest nośną częścią tego
zestawu.** Marka, która chce teatru legitymizacji, użyje
zapieczętowanego audytu jako tarczy. Zestaw musi powiedzieć wprost:
to jest *prymityw nieodrzucalności dla momentu podpisania raportu
audytowego*, nie dowód zgodności dostawcy lub dobrobytu pracownika.

---

## Czego ten zestaw MUSI ODMÓWIĆ pieczętowania

Zestaw jest skonfigurowany do odrzucania następujących wzorców faktów,
nawet jeśli zgłosi je użytkownik z ważnym uprawnieniem organu
audytowego:

- **Indywidualna identyfikacja pracownika.** Żaden fakt nie może
  nazywać pracownika, łączyć cytatu z pracownikiem, ujawniać numeru
  odznaki, pozycji na linii, pokoju sypialnego, harmonogramu zmian,
  kombinacji demograficznej z N<5 lub jakiegokolwiek pola, które
  mogłoby ponownie zidentyfikować osobę uczestniczącą w wywiadach.
  Cytaty pracowników używają losowych tokenów; mapowanie nigdy nie
  jest pieczętowane.
- **Źródła sygnalistów / informatorów.** Jeśli ustalenie opiera się
  na ujawnieniu przez osobę, która podjęła ryzyko ujawnienia, osoba
  ta nigdy nie jest nazwana ani zidentyfikowana w zapieczętowanej
  publikacji.
- **Precyzyjne informacje lokalizacyjne.** Brak adresu ulicy, GPS,
  obrazu satelitarnego >1km rozdzielczości lub zewnętrznej fotografii
  budynku. Kraj i region to maksymalna rozdzielczość pieczętowana.
  Uzasadnienie: identyfikacja zakładu umożliwia odwet wobec
  uczestników wywiadów.
- **Roszczenie o czystym audycie.** Zestaw odmawia zapieczętowania
  jakiegokolwiek sformułowania formy "ten audyt dowodzi, że dostawca
  jest zgodny" lub "żadne naruszenia nie istnieją". Roszczenia o
  czystości są epistemicznie niepoparte przez metodologię audytową.
- **Zastąpienie pieczęć-jako-certyfikat.** Publikacja pomijająca
  metodologię (FAKT 04), niezależność (FAKT 06) lub odmowy (FAKT 07)
  nie jest legalną publikacją MYRIAM w ramach tego zestawu.
- **Wersje robocze / audyty przed podpisaniem.** Pieczętowanie
  następuje przy podpisaniu, nie wcześniej. Tymczasowe audyty
  tworzą fałszywą pewność.
- **Po-hoc korzystne ponowne zapieczętowanie.** Zrewidowany audyt
  wymaga NOWEJ zapieczętowanej publikacji odwołującej się do
  oryginału przez korzeń Merkle. Oryginalny zapieczętowany audyt
  pozostaje na stałe widoczny jako audyt-tak-jak-wydany.
- **Pieczętowanie przez jakąkolwiek stronę inną niż organ
  audytowy.** Marka, dostawca, jednostka certyfikująca lub strona
  trzecia nie mogą zapieczętować "audytu" w imieniu organu
  audytowego, który podpisał raport.

Sama odmowa może być zapieczętowana jako fakt ("Ta strona zażądała
zapieczętowania X; zestaw odmówił zgodnie z regułą odmowy Y"),
tworząc publiczny zapis próby nadużycia. **W przemyśle z powszechnym
przejęciem audytu odmowa zapieczętowania może sama w sobie być
znaczącym sygnałem:** organ audytowy, który nie chce zapieczętować,
ponieważ marka wywarła presję na złagodzenie ustaleń, ma opcję
publicznego zarejestrowania odmowy pod własnym principalem.

---

## Co ten zestaw ZAPIECZĘTUJE

8 faktów w momencie podpisania audytu:

1. **Powiadomienie przykładowe** — deklaruje publikację jako przykład
   (prawdziwe atestacje usuwają lub zastępują to).
2. **Zakres i podmiot audytu** — standard audytowy, organ audytowy,
   główny audytor, rozmiar zespołu audytowego, identyfikator
   dostawcy (brak precyzyjnych informacji lokalizacyjnych), okno
   audytowe, rodzaj zapowiedzenia (zapowiedziany / półzapowiedziany /
   niezapowiedziany), data raportu audytowego, wersja podpisana,
   nazwane marki odbiorców, strona zlecająca.
3. **Manifest ustaleń audytowych** — zgodność / minor-NC / major-NC /
   critical-NC na element wobec standardu, każde z SHA-256 pełnego
   opisu ustalenia. Sumy zagregowane. Rekomendacja certyfikacyjna
   przy podpisaniu.
4. **Metodologia i dowody** — alokacja czasu na miejscu, liczba
   wywiadów (ze stratyfikacją: płeć, status migracyjny, staż),
   podział formatu wywiadu, relacja tłumacza, przegląd dokumentów z
   rozmiarami próbek i hashami treści, artefakty wizyty na miejscu
   (z rozmytymi twarzami pracowników), znane ograniczenia
   metodologii.
5. **Zobowiązane działania naprawcze** — CAP na major-NC i na
   minor-NC z określoną przyczyną źródłową, terminem, mechanizmem
   weryfikacji, zobowiązaniami eskalacji, zobowiązaniem braku
   cichego rozluźnienia.
6. **Kwalifikacje audytora i niezależność** — akredytacja organu
   audytowego, koncentracja klientów, poświadczenia głównego
   audytora i kompetencja językowa, doświadczenie sektorowe,
   deklaracje niezależności (audytor-dostawca, audytor-marka,
   rozdzielenie jednostki certyfikującej).
7. **Ujawnienia towarzyszące i zapis odmów** — konflikty interesów
   (wyraźnie), historia poprzednich audytów, komunikowane kanały
   głosu pracowników, równoległe dochodzenia, wewnętrzny sprzeciw
   organu audytowego, lista reguł odmowy, odmowy faktycznie
   wykonane w tym audycie.
8. **Principal podpisujący** — organ audytowy, główny audytor,
   zespół audytowy, oficer autoryzujący, informacje o kluczu
   kryptograficznym.

Każdy fakt kończy się konwencją bramy odmowy: *"Ten fakt stwierdza
tylko X. Nie stwierdza Y"* (gdzie Y jest najbliższym trybem awarii
z sekcji "NIE robi").

---

## Przed czym ten zestaw broni

- **Ciche po-podpisaniu łagodzenie poważnych niezgodności.**
  Jakakolwiek zmiana w FAKCIE 03 (np. MAJOR_NC zreklasyfikowane na
  MINOR_NC lub ustalenie całkowicie usunięte) produkuje inny
  SHA-256, inny korzeń Merkle, zawodzi weryfikację OTS.
- **Antydatowanie zamknięć działań naprawczych.** FAKT 05 zamraża
  CAP i jego terminy przy podpisaniu; każde twierdzenie "zamknęliśmy
  to NC w zeszłym miesiącu", które jest sprzeczne z zapieczętowanymi
  terminami, jest publicznie porównywalne.
- **Rewizjonizm metodologiczny.** FAKT 04 zamraża liczbę wywiadów,
  rozmiary próbek dokumentów i godziny na miejscu przy podpisaniu —
  zapobiegając temu, by późniejsza obrona "przeprowadziliśmy
  dogłębne dochodzenie" stała się niefalsyfikowalna.
- **Selektywna ponowna publikacja pomijająca niekorzystne
  ustalenia.** Wszystkie 8 faktów jest powiązanych pojedynczym
  korzeniem Merkle; cytowanie niektórych faktów przy pomijaniu
  innych jest wykrywalne z opublikowanej listy liści.
- **Dryf roszczeń o niezależności.** FAKT 06 zamraża deklaracje
  niezależności na moment podpisania. Późniejsze twierdzenie "ten
  audyt był rygorystycznie niezależny" musi zmierzyć się z
  zapieczętowanym procentem koncentracji klientów i zapieczętowanym
  ujawnieniem zlecenia płaconego przez markę.
- **Wymazanie zapisu odmów.** FAKT 07 zamraża, które wzorce faktów
  zestaw odrzucił; każde późniejsze twierdzenie "nigdy niczego nie
  odmówiliśmy" zaprzecza zapieczętowanemu zapisowi.

---

## Przypadki historyczne lub niedaleko historyczne, w których zestaw by pomógł

Zestaw wytworzyłby użyteczne **sądowe zakotwiczenie** — *nie naprawę
ani zapobieganie* — w przypadkach obejmujących:

- **Rana Plaza (Bangladesz, 2013).** Zawalenie budynku Rana Plaza
  zabiło 1134 pracowników odzieżowych i raniło ~2500. Wiele marek,
  których produkty były produkowane w budynku, audytowało dostawców
  Tier-1 w budynku krótko przed zawaleniem. Audyty używały list
  kontrolnych audytu społecznego, które nie obejmowały zakresu
  inżynierii strukturalnej. Zapieczętowany fakt metodologiczny (FAKT
  04) przy każdym z tych audytów uczyniłby *lukę zakresu* publicznie
  widoczną przy podpisaniu — zakotwiczając udokumentowane
  ograniczenie, którego programy audytowe wstecznie twierdziły, że
  nie miały. Pieczęć nie zapobiegłaby zawaleniu. Zapobiegłaby temu,
  by po-zawaleniowe twierdzenie przemysłu, że "nikt nie wiedział",
  było epistemicznie utrzymywalne.

- **Apple / Foxconn audyty (lata 2010).** Wielokrotne iteracje
  raportów audytowych zakładów Foxconn produkujących dla Apple
  zostały opublikowane z różnymi poziomami surowości ustaleń,
  kontekstem klastra samobójstw pracowniczych i twierdzeniami o
  naprawie. Zapieczętowany zapis momentu podpisania dla każdego
  audytu zapobiegłby późniejszym sporom o "co powiedział audyt w
  tym czasie" od zależności od kopii archiwalnych, ujawnionych
  kopii lub zrewidowanych oficjalnych wydań.

- **Kobalt z DRC (trwa).** Górnictwo kobaltu rzemieślniczego w
  Demokratycznej Republice Konga, w tym przez dzieci, zasila
  łańcuchy dostaw baterii dla głównych marek elektroniki i EV.
  Wielokrotne audyty zlecone przez marki w okresie 2017–obecnie
  produkują ustalenia o różnej surowości. Zestaw zastosowany do
  każdego audytu przy podpisaniu zakotwiczyłby audyt-tak-jak-wydany;
  zestaw zastosowany do faktów ujawnień towarzyszących (FAKT 07
  C2: historia poprzednich audytów) uczyniłby metodologiczne
  dziedziczenie poprzednich luk przez każdego kolejnego audytora
  publicznie widoczne.

- **Minerały konfliktowe (cyna, tantal, wolfram, złoto z DRC i
  regionu Wielkich Jezior).** Dodd-Frank §1502 stworzył obowiązki
  audytu-i-ujawnienia w ramach SEC rule 13p-1. Spory o adekwatność
  audytów na poziomie wytapiarni i weryfikację łańcucha pochodzenia
  w dół powtarzały się w okresie 2014–2022. Pieczęcie MYRIAM na
  audyt zakotwiczyłyby każdy audyt wytapiarni przy podpisaniu.

- **Audyty zlecone przez marki łańcuchów dostaw bawełny z Xinjiangu
  (2018–obecnie).** Spory o to, czy audyty mogą być rzetelnie
  prowadzone w ramach restrykcji rządu ChRL na dostęp audytorów,
  pojawiły się szeroko po 2020 roku. Zapieczętowany fakt
  metodologiczny (FAKT 04) przy każdym audycie zakotwiczyłby, jakie
  warunki dostępu faktycznie obowiązywały — czyniąc późniejsze
  twierdzenia "przeprowadziliśmy rygorystyczny audyt" porównywalne
  z zapieczętowanymi ograniczeniami metodologicznymi w tym czasie.

- **Podwykonawstwo Foxconn i raporty odpowiedzialności dostawców
  Apple w latach 2010 — powtarzające się odkrycia nieletnich
  pracowników, ukrytych sypialni, naruszeń godzin pracy.** Pieczęcie
  na audyt zakotwiczyłyby *negatywne ustalenia* w audytach, które
  nic nie znalazły, obok *pozytywnych ustaleń* w audytach, które
  znalazły naruszenia — zapobiegając wstecznemu wybiórczemu
  cytowaniu z dowolnego kierunku.

Zestaw NIE zapobiegłby żadnemu z nich. W kilku przypadkach
podstawowym problemem było to, że audyt *przeoczył* nadużycie —
zapieczętowanie czystego audytu, który powinien był znaleźć
naruszenia, produkuje trwały zapis nieudanego audytu, który jest
innym rodzajem pożytecznego (zakotwicza niepowodzenie dla
późniejszej odpowiedzialności), ale nie tym samym, co zapobieganie.

---

## Kiedy używać tego zestawu

- Jesteś organem audytowym wprowadzającym praktykę "publikujemy to,
  co podpisaliśmy" jako obronę przed presją łagodzenia po
  podpisaniu.
- Jesteś organizacją pozarządową prowadzącą równoległe dochodzenie
  łańcucha dostaw i chcesz odporny na manipulację punkt
  referencyjny w momencie zamknięcia dochodzenia.
- Jesteś organizacją praw pracowniczych, która uzyskała raport
  audytowy i chcesz zakotwiczyć jego bieżącą zawartość, zanim
  organ audytowy lub marka będzie miała szansę go zrewidować.
- Jesteś marką zaangażowaną w przejrzystość co do audytów, które
  zleciłaś, i chcesz weryfikowalnego zapisu sądowego.
- Jesteś dziennikarzem, regulatorem lub sądem zakotwiczającym
  zawartość konkretnego audytu w konkretnym momencie dla
  późniejszego sporu sądowego lub reportażu.

## Kiedy NIE używać tego zestawu

- **Nie używaj jako substytutu dla monitorowania prowadzonego
  przez pracowników, niezależnych dochodzeń NGO ani organizowania
  pracowniczego.** Zestaw jest *dodatkowy*, nie substytucyjny dla
  żadnego z nich.
- **Nie używaj do twierdzenia, że dostawca jest zgodny.** Czysty
  zapieczętowany audyt to w najlepszym razie jeden wkład do
  oceny zgodności. Traktowanie zapieczętowanego audytu jako
  certyfikatu zgodności to dokładnie teatr legitymizacji, któremu
  reguły odmowy zorientowane najpierw na ograniczenia mają
  zapobiegać.
- **Nie używaj w środku audytu.** Zapieczętowanie przed podpisaniem
  tworzy fałszywie pozytywny zapis "to jest końcowy raport
  audytowy".
- **Nie używaj do zapieczętowania wersji roboczej, którą zamierzasz
  zrewidować.** Każda wersja podpisana otrzymuje własną pieczęć;
  rewizje odwołują się do oryginałów przez korzeń Merkle.
- **Nie używaj pod presją zapieczętowania wcześniej niż przy
  podpisaniu lub pominięcia ujawnienia faktu towarzyszącego.**
  Odmów i (jeśli twój principal pozwala) zapieczętuj odmowę.
- **Nie używaj jako podstawy roszczenia marketingowego "fair
  trade" lub "etyczne zaopatrzenie" bez ujawnienia ograniczeń
  zapieczętowanej metodologii obok pieczęci.** Cytowanie pieczęci
  bez cytowania ograniczeń to tryb awarii teatru legitymizacji,
  który definiuje przejęcie audytu.
- **Nie używaj, jeśli twój organ audytowy jest strukturalnie
  przejęty i nie może publikować ustaleń przeciwko interesowi
  komercyjnemu marki zlecającej.** W takim przypadku
  zapieczętowanie produkuje trwały publiczny zapis przejętego
  audytu. To może być nadal wartościowe — ale to nie to samo, co
  obrona przed przejęciem.

---

## Jak rozwidlić ten zestaw dla prawdziwego audytu

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # zamień fikcyjną treść prawdziwą
bash build/seal.sh        # ZAPIECZĘTUJ PRZY podpisaniu, nie wcześniej, nie później
python3 build/verify.py   # potwierdź
```

**Krytyczne timing:** zapieczętuj PRZY momencie podpisania — tj.,
gdy główny audytor podpisuje końcowy raport i staje się on
oficjalnym stanowiskiem organu audytowego. Pieczęć przed
podpisaniem tworzy fałszywie pozytywny zapis "to jest końcowy
audyt". Pieczęć długo po podpisaniu jest jurydycznie słabsza
przeciwko pośrednim modyfikacjom.

---

## Integracja z istniejącą infrastrukturą audytu łańcucha dostaw

Zestaw jest zaprojektowany do współdziałania, nie zastępowania:

- **SA8000 (Social Accountability International).** Raporty audytu
  SA8000 i dokumenty CAP mapują naturalnie do FAKTU 03 + FAKTU 05.
  Odniesienie do akredytacji SAAS pasuje do FAKTU 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Ustalenia audytu RBA mapują do FAKTU 03; zasady
  niezależności firmy audytowej RBA mapują do FAKTU 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Ustalenia audytu
  SMETA 2-filarowego i 4-filarowego mapują do FAKTU 03; platforma
  Sedex hostuje surowy raport — pieczęć MYRIAM zakotwicza hash
  treści raportu hostowanego na platformie.
- **amfori BSCI.** Mechanika oceny BSCI A–E mapuje do rekomendacji
  certyfikacyjnej FAKTU 03; zlecanie członkostwa marki mapuje do
  ujawnienia koncentracji klientów FAKTU 06 i FAKTU 07 C1.
- **FSC łańcuch pochodzenia.** Dla łańcuchów dostaw produktów
  leśnych certyfikaty łańcucha pochodzenia i harmonogramy
  ponownych audytów pasują do struktury okna audytowego i CAP.
- **B Lab / B Corp ocena wpływu.** Certyfikacja B Corp nie jest
  audytem strony trzeciej w sensie SA8000, ale raporty weryfikatora
  oceny wpływu mogą być zapieczętowane w ramach tego zestawu (z
  faktami przekierowanymi na ocenę wpływu, a nie audyt pracowniczy).
- **ISO 26000.** ISO 26000 to wskazówka, nie certyfikowalne;
  zestaw nie ma bezpośredniej integracji raportu audytu ISO 26000,
  ale taksonomia odpowiedzialności społecznej może informować
  strukturę elementów FAKTU 03 dla audytów wewnętrznych.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  inne reżimy sektorowe).** Programy audytu specyficzne dla
  sektora mogą być zapieczętowane w ramach tego zestawu; pole
  standardu audytowego FAKTU 02 identyfikuje, który.
- **Fair Labor Association.** Raporty monitorowania fabryki FLA
  mapują do FAKTU 03 + FAKTU 05; ramy niezależnego monitora FLA
  mapują do deklaracji niezależności FAKTU 06.
- **Higg Index (Sustainable Apparel Coalition).** Wyniki na
  poziomie zakładu Higg FEM (Facility Environmental Module) i Higg
  FSLM (Facility Social & Labor Module) mogą być zapieczętowane w
  ramach tego zestawu.
- **UE CSRD / CSDDD.** Dyrektywa UE o sprawozdawczości
  zrównoważonego rozwoju przedsiębiorstw i Dyrektywa o
  należytej staranności w zakresie zrównoważonego rozwoju
  przedsiębiorstw tworzą obowiązki ujawniania, których dokumenty
  weryfikacyjne mogą być zapieczętowane w ramach tego zestawu.
  Zestaw zakotwicza ujawnienie-tak-jak-wydane, nie jego
  merytoryczną adekwatność.

## Czego ten zestaw NIE zastępuje

- Monitorowania prowadzonego przez pracowników (najbardziej
  niezawodny sygnał wykrywania nadużyć w jakimkolwiek łańcuchu
  dostaw)
- Niezależnych dochodzeń NGO (CCC, Labour Behind the Label, China
  Labour Bulletin, Workers' Rights Consortium itp.)
- Inspekcji regulacyjnych (krajowe biura pracy, ekwiwalenty OSHA,
  programy biur krajowych ILO)
- Organizowania pracowniczego i rokowań zbiorowych
- Sporów sądowych, arbitrażu i naprawy w ramach krajowego prawa
  pracy
- Ram należytej staranności po stronie marki (UNGP, OECD Due
  Diligence Guidance, UE CSDDD)

## Licencja

Domena publiczna (CC0). Rozwidl. Atrybucja niewymagana.
