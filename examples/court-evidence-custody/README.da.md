*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Forseglingskit til bevisketten for retsligt bevismateriale

Et nøglefærdigt myriam-kit-eksempel til forensiske
indsamlingsteams — computer-forensiske undersøgere, teknikere til
udvinding af mobilenheder, opbevarere af bodycam-bevis,
laboratorieledere — der på tidspunktet for digital-bevisindsamling
ønsker at offentliggøre en Bitcoin-forankret, manipulations-synlig
forsegling af *hvilke bytes der blev erhvervet* og *hvornår*, så
tvister om beviskæden har et offentligt anker.

---

## Hvad dette kit IKKE gør (læs først)

Forseglingen er et kryptografisk tidsstempel for HVILKE FORENSISKE
IMAGES der blev erhvervet, HVORNÅR de blev erhvervet, af HVILKEN
MYNDIGHED, under HVILKEN RANSAGNINGSKENDELSE og gennem HVILKEN
METODOLOGI. Den kan ikke besvare noget andet spørgsmål om sagen.
Følgende ligger **uden for forseglingens domæne**:

1. **Antagelighed under Federal Rules of Evidence (eller enhver anden
   bevisbestemmelse).** Forseglingen forankrer bytes og tidsstempler.
   Om bevismateriale er antageligt — under FRE 901-autentificering,
   FRE 702 ekspertvidneudsagn / Daubert, FRE 403
   skævhedsafvejning eller ethvert tilsvarende på delstatsniveau —
   er et juridisk-proceduremæssigt spørgsmål. En perfekt forseglet
   indsamling kan stadig blive kendt uantagelig; en uforseglet
   indsamling kan stadig blive antaget. Forseglingen er additiv
   evidens for integritet, ikke en erstatning for rettens afgørelse
   om antagelighed.

2. **Om beslaglæggelsen var lovlig.** Overholdelse af Fourth
   Amendment, kendelsens gyldighed, overholdelse af omfanget,
   anvendelighed af exclusionary-rule — alt dette ligger opstrøms
   for forseglingen. Forseglingen registrerer, at indsamlingen fandt
   sted under kendelse FICT-SW-2026-0188; om kendelsen blev lovligt
   udstedt og lovligt forkyndt, er op til retten.

3. **Om bevismaterialet er belastende, undskyldende eller neutralt.**
   Forseglingen forankrer hashes; fortolkninger af, hvad disse hashes
   indeholder, hører hjemme i den forensiske undersøgelsesrapport,
   som er sit eget dokument med sit eget discovery- og bevisregime.
   Forseglingen vil nægte at forsegle "FACT N: den mistænktes laptop
   indeholdt belastende materiale" — se afslagsregel R4.

4. **Om beviskæden er procedureretligt korrekt i henhold til den
   gældende delstats bevisret.** Forseglingen registrerer
   myndighedens samtidige opbevaringshændelseslog (FACT 05). Om den
   log opfylder en bestemt delstats krav til beviskæden, er op til
   retten ved bevisbehandlingen.

5. **Om den forensiske metodologi var pålidelig.** Daubert og dens
   efterkommere (og delstatsanaloger som Frye, hvor den stadig
   gælder) vurderer metodologisk pålidelighed. Forseglingen
   registrerer, HVILKE værktøjer og versioner der blev brugt
   (FACT 04); om disse værktøjer opfylder en bestemt rets
   pålidelighedsstandard, er op til retten. Værktøjsfejl er
   blevet dokumenteret post-indsamling i tidligere sager;
   forseglingens rolle er at gøre version-og-binær-hash-registret
   offentligt afviseligt, ikke at indestå for selve værktøjerne.

6. **Om bevismaterialet blev manipuleret FØR indsamlingen.**
   Forseglingen forankrer bytes fra billedoptagelsens øjeblik og
   fremad. Hvis en mistænkt, en betjent eller en tredjepart ændrede
   kildeenheden, før den blev billedoptaget, kan forseglingen ikke
   detektere det — den forsegler de ændrede bytes med samme
   integritet, som den ville forsegle originalerne. Forseglingens
   værdi begynder ved billedoptagelsens tidsstempel.

