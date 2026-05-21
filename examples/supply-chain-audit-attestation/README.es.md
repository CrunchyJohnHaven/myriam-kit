*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de Sellado de Atestación de Auditoría de Cadena de Suministro

Un ejemplo llave en mano de myriam-kit para auditores externos sociales/
laborales/ambientales, equipos internos de cumplimiento de proveedores,
investigadores de ONG en cadenas de suministro y organizaciones por los
derechos de los trabajadores que desean publicar un sello anclado en
Bitcoin y evidente ante manipulación de un informe de auditoría en el
momento exacto de la firma final.

---

## Lo que este kit NO hace (lea esto primero)

El sello es una marca temporal criptográfica de aquello que el auditor
firmó. No puede verificar si lo firmado es **verdad**. Los siguientes
modos de falla están **fuera del dominio del sello**:

1. **Captura de la auditoría por parte de la industria.** Las auditorías
   encargadas por marcas tienen una historia larga y documentada de
   producir hallazgos suaves sobre proveedores cuya continuidad
   comercial con la marca contratante mantiene fluida la canalización
   de auditorías. Una auditoría capturada, al sellarse, produce un
   registro forense permanente de la auditoría capturada. El sello no
   corrige la captura — sólo hace que la auditoría-tal-como-emitida
   sea inmutable, para que un proceso posterior de búsqueda de la
   verdad tenga algo concreto con qué comparar.

2. **Trabajadores aleccionados / instalaciones preparadas.** Las
   auditorías anunciadas o semi-anunciadas dan a la dirección días o
   semanas para ensayar las respuestas de los trabajadores, ocultar a
   menores de edad, limpiar dormitorios, retirar equipamiento no
   conforme y desviar trabajo hacia subcontratistas no auditados
   durante la ventana de auditoría. El sello ancla lo que se les
   mostró a los auditores, no lo que se les impidió ver.

3. **Subcontratación oculta.** La subcontratación de Nivel-2 y
   Nivel-3, el trabajo a domicilio y la producción del sector
   informal son invisibles de manera generalizada para las
   auditorías de planta. El sello ancla una auditoría de Nivel-1;
   no puede detectar que el Nivel-1 subcontrate a un Nivel-2 no
   auditado durante la ventana de auditoría o de manera habitual.

4. **Auditorías que sistemáticamente pasan por alto el abuso que se
   proponen detectar.** Rana Plaza, el derrumbe en 2013 de la fábrica
   textil de Bangladés que mató a 1.134 trabajadores, había sido
   auditada por múltiples programas de auditoría encargados por
   marcas en los meses previos. Las grietas en el edificio no
   figuraban en la lista de verificación de auditoría social; el
   régimen de auditoría no tenía alcance de ingeniería estructural.
   Las auditorías anclan lo que está *dentro del alcance*; los abusos
   fuera de alcance permanecen invisibles, independientemente de cuán
   resistente a la manipulación sea el sello.

5. **Represalias posteriores a la firma contra trabajadores que
   participaron en entrevistas.** Incluso rechazando información de
   localización (FACT 07 R3), un adversario determinado que conozca
   el identificador del proveedor puede identificar la instalación.
   La protección de los trabajadores requiere algo más que rechazar
   IPI en el sello — requiere anonimización aguas arriba en la
   metodología de auditoría. El sello hace duradera la
   auditoría-tal-como-emitida; no protege a los entrevistados de
   forma retroactiva.

6. **Condiciones laborales legales pero inhumanas.** Las brechas de
   salario digno en jurisdicciones donde el salario mínimo legal está
   por debajo del salario digno de referencia producen hallazgos de
   auditoría "conformes" frente a las leyes salariales y de horario y
   hallazgos "no conformes" frente a los estándares de salario digno
   en la misma auditoría (FACT 03 elemento 8 en este kit de ejemplo).
   El sello ancla lo que cada estándar reporta; reconciliarlos es
   trabajo de política posterior.

