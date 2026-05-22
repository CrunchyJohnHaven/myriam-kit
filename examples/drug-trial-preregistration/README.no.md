*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Sett for forhåndsregistrering av legemiddelutprøvninger

Et nøkkelferdig myriam-kit-eksempel for sponsorer av kliniske studier og
akademiske utredere som ønsker å forhåndsregistrere en studie på en
manipuleringsfølsom, Bitcoin-forankret måte **i tillegg til** registrering
hos ClinicalTrials.gov, EU CTR eller andre jurisdiksjonelle registre.

## Hvorfor forhåndsregistrere *i tillegg* under MYRIAM?

Eksisterende studieregistre (ClinicalTrials.gov, EU CTR, ISRCTN) har
dokumenterte integritetssvakheter:

- ClinicalTrials.gov tillater sponsorer å oppdatere endepunkter,
  utvalgsstørrelsesberegninger og analyseplaner **etter** den opprinnelige
  registreringen, der endringsdatoene er synlige i registeret, men
  *innholds*­endringene ikke alltid er kryptografisk forankret.
- Flere store studier (Goldacre et al., 2019; Mathieu et al., 2009) har
  dokumentert systematisk post-hoc-bytte av endepunkter på tvers av feltet.
- Redaksjonell håndhevelse fra tidsskrifter (CONSORT, ICMJE) fanger noen
  tilfeller; mange slipper gjennom.

En MYRIAM-forsegling lukker dette gapet. Merkle-roten + Bitcoin OTS-kvittering
gjør enhver post-hoc-endring av det *forhåndsregistrerte* primære endepunktet,
statistiske analyseplanen eller undergruppe-listen kryptografisk
oppdagbar. Forseglingen er forensisk vanskeligere å skrive om i ettertid
enn registeret selv.

Dette settet er et **komplement til**, ikke en erstatning for,
jurisdiksjonelle registre. En reell studie bør registrere seg i det
passende registeret OG forsegle under MYRIAM.

## Hva dette settet forsvarer mot

Historiske dødelighetstilfeller dette ville ha hjulpet med:

- **Vioxx (Merck, 2004)**: kardiovaskulære hendelser var et
  forhåndsregistrert endepunkt i APPROVe-studien, men den publiserte
  analysen brukte et kuttepunkt som minimerte den tilsynelatende skaden.
  En forsegling av det forhåndsregistrerte kuttepunktet ville ha gjort
  post-hoc-kuttepunktendringen offentlig oppdagbar før den publiserte
  artikkelen.
- **Paxil/Studie 329 (GSK/SmithKline, 2001)**: negative studiedata om
  suicidalitet hos ungdom ble omtolket via post-hoc-analyse. Forseglet
  forhåndsregistrering av endepunktene ville ha gjort omtolkningen
  offentlig oppdagbar.
- **Flere onkologistudier** der overlevelsesendepunkter ble byttet ut med
  surrogatendepunkter (progresjonsfri overlevelse, responsrate) når
  overlevelsesfordelen ikke materialiserte seg.

**Feilmoduser forseglingen direkte fanger:**

- **Bytte av endepunkter**: post-hoc-forfremmelse av et sekundært endepunkt
  til «primært» når det faktiske primære feiler. FACT 05 av forseglingen
  inneholder det forhåndsregistrerte primære endepunktet; det publiserte
  primære endepunktet må matche.
- **Cherry-picking av utfall**: selektiv rapportering av kun de analysene
  som fungerte. FACT 06 inneholder den fullstendige forhåndsregistrerte
  analyseplanen; de publiserte analysene må inkludere alle
  forhåndsregistrerte.
- **Post-hoc-undergruppe-mining**: å påstå «legemiddelet virker for
  undergruppe X» etter å ha sett dataene. FACT 07 inneholder den
  forhåndsregistrerte undergruppe-listen; enhver annen undergruppe må
  merkes som post-hoc.
- **Revisjon av utvalgsstørrelse**: å øke utvalgsstørrelsen etter å ha sett
  trender ved interim-analyse. FACT 06 inneholder den forhåndsregistrerte
  utvalgsstørrelsen og styrkeberegningen.
- **Stille fjerning av ubeleilige sekundære endepunkter**: FACT 05
  forhåndsordner de sekundære endepunktene for hierarkisk testing; enhver
  omorganisering eller fjerning er oppdagbar.
