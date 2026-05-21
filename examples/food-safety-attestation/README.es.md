*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de atestación de seguridad alimentaria

Un ejemplo llave en mano de myriam-kit para fabricantes de productos
alimentarios, inspectores de seguridad alimentaria, certificadores
de tercera parte y autoridades reguladoras que deseen publicar un
sello anclado en Bitcoin y con evidencia de manipulación, que atestigüe
*lo que dijeron las pruebas de liberación* y *qué decisión de liberación
se tomó*, en el momento de la liberación del lote o de la firma del
informe de inspección — de modo que cualquier modificación silenciosa
posterior a la liberación del expediente de pruebas, de la decisión
de liberación o de los compromisos de retiro del mercado resulte
detectable públicamente.

---

## Lo que este kit NO hace (léase primero)

El sello es una marca de tiempo criptográfica de QUÉ pruebas de
liberación se realizaron sobre QUÉ lote, por QUÉ laboratorios
acreditados, conforme a QUÉ métodos, con QUÉ resultados, y QUÉ
DECISIÓN DE LIBERACIÓN tomó la autoridad de aseguramiento de la
calidad sobre la base de esos resultados. No puede responder a
ninguna pregunta sobre seguridad alimentaria más allá de eso. Lo
siguiente queda **fuera del dominio del sello**:

1. **Prevenir la contaminación.** El kit ancla lo que los resultados
   de las pruebas DIJERON en la liberación. La contaminación tiene
   muchas causas — distribución microbiana heterogénea dentro de un
   lote, abuso de temperatura post-liberación en la distribución,
   fallos de manipulación en el comercio minorista, fallos de
   preparación por parte del consumidor, peligros nuevos o no
   incluidos en el cribado (por ejemplo, adulteración con melamina
   antes de que el cribado de melamina fuera rutinario), fraude en
   la cadena de suministro aguas arriba del alcance de las pruebas
   del fabricante. El sello no previene ninguno de ellos y no
   pretende hacerlo.

2. **Garantizar que todas las unidades de un lote conforme son
   seguras.** La contaminación microbiológica en el producto
   alimentario a granel es HETEROGÉNEA. Listeria, Salmonella y los
   patógenos STEC aparecen en focos localizados de baja prevalencia,
   no distribuidos uniformemente. Los planes de muestreo de la
   ICMSF y del Codex tienen una probabilidad documentada y acotada
   de detectar contaminación presente a baja prevalencia — la
   probabilidad NO es 1. Un lote que supera el muestreo de
   liberación puede aún contener unidades contaminadas que no
   fueron muestreadas. El sello ancla las MUESTRAS, no el material
   a granel. Esta restricción se reafirma explícitamente en el
   FACT 03 y constituye el límite honesto más importante de este
   kit.

3. **Certificar que las pruebas de liberación se ejecutaron con
   honestidad.** El sello ancla lo que las pruebas reportaron en la
   liberación. Un laboratorio que reporta un PASS fraudulento en la
   liberación produce un sello criptográficamente válido de un PASS
   fraudulento. El kit hace detectable cualquier modificación
   silenciosa posterior, pero no detecta el fraude contemporáneo.
   La detección de fraude contemporáneo requiere auditoría,
   supervisión de la acreditación de laboratorios (vigilancia ISO
   17025), programas de ensayos de aptitud e inspección del
   regulador — todo lo cual queda aguas arriba del sello.

4. **Sustituir las presentaciones reguladoras de la FSMA, el FSIS o
   las autoridades competentes de la UE.** Los expedientes de
   liberación bajo la FSMA, el FSIS, el Reglamento (CE) 178/2002 de
   la UE y el Codex Alimentarius se mantienen conforme a la ley y
   se entregan a requerimiento del regulador. El sello añade una
   capa pública con evidencia de manipulación POR ENCIMA de esas
   presentaciones; NO las reemplaza. Una publicación sellada no es
   una presentación regulatoria.

5. **Resolver disputas sobre el alcance de un retiro del mercado.**
   El kit puede sellar los compromisos de retiro tomados en la
   liberación (FACT 06) y un alcance de retiro posterior como
   publicación nueva; pero la frontera de qué lotes están afectados,
   qué unidades se expidieron, qué minoristas las recibieron y qué
   consumidores quedaron expuestos sigue siendo una investigación
   de trazabilidad ascendente y descendente. El sello ancla lo que
   el fabricante SE COMPROMETIÓ a hacer y lo que efectivamente
   HIZO después. No resuelve la cuestión epidemiológica subyacente.

