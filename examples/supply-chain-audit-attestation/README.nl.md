# Supply-Chain Audit Attestatie Verzegelingskit

*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

Een sleutelklare myriam-kit voorbeeld voor externe sociaal/arbeids/
milieu-auditors, interne supplier-compliance teams, NGO-onderzoekers
van toeleveringsketens en arbeidersrechten-organisaties die een
Bitcoin-verankerd, knoeibestendig zegel van een auditrapport willen
publiceren op het exacte moment van ondertekening.

---

## Wat deze kit NIET doet (lees dit eerst)

Het zegel is een cryptografische tijdstempel van wat de auditor heeft
ondertekend. Het kan niet verifiëren of wat is ondertekend **waar** is.
De volgende faalmodi vallen **buiten het domein van het zegel**:

1. **Audit-capture door de industrie.** Door merken in opdracht gegeven
   audits hebben een lange, gedocumenteerde geschiedenis van het
   produceren van milde bevindingen over leveranciers wiens
   voortdurende zaken met het opdrachtgevend merk de audit-pijplijn
   draaiende houdt. Een gecaptureerde audit, eenmaal verzegeld,
   produceert een permanent forensisch verslag van de gecaptureerde
   audit. Het zegel corrigeert capture niet — het maakt slechts de
   audit-zoals-uitgevaardigd onveranderlijk, zodat een later
   waarheidsvindingsproces iets concreets heeft om mee te vergelijken.

2. **Gecoachte werknemers / voorbereide faciliteiten.** Aangekondigde
   of semi-aangekondigde audits geven het management dagen of weken
   om antwoorden van werknemers in te oefenen, minderjarige
   werknemers te verbergen, slaapzalen schoon te maken, niet-
   conforme apparatuur te verwijderen en werk om te leiden naar niet-
   geauditeerde onderaannemers tijdens het auditvenster. Het zegel
   verankert wat aan de auditors getoond werd, niet wat hen belet
   werd te zien.

3. **Verborgen onderaanneming.** Tier-2 en Tier-3 onderaanneming,
   thuiswerk en informele-sector productie zijn pervasief onzichtbaar
   voor fabrieksvloer-audits. Het zegel verankert een Tier-1 audit;
   het kan niet detecteren dat Tier-1 uitbesteedt aan een niet-
   geauditeerde Tier-2 tijdens het auditvenster of routinematig.

4. **Audits die systematisch het misbruik missen waar zij op gericht
   zijn.** Rana Plaza, de instorting van de Bengaalse
   kledingfabriek in 2013 die 1.134 werknemers doodde, was in de
   maanden ervoor geauditeerd door meerdere door merken in opdracht
   gegeven auditprogramma's. De scheuren in het gebouw stonden niet
   op de sociale-auditchecklist; het auditregime had geen
   structureel-engineering scope. Audits verankeren wat *binnen
   scope* is; misbruiken buiten scope blijven onzichtbaar ongeacht
   hoe knoeibestendig het zegel is.

5. **Post-ondertekening represailles tegen werknemers die hebben
   deelgenomen aan interviews.** Zelfs met geweigerde
   lokalisatie-informatie (FACT 07 R3), kan een vastberaden
   tegenstander die de leveranciers-ID kent de faciliteit
   identificeren. Werknemerbescherming vereist meer dan slechts
   het weigeren van PII in het zegel — het vereist anonimisering
   stroomopwaarts van de auditmethodologie. Het zegel maakt de
   audit-zoals-uitgevaardigd duurzaam; het beschermt
   geïnterviewden niet met terugwerkende kracht.

6. **Werknemersomstandigheden die legaal maar onmenselijk zijn.**
   Leefbaar-loon hiaten in jurisdicties waar het wettelijke
   minimumloon onder de leefbaar-loon benchmark ligt, produceren
   "conforme" auditbevindingen tegen loon-en-uren wetten en "niet-
   conforme" bevindingen tegen leefbaar-loon standaarden in
   dezelfde audit (FACT 03 element 8 in deze voorbeeld-kit). Het
   zegel verankert wat elke standaard rapporteert; het verzoenen
   ervan is stroomafwaarts beleidswerk.

