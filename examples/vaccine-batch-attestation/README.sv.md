*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Kit för attestering av vaccinbatch

Ett nyckelfärdigt myriam-kit-exempel för vaccintillverkare,
kvalitetssäkringsmyndigheter och folkhälsoorganisationer som vill
publicera en Bitcoin-förankrad, manipuleringsbevisande försegling av
en batchfrisläppning.

## Vad detta kit skyddar mot

**Felmoder som förseglingen fångar:**

- **Tyst retroaktiv modifiering av frisläppningstestresultat.** Alla
  8 frisläppningstest-PDF:er i exemplet hashas. Omhashning efter
  frisläppning avslöjar alla ändringar.
- **Tvister om vilka specifikationer som gällde vid frisläppning.**
  Den förseglade FACT 02 innehåller den kanoniska batchidentifieringen
  och hashen av tillverkningsjournalen. Framtida tvister av typen
  "specifikationen har alltid varit X" får ett offentligt ankare.
- **Tyst minimering av återkallelsens omfattning.**
  Läkemedelsövervaknings-åtaganden i FACT 05 är förseglade;
  underlåtenhet att uppfylla dem är offentligt observerbar.
- **Retroaktiv omspecifikation av en batch utanför specifikation.**
  Om ett frisläppningstestresultat egentligen var ett gränsfalls-PASS
  som efter frisläppning omklassificeras som FAIL, bevisar hasharna
  av de förseglade rapporterna vad den ursprungliga resultat-PDF:en
  faktiskt sade.

**Felmoder som INTE täcks:**

- Bedrägeri i själva tillverkningsprocessen (förseglingen förankrar
  testresultat, inte tillverkningsintegritet).
- Biverkningar som är biologiska konsekvenser av en i övrigt godkänd
  batch (förseglingen certifierar inte klinisk säkerhet, endast
  dokumentationsintegritet).
- Tvister om vilken version av en regulatorisk specifikation som är
  auktoritativ.

## När detta kit ska användas

Överväg att försegla en batchfrisläppning om:

- Du är en vaccintillverkare som vill demonstrera forensisk
  integritet hos frisläppningsdokument utöver vad tillsynsmyndigheter
  kräver
- Du är ett QA-team som antar praxisen "publicera det vi attesterar"
- Du är en liten/nationell tillverkare i en jurisdiktion med svagare
  regulatorisk infrastruktur, och vill förankra batchregister mot en
  global verifierare
- Du är en folkhälsomyndighet eller NGO som driver ett
  icke-kommersiellt vaccintillverkningsprogram (t.ex. för försummade
  sjukdomar)

## Historiskt dödlighetsprecedent

- **Heparinkontaminering (2008, Kina):** förfalskad översulfaterad
  kondroitinsulfat i heparinbatcher. Ett förseglat
  frisläppningstest-manifest skulle ha gjort tyst
  post-frisläppningsmodifiering av testdokumentationen
  kryptografiskt detekterbar.
- **Tylenol-cyanid (1982):** retroaktiva tvister om
  manipuleringens ursprungspunkt. En förseglad hash av
  tillverkningsjournalen förankrar tillståndet före distribution.
- **Diverse återkallelser av vaccinbatcher** där frågan "har denna
  batch någonsin testats korrekt" blir omtvistad år senare.

Kitet är INTE en lösning för NÅGOT av dessa fall i strikt mening —
men i varje fall skulle förseglade batchattesteringar ha gett en
renare forensisk tidslinje.

## Hur du forkar detta kit för en verklig batch

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # ersätt fiktivt innehåll med verklig batch
bash build/seal.sh        # FÖRSEGLA INNAN distribution börjar
python3 build/verify.py   # bekräfta
```

**KRITISK TIDPUNKT**: försegla vid QA-frisläppningens ögonblick,
INNAN batchen distribueras. En försegling efter distribution är
forensiskt svagare.

## Integration med befintlig farmaceutisk infrastruktur

- **eCTD-inlämningar (FDA / EMA):** den förseglade publicerings-URL:en
  eller IPFS-CID:n kan refereras i Module 3-avsnittet (kvalitet)
- **WHO Prequalification:** det förseglade manifestet demonstrerar
  pre-frisläppnings-testkedjan för icke-FDA/EMA-jurisdiktioner
- **Återkoppling från läkemedelsövervakning:** FACT 05 binder
  tillverkaren till förseglad rapportering av aggregerade
  AE-räkningar vid 6 och 12 månader
- **Återkallelsesystem (RxConnect, MedWatch):** om en återkallelse
  behövs förseglas själva återkallelsens omfattning under MYRIAM,
  vilket ger offentlig verifiering att alla distribuerade partier
  hanteras

## Vad detta kit INTE ersätter

- FDA / EMA / WHO regulatoriska inlämningar
- GMP-revisionsspår (förseglingen förankrar RESULTAT, inte rå
  processdokumentation)
- Läkemedelsövervakningsdatabaser (VAERS / EudraVigilance)
- Koordineringssystem för återkallelser

## Licens

Allmän egendom (CC0). Forka den. Ingen attribution krävs.
