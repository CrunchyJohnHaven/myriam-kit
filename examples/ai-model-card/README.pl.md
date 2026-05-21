*Polskie tłumaczenie — oryginalna wersja angielska: [README.md](README.md)*

# Zestaw blokady zachowania modelu AI

Gotowy do użycia przykład myriam-kit dla laboratoriów AI (komercyjnych
lub open-source), które wydają model i chcą, aby twierdzenia tego
wydania — tożsamość wag, możliwości, wyniki ocen, przegląd
bezpieczeństwa, zobowiązania przed wdrożeniem — były **kryptograficznie
zakotwiczone i publicznie weryfikowalne**.

Zestaw broni przed konkretnym trybem niepowodzenia, w którym wdrożone
modele po cichu dryfują, wyniki ocen są zmieniane wstecznie, lub
zobowiązania sprzed wdrożenia są lata później kwestionowane jako
"nigdy tego nie powiedzieliśmy."

## Co ten zestaw wytwarza

Kryptograficznie zapieczętowany manifest zawierający, dla jednego
wydania modelu:

1. Identyfikację modelu (nazwa, architektura, liczba parametrów,
   licencja)
2. **SHA-256 pliku wag** — kanoniczny hash artefaktu
3. Tekst karty modelu (możliwości, zamierzone użycie, użycie poza
   zakresem, znane tryby niepowodzeń)
4. Wyniki ocen przy wydaniu (oceny możliwości, oceny bezpieczeństwa,
   kalibracja)
5. Zobowiązania przed wdrożeniem (rzeczy, których zobowiązujesz się
   nie zmieniać po cichu po wydaniu)
6. Mocodawcę podpisującego (człowiek + organizacja biorący
   odpowiedzialność)

Pieczęć sprawia, że każde z powyższych jest bajt-stabilne, czasowo
zakotwiczone w Bitcoinie poprzez OpenTimestamps i możliwe do pobrania
przez IPFS niezależnie od jakiejkolwiek pojedynczej strony hostingowej.

Zobacz opracowany przykład fikcyjny: [facts/](facts/) i wyrenderowany
[site/index.html](site/index.html). Przykład używa fikcyjnego modelu
("Calm-mini-v0"); prawdziwe wydanie zastąpiłoby zawartość przykładu.

## Przed czym broni ten zestaw

**Tryby niepowodzeń, które pieczęć bezpośrednio wychwytuje:**

- **Manipulacja wagami** — SHA-256 wydanego pliku wag znajduje się
  w FAKCIE 03. Każda zmiana po wydaniu bajtów, które użytkownik
  pobiera, jest wykrywalna poprzez ponowne haszowanie.
- **Ciche wsteczne zmiany ocen** — wyniki ocen przy wydaniu znajdują
  się w FAKCIE 05. Przyszłe spory typu "wynik oceny zawsze wynosił X"
  mają publiczne zakotwiczenie.
- **Dryf twierdzeń o możliwościach** — tekst karty modelu w FAKCIE 04
  jest bajt-stabilny. Przyszłe spory typu "nigdy nie twierdziliśmy
  o możliwości X" są publicznie sprawdzalne wobec zapieczętowanego
  tekstu.
- **Ciche redystrybucje fine-tuningu** — zobowiązanie #1 sprzed
  wdrożenia w FAKCIE 06 (w opracowanym przykładzie) to "żadnego
  cichego fine-tuningu pod tą samą nazwą." Wykrywanie: każdy nowy
  hash wag oznacza nową nazwę modelu i nową zapieczętowaną
  publikację, w przeciwnym razie zobowiązanie jest złamane.
- **Ukryte tryby niepowodzeń** — FAKT 04 zobowiązuje się do listy
  znanych trybów niepowodzeń. Lista jest monotoniczna (może rosnąć,
  nie kurczyć się dla zamrożonego checkpointu). Przyszłe odkrycia
  trybów niepowodzeń, o których laboratorium wiedziało wewnętrznie,
  ale nie opublikowało, stają się dowodem podlegającym sporowi.

**Tryby niepowodzeń NIE objęte:**

- Modele nadużywane przez użytkowników w dalszej części łańcucha
  (pieczęć dowodzi, co zostało wydane, a nie co użytkownicy z tym
  robią).
- Adwersaryjny fine-tuning przez strony trzecie (fine-tune strony
  trzeciej wytwarza inny hash wag, więc oryginalna pieczęć nie jest
  naruszona, ale model strony trzeciej znajduje się poza ochroną
  pieczęci).
- Zmiany zachowania spowodowane zmianami środowiska wdrożenia (inne
  prompty systemowe, konfiguracje RAG itp.).
- Niepowodzenia, o których laboratorium szczerze nie wiedziało w
  czasie wydania. Pieczęć zobowiązuje laboratorium do *tego, co
  wiedzieli*; nie może zakotwiczyć tego, czego nie wiedzieli.

## Kiedy używać tego zestawu

