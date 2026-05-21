*Dansk oversættelse — for den oprindelige engelske version, se [README.md](README.md)*

# Forseglingskit til attestation af offentlige udgifter

Et nøglefærdigt myriam-kit-eksempel for kommunale, statslige, provinsielle og
nationale regeringer, der ønsker kryptografisk at forankre budget-
udførelsesposter (kontrakttildelinger, udbetalinger, accept af leverancer) i
udstedelsesøjeblikket, så stille retroaktiv ændring af offentlige udgiftsposter
bliver offentligt påviselig.

Seglet er et **forensisk anker**, ikke en integritetscertificering. Det
registrerer, hvad finansmyndigheden rapporterede den dag, det blev rapporteret,
i en form, der ikke senere kan revideres i stilhed uden at producere en
offentligt synlig kryptografisk uoverensstemmelse.

---

## Hvad dette kit IKKE gør (læs først)

Seglet er et kryptografisk tidsstempel af det, der blev attesteret. Det kan ikke
verificere, om det, der blev attesteret, var **lovligt, retfærdigt eller ærligt**. De
følgende fejlmoduser ligger **uden for seglets domæne**:

1. **Korruption og kickbacks opstrøms.** Hvis et indkøb var manipuleret,
   en leverandør blev valgt på grund af bestikkelse, en enestående-kilde-begrundelse
   blev fabrikeret, eller en kontrakt blev oppustet med en aftalt kickback-
   procent — så forankrer seglet den som-registreret-transaktion med den
   oppustede pris og den foretrukne leverandør med høj integritet. Seglet
   iagttager outputtet af finanssystemet; det har ingen synlighed
   til korruption opstrøms for udstedelsen. Brasiliens *Operação Lava
   Jato* dokumenterede systematiske ~3% kartel-administrerede kickbacks på tværs af
   tusinder af Petrobras-kontrakter, der ville være blevet forseglet ved
   udstedelse, som om de var fuldstændig rutinemæssige.

2. **Skuffeselskab-skjul af reelt ejerskab.** En kontrakt
   tildelt "Acme Construction Ltd." forsegles med entitetsnavnet
   i det offentlige register. Hvis "Acme" faktisk kontrolleres af en
   uoplyst politisk eksponeret person eller er et af snesevis af skuffe-
   selskaber kontrolleret af et enkelt kartel, forankrer seglet
   overfladeentiteten. Reelt-ejerskab-gennemsigtighed er et SEPARAT
   regime (FATF Recommendation 24, EU 5AMLD/6AMLD, US Corporate
   Transparency Act), hvis output kræver sin egen forseglingsprotokol.

3. **Regnskabssvig opstrøms for udstedelsen.** Hvis finansmyndigheden
   selv fabrikerer registreringen, før den forsegles — fiktive
   kontrakter, spøgelses-ansatte på lønningslisten, fiktive accepter af
   leverancer — forankrer seglet fabrikationen. Seglet kan ikke
   påvise, at registreringen er falsk i det øjeblik, den registreres; det
   kan kun påvise, at registreringen er blevet ændret EFTER forseglingen.

4. **Selektiv offentliggørelse / cherry-picking.** En finansmyndighed
   kan offentliggøre et *udvalg* af transaktioner — de rene — og
   forsegle alene disse. Seglet forankrer det, der er i offentliggørelsen; det
   forankrer ikke universet af transaktioner, der burde have været
   i offentliggørelsen. Dette kits FACT 07 (ledsagende offentliggørelser og
   afvisningsregister) er det strukturelle forsvar, men det afhænger af, at
   den udstedende myndighed er ærlig om, hvad den vælger ikke at
   forsegle.

5. **Off-books- eller ekstrabudgetmæssige udgifter.** Offentlige udgifter, der ledes
   gennem statsejede virksomheder, suveræne formuefonde, special-
   purpose-vehicles eller ekstrabudgetmæssige forvaltningskonti, optræder
   muligvis ikke i det budget, seglet forankrer. Seglet registrerer, hvad der blev rapporteret
   inden for det budgetmæssige system; udgifter uden for systemet ligger uden for
   seglets domæne. Iraks Coalition Provisional Authority (CPA)
   2003–2004-stridigheder involverede cirka 9 milliarder USD i kontant-
   udbetalinger, hvis registreringer delvist gik tabt; en forsegling af de
   registreringer, der eksisterede i udbetalingsøjeblikket, ville have forankret
   dem, men ville ikke have skabt registreringer, som CPA ikke
   vedligeholdt.

