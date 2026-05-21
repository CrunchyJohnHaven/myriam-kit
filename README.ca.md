*Traducció catalana — per a la versió original en anglès, vegeu [README.md](README.md)*

# myriam-kit

[![Llicència: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Exemples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#exemples-treballats)
[![Verificador: navegador](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: ancorat](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: fixat](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Compatible amb Sigsum](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Una petita caixa d'eines per publicar un conjunt reduït de fets de manera que:

- Qualsevol canvi en qualsevol fet sigui detectable públicament (arbre de Merkle)
- L'estat en el moment de la publicació sigui verificable contra la cadena de blocs de Bitcoin (OpenTimestamps)
- El contingut sobrevisqui a la retirada de qualsevol proveïdor d'allotjament individual (IPFS)
- El conjunt pesi menys de 100 KB i sigui verificable amb unes 50 línies de Python

Això no és una cadena de blocs. No hi ha cap fitxa. No hi ha cap mecanisme de consens
en què participar. No hi ha cap DAO. L'eina és `sha256sum` + `ots` + `ipfs`,
encolats amb bones convencions de nomenclatura.

Pren el nom del protocol MYRIAM instanciat per primera vegada a
[disclosure.host](https://disclosure.host) el 2026-05-21. Aquesta pàgina conté
sis fets, una arrel de Merkle i una atestació de Bitcoin. Aquest kit és la
generalització d'aquell patró.

## Estat

- v0: funciona en macOS amb Python 3.10+, Homebrew i connexió a Internet.
  Linux no s'ha provat però hauria de funcionar. Windows: porteu un WSL.
- Domini públic (CC0). Useu-lo, bifurqueu-lo, incorporeu-lo al vostre repositori,
  no l'atribuïu mai. El propòsit no és el reconeixement.

## Idiomes disponibles

Aquest README i diversos kits d'exemple estan disponibles en 17 idiomes.
Índex complet a [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Les traduccions són CC0 i es poden millorar mitjançant PR de la comunitat.

## Què en podeu fer

El patró encaixa allà on un conjunt reduït de fets ha de ser:

- **Publicable** a una audiència àmplia mitjançant HTTP pla
- **Durador** — els lectors d'aquí a 30 anys haurien de poder-lo verificar encara
- **Evident davant manipulacions** — qualsevol canvi ha de ser detectable, no necessàriament prevenible
- **Sense necessitat de confiança** — cap lector no ha de confiar en l'editor (només en les matemàtiques)

Casos d'ús concrets a [docs/USE_CASES.md](docs/USE_CASES.md). La llista breu:

| Àmbit | Fets segellats |
|---|---|
| Salut pública | Resultats de proves de lots de vacunes, fites d'assaigs clínics |
| Eleccions | Recomptes totals a nivell de col·legi electoral en el moment de la certificació |
| Seguretat en IA | Hash dels pesos del model + fitxa del model + puntuacions d'avaluació en el llançament |
| Periodisme | Manifest de documents font (només hashs) per a filtracions de denunciants |
| Ciència | Hash de les dades brutes + hash de l'script d'anàlisi + resultat afirmat |
| Tribunals | Hashs d'evidència digital en el moment de l'adquisició |
| Contractació pública | Arrels segellades de dades de despesa pública |

El que tenen en comú: un conjunt reduït de fets, un requisit fort de durabilitat,
múltiples parts que no es fien mútuament i un pressupost d'emmagatzematge minúscul.
Aquesta és exactament la forma per a la qual s'ha construït aquesta eina.

## Què NO fa

- **Emmagatzemar secrets.** Tot el que poseu a `facts/` és públic. El protocol
  serveix per publicar, no per amagar.
- **Escalar a conjunts de dades grans.** L'arbre de Merkle escala bé; l'atenció
  d'un lector no. Per damunt d'uns 20 fets la pàgina esdevé il·legible. Si
  voleu segellar un milió de registres, calculeu-ne el hash fora de la pàgina
  i poseu l'arrel de Merkle d'aquell sub-arbre en un únic fet.
- **Defensar-se contra la retractació.** Tot el sentit és que no podeu canviar
  el que heu segellat. Si potencialment voleu retractar una afirmació més tard,
  no la segelleu.
- **Convèncer un escèptic determinat.** Un escèptic determinat no executarà
  `ipfs add -r --cid-version=1 -Q facts/`. Però sí que us acusarà d'haver
  fabricat tot el muntatge. No hi ha cap defensa a nivell de protocol contra
  el segon mode de fallada. No hi ha cap defensa a nivell de protocol contra
  res que resideixi en la motivació humana enlloc de les matemàtiques.

## Com utilitzar-lo

Recorregut de cinc minuts a [docs/QUICKSTART.md](docs/QUICKSTART.md).
Especificació completa del protocol a [docs/SPEC.md](docs/SPEC.md).
Model d'amenaces a [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Comparació amb sistemes adjacents (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, etc.) a [docs/COMPARISON.md](docs/COMPARISON.md).

## Com verificar la publicació d'algú altre

Tres opcions, en ordre d'accessibilitat:

1. **Navegador**: obriu [`lib/verify.html`](lib/verify.html) en qualsevol navegador
   modern. Enganxeu l'URL de la publicació. Cliqueu a verificar. Utilitza
   `crypto.subtle` per als hashs — sense instal·lació, sense backend, sense telemetria.
   El pas d'atestació de Bitcoin encara requereix una eina de CLI (vegeu el pas 7 a
   la pàgina del verificador).
2. **Python**: `python3 lib/verify.py` des de dins del directori de la publicació.
   Només biblioteca estàndard; requereix `ots` per a la verificació de Bitcoin.
3. **Des de zero**: llegiu [`docs/SPEC.md §3`](docs/SPEC.md) i
   torneu-lo a implementar. L'algoritme de Merkle té menys de 30 línies en qualsevol llenguatge.

## Exemples treballats

Sis kits d'exemple de qualitat de producció es lliuren amb la caixa d'eines.
Cadascun està segellat, marcat amb OTS, fixat a IPFS i inclou un README d'adopció
que explica quan bifurcar-lo per a un cas real i contra quins modes de fallada
es defensa.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  per al mode de fallada del Boeing 737 MAX / Theranos / informe d'inspector
  de la FDA on les proves queden enterrades o alterades per intermediaris.
- [`examples/ai-model-card/`](examples/ai-model-card/) — per a laboratoris d'IA
  que alliberen models, amb compromisos previs al desplegament que esdevenen
  detectables mecànicament en lloc de verbals.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  per a patrocinadors d'assaigs clínics, captant el canvi posterior d'objectius
  i la presentació selectiva (modes de fallada de Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  per a fabricants de vacunes i autoritats de QA, ancorant els resultats de
  proves d'alliberament i els compromisos de retirada.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  per a grups de recerca, ancorant la terna (dades, canalització, sortida
  esperada) ABANS de l'anàlisi per fer detectables públicament el p-hacking i
  el HARKing.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  per a juntes electorals de comtat i autoritats electorals, ancorant els
  recomptes certificats en el moment de la certificació perquè les revisions
  silencioses posteriors a la certificació esdevinguin detectables públicament.

Llegiu un d'aquests abans d'escriure el vostre. La coincidència més propera al
vostre cas d'ús sol ser el punt de partida adequat per bifurcar.

## Inici ràpid

La versió d'una línia:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Per què existeix

Les primitives criptogràfiques (arbres de Merkle, OpenTimestamps, IPFS) fa anys
que estan madures. El que faltava era la cola mínima possible — un kit que es
pogués deixar caure en un projecte paral·lel i obtenir-ne un artefacte publicable
i segellat en una tarda, sense configurar infraestructura, sense aprendre
protocols, sense escriure ni una sola línia de codi més enllà dels mateixos fets.

La majoria d'eines criptogràfiques de publicació donen per fet que voleu ser
operador de node. Aquesta dóna per fet que voleu publicar sis fitxers de text
i no tornar a pensar mai més en criptografia.

## Influències i precedents

- [Sigsum](https://www.sigsum.org/) — registres de transparència per a signatures
- [Sigstore](https://www.sigstore.dev/) — integritat de la cadena de subministrament de programari
- [Certificate Transparency](https://certificate.transparency.dev/) — registres de certificats TLS
- [OpenTimestamps](https://opentimestamps.org/) — marcatge temporal a Bitcoin
- [IPFS](https://ipfs.tech/) — emmagatzematge adreçat per contingut
- [El protocol CALM](https://disclosure.host) — el marc de publicació
  protector del principal en què es va redactar la primera instància (MYRIAM
  a disclosure.host)

myriam-kit és el més petit d'aquests. És més proper en esperit a una
canonada Unix que a un sistema.

## Una nota sobre el nom

El protocol MYRIAM va rebre el nom de la Prova de Myriam de John Bradley, una
prova lògica enunciada relativa al primer punt de contacte amb intel·ligència
no humana. El protocol no depèn que aquesta prova sigui certa. El protocol
funciona per a qualsevol conjunt reduït de fets, sigui quin sigui; només
s'esdevé que la primera vegada es va desplegar per publicar sis fets que
inclouen una afirmació sobre divulgació extraterrestre.

Si bifurqueu aquest kit per segellar lots de vacunes o recomptes electorals,
el fet que originalment s'utilitzés per publicar una afirmació sobre contacte
extraterrestre us és irrellevant. A les matemàtiques tant els hi fa.

Dit això: si l'utilitzeu per publicar una afirmació sobre contacte extraterrestre,
el protocol ha estat provat en aquest àmbit específic. El README del primer
desplegament de MYRIAM declara explícitament que és l'obra artística d'un
personatge de LLM anomenat Calm, no una comunicació de cap part extraterrestre.
Probablement hauríeu de fer el mateix. Altrament, els lectors assumiran el pitjor
sobre el vostre estat mental.

## Mantingut per

Encara per ningú. Domini públic. Bifurqueu-lo. Milloreu-lo. Porteu el protocol
endavant sense demanar permís.
