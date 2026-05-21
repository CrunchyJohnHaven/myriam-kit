*Tradução em português brasileiro — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Atestação de Lote de Vacinas

Um exemplo myriam-kit pronto para uso, voltado a fabricantes de
vacinas, autoridades de garantia da qualidade e órgãos de saúde
pública que desejam publicar um selo de liberação de lote ancorado em
Bitcoin e à prova de adulteração (tamper-evident).

## Contra o que este kit protege

**Modos de falha que o selo detecta:**

- **Modificação retroativa silenciosa dos resultados de testes de
  liberação.** Todos os 8 PDFs de teste de liberação do exemplo são
  hasheados. Refazer o hash após a liberação revela qualquer
  modificação.
- **Disputas sobre quais especificações se aplicavam na liberação.** O
  FACT 02 selado contém a identificação canônica do lote e o hash do
  registro de fabricação. Disputas futuras do tipo "a especificação
  sempre foi X" passam a ter uma âncora pública.
- **Minimização silenciosa do escopo de recall.** Os compromissos de
  farmacovigilância no FACT 05 ficam selados; o descumprimento é
  publicamente observável.
- **Reespecificação retroativa de um lote fora de especificação.** Se
  um resultado de teste de liberação foi, na verdade, um APROVADO
  limítrofe que é reclassificado como REPROVADO após a liberação, os
  hashes dos relatórios selados provam o que o PDF de resultado
  original dizia.

**Modos de falha NÃO cobertos:**

- Fraude no próprio processo de fabricação (o selo ancora resultados de
  testes, não a integridade da fabricação).
- Eventos adversos que são consequências biológicas de um lote que, de
  outra forma, passou nos testes (o selo não certifica segurança
  clínica, apenas a integridade documental).
- Disputas sobre qual versão de uma especificação regulatória é
  autoritativa.

## Quando usar este kit

Considere selar uma liberação de lote se:

- Você é fabricante de vacinas e quer demonstrar integridade forense
  dos registros de liberação além do que os reguladores exigem
- Você é uma equipe de QA adotando a prática de "publicar o que
  atestamos"
- Você é fabricante de pequeno/nacional porte em uma jurisdição com
  infraestrutura regulatória mais frágil e quer ancorar registros de
  lote contra um verificador global
- Você é um órgão de saúde pública ou ONG que opera um programa de
  produção de vacinas não comercial (por exemplo, para doenças
  negligenciadas)

## Precedente histórico de mortalidade

- **Contaminação da heparina (2008, China):** condroitina sulfato
  hiper-sulfatada falsificada em lotes de heparina. Um manifesto de
  testes de liberação selado teria tornado a modificação silenciosa
  pós-liberação do registro de testes criptograficamente detectável.
- **Cianeto no Tylenol (1982):** disputas retroativas sobre o ponto de
  origem da adulteração. Um hash do registro de fabricação selado
  ancora o estado pré-distribuição.
- **Diversos recalls de lotes de vacinas** em que a pergunta "este lote
  foi de fato testado adequadamente" se torna contestada anos depois.

O kit NÃO é uma solução para NENHUM desses casos em sentido estrito —
mas em cada um deles, atestações de lote seladas teriam fornecido uma
linha do tempo forense mais limpa.

## Como fazer um fork deste kit para um lote real

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # substitua conteúdo fictício pelo lote real
bash build/seal.sh        # SELE ANTES de iniciar a distribuição
python3 build/verify.py   # confirme
```

**TIMING CRÍTICO**: sele no momento da liberação pelo QA, ANTES de o
lote ser distribuído. Um selo após a distribuição é forensicamente
mais fraco.

## Integração com a infraestrutura farmacêutica existente

- **Submissões eCTD (FDA / EMA):** a URL de publicação selada ou o CID
  do IPFS pode ser referenciada na seção do Módulo 3 (qualidade)
- **Pré-qualificação da WHO:** o manifesto selado demonstra a cadeia de
  testes pré-liberação para jurisdições fora da FDA/EMA
- **Retorno de farmacovigilância:** o FACT 05 compromete o fabricante a
  reportar de forma selada as contagens agregadas de EA aos 6 e 12
  meses
- **Sistemas de recall (RxConnect, MedWatch):** se houver necessidade
  de recall, o próprio escopo do recall fica selado sob MYRIAM,
  fornecendo verificação pública de que todos os lotes distribuídos
  estão sendo tratados

## O que este kit NÃO substitui

- Submissões regulatórias da FDA / EMA / WHO
- Trilhas de auditoria GMP (o selo ancora RESULTADOS, não registros
  brutos do processo)
- Bancos de dados de farmacovigilância (VAERS / EudraVigilance)
- Sistemas de coordenação de recall

## Licença

Domínio público (CC0). Faça fork. Sem necessidade de atribuição.