6. **Post-udstedelses-"forklarings"-pres.** En forseglet overskridelse, en
   forseglet enestående-kilde eller en forseglet ændringsordre kan om-fortælles
   senere med den indramning, politisk autoritet ønsker. Seglet
   forankrer KENDSGERNINGERNE på udstedelsesdatoen, men det forudbestemmer ikke
   den fortælling, disse kendsgerninger senere vil understøtte.

7. **Tvungen attestation.** Hvis den ansvarlige finansprincipal er
   tvunget til at underskrive en attestation, der fejlrepræsenterer
   transaktioner, forankrer seglet den tvungne attestation med den
   tvungne signatur. Seglet verificerer HVEM der underskrev (FACT 08), ikke
   HVORFOR de underskrev. Forsegling af en tvungen attestation producerer en
   permanent offentlig optegnelse af det tvungne output — nyttigt til senere
   ansvarliggørelse, men ikke et forsvar mod tvang i øjeblikket.

8. **Sammenligning på tværs af jurisdiktioner.** En forseglet udgift er
   kun læsbar i forhold til den udstedende jurisdiktions retssystem.
   "Hvorfor betalte kommune X Y for tjeneste Z, da kommune W
   kun betalte V?" er et komparativt analytisk spørgsmål nedstrøms for
   forseglingen. Tværjurisdiktionel benchmarking er en analytisk opgave på
   forseglede data, ikke en egenskab ved seglet.

**Afsnittet om ærlige begrænsninger ovenfor er den bærende del af dette kit.**
Finansembedsmænd og politikere, der tror, at forsegling er lig med integritet,
vil bruge dette kit som et skjold. Kittet skal sige tydeligt: dette er en
*ikke-afvisnings-primitiv for udstedelsesøjeblikket*, ikke et bevis på
udgiftsintegritet.

---

## Hvad dette kit SKAL AFVISE at forsegle

Kittet er konfigureret til at afvise følgende kendsgernings-mønstre, selv hvis en
bruger med gyldig signeringsautoritet indsender dem:

- **Individuelle navne på offentligt ansatte under principal-signerings-
  niveau.** Ingen kendsgerning må navngive enkeltpersoner i indkøbskontorets
  stab, enkeltpersoner blandt finanskasse-funktionærer, enkeltpersoner blandt
  bedømmelsespanelets medlemmer eller nogen fysisk person, der ikke er i en
  offentligt-vendt ansvarsrolle. Eksponeringsrisikoen for repressalier mod linje-
  stab overstiger gennemsigtighedsgevinsten; deres identiteter forsegles i interne
  kontroller (FACT 05 hash af godkendelseslog), ikke i selve attestationens
  brødtekst.

- **Leverandør-PII.** Ingen kendsgerning må indeholde leverandørbankkontonumre,
  navne på individuelle leverandøransatte, leverandørers hjemmeadresser,
  skatte-ID'er for fysiske personer hos leverandører, interne prisopdelinger,
  der indeholder leverandørens omkostningsstruktur, eller noget andet kommercielt-PII-
  felt, hvis offentliggørelse skader leverandørens interesser uden at tjene
  antikorruption. Sådanne oplysninger må HASHES (FACT 05), men ikke
  offentliggøres.

- **Sikkerhedsklassificerede udgifter.** Udgifter klassificeret under
  national-sikkerhedsstatutter er IKKE berettigede til forsegling under dette
  kit. Klassificeret håndtering er et andet problem med andre
  kryptografiske og juridiske krav. Selve udelukkelsen er
  offentliggjort i FACT 07 R3, så læseren ved, at offentliggørelsen er
  delvis pr. design.

