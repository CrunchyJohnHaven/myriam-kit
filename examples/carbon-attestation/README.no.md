*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Forseglingssett for karbonattestasjon

Et nøkkelferdig myriam-kit-eksempel for karbonprosjektutviklere,
tredjeparts-verifikatorer og registre som ønsker å publisere en
Bitcoin-forankret, tukling-tydelig forsegling av en karbonkreditt-
utstedelse, en fjerningsverifisering eller en utslippsattestasjons-
hendelse i det nøyaktige sertifiseringsøyeblikket — slik at stille
modifikasjoner etter utstedelse blir offentlig oppdagbare.

---

## Hva dette settet IKKE gjør (les først)

Karbonkreditter er politisk og vitenskapelig omstridt. Forseglingen er
et kryptografisk tidsstempel av det som ble attestert. Den kan ikke
verifisere om det som ble attestert reflekterer reell klimagevinst.
Følgende feilmoduser ligger **utenfor forseglingens domene**, og de
utgjør de fleste av de meningsfulle integritetsspørsmålene rundt
karbonkreditter:

1. **Additionalitet.** Forseglingen kan ikke verifisere at den
   krediterte aktiviteten ikke ville ha skjedd uten karbonfinansiering.
   Det kontrafaktiske er prinsipielt uobserverbart. Forseglingen
   registrerer metodologiens additionalitetsargument; den dømmer ikke
   over det.

2. **Permanens.** Forseglingen kan ikke verifisere at sekvestrert
   karbon vil forbli sekvestrert over den relevante tidshorisonten
   (tiår til århundrer for skogkarbon, geologiske tidsskalaer for
   enkelte fjerninger). Nyere litteratur (Badgley et al. 2022,
   Patterson et al. 2022) viser at bufferpuljer har vært vesentlig
   uttømt av reelle reverseringshendelser. En forseglet kreditt er en
   forseglet *påstand* om permanens under spesifiserte bufferpulje-
   antagelser, ikke et bevis på permanens.

3. **Lekkasje.** Forseglingen kan ikke verifisere at unngåtte utslipp i
   prosjektområdet ikke ganske enkelt forskyves til et ikke-prosjekt-
   område. Metodologi-standardbaserte lekkasjefradrag er regulatoriske
   plassholdere, ikke målinger. Forseglingen forankrer det fradraget
   som ble brukt; den sertifiserer det ikke som korrekt.

4. **Tilleggsfordeler.** Forseglingen kan ikke verifisere
   samfunnsutviklings- eller biodiversitetspåstander. Tilleggsfordeler
   er typisk selv-erklært og verifikatorgjennomgått, ikke revidert i
   samme dybde som karbonkvantifisering. Forseglingen forankrer
   dokument-hashene; ikke mer.

5. **Tilstrekkelighet av fritt, forhåndsinformert samtykke (FPIC).**
   Urfolks- og lokalsamfunnssamtykke i karbonprosjekter har en
   dokumentert historie av feilmoduser (tvunget samtykke, samtykke fra
   ikke-representative organer, post hoc-"samtykke" gjennom
   kompensasjon). Forseglingen forankrer FPIC-dokumentasjon og
   klagelogg-hasher; den kan ikke sertifisere at samtykkeprosessen var
   genuin.

6. **Uavhengighet hos verifikator.** Verifikatorer betales av
   prosjektutviklere. Dette er en strukturell interessekonflikt som
   ingen akkrediteringsordning har løst. Forseglingen forankrer
   verifikatorens uavhengighetserklæring; den sertifiserer ikke at
   erklæringen er sann.

7. **Dobbelttelling på tvers av registre eller med nasjonale
   inventarer.** Forseglingen forankrer øyeblikksbildet av
   registertilstanden ved attestasjonstidspunktet. Hvis den samme
   aktiviteten også telles av et vertsland mot dets NDC, eller også
   påstås på et annet register, gjør forseglingen registertilstanden
   diff-bar, men forhindrer ikke dobbeltellingen.

8. **Korrekthet av kjøpers påstand.** En kjøper som pensjonerer en
   forseglet kreditt for å støtte en påstand om "netto null" eller
   "karbonnøytral", framsetter en nedstrøms påstand som forseglingen
   ikke dekker. Forseglingen registrerer pensjoneringen; gyldigheten av
   kjøperens markedsføringspåstand er et separat, nedstrøms spørsmål.

