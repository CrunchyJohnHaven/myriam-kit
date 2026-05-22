*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Kit voor attestatiezegel van publieke uitgaven

Een kant-en-klaar myriam-kit voorbeeld voor gemeentelijke, statelijke,
provinciale en nationale overheden die uitvoeringsadministraties van
de begroting (contracttoekenningen, uitbetalingen, oplevering van
prestaties) cryptografisch willen verankeren op het moment van uitgifte,
zodat stille retroactieve wijziging van publieke uitgavenrecords
publiekelijk detecteerbaar wordt.

De zegel is een **forensisch anker**, geen integriteitscertificering.
Het registreert wat de financiële autoriteit op de dag van rapportage
rapporteerde, in een vorm die niet later stilletjes herzien kan worden
zonder een publiek zichtbare cryptografische discrepantie te
produceren.

---

## Wat deze kit NIET doet (lees eerst)

De zegel is een cryptografische tijdsmarkering van wat is geattesteerd.
Hij kan niet verifiëren of wat is geattesteerd **rechtmatig, eerlijk
of eerlijk** was. De volgende faalmodi zijn **buiten het domein van
de zegel**:

1. **Stroomopwaartse corruptie en steekpenningen.** Als een aanbesteding
   was gemanipuleerd, een leverancier was gekozen vanwege omkoping,
   een onderbouwing voor enige bron was gefabriceerd, of een contract
   was opgeblazen met een afgesproken percentage steekpenningen — de
   zegel verankert de zoals-geregistreerde transactie met de
   opgeblazen prijs en de begunstigde leverancier met hoge
   integriteit. De zegel observeert de output van het financiële
   systeem; het heeft geen zicht op de corruptie stroomopwaarts van
   de uitgifte. Brazilië's *Operação Lava Jato* documenteerde
   systematische ~3% door kartel beheerde steekpenningen op
   duizenden Petrobras-contracten die bij uitgifte zouden zijn
   verzegeld als geheel routinematig.

2. **Schermvennootschapsverbergen van uiteindelijk eigendom.** Een
   contract toegekend aan "Acme Construction Ltd." wordt verzegeld
   met de naam van de entiteit in het openbare register. Als "Acme"
   in feite gecontroleerd wordt door een niet-onthulde politiek
   blootgestelde persoon, of een van tientallen
   schermvennootschappen gecontroleerd door één kartel is, verankert
   de zegel de oppervlakte-entiteit. Transparantie van uiteindelijk
   eigendom is een APART regime (FATF Aanbeveling 24, EU 5AMLD/6AMLD,
   US Corporate Transparency Act) waarvan de output zijn eigen
   verzegelingsprotocol vereist.

3. **Boekhoudfraude stroomopwaarts van uitgifte.** Als de financiële
   autoriteit zelf de registratie fabriceert voordat deze wordt
   verzegeld — spookcontracten, geestwerknemers op de loonlijst,
   fictieve opleveringen van prestaties — verankert de zegel de
   fabricatie. De zegel kan niet detecteren dat de registratie vals
   is op het moment dat deze wordt geregistreerd; het kan alleen
   detecteren dat de registratie is gewijzigd NA verzegeling.

4. **Selectieve publicatie / krentenplukken.** Een financiële
   autoriteit zou een *deelverzameling* van transacties kunnen
   publiceren — de schone — en alleen die verzegelen. De zegel
   verankert wat in de publicatie zit; het verankert niet het
   universum van transacties dat in de publicatie had moeten zitten.
   FACT 07 van deze kit (begeleidende openbaarmakingen en
   weigeringsrecord) is de structurele verdediging, maar het is
   afhankelijk van de uitgevende autoriteit die eerlijk is over wat
   het ervoor kiest niet te verzegelen.

5. **Buiten-de-boeken of extrabudgettaire uitgaven.** Publieke
   uitgaven via staatsbedrijven, soevereine vermogensfondsen,
   vehikels voor speciale doeleinden of extrabudgettaire
   trustrekeningen verschijnen mogelijk niet in de begroting die de
   zegel verankert. De zegel registreert wat is gerapporteerd binnen
   het begrotingssysteem; uitgaven buiten het systeem vallen buiten
   het domein van de zegel. De geschillen van de Iraakse Coalition
   Provisional Authority (CPA) 2003-2004 betroffen ongeveer USD 9
   miljard aan contante uitbetalingen waarvan de records gedeeltelijk
   verloren waren; verzegelen van welke records bestonden op het
   moment van uitbetaling zou ze hebben verankerd, maar zou geen
   records hebben gecreëerd die de CPA niet bijhield.

