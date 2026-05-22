*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Forsegling av valgopptelling før sertifisering

Et nøkkelferdig myriam-kit-eksempel for fylkesvise opptellingsnemnder,
statlige valgmyndigheter og valgintegritetsobservatører som ønsker å
publisere en Bitcoin-forankret, tukling-tydelig forsegling av en
opptelling i det nøyaktige sertifiseringsøyeblikket.

**Lukker** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Hva dette settet IKKE gjør (les først)

Forseglingen er et kryptografisk tidsstempel av det som ble sertifisert.
Den kan ikke verifisere om det som ble sertifisert var korrekt. Følgende
feilmoduser ligger **utenfor forseglingens domene**:

1. **Kompromittering av valgmaskiner.** Hvis fastvaren ble tuklet med
   eller stemmesummene feiltelt, forankrer forseglingen et galt tall med
   høy integritet. Forseglingen observerer opptellingssystemets utdata;
   den har ingen synlighet inn i selve systemet.

2. **Velgerundertrykkelse / strukturell fratakelse av stemmerett.**
   Stengning av valglokaler, ulikheter i ID-lovgivning, skjevheter i
   avvisningsrater for poststemmer og rensing av velgerregistre ligger
   oppstrøms for sertifiseringen. Forseglingen registrerer stemmer som
   ble talt, ikke stemmer som burde ha blitt talt.

3. **Valgrelatert feilinformasjon.** Forseglingen avgjør ikke påstander
   om valget framsatt av kandidater, medier eller plattformer. En
   forseglet sertifisering kan siteres i en feilinformasjonsfortelling
   like enkelt som i forsvar mot en. Kryptografiske tidsstempler er
   innholdsnøytrale.

4. **Forhåndssertifiseringsbedrageri under stemmeinnsamling eller
   opptelling.** Uregelmessigheter ved stemmeinnsamling, tukling med
   avleveringsbokser, brudd i forvaringskjeden under opptellingsvinduet
   — alt skjer før forseglingsøyeblikket. Forseglingen kan ikke
   tilbakevirkende oppdage dem.

5. **Tvang mot den sertifiserende myndighet.** En framtvunget
   sertifisering produserer en kryptografisk gyldig forsegling av et
   framtvunget resultat. Forseglingen verifiserer at en tjenestemann
   signerte, ikke hvorfor.

6. **Gale sertifiseringer som aldri senere blir korrigert.**
   Forseglingens verdi avhenger av en senere sannhetsfinnende prosess
   (revisjon, omtelling, rettssak) som forseglingen kan sammenlignes
   med. Hvis ingen slik prosess noen gang kjøres, står forseglingen som
   den eneste oppføringen og kan forsteine feilen.

7. **Statistiske anomalier og mønstergjenkjenning.** Forseglingen
   markerer ikke usannsynlige marginer, geografiske anomalier eller
   Benfords-lov-avvik. Det er analytiske oppgaver på de forseglede
   dataene, ikke egenskaper ved forseglingen.

8. **Underordnede valg med tynne revisjonsspor.** Mindre valg har
   svakere omtellings-utløsere; én enkelt forsegling kan ikke
   meningsfullt dekke alle valg på en stemmeseddel uten valgvis
   avgrensning.

**Den ærlige-grenser-seksjonen ovenfor er den bærende delen av dette
settet.** Tjenestemenn som tror at forsegling er ensbetydende med
legitimitet vil bruke det som et skjold. Settet må si tydelig: dette er
en *ikke-tilbakekallelsesprimitiv for sertifiseringsøyeblikket*, ikke
et bevis på valgriktighet.

---

## Hva dette settet MÅ NEKTE å forsegle

Settet er konfigurert til å avvise følgende faktamønstre selv om en
bruker med gyldig signaturmyndighet sender dem inn:

- **Identifikasjon av enkeltvelgere.** Ingen fakta får navngi en
  velger, knytte en stemmeseddel til en velger, eller eksponere noe
  felt som kan re-identifisere en person.
- **Per-stemmeseddel signaturmatch-avgjørelser.** PII-belastet;
  forsegling skaper varige oppføringer av avgjørelser som senere kan
  utfordres.
- **Ethvert faktum hvis publisering ville identifisere en sårbar
  velger.** Inkluderer valgkretsnivå-resultater i valgkretser som er så
  små at stemmevalg kan utledes (vanligvis <50 stemmesedler).
- **Opptellinger forseglet før alle stemmesedler er talt.** Settet
  nekter delvise opptellinger fremstilt som "opptellingen". Før-
  sertifisering betyr *alle stemmesedler talt, før offisiell
  sertifisering* — ikke *under opptellingen*.
- **Foreløpige eller betingede sertifiseringer.** Forseglingen må
  reflektere et faktum, ikke en betingelse.
