*Svensk översättning — för den ursprungliga engelska versionen, se [README.md](README.md)*

# Kit för livsmedelssäkerhetsattestering

Ett nyckelfärdigt myriam-kit-exempel för livsmedelstillverkare,
livsmedelssäkerhetsinspektörer, tredjepartscertifierare och
tillsynsmyndigheter som vill publicera ett Bitcoin-förankrat,
manipuleringskänsligt sigill för *vad släpptesterna sa* och *vilket
frisläppningsbeslut som fattades*, vid själva ögonblicket för
satsfrisläppning eller signering av inspektionsrapport — så att
tyst efterhandsmodifiering av testdokumentationen,
frisläppningsbeslutet eller återkallelseåtagandena blir offentligt
upptäckbar.

---

## Vad detta kit INTE gör (läs först)

Sigillet är en kryptografisk tidsstämpel av VILKA släpptester som
utfördes på VILKEN sats, av VILKA ackrediterade laboratorier, enligt
VILKA metoder, med VILKA resultat, och vilket FRISLÄPPNINGSBESLUT
QA-myndigheten fattade på grundval av dessa resultat. Det kan inte
besvara någon fråga om livsmedelssäkerhet utöver det. Följande
ligger **utanför sigillets domän**:

1. **Förhindra kontamination.** Kitet förankrar vad testresultat
   SA vid frisläppning. Kontamination har många orsaker —
   heterogen mikrobiell fördelning inom en sats, temperaturmissbruk
   efter frisläppning under distribution, hanteringsfel i
   detaljhandeln, fel vid konsumentens tillredning, nya eller
   icke-screenade faror (t.ex. melaminförfalskning innan
   melaminscreening blev rutin), försörjningskedjebedrägeri
   uppströms från tillverkarens testomfattning. Sigillet förhindrar
   inget av detta och påstår sig inte göra det.

2. **Garantera att alla enheter i en godkänd sats är säkra.**
   Mikrobiologisk kontamination i bulklivsmedel är HETEROGEN.
   Listeria, Salmonella och STEC-patogener förekommer i
   lågprevalenta lokala hotspots, inte jämnt fördelade. ICMSF-
   och Codex-provtagningsplaner har en dokumenterad, begränsad
   sannolikhet att upptäcka kontamination som föreligger vid låg
   prevalens — sannolikheten är INTE 1. En sats som klarar
   frisläppningsprovtagning kan fortfarande innehålla kontaminerade
   enheter som inte provtogs. Sigillet förankrar PROVERNA, inte
   bulken. Denna begränsning upprepas uttryckligen i FAKTA 03 och
   är den enskilt viktigaste ärliga gränsen för detta kit.

3. **Certifiera att släpptester utfördes ärligt.** Sigillet
   förankrar vad testerna rapporterade vid frisläppning. Ett
   laboratorium som rapporterar ett bedrägligt GODKÄNT vid
   frisläppning producerar ett kryptografiskt giltigt sigill av
   ett bedrägligt GODKÄNT. Kitet gör senare tyst modifiering
   upptäckbar, men upptäcker inte samtidigt bedrägeri. Upptäckt
   av samtidigt bedrägeri kräver granskning, övervakning av
   laboratorieackreditering (ISO 17025-tillsyn),
   kompetensprovningsprogram och tillsynsinspektion — allt detta
   ligger uppströms från sigillet.

4. **Ersätta FSMA-, FSIS- eller EU-myndighetsinlämningar.**
   Frisläppningsdokumentation enligt FSMA, FSIS, EU-förordning
   (EG) 178/2002 och Codex Alimentarius upprätthålls enligt
   stadga och produceras på myndighetens begäran. Sigillet
   lägger till ett offentligt manipuleringskänsligt lager OVANPÅ
   dessa inlämningar; det ERSÄTTER dem inte. En sigillförsedd
   publicering är inte en myndighetsinlämning.

