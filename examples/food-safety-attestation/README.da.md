*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Kit til fødevaresikkerheds-attestation

Et nøglefærdigt myriam-kit-eksempel for fødevareproducenter,
fødevaresikkerheds-inspektører, tredjeparts-certificerere og
regulatoriske myndigheder, der ønsker at offentliggøre en
Bitcoin-forankret, manipulationspåvisende forsegling af *hvad
frigivelsestestene sagde* og *hvilken frigivelsesbeslutning der blev
truffet* — i øjeblikket for partifrigivelse eller for
godkendelse af inspektionsrapporten — således at tavs modifikation
efter frigivelse af test-optegnelsen, frigivelsesbeslutningen eller
tilbagekaldelsesforpligtelserne bliver offentligt påviselig.

---

## Hvad dette kit IKKE gør (læs først)

Forseglingen er et kryptografisk tidsstempel af HVILKE
frigivelsestester der blev udført på HVILKEN parti, af HVILKE
akkrediterede laboratorier, under HVILKE metoder, med HVILKE
resultater, og hvilken FRIGIVELSESBESLUTNING QA-myndigheden traf på
baggrund af disse resultater. Den kan ikke besvare noget spørgsmål om
fødevaresikkerhed ud over det. Følgende ligger **uden for
forseglingens domæne**:

1. **Forebyggelse af kontaminering.** Kittet forankrer hvad
   testresultaterne SAGDE ved frigivelse. Kontaminering har mange
   årsager — heterogen mikrobiel fordeling inden for en parti,
   temperatur-misbrug efter frigivelse i distribution,
   håndteringsfejl i detailhandlen, forbruger-tilberedningsfejl,
   nye eller uscreenede farer (f.eks. melamin-forfalskning før
   melamin-screening blev rutine), forsyningskædebedrageri opstrøms
   for producentens testomfang. Forseglingen forhindrer ingen af
   disse og hævder ikke at gøre det.

2. **Garantere at alle enheder i en bestået parti er sikre.**
   Mikrobiologisk kontaminering i fødevareprodukt i bulk er
   HETEROGEN. Listeria, Salmonella og STEC-patogener forekommer i
   lavprævalente lokaliserede hotspots, ikke ensartet fordelt.
   ICMSF- og Codex-prøveudtagningsplaner har en dokumenteret,
   begrænset sandsynlighed for at detektere kontaminering til stede
   ved lav prævalens — sandsynligheden er IKKE 1. En parti, der
   består frigivelsesprøvning, kan stadig indeholde kontaminerede
   enheder, der ikke blev udtaget. Forseglingen forankrer PRØVERNE,
   ikke bulken. Denne begrænsning er udtrykkeligt gentaget i
   KENDSGERNING 03 og er den enkeltvis vigtigste ærlige grænse for
   dette kit.

3. **Certificere at frigivelsestester blev kørt ærligt.**
   Forseglingen forankrer hvad testene rapporterede ved frigivelse.
   Et laboratorium, der rapporterer et svigagtigt BESTÅET ved
   frigivelse, producerer en kryptografisk gyldig forsegling af et
   svigagtigt BESTÅET. Kittet gør senere tavs modifikation
   påviselig, men detekterer ikke samtidig svig. Detektion af
   samtidig svig kræver revision, akkrediteringstilsyn af lab
   (ISO 17025-overvågning), kompetenceprogrammer og
   regulator-inspektion — alt opstrøms for forseglingen.

4. **Erstatte FSMA-, FSIS- eller EU-kompetent-myndigheds
   regulatoriske indgivelser.** Frigivelses-optegnelser under FSMA,
   FSIS, EU-forordning (EF) 178/2002 og Codex Alimentarius
   opretholdes ifølge lov og produceres efter regulator-anmodning.
   Forseglingen tilføjer et offentligt manipulationspåvisende lag
   OVENPÅ disse indgivelser; den ERSTATTER dem IKKE. En forseglet
   publikation er ikke en regulatorisk indgivelse.

