*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Selo de Atestação de Auditoria de Cadeia de Suprimentos

Um exemplo myriam-kit pronto para uso voltado a auditores externos
sociais/trabalhistas/ambientais, equipes internas de conformidade de
fornecedores, investigadores de cadeia de suprimentos em ONGs e
organizações de direitos dos trabalhadores que desejam publicar um
selo de um relatório de auditoria ancorado em Bitcoin, com evidência
de adulteração, no exato momento da assinatura final.

---

## O que este kit NÃO faz (leia primeiro)

O selo é um carimbo criptográfico de data e hora daquilo que o auditor
assinou em definitivo. Ele não pode verificar se aquilo que foi
assinado é **verdadeiro**. Os modos de falha a seguir estão **fora do
domínio do selo**:

1. **Captura da auditoria pela indústria.** Auditorias contratadas por
   marcas têm uma história longa e documentada de produzir achados
   brandos sobre fornecedores cujo negócio contínuo com a marca
   contratante mantém o fluxo da pipeline de auditoria. Uma auditoria
   capturada, quando selada, produz um registro forense permanente da
   auditoria capturada. O selo não corrige a captura — ele apenas
   torna a auditoria-tal-como-emitida imutável, de modo que um
   processo posterior de apuração da verdade tenha algo concreto com
   o que comparar.

2. **Trabalhadores treinados / instalações preparadas.** Auditorias
   anunciadas ou semi-anunciadas dão à gerência dias ou semanas para
   ensaiar respostas de trabalhadores, ocultar trabalhadores menores
   de idade, limpar dormitórios, remover equipamentos não conformes e
   desviar trabalho para subcontratados não auditados durante a
   janela de auditoria. O selo ancora aquilo que foi mostrado aos
   auditores, não aquilo que lhes foi impedido de ver.

3. **Subcontratação oculta.** Subcontratação de Tier-2 e Tier-3,
   trabalho em domicílio e produção do setor informal são
   pervasivamente invisíveis a auditorias de chão de fábrica. O selo
   ancora uma auditoria Tier-1; ele não pode detectar que Tier-1
   terceirize a um Tier-2 não auditado durante a janela de auditoria
   ou rotineiramente.

4. **Auditorias que sistematicamente deixam de identificar o abuso
   que visam.** Rana Plaza, o colapso de uma fábrica têxtil em
   Bangladesh em 2013 que matou 1.134 trabalhadores, havia sido
   auditada por múltiplos programas de auditoria contratados por
   marcas nos meses anteriores. As rachaduras no edifício não estavam
   na lista de verificação das auditorias sociais; o regime de
   auditoria não tinha escopo de engenharia estrutural. Auditorias
   ancoram aquilo que está *dentro do escopo*; abusos fora do escopo
   permanecem invisíveis independentemente de quão à prova de
   adulteração seja o selo.

5. **Retaliação pós-assinatura final contra trabalhadores que
   participaram de entrevistas.** Mesmo com informações de
   localização recusadas (FATO 07 R3), um adversário determinado que
   conheça o identificador do fornecedor pode identificar a
   instalação. A proteção dos trabalhadores requer mais do que
   apenas recusar PII no selo — requer anonimização a montante da
   metodologia de auditoria. O selo torna a
   auditoria-tal-como-emitida duradoura; ele não protege
   retroativamente os entrevistados.

6. **Condições de trabalho que são legais mas desumanas.** Lacunas
   de salário-digno em jurisdições em que o salário mínimo legal
   está abaixo do referencial de salário-digno produzem, na mesma
   auditoria, achados "conformes" perante leis de salários e
   jornadas e achados "não conformes" perante padrões de
   salário-digno (FATO 03 elemento 8 neste kit de exemplo). O selo
   ancora aquilo que cada padrão reporta; reconciliá-los é trabalho
   de política a jusante.

7. **Danos climáticos / ambientais com causalidade difusa.**
   Emissões de carbono, contribuições ao desmatamento, exaustão de
   recursos hídricos e lançamentos de poluentes por fornecedores
   podem ser selados em achados de auditoria, mas a atribuição
   causal ao volume de pedidos de uma marca específica é
   metodologicamente contestada. O selo ancora aquilo que foi
   medido no fornecedor; ele não atribui responsabilidade moral ou
   jurídica.

8. **Disputas sobre qual padrão é autoritativo.** SA8000 vs. BSCI
   vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. código de
   conduta específico da empresa: cada um tem escopos, severidades
   e processos de remediação distintos. O selo ancora *uma*
   auditoria sob *um* padrão. A comparação entre padrões é um
   problema a jusante.

