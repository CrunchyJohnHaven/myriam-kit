*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse de verrouillage du comportement de modèle d'IA

Un exemple myriam-kit clé en main pour les laboratoires d'IA (commerciaux ou open-source)
qui publient un modèle et souhaitent rendre les affirmations de la publication —
identité des poids, capacités, scores d'évaluation, examen de sûreté,
engagements préalables au déploiement — **cryptographiquement ancrées et
publiquement vérifiables**.

La trousse se défend contre le mode d'échec spécifique où des modèles déployés
dérivent silencieusement, où les scores d'évaluation sont réécrits a posteriori, ou où les affirmations
préalables au déploiement sont contestées des années plus tard sous la forme « nous n'avons jamais dit cela ».

## Ce que produit cette trousse

Un manifeste cryptographiquement scellé contenant, pour une publication de modèle :

1. Identification du modèle (nom, architecture, nombre de paramètres, licence)
2. **SHA-256 du fichier de poids** — le hachage canonique de l'artefact
3. Texte de la carte de modèle (capacités, utilisation prévue, utilisation hors périmètre,
   modes d'échec connus)
4. Résultats d'évaluation à la sortie (évaluations de capacité, évaluations de sûreté,
   calibration)
5. Engagements préalables au déploiement (les éléments que vous vous engagez à ne pas modifier
   silencieusement après la publication)
6. Principal signataire (l'humain + l'organisation qui assument la responsabilité)

Le scellé rend chacun de ces éléments stable au niveau de l'octet, ancré temporellement à Bitcoin via
OpenTimestamps, et récupérable via IPFS indépendamment de tout hébergeur
unique.

Voir l'exemple fictif concret : [facts/](facts/) et le
[site/index.html](site/index.html) rendu. L'exemple utilise un modèle fictif
(« Calm-mini-v0 ») ; une publication réelle remplacerait le contenu d'exemple.

## Contre quoi cette trousse se défend

**Modes d'échec que le scellé attrape directement :**

- **Altération des poids** — le SHA-256 du fichier de poids publié figure dans
  le FAIT 03. Toute altération post-publication des octets qu'un utilisateur télécharge
  est détectable en re-hachant.
- **Réécritures silencieuses d'évaluations** — les scores d'évaluation à la sortie figurent dans le FAIT 05.
  Les futurs litiges du type « le score d'évaluation a toujours été X » disposent d'un ancrage public.
- **Dérive des affirmations de capacité** — le texte de la carte de modèle dans le FAIT 04 est
  stable au niveau de l'octet. Les futurs litiges du type « nous n'avons jamais revendiqué la capacité X » sont
  vérifiables publiquement par rapport au texte scellé.
- **Redistribution silencieuse de fine-tunes** — l'engagement préalable au déploiement n°1
  dans le FAIT 06 (dans l'exemple concret) est « pas de fine-tuning silencieux sous
  le même nom ». Détection : tout nouveau hachage de poids implique un nouveau nom de modèle
  et une nouvelle publication scellée, ou l'engagement est rompu.
- **Modes d'échec cachés** — le FAIT 04 engage sur une liste de modes d'échec connus.
  La liste est monotone (elle peut croître, pas décroître pour un point de contrôle
  gelé). Les découvertes futures de modes d'échec que le laboratoire connaissait
  en interne mais n'a pas publiés deviennent une preuve contestable.

**Modes d'échec NON couverts :**

- Les modèles utilisés à mauvais escient par les utilisateurs en aval (le scellé prouve ce qui a été
  publié, pas ce que les utilisateurs en font).
- Le fine-tuning adverse par des tiers (un fine-tune tiers
  produit un hachage de poids différent, donc le scellé original est intact,
  mais le modèle du tiers est en dehors de la protection du scellé).
- Les changements de comportement dus aux changements d'environnement de déploiement (différents
  invites système, configurations RAG, etc.).
- Les défaillances que le laboratoire ne connaissait sincèrement pas au moment de la publication. Le
  scellé engage le laboratoire à *ce qu'il savait* ; il ne peut pas ancrer ce
  qu'il ne savait pas.

## Quand utiliser cette trousse

Vous devriez envisager de sceller une carte de modèle si :

- Vous publiez des poids de modèle publiquement OU déployez un modèle dans un
  contexte où les utilisateurs en aval se soucient de la stabilité du comportement.