5. **Løse tilbagekaldelsesomfangs-stridigheder.** Kittet kan
   forsegle de tilbagekaldelsesforpligtelser, der blev givet ved
   frigivelse (KENDSGERNING 06), og et efterfølgende
   tilbagekaldelsesomfang som en ny publikation; men grænsen for
   hvilke partier der er berørt, hvilke enheder der blev afsendt,
   hvilke detailhandlere der modtog dem, og hvilke forbrugere der
   blev eksponeret, er stadig en
   sporing-tilbage-og-fremad-undersøgelse. Forseglingen forankrer
   hvad producenten FORPLIGTEDE sig til, og hvad de senere GJORDE.
   Den løser ikke det underliggende epidemiologiske spørgsmål.

6. **Detektere forsætlig forsyningskædebedrageri opstrøms for
   testning.** Melamin-forfalskningen af mælk og modermælkserstatning
   i Kina i 2008 lykkedes, fordi melamin ikke var i analytpanelet —
   kvælstof-indholds-proteinækvivalent-måling var det, og melamin
   spoofede det. En forseglet KENDSGERNING 03 med det analytpanel,
   der var i brug på det tidspunkt, ville have forpligtet sig
   offentligt til det panel — men ville ikke have gjort noget for at
   detektere forfalskningsmidlet uden for panelet. Forseglingens
   værdi i den sag ville have været retsmedicinsk forankring af
   "dette er hvad producenten hævdede at teste for", IKKE
   forebyggelse. Et reelt fødevaresikkerheds-regime adresserer dette
   gennem uanmeldt regulator-prøveudtagning med bredspektret
   screening (f.eks. LC-MS utargeterede metoder), som ligger
   opstrøms for producentens forsegling.

7. **Forankre distribution og forbrugerhåndtering efter frigivelse.**
   Når partiet forlader anlægget, er temperatur-misbrug under
   distribution, fejlhåndtering i detailhandlen,
   forbrugerlagringsfejl og forbruger-tilberedningsfejl alle uden
   for omfanget. Forseglingen er afgrænset til producentens
   frigivelsesbegivenhed. Manipulationspåvisning nedstrøms kræver
   separate kits hos distributøren, detailhandleren og (for
   institutionelle forbrugere som skoler og hospitaler) på
   brugspunkts-niveau.

8. **Gå god for sikkerheden af fødevarer i nogen specifik
   befolkning.** KENDSGERNING 03 BESTÅET-resultater medfører ikke
   sikkerhed for gravide forbrugere, spædbørn,
   immunkompromitterede forbrugere eller ældre, for hvem Listeria
   monocytogenes og Salmonella udgør dokumenteret forhøjet risiko
   selv ved koncentrationer under konventionelle detektionsgrænser.
   Forseglingen kan ikke fremsætte en befolkningsspecifik
   sikkerhedspåstand og nægter at gøre det (afvisningsregel R6).

**Det ærlige-grænser-afsnit ovenfor er den bærende del af dette kit.**
Producenter, der behandler "vi har forseglet vores
frigivelses-optegnelse" som ækvivalent med "vi har bevist, at vores
fødevarer er sikre", misbruger primitivet. Kittet skal sige tydeligt:
*dette er et ikke-tilbagekaldelses-primitiv for producentens
samtidige påstande ved frigivelse, ikke et bevis på sikkerhed, ikke
en erstatning for regulator-tilsyn og ikke et forsvar mod de
heterogen-kontaminerings-, forsyningskædebedrageri- eller
fejl-håndtering-efter-frigivelse-fejltilstande, der har dræbt
mennesker i tidligere udbrud.*

---

## Hvad dette kit SKAL NÆGTE at forsegle

Kittet er konfigureret til at afvise følgende kendsgerningsmønstre,
selv hvis en bruger med gyldig producent-signaturmyndighed indsender
dem:

- **Personlig identifikation af enhver arbejder, supervisor,
  QA-medarbejder, besøgende inspektør eller tredjeparts-revisor.**
  Navne, medarbejder-ID, badgenumre, CPR-numre, hjemmeadresser,
  personlige telefonnumre — ingen af disse vises i den offentlige
  forsegling. Roller er offentlige; person-til-rolle-bindinger
  forsegles separat og kan opdages under regulator-proces.
  Arbejdersikkerhed mod gengældelse og chikane er den bærende
  begrænsning; fødevaresikkerheds-attestation kan udføres på
  rolle-niveau. (R1)

