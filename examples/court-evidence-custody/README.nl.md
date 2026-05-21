*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Verzegelkit voor Bewijsketen van Gerechtelijk Bewijsmateriaal

Een kant-en-klaar myriam-kit-voorbeeld voor forensische acquisitieteams —
computer-forensisch onderzoekers, technici voor mobiele-apparaat-extractie,
bewaarders van bodycambewijs, laboratoriumsupervisoren — die op het moment
van digitale-bewijsacquisitie een door Bitcoin verankerde, manipulatie-
zichtbare verzegeling willen publiceren van *welke bytes zijn verkregen*
en *wanneer*, zodat geschillen over de bewijsketen een publiek anker
hebben.

---

## Wat deze kit NIET doet (eerst lezen)

De verzegeling is een cryptografische tijdstempel van WELKE FORENSISCHE
IMAGES werden verkregen, WANNEER ze werden verkregen, door WELKE
INSTANTIE, onder WELK BEVEL, en via WELKE METHODOLOGIE. Ze kan geen
enkele andere vraag over de zaak beantwoorden. Het volgende ligt
**buiten het domein van de verzegeling**:

1. **Toelaatbaarheid volgens de Federal Rules of Evidence (of enige
   andere bewijscode).** De verzegeling verankert bytes en tijdstempels.
   Of bewijs toelaatbaar is — onder FRE 901 authenticatie, FRE 702
   getuigenverklaring van deskundigen / Daubert, FRE 403 vooroordeel-
   afweging, of enig equivalent op staatsniveau — is een juridisch-
   procedurele vraag. Een perfect verzegelde acquisitie kan nog steeds
   ontoelaatbaar worden verklaard; een onverzegelde acquisitie kan
   nog steeds worden toegelaten. De verzegeling is additief bewijs
   van integriteit, geen vervanging voor de toelaatbaarheidsbeslissing
   van de rechtbank.

2. **Of de inbeslagname rechtmatig was.** Naleving van het Vierde
   Amendement, geldigheid van het bevel, naleving van de reikwijdte,
   toepasselijkheid van de uitsluitingsregel — al deze zaken liggen
   stroomopwaarts van de verzegeling. De verzegeling legt vast dat
   de acquisitie plaatsvond onder bevel FICT-SW-2026-0188; of het
   bevel rechtmatig is uitgevaardigd en rechtmatig is uitgevoerd, is
   aan de rechtbank.

3. **Of het bewijs belastend, ontlastend of neutraal is.** De
   verzegeling verankert hashes; interpretaties van wat die hashes
   bevatten behoren tot het forensisch onderzoeksrapport, dat zijn
   eigen document is met zijn eigen ontdekkings- en bewijsregime.
   De verzegeling zal weigeren om "FACT N: de laptop van de verdachte
   bevatte belastend materiaal" te verzegelen — zie weigerregel R4.

4. **Of de bewijsketen procedureel correct is volgens het
   bewijsrecht van de toepasselijke staat.** De verzegeling legt
   het gelijktijdige bewaringsgebeurtenissenlogboek van de instantie
   (FACT 05) vast. Of dat logboek voldoet aan de vereisten voor de
   bewijsketen van een bepaalde staat, is aan de rechtbank bij de
   bewijsbehandeling.

5. **Of de forensische methodologie betrouwbaar was.** Daubert en
   diens nakomelingen (en op staatsniveau analoge regelingen zoals
   Frye, waar deze nog van toepassing is) beoordelen methodologische
   betrouwbaarheid. De verzegeling legt vast WELKE tools en versies
   werden gebruikt (FACT 04); of die tools voldoen aan de
   betrouwbaarheidsstandaard van een bepaalde rechtbank, is aan de
   rechtbank. Toolfouten zijn in eerdere zaken na de acquisitie
   gedocumenteerd; de rol van de verzegeling is om het versie- en
   binary-hash-record publiek weerlegbaar te maken, niet om voor
   de tools zelf in te staan.

6. **Of het bewijs is gemanipuleerd VÓÓR de acquisitie.** De
   verzegeling verankert bytes vanaf het moment van imaging.
   Als een verdachte, een agent of een derde partij het bronapparaat
   wijzigde voordat het werd geïmaged, kan de verzegeling dat niet
   detecteren — zij verzegelt de gewijzigde bytes met dezelfde
   integriteit als waarmee zij het origineel zou verzegelen. De
   waarde van de verzegeling begint bij de imaging-tijdstempel.

