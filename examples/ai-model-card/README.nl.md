*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Kit voor het vergrendelen van AI-modelgedrag

Een kant-en-klaar myriam-kit-voorbeeld voor AI-laboratoria
(commercieel of open source) die een model uitbrengen en de beweringen
van de release — gewicht-identiteit, capaciteiten, evaluatiescores,
veiligheidsbeoordeling, verplichtingen vóór inzet — **cryptografisch
willen verankeren en publiek verifieerbaar** willen maken.

Het kit verdedigt tegen de specifieke faalmodus waarbij ingezette
modellen stilzwijgend afdrijven, evaluatiescores achteraf worden
herzien, of beweringen vóór inzet jaren later worden betwist met
"dat hebben we nooit gezegd."

## Wat dit kit produceert

Een cryptografisch verzegeld manifest dat voor één modelrelease bevat:

1. Modelidentificatie (naam, architectuur, aantal parameters, licentie)
2. **SHA-256 van het gewichtsbestand** — de canonieke artefacthash
3. Tekst van de modelkaart (capaciteiten, beoogd gebruik, gebruik
   buiten de scope, bekende faalmodi)
4. Evaluatieresultaten bij release (capaciteitsevaluaties,
   veiligheidsevaluaties, kalibratie)
5. Verplichtingen vóór inzet (de dingen die u toezegt niet
   stilzwijgend te wijzigen na release)
6. Ondertekenende principaal (de mens + organisatie die
   verantwoordelijkheid neemt)

De verzegeling maakt elk van deze byte-stabiel, in tijd verankerd
aan Bitcoin via OpenTimestamps, en opvraagbaar via IPFS onafhankelijk
van enige afzonderlijke hostingpartij.

Zie het uitgewerkte fictieve voorbeeld: [facts/](facts/) en de
gerenderde [site/index.html](site/index.html). Het voorbeeld gebruikt
een fictief model ("Calm-mini-v0"); een echte release zou de
voorbeeldinhoud vervangen.

## Waartegen dit kit beschermt

**Faalmodi die de verzegeling direct opvangt:**

- **Manipulatie van gewichten** — de SHA-256 van het uitgebrachte
  gewichtsbestand staat in FEIT 03. Elke wijziging na release van
  de bytes die een gebruiker downloadt, is detecteerbaar door
  opnieuw te hashen.
- **Stilzwijgende retroactieve aanpassingen van evaluaties** — de
  evaluatiescores bij release staan in FEIT 05. Toekomstige
  geschillen over "de evaluatiescore was altijd X" hebben een
  publieke verankering.
- **Drift in capaciteitsbeweringen** — de tekst van de modelkaart
  in FEIT 04 is byte-stabiel. Toekomstige geschillen over "we
  hebben nooit capaciteit X beweerd" zijn publiek controleerbaar
  tegen de verzegelde tekst.
- **Stilzwijgende herdistributie van fine-tuning** —
  verplichting #1 vóór inzet in FEIT 06 (in het uitgewerkte
  voorbeeld) is "geen stilzwijgende fine-tuning onder dezelfde
  naam." Detectie: elke nieuwe gewicht-hash betekent een nieuwe
  modelnaam en een nieuwe verzegelde publicatie, anders is de
  verplichting geschonden.
- **Verborgen faalmodi** — FEIT 04 verbindt zich aan een lijst van
  bekende faalmodi. De lijst is monotoon (kan groeien, niet
  krimpen voor een bevroren checkpoint). Toekomstige ontdekkingen
  van faalmodi waarvan het laboratorium intern wist maar die niet
  publiceerde, worden betwistbaar bewijs.

**Faalmodi die NIET worden gedekt:**

- Modellen die door gebruikers verderop in de keten worden
  misbruikt (de verzegeling bewijst wat is uitgebracht, niet wat
  gebruikers ermee doen).
- Adversariële fine-tuning door derden (een fine-tune door derden
  produceert een andere gewicht-hash, dus de oorspronkelijke
  verzegeling wordt niet aangetast, maar het model van de derde
  partij valt buiten de bescherming van de verzegeling).
- Gedragsveranderingen door wijzigingen in de inzetomgeving
  (andere systeemprompts, RAG-configuraties, enz.).
- Falen waarvan het laboratorium oprecht niet wist op het moment
  van release. De verzegeling verbindt het laboratorium aan *wat
  ze wisten*; ze kan niet verankeren wat ze niet wisten.

## Wanneer dit kit te gebruiken

U zou moeten overwegen een modelkaart te verzegelen als:

- U modelgewichten publiekelijk uitbrengt OF een model inzet in een
  context waar gebruikers verderop in de keten geven om
  gedragsstabiliteit.
- De release belangrijk genoeg is dat toekomstige geschillen over
  "dat hebben we nooit gezegd" plausibel zijn (elk model dat op
  schaal wordt ingezet; elk veiligheidskritisch model; elke release
  vergezeld van capaciteitsbeweringen).
- Uw organisatie bereid is verplichtingen vóór inzet aan te gaan
  die toekomstige acties beperken (dit is het lastdragende — zie
  de volgende sectie).
- U de SHA-256 van het gewichtsbestand kunt berekenen bij release.

## Wanneer dit kit NIET te gebruiken

Gebruik dit kit NIET als:

- U niet bereid bent gebonden te zijn aan de verplichtingen vóór
  inzet in FEIT 06 van het voorbeeld. De verzegeling maakt
  verplichtingen mechanisch detecteerbaar; als u niet voorbereid
  bent op die verantwoording, verzegel dan niet.
- Het gewichtsbestand vaak zal veranderen (bv. continue
  fine-tuning-pijplijnen). Elke gewichtsverandering vereist een
  nieuwe verzegelde release. Per-release-verzegeling is zwaar; dit
  kit is voor *bevroren* checkpoints.
- U de veiligheidsbeoordeling nog niet heeft gedaan. De
  verzegeling verbindt de bevindingen van de veiligheids-
  beoordeling. Als u een onvolledige beoordeling verzegelt, heeft
  u een permanent publiek register van een onvolledige
  beoordeling.
- U mogelijk een specifieke evaluatiescore later wilt intrekken.
  De verzegeling is permanent. Nieuwe verzegelde publicaties
  kunnen overrulen, maar het origineel kan niet ongedaan worden
  gemaakt.

## De lastdragende verplichtingen vóór inzet

FEIT 06 van het voorbeeld verbindt de uitgever aan:

1. **Geen stilzwijgende fine-tuning onder dezelfde naam.** Elke
   fine-tune produceert een nieuwe modelnaam, een nieuwe
   verzegelde publicatie, een nieuwe gewicht-hash. De voorganger
   blijft canoniek de benoemde versie.

2. **Geen stilzwijgende evaluatie-updates.** Herevaluaties krijgen
   nieuwe verzegelde publicaties die naar het origineel verwijzen
   via Merkle-root. Versies worden bijgehouden, niet overschreven.

3. **Bekende faalmodi mogen groeien, nooit krimpen.** Een bevroren
   checkpoint kan geen faalmodi laten verhelpen. Dus de
   gepubliceerde lijst is in feite monotoon.

4. **Behandeling van verwijdering.** Indien gedwongen het model uit
   de distributie te halen, verbindt het laboratorium zich tot het
   publiceren van een laatste verzegelde verklaring over de
   verwijdering.

Een laboratorium dat dit kit invoert, moet beslissen welke van die
verplichtingen het werkelijk kan honoreren. Als u niet alle vier
kunt honoreren, pas FEIT 06 dan *vóór* het verzegelen aan om te
weerspiegelen wat u wel kunt honoreren, en accepteer de resulterende
verzwakte bescherming. Verplichtingen verzegelen die u niet wilt
honoreren is erger dan helemaal niet verzegelen.

## Hoe dit kit te forken voor een echte release

```bash
# 1. Copy this example into your release pipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Edit each fact for your real release
$EDITOR facts/01_example_notice.txt   # REMOVE — your release is not an example
                                       # Replace with a release notice for your model
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # the canonical model card
$EDITOR facts/05_eval_results.txt     # actual eval results
$EDITOR facts/06_release_commitments.txt # which commitments you can honor

# 3. Update site/index.html to reflect the real release.

# 4. Seal.
bash build/seal.sh

# 5. Verify locally.
python3 build/verify.py

# 6. Deploy to:
#    - Your release page (next to the model card and weights)
#    - The IPFS network (the seal.sh script already does this)
#    - Optionally: link to the sealed publication from your
#      Hugging Face / GitHub release notes
```

## Integratie met bestaande release-pijplijnen

Het kit is ontworpen om samen te werken met bestaande gereedschappen,
niet om ze te vervangen:

- **Hugging Face**: voeg de URL of IPFS-CID van de verzegelde
  publicatie toe aan de README.md van de modelkaart. Verwijs lezers
  naar de verzegeling voor byte-stabiele release-beweringen.
- **GitHub-releases**: voeg het OpenTimestamps-ontvangstbewijs
  (`merkle_root.txt.ots`) toe als release-asset. Toekomstige
  geschillen over "de release is veranderd" zijn dan verankerd
  aan Bitcoin.
