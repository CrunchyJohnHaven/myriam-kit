*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de pre-registro de ensayos clínicos de medicamentos

Un ejemplo llave en mano de myriam-kit para patrocinadores de ensayos clínicos e investigadores académicos que deseen pre-registrar un ensayo de manera evidente ante manipulación y anclada en Bitcoin **además del** registro en ClinicalTrials.gov, EU CTR u otros registros jurisdiccionales.

## ¿Por qué pre-registrar *adicionalmente* bajo MYRIAM?

Los registros de ensayos existentes (ClinicalTrials.gov, EU CTR, ISRCTN) tienen debilidades de integridad documentadas:

- ClinicalTrials.gov permite a los patrocinadores actualizar los criterios de valoración, los cálculos del tamaño muestral y los planes de análisis **después** del registro original, con las fechas de modificación visibles en el registro pero los cambios de *contenido* no siempre anclados criptográficamente.
- Varios estudios de gran escala (Goldacre et al., 2019; Mathieu et al., 2009) han documentado el cambio sistemático de criterios de valoración post-hoc en todo el campo.
- La aplicación editorial por parte de las revistas (CONSORT, ICMJE) detecta algunos casos; muchos se cuelan.

Un sello MYRIAM cierra esta brecha. La raíz de Merkle + el recibo OTS de Bitcoin hace que cualquier cambio post-hoc al criterio de valoración primario *pre-registrado*, al plan de análisis estadístico o a la lista de subgrupos sea detectable criptográficamente. El sello es forensicamente más difícil de retconnear que el propio registro.

Este kit es un **complemento de**, no un reemplazo para, los registros jurisdiccionales. Un ensayo real debería registrarse en el registro correspondiente Y sellarse bajo MYRIAM.

## Contra qué defiende este kit

Casos históricos con consecuencias en mortalidad en los que esto habría ayudado:

- **Vioxx (Merck, 2004)**: los eventos cardiovasculares eran un criterio de valoración pre-registrado en el ensayo APPROVe, pero el análisis publicado utilizó un punto de corte que minimizaba el daño aparente. Un sello del punto de corte pre-registrado habría hecho que el cambio post-hoc del punto de corte fuera detectable públicamente antes del artículo publicado.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: los datos negativos del ensayo sobre conducta suicida en adolescentes se replantearon mediante análisis post-hoc. Un pre-registro sellado de los criterios de valoración habría hecho que el replanteamiento fuera detectable públicamente.
- **Múltiples ensayos oncológicos** en los que los criterios de valoración de supervivencia fueron sustituidos por criterios de valoración subrogados (supervivencia libre de progresión, tasa de respuesta) cuando el beneficio en supervivencia no llegó a materializarse.

**Modos de falla que el sello detecta directamente:**

- **Cambio de criterios de valoración**: promoción post-hoc de un criterio de valoración secundario a "primario" cuando el primario real falla. El HECHO 05 del sello contiene el criterio de valoración primario pre-registrado; el criterio de valoración primario publicado debe coincidir.
- **Selección sesgada de resultados (cherry-picking)**: reportar selectivamente sólo los análisis que funcionaron. El HECHO 06 contiene el plan de análisis pre-registrado completo; los análisis publicados deben incluir todos los pre-registrados.
- **Búsqueda post-hoc de subgrupos**: afirmar "el medicamento funciona para el subgrupo X" después de ver los datos. El HECHO 07 contiene la lista de subgrupos pre-registrados; cualquier otro subgrupo debe etiquetarse como post-hoc.
- **Revisión del tamaño muestral**: aumentar el tamaño muestral después de ver las tendencias intermedias. El HECHO 06 contiene el tamaño muestral pre-registrado y el cálculo de potencia.
- **Eliminación silenciosa de criterios de valoración secundarios inconvenientes**: el HECHO 05 pre-ordena los criterios de valoración secundarios para pruebas jerárquicas; cualquier reordenamiento o eliminación es detectable.
- **Supresión de resultados negativos**: el HECHO 08 contiene el compromiso de publicación; el incumplimiento de publicar dentro del plazo comprometido es visible públicamente.

**Modos de falla NO cubiertos:**

- Mala conducta en la ejecución misma del ensayo (datos falsificados, inclusión fraudulenta). El sello ancla el *plan*, no la *ejecución*.
- Reportes selectivos en publicaciones que incluyen todos los análisis pre-registrados pero los interpretan favorablemente. El sello detecta lo que falta; no puede detectar el sesgo interpretativo.
- Daño a pacientes durante el propio ensayo. El sello es regulatorio y probatorio; no reduce el riesgo de la conducción del ensayo.

## Cuándo usar este kit

Debería considerar sellar un pre-registro si:

- Está patrocinando o conduciendo un ensayo clínico — de Fase 1 a 4 — que será utilizado para informar decisiones médicas o regulatorias.
- Está dispuesto a quedar comprometido públicamente con el diseño, los criterios de valoración y el plan de análisis pre-registrados.
- Puede asumir la consecuencia: si el ensayo falla en sus criterios de valoración pre-registrados, no puede retconnear silenciosamente a un criterio de valoración distinto que sí haya funcionado.
- Participa en una cultura de investigación (medicina académica, grupos cooperativos, investigación financiada por los NIH) en la que se exige cada vez más la integridad del pre-registro.

Este kit es *particularmente* valioso para:

- Ensayos iniciados por investigadores en instituciones académicas (donde la presión del patrocinador para cambiar criterios de valoración post-hoc es real, pero el investigador académico tiene un incentivo reputacional para resistirla).
- Ensayos de ciencia abierta y estudios de ciencia ciudadana.
- Ensayos de reposicionamiento de medicamentos en biotecnológicas pequeñas sin un largo historial en la conducción de ensayos.
- Cualquier ensayo destinado a informar presentaciones regulatorias en las que podrían surgir, en el futuro, argumentos del tipo "nosotros nunca dijimos eso".

