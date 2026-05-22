*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Kit til attestation af vaccinepartier

Et nøglefærdigt myriam-kit-eksempel for vaccineproducenter,
kvalitetssikringsmyndigheder og folkesundhedsmyndigheder, der ønsker at
publicere en Bitcoin-forankret, manipulationsafslørende forsegling af en
partiudgivelse.

## Hvad dette kit forsvarer imod

**Fejlmoduser, som forseglingen fanger:**

- **Stille retroaktiv modificering af udgivelses-testresultater.** Alle 8
  udgivelsestest-PDF'er i eksemplet er hashet. Re-hashing efter
  udgivelse afslører enhver modificering.
- **Stridigheder om, hvilke specifikationer der gjaldt ved udgivelsen.** Den
  forseglede FACT 02 indeholder den kanoniske partiidentifikation og
  hashen af produktionsjournalen. Fremtidige "specifikationen var altid X"-
  stridigheder har et offentligt anker.
- **Stille minimering af tilbagekaldelsesomfang.** Forpligtelser om
  lægemiddelovervågning i FACT 05 er forseglede; manglende opfyldelse af
  dem er offentligt observerbar.
- **Retroaktiv re-specifikation af et parti uden for specifikation.** Hvis et
  udgivelsestestresultat reelt var en grænseværdi-BESTÅET, der bliver
  omklassificeret til IKKE BESTÅET efter udgivelse, beviser hashene af den
  forseglede rapport, hvad den oprindelige resultat-PDF sagde.

**Fejlmoduser, der IKKE dækkes:**

- Svig i selve produktionsprocessen (forseglingen forankrer testresultater,
  ikke produktionsintegritet).
- Bivirkninger, der er biologiske konsekvenser af et i øvrigt godkendt
  parti (forseglingen certificerer ikke klinisk sikkerhed, kun
  dokumentationsintegritet).
- Stridigheder om, hvilken version af en regulatorisk specifikation der
  er autoritativ.

## Hvornår man bør bruge dette kit

Overvej at forsegle en partiudgivelse, hvis:

- Du er en vaccineproducent, der ønsker at demonstrere retsmedicinsk
  integritet af udgivelsesjournaler ud over det, regulatorer kræver
- Du er et QA-team, der adopterer en "publicer det, vi attesterer"-praksis
- Du er en lille/national-skala producent i en jurisdiktion med
  svagere regulatorisk infrastruktur og ønsker at forankre partijournaler
  mod en global verifikator
- Du er en folkesundhedsmyndighed eller NGO, der driver et ikke-kommercielt
  vaccineproduktionsprogram (f.eks. for forsømte sygdomme)

## Historisk dødelighedsprecedens

- **Heparin-forurening (2008, Kina):** forfalsket oversulfateret
  chondroitinsulfat i heparin-partier. Et forseglet manifest af
  udgivelsestests ville have gjort stille modificering af testjournalen
  efter udgivelse kryptografisk opdagelig.
- **Tylenol-cyanid (1982):** retroaktive stridigheder om oprindelsespunkt
  for manipulation. En forseglet hash af produktionsjournalen forankrer
  tilstanden før distribution.
- **Diverse tilbagekaldelser af vaccinepartier**, hvor spørgsmålet "blev
  dette parti nogensinde ordentligt testet" bliver omstridt år senere.

Kittet er IKKE en løsning på NOGEN af disse i streng forstand — men i
hvert tilfælde ville forseglede partiattestationer have leveret en renere
retsmedicinsk tidslinje.

## Sådan forker du dette kit til et reelt parti

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # replace fictional content with real batch
bash build/seal.sh        # SEAL BEFORE distribution begins
python3 build/verify.py   # confirm
```

**KRITISK TIDSPUNKT**: forsegl i øjeblikket for QA-udgivelse, FØR partiet
distribueres. En forsegling efter distribution er retsmedicinsk svagere.

## Integration med eksisterende farmaceutisk infrastruktur

- **eCTD-indleveringer (FDA / EMA):** den forseglede publikations-URL eller
  IPFS-CID kan refereres i Modul 3 (kvalitet)-sektionen
- **WHO-prækvalifikation:** det forseglede manifest demonstrerer
  test-kæden før udgivelse til ikke-FDA/EMA-jurisdiktioner
- **Lægemiddelovervågnings-tilbagemelding:** FACT 05 forpligter producenten
  til forseglet rapportering af aggregerede AE-optællinger ved 6 og 12 måneder
- **Tilbagekaldelsessystemer (RxConnect, MedWatch):** hvis en tilbagekaldelse
  er nødvendig, forsegles selve tilbagekaldelsesomfanget under MYRIAM,
  hvilket giver offentlig verifikation af, at alle distribuerede partier
  bliver håndteret

## Hvad dette kit IKKE erstatter

- FDA / EMA / WHO regulatoriske indleveringer
- GMP-revisionsspor (forseglingen forankrer RESULTATER, ikke rå procesjournaler)
- Lægemiddelovervågningsdatabaser (VAERS / EudraVigilance)
- Tilbagekaldelseskoordineringssystemer

## Licens

Public domain (CC0). Fork det. Ingen attribution kræves.