6. **Detectar el fraude deliberado en la cadena de suministro
   aguas arriba de las pruebas.** La adulteración con melamina de
   la leche y las fórmulas infantiles en China en 2008 prosperó
   porque la melamina no figuraba en el panel de analitos — sí
   figuraba la medición de equivalente-proteínico por contenido de
   nitrógeno, y la melamina la engañaba. Un FACT 03 sellado con el
   panel de analitos vigente en su momento habría comprometido
   públicamente a ese panel — pero no habría hecho nada para
   detectar el adulterante fuera del panel. El valor del sello en
   ese caso habría sido el anclaje forense de «esto es lo que el
   fabricante afirmaba probar», NO la prevención. Un régimen real
   de seguridad alimentaria atiende esto mediante muestreo
   regulador sin previo aviso con cribado de amplio espectro
   (métodos LC-MS no dirigidos, por ejemplo), aguas arriba del
   sello del fabricante.

7. **Anclar la distribución post-liberación y la manipulación por
   parte del consumidor.** Una vez que el lote sale de las
   instalaciones, el abuso de temperatura durante la distribución,
   la mala manipulación en el comercio minorista, los fallos de
   almacenamiento en el hogar del consumidor y los errores de
   preparación del consumidor quedan fuera de alcance. El sello se
   circunscribe al evento de liberación del fabricante. La
   evidencia de manipulación aguas abajo requiere kits separados a
   nivel del distribuidor, del minorista y (para consumidores
   institucionales como escuelas y hospitales) del punto de uso.

8. **Avalar la seguridad del alimento para una población
   específica.** Un resultado PASS del FACT 03 no implica seguridad
   para consumidoras embarazadas, lactantes, consumidores
   inmunocomprometidos o personas mayores, en quienes Listeria
   monocytogenes y Salmonella presentan un riesgo elevado
   documentado incluso a concentraciones inferiores a los límites
   convencionales de detección. El sello no puede formular una
   afirmación de seguridad específica para una población y se niega
   a hacerlo (regla de rechazo R6).

**La sección de límites honestos anterior es la parte portante de
este kit.** Los fabricantes que tratan «sellamos nuestro expediente
de liberación» como equivalente a «probamos que nuestro alimento es
seguro» hacen un mal uso de la primitiva. El kit debe decirlo con
claridad: *se trata de una primitiva de no-repudio para las
afirmaciones contemporáneas del fabricante en la liberación, no de
una prueba de seguridad, no de un sustituto de la supervisión
regulatoria, y no de una defensa contra los modos de falla —
contaminación heterogénea, fraude en la cadena de suministro o mala
manipulación post-liberación — que han causado víctimas mortales en
brotes pasados.*

---

## Lo que este kit DEBE RECHAZAR sellar

El kit está configurado para rechazar los siguientes patrones de
hechos incluso si los presenta un usuario con autoridad de firma
del fabricante válida:

- **Identificación personal de cualquier trabajador, supervisor,
  personal de QA, inspector visitante o auditor de tercera parte.**
  Nombres, identificadores de empleado, números de credencial,
  números de seguridad social, domicilios particulares, números de
  teléfono personales — ninguno de estos aparece en el sello
  público. Los roles son públicos; los vínculos persona-rol se
  sellan por separado y son obtenibles por proceso regulatorio. La
  seguridad de los trabajadores frente a represalias y acoso es la
  restricción portante; la atestación de seguridad alimentaria
  puede hacerse a nivel de rol. (R1)

- **Localización precisa de las instalaciones.** La región de la
  instalación (estado o región multiestado) es aceptable; la
  dirección postal precisa, las coordenadas GPS o cualquier
  identificador con granularidad suficiente para localizar
  físicamente la planta en un mapa NO son aceptables. El número de
  establecimiento regulatorio es el identificador del regulador
  para la instalación; consideraciones de seguridad física y
  seguridad de los trabajadores aconsejan no publicar una
  dirección pública en Bitcoin. (R2)

- **Patrones de personal y turnos individuales de producción.**
  Horarios de turnos, rotaciones individuales de trabajadores,
  identificadores personales de operarios de línea — ninguno
  aparece en el sello. El patrón de vida de los trabajadores
  individuales no debe poder derivarse de la atestación pública.
  (R3)

