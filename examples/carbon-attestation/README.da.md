*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Forseglingskit for kulstof-attestation

Et nøglefærdigt myriam-kit-eksempel for kulstofprojektudviklere,
tredjeparts-verifikatorer og registre, der ønsker at offentliggøre en
Bitcoin-forankret, manipulationspåvisende forsegling af en
kulstofkreditudstedelse, en fjernelses-verifikation eller en
emissions-attestationsbegivenhed i det præcise
certificeringsøjeblik — således at tavse modifikationer efter
udstedelse bliver offentligt påviselige.

---

## Hvad dette kit IKKE gør (læs først)

Kulstofkreditter er politisk og videnskabeligt bestridte. Forseglingen
er et kryptografisk tidsstempel af det, der blev attesteret. Den kan
ikke verificere, om det, der blev attesteret, afspejler en reel
klimagevinst. Følgende fejltilstande ligger **uden for forseglingens
domæne**, og de dækker de fleste af de meningsfulde
integritetsspørgsmål om kulstofkreditter:

1. **Additionalitet.** Forseglingen kan ikke verificere, at den
   krediterede aktivitet ikke ville være sket uden kulstoffinansiering.
   Det kontrafaktiske er i princippet uobserverbart. Forseglingen
   registrerer metodologiens additionalitetsargument; den dømmer det
   ikke.

2. **Permanens.** Forseglingen kan ikke verificere, at sekvestreret
   kulstof forbliver sekvestreret over den relevante tidshorisont
   (årtier til århundreder for skovkulstof, geologiske tidsskalaer
   for nogle fjernelser). Nyere litteratur (Badgley et al. 2022,
   Patterson et al. 2022) viser, at bufferpuljer er blevet væsentligt
   udtømt af reelle reverseringsbegivenheder. En forseglet kredit er
   en forseglet *påstand* om permanens under specificerede
   bufferpulje-antagelser, ikke et bevis på permanens.

3. **Lækage.** Forseglingen kan ikke verificere, at undgåede
   emissioner i projektområdet ikke blot forskydes til et
   ikke-projektområde. Metodologi-standard-lækagefradrag er
   regulatoriske pladsholdere, ikke målinger. Forseglingen forankrer
   det anvendte fradrag; den certificerer det ikke som korrekt.

4. **Sidegevinster.** Forseglingen kan ikke verificere påstande om
   samfundsudvikling eller biodiversitet. Sidegevinster er typisk
   selv-erklærede og verifikator-gennemgåede, ikke revideret med
   samme dybde som kulstofkvantificering. Forseglingen forankrer
   dokument-hashes; intet mere.

5. **Tilstrækkelighed af frit, forhåndsoplyst samtykke (FPIC).**
   Oprindelige folks og lokalsamfunds samtykke i kulstofprojekter har
   en dokumenteret historie med fejltilstande (tvunget samtykke,
   samtykke fra ikke-repræsentative organer, post-hoc-"samtykke"
   gennem kompensation). Forseglingen forankrer FPIC-dokumentation og
   klage-log-hashes; den kan ikke certificere, at samtykkeprocessen
   var ægte.

6. **Verifikators uafhængighed.** Verifikatorer betales af
   projektudviklere. Dette er en strukturel interessekonflikt, som
   ingen akkrediteringsordning har løst. Forseglingen forankrer
   verifikators uafhængighedserklæring; den certificerer ikke, at
   erklæringen er sand.

7. **Dobbeltoptælling på tværs af registre eller med nationale
   opgørelser.** Forseglingen forankrer øjebliksbilledet af
   registertilstanden ved attestationstidspunktet. Hvis den samme
   aktivitet også optælles af et værtsland mod dets NDC, eller også
   påstås på et andet register, gør forseglingen registertilstanden
   diff-bar, men forhindrer ikke dobbeltoptællingen.

8. **Køberens påstands korrekthed.** En køber, der pensionerer en
   forseglet kredit for at understøtte en "netto-nul"- eller
   "kulstofneutral"-påstand, fremsætter en nedstrøms påstand, som
   forseglingen ikke dækker. Forseglingen registrerer pensioneringen;
   gyldigheden af køberens markedsføringspåstand er et separat,
   nedstrøms spørgsmål.

9. **Metodologisk korrekthed.** Forseglingen registrerer
   metodologi-citationen + dokument-hashen i kraft ved
   attestationstidspunktet. Den hævder ikke, at metodologien er
   videnskabeligt gyldig. Metodologireform sker; at forsegle under en
   metodologi, der senere revideres, gør ikke kreditterne
   tilbagevirkende "forkerte" eller "rigtige" — det forankrer, hvilke
   regler der gjaldt ved udstedelse.

