*Traducció catalana — per a la versió original en anglès, vegeu [SPEC.md](SPEC.md)*

# Especificació del protocol MYRIAM-kit

## 0. Propòsit

Aquest document especifica un protocol mínim per publicar un conjunt reduït
de fets textuals en una forma evident davant manipulacions i verificable
criptogràficament que sobreviu a la retirada de qualsevol proveïdor
d'allotjament individual.

És la generalització del protocol desplegat per primera vegada a
[disclosure.host](https://disclosure.host) sota el nom «MYRIAM v1».

## 1. No-objectius

- Emmagatzematge de secrets. Tot és públic per construcció.
- Conjunts de dades grans. Per damunt d'uns ~20 fets, el protocol té la
  forma equivocada.
- Publicació en temps real. Cada publicació és un esdeveniment discret de
  segellat.
- Retractació. El protocol és només d'addició a nivell de versió.

## 2. Model de fets

Un FET és un fitxer de text UTF-8 amb:

- Patró de nom de fitxer: `NN_short_name.txt`, on NN és un índex de dos
  dígits farcit amb zeros a l'esquerra que comença a 01.
- Forma canònica: bytes tal com estan escrits, sense normalització.
- Hash per fet: hexadecimal en minúscules de `SHA-256(file_bytes)`.

El CONJUNT de fets és la llista ordenada de tots els fitxers que
coincideixen amb el patró sota `facts/`, classificats lexicogràficament.

Restricció: el cos de cada fet SHOULD formular-se com un *esdeveniment de
nomenament* o *esdeveniment de declaració* atribuïble a una part
específica. Les afirmacions ontològiques («la lluna és roca») soscaven la
porta de verificabilitat; només l'esdeveniment de publicació és
verificable, no l'afirmació. «X ha declarat Y» és la forma adequada. «Y és
cert» no ho és.

## 3. Arrel de Merkle

Estil Bitcoin, com a la v0 del protocol MYRIAM desplegat:

1. Fulles: hashs SHA-256 per fet en l'ordre del conjunt de fets.
2. Si un nivell té un nombre senar de nodes, dupliqueu l'últim node.
3. Calculeu el hash de parells adjacents:
   `parent = SHA-256(left_bytes || right_bytes)`, on `left_bytes` i
   `right_bytes` són els valors hash crus de 32 bytes (no les seves
   representacions hexadecimals).
4. Repetiu fins que en quedi un sol node. Aquesta és l'arrel de Merkle.

L'arrel es publica com a hexadecimal en minúscules sense salt de línia
final.

### 3.1 Vectors de prova

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Qualsevol implementació conforme MUST reproduir aquests vectors. Es deriven
del `lib/build.py` real i es poden regenerar amb aquest script.

## 4. Compromís a Bitcoin

L'arrel de Merkle es compromet a la cadena de blocs de Bitcoin mitjançant
[OpenTimestamps](https://opentimestamps.org). La política per defecte és:

> Estampar contra almenys dos operadors de calendari sota control
> administratiu independent.

Un rebut que satisfaci aquesta política és verificable per qualsevol part
que pugui executar `ots verify <receipt>.ots` i arribar al camí
d'actualització de qualsevol dels calendaris.

El parell d'operadors per defecte inclòs a `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Les implementacions MAY usar operadors diferents. La política de diversitat
de testimonis (≥2 operadors independents) és normativa; els operadors
específics no ho són.

## 5. Mirall adreçat per contingut

El directori `site/`, que conté la pàgina publicada i els fitxers de fets,
SHOULD afegir-se a IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

El CIDv1 resultant (còdec dag-pb) és l'adreça de contingut de la
publicació. És determinista a partir del contingut en bytes de `site/`.
Qualsevol modificació de qualsevol fitxer sota `site/` produeix un CID
diferent.

Es recomana fermament fixar el contingut a serveis addicionals més enllà
del node local de l'editor per a garantir-ne la durabilitat; aquesta
especificació no exigeix serveis específics.

## 6. Versionatge

El protocol és **només d'addició a nivell de versió**. Cada canvi requereix
una nova versió segellada:

- Una nova revisió de l'especificació (o sense canvis)
- Un nou conjunt de fets, que MAY heretar fets sense canvis de versions
  anteriors
- Una nova arrel de Merkle
- Un nou rebut d'OpenTimestamps
- Un nou CID d'IPFS

Totes les versions anteriors romanen publicades a URLs versionats. Un canvi
a qualsevol fet de v(N) requereix v(N+1), amb ambdues versions visibles i
reverificables.

## 7. Verificació

Qualsevol tercer pot verificar la integritat d'una publicació de la manera
següent:

1. Descarregant els fitxers de fets i recalculant els hashs SHA-256 per
   fet.
2. Recalculant l'arrel de Merkle segons §3 i comparant-la amb l'arrel
   publicada.
3. Verificant el rebut d'OpenTimestamps contra la cadena de blocs de
   Bitcoin per a almenys una atestació completa d'un calendari.
4. Recalculant de manera independent el CID d'IPFS mitjançant
   `ipfs add -r --cid-version=1` i comparant-lo amb el CID publicat.

`lib/verify.py` realitza els passos 1 a 3 sense dependències externes més
enllà de la biblioteca estàndard de Python i el client `ots`. El pas 4
requereix el client `ipfs`.

## 8. Porta de refús

Una publicació MUST NOT incloure un fet que:

- Identifiqui un tercer privat que no hagi consentit a ser nomenat.
- Presenti una hipòtesi com una confirmació.
- No es pugui reduir a un esdeveniment verificable de nomenament/declaració
  ni a un artefacte criptogràfic.
- Tingui un augment esperat raonable de morts evitables en la seva
  publicació.

La quarta regla és la que sosté el pes. S'aplica en el pas de revisió
humana per part de l'editor. No hi ha aplicació a nivell de protocol de la
porta de refús; el protocol publica els bytes que se li lliuren. L'editor
és responsable de la porta.

## 9. Declaració honesta dels límits

- **Detectabilitat, no impossibilitat.** El protocol fa que la manipulació
  sigui detectable, no impossible. Un atacant decidit encara pot substituir
  una publicació diferent i persuadir alguns lectors que és l'original. El
  valor del protocol és que la substitució esdevé criptogràficament
  demostrable per a qualsevol que executi la verificació.
- **Cap defensa contra la publicació de falsedats.** Si l'editor segella un
  fet que afirma «X ha succeït» i X no ha succeït, el protocol segella
  l'afirmació falsa amb la mateixa fidelitat amb què segella les
  veritables. El protocol atesta el que ha estat *publicat*, no el que és
  *cert*.
- **Signatura d'una sola part.** La v1 del MYRIAM desplegat utilitza un sol
  principal signant. La signatura multipart és treball futur.
- **Durabilitat del fixat.** El fixat d'IPFS només al node de l'editor
  proporciona «disponible mentre el meu portàtil estigui engegat + memòria
  cau oportunista de passarel·les». La durabilitat a llarg termini
  requereix fixacions redundants a través de serveis independents.

Aquests límits s'enuncien aquí perquè cap lector no assumeixi que el
protocol ofereix més del que ofereix.
