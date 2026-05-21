*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Kit voor pre-registratie van geneesmiddelenonderzoek

Een kant-en-klaar myriam-kit-voorbeeld voor sponsors van klinische
proeven en academische onderzoekers die een proef op een
manipulatie-detecterende, op Bitcoin verankerde manier willen
pre-registreren **in aanvulling op** registratie bij ClinicalTrials.gov,
EU CTR of andere jurisdictionele registers.

## Waarom *aanvullend* pre-registreren onder MYRIAM?

Bestaande trial-registers (ClinicalTrials.gov, EU CTR, ISRCTN) hebben
gedocumenteerde zwakheden op het gebied van integriteit:

- ClinicalTrials.gov staat sponsors toe om eindpunten,
  steekproefomvang-berekeningen en analyseplannen **na** de
  oorspronkelijke registratie aan te passen, waarbij de wijzigingsdata
  in het register zichtbaar zijn, maar de *inhoudelijke* wijzigingen
  niet altijd cryptografisch verankerd zijn.
- Verschillende grote studies (Goldacre et al., 2019; Mathieu et al.,
  2009) hebben systematisch post-hoc verwisselen van eindpunten
  binnen het vakgebied gedocumenteerd.
- Redactionele handhaving door tijdschriften (CONSORT, ICMJE) vangt
  een aantal gevallen op; veel glippen erdoor.

Een MYRIAM-zegel dicht dit gat. De Merkle-root + Bitcoin OTS-ontvangst
maakt elke post-hoc-wijziging van het *pre-geregistreerde* primaire
eindpunt, statistische analyseplan of subgroepenlijst cryptografisch
detecteerbaar. Het zegel is forensisch moeilijker met terugwerkende
kracht aan te passen dan het register zelf.

Deze kit is een **aanvulling op**, geen vervanging van, jurisdictionele
registers. Een echte proef moet zich registreren in het juiste
register EN onder MYRIAM verzegelen.

## Waartegen deze kit verdedigt

Historische sterftegevallen waar dit bij had geholpen:

- **Vioxx (Merck, 2004)**: cardiovasculaire incidenten waren een
  pre-geregistreerd eindpunt in de APPROVe-trial, maar de gepubliceerde
  analyse gebruikte een cutoff die de schijnbare schade
  minimaliseerde. Een zegel van de pre-geregistreerde cutoff zou de
  post-hoc cutoff-wijziging publiekelijk detecteerbaar hebben gemaakt
  vóór het gepubliceerde artikel.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: negatieve trialgegevens
  over suïcidaliteit bij adolescenten werden via post-hoc analyse
  geherinterpreteerd. Verzegelde pre-registratie van de eindpunten
  zou de herinterpretatie publiekelijk detecteerbaar hebben gemaakt.
- **Meerdere oncologische trials** waarin overlevingseindpunten
  werden vervangen door surrogaateindpunten (progressievrije
  overleving, responspercentage) toen overlevingsvoordeel uitbleef.

**Faalmodi die het zegel direct vangt:**

- **Verwisselen van eindpunten**: post-hoc promotie van een secundair
  eindpunt tot "primair" wanneer het werkelijke primaire eindpunt
  faalt. FACT 05 van het zegel bevat het pre-geregistreerde primaire
  eindpunt; het gepubliceerde primaire eindpunt moet overeenkomen.
- **Cherry-picken van uitkomsten**: selectief alleen de analyses
  rapporteren die werkten. FACT 06 bevat het volledige
  pre-geregistreerde analyseplan; de gepubliceerde analyses moeten
  alle pre-geregistreerde analyses bevatten.
- **Post-hoc subgroep-mining**: claimen dat "het geneesmiddel werkt
  voor subgroep X" na het zien van de gegevens. FACT 07 bevat de
  pre-geregistreerde subgroepenlijst; elke andere subgroep moet
  als post-hoc worden gelabeld.
- **Aanpassen van de steekproefomvang**: vergroten van de steekproef
  na het zien van interim-trends. FACT 06 bevat de
  pre-geregistreerde steekproefomvang en powerberekening.
- **Stille verwijdering van onwelkome secundaire eindpunten**:
  FACT 05 legt de secundaire eindpunten van tevoren vast voor
  hiërarchisch testen; elke herordening of verwijdering is
  detecteerbaar.
- **Onderdrukking van negatieve resultaten**: FACT 08 bevat de
  publicatieverplichting; niet publiceren binnen het vastgelegde
  venster is publiek zichtbaar.

