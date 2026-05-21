*Norsk oversettelse — for den engelske originalen, se [SPEC.md](SPEC.md)*

# MYRIAM-kit-protokollspesifikasjon

## 0. Formål

Dette dokumentet spesifiserer en minimal protokoll for å publisere et lite
sett med tekstfakta i en tukling-tydelig, kryptografisk verifiserbar form som
overlever fjerning fra hvilken som helst enkelt vertstjenesteleverandør.

Det er generaliseringen av protokollen som først ble utrullet på
[disclosure.host](https://disclosure.host) under navnet "MYRIAM v1."

## 1. Ikke-mål

- Hemmelighetslagring. Alt er offentlig ved konstruksjon.
- Store datasett. Forbi ~20 fakta har protokollen feil form.
- Sanntidspublisering. Hver publisering er en diskret forseglingshendelse.
- Tilbaketrekking. Protokollen er tillegg-bare på versjonsnivå.

## 2. Faktum-modell

Et FAKTUM er en UTF-8-tekstfil med:

- Filnavnsmønster: `NN_short_name.txt`, der NN er en nullutfylt to-sifret
  indeks som starter på 01.
- Kanonisk form: bytes som skrevet, ingen normalisering.
- Hash per faktum: små bokstaver hex av `SHA-256(file_bytes)`.

Faktum-SETTET er den ordnede listen over alle filer som matcher mønsteret
under `facts/`, sortert leksikografisk.

Begrensning: hvert faktum-innhold SHOULD formuleres som en
*navngivningshendelse* eller *deklarasjonshendelse* tilskrivbar til en
spesifikk part. Ontologiske påstander ("månen er stein") undergraver
verifiserbarhetsporten; bare publiseringshendelsen er verifiserbar, ikke
påstanden. "X har erklært Y" er den riktige formen. "Y er sant" er det ikke.

## 3. Merkle-rot

Bitcoin-stil, som i v0 av den utrullede MYRIAM-protokollen:

1. Blader: SHA-256-hasher per faktum i faktum-settets rekkefølge.
2. Hvis et nivå har et oddetall noder, dupliser den siste noden.
3. Par-hash tilstøtende noder: `parent = SHA-256(left_bytes || right_bytes)`,
   der `left_bytes` og `right_bytes` er de rå 32-byte hash-verdiene
   (ikke deres hex-representasjoner).
4. Gjenta til én node gjenstår. Det er Merkle-roten.

Roten publiseres som små bokstaver hex uten avsluttende linjeskift.

### 3.1 Testvektorer

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Enhver protokollkonform implementasjon MUST reprodusere disse vektorene. De
er utledet fra den faktiske `lib/build.py` og kan regenereres med det skriptet.

## 4. Bitcoin-forpliktelse

Merkle-roten forpliktes til Bitcoin-blokkjeden via
[OpenTimestamps](https://opentimestamps.org). Standardpolicyen er:

> Stemple mot minst to kalenderoperatører under uavhengig
> administrativ kontroll.

En kvittering som oppfyller denne policyen er verifiserbar av enhver part
som kan kjøre `ots verify <receipt>.ots` og nå en av kalendernes oppgraderingssti.

Standardparet av operatører som leveres i `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementasjoner MAY bruke andre operatører. Vitnemangfoldpolicyen
(≥2 uavhengige operatører) er normativ; de spesifikke operatørene
er ikke.

## 5. Innholdsadressert speiling

`site/`-katalogen som inneholder den publiserte siden og faktum-filene
SHOULD legges til på IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

Den resulterende CIDv1 (dag-pb codec) er publiseringens innholdsadresse.
Den er deterministisk fra byteinnholdet i `site/`. Enhver modifikasjon av
en hvilken som helst fil under `site/` produserer en annen CID.

Festing til ytterligere tjenester utover utgiverens lokale node anbefales
sterkt for varighet; denne spesifikasjonen pålegger ikke spesifikke tjenester.

## 6. Versjonering

Protokollen er **tillegg-bare på versjonsnivå**. Enhver endring krever en
ny forseglet versjon:

- En ny (eller uendret) spesifikasjonsrevisjon
- Et nytt faktum-sett, som MAY arve fakta uendret fra tidligere versjoner
- En ny Merkle-rot
- En ny OpenTimestamps-kvittering
- En ny IPFS-CID

Alle tidligere versjoner forblir publisert ved versjonerte URL-er. En
endring av et hvilket som helst v(N)-faktum krever v(N+1), med begge
versjoner synlige og kan reverifiseres.

## 7. Verifikasjon

Enhver tredjepart kan verifisere en publiserings integritet ved å:

1. Laste ned faktum-filene og beregne SHA-256-hashes per faktum på nytt.
2. Beregne Merkle-roten på nytt i henhold til §3 og sammenligne med den
   publiserte roten.
3. Verifisere OpenTimestamps-kvitteringen mot Bitcoin-blokkjeden for minst
   én kalenders fullstendige attestasjon.
4. Uavhengig beregne IPFS-CID-en på nytt via `ipfs add -r --cid-version=1`
   og sammenligne med den publiserte CID-en.

`lib/verify.py` utfører trinn 1-3 uten eksterne avhengigheter utover Python
stdlib og `ots`-klienten. Trinn 4 krever `ipfs`-klienten.

## 8. Nektelsesport

En publisering MUST NOT inkludere et faktum som:

- Identifiserer en privat tredjepart som ikke har samtykket til å bli navngitt.
- Presenterer en hypotese som en bekreftelse.
- Ikke kan reduseres til en verifiserbar navngivnings-/deklarasjonshendelse
  eller en kryptografisk artefakt.
- Har en rimelig forventet økning av forebyggbare dødsfall ved publisering.

Den fjerde regelen er den bærende. Den håndheves ved det menneskelige
gjennomgangstrinnet av utgiveren. Det er ingen håndheving av nektelsesporten
på protokollnivå; protokollen publiserer hvilke bytes den enn får. Utgiveren
er ansvarlig for porten.

## 9. Ærlig redegjørelse for begrensninger

- **Oppdagbarhet, ikke umulighet.** Protokollen gjør tukling oppdagbar, ikke
  umulig. En bestemt angriper kan fortsatt erstatte med en annen publisering
  og overbevise noen lesere om at den er originalen. Protokollens verdi er
  at erstatningen blir kryptografisk påvisbar for enhver som kjører sjekken.
- **Ingen forsvar mot å publisere usannhet.** Hvis utgiveren forsegler et
  faktum som angir "X skjedde" og X ikke skjedde, forsegler protokollen den
  falske påstanden med samme troskap som den forsegler sanne. Protokollen
  attesterer hva som ble *publisert*, ikke hva som er *sant*.
- **Enkeltparts-signering.** v1 av den utrullede MYRIAM bruker en enkelt
  signerende prinsipal. Flerparts-signering er fremtidig arbeid.
- **Festingsvarighet.** IPFS-festing kun ved utgiverens node gir
  "tilgjengelig mens den bærbare datamaskinen er på + opportunistisk
  gateway-caching". Langvarig varighet krever redundante festinger på tvers
  av uavhengige tjenester.

Disse begrensningene oppgis her slik at ingen leser antar at protokollen
leverer mer enn den gjør.