6. **Druk om "uitleg" na uitgifte.** Een verzegelde overschrijding,
   een verzegelde enkelvoudige bron of een verzegeld
   wijzigingsbesluit kan later opnieuw worden vertaald met welke
   framing dan ook die politieke autoriteit wenst. De zegel
   verankert de FEITEN op de datum van uitgifte, maar het
   pre-jureert niet over de narratief die deze feiten later zullen
   ondersteunen.

7. **Afgedwongen attestatie.** Als de verantwoordelijke financiële
   principal wordt gedwongen om een attestatie te ondertekenen die
   transacties verkeerd weergeeft, verankert de zegel de afgedwongen
   attestatie met de afgedwongen handtekening. De zegel verifieert
   WIE heeft getekend (FACT 08), niet WAAROM ze tekenden. Verzegelen
   van een afgedwongen attestatie produceert een blijvende
   openbare registratie van de afgedwongen output — bruikbaar voor
   latere verantwoording, maar geen verdediging tegen dwang op het
   moment.

8. **Vergelijking tussen jurisdicties.** Een verzegelde uitgave is
   alleen leesbaar tegen het rechtsregime van haar uitgevende
   jurisdictie. "Waarom betaalde Gemeente X Y voor dienst Z toen
   Gemeente W alleen V betaalde?" is een vergelijkende analyse-vraag
   stroomafwaarts van verzegeling. Benchmarking tussen jurisdicties
   is een analytische taak op verzegelde data, geen eigenschap van
   de zegel.

**De sectie over eerlijke limieten hierboven is het dragende deel van
deze kit.** Financiële ambtenaren en politici die geloven dat
verzegelen gelijk is aan integriteit zullen deze kit als schild
gebruiken. De kit moet duidelijk zeggen: dit is een
*non-repudiation-primitief voor het moment van uitgifte*, geen bewijs
van uitgave-integriteit.

---

## Wat deze kit MOET WEIGEREN te verzegelen

De kit is geconfigureerd om de volgende feitenpatronen af te wijzen,
zelfs als een gebruiker met geldige ondertekeningsautoriteit ze
indient:

- **Namen van individuele overheidsmedewerkers onder het niveau van
  principal-ondertekening.** Geen feit mag individuele
  aanbestedingsmedewerkers, individuele schatkistklerken, individuele
  scorepanel-leden of welke natuurlijke persoon dan ook in een
  niet-publieke verantwoordingsrol noemen. Het risico op
  blootstelling aan vergelding voor lijnpersoneel weegt zwaarder dan
  het transparantievoordeel; hun identiteiten worden verzegeld in
  interne controles (FACT 05 hash van ondertekeningslog), niet in
  het lichaam van de attestatie.

- **Leveranciers-PII.** Geen feit mag bankrekeningnummers van
  leveranciers, namen van individuele leveranciersmedewerkers,
  huisadressen van leveranciers, belasting-ID's van natuurlijke
  personen van leveranciers, interne prijssamenstellingen die de
  kostenstructuur van de leverancier bevatten of welk ander
  commercieel-PII-veld dan ook bevatten waarvan publicatie de
  belangen van de leverancier schaadt zonder corruptiebestrijding
  te dienen. Dergelijke informatie kan worden GEHASHT (FACT 05),
  maar niet gepubliceerd.

- **Veiligheidsgeclassificeerde uitgaven.** Uitgaven geclassificeerd
  onder nationale veiligheidswetten zijn NIET in aanmerking voor
  verzegeling onder deze kit. Geclassificeerde behandeling is een
  ander probleem met verschillende cryptografische en juridische
  vereisten. De uitsluiting zelf wordt openbaar gemaakt in FACT 07
  R3 zodat de lezer weet dat de publicatie standaard gedeeltelijk
  is.

- **Civiele handhaving van belastingverplichtingen tegen
  geïdentificeerde natuurlijke personen.** Hoewel
  handhavingskosten publieke uitgaven zijn, wordt het noemen van
  individuele belastingbetalers onder handhaving geweigerd: de
  privacyschade weegt zwaarder dan het transparantievoordeel, en
  parallelle transparantie bestaat onder de rapportage van
  belastingrechtbanken.

