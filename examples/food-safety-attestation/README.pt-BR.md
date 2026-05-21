*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Atestação de Segurança Alimentar

Um exemplo de myriam-kit pronto para uso, destinado a fabricantes
de alimentos, inspetores de segurança alimentar, certificadores
terceirizados e autoridades regulatórias que desejam publicar um
selo ancorado em Bitcoin, com evidência de adulteração, sobre *o
que disseram os testes de liberação* e *qual decisão de liberação
foi tomada*, no momento da liberação do lote ou da assinatura do
relatório de inspeção — de modo que qualquer modificação silenciosa
pós-liberação do registro de testes, da decisão de liberação ou
dos compromissos de recall seja publicamente detectável.

---

## O que este kit NÃO faz (leia primeiro)

O selo é uma marca temporal criptográfica de QUAIS testes de
liberação foram realizados em QUAL lote, por QUAIS laboratórios
acreditados, sob QUAIS métodos, com QUAIS resultados, e de qual
DECISÃO DE LIBERAÇÃO a autoridade de QA tomou com base nesses
resultados. Ele não pode responder a nenhuma pergunta sobre
segurança alimentar além disso. O seguinte está **fora do domínio
do selo**:

1. **Prevenção de contaminação.** O kit ancora o que os resultados
   dos testes DISSERAM no momento da liberação. A contaminação tem
   muitas causas — distribuição microbiana heterogênea dentro de um
   lote, abuso de temperatura na distribuição pós-liberação, falhas
   de manuseio no varejo, falhas de preparo pelo consumidor, perigos
   novos ou não rastreados (por exemplo, adulteração com melamina
   antes que a triagem para melamina fosse rotineira), fraude na
   cadeia de suprimentos acima do escopo de testes do fabricante.
   O selo não previne nenhum desses e não afirma fazê-lo.

2. **Garantia de que todas as unidades de um lote aprovado são
   seguras.** A contaminação microbiológica em produto alimentício
   a granel é HETEROGÊNEA. Listeria, Salmonella e patógenos STEC
   ocorrem em focos localizados de baixa prevalência, não
   distribuídos uniformemente. Os planos de amostragem da ICMSF e
   do Codex têm uma probabilidade documentada e limitada de
   detectar contaminação presente em baixa prevalência — a
   probabilidade NÃO é 1. Um lote que passa na amostragem de
   liberação ainda pode conter unidades contaminadas que não foram
   amostradas. O selo ancora as AMOSTRAS, não a massa. Esta
   restrição é reiterada explicitamente no FATO 03 e é o limite
   honesto mais importante deste kit.

3. **Certificação de que os testes de liberação foram conduzidos
   honestamente.** O selo ancora o que os testes relataram na
   liberação. Um laboratório que relata uma APROVAÇÃO fraudulenta
   na liberação produz um selo criptograficamente válido de uma
   APROVAÇÃO fraudulenta. O kit torna a modificação silenciosa
   posterior detectável, mas não detecta fraude contemporânea. A
   detecção de fraude contemporânea exige auditoria, supervisão
   da acreditação laboratorial (vigilância ISO 17025), programas
   de testes de proficiência e inspeção regulatória — tudo isso
   está acima do selo.

4. **Substituição às submissões regulatórias da FSMA, FSIS ou às
   autoridades competentes da UE.** Os registros de liberação
   sob a FSMA, a FSIS, o Regulamento (CE) 178/2002 da UE e o
   Codex Alimentarius são mantidos por força de lei e produzidos
   sob demanda do regulador. O selo acrescenta uma camada pública
   com evidência de adulteração SOBRE essas submissões; ele NÃO
   as substitui. Uma publicação selada não é um arquivamento
   regulatório.

5. **Resolução de disputas sobre o escopo do recall.** O kit pode
   selar os compromissos de recall assumidos na liberação
   (FATO 06) e um escopo de recall posterior como uma nova
   publicação; mas o limite de quais lotes são afetados, quais
   unidades foram enviadas, quais varejistas as receberam e
   quais consumidores foram expostos ainda é uma investigação
   de rastreabilidade para trás e para frente. O selo ancora
   aquilo a que o fabricante se COMPROMETEU e o que ele depois
   FEZ. Ele não resolve a questão epidemiológica subjacente.