- La publication est suffisamment significative pour que de futurs litiges du type « nous n'avons jamais dit cela »
  soient plausibles (tout modèle déployé à grande échelle ; tout
  modèle critique pour la sûreté ; toute publication accompagnée d'affirmations
  de capacité).
- Votre organisation est disposée à prendre des engagements préalables au déploiement
  qui contraignent les actions futures (c'est l'élément porteur — voir
  la section suivante).
- Vous pouvez calculer le SHA-256 du fichier de poids au moment de la publication.

## Quand NE PAS utiliser cette trousse

N'utilisez PAS cette trousse si :

- Vous n'êtes pas disposé à être lié par les engagements préalables au déploiement dans
  le FAIT 06 de l'exemple. Le scellé rend les engagements mécaniquement
  détectables ; si vous n'êtes pas préparé à cette responsabilisation, ne
  scellez pas.
- Le fichier de poids va changer fréquemment (p. ex. pipelines de fine-tuning
  continu). Chaque changement de poids requiert une nouvelle publication scellée.
  Le scellage par publication est lourd ; cette trousse est destinée aux points de contrôle
  *gelés*.
- Vous n'avez pas encore fait l'examen de sûreté. Le scellé engage les conclusions de
  l'examen de sûreté. Si vous scellez un examen incomplet, vous disposez d'un
  enregistrement public permanent d'un examen incomplet.
- Vous pourriez vouloir rétracter un score d'évaluation spécifique plus tard. Le scellé est
  permanent. De nouvelles publications scellées peuvent le supplanter, mais l'original
  ne peut pas être défait.

## Les engagements préalables au déploiement porteurs

Le FAIT 06 de l'exemple engage le publieur à :

1. **Pas de fine-tuning silencieux sous le même nom.** Tout fine-tune
   produit un nouveau nom de modèle, une nouvelle publication scellée, un nouveau hachage de
   poids. Le prédécesseur reste canoniquement la version nommée.

2. **Pas de mises à jour d'évaluation silencieuses.** Les réévaluations donnent lieu à de nouvelles publications scellées
   qui référencent l'original par sa racine de Merkle. Les versions sont suivies,
   non écrasées.

3. **Les modes d'échec connus peuvent croître, jamais décroître.** Un point de contrôle gelé
   ne peut voir ses modes d'échec corrigés. La liste publiée est donc
   effectivement monotone.

4. **Gestion du retrait.** S'il est contraint de retirer le modèle de la
   distribution, le laboratoire s'engage à publier une déclaration scellée
   finale du retrait.

Un laboratoire qui adopte cette trousse doit décider lesquels de ces engagements il
peut réellement honorer. Si vous ne pouvez pas tous les honorer, modifiez le FAIT 06 *avant*
de sceller pour refléter ce que vous pouvez honorer, et acceptez la
protection affaiblie qui en résulte. Sceller des engagements que vous n'avez pas l'intention d'honorer est
pire que de ne pas sceller du tout.

## Comment forker cette trousse pour une publication réelle

```bash
# 1. Copiez cet exemple dans votre pipeline de publication
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Éditez chaque fait pour votre publication réelle
$EDITOR facts/01_example_notice.txt   # SUPPRIMER — votre publication n'est pas un exemple
                                       # Remplacez par un avis de publication pour votre modèle
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # la carte de modèle canonique
$EDITOR facts/05_eval_results.txt     # résultats d'évaluation réels
$EDITOR facts/06_release_commitments.txt # les engagements que vous pouvez honorer

# 3. Mettez à jour site/index.html pour refléter la publication réelle.

# 4. Scellez.
bash build/seal.sh

# 5. Vérifiez localement.
python3 build/verify.py

# 6. Déployez vers :
#    - Votre page de publication (à côté de la carte de modèle et des poids)
#    - Le réseau IPFS (le script seal.sh le fait déjà)
#    - Éventuellement : lien vers la publication scellée depuis vos
#      notes de publication Hugging Face / GitHub
```

## Intégration avec les pipelines de publication existants

La trousse est conçue pour se composer avec les outils existants, non pour les remplacer :

- **Hugging Face** : incluez l'URL de la publication scellée ou le CID IPFS dans
  le README.md de la carte de modèle. Renvoyez les lecteurs au scellé pour les affirmations
  de publication stables au niveau de l'octet.
