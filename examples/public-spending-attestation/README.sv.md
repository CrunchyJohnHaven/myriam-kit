*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Försegling av attestering av offentliga utgifter

Ett nyckelfärdigt myriam-kit-exempel för kommunala, regionala,
provinsiella och nationella myndigheter som vill kryptografiskt
förankra register över budgetexekvering (tilldelade kontrakt,
utbetalningar, godkända leveranser) vid utfärdandetillfället, så
att tysta retroaktiva ändringar av register över offentliga
utgifter blir offentligt upptäckbara.

Förseglingen är en **forensisk förankring**, inte en
integritetscertifiering. Den registrerar vad finansmyndigheten
rapporterade den dag den rapporterade det, i en form som inte
senare kan revideras tyst utan att producera en offentligt synlig
kryptografisk diskrepans.

---

## Vad detta kit INTE gör (läs först)

Förseglingen är en kryptografisk tidsstämpel av vad som
attesterades. Den kan inte verifiera huruvida det som
attesterades var **lagligt, rättvist eller hederligt**. Följande
felmoder ligger **utanför förseglingens domän**:

1. **Uppströms korruption och mutor.** Om en upphandling
   riggades, en leverantör valdes på grund av mutor, en motivering
   för enskild källa fabricerades, eller ett kontrakt blåstes upp
   med en överenskommen mutprocentsats — förankrar förseglingen
   den som-registrerade transaktionen med det uppblåsta priset och
   den gynnade leverantören med hög integritet. Förseglingen
   observerar finanssystemets utdata; den har ingen insyn i
   korruptionen uppströms utfärdandet. Brasiliens *Operação Lava
   Jato* dokumenterade systematiska ~3 % kartelladministrerade
   mutor över tusentals Petrobras-kontrakt som skulle ha
   förseglats vid utfärdandet som om de var helt rutinmässiga.

2. **Skalbolagsdöljande av verkligt huvudmannaskap.** Ett kontrakt
   tilldelat "Acme Construction Ltd." förseglas med entitetsnamnet
   från det offentliga registret. Om "Acme" i själva verket
   kontrolleras av en icke avslöjad politiskt exponerad person,
   eller är ett av dussintals skalbolag som kontrolleras av en
   enskild kartell, förankrar förseglingen ytenheten. Transparens
   kring verkligt huvudmannaskap är en SEPARAT regim (FATF
   Rekommendation 24, EU 5AMLD/6AMLD, US Corporate Transparency
   Act) vars utdata kräver sitt eget förseglingsprotokoll.

3. **Bokföringsbedrägeri uppströms utfärdandet.** Om
   finansmyndigheten själv fabricerar registret innan det
   förseglas — fantomkontrakt, spökanställda på lönelistan,
   fiktiva leveransgodkännanden — förankrar förseglingen
   fabriceringen. Förseglingen kan inte upptäcka att registret är
   falskt i det ögonblick det registreras; den kan endast upptäcka
   att registret har ändrats EFTER förseglingen.

4. **Selektiv publicering / körsbärsplockning.** En finansmyndighet
   skulle kunna publicera en *delmängd* transaktioner — de rena —
   och försegla endast dessa. Förseglingen förankrar det som finns
   i publiceringen; den förankrar inte det universum av
   transaktioner som borde ha varit i publiceringen. Detta kits
   FAKTUM 07 (åtföljande utlämnanden och vägransregister) är det
   strukturella försvaret, men det är beroende av att den
   utfärdande myndigheten är hederlig om vad den väljer att inte
   försegla.

5. **Utbokföring eller extrabudgetära utgifter.** Offentliga
   utgifter som dirigeras genom statligt ägda företag, statliga
   investeringsfonder, specialfonder eller extrabudgetära
   förvaltningskonton kan komma att inte synas i den budget som
   förseglingen förankrar. Förseglingen registrerar vad som
   rapporterades inom det budgetära systemet; utgifter utanför
   systemet ligger utanför förseglingens domän. Iraks Coalition
   Provisional Authority (CPA) tvister 2003–2004 omfattade
   ungefär 9 miljarder USD i kontantutbetalningar vars register
   delvis förlorades; försegling av de register som fanns vid
   utbetalningstillfället skulle ha förankrat dem, men skulle inte
   ha skapat register som CPA inte upprätthöll.

