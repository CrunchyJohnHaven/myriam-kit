*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Forseglingssett for attestering av forsyningskjede-revisjoner

Et nøkkelferdig myriam-kit-eksempel for tredjeparts sosial-, arbeids- og
miljørevisorer, interne leverandørcompliance-team, NGO-etterforskere av
forsyningskjeder og arbeidsrettsorganisasjoner som ønsker å publisere
en Bitcoin-forankret, tukling-tydelig forsegling av en revisjonsrapport
i nøyaktig det øyeblikket den signeres.

---

## Hva dette settet IKKE gjør (les først)

Forseglingen er et kryptografisk tidsstempel av det revisoren signerte av
på. Den kan ikke verifisere om det som ble signert av er **sant**.
Følgende feilmoduser ligger **utenfor forseglingens domene**:

1. **Revisjons-kapring av industrien.** Merkevarekommisjonerte
   revisjoner har en lang, dokumentert historie med å produsere milde
   funn for leverandører hvis fortsatte forretningsforhold med den
   kommisjonerende merkevaren holder revisjonsrørledningen i gang. En
   kapret revisjon, når den forsegles, produserer en permanent rettsmedisinsk
   nedtegnelse av den kaprede revisjonen. Forseglingen korrigerer ikke
   kapring — den gjør bare revisjonen-som-utstedt uforanderlig, slik at
   en senere sannhetsfinnings-prosess har noe konkret å sammenligne
   med.

2. **Coachede arbeidere / forberedte fasiliteter.** Annonserte eller
   halv-annonserte revisjoner gir ledelsen dager eller uker til å øve
   inn arbeidersvar, skjule mindreårige arbeidere, rydde sovesaler,
   fjerne ikke-konformt utstyr og omdirigere arbeid til ikke-reviderte
   underleverandører i løpet av revisjonsvinduet. Forseglingen forankrer
   det revisorene ble vist, ikke det de ble hindret i å se.

3. **Skjult underentreprise.** Tier-2- og Tier-3-underentreprise,
   hjemmearbeid og uformell-sektor-produksjon er gjennomgripende
   usynlige for fabrikkgulv-revisjoner. Forseglingen forankrer en
   Tier-1-revisjon; den kan ikke oppdage at Tier-1 outsourcer til en
   urevisjonert Tier-2 i revisjonsvinduet eller rutinemessig.

4. **Revisjoner som systematisk overser de overgrepene de er rettet mot.**
   Rana Plaza, sammenbruddet av tekstilfabrikkbygningen i Bangladesh i
   2013 som drepte 1 134 arbeidere, hadde blitt revidert av flere
   merkevarekommisjonerte revisjonsprogrammer i månedene før.
   Sprekkene i bygningen var ikke på sjekklisten for sosial revisjon;
   revisjonsregimet hadde ingen omfang for bygningsteknisk vurdering.
   Revisjoner forankrer det som er *innenfor omfang*; overgrep utenfor
   omfanget forblir usynlige uansett hvor tukling-tydelig forseglingen
   er.

5. **Hevn etter signering mot arbeidere som deltok i intervjuer.** Selv
   med avvist plasseringsinformasjon (FACT 07 R3) kan en målbevisst
   motstander som kjenner leverandør-ID-en identifisere fasiliteten.
   Arbeiderbeskyttelse krever mer enn bare å avvise PII i forseglingen —
   det krever anonymisering oppstrøms for revisjonsmetodologien.
   Forseglingen gjør revisjonen-som-utstedt varig; den beskytter ikke
   intervjudeltakere retroaktivt.

6. **Arbeidervilkår som er lovlige, men umenneskelige.** Levelønns-gap
   i jurisdiksjoner hvor lovbestemt minimumslønn ligger under
   levelønnsbenchmarken produserer "compliant" revisjonsfunn mot
   lønns- og arbeidstidslover og "ikke-compliant" funn mot
   levelønnsstandarder i samme revisjon (FACT 03 element 8 i dette
   eksempel-settet). Forseglingen forankrer det hver standard
   rapporterer; å forene dem er nedstrøms policyarbeid.

