*Traducció catalana — per a la versió original en anglès, vegeu [QUICKSTART.md](QUICKSTART.md)*

# Inici ràpid

Cinc minuts des de la clonació fins a la publicació segellada. Provat en
macOS; hauria de funcionar en Linux; els usuaris de Windows necessitaran WSL.

## 0. Requisits previs

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Bastida

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Editar els fets

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Cada fitxer és un fet. UTF-8. Salts de línia LF. El patró del nom de fitxer
és `NN_short_name.txt`, on NN està farcit amb zeros a l'esquerra. Es
classifiquen lexicogràficament a l'arbre de Merkle, de manera que el 02
sempre va després del 01.

Consell: formuleu cada fet com un *esdeveniment de nomenament o
declaració*, no com una afirmació ontològica sobre el món. «Acme Corp ha
declarat que el lot X ha superat la prova Y» és verificable. «El lot X és
segur» no ho és.

## 3. Iniciar el dimoni d'IPFS (una sola vegada per màquina)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Segellar

```bash
bash build/seal.sh
```

Això farà el següent:
1. Calcular el hash de cada fet (SHA-256) i calcular l'arrel de Merkle a
   l'estil de Bitcoin.
2. Estampar l'arrel amb OpenTimestamps mitjançant dos calendaris
   independents (alice + finney per defecte — sobreescriviu-ho mitjançant
   `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Fixar el directori `site/` a IPFS i imprimir el CID.

Total: ~10 segons amb un dimoni d'IPFS calent.

## 5. Editar `site/index.html`

Substituïu els marcadors de posició de la plantilla pels vostres fets,
hashs i arrel de Merkle reals. Els hashs per fet mostrats han de coincidir
amb els fitxers de cada fet, o la pàgina fallarà la seva pròpia
autoverificació.

Per a cada fet, copieu el cos del fitxer .txt dins d'un bloc
`<div class="fact">` i poseu el SHA-256 en un `<div class="hash">`
directament a sota. L'arrel de Merkle va a la secció del segell
criptogràfic.

(Sí, això es podria autogenerar. No ho està, deliberadament: el pas manual
és el pas de revisió humana. El protocol no protegeix contra publicar
quelcom que no heu llegit.)

## 6. Verificar localment

```bash
python3 build/verify.py
```

Sortida esperada:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

El «Pending» és normal — el calendari d'OTS actualitzarà l'atestació a una
atestació completa de Bitcoin en unes poques hores.

## 7. Desplegar

Trieu-ne qualsevol:

- **Cloudflare Pages**: tauler → Pages → Direct upload → arrossegueu `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` dins de `site/`, feu push al repositori, habiliteu Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (amb allotjament estàtic activat)
- **Qualsevol VPS senzill**: `scp -r site/* user@host:/var/www/html/`

El CID d'IPFS del pas 4 us proporciona un URL addicional adreçat per
contingut: `https://<CID>.ipfs.dweb.link/`. Useu-lo.

## 8. Actualitzar el rebut OTS (més tard)

En unes ~poques hores després del segellat, executeu:

```bash
ots upgrade build/merkle_root.txt.ots
```

Això converteix l'atestació pendent de cada calendari en una atestació
completa de Bitcoin que fa referència a un bloc específic. Torneu a
desplegar el fitxer `.ots` als vostres allotjaments després d'actualitzar.

## 9. Això és tot

Heu publicat un conjunt reduït de fets de manera que qualsevol tercer pot:

- Obtenir tots els fets via HTTP pla des del vostre allotjament
- Recalcular l'arrel de Merkle a partir dels bytes dels fets
- Comparar-la amb la vostra arrel publicada
- Verificar que l'arrel s'ha compromès a Bitcoin en el moment estampat per OTS
- Obtenir de manera independent els mateixos fets via IPFS al CID publicat
- Confirmar que tots els hashs coincideixen

Si qualsevol d'aquests passos falla, hi ha hagut manipulació. El lector no
ha de confiar en vós. Només ha de fer els càlculs.
