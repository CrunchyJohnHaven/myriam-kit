*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Sett for attestasjon av mattrygghet

Et nøkkelferdig myriam-kit-eksempel for matprodusenter,
mattrygghetsinspektører, tredjepartssertifiserere og
reguleringsmyndigheter som ønsker å publisere en Bitcoin-forankret,
tukling-tydelig forsegling av *hva utgivelsestestene sa* og *hvilken
utgivelsesavgjørelse som ble tatt*, ved partiets utgivelsesøyeblikk
eller ved godkjenning av inspeksjonsrapport — slik at stille
modifikasjon etter utgivelse av testoppføringen,
utgivelsesavgjørelsen eller tilbakekallingsforpliktelsene blir
offentlig oppdagbar.

---

## Hva dette settet IKKE gjør (les først)

Forseglingen er et kryptografisk tidsstempel av HVILKE
utgivelsestester som ble utført på HVILKET parti, av HVILKE
akkrediterte laboratorier, under HVILKE metoder, med HVILKE
resultater, og hvilken UTGIVELSESAVGJØRELSE QA-myndigheten tok på
grunnlag av disse resultatene. Den kan ikke svare på noe spørsmål om
mattrygghet utover det. Følgende ligger **utenfor forseglingens
domene**:

1. **Å forhindre kontaminering.** Settet forankrer det testresultatene
   SA ved utgivelse. Kontaminering har mange årsaker — heterogen
   mikrobiell fordeling innenfor et parti, temperaturmisbruk etter
   utgivelse under distribusjon, håndteringsfeil i detaljhandelen,
   forberedelsesfeil hos forbrukeren, nye eller uscreenede farer
   (f.eks. melamin-forfalskning før melamin-screening ble rutine),
   forsyningskjedebedrageri oppstrøms for produsentens testomfang.
   Forseglingen forhindrer ingen av disse og hevder ikke å gjøre det.

2. **Å garantere at alle enheter i et parti som har bestått tester, er
   trygge.** Mikrobiologisk kontaminering i bulk-matprodukter er
   HETEROGEN. Listeria, Salmonella og STEC-patogener forekommer i
   lavprevalente lokaliserte hotspots, ikke uniformt fordelt. ICMSF-
   og Codex-prøveplaner har en dokumentert, begrenset sannsynlighet
   for å oppdage kontaminering tilstede ved lav prevalens —
   sannsynligheten er IKKE 1. Et parti som består utgivelsesprøving,
   kan likevel inneholde kontaminerte enheter som ikke ble prøvet.
   Forseglingen forankrer PRØVENE, ikke bulken. Denne begrensningen
   er eksplisitt gjentatt i FAKTUM 03 og er den enkeltvis viktigste
   ærlige grensen for dette settet.

3. **Å sertifisere at utgivelsestestene ble kjørt ærlig.**
   Forseglingen forankrer det testene rapporterte ved utgivelse. Et
   laboratorium som rapporterer en bedragersk BESTÅTT ved utgivelse,
   produserer en kryptografisk gyldig forsegling av en bedragersk
   BESTÅTT. Settet gjør senere stille modifikasjon oppdagbar, men
   detekterer ikke samtidig bedrageri. Deteksjon av samtidig
   bedrageri krever revisjon, lab-akkrediteringstilsyn
   (ISO 17025-overvåkning), kompetanseprogrammer og
   regulatorinspeksjon — alt oppstrøms for forseglingen.

4. **Å erstatte FSMA-, FSIS- eller EU-kompetent-myndighet-regulatoriske
   innleveringer.** Utgivelsesoppføringer under FSMA, FSIS,
   EU-forordning (EF) 178/2002 og Codex Alimentarius opprettholdes i
   henhold til lov og produseres på regulatorforespørsel. Forseglingen
   legger til et offentlig tukling-tydelig lag OPPÅ disse
   innleveringene; den ERSTATTER dem IKKE. En forseglet publisering
   er ikke en regulatorisk innlevering.