6. **Tryck för "förklaring" efter utfärdandet.** En förseglad
   överskridning, en förseglad enskild källa, eller en förseglad
   ändringsorder kan senare omberättas med vilken inramning som
   den politiska auktoriteten önskar. Förseglingen förankrar
   FAKTAN vid utfärdandedatumet, men förutbestämmer inte den
   berättelse som dessa fakta senare kommer att stödja.

7. **Tvångsmässig attestering.** Om den ansvariga
   finansprincipalen tvingas att underteckna en attestering som
   ger en felaktig bild av transaktioner, förankrar förseglingen
   den tvångsmässiga attesteringen med den tvångsmässiga
   signaturen. Förseglingen verifierar VEM som undertecknade
   (FAKTUM 08), inte VARFÖR de undertecknade. Att försegla en
   tvångsmässig attestering producerar ett permanent offentligt
   register över den tvångsmässiga utdatan — användbart för senare
   ansvarsutkrävande, men inte ett försvar mot tvång i ögonblicket.

8. **Jämförelse mellan jurisdiktioner.** En förseglad utgift kan
   endast läsas mot den rättsliga regimen i den utfärdande
   jurisdiktionen. "Varför betalade Kommun X Y för tjänst Z när
   Kommun W endast betalade V?" är en jämförande analysfråga
   nedströms förseglingen. Jämförelse mellan jurisdiktioner är en
   analytisk uppgift på förseglad data, inte en egenskap hos
   förseglingen.

**Avsnittet om hederliga gränser ovan är den bärande delen av
detta kit.** Finanstjänstemän och politiker som tror att
försegling är lika med integritet kommer att använda detta kit
som en sköld. Kitet måste säga rakt ut: detta är ett
*icke-förnekande-primitiv för utfärdandeögonblicket*, inte ett
bevis på utgiftsintegritet.

---

## Vad detta kit MÅSTE VÄGRA att försegla

Kitet är konfigurerat att avvisa följande faktamönster även om en
användare med giltig undertecknande befogenhet skickar in dem:

- **Individuella regeringsanställdas namn under
  principalundertecknarnivå.** Inget faktum får namnge enskilda
  upphandlingskontorsanställda, enskilda kassatjänstemän, enskilda
  poängsättningspanelmedlemmar, eller någon fysisk person som inte
  är i en offentligt ansvarig roll. Risken för utsatthet för
  vedergällning för linjepersonal överstiger transparensförmånen;
  deras identiteter förseglas i interna kontroller (FAKTUM 05 hash
  av godkännandeloggen), inte i attesteringens kropp.

- **Leverantörs-PII.** Inget faktum får inkludera leverantörens
  bankkontonummer, individuella leverantörsanställdas namn,
  leverantörshemadresser, fysiska personers skatteregistrerings-ID
  hos leverantören, interna prisuppdelningar som innehåller
  leverantörens kostnadsstruktur, eller något annat
  kommersiellt-PII-fält vars publicering skadar leverantörens
  intressen utan att tjäna anti-korruption. Sådan information kan
  HASHAS (FAKTUM 05) men inte publiceras.

- **Säkerhetsklassificerade utgifter.** Utgifter klassificerade
  under nationella säkerhetsstadgar är INTE berättigade till
  försegling under detta kit. Klassificerad hantering är ett annat
  problem med andra kryptografiska och rättsliga krav. Själva
  uteslutningen avslöjas i FAKTUM 07 R3 så att läsaren vet att
  publiceringen är ofullständig avsiktligt.

- **Civilrättslig verkställighet av skatteförpliktelser mot
  identifierade fysiska personer.** Även om verkställighetskostnader
  är offentliga utgifter, vägras namngivning av enskilda
  skattebetalare under verkställighet: integritetsskadan
  överstiger transparensförmånen, och parallell transparens finns
  under skatterättslig rapportering.