- **Opptellinger som ekskluderer kohorter med pågående rettstvist**
  uten et eksplisitt forseglet ledsagende faktum som offentliggjør
  ekskluderingen.
- **Forsegling av andre enn den sertifiserende myndighet** for den
  aktuelle jurisdiksjonen.

En nektelse kan i seg selv forsegles som et faktum ("Denne myndigheten
ba om forsegling av X; settet nektet i henhold til nektelsesregel Y"),
hvilket skaper en offentlig oppføring av forsøkt misbruk.

---

## Hva dette settet FAKTISK forsegler

8 fakta i sertifiseringsøyeblikket:

1. **Eksempelvarsel** — erklærer publiseringen som et eksempel
   (virkelige attestasjoner fjerner eller erstatter dette).
2. **Jurisdiksjonsidentifikasjon** — fylke, valgdato, sertifiserende
   myndighet, sertifiserende tjenestemenn etter navn + rolle.
3. **Sertifisert opptelling** — stemmesummer per valg per kandidat +
   over-/understemmer + innskrevne kandidater.
4. **Stemmeseddel-regnskap og avstemming** — totalt avgitt, totalt
   tabulert, totalt avvist etter kategori, modusoppdeling, registrert-
   velger-nevner.
5. **Utstyrs- og revisjonsspormanifest** — tabulator-modell + fastvare-
   hash, CVR-fil-hash, stemmeseddelbilde-arkivhash, forvaringslogghash,
   signaturmatch-policy-hash.
6. **Terskler og utløsere ved sertifisering** — gjeldende signaturmatch-
   terskel, omtellings-utløserterskler, faktiske marginer per valg,
   RLA-frøforpliktelse.
7. **Ledsagende offentliggjøringer og nektelsesregistrering** —
   pågående rettstvister, anomalier under gjennomgang etter
   opptellingen, ekskluderte kohorter, dissenterende
   nemndsmedlemmer; eksplisitt liste over mønstre settet nektet å
   forsegle.
8. **Signerende prinsipal** — identifikasjon av opptellingsnemnd + hver
   underskrivers navn og parti + kryptografisk nøkkelinformasjon.

Hvert faktum avsluttes med nektelsesporten-konvensjonen: *"Dette
faktumet hevder kun X. Det hevder ikke Y"* (der Y er den nærmeste
feilmodusen fra "GJØR IKKE"-seksjonen ovenfor).

---

## Hva dette settet forsvarer mot

- **Stille revisjon av stemmesummer etter sertifisering** — enhver
  heltallsendring av FAKTUM 03 produserer en annen SHA-256, en annen
  Merkle-rot, feiler OTS-verifisering.
- **"Funne stemmesedler" som stille absorberes** — FAKTUM 04s
  avstemmingsaritmetikk er fast ved sertifisering.
- **Påstander om fastvareerstatning** — FAKTUM 05 fryser
  utstyrsmanifestet ved sertifisering.
- **Erstatning av revisjonsartefakter etter sertifisering** — FAKTUM
  05s hash-manifest fanger enhver endring etter sertifisering av CVR,
  stemmeseddelbilder, forvaringslogger eller signaturmatch-policy.
- **Reformulering av terskler og utløsere** — FAKTUM 06 fryser de
  gjeldende reglene ved sertifisering (signaturmatch-terskel,
  omtellings-utløsere, RLA-risikogrense).

## Historiske eller nær-historiske tilfeller der settet ville ha hjulpet

Settet ville ha produsert et nyttig anker — *ikke en løsning* — i saker
som involverer:

- **Antrim County, Michigan (2020).** Innledende uoffisielle resultater
  viste en kandidatombytting som senere ble korrigert til motsatt
  utfall. En forsegling før korreksjon ville ha gitt en offentlig
  referanse for hva den opprinnelige kunngjøringen sa kontra hva
  korreksjonen sa, med begge kryptografisk attestert.
- **Maricopa County, Arizona (2020–2022).** Flere iterasjoner av
  omtellede / reeksaminerte summer sirkulerte. En forsegling i
  sertifiseringsøyeblikket ville ha gitt et utvetydig
  referansepunkt som hver påfølgende opptelling kunne sammenlignes
  med.
- **Florida 2000 (Bush mot Gore-opptelling).** Sertifiserte summer per
  fylke skiftet under omtellingstrykk; en forsegling per fylke før
  omtelling ville ha bevart hva hvert fylke sertifiserte før manuelle
  omtellingsprosedyrer begynte.
- **Diverse utenlandske valg med dokumenterte "korrigeringer" etter
  sertifisering.** Jurisdiksjonsagnostisk.

