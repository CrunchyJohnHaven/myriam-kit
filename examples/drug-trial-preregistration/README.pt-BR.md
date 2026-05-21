*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Pré-registro de Ensaio Clínico de Medicamento

Um exemplo turnkey do myriam-kit para patrocinadores de ensaios clínicos e pesquisadores acadêmicos que desejam pré-registrar um ensaio de forma à prova de adulteração e ancorada em Bitcoin, **em complemento ao** registro no ClinicalTrials.gov, no EU CTR ou em outros registros jurisdicionais.

## Por que pré-registrar *adicionalmente* sob o MYRIAM?

Os registros de ensaios existentes (ClinicalTrials.gov, EU CTR, ISRCTN) apresentam fragilidades de integridade documentadas:

- O ClinicalTrials.gov permite que os patrocinadores atualizem desfechos, cálculos de tamanho amostral e planos de análise **após** o registro original, com as datas de modificação visíveis no registro, mas as alterações de *conteúdo* nem sempre ancoradas criptograficamente.
- Vários estudos amplos (Goldacre et al., 2019; Mathieu et al., 2009) documentaram troca sistemática de desfechos pós-hoc em todo o campo.
- A aplicação editorial pelos periódicos (CONSORT, ICMJE) captura alguns casos; muitos escapam.

Um selo MYRIAM fecha essa lacuna. A raiz Merkle + o recibo Bitcoin OTS tornam qualquer alteração pós-hoc no desfecho primário *pré-registrado*, no plano de análise estatística ou na lista de subgrupos criptograficamente detectável. O selo é forensicamente mais difícil de reescrever retroativamente do que o próprio registro.

Este kit é um **complemento ao**, não um substituto dos registros jurisdicionais. Um ensaio real deve ser registrado no registro apropriado E selado sob o MYRIAM.

## Contra o que este kit defende

Casos históricos de mortalidade em que isto teria ajudado:

- **Vioxx (Merck, 2004)**: eventos cardiovasculares eram um desfecho pré-registrado no ensaio APPROVe, mas a análise publicada usou um ponto de corte que minimizava o dano aparente. Um selo do ponto de corte pré-registrado teria tornado a alteração pós-hoc do ponto de corte publicamente detectável antes da publicação.
- **Paxil/Estudo 329 (GSK/SmithKline, 2001)**: dados negativos de um ensaio sobre suicidalidade em adolescentes foram reenquadrados via análise pós-hoc. Um pré-registro selado dos desfechos teria tornado o reenquadramento publicamente detectável.
- **Múltiplos ensaios oncológicos** em que desfechos de sobrevida foram trocados por desfechos substitutos (sobrevida livre de progressão, taxa de resposta) quando o benefício de sobrevida não se materializou.

**Modos de falha que o selo captura diretamente:**

- **Troca de desfechos**: promoção pós-hoc de um desfecho secundário a "primário" quando o primário real falha. O FACT 05 do selo contém o desfecho primário pré-registrado; o desfecho primário publicado deve coincidir.
- **Cherry-picking de resultados**: relatar seletivamente apenas as análises que funcionaram. O FACT 06 contém o plano de análise pré-registrado completo; as análises publicadas devem incluir todas as pré-registradas.
- **Mineração de subgrupos pós-hoc**: alegar "o medicamento funciona no subgrupo X" depois de ver os dados. O FACT 07 contém a lista de subgrupos pré-registrada; qualquer outro subgrupo deve ser rotulado como pós-hoc.
- **Revisão do tamanho amostral**: aumentar o tamanho da amostra após ver tendências intermediárias. O FACT 06 contém o tamanho amostral pré-registrado e o cálculo de poder.
- **Remoção silenciosa de desfechos secundários inconvenientes**: o FACT 05 pré-ordena os desfechos secundários para teste hierárquico; qualquer reordenamento ou remoção é detectável.
- **Supressão de resultados negativos**: o FACT 08 contém o compromisso de publicação; a não publicação dentro da janela comprometida é publicamente visível.

**Modos de falha NÃO cobertos:**

- Conduta indevida na execução do próprio ensaio (dados falsificados, recrutamento fraudulento). O selo ancora o *plano*, não a *execução*.
- Relato seletivo em publicações que incluem todas as análises pré-registradas, mas as interpretam de forma favorável. O selo captura o que está faltando; não pode capturar o viés interpretativo.
- Danos a pacientes durante o próprio ensaio. O selo é regulatório e probatório; não reduz o risco de condução do ensaio.

## Quando usar este kit

Você deve considerar selar um pré-registro se:

- Você é patrocinador ou está conduzindo um ensaio clínico — Fase 1 a 4 — que será usado para informar decisões médicas ou regulatórias.
- Você está disposto a estar publicamente vinculado ao desenho pré-registrado, aos desfechos e ao plano de análise.
- Você é capaz de lidar com a consequência: se o ensaio falhar nos desfechos pré-registrados, você não poderá silenciosamente reescrevê-los para outro desfecho que tenha funcionado.
- Você participa de uma cultura de pesquisa (medicina acadêmica, grupos cooperativos, pesquisa financiada pelo NIH) na qual a integridade do pré-registro é cada vez mais exigida.

Este kit é *particularmente* valioso para:

- Ensaios iniciados pelo pesquisador (investigator-initiated trials) em instituições acadêmicas (onde a pressão do patrocinador para alterar desfechos pós-hoc é real, mas onde o pesquisador acadêmico tem incentivo reputacional para resistir).
- Ensaios de ciência aberta e estudos de ciência cidadã.
- Ensaios de reposicionamento de medicamentos em pequenas empresas de biotecnologia sem longo histórico de condução de ensaios.
- Qualquer ensaio destinado a informar submissões regulatórias em que argumentos futuros do tipo "nunca dissemos isso" possam ser apresentados.

