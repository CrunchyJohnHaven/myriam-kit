*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de Sello de Atestación de Gasto Público

Un ejemplo llave en mano de myriam-kit para gobiernos municipales,
estatales, provinciales y nacionales que desean anclar
criptográficamente los registros de ejecución presupuestaria
(adjudicaciones de contratos, desembolsos, aceptaciones de entregables)
en el momento de su emisión, de modo que la modificación retroactiva y
silenciosa de los registros de gasto público sea públicamente detectable.

El sello es un **anclaje forense**, no una certificación de integridad.
Registra lo que la autoridad financiera reportó el día en que lo
reportó, en una forma que no puede ser revisada silenciosamente después
sin producir una discrepancia criptográfica públicamente visible.

---

## Lo que este kit NO hace (léase primero)

El sello es un sello temporal criptográfico de lo que fue atestiguado.
No puede verificar si lo atestiguado fue **lícito, justo u honesto**.
Los siguientes modos de falla están **fuera del dominio del sello**:

1. **Corrupción y comisiones ilícitas previas a la emisión.** Si una
   licitación fue amañada, un proveedor fue seleccionado a causa de un
   soborno, una justificación de fuente única fue fabricada, o un
   contrato fue inflado mediante un porcentaje de comisión ilícita
   pactado — el sello ancla la transacción tal como fue registrada, con
   el precio inflado y el proveedor favorito, con alta integridad. El
   sello observa la salida del sistema financiero; no tiene visibilidad
   alguna sobre la corrupción previa a la emisión. La *Operação Lava
   Jato* de Brasil documentó comisiones ilícitas sistemáticas de ~3 %
   administradas por un cártel en miles de contratos de Petrobras que
   habrían sido sellados en el momento de su emisión como si fueran
   completamente rutinarios.

2. **Ocultamiento mediante sociedades pantalla de la titularidad real.**
   Un contrato adjudicado a "Acme Construction Ltd." se sella con el
   nombre de la entidad registrada. Si "Acme" está en realidad
   controlada por una persona políticamente expuesta no declarada, o
   es una de docenas de sociedades pantalla controladas por un único
   cártel, el sello ancla a la entidad superficial. La transparencia de
   la titularidad real es un régimen SEPARADO (Recomendación 24 del
   GAFI, 5AMLD/6AMLD de la UE, Corporate Transparency Act de EE. UU.)
   cuya salida requiere su propio protocolo de sellado.

3. **Fraude contable previo a la emisión.** Si la propia autoridad
   financiera fabrica el registro antes de que sea sellado — contratos
   fantasma, empleados ficticios en la nómina, aceptaciones de
   entregables ficticias — el sello ancla la fabricación. El sello no
   puede detectar que el registro es falso en el momento en que se
   registra; sólo puede detectar que el registro ha sido modificado
   DESPUÉS del sellado.

4. **Publicación selectiva / "cherry-picking".** Una autoridad
   financiera podría publicar un *subconjunto* de transacciones — las
   limpias — y sellar sólo esas. El sello ancla lo que está en la
   publicación; no ancla el universo de transacciones que debió haber
   estado en la publicación. El HECHO 07 de este kit (divulgaciones
   compañeras y registro de rechazos) es la defensa estructural, pero
   depende de la honestidad de la autoridad emisora respecto a lo que
   está eligiendo no sellar.

5. **Gasto extracontable o extrapresupuestario.** El gasto público
   canalizado a través de empresas estatales, fondos soberanos de
   inversión, vehículos de propósito especial o cuentas fiduciarias
   extrapresupuestarias puede no aparecer en el presupuesto que el
   sello ancla. El sello registra lo que fue reportado dentro del
   sistema presupuestario; el gasto fuera del sistema queda fuera del
   dominio del sello. Las controversias sobre la Coalition Provisional
   Authority (CPA) en Irak en 2003–2004 involucraron aproximadamente
   USD 9 000 millones en desembolsos en efectivo cuyos registros se
   perdieron parcialmente; sellar los registros que existían en el
   momento del desembolso los habría anclado, pero no habría creado
   registros que la CPA no mantuvo.

