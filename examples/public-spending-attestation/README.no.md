*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Forseglingssett for attestering av offentlige utgifter

Et nøkkelferdig myriam-kit-eksempel for kommunale, statlige,
fylkeskommunale og nasjonale regjeringer som ønsker å kryptografisk
forankre budsjettutførelses-poster (kontraktstildelinger, utbetalinger,
aksept av leveranser) i utstedelsesøyeblikket, slik at stille
tilbakevirkende modifikasjon av offentlige utgiftsposter blir
offentlig oppdagbar.

Forseglingen er et **forensisk anker**, ikke en integritetssertifisering.
Den registrerer det finansmyndigheten rapporterte den dagen det ble
rapportert, i en form som ikke senere kan revideres i stillhet uten å
produsere en offentlig synlig kryptografisk uoverensstemmelse.

---

## Hva dette settet IKKE gjør (les først)

Forseglingen er et kryptografisk tidsstempel på det som ble attestert.
Den kan ikke verifisere om det som ble attestert var **lovlig, rettferdig
eller ærlig**. Følgende feilmoduser er **utenfor forseglingens domene**:

1. **Oppstrøms korrupsjon og bestikkelser.** Hvis en anskaffelse var
   rigget, en leverandør ble valgt på grunn av bestikkelse, en
   enestende-kilde-begrunnelse var fabrikkert, eller en kontrakt ble
   oppblåst med en avtalt bestikkelsesprosent — så forankrer forseglingen
   den som-registrert-transaksjonen med den oppblåste prisen og den
   foretrukne leverandøren med høy integritet. Forseglingen observerer
   utdata fra finanssystemet; den har ingen synlighet inn i korrupsjonen
   oppstrøms for utstedelsen. Brasils *Operação Lava Jato* dokumenterte
   systematiske ~3 % kartelladministrerte bestikkelser på tvers av
   tusenvis av Petrobras-kontrakter som ville blitt forseglet ved
   utstedelse som om de var fullstendig rutine.

2. **Skallselskaps-skjul av reelt eierskap.** En kontrakt tildelt
   «Acme Construction Ltd.» forsegles med enhetsnavnet i det offentlige
   registeret. Hvis «Acme» faktisk kontrolleres av en uoppgitt politisk
   eksponert person, eller er ett av dusinvis av skallselskaper
   kontrollert av et enkelt kartell, forankrer forseglingen
   overflateenheten. Reelt-eierskap-transparens er et SEPARAT regime
   (FATF Recommendation 24, EU 5AMLD/6AMLD, US Corporate Transparency
   Act) hvis utdata krever sin egen forseglingsprotokoll.

3. **Regnskapssvindel oppstrøms for utstedelse.** Hvis finansmyndigheten
   selv fabrikerer registreringen før den forsegles — fantomkontrakter,
   spøkelsesansatte på lønningslisten, fiktive aksepter av leveranser —
   forankrer forseglingen fabrikasjonen. Forseglingen kan ikke oppdage
   at registreringen er falsk i det øyeblikket den registreres; den kan
   bare oppdage at registreringen er blitt endret ETTER forsegling.

4. **Selektiv publisering / kirsebærplukking.** En finansmyndighet kan
   publisere et *delsett* av transaksjoner — de rene — og forsegle bare
   dem. Forseglingen forankrer det som er i publiseringen; den forankrer
   ikke universet av transaksjoner som burde ha vært i publiseringen.
   Dette settets FACT 07 (ledsagende offentliggjøringer og avslagsregister)
   er det strukturelle forsvaret, men det avhenger av at den utstedende
   myndigheten er ærlig om hva den velger ikke å forsegle.

5. **Off-books- eller utenombudsjettmessige utgifter.** Offentlige
   utgifter som rutes gjennom statseide selskaper, statlige
   formuesfond, spesialformålsvehikler eller utenombudsjettmessige
   forvaltningskonti vises kanskje ikke i budsjettet forseglingen
   forankrer. Forseglingen registrerer det som ble rapportert innenfor
   budsjettsystemet; utgifter utenfor systemet ligger utenfor
   forseglingens domene. Iraks Coalition Provisional Authority (CPA)
   2003–2004-disputter omfattet omtrent 9 milliarder USD i
   kontantutbetalinger hvis registreringer delvis gikk tapt; forsegling
   av de registreringene som eksisterte i utbetalingsøyeblikket ville
   ha forankret dem, men ville ikke ha skapt registreringer som CPA
   ikke vedlikeholdt.

