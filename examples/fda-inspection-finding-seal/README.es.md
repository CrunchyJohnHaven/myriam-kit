*Traducción al español — para la versión original en inglés, véase [README.md](README.md)*

# Kit de sello de hallazgos de inspección Formulario FDA 483

Un ejemplo myriam-kit listo para usar para investigadores de la FDA
(y las cadenas de supervisión que los respaldan) que desean sellar un
Formulario FDA-483 de Observaciones de Inspección en el momento de
emisión en la reunión de cierre — haciendo cualquier suavización
silenciosa post-inspección, eliminación o revisión metodológica
criptográficamente detectable.

El kit está orientado a los EE. UU. Está construido alrededor del
flujo de trabajo real del Formulario FDA 483 / Establishment
Inspection Report (EIR), las citaciones de 21 CFR Parte 211, las
clasificaciones preliminares NAI/VAI/OAI, y la rendición de cuentas
supervisoria de la FDA-District-Office.

---

## Lo que este kit NO hace (leer primero)

El sello es una marca de tiempo criptográfica de lo que decía un
Formulario 483 en el momento de emisión en la reunión de cierre. No
puede hacer que la inspección sea correcta. Los siguientes modos de
falla están **fuera del dominio del sello**:

1. **No sustituye el proceso oficial 483/EIR de la FDA.** El sello
   es estrictamente aditivo. El Formulario 483, el EIR, la revisión
   de la District Office, la evaluación de cumplimiento del Center
   y cualquier subsecuente Warning Letter / Consent Decree / acción
   AIP son los instrumentos legales. El sello ancla lo que fue emitido
   en la reunión de cierre; no reemplaza lo que viene después.

2. **No obliga a la empresa a cumplir con las observaciones citadas.**
   El sello registra la observación. La respuesta de la empresa, las
   acciones correctivas y la remediación a largo plazo aún se
   requieren a través del proceso regulatorio ordinario. Una
   observación sellada que la empresa ignora sigue siendo una
   observación ignorada — el sello solo hace que la ignorancia sea
   públicamente observable.

3. **No defiende contra que el inspector mismo sea capturado.** El
   sello es una primitiva de amplificación de coerción: si un
   inspector ha sido presionado a suavizar observaciones ANTES de la
   reunión de cierre, el Formulario 483 sellado registrará la
   versión suavizada con alta integridad. El kit se niega a sellar
   bajo coerción (FACT 07 R7), pero si el inspector no invoca ese
   rechazo, el sello no puede detectar la captura aguas arriba.

4. **No hace que una clasificación NAI sea precisa.** Si el
   inspector realmente no encontró nada, el sello registra "nada
   encontrado" con alta integridad. El sello hace visible el cambio
   silencioso retroactivo; no juzga la calidad subyacente de la
   inspección.

5. **No ancla lo que la empresa subsecuentemente arregla.** Las
   acciones correctivas, cartas de respuesta y el progreso de la
   remediación se sellan apropiadamente en NUEVAS publicaciones que
   referencian esta por Merkle root — no editadas dentro de esta.

6. **No determina la aplicación de la FDA.** Si se emite una
   Warning Letter, si se busca un Consent Decree, si se invoca la
   Application Integrity Policy — todas esas decisiones son aguas
   abajo del Formulario 483 de la reunión de cierre y son tomadas
   por los oficiales de cumplimiento del Center, OGC, y consejería
   DOJ, no por el sello.

**La sección de límites honestos anterior es la parte portante de
este kit.** Los inspectores y supervisores que crean que sellar
equivale a fuerza regulatoria lo usarán incorrectamente como
apalancamiento. El kit debe decir claramente: esta es una
*primitiva de no-repudio para el momento de la reunión de cierre*,
no una acción regulatoria en sí misma.

---

## Lo que este kit DEBE REHUSAR sellar

El kit está configurado para rechazar los siguientes patrones de
hechos incluso si un usuario con autoridad de firma válida los
presenta:

- **PII del paciente o identificadores del sujeto del ensayo de
  eventos adversos citados.** Nombres, fechas de nacimiento,
  números de registros médicos, ID de seguros, e IDs de sujeto de
  ensayo clínico NO DEBEN aparecer en ningún hecho sellado. Solo
  las referencias de caso no identificadas son sellables.
- **Identidades de empleados denunciantes que proporcionaron
  información a los inspectores.** El nombre del denunciante, rol,
  fechas de empleo, patrón identificativo de alegaciones, o
  cualquier otro detalle de re-identificación NO DEBEN ser
  sellados.
