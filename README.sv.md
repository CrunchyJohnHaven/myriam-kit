*Svensk översättning — för den ursprungliga engelska versionen, se [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

En kompakt verktygsuppsättning för att publicera en liten mängd fakta på ett sådant sätt att:

- Varje ändring av varje faktum är offentligt upptäckbar (Merkle-träd)
- Tillståndet vid publiceringstillfället är verifierbart mot Bitcoin-blockkedjan (OpenTimestamps)
- Innehållet överlever att en enskild värdtjänstleverantör avlägsnar det (IPFS)
- Det hela väger under 100 KB och är verifierbart med ungefär 50 rader Python

Detta är ingen blockkedja. Det finns ingen token. Det finns ingen konsensusmekanism att delta i. Det finns ingen DAO. Verktyget är `sha256sum` + `ots` + `ipfs`, sammanfogat med goda namnkonventioner.

Det är uppkallat efter MYRIAM-protokollet, som först instansierades på [disclosure.host](https://disclosure.host) den 2026-05-21. Den sidan innehåller sex fakta, en Merkle-rot och en Bitcoin-attestering. Denna verktygsuppsättning är generaliseringen av det mönstret.

## Status

- v0: fungerar på macOS med Python 3.10+, Homebrew och en internetanslutning. Linux är otestat men bör fungera. Windows: ta med en WSL.
- Public domain (CC0). Använd det, forka det, inkludera det i ditt eget förråd, ange aldrig upphovsman. Poängen är inte erkännandet.

## Tillgängliga språk

Denna README och flera exempel-kit finns på 17 språk.
Fullständig förteckning i [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Översättningarna är CC0 och får gärna förbättras genom pull requests från gemenskapen.

## Vad du kan göra med det

Mönstret passar överallt där en liten mängd fakta behöver vara:

- **Publicerbar** för en bred publik över vanlig HTTP
- **Beständig** — läsare om 30 år ska fortfarande kunna verifiera
- **Manipuleringsbevisande** — varje ändring måste vara upptäckbar, inte nödvändigtvis förhindringsbar
- **Förtroendefri** — ingen läsare behöver lita på utgivaren (endast på matematiken)

Konkreta användningsfall i [docs/USE_CASES.md](docs/USE_CASES.md). I korthet:

| Område | Förseglade fakta |
|---|---|
| Folkhälsa | Testresultat för vaccinpartier, milstolpar i läkemedelsprövningar |
| Val | Summor av rösträkning på valdistriktsnivå vid certifieringstillfället |
| AI-säkerhet | Hash av modellvikter + modellkort + utvärderingsresultat vid release |
| Journalistik | Förteckning över källdokument (endast hashar) för läckor från visselblåsare |
| Vetenskap | Hash av rådata + hash av analysskript + hävdat resultat |
| Domstolar | Hashar av digitala bevisföremål vid tidpunkten för säkring |
| Offentlig upphandling | Förseglade rötter av offentliga utgiftsdata |

Det dessa har gemensamt: en liten mängd fakta, ett starkt krav på beständighet, flera parter som inte litar på varandra, och en mycket liten lagringsbudget. Det är precis den form verktyget är byggt för.

## Vad det INTE gör

- **Lagrar inte hemligheter.** Allt du lägger i `facts/` är offentligt. Protokollet är till för publicering, inte för att dölja.
- **Skalar inte till stora datamängder.** Merkle-trädet skalar utan problem; läsarens uppmärksamhet gör det inte. Efter ungefär 20 fakta blir sidan oläslig. Om du vill försegla en miljon poster, hasha dem utanför sidan och lägg Merkle-roten för det sidoträdet i ett faktum.
- **Försvarar inte mot tillbakadragande.** Hela poängen är att du inte kan ändra det du har förseglat. Om du kan tänkas vilja dra tillbaka ett påstående senare, försegla det inte.
- **Övertygar inte en bestämd skeptiker.** En bestämd skeptiker kommer inte att köra `ipfs add -r --cid-version=1 -Q facts/`. Däremot kommer de att anklaga dig för att ha fabricerat hela upplägget. Det finns inget protokollnivåförsvar mot det andra felläget. Det finns inget protokollnivåförsvar mot något som lever i mänsklig motivation snarare än i matematik.

## Så använder du det

Femminutersgenomgång i [docs/QUICKSTART.md](docs/QUICKSTART.md).
Fullständig protokollspecifikation i [docs/SPEC.md](docs/SPEC.md).
Hotmodell i [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Jämförelse med närliggande system (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave m.fl.) i [docs/COMPARISON.md](docs/COMPARISON.md).

## Så verifierar du någon annans publicering

Tre alternativ, i ordning efter tillgänglighet:

1. **Webbläsare**: öppna [`lib/verify.html`](lib/verify.html) i valfri modern webbläsare. Klistra in publiceringens URL. Klicka på verifiera. Använder `crypto.subtle` för hashing — ingen installation, ingen backend, ingen telemetri. Bitcoin-attesteringssteget kräver fortfarande ett kommandoradsverktyg (se steg 7 på verifieringssidan).
2. **Python**: `python3 lib/verify.py` inifrån publiceringskatalogen. Endast standardbiblioteket; kräver `ots` för Bitcoin-verifiering.
3. **Från grunden**: läs [`docs/SPEC.md §3`](docs/SPEC.md) och återimplementera. Merkle-algoritmen är under 30 rader i vilket språk som helst.

## Genomarbetade exempel

Sex exempel-kit av produktionsklass följer med verktygsuppsättningen. Varje kit är förseglat, OTS-stämplat, IPFS-fastnålat och innehåller en anpassnings-README som förklarar när det är lämpligt att forka för ett verkligt fall och vilka felmoder det skyddar mot.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) — för felläget Boeing 737 MAX / Theranos / FDA-inspektörsrapport, där bevismaterial begravs eller ändras av mellanhänder.
- [`examples/ai-model-card/`](examples/ai-model-card/) — för AI-laboratorier som släpper modeller, med åtaganden före driftsättning som blir mekaniskt upptäckbara i stället för verbala.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — för sponsorer av kliniska prövningar, för att fånga byte av effektmått i efterhand och selektiv rapportering (felmoderna Vioxx, Paxil-studie 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — för vaccintillverkare och kvalitetsmyndigheter, för att förankra resultaten av frisläppningstester och åtaganden om återkallelser.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — för forskargrupper, för att förankra trippeln (data, pipeline, förväntat utfall) FÖRE analysen, så att p-hacking och HARKing blir offentligt upptäckbara.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) — för länskommittéer av rösträknare och valmyndigheter, för att förankra certifierade rösträkningar vid certifieringstillfället, så att tysta revideringar efter certifiering blir offentligt upptäckbara.

Läs ett av dessa innan du skriver ditt eget. Den som ligger närmast ditt eget användningsfall är oftast rätt utgångspunkt att forka från.

## Snabbstart

Enradsversionen:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Varför detta finns

De kryptografiska primitiverna (Merkle-träd, OpenTimestamps, IPFS) har varit mogna i åratal. Det som saknades var det minsta möjliga limmet — en uppsättning som man kunde släppa in i ett sidoprojekt och få ut en förseglad, publicerbar artefakt på en eftermiddag, utan att sätta upp infrastruktur, utan att lära sig protokoll, utan att skriva en enda kodrad utöver själva fakta.

De flesta kryptografiska publiceringsverktyg utgår från att du vill vara nodoperatör. Det här utgår från att du vill publicera sex textfiler och sedan aldrig mer tänka på kryptografi.

## Influenser och tidigare arbeten

- [Sigsum](https://www.sigsum.org/) — transparenslogg för signaturer
- [Sigstore](https://www.sigstore.dev/) — integritet i mjukvarans leveranskedja
- [Certificate Transparency](https://certificate.transparency.dev/) — loggar för TLS-certifikat
- [OpenTimestamps](https://opentimestamps.org/) — tidsstämpling med Bitcoin
- [IPFS](https://ipfs.tech/) — innehållsadresserad lagring
- [CALM-protokollet](https://disclosure.host) — den principal-skyddande publiceringsram inom vilken den första instansen (MYRIAM på disclosure.host) författades

myriam-kit är det minsta av dessa. Det ligger närmare en Unix-pipeline i anda än ett system.

## En anmärkning om namnet

MYRIAM-protokollet är uppkallat efter John Bradleys Myriam-bevis, ett angivet logiskt bevis om den första kontaktpunkten för icke-mänsklig intelligens. Protokollet är inte beroende av att det beviset är sant. Protokollet fungerar för vilken liten uppsättning fakta som helst; det råkar bara ha tagits i bruk första gången för att publicera sex fakta som inkluderar ett påstående om utomjordiskt avslöjande.

Om du forkar denna verktygsuppsättning för att försegla vaccinpartier eller röstresultat, är det faktum att den ursprungligen användes för att publicera ett påstående om utomjordisk kontakt irrelevant för dig. Matematiken bryr sig inte.

Med det sagt: om du DÅ använder det här för att publicera ett påstående om utomjordisk kontakt, så har protokollet blivit prövat under skarpa förhållanden i just den arenan. README-filen för den första MYRIAM-driftsättningen anger uttryckligen att den är det konstnärliga verket av en LLM-persona vid namn Calm, inte ett meddelande från någon utomjordisk part. Du bör förmodligen göra detsamma. Annars kommer läsarna att utgå från det värsta vad gäller ditt mentala tillstånd.

## Underhålls av

Ingen ännu. Public domain. Forka det. Förbättra det. För protokollet vidare utan att be om lov.
