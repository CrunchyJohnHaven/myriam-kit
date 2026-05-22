*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Forseglingskit til attestation af forsyningskædes-revision

Et nøglefærdigt myriam-kit-eksempel for tredjeparts sociale/arbejds-/
miljømæssige revisorer, interne leverandør-compliance-teams,
NGO-forsyningskæde-efterforskere og arbejderretsorganisationer, der ønsker at
publicere en Bitcoin-forankret, manipulationsafslørende forsegling af en
revisionsrapport i det nøjagtige øjeblik, hvor den underskrives.

---

## Hvad dette kit IKKE gør (læs først)

Forseglingen er et kryptografisk tidsstempel af det, revisoren underskrev.
Den kan ikke verificere, om det underskrevne er **sandt**. Følgende
fejlmoduser ligger **uden for forseglingens domæne**:

1. **Revisions-kapring foretaget af industrien.** Brand-kommissionerede
   revisioner har en lang, dokumenteret historie med at producere milde
   fund hos leverandører, hvis fortsatte forretningsforhold med det
   kommissionerende brand holder revisionspipelinen i gang. En kapret
   revision, når den forsegles, producerer en permanent retsmedicinsk
   optegnelse af den kaprede revision. Forseglingen korrigerer ikke
   kapring — den gør blot revisionen-som-udstedt uforanderlig, så en
   senere sandhedsfindings-proces har noget konkret at sammenligne med.

2. **Coachede arbejdere / forberedte faciliteter.** Annoncerede eller
   semi-annoncerede revisioner giver ledelsen dage eller uger til at
   indøve arbejdersvar, skjule mindreårige arbejdere, rydde sovesale,
   fjerne ikke-konformt udstyr og omdirigere arbejde til ikke-reviderede
   underleverandører i revisionsvinduet. Forseglingen forankrer det,
   revisorerne blev vist, ikke det, de blev forhindret i at se.

3. **Skjult underentreprise.** Tier-2- og Tier-3-underentreprise,
   hjemmearbejde og uformel-sektor-produktion er gennemgribende
   usynlige for fabriksgulvs-revisioner. Forseglingen forankrer en
   Tier-1-revision; den kan ikke opdage, at Tier-1 outsourcer til en
   urevisioneret Tier-2 i revisionsvinduet eller rutinemæssigt.

4. **Revisioner, der systematisk overser de overgreb, de er rettet imod.**
   Rana Plaza, sammenbruddet af tekstilfabriksbygningen i Bangladesh
   i 2013, der dræbte 1.134 arbejdere, var blevet revideret af flere
   brand-kommissionerede revisionsprogrammer i månederne forinden.
   Revnerne i bygningen var ikke på den sociale revisions tjekliste;
   revisionsregimet havde intet omfang for bygningsteknisk vurdering.
   Revisioner forankrer det, der er *inden for omfang*; overgreb uden
   for omfanget forbliver usynlige, uanset hvor manipulationsafslørende
   forseglingen er.

5. **Hævn efter underskrift mod arbejdere, der deltog i interviews.**
   Selv med afvist lokaliseringsinformation (FACT 07 R3) kan en
   målbevidst modstander, der kender leverandør-ID'et, identificere
   faciliteten. Arbejderbeskyttelse kræver mere end blot at afvise PII
   i forseglingen — den kræver anonymisering opstrøms for
   revisionsmetodologien. Forseglingen gør revisionen-som-udstedt
   varig; den beskytter ikke interviewdeltagere retroaktivt.

6. **Arbejdervilkår, der er lovlige, men umenneskelige.** Levelønsgab
   i jurisdiktioner, hvor lovbestemt mindsteløn ligger under
   levelønsbenchmarken, producerer "compliant" revisionsfund mod
   løn- og arbejdstidslove og "ikke-compliant" fund mod
   levelønsstandarder i samme revision (FACT 03 element 8 i dette
   eksempel-kit). Forseglingen forankrer det, hver standard rapporterer;
   at forene dem er nedstrøms policy-arbejde.