**Det ærlige-grænser-afsnit ovenfor er den bærende del af dette kit.**
Næsten ethvert meningsfuldt integritetsspørgsmål om en kulstofkredit
befinder sig i en af disse ni spande. Forseglingen lukker det smalle
resterende gab: tavs tilbagevirkende modifikation af bytes-på-papir.
Det gab er reelt og værd at lukke, men det er lille sammenlignet med
det bestridte terræn.

---

## Hvad dette kit SKAL NÆGTE at forsegle

Kittet er konfigureret til at afvise følgende kendsgerningsmønstre,
selv hvis en bruger med gyldig signaturmyndighed indsender dem:

- **"Additionalitet" angivet som en kendsgerning.** At forsegle
  additionalitet som kendsgerning skaber en vildledende optegnelse.
  Kittet accepterer metodologi-konforme additionalitets-*argumenter*,
  ikke additionalitets-*påstande*.
- **"Permanens" uden eksplicit oplysning om tidshorisont og
  bufferpulje.** At forsegle permanens uden disse parametre slører,
  hvad projektet faktisk forpligter sig til.
- **"Ingen lækage" uden projektspecifik måling.**
  Metodologi-standard-lækagefradrag er ikke måling, og forseglingen
  vil ikke behandle dem som sådanne.
- **Kvantificeringer genereret før tredjeparts-verifikation er
  færdig.** En forsegling før verifikation skaber en falsk-positiv
  "verificeret"-optegnelse.
- **Udstedelsesoptegnelser for kreditter, der også er udstedt på et
  andet register uden eksplicit oplysning på tværs af registre** i
  KENDSGERNING 06.
- **Pensioneringsoptegnelser, der undlader at navngive
  pensioneringens begunstigede.** Anonym pensionering underminerer
  pensioneringens offentlige-gode-funktion; kittet nægter at
  muliggøre den.
- **FPIC-påstande, der ikke understøttes af attesterbare
  dokument-hashes.**
- **Artikel 6.2 / 6.4-udstedelse uden en hash af værtslandets
  bemyndigelsesbrev (LoA)** forseglet i KENDSGERNING 06.
- **Forsegling efter anmodning fra nogen anden part end
  projektudvikleren + verifikator i fællesskab** for det pågældende
  projekt.
- **Sidegevinst-påstande forseglet som "certificeret"**, når de blot
  er "selv-erklærede og verifikator-gennemgåede".

En afvisning kan i sig selv forsegles som en kendsgerning ("Denne
part anmodede om forsegling af X; kittet afviste i henhold til
afvisningsregel Y"), hvilket skaber en offentlig optegnelse af
forsøgt misbrug.

---

## Hvad dette kit FAKTISK forsegler

8 kendsgerninger i attestationsøjeblikket:

1. **Eksempel-notits** — erklærer publikationen som et eksempel
   (virkelige attestationer fjerner eller erstatter denne).
2. **Projektidentifikation** — projektnavn, register,
   register-projekt-ID, metodologicitation + hash, geografisk
   afgrænsnings-hash, årgang, projektudvikler, sidegevinst-påstand,
   FPIC-status.
3. **Kvantificering af emissioner eller fjernelse** — brutto-ton
   CO2e, kontrafaktisk baseline, lækagefradrag, bufferpulje-bidrag,
   usikkerhedsfradrag, netto kreditérbar påstand, hashes af hver
   numerisk inddata.
4. **Målemetodologi** — datakilder fra fjernmåling, jord-sandheds-
   plotnetværk, hash af instrumentkalibreringslog, hash af
   klassifikator-model + nøjagtighedsstatistik, kulstoftætheds-model,
   kodeproveniens + reproducerbarheds-manifest.
5. **Tredjeparts-verifikation** — verifikatororganisation,
   akkreditering, hash af uafhængighedserklæring, tidligere
   engagementer med udvikler, hash af stedsbesøgs-fotoarkiv, rejste +
   løste fund, hash af verifikationsudtalelses-dokument.
6. **Udstedelses- eller pensioneringsoptegnelse** —
   udstedelsesanmodning + godkendelse, samlede kreditter udstedt,
   serie-interval, tværs-register-deklaration, værtsland-LoA-hash
   hvor relevant, pensioneringsserie-intervaller + begunstigede (for
   pensioneringsattestationer), hashes af øjebliksbilleder af
   registertilstand.
7. **Ledsagende oplysninger og afvisningsoptegnelse** — verserende
   metodologistridigheder, ikke-permanensrisiko, lækageforbehold,
   additionalitetsforbehold, FPIC- og klage-log-hashes,
   sidegevinst-forbehold, tidligere verifikator-engagement; eksplicit
   liste over mønstre, kittet nægtede at forsegle.
8. **Underskrivende principal** — projektudvikler + verifikator +
   register, hver med rolle + attestationsomfang + kryptografiske
   nøgleoplysninger.

Hver kendsgerning afsluttes med afvisningsporten-konventionen: *"Denne
kendsgerning hævder kun X. Den hævder ikke Y"* (hvor Y er den
nærmeste fejltilstand fra "GØR IKKE"-afsnittet ovenfor).