5. **Lösa tvister om återkallelseomfång.** Kitet kan sigilla de
   återkallelseåtaganden som gjordes vid frisläppning (FAKTA 06)
   och en efterföljande återkallelseomfattning som en ny
   publicering; men gränsen för vilka satser som påverkas, vilka
   enheter som skickats, vilka detaljhandlare som mottagit dem
   och vilka konsumenter som exponerats är fortfarande en
   spårnings-fram-och-tillbaka-undersökning. Sigillet förankrar
   vad tillverkaren ÅTOG sig och vad de senare GJORDE. Det löser
   inte den underliggande epidemiologiska frågan.

6. **Upptäcka avsiktligt försörjningskedjebedrägeri uppströms
   från testning.** Melaminförfalskningen av mjölk och
   modersmjölksersättning i Kina 2008 lyckades eftersom melamin
   inte fanns i analytpanelen — kvävehaltsmätning som
   proteinekvivalent fanns, och melamin lurade den. En sigillad
   FAKTA 03 med den vid tiden använda analytpanelen skulle ha
   åtagit sig den panelen offentligt — men skulle inte ha gjort
   något för att upptäcka förfalskningsmedlet utanför panelen.
   Sigillets värde i det fallet skulle ha varit forensisk
   förankring av "detta är vad tillverkaren påstod sig testa
   för," INTE förebyggande. Ett verkligt
   livsmedelssäkerhetsregelverk hanterar detta genom oanmäld
   tillsynsprovtagning med brett screeningomfång (t.ex. LC-MS-
   icke-målade metoder), vilket ligger uppströms från
   tillverkarens sigill.

7. **Förankra distribution efter frisläppning och
   konsumenthantering.** När satsen lämnar anläggningen är
   temperaturmissbruk under distribution, felhantering i
   detaljhandeln, konsumentens lagringsfel och konsumentens
   tillredningsfel alla utanför omfånget. Sigillet är begränsat
   till tillverkarens frisläppningshändelse. Manipuleringskänslighet
   nedströms kräver separata kit på distributörs-, detaljhandels-
   och (för institutionella konsumenter som skolor och sjukhus)
   användningspunktsnivå.

8. **Borga för säkerheten hos livsmedel i någon specifik
   befolkningsgrupp.** GODKÄNT-resultat i FAKTA 03 medför inte
   säkerhet för gravida konsumenter, spädbarn, immunsupprimerade
   konsumenter eller äldre, för vilka Listeria monocytogenes och
   Salmonella uppvisar dokumenterat förhöjd risk även vid
   koncentrationer under konventionella detektionsgränser.
   Sigillet kan inte göra ett befolkningsspecifikt
   säkerhetspåstående och vägrar att göra det (vägran-regel R6).

**Det ärliga-gränser-avsnittet ovan är den lastbärande delen av
detta kit.** Tillverkare som behandlar "vi sigillade vår
frisläppningsdokumentation" som likvärdigt med "vi bevisade att
vår mat är säker" missbrukar primitiven. Kitet måste säga rakt
ut: *detta är en icke-förnekelseprimitiv för tillverkarens
samtidiga påståenden vid frisläppning, inte ett bevis på
säkerhet, inte en ersättning för tillsynsmyndighetens översyn och
inte ett försvar mot de heterogena-kontaminations-,
försörjningskedje-bedrägeri- eller efter-frisläppnings-
felhanteringssvikt som har dödat människor vid tidigare utbrott.*

---

## Vad detta kit MÅSTE VÄGRA att sigilla

Kitet är konfigurerat att avvisa följande faktamönster även om en
användare med giltig tillverkar-signeringsbehörighet skickar in dem:

- **Personlig identifiering av någon arbetare, arbetsledare,
  QA-personal, besökande inspektör eller tredjepartsrevisor.**
  Namn, anställnings-ID, brickanummer, personnummer,
  hemadresser, privata telefonnummer — inget av detta förekommer
  i det offentliga sigillet. Roller är offentliga; person-till-
  roll-bindningar sigillas separat och är upptäckbara enligt
  tillsynsförfarande. Arbetstagares skydd mot repressalier och
  trakasserier är den lastbärande begränsningen;
  livsmedelssäkerhetsattestering kan göras på rollnivå. (R1)

