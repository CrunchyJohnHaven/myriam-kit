*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de Reproducibilidad Científica

Un ejemplo de myriam-kit listo para usar, destinado a grupos de
investigación, revistas e instituciones centradas en la reproducibilidad
que deseen publicar un manifiesto de reproducibilidad anclado en Bitcoin
y con detección de manipulación, junto a un artículo o un preprint.

## Lo que produce este kit

Una publicación sellada que contiene, para un único estudio:

1. Identificación del estudio (título del artículo, autores, institución,
   financiadores, conflictos de interés)
2. **SHA-256 del archivo de datos crudos** — el conjunto de datos
   canónico
3. **Hash del pipeline de análisis** — script + digest de la imagen
   Docker + dependencias fijadas
4. **Hash del paquete de salida esperado** — lo que un reproductor fiel
   debería obtener
5. Protocolo de reproducción + compromisos de publicación tras los
   resultados
6. Principal(es) firmante(s)

El sello está pensado para la etapa **pre-análisis**: datos congelados,
pipeline finalizado, salida esperada calculada, TODO antes de que se vea
cualquier resultado con el propósito de redactar el artículo.

## Contra qué defiende este kit

**Modos de falla que el sello detecta:**

- **p-hacking**: los cambios post-hoc en el análisis tras ver los
  resultados son detectables mediante la diferencia entre el FACT 04
  sellado y el pipeline publicado.
- **HARKing** (Hypothesizing After Results are Known, formular hipótesis
  después de conocer los resultados): la hipótesis preregistrada en el
  FACT 02 es estable byte a byte.
- **Manipulación de datos post-artículo**: rehashear el archivo de datos
  contra el FACT 03 revela cualquier modificación.
- **Deriva del pipeline**: rehashear el pipeline de análisis contra el
  FACT 04 detecta cambios silenciosos.
- **Manipulación de la autoría**: añadir o eliminar autores en silencio
  después de la publicación se vuelve detectable contra el FACT 02
  sellado.

**Modos de falla NO cubiertos:**

- Fraude en la recolección de datos crudos (el sello ancla los datos en
  el momento del sellado, no de la recolección)
- No reproducibilidad biológica / empírica (el sello ancla solo la
  reproducibilidad computacional)
- Cuestiones de tamaño muestral o de validez poblacional (son preguntas
  de diseño del estudio)
- La veracidad de la afirmación subyacente (el sello ancla lo que se
  afirmó, no si el mundo coincide con la afirmación)

## Cuándo usar este kit

Considere sellar si:

- Es un grupo de investigación que ejecuta un análisis de alto impacto
  (ensayo clínico, evaluación de un sistema de IA, estudio de
  replicación) y desea una integridad forense que vaya más allá de los
  sellos de tiempo de OSF / GitHub
- Es un investigador en etapa temprana que desea protección reputacional
  asimétrica: un pre-análisis sellado significa que futuras críticas del
  tipo "hicieron p-hacking" tendrán un falsador público
- Es editor de una revista o líder de un proyecto de replicación que
  quiere fomentar una preregistración de grado criptográfico para un
  subconjunto de artículos
- Trabaja en un análisis donde los ajustes post-hoc tienen consecuencias
  significativas para el campo (psicología, economía conductual,
  investigación médica)

## Precedente histórico de mortalidad / daño

La relevancia de este kit en términos de mortalidad es indirecta:

- **Irreproducibilidad en investigación sobre células madre / cáncer:**
  varios artículos han causado daño a pacientes a través de ensayos
  clínicos mal orientados. La preregistración sellada del pipeline
  original habría anclado la comparación.
- **Controversia sobre la eficacia del Tamiflu:** la revisión Cochrane
  tomó años en parte porque el acceso a los datos crudos era disputado.
  Hashes de datos sellados en el momento de la publicación habrían
  hecho que las disputas sobre el acceso a los datos fueran resolubles
  de inmediato.
- **Crisis general de irreproducibilidad:** el coste de mortalidad a
  nivel de campo de la investigación biomédica no reproducible es
  significativo (Begley & Ellis 2012 estimaron que >50% de los
  hallazgos preclínicos no eran reproducibles). El anclaje
  criptográfico es una palanca estructural.

## Cómo bifurcar este kit

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRÍTICO: haga esto ANTES de ver cualquier resultado
shasum -a 256 raw_data_v0.tar.gz       # calcula el hash canónico de los datos
shasum -a 256 analysis.py              # hashea su pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # rellénelos con valores reales
bash build/seal.sh                     # selle ANTES de ejecutar el análisis
python3 build/verify.py                # confirme

# Ahora ejecute el análisis. Hashee la salida y confirme que coincide con FACT 05.
# Si no coincide, el pipeline es no determinista; corríjalo y vuelva a sellar.
```

## Integración con la infraestructura académica existente

- **arXiv / bioRxiv / medRxiv**: incluya la URL del sello MYRIAM o el CID
  de IPFS en el resumen o en el material complementario
- **OSF**: adjunte el artefacto del sello al proyecto OSF junto al
  formulario convencional de preregistración
- **AsPredicted**: incluya la URL del sello MYRIAM en el documento de
  preregistración
- **GitHub**: el hash del commit del pipeline de análisis es lo que el
  FACT 04 ancla; GitHub proporciona la fuente, MYRIAM ancla los bytes
- **Zenodo / Figshare / OpenAIRE**: deposite los datos crudos y luego
  selle el hash del depósito; el sello es forensemente más difícil de
  reemplazar en silencio que los metadatos del depósito
- **Materiales complementarios de revistas**: incluya el artefacto del
  sello MYRIAM como archivo complementario en el momento de la
  presentación

## Lo que este kit NO reemplaza

- La aprobación del IRB / comité de ética
- La revisión por pares
- Los estudios de replicación (la reproducibilidad computacional ≠
  reproducibilidad empírica)
- Los acuerdos de acceso a datos para datos sensibles

## Una nota sobre el orden de autoría y el crédito

El sello ancla la LISTA DE AUTORES en el momento del sellado. Las
disputas sobre autoría que surjan tras la publicación pueden evaluarse
contra la lista sellada. Esta es una pequeña palanca de rendición de
cuentas — importante para investigadores en etapa temprana a quienes se
añade o elimina en silencio.

## Nota sobre los límites del sello

Sea claro con usted mismo y con sus lectores: sellar el protocolo
pre-análisis hace que el p-hacking sea **públicamente detectable**, pero
el sello **no puede impedir un análisis poco ético ni reparar la
motivación humana**. Un investigador determinado a violar su protocolo
sellado igualmente puede hacerlo; el sello solo garantiza que la
violación quede en el registro. La sociología de la ciencia —
incentivos de carrera, sesgo de publicación, presión de financiación —
se sitúa por encima de cualquier capa criptográfica. Este kit aporta un
falsador, no una virtud.

## Licencia

Dominio público (CC0). Úselo, modifíquelo, ignórelo, bifúrquelo.
