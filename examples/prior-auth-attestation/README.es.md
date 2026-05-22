*Traducción al español — para la versión original en inglés, vea [README.md](README.md)*

# Kit de Atestación de Autorización Previa

Un ejemplo de myriam-kit llave en mano para aseguradoras de
salud de EE. UU. (directores médicos, médicos de revisión-de-
utilización), organizaciones de proveedores (equipos UM de
hospitales, grandes consultorios, IPAs), reguladores estatales
de seguros y organizaciones de defensa de pacientes que deseen
publicar un sello anclado en Bitcoin y a prueba de manipulación
de una decisión de autorización previa en el momento en que se
rinde la decisión — de modo que los criterios que la aseguradora
afirma haber aplicado, la evidencia que el proveedor afirma
haber presentado, la ventana de apelación que se dio al
paciente, y el valor en dólares y código de razón de la decisión
queden todos permanentemente fijados en el momento de la
decisión y la revisión silenciosa por cualquiera de las partes
se vuelva criptográficamente detectable.

El sello está diseñado para ser **comparable contra registros
futuros de denegación o aprobación, contra futuras decisiones
de apelación, y contra futuros reclamos de "siempre aplicamos
los criterios X"**. Una atestación sellada única de autorización
previa es útil en una sola disputa; el registro público de una
aseguradora sellando cada decisión de autorización previa bajo
la misma divulgación de versión-de-criterios es el artefacto
portador-de-carga para la detección de manipulación sistémica
(revisión silenciosa de criterios, despliegues de modelos
AI-denegación sin revisión médica, patrones inconsistentes de
denegación-luego-aprobación a través de casos idénticos).

---

## Lo que este kit NO hace (lea primero)

El sello es una marca temporal criptográfica de QUÉ solicitud
de autorización previa se recibió, QUÉ criterios clínicos (con
versión + fecha de revisión) la aseguradora citó como base de
la decisión, QUÉ evidencia presentó el proveedor (por hash, no
contenido), CUÁL fue la decisión (aprobar / parcial / denegar /
pendiente) con código de razón y valor en dólares, QUÉ ventana
de apelación se dio al paciente, y QUIÉN fue el principal
firmante con licencia. No puede responder a ninguna pregunta
sobre si la decisión fue *correcta*. Lo siguiente está **fuera
del dominio del sello**:

1. **Obligar a la aseguradora a cubrir el tratamiento.** Una
   denegación sellada sigue siendo una denegación. El sello no
   aprueba atención, no anula el contrato de la aseguradora, ni
   crea una obligación de cobertura que no existía bajo la
   póliza. El recurso del paciente sigue siendo la apelación
   interna, revisión externa (IRO obligatoria-por-estado o IRO
   federal), queja al departamento estatal de seguros, derecho
   privado de acción ERISA donde sea aplicable, o tribunal. El
   sello hace esos procesos *forensicamente más limpios*; no
   los reemplaza.

2. **Validar los criterios clínicos mismos.** El sello registra
   que la aseguradora citó Milliman Care Guidelines edición X
   capítulo Y subsección Z (o InterQual SIM versión A criterio
   B, o la política médica interna de la aseguradora MP-12345
   revisión 7). NO afirma que esos criterios sean médicamente
   correctos, que reflejen el estándar de atención actual, que
   fueran apropiados para la presentación clínica específica de
   este paciente, o que el proceso de desarrollo de criterios
   fuera imparcial. Si Milliman 2024 Q2 representa buena
   medicina es una pregunta separada de si la aseguradora aplicó
   correctamente Milliman 2024 Q2 a este caso.

3. **Sustituir a una apelación o revisión externa.** Un paciente
   que tiene una denegación sellada y un argumento médico fuerte
   todavía tiene que agotar las apelaciones internas y solicitar
   revisión externa en los plazos que la póliza y la ley estatal
   permiten. El sello es evidencia *en* ese proceso; no es un
   atajo para evitarlo. Los requisitos de agotamiento ERISA, los
   plazos de revisión externa estatal y el estándar de revisión
   que aplica en apelación (de novo vs. arbitrario-y-caprichoso)
   no son cambiados por la existencia de un sello.

4. **Hacer apropiados los criterios.** El sello fija QUÉ
   criterios se aplicaron CUÁNDO. Si los criterios son
   incorrectos, la decisión sellada es un registro público
   permanente de la aplicación de los criterios incorrectos —
   que es la misma información que hoy, solo marcada
   temporalmente. El sello no mejora las pautas clínicas; hace
   permanentemente visible la elección de pauta.