- **Præcis anlægslokation.** Anlæggets region (delstat eller
  multi-delstats-region) er acceptabel; præcis gadeadresse,
  GPS-koordinater eller enhver identifikator med tilstrækkelig
  granularitet til at identificere anlægget fysisk på et kort er
  IKKE acceptabel. Det regulatoriske etableringsnummer er
  regulatorens håndtag for anlægget; fysiske
  sikkerhed- og arbejdersikkerheds-hensyn taler imod at
  offentliggøre en offentlig adresse på Bitcoin. (R2)

- **Individuelle produktionsskifte-personalemønstre.** Skifteplaner,
  individuelle arbejderrotationer, linjeoperatørs personlige ID'er
  — ingen af disse vises i forseglingen. Livsmønstre for individuelle
  arbejdere må ikke kunne udledes af den offentlige attestation. (R3)

- **Leverandøridentiteter, der kompromitterer kontrakter.**
  Leverandørnavne, leverandøranlægs-lokationer,
  leverandør-parti-koder (undtagen i forsyningskæde-
  kontamineringssagen, hvor navngivning af en leverandørs
  kontaminerede parti er nødvendigt af hensyn til folkesundheden, og
  håndteres gennem en separat forseglet publikation) offentliggøres
  IKKE i frigivelses-forseglingen. Mange forsyningskontrakter
  indeholder fortrolighedsklausuler; forseglingen bryder dem ikke
  som standard. (R4)

- **Kundelister og distributionsdestinationer ud over højt niveau.**
  Højt-niveau regional opsummering er acceptabel; specifikke
  kundelister (detailhandlere, distributionscentre, foodservice-
  konti) er IKKE acceptable. Kundeidentitet er kontraktligt
  fortrolig og konkurrencefølsom; regulatoren opnår kundelisten
  gennem etablerede tilbagekaldelses-koordineringskanaler. (R5)

- **Sikkerhedspåstande eller juridiske konklusioner.** Kittet vil
  ikke forsegle "dette produkt er sikkert", "denne parti opfylder
  alle gældende fødevaresikkerhedsstandarder", "dette er GRAS for
  denne anvendelse" eller nogen anden sikkerheds- eller juridisk
  konklusion. Kittet forankrer test-optegnelsen og
  frigivelsesbeslutningen, IKKE en sikkerhedskonklusion. (R6)

- **Arbejder-klage- eller whistleblower-re-identifikationsmønstre.**
  Kittet nægter at offentliggøre ethvert mønster, der kunne
  re-identificere en arbejder, der har indgivet en OSHA-, USDA-
  eller intern virksomheds-klage om fødevaresikkerhed eller
  arbejdspladssikkerheds-praksis. Sådanne klagere er beskyttet i
  henhold til FSMA § 402 og parallelle vedtægter; forseglingen må
  ikke blive en re-identifikationsvektor. Whistleblower-attestationer
  har deres eget kit (`examples/whistleblower-manifest`) med
  afvisningsregler tilpasset den anvendelse. (R7)

- **Forsegling af nogen anden end den frigivende producents
  autoriserede principal.** En tredjeparts-certificerer, kunde-QA-team
  eller uafhængig revisor må bruge det samme kit til at forsegle
  DERES egne revisionsfund; de må IKKE forsegle den oprindelige
  frigivelsesbeslutning under producentens navn. Den underskrivende
  principal i KENDSGERNING 08 er den eneste gyldige underskriver
  herfor. (R8)

