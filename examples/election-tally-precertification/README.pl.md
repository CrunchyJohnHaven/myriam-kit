# Zestaw pieczęci pre-certyfikacji wyników wyborów (Election Tally Pre-Certification Seal Kit)

*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

Gotowy do użycia przykład myriam-kit dla powiatowych komisji wyborczych
(county boards of canvassers), stanowych organów wyborczych oraz
obserwatorów integralności wyborów, którzy chcą opublikować zakotwiczoną
w Bitcoinie, zabezpieczoną przed manipulacją (tamper-evident) pieczęć
wyniku zliczania głosów w dokładnej chwili certyfikacji.

**Zamyka** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Czego ten zestaw NIE robi (proszę przeczytać w pierwszej kolejności)

Pieczęć jest kryptograficznym znacznikiem czasu (timestamp) tego, co
zostało certyfikowane. Nie jest w stanie zweryfikować, czy to, co
certyfikowano, było prawidłowe. Następujące tryby awarii znajdują się
**poza domeną pieczęci**:

1. **Naruszenie maszyny do głosowania (voting-machine compromise).** Jeśli
   firmware został zmanipulowany lub sumy głosów zostały błędnie obliczone,
   pieczęć z wysoką integralnością zakotwicza błędną liczbę. Pieczęć
   obserwuje wyjścia systemu tabulacyjnego; nie ma wglądu w sam system.

2. **Tłumienie głosów / strukturalne pozbawienie prawa głosu (vote
   suppression / structural disenfranchisement).** Zamknięcia lokali
   wyborczych, dysproporcje w ustawach o identyfikacji, stronniczość w
   wskaźnikach odrzucenia kart do głosowania korespondencyjnego oraz
   wykreślenia z rejestru wyborców znajdują się powyżej certyfikacji.
   Pieczęć rejestruje karty zliczone, a nie karty, które powinny były
   zostać zliczone.

3. **Dezinformacja wyborcza (election misinformation).** Pieczęć nie
   rozstrzyga twierdzeń o wyborach formułowanych przez kandydatów, media
   ani platformy. Spieczętowana certyfikacja może być cytowana w narracji
   dezinformacyjnej równie łatwo, jak w obronie przed nią. Kryptograficzne
   znaczniki czasu są neutralne wobec treści.

4. **Oszustwo przedcertyfikacyjne podczas zbierania lub liczenia kart
   (pre-certification fraud during ballot collection or counting).**
   Nieprawidłowości w zbiórce kart (ballot-harvesting), manipulacje przy
   urnach (drop-box), przerwanie łańcucha kustodii podczas okna liczenia
   — wszystkie zachodzą przed chwilą pieczęci. Pieczęć nie może ich
   wykryć retroaktywnie.

5. **Przymus wobec organu certyfikującego (coercion of the certifying
   authority).** Certyfikacja wymuszona pod przymusem wytwarza
   kryptograficznie ważną pieczęć wymuszonego wyniku. Pieczęć weryfikuje,
   że urzędnik podpisał, nie zaś dlaczego.

6. **Błędne certyfikacje, które nigdy później nie zostały skorygowane
   (wrong certifications that are never later corrected).** Wartość
   pieczęci zależy od późniejszego procesu ustalania prawdy (audyt,
   ponowne przeliczenie, postępowanie sądowe), z którym pieczęć może
   zostać porównana. Jeśli taki proces nigdy nie zostanie przeprowadzony,
   pieczęć pozostaje jedynym zapisem i może utrwalić błąd.

7. **Anomalie statystyczne i wykrywanie wzorców (statistical anomalies
   and pattern detection).** Pieczęć nie oznacza nieprawdopodobnych
   marginesów, anomalii geograficznych ani odchyleń od prawa Benforda.
   Są to zadania analityczne na spieczętowanych danych, a nie własności
   samej pieczęci.

8. **Wyścigi w niższych pozycjach karty z cienkimi śladami audytowymi
   (down-ballot races with thin audit trails).** Mniejsze wyścigi mają
   słabsze wyzwalacze ponownego przeliczania; pojedyncza pieczęć nie
   może w sposób znaczący objąć wszystkich wyścigów na karcie bez
   zakresowania na poziomie pojedynczego wyścigu.