7. **Of de reikwijdte van het bevel werd gerespecteerd.** De
   bevelbijlage definieert wat mag worden verkregen; de verzegeling
   legt vast wat WERD verkregen. Of de acquisitie de reikwijdte van
   het bevel heeft overschreden is, opnieuw, een juridische vraag
   met zijn eigen remedie (uitsluitingsverzoek onder de toepasselijke
   procedure van de staat).

8. **Heridentificatie van een private partij bij het onderzoek.** De
   verzegeling weigert om enige naam, identificatie of vingerafdruk te
   publiceren die een verdachte, gedaagde, slachtoffer, getuige of
   bewoner van een gebouw kan heridentificeren. De zaaknummerverwijzing
   is het juiste handvat voor partijen met procesbevoegdheid om de
   zaak te lokaliseren.

**De sectie eerlijke-grenzen hierboven is het dragende deel van deze
kit.** Forensische teams die geloven dat verzegelen gelijkstaat aan
toelaatbaarheid, zullen het als een schild gebruiken. De kit moet
duidelijk zeggen: *dit is een onweerlegbaarheidsprimitief voor het
acquisitiemoment, geen bewijs van rechtmatige acquisitie,
methodologische deugdelijkheid of een door de rechtbank erkende
bewijsketen.*

---

## Wat deze kit MOET WEIGEREN te verzegelen

De kit is geconfigureerd om de volgende feitpatronen te verwerpen,
zelfs als een gebruiker met geldige instantiële ondertekeningsbevoegdheid
ze indient:

- **Persoonlijke identificatie van verdachten, gedaagden, slachtoffers,
  getuigen of enige private derde partij.** De zaaknummerverwijzing is
  het handvat voor partijen met procesbevoegdheid; de publieke
  verzegeling mag geen heridentificatie-index zijn.
- **Persoonlijke namen van forensische onderzoekers of ander
  instantiepersoneel in de publieke verzegeling.** Rollen zijn
  publiek; de koppelingen persoon-aan-rol worden apart verzegeld
  en zijn ontdekbaar onder gerechtelijke procedure.
- **Hashes op bestandsniveau (of vingerafdrukken) van vermoed
  seksueel kindermisbruikmateriaal, biometrische sjablonen of enige
  andere heridentificerende gegevens van kwetsbare personen — zelfs
  per hash.** Een SHA-256 van een individueel bestand is een
  permanente doorzoekbare identifier; publicatie op een publieke
  ledger kan onderwerpen heridentificeren via correlatie met privé-
  databases. Image-niveau (forensisch-image-niveau) hashes van
  volledige schijven zijn aanvaardbaar; hashes op bestandsniveau van
  dergelijk materiaal zijn NOOIT aanvaardbaar.
- **Onderzoeksbevindingen, interpretaties, opinies of conclusies
  over wat de bytes betekenen.** De verzegeling verankert WELKE
  BYTES werden verkregen en WANNEER. De interpretatie behoort tot
  het ontdekbare onderzoeksrapport, niet tot een manipulatie-
  zichtbare publieke ledger.
