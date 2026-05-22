*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw pieczęci atestacji wydatków publicznych

Gotowy do użycia przykład myriam-kit dla samorządów miejskich,
stanowych, prowincjonalnych i krajowych, które chcą kryptograficznie
zakotwiczyć zapisy wykonania budżetu (przyznania kontraktów, wypłaty,
odbiory rezultatów) w momencie wydania, tak aby ciche, wsteczne
modyfikacje zapisów wydatków publicznych stały się publicznie
wykrywalne.

Pieczęć jest **kotwicą sądową**, nie certyfikatem integralności.
Rejestruje to, co organ finansowy zgłosił w dniu zgłoszenia, w formie,
której później nie można cicho zmienić bez wytworzenia publicznie
widocznej niezgodności kryptograficznej.

---

## Czego ten zestaw NIE robi (przeczytaj najpierw)

Pieczęć jest kryptograficznym znacznikiem czasu tego, co zostało
zaświadczone. Nie może zweryfikować, czy zaświadczone było **legalne,
sprawiedliwe lub uczciwe**. Następujące tryby awarii są **poza domeną
pieczęci**:

1. **Korupcja na wyższym etapie i łapówki.** Jeśli zamówienie
   publiczne zostało sfałszowane, dostawca został wybrany z powodu
   przekupstwa, uzasadnienie wyboru jednego źródła zostało
   sfabrykowane lub kontrakt został zawyżony o uzgodniony procent
   łapówki — pieczęć zakotwicza zarejestrowaną transakcję z
   zawyżoną ceną i preferowanym dostawcą z wysoką integralnością.
   Pieczęć obserwuje wyjście systemu finansowego; nie ma
   widoczności korupcji powyżej wydania. Brazylijska *Operação Lava
   Jato* udokumentowała systematyczne ~3% łapówki administrowane
   przez kartel w tysiącach kontraktów Petrobras, które zostałyby
   zapieczętowane przy wydaniu jako całkowicie rutynowe.

2. **Ukrywanie własności beneficjalnej przez spółki-przykrywki.**
   Kontrakt przyznany "Acme Construction Ltd." jest pieczętowany z
   nazwą podmiotu w publicznym rejestrze. Jeśli "Acme" jest w
   rzeczywistości kontrolowane przez nieujawnioną osobę zajmującą
   eksponowane stanowisko polityczne lub jest jedną z dziesiątek
   spółek-przykrywek kontrolowanych przez jeden kartel, pieczęć
   zakotwicza powierzchowny podmiot. Przejrzystość własności
   beneficjalnej to ODDZIELNY reżim (Rekomendacja FATF 24, UE
   5AMLD/6AMLD, US Corporate Transparency Act), którego wyjście
   wymaga własnego protokołu pieczętowania.

3. **Oszustwo księgowe powyżej wydania.** Jeśli sam organ finansowy
   fabrykuje zapis przed jego zapieczętowaniem — kontrakty-widma,
   pracownicy-duchy na liście płac, fikcyjne odbiory rezultatów —
   pieczęć zakotwicza fabrykację. Pieczęć nie może wykryć, że
   zapis jest fałszywy w momencie jego zarejestrowania; może
   wykryć tylko, że zapis został zmieniony PO zapieczętowaniu.

4. **Selektywna publikacja / wybór wisienek.** Organ finansowy
   mógłby opublikować *podzbiór* transakcji — czyste — i
   zapieczętować tylko je. Pieczęć zakotwicza to, co jest w
   publikacji; nie zakotwicza całości transakcji, które powinny
   były być w publikacji. FAKT 07 tego zestawu (ujawnienia
   towarzyszące i zapis odmów) jest strukturalną obroną, ale
   zależy od organu wydającego, który jest uczciwy co do tego,
   czego decyduje się nie pieczętować.