- **Pre-uitgifte transacties.** Geen contract vóór formele
  toekenning; geen uitbetaling vóór formele uitgifte. Verzegelen
  van een conceptcontract of een aanhangige betaling alsof het
  uitgevoerd was, creëert valse zekerheid.

- **Verzegeling door iemand anders dan de verantwoordelijke
  financiële principal.** Een aannemer, leverancier, raadslid,
  journalist of waarnemer kan niet "de publieke uitgavenregistratie"
  verzegelen in plaats van de financiële autoriteit die deze
  uitgaf. (Zij kunnen hun eigen observaties verzegelen onder hun
  eigen principal, in een aparte publicatie.)

- **"Vrij van corruptie" framings.** De kit weigert elke framing te
  verzegelen van de vorm "deze uitgave was rechtmatig en vrij van
  corruptie" of "de aanbesteding was aantoonbaar eerlijk".
  Dergelijke claims zijn epistemisch buiten het domein van de kit.

- **Publicaties die FACT 07 begeleidende openbaarmakingen
  weglaten.** Een publicatie van transacties zonder de bijbehorende
  openbaarmakings- en weigeringsregistratie is geen legitieme
  MYRIAM-publicatie onder deze kit.

Een weigering zelf kan worden verzegeld als feit ("Deze partij
verzocht om verzegeling van X; de kit weigerde volgens weigeringsregel
Y"), wat een openbare registratie van pogingen tot misbruik creëert.
In een domein waar politieke druk op financiële ambtenaren is
gedocumenteerd, is een registratie van *geweigerde* verzoeken zelf
een integriteitssignaal.

---

## Wat deze kit WEL verzegelt

8 feiten op het moment van begrotingsuitvoering-attestatie:

1. **Voorbeeldmelding** — verklaart de publicatie als voorbeeld
   (echte attestaties verwijderen of vervangen dit).
2. **Jurisdictie en wettelijke basis** — welke overheidsentiteit
   uitgeeft, onder welke wettelijke autoriteit, in welke fiscale
   periode.
3. **Toewijzing of begrotingsreferentie** — de specifieke regels in
   de aangenomen begroting die worden uitgevoerd, met hashes van het
   begrotingsinstrument en eventuele wijzigingen / overdrachten /
   herprogrammeringen die zijn toegepast.
4. **Contract- of uitbetalingsmanifest** — registratie per
   transactie: bedrag, juridische entiteitsnaam van leverancier
   (geen individuele PII), doel, datum, aanbestedingstype,
   toekenningsbasis, hash van contractdocument.
5. **Hashes van ondersteunende documenten** — SHA-256 van offertes,
   evaluaties, uitgevoerde contracten, wijzigingsbesluiten,
   betalingsaanvragen, opleveringsformulieren van prestaties,
   schatkistgrootboekregistraties, controle-ondertekeningslogs.
   Alleen hashes, geen inhoud — om commerciële en persoonlijke PII
   te beschermen terwijl re-hash-verificatie mogelijk wordt.
6. **Audit- en toezichtsstaat** — welk inspecteur-generaal-orgaan
   jurisdictie heeft, welke hoogste auditinstelling, welk
   vervolgingsorgaan jurisdictie heeft over corruptiedelicten,
   audittermijnen, huidige stand van zaken van eventuele lopende
   beoordelingen.
7. **Begeleidende openbaarmakingen en weigeringsregistratie** —
   aanhangige aanbestedingsprotesten, aanhangige interne
   onderzoeken, openstaande FOI-verzoeken, afwijkende beoordelingen,
   bekende overschrijdingen van begrotingsposten; expliciete lijst
   van patronen die de kit weigerde te verzegelen.
8. **Ondertekenende principal** — verantwoordelijke financiële
   ambtenaar + rol + wettelijke verantwoording + medeondertekenaars
   onder dubbele controle; wat elke ondertekenaar persoonlijk
   attesteert en niet attesteert.

Elk feit eindigt met de weigeringspoort-conventie: *"Dit feit stelt
alleen X. Het stelt niet Y"* (waarbij Y de dichtstbijzijnde faalmodus
is uit de sectie "NIET doet").

---

## Waartegen deze kit verdedigt