- **Claims van toelaatbaarheid of enige andere juridische conclusie**
  ("dit bewijs is toelaatbaar," "het bevel was rechtmatig," "de
  bewijsketen was juist onder §X.Y"). Juridische conclusies zijn
  rechterlijke functies.
- **Verzegeling door iemand anders dan de bevoegde principaal van de
  acquirerende instantie.** Een verdedigingsdeskundige mag de kit
  gebruiken om hun eigen onafhankelijke verificatie van het manifest
  te verzegelen; zij mogen niet de ORIGINELE acquisitie verzegelen
  onder de naam van de acquirerende instantie.
- **Koppelingen rol-aan-individu binnen de publieke verzegeling.**
  Koppelingen worden verzegeld in een apart begeleidend record
  (gehasht in FACT 05) onder toegangscontrole van de instantie.
- **Pre-inbeslagname- of pre-bevel-onderzoeksfeiten.** Verklaringen
  van informanten, pre-bevel-surveillance, parallel-constructie-inputs
  — geen van deze behoort op de acquisitieverzegeling. De verzegeling
  is begrensd tot de acquisitiegebeurtenis.

Een weigering kan op zichzelf als een feit worden verzegeld ("Deze
instantie verzocht om verzegeling van X; de kit weigerde volgens
weigerregel Y"), waardoor een publiek register van pogingen tot
misbruik ontstaat.

---

## Wat deze kit WEL verzegelt

8 feiten op het moment van acquisitie:

1. **Voorbeeldmelding** — verklaart de publicatie als een voorbeeld
   (echte attestaties verwijderen of vervangen dit).
2. **Acquisitiecontext** — zaakidentificatie, bevelverwijzing,
   acquirerende instantie, verzoekende autoriteit, datum/tijd van
   inbeslagname en acquisitie, locatie van acquisitie (locatie van
   inbeslagname wordt geredigeerd naar een apart verzegeld
   begeleidend record om heridentificatie van het pand te vermijden).
3. **Bewijsmanifest** — per forensisch image-item: SHA-256 hash,
   bestandsgrootte, geanonimiseerde identificatie van het bronapparaat,
   acquisitiemethode, forensisch image-formaat.
4. **Acquisitiemethodologie** — forensische toolnamen en exacte
   versies (met tool-binary-hashes), write-blocker merk/model en
   firmware, NIST CFTT verificatiereferentie, gebruikte verificatie-
   procedure, image-formaatkeuze.
5. **Bewijsketenlogboek** — tijdlijn per gebeurtenis vanaf de
   initiële inbeslagname tot het einde van imaging, bewaarders
   geïdentificeerd door ROL (niet door naam), met hashes van
   apart-verzegelde begeleidende records (rol-individu-koppeling,
   transport-GPS-log, evidence-locker-toegangslog, manipulatie-
   verzegelingsfoto's enz.).
6. **Kwalificaties van onderzoekers per rol** — gehouden certificaten,
   status van permanente educatie, eerder aantal ervaring als
   getuige-deskundige, Daubert-blootstelling, openbaarmaking van
   belangenconflicten — allemaal op rolniveau, niet persoonlijk.
7. **Begeleidende openbaarmakingen en weigeringsregister** — parallelle
   onderzoeken, hangende bevel-uitdagingen, verzoeken tot onderdrukking
   van bewijs, geldend privilege-filter / taint-team-protocol, eerdere
   acquisitiepogingen, leverancier-bugtracker-evaluatie; expliciete
   lijst van patronen die de kit weigerde te verzegelen.
8. **Ondertekeningsprincipaal** — identificatie van de acquirerende
   instantie + ondertekenaar op rolniveau (lead onderzoeker) +
   mede-ondertekenaar op rolniveau (eenheidsupervisor) + cryptografische
   sleutelinformatie.

Elk feit eindigt met de weigergate-conventie: *"Dit feit beweert
alleen X. Het beweert geen Y"* (waarbij Y de dichtstbijzijnde faalmodus
is uit de hierboven staande "NIET doet"-sectie).

---

## Waartegen deze kit verdedigt

- **Stille post-acquisitie-wijziging van een forensisch image.** Elke
  wijziging op byte-niveau in enig image produceert een andere SHA-256,
  en het post-wijziging-image zal niet verifiëren tegen het verzegelde
  FACT 03-manifest.
- **Bewering dat "andere tools werden gebruikt."** FACT 04 legt exacte
  toolversies vast met tool-binary-hashes; latere claims als "we
  gebruikten eigenlijk v4.7.0, niet v4.7.1" zijn publiek weerlegbaar.
- **Bewering dat de write-blocker niet was ingeschakeld, of dat een
  ander model werd gebruikt.** FACT 04 bevriest het write-blocker-
  manifest.
- **Wijziging van het bewaringslogboek.** Elke wijziging in de
  bewaringsgebeurtenissen-tijdlijn van FACT 05 (toevoegen, verwijderen
  of opnieuw tijdstempelen van een gebeurtenis) verandert de hash van
  FACT 05 en is publiek detecteerbaar.
- **Vervanging door de geloofsbrieven van een andere onderzoeker.**
  FACT 06 bevriest het geloofsbrievenprofiel op rolniveau op het
  moment van acquisitie.
- **Selectieve weglating van begeleidende openbaarmakingen.** FACT 07
  somt de verwachte openbaarmakingscategorieën op; een lege categorie
  moet expliciet worden geattesteerd ("geen op moment van acquisitie"),
  zodat een latere "we beseften niet dat dat relevant was" publiek
  weerlegbaar is.
- **Post-acquisitie-claims dat de onderzoeker een conflict had dat
  niet werd onthuld.** De conflictopenbaarmaking van FACT 06 wordt
  bevroren bij de acquisitie; latere uitdagingen kunnen daartegen
  worden getest.

De kit verdedigt **niet** tegen gelijktijdige corruptie — een team
dat opzettelijk valse metadata verzegelt op het moment van acquisitie
produceert een cryptografisch geldige verzegeling van valse metadata.
Het primitief is daar eerlijk over: het is een onweerlegbaarheidsprimitief
voor de gelijktijdige beweringen van de instantie, geen bewijs dat die
beweringen correct zijn.

---

## Historische of bijna-historische zaken waarbij de kit zou hebben geholpen

De kit zou een nuttig anker hebben opgeleverd — *geen oplossing* —
in eerdere zaken waar de bewijsketen van digitaal bewijs een betwist
bewijsmateriaalvraagstuk werd. Om te vermijden dat gedaagden (die
ook bij veroordeling private partijen zijn) bij naam worden genoemd,
worden deze beschreven naar zaaktype, niet naar genoemd individu:

- **De federale forensische-tool-bugcontroverse uit midden 2010**, waarin
  een breed gebruikt forensisch imaging-tool na de acquisitie bleek
  een edge-case-bug te hebben die een specifiek type bronmedium
  beïnvloedde. Een verzegeld acquisitiemanifest met bevroren tool-versie-
  en-binary-hash-gegevens zou verdediging en aanklager hebben laten
  overeenkomen over welke versie precies was gebruikt, waardoor één
  as van geschil zou zijn weggenomen.

- **Meerdere staatszaken met betwiste outputs van mobiele-apparaat-
  extracties**, waarbij de leverancier van de extractietool later een
  bugfix-patch uitbracht en de vraag werd "heeft de bug deze zaak
  beïnvloed." Een verzegeld methodologiefeit laat de vraag beantwoorden
  tegen bevroren versiegegevens, in plaats van tegen het huidige
  geheugen van de instantie over welke versie werd gebruikt.

- **Geschillen over overdrachten van bodycam-opnames** in zaken waar
  het docking-systeem van de BWC-leverancier later werd beschuldigd
  van het toestaan van wijziging van beelden tijdens transit. Een
  verzegeld manifest van het bodycam-archief op het moment van ontvangst
  door de instantie verankert welke bytes de instantie ontving van
  het docking-systeem; latere bewerkingen aan de instantiezijde zijn
  publiek detecteerbaar.

- **Hash-botsing-controverses in computer-forensische zaken**, waarin
  een verdedigingsdeskundige betoogde dat MD5 (nog steeds in gebruik
  in sommige legacy-workflows) inadequaat was. Een verzegelde acquisitie
  die zowel MD5 als SHA-256 registreert, laat de SHA-256 standhouden
  zelfs als de MD5 wordt aangevochten.

- **Geschillen over de evolutie van onderzoeksmethodologie tussen
  acquisitie en proces.** Wanneer een zaak jaren tussen acquisitie
  en proces ligt, kan de methodologie die standaard was bij acquisitie
  tegen de tijd van het proces zijn vervangen. Het verzegelde record
  laat de rechtbank de methodologie evalueren tegen de standaard die
  actueel was op het moment van acquisitie, niet tegen de latere
  standaard.

De kit zou de onderliggende geschillen over schuld of onschuld in
geen van deze zaaktypes hebben opgelost. Het zou één specifiek
bewijssub-geschil hebben opgelost: of de bytes, tools en procedures
waren wat de instantie beweert dat ze waren op het moment dat de
instantie beweert.

---

## Wanneer deze kit te gebruiken

- Uw instantie heeft een stabiele forensische SOP en wil een door
  Bitcoin verankerde publieke attestatie toevoegen als een manipulatie-
  zichtbare laag bovenop de bestaande papier-en-handtekening-bewijsketen.
- U verwacht dat deze zaak een aanzienlijke verdedigingsuitdaging zal
  inhouden van forensisch bewijs (zaak met hoge inzet, nieuwe
  methodologie, betwiste toolversies enz.).
- U kunt de vermelde feitset publiceren zonder PII of heridentificerende
  gegevens van kwetsbare personen bloot te leggen. (De weigerregels van
  de kit dwingen dit af; als uw feiten een doorbreking van een weigerregel
  zouden vereisen, gebruik de kit dan niet.)
- De algemene advocaat van de acquirerende instantie en het kantoor van
  de aanklager hebben het publicatieplan beoordeeld. Publieke publicatie
  van een zaaknummer-dragend artefact heeft implicaties voor lopende
  onderzoeken; advocaatbeoordeling is niet optioneel.
- De verdedigingsontdekkingsregels van uw rechtsgebied zijn compatibel
  met het feit dat de instantie het rol-individu-koppelingsrecord
  (gehasht in FACT 05) apart bewaart. Als uw rechtsgebied publieke
  openbaarmaking van onderzoekersnamen vereist, moet u de kit
  dienovereenkomstig wijzigen.

## Wanneer deze kit NIET te gebruiken

- **Gebruik niet als vervanging voor de bestaande bewijsketen-
  documentatie van de instantie.** Deze kit is *additief*, geen
  vervanging. Het CMS van de instantie, het bewaringslogboek en de
  ontdekkingsverplichtingen blijven ongewijzigd.
- **Gebruik niet als de acquisitie CSAM, biometrische sjablonen of
  andere heridentificerende gegevens van kwetsbare personen op
  bestandsniveau betreft.** Image-niveau-hashes van volledige schijven
  zijn aanvaardbaar; hashes op bestandsniveau van dergelijk materiaal
  zijn NOOIT aanvaardbaar, zelfs niet onder een weigerregel-vrijstelling.
  Als u geen feitenset kunt construeren zonder R3 te schenden, gebruik
  de kit dan niet.
- **Gebruik niet om te claimen dat het bevel rechtmatig was, dat de
  inbeslagname juist was, of dat het bewijs toelaatbaar is** — de kit
  kan dat niet, en weigerregel R5 zal elke dergelijke claim afwijzen.
- **Gebruik niet onder druk om te verzegelen voordat de acquisitie
  is voltooid.** Een gedeeltelijke-acquisitie-verzegeling stelt de
  toestand verkeerd voor.
- **Gebruik niet om persoonlijke namen van onderzoekers te publiceren**
  tenzij uw rechtsgebied dit specifiek vereist en uw onderzoekers
  individueel hebben ingestemd. De standaard is publicatie op rolniveau.
- **Gebruik niet in verzegelde of onder-zegel-zaken** zonder uitdrukkelijke
  rechterlijke toestemming. Het publiceren van een zaaknummer op
  Bitcoin is onomkeerbaar; als de zaak later wordt verzegeld, kan de
  publieke verzegeling niet worden ingetrokken. De kit is uitsluitend
  voor acquisities die publiek dossier zijn.
- **Gebruik niet als legitimiteitstheater.** Een verzegeling van een
  gebrekkige acquisitie is een permanent publiek register van de
  gebreken, geen verdediging ertegen. Het primitief snijdt aan twee
  kanten; dat is zijn eerlijkheid.

## Hoe deze kit forken voor een echte acquisitie

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # vervang fictieve inhoud door echte
                       # pas weigerregels R1-R8 overal toe
bash build/seal.sh     # verzegel BIJ of net na voltooiing van imaging
python3 build/verify.py
```

**Kritieke timing:** verzegel BIJ of net na het einde van imaging
(FACT 05-gebeurtenis E17 in de voorbeeld-tijdlijn). Een verzegeling
tijdens imaging creëert een gedeeltelijke-acquisitie-record; een
verzegeling veel later creëert een gat waarin de instantie de images
had kunnen wijzigen. Het juiste venster is direct nadat de image-
verificatie is voltooid voor het laatste item in de bewijsstukset.

**Kritieke beoordeling:** voer voor verzegeling de publicatie door
een tweede forensisch onderzoeker (niet de lead) en door de juridisch
adviseur van de instantie. Eenmaal verzegeld, is de publicatie
permanent.

## Integratie met bestaande bewijsketen-infrastructuur

- **Case Management System (CMS) van de instantie.** Het CMS blijft
  het primaire systeem van vastlegging van de instantie. De verzegeling
  vervangt het CMS niet; ze verbindt zich aan de bytes en methodologie
  die het CMS registreert, zodat post-hoc CMS-bewerkingen publiek
  detecteerbaar zijn.
- **Federal Rules of Evidence / Daubert / staat-bewijscodes.** De
  verzegeling draagt bij aan het FRE 901-authenticatierecord door
  manipulatie-zichtbare integriteit te bieden. Ze voldoet NIET op
  zichzelf aan FRE 702 / Daubert; methodologiebetrouwbaarheid wordt
  nog steeds getest bij de bewijsbehandeling.
- **Verdedigingsontdekking (FRCP 16, Brady, Giglio, en staatsequivalenten).**
  De begeleidende records gehasht in FACT 05 (rol-individu-koppeling,
  bewaringslogboek, manipulatie-verzegelingsfoto's enz.) blijven
  onderworpen aan normale ontdekking. De verzegeling verankert wat
  die records beweerden op het moment van acquisitie, zodat een latere
  claim "het record was destijds anders" publiek weerlegbaar is.
- **NIST Computer Forensics Tool Testing (CFTT).** De kit verwijst
  naar CFTT-verificatielogboeken in FACT 04 / FACT 05; de verwijzing
  is een hash, niet het logboek zelf, zodat CFTT-processen niet worden
  beïnvloed.
- **Door de rechtbank aangewezen neutralen en verdedigingsdeskundigen.**
  Beide kunnen de forensische images die ze in ontdekking ontvangen
  opnieuw hashen tegen het FACT 03-manifest, onafhankelijk van
  enige medewerking van de instantie. Dit is de primaire toegevoegde
  waarde van de kit voor de verdedigingszijde.
- **Hoger beroep.** Jaren later kan een forensisch beoordelaar in
  hoger beroep de oorspronkelijke acquisitiemethodologie verifiëren
  tegen het verzegelde FACT 04-record, in plaats van tegen de
  mogelijk-geëvolueerde huidige herinnering van de instantie.

## Wat deze kit NIET vervangt

- De Federal Rules of Evidence (of enige bewijscode van een staat).
- Daubert / Frye betrouwbaarheidsnormen voor getuigenissen van
  deskundigen.
- De forensische SOP en het CMS van de instantie.
- Verdedigingsontdekkingsverplichtingen onder FRCP 16 / Brady /
  Giglio / staatsequivalenten.
- Gerechtelijke bevelen, onderdrukkingsverzoeken, bewijsbehandelingen
  of enig ander door de rechtbank beheerd proces.
- NIST CFTT of enig ander tool-testregime.
- Het privilege-filter / taint-team-protocol van de instantie.

## Waarom deze kit bestaat in v0.4.0+

Dit is het 8e uitgewerkte voorbeeld dat met myriam-kit wordt
meegeleverd. Het volgt de beperking-eerst-structuur die is gevalideerd
door het autoresearch dat is gedocumenteerd in
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — de beperking-eerst-promptvariant
scoorde het hoogst op een gewogen rubriek over meerdere voorbeelddomeinen.
De openingssecties zijn de dragende delen van de kit; de manifest-
inhoud is het gemakkelijke deel.

Het ontwerp van de kit is bewust conservatief ten aanzien van
publicatie van onderzoekersnamen en agressief ten aanzien van de
disclaimer "dit vestigt geen toelaatbaarheid". De forensische
gemeenschap heeft een gedocumenteerde geschiedenis van aanvallen
op haar forensische werk; de kit kiest standaard voor de veiligere
positie voor onderzoekers. Instanties in rechtsgebieden waar publieke
persoonlijke naamsvermelding vereist is, kunnen hun fork
dienovereenkomstig wijzigen, maar de standaardweigering bevordert
de veiligheid van de onderzoeker.

## Licentie

Publiek domein (CC0). Forken vereist. Geen vermelding vereist.