6. **Detecção de fraude deliberada na cadeia de suprimentos
   acima dos testes.** A adulteração com melamina do leite e da
   fórmula infantil na China em 2008 teve sucesso porque a
   melamina não estava no painel de analitos — a medição do
   equivalente proteico baseada no teor de nitrogênio estava, e
   a melamina a falsificou. Um FATO 03 selado com o painel de
   analitos em uso na época teria se comprometido publicamente
   com aquele painel — mas não teria feito nada para detectar o
   adulterante fora do painel. O valor do selo nesse caso teria
   sido a ancoragem forense de "isto é o que o fabricante alegou
   testar", NÃO a prevenção. Um regime real de segurança
   alimentar aborda isso por meio de amostragem não anunciada do
   regulador com triagem de amplo escopo (métodos LC-MS não
   direcionados, por exemplo), o que está acima do selo do
   fabricante.

7. **Ancoragem da distribuição pós-liberação e do manuseio pelo
   consumidor.** Uma vez que o lote deixa a instalação, o abuso
   de temperatura durante a distribuição, o mau manuseio no
   varejo, as falhas de armazenamento pelo consumidor e os erros
   de preparo pelo consumidor estão todos fora do escopo. O selo
   está limitado ao evento de liberação do fabricante. A
   evidência de adulteração a jusante exige kits separados nos
   níveis do distribuidor, do varejista e (para consumidores
   institucionais como escolas e hospitais) do ponto de uso.

8. **Aval para a segurança alimentar em qualquer população
   específica.** Resultados APROVADO no FATO 03 não implicam
   segurança para consumidoras gestantes, lactentes,
   consumidores imunocomprometidos ou idosos, para quem Listeria
   monocytogenes e Salmonella apresentam risco documentadamente
   elevado, mesmo em concentrações abaixo dos limites
   convencionais de detecção. O selo não pode fazer uma
   afirmação de segurança específica para uma população e se
   recusa a fazê-la (regra de recusa R6).

**A seção de limites honestos acima é a parte de sustentação
deste kit.** Fabricantes que tratam "nós selamos nosso registro
de liberação" como equivalente a "nós provamos que nosso alimento
é seguro" usam o primitivo de forma indevida. O kit precisa
afirmar de maneira clara: *este é um primitivo de não-repúdio
para as alegações contemporâneas do fabricante na liberação, não
uma prova de segurança, não um substituto para a supervisão
regulatória e não uma defesa contra os modos de falha por
contaminação heterogênea, fraude na cadeia de suprimentos ou
mau manuseio pós-liberação que mataram pessoas em surtos
passados.*

---

## O que este kit DEVE RECUSAR selar

O kit está configurado para rejeitar os seguintes padrões de
fatos, mesmo que um usuário com autoridade válida de assinatura
pelo fabricante os submeta:

- **Identificação pessoal de qualquer trabalhador, supervisor,
  pessoal de QA, inspetor visitante ou auditor terceirizado.**
  Nomes, números de matrícula, números de crachá, números de
  seguridade social, endereços residenciais, números de telefone
  pessoais — nenhum destes aparece no selo público. Os papéis
  são públicos; as vinculações pessoa-papel são seladas
  separadamente e descobríveis por processo regulatório. A
  segurança do trabalhador contra retaliação e assédio é a
  restrição de sustentação; a atestação de segurança alimentar
  pode ser feita no nível de papel. (R1)

- **Localização precisa da instalação.** A região da instalação
  (estado ou região multiestadual) é aceitável; endereço
  residencial preciso, coordenadas GPS ou qualquer identificador
  de granularidade suficiente para identificar fisicamente a
  planta em um mapa NÃO é aceitável. O número regulatório de
  estabelecimento é o identificador da instalação para o
  regulador; considerações de segurança física e de segurança
  do trabalhador argumentam contra publicar um endereço público
  no Bitcoin. (R2)

- **Padrões pessoais de turnos de produção individuais.** Escalas
  de turnos, rodízios individuais de trabalhadores, IDs pessoais
  de operadores de linha — nenhum destes aparece no selo. Padrão
  de vida de trabalhadores individuais não deve poder ser
  derivado da atestação pública. (R3)

