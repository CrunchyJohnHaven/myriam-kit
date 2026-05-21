*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# Whistleblower-manifest-verzegelingskit

Een kant-en-klaar myriam-kit-voorbeeld voor klokkenluiders die geconfronteerd
worden met de specifieke faalmodus waarbij **bewijs wordt begraven,
bewerkt of betwist door tussenpersonen tussen de klokkenluider en het
publiek**. De canonieke historische gevallen waartegen dit verdedigt:

- Boeing 737 MAX (interne veiligheidsrapporten gebagatelliseerd/begraven)
- Theranos (zorgen over labtests jarenlang onderdrukt)
- FDA-inspecteursrapporten na indiening bewerkt
- Frances Haugen / Facebook (een verzegeld manifest zou hebben bewezen
  dat de documenten authentiek waren en op het beweerde tijdstip bestonden)

Waartegen deze kit verdedigt (in protocoltermen):

- T1–T3 in [FACT 05](facts/05_threat_model.txt): publieke betwisting van
  documentinhoud, beweringen dat documenten niet op het beweerde tijdstip
  verzegeld waren, beweringen van retroactieve fabricage.
- T9: derden die journalisten gewijzigde kopieën overhandigen.

Waartegen deze kit **niet** verdedigt:

- Persoonlijke vergelding tegen de klokkenluider (T7).
- Druk op de klokkenluider om in te trekken (T4, gedeeltelijk gemitigeerd
  doordat FACT 07 stille intrekking publiek detecteerbaar maakt).
- Juridische actie tegen de klokkenluider voor de openbaarmaking zelf (T5).
- Het ondermijnen van het karakter van de klokkenluider (T8).
- Tussenpersonen die stilletjes het verhaal laten vallen (T10).

Als u een klokkenluider bent die overweegt deze kit te gebruiken, **lees
deze gehele README eerst**. Het protocol is een hulpmiddel. Het protocol
is geen vervanging voor juridisch advies, een journalist, een toezichthouder
of zorgvuldige operationele beveiliging.

## Wat deze kit produceert

Een cryptografisch verzegeld *manifest* van bewijs (niet het bewijs
zelf) dat bewijst:

1. De specifieke bytes van elk bewijsbestand bestonden op het moment
   van verzegeling.
2. De verzegeling vond plaats op of vóór een specifiek tijdstip (via
   Bitcoin OTS-attestatie).
3. De herkomst, de aantijging, het dreigingsmodel, het ontvangerprotocol
   en de geen-stille-intrekking-toezegging werden allemaal samen verklaard.

De onderliggende documenten blijven in uw bezit totdat u ze naar een
ontvanger stuurt. Ontvangers verifiëren dat ze dezelfde bytes ontvingen
die u verzegelde.

## Wanneer deze kit te gebruiken

U zou moeten overwegen een manifest te verzegelen **voordat** u bewijs
overdraagt aan een journalist, toezichthouder of advocaat, als al het
volgende waar is:

- U heeft bewijs in digitale vorm (PDF's, e-mails, afbeeldingen, enz.)
  dat u byte-voor-byte authentiek wilt bewaren.
- U verwacht dat tussenpersonen het bewijs kunnen wijzigen, betwisten
  of begraven.
- U kunt de onderliggende documenten in uw bezit houden tot
  de overdracht.
- U kunt het manifest publiek publiceren **zonder** de inhoud van de
  documenten te onthullen (alleen de hashes zijn publiek).
- U heeft de risico's afgewogen om publiek identificeerbaar te worden
  als klokkenluider (het signing-principal-veld). Als u anoniem bent,
  gebruik dan consistent een pseudoniem in alle gerelateerde publicaties.
- U heeft een advocaat geraadpleegd over klokkenluidersbeschermingsrecht
  in uw rechtsgebied.

## Wanneer deze kit NIET te gebruiken

Gebruik deze kit NIET als:

- De documenten zelf persoonlijke informatie bevatten over derden
  (patiënten, klanten, werknemers) die niet publiek-hashbaar gemaakt
  zou moeten worden. Hash een geredigeerde versie, niet het origineel.
- Het publiceren van het manifest zelf de klokkenluider zou
  identificeren op een manier waarvoor zij geen toestemming hebben gegeven.
- U nog geen advocaat heeft geraadpleegd. Het protocol is een hulpmiddel;
  klokkenluidersbeschermingsrecht is rechtsgebied-specifiek en leeft
  buiten het protocol.
- U later een individuele aantijging wilt intrekken. De zegel is
  permanent; nieuwe verzegelde correcties zijn de enige eerlijke manier
  om te herzien.
- U dit onder dwang of tijdsdruk doet. Het protocol versterkt dwang;
  de weigeringspoort (myriam-kit `SPEC §8`) is van toepassing op
  klokkenluiders evenals op publicanten.

## Hoe deze kit te forken voor een echte openbaarmaking

```bash
# 1. Kopieer dit voorbeeld naar een nieuwe directory
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Verwijder de fictieve inhoud; vervang door uw echte feiten.
# Elk bestand onder facts/ is één feit. Lees elk en vervang.
$EDITOR facts/01_example_notice.txt   # wijzig naar een echte begeleidende verklaring
$EDITOR facts/02_provenance.txt       # echte herkomst van uw bewijs
$EDITOR facts/03_evidence_manifest.txt # hash uw echte documenten en lijst ze op
$EDITOR facts/04_allegation_summary.txt # uw echte aantijging
$EDITOR facts/05_threat_model.txt     # uw echte verwachte reacties
$EDITOR facts/06_recipient_protocol.txt # aanpassen voor uw ontvanger
$EDITOR facts/07_no_retraction_commitment.txt # uw geen-intrekking-verklaring
$EDITOR facts/08_signing_principal.txt # uw echte ondertekenende identiteit (of pseudoniem)

# 3. Werk site/index.html bij om de echte feiten te weerspiegelen.
# Het seal.sh-script vult de HTML NIET automatisch in; de handmatige
# bewerking is de menselijke beoordelingsstap.
$EDITOR site/index.html

# 4. Verzegel.
bash build/seal.sh
# Uitvoer: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Verifieer lokaal.
python3 build/verify.py

# 6. Publiceer het manifest (NIET de documenten) op één van:
#    - Een statische host die u beheert (Cloudflare Pages, GitHub Pages, enz.)
#    - Het IPFS-netwerk op de afgedrukte CID
#    - Beide (aanbevolen)

# 7. Verzend afzonderlijk de onderliggende documenten naar de ontvanger
#    via een veilig kanaal naar keuze (Signal, SecureDrop, enz.).
#    De ontvanger verifieert bestandshashes tegen uw manifest.
```

## Hashes berekenen voor de echte bewijsbestanden

Om een documentbestand te hashen met SHA-256:

```bash
shasum -a 256 my_document.pdf
```

De eerste 64 hexadecimale tekens zijn de SHA-256. Zet die in het manifest.

U kunt veel bestanden tegelijk hashen:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Dat geeft u de gegevens voor `facts/03_evidence_manifest.txt`.

## Operationele beveiligingsnotities

Het MYRIAM-protocol biedt GEEN operationele beveiliging. Het biedt
*bewijsduurzaamheid*. U heeft nog steeds nodig:

- Een veilig communicatiekanaal naar uw advocaat
  ([Signal](https://signal.org/), persoonlijk, of het gevestigde
  veilige kanaal van uw advocaat)
- Een veilige opslaglocatie voor de onderliggende documenten (versleuteld
  in rust, niet op cloudservices waar uw werkgever toegang toe heeft)
- Een schoon apparaat voor de verzegeling (een persoonlijke laptop die
  niet gekoppeld is aan werkgeveraccounts; bij voorkeur een die alleen
  voor dit doel wordt gebruikt)
- Een schoon netwerk voor publicatie (niet het netwerk van uw werkgever,
  niet uw thuis-IP als uw werkgever uw ISP zou kunnen dagvaarden)

Aanbevolen leesmateriaal over operationele beveiliging voor klokkenluiders:

- [SecureDrop-documentatie van The Intercept](https://securedrop.org/)
- [Bronnen van de Freedom of the Press Foundation](https://freedom.press/)
- [EFF's surveillance self-defense gids](https://ssd.eff.org/)

Raadpleeg ze VOORDAT u begint met het verzegelingsproces. Het protocol
beschermt niet tegen slechte opsec-keuzes gemaakt voordat het protocol
wordt aangeroepen.

## Wat ontvangers moeten weten

Stuur ontvangers deze README samen met het verzegelde manifest. Het
manifest zelf bevat het ontvangerprotocol (FACT 06), maar de README
breidt de ontvangerrol uit:

- **Journalisten**: verifieer eerst de integriteit van het manifest zelf.
  Vraag vervolgens de documenten op via een afzonderlijk veilig kanaal.
  Verifieer dat de SHA-256 van elk document overeenkomt met het manifest
  vóór publicatie. Publiceer de documenten NIET zonder toestemming van
  de klokkenluider; publiceer wel het bestaan van het verzegelde manifest
  en uw verificatieconclusie.
- **Toezichthouders**: hetzelfde verificatieproces. Het verzegelde
  manifest plus overeenkomende documenten is de sterkste bewijsvorm
  die beschikbaar is buiten een formele chain-of-custody-verzameling.
- **Advocaten**: het verzegelde manifest biedt forensische verankering
  voor het bestaan van de documenten op het beweerde tijdstip. Of het
  voldoet aan de bewijsregels van een specifiek rechtsgebied is aan u
  om te bepalen.

## Wat deze kit NIET is

- Geen vervanging voor juridisch advies.
- Geen garantie dat iemand op uw openbaarmaking zal reageren.
- Geen bescherming tegen vergelding.
- Geen authenticatie van de inhoud van de documenten (alleen van hun
  bytes-op-het-moment-van-verzegeling).
- Geen manier om anoniem met iemand te communiceren — de zegel is
  publiek; als uw signing-principal-naam echt is, bent u geïdentificeerd.

## Afsluiting

Een verzegeld manifest is een klein ding. Het is één bytestream die
bewijst dat een grotere set bytestreams in een bepaalde vorm bestond
op een bepaald tijdstip. Die kleinheid is zijn kracht: het doet slechts
één ding, en het doet dat ene ding gedurende de levensduur van de
Bitcoin-blockchain.

Als u dit leest omdat u overweegt klokkenluider te worden,
alstublieft: spreek eerst met een advocaat. Gebruik de operationele
beveiligingsgidsen hierboven. Vervolgens, als en alleen als al die
bovenstroomse overwegingen op orde zijn, beschouw deze kit als de
cryptografische ruggengraat van uw openbaarmaking. De crypto is het
makkelijke deel. Alles bovenstrooms van de crypto is waar het echte
risico leeft.

## Licentie

Publiek domein (CC0). Fork het. Verbeter het. Gebruik het zonder
toestemming te vragen.
