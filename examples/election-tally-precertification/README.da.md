*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Kit til forseglingsforcertificering af valgrøstoptællinger

Et nøglefærdigt myriam-kit-eksempel for kommunale optællingsnævn,
statslige valgmyndigheder og valgintegritetsobservatører, som ønsker
at offentliggøre en Bitcoin-forankret, manipulationspåviselig
forsegling af en optælling på det nøjagtige øjeblik af certificering.

**Lukker** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Hvad dette kit IKKE gør (læs først)

Forseglingen er et kryptografisk tidsstempel af det, der blev
certificeret. Den kan ikke verificere, om det, der blev certificeret,
var korrekt. Følgende fejlmoduser ligger **uden for forseglingens
domæne**:

1. **Kompromittering af stemmemaskiner.** Hvis firmware blev manipuleret
   eller stemmetal blev fejltalt, forankrer forseglingen et forkert tal
   med høj integritet. Forseglingen iagttager output fra
   tabuleringssystemet; den har ingen synlighed til selve systemet.

2. **Stemmeundertrykkelse / strukturel fratagelse af stemmeret.**
   Lukninger af valgsteder, forskelle i ID-lovgivning, partiskhed i
   afvisningsraten for poststemmer og udrensninger af stemmeregistre
   sker opstrøms for certificeringen. Forseglingen registrerer
   talte stemmesedler, ikke stemmesedler, der burde have været talt.

3. **Valgmisinformation.** Forseglingen dømmer ikke over påstande om
   valget fremsat af kandidater, medier eller platforme. En forseglet
   certificering kan citeres i et misinformationsnarrativ lige så let
   som i forsvar mod et. Kryptografiske tidsstempler er
   indholdsneutrale.

4. **Forcertificeringsbedrageri under stemmesedelindsamling eller
   -optælling.** Uregelmæssigheder ved ballot-harvesting, manipulation
   af afstemningsbokse, brud på opbevaringskæden under
   optællingsvinduet — alle sker før forseglingsøjeblikket.
   Forseglingen kan ikke retroaktivt opdage dem.

5. **Tvang over for den certificerende myndighed.** En fremtvunget
   certificering producerer en kryptografisk gyldig forsegling af et
   fremtvunget resultat. Forseglingen verificerer, at en embedsmand
   underskrev, ikke hvorfor.

6. **Forkerte certificeringer, som aldrig senere korrigeres.**
   Forseglingens værdi afhænger af en senere sandhedsfindings-proces
   (revision, omtælling, retssag), som forseglingen kan sammenlignes
   med. Hvis en sådan proces aldrig kører, står forseglingen som den
   eneste registrering og kan forstene fejlen.

7. **Statistiske anomalier og mønstergenkendelse.** Forseglingen
   flagger ikke usandsynlige marginer, geografiske anomalier eller
   afvigelser fra Benfords lov. Det er analytiske opgaver på de
   forseglede data, ikke egenskaber ved forseglingen.

8. **Underordnede valg med tynde revisionsspor.** Mindre valg har
   svagere omtællingstrigger; en enkelt forsegling kan ikke meningsfuldt
   dække alle valg på en stemmeseddel uden afgrænsning pr. valg.

**Afsnittet om ærlige begrænsninger ovenfor er den bærende del af
dette kit.** Embedsmænd, der tror, at forsegling er lig legitimitet,
vil bruge det som et skjold. Kittet skal sige tydeligt: dette er en
*ikke-afvisnings-primitiv for certificeringsøjeblikket*, ikke et
bevis på valgets korrekthed.

---

## Hvad dette kit SKAL AFVISE at forsegle

Kittet er konfigureret til at afvise følgende kendsgernings-mønstre,
selv hvis en bruger med gyldig signeringsautoritet indsender dem:

- **Identifikation af enkeltvælgere.** Ingen kendsgerning må navngive
  en vælger, koble en stemmeseddel til en vælger eller eksponere noget
  felt, der kunne genidentificere en person.
- **Beslutninger om signaturmatch pr. stemmeseddel.** PII-tunge;
  forsegling skaber permanente registreringer over beslutninger, der
  senere kan bestrides.
- **Enhver kendsgerning, hvis offentliggørelse ville identificere en
  sårbar vælger.** Inkluderer valgdistriktsresultater i distrikter
  så små, at stemmevalg er udledeligt (typisk <50 stemmesedler).
- **Optællinger forseglet før alle stemmesedler er talt.** Kittet
  afviser delvise optællinger præsenteret som "optællingen".
  Forcertificering betyder *alle stemmesedler talt, før officiel
  certificering* — ikke *under optælling*.
