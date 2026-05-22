*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Sigillkit för koldioxidattestering

Ett nyckelfärdigt myriam-kit-exempel för utvecklare av koldioxidprojekt, tredjepartsverifierare och register som vill publicera ett Bitcoin-förankrat, manipuleringssäkert sigill av en utfärdandehändelse för koldioxidkrediter, en avlägsnandeverifiering eller en utsläppsattestering vid det exakta certifieringsögonblicket — så att tysta efterföljande modifieringar blir offentligt upptäckbara.

---

## Vad detta kit INTE gör (läs först)

Koldioxidkrediter är politiskt och vetenskapligt omtvistade. Sigillet är en kryptografisk tidsstämpel av vad som attesterades. Det kan inte verifiera om det som attesterades återspeglar verklig klimatnytta. Följande felsätt ligger **utanför sigillets domän**, och de står för de flesta meningsfulla integritetsfrågor om koldioxidkrediter:

1. **Additionalitet.** Sigillet kan inte verifiera att den krediterade aktiviteten inte skulle ha skett utan koldioxidfinansiering. Det kontrafaktiska är i princip oobserverbart. Sigillet registrerar metodikens additionalitetsargument; det avgör det inte.

2. **Permanens.** Sigillet kan inte verifiera att lagrad koldioxid förblir lagrad över den relevanta tidshorisonten (decennier till århundraden för skogskoldioxid, geologiska tidsskalor för vissa avlägsnanden). Nyligen publicerad litteratur (Badgley et al. 2022, Patterson et al. 2022) visar att buffertpooler har tömts substantiellt av verkliga reverseringshändelser. En sigillerad kredit är ett sigillerat *påstående* om permanens under specificerade buffertpool-antaganden, inte bevis på permanens.

3. **Läckage.** Sigillet kan inte verifiera att undvikna utsläpp i projektområdet inte helt enkelt förskjuts till ett icke-projektområde. Metodikstandardavdrag för läckage är regulatoriska platshållare, inte mätningar. Sigillet förankrar det tillämpade avdraget; det certifierar inte att det är korrekt.

4. **Sidonyttor.** Sigillet kan inte verifiera påståenden om samhällsutveckling eller biologisk mångfald. Sidonyttor är vanligtvis självhävdade och verifierar-granskade, inte reviderade på samma djup som koldioxidkvantifiering. Sigillet förankrar dokumenthasharna; inget mer.

5. **Tillräcklig fritt, förhand och informerat samtycke (FPIC).** Ursprungs- och samhällssamtycke i koldioxidprojekt har en dokumenterad historia av felsätt (tvingat samtycke, samtycke från icke-representativa organ, efterhandskonstruerat "samtycke" genom kompensation). Sigillet förankrar FPIC-dokumentation och klagomålsloggshashar; det kan inte certifiera att samtyckesprocessen var äkta.

6. **Verifierarens oberoende.** Verifierare betalas av projektutvecklare. Detta är en strukturell intressekonflikt som inget ackrediteringssystem har löst. Sigillet förankrar verifierarens oberoendedeklaration; det certifierar inte att deklarationen är sann.

7. **Dubbelräkning över register eller med nationella inventarier.** Sigillet förankrar registertillståndsögonblicksbilden vid attesteringstidpunkten. Om samma aktivitet också räknas av ett värdland mot dess NDC, eller också hävdas på ett annat register, gör sigillet registertillståndet jämförbart men förhindrar inte dubbelräkningen.

8. **Riktighet i köparens påstående.** En köpare som drar tillbaka en sigillerad kredit för att stödja ett påstående om "nettonoll" eller "koldioxidneutral" gör ett nedströms påstående som sigillet inte täcker. Sigillet registrerar tillbakadragandet; giltigheten av köparens marknadsföringspåstående är en separat, nedströms fråga.