5. **Å løse tilbakekallings-omfangstvister.** Settet kan forsegle
   tilbakekallingsforpliktelsene gjort ved utgivelse (FAKTUM 06) og
   et påfølgende tilbakekallingsomfang som en ny publisering; men
   grensen for hvilke partier som er berørt, hvilke enheter som ble
   sendt, hvilke detaljister som mottok dem, og hvilke forbrukere som
   ble eksponert, er fortsatt en sporing-tilbake-og-fremover-undersøkelse.
   Forseglingen forankrer det produsenten FORPLIKTET seg til og det
   de senere GJORDE. Den løser ikke det underliggende
   epidemiologiske spørsmålet.

6. **Å oppdage tilsiktet forsyningskjedebedrageri oppstrøms for
   testing.** Melamin-forfalskningen av melk og morsmelkerstatning i
   Kina i 2008 lyktes fordi melamin ikke var i analyttpanelet —
   nitrogen-innhold-protein-ekvivalent-måling var det, og melamin
   spoofet det. En forseglet FAKTUM 03 med det analyttpanelet som
   var i bruk på det tidspunktet, ville ha forpliktet seg til det
   panelet offentlig — men ville ikke ha gjort noe for å oppdage
   forfalskningsmiddelet utenfor panelet. Forseglingens verdi i den
   saken ville ha vært forensisk forankring av "dette er det
   produsenten hevdet å teste for", IKKE forhindring. Et reelt
   mattrygghetsregime adresserer dette gjennom uvarslede
   regulatorprøver med bredspektret screening (f.eks. LC-MS
   utargeterte metoder), som er oppstrøms for produsentens
   forsegling.

7. **Å forankre distribusjon og forbrukerhåndtering etter utgivelse.**
   Når partiet forlater anlegget, er temperaturmisbruk under
   distribusjon, feilhåndtering i detaljhandelen,
   forbrukerlagringsfeil og forbruker-forberedelsesfeil alle utenfor
   omfanget. Forseglingen er avgrenset til produsentens
   utgivelseshendelse. Tukling-tydelighet nedstrøms krever separate
   sett hos distributøren, detaljisten og (for institusjonelle
   forbrukere som skoler og sykehus) på brukspunktnivåer.

8. **Å gå god for trygghet av mat i noen spesifikk befolkning.**
   FAKTUM 03 BESTÅTT-resultater innebærer ikke trygghet for gravide
   forbrukere, spedbarn, immunkompromitterte forbrukere eller eldre,
   for hvem Listeria monocytogenes og Salmonella utgjør dokumentert
   forhøyet risiko selv ved konsentrasjoner under konvensjonelle
   deteksjonsgrenser. Forseglingen kan ikke fremsette en
   befolkningsspesifikk trygghetspåstand og nekter å gjøre det
   (nektelsesregel R6).

**Den ærlige-grenser-seksjonen ovenfor er den bærende delen av dette
settet.** Produsenter som behandler "vi har forseglet
utgivelsesoppføringen vår" som ekvivalent med "vi har bevist at maten
vår er trygg", misbruker primitiven. Settet må si tydelig: *dette er
en ikke-tilbakekallelsesprimitiv for produsentens samtidige
påstander ved utgivelse, ikke et bevis på trygghet, ikke en erstatning
for regulatortilsyn, og ikke et forsvar mot heterogen-kontaminering,
forsyningskjede-bedrageri eller feil-håndtering-etter-utgivelse-
feilmoduser som har drept folk i tidligere utbrudd.*

---

## Hva dette settet MÅ NEKTE å forsegle

Settet er konfigurert til å avvise følgende faktamønstre selv om en
bruker med gyldig produsent-signeringsmyndighet sender dem inn:

- **Personlig identifikasjon av enhver arbeider, veileder, QA-ansatt,
  besøkende inspektør eller tredjepartsrevisor.** Navn, ansatte-ID,
  badge-numre, personnumre, hjemadresser, personlige telefonnumre —
  ingen av disse vises i den offentlige forseglingen. Roller er
  offentlige; person-til-rolle-bindinger forsegles separat og kan
  oppdages under regulatorprosess. Arbeidersikkerhet mot gjengjeldelse
  og trakassering er den bærende begrensningen;
  mattrygghetsattestasjon kan gjøres på rollenivå. (R1)

