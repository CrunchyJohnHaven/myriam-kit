*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Kit voor voor-certificeringsverzegeling van verkiezingstellingen

Een kant-en-klaar myriam-kit-voorbeeld voor county-stembureaus, statelijke
verkiezingsautoriteiten en waarnemers van verkiezingsintegriteit die een
op Bitcoin verankerd, manipulatie-detecterend zegel van een telling willen
publiceren op het exacte moment van certificering.

**Sluit** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Wat deze kit NIET doet (lees dit eerst)

Het zegel is een cryptografische tijdstempel van wat werd gecertificeerd.
Het kan niet verifiëren of wat werd gecertificeerd correct was. De volgende
faalmodi liggen **buiten het domein van het zegel**:

1. **Compromittering van stemmachines.** Als de firmware is gemanipuleerd
   of stemtotalen verkeerd zijn geteld, verankert het zegel een verkeerd
   getal met hoge integriteit. Het zegel observeert de uitvoer van het
   tabulatiesysteem; het heeft geen zicht in het systeem zelf.

2. **Onderdrukking van kiezers / structurele uitsluiting van stemrecht.**
   Sluitingen van stembureaus, ongelijkheden in identificatiewetgeving,
   bias in afwijzingspercentages van poststembiljetten en zuiveringen van
   het kiezersregister liggen stroomopwaarts van de certificering. Het
   zegel registreert getelde stembiljetten, niet stembiljetten die geteld
   hadden moeten worden.

3. **Verkiezingsdesinformatie.** Het zegel oordeelt niet over beweringen
   over de verkiezing die door kandidaten, media of platforms worden
   gedaan. Een verzegelde certificering kan even gemakkelijk worden geciteerd
   in een desinformatienarratief als ter verdediging daartegen. Cryptografische
   tijdstempels zijn inhoudsneutraal.

4. **Pré-certificeringsfraude tijdens stembiljetinzameling of telling.**
   Onregelmatigheden bij ballot-harvesting, manipulatie van afgiftebussen,
   onderbrekingen van de bewaarketen tijdens het telvenster — al deze
   gebeuren vóór het zegelmoment. Het zegel kan ze niet met terugwerkende
   kracht detecteren.

5. **Dwang op de certificerende autoriteit.** Een onder dwang afgegeven
   certificering produceert een cryptografisch geldig zegel van een
   onder dwang afgedwongen uitslag. Het zegel verifieert dat een
   functionaris heeft getekend, niet waarom.

6. **Onjuiste certificeringen die later nooit worden gecorrigeerd.** De
   waarde van het zegel hangt af van een later waarheidsvindingsproces
   (audit, hertelling, rechtszaak) waarmee het zegel kan worden vergeleken.
   Als zo'n proces nooit plaatsvindt, blijft het zegel het enige record
   en kan het de fout verharden.

7. **Statistische anomalieën en patroondetectie.** Het zegel markeert
   geen onwaarschijnlijke marges, geografische anomalieën of afwijkingen
   van de wet van Benford. Dat zijn analytische taken op de verzegelde
   gegevens, geen eigenschappen van het zegel.

8. **Lagere races op het stembiljet met dunne audit-sporen.** Kleinere
   races hebben zwakkere hertellings-triggers; één enkel zegel kan niet
   zinvol alle races op een stembiljet dekken zonder afbakening per race.

**De bovenstaande sectie over eerlijke beperkingen is het dragende deel
van deze kit.** Functionarissen die geloven dat verzegeling gelijkstaat
aan legitimiteit zullen het als schild gebruiken. De kit moet onomwonden
zeggen: dit is een *non-repudiation-primitief voor het certificeringsmoment*,
geen bewijs van verkiezingscorrectheid.

---

## Wat deze kit MOET WEIGEREN te verzegelen

De kit is geconfigureerd om de volgende feitenpatronen af te wijzen,
zelfs als een gebruiker met geldige tekenbevoegdheid ze indient:

- **Identificatie van individuele kiezers.** Geen enkel feit mag een
  kiezer noemen, een stembiljet aan een kiezer koppelen, of enig veld
  blootleggen dat een persoon opnieuw zou kunnen identificeren.
- **Beslissingen over handtekening-matching per stembiljet.** PII-zwaar;
  verzegeling creëert permanente records van beslissingen die later
  kunnen worden aangevochten.
- **Elk feit waarvan de publicatie een kwetsbare kiezer zou identificeren.**
  Inclusief resultaten op kiesdistrict-niveau in districten die zo klein
  zijn dat de stemkeuze afleidbaar is (doorgaans <50 stembiljetten).
- **Tellingen die verzegeld worden voordat alle stembiljetten zijn
  geteld.** De kit weigert partiële tellingen die als "de telling" worden
  gepresenteerd. Pré-certificering betekent *alle stembiljetten geteld,
  vóór officiële certificering* — niet *tijdens het tellen*.
