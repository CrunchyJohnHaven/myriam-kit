*Traducció catalana — per a la versió original en anglès, vegeu [README.md](README.md)*

# Kit de Segellat d'Atestació d'Auditoria de Cadena de Subministrament

Un exemple llest per usar de myriam-kit per a auditors externs socials/laborals/
ambientals, equips interns de compliment de proveïdors, investigadors d'ONG en
cadenes de subministrament i organitzacions pels drets dels treballadors que
volen publicar un segell ancorat a Bitcoin i resistent a la manipulació d'un
informe d'auditoria en el moment exacte de la signatura final.

---

## Què NO fa aquest kit (llegiu-ho primer)

El segell és una marca temporal criptogràfica del que l'auditor va signar.
No pot verificar si el que s'ha signat és **veritat**. Els modes de fallada
següents estan **fora del domini del segell**:

1. **Captura de l'auditoria per la indústria.** Les auditories encarregades
   per marques tenen una història llarga i documentada de produir conclusions
   suaus sobre proveïdors el negoci continuat dels quals amb la marca
   contractant manté la canalització d'auditories fluent. Una auditoria
   capturada, quan se segella, produeix un registre forense permanent de
   l'auditoria capturada. El segell no corregeix la captura — només fa que
   l'auditoria-tal-com-emesa sigui immutable, perquè un procés posterior de
   recerca de la veritat tingui alguna cosa concreta amb què comparar.

2. **Treballadors entrenats / instal·lacions preparades.** Les auditories
   anunciades o semi-anunciades donen a la direcció dies o setmanes per
   assajar respostes dels treballadors, amagar treballadors menors d'edat,
   netejar dormitoris, retirar equipament no conforme i desviar feina cap a
   subcontractistes no auditats durant la finestra d'auditoria. El segell
   ancora el que se'ls va mostrar als auditors, no el que se'ls va impedir
   veure.

3. **Subcontractació oculta.** La subcontractació de Nivell-2 i Nivell-3, el
   treball a domicili i la producció del sector informal són invisibles de
   manera generalitzada per a les auditories de planta. El segell ancora una
   auditoria de Nivell-1; no pot detectar que el Nivell-1 subcontracti a un
   Nivell-2 no auditat durant la finestra d'auditoria o de manera habitual.

4. **Auditories que sistemàticament no detecten l'abús al qual van dirigides.**
   Rana Plaza, l'enfonsament d'una fàbrica tèxtil a Bangla Desh el 2013 que
   va matar 1.134 treballadors, havia estat auditada per múltiples programes
   d'auditoria encarregats per marques els mesos previs. Les esquerdes a
   l'edifici no formaven part de la llista de comprovació d'auditoria social;
   el règim d'auditoria no tenia abast d'enginyeria estructural. Les auditories
   ancoren el que està *dins de l'abast*; els abusos fora d'abast queden
   invisibles independentment de la robustesa del segell davant manipulacions.

5. **Represàlies posteriors a la signatura contra treballadors que van
   participar en entrevistes.** Fins i tot rebutjant la informació de
   localització (FACT 07 R3), un adversari determinat que coneix l'identificador
   del proveïdor pot identificar la instal·lació. La protecció dels treballadors
   requereix més que el simple rebuig d'IPI en el segell — requereix
   anonimització amunt en la metodologia d'auditoria. El segell fa duradora
   l'auditoria-tal-com-emesa; no protegeix els entrevistats de forma
   retroactiva.