- **Presis anleggslokasjon.** Anleggsregionen (delstat eller
  fler-delstatsregion) er akseptabel; presis gateadresse,
  GPS-koordinater eller enhver identifikator av granularitet
  tilstrekkelig til å fysisk identifisere anlegget på et kart, er
  IKKE akseptabel. Regulatorens etablissementsnummer er regulatorens
  håndtak for anlegget; fysisk-sikkerhets- og
  arbeidersikkerhetshensyn taler mot å publisere en offentlig
  adresse på Bitcoin. (R2)

- **Individuelle skifts-personalmønstre i produksjon.** Skiftplaner,
  individuelle arbeiderrotasjoner, linjeoperatørenes personlige
  ID-er — ingen av disse vises i forseglingen. Mønstre i den
  individuelle arbeiderens liv må ikke kunne utledes fra den
  offentlige attestasjonen. (R3)

- **Leverandøridentiteter som kompromitterer kontrakter.**
  Leverandørnavn, leverandørenes anleggslokasjoner,
  leverandørens partikoder (unntatt i forsyningskjede-
  kontamineringssaken der det å navngi en leverandørs kontaminerte
  parti er nødvendig for folkehelsen, og håndteres gjennom en
  separat forseglet publisering) publiseres IKKE i utgivelses-
  forseglingen. Mange forsyningskontrakter inneholder
  konfidensialitetsbestemmelser; forseglingen bryter ikke disse som
  standard. (R4)

- **Kundelister og distribusjonsdestinasjoner utover overordnet
  nivå.** Overordnet regional oppsummering er akseptabel; spesifikke
  kundelister (detaljister, distribusjonssentre, foodservice-konti)
  er IKKE akseptable. Kundeidentitet er kontraktsmessig konfidensiell
  og konkurransesensitiv; regulatoren får kundelisten gjennom
  etablerte tilbakekallings-koordineringskanaler. (R5)

- **Trygghetspåstander eller juridiske konklusjoner.** Settet vil
  ikke forsegle "dette produktet er trygt", "dette partiet oppfyller
  alle gjeldende mattrygghetsstandarder", "dette er GRAS for denne
  bruken" eller noen annen trygghets- eller juridisk konklusjon.
  Settet forankrer testoppføringen og utgivelsesavgjørelsen, IKKE en
  trygghetskonklusjon. (R6)

- **Arbeider-klage- eller varslermønstre for re-identifikasjon.**
  Settet nekter å publisere ethvert mønster som kan re-identifisere
  en arbeider som har levert en OSHA-, USDA- eller intern bedrifts-
  klage om mattrygghet eller arbeidsplassikkerhetspraksis. Slike
  klagere er beskyttet under FSMA § 402 og parallelle vedtekter;
  forseglingen må ikke bli en re-identifikasjons-vektor.
  Varslerattestasjoner har sitt eget sett
  (`examples/whistleblower-manifest`) med nektelsesregler tilpasset
  det bruksområdet. (R7)

- **Forsegling av andre enn den utgivende produsentens autoriserte
  prinsipal.** En tredjepartssertifiserer, kunde-QA-team eller
  uavhengig revisor kan bruke samme sett til å forsegle SINE EGNE
  revisjonsfunn; de kan IKKE forsegle den opprinnelige
  utgivelsesavgjørelsen under produsentens navn. Den signerende
  prinsipalen i FAKTUM 08 er den eneste gyldige signerer for det.
  (R8)

