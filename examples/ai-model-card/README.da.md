*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Kit til adfærdslås for AI-modeller

Et nøglefærdigt myriam-kit-eksempel for AI-laboratorier (kommercielle eller
open source), der udgiver en model og ønsker at gøre udgivelsens påstande —
vægts identitet, kapaciteter, evalueringsscorer, sikkerhedsgennemgang,
forpligtelser før udrulning — **kryptografisk forankret og offentligt
verificerbare**.

Kittet forsvarer mod den specifikke fejlmodus, hvor udrullede modeller
stille drifter, evalueringsscorer omskrives bagudrettet, eller forpligtelser
før udrulning bestrides år senere som "det sagde vi aldrig".

## Hvad dette kit producerer

Et kryptografisk forseglet manifest, der indeholder, for én modeludgivelse:

1. Modelidentifikation (navn, arkitektur, parameterantal, licens)
2. **SHA-256 af vægtfilen** — det kanoniske artefakt-hash
3. Modelkort-tekst (kapaciteter, tilsigtet brug, brug uden for omfang,
   kendte fejlmodi)
4. Evalueringsresultater ved udgivelse (kapacitetsevalueringer,
   sikkerhedsevalueringer, kalibrering)
5. Forpligtelser før udrulning (de ting, du forpligter dig til ikke at
   ændre stille efter udgivelsen)
6. Underskrivende principal (mennesket + organisationen, der tager ansvar)

Seglet gør hvert af disse byte-stabilt, tidsforankret til Bitcoin via
OpenTimestamps og hentbart via IPFS uafhængigt af nogen enkelt hosting-part.

Se det udarbejdede fiktive eksempel: [facts/](facts/) og det gengivede
[site/index.html](site/index.html). Eksemplet bruger en fiktiv model
("Calm-mini-v0"); en reel udgivelse ville erstatte eksempelindholdet.

## Hvad dette kit forsvarer mod

**Fejlmodi, seglet fanger direkte:**

- **Vægtmanipulation** — SHA-256 for den udgivne vægtfil er i FACT 03.
  Enhver ændring efter udgivelse af de bytes, en bruger downloader, kan
  påvises ved at hashe igen.
- **Stille omskrivning af evalueringer** — evalueringsscorerne ved
  udgivelse er i FACT 05. Fremtidige tvister om at "evalueringsscoren altid
  var X" har et offentligt anker.
- **Drift i kapacitetspåstande** — modelkort-teksten i FACT 04 er
  byte-stabil. Fremtidige tvister om at "vi hævdede aldrig kapacitet X"
  kan kontrolleres offentligt mod den forseglede tekst.
- **Stille redistribution af finjustering** — forpligtelse #1 før udrulning
  i FACT 06 (i det udarbejdede eksempel) er "ingen stille finjustering
  under samme navn". Detektion: ethvert nyt vægt-hash betyder et nyt
  modelnavn og en ny forseglet publikation, eller forpligtelsen er brudt.
- **Skjulte fejlmodi** — FACT 04 forpligter sig til en liste over kendte
  fejlmodi. Listen er monoton (kan vokse, ikke skrumpe for et frosset
  checkpoint). Fremtidige opdagelser af fejlmodi, som laboratoriet
  internt kendte til, men ikke offentliggjorde, bliver omtvistelig
  evidens.

**Fejlmodi, der IKKE er dækket:**

- Modeller, der misbruges af nedstrømsbrugere (seglet beviser, hvad der
  blev udgivet, ikke hvad brugerne gør med det).
- Modstanderfinjustering fra tredjeparter (en tredjeparts finjustering
  producerer et andet vægt-hash, så det oprindelige segl påvirkes ikke,
  men tredjepartens model er uden for seglets beskyttelse).
- Adfærdsændringer på grund af ændringer i udrulningsmiljøet (forskellige
  systemprompter, RAG-konfigurationer osv.).
- Fejl, som laboratoriet reelt ikke kendte til på udgivelsestidspunktet.
  Seglet forpligter laboratoriet til *det, det vidste*; det kan ikke
  forankre det, det ikke vidste.

## Hvornår dette kit skal bruges

Du bør overveje at forsegle et modelkort, hvis:

- Du udgiver modelvægte offentligt ELLER udruller en model i en sammenhæng,
  hvor nedstrømsbrugere bekymrer sig om adfærdsstabilitet.
