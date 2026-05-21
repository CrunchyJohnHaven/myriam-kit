*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Selo de Atestação de Gastos Públicos

Um exemplo myriam-kit pronto para uso voltado a governos municipais,
estaduais, provinciais e nacionais que desejam ancorar
criptograficamente os registros de execução orçamentária (adjudicações
de contratos, desembolsos, aceites de entregáveis) no momento da
emissão, de modo que a modificação retroativa silenciosa de registros
de gastos públicos se torne publicamente detectável.

O selo é um **ancoramento forense**, não uma certificação de
integridade. Ele registra aquilo que a autoridade financeira reportou
no dia em que reportou, numa forma que não pode ser silenciosamente
revisada depois sem produzir uma divergência criptográfica
publicamente visível.

---

## O que este kit NÃO faz (leia primeiro)

O selo é um carimbo criptográfico de data e hora daquilo que foi
atestado. Ele não pode verificar se aquilo que foi atestado era
**lícito, justo ou honesto**. Os modos de falha a seguir estão **fora
do domínio do selo**:

1. **Corrupção e propinas a montante.** Se uma licitação foi
   fraudada, um fornecedor foi selecionado em razão de suborno, uma
   justificativa de fonte única foi fabricada ou um contrato foi
   inflado por um percentual de propina previamente acordado — o selo
   ancora a transação como-registrada, com o preço inflado e o
   fornecedor favorecido, em alta integridade. O selo observa a saída
   do sistema financeiro; ele não tem qualquer visibilidade sobre a
   corrupção a montante da emissão. A *Operação Lava Jato* brasileira
   documentou propinas sistemáticas de ~3% administradas por cartel
   em milhares de contratos da Petrobras que teriam sido selados na
   emissão como se inteiramente rotineiros.

2. **Ocultação da titularidade real por meio de empresas de
   fachada.** Um contrato adjudicado a "Acme Construction Ltda." é
   selado com o nome da entidade no registro público. Se "Acme" for
   de fato controlada por uma pessoa politicamente exposta não
   declarada, ou for uma de dezenas de empresas de fachada
   controladas por um único cartel, o selo ancora a entidade de
   superfície. A transparência da titularidade real é um regime
   SEPARADO (Recomendação 24 do FATF, 5AMLD/6AMLD da UE, Corporate
   Transparency Act dos EUA) cuja saída requer seu próprio protocolo
   de selagem.

3. **Fraude contábil a montante da emissão.** Se a própria autoridade
   financeira fabricar o registro antes de selá-lo — contratos
   fantasma, funcionários fantasma na folha de pagamento, aceites de
   entregáveis fictícios —, o selo ancora a fabricação. O selo não
   pode detectar que o registro seja falso no momento em que é
   registrado; ele só pode detectar que o registro foi alterado APÓS
   a selagem.

4. **Publicação seletiva / cherry-picking.** Uma autoridade
   financeira poderia publicar um *subconjunto* de transações — as
   limpas — e selar apenas estas. O selo ancora aquilo que está na
   publicação; ele não ancora o universo das transações que
   deveriam estar na publicação. O FATO 07 deste kit (divulgações
   complementares e registro de recusas) é a defesa estrutural disso,
   mas depende de a autoridade emissora ser honesta sobre o que
   escolhe não selar.

5. **Gastos extraorçamentários ou fora dos livros.** Despesas
   públicas roteadas por empresas estatais, fundos soberanos,
   sociedades de propósito específico ou contas fiduciárias
   extraorçamentárias podem não aparecer no orçamento que o selo
   ancora. O selo registra o que foi reportado dentro do sistema
   orçamentário; despesas fora do sistema estão fora do domínio do
   selo. As disputas em torno da Coalition Provisional Authority
   (CPA) iraquiana em 2003–2004 envolveram cerca de USD 9 bilhões em
   desembolsos em dinheiro cujos registros foram parcialmente
   perdidos; selar os registros que existiam no momento do
   desembolso os teria ancorado, mas não teria criado registros que
   a CPA não manteve.

6. **Pressão pós-emissão por "explicação".** Um excedente selado,
   uma adjudicação de fonte única selada ou uma alteração contratual
   selada podem ser renarrados posteriormente com qualquer
   enquadramento que a autoridade política deseje. O selo ancora os
   FATOS na data de emissão, mas não prejulga a narrativa que esses
   fatos virão depois a sustentar.

