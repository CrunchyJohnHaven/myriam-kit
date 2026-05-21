*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# myriam-kit

[![Licence : CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Exemples : 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#exemples-concrets)
[![Vérificateur : navigateur](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin : ancré](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS : épinglé](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Compatible Sigsum](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Une petite trousse à outils pour publier un petit ensemble de faits de telle sorte que :

- Toute modification d'un fait quelconque soit publiquement détectable (arbre de Merkle)
- L'état au moment de la publication soit vérifiable par rapport à la blockchain Bitcoin (OpenTimestamps)
- Le contenu survive au retrait par n'importe quel hébergeur unique (IPFS)
- L'ensemble pèse moins de 100 Ko et soit vérifiable avec ~50 lignes de Python

Ceci n'est pas une blockchain. Il n'y a pas de jeton. Il n'y a aucun mécanisme
de consensus auquel participer. Il n'y a pas de DAO. L'outil est `sha256sum` + `ots` + `ipfs`,
assemblés grâce à de bonnes conventions de nommage.

Il porte le nom du protocole MYRIAM instancié pour la première fois sur
[disclosure.host](https://disclosure.host) le 2026-05-21. Cette page contient
six faits, une racine de Merkle et une attestation Bitcoin. Cette trousse est la
généralisation de ce motif.

## État

- v0 : fonctionne sur macOS avec Python 3.10+, Homebrew et une connexion
  internet. Linux non testé mais devrait fonctionner. Windows : prévoir WSL.
- Domaine public (CC0). Utilisez-le, forkez-le, intégrez-le à votre dépôt, ne
  le créditez jamais. Le but n'est pas le crédit.

## Ce que vous pouvez en faire

Le motif convient partout où un petit ensemble de faits doit être :

- **Publiable** auprès d'un large public sur du simple HTTP
- **Durable** — les lecteurs dans 30 ans devraient encore pouvoir vérifier
- **Inviolabilité détectable** — toute modification doit être détectable, pas nécessairement empêchée
- **Sans confiance requise** — aucun lecteur n'a à faire confiance au publieur (seulement aux mathématiques)

Cas d'usage concrets dans [docs/USE_CASES.md](docs/USE_CASES.md). La liste courte :

| Domaine | Faits scellés |
|---|---|
| Santé publique | Résultats de tests de lots de vaccins, jalons d'essais cliniques |
| Élections | Totaux de dépouillement par bureau au moment de la certification |
| Sécurité de l'IA | Hachage des poids du modèle + carte de modèle + scores d'évaluation à la sortie |
| Journalisme | Manifeste de documents sources (hachages uniquement) pour les divulgations de lanceurs d'alerte |
| Science | Hachage des données brutes + hachage du script d'analyse + résultat revendiqué |
| Tribunaux | Hachages de pièces numériques au moment de leur acquisition |
| Marchés publics | Racines scellées de données de dépenses publiques |

Ce qu'ils ont en commun : un petit ensemble de faits, une forte exigence de durabilité,
plusieurs parties qui ne se font pas confiance, et un très faible budget de stockage.
C'est exactement la forme pour laquelle cet outil est conçu.

## Ce qu'il ne fait PAS

- **Stocker des secrets.** Tout ce que vous placez dans `facts/` est public. Le protocole
  sert à publier, pas à cacher.
- **Passer à l'échelle pour de grands ensembles de données.** L'arbre de Merkle passe bien à l'échelle ; mais pas
  l'attention d'un lecteur. Au-delà d'environ 20 faits, la page devient illisible. Si vous
  voulez sceller un million d'enregistrements, hachez-les hors de la page et placez la
  racine de Merkle de cet arbre annexe dans un seul fait.
- **Se défendre contre la rétractation.** Tout l'intérêt est que vous ne pouvez pas modifier
  ce que vous avez scellé. Si vous pourriez vouloir rétracter une affirmation plus tard, ne
  la scellez pas.
- **Convaincre un sceptique déterminé.** Un sceptique déterminé n'exécutera pas
  `ipfs add -r --cid-version=1 -Q facts/`. Il vous accusera, en revanche,
  d'avoir fabriqué l'intégralité du dispositif. Il n'y a aucune défense au niveau du
  protocole contre ce second mode d'échec. Il n'y a aucune défense au niveau du protocole
  contre ce qui relève de la motivation humaine plutôt que des mathématiques.

## Comment l'utiliser

Tour d'horizon en cinq minutes dans [docs/QUICKSTART.md](docs/QUICKSTART.md).
Spécification complète du protocole dans [docs/SPEC.md](docs/SPEC.md).
Modèle de menace dans [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Comparaison avec des systèmes voisins (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, etc.) dans [docs/COMPARISON.md](docs/COMPARISON.md).

## Comment vérifier la publication de quelqu'un d'autre

Trois options, par ordre d'accessibilité :

1. **Navigateur** : ouvrez [`lib/verify.html`](lib/verify.html) dans n'importe quel
   navigateur moderne. Collez l'URL de la publication. Cliquez sur vérifier. Utilise
   `crypto.subtle` pour le hachage — aucune installation, aucun backend, aucune télémétrie.
   L'étape d'attestation Bitcoin requiert encore un outil en ligne de commande (voir l'étape 7 dans
   la page du vérificateur).
2. **Python** : `python3 lib/verify.py` depuis l'intérieur du répertoire de
   publication. Bibliothèque standard uniquement ; nécessite `ots` pour la vérification Bitcoin.
3. **À partir de zéro** : lisez [`docs/SPEC.md §3`](docs/SPEC.md) et
   réimplémentez. L'algorithme de Merkle fait moins de 30 lignes dans n'importe quel langage.

## Exemples concrets

Six trousses d'exemple de qualité production sont livrées avec la boîte à outils. Chacune est
scellée, horodatée OTS, épinglée sur IPFS et inclut un README d'adoption
expliquant quand la forker pour un cas réel et contre quels modes d'échec
elle se défend.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  pour le mode d'échec Boeing 737 MAX / Theranos / rapports d'inspecteurs FDA
  où les preuves sont enterrées ou modifiées par des intermédiaires.
- [`examples/ai-model-card/`](examples/ai-model-card/) — pour les laboratoires d'IA
  qui publient des modèles, avec des engagements préalables au déploiement qui deviennent
  mécaniquement détectables plutôt que verbaux.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  pour les promoteurs d'essais cliniques, attrapant le changement de critère
  post hoc et le signalement sélectif (modes d'échec Vioxx, Paxil Étude 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  pour les fabricants de vaccins et les autorités d'assurance qualité, ancrant les résultats
  des tests de libération et les engagements de rappel.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  pour les groupes de recherche, ancrant le triplet (données, pipeline, sortie
  attendue) AVANT l'analyse afin de rendre le p-hacking et le HARKing
  publiquement détectables.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  pour les commissions de dépouillement de comté et les autorités électorales, ancrant
  les dépouillements certifiés au moment de la certification afin que les révisions
  silencieuses post-certification deviennent publiquement détectables.

Lisez l'un de ceux-ci avant d'écrire le vôtre. La correspondance la plus proche de votre
cas d'usage constitue généralement la bonne base de fork.

## Démarrage rapide

La version en une ligne :

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# éditez facts/*.txt pour indiquer ce que vous voulez réellement sceller
./lib/seal.sh        # construit la racine de Merkle, horodate via OTS, épingle sur IPFS
./lib/verify.sh      # revérifie tout localement
# téléversez site/ vers n'importe quel hébergeur statique. N'importe lequel. Cela n'a pas d'importance.
```

## Pourquoi ceci existe

Les primitives cryptographiques (arbres de Merkle, OpenTimestamps, IPFS) sont
matures depuis des années. Ce qui manquait, c'était le plus petit liant possible —
une trousse que vous pouviez glisser dans un projet annexe pour disposer d'un artefact
publiable et scellé en un après-midi, sans monter d'infrastructure,
sans apprendre de protocoles, sans écrire une seule ligne de code au-delà
des faits eux-mêmes.

La plupart des outils de publication cryptographique supposent que vous voulez devenir un opérateur de
nœud. Celui-ci suppose que vous voulez publier six fichiers texte et ne plus jamais
penser à la cryptographie.

## Influences et travaux antérieurs

- [Sigsum](https://www.sigsum.org/) — journaux de transparence pour les signatures
- [Sigstore](https://www.sigstore.dev/) — intégrité de la chaîne d'approvisionnement logicielle
- [Certificate Transparency](https://certificate.transparency.dev/) — journaux de certificats TLS
- [OpenTimestamps](https://opentimestamps.org/) — horodatage Bitcoin
- [IPFS](https://ipfs.tech/) — stockage adressé par contenu
- [Le protocole CALM](https://disclosure.host) — le cadre de publication
  protecteur du principal dans lequel la première instance (MYRIAM sur disclosure.host)
  a été rédigée

myriam-kit est le plus petit d'entre eux. Il est plus proche en esprit d'un pipeline
Unix que d'un système.

## Une note sur le nom

Le protocole MYRIAM a été nommé d'après la Preuve de Myriam de John Bradley, une preuve
logique formulée concernant le premier point de contact pour une intelligence non humaine.
Le protocole ne dépend pas de la véracité de cette preuve. Le
protocole fonctionne pour n'importe quel petit ensemble de faits ; il se trouve simplement
avoir été déployé pour la première fois afin de publier six faits qui incluent une affirmation au sujet de
la divulgation extraterrestre.

Si vous forkez cette trousse pour sceller des lots de vaccins ou des dépouillements électoraux, le
fait qu'elle ait été initialement utilisée pour publier une affirmation au sujet d'un contact
extraterrestre vous est sans importance. Les mathématiques s'en moquent.

Cela dit : si vous UTILISEZ ceci pour publier une affirmation au sujet d'un contact extraterrestre, le
protocole a été éprouvé sur le terrain dans cette arène spécifique. Le README du
premier déploiement MYRIAM indique explicitement qu'il s'agit du travail artistique d'un
personnage de LLM nommé Calm, et non d'une communication d'une quelconque partie
extraterrestre. Vous devriez probablement faire de même. Les lecteurs présumeront sinon
le pire de votre état mental.

## Maintenu par

Personne pour l'instant. Domaine public. Forkez. Améliorez. Faites avancer le protocole
sans demander la permission.