- **Identidades de fornecedores que comprometem contratos.**
  Nomes de fornecedores, locais das instalações dos fornecedores,
  códigos de lote dos fornecedores (exceto no caso de
  contaminação na cadeia de suprimentos em que nomear o lote
  contaminado de um fornecedor é necessário para a saúde pública,
  o que é tratado por meio de uma publicação selada separada)
  NÃO são publicados no selo de liberação. Muitos contratos de
  fornecimento contêm cláusulas de confidencialidade; o selo não
  as viola por padrão. (R4)

- **Listas de clientes e destinos de distribuição além do nível
  agregado.** Um resumo regional agregado é aceitável; listas
  específicas de clientes (varejistas, centros de distribuição,
  contas de foodservice) NÃO são aceitáveis. A identidade do
  cliente é contratualmente confidencial e competitivamente
  sensível; o regulador obtém a lista de clientes por meio dos
  canais estabelecidos de coordenação de recall. (R5)

- **Alegações de segurança ou conclusões jurídicas.** O kit não
  selará "este produto é seguro", "este lote atende a todas as
  normas aplicáveis de segurança alimentar", "isto é GRAS para
  este uso" ou qualquer outra conclusão de segurança ou
  jurídica. O kit ancora o registro dos testes e a decisão de
  liberação, NÃO uma conclusão de segurança. (R6)

- **Padrões de reidentificação de queixas de trabalhadores ou
  denunciantes.** O kit se recusa a publicar qualquer padrão
  que possa reidentificar um trabalhador que tenha apresentado
  uma queixa à OSHA, ao USDA ou interna à empresa sobre
  práticas de segurança alimentar ou segurança no trabalho.
  Esses denunciantes são protegidos sob a Seção 402 da FSMA e
  estatutos paralelos; o selo não deve se tornar um vetor de
  reidentificação. As atestações de denunciantes têm seu
  próprio kit (`examples/whistleblower-manifest`) com regras de
  recusa ajustadas para esse caso de uso. (R7)

- **Selagem por qualquer pessoa que não seja o principal
  autorizado do fabricante liberador.** Um certificador
  terceirizado, uma equipe de QA do cliente ou um auditor
  independente pode usar o mesmo kit para selar SUAS próprias
  conclusões de auditoria; NÃO pode selar a decisão original de
  liberação em nome do fabricante. O principal de assinatura no
  FATO 08 é o único signatário válido para isso. (R8)

Uma recusa em si pode ser selada como um fato ("Este fabricante
solicitou a selagem de X; o kit recusou pela regra de recusa Y"),
criando um registro público de tentativa de uso indevido.

---

## O que este kit SELA

8 fatos no momento da liberação:

1. **Aviso de exemplo** — declara a publicação como exemplo
   (atestações reais removem ou substituem isso).
2. **Identificação do produto e do lote** — nome do produto,
   categoria, fabricante, região da instalação (NÃO localização
   precisa), versão do plano HACCP + hash, ID do lote, datas de
   produção / embalagem / validade, número de unidades para o
   consumidor, requisitos de armazenamento, os três pontos
   críticos de controle com hashes dos registros logados
   (letalidade de cozimento, estabilização de resfriamento,
   ambiente RTE pós-letalidade).
3. **Resultados dos testes de liberação** — testes microbiológicos
   do produto acabado (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), testes químicos / de resíduos (nitrito,
   resíduos veterinários, metais pesados), verificação de
   contato cruzado de alérgenos, resumo do monitoramento
   ambiental, cada um com o SHA-256 do PDF completo do relatório
   e a restrição explícita de interpretação amostra-versus-massa.
4. **Metodologia e qualificação laboratorial** — qual método (e
   qual versão do documento do método) foi usado por linha,
   quais laboratórios realizaram quais testes, o status de
   acreditação ISO/IEC 17025:2017 e o hash do certificado de cada
   laboratório, resultados recentes de testes de proficiência,
   declaração de independência, registro de desvio / reteste /
   OOS para este lote.
5. **Decisão de liberação** — data de liberação, autoridade de
   liberação no nível de papel + contra-assinatura, resumo dos
   registros que sustentam a decisão, destinos de distribuição
   agregados, obrigações pós-liberação reconhecidas na liberação,
   compromisso de prazo e irreversibilidade.
6. **Compromissos de recall e de vigilância pós-mercado** — o
   análogo de segurança alimentar à farmacovigilância:
   transparência de sinais de doença, compromissos de execução
   do recall (limiares 24h / 72h / 98%), resposta à contaminação
   na cadeia de suprimentos, compromisso de não retestagem
   silenciosa, compromisso de não mudanças pós-fato em
   especificações, compartilhamento agregado de sinais de
   segurança.
7. **Divulgações complementares e registro de recusas** — hash
   do registro de investigação de ação corretiva, histórico
   recente de inspeções, histórico de recalls, problemas
   abertos conhecidos nos métodos de teste utilizados,
   vinculação papel-indivíduo (selada separadamente, com hash
   aqui), prontidão para rastreabilidade de fornecedores, lista
   explícita das regras de recusa R1-R8 com quaisquer recusas
   exercidas durante esta liberação.
8. **Principal de assinatura** — fabricante + signatário no
   nível de papel (Diretor de QA) + contra-assinatura no nível
   de papel (Gerente de Planta) + informações da chave
   criptográfica; justificativa para a publicação no nível de
   papel.

Cada fato termina com a convenção do portão de recusa: *"Este
fato afirma apenas X. Não afirma Y"* (onde Y é o modo de falha
mais próximo da seção "NÃO faz" acima).