**Faalmodi die NIET worden gedekt:**

- Wangedrag bij de uitvoering van de trial zelf (vervalste gegevens,
  frauduleuze inschrijving). Het zegel verankert het *plan*, niet de
  *uitvoering*.
- Selectieve rapportage in publicaties die alle pre-geregistreerde
  analyses bevatten maar deze gunstig interpreteren. Het zegel vangt
  wat ontbreekt; het kan interpretatieve vertekening niet vangen.
- Patiëntschade tijdens de trial zelf. Het zegel is regulatoir en
  bewijsrechtelijk; het vermindert het risico op trialuitvoering
  niet.

## Wanneer deze kit gebruiken

U zou overwegen een pre-registratie te verzegelen als:

- U een klinische proef sponsort of uitvoert — fase 1 tot en met 4 —
  die zal worden gebruikt om medische of regulatoire beslissingen
  te onderbouwen.
- U bereid bent publiekelijk gebonden te zijn aan het
  pre-geregistreerde ontwerp, de eindpunten en het analyseplan.
- U met de consequentie kunt omgaan: als de trial faalt op zijn
  pre-geregistreerde eindpunten, kunt u niet stilletjes een ander
  eindpunt dat wel werkte met terugwerkende kracht invoegen.
- U deelneemt aan een onderzoekscultuur (academische geneeskunde,
  coöperatieve groepen, NIH-gefinancierd onderzoek) waarin
  pre-registratie-integriteit steeds vaker wordt geëist.

Deze kit is *bijzonder* waardevol voor:

- Door onderzoekers geïnitieerde trials bij academische instellingen
  (waar druk vanuit de sponsor om eindpunten post-hoc te wijzigen
  reëel is, maar de academische onderzoeker een reputatiebelang
  heeft om weerstand te bieden).
- Open-science trials en burgerwetenschappelijke studies.
- Trials voor het herbestemmen van geneesmiddelen bij kleine
  biotech-bedrijven zonder lange staat van dienst inzake
  trialuitvoering.
- Elke trial bedoeld om regulatoire indieningen te onderbouwen
  waarbij toekomstige "dat hebben we nooit gezegd"-argumenten
  zouden kunnen worden gemaakt.

## Wanneer deze kit NIET gebruiken

Gebruik deze kit NIET als:

- Het trialprotocol nog werkelijk in beweging is. Pre-registreer
  wanneer het protocol definitief is, niet eerder.
- U niet kunt toezeggen om de resultaten te publiceren ongeacht
  de richting. Het zegel maakt niet-publiceren publiekelijk
  detecteerbaar.
- De trial competitieve industriële geheimhouding betreft die u
  ervan weerhoudt het analyseplan openbaar te maken. Het zegel
  maakt het analyseplan een permanent openbaar verslag; er is geen
  manier om iets privé te verzegelen.
- U geen juridische en ethische goedkeuring van het protocol heeft.
  Het zegel registreert het protocol zoals U het hebt verzegeld;
  het kan niet met terugwerkende kracht door een METC of
  ethiekcommissie worden onderschreven.

## Hoe deze kit te forken voor een echte pre-registratie

```bash
# 1. Kopieer dit voorbeeld
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Vervang fictieve inhoud met de echte trialprotocolinhoud.
# Elk feit komt overeen met een onderdeel van een standaard pre-registratie:
$EDITOR facts/01_example_notice.txt   # VERVANG door echte voorbladverklaring
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMAIR + SECUNDAIR + EXPLORATIEF
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Werk site/index.html bij om de echte trial weer te geven.

# 4. Verzegel (VÓÓR inclusie begint, VÓÓR database-lock):
bash build/seal.sh

# 5. Verifieer lokaal:
python3 build/verify.py

# 6. Publiceer:
#    - Publiceer de zegel-URL op de website van de trialsponsor EN
#    - Voeg de IPFS CID toe aan het ClinicalTrials.gov-record van de
#      trial in het veld "Description" of "References", zodat het
#      registerverslag verwijst naar het cryptografische zegel.
```

**KRITIEKE TIMING**: het zegel moet worden aangemaakt VÓÓR inclusie
begint. Een pre-registratie die wordt verzegeld nadat de eerste
patiënt is geïncludeerd, is forensisch veel zwakker. Idealiter
verzegel je op het moment van METC-goedkeuring.

## Integratie met bestaande pre-registratie-infrastructuur

