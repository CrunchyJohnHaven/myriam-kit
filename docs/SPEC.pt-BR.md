*Tradução em português (Brasil) — para a versão original em inglês, veja [SPEC.md](SPEC.md)*

# Especificação do protocolo MYRIAM-kit

## 0. Propósito

Este documento especifica um protocolo mínimo para publicar um pequeno
conjunto de fatos textuais em uma forma com evidência de adulteração e
criptograficamente verificável, que sobrevive à remoção por qualquer
provedor de hospedagem individual.

É a generalização do protocolo implantado pela primeira vez em
[disclosure.host](https://disclosure.host) sob o nome "MYRIAM v1".

## 1. Não-objetivos

- Armazenamento de segredos. Tudo é público por construção.
- Conjuntos de dados grandes. Acima de ~20 fatos, o protocolo tem o
  formato errado.
- Publicação em tempo real. Cada publicação é um evento discreto de
  selamento.
- Retratação. O protocolo é apenas-adição no nível da versão.

## 2. Modelo de fato

Um FATO é um arquivo de texto UTF-8 com:

- Padrão de nome de arquivo: `NN_short_name.txt`, em que NN é um índice
  de dois dígitos preenchido com zeros à esquerda, começando em 01.
- Forma canônica: bytes como escritos, sem normalização.
- Hash por fato: hexadecimal em minúsculas de `SHA-256(file_bytes)`.

O CONJUNTO de fatos é a lista ordenada de todos os arquivos que
correspondem ao padrão sob `facts/`, ordenados lexicograficamente.

Restrição: o corpo de cada fato DEVERIA ser formulado como um *evento
de nomeação* ou *evento de declaração* atribuível a uma parte
específica. Alegações ontológicas ("a lua é rocha") solapam a porteira
de verificabilidade; apenas o evento de publicação é verificável, não a
alegação. "X declarou Y" é a forma adequada. "Y é verdadeiro" não é.

## 3. Raiz Merkle

Estilo Bitcoin, como na v0 do protocolo MYRIAM implantado:

1. Folhas: hashes SHA-256 por fato, na ordem do conjunto de fatos.
2. Se um nível tiver um número ímpar de nós, duplique o último nó.
3. Faça hash dos nós adjacentes em pares: `parent = SHA-256(left_bytes || right_bytes)`,
   em que `left_bytes` e `right_bytes` são os valores de hash brutos de
   32 bytes (não suas representações hexadecimais).
4. Repita até restar um único nó. Essa é a raiz Merkle.

A raiz é publicada como hexadecimal em minúsculas, sem quebra de linha
ao final.

### 3.1 Vetores de teste

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Qualquer implementação em conformidade DEVE reproduzir esses vetores.
Eles são derivados do próprio `lib/build.py` e podem ser regenerados
com aquele script.

## 4. Compromisso no Bitcoin

A raiz Merkle é comprometida na blockchain do Bitcoin via
[OpenTimestamps](https://opentimestamps.org). A política padrão é:

> Carimbar contra pelo menos dois operadores de calendário sob controle
> administrativo independente.

Um recibo que satisfaça essa política é verificável por qualquer parte
que possa executar `ots verify <receipt>.ots` e alcançar o caminho de
atualização de qualquer um dos calendários.

O par de operadores padrão fornecido em `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementações PODEM usar operadores diferentes. A política de
diversidade de testemunhas (≥2 operadores independentes) é normativa;
os operadores específicos não são.

## 5. Espelhamento endereçado por conteúdo

O diretório `site/`, contendo a página publicada e os arquivos de
fatos, DEVERIA ser adicionado ao IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

O CIDv1 resultante (codec dag-pb) é o endereço de conteúdo da
publicação. É determinístico a partir do conteúdo em bytes de `site/`.
Qualquer modificação em qualquer arquivo sob `site/` produz um CID
diferente.

Fixar em serviços adicionais além do nó local do publicador é
fortemente recomendado para durabilidade; esta especificação não exige
serviços específicos.

## 6. Versionamento

O protocolo é **apenas-adição no nível da versão**. Toda mudança
requer uma nova versão selada:

- Uma nova revisão (ou inalterada) da especificação
- Um novo conjunto de fatos, que PODE herdar fatos inalterados de
  versões anteriores
- Uma nova raiz Merkle
- Um novo recibo OpenTimestamps
- Um novo CID do IPFS

Todas as versões anteriores permanecem publicadas em URLs versionadas.
Uma mudança em qualquer fato de v(N) requer v(N+1), com ambas as
versões visíveis e reverificáveis.

## 7. Verificação

Qualquer terceiro pode verificar a integridade de uma publicação:

1. Baixando os arquivos de fatos e recalculando os hashes SHA-256 por
   fato.
2. Recalculando a raiz Merkle conforme §3 e comparando com a raiz
   publicada.
3. Verificando o recibo OpenTimestamps contra a blockchain do Bitcoin
   para a atestação completa de pelo menos um calendário.
4. Recalculando independentemente o CID do IPFS via
   `ipfs add -r --cid-version=1` e comparando com o CID publicado.

`lib/verify.py` realiza os passos 1 a 3 sem dependências externas além
da biblioteca padrão do Python e do cliente `ots`. O passo 4 requer o
cliente `ipfs`.

## 8. Porteira de recusa

Uma publicação NÃO DEVE incluir um fato que:

- Identifique um terceiro privado que não tenha consentido em ser
  nomeado.
- Apresente uma hipótese como uma confirmação.
- Não possa ser reduzido a um evento verificável de
  nomeação/declaração ou a um artefato criptográfico.
- Tenha um aumento esperado razoável em mortes evitáveis quando
  publicado.

A quarta regra é a que sustenta o peso. Ela é aplicada no passo de
revisão humana pelo publicador. Não há aplicação em nível de protocolo
da porteira de recusa; o protocolo publica quaisquer bytes que receba.
O publicador é responsável pela porteira.

## 9. Declaração honesta dos limites

- **Detectabilidade, não impossibilidade.** O protocolo torna a
  adulteração detectável, não impossível. Um atacante determinado
  ainda pode substituir uma publicação diferente e persuadir alguns
  leitores de que ela é a original. O valor do protocolo é que a
  substituição se torna criptograficamente demonstrável a qualquer um
  que execute a verificação.
- **Sem defesa contra a publicação de inverdades.** Se o publicador
  selar um fato afirmando "X aconteceu" e X não aconteceu, o protocolo
  sela a alegação falsa com a mesma fidelidade com que sela as
  verdadeiras. O protocolo atesta o que foi *publicado*, não o que é
  *verdadeiro*.
- **Assinatura de parte única.** A v1 do MYRIAM implantado usa um
  único principal assinante. Assinatura multipartite é trabalho
  futuro.
- **Durabilidade do pinning.** Fixar o IPFS apenas no nó do publicador
  oferece "disponível enquanto meu laptop estiver ligado + cache
  oportunista de gateway". Durabilidade de longo prazo requer pins
  redundantes em serviços independentes.

Esses limites são enunciados aqui para que nenhum leitor presuma que o
protocolo entrega mais do que entrega.