## Cuándo NO usar este kit

NO use este kit si:

- El protocolo del ensayo aún está genuinamente en flujo. Pre-registre cuando el protocolo sea definitivo, no antes.
- No puede comprometerse a publicar los resultados independientemente de su dirección. El sello hace que la falta de publicación sea detectable públicamente.
- El ensayo involucra secreto industrial competitivo que le impide hacer público el plan de análisis. El sello convierte el plan de análisis en un registro público permanente; no hay manera de sellar algo de forma privada.
- No cuenta con la aprobación legal y ética del protocolo. El sello registra el protocolo tal como USTED lo selló; no puede ser respaldado retroactivamente por un IRB o comité de ética.

## Cómo bifurcar este kit para un pre-registro real

```bash
# 1. Copy this example
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Replace fictional content with the real trial protocol content.
# Each fact corresponds to a section of a standard pre-registration:
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Update site/index.html to reflect the real trial.

# 4. Seal (BEFORE enrollment begins, BEFORE database lock):
bash build/seal.sh

# 5. Verify locally:
python3 build/verify.py

# 6. Deploy:
#    - Publish the seal URL to your trial sponsor's website AND
#    - Add the IPFS CID to the trial's ClinicalTrials.gov record's
#      "Description" or "References" field, so the registry record
#      cross-references the cryptographic seal.
```

**TEMPORALIDAD CRÍTICA**: el sello debe crearse ANTES de que comience la inclusión de pacientes. Un pre-registro sellado después de incluir al primer paciente es forensicamente mucho más débil. Lo ideal es sellar en el momento de la aprobación del IRB.

## Integración con la infraestructura existente de pre-registro

El kit está diseñado para componerse con la infraestructura existente, no para reemplazarla:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: registre el ensayo en el registro jurisdiccional según corresponda. Luego, en el campo "Description" o "References" del registro, enlace a la publicación sellada con MYRIAM.
- **OSF (Open Science Framework)**: OSF admite el pre-registro con sellos de fecha, pero no con anclaje en Bitcoin. El sello MYRIAM puede adjuntarse como archivo complementario en la página de registro de OSF, ofreciendo tanto sello de fecha como anclaje en Bitcoin.
- **AsPredicted.org**: similar — enlace el sello MYRIAM como URL complementaria.
- **Revistas**: algunas revistas (p. ej., Trials, BMJ Open) aceptan URLs de pre-registro como parte del envío. Incluya la URL del sello MYRIAM junto con la URL del registro.

## Qué obtienen los destinatarios (reguladores, revisores de revistas, meta-analistas)

Un ensayo pre-registrado bajo MYRIAM le ofrece a los revisores:

1. **Prueba criptográfica de que el protocolo fue finalizado en un momento específico.** Los revisores pueden verificar el momento del sello mediante el recibo OTS.
2. **Estabilidad byte a byte del texto del protocolo.** Los revisores que comparen la sección de métodos publicada con el diseño pre-registrado pueden hacerlo carácter por carácter.
3. **Detección del cambio de criterios de valoración.** Un simple diff entre el HECHO 05 sellado y el criterio de valoración primario publicado revela cualquier sustitución.
4. **Detección de desviaciones en el plan de análisis.** Un simple diff entre el HECHO 06 sellado y los métodos estadísticos publicados revela las modificaciones.
5. **Detección del reporte selectivo de subgrupos.** El HECHO 07 sellado contiene todos los subgrupos pre-registrados; cualquier subgrupo en la publicación que no esté en el sello debe etiquetarse como post-hoc.

Esto hace que la revisión sistemática y el meta-análisis sean sustancialmente más fáciles que con la práctica actual.

## Lo que este kit NO es

- No es un sustituto de la aprobación del IRB o del comité de ética.
- No es un sustituto del registro en el registro jurisdiccional.
- No es una garantía de que el ensayo se conducirá según lo planeado.
- No es una vía para anclar el consentimiento informado del paciente u otros documentos éticos (esos requieren su propio mecanismo de sellado).
- No es protección contra la crítica post-publicación del diseño del ensayo.

## Una nota sobre la publicación de resultados negativos

El Compromiso #1 del HECHO 08 ("publicación independientemente de la dirección") es el compromiso con mayor impacto en mortalidad de todo el sello. La supresión histórica de resultados negativos de ensayos (en particular para medicamentos psiquiátricos en adolescentes, oncológicos en poblaciones de edad avanzada y cardiovasculares en mujeres) ha contribuido de manera plausible a miles de muertes evitables a lo largo de décadas, mediante la sobre-prescripción basada en estimaciones de eficacia sesgadas.

Un compromiso sellado de publicar resultados negativos es, por sí solo, una de las medidas de salud pública con mayor apalancamiento que un patrocinador puede tomar. El sello proporciona rendición de cuentas externa para ese compromiso de un modo en que las políticas de publicación auto-policiadas no lo hacen.

## Cierre

El pre-registro de ensayos clínicos bajo MYRIAM implica un trabajo extra reducido para el patrocinador: ~30 minutos para poblar los hechos, ~10 segundos para sellar. La rendición de cuentas que añade es asimétrica: bajo coste para la conducción honesta del ensayo, gran restricción sobre las maniobras post-hoc que han contribuido a los sesgos históricos en la base de evidencia.

Si usted es patrocinador o investigador principal y está considerando este kit, el kit es de dominio público (CC0). Úselo. Modifíquelo. Mejórelo.

## Licencia

Dominio público (CC0). No se requiere atribución.