6. **«Forklarings»-press etter utstedelse.** En forseglet overskridelse,
   en forseglet enestende-kilde eller en forseglet endringsordre kan
   gjenfortelles senere med den innrammingen politisk myndighet ønsker.
   Forseglingen forankrer FAKTAENE på utstedelsesdatoen, men den
   forhåndsdømmer ikke fortellingen disse faktaene senere vil støtte.

7. **Tvungen attestering.** Hvis den ansvarlige finansprinsipalen blir
   tvunget til å signere en attestering som feilrepresenterer
   transaksjoner, forankrer forseglingen den tvungne attesteringen med
   den tvungne signaturen. Forseglingen verifiserer HVEM som signerte
   (FACT 08), ikke HVORFOR de signerte. Forsegling av en tvungen
   attestering produserer en permanent offentlig registrering av det
   tvungne utdata — nyttig for senere ansvarliggjøring, men ikke et
   forsvar mot tvang i øyeblikket.

8. **Sammenligning på tvers av jurisdiksjoner.** En forseglet utgift er
   bare lesbar mot det juridiske regimet i den utstedende
   jurisdiksjonen. «Hvorfor betalte kommune X Y for tjeneste Z når
   kommune W bare betalte V?» er et komparativ-analyse-spørsmål
   nedstrøms av forseglingen. Tverr-jurisdiksjonell sammenligning er en
   analytisk oppgave på forseglede data, ikke en egenskap ved
   forseglingen.

**Seksjonen om ærlige grenser ovenfor er den bærende delen av dette
settet.** Finansembedsmenn og politikere som tror at forsegling er lik
integritet, vil bruke dette settet som et skjold. Settet må si tydelig:
dette er en *ikke-avvisnings-primitiv for utstedelsesøyeblikket*, ikke
et bevis på utgiftsintegritet.

---

## Hva dette settet MÅ NEKTE å forsegle

Settet er konfigurert til å avvise følgende faktamønstre selv om en
bruker med gyldig signeringsmyndighet sender dem inn:

- **Individuelle navn på offentlig ansatte under prinsipal-signeringsnivå.**
  Ingen fakta får navngi individuelt innkjøpskontorpersonale,
  individuelle finansforvaltere, individuelle medlemmer av evalueringspanel,
  eller noen fysisk person som ikke er i en offentlig ansvarsrolle.
  Risikoen for represalier mot linjepersonale overstiger
  transparensgevinsten; deres identiteter forsegles i intern kontroll
  (FACT 05 hash av signaturlogg), ikke i selve attesteringsteksten.

- **Leverandør-PII.** Ingen fakta får inneholde leverandørens
  bankkontonumre, individuelle leverandøransattes navn,
  leverandørenes hjemmeadresser, skattenummer for fysiske personer hos
  leverandører, interne prisbrytinger som inneholder leverandørens
  kostnadsstruktur, eller noen annen kommersiell PII-felt hvis
  publisering skader leverandørens interesser uten å tjene
  antikorrupsjonsformål. Slik informasjon kan HASHES (FACT 05), men
  ikke publiseres.

- **Sikkerhetsklassifiserte utgifter.** Utgifter klassifisert under
  nasjonale sikkerhetsstatutter er IKKE kvalifisert for forsegling
  under dette settet. Klassifisert håndtering er et annet problem med
  andre kryptografiske og juridiske krav. Selve eksklusjonen
  offentliggjøres i FACT 07 R3 slik at leseren vet at publiseringen er
  delvis ved design.

- **Sivilrettslig håndhevelse av skatteforpliktelser mot identifiserte
  fysiske personer.** Selv om håndhevelseskostnader er offentlige
  utgifter, nektes navngivning av individuelle skattytere under
  håndhevelse: personvernsskaden overstiger transparensgevinsten, og
  parallell transparens eksisterer under skatterettsrapportering.