En afvisning kan i sig selv forsegles som en kendsgerning ("Denne
producent anmodede om forsegling af X; kittet afviste i henhold til
afvisningsregel Y"), hvilket skaber en offentlig optegnelse af
forsøgt misbrug.

---

## Hvad dette kit FAKTISK forsegler

8 kendsgerninger i frigivelsesøjeblikket:

1. **Eksempel-notits** — erklærer publikationen som et eksempel
   (virkelige attestationer fjerner eller erstatter denne).
2. **Produkt- og partiidentifikation** — produktnavn, kategori,
   producent, anlægsregion (IKKE præcis lokation),
   HACCP-planversion + hash, parti-ID, produktions-/pakke-/
   bedst-før-datoer, antal forbrugerenheder, opbevaringskrav, de tre
   kritiske kontrolpunkter med loggede optegnelses-hashes
   (koge-letalitet, nedkølings-stabilisering, post-letalitets
   RTE-miljø).
3. **Frigivelsestest-resultater** — mikrobiologiske tests af
   færdigprodukt (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), kemiske / restkoncentrations-tests (nitrit,
   veterinærrester, tungmetaller), allergen-krydskontakt-verifikation,
   miljøovervågnings-resumé, hver med SHA-256 af den fulde
   rapport-PDF og den eksplicitte
   prøve-vs-bulk-fortolkningsbegrænsning.
4. **Metodologi og laboratoriekvalifikation** — hvilken metode (og
   hvilken metode-dokumentversion) der blev anvendt per række,
   hvilke labs der kørte hvilke tests, hver labs ISO/IEC
   17025:2017-akkrediteringsstatus og certifikats-hash, nylige
   kompetencetest-resultater, uafhængighedserklæring,
   afvigelses- / gentest- / OOS-optegnelse for denne parti.
5. **Frigivelsesbeslutning** — frigivelsesdato,
   frigivelsesmyndighed på rolle-niveau + medunderskrift, resumé af
   beslutningsstøttende optegnelser, højt-niveau distributions-
   destinationer, forpligtelser efter frigivelse anerkendt ved
   frigivelse, timing-og-irreversibilitets-forpligtelse.
6. **Tilbagekaldelses- og post-marketing-overvågningsforpligtelser**
   — fødevaresikkerheds-analogen til pharmacovigilance:
   sygdomssignal-gennemsigtighed, tilbagekaldelses-eksekverings-
   forpligtelser (24t / 72t / 98 %-tærskler), respons på
   forsyningskæde-kontaminering, ingen-tavs-gentestning-forpligtelse,
   ingen-post-hoc-specifikationsændringer-forpligtelse, deling af
   aggregeret sikkerhedssignal.
7. **Ledsagende oplysninger og afvisningsoptegnelse** — hash af
   undersøgelses-log for korrigerende handlinger, nylig
   inspektionshistorik, tilbagekaldelseshistorik, kendte åbne
   problemer i anvendte testmetoder, rolle-til-individ-binding
   (forseglet separat, hashet her), forsyningskæde-tilbagespornings-
   beredskab, eksplicit liste over afvisningsregler R1–R8 med
   eventuelle afvisninger udøvet under denne frigivelse.
8. **Underskrivende principal** — producent + rolle-niveau-
   signatar (QA-direktør) + rolle-niveau-medunderskrift
   (anlægsleder) + kryptografiske nøgleoplysninger; rationale for
   publikation på rolle-niveau.

Hver kendsgerning afsluttes med afvisningsporten-konventionen: *"Denne
kendsgerning hævder kun X. Den hævder ikke Y"* (hvor Y er den nærmeste
fejltilstand fra "GØR IKKE"-afsnittet ovenfor).

---

## Hvad dette kit forsvarer imod

- **Tavs tilbagevirkende modifikation af frigivelsestest-resultater.**
  Alle test-rapport-PDF'er er hashet. Genhashing efter frigivelse
  afslører enhver modifikation.
- **Stridigheder om hvilke metoder, hvilke metode-dokumentversioner
  og hvilke labs der blev anvendt.** KENDSGERNING 04 fryser
  metodologien og lab-akkrediteringsstatus ved frigivelse. Senere
  påstande som "vi brugte faktisk MLG 4.13, ikke 4.12" er offentligt
  refutérbare.
- **Tilbagevirkende re-spec for en out-of-spec parti.** Hvis et
  frigivelsestest-resultat faktisk var en grænse-BESTÅET, der
  reklassificeres som FEJLET efter frigivelse, beviser de forseglede
  rapport-hashes hvad den oprindelige resultat-PDF sagde.
  Symmetrisk, en grænse-OOS, der stille gentestes til en BESTÅET
  uden oplysning, er påviselig, hvis KENDSGERNING 06's
  ingen-tavs-gentest-forpligtelse senere sammenlignes med en
  uforseglet ændring.
