*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse d'attestation de sécurité alimentaire

Un exemple myriam-kit clé en main destiné aux fabricants de produits
alimentaires, aux inspecteurs de la sécurité alimentaire, aux certificateurs
tiers et aux autorités réglementaires souhaitant publier un sceau ancré
sur Bitcoin et révélateur de toute altération, attestant *ce que les
tests de libération ont indiqué* et *quelle décision de libération a
été prise*, au moment de la libération du lot ou de la signature du
rapport d'inspection — de sorte que toute modification silencieuse,
postérieure à la libération, du dossier d'essais, de la décision de
libération ou des engagements de rappel devienne publiquement détectable.

---

## Ce que cette trousse NE fait PAS (à lire en premier)

Le sceau est un horodatage cryptographique de QUELS tests de libération
ont été effectués sur QUEL lot, par QUELS laboratoires accrédités,
selon QUELLES méthodes, avec QUELS résultats, et de QUELLE DÉCISION
DE LIBÉRATION l'autorité d'assurance qualité a prise sur la base de
ces résultats. Il ne peut répondre à aucune question concernant la
sécurité alimentaire au-delà de cela. Les éléments suivants sont
**hors du domaine du sceau** :

1. **Prévenir la contamination.** La trousse ancre ce que les
   résultats de tests ONT INDIQUÉ à la libération. La contamination a
   de nombreuses causes — distribution microbienne hétérogène au sein
   d'un lot, écarts de température post-libération lors de la
   distribution, défaillances de manipulation au détail, défaillances
   de préparation par le consommateur, dangers nouveaux ou non
   recherchés (p. ex. adultération à la mélamine avant que le
   dépistage de la mélamine ne devienne routinier), fraude de chaîne
   d'approvisionnement en amont du périmètre de tests du fabricant.
   Le sceau ne prévient aucun de ces phénomènes et ne prétend pas
   le faire.

2. **Garantir que toutes les unités d'un lot conforme sont sûres.**
   La contamination microbiologique dans les produits alimentaires
   en vrac est HÉTÉROGÈNE. Listeria, Salmonella et les STEC
   pathogènes apparaissent dans des points chauds localisés à faible
   prévalence, et non de façon uniformément distribuée. Les plans
   d'échantillonnage de l'ICMSF et du Codex ont une probabilité
   documentée et bornée de détecter une contamination présente à
   faible prévalence — cette probabilité n'est PAS de 1. Un lot qui
   passe l'échantillonnage de libération peut encore contenir des
   unités contaminées qui n'ont pas été échantillonnées. Le sceau
   ancre les ÉCHANTILLONS, non le vrac. Cette contrainte est
   explicitement réénoncée dans le FACT 03 et constitue la limite
   honnête la plus importante de cette trousse.

3. **Certifier que les tests de libération ont été menés
   honnêtement.** Le sceau ancre ce que les tests ont rapporté à la
   libération. Un laboratoire qui rapporte un PASS frauduleux à la
   libération produit un sceau cryptographiquement valide d'un PASS
   frauduleux. La trousse rend détectable toute modification
   silencieuse ultérieure, mais ne détecte pas la fraude
   contemporaine. La détection de la fraude contemporaine requiert
   l'audit, la surveillance de l'accréditation des laboratoires
   (surveillance ISO 17025), les programmes d'essais d'aptitude et
   l'inspection réglementaire — autant d'éléments en amont du sceau.

4. **Se substituer aux dépôts réglementaires FSMA, FSIS ou auprès
   des autorités compétentes de l'UE.** Les dossiers de libération
   au titre du FSMA, du FSIS, du Règlement (CE) 178/2002 de l'UE et
   du Codex Alimentarius sont tenus conformément à la loi et produits
   sur demande du régulateur. Le sceau ajoute une couche publique
   révélatrice de toute altération PAR-DESSUS ces dépôts ; il ne les
   remplace PAS. Une publication scellée n'est pas un dépôt
   réglementaire.

