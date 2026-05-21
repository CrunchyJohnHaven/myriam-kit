*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse de pré-enregistrement d'essai clinique de médicament

Un exemple myriam-kit clé en main pour les promoteurs d'essais cliniques et les investigateurs académiques qui souhaitent pré-enregistrer un essai de manière inviolable et ancrée à Bitcoin, **en complément de** l'enregistrement sur ClinicalTrials.gov, dans l'EU CTR ou dans d'autres registres juridictionnels.

## Pourquoi pré-enregistrer *en complément* sous MYRIAM ?

Les registres d'essais existants (ClinicalTrials.gov, EU CTR, ISRCTN) présentent des faiblesses d'intégrité documentées :

- ClinicalTrials.gov permet aux promoteurs de mettre à jour les critères d'évaluation, les calculs de taille d'échantillon et les plans d'analyse **après** l'enregistrement initial : les dates de modification sont visibles dans le registre, mais les changements de *contenu* ne sont pas toujours ancrés cryptographiquement.
- Plusieurs grandes études (Goldacre et al., 2019 ; Mathieu et al., 2009) ont documenté un basculement systématique a posteriori des critères d'évaluation dans l'ensemble du domaine.
- L'application éditoriale par les revues (CONSORT, ICMJE) repère certains cas ; beaucoup passent à travers les mailles du filet.

Un scellé MYRIAM comble cette lacune. La racine de Merkle + le reçu Bitcoin OTS rendent toute modification a posteriori du critère d'évaluation principal *pré-enregistré*, du plan d'analyse statistique ou de la liste des sous-groupes cryptographiquement détectable. Le scellé est forensiquement plus difficile à réécrire après coup que le registre lui-même.

Cette trousse est un **complément** des registres juridictionnels, pas un remplacement. Un essai réel doit s'enregistrer dans le registre approprié ET être scellé sous MYRIAM.

## Contre quoi cette trousse se défend

Cas historiques de mortalité où cela aurait été utile :

- **Vioxx (Merck, 2004)** : les événements cardiovasculaires étaient un critère d'évaluation pré-enregistré dans l'essai APPROVe, mais l'analyse publiée a utilisé une date butoir qui minimisait le préjudice apparent. Un scellé de la date butoir pré-enregistrée aurait rendu le changement a posteriori de date butoir publiquement détectable avant la publication.
- **Paxil/Étude 329 (GSK/SmithKline, 2001)** : des données d'essai négatives sur la suicidalité chez l'adolescent ont été reformulées par une analyse a posteriori. Un pré-enregistrement scellé des critères d'évaluation aurait rendu cette reformulation publiquement détectable.
- **Plusieurs essais en oncologie** où les critères d'évaluation de survie ont été remplacés par des critères de substitution (survie sans progression, taux de réponse) lorsque le bénéfice de survie ne s'est pas matérialisé.

**Modes d'échec que le scellé attrape directement :**

- **Substitution de critère d'évaluation** : promotion a posteriori d'un critère secondaire au rang de « principal » lorsque le critère principal réel échoue. Le FAIT 05 du scellé contient le critère principal pré-enregistré ; le critère principal publié doit correspondre.
- **Sélection biaisée des résultats (cherry-picking)** : ne rapporter sélectivement que les analyses qui ont fonctionné. Le FAIT 06 contient le plan d'analyse complet pré-enregistré ; les analyses publiées doivent inclure l'ensemble des analyses pré-enregistrées.
- **Exploration a posteriori de sous-groupes** : affirmer que « le médicament fonctionne dans le sous-groupe X » après avoir vu les données. Le FAIT 07 contient la liste pré-enregistrée des sous-groupes ; tout autre sous-groupe doit être étiqueté a posteriori.
- **Révision de la taille d'échantillon** : augmenter la taille de l'échantillon après avoir vu les tendances intermédiaires. Le FAIT 06 contient la taille d'échantillon pré-enregistrée et le calcul de puissance.
- **Suppression silencieuse de critères secondaires gênants** : le FAIT 05 ordonne préalablement les critères secondaires pour les tests hiérarchiques ; tout réagencement ou suppression est détectable.
- **Suppression des résultats négatifs** : le FAIT 08 contient l'engagement de publication ; l'absence de publication dans la fenêtre engagée est publiquement visible.

