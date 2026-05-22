*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Kit voor Voedselveiligheidsattest

Een kant-en-klaar myriam-kit-voorbeeld voor voedselfabrikanten,
voedselveiligheidsinspecteurs, externe certificeerders en
regelgevende instanties die een door Bitcoin verankerd, manipulatie-
detecterend zegel willen publiceren van *wat de vrijgavetests
hebben aangetoond* en *welk vrijgavebesluit is genomen*, op het
moment van batch-vrijgave of inspectierapport-ondertekening — zodat
stille post-vrijgave-wijziging van het testdossier, het
vrijgavebesluit of de terugroepverplichtingen publiek detecteerbaar is.

---

## Wat deze kit NIET doet (lees eerst)

Het zegel is een cryptografische tijdstempel van WELKE vrijgavetests
zijn uitgevoerd op WELK lot, door WELKE geaccrediteerde laboratoria,
onder WELKE methoden, met WELKE resultaten, en welk VRIJGAVEBESLUIT
de QA-autoriteit op basis van die resultaten heeft genomen. Het kan
geen enkele vraag over voedselveiligheid daarbuiten beantwoorden.
Het volgende valt **buiten het domein van het zegel**:

1. **Voorkomen van besmetting.** De kit verankert wat de
   testresultaten ZEIDEN bij vrijgave. Besmetting heeft vele
   oorzaken — heterogene microbiële verdeling binnen een lot,
   temperatuurmisbruik na vrijgave in de distributie, falen bij
   detailhandelafhandeling, falen bij consumentenbereiding,
   nieuwe of niet-gescreende gevaren (bijv. melamine-vervalsing
   voordat melaminescreening routine werd), toeleveringsketenfraude
   stroomopwaarts van het testbereik van de fabrikant. Het zegel
   voorkomt geen van deze en pretendeert dat niet.

2. **Garanderen dat alle eenheden in een geslaagd lot veilig zijn.**
   Microbiologische besmetting in bulkvoedingsproduct is
   HETEROGEEN. Listeria, Salmonella en STEC-pathogenen komen voor
   in gelokaliseerde hotspots met lage prevalentie, niet uniform
   verdeeld. ICMSF- en Codex-bemonsteringsplannen hebben een
   gedocumenteerde, begrensde kans op detectie van besmetting bij
   lage prevalentie — de kans is NIET 1. Een lot dat
   vrijgavebemonstering passeert, kan nog steeds besmette eenheden
   bevatten die niet bemonsterd werden. Het zegel verankert de
   MONSTERS, niet de bulk. Deze beperking wordt expliciet herhaald
   in FACT 03 en is de allerbelangrijkste eerlijke limiet van
   deze kit.

3. **Certificeren dat vrijgavetests eerlijk zijn uitgevoerd.** Het
   zegel verankert wat de tests rapporteerden bij vrijgave. Een
   laboratorium dat een frauduleuze PASS rapporteert bij vrijgave
   produceert een cryptografisch geldig zegel van een frauduleuze
   PASS. De kit maakt latere stille wijziging detecteerbaar, maar
   detecteert geen gelijktijdige fraude. Detectie van gelijktijdige
   fraude vereist audit, toezicht op laboratoriumaccreditatie
   (ISO 17025 surveillance), bekwaamheidstesten en
   regelgeverinspectie — allemaal stroomopwaarts van het zegel.

4. **Vervangen van FSMA-, FSIS- of EU-bevoegde autoriteit
   regelgevingsindieningen.** Vrijgavedossiers onder FSMA, FSIS,
   EU-verordening (EG) 178/2002 en Codex Alimentarius worden
   onderhouden conform wettelijke voorschriften en geproduceerd
   op verzoek van de regelgever. Het zegel voegt een publieke
   manipulatie-detecterende laag toe BOVENOP die indieningen; het
   vervangt ze NIET. Een verzegelde publicatie is geen
   regelgevingsindiening.

