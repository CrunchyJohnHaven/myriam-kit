*Traducción al español — para la versión original en inglés, vea [README.md](README.md)*

# Kit de Atestación de Reclamos de Seguro

Un ejemplo de myriam-kit llave en mano para ajustadores de
seguros con licencia de EE. UU. (auto, salud, propiedad y
accidentes, vida, y ramos especializados) que deseen publicar
un sello anclado en Bitcoin y a prueba de manipulación de *qué
evidencia estaba en el expediente*, *cómo se interpretó la
póliza*, y *qué se aprobó o denegó*, en el momento de una
decisión de cobertura, de modo que la revisión posterior del
registro por cualquiera de las partes se vuelva
criptográficamente detectable.

---

## Lo que este kit NO hace (lea primero)

El sello es una marca temporal criptográfica de QUÉ EVIDENCIA
estaba en el expediente de reclamo en el momento de la decisión,
QUÉ leyó la aseguradora que significaba la póliza, y QUÉ fue
aprobado o denegado por CUÁNTO y bajo QUÉ CÓDIGOS DE RAZÓN. No
puede responder a ninguna otra pregunta sobre el reclamo. Lo
siguiente está **fuera del dominio del sello**:

1. **El sello NO prueba que el reclamo era legítimo.** Si un
   reclamante adulteró la evidencia *antes* de la presentación,
   el sello ancla la evidencia adulterada con la misma integridad
   que anclaría evidencia genuina. El valor del sello comienza
   en el momento en que la evidencia entra en el expediente del
   reclamo; el fraude pre-presentación es invisible para él. El
   sello hace una cosa específica más difícil — la alteración
   post-presentación por cualquiera de las partes — no todas las
   formas de fraude de seguros.

2. **El sello NO obliga a cubrir lo que no estaba en la póliza
   original.** El sello registra la lectura contemporánea del
   contrato por la aseguradora; no obliga a ningún tribunal a esa
   lectura y no expande la cobertura más allá de lo que el
   contrato realmente provee. Una aprobación sellada de pago bajo
   una póliza que de hecho no cubría la pérdida es la decisión
   voluntaria de la aseguradora de pagar, no un agrandamiento
   del contrato.

3. **El sello NO defiende contra un ajustador que está él mismo
   capturado o sesgado.** Un ajustador coaccionado o capturado
   que sella una decisión falsa produce un sello criptográficamente
   válido de una decisión falsa. El sello es honesto al respecto:
   es una primitiva de no-repudiación para la decisión
   contemporánea del ajustador, no una prueba de que la decisión
   sea correcta. Este es el modo de falla de
   "amplificación-de-coacción" común a todas las primitivas de
   atestación — un actor de mala fe con autoridad de firma
   produce registros duraderos de mala fe. La estructura de
   divulgación compañera en HECHO 06 (estructura de incentivos,
   reclamos previos, revisión del supervisor, historial de
   quejas DOI) está diseñada para hacer más visibles los patrones
   de ajustador-capturado, pero no elimina el modo de falla.

4. **El sello NO hace solvente a la aseguradora para la
   obligación.** Una aprobación sellada por una aseguradora
   insolvente sigue siendo una promesa sin fondos. La solvencia
   de la aseguradora es un asunto prudencial del DOI estatal y
   un asunto de respaldo de la asociación de garantía estatal;
   el sello ancla la decisión pero no la capacidad de la
   aseguradora de pagarla.

5. **El sello NO reemplaza el proceso de quejas del DOI estatal,
   el procedimiento de apelación de la póliza, ni la litigación
   por mala fe.** Los asegurados y reclamantes de terceros
   conservan todos los derechos que tenían antes de que el sello
   fuera generado. El sello es evidencia aditiva en cualquier
   disputa posterior, no un sustituto para los mecanismos de
   resolución de disputas que la ley ya provee.