- **Transaktioner före utfärdandet.** Inget kontrakt före formell
  tilldelning; ingen utbetalning före formellt utfärdande. Att
  försegla ett utkast till kontrakt eller en väntande betalning
  som om den verkställdes skapar falsk visshet.

- **Försegling av någon annan än den ansvariga
  finansprincipalen.** En entreprenör, leverantör, kommunfullmäktig,
  journalist eller observatör kan inte försegla "registret över
  offentliga utgifter" i stället för den finansmyndighet som
  utfärdade det. (De kan försegla sina egna observationer under
  sin egen principal, i en separat publicering.)

- **Inramning "fri från korruption".** Kitet vägrar att försegla
  någon inramning av formen "denna utgift var laglig och fri från
  korruption" eller "upphandlingen var bevisligen rättvis". Sådana
  påståenden ligger epistemiskt bortom kitets domän.

- **Publiceringar som utelämnar FAKTUM 07 åtföljande
  utlämnanden.** En publicering av transaktioner utan det
  åtföljande utlämnande- och vägransregistret är inte en legitim
  MYRIAM-publicering under detta kit.

En vägran själv kan förseglas som ett faktum ("Denna part begärde
försegling av X; kitet vägrade enligt vägransregel Y"), vilket
skapar ett offentligt register över försök till missbruk. I en
domän där politiskt tryck på finanstjänstemän är dokumenterat är
ett register över *vägrade* förfrågningar i sig en integritetssignal.

---

## Vad detta kit förseglar

8 fakta vid attesteringstillfället för budgetexekvering:

1. **Exempelmeddelande** — förklarar publiceringen som ett exempel
   (riktiga attesteringar tar bort eller ersätter detta).
2. **Jurisdiktion och rättslig grund** — vilken regeringsentitet
   som utfärdar, under vilken författningsenlig befogenhet, under
   vilken räkenskapsperiod.
3. **Anslagsreferens eller budgetreferens** — de specifika rader i
   den antagna budgeten som verkställs, med hashar av
   budgetinstrumentet och eventuella ändringar / överföringar /
   omfördelningar som tillämpats.
4. **Kontrakts- eller utbetalningsmanifest** — per-transaktions-
   register: belopp, leverantörens juridiska entitetsnamn (inget
   individuellt PII), syfte, datum, upphandlingstyp,
   tilldelningsgrund, hash av kontraktsdokumentet.
5. **Hashar av styrkande dokument** — SHA-256 av anbudsinfordringar,
   utvärderingar, undertecknade kontrakt, ändringsorder,
   betalningsansökningar, leveransgodkännandeformulär,
   skattmästarbokposter, kontrollavsigneringsloggar. Endast
   hashar, inte innehåll — för att skydda kommersiellt och
   personligt PII samtidigt som omhashverifiering möjliggörs.
6. **Revisions- och tillsynsstatus** — vilket
   generalinspektörsorgan som har jurisdiktion, vilket högsta
   revisionsorgan, vilket åklagarorgan som har jurisdiktion över
   korruptionsbrott, revisionsfrister, aktuell status för
   eventuella pågående granskningar.
7. **Åtföljande utlämnanden och vägransregister** — väntande
   upphandlingsprotester, väntande interna utredningar, utestående
   offentlighetsförfrågningar, avvikande granskningar, kända
   budgetradsöverskridningar; explicit lista över mönster som
   kitet vägrade att försegla.
8. **Undertecknande principal** — ansvarig finanstjänsteman + roll
   + författningsenligt ansvar + medsignerare under dubbel
   kontroll; vad varje signerare personligen attesterar och inte.

Varje faktum slutar med konventionen för vägransgrindar: *"Detta
faktum hävdar endast X. Det hävdar inte Y"* (där Y är det närmaste
felmoden från avsnittet "GÖR INTE").

---

## Vad detta kit försvarar mot