- **Pre-utstedelses-transaksjoner.** Ingen kontrakt før formell
  tildeling; ingen utbetaling før formell utstedelse. Forsegling av en
  utkastkontrakt eller en avventende betaling som om den var utført
  skaper falsk sikkerhet.

- **Forsegling av andre enn den ansvarlige finansprinsipalen.** En
  kontraktør, leverandør, kommunestyremedlem, journalist eller
  observatør kan ikke forsegle «den offentlige utgiftsregistreringen» i
  stedet for finansmyndigheten som utstedte den. (De kan forsegle sine
  egne observasjoner under sin egen prinsipal, i en separat publisering.)

- **«Fri-for-korrupsjon»-innramminger.** Settet nekter å forsegle
  enhver innramming av formen «denne utgiften var lovlig og fri for
  korrupsjon» eller «anskaffelsen var påviselig rettferdig». Slike
  påstander er epistemisk utenfor settets domene.

- **Publiseringer som utelater FACT 07 ledsagende offentliggjøringer.**
  En publisering av transaksjoner uten det tilhørende offentliggjørings-
  og avslagsregisteret er ikke en legitim MYRIAM-publisering under
  dette settet.

Et avslag kan selv forsegles som et faktum («Denne parten ba om
forsegling av X; settet nektet i henhold til avslagsregel Y»), noe som
skaper en offentlig oppføring av forsøkt misbruk. I et domene der
politisk press på finansembedsmenn er dokumentert, er en oppføring av
*avslåtte* forespørsler i seg selv et integritetssignal.

---

## Hva dette settet FAKTISK forsegler

8 fakta i øyeblikket for attestering av budsjettutførelse:

1. **Eksempelvarsel** — erklærer publiseringen som et eksempel
   (virkelige attesteringer fjerner eller erstatter dette).
2. **Jurisdiksjon og rettslig grunnlag** — hvilken offentlig instans
   som utsteder, under hvilken lovhjemmel, i hvilken finansperiode.
3. **Bevilgnings- eller budsjettreferanse** — de spesifikke linjene i
   det vedtatte budsjettet som utføres, med hasher av
   budsjettinstrumentet og eventuelle endringer / overføringer /
   omprogrammeringer som er anvendt.
4. **Kontrakts- eller utbetalingsmanifest** — per-transaksjon-registrering:
   beløp, leverandørens juridiske enhetsnavn (ingen individuell PII),
   formål, dato, anskaffelsestype, tildelingsgrunnlag,
   kontraktsdokumenthash.
5. **Hasher av støttedokumenter** — SHA-256 av forespørsler,
   evalueringer, utførte kontrakter, endringsordre, betalingsapplikasjoner,
   akseptskjemaer for leveranser, finansposteringer,
   signaturloggene for kontroller. Bare hasher, ikke innhold — for å
   beskytte kommersiell og personlig PII samtidig som re-hashing-
   verifisering muliggjøres.
6. **Tilsyns- og revisjonsstatus** — hvilket inspektør-general-organ
   som har jurisdiksjon, hvilken øverste revisjonsinstitusjon, hvilket
   påtaleorgan som har korrupsjons-jurisdiksjon, revisjonsfrister,
   nåværende status for eventuell pågående gjennomgang.
7. **Ledsagende offentliggjøringer og avslagsregister** — pågående
   anskaffelsesprotester, pågående interne etterforskninger,
   utestående innsynsforespørsler, avvikende gjennomganger, kjente
   budsjettlinjeoverskridelser; eksplisitt liste over mønstre settet
   nektet å forsegle.
8. **Signerende prinsipal** — ansvarlig finansembedsmann + rolle +
   lovbestemt ansvar + medsignatærer under dobbel kontroll; hva hver
   signatær personlig attesterer til og ikke attesterer til.

Hvert faktum ender med avvisningsporten-konvensjonen: *«Dette faktum
påstår bare X. Det påstår ikke Y»* (der Y er den nærmeste feilmodusen
fra «IKKE gjør»-seksjonen).

---

## Hva dette settet forsvarer mot

