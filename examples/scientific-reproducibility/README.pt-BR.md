*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Reprodutibilidade Científica

Um exemplo myriam-kit pronto para uso para grupos de pesquisa,
periódicos e instituições voltadas à reprodutibilidade que desejam
publicar, junto a um artigo ou preprint, um manifesto de
reprodutibilidade ancorado em Bitcoin e à prova de adulteração.

## O que este kit produz

Uma publicação selada contendo, para um estudo:

1. Identificação do estudo (título do artigo, autores, instituição,
   financiadores, COI)
2. **SHA-256 do arquivo de dados brutos** — o conjunto de dados
   canônico
3. **Hash do pipeline de análise** — script + digest da imagem
   Docker + dependências fixadas
4. **Hash do pacote de saída esperado** — o que um reprodutor fiel
   deve produzir
5. Protocolo de reprodução + compromissos de publicação pós-resultado
6. Principal(is) signatário(s)

O selo é destinado ao estágio **pré-análise**: dados congelados,
pipeline finalizado, saída esperada calculada, TUDO antes que qualquer
resultado seja visto com o propósito de escrever o artigo.

## Contra o que este kit defende

**Modos de falha que o selo captura:**

- **p-hacking**: mudanças post-hoc na análise após visualizar os
  resultados são detectáveis via diff entre o FACT 04 selado e o
  pipeline publicado.
- **HARKing** (Hypothesizing After Results are Known, hipotetizar
  depois de conhecidos os resultados): a hipótese pré-registrada no
  FACT 02 é byte-estável.
- **Manipulação de dados pós-artigo**: re-hashear o arquivo de dados
  contra o FACT 03 revela qualquer modificação.
- **Drift do pipeline**: re-hashear o pipeline de análise contra o
  FACT 04 captura mudanças silenciosas.
- **Manipulação de autoria**: adicionar ou remover autores
  silenciosamente após a publicação torna-se detectável contra o
  FACT 02 selado.

**Modos de falha NÃO cobertos:**

- Fraude na coleta de dados brutos (o selo ancora os dados no momento
  da selagem, não da coleta)
- Não-reprodutibilidade biológica / empírica (o selo ancora apenas
  reprodutibilidade computacional)
- Questões de tamanho amostral ou validade populacional (são questões
  de desenho do estudo)
- A verdade da alegação subjacente (o selo ancora o que foi alegado,
  não se o mundo corresponde à alegação)

## Quando usar este kit

Considere selar se:

- Você é um grupo de pesquisa conduzindo uma análise de alto risco
  (ensaio clínico, avaliação de sistema de IA, estudo de replicação)
  e deseja integridade forense além das marcas de tempo do OSF / GitHub
- Você é um pesquisador em início de carreira que quer proteção
  reputacional assimétrica: a pré-análise selada significa que
  futuras críticas do tipo "eles fizeram p-hacking" têm um
  falsificador público
- Você é um editor de periódico ou líder de projeto de replicação
  que quer incentivar pré-registro de grau criptográfico para um
  subconjunto de artigos
- Você está trabalhando em uma análise em que ajustes post-hoc têm
  consequências significativas no campo (psicologia, economia
  comportamental, pesquisa médica)

## Precedente histórico de mortalidade / dano

A relevância deste kit para a mortalidade é indireta:

- **Irreprodutibilidade em pesquisa de células-tronco / câncer:**
  vários artigos levaram a danos a pacientes por meio de ensaios
  clínicos mal direcionados. O pré-registro selado do pipeline
  original teria ancorado a comparação.
- **Controvérsia sobre a eficácia do Tamiflu:** a revisão Cochrane
  levou anos em parte porque o acesso aos dados brutos foi contestado.
  Hashes de dados selados na publicação teriam tornado as disputas
  sobre acesso aos dados imediatamente resolvíveis.
- **Crise geral de irreprodutibilidade:** o custo em mortalidade, no
  nível do campo, da pesquisa biomédica irreprodutível é significativo
  (Begley & Ellis 2012 estimaram que >50% dos achados pré-clínicos
  são irreprodutíveis). A ancoragem criptográfica é uma alavanca
  estrutural.

## Como fazer fork deste kit

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRÍTICO: faça isto ANTES de ver qualquer resultado
shasum -a 256 raw_data_v0.tar.gz       # calcule o hash canônico dos dados
shasum -a 256 analysis.py              # hash do seu pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # preencha com valores reais
bash build/seal.sh                     # sele ANTES de rodar a análise
python3 build/verify.py                # confirme

# Agora rode a análise. Faça hash da saída e confirme que corresponde ao FACT 05.
# Se não corresponder, o pipeline é não-determinístico; corrija e re-sele.
```

## Integração com a infraestrutura acadêmica existente

- **arXiv / bioRxiv / medRxiv**: inclua a URL ou IPFS CID do selo
  MYRIAM no resumo ou nos materiais suplementares
- **OSF**: anexe o artefato do selo ao projeto OSF junto com o
  formulário convencional de pré-registro
- **AsPredicted**: inclua a URL do selo MYRIAM no documento de
  pré-registro
- **GitHub**: o hash do commit do pipeline de análise é o que o
  FACT 04 ancora; o GitHub fornece o código-fonte, o MYRIAM ancora
  os bytes
- **Zenodo / Figshare / OpenAIRE**: deposite os dados brutos e,
  em seguida, sele o hash do depósito; o selo é forensicamente mais
  difícil de substituir silenciosamente do que os metadados do depósito
- **Materiais suplementares de periódicos**: inclua o artefato do
  selo MYRIAM como arquivo suplementar na submissão

## O que este kit NÃO substitui

- Aprovação do IRB / comitê de ética
- Revisão por pares
- Estudos de replicação (reprodutibilidade computacional ≠
  reprodutibilidade empírica)
- Acordos de acesso a dados para dados sensíveis

## Uma nota sobre ordem de autoria e crédito

O selo ancora a LISTA DE AUTORES no momento da selagem. Disputas sobre
autoria que surjam após a publicação podem ser avaliadas contra a
lista selada. Esta é uma pequena alavanca de responsabilização —
importante para pesquisadores em início de carreira que são
adicionados ou removidos silenciosamente.

## Licença

Domínio público (CC0). Use, modifique, ignore, faça fork.