7. **Daños climáticos / ambientales con causalidad difusa.** Las
   emisiones de carbono, las contribuciones a la deforestación, el
   agotamiento de agua y los vertidos contaminantes de los
   proveedores pueden sellarse en los hallazgos de auditoría, pero la
   atribución causal al volumen de pedidos de una marca específica es
   metodológicamente disputada. El sello ancla lo que se midió en el
   proveedor; no asigna responsabilidad moral ni legal.

8. **Disputas sobre qué estándar es autoritativo.** SA8000 vs. BSCI
   vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. códigos de
   conducta específicos de empresa: cada uno tiene alcances,
   gravedades y procesos de remediación distintos. El sello ancla
   *una* auditoría bajo *un* estándar. La comparación entre
   estándares es un problema posterior.

9. **Competencia del auditor vs. credencial del auditor.**
   "Acreditado" no es "competente". Auditores que completaron
   programas de formación acreditados han pasado por alto abusos
   graves en auditorías que precedieron a desastres públicamente
   visibles. El sello ancla las credenciales; no certifica la
   competencia con la que se ejercieron.

**La sección anterior sobre límites honestos es la parte portante de
este kit.** Una marca que quiera teatro de legitimidad utilizará una
auditoría sellada como escudo. El kit debe decirlo con claridad: esto
es una *primitiva de no repudio para el momento de la firma del
informe de auditoría*, no una prueba de cumplimiento del proveedor ni
del bienestar de los trabajadores.

---

## Lo que este kit DEBE NEGARSE a sellar

El kit está configurado para rechazar los siguientes patrones fácticos
incluso cuando los presente un usuario con autoridad válida de
organismo de auditoría:

- **Identificación individual de trabajadores.** Ningún hecho puede
  nombrar a un trabajador, vincular una cita a un trabajador, exponer
  número de identificación, posición en la línea, habitación de
  dormitorio, horario de turno, combinación demográfica con N<5, o
  cualquier campo que pueda reidentificar a una persona que
  participó en entrevistas. Las citas de trabajadores usan tokens
  aleatorios; la correspondencia nunca se sella.
- **Fuentes denunciantes / informantes.** Si un hallazgo descansa
  sobre la revelación de un individuo que asumió riesgo al revelarla,
  el individuo nunca es nombrado o identificado en la publicación
  sellada.
- **Información precisa de localización.** Sin dirección postal, sin
  GPS, sin imágenes satelitales con resolución >1km y sin fotografía
  exterior del edificio. País y región son la resolución máxima
  sellada. Justificación: la identificación de la instalación habilita
  represalias contra los participantes en entrevistas.
- **Reivindicación de certificación de auditoría limpia.** El kit se
  niega a sellar cualquier formulación del tipo "esta auditoría
  prueba que el proveedor cumple" o "no existen violaciones". Las
  reivindicaciones de limpieza son epistémicamente insostenibles bajo
  la metodología de auditoría.
- **Sustitución del sello por certificado.** Una publicación que
  omita metodología (FACT 04), independencia (FACT 06) o rechazos
  (FACT 07) no es una publicación MYRIAM legítima bajo este kit.
- **Auditorías en borrador / previas a la firma.** El sellado ocurre
  en la firma final, no antes. Las auditorías provisionales crean
  certidumbre falsa.
- **Resellado favorable post-hoc.** Una auditoría revisada requiere
  una NUEVA publicación sellada que referencie a la original por raíz
  de Merkle. La auditoría sellada original permanece permanentemente
  visible como la auditoría-tal-como-emitida.
- **Sellado por cualquier parte distinta del organismo de auditoría.**
  Una marca, un proveedor, un organismo certificador o un tercero no
  puede sellar "la auditoría" en lugar del organismo de auditoría que
  firmó el informe.