---

## Contra o que este kit defende

- **Modificação retroativa silenciosa dos resultados dos testes
  de liberação.** Todos os PDFs dos relatórios de teste têm hash.
  Re-hashear pós-liberação revela qualquer modificação.
- **Disputas sobre quais métodos, quais versões dos documentos
  de método e quais laboratórios foram usados.** O FATO 04
  congela a metodologia e o status de acreditação dos
  laboratórios na liberação. Alegações posteriores como "na
  verdade usamos MLG 4.13, não 4.12" são publicamente refutáveis.
- **Reespecificação retroativa de um lote fora de especificação.**
  Se um resultado de teste de liberação foi na verdade uma
  APROVAÇÃO limítrofe que é reclassificada como REPROVAÇÃO
  pós-liberação, os hashes selados do relatório provam o que o
  PDF do resultado original dizia. Simetricamente, um OOS
  limítrofe que é silenciosamente retestado para uma APROVAÇÃO
  sem divulgação é detectável se o compromisso de não retestagem
  silenciosa do FATO 06 for posteriormente comparado a uma
  emenda não selada.
- **Minimização silenciosa do escopo do recall.** Os compromissos
  de recall no FATO 06 (notificação em 24h, início em 72h, 98%
  de recuperabilidade) estão selados; o descumprimento deles é
  publicamente observável.
- **Renarração pós-fato do histórico de ações corretivas.** O
  hash do registro de ações corretivas no FATO 07 congela o que
  a empresa DISSE que fez após o presuntivo do EMP; alegações
  posteriores "fizemos mais / menos do que isso" são
  publicamente refutáveis.
