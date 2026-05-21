*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de Sellado de Atestación de Carbono

Un ejemplo llave en mano de myriam-kit para desarrolladores de proyectos
de carbono, verificadores externos y registros que deseen publicar un
sello anclado en Bitcoin y evidente ante manipulación de la emisión de
un crédito de carbono, la verificación de una remoción o un evento de
atestación de emisiones en el momento exacto de la certificación — de
modo que las modificaciones silenciosas posteriores a la emisión se
vuelvan públicamente detectables.

---

## Lo que este kit NO hace (lea esto primero)

Los créditos de carbono son política y científicamente disputados. El
sello es una marca temporal criptográfica de lo que fue atestiguado. No
puede verificar si lo atestiguado refleja un beneficio climático real.
Los siguientes modos de falla están **fuera del dominio del sello**, y
representan la mayoría de las cuestiones de integridad significativas
sobre los créditos de carbono:

1. **Adicionalidad.** El sello no puede verificar que la actividad
   acreditada no se hubiera realizado sin financiamiento de carbono.
   La contrafáctica es inobservable por principio. El sello registra
   el argumento de adicionalidad de la metodología; no lo dirime.

2. **Permanencia.** El sello no puede verificar que el carbono
   secuestrado permanezca secuestrado durante el horizonte temporal
   pertinente (décadas a siglos para el carbono forestal, escalas
   geológicas para algunas remociones). La literatura reciente
   (Badgley et al. 2022, Patterson et al. 2022) muestra que las
   reservas de amortiguación (buffer pools) se han visto sustancialmente
   mermadas por eventos reales de reversión. Un crédito sellado es una
   *afirmación* sellada de permanencia bajo supuestos especificados
   sobre la reserva de amortiguación, no una prueba de permanencia.

3. **Fugas (leakage).** El sello no puede verificar que las emisiones
   evitadas en el área del proyecto no sean simplemente desplazadas a
   un área fuera del proyecto. Las deducciones por fuga por defecto
   de la metodología son sustitutos regulatorios, no mediciones. El
   sello ancla la deducción aplicada; no la certifica como correcta.

4. **Co-beneficios.** El sello no puede verificar reivindicaciones de
   desarrollo comunitario o de biodiversidad. Los co-beneficios
   suelen ser autodeclarados y revisados por el verificador, no
   auditados con la profundidad de la cuantificación del carbono. El
   sello ancla los hashes de los documentos; nada más.

5. **Suficiencia del Consentimiento Libre, Previo e Informado (CLPI /
   FPIC).** El consentimiento indígena y comunitario en proyectos de
   carbono tiene una historia documentada de modos de falla
   (consentimiento coaccionado, consentimiento por parte de órganos
   no representativos, "consentimiento" post-hoc a través de
   compensación). El sello ancla la documentación CLPI y los hashes
   del registro de quejas; no puede certificar que el proceso de
   consentimiento haya sido genuino.

6. **Independencia del verificador.** Los verificadores son pagados
   por los desarrolladores del proyecto. Este es un conflicto de
   intereses estructural que ningún esquema de acreditación ha
   resuelto. El sello ancla la declaración de independencia del
   verificador; no certifica que la declaración sea verdadera.

7. **Doble conteo entre registros o con inventarios nacionales.** El
   sello ancla la instantánea del estado del registro en el momento
   de la atestación. Si la misma actividad también está siendo
   contabilizada por un país anfitrión en su NDC, o también es
   reclamada en otro registro, el sello hace que el estado del
   registro sea comparable, pero no impide el doble conteo.

8. **Corrección de la reclamación del comprador.** Un comprador que
   retira un crédito sellado para respaldar una reclamación de
   "cero neto" o "neutralidad en carbono" está haciendo una
   reclamación posterior que el sello no cubre. El sello registra el
   retiro; la validez de la reclamación comercial del comprador es
   una cuestión separada y posterior.

9. **Corrección de la metodología.** El sello registra la cita de la
   metodología + el hash del documento vigente al momento de la
   atestación. No afirma que la metodología sea científicamente
   válida. Las reformas de metodología ocurren; sellar bajo una
   metodología que luego es revisada no hace retroactivamente a los
   créditos "incorrectos" o "correctos" — ancla qué reglas
   aplicaban en el momento de la emisión.