6. **Condicions laborals legals però inhumanes.** Les diferències respecte al
   salari digne en jurisdiccions on el salari mínim legal és per sota del
   llindar de salari digne produeixen conclusions d'auditoria "conformes"
   contra les lleis salarials i d'horari i conclusions "no conformes" contra
   els estàndards de salari digne en la mateixa auditoria (FACT 03 element 8
   en aquest kit d'exemple). El segell ancora el que cada estàndard reporta;
   conciliar-los és feina política posterior.

7. **Danys climàtics / ambientals amb causalitat difusa.** Les emissions de
   carboni, les contribucions a la desforestació, l'esgotament d'aigua i els
   abocaments contaminants dels proveïdors es poden segellar en conclusions
   d'auditoria, però l'atribució causal al volum de comandes d'una marca
   específica és metodològicament discutida. El segell ancora el que es va
   mesurar al proveïdor; no assigna responsabilitat moral ni legal.

8. **Disputes sobre quin estàndard és autoritzat.** SA8000 vs. BSCI vs. SMETA
   vs. RBA VAP vs. WRAP vs. Fair Trade vs. codi de conducta específic de
   l'empresa: cadascun té diferents abasts, gravetats i processos de
   remediació. El segell ancora *una* auditoria sota *un* estàndard. La
   comparació entre estàndards és un problema posterior.

9. **Competència de l'auditor vs. credencial de l'auditor.** "Credencialitzat"
   no és "competent." Auditors que han completat programes de formació
   acreditats han passat per alt abusos greus en auditories anteriors a
   desastres visibles públicament. El segell ancora les credencials; no
   certifica la competència amb què es van exercir.

**La secció de límits honestos anterior és la part portant d'aquest kit.**
Una marca que vulgui teatre de legitimitat utilitzarà una auditoria segellada
com a escut. El kit ha de dir clarament: això és una *primitiva de no
repudi per al moment de la signatura de l'informe d'auditoria*, no una prova
de compliment del proveïdor o del benestar dels treballadors.

---

## Què el kit DEU REBUTJAR segellar

El kit està configurat per rebutjar els patrons de fets següents fins i tot si
un usuari amb autoritat d'organisme d'auditoria vàlida els envia:

- **Identificació individual de treballadors.** Cap fet no pot anomenar un
  treballador, vincular una cita a un treballador, exposar el número
  d'identificació, la posició a la línia, l'habitació del dormitori, l'horari
  del torn, una combinació demogràfica amb N<5, ni cap camp que pugui
  reidentificar una persona que hagi participat en entrevistes. Les cites
  dels treballadors usen identificadors aleatoritzats; el mapatge no se
  segella mai.
- **Fonts denunciants / informants.** Si una conclusió es basa en la
  divulgació feta per una persona que va córrer un risc per divulgar, la
  persona no s'anomena ni s'identifica mai en la publicació segellada.
- **Informació precisa de localització.** Cap adreça postal, GPS, imatge per
  satèl·lit amb resolució >1km, ni fotografia exterior de l'edifici. El
  país i la regió són la resolució màxima segellada. Justificació: la
  identificació de la instal·lació permet represàlies contra els participants
  en entrevistes.
- **Afirmació de certificació d'auditoria neta.** El kit rebutja segellar
  qualsevol formulació del tipus "aquesta auditoria demostra que el
  proveïdor compleix" o "no existeixen violacions." Les afirmacions de
  neteja són epistèmicament insostenibles per la metodologia d'auditoria.
- **Substitució de segell-com-certificat.** Una publicació que ometi
  metodologia (FACT 04), independència (FACT 06) o rebuigs (FACT 07) no és
  una publicació MYRIAM legítima sota aquest kit.
- **Auditories en esborrany / prèvies a la signatura.** El segellat es
  produeix en la signatura, no abans. Les auditories provisionals creen
  certesa falsa.
- **Resegellat favorable a posteriori.** Una auditoria revisada requereix
  una NOVA publicació segellada que faci referència a l'original per arrel
  de Merkle. L'auditoria segellada original queda permanentment visible
  com a auditoria-tal-com-emesa.
- **Segellat per qualsevol part que no sigui l'organisme d'auditoria.**
  Una marca, un proveïdor, un organisme de certificació o una tercera part
  no poden segellar "l'auditoria" en lloc de l'organisme d'auditoria que
  va signar l'informe.

Un rebuig en si mateix es pot segellar com a fet ("Aquesta part va sol·licitar
segellar X; el kit ho va rebutjar segons la regla de rebuig Y"), creant un
registre públic d'intent de mal ús. **En una indústria amb captura d'auditories
generalitzada, el rebuig a segellar pot ser per si sol un senyal significatiu:**
un organisme d'auditoria que no segella perquè una marca va pressionar per
suavitzar conclusions té l'opció d'enregistrar públicament el rebuig sota el
seu propi principal.

---

## Què SÍ segella aquest kit

8 fets en el moment de la signatura de l'auditoria:

1. **Avís d'exemple** — declara que la publicació és un exemple (les
   atestacions reals eliminen o substitueixen això).
2. **Abast i objecte de l'auditoria** — estàndard d'auditoria, organisme
   d'auditoria, auditor principal, mida de l'equip d'auditoria, identificador
   del proveïdor (sense informació precisa de localització), finestra
   d'auditoria, tipus d'anunci (anunciada / semi-anunciada / no anunciada),
   data de l'informe d'auditoria, versió de signatura, marques destinatàries
   anomenades, part contractant.
3. **Manifest de conclusions d'auditoria** — conformitat / NC menor /
   NC major / NC crítica per element contra l'estàndard, cadascun amb un
   SHA-256 de la redacció completa de la conclusió. Totals agregats.
   Recomanació de certificació en la signatura.
4. **Metodologia i evidència** — assignació de temps in situ, recomptes
   d'entrevistes (amb estratificació: gènere, estatus migratori, antiguitat),
   desglossament del format d'entrevista, relació amb l'intèrpret, revisió
   de documents amb mides de mostra i hashs de contingut, artefactes de
   visita al lloc (amb cares de treballadors difuminades), limitacions
   conegudes de la metodologia.
5. **Accions correctives compromeses** — CAP per NC major i per NC menor amb
   causa arrel declarada, termini, mecanisme de verificació, compromisos
   d'escalat, compromís de no-relaxació-silenciosa.
6. **Qualificacions i independència de l'auditor** — acreditació de
   l'organisme d'auditoria, concentració de clients, credencials i
   competència lingüística de l'auditor principal, experiència sectorial,
   declaracions d'independència (auditor-proveïdor, auditor-marca, separació
   organisme-de-certificació).