Un rechazo en sí mismo puede sellarse como un hecho ("Esta parte
solicitó el sellado de X; el kit lo rechazó conforme a la regla de
rechazo Y"), creando un registro público de intento de mal uso. **En
una industria con captura de auditoría generalizada, el rechazo a
sellar puede ser por sí mismo una señal significativa:** un organismo
de auditoría que no vaya a sellar porque una marca presionó para
suavizar los hallazgos tiene la opción de registrar públicamente el
rechazo bajo su propio principal.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la firma de la auditoría:

1. **Aviso de ejemplo** — declara que la publicación es un ejemplo
   (las atestaciones reales eliminan o reemplazan esto).
2. **Alcance y objeto de la auditoría** — estándar de auditoría,
   organismo de auditoría, auditor principal, tamaño del equipo
   auditor, identificador del proveedor (sin información precisa de
   localización), ventana de auditoría, tipo de anuncio (anunciada /
   semi-anunciada / sin anunciar), fecha del informe de auditoría,
   versión de firma, marcas receptoras nombradas, parte contratante.
3. **Manifiesto de hallazgos de auditoría** — conformidad por
   elemento / no conformidad menor / no conformidad mayor / no
   conformidad crítica frente al estándar, cada uno con un SHA-256
   del informe completo del hallazgo. Totales agregados. Recomendación
   de certificación al momento de la firma.
4. **Metodología y evidencia** — asignación de tiempo in situ,
   número de entrevistas (con estratificación: género, condición
   migrante, antigüedad), desglose por formato de entrevista,
   relación con el intérprete, revisión documental con tamaños de
   muestra y hashes de contenido, artefactos de visita a planta (con
   los rostros de los trabajadores difuminados), limitaciones
   conocidas de la metodología.
5. **Acciones correctivas comprometidas** — por cada NC mayor y por
   cada NC menor: plan de acciones correctivas (CAP) con causa raíz
   declarada, fecha límite, mecanismo de verificación, compromisos
   de escalamiento, compromiso de no relajación silenciosa.
6. **Calificaciones del auditor e independencia** — acreditación del
   organismo de auditoría, concentración de clientes, credenciales
   del auditor principal y competencia lingüística, experiencia
   sectorial, declaraciones de independencia (auditor-proveedor,
   auditor-marca, separación del organismo de certificación).
7. **Divulgaciones complementarias y registro de rechazos** —
   conflictos de interés (explícitos), historial de auditorías
   previas, canales de voz de los trabajadores comunicados,
   investigaciones paralelas, disidencia interna del organismo de
   auditoría, lista de reglas de rechazo, rechazos efectivamente
   invocados en esta auditoría.
8. **Principal firmante** — organismo de auditoría, auditor
   principal, equipo auditor, oficial autorizante, información
   criptográfica de la clave.

Cada hecho termina con la convención de compuerta de rechazo: *"Este
hecho afirma únicamente X. No afirma Y"* (donde Y es el modo de falla
más cercano de la sección "lo que NO hace").

---

## Contra qué defiende este kit

- **Suavización silenciosa post-firma de no conformidades mayores.**
  Cualquier cambio en FACT 03 (por ejemplo, una MAJOR_NC
  reclasificada como MINOR_NC, o un hallazgo eliminado por completo)
  produce un SHA-256 distinto, una raíz de Merkle distinta, y falla
  la verificación OTS.
- **Antedatado de cierres de acciones correctivas.** FACT 05 congela
  el CAP y sus fechas límite en el momento de la firma; cualquier
  afirmación de "cerramos esa NC el mes pasado" que entre en
  conflicto con las fechas límite selladas es comparable
  públicamente.
- **Revisionismo metodológico.** FACT 04 congela el número de
  entrevistas, los tamaños de muestra documental y las horas in situ
  al momento de la firma — impidiendo que la defensa posterior tipo
  "hicimos una investigación profunda" sea infalsificable.