- **Exakt anläggningsplats.** Anläggningens region (delstat
  eller flerstatsregion) är acceptabel; exakt gatuadress,
  GPS-koordinater eller någon identifierare med tillräcklig
  granularitet för att fysiskt identifiera anläggningen på en
  karta är INTE acceptabel. Det myndighetsutgivna
  etableringsnumret är tillsynsmyndighetens identifierare för
  anläggningen; fysisk säkerhet och arbetstagarsäkerhet talar
  emot att publicera en offentlig adress på Bitcoin. (R2)

- **Personliga mönster för enskilda produktionsskift.**
  Skiftscheman, individuella arbetarrotationer, personliga
  ID-nummer för linjeoperatörer — inget av detta förekommer i
  sigillet. Livsmönster för enskilda arbetare får inte vara
  härledbara från den offentliga attesteringen. (R3)

- **Leverantörsidentiteter som äventyrar avtal.**
  Leverantörsnamn, leverantörsanläggningarnas platser,
  leverantörens satskoder (förutom i fallet med
  försörjningskedjekontamination där namngivning av en
  leverantörs kontaminerade sats krävs för folkhälsa och hanteras
  genom en separat sigillad publicering) publiceras INTE i
  frisläppningssigillet. Många leveransavtal innehåller
  sekretessklausuler; sigillet bryter inte mot dessa som
  standard. (R4)

- **Kundlistor och distributionsdestinationer bortom hög nivå.**
  Regional sammanfattning på hög nivå är acceptabel; specifika
  kundlistor (detaljhandlare, distributionscentraler,
  foodservicekonton) är INTE acceptabla. Kundidentitet är
  avtalsmässigt konfidentiell och konkurrensmässigt känslig;
  tillsynsmyndigheten erhåller kundlistan genom etablerade
  återkallelse-koordinationskanaler. (R5)

- **Säkerhetspåståenden eller juridiska slutsatser.** Kitet
  kommer inte att sigilla "denna produkt är säker," "denna sats
  uppfyller alla tillämpliga livsmedelssäkerhetsstandarder,"
  "detta är GRAS för denna användning," eller någon annan
  säkerhets- eller juridisk slutsats. Kitet förankrar
  testdokumentationen och frisläppningsbeslutet, INTE en
  säkerhetsslutsats. (R6)

- **Arbetar-klagomål eller whistleblower-
  återidentifieringsmönster.** Kitet vägrar publicera något
  mönster som skulle kunna återidentifiera en arbetare som har
  lämnat in ett OSHA-, USDA- eller företagsinternt klagomål om
  livsmedels- eller arbetsplatssäkerhetspraxis. Sådana
  klagomålslämnare skyddas av FSMA Section 402 och parallella
  stadgar; sigillet får inte bli en återidentifieringsvektor.
  Whistleblower-attesteringar har sitt eget kit
  (`examples/whistleblower-manifest`) med vägran-regler
  anpassade till det användningsfallet. (R7)

- **Sigillering av någon annan än den frisläppande tillverkarens
  auktoriserade huvudman.** En tredjepartscertifierare, kunds
  QA-team eller oberoende revisor kan använda samma kit för att
  sigilla SINA egna granskningsresultat; de får INTE sigilla det
  ursprungliga frisläppningsbeslutet i tillverkarens namn. Den
  signerande huvudmannen i FAKTA 08 är den enda giltiga
  signataren för det. (R8)

