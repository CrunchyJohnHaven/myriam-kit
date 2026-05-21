*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Carbon Attestation Seal Kit

Een kant-en-klaar myriam-kit voorbeeld voor ontwikkelaars van koolstofprojecten,
externe verificateurs en registers die een Bitcoin-verankerde,
manipulatiedetecterende verzegeling willen publiceren van een uitgifte van een
koolstofkrediet, een verificatie van verwijdering of een emissieattestatie-event
op het exacte moment van certificering — zodat stille post-uitgifte-modificaties
publiekelijk detecteerbaar worden.

---

## Wat dit kit NIET doet (lees eerst)

Koolstofkredieten zijn politiek en wetenschappelijk omstreden. De verzegeling
is een cryptografisch tijdstempel van wat is geattesteerd. Het kan niet
verifiëren of wat is geattesteerd echte klimaatwinst weerspiegelt. De
volgende faalmodi liggen **buiten het domein van de verzegeling**, en zij
vertegenwoordigen het merendeel van de betekenisvolle integriteitsvragen over
koolstofkredieten:

1. **Additionaliteit.** De verzegeling kan niet verifiëren dat de
   gecrediteerde activiteit zonder koolstoffinanciering niet zou hebben
   plaatsgevonden. Het contrafeitelijke is in principe onwaarneembaar. De
   verzegeling legt het additionaliteitsargument van de methodologie vast;
   zij beoordeelt het niet.

2. **Permanentie.** De verzegeling kan niet verifiëren dat opgeslagen
   koolstof opgeslagen zal blijven gedurende de relevante tijdshorizon
   (decennia tot eeuwen voor boskoolstof, geologische tijdschalen voor
   sommige verwijderingen). Recente literatuur (Badgley et al. 2022,
   Patterson et al. 2022) toont aan dat bufferpools wezenlijk zijn uitgeput
   door werkelijke omkeringsgebeurtenissen. Een verzegeld krediet is een
   verzegelde *bewering* van permanentie onder gespecificeerde aannames over
   de bufferpool, niet een bewijs van permanentie.

3. **Lekkage.** De verzegeling kan niet verifiëren dat vermeden emissies in
   het projectgebied niet eenvoudigweg worden verplaatst naar een
   niet-projectgebied. Methodologie-standaard lekkage-aftrekken zijn
   regulatoire tijdelijke oplossingen, geen metingen. De verzegeling
   verankert de toegepaste aftrek; zij certificeert deze niet als correct.

4. **Co-baten.** De verzegeling kan geen aanspraken op
   gemeenschapsontwikkeling of biodiversiteit verifiëren. Co-baten worden
   typisch zelfgeattesteerd en door verificateurs beoordeeld, niet
   gecontroleerd op de diepte van koolstofkwantificering. De verzegeling
   verankert de document-hashes; meer niet.

5. **Toereikendheid van Free-Prior-and-Informed-Consent (FPIC).** Inheemse-
   en gemeenschapstoestemming in koolstofprojecten heeft een
   gedocumenteerde geschiedenis van faalmodi (afgedwongen toestemming,
   toestemming van niet-representatieve organen, post-hoc "toestemming" via
   compensatie). De verzegeling verankert FPIC-documentatie en hashes van
   het klachtenlogboek; zij kan niet certificeren dat het
   toestemmingsproces oprecht was.

6. **Onafhankelijkheid van de verificateur.** Verificateurs worden betaald
   door projectontwikkelaars. Dit is een structureel belangenconflict dat
   geen enkel accreditatieschema heeft opgelost. De verzegeling verankert
   de onafhankelijkheidsverklaring van de verificateur; zij certificeert
   niet dat de verklaring waar is.

7. **Dubbeltelling tussen registers of met nationale inventarissen.** De
   verzegeling verankert de momentopname van de registerstaat op het moment
   van de attestatie. Indien dezelfde activiteit ook wordt meegeteld door
   een gastland voor zijn NDC, of ook wordt geclaimd op een ander register,
   maakt de verzegeling de registerstaat vergelijkbaar maar voorkomt zij de
   dubbeltelling niet.

8. **Juistheid van de koperclaim.** Een koper die een verzegeld krediet
   terugtrekt ter ondersteuning van een "netto nul"- of "koolstofneutraal"-
   claim doet een stroomafwaartse bewering die de verzegeling niet dekt.
   De verzegeling legt de terugtrekking vast; de geldigheid van de
   marketingclaim van de koper is een afzonderlijke, stroomafwaartse
   kwestie.

