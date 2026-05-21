*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de Sello de Pre-Certificación del Recuento Electoral

Un ejemplo de myriam-kit listo para usar destinado a juntas de escrutinio
condadales, autoridades electorales estatales y observadores de
integridad electoral que deseen publicar un sello del recuento anclado a
Bitcoin y evidente ante manipulación, en el momento exacto de la
certificación.

**Cierra** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Lo que este kit NO hace (leer primero)

El sello es una marca de tiempo criptográfica de lo que fue certificado.
No puede verificar si lo que fue certificado era correcto. Los siguientes
modos de falla quedan **fuera del dominio del sello**:

1. **Compromiso de las máquinas de votación.** Si el firmware fue
   manipulado o los totales de votos se contaron incorrectamente, el
   sello ancla un número erróneo con alta integridad. El sello observa
   las salidas del sistema de tabulación; no tiene visibilidad sobre el
   sistema en sí.

2. **Supresión del voto / privación estructural del derecho a voto.** El
   cierre de centros de votación, las disparidades en las leyes de
   identificación, el sesgo en la tasa de rechazo del voto por correo y
   las purgas del padrón electoral son anteriores a la certificación. El
   sello registra boletas contadas, no boletas que deberían haber sido
   contadas.

3. **Desinformación electoral.** El sello no resuelve las afirmaciones
   sobre la elección hechas por candidatos, medios o plataformas. Una
   certificación sellada puede citarse en una narrativa desinformativa
   con la misma facilidad que en defensa contra una. Las marcas de
   tiempo criptográficas son neutrales respecto al contenido.

4. **Fraude pre-certificación durante la recolección o el conteo de
   boletas.** Irregularidades en la recolección de boletas, manipulación
   de urnas, rupturas en la cadena de custodia durante la ventana de
   conteo — todo ocurre antes del momento del sello. El sello no puede
   detectarlas retroactivamente.

5. **Coerción de la autoridad certificadora.** Una certificación
   coercionada produce un sello criptográficamente válido de un
   resultado coercionado. El sello verifica que un funcionario firmó, no
   por qué.

6. **Certificaciones erróneas que nunca se corrigen después.** El valor
   del sello depende de un proceso posterior de búsqueda de la verdad
   (auditoría, recuento, litigio) contra el cual pueda compararse el
   sello. Si tal proceso nunca se ejecuta, el sello queda como único
   registro y puede calcificar el error.

7. **Anomalías estadísticas y detección de patrones.** El sello no
   señala márgenes inverosímiles, anomalías geográficas ni desviaciones
   de la ley de Benford. Esas son tareas analíticas sobre los datos
   sellados, no propiedades del sello.

8. **Contiendas de la parte baja de la boleta con rastros de auditoría
   delgados.** Las contiendas menores tienen disparadores de recuento
   más débiles; un sello único no puede cubrir significativamente todas
   las contiendas de una boleta sin acotamiento por contienda.

**La sección sobre límites honestos anterior es la parte que soporta el
peso de este kit.** Los funcionarios que crean que sellar equivale a
legitimidad lo usarán como escudo. El kit debe decir con claridad: esto
es una *primitiva de no-repudio para el momento de la certificación*, no
una prueba de la corrección de la elección.

---

## Lo que este kit DEBE RECHAZAR sellar

El kit está configurado para rechazar los siguientes patrones fácticos
incluso si un usuario con autoridad de firma válida los presenta:

- **Identificación individual del votante.** Ningún hecho puede nombrar
  a un votante, vincular una boleta con un votante, ni exponer ningún
  campo que pudiera re-identificar a una persona.
- **Decisiones de coincidencia de firma por boleta.** Cargadas de PII;
  sellarlas crea registros permanentes de decisiones que podrían ser
  impugnadas más tarde.
- **Cualquier hecho cuya publicación identificaría a un votante
  vulnerable.** Incluye resultados a nivel de mesa de votación en
  precintos tan pequeños que la elección de voto sea inferible
  (típicamente <50 boletas).
- **Recuentos sellados antes de que todas las boletas hayan sido
  contadas.** El kit rechaza los recuentos parciales presentados como
  "el recuento". Pre-certificación significa *todas las boletas
  contadas, antes de la certificación oficial* — no *durante el conteo*.