7. **Klima- / miljøskade med diffus kausalitet.** Karbonutslipp,
   skogforringelses-bidrag, vannknapphet og forurensningsutslipp fra
   leverandører kan forsegles i revisjonsfunn, men kausal tilskrivning
   til en bestemt merkevares ordrevolum er metodologisk omstridt.
   Forseglingen forankrer det som ble målt hos leverandøren; den
   tildeler ikke moralsk eller juridisk ansvar.

8. **Stridigheter om hvilken standard som er autoritativ.** SA8000 vs.
   BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. selskaps-
   spesifikk atferdskodeks: hver har forskjellige omfang, alvorlighetsgrader
   og avhjelpings-prosesser. Forseglingen forankrer *én* revisjon under
   *én* standard. Sammenligning på tvers av standarder er et nedstrøms
   problem.

9. **Revisors kompetanse vs. revisors legitimasjon.** "Legitimert" er
   ikke "kompetent." Revisorer som har fullført akkrediterte
   treningsprogrammer har oversett alvorlige overgrep i revisjoner som
   gikk forut for offentlig synlige katastrofer. Forseglingen forankrer
   legitimasjoner; den sertifiserer ikke kompetansen som de ble utøvd
   med.

**Avsnittet over om ærlige begrensninger er den bærende delen av dette settet.**
En merkevare som ønsker legitimitetsteater vil bruke en forseglet
revisjon som et skjold. Settet må si tydelig: dette er en
*ikke-avvisnings-primitiv for revisjonsrapport-signeringsøyeblikket*,
ikke et bevis på leverandør-compliance eller arbeidervelferd.

---

## Hva dette settet MÅ AVVISE å forsegle

Settet er konfigurert til å avvise følgende fakta-mønstre selv hvis en
bruker med gyldig revisjonsorgan-autoritet sender dem inn:

- **Individuell arbeideridentifikasjon.** Ingen kjensgjerning kan navngi
  en arbeider, koble et sitat til en arbeider, eksponere
  arbeidernummer, linjeposisjon, sovesalsrom, skiftplan,
  demografisk kombinasjon med N<5, eller noe felt som kan
  reidentifisere en person som deltok i intervjuer. Arbeidersitater
  bruker randomiserte tokens; tilordningen forsegles aldri.
- **Varslere / informant-kilder.** Hvis et funn hviler på avsløring fra
  en person som tok risiko for å avsløre, navngis eller identifiseres
  personen aldri i den forseglede publikasjonen.
- **Presis plasseringsinformasjon.** Ingen gateadresse, GPS,
  satellittbilde >1km oppløsning eller eksternt bygningsfotografi.
  Land og region er den maksimale oppløsningen som forsegles. Begrunnelse:
  fasilitetsidentifikasjon muliggjør hevn mot intervjudeltakere.
- **Påstand om ren revisjonssertifisering.** Settet avviser å forsegle
  enhver innramming av formen "denne revisjonen beviser at
  leverandøren er compliant" eller "ingen brudd eksisterer".
  Renhets-påstander er epistemologisk uten støtte i
  revisjonsmetodologi.
- **Forseglings-som-sertifikat-substitusjon.** En publikasjon som
  utelater metodologi (FACT 04), uavhengighet (FACT 06) eller
  avvisninger (FACT 07) er ikke en legitim MYRIAM-publikasjon under
  dette settet.
- **Utkast- / pre-signerings-revisjoner.** Forsegling skjer ved
  signering, ikke før. Provisoriske revisjoner skaper falsk
  sikkerhet.
- **Post-hoc gunstig re-forsegling.** En revidert revisjon krever en
  NY forseglet publikasjon som refererer til originalen via Merkle-rot.
  Den opprinnelige forseglede revisjonen forblir permanent synlig som
  revisjonen-som-utstedt.
- **Forsegling foretatt av noen annen part enn revisjonsorganet.** En
  merkevare, leverandør, sertifiseringsorgan eller tredjepart kan ikke
  forsegle "revisjonen" på vegne av revisjonsorganet som signerte
  rapporten.

