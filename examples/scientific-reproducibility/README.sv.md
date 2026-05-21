*Svensk översättning — för den ursprungliga engelska versionen, se [README.md](README.md)*

# Kit för vetenskaplig reproducerbarhet

Ett nyckelfärdigt myriam-kit-exempel för forskargrupper, vetenskapliga tidskrifter och reproducerbarhetsinriktade institutioner som vill publicera ett Bitcoin-förankrat, manipuleringsbevisande reproducerbarhetsmanifest tillsammans med en artikel eller ett preprint.

## Vad detta kit producerar

En förseglad publicering som för en enskild studie innehåller:

1. Identifiering av studien (artikeltitel, författare, institution, finansiärer, intressekonflikter)
2. **SHA-256 för rådataarkivet** — det kanoniska datasetet
3. **Hash av analyspipelinen** — skript + Docker-image-digest + fastnålade beroenden
4. **Hash av buntet med förväntat utfall** — vad en trogen reproducerare bör få fram
5. Reproduktionsprotokoll + publiceringsåtaganden efter att resultat föreligger
6. Signerande principal(er)

Förseglingen är avsedd för **förhandsanalysstadiet**: data infrysta, pipeline färdigställd, förväntat utfall beräknat, ALLT innan några resultat har setts i syfte att skriva artikeln.

## Vad detta kit skyddar mot

**Felmoder som förseglingen fångar:**

- **p-hacking**: efterhandsändringar av analysen efter att resultaten setts kan upptäckas via en diff mellan förseglat FAKTUM 04 och den publicerade pipelinen.
- **HARKing** (Hypothesizing After Results are Known — hypotesformulering efter att resultaten är kända): den förregistrerade hypotesen i FAKTUM 02 är bytestabil.
- **Datamanipulation efter publicering**: omhashing av dataarkivet mot FAKTUM 03 avslöjar varje modifikation.
- **Pipelinedrift**: omhashing av analyspipelinen mot FAKTUM 04 fångar tysta ändringar.
- **Författarmanipulation**: tysta tillägg eller avlägsnanden av författare efter publicering blir upptäckbara mot förseglat FAKTUM 02.

**Felmoder som INTE täcks:**

- Fusk vid insamling av rådata (förseglingen förankrar data vid förseglingstillfället, inte vid insamlingen)
- Biologisk / empirisk icke-reproducerbarhet (förseglingen förankrar endast beräkningsmässig reproducerbarhet)
- Frågor om stickprovsstorlek eller populationsvaliditet (dessa är frågor om studiedesign)
- Sanningen i det underliggande påståendet (förseglingen förankrar vad som hävdades, inte huruvida världen motsvarar påståendet)

## När du bör använda detta kit

Överväg att försegla om:

- Du är en forskargrupp som genomför en analys med höga insatser (klinisk prövning, utvärdering av AI-system, replikationsstudie) och vill ha forensisk integritet utöver tidsstämplar från OSF / GitHub
- Du är en tidigt karriärforskare som vill ha asymmetriskt anseendeskydd: en förseglad förhandsanalys betyder att framtida kritik av typen "de p-hackade" har en offentlig falsifierare
- Du är redaktör för en vetenskaplig tidskrift eller ansvarig för ett replikationsprojekt och vill uppmuntra kryptografisk förregistrering för en delmängd av artiklarna
- Du arbetar med en analys där efterhandsjusteringar har meningsfulla konsekvenser för fältet (psykologi, beteendeekonomi, medicinsk forskning)

## Historiskt prejudikat avseende dödlighet/skada

Detta kits dödlighetsrelevans är indirekt:

- **Icke-reproducerbarhet inom stamcells- och cancerforskning:** flera artiklar har lett till patientskada via missriktade kliniska prövningar. Förseglad förregistrering av den ursprungliga pipelinen skulle ha förankrat jämförelsen.
- **Kontroversen kring Tamiflus effektivitet:** Cochrane-översikten tog år, delvis för att tillgången till rådata var omtvistad. Förseglade datahashar vid publicering skulle ha gjort tvister om dataåtkomst omedelbart lösbara.
- **Den allmänna reproducerbarhetskrisen:** den fältövergripande dödlighetskostnaden av icke-reproducerbar biomedicinsk forskning är betydande (Begley & Ellis 2012 uppskattade att >50 % av prekliniska fynd är icke-reproducerbara). Kryptografisk förankring är en strukturell hävstång.

## Så forkar du detta kit

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

## Integration med befintlig akademisk infrastruktur

- **arXiv / bioRxiv / medRxiv**: inkludera MYRIAM-förseglingens URL eller IPFS-CID i sammanfattningen eller i det kompletterande materialet
- **OSF**: bifoga förseglingsartefakten till OSF-projektet vid sidan av det konventionella förregistreringsformuläret
- **AsPredicted**: inkludera MYRIAM-förseglingens URL i förregistreringsdokumentet
- **GitHub**: det är analyspipelinens commit-hash som FAKTUM 04 förankrar; GitHub tillhandahåller källan, MYRIAM förankrar byten
- **Zenodo / Figshare / OpenAIRE**: deponera rådata, försegla sedan depositionens hash; förseglingen är forensiskt svårare att tyst ersätta än depositionens metadata
- **Kompletterande material i tidskrifter**: inkludera MYRIAM-förseglingsartefakten som en kompletterande fil vid inlämning

## Vad detta kit INTE ersätter

- Godkännande från etikprövningsnämnd / etikkommitté
- Granskning av sakkunniga
- Replikationsstudier (beräkningsmässig reproducerbarhet ≠ empirisk reproducerbarhet)
- Dataåtkomstavtal för känsliga data

## En anmärkning om författarordning och erkännande

Förseglingen förankrar FÖRFATTARLISTAN vid förseglingstillfället. Tvister om författarskap som uppstår efter publicering kan bedömas mot den förseglade listan. Detta är en liten ansvarsutkrävande hävstång — viktig för tidigt karriärforskare som tyst läggs till eller avlägsnas.

## Licens

Public domain (CC0). Använd det, modifiera det, ignorera det, forka det.