5. **Oplossen van geschillen over terugroep-omvang.** De kit kan
   de terugroepverplichtingen die bij vrijgave zijn gedaan
   verzegelen (FACT 06) en een latere terugroep-omvang als nieuwe
   publicatie; maar de grens van welke loten zijn aangedaan, welke
   eenheden zijn verzonden, welke detailhandelaren ze hebben
   ontvangen en welke consumenten zijn blootgesteld is nog steeds
   een trace-back-and-forward-onderzoek. Het zegel verankert wat
   de fabrikant heeft TOEGEZEGD en wat ze later DEDEN. Het lost
   de onderliggende epidemiologische vraag niet op.

6. **Detecteren van opzettelijke toeleveringsketenfraude
   stroomopwaarts van tests.** De melamine-vervalsing van melk en
   zuigelingenvoeding in China in 2008 slaagde omdat melamine niet
   in het analytenpaneel zat — meting van stikstofgehalte-eiwit-
   equivalent wel, en melamine vervalste dat. Een verzegelde
   FACT 03 met het destijds gebruikte analytenpaneel zou zich
   publiek hebben gebonden aan dat paneel — maar zou niets hebben
   gedaan om het vervalsingsmiddel buiten het paneel te detecteren.
   De waarde van het zegel in dat geval zou forensische verankering
   zijn geweest van "dit is wat de fabrikant beweerde te testen,"
   NIET preventie. Een echt voedselveiligheidsregime pakt dit aan
   via onaangekondigde regelgeverbemonstering met breed-spectrum
   screening (bijvoorbeeld LC-MS ongerichte methoden), wat
   stroomopwaarts is van het zegel van de fabrikant.

7. **Verankeren van post-vrijgave-distributie en
   consumentenafhandeling.** Zodra het lot de fabriek verlaat,
   vallen temperatuurmisbruik tijdens distributie, verkeerde
   afhandeling in de detailhandel, falen bij consumentenopslag en
   fouten bij consumentenbereiding allemaal buiten het bereik. Het
   zegel is gericht op het vrijgave-evenement van de fabrikant.
   Stroomafwaartse manipulatiedetectie vereist aparte kits op
   distributeur-, detailhandelaars- en (voor institutionele
   consumenten zoals scholen en ziekenhuizen) gebruiksniveau.

8. **Garant staan voor de veiligheid van voedsel in een specifieke
   populatie.** PASS-resultaten van FACT 03 impliceren geen
   veiligheid voor zwangere consumenten, zuigelingen,
   immuungecompromitteerde consumenten of ouderen, voor wie
   Listeria monocytogenes en Salmonella een gedocumenteerd
   verhoogd risico vormen, zelfs bij concentraties onder
   conventionele detectiegrenzen. Het zegel kan geen
   populatiespecifieke veiligheidsclaim doen en weigert dat
   (weigeringsregel R6).

**De sectie over eerlijke limieten hierboven is het dragende deel
van deze kit.** Fabrikanten die "wij hebben ons vrijgavedossier
verzegeld" gelijkstellen aan "wij hebben bewezen dat ons voedsel
veilig is" misbruiken het primitief. De kit moet duidelijk
verklaren: *dit is een non-repudiation-primitief voor de
gelijktijdige beweringen van de fabrikant bij vrijgave, geen
bewijs van veiligheid, geen vervanging voor toezicht door de
regelgever, en geen verdediging tegen de heterogene besmetting,
toeleveringsketenfraude of post-vrijgave-misbruik-faalmodi die in
eerdere uitbraken mensen hebben gedood.*

---

## Wat deze kit MOET WEIGEREN te verzegelen

De kit is geconfigureerd om de volgende feitenpatronen te weigeren,
zelfs als een gebruiker met geldige ondertekeningsbevoegdheid van
de fabrikant ze indient:

- **Persoonlijke identificatie van werknemers, supervisors, QA-
  personeel, bezoekende inspecteurs of externe auditors.** Namen,
  personeelsnummers, badgenummers, BSN-nummers, woonadressen,
  privételefoonnummers — geen van deze verschijnt in het publieke
  zegel. Rollen zijn publiek; persoon-naar-rol-koppelingen worden
  afzonderlijk verzegeld en zijn vindbaar via regelgeverprocedure.
  Werknemersveiligheid tegen vergelding en intimidatie is de
  dragende beperking; voedselveiligheidsattest kan op rolniveau
  worden gedaan. (R1)

