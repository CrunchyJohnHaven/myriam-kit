*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Selo de Cadeia de Custódia de Provas Judiciais

Um exemplo pronto para uso do myriam-kit destinado a equipes de
aquisição forense — peritos em informática forense, técnicos de extração
de dispositivos móveis, custodiantes de provas de câmeras corporais,
supervisores de laboratório — que desejam publicar um selo ancorado em
Bitcoin, com evidência de adulteração, sobre *quais bytes foram
adquiridos* e *quando*, no momento da aquisição da prova digital, para
que disputas sobre a cadeia de custódia disponham de uma âncora
pública.

---

## O que este kit NÃO faz (leia primeiro)

O selo é um carimbo temporal criptográfico de QUAIS IMAGENS FORENSES
foram adquiridas, QUANDO foram adquiridas, por QUAL ÓRGÃO, sob QUAL
MANDADO e por meio de QUAL METODOLOGIA. Ele não consegue responder a
nenhuma pergunta sobre o caso além disso. O que segue está **fora do
domínio do selo**:

1. **Admissibilidade sob as Federal Rules of Evidence (ou qualquer
   outro código de provas).** O selo ancora bytes e carimbos temporais.
   Se a prova é admissível — sob a autenticação da FRE 901, o
   testemunho pericial da FRE 702 / Daubert, o balanceamento de
   prejuízo da FRE 403, ou qualquer equivalente em tribunais estaduais
   — é uma questão de procedimento jurídico. Uma aquisição
   perfeitamente selada ainda pode ser declarada inadmissível; uma
   aquisição não selada ainda pode ser admitida. O selo é prova
   aditiva de integridade, não um substituto da decisão de
   admissibilidade do tribunal.

2. **Se a apreensão foi lícita.** Conformidade com a Quarta Emenda,
   validade do mandado, observância do escopo, aplicabilidade da regra
   de exclusão — tudo isso é anterior ao selo. O selo registra que a
   aquisição ocorreu sob o mandado FICT-SW-2026-0188; se o mandado foi
   licitamente expedido e licitamente cumprido cabe ao tribunal.

3. **Se a prova é incriminadora, exculpatória ou neutra.** O selo
   ancora hashes; a interpretação do que esses hashes contêm pertence
   ao laudo de exame forense, que é um documento próprio com seu
   próprio regime de descoberta e probatório. O selo se recusará a
   selar "FATO N: o notebook do suspeito continha material
   incriminador" — ver regra de recusa R4.

4. **Se a cadeia de custódia é procedimentalmente correta sob a lei
   probatória do estado aplicável.** O selo registra o log
   contemporâneo de eventos de custódia do órgão (FATO 05). Se esse
   log satisfaz os requisitos de cadeia de custódia de um estado em
   particular cabe ao tribunal na audiência probatória.

5. **Se a metodologia forense foi confiável.** Daubert e sua
   descendência (e equivalentes em nível estadual, como Frye, onde
   ainda se aplica) avaliam a confiabilidade metodológica. O selo
   registra QUAIS ferramentas e versões foram usadas (FATO 04); se
   essas ferramentas atendem ao padrão de confiabilidade de um
   tribunal específico cabe ao tribunal. Bugs de ferramentas já
   foram documentados após a aquisição em casos passados; o papel
   do selo é tornar o registro de versão-e-hash-de-binário
   publicamente refutável, não atestar a qualidade das próprias
   ferramentas.

6. **Se a prova foi adulterada ANTES da aquisição.** O selo ancora
   bytes a partir do momento da imagem em diante. Se um suspeito, um
   agente ou um terceiro alterou o dispositivo de origem antes que
   ele fosse imaginado, o selo não pode detectar isso — ele selará
   os bytes alterados com a mesma integridade com que selaria os
   originais. O valor do selo começa no carimbo temporal da imagem.

7. **Se o escopo do mandado foi respeitado.** O anexo do mandado
   define o que pode ser adquirido; o selo registra o que FOI
   adquirido. Se a aquisição excedeu o escopo do mandado é, mais
   uma vez, uma questão jurídica com seu próprio remédio (pedido
   de supressão sob o procedimento do estado apropriado).

8. **Reidentificação de qualquer parte privada da investigação.**
   O selo se recusa a publicar qualquer nome, identificador ou
   impressão que possa reidentificar um suspeito, réu, vítima,
   testemunha ou ocupante de imóvel. A referência ao número do
   processo é o identificador adequado para partes com
   legitimidade para localizar o caso.