En vägran själv kan sigillas som ett faktum ("Denna tillverkare
begärde sigillering av X; kitet vägrade enligt vägran-regel Y"),
vilket skapar en offentlig dokumentation av försökt missbruk.

---

## Vad detta kit DOES sigilla

8 fakta vid frisläppningsögonblicket:

1. **Exempelnotis** — förklarar publiceringen som ett exempel
   (verkliga attesteringar tar bort eller ersätter detta).
2. **Produkt- och satsidentifiering** — produktnamn, kategori,
   tillverkare, anläggningens region (INTE exakt plats),
   HACCP-planversion + hash, sats-ID, produktions-/förpacknings-
   /sista förbrukningsdatum, antal konsumentenheter,
   lagringskrav, de tre kritiska kontrollpunkterna med loggade
   poster-hashar (cook lethality, cooling stabilization,
   post-lethality RTE environment).
3. **Resultat av släpptester** — mikrobiologiska tester på
   slutprodukt (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), kemiska / resttester (nitrit,
   veterinärmedicinska rester, tungmetaller), kontroll av
   allergen-korskontakt, sammanfattning av miljöövervakning,
   var och en med SHA-256 av den fullständiga rapport-PDF:en
   och den uttryckliga begränsningen prov-vs-bulk-tolkning.
4. **Metodik och laboratoriets kvalifikation** — vilken metod
   (och vilken metoddokumentversion) som användes per rad,
   vilka laboratorier som körde vilka tester, varje
   laboratoriums ISO/IEC 17025:2017-ackrediteringsstatus och
   certifikat-hash, senaste kompetensprovningsresultat,
   oberoendeförklaring, avvikelse-/omtestnings-/OOS-dokumentation
   för denna sats.
5. **Frisläppningsbeslut** — frisläppningsdatum,
   frisläppningsbehörighet + motsignering på rollnivå,
   sammanfattning av beslutsstödjande dokumentation,
   distributionsdestinationer på hög nivå, åtaganden efter
   frisläppning bekräftade vid frisläppning, tidsplan- och
   oåterkallelighetsförpliktelse.
6. **Åtaganden för återkallelse och eftermarknadsövervakning**
   — livsmedelssäkerhetens motsvarighet till farmakovigilans:
   transparens kring sjukdomssignaler,
   återkallelse-utförande-åtaganden (24h / 72h / 98 %
   trösklar), respons på försörjningskedjekontamination, åtagande
   om ingen-tyst-omtestning, åtagande om inga-efterhands-
   specifikationsändringar, aggregerad
   säkerhetssignaldelning.
7. **Kompletterande utlämningar och vägran-register** —
   utredningslogg-hash för korrigerande åtgärder, senaste
   inspektionshistorik, återkallelsehistorik, kända öppna problem
   i de testmetoder som används, roll-till-individ-bindning
   (sigillad separat, hashad här),
   leverantörsspårningsberedskap, uttrycklig lista över
   vägran-regler R1-R8 med eventuella vägranden som utövats
   under denna frisläppning.
8. **Signerande huvudman** — tillverkare + rollnivå-signatär
   (QA-direktör) + rollnivå-motsignering (anläggningschef) +
   kryptografisk nyckelinformation; motivering för publicering
   på rollnivå.

Varje faktum slutar med vägran-grindkonventionen: *"Detta faktum
hävdar endast X. Det hävdar inte Y"* (där Y är det närmaste
felläget från avsnittet "GÖR INTE" ovan).

---

## Vad detta kit försvarar mot

- **Tyst retroaktiv modifiering av frisläppningstestresultat.**
  Alla testrapport-PDF:er hashas. Omhashing efter frisläppning
  avslöjar varje modifiering.
- **Tvister om vilka metoder, vilka metoddokumentversioner och
  vilka laboratorier som användes.** FAKTA 04 fryser metodiken
  och laboratoriernas ackrediteringsstatus vid frisläppning.
  Senare påståenden av typen "vi använde faktiskt MLG 4.13, inte
  4.12" är offentligt motbevisbara.
- **Retroaktiv omspecifikation för en sats utanför specifikation.**
  Om ett frisläppningstestresultat faktiskt var ett gränsfall-
  GODKÄNT som omklassificeras som UNDERKÄNT efter frisläppning,
  bevisar de sigillade rapport-hasharna vad det ursprungliga
  resultat-PDF:et sa. Symmetriskt är en gränsfalls-OOS som tyst
  testas om till ett GODKÄNT utan utlämning upptäckbar om
  FAKTA 06:s åtagande om ingen-tyst-omtestning senare jämförs
  mot ett osigillat tillägg.