- **Stille tilbakevirkende revisjon av kontraktsbeløp.** Enhver endring
  i ethvert beløp i FACT 04 produserer en annen SHA-256, en annen
  Merkle-rot, og feiler OTS-verifisering.
- **Stille leverandørsubstitusjon.** Erstatning av «Leverandør A» med
  «Leverandør B» på en allerede utstedt kontrakt er oppdagbar fra de
  forseglede bytene.
- **Tilbakedatering av endringsordre.** FACT 04 fryser
  endringsordredatoen og begrunnelsen ved utstedelse; ethvert senere
  krav om at «dette var alltid det avtalte omfanget» må stå imot den
  forseglede endringsordreregistreringen.
- **Stille forsvinning av ugunstige transaksjoner.** Alle transaksjoner
  utstedt i perioden er i FACT 04 under én Merkle-rot. Publisering av
  et delsett er oppdagbar fra leaf-hash-listen.
- **Undertrykkelse av ledsagende offentliggjøringer.** FACT 07 fryser
  status for pågående protester, pågående etterforskninger og
  utestående innsynsforespørsler i attesteringsøyeblikket. Ethvert
  senere «vi hørte aldri om den protesten»-krav er offentlig diffbart.
- **Drift av revisjonsjurisdiksjon.** FACT 06 fryser hvilke organer
  som har tilsynsjurisdiksjon over de forseglede transaksjonene. Et
  senere krav om at en bestemt IG «ikke hadde myndighet» må stå imot
  den forseglede jurisdiksjonsregistreringen.
- **Sletting av avslagsregister.** FACT 07 registrerer hva settet
  nektet å forsegle; et senere «vi nektet aldri noe»-krav motsier den
  forseglede registreringen.

---

## Historiske tilfeller settet ville ha hjulpet med

Settet ville ha produsert et nyttig **forensisk anker** — *ikke en
løsning, ikke en forebygging, ikke en erstatning for strafferettslig
forfølgning* — i dokumenterte offentlige saker som omfatter stille
tilbakevirkende modifikasjon av offentlige utgiftsposter:

- **Brasil — *Operação Lava Jato* / Petrobras-linjen (2014–2021).**
  Brasilianske føderale statsadvokater dokumenterte et kartell av store
  byggefirmaer som i over et tiår betalte bestikkelser med gjennomsnitt
  ~3 % på Petrobras- og andre føderale infrastrukturkontrakter, med
  bestikkelsen rutet til politikere og til kartellets egen
  priskoordinering. Kontraktene som utstedt så rutine ut; korrupsjonen
  var oppstrøms for utstedelsen. Et forseglingssett ville IKKE ha
  forhindret Lava Jato (bestikkelsene var innebygd i prisen FØR
  kontrakten nådde forseglingen), men ville ha forankret
  kontraktsvilkårene ved utstedelse — noe som gjør den senere forensiske
  rekonstruksjonen av «hva hver kontrakt faktisk sa da den ble signert»
  enormt mye billigere. Lava Jatos etterforskningskostnad var i stor
  grad kostnaden ved å gjenforene tidslinjer fra inkonsistente
  arkiverte oppføringer.

- **Den europeiske union — disputter om regionale utviklingsfond
  (flere medlemsland, 2010-tallet–2020-tallet).** Den europeiske
  revisjonsretts årlige rapporter har gjentatte ganger identifisert
  materielle feilfrekvenser i European Structural and Investment Fund
  (ESIF) og Cohesion Fund-utgifter, noen år over vesentlighetsterskelen.
  Tvister om «hva som faktisk ble kreves» kontra «hva som faktisk ble
  levert» gjentar seg fordi kravdokumentasjon kan revideres mellom
  innsending og revisjon. Per-utstedelse MYRIAM-forsegling av kravet-
  som-innsendt ville ha forankret hvert kravs innhold ved innsending,
  og skilt «hva mottakeren krevde på det tidspunktet» fra «hva den
  etter-reviderte rekonstruksjonen konkluderte».

