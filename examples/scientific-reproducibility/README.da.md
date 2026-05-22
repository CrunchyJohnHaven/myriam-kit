*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Kit til videnskabelig reproducerbarhed

Et nøglefærdigt myriam-kit-eksempel for forskningsgrupper, tidsskrifter
og reproducerbarhedsfokuserede institutioner, der ønsker at udgive et
Bitcoin-forankret, manipulationsbevisende reproducerbarhedsmanifest
sammen med en artikel eller preprint.

## Hvad dette kit producerer

En forseglet publikation, der for én undersøgelse indeholder:

1. Studieidentifikation (artikeltitel, forfattere, institution, finansieringskilder, interessekonflikter)
2. **SHA-256 af rådata-arkivet** — det kanoniske datasæt
3. **Hash af analysepipelinen** — script + Docker-image-digest +
   låste afhængigheder
4. **Hash af det forventede output-bundt** — hvad en trofast
   reproducent bør producere
5. Reproduktionsprotokol + publikationsforpligtelser efter resultater
6. Underskrivende principal(er)

Seglet er beregnet til **præ-analyse**-stadiet: data frosset,
pipeline færdiggjort, forventet output beregnet, ALT før nogen
resultater er set med henblik på at skrive artiklen.

## Hvad dette kit forsvarer mod

**Fejlmoduser, som seglet fanger:**

- **p-hacking**: post hoc-ændringer af analysen efter at have set
  resultaterne er påviselige via diff mellem forseglet FACT 04 og den
  udgivne pipeline.
- **HARKing** (Hypothesizing After Results are Known — at danne
  hypoteser efter at resultaterne er kendt): den prægregistrerede
  hypotese i FACT 02 er byte-stabil.
- **Datamanipulation efter artiklen**: gen-hashing af dataarkivet mod
  FACT 03 afslører enhver ændring.
- **Pipeline-drift**: gen-hashing af analysepipelinen mod FACT 04
  fanger stille ændringer.
- **Forfatterskabs-manipulation**: stille tilføjelse eller fjernelse af
  forfattere efter udgivelsen bliver påviselig mod det forseglede
  FACT 02.

**Fejlmoduser, som IKKE er dækket:**

- Svindel i rådataindsamlingen (seglet forankrer data på
  forseglingstidspunktet, ikke ved indsamling)
- Biologisk / empirisk ikke-reproducerbarhed (seglet forankrer kun
  beregningsmæssig reproducerbarhed)
- Spørgsmål om stikprøvestørrelse eller populationsvaliditet (dette er
  spørgsmål om studiedesign)
- Sandheden i den underliggende påstand (seglet forankrer, hvad der
  blev påstået, ikke om verden svarer til påstanden)

## Hvornår man skal bruge dette kit

Overvej forsegling, hvis:

- Du er en forskningsgruppe, der kører en højrisiko-analyse (klinisk
  forsøg, evaluering af AI-system, replikationsstudie) og ønsker
  forensisk integritet ud over tidsstempler fra OSF / GitHub
- Du er en forsker tidligt i karrieren, der ønsker asymmetrisk
  omdømmebeskyttelse: forseglet præ-analyse betyder, at fremtidig
  „de p-hackede"-kritik har en offentlig falsifikator
- Du er tidsskriftsredaktør eller leder af et replikationsprojekt og
  ønsker at fremme prægregistrering på kryptografisk niveau for en
  delmængde af artikler
- Du arbejder med en analyse, hvor post hoc-justeringer har
  meningsfulde konsekvenser for fagområdet (psykologi, adfærdsøkonomi,
  medicinsk forskning)

## Historisk dødeligheds- / skadepræcedens

Kittets dødelighedsrelevans er indirekte:

- **Ikke-reproducerbarhed i stamcelle- / kræftforskning:** flere
  artikler har ført til patientskade via fejlrettede kliniske
  forsøg. Forseglet prægregistrering af den oprindelige pipeline ville
  have forankret sammenligningen.
- **Tamiflus effektivitetskontrovers:** Cochrane-gennemgangen tog år,
  delvis fordi adgangen til rådata var omstridt. Forseglede datahashes
  ved udgivelse ville have gjort tvister om dataadgang umiddelbart
  løsbare.
- **Den generelle ikke-reproducerbarhedskrise:** den fagområde-niveau
  dødelighedsomkostning ved ikke-reproducerbar biomedicinsk forskning
  er betydelig (Begley & Ellis 2012 anslog, at >50 % af prækliniske
  fund er ikke-reproducerbare). Kryptografisk forankring er én
  strukturel håndtag.

## Hvordan man forker dette kit

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## Integration med eksisterende videnskabelig infrastruktur

- **arXiv / bioRxiv / medRxiv**: inkludér MYRIAM-segl-URL eller IPFS-CID
  i abstractet eller i supplerende materiale
- **OSF**: vedhæft seglartefakten til OSF-projektet sammen med det
  konventionelle prægregistreringsskema
- **AsPredicted**: inkludér MYRIAM-segl-URL i
  prægregistreringsdokumentet
- **GitHub**: analysepipelinens commit-hash er det, FACT 04 forankrer;
  GitHub leverer kildekoden, MYRIAM forankrer bytes
- **Zenodo / Figshare / OpenAIRE**: depositér rådata, og forsegl
  derefter hashen af depositet; seglet er forensisk vanskeligere
  stille at erstatte end deposit-metadataene
- **Supplerende materiale i tidsskrifter**: inkludér
  MYRIAM-seglartefakten som en supplerende fil ved indsendelse

## Hvad dette kit IKKE erstatter

- IRB- / etikkomitégodkendelse
- Peer review
- Replikationsstudier (beregningsmæssig reproducerbarhed ≠ empirisk
  reproducerbarhed)
- Dataadgangsaftaler for følsomme data

## En bemærkning om forfatterrækkefølge og kreditering

Seglet forankrer FORFATTERLISTEN på forseglingstidspunktet. Tvister om
forfatterskab, der opstår efter publikation, kan vurderes mod den
forseglede liste. Dette er et lille håndtag for ansvarlighed — vigtigt
for forskere tidligt i karrieren, der bliver tilføjet eller fjernet i
stilhed.

## Licens

Public domain (CC0). Brug det, modificér det, ignorér det, fork det.