**A seção de limites honestos acima é a parte estrutural deste
kit.** Equipes forenses que acreditam que selar equivale a
admissibilidade vão usá-lo como escudo. O kit deve dizer com
clareza: *esta é uma primitiva de não-repúdio para o momento da
aquisição, e não uma prova de aquisição lícita, solidez
metodológica ou cadeia de custódia reconhecida pelo tribunal.*

---

## O que este kit DEVE RECUSAR selar

O kit está configurado para rejeitar os seguintes padrões factuais
mesmo que um usuário com autoridade de assinatura válida do órgão
os submeta:

- **Identificação pessoal de suspeitos, réus, vítimas, testemunhas
  ou qualquer terceiro privado.** A referência ao número do processo
  é o identificador para partes com legitimidade; o selo público
  não deve ser um índice de reidentificação.
- **Nomes pessoais de peritos forenses ou de outros servidores do
  órgão no selo público.** Os papéis são públicos; os vínculos
  pessoa-papel são selados separadamente e descobertos sob ordem
  judicial.
- **Hashes (ou impressões) em nível de arquivo de material suspeito
  de exploração sexual de crianças, modelos biométricos ou
  quaisquer dados de reidentificação de pessoas vulneráveis —
  mesmo por hash.** Um SHA-256 de um arquivo individual é um
  identificador pesquisável permanente; publicá-lo em um registro
  público pode revitimizar os sujeitos por correlação com bancos
  de dados privados. Hashes em nível de imagem (em nível de imagem
  forense) de discos inteiros são aceitáveis; hashes em nível de
  arquivo desse tipo de material NUNCA são aceitáveis.
- **Constatações, interpretações, opiniões ou conclusões de exame
  sobre o que os bytes significam.** O selo ancora QUAIS BYTES
  foram adquiridos e QUANDO. A interpretação pertence ao laudo de
  exame, descoberto em juízo, e não a um registro público com
  evidência de adulteração.
- **Alegações de admissibilidade ou qualquer outra conclusão
  jurídica** ("esta prova é admissível", "o mandado foi lícito",
  "a cadeia de custódia foi adequada sob §X.Y"). Conclusões
  jurídicas são função do tribunal.
- **Selo por qualquer pessoa que não seja o mandatário autorizado
  do órgão adquirente.** Um perito de defesa pode usar o kit para
  selar sua própria verificação independente do manifesto; não
  pode selar a aquisição ORIGINAL em nome do órgão adquirente.
- **Vínculos papel-a-indivíduo dentro do selo público.** Os
  vínculos são selados em um registro complementar separado
  (com hash no FATO 05), sob controle de acesso do órgão.
- **Fatos investigativos anteriores à apreensão ou ao mandado.**
  Depoimentos de informantes, vigilância pré-mandado, insumos de
  construção paralela — nenhum desses pertence ao selo de
  aquisição. O selo tem escopo restrito ao evento de aquisição.

A própria recusa pode ser selada como um fato ("Este órgão
solicitou a selagem de X; o kit recusou conforme a regra de
recusa Y"), criando um registro público de tentativa de uso
indevido.

---

## O que este kit DE FATO sela

8 fatos no momento da aquisição:

1. **Aviso de exemplo** — declara que a publicação é um exemplo
   (atestações reais removem ou substituem este aviso).
2. **Contexto de aquisição** — identificador do processo, citação
   do mandado, órgão adquirente, autoridade requisitante, data/hora
   da apreensão e da aquisição, local da aquisição (o local da
   apreensão é redigido para um registro complementar selado
   separadamente, a fim de evitar a reidentificação do imóvel).
3. **Manifesto de provas** — por item de imagem forense: hash
   SHA-256, tamanho do arquivo, identificador anonimizado do
   dispositivo de origem, método de aquisição, formato de imagem
   forense.
4. **Metodologia de aquisição** — nomes e versões exatas das
   ferramentas forenses (com hashes dos binários das ferramentas),
   marca e modelo do bloqueador de gravação e firmware, referência
   de verificação do NIST CFTT, procedimento de verificação
   utilizado, escolha do formato de imagem.
5. **Log de cadeia de custódia** — linha do tempo evento a evento
   desde a apreensão inicial até o fim da imagem, com custodiantes
   identificados por PAPEL (não por nome), e com hashes dos
   registros complementares selados separadamente (vínculo
   papel-a-indivíduo, log GPS do transporte, log de acesso ao
   armário de provas, fotos dos lacres antiviolação, etc.).
6. **Qualificações dos peritos por papel** — certificações
   detidas, situação da educação continuada, contagem de
   experiências anteriores como testemunha pericial, exposição a
   Daubert, declarações de conflito de interesses — tudo em nível
   de papel, não pessoal.
7. **Divulgações complementares e registro de recusa** —
   investigações paralelas, contestações de mandado pendentes,
   pedidos de supressão de provas, protocolo de filtro de
   privilégio / equipe de blindagem em vigor, tentativas
   anteriores de aquisição, revisão do rastreador de bugs do
   fornecedor; lista explícita de padrões que o kit se recusou a
   selar.
8. **Mandatário signatário** — identificação do órgão adquirente
   + signatário em nível de papel (perito principal) +
   cossignatário em nível de papel (supervisor da unidade) +
   informações criptográficas da chave.

Cada fato termina com a convenção do portão de recusa: *"Este
fato afirma somente X. Ele não afirma Y"* (onde Y é o modo de
falha mais próximo da seção "NÃO faz" acima).

