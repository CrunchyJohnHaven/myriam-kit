*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse de scellement de dépouillement électoral avant certification

Un exemple myriam-kit clés en main pour les commissions de dépouillement
de comté, les autorités électorales d'État et les observateurs de
l'intégrité électorale qui souhaitent publier un sceau de dépouillement
ancré sur Bitcoin et à inviolabilité détectable, au moment exact de la
certification.

**Clôt** [l'issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Ce que cette trousse NE FAIT PAS (à lire en premier)

Le sceau est un horodatage cryptographique de ce qui a été certifié. Il
ne peut pas vérifier si ce qui a été certifié était correct. Les modes
d'échec suivants sont **hors du domaine du sceau** :

1. **Compromission des machines à voter.** Si le micrologiciel a été
   altéré ou si les totaux de votes ont été mal comptés, le sceau ancre
   un nombre erroné avec une haute intégrité. Le sceau observe les
   sorties du système de tabulation ; il n'a aucune visibilité sur le
   système lui-même.

2. **Suppression du vote / privation structurelle du droit de vote.**
   Les fermetures de bureaux de vote, les disparités liées aux lois
   d'identification, les biais dans les taux de rejet des bulletins par
   correspondance et les purges des listes électorales se situent en
   amont de la certification. Le sceau enregistre les bulletins
   décomptés, non les bulletins qui auraient dû l'être.

3. **Désinformation électorale.** Le sceau ne tranche pas les
   affirmations sur l'élection émises par des candidats, des médias ou
   des plateformes. Une certification scellée peut être citée dans un
   récit de désinformation aussi facilement qu'en défense contre celui-
   ci. Les horodatages cryptographiques sont neutres quant au contenu.

4. **Fraude avant certification durant la collecte ou le décompte des
   bulletins.** Les irrégularités de collecte des bulletins, le
   trafiquage des urnes de dépôt, les ruptures de la chaîne de
   conservation pendant la fenêtre de décompte — tout cela survient
   avant le moment du scellement. Le sceau ne peut pas les détecter
   rétroactivement.

5. **Coercition de l'autorité certifiante.** Une certification arrachée
   sous la contrainte produit un sceau cryptographiquement valide d'un
   résultat extorqué. Le sceau vérifie qu'un agent officiel a signé,
   non pourquoi.

6. **Certifications erronées jamais corrigées par la suite.** La valeur
   du sceau dépend d'un processus ultérieur de recherche de vérité
   (audit, recomptage, contentieux) auquel le sceau peut être comparé.
   Si aucun tel processus n'est jamais mené, le sceau demeure le seul
   enregistrement et peut figer l'erreur.

7. **Anomalies statistiques et détection de motifs.** Le sceau ne
   signale pas les marges invraisemblables, les anomalies géographiques
   ou les écarts à la loi de Benford. Ce sont des tâches d'analyse
   appliquées aux données scellées, et non des propriétés du sceau.

8. **Scrutins secondaires aux pistes d'audit minces.** Les scrutins
   plus modestes ont des seuils de déclenchement de recomptage plus
   faibles ; un sceau unique ne peut pas couvrir de façon utile tous
   les scrutins d'un bulletin sans cadrage par scrutin.

**La section des limites honnêtes ci-dessus est la partie porteuse de
cette trousse.** Les responsables qui croient que sceller équivaut à
légitimer s'en serviront comme d'un bouclier. La trousse doit le dire
clairement : il s'agit d'une *primitive de non-répudiation du moment de
certification*, et non d'une preuve de la justesse de l'élection.

---

## Ce que cette trousse DOIT REFUSER de sceller

La trousse est configurée pour rejeter les motifs factuels suivants,
même si un utilisateur disposant d'une autorité de signature valide les
soumet :

- **Identification individuelle d'un électeur.** Aucune fait ne peut
  nommer un électeur, lier un bulletin à un électeur ou exposer un
  champ susceptible de ré-identifier une personne.
- **Décisions de correspondance de signature par bulletin.** Chargées
  en PII ; les sceller crée des enregistrements permanents de décisions
  susceptibles d'être ultérieurement contestées.
- **Tout fait dont la publication identifierait un électeur
  vulnérable.** Y compris les résultats au niveau de bureaux de vote
  dans des bureaux si petits que le choix de vote y devient inférable
  (typiquement <50 bulletins).
- **Dépouillements scellés avant que tous les bulletins ne soient
  comptés.** La trousse refuse les comptages partiels présentés comme
  « le dépouillement ». Avant certification signifie *tous bulletins
  comptés, avant la certification officielle* — et non *pendant le
  comptage*.
- **Certifications provisoires ou conditionnelles.** Le sceau doit
  refléter un fait, non un conditionnel.
- **Décomptes excluant des cohortes en litige pendant** sans un fait
  compagnon scellé déclarant explicitement l'exclusion.
- **Scellement par toute personne autre que l'autorité certifiante**
  pour cette juridiction.

Un refus lui-même peut être scellé comme fait (« Cette autorité a
demandé le scellement de X ; la trousse a refusé en vertu de la règle
de refus Y »), créant un registre public de tentative d'usage abusif.

---

## Ce que cette trousse SCELLE bien

8 faits au moment de la certification :

1. **Avis d'exemple** — déclare que la publication est un exemple (les
   attestations réelles suppriment ou remplacent ce fait).
