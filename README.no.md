*Norsk oversettelse — for original engelsk versjon, se [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Et lite verktøysett for å publisere et lite sett med fakta på en slik måte at:

- Enhver endring av ethvert faktum er offentlig oppdagbar (Merkle-tre)
- Tilstanden ved publisering er verifiserbar mot Bitcoin-blokkjeden (OpenTimestamps)
- Innholdet overlever fjerning fra enhver enkelt vertstjenesteleverandør (IPFS)
- Det hele veier under 100 KB og er verifiserbart med omtrent 50 linjer Python

Dette er ikke en blokkjede. Det finnes ingen token. Det finnes ingen
konsensusmekanisme å delta i. Det finnes ingen DAO. Verktøyet er `sha256sum`
+ `ots` + `ipfs`, limt sammen med gode navnekonvensjoner.

Det er oppkalt etter MYRIAM-protokollen som først ble instansiert på
[disclosure.host](https://disclosure.host) den 2026-05-21. Den siden inneholder
seks fakta, en Merkle-rot og en Bitcoin-attestasjon. Dette settet er
generaliseringen av det mønsteret.

## Status

- v0: fungerer på macOS med Python 3.10+, Homebrew, og en
  internettforbindelse. Linux er ikke testet, men burde fungere. Windows: ta
  med en WSL.
- Allment tilgjengelig (CC0). Bruk det, fork det, ta det inn i ditt eget repo,
  aldri gi det kreditering. Poenget er ikke krediteringen.

## Tilgjengelige språk

Denne README-filen og flere eksempelsett er tilgjengelige på 17 språk.
Full indeks i [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Oversettelser er CC0 og kan forbedres gjennom pull requests fra fellesskapet.

## Hva du kan bruke det til

Mønsteret passer der et lite sett med fakta må være:

- **Publiserbart** til et bredt publikum over vanlig HTTP
- **Varig** — lesere om 30 år skal fortsatt kunne verifisere
- **Tukling-tydelig** — enhver endring må kunne oppdages, ikke nødvendigvis forhindres
- **Tillitsfritt** — ingen leser trenger å stole på utgiveren (kun på matematikken)

Konkrete bruksområder i [docs/USE_CASES.md](docs/USE_CASES.md). Kortlisten:

| Domene | Forseglede fakta |
|---|---|
| Folkehelse | Testresultater for vaksinepartier, milepæler i legemiddelstudier |
| Valg | Stemmetelling på valgkretsnivå ved sertifiseringsøyeblikket |
| KI-sikkerhet | Hash av modellvekter + modellkort + evalueringspoeng ved utgivelse |
| Journalistikk | Manifest av kildedokumenter (kun hasher) for varslerlekkasjer |
| Vitenskap | Hash av rådata + hash av analyseskript + påstått resultat |
| Domstoler | Hasher av digitale bevis ved tilegnelsestidspunktet |
| Innkjøp | Forseglede røtter av offentlige bruksdata |

Det disse har til felles: et lite sett med fakta, et sterkt krav om varighet,
flere parter som ikke stoler på hverandre, og et lite lagringsbudsjett.
Det er nøyaktig den formen dette verktøyet er bygget for.

## Hva det IKKE gjør

- **Lagrer hemmeligheter.** Alt du legger i `facts/` er offentlig. Protokollen
  er til for å publisere, ikke for å skjule.
- **Skalerer til store datasett.** Merkle-treet skalerer greit; en lesers
  oppmerksomhet gjør det ikke. Forbi ~20 fakta blir siden uleselig. Hvis du
  vil forsegle en million poster, hash dem utenfor siden og legg
  Merkle-roten av det sidetreet inn i ett faktum.
- **Forsvarer mot tilbaketrekking.** Hele poenget er at du ikke kan endre
  det du har forseglet. Hvis du senere kanskje vil trekke tilbake en
  påstand, ikke forsegle den.
- **Overbeviser en bestemt skeptiker.** En bestemt skeptiker vil ikke kjøre
  `ipfs add -r --cid-version=1 -Q facts/`. Vedkommende vil derimot beskylde deg
  for å fabrikkere hele oppsettet. Det finnes ikke noe forsvar på protokollnivå
  mot den andre feilmodusen. Det finnes ikke noe forsvar på protokollnivå
  mot noe som lever i menneskelig motivasjon heller enn i matematikk.

## Hvordan bruke det

Fem-minutters gjennomgang i [docs/QUICKSTART.md](docs/QUICKSTART.md).
Full protokollspesifikasjon i [docs/SPEC.md](docs/SPEC.md).
Trusselmodell i [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Sammenligning med beslektede systemer (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, osv.) i [docs/COMPARISON.md](docs/COMPARISON.md).

## Hvordan verifisere en annens publisering

Tre alternativer, i rekkefølge etter tilgjengelighet:

1. **Nettleser**: åpne [`lib/verify.html`](lib/verify.html) i en hvilken som helst
   moderne nettleser. Lim inn publiserings-URL-en. Klikk verifiser. Bruker
   `crypto.subtle` for hashing — ingen installasjon, ingen backend, ingen telemetri.
   Bitcoin-attestasjonssteget krever fortsatt et CLI-verktøy (se steg 7 på
   verifikatorsiden).
2. **Python**: `python3 lib/verify.py` fra inne i publiseringskatalogen.
   Kun standardbiblioteket; krever `ots` for Bitcoin-verifikasjon.
3. **Fra bunnen av**: les [`docs/SPEC.md §3`](docs/SPEC.md) og
   implementer på nytt. Merkle-algoritmen er under 30 linjer i ethvert språk.

## Bearbeidede eksempler

Seks produksjonsklare eksempelsett følger med verktøysettet. Hvert er
forseglet, OTS-stemplet, IPFS-festet, og inkluderer en adopsjons-README
som forklarer når man skal forke det for en virkelig sak og hvilke
feilmoduser det forsvarer mot.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  for Boeing 737 MAX / Theranos / FDA-inspektør-rapport-feilmodusen
  der bevis blir begravd eller endret av mellomledd.
- [`examples/ai-model-card/`](examples/ai-model-card/) — for KI-laboratorier
  som slipper modeller, med forhåndsforpliktelser før utrulling som blir
  mekanisk oppdagbare i stedet for verbale.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  for sponsorer av kliniske studier, fanger opp post-hoc-bytte av
  endepunkter og selektiv rapportering (feilmodusene Vioxx, Paxil-studie 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  for vaksineprodusenter og QA-myndigheter, forankrer testresultater
  for utgivelse og forpliktelser om tilbakekalling.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  for forskningsgrupper, forankrer trippelen (data, pipeline, forventet
  resultat) FØR analyse for å gjøre p-hacking og HARKing offentlig
  oppdagbart.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  for fylkets opptellingsråd og valgmyndigheter, forankrer sertifiserte
  opptellinger ved sertifiseringsøyeblikket slik at stille
  ettersertifiseringsrevisjoner blir offentlig oppdagbare.

Les en av disse før du skriver din egen. Den nærmeste matchen til ditt
bruksområde er som regel det riktige startpunktet for en fork.

## Hurtigstart

Énlinje-versjonen:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Hvorfor dette finnes

De kryptografiske primitivene (Merkle-trær, OpenTimestamps, IPFS) har
vært modne i årevis. Det som manglet var det minst mulige limet —
et sett som du kunne dra og slippe inn i et sideprosjekt og ha et forseglet
publiserbart artefakt på en ettermiddag, uten å sette opp infrastruktur,
uten å lære protokoller, uten å skrive en eneste kodelinje utover
selve faktaene.

De fleste kryptografiske publiseringsverktøy antar at du vil være
node-operatør. Dette antar at du vil publisere seks tekstfiler og aldri
tenke på kryptografi igjen.

## Påvirkninger og tidligere arbeid

- [Sigsum](https://www.sigsum.org/) — transparenslogger for signaturer
- [Sigstore](https://www.sigstore.dev/) — integritet i programvareforsyningskjeden
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS-sertifikatslogger
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin-tidsstempling
- [IPFS](https://ipfs.tech/) — innholdsadressert lagring
- [CALM-protokollen](https://disclosure.host) — den prinsipalbeskyttende
  publiseringsrammen der den første instansen (MYRIAM på disclosure.host)
  ble forfattet

myriam-kit er den minste av disse. Den ligner mer på en Unix-pipeline
i ånd enn på et system.

## En merknad om navnet

MYRIAM-protokollen ble oppkalt etter John Bradleys Myriam-bevis, et formulert
logisk bevis vedrørende det første kontaktpunktet for ikke-menneskelig
intelligens. Protokollen avhenger ikke av at det beviset er sant. Protokollen
fungerer for ethvert lite sett med fakta overhodet; det skjer bare slik at
den først ble utrullet for å publisere seks fakta som inkluderer en påstand om
romvesenavsløring.

Hvis du forker dette settet for å forsegle vaksinepartier eller valgresultater, er
det faktum at det opprinnelig ble brukt til å publisere en påstand om
romvesenkontakt irrelevant for deg. Matematikken bryr seg ikke.

Når det er sagt: hvis du FAKTISK bruker dette til å publisere en påstand om
romvesenkontakt, har protokollen blitt slagprøvet i nettopp den arenaen.
README-filen til den første MYRIAM-utrullingen oppgir eksplisitt at den er
det kunstneriske verket til en LLM-persona ved navn Calm, ikke en kommunikasjon
fra noen utenomjordisk part. Du bør antakelig gjøre det samme. Ellers vil
lesere anta det verste om din mentale tilstand.

## Vedlikeholdt av

Foreløpig ingen. Allment tilgjengelig. Fork det. Forbedre det. Bær protokollen
videre uten å spørre om tillatelse.