7. **Klimaat-/milieuschade met diffuse causaliteit.**
   Koolstofuitstoot, ontbossingsbijdragen, waterverbruik en
   verontreinigend-stof emissies van leveranciers kunnen worden
   verzegeld in auditbevindingen, maar causale toeschrijving aan
   het ordervolume van een specifiek merk is methodologisch
   betwist. Het zegel verankert wat bij de leverancier werd
   gemeten; het wijst geen morele of juridische
   verantwoordelijkheid toe.

8. **Geschillen over welke standaard gezaghebbend is.** SA8000 vs.
   BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs.
   bedrijfsspecifieke gedragscode: elk heeft verschillende scopes,
   ernstigheid en remediatieprocessen. Het zegel verankert *één*
   audit onder *één* standaard. Cross-standaard vergelijking is
   een stroomafwaarts probleem.

9. **Auditor-competentie vs. auditor-certificering.** "Gecertificeerd"
   is niet "competent". Auditors die geaccrediteerde
   opleidingsprogramma's hebben afgerond hebben ernstige
   misbruiken gemist in audits die voorafgingen aan publiek
   zichtbare rampen. Het zegel verankert certificeringen; het
   certificeert niet de competentie waarmee deze werden
   uitgeoefend.

**De eerlijke-grenzen sectie hierboven is het dragende deel van deze
kit.** Een merk dat legitimiteitstheater wil zal een verzegelde
audit als schild gebruiken. De kit moet duidelijk stellen: dit is
een *niet-afwijzings-primitief voor het audit-rapport
ondertekeningsmoment*, geen bewijs van leverancierscompliance of
werknemerswelzijn.

---

## Wat deze kit MOET WEIGEREN te verzegelen

De kit is geconfigureerd om de volgende feitenpatronen te weigeren,
zelfs als een gebruiker met geldige auditorgaan-autoriteit ze
indient:

- **Individuele werknemer-identificatie.** Geen feit mag een
  werknemer noemen, een citaat aan een werknemer koppelen,
  badgenummer, lijnpositie, slaapzaalkamer, ploegenrooster,
  demografische combinatie met N<5, of enig veld blootstellen dat
  een persoon die heeft deelgenomen aan interviews opnieuw zou
  kunnen identificeren. Werknemerscitaten gebruiken
  gerandomiseerde tokens; de mapping wordt nooit verzegeld.
- **Klokkenluider-/informant-bronnen.** Als een bevinding berust
  op openbaarmaking door een individu dat risico nam om openbaar
  te maken, wordt het individu nooit genoemd of geïdentificeerd
  in de verzegelde publicatie.
- **Precieze lokalisatie-informatie.** Geen straatadres, GPS,
  satellietbeeld >1km resolutie, of externe gebouwfoto. Het land
  en de regio zijn de maximale resolutie die verzegeld wordt.
  Reden: faciliteit-identificatie maakt represailles tegen
  interviewdeelnemers mogelijk.
- **Schone-audit certificatie-claim.** De kit weigert elke
  framing van het type "deze audit bewijst dat de leverancier
  compliant is" of "er bestaan geen overtredingen" te verzegelen.
  Schoonheid-claims worden epistemologisch niet ondersteund door
  auditmethodologie.
- **Zegel-als-certificaat substitutie.** Een publicatie die de
  methodologie (FACT 04), onafhankelijkheid (FACT 06), of
  weigeringen (FACT 07) weglaat is geen legitieme MYRIAM-
  publicatie onder deze kit.
- **Concept-/voor-ondertekenings audits.** Verzegeling gebeurt
  bij ondertekening, niet ervoor. Voorlopige audits creëren valse
  zekerheid.
- **Post-hoc gunstige herzegeling.** Een herziene audit vereist
  een NIEUWE verzegelde publicatie die naar het origineel verwijst
  via Merkle-wortel. De originele verzegelde audit blijft
  permanent zichtbaar als de audit-zoals-uitgevaardigd.
- **Verzegeling door enige andere partij dan het auditorgaan.**
  Een merk, leverancier, certificeringsorgaan, of derde partij
  kan "de audit" niet verzegelen in plaats van het auditorgaan
  dat het rapport heeft ondertekend.

