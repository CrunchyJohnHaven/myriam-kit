*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Selo de Apuração Eleitoral Pré-Diplomação

Um exemplo myriam-kit pronto para uso, voltado a juntas eleitorais de
apuração, autoridades eleitorais e observadores de integridade eleitoral
que desejam publicar um selo de apuração ancorado em Bitcoin, com
evidência de adulteração, no exato momento da diplomação.

**Encerra** [a issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## O que este kit NÃO faz (leia primeiro)

O selo é um carimbo criptográfico de data e hora daquilo que foi
diplomado. Ele não pode verificar se aquilo que foi diplomado estava
correto. Os modos de falha a seguir estão **fora do domínio do selo**:

1. **Comprometimento de urna eletrônica.** Se o firmware foi adulterado
   ou se os totais de votos foram apurados incorretamente, o selo ancora
   um número errado com alta integridade. O selo observa as saídas do
   sistema de tabulação; ele não tem visibilidade alguma sobre o sistema
   em si.

2. **Supressão de votos / privação estrutural de direitos eleitorais.**
   Fechamento de seções, disparidades em leis de identificação, viés nas
   taxas de rejeição de votos por correspondência e expurgos de cadastro
   eleitoral ocorrem a montante da diplomação. O selo registra cédulas
   apuradas, não cédulas que deveriam ter sido apuradas.

3. **Desinformação eleitoral.** O selo não julga alegações sobre a
   eleição feitas por candidatos, mídia ou plataformas. Uma diplomação
   selada pode ser citada numa narrativa de desinformação com a mesma
   facilidade com que é citada em defesa contra ela. Carimbos
   criptográficos de data e hora são neutros quanto ao conteúdo.

4. **Fraude pré-diplomação durante coleta ou apuração de cédulas.**
   Irregularidades em mutirão de cédulas, adulteração de urnas de
   depósito, rupturas na cadeia de custódia durante a janela de apuração
   — tudo isso ocorre antes do momento do selo. O selo não pode detectá-
   las retroativamente.

5. **Coação da autoridade que diploma.** Uma diplomação sob coação
   produz um selo criptograficamente válido de um resultado coagido. O
   selo verifica que uma autoridade assinou, não por quê.

6. **Diplomações equivocadas que jamais são corrigidas depois.** O
   valor do selo depende de um processo posterior de apuração da verdade
   (auditoria, recontagem, litígio) ao qual o selo possa ser comparado.
   Se tal processo nunca for instaurado, o selo permanece como o único
   registro e pode calcificar o erro.

7. **Anomalias estatísticas e detecção de padrões.** O selo não sinaliza
   margens implausíveis, anomalias geográficas ou desvios da lei de
   Benford. Essas são tarefas analíticas sobre os dados selados, não
   propriedades do selo.

8. **Cargos de menor expressão na cédula com trilhas de auditoria
   ralas.** Cargos menores têm gatilhos de recontagem mais fracos; um
   único selo não pode cobrir de modo significativo todos os cargos da
   cédula sem escopo por cargo.

**A seção de limites honestos acima é a parte que sustenta este kit.**
Autoridades que acreditam que selar equivale a legitimar usarão isto
como escudo. O kit precisa dizer com franqueza: trata-se de uma
*primitiva de não-repúdio do momento da diplomação*, não de uma prova
da correção da eleição.

---

## O que este kit DEVE RECUSAR a selar

O kit está configurado para rejeitar os seguintes padrões fáticos,
mesmo que um usuário com autoridade de assinatura válida os submeta:

- **Identificação individual do eleitor.** Nenhum fato pode nomear um
  eleitor, vincular uma cédula a um eleitor ou expor qualquer campo
  capaz de reidentificar uma pessoa.
- **Decisões de conferência de assinatura por cédula.** Carregadas de
  PII; selá-las cria registros permanentes de decisões que podem ser
  questionadas depois.
- **Qualquer fato cuja publicação identificaria um eleitor vulnerável.**
  Inclui resultados a nível de seção em seções tão pequenas que a
  escolha de voto seja inferível (tipicamente <50 cédulas).
- **Apurações seladas antes que todas as cédulas estejam apuradas.** O
  kit recusa contagens parciais apresentadas como "a apuração".
  Pré-diplomação significa *todas as cédulas apuradas, antes da
  diplomação oficial* — não *durante a apuração*.
- **Diplomações provisórias ou condicionais.** O selo precisa refletir
  um fato, não uma condicional.
- **Contagens que excluam coortes de litígio pendente** sem um fato
  compatriota selado divulgando explicitamente a exclusão.
- **Selagem por qualquer pessoa que não seja a autoridade que diploma**
  daquela jurisdição.

A própria recusa pode ser selada como fato ("Esta autoridade requereu
a selagem de X; o kit recusou conforme a regra de recusa Y"), criando
um registro público de tentativa de uso indevido.

---

## O que este kit SELA de fato

8 fatos no momento da diplomação:

1. **Aviso de exemplo** — declara que a publicação é um exemplo
   (atestações reais removem ou substituem este fato).
2. **Identificação da jurisdição** — município, data da eleição,
   autoridade que diploma, autoridades que diplomam por nome e cargo.
3. **Apuração diplomada** — totais de votos por candidato por cargo +
   votos a maior/a menor + candidaturas escritas à mão.
4. **Contabilidade de cédulas e reconciliação** — total comparecido,
   total tabulado, total rejeitado por categoria, distribuição por
   modo de voto, denominador de eleitores registrados.
5. **Manifesto de equipamento e trilha de auditoria** — modelo do
   tabulador + hash do firmware, hash do arquivo CVR, hash do arquivo
   das imagens das cédulas, hash do log de custódia, hash da política
   de conferência de assinaturas.
6. **Limiares e gatilhos na diplomação** — limiar de conferência de
   assinaturas em vigor, limiares de gatilho de recontagem, margens
   efetivas por cargo, comprometimento da semente da RLA.
7. **Divulgações compatriotas e registro de recusa** — litígios
   pendentes, anomalias pós-apuração em revisão, coortes excluídas,
   membros divergentes da junta; lista explícita dos padrões que o kit
   recusou a selar.
8. **Principal signatário** — identificação da Junta de Apuração +
   nome e partido de cada signatário + informações da chave
   criptográfica.

Cada fato termina com a convenção do portão de recusa: *"Este fato
afirma apenas X. Ele não afirma Y"* (em que Y é o modo de falha mais
próximo da seção "NÃO faz" acima).

---

## Contra o que este kit defende

- **Revisão silenciosa de totais de votos após a diplomação** —
  qualquer alteração inteira no FATO 03 produz um SHA-256 distinto,
  uma raiz Merkle distinta, e falha na verificação OTS.
- **"Cédulas encontradas" absorvidas silenciosamente** — a aritmética
  de reconciliação do FATO 04 fica fixada na diplomação.
- **Alegações de substituição de firmware** — o FATO 05 congela o
  manifesto de equipamento na diplomação.
- **Substituição de artefatos de auditoria pós-diplomação** — o
  manifesto de hashes do FATO 05 detecta qualquer alteração pós-
  diplomação ao CVR, às imagens das cédulas, aos logs de custódia ou à
  política de conferência de assinaturas.
- **Redefinição de limiares e gatilhos** — o FATO 06 congela as regras
  em vigor na diplomação (limiar de conferência de assinaturas,
  gatilhos de recontagem, limite de risco da RLA).

## Casos históricos ou quase históricos em que o kit teria ajudado

O kit teria produzido um ponto de ancoragem útil — *não uma correção*
— em casos envolvendo:

- **Antrim County, Michigan (2020).** Resultados extraoficiais iniciais
  mostraram uma inversão de candidatos depois corrigida para o
  resultado oposto. Um selo pré-correção teria fornecido uma referência
  pública para o que dizia o anúncio original frente ao que dizia a
  correção, ambos criptograficamente atestados.
- **Maricopa County, Arizona (2020–2022).** Múltiplas iterações de
  totais recontados/reexaminados circularam. Um selo no momento da
  diplomação teria fornecido um ponto de referência inequívoco contra
  o qual cada contagem subsequente poderia ter sido comparada.
- **Flórida 2000 (apuração Bush v. Gore).** Totais diplomados por
  município mudaram sob pressão de recontagem; um selo por município
  pré-recontagem teria preservado o que cada município diplomou antes
  do início dos procedimentos de recontagem manual.
- **Diversas eleições estrangeiras com "correções" pós-diplomação
  documentadas.** Independente de jurisdição.

O kit NÃO teria resolvido as disputas subjacentes sobre integridade
das urnas em 2020, disputas de política de voto por correspondência,
nem nenhuma eleição em que a questão central fosse fato contestado em
vez de registro contestado.

Em jurisdições como o Brasil, em que controvérsias eleitorais
costumam ser decididas pelo TSE com revisão pelo STF, o selo
fornecerá um ponto de referência fixo no momento da diplomação
contra o qual cada movimentação subsequente daquelas instâncias
pode ser comparada — sem, contudo, decidir o mérito de qualquer
disputa.

## Quando usar este kit

- Sua jurisdição possui um processo de diplomação estável e auditado e
  quer adicionar um ponto de ancoragem público e imutável.
- Você antecipa escrutínio pós-diplomação e quer um ponto de
  referência com evidência de adulteração.
- Você tem autoridade legal para publicar o conjunto de fatos listado
  sem expor PII.
- Você tem um processo de auditoria paralela ou RLA, de modo que o
  selo possa ser comparado à saída da apuração da verdade.

## Quando NÃO usar este kit

- **Não use como substituto a auditorias de limitação de risco,
  recontagens manuais ou auditorias pós-eleitorais.** Este kit é
  *aditivo*, não substitutivo.
- **Não use se a autoridade que diploma não for o verdadeiro tomador
  de decisão** (cria atribuição falsa).
- **Não use em meio à tabulação.** O kit destina-se especificamente
  ao momento da diplomação. Selos de contagem parcial criam pontos de
  referência enganosos.
- **Não use para alegar que a eleição foi justa, acurada ou legítima**
  — ele não pode fazer isso.
- **Não use sob pressão para selar antes do momento da diplomação, ou
  para omitir uma divulgação compatriota.** Recuse, e sele a recusa.
- **Não use como teatro de legitimidade.** Um selo de uma apuração
  fraudulenta é um registro público permanente da fraude, não uma
  defesa dela. A primitiva corta nos dois sentidos; nisto está sua
  honestidade.

## Como fazer fork deste kit para uma diplomação real

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # replace fictional content with real
bash build/seal.sh     # seal AT or after the official certification signature
python3 build/verify.py
```

**Tempo crítico:** sele NO momento da diplomação, NÃO antes. Um selo
anterior à diplomação oficial cria um registro falso-positivo do tipo
"este é o resultado oficial". Um selo após a diplomação é
não-repúdio convencional.

## Integração com infraestrutura eleitoral existente

- **Tribunais Eleitorais / certificação EAC.** O kit publica ao lado
  do documento oficial de diplomação. Ele não substitui a diplomação
  estatutária.
- **Auditorias de limitação de risco.** O hash do CVR no FATO 05 é o
  mesmo hash que a ferramenta RLA consome. O selo liga o CVR auditado
  ao total diplomado.
- **Procedimentos de recontagem.** Uma recontagem deflagrada nos
  termos da legislação produz um NOVO conjunto de fatos selados
  (carimbo de data e hora distinto, hashes distintos, mesma
  jurisdição). Os dois selos coexistem; nenhum sobrescreve o outro. O
  diff entre os selos é o registro público do que a recontagem
  alterou.
- **Election Markup Language (EML) e Common Data Format (CDF).** Os
  corpos dos fatos devem ser deriváveis das saídas EML/CDF existentes
  da jurisdição para manter o kit agnóstico em relação a formatos de
  dados.
- **Assinatura bipartidária da junta de apuração.** Variante
  multi-assinatura recomendada para jurisdições com juntas
  apuradoras equilibradas entre partidos.

## O que este kit NÃO substitui

- A diplomação estatutária no âmbito da legislação eleitoral
- A certificação EAC de sistemas de votação
- Auditorias de limitação de risco / recontagens manuais
- Procedimentos de recontagem e auditorias pós-eleitorais
- Ordens judiciais ou contencioso de impugnação eleitoral

## Por que este kit existe na v0.3.0+

Este é o 6º exemplo trabalhado entregue com myriam-kit. O kit foi
produzido por um processo de autopesquisa ao estilo Karpathy
documentado em `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Três
variantes de prompt (imitação / primeiros princípios / restrição
primeiro) produziram esboços de kit paralelos; a variante
restrição-primeiro pontuou mais alto numa rubrica ponderada, e o kit
final sintetiza sua estrutura com a coesão da variante por imitação
e o detalhe operacional da variante por primeiros princípios.

A própria autopesquisa está documentada como padrão de prompt em
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` para uso futuro.

## Licença

Domínio público (CC0). Faça fork. Atribuição não requerida.