- **Modelkaart-standaarden (Mitchell et al. 2019)**: het kit is
  compatibel. De standaard modelkaart-velden mappen naar FEITEN
  02–05 van de verzegeling. U produceert de modelkaart normaal en
  verzegelt deze daarnaast.
- **Eval-harnassen (lm-evaluation-harness, BIG-bench, enz.)**:
  hash de exacte harnas-commit en de ruwe output-JSON; verwijs
  naar die hashes in FEIT 05. Toekomstige heruitvoeringen zijn dan
  onafhankelijk reproduceerbaar.

## De gewicht-hash berekenen

Voor één enkel safetensors-bestand:

```bash
shasum -a 256 model.safetensors
```

Voor checkpoints met meerdere bestanden (GGUF-shards, sharded
safetensors):

```bash
# Concatenate hashes in sorted order, then hash again
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

De uiteindelijke hash is wat in FEIT 03 komt. Voeg zowel de
per-shard-hashes als de uiteindelijke geaggregeerde hash toe, zodat
gebruikers afzonderlijke shards kunnen verifiëren terwijl ze deze
downloaden.

## Wat ontvangers (gebruikers van uw model) moeten weten

Een modelrelease met een MYRIAM-verzegelde publicatie stelt de
gebruiker in staat om:

1. **De gewichten die ze hebben gedownload te verifiëren** door
   opnieuw te hashen en te vergelijken met FEIT 03.
2. **Te verifiëren dat de modelkaart niet retroactief is gewijzigd**
   door het verzegelde FEIT 04 te vergelijken met de huidige
   gepubliceerde versie van het laboratorium.
3. **Te verifiëren dat de evaluatiescores die uit de release zijn**
   door de huidige evaluatiebeweringen van het laboratorium te
   vergelijken met het verzegelde FEIT 05.
4. **Het laboratorium verantwoordelijk te houden voor zijn
   verplichtingen vóór inzet** door het werkelijke gedrag te
   vergelijken met het verzegelde FEIT 06.

Een gebruiker die discrepanties vindt, heeft cryptografisch bewijs
van de discrepantie. Ze kunnen dat bewijs publiceren; de
oorspronkelijke verzegelde publicatie is de verankering.

## Wat dit kit NIET is

- Geen vervanging voor het daadwerkelijk uitvoeren van
  veiligheidsbeoordeling. De verzegeling is het *register* van
  veiligheidsbeoordeling, niet de beoordeling zelf.
- Geen vervanging voor werkelijke evaluaties. De verzegeling
  verankert de scores die u produceert; ze valideert de methodologie
  niet.
- Geen garantie dat het model veilig is. De verzegeling documenteert
  wat het laboratorium beweert over het model bij release; ze
  certificeert die beweringen niet.
- Geen bescherming tegen misbruik van het model door gebruikers
  verderop in de keten.

## Een opmerking over adversariële fine-tuning

Een veelvoorkomende AI-veiligheidszorg: iemand fine-tunet uw model
om veiligheidsgedrag te verwijderen en herdistribueert het. De
verzegeling KAN dit NIET voorkomen. Wat de verzegeling wel kan doen
is:

- Verankeren wat het *oorspronkelijke* model geacht werd te doen
  (FEIT 04).
- Verankeren wat de oorspronkelijke evaluatiescores waren (FEIT 05).
- Een referentiepunt bieden waartegen adversariële fine-tunes
  kunnen worden gemeten.

Een gebruiker die een herdistributie door een derde partij
tegenkomt, kan verifiëren of de gewichten overeenkomen met de
oorspronkelijke verzegelde hash. Zo niet, dan weet de gebruiker
dat zij een niet-origineel model hebben en dat eventuele
veiligheidsbeweringen die aan het laboratorium worden toegeschreven,
niet van toepassing zijn.

## Afsluiting

Een modelrelease verzegelen is weinig extra werk voor het
laboratorium: ~10 minuten om hashes te berekenen en het
verzegelingsscript uit te voeren, daarna een beslissing van 30
seconden over welke verplichtingen vóór inzet moeten worden
opgenomen. De verantwoording die het toevoegt is asymmetrisch:
kleine kosten voor eerlijke laboratoria, grote beperking voor
laboratoria die anders stilzwijgend hun beweringen zouden laten
afdrijven.

Als u een AI-laboratorium bent dat invoering overweegt, is het kit
public domain (CC0). Forka het. Pas het aan. De wiskunde is het
lastdragende stuk, niet de specifieke implementatie.

## License

Public domain (CC0). No attribution required.