- **Identidades de proveedores que comprometan contratos.** Los
  nombres de proveedores, las ubicaciones de las instalaciones de
  los proveedores y los códigos de lote de proveedor (salvo en el
  caso de contaminación originada por la cadena de suministro,
  donde nombrar el lote contaminado de un proveedor es necesario
  por salud pública y se maneja mediante una publicación sellada
  separada) NO se publican en el sello de liberación. Muchos
  contratos de suministro contienen cláusulas de confidencialidad;
  el sello no las vulnera por defecto. (R4)

- **Listas de clientes y destinos de distribución más allá del
  nivel agregado.** Un resumen regional de alto nivel es
  aceptable; las listas de clientes específicas (minoristas,
  centros de distribución, cuentas de food service) NO lo son. La
  identidad del cliente es contractualmente confidencial y
  competitivamente sensible; el regulador obtiene la lista de
  clientes por los canales establecidos de coordinación de retiro.
  (R5)

- **Afirmaciones de seguridad o conclusiones jurídicas.** El kit no
  sellará «este producto es seguro», «este lote cumple todas las
  normas aplicables de seguridad alimentaria», «esto es GRAS para
  este uso», ni ninguna otra conclusión de seguridad o jurídica.
  El kit ancla el expediente de pruebas y la decisión de
  liberación, NO una conclusión de seguridad. (R6)

- **Patrones de re-identificación de quejas de trabajadores o de
  denunciantes (whistleblowers).** El kit se niega a publicar
  cualquier patrón que pudiera re-identificar a un trabajador que
  haya presentado una queja ante OSHA, USDA o internamente en la
  empresa sobre prácticas de seguridad alimentaria o seguridad en
  el trabajo. Esos denunciantes están protegidos por el artículo
  402 de la FSMA y leyes paralelas; el sello no debe convertirse
  en un vector de re-identificación. Las atestaciones de
  denunciantes tienen su propio kit
  (`examples/whistleblower-manifest`) con reglas de rechazo
  ajustadas a ese caso de uso. (R7)

- **Sellado por cualquier parte que no sea el mandatario
  autorizado del fabricante que libera.** Un certificador de
  tercera parte, un equipo de QA de cliente o un auditor
  independiente pueden usar el mismo kit para sellar SUS PROPIOS
  hallazgos de auditoría; NO pueden sellar la decisión original de
  liberación bajo el nombre del fabricante. El mandatario
  firmante en el FACT 08 es el único firmante válido para eso. (R8)

Un rechazo en sí mismo puede sellarse como un hecho («Este
fabricante solicitó sellar X; el kit lo rechazó conforme a la regla
de rechazo Y»), creando un registro público del intento de mal uso.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la liberación:

1. **Aviso de ejemplo** — declara que la publicación es un ejemplo
   (las atestaciones reales eliminan o reemplazan esto).
2. **Identificación del producto y del lote** — nombre del producto,
   categoría, fabricante, región de la instalación (NO la
   localización precisa), versión + hash del plan HACCP,
   identificador de lote, fechas de producción / envasado /
   caducidad, número de unidades de consumo, requisitos de
   almacenamiento, los tres puntos críticos de control con hashes
   de los registros (letalidad de cocción, estabilización por
   enfriamiento, entorno post-letalidad RTE).
3. **Resultados de pruebas de liberación** — pruebas microbiológicas
   en producto terminado (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), pruebas químicas / de residuos (nitritos,
   residuos veterinarios, metales pesados), verificación de
   contaminación cruzada por alérgenos, resumen de monitoreo
   ambiental, cada una con el SHA-256 del PDF completo del informe
   y la restricción explícita de interpretación muestra-vs-granel.
4. **Metodología y cualificación del laboratorio** — qué método (y
   qué versión del documento de método) se utilizó por línea, qué
   laboratorios realizaron qué pruebas, el estado de acreditación
   ISO/IEC 17025:2017 de cada laboratorio y el hash de su
   certificado, los resultados recientes de ensayos de aptitud,
   declaración de independencia, registro de desviaciones /
   reanálisis / OOS para este lote.
5. **Decisión de liberación** — fecha de liberación, autoridad de
   liberación a nivel de rol + firma de contraste, resumen del
   expediente que respalda la decisión, destinos de distribución a
   alto nivel, obligaciones post-liberación reconocidas en la
   liberación, compromiso de calendario e irreversibilidad.