- **Tavs minimering af tilbagekaldelsesomfang.**
  Tilbagekaldelsesforpligtelserne i KENDSGERNING 06 (24t-
  notifikation, 72t-igangsættelse, 98 % genfindelighed) er
  forseglet; manglende opfyldelse er offentligt observerbar.
- **Post-hoc gen-narrationer af korrigerende-handlinger-historikken.**
  Hashen af korrigerende-handlinger-log i KENDSGERNING 07 fryser
  hvad virksomheden SAGDE, at den gjorde efter den EMP-presumptive;
  senere "vi gjorde mere / mindre end det"-påstande er offentligt
  refutérbare.
- **Selektiv udeladelse af ledsagende oplysninger.** KENDSGERNING 07
  opregner de forventede oplysningskategorier (inspektionshistorik,
  tilbagekaldelseshistorik, metode-rådgivnings-gennemgang,
  tilbagespornings-beredskab); en tom kategori skal udtrykkeligt
  attesteres ("ingen ved frigivelsestidspunktet"), så et senere "vi
  vidste ikke, at det var relevant" er offentligt refutérbart.
- **Substitution af en anden labs akkrediteringsstatus.**
  KENDSGERNING 04 fryser hver labs ISO 17025-omfang og certifikats-
  hash ved frigivelse; en senere substitution af et ikke-akkrediteret
  lab er offentligt påviselig.

Kittet forsvarer **ikke** imod samtidig korruption — et team, der
forsætligt forsegler falske testresultater ved frigivelsestidspunktet,
producerer en kryptografisk gyldig forsegling af falske testresultater.
Primitivet er ærligt om dette: det er et ikke-tilbagekaldelses-
primitiv for producentens samtidige påstande, ikke et bevis på, at
disse påstande er korrekte.

---

## Historisk dødeligheds-præcedens

Kittet ville have produceret et nyttigt anker — *ikke en løsning* —
i tidligere fødevaresikkerhedssvigt. For at undgå at ærekrænke
enkeltpersoner (de fleste fødevaresikkerhedssvigt er virksomheds-
mæssige, ikke individuelle; nogle behandles strafferetligt, og nogle
ikke), beskriver disse referencer udbruddet efter år og patogen og
navngiver den involverede enhed kun, når kontamineringen blev
offentligt tilskrevet ved tilbagekaldelses-bekendtgørelse eller
domstolsoptegnelse.

- **Kinas melamin-forfalskning af modermælkserstatning og
  mejeriprodukter i 2008 (Sanlu Group + andre).** Mindst seks
  spædbarns-dødsfald og ~300.000 sygdomstilfælde tilskrevet
  melamin-tilsatte mejeriprodukter designet til svigagtigt at
  oppuste tilsyneladende proteinindhold på Kjeldahl-kvælstof-
  baserede assays. Domme fulgte i kinesiske domstole, herunder
  dødsdomme. *Forseglingen ville ikke have forhindret dette* —
  melamin var uden for det standard-analytpanel. Forseglingen ville
  have forpligtet sig offentligt til hvad panelet VAR, hvilket ville
  have gjort omfanget af post-hændelses-udvidelsen af rutinescreening
  retsmedicinsk klar.

- **Det europæiske STEC O104:H4-udbrud i 2011 (bukkehorns-spirer
  sporet til en tysk gård).** 53 dødsfald, ~3.950 sygdomstilfælde i
  flere europæiske lande; til sidst sporet til bukkehorn-frø
  importeret fra Egypten og spiret hos en tysk producent.
  Tilbagesporing blev hæmmet af inkonsistent parti-niveau
  dokumentation på tværs af den multinationale forsyningskæde.
  *Forseglingen ville ikke have forhindret kontamineringen af
  frø-partiet* (kontamineringen var opstrøms for spirerens tests);
  den ville have forankret hvad spirerens frigivelsestester hævdede,
  og hvis brugt på frø-importør-niveau, hvad den importerede-frø-
  håndtering hævdede, hvilket ville have gjort tilbagesporing
  hurtigere.