**La sección anterior sobre límites honestos es la parte estructural
de este kit.** Casi todas las cuestiones de integridad significativas
sobre un crédito de carbono caen en uno de esos nueve cubos. El sello
cierra la estrecha brecha restante: la modificación retroactiva
silenciosa de los bytes en el registro. Esa brecha es real y vale la
pena cerrarla, pero es pequeña en relación con el terreno disputado.

---

## Lo que este kit DEBE RECHAZAR sellar

El kit está configurado para rechazar los siguientes patrones de hechos
incluso si un usuario con autoridad de firma válida los presenta:

- **"Adicionalidad" declarada como un hecho.** Sellar la adicionalidad
  como hecho crea un registro engañoso. El kit acepta *argumentos*
  de adicionalidad conformes a la metodología, no *reclamaciones* de
  adicionalidad.
- **"Permanencia" sin divulgación explícita del horizonte temporal y
  de la reserva de amortiguación.** Sellar la permanencia sin esos
  parámetros oscurece a qué se está comprometiendo realmente el
  proyecto.
- **"Sin fugas" sin medición específica del proyecto.** Las
  deducciones por fuga por defecto de la metodología no son medición
  y el sello no las tratará como tales.
- **Cuantificaciones generadas antes de que la verificación por
  terceros haya finalizado.** Un sello previo a la verificación crea
  un registro falso positivo de "verificado".
- **Registros de emisión de créditos también emitidos en un registro
  diferente sin divulgación explícita entre registros** en HECHO 06.
- **Registros de retiro que no nombran al beneficiario del retiro.**
  El retiro anónimo socava la función de bien público del retiro;
  el kit se niega a habilitarlo.
- **Reclamaciones de CLPI no respaldadas por hashes de documentación
  atestiguable.**
- **Emisión bajo Artículo 6.2 / 6.4 sin un hash de carta de
  autorización (LoA) del país anfitrión** sellado en HECHO 06.
- **Sellado a solicitud de cualquier parte distinta del desarrollador
  del proyecto + el verificador conjuntamente** para ese proyecto.
- **Reclamaciones de co-beneficios selladas como "certificadas"**
  cuando son sólo "autodeclaradas y revisadas por el verificador".

Una negativa en sí misma puede ser sellada como un hecho ("Esta parte
solicitó el sellado de X; el kit se negó según la regla de rechazo Y"),
creando un registro público del intento de uso indebido.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la atestación:

1. **Aviso de ejemplo** — declara que la publicación es un ejemplo
   (las atestaciones reales eliminan o reemplazan esto).
2. **Identificación del proyecto** — nombre del proyecto, registro,
   ID del proyecto en el registro, cita de la metodología + hash,
   hash del límite geográfico, vintage, desarrollador del proyecto,
   reivindicación de co-beneficios, estado de CLPI.
3. **Cuantificación de emisiones o remociones** — toneladas brutas de
   CO2e, contrafáctica de línea base, deducción por fuga,
   contribución a la reserva de amortiguación, deducción por
   incertidumbre, reclamación neta acreditable, hashes de cada
   entrada numérica.
4. **Metodología de medición** — fuentes de datos de teledetección,
   red de parcelas de verificación en terreno, hash del registro de
   calibración de instrumentos, hash del modelo clasificador +
   estadísticas de precisión, modelo de densidad de carbono,
   procedencia del código + manifiesto de reproducibilidad.
5. **Verificación por terceros** — organización verificadora,
   acreditación, hash de la declaración de independencia,
   compromisos previos con el desarrollador, hash del archivo
   fotográfico de la visita al sitio, hallazgos planteados y
   resueltos, hash del documento de opinión de verificación.
6. **Registro de emisión o retiro** — solicitud + aprobación de
   emisión, total de créditos emitidos, rango de números de serie,
   declaración entre registros, hash de la LoA del país anfitrión
   cuando corresponda, rangos de números de serie de retiro +
   beneficiarios (para atestaciones de retiro), hashes de la
   instantánea del estado del registro.
7. **Divulgaciones complementarias y registro de rechazos** —
   disputas de metodología pendientes, riesgo de no permanencia,
   salvedades sobre fugas, salvedades sobre adicionalidad, hashes de
   CLPI + registro de quejas, salvedad sobre co-beneficios,
   compromisos previos del verificador; lista explícita de patrones
   que el kit se negó a sellar.
8. **Principal firmante** — desarrollador del proyecto + verificador +
   registro, cada uno con rol + alcance de la atestación + información
   sobre la clave criptográfica.

Cada hecho termina con la convención de la puerta de rechazo: *"Este
hecho afirma sólo X. No afirma Y"* (donde Y es el modo de falla más
cercano de la sección "NO hace" anterior).

