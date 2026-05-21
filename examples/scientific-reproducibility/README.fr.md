*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse de reproductibilité scientifique

Un exemple myriam-kit clé en main pour les groupes de recherche, les
revues et les institutions axées sur la reproductibilité qui souhaitent
publier, aux côtés d'un article ou d'un preprint, un manifeste de
reproductibilité **ancré dans Bitcoin et à inviolabilité détectable**.

## Ce que produit cette trousse

Une publication scellée contenant, pour une étude unique :

1. Identification de l'étude (titre de l'article, auteurs, institution,
   financeurs, conflits d'intérêts)
2. **SHA-256 de l'archive des données brutes** — le jeu de données
   canonique
3. **Hachage du pipeline d'analyse** — script + empreinte de l'image
   Docker + dépendances épinglées
4. **Hachage du paquet de sortie attendu** — ce qu'un reproducteur
   fidèle devrait obtenir
5. Protocole de reproduction + engagements de publication
   post-résultats
6. Principal(aux) signataire(s)

Le scellement est destiné à l'étape **pré-analyse** : données figées,
pipeline finalisé, sortie attendue calculée, TOUT cela avant que le
moindre résultat ne soit consulté en vue de la rédaction de l'article.

## Contre quoi cette trousse défend

**Modes d'échec que le scellement permet de détecter :**

- **p-hacking** : les modifications a posteriori de l'analyse, une fois
  les résultats vus, sont détectables par la différence entre le FACT
  04 scellé et le pipeline publié.
- **HARKing** (Hypothesizing After Results are Known, formulation
  d'hypothèses après connaissance des résultats) : l'hypothèse
  préenregistrée dans le FACT 02 est stable au niveau de l'octet.
- **Manipulation des données après publication** : recalculer le
  hachage de l'archive de données par rapport au FACT 03 révèle toute
  modification.
- **Dérive du pipeline** : recalculer le hachage du pipeline d'analyse
  par rapport au FACT 04 met au jour les changements silencieux.
- **Manipulation de la liste d'auteurs** : ajouter ou retirer
  silencieusement des auteurs après la publication devient détectable
  par rapport au FACT 02 scellé.

**Modes d'échec NON couverts :**

- La fraude lors de la collecte des données brutes (le scellement
  ancre les données au moment du scellement, pas de la collecte)
- La non-reproductibilité biologique / empirique (le scellement n'ancre
  que la reproductibilité computationnelle)
- Les questions de taille d'échantillon ou de validité de population
  (ce sont des questions de conception d'étude)
- La véracité de l'affirmation sous-jacente (le scellement ancre ce qui
  a été affirmé, et non si le monde correspond à l'affirmation)

## Quand utiliser cette trousse

Envisagez le scellement si :

- Vous êtes un groupe de recherche menant une analyse à fort enjeu
  (essai clinique, évaluation d'un système d'IA, étude de réplication)
  et souhaitez une intégrité forensique allant au-delà des horodatages
  OSF / GitHub
- Vous êtes une chercheuse ou un chercheur en début de carrière qui
  souhaite une protection réputationnelle asymétrique : une
  pré-analyse scellée signifie que toute future critique « ils ont fait
  du p-hacking » disposera d'un falsificateur public
- Vous êtes rédacteur de revue ou responsable d'un projet de
  réplication souhaitant encourager une préenregistration de grade
  cryptographique pour un sous-ensemble d'articles
- Vous travaillez sur une analyse où les ajustements a posteriori ont
  des conséquences significatives pour le champ (psychologie, économie
  comportementale, recherche médicale)

## Précédents historiques de mortalité / nuisance

La pertinence de cette trousse en matière de mortalité est indirecte :

- **Non-reproductibilité de la recherche sur cellules souches /
  cancer :** plusieurs articles ont conduit à des préjudices pour les
  patients via des essais cliniques mal orientés. Une préenregistration
  scellée du pipeline original aurait ancré le point de comparaison.
- **Controverse sur l'efficacité du Tamiflu :** la revue Cochrane a
  pris des années en partie parce que l'accès aux données brutes
  était contesté. Des hachages de données scellés au moment de la
  publication auraient rendu les litiges d'accès aux données
  immédiatement tranchables.
- **Crise générale de non-reproductibilité :** le coût en mortalité, à
  l'échelle du champ, d'une recherche biomédicale non reproductible
  est significatif (Begley & Ellis 2012 estimaient que >50 % des
  résultats précliniques sont non reproductibles). L'ancrage
  cryptographique est l'un des leviers structurels.

## Comment forker cette trousse

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITIQUE : faire ceci AVANT d'avoir vu le moindre résultat
shasum -a 256 raw_data_v0.tar.gz       # calcule le hachage canonique des données
shasum -a 256 analysis.py              # hache votre pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # remplir avec les valeurs réelles
bash build/seal.sh                     # sceller AVANT d'exécuter l'analyse
python3 build/verify.py                # confirmer

# Exécuter maintenant l'analyse. Hacher la sortie et confirmer la concordance avec le FACT 05.
# En cas de non-concordance, le pipeline n'est pas déterministe ; corriger et resceller.
```

## Intégration avec l'infrastructure savante existante

- **arXiv / bioRxiv / medRxiv** : inclure l'URL du sceau MYRIAM ou le
  CID IPFS dans le résumé ou les matériaux supplémentaires
- **OSF** : joindre l'artefact du sceau au projet OSF, aux côtés du
  formulaire conventionnel de préenregistration
- **AsPredicted** : inclure l'URL du sceau MYRIAM dans le document de
  préenregistration
- **GitHub** : le hachage du commit du pipeline d'analyse est ce que
  le FACT 04 ancre ; GitHub fournit la source, MYRIAM ancre les octets
- **Zenodo / Figshare / OpenAIRE** : déposer les données brutes, puis
  sceller le hachage du dépôt ; le sceau est forensiquement plus
  difficile à remplacer silencieusement que les métadonnées du dépôt
- **Matériaux supplémentaires des revues** : joindre l'artefact du
  sceau MYRIAM comme fichier supplémentaire au moment de la soumission

## Ce que cette trousse NE remplace PAS

- L'approbation de l'IRB / du comité d'éthique
- L'évaluation par les pairs
- Les études de réplication (la reproductibilité computationnelle ≠
  reproductibilité empirique)
- Les accords d'accès aux données pour les données sensibles

## Une note sur l'ordre des auteurs et l'attribution

Le sceau ancre la LISTE D'AUTEURS au moment du scellement. Les litiges
sur l'attribution apparus après la publication peuvent être évalués au
regard de la liste scellée. C'est un petit levier de responsabilité —
important pour les chercheuses et chercheurs en début de carrière qui
se voient ajoutés ou retirés en silence.

## Note sur les limites du scellement

Soyez clair avec vous-même et avec vos lecteurs : sceller le protocole
pré-analyse rend le p-hacking **publiquement détectable**, mais le
sceau **ne peut empêcher une analyse contraire à l'éthique ni résoudre
le problème de la motivation humaine**. Une chercheuse déterminée à
violer son protocole scellé peut toujours le faire ; le sceau garantit
seulement que la violation reste consignée. La sociologie de la science
— incitations de carrière, biais de publication, pression des
financements — se situe au-dessus de toute couche cryptographique.
Cette trousse fournit un falsificateur, pas une vertu.

## Licence

Domaine public (CC0). Utilisez-la, modifiez-la, ignorez-la, forkez-la.
