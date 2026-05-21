*Svensk översättning — för den ursprungliga engelska versionen, se [SPEC.md](SPEC.md)*

# MYRIAM-kit-protokollets specifikation

## 0. Syfte

Detta dokument specificerar ett minimalt protokoll för att publicera en
liten mängd textbaserade fakta i en manipuleringsbevisande, kryptografiskt
verifierbar form som överlever att en enskild värdtjänstleverantör avlägsnar dem.

Det är generaliseringen av det protokoll som först driftsattes på
[disclosure.host](https://disclosure.host) under namnet "MYRIAM v1."

## 1. Icke-mål

- Hemlig lagring. Allt är offentligt per konstruktion.
- Stora datamängder. Bortom ~20 fakta har protokollet fel form.
- Realtidspublicering. Varje publicering är en diskret förseglingshändelse.
- Tillbakadragande. Protokollet är endast tilläggsbart på versionsnivå.

## 2. Faktum-modell

Ett FAKTUM är en UTF-8-textfil med:

- Filnamnsmönster: `NN_short_name.txt` där NN är ett nollutfyllt tvåsiffrigt
  index som börjar på 01.
- Kanonisk form: byten som de är skrivna, utan normalisering.
- Hash per faktum: gemenert hex av `SHA-256(file_bytes)`.

Faktum-MÄNGDEN är den ordnade listan över alla filer som matchar mönstret under
`facts/`, sorterade lexikografiskt.

Begränsning: varje faktum-innehåll BÖR formuleras som en *namngivningshändelse*
eller *deklarationshändelse* hänförbar till en specifik part. Ontologiska
påståenden ("månen är sten") undergräver verifierbarhetsgrinden; endast
publiceringshändelsen är verifierbar, inte påståendet. "X har angivit Y" är
den rätta formen. "Y är sant" är det inte.

## 3. Merkle-rot

Bitcoin-stil, som i v0 av det driftsatta MYRIAM-protokollet:

1. Löv: SHA-256-hashar per faktum i faktum-mängdens ordning.
2. Om en nivå har ett udda antal noder, duplicera den sista noden.
3. Parhasha angränsande noder: `parent = SHA-256(left_bytes || right_bytes)`,
   där `left_bytes` och `right_bytes` är råa 32-byte hashvärden
   (inte deras hex-representationer).
4. Upprepa tills en nod kvarstår. Det är Merkle-roten.

Roten publiceras som gemenert hex utan avslutande radbrytning.

### 3.1 Testvektorer

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Varje regelrätt implementation MÅSTE reproducera dessa vektorer. De är härledda
från det faktiska `lib/build.py` och kan återgenereras med det skriptet.

## 4. Bitcoin-åtagande

Merkle-roten åtages till Bitcoin-blockkedjan via
[OpenTimestamps](https://opentimestamps.org). Standardpolicyn är:

> Stämpla mot minst två kalenderoperatörer under oberoende
> administrativ kontroll.

Ett kvitto som uppfyller denna policy är verifierbart av vilken part som helst
som kan köra `ots verify <receipt>.ots` och nå någondera kalenderns uppgraderingsväg.

Standardparet av operatörer som levereras i `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementationer FÅR använda andra operatörer. Policyn om vittnesmångfald
(≥2 oberoende operatörer) är normativ; de specifika operatörerna
är det inte.

## 5. Innehållsadresserad spegling

Katalogen `site/` som innehåller den publicerade sidan och faktumfilerna
BÖR läggas till på IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

Den resulterande CIDv1 (dag-pb codec) är publiceringens innehållsadress.
Den är deterministisk från byteinnehållet i `site/`. Varje
modifiering av valfri fil under `site/` ger en annan CID.

Att fastnåla mot ytterligare tjänster utöver utgivarens lokala nod
rekommenderas starkt för beständighet; denna specifikation föreskriver inte
specifika tjänster.

## 6. Versionshantering

Protokollet är **endast tilläggsbart på versionsnivå**. Varje ändring
kräver en ny förseglad version:

- En ny (eller oförändrad) specifikationsrevision
- En ny faktum-mängd, som FÅR ärva fakta oförändrade från tidigare versioner
- En ny Merkle-rot
- Ett nytt OpenTimestamps-kvitto
- En ny IPFS-CID

Alla tidigare versioner förblir publicerade vid versionerade URL:er. En ändring
av valfritt v(N)-faktum kräver v(N+1), med båda versionerna synliga och återverifierbara.

## 7. Verifiering

Vilken tredje part som helst får verifiera en publicerings integritet genom att:

1. Ladda ner faktumfilerna och räkna om SHA-256-hashar per faktum.
2. Räkna om Merkle-roten enligt §3 och jämföra med den publicerade roten.
3. Verifiera OpenTimestamps-kvittot mot Bitcoin-blockkedjan
   för minst en kalenders fullständiga attestering.
4. Oberoende räkna om IPFS-CID:t via `ipfs add -r --cid-version=1`
   och jämföra med det publicerade CID:t.

`lib/verify.py` utför steg 1–3 utan externa beroenden utöver
Python-standardbiblioteket och `ots`-klienten. Steg 4 kräver `ipfs`-klienten.

## 8. Vägransgrind

En publicering FÅR INTE innehålla ett faktum som:

- Identifierar en privat tredje part som inte har samtyckt till att namnges.
- Presenterar en hypotes som en bekräftelse.
- Inte kan reduceras till en verifierbar namngivnings-/deklarationshändelse
  eller en kryptografisk artefakt.
- Har en rimlig förväntad ökning av förebyggbara dödsfall vid publicering.

Den fjärde regeln är den bärande. Den verkställs vid det mänskliga
granskningssteget av utgivaren. Det finns ingen verkställighet av
vägransgrinden på protokollnivå; protokollet publicerar vilka byten
det än får. Utgivaren ansvarar för grinden.

## 9. Ärlig redogörelse för begränsningar

- **Upptäckbarhet, inte omöjlighet.** Protokollet gör manipulering
  upptäckbar, inte omöjlig. En beslutsam angripare kan fortfarande ersätta
  med en annan publicering och övertyga vissa läsare om att den är originalet.
  Protokollets värde är att utbytet blir
  kryptografiskt påvisbart för var och en som kör kontrollen.
- **Inget försvar mot att publicera osanning.** Om utgivaren förseglar ett
  faktum som anger "X inträffade" och X inte inträffade, förseglar protokollet
  det falska påståendet med samma trohet som det förseglar sanna. Protokollet
  intygar vad som *publicerades*, inte vad som är *sant*.
- **Signering av en enskild part.** v1 av det driftsatta MYRIAM använder en
  enda signeringsprincipal. Signering av flera parter är framtida arbete.
- **Beständighet i fastnålning.** IPFS-fastnålning enbart vid utgivarens nod
  ger "tillgängligt medan min laptop är uppe + opportunistisk gateway-cachning."
  Långsiktig beständighet kräver redundanta fastnålningar över
  oberoende tjänster.

Dessa begränsningar anges här så att ingen läsare antar att protokollet
levererar mer än det gör.