- **Irak — Coalition Provisional Authority (CPA) utbetalinger,
  2003–2004.** CPA utbetalte omtrent 9 milliarder USD i kontanter fra
  Development Fund for Iraq med dokumentasjon som Special Inspector
  General for Iraq Reconstruction (SIGIR) og senere revisjonsrapporter
  karakteriserte som vesentlig ufullstendig. Disputter om
  utbetalingsregistreringer vedvarer to tiår senere. Forsegling i
  utbetalingsøyeblikket ville ikke ha skapt registreringer som CPA ikke
  vedlikeholdt — men der enhver oppføring eksisterte (håndskrevne
  hovedbøker, daterte overføringsfullmakter), ville en samtidig
  forsegling ha forankret den oppføringens byte-tilstand i
  utstedelsesøyeblikket, og skilt «registreringen på det tidspunktet»
  fra «registreringen som senere rekonstruert».

- **Hellas — revisjoner av statsgjeld og rapportering av offentlige
  utgifter (2009–2010).** Eurostat-revisjoner i 2009–2010
  dokumenterte betydelige revisjoner av tidligere rapporterte greske
  finansdata, med selve revisjonsmetodikken omstridt. Forsegling av
  kvartalsvise utgiftsrapporter i øyeblikket for opprinnelig
  publisering ville ha gjort *deltaet* mellom opprinnelige og reviderte
  rapporter offentlig diffbart i stedet for bare rekonstruerbart
  gjennom arkivsammenligning. Forseglingen ville ikke ha forhindret
  den underliggende metodikkdisputen, men ville ha forankret hvert
  rapportert kvartal i øyeblikket for den opprinnelige rapporten.

- **Storbritannia — pandemisk anskaffelse (2020–2022).** UK National
  Audit Office og parlamentariske komitérapporter identifiserte
  anskaffelsesprosesser i 2020–2021 der kontrakter ble tildelt under
  nødbestemmelser med redusert konkurranse og redusert dokumentasjon;
  noen tildelinger ble senere modifisert, annullert eller forlikt.
  Per-utstedelse forsegling av hver nødanskaffelses-tildeling ville ha
  forankret tildelingens begrunnelse og vilkår i tildelingsøyeblikket,
  noe som gjør senere modifikasjoner til et offentlig synlig delta
  i stedet for en stille modifisert oppføring.

- **Sør-Afrika — statskapring-æraens kontrakter for offentlige
  selskaper (~2010–2018).** Zondo-kommisjonen dokumenterte kontrakter
  hos flere statseide selskaper (Eskom, Transnet, Denel) hvis
  dokumentasjon var ulikt ufullstendig, revidert eller omstridt.
  Forsegling av hver kontraktstildeling ved utstedelse ville ha
  forankret den som-tildelt-tilstanden av oppføringen, og skilt
  senere forensiske rekonstruksjonsutdata fra den samtidige
  oppføringen.

Settet ville IKKE ha forhindret den underliggende korrupsjonen i noen
av tilfellene ovenfor. I flere tilfeller var det underliggende
problemet at korrupsjonen var *oppstrøms av utstedelsen* — forseglingen
forankrer den korrupte kontrakten med høy integritet, noe som er en
annen type nyttighet (forensisk anker for senere ansvarliggjøring), men
ikke det samme som forebygging. I andre tilfeller (CPA-kontanter,
utenombudsjettmessige utgifter) var det underliggende problemet at
oppføringene som ble forseglet ikke eksisterte eller ikke ble
vedlikeholdt — settet kan ikke skape oppføringer som myndigheten ikke
produserte.

Disse historiske tilfellene navngis kun med referanse til offentlig
dokumenterte funn (rettsdokumenter, parlamentariske komitérapporter,
revisjonsorganpublikasjoner). Ingen påstand fremsettes om noen
enkeltperson; de dokumenterte institusjonelle funnene står på det
offentlige registeret.

---

## Når man bør bruke dette settet

- Jurisdiksjonen din har en etablert prosess for
  budsjettutførelses-rapportering og ønsker å legge til et uforanderlig
  offentlig anker.
- Du forventer gransking etter utstedelse (innsynsforespørsler,
  revisjon, sivilsamfunns-overvåking, journalistisk etterforskning) og
  ønsker et tukling-tydelig referansepunkt.