9. **Metodikens riktighet.** Sigillet registrerar metodikciteringen + dokumenthashen som gällde vid attesteringstidpunkten. Det hävdar inte att metodiken är vetenskapligt giltig. Metodikreform sker; sigillering under en metodik som senare revideras gör inte krediterna "felaktiga" eller "korrekta" retroaktivt — det förankrar vilka regler som gällde vid utfärdandet.

**Avsnittet om ärliga gränser ovan är den bärande delen av detta kit.** Nästan varje meningsfull integritetsfråga om en koldioxidkredit lever i en av dessa nio fållor. Sigillet stänger det smala kvarvarande gapet: tyst retroaktiv modifiering av bytes-i-register. Det gapet är verkligt och värt att stänga, men det är litet i förhållande till det omtvistade territoriet.

---

## Vad detta kit MÅSTE VÄGRA att sigillera

Kitet är konfigurerat att avvisa följande faktamönster även om en användare med giltig signeringsbehörighet skickar in dem:

- **"Additionalitet" angiven som faktum.** Att sigillera additionalitet som faktum skapar en vilseledande post. Kitet accepterar metodikkompatibla additionalitets*argument*, inte additionalitets*påståenden*.
- **"Permanens" utan uttrycklig tidshorisont- och buffertpool-redovisning.** Att sigillera permanens utan dessa parametrar fördunklar vad projektet faktiskt åtar sig.
- **"Ingen läckage" utan projektspecifik mätning.** Metodikstandardavdrag för läckage är inte mätning och sigillet kommer inte att behandla dem som sådana.
- **Kvantifieringar genererade innan tredjepartsverifiering är klar.** Ett pre-verifierings-sigill skapar en falsk-positiv "verifierad" post.
- **Utfärdandeposter för krediter som också utfärdas på ett annat register utan uttrycklig korsregisterredovisning** i FACT 06.
- **Tillbakadragandeposter som inte namnger tillbakadragandets förmånstagare.** Anonymt tillbakadragande underminerar tillbakadragandets allmännyttiga funktion; kitet vägrar att möjliggöra det.
- **FPIC-påståenden som inte stöds av attesterbar dokumentationshasharar.**
- **Artikel 6.2 / 6.4-utfärdande utan en värdlandsauktorisationsskrivelse (LoA)-hash** sigillerad i FACT 06.
- **Sigillering på begäran av någon annan part än projektutvecklaren + verifieraren gemensamt** för det projektet.
- **Sidonytte-påståenden sigillerade som "certifierade"** när de bara är "självhävdade och verifierar-granskade."

En vägran själv kan sigilleras som ett faktum ("Denna part begärde sigillering av X; kitet vägrade enligt vägransregel Y"), vilket skapar en offentlig post över försökt missbruk.

---

## Vad detta kit GÖR sigillerar

8 fakta vid attesteringsögonblicket:

1. **Exempelmeddelande** — förklarar publikationen som ett exempel (verkliga attesteringar tar bort eller ersätter detta).
2. **Projektidentifiering** — projektnamn, register, projekt-ID i registret, metodikcitering + hash, geografisk gränshash, vintage, projektutvecklare, sidonytte-påstående, FPIC-status.
3. **Utsläpps- eller avlägsnandekvantifiering** — brutto ton CO2e, baslinje kontrafaktisk, läckageavdrag, buffertpoolbidrag, osäkerhetsavdrag, nettokrediterbart påstående, hashar för varje numerisk indata.
4. **Mätmetodik** — fjärranalysdatakällor, marknätverk för markverifiering, instrumentkalibreringslogghash, klassificerarmodellhash + noggrannhetsstatistik, koldioxidtäthetsmodell, kodprovenance + reproducerbarhetsmanifest.
5. **Tredjepartsverifiering** — verifierarorganisation, ackreditering, oberoendedeklarationshash, tidigare engagemang med utvecklare, platsbesöksbildarkivhash, väckta + lösta fynd, verifieringsutlåtandedokumenthash.
6. **Utfärdande- eller tillbakadragandepost** — utfärdandebegäran + godkännande, totalt utfärdade krediter, serieintervall, korsregister-deklaration, värdlands-LoA-hash där tillämpligt, tillbakadragandets serieintervall + förmånstagare (för tillbakadragandeattesteringar), registertillståndsögonblicksbildhashar.
7. **Tillhörande redovisningar och vägransregister** — pågående metodiktvister, icke-permanensrisk, läckageförbehåll, additionalitetsförbehåll, FPIC- + klagomålslogghashar, sidonytte-förbehåll, tidigare verifierar-engagemang; uttrycklig lista över mönster som kitet vägrade att sigillera.
8. **Signerande huvudman** — projektutvecklare + verifierare + register, var och en med roll + omfattning av attestering + kryptografisk nyckelinformation.