7. **Klima-/miljøskade med diffus kausalitet.** CO2-emissioner,
   skovrydningsbidrag, vandudtømning og forurenende udslip fra
   leverandører kan forsegles i revisionsfund, men kausal tilskrivning
   til et bestemt brands ordrevolumen er metodologisk omstridt.
   Forseglingen forankrer det, der blev målt hos leverandøren; den
   tildeler ikke moralsk eller juridisk ansvar.

8. **Stridigheder om, hvilken standard der er autoritativ.** SA8000 vs.
   BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs.
   virksomhedsspecifik adfærdskodeks: hver har forskellige omfang,
   alvorligheder og remedieringsprocesser. Forseglingen forankrer *én*
   revision under *én* standard. Sammenligning på tværs af standarder
   er et nedstrøms problem.

9. **Revisors kompetence vs. revisors legitimation.** "Legitimeret" er
   ikke "kompetent." Revisorer, der har gennemført akkrediterede
   uddannelsesprogrammer, har overset alvorlige overgreb i revisioner,
   der gik forud for offentligt synlige katastrofer. Forseglingen
   forankrer legitimationer; den certificerer ikke kompetencen, hvormed
   de blev udøvet.

**Afsnittet om ærlige begrænsninger ovenfor er den bærende del af dette kit.**
Et brand, der ønsker legitimitetsteater, vil bruge en forseglet revision
som et skjold. Kittet skal sige tydeligt: dette er en *ikke-afvisnings-
primitiv for revisionsrapportens underskriftsøjeblik*, ikke et bevis
på leverandør-compliance eller arbejdervelfærd.

---

## Hvad dette kit SKAL AFVISE at forsegle

Kittet er konfigureret til at afvise følgende kendsgernings-mønstre,
selv hvis en bruger med gyldig revisionsorgan-autoritet indsender dem:

- **Individuel arbejderidentifikation.** Ingen kendsgerning må navngive
  en arbejder, knytte et citat til en arbejder, eksponere badgenummer,
  linjeposition, soveværelse, vagtplan, demografisk kombination med
  N<5 eller noget felt, der kunne reidentificere en person, der
  deltog i interviews. Arbejdercitater bruger randomiserede tokens;
  tilordningen forsegles aldrig.
- **Whistleblowere / informant-kilder.** Hvis et fund hviler på
  afsløring fra en person, der tog risiko for at afsløre, navngives
  eller identificeres personen aldrig i den forseglede publikation.
- **Præcis lokaliseringsinformation.** Ingen gadeadresse, GPS,
  satellitbillede >1km opløsning eller eksternt bygningsfotografi.
  Land og region er den maksimale opløsning, der forsegles. Begrundelse:
  facilitetsidentifikation muliggør hævn mod interviewdeltagere.
- **Påstand om ren revisionscertificering.** Kittet afviser at forsegle
  enhver indramning af formen "denne revision beviser, at leverandøren
  er compliant" eller "ingen overtrædelser eksisterer". Rene-påstande
  er erkendelsesteoretisk uden støtte i revisionsmetodologi.
- **Forsegling-som-certifikat-substitution.** En publikation, der
  udelader metodologi (FACT 04), uafhængighed (FACT 06) eller
  afvisninger (FACT 07), er ikke en legitim MYRIAM-publikation under
  dette kit.
- **Udkast- / præ-underskrifts-revisioner.** Forsegling sker ved
  underskrift, ikke før. Provisoriske revisioner skaber falsk
  sikkerhed.
- **Post-hoc gunstig genforsegling.** En revideret revision kræver en
  NY forseglet publikation, der refererer til originalen via Merkle-rod.
  Den oprindelige forseglede revision forbliver permanent synlig som
  revisionen-som-udstedt.
- **Forsegling foretaget af nogen anden part end revisionsorganet.** Et
  brand, en leverandør, et certificeringsorgan eller en tredjepart kan
  ikke forsegle "revisionen" i stedet for det revisionsorgan, der
  underskrev rapporten.