Settet ville IKKE ha løst de underliggende tvistene om maskinintegritet
i 2020, poststemmepolitiske tvister eller noe valg der kjernespørsmålet
var et omstridt faktum snarere enn en omstridt oppføring.

## Når man skal bruke dette settet

- Jurisdiksjonen din har en stabil, revidert sertifiseringsprosess og
  ønsker å legge til et uforanderlig offentlig anker.
- Du forventer kritisk gjennomgang etter sertifisering og ønsker et
  tukling-tydelig referansepunkt.
- Du har juridisk myndighet til å publisere det listede faktasettet
  uten å eksponere PII.
- Du har en parallell revisjons- eller RLA-prosess slik at forseglingen
  kan sammenlignes med sannhetsfinnende utdata.

## Når man IKKE skal bruke dette settet

- **Ikke bruk det som erstatning for risikobegrensende revisjoner,
  manuelle omtellinger eller revisjoner etter valg.** Dette settet er
  *additivt*, ikke en erstatning.
- **Ikke bruk det hvis den sertifiserende tjenestemannen ikke er den
  faktiske beslutningstakeren** (skaper falsk tilskrivning).
- **Ikke bruk det midt under tabulering.** Settet er for
  sertifiseringsøyeblikket spesifikt. Delvise opptellingsforseglinger
  skaper villedende referansepunkter.
- **Ikke bruk det til å hevde at valget var rettferdig, nøyaktig eller
  legitimt** — det kan det ikke gjøre.
- **Ikke bruk det under press for å forsegle tidligere enn
  sertifiseringsøyeblikket, eller for å utelate en ledsagende
  faktum-offentliggjøring.** Nekt, og forsegle nektelsen.
- **Ikke bruk det som legitimitetsteater.** En forsegling av en
  bedragersk opptelling er en varig offentlig oppføring av bedrageri,
  ikke et forsvar av det. Primitiven skjærer begge veier; det er dens
  ærlighet.

## Hvordan forke dette settet for en virkelig sertifisering

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # erstatt fiktivt innhold med virkelig
bash build/seal.sh     # forsegle VED eller etter den offisielle sertifiseringssignaturen
python3 build/verify.py
```

**Kritisk timing:** forsegle VED sertifiseringsøyeblikket, IKKE før. En
forsegling før offisiell sertifisering skaper en falsk-positiv "dette
er det offisielle resultatet"-oppføring. En forsegling etter er
konvensjonell ikke-tilbakekallelse.

## Integrasjon med eksisterende valginfrastruktur

- **Statlige valgnemnder / EAC-sertifisering.** Settet publiserer ved
  siden av det offisielle sertifiseringsdokumentet. Det erstatter ikke
  den lovbestemte sertifiseringen.
- **Risikobegrensende revisjoner.** CVR-hashen i FAKTUM 05 er den
  samme hashen som RLA-verktøyet konsumerer. Forseglingen binder den
  reviderte CVR til den sertifiserte summen.
- **Omtellingsprosedyrer.** En omtelling utløst i henhold til statlig
  lov produserer et NYTT forseglet faktasett (annet tidsstempel, andre
  hasher, samme jurisdiksjon). Begge forseglinger sameksisterer; ingen
  overskriver den andre. Differansen mellom forseglingene er den
  offentlige oppføringen av hva omtellingen endret.
- **Election Markup Language (EML) og Common Data Format (CDF).**
  Faktumkropper bør kunne avledes fra jurisdiksjonens eksisterende
  EML/CDF-utdata for å holde settet dataformat-agnostisk.
- **Bipartisk opptellingsnemnd-signering.** Multisignaturvariant
  anbefalt for jurisdiksjoner med partibalanserte opptellingsnemnder.

## Hva dette settet IKKE erstatter

- Lovbestemt sertifisering under statlig valglov
- EAC-sertifisering av valgsystemer
- Risikobegrensende revisjoner / manuelle omtellinger
- Omtellingsprosedyrer og revisjoner etter valg
- Rettsavgjørelser eller valgklage-rettstvist

## Hvorfor dette settet eksisterer i v0.3.0+

Dette er det 6. ferdige eksempelet som leveres med myriam-kit. Settet
ble produsert via en Karpathy-stil autoresearch-prosess dokumentert i
`~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Tre prompt-varianter
(imitasjon / første prinsipper / begrensningsorientert) produserte
parallelle settutkast; den begrensningsorienterte varianten skåret
høyest på en vektet rubrikk, og det endelige settet syntetiserer dens
struktur med imitasjonsvariantens kohesjon og første-prinsipper-
variantens operasjonelle detalj.

Selve autoresearch er dokumentert som et prompt-mønster i
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` for fremtidig bruk.

## Lisens

Allment tilgjengelig (CC0). Fork det. Ingen kreditering kreves.
