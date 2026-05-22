*Traducción al español — para la versión original en inglés, vea [README.md](README.md)*

# Kit de Atestación de Reingresos Hospitalarios

Un ejemplo de myriam-kit llave en mano para hospitales, redes
hospitalarias, Directores Médicos (CMO), directores de Calidad,
asociaciones estatales de hospitales e investigadores de salud
pública que deseen publicar un sello mensual anclado en Bitcoin
y a prueba de manipulación de *cuáles fueron realmente las tasas
de reingreso a 30 días del hospital* y *cómo fueron medidas* —
para que la revisión silenciosa posterior del registro de
reingresos, la manipulación del estado de observación, la
manipulación de transferencias, o la deriva metodológica entre
períodos de reporte sea públicamente detectable a lo largo de
los meses.

El sello está diseñado para ser **comparable contra el sello del
mes siguiente**. Esa propiedad es el objetivo central. Una sola
atestación aislada es útil; el registro público de un hospital
sellando la misma condición mes tras mes bajo la misma
metodología es el artefacto portador-de-carga.

---

## Lo que este kit NO hace (lea primero)

El sello es una marca temporal criptográfica de QUÉ admisiones
índice se contaron en QUÉ cohorte de DRG / condición, QUÉ
reingresos a 30 días se observaron, QUÉ altas con estado de
observación y QUÉ transferencias se registraron, bajo QUÉ
versión de especificación de CMS y QUÉ criterios de exclusión,
firmado por el Director Médico y el oficial de Calidad
certificantes del hospital. No puede responder ninguna pregunta
sobre calidad de atención más allá de eso. Lo siguiente está
**fuera del dominio del sello**:

1. **Probar que los reingresos eran inevitables.** Un reingreso
   a 30 días puede ser causado por planificación inadecuada del
   alta, por progresión inevitable de la enfermedad, por
   incumplimiento del paciente, por determinantes sociales fuera
   del control del hospital, por una nueva enfermedad
   independiente, o por errores post-alta en una instalación
   posterior. El sello registra el *conteo*; no adjudica la
   *causa*. Un hospital con una alta tasa sellada de reingresos
   no queda por ello probado como negligente. Un hospital con una
   baja tasa sellada de reingresos no queda por ello probado como
   excelente.

2. **Mejorar el hospital.** Sellar un número no es una
   intervención de mejora de calidad. El sello es una capa de
   evidencia-de-manipulación sobre lo que el hospital ya reporta;
   no cambia la planificación del alta, la coordinación de la
   atención, el seguimiento post-agudo, ni ningún otro insumo
   operativo a la tasa de reingreso. Un hospital que sella una
   tasa mala tiene una tasa mala públicamente auditable; la
   maldad no cambia hasta que el proceso de atención subyacente
   cambie. El sello hace que las afirmaciones sobre la tasa sean
   auditables; no hace buena la tasa.

3. **Defender contra el sesgo de selección de pacientes
   pre-admisión.** Un hospital que silenciosamente desvía a
   pacientes de alto riesgo de la admisión (a estado de
   observación, a transferencia a otra instalación, al alta
   desde la ED sin admisión) en el extremo inicial aparecerá en
   los denominadores sellados con una mezcla de casos de
   apariencia más saludable. El sello ancla lo que el hospital
   contó como una admisión índice para la cohorte; no puede
   detectar pacientes que nunca llegaron a ser admisiones índice
   porque fueron desviados. El sesgo de selección en el extremo
   inicial está aguas arriba del sello.

4. **Defender contra el alta a domicilio-con-servicios de formas
   que enmascaran la atención continua.** Un paciente dado de
   alta a una agencia de atención domiciliaria perteneciente al
   mismo sistema de salud, con atención continua intensiva que
   funcionalmente sería atención hospitalaria en otro lugar, no
   cuenta como reingreso si no es readmitido. El sello registra
   readmisiones; no registra la intensidad de la atención
   continua entregada bajo una etiqueta de alta. El modo de
   falla "dado de alta solo de nombre" está aguas abajo del
   código de alta y no está anclado por el sello.