5. **Wydatki pozaksięgowe lub pozabudżetowe.** Wydatki publiczne
   prowadzone przez przedsiębiorstwa państwowe, fundusze majątku
   suwerennego, podmioty celowe lub pozabudżetowe konta
   powiernicze mogą nie pojawić się w budżecie, który pieczęć
   zakotwicza. Pieczęć rejestruje to, co zostało zgłoszone w
   ramach systemu budżetowego; wydatki poza systemem są poza
   domeną pieczęci. Spory Tymczasowego Organu Koalicyjnego Iraku
   (CPA) z lat 2003-2004 dotyczyły około 9 miliardów USD wypłat
   gotówkowych, których zapisy zostały częściowo utracone;
   zapieczętowanie istniejących zapisów w momencie wypłaty
   zakotwiczyłoby je, ale nie utworzyłoby zapisów, których CPA
   nie prowadziła.

6. **Po-wydaniowa presja "wyjaśniania".** Zapieczętowane
   przekroczenie, zapieczętowane wybór jednego źródła lub
   zapieczętowane zlecenie zmiany może być później ponownie
   opowiedziane z dowolnym uramowaniem, jakiego chce władza
   polityczna. Pieczęć zakotwicza FAKTY w dacie wydania, ale nie
   prejudykuje narracji, którą te fakty później wesprą.

7. **Przymuszone zaświadczenie.** Jeśli odpowiedzialny principal
   finansowy jest zmuszony do podpisania zaświadczenia
   nieprawidłowo przedstawiającego transakcje, pieczęć zakotwicza
   wymuszone zaświadczenie z wymuszonym podpisem. Pieczęć
   weryfikuje KTO podpisał (FAKT 08), nie DLACZEGO podpisał.
   Zapieczętowanie wymuszonego zaświadczenia produkuje trwały
   publiczny zapis wymuszonego wyjścia — przydatny dla późniejszej
   odpowiedzialności, ale nie obrona przed przymusem w chwili.

8. **Porównanie między jurysdykcjami.** Zapieczętowany wydatek jest
   czytelny tylko wobec reżimu prawnego jego wydającej jurysdykcji.
   "Dlaczego Gmina X zapłaciła Y za usługę Z, gdy Gmina W
   zapłaciła tylko V?" to pytanie analizy porównawczej w dół od
   pieczętowania. Międzyjurysdykcyjne benchmarki to zadanie
   analityczne na zapieczętowanych danych, nie właściwość pieczęci.

**Sekcja o uczciwych ograniczeniach powyżej jest nośną częścią tego
zestawu.** Urzędnicy finansowi i politycy, którzy wierzą, że
zapieczętowanie równa się integralność, użyją tego zestawu jako
tarczy. Zestaw musi powiedzieć wprost: to jest *prymityw
nieodrzucalności dla momentu wydania*, nie dowód integralności
wydatków.

---

## Czego ten zestaw MUSI ODMÓWIĆ pieczętowania

Zestaw jest skonfigurowany do odrzucania następujących wzorców
faktów, nawet jeśli zgłosi je użytkownik z ważnym uprawnieniem
podpisywania:

- **Imiona indywidualnych pracowników rządowych poniżej poziomu
  principala podpisującego.** Żaden fakt nie może nazywać
  indywidualnych pracowników biura zamówień, indywidualnych
  urzędników skarbu, indywidualnych członków panelu oceniającego
  ani żadnej osoby fizycznej nie w publicznej roli
  odpowiedzialnościowej. Ryzyko narażenia na odwet dla personelu
  liniowego przewyższa korzyść z przejrzystości; ich tożsamości
  są pieczętowane w kontrolach wewnętrznych (hash logu podpisania
  FAKTU 05), nie w treści atestacji.

- **PII dostawcy.** Żaden fakt nie może zawierać numerów kont
  bankowych dostawców, imion indywidualnych pracowników
  dostawców, adresów domowych dostawców, identyfikatorów
  podatkowych osób fizycznych dostawców, wewnętrznych podziałów
  cen zawierających strukturę kosztów dostawcy ani żadnego innego
  pola PII komercyjnego, którego publikacja szkodzi interesom
  dostawcy bez służenia antykorupcji. Takie informacje mogą być
  HASZOWANE (FAKT 05), ale nie publikowane.

