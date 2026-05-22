*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Försegling av attestering av leverantörskedjerevision

Ett nyckelfärdigt myriam-kit-exempel för tredjeparts sociala/
arbets-/miljörevisorer, interna leverantörscompliance-team,
NGO-utredare av leverantörskedjor, och arbetarrättsorganisationer
som vill publicera en Bitcoin-förankrad, manipuleringsbevisande
försegling av en revisionsrapport vid exakt
undertecknandetillfället.

---

## Vad detta kit INTE gör (läs först)

Förseglingen är en kryptografisk tidsstämpel av vad revisorn
undertecknade. Den kan inte verifiera huruvida det som
undertecknades är **sant**. Följande felmoder ligger **utanför
förseglingens domän**:

1. **Revisionskapning av branschen.** Märkesbeställda revisioner
   har en lång, dokumenterad historia av att producera mjuka fynd
   på leverantörer vars fortsatta affärer med det beställande
   märket håller revisionsrörledningen flytande. En kapad
   revision, när den förseglas, producerar ett permanent
   forensiskt register av den kapade revisionen. Förseglingen
   korrigerar inte kapningen — den gör endast den
   som-utfärdade revisionen oföränderlig, så att en senare
   sanningsfindande process har något konkret att jämföra med.

2. **Tränade arbetare / förberedda anläggningar.** Aviserade eller
   halvaviserade revisioner ger ledningen dagar eller veckor att
   repetera arbetarnas svar, dölja minderåriga arbetare, städa
   sovsalar, ta bort icke-överensstämmande utrustning, och
   omdirigera arbete till oreviderade underentreprenörer under
   revisionsfönstret. Förseglingen förankrar vad revisorerna fick
   se, inte vad de hindrades från att se.

3. **Dolt underentreprenörskap.** Tier-2- och Tier-3-
   underentreprenörskap, hemarbete, och informell sektorproduktion
   är genomgripande osynliga för fabriksgolvsrevisioner.
   Förseglingen förankrar en Tier-1-revision; den kan inte
   upptäcka att Tier-1 lägger ut till en oreviderad Tier-2 under
   revisionsfönstret eller rutinmässigt.

4. **Revisioner som systematiskt missar det missbruk de
   riktar sig mot.** Rana Plaza, kollapsen av en bangladeshisk
   klädesfabriksbyggnad 2013 som dödade 1 134 arbetare, hade
   reviderats av flera märkesbeställda revisionsprogram månaderna
   före. Sprickorna i byggnaden fanns inte på den sociala
   revisionschecklistan; revisionsregimen hade ingen
   strukturingenjörsskap. Revisioner förankrar vad som är *inom
   omfång*; missbruk utanför omfång förblir osynligt oavsett hur
   manipuleringsbevisande förseglingen är.

5. **Vedergällning efter undertecknande mot arbetare som
   deltog i intervjuer.** Även med vägrad lokaliseringsinformation
   (FAKTUM 07 R3), kan en beslutsam motståndare som känner till
   leverantörs-ID:t identifiera anläggningen. Arbetsskydd kräver
   mer än att bara vägra PII i förseglingen — det kräver
   anonymisering uppströms i revisionsmetodiken. Förseglingen gör
   den som-utfärdade revisionen varaktig; den skyddar inte
   intervjuobjekten retroaktivt.

6. **Arbetsförhållanden som är lagliga men omänskliga.** Glapp
   för försörjningslön i jurisdiktioner där den lagliga
   minimilönen ligger under benchmark för försörjningslön
   producerar "överensstämmande" revisionsfynd mot löne- och
   tidslagar och "icke-överensstämmande" fynd mot
   försörjningslönstandarder i samma revision (FAKTUM 03 element 8
   i detta exempelkit). Förseglingen förankrar vad varje standard
   rapporterar; att förlika dem är nedströms policyarbete.