- **Stille post-uitgifte herziening van contractbedragen.** Elke
  wijziging van enig bedrag in FACT 04 produceert een andere
  SHA-256, andere Merkle-wortel, faalt OTS-verificatie.
- **Stille leverancierssubstitutie.** "Leverancier A" vervangen door
  "Leverancier B" op een reeds uitgegeven contract is detecteerbaar
  vanuit de verzegelde bytes.
- **Antidatering van wijzigingsbesluiten.** FACT 04 bevriest de
  datum en motivatie van het wijzigingsbesluit bij uitgifte; elke
  latere claim van "dit was altijd de afgesproken scope" moet het
  opnemen tegen de verzegelde wijzigingsbesluit-registratie.
- **Stille verdwijning van ongunstige transacties.** Alle
  transacties uitgegeven in de periode staan in FACT 04 onder één
  Merkle-wortel. Het publiceren van een deelverzameling is
  detecteerbaar vanuit de blad-hash-lijst.
- **Onderdrukking van begeleidende openbaarmaking.** FACT 07
  bevriest de stand van aanhangige protesten, aanhangige
  onderzoeken en openstaande FOI op het moment van attestatie. Elke
  latere claim "wij hebben nooit van dat protest gehoord" is
  publiek vergelijkbaar.
- **Drift van auditjurisdictie.** FACT 06 bevriest welke organen
  toezichtsjurisdictie hebben over de verzegelde transacties. Een
  latere claim dat een bepaalde IG "geen autoriteit had" moet het
  opnemen tegen de verzegelde jurisdictie-registratie.
- **Uitwissing van weigeringsregistratie.** FACT 07 registreert wat
  de kit weigerde te verzegelen; elke latere claim "wij hebben
  nooit iets geweigerd" spreekt de verzegelde registratie tegen.

---

## Historische gevallen waarbij de kit zou hebben geholpen

De kit zou een nuttig **forensisch anker** hebben geproduceerd —
*geen oplossing, geen preventie, geen substituut voor strafrechtelijke
vervolging* — in gedocumenteerde publieke gevallen van stille
retroactieve modificatie van publieke uitgavenrecords:

- **Brazilië — *Operação Lava Jato* / Petrobras-lineage (2014-2021).**
  Braziliaanse federale openbare aanklagers documenteerden een
  kartel van grote bouwbedrijven die meer dan een decennium lang
  steekpenningen betaalden van gemiddeld ~3% op Petrobras- en
  andere federale infrastructuurcontracten, met de steekpenningen
  doorgesluisd naar politici en naar de eigen prijscoördinatie van
  het kartel. De contracten zoals uitgegeven leken routinematig; de
  corruptie was stroomopwaarts van uitgifte. Een verzegelingskit zou
  Lava Jato NIET hebben voorkomen (de steekpenningen waren in de
  prijs ingebed VOORDAT het contract de zegel bereikte), maar zou
  de contractvoorwaarden bij uitgifte hebben verankerd — wat de
  latere forensische reconstructie van "wat elk contract eigenlijk
  zei toen het werd ondertekend" enorm goedkoper zou maken. De
  onderzoekskosten van Lava Jato waren grotendeels de kosten van
  het opnieuw samenstellen van tijdlijnen uit inconsistente
  gearchiveerde records.

- **Europese Unie — geschillen over regionale ontwikkelingsfondsen
  (meerdere lidstaten, 2010s-2020s).** Jaarlijkse rapporten van het
  Europese Rekenkamer hebben herhaaldelijk materiële foutpercentages
  geïdentificeerd in uitgaven van Europese Structurele en
  Investeringsfondsen (ESIF) en Cohesiefonds, in sommige jaren
  hoger dan de materialiteitsdrempel. Geschillen over "wat werd
  daadwerkelijk geclaimd" versus "wat werd daadwerkelijk geleverd"
  komen terug omdat de claim-documentatie kan worden herzien tussen
  indiening en audit. Per-uitgifte MYRIAM-verzegeling van de
  claim-zoals-ingediend zou de inhoud van elke claim bij indiening
  hebben verankerd, waardoor "wat de begunstigde claimde op dat
  moment" wordt gescheiden van "wat de post-audit-reconstructie
  concludeerde".