- **Tyst minimering av återkallelseomfattning.**
  Återkallelseåtagandena i FAKTA 06 (24-timmars meddelande,
  72-timmars initiering, 98 % återvinningsgrad) är sigillade;
  underlåtenhet att hedra dem är offentligt observerbar.
- **Efterhands omberättelse av korrigerande åtgärds-historik.**
  FAKTA 07:s korrigerande-åtgärds-logg-hash fryser vad företaget
  SA att det gjorde efter den preliminära EMP-fyndet; senare
  påståenden om "vi gjorde mer / mindre än så" är offentligt
  motbevisbara.
- **Selektiv utelämning av kompletterande utlämningar.**
  FAKTA 07 räknar upp de förväntade
  utlämningskategorierna (inspektionshistorik,
  återkallelsehistorik, metod-rådgivningsgranskning,
  spårningsberedskap); en tom kategori måste uttryckligen
  attesteras ("ingen vid frisläppningstid"), så ett senare "vi
  insåg inte att det var relevant" är offentligt motbevisbart.
- **Substitution av ett annat laboratoriums ackrediteringsstatus.**
  FAKTA 04 fryser varje laboratoriums ISO 17025-omfattning och
  certifikat-hash vid frisläppning; en senare substitution med
  ett icke-ackrediterat laboratorium är offentligt upptäckbar.

Kitet försvarar **inte** mot samtidig korruption — ett team som
avsiktligt sigillar falska testresultat vid frisläppningstid
producerar ett kryptografiskt giltigt sigill av falska
testresultat. Primitiven är ärlig om detta: den är en
icke-förnekelseprimitiv för tillverkarens samtidiga påståenden,
inte ett bevis på att dessa påståenden är korrekta.

---

## Historiskt dödlighetsprecedens

Kitet skulle ha producerat ett användbart ankare — *inte en
lösning* — i tidigare livsmedelssäkerhetsmisslyckanden. För att
undvika att förtala enskilda (de flesta
livsmedelssäkerhetsmisslyckanden är företagsmässiga, inte
individuella; vissa åtalas straffrättsligt och vissa inte),
beskriver dessa referenser utbrottet efter år och patogen och
namnger den involverade enheten endast när kontaminationen
offentligt tillskrevs genom återkallelsemeddelande eller
domstolsprotokoll.

- **2008 Kinas melaminförfalskning av modersmjölksersättning och
  mejeriprodukter (Sanlu Group m.fl.).** Minst sex spädbarnsdöd
  och cirka 300 000 sjukdomsfall som tillskrevs melaminförsedda
  mejeriprodukter konstruerade för att bedrägligt blåsa upp
  uppenbart proteininnehåll på Kjeldahl-kvävebaserade analyser.
  Fällande domar följde i kinesiska domstolar, inklusive
  dödsstraff. *Sigillet skulle inte ha förhindrat detta* —
  melamin låg utanför standard-analytpanelen. Sigillet skulle ha
  åtagit sig offentligt vad panelen VAR, vilket gjort omfattningen
  av efterhandsutvidgningen av rutinmässig screening forensiskt
  tydlig.

- **2011 europeiska STEC O104:H4-utbrottet (bockhornsklöverskott
  spårade till en tysk gård).** 53 dödsfall, cirka 3 950
  sjukdomsfall i flera europeiska länder; spårades slutligen till
  bockhornsklöverfrön importerade från Egypten och grodda hos en
  tysk producent. Spårning hindrades av inkonsekvent
  satsnivådokumentation över den fleranationella
  försörjningskedjan. *Sigillet skulle inte ha förhindrat
  kontaminationen av frösatsen* (kontaminationen var uppströms
  från groddarens tester); det skulle ha förankrat vad groddarens
  släpptester påstod och, om använt på frö-importörsnivå, vad
  hanteringen av importerade frön påstod, vilket gjorde
  spårningen snabbare.