- **Publications GitHub** : incluez le récépissé OpenTimestamps
  (`merkle_root.txt.ots`) comme actif de publication. Les futurs litiges du type « la publication
  a changé » sont alors ancrés à Bitcoin.
- **Normes de carte de modèle (Mitchell et al. 2019)** : la trousse est
  compatible. Les champs standard de carte de modèle se mappent aux FAITS 02–05 du
  scellé. Vous produisez la carte de modèle normalement, et en plus vous la scellez.
- **Harnais d'évaluation (lm-evaluation-harness, BIG-bench, etc.)** : hachez le
  commit exact du harnais et le JSON de sortie brut ; référencez ces hachages
  dans le FAIT 05. Les futures réexécutions sont alors indépendamment reproductibles.

## Calcul du hachage des poids

Pour un seul fichier safetensors :

```bash
shasum -a 256 model.safetensors
```

Pour des points de contrôle multi-fichiers (shards GGUF, safetensors shardés) :

```bash
# Concaténez les hachages dans l'ordre trié, puis hachez à nouveau
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Le hachage final est celui qui va dans le FAIT 03. Incluez à la fois les hachages
par shard et le hachage agrégé final afin que les utilisateurs puissent vérifier les shards
individuels au fur et à mesure du téléchargement.

## Ce que les destinataires (utilisateurs de votre modèle) doivent savoir

Une publication de modèle accompagnée d'une publication scellée MYRIAM permet à l'utilisateur de :

1. **Vérifier les poids qu'il a téléchargés** en les rehachant et en les comparant
   au FAIT 03.
2. **Vérifier que la carte de modèle n'a pas été réécrite a posteriori** en confrontant
   le FAIT 04 scellé à la version actuellement publiée par le laboratoire.
3. **Vérifier que les scores d'évaluation sont ceux de la publication** en comparant
   les affirmations d'évaluation actuelles du laboratoire au FAIT 05 scellé.
4. **Tenir le laboratoire responsable de ses engagements préalables au déploiement** en
   confrontant le comportement réel au FAIT 06 scellé.

Un utilisateur qui constate des écarts dispose d'une preuve cryptographique de
l'écart. Il peut publier cette preuve ; la publication scellée originelle est l'ancrage.

## Ce que cette trousse n'est PAS

- Pas un substitut au fait de faire réellement l'examen de sûreté. Le scellé est l'*enregistrement*
  de l'examen de sûreté, non l'examen lui-même.
- Pas un substitut à de véritables évaluations. Le scellé ancre les scores que vous
  produisez ; il ne valide pas la méthodologie.
- Pas une garantie que le modèle est sûr. Le scellé documente ce que le laboratoire
  affirme au sujet du modèle à la publication ; il ne certifie pas ces affirmations.
- Pas une protection contre la mauvaise utilisation du modèle par les utilisateurs en aval.

## Une note sur le fine-tuning adverse

Une préoccupation de sûreté de l'IA courante : quelqu'un fine-tune votre modèle pour en retirer
les comportements de sûreté et le redistribue. Le scellé ne peut PAS empêcher cela.
Ce que le scellé peut faire, c'est :

- Ancrer ce que le modèle *original* était censé faire (FAIT 04).
- Ancrer les scores d'évaluation originaux (FAIT 05).
- Fournir un point de référence par rapport auquel les fine-tunes adverses peuvent
  être mesurés.

Un utilisateur qui rencontre une redistribution par un tiers peut vérifier si
les poids correspondent au hachage scellé original. Sinon, l'utilisateur sait
qu'il a un modèle non original et que toutes les affirmations de sûreté attribuées
au laboratoire ne s'appliquent pas.

## Conclusion

Sceller une publication de modèle représente un faible travail supplémentaire pour le laboratoire : ~10 minutes
pour calculer les hachages et exécuter le script de scellage, puis une décision de 30 secondes
sur les engagements préalables au déploiement à inclure. La responsabilisation
qu'il ajoute est asymétrique : faible coût pour les laboratoires honnêtes, forte contrainte sur les
laboratoires qui auraient sinon silencieusement laissé dériver leurs affirmations.

Si vous êtes un laboratoire d'IA qui envisage l'adoption, la trousse est dans le domaine public
(CC0). Forkez-la. Modifiez-la. Les mathématiques sont l'élément porteur, pas
l'implémentation spécifique.

## Licence

Domaine public (CC0). Aucune attribution requise.