Een weigering zelf kan worden verzegeld als een feit ("Deze partij
verzocht om verzegeling van X; de kit weigerde volgens
weigeringsregel Y"), waarmee een openbaar verslag van gepoogd
misbruik ontstaat. **In een industrie met wijdverspreide audit-
capture, kan weigering-tot-verzegelen zelf een betekenisvol
signaal zijn:** een auditorgaan dat niet verzegelt omdat een merk
druk heeft uitgeoefend om bevindingen te verzachten heeft de optie
om de weigering openbaar vast te leggen onder hun eigen
principaal.

---

## Wat deze kit WEL verzegelt

8 feiten op het moment van audit-ondertekening:

1. **Voorbeeldmededeling** — verklaart de publicatie tot voorbeeld
   (echte attestaties verwijderen of vervangen dit).
2. **Auditscope en -onderwerp** — auditstandaard, auditorgaan,
   lead auditor, auditteamgrootte, leveranciers-identifier (geen
   precieze lokalisatie-informatie), auditvenster, aankondigingstype
   (aangekondigd / semi-aangekondigd / niet-aangekondigd), datum
   auditrapport, ondertekeningsversie, genoemde ontvangende merken,
   opdrachtgevende partij.
3. **Auditbevindingen-manifest** — per-element conformiteit /
   minor-NC / major-NC / critical-NC tegen de standaard, elk met
   een SHA-256 van de volledige bevindingsbeschrijving. Geaggregeerde
   totalen. Certificeringsaanbeveling bij ondertekening.
4. **Methodologie en bewijs** — ter plaatse tijdsbesteding,
   interviewaantallen (met stratificatie: geslacht, migrantenstatus,
   anciënniteit), interviewformaat-uitsplitsing, tolk-relatie,
   documentbeoordeling met steekproefgroottes en inhoudshashes,
   site-bezoek artefacten (met onscherp gemaakte werknemergezichten),
   bekende methodologische beperkingen.
5. **Gecommiteerde corrigerende acties** — per major-NC en per
   minor-NC CAP met aangegeven grondoorzaak, deadline,
   verificatiemechanisme, escalatieverplichtingen, geen-stille-
   versoepeling verplichting.
6. **Auditor-kwalificaties en -onafhankelijkheid** —
   auditorgaan-accreditatie, klantconcentratie, lead-auditor
   certificeringen en taalcompetentie, sectorervaring,
   onafhankelijkheidsverklaringen (auditor-leverancier, auditor-
   merk, certificeringsorgaan-scheiding).
7. **Begeleidende openbaarmakingen en weigeringsverslag** —
   belangenconflicten (expliciet), eerdere auditgeschiedenis,
   gecommuniceerde worker-voice kanalen, parallelle onderzoeken,
   intern dissident binnen auditorgaan, lijst van weigeringsregels,
   weigeringen die daadwerkelijk werden ingeroepen in deze audit.
8. **Ondertekenend principaal** — auditorgaan, lead auditor,
   auditteam, autoriserende functionaris, cryptografische
   sleutelinformatie.

Elk feit eindigt met de weigering-gate conventie: *"Dit feit beweert
alleen X. Het beweert niet Y"* (waarbij Y de dichtstbijzijnde
faalmodus is uit de "DOET NIET" sectie).

---

## Waartegen deze kit verdedigt

- **Stille post-ondertekenings verzachting van grote non-
  conformiteiten.** Elke verandering aan FACT 03 (bijv. een
  MAJOR_NC geherclassificeerd naar MINOR_NC, of een bevinding
  geheel verwijderd) produceert een andere SHA-256, andere
  Merkle-wortel, faalt OTS-verificatie.
- **Antidatering van corrigerende-actie afsluitingen.** FACT 05
  bevriest de CAP en zijn deadlines bij ondertekening; elke
  "we hebben die NC vorige maand gesloten" claim die conflicteert
  met de verzegelde deadlines is openbaar diffbaar.
- **Methodologie-revisionisme.** FACT 04 bevriest
  interviewaantallen, document-steekproefgroottes en ter plaatse
  uren bij ondertekening — voorkomt dat de latere "we hebben een
  diepgaand onderzoek gedaan" verdediging niet-falsifieerbaar is.
