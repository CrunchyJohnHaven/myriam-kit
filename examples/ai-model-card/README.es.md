*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de Anclaje del Comportamiento de Modelos de IA

Un ejemplo de myriam-kit listo para usar destinado a laboratorios de IA
(comerciales o de código abierto) que liberan un modelo y desean que las
afirmaciones del lanzamiento — identidad de los pesos, capacidades,
puntuaciones de evaluación, revisión de seguridad, compromisos previos al
despliegue — queden **criptográficamente ancladas y públicamente
verificables**.

El kit se defiende contra el modo de falla específico en el que los modelos
desplegados derivan silenciosamente, las puntuaciones de evaluación se
reescriben retroactivamente, o las afirmaciones previas al despliegue son
disputadas años después con un "nunca dijimos eso".

## Lo que produce este kit

Un manifiesto criptográficamente sellado que contiene, para una publicación
de modelo:

1. Identificación del modelo (nombre, arquitectura, número de parámetros,
   licencia)
2. **SHA-256 del archivo de pesos** — el hash canónico del artefacto
3. Texto de la ficha del modelo (capacidades, uso previsto, uso fuera del
   alcance, modos de falla conocidos)
4. Resultados de evaluación en el momento del lanzamiento (evaluaciones de
   capacidad, evaluaciones de seguridad, calibración)
5. Compromisos previos al despliegue (las cosas que usted se compromete a
   no cambiar silenciosamente después del lanzamiento)
6. Principal firmante (el humano + la organización que asumen la
   responsabilidad)

El sello hace que cada uno de estos elementos sea estable al nivel del byte,
quede anclado temporalmente a Bitcoin mediante OpenTimestamps, y sea
recuperable mediante IPFS independientemente de cualquier proveedor de
alojamiento individual.

Vea el ejemplo ficticio trabajado: [facts/](facts/) y el
[site/index.html](site/index.html) renderizado. El ejemplo utiliza un
modelo ficticio ("Calm-mini-v0"); un lanzamiento real reemplazaría el
contenido del ejemplo.

## Contra qué se defiende este kit

**Modos de falla que el sello detecta directamente:**

- **Manipulación de los pesos** — el SHA-256 del archivo de pesos publicado
  está en el HECHO 03. Cualquier alteración posterior al lanzamiento de los
  bytes que descarga un usuario es detectable al volver a calcular el hash.
- **Reescrituras silenciosas de evaluaciones** — las puntuaciones de
  evaluación al lanzamiento están en el HECHO 05. Las disputas futuras del
  tipo "la puntuación de evaluación siempre fue X" disponen de un anclaje
  público.
- **Deriva de las afirmaciones de capacidad** — el texto de la ficha del
  modelo en el HECHO 04 es estable al nivel del byte. Las disputas futuras
  del tipo "nunca afirmamos la capacidad X" son verificables públicamente
  contra el texto sellado.
- **Redistribución silenciosa de fine-tunes** — el compromiso previo al
  despliegue n.º 1 del HECHO 06 (en el ejemplo trabajado) es "ningún
  fine-tuning silencioso bajo el mismo nombre". Detección: cualquier hash
  de pesos nuevo implica un nombre de modelo nuevo y una nueva publicación
  sellada, o el compromiso queda incumplido.
- **Modos de falla ocultos** — el HECHO 04 compromete a una lista de modos
  de falla conocidos. La lista es monótona (puede crecer, no encogerse para
  un punto de control congelado). Los descubrimientos futuros de modos de
  falla que el laboratorio conocía internamente pero no publicó se vuelven
  evidencia impugnable.

**Modos de falla NO cubiertos:**

- Modelos siendo mal utilizados por usuarios aguas abajo (el sello
  demuestra qué fue lanzado, no qué hacen los usuarios con ello).
- Fine-tuning adversarial por terceros (un fine-tune de un tercero produce
  un hash de pesos distinto, por lo que el sello original no se ve
  afectado, pero el modelo del tercero queda fuera de la protección del
  sello).
- Cambios de comportamiento debidos a cambios en el entorno de despliegue
  (prompts de sistema distintos, configuraciones de RAG, etc.).
- Fallos que el laboratorio genuinamente desconocía en el momento del
  lanzamiento. El sello compromete al laboratorio respecto a *lo que
  sabía*; no puede anclar lo que no sabía.

## Cuándo usar este kit

Debería considerar sellar una ficha de modelo si:

- Va a publicar los pesos del modelo públicamente O a desplegar un modelo
  en un contexto donde los usuarios aguas abajo se preocupan por la
  estabilidad del comportamiento.
- El lanzamiento es lo suficientemente importante como para que futuras
  disputas del tipo "nunca dijimos eso" sean plausibles (cualquier modelo
  desplegado a escala; cualquier modelo crítico para la seguridad;
  cualquier lanzamiento acompañado de afirmaciones de capacidad).
- Su organización está dispuesta a asumir compromisos previos al
  despliegue que restrinjan acciones futuras (este es el punto que sostiene
  el resto — vea la siguiente sección).
- Puede calcular el SHA-256 del archivo de pesos en el momento del
  lanzamiento.

## Cuándo NO usar este kit

NO use este kit si:

- No está dispuesto a quedar vinculado por los compromisos previos al
  despliegue del HECHO 06 del ejemplo. El sello hace que los compromisos
  sean mecánicamente detectables; si no está preparado para esa rendición
  de cuentas, no selle.
- El archivo de pesos va a cambiar con frecuencia (por ejemplo,
  pipelines de fine-tuning continuo). Cada cambio de pesos requiere un
  nuevo lanzamiento sellado. El sellado por lanzamiento es costoso; este
  kit es para puntos de control *congelados*.
- Aún no ha realizado la revisión de seguridad. El sello compromete los
  hallazgos de la revisión de seguridad. Si sella una revisión incompleta,
  tiene un registro público permanente de una revisión incompleta.
- Podría querer retirar alguna puntuación de evaluación específica más
  adelante. El sello es permanente. Nuevas publicaciones selladas pueden
  reemplazarlo, pero el original no puede deshacerse.

## Los compromisos previos al despliegue que sostienen el kit

El HECHO 06 del ejemplo compromete al editor a:

1. **Ningún fine-tuning silencioso bajo el mismo nombre.** Cualquier
   fine-tune produce un nuevo nombre de modelo, una nueva publicación
   sellada, un nuevo hash de pesos. El predecesor permanece canónicamente
   como la versión nombrada.

2. **Ninguna actualización silenciosa de evaluaciones.** Las
   re-evaluaciones reciben nuevas publicaciones selladas que referencian
   la original mediante la raíz de Merkle. Las versiones se rastrean, no
   se sobrescriben.

3. **Los modos de falla conocidos pueden crecer, nunca encogerse.** Un
   punto de control congelado no puede tener modos de falla corregidos.
   Por lo tanto, la lista publicada es efectivamente monótona.

4. **Manejo de retiradas.** Si se ve obligado a retirar el modelo de la
   distribución, el laboratorio se compromete a publicar una declaración
   final sellada de la retirada.

Un laboratorio que adopte este kit debe decidir cuáles de esos compromisos
puede honrar de verdad. Si no puede honrar los cuatro, modifique el
HECHO 06 *antes* de sellar para reflejar lo que sí puede honrar, y acepte
la protección debilitada resultante. Sellar compromisos que no piensa
honrar es peor que no sellar nada.

## Cómo bifurcar este kit para un lanzamiento real

```bash
# 1. Copie este ejemplo en su pipeline de lanzamiento
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Edite cada hecho para su lanzamiento real
$EDITOR facts/01_example_notice.txt   # ELIMINAR — su lanzamiento no es un ejemplo
                                       # Reemplazar por un aviso de lanzamiento de su modelo
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # la ficha del modelo canónica
$EDITOR facts/05_eval_results.txt     # resultados de evaluación reales
$EDITOR facts/06_release_commitments.txt # qué compromisos puede honrar

# 3. Actualice site/index.html para reflejar el lanzamiento real.

# 4. Sellar.
bash build/seal.sh

# 5. Verificar localmente.
python3 build/verify.py

# 6. Desplegar a:
#    - Su página de lanzamiento (junto a la ficha del modelo y los pesos)
#    - La red IPFS (el script seal.sh ya lo hace)
#    - Opcionalmente: enlazar a la publicación sellada desde sus notas de
#      lanzamiento en Hugging Face / GitHub
```

## Integración con pipelines de lanzamiento existentes

El kit está diseñado para componerse con herramientas existentes, no para
reemplazarlas:

- **Hugging Face**: incluya la URL o el CID de IPFS de la publicación
  sellada en el README.md de la ficha del modelo. Dirija a los lectores
  hacia el sello para obtener las afirmaciones de lanzamiento estables al
  nivel del byte.