- **Irak — uitbetalingen van Coalition Provisional Authority (CPA),
  2003-2004.** De CPA betaalde ongeveer USD 9 miljard contant uit
  vanuit het Development Fund for Iraq met documentatie die de
  Special Inspector General for Iraq Reconstruction (SIGIR) en
  latere auditrapporten karakteriseerden als substantieel
  onvolledig. Geschillen over uitbetalingsrecords bestaan twee
  decennia later nog steeds. Verzegelen op het moment van
  uitbetaling zou geen records hebben gecreëerd die de CPA niet
  bijhield — maar waar wel een record bestond (handgeschreven
  grootboeken, gedateerde overdrachtsautorisaties), zou een
  gelijktijdige zegel die record's byte-wijze staat op het moment
  van uitgifte hebben verankerd, waardoor "de record op dat moment"
  wordt gescheiden van "de record zoals later gereconstrueerd".

- **Griekenland — herzieningen van staatsschuld en
  publieke-uitgavenrapportage (2009-2010).** Eurostat-audits in
  2009-2010 documenteerden substantiële herzieningen van eerder
  gerapporteerde Griekse fiscale data, waarbij de methodologie van
  de herziening zelf werd betwist. Verzegelen van kwartaalrapporten
  van uitgaven op het moment van oorspronkelijke publicatie zou de
  *delta* tussen originele en herziene rapporten publiek
  vergelijkbaar hebben gemaakt in plaats van reconstrueerbaar
  alleen door archiefvergelijking. De zegel zou het onderliggende
  methodologische geschil niet hebben voorkomen, maar zou elk
  gerapporteerd kwartaal op het moment van het originele rapport
  hebben verankerd.

- **Verenigd Koninkrijk — pandemie-aanbesteding (2020-2022).**
  Rapporten van het UK National Audit Office en parlementaire
  commissies identificeerden aanbestedingsprocessen tijdens
  2020-2021 waarbij contracten werden toegekend onder
  noodvoorzieningen met verminderde concurrentie en verminderde
  documentatie; sommige toekenningen werden later gewijzigd,
  geannuleerd of geschikt. Per-uitgifte verzegeling van elke
  noodaanbestedingstoekenning zou de toekenningsmotivatie en
  voorwaarden op het moment van toekenning hebben verankerd, wat
  latere wijzigingen tot een publiek zichtbare delta zou maken in
  plaats van een stil gewijzigde registratie.

- **Zuid-Afrika — staatscaptatie-tijdperk-contracten van publieke
  ondernemingen (~2010-2018).** De Zondo-commissie documenteerde
  contracten bij verschillende staatsbedrijven (Eskom, Transnet,
  Denel) waarvan de documentatie verschillend onvolledig, herzien
  of betwist was. Verzegelen van elke contracttoekenning bij
  uitgifte zou de zoals-toegekende staat van de registratie hebben
  verankerd, waardoor latere forensische-reconstructie-outputs
  worden gescheiden van de gelijktijdige registratie.

De kit zou de onderliggende corruptie in geen van de bovenstaande
gevallen hebben voorkomen. In verschillende gevallen was het
onderliggende probleem dat de corruptie *stroomopwaarts van uitgifte*
was — de zegel verankert het corrupte contract met hoge integriteit,
wat een ander soort nuttigheid is (forensisch anker voor latere
verantwoording) maar niet hetzelfde als preventie. In andere
gevallen (CPA-contant, off-budget-uitgaven) was het onderliggende
probleem dat de te verzegelen records niet bestonden of niet werden
bijgehouden — de kit kan geen records creëren die de autoriteit niet
produceerde.

Deze historische gevallen worden alleen genoemd met verwijzing naar
publiek gedocumenteerde bevindingen (rechtsverslagen, rapporten van
parlementaire commissies, publicaties van auditorganen). Er wordt
geen claim gemaakt over een individu; de gedocumenteerde
institutionele bevindingen staan op de publieke registratie.

---

## Wanneer deze kit te gebruiken

- Uw jurisdictie heeft een gevestigd
  begrotingsuitvoeringsrapportageproces en wil een onveranderlijk
  publiek anker toevoegen.
- U verwacht post-uitgifte controle (FOI-verzoeken, audit,
  monitoring door de civiele samenleving, journalistiek onderzoek)
  en wilt een tegen manipulatie bestendig referentiepunt.
- U heeft de wettelijke autoriteit onder transparantie- /
  openbare-records-wet om de genoemde feitenset te publiceren, met
  de privacy/veiligheid-uitsluitingen geëerbiedigd.