- **Undertrykkelse av negative resultater**: FACT 08 inneholder
  publiseringsforpliktelsen; manglende publisering innen det forpliktede
  vinduet er offentlig synlig.

**Feilmoduser som IKKE er dekket:**

- Forseelser i studiegjennomføringen selv (fabrikerte data, svindelaktig
  rekruttering). Forseglingen forankrer *planen*, ikke *gjennomføringen*.
- Selektiv rapportering i publikasjoner som inkluderer alle
  forhåndsregistrerte analyser, men spinner dem fordelaktig. Forseglingen
  fanger det som mangler; den kan ikke fange tolkningsskjevhet.
- Pasientskade under selve studien. Forseglingen er regulatorisk og
  evidensbasert; den reduserer ikke risiko ved studiegjennomføring.

## Når dette settet skal brukes

Du bør vurdere å forsegle en forhåndsregistrering hvis:

- Du sponser eller kjører en klinisk studie — Fase 1 til 4 — som vil bli
  brukt til å informere medisinske eller regulatoriske beslutninger.
- Du er villig til å være offentlig bundet til det forhåndsregistrerte
  designet, endepunktene og analyseplanen.
- Du kan håndtere konsekvensen: hvis studien feiler på sine
  forhåndsregistrerte endepunkter, kan du ikke i stillhet bytte til et
  annet endepunkt som fungerte.
- Du deltar i en forskningskultur (akademisk medisin, kooperative grupper,
  NIH-finansiert forskning) der forhåndsregistreringsintegritet i økende
  grad kreves.

Dette settet er *særlig* verdifullt for:

- Utreder-initierte studier ved akademiske institusjoner (der sponsorpress
  for å endre endepunkter post-hoc er reelt, men der den akademiske
  utrederen har omdømmemessig insentiv til å motstå).
- Åpne vitenskapsstudier og borgervitenskapsstudier.
- Legemiddelomklassifiseringsstudier i små bioteknologiselskaper uten
  lange resultatlister fra studiegjennomføring.
- Enhver studie ment å informere regulatoriske innleveringer der
  fremtidige «det sa vi aldri»-argumenter kunne brukes.

## Når dette settet IKKE skal brukes

IKKE bruk dette settet hvis:

- Studieprotokollen er reelt fortsatt i endring. Forhåndsregistrer når
  protokollen er endelig, ikke før.
- Du ikke kan forplikte deg til å publisere resultater uavhengig av
  retning. Forseglingen gjør manglende publisering offentlig oppdagbar.
- Studien involverer konkurransemessig industrihemmelighold som
  forhindrer at du gjør analyseplanen offentlig. Forseglingen gjør
  analyseplanen til en permanent offentlig registrering; det finnes
  ingen måte å forsegle noe privat.
- Du har ikke juridisk og etisk godkjenning av protokollen. Forseglingen
  registrerer protokollen slik DU forseglet den; den kan ikke retroaktivt
  bli godkjent av en IRB eller etisk komité.

## Hvordan forke dette settet for en reell forhåndsregistrering

```bash
# 1. Kopier dette eksemplet
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Erstatt fiktivt innhold med den reelle studieprotokollens innhold.
# Hvert faktum tilsvarer en seksjon av en standard forhåndsregistrering:
$EDITOR facts/01_example_notice.txt   # ERSTATT med reell forsideerklæring
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMÆR + SEKUNDÆR + EKSPLORATORISK
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Oppdater site/index.html til å reflektere den reelle studien.

# 4. Forsegl (FØR rekrutteringen begynner, FØR databaselås):
bash build/seal.sh

# 5. Verifiser lokalt:
python3 build/verify.py

# 6. Utrull:
#    - Publiser forseglings-URL-en på studiesponsorens nettsted OG
#    - Legg til IPFS CID i studiens ClinicalTrials.gov-registrerings
#      «Description»- eller «References»-felt, slik at registerposten
#      krysshenviser til den kryptografiske forseglingen.
```

**KRITISK TIDSPUNKT**: forseglingen må opprettes FØR rekrutteringen begynner.
En forhåndsregistrering forseglet etter at den første pasienten er
rekruttert er forensisk mye svakere. Ideelt sett, forsegl ved øyeblikket
for IRB-godkjenning.