Powinieneś rozważyć zapieczętowanie karty modelu, jeśli:

- Publikujesz wagi modelu publicznie LUB wdrażasz model w kontekście,
  w którym użytkownicy w dalszej części łańcucha dbają o stabilność
  zachowania.
- Wydanie jest na tyle istotne, że przyszłe spory typu "nigdy tego
  nie powiedzieliśmy" są prawdopodobne (każdy model wdrożony na
  skalę; każdy model krytyczny dla bezpieczeństwa; każde wydanie
  z dołączonymi twierdzeniami o możliwościach).
- Twoja organizacja jest gotowa podjąć zobowiązania sprzed wdrożenia,
  które ograniczają przyszłe działania (to jest ta nośna część —
  zobacz następny rozdział).
- Możesz obliczyć SHA-256 pliku wag przy wydaniu.

## Kiedy NIE używać tego zestawu

NIE używaj tego zestawu, jeśli:

- Nie jesteś gotów być związany zobowiązaniami sprzed wdrożenia
  w FAKCIE 06 przykładu. Pieczęć sprawia, że zobowiązania są
  mechanicznie wykrywalne; jeśli nie jesteś przygotowany na tę
  odpowiedzialność, nie pieczętuj.
- Plik wag będzie się często zmieniał (np. ciągłe potoki fine-
  tuningu). Każda zmiana wag wymaga nowego zapieczętowanego
  wydania. Pieczętowanie per-wydanie jest ciężkie; ten zestaw jest
  dla *zamrożonych* checkpointów.
- Nie wykonałeś jeszcze przeglądu bezpieczeństwa. Pieczęć
  zobowiązuje wyniki przeglądu bezpieczeństwa. Jeśli zapieczętujesz
  niekompletny przegląd, masz permanentny publiczny rekord
  niekompletnego przeglądu.
- Możesz chcieć później wycofać jakikolwiek konkretny wynik oceny.
  Pieczęć jest permanentna. Nowe zapieczętowane publikacje mogą
  zastąpić, ale oryginał nie może być cofnięty.

## Nośne zobowiązania sprzed wdrożenia

FAKT 06 przykładu zobowiązuje wydawcę do:

1. **Brak cichego fine-tuningu pod tą samą nazwą.** Każdy fine-tune
   wytwarza nową nazwę modelu, nową zapieczętowaną publikację, nowy
   hash wag. Poprzednik pozostaje kanonicznie nazwaną wersją.

2. **Brak cichych aktualizacji ocen.** Ponowne oceny otrzymują nowe
   zapieczętowane publikacje, które odwołują się do oryginału przez
   korzeń Merkle'a. Wersje są śledzone, nie nadpisywane.

3. **Znane tryby niepowodzeń mogą rosnąć, nigdy się kurczyć.**
   Zamrożony checkpoint nie może mieć trybów niepowodzeń
   naprawionych. Tak więc opublikowana lista jest efektywnie
   monotoniczna.

4. **Obsługa wycofania.** W razie przymusu usunięcia modelu z
   dystrybucji laboratorium zobowiązuje się do opublikowania
   końcowego zapieczętowanego oświadczenia o wycofaniu.

Laboratorium przyjmujące ten zestaw musi zdecydować, które z tych
zobowiązań może faktycznie honorować. Jeśli nie możesz honorować
wszystkich czterech, zmodyfikuj FAKT 06 *przed* pieczętowaniem,
aby odzwierciedlał to, co możesz honorować, i zaakceptuj wynikłą
osłabioną ochronę. Pieczętowanie zobowiązań, których nie zamierzasz
honorować, jest gorsze niż brak pieczętowania w ogóle.

## Jak forkować ten zestaw dla rzeczywistego wydania

```bash
# 1. Copy this example into your release pipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Edit each fact for your real release
$EDITOR facts/01_example_notice.txt   # REMOVE — your release is not an example
                                       # Replace with a release notice for your model
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # the canonical model card
$EDITOR facts/05_eval_results.txt     # actual eval results
$EDITOR facts/06_release_commitments.txt # which commitments you can honor

# 3. Update site/index.html to reflect the real release.

# 4. Seal.
bash build/seal.sh

# 5. Verify locally.
python3 build/verify.py

# 6. Deploy to:
#    - Your release page (next to the model card and weights)
#    - The IPFS network (the seal.sh script already does this)
#    - Optionally: link to the sealed publication from your
#      Hugging Face / GitHub release notes
```

## Integracja z istniejącymi potokami wydań

Zestaw jest zaprojektowany tak, by współgrać z istniejącymi
narzędziami, a nie je zastępować:

- **Hugging Face**: dołącz URL zapieczętowanej publikacji lub IPFS
  CID w README.md karty modelu. Skieruj czytelników do pieczęci dla
  bajt-stabilnych twierdzeń wydania.
