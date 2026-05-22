*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Kit d'attestation des réadmissions hospitalières

Un exemple myriam-kit clé en main pour les hôpitaux, réseaux
hospitaliers, Directeurs Médicaux (CMO), directeurs Qualité,
associations hospitalières d'État et chercheurs en santé publique
qui souhaitent publier un sceau mensuel ancré sur Bitcoin et
résistant à la falsification de *ce que les taux réels de
réadmission à 30 jours de l'hôpital étaient réellement* et *comment
ils ont été mesurés* — afin que toute révision silencieuse a
posteriori du registre des réadmissions, manipulation du statut
d'observation, manipulation des transferts ou dérive
méthodologique entre périodes de déclaration soit publiquement
détectable d'un mois à l'autre.

Le sceau est conçu pour être **comparable au sceau du mois
suivant**. Cette propriété est l'essentiel. Une attestation isolée
est utile ; le registre public d'un hôpital scellant la même
condition mois après mois selon la même méthodologie est l'artefact
porteur de charge.

---

## Ce que ce kit NE FAIT PAS (à lire en premier)

Le sceau est un horodatage cryptographique de QUELLES admissions
index ont été comptées dans QUELLE cohorte de DRG / condition,
QUELLES réadmissions à 30 jours ont été observées, QUELLES sorties
en statut d'observation et QUELS transferts ont été enregistrés,
sous QUELLE version de spécification CMS et QUELS critères
d'exclusion, signé par le Directeur Médical et le responsable
Qualité certifiants de l'hôpital. Il ne peut répondre à aucune
question sur la qualité des soins au-delà de cela. Ce qui suit
est **hors du domaine du sceau** :

1. **Prouver que les réadmissions étaient inévitables.** Une
   réadmission à 30 jours peut être causée par une planification
   inadéquate de la sortie, par une progression inévitable de la
   maladie, par la non-adhérence du patient, par des déterminants
   sociaux hors du contrôle de l'hôpital, par une nouvelle maladie
   indépendante, ou par des erreurs post-sortie dans un
   établissement en aval. Le sceau enregistre le *décompte* ; il
   ne juge pas la *cause*. Un hôpital avec un taux scellé élevé
   de réadmissions n'est pas pour autant prouvé négligent. Un
   hôpital avec un taux scellé bas de réadmissions n'est pas pour
   autant prouvé excellent.

2. **Améliorer l'hôpital.** Sceller un chiffre n'est pas une
   intervention d'amélioration de la qualité. Le sceau est une
   couche de preuve de falsification sur ce que l'hôpital rapporte
   déjà ; il ne change pas la planification de la sortie, la
   coordination des soins, le suivi post-aigu, ni aucun autre
   apport opérationnel au taux de réadmission. Un hôpital qui
   scelle un mauvais taux a un mauvais taux publiquement
   auditable ; la mauvaiseté ne change pas tant que le processus
   de soins sous-jacent ne change pas. Le sceau rend les
   affirmations sur le taux auditables ; il ne rend pas le taux
   bon.

3. **Défendre contre le biais de sélection des patients
   pré-admission.** Un hôpital qui détourne discrètement les
   patients à haut risque de l'admission (vers le statut
   d'observation, vers un transfert vers un autre établissement,
   vers une sortie de l'urgence sans admission) en amont
   apparaîtra dans les dénominateurs scellés avec une composition
   de cas d'apparence plus saine. Le sceau ancre ce que l'hôpital
   a compté comme admission index pour la cohorte ; il ne peut
   pas détecter les patients qui ne sont jamais devenus
   admissions index parce qu'ils ont été détournés. Le biais de
   sélection en amont est en amont du sceau.

4. **Défendre contre les sorties à domicile-avec-services qui
   masquent les soins continus.** Un patient sorti vers une
   agence de soins à domicile détenue par le même système de
   santé, avec des soins continus intensifs qui seraient
   fonctionnellement des soins hospitaliers ailleurs, ne compte
   pas comme une réadmission s'il n'est pas réadmis. Le sceau
   enregistre les réadmissions ; il n'enregistre pas l'intensité
   des soins continus dispensés sous une étiquette de sortie.
   Le mode de défaillance "sorti seulement de nom" est en aval
   du code de sortie et n'est pas ancré par le sceau.