- **Tyst revidering av kontraktsbelopp efter utfärdande.** Varje
  ändring av något belopp i FAKTUM 04 producerar ett annat
  SHA-256, en annan Merkle-rot, och misslyckas med OTS-verifiering.
- **Tyst leverantörsbyte.** Att ersätta "Leverantör A" med
  "Leverantör B" på ett redan utfärdat kontrakt är upptäckbart
  från de förseglade bytena.
- **Tillbakadatering av ändringsorder.** FAKTUM 04 fryser
  ändringsorderns datum och motivering vid utfärdandet; varje
  senare påstående om "detta var alltid det överenskomna omfånget"
  måste hantera det förseglade ändringsorderregistret.
- **Tyst försvinnande av ofördelaktiga transaktioner.** Alla
  transaktioner som utfärdats under perioden finns i FAKTUM 04
  under en Merkle-rot. Att publicera en delmängd är upptäckbart
  från listan över bladhashar.
- **Undertryckande av åtföljande utlämnanden.** FAKTUM 07 fryser
  status för väntande protest, väntande utredning och utestående
  FOI vid attesteringstillfället. Varje senare påstående om "vi
  har aldrig hört talas om den protesten" är offentligt
  jämförbart.
- **Drift i revisionsjurisdiktion.** FAKTUM 06 fryser vilka organ
  som har tillsynsjurisdiktion över de förseglade transaktionerna.
  Ett senare påstående om att en viss generalinspektör "inte hade
  befogenhet" måste hantera det förseglade jurisdiktionsregistret.
- **Radering av vägransregister.** FAKTUM 07 registrerar vad
  kitet vägrade att försegla; varje senare påstående om "vi har
  aldrig vägrat något" motsäger det förseglade registret.

---

## Historiska fall som kitet skulle ha hjälpt till med

Kitet skulle ha producerat en användbar **forensisk förankring** —
*ingen lösning, ingen prevention, inget substitut för
brottmålsåtal* — i offentligt dokumenterade fall som involverade
tyst retroaktiv modifiering av register över offentliga utgifter:

- **Brasilien — *Operação Lava Jato* / Petrobras-linjen
  (2014–2021).** Brasilianska federala åklagare dokumenterade en
  kartell av stora byggföretag som under mer än ett decennium
  betalade mutor på i genomsnitt ~3 % på Petrobras- och andra
  federala infrastrukturkontrakt, där mutorna dirigerades till
  politiker och till kartellens egen priskoordinering. Kontrakten
  såg som-utfärdade rutinmässiga ut; korruptionen var uppströms
  utfärdandet. Ett förseglingskit skulle INTE ha förhindrat Lava
  Jato (mutorna var inbäddade i priset INNAN kontraktet nådde
  förseglingen), men skulle ha förankrat kontraktsvillkoren vid
  utfärdandet — vilket skulle ha gjort den senare forensiska
  rekonstruktionen av "vad varje kontrakt faktiskt sa när det
  undertecknades" enormt billigare. Lava Jatos utredningskostnad
  var till stor del kostnaden för att återskapa tidslinjer från
  inkonsekventa arkiverade register.

- **Europeiska unionen — tvister om regionala utvecklingsfonder
  (flera medlemsstater, 2010-tal–2020-tal).** Europeiska
  revisionsrättens årsrapporter har upprepade gånger identifierat
  väsentliga felprocenter i utgifter inom europeiska struktur- och
  investeringsfonder (ESIF) och sammanhållningsfond, som vissa år
  överskridit väsentlighetströskeln. Tvister om "vad som faktiskt
  begärdes" kontra "vad som faktiskt levererades" återkommer
  eftersom anspråksdokumentation kan revideras mellan inlämning
  och revision. Per-utfärdande MYRIAM-försegling av anspråket-
  som-inlämnat skulle ha förankrat innehållet i varje anspråk vid
  inlämningen, vilket skiljer "vad mottagaren hävdade vid den
  tiden" från "vad efterrevisionens rekonstruktion kom fram till".

