*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Kit för förcertifieringsförsegling av valrösträkningar

Ett nyckelfärdigt myriam-kit-exempel för county-rösträkningsnämnder,
delstatliga valmyndigheter och valintegritetsobservatörer som vill
publicera en Bitcoin-förankrad, manipulationsdetekterande försegling av
en räkning vid det exakta ögonblicket av certifiering.

**Stänger** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Vad detta kit INTE gör (läs först)

Förseglingen är en kryptografisk tidsstämpel av det som certifierades.
Den kan inte verifiera om det som certifierades var korrekt. Följande
felmoder ligger **utanför förseglingens domän**:

1. **Kompromettering av röstmaskiner.** Om firmware har manipulerats
   eller röstsiffror räknats felaktigt, förankrar förseglingen ett
   felaktigt tal med hög integritet. Förseglingen observerar utdata
   från tabuleringssystemet; den har ingen insyn i systemet självt.

2. **Väljarundertryckande / strukturell avhändning av rösträtt.**
   Stängningar av vallokaler, skillnader i ID-lagstiftning, partiskhet
   i avvisningsfrekvensen för poströster och rensning av väljarregister
   sker uppströms certifieringen. Förseglingen registrerar räknade
   röstsedlar, inte röstsedlar som borde ha räknats.

3. **Valdesinformation.** Förseglingen dömer inte över påståenden om
   valet som görs av kandidater, media eller plattformar. En förseglad
   certifiering kan citeras i ett desinformationsnarrativ lika lätt som
   till försvar mot ett. Kryptografiska tidsstämplar är innehållsneutrala.

4. **Förcertifieringsbedrägeri under röstsedelsinsamling eller -räkning.**
   Oegentligheter vid ballot-harvesting, manipulation av valurnor, brott
   mot bevarandekedjan under räkningsfönstret — allt sker före
   förseglingsögonblicket. Förseglingen kan inte upptäcka dem retroaktivt.

5. **Tvång mot den certifierande myndigheten.** En framtvingad
   certifiering producerar en kryptografiskt giltig försegling av ett
   framtvingat resultat. Förseglingen verifierar att en tjänsteman
   signerade, inte varför.

6. **Felaktiga certifieringar som aldrig senare korrigeras.**
   Förseglingens värde beror på en senare sanningssökandeprocess
   (revision, omräkning, rättstvist) som förseglingen kan jämföras med.
   Om en sådan process aldrig körs står förseglingen som det enda
   protokollet och kan förstena felet.

7. **Statistiska anomalier och mönsterupptäckt.** Förseglingen flaggar
   inte osannolika marginaler, geografiska anomalier eller avvikelser
   från Benfords lag. Detta är analytiska uppgifter på den förseglade
   datan, inte egenskaper hos förseglingen.

8. **Underordnade val med tunna revisionsspår.** Mindre val har svagare
   omräkningsutlösare; en enda försegling kan inte meningsfullt täcka
   alla val på en röstsedel utan avgränsning per val.

**Avsnittet om ärliga begränsningar ovan är den bärande delen av detta
kit.** Tjänstemän som tror att försegling är detsamma som legitimitet
kommer att använda det som sköld. Kittet måste säga rakt ut: detta är
en *non-repudiation-primitiv för certifieringsögonblicket*, inte ett
bevis på valets korrekthet.

---

## Vad detta kit MÅSTE VÄGRA att försegla

Kittet är konfigurerat att avvisa följande faktamönster även om en
användare med giltig signeringsbehörighet skickar in dem:

- **Identifiering av enskilda väljare.** Inget faktum får namnge en
  väljare, koppla en röstsedel till en väljare eller exponera något
  fält som kan återidentifiera en person.
- **Beslut om signaturmatchning per röstsedel.** PII-tunga; försegling
  skapar permanenta register över beslut som senare kan ifrågasättas.
- **Varje faktum vars publicering skulle identifiera en sårbar väljare.**
  Inkluderar valdistriktsresultat i distrikt så små att röstval är
  härledbart (vanligen <50 röstsedlar).
- **Räkningar förseglade innan alla röstsedlar har räknats.** Kittet
  vägrar partiella räkningar som presenteras som "räkningen".
  Förcertifiering innebär *alla röstsedlar räknade, före officiell
  certifiering* — inte *under räkning*.
- **Provisoriska eller villkorliga certifieringar.** Förseglingen måste
  återspegla ett faktum, inte ett villkor.
