*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Forseglingssett for kjede-av-forvaring av rettsbevis

Et nøkkelferdig myriam-kit-eksempel for forensiske innsamlingsteam —
data-forensiske eksperter, mobiltelefon-uttrekkingsteknikere, kropps-
kamera-bevisforvaltere, laboratoriesupervisorer — som ønsker å publisere
en Bitcoin-forankret, tukling-tydelig forsegling av *hvilke bytes som
ble innhentet* og *når*, ved tidspunktet for innhenting av digitalt
bevis, slik at tvister om kjede-av-forvaring har et offentlig anker.

---

## Hva dette settet IKKE gjør (les først)

Forseglingen er et kryptografisk tidsstempel for HVILKE FORENSISKE
BILDER som ble innhentet, NÅR de ble innhentet, av HVILKET BYRÅ,
under HVILKEN ARRESTORDRE, og gjennom HVILKEN METODIKK. Den kan ikke
besvare noe spørsmål om saken utover dette. Følgende er **utenfor
forseglingens domene**:

1. **Tillatelse under Federal Rules of Evidence (eller annen
   bevisregel).** Forseglingen forankrer bytes og tidsstempler. Om
   bevis er tillatt — under FRE 901 autentisering, FRE 702
   ekspertvitnesbyrd / Daubert, FRE 403 fordomsvekting, eller et
   statlig domstolsekvivalent — er et juridisk-prosessuelt spørsmål.
   En perfekt forseglet innhenting kan fortsatt bli kjent
   utillatelig; en uforseglet innhenting kan fortsatt bli tillatt.
   Forseglingen er additivt bevis på integritet, ikke en erstatning
   for domstolens tillatelseskjennelse.

2. **Om beslaget var lovlig.** Fjerde-tillegg-overholdelse,
   arrestordregyldighet, omfangsoverholdelse, anvendelighet av
   eksklusjonsregelen — alle disse er oppstrøms for forseglingen.
   Forseglingen registrerer at innhentingen skjedde under
   arrestordre FICT-SW-2026-0188; om arrestordren ble lovlig utstedt
   og lovlig forkynt er for domstolen.

3. **Om beviset er belastende, frifinnende eller nøytralt.**
   Forseglingen forankrer hash-er; tolkninger av hva disse hash-ene
   inneholder hører hjemme i den forensiske undersøkelsesrapporten,
   som er sitt eget dokument med sin egen disclosure- og
   bevisregelregime. Forseglingen vil nekte å forsegle "FAKTUM N:
   den mistenktes laptop inneholdt belastende materiale" — se
   nektelsesregel R4.

4. **Om kjede-av-forvaring er prosedyremessig korrekt under den
   gjeldende statens bevislov.** Forseglingen registrerer byråets
   samtidige forvaringshendelseslogg (FAKTUM 05). Om denne loggen
   tilfredsstiller en bestemt stats krav til kjede-av-forvaring er
   for domstolen ved bevishøringen.

5. **Om den forensiske metodikken var pålitelig.** Daubert og dens
   etterkommere (og delstatsanaloger som Frye, der den fortsatt
   gjelder) vurderer metodologisk pålitelighet. Forseglingen
   registrerer HVILKE verktøy og versjoner som ble brukt (FAKTUM
   04); om disse verktøyene oppfyller en bestemt domstols
   pålitelighetsstandard er for domstolen. Verktøy-feil har blitt
   dokumentert post-innhenting i tidligere saker; forseglingens
   rolle er å gjøre versjon-og-binær-hash-posten offentlig
   refuterbar, ikke å garantere for verktøyene selv.

6. **Om bevis ble tuklet med FØR innhenting.** Forseglingen
   forankrer bytes fra avbildningsøyeblikket og framover. Hvis en
   mistenkt, en betjent, eller en tredjepart endret kildeenheten
   før den ble avbildet, kan ikke forseglingen oppdage det — den
   forsegler de endrede bytene med samme integritet som den ville
   forseglet originalen. Forseglingens verdi begynner ved
   avbildningstidsstemplet.