En nektelse kan i seg selv forsegles som et faktum ("Denne
produsenten ba om forsegling av X; settet nektet i henhold til
nektelsesregel Y"), hvilket skaper en offentlig oppføring av forsøkt
misbruk.

---

## Hva dette settet FAKTISK forsegler

8 fakta i utgivelsesøyeblikket:

1. **Eksempelvarsel** — erklærer publiseringen som et eksempel
   (virkelige attestasjoner fjerner eller erstatter dette).
2. **Produkt- og partiidentifikasjon** — produktnavn, kategori,
   produsent, anleggsregion (IKKE presis lokasjon),
   HACCP-planversjon + hash, parti-ID, produksjons-/pakke-/best-før-
   datoer, antall forbrukerenheter, lagringskrav, de tre kritiske
   kontrollpunktene med loggførte oppførings-hasher (kokelethalitet,
   nedkjølings-stabilisering, post-lethalitets RTE-miljø).
3. **Resultater fra utgivelsestesting** — mikrobiologiske tester for
   ferdig produkt (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), kjemiske/restmid-tester (nitritt,
   veterinærrester, tungmetaller), allergen-krysskontakt-verifisering,
   miljøovervåkningssammendrag, hver med SHA-256 av den fulle
   rapport-PDF-en og den eksplisitte prøve-vs-bulk-tolkningsbegrensningen.
4. **Metodologi og laboratoriekvalifikasjon** — hvilken metode (og
   hvilken metodedokumentversjon) som ble brukt per rad, hvilke laber
   som kjørte hvilke tester, hver labs ISO/IEC 17025:2017-
   akkrediteringsstatus og sertifikat-hash, nylige kompetansetest-
   resultater, uavhengighetserklæring, avviks-/reprøvings-/OOS-
   oppføring for dette partiet.
5. **Utgivelsesavgjørelse** — utgivelsesdato, utgivelsesmyndighet på
   rollenivå + medsignatur, sammendrag av avgjørelsesstøttende
   oppføringer, overordnede distribusjonsdestinasjoner,
   forpliktelser etter utgivelse som er anerkjent ved utgivelse,
   timing-og-irreversibilitets-forpliktelse.
6. **Tilbakekallings- og overvåkningsforpliktelser etter
   markedsføring** — mattrygghets-analogen til legemiddelovervåkning:
   sykdomssignal-transparens, tilbakekalingsutførelsesforpliktelser
   (24t / 72t / 98 %-terskler), respons på forsyningskjede-
   kontaminering, forpliktelse om ingen stille reprøving, forpliktelse
   om ingen post hoc-spesifikasjonsendringer, deling av aggregert
   trygghetssignal.
7. **Ledsagende offentliggjøringer og nektelsesregistrering** — hash
   av korrigerende tiltak-undersøkelseslogg, nylig
   inspeksjonshistorikk, tilbakekalingshistorikk, kjente åpne
   problemer i brukte testmetoder, rolle-til-individ-binding
   (forseglet separat, hashet her), forsyningskjede-tilbakesporings-
   beredskap, eksplisitt liste over nektelsesregler R1–R8 med
   eventuelle nektelser utøvd under denne utgivelsen.
8. **Signerende prinsipal** — produsent + rollenivå-signatar
   (QA-direktør) + rollenivå-medsignatur (anleggsleder) +
   kryptografisk nøkkelinformasjon; rasjonale for publisering på
   rollenivå.

Hvert faktum avsluttes med nektelsesporten-konvensjonen: *"Dette
faktumet hevder kun X. Det hevder ikke Y"* (der Y er den nærmeste
feilmodusen fra "GJØR IKKE"-seksjonen ovenfor).

---

## Hva dette settet forsvarer mot

- **Stille tilbakevirkende modifikasjon av resultater fra
  utgivelsestester.** Alle test-rapport-PDF-er er hashet. Re-hashing
  etter utgivelse avslører enhver modifikasjon.
- **Tvister om hvilke metoder, hvilke metodedokumentversjoner og
  hvilke laber som ble brukt.** FAKTUM 04 fryser metodologien og
  lab-akkrediteringsstatusen ved utgivelse. Senere "vi brukte
  faktisk MLG 4.13, ikke 4.12"-påstander er offentlig motbevisbare.
- **Tilbakevirkende reklassifisering for et utenfor-spek-parti.**
  Hvis et utgivelsestestresultat faktisk var en marginal BESTÅTT
  som reklassifiseres som en FEIL etter utgivelse, beviser de
  forseglede rapport-hashene hva det opprinnelige resultat-PDF-en
  sa. Symmetrisk er en marginal OOS som stille blir testet til en
  BESTÅTT uten offentliggjøring, oppdagbar dersom FAKTUM 06s
  forpliktelse om ingen stille reprøving senere sammenlignes med en
  uforsendt endring.