7. **Klimat-/miljöskador med diffus kausalitet.**
   Koldioxidutsläpp, bidrag till avskogning, vattenförbrukning, och
   utsläpp av föroreningar från leverantörer kan förseglas i
   revisionsfynd, men kausal tilldelning till ett specifikt märkes
   ordervolym är metodologiskt omtvistad. Förseglingen förankrar
   vad som mättes hos leverantören; den tilldelar inte moraliskt
   eller rättsligt ansvar.

8. **Tvister om vilken standard som är auktoritativ.** SA8000 vs.
   BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs.
   företagsspecifik uppförandekod: var och en har olika omfång,
   svårighetsgrader, och åtgärdsprocesser. Förseglingen förankrar
   *en* revision under *en* standard. Standardövergripande
   jämförelse är ett nedströms problem.

9. **Revisorns kompetens vs. revisorns kvalifikation.**
   "Kvalificerad" är inte "kompetent". Revisorer som slutfört
   ackrediterade utbildningsprogram har missat allvarliga
   missbruk i revisioner som föregick offentligt synliga
   katastrofer. Förseglingen förankrar kvalifikationer; den
   certifierar inte den kompetens med vilken de utövades.

**Avsnittet om hederliga gränser ovan är den bärande delen av
detta kit.** Ett märke som vill ha legitimitetsteater kommer att
använda en förseglad revision som en sköld. Kitet måste säga rakt
ut: detta är ett *icke-förnekande-primitiv för
revisionsrapportens undertecknandeögonblick*, inte ett bevis på
leverantörens överensstämmelse eller arbetarvälmående.

---

## Vad detta kit MÅSTE VÄGRA att försegla

Kitet är konfigurerat att avvisa följande faktamönster även om en
användare med giltig revisionsorgansbefogenhet skickar in dem:

- **Individuell arbetaridentifiering.** Inget faktum får namnge
  en arbetare, koppla ett citat till en arbetare, exponera
  brickenummer, linjeposition, sovrumsnummer, skiftschema,
  demografisk kombination med N<5, eller något fält som kan
  återidentifiera en person som deltog i intervjuer. Arbetarcitat
  använder randomiserade tokens; mappningen förseglas aldrig.
- **Whistleblower-/informantkällor.** Om ett fynd vilar på
  avslöjande av en individ som tog risk för att avslöja, namnges
  eller identifieras individen aldrig i den förseglade
  publiceringen.
- **Exakt lokaliseringsinformation.** Ingen gatuadress, GPS,
  satellitbild med >1km upplösning, eller externt
  byggnadsfotografi. Land och region är den högsta upplösning som
  förseglas. Motivering: anläggningsidentifiering möjliggör
  vedergällning mot intervjudeltagare.
- **Påstående om ren-revisions-certifiering.** Kitet vägrar att
  försegla någon inramning av formen "denna revision bevisar att
  leverantören är överensstämmande" eller "inga överträdelser
  finns". Renhetsanspråk är epistemiskt ostödda av
  revisionsmetodik.
- **Försegling-som-certifikat-substitution.** En publicering som
  utelämnar metodik (FAKTUM 04), oberoende (FAKTUM 06), eller
  vägranden (FAKTUM 07) är inte en legitim MYRIAM-publicering
  under detta kit.
- **Utkast-/förundertecknande-revisioner.** Försegling sker vid
  undertecknande, inte före. Preliminära revisioner skapar falsk
  visshet.
- **Efterhand fördelaktig återförsegling.** En reviderad revision
  kräver en NY förseglad publicering som refererar till originalet
  via Merkle-rot. Den ursprungliga förseglade revisionen förblir
  permanent synlig som den som-utfärdade revisionen.
- **Försegling av någon annan part än revisionsorganet.** Ett
  märke, leverantör, certifieringsorgan eller tredje part kan
  inte försegla "revisionen" i stället för det revisionsorgan som
  undertecknade rapporten.