7. **Om arrestordrens omfang ble respektert.** Arrestordretillegget
   definerer hva som kan innhentes; forseglingen registrerer hva
   som BLE innhentet. Om innhentingen oversteg arrestordrens
   omfang er, igjen, et juridisk spørsmål med sin egen rettsmiddel
   (undertrykkelsesforslag under den passende statens prosedyre).

8. **Re-identifisering av enhver privat part i etterforskningen.**
   Forseglingen nekter å publisere noe navn, identifikator eller
   fingeravtrykk som kan re-identifisere en mistenkt, tiltalt, offer,
   vitne eller eiendomsbeboer. Saksdokumentreferansen er det
   passende håndtaket for parter med legitimasjon til å lokalisere
   saken.

**Ærlig-grense-seksjonen ovenfor er den bærende delen av dette
settet.** Forensiske team som tror forsegling er lik tillatelse vil
bruke det som et skjold. Settet må si tydelig: *dette er en ikke-
fornektelses-primitiv for innhentingsøyeblikket, ikke et bevis på
lovlig innhenting, metodologisk soliditet eller domstolsanerkjent
kjede-av-forvaring.*

---

## Hva dette settet MÅ NEKTE å forsegle

Settet er konfigurert til å avvise følgende faktamønstre selv om en
bruker med gyldig byrå-signeringsmyndighet sender dem inn:

- **Personlig identifikasjon av mistenkte, tiltalte, ofre, vitner,
  eller enhver privat tredjepart.** Saksdokumentreferansen er
  håndtaket for parter med legitimasjon; den offentlige forseglingen
  må ikke være en re-identifikasjonsindeks.
- **Personnavn på forensiske eksperter eller annet byråpersonell i
  den offentlige forseglingen.** Roller er offentlige; person-til-
  rolle-bindinger forsegles separat og er disclosure-bare under
  rettsprosess.
- **File-nivå-hash-er (eller fingeravtrykk) av mistenkt seksuelt
  overgrepsmateriale mot barn, biometriske maler, eller andre
  sårbare-person-re-identifiserende data — selv ved hash.** En
  SHA-256 av en enkelt fil er en permanent søkbar identifikator;
  publisering på en offentlig hovedbok kan re-viktimisere subjekter
  via korrelasjon med private databaser. Bilde-nivå (forensisk-bilde-
  nivå) hash-er av hele disker er akseptable; file-nivå-hash-er av
  slikt materiale er ALDRI akseptable.
- **Undersøkelsesfunn, tolkninger, meninger eller konklusjoner om
  hva bytene betyr.** Forseglingen forankrer HVILKE BYTES som ble
  innhentet og NÅR. Tolkningen hører hjemme i den disclosure-bare
  undersøkelsesrapporten, ikke på en tukling-tydelig offentlig
  hovedbok.