- **Stille minimering av tilbakekallingsomfang.**
  Tilbakekallingsforpliktelsene i FAKTUM 06 (24t-varsling,
  72t-igangsetting, 98 % gjenfinningsmulighet) er forseglet;
  manglende overholdelse er offentlig observerbar.
- **Post hoc-omfortelling av korrigerende tiltakshistorikk.** Hashen
  av korrigerende tiltakslogg i FAKTUM 07 fryser det selskapet SA at
  det gjorde etter den EMP-presumptive; senere "vi gjorde mer /
  mindre enn det"-påstander er offentlig motbevisbare.
- **Selektiv utelatelse av ledsagende offentliggjøringer.** FAKTUM
  07 lister opp de forventede offentliggjøringskategoriene
  (inspeksjonshistorikk, tilbakekallingshistorikk, metoderådgivnings-
  gjennomgang, tilbakesporingsberedskap); en tom kategori må
  eksplisitt attesteres ("ingen ved utgivelsestidspunktet"), slik at
  et senere "vi visste ikke at det var relevant" er offentlig
  motbevisbart.
- **Substitusjon av et annet labs akkrediteringsstatus.** FAKTUM 04
  fryser hver labs ISO 17025-omfang og sertifikat-hash ved
  utgivelse; en senere substitusjon av et ikke-akkreditert lab er
  offentlig oppdagbar.

Settet forsvarer **ikke** mot samtidig korrupsjon — et team som
tilsiktet forsegler falske testresultater ved utgivelsestidspunktet,
produserer en kryptografisk gyldig forsegling av falske
testresultater. Primitiven er ærlig om dette: den er en
ikke-tilbakekallelsesprimitiv for produsentens samtidige
påstander, ikke et bevis for at disse påstandene er korrekte.

---

## Historisk dødelighetsprecedens

Settet ville ha produsert et nyttig anker — *ikke en løsning* — i
tidligere mattrygghetsfeil. For å unngå ærekrenkelse av enkeltpersoner
(de fleste mattrygghetsfeil er bedriftsmessige, ikke individuelle;
noen blir strafferettslig forfulgt, og noen ikke), beskriver disse
referansene utbruddet etter år og patogen og navngir den involverte
enheten kun når kontamineringen ble offentlig tilskrevet ved
tilbakekallingsvarsel eller domstolsoppføring.

- **Kinas melamin-forfalskning av morsmelkerstatning og meieri i 2008
  (Sanlu Group + andre).** Minst seks spedbarnsdødsfall og
  ~300 000 sykdomstilfeller tilskrevet melaminforsterkede meieri-
  produkter designet for å bedragersk blåse opp tilsynelatende
  proteininnhold på Kjeldahl-nitrogen-baserte tester. Dommer fulgte
  i KFR-domstoler, inkludert dødsstraff. *Forseglingen ville ikke ha
  forhindret dette* — melamin var utenfor det standardiserte
  analyttpanelet. Forseglingen ville ha forpliktet seg offentlig til
  det panelet SOM VAR, hvilket ville ha gjort omfanget av
  post-hendelses-utvidelsen av rutinescreening forensisk klart.

- **Det europeiske STEC O104:H4-utbruddet i 2011 (fenugreek-spirer
  sporet til en tysk gård).** 53 dødsfall, ~3 950 sykdomstilfeller på
  tvers av flere europeiske land; til slutt sporet til
  fenugreek-frø importert fra Egypt og spiret hos en tysk produsent.
  Tilbakesporingen ble hemmet av inkonsekvent partinivå-
  dokumentasjon på tvers av den multinasjonale forsyningskjeden.
  *Forseglingen ville ikke ha forhindret kontamineringen av
  frø-partiet* (kontamineringen var oppstrøms for spirerens tester);
  den ville ha forankret det spirerens utgivelsestester hevdet, og
  hvis brukt på frø-importørnivå, hva den importerte-frø-håndteringen
  hevdet, hvilket ville gjort tilbakesporingen raskere.