9. **Competência do auditor vs. credencial do auditor.** "Credenciado"
   não é "competente". Auditores que concluíram programas de
   treinamento acreditados deixaram de identificar abusos graves em
   auditorias que precederam desastres publicamente visíveis. O selo
   ancora as credenciais; ele não certifica a competência com que
   foram exercidas.

**A seção de limites honestos acima é a parte estrutural deste kit.**
Uma marca que quer teatro de legitimidade usará uma auditoria selada
como escudo. O kit precisa dizer claramente: isto é uma *primitiva de
não-repúdio para o momento de assinatura final do relatório de
auditoria*, não uma prova de conformidade do fornecedor ou de
bem-estar do trabalhador.

---

## O que este kit DEVE RECUSAR selar

O kit está configurado para rejeitar os seguintes padrões fáticos,
mesmo que um usuário com autoridade válida da entidade de auditoria
os submeta:

- **Identificação individual de trabalhadores.** Nenhum fato pode
  nomear um trabalhador, vincular uma fala a um trabalhador, expor
  número de crachá, posição na linha, quarto de dormitório, escala
  de turno, combinação demográfica com N<5 ou qualquer campo que
  possa reidentificar uma pessoa que tenha participado das
  entrevistas. Falas de trabalhadores usam tokens aleatorizados; o
  mapeamento jamais é selado.
- **Fontes denunciantes / informantes.** Se um achado se apoiar em
  divulgação por uma pessoa que assumiu risco ao divulgar, essa
  pessoa nunca é nomeada nem identificada na publicação selada.
- **Informações precisas de localização.** Nenhum endereço de rua,
  GPS, imagem de satélite com resolução >1km ou fotografia externa
  do edifício. País e região são a resolução máxima selada.
  Justificativa: identificar a instalação habilita retaliação contra
  participantes das entrevistas.
- **Alegação de certificação de auditoria limpa.** O kit recusa selar
  qualquer formulação no sentido de "esta auditoria comprova que o
  fornecedor é conforme" ou "não existem violações". Alegações de
  limpeza são epistemicamente insustentadas pela metodologia de
  auditoria.
- **Substituição do selo por certificado.** Uma publicação que omita
  metodologia (FATO 04), independência (FATO 06) ou recusas
  (FATO 07) não é uma publicação MYRIAM legítima sob este kit.
- **Auditorias em rascunho / pré-assinatura final.** A selagem
  acontece na assinatura final, não antes. Auditorias provisórias
  criam falsa certeza.
- **Reselagem favorável a posteriori.** Uma auditoria revisada exige
  uma NOVA publicação selada referenciando a original por raiz
  Merkle. A auditoria selada original permanece permanentemente
  visível como a auditoria-tal-como-emitida.
- **Selagem por qualquer parte que não seja a entidade de
  auditoria.** Uma marca, fornecedor, organismo de certificação ou
  terceiro não pode selar "a auditoria" no lugar da entidade de
  auditoria que assinou o relatório.

Uma recusa em si pode ser selada como fato ("Esta parte solicitou a
selagem de X; o kit recusou conforme a regra de recusa Y"),
criando um registro público de tentativa de uso indevido. **Numa
indústria com captura de auditoria difusa, recusa-de-selar pode em
si ser um sinal significativo:** uma entidade de auditoria que se
recusa a selar porque uma marca pressionou pelo abrandamento de
achados tem a opção de registrar publicamente a recusa sob seu
próprio principal.

---

## O que este kit SELA

8 fatos no momento da assinatura final da auditoria:

1. **Aviso de exemplo** — declara a publicação como exemplo
   (atestações reais removem ou substituem este aviso).
2. **Escopo e objeto da auditoria** — padrão de auditoria, entidade
   de auditoria, auditor-líder, tamanho da equipe de auditoria,
   identificador do fornecedor (sem informações precisas de
   localização), janela de auditoria, tipo de anúncio (anunciada /
   semi-anunciada / não anunciada), data do relatório de auditoria,
   versão da assinatura final, marcas destinatárias nomeadas, parte
   contratante.
3. **Manifesto de achados de auditoria** — por elemento:
   conformidade / NC menor / NC maior / NC crítica frente ao padrão,
   cada um com um SHA-256 da descrição completa do achado. Totais
   agregados. Recomendação de certificação na assinatura final.
4. **Metodologia e provas** — alocação de tempo no local, contagens
   de entrevistas (com estratificação: gênero, condição migratória,
   tempo de casa), distribuição por formato de entrevista, relação
   com o intérprete, revisão documental com tamanhos de amostra e
   hashes de conteúdo, artefatos de visita ao local (com rostos de
   trabalhadores desfocados), limitações conhecidas da metodologia.
5. **Ações corretivas comprometidas** — por NC maior e por NC menor,
   CAP com causa-raiz declarada, prazo, mecanismo de verificação,
   compromissos de escalonamento, compromisso de não-abrandamento
   silencioso.
6. **Qualificações e independência do auditor** — acreditação da
   entidade de auditoria, concentração de clientes, credenciais e
   competência linguística do auditor-líder, experiência setorial,
   declarações de independência (auditor-fornecedor, auditor-marca,
   separação do organismo de certificação).
7. **Divulgações complementares e registro de recusas** — conflitos
   de interesse (explícitos), histórico de auditorias anteriores,
   canais de voz do trabalhador comunicados, investigações
   paralelas, dissensos internos da entidade de auditoria, lista de
   regras de recusa, recusas efetivamente invocadas nesta auditoria.
8. **Principal signatário** — entidade de auditoria, auditor-líder,
   equipe de auditoria, agente autorizador, informações da chave
   criptográfica.

Cada fato termina com a convenção do portão de recusa: *"Este fato
afirma apenas X. Não afirma Y"* (onde Y é o modo de falha mais
próximo da seção "NÃO faz").