## Quando NÃO usar este kit

NÃO use este kit se:

- O protocolo do ensaio ainda estiver genuinamente em fluxo. Pré-registre quando o protocolo estiver final, não antes.
- Você não puder se comprometer a publicar os resultados independentemente da direção. O selo torna a não publicação publicamente detectável.
- O ensaio envolver sigilo industrial competitivo que o impeça de tornar o plano de análise público. O selo torna o plano de análise um registro público permanente; não há como selar algo de forma privada.
- Você não tiver aprovação jurídica e ética do protocolo. O selo registra o protocolo da forma como VOCÊ o selou; ele não pode ser endossado retroativamente por um Comitê de Ética em Pesquisa (CEP/CONEP) ou IRB.

## Como fazer fork deste kit para um pré-registro real

```bash
# 1. Copy this example
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Replace fictional content with the real trial protocol content.
# Each fact corresponds to a section of a standard pre-registration:
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Update site/index.html to reflect the real trial.

# 4. Seal (BEFORE enrollment begins, BEFORE database lock):
bash build/seal.sh

# 5. Verify locally:
python3 build/verify.py

# 6. Deploy:
#    - Publish the seal URL to your trial sponsor's website AND
#    - Add the IPFS CID to the trial's ClinicalTrials.gov record's
#      "Description" or "References" field, so the registry record
#      cross-references the cryptographic seal.
```

**TEMPO CRÍTICO**: o selo precisa ser criado ANTES do início do recrutamento. Um pré-registro selado depois da inclusão do primeiro paciente é forensicamente muito mais fraco. O ideal é selar no momento da aprovação pelo CEP/IRB.

## Integração com a infraestrutura de pré-registro existente

O kit é projetado para se compor, não para substituir:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: registre o ensaio no registro jurisdicional conforme exigido. Em seguida, no campo "Description" ou "References" do registro, faça um link para a publicação selada MYRIAM.
- **OSF (Open Science Framework)**: o OSF oferece pré-registro com data e hora, mas não com ancoragem Bitcoin. O selo MYRIAM pode ser anexado como arquivo suplementar na página de registro do OSF, fornecendo tanto o carimbo temporal quanto a ancoragem Bitcoin.
- **AsPredicted.org**: similar — vincule o selo MYRIAM como URL suplementar.
- **Periódicos**: alguns periódicos (p. ex., Trials, BMJ Open) aceitam URLs de pré-registro como parte da submissão. Inclua a URL do selo MYRIAM juntamente com a URL do registro.

## O que os destinatários (reguladores, revisores de periódicos, meta-analistas) recebem

Um ensaio pré-registrado sob o MYRIAM oferece aos revisores:

1. **Prova criptográfica de que o protocolo foi finalizado em um momento específico.** Os revisores podem verificar o horário do selo por meio do recibo OTS.
2. **Estabilidade byte a byte do texto do protocolo.** Revisores que comparam a seção de métodos publicada com o desenho pré-registrado podem fazê-lo caractere por caractere.
3. **Detecção de troca de desfechos.** Um simples diff entre o FACT 05 selado e o desfecho primário publicado revela qualquer substituição.
4. **Detecção de desvio do plano de análise.** Um simples diff entre o FACT 06 selado e os métodos estatísticos publicados revela as modificações.
5. **Detecção de relato seletivo de subgrupos.** O FACT 07 selado contém todos os subgrupos pré-registrados; qualquer subgrupo na publicação que não esteja no selo deve ser rotulado como pós-hoc.

Isto torna a revisão sistemática e a meta-análise substancialmente mais fáceis do que a prática atual.

## O que este kit NÃO é

- Não é um substituto para a aprovação por CEP / IRB / comitê de ética.
- Não é um substituto para o registro no registro jurisdicional.
- Não é uma garantia de que o ensaio será conduzido conforme planejado.
- Não é uma forma de ancorar o consentimento do paciente ou outros documentos éticos (estes precisam do próprio mecanismo de selamento).
- Não é proteção contra crítica ao desenho do ensaio após a publicação.

## Uma nota sobre a publicação de resultados negativos

O Compromisso nº 1 do FACT 08 ("publicação independentemente da direção") é o compromisso de maior impacto sobre a mortalidade contido no selo. A supressão histórica de resultados negativos de ensaios (em particular para medicamentos psiquiátricos em adolescentes, oncológicos em populações idosas e cardiovasculares em mulheres) contribuiu, de forma plausível, para milhares de mortes evitáveis ao longo de décadas por meio da prescrição excessiva baseada em estimativas de eficácia enviesadas.

Um compromisso selado de publicar resultados negativos é, por si só, um dos movimentos de saúde pública de maior alavancagem que um patrocinador pode fazer. O selo fornece accountability externa para esse compromisso de uma forma que políticas de publicação autorreguladas não fornecem.

## Encerramento

O pré-registro de ensaios clínicos de medicamentos sob o MYRIAM representa pouco trabalho adicional para o patrocinador: ~30 minutos para preencher os fatos, ~10 segundos para selar. A accountability adicionada é assimétrica: pequeno custo para a condução honesta do ensaio, grande restrição às manobras pós-hoc que contribuíram para vieses históricos na base de evidências.

Se você é patrocinador ou pesquisador principal considerando este kit, o kit é de domínio público (CC0). Use-o. Modifique-o. Aprimore-o.

## Licença

Domínio público (CC0). Não é necessária atribuição.