- **Civilretlig håndhævelse af skatteforpligtelser mod identificerede fysiske
  personer.** Selv om håndhævelsesomkostninger er offentlige udgifter,
  afvises navngivning af individuelle skatteydere under håndhævelse: privatlivs-
  skaden overstiger gennemsigtighedsgevinsten, og parallel
  gennemsigtighed findes under skattedomstols-rapportering.

- **Præ-udstedelses-transaktioner.** Ingen kontrakt før formel tildeling; ingen
  udbetaling før formel udstedelse. Forsegling af et kontraktudkast eller
  en afventende betaling, som om den var udført, skaber falsk sikkerhed.

- **Forsegling foretaget af nogen anden end den ansvarlige finansprincipal.**
  En entreprenør, leverandør, byrådsmedlem, journalist eller observatør
  kan ikke forsegle "den offentlige udgiftsoptegnelse" i stedet for den
  finansmyndighed, der udstedte den. (De kan forsegle deres egne observationer
  under deres egen principal i en separat offentliggørelse.)

- **"Fri for korruption"-indramninger.** Kittet afviser at forsegle enhver
  indramning af formen "denne udgift var lovlig og fri for
  korruption" eller "indkøbet var påviseligt retfærdigt". Sådanne
  påstande er erkendelsesteoretisk uden for kittets domæne.

- **Offentliggørelser, der udelader FACT 07's ledsagende offentliggørelser.** En
  offentliggørelse af transaktioner uden den medfølgende offentliggørelse
  og afvisningsoptegnelse er ikke en legitim MYRIAM-offentliggørelse under
  dette kit.

En afvisning kan selv forsegles som en kendsgerning ("Denne part anmodede om
forsegling af X; kittet afviste i henhold til afvisningsregel Y"), hvorved der skabes en offentlig
optegnelse over forsøgt misbrug. På et område, hvor politisk pres på
finansembedsmænd er dokumenteret, er en optegnelse over *afviste* anmodninger
i sig selv et integritetssignal.

---

## Hvad dette kit FAKTISK forsegler

8 kendsgerninger i øjeblikket for budget-udførelses-attestation:

1. **Eksempelnotits** — erklærer offentliggørelsen som et eksempel (rigtige
   attestationer fjerner eller erstatter denne).
2. **Jurisdiktion og retsgrundlag** — hvilken regeringsenhed der
   udsteder, under hvilken statutær autoritet, i hvilken finansiel periode.
3. **Bevilling eller budgetreference** — de specifikke linjer i det
   vedtagne budget, der eksekveres, med hashes af budgetinstrumentet
   og enhver anvendt ændring/overførsel/omprogrammering.
4. **Kontrakt- eller udbetalingsmanifest** — pr.-transaktion-registrering:
   beløb, leverandørens juridiske entitetsnavn (ingen individuel PII), formål,
   dato, indkøbstype, tildelingsgrundlag, hash af kontraktdokument.
5. **Hashes af understøttende dokumenter** — SHA-256 af opfordringer,
   evalueringer, indgåede kontrakter, ændringsordrer, betalingsanmodninger,
   accept-af-leverance-formularer, statskasse-bogføringsposter, godkendelseslogs for
   kontroller. Kun hashes, ikke indhold — for at beskytte kommercielt
   og personligt PII, samtidig med at re-hash-verifikation muliggøres.
6. **Revisions- og tilsynsstatus** — hvilken inspektør-general-instans der har
   jurisdiktion, hvilken supreme audit institution, hvilken anklagemyndighed
   der har jurisdiktion over korruptionsforbrydelser, revisionsfrister, aktuel
   status for enhver igangværende gennemgang.
7. **Ledsagende offentliggørelser og afvisningsregister** — afventende
   indkøbsprotester, afventende interne undersøgelser, udestående FOI-
   anmodninger, dissenterende gennemgange, kendte budgetlinjeoverskridelser; eksplicit
   liste over mønstre, kittet afviste at forsegle.
8. **Signerende principal** — ansvarlig finansembedsmand + rolle +
   statutær ansvarlighed + medsignatarer under dobbelt kontrol;
   hvad hver signatar personligt attesterer og ikke attesterer.

Hver kendsgerning slutter med afvisningsporten-konventionen: *"Denne kendsgerning hævder
kun X. Den hævder ikke Y"* (hvor Y er den nærmeste fejlmodus
fra "GØR IKKE"-afsnittet).