- **Räkningar som utesluter kohorter med pågående rättstvist** utan
  ett uttryckligen förseglat åtföljande faktum som avslöjar
  uteslutningen.
- **Försegling av någon annan än den certifierande myndigheten** för
  den jurisdiktionen.

En vägran kan i sig förseglas som ett faktum ("Denna myndighet begärde
försegling av X; kittet vägrade enligt vägransregel Y") och därmed skapa
ett offentligt protokoll över försökt missbruk.

---

## Vad detta kit FAKTISKT förseglar

8 fakta vid certifieringsögonblicket:

1. **Exempelmeddelande** — förklarar publikationen som ett exempel
   (verkliga attesteringar tar bort eller ersätter detta).
2. **Identifiering av jurisdiktion** — county, valdatum, certifierande
   myndighet, certifierande tjänstemän med namn + roll.
3. **Certifierad räkning** — röstsummor per val per kandidat + över-/
   underröster + write-ins.
4. **Röstsedelredovisning och avstämning** — totalt avlagda, totalt
   tabulerade, totalt avvisade per kategori, lägesfördelning, nämnare
   för registrerade väljare.
5. **Utrustnings- och revisionsspårsmanifest** — tabulatormodell +
   firmware-hash, CVR-filhash, hash för röstsedelsbildarkiv, hash för
   bevaringslogg, hash för signaturmatchningspolicy.
6. **Tröskelvärden och utlösare vid certifiering** — gällande tröskel
   för signaturmatchning, utlösartrösklar för omräkning, faktiska
   marginaler per val, RLA-fröåtagande.
7. **Åtföljande avslöjanden och vägransprotokoll** — pågående rättstvist,
   efterräknings-anomalier under granskning, uteslutna kohorter,
   meningsskiljaktiga nämndledamöter; uttrycklig lista över mönster som
   kittet vägrade att försegla.
8. **Signerande huvudman** — identifiering av Board of Canvassers + varje
   signatärs namn och parti + kryptografisk nyckelinformation.

Varje faktum avslutas med vägransport-konventionen: *"Detta faktum
hävdar endast X. Det hävdar inte Y"* (där Y är den närmaste felmoden
från avsnittet "INTE gör" ovan).

---

## Vad detta kit försvarar mot

- **Tyst revision av röstsummor efter certifiering** — varje
  heltalsändring av FACT 03 producerar en annan SHA-256, annan
  Merkle-rot, misslyckas med OTS-verifiering.
- **"Hittade röstsedlar" som tyst absorberas** — FACT 04:s
  avstämningsaritmetik är fastställd vid certifiering.
- **Påståenden om firmware-utbyte** — FACT 05 fryser
  utrustningsmanifestet vid certifiering.
- **Utbyte av revisionsartefakter efter certifiering** — FACT 05:s
  hash-manifest fångar varje ändring efter certifiering av CVR,
  röstsedelbilder, bevaringsloggar eller signaturmatchningspolicy.
- **Omdefiniering av tröskelvärden och utlösare** — FACT 06 fryser de
  regler som gällde vid certifiering (signaturmatchningströskel,
  omräkningsutlösare, RLA-riskgräns).

## Historiska eller nästan-historiska fall som kittet skulle ha hjälpt med

Kittet skulle ha producerat ett användbart ankare — *inte en lösning* —
i fall som rör:

- **Antrim County, Michigan (2020).** Inledande inofficiella resultat
  visade ett kandidatbyte som senare korrigerades till motsatt utfall.
  En förseglingsbild före korrigeringen skulle ha gett en offentlig
  referens för vad det ursprungliga tillkännagivandet sa kontra vad
  korrigeringen sa, båda kryptografiskt attesterade.
- **Maricopa County, Arizona (2020–2022).** Flera iterationer av
  omräknade/omexaminerade summor cirkulerade. En försegling vid
  certifieringsögonblicket skulle ha gett en otvetydig referenspunkt
  mot vilken varje efterföljande räkning kunde jämföras.
- **Florida 2000 (Bush v. Gore canvass).** Certifierade summor per
  county skiftade under omräkningstryck; en försegling per county före
  omräkning skulle ha bevarat vad varje county certifierade innan
  manuella omräkningsförfaranden började.
- **Olika utländska val med dokumenterade "korrigeringar" efter
  certifiering.** Jurisdiktionsagnostisk.