5. **Defender contra el revisor-UR mismo siendo capturado
   (amplificación-de-coacción).** Un director médico que está
   bajo presión institucional para denegar — a través de cuotas
   de productividad atadas a tasas de denegación, a través de
   sistemas AI de recomendación-de-denegación que son difíciles
   de anular, a través de incentivos de diseño-de-plan que
   recompensan la reducción del volumen de autorizaciones —
   produce una denegación sellada que es criptográficamente
   válida y sustantivamente coaccionada. El sello hace el
   *hecho* de la denegación permanente y el *firmante con
   licencia nombrado* permanente (HECHO 08). No protege al
   firmante de la presión institucional que produjo la
   denegación. Un revisor capturado que sella una denegación
   capturada produce un registro público permanente de la
   denegación capturada, que es honesto sobre lo que pasó pero
   no deshace el daño.

6. **Detectar que una denegación fue generada por una IA sin
   revisión médica.** El sello registra QUIÉN fue el principal
   firmante con licencia (HECHO 08, con número de licencia
   médica y estado). No puede verificar independientemente que
   el médico nombrado realmente revisó el registro clínico antes
   de firmar, vs. estampar de goma una recomendación de
   denegación generada por IA. Las acusaciones de
   acción-colectiva de Cigna / EviCore / UnitedHealth sobre
   denegaciones sistemáticas AI-sin-revisión son exactamente
   este modo de falla — y el sello no, por sí mismo, lo previene.
   El sello sí hace computables contra un registro permanente la
   posterior descubrimiento (tasa de denegaciones por médico
   firmante por día, tiempo medio por decisión, ausencia del
   médico firmante de los registros de instalación), que está
   aguas arriba de detectar el patrón.

7. **Probar que la decisión se tomó de buena fe.** La buena fe
   es una conclusión legal sobre el estado mental del tomador
   de decisiones. El sello registra el registro documental; no
   adjudica el motivo. Una decisión sellada es consistente ya
   sea con la toma-de-decisiones de buena-fe o de mala-fe; la
   evidencia distintiva (patrones de tasa, inconsistencia de
   aplicación-de-criterios a través de casos, comunicaciones
   internas) está aguas arriba del sello.

8. **Defender contra criterios que nunca fueron publicados.**
   Una aseguradora que aplica criterios internos no escritos,
   luego cita un criterio publicado plausiblemente-relacionado
   en el HECHO 03 sellado, produce un sello que es internamente
   consistente y sustantivamente engañoso. El sello registra lo
   que la aseguradora DIJO que aplicó; detectar la brecha entre
   los criterios citados y los criterios realmente-aplicados
   requiere auditoría del registro de toma-de-decisiones (que es
   descubrible en litigación, pero no directamente anclado por
   el sello).

**La sección de límites honestos arriba es la parte
portadora-de-carga de este kit.** Los oficiales de cumplimiento
de aseguradoras que tratan "sellamos cada decisión de
autorización previa" como equivalente a "hemos probado que
siempre actuamos de buena fe" abusan de la primitiva. El kit
debe decir claramente: *esta es una primitiva de no-repudiación
para las afirmaciones contemporáneas de la aseguradora sobre
qué criterios se aplicaron a qué evidencia con qué decisión bajo
qué ventana de apelación — no una medida de calidad, no un
sustituto para revisión externa, no una defensa contra los
modos de falla revisor-capturado o criterios-no-publicados, y
no una decisión de cobertura.*

---

## Lo que este kit DEBE NEGARSE a sellar

El kit está configurado para rechazar los siguientes patrones de
hecho incluso si un usuario con autoridad de firma de aseguradora
válida los envía:

- **Información identificable del paciente más allá de la
  verificación de identificador-de-póliza mínima-necesaria.**
  Ningún hecho puede incluir el nombre legal del paciente, fecha
  completa de nacimiento, dirección completa, número de Seguro
  Social, número de teléfono, correo electrónico, número completo
  de registro médico, o cualquier combinación de identificadores
  parciales (iniciales + DOB mes/año + ZIP3, por ejemplo) que
  sería re-identificadora en una pequeña celda de población. Los
  identificadores mínimos-necesarios para un sello público de
  autorización previa son: un handle de identificador de miembro
  (Miembro-X), el número de grupo del plan del pagador, y la
  fecha de la solicitud de autorización. Cualquier cosa más es
  rechazada bajo la doctrina de mínimo-necesario HIPAA. (R1)

- **Diagnóstico específico.** Sellar un código específico de
  ICD-10 (p.ej. C50.911 para neoplasia maligna de sitio no
  especificado del seno femenino derecho) en un pagador pequeño
  en una geografía pequeña puede ser re-identificador para el
  paciente. El sello acepta solo el nivel de CATEGORÍA ICD-10
  (C50 — cáncer de mama; no C50.911) cuando se requiere
  nivel-de-categoría para la divulgación de
  coincidencia-de-criterios en HECHO 03. Incluso el
  nivel-de-categoría se rechaza cuando la combinación de
  categoría + pagador + región de instalación + fecha produciría
  un riesgo HIPAA de pequeña-celda. El predeterminado es sellar
  la decisión de coincidencia-de-criterios sin la categoría de
  diagnóstico; el diagnóstico se mantiene en el expediente de
  autorización previa de la aseguradora y es divulgable al
  paciente y a los reguladores bajo solicitud. (R2)