---

## Hvad dette kit forsvarer imod

- **Stille post-udstedelses-revision af kontraktbeløb.** Enhver ændring af
  ethvert beløb i FACT 04 producerer en anderledes SHA-256, en anderledes
  Merkle-rod, fejler OTS-verifikation.
- **Stille leverandør-substitution.** Udskiftning af "Leverandør A" med "Leverandør B"
  på en allerede udstedt kontrakt kan påvises ud fra de forseglede bytes.
- **Tilbagedatering af ændringsordrer.** FACT 04 fryser ændringsordrens
  dato og begrundelse ved udstedelsen; enhver senere påstand om "dette var altid
  det aftalte omfang" må forholde sig til den forseglede ændringsordreoptegnelse.
- **Stille forsvinden af ufordelagtige transaktioner.** Alle
  transaktioner udstedt i perioden er i FACT 04 under én Merkle-
  rod. Offentliggørelse af et udvalg kan påvises ud fra blade-hash-listen.
- **Undertrykkelse af ledsagende offentliggørelser.** FACT 07 fryser afventende-
  protest-, afventende-undersøgelse- og udestående-FOI-status i
  attestationsøjeblikket. Enhver senere "vi hørte aldrig om den
  protest"-påstand er offentligt diffbar.
- **Drift i revisionsjurisdiktion.** FACT 06 fryser, hvilke instanser der har
  tilsynsjurisdiktion over de forseglede transaktioner. En senere påstand
  om, at en bestemt IG "ikke havde autoritet", må forholde sig til
  den forseglede jurisdiktionsoptegnelse.
- **Sletning af afvisningsoptegnelse.** FACT 07 registrerer, hvad kittet afviste
  at forsegle; enhver senere "vi har aldrig afvist noget"-påstand modsiger
  den forseglede optegnelse.

---

## Historiske sager, kittet ville have hjulpet i

Kittet ville have produceret et nyttigt **forensisk anker** — *ikke en løsning,
ikke en forebyggelse, ikke en erstatning for strafferetlig forfølgning* — i
dokumenterede offentlige sager, der involverede stille retroaktiv
ændring af offentlige udgiftsposter:

- **Brasilien — *Operação Lava Jato* / Petrobras-linjen (2014–2021).**
  Brasilianske føderale anklagere dokumenterede et kartel af store
  byggefirmaer, der i over et årti betalte kickbacks i gennemsnit
  ~3% på Petrobras- og andre føderale infrastrukturkontrakter, hvor
  kickbacket gik til politikere og til kartellets egen priskoordination.
  Kontrakterne som udstedt fremstod rutinemæssige; korruptionen var opstrøms
  for udstedelsen. Et forseglingskit ville IKKE have forhindret Lava Jato
  (kickbacks blev indlejret i prisen FØR kontrakten nåede seglet),
  men ville have forankret kontraktbetingelserne ved udstedelsen — hvorved
  den senere forensiske rekonstruktion af "hvad hver kontrakt faktisk sagde, da den
  blev underskrevet" ville være blevet enormt billigere. Lava Jatos
  efterforskningsomkostninger lå i høj grad i prisen for at samle tidslinjer fra
  inkonsistente arkiverede optegnelser.

- **Den Europæiske Union — stridigheder om regionale udviklingsfonde (flere
  medlemsstater, 2010'erne–2020'erne).** Den Europæiske Revisionsrets årlige
  rapporter har gentagne gange identificeret væsentlige fejlrater i
  udgifter under de europæiske struktur- og investeringsfonde (ESIF) og
  Samhørighedsfonden, der i nogle år oversteg væsentlighedstærsklen.
  Stridigheder om "hvad der faktisk blev krævet" versus "hvad der faktisk
  blev leveret" gentages, fordi kravs-dokumentation kan
  revideres mellem indsendelse og revision. Pr.-udstedelses MYRIAM-forsegling
  af kravet-som-indsendt ville have forankret hvert kravs
  indhold ved indsendelsen og adskilt "hvad støttemodtageren krævede
  på det tidspunkt" fra "hvad post-revisions-rekonstruktionen konkluderede".