- **Wydatki klasyfikowane jako bezpieczeństwa.** Wydatki
  klasyfikowane na podstawie ustaw o bezpieczeństwie narodowym NIE
  kwalifikują się do pieczętowania w ramach tego zestawu. Obsługa
  klasyfikowana to inny problem z innymi wymaganiami
  kryptograficznymi i prawnymi. Samo wyłączenie jest ujawnione w
  FAKCIE 07 R3, aby czytelnik wiedział, że publikacja jest z
  założenia częściowa.

- **Cywilne egzekwowanie zobowiązań podatkowych wobec
  zidentyfikowanych osób fizycznych.** Choć koszty egzekwowania
  są wydatkami publicznymi, nazywanie indywidualnych podatników w
  egzekwowaniu jest odmawiane: szkoda prywatności przewyższa
  korzyść z przejrzystości, a równoległa przejrzystość istnieje w
  ramach sprawozdawczości sądów podatkowych.

- **Transakcje przed wydaniem.** Żaden kontrakt przed formalnym
  przyznaniem; żadna wypłata przed formalnym wydaniem.
  Zapieczętowanie wersji roboczej kontraktu lub oczekującej
  płatności tak, jakby zostały wykonane, tworzy fałszywą pewność.

- **Pieczętowanie przez kogokolwiek innego niż odpowiedzialny
  principal finansowy.** Wykonawca, dostawca, członek rady,
  dziennikarz lub obserwator nie mogą zapieczętować "zapisu
  wydatków publicznych" w imieniu organu finansowego, który go
  wydał. (Mogą zapieczętować własne obserwacje pod własnym
  principalem, w oddzielnej publikacji.)

- **Sformułowania "wolne od korupcji".** Zestaw odmawia
  zapieczętowania jakiegokolwiek sformułowania formy "ten
  wydatek był zgodny z prawem i wolny od korupcji" lub
  "zamówienie publiczne było wykazalnie sprawiedliwe". Takie
  roszczenia są epistemicznie poza domeną zestawu.

- **Publikacje pomijające ujawnienia towarzyszące FAKTU 07.**
  Publikacja transakcji bez towarzyszącego zapisu ujawnienia i
  odmowy nie jest legalną publikacją MYRIAM w ramach tego
  zestawu.

Sama odmowa może być zapieczętowana jako fakt ("Ta strona
zażądała zapieczętowania X; zestaw odmówił zgodnie z regułą odmowy
Y"), tworząc publiczny zapis próby nadużycia. W domenie, w której
nacisk polityczny na urzędników finansowych jest udokumentowany,
zapis *odmówionych* żądań sam w sobie jest sygnałem integralności.

---

## Co ten zestaw ZAPIECZĘTOWUJE

8 faktów w momencie atestacji wykonania budżetu:

1. **Powiadomienie przykładowe** — deklaruje publikację jako przykład
   (prawdziwe atestacje usuwają lub zastępują to).
2. **Jurysdykcja i podstawa prawna** — który podmiot rządowy wydaje,
   pod jaką ustawową władzą, w którym okresie fiskalnym.
3. **Odniesienie do alokacji lub budżetu** — konkretne linie w
   przyjętym budżecie, które są wykonywane, z hashami instrumentu
   budżetowego i wszystkimi zmianami / transferami /
   reprogramowaniami zastosowanymi.
4. **Manifest kontraktów lub wypłat** — zapis na transakcję: kwota,
   nazwa podmiotu prawnego dostawcy (brak indywidualnej PII), cel,
   data, rodzaj zamówienia publicznego, podstawa przyznania, hash
   dokumentu kontraktu.
5. **Hashe dokumentów wspierających** — SHA-256 zaproszeń,
   ocen, wykonanych kontraktów, zleceń zmian, wniosków o płatność,
   formularzy odbioru rezultatów, wpisów księgi skarbu, logów
   podpisania kontroli. Tylko hashe, nie treści — aby chronić
   komercyjne i osobiste PII przy jednoczesnym umożliwieniu
   weryfikacji przez ponowne haszowanie.
6. **Stan audytu i nadzoru** — który organ inspektora generalnego
   ma jurysdykcję, która najwyższa instytucja audytowa, który
   organ prokuratorski ma jurysdykcję nad przestępstwami
   korupcyjnymi, terminy audytu, bieżący stan jakichkolwiek
   trwających przeglądów.
7. **Ujawnienia towarzyszące i zapis odmów** — oczekujące protesty
   zamówieniowe, oczekujące dochodzenia wewnętrzne, zaległe wnioski
   FOI, recenzje opinie odrębne, znane przekroczenia linii
   budżetowej; jawna lista wzorców, których zestaw odmówił
   zapieczętowania.
8. **Principal podpisujący** — odpowiedzialny urzędnik finansowy
   + rola + ustawowa odpowiedzialność + współpodpisujący w
   ramach kontroli podwójnej; co każdy sygnatariusz zaświadcza
   osobiście, a czego nie.

Każdy fakt kończy się konwencją bramy odmowy: *"Ten fakt stwierdza
tylko X. Nie stwierdza Y"* (gdzie Y jest najbliższym trybem awarii
z sekcji "NIE robi").