Varje faktum slutar med vägranporten-konventionen: *"Detta faktum hävdar endast X. Det hävdar inte Y"* (där Y är det närmaste felsättet från avsnittet "GÖR INTE" ovan).

---

## Vad detta kit försvarar mot

- **Tyst efterutfärdande modifiering av kvantifiering.** Varje heltalsändring i FACT 03 producerar en annan SHA-256, annan Merkle-rot, misslyckas i OTS-verifiering.
- **Tyst metodikersättning.** FACT 02 fryser metodikciteringen + dokumenthashen vid utfärdandet. En registerutbyte av en annan metodikversion efter utfärdandet är offentligt jämförbar.
- **Tyst baslinjerevidering.** FACT 03:s baslinjescenarios modellutdatahash är sigillerad. En efterhand baslinjeomställning för att producera fler krediter är upptäckbar.
- **Tyst verifierarutlåtande-ersättning.** FACT 05:s utlåtandedokumenthash är sigillerad. En efterutfärdande "verifieraren sa alltid X"-omskrivning är upptäckbar.
- **Tyst tillbakadragandepost-försvinnande.** FACT 06:s registertillståndsögonblicksbild är sigillerad. Krediter som mystiskt blir "tillgängliga" igen efter att ha markerats som tillbakadragna är upptäckbara mot sigillet.
- **Tyst FPIC-dokumentersättning.** FACT 07:s FPIC- + klagomålslogghashar är sigillerade. Ersättningssamtyckesdokument är upptäckbara.
- **Tyst borttagning av obekväma redovisningar.** FACT 07-statuset för tillhörande redovisningar är sigillerat. Tyst radering av en icke-permanensförbehåll från en projektbeskrivningssida är upptäckbar mot de sigillerade byten.

Kitet försvarar INTE mot de underliggande integritetsfrågorna (additionalitet, permanens, läckage, FPIC-tillräcklighet, verifierarens oberoende, metodikvaliditet). Det är de svårare problemen och sigillet kan inte lösa dem.

---

## Historiska eller nästan-historiska fall där kitet skulle ha hjälpt

Kitet skulle ha producerat en användbar förankring — *inte en lösning* — i fall som involverar tyst retroaktiv modifiering av koldioxidattesteringsposter. Det skulle INTE ha löst de underliggande omtvistade frågorna i något av dessa fall.

- **Guardian / Die Zeit / SourceMaterial-undersökningen 2023 av Verras regnskogskrediter.** Utredare fann att de flesta studerade REDD+-projekten producerade krediter vars hävdade undvikna utsläpp inte stämde överens med senare fjärranalysåterananalys. Undersökningen krävde rekonstruktion av projektdokumentation mot retroaktivt modifierade registerposter. En sigillerad publikation vid varje utfärdandecykel skulle ha tillhandahållit otvetydiga referensbytes för vad som attesterades vid varje cykel — inte en lösning på det underliggande baslinjeproblemet, utan en ren forensisk tidslinje.

- **2020 års reverseringshändelser för Kaliforniens skogsoffset.** Flera skogskoldioxidprojekt under Kaliforniens efterlevnadsmarknad upplevde skogsbrandsreverseringar som översteg den buffertpool-reserv som avsatts för dem. Att rekonstruera vad varje projekt hade attesterat om icke-permanensrisk *vid utfärdandet* (vs. vad projektet senare hävdade att det hade attesterat) är för närvarande svårt. Sigill per vintage skulle ha gjort pre-brand-attesteringar kanoniskt hämtningsbara.

