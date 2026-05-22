*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Försegling av vårdnadskedja för domstolsbevisning

Ett nyckelfärdigt myriam-kit-exempel för forensiska
inhämtningsteam — datorforensiska granskare,
mobilenhetsutdragningstekniker, kroppskamera-bevisvårdare,
laboratorieövervakare — som vill publicera en Bitcoin-förankrad,
manipuleringsbevisande försegling av *vilka bytes som inhämtades*
och *när*, vid tidpunkten för digital bevisinhämtning, så att
tvister om vårdnadskedjan har en offentlig förankring.

---

## Vad detta kit INTE gör (läs först)

Förseglingen är en kryptografisk tidsstämpel av VILKA FORENSISKA
AVBILDNINGAR som inhämtades, NÄR de inhämtades, av VILKEN MYNDIGHET,
under VILKEN HUSRANSAKNING, och genom VILKEN METODIK. Den kan inte
besvara någon fråga om fallet utöver detta. Följande ligger
**utanför förseglingens domän**:

1. **Bevisens tillåtlighet under Federal Rules of Evidence (eller
   någon annan bevisbalk).** Förseglingen förankrar bytes och
   tidsstämplar. Huruvida bevis är tillåtlig — under FRE 901
   autentisering, FRE 702 sakkunnigvittnesmål / Daubert, FRE 403
   bias-vägning, eller någon delstatlig motsvarighet — är en
   juridisk procedurfråga. En perfekt förseglad inhämtning kan
   fortfarande dömas otillåten; en oförseglad inhämtning kan
   fortfarande tas upp. Förseglingen är additivt bevis på
   integritet, inte ett substitut för domstolens
   tillåtlighetsbeslut.

2. **Huruvida beslaget var lagligt.** Fourth
   Amendment-överensstämmelse, husransakans giltighet, omfattnings-
   efterlevnad, tillämpligheten av uteslutningsregeln — alla
   dessa ligger uppströms förseglingen. Förseglingen registrerar
   att inhämtningen skedde under husransakan FICT-SW-2026-0188;
   huruvida husransakan utfärdades och delgavs lagligt är upp
   till domstolen.

3. **Huruvida beviset är belastande, friande eller neutralt.**
   Förseglingen förankrar hashar; tolkningar av vad dessa hashar
   innehåller hör hemma i den forensiska granskningsrapporten, som
   är sitt eget dokument med sin egen discovery- och bevisregim.
   Förseglingen kommer att vägra försegla "FAKTUM N: den
   misstänktes laptop innehöll belastande material" — se
   refusal-rule R4.

4. **Huruvida vårdnadskedjan är procedurmässigt korrekt under den
   tillämpliga delstatens bevislagstiftning.** Förseglingen
   registrerar myndighetens samtida vårdnadshändelselogg (FAKTUM
   05). Huruvida den loggen uppfyller en viss delstats
   vårdnadskedjekrav är upp till domstolen vid bevisförhandlingen.

5. **Huruvida den forensiska metodiken var tillförlitlig.**
   Daubert och dess efterföljare (och motsvarigheter på
   delstatsnivå som Frye, där den fortfarande gäller) bedömer
   metodologisk tillförlitlighet. Förseglingen registrerar VILKA
   verktyg och versioner som användes (FAKTUM 04); huruvida dessa
   verktyg uppfyller någon specifik domstols
   tillförlitlighetsstandard är upp till domstolen. Verktygsbuggar
   har dokumenterats efter inhämtning i tidigare fall;
   förseglingens roll är att göra version-och-binär-hash-registret
   offentligt vederläggbart, inte att gå i god för verktygen
   själva.

6. **Huruvida bevisen manipulerades FÖRE inhämtning.** Förseglingen
   förankrar bytes från avbildningsögonblicket och framåt. Om en
   misstänkt, en tjänsteman, eller en tredje part ändrade
   källenheten innan den avbildades, kan förseglingen inte
   upptäcka det — den förseglar de ändrade bytena med samma
   integritet som den skulle försegla originalet. Förseglingens
   värde börjar vid avbildningstidstämpeln.

7. **Huruvida husransakans omfattning respekterades.** Husransakans
   bilaga definierar vad som kan inhämtas; förseglingen
   registrerar vad som INHÄMTADES. Huruvida inhämtningen översteg
   husransakans omfattning är, återigen, en juridisk fråga med sin
   egen åtgärd (suppression-yrkande under den lämpliga delstatens
   procedur).