5. **Détecter la mortalité qui déplace la réadmission.** Un
   patient qui meurt à domicile dans les 30 jours suivant la
   sortie ne compte pas comme une réadmission. Si un hôpital
   avec un taux élevé de déplacement-de-mortalité produit un
   taux bas de réadmission, le taux de réadmission semble bon
   alors que le résultat sous-jacent est pire. Le sceau
   enregistre les réadmissions ; le suivi de la mortalité est
   une mesure séparée avec un sceau séparé (et nécessaire).
   Sceller les taux de réadmission sans données de mortalité
   compagnonnes peut induire en erreur. Le kit refuse cette
   configuration (voir la règle de refus R4 ci-dessous).

6. **Se substituer à CMS Hospital Compare, aux mesures
   ajustées au risque de HRRP, ou à tout programme statutaire
   de déclaration de qualité.** Les soumissions de l'hôpital à
   CMS sous le Programme de Réduction des Réadmissions
   Hospitalières (HRRP), le Programme de Déclaration de Qualité
   des Patients Hospitalisés (HIQR), MIPS, et toute exigence
   de déclaration d'État sont maintenues par statut et produites
   à la demande du régulateur. Le sceau ajoute une couche
   publique résistante à la falsification AU-DESSUS de ces
   soumissions ; il NE LES remplace PAS. Une publication
   scellée n'est pas une soumission CMS.

7. **Prouver que l'hôpital est "meilleur" ou "pire" qu'un
   autre hôpital.** La comparaison inter-hôpital des taux bruts
   de réadmission sans ajustement de composition de cas est
   méthodologiquement peu solide et c'est exactement pourquoi
   HRRP utilise des mesures ajustées au risque. Le sceau publie
   les taux bruts par condition ET les taux ajustés au risque
   de la version de spécification CMS ET les dénominateurs,
   afin qu'un chercheur puisse re-dériver la comparaison
   ajustée à la composition de cas lui-même. Le sceau lui-même
   ne classe pas les hôpitaux.

8. **Détecter la fraude de codage contemporaine.** Une équipe
   de codage hospitalière qui classe à tort une réadmission
   comme nouvelle admission au moment de l'admission produit un
   taux scellé interne cohérent avec le codage (frauduleux). Le
   sceau rend la modification silencieuse ultérieure détectable,
   mais ne détecte pas le mauvais-codage contemporain. La
   détection de la fraude de codage contemporaine nécessite les
   audits CMS Recovery Audit Contractor (RAC), l'examen du
   Bureau de l'Inspecteur Général (OIG), les audits internes
   de codage et les divulgations de lanceurs d'alerte — tous en
   amont du sceau.

**La section des limites honnêtes ci-dessus est la partie porteuse
de charge de ce kit.** Les administrateurs hospitaliers qui
traitent "nous avons scellé notre taux de réadmission" comme
équivalent à "nous avons prouvé que nous fournissons de bons
soins" abusent de la primitive. Le kit doit le dire clairement :
*c'est une primitive de non-répudiation pour les affirmations
contemporaines de l'hôpital sur le registre des réadmissions, ce
n'est pas une mesure de qualité, ce n'est pas un substitut à la
supervision CMS, et ce n'est pas une défense contre les modes de
défaillance sélection-en-amont, déplacement-de-mortalité ou
déplacement-de-soins qui font que les taux de réadmission seuls
sont une image partielle de la qualité hospitalière.*

---

## Ce que ce kit DOIT REFUSER de sceller

Le kit est configuré pour rejeter les schémas de fait suivants
même si un utilisateur avec autorité de signature hospitalière
valide les soumet :

- **Résultats par patient.** Aucun fait ne peut nommer un patient,
  lier une réadmission à un patient, exposer un numéro de dossier
  médical, exposer une combinaison date-de-naissance +
  date-d'admission qui pourrait être ré-identifiante dans une
  petite cellule, ou inclure tout identifiant protégé par HIPAA.
  Les décomptes agrégés au niveau de la condition sont l'unité
  d'analyse ; tout-par-patient est refusé. (R1)