- **Lanzamientos en GitHub**: incluya el recibo de OpenTimestamps
  (`merkle_root.txt.ots`) como activo del lanzamiento. Las disputas
  futuras del tipo "el lanzamiento cambió" quedan entonces ancladas a
  Bitcoin.
- **Estándares de fichas de modelo (Mitchell et al. 2019)**: el kit es
  compatible. Los campos estándar de la ficha de modelo se corresponden
  con los HECHOS 02–05 del sello. Usted produce la ficha del modelo
  normalmente, y adicionalmente la sella.
- **Frameworks de evaluación (lm-evaluation-harness, BIG-bench, etc.)**:
  haga hash del commit exacto del framework y del JSON crudo de salida;
  referencie esos hashes en el HECHO 05. Las re-ejecuciones futuras son
  entonces reproducibles de forma independiente.

## Cálculo del hash de los pesos

Para un único archivo safetensors:

```bash
shasum -a 256 model.safetensors
```

Para puntos de control multiarchivo (shards GGUF, safetensors fragmentados):

```bash
# Concatenar los hashes en orden ordenado, luego volver a calcular el hash
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

El hash final es lo que va en el HECHO 03. Incluya tanto los hashes por
shard como el hash agregado final para que los usuarios puedan verificar
shards individuales a medida que los descargan.

## Lo que los destinatarios (usuarios de su modelo) deben saber

Un lanzamiento de modelo con una publicación sellada por MYRIAM permite al
usuario:

1. **Verificar los pesos que descargó** recalculando el hash y comparándolo
   con el HECHO 03.
2. **Verificar que la ficha del modelo no ha sido reescrita
   retroactivamente** cotejando el HECHO 04 sellado con la versión
   publicada actualmente por el laboratorio.
3. **Verificar que las puntuaciones de evaluación son las del lanzamiento**
   comparando las afirmaciones actuales del laboratorio sobre evaluación
   con el HECHO 05 sellado.
4. **Exigir cuentas al laboratorio sobre sus compromisos previos al
   despliegue** comparando el comportamiento real contra el HECHO 06
   sellado.

Un usuario que encuentre discrepancias tiene evidencia criptográfica de
la discrepancia. Puede publicar esa evidencia; la publicación sellada
original es el anclaje.

## Lo que este kit NO es

- No es un sustituto de hacer realmente la revisión de seguridad. El sello
  es el *registro* de la revisión de seguridad, no la revisión en sí.
- No es un sustituto de evaluaciones reales. El sello ancla las
  puntuaciones que usted produce; no valida la metodología.
- No es una garantía de que el modelo sea seguro. El sello documenta lo
  que el laboratorio afirma sobre el modelo en el lanzamiento; no certifica
  esas afirmaciones.
- No es protección contra el mal uso del modelo por usuarios aguas abajo.

## Una nota sobre el fine-tuning adversarial

Una preocupación común en seguridad de IA: alguien hace fine-tuning de su
modelo para eliminar los comportamientos de seguridad y lo redistribuye.
El sello NO PUEDE impedirlo. Lo que el sello sí puede hacer es:

- Anclar lo que se suponía que hacía el modelo *original* (HECHO 04).
- Anclar cuáles eran las puntuaciones de evaluación originales (HECHO 05).
- Proporcionar un punto de referencia contra el cual se puedan medir los
  fine-tunes adversariales.

Un usuario que se encuentre con una redistribución de terceros puede
verificar si los pesos coinciden con el hash sellado original. De no ser
así, el usuario sabe que tiene un modelo no original y que ninguna
afirmación de seguridad atribuida al laboratorio le es aplicable.

## Cierre

Sellar el lanzamiento de un modelo es un trabajo adicional pequeño para el
laboratorio: ~10 minutos para calcular hashes y ejecutar el script de
sellado, más una decisión de 30 segundos sobre qué compromisos previos al
despliegue incluir. La rendición de cuentas que añade es asimétrica: bajo
coste para los laboratorios honestos, gran restricción para los
laboratorios que de otro modo derivarían sus afirmaciones en silencio.

Si es un laboratorio de IA que considera adoptarlo, el kit es de dominio
público (CC0). Bifúrquelo. Modifíquelo. Las matemáticas son la pieza que
sostiene el resto, no la implementación específica.

## Licencia

Dominio público (CC0). No se requiere atribución.