Kittet skulle INTE ha löst de underliggande tvisterna om
maskinintegritet 2020, poströsttvister eller något val där kärnfrågan
var bestridd fakta snarare än bestridd registrering.

## När detta kit ska användas

- Din jurisdiktion har en stabil, granskad certifieringsprocess och vill
  lägga till ett oföränderligt offentligt ankare.
- Du förväntar dig granskning efter certifiering och vill ha en
  manipulationsdetekterande referenspunkt.
- Du har juridisk behörighet att publicera den uppräknade faktauppsättningen
  utan att exponera PII.
- Du har en parallell revision eller RLA-process så att förseglingen kan
  jämföras med sanningssökandeoutput.

## När detta kit INTE ska användas

- **Använd inte som ersättning för risk-limiting audits, manuella
  omräkningar eller eftervalsrevisioner.** Detta kit är *additivt*,
  inte ersättande.
- **Använd inte om den certifierande tjänstemannen inte är den faktiska
  beslutsfattaren** (skapar falsk tillskrivning).
- **Använd inte mitt under tabulering.** Kittet är specifikt för
  certifieringsögonblicket. Förseglingar av partiella räkningar skapar
  vilseledande referenspunkter.
- **Använd inte för att hävda att valet var rättvist, korrekt eller
  legitimt** — det kan det inte göra.
- **Använd inte under press att försegla tidigare än
  certifieringsögonblicket, eller att utelämna ett åtföljande faktum-
  avslöjande.** Vägra, och försegla vägran.
- **Använd inte som legitimitetsteater.** En försegling av en bedräglig
  räkning är ett permanent offentligt protokoll över bedrägeriet, inte
  ett försvar av det. Primitiven skär åt båda hållen; det är dess
  ärlighet.

## Hur man forkar detta kit för en verklig certifiering

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # ersätt fiktivt innehåll med verkligt
bash build/seal.sh     # försegla VID eller efter den officiella certifieringssignaturen
python3 build/verify.py
```

**Kritisk tidpunkt:** försegla VID certifieringsögonblicket, INTE före.
En försegling före officiell certifiering skapar ett falskpositivt
"detta är det officiella resultatet"-protokoll. En försegling efteråt
är konventionell non-repudiation.

## Integration med befintlig valinfrastruktur

- **Delstatliga valnämnder / EAC-certifiering.** Kittet publicerar
  vid sidan av det officiella certifieringsdokumentet. Det ersätter
  inte den lagstadgade certifieringen.
- **Risk-limiting audits.** CVR-hashen i FACT 05 är samma hash som
  RLA-verktyget konsumerar. Förseglingen binder den reviderade CVR:en
  till den certifierade summan.
- **Omräkningsförfaranden.** En omräkning som utlöses enligt delstatslag
  producerar en NY förseglad faktauppsättning (annan tidsstämpel, andra
  hashar, samma jurisdiktion). Båda förseglingarna samexisterar; ingen
  skriver över den andra. Diffen mellan förseglingarna är det offentliga
  protokollet över vad omräkningen ändrade.
- **Election Markup Language (EML) och Common Data Format (CDF).**
  Faktakroppar bör vara härledbara från jurisdiktionens befintliga
  EML/CDF-utdata för att hålla kittet dataformat-agnostiskt.
- **Tvåpartsignering av board of canvassers.** Multi-signaturvariant
  rekommenderas för jurisdiktioner med partibalanserade
  rösträkningsnämnder.

## Vad detta kit INTE ersätter

- Lagstadgad certifiering enligt delstatlig vallag
- EAC-certifiering av röstsystem
- Risk-limiting audits / manuella omräkningar
- Omräkningsförfaranden och eftervalsrevisioner
- Domstolsbeslut eller valbestridanderättstvist

## Varför detta kit finns i v0.3.0+

Detta är det 6:e utarbetade exemplet som levereras med myriam-kit.
Kittet producerades via en Karpathy-stil autoresearch-process
dokumenterad i `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Tre
promptvarianter (imitation / first-principles / constraint-first)
producerade parallella kit-skisser; constraint-first-varianten fick
högsta poäng på en viktad rubric, och det slutgiltiga kittet
syntetiserar dess struktur med imitation-variantens sammanhållning
och first-principles-variantens operativa detalj.

Själva autoresearchen dokumenteras som ett promptmönster i
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` för framtida användning.

## Licens

Public domain (CC0). Forka det. Ingen attribution krävs.