2. **Identification de la juridiction** — comté, date d'élection,
   autorité certifiante, agents certifiants par nom et fonction.
3. **Dépouillement certifié** — totaux de voix par candidat et par
   scrutin + sur-votes/sous-votes + inscriptions manuscrites.
4. **Comptabilité des bulletins et réconciliation** — total émis, total
   tabulé, total rejeté par catégorie, ventilation par mode, dénominateur
   d'électeurs inscrits.
5. **Manifeste des équipements et de la piste d'audit** — modèle de
   tabulateur + hachage du micrologiciel, hachage du fichier CVR,
   hachage de l'archive des images de bulletins, hachage du journal de
   conservation, hachage de la politique de correspondance de signature.
6. **Seuils et déclencheurs à la certification** — seuil de
   correspondance de signature en vigueur, seuils de déclenchement de
   recomptage, marges réelles par scrutin, engagement de la graine du
   RLA.
7. **Divulgations compagnes et registre de refus** — contentieux
   pendants, anomalies post-comptage en cours d'examen, cohortes
   exclues, membres dissidents du conseil ; liste explicite des motifs
   que la trousse a refusé de sceller.
8. **Mandant signataire** — identification de la commission de
   dépouillement + nom et parti de chaque signataire + informations
   cryptographiques de clé.

Chaque fait se termine par la convention du verrou de refus : *« Ce
fait n'affirme que X. Il n'affirme pas Y »* (où Y est le mode d'échec
le plus proche de la section « NE FAIT PAS » ci-dessus).

---

## Contre quoi cette trousse défend

- **Révision silencieuse des totaux de votes après certification** —
  toute modification entière au FAIT 03 produit un SHA-256 différent,
  une racine de Merkle différente, et échoue à la vérification OTS.
- **« Bulletins retrouvés » absorbés silencieusement** — l'arithmétique
  de réconciliation du FAIT 04 est figée à la certification.
- **Allégations de substitution de micrologiciel** — le FAIT 05 fige le
  manifeste d'équipement à la certification.
- **Substitution d'artefacts d'audit post-certification** — le
  manifeste de hachages du FAIT 05 attrape tout changement post-
  certification du CVR, des images de bulletins, des journaux de
  conservation ou de la politique de correspondance de signature.
- **Redéfinition des seuils et des déclencheurs** — le FAIT 06 fige les
  règles en vigueur à la certification (seuil de correspondance de
  signature, déclencheurs de recomptage, limite de risque RLA).

## Cas historiques ou quasi historiques dans lesquels la trousse aurait aidé

La trousse aurait produit un ancrage utile — *non un correctif* — dans
des cas tels que :

- **Antrim County, Michigan (2020).** Les résultats officieux initiaux
  ont montré une inversion de candidats, corrigée par la suite vers le
  résultat opposé. Un sceau antérieur à la correction aurait fourni une
  référence publique pour ce que disait l'annonce originelle face à ce
  que disait la correction, les deux étant cryptographiquement
  attestés.
- **Maricopa County, Arizona (2020–2022).** De multiples itérations de
  totaux recomptés ou réexaminés ont circulé. Un sceau au moment de la
  certification aurait fourni un point de référence sans ambiguïté
  contre lequel chaque décompte successif aurait pu être différencié.
- **Floride 2000 (dépouillement Bush v. Gore).** Les totaux certifiés
  comté par comté ont basculé sous la pression du recomptage ; un sceau
  par comté antérieur au recomptage aurait préservé ce que chaque
  comté a certifié avant que les procédures de recomptage manuel ne
  commencent.
- **Diverses élections étrangères avec des « corrections » post-
  certification documentées.** Indépendantes de la juridiction.

La trousse n'aurait PAS résolu les contestations sous-jacentes
relatives à l'intégrité des machines en 2020, ni les litiges sur la
politique du vote par correspondance, ni aucune élection dont la
question centrale concernait un fait contesté plutôt qu'un registre
contesté.