9. **Juistheid van de methodologie.** De verzegeling legt de
   methodologie-citatie + document-hash vast die van kracht is op het
   moment van de attestatie. Zij beweert niet dat de methodologie
   wetenschappelijk valide is. Methodologische hervorming vindt plaats;
   verzegeling onder een methodologie die later wordt herzien maakt de
   kredieten niet met terugwerkende kracht "fout" of "juist" — het
   verankert welke regels golden bij de uitgifte.

**De sectie over eerlijke beperkingen hierboven is het dragende deel van dit
kit.** Bijna elke betekenisvolle integriteitsvraag over een koolstofkrediet
leeft in een van die negen categorieën. De verzegeling sluit het smalle
resterende gat: stille retroactieve wijziging van bytes-op-record. Dat gat
is reëel en het waard om te sluiten, maar het is klein in vergelijking met
het omstreden terrein.

---

## Wat dit kit MOET WEIGEREN te verzegelen

Het kit is geconfigureerd om de volgende feitelijke patronen af te wijzen,
zelfs als een gebruiker met geldige ondertekenbevoegdheid ze indient:

- **"Additionaliteit" gesteld als feit.** Additionaliteit als feit
  verzegelen creëert een misleidend record. Het kit aanvaardt
  methodologie-conforme additionaliteits*argumenten*, niet
  additionaliteits*claims*.
- **"Permanentie" zonder expliciete openbaarmaking van tijdshorizon en
  bufferpool.** Permanentie zonder die parameters verzegelen verhult waar
  het project zich daadwerkelijk aan committeert.
- **"Geen lekkage" zonder projectspecifieke meting.** Methodologie-
  standaard lekkage-aftrekken zijn geen meting en de verzegeling zal ze
  niet als zodanig behandelen.
- **Kwantificaties die zijn gegenereerd voordat externe verificatie is
  voltooid.** Een pre-verificatie verzegeling creëert een vals-positief
  "geverifieerd" record.
- **Uitgifte-records voor kredieten die ook op een ander register zijn
  uitgegeven zonder expliciete cross-register openbaarmaking** in FACT 06.
- **Terugtrekkingsrecords die de begunstigde van de terugtrekking niet
  noemen.** Anonieme terugtrekking ondermijnt de publiek-goed-functie van
  terugtrekking; het kit weigert dit mogelijk te maken.
- **FPIC-claims die niet worden ondersteund door attesteerbare hashes van
  documentatie.**
- **Artikel 6.2 / 6.4 uitgifte zonder een hash van een
  toestemmingsbrief (LoA) van het gastland** verzegeld in FACT 06.
- **Verzegeling op verzoek van enige partij anders dan de
  projectontwikkelaar + verificateur gezamenlijk** voor dat project.
- **Co-batenclaims verzegeld als "gecertificeerd"** wanneer zij slechts
  "zelfgeattesteerd en door verificateur beoordeeld" zijn.

Een weigering zelf kan worden verzegeld als feit ("Deze partij heeft
verzegeling van X verzocht; het kit weigerde conform weigeringsregel Y"),
waarmee een openbaar record van pogingen tot misbruik wordt gecreëerd.

---

## Wat dit kit WEL verzegelt

8 feiten op het moment van de attestatie:

1. **Voorbeeldmededeling** — verklaart de publicatie als een voorbeeld
   (echte attestaties verwijderen of vervangen dit).
2. **Projectidentificatie** — projectnaam, register, register-project-ID,
   methodologie-citatie + hash, hash van geografische begrenzing,
   vintage, projectontwikkelaar, co-batenclaim, FPIC-status.
3. **Emissie- of verwijderings­kwantificering** — bruto tonnen CO2e,
   basislijn-contrafeitelijk, lekkage-aftrek, bufferpool-
   bijdrage, onzekerheidsaftrek, netto te crediteren claim, hashes
   van elke numerieke invoer.
4. **Meetmethodologie** — bronnen van remote-sensingdata,
   bodemverificatie-plot-netwerk, hash van het instrumentkalibratielogboek,
   hash van het classificatiemodel + nauwkeurigheidsstatistieken,
   koolstofdichtheidsmodel, codeherkomst + reproduceerbaarheidsmanifest.
5. **Externe verificatie** — verificateursorganisatie, accreditatie,
   hash van onafhankelijkheidsverklaring, eerdere betrokkenheden met
   ontwikkelaar, hash van het fotoarchief van het locatiebezoek, geopperde
   + opgeloste bevindingen, hash van het verificatieadvies-document.
6. **Uitgifte- of terugtrekkingsrecord** — uitgifteverzoek +
   goedkeuring, totaal uitgegeven kredieten, serienummerreeks,
   cross-register-verklaring, hash van de gastland-LoA waar van
   toepassing, serienummerreeksen voor terugtrekking + begunstigden
   (voor terugtrekkingsattestaties), hashes van momentopnames van de
   registerstaat.
7. **Begeleidende openbaarmakingen en weigeringsrecord** — lopende
   methodologische geschillen, niet-permanentie-risico,
   lekkage-voorbehouden, additionaliteits-voorbehouden, hashes van FPIC +
   klachtenlogboek, voorbehoud co-baten, eerdere betrokkenheid van de
   verificateur; expliciete lijst van patronen die het kit weigerde te
   verzegelen.
8. **Ondertekenend principaal** — projectontwikkelaar + verificateur +
   register, elk met rol + reikwijdte van de attestatie + cryptografische
   sleutelinformatie.

Elk feit eindigt met de weigeringspoort-conventie: *"Dit feit bevestigt
alleen X. Het bevestigt niet Y"* (waar Y de dichtstbijzijnde faalmodus is
uit de "DOET NIET"-sectie hierboven).