En avvisning kan i seg selv forsegles som en kjensgjerning ("Denne parten
ba om forsegling av X; settet avviste i henhold til avvisningsregel Y"),
noe som skaper en offentlig nedtegnelse av forsøkt misbruk. **I en
bransje med utbredt revisjons-kapring kan avvisningen-å-forsegle i seg
selv være et meningsfullt signal:** et revisjonsorgan som ikke vil
forsegle fordi en merkevare presset på for å myke opp funn, har
muligheten til å offentlig dokumentere avvisningen under sin egen
prinsipal.

---

## Hva dette settet FAKTISK forsegler

8 kjensgjerninger i øyeblikket for revisjonssignering:

1. **Eksempelnotis** — erklærer publikasjonen som et eksempel (reelle
   attestasjoner fjerner eller erstatter denne).
2. **Revisjonsomfang og -emne** — revisjonsstandard, revisjonsorgan,
   leder-revisor, revisjonsteamets størrelse, leverandøridentifikator
   (ingen presis plasseringsinformasjon), revisjonsvindu,
   varslingstype (annonsert / halv-annonsert / uannonsert),
   revisjonsrapport-dato, signerings-versjon, navngitte mottaker-
   merkevarer, kommisjonerende part.
3. **Revisjonsfunn-manifest** — per-element konformans / minor-NC /
   major-NC / kritisk-NC mot standarden, hver med en SHA-256 av den
   fullstendige funn-skrivingen. Aggregert total. Sertifiserings-
   anbefaling ved signering.
4. **Metodologi og bevis** — on-site tidsallokering, intervjutellinger
   (med stratifisering: kjønn, migrant-status, tjenestetid),
   intervjuformat-fordeling, tolk-relasjon, dokumentgjennomgang med
   utvalgsstørrelser og innholds-hasher, on-site-besøkets artefakter
   (med arbeideransikter sløret), kjente metodologi-begrensninger.
5. **Korrigerende tiltak forpliktet** — per major-NC og per minor-NC
   CAP med oppgitt rotårsak, frist, verifikasjonsmekanisme,
   eskaleringsforpliktelser, ingen-stille-oppmykning-forpliktelse.
6. **Revisor-kvalifikasjoner og uavhengighet** — revisjonsorgans
   akkreditering, kundekonsentrasjon, leder-revisors legitimasjoner og
   språkkompetanse, sektorerfaring, uavhengighetserklæringer
   (revisor-leverandør, revisor-merkevare, sertifiseringsorgan-
   separasjon).
7. **Ledsagende offentliggjøringer og avvisningsregister** —
   interessekonflikter (eksplisitt), tidligere revisjonshistorikk,
   arbeiderstemme-kanaler kommunisert, parallelle etterforskninger,
   revisjonsorganets interne dissens, avvisningsregler-liste,
   avvisninger som faktisk ble påberopt under denne revisjonen.
8. **Signerende prinsipal** — revisjonsorgan, leder-revisor,
   revisjonsteam, autoriserende tjenestemann, kryptografisk
   nøkkelinformasjon.

Hver kjensgjerning ender med avvisningsporten-konvensjonen: *"Denne
kjensgjerningen hevder kun X. Den hevder ikke Y"* (der Y er den nærmeste
feilmodusen fra "GJØR IKKE"-avsnittet).

---

## Hva dette settet forsvarer imot

- **Stille oppmykning av store ikke-konformanser etter signering.**
  Enhver endring av FACT 03 (f.eks. en MAJOR_NC omklassifisert til
  MINOR_NC eller et funn slettet helt) produserer en annen SHA-256,
  en annen Merkle-rot, feiler OTS-verifikasjon.
- **Tilbakedatering av lukkinger av korrigerende tiltak.** FACT 05
  fryser CAP og dens frister ved signering; enhver "vi lukket den
  NC-en forrige måned"-påstand som strider mot de forseglede fristene
  er offentlig diff-bar.
- **Metodologi-revisjonisme.** FACT 04 fryser intervjutellinger,
  dokumentutvalg-størrelser og on-site-timer ved signering — noe som
  hindrer den senere "vi gjorde en grundig etterforskning"-forsvarsbruk
  fra å være uforfalskelig.