---

## Hvad dette kit forsvarer imod

- **Tavs modifikation af kvantificering efter udstedelse.** Enhver
  heltalsændring af KENDSGERNING 03 producerer en anden SHA-256, en
  anden Merkle-rod, fejler OTS-verificering.
- **Tavs metodologi-substitution.** KENDSGERNING 02 fryser
  metodologicitationen + dokument-hashen ved udstedelse. En
  register-udskiftning af en anden metodologi-version efter
  udstedelse er offentligt diff-bar.
- **Tavs baseline-revision.** KENDSGERNING 03's
  output-hash for baseline-scenarie-model er forseglet. En post hoc
  baseline-genjustering for at producere flere kreditter er
  påviselig.
- **Tavs substitution af verifikator-udtalelse.** KENDSGERNING 05's
  hash af udtalelsesdokument er forseglet. En post-udstedelses
  "verifikatoren har altid sagt X"-omskrivning er påviselig.
- **Tavs forsvinden af pensioneringsoptegnelse.** KENDSGERNING 06's
  øjebliksbillede af registertilstand er forseglet. Kreditter, der
  mystisk bliver "tilgængelige" igen efter at være markeret som
  pensionerede, er påviselige mod forseglingen.
- **Tavs substitution af FPIC-dokument.** KENDSGERNING 07's FPIC- og
  klage-log-hashes er forseglet. Erstatnings-samtykkedokumenter er
  påviselige.
- **Tavs fjernelse af ubelejlige oplysninger.** KENDSGERNING 07's
  ledsagende-oplysningsstatus er forseglet. Stille sletning af et
  ikke-permanens-forbehold fra en projektbeskrivelsesside er
  påviselig mod de forseglede bytes.

Kittet forsvarer IKKE mod de underliggende integritetsspørgsmål
(additionalitet, permanens, lækage, FPIC-tilstrækkelighed,
verifikator-uafhængighed, metodologisk gyldighed). Det er de
sværere problemer, og forseglingen kan ikke løse dem.

---

## Historiske eller nær-historiske tilfælde, hvor kittet ville have hjulpet

Kittet ville have produceret et nyttigt anker — *ikke en løsning* — i
sager, der involverede tavs tilbagevirkende modifikation af
kulstofattestationsoptegnelser. Det ville IKKE have løst de
underliggende bestridte spørgsmål i nogen af disse sager.

- **Guardian / Die Zeit / SourceMaterial-undersøgelsen af Verras
  regnskovskreditter i 2023.** Efterforskerne fandt, at de fleste
  undersøgte REDD+-projekter producerede kreditter, hvis hævdede
  undgåede emissioner ikke stemte overens med senere genanalyse via
  fjernmåling. Undersøgelsen krævede rekonstruktion af
  projektdokumentation mod tilbagevirkende modificerede
  registeroptegnelser. En forseglet publikation ved hver
  udstedelsescyklus ville have givet utvetydige reference-bytes for
  det, der blev attesteret i hver cyklus — ikke en løsning på det
  underliggende baseline-problem, men en ren retsmedicinsk tidslinje.

- **De californiske reverseringsbegivenheder for skovs-offsets i 2020.**
  Flere skov-kulstofprojekter under Californiens
  overholdelsesmarked oplevede skovbrand-reverseringer, der oversteg
  den bufferpulje-reserve, der var afsat til dem. At rekonstruere
  hvad hvert projekt havde attesteret om ikke-permanens-risiko *ved
  udstedelse* (kontra hvad projektet senere hævdede, det havde
  attesteret) er for tiden vanskeligt. Forseglinger per årgang ville
  have gjort attestationerne før branden kanonisk genfindelige.

