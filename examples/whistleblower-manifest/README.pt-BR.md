*Tradução em português (Brasil) — para a versão original em inglês, veja [README.md](README.md)*

# Kit de Selamento de Manifesto para Denunciantes

Um exemplo turnkey do myriam-kit para denunciantes que enfrentam o modo de
falha específico em que **provas são enterradas, editadas ou contestadas por
intermediários entre o denunciante e o público**. Os casos
históricos canônicos contra os quais isto defende:

- Boeing 737 MAX (relatórios internos de segurança desconsiderados/enterrados)
- Theranos (preocupações sobre testes de laboratório suprimidas por anos)
- Relatórios de inspetores da FDA editados após a submissão
- Frances Haugen / Facebook (um manifesto selado teria provado que
  os documentos eram autênticos e existiam no momento alegado)

Contra o que este kit defende (em termos de protocolo):

- T1–T3 no [FACT 05](facts/05_threat_model.txt): disputa pública sobre o
  conteúdo dos documentos, alegações de que os documentos não estavam selados no
  momento alegado, alegações de fabricação retroativa.
- T9: terceiros entregando aos jornalistas cópias alteradas.

Contra o que este kit **não** defende:

- Retaliação pessoal contra o denunciante (T7).
- Pressão sobre o denunciante para que se retrate (T4, parcialmente mitigado pelo
  FACT 07, que torna a retratação silenciosa publicamente detectável).
- Ações legais contra o denunciante pela própria divulgação (T5).
- Tentativas de desacreditar o caráter do denunciante (T8).
- Intermediários que silenciosamente abandonam a história (T10).

Se você é um denunciante considerando usar este kit, **leia este
README inteiro primeiro**. O protocolo é uma ferramenta. O protocolo não é
substituto para aconselhamento jurídico, um jornalista, um regulador ou uma
disciplina cuidadosa de segurança operacional.

## O que este kit produz

Um *manifesto* criptograficamente selado das provas (não das provas
em si) que comprova:

1. Os bytes específicos de cada arquivo de prova existiam no momento
   do selamento.
2. O selamento ocorreu em ou antes de um momento específico (via atestação
   OTS no Bitcoin).
3. A proveniência, a alegação, o modelo de ameaças, o protocolo do destinatário
   e o compromisso de não-retratação-silenciosa foram todos declarados em conjunto.

Os documentos subjacentes permanecem em sua posse até que você os envie
a um destinatário. Os destinatários verificam que receberam os mesmos bytes que você
selou.

## Quando usar este kit

Você deve considerar selar um manifesto **antes** de transmitir provas
a um jornalista, regulador ou advogado, se todas as seguintes condições forem verdadeiras:

- Você tem provas em forma digital (PDFs, e-mails, imagens, etc.) que
  quer preservar como autênticas byte a byte.
- Você espera que intermediários possam alterar, contestar ou enterrar as
  provas.
- Você pode manter os documentos subjacentes em sua posse até a
  transmissão.
- Você pode publicar o manifesto publicamente **sem** revelar o
  conteúdo dos documentos (apenas os hashes são públicos).
- Você ponderou os riscos de se tornar publicamente identificável como
  denunciante (o campo do principal-signatário). Se for anônimo, use um
  pseudônimo de forma consistente em todas as publicações relacionadas.
- Você consultou um advogado sobre a legislação de proteção a denunciantes
  em sua jurisdição.

## Quando NÃO usar este kit

NÃO use este kit se:

- Os próprios documentos contiverem informações pessoais sobre
  terceiros (pacientes, clientes, empregados) que não devam se tornar
  hashes públicos. Faça o hash de uma versão redigida, não do original.
- O próprio ato de publicar o manifesto identificaria o
  denunciante de uma forma com a qual ele não consentiu.
- Você ainda não consultou um advogado. O protocolo é uma ferramenta;
  a legislação de proteção a denunciantes é específica de cada jurisdição e vive
  fora do protocolo.
- Você pode querer retratar qualquer alegação individual depois. O selo é
  permanente; novas correções seladas são a única forma honesta de revisar.
- Você está fazendo isto sob coação ou pressão de tempo. O protocolo
  amplifica a coerção; a comporta de recusa (myriam-kit `SPEC §8`) aplica-se
  aos denunciantes tanto quanto aos publicadores.

## Como fazer um fork deste kit para uma divulgação real