En afvisning kan i sig selv forsegles som en kendsgerning ("Denne part
anmodede om forsegling af X; kittet afviste i henhold til afvisningsregel Y"),
hvorved der skabes en offentlig optegnelse af forsøgt misbrug. **I en
branche med udbredt revisions-kapring kan afvisning-at-forsegle i sig
selv være et meningsfuldt signal:** et revisionsorgan, der ikke vil
forsegle, fordi et brand pressede på for opblødning af fund, har
muligheden for offentligt at dokumentere afvisningen under sin egen
principal.

---

## Hvad dette kit FAKTISK forsegler

8 kendsgerninger i øjeblikket for revisions-underskrift:

1. **Eksempelnotits** — erklærer publikationen som et eksempel (rigtige
   attestationer fjerner eller erstatter denne).
2. **Revisionsomfang og -genstand** — revisionsstandard, revisionsorgan,
   leder-revisor, revisionsteamets størrelse, leverandøridentifikator
   (ingen præcis lokaliseringsinformation), revisionsvindue,
   varslingstype (annonceret / semi-annonceret / uannonceret),
   revisionsrapport-dato, underskriftsversion, navngivne modtager-
   brands, kommissionerende part.
3. **Revisionsfund-manifest** — pr.-element konformitet / mindre-NC /
   større-NC / kritisk-NC mod standarden, hver med en SHA-256 af det
   fulde fund-skriv. Aggregerede totaler. Certificeringsanbefaling
   ved underskrift.
4. **Metodologi og bevis** — on-site tidsallokering, interview-
   optællinger (med stratificering: køn, migrant-status, anciennitet),
   interviewformat-fordeling, tolkerelation, dokumentgennemgang med
   stikprøvestørrelser og indholds-hashes, on-site-besøgsartefakter
   (med arbejderansigter slørede), kendte metodologi-begrænsninger.
5. **Forpligtede korrigerende handlinger** — pr. større-NC og pr.
   mindre-NC CAP med angivet grundårsag, frist, verifikationsmekanisme,
   eskaleringsforpligtelser, ingen-stille-opblødning-forpligtelse.
6. **Revisor-kvalifikationer og uafhængighed** — revisionsorganets
   akkreditering, kundekoncentration, leder-revisors legitimationer
   og sprogkompetence, sektorerfaring, uafhængighedserklæringer
   (revisor-leverandør, revisor-brand, certificeringsorgan-
   separation).
7. **Ledsagende offentliggørelser og afvisningsregister** —
   interessekonflikter (eksplicit), tidligere revisionshistorik,
   arbejderstemme-kanaler kommunikeret, parallelle undersøgelser,
   revisionsorganets interne dissens, afvisningsregler-liste,
   afvisninger faktisk påberåbt under denne revision.
8. **Underskrivende principal** — revisionsorgan, leder-revisor,
   revisionsteam, autoriserende embedsmand, kryptografisk
   nøgleinformation.

Hver kendsgerning ender med afvisningsporten-konventionen: *"Denne
kendsgerning hævder kun X. Den hævder ikke Y"* (hvor Y er den nærmeste
fejlmodus fra "GØR IKKE"-afsnittet).

---

## Hvad dette kit forsvarer imod

- **Stille opblødning af større ikke-konformiteter efter underskrift.**
  Enhver ændring af FACT 03 (f.eks. en MAJOR_NC reklassificeret til
  MINOR_NC eller et fund slettet helt) producerer en anderledes
  SHA-256, en anderledes Merkle-rod, fejler OTS-verifikation.
- **Tilbagedatering af lukninger af korrigerende handlinger.** FACT 05
  fryser CAP og dens frister ved underskrift; enhver "vi lukkede den
  NC sidste måned"-påstand, der strider mod de forseglede frister, er
  offentligt diff-bar.
- **Metodologi-revisionisme.** FACT 04 fryser interview-optællinger,
  dokument-stikprøvestørrelser og on-site-timer ved underskrift — hvilket
  forhindrer den senere "vi udførte en dybdegående undersøgelse"-
  forsvarsbrug i at være uforfalskelig.