5. **Detectar mortalidad que desplaza al reingreso.** Un
   paciente que muere en casa dentro de los 30 días posteriores
   al alta no cuenta como reingreso. Si un hospital con una alta
   tasa de cambio-de-mortalidad produce una baja tasa de
   reingreso, la tasa de reingreso parece buena mientras que el
   resultado subyacente es peor. El sello registra reingresos; el
   seguimiento de la mortalidad es una medida separada con un
   sello separado (y necesario). Sellar tasas de reingreso sin
   datos de mortalidad acompañantes puede engañar. El kit rechaza
   esta configuración (vea la regla de rechazo R4 abajo).

6. **Sustituir a CMS Hospital Compare, las medidas ajustadas por
   riesgo de HRRP, o cualquier programa estatutario de reporte
   de calidad.** Las presentaciones del hospital a CMS bajo el
   Programa de Reducción de Reingresos Hospitalarios (HRRP), el
   Programa de Reporte de Calidad de Pacientes Hospitalizados
   (HIQR), MIPS, y cualquier requisito estatal de reporte se
   mantienen por estatuto y se producen a demanda del regulador.
   El sello agrega una capa pública de evidencia-de-manipulación
   ENCIMA de esas presentaciones; NO las reemplaza. Una
   publicación sellada no es una presentación de CMS.

7. **Probar que el hospital es "mejor" o "peor" que otro
   hospital.** La comparación entre hospitales de tasas crudas de
   reingreso sin ajuste por mezcla de casos es metodológicamente
   poco sólida y es exactamente por eso que HRRP usa medidas
   ajustadas por riesgo. El sello publica tasas crudas por
   condición Y las tasas ajustadas por riesgo de la versión de
   especificación de CMS Y los denominadores, para que un
   investigador pueda re-derivar la comparación ajustada por
   mezcla-de-casos por sí mismo. El sello mismo no clasifica
   hospitales.

8. **Atrapar fraude de codificación contemporáneo.** Un equipo de
   codificación hospitalaria que clasifique mal un reingreso como
   una nueva admisión en el momento de la admisión produce una
   tasa sellada internamente consistente con la codificación
   (fraudulenta). El sello hace detectable la modificación
   silenciosa posterior, pero no detecta la mala codificación
   contemporánea. La detección del fraude de codificación
   contemporáneo requiere auditorías del Contratista de Auditoría
   de Recuperación (RAC) de CMS, revisión de la Oficina del
   Inspector General (OIG), auditorías internas de codificación
   y divulgaciones de denunciantes — todo lo cual está aguas
   arriba del sello.

**La sección de límites honestos arriba es la parte
portadora-de-carga de este kit.** Los administradores
hospitalarios que tratan "sellamos nuestra tasa de reingreso"
como equivalente a "demostramos que brindamos buena atención"
abusan de la primitiva. El kit debe decirlo claramente: *esta es
una primitiva de no-repudiación para las afirmaciones
contemporáneas del hospital sobre el registro de reingresos, no
una medida de calidad, no un sustituto para la supervisión de
CMS, y no una defensa contra los modos de falla
selección-en-el-extremo-inicial, desplazamiento-de-mortalidad o
transferencia-de-atención que hacen que las tasas de reingreso
por sí solas sean una imagen parcial de la calidad hospitalaria.*

---

## Lo que este kit DEBE NEGARSE a sellar

El kit está configurado para rechazar los siguientes patrones de
hecho incluso si un usuario con autoridad de firma hospitalaria
válida los envía:

- **Resultados por paciente.** Ningún hecho puede nombrar a un
  paciente, vincular un reingreso a un paciente, exponer un
  número de registro médico, exponer una combinación
  fecha-de-nacimiento + fecha-de-admisión que pudiera ser
  re-identificadora en una celda pequeña, o incluir cualquier
  identificador protegido por HIPAA. Los conteos agregados a
  nivel de condición son la unidad de análisis; cualquier cosa
  por paciente es rechazada. (R1)