- **Selektiv republisering som utelater ugunstige funn.** Alle 8
  kjensgjerninger er bundet av en enkelt Merkle-rot; sitering av noen
  fakta mens andre utelates kan oppdages fra den publiserte
  blad-listen.
- **Drift i uavhengighetspåstand.** FACT 06 fryser
  uavhengighetserklæringene per signering. En senere "denne revisjonen
  var grundig uavhengig"-påstand må forholde seg til den forseglede
  kundekonsentrasjons-prosenten og den forseglede
  merkevare-betalte kommisjoneringsoffentliggjøringen.
- **Sletting av avvisnings-nedtegnelse.** FACT 07 fryser hvilke fakta-
  mønstre settet avviste; enhver senere "vi avviste aldri noe"-påstand
  motsier den forseglede nedtegnelsen.

---

## Historiske eller nesten-historiske tilfeller som settet ville ha hjulpet med

Settet ville ha produsert et nyttig **rettsmedisinsk anker** — *ikke en
løsning eller en forebygging* — i tilfeller som involverte:

- **Rana Plaza (Bangladesh, 2013).** Bygningssammenbruddet ved Rana
  Plaza drepte 1 134 tekstilarbeidere og skadet ~2 500. Flere merkevarer
  hvis produkter ble laget i bygningen, hadde revidert Tier-1-leverandører
  i bygningen kort tid før sammenbruddet. Revisjonene brukte
  sosial-revisjons-sjekklister som ikke inkluderte byggteknisk omfang.
  En forseglet metodologi-fakta (FACT 04) ved hver av disse revisjonene
  ville ha gjort *omfangsgapet* offentlig synlig ved signering — og
  forankret den dokumenterte begrensningen som revisjonsprogrammer
  retroaktivt hevdet å ikke ha hatt. Forseglingen ville ikke ha
  forhindret sammenbruddet. Den ville ha forhindret bransjens
  post-sammenbruds-påstand om at "ingen visste" fra å være
  erkjennelsesteoretisk holdbar.

- **Apple / Foxconn-revisjoner (2010-tallet).** Flere iterasjoner av
  revisjonsrapporter på Foxconn-fasiliteter som produserte for Apple
  ble publisert med varierende nivåer av funn-alvorlighet,
  arbeiderselvmord-klynge-kontekst og avhjelpings-påstander. En
  forseglet nedtegnelse av signerings-øyeblikket for hver revisjon
  ville ha forhindret senere stridigheter om "hva revisjonen sa på det
  tidspunktet" fra å være avhengig av arkivkopier, lekkede kopier eller
  reviderte offisielle utgivelser.

- **Kobolt fra DRC (pågående).** Artisan-kobolt-utvinning i Den
  demokratiske republikken Kongo, inkludert av barn, mater inn i
  batteri-forsyningskjeder for store elektronikk- og EV-merker. Flere
  merkevarekommisjonerte revisjoner over perioden 2017–nåtid har
  produsert funn av varierende alvorlighet. Settet anvendt på hver
  revisjon ved signering ville ha forankret revisjonen-som-utstedt;
  settet anvendt på ledsagende-offentliggjørings-fakta (FACT 07 C2:
  tidligere revisjonshistorikk) ville ha gjort hver påfølgende
  revisors metodologiske arv av tidligere gap offentlig synlig.

- **Konfliktmineraler (tinn, tantal, tungsten, gull fra DRC og
  Storsjø-regionen).** Dodd-Frank §1502 produserte revisjons-og-
  offentliggjørings-forpliktelser under SEC-regel 13p-1. Stridigheter
  om tilstrekkeligheten av smelte-nivå-revisjoner og nedstrøms
  forvaringskjedeverifikasjon gjentok seg over perioden 2014–2022.
  Per-revisjon MYRIAM-forseglinger ville ha forankret hver smelte-revisjon
  ved signering.