---

## Przed czym ten zestaw broni

- **Ciche po-wydaniowe rewizja kwot kontraktów.** Jakakolwiek zmiana
  jakiejkolwiek kwoty w FAKCIE 04 produkuje inny SHA-256, inny
  korzeń Merkle, zawodzi weryfikację OTS.
- **Ciche podstawienie dostawcy.** Zastąpienie "Dostawcy A" "Dostawcą
  B" na już wydanym kontrakcie jest wykrywalne z zapieczętowanych
  bajtów.
- **Antydatowanie zleceń zmian.** FAKT 04 zamraza datę i
  uzasadnienie zlecenia zmiany przy wydaniu; jakiekolwiek późniejsze
  twierdzenie "to zawsze był uzgodniony zakres" musi zmierzyć się z
  zapieczętowanym zapisem zlecenia zmiany.
- **Cicha zniknięcie niekorzystnych transakcji.** Wszystkie
  transakcje wydane w okresie są w FAKCIE 04 pod jednym korzeniem
  Merkle. Publikowanie podzbioru jest wykrywalne z listy
  hashów-liści.
- **Tłumienie ujawnień towarzyszących.** FAKT 07 zamraza stan
  oczekujących protestów, oczekujących dochodzeń i zaległych FOI
  w momencie atestacji. Jakiekolwiek późniejsze twierdzenie
  "nigdy nie słyszeliśmy o tym proteście" jest publicznie
  porównywalne.
- **Dryf jurysdykcji audytu.** FAKT 06 zamraza, które organy mają
  jurysdykcję nadzoru nad zapieczętowanymi transakcjami.
  Późniejsze twierdzenie, że konkretny IG "nie miał uprawnień",
  musi zmierzyć się z zapieczętowanym zapisem jurysdykcji.
- **Wymazanie zapisu odmów.** FAKT 07 rejestruje, czego zestaw
  odmówił zapieczętowania; jakiekolwiek późniejsze twierdzenie
  "nigdy niczego nie odmówiliśmy" jest sprzeczne z zapieczętowanym
  zapisem.

---

## Przypadki historyczne, w których zestaw by pomógł

Zestaw wytworzyłby użyteczne **sądowe zakotwiczenie** — *nie naprawę,
nie zapobieganie, nie substytut karnego ścigania* — w
udokumentowanych przypadkach publicznych z dziedziny cichych
wstecznych modyfikacji zapisów wydatków publicznych:

- **Brazylia — *Operação Lava Jato* / linia Petrobras (2014–2021).**
  Brazylijscy prokuratorzy federalni udokumentowali kartel głównych
  firm budowlanych, który przez ponad dekadę płacił łapówki średnio
  ~3% na kontraktach Petrobras i innych federalnych kontraktach
  infrastrukturalnych, z łapówką kierowaną do polityków i do
  własnej koordynacji cen kartelu. Kontrakty jako wydane wyglądały
  rutynowo; korupcja była powyżej wydania. Zestaw pieczętujący NIE
  zapobiegłby Lava Jato (łapówki były osadzone w cenie PRZED
  dotarciem kontraktu do pieczęci), ale zakotwiczyłby warunki
  kontraktu przy wydaniu — czyniąc późniejszą sądową
  rekonstrukcję "tego, co każdy kontrakt faktycznie mówił, gdy
  został podpisany" ogromnie tańszą. Koszt śledczy Lava Jato w
  dużej mierze obejmował koszt ponownego złożenia osi czasu z
  niespójnych zarchiwizowanych zapisów.

- **Unia Europejska — spory o regionalne fundusze rozwojowe
  (wielu państw członkowskich, lata 2010-2020).** Roczne sprawozdania
  Europejskiego Trybunału Obrachunkowego wielokrotnie
  identyfikowały istotne wskaźniki błędów w wydatkach Europejskich
  Funduszy Strukturalnych i Inwestycyjnych (ESIF) oraz Funduszu
  Spójności, w niektórych latach przekraczające próg istotności.
  Spory o "co było faktycznie deklarowane" wobec "co było
  faktycznie dostarczone" powracają, ponieważ dokumentacja
  deklaracji może być rewidowana między złożeniem a audytem.
  Pieczętowanie MYRIAM na wydanie deklaracji-jak-złożonej
  zakotwiczyłoby zawartość każdej deklaracji przy złożeniu,
  oddzielając "to, co beneficjent zadeklarował w tym czasie", od
  "tego, do czego doszła rekonstrukcja po-audytowa".

- **Irak — wypłaty Tymczasowego Organu Koalicyjnego (CPA),
  2003-2004.** CPA wypłaciło około 9 miliardów USD w gotówce z
  Funduszu Rozwoju Iraku z dokumentacją, którą Specjalny Inspektor
  Generalny ds. Odbudowy Iraku (SIGIR) i późniejsze raporty
  audytowe scharakteryzowały jako znacząco niekompletną. Spory o
  zapisy wypłat utrzymują się dwie dekady później. Pieczętowanie w
  momencie wypłaty nie utworzyłoby zapisów, których CPA nie
  prowadziło — ale tam, gdzie jakikolwiek zapis istniał (ręcznie
  pisane księgi, datowane upoważnienia do przelewu), współczesna
  pieczęć zakotwiczyłaby stan tego zapisu w postaci bajtów w
  momencie wydania, oddzielając "zapis w tamtym czasie" od
  "zapisu zrekonstruowanego później".

- **Grecja — rewizje raportowania zadłużenia państwowego i
  wydatków publicznych (2009-2010).** Audyty Eurostat w latach
  2009-2010 udokumentowały znaczne rewizje wcześniej zgłaszanych
  greckich danych fiskalnych, przy czym metodologia samej rewizji
  była sporna. Pieczętowanie kwartalnych raportów wydatków w
  momencie pierwotnej publikacji uczyniłoby *deltę* między
  pierwotnymi a zrewidowanymi raportami publicznie porównywalną,
  zamiast rekonstruowalną tylko poprzez porównanie archiwum.
  Pieczęć nie zapobiegłaby podstawowemu sporowi metodologicznemu,
  ale zakotwiczyłaby każdy zgłoszony kwartał w momencie
  pierwotnego raportu.