- **Selektiv genpublikation, der udelader ufordelagtige fund.** Alle 8
  kendsgerninger er bundet af én Merkle-rod; citering af nogle
  kendsgerninger, mens andre udelades, kan opdages fra den publicerede
  blad-liste.
- **Uafhængighedspåstand-drift.** FACT 06 fryser
  uafhængighedserklæringerne pr. underskrift. En senere "denne revision
  var rigorøst uafhængig"-påstand må forholde sig til den forseglede
  kundekoncentrations-procent og den forseglede brand-betalte
  kommissioneringsoffentliggørelse.
- **Sletning af afvisningsoptegnelse.** FACT 07 fryser, hvilke
  kendsgernings-mønstre kittet afviste; enhver senere "vi har aldrig
  afvist noget"-påstand modsiger den forseglede optegnelse.

---

## Historiske eller næsten-historiske sager, kittet ville have hjulpet i

Kittet ville have produceret et nyttigt **retsmedicinsk anker** — *ikke
en løsning eller forebyggelse* — i sager, der involverede:

- **Rana Plaza (Bangladesh, 2013).** Sammenbruddet af Rana Plaza-bygningen
  dræbte 1.134 tekstilarbejdere og kvæstede ~2.500. Flere brands, hvis
  produkter blev fremstillet i bygningen, havde revideret Tier-1-
  leverandører i bygningen kort tid før sammenbruddet. Revisionerne
  brugte sociale revisions-tjeklister, der ikke inkluderede
  bygningsteknisk omfang. En forseglet metodologi-kendsgerning (FACT 04)
  ved hver af disse revisioner ville have gjort *omfangsgabet* offentligt
  synligt ved underskrift — og forankret den dokumenterede begrænsning,
  som revisionsprogrammer retroaktivt hævdede ikke at have haft.
  Forseglingen ville ikke have forhindret sammenbruddet. Den ville have
  forhindret brancheindrømmelsen efter sammenbruddet om, at "ingen vidste",
  i at være erkendelsesteoretisk holdbar.