- **Diverse REDD+-projekter, hvor referenceregion-baseline-metodologier
  tilbagevirkende blev kritiseret som oppustede.** En forseglet
  metodologi-dokument-hash på udstedelsestidspunktet ville have
  forankret, hvilken metodologi-version der faktisk gjaldt for
  hvilken årgang, og gjort "metodologien har altid været X"-forsvaret
  diff-bart.

- **Adskillige australske kulstofkredit-enhed (ACCU)-stridigheder om
  menneske-induceret regenerering (2022–2023).** Akademisk kritik af,
  om regenerering faktisk var projekt-induceret kontra naturlig, blev
  til stridigheder om, hvad projektet oprindeligt havde påstået.
  Forseglede attestationer ville have givet utvetydige
  per-årgangs-optegnelser.

- **Kulstof-offset-pensioneringsoptegnelser, der har skiftet tilstand.**
  Flere dokumenterede tilfælde af pensioneringsoptegnelser på
  frivillige-markeds-registre, der ser ud til at ændre status efter
  pensionering (bliver "pensioneret" af en anden grund, eller bliver
  tilskrevet en anden begunstiget efterfølgende). Per-pensionering-
  forseglinger ville have forankret tilstanden i øjeblikket for den
  oprindelige pensionering.

I ingen af disse tilfælde ville kittet have løst, om den
underliggende kredit repræsenterede reel klimagevinst. Kittet
forankrer optegnelser; det er alt, det gør.

---

## Hvornår skal man bruge dette kit

- Du er en projektudvikler, der ønsker at offentliggøre en
  manipulationspåvisende attestation ved siden af din
  standard-registerindgivelse.
- Du er en tredjeparts-verifikator, der ønsker, at din
  verifikationsudtalelse skal kunne offentligt verificeres mod et
  registers senere fremstilling af "hvad verifikatoren sagde".
- Du er et register, der ønsker at tilbyde et yderligere
  integritetslag på udstedelses- og pensioneringsoptegnelser — særligt
  for projekter i jurisdiktioner med svagere retsstats-back-stops for
  registerintegritet.
- Du er en journalist, akademiker eller NGO, der kører en
  flerårig longitudinel analyse af kulstofprojekter og har brug for et
  offentligt anker til at diffe et projekts senere fremstillinger
  imod udstedelsestidspunktets bytes.
- Du er en køber (virksomhed med netto-nul, flyselskabs-overholdelse),
  der ønsker, at de kreditter, du pensionerer, skal pensioneres mod
  offentligt forankrede optegnelser, så din nedstrøms
  markedsføringspåstand kan revideres mod en stabil retsmedicinsk
  tidslinje.

## Hvornår skal man IKKE bruge dette kit

- **Brug det ikke som erstatning for akkrediteret
  tredjeparts-verifikation.** Forseglingen erstatter ikke ISO
  14064-3-verifikation; den komponerer med den.
- **Brug det ikke til at hævde, at et projekt er "additivt",
  "permanent" eller "lavlækage".** Forseglingen kan ikke verificere
  disse egenskaber. At bruge forseglingen til at hævde dem er
  misbrug.
- **Brug det ikke som legitimitetsteater for lavkvalitetskreditter.**
  En kryptografisk forsegling på en lavkvalitetskredit er en permanent
  retsmedicinsk optegnelse af lavkvaliteten, ikke et forsvar af den.
  Primitivet skærer begge veje; det er dens ærlighed.
- **Brug det ikke til at forsegle kreditter, der også optælles af et
  værtsland mod dets NDC** uden eksplicit oplysning om tilsvarende
  justering i KENDSGERNING 06.
- **Forsegl ikke før verifikation.** En forsegling før verifikators
  udtalelse er endelig, skaber en falsk-positiv "verificeret"-optegnelse.
- **Brug det ikke under pres for at udelade en ledsagende
  kendsgernings-oplysning i KENDSGERNING 07** (verserende
  metodologistridigheder, FPIC-spørgsmål, tidligere
  verifikator-engagement). Afvis, og forsegle afvisningen.
- **Brug det ikke som markedsføringsmærke.** "MYRIAM-forseglet" er
  ikke en kvalitetspåstand; det er en retsmedicinsk egenskab. At
  behandle det som et kvalitetsmærke er præcis det misbrug, som det
  begrænsnings-først-design forsøger at forhindre.

