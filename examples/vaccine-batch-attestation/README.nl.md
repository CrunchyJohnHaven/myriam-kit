*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Kit voor attestatie van vaccinbatch

Een kant-en-klaar myriam-kit-voorbeeld voor vaccinfabrikanten, autoriteiten
voor kwaliteitsborging en volksgezondheidsinstanties die een op Bitcoin
verankerd, manipulatie-detecterend zegel van een batchvrijgave willen
publiceren.

## Waartegen deze kit verdedigt

**Faalmodi die het zegel opvangt:**

- **Stille retroactieve wijziging van vrijgavetestresultaten.** Alle 8
  vrijgavetest-PDF's in het voorbeeld worden gehasht. Opnieuw hashen na
  vrijgave onthult elke wijziging.
- **Geschillen over welke specificaties van toepassing waren bij
  vrijgave.** De verzegelde FACT 02 bevat de canonieke
  batchidentificatie en de hash van het productiedossier. Toekomstige
  "de specificatie was altijd X"-geschillen hebben een publiek anker.
- **Stille minimalisering van de terugroep-omvang.**
  Geneesmiddelenbewakings-toezeggingen in FACT 05 zijn verzegeld; het
  niet nakomen ervan is publiekelijk waarneembaar.
- **Retroactieve herspecificatie voor een out-of-spec batch.** Als een
  vrijgavetestresultaat eigenlijk een grensgeval PASS was dat na
  vrijgave wordt geherclassificeerd als FAIL, bewijzen de hashes van
  de verzegelde rapporten wat de oorspronkelijke resultaat-PDF zei.

**Faalmodi die NIET worden gedekt:**

- Fraude in het productieproces zelf (het zegel verankert
  testresultaten, niet de productie-integriteit).
- Bijwerkingen die biologische gevolgen zijn van een verder voldoende
  batch (het zegel certificeert geen klinische veiligheid, alleen
  documentatie-integriteit).
- Geschillen over welke versie van een regulatoire specificatie
  gezaghebbend is.

## Wanneer deze kit te gebruiken

Overweeg een batchvrijgave te verzegelen als:

- U een vaccinfabrikant bent die forensische integriteit van
  vrijgavedossiers wil aantonen verder dan wat regelgevers eisen
- U een QA-team bent dat een "publiceer wat we attesteren"-praktijk
  aanneemt
- U een kleine/nationale fabrikant bent in een jurisdictie met
  zwakkere regulatoire infrastructuur, en batchdossiers wil verankeren
  tegen een mondiale verifieerder
- U een volksgezondheidsinstantie of NGO bent die een
  niet-commercieel vaccinproductieprogramma uitvoert (bijv. voor
  verwaarloosde ziekten)

## Historisch sterftecijfer-precedent

- **Heparineverontreiniging (2008, China):** namaak oversulfaat
  chondroïtinesulfaat in heparinebatches. Een verzegeld
  vrijgavetest-manifest zou stille post-vrijgave-modificatie van het
  testdossier cryptografisch detecteerbaar hebben gemaakt.
- **Tylenol-cyanide (1982):** retroactieve geschillen over het
  oorsprongspunt van manipulatie. Een verzegelde hash van het
  productiedossier verankert de staat vóór distributie.
- **Diverse vaccinbatch-terugroepingen** waarbij de vraag "is deze
  batch ooit correct getest" jaren later betwist raakt.

De kit is GEEN oplossing voor een van deze gevallen in strikte zin —
maar in elk geval zouden verzegelde batchattestaties een schonere
forensische tijdlijn hebben opgeleverd.

## Hoe deze kit te forken voor een echte batch

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # vervang fictieve inhoud door echte batch
bash build/seal.sh        # VERZEGEL VOORDAT distributie begint
python3 build/verify.py   # bevestigen
```

**KRITIEKE TIMING**: verzegel op het moment van QA-vrijgave, VOORDAT
de batch wordt gedistribueerd. Een zegel na distributie is forensisch
zwakker.

## Integratie met bestaande farmaceutische infrastructuur

- **eCTD-indieningen (FDA / EMA):** de verzegelde publicatie-URL of
  IPFS-CID kan worden gerefereerd in de Module 3-sectie (kwaliteit)
- **WHO Prequalification:** het verzegelde manifest demonstreert de
  pre-vrijgave-testketen aan niet-FDA/EMA-jurisdicties
- **Feedback uit geneesmiddelenbewaking:** FACT 05 verplicht de
  fabrikant tot verzegelde rapportage van geaggregeerde AE-tellingen
  op 6 en 12 maanden
- **Terugroepsystemen (RxConnect, MedWatch):** als een terugroeping
  nodig is, wordt de terugroep-omvang zelf onder MYRIAM verzegeld,
  waarmee publieke verificatie wordt geboden dat alle gedistribueerde
  partijen worden aangepakt

## Wat deze kit NIET vervangt

- FDA / EMA / WHO regulatoire indieningen
- GMP-audittrails (het zegel verankert RESULTATEN, niet ruwe
  procesdossiers)
- Geneesmiddelenbewakings-databases (VAERS / EudraVigilance)
- Coördinatiesystemen voor terugroepingen

## Licentie

Publiek domein (CC0). Fork het. Geen naamsvermelding vereist.