---

## Contra o que este kit defende

- **Abrandamento silencioso pós-assinatura final de não conformidades
  maiores.** Qualquer alteração no FATO 03 (por exemplo, uma MAJOR_NC
  reclassificada como MINOR_NC, ou um achado inteiramente apagado)
  produz um SHA-256 diferente, raiz Merkle diferente, e falha na
  verificação OTS.
- **Retroação de fechamentos de ações corretivas.** O FATO 05
  congela o CAP e seus prazos na assinatura final; qualquer
  alegação de "fechamos essa NC mês passado" que conflite com os
  prazos selados é publicamente comparável.
- **Revisionismo metodológico.** O FATO 04 congela as contagens de
  entrevistas, tamanhos de amostra documental e horas no local na
  assinatura final — impedindo que a posterior defesa do "fizemos
  uma investigação profunda" seja infalsificável.
- **Republicação seletiva que omite achados desfavoráveis.** Todos
  os 8 fatos estão amarrados a uma única raiz Merkle; citar alguns
  fatos enquanto se omite outros é detectável a partir da lista de
  folhas publicada.
- **Deriva de alegação de independência.** O FATO 06 congela as
  declarações de independência na assinatura final. Uma alegação
  posterior de "esta auditoria foi rigorosamente independente"
  deve contender com o percentual selado de concentração de
  clientes e com a divulgação selada de contratação remunerada
  pela marca.
- **Apagamento do registro de recusas.** O FATO 07 congela quais
  padrões fáticos o kit recusou; qualquer alegação posterior de
  "nunca recusamos nada" contradiz o registro selado.

---

## Casos históricos ou quase históricos em que o kit teria ajudado

O kit teria produzido um **ancoramento forense** útil — *não uma
correção nem uma prevenção* — em casos envolvendo:

- **Rana Plaza (Bangladesh, 2013).** O colapso do edifício Rana
  Plaza matou 1.134 trabalhadores têxteis e feriu cerca de 2.500.
  Múltiplas marcas cujos produtos eram fabricados no edifício
  haviam auditado fornecedores Tier-1 dentro do edifício pouco
  antes do colapso. As auditorias usavam listas de verificação de
  auditoria social que não incluíam escopo de engenharia
  estrutural. Um fato de metodologia selado (FATO 04) em cada uma
  dessas auditorias teria tornado a *lacuna de escopo* publicamente
  visível na assinatura final — ancorando a limitação documentada
  que os programas de auditoria retroativamente alegaram não ter
  tido. O selo não teria impedido o colapso. Teria impedido que a
  alegação setorial pós-colapso de "ninguém sabia" se mantivesse
  epistemicamente sustentável.

- **Auditorias Apple / Foxconn (anos 2010).** Múltiplas iterações de
  relatórios de auditoria sobre instalações da Foxconn que
  produziam para a Apple foram publicadas com níveis variados de
  severidade de achados, contexto de cluster de suicídios de
  trabalhadores e alegações de remediação. Um registro selado no
  momento de assinatura final para cada auditoria teria impedido
  que disputas posteriores sobre "o que a auditoria dizia à época"
  dependessem de cópias de arquivo, cópias vazadas ou
  republicações oficiais revisadas.