---

## Waartegen dit kit verdedigt

- **Stille post-uitgifte-modificatie van kwantificering.** Elke
  geheeltallige wijziging aan FACT 03 produceert een andere SHA-256, een
  andere Merkle-wortel, mislukt OTS-verificatie.
- **Stille methodologie-substitutie.** FACT 02 bevriest de
  methodologie-citatie + document-hash bij uitgifte. Het inwisselen door
  een register van een andere methodologie-versie na uitgifte is
  publiekelijk vergelijkbaar.
- **Stille basislijnherziening.** De hash van de basislijnscenario-
  modeluitkomst in FACT 03 is verzegeld. Een post-hoc basislijn-
  herafstelling om meer kredieten te produceren is detecteerbaar.
- **Stille substitutie van verificateurs-advies.** De hash van het
  adviesdocument in FACT 05 is verzegeld. Een herschrijving na uitgifte
  van "de verificateur heeft altijd X gezegd" is detecteerbaar.
- **Stille verdwijning van terugtrekkingsrecord.** De momentopname van de
  registerstaat in FACT 06 is verzegeld. Kredieten die op mysterieuze
  wijze weer "beschikbaar" worden nadat ze als teruggetrokken zijn
  gemarkeerd, zijn detecteerbaar tegen de verzegeling.
- **Stille substitutie van FPIC-document.** De FPIC- + klachtenlogboek-
  hashes in FACT 07 zijn verzegeld. Vervangende toestemmingsdocumenten
  zijn detecteerbaar.
- **Stille verwijdering van onwelgevallige openbaarmakingen.** De status
  van begeleidende openbaarmakingen in FACT 07 is verzegeld. Stille
  verwijdering van een niet-permanentie-voorbehoud van een
  projectbeschrijvingspagina is detecteerbaar tegen de verzegelde bytes.

Het kit verdedigt NIET tegen de onderliggende integriteitsvragen
(additionaliteit, permanentie, lekkage, FPIC-toereikendheid,
onafhankelijkheid van de verificateur, geldigheid van de methodologie).
Dat zijn de moeilijkere problemen en de verzegeling kan ze niet oplossen.

---

## Historische of bijna-historische gevallen waarbij het kit zou hebben geholpen

Het kit zou een nuttig anker hebben geproduceerd — *geen oplossing* — in
gevallen waarbij sprake was van stille retroactieve modificatie van
koolstof-attestatierecords. Het zou de onderliggende omstreden vragen in
geen van deze gevallen hebben OPGELOST.

- **Het onderzoek uit 2023 door The Guardian / Die Zeit / SourceMaterial
  naar Verra-regenwoudkredieten.** Onderzoekers vonden dat de meeste
  bestudeerde REDD+-projecten kredieten produceerden waarvan de geclaimde
  vermeden emissies niet overeenkwamen met latere remote-sensing-
  heranalyse. Het onderzoek vereiste reconstructie van projectdocumentatie
  tegen retroactief gewijzigde registerrecords. Een verzegelde publicatie
  bij elke uitgiftecyclus zou ondubbelzinnige referentiebytes hebben
  geboden voor wat bij elke cyclus is geattesteerd — geen oplossing voor
  het onderliggende basislijnprobleem, maar een schone forensische
  tijdlijn.

- **De Californische bos-offset-omkeringsgebeurtenissen uit 2020.**
  Meerdere bos-koolstof-projecten onder de nalevingsmarkt van Californië
  ondergingen bosbrandomkeringen die de voor hen apart gezette
  bufferpoolreserve overtroffen. Het reconstrueren van wat elk project bij
  uitgifte had geattesteerd over niet-permanentie-risico (versus wat het
  project later beweerde te hebben geattesteerd) is momenteel moeilijk.
  Per-vintage-verzegelingen zouden de attestaties van vóór de brand
  canoniek opvraagbaar hebben gemaakt.