- **Certificaciones provisionales o contingentes.** El sello debe
  reflejar un hecho, no un condicional.
- **Recuentos que excluyen cohortes en litigio pendiente** sin un hecho
  acompañante sellado explícito que revele la exclusión.
- **Sellado por cualquier persona distinta de la autoridad
  certificadora** para esa jurisdicción.

El rechazo en sí puede ser sellado como un hecho ("Esta autoridad
solicitó sellar X; el kit rechazó conforme a la regla de rechazo Y"),
creando un registro público de un intento de uso indebido.

---

## Lo que este kit SÍ sella

8 hechos en el momento de la certificación:

1. **Aviso de ejemplo** — declara la publicación como ejemplo (las
   atestaciones reales eliminan o reemplazan este aviso).
2. **Identificación de la jurisdicción** — condado, fecha electoral,
   autoridad certificadora, funcionarios certificadores por nombre y
   rol.
3. **Recuento certificado** — totales de votos por contienda y por
   candidato + sobre/sub-votos + votos escritos.
4. **Contabilidad y reconciliación de boletas** — total emitidas, total
   tabuladas, total rechazadas por categoría, desglose por modalidad,
   denominador de votantes registrados.
5. **Manifiesto de equipos y rastro de auditoría** — modelo del
   tabulador + hash del firmware, hash del archivo CVR, hash del
   archivo de imágenes de boletas, hash del registro de custodia, hash
   de la política de coincidencia de firma.
6. **Umbrales y disparadores al momento de la certificación** — umbral
   de coincidencia de firma en vigor, umbrales disparadores de recuento,
   márgenes reales por contienda, compromiso de semilla de la RLA.
7. **Divulgaciones acompañantes y registro de rechazos** — litigios
   pendientes, anomalías post-conteo bajo revisión, cohortes excluidas,
   miembros disidentes de la junta; lista explícita de patrones que el
   kit rechazó sellar.
8. **Principal firmante** — identificación de la Junta de Escrutinio +
   nombre y partido de cada firmante + información criptográfica de la
   clave.

Cada hecho termina con la convención de barrera de rechazo: *"Este hecho
afirma solo X. No afirma Y"* (donde Y es el modo de falla más cercano
de la sección "NO hace" anterior).

---

## Contra qué se defiende este kit

- **Revisión silenciosa post-certificación de los totales de votos** —
  cualquier cambio entero al HECHO 03 produce un SHA-256 distinto, una
  raíz de Merkle distinta, falla en la verificación OTS.
- **"Boletas encontradas" siendo absorbidas silenciosamente** — la
  aritmética de reconciliación del HECHO 04 queda fijada en la
  certificación.
- **Afirmaciones de sustitución de firmware** — el HECHO 05 congela el
  manifiesto de equipos en la certificación.
- **Sustitución de artefactos de auditoría post-certificación** — el
  manifiesto de hashes del HECHO 05 detecta cualquier cambio
  post-certificación al CVR, las imágenes de boletas, los registros de
  custodia o la política de coincidencia de firma.
- **Redefinición de umbrales y disparadores** — el HECHO 06 congela las
  reglas en vigor en la certificación (umbral de coincidencia de firma,
  disparadores de recuento, límite de riesgo de la RLA).

## Casos históricos o casi históricos en los que el kit habría ayudado

El kit habría producido un anclaje útil — *no una solución* — en casos
que involucraron:

- **Antrim County, Michigan (2020).** Los resultados extraoficiales
  iniciales mostraron un intercambio de candidato corregido
  posteriormente al resultado opuesto. Un sello pre-corrección habría
  proporcionado una referencia pública sobre lo que dijo el anuncio
  original frente a lo que dijo la corrección, ambos atestados
  criptográficamente.
- **Maricopa County, Arizona (2020–2022).** Circularon múltiples
  iteraciones de totales recontados/reexaminados. Un sello del momento
  de certificación habría proporcionado un punto de referencia
  inequívoco contra el cual cada recuento posterior podría haberse
  diferenciado.
- **Florida 2000 (escrutinio Bush v. Gore).** Los totales certificados
  condado por condado se desplazaron bajo la presión del recuento; un
  sello por condado pre-recuento habría preservado lo que cada condado
  certificó antes de que comenzaran los procedimientos manuales de
  recuento.