5. **Résoudre les différends sur l'étendue d'un rappel.** La trousse
   peut sceller les engagements de rappel pris à la libération
   (FACT 06) et une étendue de rappel ultérieure sous forme de
   nouvelle publication ; mais la frontière définissant quels lots
   sont affectés, quelles unités ont été expédiées, quels détaillants
   les ont reçues et quels consommateurs ont été exposés relève
   encore d'une enquête de traçabilité amont et aval. Le sceau ancre
   ce que le fabricant S'EST ENGAGÉ à faire et ce qu'il a
   effectivement FAIT par la suite. Il ne résout pas la question
   épidémiologique sous-jacente.

6. **Détecter la fraude délibérée de chaîne d'approvisionnement en
   amont des tests.** L'adultération à la mélamine du lait et des
   préparations pour nourrissons en Chine en 2008 a réussi parce que
   la mélamine ne figurait pas au panel d'analytes — la mesure
   d'équivalent-protéique par teneur en azote y figurait, et la
   mélamine la trompait. Un FACT 03 scellé avec le panel d'analytes
   alors en usage aurait engagé publiquement vis-à-vis de ce panel —
   mais n'aurait rien fait pour détecter l'adultérant hors panel.
   La valeur du sceau dans ce cas aurait été l'ancrage forensique
   de « voici ce que le fabricant prétendait tester », NON la
   prévention. Un régime véritable de sécurité alimentaire répond à
   ce risque par un échantillonnage régulateur inopiné assorti d'un
   criblage à large spectre (méthodes LC-MS non ciblées, par
   exemple), qui se situe en amont du sceau du fabricant.

7. **Ancrer la distribution post-libération et la manipulation par
   le consommateur.** Une fois le lot sorti de l'établissement, les
   écarts de température durant la distribution, la mauvaise
   manipulation au détail, les défaillances de stockage chez le
   consommateur et les erreurs de préparation par le consommateur
   sont tous hors périmètre. Le sceau est circonscrit à l'événement
   de libération chez le fabricant. La détection d'altération en
   aval requiert des trousses distinctes au niveau du distributeur,
   du détaillant et (pour les consommateurs institutionnels comme
   les écoles et les hôpitaux) du point d'usage.

8. **Garantir la sécurité de l'aliment pour une population
   spécifique.** Un résultat PASS au FACT 03 n'implique pas la
   sécurité pour les consommatrices enceintes, les nourrissons, les
   consommateurs immunodéprimés ou les personnes âgées, chez qui
   Listeria monocytogenes et Salmonella présentent un risque
   documenté et accru, même à des concentrations inférieures aux
   limites de détection conventionnelles. Le sceau ne peut formuler
   d'affirmation de sécurité spécifique à une population et refuse
   de le faire (règle de refus R6).

**La section de limites honnêtes ci-dessus est la partie portante de
cette trousse.** Les fabricants qui considèrent « nous avons scellé
notre dossier de libération » comme équivalent à « nous avons prouvé
que notre aliment est sûr » détournent la primitive. La trousse doit
le dire clairement : *il s'agit d'une primitive de non-répudiation
pour les affirmations contemporaines du fabricant à la libération,
non d'une preuve de sécurité, non d'un substitut à la surveillance
réglementaire et non d'une défense contre les modes de défaillance —
contamination hétérogène, fraude de chaîne d'approvisionnement, ou
mauvaise manipulation post-libération — qui ont tué des personnes
lors de précédentes épidémies.*

---

## Ce que cette trousse DOIT REFUSER de sceller

La trousse est configurée pour rejeter les schémas factuels suivants
même si un utilisateur disposant de l'autorité de signature
manufacturière valide les soumet :