8. **Återidentifiering av någon privat part i utredningen.**
   Förseglingen vägrar att publicera något namn, identifierare eller
   fingeravtryck som skulle kunna återidentifiera en misstänkt,
   tilltalad, offer, vittne, eller fastighetsboende.
   Måldokumentreferensen är det lämpliga handtaget för parter med
   talerätt att lokalisera fallet.

**Avsnittet om hederliga gränser ovan är den bärande delen av
detta kit.** Forensiska team som tror att försegling är lika med
tillåtlighet kommer att använda det som en sköld. Kitet måste säga
rakt ut: *detta är ett icke-förnekande-primitiv för
inhämtningsögonblicket, inte ett bevis på laglig inhämtning,
metodologisk sundhet, eller domstolserkänd vårdnadskedja.*

---

## Vad detta kit MÅSTE VÄGRA att försegla

Kitet är konfigurerat att avvisa följande faktamönster även om en
användare med giltig myndighets-undertecknande-befogenhet skickar
in dem:

- **Personlig identifiering av misstänkta, tilltalade, offer,
  vittnen, eller någon privat tredje part.** Måldokumentreferensen
  är handtaget för parter med talerätt; den offentliga
  förseglingen får inte vara ett återidentifieringsindex.
- **Personliga namn på forensiska granskare eller annan
  myndighetspersonal i den offentliga förseglingen.** Roller är
  offentliga; person-till-roll-bindningar förseglas separat och är
  upptäckbara under domstolsprocess.
- **Hashar på filnivå (eller fingeravtryck) av misstänkt material
  som visar sexuella övergrepp mot barn, biometriska mallar, eller
  någon sårbar-person-återidentifierande data — även genom hash.**
  En SHA-256 av en enskild fil är en permanent sökbar
  identifierare; att publicera den på en offentlig huvudbok kan
  återviktimisera subjekt via korrelation med privata databaser.
  Avbildningsnivå (forensisk-avbildnings-nivå) hashar av hela
  diskar är acceptabla; filnivåhashar av sådant material är
  ALDRIG acceptabla.
- **Granskningsfynd, tolkningar, åsikter, eller slutsatser om vad
  bytena betyder.** Förseglingen förankrar VILKA BYTES som
  inhämtades och NÄR. Tolkningen hör hemma i den
  discovery-bara granskningsrapporten, inte på en
  manipuleringsbevisande offentlig huvudbok.
- **Anspråk på tillåtlighet eller någon annan juridisk slutsats**
  ("denna bevisning är tillåtlig", "husransakan var laglig",
  "vårdnadskedjan var korrekt enligt §X.Y"). Juridiska slutsatser
  är domstolsfunktioner.
- **Försegling av någon annan än den inhämtande myndighetens
  auktoriserade principal.** En försvarsexpert kan använda kitet
  för att försegla sin egen oberoende verifiering av manifestet;
  de får inte försegla den URSPRUNGLIGA inhämtningen under den
  inhämtande myndighetens namn.
- **Roll-till-individ-bindningar inom den offentliga
  förseglingen.** Bindningar förseglas i ett separat åtföljande
  register (hashat i FAKTUM 05) under myndighetens åtkomstkontroll.
- **Fakta från före beslag eller före husransakan.**
  Informantuttalanden, övervakning före husransakan,
  parallellkonstruktionsindata — inget av detta hör hemma på
  inhämtningsförseglingen. Förseglingen är avgränsad till
  inhämtningshändelsen.