---

## Contra qué se defiende este kit

- **Modificación silenciosa post-emisión de la cuantificación.**
  Cualquier cambio entero en el HECHO 03 produce un SHA-256
  diferente, una raíz de Merkle diferente, falla la verificación
  OTS.
- **Sustitución silenciosa de metodología.** El HECHO 02 congela la
  cita de la metodología + el hash del documento en el momento de la
  emisión. Una sustitución por parte del registro de una versión
  diferente de la metodología tras la emisión es comparable
  públicamente.
- **Revisión silenciosa de la línea base.** El hash de la salida del
  modelo del escenario de línea base del HECHO 03 está sellado. Una
  recalibración post-hoc de la línea base para producir más créditos
  es detectable.
- **Sustitución silenciosa de la opinión del verificador.** El hash
  del documento de opinión del HECHO 05 está sellado. Una
  reescritura post-emisión del tipo "el verificador siempre dijo X"
  es detectable.
- **Desaparición silenciosa de un registro de retiro.** La
  instantánea del estado del registro del HECHO 06 está sellada. Los
  créditos que misteriosamente se vuelven a hacer "disponibles"
  después de haber sido marcados como retirados son detectables
  frente al sello.
- **Sustitución silenciosa de documentos CLPI.** Los hashes del CLPI
  + registro de quejas del HECHO 07 están sellados. Los documentos
  de consentimiento sustituidos son detectables.
- **Eliminación silenciosa de divulgaciones inconvenientes.** El
  estado de divulgación complementaria del HECHO 07 está sellado. La
  eliminación silenciosa de una salvedad sobre no permanencia de la
  página de descripción de un proyecto es detectable frente a los
  bytes sellados.

El kit NO se defiende contra las cuestiones de integridad subyacentes
(adicionalidad, permanencia, fugas, suficiencia de CLPI,
independencia del verificador, validez de la metodología). Esos son
los problemas más difíciles y el sello no puede resolverlos.

---

## Casos históricos o casi históricos en los que el kit habría ayudado

El kit habría producido un ancla útil — *no una solución* — en casos
que involucran la modificación retroactiva silenciosa de registros de
atestación de carbono. NO habría resuelto las cuestiones disputadas
subyacentes en ninguno de estos casos.

- **La investigación de 2023 de The Guardian / Die Zeit /
  SourceMaterial sobre los créditos de selva tropical de Verra.** Los
  investigadores encontraron que la mayoría de los proyectos REDD+
  estudiados producían créditos cuyas emisiones evitadas declaradas
  no coincidían con un reanálisis posterior por teledetección. La
  investigación requirió reconstruir la documentación del proyecto
  frente a registros de registro modificados retroactivamente. Una
  publicación sellada en cada ciclo de emisión habría proporcionado
  bytes de referencia inequívocos de lo que se atestiguó en cada
  ciclo — no una solución para el problema subyacente de la línea
  base, sino una línea de tiempo forense limpia.

- **Los eventos de reversión de compensaciones forestales de
  California de 2020.** Múltiples proyectos de carbono forestal bajo
  el mercado de cumplimiento de California experimentaron
  reversiones por incendios forestales que excedieron la reserva de
  amortiguación apartada para ellos. Reconstruir lo que cada
  proyecto había atestiguado sobre el riesgo de no permanencia *al
  momento de la emisión* (frente a lo que el proyecto luego afirmó
  haber atestiguado) es actualmente difícil. Los sellos por vintage
  habrían hecho que las atestaciones previas al incendio fueran
  canónicamente recuperables.