- **2015 Blue Bell Creameries Listeria monocytogenes-utbrott
  (USA).** 3 dödsfall, 10 sjukdomsfall i flera delstater; ledde
  till en nationell återkallelse och en straffrättslig fällande
  dom på federal nivå mot Blue Bell 2020 för förseelse-anklagelser
  rörande livsmedelssäkerhet, varvid företaget ingick en
  uppskjuten-åtals-uppgörelse och betalade 19,35 miljoner dollar.
  Senare civilrättsliga processer. *Sigillet skulle inte ha
  förhindrat* den in-anläggnings Listeria-miljökontamination; det
  skulle ha forensiskt förankrat
  miljöövervakningsprogrammets register, vilket gjort varje
  efterhandsfråga om "vad visade EMP under månaderna före
  utbrottet" besvarbar mot en manipuleringskänslig tidsstämplad
  dokumentation snarare än mot senare producerade dokument.

- **2018 multistatliga STEC O157:H7-utbrott kopplade till
  romansallat (Yuma odlingsregion, sedan Salinas
  odlingsregion).** Minst 5 dödsfall och cirka 210 sjukdomsfall
  över flera utbrott det året. Spårningen försvårades av
  blandkällsförpackad produkt. *Sigillet skulle inte ha
  förhindrat* kontaminationen på fält- /
  bevattningsvattennivå (uppströms från tillverkaren); det skulle
  ha forensiskt förankrat varje processors
  ingångstest- och frisläppningstestregister, vilket gjort
  spårningen snabbare och det offentliga registret mer
  kryptografiskt försvarbart mot senare tvister.

- **Peanut Corporation of America Salmonella Typhimurium-utbrott
  (2008–2009, USA).** 9 dödsfall, cirka 714 sjukdomsfall;
  resulterade i federala straffrättsliga fällande domar 2014–2015
  mot PCA-ledning, inklusive en 28-årig fängelsedom för VD:n för
  konspirations- och hinderanklagelser. *Sigillet skulle inte ha
  förhindrat* kontaminationen, underutredningen av positiva
  in-anläggnings Salmonella-tester, eller ledningsbeslutet att
  skicka produkt mot dessa positiva fynd. Det SKULLE ha gjort
  forensiskt tydligt, vid rättegång, vad testresultaten SA i det
  ögonblick de genererades — vilket gjort åklagarens fall mot
  samtidiga falsk-narrativ e-postmeddelanden väsentligt bättre
  förankrat mot dokumentmodifiering.

I vart och ett av dessa fall skulle kitet ha tillhandahållit en
renare forensisk tidslinje. I inget av dessa fall skulle kitet
ensamt ha förhindrat dödsfallen. Sigillet är forensisk
infrastruktur, inte förebyggande infrastruktur. Den distinktionen
är kitets ärlighet.

---

## När detta kit ska användas

- Er tillverkning har ett stabilt HACCP- / Preventive Controls-
  program och vill lägga till en Bitcoin-förankrad offentlig
  attestering som ett manipuleringskänsligt lager ovanpå den
  befintliga frisläppningsdokumentations-arbetsflödet.
- Ni är en liten till mellanstor tillverkare eller en tillverkare
  i en jurisdiktion med svagare regulatorisk infrastruktur som
  vill förankra satsregister mot en globalt verifierbar tidslinje
  — för förtroende på exportmarknader, för svar på kundrevisioner
  eller för deltagande i frivilliga transparensinitiativ.
- Ni är livsmedelssäkerhetsinspektör eller
  tredjepartscertifierare och vill publicera ett
  manipuleringskänsligt revisionsfynds-sigill vid signering, så
  att revisionsfynden inte tyst kan ändras senare genom
  överenskommelse mellan tillverkaren och certifieraren.