- **Voorlopige of voorwaardelijke certificeringen.** Het zegel moet een
  feit weerspiegelen, geen conditioneel.
- **Tellingen die cohorten met lopende rechtszaken uitsluiten** zonder
  een expliciet verzegeld begeleidingsfeit dat de uitsluiting onthult.
- **Verzegeling door iemand anders dan de certificerende autoriteit**
  voor die jurisdictie.

Een weigering kan zelf als feit worden verzegeld ("Deze autoriteit vroeg
verzegeling van X; de kit weigerde op grond van weigeringsregel Y"),
waardoor een openbaar record van poging tot misbruik ontstaat.

---

## Wat deze kit WEL verzegelt

8 feiten op het moment van certificering:

1. **Voorbeeld-kennisgeving** — verklaart de publicatie tot voorbeeld
   (echte attestaties verwijderen of vervangen dit).
2. **Identificatie van de jurisdictie** — county, verkiezingsdatum,
   certificerende autoriteit, certificerende functionarissen met naam
   + rol.
3. **Gecertificeerde telling** — per-race per-kandidaat stemtotalen +
   over-/onder-stemmen + write-ins.
4. **Stembiljet-administratie en -reconciliatie** — totaal uitgebracht,
   totaal getabuleerd, totaal afgewezen per categorie, modus-uitsplitsing,
   noemer geregistreerde kiezers.
5. **Apparatuur- en audit-spoor-manifest** — tabulator-model + firmware-hash,
   CVR-bestandshash, hash van stembiljet-beeldarchief, hash van bewaarlog,
   hash van handtekening-matching-beleid.
6. **Drempels en triggers op moment van certificering** — geldige
   handtekening-matching-drempel, hertellings-trigger-drempels, werkelijke
   marges per race, RLA seed-commitment.
7. **Begeleidingsverklaringen en weigeringsrecord** — lopende rechtszaken,
   anomalieën na de telling die worden onderzocht, uitgesloten cohorten,
   afwijkende bestuursleden; expliciete lijst van patronen die de kit
   heeft geweigerd te verzegelen.
8. **Tekenend principaal** — identificatie van het Board of Canvassers
   + naam en partij van elke ondertekenaar + cryptografische sleutelinfo.

Elk feit eindigt met de conventie van de weigeringspoort: *"Dit feit
beweert alleen X. Het beweert niet Y"* (waarbij Y de dichtstbijzijnde
faalmodus is uit de bovenstaande sectie "NIET doet").

---

## Waartegen deze kit verdedigt

- **Stille post-certificering-revisie van stemtotalen** — elke integer-
  wijziging van FACT 03 produceert een andere SHA-256, andere Merkle-root,
  faalt OTS-verificatie.
- **"Gevonden stembiljetten" die stil worden geabsorbeerd** — FACT 04
  reconciliatie-rekenkunde wordt vastgesteld bij certificering.
- **Beweringen over firmware-substitutie** — FACT 05 bevriest het
  apparatuur-manifest bij certificering.
- **Substitutie van audit-artefacten na certificering** — FACT 05's
  hash-manifest vangt elke wijziging na certificering op aan CVR,
  stembiljet-beelden, bewaarlogs of handtekening-matching-beleid.
- **Herdefiniëring van drempels en triggers** — FACT 06 bevriest de
  geldende regels bij certificering (handtekening-matching-drempel,
  hertellings-triggers, RLA-risicolimiet).

## Historische of bijna-historische gevallen waarbij de kit zou hebben geholpen

De kit zou een nuttig anker hebben geleverd — *geen oplossing* — in zaken
zoals:

- **Antrim County, Michigan (2020).** Aanvankelijke onofficiële resultaten
  toonden een kandidatenwissel die later werd gecorrigeerd naar de
  tegenovergestelde uitkomst. Een pré-correctie-zegel zou een openbare
  referentie hebben geboden voor wat de oorspronkelijke aankondiging zei
  versus wat de correctie zei, beide cryptografisch geattesteerd.
- **Maricopa County, Arizona (2020–2022).** Meerdere iteraties van
  hertelde/heronderzochte totalen circuleerden. Een certificeringsmoment-
  zegel zou een ondubbelzinnig referentiepunt hebben geboden waartegen
  elke volgende telling kon worden gediff't.
- **Florida 2000 (Bush v. Gore canvass).** Gecertificeerde totalen per
  county verschoven onder hertellingsdruk; een pré-hertellings-zegel per
  county zou hebben bewaard wat elke county had gecertificeerd vóórdat
  handmatige hertellingsprocedures begonnen.
- **Diverse buitenlandse verkiezingen met gedocumenteerde post-
  certificerings-"correcties".** Jurisdictie-agnostisch.

