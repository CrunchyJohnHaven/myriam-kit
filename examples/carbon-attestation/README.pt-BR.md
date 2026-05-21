*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Selo de Atestação de Carbono

Um exemplo de myriam-kit pronto para uso, destinado a
desenvolvedores de projetos de carbono, verificadores
terceirizados e registros que desejam publicar um selo ancorado
em Bitcoin, com evidência de adulteração, para um evento de
emissão de crédito de carbono, verificação de remoção ou
atestação de emissões no momento exato da certificação — de modo
que modificações silenciosas pós-emissão se tornem publicamente
detectáveis.

---

## O que este kit NÃO faz (leia primeiro)

Os créditos de carbono são politicamente e cientificamente
contestados. O selo é um carimbo de tempo criptográfico do que
foi atestado. Ele não pode verificar se o que foi atestado
reflete benefício climático real. Os seguintes modos de falha
estão **fora do domínio do selo** e respondem pela maioria das
questões significativas de integridade sobre créditos de
carbono:

1. **Adicionalidade (Additionality).** O selo não pode verificar
   que a atividade creditada não teria ocorrido sem o
   financiamento de carbono. O contrafactual é, em princípio,
   inobservável. O selo registra o argumento de adicionalidade
   da metodologia; ele não o adjudica.

2. **Permanência (Permanence).** O selo não pode verificar que o
   carbono sequestrado permanecerá sequestrado ao longo do
   horizonte de tempo relevante (décadas a séculos para carbono
   florestal, escalas de tempo geológicas para algumas remoções).
   A literatura recente (Badgley et al. 2022, Patterson et al.
   2022) mostra que os fundos de reserva (buffer pools) foram
   substancialmente depletados por eventos reais de reversão.
   Um crédito selado é uma *alegação* selada de permanência sob
   premissas especificadas de fundo de reserva, não prova de
   permanência.

3. **Vazamento (Leakage).** O selo não pode verificar que as
   emissões evitadas na área do projeto não foram simplesmente
   deslocadas para uma área não-projeto. As deduções padrão de
   vazamento da metodologia são substitutos regulatórios, não
   medições. O selo ancora a dedução aplicada; ele não a
   certifica como correta.

4. **Co-benefícios (Co-benefits).** O selo não pode verificar
   alegações de desenvolvimento comunitário ou biodiversidade.
   Os co-benefícios são tipicamente autoafirmados e revisados
   por verificador, não auditados na profundidade da
   quantificação de carbono. O selo ancora os hashes de
   documentos; nada mais.