7. **Om kendelsens omfang blev respekteret.** Kendelsens tillæg
   definerer, hvad der må erhverves; forseglingen registrerer, hvad
   der BLEV erhvervet. Om indsamlingen overskred kendelsens omfang
   er igen et juridisk spørgsmål med sit eget retsmiddel
   (suppression motion under den passende delstats procedure).

8. **Re-identifikation af enhver privat part i efterforskningen.**
   Forseglingen nægter at offentliggøre ethvert navn, identifikator
   eller fingeraftryk, der kunne re-identificere en mistænkt,
   tiltalt, offer, vidne eller beboer på stedet. Sagsnummerreferencen
   er det passende håndtag for parter med søgsmålsret til at lokalisere
   sagen.

**Sektionen ovenfor med ærlige grænser er den bærende del af dette
kit.** Forensiske teams, der tror, at forsegling betyder antagelighed,
vil bruge det som et skjold. Kittet må sige tydeligt: *dette er et
ikke-afvisbarhedsprimitiv for indsamlingsøjeblikket, ikke et bevis
på lovlig indsamling, metodologisk soliditet eller retsanerkendt
beviskæde.*

---

## Hvad dette kit MÅ NÆGTE at forsegle

Kittet er konfigureret til at afvise følgende faktamønstre, selv om
en bruger med gyldig myndighedssigneringsautoritet indsender dem:

- **Personlig identifikation af mistænkte, tiltalte, ofre, vidner
  eller enhver privat tredjepart.** Sagsnummerreferencen er
  håndtaget for parter med søgsmålsret; den offentlige forsegling
  må ikke være et re-identifikationsindeks.
- **Personnavne på forensiske undersøgere eller andet
  myndighedspersonale i den offentlige forsegling.** Roller er
  offentlige; person-til-rolle-bindinger forsegles separat og
  kan findes under retskendelse.
- **Hashes (eller fingeraftryk) på filniveau af mistænkt seksuelt
  misbrugsmateriale med børn, biometriske skabeloner eller
  enhver data, der re-identificerer sårbare personer — selv ved
  hash.** En SHA-256 af en individuel fil er en permanent
  søgbar identifikator; offentliggørelse heraf på en offentlig
  ledger kan re-victimisere subjekter via korrelation med private
  databaser. Image-niveau (forensisk-image-niveau) hashes af hele
  diske er acceptable; filniveau-hashes af sådant materiale er
  ALDRIG acceptable.
- **Undersøgelsesfund, fortolkninger, meninger eller konklusioner
  om, hvad bytes betyder.** Forseglingen forankrer HVILKE BYTES der
  blev erhvervet og HVORNÅR. Fortolkningen hører hjemme i den
  discovery-pligtige undersøgelsesrapport, ikke på en
  manipulations-synlig offentlig ledger.
- **Påstande om antagelighed eller anden juridisk konklusion**
  ("dette bevismateriale er antageligt," "kendelsen var lovlig,"
  "beviskæden var korrekt under §X.Y"). Juridiske konklusioner er
  rettens funktioner.
- **Forsegling af nogen anden end den indsamlende myndigheds
  autoriserede principal.** En forsvarsekspert kan bruge kittet
  til at forsegle deres egen uafhængige verifikation af manifestet;
  de må ikke forsegle den OPRINDELIGE indsamling under den
  indsamlende myndigheds navn.
- **Rolle-til-individuelle-bindinger inde i den offentlige
  forsegling.** Bindinger forsegles i en separat ledsagende
  registrering (hashet i FACT 05) under myndighedens
  adgangskontrol.
- **Efterforskningsfakta fra før beslaglæggelse eller kendelse.**
  Informanterklæringer, før-kendelsesovervågning, parallel-
  konstruktionsinput — intet af dette hører hjemme på
  indsamlingsforseglingen. Forseglingen er afgrænset til
  indsamlingsbegivenheden.