6. **Presión de "explicación" posterior a la emisión.** Un sobrecosto
   sellado, una adjudicación por fuente única sellada o una orden de
   cambio sellada pueden ser renarrados posteriormente con cualquier
   encuadre que la autoridad política desee. El sello ancla los HECHOS
   en la fecha de emisión, pero no prejuzga la narrativa que esos
   hechos respaldarán más adelante.

7. **Atestación bajo coacción.** Si el principal financiero responsable
   es coaccionado a firmar una atestación que tergiversa transacciones,
   el sello ancla la atestación coaccionada con la firma coaccionada.
   El sello verifica QUIÉN firmó (HECHO 08), no POR QUÉ firmó. Sellar
   una atestación coaccionada produce un registro público permanente
   del producto coaccionado — útil para la rendición de cuentas
   posterior, pero no una defensa contra la coacción en el momento.

8. **Comparación entre jurisdicciones.** Un gasto sellado es legible
   sólo contra el régimen legal de su jurisdicción emisora. "¿Por qué
   el Municipio X pagó Y por el servicio Z cuando el Municipio W pagó
   sólo V?" es una pregunta de análisis comparativo posterior al
   sellado. La evaluación comparativa entre jurisdicciones es una tarea
   analítica sobre datos sellados, no una propiedad del sello.

**La sección de límites honestos anterior es la parte portante de este
kit.** Los funcionarios financieros y políticos que crean que sellar
equivale a integridad usarán este kit como escudo. El kit debe decirlo
con claridad: esta es una *primitiva de no repudio para el momento de
emisión*, no una prueba de integridad del gasto.

---

## Lo que este kit DEBE RECHAZAR sellar

El kit está configurado para rechazar los siguientes patrones de
hechos incluso si un usuario con autoridad de firma válida los presenta:

- **Nombres individuales de funcionarios públicos por debajo del nivel
  de firma principal.** Ningún hecho puede nombrar a personal
  individual de las oficinas de contratación, a empleados individuales
  de tesorería, a miembros individuales de paneles de evaluación, ni
  a ninguna persona natural que no desempeñe un rol público de
  rendición de cuentas. El riesgo de represalias para el personal de
  línea excede el beneficio de transparencia; sus identidades quedan
  selladas en los controles internos (hash del HECHO 05 del registro
  de aprobaciones), no en el cuerpo de la atestación.

- **Información personal del proveedor.** Ningún hecho puede incluir
  números de cuentas bancarias de proveedores, nombres individuales de
  empleados de proveedores, direcciones domiciliarias de proveedores,
  identificaciones tributarias de personas naturales asociadas al
  proveedor, desgloses internos de precios que contengan la estructura
  de costos del proveedor, ni ningún otro campo de información
  comercial sensible cuya publicación dañe los intereses del proveedor
  sin servir al combate de la corrupción. Tal información puede ser
  HASHEADA (HECHO 05) pero no publicada.

- **Gastos clasificados por motivos de seguridad nacional.** Los
  gastos clasificados bajo estatutos de seguridad nacional NO son
  elegibles para sellado bajo este kit. El manejo de información
  clasificada es un problema distinto con requisitos criptográficos y
  legales distintos. La exclusión en sí se divulga en el HECHO 07 R3,
  para que el lector sepa que la publicación es parcial por diseño.

- **Ejecución civil de obligaciones tributarias contra personas
  naturales identificadas.** Aunque los costos de la ejecución son
  gasto público, se rechaza nombrar a contribuyentes individuales bajo
  ejecución: el daño a la privacidad excede el beneficio de
  transparencia, y existe una transparencia paralela bajo la
  divulgación de tribunales tributarios.