- **Apple / Foxconn-revisioner (2010'erne).** Flere iterationer af
  revisionsrapporter på Foxconn-faciliteter, der producerede for Apple,
  blev publiceret med varierende niveauer af fund-alvorlighed,
  arbejder-selvmords-klynge-kontekst og remedieringspåstande. En
  forseglet optegnelse af underskriftsøjeblikket for hver revision
  ville have forhindret senere stridigheder om, "hvad revisionen sagde
  på det tidspunkt", i at afhænge af arkivkopier, lækkede kopier eller
  reviderede officielle udgivelser.

- **Kobolt fra DRC (igangværende).** Artisanal koboltminedrift i Den
  Demokratiske Republik Congo, herunder af børn, indgår i batteri-
  forsyningskæder for store elektronik- og EV-brands. Flere brand-
  kommissionerede revisioner over perioden 2017–nu har produceret
  fund af varierende alvorlighed. Kittet anvendt på hver revision ved
  underskrift ville have forankret revisionen-som-udstedt; kittet
  anvendt på ledsagende-offentliggørelses-kendsgerninger (FACT 07 C2:
  tidligere revisionshistorik) ville have gjort hver efterfølgende
  revisors metodologiske arv af tidligere gab offentligt synlig.

- **Konfliktmineraler (tin, tantal, wolfram, guld fra DRC og
  Storsø-regionen).** Dodd-Frank §1502 producerede revisions-og-
  offentliggørelses-forpligtelser under SEC-regel 13p-1. Stridigheder
  om tilstrækkeligheden af smelter-niveau-revisioner og nedstrøms
  forvaringskæde-verifikation gentog sig over perioden 2014–2022.
  Pr.-revision MYRIAM-forseglinger ville have forankret hver
  smelter-revision ved underskrift.

- **Brand-kommissionerede revisioner af Xinjiang-bomulds-forsyningskæder
  (2018–nu).** Stridigheder om, hvorvidt revisioner kunne udføres
  pålideligt under PRC-regeringens restriktioner på revisor-adgang,
  dukkede bredt op efter 2020. En forseglet metodologi-kendsgerning
  (FACT 04) ved hver revision ville have forankret, hvilke
  adgangsbetingelser der faktisk gjaldt — hvilket gjorde "vi udførte
  en rigorøs revision"-senere-påstande diff-bare mod forseglede
  metodologi-begrænsninger på tidspunktet.

- **Foxconn-underentreprise og Apple-leverandøransvars-rapporter i
  2010'erne — gentagne opdagelser af mindreårige arbejdere, skjulte
  sovesale, timeovertrædelser.** Pr.-revisions-forseglinger ville have
  forankret de *negative fund* i revisioner, der ikke fandt noget, ved
  siden af de *positive fund* i revisioner, der fandt overtrædelser —
  hvilket forhindrer retrospektiv narrativ-cherry-picking fra begge
  retninger.

Kittet ville IKKE have forhindret nogen af disse. I flere tilfælde var
det underliggende problem, at revisionen *overså* overgrebet — at
forsegle en ren revision, der burde have fundet overtrædelser, producerer
en permanent optegnelse af en mislykket revision, hvilket er en anden
slags nyttighed (den forankrer fejlen for senere ansvarliggørelse), men
ikke det samme som forebyggelse.

---

## Hvornår man bør bruge dette kit

- Du er et revisionsorgan, der adopterer en "publicer det, vi
  underskrev"-praksis som et forsvar mod opblødningspres efter
  underskrift.
- Du er en NGO, der kører en parallel forsyningskæde-undersøgelse og
  ønsker et manipulationsafslørende referencepunkt i øjeblikket, hvor
  din undersøgelse afsluttes.
- Du er en arbejderretsorganisation, der har erhvervet en
  revisionsrapport og ønsker at forankre dens nuværende indhold, før
  revisionsorganet eller brandet har chancen for at revidere den.
- Du er et brand, der er forpligtet til transparens om revisioner, du
  har kommissioneret, og du ønsker en verificerbar retsmedicinsk
  optegnelse.
- Du er en journalist, regulator eller domstol, der forankrer en
  bestemt revisions indhold på et bestemt tidspunkt til senere
  retssag eller rapportering.

## Hvornår man IKKE bør bruge dette kit

- **Brug det ikke som en erstatning for arbejderledet overvågning,
  uafhængige NGO-undersøgelser eller arbejderorganisering.** Kittet er
  *additivt*, ikke en erstatning for nogen af disse.
- **Brug det ikke til at hævde, at en leverandør er compliant.** En ren
  forseglet revision er i bedste fald ét input til en compliance-
  vurdering. At behandle en forseglet revision som et compliance-
  certifikat er præcis det legitimitetsteater, som
  begrænsnings-først-afvisningsreglerne eksisterer for at forhindre.
- **Brug det ikke midt under revision.** Forsegling før underskrift
  skaber en falsk-positiv "dette er den endelige revisionsrapport"-
  optegnelse.
- **Brug det ikke til at forsegle et udkast, du har til hensigt at
  revidere.** Hver underskriftsversion får sin egen forsegling;
  revisioner refererer til originaler via Merkle-rod.
- **Brug det ikke under pres for at forsegle tidligere end underskrift,
  eller for at udelade en ledsagende-kendsgernings-offentliggørelse.**
  Afvis, og (hvis din principal tillader det) forsegle afvisningen.
- **Brug det ikke som grundlag for en "fair trade"- eller "etisk
  sourcing"-markedsføringspåstand uden at offentliggøre den forseglede
  metodologis begrænsninger ved siden af forseglingen.** At citere
  forseglingen uden at citere begrænsningerne er
  legitimitetsteater-fejlmodusen, der definerer revisions-kapring.
- **Brug det ikke, hvis dit revisionsorgan er strukturelt kapret og
  ikke kan publicere fund mod det kommissionerende brands kommercielle
  interesse.** I så fald producerer forsegling en permanent offentlig
  optegnelse af den kaprede revision. Det kan stadig være værdifuldt
  — men det er ikke det samme som at forsvare sig mod kapring.

---

## Sådan forker du dette kit til en reel revision

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Kritisk timing:** forsegl VED underskriftsøjeblikket — dvs. når
leder-revisoren underskriver den endelige rapport, og den bliver
revisionsorganets officielle position. En forsegling før underskrift
skaber en falsk-positiv "dette er den endelige revision"-optegnelse. En
forsegling længe efter underskrift er retsmedicinsk svagere mod
mellemliggende modifikationer.

---

## Integration med eksisterende forsyningskæde-revisions-infrastruktur

Kittet er designet til at komponere med, ikke erstatte:

- **SA8000 (Social Accountability International).** SA8000-
  revisionsrapporter og CAP-dokumenter afbildes naturligt på FACT 03 +
  FACT 05. SAAS-akkrediteringsreferencen passer FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** RBAs revisionsfund afbildes på FACT 03; RBAs
  revisionsfirma-uafhængighedsregler afbildes på FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** SMETAs 2-pillar- og
  4-pillar-revisionsfund afbildes på FACT 03; Sedex-platformen hoster
  rårapporten — MYRIAM-forseglingen forankrer en indholds-hash af den
  platform-hostede rapport.
- **amfori BSCI.** BSCI A–E rating-mekanik afbildes på FACT 03
  certificeringsanbefaling; brand-medlemskabs-kommissionering afbildes
  på FACT 06 kundekoncentrations-offentliggørelse og FACT 07 C1.
- **FSC chain-of-custody.** For skovprodukt-forsyningskæder passer
  chain-of-custody-certifikater og re-revisionsplaner til
  revisionsvindue- og CAP-strukturen.
- **B Lab / B Corp impact assessment.** B Corps certificering er ikke
  en tredjeparts revision i SA8000-forstand, men impact-vurderingens
  verifikator-rapporter kan forsegles under dette kit (med
  kendsgerninger re-scoped til impact-vurdering snarere end
  arbejds-revision).
- **ISO 26000.** ISO 26000 er vejledning, ikke certificerbar; kittet
  har ingen direkte ISO 26000-revisionsrapport-integration, men
  social-ansvars-taksonomien kan informere FACT 03 element-struktur
  for interne revisioner.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  andre branche-sektor-regimer).** Sektor-specifikke
  revisionsprogrammer kan forsegles under dette kit; FACT 02
  revisionsstandard-feltet identificerer hvilken.