- **Résultats par médecin.** Aucun fait ne peut attribuer les
  décomptes de réadmission à un médecin traitant nommé,
  hospitaliste nommé, chirurgien nommé ou clinicien de sortie
  nommé. C'est non négociable pour deux raisons : (a) les taux
  de réadmission par médecin sont statistiquement bruyants aux
  volumes que la plupart des médecins voient en un mois et sont
  largement mal utilisés ; (b) plus important encore, la
  notation publique par médecin crée des vecteurs directs de
  représailles contre les cliniciens qui défendent les patients
  plus malades, à plus haut risque, moins favorables à
  l'assurance, contre les cliniciens qui signalent des problèmes
  de sécurité, et contre les cliniciens qui refusent de
  manipuler la mesure. Le sceau ne doit pas devenir un outil
  pour refroidir la défense des cliniciens. La mesure de qualité
  par médecin, là où elle est appropriée, appartient à la revue
  interne par les pairs et aux comités de certification avec
  leurs propres protections de procédure régulière — pas sur
  Bitcoin. (R2)

- **Taux seulement-ajustés-au-risque sans taux bruts.** Le kit
  refuse de sceller un corps de fait contenant SEULEMENT le
  taux de réadmission ajusté au risque à l'échelle de l'hôpital
  de CMS (ou toute autre mesure ajustée) sans le numérateur
  brut, dénominateur brut et taux brut correspondants.
  L'ajustement au risque est une boîte noire du point de vue
  d'un auditeur externe ; sans les taux bruts, un changement de
  méthodologie entre les mois est invisible. Le sceau DOIT
  inclure les décomptes bruts afin que le sceau du mois suivant
  puisse être comparé avec le sceau de ce mois au niveau des
  données brutes. (R3)

- **Taux agrégés à l'échelle de l'hôpital sans répartition par
  condition.** Un seul taux de réadmission à l'échelle de
  l'hôpital cache le vecteur exact de manipulation que le sceau
  est conçu pour rendre visible — un hôpital pourrait
  silencieusement déplacer la composition de cas des DRGs à
  haute-réadmission vers les DRGs à basse-réadmission tandis
  que le taux à l'échelle de l'hôpital semble stable ou en
  amélioration. Les taux par condition (au minimum : AMI,
  insuffisance cardiaque, pneumonie, BPCO, CABG, THA/TKA, les
  cohortes HRRP) DOIVENT apparaître, avec les dénominateurs par
  condition. Le taux à l'échelle de l'hôpital, s'il est
  rapporté, est en plus de (et non à la place de) des taux par
  condition. (R4)

- **Tout ce qui ne serait pas comparable avec le sceau du mois
  suivant.** Toute la valeur forensique de ce kit provient de
  la comparabilité d'un mois à l'autre. Le kit refuse les corps
  de fait qui sont structurés de telle sorte que le sceau du
  mois suivant ne peut être comparé à celui-ci — par exemple,
  un texte libre "notre taux de réadmission est d'environ X
  pour cent" sans numérateur, dénominateur, version de
  méthodologie et liste de critères d'exclusion fixes. Si
  l'analyste du mois suivant ne peut pas calculer "ce nombre
  est passé de X à Y à cause de A et B," le fait est malformé
  et le kit refuse de le sceller. (R5)

- **Données de mortalité sans attestation de mortalité
  compagnonne.** Sceller les réadmissions sans sceller la
  mortalité post-sortie à 30 jours active le vecteur de
  manipulation "les patients qui meurent à domicile ne comptent
  pas comme réadmissions" qui produit un taux de réadmission
  trompeusement bas. Le kit refuse de sceller une attestation
  de réadmission qui n'inclut pas (a) le décompte de mortalité
  post-sortie à 30 jours dans la même publication, ou (b) ne
  référence, par racine de Merkle, une attestation de
  mortalité compagnonne pour la même période. (R6)

- **Décomptes de statut-d'observation qui excluent la catégorie
  de justification.** Le kit refuse de sceller un décompte de
  statut-d'observation qui ne décompose pas les catégories de
  justification (élimination de douleur thoracique, syncope,
  déshydratation, etc.) et la distribution de durée. Un
  décompte d'observation agrégé brut active le schéma exact de
  manipulation que ce sceau est conçu pour rendre visible : un
  déplacement silencieux de l'admission hospitalière vers le
  statut d'observation pour les cas qui auraient autrement été
  comptés comme admissions index. (R7)