- **Blue Bell Creameries' Listeria monocytogenes-utbrudd i 2015 (USA).**
  3 dødsfall, 10 sykdomstilfeller på tvers av flere delstater; førte
  til en nasjonal tilbakekalling og en føderal kriminell dom mot
  Blue Bell for forseelse-mattrygghets-anklager i 2020, med
  selskapet inngåelse av en utsatt rettsforfølgningsavtale og
  betaling av 19,35 millioner dollar. Påfølgende sivil rettstvist.
  *Forseglingen ville ikke ha forhindret* den in-plant Listeria-
  miljøkontamineringen; den ville ha forensisk forankret
  miljøovervåkningsprogram-oppføringene, hvilket gjort enhver
  post-hendelses-spørsmål om "hva viste EMP i månedene før
  utbruddet" besvarbart mot en tukling-tydelig tidsstemplet
  oppføring i stedet for mot senere produserte dokumenter.

- **Multistat-STEC O157:H7-utbrudd i 2018 koblet til romaine-salat
  (Yuma-dyrkingsregion, deretter Salinas-dyrkingsregion).** Minst 5
  dødsfall og ~210 sykdomstilfeller på tvers av flere utbrudd det
  året. Tilbakesporingen ble komplisert av blandet-kilde-poseprodukt.
  *Forseglingen ville ikke ha forhindret* kontaminering på
  mark-/irrigasjonsvann-nivå (oppstrøms for produsenten); den ville
  ha forensisk forankret hver foredlers innkomsttesting- og
  utgivelsestest-oppføring, hvilket gjort tilbakesporingen raskere
  og den offentlige oppføringen mer kryptografisk forsvarbar mot
  senere tvister.

- **Peanut Corporation of Americas Salmonella Typhimurium-utbrudd
  (2008–2009, USA).** 9 dødsfall, ~714 sykdomstilfeller; resulterte i
  føderale kriminelle dommer mot PCA-ledere i 2014–2015, inkludert
  en 28-årig fengselsstraff for konsernsjefen for konspirasjon og
  hindring av rettsforfølgelse. *Forseglingen ville ikke ha
  forhindret* kontamineringen, underbehandlingen av positive
  in-plant Salmonella-tester eller den ledelse-nivå-avgjørelsen om å
  sende produkt mot disse positive funnene. Den VILLE ha gjort
  forensisk klart ved rettssak hva testresultatene SA i øyeblikket
  de ble generert — og dermed gjort påtalemaktens sak mot samtidige
  falske-fortellings-e-poster betydelig mer forankret mot
  dokumentmodifikasjon.

I hver av disse sakene ville settet ha gitt en renere forensisk
tidslinje. I ingen av disse sakene ville settet alene ha forhindret
dødsfallene. Forseglingen er forensisk infrastruktur, ikke
forebyggelses-infrastruktur. Den distinksjonen er settets ærlighet.

---

## Når man skal bruke dette settet

- Produksjonsoperasjonen din har et stabilt HACCP-/Preventive-
  Controls-program og ønsker å legge til en Bitcoin-forankret
  offentlig attestasjon som et tukling-tydelig lag oppå den
  eksisterende utgivelses-dokumentasjons-arbeidsflyten.
- Du er en liten-til-mellomstor produsent eller en produsent i en
  jurisdiksjon med svakere regulatorisk infrastruktur, som ønsker å
  forankre partioppføringer mot en globalt verifiserbar tidslinje —
  for tillit på eksportmarkedet, for kunde-revisjonsrespons eller
  for deltakelse i frivillige transparens-initiativer.
- Du er en mattrygghetsinspektør eller tredjepartssertifiserer og
  ønsker å publisere en tukling-tydelig revisjonsfunn-forsegling ved
  godkjenning, slik at revisjonsfunnene ikke kan stille endres
  senere ved avtale mellom produsenten og sertifisereren.
- Du forventer at dette partiet vil møte betydelig nedstrøms
  granskning (eksportmarked, høyrisikokategori som RTE-kjøtt eller
  morsmelkerstatning, ny ingrediens, nylig
  tilbakekallingshistorikk).