- Udgivelsen er betydelig nok til, at fremtidige tvister om "det sagde vi
  aldrig" er plausible (enhver model udrullet i skala; enhver
  sikkerhedskritisk model; enhver udgivelse ledsaget af kapacitetspåstande).
- Din organisation er villig til at indgå forpligtelser før udrulning,
  der begrænser fremtidige handlinger (dette er den bærende — se næste
  afsnit).
- Du kan beregne SHA-256 af vægtfilen ved udgivelse.

## Hvornår dette kit IKKE skal bruges

Brug IKKE dette kit, hvis:

- Du ikke er villig til at være bundet af forpligtelserne før udrulning i
  FACT 06 i eksemplet. Seglet gør forpligtelser mekanisk detekterbare; hvis
  du ikke er klar til denne ansvarlighed, så forsegl ikke.
- Vægtfilen vil ændre sig hyppigt (f.eks. kontinuerlige
  finjusteringspipelines). Hver vægtændring kræver en ny forseglet
  udgivelse. Forsegling pr. udgivelse er tung; dette kit er til *frosne*
  checkpoints.
- Du har ikke gennemført sikkerhedsgennemgangen endnu. Seglet forpligter
  sig til sikkerhedsgennemgangens fund. Hvis du forsegler en ufuldstændig
  gennemgang, har du en permanent offentlig registrering af en
  ufuldstændig gennemgang.
- Du måske vil tilbagetrække en specifik evalueringsscore senere. Seglet
  er permanent. Nye forseglede publikationer kan tilsidesætte, men den
  oprindelige kan ikke gøres ugjort.

## De bærende forpligtelser før udrulning

Eksemplets FACT 06 forpligter udgiveren til:

1. **Ingen stille finjustering under samme navn.** Enhver finjustering
   producerer et nyt modelnavn, en ny forseglet publikation, et nyt
   vægt-hash. Forgængeren forbliver kanonisk den navngivne version.

2. **Ingen stille evalueringsopdateringer.** Re-evalueringer får nye
   forseglede publikationer, der refererer til den oprindelige via
   Merkle-rod. Versioner spores, overskrives ikke.

3. **Kendte fejlmodi må vokse, aldrig skrumpe.** Et frosset checkpoint
   kan ikke få fejlmodi rettet. Så den offentliggjorte liste er reelt
   monoton.

4. **Håndtering af fjernelse.** Hvis det tvinges til at fjerne modellen
   fra distribution, forpligter laboratoriet sig til at offentliggøre en
   endelig forseglet erklæring om fjernelsen.

Et laboratorium, der adopterer dette kit, skal beslutte, hvilke af disse
forpligtelser det faktisk kan overholde. Hvis du ikke kan overholde alle
fire, modificér FACT 06 *før* forsegling, så det afspejler det, du kan
overholde, og acceptér den resulterende svækkede beskyttelse. At forsegle
forpligtelser, du ikke har til hensigt at overholde, er værre end slet
ikke at forsegle.

## Sådan forker du dette kit til en reel udgivelse

```bash
# 1. Kopiér dette eksempel ind i din udgivelsespipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Redigér hvert faktum for din reelle udgivelse
$EDITOR facts/01_example_notice.txt   # FJERN — din udgivelse er ikke et eksempel
                                       # Erstat med en udgivelsesmeddelelse for din model
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # det kanoniske modelkort
$EDITOR facts/05_eval_results.txt     # faktiske evalueringsresultater
$EDITOR facts/06_release_commitments.txt # hvilke forpligtelser du kan overholde

# 3. Opdatér site/index.html, så det afspejler den reelle udgivelse.

# 4. Forsegl.
bash build/seal.sh

# 5. Verificér lokalt.
python3 build/verify.py

# 6. Udrul til:
#    - Din udgivelsesside (ved siden af modelkortet og vægtene)
#    - IPFS-netværket (seal.sh-scriptet gør dette allerede)
#    - Valgfrit: link til den forseglede publikation fra dine
#      Hugging Face / GitHub release notes
```

## Integration med eksisterende udgivelsespipelines

Kittet er designet til at sammensættes med eksisterende værktøjer, ikke
erstatte dem:

- **Hugging Face**: inkludér den forseglede publikations URL eller IPFS CID
  i modelkortets README.md. Henvis læsere til seglet for byte-stabile
  udgivelsespåstande.