- **Identification personnelle d'un quelconque travailleur,
  superviseur, membre de l'assurance qualité, inspecteur en visite
  ou auditeur tiers.** Noms, identifiants d'employés, numéros de
  badge, numéros de sécurité sociale, adresses personnelles,
  numéros de téléphone personnels — aucun de ces éléments
  n'apparaît dans le sceau public. Les rôles sont publics ; les
  liaisons personne-à-rôle sont scellées séparément et accessibles
  par voie réglementaire. La sécurité des travailleurs contre les
  représailles et le harcèlement est la contrainte portante ;
  l'attestation de sécurité alimentaire peut s'effectuer au niveau
  du rôle. (R1)

- **Localisation précise de l'établissement.** La région de
  l'établissement (État ou région pluri-États) est acceptable ;
  l'adresse précise, les coordonnées GPS ou tout identifiant d'une
  granularité suffisante pour localiser physiquement l'usine sur
  une carte ne le sont PAS. Le numéro d'enregistrement réglementaire
  est l'identifiant du régulateur pour l'établissement ; des
  considérations de sécurité physique et de sécurité des
  travailleurs s'opposent à la publication d'une adresse publique
  sur Bitcoin. (R2)

- **Schémas individuels de personnel et d'équipes de production.**
  Plannings d'équipes, rotations individuelles, identifiants
  personnels d'opérateurs de ligne — aucun de ces éléments
  n'apparaît dans le sceau. Le mode de vie individuel d'un
  travailleur ne doit pas pouvoir se déduire de l'attestation
  publique. (R3)

- **Identités de fournisseurs compromettant des contrats.** Les
  noms de fournisseurs, les emplacements de leurs installations,
  les codes de lot fournisseur (sauf dans le cas de contamination
  d'origine fournisseur où la dénomination d'un lot fournisseur
  contaminé est requise pour la santé publique, et qui est gérée
  par une publication scellée distincte) ne sont PAS publiés dans
  le sceau de libération. De nombreux contrats d'approvisionnement
  contiennent des clauses de confidentialité ; le sceau ne les
  enfreint pas par défaut. (R4)

- **Listes de clients et destinations de distribution au-delà du
  niveau agrégé.** Un résumé régional de haut niveau est
  acceptable ; les listes de clients spécifiques (détaillants,
  centres de distribution, comptes de restauration) ne le sont PAS.
  L'identité du client est contractuellement confidentielle et
  concurrentiellement sensible ; le régulateur obtient la liste des
  clients via les canaux établis de coordination de rappel. (R5)

- **Affirmations de sécurité ou conclusions juridiques.** La
  trousse ne scellera ni « ce produit est sûr », ni « ce lot
  satisfait à toutes les normes applicables de sécurité
  alimentaire », ni « ceci est GRAS pour cet usage », ni aucune
  autre conclusion de sécurité ou juridique. La trousse ancre le
  dossier d'essais et la décision de libération, NON une conclusion
  de sécurité. (R6)

- **Schémas de ré-identification de plaintes de travailleurs ou de
  lanceurs d'alerte.** La trousse refuse de publier tout schéma
  susceptible de ré-identifier un travailleur ayant déposé une
  plainte OSHA, USDA ou interne à l'entreprise au sujet de
  pratiques de sécurité alimentaire ou de sécurité au travail. Ces
  plaignants sont protégés au titre de l'article 402 du FSMA et de
  lois parallèles ; le sceau ne doit pas devenir un vecteur de
  ré-identification. Les attestations de lanceurs d'alerte
  disposent de leur propre trousse (`examples/whistleblower-manifest`)
  dont les règles de refus sont ajustées à ce cas d'usage. (R7)

- **Scellage par toute partie autre que le mandataire autorisé du
  fabricant libérant le lot.** Un certificateur tiers, une équipe
  qualité client ou un auditeur indépendant peut utiliser la même
  trousse pour sceller SES PROPRES conclusions d'audit ; il ne peut
  PAS sceller la décision originelle de libération sous le nom du
  fabricant. Le mandataire signataire indiqué au FACT 08 est le
  seul signataire valable pour cela. (R8)

Un refus peut lui-même être scellé en tant que fait (« Ce fabricant
a demandé le scellage de X ; la trousse a refusé en vertu de la
règle de refus Y »), créant un dossier public de toute tentative
d'usage abusif.

