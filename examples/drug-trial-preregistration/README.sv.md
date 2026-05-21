*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Kit för förregistrering av läkemedelsprövningar

Ett nyckelfärdigt myriam-kit-exempel för sponsorer av kliniska
prövningar och akademiska forskare som vill förregistrera en
prövning på ett manipuleringsbevisande, Bitcoin-förankrat sätt
**utöver** registrering hos ClinicalTrials.gov, EU CTR eller andra
jurisdiktionella register.

## Varför förregistrera *utöver* under MYRIAM?

Befintliga prövningsregister (ClinicalTrials.gov, EU CTR, ISRCTN)
har dokumenterade svagheter avseende integritet:

- ClinicalTrials.gov tillåter sponsorer att uppdatera ändpunkter,
  beräkningar av urvalsstorlek och analysplaner **efter** den
  ursprungliga registreringen, med ändringsdatumen synliga i
  registret men *innehållsändringarna* inte alltid kryptografiskt
  förankrade.
- Flera stora studier (Goldacre et al., 2019; Mathieu et al., 2009)
  har dokumenterat systematiskt post-hoc-byte av ändpunkter över
  hela fältet.
- Redaktionell tillsyn från tidskrifter (CONSORT, ICMJE) fångar
  vissa fall; många slinker igenom.

En MYRIAM-försegling stänger den luckan. Merkle-roten +
Bitcoin OTS-kvittot gör varje post-hoc-ändring av den
*förregistrerade* primära ändpunkten, den statistiska
analysplanen eller subgruppslistan kryptografiskt
detekterbar. Förseglingen är forensiskt svårare att retcona än
själva registret.

Detta kit är ett **komplement till**, inte en ersättning för,
jurisdiktionella register. En verklig prövning bör registreras i
det lämpliga registret OCH förseglas under MYRIAM.

## Vad detta kit skyddar mot

Historiska dödlighetsfall där detta skulle ha hjälpt:

- **Vioxx (Merck, 2004)**: kardiovaskulära händelser var en
  förregistrerad ändpunkt i APPROVe-prövningen, men den publicerade
  analysen använde en gränspunkt som minimerade den uppenbara
  skadan. En försegling av den förregistrerade gränspunkten skulle
  ha gjort post-hoc-gränspunktsändringen offentligt detekterbar
  innan den publicerade artikeln.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: negativa prövningsdata
  om suicidalitet hos ungdomar omramades via post-hoc-analys.
  Förseglad förregistrering av ändpunkterna skulle ha gjort
  omramningen offentligt detekterbar.
- **Flera onkologiska prövningar** där överlevnadsändpunkter byttes
  ut mot surrogatändpunkter (progressionsfri överlevnad, svarsfrekvens)
  när överlevnadsnyttan uteblev.

**Felmoder som förseglingen direkt fångar:**

- **Byte av ändpunkter**: post-hoc-befordran av en sekundär ändpunkt
  till "primär" när den faktiska primära misslyckas. FACT 05 i
  förseglingen innehåller den förregistrerade primära ändpunkten;
  den publicerade primära ändpunkten måste matcha.
- **Selektivt val av utfall**: selektiv rapportering av endast de
  analyser som fungerade. FACT 06 innehåller hela den
  förregistrerade analysplanen; de publicerade analyserna måste
  inkludera alla förregistrerade.
- **Post-hoc-subgruppsbrytning**: påstå "läkemedlet fungerar för
  subgrupp X" efter att ha sett data. FACT 07 innehåller den
  förregistrerade subgruppslistan; varje annan subgrupp måste
  märkas som post-hoc.
- **Revidering av urvalsstorlek**: öka urvalsstorleken efter att
  ha sett interimtrender. FACT 06 innehåller den förregistrerade
  urvalsstorleken och powerberäkningen.
- **Tyst borttagning av obekväma sekundära ändpunkter**: FACT 05
  förordnar de sekundära ändpunkterna för hierarkisk testning;
  varje omordning eller borttagning är detekterbar.
- **Undertryckande av negativa resultat**: FACT 08 innehåller
  publikationsåtagandet; att inte publicera inom det åtagna
  fönstret är offentligt synligt.

