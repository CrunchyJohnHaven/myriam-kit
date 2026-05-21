*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de Sello de Cadena de Custodia de Pruebas Judiciales

Un ejemplo llave en mano de myriam-kit para equipos de adquisición forense
— peritos en informática forense, técnicos de extracción de dispositivos
móviles, custodios de pruebas de cámaras corporales, supervisores de
laboratorio — que desean publicar un sello anclado en Bitcoin, evidente
ante manipulaciones, de *qué bytes fueron adquiridos* y *cuándo*, en el
momento de la adquisición de pruebas digitales, para que las disputas
sobre la cadena de custodia tengan un anclaje público.

---

## Lo que este kit NO hace (léase primero)

El sello es un sello temporal criptográfico de QUÉ IMÁGENES FORENSES
fueron adquiridas, CUÁNDO fueron adquiridas, por QUÉ ORGANISMO, bajo QUÉ
ORDEN JUDICIAL, y a través de QUÉ METODOLOGÍA. No puede responder
ninguna pregunta sobre el caso más allá de eso. Lo siguiente está
**fuera del dominio del sello**:

1. **Admisibilidad bajo las Federal Rules of Evidence (o cualquier otro
   código probatorio).** El sello ancla bytes y sellos temporales. Si la
   prueba es admisible — bajo la autenticación de la FRE 901, la
   declaración pericial de la FRE 702 / Daubert, el balance de
   prejuicio de la FRE 403, o cualquier equivalente en tribunales
   estatales — es una cuestión de procedimiento legal. Una adquisición
   perfectamente sellada aún puede ser declarada inadmisible; una
   adquisición sin sellar aún puede ser admitida. El sello es prueba
   aditiva de integridad, no un sustituto de la resolución de
   admisibilidad del tribunal.

2. **Si la incautación fue legal.** El cumplimiento de la Cuarta
   Enmienda, la validez de la orden judicial, el respeto al alcance, la
   aplicabilidad de la regla de exclusión — todo esto es previo al
   sello. El sello registra que la adquisición ocurrió bajo la orden
   FICT-SW-2026-0188; si la orden fue legalmente emitida y legalmente
   notificada corresponde al tribunal.

3. **Si la prueba es incriminatoria, exculpatoria o neutral.** El sello
   ancla hashes; las interpretaciones de lo que esos hashes contienen
   pertenecen al informe del examen forense, que es su propio documento
   con su propio régimen probatorio y de descubrimiento. El sello se
   negará a sellar "HECHO N: el portátil del sospechoso contenía
   material incriminatorio" — véase regla de rechazo R4.

4. **Si la cadena de custodia es procedimentalmente correcta bajo la
   ley probatoria del estado aplicable.** El sello registra el log de
   eventos de custodia contemporáneo del organismo (HECHO 05). Si ese
   log satisface los requisitos de cadena de custodia de un estado
   particular corresponde al tribunal en la audiencia probatoria.

5. **Si la metodología forense fue confiable.** Daubert y su progenie
   (y los análogos a nivel estatal como Frye, donde todavía aplica)
   evalúan la confiabilidad metodológica. El sello registra QUÉ
   herramientas y versiones se utilizaron (HECHO 04); si esas
   herramientas cumplen con el estándar de confiabilidad de un tribunal
   específico corresponde al tribunal. Bugs de herramientas han sido
   documentados después de la adquisición en casos pasados; el papel
   del sello es hacer que el registro de versión y hash binario sea
   públicamente refutable, no avalar las herramientas en sí.

6. **Si las pruebas fueron manipuladas ANTES de la adquisición.** El
   sello ancla bytes desde el momento de la obtención de imagen en
   adelante. Si un sospechoso, un agente o un tercero alteró el
   dispositivo de origen antes de que fuera imageado, el sello no
   puede detectarlo — sella los bytes alterados con la misma
   integridad con la que sellaría el original. El valor del sello
   comienza en el sello temporal de la obtención de imagen.

7. **Si el alcance de la orden judicial fue respetado.** El anexo de
   la orden define lo que puede ser adquirido; el sello registra lo
   que FUE adquirido. Si la adquisición excedió el alcance de la
   orden es, nuevamente, una cuestión legal con su propio remedio
   (moción de supresión bajo el procedimiento estatal apropiado).

8. **Reidentificar a cualquier parte privada de la investigación.** El
   sello rechaza publicar cualquier nombre, identificador o huella
   que pudiera reidentificar a un sospechoso, acusado, víctima,
   testigo u ocupante del inmueble. La referencia del expediente del
   caso es el identificador apropiado para las partes con
   legitimación para localizar el caso.