- Ni förväntar er att denna sats ska möta betydande nedströms
  granskning (exportmarknad, högriskkategori som RTE-kött eller
  modersmjölksersättning, ny ingrediens, nyligen återkallelses-
  historik).
- Ni kan publicera den listade faktauppsättningen utan att bryta
  mot vägran-reglerna R1-R8. Om era fakta skulle kräva ett brott
  mot R1-R8, använd inte kitet; fixa dataingångarna först.
- Tillverkarens jurister har granskat publiceringsplanen.
  Offentlig publicering av en sats-identifierare-bärande artefakt
  har implikationer för produktansvarsexponering;
  juristgranskning är inte valfri.

## När detta kit INTE ska användas

- **Använd inte som ersättning för FSMA- / FSIS- / EU-
  myndighetsregister.** Sigillet är *additivt*, inte ersättning.
  Era stadgeenliga frisläppningsregister, er HACCP-plan, era
  CCP-loggar och er återkallelseplan är oförändrade.
- **Använd inte som ett säkerhetspåstående.** Att sigilla en
  godkänd frisläppningsdokumentation etablerar inte att produkten
  är säker; det etablerar att dokumentationen hade detta
  byte-innehåll vid denna tidpunkt. Vägran-regel R6 kommer att
  avvisa varje säkerhetsslutsats.
- **Använd inte för att publicera leverantörsidentiteter,
  kundlistor, arbetarnamn eller anläggningsadresser.** Vägran-
  reglerna R1-R5 finns av människo-säkerhets- och avtalsskäl;
  ändra inte kitet för att besegra dem utan att rådfråga
  jurister.
- **Använd inte under press att sigilla innan
  frisläppningstestning är slutförd.** Ett sigill med
  partiell data ger en felaktig bild av frisläppningsbeslutets
  tillstånd.
- **Använd inte som legitimitetsteater.** Ett sigill av en
  dåligt utformad provtagningsplan eller en dåligt vald
  analytpanel är ett permanent offentligt register av
  otillräckligheten, inte ett försvar mot den. Primitiven skär
  åt båda hållen; det är dess ärlighet.
- **Använd inte under en pågående återkallelsesituation som en
  ersättning för tillsynsmyndighetens återkallelsesamordning.**
  En ny MYRIAM-publicering som förankrar
  återkallelseomfattningen är lämplig EFTER att den av
  tillsynsmyndigheten samordnade återkallelsen har inletts; den
  är inte en ersättning för tillsynsmyndighetens
  återkallelsekanal.

## Hur man forkar detta kit för en verklig frisläppning

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**KRITISK TIDPUNKT:** sigilla vid ögonblicket för QA-frisläppning,
INNAN satsen distribueras (innan den första lastbilen lämnar
anläggningen). Ett sigill efter att distributionen börjar har
fortfarande värde men förankrar inte det fördistributiva
tillståndet rent. Det rätta fönstret ligger mellan
QA-frisläppningsignaturen och den första distributionsrörelsen.

**KRITISK GRANSKNING:** innan sigillering, kör publiceringen genom
en andra QA-granskare (inte huvudgranskaren) och genom företagets
jurister. När den väl är sigillad är publiceringen permanent.

## Integration med befintlig livsmedelssäkerhetsinfrastruktur

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  URL:en för den sigillade publiceringen eller IPFS-CID:n kan
  refereras i Food Safety Plan-dokumentationen som
  offentlig-attesterings-artefakten för denna sats.
- **USDA FSIS HACCP-planer och frisläppningsregister.** Den
  sigillade frisläppningsdokumentationen ligger bredvid de
  FSIS-krävda HACCP-registren; sigillet refererar till
  HACCP-planens-versions-hashen (FAKTA 02) så att senare tvister
  om vilken planversion som var i kraft är offentligt
  motbevisbara.
- **Codex Alimentarius / HACCP-principer** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Sigillet förpliktar sig till sju-principers
  HACCP-utfall (faroanalys, CCP:er, kritiska gränser,
  övervakning, korrigerande åtgärder, verifiering, journalföring)
  för denna sats.