6. **Compromisos de retiro y vigilancia post-comercialización** —
   el análogo alimentario de la farmacovigilancia: transparencia
   de la señal de enfermedad, compromisos de ejecución del retiro
   (umbrales de 24 h / 72 h / 98 %), respuesta ante contaminación
   de la cadena de suministro, compromiso de no reanalizar en
   silencio, compromiso de no realizar cambios post-hoc en las
   especificaciones, compartición de señales agregadas de
   seguridad.
7. **Divulgaciones acompañantes y registro de rechazos** — hash
   del registro de investigación de acciones correctivas,
   historial reciente de inspecciones, historial de retiros,
   incidencias conocidas abiertas en los métodos de prueba
   empleados, vínculo rol-a-individuo (sellado por separado,
   hasheado aquí), preparación para trazabilidad de proveedores,
   lista explícita de las reglas de rechazo R1-R8 con los rechazos
   ejercidos durante esta liberación.
8. **Mandatario firmante** — fabricante + firmante a nivel de rol
   (Director/a de QA) + firma de contraste a nivel de rol
   (Gerente/a de planta) + información criptográfica de clave;
   justificación de la publicación a nivel de rol.

Cada hecho termina con la convención de la compuerta de rechazo:
*«Este hecho afirma solamente X. No afirma Y»* (donde Y es el modo
de falla más cercano de la sección «NO hace» anterior).

---

## Contra qué se defiende este kit

- **Modificación retroactiva silenciosa de los resultados de las
  pruebas de liberación.** Todos los PDF de informes de prueba
  están hasheados. Volver a hashear después de la liberación
  revela cualquier modificación.
- **Disputas sobre qué métodos, qué versiones de documentos de
  método y qué laboratorios se utilizaron.** El FACT 04 congela la
  metodología y el estado de acreditación del laboratorio en la
  liberación. Las afirmaciones posteriores del tipo «en realidad
  usamos MLG 4.13, no 4.12» son refutables públicamente.
- **Re-especificación retroactiva de un lote fuera de
  especificación.** Si un resultado de prueba de liberación fue en
  realidad un PASS limítrofe que se reclasifica como FAIL tras la
  liberación, los hashes sellados de los informes prueban lo que
  decía el PDF del resultado original. Simétricamente, un OOS
  limítrofe silenciosamente reanalizado en un PASS sin divulgación
  es detectable si el compromiso de no reanalizar en silencio del
  FACT 06 se compara más tarde con una enmienda no sellada.
- **Reducción silenciosa del alcance de un retiro.** Los
  compromisos de retiro del FACT 06 (notificación en 24 h,
  inicio en 72 h, recuperabilidad del 98 %) están sellados; el
  incumplimiento es observable públicamente.
- **Re-narración a posteriori del historial de acciones
  correctivas.** El hash del registro de acciones correctivas del
  FACT 07 congela lo que la empresa DIJO que hizo tras el
  presunto positivo del programa de monitoreo ambiental; las
  afirmaciones posteriores del tipo «hicimos más / menos que eso»
  son refutables públicamente.
- **Omisión selectiva de divulgaciones acompañantes.** El FACT 07
  enumera las categorías de divulgación esperadas (historial de
  inspecciones, historial de retiros, revisión de avisos sobre
  métodos, preparación para trazabilidad); una categoría vacía
  debe atestiguarse explícitamente («ninguna en el momento de la
  liberación»), de modo que un posterior «no nos dimos cuenta de
  que eso era relevante» sea refutable públicamente.
- **Sustitución del estado de acreditación de otro laboratorio.**
  El FACT 04 congela el alcance ISO 17025 y el hash del
  certificado de cada laboratorio en la liberación; una
  sustitución posterior por un laboratorio no acreditado es
  detectable públicamente.

El kit **no** defiende contra la corrupción contemporánea — un
equipo que intencionalmente sella resultados de prueba falsos en el
momento de la liberación produce un sello criptográficamente válido
de resultados de prueba falsos. La primitiva es honesta sobre esto:
es una primitiva de no-repudio para las afirmaciones contemporáneas
del fabricante, no una prueba de que esas afirmaciones sean
correctas.

---

## Precedentes históricos de mortalidad