**La sección de límites honestos anterior es la parte portante de
este kit.** Los equipos forenses que crean que sellar equivale a
admisibilidad lo usarán como escudo. El kit debe decirlo con
claridad: *esta es una primitiva de no repudio para el momento de
adquisición, no una prueba de adquisición legal, solidez
metodológica o cadena de custodia reconocida por el tribunal.*

---

## Lo que este kit DEBE RECHAZAR sellar

El kit está configurado para rechazar los siguientes patrones de
hechos incluso si un usuario con autoridad de firma válida del
organismo los presenta:

- **Identificación personal de sospechosos, acusados, víctimas,
  testigos o cualquier tercero privado.** La referencia del
  expediente del caso es el identificador para las partes con
  legitimación; el sello público no debe ser un índice de
  reidentificación.
- **Nombres personales de peritos forenses u otro personal del
  organismo en el sello público.** Los roles son públicos; las
  vinculaciones persona-a-rol se sellan por separado y son
  descubribles bajo proceso judicial.
- **Hashes a nivel de archivo (o huellas) de material sospechoso de
  abuso sexual infantil, plantillas biométricas o cualquier dato
  reidentificador de personas vulnerables — incluso por hash.** Un
  SHA-256 de un archivo individual es un identificador buscable
  permanente; publicarlo en un registro público puede revictimizar
  a los sujetos mediante correlación con bases de datos privadas.
  Los hashes a nivel de imagen (a nivel de imagen forense) de
  discos completos son aceptables; los hashes a nivel de archivo de
  ese material NUNCA son aceptables.
- **Hallazgos, interpretaciones, opiniones o conclusiones del examen
  sobre lo que significan los bytes.** El sello ancla QUÉ BYTES
  fueron adquiridos y CUÁNDO. La interpretación pertenece al informe
  de examen descubrible, no a un registro público evidente ante
  manipulaciones.