---

## Contra o que este kit defende

- **Alteração silenciosa de uma imagem forense após a aquisição.**
  Qualquer mudança em nível de byte em qualquer imagem produz um
  SHA-256 diferente, e a imagem alterada não verificará contra o
  manifesto selado do FATO 03.
- **Alegação de que "outras ferramentas foram usadas".** O FATO 04
  registra versões exatas das ferramentas com hashes dos binários
  das ferramentas; alegações posteriores do tipo "na verdade
  usamos v4.7.0, não v4.7.1" são publicamente refutáveis.
- **Alegação de que o bloqueador de gravação não foi engajado, ou
  que se usou um modelo diferente.** O FATO 04 congela o
  manifesto do bloqueador de gravação.
- **Adulteração do log de custódia.** Qualquer mudança na linha
  do tempo de eventos de custódia do FATO 05 (acréscimo,
  remoção ou novo carimbo temporal de um evento) altera o hash
  do FATO 05 e é publicamente detectável.
- **Substituição das credenciais por outro perito.** O FATO 06
  congela o perfil de credenciais em nível de papel no momento
  da aquisição.
- **Omissão seletiva de divulgações complementares.** O FATO 07
  enumera as categorias de divulgação esperadas; uma categoria
  vazia deve ser explicitamente atestada ("nenhuma no momento da
  aquisição"), de modo que um posterior "não percebemos que isso
  era relevante" seja publicamente refutável.
- **Alegações pós-aquisição de que o perito tinha um conflito não
  divulgado.** A divulgação de conflito do FATO 06 é congelada no
  momento da aquisição; contestações posteriores podem ser
  confrontadas com ela.

O kit **não** defende contra corrupção contemporânea — uma equipe
que sela intencionalmente metadados falsos no momento da
aquisição produz um selo criptograficamente válido de metadados
falsos. A primitiva é honesta quanto a isso: trata-se de uma
primitiva de não-repúdio para as alegações contemporâneas do
órgão, e não de uma prova de que essas alegações estão corretas.

---

## Casos históricos ou quase históricos em que o kit teria ajudado

O kit teria produzido uma âncora útil — *não uma resolução* —
em casos passados em que a cadeia de custódia de provas digitais
se tornou questão probatória contestada. Para evitar nomear réus
(que são partes privadas mesmo quando condenados), estes são
descritos por tipo de caso, e não por indivíduo nomeado:

- **A controvérsia federal de meados da década de 2010 sobre um
  bug em ferramenta forense**, na qual uma ferramenta de imagem
  forense amplamente utilizada veio a se mostrar, após a
  aquisição, portadora de um bug em um caso-limite que afetava
  um tipo específico de mídia de origem. Um manifesto de
  aquisição selado, com dados congelados de versão da ferramenta
  e hash de binário, teria permitido que defesa e acusação
  concordassem exatamente sobre qual versão foi usada,
  eliminando um eixo de disputa.

- **Vários casos estaduais envolvendo saídas contestadas de
  extração de dispositivos móveis**, em que o fornecedor da
  ferramenta de extração lançou posteriormente um patch de
  correção e a pergunta passou a ser "o bug afetou este caso".
  Um fato de metodologia selado permite que a pergunta seja
  respondida em face de dados de versão congelados, em vez da
  memória atual do órgão sobre qual versão foi usada.

- **Disputas sobre transferência de imagens de câmeras
  corporais**, em casos em que se alegou posteriormente que o
  sistema de dock do fornecedor da câmera corporal permitia a
  modificação das gravações em trânsito. Um manifesto selado
  do arquivo da câmera corporal no momento do recebimento pelo
  órgão ancora quais bytes o órgão recebeu do sistema de dock;
  edições posteriores do lado do órgão são publicamente
  detectáveis.

- **Controvérsias de colisão de hash em casos de informática
  forense**, em que um perito da defesa argumentou que o MD5
  (ainda em uso em alguns fluxos de trabalho legados) era
  inadequado. Uma aquisição selada que registra TANTO MD5
  QUANTO SHA-256 permite que o SHA-256 se mantenha mesmo que
  o MD5 seja impugnado.

- **Disputas sobre evolução da metodologia de exame entre a
  aquisição e o julgamento.** Quando um caso fica entre
  aquisição e julgamento por anos, a metodologia que era
  padrão na aquisição pode ter sido superada na época do
  julgamento. O registro selado permite ao tribunal avaliar a
  metodologia em face do padrão vigente no momento da
  aquisição, e não em face do padrão posterior.

O kit NÃO teria resolvido as disputas subjacentes sobre culpa
ou inocência em nenhum desses tipos de caso. Teria resolvido
uma subquestão probatória específica: se os bytes, as
ferramentas e os procedimentos eram aquilo que o órgão alega
que eram no momento em que o órgão alega que eram.

---

## Quando usar este kit

- Seu órgão possui um POP forense estável e deseja acrescentar
  uma atestação pública ancorada em Bitcoin como camada com
  evidência de adulteração sobre a cadeia de custódia em papel
  e assinatura já existente.
- Você espera que este caso envolva contestação significativa
  da defesa às provas forenses (caso de alto risco, metodologia
  inédita, versões de ferramentas contestadas, etc.).
- Você pode publicar o conjunto de fatos listado sem expor PII
  ou dados de reidentificação de pessoas vulneráveis. (As
  regras de recusa do kit fazem cumprir isso; se seus fatos
  exigirem uma exceção a uma regra de recusa, não use o kit.)
- A consultoria jurídica do órgão adquirente e o Ministério
  Público (ou equivalente) revisaram o plano de publicação. A
  publicação pública de um artefato que contenha identificador
  de processo tem implicações para investigações em curso; a
  revisão jurídica não é opcional.
- As regras de descoberta da defesa em sua jurisdição são
  compatíveis com a manutenção, em separado, pelo órgão, do
  registro de vínculo papel-a-indivíduo (com hash no FATO 05).
  Se sua jurisdição exigir a divulgação pública do nome do
  perito, é preciso emendar o kit conforme isso.

## Quando NÃO usar este kit

- **Não use como substituto da documentação de cadeia de
  custódia existente do órgão.** Este kit é *aditivo*, não
  substitutivo. O CMS do órgão, o log de custódia e as
  obrigações de produção em descoberta permanecem inalterados.
- **Não use se a aquisição envolver material de exploração
  sexual de crianças, modelos biométricos ou outros dados de
  reidentificação de pessoas vulneráveis em nível de arquivo.**
  Hashes em nível de imagem de discos inteiros são aceitáveis;
  hashes em nível de arquivo desse tipo de material NUNCA são
  aceitáveis, mesmo sob dispensa de regra de recusa. Se você
  não conseguir construir um conjunto de fatos sem quebrar R3,
  não use o kit.
- **Não use para alegar que o mandado foi lícito, que a
  apreensão foi adequada ou que a prova é admissível** — o
  kit não pode fazer isso, e a regra de recusa R5 rejeitará
  qualquer alegação desse tipo.
- **Não use sob pressão para selar antes que a aquisição
  esteja concluída.** Um selo de aquisição parcial distorce o
  estado.
- **Não use para publicar nomes pessoais de peritos** a menos
  que sua jurisdição especificamente o exija e que seus
  peritos tenham consentido individualmente. O padrão é
  publicação em nível de papel.
- **Não use em casos selados ou sob sigilo** sem autorização
  expressa do tribunal. Publicar um identificador de processo
  no Bitcoin é irreversível; se o caso for posteriormente
  selado, o selo público não pode ser retirado. O kit serve
  apenas para aquisições de registro público.
- **Não use como teatro de legitimidade.** Um selo de uma
  aquisição falha é um registro público permanente das
  falhas, não uma defesa contra elas. A primitiva corta nos
  dois sentidos; essa é a sua honestidade.

## Como bifurcar este kit para uma aquisição real

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Cronometragem crítica:** sele NO momento da, ou logo após, a
conclusão da imagem (evento E17 do FATO 05 na linha do tempo
do exemplo). Um selo durante a imagem cria um registro de
aquisição parcial; um selo muito posterior cria um intervalo
durante o qual o órgão poderia ter alterado as imagens. A
janela correta é imediatamente após a conclusão da verificação
de imagem do último item do conjunto de exibições.

**Revisão crítica:** antes de selar, passe a publicação por um
segundo perito forense (não o principal) e pelo assessor
jurídico do órgão. Uma vez selada, a publicação é permanente.

## Integração com a infraestrutura existente de cadeia de custódia

- **Sistema de Gestão de Casos (CMS) do órgão.** O CMS continua
  sendo o sistema primário de registro do órgão. O selo não
  substitui o CMS; ele se compromete com os bytes e a
  metodologia que o CMS registra, de modo que edições
  posteriores do CMS sejam publicamente detectáveis.
- **Federal Rules of Evidence / Daubert / códigos probatórios
  estaduais.** O selo contribui para o registro de autenticação
  da FRE 901 ao fornecer integridade com evidência de
  adulteração. Ele NÃO satisfaz a FRE 702 / Daubert por si só;
  a confiabilidade metodológica ainda é testada na audiência
  probatória.
- **Descoberta pela defesa (FRCP 16, Brady, Giglio e
  equivalentes estaduais).** Os registros complementares com
  hash no FATO 05 (vínculo papel-a-indivíduo, log de custódia,
  fotos de lacre antiviolação, etc.) permanecem sujeitos à
  descoberta normal. O selo ancora o que esses registros
  alegavam no momento da aquisição, de modo que uma alegação
  posterior do tipo "o registro era diferente naquela época"
  seja publicamente refutável.
- **NIST Computer Forensics Tool Testing (CFTT).** O kit faz
  referência aos logs de verificação do CFTT no FATO 04 /
  FATO 05; a referência é um hash, não o próprio log, de modo
  que os processos do CFTT permanecem inalterados.
- **Auxiliares neutros nomeados pelo tribunal e peritos da
  defesa.** Tanto um quanto outro podem rehashear as imagens
  forenses que recebem na descoberta contra o manifesto do
  FATO 03, independentemente de qualquer cooperação do órgão.
  Esse é o principal valor agregado do kit para o lado da
  defesa.
- **Revisão recursal.** Anos depois, um revisor forense em
  fase recursal pode verificar a metodologia de aquisição
  original contra o registro selado do FATO 04, em vez de
  contra a recordação atual, possivelmente alterada, do
  órgão.

## O que este kit NÃO substitui

- As Federal Rules of Evidence (ou qualquer código probatório
  estadual).
- Os padrões de confiabilidade Daubert / Frye para testemunho
  pericial.
- O POP forense e o CMS do órgão.
- As obrigações de descoberta pela defesa sob FRCP 16 / Brady /
  Giglio / equivalentes estaduais.
- Ordens judiciais, pedidos de supressão, audiências
  probatórias ou qualquer outro processo administrado pelo
  tribunal.
- NIST CFTT ou qualquer outro regime de teste de ferramentas.
- O protocolo de filtro de privilégio / equipe de blindagem do
  órgão.

## Por que este kit existe na v0.4.0+

Este é o 8.º exemplo trabalhado distribuído com o myriam-kit.
Ele segue a estrutura de restrição-primeiro validada pela
autopesquisa documentada em
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — a variante de prompt
restrição-primeiro obteve a pontuação mais alta em uma rubrica
ponderada por múltiplos domínios de exemplo. As seções de
abertura são as partes estruturais do kit; o conteúdo do
manifesto é a parte fácil.

O desenho do kit é deliberadamente conservador quanto à
publicação do nome dos peritos e agressivo quanto à advertência
de que "isto não estabelece admissibilidade". A comunidade
forense tem um histórico documentado de sofrer ataques por seu
trabalho forense; o kit assume, por padrão, a posição mais
segura para os peritos. Órgãos em jurisdições onde a
nomeação pessoal pública é exigida podem emendar seu fork
conforme isso, mas a recusa padrão favorece a segurança dos
peritos.

## Licença

Domínio público (CC0). Faça fork. Nenhuma atribuição é
necessária.