- **Fórmulas de secreto comercial o procesos de fabricación.**
  Detalles cuantitativos de fórmulas, parámetros propietarios de
  proceso y recetas de proceso de lotes de validación NO DEBEN ser
  sellados textualmente. El sello hace referencia a tales
  documentos solo por hash SHA-256, lo cual prueba que el documento
  existió sin exponer su contenido.
- **Hallazgos parciales durante una inspección en curso.** El kit
  se niega a sellar un Formulario 483 a mitad de inspección. La
  sellación está permitida SOLO en la reunión de cierre, cuando
  todas las observaciones están finalizadas.
- **Sellación por cualquier persona que no sea el investigador
  real.** Un District Director, revisor del Center, o cualquier
  otra parte que busque sellar un hallazgo de inspección debe
  hacerlo como una publicación SEPARADA atribuida a sí mismo — no
  bajo la autoridad del investigador.

Un rechazo en sí mismo puede ser sellado como un hecho ("Esta parte
solicitó la sellación de X; el kit rechazó según la regla de rechazo
Y"), creando un registro público del intento de abuso.

---

## Lo que este kit SÍ sella

8 hechos en el momento de emisión en la reunión de cierre del
Formulario 483:

1. **Aviso de ejemplo** — declara la publicación como un ejemplo
   (las atestaciones reales lo eliminan o reemplazan).
2. **Identificación de la inspección** — nombre legal del
   establecimiento, d/b/a, dirección física, FEI + DUNS, tipo de
   inspección, número FACTS, fechas de inicio y fin, persona más
   responsable, investigadores por nombre y rol.
3. **Observaciones del Formulario 483** — texto literal de cada
   observación con citación a la sección específica de 21 CFR
   violada, más un SHA-256 por observación para que cualquier
   reformulación de una sola observación sea detectable
   independientemente.
4. **Manifiesto de evidencia** — hashes SHA-256 de fotografías,
   copias de documentos obtenidas bajo 21 USC 374, y registros de
   recolección de muestras del Formulario 484.
5. **Clasificación preliminar** — determinación preliminar NAI /
   VAI / OAI del investigador en el cierre, con confianza declarada
   y base, además de compromisos del investigador de memorar
   cualquier reclasificación silenciosa posterior.
6. **Ventana de respuesta** — fecha límite de la empresa para
   responder (15 días hábiles desde la emisión según el Programa
   de Cumplimiento 7356.002), método de emisión, y compromisos
   post-respuesta.
7. **Divulgaciones acompañantes y registro de rechazo** —
   litigación pendiente, inspecciones previas en la instalación,
   recusaciones de esta inspección, actividad paralela conocida de
   la FDA, declaraciones registradas de la empresa; lista explícita
   de patrones que el kit rechazó sellar.
8. **Principal firmante** — investigador principal + co-investigador
   + experto en la materia, con cadena supervisoria (supervisor /
   CSO / District Director) nombrada para rendición de cuentas.

Cada hecho termina con la convención de puerta-de-rechazo: *"Este
hecho afirma solo X. No afirma Y"* (donde Y es el modo de falla más
cercano de la sección "NO hace" anterior).

---

## Contra qué defiende este kit

El sello hace los siguientes modos de falla criptográficamente
detectables:

- **Suavización silenciosa retroactiva de observaciones.** Cualquier
  cambio post-emisión al texto literal en FACT 03 produce un
  SHA-256 diferente para la observación afectada, un hash de hoja
  diferente, y un Merkle root diferente — todos los cuales fallan
  la verificación OTS contra el sello anclado a Bitcoin.
- **Eliminación post-inspección de citaciones.** Eliminar una
  observación entera del EIR (vs. lo que fue emitido en el cierre)
  cambia el conteo y la lista de hashes por observación. Detectable
  por diff contra FACT 03.
- **Revisión metodológica para suavizar un hallazgo.** Cambiar una
  citación de 21 CFR de una sección más severa a una menos severa
  (p. ej. 211.192 a 211.180(e)) después de la emisión es un cambio
  de hash por observación.
- **Degradación silenciosa de clasificación.** Una OAI en el cierre
  siendo silenciosamente reclasificada como VAI antes de la
  publicación del EIR es detectable contra la clasificación
  preliminar sellada en FACT 05. El investigador conserva el
  recurso forense de publicar un nuevo memo sellado describiendo la
  degradación.
- **Extensión o truncamiento silencioso de la ventana de respuesta.**
  Cualquier desviación de la fecha límite del 2026-06-04 (FACT 06)
  que no sea ella misma sellada como una nueva publicación es
  detectable.
- **Sustitución de archivos de evidencia.** Re-hashear cualquier
  fotografía, copia de documento, o registro de recolección de
  muestras contra FACT 04 revela cualquier sustitución de archivos
  post-emisión.