- **Décomptes de transfert qui excluent la catégorie
  d'établissement récepteur et le drapeau intra-système.** Un
  transfert vers un hôpital frère du même système de santé est
  fonctionnellement différent d'un transfert vers un
  établissement indépendant. Le kit refuse de sceller les
  décomptes de transfert sans la répartition intra-système.
  (R8)

- **Scellement par toute personne autre que le Directeur Médical
  certifiant ET un responsable Qualité séparé.** Minimum
  deux-signataires pour les attestations hospitalières, parce
  que les vecteurs de manipulation ici sont exactement le type
  que la fraude institutionnelle de signataire-unique dissimule.
  Un consultant qualité tiers, un registre externe, ou une
  association d'État d'hôpitaux peut utiliser le même kit pour
  sceller SA propre analyse indépendante ; il NE PEUT PAS
  sceller l'attestation principale de réadmission de l'hôpital
  sous le nom de l'hôpital. (R9)

Un refus lui-même peut être scellé comme un fait ("Cet hôpital
a demandé le scellement de X ; le kit a refusé selon la règle
de refus Y"), créant un registre public de tentative de
mauvais usage.

---

## Ce que ce kit scelle

8 faits au moment de l'attestation mensuelle :

1. **Avis d'exemple** — déclare la publication comme exemple
   (les attestations réelles suppriment ou remplacent ceci).
2. **Identification de l'hôpital** — nom légal de l'hôpital,
   Numéro de Certification CMS (CCN), région de l'établissement,
   rôle du CMO certifiant + rôle du responsable Qualité + info
   de clé cryptographique.
3. **Période d'attestation** — mois calendaire couvert, date de
   gel des données, date d'attestation, déclaration qu'aucun
   enregistrement n'a été modifié après la date de gel des
   données pour la période sous attestation.
4. **Taux de réadmission** — taux de réadmission par-DRG /
   par-condition à 30 jours toutes-causes, numérateur brut,
   dénominateur brut, taux brut avec intervalle de confiance à
   95%, ET le taux ajusté au risque de la version de
   spécification CMS aux côtés du taux brut (par règle de
   refus R3).
5. **Décomptes d'admission index** — dénominateurs par
   condition, total des sorties hospitalières du mois,
   répartition par payeur principal (Medicare FFS / Medicare
   Advantage / Medicaid / commercial / paiement-propre / autre)
   pour transparence de composition de cas.
6. **Divulgation du statut d'observation** — décompte des
   sorties en statut d'observation, répartition par catégorie
   de justification, distribution de durée (≤24h, 24-48h,
   >48h), et le décompte de conversions hospitalisation-vers-
   observation s'il y en a (le schéma de manipulation adjacent
   à la "règle des deux minuits").
7. **Divulgation des transferts** — décomptes de patients
   transférés vers d'autres établissements hospitaliers,
   répartis par intra-système vs. établissement récepteur
   indépendant, par catégorie de raison (escalade de niveau de
   soins, demande du patient, capacité, assurance), et
   décomptes de patients reçus en tant que transferts (afin
   que le flux net soit calculable).
8. **Méthodologie** — version de spécification CMS (année de
   mesure HRRP), critères d'exclusion appliqués, gestion
   d'exclusion des réadmissions planifiées, politique
   d'attribution de transfert sortant, politique
   observation-comme-admission-index, déclaration de tout
   changement par rapport à la méthodologie scellée du mois
   précédent avec une référence de racine de Merkle au sceau
   de la période précédente, info de clé cryptographique du
   principal signataire.

Chaque fait se termine par la convention de porte-de-refus :
*"Ce fait n'affirme que X. Il n'affirme pas Y"* (où Y est le
mode de défaillance le plus proche de la section "NE FAIT
PAS" ci-dessus).

---

## Ce contre quoi ce kit défend

- **Révision rétroactive silencieuse des taux de réadmission.**
  Tous les faits porteurs-de-taux sont hachés. Le re-hachage
  post-attestation révèle toute modification. Un régulateur,
  chercheur, ou lanceur d'alerte qui possède la racine scellée
  du mois précédent peut détecter tout changement silencieux
  au taux publié du mois précédent lorsque l'hôpital rapporte
  la prochaine fois.
- **Manipulation statut-d'observation-comme-sortie devenant
  indétectable.** Le FAIT 06 gèle le décompte d'observation,
  la distribution par catégorie de justification, et la
  distribution de durée à l'attestation. Un déplacement
  silencieux d'un mois à l'autre de la sortie hospitalière au
  statut d'observation (qui retirerait du dénominateur ce qui
  auraient été les admissions index) est publiquement
  comparable à travers les sceaux.