**Modes d'échec NON couverts :**

- Inconduite dans la conduite même de l'essai (données falsifiées, recrutement frauduleux). Le scellé ancre le *plan*, pas l'*exécution*.
- Rapport sélectif dans les publications qui incluent toutes les analyses pré-enregistrées mais en donnent une interprétation favorable. Le scellé attrape ce qui est manquant ; il ne peut pas attraper le biais interprétatif.
- Préjudice aux patients pendant l'essai lui-même. Le scellé est réglementaire et probatoire ; il ne réduit pas le risque de conduite de l'essai.

## Quand utiliser cette trousse

Vous devriez envisager de sceller un pré-enregistrement si :

- Vous êtes promoteur ou conduisez un essai clinique — Phase 1 à 4 — qui servira à éclairer des décisions médicales ou réglementaires.
- Vous êtes prêt à être publiquement engagé par le design pré-enregistré, les critères d'évaluation et le plan d'analyse.
- Vous pouvez assumer la conséquence : si l'essai échoue sur ses critères d'évaluation pré-enregistrés, vous ne pouvez pas silencieusement réécrire l'histoire vers un critère qui aurait fonctionné.
- Vous participez à une culture de recherche (médecine universitaire, groupes coopératifs, recherche financée par les NIH) où l'intégrité du pré-enregistrement est de plus en plus exigée.

Cette trousse est *particulièrement* précieuse pour :

- Les essais initiés par l'investigateur dans des institutions académiques (où la pression du promoteur à changer les critères a posteriori est réelle, mais où l'investigateur académique a une incitation réputationnelle à résister).
- Les essais en science ouverte et les études citoyennes.
- Les essais de repositionnement de médicaments dans de petites sociétés de biotechnologie sans long historique de conduite d'essais.
- Tout essai destiné à éclairer des soumissions réglementaires où des arguments ultérieurs du type « nous n'avons jamais dit cela » pourraient être avancés.

## Quand NE PAS utiliser cette trousse

N'utilisez PAS cette trousse si :

- Le protocole d'essai est véritablement encore en cours d'évolution. Pré-enregistrez lorsque le protocole est final, pas avant.
- Vous ne pouvez pas vous engager à publier les résultats quelle qu'en soit la direction. Le scellé rend le défaut de publication publiquement détectable.
- L'essai implique un secret industriel concurrentiel qui vous empêche de rendre le plan d'analyse public. Le scellé fait du plan d'analyse un registre public permanent ; il n'existe aucun moyen de sceller quelque chose de façon privée.
- Vous n'avez pas obtenu d'approbation juridique et éthique du protocole. Le scellé enregistre le protocole tel que VOUS l'avez scellé ; il ne peut pas être rétroactivement approuvé par un comité d'éthique (IRB / CPP).

## Comment forker cette trousse pour un pré-enregistrement réel

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

**CHRONOLOGIE CRITIQUE** : le scellé doit être créé AVANT le début du recrutement. Un pré-enregistrement scellé après l'inclusion du premier patient est forensiquement beaucoup plus faible. L'idéal est de sceller au moment de l'approbation par le comité d'éthique (IRB / CPP).

## Intégration avec l'infrastructure de pré-enregistrement existante

La trousse est conçue pour se composer, pas pour remplacer :