- **Borrado de patrones.** La revisión silenciosa de EIRs de
  inspecciones previas (FACT 07 C2) para hacer que los hallazgos
  actuales parezcan una primera-ocurrencia en lugar de un patrón
  es detectable contra los hashes de EIR previos sellados.

## Casos históricos o casi-históricos con los que el kit habría ayudado

El kit habría producido un anclaje útil — *no una corrección* — en
casos que involucran:

- **Theranos (inspecciones de la FDA, 2015-2016).** El Formulario
  483 emitido en la instalación de Newark fue contestado y hubo
  alegaciones de que las observaciones fueron suavizadas en
  relación con lo que los inspectores inicialmente encontraron. Un
  Formulario 483 sellado de la reunión de cierre habría preservado
  el texto emitido por el inspector como un anclaje público contra
  cualquier versión posterior más suave.
- **Contaminación con heparina (2008).** Múltiples inspecciones de
  la FDA de proveedores contratados en China precedieron el evento
  de contaminación. La pregunta de qué encontraron los inspectores
  de la FDA, cuándo lo encontraron, y cómo los hallazgos escalaron
  a través de la cadena de revisión de la District-Office y el
  Center ha sido objeto de investigación subsecuente. Formularios
  483 sellados de la reunión de cierre en cada punto de inspección
  habrían proporcionado una cronología inequívoca.
- **Peanut Corporation of America (PCA, 2008-2009).** Inspecciones
  previas de la FDA y estatales en la planta de Blakely, Georgia
  identificaron condiciones que, en retrospectiva, fueron
  precursoras del brote de Salmonella. Formularios 483 históricos
  sellados habrían hecho públicamente auditable el patrón de
  hallazgos repetidos — y la respuesta regulatoria, o ausencia de
  ella — en ese momento, no solo en la litigación post-brote.

El kit NO habría resuelto las preguntas subyacentes sobre si las
inspecciones fueron lo suficientemente exhaustivas, si la District
Office actuó sobre los hallazgos, o si la Agencia en general tenía
los recursos y la autoridad para obligar al cumplimiento de la
empresa.

## Cuándo usar este kit

Debe considerar sellar una emisión de Formulario 483 de reunión de
cierre si:

- Usted es un investigador de la FDA (o líder de un equipo de
  inspección) que tiene razón para creer — basado en el historial
  de inspecciones previas en la misma empresa, presión previa en
  hallazgos similares, o la política de las relaciones de la
  empresa — que las observaciones que está emitiendo hoy pueden ser
  revisadas silenciosamente después de la emisión.
- Usted es un investigador supervisor u Oficial de Cumplimiento del
  Distrito que quiere proporcionar a sus investigadores un
  respaldo forense contra el cambio silencioso post-emisión.
- Su District Office está pilotando la publicación de hallazgos de
  inspección bajo las prácticas existentes de FOIA/EIR y quiere
  añadir evidencia criptográfica de manipulación como capa de
  integridad.
- Usted está participando en una inspección de salud pública (p.
  ej. durante un brote activo) donde la integridad contemporánea
  del registro es crítica para la investigación epidemiológica
  subsecuente.

## Cuándo NO usar este kit

NO use este kit si:

- **La inspección aún no ha cerrado.** El kit rechaza la sellación
  parcial a mitad de inspección. Espere la reunión de cierre.
- **El investigador firmante no respalda el contenido.** Un sello
  coaccionado es un registro público permanente de coerción. Si
  las observaciones como están redactadas no reflejan sus
  hallazgos, REHUSE sellar y (por separado) publique un
  registro-de-rechazo.
- **El Formulario 483 contiene PII o contenido identificativo de
  denunciantes.** Des-identifique antes de sellar. Las reglas de
  rechazo del kit R1 y R2 se aplican y el interés subyacente de
  salud pública en proteger la privacidad del paciente y la
  confidencialidad del denunciante es portante.
- **Está sellando bajo presión para avergonzar públicamente a la
  empresa en lugar de para memorializar un hallazgo regulatorio.**
  Un Formulario 483 sellado es un registro regulatorio, no un
  comunicado de prensa. El uso de la primitiva para propósitos
  no-regulatorios degrada su confianza en el uso regulatorio.

## Cómo bifurcar este kit para una emisión real del Formulario 483

```bash
cp -r ~/Genesis/myriam-kit/examples/fda-inspection-finding-seal ~/INS-99-9999999
cd ~/INS-99-9999999
$EDITOR facts/*.txt        # replace fictional content with real Form 483
bash build/seal.sh         # SEAL AT closing meeting, after Form 483 issued
python3 build/verify.py    # confirm
```

