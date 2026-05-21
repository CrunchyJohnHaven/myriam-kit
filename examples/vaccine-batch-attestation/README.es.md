*Traducción al español — para la versión original en inglés, ver [README.md](README.md)*

# Kit de atestación de lote de vacunas

Un ejemplo llave en mano de myriam-kit para fabricantes de vacunas,
autoridades de aseguramiento de la calidad y agencias de salud pública
que deseen publicar un sello de liberación de lote anclado en Bitcoin y
con evidencia de manipulación.

## Contra qué se defiende este kit

**Modos de falla que el sello detecta:**

- **Modificación retroactiva silenciosa de los resultados de las pruebas
  de liberación.** Los 8 PDF de pruebas de liberación del ejemplo están
  hasheados. Volver a hashear después de la liberación revela cualquier
  modificación.
- **Disputas sobre qué especificaciones aplicaban en la liberación.** El
  FACT 02 sellado contiene la identificación canónica del lote y el
  hash del expediente de fabricación. Las disputas futuras del tipo «la
  especificación siempre fue X» disponen de un ancla pública.
- **Reducción silenciosa del alcance de un retiro del mercado.** Los
  compromisos de farmacovigilancia en el FACT 05 están sellados; el
  incumplimiento de los mismos es observable públicamente.
- **Re-especificación retroactiva de un lote fuera de especificación.**
  Si un resultado de prueba de liberación fue en realidad un PASS
  limítrofe que se reclasifica como FAIL tras la liberación, los hashes
  de los informes sellados prueban lo que decía el PDF de resultado
  original.

**Modos de falla NO cubiertos:**

- Fraude en el propio proceso de fabricación (el sello ancla resultados
  de pruebas, no la integridad de la fabricación).
- Eventos adversos que son consecuencias biológicas de un lote por lo
  demás conforme (el sello no certifica la seguridad clínica, sólo la
  integridad documental).
- Disputas sobre qué versión de una especificación regulatoria es la
  vigente.

## Cuándo usar este kit

Considere sellar la liberación de un lote si:

- Es fabricante de vacunas y quiere demostrar una integridad forense de
  los expedientes de liberación más allá de lo que exigen los
  reguladores
- Es un equipo de aseguramiento de la calidad que adopta la práctica de
  «publicar lo que atestiguamos»
- Es un fabricante a pequeña escala o de escala nacional en una
  jurisdicción con infraestructura regulatoria más débil, y desea
  anclar los expedientes de lote frente a un verificador global
- Es una agencia de salud pública o una ONG que opera un programa de
  producción vacunal no comercial (por ejemplo, para enfermedades
  desatendidas)

## Precedentes históricos de mortalidad

- **Contaminación de la heparina (2008, China):** sulfato de
  condroitina sobresulfatado falsificado en lotes de heparina. Un
  manifiesto de pruebas de liberación sellado habría hecho que la
  modificación silenciosa post-liberación del expediente de pruebas
  fuera criptográficamente detectable.
- **Tylenol con cianuro (1982):** disputas retroactivas sobre el punto
  de origen de la manipulación. Un hash sellado del expediente de
  fabricación ancla el estado previo a la distribución.
- **Diversos retiros de lotes de vacunas** en los que la pregunta «¿se
  llegó a someter este lote a las pruebas correctas?» se vuelve
  controvertida años después.

Este kit NO es una solución a NINGUNO de estos casos en sentido
estricto; pero en cada uno de ellos, las atestaciones de lote selladas
habrían aportado una cronología forense más limpia.

## Cómo bifurcar este kit para un lote real

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # sustituya el contenido ficticio por el lote real
bash build/seal.sh        # SELLE ANTES de que comience la distribución
python3 build/verify.py   # confirme
```

**MOMENTO CRÍTICO**: selle en el instante de la liberación por
aseguramiento de la calidad, ANTES de que el lote sea distribuido. Un
sello posterior a la distribución es forensemente más débil.

## Integración con la infraestructura farmacéutica existente

- **Presentaciones eCTD (FDA / EMA):** la URL de la publicación sellada
  o el CID de IPFS pueden referenciarse en la sección del Módulo 3
  (calidad)
- **Precalificación de la OMS:** el manifiesto sellado demuestra la
  cadena de pruebas previas a la liberación ante jurisdicciones
  distintas de la FDA y la EMA
- **Retroalimentación de farmacovigilancia:** el FACT 05 compromete al
  fabricante a una notificación sellada de los recuentos agregados de
  EA a los 6 y 12 meses
- **Sistemas de retiro (RxConnect, MedWatch):** si se requiere un
  retiro, el propio alcance del retiro se sella bajo MYRIAM,
  proporcionando verificación pública de que todos los lotes
  distribuidos están siendo atendidos

## Lo que este kit NO reemplaza

- Las presentaciones regulatorias ante la FDA / la EMA / la OMS
- Las pistas de auditoría de GMP (el sello ancla RESULTADOS, no los
  registros brutos del proceso)
- Las bases de datos de farmacovigilancia (VAERS / EudraVigilance)
- Los sistemas de coordinación de retiros

## Licencia

Dominio público (CC0). Bifúrquelo. No se requiere atribución.