- **ClinicalTrials.gov / EU CTR / ISRCTN** : enregistrez l'essai dans le registre juridictionnel comme requis. Ensuite, dans le champ « Description » ou « Références » du registre, mettez un lien vers la publication scellée MYRIAM.
- **OSF (Open Science Framework)** : OSF prend en charge le pré-enregistrement avec horodatage, mais pas l'ancrage Bitcoin. Le scellé MYRIAM peut être joint comme fichier supplémentaire sur la page de l'enregistrement OSF, fournissant à la fois l'horodatage et l'ancrage Bitcoin.
- **AsPredicted.org** : de même — liez le scellé MYRIAM comme URL supplémentaire.
- **Revues** : certaines revues (p. ex. Trials, BMJ Open) acceptent les URL de pré-enregistrement dans le cadre de la soumission. Incluez l'URL du scellé MYRIAM aux côtés de l'URL du registre.

## Ce que reçoivent les destinataires (régulateurs, relecteurs de revues, méta-analystes)

Un essai pré-enregistré sous MYRIAM donne aux relecteurs :

1. **Preuve cryptographique que le protocole a été finalisé à un moment précis.** Les relecteurs peuvent vérifier l'heure du scellé via le reçu OTS.
2. **Stabilité octet par octet du texte du protocole.** Les relecteurs qui comparent la section méthodes publiée au design pré-enregistré peuvent le faire caractère par caractère.
3. **Détection de la substitution de critère d'évaluation.** Un simple diff entre le FAIT 05 scellé et le critère principal publié révèle toute substitution.
4. **Détection de la déviation du plan d'analyse.** Un simple diff entre le FAIT 06 scellé et les méthodes statistiques publiées révèle les modifications.
5. **Détection du rapport sélectif des sous-groupes.** Le FAIT 07 scellé contient tous les sous-groupes pré-enregistrés ; tout sous-groupe figurant dans la publication mais absent du scellé doit être étiqueté a posteriori.

Cela rend la revue systématique et la méta-analyse sensiblement plus faciles que la pratique actuelle.

## Ce que cette trousse N'EST PAS

- Pas un substitut à l'approbation par un comité d'éthique (IRB / CPP).
- Pas un substitut à l'enregistrement dans le registre juridictionnel.
- Pas une garantie que l'essai sera conduit comme prévu.
- Pas un moyen d'ancrer le consentement des patients ou d'autres documents éthiques (ceux-ci nécessitent leur propre mécanisme de scellement).
- Pas une protection contre la critique post-publication du design de l'essai.

## Une note sur la publication des résultats négatifs

L'engagement n° 1 du FAIT 08 (« publication quelle qu'en soit la direction ») est l'engagement à plus fort impact sur la mortalité du scellé. La suppression historique des résultats d'essais négatifs (notamment pour les médicaments psychiatriques chez l'adolescent, les médicaments oncologiques chez les populations âgées et les médicaments cardiovasculaires chez les femmes) a vraisemblablement contribué à des milliers de décès évitables sur plusieurs décennies, en raison d'une surprescription fondée sur des estimations d'efficacité biaisées.

Un engagement scellé à publier les résultats négatifs est, à lui seul, l'une des actions de santé publique à plus fort effet de levier qu'un promoteur peut entreprendre. Le scellé offre une responsabilité externe pour cet engagement d'une manière que les politiques de publication auto-régulées ne peuvent pas fournir.

## Conclusion

Le pré-enregistrement d'un essai clinique de médicament sous MYRIAM représente peu de travail supplémentaire pour le promoteur : ~30 minutes pour remplir les faits, ~10 secondes pour sceller. La responsabilité qu'il ajoute est asymétrique : faible coût pour une conduite honnête d'essai, contrainte considérable sur les manœuvres a posteriori qui ont contribué aux biais historiques de la base de preuves.

Si vous êtes promoteur ou investigateur principal et envisagez cette trousse, la trousse est dans le domaine public (CC0). Utilisez-la. Modifiez-la. Améliorez-la.

## Licence

Domaine public (CC0). Aucune attribution requise.