- **Dérive méthodologique entre périodes de déclaration CMS.**
  Le FAIT 08 gèle la version de spécification CMS, les
  critères d'exclusion, et la gestion d'exclusion des
  réadmissions planifiées. Tout changement doit être divulgué
  dans le FAIT 08 du mois suivant avec une référence à la
  racine de Merkle de ce mois. Un changement silencieux de
  méthodologie entre les mois qui produit un mouvement
  favorable de taux est publiquement détectable.
- **Manipulation d'attribution de transfert sortant.** Le
  FAIT 07 gèle les schémas de transfert incluant le drapeau
  intra-système et la catégorie de raison. Un déplacement
  silencieux vers le transfert de patients à haut risque avant
  30 jours (qui les retirerait du numérateur de réadmission
  sous certaines spécifications) est publiquement détectable
  à travers les mois.
- **Manipulation de composition-de-cas via déplacement de
  payeur ou DRG.** Le dénominateur par condition et la
  répartition par payeur du FAIT 05 gèlent la composition de
  cas du mois. Un déplacement silencieux loin des conditions
  à haute-réadmission (en admettant moins de patients en
  insuffisance cardiaque tout en admettant plus de patients
  électifs orthopédiques, par exemple) est publiquement
  comparable à travers les mois.
- **Confusion des taux bruts et ajustés au risque.** Le
  FAIT 04 exige les deux. Une future affirmation "notre taux
  ajusté au risque s'est amélioré de X" est publiquement
  vérifiable contre le mouvement du taux brut et le mouvement
  du dénominateur ensemble.
- **Re-narration méthodologique post-hoc.** Le FAIT 08 est
  scellé à l'attestation. Une future affirmation "nous avons
  toujours utilisé la méthodologie Y" est publiquement
  réfutable contre la méthodologie scellée de la période en
  question.

Le kit **ne** défend **pas** contre la fraude de codage
contemporaine — un hôpital qui classe à tort une réadmission
comme nouvelle admission au moment du codage produit un sceau
cryptographiquement valide d'un décompte frauduleux. La
primitive est honnête à ce sujet : c'est une primitive de
non-répudiation pour les affirmations contemporaines de
l'hôpital, pas une preuve que ces affirmations soient correctes.

---

## Quand utiliser ce kit

- Votre hôpital a un flux de travail stable de
  composition-de-cas et codage et souhaite ajouter une
  attestation publique mensuelle ancrée sur Bitcoin comme une
  couche résistante à la falsification au-dessus du flux de
  travail existant de déclaration HRRP / HIQR.
- Vous êtes un système hospitalier souhaitant publier la
  transparence à l'échelle du système à travers plusieurs
  établissements, scellée par-établissement par-mois, afin que
  la variation intra-système soit publiquement comparable.
- Vous êtes un chercheur en santé publique ou une association
  d'État d'hôpitaux exécutant un programme volontaire de
  transparence parmi les hôpitaux participants, et souhaitez
  une primitive cryptographique commune que tous les hôpitaux
  participants peuvent utiliser sans faire confiance à un
  agrégateur central.
- Vous êtes un hôpital dans une juridiction dont l'infrastructure
  statutaire de déclaration est faible ou où vous attendez un
  examen significatif des payeurs / patients / régulateurs sur
  vos affirmations de réadmission, et souhaitez une chronologie
  vérifiable mondialement de ces affirmations.
- Vous pouvez publier l'ensemble de faits listé sans enfreindre
  les règles de refus R1-R9. Si vos faits nécessiteraient une
  rupture R1-R9, n'utilisez pas le kit ; corrigez d'abord les
  entrées de données.
