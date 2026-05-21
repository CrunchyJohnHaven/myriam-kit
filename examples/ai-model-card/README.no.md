*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Sett for atferdslåsing av AI-modeller

Et nøkkelferdig myriam-kit-eksempel for AI-laboratorier (kommersielle
eller åpen kildekode) som slipper en modell og ønsker å gjøre påstandene
i utgivelsen — vekters identitet, kapabiliteter, evalueringsscorer,
sikkerhetsgjennomgang, forpliktelser før utrulling — **kryptografisk
forankret og offentlig verifiserbart**.

Settet forsvarer mot den spesifikke feilmodusen der utrullede modeller
stille driver, evalueringsscorer omskrives i ettertid, eller
forpliktelser før utrulling bestrides år senere som «det sa vi aldri».

## Hva dette settet produserer

Et kryptografisk forseglet manifest som inneholder, for én modellutgivelse:

1. Modellidentifikasjon (navn, arkitektur, parameterantall, lisens)
2. **SHA-256 av vektfilen** — den kanoniske artefakthashen
3. Modellkort-tekst (kapabiliteter, tiltenkt bruk, bruk utenfor omfang,
   kjente feilmoduser)
4. Evalueringsresultater ved utgivelse (kapabilitetsevalueringer,
   sikkerhetsevalueringer, kalibrering)
5. Forpliktelser før utrulling (tingene du forplikter deg til ikke å
   endre i stillhet etter utgivelse)
6. Signerende prinsipal (mennesket + organisasjonen som tar ansvar)

Forseglingen gjør hvert av disse byte-stabilt, tidsforankret til Bitcoin
via OpenTimestamps, og hentbart via IPFS uavhengig av noen enkelt
hostingpart.

Se det utarbeidede fiktive eksempelet: [facts/](facts/) og den gjengitte
[site/index.html](site/index.html). Eksempelet bruker en fiktiv modell
(«Calm-mini-v0»); en reell utgivelse ville erstatte eksempelinnholdet.

## Hva dette settet forsvarer mot

**Feilmoduser forseglingen fanger direkte:**

- **Vekttukling** — SHA-256 for den utgitte vektfilen er i FACT 03.
  Enhver endring etter utgivelse av bytene en bruker laster ned er
  oppdagbar ved å hashe på nytt.
- **Stille omskriving av evalueringer** — evalueringsscorene ved
  utgivelse er i FACT 05. Fremtidige tvister om at «evalueringsscoren
  alltid var X» har et offentlig anker.
- **Drift i kapabilitetspåstander** — modellkort-teksten i FACT 04 er
  byte-stabil. Fremtidige tvister om at «vi hevdet aldri kapabilitet X»
  kan sjekkes offentlig mot den forseglede teksten.
- **Stille redistribusjon av finjustering** — forpliktelse #1 før
  utrulling i FACT 06 (i det utarbeidede eksempelet) er «ingen stille
  finjustering under samme navn». Deteksjon: enhver ny vekthash
  betyr et nytt modellnavn og en ny forseglet publisering, eller så
  er forpliktelsen brutt.
- **Skjulte feilmoduser** — FACT 04 forplikter til en liste over
  kjente feilmoduser. Listen er monoton (kan vokse, ikke krympe for
  et frosset sjekkpunkt). Fremtidige oppdagelser av feilmoduser
  laboratoriet visste om internt, men ikke publiserte, blir
  bestridbar dokumentasjon.

**Feilmoduser som IKKE er dekket:**

- Modeller som misbrukes av nedstrøms brukere (forseglingen beviser hva
  som ble utgitt, ikke hva brukerne gjør med det).
- Adversariell finjustering av tredjeparter (en tredjeparts-finjustering
  produserer en annen vekthash, så den opprinnelige forseglingen
  forblir uberørt, men tredjepartens modell er utenfor forseglingens
  beskyttelse).
- Atferdsendringer på grunn av endringer i utrullingsmiljøet
  (forskjellige systemledetekster, RAG-konfigurasjoner, osv.).
- Feil laboratoriet virkelig ikke visste om på utgivelsestidspunktet.
  Forseglingen forplikter laboratoriet til *det de visste*; den kan
  ikke forankre det de ikke visste.

## Når bør dette settet brukes

Du bør vurdere å forsegle et modellkort hvis:

- Du slipper modellvekter offentlig ELLER ruller ut en modell i en
  kontekst der nedstrøms brukere bryr seg om atferdsstabilitet.