**Felmoder som INTE täcks:**

- Tjänstefel vid själva genomförandet av prövningen (förfalskade
  data, bedräglig inskrivning). Förseglingen förankrar *planen*,
  inte *genomförandet*.
- Selektiv rapportering i publikationer som inkluderar alla
  förregistrerade analyser men tolkar dem fördelaktigt. Förseglingen
  fångar det som saknas; den kan inte fånga tolkningsbias.
- Patientskada under själva prövningen. Förseglingen är regulatorisk
  och evidentiär; den minskar inte risken för prövningsgenomförandet.

## När du bör använda detta kit

Du bör överväga att försegla en förregistrering om:

- Du sponsrar eller driver en klinisk prövning — fas 1 till 4 —
  som kommer att användas för att informera medicinska eller
  regulatoriska beslut.
- Du är villig att bli offentligt bunden till den förregistrerade
  designen, ändpunkterna och analysplanen.
- Du kan hantera konsekvensen: om prövningen misslyckas på sina
  förregistrerade ändpunkter, kan du inte tyst retcona till en
  annan ändpunkt som fungerade.
- Du deltar i en forskningskultur (akademisk medicin,
  kooperativa grupper, NIH-finansierad forskning) där
  förregistreringens integritet i allt högre grad krävs.

Detta kit är *särskilt* värdefullt för:

- Forskarinitierade prövningar vid akademiska institutioner (där
  sponsorpåtryckningar att ändra ändpunkter post-hoc är reella
  men där den akademiska forskaren har anseendemässigt incitament
  att stå emot).
- Open science-prövningar och medborgarforskningsstudier.
- Läkemedelsåteranvändningsprövningar i små bioteknikföretag utan
  långa meritlistor avseende prövningsgenomförande.
- Varje prövning avsedd att informera regulatoriska inlämningar
  där framtida "vi har aldrig sagt det"-argument skulle kunna
  framföras.

## När du INTE bör använda detta kit

Använd INTE detta kit om:

- Prövningsprotokollet fortfarande genuint är i förändring.
  Förregistrera när protokollet är slutgiltigt, inte tidigare.
- Du inte kan åta dig att publicera resultaten oavsett riktning.
  Förseglingen gör underlåtenhet att publicera offentligt
  detekterbar.
- Prövningen omfattar konkurrensutsatt industriell sekretess som
  hindrar dig från att göra analysplanen offentlig. Förseglingen
  gör analysplanen till en permanent offentlig handling; det finns
  inget sätt att försegla något privat.
- Du inte har juridiskt och etiskt godkännande för protokollet.
  Förseglingen registrerar protokollet såsom DU förseglade det;
  det kan inte retroaktivt godkännas av en etikprövningsnämnd.

## Hur du forkar detta kit för en verklig förregistrering

```bash
# 1. Kopiera detta exempel
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Ersätt fiktivt innehåll med det verkliga prövningsprotokollinnehållet.
# Varje fakta motsvarar ett avsnitt i en standardförregistrering:
$EDITOR facts/01_example_notice.txt   # ERSÄTT med verkligt försättsblad
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMÄR + SEKUNDÄR + EXPLORATIV
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Uppdatera site/index.html för att återspegla den verkliga prövningen.

# 4. Försegla (INNAN inkludering börjar, INNAN databaslås):
bash build/seal.sh

# 5. Verifiera lokalt:
python3 build/verify.py

# 6. Distribuera:
#    - Publicera försegelings-URL:en på prövningssponsorns webbplats OCH
#    - Lägg till IPFS CID i prövningens ClinicalTrials.gov-posts
#      "Description"- eller "References"-fält, så att registerposten
#      korshänvisar till den kryptografiska förseglingen.
```

**KRITISK TIDPUNKT**: förseglingen måste skapas INNAN inkludering
börjar. En förregistrering som förseglas efter att den första
patienten har inkluderats är forensiskt mycket svagare. Idealiskt
förseglar du vid tidpunkten för etikgodkännande.