Et afslag kan selv forsegles som en kendsgerning ("Denne myndighed
anmodede om forsegling af X; kittet nægtede ifølge afslagsregel
Y"), hvilket skaber en offentlig registrering af forsøgt misbrug.

---

## Hvad dette kit FORSEGLER

8 fakta på indsamlingstidspunktet:

1. **Eksempelmeddelelse** — erklærer offentliggørelsen et eksempel
   (reelle attestationer fjerner eller erstatter dette).
2. **Indsamlingskontekst** — sagsidentifikator, kendelsescitering,
   indsamlende myndighed, anmodende myndighed, dato/tidspunkt for
   beslaglæggelse og indsamling, indsamlingens lokation
   (beslaglæggelsens lokation redigeres til en separat-forseglet
   ledsagende registrering for at undgå re-identifikation af
   stedet).
3. **Bevismanifest** — per forensisk-image-element: SHA-256-hash,
   filstørrelse, anonymiseret identifikator for kildeenhed,
   indsamlingsmetode, forensisk image-format.
4. **Indsamlingsmetodologi** — forensiske værktøjsnavne og
   nøjagtige versioner (med værktøjs-binær-hashes), write-blocker
   mærke/model og firmware, NIST CFTT-verifikationsreference, anvendt
   verifikationsprocedure, image-formatvalg.
5. **Beviskæde-log** — per-hændelses-tidslinje fra indledende
   beslaglæggelse til afslutning af billedoptagelse, opbevarere
   identificeret efter ROLLE (ikke efter navn), med hashes af
   separat-forseglede ledsagende registreringer (rolle-til-individuelle-
   binding, transport-GPS-log, beviskælder-adgangslog,
   manipulationsforseglingsfotografier osv.).
6. **Undersøgerkvalifikationer efter rolle** — opnåede
   certificeringer, status for efteruddannelse, antal tidligere
   ekspertvidneerfaringer, Daubert-eksponering,
   interessekonflikt-oplysninger — alle på rolleniveau, ikke
   personlige.
7. **Ledsagende oplysninger og afslagsregistrering** —
   parallelle efterforskninger, verserende kendelseskampe,
   suppressed-evidence-bevægelser, gældende
   privilege-filter / taint-team-protokol, tidligere
   indsamlingsforsøg, gennemgang af leverandørens bugtracker;
   eksplicit liste over mønstre, kittet nægtede at forsegle.
8. **Underskrivende principal** — identifikation af den indsamlende
   myndighed + rolleniveau-underskriver (ledende undersøger) +
   rolleniveau-medunderskriver (enhedsleder) + kryptografisk
   nøgleinformation.

Hver kendsgerning slutter med afslagsportens konvention: *"Denne
kendsgerning hævder kun X. Den hævder ikke Y"* (hvor Y er den
nærmeste fejlmodus fra sektionen "GØR IKKE" ovenfor).

---

## Hvad dette kit forsvarer imod

- **Stille post-indsamlingsændring af et forensisk image.** Enhver
  byteniveau-ændring af ethvert image producerer en anden SHA-256,
  og det post-ændrede image vil ikke verificere mod det forseglede
  FACT 03-manifest.
- **Påstand om at "andre værktøjer blev brugt."** FACT 04
  registrerer nøjagtige værktøjsversioner med værktøjs-binær-hashes;
  senere "vi brugte faktisk v4.7.0, ikke v4.7.1"-påstande er
  offentligt afviselige.
- **Påstand om at write-blockeren ikke var aktiveret eller brugte en
  anden model.** FACT 04 fryser write-blocker-manifestet.
- **Beviskæde-log-ændring.** Enhver ændring af FACT 05's
  beviskæde-hændelsestidslinje (tilføjelse, fjernelse eller
  re-tidsstempling af en hændelse) ændrer FACT 05-hashen og er
  offentligt opdagelig.