En vägran själv kan förseglas som ett faktum ("Denna myndighet
begärde försegling av X; kitet vägrade enligt vägransregel Y"),
vilket skapar ett offentligt register över försök till missbruk.

---

## Vad detta kit förseglar

8 fakta vid inhämtningsögonblicket:

1. **Exempelmeddelande** — förklarar publiceringen som ett exempel
   (riktiga attesteringar tar bort eller ersätter detta).
2. **Inhämtningskontext** — målidentifierare, husransakanscitat,
   inhämtande myndighet, begärande auktoritet, datum/tid för
   beslag och inhämtning, plats för inhämtning (platsen för
   beslaget är redigerad till ett separat-förseglat åtföljande
   register för att undvika återidentifiering av fastigheten).
3. **Bevismanifest** — per forensisk-avbildnings-objekt: SHA-256-
   hash, filstorlek, källenhetens anonymiserade identifierare,
   inhämtningsmetod, forensiskt avbildningsformat.
4. **Inhämtningsmetodik** — forensiska verktygsnamn och exakta
   versioner (med verktygsbinärhashar), write-blocker märke/modell
   och firmware, NIST CFTT-verifieringsreferens, använt
   verifieringsförfarande, val av avbildningsformat.
5. **Vårdnadskedjelogg** — per händelse-tidslinje från
   initialt beslag genom slutet av avbildning, vårdare identifierade
   genom ROLL (inte genom namn), med hashar av separat-förseglade
   åtföljande register (roll-till-individ-bindning,
   transport-GPS-logg, bevisförrådsåtkomstlogg,
   manipuleringsplomb-fotografier, etc.).
6. **Granskarens kvalifikationer per roll** — innehavda
   certifieringar, fortbildningsstatus, tidigare
   sakkunnigvittnesförhandlingsräkning, Daubert-exponering,
   intressekonfliktutlämnanden — alla på rollnivå, inte personliga.
7. **Åtföljande utlämnanden och vägransregister** — parallella
   utredningar, väntande husransakansutmaningar,
   undertryckta-bevis-yrkanden, privilegiefilter / taint-team-
   protokoll i kraft, tidigare inhämtningsförsök,
   leverantörsbuggspårarensgranskning; explicit lista över mönster
   som kitet vägrade att försegla.
8. **Undertecknande principal** — inhämtande myndighetsidentifiering
   + rollnivå-signerare (ledande granskare) + rollnivå-medsignerare
   (enhetsövervakare) + kryptografisk nyckelinformation.

Varje faktum slutar med konventionen för vägransgrindar: *"Detta
faktum hävdar endast X. Det hävdar inte Y"* (där Y är det närmaste
felmoden från avsnittet "GÖR INTE" ovan).

---

## Vad detta kit försvarar mot

- **Tyst ändring efter inhämtning av en forensisk avbildning.**
  Varje byte-nivå-ändring av någon avbildning producerar ett
  annat SHA-256, och avbildningen efter ändringen kommer inte att
  verifieras mot det förseglade FAKTUM 03-manifestet.
- **Anspråk på att "andra verktyg användes".** FAKTUM 04
  registrerar exakta verktygsversioner med verktygsbinärhashar;
  senare "vi använde faktiskt v4.7.0, inte v4.7.1"-anspråk är
  offentligt vederläggbara.
- **Anspråk på att write-blockern inte var engagerad, eller
  använde en annan modell.** FAKTUM 04 fryser
  write-blocker-manifestet.
- **Ändring av vårdnadslogg.** Varje ändring av FAKTUM 05
  vårdnadshändelse-tidslinjen (lägga till, ta bort, eller
  återtidsstämpla en händelse) ändrar FAKTUM 05-hashen och är
  offentligt upptäckbar.
- **Substitution av en annan granskares kvalifikationer.** FAKTUM
  06 fryser rollnivåkvalifikationsprofilen vid
  inhämtningstidpunkten.