- **Olika REDD+-projekt där referensregion-baslinje-metodiker retroaktivt kritiserades som inflaterade.** En sigillerad metodikdokumenthash vid utfärdandetidpunkten skulle ha förankrat vilken metodikversion som faktiskt tillämpades på vilken vintage, vilket gör "metodiken var alltid X"-försvaret jämförbart.

- **Flera tvister kring australiska Carbon Credit Unit (ACCU)-projekt för människoinducerad regenerering (2022–2023).** Akademisk kritik av huruvida regenerering faktiskt var projektinducerad vs. naturligt återgådd reducerade till tvister om vad projektet ursprungligen hade hävdat. Sigillerade attesteringar skulle ha tillhandahållit otvetydiga vintage-poster.

- **Koldioxid-offset-tillbakadragandeposter som har skiftat status.** Flera dokumenterade fall av tillbakadragandeposter på frivilliga marknadsregister som tycks ändra status efter tillbakadragandet (blir "tillbakadragna" av en annan anledning, eller tillskrivs en annan förmånstagare i efterhand). Sigill per tillbakadragande skulle ha förankrat statusen vid ögonblicket för det ursprungliga tillbakadragandet.

I inget av dessa fall skulle kitet ha löst om den underliggande krediten representerade verklig klimatnytta. Kitet förankrar poster; det är allt det gör.

---

## När detta kit ska användas

- Du är en projektutvecklare som vill publicera en manipuleringssäker attestering tillsammans med din standardregistreringsansökan.
- Du är en tredjepartsverifierare som vill att ditt verifieringsutlåtande ska vara offentligt verifierbart mot ett registers senare framställning av "vad verifieraren sa."
- Du är ett register som vill tillhandahålla ett ytterligare integritetslager på utfärdande- och tillbakadragandeposter — särskilt för projekt i jurisdiktioner med svagare rättsstatsbackstops för registerintegritet.
- Du är en journalist, akademiker eller NGO som driver en flerårig longitudinell analys av koldioxidprojekt och behöver en offentlig förankring för att jämföra ett projekts senare framställningar mot dess utfärdandetidsbytes.
- Du är en köpare (företags nettonoll, flygbolagsefterlevnad) som vill att de krediter du drar tillbaka ska dras tillbaka mot offentligt förankrade poster, så att ditt nedströms marknadsföringspåstående kan revideras mot en stabil forensisk tidslinje.

## När detta kit INTE ska användas

- **Använd inte som ersättning för ackrediterad tredjepartsverifiering.** Sigillet ersätter inte ISO 14064-3-verifiering; det komponerar med den.
- **Använd inte för att hävda att ett projekt är "additionellt," "permanent," eller "låg-läckage."** Sigillet kan inte verifiera dessa egenskaper. Att använda sigillet för att hävda dem är missbruk.
- **Använd inte som legitimitetsteater för krediter av låg kvalitet.** Ett kryptografiskt sigill på en lågkvalitetskredit är en permanent forensisk post över den dåliga kvaliteten, inte ett försvar av den. Primitiven skär åt båda hållen; det är dess ärlighet.
- **Använd inte för att sigillera krediter som också räknas av ett värdland mot dess NDC** utan uttrycklig motsvarande-justering-redovisning i FACT 06.
- **Sigillera inte före verifiering.** Ett sigill innan verifierarens utlåtande är slutgiltigt skapar en falsk-positiv "verifierad" post.
- **Använd inte under press att utelämna en tillhörande faktumredovisning i FACT 07** (pågående metodiktvister, FPIC-frågor, tidigare verifierar-engagemang). Vägra, och sigillera vägran.
- **Använd inte som ett marknadsföringsmärke.** "MYRIAM-sigillerad" är inte ett kvalitetspåstående; det är en forensisk egenskap. Att behandla det som ett kvalitetsmärke är exakt det missbruk som det villkorade-först-designen försöker förhindra.