7. **Atestação sob coação.** Se o principal financeiro responsável
   for coagido a assinar uma atestação que deturpa transações, o
   selo ancora a atestação coagida com a assinatura coagida. O selo
   verifica QUEM assinou (FATO 08), não POR QUE assinou. Selar uma
   atestação coagida produz um registro público permanente da saída
   coagida — útil para responsabilização posterior, mas não uma
   defesa contra a coação no momento.

8. **Comparação entre jurisdições.** Uma despesa selada é legível
   apenas frente ao regime jurídico de sua jurisdição emissora. "Por
   que o Município X pagou Y pelo serviço Z, quando o Município W
   pagou apenas V?" é uma pergunta de análise comparativa a jusante
   da selagem. O benchmarking interjurisdicional é uma tarefa
   analítica sobre os dados selados, não uma propriedade do selo.

**A seção de limites honestos acima é a parte estrutural deste kit.**
Funcionários financeiros e políticos que acreditem que selar equivale
a integridade usarão este kit como escudo. O kit precisa dizer
claramente: isto é uma *primitiva de não-repúdio para o momento da
emissão*, não uma prova da integridade da despesa.

---

## O que este kit DEVE RECUSAR selar

O kit está configurado para rejeitar os seguintes padrões fáticos,
mesmo que um usuário com autoridade válida de assinatura os submeta:

- **Nomes individuais de servidores públicos abaixo do nível do
  signatário principal.** Nenhum fato pode nomear funcionários
  individuais de unidades de compras, servidores individuais de
  tesouraria, membros individuais de comissões de avaliação ou
  qualquer pessoa natural que não exerça função pública de prestação
  de contas. O risco de retaliação para o pessoal operacional excede
  o benefício de transparência; suas identidades ficam seladas em
  controles internos (hash do log de aprovações no FATO 05), não no
  corpo da atestação.

- **PII de fornecedor.** Nenhum fato pode incluir números de conta
  bancária de fornecedores, nomes de empregados individuais de
  fornecedores, endereços residenciais de fornecedores, identificadores
  fiscais de pessoas naturais ligadas ao fornecedor, detalhamentos
  internos de preços que contenham a estrutura de custos do
  fornecedor, ou qualquer outro campo de PII comercial cuja
  publicação prejudique os interesses do fornecedor sem servir ao
  combate à corrupção. Tais informações podem ter HASH (FATO 05) mas
  não ser publicadas.

- **Despesas classificadas em sigilo de segurança.** Despesas
  classificadas sob estatutos de segurança nacional NÃO são elegíveis
  para selagem sob este kit. Tratamento de informações classificadas
  é um problema distinto, com requisitos criptográficos e legais
  distintos. A própria exclusão é divulgada no FATO 07 R3, para que
  o leitor saiba que a publicação é parcial por desenho.

- **Execução fiscal de obrigações tributárias contra pessoas
  naturais identificadas.** Embora os custos de execução sejam
  despesas públicas, nomear contribuintes individuais sob execução é
  recusado: o dano à privacidade excede o benefício de transparência,
  e existe transparência paralela sob o reporte da Justiça
  tributária.

- **Transações pré-emissão.** Nenhum contrato antes da adjudicação
  formal; nenhum desembolso antes da emissão formal. Selar um
  rascunho de contrato ou um pagamento pendente como se executado
  cria falsa certeza.

- **Selagem por qualquer pessoa que não seja o principal financeiro
  responsável.** Um contratado, fornecedor, vereador, jornalista ou
  observador não pode selar "o registro de gastos públicos" no lugar
  da autoridade financeira que o emitiu. (Eles podem selar as
  próprias observações sob o próprio principal, em publicação
  separada.)

- **Enquadramentos do tipo "livre de corrupção".** O kit recusa
  selar qualquer formulação na linha de "esta despesa foi lícita e
  livre de corrupção" ou "a licitação foi comprovadamente justa".
  Tais alegações estão epistemicamente fora do domínio do kit.

- **Publicações que omitam as divulgações complementares do
  FATO 07.** Uma publicação de transações sem o registro acompanhante
  de divulgação e recusa não é uma publicação MYRIAM legítima sob
  este kit.