---

## Ce que cette trousse SCELLE

8 faits au moment de la libération :

1. **Avis d'exemple** — déclare que la publication est un exemple
   (les attestations réelles suppriment ou remplacent cette mention).
2. **Identification du produit et du lot** — nom du produit,
   catégorie, fabricant, région de l'établissement (NON la
   localisation précise), version + empreinte du plan HACCP,
   identifiant de lot, dates de production / d'emballage / de
   péremption, nombre d'unités consommateur, conditions de stockage,
   les trois points critiques pour la maîtrise avec empreintes des
   relevés (létalité de cuisson, stabilisation par refroidissement,
   environnement post-létalité RTE).
3. **Résultats des tests de libération** — tests microbiologiques
   sur produit fini (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), tests chimiques / résidus (nitrites,
   résidus vétérinaires, métaux lourds), vérification de
   contamination croisée allergénique, résumé de la surveillance
   environnementale, chacun accompagné du SHA-256 du PDF de rapport
   complet et de la contrainte explicite d'interprétation
   échantillon-vs-vrac.
4. **Méthodologie et qualification du laboratoire** — quelle méthode
   (et quelle version du document de méthode) a été utilisée par
   ligne, quels laboratoires ont exécuté quels tests, le statut
   d'accréditation ISO/CEI 17025:2017 de chaque laboratoire et
   l'empreinte de son certificat, les résultats récents d'essais
   d'aptitude, la déclaration d'indépendance, le relevé de
   déviations / retests / OOS pour ce lot.
5. **Décision de libération** — date de libération, autorité de
   libération au niveau du rôle + contresignature, résumé du
   dossier soutenant la décision, destinations de distribution de
   haut niveau, obligations post-libération reconnues à la
   libération, engagement de calendrier et d'irréversibilité.
6. **Engagements de rappel et de surveillance post-marché** —
   l'analogue alimentaire de la pharmacovigilance : transparence
   du signal de maladie, engagements d'exécution de rappel (seuils
   24 h / 72 h / 98 %), réaction à une contamination de chaîne
   d'approvisionnement, engagement de non-retest silencieux,
   engagement d'absence de modification post-hoc des spécifications,
   partage des signaux de sécurité agrégés.
7. **Divulgations associées et registre des refus** — empreinte du
   journal d'enquête sur les actions correctives, historique récent
   d'inspections, historique des rappels, problèmes ouverts connus
   relatifs aux méthodes de tests utilisées, liaison rôle-à-individu
   (scellée séparément, hachée ici), préparation à la traçabilité
   fournisseur, liste explicite des règles de refus R1-R8 avec les
   éventuels refus exercés au cours de cette libération.