- **Irak — Coalition Provisional Authority (CPA) utbetalningar,
  2003–2004.** CPA betalade ut ungefär 9 miljarder USD i kontanter
  från Development Fund for Iraq med dokumentation som Special
  Inspector General for Iraq Reconstruction (SIGIR) och senare
  revisionsrapporter karakteriserade som väsentligt ofullständig.
  Tvister om utbetalningsregister kvarstår två decennier senare.
  Försegling vid utbetalningstillfället skulle inte ha skapat
  register som CPA inte upprätthöll — men där något register
  existerade (handskrivna huvudböcker, daterade
  överföringsauktorisationer), skulle en samtida försegling ha
  förankrat registrets byte-mässiga tillstånd vid utfärdandet,
  vilket skiljer "registret vid den tiden" från "registret som
  senare rekonstruerades".

- **Grekland — statsskuld och revideringar av offentliga
  utgiftsrapporter (2009–2010).** Eurostat-revisioner 2009–2010
  dokumenterade betydande revideringar av tidigare rapporterade
  grekiska finansdata, där metodiken för revideringen själv var
  omtvistad. Försegling av kvartalsvisa utgiftsrapporter vid
  ursprungspubliceringen skulle ha gjort *deltat* mellan
  ursprungliga och reviderade rapporter offentligt jämförbart
  snarare än rekonstruerbart endast genom arkivjämförelse.
  Förseglingen skulle inte ha förhindrat den underliggande
  metodologiska tvisten, men skulle ha förankrat varje rapporterat
  kvartal vid ursprungsrapporteringstillfället.

- **Storbritannien — pandemiupphandling (2020–2022).** UK
  National Audit Office och parlamentariska kommittéer
  identifierade upphandlingsprocesser under 2020–2021 där kontrakt
  tilldelades under nödbestämmelser med minskad konkurrens och
  minskad dokumentation; vissa tilldelningar modifierades, ställdes
  in eller reglerades senare. Per-utfärdande försegling av varje
  nödupphandlingstilldelning skulle ha förankrat
  tilldelningsmotivering och villkor vid tilldelningstillfället,
  vilket gjort senare modifieringar till ett offentligt synligt
  delta snarare än ett tyst modifierat register.

- **Sydafrika — kontrakt vid statligt ägda företag under
  state-capture-eran (~2010–2018).** Zondo-kommissionen
  dokumenterade kontrakt vid flera statligt ägda företag (Eskom,
  Transnet, Denel) vars dokumentation var olika ofullständig,
  reviderad eller omtvistad. Försegling av varje
  kontraktstilldelning vid utfärdandet skulle ha förankrat det
  som-tilldelade tillståndet av registret, vilket skiljer senare
  forensisk rekonstruktionsutdata från det samtida registret.

Kitet skulle INTE ha förhindrat den underliggande korruptionen i
något av ovanstående fall. I flera fall var det underliggande
problemet att korruptionen var *uppströms utfärdandet* —
förseglingen förankrar det korrupta kontraktet med hög integritet,
vilket är en annan typ av användbarhet (forensisk förankring för
senare ansvarsutkrävande) men inte detsamma som prevention. I
andra fall (CPA-kontanter, utbudgetära utgifter) var det
underliggande problemet att de register som skulle förseglas inte
existerade eller inte upprätthölls — kitet kan inte skapa register
som myndigheten inte producerade.

Dessa historiska fall namnges endast med hänvisning till
offentligt dokumenterade fynd (domstolsregister, parlamentariska
kommittérapporter, publikationer från revisionsorgan). Inget
påstående görs om någon enskild individ; de dokumenterade
institutionella fynden står på det offentliga registret.

---

## När man bör använda detta kit

- Din jurisdiktion har en etablerad process för
  budgetexekveringsrapportering och vill lägga till en
  oföränderlig offentlig förankring.
- Du förväntar dig granskning efter utfärdande (FOI-förfrågningar,
  revision, civilsamhällesövervakning, journalistisk utredning)
  och vill ha en manipuleringsbevisande referenspunkt.