Uma recusa em si pode ser selada como fato ("Esta parte solicitou a
selagem de X; o kit recusou conforme a regra de recusa Y"), criando
um registro público de tentativa de uso indevido. Num domínio em que
a pressão política sobre funcionários financeiros é documentada, um
registro de pedidos *recusados* é em si um sinal de integridade.

---

## O que este kit SELA

8 fatos no momento da atestação da execução orçamentária:

1. **Aviso de exemplo** — declara a publicação como exemplo
   (atestações reais removem ou substituem este aviso).
2. **Jurisdição e base legal** — qual entidade governamental está
   emitindo, sob qual autoridade estatutária, em qual exercício
   fiscal.
3. **Referência de dotação ou linha orçamentária** — as linhas
   específicas do orçamento aprovado em execução, com hashes do
   instrumento orçamentário e de quaisquer emendas / transferências
   / reprogramações aplicadas.
4. **Manifesto de contratos ou desembolsos** — registro por
   transação: valor, razão social do fornecedor (sem PII individual),
   finalidade, data, modalidade de contratação, base da adjudicação,
   hash do documento contratual.
5. **Hashes de documentos comprobatórios** — SHA-256 de editais,
   avaliações, contratos executados, alterações contratuais, pedidos
   de pagamento, termos de aceite de entregáveis, lançamentos do
   livro-razão da tesouraria, logs de aprovação de controles. Apenas
   hashes, não conteúdos — para proteger PII comercial e pessoal,
   habilitando ainda assim a verificação por re-hash.
6. **Estado de auditoria e fiscalização** — qual corpo de
   controladoria-geral / inspetoria-geral tem jurisdição, qual
   instituição superior de controle, qual órgão acusatório tem
   competência sobre crimes de corrupção, prazos de auditoria,
   estado atual de qualquer revisão em curso.
7. **Divulgações complementares e registro de recusas** — recursos
   licitatórios pendentes, investigações internas pendentes, pedidos
   de acesso à informação em aberto, revisões dissidentes,
   excedentes conhecidos de linhas orçamentárias; lista explícita dos
   padrões que o kit recusou selar.
8. **Principal signatário** — agente financeiro responsável + papel
   + responsabilidade estatutária + cossignatários sob controle
   dual; o que cada signatário está e o que não está atestando
   pessoalmente.

Cada fato termina com a convenção do portão de recusa: *"Este fato
afirma apenas X. Não afirma Y"* (onde Y é o modo de falha mais
próximo da seção "NÃO faz").

---

## Contra o que este kit defende

- **Revisão silenciosa pós-emissão de valores contratuais.** Qualquer
  alteração em qualquer valor no FATO 04 produz um SHA-256 diferente,
  raiz Merkle diferente, e falha na verificação OTS.
- **Substituição silenciosa de fornecedor.** Substituir "Fornecedor
  A" por "Fornecedor B" em um contrato já emitido é detectável a
  partir dos bytes selados.
- **Retroação de alterações contratuais.** O FATO 04 congela a data
  e a fundamentação da alteração contratual na emissão; qualquer
  alegação posterior de "este sempre foi o escopo acordado" precisa
  contender com o registro selado da alteração contratual.
- **Desaparecimento silencioso de transações desfavoráveis.** Todas
  as transações emitidas no período estão no FATO 04 sob uma única
  raiz Merkle. Publicar um subconjunto é detectável a partir da
  lista de hashes de folhas.
- **Supressão de divulgações complementares.** O FATO 07 congela o
  estado de recursos pendentes, investigações pendentes e pedidos de
  acesso à informação em aberto no momento da atestação. Qualquer
  alegação posterior de "nunca soubemos desse recurso" é
  publicamente comparável.
- **Deriva de jurisdição de auditoria.** O FATO 06 congela quais
  corpos têm jurisdição de fiscalização sobre as transações seladas.
  Uma alegação posterior de que uma determinada inspetoria-geral
  "não tinha autoridade" precisa contender com o registro selado de
  jurisdição.
- **Apagamento do registro de recusas.** O FATO 07 registra o que o
  kit recusou selar; qualquer alegação posterior de "nunca recusamos
  nada" contradiz o registro selado.

---

## Casos históricos em que o kit teria ajudado

O kit teria produzido um **ancoramento forense** útil — *não uma
correção, nem uma prevenção, nem um substituto para a persecução
penal* — em casos do registro público documentado envolvendo
modificação retroativa silenciosa de registros de gastos públicos:

- **Brasil — *Operação Lava Jato* / linhagem Petrobras (2014–2021).**
  Procuradores federais brasileiros documentaram um cartel de
  grandes empreiteiras que, por mais de uma década, pagou propinas
  em média de cerca de 3% em contratos da Petrobras e em outros
  contratos federais de infraestrutura, com a propina roteada a
  políticos e à coordenação de preços do próprio cartel. Os
  contratos como emitidos pareciam rotineiros; a corrupção era a
  montante da emissão. Um kit de selagem NÃO teria impedido a Lava
  Jato (as propinas estavam embutidas no preço ANTES de o contrato
  chegar ao selo), mas teria ancorado os termos contratuais na
  emissão — tornando a reconstrução forense posterior de "o que
  cada contrato de fato dizia quando foi assinado" enormemente mais
  barata. O custo investigativo da Lava Jato foi em grande parte o
  custo de remontar cronologias a partir de registros arquivados
  inconsistentes.

- **União Europeia — disputas sobre fundos de desenvolvimento
  regional (vários Estados-membros, anos 2010 a 2020).** Relatórios
  anuais do Tribunal de Contas Europeu identificaram repetidamente
  taxas de erro materiais em despesas dos Fundos Estruturais e de
  Investimento Europeus (ESIF) e do Fundo de Coesão, em alguns anos
  acima do limiar de materialidade. Disputas sobre "o que foi de
  fato reivindicado" versus "o que foi de fato entregue" recorrem
  porque a documentação das reivindicações pode ser revisada entre
  submissão e auditoria. A selagem MYRIAM por emissão da
  reivindicação-tal-como-submetida teria ancorado o conteúdo de
  cada reivindicação no momento da submissão, separando "o que o
  beneficiário reivindicou na época" de "o que a reconstrução
  pós-auditoria concluiu".

- **Iraque — desembolsos da Coalition Provisional Authority (CPA),
  2003–2004.** A CPA desembolsou cerca de USD 9 bilhões em dinheiro
  do Development Fund for Iraq com documentação que o Special
  Inspector General for Iraq Reconstruction (SIGIR) e relatórios
  de auditoria posteriores caracterizaram como substancialmente
  incompleta. Disputas sobre registros de desembolso persistem duas
  décadas depois. Selar no momento do desembolso não teria criado
  registros que a CPA não manteve — mas, onde qualquer registro
  existiu (livros manuscritos, autorizações de transferência
  datadas), um selo contemporâneo teria ancorado o estado byte a
  byte daquele registro no momento da emissão, separando "o
  registro na época" de "o registro tal como posteriormente
  reconstruído".

- **Grécia — revisões da dívida soberana e do relato de gastos
  públicos (2009–2010).** Auditorias do Eurostat em 2009–2010
  documentaram revisões substanciais aos dados fiscais gregos
  anteriormente reportados, com a própria metodologia da revisão
  contestada. A selagem dos relatórios trimestrais de gastos no
  momento da publicação original teria tornado o *delta* entre
  relatórios original e revisado publicamente comparável, em vez
  de reconstruível apenas por comparação de arquivo. O selo não
  teria impedido a disputa metodológica subjacente, mas teria
  ancorado cada trimestre reportado no momento do relatório
  original.

- **Reino Unido — compras públicas da pandemia (2020–2022).**
  Relatórios do UK National Audit Office e de comissões
  parlamentares identificaram processos de contratação durante
  2020–2021 nos quais contratos foram adjudicados sob disposições
  emergenciais com competição reduzida e documentação reduzida;
  algumas adjudicações foram posteriormente modificadas, canceladas
  ou compostas. A selagem por emissão de cada adjudicação
  emergencial teria ancorado a fundamentação da adjudicação e seus
  termos no momento da adjudicação, tornando modificações
  posteriores um delta publicamente visível, em vez de um registro
  silenciosamente modificado.

- **África do Sul — contratos de empresas públicas da era da captura
  de Estado (~2010–2018).** A Zondo Commission documentou contratos
  em várias empresas estatais (Eskom, Transnet, Denel) cuja
  documentação estava em graus variados incompleta, revisada ou
  contestada. A selagem de cada adjudicação contratual na emissão
  teria ancorado o estado tal-como-adjudicado do registro, separando
  as saídas posteriores de reconstrução forense do registro
  contemporâneo.