- **Foreløbige eller betingede certificeringer.** Forseglingen skal
  afspejle en kendsgerning, ikke en betingelse.
- **Optællinger, der udelukker afventende retssags-kohorter** uden en
  udtrykkeligt forseglet ledsagende kendsgerning, der afslører
  udelukkelsen.
- **Forsegling af nogen anden end den certificerende myndighed** for
  den jurisdiktion.

En afvisning kan i sig selv forsegles som en kendsgerning ("Denne
myndighed anmodede om forsegling af X; kittet afviste i henhold til
afvisningsregel Y") og skaber dermed en offentlig registrering over
forsøgt misbrug.

---

## Hvad dette kit FAKTISK forsegler

8 kendsgerninger ved certificeringsøjeblikket:

1. **Eksempelnotits** — erklærer offentliggørelsen som et eksempel
   (rigtige attestationer fjerner eller erstatter denne).
2. **Identifikation af jurisdiktion** — kommune, valgdato,
   certificerende myndighed, certificerende embedsmænd med navn +
   rolle.
3. **Certificeret optælling** — stemmesummer pr. valg pr. kandidat +
   over-/underrøster + write-ins.
4. **Stemmeseddelredegørelse og afstemning** — totalt afgivne, totalt
   tabulerede, totalt afviste pr. kategori, modus-fordeling, nævner
   for registrerede vælgere.
5. **Udstyrs- og revisionsspormanifest** — tabulatormodel +
   firmware-hash, CVR-filhash, hash af stemmeseddelbillede-arkiv,
   hash af opbevaringslog, hash af signaturmatchningspolitik.
6. **Tærskler og udløsere ved certificering** — gældende tærskel for
   signaturmatch, udløsertærskler for omtælling, faktiske marginer
   pr. valg, RLA-frø-forpligtelse.
7. **Ledsagende offentliggørelser og afvisningsregister** — afventende
   retssag, anomalier efter optælling under gennemgang, udelukkede
   kohorter, dissenterende nævnsmedlemmer; eksplicit liste over
   mønstre, kittet afviste at forsegle.
8. **Signerende principal** — identifikation af optællingsnævn + hver
   signatars navn og parti + kryptografiske nøgleoplysninger.

Hver kendsgerning slutter med afvisningsporten-konventionen:
*"Denne kendsgerning hævder kun X. Den hævder ikke Y"* (hvor Y er
den nærmeste fejlmodus fra afsnittet "GØR IKKE" ovenfor).

---

## Hvad dette kit forsvarer imod

- **Stille revision af stemmesummer efter certificering** — enhver
  heltalsændring af FACT 03 producerer en anden SHA-256, en anden
  Merkle-rod, fejler OTS-verifikation.
- **"Fundne stemmesedler" der stille absorberes** — FACT 04's
  afstemningsaritmetik er fastlagt ved certificering.
- **Påstande om udskiftning af firmware** — FACT 05 fryser
  udstyrsmanifestet ved certificering.
- **Udskiftning af revisionsartefakter efter certificering** —
  FACT 05's hash-manifest fanger enhver ændring efter certificering
  af CVR, stemmeseddelbilleder, opbevaringslogs eller
  signaturmatchningspolitik.
- **Omdefinering af tærskler og udløsere** — FACT 06 fryser de
  regler, der var gældende ved certificering (tærskel for
  signaturmatch, omtællingsudløsere, RLA-risikogrænse).

## Historiske eller nær-historiske sager, kittet ville have hjulpet med

Kittet ville have produceret et nyttigt anker — *ikke en løsning* —
i sager, der involverer:

- **Antrim County, Michigan (2020).** Indledende uofficielle resultater
  viste en kandidatombytning, der senere blev korrigeret til det
  modsatte udfald. En forsegling før korrektionen ville have givet en
  offentlig reference for, hvad den oprindelige meddelelse sagde
  kontra hvad korrektionen sagde, begge kryptografisk attesterede.
- **Maricopa County, Arizona (2020–2022).** Flere iterationer af
  omtalte/genundersøgte summer cirkulerede. En forsegling i
  certificeringsøjeblikket ville have givet et utvetydigt
  referencepunkt, hvormed hver efterfølgende optælling kunne
  sammenlignes.
- **Florida 2000 (Bush v. Gore canvass).** Certificerede summer
  pr. kommune skiftede under omtællingspres; en forsegling pr. kommune
  før omtælling ville have bevaret, hvad hver kommune certificerede,
  før manuelle omtællingsprocedurer begyndte.
- **Diverse udenlandske valg med dokumenterede "korrektioner" efter
  certificering.** Jurisdiktionsagnostisk.

Kittet ville IKKE have løst de underliggende tvister om
maskinintegritet i 2020, tvister om poststemme-politik eller noget
valg, hvor kernespørgsmålet var bestridt kendsgerning snarere end
bestridt registrering.

## Hvornår man skal bruge dette kit

- Din jurisdiktion har en stabil, revideret certificeringsproces og
  vil tilføje et uforanderligt offentligt anker.
- Du forventer granskning efter certificering og vil have et
  manipulationspåviseligt referencepunkt.
- Du har lovlig myndighed til at offentliggøre det anførte
  kendsgerningssæt uden at eksponere PII.
- Du har en parallel revision eller RLA-proces, så forseglingen kan
  sammenlignes med sandhedsfindings-output.

## Hvornår man IKKE skal bruge dette kit

- **Brug det ikke som erstatning for risikobegrænsende revisioner,
  manuelle omtællinger eller eftervalgsrevisioner.** Dette kit er
  *additivt*, ikke en erstatning.
- **Brug det ikke, hvis den certificerende embedsmand ikke er den
  faktiske beslutningstager** (skaber falsk tilskrivning).
- **Brug det ikke midt i tabuleringen.** Kittet er specifikt til
  certificeringsøjeblikket. Forseglinger af delvise optællinger
  skaber vildledende referencepunkter.
- **Brug det ikke til at hævde, at valget var retfærdigt, korrekt
  eller legitimt** — det kan kittet ikke gøre.
- **Brug det ikke under pres for at forsegle tidligere end
  certificeringsøjeblikket, eller for at udelade en ledsagende
  kendsgerningsmeddelelse.** Afvis, og forsegl afvisningen.
- **Brug det ikke som legitimitetsteater.** En forsegling af en
  bedragerisk optælling er en permanent offentlig registrering af
  bedrageri, ikke et forsvar af det. Primitiven skærer begge veje;
  det er dens ærlighed.

## Sådan forker du dette kit til en faktisk certificering

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # erstat fiktivt indhold med rigtigt
bash build/seal.sh     # forsegl VED eller efter den officielle certificeringssignatur
python3 build/verify.py
```

**Kritisk timing:** forsegl VED certificeringsøjeblikket, IKKE før.
En forsegling før officiel certificering skaber en falsk positiv
"dette er det officielle resultat" -registrering. En forsegling
bagefter er konventionel ikke-afvisning.

## Integration med eksisterende valginfrastruktur

- **Statslige valgnævn / EAC-certificering.** Kittet offentliggør
  ved siden af det officielle certificeringsdokument. Det erstatter
  ikke den lovbestemte certificering.
- **Risikobegrænsende revisioner.** CVR-hashen i FACT 05 er den
  samme hash, som RLA-værktøjet konsumerer. Forseglingen binder den
  reviderede CVR til den certificerede sum.
- **Omtællingsprocedurer.** En omtælling, der udløses i henhold til
  statslig lov, producerer et NYT forseglet kendsgerningssæt
  (anden tidsstempel, andre hashes, samme jurisdiktion). Begge
  forseglinger sameksisterer; ingen overskriver den anden. Diffen
  mellem forseglinger er den offentlige registrering af, hvad
  omtællingen ændrede.
- **Election Markup Language (EML) og Common Data Format (CDF).**
  Kendsgerningskroppe bør være udledelige fra jurisdiktionens
  eksisterende EML/CDF-output for at holde kittet
  dataformat-agnostisk.
- **Topartisk underskrift af optællingsnævn.** Multi-signaturvariant
  anbefales for jurisdiktioner med partibalancerede
  optællingsnævn.

## Hvad dette kit IKKE erstatter

- Lovbestemt certificering under statslig vallov
- EAC-certificering af stemmesystem
- Risikobegrænsende revisioner / manuelle omtællinger
- Omtællingsprocedurer og eftervalgsrevisioner
- Domstolsbeslutninger eller valgbestridelsesretssager

## Hvorfor dette kit findes i v0.3.0+

Dette er det 6. udarbejdede eksempel, der leveres med myriam-kit.
Kittet blev produceret via en Karpathy-stil autoresearch-proces
dokumenteret i `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Tre
promptvarianter (imitation / første-principper / begrænsning-først)
producerede parallelle kit-skitser; begrænsning-først-varianten fik
højeste score på en vægtet rubric, og det endelige kit syntetiserer
dens struktur med imitationsvariantens sammenhæng og
første-principper-variantens operationelle detalje.

Selve autoresearchen er dokumenteret som et promptmønster i
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` til fremtidig brug.

## Licens

Almindelig ejendom (CC0). Fork det. Ingen kreditering nødvendig.
