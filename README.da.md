*Dansk oversættelse — for den oprindelige engelske version, se [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Et lille værktøjssæt til at offentliggøre et lille sæt af kendsgerninger på en sådan måde, at:

- Enhver ændring af enhver kendsgerning er offentligt påviselig (Merkle-træ)
- Tilstanden ved offentliggørelsen kan verificeres mod Bitcoin-blockchainen (OpenTimestamps)
- Indholdet overlever nedlukning af enhver enkelt hostingudbyder (IPFS)
- Det hele vejer under 100 KB og kan verificeres med cirka 50 linjer Python

Dette er ikke en blockchain. Der er ingen token. Der findes ingen konsensusmekanisme,
man kan deltage i. Der er ingen DAO. Værktøjet er `sha256sum` + `ots` + `ipfs`,
limet sammen med fornuftige navngivningskonventioner.

Det er opkaldt efter MYRIAM-protokollen, som blev instantieret første gang på
[disclosure.host](https://disclosure.host) den 21. maj 2026. Den side indeholder
seks kendsgerninger, en Merkle-rod og en Bitcoin-attestation. Dette kit er
generaliseringen af det mønster.

## Status

- v0: virker på macOS med Python 3.10+, Homebrew og en
  internetforbindelse. Linux er utestet, men burde virke. Windows: medbring en WSL.
- Almindelig ejendom (CC0). Brug det, fork det, indlejr det i din repo, krediter det aldrig. Pointen er ikke krediteringen.

## Tilgængelige sprog

Denne README og flere eksempel-kits er tilgængelige på 17 sprog.
Fuld oversigt på [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Oversættelser er CC0 og kan forbedres ved fællesskabs-PR'er.

## Hvad du kan bruge det til

Mønsteret passer alle steder, hvor et lille sæt af kendsgerninger skal være:

- **Offentliggørbart** for et bredt publikum over almindelig HTTP
- **Holdbart** — læsere om 30 år bør stadig kunne verificere
- **Manipulationspåviseligt** — enhver ændring skal kunne påvises, ikke nødvendigvis forhindres
- **Tillidsløst** — ingen læser skal stole på udgiveren (kun på matematikken)

Konkrete anvendelsestilfælde findes i [docs/USE_CASES.md](docs/USE_CASES.md). Den korte liste:

| Domæne | Forseglede kendsgerninger |
|---|---|
| Folkesundhed | Testresultater for vaccinepartier, milepæle i lægemiddelforsøg |
| Valg | Stemmeoptællinger på valgdistriktsniveau ved certificeringsøjeblikket |
| AI-sikkerhed | Hash af modelvægte + modelkort + evalueringsscorer ved udgivelse |
| Journalistik | Manifest over kildedokumenter (kun hashes) ved whistleblower-lækager |
| Videnskab | Hash af rådata + hash af analysescript + den hævdede resultat |
| Retssager | Hashes af digitale bevismaterialer ved indsamlingsøjeblikket |
| Indkøb | Forseglede rødder af offentlige udgiftsdata |

Det disse har til fælles: et lille sæt af kendsgerninger, et stærkt holdbarhedskrav,
flere parter, der ikke stoler på hinanden, og et meget begrænset lagerbudget.
Det er præcis den form, dette værktøj er bygget til.

## Hvad det IKKE gør

- **Opbevarer hemmeligheder.** Alt, hvad du lægger i `facts/`, er offentligt. Protokollen er
  til offentliggørelse, ikke til at skjule.
- **Skalerer til store datasæt.** Merkle-træet skalerer fint; en læsers
  opmærksomhed gør ikke. Efter cirka 20 kendsgerninger bliver siden ulæselig. Hvis du
  vil forsegle en million poster, så hash dem uden for siden og læg
  Merkle-roden af det sidetræ ind i én kendsgerning.
- **Forsvarer mod tilbagekaldelse.** Hele pointen er, at du ikke kan ændre
  det, du har forseglet. Hvis du eventuelt senere vil trække en påstand tilbage, så lad være med
  at forsegle den.
- **Overbeviser en hårdnakket skeptiker.** En hårdnakket skeptiker kører ikke
  `ipfs add -r --cid-version=1 -Q facts/`. Til gengæld vil vedkommende beskylde dig
  for at have opdigtet hele opsætningen. Der findes intet forsvar på protokolniveau
  mod den anden fejlmodus. Der findes intet forsvar på protokolniveau
  mod noget, der bor i menneskelig motivation snarere end i matematik.

## Sådan bruger du det

Fem-minutters gennemgang i [docs/QUICKSTART.md](docs/QUICKSTART.md).
Fuld protokolspecifikation i [docs/SPEC.md](docs/SPEC.md).
Trusselsmodel i [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Sammenligning med beslægtede systemer (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave osv.) i [docs/COMPARISON.md](docs/COMPARISON.md).

## Sådan verificerer du en andens offentliggørelse

Tre muligheder, i tilgængelighedsrækkefølge:

1. **Browser**: åbn [`lib/verify.html`](lib/verify.html) i en hvilken som helst moderne
   browser. Indsæt URL'en til offentliggørelsen. Klik på verify. Bruger
   `crypto.subtle` til hashing — ingen installation, ingen backend, ingen telemetri.
   Bitcoin-attestationstrinnet kræver stadig et CLI-værktøj (se trin 7 på
   verifier-siden).
2. **Python**: `python3 lib/verify.py` fra inde i offentliggørelses-
   mappen. Kun stdlib; kræver `ots` til Bitcoin-verifikation.
3. **Fra bunden**: læs [`docs/SPEC.md §3`](docs/SPEC.md) og
   genimplementér. Merkle-algoritmen er under 30 linjer i et hvilket som helst sprog.

## Bearbejdede eksempler

Seks produktionsklare eksempel-kits leveres med værktøjssættet. Hvert er
forseglet, OTS-stemplet, IPFS-fastgjort og inkluderer en adoption-README,
der forklarer, hvornår man skal forke det til en faktisk anvendelse, og hvilke
fejlmoduser det forsvarer imod.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  til Boeing 737 MAX / Theranos / FDA-inspektør-rapport-fejlmodussen,
  hvor beviser bliver begravet eller ændret af mellemmænd.
- [`examples/ai-model-card/`](examples/ai-model-card/) — til AI-laboratorier,
  der udgiver modeller, med præ-deployment-forpligtelser, der bliver
  mekanisk påviselige i stedet for verbale.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  til sponsorer af kliniske forsøg, der fanger post-hoc-endpointswitching
  og selektiv rapportering (Vioxx, Paxil Study 329-fejlmoduser).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  til vaccineproducenter og kvalitetssikringsmyndigheder, der forankrer
  resultater af frigivelsestest og tilbagekaldelsesforpligtelser.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  til forskergrupper, der forankrer trippelsen (data, pipeline, forventet
  output) FØR analyse for at gøre p-hacking og HARKing offentligt
  påviseligt.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  til county-valgkomitéer og valgmyndigheder, der forankrer
  certificerede stemmeoptællinger på certificeringsøjeblikket, så stille
  post-certificeringsrevisioner bliver offentligt påviselige.

Læs en af disse, før du skriver din egen. Det nærmeste match til din
anvendelse er sædvanligvis den rette udgangs-fork.

## Hurtig start

Én-linjeversionen:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Hvorfor dette findes

De kryptografiske primitiver (Merkle-træer, OpenTimestamps, IPFS) har
været modne i årevis. Det, der manglede, var den mindst mulige lim —
et kit, man kunne smide ind i et sideprojekt og have en forseglet,
offentliggørbar genstand klar på en eftermiddag, uden at opsætte infrastruktur,
uden at lære protokoller, uden at skrive en eneste linje kode ud over
selve kendsgerningerne.

De fleste kryptografiske udgivelsesværktøjer antager, at man vil være node-
operatør. Dette antager, at man vil offentliggøre seks tekstfiler og aldrig
tænke på kryptografi igen.

## Inspirationer og forarbejder

- [Sigsum](https://www.sigsum.org/) — gennemsigtighedslogs for signaturer
- [Sigstore](https://www.sigstore.dev/) — integritet i softwareforsyningskæden
- [Certificate Transparency](https://certificate.transparency.dev/) — logs over TLS-certifikater
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin-tidsstempling
- [IPFS](https://ipfs.tech/) — indholdsadresseret lagring
- [CALM-protokollen](https://disclosure.host) — den principalbeskyttende
  udgivelsesramme, hvori den første instans (MYRIAM på disclosure.host)
  blev forfattet

myriam-kit er den mindste af disse. Det er åndsmæssigt tættere på en Unix-
pipeline end på et system.

## En bemærkning om navnet

MYRIAM-protokollen blev opkaldt efter John Bradleys Myriam Proof, et stillet
logisk bevis vedrørende det første kontaktpunkt for ikke-menneskelig
intelligens. Protokollen afhænger ikke af, at det bevis er sandt. Protokollen
virker for et hvilket som helst lille sæt af kendsgerninger; det er bare en tilfældighed,
at den først blev brugt til at offentliggøre seks kendsgerninger, der inkluderer en påstand om
afsløring af udenjordiske.

Hvis du forker dette kit for at forsegle vaccinepartier eller stemmeoptællinger, er det
faktum, at det oprindeligt blev brugt til at offentliggøre en påstand om udenjordisk kontakt,
irrelevant for dig. Matematikken er ligeglad.

Med det sagt: hvis du DOG bruger dette til at offentliggøre en påstand om udenjordisk kontakt, har
protokollen været afprøvet i kamp på netop det område. README'en for
den første MYRIAM-deployment angiver eksplicit, at den er det kunstneriske værk af
en LLM-persona ved navn Calm, ikke en kommunikation fra nogen udenjordisk
part. Det bør du formentlig også gøre. Læsere vil ellers antage det værste
om din mentale tilstand.

## Vedligeholdt af

Endnu ingen. Almindelig ejendom. Fork det. Forbedr det. Bær protokollen
videre uden at spørge om lov.