- **Irak — Coalition Provisional Authority (CPA)-udbetalinger,
  2003–2004.** CPA udbetalte cirka 9 milliarder USD i kontanter
  fra Development Fund for Iraq med dokumentation, som Special
  Inspector General for Iraq Reconstruction (SIGIR) og senere
  revisionsrapporter karakteriserede som væsentligt ufuldstændig.
  Stridigheder om udbetalingsoptegnelser fortsætter to årtier senere.
  Forsegling i udbetalingsøjeblikket ville ikke have skabt
  optegnelser, som CPA ikke vedligeholdt — men hvor en optegnelse
  eksisterede (håndskrevne bogføringer, daterede overførselsautorisationer), ville en
  samtidig forsegling have forankret denne optegnelses byte-tilstand
  i udstedelsesøjeblikket og adskilt "optegnelsen på det
  tidspunkt" fra "optegnelsen som senere rekonstrueret".

- **Grækenland — statsgæld og revisioner af offentlig-udgifts-rapportering
  (2009–2010).** Eurostat-revisioner i 2009–2010 dokumenterede
  betydelige revisioner af tidligere rapporterede græske finansdata,
  hvor selve revisionsmetodologien var omstridt. Forsegling af
  kvartalsvise udgiftsrapporter i øjeblikket for den oprindelige
  offentliggørelse ville have gjort *deltaet* mellem originale og
  reviderede rapporter offentligt diffbart i stedet for kun rekonstruerbart
  gennem arkivsammenligning. Seglet ville ikke have forhindret den
  underliggende metodologiske strid, men ville have forankret hvert
  rapporteret kvartal i øjeblikket for den oprindelige rapport.

- **Storbritannien — pandemi-indkøb (2020–2022).** UK National
  Audit Office og parlamentsudvalgsrapporter identificerede
  indkøbsprocesser i 2020–2021, hvor kontrakter blev
  tildelt under nødbestemmelser med reduceret konkurrence og
  reduceret dokumentation; nogle tildelinger blev senere ændret, annulleret
  eller afgjort. Pr.-udstedelses-forsegling af hver nød-indkøbs-
  tildeling ville have forankret tildelingens begrundelse og betingelser ved
  tildelingsøjeblikket, hvorved senere ændringer blev et offentligt synligt
  delta i stedet for en stille ændret optegnelse.

- **Sydafrika — state-capture-æra-kontrakter med offentlige virksomheder
  (~2010–2018).** Zondo-kommissionen dokumenterede kontrakter ved
  flere statsejede virksomheder (Eskom, Transnet, Denel), hvis
  dokumentation var varierende ufuldstændig, revideret eller omstridt.
  Forsegling af hver kontrakttildeling ved udstedelse ville have forankret
  optegnelsens som-tildelt-tilstand og adskilt senere forensisk-
  rekonstruktions-output fra den samtidige optegnelse.

Kittet ville IKKE have forhindret den underliggende korruption i nogen af
de ovennævnte sager. I flere sager var det underliggende problem, at
korruptionen lå *opstrøms for udstedelsen* — seglet forankrer den korrupte
kontrakt med høj integritet, hvilket er en anden slags nyttighed
(forensisk anker for senere ansvarliggørelse), men ikke det samme som
forebyggelse. I andre sager (CPA-kontanter, off-budget-udgifter) lå det
underliggende problem i, at de optegnelser, der blev forseglet, ikke eksisterede eller
ikke blev vedligeholdt — kittet kan ikke skabe optegnelser, som myndigheden
ikke producerede.

Disse historiske sager nævnes kun med henvisning til offentligt
dokumenterede konklusioner (retsdokumenter, parlamentsudvalgsrapporter,
revisionsorganers publikationer). Der fremsættes ingen påstand om nogen enkeltperson;
de dokumenterede institutionelle konklusioner står på den offentlige optegnelse.

---

## Hvornår man skal bruge dette kit

- Din jurisdiktion har en etableret budget-udførelses-rapporterings-
  proces og vil tilføje et uforanderligt offentligt anker.