- **GitHub-udgivelser**: inkludér OpenTimestamps-kvitteringen
  (`merkle_root.txt.ots`) som et udgivelsesaktiv. Fremtidige tvister om at
  "udgivelsen ændrede sig" er så forankret til Bitcoin.
- **Modelkort-standarder (Mitchell et al. 2019)**: kittet er kompatibelt.
  Standardmodelkort-felterne mappes til FACTS 02–05 i seglet. Du producerer
  modelkortet normalt og forsegler det desuden.
- **Evaluerings-harnesses (lm-evaluation-harness, BIG-bench osv.)**: hash
  den nøjagtige harness-commit og det rå output-JSON; referér disse hashes
  i FACT 05. Fremtidige genkørsler er så uafhængigt reproducerbare.

## Beregning af vægt-hashet

For en enkelt safetensors-fil:

```bash
shasum -a 256 model.safetensors
```

For checkpoints med flere filer (GGUF-shards, sharded safetensors):

```bash
# Sammenkæd hashes i sorteret rækkefølge, og hash derefter igen
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Det endelige hash er, hvad der ryger i FACT 03. Inkludér både hashes pr.
shard og det endelige aggregerede hash, så brugere kan verificere
individuelle shards, mens de downloader.

## Hvad modtagere (brugere af din model) bør vide

En modeludgivelse med en MYRIAM-forseglet publikation lader brugeren:

1. **Verificere de vægte, de downloadede** ved at hashe igen og sammenligne
   med FACT 03.
2. **Verificere, at modelkortet ikke er blevet omskrevet bagudrettet**, ved
   at kontrollere det forseglede FACT 04 mod laboratoriets aktuelt
   offentliggjorte version.
3. **Verificere, at evalueringsscorerne er dem fra udgivelsen**, ved at
   sammenligne laboratoriets aktuelle evalueringspåstande mod det
   forseglede FACT 05.
4. **Holde laboratoriet ansvarligt for dets forpligtelser før udrulning**,
   ved at kontrollere faktisk adfærd mod det forseglede FACT 06.

En bruger, der finder uoverensstemmelser, har kryptografisk evidens for
uoverensstemmelsen. De kan offentliggøre denne evidens; den oprindelige
forseglede publikation er ankret.

## Hvad dette kit IKKE er

- Ikke en erstatning for faktisk at udføre sikkerhedsgennemgang. Seglet er
  *registreringen* af sikkerhedsgennemgang, ikke selve gennemgangen.
- Ikke en erstatning for faktiske evalueringer. Seglet forankrer de scorer,
  du producerer; det validerer ikke metodologien.
- Ikke en garanti for, at modellen er sikker. Seglet dokumenterer, hvad
  laboratoriet hævder om modellen ved udgivelse; det certificerer ikke
  disse påstande.
- Ikke beskyttelse mod modelmisbrug fra nedstrømsbrugere.

## En bemærkning om modstanderfinjustering

En almindelig AI-sikkerhedsbekymring: nogen finjusterer din model for at
fjerne sikkerhedsadfærd og redistribuerer den. Seglet KAN IKKE forhindre
dette. Hvad seglet kan gøre, er:

- Forankre, hvad den *oprindelige* model var beregnet til at gøre (FACT 04).
- Forankre, hvad de oprindelige evalueringsscorer var (FACT 05).
- Give et referencepunkt, som modstanderfinjusteringer kan måles imod.

En bruger, der støder på en tredjepartsredistribution, kan verificere, om
vægtene matcher det oprindelige forseglede hash. Hvis ikke, ved brugeren,
at de har en ikke-original model, og at eventuelle sikkerhedspåstande
tilskrevet laboratoriet ikke gælder.

## Afslutning

At forsegle en modeludgivelse er lidt ekstra arbejde for laboratoriet:
~10 minutter til at beregne hashes og køre seglscriptet, derefter en
30-sekunders beslutning om, hvilke forpligtelser før udrulning der skal
inkluderes. Den ansvarlighed, det tilføjer, er asymmetrisk: lille
omkostning for ærlige laboratorier, stor begrænsning for laboratorier,
der ellers ville have driftet deres påstande stille.

Hvis du er et AI-laboratorium, der overvejer adoption, er kittet
public domain (CC0). Fork det. Modificér det. Matematikken er den
bærende del, ikke den specifikke implementering.

## Licens

Public domain (CC0). Ingen attribution påkrævet.