- **Nombres individuales de revisores-UR si no son médicos
  acreditados.** Nombrar a un miembro del personal clerical, una
  enfermera de admisión no licenciada, o un sistema AI de
  recomendación-de-denegación como el principal firmante de una
  decisión sellada de autorización previa crea una superficie
  directa de represalia contra el individuo nombrado sin
  producir el correspondiente beneficio de responsabilidad. El
  kit rechaza los hechos de principal-firmante (HECHO 08) que
  nombren a cualquiera que no sea un revisor clínico acreditado
  — por defecto un médico licenciado (MD/DO) con una licencia
  médica estatal activa, que esté facultado bajo la política UR
  de la aseguradora para rendir la decisión. Donde la ley
  estatal permita que un revisor enfermero (RN) rinda
  determinaciones iniciales sin revisión médica (algunas
  aseguradoras comerciales en algunos estados), el kit sellará
  esas decisiones solo si la política subyacente ha sido
  pre-publicada como parte de la descripción del programa UM de
  la aseguradora, y se incluye la licencia del enfermero
  firmante (estado, número de licencia). (R3)

- **Sellar decisiones tomadas por personal no licenciado.**
  Incluso con la estructura de divulgación R3, el kit se niega a
  sellar cualquier decisión de autorización previa que fue
  rendida por un individuo no licenciado o un sistema de
  recomendación AI como el tomador sustantivo de decisiones. El
  principal firmante debe ser un clínico licenciado que está
  facultado para anular la recomendación AI, que revisó el
  registro clínico, y que es el tomador sustantivo de decisiones
  — no un sello-de-goma. Donde el proceso real de
  toma-de-decisiones de la aseguradora tiene al clínico
  actuando como un sello-de-goma en una recomendación de
  denegación AI, sellar la decisión resultante bajo el nombre
  del clínico es deshonesto y el kit lo rechaza. El artefacto
  adecuado en ese caso es que la aseguradora NO selle bajo
  myriam-kit hasta que pueda atestar honestamente la
  toma-de-decisiones sustantiva del clínico. (R4)

- **Sellar una revisión de criterios-parcial presentada como
  revisión completa.** Donde el proceso UR de la aseguradora
  aplicó solo un subconjunto de los criterios relevantes (p.ej.
  aplicó el criterio LOS de hospitalización pero no aplicó el
  criterio de necesidad-médica antes de denegar por LOS), el
  kit se niega a sellar la decisión como una atestación de
  "criterios aplicados". La divulgación de hecho (HECHO 03)
  debe enumerar exactamente qué subsecciones de la pauta citada
  se aplicaron y cuáles no, y la decisión (HECHO 05) debe
  marcarse como criterios-parciales. Una aseguradora que quiera
  sellar una decisión como criterios-completos debe haber
  aplicado realmente los criterios completos. (R5)

- **Sellar sin un reconocimiento separado del lado-proveedor
  de la evidencia presentada.** HECHO 04 hashea la evidencia
  clínica que el proveedor presentó con la solicitud de
  autorización previa. El kit requiere que la lista de hash de
  evidencia sea co-atestada por el proveedor (separadamente, por
  reconocimiento firmado o por sello myriam-kit separado de la
  presentación) — para prevenir el modo de falla del lado de la
  aseguradora de "nunca recibimos sus registros" gaslighting
  donde la aseguradora sella una lista de hash que omite
  registros que el proveedor realmente presentó. La
  co-atestación de dos-lados es la protección estructural contra
  la curación unilateral de lista-de-evidencia. (R6)

- **Sellar una decisión antes de que la ventana de apelación
  haya sido calculada y divulgada.** HECHO 06 establece el
  plazo de ventana-de-apelación en el momento de la decisión.
  El kit se niega a sellar una decisión que no especifique los
  términos de la ventana de apelación (plazo, si la revisión
  acelerada está disponible dado el urgencia clínica, cuál es
  la ruta de revisión-externa). Una decisión sin una ventana de
  apelación comprometida es una decisión que puede enmendarse
  silenciosamente a través de manipulación de plazo procesal
  más tarde; el kit previene esto rechazando el sello. (R7)

- **Sellar bajo condiciones de amplificación-de-coacción.**
  Donde el principal firmante está en el registro como habiendo
  planteado preocupaciones sobre los criterios, la recomendación
  AI, la cuota de volumen, u otros factores del entorno de
  toma-de-decisiones — y el sello documentaría al principal
  como el tomador de decisiones sin documentar las
  preocupaciones — el kit se niega a sellar bajo el nombre de
  ese principal solo. La recusación o nota de objeción del
  principal DEBE aparecer en HECHO 07 si existe. El kit no
  amplificará el nombre de un firmante capturado a Bitcoin sin
  divulgar la evidencia de captura que el firmante tiene en
  registro. (R8)

