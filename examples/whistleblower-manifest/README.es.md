*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de sellado de manifiesto para denunciantes

Un ejemplo llave en mano de myriam-kit para denunciantes que enfrentan el
modo de falla específico en el que **la evidencia es enterrada, editada o
disputada por intermediarios situados entre el denunciante y el público**.
Los casos históricos canónicos contra los que esto defiende:

- Boeing 737 MAX (informes internos de seguridad desestimados o enterrados)
- Theranos (preocupaciones sobre pruebas de laboratorio suprimidas durante años)
- Informes de inspectores de la FDA editados después de su presentación
- Frances Haugen / Facebook (un manifiesto sellado habría probado que los
  documentos eran auténticos y existían en el momento alegado)

Contra qué defiende este kit (en términos del protocolo):

- T1–T3 en el [FACT 05](facts/05_threat_model.txt): disputa pública sobre el
  contenido de los documentos, alegaciones de que los documentos no estaban
  sellados en el momento indicado, alegaciones de fabricación retroactiva.
- T9: terceros entregando a los periodistas copias alteradas.

Contra qué **no** defiende este kit:

- Represalias personales contra el denunciante (T7).
- Presión sobre el denunciante para que se retracte (T4, parcialmente mitigado
  por el FACT 07, que hace que la retractación silenciosa sea públicamente
  detectable).
- Acciones legales contra el denunciante por la divulgación misma (T5).
- Desacreditación del carácter del denunciante (T8).
- Intermediarios que silenciosamente abandonan la historia (T10).

Si usted es un denunciante que está considerando usar este kit, **lea este
README completo primero**. El protocolo es una herramienta. El protocolo no
es un sustituto del asesoramiento legal, de un periodista, de un regulador o
de una disciplina cuidadosa de seguridad operativa.

## Qué produce este kit

Un *manifiesto* criptográficamente sellado de la evidencia (no la evidencia
en sí) que prueba que:

1. Los bytes específicos de cada archivo de evidencia existían en el momento
   del sellado.
2. El sellado ocurrió en un momento específico o antes de él (mediante
   atestación OTS en Bitcoin).
3. La procedencia, la alegación, el modelo de amenazas, el protocolo del
   destinatario y el compromiso de no-retractación-silenciosa fueron
   declarados conjuntamente.

Los documentos subyacentes permanecen en su posesión hasta que usted los envíe
a un destinatario. Los destinatarios verifican que recibieron los mismos
bytes que usted selló.

## Cuándo usar este kit

Debería considerar sellar un manifiesto **antes** de transmitir evidencia a
un periodista, regulador o abogado, si todas las condiciones siguientes son
verdaderas:

- Posee evidencia en forma digital (PDFs, correos electrónicos, imágenes, etc.)
  que desea preservar como auténtica byte a byte.
- Anticipa que los intermediarios podrían alterar, disputar o enterrar la
  evidencia.
- Puede mantener los documentos subyacentes en su posesión hasta el momento
  de la transmisión.
- Puede publicar el manifiesto públicamente **sin** revelar el contenido de
  los documentos (sólo los hashes son públicos).
- Ha sopesado los riesgos de volverse públicamente identificable como
  denunciante (el campo del principal firmante). Si actúa de forma anónima,
  use un seudónimo de manera consistente en todas las publicaciones relacionadas.
- Ha consultado a un abogado sobre la legislación de protección al
  denunciante en su jurisdicción.

## Cuándo NO usar este kit

NO use este kit si:

- Los documentos mismos contienen información personal sobre terceros
  (pacientes, clientes, empleados) que no debería convertirse en pública
  hashable. Hashee una versión redactada, no el original.
- El solo acto de publicar el manifiesto identificaría al denunciante de una
  manera a la que él no ha consentido.
- Todavía no ha consultado a un abogado. El protocolo es una herramienta;
  la legislación de protección al denunciante es específica de cada
  jurisdicción y vive fuera del protocolo.
- Podría querer retractarse más adelante de cualquier alegación individual.
  El sello es permanente; nuevas correcciones selladas son la única forma
  honesta de revisar.
- Está haciendo esto bajo coacción o presión de tiempo. El protocolo
  amplifica la coerción; la compuerta de rechazo (myriam-kit `SPEC §8`) se
  aplica a los denunciantes igual que a los publicadores.

## Cómo bifurcar este kit para una divulgación real