5. **Suficiência do Consentimento Livre, Prévio e Informado
   (FPIC).** O consentimento de povos indígenas e comunidades em
   projetos de carbono tem um histórico documentado de modos de
   falha (consentimento coagido, consentimento de órgãos não
   representativos, „consentimento" pós-hoc por compensação). O
   selo ancora a documentação FPIC e os hashes do registro de
   queixas; ele não pode certificar que o processo de
   consentimento foi genuíno.

6. **Independência do verificador.** Os verificadores são pagos
   pelos desenvolvedores do projeto. Este é um conflito de
   interesse estrutural que nenhum esquema de acreditação
   resolveu. O selo ancora a declaração de independência do
   verificador; ele não certifica que a declaração é verdadeira.

7. **Dupla contagem entre registros ou com inventários
   nacionais.** O selo ancora o snapshot do estado do registro no
   momento da atestação. Se a mesma atividade também estiver
   sendo contabilizada por um país anfitrião em sua NDC, ou
   também estiver sendo reivindicada em outro registro, o selo
   torna o estado do registro comparável (diffable), mas não
   impede a dupla contagem.

8. **Correção da alegação do comprador.** Um comprador que
   aposenta um crédito selado para apoiar uma alegação de „zero
   líquido" ou „neutralidade de carbono" está fazendo uma
   alegação a jusante que o selo não cobre. O selo registra a
   aposentadoria; a validade da alegação de marketing do
   comprador é uma questão separada, a jusante.

9. **Correção da metodologia.** O selo registra a citação da
   metodologia + hash do documento em vigor no momento da
   atestação. Ele não afirma que a metodologia é cientificamente
   válida. A reforma de metodologia acontece; selar sob uma
   metodologia que é posteriormente revisada não torna os
   créditos retroativamente „errados" ou „certos" — ele ancora
   quais regras se aplicavam na emissão.

**A seção de limites honestos acima é a parte de sustentação
deste kit.** Quase toda questão significativa de integridade
sobre um crédito de carbono está em um desses nove baldes. O
selo fecha a estreita lacuna restante: modificação retroativa
silenciosa de bytes no registro. Essa lacuna é real e vale a
pena fechar, mas é pequena em relação ao terreno contestado.

---

## O que este kit DEVE RECUSAR selar

O kit está configurado para rejeitar os seguintes padrões de
fato mesmo que um usuário com autoridade de assinatura válida
os submeta:

- **„Adicionalidade" declarada como fato.** Selar a
  adicionalidade como fato cria um registro enganoso. O kit
  aceita *argumentos* de adicionalidade conformes à metodologia,
  não *alegações* de adicionalidade.
- **„Permanência" sem divulgação explícita de horizonte de tempo
  e fundo de reserva.** Selar a permanência sem esses
  parâmetros obscurece a que o projeto está de fato se
  comprometendo.
- **„Sem vazamento" sem medição específica do projeto.** As
  deduções padrão de vazamento da metodologia não são medição e
  o selo não as tratará como tal.
- **Quantificações geradas antes que a verificação por
  terceiros seja concluída.** Um selo pré-verificação cria um
  registro „verificado" falso-positivo.
- **Registros de emissão para créditos também emitidos em um
  registro diferente sem divulgação explícita entre registros**
  em FATO 06.
- **Registros de aposentadoria que falham em nomear o
  beneficiário da aposentadoria.** A aposentadoria anônima
  enfraquece a função de bem-público da aposentadoria; o kit
  recusa habilitá-la.
- **Alegações de FPIC não sustentadas por hashes de
  documentação atestáveis.**
- **Emissão sob Artigo 6.2 / 6.4 sem hash de carta de
  autorização (LoA) do país anfitrião** selado em FATO 06.
- **Selagem a pedido de qualquer parte que não seja o
  desenvolvedor do projeto + verificador conjuntamente** para
  aquele projeto.
- **Alegações de co-benefícios seladas como „certificadas"**
  quando são apenas „autoafirmadas e revisadas por
  verificador".

A própria recusa pode ser selada como um fato („Esta parte
solicitou a selagem de X; o kit recusou conforme regra de
recusa Y"), criando um registro público de tentativa de
uso indevido.

---

## O que este kit SELA

8 fatos no momento da atestação:

1. **Aviso de exemplo** — declara a publicação como exemplo
   (atestações reais removem ou substituem isso).
2. **Identificação do projeto** — nome do projeto, registro, ID
   do projeto no registro, citação da metodologia + hash, hash do
   limite geográfico, vintage, desenvolvedor do projeto,
   alegação de co-benefícios, status FPIC.
3. **Quantificação de emissões ou remoção** — toneladas brutas
   de CO2e, contrafactual da linha de base, dedução de
   vazamento, contribuição ao fundo de reserva, dedução de
   incerteza, alegação líquida creditável, hashes de cada
   entrada numérica.
4. **Metodologia de medição** — fontes de dados de
   sensoriamento remoto, rede de parcelas de verificação no
   solo, hash do log de calibração de instrumentos, hash do
   modelo classificador + estatísticas de precisão, modelo de
   densidade de carbono, proveniência de código + manifesto de
   reprodutibilidade.
5. **Verificação por terceiros** — organização verificadora,
   acreditação, hash da declaração de independência,
   engajamentos anteriores com o desenvolvedor, hash do arquivo
   de fotos de visita ao local, achados levantados + resolvidos,
   hash do documento de opinião de verificação.
6. **Registro de emissão ou aposentadoria** — solicitação de
   emissão + aprovação, total de créditos emitidos, faixa de
   série, declaração entre registros, hash da LoA do país
   anfitrião quando aplicável, faixas de série de aposentadoria
   + beneficiários (para atestações de aposentadoria), hashes de
   snapshot do estado do registro.
7. **Divulgações acompanhantes e registro de recusa** —
   disputas metodológicas pendentes, risco de não-permanência,
   ressalvas de vazamento, ressalvas de adicionalidade, hashes
   de FPIC + registro de queixas, ressalva de co-benefícios,
   engajamento prévio do verificador; lista explícita de
   padrões que o kit recusou selar.
8. **Principal signatário** — desenvolvedor do projeto +
   verificador + registro, cada um com função + escopo da
   atestação + informações de chave criptográfica.

Cada fato termina com a convenção de portão-de-recusa: *„Este
fato afirma apenas X. Ele não afirma Y"* (onde Y é o modo de
falha mais próximo da seção „NÃO faz" acima).

---

## Contra o que este kit defende

- **Modificação silenciosa pós-emissão da quantificação.**
  Qualquer mudança inteira em FATO 03 produz um SHA-256
  diferente, uma raiz Merkle diferente, falha a verificação
  OTS.
- **Substituição silenciosa de metodologia.** FATO 02 congela a
  citação da metodologia + hash do documento na emissão. A
  troca por um registro de uma versão diferente de metodologia
  pós-emissão é publicamente comparável.
- **Revisão silenciosa da linha de base.** O hash de saída do
  modelo do cenário de linha de base de FATO 03 é selado. Um
  reajuste pós-hoc da linha de base para produzir mais créditos
  é detectável.
- **Substituição silenciosa de opinião do verificador.** O hash
  do documento de opinião de FATO 05 é selado. Uma reescrita
  pós-emissão de „o verificador sempre disse X" é detectável.
- **Desaparecimento silencioso de registro de aposentadoria.**
  O snapshot do estado do registro de FATO 06 é selado.
  Créditos que misteriosamente se tornam „disponíveis" novamente
  após serem marcados como aposentados são detectáveis em
  relação ao selo.
- **Substituição silenciosa de documento FPIC.** Os hashes de
  FPIC + registro de queixas de FATO 07 são selados. Documentos
  de consentimento substituídos são detectáveis.
- **Remoção silenciosa de divulgações inconvenientes.** O
  status de divulgação acompanhante de FATO 07 é selado. A
  exclusão silenciosa de uma ressalva de não-permanência de
  uma página de descrição do projeto é detectável em relação
  aos bytes selados.

O kit NÃO defende contra as questões fundamentais de
integridade (adicionalidade, permanência, vazamento,
suficiência FPIC, independência do verificador, validade da
metodologia). Esses são os problemas mais difíceis e o selo
não pode resolvê-los.

---

## Casos históricos ou quase-históricos em que o kit teria ajudado

O kit teria produzido uma âncora útil — *não uma solução* — em
casos envolvendo modificação retroativa silenciosa de registros
de atestação de carbono. Ele NÃO teria resolvido as questões
contestadas subjacentes em nenhum desses casos.

- **A investigação de 2023 de The Guardian / Die Zeit /
  SourceMaterial sobre créditos de florestas tropicais da
  Verra.** Os investigadores descobriram que a maioria dos
  projetos REDD+ estudados produziu créditos cujas emissões
  evitadas alegadas não correspondiam à reanálise de
  sensoriamento remoto posterior. A investigação exigiu a
  reconstrução da documentação do projeto contra registros de
  registro modificados retroativamente. Uma publicação selada
  em cada ciclo de emissão teria fornecido bytes de referência
  inequívocos do que foi atestado em cada ciclo — não uma
  solução para o problema subjacente da linha de base, mas uma
  cronologia forense limpa.

- **Os eventos de reversão de offset florestal da Califórnia de
  2020.** Múltiplos projetos de carbono florestal sob o mercado
  de cumprimento da Califórnia sofreram reversões por incêndio
  florestal que excederam a reserva do fundo de reserva
  separada para eles. Reconstruir o que cada projeto atestou
  sobre o risco de não-permanência *na emissão* (vs. o que o
  projeto posteriormente alegou ter atestado) é atualmente
  difícil. Selos por vintage teriam tornado as atestações
  pré-incêndio canonicamente recuperáveis.

- **Vários projetos REDD+ em que as metodologias de linha de
  base de região-referência foram criticadas retroativamente
  como infladas.** Um hash de documento de metodologia selado
  no momento da emissão teria ancorado qual versão de
  metodologia realmente se aplicava a qual vintage, tornando a
  defesa de „a metodologia sempre foi X" comparável.

- **Várias disputas de projetos de regeneração induzida por
  humanos de Australian Carbon Credit Unit (ACCU) (2022-2023).**
  A crítica acadêmica sobre se a regeneração foi de fato
  induzida pelo projeto vs. natural reverteu para disputas
  sobre o que o projeto havia originalmente alegado. Atestações
  seladas teriam fornecido registros inequívocos por vintage.

- **Registros de aposentadoria de offsets de carbono que
  mudaram de estado.** Vários casos documentados de registros
  de aposentadoria em registros de mercado voluntário que
  parecem mudar de status pós-aposentadoria (tornando-se
  „aposentados" por um motivo diferente, ou sendo atribuídos a
  um beneficiário diferente após o fato). Selos por
  aposentadoria teriam ancorado o estado no momento da
  aposentadoria original.

Em nenhum desses casos o kit teria resolvido se o crédito
subjacente representava benefício climático real. O kit ancora
registros; é tudo o que ele faz.

---

## Quando usar este kit

- Você é um desenvolvedor de projeto que deseja publicar uma
  atestação com evidência de adulteração ao lado de seu
  arquivamento padrão no registro.
- Você é um verificador terceirizado que deseja que sua opinião
  de verificação seja publicamente verificável contra a
  representação posterior do registro do „que o verificador
  disse".
- Você é um registro que deseja fornecer uma camada adicional
  de integridade nos registros de emissão e aposentadoria —
  particularmente para projetos em jurisdições com suportes
  mais fracos do estado de direito para integridade do
  registro.
- Você é um jornalista, acadêmico ou ONG que executa uma
  análise longitudinal multi-anual de projetos de carbono e
  precisa de uma âncora pública para comparar as
  representações posteriores de um projeto contra seus bytes
  do momento da emissão.
- Você é um comprador (zero líquido corporativo, cumprimento
  de companhia aérea) que deseja que os créditos que você
  aposenta sejam aposentados contra registros publicamente
  ancorados, para que sua alegação de marketing a jusante
  possa ser auditada contra uma cronologia forense estável.

## Quando NÃO usar este kit

- **Não use como substituto para verificação terceirizada
  acreditada.** O selo não substitui a verificação ISO
  14064-3; ele se compõe com ela.
- **Não use para alegar que um projeto é „adicional",
  „permanente" ou „de baixo vazamento".** O selo não pode
  verificar essas propriedades. Usar o selo para afirmá-las é
  uso indevido.
- **Não use como teatro de legitimidade para créditos de baixa
  qualidade.** Um selo criptográfico em um crédito de baixa
  qualidade é um registro forense permanente da baixa
  qualidade, não uma defesa contra ela. A primitiva corta nos
  dois sentidos; essa é sua honestidade.
- **Não use para selar créditos que também estão sendo
  contabilizados por um país anfitrião em sua NDC** sem
  divulgação explícita de ajuste correspondente em FATO 06.
- **Não sele pré-verificação.** Um selo antes que a opinião do
  verificador seja final cria um registro „verificado"
  falso-positivo.
- **Não use sob pressão para omitir uma divulgação de
  fato-acompanhante em FATO 07** (disputas metodológicas
  pendentes, questões de FPIC, engajamento prévio do
  verificador). Recuse e sele a recusa.
- **Não use como um emblema de marketing.** „Selado-MYRIAM"
  não é uma alegação de qualidade; é uma propriedade forense.
  Tratá-lo como um emblema de qualidade é exatamente o uso
  indevido que o design baseado em restrições tenta evitar.

## Como bifurcar este kit para uma atestação real

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Tempo crítico:** sele NO ou APÓS o evento oficial de emissão
do registro, NÃO antes. Um selo pré-emissão cria um registro
„emitido" falso-positivo. Para atestações de aposentadoria,
sele NO momento da aposentadoria. Para atestações de
monitoramento contínuo entre emissão e aposentadoria, sele em
cada ciclo de monitoramento assinado por verificador — mas
deixe claro em FATO 01 que a atestação é uma atualização de
monitoramento, não uma emissão.

## Integração com a infraestrutura de carbono existente

- **Verra (VCS).** O URL da publicação selada ou o IPFS CID
  pode ser anexado à página do projeto VCS como documentação
  suplementar. O selo não substitui a verificação VCS; ele se
  compõe com ela.
- **Gold Standard.** Mesmo modelo de integração — atestação
  suplementar ao lado da documentação de emissão do Gold
  Standard. A ênfase do Gold Standard em co-benefícios +
  documentação de benefício comunitário mapeia naturalmente
  para FATO 02 + FATO 07.
- **American Carbon Registry (ACR), Climate Action Reserve
  (CAR).** Mesmo modelo de integração.
- **Artigo 6.4 (mecanismo do Órgão de Supervisão do Acordo de
  Paris).** O hash da LoA do país anfitrião em FATO 06 é
  projetado especificamente para a rastreabilidade ITMO do
  Artigo 6.4 / 6.2. A divulgação de ajuste correspondente é um
  campo com portão de recusa.
- **EU ETS MRV.** Para emissores do mercado de cumprimento, o
  hash do relatório MRV mapeia para o hash da planilha de
  quantificação de FATO 03. O selo se compõe com — não
  substitui — o relatório de emissões verificado do operador.
- **Divulgação corporativa CDP (Carbon Disclosure Project).**
  Para corporações citando créditos aposentados em submissões
  CDP, o registro de aposentadoria selado em FATO 06 é o
  registro canônico recuperável. A linguagem da submissão CDP
  pode referenciar a raiz Merkle ou IPFS CID da publicação
  selada.
- **ISO 14064-2 (projeto) / ISO 14064-3 (verificação) / ISO
  14065 (acreditação).** O selo registra a afirmação de
  conformidade + hashes; ele não realiza a avaliação de
  conformidade.
- **TSVCM Core Carbon Principles (CCP) / rótulos ICVCM.**
  Quando um projeto foi avaliado contra os CCPs do ICVCM, o
  hash do resultado da avaliação pode ser selado em FATO 07
  como uma divulgação acompanhante.

## O que este kit NÃO substitui

- Verificação terceirizada acreditada (ISO 14064-3)
- Fluxos de trabalho de emissão e aposentadoria do registro
- Avaliação de conformidade com metodologia
- Processos de autorização do país anfitrião para transações
  do Artigo 6
- Processos MRV do mercado de cumprimento (EU ETS, California
  Cap-and-Trade, RGGI, etc.)
- Iniciativas de integridade do mercado voluntário (ICVCM,
  VCMI)
- Avaliação independente de impacto climático

## Por que este kit existe em v0.4.0+

Este é o 7º exemplo trabalhado enviado com myriam-kit. O kit
existe porque os mercados de crédito de carbono têm um
histórico bem documentado de modificação retroativa silenciosa
— metodologias que são reinterpretadas retroativamente, linhas
de base que são revisadas retroativamente, registros de
aposentadoria que mudam de estado e divulgações de projeto que
silenciosamente abandonam ressalvas inconvenientes ao longo do
tempo.

O selo fecha a lacuna *estreita* de bytes-no-momento-da-
atestação. Ele não aborda — e não pode abordar — as questões
contestadas maiores de adicionalidade, permanência, vazamento
ou autenticidade de co-benefícios. O enquadramento honesto
dessa limitação pelo kit é sua característica mais importante.

## Licença

Domínio público (CC0). Bifurque-o. Nenhuma atribuição
necessária.