- Du kan publisere det listede faktasettet uten å bryte
  nektelsesregler R1–R8. Hvis dine fakta ville kreve et brudd på
  R1–R8, bruk ikke settet; rett opp datainndataene først.
- Produsentens juridiske rådgiver har gjennomgått publiseringsplanen.
  Offentlig publisering av en parti-identifikator-bærende artefakt
  har implikasjoner for produktansvarseksponering;
  juridisk gjennomgang er ikke valgfri.

## Når man IKKE skal bruke dette settet

- **Ikke bruk det som erstatning for FSMA-/FSIS-/EU-regulatoriske
  oppføringer.** Forseglingen er *additiv*, ikke en erstatning. Dine
  lovbestemte utgivelsesoppføringer, din HACCP-plan, dine
  CCP-logger og din tilbakekallingsplan er uendrede.
- **Ikke bruk det som en trygghetspåstand.** Å forsegle en bestått
  utgivelsesoppføring etablerer ikke at produktet er trygt; det
  etablerer at oppføringen hadde dette byte-innholdet på dette
  tidspunktet. Nektelsesregel R6 vil avvise enhver
  trygghetskonklusjon.
- **Ikke bruk det til å publisere leverandøridentiteter, kundelister,
  arbeidernavn eller anleggsadresser.** Nektelsesregler R1–R5
  eksisterer av hensyn til menneskesikkerhet og kontrakt; ikke endre
  settet for å motvirke dem uten å konsultere juridisk rådgiver.
- **Ikke bruk det under press for å forsegle før utgivelsestesting er
  fullført.** En delvis-data-forsegling feilrepresenterer tilstanden
  til utgivelsesavgjørelsen.
- **Ikke bruk det som legitimitetsteater.** En forsegling av en
  dårlig utformet prøveplan eller et dårlig valgt analyttpanel er en
  varig offentlig oppføring av utilstrekkeligheten, ikke et forsvar
  mot den. Primitiven skjærer begge veier; det er dens ærlighet.
- **Ikke bruk det under en aktiv tilbakekallingssituasjon som
  erstatning for regulatorens tilbakekallings-koordinering.** En ny
  MYRIAM-publisering som forankrer tilbakekallingsomfanget er
  passende ETTER at den regulator-koordinerte tilbakekallingen er
  igangsatt; den er ikke en erstatning for regulatorens
  tilbakekallingskanal.

## Hvordan forke dette settet for en virkelig utgivelse

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # erstatt fiktivt innhold med virkelig parti
                           # bruk nektelsesreglene R1-R8 gjennomgående
