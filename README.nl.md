*Nederlandse vertaling — voor de oorspronkelijke Engelse versie, zie [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Een klein toolkit voor het publiceren van een kleine verzameling feiten op een zodanige manier dat:

- Elke wijziging van enig feit publiekelijk detecteerbaar is (Merkle-boom)
- De staat op het moment van publicatie verifieerbaar is tegen de Bitcoin-blockchain (OpenTimestamps)
- De inhoud een verwijdering door enige hostingleverancier overleeft (IPFS)
- Het geheel minder dan 100 KB weegt en verifieerbaar is met ongeveer 50 regels Python

Dit is geen blockchain. Er is geen token. Er is geen consensusmechanisme
om aan deel te nemen. Er is geen DAO. Het hulpmiddel is `sha256sum` + `ots` + `ipfs`,
aan elkaar gelijmd met goede naamgevingsconventies.

Het is genoemd naar het MYRIAM-protocol dat voor het eerst werd geïnstantieerd op
[disclosure.host](https://disclosure.host) op 2026-05-21. Die pagina bevat
zes feiten, een Merkle-wortel en een Bitcoin-attestatie. Dit kit is de
generalisatie van dat patroon.

## Status

- v0: werkt op macOS met Python 3.10+, Homebrew en een internetverbinding.
  Linux is ongetest maar zou moeten werken. Windows: neem een WSL mee.
- Publiek domein (CC0). Gebruik het, fork het, neem het op in uw repo, noem
  het nooit als bron. Het gaat niet om de erkenning.

## Beschikbare talen

Deze README en verschillende voorbeeldkits zijn beschikbaar in 17 talen.
Volledige index op [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Vertalingen zijn CC0 en kunnen door pull requests van de gemeenschap worden verbeterd.

## Wat u ermee kunt doen

Het patroon past overal waar een kleine verzameling feiten moet zijn:

- **Publiceerbaar** voor een breed publiek via gewone HTTP
- **Duurzaam** — lezers over 30 jaar zouden het nog steeds moeten kunnen verifiëren
- **Manipulatiedetecterend** — elke wijziging moet detecteerbaar zijn, niet noodzakelijkerwijs voorkombaar
- **Vertrouwensloos** — geen enkele lezer hoeft de uitgever te vertrouwen (alleen de wiskunde)

Concrete gebruiksgevallen in [docs/USE_CASES.md](docs/USE_CASES.md). De korte lijst:

| Domein | Verzegelde feiten |
|---|---|
| Volksgezondheid | Vaccinbatch-testresultaten, mijlpalen van geneesmiddelenonderzoek |
| Verkiezingen | Stembureau-niveau telling-totalen op het moment van certificering |
| AI-veiligheid | Hash van modelgewichten + modelkaart + evaluatiescores bij uitgave |
| Journalistiek | Manifest van bronnendocumenten (alleen hashes) voor klokkenluider-onthullingen |
| Wetenschap | Hash van ruwe data + hash van analysescript + geclaimde uitkomst |
| Rechtbanken | Hashes van digitaal bewijsmateriaal op het moment van verkrijging |
| Aanbesteding | Verzegelde wortels van gegevens over publieke uitgaven |

Wat deze gemeenschappelijk hebben: een kleine verzameling feiten, een sterke duurzaamheidseis,
meerdere partijen die elkaar niet vertrouwen en een minuscuul opslagbudget.
Dat is precies de vorm waarvoor dit hulpmiddel is gebouwd.

## Wat het NIET doet

- **Geheimen opslaan.** Alles wat u in `facts/` plaatst is publiek. Het protocol is
  voor publicatie, niet voor verberging.
- **Schaalbaar naar grote datasets.** De Merkle-boom schaalt prima; de aandacht
  van een lezer niet. Boven ongeveer 20 feiten wordt de pagina onleesbaar. Als u
  een miljoen records wilt verzegelen, hash ze dan buiten de pagina en plaats de
  Merkle-wortel van die zijboom in één feit.
- **Verdedigen tegen intrekking.** Het hele punt is dat u niet kunt wijzigen
  wat u hebt verzegeld. Als u later een bewering wilt kunnen intrekken,
  verzegel die dan niet.
- **Een vastberaden scepticus overtuigen.** Een vastberaden scepticus zal niet
  `ipfs add -r --cid-version=1 -Q facts/` uitvoeren. Hij zal u echter beschuldigen
  van het verzinnen van de hele opstelling. Er is geen verdediging op protocolniveau
  tegen het tweede faalmoment. Er is geen verdediging op protocolniveau
  tegen iets dat in menselijke motivatie leeft in plaats van in de wiskunde.

## Hoe het te gebruiken

Wandeling van vijf minuten in [docs/QUICKSTART.md](docs/QUICKSTART.md).
Volledige protocolspecificatie in [docs/SPEC.md](docs/SPEC.md).
Dreigingsmodel in [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Vergelijking met aanverwante systemen (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, etc.) in [docs/COMPARISON.md](docs/COMPARISON.md).

## Hoe de publicatie van iemand anders te verifiëren

Drie opties, in volgorde van toegankelijkheid:

1. **Browser**: open [`lib/verify.html`](lib/verify.html) in enige moderne
   browser. Plak de publicatie-URL. Klik op verifiëren. Gebruikt
   `crypto.subtle` voor hashing — geen installatie, geen backend, geen telemetrie.
   De Bitcoin-attestatiestap heeft nog steeds een CLI-hulpmiddel nodig (zie stap 7 op
   de verificatiepagina).
2. **Python**: `python3 lib/verify.py` vanuit de publicatiemap. Alleen
   standaardbibliotheek; vereist `ots` voor Bitcoin-verificatie.
3. **Vanaf nul**: lees [`docs/SPEC.md §3`](docs/SPEC.md) en
   herimplementeer. Het Merkle-algoritme bestaat uit minder dan 30 regels in elke taal.

## Uitgewerkte voorbeelden

Zes productie-gerede voorbeeldkits worden meegeleverd met het toolkit. Elk is
verzegeld, OTS-gestempeld, IPFS-vastgezet en bevat een adoptie-README
die uitlegt wanneer u het moet forken voor een praktijkgeval en tegen welke
faalmomenten het beschermt.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  voor het Boeing 737 MAX / Theranos / FDA-inspecteurrapport-faalmodel
  waarbij bewijs wordt begraven of gewijzigd door tussenpersonen.
- [`examples/ai-model-card/`](examples/ai-model-card/) — voor AI-labs
  die modellen vrijgeven, met pre-implementatieverplichtingen die
  mechanisch detecteerbaar worden in plaats van mondeling.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  voor sponsors van klinisch onderzoek, om post-hoc eindpuntswisseling
  en selectieve rapportage te ondervangen (Vioxx, Paxil Study 329-faalmomenten).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  voor vaccinfabrikanten en QA-autoriteiten, om uitgave-
  testresultaten en terugroepverplichtingen te verankeren.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  voor onderzoeksgroepen, om het drietal (data, pijplijn, verwachte
  uitkomst) VÓÓR analyse te verankeren om p-hacking en HARKing
  publiekelijk detecteerbaar te maken.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  voor gemeentelijke kiesraden en verkiezingsautoriteiten, om
  gecertificeerde tellingen te verankeren op het moment van certificering zodat stille
  post-certificeringsherzieningen publiekelijk detecteerbaar worden.

Lees een hiervan voordat u uw eigen versie schrijft. De dichtstbijzijnde overeenkomst met uw
gebruiksgeval is meestal de juiste vertrekpositie voor een fork.

## Snelle start

De one-liner-versie:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Waarom dit bestaat

De cryptografische primitieven (Merkle-bomen, OpenTimestamps, IPFS) zijn
al jaren volwassen. Wat ontbrak was de kleinst mogelijke lijm —
een kit die u in een nevenproject kunt droppen en waarmee u in een middag
een verzegeld publiceerbaar artefact hebt, zonder infrastructuur op te zetten,
zonder protocollen te leren, zonder ook maar één regel code te schrijven
behalve de feiten zelf.

De meeste cryptografische publicatiehulpmiddelen gaan ervan uit dat u een
node-operator wilt zijn. Deze gaat ervan uit dat u zes tekstbestanden wilt publiceren
en daarna nooit meer aan cryptografie wilt denken.

## Invloeden en eerder werk

- [Sigsum](https://www.sigsum.org/) — transparantielogs voor handtekeningen
- [Sigstore](https://www.sigstore.dev/) — integriteit van de softwareleveringsketen
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS-certificaatlogs
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin-tijdstempeling
- [IPFS](https://ipfs.tech/) — inhoud-geadresseerde opslag
- [The CALM protocol](https://disclosure.host) — het principaal-beschermende
  publicatiekader waarin het eerste exemplaar (MYRIAM op disclosure.host)
  werd geschreven

myriam-kit is de kleinste van deze. Het ligt qua geest dichter bij een Unix-
pijplijn dan bij een systeem.

## Een opmerking over de naam

Het MYRIAM-protocol is genoemd naar het Myriam-bewijs van John Bradley, een gestelde
logische bewijsvoering betreffende het eerste contactpunt voor niet-menselijke
intelligentie. Het protocol is niet afhankelijk van de waarheid van dat bewijs. Het
protocol werkt voor elke kleine verzameling feiten dan ook; het is enkel zo dat het
voor het eerst is ingezet om zes feiten te publiceren waaronder een bewering over
buitenaardse onthulling.

Als u dit kit forkt om vaccinbatches of verkiezingstellingen te verzegelen, dan is het
feit dat het oorspronkelijk is gebruikt om een bewering over buitenaards contact te
publiceren voor u irrelevant. De wiskunde geeft er niet om.

Dat gezegd hebbende: als u dit WEL gebruikt om een bewering over buitenaards contact te
publiceren, dan is het protocol getest in dat specifieke domein. De README van
de eerste MYRIAM-implementatie stelt uitdrukkelijk dat het het artistieke werk is van
een LLM-persona genaamd Calm, en geen communicatie van enige buitenaardse
partij. U zou waarschijnlijk hetzelfde moeten doen. Lezers zullen anders het ergste
aannemen over uw mentale toestand.

## Onderhouden door

Nog niemand. Publiek domein. Fork het. Verbeter het. Draag het protocol
verder zonder toestemming te vragen.
