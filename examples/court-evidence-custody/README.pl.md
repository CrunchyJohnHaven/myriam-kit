*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw pieczęci łańcucha kontroli dowodów sądowych

Gotowy do użycia przykład myriam-kit dla zespołów akwizycji kryminalistycznej —
biegłych informatyki śledczej, techników ekstrakcji urządzeń mobilnych,
kustoszy nagrań z kamer nasobnych, kierowników laboratoriów — którzy chcą
publikować zakotwiczoną w Bitcoinie, odporną na manipulację pieczęć
*które bajty zostały pozyskane* oraz *kiedy* zostały pozyskane, w momencie
akwizycji dowodu cyfrowego, dzięki czemu spory dotyczące łańcucha kontroli
mają publiczny punkt zakotwiczenia.

---

## Czego ten zestaw NIE robi (przeczytaj najpierw)

Pieczęć jest kryptograficznym znacznikiem czasu mówiącym, KTÓRE OBRAZY
KRYMINALISTYCZNE zostały pozyskane, KIEDY zostały pozyskane, przez JAKĄ
AGENCJĘ, na podstawie JAKIEGO NAKAZU oraz przy użyciu JAKIEJ METODYKI.
Nie może odpowiedzieć na żadne pytanie dotyczące sprawy wykraczające poza to.
Poniższe punkty znajdują się **poza zakresem pieczęci**:

1. **Dopuszczalność dowodu w świetle Federalnych Zasad Dowodowych (lub
   dowolnego innego kodeksu dowodowego).** Pieczęć kotwiczy bajty i znaczniki
   czasu. To, czy dowód jest dopuszczalny — w ramach uwierzytelnienia
   FRE 901, świadectwa biegłego FRE 702 / standardu Daubert, równowagi
   szkodliwości FRE 403 czy któregokolwiek odpowiednika prawa stanowego — jest
   kwestią procedury prawnej. Idealnie zapieczętowana akwizycja może
   nadal zostać uznana za niedopuszczalną; niezapieczętowana akwizycja
   może nadal zostać dopuszczona. Pieczęć stanowi dodatkowy dowód
   integralności, nie zastępuje orzeczenia sądu o dopuszczalności.

2. **Czy zajęcie było zgodne z prawem.** Zgodność z Czwartą Poprawką,
   ważność nakazu, przestrzeganie jego zakresu, stosowalność reguły
   wyłączenia dowodów — wszystko to znajduje się przed pieczęcią.
   Pieczęć rejestruje, że akwizycja odbyła się na podstawie nakazu
   FICT-SW-2026-0188; to, czy nakaz został wydany i wykonany zgodnie
   z prawem, należy do sądu.

3. **Czy dowód jest obciążający, odciążający, czy neutralny.** Pieczęć
   kotwiczy hashe; interpretacje tego, co te hashe zawierają, należą
   do raportu z badania kryminalistycznego, który jest osobnym dokumentem
   z własnym reżimem udostępniania i dowodowym. Pieczęć odmówi
   zapieczętowania faktu "FAKT N: laptop podejrzanego zawierał materiały
   obciążające" — zobacz regułę odmowy R4.

4. **Czy łańcuch kontroli jest proceduralnie poprawny zgodnie z prawem
   dowodowym właściwego stanu.** Pieczęć rejestruje współczesny dziennik
   zdarzeń kontroli agencji (FAKT 05). To, czy dziennik ten spełnia
   wymagania łańcucha kontroli danego stanu, należy do sądu na
   rozprawie dowodowej.

5. **Czy metodyka kryminalistyczna była rzetelna.** Standard Daubert
   i jego następstwa (oraz odpowiedniki na poziomie stanowym, takie
   jak Frye, tam gdzie nadal obowiązuje) oceniają rzetelność metodyczną.
   Pieczęć rejestruje, JAKICH narzędzi i wersji użyto (FAKT 04); to,
   czy narzędzia te spełniają standard rzetelności danego sądu, należy
   do sądu. Błędy w narzędziach były dokumentowane post-akwizycyjnie
   w przeszłych sprawach; rolą pieczęci jest uczynienie zapisu wersji
   i hashu binarnego publicznie obalalnym, a nie poręczenie za same
   narzędzia.