- **Substitution af en anden undersøgers legitimationsoplysninger.**
  FACT 06 fryser rolleniveau-legitimationsprofilen på
  indsamlingstidspunktet.
- **Selektiv udeladelse af ledsagende oplysninger.** FACT 07
  opregner de forventede oplysningskategorier; en tom kategori skal
  eksplicit attesteres ("ingen på indsamlingstidspunktet"), så en
  senere "vi indså ikke, at det var relevant" er offentligt
  afviselig.
- **Post-indsamlingspåstande om, at undersøgeren havde en konflikt,
  der ikke blev oplyst.** FACT 06's konfliktoplysning fryses ved
  indsamling; senere udfordringer kan testes mod den.

Kittet forsvarer **ikke** imod samtidig korruption — et team, der
bevidst forsegler falsk metadata på indsamlingstidspunktet,
producerer en kryptografisk gyldig forsegling af falsk metadata.
Primitivet er ærligt om dette: det er et ikke-afvisbarhedsprimitiv
for myndighedens samtidige påstande, ikke et bevis på, at disse
påstande er korrekte.

---

## Historiske eller næsten-historiske sager, kittet ville have hjulpet med

Kittet ville have produceret et nyttigt anker — *ikke en
løsning* — i tidligere sager, hvor digital-bevis-beviskæden blev
et omstridt bevismæssigt spørgsmål. For at undgå navngivning af
tiltalte (der er private parter, selv når de er dømt) beskrives
disse efter sagstype, ikke efter navngivet person:

- **Den føderale forensisk-værktøjs-fejl-kontrovers fra midten af
  2010'erne**, hvor et bredt anvendt forensisk billedoptagelses-
  værktøj post-indsamling blev opdaget at have en kantfejl, der
  påvirkede en bestemt type kildemedie. Et forseglet
  indsamlingsmanifest med frosne værktøjsversions- og
  binær-hash-data ville have ladet forsvar og anklager blive enige
  om præcis, hvilken version der blev brugt, og dermed elimineret
  én tvisteakse.

- **Flere delstatssager om omtvistede mobilenheds-
  ekstraktionsoutputs**, hvor ekstraktionsværktøjets leverandør
  senere udgav en fejlrettelse, og spørgsmålet blev "påvirkede
  fejlen denne sag." En forseglet metodologi-kendsgerning lader
  spørgsmålet besvares mod frosne versionsdata frem for mod
  myndighedens nuværende erindring om, hvilken version der blev
  brugt.

- **Body-worn-camera overdragelsesdispute** i sager, hvor
  BWC-leverandørens dockingsystem senere blev påstået at have
  tilladt ændring af optagelser under transit. Et forseglet
  manifest af bodycam-arkivet på det tidspunkt, hvor myndigheden
  modtog det, forankrer hvilke bytes myndigheden modtog fra
  dockingsystemet; senere redigeringer på myndighedens side er
  offentligt opdagelige.

- **Hash-kollisionskontroverser i computer-forensiske sager**,
  hvor en forsvarsekspert argumenterede for, at MD5 (stadig
  anvendt i nogle ældre workflows) var utilstrækkelig. En
  forseglet indsamling, der registrerer BÅDE MD5 OG SHA-256, lader
  SHA-256 stå, selv hvis MD5 udfordres.

- **Tvister om udvikling af undersøgelsesmetodologi mellem
  indsamling og retssag.** Når en sag står mellem indsamling og
  retssag i årevis, kan metodologien, der var standard ved
  indsamling, være afløst ved retssagstidspunktet. Den forseglede
  registrering lader retten vurdere metodologien mod den standard,
  der var gældende på indsamlingstidspunktet, ikke mod den senere
  standard.

Kittet ville IKKE have løst de underliggende tvister om skyld eller
uskyld i nogen af disse sagstyper. Det ville have løst én specifik
bevismæssig deltvist: om bytes, værktøjer og procedurer var, hvad
myndigheden hævder, de var, på det tidspunkt, myndigheden hævder.

