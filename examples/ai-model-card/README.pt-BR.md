*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Travamento do Comportamento de Modelo de IA

Um exemplo de myriam-kit pronto para uso destinado a laboratórios de IA
(comerciais ou de código aberto) que lançam um modelo e desejam que as
afirmações do lançamento — identidade dos pesos, capacidades, pontuações
de avaliação, revisão de segurança, compromissos pré-implantação —
fiquem **criptograficamente ancoradas e publicamente verificáveis**.

O kit defende contra o modo de falha específico em que modelos
implantados sofrem deriva silenciosa, pontuações de avaliação são
reescritas retroativamente, ou afirmações pré-implantação são contestadas
anos depois com um "nunca dissemos isso".

## O que este kit produz

Um manifesto criptograficamente selado contendo, para um lançamento de
modelo:

1. Identificação do modelo (nome, arquitetura, número de parâmetros,
   licença)
2. **SHA-256 do arquivo de pesos** — o hash canônico do artefato
3. Texto do cartão do modelo (capacidades, uso previsto, uso fora do
   escopo, modos de falha conhecidos)
4. Resultados de avaliação no momento do lançamento (avaliações de
   capacidade, avaliações de segurança, calibração)
5. Compromissos pré-implantação (as coisas que você se compromete a não
   alterar silenciosamente após o lançamento)
6. Principal signatário (o humano + a organização que assumem a
   responsabilidade)

O selo torna cada um desses elementos estável em nível de byte,
temporalmente ancorado ao Bitcoin via OpenTimestamps, e recuperável via
IPFS independentemente de qualquer provedor de hospedagem individual.

Veja o exemplo fictício trabalhado: [facts/](facts/) e a
[site/index.html](site/index.html) renderizada. O exemplo usa um modelo
fictício ("Calm-mini-v0"); um lançamento real substituiria o conteúdo
do exemplo.

## Contra o que este kit defende

**Modos de falha que o selo captura diretamente:**

- **Adulteração de pesos** — o SHA-256 do arquivo de pesos lançado está
  no FATO 03. Qualquer alteração pós-lançamento dos bytes que um usuário
  baixa é detectável recalculando o hash.
- **Reescritas silenciosas de avaliações** — as pontuações de avaliação
  no momento do lançamento estão no FATO 05. Disputas futuras do tipo
  "a pontuação de avaliação sempre foi X" têm uma âncora pública.
- **Deriva das afirmações de capacidade** — o texto do cartão do modelo
  no FATO 04 é estável em nível de byte. Disputas futuras do tipo "nunca
  afirmamos a capacidade X" são publicamente verificáveis contra o texto
  selado.
- **Redistribuição silenciosa de fine-tunes** — o compromisso
  pré-implantação nº 1 no FATO 06 (no exemplo trabalhado) é "nenhum
  fine-tuning silencioso sob o mesmo nome". Detecção: qualquer novo hash
  de pesos significa um novo nome de modelo e uma nova publicação selada,
  ou o compromisso foi rompido.
- **Modos de falha ocultos** — o FATO 04 compromete-se com uma lista de
  modos de falha conhecidos. A lista é monotônica (pode crescer, não
  diminuir para um checkpoint congelado). Descobertas futuras de modos de
  falha que o laboratório conhecia internamente mas não publicou tornam-se
  evidência contestável.

**Modos de falha NÃO cobertos:**

- Modelos sendo mal utilizados por usuários a jusante (o selo prova o
  que foi lançado, não o que os usuários fazem com isso).
- Fine-tuning adversarial por terceiros (um fine-tune de terceiros
  produz um hash de pesos diferente, portanto o selo original permanece
  intacto, mas o modelo do terceiro está fora da proteção do selo).
- Mudanças de comportamento devido a mudanças no ambiente de implantação
  (prompts de sistema diferentes, configurações de RAG, etc.).
- Falhas que o laboratório genuinamente não conhecia no momento do
  lançamento. O selo compromete o laboratório com *o que ele sabia*; ele
  não pode ancorar aquilo que ele não sabia.

## Quando usar este kit

Você deve considerar selar um cartão de modelo se:

- Estiver lançando pesos de modelo publicamente OU implantando um modelo
  em um contexto onde usuários a jusante se importam com a estabilidade
  do comportamento.
- O lançamento for significativo o suficiente para que disputas futuras
  do tipo "nunca dissemos isso" sejam plausíveis (qualquer modelo
  implantado em larga escala; qualquer modelo crítico para a segurança;
  qualquer lançamento acompanhado de afirmações de capacidade).
- Sua organização estiver disposta a assumir compromissos
  pré-implantação que restringem ações futuras (este é o ponto carregador
  — veja a próxima seção).
- Você puder calcular o SHA-256 do arquivo de pesos no momento do
  lançamento.

## Quando NÃO usar este kit

NÃO use este kit se:

- Não estiver disposto a ficar vinculado pelos compromissos
  pré-implantação no FATO 06 do exemplo. O selo torna os compromissos
  mecanicamente detectáveis; se você não estiver preparado para essa
  prestação de contas, não sele.
- O arquivo de pesos for mudar com frequência (por exemplo, pipelines de
  fine-tuning contínuo). Cada mudança de pesos requer um novo lançamento
  selado. Selagem por lançamento é pesada; este kit é para checkpoints
  *congelados*.
- Você ainda não tiver feito a revisão de segurança. O selo compromete-se
  com os achados da revisão de segurança. Se você selar uma revisão
  incompleta, terá um registro público permanente de uma revisão
  incompleta.
- Você puder querer retratar alguma pontuação de avaliação específica
  mais tarde. O selo é permanente. Novas publicações seladas podem
  substituí-lo, mas o original não pode ser desfeito.

## Os compromissos pré-implantação carregadores

O FATO 06 do exemplo compromete o publicador com:

1. **Nenhum fine-tuning silencioso sob o mesmo nome.** Qualquer fine-tune
   produz um novo nome de modelo, uma nova publicação selada, um novo
   hash de pesos. O antecessor permanece canonicamente como a versão
   nomeada.

2. **Nenhuma atualização silenciosa de avaliações.** Reavaliações
   recebem novas publicações seladas que referenciam o original pela raiz
   Merkle. Versões são rastreadas, não sobrescritas.

3. **Modos de falha conhecidos podem crescer, nunca diminuir.** Um
   checkpoint congelado não pode ter modos de falha corrigidos. Portanto,
   a lista publicada é efetivamente monotônica.

4. **Tratamento de retirada.** Se forçado a remover o modelo da
   distribuição, o laboratório compromete-se a publicar uma declaração
   final selada da retirada.

Um laboratório que adote este kit precisa decidir quais desses
compromissos ele pode efetivamente honrar. Se não puder honrar todos os
quatro, modifique o FATO 06 *antes* de selar para refletir o que pode
honrar, e aceite a proteção enfraquecida resultante. Selar compromissos
que você não pretende honrar é pior do que não selar.

## Como fazer fork deste kit para um lançamento real

```bash
# 1. Copie este exemplo para seu pipeline de lançamento
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Edite cada fato para seu lançamento real
$EDITOR facts/01_example_notice.txt   # REMOVER — seu lançamento não é um exemplo
                                       # Substitua por um aviso de lançamento para seu modelo
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # o cartão de modelo canônico
$EDITOR facts/05_eval_results.txt     # resultados de avaliação reais
$EDITOR facts/06_release_commitments.txt # quais compromissos você pode honrar

# 3. Atualize site/index.html para refletir o lançamento real.

# 4. Selar.
bash build/seal.sh

# 5. Verificar localmente.
python3 build/verify.py

# 6. Implantar em:
#    - Sua página de lançamento (ao lado do cartão do modelo e dos pesos)
#    - A rede IPFS (o script seal.sh já faz isso)
#    - Opcionalmente: vincular à publicação selada a partir das suas
#      notas de lançamento no Hugging Face / GitHub
```

## Integração com pipelines de lançamento existentes

O kit é projetado para compor com ferramentas existentes, não para
substituí-las:

- **Hugging Face**: inclua a URL ou o CID IPFS da publicação selada no
  README.md do cartão do modelo. Direcione os leitores ao selo para
  afirmações de lançamento estáveis em nível de byte.