O kit NÃO teria impedido a corrupção subjacente em nenhum dos casos
acima. Em vários casos, o problema subjacente era que a corrupção
estava *a montante da emissão* — o selo ancora o contrato corrupto
em alta integridade, o que é um tipo distinto de utilidade
(ancoramento forense para responsabilização posterior), mas não o
mesmo que prevenção. Em outros casos (dinheiro vivo da CPA, gastos
extraorçamentários) o problema subjacente era que os registros a
serem selados não existiam ou não eram mantidos — o kit não pode
criar registros que a autoridade não produziu.

Esses casos históricos são nomeados apenas com referência a
constatações publicamente documentadas (autos judiciais, relatórios
de comissões parlamentares, publicações de órgãos de auditoria).
Nenhuma alegação é feita contra qualquer indivíduo; as constatações
institucionais documentadas se sustentam no registro público.

---

## Quando usar este kit

- Sua jurisdição tem um processo estabelecido de relato de execução
  orçamentária e deseja acrescentar um ancoramento público imutável.
- Você espera escrutínio pós-emissão (pedidos de acesso à
  informação, auditoria, monitoramento de sociedade civil,
  investigação jornalística) e quer um ponto de referência com
  evidência de adulteração.
- Você tem autoridade legal sob leis de transparência / dados
  abertos para publicar o conjunto de fatos listado, respeitadas as
  exclusões de privacidade/segurança.
- Você opera sob regime estatutário de auditoria
  (controladoria-geral, instituição superior de controle) e deseja
  ancorar cada fechamento trimestral antes que o ciclo de auditoria
  o alcance.
- Você publica sob o Open Contracting Data Standard ou IATI e
  deseja um complemento criptográfico à publicação por portal.

## Quando NÃO usar este kit

- **Não usar como substituto para auditoria estatutária, revisão
  por controladoria-geral, investigação acusatória ou monitoramento
  por sociedade civil.** O kit é *aditivo*, não um substituto.
- **Não usar como certificado de legitimidade.** Um registro de
  despesa selado não é um certificado de ausência de corrupção.
  Tratá-lo como tal é precisamente o modo de falha que a estrutura
  de restrições-em-primeiro-lugar do kit existe para evitar.
- **Não usar no meio do período.** O kit é para o momento da
  emissão formal (fechamento trimestral, adjudicação contratual,
  desembolso por marco). Selos no meio do período criam pontos de
  referência enganosos.
- **Não usar para alegar que a despesa foi lícita, justa ou livre
  de corrupção** — o kit não pode fazer isso.
- **Não usar para selar despesas classificadas em sigilo, PII
  individual de servidores ou PII comercial de fornecedores.** O
  kit recusa esses padrões; tentar fazê-lo cria um registro de
  recusa (FATO 07).
