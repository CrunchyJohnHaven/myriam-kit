*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Kit til forhåndsregistrering af lægemiddelforsøg

Et nøglefærdigt myriam-kit-eksempel for sponsorer af kliniske forsøg og
akademiske forskere, der ønsker at forhåndsregistrere et forsøg på en
manipuleringssporbar, Bitcoin-forankret måde **ud over** registrering hos
ClinicalTrials.gov, EU CTR eller andre jurisdiktionelle registre.

## Hvorfor forhåndsregistrere *yderligere* under MYRIAM?

Eksisterende forsøgsregistre (ClinicalTrials.gov, EU CTR, ISRCTN) har
dokumenterede integritetssvagheder:

- ClinicalTrials.gov tillader sponsorer at opdatere endpoints, beregninger
  af stikprøvestørrelse og analyseplaner **efter** den oprindelige
  registrering, hvor ændringsdatoerne er synlige i registret, men
  *indholds*­ændringerne ikke altid er kryptografisk forankret.
- Flere store studier (Goldacre et al., 2019; Mathieu et al., 2009) har
  dokumenteret systematisk post-hoc-endpoint-skift på tværs af feltet.
- Redaktionel håndhævelse fra tidsskrifter (CONSORT, ICMJE) fanger nogle
  tilfælde; mange slipper igennem.

En MYRIAM-forsegling lukker dette hul. Merkle-roden + Bitcoin OTS-kvitteringen
gør enhver post-hoc-ændring af det *forhåndsregistrerede* primære endpoint,
statistiske analyseplan eller undergruppeliste kryptografisk
detekterbar. Forseglingen er forensisk sværere at omskrive i bagklogskab
end registret selv.

Dette kit er et **komplement til**, ikke en erstatning for, jurisdiktionelle
registre. Et reelt forsøg bør registreres i det passende register OG
forsegles under MYRIAM.

## Hvad dette kit forsvarer mod

Historiske dødelighedstilfælde, dette ville have hjulpet med:

- **Vioxx (Merck, 2004)**: kardiovaskulære hændelser var et
  forhåndsregistreret endpoint i APPROVe-forsøget, men den offentliggjorte
  analyse brugte et cutoff, der minimerede den tilsyneladende skade. En
  forsegling af det forhåndsregistrerede cutoff ville have gjort
  post-hoc-cutoff-ændringen offentligt detekterbar før den offentliggjorte
  artikel.
- **Paxil/Studie 329 (GSK/SmithKline, 2001)**: negative forsøgsdata om
  suicidalitet hos unge blev omformuleret via post-hoc-analyse. Forseglet
  forhåndsregistrering af endpointsene ville have gjort omformuleringen
  offentligt detekterbar.
- **Flere onkologiforsøg**, hvor overlevelsesendpoints blev byttet ud med
  surrogatendpoints (progressionsfri overlevelse, responsrate), når
  overlevelsesfordelen ikke materialiserede sig.

**Fejlmodi, seglet direkte fanger:**

- **Endpoint-skift**: post-hoc-promovering af et sekundært endpoint til
  "primært", når det faktiske primære fejler. FACT 05 i seglet indeholder
  det forhåndsregistrerede primære endpoint; det offentliggjorte primære
  endpoint skal matche.
- **Cherry-picking af resultater**: selektiv rapportering af kun de
  analyser, der fungerede. FACT 06 indeholder den fulde
  forhåndsregistrerede analyseplan; de offentliggjorte analyser skal
  inkludere alle forhåndsregistrerede.
- **Post-hoc-undergruppe-mining**: at påstå "lægemidlet virker for
  undergruppe X" efter at have set dataene. FACT 07 indeholder den
  forhåndsregistrerede undergruppeliste; enhver anden undergruppe skal
  mærkes som post-hoc.
- **Revision af stikprøvestørrelse**: at øge stikprøvestørrelsen efter at
  have set interim-trends. FACT 06 indeholder den forhåndsregistrerede
  stikprøvestørrelse og styrkeberegning.
- **Stille fjernelse af ubelejlige sekundære endpoints**: FACT 05
  forhåndsordner de sekundære endpoints til hierarkisk testning; enhver
  omrokering eller fjernelse er detekterbar.