---

## Hvornår dette kit skal bruges

- Din myndighed har en stabil forensisk SOP og ønsker at tilføje
  en Bitcoin-forankret offentlig attestation som et
  manipulations-synligt lag oven på den eksisterende papir- og
  signatur-beviskæde.
- Du forventer, at denne sag vil involvere betydelig
  forsvarsudfordring af forensisk bevis (sag med høj indsats, nye
  metodologier, omtvistede værktøjsversioner osv.).
- Du kan publicere det opregnede faktasæt uden at eksponere PII
  eller data, der re-identificerer sårbare personer. (Kittets
  afslagsregler håndhæver dette; hvis dine fakta ville kræve et
  brud på en afslagsregel, brug ikke kittet.)
- Den indsamlende myndigheds generelle juridiske rådgiver og
  anklagerens kontor har gennemgået publiceringsplanen. Offentlig
  publicering af en artefakt, der bærer en sagsidentifikator, har
  implikationer for igangværende efterforskninger; juridisk
  gennemgang er ikke valgfri.
- Din jurisdiktions regler for forsvarsdiscovery er kompatible med,
  at myndigheden separat opbevarer rolle-til-individ-binding-
  registreringen (hashet i FACT 05). Hvis din jurisdiktion kræver
  offentlig oplysning af undersøgernavne, skal du ændre kittet
  i overensstemmelse hermed.

## Hvornår dette kit IKKE skal bruges

- **Brug ikke som erstatning for myndighedens eksisterende
  beviskæde-dokumentation.** Dette kit er *additivt*, ikke
  erstattende. Myndighedens CMS, opbevaringslog og
  discovery-produktionsforpligtelser er uændrede.
- **Brug ikke hvis indsamlingen involverer CSAM, biometriske
  skabeloner eller anden data, der re-identificerer sårbare
  personer på filniveau.** Image-niveau-hashes af hele diske er
  acceptable; filniveau-hashes af sådant materiale er ALDRIG
  acceptable, ikke engang under afslagsregel-undtagelse. Hvis du
  ikke kan konstruere et faktasæt uden at bryde R3, brug ikke
  kittet.
- **Brug ikke til at hævde, at kendelsen var lovlig, beslaglæggelsen
  var korrekt eller beviset er antageligt** — kittet kan ikke gøre
  det, og afslagsregel R5 vil afvise enhver sådan påstand.
- **Brug ikke under pres for at forsegle, før indsamlingen er
  færdig.** En delvis-indsamlings-forsegling fejlrepræsenterer
  tilstanden.
- **Brug ikke til at publicere undersøgeres personnavne**, medmindre
  din jurisdiktion specifikt kræver det, og dine undersøgere
  individuelt har givet samtykke. Standarden er publicering på
  rolleniveau.
- **Brug ikke i forseglede eller under-segl-sager** uden eksplicit
  rettens tilladelse. Publicering af en sagsidentifikator på
  Bitcoin er irreversibel; hvis sagen senere forsegles, kan den
  offentlige forsegling ikke trækkes tilbage. Kittet er kun til
  indsamlinger af offentligt registrerede sager.
- **Brug ikke som legitimitetsteater.** En forsegling af en
  fejlbehæftet indsamling er en permanent offentlig registrering
  af fejlene, ikke et forsvar imod dem. Primitivet skærer begge
  veje; det er dets ærlighed.

## Hvordan du forker dette kit til en reel indsamling

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Kritisk tidspunkt:** forsegl VED eller lige efter afslutningen af
billedoptagelsen (FACT 05-hændelse E17 i eksempel-tidslinjen). En
forsegling under billedoptagelse skaber en delvis-indsamlings-
registrering; en forsegling meget senere skaber et hul, hvor
myndigheden kunne have ændret images. Det rigtige vindue er
umiddelbart efter, at image-verifikation er afsluttet for den sidste
genstand i udstillingssættet.