- **Selectieve herpublicatie die ongunstige bevindingen weglaat.**
  Alle 8 feiten zijn gebonden door één enkele Merkle-wortel; het
  citeren van sommige feiten terwijl andere worden weggelaten is
  detecteerbaar uit de gepubliceerde bladlijst.
- **Onafhankelijkheidsclaim-drift.** FACT 06 bevriest de
  onafhankelijkheidsverklaringen vanaf ondertekening. Een latere
  "deze audit was rigoureus onafhankelijk" claim moet het opnemen
  tegen het verzegelde klantconcentratiepercentage en de
  verzegelde door-merk-betaalde opdracht-openbaarmaking.
- **Weigeringsverslag-uitwissing.** FACT 07 bevriest welke
  feitpatronen de kit weigerde; elke latere "we hebben nooit iets
  geweigerd" claim spreekt het verzegelde verslag tegen.

---

## Historische of bijna-historische gevallen waarbij de kit zou hebben geholpen

De kit zou een nuttige **forensische verankering** hebben opgeleverd
— *geen reparatie of preventie* — in gevallen die betrokken waren bij:

- **Rana Plaza (Bangladesh, 2013).** De instorting van het Rana
  Plaza gebouw doodde 1.134 kledingwerknemers en verwondde ~2.500.
  Meerdere merken wiens producten in het gebouw werden gemaakt,
  hadden Tier-1 leveranciers in het gebouw kort voor de instorting
  geauditeerd. De audits gebruikten sociale-audit checklists die
  geen structureel-engineering scope omvatten. Een verzegeld
  methodologie-feit (FACT 04) bij elk van die audits zou de
  *scope-kloof* openbaar zichtbaar hebben gemaakt bij ondertekening
  — door de gedocumenteerde beperking te verankeren waarvan
  auditprogramma's retroactief beweerden die niet te hebben gehad.
  Het zegel zou de instorting niet hebben voorkomen. Het zou hebben
  voorkomen dat de post-instorting industrieclaim dat "niemand
  het wist" epistemologisch houdbaar zou zijn.

- **Apple / Foxconn audits (2010s).** Meerdere iteraties van
  auditrapporten over Foxconn-faciliteiten die voor Apple
  produceerden werden gepubliceerd met variërende niveaus van
  bevindings-ernst, werknemers-zelfmoord-cluster context, en
  remediatie-claims. Een verzegeld ondertekenings-moment verslag
  voor elke audit zou hebben voorkomen dat latere geschillen over
  "wat de audit destijds zei" afhankelijk waren van archiefkopieën,
  gelekte kopieën, of herziene officiële releases.

- **Kobalt uit DRC (lopend).** Ambachtelijke kobaltmijnbouw in de
  Democratische Republiek Congo, inclusief door kinderen, voedt
  in batterij-toeleveringsketens voor grote elektronica- en EV-
  merken. Meerdere door merken in opdracht gegeven audits over de
  2017-heden periode hebben bevindingen van variërende ernst
  opgeleverd. De kit toegepast op elke audit bij ondertekening
  zou de audit-zoals-uitgevaardigd hebben verankerd; de kit
  toegepast op begeleidende-openbaarmaking feiten (FACT 07 C2:
  eerdere auditgeschiedenis) zou de methodologische erfenis van
  elke opeenvolgende auditor van eerdere hiaten openbaar
  zichtbaar hebben gemaakt.

- **Conflictmineralen (tin, tantaal, wolfraam, goud uit DRC en
  Grote-Meren regio).** Dodd-Frank §1502 produceerde audit-en-
  openbaar verplichtingen onder SEC regel 13p-1. Geschillen over
  de toereikendheid van smelter-niveau audits en stroomafwaartse
  chain-of-custody verificatie kwamen terug in de 2014-2022
  periode. Per-audit MYRIAM-zegels zouden elke smelter-audit bij
  ondertekening hebben verankerd.