- Du har lovhjemmel under transparens-/innsynslov til å publisere det
  oppgitte faktasettet, med de respektive personvern- og
  sikkerhetseksklusjonene ivaretatt.
- Du opererer under et lovbestemt revisjonsregime (inspektør general,
  øverste revisjonsinstitusjon) og ønsker å forankre hver kvartalsvise
  avslutning før revisjonssyklusen når den.
- Du publiserer under Open Contracting Data Standard eller IATI og
  ønsker et kryptografisk supplement til portal-basert publisering.

## Når man IKKE bør bruke dette settet

- **Ikke bruk som erstatning for lovbestemt revisjon, inspektør-general-
  gjennomgang, påtaleundersøkelse eller sivilsamfunns-overvåking.**
  Settet er *additivt*, ikke en erstatning.
- **Ikke bruk som legitimitetssertifikat.** En forseglet utgiftsoppføring
  er ikke et korrupsjonsfritt-sertifikat. Å behandle det som det er
  nettopp den feilmodusen settets begrensning-først-struktur eksisterer
  for å hindre.
- **Ikke bruk midt i perioden.** Settet er for øyeblikket for formell
  utstedelse (kvartalsvis avslutning, kontraktstildeling,
  milepælsutbetaling). Forseglinger midt i perioden skaper villedende
  referansepunkter.
- **Ikke bruk for å hevde at utgiften var lovlig, rettferdig eller
  ikke-korrupt** — settet kan ikke gjøre det.
- **Ikke bruk til å forsegle klassifiserte utgifter, individuell
  ansatt-PII eller leverandør-kommersiell-PII.** Settet nekter disse
  mønstrene; forsøk skaper en avslagsoppføring (FACT 07).
- **Ikke bruk til å forsegle utkast før utstedelse.** Utkast kan
  forsegles under en annen attesteringstype («utkast til kommentar,
  ikke utstedt»), men ikke under dette settets utstedelsestype.
- **Ikke bruk under press for å utelate FACT 07-offentliggjøringer.**
  Nekt, og forsegle avslaget.
- **Ikke bruk hvis finansmyndigheten din er fanget.** En forseglet
  bedragersk utgift er en permanent offentlig registrering av
  bedrageriet, ikke et forsvar av det. Primitiven skjærer begge veier;
  det er dens ærlighet.

---

## Hvordan forke dette settet for en virkelig attestering

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Kritisk timing:** forsegle PÅ tidspunktet for formell utstedelse —
dvs. øyeblikket den ansvarlige finansprinsipalen signerer den
kvartalsvise avslutningen, øyeblikket en kontrakt formelt tildeles,
eller øyeblikket en utbetaling formelt utstedes. En forsegling før
formell utstedelse skaper en falsk-positiv «dette er den offisielle
oppføringen»-referanse. En forsegling lenge etter formell utstedelse er
forensisk svakere mot mellomliggende modifikasjoner.

**Kadens:** settet er designet for kvartalsvise attesteringer som
standard. Under-kvartalsvise kadenser (månedlig avslutning,
per-transaksjon-forsegling) støttes ved å kjøre på nytt med passende
omfang; forsegling av en enkelt høyverdig transaksjon er en legitim
bruk.

---

## Integrasjon med eksisterende offentlig-finans-infrastruktur

Settet er designet for å sammensettes med, ikke erstatte:

- **Open Contracting Data Standard (OCDS) v1.1.5.** De fem
  publikasjonspunktene (planlegging, anbud, tildeling, kontrakt,
  implementering) kartlegges naturlig til FACT 03 (planlegging →
  bevilgning), FACT 04 (anbud, tildeling, kontrakt, implementering →
  transaksjonsmanifest) og FACT 05 (hasher av støttedokumenter). Selve
  OCDS JSON-eksporten forsegles i FACT 05 (kontrolldokumenter). En
  jurisdiksjon som kjører OCDS-publisering kan legge til
  MYRIAM-forsegling som et kryptografisk lag oppå sin eksisterende
  portal.