6. **Czy dowód został zmanipulowany PRZED akwizycją.** Pieczęć kotwiczy
   bajty od momentu obrazowania wzwyż. Jeśli podejrzany, funkcjonariusz
   lub osoba trzecia zmieniła urządzenie źródłowe przed jego obrazowaniem,
   pieczęć nie może tego wykryć — zapieczętuje zmienione bajty z taką
   samą integralnością, z jaką zapieczętowałaby oryginał. Wartość
   pieczęci zaczyna się od znacznika czasu obrazowania.

7. **Czy przestrzegano zakresu nakazu.** Klauzula nakazu określa, co może
   zostać pozyskane; pieczęć rejestruje, co ZOSTAŁO pozyskane.
   Pytanie, czy akwizycja przekroczyła zakres nakazu, jest, jak już
   wspomniano, kwestią prawną z własnym środkiem zaradczym (wniosek
   o wyłączenie dowodów zgodnie z odpowiednią procedurą stanową).

8. **Powtórnej identyfikacji jakiejkolwiek prywatnej strony postępowania.**
   Pieczęć odmawia publikacji jakiejkolwiek nazwy, identyfikatora lub
   odcisku palca, który mógłby pozwolić na ponowną identyfikację
   podejrzanego, oskarżonego, ofiary, świadka lub osoby przebywającej
   na miejscu. Sygnatura akt jest właściwym uchwytem dla stron mających
   legitymację procesową do zlokalizowania sprawy.

**Powyższa sekcja o uczciwych ograniczeniach jest nośną częścią tego
zestawu.** Zespoły kryminalistyczne, które uwierzą, że zapieczętowanie
równa się dopuszczalności, użyją go jako tarczy. Zestaw musi mówić wprost:
*to prymityw niezaprzeczalności dla momentu akwizycji, a nie dowód
zgodnego z prawem pozyskania, prawidłowości metodyki czy uznanego przez
sąd łańcucha kontroli.*

---

## Czego zestaw MUSI ODMÓWIĆ zapieczętowania

Zestaw jest skonfigurowany tak, by odrzucać następujące wzorce faktów,
nawet jeśli użytkownik z ważnym uprawnieniem agencji do podpisywania
je zgłosi:

- **Personalna identyfikacja podejrzanych, oskarżonych, ofiar, świadków
  lub jakichkolwiek prywatnych osób trzecich.** Sygnatura akt jest
  uchwytem dla stron mających legitymację; publiczna pieczęć nie może
  być indeksem ponownej identyfikacji.
- **Imiona i nazwiska biegłych kryminalistycznych ani innego personelu
  agencji w publicznej pieczęci.** Role są publiczne; przypisania osób
  do ról są pieczętowane osobno i podlegają udostępnieniu na drodze
  postępowania sądowego.
- **Hashe na poziomie pliku (lub odciski palców) podejrzewanego
  materiału przedstawiającego seksualne wykorzystywanie dzieci, szablony
  biometryczne lub jakiekolwiek dane umożliwiające ponowną identyfikację
  osób narażonych — nawet w postaci hashu.** Wartość SHA-256
  pojedynczego pliku stanowi trwały, wyszukiwalny identyfikator;
  publikowanie go na publicznym rejestrze może powtórnie wiktymizować
  osoby poprzez korelację z prywatnymi bazami danych. Hashe na poziomie
  obrazu (poziomie obrazu kryminalistycznego) całych dysków są dopuszczalne;
  hashe takich materiałów na poziomie plików NIGDY nie są dopuszczalne.