De kit is ontworpen om te combineren, niet te vervangen:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: registreer de trial in
  het jurisdictionele register zoals vereist. Vervolgens, in het
  veld "Description" of "References" van het register, link naar
  de MYRIAM-verzegelde publicatie.
- **OSF (Open Science Framework)**: OSF ondersteunt pre-registratie
  met datumstempels maar niet met Bitcoin-verankering. Het
  MYRIAM-zegel kan als aanvullend bestand worden gekoppeld aan de
  OSF-registratiepagina, wat zowel een datumstempel als een
  Bitcoin-verankering oplevert.
- **AsPredicted.org**: vergelijkbaar — link het MYRIAM-zegel als
  aanvullende URL.
- **Tijdschriften**: sommige tijdschriften (bijv. Trials, BMJ Open)
  accepteren pre-registratie-URL's als onderdeel van indiening.
  Voeg de MYRIAM-zegel-URL toe naast de register-URL.

## Wat ontvangers (regelgevers, tijdschriftbeoordelaars, meta-analytici) krijgen

Een trial die onder MYRIAM is pre-geregistreerd biedt beoordelaars:

1. **Cryptografisch bewijs dat het protocol op een specifiek moment
   is afgerond.** Beoordelaars kunnen het zegelmoment verifiëren
   via de OTS-ontvangst.
2. **Bytewise stabiliteit van de protocoltekst.** Beoordelaars die
   de gepubliceerde methode-sectie vergelijken met het
   pre-geregistreerde ontwerp, kunnen dat karakter-voor-karakter
   doen.
3. **Detectie van het verwisselen van eindpunten.** Een eenvoudige
   diff tussen het verzegelde FACT 05 en het gepubliceerde primaire
   eindpunt onthult elke vervanging.
4. **Detectie van afwijking van het analyseplan.** Een eenvoudige
   diff tussen het verzegelde FACT 06 en de gepubliceerde
   statistische methoden onthult wijzigingen.
5. **Detectie van selectieve subgroeprapportage.** Het verzegelde
   FACT 07 bevat alle pre-geregistreerde subgroepen; elke subgroep
   in de publicatie die niet in het zegel staat, moet als post-hoc
   worden gelabeld.

Dit maakt systematische review en meta-analyse aanzienlijk
gemakkelijker dan de huidige praktijk.

## Wat deze kit NIET is

- Geen vervanging voor METC- / ethische commissiegoedkeuring.
- Geen vervanging voor registratie bij een jurisdictioneel register.
- Geen garantie dat de trial zoals gepland zal worden uitgevoerd.
- Geen manier om patiëntinformed consent of andere ethische
  documenten te verankeren (die hebben hun eigen
  verzegelingsmechanisme nodig).
- Geen bescherming tegen kritiek op het trialontwerp na publicatie.

## Een opmerking over publicatie van negatieve resultaten

Verplichting #1 in FACT 08 ("publicatie ongeacht richting") is de
verplichting met de hoogste impact op sterfte in het zegel. De
historische onderdrukking van negatieve trialresultaten (met name
voor psychiatrische geneesmiddelen bij adolescenten, oncologische
geneesmiddelen bij ouderen, en cardiovasculaire geneesmiddelen bij
vrouwen) heeft aannemelijk bijgedragen aan duizenden vermijdbare
sterftegevallen over decennia door overvoorschrijving op basis
van vertekende werkzaamheidsschattingen.

Een verzegelde verplichting om negatieve resultaten te publiceren
is, op zichzelf, een van de volksgezondheidsacties met de hoogste
hefboomwerking die een sponsor kan ondernemen. Het zegel biedt
externe verantwoording voor die verplichting op een manier die
zelfgehandhaafde publicatiebeleidslijnen niet bieden.

## Afsluiting

Pre-registratie van geneesmiddelenonderzoek onder MYRIAM is weinig
extra werk voor de sponsor: ~30 minuten om de feiten in te vullen,
~10 seconden om te verzegelen. De verantwoording die het toevoegt
is asymmetrisch: kleine kosten voor eerlijke trialuitvoering, grote
beperking op de post-hoc manoeuvres die hebben bijgedragen aan
historische vertekeningen in de bewijsbasis.

Als u sponsor of hoofdonderzoeker bent en deze kit overweegt, is de
kit publiek domein (CC0). Gebruik hem. Pas hem aan. Verbeter hem.

## Licentie

Publiek domein (CC0). Geen naamsvermelding vereist.