- **Releases do GitHub**: inclua o recibo OpenTimestamps
  (`merkle_root.txt.ots`) como um ativo do release. Disputas futuras do
  tipo "o release foi alterado" ficam então ancoradas ao Bitcoin.
- **Padrões de cartão de modelo (Mitchell et al. 2019)**: o kit é
  compatível. Os campos padrão do cartão de modelo mapeiam para os FATOS
  02–05 do selo. Você produz o cartão do modelo normalmente, e além disso
  o sela.
- **Frameworks de avaliação (lm-evaluation-harness, BIG-bench, etc.)**:
  faça o hash do commit exato do framework e do JSON bruto de saída;
  referencie esses hashes no FATO 05. Reexecuções futuras tornam-se
  então independentemente reproduzíveis.

## Calculando o hash dos pesos

Para um único arquivo safetensors:

```bash
shasum -a 256 model.safetensors
```

Para checkpoints multiarquivo (shards GGUF, safetensors fragmentados):

```bash
# Concatene hashes em ordem classificada, depois faça hash novamente
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

O hash final é o que entra no FATO 03. Inclua tanto os hashes por shard
quanto o hash agregado final para que os usuários possam verificar shards
individuais à medida que os baixam.

## O que os destinatários (usuários do seu modelo) devem saber

Um lançamento de modelo com uma publicação selada por MYRIAM permite ao
usuário:

1. **Verificar os pesos baixados** recalculando o hash e comparando com
   o FATO 03.
2. **Verificar que o cartão do modelo não foi reescrito retroativamente**
   conferindo o FATO 04 selado contra a versão atualmente publicada pelo
   laboratório.
3. **Verificar que as pontuações de avaliação são as do momento do
   lançamento** comparando as alegações atuais de avaliação do
   laboratório contra o FATO 05 selado.
4. **Responsabilizar o laboratório por seus compromissos
   pré-implantação** conferindo o comportamento real contra o FATO 06
   selado.

Um usuário que encontre discrepâncias tem evidência criptográfica da
discrepância. Ele pode publicar essa evidência; a publicação selada
original é a âncora.

## O que este kit NÃO é

- Não substitui efetivamente fazer a revisão de segurança. O selo é o
  *registro* da revisão de segurança, não a revisão em si.
- Não substitui avaliações reais. O selo ancora as pontuações que você
  produz; ele não valida a metodologia.
- Não é uma garantia de que o modelo é seguro. O selo documenta o que o
  laboratório afirma sobre o modelo no momento do lançamento; ele não
  certifica essas afirmações.
- Não é proteção contra uso indevido do modelo por usuários a jusante.

## Uma nota sobre fine-tuning adversarial

Uma preocupação comum em segurança de IA: alguém faz fine-tuning do seu
modelo para remover comportamentos de segurança e o redistribui. O selo
NÃO PODE impedir isso. O que o selo pode fazer é:

- Ancorar o que o modelo *original* deveria fazer (FATO 04).
- Ancorar quais eram as pontuações de avaliação originais (FATO 05).
- Fornecer um ponto de referência contra o qual fine-tunes adversariais
  podem ser medidos.

Um usuário que se depare com uma redistribuição de terceiros pode
verificar se os pesos correspondem ao hash selado original. Se não
corresponderem, o usuário sabe que tem um modelo não original e que
quaisquer alegações de segurança atribuídas ao laboratório não se
aplicam.

## Encerramento

Selar um lançamento de modelo é um pequeno trabalho extra para o
laboratório: ~10 minutos para calcular hashes e executar o script de
selagem, mais uma decisão de 30 segundos sobre quais compromissos
pré-implantação incluir. A prestação de contas que isso adiciona é
assimétrica: custo pequeno para laboratórios honestos, grande restrição
para laboratórios que de outro modo derivariam silenciosamente suas
alegações.

Se você é um laboratório de IA considerando a adoção, o kit é domínio
público (CC0). Faça fork dele. Modifique-o. A matemática é a parte
carregadora, não a implementação específica.

## Licença

Domínio público (CC0). Nenhuma atribuição é exigida.