7. **Divulgacions complementàries i registre de rebuigs** — conflictes
   d'interessos (explícits), historial d'auditories anteriors, canals de veu
   dels treballadors comunicats, investigacions paral·leles, dissensió
   interna de l'organisme d'auditoria, llista de regles de rebuig, rebuigs
   realment invocats en aquesta auditoria.
8. **Principal signant** — organisme d'auditoria, auditor principal, equip
   d'auditoria, oficial autoritzador, informació de la clau criptogràfica.

Cada fet acaba amb la convenció de porta de rebuig: *"Aquest fet només afirma
X. No afirma Y"* (on Y és el mode de fallada més proper de la secció "NO fa").

---

## Contra què defensa aquest kit

- **Suavització silenciosa posterior a la signatura de no conformitats
  majors.** Qualsevol canvi al FACT 03 (per exemple, una MAJOR_NC reclassificada
  a MINOR_NC, o una conclusió eliminada del tot) produeix un SHA-256 diferent,
  una arrel de Merkle diferent, falla la verificació OTS.
- **Antedatació de tancaments d'accions correctives.** El FACT 05 congela
  el CAP i els seus terminis en la signatura; qualsevol afirmació del tipus
  "vam tancar aquesta NC el mes passat" que entri en conflicte amb els
  terminis segellats és diferenciable públicament.
- **Revisionisme metodològic.** El FACT 04 congela els recomptes d'entrevistes,
  les mides de mostres documentals i les hores in situ en la signatura —
  evitant que la defensa posterior del tipus "vam fer una investigació
  profunda" sigui infalsificable.
