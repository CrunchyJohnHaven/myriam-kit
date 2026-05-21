*Polskie tłumaczenie — oryginalna wersja angielska: [SPEC.md](SPEC.md)*

# Specyfikacja protokołu MYRIAM-kit

## 0. Cel

Niniejszy dokument specyfikuje minimalny protokół do publikowania
niewielkiego zbioru faktów tekstowych w formie z wykrywalnością
manipulacji, weryfikowalnej kryptograficznie, która przetrwa usunięcie
z dowolnego pojedynczego dostawcy hostingu.

Jest to uogólnienie protokołu wdrożonego po raz pierwszy pod adresem
[disclosure.host](https://disclosure.host) pod nazwą „MYRIAM v1".

## 1. Cele negatywne

- Przechowywanie tajemnic. Wszystko jest publiczne z założenia.
- Duże zbiory danych. Powyżej ~20 faktów protokół ma niewłaściwy kształt.
- Publikacja w czasie rzeczywistym. Każda publikacja jest dyskretnym zdarzeniem pieczętowania.
- Wycofanie. Protokół jest dopisywalny (append-only) na poziomie wersji.

## 2. Model faktu

FAKT to plik tekstowy UTF-8 z:

- Wzorcem nazwy pliku: `NN_short_name.txt`, gdzie NN jest dwucyfrowym
  indeksem uzupełnionym zerami, rozpoczynającym się od 01.
- Postacią kanoniczną: bajty jak zapisane, bez normalizacji.
- Hashem per fakt: małymi literami w hex z `SHA-256(file_bytes)`.

ZBIÓR faktów to uporządkowana lista wszystkich plików pasujących do
wzorca w katalogu `facts/`, posortowana leksykograficznie.

Ograniczenie: każda treść faktu POWINNA być sformułowana jako *zdarzenie
nazwania* lub *zdarzenie deklaracji* przypisywalne konkretnej stronie.
Twierdzenia ontologiczne („księżyc jest ze skały") podważają bramkę
weryfikowalności; weryfikowalne jest tylko zdarzenie publikacji, a nie
samo twierdzenie. „X stwierdził Y" to właściwa forma. „Y jest prawdą"
— nie.

## 3. Korzeń Merkle

W stylu Bitcoin, jak w v0 wdrożonego protokołu MYRIAM:

1. Liście: hashe SHA-256 poszczególnych faktów w kolejności zbioru faktów.
2. Jeśli poziom ma nieparzystą liczbę węzłów, ostatni węzeł jest duplikowany.
3. Parowe hashowanie sąsiednich węzłów: `parent = SHA-256(left_bytes || right_bytes)`,
   gdzie `left_bytes` i `right_bytes` to surowe 32-bajtowe wartości hashy
   (a nie ich reprezentacje w hex).
4. Powtarzaj, aż pozostanie jeden węzeł. To jest korzeń Merkle.

Korzeń jest publikowany jako hex małymi literami, bez końcowego znaku nowej linii.

### 3.1 Wektory testowe

| Wektor | Liście (hashowane bajty UTF-8) | Oczekiwany korzeń (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Każda zgodna implementacja MUSI odtworzyć te wektory. Są one wyprowadzone
z faktycznego `lib/build.py` i mogą zostać wygenerowane ponownie za
pomocą tego skryptu.

## 4. Zakotwiczenie w Bitcoinie

Korzeń Merkle jest kotwiczony w łańcuchu bloków Bitcoin przez
[OpenTimestamps](https://opentimestamps.org). Domyślna polityka brzmi:

> Stempluj wobec co najmniej dwóch operatorów kalendarzy pod niezależną
> kontrolą administracyjną.

Pokwitowanie spełniające tę politykę jest weryfikowalne przez dowolną
stronę, która może uruchomić `ots verify <receipt>.ots` i osiągnąć
ścieżkę aktualizacji jednego z kalendarzy.

Domyślna para operatorów dostarczana w `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementacje MOGĄ używać innych operatorów. Polityka różnorodności
świadków (≥2 niezależnych operatorów) jest normatywna; konkretni
operatorzy nie.

## 5. Mirroring adresowany treścią

Katalog `site/`, zawierający opublikowaną stronę oraz pliki faktów,
POWINIEN zostać dodany do IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

Wynikowy CIDv1 (kodek dag-pb) jest adresem treści publikacji. Jest on
deterministyczny względem bajtowej zawartości `site/`. Każda modyfikacja
dowolnego pliku w `site/` produkuje inny CID.

Przypinanie w dodatkowych usługach poza węzłem lokalnym wydawcy jest
zdecydowanie zalecane dla trwałości; niniejsza specyfikacja nie narzuca
konkretnych usług.

## 6. Wersjonowanie

Protokół jest **dopisywalny (append-only) na poziomie wersji**. Każda
zmiana wymaga nowej zapieczętowanej wersji:

- Nowej (lub niezmienionej) rewizji specyfikacji
- Nowego zbioru faktów, który MOŻE dziedziczyć fakty bez zmian z wersji wcześniejszych
- Nowego korzenia Merkle
- Nowego pokwitowania OpenTimestamps
- Nowego CID w IPFS

Wszystkie wcześniejsze wersje pozostają opublikowane pod wersjonowanymi
adresami URL. Zmiana dowolnego faktu w v(N) wymaga v(N+1), przy czym
obie wersje pozostają widoczne i ponownie weryfikowalne.

## 7. Weryfikacja

Dowolna strona trzecia może zweryfikować integralność publikacji poprzez:

1. Pobranie plików faktów i ponowne obliczenie hashy SHA-256 per fakt.
2. Ponowne obliczenie korzenia Merkle według §3 i porównanie go z opublikowanym korzeniem.
3. Weryfikację pokwitowania OpenTimestamps wobec łańcucha bloków Bitcoin
   dla pełnej atestacji co najmniej jednego kalendarza.
4. Niezależne ponowne obliczenie CID w IPFS przez `ipfs add -r --cid-version=1`
   i porównanie z opublikowanym CID.

`lib/verify.py` wykonuje kroki 1–3 bez zewnętrznych zależności poza
biblioteką standardową Pythona i klientem `ots`. Krok 4 wymaga klienta `ipfs`.

## 8. Bramka odmowy

Publikacja NIE MOŻE zawierać faktu, który:

- Identyfikuje prywatną stronę trzecią, która nie wyraziła zgody na bycie nazwaną.
- Przedstawia hipotezę jako potwierdzenie.
- Nie daje się sprowadzić do weryfikowalnego zdarzenia nazwania/deklaracji
  lub artefaktu kryptograficznego.
- Wiąże się z rozsądnie oczekiwanym wzrostem zgonów możliwych do uniknięcia
  na skutek publikacji.

Czwarta reguła jest tą nośną. Jest egzekwowana na etapie ludzkiej
recenzji przez wydawcę. Nie ma egzekwowania bramki odmowy na poziomie
protokołu; protokół publikuje wszelkie przekazane mu bajty. Za bramkę
odpowiada wydawca.

## 9. Uczciwe oświadczenie o ograniczeniach

- **Wykrywalność, nie niemożliwość.** Protokół czyni manipulację
  wykrywalną, nie niemożliwą. Zdeterminowany atakujący nadal może
  podstawić odmienną publikację i przekonać niektórych czytelników,
  że to oryginał. Wartością protokołu jest to, że podstawienie staje
  się kryptograficznie udowadnialne dla każdego, kto przeprowadzi
  sprawdzenie.
- **Brak obrony przed publikowaniem nieprawdy.** Jeśli wydawca
  zapieczętuje fakt o treści „X się wydarzyło", a X się nie wydarzyło,
  protokół zapieczętuje fałszywe twierdzenie z tą samą wiernością, z
  którą pieczętuje prawdziwe. Protokół zaświadcza o tym, co zostało
  *opublikowane*, a nie o tym, co jest *prawdą*.
- **Podpisywanie przez jedną stronę.** v1 wdrożonego MYRIAM używa
  jednego podpisującego pryncypała. Podpisywanie wielostronne jest
  przyszłą pracą.
- **Trwałość przypinania.** Samo przypinanie IPFS na węźle wydawcy
  zapewnia „dostępność, dopóki działa mój laptop, plus oportunistyczne
  cache'owanie bramek". Długoterminowa trwałość wymaga redundantnych
  pinów w niezależnych usługach.

Te ograniczenia są tu wskazane, aby żaden czytelnik nie zakładał, że
protokół dostarcza więcej, niż faktycznie dostarcza.