**Powyższa sekcja o uczciwych ograniczeniach (honest-limits) jest
nośnym (load-bearing) elementem tego zestawu.** Urzędnicy, którzy
uważają, że spieczętowanie równa się legitymizacji, użyją jej jako
tarczy. Zestaw musi wprost stwierdzić: jest to *prymityw
niezaprzeczalności (non-repudiation primitive) dla chwili
certyfikacji*, a nie dowód poprawności wyborów.

---

## Czego ten zestaw MUSI ODMÓWIĆ spieczętowania

Zestaw jest skonfigurowany tak, aby odrzucał następujące wzorce faktów
nawet wtedy, gdy zgłasza je użytkownik z ważnymi uprawnieniami
podpisywania:

- **Indywidualna identyfikacja wyborcy.** Żaden fakt nie może wymieniać
  wyborcy z nazwiska, łączyć karty do głosowania z wyborcą ani
  ujawniać jakiegokolwiek pola, które mogłoby ponownie zidentyfikować
  osobę.
- **Decyzje o dopasowaniu podpisu dla pojedynczej karty.** Obciążone
  PII; spieczętowanie tworzy trwałe rejestry decyzji, które mogą później
  zostać zakwestionowane.
- **Każdy fakt, którego publikacja umożliwiłaby identyfikację
  wrażliwego wyborcy.** Obejmuje wyniki na poziomie obwodu wyborczego
  w obwodach tak małych, że wybór głosu może zostać wywnioskowany
  (zwykle <50 kart).
- **Wyniki spieczętowane przed zliczeniem wszystkich kart.** Zestaw
  odmawia częściowych zliczeń przedstawionych jako „wynik”.
  Pre-certyfikacja oznacza *wszystkie karty zliczone, przed oficjalną
  certyfikacją* — a nie *w trakcie liczenia*.
- **Tymczasowe lub warunkowe certyfikacje.** Pieczęć musi odzwierciedlać
  fakt, a nie warunek.
- **Zliczenia, które wyłączają kohorty objęte toczącymi się
  postępowaniami sądowymi** bez wyraźnego spieczętowanego faktu
  towarzyszącego (companion-fact) ujawniającego to wyłączenie.
- **Pieczętowanie przez kogokolwiek innego niż organ certyfikujący**
  dla danej jurysdykcji.

Sama odmowa może zostać spieczętowana jako fakt („Niniejszy organ
zażądał spieczętowania X; zestaw odmówił zgodnie z regułą odmowy Y”),
tworząc w ten sposób publiczny zapis próby nadużycia.

---

## Co ten zestaw PIECZĘTUJE

8 faktów w chwili certyfikacji:

1. **Powiadomienie przykładowe (example notice)** — deklaruje publikację
   jako przykład (rzeczywiste poświadczenia usuwają lub zastępują tę
   sekcję).
2. **Identyfikacja jurysdykcji (jurisdiction identification)** — powiat,
   data wyborów, organ certyfikujący, urzędnicy certyfikujący z
   nazwiska i roli.
3. **Certyfikowany wynik zliczania (certified tally)** — sumy głosów
   per-wyścig per-kandydat + głosy nadmiarowe/niedoborowe (over/under-
   votes) + dopiski (write-ins).
4. **Rozliczenie i uzgodnienie kart (ballot accounting and
   reconciliation)** — łącznie oddanych, łącznie stabulowanych, łącznie
   odrzuconych według kategorii, podział według trybu, mianownik
   zarejestrowanych wyborców.
5. **Manifest sprzętu i śladu audytowego (equipment and audit-trail
   manifest)** — model tabulatora + hash firmware'u, hash pliku CVR,
   hash archiwum obrazów kart, hash dziennika kustodii, hash polityki
   dopasowania podpisów.
6. **Progi i wyzwalacze przy certyfikacji (thresholds and triggers at
   certification)** — obowiązujący próg dopasowania podpisu, progi
   wyzwalania ponownego przeliczania, rzeczywiste marginesy per wyścig,
   commitment ziarna RLA (seed commitment).
7. **Ujawnienia towarzyszące i rejestr odmów (companion disclosures and
   refusal record)** — toczące się postępowania sądowe, anomalie
   po-zliczeniowe pod analizą, wyłączone kohorty, sprzeciwiający się
   członkowie komisji; jawna lista wzorców, których zestaw odmówił
   spieczętować.