- **Wielka Brytania — zamówienia pandemiczne (2020-2022).** Raporty
  brytyjskiego Narodowego Urzędu Audytu i komitetów parlamentarnych
  zidentyfikowały procesy zamówień publicznych w latach 2020-2021,
  w których kontrakty były przyznawane w ramach przepisów
  awaryjnych ze zmniejszoną konkurencją i zmniejszoną dokumentacją;
  niektóre przyznania były później modyfikowane, anulowane lub
  rozliczane. Pieczętowanie na wydanie każdego przyznania
  zamówienia awaryjnego zakotwiczyłoby uzasadnienie przyznania i
  warunki w momencie przyznania, czyniąc późniejsze modyfikacje
  publicznie widoczną deltą zamiast cicho zmodyfikowanego zapisu.

- **Republika Południowej Afryki — kontrakty przedsiębiorstw
  publicznych z ery przejęcia państwa (~2010-2018).** Komisja
  Zondo udokumentowała kontrakty w kilku przedsiębiorstwach
  państwowych (Eskom, Transnet, Denel), których dokumentacja była
  różnie niekompletna, zrewidowana lub sporna. Pieczętowanie
  każdego przyznania kontraktu przy wydaniu zakotwiczyłoby
  stan zapisu jak-przyznanego, oddzielając późniejsze wyniki
  sądowej rekonstrukcji od współczesnego zapisu.

Zestaw NIE zapobiegłby podstawowej korupcji w żadnym z powyższych
przypadków. W kilku przypadkach podstawowym problemem było to, że
korupcja była *powyżej wydania* — pieczęć zakotwicza skorumpowany
kontrakt z wysoką integralnością, co jest innym rodzajem
pożytecznego (sądowe zakotwiczenie dla późniejszej
odpowiedzialności), ale nie tym samym, co zapobieganie. W innych
przypadkach (gotówka CPA, wydatki pozabudżetowe) podstawowym
problemem było to, że zapisy, które miały być pieczętowane, nie
istniały lub nie były prowadzone — zestaw nie może tworzyć
zapisów, których organ nie wytworzył.

Te przypadki historyczne są nazwane tylko z odniesieniem do
publicznie udokumentowanych ustaleń (zapisów sądowych, raportów
komitetów parlamentarnych, publikacji organów audytowych). Nie
formułuje się roszczenia o jakąkolwiek osobę; udokumentowane
ustalenia instytucjonalne stoją na publicznym zapisie.

---

## Kiedy używać tego zestawu

- Twoja jurysdykcja ma ustanowiony proces sprawozdawczości
  wykonania budżetu i chce dodać niezmienne publiczne
  zakotwiczenie.
- Spodziewasz się po-wydaniowej kontroli (żądania FOI, audyt,
  monitorowanie społeczeństwa obywatelskiego, dziennikarskie
  dochodzenie) i chcesz odporny na manipulację punkt referencyjny.
- Masz prawne uprawnienia w ramach prawa o przejrzystości /
  otwartych zapisach do publikowania wymienionego zestawu faktów,
  z honorowanymi wyłączeniami prywatności / bezpieczeństwa.
- Działasz w ramach ustawowego reżimu audytu (inspektor generalny,
  najwyższa instytucja audytowa) i chcesz zakotwiczyć każde
  kwartalne zamknięcie przed dotarciem cyklu audytu.
- Publikujesz w ramach Standardu Otwartych Danych Kontraktowych
  lub IATI i chcesz kryptograficznego uzupełnienia publikacji
  opartej na portalu.

## Kiedy NIE używać tego zestawu

- **Nie używaj jako substytutu dla ustawowego audytu, przeglądu
  inspektora generalnego, dochodzenia prokuratorskiego ani
  monitorowania społeczeństwa obywatelskiego.** Zestaw jest
  *dodatkowy*, nie substytucyjny.
- **Nie używaj jako certyfikatu legitymizacji.** Zapieczętowany
  zapis wydatków nie jest certyfikatem wolnym od korupcji.
  Traktowanie go jako takiego to dokładnie tryb awarii, któremu
  struktura zorientowana najpierw na ograniczenia zestawu ma
  zapobiegać.