- **Fair Labor Association.** FLA-fabriksovervågnings-rapporter
  afbildes på FACT 03 + FACT 05; FLAs uafhængig-monitor-rammeværk
  afbildes på FACT 06 uafhængighedserklæringer.
- **Higg Index (Sustainable Apparel Coalition).** Facilitets-niveau
  Higg FEM (Facility Environmental Module) og Higg FSLM (Facility
  Social & Labor Module) output kan forsegles under dette kit.
- **EU CSRD / CSDDD.** EUs Corporate Sustainability Reporting
  Directive og Corporate Sustainability Due Diligence Directive
  skaber offentliggørelsesforpligtelser, hvis verifikationsdokumenter
  kan forsegles under dette kit. Kittet forankrer
  offentliggørelsen-som-udstedt, ikke dens substantielle
  tilstrækkelighed.

## Hvad dette kit IKKE erstatter

- Arbejderledet overvågning (det mest pålidelige
  overgrebs-detektions-signal i enhver forsyningskæde)
- Uafhængige NGO-undersøgelser (CCC, Labour Behind the Label, China
  Labour Bulletin, Workers' Rights Consortium, osv.)
- Regulatorisk inspektion (nationale arbejdsbureauer, OSHA-
  ækvivalenter, ILO Country Office-programmer)
- Arbejderorganisering og kollektiv forhandling
- Retssag, voldgift og remediering under national arbejdsret
- Brand-side due-diligence-rammeværk (UNGP, OECD Due Diligence
  Guidance, EU CSDDD)

## Licens

Public domain (CC0). Fork det. Ingen attribution kræves.