- **Undertrykkelse af negative resultater**: FACT 08 indeholder
  publikationsforpligtelsen; manglende offentliggørelse inden for det
  forpligtede vindue er offentligt synligt.

**Fejlmodi, der IKKE er dækket:**

- Misligholdelse i selve forsøgsudførelsen (forfalskede data, svigagtig
  rekruttering). Seglet forankrer *planen*, ikke *udførelsen*.
- Selektiv rapportering i publikationer, der inkluderer alle
  forhåndsregistrerede analyser, men spinder dem fordelagtigt. Seglet
  fanger det, der mangler; det kan ikke fange fortolkningsbias.
- Patientskade under selve forsøget. Seglet er regulatorisk og evidens-
  mæssigt; det reducerer ikke risiko ved forsøgsudførelse.

## Hvornår dette kit skal bruges

Du bør overveje at forsegle en forhåndsregistrering, hvis:

- Du sponserer eller kører et klinisk forsøg — Fase 1 til 4 — der vil
  blive brugt til at informere medicinske eller regulatoriske beslutninger.
- Du er villig til at være offentligt bundet til det forhåndsregistrerede
  design, endpoints og analyseplan.
- Du kan håndtere konsekvensen: hvis forsøget fejler på dets
  forhåndsregistrerede endpoints, kan du ikke stille bytte til et andet
  endpoint, der virkede.
- Du deltager i en forskningskultur (akademisk medicin, kooperative
  grupper, NIH-finansieret forskning), hvor forhåndsregistreringsintegritet
  i stigende grad kræves.

Dette kit er *særligt* værdifuldt for:

- Forsker-initierede forsøg ved akademiske institutioner (hvor
  sponsorpres for at ændre endpoints post-hoc er reelt, men hvor den
  akademiske forsker har omdømmemæssigt incitament til at modstå).
- Open-science-forsøg og borgervidenskabelige studier.
- Lægemiddel-genanvendelsesforsøg i små bioteknologivirksomheder uden
  lange erfaringer med forsøgsudførelse.
- Ethvert forsøg, der har til formål at informere regulatoriske
  indsendelser, hvor fremtidige "det sagde vi aldrig"-argumenter kunne
  fremføres.

## Hvornår dette kit IKKE skal bruges

Brug IKKE dette kit, hvis:

- Forsøgsprotokollen reelt stadig er under udvikling. Forhåndsregistrer,
  når protokollen er endelig, ikke før.
- Du ikke kan forpligte dig til at offentliggøre resultater uanset retning.
  Seglet gør manglende offentliggørelse offentligt detekterbar.
- Forsøget involverer konkurrencemæssig industrihemmeligholdelse, som
  forhindrer dig i at offentliggøre analyseplanen. Seglet gør
  analyseplanen til en permanent offentlig registrering; der er ingen
  måde at forsegle noget privat på.
- Du har ikke juridisk og etisk godkendelse af protokollen. Seglet
  registrerer protokollen, som DU forseglede den; det kan ikke
  retroaktivt godkendes af en IRB eller etisk komité.

## Sådan forker du dette kit til en reel forhåndsregistrering

```bash
# 1. Kopiér dette eksempel
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Erstat fiktivt indhold med den reelle forsøgsprotokols indhold.
# Hvert faktum svarer til en sektion af en standard forhåndsregistrering:
$EDITOR facts/01_example_notice.txt   # ERSTAT med reel forsideerklæring
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMÆR + SEKUNDÆR + EKSPLORATIV
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Opdatér site/index.html, så det afspejler det reelle forsøg.

# 4. Forsegl (FØR rekruttering begynder, FØR databaselås):
bash build/seal.sh

# 5. Verificér lokalt:
python3 build/verify.py

# 6. Udrul:
#    - Offentliggør segl-URL'en på din forsøgssponsors websted OG
#    - Tilføj IPFS CID til forsøgets ClinicalTrials.gov-registrerings
#      "Description"- eller "References"-felt, så registerposten
#      krydshenviser til det kryptografiske segl.
```

**KRITISK TIDSPUNKT**: seglet skal oprettes FØR rekrutteringen begynder.
En forhåndsregistrering forseglet efter, at den første patient er
rekrutteret, er forensisk meget svagere. Ideelt set, forsegl ved
øjeblikket for IRB-godkendelse.