De kit zou NIET de onderliggende geschillen over machine-integriteit in
2020 hebben opgelost, evenmin als geschillen over poststembiljet-beleid,
of enige verkiezing waarbij de kernvraag een betwist feit betrof in
plaats van een betwist record.

## Wanneer deze kit te gebruiken

- Uw jurisdictie heeft een stabiel, geaudit certificeringsproces en wil
  een onveranderlijk openbaar anker toevoegen.
- U verwacht post-certificeringsonderzoek en wilt een manipulatie-
  detecterend referentiepunt.
- U heeft de juridische bevoegdheid om de genoemde feitenset te
  publiceren zonder PII bloot te leggen.
- U heeft een parallel audit- of RLA-proces zodat het zegel kan worden
  vergeleken met de uitvoer van waarheidsvinding.

## Wanneer deze kit NIET te gebruiken

- **Gebruik dit niet als vervanging van risk-limiting audits, handmatige
  hertellingen of post-verkiezings-audits.** Deze kit is *additief*, geen
  vervanging.
- **Gebruik dit niet als de certificerende functionaris niet de
  daadwerkelijke besluitvormer is** (creëert valse toeschrijving).
- **Gebruik dit niet midden-tabulatie.** De kit is specifiek voor het
  certificeringsmoment. Zegels op partiële tellingen creëren misleidende
  referentiepunten.
- **Gebruik dit niet om te beweren dat de verkiezing eerlijk, accuraat
  of legitiem was** — dat kan het niet.
- **Gebruik dit niet onder druk om eerder dan het certificeringsmoment
  te verzegelen, of om een begeleidingsfeit-onthulling weg te laten.**
  Weiger, en verzegel de weigering.
- **Gebruik dit niet als legitimiteitstheater.** Een zegel van een
  frauduleuze telling is een permanent openbaar record van fraude, geen
  verdediging ervan. Het primitief snijdt aan twee kanten; dat is zijn
  eerlijkheid.

## Hoe deze kit te forken voor een echte certificering

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # vervang fictieve inhoud door echte
bash build/seal.sh     # verzegel OP of na de officiële certificeringshandtekening
python3 build/verify.py
```

**Kritieke timing:** verzegel OP het certificeringsmoment, NIET ervoor.
Een zegel vóór officiële certificering creëert een vals-positief record
van "dit is het officiële resultaat". Een zegel daarna is conventionele
non-repudiation.

## Integratie met bestaande verkiezingsinfrastructuur

- **State Boards of Elections / EAC-certificering.** De kit publiceert
  naast het officiële certificeringsdocument. Het vervangt niet de
  statutaire certificering.
- **Risk-limiting audits.** De CVR-hash in FACT 05 is dezelfde hash die
  het RLA-instrument consumeert. Het zegel bindt de geauditede CVR aan
  het gecertificeerde totaal.
- **Hertellingsprocedures.** Een hertelling die wordt geactiveerd onder
  statelijk recht produceert een NIEUWE verzegelde feitenset (andere
  tijdstempel, andere hashes, dezelfde jurisdictie). Beide zegels
  bestaan naast elkaar; geen van beide overschrijft de ander. De diff
  tussen zegels is het openbare record van wat de hertelling heeft
  gewijzigd.
- **Election Markup Language (EML) en Common Data Format (CDF).**
  Feitenlichamen moeten afleidbaar zijn uit de bestaande EML/CDF-
  uitvoer van de jurisdictie om de kit data-formaat-agnostisch te
  houden.
- **Tweepartijdige board-of-canvassers-ondertekening.** Multi-signature-
  variant aanbevolen voor jurisdicties met partij-gebalanceerde
  canvass-bestuursorganen.

## Wat deze kit NIET vervangt

- Statutaire certificering onder statelijk verkiezingsrecht
- EAC-certificering van het stemsysteem
- Risk-limiting audits / handmatige hertellingen
- Hertellingsprocedures en post-verkiezings-audits
- Rechterlijke bevelen of verkiezingsbetwistings-litigatie

## Waarom deze kit bestaat in v0.3.0+

Dit is het 6e uitgewerkte voorbeeld dat met myriam-kit wordt meegeleverd.
De kit werd geproduceerd via een Karpathy-stijl autoresearch-proces
gedocumenteerd in `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Drie
promptvarianten (imitation / first-principles / constraint-first)
produceerden parallelle kit-omtreken; de constraint-first-variant
scoorde het hoogst op een gewogen rubric, en de finale kit synthetiseert
zijn structuur met de cohesie van de imitation-variant en het operationele
detail van de first-principles-variant.

Het autoresearch zelf wordt gedocumenteerd als een prompt-patroon in
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` voor toekomstig gebruik.

## Licentie

Publiek domein (CC0). Fork het. Geen attributie vereist.