- Utgivelsen er betydningsfull nok til at fremtidige tvister om at «det
  sa vi aldri» er sannsynlige (enhver modell utrullet i stor skala;
  enhver sikkerhetskritisk modell; enhver utgivelse ledsaget av
  kapabilitetspåstander).
- Din organisasjon er villig til å gjøre forpliktelser før utrulling som
  begrenser fremtidige handlinger (dette er den bærende — se neste
  avsnitt).
- Du kan beregne SHA-256 av vektfilen ved utgivelse.

## Når dette settet IKKE bør brukes

IKKE bruk dette settet hvis:

- Du ikke er villig til å være bundet av forpliktelsene før utrulling i
  FACT 06 av eksempelet. Forseglingen gjør forpliktelsene mekanisk
  oppdagbare; hvis du ikke er forberedt på den ansvarligheten, ikke
  forsegle.
- Vektfilen kommer til å endre seg hyppig (f.eks. kontinuerlige
  finjusteringspipelines). Hver vektendring krever en ny forseglet
  utgivelse. Forsegling per utgivelse er tungt; dette settet er for
  *frosne* sjekkpunkter.
- Du har ikke gjort sikkerhetsgjennomgangen ennå. Forseglingen forplikter
  sikkerhetsgjennomgangens funn. Hvis du forsegler en ufullstendig
  gjennomgang, har du en permanent offentlig oversikt over en
  ufullstendig gjennomgang.
- Du kan ville trekke tilbake en spesifikk evalueringsscore senere.
  Forseglingen er permanent. Nye forseglede publiseringer kan
  erstatte, men originalen kan ikke gjøres ugjort.

## De bærende forpliktelsene før utrulling

Eksempelets FACT 06 forplikter utgiveren til:

1. **Ingen stille finjustering under samme navn.** Enhver finjustering
   produserer et nytt modellnavn, en ny forseglet publisering, en ny
   vekthash. Forgjengeren forblir kanonisk den navngitte versjonen.

2. **Ingen stille evalueringsoppdateringer.** Re-evalueringer får nye
   forseglede publiseringer som refererer til originalen via Merkle-rot.
   Versjoner spores, ikke overskrives.

3. **Kjente feilmoduser kan vokse, aldri krympe.** Et frosset sjekkpunkt
   kan ikke få feilmoduser rettet. Så den publiserte listen er
   effektivt monoton.

4. **Håndtering av nedtaking.** Hvis tvunget til å fjerne modellen fra
   distribusjon, forplikter laboratoriet seg til å publisere en endelig
   forseglet erklæring om nedtakingen.

Et laboratorium som tar i bruk dette settet må bestemme hvilke av disse
forpliktelsene det faktisk kan hedre. Hvis du ikke kan hedre alle fire,
modifiser FACT 06 *før* forsegling for å reflektere hva du kan hedre, og
godta den resulterende svekkede beskyttelsen. Å forsegle forpliktelser du
ikke har til hensikt å hedre er verre enn å ikke forsegle i det hele tatt.

## Hvordan forke dette settet for en reell utgivelse

```bash
# 1. Kopier dette eksempelet inn i din utgivelsespipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Rediger hvert faktum for din reelle utgivelse
$EDITOR facts/01_example_notice.txt   # FJERN — din utgivelse er ikke et eksempel
                                       # Erstatt med en utgivelsesmelding for din modell
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # det kanoniske modellkortet
$EDITOR facts/05_eval_results.txt     # faktiske evalueringsresultater
$EDITOR facts/06_release_commitments.txt # hvilke forpliktelser du kan hedre

# 3. Oppdater site/index.html for å reflektere den reelle utgivelsen.

# 4. Forsegle.
bash build/seal.sh

# 5. Verifiser lokalt.
python3 build/verify.py

# 6. Distribuer til:
#    - Din utgivelsesside (ved siden av modellkortet og vektene)
#    - IPFS-nettverket (seal.sh-skriptet gjør allerede dette)
#    - Valgfritt: lenke til den forseglede publiseringen fra dine
#      Hugging Face / GitHub-utgivelsesnotater
```

## Integrasjon med eksisterende utgivelsespipelines

Settet er designet for å komponere med eksisterende verktøy, ikke
erstatte dem:

- **Hugging Face**: inkluder URL eller IPFS-CID for den forseglede
  publiseringen i modellkortets README.md. Pek lesere til forseglingen
  for byte-stabile utgivelsespåstander.