- **Não usar para selar rascunhos pré-emissão.** Rascunhos podem
  ser selados sob um tipo distinto de atestação ("rascunho para
  comentários, não emitido"), mas não sob o tipo de emissão deste
  kit.
- **Não usar sob pressão para omitir as divulgações do FATO 07.**
  Recuse, e sele a recusa.
- **Não usar se sua autoridade financeira estiver capturada.** Uma
  despesa fraudulenta selada é um registro público permanente da
  fraude, não uma defesa dela. A primitiva corta em ambas as
  direções; essa é sua honestidade.

---

## Como fazer fork deste kit para uma atestação real

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Timing crítico:** sele NO momento da emissão formal — isto é, o
momento em que o principal financeiro responsável assina o
fechamento trimestral, o momento em que um contrato é formalmente
adjudicado, ou o momento em que um desembolso é formalmente emitido.
Um selo anterior à emissão formal cria uma referência
falso-positiva de "este é o registro oficial". Um selo muito
posterior à emissão formal é forensicamente mais frágil contra
modificações intermediárias.

**Cadência:** o kit é projetado por padrão para atestações
trimestrais. Cadências sub-trimestrais (fechamento mensal, selagem
por transação) são suportadas reexecutando com o escopo apropriado;
selar uma única transação de alto valor é um uso legítimo.

---

## Integração com a infraestrutura existente de finanças públicas

O kit foi projetado para compor com, e não substituir:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Os cinco pontos
  de publicação (planejamento, edital, adjudicação, contrato,
  execução) se mapeiam naturalmente no FATO 03 (planejamento →
  dotação), FATO 04 (edital, adjudicação, contrato, execução →
  manifesto de transações) e FATO 05 (hashes de documentos
  comprobatórios). A própria exportação JSON OCDS é selada no
  FATO 05 (documentos de controle). Uma jurisdição rodando
  publicação OCDS pode adicionar selagem MYRIAM como camada
  criptográfica sobre seu portal existente.

- **International Aid Transparency Initiative (IATI) padrão
  v2.03.** Para despesas financiadas no todo ou em parte por ajuda
  externa, o XML IATI pode ser selado como documento de controle;
  o selo fornece um complemento criptográfico ao modelo de
  publicação HTTP do IATI Registry.

- **Compromissos da Open Government Partnership (OGP).** Os Planos
  de Ação Nacionais da OGP frequentemente incluem compromissos de
  transparência fiscal; a selagem MYRIAM operacionaliza um
  compromisso de "publicação com evidência de adulteração" de uma
  forma que é independentemente verificável pela sociedade civil
  sem exigir confiança no portal do governo.

- **Recomendação da OECD sobre Integridade Pública (2017).** O kit
  apoia a Recomendação 4 (dados governamentais abertos sobre
  finanças públicas em forma legível por máquina e tempestiva) ao
  tornar os dados criptograficamente ancorados além de legíveis por
  máquina.

- **Convenção das Nações Unidas contra a Corrupção (UNCAC),
  particularmente os Artigos 9 (compras públicas) e 13
  (participação da sociedade).** O kit fornece uma primitiva
  forense que apoia as obrigações de transparência do Artigo 9 e a
  fiscalização da sociedade civil do Artigo 13.

- **Instituições Superiores de Controle (ISCs) — referencial
  INTOSAI.** ISCs operando sob normas INTOSAI (ISSAI) podem
  consumir publicações seladas como prova de alta integridade; os
  hashes SHA-256 no FATO 05 são os mesmos hashes que as ferramentas
  de e-audit da ISC podem recalcular.

- **Escritórios de controladoria-geral / inspetoria-geral.**
  Escritórios domésticos de controladoria com jurisdição sobre as
  despesas seladas (FATO 06) podem intimar os corpos dos documentos
  cujos hashes estão selados no FATO 05; o selo vincula os corpos
  dos documentos recebidos por intimação aos corpos que existiam
  na emissão.

- **Leis de acesso à informação e registros abertos.** O selo não
  isenta a autoridade emissora de obrigações contínuas de acesso à
  informação; na verdade, torna respostas seletivas detectáveis
  como desvio do registro selado. O FATO 07 C3 ancora pedidos de
  acesso à informação em aberto no momento da atestação.

- **Registros de titularidade real (Recomendação 24 do FATF,
  diretivas AML da UE, Corporate Transparency Act dos EUA).** Dados
  de titularidade real NÃO são selados sob este kit (o FATO 04
  obtém a identidade do fornecedor apenas pelo nome da entidade
  legal registrada). A divulgação de titularidade real é um regime
  de selagem separado que pode produzir uma publicação paralela
  referenciada por raiz Merkle.

- **Transparência administrada por tribunais (relato de despesas
  judiciais, procedimentos de recuperação de ativos).** As saídas
  de procedimentos judiciais relacionados à corrupção não estão no
  escopo deste kit, mas podem ser seladas sob tipos paralelos de
  atestação.

## O que este kit NÃO substitui

- Auditoria estatutária da execução orçamentária por corpos de
  controladoria-geral
- Revisão por instituição superior de controle (GAO, NAO, TCU,
  CAG, AGN, BRH, Cour des comptes, equivalente)
- Investigação acusatória de crimes de corrupção (procuradores
  nacionais anticorrupção, corpos do Artigo 36 da UNCAC)
- Reportagem investigativa pela sociedade civil e pelo jornalismo
- Canais de denunciantes e regimes de divulgação protegida
- Divulgação de titularidade real
- Revisão por pares no plano internacional (OECD, Avaliação de
  Transparência Fiscal do FMI, semestre europeu, IATI Registry)
- Procedimentos de recuperação de ativos administrados por
  tribunais

O selo é uma primitiva forense que reduz o custo e aumenta a
confiabilidade de tudo o que precede. Ele não é, e não pode ser, um
substituto para nenhum deles.

---

## Licença

Domínio público (CC0). Faça fork. Sem necessidade de atribuição.