- **Blue Bell Creameries' Listeria monocytogenes-udbrud i 2015
  (USA).** 3 dødsfald, 10 sygdomstilfælde i flere delstater; førte
  til en national tilbagekaldelse og en føderal strafferetlig dom i
  2020 af Blue Bell for forseelses-fødevaresikkerheds-anklager, hvor
  virksomheden indgik en udsat retsforfølgelses-aftale og betalte
  19,35 millioner dollar. Efterfølgende civil retssag. *Forseglingen
  ville ikke have forhindret* den in-plant Listeria-
  miljøkontaminering; den ville have retsmedicinsk forankret
  miljøovervågningsprogram-optegnelserne og dermed gjort enhver
  post-hændelses-spørgsmål om "hvad viste EMP i månederne før
  udbruddet" besvarbart imod en manipulationspåvisende
  tidsstemplet optegnelse i stedet for imod senere producerede
  dokumenter.

- **Multistat STEC O157:H7-udbrud i 2018 koblet til romaine-salat
  (Yuma-dyrkningsregion, derefter Salinas-dyrkningsregion).** Mindst
  5 dødsfald og ~210 sygdomstilfælde i flere udbrud det år.
  Tilbagesporing blev kompliceret af blandet-kilde-poseprodukt.
  *Forseglingen ville ikke have forhindret* kontaminering på
  mark- / vandings-niveau (opstrøms for producenten); den ville have
  retsmedicinsk forankret hver forarbejders indtagstest- og
  frigivelsestest-optegnelse, hvilket ville have gjort tilbagesporing
  hurtigere og den offentlige optegnelse mere kryptografisk
  forsvarlig imod senere stridigheder.

- **Peanut Corporation of Americas Salmonella Typhimurium-udbrud
  (2008–2009, USA).** 9 dødsfald, ~714 sygdomstilfælde; resulterede
  i føderale strafferetlige domme mod PCA-ledere i 2014–2015,
  herunder en 28-årig fængselsstraf for direktøren for
  konspiration og obstruktion. *Forseglingen ville ikke have
  forhindret* kontamineringen, under-undersøgelsen af positive
  in-plant Salmonella-tester eller den direktion-niveau beslutning
  om at afsende produkt imod disse positive fund. Den VILLE have
  gjort retsmedicinsk klart ved retssag, hvad testresultaterne SAGDE
  i øjeblikket, de blev genereret — hvilket ville have gjort
  anklagemyndighedens sag imod samtidige falske-fortællings-emails
  væsentligt mere forankret imod dokumentmodifikation.

I hver af disse sager ville kittet have leveret en renere
retsmedicinsk tidslinje. I ingen af disse sager ville kittet alene
have forhindret dødsfaldene. Forseglingen er retsmedicinsk
infrastruktur, ikke forebyggelses-infrastruktur. Den sondring er
kittets ærlighed.

---

## Hvornår skal man bruge dette kit

- Din fremstillingsoperation har et stabilt HACCP- / Preventive-
  Controls-program og ønsker at tilføje en Bitcoin-forankret
  offentlig attestation som et manipulationspåvisende lag oven på
  den eksisterende frigivelses-dokumentations-arbejdsgang.
- Du er en lille-til-mellemstor producent eller en producent i en
  jurisdiktion med svagere regulatorisk infrastruktur, der ønsker at
  forankre parti-optegnelser imod en globalt verificerbar tidslinje
  — for eksport-markeds-tillid, for kunde-revisions-respons eller
  for deltagelse i frivillige gennemsigtigheds-initiativer.
- Du er en fødevaresikkerheds-inspektør eller tredjeparts-
  certificerer og ønsker at offentliggøre en manipulationspåvisende
  revisions-fund-forsegling ved godkendelse, så revisionsfund ikke
  kan ændres stille senere ved aftale mellem producenten og
  certificeren.
- Du forventer, at denne parti vil møde betydelig nedstrøms
  granskning (eksportmarked, højrisikokategori som RTE-kød eller
  modermælkserstatning, ny ingrediens, nylig tilbagekaldelses-
  historik).
