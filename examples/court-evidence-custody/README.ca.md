*Traducció catalana — per a la versió original en anglès, vegeu [README.md](README.md)*

# Kit de segell de cadena de custòdia de proves judicials

Un exemple clau en mà de myriam-kit per a equips d'adquisició forense —
examinadors forenses informàtics, tècnics d'extracció de dispositius
mòbils, custodis de proves de càmeres corporals, supervisors de
laboratori — que vulguin publicar un segell ancorat a Bitcoin i
revelador d'alteracions de *quins bytes es van adquirir* i *quan*, al
moment de l'adquisició de proves digitals, perquè les disputes de
cadena de custòdia tinguin una àncora pública.

---

## Què NO fa aquest kit (llegir primer)

El segell és una marca de temps criptogràfica de QUINES IMATGES
FORENSES es van adquirir, QUAN es van adquirir, per QUINA AGÈNCIA, sota
QUIN MANAMENT i mitjançant QUINA METODOLOGIA. No pot respondre cap
pregunta sobre el cas més enllà d'això. Les següents qüestions queden
**fora del domini del segell**:

1. **Admissibilitat sota les Federal Rules of Evidence (o qualsevol
   altre codi probatori).** El segell ancora bytes i marques de temps.
   Si una prova és admissible — sota FRE 901 (autenticació), FRE 702
   (testimoni expert / Daubert), FRE 403 (balanç de prejudici) o
   qualsevol equivalent estatal — és una qüestió de procediment legal.
   Una adquisició perfectament segellada encara pot ser declarada
   inadmissible; una adquisició no segellada encara pot ser admesa. El
   segell és prova addicional d'integritat, no un substitut de la
   decisió d'admissibilitat del tribunal.

2. **Si la confiscació va ser legal.** El compliment de la Quarta
   Esmena, la validesa del manament, l'adherència a l'abast,
   l'aplicabilitat de la regla d'exclusió — tot això queda aigües amunt
   del segell. El segell registra que l'adquisició va passar sota el
   manament FICT-SW-2026-0188; si el manament es va emetre i servir
   legalment correspon al tribunal.

3. **Si la prova és incriminatòria, exculpatòria o neutra.** El segell
   ancora hashes; les interpretacions del que contenen aquests hashes
   pertanyen a l'informe d'examen forense, que és el seu propi document
   amb el seu propi règim de descobriment i probatori. El segell es
   negarà a segellar "FACT N: el portàtil del sospitós contenia
   material incriminatori" — vegeu la regla de denegació R4.

4. **Si la cadena de custòdia és procedimentalment correcta sota la
   llei probatòria de l'estat aplicable.** El segell registra el log
   d'esdeveniments de custòdia contemporani de l'agència (FACT 05). Si
   aquest log satisfà els requisits de cadena de custòdia d'un estat
   particular correspon al tribunal a l'audiència probatòria.