- **Diverse REDD+-projecten waarbij
  referentieregio-basislijnmethodologieën retroactief zijn bekritiseerd
  als opgeblazen.** Een verzegelde hash van het methodologiedocument op het
  moment van uitgifte zou hebben verankerd welke methodologieversie
  daadwerkelijk van toepassing was op welke vintage, waardoor de
  verdediging "de methodologie was altijd X" vergelijkbaar wordt.

- **Verschillende geschillen over Australian Carbon Credit Unit (ACCU)
  human-induced regeneration-projecten (2022–2023).** Academische kritiek
  over of regeneratie daadwerkelijk projectgeïnduceerd was versus
  natuurlijk veranderde in geschillen over wat het project oorspronkelijk
  had geclaimd. Verzegelde attestaties zouden ondubbelzinnige
  per-vintage-records hebben verschaft.

- **Records van terugtrekkingen van koolstofcompensaties die van status
  zijn veranderd.** Verschillende gedocumenteerde gevallen waarin
  terugtrekkingsrecords op vrijwillige-markt-registers van status leken te
  veranderen na terugtrekking (om een andere reden "teruggetrokken" worden
  of na het feit aan een andere begunstigde worden toegeschreven). Per-
  terugtrekking-verzegelingen zouden de staat op het moment van de
  oorspronkelijke terugtrekking hebben verankerd.

In geen van deze gevallen zou het kit hebben opgelost of het onderliggende
krediet werkelijke klimaatwinst vertegenwoordigde. Het kit verankert
records; dat is alles wat het doet.

---

## Wanneer dit kit gebruiken

- U bent een projectontwikkelaar die een manipulatiedetecterende
  attestatie wil publiceren naast uw standaard register-indiening.
- U bent een externe verificateur die wil dat uw verificatieadvies
  publiekelijk verifieerbaar is tegen een latere weergave door een register
  van "wat de verificateur heeft gezegd."
- U bent een register dat een extra integriteitslaag wil bieden op
  uitgifte- en terugtrekkingsrecords — in het bijzonder voor projecten in
  jurisdicties met zwakkere rechtsstatelijke vangnetten voor
  registerintegriteit.
- U bent een journalist, academicus of NGO die een meerjarige
  longitudinale analyse van koolstofprojecten uitvoert en een publiek
  anker nodig heeft om de latere weergaven van een project te vergelijken
  met de bytes ten tijde van uitgifte.
- U bent een koper (zakelijk netto-nul, naleving door luchtvaart) die wil
  dat de kredieten die u terugtrekt worden teruggetrokken tegen
  publiekelijk verankerde records, zodat uw stroomafwaartse marketingclaim
  kan worden gecontroleerd tegen een stabiele forensische tijdlijn.

## Wanneer dit kit NIET gebruiken

- **Niet gebruiken als vervanging voor geaccrediteerde externe
  verificatie.** De verzegeling vervangt ISO 14064-3-verificatie niet;
  zij stelt zich daarmee samen.
- **Niet gebruiken om te claimen dat een project "additioneel,"
  "permanent," of "lekkage-arm" is.** De verzegeling kan die eigenschappen
  niet verifiëren. De verzegeling gebruiken om ze te beweren is misbruik.
- **Niet gebruiken als legitimatietheater voor kredieten van lage
  kwaliteit.** Een cryptografische verzegeling op een krediet van lage
  kwaliteit is een permanent forensisch record van de lage kwaliteit, niet
  een verdediging ervan. Het primitieve werkt beide kanten op; dat is haar
  eerlijkheid.
- **Niet gebruiken om kredieten te verzegelen die ook door een gastland
  worden meegeteld voor zijn NDC** zonder expliciete openbaarmaking van
  corresponderende aanpassing in FACT 06.
- **Niet vóór verificatie verzegelen.** Een verzegeling vóór het oordeel
  van de verificateur definitief is, creëert een vals-positief
  "geverifieerd" record.
- **Niet gebruiken onder druk om een begeleidende feitelijke
  openbaarmaking weg te laten in FACT 07** (lopende methodologische
  geschillen, FPIC-kwesties, eerdere betrokkenheid verificateur). Weiger,
  en verzegel de weigering.