- **Nie używaj w środku okresu.** Zestaw jest dla momentu
  formalnego wydania (kwartalne zamknięcie, przyznanie kontraktu,
  wypłata milestone). Pieczęcie w środku okresu tworzą mylące
  punkty referencyjne.
- **Nie używaj do twierdzenia, że wydatek był legalny, sprawiedliwy
  lub niezskorumpowany** — zestaw nie może tego zrobić.
- **Nie używaj do pieczętowania klasyfikowanych wydatków,
  indywidualnej PII pracownika ani komercyjnej PII dostawcy.**
  Zestaw odrzuca te wzorce; próba ich pieczętowania tworzy zapis
  odmowy (FAKT 07).
- **Nie używaj do pieczętowania wersji roboczych przed wydaniem.**
  Wersje robocze mogą być pieczętowane pod innym typem atestacji
  ("wersja robocza do komentarzy, nie wydana"), ale nie pod typem
  wydania tego zestawu.
- **Nie używaj pod presją pominięcia ujawnień FAKTU 07.** Odmów i
  zapieczętuj odmowę.
- **Nie używaj, jeśli twój organ finansowy jest przejęty.**
  Zapieczętowany oszukańczy wydatek jest trwałym publicznym
  zapisem oszustwa, nie jego obroną. Prymityw tnie w obie strony;
  to jest jego uczciwość.

---