8. **Podmiot podpisujący (signing principal)** — identyfikacja Komisji
   Wyborczej (Board of Canvassers) + nazwisko każdego sygnatariusza i
   jego partia + informacje o kluczu kryptograficznym.

Każdy fakt kończy się konwencją bramki odmowy (refusal-gate): *„Ten fakt
twierdzi wyłącznie X. Nie twierdzi Y”* (gdzie Y jest najbliższym trybem
awarii z powyższej sekcji „NIE robi”).

---

## Przed czym ten zestaw broni

- **Cicha post-certyfikacyjna rewizja sum głosów** — jakakolwiek zmiana
  całkowitoliczbowa w FACT 03 wytwarza inny SHA-256, inny korzeń Merkla,
  zawodzi weryfikację OTS.
- **„Znalezione karty” po cichu wchłaniane** — arytmetyka uzgadniająca w
  FACT 04 jest utrwalona w chwili certyfikacji.
- **Roszczenia o podmianę firmware'u** — FACT 05 zamraża manifest
  sprzętu w chwili certyfikacji.
- **Post-certyfikacyjna podmiana artefaktów audytowych** — manifest
  hashy w FACT 05 wychwytuje każdą post-certyfikacyjną zmianę w CVR,
  obrazach kart, dziennikach kustodii lub polityce dopasowania podpisów.
- **Redefinicja progów i wyzwalaczy** — FACT 06 zamraża reguły
  obowiązujące w chwili certyfikacji (próg dopasowania podpisu,
  wyzwalacze ponownego przeliczania, limit ryzyka RLA).

## Przypadki historyczne lub niemal-historyczne, w których zestaw by pomógł

Zestaw wytworzyłby użyteczną kotwicę — *nie naprawę* — w sprawach
dotyczących:

- **Antrim County, Michigan (2020).** Wstępne nieoficjalne wyniki
  pokazywały zamianę kandydatów (candidate-swap), później skorygowaną
  do przeciwnego wyniku. Pieczęć przedkorekcyjna zapewniłaby publiczny
  punkt odniesienia dla tego, co mówiło pierwotne ogłoszenie, w
  porównaniu z tym, co mówiła korekta, przy czym oba byłyby poświadczone
  kryptograficznie.
- **Maricopa County, Arizona (2020–2022).** W obiegu pojawiły się
  liczne iteracje przeliczonych/ponownie zbadanych sum. Pieczęć z
  chwili certyfikacji zapewniłaby jednoznaczny punkt odniesienia, z
  którym można by porównywać każde kolejne zliczenie.
- **Floryda 2000 (canvass Bush v. Gore).** Sumy certyfikowane na
  poziomie powiatu przesuwały się pod presją ponownego przeliczania;
  pieczęć przed-przeliczeniowa na poziomie powiatu zachowałaby to, co
  każdy powiat certyfikował zanim rozpoczęto ręczne procedury ponownego
  przeliczania.
- **Różne wybory zagraniczne z udokumentowanymi „korektami”
  post-certyfikacyjnymi.** Niezależnie od jurysdykcji.

Zestaw NIE rozstrzygnąłby leżących u podstaw sporów o integralność
maszyn w 2020 r., sporów o politykę wyborów korespondencyjnych ani
żadnych wyborów, w których kwestią rdzeniową był sporny fakt, a nie
sporny zapis.

## Kiedy używać tego zestawu

- Twoja jurysdykcja ma stabilny, audytowany proces certyfikacji i chce
  dodać niezmienną kotwicę publiczną.
- Spodziewasz się post-certyfikacyjnej kontroli i chcesz punktu
  odniesienia odpornego na manipulację.
- Masz prawne uprawnienia do publikacji wymienionego zbioru faktów bez
  ujawniania PII.
- Masz równoległy proces audytowy lub RLA, aby pieczęć można było
  porównać z wynikiem ustalania prawdy.

## Kiedy NIE używać tego zestawu

- **Nie używaj jako substytutu audytów ograniczających ryzyko
  (risk-limiting audits, RLA), ręcznych ponownych przeliczeń ani
  audytów powyborczych.** Ten zestaw jest *dodatkiem*, nie zastępcą.