9. **Metodologisk korrekthet.** Forseglingen registrerer
   metodologisitering + dokument-hash i kraft ved attestasjonstidspunktet.
   Den hevder ikke at metodologien er vitenskapelig gyldig.
   Metodologireform skjer; å forsegle under en metodologi som senere
   revideres, gjør ikke kredittene tilbakevirkende "feil" eller "rett"
   — den forankrer hvilke regler som gjaldt ved utstedelse.

**Den ærlige-grenser-seksjonen ovenfor er den bærende delen av dette
settet.** Nesten ethvert meningsfullt integritetsspørsmål om en
karbonkreditt befinner seg i én av disse ni bøttene. Forseglingen
lukker det smale gjenværende gapet: stille tilbakevirkende modifikasjon
av bytes-på-papir. Det gapet er reelt og verdt å lukke, men det er
lite sammenlignet med det omstridte terrenget.

---

## Hva dette settet MÅ NEKTE å forsegle

Settet er konfigurert til å avvise følgende faktamønstre selv om en
bruker med gyldig signaturmyndighet sender dem inn:

- **"Additionalitet" oppgitt som et faktum.** Å forsegle additionalitet
  som faktum skaper en villedende oppføring. Settet aksepterer
  metodologisamsvarende additionalitets-*argumenter*, ikke
  additionalitets-*påstander*.
- **"Permanens" uten eksplisitt tidshorisont- og bufferpulje-
  offentliggjøring.** Å forsegle permanens uten disse parametrene
  tilslører det prosjektet faktisk forplikter seg til.
- **"Ingen lekkasje" uten prosjektspesifikk måling.** Metodologi-
  standardbaserte lekkasjefradrag er ikke måling, og forseglingen vil
  ikke behandle dem som slik.
- **Kvantifiseringer generert før tredjepartsverifisering er
  fullført.** En forsegling før verifikasjon skaper en falsk-positiv
  "verifisert"-oppføring.
- **Utstedelsesoppføringer for kreditter også utstedt på et annet
  register uten eksplisitt offentliggjøring på tvers av registre** i
  FAKTUM 06.
- **Pensjoneringsoppføringer som unnlater å navngi
  pensjoneringsmottakeren.** Anonym pensjonering undergraver
  pensjoneringens offentlig-gode-funksjon; settet nekter å muliggjøre
  det.
- **FPIC-påstander som ikke støttes av attestbare dokument-hasher.**
- **Artikkel 6.2 / 6.4-utstedelse uten en vertslandsfullmakts (LoA)
  hash** forseglet i FAKTUM 06.
- **Forsegling på forespørsel fra noen annen part enn
  prosjektutvikleren + verifikator i fellesskap** for det prosjektet.
- **Tilleggsfordels-påstander forseglet som "sertifisert"** når de
  bare er "selv-erklært og verifikatorgjennomgått".

En nektelse kan i seg selv forsegles som et faktum ("Denne parten
forespurte forsegling av X; settet nektet i henhold til nektelsesregel
Y"), hvilket skaper en offentlig oppføring av forsøkt misbruk.

---

## Hva dette settet FAKTISK forsegler

8 fakta i attestasjonsøyeblikket:

1. **Eksempelvarsel** — erklærer publiseringen som et eksempel
   (virkelige attestasjoner fjerner eller erstatter dette).
2. **Prosjektidentifikasjon** — prosjektnavn, register, register-
   prosjekt-ID, metodologisitering + hash, geografisk grense-hash,
   årgang, prosjektutvikler, påstand om tilleggsfordeler, FPIC-status.
3. **Kvantifisering av utslipp eller fjerning** — brutto tonn CO2e,
   kontrafaktisk baseline, lekkasjefradrag, bufferpulje-bidrag,
   usikkerhetsfradrag, netto krediterbar påstand, hasher av hvert
   numerisk inngangstall.
4. **Målemetodologi** — datakilder for fjernmåling, bakkesannhets-
   plotnettverk, hash av instrumentkalibreringslogg, hash av
   klassifiseringsmodell + nøyaktighetsstatistikk, karbontetthetsmodell,
   kodeproveniens + reproduserbarhetsmanifest.
5. **Tredjepartsverifisering** — verifikator-organisasjon,
   akkreditering, hash av uavhengighetserklæring, tidligere oppdrag
   med utvikler, hash av arkiv med bilder fra stedsbefaring, reiste +
   løste funn, hash av verifikasjonsuttalelses-dokumentet.
6. **Utstedelses- eller pensjoneringsoppføring** — utstedelsesforespørsel
   + godkjenning, totale kreditter utstedt, serienummerintervall,
   tverr-registerdeklarasjon, vertslandsfullmakts-hash der det er
   relevant, pensjoneringsserienummerintervaller + mottakere (for
   pensjoneringsattestasjoner), hasher av øyeblikksbilder av
   registertilstand.
7. **Ledsagende offentliggjøringer og nektelsesregistrering** —
   pågående metodologitvister, ikke-permanensrisiko,
   lekkasjeforbehold, additionalitetsforbehold, FPIC- og
   klagelogg-hasher, tilleggsfordels-forbehold, tidligere
   verifikator-oppdrag; eksplisitt liste over mønstre settet nektet å
   forsegle.
8. **Signerende prinsipal** — prosjektutvikler + verifikator +
   register, hver med rolle + attestasjonsomfang + kryptografisk
   nøkkelinformasjon.

Hvert faktum avsluttes med nektelsesporten-konvensjonen: *"Dette
faktumet hevder kun X. Det hevder ikke Y"* (der Y er den nærmeste
feilmodusen fra "GJØR IKKE"-seksjonen ovenfor).