- **Cobalto da RDC (em curso).** A mineração artesanal de cobalto na
  República Democrática do Congo, inclusive por crianças, alimenta
  cadeias de suprimentos de baterias para grandes marcas de
  eletrônicos e veículos elétricos. Múltiplas auditorias
  contratadas por marcas no período de 2017 até o presente
  produziram achados de severidade variável. O kit aplicado a cada
  auditoria na assinatura final teria ancorado a
  auditoria-tal-como-emitida; o kit aplicado a fatos
  complementares de divulgação (FATO 07 C2: histórico de auditoria
  anterior) teria tornado o herança metodológica de lacunas
  prévias de cada auditor sucessivo publicamente visível.

- **Minerais de conflito (estanho, tântalo, tungstênio, ouro da RDC
  e da região dos Grandes Lagos).** A §1502 da Dodd-Frank produziu
  obrigações de auditar-e-divulgar sob a regra SEC 13p-1. Disputas
  sobre a adequação de auditorias no nível de fundidores e
  verificação a jusante da cadeia de custódia recorreram no
  período 2014–2022. Selos MYRIAM por auditoria teriam ancorado
  cada auditoria de fundidor na assinatura final.

- **Auditorias contratadas por marcas em cadeias de suprimentos de
  algodão de Xinjiang (2018 até o presente).** Disputas sobre se
  auditorias poderiam ser conduzidas confiavelmente sob restrições
  do governo da RPC ao acesso de auditores emergiram amplamente
  depois de 2020. Um fato de metodologia selado (FATO 04) em cada
  auditoria teria ancorado quais condições de acesso de fato se
  aplicavam — tornando alegações posteriores de "conduzimos uma
  auditoria rigorosa" comparáveis com as restrições metodológicas
  seladas à época.

- **Subcontratação da Foxconn e relatórios de responsabilidade de
  fornecedores da Apple nos anos 2010 — descobertas recorrentes de
  trabalhadores menores de idade, dormitórios ocultos, violações
  de jornada.** Selos por auditoria teriam ancorado os *achados
  negativos* em auditorias que nada encontraram, ao lado dos
  *achados positivos* em auditorias que encontraram violações —
  impedindo a seleção narrativa retrospectiva em ambas as
  direções.

O kit NÃO teria impedido nenhum desses casos. Em vários casos, o
problema subjacente era que a auditoria *deixou de identificar* o
abuso — selar uma auditoria limpa que deveria ter encontrado
violações produz um registro permanente de uma auditoria fracassada,
o que é um tipo distinto de utilidade (ancora o fracasso para
prestação de contas futura), mas não é o mesmo que prevenção.

---

## Quando usar este kit

- Você é uma entidade de auditoria adotando uma prática de
  "publicar o que assinamos" como defesa contra pressão de
  abrandamento pós-assinatura final.
- Você é uma ONG conduzindo uma investigação paralela de cadeia
  de suprimentos e quer um ponto de referência com evidência de
  adulteração no momento em que sua investigação se encerra.
- Você é uma organização de direitos dos trabalhadores que obteve
  um relatório de auditoria e quer ancorar seu conteúdo atual
  antes que a entidade de auditoria ou marca tenha chance de
  revisá-lo.
- Você é uma marca comprometida com transparência sobre as
  auditorias que contratou e quer um registro forense
  verificável.
- Você é um jornalista, regulador ou tribunal ancorando o
  conteúdo de uma auditoria específica em um momento específico
  para litígio ou reportagem futura.

## Quando NÃO usar este kit

- **Não usar como substituto para monitoramento conduzido por
  trabalhadores, investigações independentes de ONGs ou
  organização sindical.** O kit é *aditivo*, não um substituto
  para nenhum desses elementos.
- **Não usar para alegar que um fornecedor é conforme.** Uma
  auditoria selada limpa é, na melhor das hipóteses, um insumo
  para uma avaliação de conformidade. Tratar uma auditoria selada
  como um certificado de conformidade é exatamente o teatro de
  legitimidade que as regras de recusa-em-primeiro-lugar existem
  para evitar.
- **Não usar no meio da auditoria.** Selar antes da assinatura
  final cria um registro falso-positivo "este é o relatório final
  de auditoria".
- **Não usar para selar um rascunho que você pretenda revisar.**
  Cada versão de assinatura final recebe seu próprio selo;
  revisões referenciam originais por raiz Merkle.
- **Não usar sob pressão para selar antes da assinatura final ou
  para omitir uma divulgação de fato complementar.** Recuse, e
  (se seu principal permitir) sele a recusa.
- **Não usar como base para uma alegação de marketing de "fair
  trade" ou "abastecimento ético" sem divulgar as limitações
  metodológicas seladas junto com o selo.** Citar o selo sem
  citar as limitações é o modo de falha de teatro de legitimidade
  que define a captura de auditoria.