8. **Mandataire signataire** — fabricant + signataire au niveau du
   rôle (directeur de l'assurance qualité) + contre-signataire au
   niveau du rôle (directeur d'usine) + informations
   cryptographiques de clé ; justification de la publication au
   niveau du rôle.

Chaque fait se termine par la convention de portée du refus :
*« Ce fait n'affirme que X. Il n'affirme pas Y »* (où Y est le mode
de défaillance le plus proche de la section « NE fait PAS »
ci-dessus).

---

## Contre quoi cette trousse se défend

- **Modification rétroactive silencieuse des résultats des tests de
  libération.** Tous les PDF de rapports d'essais sont hachés. Un
  nouveau hachage post-libération révèle toute modification.
- **Différends sur les méthodes, versions de documents de méthode et
  laboratoires utilisés.** Le FACT 04 fige la méthodologie et le
  statut d'accréditation des laboratoires à la libération. Les
  affirmations ultérieures du type « nous avons en réalité utilisé
  MLG 4.13 et non 4.12 » deviennent publiquement réfutables.
- **Re-spécification rétroactive d'un lot hors spécifications.** Si
  un résultat de test de libération était en réalité un PASS limite
  reclassé en FAIL après la libération, les empreintes scellées des
  rapports prouvent ce qu'énonçait le PDF de résultat originel.
  Symétriquement, un OOS limite silencieusement retesté en PASS sans
  divulgation devient détectable si l'engagement de non-retest
  silencieux du FACT 06 est ultérieurement comparé à un amendement
  non scellé.
- **Réduction silencieuse de l'étendue d'un rappel.** Les engagements
  de rappel du FACT 06 (notification 24 h, lancement 72 h,
  récupérabilité de 98 %) sont scellés ; tout manquement à les
  honorer est publiquement observable.
- **Reconstruction a posteriori de l'historique des actions
  correctives.** L'empreinte du journal d'actions correctives du
  FACT 07 fige ce que l'entreprise a DÉCLARÉ avoir fait après la
  présumée non-conformité du programme de surveillance
  environnementale ; les affirmations ultérieures du type « nous en
  avons fait plus / moins que cela » deviennent publiquement
  réfutables.
- **Omission sélective des divulgations associées.** Le FACT 07
  énumère les catégories de divulgation attendues (historique
  d'inspections, historique de rappels, examen des avis sur
  méthodes, préparation à la traçabilité) ; une catégorie vide doit
  être explicitement attestée (« aucun à la date de libération »),
  de sorte qu'un « nous ne pensions pas que c'était pertinent »
  ultérieur soit publiquement réfutable.
- **Substitution du statut d'accréditation d'un autre laboratoire.**
  Le FACT 04 fige la portée ISO 17025 et l'empreinte du certificat
  de chaque laboratoire à la libération ; toute substitution
  ultérieure par un laboratoire non accrédité devient publiquement
  détectable.

La trousse **ne** défend **pas** contre la corruption contemporaine
— une équipe qui scelle intentionnellement de faux résultats de
tests au moment de la libération produit un sceau cryptographiquement
valide de faux résultats. La primitive est honnête sur ce point :
elle est une primitive de non-répudiation pour les affirmations
contemporaines du fabricant, non une preuve que ces affirmations
sont correctes.

---

## Précédents historiques de mortalité

La trousse aurait produit une ancre utile — *non une résolution* —
dans les défaillances passées de sécurité alimentaire. Pour éviter
de diffamer des individus (la plupart des défaillances de sécurité
alimentaire sont d'origine corporate, non individuelle ; certaines
font l'objet de poursuites pénales et d'autres non), ces références
décrivent l'épidémie par année et pathogène, et ne nomment l'entité
impliquée que lorsque la contamination a été publiquement attribuée
par avis de rappel ou par décision de justice.

- **Adultération à la mélamine du lait et des préparations pour
  nourrissons en Chine en 2008 (Sanlu Group et autres).** Au moins
  six décès de nourrissons et environ 300 000 cas de maladie
  attribuables à des produits laitiers dopés à la mélamine,
  conçus pour gonfler frauduleusement la teneur apparente en
  protéines lors d'analyses fondées sur l'azote Kjeldahl. Des
  condamnations ont suivi devant les tribunaux de la RPC, y
  compris des peines capitales. *Le sceau n'aurait pas prévenu
  cet événement* — la mélamine ne figurait pas au panel d'analytes
  standard. Le sceau aurait engagé publiquement vis-à-vis du panel
  EN PLACE à l'époque, rendant forensiquement claire la portée de
  l'extension post-incident du criblage de routine.

- **Épidémie européenne de STEC O104:H4 en 2011 (germes de fenugrec
  remontés à une ferme allemande).** 53 décès, environ 3 950 cas
  de maladie dans plusieurs pays européens ; remontée finalement
  à des graines de fenugrec importées d'Égypte et germées chez un
  producteur allemand. La traçabilité a été entravée par une
  documentation au niveau du lot inégale tout au long de la chaîne
  d'approvisionnement multinationale. *Le sceau n'aurait pas
  prévenu la contamination du lot de graines* (la contamination
  était en amont des tests du germeur) ; il aurait ancré ce que
  les tests de libération du germeur affirmaient et, s'il avait
  été utilisé au niveau de l'importateur de graines, ce que la
  manipulation des graines importées affirmait, accélérant la
  traçabilité.

- **Épidémie à Listeria monocytogenes chez Blue Bell Creameries
  en 2015 (États-Unis).** 3 décès, 10 cas de maladie dans
  plusieurs États ; ayant conduit à un rappel national et à une
  condamnation pénale fédérale en 2020 de Blue Bell pour
  infractions mineures à la sécurité alimentaire, l'entreprise
  ayant conclu un accord de poursuite différée et versé 19,35
  millions de dollars. Des contentieux civils s'en sont suivis.
  *Le sceau n'aurait pas prévenu* la contamination environnementale
  à Listeria au sein de l'usine ; il aurait forensiquement ancré
  les dossiers du programme de surveillance environnementale,
  permettant que toute question post-incident sur « ce que le
  programme de surveillance environnementale a montré dans les
  mois précédant l'épidémie » trouve réponse face à un dossier
  horodaté et révélateur d'altération, plutôt que face à des
  documents produits ultérieurement.

- **Épidémies multi-États de STEC O157:H7 liées à la laitue
  romaine en 2018 (région de culture de Yuma, puis région de
  culture de Salinas).** Au moins 5 décès et environ 210 cas de
  maladie sur plusieurs épidémies cette année-là. La traçabilité
  a été compliquée par des produits ensachés de sources mêlées.
  *Le sceau n'aurait pas prévenu* la contamination au niveau du
  champ ou de l'eau d'irrigation (en amont du fabricant) ; il
  aurait forensiquement ancré le dossier de tests d'entrée et de
  libération de chaque transformateur, rendant la traçabilité
  plus rapide et le dossier public plus défendable
  cryptographiquement face à des contestations ultérieures.

- **Épidémie à Salmonella Typhimurium de la Peanut Corporation of
  America (2008-2009, États-Unis).** 9 décès, environ 714 cas de
  maladie ; ayant abouti en 2014-2015 à des condamnations pénales
  fédérales de dirigeants de PCA, dont une peine de 28 ans de
  prison pour le PDG pour conspiration et obstruction. *Le sceau
  n'aurait pas prévenu* la contamination, la sous-investigation
  des tests positifs à Salmonella dans l'usine ni la décision au
  niveau exécutif d'expédier le produit malgré ces résultats
  positifs. Il AURAIT rendu forensiquement clair, lors du procès,
  ce que les résultats des tests INDIQUAIENT au moment de leur
  génération — ancrant considérablement la thèse de l'accusation
  contre des courriers électroniques contemporains à narratif
  faux, à l'abri de modifications documentaires.

Dans chacun de ces cas, la trousse aurait fourni une chronologie
forensique plus nette. Dans aucun de ces cas la trousse n'aurait à
elle seule prévenu les décès. Le sceau est une infrastructure
forensique, non une infrastructure de prévention. Cette distinction
est l'honnêteté de la trousse.

---

## Quand utiliser cette trousse

- Votre opération de fabrication dispose d'un programme HACCP /
  Contrôles préventifs stable et souhaite ajouter une attestation
  publique ancrée sur Bitcoin comme couche révélatrice d'altération
  par-dessus le flux de documentation de libération existant.
- Vous êtes un fabricant de petite ou moyenne taille, ou un
  fabricant dans une juridiction à infrastructure réglementaire
  plus faible, souhaitant ancrer les dossiers de lots dans une
  chronologie vérifiable globalement — pour la confiance sur le
  marché à l'export, pour la réponse aux audits clients, ou pour
  la participation à des initiatives volontaires de transparence.
- Vous êtes un inspecteur de sécurité alimentaire ou un
  certificateur tiers, et souhaitez publier au moment de la
  signature un sceau de conclusion d'audit révélateur d'altération,
  de sorte que les conclusions d'audit ne puissent ensuite être
  silencieusement modifiées par accord entre le fabricant et le
  certificateur.
- Vous anticipez que ce lot fera l'objet d'un examen aval
  significatif (marché d'exportation, catégorie à haut risque
  telle que viande RTE ou préparation pour nourrissons, ingrédient
  inédit, historique récent de rappel).
- Vous pouvez publier l'ensemble de faits listé sans enfreindre les
  règles de refus R1-R8. Si vos faits exigeaient un manquement à
  R1-R8, n'utilisez pas la trousse ; corrigez d'abord les données
  en entrée.
- Le conseil juridique du fabricant a examiné le plan de
  publication. La publication publique d'un artefact portant un
  identifiant de lot a des implications en matière de
  responsabilité du fait des produits ; un examen juridique n'est
  pas optionnel.

## Quand NE PAS utiliser cette trousse

- **N'utilisez pas comme substitut aux dossiers réglementaires
  FSMA / FSIS / UE.** Le sceau est *additif*, non substitutif. Vos
  dossiers statutaires de libération, votre plan HACCP, vos
  journaux de CCP et votre plan de rappel restent inchangés.
- **N'utilisez pas comme affirmation de sécurité.** Le scellage
  d'un dossier de libération conforme n'établit pas que le produit
  est sûr ; il établit que le dossier comportait ce contenu en
  octets à ce moment précis. La règle de refus R6 rejettera toute
  conclusion de sécurité.
- **N'utilisez pas pour publier des identités de fournisseurs, des
  listes de clients, des noms de travailleurs ou des adresses
  d'établissements.** Les règles de refus R1-R5 existent pour des
  raisons de sécurité humaine et contractuelle ; ne modifiez pas
  la trousse pour les contourner sans consulter un conseil
  juridique.
- **N'utilisez pas sous pression pour sceller avant la fin des
  tests de libération.** Un sceau partiel-données déforme l'état
  de la décision de libération.
- **N'utilisez pas comme théâtre de légitimité.** Le sceau d'un
  plan d'échantillonnage mal conçu ou d'un panel d'analytes mal
  choisi est un dossier public permanent de l'inadéquation, non
  une défense contre elle. La primitive coupe dans les deux sens ;
  c'est son honnêteté.
- **N'utilisez pas pendant une situation de rappel active en
  remplacement de la coordination de rappel du régulateur.** Une
  nouvelle publication MYRIAM ancrant l'étendue du rappel est
  appropriée APRÈS le lancement du rappel coordonné par le
  régulateur ; elle ne remplace pas le canal de rappel du
  régulateur.

## Comment forker cette trousse pour une libération réelle

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**TEMPORALITÉ CRITIQUE :** scellez au moment de la libération QA,
AVANT que le lot ne soit distribué (avant que le premier camion ne
quitte l'établissement). Un sceau postérieur au début de la
distribution conserve une valeur, mais n'ancre pas proprement
l'état pré-distribution. La bonne fenêtre se situe entre la
signature de libération QA et le premier mouvement de distribution.

**REVUE CRITIQUE :** avant le scellage, soumettez la publication à
un second relecteur QA (autre que le chef de file) et au conseil
juridique de l'entreprise. Une fois scellée, la publication est
permanente.

## Intégration avec l'infrastructure de sécurité alimentaire
existante

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  L'URL de la publication scellée ou le CID IPFS peut être
  référencé dans la documentation du Plan de sécurité alimentaire
  comme artefact d'attestation publique pour ce lot.
- **USDA FSIS plans HACCP et dossiers de libération.** Le dossier
  de libération scellé coexiste avec les dossiers HACCP exigés
  par le FSIS ; le sceau référence l'empreinte de la version du
  plan HACCP (FACT 02), de sorte que les différends ultérieurs
  sur la version du plan en vigueur soient publiquement
  réfutables.
- **Codex Alimentarius / principes HACCP** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Le sceau s'engage sur les sorties des sept
  principes HACCP (analyse des dangers, CCP, limites critiques,
  surveillance, actions correctives, vérification, tenue des
  dossiers) pour ce lot.
- **ISO 22000:2018 (Systèmes de management de la sécurité des
  denrées alimentaires).** Le sceau peut être référencé comme
  élément du dossier probant de la revue de direction ; il ne
  remplace pas la certification ISO 22000.
- **Schéma de certification FSSC 22000 v6.** Compatible en tant que
  couche additive de transparence ; l'auditeur FSSC peut vérifier
  le sceau lors de la surveillance.
- **Règlement (CE) 178/2002 de l'UE (Législation alimentaire
  générale) article 18 (traçabilité) et article 19 (notification
  de rappel).** Le sceau engage la préparation du fabricant à la
  traçabilité d'un cran amont (FACT 07) et ses engagements de
  rappel (FACT 06) ; il ne remplace pas l'obligation statutaire de
  notification au titre de l'article 19.
- **Paquet Hygiène de l'UE (Règlements 852/2004, 853/2004,
  854/2004, 882/2004).** Compatible ; le sceau référence
  l'équivalent des dossiers HACCP et d'auto-contrôles du Paquet
  Hygiène.
- **Schémas privés BRCGS / SQF.** Compatibles en tant que couche
  additive de transparence.
- **Systèmes de surveillance de santé publique (CDC PulseNet,
  FoodNet, IFSAC ; EFSA / ECDC de l'UE).** Hors du périmètre
  direct du sceau, mais le FACT 06 engage le fabricant à y
  participer et à sceller toute corrélation de signal sous forme
  de nouvelle publication MYRIAM.

## Ce que cette trousse ne remplace PAS

- L'enregistrement d'établissement alimentaire FDA ou
  l'approbation d'établissement USDA FSIS.
- Votre Plan écrit de sécurité alimentaire / Plan HACCP au titre du
  FSMA / FSIS.
- Les journaux de surveillance des CCP et les dossiers d'actions
  correctives.
- La surveillance de l'accréditation de laboratoire ISO 17025.
- Les programmes d'essais d'aptitude.
- L'inspection réglementaire (inspection continue FSIS, inspection
  périodique FDA, inspection par autorité compétente de l'UE).
- La surveillance de santé publique (CDC, EFSA, ECDC, équivalents
  nationaux).
- Les canaux de coordination de rappel (FDA Reportable Food
  Registry, coordination de rappel FSIS, RASFF de l'UE,
  équivalents nationaux).
- Les programmes de sécurité des travailleurs et de formation du
  personnel de l'alimentation.

## Pourquoi cette trousse existe en v0.4.0+

Il s'agit de l'un des exemples étoffés livrés avec myriam-kit. Elle
suit la structure de README orientée contraintes validée par
l'auto-recherche documentée dans
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — la variante de prompt
orientée contraintes a obtenu le meilleur score sur une grille
pondérée à travers plusieurs domaines d'exemple, car l'attestation
de sécurité alimentaire est précisément le domaine où surestimer
ce que le sceau prouve est dangereux : des personnes sont mortes,
mourront, dans des défaillances que le sceau ne peut prévenir. Les
sections d'ouverture sont les parties portantes de la trousse ; le
contenu du manifeste en est la partie facile.

Les valeurs par défaut de la trousse sont délibérément
conservatrices sur la publication de noms de travailleurs,
conservatrices sur la précision de l'emplacement de
l'établissement, conservatrices sur l'identité des fournisseurs et
clients, et agressives sur la mise en garde « ceci n'établit pas la
sécurité ». La communauté de la sécurité alimentaire a un
historique documenté de langage de certification exagéré ; la
trousse adopte par défaut la position la moins susceptible d'être
lue comme une garantie de sécurité. Les fabricants dans des
juridictions où des exigences spécifiques de divulgation publique
diffèrent peuvent amender leur fork en conséquence, mais les refus
par défaut favorisent la sécurité des travailleurs et l'honnêteté
du périmètre.

## Licence

Domaine public (CC0). Forkez. Aucune attribution requise.