- **International Aid Transparency Initiative (IATI)-standard v2.03.**
  For utgifter finansiert helt eller delvis av ekstern bistand, kan
  IATI XML forsegles som et kontrolldokument; forseglingen gir et
  kryptografisk supplement til IATI-registerets HTTP-baserte
  publikasjonsmodell.

- **Open Government Partnership (OGP)-forpliktelser.** OGP National
  Action Plans inkluderer ofte finansielle transparensforpliktelser;
  MYRIAM-forsegling operasjonaliserer en «tukling-tydelig publisering»-
  forpliktelse på en måte som er uavhengig verifiserbar av
  sivilsamfunnet uten å kreve tillit til regjeringens portal.

- **OECDs anbefaling om offentlig integritet (2017).** Settet støtter
  Anbefaling 4 (åpne regjeringsdata om offentlige finanser i
  maskinlesbar, tidsriktig form) ved å gjøre dataene kryptografisk
  forankret i tillegg til maskinlesbare.

- **UN Convention against Corruption (UNCAC), særlig artiklene 9
  (anskaffelse) og 13 (samfunnsdeltakelse).** Settet tilbyr en
  forensisk primitiv som støtter Artikkel 9 transparenskrav og Artikkel
  13 sivilsamfunns-tilsyn.

- **Supreme Audit Institutions (SAIs) — INTOSAI-rammeverket.** SAIer
  som opererer under INTOSAI-standarder (ISSAI) kan konsumere
  forseglede publikasjoner som bevis med høy integritet; SHA-256-hashene
  i FACT 05 er de samme hashene som SAIs e-revisjonsverktøy kan
  beregne på nytt.

- **Inspektør-general-kontorer.** Innenlandske IG-kontorer med
  jurisdiksjon over de forseglede utgiftene (FACT 06) kan innkalle
  dokumentkroppene hvis hasher forsegles i FACT 05; forseglingen binder
  dokumentkroppene mottatt under innkalling til kroppene som
  eksisterte ved utstedelse.

- **Innsyns- og åpenhetsstatutter.** Forseglingen fritar ikke den
  utstedende myndigheten fra fortsatte innsynsforpliktelser; faktisk
  gjør den selektiv innsynsbesvarelse oppdagbar som en avvik fra den
  forseglede oppføringen. FACT 07 C3 forankrer utestående
  innsynsforespørsler ved attesteringstidspunktet.

- **Reelt-eierskap-registre (FATF Recommendation 24, EU
  AML-direktiver, US Corporate Transparency Act).** Reelt-eierskap-data
  forsegles IKKE under dette settet (FACT 04 henter leverandøridentitet
  fra registrert juridisk enhetsnavn bare). En offentliggjøring av
  reelt eierskap er et separat forseglingsregime som kan produsere en
  parallell publisering referert med Merkle-rot.

- **Rettsadministrert transparens (rettslig utgiftsrapportering,
  aktivagjenvinningsprosesser).** Utdata fra korrupsjonsrelaterte
  rettsprosesser ligger ikke innenfor dette settets omfang, men kan
  forsegles under parallelle attesteringstyper.

## Hva dette settet IKKE erstatter

- Lovbestemt budsjettutførelses-revisjon av inspektør-general-organer
- Øverste-revisjons-institusjons-gjennomgang (GAO, NAO, TCU, CAG, AGN,
  BRH, Cour des comptes, tilsvarende)
- Påtaleundersøkelse av korrupsjonsforbrytelser (nasjonale
  antikorrupsjonsmyndigheter, UNCAC Artikkel 36-organer)
- Sivilsamfunns- og journalistisk etterforskningsrapportering
- Varslerkanaler og beskyttede-avsløringsregimer
- Reelt-eierskap-offentliggjøring
- Internasjonal fagfellevurdering (OECD, IMF Fiscal Transparency
  Evaluation, EU-semesteret, IATI-registeret)
- Rettsadministrerte aktivagjenvinningsprosesser

Forseglingen er en forensisk primitiv som senker kostnaden og øker
påliteligheten for alle de ovennevnte. Den er ikke, og kan ikke være,
en erstatning for noen av dem.

---

## Lisens

Public domain (CC0). Fork det. Ingen attribusjon kreves.