- **Resultados por médico.** Ningún hecho puede atribuir conteos
  de reingreso a un médico de cabecera nombrado, hospitalista
  nombrado, cirujano nombrado o clínico de alta nombrado. Esto
  es innegociable por dos razones: (a) las tasas de reingreso
  por médico son estadísticamente ruidosas a los volúmenes que
  la mayoría de los médicos ven en un mes y son ampliamente mal
  utilizadas; (b) más importante aún, la puntuación pública por
  médico crea vectores directos de represalia contra clínicos
  que abogan por pacientes más enfermos, de mayor riesgo, menos
  favorables al seguro, contra clínicos que reportan problemas
  de seguridad, y contra clínicos que se niegan a manipular la
  medida. El sello no debe convertirse en una herramienta para
  enfriar la abogacía clínica. La medición de calidad por
  médico, donde sea apropiado, pertenece a la revisión interna
  por pares y a los comités de credencialización con sus propias
  protecciones de debido proceso — no en Bitcoin. (R2)

- **Tasas solo-ajustadas-por-riesgo sin tasas crudas.** El kit
  se niega a sellar un cuerpo de hechos que contenga SOLO la
  tasa de reingreso a nivel de hospital ajustada por riesgo de
  CMS (o cualquier otra medida ajustada) sin el numerador crudo,
  denominador crudo y tasa cruda correspondientes. El ajuste por
  riesgo es una caja negra desde la perspectiva de un auditor
  externo; sin las tasas crudas, un cambio de metodología entre
  meses es invisible. El sello DEBE incluir conteos crudos para
  que el sello del próximo mes pueda compararse con el sello de
  este mes a nivel de datos crudos. (R3)

- **Tasas agregadas a nivel de hospital sin desglose por
  condición.** Una sola tasa de reingreso a nivel de hospital
  oculta el vector exacto de manipulación que el sello está
  diseñado para hacer visible — un hospital podría cambiar
  silenciosamente la mezcla de casos de DRGs de alto-reingreso
  a DRGs de bajo-reingreso mientras la tasa a nivel de hospital
  parece estable o mejorando. Las tasas por condición (como
  mínimo: AMI, insuficiencia cardíaca, neumonía, EPOC, CABG,
  THA/TKA, las cohortes HRRP) DEBEN aparecer, con denominadores
  por condición. La tasa a nivel de hospital, si se reporta, es
  además de (no en lugar de) las tasas por condición. (R4)

- **Cualquier cosa que no fuera comparable contra el sello del
  próximo mes.** Todo el valor forense de este kit proviene de
  la comparabilidad mes-a-mes. El kit rechaza cuerpos de hechos
  que están estructurados de modo que el sello del próximo mes
  no pueda compararse con este — por ejemplo, un texto libre
  "nuestra tasa de reingreso es aproximadamente X por ciento"
  sin un numerador fijo, denominador, versión de metodología y
  lista de criterios de exclusión. Si el analista del próximo
  mes no puede calcular "este número pasó de X a Y debido a A
  y B," el hecho está malformado y el kit se niega a sellarlo.
  (R5)

- **Datos de mortalidad sin atestación de mortalidad
  acompañante.** Sellar reingresos sin sellar la mortalidad
  post-alta a 30 días habilita el vector de manipulación
  "pacientes que mueren en casa no cuentan como reingresos" que
  produce una tasa de reingreso engañosamente baja. El kit
  rechaza sellar una atestación de reingresos que no (a) incluya
  el conteo de mortalidad post-alta a 30 días en la misma
  publicación, o (b) haga referencia, por raíz de Merkle, a una
  atestación de mortalidad acompañante para el mismo período.
  (R6)

- **Conteos de estado-de-observación que excluyen la categoría
  de justificación.** El kit rechaza sellar un conteo de
  estado-de-observación que no desglose las categorías de
  justificación (descarte de dolor torácico, síncope,
  deshidratación, etc.) y la distribución de duración. Un
  conteo agregado simple de observación habilita el patrón
  exacto de manipulación que este sello está diseñado para hacer
  visible: un cambio silencioso de admisión hospitalaria a
  estado de observación para casos que de otro modo se habrían
  contado como admisiones índice. (R7)