- **Precieze locatie van de faciliteit.** De regio van de
  faciliteit (provincie of multi-provinciale regio) is acceptabel;
  precies straatadres, GPS-coördinaten of een identificator met
  voldoende granulariteit om de fabriek fysiek op een kaart te
  identificeren is NIET acceptabel. Het registratienummer is de
  handle van de regelgever voor de faciliteit; fysieke-veiligheid
  en werknemersveiligheidsoverwegingen pleiten tegen het publiceren
  van een publiek adres op Bitcoin. (R2)

- **Patronen van individueel productiepersoneel per dienst.**
  Dienstroosters, individuele werknemerrotaties, persoonlijke ID's
  van lijnoperators — geen van deze verschijnt in het zegel. Het
  leefpatroon van individuele werknemers mag niet afgeleid kunnen
  worden uit het publieke attest. (R3)

- **Leveranciersidentiteiten die contracten compromitteren.**
  Leveranciersnamen, locaties van leveranciersfaciliteiten,
  leverancierslotcodes (behalve in het geval van besmetting van
  de toeleveringsketen waar het noemen van een besmet lot van een
  leverancier vereist is voor de volksgezondheid, en wordt
  afgehandeld via een afzonderlijke verzegelde publicatie) worden
  NIET gepubliceerd in het vrijgavezegel. Veel leverancierscontracten
  bevatten vertrouwelijkheidsbepalingen; het zegel schendt die
  standaard niet. (R4)

- **Klantenlijsten en distributiebestemmingen buiten hoog niveau.**
  Een regionaal overzicht op hoog niveau is acceptabel; specifieke
  klantenlijsten (detailhandelaren, distributiecentra,
  foodservice-accounts) zijn NIET acceptabel. Klantidentiteit is
  contractueel vertrouwelijk en concurrentieel gevoelig; de
  regelgever verkrijgt de klantenlijst via gevestigde
  terugroep-coördinatiekanalen. (R5)

- **Veiligheidsclaims of juridische conclusies.** De kit zal "dit
  product is veilig," "dit lot voldoet aan alle van toepassing
  zijnde voedselveiligheidsnormen," "dit is GRAS voor dit
  gebruik," of enige andere veiligheids- of juridische conclusie
  niet verzegelen. De kit verankert het testdossier en het
  vrijgavebesluit, NIET een veiligheidsconclusie. (R6)

- **Patronen voor heridentificatie van werknemersklachten of
  klokkenluiders.** De kit weigert elk patroon te publiceren dat
  een werknemer kan heridentificeren die een OSHA-, USDA- of
  intern-bedrijfsklacht heeft ingediend over voedselveiligheid of
  werkpraktijken. Dergelijke klagers worden beschermd onder FSMA
  Sectie 402 en parallelle statuten; het zegel mag geen
  heridentificatievector worden. Klokkenluidersattesten hebben
  hun eigen kit (`examples/whistleblower-manifest`) met
  weigeringsregels afgestemd op die toepassing. (R7)

- **Verzegeling door iemand anders dan de gemachtigde principaal
  van de vrijgevende fabrikant.** Een externe certificeerder,
  klant-QA-team of onafhankelijke auditor mag dezelfde kit
  gebruiken om HUN eigen auditbevindingen te verzegelen; ze mogen
  NIET het oorspronkelijke vrijgavebesluit onder de naam van de
  fabrikant verzegelen. De ondertekenende principaal in FACT 08
  is daarvoor de enige geldige ondertekenaar. (R8)