5. **Si la metodologia forense era fiable.** Daubert i la seva
   descendència (i equivalents estatals com Frye, on encara s'aplica)
   avaluen la fiabilitat metodològica. El segell registra QUINES eines i
   versions s'han utilitzat (FACT 04); si aquestes eines compleixen
   l'estàndard de fiabilitat de qualsevol tribunal específic correspon
   al tribunal. S'han documentat errors d'eines posteriorment a
   l'adquisició en casos passats; el paper del segell és fer que el
   registre de versió-i-hash-binari sigui públicament refutable, no
   garantir les eines mateixes.

6. **Si la prova es va manipular ABANS de l'adquisició.** El segell
   ancora bytes des del moment de la imatge cap endavant. Si un
   sospitós, un agent o un tercer va alterar el dispositiu origen
   abans que fos imaginat, el segell no pot detectar-ho — segella els
   bytes alterats amb la mateixa integritat amb què segellaria
   l'original. El valor del segell comença a la marca de temps de la
   imatge.

7. **Si es va respectar l'abast del manament.** L'annex del manament
   defineix què es pot adquirir; el segell registra què es VA adquirir.
   Si l'adquisició va excedir l'abast del manament és, de nou, una
   qüestió legal amb el seu propi remei (moció de supressió sota el
   procediment de l'estat apropiat).

8. **Reidentificar qualsevol part privada de la investigació.** El
   segell es nega a publicar qualsevol nom, identificador o empremta
   que pugui reidentificar un sospitós, acusat, víctima, testimoni o
   ocupant del local. La referència al sumari del cas és el handle
   apropiat per a les parts amb legitimació per localitzar el cas.

**La secció de límits honestos anterior és la part de càrrega d'aquest
kit.** Els equips forenses que creguin que segellar equival a
admissibilitat l'usaran com a escut. El kit ha de dir clarament:
*aquest és una primitiva de no-repudi per al moment d'adquisició, no
una prova d'adquisició legal, solidesa metodològica o cadena de
custòdia reconeguda pel tribunal.*

---

## Què aquest kit S'HA DE NEGAR a segellar

El kit està configurat per rebutjar els següents patrons de fets fins i
tot si un usuari amb autoritat de signatura d'agència vàlida els
presenta:

- **Identificació personal de sospitosos, acusats, víctimes, testimonis
  o qualsevol tercer privat.** La referència al sumari del cas és el
  handle per a les parts amb legitimació; el segell públic no ha de ser
  un índex de reidentificació.
- **Noms personals d'examinadors forenses o altre personal d'agència al
  segell públic.** Els rols són públics; els enllaços persona-a-rol es
  segellen per separat i són descobribles sota procés judicial.
- **Hashes (o empremtes) a nivell de fitxer de material sospitós
  d'abús sexual infantil, plantilles biomètriques o qualsevol dada
  reidentificadora de persones vulnerables — fins i tot per hash.** Un
  SHA-256 d'un fitxer individual és un identificador permanent
  cercable; publicar-lo a un registre públic pot revictimitzar subjectes
  via correlació amb bases de dades privades. Els hashes a nivell
  d'imatge (a nivell d'imatge-forense) de discs sencers són
  acceptables; els hashes a nivell de fitxer d'aquest material NO són
  MAI acceptables.
- **Conclusions, interpretacions, opinions o conclusions d'examen sobre
  què signifiquen els bytes.** El segell ancora QUINS BYTES es van
  adquirir i QUAN. La interpretació pertany a l'informe d'examen
  descobrible, no a un registre públic revelador d'alteracions.
- **Reclamacions d'admissibilitat o qualsevol altra conclusió legal**
  ("aquesta prova és admissible", "el manament era legal", "la cadena
  de custòdia era adequada sota §X.Y"). Les conclusions legals són
  funcions del tribunal.
- **Segellat per qualsevol que no sigui el principal autoritzat de
  l'agència adquirent.** Un expert de la defensa pot utilitzar el kit
  per segellar la seva pròpia verificació independent del manifest; no
  poden segellar l'adquisició ORIGINAL sota el nom de l'agència
  adquirent.
- **Enllaços rol-a-individu dins del segell públic.** Els enllaços es
  segellen en un registre acompanyant separat (hasheat al FACT 05) sota
  control d'accés de l'agència.
- **Fets investigatius previs a la confiscació o al manament.**
  Declaracions d'informants, vigilància prèvia al manament, entrades
  de construcció paral·lela — cap d'aquests pertanyen al segell
  d'adquisició. El segell està limitat a l'esdeveniment d'adquisició.

Una denegació en si mateixa pot ser segellada com un fet ("Aquesta
agència va sol·licitar el segellat de X; el kit es va negar segons la
regla de denegació Y"), creant un registre públic d'intent d'abús.

---

## Què aquest kit SÍ segella

8 fets al moment d'adquisició:

1. **Avís d'exemple** — declara la publicació com a exemple (les
   atestacions reals eliminen o reemplacen això).
2. **Context d'adquisició** — identificador del cas, citació del
   manament, agència adquirent, autoritat sol·licitant, data/hora de
   confiscació i adquisició, ubicació d'adquisició (la ubicació de la
   confiscació es redacta a un registre acompanyant segellat per
   separat per evitar reidentificar el local).
3. **Manifest de proves** — per ítem d'imatge-forense: hash SHA-256,
   mida del fitxer, identificador anonimitzat del dispositiu origen,
   mètode d'adquisició, format d'imatge forense.
4. **Metodologia d'adquisició** — noms d'eines forenses i versions
   exactes (amb hashes binaris d'eines), marca/model i firmware del
   bloquejador d'escriptura, referència de verificació NIST CFTT,
   procediment de verificació utilitzat, elecció de format d'imatge.
5. **Log de cadena de custòdia** — cronologia per esdeveniment des de
   la confiscació inicial fins al final de la imatge, custodis
   identificats per ROL (no per nom), amb hashes de registres
   acompanyants segellats per separat (enllaç rol-a-individu, log GPS
   de transport, log d'accés al casier de proves, fotografies del segell
   anti-manipulació, etc.).
6. **Qualificacions de l'examinador per rol** — certificacions
   tinguda, estat de formació contínua, recompte d'experiència prèvia
   com a testimoni expert, exposició Daubert, divulgacions de conflicte
   d'interès — totes a nivell de rol, no personals.
7. **Divulgacions acompanyants i registre de denegació** —
   investigacions paral·leles, impugnacions de manament pendents,
   mocions de prova suprimida, protocol de filtre de privilegi /
   equip-d'aïllament en vigor, intents d'adquisició previs, revisió del
   bug-tracker del proveïdor; llista explícita de patrons que el kit es
   va negar a segellar.
8. **Principal signant** — identificació de l'agència adquirent +
   signatari a nivell de rol (examinador líder) + cosignatari a nivell
   de rol (supervisor d'unitat) + informació de clau criptogràfica.

Cada fet acaba amb la convenció de porta-denegació: *"Aquest fet
afirma només X. No afirma Y"* (on Y és el mode de fallada més proper de
la secció "NO fa" anterior).

---

## Què defensa aquest kit

- **Alteració silenciosa post-adquisició d'una imatge forense.**
  Qualsevol canvi a nivell de byte a qualsevol imatge produeix un
  SHA-256 diferent, i la imatge post-canvi no verificarà contra el
  manifest segellat de FACT 03.
- **Reclamació que "es van utilitzar eines diferents".** FACT 04
  registra versions exactes d'eines amb hashes binaris d'eines;
  reclamacions posteriors "en realitat vam utilitzar v4.7.0, no
  v4.7.1" són públicament refutables.
- **Reclamació que el bloquejador d'escriptura no estava activat, o
  que es va utilitzar un model diferent.** FACT 04 congela el manifest
  del bloquejador d'escriptura.
- **Alteració del log de custòdia.** Qualsevol canvi a la cronologia
  d'esdeveniments de custòdia de FACT 05 (afegir, eliminar o
  remarcar-temps un esdeveniment) canvia el hash de FACT 05 i és
  públicament detectable.
- **Substitució de les credencials d'un examinador diferent.** FACT 06
  congela el perfil de credencials a nivell de rol al moment
  d'adquisició.
- **Omissió selectiva de divulgacions acompanyants.** FACT 07 enumera
  les categories de divulgació esperades; una categoria buida ha de
  ser atestada explícitament ("cap al moment d'adquisició"), de manera
  que un posterior "no ens vam adonar que això era rellevant" és
  públicament refutable.
- **Reclamacions post-adquisició que l'examinador tenia un conflicte
  que no es va divulgar.** La divulgació de conflicte de FACT 06 es
  congela a l'adquisició; els reptes posteriors poden ser provats
  contra ella.

El kit **no** defensa contra la corrupció contemporània — un equip que
intencionadament segella metadades falses al moment d'adquisició
produeix un segell criptogràficament vàlid de metadades falses. La
primitiva és honesta sobre això: és una primitiva de no-repudi per a
les afirmacions contemporànies de l'agència, no una prova que
aquestes afirmacions siguin correctes.

---

## Casos històrics o quasi-històrics amb què el kit hauria ajudat

El kit hauria produït una àncora útil — *no una resolució* — en casos
passats on la cadena de custòdia de proves digitals es va convertir en
una qüestió probatòria disputada. Per evitar nomenar acusats (que són
parts privades fins i tot quan són condemnats), aquests es descriuen
per tipus de cas, no per individu nomenat:

- **La controvèrsia federal de mig-2010s sobre errors d'eines
  forenses** en què es va descobrir, post-adquisició, que una eina
  d'imatge forense àmpliament utilitzada tenia un error de cas extrem
  que afectava un tipus específic de mitjà d'origen. Un manifest
  d'adquisició segellat amb dades congelades de versió-i-hash-binari
  d'eines hauria permès a la defensa i la fiscalia acordar exactament
  quina versió s'havia utilitzat, eliminant un eix de disputa.

- **Múltiples casos estatals que involucraven sortides d'extracció de
  dispositius mòbils disputades**, on el proveïdor de l'eina
  d'extracció va publicar més tard un pegat de correcció d'errors i la
  qüestió es va convertir en "l'error va afectar aquest cas". Un fet
  metodològic segellat permet respondre la pregunta contra dades de
  versionat congelades, en lloc de contra la memòria actual de
  l'agència de quina versió es va utilitzar.

- **Disputes de transferència de càmeres corporals** en casos on
  s'al·legava posteriorment que el sistema de docking del proveïdor de
  BWC permetia modificacions de gravacions en trànsit. Un manifest
  segellat de l'arxiu de càmera corporal al moment de recepció per
  l'agència ancora quins bytes va rebre l'agència del sistema de
  docking; les edicions posteriors al costat de l'agència són
  públicament detectables.

- **Controvèrsies de col·lisió de hash en casos forenses informàtics**,
  on un expert de la defensa va argumentar que MD5 (encara en ús en
  alguns fluxos de treball heretats) era inadequat. Una adquisició
  segellada que registra TANT MD5 COM SHA-256 permet que SHA-256 es
  mantingui fins i tot si MD5 és impugnat.

- **Disputes sobre l'evolució de la metodologia d'examen entre
  l'adquisició i el judici.** Quan un cas es manté entre l'adquisició
  i el judici durant anys, la metodologia que era estàndard a
  l'adquisició pot haver estat substituïda al moment del judici. El
  registre segellat permet al tribunal avaluar la metodologia contra
  l'estàndard que era actual al moment de l'adquisició, no contra
  l'estàndard posterior.

El kit NO hauria resolt les disputes subjacents sobre culpabilitat o
innocència en cap d'aquests tipus de cas. Hauria resolt una sub-disputa
probatòria específica: si els bytes, eines i procediments eren el que
l'agència afirma que eren al moment que l'agència afirma.

---

## Quan utilitzar aquest kit

- La vostra agència té un SOP forense estable i vol afegir una
  atestació pública ancorada a Bitcoin com a capa reveladora
  d'alteracions a sobre de la cadena-de-custòdia paper-i-signatura
  existent.
- Espereu que aquest cas involucri reptes significatius de la defensa
  a les proves forenses (cas d'alta importància, metodologia nova,
  versions d'eines disputades, etc.).
- Podeu publicar el conjunt de fets llistat sense exposar PII o dades
  reidentificadores de persones vulnerables. (Les regles de denegació
  del kit ho fan complir; si els vostres fets requerissin trencar una
  regla de denegació, no utilitzeu el kit.)
- L'advocat general de l'agència adquirent i l'oficina del fiscal han
  revisat el pla de publicació. La publicació pública d'un artefacte
  portador d'identificador de cas té implicacions per a investigacions
  en curs; la revisió per advocat no és opcional.
- Les regles de descobriment de la defensa de la vostra jurisdicció són
  compatibles amb el fet que l'agència mantingui per separat el
  registre d'enllaç rol-a-individu (hasheat al FACT 05). Si la vostra
  jurisdicció requereix divulgació pública del nom de l'examinador,
  heu d'esmenar el kit en conseqüència.

## Quan NO utilitzar aquest kit

- **No utilitzeu com a substitut de la documentació de cadena de
  custòdia existent de l'agència.** Aquest kit és *additiu*, no
  reemplaçament. El CMS de l'agència, el log de custòdia i les
  obligacions de producció de descobriment són inalterades.
- **No utilitzeu si l'adquisició involucra CSAM, plantilles biomètriques
  o altres dades reidentificadores de persones vulnerables a nivell de
  fitxer.** Els hashes a nivell d'imatge de discs sencers són
  acceptables; els hashes a nivell de fitxer d'aquest material NO són
  MAI acceptables, fins i tot sota renúncia de regla de denegació. Si
  no podeu construir un conjunt de fets sense trencar R3, no utilitzeu
  el kit.
- **No utilitzeu per reclamar que el manament era legal, la
  confiscació era adequada o la prova és admissible** — el kit no pot
  fer això, i la regla de denegació R5 rebutjarà qualsevol reclamació
  d'aquest tipus.
- **No utilitzeu sota pressió per segellar abans que l'adquisició
  estigui completa.** Un segell d'adquisició parcial mal representa
  l'estat.
- **No utilitzeu per publicar noms personals d'examinadors** llevat
  que la vostra jurisdicció ho requereixi específicament i els vostres
  examinadors hagin consentit individualment. El predeterminat és
  publicació a nivell de rol.
- **No utilitzeu en casos segellats o sota segell** sense permís
  explícit del tribunal. Publicar un identificador de cas a Bitcoin és
  irreversible; si el cas es segella més tard, el segell públic no es
  pot retirar. El kit és per a adquisicions de registre públic
  només.
- **No utilitzeu com a teatre de legitimitat.** Un segell d'una
  adquisició defectuosa és un registre públic permanent dels defectes,
  no una defensa contra ells. La primitiva talla en ambdós sentits;
  aquesta és la seva honestedat.

## Com bifurcar aquest kit per a una adquisició real

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Temporització crítica:** segelleu AL o just després de la conclusió
de la imatge (FACT 05 esdeveniment E17 a la cronologia d'exemple). Un
segell durant la imatge crea un registre d'adquisició parcial; un
segell molt més tard crea una bretxa durant la qual l'agència podria
haver alterat les imatges. La finestra correcta és immediatament
després que la verificació d'imatge es completi per a l'últim ítem del
conjunt d'exhibits.

**Revisió crítica:** abans de segellar, passeu la publicació per un
segon examinador forense (no el líder) i per l'advocat de l'agència. Un
cop segellada, la publicació és permanent.

## Integració amb la infraestructura de cadena de custòdia existent

- **Sistema de Gestió de Casos (CMS) de l'agència.** El CMS roman el
  sistema primari de registre de l'agència. El segell no reemplaça el
  CMS; es compromet als bytes i metodologia que el CMS registra, de
  manera que les edicions post-hoc del CMS són públicament
  detectables.
- **Federal Rules of Evidence / Daubert / codis probatoris estatals.**
  El segell contribueix al registre d'autenticació FRE 901 proporcionant
  integritat reveladora d'alteracions. NO satisfà FRE 702 / Daubert
  per si mateix; la fiabilitat metodològica encara és provada a
  l'audiència probatòria.
- **Descobriment de la defensa (FRCP 16, Brady, Giglio i equivalents
  estatals).** Els registres acompanyants hasheats al FACT 05 (enllaç
  rol-a-individu, log de custòdia, fotos del segell anti-manipulació,
  etc.) romanen subjectes al descobriment normal. El segell ancora què
  reclamaven aquests registres al moment de l'adquisició, de manera
  que una posterior "el registre era diferent en aquell moment" és
  públicament refutable.
- **NIST Computer Forensics Tool Testing (CFTT).** El kit fa referència
  als logs de verificació CFTT al FACT 04 / FACT 05; la referència és
  un hash, no el log mateix, de manera que els processos CFTT no es
  veuen afectats.
- **Neutrals nomenats pel tribunal i experts de la defensa.**
  Qualsevol d'ells pot tornar a hashear les imatges forenses que
  reben en descobriment contra el manifest de FACT 03,
  independentment de qualsevol cooperació de l'agència. Aquest és el
  valor afegit primari del kit per al costat de la defensa.
- **Revisió d'apel·lació.** Anys després, un revisor forense d'apel·lació
  pot verificar la metodologia d'adquisició original contra el registre
  segellat de FACT 04, en lloc de contra el record actual possiblement-
  evolucionat de l'agència.

## Què aquest kit NO reemplaça

- Les Federal Rules of Evidence (o qualsevol codi probatori estatal).
- Estàndards de fiabilitat Daubert / Frye per a testimoni expert.
- El SOP forense i el CMS de l'agència.
- Obligacions de descobriment de la defensa sota FRCP 16 / Brady /
  Giglio / equivalents estatals.
- Ordres judicials, mocions de supressió, audiències probatòries o
  qualsevol altre procés administrat pel tribunal.
- NIST CFTT o qualsevol altre règim de prova d'eines.
- El protocol de filtre de privilegi / equip-d'aïllament de l'agència.

## Per què aquest kit existeix en v0.4.0+

Aquest és el 8è exemple treballat enviat amb myriam-kit. Segueix
l'estructura constraint-first validada per l'autoresearch documentada a
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — la variant de prompt
constraint-first va obtenir la puntuació més alta en una rúbrica
ponderada en múltiples dominis d'exemple. Les seccions inicials són
les parts de càrrega del kit; el contingut del manifest és la part
fàcil.

El disseny del kit és deliberadament conservador en la publicació de
noms d'examinadors i agressiu en el disclaimer "això no estableix
admissibilitat". La comunitat forense té una història documentada de
ser atacada pel seu treball forense; el kit predetermina a la posició
més segura per als examinadors. Les agències en jurisdiccions on es
requereix nomenament personal públic poden esmenar la seva bifurcació
en conseqüència, però la denegació predeterminada afavoreix la
seguretat de l'examinador.

## Llicència

Domini públic (CC0). Bifurqueu-lo. No es requereix atribució.