- **Republicació selectiva que omet conclusions desfavorables.** Els 8 fets
  estan lligats per una única arrel de Merkle; citar alguns fets mentre
  s'ometen els altres és detectable a partir de la llista de fulles publicada.
- **Deriva de les afirmacions d'independència.** El FACT 06 congela les
  declaracions d'independència en la data de signatura. Una afirmació
  posterior del tipus "aquesta auditoria va ser rigorosament independent"
  ha de bregar amb el percentatge segellat de concentració de clients i
  amb la divulgació segellada de l'encàrrec pagat per la marca.
- **Esborrament del registre de rebuigs.** El FACT 07 congela quins patrons
  de fets va rebutjar el kit; qualsevol afirmació posterior del tipus
  "no vam rebutjar mai res" contradiu el registre segellat.

---

## Casos històrics o quasi històrics en què el kit hauria ajudat

El kit hauria produït una **àncora forense** útil — *no una solució ni una
prevenció* — en casos com:

- **Rana Plaza (Bangla Desh, 2013).** L'enfonsament de l'edifici Rana Plaza
  va matar 1.134 treballadors tèxtils i en va ferir uns 2.500. Diverses
  marques els productes de les quals es fabricaven a l'edifici havien
  auditat proveïdors de Nivell-1 dins de l'edifici poc abans de l'enfonsament.
  Les auditories utilitzaven llistes de comprovació d'auditoria social que
  no incloïen abast d'enginyeria estructural. Un fet de metodologia segellat
  (FACT 04) a cadascuna d'aquelles auditories hauria fet visible públicament
  la *bretxa d'abast* en la signatura — ancorant la limitació documentada
  que els programes d'auditoria van afirmar retrospectivament no tenir. El
  segell no hauria evitat l'enfonsament. Hauria evitat que l'afirmació
  posterior de la indústria que "ningú no ho sabia" fos epistèmicament
  sostenible.

- **Auditories d'Apple / Foxconn (anys 2010).** Múltiples iteracions
  d'informes d'auditoria sobre instal·lacions de Foxconn que produïen per a
  Apple es van publicar amb nivells variables de gravetat de les conclusions,
  context de clústers de suïcidis de treballadors i afirmacions de remediació.
  Un registre segellat del moment de la signatura per a cada auditoria hauria
  evitat que les disputes posteriors sobre "què deia l'auditoria en aquell
  moment" depenguessin de còpies arxivades, còpies filtrades o versions
  oficials revisades.