## Integrasjon med eksisterende forhåndsregistreringsinfrastruktur

Settet er designet til å sammensettes, ikke erstatte:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: registrer studien i det
  jurisdiksjonelle registeret som påkrevd. Deretter, i registerets
  «Description»- eller «References»-felt, lenke til den MYRIAM-forseglede
  publikasjonen.
- **OSF (Open Science Framework)**: OSF støtter forhåndsregistrering med
  datostempler, men ikke Bitcoin-forankring. MYRIAM-forseglingen kan
  festes som en tilleggsfil på OSF-registreringssiden, og gir både
  datostempel og Bitcoin-anker.
- **AsPredicted.org**: tilsvarende — lenke MYRIAM-forseglingen som en
  tillegg-URL.
- **Tidsskrifter**: noen tidsskrifter (f.eks. Trials, BMJ Open) aksepterer
  forhåndsregistrerings-URL-er som del av innsending. Inkluder
  MYRIAM-forseglings-URL-en sammen med register-URL-en.

## Hva mottakere (regulatorer, fagfeller, meta-analytikere) får

En studie forhåndsregistrert under MYRIAM gir vurderere:

1. **Kryptografisk bevis for at protokollen ble ferdigstilt på et spesifikt
   tidspunkt.** Vurderere kan verifisere forseglingstiden via OTS-kvitteringen.
2. **Bytevis stabilitet av protokollteksten.** Vurderere som sammenligner
   den publiserte metodedelen med det forhåndsregistrerte designet kan
   gjøre det tegn-for-tegn.
3. **Oppdagelse av endepunktsbytte.** En enkel diff mellom forseglet
   FACT 05 og det publiserte primære endepunktet avslører enhver
   substitusjon.
4. **Oppdagelse av avvik fra analyseplanen.** En enkel diff mellom forseglet
   FACT 06 og de publiserte statistiske metodene avslører modifikasjoner.
5. **Oppdagelse av selektiv undergruppe-rapportering.** Forseglet FACT 07
   inneholder alle forhåndsregistrerte undergrupper; alle i publikasjonen
   som ikke er i forseglingen må merkes som post-hoc.

Dette gjør systematisk gjennomgang og meta-analyse vesentlig enklere enn
gjeldende praksis.

## Hva dette settet IKKE er

- Ikke en erstatning for IRB / etisk komité-godkjenning.
- Ikke en erstatning for registrering i jurisdiksjonelle registre.
- Ikke en garanti for at studien vil bli gjennomført som planlagt.
- Ikke en måte å forankre pasientsamtykke eller andre etiske dokumenter
  (de trenger sin egen forseglingsmekanisme).
- Ikke beskyttelse mot kritikk av studiedesign etter publisering.

## En merknad om publisering av negative resultater

Forpliktelse #1 i FACT 08 («publisering uavhengig av retning») er den
enkeltvis høyeste dødelighetsforpliktelsen i forseglingen. Den historiske
undertrykkelsen av negative studieresultater (særlig for psykiatriske
legemidler hos ungdom, onkologiske legemidler hos eldre populasjoner og
kardiovaskulære legemidler hos kvinner) har plausibelt bidratt til tusenvis
av forhindringsdyktige dødsfall over tiår gjennom overforskrivning basert på
skjeve effektivitetsestimater.

En forseglet forpliktelse til å publisere negative resultater er, i seg
selv, ett av de høyeste-spaketrekkene en sponsor kan gjøre for folkehelsen.
Forseglingen gir ekstern ansvarlighet for den forpliktelsen på en måte som
selvkontrollerte publiseringspolicyer ikke gjør.

## Avslutning

Forhåndsregistrering av legemiddelutprøvninger under MYRIAM er lite
ekstraarbeid for sponsoren: ~30 minutter for å fylle ut faktaene,
~10 sekunder for å forsegle. Ansvarligheten det tilfører er asymmetrisk:
liten kostnad for ærlig studiegjennomføring, stor begrensning på post-hoc-
manøvreringen som har bidratt til historiske skjevheter i evidensgrunnlaget.

Hvis du er sponsor eller hovedutreder som vurderer dette settet, er settet
public domain (CC0). Bruk det. Modifiser det. Forbedre det.

## Lisens

Public domain (CC0). Ingen tilskrivning påkrevd.