- **Republicación selectiva que omite hallazgos desfavorables.** Los
  8 hechos están vinculados por una sola raíz de Merkle; citar
  algunos hechos omitiendo otros es detectable a partir de la lista
  publicada de hojas.
- **Deriva de reivindicaciones de independencia.** FACT 06 congela
  las declaraciones de independencia tal como están al momento de la
  firma. Una reivindicación posterior de "esta auditoría fue
  rigurosamente independiente" debe lidiar con el porcentaje sellado
  de concentración de clientes y la divulgación sellada de encargo
  pagado por marca.
- **Borrado del registro de rechazos.** FACT 07 congela qué patrones
  fácticos rechazó el kit; cualquier reivindicación posterior de
  "nunca rechazamos nada" contradice el registro sellado.

---

## Casos históricos o cuasi-históricos con los que el kit habría
ayudado

El kit habría producido un **anclaje forense útil** — *no una
solución ni una prevención* — en casos que involucran:

- **Rana Plaza (Bangladés, 2013).** El derrumbe del edificio Rana
  Plaza mató a 1.134 trabajadores de la confección e hirió a unos
  2.500. Múltiples marcas cuyos productos se fabricaban en el
  edificio habían auditado proveedores de Nivel-1 dentro del edificio
  poco antes del derrumbe. Las auditorías usaron listas de
  verificación de auditoría social que no incluían alcance de
  ingeniería estructural. Un hecho de metodología sellado (FACT 04)
  en cada una de esas auditorías habría hecho públicamente visible
  la *brecha de alcance* en el momento de la firma — anclando la
  limitación documentada que los programas de auditoría
  retroactivamente afirmaron no tener. El sello no habría prevenido
  el derrumbe. Habría prevenido que la reivindicación posterior de
  la industria "nadie sabía" fuera epistémicamente sostenible.

- **Auditorías de Apple / Foxconn (década de 2010).** Múltiples
  iteraciones de informes de auditoría sobre las instalaciones de
  Foxconn que producían para Apple fueron publicadas con niveles
  variables de gravedad de los hallazgos, contexto del clúster de
  suicidios de trabajadores y reivindicaciones de remediación. Un
  registro sellado en el momento de firma de cada auditoría habría
  impedido que las disputas posteriores sobre "lo que la auditoría
  decía en su momento" dependieran de copias de archivo, copias
  filtradas o publicaciones oficiales revisadas.

- **Cobalto de la RDC (en curso).** La minería artesanal de cobalto
  en la República Democrática del Congo, incluso por niños,
  alimenta las cadenas de suministro de baterías para las
  principales marcas de electrónica y vehículos eléctricos. Múltiples
  auditorías encargadas por marcas durante el periodo 2017-presente
  han producido hallazgos de gravedad variable. El kit aplicado a
  cada auditoría en el momento de la firma habría anclado la
  auditoría-tal-como-emitida; el kit aplicado a los hechos de
  divulgación complementaria (FACT 07 C2: historial de auditorías
  previas) habría hecho públicamente visible la herencia metodológica
  por parte de cada auditor sucesivo de las brechas previas.

- **Minerales de conflicto (estaño, tantalio, tungsteno, oro
  procedentes de la RDC y la región de los Grandes Lagos).** La
  Sección 1502 de la Dodd-Frank produjo obligaciones de auditar y
  divulgar bajo la regla 13p-1 de la SEC. Las disputas sobre la
  adecuación de las auditorías a nivel de fundición y la
  verificación posterior de la cadena de custodia se repitieron a lo
  largo del periodo 2014-2022. Sellos MYRIAM por auditoría habrían
  anclado cada auditoría de fundición en el momento de la firma.

- **Auditorías encargadas por marcas de las cadenas de suministro de
  algodón de Xinjiang (2018-presente).** Las disputas sobre si las
  auditorías podían realizarse de forma fiable bajo las
  restricciones del gobierno de la RPC al acceso de los auditores
  emergieron ampliamente después de 2020. Un hecho de metodología
  sellado (FACT 04) en cada auditoría habría anclado las condiciones
  de acceso que efectivamente aplicaron — haciendo comparables las
  reivindicaciones posteriores de "realizamos una auditoría
  rigurosa" frente a las restricciones metodológicas selladas en el
  momento.