- Le conseil juridique et la conformité de l'hôpital ont examiné
  le plan de publication. La publication publique d'un artefact
  porteur-de-CCN, porteur-de-taux a des implications sous HIPAA
  (normes de dé-identification), HRRP (interaction avec la
  déclaration statutaire), et les régulateurs d'État
  (interaction avec les lois de transparence au niveau de
  l'État). L'examen du conseil n'est pas optionnel.

## Quand NE PAS utiliser ce kit

- **Ne pas utiliser comme substitut aux soumissions CMS HRRP /
  HIQR / Hospital Compare.** Le sceau est *additif*, non
  remplacement. Vos soumissions statutaires, vos registres
  d'audit CMS, votre programme interne de qualité — inchangés.
- **Ne pas utiliser comme affirmation de qualité.** Sceller un
  taux bas de réadmission n'établit pas que l'hôpital fournit
  de bons soins ; cela établit que le registre avait ce contenu
  d'octets à ce moment. Les règles de refus R1-R9 rejetteront
  les schémas qui confondent attestation et soutien de qualité.
- **Ne pas utiliser pour publier des données par patient ou
  par médecin.** Les règles de refus R1-R2 existent pour des
  raisons HIPAA, de prévention des représailles, et de
  solidité statistique ; n'amendez pas le kit pour les vaincre
  sans consulter le conseil et l'examen éthique.
- **Ne pas utiliser sous pression pour sceller avant que le
  gel des données du mois soit final.** Un sceau de données
  partielles déforme la période d'attestation et crée un point
  de référence trompeur.
- **Ne pas utiliser sans une attestation de mortalité
  compagnonne.** La règle de refus R6 rejettera les attestations
  de réadmission qui omettent la mortalité. Les deux mesures
  ensemble sont partielles ; l'une seule est trompeuse.
- **Ne pas utiliser comme théâtre de légitimité.** Un sceau
  d'un registre de réadmissions manipulé est un registre public
  permanent de la manipulation, non une défense contre elle.
  La primitive coupe dans les deux sens ; c'est son honnêteté.

## Comment forker ce kit pour une attestation mensuelle réelle

```bash
cp -r ~/Genesis/myriam-kit/examples/hospital-readmission-attestation ~/readmission-2026-04
cd ~/readmission-2026-04
$EDITOR facts/*.txt        # replace fictional content with real month
                           # apply refusal rules R1-R9 throughout
bash build/seal.sh         # SEAL AT month-end + data-freeze + CMO/QO sign-off
python3 build/verify.py    # confirm
```

**TIMING CRITIQUE :** sceller AU moment du gel mensuel des
données + approbation du CMO et du responsable Qualité. Ne pas
sceller en milieu de mois. Ne pas sceller après que la réunion
interne d'examen de l'hôpital ait eu l'occasion d'"ajuster" les
chiffres — l'objectif central est d'ancrer ce que les données
disaient au gel avant tout ajustement. La bonne fenêtre est
entre le gel formel des données et la première fois où le taux
est cité publiquement.

**EXAMEN CRITIQUE :** avant de sceller, faites passer la
publication à travers le responsable Qualité (séparé du CMO),
à travers codage / conformité, et à travers le conseil. La
règle des deux-signataires (FAIT 02 et FAIT 08) existe pour
empêcher la fraude institutionnelle de signataire-unique.

**CADENCE MENSUELLE :** la valeur du kit s'accumule à travers
les mois. Sceller une fois est utile ; sceller chaque mois
pendant un an est l'artefact. Le FAIT 08 de chaque nouveau
mois référence la racine de Merkle du mois précédent afin que
la chaîne d'attestations soit publiquement parcourable.

## Intégration avec l'infrastructure existante de qualité
hospitalière

- **CMS Hospital Readmissions Reduction Program (HRRP).**
  L'URL de la publication scellée ou le CID IPFS peut être
  référencé dans les matériels de divulgation publique de
  l'hôpital. Le sceau engage les taux par-condition bruts et
  ajustés au risque que l'hôpital rapporte à CMS ; les
  litiges ultérieurs sur ce qui a été rapporté sont
  publiquement réfutables.
- **CMS Hospital Inpatient Quality Reporting (HIQR)
  Program.** Le sceau engage les décomptes sous-jacents qui
  alimentent les mesures HIQR ; le sceau ne remplace pas la
  soumission HIQR.
- **CMS Hospital Compare / Care Compare site public.** Le
  sceau se trouve aux côtés de Hospital Compare comme
  attestation indépendante ; l'hôpital peut référencer ses
  publications mensuelles scellées dans les matériels orientés
  patient.
- **Déclarations d'associations d'État d'hôpitaux (p.ex. PHC4
  en Pennsylvanie, OSHPD/HCAI en Californie, NYSDOH à New
  York).** Compatible comme couche additive de transparence ;
  les décomptes par condition du sceau peuvent être
  inter-traduits avec les catégories de déclaration d'État
  là où les définitions s'alignent.