- Du kan offentliggøre det anførte kendsgerningssæt uden at bryde
  afvisningsreglerne R1–R8. Hvis dine kendsgerninger ville kræve et
  brud på R1–R8, så brug ikke kittet; ret data-input først.
- Producentens advokat har gennemgået publikationsplanen. Offentlig
  publikation af en parti-identifikator-bærende artefakt har
  implikationer for produktansvars-eksponering; advokat-gennemgang
  er ikke valgfri.

## Hvornår skal man IKKE bruge dette kit

- **Brug det ikke som erstatning for FSMA- / FSIS- / EU-regulatoriske
  optegnelser.** Forseglingen er *additiv*, ikke en erstatning.
  Dine lovbestemte frigivelses-optegnelser, din HACCP-plan, dine
  CCP-logfiler og din tilbagekaldelsesplan er uændrede.
- **Brug det ikke som en sikkerhedspåstand.** At forsegle en bestået
  frigivelses-optegnelse fastslår ikke, at produktet er sikkert; det
  fastslår, at optegnelsen havde dette byte-indhold på dette
  tidspunkt. Afvisningsregel R6 vil afvise enhver
  sikkerhedskonklusion.
- **Brug det ikke til at offentliggøre leverandøridentiteter,
  kundelister, arbejdernavne eller anlægsadresser.**
  Afvisningsreglerne R1–R5 eksisterer af hensyn til
  menneskesikkerhed og kontrakt; ændr ikke kittet for at omgå dem
  uden at konsultere advokat.
- **Brug det ikke under pres for at forsegle, før
  frigivelsestestning er færdig.** En forsegling med delvise data
  fejlrepræsenterer tilstanden af frigivelsesbeslutningen.
- **Brug det ikke som legitimitetsteater.** En forsegling af en
  dårligt designet prøveudtagningsplan eller et dårligt valgt
  analytpanel er en permanent offentlig optegnelse af utilstrækkelig-
  heden, ikke et forsvar imod den. Primitivet skærer begge veje; det
  er dens ærlighed.
- **Brug det ikke under en aktiv tilbagekaldelsessituation som
  erstatning for regulatorens tilbagekaldelses-koordinering.** En ny
  MYRIAM-publikation, der forankrer tilbagekaldelsesomfanget, er
  passende EFTER, at den regulator-koordinerede tilbagekaldelse er
  igangsat; den er ikke en erstatning for regulatorens
  tilbagekaldelseskanal.

## Sådan forker du dette kit til en rigtig frigivelse

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # erstat fiktivt indhold med rigtig parti
                           # anvend afvisningsregler R1-R8 gennemgående