- Du har rättslig befogenhet under transparens- /
  offentlighetsstadgar att publicera den listade faktauppsättningen,
  med integritets-/säkerhetsundantagen respekterade.
- Du verkar under en författningsenlig revisionsregim
  (generalinspektör, högsta revisionsorgan) och vill förankra
  varje kvartalsavslut innan revisionscykeln når det.
- Du publicerar under Open Contracting Data Standard eller IATI
  och vill ha ett kryptografiskt komplement till portalbaserad
  publicering.

## När man INTE bör använda detta kit

- **Använd inte som ett substitut för författningsenlig revision,
  generalinspektörsgranskning, åklagarutredning eller
  civilsamhällesövervakning.** Kitet är *additivt*, inte en
  ersättning.
- **Använd inte som ett legitimitetscertifikat.** Ett förseglat
  utgiftsregister är inte ett korruptionsfritt certifikat. Att
  behandla det som ett sådant är precis den felmod som kitets
  begränsnings-först-struktur existerar för att förhindra.
- **Använd inte mitt i en period.** Kitet är för det formella
  utfärdandetillfället (kvartalsavslut, kontraktstilldelning,
  milstolpsutbetalning). Periodmellanförseglingar skapar
  vilseledande referenspunkter.
- **Använd inte för att hävda att utgiften var laglig, rättvis
  eller icke-korrupt** — kitet kan inte göra det.
- **Använd inte för att försegla klassificerade utgifter,
  individuellt anställdas PII eller leverantörens kommersiella
  PII.** Kitet vägrar dessa mönster; försök att göra det skapar
  ett vägransregister (FAKTUM 07).