- **The Leapfrog Group, classements US News & World Report,
  Healthgrades, programmes de cohortes Vizient.** Compatible.
  Ces programmes agrègent les données de qualité
  hospitalière ; une attestation mensuelle scellée leur permet
  (et au public) de vérifier que les affirmations de l'hôpital
  à leur égard correspondent aux affirmations de l'hôpital
  ailleurs.
- **Accréditation The Joint Commission.** Compatible. Les
  attestations scellées sont preuves documentaires que
  l'inspecteur de la Joint Commission peut vérifier pendant
  les visites d'accréditation.
- **Certification interne et examen par les pairs (par
  Healthcare Quality Improvement Act de 1986).** Hors du
  champ du sceau directement. Les données par médecin
  n'apparaissent pas dans le sceau (règle de refus R2).
  L'examen interne par les pairs reste sous les protections
  HCQIA.
- **CMS MIPS (Merit-based Incentive Payment System) pour les
  médecins individuels.** Hors du champ ; le sceau est au
  niveau hospitalier seulement.

## Ce que ce kit NE remplace PAS

- Soumission CMS HRRP.
- Soumission CMS HIQR.
- Flux de données CMS Hospital Compare / Care Compare.
- Déclaration hospitalière au niveau de l'État (PHC4,
  OSHPD/HCAI, NYSDOH, équivalents d'État).
- Accréditation Joint Commission.
- Examen interne par les pairs et certification.
- Audits CMS Recovery Audit Contractor (RAC).
- Supervision HHS Office of Inspector General (OIG).
- Examen CMS Quality Improvement Organization (QIO).
- Déclaration d'événements de sécurité du patient (CMS
  Conditions of Participation, exigences d'État, déclaration
  PSO).
- Attestation compagnonne de mortalité post-sortie à 30 jours
  (qui devrait être scellée sous une publication myriam-kit
  séparée pour la même période — voir règle de refus R6).

## Valeur d'adoption et estimation honnête d'impact

Le Programme de Réduction des Réadmissions Hospitalières (HRRP)
impose actuellement des pénalités de paiement aux hôpitaux
américains dont les taux de réadmission à 30 jours ajustés au
risque dépassent le taux attendu de CMS. Les estimations
publiées des totaux annuels de pénalités HRRP sont dans les
**centaines de millions de dollars par an au niveau national**
(le total des pénalités FY2023 a été rapporté par CMS à environ
320 millions de dollars ; le cumul de vie du programme est dans
les milliards). La structure de pénalité crée des incitations
financières mesurables pour les hôpitaux à sous-déclarer les
réadmissions par manipulation du statut d'observation,
manipulation des transferts sortants, déplacement de
composition-de-cas et révision silencieuse des cas limites —
tous documentés dans la littérature évaluée par les pairs
(Wadhera et al., JAMA 2018-2019 ; Khera et al., JAMA 2018 ;
Gupta et al., JAMA Cardiol 2018 ; Zuckerman et al., NEJM 2016
et critiques de suivi).

**L'estimation honnête de l'impact :**

Une attestation mensuelle scellée de réadmission ne réduit pas
l'incitation à manipuler ; elle rend une catégorie de
manipulation détectable. Si les attestations scellées sont
adoptées par des hôpitaux représentant ~20 pour cent des
admissions éligibles HRRP sur 5 ans, et si la détectabilité
résultante dissuade même ~10 pour cent de la manipulation qui
se produirait autrement, la valeur de santé publique est en
meilleure planification de sortie pour une fraction des
patients qui auraient autrement été
sortis-pour-manipuler plutôt que
sortis-pour-réellement-récupérer. Traduire cela en un décompte
de vies est difficile et le kit refuse de publier une seule
estimation de victimes qui serait citée comme faisant autorité
— la chaîne d'inférence de "manipulation réduite de X" à "morts
évités de Y" passe par plusieurs paramètres mal identifiés
(quelle fraction de sorties manipulées a produit une mortalité
évitable, la qualité contrefactuelle des soins, la distribution
du risque à travers les cohortes susceptibles à la
manipulation) et tout nombre spécifique cité comme estimation
de victimes inventerait une précision que les données ne
soutiennent pas.

