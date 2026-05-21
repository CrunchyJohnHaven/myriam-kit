*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Un pequeño conjunto de herramientas para publicar un conjunto reducido de hechos de tal forma que:

- Cualquier cambio en cualquier hecho sea detectable públicamente (árbol de Merkle)
- El estado en el momento de la publicación sea verificable contra la cadena de bloques de Bitcoin (OpenTimestamps)
- El contenido sobreviva a la retirada por parte de cualquier proveedor de alojamiento individual (IPFS)
- El conjunto completo pese menos de 100 KB y sea verificable con ~50 líneas de Python

Esto no es una cadena de bloques. No hay token. No hay un mecanismo de consenso en el que participar. No hay DAO. La herramienta es `sha256sum` + `ots` + `ipfs`, unidos mediante buenas convenciones de nomenclatura.

Lleva el nombre del protocolo MYRIAM, instanciado por primera vez en [disclosure.host](https://disclosure.host) el 21 de mayo de 2026. Esa página contiene seis hechos, una raíz de Merkle y una atestación de Bitcoin. Este kit es la generalización de ese patrón.

## Estado

- v0: funciona en macOS con Python 3.10+, Homebrew y conexión a internet. Linux no probado, pero debería funcionar. Windows: traiga un WSL.
- Dominio público (CC0). Úselo, bifúrquelo, incorpórelo a su repositorio, nunca lo acredite. El propósito no es el crédito.

## Qué se puede hacer con esto

El patrón encaja en cualquier situación donde un conjunto reducido de hechos necesite ser:

- **Publicable** ante una audiencia amplia mediante HTTP simple
- **Duradero** — los lectores dentro de 30 años deberían seguir pudiendo verificarlo
- **Evidencia de manipulación** — cualquier cambio debe ser detectable, no necesariamente prevenible
- **Sin necesidad de confianza** — ningún lector tiene que confiar en quien publica (sólo en las matemáticas)

Casos de uso concretos en [docs/USE_CASES.md](docs/USE_CASES.md). La lista breve:

| Dominio | Hechos sellados |
|---|---|
| Salud pública | Resultados de pruebas de lotes de vacunas, hitos de ensayos clínicos |
| Elecciones | Totales de recuento a nivel de mesa en el momento de la certificación |
| Seguridad en IA | Hash de los pesos del modelo + ficha del modelo + puntuaciones de evaluación en el momento del lanzamiento |
| Periodismo | Manifiesto de documentos fuente (sólo hashes) para filtraciones de denunciantes |
| Ciencia | Hash de los datos crudos + hash del script de análisis + resultado declarado |
| Tribunales | Hashes de pruebas digitales en el momento de su obtención |
| Compras públicas | Raíces selladas de datos del gasto público |

Lo que estos casos tienen en común: un conjunto reducido de hechos, un fuerte requisito de durabilidad, múltiples partes que no confían entre sí, y un presupuesto de almacenamiento mínimo. Esa es exactamente la forma para la que esta herramienta fue diseñada.

## Lo que NO hace

- **Almacenar secretos.** Todo lo que coloque en `facts/` es público. El protocolo es para publicar, no para ocultar.
- **Escalar a grandes conjuntos de datos.** El árbol de Merkle escala bien; la atención del lector no. Pasados los ~20 hechos, la página se vuelve ilegible. Si quiere sellar un millón de registros, hashéelos fuera de la página y coloque la raíz de Merkle de ese subárbol en un solo hecho.
- **Defender contra retractaciones.** El objetivo central es que no pueda cambiar lo que ya selló. Si pudiera querer retractarse de una afirmación más adelante, no la selle.
- **Convencer a un escéptico decidido.** Un escéptico decidido no va a ejecutar `ipfs add -r --cid-version=1 -Q facts/`. Sin embargo, sí le acusará de haber fabricado toda la configuración. No hay defensa a nivel de protocolo contra ese segundo modo de falla. No hay defensa a nivel de protocolo contra nada que dependa de la motivación humana en lugar de las matemáticas.

## Cómo usarlo

Recorrido de cinco minutos en [docs/QUICKSTART.md](docs/QUICKSTART.md).
Especificación completa del protocolo en [docs/SPEC.md](docs/SPEC.md).
Modelo de amenazas en [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Comparación con sistemas adyacentes (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave, etc.) en [docs/COMPARISON.md](docs/COMPARISON.md).

## Cómo verificar la publicación de otra persona

Tres opciones, en orden de accesibilidad:

1. **Navegador**: abra [`lib/verify.html`](lib/verify.html) en cualquier navegador moderno. Pegue la URL de la publicación. Haga clic en verificar. Usa `crypto.subtle` para el hashing — sin instalación, sin backend, sin telemetría. El paso de atestación de Bitcoin sigue requiriendo una herramienta de línea de comandos (vea el paso 7 en la página del verificador).
2. **Python**: `python3 lib/verify.py` desde dentro del directorio de la publicación. Sólo biblioteca estándar; requiere `ots` para la verificación de Bitcoin.
3. **Desde cero**: lea [`docs/SPEC.md §3`](docs/SPEC.md) y reimpleméntelo. El algoritmo de Merkle ocupa menos de 30 líneas en cualquier lenguaje.

## Ejemplos trabajados

Seis kits de ejemplo de calidad de producción se distribuyen con el conjunto de herramientas. Cada uno está sellado, estampado con OTS, anclado en IPFS, e incluye un README de adopción que explica cuándo bifurcarlo para un caso del mundo real y contra qué modos de falla defiende.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) — para el modo de falla tipo Boeing 737 MAX / Theranos / informe de inspector de la FDA en el que la evidencia es enterrada o alterada por intermediarios.
- [`examples/ai-model-card/`](examples/ai-model-card/) — para laboratorios de IA que lanzan modelos, con compromisos previos al despliegue que se vuelven mecánicamente detectables en lugar de verbales.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — para patrocinadores de ensayos clínicos, detectando el cambio de criterios de valoración post-hoc y los reportes selectivos (modos de falla tipo Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — para fabricantes de vacunas y autoridades de control de calidad, anclando los resultados de las pruebas de liberación y los compromisos de retiro del mercado.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — para grupos de investigación, anclando la tripleta (datos, pipeline, resultado esperado) ANTES del análisis, para hacer que el p-hacking y el HARKing sean detectables públicamente.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) — para juntas de escrutinio a nivel municipal y autoridades electorales, anclando los recuentos certificados en el momento de la certificación, de modo que las revisiones silenciosas posteriores a la certificación se vuelvan detectables públicamente.

Lea uno de estos antes de escribir el suyo propio. La coincidencia más cercana a su caso de uso suele ser la bifurcación adecuada para empezar.

## Inicio rápido

La versión de una sola línea:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Por qué existe esto

Las primitivas criptográficas (árboles de Merkle, OpenTimestamps, IPFS) han sido maduras durante años. Lo que faltaba era el pegamento más pequeño posible — un kit que pudiera incorporarse a un proyecto secundario y obtener un artefacto publicable y sellado en una tarde, sin tener que configurar infraestructura, sin tener que aprender protocolos, sin escribir una sola línea de código más allá de los hechos mismos.

La mayoría de las herramientas de publicación criptográfica suponen que quiere ser operador de un nodo. Esta supone que quiere publicar seis archivos de texto y nunca más pensar en criptografía.

## Influencias y trabajos previos

- [Sigsum](https://www.sigsum.org/) — logs de transparencia para firmas
- [Sigstore](https://www.sigstore.dev/) — integridad de la cadena de suministro de software
- [Certificate Transparency](https://certificate.transparency.dev/) — logs de certificados TLS
- [OpenTimestamps](https://opentimestamps.org/) — sello temporal en Bitcoin
- [IPFS](https://ipfs.tech/) — almacenamiento direccionado por contenido
- [The CALM protocol](https://disclosure.host) — el marco de publicación principal-protector en el que se redactó la primera instancia (MYRIAM en disclosure.host)

myriam-kit es el más pequeño de estos. Está más cerca en espíritu de un pipeline de Unix que de un sistema.

## Una nota sobre el nombre

El protocolo MYRIAM recibe su nombre de la Prueba de Myriam de John Bradley, una prueba lógica enunciada acerca del primer punto de contacto con una inteligencia no humana. El protocolo no depende de que esa prueba sea verdadera. El protocolo funciona para cualquier conjunto reducido de hechos, sea cual sea; simplemente ocurrió que se desplegó por primera vez para publicar seis hechos que incluyen una afirmación sobre la divulgación de la presencia extraterrestre.

Si bifurca este kit para sellar lotes de vacunas o recuentos electorales, el hecho de que originalmente se haya utilizado para publicar una afirmación sobre el contacto extraterrestre es irrelevante para usted. A las matemáticas no les importa.

Dicho esto: si SÍ lo usa para publicar una afirmación sobre contacto extraterrestre, el protocolo ha sido probado en combate en ese campo específico. El README del primer despliegue de MYRIAM declara explícitamente que es la obra artística de una persona LLM llamada Calm, no una comunicación de ninguna parte extraterrestre. Probablemente usted debería hacer lo mismo. De lo contrario, los lectores asumirán lo peor sobre su estado mental.

## Mantenido por

Nadie todavía. Dominio público. Bifúrquelo. Mejórelo. Lleve el protocolo hacia adelante sin pedir permiso.