El kit habría producido un anclaje útil — *no una resolución* — en
los fallos pasados de seguridad alimentaria. Para evitar difamar a
personas concretas (la mayoría de los fallos de seguridad
alimentaria son corporativos, no individuales; algunos se
judicializan penalmente y otros no), estas referencias describen el
brote por año y patógeno, y nombran la entidad implicada sólo
cuando la contaminación fue atribuida públicamente por aviso de
retiro o por sentencia.

- **Adulteración con melamina de fórmula infantil y lácteos en
  China en 2008 (Sanlu Group y otros).** Al menos seis muertes de
  lactantes y aproximadamente 300 000 enfermedades atribuibles a
  productos lácteos adulterados con melamina, diseñados para
  inflar fraudulentamente el contenido aparente de proteína en
  ensayos basados en nitrógeno por Kjeldahl. Hubo condenas en
  tribunales de la RPC, incluidas sentencias capitales. *El sello
  no habría prevenido este caso* — la melamina estaba fuera del
  panel estándar de analitos. El sello habría comprometido
  públicamente al panel TAL como estaba, haciendo
  forensicamente claro el alcance de la ampliación post-incidente
  del cribado de rutina.

- **Brote europeo de STEC O104:H4 en 2011 (germinados de fenogreco
  rastreados hasta una granja alemana).** 53 muertes y unas 3 950
  enfermedades en múltiples países europeos; finalmente rastreado
  hasta semillas de fenogreco importadas de Egipto y germinadas
  en un productor alemán. La trazabilidad se vio dificultada por
  la documentación inconsistente a nivel de lote a lo largo de la
  cadena de suministro multinacional. *El sello no habría
  prevenido la contaminación del lote de semillas* (la
  contaminación era aguas arriba de las pruebas del germinador);
  habría anclado lo que las pruebas de liberación del germinador
  afirmaban y, si se hubiera utilizado a nivel del importador de
  semillas, lo que afirmaba la manipulación de la semilla
  importada, haciendo la trazabilidad más rápida.

- **Brote de Listeria monocytogenes en Blue Bell Creameries en
  2015 (Estados Unidos).** 3 muertes, 10 enfermedades en varios
  estados; condujo a un retiro nacional y a una condena penal
  federal en 2020 de Blue Bell por cargos menores de seguridad
  alimentaria, con la empresa firmando un acuerdo de enjuiciamiento
  diferido y pagando 19,35 millones de dólares. Litigios civiles
  posteriores. *El sello no habría prevenido* la contaminación
  ambiental por Listeria en planta; habría anclado forensicamente
  los registros del programa de monitoreo ambiental, haciendo que
  cualquier pregunta post-incidente sobre «qué mostró el monitoreo
  ambiental en los meses previos al brote» pudiera responderse
  contra un registro con marca de tiempo y evidencia de
  manipulación, en lugar de contra documentos producidos
  ulteriormente.

- **Brotes multiestatales de STEC O157:H7 vinculados a lechuga
  romana en 2018 (región de cultivo de Yuma, luego región de
  cultivo de Salinas).** Al menos 5 muertes y unas 210
  enfermedades a lo largo de los brotes de ese año. La
  trazabilidad se complicó por producto en bolsa de origen mixto.
  *El sello no habría prevenido* la contaminación a nivel de
  campo / agua de riego (aguas arriba del fabricante); habría
  anclado forensicamente el expediente de pruebas de admisión y
  de liberación de cada procesador, haciendo la trazabilidad más
  rápida y el registro público más defendible criptográficamente
  frente a disputas posteriores.

- **Brote de Salmonella Typhimurium de Peanut Corporation of
  America (2008-2009, Estados Unidos).** 9 muertes,
  aproximadamente 714 enfermedades; condujo a condenas penales
  federales en 2014-2015 de directivos de PCA, incluida una pena
  de 28 años de cárcel para el CEO por conspiración y obstrucción.
  *El sello no habría prevenido* la contaminación, la
  infrainvestigación de pruebas positivas de Salmonella en planta
  ni la decisión a nivel ejecutivo de despachar producto en
  contra de esos hallazgos positivos. SÍ habría dejado
  forensicamente claro, en juicio, lo que los resultados de
  prueba DIJERON en el momento en que se generaron — haciendo el
  caso de la fiscalía contra los correos contemporáneos con
  narrativa falsa sustancialmente más anclado frente a la
  modificación documental.