- **GitHub-utgivelser**: inkluder OpenTimestamps-kvitteringen
  (`merkle_root.txt.ots`) som en utgivelsesressurs. Fremtidige tvister
  om at «utgivelsen endret seg» er da forankret til Bitcoin.
- **Modellkort-standarder (Mitchell et al. 2019)**: settet er kompatibelt.
  Standardens modellkortfelt kartlegges til FAKTAENE 02–05 av
  forseglingen. Du produserer modellkortet normalt, og forsegler det i
  tillegg.
- **Evalueringsharnesser (lm-evaluation-harness, BIG-bench, osv.)**: hash
  den eksakte harness-commiten og rå utdata-JSON; referer disse hashene
  i FACT 05. Fremtidige re-kjøringer er da uavhengig reproduserbare.

## Beregning av vekthashen

For en enkelt safetensors-fil:

```bash
shasum -a 256 model.safetensors
```

For sjekkpunkter med flere filer (GGUF-shards, sharded safetensors):

```bash
# Sammenkoble hasher i sortert rekkefølge, deretter hash igjen
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Den endelige hashen er det som går i FACT 03. Inkluder både hashene per
shard og den endelige aggregerte hashen slik at brukere kan verifisere
individuelle shards mens de laster dem ned.

## Hva mottakere (brukere av din modell) bør vite

En modellutgivelse med en MYRIAM-forseglet publisering lar brukeren:

1. **Verifisere vektene de lastet ned** ved å hashe på nytt og sammenligne
   med FACT 03.
2. **Verifisere at modellkortet ikke er omskrevet** ved å sjekke det
   forseglede FACT 04 mot laboratoriets nåværende publiserte versjon.
3. **Verifisere at evalueringsscorene er de ved utgivelse** ved å
   sammenligne laboratoriets nåværende evalueringspåstander mot det
   forseglede FACT 05.
4. **Holde laboratoriet ansvarlig for sine forpliktelser før utrulling**
   ved å sjekke faktisk atferd mot det forseglede FACT 06.

En bruker som finner avvik har kryptografisk bevis på avviket. De kan
publisere det beviset; den opprinnelige forseglede publiseringen er
ankeret.

## Hva dette settet IKKE er

- Ikke en erstatning for faktisk å gjennomføre sikkerhetsgjennomgang.
  Forseglingen er *oversikten* over sikkerhetsgjennomgangen, ikke
  gjennomgangen selv.
- Ikke en erstatning for faktiske evalueringer. Forseglingen forankrer
  scorene du produserer; den validerer ikke metodikken.
- Ikke en garanti for at modellen er trygg. Forseglingen dokumenterer
  hva laboratoriet hevder om modellen ved utgivelse; den sertifiserer
  ikke disse påstandene.
- Ikke beskyttelse mot modellmisbruk fra nedstrøms brukere.

## En merknad om adversariell finjustering

En vanlig AI-sikkerhetsbekymring: noen finjusterer modellen din for å
fjerne sikkerhetsatferd og redistribuerer den. Forseglingen KAN IKKE
forhindre dette. Det forseglingen kan gjøre er å:

- Forankre hva den *opprinnelige* modellen skulle gjøre (FACT 04).
- Forankre hva de opprinnelige evalueringsscorene var (FACT 05).
- Gi et referansepunkt som adversarielle finjusteringer kan måles mot.

En bruker som møter en tredjeparts-redistribusjon kan verifisere om
vektene matcher den opprinnelige forseglede hashen. Hvis ikke, vet
brukeren at de har en ikke-original modell og at alle sikkerhetspåstander
tilskrevet laboratoriet ikke gjelder.

## Avslutning

Å forsegle en modellutgivelse er lite ekstra arbeid for laboratoriet:
~10 minutter for å beregne hasher og kjøre forseglingsskriptet, deretter
en 30-sekunders beslutning om hvilke forpliktelser før utrulling som skal
inkluderes. Ansvarligheten den legger til er asymmetrisk: liten kostnad
for ærlige laboratorier, stor begrensning for laboratorier som ellers
ville endre påstandene sine i stillhet.

Hvis du er et AI-laboratorium som vurderer adopsjon, er settet
allemannseie (CC0). Forke det. Modifiser det. Matematikken er den
bærende delen, ikke den spesifikke implementeringen.

## Lisens

Allemannseie (CC0). Ingen tilskrivning kreves.