- **Subcontratación de Foxconn e informes de responsabilidad de
  proveedores de Apple en la década de 2010 — descubrimientos
  recurrentes de menores de edad, dormitorios ocultos, violaciones
  de horario.** Los sellos por auditoría habrían anclado los
  *hallazgos negativos* en las auditorías que no encontraron nada,
  junto con los *hallazgos positivos* en las auditorías que sí
  encontraron violaciones — impidiendo el cherry-picking narrativo
  retrospectivo en cualquier dirección.

El kit NO habría prevenido ninguno de estos casos. En varios casos el
problema de fondo era que la auditoría *pasó por alto* el abuso —
sellar una auditoría limpia que debería haber encontrado violaciones
produce un registro permanente de una auditoría fallida, lo que es un
tipo distinto de utilidad (ancla la falla para una rendición de
cuentas posterior) pero no es lo mismo que la prevención.

---

## Cuándo usar este kit

- Usted es un organismo de auditoría que adopta una práctica de
  "publicar lo que firmamos" como defensa frente a la presión de
  suavización post-firma.
- Usted es una ONG que realiza una investigación paralela de cadena
  de suministro y quiere un punto de referencia evidente ante
  manipulación en el momento en que se cierra su investigación.
- Usted es una organización por los derechos de los trabajadores que
  ha obtenido un informe de auditoría y quiere anclar su contenido
  actual antes de que el organismo de auditoría o la marca tengan
  oportunidad de revisarlo.
- Usted es una marca comprometida con la transparencia sobre las
  auditorías que ha encargado, y desea un registro forense
  verificable.
- Usted es periodista, regulador o juez que ancla el contenido de
  una auditoría particular en un momento específico de cara a un
  litigio o reporte posterior.

## Cuándo NO usar este kit

- **No lo use como sustituto del monitoreo liderado por
  trabajadores, las investigaciones independientes de ONG ni la
  organización de los trabajadores.** El kit es *aditivo*, no un
  reemplazo de ninguna de esas vías.
- **No lo use para afirmar que un proveedor cumple.** Una auditoría
  sellada y limpia es, en el mejor de los casos, un insumo en una
  evaluación de cumplimiento. Tratar una auditoría sellada como un
  certificado de cumplimiento es exactamente el teatro de
  legitimidad que las reglas de rechazo basadas en restricciones
  existen para prevenir.
- **No lo use a mitad de auditoría.** Sellar antes de la firma final
  crea un registro de falso positivo del tipo "este es el informe
  de auditoría final".
- **No lo use para sellar un borrador que pretende revisar.** Cada
  versión firmada obtiene su propio sello; las revisiones
  referencian los originales por raíz de Merkle.
- **No lo use bajo presión para sellar antes de la firma, ni para
  omitir una divulgación de hecho complementaria.** Rechace, y (si
  su principal lo permite) selle el rechazo.
- **No lo use como base de una reivindicación de marketing de
  "comercio justo" o "abastecimiento ético" sin divulgar junto al
  sello los límites metodológicos sellados.** Citar el sello sin
  citar los límites es el modo de falla del teatro de legitimidad
  que define la captura de auditoría.
- **No lo use si su organismo de auditoría está estructuralmente
  capturado y no puede publicar hallazgos contrarios al interés
  comercial de la marca contratante.** En ese caso, el sellado
  produce un registro público permanente de la auditoría capturada.
  Eso puede seguir siendo valioso — pero no es lo mismo que
  defenderse de la captura.

---

