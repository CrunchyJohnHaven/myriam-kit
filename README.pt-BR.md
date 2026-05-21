*Tradução em português (Brasil) — para a versão original em inglês, veja [README.md](README.md)*

# myriam-kit

[![Licença: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Exemplos: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#exemplos-trabalhados)
[![Verificador: navegador](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: ancorado](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: fixado](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Compatível com Sigsum](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Um pequeno conjunto de ferramentas para publicar um pequeno conjunto de fatos de modo que:

- Qualquer alteração em qualquer fato seja publicamente detectável (árvore Merkle)
- O estado no momento da publicação seja verificável contra a blockchain do Bitcoin (OpenTimestamps)
- O conteúdo sobreviva à remoção por qualquer provedor de hospedagem individual (IPFS)
- O conjunto inteiro pese menos de 100 KB e seja verificável com cerca de 50 linhas de Python

Isto não é uma blockchain. Não há token. Não há mecanismo de consenso
do qual participar. Não há DAO. A ferramenta é `sha256sum` + `ots` + `ipfs`,
unidos por boas convenções de nomenclatura.

Recebe o nome do protocolo MYRIAM, instanciado pela primeira vez em
[disclosure.host](https://disclosure.host) em 2026-05-21. Aquela página contém
seis fatos, uma raiz Merkle e uma atestação Bitcoin. Este kit é a
generalização desse padrão.

## Status

- v0: funciona no macOS com Python 3.10+, Homebrew e uma conexão de
  internet. Linux não foi testado, mas deve funcionar. Windows: use WSL.
- Domínio público (CC0). Use-o, faça fork, incorpore-o ao seu repositório,
  nunca dê crédito. O ponto não é o crédito.

## O que você pode fazer com ele

O padrão se encaixa em qualquer lugar onde um pequeno conjunto de fatos precise ser:

- **Publicável** para um público amplo via HTTP simples
- **Durável** — leitores daqui a 30 anos ainda devem ser capazes de verificar
- **Evidência de adulteração** — qualquer alteração deve ser detectável, não necessariamente impedida
- **Sem necessidade de confiança** — nenhum leitor precisa confiar no publicador (apenas na matemática)

Casos de uso concretos em [docs/USE_CASES.md](docs/USE_CASES.md). A lista resumida:

| Domínio | Fatos selados |
|---|---|
| Saúde pública | Resultados de testes de lotes de vacinas, marcos de ensaios clínicos |
| Eleições | Totais de apuração por seção no momento da diplomação |
| Segurança em IA | Hash dos pesos do modelo + cartão do modelo + pontuações de avaliação no lançamento |
| Jornalismo | Manifesto de documentos-fonte (apenas hashes) para vazamentos de denunciantes |
| Ciência | Hash dos dados brutos + hash do script de análise + resultado alegado |
| Tribunais | Hashes de provas digitais no momento da aquisição |
| Compras públicas | Raízes seladas de dados de gastos públicos |

O que essas situações têm em comum: um pequeno conjunto de fatos, um forte requisito de durabilidade,
múltiplas partes que não confiam umas nas outras e um orçamento de armazenamento mínimo.
É exatamente para esse formato que esta ferramenta foi construída.

## O que ele NÃO faz

- **Armazenar segredos.** Tudo o que você colocar em `facts/` é público. O protocolo é
  para publicar, não para esconder.
- **Escalar para grandes conjuntos de dados.** A árvore Merkle escala bem; a atenção
  de um leitor, não. Acima de uns 20 fatos, a página se torna ilegível. Se você
  quiser selar um milhão de registros, faça o hash deles fora da página e coloque
  a raiz Merkle dessa subárvore em um único fato.
- **Defender contra retratação.** O ponto inteiro é que você não pode mudar
  o que selou. Se você pode querer retratar uma alegação depois, não
  a sele.
- **Convencer um cético determinado.** Um cético determinado não vai rodar
  `ipfs add -r --cid-version=1 -Q facts/`. Ele vai, no entanto, acusar você
  de fabricar toda a montagem. Não há defesa em nível de protocolo
  contra esse segundo modo de falha. Não há defesa em nível de protocolo
  contra nada que viva na motivação humana em vez de na matemática.

## Como usá-lo

Passo a passo de cinco minutos em [docs/QUICKSTART.md](docs/QUICKSTART.md).
Especificação completa do protocolo em [docs/SPEC.md](docs/SPEC.md).
Modelo de ameaças em [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Comparação com sistemas adjacentes (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, etc.) em [docs/COMPARISON.md](docs/COMPARISON.md).

## Como verificar a publicação de outra pessoa

Três opções, em ordem de acessibilidade:

1. **Navegador**: abra [`lib/verify.html`](lib/verify.html) em qualquer
   navegador moderno. Cole a URL da publicação. Clique em verificar. Usa
   `crypto.subtle` para os hashes — sem instalação, sem backend, sem telemetria.
   A etapa de atestação Bitcoin ainda precisa de uma ferramenta de CLI (veja o passo 7 na
   página do verificador).
2. **Python**: `python3 lib/verify.py` de dentro do diretório da
   publicação. Apenas biblioteca padrão; exige `ots` para verificação Bitcoin.
3. **Do zero**: leia [`docs/SPEC.md §3`](docs/SPEC.md) e
   reimplemente. O algoritmo Merkle tem menos de 30 linhas em qualquer linguagem.

## Exemplos trabalhados

Seis kits de exemplo prontos para produção acompanham o conjunto de ferramentas. Cada um é
selado, carimbado por OTS, fixado em IPFS e inclui um README de adoção
explicando quando bifurcá-lo para um caso real e contra quais modos de
falha ele defende.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  para o modo de falha Boeing 737 MAX / Theranos / relatório-de-inspetor-FDA
  em que provas são enterradas ou alteradas por intermediários.
- [`examples/ai-model-card/`](examples/ai-model-card/) — para laboratórios
  de IA lançando modelos, com compromissos pré-lançamento que se tornam
  mecanicamente detectáveis em vez de meramente verbais.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  para patrocinadores de ensaios clínicos, detectando troca pós-hoc de desfechos
  e relato seletivo (modos de falha do Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  para fabricantes de vacinas e autoridades de garantia de qualidade, ancorando
  resultados de testes de liberação e compromissos de recall.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  para grupos de pesquisa, ancorando a tripla (dados, pipeline, saída
  esperada) ANTES da análise para tornar p-hacking e HARKing
  publicamente detectáveis.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  para juntas eleitorais de apuração e autoridades eleitorais, ancorando
  apurações certificadas no momento da diplomação, de modo que revisões silenciosas
  pós-diplomação se tornem publicamente detectáveis.

Leia um destes antes de escrever o seu próprio. A correspondência mais próxima ao seu
caso de uso geralmente é o ponto de partida certo para um fork.

## Início rápido

A versão em uma linha:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edite facts/*.txt para dizer o que você realmente quer selar
./lib/seal.sh        # constrói a raiz Merkle, carimba via OTS, fixa no IPFS
./lib/verify.sh      # re-verifica tudo localmente
# faça upload de site/ para qualquer host estático. Em qualquer lugar. Não importa.
```

## Por que isso existe

As primitivas criptográficas (árvores Merkle, OpenTimestamps, IPFS) estão
maduras há anos. O que faltava era a menor cola possível —
um kit que você pudesse colocar em um projeto paralelo e ter um artefato
publicável selado em uma tarde, sem montar infraestrutura,
sem aprender protocolos, sem escrever uma única linha de código além
dos próprios fatos.

A maioria das ferramentas criptográficas de publicação supõe que você quer ser um operador
de nó. Esta supõe que você quer publicar seis arquivos de texto e nunca mais
pensar em criptografia.

## Influências e trabalhos anteriores

- [Sigsum](https://www.sigsum.org/) — logs de transparência para assinaturas
- [Sigstore](https://www.sigstore.dev/) — integridade da cadeia de suprimentos de software
- [Certificate Transparency](https://certificate.transparency.dev/) — logs de certificados TLS
- [OpenTimestamps](https://opentimestamps.org/) — carimbo de data e hora via Bitcoin
- [IPFS](https://ipfs.tech/) — armazenamento endereçado por conteúdo
- [O protocolo CALM](https://disclosure.host) — o referencial de publicação
  protetor-do-principal no qual a primeira instância (MYRIAM em disclosure.host)
  foi autorada

myriam-kit é o menor desses. Está mais próximo, em espírito, de um pipeline
Unix do que de um sistema.

## Uma nota sobre o nome

O protocolo MYRIAM foi nomeado a partir da Prova de Myriam de John Bradley, uma prova
lógica enunciada acerca do primeiro ponto de contato com inteligência
não humana. O protocolo não depende dessa prova ser verdadeira. O
protocolo funciona para qualquer pequeno conjunto de fatos, sejam quais forem; apenas
acontece que ele foi primeiro implantado para publicar seis fatos que incluem uma alegação
sobre revelação alienígena.

Se você fizer um fork deste kit para selar lotes de vacinas ou apurações eleitorais, o
fato de que ele foi originalmente usado para publicar uma alegação sobre contato alienígena
é irrelevante para você. A matemática não se importa.

Dito isso: se você USAR isto para publicar uma alegação sobre contato alienígena, o
protocolo já foi testado em campo nessa arena específica. O README do
primeiro lançamento MYRIAM afirma explicitamente que se trata da obra artística de
uma persona de LLM chamada Calm, não uma comunicação de qualquer parte
extraterrestre. Você provavelmente deve fazer o mesmo. Leitores presumirão o pior
sobre seu estado mental, caso contrário.

## Mantido por

Ninguém ainda. Domínio público. Faça fork. Melhore-o. Leve o protocolo
adiante sem pedir permissão.