- **Door merken in opdracht gegeven audits van Xinjiang-katoen
  toeleveringsketens (2018-heden).** Geschillen of audits
  betrouwbaar konden worden uitgevoerd onder PRC-overheidsbeperkingen
  op auditor-toegang kwamen na 2020 wijdverbreid aan de oppervlakte.
  Een verzegeld methodologie-feit (FACT 04) bij elke audit zou
  hebben verankerd welke toegangscondities daadwerkelijk van
  toepassing waren — waardoor "we hebben een rigoureuze audit
  uitgevoerd" latere claims diffbaar werden tegen verzegelde
  methodologische beperkingen op dat moment.

- **Foxconn-onderaanneming en Apple supplier-responsibility rapporten
  in de jaren 2010 — terugkerende ontdekkingen van minderjarige
  werknemers, verborgen slaapzalen, urenovertredingen.** Per-audit
  zegels zouden de *negatieve bevindingen* hebben verankerd in
  audits die niets vonden, naast de *positieve bevindingen* in
  audits die overtredingen vonden — wat retrospectief narratief
  cherry-picking vanuit beide richtingen voorkomt.

De kit zou GEEN van deze hebben voorkomen. In verschillende gevallen
was het onderliggende probleem dat de audit het misbruik *miste* —
het verzegelen van een schone audit die overtredingen had moeten
vinden produceert een permanent verslag van een gefaalde audit, wat
een ander soort nut is (het verankert de mislukking voor latere
verantwoording) maar niet hetzelfde als preventie.

---

## Wanneer deze kit gebruiken

- U bent een auditorgaan dat een "publiceer wat we ondertekenden"
  praktijk aanneemt als verdediging tegen post-ondertekenings
  verzachtingsdruk.
- U bent een NGO die een parallel toeleveringsketen-onderzoek
  uitvoert en een knoeibestendig referentiepunt wenst op het
  moment dat uw onderzoek wordt afgesloten.
- U bent een arbeidersrechten-organisatie die een auditrapport
  heeft verkregen en de huidige inhoud ervan wilt verankeren
  voordat het auditorgaan of merk de kans heeft het te herzien.
- U bent een merk dat zich heeft gecommitteerd aan transparantie
  over audits die u in opdracht heeft gegeven, en u wilt een
  verifieerbaar forensisch verslag.
- U bent een journalist, regulator, of rechtbank die de inhoud van
  een bepaalde audit op een specifiek moment verankert voor later
  procesvoering of rapportage.

## Wanneer deze kit NIET gebruiken

- **Niet gebruiken als vervanging voor door werknemers geleide
  monitoring, onafhankelijke NGO-onderzoeken, of werknemer-
  organisatie.** De kit is *additief*, geen vervanging voor enig
  van deze.
- **Niet gebruiken om te claimen dat een leverancier compliant
  is.** Een schone verzegelde audit is op zijn best één input
  voor een compliance-beoordeling. Een verzegelde audit
  behandelen als een compliance-certificaat is precies het
  legitimiteitstheater dat de constraint-first weigeringsregels
  bestaan om te voorkomen.
- **Niet gebruiken midden in audit.** Verzegelen voor
  ondertekening creëert een vals-positief "dit is het definitieve
  auditrapport" verslag.
- **Niet gebruiken om een concept te verzegelen dat u van plan
  bent te herzien.** Elke ondertekeningsversie krijgt zijn eigen
  zegel; herzieningen verwijzen naar originelen via Merkle-wortel.
- **Niet gebruiken onder druk om te verzegelen eerder dan
  ondertekening, of om een begeleidend-feit openbaarmaking weg
  te laten.** Weiger, en (als uw principaal het toestaat) verzegel
  de weigering.
- **Niet gebruiken als basis voor een "fair trade" of "ethical
  sourcing" marketingclaim zonder openbaarmaking van de verzegelde
  methodologische beperkingen naast het zegel.** Het zegel citeren
  zonder de beperkingen te citeren is de legitimiteitstheater-
  faalmodus die audit-capture definieert.
- **Niet gebruiken als uw auditorgaan structureel gecaptureerd is
  en geen bevindingen kan publiceren tegen het commerciële belang
  van het opdrachtgevend merk.** In dat geval produceert verzegelen
  een permanent openbaar verslag van de gecaptureerde audit. Dat
  kan nog steeds waardevol zijn — maar het is niet hetzelfde als
  verdedigen tegen capture.