**Le cadrage honnête :**

L'argument pour l'adoption n'est pas "ce kit sauvera N vies."
C'est : *si vous croyez que la littérature publiée sur la
manipulation-HRRP (Wadhera, Khera, Gupta, Zuckerman, et autres)
est à peu près correcte sur le fait que la manipulation est une
fraction mesurable de l'amélioration apparente de HRRP depuis
2012, alors une attestation mensuelle résistante à la
falsification est la primitive disponible la moins chère qui
rend cette manipulation publiquement comparable à travers les
mois. Le sceau n'arrête pas la manipulation ; il rend un canal
de celle-ci auditable. Cette auditabilité est ce qui produit
la pression sociale sur les hôpitaux pour ne pas manipuler. La
pression sociale est ce qui produit (une fraction de)
l'amélioration réelle des soins. Les vies sauvées sont en aval
de trois étapes causales que le sceau lui-même ne réalise pas.
Adoptez le kit avec cette compréhension, pas avec une promesse
de vies-sauvées.*

Les valeurs par défaut du kit sont délibérément conservatrices
sur les données par-patient (règle de refus R1), agressives
sur la prévention des représailles par-médecin (règle de refus
R2), et agressives sur le déni "ceci n'est pas une affirmation
de qualité". Les hôpitaux dans des juridictions où les
exigences spécifiques de divulgation publique diffèrent peuvent
amender leur fork en conséquence, mais les refus par défaut
favorisent la confidentialité du patient, la protection de la
défense des cliniciens et un champ honnête.

## Schémas historiques avec lesquels le kit aurait aidé

Le kit aurait produit un registre forensique mois-à-mois utile
— *pas une solution* — dans les schémas documentés suivants :

- **Croissance du statut-d'observation à l'ère HRRP.** De
  multiples études ont documenté une croissance substantielle
  des sorties en statut d'observation à travers les hôpitaux
  américains coïncidant avec la mise en œuvre de HRRP (Sheehy
  et al. ; Zuckerman et al.). Un décompte mensuel scellé
  par-hôpital d'observation avec répartition par catégorie de
  justification (FAIT 06) aurait rendu publiquement comparable
  le moment et l'ampleur de la contribution de chaque hôpital
  à ce schéma, plutôt que visible seulement dans la recherche
  agrégée-nationale-rétrospective des années plus tard.
- **Disparités de pénalisation HRRP affectant les hôpitaux de
  filet-de-sécurité.** Les hôpitaux servant des populations
  plus défavorisées font face à des pénalités HRRP plus
  élevées sous l'ajustement standard de risque (par plusieurs
  analyses Khera et al.) ; une répartition mensuelle scellée
  par payeur (FAIT 05) permettrait au public de suivre
  séparément les changements de composition-de-cas des
  changements de taux pour chaque hôpital, rendant possible la
  distinction entre amélioration réelle de taux et déplacement
  de composition-de-cas.
- **Schémas de transfert intra-système dans les systèmes de
  santé multi-établissements.** Certains systèmes hospitaliers
  multi-établissements ont été documentés comme acheminant les
  besoins post-sortie à travers des établissements
  intra-système de manières qui n'apparaissent pas toujours
  comme transferts dans les mesures HRRP. Un décompte mensuel
  scellé de transfert avec drapeau intra-système (FAIT 07)
  rendrait cela publiquement suivable par établissement par
  mois.

Le kit N'aurait PAS résolu les litiges sous-jacents sur la
méthodologie d'ajustement de risque de HRRP, sur si HRRP est
en balance utile ou nuisible aux résultats des patients, ou
sur si la structure de pénalisation devrait être changée. Ce
sont des débats de politique en amont du sceau.

## Licence

Domaine public (CC0). Forkez-le. Aucune attribution requise.