- **Merkevarekommisjonerte revisjoner av Xinjiang-bomull-forsyningskjeder
  (2018–nåtid).** Stridigheter om hvorvidt revisjoner kunne utføres
  pålitelig under PRC-myndighetenes restriksjoner på revisor-tilgang
  dukket opp bredt etter 2020. En forseglet metodologi-fakta (FACT 04)
  ved hver revisjon ville ha forankret hvilke tilgangsforhold som
  faktisk gjaldt — noe som gjorde "vi utførte en grundig revisjon"-
  påstander diff-bare mot forseglede metodologi-begrensninger på
  tidspunktet.

- **Foxconn-underentreprise og Apple-leverandøransvars-rapporter på
  2010-tallet — gjentatte oppdagelser av mindreårige arbeidere,
  skjulte sovesaler, timeovertredelser.** Per-revisjon-forseglinger
  ville ha forankret *negative funn* i revisjoner som ikke fant noe,
  ved siden av *positive funn* i revisjoner som fant overtredelser —
  noe som hindrer retrospektiv narrativ-cherry-picking fra begge
  retninger.

Settet ville IKKE ha forhindret noen av disse. I flere tilfeller var det
underliggende problemet at revisjonen *oversåg* overgrepet — å forsegle
en ren revisjon som burde ha funnet overtredelser produserer en permanent
nedtegnelse av en mislykket revisjon, som er en annen type nyttig (den
forankrer feilen for senere ansvarliggjøring), men ikke det samme som
forebygging.

---

## Når man bør bruke dette settet

- Du er et revisjonsorgan som adopterer en "publiser det vi signerte
  av på"-praksis som et forsvar mot oppmykningspress etter signering.
- Du er en NGO som driver en parallell forsyningskjede-etterforskning
  og ønsker et tukling-tydelig referansepunkt i øyeblikket din
  etterforskning avsluttes.
- Du er en arbeidsrettsorganisasjon som har skaffet en revisjonsrapport
  og ønsker å forankre dens nåværende innhold før revisjonsorganet
  eller merkevaren har sjansen til å revidere den.
- Du er en merkevare forpliktet til transparens om revisjoner du har
  kommisjonert, og du ønsker en verifiserbar rettsmedisinsk
  nedtegnelse.
- Du er en journalist, regulator eller domstol som forankrer en bestemt
  revisjons innhold på et bestemt tidspunkt for senere rettstvist eller
  rapportering.

## Når man IKKE bør bruke dette settet

- **Bruk det ikke som en erstatning for arbeiderledet overvåkning,
  uavhengige NGO-etterforskninger eller arbeiderorganisering.** Settet
  er *additivt*, ikke en erstatning for noen av disse.
- **Bruk det ikke til å hevde at en leverandør er compliant.** En
  ren forseglet revisjon er i beste fall én inngang til en
  compliance-vurdering. Å behandle en forseglet revisjon som et
  compliance-sertifikat er nettopp det legitimitetsteateret som
  begrensnings-først avvisningsreglene eksisterer for å forhindre.
- **Bruk det ikke midt under revisjon.** Forsegling før signering
  skaper en falsk-positiv "dette er den endelige revisjonsrapporten"-
  nedtegnelse.
- **Bruk det ikke til å forsegle et utkast du har til hensikt å
  revidere.** Hver signerings-versjon får sin egen forsegling;
  revisjoner refererer til originaler via Merkle-rot.
- **Bruk det ikke under press for å forsegle tidligere enn signering,
  eller for å utelate en ledsagende-fakta-offentliggjøring.** Avvis, og
  (hvis prinsipalen din tillater det) forsegle avvisningen.
- **Bruk det ikke som grunnlag for en "fair trade"- eller "etisk
  sourcing"-markedsføringspåstand uten å offentliggjøre den forseglede
  metodologiens begrensninger ved siden av forseglingen.** Å sitere
  forseglingen uten å sitere begrensningene er
  legitimitetsteater-feilmodusen som definerer revisjons-kapring.
- **Bruk det ikke hvis revisjonsorganet ditt er strukturelt kapret og
  ikke kan publisere funn mot den kommisjonerende merkevarens
  kommersielle interesse.** I så fall produserer forsegling en
  permanent offentlig nedtegnelse av den kaprede revisjonen. Det kan
  fortsatt være verdifullt — men det er ikke det samme som å forsvare
  seg mot kapring.