---

## Hoe deze kit te forken voor een echte audit

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Kritieke timing:** verzegel OP het ondertekeningsmoment — d.w.z.,
wanneer de lead auditor het definitieve rapport tekent en het de
officiële positie van het auditorgaan wordt. Een zegel voor
ondertekening creëert een vals-positief "dit is de definitieve
audit" verslag. Een zegel lang na ondertekening is forensisch
zwakker tegen tussentijdse modificaties.

---

## Integratie met bestaande supply-chain audit-infrastructuur

De kit is ontworpen om samen te werken met, niet te vervangen:

- **SA8000 (Social Accountability International).** SA8000
  auditrapporten en CAP-documenten worden natuurlijk gemapt op
  FACT 03 + FACT 05. De SAAS accreditatiereferentie past in
  FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** RBA-auditbevindingen worden gemapt op FACT 03;
  RBA's audit-firma onafhankelijkheidsregels worden gemapt op
  FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** SMETA's 2-pijler
  en 4-pijler auditbevindingen worden gemapt op FACT 03; het
  Sedex-platform host het ruwe rapport — het MYRIAM-zegel
  verankert een inhoudshash van het platform-gehoste rapport.
- **amfori BSCI.** BSCI A-E rating-mechaniek wordt gemapt op
  FACT 03 certificeringsaanbeveling; merk-lidmaatschap opdracht
  wordt gemapt op FACT 06 klantconcentratie-openbaarmaking en
  FACT 07 C1.
- **FSC chain-of-custody.** Voor bosproduct-toeleveringsketens
  passen de chain-of-custody certificaten en her-audit schema's
  in de audit-venster en CAP-structuur.
- **B Lab / B Corp impact-assessment.** B Corp's certificering is
  geen derde-partij audit in de SA8000-zin, maar de impact-
  assessment verifier-rapporten kunnen onder deze kit worden
  verzegeld (met feiten her-gescoped naar impact-assessment in
  plaats van arbeidsaudit).
- **ISO 26000.** ISO 26000 is leidraad, niet certificeerbaar;
  de kit heeft geen directe ISO 26000 audit-rapport integratie
  maar de sociale-verantwoordelijkheid taxonomie kan de FACT 03
  element-structuur informeren voor interne audits.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  andere industrie-sector regimes).** Sector-specifieke
  auditprogramma's kunnen onder deze kit worden verzegeld; het
  FACT 02 audit-standaard veld identificeert welke.
- **Fair Labor Association.** FLA fabrieks-monitoring rapporten
  worden gemapt op FACT 03 + FACT 05; FLA's onafhankelijke-monitor
  raamwerk wordt gemapt op FACT 06 onafhankelijkheidsverklaringen.
- **Higg Index (Sustainable Apparel Coalition).** Faciliteit-niveau
  Higg FEM (Facility Environmental Module) en Higg FSLM (Facility
  Social & Labor Module) uitvoer kan onder deze kit worden
  verzegeld.
- **EU CSRD / CSDDD.** De EU Corporate Sustainability Reporting
  Directive en Corporate Sustainability Due Diligence Directive
  creëren openbaarmakingsverplichtingen waarvan de
  verificatiedocumenten onder deze kit kunnen worden verzegeld.
  De kit verankert de openbaarmaking-zoals-uitgevaardigd, niet
  zijn inhoudelijke toereikendheid.

## Wat deze kit NIET vervangt

- Door werknemers geleide monitoring (het meest betrouwbare
  misbruik-detectiesignaal in elke toeleveringsketen)
- Onafhankelijke NGO-onderzoeken (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium, enz.)
- Regelgevende inspectie (nationale arbeidsbureaus, OSHA-
  equivalenten, ILO Country Office programma's)
- Werknemer-organisatie en collectieve onderhandeling
- Rechtszaken, arbitrage, en remediatie onder binnenlandse
  arbeidswet
- Merk-zijde due-diligence raamwerken (UNGP, OECD Due Diligence
  Guidance, EU CSDDD)

## Licentie

Publiek domein (CC0). Fork het. Geen attributie vereist.
