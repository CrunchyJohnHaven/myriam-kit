*Traducción al español — para la versión original en inglés, ver [QUICKSTART.md](QUICKSTART.md)*

# Inicio rápido

Cinco minutos desde el clonado hasta la publicación sellada. Probado en macOS;
debería funcionar en Linux; los usuarios de Windows necesitarán WSL.

## 0. Requisitos previos

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Andamiaje

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Editar los hechos

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Cada archivo es un hecho. UTF-8. Saltos de línea LF. El patrón del nombre de
archivo es `NN_short_name.txt` donde NN está rellenado con ceros a la izquierda.
Se ordenan lexicográficamente en el árbol de Merkle, así que 02 siempre va
después de 01.

Consejo: formule cada hecho como un *evento de nombramiento o declaración*,
no como una afirmación ontológica sobre el mundo. "Acme Corp ha declarado
que el lote X aprobó la prueba Y" es verificable. "El lote X es seguro" no
lo es.

## 3. Iniciar el daemon de IPFS (una sola vez por máquina)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Sellar

```bash
bash build/seal.sh
```

Esto hará lo siguiente:
1. Hashear cada hecho (SHA-256), calcular la raíz de Merkle al estilo de Bitcoin.
2. Estampar la raíz con OpenTimestamps mediante dos calendarios independientes
   (alice + finney por defecto — se sobrescribe mediante `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Fijar el directorio `site/` en IPFS e imprimir el CID.

Total: ~10 segundos con un daemon de IPFS en caliente.

## 5. Editar `site/index.html`

Reemplace los marcadores de posición de la plantilla con sus hechos, hashes y
raíz de Merkle reales. Los hashes por hecho mostrados deben coincidir con los
archivos de cada hecho, o la página fallará su propia autoverificación.

Para cada hecho, copie el cuerpo del archivo .txt dentro de un bloque
`<div class="fact">` y coloque el SHA-256 en un `<div class="hash">`
directamente debajo. La raíz de Merkle va en la sección del sello
criptográfico.

(Sí, esto podría auto-generarse. No lo está, deliberadamente: el paso manual
es el paso de revisión humana. El protocolo no protege contra publicar algo
que usted no leyó.)

## 6. Verificar localmente

```bash
python3 build/verify.py
```

Salida esperada:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

El "Pending" es normal — el calendario de OTS actualizará la atestación a
una atestación completa de Bitcoin en unas pocas horas.

## 7. Desplegar

Elija cualquiera de las siguientes opciones:

- **Cloudflare Pages**: panel → Pages → Direct upload → arrastre `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` en `site/`, hacer push al repositorio, habilitar Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (con alojamiento estático activado)
- **Cualquier VPS sencillo**: `scp -r site/* user@host:/var/www/html/`

El CID de IPFS del paso 4 le proporciona una URL adicional direccionada por
contenido: `https://<CID>.ipfs.dweb.link/`. Úsela.

## 8. Actualizar el recibo OTS (más tarde)

Dentro de las ~pocas horas siguientes al sellado, ejecute:

```bash
ots upgrade build/merkle_root.txt.ots
```

Esto convierte la atestación pendiente de cada calendario en una atestación
completa de Bitcoin que referencia un bloque específico. Vuelva a desplegar
el archivo `.ots` a sus hosts después de actualizar.

## 9. Eso es todo

Ha publicado un conjunto reducido de hechos de forma que cualquier tercero
pueda:

- Obtener todos los hechos vía HTTP simple desde su host
- Recalcular la raíz de Merkle a partir de los bytes de los hechos
- Compararla con su raíz publicada
- Verificar que la raíz quedó comprometida en Bitcoin en el momento estampado por OTS
- Obtener de forma independiente los mismos hechos vía IPFS en el CID publicado
- Confirmar que todos los hashes coinciden

Si cualquiera de esos pasos falla, ha habido manipulación. El lector no tiene
que confiar en usted. Sólo tiene que hacer las matemáticas.