- **Diversas elecciones extranjeras con "correcciones"
  post-certificación documentadas.** Agnóstico respecto a la
  jurisdicción.

El kit NO habría resuelto las disputas subyacentes sobre la integridad
de las máquinas en 2020, las disputas sobre la política del voto por
correo, ni ninguna elección donde la cuestión central fuera un hecho
disputado más que un registro disputado.

## Cuándo usar este kit

- Su jurisdicción cuenta con un proceso de certificación estable y
  auditado, y desea añadir un anclaje público inmutable.
- Anticipa escrutinio post-certificación y desea un punto de referencia
  evidente ante manipulación.
- Tiene autoridad legal para publicar el conjunto de hechos listado sin
  exponer PII.
- Tiene un proceso paralelo de auditoría o RLA para que el sello pueda
  compararse con la salida de búsqueda de la verdad.

## Cuándo NO usar este kit

- **No usar como sustituto de auditorías de límite de riesgo, recuentos
  manuales o auditorías post-electorales.** Este kit es *aditivo*, no de
  reemplazo.
- **No usar si el funcionario certificador no es el verdadero
  decisor** (crea atribución falsa).
- **No usar a mitad de la tabulación.** El kit es para el momento de
  certificación específicamente. Los sellos de recuento parcial crean
  puntos de referencia engañosos.
- **No usar para afirmar que la elección fue justa, exacta o legítima**
  — no puede hacerlo.
- **No usar bajo presión para sellar antes del momento de la
  certificación, ni para omitir una divulgación en hecho acompañante.**
  Rechace, y selle el rechazo.
- **No usar como teatro de legitimidad.** Un sello de un recuento
  fraudulento es un registro público permanente del fraude, no una
  defensa contra él. La primitiva corta en ambos sentidos; esa es su
  honestidad.

## Cómo bifurcar este kit para una certificación real

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # reemplazar contenido ficticio por el real
bash build/seal.sh     # sellar EN o después de la firma oficial de certificación
python3 build/verify.py
```

**Sincronización crítica:** selle EN el momento de la certificación,
NO antes. Un sello antes de la certificación oficial crea un registro
falso-positivo de "este es el resultado oficial". Un sello posterior es
no-repudio convencional.

## Integración con la infraestructura electoral existente

- **Juntas Electorales Estatales / certificación de la EAC.** El kit
  publica junto con el documento oficial de certificación. No reemplaza
  la certificación estatutaria.
- **Auditorías de límite de riesgo.** El hash del CVR en el HECHO 05 es
  el mismo hash que consume la herramienta de RLA. El sello vincula el
  CVR auditado al total certificado.
- **Procedimientos de recuento.** Un recuento desencadenado por la ley
  estatal produce un NUEVO conjunto de hechos sellado (marca de tiempo
  distinta, hashes distintos, misma jurisdicción). Ambos sellos
  coexisten; ninguno sobrescribe al otro. La diferencia entre los
  sellos es el registro público de lo que el recuento cambió.
- **Election Markup Language (EML) y Common Data Format (CDF).** Los
  cuerpos de los hechos deben ser derivables de las salidas EML/CDF
  existentes en la jurisdicción para mantener el kit agnóstico
  respecto al formato de datos.
- **Firma bipartidista de la junta de escrutinio.** Variante de
  multifirma recomendada para jurisdicciones con juntas de escrutinio
  con balance partidario.

## Lo que este kit NO reemplaza

- La certificación estatutaria bajo la ley electoral estatal
- La certificación del sistema de votación de la EAC
- Las auditorías de límite de riesgo / recuentos manuales
- Los procedimientos de recuento y auditorías post-electorales
- Las órdenes judiciales o el litigio de impugnación electoral

## Por qué este kit existe en la v0.3.0+

Este es el 6.º ejemplo trabajado distribuido con myriam-kit. El kit fue
producido mediante un proceso de autoinvestigación al estilo Karpathy
documentado en `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Tres
variantes de prompt (imitación / primeros principios / restricciones-
primero) produjeron esquemas de kit paralelos; la variante de
restricciones-primero obtuvo la puntuación más alta en una rúbrica
ponderada, y el kit final sintetiza su estructura con la cohesión de la
variante de imitación y el detalle operativo de la variante de primeros
principios.

La autoinvestigación misma está documentada como patrón de prompt en
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` para uso futuro.

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
