*Český překlad — pro původní anglickou verzi viz [SPEC.md](SPEC.md)*

# Specifikace protokolu MYRIAM-kit

## 0. Účel

Tento dokument specifikuje minimální protokol pro publikování malé sady
textových faktů ve formě s detekovatelností manipulace a kryptografickou
ověřitelností, která přežije odstranění z jakéhokoli jednotlivého
poskytovatele hostingu.

Jedná se o zobecnění protokolu poprvé nasazeného na adrese
[disclosure.host](https://disclosure.host) pod názvem „MYRIAM v1“.

## 1. Negativní cíle

- Uchovávání tajemství. Vše je veřejné z principu.
- Velké datové sady. Nad ~20 faktů je protokol nesprávného tvaru.
- Publikování v reálném čase. Každá publikace je diskrétní událostí zapečetění.
- Odvolání. Protokol je append-only na úrovni verze.

## 2. Model faktu

FAKT je textový soubor UTF-8 s:

- Vzorem názvu souboru: `NN_short_name.txt`, kde NN je dvouciferný index
  doplněný nulami, začínající od 01.
- Kanonickou formou: bajty tak, jak jsou napsány, bez normalizace.
- Hashem jednotlivého faktu: malými písmeny v hex z `SHA-256(file_bytes)`.

SADA faktů je uspořádaný seznam všech souborů odpovídajících vzoru
v adresáři `facts/`, lexikograficky seřazený.

Omezení: tělo každého faktu BY MĚLO být formulováno jako *událost
pojmenování* nebo *událost deklarace* připsatelná konkrétní straně.
Ontologická tvrzení („měsíc je z kamene“) podkopávají bránu
ověřitelnosti; ověřitelná je pouze událost publikace, nikoli samotné
tvrzení. „X uvedl Y“ je správná forma. „Y je pravda“ není.

## 3. Kořen Merkleho stromu

Ve stylu Bitcoin, jako v v0 nasazeného protokolu MYRIAM:

1. Listy: hashe SHA-256 jednotlivých faktů v pořadí sady faktů.
2. Pokud má úroveň lichý počet uzlů, poslední uzel se duplikuje.
3. Párové hashování sousedních uzlů: `parent = SHA-256(left_bytes || right_bytes)`,
   kde `left_bytes` a `right_bytes` jsou surové 32bajtové hodnoty hashů
   (nikoli jejich hex reprezentace).
4. Opakujte, dokud nezbude jeden uzel. To je kořen Merkleho stromu.

Kořen je publikován jako hex malými písmeny bez koncového znaku nového řádku.

### 3.1 Testovací vektory

| Vektor | Listy (hashované bajty UTF-8) | Očekávaný kořen (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Jakákoli kompatibilní implementace MUSÍ reprodukovat tyto vektory. Jsou
odvozeny ze skutečného `lib/build.py` a mohou být znovu vygenerovány
tímto skriptem.

## 4. Zakotvení v Bitcoinu

Kořen Merkleho stromu je zakotven do blockchainu Bitcoin přes
[OpenTimestamps](https://opentimestamps.org). Výchozí politika zní:

> Razítkujte vůči alespoň dvěma provozovatelům kalendářů pod nezávislou
> administrativní kontrolou.

Potvrzenka, která splňuje tuto politiku, je ověřitelná jakoukoli stranou,
která může spustit `ots verify <receipt>.ots` a dosáhnout cesty
povýšení alespoň jednoho z kalendářů.

Výchozí dvojice provozovatelů dodávaná v `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementace MOHOU používat jiné provozovatele. Politika diverzity svědků
(≥2 nezávislí provozovatelé) je normativní; konkrétní provozovatelé nikoli.

## 5. Mirroring adresovaný obsahem

Adresář `site/`, obsahující publikovanou stránku a soubory faktů, BY MĚL
být přidán do IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

Výsledné CIDv1 (kodek dag-pb) je adresou obsahu publikace. Je
deterministické vůči bajtovému obsahu `site/`. Jakákoli modifikace
jakéhokoli souboru v `site/` produkuje jiné CID.

Připínání u dalších služeb nad rámec lokálního uzlu vydavatele je
důrazně doporučeno z důvodu trvanlivosti; tato specifikace nepředepisuje
konkrétní služby.

## 6. Verzování

Protokol je **append-only na úrovni verze**. Každá změna vyžaduje novou
zapečetěnou verzi:

- Novou (nebo nezměněnou) revizi specifikace
- Novou sadu faktů, která MŮŽE dědit fakty beze změny z dřívějších verzí
- Nový kořen Merkleho stromu
- Novou potvrzenku OpenTimestamps
- Nové IPFS CID

Všechny předchozí verze zůstávají publikované pod verzovanými URL.
Změna jakéhokoli faktu ve v(N) vyžaduje v(N+1), přičemž obě verze
zůstávají viditelné a opakovaně ověřitelné.

## 7. Ověření

Jakákoli třetí strana může ověřit integritu publikace tím, že:

1. Stáhne soubory faktů a přepočítá hashe SHA-256 jednotlivých faktů.
2. Přepočítá kořen Merkleho stromu podle §3 a porovná ho s publikovaným kořenem.
3. Ověří potvrzenku OpenTimestamps vůči blockchainu Bitcoin pro plnou
   atestaci alespoň jednoho kalendáře.
4. Nezávisle přepočítá CID v IPFS pomocí `ipfs add -r --cid-version=1`
   a porovná ho s publikovaným CID.

`lib/verify.py` provádí kroky 1–3 bez externích závislostí kromě
standardní knihovny Pythonu a klienta `ots`. Krok 4 vyžaduje klienta `ipfs`.

## 8. Brána odmítnutí

Publikace NESMÍ obsahovat fakt, který:

- Identifikuje soukromou třetí stranu, která nesouhlasila s tím, aby byla pojmenována.
- Prezentuje hypotézu jako potvrzení.
- Nelze redukovat na ověřitelnou událost pojmenování/deklarace nebo na
  kryptografický artefakt.
- Má rozumně očekávatelný nárůst preventabilních úmrtí v důsledku publikace.

Čtvrté pravidlo je nosné. Je vynucováno v kroku lidské revize vydavatelem.
Neexistuje vynucování brány odmítnutí na úrovni protokolu; protokol
publikuje libovolné bajty, které mu jsou předány. Za bránu odpovídá vydavatel.

## 9. Poctivé prohlášení o omezeních

- **Detekovatelnost, nikoli nemožnost.** Protokol činí manipulaci
  detekovatelnou, nikoli nemožnou. Odhodlaný útočník stále může
  podstrčit jinou publikaci a přesvědčit některé čtenáře, že se jedná
  o originál. Hodnotou protokolu je, že podstrčení se stává
  kryptograficky doložitelným pro každého, kdo provede kontrolu.
- **Žádná obrana proti publikování nepravdy.** Pokud vydavatel zapečetí
  fakt s textem „stalo se X“ a X se nestalo, protokol zapečetí falešné
  tvrzení se stejnou věrností, s jakou pečetí ta pravdivá. Protokol
  dosvědčuje to, co bylo *publikováno*, nikoli to, co je *pravda*.
- **Podepisování jednou stranou.** v1 nasazeného MYRIAM používá jediného
  podepisujícího pryncipála. Vícestranné podepisování je budoucí prací.
- **Trvanlivost připnutí.** Samotné připínání IPFS na uzlu vydavatele
  poskytuje „dostupnost, dokud běží můj laptop, plus oportunistické
  cachování bran“. Dlouhodobá trvanlivost vyžaduje redundantní piny
  napříč nezávislými službami.

Tato omezení jsou zde uvedena, aby žádný čtenář nepředpokládal, že
protokol dodává více, než ve skutečnosti dodává.