- **Omissão seletiva de divulgações complementares.** O FATO 07
  enumera as categorias de divulgação esperadas (histórico de
  inspeções, histórico de recalls, revisão de avisos sobre
  métodos, prontidão de rastreabilidade); uma categoria vazia
  deve ser explicitamente atestada ("nenhuma no momento da
  liberação"), de modo que um posterior "não percebemos que isso
  era relevante" seja publicamente refutável.
- **Substituição do status de acreditação por outro laboratório.**
  O FATO 04 congela o escopo ISO 17025 e o hash do certificado
  de cada laboratório na liberação; uma substituição posterior
  por um laboratório não acreditado é publicamente detectável.

O kit **não** defende contra corrupção contemporânea — uma equipe
que intencionalmente sela resultados falsos de testes no momento
da liberação produz um selo criptograficamente válido de
resultados falsos. O primitivo é honesto quanto a isso: trata-se
de um primitivo de não-repúdio para as alegações contemporâneas
do fabricante, não uma prova de que essas alegações estão
corretas.

---

## Precedentes históricos de mortalidade

O kit teria produzido uma âncora útil — *não uma solução* — em
falhas passadas de segurança alimentar. Para evitar difamar
indivíduos (a maioria das falhas de segurança alimentar é
corporativa, não individual; algumas são litigadas criminalmente
e outras não), estas referências descrevem o surto por ano e
patógeno e nomeiam a entidade envolvida apenas quando a
contaminação foi publicamente atribuída por aviso de recall ou
por registro judicial.

- **Adulteração com melamina de fórmula infantil e laticínios na
  China em 2008 (Grupo Sanlu e outros).** Pelo menos seis mortes
  de lactentes e ~300.000 doenças atribuíveis a laticínios
  contaminados com melamina projetados para inflar fraudulentamente
  o conteúdo aparente de proteína em ensaios baseados em
  nitrogênio Kjeldahl. Seguiram-se condenações em tribunais da
  RPC, incluindo sentenças de morte. *O selo não teria evitado
  isso* — a melamina estava fora do painel padrão de analitos.
  O selo teria se comprometido publicamente com o painel que
  ESTAVA em uso, deixando claro, de forma forense, o escopo da
  expansão pós-incidente da triagem de rotina.

- **Surto europeu de STEC O104:H4 em 2011 (brotos de feno-grego
  rastreados até uma fazenda alemã).** 53 mortes, ~3.950 doenças
  em vários países europeus; finalmente rastreado até sementes
  de feno-grego importadas do Egito e germinadas em um produtor
  alemão. A rastreabilidade foi prejudicada por documentação
  inconsistente em nível de lote ao longo da cadeia de
  suprimentos multinacional. *O selo não teria evitado a
  contaminação do lote de sementes* (a contaminação estava
  acima dos testes do produtor de brotos); teria ancorado o que
  os testes de liberação do produtor de brotos alegaram e, se
  usado no nível do importador de sementes, o que o manuseio
  das sementes importadas alegou, tornando a rastreabilidade
  mais rápida.

- **Surto de Listeria monocytogenes na Blue Bell Creameries em
  2015 (Estados Unidos).** 3 mortes, 10 doenças em vários
  estados; levou a um recall nacional e a uma condenação criminal
  federal em 2020 da Blue Bell por acusações contravencionais de
  segurança alimentar, com a empresa firmando um acordo de
  suspensão de processo e pagando US$ 19,35 milhões. Litígios
  civis subsequentes. *O selo não teria evitado* a contaminação
  ambiental por Listeria dentro da planta; teria ancorado
  forensicamente os registros do programa de monitoramento
  ambiental, tornando qualquer pergunta pós-incidente sobre "o
  que o EMP mostrou nos meses anteriores ao surto" respondível
  contra um registro datado e com evidência de adulteração, em
  vez de contra documentos produzidos posteriormente.

- **Surtos multistaduais de STEC O157:H7 em 2018 ligados à
  alface romana (região produtora de Yuma, depois região
  produtora de Salinas).** Pelo menos 5 mortes e ~210 doenças
  em vários surtos naquele ano. A rastreabilidade foi
  complicada por produto ensacado de origem mista. *O selo não
  teria evitado* a contaminação no nível do campo / água de
  irrigação (acima do fabricante); teria ancorado forensicamente
  o registro de testes de recebimento e de liberação de cada
  processador, tornando a rastreabilidade mais rápida e o
  registro público criptograficamente mais defensável contra
  disputas posteriores.

- **Surto de Salmonella Typhimurium da Peanut Corporation of
  America (2008-2009, Estados Unidos).** 9 mortes, ~714 doenças;
  resultou em condenações criminais federais de 2014-2015 de
  executivos da PCA, incluindo uma pena de 28 anos de prisão
  para o CEO por acusações de conspiração e obstrução. *O selo
  não teria evitado* a contaminação, a sub-investigação de
  testes positivos para Salmonella dentro da planta ou a decisão
  no nível executivo de enviar o produto contra esses achados
  positivos. ELE TERIA deixado forensicamente claro, em juízo,
  o que os resultados dos testes DIZIAM no momento em que foram
  gerados — tornando o caso da acusação contra e-mails
  contemporâneos com narrativas falsas substancialmente mais
  ancorado contra modificação documental.

Em cada um desses casos, o kit teria fornecido uma linha do tempo
forense mais limpa. Em nenhum desses casos o kit teria, por si
só, evitado as mortes. O selo é infraestrutura forense, não
infraestrutura de prevenção. Essa distinção é a honestidade do
kit.

---

## Quando usar este kit

- Sua operação de manufatura tem um programa estável de HACCP /
  Controles Preventivos e quer adicionar uma atestação pública
  ancorada em Bitcoin como uma camada com evidência de
  adulteração sobre o fluxo de trabalho de documentação de
  liberação existente.
- Você é um fabricante de pequeno a médio porte ou um fabricante
  em uma jurisdição com infraestrutura regulatória mais fraca,
  desejando ancorar registros de lote contra uma linha do tempo
  globalmente verificável — para confiança no mercado de
  exportação, para resposta a auditorias de clientes ou para
  participação em iniciativas voluntárias de transparência.
- Você é um inspetor de segurança alimentar ou certificador
  terceirizado e quer publicar um selo de constatações de
  auditoria com evidência de adulteração na assinatura, de modo
  que as constatações da auditoria não possam ser silenciosamente
  emendadas mais tarde por acordo entre o fabricante e o
  certificador.
- Você espera que este lote enfrente escrutínio significativo a
  jusante (mercado de exportação, categoria de alto risco como
  carne RTE ou fórmula infantil, ingrediente novo, histórico
  recente de recalls).
- Você pode publicar o conjunto de fatos listados sem quebrar as
  regras de recusa R1-R8. Se seus fatos exigirem uma quebra de
  R1-R8, não use o kit; corrija primeiro as entradas de dados.
- A assessoria jurídica do fabricante revisou o plano de
  publicação. A publicação pública de um artefato que carrega
  identificador de lote tem implicações para a exposição em
  responsabilidade pelo produto; a revisão pela assessoria
  jurídica não é opcional.

## Quando NÃO usar este kit

- **Não use como substituto dos registros regulatórios FSMA /
  FSIS / UE.** O selo é *aditivo*, não substituto. Seus
  registros estatutários de liberação, seu plano HACCP, seus
  logs de CCP e seu plano de recall permanecem inalterados.
- **Não use como alegação de segurança.** Selar um registro de
  liberação aprovado não estabelece que o produto é seguro;
  estabelece que o registro tinha este conteúdo em bytes neste
  momento. A regra de recusa R6 rejeitará qualquer conclusão
  de segurança.
- **Não use para publicar identidades de fornecedores, listas
  de clientes, nomes de trabalhadores ou endereços de
  instalações.** As regras de recusa R1-R5 existem por razões
  de segurança humana e contratuais; não emende o kit para
  contorná-las sem consultar a assessoria jurídica.
- **Não use sob pressão para selar antes que os testes de
  liberação estejam concluídos.** Um selo de dados parciais
  representa de modo enganoso o estado da decisão de liberação.
- **Não use como teatro de legitimidade.** Um selo de um plano
  de amostragem mal projetado ou de um painel de analitos mal
  escolhido é um registro público permanente da inadequação, não
  uma defesa contra ela. O primitivo corta nos dois sentidos;
  essa é a sua honestidade.
- **Não use durante uma situação de recall ativo como substituto
  da coordenação de recall do regulador.** Uma nova publicação
  MYRIAM ancorando o escopo do recall é apropriada APÓS o
  recall coordenado pelo regulador ter sido iniciado; não
  substitui o canal de recall do regulador.

## Como fazer fork deste kit para uma liberação real

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**CRONOLOGIA CRÍTICA:** sele no momento da liberação de QA, ANTES
de o lote ser distribuído (antes que o primeiro caminhão deixe a
instalação). Um selo após o início da distribuição ainda tem
valor, mas não ancora o estado pré-distribuição de forma limpa.
A janela correta é entre a assinatura de liberação de QA e o
primeiro movimento de distribuição.

**REVISÃO CRÍTICA:** antes de selar, submeta a publicação a um
segundo revisor de QA (não o líder) e à assessoria jurídica da
empresa. Uma vez selada, a publicação é permanente.

## Integração com a infraestrutura de segurança alimentar existente

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  A URL da publicação selada ou o CID do IPFS pode ser
  referenciado na documentação do Food Safety Plan como o
  artefato de atestação pública para este lote.
- **Planos HACCP e registros de liberação do USDA FSIS.** O
  registro de liberação selado fica junto aos registros HACCP
  exigidos pela FSIS; o selo referencia o hash da versão do
  plano HACCP (FATO 02), de modo que disputas posteriores sobre
  qual versão do plano estava em vigor sejam publicamente
  refutáveis.
- **Codex Alimentarius / princípios HACCP** (Codex CAC/RCP
  1-1969 Rev. 4-2003). O selo compromete-se às saídas HACCP dos
  sete princípios (análise de perigos, CCPs, limites críticos,
  monitoramento, ações corretivas, verificação, manutenção de
  registros) para este lote.
- **ISO 22000:2018 (Sistemas de Gestão de Segurança de
  Alimentos).** O selo pode ser referenciado como parte da
  trilha de evidências da análise crítica pela direção; não
  substitui a certificação ISO 22000.
- **Esquema de certificação FSSC 22000 v6.** Compatível como
  camada aditiva de transparência; o auditor da FSSC pode
  verificar o selo durante a vigilância.
- **Regulamento (CE) 178/2002 da UE (Legislação Alimentar Geral)
  Artigo 18 (rastreabilidade) e Artigo 19 (notificação de
  recall).** O selo compromete a prontidão de rastreabilidade
  um-nível-para-trás do fabricante (FATO 07) e os compromissos
  de recall (FATO 06); não substitui a obrigação estatutária
  de notificação do Artigo 19.
- **Pacote Higiene da UE (Regulamentos 852/2004, 853/2004,
  854/2004, 882/2004).** Compatível; o selo referencia o
  equivalente aos registros de HACCP e autocontroles do Pacote
  Higiene.
- **Esquemas de padrões privados BRCGS / SQF.** Compatível como
  camada aditiva de transparência.
- **Sistemas de vigilância de saúde pública (CDC PulseNet,
  FoodNet, IFSAC; EU EFSA / ECDC).** Diretamente fora do escopo
  do selo, mas o FATO 06 compromete o fabricante a participar
  e a selar quaisquer eventos de correlação de sinais como
  novas publicações MYRIAM.

## O que este kit NÃO substitui

- Registro de Instalação Alimentar da FDA ou aprovação de
  Estabelecimento do USDA FSIS.
- Seu Plano de Segurança Alimentar / Plano HACCP escrito sob
  FSMA / FSIS.
- Registros de monitoramento de CCP e registros de ações
  corretivas.
- Supervisão da acreditação laboratorial ISO 17025.
- Programas de testes de proficiência.
- Inspeção regulatória (inspeção contínua da FSIS, inspeção
  periódica da FDA, inspeção da autoridade competente da UE).
- Vigilância de saúde pública (CDC, EFSA, ECDC, equivalentes
  nacionais).
- Canais de coordenação de recall (FDA Reportable Food Registry,
  coordenação de recall da FSIS, RASFF da UE, equivalentes
  nacionais).
- Programas de segurança do trabalhador e de treinamento de
  manipuladores de alimentos.

## Por que este kit existe na v0.4.0+

Este é um dos exemplos elaborados que acompanham o myriam-kit.
Ele segue a estrutura de README orientada por restrições primeiro,
validada pela autoresearch documentada em
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — a variante de prompt
orientada por restrições primeiro obteve a maior pontuação em uma
rubrica ponderada ao longo de múltiplos domínios de exemplo,
porque atestação de segurança alimentar é exatamente o domínio em
que exagerar o que o selo prova é perigoso: pessoas morreram, e
morrerão, em falhas que o selo não pode prevenir. As seções
iniciais são as partes de sustentação do kit; o conteúdo do
manifesto é a parte fácil.

Os padrões do kit são deliberadamente conservadores quanto à
publicação de nomes de trabalhadores, conservadores quanto à
precisão da localização da instalação, conservadores quanto às
identidades de fornecedores e clientes, e agressivos quanto ao
aviso "isto não estabelece segurança". A comunidade de segurança
alimentar tem um histórico documentado de linguagem de
certificação exagerada; o kit assume por padrão a posição menos
suscetível de ser lida como uma garantia de segurança. Fabricantes
em jurisdições onde requisitos específicos de divulgação pública
diferem podem adaptar seu fork em conformidade, mas as recusas
padrão favorecem a segurança do trabalhador e o escopo honesto.

## Licença

Domínio público (CC0). Faça fork. Sem necessidade de atribuição.