En cada uno de estos casos, el kit habría aportado una cronología
forense más limpia. En ninguno de ellos el kit por sí solo habría
prevenido las muertes. El sello es infraestructura forense, no
infraestructura de prevención. Esa distinción es la honestidad del
kit.

---

## Cuándo usar este kit

- Su operación de fabricación cuenta con un programa HACCP /
  Controles Preventivos estable y desea añadir una atestación
  pública anclada en Bitcoin como capa con evidencia de
  manipulación por encima del flujo existente de documentación de
  liberación.
- Es un fabricante pequeño o mediano, o un fabricante en una
  jurisdicción con infraestructura regulatoria más débil, y desea
  anclar los expedientes de lote frente a una cronología
  verificable globalmente — para confianza en el mercado de
  exportación, para responder a auditorías de cliente o para
  participar en iniciativas voluntarias de transparencia.
- Es un inspector de seguridad alimentaria o un certificador de
  tercera parte y desea publicar al firmar un sello de conclusión
  de auditoría con evidencia de manipulación, de manera que los
  hallazgos de la auditoría no puedan modificarse posteriormente
  en silencio por acuerdo entre el fabricante y el certificador.
- Espera que este lote enfrente un escrutinio aguas abajo
  significativo (mercado de exportación, categoría de alto riesgo
  como carne RTE o fórmula infantil, ingrediente novedoso,
  historial reciente de retiros).
- Puede publicar el conjunto de hechos listado sin romper las
  reglas de rechazo R1-R8. Si sus hechos requirieran romper R1-R8,
  no use el kit; corrija primero los datos de entrada.
- El asesor jurídico del fabricante ha revisado el plan de
  publicación. La publicación pública de un artefacto que porta
  un identificador de lote tiene implicaciones de exposición a
  responsabilidad por producto; la revisión jurídica no es
  opcional.

## Cuándo NO usar este kit

- **No lo use como sustituto de los expedientes regulatorios
  FSMA / FSIS / UE.** El sello es *aditivo*, no de reemplazo. Sus
  registros estatutarios de liberación, su plan HACCP, sus
  registros de CCP y su plan de retiro permanecen sin cambios.
- **No lo use como afirmación de seguridad.** Sellar un expediente
  de liberación conforme no establece que el producto sea seguro;
  establece que el expediente tenía este contenido en bytes en
  este momento. La regla de rechazo R6 rechazará cualquier
  conclusión de seguridad.
- **No lo use para publicar identidades de proveedores, listas de
  clientes, nombres de trabajadores o direcciones de
  instalaciones.** Las reglas de rechazo R1-R5 existen por razones
  de seguridad humana y contractuales; no enmiende el kit para
  derrotarlas sin consultar a un asesor jurídico.
- **No lo use bajo presión para sellar antes de que las pruebas
  de liberación se hayan completado.** Un sello con datos
  parciales tergiversa el estado de la decisión de liberación.
- **No lo use como teatro de legitimidad.** Un sello de un plan de
  muestreo mal diseñado o de un panel de analitos mal elegido es
  un registro público permanente de la inadecuación, no una
  defensa contra ella. La primitiva corta en ambos sentidos; esa
  es su honestidad.
- **No lo use durante una situación de retiro activa como
  sustituto de la coordinación de retiro del regulador.** Una
  nueva publicación MYRIAM anclando el alcance del retiro es
  apropiada DESPUÉS de iniciado el retiro coordinado por el
  regulador; no reemplaza el canal de retiro del regulador.

## Cómo bifurcar este kit para una liberación real

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**TIEMPO CRÍTICO:** selle en el momento de la liberación de QA,
ANTES de que el lote se distribuya (antes de que el primer camión
salga de las instalaciones). Un sello posterior al inicio de la
distribución todavía tiene valor pero no ancla limpiamente el
estado previo a la distribución. La ventana correcta está entre la
firma de liberación de QA y el primer movimiento de distribución.

**REVISIÓN CRÍTICA:** antes de sellar, haga pasar la publicación
por un segundo revisor de QA (distinto del líder) y por el asesor
jurídico de la empresa. Una vez sellada, la publicación es
permanente.

## Integración con la infraestructura de seguridad alimentaria
existente

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).** La
  URL de la publicación sellada o el CID de IPFS pueden
  referenciarse en la documentación del Food Safety Plan como
  artefacto público de atestación para este lote.