- **Varios proyectos REDD+ en los que las metodologías de línea base
  de región de referencia fueron criticadas retroactivamente como
  infladas.** Un hash del documento de metodología sellado en el
  momento de la emisión habría anclado qué versión de la metodología
  aplicaba realmente a qué vintage, haciendo que la defensa "la
  metodología siempre fue X" fuera comparable.

- **Varias disputas sobre proyectos de regeneración inducida por
  humanos de las Unidades Australianas de Crédito de Carbono (ACCU)
  (2022–2023).** La crítica académica sobre si la regeneración era
  realmente inducida por el proyecto frente a una reversión natural
  derivó en disputas sobre lo que el proyecto había declarado
  originalmente. Las atestaciones selladas habrían proporcionado
  registros inequívocos por vintage.

- **Registros de retiro de compensaciones de carbono que han
  cambiado de estado.** Varios casos documentados de registros de
  retiro en registros de mercados voluntarios que parecen cambiar
  de estado después del retiro (siendo "retirados" por una razón
  diferente, o atribuidos a un beneficiario distinto después de los
  hechos). Los sellos por retiro habrían anclado el estado en el
  momento del retiro original.

En ninguno de estos casos el kit habría resuelto si el crédito
subyacente representaba un beneficio climático real. El kit ancla
registros; eso es todo lo que hace.

---

## Cuándo usar este kit

- Usted es un desarrollador de proyectos que quiere publicar una
  atestación evidente ante manipulación junto con su presentación
  estándar en el registro.
- Usted es un verificador externo que quiere que su opinión de
  verificación sea verificable públicamente frente a la
  representación posterior del registro de "lo que dijo el
  verificador".
- Usted es un registro que quiere proporcionar una capa adicional
  de integridad sobre los registros de emisión y retiro —
  particularmente para proyectos en jurisdicciones con respaldos de
  estado de derecho más débiles para la integridad del registro.
- Usted es un periodista, académico o ONG que realiza un análisis
  longitudinal multi-anual de proyectos de carbono y necesita un
  ancla pública para comparar las representaciones posteriores de
  un proyecto con sus bytes en el momento de la emisión.
- Usted es un comprador (cero neto corporativo, cumplimiento de
  aerolíneas) que quiere que los créditos que retira sean retirados
  frente a registros anclados públicamente, de modo que su
  reclamación comercial posterior pueda ser auditada frente a una
  línea de tiempo forense estable.

## Cuándo NO usar este kit

- **No lo use como sustituto de la verificación acreditada por
  terceros.** El sello no reemplaza la verificación ISO 14064-3;
  se compone con ella.
- **No lo use para afirmar que un proyecto es "adicional",
  "permanente" o "de baja fuga".** El sello no puede verificar
  esas propiedades. Usar el sello para afirmarlas constituye un
  mal uso.
- **No lo use como teatro de legitimidad para créditos de baja
  calidad.** Un sello criptográfico sobre un crédito de mala calidad
  es un registro forense permanente de la mala calidad, no una
  defensa de la misma. La primitiva corta en ambos sentidos; esa es
  su honestidad.
- **No lo use para sellar créditos que también están siendo
  contabilizados por un país anfitrión en su NDC** sin divulgación
  explícita del ajuste correspondiente en HECHO 06.
- **No selle antes de la verificación.** Un sello antes de que la
  opinión del verificador sea final crea un registro falso positivo
  de "verificado".
- **No lo use bajo presión para omitir una divulgación de hecho
  complementario en HECHO 07** (disputas de metodología pendientes,
  problemas de CLPI, compromisos previos del verificador). Rechace,
  y selle el rechazo.
- **No lo use como una insignia de marketing.** "Sellado por
  MYRIAM" no es una afirmación de calidad; es una propiedad
  forense. Tratarlo como una insignia de calidad es exactamente el
  mal uso que el diseño centrado en restricciones intenta prevenir.

