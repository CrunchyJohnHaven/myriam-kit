*Dansk oversættelse — for den originale engelske version, se [SPEC.md](SPEC.md)*

# MYRIAM-kit Protokolspecifikation

## 0. Formål

Dette dokument specificerer en minimal protokol til at offentliggøre et lille
sæt af tekstkendsgerninger i en manipulationspåviselig, kryptografisk
verificerbar form, der overlever, at en hvilken som helst enkelt hostingudbyder
fjerner indholdet.

Det er generaliseringen af den protokol, der først blev udrullet på
[disclosure.host](https://disclosure.host) under navnet "MYRIAM v1."

## 1. Ikke-mål

- Hemmelighedsopbevaring. Alt er offentligt af konstruktion.
- Store datasæt. Forbi ~20 kendsgerninger har protokollen den forkerte form.
- Realtidsoffentliggørelse. Hver offentliggørelse er en diskret forseglingshændelse.
- Tilbagetrækning. Protokollen er kun-tilføj på versionsniveau.

## 2. Kendsgerningsmodel

En KENDSGERNING er en UTF-8-tekstfil med:

- Filnavnemønster: `NN_short_name.txt`, hvor NN er et nul-udfyldt to-cifret
  indeks, der starter ved 01.
- Kanonisk form: bytes som skrevet, ingen normalisering.
- Hash pr. kendsgerning: små bogstaver hex af `SHA-256(file_bytes)`.

Kendsgerningssættet er den ordnede liste over alle filer, der matcher
mønstret under `facts/`, sorteret leksikografisk.

Begrænsning: hvert kendsgerningsindhold SHOULD formuleres som en
*navngivningshændelse* eller *deklarationshændelse*, der kan tilskrives en
specifik part. Ontologiske påstande ("månen er sten") undergraver
verificerbarhedsporten; kun offentliggørelseshændelsen kan verificeres, ikke
påstanden. "X har erklæret Y" er den rette form. "Y er sandt" er det ikke.

## 3. Merkle-rod

Bitcoin-stil, som i v0 af den udrullede MYRIAM-protokol:

1. Blade: SHA-256-hashes pr. kendsgerning i kendsgerningssættets orden.
2. Hvis et niveau har et ulige antal noder, dupliker den sidste node.
3. Par-hash tilstødende noder: `parent = SHA-256(left_bytes || right_bytes)`,
   hvor `left_bytes` og `right_bytes` er de rå 32-byte hash-værdier
   (ikke deres hex-repræsentationer).
4. Gentag, indtil én node er tilbage. Det er Merkle-roden.

Roden offentliggøres som små bogstaver hex uden afsluttende linjeskift.

### 3.1 Testvektorer

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Enhver protokol-overholdende implementering MUST reproducere disse vektorer.
De er udledt fra det faktiske `lib/build.py` og kan regenereres med det script.

## 4. Bitcoin-forpligtelse

Merkle-roden forpligtes til Bitcoin-blockchainen via
[OpenTimestamps](https://opentimestamps.org). Standardpolitikken er:

> Stempl mod mindst to kalenderoperatører under uafhængig
> administrativ kontrol.

En kvittering, der opfylder denne politik, kan verificeres af enhver part,
som kan køre `ots verify <receipt>.ots` og nå en af kalendernes opgraderingsvej.

Standardoperatørparret leveret i `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementeringer MAY bruge andre operatører. Vidnediversitetspolitikken
(≥2 uafhængige operatører) er normativ; de specifikke operatører er ikke.

## 5. Indholdsadresseret spejling

`site/`-mappen, der indeholder den offentliggjorte side og kendsgerningsfilerne,
SHOULD tilføjes til IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

Den resulterende CIDv1 (dag-pb codec) er offentliggørelsens indholdsadresse.
Den er deterministisk ud fra bytesindholdet i `site/`. Enhver modifikation af
enhver fil under `site/` producerer et andet CID.

Fastgøring til yderligere tjenester ud over udgiverens lokale node anbefales
stærkt for holdbarhed; denne specifikation pålægger ikke specifikke tjenester.

## 6. Versionering

Protokollen er **kun-tilføj på versionsniveau**. Enhver ændring kræver en ny
forseglet version:

- En ny (eller uændret) specifikationsrevision
- Et nyt kendsgerningssæt, der MAY arve kendsgerninger uændret fra tidligere
  versioner
- En ny Merkle-rod
- En ny OpenTimestamps-kvittering
- Et nyt IPFS-CID

Alle tidligere versioner forbliver offentliggjorte ved versionerede URL'er. En
ændring af en hvilken som helst v(N)-kendsgerning kræver v(N+1), med begge
versioner synlige og kan reverificeres.

## 7. Verifikation

Enhver tredjepart kan verificere en offentliggørelses integritet ved:

1. At downloade kendsgerningsfilerne og genberegne SHA-256-hashes pr. kendsgerning.
2. At genberegne Merkle-roden pr. §3 og sammenligne med den offentliggjorte rod.
3. At verificere OpenTimestamps-kvitteringen mod Bitcoin-blockchainen for mindst
   én kalenders fulde attestation.
4. Uafhængigt at genberegne IPFS-CID'et via `ipfs add -r --cid-version=1`
   og sammenligne med det offentliggjorte CID.

`lib/verify.py` udfører trin 1-3 uden eksterne afhængigheder ud over Python
stdlib og `ots`-klienten. Trin 4 kræver `ipfs`-klienten.

## 8. Vægringsport

En offentliggørelse MUST NOT inkludere en kendsgerning, der:

- Identificerer en privat tredjepart, der ikke har samtykket til at blive navngivet.
- Præsenterer en hypotese som en bekræftelse.
- Ikke kan reduceres til en verificerbar navngivnings-/deklarationshændelse
  eller en kryptografisk artefakt.
- Har en rimelig forventet stigning i forebyggelige dødsfald ved offentliggørelse.

Den fjerde regel er den bærende. Den håndhæves ved det menneskelige
gennemsynstrin af udgiveren. Der er ingen håndhævelse af vægringsporten på
protokolniveau; protokollen offentliggør, hvilke bytes den end får. Udgiveren
er ansvarlig for porten.

## 9. Ærlig redegørelse for begrænsninger

- **Påviselighed, ikke umulighed.** Protokollen gør manipulation påviselig,
  ikke umulig. En beslutsom angriber kan stadig udskifte med en anden
  offentliggørelse og overbevise nogle læsere om, at det er originalen.
  Protokollens værdi er, at udskiftningen bliver kryptografisk demonstrerbar
  for enhver, der kører tjekket.
- **Intet forsvar mod offentliggørelse af usandhed.** Hvis udgiveren forsegler
  en kendsgerning, der angiver "X skete", og X ikke skete, forsegler
  protokollen den falske påstand med samme troværdighed, som den forsegler
  sande. Protokollen attesterer det, der blev *offentliggjort*, ikke det,
  der er *sandt*.
- **Enpartssignering.** v1 af det udrullede MYRIAM bruger en enkelt
  signerende principal. Flerpartssignering er fremtidigt arbejde.
- **Fastgøringsholdbarhed.** IPFS-fastgøring ved udgiverens node alene giver
  "tilgængelig, mens min laptop er oppe + opportunistisk gateway-caching".
  Langtidsholdbarhed kræver redundante fastgøringer på tværs af uafhængige
  tjenester.

Disse begrænsninger angives her, så ingen læser antager, at protokollen
leverer mere, end den gør.