- U opereert onder een wettelijk auditregime (inspecteur-generaal,
  hoogste auditinstelling) en wilt elke kwartaalafsluiting
  verankeren voordat de auditcyclus deze bereikt.
- U publiceert onder de Open Contracting Data Standard of IATI en
  wilt een cryptografische aanvulling op portaal-gebaseerde
  publicatie.

## Wanneer deze kit NIET te gebruiken

- **Gebruik niet als substituut voor wettelijke audit,
  inspecteur-generaal-beoordeling, vervolgingsonderzoek of
  monitoring door de civiele samenleving.** De kit is *aanvullend*,
  geen vervanging.
- **Gebruik niet als legitimiteitscertificaat.** Een verzegelde
  uitgavenregistratie is geen corruptie-vrij certificaat. Het zo
  behandelen is precies de faalmodus die de
  constraint-first-structuur van de kit moet voorkomen.
- **Gebruik niet midden in een periode.** De kit is voor het moment
  van formele uitgifte (kwartaalafsluiting, contracttoekenning,
  mijlpaal-uitbetaling). Verzegelingen midden in de periode
  creëren misleidende referentiepunten.
- **Gebruik niet om te claimen dat de uitgave rechtmatig, eerlijk
  of niet-corrupt was** — de kit kan dat niet.
- **Gebruik niet om geclassificeerde uitgaven, individuele
  werknemers-PII of commerciële leveranciers-PII te verzegelen.**
  De kit weigert deze patronen; pogingen creëren een
  weigeringsregistratie (FACT 07).