- **Cobalt de la República Democràtica del Congo (en curs).** L'extracció
  artesanal de cobalt a la República Democràtica del Congo, també per part
  d'infants, alimenta les cadenes de subministrament de bateries de grans
  marques d'electrònica i de VE. Múltiples auditories encarregades per
  marques durant el període 2017–present han produït conclusions de
  gravetat variable. El kit aplicat a cada auditoria en la signatura hauria
  ancorat l'auditoria-tal-com-emesa; el kit aplicat als fets de divulgació
  complementària (FACT 07 C2: historial d'auditories anteriors) hauria fet
  visible públicament l'herència metodològica de cada auditor successiu de
  les bretxes anteriors.

- **Minerals de conflicte (estany, tàntal, tungstè, or de la RDC i la regió
  dels Grans Llacs).** La Dodd-Frank §1502 va generar obligacions
  d'auditoria i divulgació sota la regla 13p-1 de la SEC. Les disputes sobre
  l'adequació de les auditories a nivell de fonedor i la verificació de la
  cadena de custòdia aigües avall es van repetir durant el període 2014–2022.
  Els segells MYRIAM per auditoria haurien ancorat cada auditoria de fonedor
  en la signatura.

- **Auditories encarregades per marques de les cadenes de subministrament
  de cotó de Xinjiang (2018–present).** Les disputes sobre si les auditories
  es podien dur a terme de manera fiable sota les restriccions del govern
  de la RPC a l'accés dels auditors van aflorar àmpliament després del 2020.
  Un fet de metodologia segellat (FACT 04) a cada auditoria hauria ancorat
  quines condicions d'accés s'aplicaven realment — fent diferenciables les
  afirmacions posteriors del tipus "vam fer una auditoria rigorosa" contra
  les restriccions metodològiques segellades del moment.

- **Subcontractació de Foxconn i informes de responsabilitat de proveïdors
  d'Apple als anys 2010 — descobriments recurrents de treballadors menors
  d'edat, dormitoris amagats, violacions d'hores.** Els segells per auditoria
  haurien ancorat les *conclusions negatives* en auditories que no van
  trobar res, juntament amb les *conclusions positives* en auditories que
  sí van trobar violacions — evitant la selecció a posteriori de narratives
  des de qualsevol direcció.

El kit NO hauria evitat cap d'aquests casos. En diversos d'aquests casos el
problema subjacent era que l'auditoria *no va detectar* l'abús — segellar
una auditoria neta que hauria d'haver trobat violacions produeix un registre
permanent d'una auditoria fallida, cosa que és una utilitat de tipus diferent
(ancora la fallida per a una rendició de comptes posterior) però no és el
mateix que la prevenció.

---

## Quan utilitzar aquest kit

- Sou un organisme d'auditoria que adopta una pràctica de "publiquem el que
  hem signat" com a defensa contra la pressió de suavització posterior a
  la signatura.
- Sou una ONG que duu a terme una investigació paral·lela de cadena de
  subministrament i voleu un punt de referència resistent a manipulacions
  en el moment del tancament de la vostra investigació.
- Sou una organització pels drets dels treballadors que ha obtingut un
  informe d'auditoria i voleu ancorar-ne el contingut actual abans que
  l'organisme d'auditoria o la marca tinguin l'oportunitat de revisar-lo.
- Sou una marca compromesa amb la transparència sobre les auditories que
  heu encarregat i voleu un registre forense verificable.
- Sou un periodista, regulador o tribunal que ancora el contingut d'una
  auditoria concreta en un moment específic per a litigis o reporting posterior.

## Quan NO utilitzar aquest kit

- **No l'utilitzeu com a substitut de la monitorització liderada per
  treballadors, les investigacions independents d'ONG ni l'organització
  obrera.** El kit és *additiu*, no un substitut de cap d'aquests elements.
- **No l'utilitzeu per afirmar que un proveïdor compleix.** Una auditoria
  segellada neta és, com a màxim, una entrada en una avaluació de compliment.
  Tractar una auditoria segellada com un certificat de compliment és
  exactament el teatre de legitimitat que les regles de rebuig amb restricció
  prèvia existeixen per evitar.
- **No l'utilitzeu enmig d'una auditoria.** Segellar abans de la signatura
  crea un registre fals positiu del tipus "aquest és l'informe d'auditoria
  final."
- **No l'utilitzeu per segellar un esborrany que voleu revisar.** Cada
  versió de signatura rep el seu propi segell; les revisions referencien
  els originals per arrel de Merkle.
- **No l'utilitzeu sota pressió per segellar abans de la signatura, o
  per ometre una divulgació de fet complementari.** Rebutgeu i (si el vostre
  principal ho permet) segelleu el rebuig.
- **No l'utilitzeu com a base per a una afirmació publicitària de "comerç
  just" o "subministrament ètic" sense divulgar els límits de metodologia
  segellats juntament amb el segell.** Citar el segell sense citar els
  límits és el mode de fallada del teatre de legitimitat que defineix la
  captura d'auditoria.
- **No l'utilitzeu si el vostre organisme d'auditoria està estructuralment
  capturat i no pot publicar conclusions contra l'interès comercial de la
  marca contractant.** En aquest cas, segellar produeix un registre públic
  permanent de l'auditoria capturada. Això encara pot ser valuós — però no
  és el mateix que defensar-se de la captura.

---

## Com bifurcar aquest kit per a una auditoria real

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Calendari crític:** segelleu EN el moment de la signatura — és a dir, quan
l'auditor principal signa l'informe final i esdevé la posició oficial de
l'organisme d'auditoria. Un segell abans de la signatura crea un registre
fals positiu del tipus "aquesta és l'auditoria final." Un segell molt després
de la signatura és forensament més feble contra modificacions intermèdies.

---

## Integració amb infraestructura existent d'auditoria de cadena de subministrament

El kit està dissenyat per compondre's amb, no substituir:

- **SA8000 (Social Accountability International).** Els informes d'auditoria
  SA8000 i els documents CAP s'apliquen naturalment a FACT 03 + FACT 05.
  La referència d'acreditació SAAS encaixa amb FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment Program).**
  Les conclusions d'auditoria de la RBA s'apliquen a FACT 03; les regles
  d'independència de les empreses auditores de la RBA s'apliquen a FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Les conclusions d'auditoria
  SMETA de 2 i 4 pilars s'apliquen a FACT 03; la plataforma Sedex allotja
  l'informe brut — el segell MYRIAM ancora un hash de contingut de l'informe
  allotjat a la plataforma.
- **amfori BSCI.** La mecànica de qualificació A–E de BSCI s'aplica a la
  recomanació de certificació de FACT 03; la contractació basada en
  membresia de marca s'aplica a la divulgació de concentració de clients
  de FACT 06 i a FACT 07 C1.
- **Cadena de custòdia FSC.** Per a cadenes de subministrament de productes
  forestals, els certificats de cadena de custòdia i els calendaris de
  reauditoria encaixen amb l'estructura de finestra d'auditoria i CAP.
- **B Lab / B Corp impact assessment.** La certificació B Corp no és una
  auditoria de tercers en el sentit de SA8000, però els informes del
  verificador de l'avaluació d'impacte es poden segellar sota aquest kit
  (amb els fets reorientats cap a l'avaluació d'impacte enlloc d'auditoria
  laboral).
- **ISO 26000.** ISO 26000 és orientativa, no certificable; el kit no té
  integració directa amb informes d'auditoria ISO 26000 però la taxonomia
  de responsabilitat social pot informar l'estructura d'elements de FACT 03
  per a auditories internes.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program / altres
  règims sectorials).** Els programes d'auditoria específics de sector es
  poden segellar sota aquest kit; el camp d'estàndard d'auditoria de
  FACT 02 identifica de quin es tracta.