**TEMPORIZACIÓN CRÍTICA**: selle EN la reunión de cierre, DESPUÉS
de que el Formulario 483 sea emitido formalmente a la persona más
responsable — no antes. Un sello antes de la emisión en la reunión
de cierre es rechazado por el kit (FACT 07 R4) porque las
observaciones aún no están finalizadas. Un sello mucho después de
la emisión es no-repudio convencional pero pierde la propiedad
anti-revisión más fuerte.

## Integración con la infraestructura existente de inspección de la FDA

- **El Formulario 483 en sí.** El Formulario 483 es el instrumento
  legal. El sello publica el texto literal + un SHA-256 junto a él.
  El sello no modifica, reemplaza o sustituye al Formulario 483.
- **Establishment Inspection Report (EIR).** El EIR es redactado
  después del cierre y publicado según FOIA. Los sellados FACT 03 +
  FACT 05 sirven como comparando: cualquier EIR posterior que
  diverja de las observaciones o clasificación selladas de la
  reunión de cierre es detectable.
- **Revisión de la District Office.** La evaluación de la District
  Office (recomendación de Warning Letter, no-acción, inspección
  de seguimiento) está aguas abajo y no es afectada por el sello.
  Los compromisos declarados del investigador en FACT 05 (de
  memorar cualquier reclasificación) dan al investigador un
  mecanismo forense que opera dentro del proceso de la District
  Office.
- **Evaluación de cumplimiento del Center (CDER / CBER / CDRH /
  CFSAN).** Los oficiales de cumplimiento del Center hacen la
  llamada final de clasificación. El sello no los obliga; solo hace
  visible el desacuerdo silencioso con la clasificación preliminar
  del investigador.
- **Warning Letter / Consent Decree / AIP.** Las acciones
  regulatorias subsecuentes están aguas abajo. Las observaciones
  citadas en una Warning Letter pueden ser comparadas con FACT 03;
  las observaciones en FACT 03 que no aparecen en una Warning
  Letter permanecen en el registro público y permanecen disponibles
  para los peticionarios ciudadanos, demandantes y subsecuentes
  inspectores.
- **FACTS (base de datos de inspección de la FDA).** El sello
  coexiste con el registro interno de FACTS. El número de
  inspección de FACTS es llevado en FACT 02 para que el sello
  pueda ser referenciado cruzadamente desde producciones de FOIA
  derivadas de FACTS.
- **Producciones de FOIA.** Un Formulario 483 sellado es en sí
  mismo un candidato para la divulgación rutinaria de FOIA (los
  Formularios 483 son generalmente publicables después de
  redacción). La URL de publicación del sello o el CID de IPFS
  puede ser adjuntado a la respuesta de FOIA para que el solicitante
  obtenga tanto el documento redactado como el anclaje
  criptográfico.

## Lo que este kit NO reemplaza

- El Formulario 483 en sí, como el registro legal de observaciones
  de inspección bajo 21 USC 374
- El Establishment Inspection Report (EIR) bajo los procedimientos
  del FDA Investigations Operations Manual
- La revisión de la District Office y la evaluación de
  cumplimiento del Center
- Warning Letter u otra acción regulatoria por la Agencia
- La respuesta de la empresa bajo 21 CFR 10.30
- Solicitudes de FOIA bajo 5 USC 552 para los registros de
  inspección subyacentes
- La protección al denunciante bajo 21 USC y las regulaciones de
  OSC

## Esbozo de valor de adopción (no cuantitativo)

La FDA realiza del orden de ~17.000 inspecciones por año a través
de las industrias reguladas de medicamentos, dispositivos,
productos biológicos y alimentos. La gran mayoría son rutinarias e
incontestadas. Una pequeña fracción son contestadas, a veces
vigorosamente. Si incluso el 1% de las inspecciones contestadas
involucraran revisión silenciosa post-inspección — suavización del
lenguaje de observaciones, degradación silenciosa de clasificación,
eliminación tranquila de citaciones — entonces los Formularios 483
sellados de la reunión de cierre expondrían el patrón. Las vidas
salvadas es incalculable pero plausiblemente grande en el límite
si emerge incluso un escándalo a escala Vioxx o Heparina más
temprano de lo que de otra manera habría emergido. La unidad
relevante no es el beneficio promedio por sello; es la detección de
eventos extremos a lo largo de décadas.

El kit es de bajo-costo-por-uso: unos pocos minutos por reunión de
cierre, sin cambio al Formulario 483 subyacente, sin autoridad
regulatoria adicional requerida, totalmente compatible con el
proceso existente de la FDA. La asimetría favorece la adopción.

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
