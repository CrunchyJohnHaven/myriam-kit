*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Wetenschappelijke Reproduceerbaarheidskit

Een turnkey myriam-kit voorbeeld voor onderzoeksgroepen, tijdschriften en op reproduceerbaarheid gerichte instellingen die een aan Bitcoin verankerd, tamper-evident reproduceerbaarheidsmanifest willen publiceren naast een artikel of preprint.

## Wat deze kit produceert

Een verzegelde publicatie die, voor één studie, bevat:

1. Studie-identificatie (artikeltitel, auteurs, instelling, financiers, COI)
2. **SHA-256 van het ruwe-data-archief** — de canonieke dataset
3. **Hash van de analyse-pipeline** — script + Docker-image-digest + vastgepinde afhankelijkheden
4. **Hash van het verwachte-output-bundel** — wat een trouwe reproduceerder zou moeten produceren
5. Reproductieprotocol + verbintenissen voor publicatie na het resultaat
6. Ondertekenende principaal(en)

Het zegel is bedoeld voor het **pre-analyse**-stadium: data bevroren, pipeline gefinaliseerd, verwachte output berekend, ALLES voordat enig resultaat is gezien met het doel het artikel te schrijven.

## Waartegen deze kit beschermt

**Faalmodi die het zegel detecteert:**

- **p-hacking**: post-hoc wijzigingen aan de analyse na het zien van de resultaten zijn detecteerbaar via diff tussen de verzegelde FACT 04 en de gepubliceerde pipeline.
- **HARKing** (Hypothesizing After Results are Known): de pre-geregistreerde hypothese in FACT 02 is byte-stabiel.
- **Datamanipulatie na het artikel**: het opnieuw hashen van het data-archief tegen FACT 03 onthult elke modificatie.
- **Pipeline-drift**: het opnieuw hashen van de analyse-pipeline tegen FACT 04 vangt stille wijzigingen op.
- **Auteurschap-spel**: het stil toevoegen of verwijderen van auteurs na publicatie wordt detecteerbaar tegen de verzegelde FACT 02.

**Faalmodi die NIET worden gedekt:**

- Fraude bij ruwe-data-verzameling (het zegel verankert data op het moment van verzegeling, niet van verzameling)
- Biologische / empirische niet-reproduceerbaarheid (het zegel verankert alleen computationele reproduceerbaarheid)
- Steekproefgrootte- of populatie-validiteitskwesties (dit zijn studieontwerp-vragen)
- De waarheid van de onderliggende claim (het zegel verankert wat werd beweerd, niet of de wereld bij de claim past)

## Wanneer deze kit te gebruiken

Overweeg verzegeling als:

- U een onderzoeksgroep bent die een analyse met grote inzet uitvoert (klinische proef, AI-systeem-evaluatie, replicatiestudie) en forensische integriteit wenst die verder gaat dan OSF- / GitHub-tijdstempels
- U een onderzoeker aan het begin van uw carrière bent die asymmetrische reputatiebescherming wenst: verzegelde pre-analyse betekent dat toekomstige "ze hebben p-hacking gedaan"-kritiek een publieke falsifier heeft
- U een tijdschriftredacteur of leider van een replicatieproject bent die cryptografisch-grade pre-registratie voor een subset van artikelen wil aanmoedigen
- U werkt aan een analyse waarin post-hoc-aanpassingen betekenisvolle veldgevolgen hebben (psychologie, gedragseconomie, medisch onderzoek)

## Historisch sterfte- / schadeprecedent

De sterfte-relevantie van deze kit is indirect:

- **Stamcel- / kankeronderzoek-irreproduceerbaarheid:** verschillende artikelen hebben geleid tot patiëntenschade via verkeerd gerichte klinische proeven. Verzegelde pre-registratie van de oorspronkelijke pipeline zou de vergelijking hebben verankerd.
- **Controverse rond Tamiflu's effectiviteit:** de Cochrane-review nam jaren in beslag, deels omdat toegang tot ruwe data werd betwist. Verzegelde data-hashes bij publicatie zouden geschillen over data-toegang onmiddellijk oplosbaar hebben gemaakt.
- **Algemene irreproduceerbaarheidscrisis:** de veld-niveau sterftekost van onreproduceerbaar biomedisch onderzoek is significant (Begley & Ellis 2012 schatten >50% van de preklinische bevindingen onreproduceerbaar). Cryptografische verankering is één structurele hefboom.

## Hoe deze kit te forken

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

## Integratie met bestaande wetenschappelijke infrastructuur

- **arXiv / bioRxiv / medRxiv**: neem de MYRIAM-zegel-URL of IPFS-CID op in het abstract of de aanvullende materialen
- **OSF**: voeg het zegel-artefact bij het OSF-project toe naast het conventionele pre-registratieformulier
- **AsPredicted**: neem de MYRIAM-zegel-URL op in het pre-registratiedocument
- **GitHub**: de commit-hash van de analyse-pipeline is wat FACT 04 verankert; GitHub levert de broncode, MYRIAM verankert de bytes
- **Zenodo / Figshare / OpenAIRE**: deponeer ruwe data, verzegel dan de hash van de deponering; het zegel is forensisch moeilijker stil te vervangen dan de deponeringsmetadata
- **Aanvullende materialen van het tijdschrift**: neem het MYRIAM-zegel-artefact op als aanvullend bestand bij indiening

## Wat deze kit NIET vervangt

- IRB- / ethische-commissie-goedkeuring
- Peer review
- Replicatiestudies (computationele reproduceerbaarheid ≠ empirische reproduceerbaarheid)
- Data-toegangsovereenkomsten voor gevoelige data

## Een noot over auteursvolgorde en krediet

Het zegel verankert de AUTEURSLIJST op het moment van verzegeling. Geschillen over auteurschap die na publicatie ontstaan, kunnen worden geëvalueerd tegen de verzegelde lijst. Dit is een kleine verantwoordingshefboom — belangrijk voor ECR's die stil worden toegevoegd of verwijderd.

## Licentie

Publiek domein (CC0). Gebruik het, wijzig het, negeer het, fork het.