**Kritisk gennemgang:** før forsegling, kør publikationen gennem en
anden forensisk undersøger (ikke den ledende) og gennem
myndighedsrådgivning. Når den er forseglet, er publikationen
permanent.

## Integration med eksisterende beviskæde-infrastruktur

- **Myndighedens Case Management System (CMS).** CMS forbliver
  myndighedens primære registreringssystem. Forseglingen erstatter
  ikke CMS; den binder sig til de bytes og metodologi, CMS
  registrerer, så post-hoc CMS-redigeringer er offentligt
  opdagelige.
- **Federal Rules of Evidence / Daubert / delstatsbeviskoder.**
  Forseglingen bidrager til FRE 901-autentificeringsregistret ved
  at give manipulations-synlig integritet. Den opfylder IKKE FRE 702
  / Daubert i sig selv; metodologisk pålidelighed testes stadig ved
  bevisbehandlingen.
- **Forsvarsdiscovery (FRCP 16, Brady, Giglio og
  delstatsækvivalenter).** De ledsagende registreringer, der er
  hashet i FACT 05 (rolle-til-individuelle-binding, opbevaringslog,
  manipulationsforseglingsfotografier osv.), forbliver underlagt
  normal discovery. Forseglingen forankrer, hvad disse registreringer
  hævdede på indsamlingstidspunktet, så en senere "registret var
  anderledes på det tidspunkt"-påstand er offentligt afviselig.
- **NIST Computer Forensics Tool Testing (CFTT).** Kittet refererer
  til CFTT-verifikationslogs i FACT 04 / FACT 05; referencen er en
  hash, ikke selve loggen, så CFTT-processer er upåvirkede.
- **Retsudpegede neutrale og forsvarseksperter.** Begge kan
  re-hashe de forensiske images, de modtager i discovery, mod
  FACT 03-manifestet, uafhængigt af enhver myndighedssamarbejde.
  Dette er kittets primære værditilføjelse for forsvarssiden.
- **Appellationsgennemgang.** År senere kan en appellations-
  forensisk reviewer verificere den oprindelige
  indsamlingsmetodologi mod den forseglede FACT 04-registrering,
  i stedet for mod myndighedens muligvis-udviklede nuværende
  erindring.

## Hvad dette kit IKKE erstatter

- Federal Rules of Evidence (eller nogen delstatsbeviskode).
- Daubert / Frye-pålidelighedsstandarder for ekspertvidneudsagn.
- Myndighedens forensiske SOP og CMS.
- Forsvarsdiscovery-forpligtelser under FRCP 16 / Brady / Giglio /
  delstatsækvivalenter.
- Retskendelser, suppression motions, bevisbehandlinger eller
  enhver anden retsadministreret proces.
- NIST CFTT eller ethvert andet værktøjs-testregime.
- Myndighedens privilege-filter / taint-team-protokol.

## Hvorfor dette kit eksisterer i v0.4.0+

Dette er det 8. udarbejdede eksempel, der leveres med myriam-kit.
Det følger den constraint-first-struktur, der er valideret af den
autoresearch, der er dokumenteret i
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — constraint-first-prompt-
varianten scorede højest på en vægtet rubrik på tværs af flere
eksempeldomæner. Åbningssektionerne er de bærende dele af kittet;
manifestindholdet er den nemme del.

Kittets design er bevidst konservativt med hensyn til publicering af
undersøgernavne og aggressivt med hensyn til "dette etablerer ikke
antagelighed"-disclaimeren. Det forensiske miljø har en dokumenteret
historie med at blive angrebet for sit forensiske arbejde; kittet
falder som standard tilbage på den sikrere position for undersøgere.
Myndigheder i jurisdiktioner, hvor offentlig personlig navngivning
er påkrævet, kan ændre deres fork i overensstemmelse hermed, men
standardafslaget favoriserer undersøgersikkerhed.

## Licens

Almen ejendom (CC0). Fork det. Ingen attribution påkrævet.