## Integration med befintlig förregistreringsinfrastruktur

Kitet är utformat för att komponeras, inte ersätta:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: registrera prövningen i
  det jurisdiktionella registret enligt krav. Sedan, i registrets
  "Description"- eller "References"-fält, länka till den
  MYRIAM-förseglade publikationen.
- **OSF (Open Science Framework)**: OSF stöder förregistrering med
  datumstämplar men inte Bitcoin-förankring. MYRIAM-förseglingen
  kan bifogas som en kompletterande fil på OSF-registreringssidan,
  vilket ger både datumstämpel och Bitcoin-förankring.
- **AsPredicted.org**: liknande — länka MYRIAM-förseglingen som en
  kompletterande URL.
- **Tidskrifter**: vissa tidskrifter (t.ex. Trials, BMJ Open)
  accepterar förregistrerings-URL:er som en del av inlämningen.
  Inkludera MYRIAM-försegelings-URL:en jämte register-URL:en.

## Vad mottagare (regulatorer, tidskriftsgranskare, metaanalytiker) får

En prövning som förregistrerats under MYRIAM ger granskare:

1. **Kryptografiskt bevis på att protokollet färdigställdes vid en
   specifik tidpunkt.** Granskare kan verifiera försegelingstiden
   via OTS-kvittot.
2. **Bytewise stabilitet i protokolltexten.** Granskare som jämför
   den publicerade metodavsnittet med den förregistrerade designen
   kan göra det tecken-för-tecken.
3. **Detektion av byte av ändpunkter.** En enkel diff mellan det
   förseglade FACT 05 och den publicerade primära ändpunkten
   avslöjar varje utbyte.
4. **Detektion av avvikelse från analysplan.** En enkel diff mellan
   det förseglade FACT 06 och de publicerade statistiska metoderna
   avslöjar modifieringar.
5. **Detektion av selektiv subgruppsrapportering.** Det förseglade
   FACT 07 innehåller alla förregistrerade subgrupper; varje
   subgrupp i publikationen som inte finns i förseglingen måste
   märkas som post-hoc.

Detta gör systematisk översikt och metaanalys avsevärt enklare än
nuvarande praxis.

## Vad detta kit INTE är

- Inte en ersättning för IRB- / etikkommittégodkännande.
- Inte en ersättning för registrering i jurisdiktionellt register.
- Inte en garanti för att prövningen kommer att genomföras som
  planerat.
- Inte ett sätt att förankra patientsamtycke eller andra etiska
  dokument (de behöver sin egen förseglingsmekanism).
- Inte skydd mot kritik efter publicering av prövningsdesignen.

## En anmärkning om publicering av negativa resultat

Åtagande #1 i FACT 08 ("publicering oavsett riktning") är det
åtagande i förseglingen med högst dödlighetspåverkan. Den
historiska undertryckningen av negativa prövningsresultat (i
synnerhet för psykiatriska läkemedel hos ungdomar, onkologiska
läkemedel hos äldre populationer och kardiovaskulära läkemedel
hos kvinnor) har rimligen bidragit till tusentals förebyggbara
dödsfall under decennier genom överförskrivning baserad på
partiska effektskattningar.

Ett förseglat åtagande att publicera negativa resultat är, i sig,
en av de folkhälsoinsatser med högst hävstångseffekt en sponsor
kan göra. Förseglingen tillhandahåller extern ansvarsskyldighet
för det åtagandet på ett sätt som självpolisade publiceringspolicyer
inte gör.

## Avslutning

Förregistrering av läkemedelsprövningar under MYRIAM är litet
extraarbete för sponsorn: ~30 minuter att populera fakta,
~10 sekunder att försegla. Den ansvarsskyldighet det tillför är
asymmetrisk: liten kostnad för ärligt prövningsgenomförande, stor
begränsning för de post-hoc-manövrer som har bidragit till
historiska partiskheter i evidensbasen.

Om du är sponsor eller huvudprövare som överväger detta kit, är
kitet i public domain (CC0). Använd det. Modifiera det. Förbättra
det.

## Licens

Public domain (CC0). Ingen attribution krävs.