```bash
# 1. Copie este exemplo para um novo diretório
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Remova o conteúdo fictício; substitua pelos seus fatos reais.
# Cada arquivo sob facts/ é um fato. Leia cada um e substitua.
$EDITOR facts/01_example_notice.txt   # mude para uma declaração de capa real
$EDITOR facts/02_provenance.txt       # proveniência real das suas provas
$EDITOR facts/03_evidence_manifest.txt # faça o hash dos seus documentos reais e liste-os
$EDITOR facts/04_allegation_summary.txt # sua alegação real
$EDITOR facts/05_threat_model.txt     # suas respostas esperadas reais
$EDITOR facts/06_recipient_protocol.txt # ajuste para o seu destinatário
$EDITOR facts/07_no_retraction_commitment.txt # sua declaração de não-retratação
$EDITOR facts/08_signing_principal.txt # sua identidade real de assinatura (ou pseudônimo)

# 3. Atualize site/index.html para refletir os fatos reais.
# O script seal.sh NÃO popula o HTML automaticamente; a edição manual
# é a etapa de revisão humana.
$EDITOR site/index.html

# 4. Sele.
bash build/seal.sh
# Saídas: merkle_root.txt, merkle_root.txt.ots, CID do IPFS

# 5. Verifique localmente.
python3 build/verify.py

# 6. Publique o manifesto (NÃO os documentos) em qualquer um dos seguintes:
#    - Um host estático que você controle (Cloudflare Pages, GitHub Pages, etc.)
#    - A rede IPFS no CID impresso
#    - Ambos (recomendado)

# 7. Separadamente, transmita os documentos subjacentes ao destinatário
#    por um canal seguro de sua escolha (Signal, SecureDrop, etc.).
#    O destinatário verifica os hashes dos arquivos contra o seu manifesto.
```

## Calculando hashes para os arquivos de prova reais

Para gerar o hash SHA-256 de um documento:

```bash
shasum -a 256 my_document.pdf
```

Os primeiros 64 caracteres hexadecimais são o SHA-256. Coloque isso no manifesto.

Você pode gerar o hash de muitos arquivos de uma vez:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Isso lhe dá os dados para `facts/03_evidence_manifest.txt`.

## Notas de segurança operacional

O protocolo MYRIAM NÃO fornece segurança operacional. Ele fornece
*durabilidade probatória*. Você ainda precisa de:

- Um canal de comunicação seguro com seu advogado
  ([Signal](https://signal.org/), pessoalmente, ou o canal seguro
  estabelecido pelo seu advogado)
- Um local seguro de armazenamento para os documentos subjacentes (criptografados em
  repouso, fora de serviços de nuvem aos quais seu empregador tenha acesso)
- Um dispositivo limpo para o selamento (um laptop pessoal não associado
  a contas do empregador; de preferência, um usado apenas para este fim)
- Uma rede limpa para a publicação (não a rede do seu empregador, não
  o IP residencial se seu empregador puder intimar seu provedor de internet)

Leitura recomendada sobre segurança operacional para denunciantes:

- [Documentação do SecureDrop do The Intercept](https://securedrop.org/)
- [Recursos da Freedom of the Press Foundation](https://freedom.press/)
- [Guia de autodefesa contra vigilância da EFF](https://ssd.eff.org/)

Consulte-os ANTES de iniciar o processo de selamento. O protocolo não
protege contra más escolhas de opsec feitas antes de o protocolo ser invocado.

## O que os destinatários devem saber

Envie aos destinatários este README junto com o manifesto selado. O manifesto
em si contém o protocolo do destinatário (FACT 06), mas o README
expande o papel do destinatário:

- **Jornalistas**: verifiquem primeiro a integridade do próprio manifesto. Em seguida,
  solicitem os documentos por um canal seguro separado. Verifiquem
  que o SHA-256 de cada documento corresponde ao manifesto antes da publicação.
  NÃO publiquem os documentos sem o consentimento do denunciante;
  publiquem sim a existência do manifesto selado e a conclusão da
  verificação de vocês.
- **Reguladores**: o mesmo processo de verificação. O manifesto selado mais
  os documentos correspondentes constituem a forma probatória mais forte disponível
  fora da coleta formal por cadeia de custódia.
- **Advogados**: o manifesto selado fornece ancoragem forense para a
  existência dos documentos no momento alegado. Se isso satisfaz as
  regras probatórias de qualquer jurisdição específica é algo a ser
  determinado por vocês.

## O que este kit NÃO é

- Não é substituto para aconselhamento jurídico.
- Não é garantia de que alguém agirá sobre a sua divulgação.
- Não é proteção contra retaliação.
- Não é uma autenticação do conteúdo dos documentos (apenas dos
  seus bytes no momento do selamento).
- Não é uma forma de se comunicar anonimamente com alguém — o selo é
  público; se o nome do principal-signatário for real, você está identificado.

## Encerramento

Um manifesto selado é uma coisa pequena. É um fluxo de bytes provando que um
conjunto maior de fluxos de bytes existiu em uma forma particular em um momento
particular. Essa pequenez é sua força: faz apenas uma coisa, e
faz essa única coisa ao longo da vida da blockchain do Bitcoin.

Se você está lendo isto porque considera se tornar
denunciante, por favor: fale com um advogado primeiro. Use os guias de
segurança operacional acima. Em seguida, se e somente se todas essas
considerações a montante estiverem em ordem, considere este kit como a espinha
dorsal criptográfica da sua divulgação. A criptografia é a parte fácil. Tudo
a montante da criptografia é onde mora o risco real.

## Licença

Domínio público (CC0). Faça fork. Melhore-o. Use sem pedir permissão.