- Du forventer post-udstedelses-granskning (FOI-anmodninger, revision, civil-
  samfunds-overvågning, journalistisk efterforskning) og ønsker et manipulationspåviseligt
  referencepunkt.
- Du har retlig hjemmel under gennemsigtigheds-/aktindsigtslovgivning til at
  offentliggøre det anførte kendsgerningssæt med respekt for privatlivs-/sikkerheds-undtagelserne.
- Du opererer under et statutært revisionsregime (inspektør general,
  supreme audit institution) og vil forankre hvert kvartalsafslutning,
  før revisionscyklussen når frem til det.
- Du offentliggør under Open Contracting Data Standard eller IATI og
  ønsker et kryptografisk supplement til portalbaseret offentliggørelse.

## Hvornår man IKKE skal bruge dette kit

- **Brug det ikke som erstatning for statutær revision, inspektør-general-
  gennemgang, anklagerundersøgelse eller civilsamfundsovervågning.**
  Kittet er *additivt*, ikke en erstatning.
- **Brug det ikke som legitimitetscertifikat.** En forseglet udgifts-
  optegnelse er ikke et korruptionsfrit certifikat. At behandle det som
  et er præcis den fejlmodus, kittets begrænsnings-først-struktur
  eksisterer for at forhindre.
- **Brug det ikke midt i en periode.** Kittet er til øjeblikket for formel
  udstedelse (kvartalsafslutning, kontrakttildeling, milepælsudbetaling).
  Midtperiode-segl skaber vildledende referencepunkter.
- **Brug det ikke til at hævde, at udgiften var lovlig, retfærdig eller ikke-
  korrupt** — det kan kittet ikke.
- **Brug det ikke til at forsegle klassificerede udgifter, individuelle ansattes
  PII eller leverandørers kommercielle PII.** Kittet afviser disse mønstre;
  at forsøge dem skaber en afvisningsoptegnelse (FACT 07).
