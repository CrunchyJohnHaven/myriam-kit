*Tradução em português (Brasil) — para a versão original em inglês, veja [QUICKSTART.md](QUICKSTART.md)*

# Início rápido

Cinco minutos do clone até a publicação selada. Testado em macOS; deve
funcionar no Linux; usuários de Windows precisarão de WSL.

## 0. Pré-requisitos

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Andaime

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Edite os fatos

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Cada arquivo é um fato. UTF-8. Quebras de linha LF. O padrão de nome de
arquivo é `NN_short_name.txt`, em que NN é preenchido com zeros à
esquerda. Eles são ordenados lexicograficamente na árvore Merkle, então
02 sempre vem depois de 01.

Dica: formule cada fato como um *evento de nomeação ou declaração*, não
como uma alegação ontológica sobre o mundo. "A Acme Corp declarou que o
lote X passou no teste Y" é verificável. "O lote X é seguro" não é.

## 3. Inicie o daemon do IPFS (uma única vez por máquina)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Selar

```bash
bash build/seal.sh
```

Isso vai:
1. Calcular o hash de cada fato (SHA-256) e computar a raiz Merkle no
   estilo Bitcoin.
2. Carimbar a raiz com OpenTimestamps via dois calendários independentes
   (alice + finney por padrão — sobrescreva com `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Fixar o diretório `site/` no IPFS e imprimir o CID.

Total: ~10 segundos com um daemon do IPFS já aquecido.

## 5. Edite `site/index.html`

Substitua os marcadores de espaço reservado do modelo pelos seus fatos,
hashes e raiz Merkle reais. Os hashes exibidos por fato devem coincidir
com os arquivos de cada fato, ou a página falhará na sua própria
autoverificação.

Para cada fato, copie o corpo do arquivo .txt para dentro de um bloco
`<div class="fact">` e coloque o SHA-256 em um `<div class="hash">`
diretamente abaixo. A raiz Merkle vai na seção do selo criptográfico.

(Sim, isso poderia ser gerado automaticamente. Não é, deliberadamente: o
passo manual é o passo de revisão humana. O protocolo não protege
contra publicar algo que você não leu.)

## 6. Verifique localmente

```bash
python3 build/verify.py
```

Saída esperada:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

O "Pending" é normal — o calendário do OTS vai atualizar a atestação
para uma atestação Bitcoin completa em algumas horas.

## 7. Implantar

Escolha qualquer uma das opções:

- **Cloudflare Pages**: painel → Pages → Direct upload → arraste `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` em `site/`, faça push para o repositório, habilite Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (com hospedagem estática ativada)
- **Qualquer VPS simples**: `scp -r site/* user@host:/var/www/html/`

O CID do IPFS do passo 4 te dá uma URL adicional endereçada por
conteúdo: `https://<CID>.ipfs.dweb.link/`. Use-a.

## 8. Atualize o recibo OTS (mais tarde)

Dentro de ~poucas horas após o selamento, execute:

```bash
ots upgrade build/merkle_root.txt.ots
```

Isso converte a atestação pendente de cada calendário em uma atestação
Bitcoin completa que referencia um bloco específico. Reimplante o
arquivo `.ots` nos seus hosts após a atualização.

## 9. É isso

Você publicou um pequeno conjunto de fatos de uma forma que qualquer
terceiro pode:

- Buscar todos os fatos via HTTP simples a partir do seu host
- Recalcular a raiz Merkle a partir dos bytes dos fatos
- Comparar com a sua raiz publicada
- Verificar que a raiz foi comprometida no Bitcoin no horário carimbado pelo OTS
- Buscar independentemente os mesmos fatos via IPFS no CID publicado
- Confirmar que todos os hashes coincidem

Se qualquer um desses passos falhar, ocorreu adulteração. O leitor não
precisa confiar em você. Ele só precisa fazer as contas.