## Sådan forker du dette kit til en rigtig attestation

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # erstat fiktivt indhold med virkeligt
bash build/seal.sh         # FORSEGL VED eller EFTER registerets udstedelse, ikke før
python3 build/verify.py    # bekræft
```

**Kritisk timing:** forsegle VED eller EFTER registerets officielle
udstedelsesbegivenhed, IKKE før. En for-udstedelses-forsegling skaber
en falsk-positiv "udstedt"-optegnelse. For
pensioneringsattestationer, forsegle VED pensioneringsøjeblikket. For
løbende overvågningsattestationer mellem udstedelse og pensionering,
forsegle ved hver verifikator-underskrevet overvågningscyklus — men
gør det klart i KENDSGERNING 01, at attestationen er en
overvågningsopdatering, ikke en udstedelse.

## Integration med eksisterende kulstof-infrastruktur

- **Verra (VCS).** URL'en eller IPFS-CID'en for den forseglede
  publikation kan vedhæftes VCS-projektsiden som supplerende
  dokumentation. Forseglingen erstatter ikke VCS-verifikation; den
  komponerer med den.
- **Gold Standard.** Samme integrationsmodel — supplerende
  attestation ved siden af Gold Standard-udstedelsesdokumentation.
  Gold Standards vægtning af sidegevinster +
  samfundsgevinst-dokumentation kortlægges naturligt på KENDSGERNING
  02 + KENDSGERNING 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Samme integrationsmodel.
- **Artikel 6.4 (Paris-aftalens tilsynsorgan-mekanisme).**
  Værtsland-LoA-hashen i KENDSGERNING 06 er specifikt designet til
  ITMO-sporbarhed i henhold til Artikel 6.4 / 6.2. Oplysning om
  tilsvarende justering er et afvisningsport-styret felt.
- **EU ETS MRV.** For overholdelsesmarked-udstedere kortlægges
  MRV-rapport-hashen til KENDSGERNING 03's hash af
  kvantificerings-regneark. Forseglingen komponerer med — erstatter
  ikke — operatørens verificerede emissionsrapport.
- **CDP (Carbon Disclosure Project) virksomheds-oplysning.** For
  virksomheder, der citerer pensionerede kreditter i
  CDP-indleveringer, er pensioneringsoptegnelsen forseglet under
  KENDSGERNING 06 den kanoniske genfindelige optegnelse.
  CDP-indleveringssproget kan referere til den forseglede
  publikations Merkle-rod eller IPFS-CID.
- **ISO 14064-2 (projekt) / ISO 14064-3 (verifikation) / ISO 14065
  (akkreditering).** Forseglingen registrerer
  overensstemmelsesbekræftelsen + hashes; den udfører ikke
  overensstemmelsesvurderingen.
- **TSVCM Core Carbon Principles (CCP) / ICVCM-mærker.** Hvor et
  projekt er blevet vurderet mod ICVCM CCP'erne, kan hashen af
  vurderingsresultatet forsegles i KENDSGERNING 07 som en
  ledsagende oplysning.

## Hvad dette kit IKKE erstatter

- Akkrediteret tredjeparts-verifikation (ISO 14064-3)
- Registerets udstedelses- og pensioneringsarbejdsgange
- Vurdering af metodologi-overensstemmelse
- Værtslandets autoriseringsprocesser for Artikel 6-transaktioner
- Overholdelsesmarkeds-MRV-processer (EU ETS, Californiens
  Cap-and-Trade, RGGI osv.)
- Initiativer for det frivillige markeds integritet (ICVCM, VCMI)
- Uafhængig klimavirknings-vurdering

## Hvorfor dette kit findes i v0.4.0+

Dette er det 7. udarbejdede eksempel, der leveres med myriam-kit.
Kittet eksisterer, fordi kulstofkredit-markeder har en veldokumenteret
historie med tavs tilbagevirkende modifikation — metodologier, der
tilbagevirkende genfortolkes, baselines, der tilbagevirkende
revideres, pensioneringsoptegnelser, der ændrer tilstand, og
projekt-oplysninger, der stille fjerner ubelejlige forbehold over
tid.

Forseglingen lukker det *smalle* gab af bytes-på-attestationstidspunktet.
Den adresserer ikke — og kan ikke adressere — de større bestridte
spørgsmål om additionalitet, permanens, lækage eller autenticitet af
sidegevinster. Kittets ærlige indramning af denne begrænsning er
dens vigtigste egenskab.

## Licens

Almindelig ejendom (CC0). Fork det. Ingen kreditering kræves.