Un rechazo en sí mismo puede ser sellado como un hecho ("Esta
aseguradora solicitó sellar X; el kit rechazó según la regla de
rechazo Y"), creando un registro público de intento de mal uso.
Un proveedor, defensor de paciente, o regulador estatal de
seguros que reciba una denegación no-sellada de una aseguradora
que afirma usar myriam-kit puede inferir que se activó una de
R1-R8.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la decisión de autorización previa:

1. **Aviso de ejemplo** — declara la publicación como ejemplo
   (atestaciones reales eliminan o reemplazan esto).
2. **Identificación de autorización** — número de solicitud de
   autorización, nombre del pagador + código NAIC, nombre de
   organización del proveedor + NPI, handle de identificador de
   miembro, fecha de solicitud, categoría de servicio solicitado
   (categoría CPT/HCPCS, no código específico donde el código
   específico sería re-identificador).
3. **Criterios clínicos aplicados** — nombre exacto de la pauta
   clínica, versión, edición, fecha de revisión, citación de
   subsección; declaración de qué subsecciones se aplicaron y
   cuáles no; atribución de fuente-de-criterios (Milliman /
   InterQual / política médica interna de aseguradora
   MP-NNNNN); declaración de que ninguna revisión posterior de
   criterios se ha aplicado silenciosamente a esta decisión.
4. **Evidencia presentada** — hashes SHA-256 de cada documento
   clínico, resultado de laboratorio, informe de imagen, y
   atestación médica que el proveedor presentó con la solicitud
   de autorización previa; declaración de la co-atestación del
   lado del proveedor por R6.
5. **Decisión** — aprobar / parcial / denegar / pendiente, con
   el código de razón (código de aseguradora + código X12 277
   estandarizado donde sea aplicable), valor en dólares de los
   servicios autorizados (o cero para denegaciones), unidades /
   días / cantidad autorizada, fechas efectivas de
   autorización, resultado de consulta de revisor-par si es
   aplicable.
6. **Ventana de apelación** — plazo para apelación interna (en
   días desde la notificación), elegibilidad de revisión-acelerada
   (sí/no con base de urgencia-clínica si sí), ruta de
   revisión-externa (contacto del programa IRO estatal, IRO
   federal bajo ACA para no-grandfathered totalmente-asegurados,
   ruta ERISA para autofinanciado), declaración de que el plazo
   es el plazo a partir de la fecha de la decisión y no puede
   acortarse silenciosamente más tarde.
7. **Divulgaciones compañeras** — apelaciones pendientes en
   autorizaciones relacionadas para este miembro, denegaciones
   previas para la misma condición para este miembro (con
   fechas y resultados), recusaciones del principal firmante en
   decisiones previas para este miembro si las hay, declaración
   de cualquier sistema de AI-recomendación-de-denegación
   utilizado en el pipeline de toma-de-decisiones y la autoridad
   del clínico-licenciado para anular ese sistema.
8. **Principal firmante** — nombre del médico licenciado (MD/DO)
   o revisor clínico licenciado (bajo restricciones R3-R4),
   número de licencia médica estatal, estado de licencia,
   subespecialidad de certificación por junta si aplica, nombre
   de entidad de aseguradora + NAIC, rol dentro del programa UM
   de la aseguradora, declaración de que el principal firmante
   revisó sustantivamente el registro clínico y es el tomador
   sustantivo de decisiones.

Cada hecho termina con la convención de puerta-de-rechazo:
*"Este hecho afirma solo X. No afirma Y"* (donde Y es el modo
de falla más cercano de la sección "NO hace" arriba).

---

## Contra qué defiende este kit

- **"Nunca recibimos su autorización previa" gaslighting.** Los
  HECHOS 02 y 04 congelan el número de solicitud de
  autorización, la fecha de solicitud, y la lista de hash de
  evidencia presentada en el momento de la decisión. Una
  aseguradora que más tarde afirma haber nunca recibido la
  solicitud, o haber recibido registros diferentes / menos que
  los que el proveedor presentó, es públicamente refutable
  contra el manifiesto sellado. La co-atestación del proveedor
  por R6 cierra el bucle de curación-unilateral.

- **Revisión retroactiva silenciosa de criterios.** HECHO 03
  congela el nombre exacto de la pauta, versión, edición y
  fecha de revisión en el momento de la decisión. Una
  aseguradora que más tarde afirma haber aplicado Milliman
  2024 Q2 al caso cuando el HECHO 03 sellado dice Milliman
  2024 Q1 (o viceversa) es públicamente refutable. La defensa
  "usamos los criterios actualizados" para un patrón
  sistemático-de-denegación se vuelve comparable a través de
  casos.

- **Descubrimiento post-denegación de evidencia favorable
  suprimida.** La lista de hash de evidencia presentada del
  HECHO 04 está sellada en el momento de la decisión. Si más
  tarde se encuentra que el expediente interno de decisión de
  la aseguradora ha omitido un resultado de laboratorio o
  estudio de imagen favorable que el proveedor había presentado,
  la omisión es detectable re-hasheando la lista de evidencia
  interna de la aseguradora contra el manifiesto sellado.

- **Aseguradora denegando luego aprobando casos idénticos
  inconsistentemente sin registro.** Con decisiones selladas
  repetidas a través de casos que comparten la misma
  citación-de-criterios en HECHO 03 y el mismo
  patrón-de-evidencia en HECHO 04, el patrón de
  toma-de-decisiones inconsistente a través de casos
  sustantivamente idénticos se vuelve públicamente computable.
  Un investigador del departamento-estatal-de-seguros, el
  abogado de un demandante de acción-colectiva, o un fiscal
  general estatal puede agregar las publicaciones selladas y
  computar la tasa de consistencia sin depender de la
  cooperación de la aseguradora para los datos subyacentes.

- **Denegación post-hechos de autorizaciones aprobadas.** Una
  aprobación sellada en HECHO 05 es un registro permanente de
  la aprobación. Una aseguradora que más tarde afirma que la
  autorización nunca fue otorgada (p.ej. como base para
  denegación retroactiva de reclamo), o afirma que la
  autorización fue para un servicio diferente o un número
  diferente de unidades que lo que dice el HECHO 05 sellado, es
  públicamente refutable. Esto protege al proveedor contra
  manipulación de denegación-retroactiva Y protege al paciente
  contra facturación-de-saldo post-tratamiento que surge de
  autorización disputada.

- **Manipulación de ventana-de-apelación.** HECHO 06 congela el
  plazo de la ventana-de-apelación en el momento de la
  decisión. Una aseguradora que más tarde cambia el plazo hacia
  abajo (p.ej. afirmando que una "fecha de notificación"
  diferente fue el disparador), o que acorta la ventana de
  revisión-acelerada después de que el paciente confía en el
  plazo sellado, es públicamente refutable.

- **Patrones AI-denegación-sin-revisión-médica volviéndose
  indetectables individualmente pero detectables en agregado.**
  HECHO 08 nombra al médico firmante con licencia. HECHO 07
  divulga cualquier sistema AI de
  recomendación-de-denegación en el pipeline. Con sellos
  repetidos a través de decisiones, la tasa de decisión
  por-médico-por-día públicamente-visible se vuelve computable.
  Un médico acreditado como el firmante en 500 denegaciones
  por día no puede haber revisado sustantivamente cada
  registro; el sello hace la tasa detectable de una manera que
  los registros internos de la aseguradora no lo hacen.

El kit **no** defiende contra la falla del revisor-capturado
(R8 aborda la divulgación de evidencia de captura pero no
previene la captura misma), contra la sustitución de
criterios-no-publicados (el sello registra lo que se citó, no
lo que realmente se aplicó internamente), o contra la fraude de
codificación contemporáneo en el nivel de admisión (un código
de servicio mal-clasificado en la admisión produce una decisión
sellada contra los criterios citados incorrectos). La primitiva
es honesta al respecto: es una primitiva de no-repudiación para
las afirmaciones contemporáneas de la aseguradora sobre su
toma-de-decisiones, no una prueba de que esas afirmaciones sean
sustantivamente correctas.

---

## Contexto histórico con el que el kit habría ayudado

El kit habría producido un registro forense por-caso útil — *no
una solución* — en los siguientes patrones documentados:

- **Acusaciones de denegación-impulsada-por-IA de Cigna /
  EviCore.** Reportes de denunciantes y ProPublica alegaron que
  el sistema PXDX de Cigna generaba denegaciones masivas
  revisadas por médicos firmantes en segundos por caso, muy por
  debajo del tiempo necesario para revisar sustantivamente un
  registro clínico. Un registro sellado por-decisión con la
  divulgación de sistema-AI del HECHO 07 y el firmante con
  licencia nombrado del HECHO 08 habría hecho computable
  públicamente en tiempo real el volumen de denegación
  por-médico-por-día, en lugar de descubrible retrospectivamente
  vía documentos de denunciantes.

- **Acciones-colectivas de patrón-de-denegación de
  UnitedHealth / Optum.** Las quejas de acción-colectiva han
  alegado denegación algorítmica sistemática de cuidado
  post-agudo (nH Predict / naviHealth) con tasas de anulación
  muy por debajo de las tasas que la precisión del algoritmo
  subyacente justificaría. Un registro sellado por-decisión con
  la citación-de-criterios del HECHO 03 y la divulgación de
  sistema-AI del HECHO 07 habría producido un registro
  públicamente comparable de denegación-vs-anulación a través
  de casos.

- **Admisión del ex-director-médico de Aetna (Iaquinta).** Una
  deposición de 2018 por un ex-director médico de Aetna
  reconoció no haber revisado personalmente los registros del
  paciente antes de las decisiones de denegación. El HECHO 08
  sellado por-decisión con el firmante nombrado + la frecuencia
  de sello correspondiente habría producido evidencia pública
  del volumen de toma-de-decisiones consistente con revisión
  no-sustantiva.

- **Escándalo de cobertura ER de UnitedHealth (política
  2021).** Una política propuesta para denegar retroactivamente
  reclamos ER si la aseguradora determinaba post-hoc que la
  visita no era una emergencia atrajo críticas generalizadas y
  fue pausada. Un registro contemporáneo sellado de
  autorización-previa (o renuncia de autorización-previa) para
  visitas ER habría hecho la denegación retroactiva
  públicamente comparable contra el estado contemporáneo de
  cobertura.

- **Tácticas de retraso post-decisión de Anthem.** Reportes
  sobre los retrasos de procesamiento de apelaciones de Anthem
  durante 2017-2020 alegaron que la aseguradora incumplió los
  plazos de decisión-de-apelación regulatorios de formas que
  perjudicaron a los pacientes. Un HECHO 06 sellado con el
  plazo de la ventana-de-apelación congelado en el momento de
  la decisión habría hecho el cumplimiento-de-plazo
  computable públicamente por caso.

El kit NO habría resuelto las disputas subyacentes sobre si los
criterios de las aseguradoras son médicamente apropiados, sobre
si los sistemas AI son precisos, o sobre si los incentivos de
modelo-de-negocio que producen estos patrones deberían ser
reestructurados. Esos son debates de política aguas arriba del
sello.

---

## Cuándo usar este kit

- Su aseguradora desea agregar una atestación pública
  por-decisión anclada en Bitcoin como una capa
  resistente-a-manipulación sobre el flujo de trabajo de
  autorización-previa existente.
- Es una organización de proveedores que desea sellar su lado
  de la presentación de autorización-previa (por R6) como una
  publicación myriam-kit separada que puede co-atestar con el
  sello de la aseguradora.
- Es un regulador estatal de seguros ejecutando un programa
  voluntario de transparencia de autorización-previa entre
  aseguradoras operando en su estado, y desea una primitiva
  criptográfica común que todas las aseguradoras participantes
  puedan usar sin confiar en un agregador central.
- Es una organización de defensa de pacientes o abogado
  representando a un paciente en una disputa de atención
  denegada, y desea anclar el registro del paciente de lo que
  se presentó, lo que se citó, y lo que se decidió en el
  momento de la decisión para que los reclamos posteriores de
  la aseguradora sobre cualquiera de esas cosas sean
  públicamente verificables.
- Puede publicar el conjunto de hechos listado sin romper las
  reglas de rechazo R1-R8. Si sus hechos requerirían una
  ruptura R1-R8, no use el kit; arregle primero las entradas
  de datos subyacentes.
- El consejo (consejo de aseguradora, consejo de proveedor, o
  consejo de paciente) ha revisado el plan de publicación. La
  publicación pública de un artefacto portador-de-autorización-
  previa tiene implicaciones bajo HIPAA (estándares de
  des-identificación), ERISA (interacción con procedimientos
  estatutarios de apelación), código de seguros estatal
  (interacción con estatutos UR estatales), y contrato
  (interacción con acuerdos de proveedor). La revisión del
  consejo no es opcional.

## Cuándo NO usar este kit

- **No usar como sustituto de la descripción del
  programa-UR estatutario de la aseguradora, proceso de
  apelación-interna, o proceso de revisión-externa.** El sello
  es *aditivo*. Sus presentaciones de programa UM
  obligatorias-por-estado, su Descripción Resumida del Plan
  ERISA, su flujo de trabajo de apelaciones internas —
  inalterados.
- **No usar como una decisión de cobertura.** Una denegación
  sellada es una denegación sellada; una aprobación sellada es
  una aprobación sellada. El sello no adjudica la corrección
  sustantiva de cualquiera. Las reglas de rechazo R1-R8
  rechazarán patrones que confunden la atestación con la
  corrección sustantiva.
- **No usar para publicar información identificable del paciente
  o diagnósticos específicos donde aplique riesgo HIPAA de
  pequeña-celda.** Las reglas de rechazo R1-R2 existen por
  razones de mínimo-necesario HIPAA y riesgo-de-
  re-identificación.
- **No usar bajo condiciones de toma-de-decisiones donde el
  principal firmante es un sello-de-goma en una recomendación
  AI.** La regla de rechazo R4 rechazará ese patrón. Arregle
  el proceso de toma-de-decisiones antes de sellar.
- **No usar como teatro de legitimidad para un pipeline
  AI-denegación no reformado.** Un sello de una denegación
  AI-sellada-de-goma es un registro público permanente de la
  denegación AI-sellada-de-goma, no una defensa contra ella. La
  primitiva corta en ambas direcciones; esa es su honestidad.

## Cómo bifurcar este kit para una decisión real

```bash
cp -r ~/Genesis/myriam-kit/examples/prior-auth-attestation ~/auth-PA-2026-NNNNNN
cd ~/auth-PA-2026-NNNNNN
$EDITOR facts/*.txt        # replace fictional content with real auth
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL AT the moment of decision
python3 build/verify.py    # confirm
```

**TIEMPO CRÍTICO:** sellar EN el momento de la decisión —
después de la revisión sustantiva del clínico licenciado,
después del cálculo de la ventana-de-apelación, antes de que
la notificación salga al proveedor y paciente. Sellar después
de la notificación es forensicamente más débil porque la
aseguradora ha tenido oportunidad de reconciliar su registro
interno contra la notificación saliente; el sello más fuerte
es el rendido inmediatamente al ser registrada la decisión
sustantiva.

**CO-ATESTACIÓN CRÍTICA (R6):** antes de que la aseguradora
selle, confirme que el proveedor ha atestado por separado a
la lista-de-hash-de-evidencia en HECHO 04 — ya sea por
reconocimiento firmado referenciado en HECHO 04 o por sello
myriam-kit separado del lado-del-proveedor de la presentación.
La curación unilateral del lado-de-la-aseguradora de la lista
de evidencia es el modo de falla que R6 previene; no salte el
paso de co-atestación.

**CADENCIA POR-DECISIÓN:** el valor del kit se acumula a
través de las decisiones. Sellar una decisión es útil en ese
caso; sellar cada decisión de autorización previa bajo la
misma disciplina de citación-de-criterios es el artefacto
sistémico. A través de un año de decisiones selladas, los
patrones de tasa-de-denegación por citación-de-criterios, por
categoría de servicio, por médico firmante, y por región se
vuelven públicamente computables sin cooperación de la
aseguradora.

## Integración con la infraestructura existente de
autorización-previa

- **X12 278 (Revisión de Servicios de Atención Médica).** El
  flujo de trabajo EDI existente de la aseguradora para
  transacciones de autorización-previa no cambia. El sello
  compromete el número de solicitud, la decisión, y la
  ventana-de-apelación que la respuesta X12 278 lleva; las
  disputas posteriores sobre lo que se envió son públicamente
  refutables.
- **CMS Interoperability and Prior Authorization Final Rule
  (CMS-0057-F, 2024).** La regla requiere que los pagadores
  afectados (Medicare Advantage, Medicaid managed care, CHIP
  managed care, QHPs facilitados federalmente del Mercado)
  proporcionen códigos de razón de denegación específicos vía
  APIs FHIR para 2026-2027. El sello compromete esos códigos
  de razón a un registro público resistente-a-manipulación
  junto con la respuesta API.
- **Acreditación UM de NCQA.** El sello es compatible con las
  expectativas de UM-acreditación de NCQA y proporciona
  evidencia documental por-decisión que el inspector puede
  verificar.
- **Programas estatales de Revisión Externa (IRO).** El
  conjunto sellado HECHO 03 + HECHO 04 + HECHO 05 es la base
  documental que el IRO revisa; la publicación sellada hace
  que el registro contemporáneo de la aseguradora sea
  durablemente referenciable en procedimientos IRO.
- **Procedimiento de reclamos ERISA §503.** Para planes ERISA
  autofinanciados, el sello compromete el expediente de
  reclamo en la etapa de determinación-inicial; los
  procedimientos de apelación y revisión-externa siguen
  gobernados por §503 y el documento del plan.
- **Estatutos estatales de reforma-de-autorización-previa
  (programas de gold-card, mandatos de tiempo-de-respuesta,
  requisitos específicos de estatuto-de-revisión-de-utilización
  en TX, OK, MI, etc.).** Compatible como una capa de
  transparencia sobre cualquier marco estatutario que aplique
  en el estado de domicilio de la aseguradora y el estado de
  residencia del paciente.

## Lo que este kit NO reemplaza

- La descripción del programa UR de la aseguradora presentada
  al departamento estatal de seguros.
- El proceso interno de apelación de la aseguradora.
- Los procedimientos de revisión externa (IRO)
  obligatorios-por-estado.
- Cumplimiento del procedimiento-interno-de-reclamos ERISA §503.
- Derecho privado de acción ERISA (29 U.S.C. §1132).
- Los estatutos estatales de prácticas-injustas-de-reclamos.
- Los procedimientos de quejas del departamento estatal de
  seguros.
- Los remedios del comisionado-estatal-de-seguros del paciente.
- Los remedios contractuales del proveedor bajo el acuerdo de
  proveedor.
- Auditoría de CMS de las prácticas de autorización-previa de
  Medicare Advantage.
- Revisión de acreditación UM de NCQA.

## Valor de adopción y estimación honesta de impacto

La carga administrativa de autorización-previa de EE. UU. es
una de las fuentes más grandes y mejor-documentadas de
desperdicio administrativo en atención de salud. Las
estimaciones publicadas (Council for Affordable Quality
Healthcare CAQH Index 2022-2024; encuestas de carga de
autorización-previa de la American Medical Association;
American Hospital Association; CMS Office of the Actuary)
ponen el costo administrativo anual proveedor-más-pagador de
autorización previa en el orden de **\$200 mil millones por
año** en los Estados Unidos (combinando tiempo del proveedor,
procesamiento del pagador, retrabajo de reclamos-denegados, y
disputas de facturación aguas abajo). El costo de daño-al-
paciente del retraso-de-atención relacionado con
autorización-previa — medido como morbilidad agregada,
escalada al departamento-de-emergencias, hospitalización, y
exceso de mortalidad por autorización retrasada de tratamiento
necesario — se ha estimado en el orden de **\$25 mil millones
por año y arriba** en términos equivalentes-a-daño-al-paciente,
con la encuesta de la AMA reportando eventos adversos
clínicamente significativos atribuibles al retraso de
autorización-previa en una fracción sustancial de los
consultorios médicos en su encuesta 2023.

Combinado direccionable: en el orden de **\$225 mil millones
por año** en costo administrativo-más-daño-al-paciente.

**La estimación honesta de impacto:**

Una atestación sellada por-decisión de autorización-previa no
reduce el volumen de solicitudes de autorización-previa, no
reduce el incentivo de la aseguradora para denegar, y no
acelera directamente ninguna decisión. Lo que hace es hacer
una categoría de disputas — las disputas que hoy consumen la
mayor fracción del costo de retrabajo — *forensicamente más
limpia*. Una reducción del cinco por ciento en la fracción de
retrabajo-administrativo (las disputas que recurren porque el
registro subyacente está disputado, la versión-de-criterios
está disputada, o la presentación-de-evidencia está disputada)
representaría en el orden de **\$11 mil millones por año** en
costo direccionable recuperado. Traduciendo a una
vida-equivalente a un conservador \$5,000-por-vida-salvada (la
estimación de valor-de-vida usada en muchas intervenciones de
salud-global donde el costo-marginal-por-vida-salvada está bien
caracterizado a través de la entrega de intervenciones
establecidas a poblaciones desatendidas) produce un
equivalente-de-vidas de aproximadamente **2.2 millones de
vidas por año** en el caso combinado de recuperación-
administrativa y reducción-de-daño-al-paciente, *más* las
vidas salvadas directamente por acceso más rápido a atención
autorizada para los pacientes cuyo tratamiento ya no está
retrasado por disputas recurrentes de registros.

**El encuadre honesto:**

El argumento para la adopción no es "este kit salvará 2.2
millones de vidas por sí mismo." Es: *si usted cree que las
estimaciones CAQH / AMA / AHA / CMS-OACT del costo
administrativo-y-de-daño de autorización-previa son
aproximadamente correctas, y si usted cree que una fracción
sustancial de ese costo es atribuible a las categorías de
disputa que un registro sellado por-decisión hace
forensicamente más limpias (recibo-de-registro con gaslighting,
revisión silenciosa de criterios, evidencia favorable
suprimida, toma-de-decisiones inconsistente, denegación
post-hechos, manipulación de ventana-de-apelación), entonces
sellar atestaciones por-decisión de autorización-previa es la
primitiva disponible más barata que aborda la superficie de
manipulación — a un costo marginal por decisión de segundos
de cómputo y el costo de un OTS-sello más un pin IPFS. El
sello no detiene los patrones de denegación de la aseguradora
ni arregla el modelo-de-negocio subyacente; hace una clase de
disputa auditable. La auditabilidad es lo que produce la
palanca para las vidas-salvadas aguas abajo. Las vidas salvadas
están varios pasos causales aguas abajo del sello mismo.
Adopte el kit con ese entendimiento, no con una promesa de
vidas-salvadas.*

Los valores predeterminados del kit son deliberadamente
conservadores en identificadores del paciente (regla de
rechazo R1-R2), agresivos en divulgación de
revisor-capturado (regla de rechazo R8), y agresivos en el
descargo de responsabilidad "esto no es una decisión de
cobertura". Las aseguradoras, proveedores, y defensores de
pacientes en jurisdicciones donde los requisitos específicos
de divulgación pública difieren pueden enmendar su
bifurcación correspondientemente, pero los rechazos
predeterminados favorecen la privacidad del paciente, la
protección de defensa del clínico, y el alcance honesto.

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