bash build/seal.sh         # FORSEGLE FØR første distribusjons-bevegelse
python3 build/verify.py    # bekreft
```

**KRITISK TIMING:** forsegle i øyeblikket for QA-utgivelse, FØR
partiet distribueres (før den første lastebilen forlater anlegget).
En forsegling etter at distribusjonen begynner, har fortsatt verdi,
men forankrer ikke pre-distribusjonstilstanden rent. Det riktige
vinduet er mellom QA-utgivelsessignaturen og den første
distribusjonsbevegelsen.

**KRITISK GJENNOMGANG:** før forsegling, kjør publiseringen gjennom
en andre QA-gjennomgår (ikke leder) og gjennom selskapets juridiske
rådgiver. Når den er forseglet, er publiseringen permanent.

## Integrasjon med eksisterende mattrygghetsinfrastruktur

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  URL-en eller IPFS-CIDen for den forseglede publiseringen kan
  refereres i Food Safety Plan-dokumentasjonen som den
  offentlige-attestasjons-artefakten for dette partiet.
- **USDA FSIS HACCP-planer og utgivelsesoppføringer.** Den forseglede
  utgivelsesoppføringen ligger ved siden av de FSIS-pålagte
  HACCP-oppføringene; forseglingen refererer til hashen for
  HACCP-planversjonen (FAKTUM 02), slik at senere tvister om
  hvilken planversjon som var i kraft, er offentlig motbevisbare.
- **Codex Alimentarius / HACCP-prinsipper** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Forseglingen forplikter seg til syv-prinsipper-
  HACCP-utdataene (fareanalyse, CCP-er, kritiske grenser,
  overvåkning, korrigerende tiltak, verifisering, registerføring)
  for dette partiet.
- **ISO 22000:2018 (Food Safety Management Systems).** Forseglingen
  kan refereres som en del av sporet for evidensgjennomgang i
  ledelsesgjennomgang; den erstatter ikke ISO 22000-sertifiseringen.
- **FSSC 22000 v6-sertifiseringsordning.** Kompatibel som et additivt
  transparenslag; FSSCs revisor kan verifisere forseglingen under
  overvåkning.
- **EU-forordning (EF) 178/2002 (Generell Matlov) Artikkel 18
  (sporbarhet) og Artikkel 19 (tilbakekallingsvarsling).**
  Forseglingen forplikter produsentens ett-tier-tilbake
  sporbarhetsberedskap (FAKTUM 07) og tilbakekallingsforpliktelser
  (FAKTUM 06); den erstatter ikke den lovbestemte
  Artikkel 19-varslingsforpliktelsen.
- **EU Hygienepakken (Forordninger 852/2004, 853/2004, 854/2004,
  882/2004).** Kompatibel; forseglingen refererer til ekvivalenten
  av Hygienepakkens HACCP- og egenkontroll-oppføringer.
- **BRCGS-/SQF-privatstandard-ordninger.** Kompatible som additivt
  transparenslag.
- **Folkehelseovervåkningssystemer (CDC PulseNet, FoodNet, IFSAC; EU
  EFSA/ECDC).** Direkte utenfor omfanget for forseglingen, men
  FAKTUM 06 forplikter produsenten til å delta og forsegle eventuelle
  signalkorrelasjonshendelser som nye MYRIAM-publiseringer.

## Hva dette settet IKKE erstatter

- FDA Food Facility Registration eller USDA FSIS
  Establishment-godkjenning.
- Din skrevne Food Safety Plan / HACCP-plan under FSMA / FSIS.
- CCP-overvåkningslogger og korrigerende tiltaks-oppføringer.
- ISO 17025 lab-akkrediteringstilsyn.
- Kompetansetestprogrammer.
- Regulatorinspeksjon (FSIS kontinuerlig inspeksjon, FDA periodisk
  inspeksjon, EU-kompetent-myndighets-inspeksjon).
- Folkehelseovervåkning (CDC, EFSA, ECDC, nasjonale ekvivalenter).
- Tilbakekallings-koordineringskanaler (FDA Reportable Food
  Registry, FSIS tilbakekallings-koordinering, EU RASFF, nasjonale
  ekvivalenter).
- Arbeidersikkerhets- og matarbeider-treningsprogrammer.

## Hvorfor dette settet eksisterer i v0.4.0+

Dette er et av de ferdige eksemplene som leveres med myriam-kit. Det
følger den begrensningsorienterte README-strukturen validert av
autoresearch dokumentert i `~/Genesis/calc/PROMPT_LIBRARY_v0.md` —
den begrensningsorienterte prompt-varianten skåret høyest på en
vektet rubrikk på tvers av flere eksempelområder, fordi
mattrygghetsattestasjon nettopp er det området der det å overdrive
hva forseglingen beviser er farlig: folk har dødd, vil dø, i feil som
forseglingen ikke kan forhindre. Innledningsavsnittene er de bærende
delene av settet; manifestinnholdet er den enkle delen.

Settets standardinnstillinger er bevisst konservative på publisering
av arbeidernavn, konservative på presisjon for anleggslokasjon,
konservative på leverandør- og kundeidentitet og aggressive på
"dette etablerer ikke trygghet"-fraskrivelsen. Mattrygghetsmiljøet
har en dokumentert historie med overdrevet sertifiseringsspråk;
settet er forhåndsinnstilt på den posisjonen som er minst sannsynlig
å bli lest som en trygghetsgaranti. Produsenter i jurisdiksjoner der
spesifikke offentlige offentliggjøringskrav avviker, kan endre sin
fork tilsvarende, men standard-nektelsene favoriserer
arbeidersikkerhet og ærlig omfang.

## Lisens

Allment tilgjengelig (CC0). Fork det. Ingen kreditering kreves.