- **Transacciones previas a la emisión.** Ningún contrato antes de la
  adjudicación formal; ningún desembolso antes de la emisión formal.
  Sellar un borrador de contrato o un pago pendiente como si hubiera
  sido ejecutado crea una falsa certeza.

- **Sellado por cualquiera que no sea el principal financiero
  responsable.** Un contratista, proveedor, concejal, periodista u
  observador no puede sellar "el registro del gasto público" en lugar
  de la autoridad financiera que lo emitió. (Puede sellar sus propias
  observaciones bajo su propio principal, en una publicación aparte.)

- **Formulaciones de tipo "libre de corrupción".** El kit rechaza
  sellar cualquier formulación de la forma "este gasto fue lícito y
  libre de corrupción" o "la contratación fue demostrablemente justa".
  Tales afirmaciones están epistémicamente fuera del dominio del kit.

- **Publicaciones que omitan las divulgaciones compañeras del
  HECHO 07.** Una publicación de transacciones sin el registro
  acompañante de divulgación y de rechazos no es una publicación
  MYRIAM legítima bajo este kit.

Un rechazo en sí puede ser sellado como hecho ("Esta parte solicitó
sellar X; el kit lo rechazó según la regla de rechazo Y"), creando un
registro público de intento de uso indebido. En un dominio en el que la
presión política sobre los funcionarios financieros está documentada,
un registro de solicitudes *rechazadas* es en sí una señal de
integridad.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la atestación de la ejecución presupuestaria:

1. **Aviso de ejemplo** — declara que la publicación es un ejemplo
   (las atestaciones reales eliminan o reemplazan este aviso).
2. **Jurisdicción y base legal** — qué entidad gubernamental emite,
   bajo qué autoridad estatutaria, en qué período fiscal.
3. **Referencia de apropiación o partida presupuestaria** — las
   líneas específicas del presupuesto adoptado que se están
   ejecutando, con hashes del instrumento presupuestario y de
   cualesquiera enmiendas / transferencias / reprogramaciones
   aplicadas.
4. **Manifiesto de contratos o desembolsos** — registro por
   transacción: monto, nombre de la entidad legal del proveedor (sin
   datos personales individuales), propósito, fecha, tipo de
   contratación, base de adjudicación, hash del documento contractual.
5. **Hashes de documentos de soporte** — SHA-256 de pliegos,
   evaluaciones, contratos ejecutados, órdenes de cambio, solicitudes
   de pago, formularios de aceptación de entregables, asientos del
   libro mayor de tesorería, registros de aprobación de controles.
   Sólo hashes, no contenidos — para proteger información comercial y
   personal sensible al tiempo que se permite la verificación por
   re-hash.
6. **Estado de auditoría y supervisión** — qué órgano de inspección
   general tiene jurisdicción, qué institución superior de auditoría,
   qué órgano fiscal tiene jurisdicción sobre los delitos de
   corrupción, plazos de auditoría, estado actual de cualquier
   revisión en curso.
7. **Divulgaciones compañeras y registro de rechazos** — protestas
   de contratación pendientes, investigaciones internas pendientes,
   solicitudes de acceso a la información pendientes, revisiones
   disidentes, sobrecostos conocidos en líneas presupuestarias; lista
   explícita de los patrones que el kit rechazó sellar.
8. **Principal firmante** — funcionario financiero responsable + rol
   + rendición de cuentas estatutaria + cofirmantes bajo control
   dual; qué atestigua y qué NO atestigua personalmente cada firmante.

Cada hecho termina con la convención de la compuerta de rechazo:
*"Este hecho afirma sólo X. No afirma Y"* (donde Y es el modo de falla
más cercano de la sección "NO hace").

---

## Contra qué defiende este kit

- **Revisión silenciosa, posterior a la emisión, de montos
  contractuales.** Cualquier cambio en cualquier monto del HECHO 04
  produce un SHA-256 distinto, una raíz de Merkle distinta, y falla la
  verificación OTS.
- **Sustitución silenciosa de proveedor.** Reemplazar al "Proveedor A"
  por el "Proveedor B" en un contrato ya emitido es detectable a
  partir de los bytes sellados.
- **Antedatado de órdenes de cambio.** El HECHO 04 congela la fecha y
  la justificación de la orden de cambio en la emisión; cualquier
  afirmación posterior de que "este siempre fue el alcance acordado"
  debe contender con el registro sellado de la orden de cambio.
- **Desaparición silenciosa de transacciones desfavorables.** Todas
  las transacciones emitidas en el período están en el HECHO 04 bajo
  una única raíz de Merkle. Publicar un subconjunto es detectable a
  partir de la lista de hashes de hojas.
- **Supresión de divulgaciones compañeras.** El HECHO 07 congela el
  estado de las protestas pendientes, las investigaciones pendientes
  y las solicitudes de acceso a la información pendientes en el
  momento de la atestación. Cualquier afirmación posterior de "nunca
  oímos hablar de esa protesta" es públicamente diffable.
- **Desplazamiento de la jurisdicción de auditoría.** El HECHO 06
  congela qué órganos tienen jurisdicción de supervisión sobre las
  transacciones selladas. Una afirmación posterior de que un
  inspector general particular "no tenía autoridad" debe contender
  con el registro sellado de jurisdicción.
- **Borrado del registro de rechazos.** El HECHO 07 registra lo que
  el kit rechazó sellar; cualquier afirmación posterior de "nunca
  rechazamos nada" contradice el registro sellado.

---

## Casos históricos en los que el kit habría ayudado

El kit habría producido un **anclaje forense** útil — *no una
solución, no una prevención, no un sustituto del enjuiciamiento
penal* — en casos del registro público documentado que involucraron
modificación retroactiva silenciosa de registros de gasto público:

- **Brasil — *Operação Lava Jato* / linaje Petrobras (2014–2021).**
  Los fiscales federales brasileños documentaron un cártel de grandes
  empresas de construcción que durante más de una década pagó
  comisiones ilícitas con un promedio de ~3 % sobre contratos de
  Petrobras y otros contratos federales de infraestructura, con la
  comisión ilícita encauzada hacia políticos y hacia la propia
  coordinación de precios del cártel. Los contratos, tal como fueron
  emitidos, parecían rutinarios; la corrupción era previa a la
  emisión. Un kit de sellado NO habría evitado Lava Jato (las
  comisiones ilícitas estaban embebidas en el precio ANTES de que el
  contrato llegara al sello), pero habría anclado los términos del
  contrato en la emisión — haciendo que la posterior reconstrucción
  forense de "lo que cada contrato decía realmente cuando se firmó"
  fuera enormemente más barata. El costo de la investigación de Lava
  Jato fue en gran parte el costo de re-ensamblar líneas temporales a
  partir de archivos inconsistentes.

- **Unión Europea — controversias sobre fondos de desarrollo
  regional (varios Estados miembros, década de 2010 y de 2020).**
  Los informes anuales del Tribunal de Cuentas Europeo han
  identificado repetidamente tasas de error material en los gastos
  del Fondo Estructural y de Inversión Europeo (ESIF) y del Fondo
  de Cohesión, en algunos años por encima del umbral de
  materialidad. Las disputas sobre "lo que se reclamó realmente"
  frente a "lo que se entregó realmente" se repiten porque la
  documentación de las reclamaciones puede ser revisada entre la
  presentación y la auditoría. El sellado MYRIAM por emisión de la
  reclamación-tal-como-fue-presentada habría anclado el contenido de
  cada reclamación en el momento de su presentación, separando "lo
  que el beneficiario reclamó en el momento" de "lo que concluyó la
  reconstrucción posterior a la auditoría".

- **Irak — desembolsos de la Coalition Provisional Authority (CPA),
  2003–2004.** La CPA desembolsó aproximadamente USD 9 000 millones
  en efectivo del Fondo de Desarrollo para Irak con una documentación
  que el Special Inspector General for Iraq Reconstruction (SIGIR) y
  los informes de auditoría posteriores caracterizaron como
  sustancialmente incompleta. Las disputas sobre los registros de
  desembolso persisten dos décadas después. El sellado en el momento
  del desembolso no habría creado registros que la CPA no mantuvo —
  pero allí donde existiera algún registro (libros mayores
  manuscritos, autorizaciones de transferencia fechadas), un sello
  contemporáneo habría anclado el estado byte a byte de ese registro
  en el momento de su emisión, separando "el registro en el momento"
  del "registro tal como fue reconstruido posteriormente".

- **Grecia — revisiones de deuda soberana y de información sobre
  gasto público (2009–2010).** Las auditorías de Eurostat en
  2009–2010 documentaron revisiones sustanciales a los datos
  fiscales griegos previamente reportados, con la metodología de la
  revisión en sí misma cuestionada. El sellado de los informes
  trimestrales de gasto en el momento de la publicación original
  habría hecho que el *delta* entre los informes original y revisado
  fuera públicamente diffable, en lugar de reconstruible sólo
  mediante la comparación de archivos. El sello no habría evitado
  la disputa metodológica subyacente, pero habría anclado cada
  trimestre reportado en el momento del informe original.

- **Reino Unido — contratación de pandemia (2020–2022).** Los
  informes de la UK National Audit Office y de los comités
  parlamentarios identificaron procesos de contratación durante
  2020–2021 en los que se adjudicaron contratos bajo disposiciones
  de emergencia con competencia reducida y documentación reducida;
  algunas adjudicaciones fueron modificadas, canceladas o
  finiquitadas posteriormente. El sellado por emisión de cada
  adjudicación de contratación de emergencia habría anclado la
  justificación y los términos de la adjudicación en el momento de
  la adjudicación, haciendo que las modificaciones posteriores
  fueran un delta públicamente visible en lugar de un registro
  modificado silenciosamente.

- **Sudáfrica — contratos de empresas públicas en la era de la
  captura del Estado (~2010–2018).** La Zondo Commission documentó
  contratos en varias empresas estatales (Eskom, Transnet, Denel)
  cuya documentación fue, en diversos casos, incompleta, revisada o
  controvertida. El sellado de cada adjudicación de contrato en la
  emisión habría anclado el estado tal-como-fue-adjudicado del
  registro, separando los productos posteriores de la reconstrucción
  forense del registro contemporáneo.

El kit NO habría evitado la corrupción subyacente en ninguno de los
casos anteriores. En varios casos, el problema subyacente era que la
corrupción era *previa a la emisión* — el sello ancla el contrato
corrupto con alta integridad, lo cual es un tipo distinto de utilidad
(anclaje forense para la rendición de cuentas posterior) pero no es lo
mismo que prevención. En otros casos (efectivo de la CPA, gasto fuera
del presupuesto), el problema subyacente era que los registros que se
estaban sellando no existían o no se mantenían — el kit no puede crear
registros que la autoridad no produjo.

Estos casos históricos se nombran sólo en referencia a hallazgos
públicamente documentados (registros judiciales, informes de comités
parlamentarios, publicaciones de órganos de auditoría). No se hace
ninguna afirmación sobre persona individual alguna; los hallazgos
institucionales documentados se sostienen sobre el registro público.

---

## Cuándo usar este kit

- Su jurisdicción tiene un proceso establecido de reporte de
  ejecución presupuestaria y desea agregar un anclaje público
  inmutable.
- Espera escrutinio posterior a la emisión (solicitudes de acceso a
  la información, auditoría, monitoreo de la sociedad civil,
  investigación periodística) y desea un punto de referencia con
  manipulación detectable.
- Tiene autoridad legal bajo la legislación de transparencia /
  registros abiertos para publicar el conjunto de hechos listado,
  con las exclusiones de privacidad / seguridad respetadas.
- Opera bajo un régimen estatutario de auditoría (inspector general,
  institución superior de auditoría) y desea anclar cada cierre
  trimestral antes de que el ciclo de auditoría lo alcance.
- Publica bajo el Open Contracting Data Standard o IATI y desea un
  complemento criptográfico a la publicación basada en portales.

## Cuándo NO usar este kit

- **No lo use como sustituto de la auditoría estatutaria, la
  revisión por el inspector general, la investigación fiscal o el
  monitoreo de la sociedad civil.** El kit es *aditivo*, no un
  reemplazo.
- **No lo use como certificado de legitimidad.** Un registro de
  gasto sellado no es un certificado de ausencia de corrupción.
  Tratarlo como tal es exactamente el modo de falla que la
  estructura primero-restricciones del kit existe para evitar.
- **No lo use a mitad de período.** El kit es para el momento de la
  emisión formal (cierre trimestral, adjudicación de contrato,
  desembolso por hitos). Los sellos a mitad de período crean puntos
  de referencia engañosos.
- **No lo use para afirmar que el gasto fue lícito, justo o no
  corrupto** — el kit no puede hacer eso.
- **No lo use para sellar gastos clasificados, información personal
  individual de empleados o información comercial sensible de
  proveedores.** El kit rechaza estos patrones; intentarlo crea un
  registro de rechazo (HECHO 07).
- **No lo use para sellar borradores previos a la emisión.** Los
  borradores pueden ser sellados bajo un tipo de atestación distinto
  ("borrador para comentarios, no emitido"), pero no bajo el tipo
  de emisión de este kit.
- **No lo use bajo presión para omitir las divulgaciones del
  HECHO 07.** Rechace, y selle el rechazo.
- **No lo use si su autoridad financiera está capturada.** Un gasto
  fraudulento sellado es un registro público permanente del fraude,
  no una defensa del mismo. La primitiva corta en ambos sentidos;
  esa es su honestidad.

---

## Cómo forkear este kit para una atestación real

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Tiempo crítico:** selle EN el momento de la emisión formal — es
decir, el momento en que el principal financiero responsable firma el
cierre trimestral, el momento en que un contrato es formalmente
adjudicado, o el momento en que un desembolso es formalmente emitido.
Un sello anterior a la emisión formal crea una referencia falsa
positiva de "este es el registro oficial". Un sello muy posterior a
la emisión formal es forensemente más débil frente a modificaciones
intermedias.

**Cadencia:** el kit está diseñado para atestaciones trimestrales
por defecto. Las cadencias inferiores al trimestre (cierre mensual,
sellado por transacción) se soportan re-ejecutándolo con el alcance
apropiado; el sello de una única transacción de alto valor es un uso
legítimo.

---

## Integración con la infraestructura existente de finanzas públicas

El kit está diseñado para componerse con, no para reemplazar:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Los cinco puntos
  de publicación (planificación, licitación, adjudicación, contrato,
  ejecución) mapean naturalmente sobre el HECHO 03 (planificación →
  apropiación), el HECHO 04 (licitación, adjudicación, contrato,
  ejecución → manifiesto de transacciones) y el HECHO 05 (hashes de
  documentos de soporte). La exportación JSON del OCDS en sí se
  sella en el HECHO 05 (documentos de control). Una jurisdicción que
  ejecute publicación OCDS puede añadir el sellado MYRIAM como capa
  criptográfica sobre su portal existente.

- **International Aid Transparency Initiative (IATI) estándar v2.03.**
  Para gastos financiados total o parcialmente por ayuda externa, el
  XML de IATI puede ser sellado como documento de control; el sello
  proporciona un complemento criptográfico al modelo de publicación
  basado en HTTP del IATI Registry.

- **Compromisos de la Open Government Partnership (OGP).** Los
  Planes de Acción Nacional de la OGP suelen incluir compromisos de
  transparencia fiscal; el sellado MYRIAM operacionaliza un
  compromiso de "publicación con manipulación detectable" de un
  modo que es verificable de forma independiente por la sociedad
  civil sin requerir confianza en el portal del gobierno.

- **Recomendación de la OCDE sobre Integridad Pública (2017).** El
  kit apoya la Recomendación 4 (datos abiertos de gobierno sobre
  finanzas públicas, en forma legible por máquina y oportuna) al
  hacer que los datos estén criptográficamente anclados además de
  ser legibles por máquina.

- **Convención de las Naciones Unidas contra la Corrupción (UNCAC),
  particularmente los Artículos 9 (contratación pública) y 13
  (participación de la sociedad).** El kit proporciona una primitiva
  forense que apoya las obligaciones de transparencia del Artículo 9
  y la supervisión de la sociedad civil del Artículo 13.

- **Instituciones Superiores de Auditoría (EFS) — marco INTOSAI.**
  Las EFS que operan bajo los estándares de INTOSAI (ISSAI) pueden
  consumir publicaciones selladas como evidencia con alta integridad;
  los hashes SHA-256 del HECHO 05 son los mismos hashes que las
  herramientas de e-auditoría de la EFS pueden recomputar.

- **Oficinas de inspectores generales.** Las oficinas domésticas de
  inspector general con jurisdicción sobre los gastos sellados
  (HECHO 06) pueden citar los cuerpos de los documentos cuyos hashes
  están sellados en el HECHO 05; el sello ata los cuerpos de los
  documentos recibidos bajo citación a los cuerpos que existían en la
  emisión.

- **Estatutos de libertad de información y registros abiertos.** El
  sello no exime a la autoridad emisora de obligaciones continuas de
  acceso a la información; de hecho, hace que la respuesta selectiva
  a una solicitud sea detectable como una desviación del registro
  sellado. El HECHO 07 C3 ancla las solicitudes de acceso pendientes
  en el momento de la atestación.

- **Registros de titularidad real (Recomendación 24 del GAFI,
  directivas AML de la UE, Corporate Transparency Act de EE. UU.).**
  Los datos de titularidad real NO se sellan bajo este kit (el
  HECHO 04 toma la identidad del proveedor sólo del nombre de la
  entidad legal registrada). La divulgación de la titularidad real
  es un régimen de sellado separado que puede producir una
  publicación paralela referenciada por raíz de Merkle.

- **Transparencia administrada por tribunales (informes sobre
  gasto judicial, procedimientos de recuperación de activos).** Las
  salidas de los procedimientos judiciales relacionados con
  corrupción no caen dentro del alcance de este kit pero pueden ser
  selladas bajo tipos de atestación paralelos.

## Lo que este kit NO reemplaza

- La auditoría estatutaria de ejecución presupuestaria por los
  órganos de inspector general
- La revisión por la institución superior de auditoría (GAO, NAO,
  TCU, CAG, AGN, BRH, Cour des comptes, equivalente)
- La investigación fiscal de los delitos de corrupción (fiscales
  nacionales anticorrupción, órganos del Artículo 36 de la UNCAC)
- La sociedad civil y el periodismo de investigación
- Los canales de denunciantes y los regímenes de divulgación
  protegida
- La divulgación de titularidad real
- La revisión por pares internacional (OCDE, Evaluación de
  Transparencia Fiscal del FMI, semestre europeo, IATI Registry)
- Los procedimientos de recuperación de activos administrados por
  tribunales

El sello es una primitiva forense que reduce el costo y aumenta la
fiabilidad de todo lo anterior. No es, y no puede ser, un reemplazo
de ninguna de esas instancias.

---

## Licencia

Dominio público (CC0). Bifúrquelo. Sin atribución requerida.