6. **El sello NO establece que la póliza estaba en vigor en la
   fecha de la pérdida.** La cobertura en vigor es un análisis
   de prima-y-cancelación, y una pista de revisión separada de
   la pista de interpretación-de-cobertura registrada en HECHO
   04. Una atestación real de reclamo debe emparejarse con la
   determinación de estado-en-vigor de la aseguradora, sellada
   por separado o referenciada por hash.

7. **El sello NO re-identifica a ninguna parte privada.** El
   SSN del reclamante, DOB más allá de lo necesario para
   verificar la identidad de la póliza, dirección completa,
   diagnósticos médicos, especificidades de tratamiento, y
   nombres de testigos no públicos son todos rechazados por el
   kit. Vea reglas de rechazo R1, R2, R3 en HECHO 07.

**La sección de límites honestos arriba es la parte
portadora-de-carga de este kit.** Las aseguradoras que creen
que sellar equivale a correctitud lo usarán como escudo contra
el escrutinio legítimo post-pago. Los ajustadores bajo presión
para denegar estarán tentados de sellar rechazos
pre-investigación como si fueran decisiones finales (rechazados
por R4 / R8). Los reclamantes que creen que sellar les da
derecho a pago que no se les debe bajo el contrato quedarán
decepcionados. El kit debe decir claramente: *esta es una
primitiva de no-repudiación para el momento de la decisión de
cobertura de la aseguradora, no una prueba de que la decisión
sea correcta, el reclamo sea legítimo, o la aseguradora pueda
financiar la obligación.*

---

## Lo que este kit DEBE NEGARSE a sellar

El kit está configurado para rechazar los siguientes patrones
incluso si un ajustador con licencia del expediente con
autoridad de firma válida los envía (texto completo en HECHO 07):

- **SSN del reclamante, DOB completo, dirección de domicilio
  completa, o número de teléfono.** El expediente de reclamo de
  la aseguradora vincula estos; el sello público no los necesita
  y no debe llevarlos. El sello público no es un índice de
  re-identificación.
- **Narrativas de diagnóstico, especificidades de tratamiento, o
  códigos de procedimiento que pudieran identificar condiciones
  raras o estigmatizantes.** Incluso por hash. El sello público
  lleva solo resúmenes de códigos de facturación CPT/HCPCS y
  montos facturados; los diagnósticos ICD-10, detalle de salud
  mental, estado de VIH, tratamiento de uso de sustancias,
  detalle de salud reproductiva, e indicadores de enfermedades
  raras NUNCA están en el sello público, ni siquiera por hash.
- **Nombres legales de testigos**, a menos que el testigo ya
  sea registro público (oficial que responde, representante de
  agencia pública). Los testigos son referidos por handle
  (W-1, W-2, ...) y vinculados a identidades legales en el
  expediente de reclamo de la aseguradora bajo descubrimiento
  normal.
- **Sellar una decisión de investigación-parcial presentada como
  final.** Una "decisión" que es en realidad un pago provisional,
  una reservación de cobertura, o un rechazo pre-investigación
  presentado como final es rechazada. El estado de disposición y
  la fecha de decisión deben etiquetar con precisión si esta es
  la decisión final.
- **Sellado por alguien que no sea el ajustador con licencia del
  expediente.** Solo el ajustador con licencia del expediente (o
  el principal de firma apropiadamente licenciado de un TPA /
  MGA delegado) puede firmar el sello bajo el nombre de la
  aseguradora. Los asegurados y reclamantes pueden usar el mismo
  kit para sellar su propio análisis independiente (una
  característica, no un error), pero no para sellar la decisión
  de la aseguradora bajo el nombre de la aseguradora.
- **Reclamaciones de finalidad legal o preclusión.** El kit no
  sellará un cuerpo de hechos que afirme que la decisión es
  "vinculante," "final y no apelable," "preclusiva," o cualquier
  conclusión legal similar. La finalidad legal es una función
  judicial.
- **Cambios retroactivos de interpretación-de-cobertura en un
  supuesto sello de "enmienda".** Las revisiones a la
  interpretación de cobertura o montos de pago DEBEN sellarse
  como una NUEVA publicación que referencie este sello por raíz
  de Merkle, nunca como un re-sello modificado bajo los mismos
  identificadores.