- **Gebruik niet om pre-uitgifte concepten te verzegelen.** Concepten
  kunnen worden verzegeld onder een ander attestatietype ("concept
  voor commentaar, niet uitgegeven"), maar niet onder het
  uitgiftetype van deze kit.
- **Gebruik niet onder druk om FACT 07 openbaarmakingen weg te
  laten.** Weiger, en verzegel de weigering.
- **Gebruik niet als uw financiële autoriteit is overgenomen.** Een
  verzegelde frauduleuze uitgave is een blijvende publieke
  registratie van de fraude, geen verdediging ervan. Het primitief
  snijdt aan beide kanten; dat is zijn eerlijkheid.

---

## Hoe deze kit voor een echte attestatie te forken

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # vervang fictieve inhoud door echte
bash build/seal.sh         # verzegel op het moment van formele uitgifte
python3 build/verify.py    # bevestig
```

**Kritieke timing:** verzegel OP het moment van formele uitgifte —
d.w.z. het moment waarop de verantwoordelijke financiële principal
de kwartaalafsluiting ondertekent, het moment waarop een contract
formeel wordt toegekend, of het moment waarop een uitbetaling
formeel wordt uitgegeven. Een zegel vóór formele uitgifte creëert
een fout-positieve "dit is de officiële registratie"-referentie. Een
zegel lang na formele uitgifte is forensisch zwakker tegen
tussenliggende modificaties.

**Cadans:** de kit is ontworpen voor kwartaalattestaties als
standaard. Subkwartaal-cadansen (maandafsluiting, per-transactie
verzegeling) worden ondersteund door opnieuw te draaien met de
juiste scope; de zegel van een enkele transactie met hoge waarde is
een legitieme toepassing.

---

## Integratie met bestaande publieke-financiën-infrastructuur

De kit is ontworpen om samen te werken met, niet te vervangen:

- **Open Contracting Data Standard (OCDS) v1.1.5.** De vijf
  publicatiepunten (planning, tender, toekenning, contract,
  uitvoering) sluiten natuurlijk aan op FACT 03 (planning →
  toewijzing), FACT 04 (tender, toekenning, contract, uitvoering →
  transactiemanifest) en FACT 05 (hashes van ondersteunende
  documenten). De OCDS JSON-export zelf wordt verzegeld in FACT 05
  (controledocumenten). Een jurisdictie die OCDS-publicatie
  uitvoert, kan MYRIAM-verzegeling toevoegen als een
  cryptografische laag bovenop haar bestaande portaal.

- **International Aid Transparency Initiative (IATI)-standaard
  v2.03.** Voor uitgaven die geheel of gedeeltelijk worden
  gefinancierd door externe hulp, kan IATI XML worden verzegeld
  als controledocument; de zegel biedt een cryptografische
  aanvulling op het HTTP-gebaseerde publicatiemodel van het IATI
  Register.

- **Open Government Partnership (OGP) verbintenissen.** OGP
  Nationale Actieplannen bevatten vaak verbintenissen voor fiscale
  transparantie; MYRIAM-verzegeling operationaliseert een
  "tegen-manipulatie-bestendige publicatie"-verbintenis op een
  manier die onafhankelijk verifieerbaar is door de civiele
  samenleving zonder vertrouwen in het overheidsportaal te
  vereisen.

- **OECD Aanbeveling over Publieke Integriteit (2017).** De kit
  ondersteunt Aanbeveling 4 (open overheidsdata over publieke
  financiën in machine-leesbare, tijdige vorm) door de data
  cryptografisch verankerd en machineleesbaar te maken.

- **VN-verdrag tegen Corruptie (UNCAC), in het bijzonder Artikelen
  9 (aanbesteding) en 13 (deelname van de samenleving).** De kit
  biedt een forensisch primitief dat de transparantieverplichtingen
  van Artikel 9 en het toezicht van de civiele samenleving van
  Artikel 13 ondersteunt.

- **Hoogste Auditinstellingen (SAI's) — INTOSAI-kader.** SAI's die
  onder INTOSAI-standaarden (ISSAI) opereren, kunnen verzegelde
  publicaties consumeren als bewijs met hoge integriteit; de
  SHA-256-hashes in FACT 05 zijn dezelfde hashes die de
  e-audit-tools van de SAI kunnen herberekenen.

- **Inspecteur-generaal-bureaus.** Binnenlandse IG-bureaus met
  jurisdictie over de verzegelde uitgaven (FACT 06) kunnen de
  documentlichamen waarvan de hashes zijn verzegeld in FACT 05
  dagvaarden; de zegel verbindt de onder dagvaarding ontvangen
  documentlichamen aan de lichamen die bij uitgifte bestonden.

- **Vrijheid-van-informatie en openbare-records-wetten.** De zegel
  ontslaat de uitgevende autoriteit niet van voortdurende
  FOI-verplichtingen; in feite maakt het selectieve FOI-respons
  detecteerbaar als een afwijking van de verzegelde registratie.
  FACT 07 C3 verankert openstaande FOI-verzoeken op het tijdstip
  van attestatie.

- **Registers van uiteindelijk eigendom (FATF Aanbeveling 24,
  EU-AML-richtlijnen, US Corporate Transparency Act).**
  Uiteindelijk-eigendom-data wordt NIET verzegeld onder deze kit
  (FACT 04 haalt leveranciersidentiteit alleen uit geregistreerde
  juridische-entiteitsnaam). Een openbaarmaking van uiteindelijk
  eigendom is een apart verzegelingsregime dat een parallelle
  publicatie kan produceren die wordt aangehaald via Merkle-wortel.

- **Door rechtbank beheerde transparantie (rapportage van
  rechterlijke uitgaven, procedures voor activarecuperatie).**
  Outputs van corruptie-gerelateerde rechtsprocedures vallen niet
  binnen de scope van deze kit, maar kunnen worden verzegeld onder
  parallelle attestatietypes.

## Wat deze kit NIET vervangt

- Wettelijke begrotingsuitvoering-audit door
  inspecteur-generaal-organen
- Hoogste-auditinstelling-beoordeling (GAO, NAO, TCU, CAG, AGN,
  BRH, Cour des comptes, equivalent)
- Vervolgingsonderzoek naar corruptiedelicten (nationale
  anticorruptie-aanklagers, UNCAC Artikel 36-organen)
- Civiele samenleving en journalistieke onderzoeksverslaggeving
- Klokkenluiderskanalen en beschermde-openbaarmaking-regimes
- Openbaarmaking van uiteindelijk eigendom
- Internationale peer review (OECD, IMF Fiscal Transparency
  Evaluation, EU-semester, IATI-register)
- Door rechtbank beheerde activarecuperatie-procedures

De zegel is een forensisch primitief dat de kosten verlaagt en de
betrouwbaarheid verhoogt van alle bovenstaande. Het is geen, en kan
geen vervanging zijn voor enige hiervan.

---

## Licentie

Publiek domein (CC0). Forken. Geen attributie vereist.