- **Påstander om tillatelse eller noen annen juridisk konklusjon**
  ("dette beviset er tillatt," "arrestordren var lovlig," "kjede-
  av-forvaring var riktig under §X.Y"). Juridiske konklusjoner er
  domstolsfunksjoner.
- **Forsegling av noen andre enn det innhentende byråets autoriserte
  hovedperson.** En forsvarsekspert kan bruke settet til å forsegle
  sin egen uavhengige verifisering av manifestet; de kan ikke
  forsegle ORIGINAL-innhentingen under det innhentende byråets navn.
- **Rolle-til-individ-bindinger inne i den offentlige forseglingen.**
  Bindinger forsegles i en separat følgeoppføring (hashet i FAKTUM
  05) under byråets tilgangskontroll.
- **Pre-beslag eller pre-arrestordre etterforskningsfakta.**
  Informantuttalelser, pre-arrestordre overvåking, parallell-
  konstruksjonsinngang — ingen av disse hører hjemme på
  innhentingsforseglingen. Forseglingen er omfanget av
  innhentingshendelsen.

En nektelse i seg selv kan forsegles som et faktum ("Dette byrået
ba om forsegling av X; settet nektet i henhold til nektelsesregel
Y"), og skaper en offentlig oppføring av forsøkt misbruk.

---

## Hva dette settet GJØR forsegler

8 fakta ved innhentingsøyeblikket:

1. **Eksempelnotis** — erklærer publikasjonen som et eksempel
   (reelle attesteringer fjerner eller erstatter dette).
2. **Innhentingskontekst** — saksidentifikator, arrestordrereferanse,
   innhentende byrå, anmodende myndighet, dato/tid for beslag og
   innhenting, sted for innhenting (beslagssted er redigert til en
   separat-forseglet følgeoppføring for å unngå re-identifisering
   av eiendommen).
3. **Bevismanifest** — per forensisk-bilde-vare: SHA-256 hash,
   filstørrelse, kildeenhets anonymisert identifikator,
   innhentingsmetode, forensisk bildeformat.
4. **Innhentingsmetodikk** — forensiske verktøynavn og eksakte
   versjoner (med verktøy-binær-hash-er), skrivebeskytters merke/
   modell og firmware, NIST CFTT-verifiseringsreferanse,
   verifiseringsprosedyre brukt, bildeformat-valg.
5. **Kjede-av-forvaring-logg** — per-hendelse tidslinje fra
   innledende beslag gjennom slutten av avbildning, forvaltere
   identifisert ved ROLLE (ikke ved navn), med hash-er av separat-
   forseglede følgeoppføringer (rolle-til-individ-binding,
   transport-GPS-logg, bevislager-tilgangslogg, tukling-segl-
   fotografier osv.).
6. **Eksperts kvalifikasjoner etter rolle** — sertifiseringer
   innehatt, etterutdanningsstatus, tidligere ekspert-vitne-
   erfaringsantall, Daubert-eksponering, interessekonflikt-
   opplysninger — alle på rollenivå, ikke personlige.
7. **Følgeoppslysninger og nektelsesoppføring** — parallelle
   etterforskninger, ventende arrestordre-utfordringer,
   undertrykkelsesforslag, privilegie-filter / forurensningsteam-
   protokoll i kraft, tidligere innhentingsforsøk, leverandørens
   feilrapport-gjennomgang; eksplisitt liste over mønstre settet
   nektet å forsegle.
8. **Signerende hovedperson** — innhentende byrå-identifikasjon +
   rolle-nivå signerende (ledende ekspert) + rolle-nivå med-
   signerende (enhetsleder) + kryptografisk nøkkelinformasjon.

Hvert faktum avsluttes med nektelsesporten-konvensjonen: *"Dette
faktumet hevder kun X. Det hevder ikke Y"* (der Y er den nærmeste
feilmodusen fra "GJØR IKKE"-seksjonen ovenfor).

---

## Hva dette settet forsvarer mot

- **Stille post-innhentingsendring av et forensisk bilde.** Enhver
  byte-nivå-endring av ethvert bilde produserer en annen SHA-256,
  og post-endrings-bildet vil ikke verifisere mot det forseglede
  FAKTUM 03-manifestet.
- **Påstand om at "andre verktøy ble brukt."** FAKTUM 04
  registrerer eksakte verktøyversjoner med verktøy-binær-hash-er;
  senere "vi brukte faktisk v4.7.0, ikke v4.7.1" -påstander er
  offentlig refuterbare.
- **Påstand om at skrivebeskytteren ikke var engasjert, eller
  brukte en annen modell.** FAKTUM 04 fryser skrivebeskytter-
  manifestet.
- **Forvaringsloggendring.** Enhver endring av FAKTUM 05
  forvaringshendelse-tidslinjen (legge til, fjerne eller re-
  tidsstemple en hendelse) endrer FAKTUM 05-hashen og er offentlig
  detekterbar.
- **Substitusjon av en annen eksperts legitimasjon.** FAKTUM 06
  fryser rolle-nivå-legitimasjonsprofilen ved innhentingstidspunkt.
- **Selektiv utelatelse av følgeoppslysninger.** FAKTUM 07
  oppregner forventede opplysningskategorier; en tom kategori må
  eksplisitt attesteres ("ingen ved innhentingstidspunktet"), så
  en senere "vi innså ikke at det var relevant" er offentlig
  refuterbar.
- **Post-innhentingspåstander om at eksperten hadde en konflikt
  som ikke ble opplyst.** FAKTUM 06-konfliktopplysning er frosset
  ved innhenting; senere utfordringer kan testes mot den.

Settet forsvarer **ikke** mot samtidig korrupsjon — et team som
forsettlig forsegler falsk metadata ved innhentingstidspunktet
produserer en kryptografisk gyldig forsegling av falsk metadata.
Primitivet er ærlig om det: det er en ikke-fornektelses-primitiv
for byråets samtidige påstander, ikke et bevis på at disse
påstandene er korrekte.

---

## Historiske eller nær-historiske saker settet ville hjulpet med

Settet ville produsert et nyttig anker — *ikke en oppløsning* — i
tidligere saker der digitalt bevis-kjede-av-forvaring ble et
omstridt bevismessig spørsmål. For å unngå å navngi tiltalte (som
er private parter selv når dømt), er disse beskrevet etter
sakstype, ikke etter navngitt individ:

- **Den føderale forensiske-verktøy-feil-kontroversen i midten av
  2010-tallet** der et utbredt brukt forensisk avbildningsverktøy
  ble oppdaget, post-innhenting, å ha en kant-tilfelle-feil som
  påvirket en bestemt kildemedietype. Et forseglet
  innhentingsmanifest med frosne verktøy-versjon-og-binær-hash-
  data ville la forsvar og påtale være enige om nøyaktig hvilken
  versjon som ble brukt, og eliminere en akse av tvist.

- **Flere delstatssaker som involverte omstridte mobil-enhet-
  utvinningsutganger**, der utvinningsverktøyets leverandør senere
  utga en feilrettingspatch og spørsmålet ble "påvirket feilen
  denne saken." Et forseglet metodikk-faktum lar spørsmålet
  besvares mot frosset versjonering-data, snarere enn mot byråets
  nåværende hukommelse om hvilken versjon som ble brukt.

- **Kroppskamera-overleveringstvister** i saker der BWC-
  leverandørens dokkesystem senere ble påstått å ha tillatt
  modifikasjon av opptakene i transitt. Et forseglet manifest av
  kropps-kamera-arkivet ved tidspunktet for byråmottak forankrer
  hvilke bytes byrået mottok fra dokkesystemet; senere
  redigeringer på byråsiden er offentlig detekterbare.

- **Hash-kollisjonskontroverser i data-forensiske saker**, der en
  forsvarsekspert hevdet at MD5 (fortsatt i bruk i noen eldre
  arbeidsflyter) var utilstrekkelig. En forseglet innhenting som
  registrerer BÅDE MD5 og SHA-256 lar SHA-256 stå selv om MD5 er
  utfordret.

- **Tvister om undersøkelsesmetodikk-utvikling mellom innhenting
  og rettssak.** Når en sak sitter mellom innhenting og rettssak
  i årevis, kan metodikken som var standard ved innhenting ha
  blitt erstattet ved rettssakstidspunktet. Den forseglede
  oppføringen lar domstolen evaluere metodikk mot standarden som
  var nåværende ved innhentingsøyeblikket, ikke mot den senere
  standarden.

Settet ville IKKE løst de underliggende tvistene om skyld eller
uskyld i noen av disse sakstypene. Det ville løst én bestemt
bevismessig sub-tvist: om bytene, verktøyene og prosedyrene var
det byrået hevder de var ved tidspunktet byrået hevder dem.

---

## Når bruke dette settet

- Byrået ditt har en stabil forensisk SOP og ønsker å legge til en
  Bitcoin-forankret offentlig attestering som et tukling-tydelig
  lag på toppen av eksisterende papir-og-signatur kjede-av-
  forvaring.
- Du forventer at denne saken vil involvere betydelig forsvars-
  utfordring av forensisk bevis (høyinnsatssak, ny metodikk,
  omstridte verktøyversjoner osv.).
- Du kan publisere det listede faktumssettet uten å eksponere PII
  eller sårbare-person-re-identifiserende data. (Settets
  nektelsesregler håndhever dette; hvis dine fakta ville kreve et
  nektelses-regel-brudd, ikke bruk settet.)
- Det innhentende byråets generelle rådgiver og påtalemyndighetens
  kontor har gjennomgått publikasjonsplanen. Offentlig publikasjon
  av en saksidentifikator-bærende artefakt har implikasjoner for
  pågående etterforskning; rådgiver-gjennomgang er ikke valgfri.
- Din jurisdiksjons forsvars-disclosure-regler er kompatible med
  byrået separat holdende rolle-til-individ-binding-oppføringen
  (hashet i FAKTUM 05). Hvis din jurisdiksjon krever offentlig
  ekspert-navne-disclosure, må du endre settet tilsvarende.

## Når IKKE bruke dette settet

- **Ikke bruk som erstatning for byråets eksisterende kjede-av-
  forvaring-dokumentasjon.** Dette settet er *additivt*, ikke
  erstattende. Byråets CMS, forvaringslogg og disclosure-
  produksjonsforpliktelser er uendret.
- **Ikke bruk hvis innhentingen involverer CSAM, biometriske
  maler, eller andre sårbare-person-re-identifiserende data på
  fil-nivå.** Bilde-nivå-hash-er av hele disker er akseptable;
  fil-nivå-hash-er av slikt materiale er ALDRI akseptable, selv
  under nektelses-regel-frafall. Hvis du ikke kan konstruere et
  faktum-sett uten å bryte R3, ikke bruk settet.
- **Ikke bruk for å hevde at arrestordren var lovlig, beslaget var
  riktig, eller beviset er tillatt** — settet kan ikke gjøre det,
  og nektelsesregel R5 vil avvise enhver slik påstand.
- **Ikke bruk under press til å forsegle før innhenting er
  fullført.** En delvis-innhentings-forsegling representerer
  feilaktig tilstanden.
- **Ikke bruk for å publisere ekspert-personnavn** med mindre din
  jurisdiksjon spesifikt krever det og dine eksperter har
  individuelt samtykket. Standarden er rolle-nivå-publikasjon.
- **Ikke bruk i forseglede eller under-segl-saker** uten eksplisitt
  rettstillatelse. Publisering av en saksidentifikator på Bitcoin
  er irreversibel; hvis saken senere forsegles, kan ikke den
  offentlige forseglingen tilbakekalles. Settet er kun for
  offentlig-rekord-innhentinger.
- **Ikke bruk som legitimitetsteater.** En forsegling av en
  feilaktig innhenting er en permanent offentlig oppføring av
  feilene, ikke et forsvar mot dem. Primitivet kutter begge veier;
  det er dets ærlighet.

## Hvordan forke dette settet for en reell innhenting

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # erstatt fiktivt innhold med reelt
                       # bruk nektelsesregler R1-R8 gjennomgående
bash build/seal.sh     # forsegle VED eller like etter fullføring av avbildning
python3 build/verify.py
```

**Kritisk tidsbestemmelse:** forsegle VED eller like etter
konklusjonen av avbildning (FAKTUM 05 hendelse E17 i eksempel-
tidslinjen). En forsegling under avbildning skaper en delvis-
innhentings-oppføring; en forsegling mye senere skaper et gap
hvor byrået kunne ha endret bildene. Det riktige vinduet er
umiddelbart etter bildeverifisering fullføres for den siste varen
i utstillingssettet.

**Kritisk gjennomgang:** før forsegling, kjør publikasjonen
gjennom en annen forensisk ekspert (ikke lederen) og gjennom
byråets rådgiver. Når forseglet, er publikasjonen permanent.

## Integrasjon med eksisterende kjede-av-forvaring-infrastruktur

- **Byråets saksbehandlingssystem (CMS).** CMS forblir byråets
  primære registersystem. Forseglingen erstatter ikke CMS; den
  forplikter til bytene og metodikken CMS registrerer, slik at
  post-hoc CMS-redigeringer er offentlig detekterbare.
- **Federal Rules of Evidence / Daubert / delstats-bevisregler.**
  Forseglingen bidrar til FRE 901-autentiseringsposten ved å
  tilby tukling-tydelig integritet. Den TILFREDSSTILLER IKKE FRE
  702/Daubert alene; metodikk-pålitelighet testes fortsatt ved
  bevishøringen.
- **Forsvars-disclosure (FRCP 16, Brady, Giglio, og delstats-
  ekvivalenter).** Følgeoppføringene hashet i FAKTUM 05 (rolle-
  til-individ-binding, forvaringslogg, tukling-segl-foto osv.)
  forblir gjenstand for normal disclosure. Forseglingen forankrer
  hva disse oppføringene hevdet ved innhentingsøyeblikket, slik
  at en senere "oppføringen var annerledes på det tidspunktet"
  -påstand er offentlig refuterbar.
- **NIST Computer Forensics Tool Testing (CFTT).** Settet
  refererer til CFTT-verifiseringslogger i FAKTUM 04 / FAKTUM 05;
  referansen er en hash, ikke loggen selv, så CFTT-prosesser er
  upåvirket.
- **Domstols-utnevnte nøytrale parter og forsvarseksperter.** Begge
  kan re-hashe de forensiske bildene de mottar i disclosure mot
  FAKTUM 03-manifestet, uavhengig av byrå-samarbeid. Dette er
  settets primære verdi-tillegg for forsvarssiden.
- **Appellgjennomgang.** År senere kan en appell-forensisk
  gjennomgangsperson verifisere den originale innhentings-
  metodikken mot den forseglede FAKTUM 04-oppføringen, snarere
  enn mot byråets muligens-utviklede nåværende erindring.

## Hva dette settet IKKE erstatter

- The Federal Rules of Evidence (eller noen delstats-bevisregel).
- Daubert / Frye-påliteligheitsstandarder for ekspert-vitnesbyrd.
- Byråets forensiske SOP og CMS.
- Forsvars-disclosure-forpliktelser under FRCP 16 / Brady /
  Giglio / delstats-ekvivalenter.
- Rettskjennelser, undertrykkelsesforslag, bevishøringer eller
  andre domstol-administrerte prosesser.
- NIST CFTT eller andre verktøy-testregimer.
- Byråets privilegie-filter / forurensningsteam-protokoll.

## Hvorfor dette settet eksisterer i v0.4.0+

Dette er det 8. utarbeidede eksempelet som sendes med myriam-kit.
Det følger den constraint-først-strukturen validert av
autoforskningen dokumentert i `~/Genesis/calc/PROMPT_LIBRARY_v0.md`
— constraint-først-prompt-varianten scoret høyest på en vektet
rubrikk på tvers av flere eksempeldomener. Åpningsseksjonene er de
bærende delene av settet; manifestinnholdet er den enkle delen.

Settets design er bevisst konservativ på ekspert-navne-publikasjon
og aggressiv på "dette etablerer ikke tillatelse"-ansvarsfraskrivelsen.
Det forensiske samfunnet har en dokumentert historie av å bli
angrepet for sitt forensiske arbeid; settet defaulter til den
tryggere posisjonen for eksperter. Byråer i jurisdiksjoner der
offentlig personnavn-navngiving er nødvendig kan endre sin fork
tilsvarende, men standard-nektelsen favoriserer ekspertsikkerhet.

## Lisens

Offentlig domene (CC0). Forke det. Ingen attribuering nødvendig.