En vägran själv kan förseglas som ett faktum ("Denna part begärde
försegling av X; kitet vägrade enligt vägransregel Y"), vilket
skapar ett offentligt register över försök till missbruk. **I en
bransch med utbredd revisionskapning kan vägran-att-försegla
i sig vara en meningsfull signal:** ett revisionsorgan som inte
förseglar eftersom ett märke pressat på uppmjukning av fynd har
möjligheten att offentligt registrera vägran under sin egen
principal.

---

## Vad detta kit förseglar

8 fakta vid revisionsundertecknandetillfället:

1. **Exempelmeddelande** — förklarar publiceringen som ett exempel
   (riktiga attesteringar tar bort eller ersätter detta).
2. **Revisionsomfång och föremål** — revisionsstandard,
   revisionsorgan, ledande revisor, revisionsteamstorlek,
   leverantörsidentifierare (ingen exakt lokaliseringsinformation),
   revisionsfönster, aviseringstyp (aviserad / halvaviserad /
   oaviserad), revisionsrapportdatum, undertecknandeversion,
   namngivna mottagarmärken, beställande part.
3. **Revisionsfyndsmanifest** — per-element överensstämmelse /
   mindre-NC / större-NC / kritisk-NC mot standarden, var och en
   med en SHA-256 av den fullständiga fyndupskrivningen.
   Aggregerade totalsummor. Certifieringsrekommendation vid
   undertecknande.
4. **Metodik och bevis** — tidsfördelning på plats, intervjuantal
   (med stratifiering: kön, migrantstatus, anställningstid),
   intervjuformatfördelning, tolkrelation, dokumentgranskning med
   urvalsstorlekar och innehållshashar, platsbesöksartefakter
   (med arbetares ansikten suddade), kända metodiska
   begränsningar.
5. **Åtagna korrigerande åtgärder** — per större-NC och per
   mindre-NC CAP med uttalad grundorsak, tidsfrist,
   verifieringsmekanism, eskaleringsåtaganden,
   icke-tyst-uppmjukning-åtagande.
6. **Revisorskvalifikationer och oberoende** — revisionsorganets
   ackreditering, kundkoncentration, ledande revisors
   kvalifikationer och språkkompetens, sektorerfarenhet,
   oberoendedeklarationer (revisor-leverantör, revisor-märke,
   certifieringsorgan-separation).
7. **Åtföljande utlämnanden och vägransregister** — intressekonflikter
   (explicit), tidigare revisionshistorik, kommunicerade
   arbetarröstkanaler, parallella utredningar,
   revisionsorganets interna avvikande mening, vägransregellista,
   vägranden faktiskt åberopade vid denna revision.
8. **Undertecknande principal** — revisionsorgan, ledande revisor,
   revisionsteam, godkännande tjänsteman, kryptografisk
   nyckelinformation.

Varje faktum slutar med konventionen för vägransgrindar: *"Detta
faktum hävdar endast X. Det hävdar inte Y"* (där Y är det närmaste
felmoden från avsnittet "GÖR INTE").

---

## Vad detta kit försvarar mot

- **Tyst uppmjukning efter undertecknande av större
  icke-överensstämmelser.** Varje ändring av FAKTUM 03 (t.ex. en
  MAJOR_NC omklassificerad till MINOR_NC, eller ett fynd helt
  borttaget) producerar ett annat SHA-256, en annan Merkle-rot,
  och misslyckas med OTS-verifiering.
- **Tillbakadatering av korrigerande åtgärdsstängningar.**
  FAKTUM 05 fryser CAP och dess tidsfrister vid undertecknande;
  varje "vi stängde det NC förra månaden"-påstående som
  konfliktar med de förseglade tidsfristerna är offentligt
  jämförbart.
- **Metodikrevisionism.** FAKTUM 04 fryser intervjuantal,
  dokumenturvalsstorlekar, och timmar på plats vid
  undertecknande — vilket förhindrar att den senare "vi gjorde
  en djup utredning"-försvarsmöjligheten är oförfalskbar.