## Jak rozwidlić ten zestaw dla prawdziwej atestacji

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # zamień fikcyjną treść prawdziwą
bash build/seal.sh         # zapieczętuj w momencie formalnego wydania
python3 build/verify.py    # potwierdź
```

**Krytyczne timing:** zapieczętuj PRZY momencie formalnego wydania
— tj. moment, w którym odpowiedzialny principal finansowy
podpisuje kwartalne zamknięcie, moment formalnego przyznania
kontraktu lub moment formalnego wydania wypłaty. Pieczęć przed
formalnym wydaniem tworzy fałszywie pozytywne odniesienie "to jest
oficjalny zapis". Pieczęć długo po formalnym wydaniu jest sądowo
słabsza przeciwko pośrednim modyfikacjom.

**Kadencja:** zestaw jest zaprojektowany dla kwartalnych atestacji
jako domyślnych. Sub-kwartalne kadencje (miesięczne zamknięcie,
pieczętowanie na transakcję) są wspierane przez ponowne uruchamianie
z odpowiednim zakresem; pieczęć pojedynczej transakcji o wysokiej
wartości jest legalnym użyciem.

---

## Integracja z istniejącą infrastrukturą finansów publicznych

Zestaw jest zaprojektowany do współdziałania, nie zastępowania:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Pięć punktów
  publikacji (planowanie, przetarg, przyznanie, kontrakt,
  wdrożenie) mapuje naturalnie na FAKT 03 (planowanie →
  alokacja), FAKT 04 (przetarg, przyznanie, kontrakt, wdrożenie
  → manifest transakcji) i FAKT 05 (hashe dokumentów
  wspierających). Sam eksport JSON OCDS jest pieczętowany w
  FAKCIE 05 (dokumenty kontroli). Jurysdykcja prowadząca
  publikację OCDS może dodać pieczętowanie MYRIAM jako warstwę
  kryptograficzną na wierzch istniejącego portalu.

- **International Aid Transparency Initiative (IATI) standard
  v2.03.** Dla wydatków finansowanych w całości lub części z
  pomocy zewnętrznej, IATI XML może być pieczętowany jako
  dokument kontroli; pieczęć zapewnia kryptograficzne uzupełnienie
  modelu publikacji opartego na HTTP Rejestru IATI.

- **Zobowiązania Open Government Partnership (OGP).** Krajowe
  Plany Działania OGP często zawierają zobowiązania przejrzystości
  fiskalnej; pieczętowanie MYRIAM operacjonalizuje zobowiązanie
  "publikacji odpornej na manipulację" w sposób, który jest
  niezależnie weryfikowalny przez społeczeństwo obywatelskie bez
  konieczności zaufania portalowi rządu.

- **Rekomendacja OECD o Integralności Publicznej (2017).** Zestaw
  wspiera Rekomendację 4 (otwarte dane rządowe o finansach
  publicznych w formie czytelnej maszynowo, w czasie) poprzez
  uczynienie danych kryptograficznie zakotwiczonymi oraz
  czytelnymi maszynowo.

- **Konwencja ONZ przeciwko korupcji (UNCAC), w szczególności
  artykuły 9 (zamówienia publiczne) i 13 (uczestnictwo
  społeczeństwa).** Zestaw zapewnia prymityw sądowy, który
  wspiera obowiązki przejrzystości art. 9 i nadzór społeczeństwa
  obywatelskiego art. 13.

- **Najwyższe Instytucje Audytowe (SAI) — ramy INTOSAI.** SAI
  działające w ramach standardów INTOSAI (ISSAI) mogą konsumować
  zapieczętowane publikacje jako dowody o wysokiej integralności;
  hashe SHA-256 w FAKCIE 05 to te same hashe, które narzędzia
  e-audytu SAI mogą ponownie obliczyć.

- **Biura inspektora generalnego.** Krajowe biura IG z jurysdykcją
  nad zapieczętowanymi wydatkami (FAKT 06) mogą wezwać treści
  dokumentów, których hashe są zapieczętowane w FAKCIE 05;
  pieczęć wiąże treści dokumentów otrzymanych w ramach wezwania z
  treściami, które istniały przy wydaniu.

- **Ustawy o swobodzie informacji i otwartych zapisach.** Pieczęć
  nie zwalnia organu wydającego z trwających obowiązków FOI; w
  rzeczywistości czyni selektywną odpowiedź FOI wykrywalną jako
  odchylenie od zapieczętowanego zapisu. FAKT 07 C3 zakotwicza
  zaległe wnioski FOI w czasie atestacji.

- **Rejestry własności beneficjalnej (Rekomendacja FATF 24,
  dyrektywy AML UE, US Corporate Transparency Act).** Dane
  własności beneficjalnej NIE są pieczętowane w ramach tego
  zestawu (FAKT 04 czerpie tożsamość dostawcy tylko z
  zarejestrowanej nazwy podmiotu prawnego). Ujawnienie własności
  beneficjalnej to oddzielny reżim pieczętowania, który może
  wytworzyć równoległą publikację odwołaną przez korzeń Merkle.

- **Sądowo administrowana przejrzystość (sprawozdawczość wydatków
  sądowych, postępowania o odzyskanie aktywów).** Wyjścia
  postępowań sądowych związanych z korupcją nie są w zakresie
  tego zestawu, ale mogą być pieczętowane pod równoległymi typami
  atestacji.

## Czego ten zestaw NIE zastępuje

- Ustawowy audyt wykonania budżetu przez organy inspektora
  generalnego
- Przegląd najwyższej instytucji audytowej (GAO, NAO, TCU, CAG,
  AGN, BRH, Cour des comptes, ekwiwalent)
- Dochodzenie prokuratorskie w sprawie przestępstw korupcyjnych
  (krajowi prokuratorzy antykorupcyjni, organy art. 36 UNCAC)
- Społeczeństwo obywatelskie i dziennikarskie reportaże śledcze
- Kanały sygnalistów i reżimy chronionego ujawnienia
- Ujawnienie własności beneficjalnej
- Międzynarodowe przeglądy partnerskie (OECD, IMF Fiscal
  Transparency Evaluation, semestr UE, rejestr IATI)
- Sądowo administrowane postępowania o odzyskanie aktywów

Pieczęć jest prymitywem sądowym, który obniża koszt i zwiększa
niezawodność wszystkich powyższych. Nie jest i nie może być
substytutem żadnego z nich.

---

## Licencja

Domena publiczna (CC0). Rozwidl. Atrybucja niewymagana.