Een weigering zelf kan als feit worden verzegeld ("Deze fabrikant
verzocht om verzegeling van X; de kit weigerde volgens
weigeringsregel Y"), waardoor een publiek dossier ontstaat van
poging tot misbruik.

---

## Wat deze kit WEL verzegelt

8 feiten op het moment van vrijgave:

1. **Voorbeeldkennisgeving** — verklaart de publicatie als
   voorbeeld (echte attesten verwijderen of vervangen dit).
2. **Product- en batchidentificatie** — productnaam, categorie,
   fabrikant, regio van de faciliteit (NIET precieze locatie),
   HACCP-planversie + hash, lot-ID, productie- / verpakkings- /
   uiterste gebruiksdata, aantal consumenteneenheden,
   opslagvereisten, de drie kritische beheersingspunten met
   gelogde-recordhashes (kook-lethaliteit,
   afkoel-stabilisatie, post-lethale RTE-omgeving).
3. **Resultaten van vrijgavetests** — microbiologische tests van
   eindproduct (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), chemische / residutests (nitriet,
   diergeneesmiddelen, zware metalen), verificatie van
   allergeen-kruisbesmetting, samenvatting van
   omgevingsmonitoring, elk met de SHA-256 van het volledige
   rapport-PDF en de expliciete steekproef-vs-bulk-
   interpretatiebeperking.
4. **Methodologie en laboratoriumkwalificatie** — welke methode
   (en welke versie van het methodedocument) per regel is
   gebruikt, welke labs welke tests uitvoerden, elke labs
   ISO/IEC 17025:2017 accreditatiestatus en certificaathash,
   recente bekwaamheidstestresultaten, onafhankelijkheidsverklaring,
   afwijking- / hertest- / OOS-record voor dit lot.
5. **Vrijgavebesluit** — vrijgavedatum, vrijgavebevoegdheid op
   rolniveau + tegenondertekening, samenvatting van
   besluit-ondersteunende dossiers, distributiebestemmingen op
   hoog niveau, post-vrijgaveverplichtingen erkend bij vrijgave,
   timing-en-onomkeerbaarheidsverplichting.
6. **Terugroep- en post-marketing-surveillanceverplichtingen** —
   het voedselveiligheidsequivalent van geneesmiddelenbewaking:
   transparantie van ziektesignalen,
   terugroepuitvoeringsverplichtingen (24u / 72u / 98%
   drempels), respons op besmetting in toeleveringsketen,
   geen-stille-hertestverplichting,
   geen-post-hoc-specificatiewijzigingsverplichting, geaggregeerde
   deling van veiligheidssignalen.
7. **Begeleidende onthullingen en weigeringsdossier** — hash van
   corrigerende-actie-onderzoekslog, recente inspectiegeschiedenis,
   terugroepgeschiedenis, bekende open kwesties in gebruikte
   testmethoden, rol-naar-individu-koppeling (afzonderlijk
   verzegeld, hier gehasht), traceback-gereedheid van
   leveranciers, expliciete lijst van weigeringsregels R1-R8 met
   eventuele weigeringen uitgeoefend tijdens deze vrijgave.
8. **Ondertekenende principaal** — fabrikant + ondertekenaar op
   rolniveau (QA-directeur) + tegenondertekening op rolniveau
   (fabrieksmanager) + cryptografische sleutelinformatie;
   rationale voor publicatie op rolniveau.

Elk feit eindigt met de weigeringspoort-conventie: *"Dit feit
beweert alleen X. Het beweert geen Y"* (waarbij Y de dichtstbijzijnde
faalmodus is uit de "NIET doet"-sectie hierboven).

---

## Waartegen deze kit verdedigt

- **Stille retroactieve wijziging van vrijgavetestresultaten.**
  Alle testrapport-PDFs worden gehasht. Opnieuw hashen na vrijgave
  onthult elke wijziging.
- **Geschillen over welke methoden, welke versies van
  methodedocumenten en welke labs zijn gebruikt.** FACT 04 bevriest
  de methodologie en lab-accreditatiestatus bij vrijgave. Latere
  beweringen als "we hebben eigenlijk MLG 4.13 gebruikt, niet
  4.12" zijn publiek weerlegbaar.
- **Retroactieve herspecificatie van een buiten-spec batch.** Als
  een vrijgavetestresultaat eigenlijk een grenswaarde-PASS was die
  na vrijgave wordt geherclassificeerd als FAIL, bewijzen de
  verzegelde rapporthashes wat het oorspronkelijke resultaat-PDF
  zei. Symmetrisch is een grenswaarde-OOS die stilletjes wordt
  hertest tot een PASS zonder openbaarmaking, detecteerbaar als
  FACT 06's geen-stille-hertestverplichting later wordt vergeleken
  met een onverzegelde wijziging.