## Integration med eksisterende forhåndsregistreringsinfrastruktur

Kittet er designet til at sammensættes, ikke erstatte:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: registrér forsøget i det
  jurisdiktionelle register som påkrævet. Derefter, i registrets
  "Description"- eller "References"-felt, linke til den MYRIAM-forseglede
  publikation.
- **OSF (Open Science Framework)**: OSF understøtter forhåndsregistrering
  med datostempler, men ikke Bitcoin-forankring. MYRIAM-seglet kan
  vedhæftes som en supplerende fil på OSF-registreringssiden, hvilket
  giver både datostempel og Bitcoin-anker.
- **AsPredicted.org**: tilsvarende — linke MYRIAM-seglet som en
  supplerende URL.
- **Tidsskrifter**: nogle tidsskrifter (f.eks. Trials, BMJ Open) accepterer
  forhåndsregistrerings-URL'er som del af indsendelse. Inkluder
  MYRIAM-segl-URL'en sammen med register-URL'en.

## Hvad modtagere (regulatorer, tidsskriftvurderere, meta-analytikere) får

Et forsøg forhåndsregistreret under MYRIAM giver vurderere:

1. **Kryptografisk bevis for, at protokollen blev færdiggjort på et
   specifikt tidspunkt.** Vurderere kan verificere segltiden via
   OTS-kvitteringen.
2. **Bytewise stabilitet af protokolteksten.** Vurderere, der sammenligner
   den offentliggjorte metodesektion med det forhåndsregistrerede design,
   kan gøre det tegn-for-tegn.
3. **Detektion af endpoint-skift.** En simpel diff mellem det forseglede
   FACT 05 og det offentliggjorte primære endpoint afslører enhver
   substitution.
4. **Detektion af afvigelse fra analyseplanen.** En simpel diff mellem det
   forseglede FACT 06 og de offentliggjorte statistiske metoder afslører
   modifikationer.
5. **Detektion af selektiv undergrupperapportering.** Det forseglede
   FACT 07 indeholder alle forhåndsregistrerede undergrupper; enhver i
   publikationen, der ikke er i seglet, skal mærkes som post-hoc.

Dette gør systematisk gennemgang og meta-analyse væsentligt lettere end
nuværende praksis.

## Hvad dette kit IKKE er

- Ikke en erstatning for IRB / etisk komité-godkendelse.
- Ikke en erstatning for registrering i jurisdiktionelle registre.
- Ikke en garanti for, at forsøget vil blive udført som planlagt.
- Ikke en måde at forankre patientsamtykke eller andre etiske dokumenter
  (de skal have deres egen forseglingsmekanisme).
- Ikke beskyttelse mod kritik af forsøgsdesign efter offentliggørelse.

## En bemærkning om publicering af negative resultater

Forpligtelse #1 i FACT 08 ("offentliggørelse uanset retning") er den
enkeltstående højeste dødelighedsforpligtelse i seglet. Den historiske
undertrykkelse af negative forsøgsresultater (særligt for psykiatriske
lægemidler hos unge, onkologiske lægemidler hos ældre populationer og
kardiovaskulære lægemidler hos kvinder) har plausibelt bidraget til
tusinder af forhindringsdygtige dødsfald over årtier gennem
overforskrivning baseret på skæve effektivitetsestimater.

En forseglet forpligtelse til at offentliggøre negative resultater er
i sig selv et af de højeste-løftestangstræk for folkesundheden, en
sponsor kan foretage. Seglet giver ekstern ansvarlighed for den
forpligtelse på en måde, som selvpolitisierede publikationspolitikker
ikke gør.

## Afslutning

Forhåndsregistrering af lægemiddelforsøg under MYRIAM er lidt ekstra
arbejde for sponsoren: ~30 minutter til at populere fakta, ~10 sekunder
til at forsegle. Den ansvarlighed, det tilføjer, er asymmetrisk: lille
omkostning for ærlig forsøgsudførelse, stor begrænsning på den
post-hoc-manøvrering, der har bidraget til historiske bias i
evidensgrundlaget.

Hvis du er sponsor eller hovedforsker, der overvejer dette kit, er kittet
public domain (CC0). Brug det. Modificér det. Forbedr det.

## Licens

Public domain (CC0). Ingen attribution påkrævet.