- **Afirmaciones de admisibilidad o cualquier otra conclusión legal**
  ("esta prueba es admisible," "la orden judicial era legal," "la
  cadena de custodia fue correcta bajo §X.Y"). Las conclusiones
  legales son funciones del tribunal.
- **Sellado por cualquier persona que no sea el principal autorizado
  del organismo adquirente.** Un perito de la defensa puede usar el
  kit para sellar su propia verificación independiente del
  manifiesto; no puede sellar la adquisición ORIGINAL bajo el nombre
  del organismo adquirente.
- **Vinculaciones rol-a-individuo dentro del sello público.** Las
  vinculaciones se sellan en un registro compañero separado
  (hasheado en el HECHO 05) bajo el control de acceso del organismo.
- **Hechos de investigación previos a la incautación o previos a la
  orden.** Declaraciones de informantes, vigilancia previa a la
  orden, insumos de construcción paralela — ninguno de estos
  pertenece al sello de adquisición. El sello tiene un alcance
  limitado al evento de adquisición.

Un rechazo mismo puede sellarse como un hecho ("Este organismo
solicitó el sellado de X; el kit lo rechazó conforme a la regla de
rechazo Y"), creando un registro público de intento de uso indebido.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la adquisición:

1. **Aviso de ejemplo** — declara la publicación un ejemplo (las
   atestaciones reales eliminan o reemplazan esto).
2. **Contexto de adquisición** — identificador del caso, cita de la
   orden judicial, organismo adquirente, autoridad solicitante,
   fecha/hora de incautación y adquisición, ubicación de adquisición
   (la ubicación de incautación se redacta a un registro compañero
   sellado por separado para evitar reidentificar el inmueble).
3. **Manifiesto de pruebas** — por ítem de imagen forense: hash
   SHA-256, tamaño de archivo, identificador anonimizado del
   dispositivo origen, método de adquisición, formato de imagen
   forense.
4. **Metodología de adquisición** — nombres y versiones exactas de
   las herramientas forenses (con hashes binarios de las
   herramientas), marca/modelo y firmware del bloqueador de
   escritura, referencia de verificación NIST CFTT, procedimiento
   de verificación utilizado, elección de formato de imagen.
5. **Log de cadena de custodia** — línea temporal por evento desde
   la incautación inicial hasta el fin de la obtención de imagen,
   custodios identificados por ROL (no por nombre), con hashes de
   registros compañeros sellados por separado (vinculación
   rol-a-individuo, log de GPS de transporte, log de acceso al
   armario de pruebas, fotografías del sello antimanipulación,
   etc.).
6. **Calificaciones del perito por rol** — certificaciones que
   ostenta, estado de formación continua, recuento previo de
   experiencia como perito testigo, exposición a Daubert,
   revelaciones de conflicto de interés — todo a nivel de rol, no
   personal.
7. **Revelaciones compañeras y registro de rechazos** —
   investigaciones paralelas, impugnaciones de orden pendientes,
   mociones de prueba suprimida, protocolo de filtro de privilegio
   / equipo de contaminación en vigor, intentos previos de
   adquisición, revisión del rastreador de bugs del proveedor;
   lista explícita de patrones que el kit rechazó sellar.
8. **Principal firmante** — identificación del organismo
   adquirente + signatario a nivel de rol (perito principal) +
   cosignatario a nivel de rol (supervisor de unidad) +
   información de clave criptográfica.

Cada hecho termina con la convención de la puerta de rechazo: *"Este
hecho afirma únicamente X. No afirma Y"* (donde Y es el modo de
falla más cercano de la sección "NO hace" anterior).

---

## Contra qué defiende este kit

- **Alteración silenciosa post-adquisición de una imagen forense.**
  Cualquier cambio a nivel de byte en cualquier imagen produce un
  SHA-256 diferente, y la imagen post-cambio no verificará contra
  el manifiesto sellado del HECHO 03.
- **Afirmación de que "se usaron herramientas diferentes."** El
  HECHO 04 registra versiones exactas de herramientas con hashes
  binarios de las herramientas; afirmaciones posteriores de "en
  realidad usamos v4.7.0, no v4.7.1" son públicamente refutables.
- **Afirmación de que el bloqueador de escritura no estaba activo, o
  que se usó un modelo diferente.** El HECHO 04 congela el
  manifiesto del bloqueador de escritura.
- **Alteración del log de custodia.** Cualquier cambio a la línea
  temporal de eventos de custodia del HECHO 05 (agregar, eliminar
  o re-sellar temporalmente un evento) cambia el hash del HECHO 05
  y es públicamente detectable.
- **Sustitución de las credenciales de un perito diferente.** El
  HECHO 06 congela el perfil de credenciales a nivel de rol en el
  momento de la adquisición.
- **Omisión selectiva de revelaciones compañeras.** El HECHO 07
  enumera las categorías de revelación esperadas; una categoría
  vacía debe ser explícitamente atestada ("ninguna en el momento
  de adquisición"), de modo que un posterior "no nos dimos cuenta
  de que eso era relevante" sea públicamente refutable.
- **Afirmaciones post-adquisición de que el perito tenía un
  conflicto que no fue revelado.** La revelación de conflicto del
  HECHO 06 se congela en la adquisición; los desafíos posteriores
  pueden ser puestos a prueba contra ella.

El kit **no** defiende contra la corrupción contemporánea — un
equipo que sella intencionalmente metadatos falsos en el momento
de la adquisición produce un sello criptográficamente válido de
metadatos falsos. La primitiva es honesta al respecto: es una
primitiva de no repudio para las afirmaciones contemporáneas del
organismo, no una prueba de que esas afirmaciones sean correctas.

---

## Casos históricos o casi históricos en los que el kit habría ayudado

El kit habría producido un anclaje útil — *no una resolución* — en
casos pasados donde la cadena de custodia de pruebas digitales se
convirtió en una cuestión probatoria en disputa. Para evitar nombrar
a los acusados (que son partes privadas incluso cuando son
condenados), estos se describen por tipo de caso, no por individuo
nombrado:

- **La controversia federal de mediados de la década de 2010 sobre
  un bug en una herramienta forense** en la que se descubrió,
  post-adquisición, que una herramienta de obtención de imagen
  forense ampliamente utilizada tenía un bug de caso extremo que
  afectaba a un tipo específico de medio de origen. Un manifiesto
  de adquisición sellado con datos congelados de versión de
  herramienta y hash binario habría permitido que la defensa y la
  fiscalía coincidieran exactamente sobre qué versión se utilizó,
  eliminando un eje de disputa.

- **Múltiples casos estatales que involucran salidas en disputa de
  extracción de dispositivos móviles**, donde el proveedor de la
  herramienta de extracción lanzó posteriormente un parche de
  corrección de bugs y la pregunta se convirtió en "¿afectó el bug
  a este caso?" Un hecho de metodología sellado permite que la
  pregunta se responda contra datos de versionado congelados, en
  lugar de contra la memoria actual del organismo sobre qué
  versión se utilizó.

- **Disputas de entrega de cámaras corporales (BWC)** en casos
  donde se alegó posteriormente que el sistema de docking del
  proveedor de BWC permitía la modificación de las imágenes en
  tránsito. Un manifiesto sellado del archivo de cámara corporal
  en el momento de la recepción por parte del organismo ancla qué
  bytes recibió el organismo desde el sistema de docking; las
  ediciones posteriores del lado del organismo son públicamente
  detectables.

- **Controversias por colisión de hash en casos de informática
  forense**, donde un perito de la defensa argumentó que MD5
  (todavía en uso en algunos flujos de trabajo heredados) era
  inadecuado. Una adquisición sellada que registra TANTO MD5 COMO
  SHA-256 permite que el SHA-256 se sostenga aún si el MD5 es
  impugnado.

- **Disputas sobre la evolución de la metodología de examen entre
  la adquisición y el juicio.** Cuando un caso queda entre la
  adquisición y el juicio durante años, la metodología que era
  estándar en la adquisición puede haber sido superada en el
  momento del juicio. El registro sellado permite que el tribunal
  evalúe la metodología contra el estándar vigente en el momento
  de la adquisición, no contra el estándar posterior.

El kit NO habría resuelto las disputas subyacentes sobre culpabilidad
o inocencia en ninguno de estos tipos de casos. Habría resuelto una
sub-disputa probatoria específica: si los bytes, las herramientas y
los procedimientos eran lo que el organismo afirma que eran en el
momento en que el organismo afirma que lo eran.

---

## Cuándo usar este kit

- Su organismo tiene un SOP forense estable y desea agregar una
  atestación pública anclada en Bitcoin como una capa evidente
  ante manipulaciones sobre la cadena de custodia existente de
  papel y firma.
- Espera que este caso involucre un desafío significativo de la
  defensa a las pruebas forenses (caso de alto riesgo, metodología
  novedosa, versiones de herramientas en disputa, etc.).
- Puede publicar el conjunto de hechos enumerados sin exponer PII
  o datos reidentificadores de personas vulnerables. (Las reglas
  de rechazo del kit hacen cumplir esto; si sus hechos requirieran
  una excepción a una regla de rechazo, no use el kit.)
- El asesor legal general del organismo adquirente y la oficina del
  fiscal han revisado el plan de publicación. La publicación
  pública de un artefacto que lleva un identificador de caso tiene
  implicaciones para investigaciones en curso; la revisión por
  parte del asesor legal no es opcional.
- Las reglas de descubrimiento de la defensa en su jurisdicción
  son compatibles con que el organismo mantenga por separado el
  registro de vinculación rol-a-individuo (hasheado en el
  HECHO 05). Si su jurisdicción requiere la divulgación pública
  del nombre del perito, debe enmendar el kit en consecuencia.

## Cuándo NO usar este kit

- **No lo use como sustituto de la documentación existente de
  cadena de custodia del organismo.** Este kit es *aditivo*, no de
  reemplazo. El CMS del organismo, el log de custodia y las
  obligaciones de producción de descubrimiento no cambian.
- **No lo use si la adquisición involucra CSAM, plantillas
  biométricas u otros datos reidentificadores de personas
  vulnerables a nivel de archivo.** Los hashes a nivel de imagen
  de discos completos son aceptables; los hashes a nivel de
  archivo de tal material NUNCA son aceptables, ni siquiera bajo
  exención de la regla de rechazo. Si no puede construir un
  conjunto de hechos sin romper R3, no use el kit.
- **No lo use para afirmar que la orden era legal, la incautación
  fue apropiada o la prueba es admisible** — el kit no puede hacer
  eso, y la regla de rechazo R5 rechazará cualquier afirmación de
  ese tipo.
- **No lo use bajo presión para sellar antes de que la adquisición
  esté completa.** Un sello de adquisición parcial tergiversa el
  estado.
- **No lo use para publicar nombres personales de peritos** a menos
  que su jurisdicción específicamente lo requiera y sus peritos
  hayan consentido individualmente. El predeterminado es la
  publicación a nivel de rol.
- **No lo use en casos sellados o bajo sello** sin permiso
  explícito del tribunal. Publicar un identificador de caso en
  Bitcoin es irreversible; si el caso es posteriormente sellado,
  el sello público no puede ser retirado. El kit es solo para
  adquisiciones de registro público.
- **No lo use como teatro de legitimidad.** Un sello de una
  adquisición defectuosa es un registro público permanente de los
  defectos, no una defensa contra ellos. La primitiva corta en
  ambas direcciones; esa es su honestidad.

## Cómo bifurcar este kit para una adquisición real

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Cronometría crítica:** selle EN o justo después de la conclusión
de la obtención de imagen (evento E17 del HECHO 05 en la línea
temporal del ejemplo). Un sello durante la obtención de imagen
crea un registro de adquisición parcial; un sello mucho más tarde
crea un hueco durante el cual el organismo podría haber alterado
las imágenes. La ventana correcta es inmediatamente después de
que se complete la verificación de imagen para el último ítem del
conjunto de exhibiciones.

**Revisión crítica:** antes de sellar, pase la publicación por un
segundo perito forense (no el principal) y por el asesor legal del
organismo. Una vez sellada, la publicación es permanente.

## Integración con la infraestructura existente de cadena de custodia

- **Case Management System (CMS) del organismo.** El CMS sigue
  siendo el sistema primario de registro del organismo. El sello
  no reemplaza al CMS; se compromete con los bytes y la
  metodología que el CMS registra, de modo que las ediciones
  post-hoc del CMS sean públicamente detectables.
- **Federal Rules of Evidence / Daubert / códigos probatorios
  estatales.** El sello contribuye al registro de autenticación
  de la FRE 901 al proporcionar integridad evidente ante
  manipulaciones. NO satisface la FRE 702 / Daubert por sí solo;
  la confiabilidad metodológica aún se evalúa en la audiencia
  probatoria.
- **Descubrimiento de la defensa (FRCP 16, Brady, Giglio, y
  equivalentes estatales).** Los registros compañeros hasheados
  en el HECHO 05 (vinculación rol-a-individuo, log de custodia,
  fotos del sello antimanipulación, etc.) permanecen sujetos al
  descubrimiento normal. El sello ancla lo que esos registros
  afirmaban en el momento de la adquisición, de modo que una
  posterior afirmación de "el registro era diferente en ese
  momento" es públicamente refutable.
- **NIST Computer Forensics Tool Testing (CFTT).** El kit
  hace referencia a los logs de verificación CFTT en el
  HECHO 04 / HECHO 05; la referencia es un hash, no el log en
  sí, de modo que los procesos CFTT no se ven afectados.
- **Neutrales designados por el tribunal y peritos de la defensa.**
  Cualquiera puede volver a hashear las imágenes forenses que
  reciben en descubrimiento contra el manifiesto del HECHO 03,
  independientemente de cualquier cooperación del organismo. Este
  es el valor añadido principal del kit para el lado de la
  defensa.
- **Revisión en apelación.** Años después, un revisor forense de
  apelación puede verificar la metodología original de adquisición
  contra el registro sellado del HECHO 04, en lugar de contra el
  posiblemente evolucionado recuerdo actual del organismo.

## Lo que este kit NO reemplaza

- Las Federal Rules of Evidence (o cualquier código probatorio
  estatal).
- Los estándares de confiabilidad Daubert / Frye para declaración
  pericial.
- El SOP forense y el CMS del organismo.
- Las obligaciones de descubrimiento de la defensa bajo FRCP 16 /
  Brady / Giglio / equivalentes estatales.
- Órdenes judiciales, mociones de supresión, audiencias
  probatorias, o cualquier otro proceso administrado por el
  tribunal.
- NIST CFTT o cualquier otro régimen de prueba de herramientas.
- El protocolo de filtro de privilegio / equipo de contaminación
  del organismo.

## Por qué existe este kit en v0.4.0+

Este es el 8º ejemplo trabajado distribuido con myriam-kit. Sigue
la estructura de restricción-primero validada por la
autoinvestigación documentada en `~/Genesis/calc/PROMPT_LIBRARY_v0.md`
— la variante de prompt de restricción-primero obtuvo la
puntuación más alta en una rúbrica ponderada a través de múltiples
dominios de ejemplo. Las secciones iniciales son las partes
portantes del kit; el contenido del manifiesto es la parte fácil.

El diseño del kit es deliberadamente conservador en cuanto a la
publicación del nombre del perito y agresivo en cuanto al descargo
de "esto no establece admisibilidad". La comunidad forense tiene
un historial documentado de ser atacada por su trabajo forense;
el kit se establece por defecto en la posición más segura para
los peritos. Los organismos en jurisdicciones donde se requiere
la denominación personal pública pueden enmendar su bifurcación en
consecuencia, pero el rechazo predeterminado favorece la seguridad
del perito.

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