- **Stille minimalisering van terugroep-omvang.** De
  terugroepverplichtingen in FACT 06 (24u-notificatie,
  72u-initiatie, 98% terugwinbaarheid) zijn verzegeld; verzuim
  ze na te komen is publiek waarneembaar.
- **Post-hoc her-vertelling van de corrigerende-
  actiegeschiedenis.** De FACT 07 hash van de corrigerende-actielog
  bevriest wat het bedrijf ZEI dat het deed na het
  EMP-vermoeden; latere claims als "we hebben meer / minder dan
  dat gedaan" zijn publiek weerlegbaar.
- **Selectieve weglating van begeleidende onthullingen.** FACT 07
  somt de verwachte onthullingscategorieën op
  (inspectiegeschiedenis, terugroepgeschiedenis,
  methodeadviesbeoordeling, traceback-gereedheid); een lege
  categorie moet expliciet worden geattesteerd ("geen bij
  vrijgavemoment"), zodat een latere "we beseften niet dat dat
  relevant was" publiek weerlegbaar is.
- **Vervanging van de accreditatiestatus van een ander lab.**
  FACT 04 bevriest de ISO 17025-scope en certificaathash van elk
  lab bij vrijgave; latere vervanging door een niet-geaccrediteerd
  lab is publiek detecteerbaar.

De kit verdedigt **niet** tegen gelijktijdige corruptie — een team
dat opzettelijk valse testresultaten verzegelt bij vrijgavetijd
produceert een cryptografisch geldig zegel van valse testresultaten.
Het primitief is daar eerlijk over: het is een
non-repudiation-primitief voor de gelijktijdige beweringen van de
fabrikant, geen bewijs dat die beweringen correct zijn.

---

## Historisch sterftecedent

De kit zou een nuttig anker hebben geproduceerd — *geen oplossing* —
bij eerdere voedselveiligheidsfalen. Om individuen niet te belasteren
(de meeste voedselveiligheidsfalen zijn bedrijfsmatig, niet
individueel; sommige worden strafrechtelijk vervolgd, andere niet),
beschrijven deze verwijzingen de uitbraak naar jaar en pathogeen en
noemen ze de betrokken entiteit alleen wanneer de besmetting
publiekelijk is toegeschreven door terugroepnotificatie of
gerechtelijk dossier.

- **2008 China melamine-vervalsing van zuigelingenvoeding en
  zuivel (Sanlu Group + anderen).** Ten minste zes kindersterftes
  en ~300.000 ziektegevallen toe te schrijven aan met melamine
  bespikte zuivelproducten ontworpen om frauduleus het schijnbare
  eiwitgehalte op Kjeldahl-stikstofgebaseerde assays op te blazen.
  Veroordelingen volgden in PRC-rechtbanken, inclusief
  doodvonnissen. *Het zegel zou dit niet hebben voorkomen* —
  melamine viel buiten het standaard analytenpaneel. Het zegel zou
  zich publiek hebben gebonden aan wat het paneel WAS, waardoor de
  omvang van de post-incident-uitbreiding van routinematige
  screening forensisch duidelijk zou zijn.

- **2011 Europese STEC O104:H4-uitbraak (fenegriek-kiemen
  herleid tot een Duitse boerderij).** 53 doden, ~3.950
  ziektegevallen verspreid over meerdere Europese landen;
  uiteindelijk herleid tot fenegriekzaden geïmporteerd uit Egypte
  en gekiemd bij een Duitse producent. Traceback werd belemmerd
  door inconsistente documentatie op lotniveau in de meerlandige
  toeleveringsketen. *Het zegel zou besmetting van het zaadlot
  niet hebben voorkomen* (de besmetting was stroomopwaarts van de
  tests van de kiemer); het zou hebben verankerd wat de
  vrijgavetests van de kiemer beweerden en, indien gebruikt op
  het niveau van de zaadimporteur, wat de behandeling van
  geïmporteerde zaden beweerde, waardoor traceback sneller zou
  zijn.

- **2015 Blue Bell Creameries Listeria monocytogenes-uitbraak
  (Verenigde Staten).** 3 doden, 10 ziektegevallen verspreid over
  meerdere staten; leidde tot een nationale terugroepactie en een
  federale strafveroordeling in 2020 van Blue Bell op
  voedselveiligheidsovertredingen van wanbedrijfniveau, waarbij
  het bedrijf een uitgestelde-vervolgingsovereenkomst aanging en
  $19,35 miljoen betaalde. Volgende civiele rechtszaken. *Het
  zegel zou de in-fabriek Listeria-omgevingsbesmetting niet
  hebben voorkomen*; het zou forensisch de
  omgevingsmonitoringprogramma-records hebben verankerd, waardoor
  elke post-incident-vraag van "wat liet het EMP zien in de
  maanden vóór de uitbraak" beantwoordbaar zou zijn tegen een
  manipulatie-detecterend gestempeld record in plaats van tegen
  later geproduceerde documenten.

- **2018 STEC O157:H7-uitbraken in meerdere staten gelinkt aan
  romeinse sla (Yuma-teeltgebied, daarna Salinas-teeltgebied).**
  Ten minste 5 doden en ~210 ziektegevallen verspreid over
  meerdere uitbraken dat jaar. Traceback werd gecompliceerd door
  product in zakken met gemengde bron. *Het zegel zou besmetting
  op het niveau van veld / irrigatiewater (stroomopwaarts van de
  fabrikant) niet hebben voorkomen*; het zou forensisch de
  inkomende-test- en vrijgavetestdossiers van elke verwerker
  hebben verankerd, waardoor de trace-back sneller en het
  openbaar dossier cryptografisch beter verdedigbaar zou zijn
  tegen latere geschillen.

- **Peanut Corporation of America Salmonella
  Typhimurium-uitbraak (2008-2009, Verenigde Staten).** 9 doden,
  ~714 ziektegevallen; resulteerde in federale strafveroordelingen
  in 2014-2015 van PCA-leidinggevenden, inclusief een
  gevangenisstraf van 28 jaar voor de CEO op aanklachten van
  samenzwering en obstructie. *Het zegel zou de besmetting niet
  hebben voorkomen*, noch het onder-onderzoek van positieve
  in-fabriek Salmonella-tests, noch de beslissing op
  uitvoerend niveau om product te verzenden tegen die positieve
  bevindingen in. Het ZOU forensisch duidelijk hebben gemaakt
  tijdens het proces wat de testresultaten ZEIDEN op het moment
  dat ze werden gegenereerd — waardoor de zaak van de
  vervolging tegen gelijktijdige
  vals-narratief-emails substantieel beter verankerd zou zijn
  geweest tegen documentaire wijziging.

In elk van deze gevallen zou de kit een schonere forensische
tijdlijn hebben geleverd. In geen enkel van deze gevallen zou de
kit op zichzelf de doden hebben voorkomen. Het zegel is forensische
infrastructuur, geen preventie-infrastructuur. Dat onderscheid is
de eerlijkheid van de kit.

---

## Wanneer deze kit gebruiken

- Uw productieoperatie heeft een stabiel HACCP / Preventive
  Controls-programma en wil een door Bitcoin verankerd publiek
  attest toevoegen als manipulatie-detecterende laag bovenop de
  bestaande vrijgavedocumentatieworkflow.
- U bent een kleine tot middelgrote fabrikant of een fabrikant
  in een jurisdictie met zwakkere regelgevende infrastructuur, en
  wilt batchdossiers verankeren tegen een wereldwijd
  verifieerbare tijdlijn — voor vertrouwen op exportmarkten, voor
  respons op klantaudits of voor deelname aan vrijwillige
  transparantie-initiatieven.
- U bent een voedselveiligheidsinspecteur of externe
  certificeerder en wilt bij ondertekening een
  manipulatie-detecterend audit-bevindingszegel publiceren, zodat
  de auditbevindingen later niet stilletjes gewijzigd kunnen
  worden bij overeenkomst tussen fabrikant en certificeerder.
- U verwacht dat dit lot aanzienlijke stroomafwaartse aandacht
  krijgt (exportmarkt, hoogrisico-categorie zoals RTE-vlees of
  zuigelingenvoeding, nieuw ingrediënt, recente
  terugroepgeschiedenis).
- U kunt de vermelde feitenset publiceren zonder
  weigeringsregels R1-R8 te breken. Als uw feiten een R1-R8-breuk
  zouden vereisen, gebruik de kit niet; herstel eerst de
  gegevensinvoer.
- De juridisch adviseur van de fabrikant heeft het publicatieplan
  beoordeeld. Publieke publicatie van een artefact met lot-
  identificator heeft implicaties voor productaansprakelijkheids-
  blootstelling; juridische beoordeling is niet optioneel.

## Wanneer deze kit NIET gebruiken

- **Gebruik niet als vervanging voor FSMA- / FSIS- / EU-
  regelgevingsdossiers.** Het zegel is *additief*, geen
  vervanging. Uw wettelijke vrijgavedossiers, uw HACCP-plan, uw
  CCP-logs en uw terugroepplan zijn onveranderd.
- **Gebruik niet als veiligheidsclaim.** Verzegelen van een
  geslaagd vrijgavedossier stelt niet vast dat het product veilig
  is; het stelt vast dat het dossier deze byte-inhoud had op dit
  moment. Weigeringsregel R6 zal elke veiligheidsconclusie
  afwijzen.
- **Gebruik niet om leveranciersidentiteiten, klantenlijsten,
  werknemersnamen of faciliteitsadressen te publiceren.**
  Weigeringsregels R1-R5 bestaan om redenen van menselijke
  veiligheid en contract; wijzig de kit niet om ze te omzeilen
  zonder de juridisch adviseur te raadplegen.
- **Gebruik niet onder druk om te verzegelen voordat
  vrijgavetests zijn voltooid.** Een gedeeltelijk-data-zegel
  verkeerd voorstelt de status van het vrijgavebesluit.
- **Gebruik niet als legitimiteitstheater.** Een zegel van een
  slecht ontworpen bemonsteringsplan of een slecht gekozen
  analytenpaneel is een permanent openbaar dossier van de
  ontoereikendheid, geen verdediging ertegen. Het primitief snijdt
  beide kanten op; dat is zijn eerlijkheid.
- **Gebruik niet tijdens een actieve terugroepsituatie als
  vervanging voor de terugroepcoördinatie van de regelgever.** Een
  nieuwe MYRIAM-publicatie die de terugroep-omvang verankert is
  passend NA initiatie van de door de regelgever gecoördineerde
  terugroep; het is geen vervanging voor het terugroepkanaal van
  de regelgever.

## Hoe deze kit te forken voor een echte vrijgave

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**KRITIEKE TIMING:** verzegel op het moment van QA-vrijgave, VÓÓRDAT
het lot wordt gedistribueerd (voordat de eerste vrachtwagen de
faciliteit verlaat). Een zegel nadat de distributie is begonnen
heeft nog steeds waarde maar verankert de pre-distributie-staat
niet schoon. Het juiste venster is tussen de QA-vrijgavehandtekening
en de eerste distributiebeweging.

**KRITIEKE BEOORDELING:** voordat u verzegelt, laat de publicatie
beoordelen door een tweede QA-beoordelaar (niet de lead) en door
bedrijfsraadgevend juridisch adviseur. Eenmaal verzegeld is de
publicatie permanent.

## Integratie met bestaande voedselveiligheidsinfrastructuur

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  De verzegelde publicatie-URL of IPFS-CID kan worden gerefereerd
  in de Food Safety Plan-documentatie als het
  publieke-attest-artefact voor dit lot.
- **USDA FSIS HACCP-plannen en vrijgavedossiers.** Het verzegelde
  vrijgavedossier ligt naast de door FSIS vereiste HACCP-records;
  het zegel verwijst naar de hash van de HACCP-planversie
  (FACT 02) zodat latere geschillen over welke planversie van
  kracht was publiek weerlegbaar zijn.
- **Codex Alimentarius / HACCP-principes** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Het zegel verbindt zich met de
  zevenprincipe-HACCP-outputs (gevaaranalyse, CCP's, kritische
  limieten, monitoring, corrigerende acties, verificatie,
  registratie) voor dit lot.
- **ISO 22000:2018 (Food Safety Management Systems).** Het zegel
  kan worden gerefereerd als onderdeel van het
  managementbeoordelings-bewijsspoor; het vervangt de ISO 22000-
  certificering niet.
- **FSSC 22000 v6-certificeringsschema.** Compatibel als
  additieve transparantielaag; de auditor van FSSC kan het zegel
  verifiëren tijdens surveillance.
- **EU-verordening (EG) 178/2002 (Algemene Levensmiddelenwet)
  Artikel 18 (traceerbaarheid) en Artikel 19 (terugroepkennisgeving).**
  Het zegel verbindt de
  een-laag-terug-traceback-gereedheid van de fabrikant
  (FACT 07) en terugroepverplichtingen (FACT 06); het vervangt
  de wettelijke Artikel 19-kennisgevingsverplichting niet.
- **EU Hygiënepakket (Verordeningen 852/2004, 853/2004,
  854/2004, 882/2004).** Compatibel; het zegel verwijst naar het
  equivalent van de HACCP- en eigen-controlerecords van het
  Hygiënepakket.
- **BRCGS / SQF privé-standaardschema's.** Compatibel als
  additieve transparantielaag.
- **Volksgezondheidssurveillancesystemen (CDC PulseNet, FoodNet,
  IFSAC; EU EFSA / ECDC).** Buiten bereik van het zegel
  rechtstreeks, maar FACT 06 verbindt de fabrikant om deel te
  nemen en om signaal-correlatiegebeurtenissen te verzegelen als
  nieuwe MYRIAM-publicaties.

## Wat deze kit NIET vervangt

- FDA Food Facility Registration of USDA FSIS Establishment-
  goedkeuring.
- Uw geschreven Food Safety Plan / HACCP-plan onder FSMA / FSIS.
- CCP-monitoringlogs en corrigerende-actierecords.
- ISO 17025 lab-accreditatietoezicht.
- Bekwaamheidstestprogramma's.
- Regelgeverinspectie (FSIS continue inspectie, FDA periodieke
  inspectie, EU-bevoegde-autoriteit-inspectie).
- Volksgezondheidssurveillance (CDC, EFSA, ECDC, nationale
  equivalenten).
- Terugroepcoördinatiekanalen (FDA Reportable Food Registry,
  FSIS terugroepcoördinatie, EU RASFF, nationale equivalenten).
- Werknemersveiligheids- en voedselwerker-opleidingsprogramma's.

## Waarom deze kit bestaat in v0.4.0+

Dit is een van de uitgewerkte voorbeelden geleverd met myriam-kit.
Het volgt de constraint-first README-structuur gevalideerd door het
autoresearch gedocumenteerd in `~/Genesis/calc/PROMPT_LIBRARY_v0.md`
— de constraint-first promptvariant scoorde het hoogst op een
gewogen rubriek over meerdere voorbeelddomeinen, omdat
voedselveiligheidsattest precies het domein is waar overdrijving
van wat het zegel bewijst gevaarlijk is: mensen zijn gestorven, en
zullen sterven, bij falen die het zegel niet kan voorkomen. De
openingssecties zijn de dragende delen van de kit; de
manifestinhoud is het gemakkelijke deel.

De standaarden van de kit zijn opzettelijk conservatief over
publicatie van werknemersnamen, conservatief over precisie van
faciliteitslocatie, conservatief over leveranciers- en
klantidentiteit, en agressief over de disclaimer "dit stelt geen
veiligheid vast." De voedselveiligheidsgemeenschap heeft een
gedocumenteerde geschiedenis van overdreven certificeringstaal; de
kit verdedigt de positie die het minst waarschijnlijk wordt gelezen
als veiligheidsgarantie. Fabrikanten in jurisdicties waar specifieke
publieke openbaarmakingsvereisten verschillen, kunnen hun fork
dienovereenkomstig wijzigen, maar de standaardweigeringen geven de
voorkeur aan werknemersveiligheid en eerlijke scope.

## Licentie

Publiek domein (CC0). Fork het. Geen attributie vereist.