- **Använd inte för att försegla utkast före utfärdande.** Utkast
  kan förseglas under en annan attesteringstyp ("utkast för
  kommentar, inte utfärdat"), men inte under detta kits
  utfärdandetyp.
- **Använd inte under tryck att utelämna FAKTUM 07-utlämnanden.**
  Vägra, och försegla vägran.
- **Använd inte om din finansmyndighet är kapad.** En förseglad
  bedräglig utgift är ett permanent offentligt register av
  bedrägeriet, inte ett försvar av det. Primitiven skär åt båda
  håll; det är dess hederlighet.

---

## Hur du forkar detta kit för en riktig attestering

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Kritisk timing:** försegla VID det formella utfärdandetillfället
— dvs. ögonblicket då den ansvariga finansprincipalen
undertecknar kvartalsavslutet, ögonblicket då ett kontrakt
formellt tilldelas, eller ögonblicket då en utbetalning formellt
utfärdas. En försegling före det formella utfärdandet skapar en
falskt-positiv "detta är det officiella registret"-referens. En
försegling långt efter det formella utfärdandet är forensiskt
svagare mot mellanliggande modifieringar.

**Kadens:** kitet är utformat för kvartalsvisa attesteringar som
standard. Subkvartalsvisa kadenser (månadsavslut, per-transaktion
försegling) stöds genom omkörning med lämpligt omfång; försegling
av en enskild högvärdes-transaktion är en legitim användning.

---

## Integration med befintlig offentlig-finans-infrastruktur

Kitet är utformat för att samverka med, inte ersätta:

- **Open Contracting Data Standard (OCDS) v1.1.5.** De fem
  publiceringspunkterna (planering, anbud, tilldelning, kontrakt,
  genomförande) mappar naturligt till FAKTUM 03 (planering →
  anslag), FAKTUM 04 (anbud, tilldelning, kontrakt, genomförande →
  transaktionsmanifest), och FAKTUM 05 (hashar av styrkande
  dokument). OCDS JSON-exporten själv förseglas i FAKTUM 05
  (kontrolldokument). En jurisdiktion som kör OCDS-publicering
  kan lägga till MYRIAM-försegling som ett kryptografiskt lager
  ovanpå sin befintliga portal.

- **International Aid Transparency Initiative (IATI) standard
  v2.03.** För utgifter som finansieras helt eller delvis av
  externt bistånd kan IATI XML förseglas som ett kontrolldokument;
  förseglingen ger ett kryptografiskt komplement till IATI
  Registry:s HTTP-baserade publiceringsmodell.

- **Open Government Partnership (OGP) åtaganden.** OGP:s
  nationella handlingsplaner inkluderar ofta åtaganden om
  finanstransparens; MYRIAM-försegling operationaliserar ett
  "manipuleringsbevisande publicering"-åtagande på ett sätt som
  oberoende kan verifieras av civilsamhället utan att kräva
  förtroende för regeringens portal.

- **OECD-rekommendationen om offentlig integritet (2017).** Kitet
  stöder Rekommendation 4 (öppna regeringsdata om offentlig finans
  i maskinläsbar, snabb form) genom att göra data kryptografiskt
  förankrade såväl som maskinläsbara.

- **FN:s konvention mot korruption (UNCAC), särskilt artiklarna 9
  (upphandling) och 13 (samhällsdeltagande).** Kitet
  tillhandahåller ett forensiskt primitiv som stöder
  transparensförpliktelserna i artikel 9 och civilsamhällets
  övervakning enligt artikel 13.

- **Högsta revisionsorgan (SAI:er) — INTOSAI-ramverket.** SAI:er
  som verkar under INTOSAI-standarderna (ISSAI) kan konsumera
  förseglade publiceringar som bevis med hög integritet;
  SHA-256-hasharna i FAKTUM 05 är samma hashar som SAI:s
  e-revisionsverktyg kan räkna om.

- **Generalinspektörskontor.** Inhemska GI-kontor med jurisdiktion
  över de förseglade utgifterna (FAKTUM 06) kan stämma in
  dokumentkroppar vars hashar är förseglade i FAKTUM 05;
  förseglingen binder de dokumentkroppar som mottas under stämning
  till de kroppar som existerade vid utfärdandet.

- **Offentlighets- och allmänna handlingar-stadgar.** Förseglingen
  undantar inte den utfärdande myndigheten från fortsatta
  FOI-förpliktelser; i själva verket gör den selektivt FOI-svar
  upptäckbart som en avvikelse från det förseglade registret.
  FAKTUM 07 C3 förankrar utestående FOI-förfrågningar vid
  attesteringstillfället.

- **Register över verkligt huvudmannaskap (FATF Rekommendation
  24, EU AML-direktiv, US Corporate Transparency Act).** Data om
  verkligt huvudmannaskap förseglas INTE under detta kit (FAKTUM
  04 hämtar leverantörsidentitet endast från registrerat juridiskt
  entitetsnamn). Utlämnande av verkligt huvudmannaskap är en
  separat förseglingsregim som kan producera en parallell
  publicering refererad via Merkle-rot.

- **Domstolsadministrerad transparens (rättsväsendets utgifts-
  rapportering, tillgångsåterställningsförfaranden).** Resultat
  från korruptionsrelaterade rättsförfaranden ligger inte inom
  detta kits omfång men kan förseglas under parallella
  attesteringstyper.

## Vad detta kit INTE ersätter

- Författningsenlig budgetexekveringsrevision av
  generalinspektörsorgan
- Granskning av högsta revisionsorgan (GAO, NAO, TCU, CAG, AGN,
  BRH, Cour des comptes, motsvarande)
- Åklagarutredning av korruptionsbrott (nationella
  antikorruptionsåklagare, UNCAC artikel 36-organ)
- Civilsamhällets och journalistisk undersökande rapportering
- Whistleblower-kanaler och skyddade utlämnanderegimer
- Utlämnande av verkligt huvudmannaskap
- Internationell peer review (OECD, IMF Fiscal Transparency
  Evaluation, EU-terminen, IATI-registret)
- Domstolsadministrerade tillgångsåterställningsförfaranden

Förseglingen är ett forensiskt primitiv som sänker kostnaden och
ökar tillförlitligheten för alla ovanstående. Den är inte, och kan
inte vara, en ersättning för någon av dem.

---

## Licens

Public domain (CC0). Forka det. Inget erkännande krävs.