- **ISO 22000:2018 (Livsmedelssäkerhets-ledningssystem).**
  Sigillet kan refereras som en del av management-granskningens
  bevisspår; det ersätter inte ISO 22000-certifieringen.
- **FSSC 22000 v6-certifieringsschema.** Kompatibelt som ett
  additivt transparenslager; FSSC:s revisor kan verifiera
  sigillet vid övervakning.
- **EU-förordning (EG) 178/2002 (Allmänna livsmedelslagen)
  Artikel 18 (spårbarhet) och Artikel 19 (återkallelse-
  meddelande).** Sigillet förpliktar tillverkarens
  one-tier-back-spårningsberedskap (FAKTA 07) och
  återkallelseåtaganden (FAKTA 06); det ersätter inte den
  stadgeenliga Artikel 19-meddelandeskyldigheten.
- **EU:s hygienpaket (förordningarna 852/2004, 853/2004,
  854/2004, 882/2004).** Kompatibelt; sigillet refererar
  motsvarigheten till hygienpaketets HACCP- och egenkontroll-
  register.
- **BRCGS- / SQF-privata-standardsystem.** Kompatibelt som ett
  additivt transparenslager.
- **Folkhälsoövervakningssystem (CDC PulseNet, FoodNet, IFSAC;
  EU EFSA / ECDC).** Direkt utanför sigillets omfång, men FAKTA
  06 förpliktar tillverkaren att delta och att sigilla varje
  signal-korrelations-händelse som nya MYRIAM-publiceringar.

## Vad detta kit INTE ersätter

- FDA Food Facility Registration eller USDA FSIS Establishment-
  godkännande.
- Er skriftliga Food Safety Plan / HACCP Plan enligt
  FSMA / FSIS.
- CCP-övervakningsloggar och korrigerande-åtgärdsregister.
- ISO 17025 laboratorieackrediteringstillsyn.
- Kompetensprovningsprogram.
- Tillsynsinspektion (FSIS kontinuerlig inspektion, FDA periodisk
  inspektion, EU:s behöriga myndighets-inspektion).
- Folkhälsoövervakning (CDC, EFSA, ECDC, nationella
  motsvarigheter).
- Återkallelse-samordningskanaler (FDA Reportable Food Registry,
  FSIS återkallelse-samordning, EU RASFF, nationella
  motsvarigheter).
- Arbetstagarsäkerhets- och livsmedelsarbetar-
  utbildningsprogram.

## Varför detta kit finns i v0.4.0+

Detta är ett av de utarbetade exemplen som levereras med
myriam-kit. Det följer den begränsnings-först README-struktur
som validerats av autoresearchen dokumenterad i
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — den begränsnings-först
prompt-varianten fick högsta poäng på en viktad rubrik över
flera exempeldomäner, eftersom livsmedelssäkerhetsattestering är
precis den domän där det är farligt att överdriva vad sigillet
bevisar: människor har dött och kommer att dö i misslyckanden som
sigillet inte kan förhindra. De inledande avsnitten är de
lastbärande delarna av kitet; manifestinnehållet är den enkla
delen.

Kitets standarder är medvetet konservativa när det gäller
publicering av arbetarnamn, konservativa vad gäller
anläggningsplats-precision, konservativa vad gäller leverantörs-
och kundidentitet och aggressiva vad gäller "detta etablerar
inte säkerhet"-friskrivningen. Livsmedelssäkerhets-gemenskapen
har en dokumenterad historia av överdriven certifieringsspråk;
kitet är som standard i den position som är minst sannolik att
läsas som en säkerhetsgaranti. Tillverkare i jurisdiktioner där
specifika offentliga utlämningskrav skiljer sig kan ändra sin
fork därefter, men standardvägrandet gynnar arbetstagarsäkerhet
och ärligt omfång.

## Licens

Public domain (CC0). Forka det. Ingen tillskrivning krävs.