## Cómo bifurcar este kit para una auditoría real

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Sincronía crítica:** selle EN el momento de la firma — es decir,
cuando el auditor principal firme el informe final y este se
convierta en la posición oficial del organismo de auditoría. Un sello
anterior a la firma crea un registro de falso positivo del tipo "esta
es la auditoría final". Un sello mucho posterior a la firma es
forensicamente más débil frente a modificaciones intermedias.

---

## Integración con la infraestructura existente de auditoría de
cadena de suministro

El kit está diseñado para componerse con, no para reemplazar:

- **SA8000 (Social Accountability International).** Los informes de
  auditoría SA8000 y los documentos del CAP se mapean naturalmente
  con FACT 03 + FACT 05. La referencia de acreditación SAAS encaja
  con FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Los hallazgos de auditoría de la RBA se mapean con
  FACT 03; las reglas de independencia de la firma auditora de la
  RBA se mapean con FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Los hallazgos de
  auditoría de SMETA de 2 pilares y 4 pilares se mapean con FACT 03;
  la plataforma Sedex aloja el informe en bruto — el sello MYRIAM
  ancla un hash de contenido del informe alojado en la plataforma.
- **amfori BSCI.** La mecánica de calificación A–E de BSCI se mapea
  con la recomendación de certificación de FACT 03; el encargo por
  parte de la marca miembro se mapea con la divulgación de
  concentración de clientes de FACT 06 y con FACT 07 C1.
- **Cadena de custodia FSC.** Para cadenas de suministro de
  productos forestales, los certificados de cadena de custodia y los
  calendarios de reauditoría encajan con la estructura de ventana de
  auditoría y CAP.
- **Evaluación de impacto B Lab / B Corp.** La certificación B Corp
  no es una auditoría externa en el sentido de SA8000, pero los
  informes del verificador de la evaluación de impacto pueden
  sellarse bajo este kit (con los hechos reenfocados a la evaluación
  de impacto en lugar de a la auditoría laboral).
- **ISO 26000.** ISO 26000 es una guía, no certificable; el kit no
  tiene integración directa con informes de auditoría ISO 26000,
  pero la taxonomía de responsabilidad social puede informar la
  estructura de elementos de FACT 03 para auditorías internas.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  otros regímenes sectoriales de la industria).** Los programas de
  auditoría específicos de sector pueden sellarse bajo este kit; el
  campo de estándar de auditoría de FACT 02 identifica cuál.
- **Fair Labor Association.** Los informes de monitoreo de fábrica
  de la FLA se mapean con FACT 03 + FACT 05; el marco de monitor
  independiente de la FLA se mapea con las declaraciones de
  independencia de FACT 06.
- **Higg Index (Sustainable Apparel Coalition).** Los productos a
  nivel de instalación de Higg FEM (Facility Environmental Module) y
  Higg FSLM (Facility Social & Labor Module) pueden sellarse bajo
  este kit.
- **CSRD / CSDDD de la UE.** La Directiva sobre Información
  Corporativa en materia de Sostenibilidad (CSRD) y la Directiva
  sobre Diligencia Debida de las Empresas en materia de
  Sostenibilidad (CSDDD) de la UE crean obligaciones de divulgación
  cuyos documentos de verificación pueden sellarse bajo este kit. El
  kit ancla la divulgación-tal-como-emitida, no su adecuación
  sustantiva.

## Lo que este kit NO reemplaza

- Monitoreo liderado por trabajadores (la señal de detección de
  abuso más fiable en cualquier cadena de suministro)
- Investigaciones independientes de ONG (CCC, Labour Behind the
  Label, China Labour Bulletin, Workers' Rights Consortium, etc.)
- Inspección regulatoria (oficinas nacionales de trabajo,
  equivalentes a OSHA, programas de la Oficina de País de la OIT)
- Organización de los trabajadores y negociación colectiva
- Litigios, arbitraje y remediación bajo la legislación laboral
  nacional
- Marcos de diligencia debida del lado de la marca (UNGP, Guía OCDE
  de Diligencia Debida, CSDDD de la UE)

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