```bash
# 1. Copie este ejemplo a un directorio nuevo
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Elimine el contenido ficticio; sustitúyalo por sus hechos reales.
# Cada archivo bajo facts/ es un hecho. Lea cada uno y sustitúyalo.
$EDITOR facts/01_example_notice.txt   # cámbielo por una verdadera declaración de portada
$EDITOR facts/02_provenance.txt       # procedencia real de su evidencia
$EDITOR facts/03_evidence_manifest.txt # hashee sus documentos reales y lístelos
$EDITOR facts/04_allegation_summary.txt # su alegación real
$EDITOR facts/05_threat_model.txt     # sus respuestas esperadas reales
$EDITOR facts/06_recipient_protocol.txt # ajústelo a su destinatario
$EDITOR facts/07_no_retraction_commitment.txt # su declaración de no-retractación
$EDITOR facts/08_signing_principal.txt # su identidad de firma real (o seudónimo)

# 3. Actualice site/index.html para reflejar los hechos reales.
# El script seal.sh NO rellena el HTML automáticamente; la edición manual
# es el paso de revisión humana.
$EDITOR site/index.html

# 4. Selle.
bash build/seal.sh
# Salidas: merkle_root.txt, merkle_root.txt.ots, CID de IPFS

# 5. Verifique localmente.
python3 build/verify.py

# 6. Publique el manifiesto (NO los documentos) en cualquiera de los siguientes:
#    - Un host estático que usted controle (Cloudflare Pages, GitHub Pages, etc.)
#    - La red IPFS en el CID impreso
#    - Ambos (recomendado)

# 7. Por separado, transmita los documentos subyacentes al destinatario
#    a través de un canal seguro de su elección (Signal, SecureDrop, etc.).
#    El destinatario verifica los hashes de los archivos contra su manifiesto.
```

## Cálculo de hashes para los archivos de evidencia reales

Para hashear un archivo de documento con SHA-256:

```bash
shasum -a 256 my_document.pdf
```

Los primeros 64 caracteres hexadecimales son el SHA-256. Póngalo en el manifiesto.

Puede hashear varios archivos a la vez:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Eso le da los datos para `facts/03_evidence_manifest.txt`.

## Notas de seguridad operativa

El protocolo MYRIAM NO proporciona seguridad operativa. Proporciona
*durabilidad probatoria*. Aún necesita:

- Un canal de comunicación seguro con su abogado
  ([Signal](https://signal.org/), en persona, o el canal seguro establecido
  por su abogado)
- Un lugar de almacenamiento seguro para los documentos subyacentes
  (cifrados en reposo, no en servicios en la nube a los que su empleador
  pueda acceder)
- Un dispositivo limpio para el sellado (un portátil personal no asociado a
  cuentas del empleador; preferentemente uno utilizado únicamente para este fin)
- Una red limpia para la publicación (no la red de su empleador, no su IP
  doméstica si su empleador pudiera citar a su proveedor de internet)

Lecturas recomendadas sobre seguridad operativa para denunciantes:

- [Documentación de SecureDrop de The Intercept](https://securedrop.org/)
- [Recursos de la Freedom of the Press Foundation](https://freedom.press/)
- [Guía de autodefensa contra la vigilancia de la EFF](https://ssd.eff.org/)

Consúltelos ANTES de iniciar el proceso de sellado. El protocolo no protege
contra malas decisiones de opsec tomadas antes de que se invoque el protocolo.

## Qué deben saber los destinatarios

Envíe a los destinatarios este README junto con el manifiesto sellado. El
manifiesto mismo contiene el protocolo del destinatario (FACT 06), pero el
README amplía el rol del destinatario:

- **Periodistas**: verifiquen primero la integridad del propio manifiesto.
  Luego soliciten los documentos por un canal seguro separado. Verifiquen
  que el SHA-256 de cada documento coincida con el manifiesto antes de
  publicarlo. NO publiquen los documentos sin el consentimiento del
  denunciante; sí publiquen la existencia del manifiesto sellado y la
  conclusión de su verificación.
- **Reguladores**: el mismo proceso de verificación. El manifiesto sellado
  junto con los documentos coincidentes es la forma probatoria más sólida
  disponible fuera de una recolección formal con cadena de custodia.
- **Abogados**: el manifiesto sellado proporciona un anclaje forense para
  la existencia de los documentos en el momento indicado. Si satisface o no
  las reglas probatorias de alguna jurisdicción específica es algo que les
  corresponde determinar.

## Lo que este kit NO es

- No es un sustituto del asesoramiento legal.
- No es una garantía de que alguien actuará sobre su divulgación.
- No es una protección contra represalias.
- No es una autenticación del contenido de los documentos (sólo de sus
  bytes en el momento del sellado).
- No es una forma de comunicarse anónimamente con nadie — el sello es
  público; si el nombre de su principal firmante es real, usted está
  identificado. Incluso con un seudónimo, un manifiesto sellado puede usarse
  para identificar a un denunciante si se filtran metadatos; el protocolo no
  puede defender contra la identificación del principal por otros medios.

## Cierre

Un manifiesto sellado es algo pequeño. Es un flujo de bytes que prueba que
un conjunto mayor de flujos de bytes existió en una forma particular en un
momento particular. Esa pequeñez es su fortaleza: hace una sola cosa, y la
hace a lo largo de toda la vida útil de la cadena de bloques de Bitcoin.

Si está leyendo esto porque está considerando convertirse en denunciante,
por favor: hable primero con un abogado. Use las guías de seguridad
operativa indicadas más arriba. Después, si y sólo si todas esas
consideraciones previas están en orden, considere este kit como la columna
vertebral criptográfica de su divulgación. La criptografía es la parte fácil.
Todo lo que está aguas arriba de la criptografía es donde vive el riesgo real.

## Licencia

Dominio público (CC0). Bifúrquelo. Mejórelo. Úselo sin pedir permiso.