- **Selektiv återpublicering som utelämnar ofördelaktiga fynd.**
  Alla 8 fakta är bundna av en enskild Merkle-rot; att citera
  vissa fakta medan andra utelämnas är upptäckbart från den
  publicerade bladlistan.
- **Drift i oberoendeanspråk.** FAKTUM 06 fryser
  oberoendedeklarationerna per undertecknandetillfället. Ett
  senare "denna revision var rigorös oberoende"-påstående måste
  hantera den förseglade kundkoncentrationsprocenten och det
  förseglade utlämnandet av märkesbetald beställning.
- **Radering av vägransregister.** FAKTUM 07 fryser vilka
  faktamönster kitet vägrade; varje senare "vi har aldrig vägrat
  något"-påstående motsäger det förseglade registret.

---

## Historiska eller nästan-historiska fall som kitet skulle ha hjälpt till med

Kitet skulle ha producerat en användbar **forensisk förankring** —
*ingen lösning eller prevention* — i fall som involverar:

- **Rana Plaza (Bangladesh, 2013).** Byggnadskollapsen i Rana Plaza
  dödade 1 134 klädesarbetare och skadade ~2 500. Flera märken
  vars produkter tillverkades i byggnaden hade reviderat Tier-1-
  leverantörer i byggnaden kort före kollapsen. Revisionerna
  använde sociala revisionschecklistor som inte inkluderade
  strukturingenjörsomfång. Ett förseglat metodikfaktum (FAKTUM
  04) vid var och en av dessa revisioner skulle ha gjort
  *omfångsgapet* offentligt synligt vid undertecknande — vilket
  förankrat den dokumenterade begränsningen som revisionsprogram
  retroaktivt påstod sig inte ha. Förseglingen skulle inte ha
  förhindrat kollapsen. Den skulle ha förhindrat att det
  efterkollaps-branschpåståendet att "ingen visste" skulle vara
  epistemiskt hållbart.

- **Apple / Foxconn-revisioner (2010-talet).** Flera iterationer
  av revisionsrapporter om Foxconn-anläggningar som producerar
  för Apple publicerades med varierande nivåer av fyndssvårighet,
  arbetarsjälvmordsklusterkontext, och åtgärdsanspråk. Ett
  förseglat undertecknande-ögonblicksregister för varje revision
  skulle ha förhindrat senare tvister om "vad revisionen sade vid
  tiden" från att vara beroende av arkivkopior, läckta kopior,
  eller reviderade officiella utgåvor.

- **Kobolt från DRC (pågående).** Hantverksmässig koboltbrytning
  i Demokratiska republiken Kongo, inklusive av barn, matar in i
  batterileveranskedjor för stora elektroniks- och EV-märken.
  Flera märkesbeställda revisioner under 2017–nutid har
  producerat fynd av varierande svårighet. Kitet tillämpat på
  varje revision vid undertecknande skulle ha förankrat den
  som-utfärdade revisionen; kitet tillämpat på åtföljande
  utlämnandefakta (FAKTUM 07 C2: tidigare revisionshistorik) skulle
  ha gjort varje efterföljande revisorns metodiska arv av
  tidigare gap offentligt synliga.

- **Konfliktmineraler (tenn, tantal, volfram, guld från DRC och
  Stora sjö-regionen).** Dodd-Frank §1502 producerade
  revisions- och utlämnandeförpliktelser under SEC-regeln 13p-1.
  Tvister om adekvansen av smältverksnivå-revisioner och
  nedströms vårdnadskedje-verifiering återkom under 2014–2022.
  Per-revisions MYRIAM-förseglingar skulle ha förankrat varje
  smältverksrevision vid undertecknande.