- **Niet gebruiken als marketingkenmerk.** "MYRIAM-verzegeld" is geen
  kwaliteitsclaim; het is een forensische eigenschap. Het behandelen als
  een kwaliteitskenmerk is precies het misbruik dat het beperking-eerst-
  ontwerp probeert te voorkomen.

## Hoe dit kit te forken voor een echte attestatie

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Kritieke timing:** verzegel OP of NA het officiële uitgifte-evenement
van het register, NIET ervoor. Een pre-uitgifte-verzegeling creëert een
vals-positief "uitgegeven" record. Voor terugtrekkingsattestaties,
verzegel OP het moment van terugtrekking. Voor doorlopende
bewakingsattestaties tussen uitgifte en terugtrekking, verzegel bij elke
door verificateur ondertekende bewakingscyclus — maar maak in FACT 01
duidelijk dat de attestatie een bewakingsupdate is, geen uitgifte.

## Integratie met bestaande koolstofinfrastructuur

- **Verra (VCS).** De URL of IPFS-CID van de verzegelde publicatie kan
  worden gekoppeld aan de VCS-projectpagina als aanvullende documentatie.
  De verzegeling vervangt de VCS-verificatie niet; zij stelt zich daarmee
  samen.
- **Gold Standard.** Hetzelfde integratiemodel — aanvullende attestatie
  naast Gold Standard uitgiftedocumentatie. De nadruk van Gold Standard op
  documentatie van co-baten + gemeenschapsbaten sluit natuurlijk aan op
  FACT 02 + FACT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Hetzelfde integratiemodel.
- **Artikel 6.4 (Paris Agreement Supervisory Body-mechanisme).** De
  gastland-LoA-hash in FACT 06 is specifiek ontworpen voor de
  traceerbaarheid van Artikel 6.4 / 6.2 ITMO. Openbaarmaking van
  corresponderende aanpassing is een door weigeringspoort beheerd veld.
- **EU ETS MRV.** Voor uitgevers in de nalevingsmarkt sluit de hash van
  het MRV-rapport aan op de hash van het kwantificeringsspreadsheet in
  FACT 03. De verzegeling stelt zich samen met — vervangt niet — het
  geverifieerde emissierapport van de exploitant.
- **CDP (Carbon Disclosure Project) bedrijfsopenbaarmaking.** Voor
  bedrijven die teruggetrokken kredieten in CDP-indieningen aanhalen, is
  het terugtrekkingsrecord verzegeld onder FACT 06 het canonieke
  opvraagbare record. Taalgebruik in CDP-indieningen kan verwijzen naar
  de Merkle-wortel of IPFS-CID van de verzegelde publicatie.
- **ISO 14064-2 (project) / ISO 14064-3 (verificatie) / ISO 14065
  (accreditatie).** De verzegeling legt de conformiteitsbevestiging +
  hashes vast; zij voert de conformiteitsbeoordeling niet uit.
- **TSVCM Core Carbon Principles (CCP) / ICVCM-labels.** Wanneer een
  project is beoordeeld aan de hand van de ICVCM CCP's, kan de hash van
  het beoordelingsresultaat als begeleidende openbaarmaking in FACT 07
  worden verzegeld.

## Wat dit kit NIET vervangt

- Geaccrediteerde externe verificatie (ISO 14064-3)
- Werkstromen voor register-uitgifte en -terugtrekking
- Beoordeling van methodologische naleving
- Gastland-autorisatieprocessen voor Artikel 6-transacties
- MRV-processen voor de nalevingsmarkt (EU ETS, California Cap-and-Trade,
  RGGI, etc.)
- Vrijwillige-markt-integriteitsinitiatieven (ICVCM, VCMI)
- Onafhankelijke klimaateffectbeoordeling

## Waarom dit kit bestaat vanaf v0.4.0+

Dit is het 7e uitgewerkte voorbeeld dat met myriam-kit wordt meegeleverd.
Het kit bestaat omdat koolstofkredietmarkten een goed gedocumenteerde
geschiedenis hebben van stille retroactieve modificatie —
methodologieën die retroactief opnieuw worden geïnterpreteerd, basislijnen
die retroactief worden herzien, terugtrekkingsrecords die van status
veranderen, en projectopenbaarmakingen die in stilte onwelgevallige
voorbehouden in de loop van de tijd laten vallen.

De verzegeling sluit het *smalle* gat van bytes-op-het-moment-van-
attestatie. Zij behandelt — en kan — de grotere omstreden vragen van
additionaliteit, permanentie, lekkage of authenticiteit van co-baten niet
behandelen. De eerlijke kadrering van deze beperking door het kit is
haar belangrijkste eigenschap.

## Licentie

Publiek domein (CC0). Fork het. Geen attributie vereist.