- **Sellos de denegación cuyo código de razón equivale a
  "investigación incompleta pero denegando por razones
  procesales".** Un sello de denegación debe apoyarse en
  códigos de razón sustantivos vinculados a disposiciones
  específicas de la póliza (HECHO 04) y evidencia específica
  (HECHO 03).
- **Cláusulas de no-divulgación que operan contra el reclamante
  dentro del cuerpo del sello.** Las decisiones de cobertura
  hechas bajo amenaza de no-divulgación post-acuerdo del
  reclamante son un patrón establecido de mala fe; el kit se
  niega a ser el vehículo. (Las aseguradoras pueden incluir
  términos de NDA en un acuerdo de liquidación separado; solo
  no dentro del sello público.)
- **Sellar mientras la litigación por mala fe contra la
  aseguradora está pendiente sobre este reclamo, sin
  concurrencia expresa del tribunal.** Un sello de
  registro-impugnado en los términos de la aseguradora es una
  función judicial.

Un rechazo en sí mismo puede ser sellado como un hecho ("Parte
X solicitó sellar el patrón Y; el kit rechazó según la regla
de rechazo Z"), creando un registro público de intento de mal
uso.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la decisión de cobertura:

1. **Aviso de ejemplo** — declara la publicación como ejemplo
   (atestaciones reales eliminan o reemplazan esto).
2. **Identificación del reclamo** — número de reclamo,
   aseguradora, código NAIC, presentación de formulario de
   póliza, fechas efectivas de póliza, handles de asegurado/
   reclamante, fecha de pérdida, fecha de reporte de reclamo,
   canal de reporte, ubicación de pérdida (redactada a
   municipalidad / estado), cobertura en cuestión, fecha de
   decisión.
3. **Manifiesto de evidencia** — por elemento de evidencia: hash
   SHA-256, tamaño de archivo, fuente, fecha de presentación.
   Incluye grabación FNOL, declaración del asegurado, fotos del
   vehículo, informe policial, tasación independiente, estimado
   de reparación, resumen de demanda y factura de terceros
   (solo CPT/HCPCS — vea R2), declaraciones de testigos (por
   handle — vea R3), fotos de la escena del lado de la
   aseguradora, memo de análisis de cobertura.
4. **Interpretación de cobertura** — formulario de póliza y
   endosos que rigen el reclamo, la lectura contemporánea de la
   aseguradora de las disposiciones en cuestión, exclusiones
   revisadas y encontradas como no aplicables, y la divulgación
   de ley aplicable (la lectura de la aseguradora es la lectura
   de la aseguradora; la interpretación final recae en un
   tribunal).
5. **Decisión de pago** — disposición general, desglose de pago
   por-elemento con códigos de razón sustantivos vinculados a
   disposiciones de HECHO 04, desembolso total de la aseguradora,
   cualquier reserva, y obligaciones post-decisión.
6. **Divulgaciones compañeras** — litigación de cobertura
   pendiente en el mismo formulario de póliza, reclamos previos
   del mismo asegurado, recusaciones y conflictos de interés del
   ajustador, historial de revisión / anulación supervisoria,
   historial de quejas del DOI estatal, notificaciones a
   reaseguradoras, problemas conocidos de proveedor / software
   de valoración, regímenes estatutarios aplicables.
7. **Registro de rechazos** — patrones que el kit rechazó sellar
   (o, donde no se activaron rechazos, una atestación explícita
   de "ninguno en el momento de decisión" por disciplina de
   regla-de-rechazo).
8. **Principal firmante** — identidad de la aseguradora + código
   NAIC + nombre legal del ajustador con licencia del expediente
   y número de licencia del DOI estatal + co-firmante supervisor
   + cadena completa de escalada.

Cada hecho termina con la convención de puerta-de-rechazo:
*"Este hecho afirma solo X. No afirma Y"* (donde Y es el modo
de falla más cercano de la sección "NO hace" arriba).

---

## Contra qué defiende este kit

- **Reversión silenciosa de denegación post-pago.** Las
  aseguradoras ocasionalmente revierten decisiones de pago
  después del hecho, alegando error clerical o re-investigación.
  El HECHO 05 sellado ancla la decisión; una reversión
  post-decisión es públicamente detectable como una nueva
  acción inconsistente con el sello, no una reescritura
  "siempre-fue".
- **Reinterpretación retroactiva de cobertura.** Un reclamo
  posterior de la aseguradora de que "la póliza siempre excluyó
  el tipo de pérdida X" es públicamente refutable contra la
  lectura contemporánea de HECHO 04.
- **Acusaciones post-hechos de manipulación-de-evidencia contra
  reclamantes honestos.** Un reclamante honesto cuya evidencia
  presentada se alega más tarde haber sido adulterada puede
  re-hashear la evidencia que presentó y demostrar que coincide
  con el manifiesto HECHO 03 sellado en el momento de decisión.
  El sello pone la carga de la prueba sobre el acusador para
  identificar una discrepancia de hash.
- **Reducción post-hechos del monto aprobado.** Una aseguradora
  que más tarde intenta pagar menos que el monto aprobado en
  HECHO 05 enfrenta un registro públicamente anclado de lo que
  fue aprobado.
- **"El reclamo nunca fue recibido" / "no tenemos registro"
  gaslighting.** El hash de grabación FNOL sellado, número de
  reclamo, y fecha de decisión prueban que el reclamo estaba en
  archivo y decidido a partir de la fecha del sello.
- **Omisión selectiva de evidencia.** La enumeración de HECHO
  03 de toda la evidencia en el expediente en el momento de
  decisión significa que un reclamo posterior de "nunca tuvimos
  ese informe policial" es públicamente refutable. A la inversa,
  el posterior "envié X y lo ignoraron" del asegurado es
  refutable si X no está en el manifiesto (y el asegurado puede
  sellar independientemente lo que presentó, creando un
  contra-sello que el sello de la aseguradora tendría que
  abordar).
- **Sustitución del nombre de un ajustador diferente en la
  decisión.** HECHO 08 ancla al ajustador con licencia del
  expediente y la cadena completa de escalada; una defensa
  posterior de "ajustador renegado actuó solo" es comprobable
  contra este registro.
- **Deriva de interpretación-de-cobertura entre reclamos
  similares.** Las interpretaciones de cobertura selladas a
  través de los reclamos de patrones-de-hecho-similares de la
  aseguradora se vuelven públicamente comparables; la
  interpretación selectiva que favorece a la aseguradora en
  algunos casos y al asegurado en otros es públicamente
  detectable.

El kit **no** defiende contra mala fe contemporánea — un
ajustador capturado que sella una decisión falsa bajo presión
produce un sello criptográficamente válido de una decisión
falsa. La primitiva es honesta al respecto: es una primitiva
de no-repudiación para la afirmación contemporánea del
ajustador, no una prueba de que la afirmación sea correcta.
La estructura de divulgación compañera en HECHO 06 está
diseñada para hacer aflorar patrones de ajustador-capturado
(estructura de incentivos, historial de reclamos previos,
historial de quejas DOI, revisión del supervisor) pero no
puede eliminar el modo de falla.

---

## Contexto histórico

El kit habría producido un ancla útil — *no una resolución* —
en episodios pasados donde la integridad del registro de
reclamos de seguro se convirtió en un asunto disputado:

- **Huracán Katrina (2005) y la controversia del memo "make me
  money".** Se alegó que una importante aseguradora de P&C usó
  guía de firma consultora que priorizó la reducción de costos
  de reclamos sobre la lectura de contrato; siguieron múltiples
  acciones de mala fe y un juicio punitivo de $2.5M. Las
  interpretaciones de cobertura selladas (HECHO 04) y las
  divulgaciones de incentivos del ajustador selladas (HECHO 06
  C3) en el momento de cada decisión de la era Katrina habrían
  hecho el patrón alegado de sub-pago sistemático públicamente
  comparable a través de reclamos, en lugar de reconstruible
  solo a través de años de descubrimiento por litigación.

- **Reclamos de salud de primeros respondedores del World Trade
  Center del 9/11.** Los reclamos de salud post-9/11 y
  compensación de trabajadores que involucran a primeros
  respondedores expuestos al WTC vieron un patrón documentado
  de estrechamiento de cobertura post-hechos a medida que
  evolucionaba el panorama de efectos en salud a largo plazo.
  Las interpretaciones de cobertura selladas en el momento de
  cada decisión inicial habrían hecho el posterior
  estrechamiento interpretativo públicamente detectable y
  habrían dado a los formuladores de políticas de la era Zadroga
  Act una línea base forense más limpia.

- **Litigación de asbesto (décadas).** Las disputas sobre *qué
  estaba en el registro cuándo* — qué pólizas estaban en
  vigor, qué endosos aplicaban, qué exclusiones se afirmaban
  en qué momento — han impulsado la litigación de cobertura
  de asbesto durante más de cuarenta años. Las atestaciones
  por-reclamo selladas no habrían prevenido las disputas
  subyacentes sobre cobertura y exposición, pero habrían
  removido un eje completo de disputa (qué registros decían
  qué en qué momento) de cada expediente de reclamo individual.

- **Reversiones de autorización-previa de seguro-de-salud.**
  Un patrón documentado a través de múltiples aseguradoras en
  el que se emite una autorización previa para un procedimiento,
  se realiza el procedimiento, y luego se niega el reclamo por
  motivos que contradicen el lenguaje de pre-autorización.
  Sellar la autorización previa como una decisión de
  interpretación-de-cobertura bajo este kit haría la
  contradicción públicamente detectable.

- **Casos de alteración de expedientes de reclamo de
  seguro-de-discapacidad.** Múltiples casos reportados de
  aseguradoras de discapacidad a largo plazo alterando
  expedientes de reclamo después de la determinación favorable
  inicial para apoyar una decisión posterior de terminación. El
  manifiesto de evidencia HECHO 03 más la interpretación de
  cobertura HECHO 04, sellados en la determinación favorable
  original, habrían hecho la alteración de expediente
  post-determinación públicamente detectable.

El kit NO habría resuelto las disputas subyacentes sobre el
alcance de cobertura o el derecho del reclamante en ninguno de
estos episodios. Habría resuelto una sub-disputa probatoria
específica: si el registro en el momento de la decisión era lo
que una u otra parte afirmaba más tarde que era.

---

## Cuándo usar este kit

- Usted es un ajustador con licencia del expediente (o un TPA /
  MGA con autoridad de firma apropiadamente delegada) y su
  aseguradora permite la atestación pública voluntaria de
  decisiones de reclamos.
- El reclamo involucra apuestas lo suficientemente altas como
  para que la litigación posterior o el examen del DOI estatal
  sea plausible (P&C de alto-dólar, BI de terceros con
  implicaciones de límites-de-póliza, discapacidad con cola
  larga, salud con complejidad de pre-autorización, vida con
  preguntas de contestabilidad).
- Puede publicar el conjunto de hechos listado sin exponer PII
  de reclamante, PHI, o datos de re-identificación de
  persona-vulnerable. (Las reglas de rechazo del kit hacen
  cumplir esto; si sus hechos requerirían una ruptura de
  regla-de-rechazo, no use el kit.)
- El consejo legal general de la aseguradora ha revisado el
  plan de publicación. La publicación pública de un artefacto
  portador-de-reclamo tiene implicaciones para el manejo
  continuo de reclamos, reporte de reaseguros, y
  presentaciones del DOI estatal; la revisión del consejo no
  es opcional.
- El sistema de gestión de reclamos de la aseguradora puede
  producir instantáneas estables a nivel de byte de archivos
  de evidencia (para que el re-hash posterior reproduzca los
  hashes de HECHO 03).

## Cuándo NO usar este kit

- **No usar como sustituto del cumplimiento del DOI estatal,
  cumplimiento del modelo NAIC de prácticas-injustas-de-
  reclamos, cumplimiento del procedimiento-de-reclamos ERISA,
  o la documentación regular del expediente de reclamo de la
  aseguradora.** Este kit es *aditivo*, no reemplazo.
- **No usar si el reclamo involucra PHI que no puede ser
  reducido a resúmenes de códigos de facturación CPT/HCPCS sin
  revelar el diagnóstico.** Si la categoría de reclamo expone
  inherentemente el diagnóstico a través de la facturación
  (algunos reclamos de enfermedades raras y farmacia
  especializada), el sello no puede emitirse sin romper R2; no
  use el kit en esos reclamos.
- **No usar para sellar una denegación impulsada por presión
  de costo agregado en lugar de análisis sustantivo de
  cobertura.** La regla de rechazo R8 está diseñada para
  atrapar esto; si sus códigos de razón no pueden vincularse a
  disposiciones específicas de póliza y evidencia específica,
  no selle.
- **No usar bajo presión para sellar antes de que la
  investigación esté completa.** Un sello de investigación
  parcial tergiversa el estado. Las reglas de rechazo R4 y R8
  están diseñadas para atrapar esto.
- **No usar como teatro de legitimidad.** Un sello de una
  decisión de mala fe es un registro público permanente de la
  decisión de mala fe, no una defensa contra ella. La primitiva
  corta en ambas direcciones; esa es su honestidad.
- **No usar en reclamos donde la aseguradora ya está en
  litigación por mala fe con respecto a este reclamo, sin
  concurrencia expresa del tribunal** (regla de rechazo R10).
- **No usar para publicar obligaciones de no-divulgación o
  no-desacreditación contra el reclamante** (regla de rechazo
  R9).

## Cómo bifurcar este kit para un reclamo real

```bash
cp -r ~/Genesis/myriam-kit/examples/insurance-claim-attestation ~/claim-CLM-XXXX
cd ~/claim-CLM-XXXX
$EDITOR facts/*.txt       # replace fictional content with real claim
                          # apply refusal rules R1-R10 throughout
bash build/seal.sh        # seal AT the moment of coverage decision
python3 build/verify.py   # confirm
```

**Tiempo crítico:** sellar EN el momento de la decisión de
cobertura — mismo día hábil o siguiente día hábil a más
tardar. Un sello mucho más tarde crea una brecha durante la
cual cualquiera de las partes podría haber alterado el
registro. La ventana correcta es inmediatamente después de
que la decisión es rendida y revisada por el supervisor y
ANTES de que el reclamante reciba la carta de decisión — para
que la carta de decisión contenga una referencia a la raíz
de Merkle del sello, vinculando el razonamiento declarado de
la aseguradora al sello.

**Revisión crítica:** antes de sellar, ejecute la publicación
a través del consejo legal general de la aseguradora y (donde
sea aplicable) el equipo de reporte de reaseguros de la
aseguradora. Una vez sellada, la publicación es permanente.

## Integración con la infraestructura existente de reclamos

- **Sistema de gestión de reclamos de la aseguradora (CMS):**
  el CMS sigue siendo el sistema primario de registro de la
  aseguradora. El sello no reemplaza el CMS; compromete la
  evidencia y razonamiento que el CMS registra, por lo que las
  ediciones post-decisión del CMS son públicamente detectables.
- **Registro de transacción EDI / ACORD:** la decisión HECHO 05
  se alinea con la transacción de estado-de-reclamo ACORD; la
  raíz de Merkle del sello puede llevarse como referencia de
  forma-libre en la carga EDI, para que los consumidores aguas
  abajo (reaseguradoras, reguladores, consejo del asegurado)
  puedan verificar el sello independientemente.
- **Proceso de quejas del Departamento de Seguros del Estado:**
  un quejoso puede referenciar la raíz de Merkle del sello en
  una queja del DOI, permitiendo al examinador del DOI
  verificar independientemente lo que estaba en archivo y cuál
  era el razonamiento de la aseguradora en el momento de
  decisión.
- **Exámenes de conducta-de-mercado NAIC:** las decisiones
  selladas a través de un libro de negocios producen un
  registro públicamente auditable de patrones de
  manejo-de-reclamos; un examinador de conducta-de-mercado
  puede ejecutar una comparación de decisiones-selladas a
  través de reclamos de patrones-de-hecho-similares gratis.
- **Reporte de reaseguros:** la raíz de Merkle del sello en el
  reporte de cesión vincula el razonamiento del expediente de
  reclamo de la aseguradora en el momento de cesión; el
  reasegurador puede verificar independientemente y la
  alteración del expediente de la aseguradora post-cesión es
  detectable.
- **Descubrimiento de litigación por mala fe:** el sello
  pre-compromete a la aseguradora al estado del expediente en
  el momento de decisión, removiendo un eje de disputa de
  descubrimiento (qué estaba en el expediente cuándo) y
  enfocando el descubrimiento en la pregunta sustantiva de
  mala fe (era la decisión misma razonable sobre el estado del
  expediente que existía).
- **Contra-sellos del asegurado:** un asegurado (o el consejo
  del reclamante) puede usar el MISMO kit para publicar un
  hash de la evidencia que el asegurado cree haber presentado;
  si el manifiesto HECHO 03 de la aseguradora omite el hash
  del asegurado, esa omisión es públicamente detectable. Este
  es el valor agregado principal del kit para el lado del
  asegurado y es sin permiso — la aseguradora no necesita
  cooperar.

## Lo que este kit NO reemplaza

- Requisitos de manejo-de-reclamos del código de seguros
  estatal.
- Ley estatal de Prácticas-Injustas-de-Liquidación-de-Reclamos
  y las regulaciones modelo NAIC.
- Procedimientos de reclamos ERISA § 1133 y 29 C.F.R.
  § 2560.503-1 (para reclamos de salud y discapacidad
  gobernados por ERISA).
- El marco de regulación-estatal de la Ley McCarran-Ferguson.
- Los SOPs de reclamos de la aseguradora, documentación del
  expediente de reclamo, o CMS.
- Procesos de quejas del DOI estatal.
- Procedimientos de apelación del tomador de póliza
  especificados en la póliza.
- Remedios de derecho-común por mala-fe en la jurisdicción del
  tomador de póliza.
- Procesos de subrogación, salvataje y recuperación.
- Procesos de reporte y auditoría de reaseguros.
- Adjudicación judicial de cobertura disputada.

## Valor de adopción

El fraude de seguros de EE. UU. a través de auto, salud, P&C,
vida, y ramos especializados se estima en aproximadamente
\$300B / año en pérdidas. Agregue aproximadamente \$50B / año
en reclamos legítimos disputados (costos de litigación por
mala fe, penalidades de estatutos de pago-rápido, liquidación
de casos de cobertura-disputada) y la superficie direccionable
es aproximadamente \$350B / año. Incluso una reducción del 1%
— mediante disuasión de alteración de registros post-hechos por
cualquiera de las partes — sería \$3.5B / año en pérdidas
ahorradas y costos de disputa ahorrados.

A una equivalencia conservadora de \$5,000 / vida-salvada (el
rango de la OMS para intervenciones de salud
costo-efectivas en contextos de bajos y medianos ingresos),
\$3.5B / año corresponde a una cifra de vidas-equivalentes del
orden de 700,000 vidas por año. Esta cifra se ofrece como un
marco de orden-de-magnitud del valor social de reducir la
superficie de reclamos disputados, no como un reclamo directo
de mortalidad sobre el fraude de seguros de EE. UU. per se.

El sello es una primitiva. La adopción es voluntaria. El valor
se acumula a través de un libro de negocios una vez que la
integridad del expediente de reclamo de la aseguradora se
vuelve públicamente auditable.

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
