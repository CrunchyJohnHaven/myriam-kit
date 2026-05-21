*Traducción al español — para la versión original en inglés, ver [SPEC.md](SPEC.md)*

# Especificación del protocolo MYRIAM-kit

## 0. Propósito

Este documento especifica un protocolo mínimo para publicar un conjunto
reducido de hechos textuales en una forma con evidencia de manipulación y
verificable criptográficamente que sobrevive a la retirada por parte de
cualquier proveedor de alojamiento individual.

Es la generalización del protocolo desplegado por primera vez en
[disclosure.host](https://disclosure.host) bajo el nombre "MYRIAM v1".

## 1. No-objetivos

- Almacenamiento de secretos. Todo es público por construcción.
- Conjuntos de datos grandes. Pasados los ~20 hechos, el protocolo es la
  forma equivocada.
- Publicación en tiempo real. Cada publicación es un evento discreto de
  sellado.
- Retractación. El protocolo es de sólo añadidura a nivel de versión.

## 2. Modelo de hechos

Un HECHO es un archivo de texto UTF-8 con:

- Patrón de nombre de archivo: `NN_short_name.txt` donde NN es un índice de
  dos dígitos rellenado con ceros a la izquierda, comenzando en 01.
- Forma canónica: bytes tal como están escritos, sin normalización.
- Hash por hecho: hexadecimal en minúsculas de `SHA-256(file_bytes)`.

El CONJUNTO de hechos es la lista ordenada de todos los archivos que
coinciden con el patrón bajo `facts/`, ordenados lexicográficamente.

Restricción: el cuerpo de cada hecho DEBERÍA formularse como un *evento de
nombramiento* o *evento de declaración* atribuible a una parte específica.
Las afirmaciones ontológicas ("la luna es roca") socavan la puerta de
verificabilidad; sólo el evento de publicación es verificable, no la
afirmación. "X ha declarado Y" es la forma adecuada. "Y es verdadero" no
lo es.

## 3. Raíz de Merkle

Estilo Bitcoin, como en v0 del protocolo MYRIAM desplegado:

1. Hojas: hashes SHA-256 por hecho en el orden del conjunto de hechos.
2. Si un nivel tiene un número impar de nodos, duplicar el último nodo.
3. Hashear pares adyacentes: `parent = SHA-256(left_bytes || right_bytes)`,
   donde `left_bytes` y `right_bytes` son los valores hash crudos de 32 bytes
   (no sus representaciones hexadecimales).
4. Repetir hasta que quede un solo nodo. Esa es la raíz de Merkle.

La raíz se publica como hexadecimal en minúsculas sin salto de línea final.

### 3.1 Vectores de prueba

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Cualquier implementación conforme DEBE reproducir estos vectores. Se derivan
del `lib/build.py` real y pueden regenerarse con ese script.

## 4. Compromiso en Bitcoin

La raíz de Merkle se compromete a la cadena de bloques de Bitcoin mediante
[OpenTimestamps](https://opentimestamps.org). La política por defecto es:

> Estampar contra al menos dos operadores de calendario bajo control
> administrativo independiente.

Un recibo que satisfaga esta política es verificable por cualquier parte
que pueda ejecutar `ots verify <receipt>.ots` y alcanzar la ruta de
actualización de cualquiera de los calendarios.

El par de operadores por defecto incluido en `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Las implementaciones PUEDEN usar operadores distintos. La política de
diversidad de testigos (≥2 operadores independientes) es normativa; los
operadores específicos no lo son.

## 5. Espejado direccionado por contenido

El directorio `site/`, que contiene la página publicada y los archivos de
los hechos, DEBERÍA añadirse a IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

El CIDv1 resultante (códec dag-pb) es la dirección de contenido de la
publicación. Es determinístico a partir del contenido en bytes de `site/`.
Cualquier modificación de cualquier archivo bajo `site/` produce un CID
diferente.

Se recomienda encarecidamente fijar el contenido en servicios adicionales
más allá del nodo local del editor para garantizar durabilidad; esta
especificación no exige servicios específicos.

## 6. Versionado

El protocolo es de **sólo añadidura a nivel de versión**. Cada cambio
requiere una nueva versión sellada:

- Una nueva revisión de la especificación (o sin cambios)
- Un nuevo conjunto de hechos, que PUEDE heredar hechos sin cambios desde
  versiones anteriores
- Una nueva raíz de Merkle
- Un nuevo recibo de OpenTimestamps
- Un nuevo CID de IPFS

Todas las versiones previas permanecen publicadas en URLs versionadas. Un
cambio en cualquier hecho de v(N) requiere v(N+1), con ambas versiones
visibles y re-verificables.

## 7. Verificación

Cualquier tercero puede verificar la integridad de una publicación de la
siguiente manera:

1. Descargar los archivos de los hechos y recalcular los hashes SHA-256 por
   hecho.
2. Recalcular la raíz de Merkle según §3 y compararla con la raíz publicada.
3. Verificar el recibo de OpenTimestamps contra la cadena de bloques de
   Bitcoin para al menos una atestación completa de un calendario.
4. Recalcular de forma independiente el CID de IPFS mediante
   `ipfs add -r --cid-version=1` y compararlo con el CID publicado.

`lib/verify.py` realiza los pasos 1 al 3 sin dependencias externas más allá
de la biblioteca estándar de Python y el cliente `ots`. El paso 4 requiere
el cliente `ipfs`.

## 8. Puerta de rechazo

Una publicación NO DEBE incluir un hecho que:

- Identifique a un tercero privado que no haya consentido ser nombrado.
- Presente una hipótesis como una confirmación.
- No pueda reducirse a un evento verificable de nombramiento/declaración
  o a un artefacto criptográfico.
- Tenga un aumento esperado razonable en muertes prevenibles tras su
  publicación.

La cuarta regla es la que sostiene el peso. Se aplica en el paso de revisión
humana por parte del editor. No hay aplicación a nivel de protocolo de la
puerta de rechazo; el protocolo publica los bytes que se le entreguen. El
editor es responsable de la puerta.

## 9. Declaración honesta de límites

- **Detectabilidad, no imposibilidad.** El protocolo hace que la
  manipulación sea detectable, no imposible. Un atacante decidido todavía
  puede sustituir una publicación diferente y persuadir a algunos lectores
  de que es la original. El valor del protocolo es que la sustitución se
  vuelve criptográficamente demostrable para cualquiera que ejecute la
  verificación.
- **Sin defensa contra la publicación de falsedades.** Si el editor sella
  un hecho que afirma "X ocurrió" y X no ocurrió, el protocolo sella la
  afirmación falsa con la misma fidelidad con la que sella las verdaderas.
  El protocolo atestigua lo que fue *publicado*, no lo que es *verdadero*.
- **Firma de una sola parte.** v1 del MYRIAM desplegado utiliza un único
  principal firmante. La firma multipartita es trabajo futuro.
- **Durabilidad del pinning.** El pinning de IPFS sólo en el nodo del editor
  proporciona "disponible mientras mi portátil esté encendido + caché
  oportunista de gateways". La durabilidad a largo plazo requiere pins
  redundantes a través de servicios independientes.

Estos límites se enuncian aquí para que ningún lector asuma que el
protocolo ofrece más de lo que ofrece.