---

## Hva dette settet forsvarer mot

- **Stille modifikasjon av kvantifisering etter utstedelse.** Enhver
  heltallsendring av FAKTUM 03 produserer en annen SHA-256, en annen
  Merkle-rot, feiler OTS-verifisering.
- **Stille metodologisubstitusjon.** FAKTUM 02 fryser
  metodologisiteringen + dokument-hashen ved utstedelse. En
  registerutbytting til en annen metodologi-versjon etter utstedelse
  er offentlig diff-bar.
- **Stille baseline-revisjon.** FAKTUM 03s utdata-hash for
  baseline-scenariomodell er forseglet. En post hoc baseline-rejustering
  for å produsere flere kreditter er oppdagbar.
- **Stille substitusjon av verifikatoruttalelse.** FAKTUM 05s hash av
  uttalelsesdokumentet er forseglet. En omskriving etter utstedelse av
  "verifikatoren har alltid sagt X" er oppdagbar.
- **Stille forsvinning av pensjoneringsoppføring.** FAKTUM 06s
  øyeblikksbilde av registertilstanden er forseglet. Kreditter som
  mystisk blir "tilgjengelige" igjen etter å ha vært merket som
  pensjonert, er oppdagbare mot forseglingen.
- **Stille substitusjon av FPIC-dokumenter.** FAKTUM 07s FPIC- og
  klagelogg-hasher er forseglet. Erstatnings-samtykkedokumenter er
  oppdagbare.
- **Stille fjerning av ubeleilige offentliggjøringer.** FAKTUM 07s
  ledsagende-offentliggjørings-status er forseglet. Stille sletting
  av et ikke-permanensforbehold fra en prosjektbeskrivelsesside er
  oppdagbar mot de forseglede bytene.

Settet forsvarer IKKE mot de underliggende integritetsspørsmålene
(additionalitet, permanens, lekkasje, FPIC-tilstrekkelighet,
verifikator-uavhengighet, metodologisk gyldighet). Det er de
vanskeligere problemene, og forseglingen kan ikke løse dem.

---

## Historiske eller nær-historiske tilfeller der settet ville ha hjulpet

Settet ville ha produsert et nyttig anker — *ikke en løsning* — i
saker som involverte stille tilbakevirkende modifikasjon av
karbonattestasjonsoppføringer. Det ville IKKE ha løst de underliggende
omstridte spørsmålene i noen av disse sakene.

- **Guardian / Die Zeit / SourceMaterial-undersøkelsen av Verras
  regnskogkreditter i 2023.** Etterforskere fant at de fleste studerte
  REDD+-prosjekter produserte kreditter hvis hevdede unngåtte utslipp
  ikke samsvarte med senere reanalyse via fjernmåling. Undersøkelsen
  krevde rekonstruksjon av prosjektdokumentasjon mot tilbakevirkende
  modifiserte registeroppføringer. En forseglet publisering ved hver
  utstedelsessyklus ville ha gitt utvetydige referansebytes for det som
  ble attestert i hver syklus — ikke en løsning for det underliggende
  baseline-problemet, men en ren forensisk tidslinje.

- **De californiske reverseringshendelsene for skogsoffsett i 2020.**
  Flere skog-karbonprosjekter under Californias overholdelsesmarked
  opplevde skogbrann-reverseringer som overskred bufferpulje-reserven
  satt av for dem. Å rekonstruere hva hvert prosjekt hadde attestert
  om ikke-permanensrisiko *ved utstedelse* (kontra det prosjektet
  senere hevdet det hadde attestert) er for tiden vanskelig.
  Forseglinger per årgang ville ha gjort attestasjonene før brannen
  kanonisk gjenfinnbare.