## Hur du gör en fork av detta kit för en verklig attestering

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Kritisk tidpunkt:** sigillera VID eller EFTER registrets officiella utfärdandehändelse, INTE före. Ett pre-utfärdande-sigill skapar en falsk-positiv "utfärdad"-post. För tillbakadragandeattesteringar, sigillera VID ögonblicket för tillbakadragandet. För pågående övervakningsattesteringar mellan utfärdande och tillbakadragande, sigillera vid varje verifierarunderskriven övervakningscykel — men gör klart i FACT 01 att attesteringen är en övervakningsuppdatering, inte en utfärdande.

## Integration med befintlig koldioxidinfrastruktur

- **Verra (VCS).** Den sigillerade publikationens URL eller IPFS-CID kan bifogas VCS-projektsidan som kompletterande dokumentation. Sigillet ersätter inte VCS-verifiering; det komponerar med den.
- **Gold Standard.** Samma integrationsmodell — kompletterande attestering tillsammans med Gold Standard-utfärdandedokumentation. Gold Standards betoning på sidonyttor + samhällsnytta-dokumentation kartläggs naturligt på FACT 02 + FACT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).** Samma integrationsmodell.
- **Artikel 6.4 (Parisavtalets övervakningsorganmekanism).** Värdlands-LoA-hashen i FACT 06 är specifikt utformad för Artikel 6.4 / 6.2 ITMO-spårbarhet. Motsvarande-justering-redovisning är ett vägran-villkorat fält.
- **EU ETS MRV.** För efterlevnadsmarknadsutfärdare kartläggs MRV-rapporthashen på FACT 03:s kvantifieringskalkylbladshash. Sigillet komponerar med — ersätter inte — operatörens verifierade utsläppsrapport.
- **CDP (Carbon Disclosure Project) företagsredovisning.** För företag som citerar tillbakadragna krediter i CDP-ansökningar är tillbakadragandeposten sigillerad under FACT 06 den kanoniska hämtningsbara posten. CDP-ansökningsspråk kan referera till den sigillerade publikationens Merkle-rot eller IPFS-CID.
- **ISO 14064-2 (projekt) / ISO 14064-3 (verifiering) / ISO 14065 (ackreditering).** Sigillet registrerar överensstämmelsepåståendet + hasharar; det utför inte överensstämmelsebedömningen.
- **TSVCM Core Carbon Principles (CCP) / ICVCM-etiketter.** Där ett projekt har bedömts mot ICVCM CCP:erna kan bedömningsresultathashen sigilleras i FACT 07 som en tillhörande redovisning.

## Vad detta kit INTE ersätter

- Ackrediterad tredjepartsverifiering (ISO 14064-3)
- Registreringsutfärdande- och tillbakadragandearbetsflöden
- Metodiköverensstämmelsebedömning
- Värdlandsauktorisationsprocesser för artikel 6-transaktioner
- Efterlevnadsmarknads-MRV-processer (EU ETS, Kaliforniens Cap-and-Trade, RGGI, etc.)
- Frivilligmarknadsintegritetsinitiativ (ICVCM, VCMI)
- Oberoende klimatpåverkansbedömning

## Varför detta kit finns i v0.4.0+

Detta är det 7:e bearbetade exemplet som levereras med myriam-kit. Kitet finns eftersom marknaderna för koldioxidkrediter har en väldokumenterad historia av tyst retroaktiv modifiering — metodiker som retroaktivt omtolkas, baslinjer som retroaktivt revideras, tillbakadragandeposter som ändrar status, och projektredovisningar som tyst släpper obekväma förbehåll över tid.

Sigillet stänger det *smala* gapet av bytes-vid-attesteringstidpunkt. Det adresserar inte — och kan inte adressera — de större omtvistade frågorna om additionalitet, permanens, läckage eller sidonyttors äkthet. Kitets ärliga inramning av den begränsningen är dess viktigaste funktion.

## Licens

Public domain (CC0). Forka det. Ingen attribution krävs.