- **Wydania GitHub**: dołącz pokwitowanie OpenTimestamps
  (`merkle_root.txt.ots`) jako zasób wydania. Przyszłe spory typu
  "wydanie się zmieniło" są wtedy zakotwiczone do Bitcoina.
- **Standardy karty modelu (Mitchell et al. 2019)**: zestaw jest
  kompatybilny. Standardowe pola karty modelu mapują się do FAKTÓW
  02–05 pieczęci. Wytwarzasz kartę modelu normalnie i dodatkowo
  ją pieczętujesz.
- **Uprzęże ocen (lm-evaluation-harness, BIG-bench itp.)**:
  zahaszuj dokładny commit uprzęży i surowy wyjściowy JSON;
  odwołaj się do tych hashy w FAKCIE 05. Przyszłe ponowne
  uruchomienia są wtedy niezależnie odtwarzalne.

## Obliczanie hasha wag

Dla jednego pliku safetensors:

```bash
shasum -a 256 model.safetensors
```

Dla wielo-plikowych checkpointów (shardy GGUF, podzielone na shardy
safetensors):

```bash
# Concatenate hashes in sorted order, then hash again
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Ostateczny hash to ten, który trafia do FAKTU 03. Dołącz zarówno
hashe per-shard, jak i ostateczny zagregowany hash, aby użytkownicy
mogli weryfikować poszczególne shardy w trakcie ich pobierania.

## Co odbiorcy (użytkownicy twojego modelu) powinni wiedzieć

Wydanie modelu z publikacją zapieczętowaną MYRIAM pozwala
użytkownikowi:

1. **Zweryfikować wagi, które pobrali**, poprzez ponowne
   zahaszowanie i porównanie z FAKTEM 03.
2. **Zweryfikować, że karta modelu nie została zmieniona
   wstecznie**, sprawdzając zapieczętowany FAKT 04 wobec aktualnie
   opublikowanej wersji laboratorium.
3. **Zweryfikować, że wyniki ocen są tymi z chwili wydania**,
   porównując bieżące twierdzenia laboratorium dotyczące ocen
   z zapieczętowanym FAKTEM 05.
4. **Pociągnąć laboratorium do odpowiedzialności za jego
   zobowiązania sprzed wdrożenia**, sprawdzając rzeczywiste
   zachowanie wobec zapieczętowanego FAKTU 06.

Użytkownik, który znajdzie rozbieżności, ma kryptograficzny dowód
rozbieżności. Może opublikować ten dowód; oryginalna zapieczętowana
publikacja jest zakotwiczeniem.

## Czym ten zestaw NIE jest

- Nie jest substytutem rzeczywistego wykonania przeglądu
  bezpieczeństwa. Pieczęć jest *rekordem* przeglądu bezpieczeństwa,
  a nie samym przeglądem.
- Nie jest substytutem rzeczywistych ocen. Pieczęć zakotwicza
  wyniki, które wytwarzasz; nie waliduje metodologii.
- Nie jest gwarancją, że model jest bezpieczny. Pieczęć
  dokumentuje, co laboratorium twierdzi o modelu przy wydaniu;
  nie certyfikuje tych twierdzeń.
- Nie jest ochroną przed nadużyciem modelu przez użytkowników
  w dalszej części łańcucha.

## Uwaga o adwersaryjnym fine-tuningu

Powszechny problem bezpieczeństwa AI: ktoś robi fine-tune twojego
modelu, aby usunąć zachowania bezpieczeństwa i redystrybuuje go.
Pieczęć NIE MOŻE temu zapobiec. To, co pieczęć może zrobić, to:

- Zakotwiczyć, co *oryginalny* model miał robić (FAKT 04).
- Zakotwiczyć, jakie były oryginalne wyniki ocen (FAKT 05).
- Zapewnić punkt odniesienia, względem którego adwersaryjne
  fine-tune'y mogą być mierzone.

Użytkownik napotykający redystrybucję od strony trzeciej może
zweryfikować, czy wagi pasują do oryginalnego zapieczętowanego
hasha. Jeśli nie, użytkownik wie, że ma nie-oryginalny model i że
wszelkie twierdzenia o bezpieczeństwie przypisywane laboratorium
nie mają zastosowania.

## Zamknięcie

Pieczętowanie wydania modelu to niewielka dodatkowa praca dla
laboratorium: ~10 minut, aby obliczyć hashe i uruchomić skrypt
pieczętowania, a następnie 30-sekundowa decyzja o tym, które
zobowiązania sprzed wdrożenia uwzględnić. Odpowiedzialność, którą
dodaje, jest asymetryczna: mały koszt dla uczciwych laboratoriów,
duże ograniczenie dla laboratoriów, które inaczej po cichu
dryfowałyby ze swoimi twierdzeniami.

Jeśli jesteś laboratorium AI rozważającym przyjęcie, zestaw jest
public domain (CC0). Forkuj go. Modyfikuj go. Matematyka jest
nośnym elementem, a nie konkretna implementacja.

## License

Public domain (CC0). No attribution required.