## Cómo bifurcar este kit para una atestación real

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Sincronización crítica:** selle EN el momento o DESPUÉS del evento
oficial de emisión del registro, NO antes. Un sello previo a la
emisión crea un registro falso positivo de "emitido". Para
atestaciones de retiro, selle EN el momento del retiro. Para
atestaciones de monitoreo continuo entre la emisión y el retiro,
selle en cada ciclo de monitoreo firmado por el verificador — pero
deje claro en el HECHO 01 que la atestación es una actualización de
monitoreo, no una emisión.

## Integración con la infraestructura de carbono existente

- **Verra (VCS).** La URL de la publicación sellada o el CID de IPFS
  puede adjuntarse a la página del proyecto en VCS como documentación
  complementaria. El sello no reemplaza la verificación VCS; se
  compone con ella.
- **Gold Standard.** Mismo modelo de integración — atestación
  complementaria junto con la documentación de emisión de Gold
  Standard. El énfasis de Gold Standard en los co-beneficios + la
  documentación de beneficio comunitario se mapea naturalmente sobre
  HECHO 02 + HECHO 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Mismo modelo de integración.
- **Artículo 6.4 (mecanismo del Órgano de Supervisión del Acuerdo de
  París).** El hash de la LoA del país anfitrión en el HECHO 06 está
  específicamente diseñado para la trazabilidad de los ITMO bajo el
  Artículo 6.4 / 6.2. La divulgación del ajuste correspondiente es
  un campo regulado por la puerta de rechazo.
- **MRV del EU ETS.** Para emisores del mercado de cumplimiento, el
  hash del informe MRV se mapea al hash de la hoja de cálculo de
  cuantificación del HECHO 03. El sello se compone con — no
  reemplaza — el informe de emisiones verificado del operador.
- **Divulgación corporativa CDP (Carbon Disclosure Project).** Para
  las empresas que citan créditos retirados en presentaciones a CDP,
  el registro de retiro sellado bajo el HECHO 06 es el registro
  canónico recuperable. El lenguaje de la presentación a CDP puede
  hacer referencia a la raíz de Merkle o al CID de IPFS de la
  publicación sellada.
- **ISO 14064-2 (proyecto) / ISO 14064-3 (verificación) / ISO 14065
  (acreditación).** El sello registra la afirmación de conformidad +
  hashes; no realiza la evaluación de conformidad.
- **Principios Fundamentales de Carbono (CCP) del TSVCM / etiquetas
  ICVCM.** Cuando un proyecto ha sido evaluado contra los CCP del
  ICVCM, el hash del resultado de la evaluación puede sellarse en
  el HECHO 07 como divulgación complementaria.

## Lo que este kit NO reemplaza

- Verificación acreditada por terceros (ISO 14064-3)
- Flujos de trabajo de emisión y retiro de los registros
- Evaluación de conformidad con la metodología
- Procesos de autorización del país anfitrión para transacciones del
  Artículo 6
- Procesos MRV del mercado de cumplimiento (EU ETS, Cap-and-Trade de
  California, RGGI, etc.)
- Iniciativas de integridad del mercado voluntario (ICVCM, VCMI)
- Evaluación independiente del impacto climático

## Por qué existe este kit en v0.4.0+

Este es el séptimo ejemplo trabajado distribuido con myriam-kit. El
kit existe porque los mercados de créditos de carbono tienen una
historia bien documentada de modificación retroactiva silenciosa —
metodologías que son reinterpretadas retroactivamente, líneas base
que son revisadas retroactivamente, registros de retiro que cambian
de estado, y divulgaciones de proyectos que silenciosamente eliminan
salvedades inconvenientes con el tiempo.

El sello cierra la *estrecha* brecha de los bytes en el momento de la
atestación. No aborda — y no puede abordar — las mayores cuestiones
disputadas de adicionalidad, permanencia, fugas o autenticidad de
los co-beneficios. El encuadre honesto de esa limitación por parte
del kit es su característica más importante.

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