- **Nie używaj, jeśli urzędnik certyfikujący nie jest faktycznym
  decydentem** (tworzy fałszywą atrybucję).
- **Nie używaj w trakcie tabulacji.** Zestaw jest przeznaczony
  szczególnie dla chwili certyfikacji. Pieczęcie częściowych zliczeń
  tworzą mylące punkty odniesienia.
- **Nie używaj do twierdzenia, że wybory były uczciwe, dokładne lub
  legalne** — nie może tego zrobić.
- **Nie używaj pod presją, by spieczętować wcześniej niż w chwili
  certyfikacji, ani by pominąć ujawnienie faktu towarzyszącego.**
  Odmów i spieczętuj odmowę.
- **Nie używaj jako teatru legitymizacji (legitimacy theater).** Pieczęć
  oszukańczego wyniku jest trwałym publicznym zapisem oszustwa, a nie
  obroną przed nim. Ten prymityw tnie w obie strony; to jego uczciwość.

## Jak zforkować ten zestaw do prawdziwej certyfikacji

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # zastąp fikcyjną treść rzeczywistą
bash build/seal.sh     # spieczętuj W CHWILI oficjalnego podpisu certyfikacji lub po nim
python3 build/verify.py
```

**Krytyczne wyczucie czasu:** pieczętuj W CHWILI certyfikacji, NIE
wcześniej. Pieczęć przed oficjalną certyfikacją tworzy fałszywie
pozytywny (false-positive) zapis „to jest wynik oficjalny”. Pieczęć
po jest konwencjonalną niezaprzeczalnością.

## Integracja z istniejącą infrastrukturą wyborczą

- **Stanowe Komisje Wyborcze (State Boards of Elections) / certyfikacja
  EAC.** Zestaw publikuje obok oficjalnego dokumentu certyfikacyjnego.
  Nie zastępuje certyfikacji ustawowej.
- **Audyty ograniczające ryzyko (RLA).** Hash CVR w FACT 05 jest tym
  samym hashem, który konsumuje narzędzie RLA. Pieczęć wiąże audytowany
  CVR z certyfikowanym wynikiem.
- **Procedury ponownego przeliczania.** Ponowne przeliczanie wywołane
  na podstawie prawa stanowego wytwarza NOWY spieczętowany zbiór faktów
  (inny znacznik czasu, inne hashe, ta sama jurysdykcja). Obie pieczęcie
  współistnieją; żadna nie nadpisuje drugiej. Różnica (diff) między
  pieczęciami jest publicznym zapisem tego, co zmieniło ponowne
  przeliczanie.
- **Election Markup Language (EML) i Common Data Format (CDF).** Treści
  faktów powinny być wyprowadzalne z istniejących w jurysdykcji wyjść
  EML/CDF, aby zachować agnostyczność zestawu wobec formatu danych.
- **Dwupartyjne podpisywanie przez komisję wyborczą.** Wariant
  wielopodpisowy (multi-signature) zalecany dla jurysdykcji z komisjami
  zrównoważonymi partyjnie.

## Czego ten zestaw NIE zastępuje

- Certyfikacji ustawowej zgodnie ze stanowym prawem wyborczym
- Certyfikacji systemu głosowania przez EAC
- Audytów ograniczających ryzyko (RLA) / ręcznych ponownych przeliczeń
- Procedur ponownego przeliczania i audytów powyborczych
- Nakazów sądowych ani postępowań w sprawie zaskarżenia wyborów

## Dlaczego ten zestaw istnieje w wersji v0.3.0+

To 6. przykład roboczy dostarczany z myriam-kit. Zestaw został
wyprodukowany poprzez proces autoresearch w stylu Karpathy'ego
udokumentowany w `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Trzy
warianty prompta (imitacja / pierwszych zasad / zorientowany na
ograniczenia) wytworzyły równoległe szkice zestawu; wariant
zorientowany na ograniczenia uzyskał najwyższą ocenę w ważonej
rubryce, a finalny zestaw syntetyzuje jego strukturę ze spójnością
wariantu imitacyjnego oraz operacyjnym szczegółem wariantu pierwszych
zasad.

Sam autoresearch jest udokumentowany jako wzorzec prompta w
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` do przyszłego użycia.

## Licencja

Domena publiczna (CC0). Forkuj. Bez wymogu atrybucji.