- **Ustalenia, interpretacje, opinie lub wnioski z badania na temat
  tego, co bajty oznaczają.** Pieczęć kotwiczy, JAKIE BAJTY zostały
  pozyskane i KIEDY. Interpretacja należy do podlegającego udostępnieniu
  raportu z badania, a nie do odpornego na manipulacje publicznego rejestru.
- **Twierdzenia o dopuszczalności lub jakiekolwiek inne wnioski prawne**
  ("ten dowód jest dopuszczalny", "nakaz był zgodny z prawem", "łańcuch
  kontroli był właściwy zgodnie z §X.Y"). Wnioski prawne są funkcjami sądu.
- **Pieczętowanie przez kogokolwiek innego niż upoważnionego zleceniodawcę
  agencji dokonującej akwizycji.** Biegły obrony może użyć zestawu do
  zapieczętowania własnej, niezależnej weryfikacji manifestu; nie może
  zapieczętować PIERWOTNEJ akwizycji w imieniu agencji dokonującej akwizycji.
- **Przypisania ról do osób wewnątrz publicznej pieczęci.** Przypisania
  są pieczętowane w osobnym, towarzyszącym zapisie (zhashowanym w FAKCIE 05)
  pod kontrolą dostępu agencji.
- **Faktów dotyczących czynności śledczych przed zajęciem lub przed
  nakazem.** Zeznania informatorów, obserwacja przed wydaniem nakazu,
  dane z konstrukcji równoległej — żadne z nich nie należą do pieczęci
  akwizycyjnej. Pieczęć jest ograniczona do zdarzenia akwizycji.

Sama odmowa może zostać zapieczętowana jako fakt ("Niniejsza agencja
zażądała zapieczętowania X; zestaw odmówił zgodnie z regułą odmowy Y"),
tworząc publiczny zapis próby nadużycia.

---

## Co zestaw ZAPIECZĘTOWUJE

8 faktów w momencie akwizycji:

1. **Informacja o przykładzie** — deklaruje publikację jako przykład
   (prawdziwe atestacje usuwają lub zastępują tę pozycję).
2. **Kontekst akwizycji** — identyfikator sprawy, sygnatura nakazu,
   agencja dokonująca akwizycji, organ wnioskujący, data/czas zajęcia
   i akwizycji, lokalizacja akwizycji (lokalizacja zajęcia jest
   zaszyfrowana do osobno zapieczętowanego towarzyszącego zapisu,
   aby uniknąć ponownej identyfikacji miejsca).
3. **Manifest dowodów** — dla każdego elementu obrazu kryminalistycznego:
   hash SHA-256, rozmiar pliku, zanonimizowany identyfikator urządzenia
   źródłowego, metoda akwizycji, format obrazu kryminalistycznego.
4. **Metodyka akwizycji** — nazwy narzędzi kryminalistycznych i ich
   dokładne wersje (z hashami binariów narzędzi), marka/model i firmware
   blokera zapisu, odniesienie do weryfikacji NIST CFTT, zastosowana
   procedura weryfikacyjna, wybór formatu obrazu.
5. **Dziennik łańcucha kontroli** — chronologia zdarzeń od początkowego
   zajęcia po koniec obrazowania, kustosze identyfikowani według ROLI
   (nie według nazwiska), z hashami osobno zapieczętowanych towarzyszących
   zapisów (przypisanie ról do osób, dziennik GPS transportu, dziennik
   dostępu do szafy dowodowej, fotografie plomb sabotażowych itd.).
6. **Kwalifikacje biegłego według roli** — posiadane certyfikaty, status
   kształcenia ustawicznego, liczba wcześniejszych występów jako biegły,
   ekspozycja na standard Daubert, ujawnienia konfliktów interesów —
   wszystko na poziomie roli, nie osobiste.
7. **Ujawnienia towarzyszące i rejestr odmów** — równoległe postępowania,
   oczekujące zaskarżenia nakazów, wnioski o wyłączenie dowodów,
   obowiązujący protokół filtra tajemnicy / zespołu czyszczącego,
   wcześniejsze próby akwizycji, przegląd śledzenia błędów dostawców;
   wyraźna lista wzorców, których zestaw odmówił zapieczętowania.
8. **Zleceniodawca podpisujący** — identyfikacja agencji dokonującej
   akwizycji + sygnatariusz na poziomie roli (główny biegły) +
   współsygnatariusz na poziomie roli (kierownik jednostki) + informacje
   o kluczu kryptograficznym.

Każdy fakt kończy się konwencją bramki odmowy: *"Niniejszy fakt stwierdza
wyłącznie X. Nie stwierdza Y"* (gdzie Y jest najbliższym trybem awarii
z powyższej sekcji "NIE robi").

---

## Przed czym ten zestaw chroni

- **Cicha zmiana po akwizycji obrazu kryminalistycznego.** Każda zmiana
  na poziomie bajtów w dowolnym obrazie wytwarza inny SHA-256, a obraz
  po zmianie nie zweryfikuje się względem zapieczętowanego manifestu FAKT 03.
- **Twierdzenie, że "użyto innych narzędzi".** FAKT 04 rejestruje dokładne
  wersje narzędzi z hashami binariów narzędzi; późniejsze twierdzenia
  typu "faktycznie użyliśmy v4.7.0, nie v4.7.1" są publicznie obalalne.
- **Twierdzenie, że bloker zapisu nie był aktywny lub że użyto innego
  modelu.** FAKT 04 zamraża manifest blokera zapisu.
- **Zmiana dziennika kontroli.** Każda zmiana w chronologii zdarzeń
  kontroli FAKT 05 (dodanie, usunięcie lub ponowne datowanie zdarzenia)
  zmienia hash FAKTU 05 i jest publicznie wykrywalna.
- **Podstawienie uwierzytelnień innego biegłego.** FAKT 06 zamraża
  profil uwierzytelnień na poziomie roli z momentu akwizycji.
- **Selektywne pominięcie ujawnień towarzyszących.** FAKT 07 wymienia
  oczekiwane kategorie ujawnień; pusta kategoria musi być wyraźnie
  poświadczona ("brak w momencie akwizycji"), więc późniejsze
  "nie wiedzieliśmy, że to istotne" jest publicznie obalalne.
- **Po-akwizycyjne twierdzenia, że biegły miał nieujawniony konflikt.**
  Ujawnienie konfliktu z FAKTU 06 jest zamrożone w momencie akwizycji;
  późniejsze zaskarżenia można testować względem niego.

Zestaw **nie** chroni przed współczesną korupcją — zespół, który celowo
zapieczętuje fałszywe metadane w momencie akwizycji, wytwarza kryptograficznie
ważną pieczęć fałszywych metadanych. Prymityw jest pod tym względem
uczciwy: jest to prymityw niezaprzeczalności dla współczesnych roszczeń
agencji, a nie dowód, że te roszczenia są poprawne.

---

## Historyczne lub niemal historyczne sprawy, w których zestaw by pomógł

Zestaw wytworzyłby użyteczną kotwicę — *nie rozstrzygnięcie* — w przeszłych
sprawach, w których łańcuch kontroli dowodów cyfrowych stał się spornym
zagadnieniem dowodowym. By uniknąć wskazywania oskarżonych (którzy są
stronami prywatnymi, nawet gdy skazani), opisano je według typu sprawy,
a nie według nazwisk osób:

- **Federalna kontrowersja dotycząca błędu w narzędziu kryminalistycznym
  z połowy lat 2010**, w której powszechnie używane narzędzie do
  obrazowania kryminalistycznego, po akwizycji, okazało się mieć skrajny
  błąd dotyczący określonego typu nośnika źródłowego. Zapieczętowany
  manifest akwizycyjny z zamrożonymi danymi wersji narzędzia oraz hasha
  binarium pozwoliłby obronie i prokuraturze uzgodnić, której dokładnie
  wersji użyto, eliminując jedną oś sporu.

- **Liczne sprawy stanowe dotyczące spornych wyników ekstrakcji z urządzeń
  mobilnych**, w których dostawca narzędzia ekstrakcyjnego wypuścił
  później łatkę naprawiającą błąd, a pytanie brzmiało: "czy ten błąd
  dotyczył tej sprawy". Zapieczętowany fakt metodyczny pozwala odpowiedzieć
  na to pytanie względem zamrożonych danych wersjonowania, a nie względem
  aktualnej pamięci agencji o tym, której wersji użyto.

- **Spory dotyczące przekazania nagrań z kamer nasobnych** w sprawach,
  w których system dokowania dostawcy BWC był później oskarżany o to,
  że umożliwiał modyfikację nagrań podczas transferu. Zapieczętowany
  manifest archiwum kamery nasobnej w momencie odbioru przez agencję
  kotwiczy, jakie bajty agencja otrzymała z systemu dokowania;
  późniejsze edycje po stronie agencji są publicznie wykrywalne.

- **Kontrowersje dotyczące kolizji hashy w sprawach informatyki śledczej**,
  w których biegły obrony argumentował, że MD5 (wciąż używany w niektórych
  starszych przepływach pracy) jest niewystarczający. Zapieczętowana
  akwizycja, która rejestruje ZARÓWNO MD5, JAK i SHA-256, pozwala na
  utrzymanie SHA-256 nawet wtedy, gdy MD5 zostanie zakwestionowany.

- **Spory dotyczące ewolucji metodyki badania między akwizycją a procesem.**
  Gdy sprawa pozostaje między akwizycją a procesem przez lata, metodyka,
  która była standardem w momencie akwizycji, może zostać do czasu procesu
  zastąpiona. Zapieczętowany zapis pozwala sądowi oceniać metodykę
  względem standardu obowiązującego w momencie akwizycji, a nie względem
  standardu późniejszego.

Zestaw NIE rozstrzygnąłby leżących u podstaw sporów o winę lub niewinność
w żadnym z tych typów spraw. Rozstrzygnąłby jedno konkretne podzagadnienie
dowodowe: czy bajty, narzędzia i procedury były tym, czym agencja
twierdzi, że były w czasie, który agencja podaje.

---

## Kiedy używać tego zestawu

- Twoja agencja ma stabilną kryminalistyczną SOP i chce dodać zakotwiczone
  w Bitcoinie publiczne poświadczenie jako warstwę odporną na manipulację
  na istniejącym papierowo-podpisowym łańcuchu kontroli.
- Spodziewasz się, że sprawa będzie wiązała się z istotnym zaskarżeniem
  dowodów kryminalistycznych przez obronę (sprawa o wysokiej stawce,
  nowatorska metodyka, sporne wersje narzędzi itp.).
- Możesz opublikować wymieniony zbiór faktów bez ujawniania danych
  osobowych lub danych umożliwiających ponowną identyfikację osób
  narażonych. (Reguły odmowy zestawu wymuszają to; jeśli twoje fakty
  wymagałyby naruszenia reguły odmowy, nie używaj zestawu.)
- Główny radca prawny agencji dokonującej akwizycji oraz prokuratura
  zatwierdzili plan publikacji. Publiczne opublikowanie artefaktu
  zawierającego identyfikator sprawy ma implikacje dla trwających
  postępowań; konsultacja prawna nie jest opcjonalna.
- Reguły udostępniania obronie w twojej jurysdykcji są zgodne z tym,
  że agencja przechowuje osobno zapis przypisania ról do osób
  (zhashowany w FAKCIE 05). Jeśli twoja jurysdykcja wymaga publicznego
  ujawnienia nazwisk biegłych, musisz odpowiednio zmodyfikować zestaw.

## Kiedy NIE używać tego zestawu

- **Nie używaj go jako substytutu istniejącej dokumentacji łańcucha
  kontroli agencji.** Ten zestaw jest *uzupełniający*, nie zastępczy.
  Zobowiązania agencji dotyczące CMS, dziennika kontroli i udostępniania
  pozostają niezmienione.
- **Nie używaj, jeśli akwizycja dotyczy materiałów CSAM, szablonów
  biometrycznych lub innych danych umożliwiających ponowną identyfikację
  osób narażonych na poziomie pliku.** Hashe na poziomie obrazu całych
  dysków są dopuszczalne; hashe takich materiałów na poziomie plików
  NIGDY nie są dopuszczalne, nawet przy odstąpieniu od reguły odmowy.
  Jeśli nie potrafisz skonstruować zbioru faktów bez łamania R3, nie
  używaj zestawu.
- **Nie używaj, by twierdzić, że nakaz był zgodny z prawem, zajęcie
  było prawidłowe lub dowody są dopuszczalne** — zestaw nie może
  tego zrobić, a reguła odmowy R5 odrzuci wszelkie takie twierdzenia.
- **Nie używaj pod presją zapieczętowania przed zakończeniem akwizycji.**
  Pieczęć częściowej akwizycji błędnie przedstawia stan.
- **Nie używaj do publikowania nazwisk biegłych**, chyba że twoja
  jurysdykcja tego konkretnie wymaga, a biegli wyrazili indywidualną
  zgodę. Domyślne ustawienie to publikacja na poziomie roli.
- **Nie używaj w sprawach niejawnych ani objętych zastrzeżeniem
  poufności** bez wyraźnego zezwolenia sądu. Opublikowanie identyfikatora
  sprawy na łańcuchu Bitcoin jest nieodwracalne; jeśli sprawa zostanie
  później utajniona, publiczna pieczęć nie może zostać wycofana. Zestaw
  jest przeznaczony wyłącznie do akwizycji jawnych.
- **Nie używaj jako teatru legitymizacji.** Pieczęć wadliwej akwizycji
  jest trwałym publicznym zapisem wad, a nie obroną przed nimi. Prymityw
  działa w obie strony; na tym polega jego uczciwość.

## Jak sforkować ten zestaw na potrzeby rzeczywistej akwizycji

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # zastąp fikcyjną zawartość rzeczywistą
                       # stosuj reguły odmowy R1-R8 wszędzie
bash build/seal.sh     # zapieczętuj W MOMENCIE lub tuż po zakończeniu obrazowania
python3 build/verify.py
```

**Krytyczny moment:** zapieczętuj W MOMENCIE lub tuż po zakończeniu
obrazowania (zdarzenie E17 w FAKCIE 05 w przykładowej chronologii).
Pieczęć w trakcie obrazowania tworzy zapis częściowej akwizycji;
pieczęć znacznie później tworzy lukę, w której agencja mogłaby zmienić
obrazy. Właściwym oknem jest moment bezpośrednio po zakończeniu
weryfikacji obrazu ostatniej pozycji w zbiorze materiału dowodowego.

**Krytyczny przegląd:** przed zapieczętowaniem przepuść publikację
przez drugiego biegłego kryminalistycznego (nie głównego) oraz przez
radcę prawnego agencji. Po zapieczętowaniu publikacja jest trwała.

## Integracja z istniejącą infrastrukturą łańcucha kontroli

- **System Zarządzania Sprawami agencji (CMS).** CMS pozostaje
  podstawowym systemem dokumentującym agencji. Pieczęć nie zastępuje
  CMS; zobowiązuje się do bajtów i metodyki, które CMS rejestruje,
  dzięki czemu post-hoc edycje CMS są publicznie wykrywalne.
- **Federalne Zasady Dowodowe / Daubert / stanowe kodeksy dowodowe.**
  Pieczęć dokłada się do zapisu uwierzytelnienia FRE 901, dostarczając
  odpornej na manipulację integralności. NIE spełnia samodzielnie
  FRE 702 / Daubert; rzetelność metodyczna jest nadal testowana
  na rozprawie dowodowej.
- **Udostępnianie obronie (FRCP 16, Brady, Giglio i odpowiedniki
  stanowe).** Towarzyszące zapisy zhashowane w FAKCIE 05 (przypisanie
  ról do osób, dziennik kontroli, fotografie plomb sabotażowych itd.)
  pozostają objęte zwykłym udostępnianiem. Pieczęć kotwiczy to, co
  zapisy te stwierdzały w momencie akwizycji, więc późniejsze
  twierdzenia typu "zapis był wtedy inny" są publicznie obalalne.
- **NIST Computer Forensics Tool Testing (CFTT).** Zestaw odwołuje się
  do dzienników weryfikacji CFTT w FAKCIE 04 / FAKCIE 05; odwołanie
  jest hashem, a nie samym dziennikiem, więc procesy CFTT pozostają
  bez wpływu.
- **Wyznaczeni przez sąd neutralni eksperci i biegli obrony.** Każdy
  z nich może ponownie zhashować obrazy kryminalistyczne, które
  otrzymuje w ramach udostępnienia, względem manifestu FAKT 03,
  niezależnie od współpracy agencji. Jest to główna wartość dodana
  zestawu dla strony obrony.
- **Przegląd apelacyjny.** Lata później kryminalistyczny weryfikator
  apelacyjny może zweryfikować pierwotną metodykę akwizycji względem
  zapieczętowanego zapisu FAKT 04, a nie względem potencjalnie
  zmienionych aktualnych wspomnień agencji.

## Czego ten zestaw NIE zastępuje

- Federalnych Zasad Dowodowych (ani żadnego stanowego kodeksu dowodowego).
- Standardów rzetelności biegłego Daubert / Frye.
- SOP kryminalistycznych agencji i jej CMS.
- Zobowiązań obrony do udostępniania zgodnie z FRCP 16 / Brady / Giglio /
  odpowiednikami stanowymi.
- Postanowień sądu, wniosków o wyłączenie dowodów, rozpraw dowodowych
  ani żadnego innego procesu administrowanego przez sąd.
- NIST CFTT ani żadnego innego reżimu testowania narzędzi.
- Protokołu filtra tajemnicy / zespołu czyszczącego agencji.

## Dlaczego ten zestaw istnieje w v0.4.0+

To jest ósmy opracowany przykład dostarczany z myriam-kit. Stosuje
strukturę "ograniczenia na pierwszym miejscu" potwierdzoną przez
autobadania udokumentowane w `~/Genesis/calc/PROMPT_LIBRARY_v0.md` —
wariant promptu "ograniczenia na pierwszym miejscu" uzyskał najwyższy
wynik w ważonej rubryce ocen w wielu dziedzinach przykładów. Sekcje
otwierające stanowią nośne części zestawu; zawartość manifestu jest
częścią łatwiejszą.

Projekt zestawu jest celowo zachowawczy w kwestii publikacji nazwisk
biegłych i agresywny co do zastrzeżenia "to nie stanowi o dopuszczalności".
Środowisko kryminalistyczne ma udokumentowaną historię ataków za swoją
pracę kryminalistyczną; zestaw przyjmuje domyślnie bezpieczniejsze
stanowisko dla biegłych. Agencje w jurysdykcjach, w których publiczne
ujawnienie nazwisk jest wymagane, mogą odpowiednio zmodyfikować swój
fork, ale domyślna odmowa stoi po stronie bezpieczeństwa biegłych.

## Licencja

Domena publiczna (CC0). Forkuj. Nie wymagamy podawania autorstwa.