- **Conteos de transferencia que excluyen la categoría de
  instalación receptora y la marca dentro-del-sistema.** Una
  transferencia a un hospital hermano dentro del mismo sistema
  de salud es funcionalmente diferente de una transferencia a
  una instalación independiente. El kit rechaza sellar conteos
  de transferencia sin el desglose dentro-del-sistema. (R8)

- **Sellado por alguien que no sea el Director Médico
  certificante Y un oficial de Calidad separado.** Mínimo de
  dos firmantes para atestaciones hospitalarias, porque los
  vectores de manipulación aquí son exactamente del tipo que el
  fraude institucional de firmante-único oculta. Un consultor de
  calidad externo, un registro externo, o una asociación estatal
  de hospitales puede usar el mismo kit para sellar SU propio
  análisis independiente; NO pueden sellar la atestación
  primaria de reingresos del hospital bajo el nombre del
  hospital. (R9)

Un rechazo en sí mismo puede ser sellado como un hecho ("Este
hospital solicitó sellar X; el kit rechazó según la regla de
rechazo Y"), creando un registro público de intento de mal uso.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la atestación mensual:

1. **Aviso de ejemplo** — declara la publicación como ejemplo
   (atestaciones reales eliminan o reemplazan esto).
2. **Identificación del hospital** — nombre legal del hospital,
   Número de Certificación CMS (CCN), región de instalación, rol
   del CMO certificante + rol del oficial de Calidad + info de
   clave criptográfica.
3. **Período de atestación** — mes calendario cubierto, fecha de
   congelación de datos, fecha de atestación, declaración de que
   ningún registro ha sido modificado después de la fecha de
   congelación de datos para el período bajo atestación.
4. **Tasas de reingreso** — tasas de reingreso por-DRG /
   por-condición a 30 días por toda causa, numerador crudo,
   denominador crudo, tasa cruda con intervalo de confianza del
   95%, Y la tasa ajustada por riesgo de la versión de
   especificación de CMS junto con la tasa cruda (por regla de
   rechazo R3).
5. **Conteos de admisión índice** — denominadores por condición,
   total de altas hospitalarias del mes, desglose por pagador
   primario (Medicare FFS / Medicare Advantage / Medicaid /
   comercial / pago-propio / otro) para transparencia de
   mezcla-de-casos.
6. **Divulgación del estado de observación** — conteo de altas
   con estado de observación, desglose por categoría de
   justificación, distribución de duración (≤24h, 24-48h, >48h),
   y el conteo de conversiones de hospitalización-a-observación
   si las hay (el patrón de manipulación adyacente a la "regla
   de las dos medianoches").
7. **Divulgación de transferencias** — conteos de pacientes
   transferidos a otras instalaciones hospitalarias,
   desglosados por dentro-del-sistema vs. instalación receptora
   independiente, por categoría de razón (escalada de nivel de
   atención, solicitud del paciente, capacidad, seguro), y
   conteos de pacientes recibidos como transferencias (para que
   el flujo neto sea calculable).
8. **Metodología** — versión de especificación de CMS (año de
   medida HRRP), criterios de exclusión aplicados, manejo de
   exclusión de reingresos planeados, política de atribución de
   transferencia hacia afuera, política de
   observación-como-admisión-índice, declaración de cualquier
   cambio de la metodología sellada del mes anterior con una
   referencia de raíz de Merkle al sello del período anterior,
   info de clave criptográfica del principal firmante.

Cada hecho termina con la convención de puerta-de-rechazo:
*"Este hecho afirma solo X. No afirma Y"* (donde Y es el modo
de falla más cercano de la sección "NO hace" arriba).

---

## Contra qué defiende este kit

- **Revisión retroactiva silenciosa de las tasas de reingreso.**
  Todos los hechos portadores-de-tasa son hasheados. El
  re-hasheo post-atestación revela cualquier modificación. Un
  regulador, investigador, o denunciante que tenga la raíz
  sellada del mes anterior puede detectar cualquier cambio
  silencioso a la tasa publicada del mes anterior cuando el
  hospital reporte la próxima vez.
- **Manipulación de estado-de-observación-como-alta volviéndose
  indetectable.** El HECHO 06 congela el conteo de observación,
  la distribución por categoría de justificación, y la
  distribución de duración en la atestación. Un cambio
  silencioso mes-a-mes de alta hospitalaria a estado de
  observación (que removería del denominador lo que habrían sido
  las admisiones índice) es públicamente comparable a través de
  los sellos.
- **Deriva metodológica entre períodos de reporte de CMS.** El
  HECHO 08 congela la versión de especificación de CMS, los
  criterios de exclusión, y el manejo de exclusión de reingresos
  planeados. Cualquier cambio debe divulgarse en el HECHO 08 del
  próximo mes con una referencia a la raíz de Merkle de este mes.
  Un cambio silencioso de metodología entre meses que produce un
  movimiento favorable de tasa es públicamente detectable.
- **Manipulación de atribución de transferencia hacia afuera.**
  El HECHO 07 congela patrones de transferencia incluyendo la
  marca dentro-del-sistema y la categoría de razón. Un cambio
  silencioso hacia transferir pacientes de alto riesgo antes de
  30 días (que los removería del numerador de reingresos bajo
  algunas especificaciones) es públicamente detectable a través
  de los meses.
- **Manipulación de mezcla-de-casos vía pagador o cambio de
  DRG.** El denominador por condición y el desglose por pagador
  del HECHO 05 congelan la mezcla de casos del mes. Un cambio
  silencioso lejos de condiciones de alto-reingreso (admitiendo
  menos pacientes con insuficiencia cardíaca mientras se admiten
  más pacientes electivos ortopédicos, por ejemplo) es
  públicamente comparable a través de los meses.
- **Confusión de tasas crudas y ajustadas por riesgo.** El
  HECHO 04 requiere ambas. Una futura afirmación "nuestra tasa
  ajustada por riesgo mejoró por X" es públicamente verificable
  contra el movimiento de la tasa cruda y el movimiento del
  denominador en conjunto.
- **Re-narración metodológica post-hoc.** El HECHO 08 se sella
  en la atestación. Una futura afirmación "siempre usamos la
  metodología Y" es públicamente refutable contra la metodología
  sellada del período en cuestión.

El kit **no** defiende contra el fraude de codificación
contemporáneo — un hospital que clasifica mal un reingreso como
una nueva admisión en el momento de la codificación produce un
sello criptográficamente válido de un conteo fraudulento. La
primitiva es honesta al respecto: es una primitiva de
no-repudiación para las afirmaciones contemporáneas del
hospital, no una prueba de que esas afirmaciones sean correctas.

---

## Cuándo usar este kit

- Su hospital tiene un flujo de trabajo estable de mezcla-de-casos
  y codificación y desea agregar una atestación pública mensual
  anclada en Bitcoin como una capa de evidencia-de-manipulación
  sobre el flujo de trabajo existente de reportes HRRP / HIQR.
- Es un sistema hospitalario que desea publicar transparencia a
  nivel de sistema a través de múltiples instalaciones, sellado
  por-instalación por-mes, para que la variación dentro-del-
  sistema sea públicamente comparable.
- Es un investigador de salud pública o asociación estatal de
  hospitales que ejecuta un programa voluntario de transparencia
  entre hospitales participantes, y desea una primitiva
  criptográfica común que todos los hospitales participantes
  puedan usar sin confiar en un agregador central.
- Es un hospital en una jurisdicción cuya infraestructura
  estatutaria de reporte es débil o donde espera un escrutinio
  significativo de pagadores / pacientes / reguladores sobre
  sus afirmaciones de reingreso, y desea una línea de tiempo
  globalmente verificable de esas afirmaciones.
- Puede publicar el conjunto de hechos listado sin romper las
  reglas de rechazo R1-R9. Si sus hechos requerirían una
  ruptura de R1-R9, no use el kit; arregle primero las entradas
  de datos.
- El consejo legal del hospital y compliance han revisado el
  plan de publicación. La publicación pública de un artefacto
  portador-de-CCN, portador-de-tasa tiene implicaciones bajo
  HIPAA (estándares de des-identificación), HRRP (interacción
  con el reporte estatutario), y reguladores estatales
  (interacción con leyes estatales de transparencia). La
  revisión de consejo legal no es opcional.

## Cuándo NO usar este kit

- **No usar como sustituto de las presentaciones CMS HRRP /
  HIQR / Hospital Compare.** El sello es *aditivo*, no
  reemplazo. Sus presentaciones estatutarias, sus registros de
  auditoría CMS, su programa interno de calidad — sin cambios.
- **No usar como afirmación de calidad.** Sellar una tasa baja
  de reingreso no establece que el hospital brinde buena
  atención; establece que el registro tenía este contenido de
  bytes en este momento. Las reglas de rechazo R1-R9 rechazarán
  patrones que confunden la atestación con el endoso de calidad.
- **No usar para publicar datos por paciente o por médico.** Las
  reglas de rechazo R1-R2 existen por razones de HIPAA,
  prevención de represalias, y solidez estadística; no enmiende
  el kit para anularlas sin consultar consejo legal y revisión
  ética.
- **No usar bajo presión para sellar antes de que la congelación
  de datos del mes sea final.** Un sello con datos parciales
  tergiversa el período de atestación y crea un punto de
  referencia engañoso.
- **No usar sin una atestación de mortalidad acompañante.** La
  regla de rechazo R6 rechazará atestaciones de reingreso que
  omitan mortalidad. Las dos medidas juntas son parciales;
  cualquiera sola es engañosa.
- **No usar como teatro de legitimidad.** Un sello de un
  registro de reingresos manipulado es un registro público
  permanente de la manipulación, no una defensa contra ella. La
  primitiva corta en ambas direcciones; esa es su honestidad.

## Cómo bifurcar este kit para una atestación mensual real

```bash
cp -r ~/Genesis/myriam-kit/examples/hospital-readmission-attestation ~/readmission-2026-04
cd ~/readmission-2026-04
$EDITOR facts/*.txt        # replace fictional content with real month
                           # apply refusal rules R1-R9 throughout
bash build/seal.sh         # SEAL AT month-end + data-freeze + CMO/QO sign-off
python3 build/verify.py    # confirm
```

**TIEMPO CRÍTICO:** sellar EN el momento de la congelación
mensual de datos + aprobación del CMO y oficial de Calidad. No
sellar a mitad de mes. No sellar después de que la reunión
interna de revisión del hospital haya tenido la oportunidad de
"ajustar" los números — el objetivo central es anclar lo que los
datos decían en la congelación antes de cualquier ajuste. La
ventana correcta está entre la congelación formal de datos y la
primera vez que la tasa sea citada públicamente.

**REVISIÓN CRÍTICA:** antes de sellar, ejecute la publicación a
través del oficial de Calidad (separado del CMO), a través de
codificación / compliance, y a través de consejo legal. La regla
de dos firmantes (HECHO 02 y HECHO 08) existe para prevenir
fraude institucional de firmante-único.

**CADENCIA MENSUAL:** el valor del kit se acumula a través de
los meses. Sellar una vez es útil; sellar cada mes durante un
año es el artefacto. El HECHO 08 de cada nuevo mes hace
referencia a la raíz de Merkle del mes anterior para que la
cadena de atestaciones sea públicamente recorrible.

## Integración con la infraestructura existente de calidad
hospitalaria

- **CMS Hospital Readmissions Reduction Program (HRRP).** La
  URL de la publicación sellada o el CID IPFS puede ser
  referenciado en los materiales de divulgación pública del
  hospital. El sello compromete las tasas por-condición crudas
  y ajustadas por riesgo que el hospital reporta a CMS;
  disputas posteriores sobre lo que se reportó son públicamente
  refutables.
- **CMS Hospital Inpatient Quality Reporting (HIQR) Program.**
  El sello compromete los conteos subyacentes que alimentan las
  medidas HIQR; el sello no reemplaza la presentación HIQR.
- **CMS Hospital Compare / Care Compare sitio público.** El
  sello se sitúa junto a Hospital Compare como atestación
  independiente; el hospital puede referenciar sus
  publicaciones mensuales selladas en materiales orientados al
  paciente.
- **Reportes de asociaciones estatales de hospitales (p.ej.
  PHC4 en Pensilvania, OSHPD/HCAI en California, NYSDOH en
  Nueva York).** Compatible como capa aditiva de transparencia;
  los conteos por condición del sello pueden ser
  intercalibrados con las categorías de reporte estatales donde
  las definiciones se alinean.
- **The Leapfrog Group, US News & World Report rankings,
  Healthgrades, programas de cohortes Vizient.** Compatible.
  Estos programas agregan datos de calidad hospitalaria; una
  atestación mensual sellada les permite (y al público)
  verificar que las afirmaciones del hospital hacia ellos
  coinciden con las afirmaciones del hospital en otro lugar.
- **Acreditación de The Joint Commission.** Compatible. Las
  atestaciones selladas son evidencia documental que el
  inspector de la Joint Commission puede verificar durante las
  visitas de acreditación.
- **Credencialización interna y revisión por pares (por
  Healthcare Quality Improvement Act de 1986).** Fuera del
  alcance del sello directamente. Los datos por médico no
  aparecen en el sello (regla de rechazo R2). La revisión
  interna por pares permanece bajo las protecciones de HCQIA.
- **CMS MIPS (Merit-based Incentive Payment System) para
  médicos individuales.** Fuera del alcance; el sello es solo
  a nivel hospitalario.

## Lo que este kit NO reemplaza

- Presentación CMS HRRP.
- Presentación CMS HIQR.
- Alimentación de datos CMS Hospital Compare / Care Compare.
- Reporte hospitalario a nivel estatal (PHC4, OSHPD/HCAI,
  NYSDOH, equivalentes estatales).
- Acreditación de Joint Commission.
- Revisión interna por pares y credencialización.
- Auditorías CMS Recovery Audit Contractor (RAC).
- Supervisión de HHS Office of Inspector General (OIG).
- Revisión CMS Quality Improvement Organization (QIO).
- Reporte de eventos de seguridad del paciente (CMS Conditions
  of Participation, requisitos estatales, reporte PSO).
- Atestación compañera de mortalidad post-alta a 30 días (que
  debería sellarse bajo una publicación myriam-kit separada
  para el mismo período — vea regla de rechazo R6).

## Valor de adopción y estimación honesta de impacto

El Programa de Reducción de Reingresos Hospitalarios (HRRP)
actualmente impone penalidades de pago a hospitales de EE.UU.
cuyas tasas de reingreso a 30 días ajustadas por riesgo
exceden la tasa esperada de CMS. Las estimaciones publicadas
de los totales anuales de penalidades HRRP están en los
**cientos de millones de dólares por año a nivel nacional**
(el total de penalidades FY2023 fue reportado por CMS en
aproximadamente $320 millones; el acumulado de vida del
programa está en los miles de millones). La estructura de
penalidad crea incentivos financieros medibles para que los
hospitales sub-reporten reingresos mediante manipulación del
estado de observación, manipulación de transferencia hacia
afuera, cambio de mezcla-de-casos y revisión silenciosa de
casos límite — todo lo cual está documentado en la literatura
revisada por pares (Wadhera et al., JAMA 2018-2019; Khera et
al., JAMA 2018; Gupta et al., JAMA Cardiol 2018; Zuckerman et
al., NEJM 2016 y críticas posteriores).

**La estimación honesta del impacto:**

Una atestación mensual sellada de reingresos no reduce el
incentivo a manipular; hace detectable una categoría de
manipulación. Si las atestaciones selladas son adoptadas por
hospitales que representan ~20 por ciento de las admisiones
elegibles para HRRP durante 5 años, y si la detectabilidad
resultante disuade incluso ~10 por ciento de la manipulación
que de otro modo ocurriría, el valor de salud pública está en
mejor planificación de alta para alguna fracción de pacientes
que de otro modo habrían sido dados-de-alta-para-manipular en
lugar de dados-de-alta-para-realmente-recuperarse. Traducir
eso a un conteo de vidas es difícil y el kit se niega a
publicar una sola estimación de víctimas que sería citada como
autoritativa — la cadena de inferencia de "manipulación reducida
por X" a "muertes prevenidas por Y" corre a través de múltiples
parámetros pobremente identificados (qué fracción de altas
manipuladas produjo mortalidad prevenible, la calidad
contrafactual de la atención, la distribución de riesgo a
través de cohortes susceptibles a manipulación) y cualquier
número específico citado como estimación de víctimas estaría
inventando precisión que los datos no respaldan.

**El encuadre honesto:**

El argumento para la adopción no es "este kit salvará N vidas."
Es: *si usted cree que la literatura publicada de
manipulación-HRRP (Wadhera, Khera, Gupta, Zuckerman, y otros)
es aproximadamente correcta en que la manipulación es una
fracción medible de la mejora aparente de HRRP desde 2012,
entonces una atestación mensual a prueba de manipulación es la
primitiva disponible más barata que hace que esa manipulación
sea públicamente comparable a través de los meses. El sello no
detiene la manipulación; hace que un canal de ella sea
auditable. Esa auditabilidad es lo que produce presión social
sobre los hospitales para no manipular. La presión social es lo
que produce (alguna fracción de) la mejora real en la atención.
Las vidas salvadas están aguas abajo de tres pasos causales que
el sello mismo no realiza. Adopte el kit con ese entendimiento,
no con una promesa de vidas-salvadas.*

Los valores predeterminados del kit son deliberadamente
conservadores en datos por-paciente (regla de rechazo R1),
agresivos en prevención de represalias por-médico (regla de
rechazo R2), y agresivos en el descargo de responsabilidad
"esto no es una afirmación de calidad". Los hospitales en
jurisdicciones donde los requisitos específicos de divulgación
pública difieren pueden enmendar su bifurcación
correspondientemente, pero los rechazos predeterminados
favorecen la privacidad del paciente, la protección de
abogacía clínica y el alcance honesto.

## Patrones históricos con los que el kit habría ayudado

El kit habría producido un registro forense mes-a-mes útil —
*no una solución* — en los siguientes patrones documentados:

- **Crecimiento del estado-de-observación en la era HRRP.**
  Múltiples estudios documentaron un crecimiento sustancial en
  altas con estado de observación a través de hospitales de
  EE.UU. coincidiendo con la implementación de HRRP (Sheehy et
  al.; Zuckerman et al.). Un conteo mensual sellado por-hospital
  de observación con desglose por categoría de justificación
  (HECHO 06) habría hecho públicamente comparable el momento y
  la magnitud de la contribución de cada hospital a ese patrón,
  en lugar de visible solo en investigación
  nacional-agregada-retrospectiva años después.
- **Disparidades de penalización HRRP afectando hospitales de
  red-de-seguridad.** Los hospitales que sirven a poblaciones
  más desfavorecidas enfrentan penalizaciones HRRP más altas
  bajo el ajuste estándar de riesgo (por múltiples análisis
  Khera et al.); un desglose mensual sellado por pagador
  (HECHO 05) permitiría al público rastrear separadamente
  cambios de mezcla-de-casos de cambios de tasa para cada
  hospital, haciendo posible distinguir la mejora real de tasa
  del cambio de mezcla-de-casos.
- **Patrones de transferencia dentro-del-sistema en sistemas de
  salud multi-instalación.** Algunos sistemas hospitalarios
  multi-instalación han sido documentados como derivando
  necesidades post-alta a través de instalaciones
  dentro-del-sistema de formas que no siempre aparecen como
  transferencias en las medidas HRRP. Un conteo mensual sellado
  de transferencia con marca dentro-del-sistema (HECHO 07)
  haría esto públicamente rastreable por instalación por mes.

El kit NO habría resuelto las disputas subyacentes sobre la
metodología de ajuste de riesgo de HRRP, sobre si HRRP es en
balance útil o perjudicial para los resultados del paciente, o
sobre si la estructura de penalización debería cambiarse. Esos
son debates de política aguas arriba del sello.

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