bash build/seal.sh         # FORSEGL FØR første distributionsbevægelse
python3 build/verify.py    # bekræft
```

**KRITISK TIMING:** forsegle i øjeblikket for QA-frigivelse, FØR
partiet distribueres (før den første lastbil forlader anlægget). En
forsegling, efter at distributionen begynder, har stadig værdi, men
forankrer ikke pre-distributions-tilstanden rent. Det rigtige vindue
er mellem QA-frigivelsens underskrift og den første
distributionsbevægelse.

**KRITISK GENNEMGANG:** før forsegling, kør publikationen gennem en
anden QA-gennemgår (ikke den ledende) og gennem virksomhedens
advokat. Når den er forseglet, er publikationen permanent.

## Integration med eksisterende fødevaresikkerheds-infrastruktur

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  URL'en eller IPFS-CID'en for den forseglede publikation kan
  refereres i Food Safety Plan-dokumentationen som den offentlige
  attestations-artefakt for denne parti.
- **USDA FSIS HACCP-planer og frigivelses-optegnelser.** Den
  forseglede frigivelses-optegnelse ligger ved siden af de
  FSIS-påkrævede HACCP-optegnelser; forseglingen refererer hashen
  af HACCP-planversionen (KENDSGERNING 02), så senere stridigheder
  om hvilken planversion der var i kraft er offentligt refutérbare.
- **Codex Alimentarius / HACCP-principper** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Forseglingen forpligter sig til
  syv-principper-HACCP-output (fareanalyse, CCP'er, kritiske
  grænser, overvågning, korrigerende handlinger, verifikation,
  optegnelsesføring) for denne parti.
- **ISO 22000:2018 (Food Safety Management Systems).** Forseglingen
  kan refereres som en del af ledelsesgennemgangs-evidenssporet;
  den erstatter ikke ISO 22000-certificeringen.
- **FSSC 22000 v6-certificeringsordning.** Kompatibel som et
  additivt gennemsigtighedslag; FSSC's revisor kan verificere
  forseglingen under tilsyn.
- **EU-forordning (EF) 178/2002 (Generel Fødevarelov) Artikel 18
  (sporbarhed) og Artikel 19 (tilbagekaldelses-notifikation).**
  Forseglingen forpligter producentens et-tier-tilbage
  tilbagesporings-beredskab (KENDSGERNING 07) og
  tilbagekaldelses-forpligtelser (KENDSGERNING 06); den erstatter
  ikke den lovbestemte Artikel 19-notifikations-forpligtelse.
- **EU Hygiejnepakken (Forordninger 852/2004, 853/2004, 854/2004,
  882/2004).** Kompatibel; forseglingen refererer ækvivalenten af
  Hygiejnepakkens HACCP- og egen-kontrol-optegnelser.
- **BRCGS / SQF privat-standard-ordninger.** Kompatible som
  additivt gennemsigtighedslag.
- **Folkesundheds-overvågningssystemer (CDC PulseNet, FoodNet,
  IFSAC; EU EFSA / ECDC).** Direkte uden for omfanget for
  forseglingen, men KENDSGERNING 06 forpligter producenten til at
  deltage og til at forsegle enhver signalkorrelations-begivenhed
  som nye MYRIAM-publikationer.

## Hvad dette kit IKKE erstatter

- FDA Food Facility Registration eller USDA FSIS Establishment-
  godkendelse.
- Din skrevne Food Safety Plan / HACCP-plan under FSMA / FSIS.
- CCP-overvågningslogfiler og korrigerende-handlinger-optegnelser.
- ISO 17025 lab-akkrediterings-tilsyn.
- Kompetencetest-programmer.
- Regulator-inspektion (FSIS kontinuerlig inspektion, FDA periodisk
  inspektion, EU-kompetent-myndigheds-inspektion).
- Folkesundheds-overvågning (CDC, EFSA, ECDC, nationale
  ækvivalenter).
- Tilbagekaldelses-koordineringskanaler (FDA Reportable Food
  Registry, FSIS tilbagekaldelses-koordinering, EU RASFF, nationale
  ækvivalenter).
- Arbejdersikkerheds- og fødevarearbejder-træningsprogrammer.

## Hvorfor dette kit findes i v0.4.0+

Dette er et af de udarbejdede eksempler, der leveres med myriam-kit.
Det følger den begrænsnings-først README-struktur valideret af
autoresearch dokumenteret i `~/Genesis/calc/PROMPT_LIBRARY_v0.md` —
den begrænsnings-først-prompt-variant scorede højest på en vægtet
rubrik på tværs af flere eksempel-domæner, fordi fødevaresikkerheds-
attestation netop er det domæne, hvor det at overdrive, hvad
forseglingen beviser, er farligt: mennesker har dødet, vil dø, i
svigt, som forseglingen ikke kan forhindre. Indledningsafsnittene er
de bærende dele af kittet; manifestindholdet er den nemme del.

Kittets standarder er bevidst konservative på arbejdernavn-
publikation, konservative på anlægslokations-præcision, konservative
på leverandør- og kundeidentitet og aggressive på "dette fastslår
ikke sikkerhed"-fraskrivelsen. Fødevaresikkerheds-samfundet har en
dokumenteret historie med overdrevet certificeringssprog; kittet er
forhåndsindstillet på den position, der er mindst sandsynlig at
blive læst som en sikkerhedsgaranti. Producenter i jurisdiktioner,
hvor specifikke offentlige oplysningskrav adskiller sig, kan ændre
deres fork tilsvarende, men standard-afvisningerne favoriserer
arbejdersikkerhed og ærligt omfang.

## Licens

Almindelig ejendom (CC0). Fork det. Ingen kreditering kræves.