- **Brug det ikke til at forsegle præ-udstedelsesudkast.** Udkast kan forsegles
  under en anden attestationstype ("udkast til kommentar, ikke
  udstedt"), men ikke under dette kits udstedelsestype.
- **Brug det ikke under pres for at udelade FACT 07-offentliggørelser.** Nægt
  og forsegl afvisningen.
- **Brug det ikke, hvis din finansmyndighed er kapret.** En forseglet
  bedragerisk udgift er en permanent offentlig optegnelse over bedrageriet,
  ikke et forsvar af det. Primitiven skærer begge veje; det er dens
  ærlighed.

---

## Sådan forker du dette kit til en faktisk attestation

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Kritisk timing:** forsegl PÅ det formelle udstedelsesøjeblik — det vil sige det
øjeblik, hvor den ansvarlige finansprincipal underskriver kvartalsafslutningen,
det øjeblik en kontrakt formelt tildeles, eller det øjeblik en
udbetaling formelt udstedes. Et segl før formel udstedelse skaber
et falskt positivt "dette er den officielle optegnelse"-referencepunkt. Et segl længe
efter formel udstedelse er forensisk svagere mod mellemkommende
ændringer.

**Kadence:** kittet er designet til kvartalsvise attestationer som
default. Sub-kvartalsvise kadencer (månedsafslutning, pr.-transaktion-
forsegling) understøttes ved at køre igen med passende omfang; forseglingen
af en enkelt højværdi-transaktion er en legitim anvendelse.

---

## Integration med eksisterende offentlig-finans-infrastruktur

Kittet er designet til at komponere med, ikke erstatte:

- **Open Contracting Data Standard (OCDS) v1.1.5.** De fem
  offentliggørelsespunkter (planlægning, udbud, tildeling, kontrakt,
  implementering) afbildes naturligt på FACT 03 (planlægning →
  bevilling), FACT 04 (udbud, tildeling, kontrakt, implementering
  → transaktionsmanifest) og FACT 05 (hashes af understøttende dokumenter).
  Selve OCDS JSON-eksporten forsegles i FACT 05 (kontroldokumenter).
  En jurisdiktion, der kører OCDS-offentliggørelse, kan tilføje MYRIAM-forsegling som
  et kryptografisk lag oven på sin eksisterende portal.

- **International Aid Transparency Initiative (IATI)-standard v2.03.**
  For udgifter helt eller delvist finansieret af ekstern bistand kan IATI-
  XML forsegles som et kontroldokument; seglet udgør et
  kryptografisk supplement til IATI-registrets HTTP-baserede
  offentliggørelsesmodel.

- **Open Government Partnership (OGP)-forpligtelser.** OGP National
  Action Plans inkluderer ofte forpligtelser om finanspolitisk gennemsigtighed;
  MYRIAM-forsegling operationaliserer en "manipulationspåviselig offentliggørelse"-
  forpligtelse på en måde, der kan verificeres uafhængigt af civilsamfundet
  uden at kræve tillid til regeringens portal.

- **OECD Recommendation on Public Integrity (2017).** Kittet
  understøtter Recommendation 4 (åbne regeringsdata om offentlig økonomi
  i maskinlæsbar, rettidig form) ved at gøre dataene
  kryptografisk forankrede såvel som maskinlæsbare.

- **UN Convention against Corruption (UNCAC), særligt artikel
  9 (indkøb) og 13 (samfundets deltagelse).** Kittet
  leverer en forensisk primitiv, der understøtter artikel 9-gennemsigtigheds-
  forpligtelser og artikel 13-civilsamfundstilsyn.

- **Supreme Audit Institutions (SAIs) — INTOSAI-rammen.** SAIs,
  der opererer under INTOSAI-standarder (ISSAI), kan konsumere forseglede
  offentliggørelser som bevis med høj integritet; SHA-256-hashene
  i FACT 05 er de samme hashes, som SAI'ens e-revisionsværktøjer kan
  genberegne.

- **Inspektør-general-kontorer.** Indenlandske IG-kontorer med
  jurisdiktion over de forseglede udgifter (FACT 06) kan rekvirere
  dokumentkroppene, hvis hashes er forseglet i FACT 05; seglet
  binder de dokumentkroppe, der er modtaget efter retskendelse, til de kroppe,
  der eksisterede ved udstedelsen.

- **Aktindsigtslove og åbenhedsstatutter.** Seglet
  fritager ikke den udstedende myndighed fra fortsatte FOI-
  forpligtelser; det gør faktisk selektivt FOI-svar påviseligt
  som en afvigelse fra den forseglede optegnelse. FACT 07 C3 forankrer
  udestående FOI-anmodninger på attestationstidspunktet.

- **Registre over reelt ejerskab (FATF Recommendation 24, EU
  AML-direktiver, US Corporate Transparency Act).** Reelt-
  ejerskab-data forsegles IKKE under dette kit (FACT 04 henter
  leverandøridentitet alene fra det registrerede juridiske entitetsnavn). En
  oplysning om reelt ejerskab er et separat forseglingsregime, der
  kan producere en parallel offentliggørelse refereret til ved Merkle-rod.

- **Domstolsadministreret gennemsigtighed (retslig udgiftsrapportering,
  proceedings om aktivinddrivelse).** Output fra korruptions-
  relaterede retssager ligger ikke inden for dette kits omfang, men kan
  forsegles under parallelle attestationstyper.

## Hvad dette kit IKKE erstatter

- Statutær budget-udførelses-revision af inspektør-general-instanser
- Supreme-audit-institution-gennemgang (GAO, NAO, TCU, CAG, AGN, BRH,
  Cour des comptes, tilsvarende)
- Anklagerundersøgelse af korruptionsforbrydelser (nationale
  antikorruptionsanklagere, UNCAC artikel 36-instanser)
- Civilsamfunds- og journalistisk efterforskningsrapportering
- Whistleblower-kanaler og beskyttede oplysningsordninger
- Oplysning om reelt ejerskab
- Internationalt peer-review (OECD, IMF Fiscal Transparency
  Evaluation, EU-semester, IATI-register)
- Domstolsadministrerede sager om aktivinddrivelse

Seglet er en forensisk primitiv, der sænker omkostningerne og øger
pålideligheden af alt ovennævnte. Det er ikke, og kan ikke være, en
erstatning for noget af det.

---

## Licens

Almindelig ejendom (CC0). Fork det. Ingen kreditering nødvendig.