- **Diverse REDD+-prosjekter der baselinemetodologier for
  referanseregioner ble tilbakevirkende kritisert som oppblåste.** En
  forseglet metodologi-dokument-hash på utstedelsestidspunktet ville
  ha forankret hvilken metodologi-versjon som faktisk gjaldt for
  hvilken årgang, og gjort forsvaret "metodologien har alltid vært X"
  diff-bar.

- **Flere australske karbonkredittenhet (ACCU)-tvister om
  menneskeindusert regenerasjon (2022–2023).** Akademisk kritikk av
  hvorvidt regenerasjon faktisk var prosjektindusert kontra naturlig,
  ble til tvister om hva prosjektet opprinnelig hadde hevdet.
  Forseglede attestasjoner ville ha gitt utvetydige oppføringer per
  årgang.

- **Karbonoffsett-pensjoneringsoppføringer som har skiftet tilstand.**
  Flere dokumenterte tilfeller av pensjoneringsoppføringer på
  frivillige-marked-registre som ser ut til å endre status etter
  pensjonering (blir "pensjonert" av en annen grunn eller tilskrives
  en annen mottaker i ettertid). Forseglinger per pensjonering ville
  ha forankret tilstanden i øyeblikket for den opprinnelige
  pensjoneringen.

I ingen av disse tilfellene ville settet ha løst om den underliggende
kreditten representerte reell klimagevinst. Settet forankrer
oppføringer; det er alt det gjør.

---

## Når man skal bruke dette settet

- Du er en prosjektutvikler som ønsker å publisere en tukling-tydelig
  attestasjon ved siden av din standard register-innlevering.
- Du er en tredjepartsverifikator som ønsker at din verifikasjons-
  uttalelse skal kunne offentlig verifiseres mot et registers senere
  fremstilling av "hva verifikatoren sa".
- Du er et register som ønsker å tilby et ekstra integritetslag på
  utstedelses- og pensjoneringsoppføringer — særlig for prosjekter i
  jurisdiksjoner med svakere rettsstats-back-stops for
  registerintegritet.
- Du er en journalist, akademiker eller NGO som kjører en flerårig
  longitudinell analyse av karbonprosjekter og trenger et offentlig
  anker for å diffe et prosjekts senere fremstillinger mot
  utstedelsestidspunktets bytes.
- Du er en kjøper (selskap med netto null, flyselskaps-overholdelse)
  som ønsker at kredittene du pensjonerer skal bli pensjonert mot
  offentlig forankrede oppføringer, slik at din nedstrøms
  markedsføringspåstand kan revideres mot en stabil forensisk
  tidslinje.

## Når man IKKE skal bruke dette settet

- **Ikke bruk det som erstatning for akkreditert tredjepartsverifisering.**
  Forseglingen erstatter ikke ISO 14064-3-verifisering; den
  komponerer med den.
- **Ikke bruk det til å hevde at et prosjekt er "additivt",
  "permanent" eller "lav-lekkasje".** Forseglingen kan ikke verifisere
  disse egenskapene. Å bruke forseglingen til å hevde dem er misbruk.
- **Ikke bruk det som legitimitetsteater for lavkvalitetskreditter.**
  En kryptografisk forsegling på en lavkvalitetskreditt er en varig
  forensisk oppføring av lavkvaliteten, ikke et forsvar av den.
  Primitiven skjærer begge veier; det er dens ærlighet.
- **Ikke bruk det til å forsegle kreditter som også telles av et
  vertsland mot dets NDC** uten eksplisitt offentliggjøring av
  tilsvarende justering i FAKTUM 06.
- **Ikke forsegle før verifikasjon.** En forsegling før verifikatorens
  uttalelse er endelig, skaper en falsk-positiv "verifisert"-oppføring.
- **Ikke bruk det under press for å utelate en ledsagende
  faktum-offentliggjøring i FAKTUM 07** (pågående metodologitvister,
  FPIC-saker, tidligere verifikator-oppdrag). Nekt, og forsegle
  nektelsen.
- **Ikke bruk det som markedsføringsmerke.** "MYRIAM-forseglet" er
  ikke en kvalitetspåstand; det er en forensisk egenskap. Å behandle
  det som et kvalitetsmerke er nøyaktig det misbruket som den
  begrensningsorienterte designen forsøker å forhindre.

