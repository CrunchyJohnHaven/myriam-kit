*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [SPEC.md](SPEC.md)*

# MYRIAM-kit Protocolspecificatie

## 0. Doel

Dit document specificeert een minimaal protocol voor het publiceren van een kleine verzameling
tekstfeiten in een manipulatiedetecterende, cryptografisch verifieerbare vorm die
de verwijdering door enige individuele hostingleverancier overleeft.

Het is de generalisatie van het protocol dat voor het eerst is ingezet op
[disclosure.host](https://disclosure.host) onder de naam "MYRIAM v1."

## 1. Niet-doelen

- Geheime opslag. Alles is publiek door constructie.
- Grote datasets. Voorbij ~20 feiten heeft het protocol de verkeerde vorm.
- Realtime publicatie. Elke publicatie is een discrete verzegelingsgebeurtenis.
- Intrekking. Het protocol is append-only op versieniveau.

## 2. Feitmodel

Een FEIT is een UTF-8 tekstbestand met:

- Bestandsnaampatroon: `NN_short_name.txt` waarbij NN een met nullen opgevulde tweecijferige
  index is die begint bij 01.
- Canonieke vorm: bytes zoals geschreven, geen normalisatie.
- Hash per feit: kleine letters hex van `SHA-256(file_bytes)`.

De feit-SET is de geordende lijst van alle bestanden die overeenkomen met het patroon onder
`facts/`, lexicografisch gesorteerd.

Beperking: elk feit ZOU geformuleerd MOETEN worden als een *benoemingsgebeurtenis* of
*verklaringsgebeurtenis* die toe te schrijven is aan een specifieke partij. Ontologische beweringen
("de maan is steen") ondermijnen de verifieerbaarheidspoort; alleen de
publicatiegebeurtenis is verifieerbaar, niet de bewering. "X heeft Y verklaard" is de
juiste vorm. "Y is waar" niet.

## 3. Merkle-wortel

Bitcoin-stijl, zoals in v0 van het ingezette MYRIAM-protocol:

1. Bladeren: SHA-256-hashes per feit in feit-set-volgorde.
2. Als een niveau een oneven aantal knooppunten heeft, dupliceer dan het laatste knooppunt.
3. Pair-hash aangrenzende knooppunten: `parent = SHA-256(left_bytes || right_bytes)`,
   waarbij `left_bytes` en `right_bytes` de ruwe 32-byte hashwaarden zijn
   (niet hun hex-representaties).
4. Herhaal totdat er één knooppunt overblijft. Dat is de Merkle-wortel.

De wortel wordt gepubliceerd als kleine letters hex zonder afsluitende newline.

### 3.1 Testvectoren

| Vector | Bladeren (gehashte UTF-8 bytes) | Verwachte wortel (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Elke conforme implementatie MOET deze vectoren reproduceren. Ze zijn afgeleid
van de werkelijke `lib/build.py` en kunnen met dat script worden hergegenereerd.

## 4. Bitcoin-commitment

De Merkle-wortel wordt vastgelegd op de Bitcoin-blockchain via
[OpenTimestamps](https://opentimestamps.org). Het standaardbeleid is:

> Stempel tegen ten minste twee kalenderoperators onder onafhankelijke
> administratieve controle.

Een bewijs dat aan dit beleid voldoet is verifieerbaar door elke partij die
`ots verify <receipt>.ots` kan uitvoeren en het upgrade-pad van een van de kalenders kan bereiken.

Het standaard operator-paar dat wordt meegeleverd in `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementaties MOGEN andere operators gebruiken. Het getuige-diversiteitsbeleid
(≥2 onafhankelijke operators) is normatief; de specifieke operators
zijn dat niet.

## 5. Inhoud-geadresseerde spiegeling

De map `site/` met de gepubliceerde pagina en de feit-bestanden
ZOU aan IPFS toegevoegd MOETEN worden:

```
ipfs add -r --cid-version=1 -Q site/
```

De resulterende CIDv1 (dag-pb codec) is het inhoudsadres van de
publicatie. Het is deterministisch op basis van de byte-inhoud van `site/`. Elke
wijziging aan enig bestand onder `site/` produceert een andere CID.

Pinnen aan aanvullende services naast de lokale node van de uitgever wordt
sterk aanbevolen voor duurzaamheid; deze specificatie schrijft geen
specifieke services voor.

## 6. Versiebeheer

Het protocol is **append-only op versieniveau**. Elke wijziging
vereist een nieuwe verzegelde versie:

- Een nieuwe (of ongewijzigde) specificatie-revisie
- Een nieuwe feit-set, die feiten ongewijzigd MAG overerven van eerdere versies
- Een nieuwe Merkle-wortel
- Een nieuw OpenTimestamps-bewijs
- Een nieuwe IPFS-CID

Alle eerdere versies blijven gepubliceerd op versie-specifieke URL's. Een wijziging aan enig
v(N)-feit vereist v(N+1), waarbij beide versies zichtbaar en herverifieerbaar zijn.

## 7. Verificatie

Elke derde partij kan de integriteit van een publicatie verifiëren door:

1. De feit-bestanden te downloaden en SHA-256-hashes per feit te herberekenen.
2. De Merkle-wortel te herberekenen volgens §3 en te vergelijken met de gepubliceerde wortel.
3. Het OpenTimestamps-bewijs te verifiëren tegen de Bitcoin-blockchain
   voor de volledige attestatie van ten minste één kalender.
4. Onafhankelijk de IPFS-CID te herberekenen via `ipfs add -r --cid-version=1`
   en te vergelijken met de gepubliceerde CID.

`lib/verify.py` voert stappen 1–3 uit zonder externe afhankelijkheden buiten
de Python-stdlib en de `ots`-client. Stap 4 vereist de `ipfs`-client.

## 8. Weigeringspoort

Een publicatie MAG GEEN feit bevatten dat:

- Een privé derde partij identificeert die niet heeft ingestemd met genoemd worden.
- Een hypothese als bevestiging presenteert.
- Niet kan worden teruggebracht tot een verifieerbare benoemings-/verklaringsgebeurtenis of een
  cryptografisch artefact.
- Een redelijke verwachte toename van vermijdbare sterfgevallen bij publicatie heeft.

De vierde regel is de dragende. Hij wordt gehandhaafd bij de menselijke
beoordelingsstap door de uitgever. Er is geen handhaving op protocolniveau van
de weigeringspoort; het protocol publiceert wat voor bytes het ook krijgt. De
uitgever is verantwoordelijk voor de poort.

## 9. Eerlijke verklaring van beperkingen

- **Detecteerbaarheid, geen onmogelijkheid.** Het protocol maakt manipulatie
  detecteerbaar, niet onmogelijk. Een vastberaden aanvaller kan nog steeds een
  andere publicatie substitueren en sommige lezers ervan overtuigen dat het origineel is.
  De waarde van het protocol is dat de substitutie
  cryptografisch aantoonbaar wordt voor iedereen die de controle uitvoert.
- **Geen verdediging tegen het publiceren van onwaarheid.** Als de uitgever een
  feit verzegelt dat stelt "X is gebeurd" en X is niet gebeurd, dan verzegelt het protocol de
  valse bewering met dezelfde precisie waarmee het ware verzegelt. Het protocol
  attesteert wat is *gepubliceerd*, niet wat *waar* is.
- **Ondertekening door één partij.** v1 van het ingezette MYRIAM gebruikt één
  ondertekenend principaal. Multi-party ondertekening is toekomstig werk.
- **Pinning-duurzaamheid.** IPFS-pinning op alleen de node van de uitgever
  biedt "beschikbaar terwijl mijn laptop aan staat + opportunistische gateway-
  caching." Langetermijnduurzaamheid vereist redundante pins over
  onafhankelijke services.

Deze beperkingen worden hier vermeld zodat geen lezer aanneemt dat het protocol
meer levert dan het doet.