- **Planes HACCP del USDA FSIS y expedientes de liberación.** El
  expediente de liberación sellado coexiste con los registros
  HACCP exigidos por FSIS; el sello referencia el hash de la
  versión del plan HACCP (FACT 02), de modo que las disputas
  posteriores sobre qué versión del plan estaba vigente sean
  refutables públicamente.
- **Codex Alimentarius / principios HACCP** (Codex CAC/RCP 1-1969
  Rev. 4-2003). El sello se compromete con las salidas de los siete
  principios HACCP (análisis de peligros, CCP, límites críticos,
  monitoreo, acciones correctivas, verificación, mantenimiento de
  registros) para este lote.
- **ISO 22000:2018 (Sistemas de Gestión de la Inocuidad de los
  Alimentos).** El sello puede referenciarse como parte del rastro
  de evidencia de la revisión por la dirección; no reemplaza la
  certificación ISO 22000.
- **Esquema de certificación FSSC 22000 v6.** Compatible como capa
  aditiva de transparencia; el auditor de FSSC puede verificar el
  sello durante la vigilancia.
- **Reglamento (CE) 178/2002 de la UE (Ley General de Alimentos)
  Artículo 18 (trazabilidad) y Artículo 19 (notificación de
  retirada).** El sello compromete la preparación para
  trazabilidad de un eslabón hacia atrás del fabricante (FACT 07)
  y los compromisos de retiro (FACT 06); no reemplaza la
  obligación estatutaria de notificación del Artículo 19.
- **Paquete de Higiene de la UE (Reglamentos 852/2004, 853/2004,
  854/2004, 882/2004).** Compatible; el sello referencia el
  equivalente de los registros HACCP y de autocontrol del Paquete
  de Higiene.
- **Esquemas de normas privadas BRCGS / SQF.** Compatibles como
  capa aditiva de transparencia.
- **Sistemas de vigilancia en salud pública (CDC PulseNet,
  FoodNet, IFSAC; EFSA / ECDC de la UE).** Fuera del alcance
  directo del sello, pero el FACT 06 compromete al fabricante a
  participar y a sellar cualquier evento de correlación de
  señales como nueva publicación MYRIAM.

## Lo que este kit NO reemplaza

- El registro de instalación alimentaria de la FDA o la aprobación
  de establecimiento del USDA FSIS.
- Su Plan de Inocuidad Alimentaria / Plan HACCP escrito bajo
  FSMA / FSIS.
- Los registros de monitoreo de CCP y los registros de acciones
  correctivas.
- La supervisión de acreditación de laboratorio ISO 17025.
- Los programas de ensayos de aptitud.
- La inspección regulatoria (inspección continua del FSIS,
  inspección periódica de la FDA, inspección de la autoridad
  competente de la UE).
- La vigilancia en salud pública (CDC, EFSA, ECDC, equivalentes
  nacionales).
- Los canales de coordinación de retiro (FDA Reportable Food
  Registry, coordinación de retiro del FSIS, RASFF de la UE,
  equivalentes nacionales).
- Los programas de seguridad del trabajador y de formación del
  personal alimentario.

## Por qué existe este kit en v0.4.0+

Es uno de los ejemplos trabajados que se distribuyen con
myriam-kit. Sigue la estructura de README orientada a restricciones
validada por la autoinvestigación documentada en
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — la variante de prompt
orientada a restricciones obtuvo la puntuación más alta en una
rúbrica ponderada a lo largo de múltiples dominios de ejemplo,
porque la atestación de seguridad alimentaria es justamente el
dominio donde exagerar lo que el sello prueba es peligroso: ha
habido personas que han muerto, y morirán, en fallos que el sello
no puede prevenir. Las secciones iniciales son las partes portantes
del kit; el contenido del manifiesto es la parte fácil.

Los valores por defecto del kit son deliberadamente conservadores
sobre la publicación de nombres de trabajadores, conservadores
sobre la precisión de la ubicación de la instalación, conservadores
sobre la identidad de proveedores y clientes, y agresivos sobre la
advertencia «esto no establece la seguridad». La comunidad de
seguridad alimentaria tiene un historial documentado de lenguaje de
certificación exagerado; el kit adopta por defecto la posición
menos susceptible de ser leída como una garantía de seguridad. Los
fabricantes en jurisdicciones con exigencias específicas de
divulgación pública distintas pueden enmendar su bifurcación en
consecuencia, pero los rechazos por defecto favorecen la seguridad
del trabajador y un alcance honesto.

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