- **Fair Labor Association.** Els informes de monitoratge de fàbriques de
  la FLA s'apliquen a FACT 03 + FACT 05; el marc de monitor independent de
  la FLA s'aplica a les declaracions d'independència de FACT 06.
- **Higg Index (Sustainable Apparel Coalition).** Les sortides a nivell
  d'instal·lació de Higg FEM (Facility Environmental Module) i Higg FSLM
  (Facility Social & Labor Module) es poden segellar sota aquest kit.
- **EU CSRD / CSDDD.** La Directiva de Reporting de Sostenibilitat Corporativa
  i la Directiva de Diligència Deguda en Sostenibilitat Corporativa de la
  UE creen obligacions de divulgació els documents de verificació de les
  quals es poden segellar sota aquest kit. El kit ancora la divulgació-tal-com-
  emesa, no la seva adequació substantiva.

## Què aquest kit NO substitueix

- La monitorització liderada pels treballadors (el senyal més fiable de
  detecció d'abusos en qualsevol cadena de subministrament)
- Les investigacions independents d'ONG (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium, etc.)
- La inspecció reguladora (autoritats laborals nacionals, equivalents
  d'OSHA, programes de l'Oficina de País de l'OIT)
- L'organització obrera i la negociació col·lectiva
- El litigi, l'arbitratge i la remediació sota dret laboral nacional
- Els marcs de diligència deguda per part de la marca (UNGP, OECD Due
  Diligence Guidance, EU CSDDD)

## Llicència

Domini públic (CC0). Bifurqueu-lo. No es requereix atribució.