- **Não usar se sua entidade de auditoria estiver
  estruturalmente capturada e não puder publicar achados contra o
  interesse comercial da marca contratante.** Nesse caso, a
  selagem produz um registro público permanente da auditoria
  capturada. Isso pode ainda assim ser valioso — mas não é o
  mesmo que defender-se da captura.

---

## Como fazer fork deste kit para uma auditoria real

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Timing crítico:** sele NO momento da assinatura final — isto é,
quando o auditor-líder assina o relatório final e este se torna a
posição oficial da entidade de auditoria. Um selo antes da
assinatura final cria um registro falso-positivo "esta é a
auditoria final". Um selo muito depois da assinatura final é
forensicamente mais frágil contra modificações intermediárias.

---

## Integração com a infraestrutura existente de auditoria de cadeia de suprimentos

O kit foi projetado para compor com, e não substituir:

- **SA8000 (Social Accountability International).** Relatórios de
  auditoria SA8000 e documentos de CAP se mapeiam naturalmente no
  FATO 03 + FATO 05. A referência de acreditação SAAS se encaixa
  no FATO 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Os achados de auditoria do RBA se mapeiam no FATO 03;
  as regras de independência da firma de auditoria do RBA se
  mapeiam no FATO 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Os achados de
  auditoria de 2 pilares e 4 pilares do SMETA se mapeiam no
  FATO 03; a plataforma Sedex hospeda o relatório bruto — o selo
  MYRIAM ancora um hash de conteúdo do relatório hospedado na
  plataforma.
- **amfori BSCI.** A mecânica de classificação A–E do BSCI se
  mapeia na recomendação de certificação do FATO 03; a contratação
  por marcas-membros se mapeia na divulgação de concentração de
  clientes do FATO 06 e no FATO 07 C1.
- **FSC chain-of-custody.** Para cadeias de suprimentos de
  produtos florestais, os certificados de cadeia de custódia e os
  cronogramas de reauditoria se encaixam na estrutura de janela de
  auditoria e CAP.
- **B Lab / B Corp impact assessment.** A certificação B Corp não
  é uma auditoria de terceira parte no sentido do SA8000, mas os
  relatórios do verificador da avaliação de impacto podem ser
  selados sob este kit (com fatos re-escopados para avaliação de
  impacto em vez de auditoria trabalhista).
- **ISO 26000.** A ISO 26000 é orientação, não certificável; o kit
  não tem integração direta com relatórios de auditoria ISO 26000,
  mas a taxonomia de responsabilidade social pode informar a
  estrutura de elementos do FATO 03 para auditorias internas.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  outros regimes setoriais).** Programas de auditoria
  setor-específicos podem ser selados sob este kit; o campo de
  padrão de auditoria do FATO 02 identifica qual.
- **Fair Labor Association.** Relatórios de monitoramento de
  fábricas da FLA se mapeiam no FATO 03 + FATO 05; o referencial
  de monitor independente da FLA se mapeia nas declarações de
  independência do FATO 06.
- **Higg Index (Sustainable Apparel Coalition).** As saídas no
  nível de instalação do Higg FEM (Facility Environmental
  Module) e do Higg FSLM (Facility Social & Labor Module) podem
  ser seladas sob este kit.
- **CSRD / CSDDD da UE.** A Diretiva Europeia de Relato de
  Sustentabilidade Corporativa (CSRD) e a Diretiva Europeia de
  Devida Diligência em Sustentabilidade Corporativa (CSDDD) criam
  obrigações de divulgação cujos documentos de verificação podem
  ser selados sob este kit. O kit ancora a
  divulgação-tal-como-emitida, não sua adequação substantiva.

## O que este kit NÃO substitui

- Monitoramento conduzido por trabalhadores (o sinal mais
  confiável de detecção de abuso em qualquer cadeia de
  suprimentos)
- Investigações independentes de ONGs (CCC, Labour Behind the
  Label, China Labour Bulletin, Workers' Rights Consortium etc.)
- Inspeção regulatória (órgãos nacionais de trabalho,
  equivalentes da OSHA, programas de escritórios de país da OIT)
- Organização sindical e negociação coletiva
- Litígio, arbitragem e remediação sob direito trabalhista
  doméstico
- Referenciais de devida diligência no lado da marca (UNGP,
  Orientações de Devida Diligência da OECD, CSDDD da UE, LkSG
  alemã)

## Licença

Domínio público (CC0). Faça fork. Sem necessidade de atribuição.