- **Selektiv utelämnande av åtföljande utlämnanden.** FAKTUM 07
  räknar upp de förväntade utlämnandekategorierna; en tom
  kategori måste uttryckligen attesteras ("ingen vid
  inhämtningstidpunkten"), så en senare "vi insåg inte att det
  var relevant" är offentligt vederläggbar.
- **Anspråk efter inhämtning på att granskaren hade en konflikt
  som inte utlämnades.** FAKTUM 06:s konfliktutlämnande är fryst
  vid inhämtningstidpunkten; senare utmaningar kan testas mot det.

Kitet försvarar **inte** mot samtidig korruption — ett team som
avsiktligt förseglar falska metadata vid inhämtningstidpunkten
producerar en kryptografiskt giltig försegling av falska metadata.
Primitiven är hederlig om det: det är ett icke-förnekande-primitiv
för myndighetens samtida anspråk, inte ett bevis på att dessa
anspråk är korrekta.

---

## Historiska eller nästan-historiska fall som kitet skulle ha hjälpt till med

Kitet skulle ha producerat en användbar förankring — *ingen
lösning* — i tidigare fall där digitalbevisens vårdnadskedja
blev en omtvistad bevisfråga. För att undvika att namnge
tilltalade (som är privata parter även när de döms) beskrivs dessa
efter måltyp, inte efter namngiven individ:

- **Den mitten-2010-talets federala forensiska-verktygs-
  bugkontrovers** där ett brett använt forensiskt
  avbildningsverktyg upptäcktes, efter inhämtning, ha en edge-case-
  bugg som påverkade en specifik källmediatyp. Ett förseglat
  inhämtningsmanifest med fryst verktygsversion-och-binärhash-data
  skulle ha låtit försvaret och åklagaren komma överens om exakt
  vilken version som användes, vilket eliminerade en axel av
  tvist.

- **Flera delstatsfall som involverar omtvistade
  mobilenhetsutdragningsutdata**, där utdragningsverktygets
  leverantör senare släppte en buggfix-patch och frågan blev "om
  buggen påverkade detta fall". Ett förseglat metodikfaktum låter
  frågan besvaras mot fryst versionsdata, snarare än mot
  myndighetens nuvarande minne av vilken version som användes.

- **Tvister om kroppskamerahantering** i fall där BWC-leverantörens
  dockningssystem senare påstods ha tillåtit modifiering av
  filmmaterial under transport. Ett förseglat manifest av
  kroppskamerarkivet vid myndighetens mottagningstidpunkt
  förankrar vilka bytes myndigheten mottog från
  dockningssystemet; senare ändringar på myndighetens sida är
  offentligt upptäckbara.

- **Hash-kollisionskontroverser i datorforensiska fall**, där en
  försvarsexpert argumenterade att MD5 (fortfarande i bruk i
  vissa äldre arbetsflöden) var otillräcklig. En förseglad
  inhämtning som registrerar BÅDE MD5 och SHA-256 låter SHA-256
  stå även om MD5 ifrågasätts.

- **Tvister över utvecklingen av granskningsmetodik mellan
  inhämtning och rättegång.** När ett fall ligger mellan
  inhämtning och rättegång i åratal, kan den metodik som var
  standard vid inhämtning ha övergått vid rättegångstid. Det
  förseglade registret låter domstolen utvärdera metodik mot den
  standard som var aktuell vid inhämtningsögonblicket, inte mot
  den senare standarden.

Kitet skulle INTE ha löst de underliggande tvisterna om skuld
eller oskuld i någon av dessa måltyper. Det skulle ha löst en
specifik bevistvist: huruvida bytena, verktygen och förfarandena
var vad myndigheten hävdar att de var vid den tid myndigheten
hävdar dem.

---

## När man bör använda detta kit

- Din myndighet har en stabil forensisk SOP och vill lägga till
  en Bitcoin-förankrad offentlig attestering som ett
  manipuleringsbevisande lager ovanpå den befintliga
  papper-och-signatur-vårdnadskedjan.
- Du förväntar dig att detta fall kommer att involvera betydande
  försvarsutmaning av forensisk bevisning (högsatsigt fall, ny
  metodik, omtvistade verktygsversioner, etc.).
- Du kan publicera den listade faktauppsättningen utan att
  exponera PII eller sårbar-person-återidentifierande data.
  (Kitets vägransregler upprätthåller detta; om dina fakta skulle
  kräva ett vägransregelbrott, använd inte kitet.)
- Den inhämtande myndighetens allmänna ombud och åklagarmyndigheten
  har granskat publiceringsplanen. Offentlig publicering av en
  målidentifierare-bärande artefakt har implikationer för
  pågående utredningar; ombudsgranskning är inte valfri.
- Din jurisdiktions försvars-discoveryregler är kompatibla med
  att myndigheten separat innehar roll-till-individ-bindnings-
  registret (hashat i FAKTUM 05). Om din jurisdiktion kräver
  offentligt utlämnande av granskarens namn, måste du ändra kitet
  därefter.

## När man INTE bör använda detta kit

- **Använd inte som ett substitut för myndighetens befintliga
  vårdnadskedjedokumentation.** Detta kit är *additivt*, inte
  ersättande. Myndighetens CMS, vårdnadslogg, och
  discovery-produktionsförpliktelser är oförändrade.
- **Använd inte om inhämtningen involverar CSAM, biometriska
  mallar, eller annan sårbar-person-återidentifierande data på
  filnivå.** Avbildningsnivåhashar av hela diskar är acceptabla;
  filnivåhashar av sådant material är ALDRIG acceptabla, även
  under vägransregelundantag. Om du inte kan konstruera en
  faktauppsättning utan att bryta R3, använd inte kitet.
- **Använd inte för att hävda att husransakan var laglig,
  beslaget var korrekt, eller bevisen är tillåtliga** — kitet kan
  inte göra det, och vägransregel R5 kommer att avvisa varje
  sådant anspråk.
- **Använd inte under tryck att försegla innan inhämtningen är
  klar.** En försegling av partiell inhämtning ger en felaktig
  bild av tillståndet.
- **Använd inte för att publicera granskares personliga namn**
  såvida inte din jurisdiktion specifikt kräver det och dina
  granskare individuellt har samtyckt. Standardinställningen är
  rollnivåpublicering.
- **Använd inte i förseglade eller hemliga mål** utan uttrycklig
  domstolstillstånd. Att publicera en målidentifierare på
  Bitcoin är oåterkallelig; om målet senare förseglas, kan den
  offentliga förseglingen inte återkallas. Kitet är endast för
  offentlig-record-inhämtningar.
- **Använd inte som legitimitetsteater.** En försegling av en
  bristfällig inhämtning är ett permanent offentligt register av
  bristerna, inte ett försvar mot dem. Primitiven skär åt båda
  håll; det är dess hederlighet.

## Hur du forkar detta kit för en riktig inhämtning

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Kritisk timing:** försegla VID eller strax efter avslutningen
av avbildning (FAKTUM 05-händelse E17 i exempeltidslinjen). En
försegling under avbildning skapar ett partiellt-inhämtningsregister;
en försegling mycket senare skapar ett gap under vilket
myndigheten kunde ha ändrat avbildningarna. Det rätta fönstret är
omedelbart efter att avbildningsverifiering avslutas för det
sista objektet i exhibituppsättningen.

**Kritisk granskning:** innan förseglingen, kör publiceringen
genom en andra forensisk granskare (inte ledaren) och genom
myndighetens ombud. När den väl är förseglad är publiceringen
permanent.

## Integration med befintlig vårdnadskedjeinfrastruktur

- **Myndighetens Målhanteringssystem (CMS).** CMS förblir
  myndighetens primära system av register. Förseglingen ersätter
  inte CMS; den förbinder sig till de bytes och metodik som CMS
  registrerar, så efterhandsändringar i CMS är offentligt
  upptäckbara.
- **Federal Rules of Evidence / Daubert / delstatliga
  bevisbalkar.** Förseglingen bidrar till FRE 901
  autentiseringsregistret genom att tillhandahålla
  manipuleringsbevisande integritet. Den uppfyller INTE FRE 702 /
  Daubert i sig själv; metodologisk tillförlitlighet testas
  fortfarande vid bevisförhandlingen.
- **Försvars-discovery (FRCP 16, Brady, Giglio, och delstatliga
  motsvarigheter).** De åtföljande registren som hashats i
  FAKTUM 05 (roll-till-individ-bindning, vårdnadslogg,
  manipuleringsplomb-foton, etc.) förblir föremål för normal
  discovery. Förseglingen förankrar vad dessa register hävdade vid
  inhämtningstidpunkten, så ett senare "registret var annorlunda
  vid tiden"-anspråk är offentligt vederläggbart.
- **NIST Computer Forensics Tool Testing (CFTT).** Kitet
  refererar till CFTT-verifieringsloggar i FAKTUM 04 / FAKTUM 05;
  referensen är en hash, inte loggen själv, så CFTT-processer
  är opåverkade.
- **Domstolsutnämnda neutrala och försvarsexperter.** Båda kan
  återhasha de forensiska avbildningarna de tar emot i discovery
  mot FAKTUM 03-manifestet, oberoende av något myndighetssamarbete.
  Detta är kitets primära mervärde för försvarssidan.
- **Överklagandegranskning.** År senare kan en
  överklagandeforensisk granskare verifiera den ursprungliga
  inhämtningsmetodiken mot det förseglade FAKTUM 04-registret,
  snarare än mot myndighetens möjligen-utvecklade aktuella
  minne.

## Vad detta kit INTE ersätter

- Federal Rules of Evidence (eller någon delstatlig bevisbalk).
- Daubert / Frye-tillförlitlighetsstandarder för sakkunnigvittnesmål.
- Myndighetens forensiska SOP och CMS.
- Försvars-discovery-förpliktelser under FRCP 16 / Brady /
  Giglio / delstatliga motsvarigheter.
- Domstolsbeslut, suppression-yrkanden, bevisförhandlingar, eller
  någon annan domstolsadministrerad process.
- NIST CFTT eller någon annan verktygstestningsregim.
- Myndighetens privilegiefilter / taint-team-protokoll.

## Varför detta kit existerar i v0.4.0+

Detta är det 8:e bearbetade exemplet som levereras med
myriam-kit. Det följer den begränsnings-första struktur som
validerats av den autoresearch som dokumenterats i
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — den begränsnings-första
prompt-varianten fick högst poäng på en viktad rubrik över flera
exempeldomäner. Öppningsavsnitten är de bärande delarna av
kitet; manifestinnehållet är den lätta delen.

Kitets design är medvetet konservativ kring publicering av
granskarens namn och aggressiv kring "detta etablerar inte
tillåtlighet"-friskrivningen. Det forensiska samfundet har en
dokumenterad historia av att bli attackerat för sitt forensiska
arbete; kitet är som standard på den säkrare positionen för
granskare. Myndigheter i jurisdiktioner där offentlig
personnamngivning krävs kan ändra sin fork därefter, men
standardvägran gynnar granskarens säkerhet.

## Licens

Public domain (CC0). Forka det. Inget erkännande krävs.