- **Märkesbeställda revisioner av Xinjiang-bomullsleveranskedjor
  (2018–nutid).** Tvister om huruvida revisioner tillförlitligt
  kunde genomföras under PRC-regeringens restriktioner på
  revisoråtkomst kom upp brett efter 2020. Ett förseglat
  metodikfaktum (FAKTUM 04) vid varje revision skulle ha
  förankrat vilka åtkomstvillkor som faktiskt gällde — vilket
  gjort senare "vi genomförde en rigorös revision"-påståenden
  jämförbara mot förseglade metodikbegränsningar vid tiden.

- **Foxconn-underentreprenörskap och Apples
  leverantörsansvarsrapporter på 2010-talet — återkommande
  upptäckter av minderåriga arbetare, dolda sovsalar,
  timmaröverträdelser.** Per-revisionsförseglingar skulle ha
  förankrat *negativa fynd* i revisioner som inte hittade något,
  vid sidan av *positiva fynd* i revisioner som hittade
  överträdelser — vilket förhindrat retrospektiv
  berättelseplockning från endera riktningen.

Kitet skulle INTE ha förhindrat något av dessa. I flera fall var
det underliggande problemet att revisionen *missade* missbruket —
att försegla en ren revision som borde ha hittat överträdelser
producerar ett permanent register av en misslyckad revision,
vilket är en annan typ av användbarhet (det förankrar
misslyckandet för senare ansvarsutkrävande) men inte detsamma som
prevention.

---

## När man bör använda detta kit

- Du är ett revisionsorgan som antar en "publicera vad vi
  undertecknat"-praxis som ett försvar mot uppmjukningspress efter
  undertecknande.
- Du är en NGO som kör en parallell leverantörskedjeutredning och
  vill ha en manipuleringsbevisande referenspunkt vid det
  ögonblick som din utredning avslutas.
- Du är en arbetarrättsorganisation som har erhållit en
  revisionsrapport och vill förankra dess aktuella innehåll innan
  revisionsorganet eller märket har en chans att revidera den.
- Du är ett märke som åtar sig transparens om revisioner du
  beställt, och du vill ha ett verifierbart forensiskt register.
- Du är en journalist, regulator eller domstol som förankrar en
  viss revisions innehåll vid ett specifikt ögonblick för senare
  rättstvist eller rapportering.

## När man INTE bör använda detta kit

- **Använd inte som ett substitut för arbetarledd övervakning,
  oberoende NGO-utredningar, eller arbetarorganisering.** Kitet
  är *additivt*, inte en ersättning för någon av dessa.
- **Använd inte för att hävda att en leverantör är
  överensstämmande.** En ren förseglad revision är på sin höjd
  en indata till en överensstämmelsebedömning. Att behandla en
  förseglad revision som ett överensstämmelsecertifikat är precis
  den legitimitetsteater som de begränsnings-första
  vägransreglerna existerar för att förhindra.
- **Använd inte mitt i en revision.** Att försegla före
  undertecknande skapar ett falskt-positivt "detta är den
  slutliga revisionsrapporten"-register.
- **Använd inte för att försegla ett utkast du tänker revidera.**
  Varje undertecknandeversion får sin egen försegling;
  revisioner refererar till original via Merkle-rot.
- **Använd inte under tryck att försegla tidigare än
  undertecknande, eller att utelämna ett åtföljande-faktas
  utlämnande.** Vägra, och (om din principal tillåter det)
  försegla vägran.
- **Använd inte som grund för ett "fair trade"- eller "etiskt
  inköp"-marknadsföringspåstående utan att utlämna de förseglade
  metodikbegränsningarna vid sidan av förseglingen.** Att citera
  förseglingen utan att citera begränsningarna är den
  legitimitetsteater-felmoden som definierar revisionskapning.
- **Använd inte om ditt revisionsorgan är strukturellt kapad och
  inte kan publicera fynd mot det beställande märkets
  kommersiella intresse.** I så fall producerar förseglingen ett
  permanent offentligt register av den kapade revisionen. Det kan
  fortfarande vara värdefullt — men det är inte detsamma som att
  försvara mot kapning.

---

