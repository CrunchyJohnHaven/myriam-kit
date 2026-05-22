*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Sett for vitenskapelig reproduserbarhet

Et nøkkelferdig myriam-kit-eksempel for forskningsgrupper, tidsskrifter
og institusjoner med fokus på reproduserbarhet, som ønsker å publisere
et Bitcoin-forankret, tukling-tydelig reproduserbarhetsmanifest sammen
med en artikkel eller preprint.

## Hva dette settet produserer

En forseglet publisering som for én studie inneholder:

1. Studieidentifikasjon (artikkeltittel, forfattere, institusjon, finansiører, interessekonflikter)
2. **SHA-256 av rådata-arkivet** — det kanoniske datasettet
3. **Hash av analysepipelinen** — skript + Docker-image-digest +
   låste avhengigheter
4. **Hash av forventet utdata-pakke** — det en trofast reprodusør skal
   produsere
5. Reproduksjonsprotokoll + publiseringsforpliktelser etter resultater
6. Signerende prinsipal(er)

Forseglingen er ment for **pre-analyse**-stadiet: data frosset,
pipeline ferdigstilt, forventet utdata beregnet, ALT før noen resultater
er sett med tanke på å skrive artikkelen.

## Hva dette settet forsvarer mot

**Feilmoduser forseglingen fanger opp:**

- **p-hacking**: endringer i analysen i ettertid etter å ha sett
  resultatene er oppdagbare via diff mellom forseglet FACT 04 og den
  publiserte pipelinen.
- **HARKing** (Hypothesizing After Results are Known — hypotesedannelse
  etter at resultatene er kjent): den forhåndsregistrerte hypotesen i
  FACT 02 er byte-stabil.
- **Datamanipulering etter artikkelen**: re-hashing av dataarkivet mot
  FACT 03 avslører enhver modifikasjon.
- **Pipeline-drift**: re-hashing av analysepipelinen mot FACT 04
  fanger opp stille endringer.
- **Forfatterskaps-manipulering**: stille tillegg eller fjerning av
  forfattere etter publisering blir oppdagbart mot forseglet FACT 02.

**Feilmoduser som IKKE dekkes:**

- Svindel i rådatainnsamlingen (forseglingen forankrer data ved
  forseglingstidspunktet, ikke ved innsamling)
- Biologisk / empirisk ikke-reproduserbarhet (forseglingen forankrer
  kun beregningsmessig reproduserbarhet)
- Spørsmål om utvalgsstørrelse eller populasjonsvaliditet (dette er
  studiedesignspørsmål)
- Sannheten i den underliggende påstanden (forseglingen forankrer hva
  som ble påstått, ikke om verden samsvarer med påstanden)

## Når man bør bruke dette settet

Vurder å forsegle dersom:

- Du er en forskningsgruppe som kjører en analyse med høy innsats
  (klinisk studie, evaluering av AI-system, replikasjonsstudie) og
  ønsker forensisk integritet utover tidsstemplene i OSF / GitHub
- Du er en forsker tidlig i karrieren som ønsker asymmetrisk
  omdømmebeskyttelse: forseglet pre-analyse betyr at fremtidig
  «de p-hacket»-kritikk har en offentlig falsifiserer
- Du er tidsskriftredaktør eller leder av et replikasjonsprosjekt og
  ønsker å oppmuntre til forhåndsregistrering på kryptografisk nivå
  for en delmengde av artikler
- Du jobber med en analyse der tilpasninger i ettertid har
  meningsfulle konsekvenser for fagfeltet (psykologi, atferdsøkonomi,
  medisinsk forskning)

## Historisk dødelighets- / skadeprøvedom

Settets dødelighetsrelevans er indirekte:

- **Ikke-reproduserbarhet i stamcelle- / kreftforskning:** flere
  artikler har ført til pasientskade via feildirigerte kliniske
  studier. Forseglet forhåndsregistrering av den opprinnelige
  pipelinen ville ha forankret sammenligningen.
- **Tamiflus effektivitetskontrovers:** Cochrane-gjennomgangen tok år
  delvis fordi tilgangen til rådata var omstridt. Forseglede
  datahasher ved publisering ville ha gjort tvister om datatilgang
  umiddelbart løsbare.
- **Den generelle ikke-reproduserbarhetskrisen:** den fagfelt-nivå
  dødelighetskostnaden av ikke-reproduserbar biomedisinsk forskning
  er betydelig (Begley & Ellis 2012 estimerte at >50 % av prekliniske
  funn er ikke-reproduserbare). Kryptografisk forankring er én
  strukturell spake.

## Hvordan forke dette settet

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

## Integrasjon med eksisterende vitenskapelig infrastruktur

- **arXiv / bioRxiv / medRxiv**: inkluder MYRIAM-forseglings-URL eller IPFS-CID
  i sammendraget eller i tilleggsmaterialet
- **OSF**: legg ved forseglingsartefakten til OSF-prosjektet sammen med
  det konvensjonelle forhåndsregistreringsskjemaet
- **AsPredicted**: inkluder MYRIAM-forseglings-URL i
  forhåndsregistreringsdokumentet
- **GitHub**: commit-hashen til analysepipelinen er det FACT 04
  forankrer; GitHub leverer kildekoden, MYRIAM forankrer bytene
- **Zenodo / Figshare / OpenAIRE**: deponer rådata, og forsegle deretter
  hashen til depositet; forseglingen er forensisk vanskeligere å stille
  erstatte enn deposit-metadataene
- **Tilleggsmateriale i tidsskrifter**: inkluder MYRIAM-
  forseglingsartefakten som tilleggsfil ved innsending

## Hva dette settet IKKE erstatter

- IRB / etikkomité-godkjenning
- Fagfellevurdering
- Replikasjonsstudier (beregningsmessig reproduserbarhet ≠ empirisk
  reproduserbarhet)
- Datatilgangsavtaler for sensitive data

## En merknad om forfatterrekkefølge og kreditt

Forseglingen forankrer FORFATTERLISTEN på forseglingstidspunktet.
Tvister om forfatterskap som oppstår etter publisering kan vurderes
mot den forseglede listen. Dette er en liten ansvars-spake — viktig
for forskere tidlig i karrieren som blir lagt til eller fjernet i
stillhet.

## Lisens

Public domain (CC0). Bruk det, modifiser det, ignorer det, fork det.