---

## Sådan forker du dette settet for en reell revisjon

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Kritisk timing:** forsegl VED signerings-øyeblikket — dvs. når
leder-revisoren signerer den endelige rapporten og den blir
revisjonsorganets offisielle posisjon. En forsegling før signering
skaper en falsk-positiv "dette er den endelige revisjonen"-nedtegnelse.
En forsegling lenge etter signering er rettsmedisinsk svakere mot
mellomliggende modifikasjoner.

---

## Integrasjon med eksisterende forsyningskjede-revisjons-infrastruktur

Settet er designet for å komponere med, ikke erstatte:

- **SA8000 (Social Accountability International).** SA8000-
  revisjonsrapporter og CAP-dokumenter avbildes naturlig på FACT 03 +
  FACT 05. SAAS-akkrediteringsreferansen passer FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** RBA's revisjonsfunn avbildes på FACT 03; RBA's
  revisjonsfirma-uavhengighetsregler avbildes på FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** SMETA's 2-pillar
  og 4-pillar revisjonsfunn avbildes på FACT 03; Sedex-plattformen
  hoster rårapporten — MYRIAM-forseglingen forankrer en innholds-hash
  av den plattform-hostede rapporten.
- **amfori BSCI.** BSCI A–E rating-mekanikk avbildes på FACT 03
  sertifiseringsanbefaling; merkevare-medlemskaps-kommisjonering
  avbildes på FACT 06 kundekonsentrasjons-offentliggjøring og FACT 07 C1.
- **FSC chain-of-custody.** For skogsprodukt-forsyningskjeder passer
  chain-of-custody-sertifikater og re-revisjonsplaner til
  revisjonsvindu- og CAP-strukturen.
- **B Lab / B Corp impact assessment.** B Corp's sertifisering er ikke
  en tredjeparts revisjon i SA8000-forstand, men
  impact-vurderingens verifikator-rapporter kan forsegles under dette
  settet (med fakta re-scoped til impact-vurdering snarere enn
  arbeids-revisjon).
- **ISO 26000.** ISO 26000 er veiledning, ikke sertifiserbar; settet
  har ingen direkte ISO 26000-revisjonsrapport-integrasjon, men
  sosial-ansvars-taksonomien kan informere FACT 03 element-struktur
  for interne revisjoner.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  andre bransje-sektor-regimer).** Sektor-spesifikke
  revisjonsprogrammer kan forsegles under dette settet; FACT 02
  revisjonsstandard-feltet identifiserer hvilken.
- **Fair Labor Association.** FLA-fabrikkovervåknings-rapporter
  avbildes på FACT 03 + FACT 05; FLA's uavhengig-monitor-rammeverk
  avbildes på FACT 06 uavhengighetserklæringer.
- **Higg Index (Sustainable Apparel Coalition).** Fasilitetsnivå Higg
  FEM (Facility Environmental Module) og Higg FSLM (Facility Social &
  Labor Module) output kan forsegles under dette settet.
- **EU CSRD / CSDDD.** EUs Corporate Sustainability Reporting
  Directive og Corporate Sustainability Due Diligence Directive
  skaper offentliggjøringsforpliktelser hvis verifikasjonsdokumenter
  kan forsegles under dette settet. Settet forankrer
  offentliggjøringen-som-utstedt, ikke dens substansielle
  tilstrekkelighet.

## Hva dette settet IKKE erstatter

- Arbeiderledet overvåkning (det mest pålitelige
  overgreps-deteksjons-signalet i enhver forsyningskjede)
- Uavhengige NGO-etterforskninger (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium, osv.)
- Regulatorisk inspeksjon (nasjonale arbeidsbyråer, OSHA-ekvivalenter,
  ILO-landkontor-programmer)
- Arbeiderorganisering og kollektiv forhandling
- Rettstvist, voldgift og avhjelping under nasjonal arbeidsrett
- Merkevare-side due-diligence-rammeverk (UNGP, OECD Due Diligence
  Guidance, EU CSDDD)

## Lisens

Public domain (CC0). Fork det. Ingen attribusjon kreves.