## Hur du forkar detta kit för en riktig revision

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Kritisk timing:** försegla VID undertecknandeögonblicket — dvs.
när den ledande revisorn undertecknar slutrapporten och den blir
revisionsorganets officiella ställningstagande. En försegling före
undertecknande skapar ett falskt-positivt "detta är den slutliga
revisionen"-register. En försegling långt efter undertecknande är
forensiskt svagare mot mellanliggande modifieringar.

---

## Integration med befintlig leverantörskedje-revisions-infrastruktur

Kitet är utformat för att samverka med, inte ersätta:

- **SA8000 (Social Accountability International).** SA8000
  revisionsrapporter och CAP-dokument mappar naturligt till
  FAKTUM 03 + FAKTUM 05. SAAS-ackrediteringsreferens passar i
  FAKTUM 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** RBA:s revisionsfynd mappar till FAKTUM 03; RBA:s
  oberoenderegler för revisionsfirmor mappar till FAKTUM 06.
- **SMETA (Sedex Members Ethical Trade Audit).** SMETA:s
  2-pelar- och 4-pelar-revisionsfynd mappar till FAKTUM 03;
  Sedex-plattformen är värd för den råa rapporten — MYRIAM-
  förseglingen förankrar en innehållshash av den
  plattformsvärda rapporten.
- **amfori BSCI.** BSCI A–E-betygsmekanik mappar till FAKTUM 03
  certifieringsrekommendation; märkesmedlemskapsbeställning mappar
  till FAKTUM 06 kundkoncentrationsutlämnande och FAKTUM 07 C1.
- **FSC vårdnadskedja.** För skogsproduktleveranskedjor passar
  vårdnadskedjecertifikaten och återrevisionsschemana
  audit-fönster- och CAP-strukturen.
- **B Lab / B Corp impact assessment.** B Corp-certifiering är
  inte en tredjepartsrevision i SA8000-meningen, men impact
  assessment-verifierarrapporterna kan förseglas under detta
  kit (med fakta omfångsanpassade till impact-assessment snarare
  än arbetsrevision).
- **ISO 26000.** ISO 26000 är vägledning, inte certifierbar;
  kitet har ingen direkt ISO 26000 revisionsrapport-integration
  men den sociala-ansvarstaxonomin kan informera FAKTUM 03
  elementstrukturen för interna revisioner.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  andra bransch-sektorsregimer).** Sektorspecifika
  revisionsprogram kan förseglas under detta kit; FAKTUM 02
  revisionsstandardfält identifierar vilket.
- **Fair Labor Association.** FLA fabriksövervakningsrapporter
  mappar till FAKTUM 03 + FAKTUM 05; FLA:s oberoende-monitor-
  ramverk mappar till FAKTUM 06 oberoendedeklarationer.
- **Higg Index (Sustainable Apparel Coalition).** Anläggnings-
  nivå Higg FEM (Facility Environmental Module) och Higg FSLM
  (Facility Social & Labor Module) utdata kan förseglas under
  detta kit.
- **EU CSRD / CSDDD.** EU:s Corporate Sustainability Reporting
  Directive och Corporate Sustainability Due Diligence Directive
  skapar utlämnandeförpliktelser vars verifieringsdokument kan
  förseglas under detta kit. Kitet förankrar utlämnandet-som-
  utfärdat, inte dess materiella adekvans.

## Vad detta kit INTE ersätter

- Arbetarledd övervakning (den mest tillförlitliga
  missbruksdetekteringssignalen i någon leverantörskedja)
- Oberoende NGO-utredningar (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium, etc.)
- Regulatoriska inspektioner (nationella arbetsbyråer,
  OSHA-motsvarigheter, ILO Country Office-program)
- Arbetarorganisering och kollektivförhandling
- Rättstvist, skiljedom, och åtgärder under inhemsk arbetslag
- Märkesida due-diligence-ramverk (UNGP, OECD Due Diligence
  Guidance, EU CSDDD)

## Licens

Public domain (CC0). Forka det. Inget erkännande krävs.