## Hvordan forke dette settet for en virkelig attestasjon

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # erstatt fiktivt innhold med virkelig
bash build/seal.sh         # FORSEGLE VED eller ETTER registerutstedelse, ikke før
python3 build/verify.py    # bekreft
```

**Kritisk timing:** forsegle VED eller ETTER registerets offisielle
utstedelseshendelse, IKKE før. En forsegling før utstedelse skaper
en falsk-positiv "utstedt"-oppføring. For pensjoneringsattestasjoner,
forsegle VED pensjoneringsøyeblikket. For pågående
overvåkningsattestasjoner mellom utstedelse og pensjonering, forsegle
ved hver verifikatorsignerte overvåkningssyklus — men gjør det klart i
FAKTUM 01 at attestasjonen er en overvåkningsoppdatering, ikke en
utstedelse.

## Integrasjon med eksisterende karbonsinfrastruktur

- **Verra (VCS).** URL-en eller IPFS-CIDen for den forseglede
  publiseringen kan vedlegges VCS-prosjektsiden som supplerende
  dokumentasjon. Forseglingen erstatter ikke VCS-verifisering; den
  komponerer med den.
- **Gold Standard.** Samme integrasjonsmodell — supplerende
  attestasjon ved siden av Gold Standard-utstedelsesdokumentasjon.
  Gold Standards vektlegging av tilleggsfordeler + dokumentasjon av
  samfunnsfordeler kartlegges naturlig på FAKTUM 02 + FAKTUM 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Samme integrasjonsmodell.
- **Artikkel 6.4 (Parisavtalens tilsynsmyndighetsmekanisme).**
  Vertslandsfullmakts-hashen i FAKTUM 06 er spesifikt utformet for
  ITMO-sporbarhet i henhold til Artikkel 6.4 / 6.2.
  Tilsvarende-justerings-offentliggjøring er et nektelsesport-styrt
  felt.
- **EU ETS MRV.** For utstedere i overholdelsesmarkedet kartlegges
  MRV-rapport-hashen til FAKTUM 03s hash av kvantifiseringsregnearket.
  Forseglingen komponerer med — erstatter ikke — operatørens
  verifiserte utslippsrapport.
- **CDP (Carbon Disclosure Project) bedriftsoffentliggjøring.** For
  bedrifter som siterer pensjonerte kreditter i CDP-innleveringer er
  pensjoneringsoppføringen forseglet under FAKTUM 06 den kanoniske
  hentbare oppføringen. CDP-innleveringsspråket kan referere til den
  forseglede publiseringens Merkle-rot eller IPFS-CID.
- **ISO 14064-2 (prosjekt) / ISO 14064-3 (verifisering) / ISO 14065
  (akkreditering).** Forseglingen registrerer
  samsvarsbekreftelsen + hashene; den utfører ikke
  samsvarsvurderingen.
- **TSVCM Core Carbon Principles (CCP) / ICVCM-merker.** Der et
  prosjekt er vurdert mot ICVCM CCP-ene, kan hashen av
  vurderingsresultatet forsegles i FAKTUM 07 som en ledsagende
  offentliggjøring.

## Hva dette settet IKKE erstatter

- Akkreditert tredjepartsverifisering (ISO 14064-3)
- Registerets utstedelses- og pensjoneringsarbeidsflyter
- Vurdering av metodologisamsvar
- Vertslandsautoriseringsprosesser for Artikkel 6-transaksjoner
- MRV-prosesser for overholdelsesmarkedet (EU ETS, Californias
  Cap-and-Trade, RGGI osv.)
- Integritetsinitiativer for det frivillige markedet (ICVCM, VCMI)
- Uavhengig klimavirkningsvurdering

## Hvorfor dette settet eksisterer i v0.4.0+

Dette er det 7. ferdige eksempelet som leveres med myriam-kit. Settet
eksisterer fordi karbonkreditt-markeder har en veldokumentert
historie med stille tilbakevirkende modifikasjon — metodologier som
tilbakevirkende reintolkes, baselines som tilbakevirkende revideres,
pensjoneringsoppføringer som endrer tilstand, og prosjekt-
offentliggjøringer som stille fjerner ubeleilige forbehold over tid.

Forseglingen lukker det *smale* gapet bytes-ved-attestasjonstidspunktet.
Den behandler ikke — og kan ikke behandle — de større omstridte
spørsmålene om additionalitet, permanens, lekkasje eller autentisitet
av tilleggsfordeler. Settets ærlige innramming av denne begrensningen
er dens viktigste egenskap.

## Lisens

Allment tilgjengelig (CC0). Fork det. Ingen kreditering kreves.