Dans les contextes électoraux d'Afrique francophone — RDC, Sénégal,
Côte d'Ivoire et autres — où les totaux annoncés par la commission
électorale font fréquemment l'objet de contestations entre proclamation
provisoire et validation par la juridiction constitutionnelle, un sceau
au moment de la certification fournit un point de référence fixe
auquel chaque observateur, national ou international, peut se
référer ultérieurement, sans dépendre d'un récit contesté de l'une
ou l'autre partie. Le sceau, comme indiqué plus haut, n'atteste
toutefois pas de la régularité du scrutin lui-même, ni ne protège
contre la coercition de l'autorité certifiante.

## Quand utiliser cette trousse

- Votre juridiction dispose d'un processus de certification stable et
  audité, et souhaite ajouter un ancrage public immuable.
- Vous anticipez un examen public post-certification et souhaitez un
  point de référence à inviolabilité détectable.
- Vous disposez de l'autorité légale pour publier l'ensemble de faits
  listé sans exposer de PII.
- Vous disposez d'un processus d'audit ou de RLA parallèle, de sorte
  que le sceau puisse être comparé à la sortie d'une démarche de
  recherche de vérité.

## Quand NE PAS utiliser cette trousse

- **Ne l'utilisez pas comme substitut à des audits limitant le risque,
  à des recomptages manuels ou à des audits post-élection.** Cette
  trousse est *additive*, non remplaçante.
- **Ne l'utilisez pas si l'agent certifiant n'est pas le véritable
  décideur** (cela crée une fausse attribution).
- **Ne l'utilisez pas en cours de tabulation.** La trousse est destinée
  spécifiquement au moment de la certification. Les sceaux de comptage
  partiel créent des points de référence trompeurs.
- **Ne l'utilisez pas pour affirmer que l'élection a été juste, exacte
  ou légitime** — elle ne peut pas faire cela.
- **Ne l'utilisez pas sous la pression d'un scellement antérieur au
  moment de certification, ni pour omettre la divulgation d'un fait
  compagnon.** Refusez, et scellez le refus.
- **Ne l'utilisez pas comme théâtre de légitimité.** Un sceau d'un
  dépouillement frauduleux est un enregistrement public permanent de la
  fraude, non une défense de celle-ci. La primitive coupe dans les deux
  sens ; telle est son honnêteté.

## Comment forker cette trousse pour une certification réelle

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # replace fictional content with real
bash build/seal.sh     # seal AT or after the official certification signature
python3 build/verify.py
```

**Timing critique :** scellez AU moment de la certification, et NON
avant. Un sceau antérieur à la certification officielle crée un
enregistrement de type faux positif « ceci est le résultat officiel ».
Un sceau postérieur est de la non-répudiation conventionnelle.

## Intégration avec l'infrastructure électorale existante

- **Commissions électorales d'État / certification EAC.** La trousse
  publie aux côtés du document officiel de certification. Elle ne
  remplace pas la certification statutaire.
- **Audits limitant le risque.** Le hachage CVR du FAIT 05 est le même
  hachage que celui consommé par l'outil RLA. Le sceau lie le CVR
  audité au total certifié.
- **Procédures de recomptage.** Un recomptage déclenché en vertu du
  droit de l'État produit un NOUVEL ensemble de faits scellés
  (horodatage différent, hachages différents, même juridiction). Les
  deux sceaux coexistent ; aucun n'écrase l'autre. Le diff entre les
  sceaux est le registre public de ce que le recomptage a modifié.
- **Election Markup Language (EML) et Common Data Format (CDF).** Les
  corps des faits devraient être dérivables des sorties EML/CDF
  existantes de la juridiction afin de conserver l'agnosticisme de la
  trousse vis-à-vis du format de données.
- **Signature bipartite de la commission de dépouillement.** Une
  variante multi-signature est recommandée pour les juridictions dotées
  de commissions à équilibre partisan.

## Ce que cette trousse NE REMPLACE pas

- La certification statutaire au titre du droit électoral d'État
- La certification EAC des systèmes de vote
- Les audits limitant le risque / les recomptages manuels
- Les procédures de recomptage et les audits post-élection
- Les ordonnances judiciaires ou le contentieux de contestation
  électorale

## Pourquoi cette trousse existe dans la v0.3.0+

Il s'agit du 6ᵉ exemple concret livré avec myriam-kit. La trousse a
été produite via un processus d'auto-recherche à la Karpathy documenté
dans `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Trois variantes de
prompt (imitation / premiers principes / contrainte d'abord) ont
produit des plans de trousse parallèles ; la variante contrainte
d'abord a obtenu le meilleur score sur une grille pondérée, et la
trousse finale synthétise sa structure avec la cohésion de la variante
imitation et le détail opérationnel de la variante premiers principes.

L'auto-recherche elle-même est documentée comme motif de prompt dans
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` pour usage ultérieur.

## Licence

Domaine public (CC0). Forkez-la. Aucune attribution requise.
