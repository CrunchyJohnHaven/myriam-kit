*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse de scellement d'attestation de dépense publique

Un exemple myriam-kit clés en main pour les gouvernements municipaux,
étatiques, provinciaux et nationaux qui souhaitent ancrer
cryptographiquement les enregistrements d'exécution budgétaire
(adjudications de marchés, décaissements, réceptions de livrables) au
moment de leur émission, de sorte que la modification rétroactive
silencieuse des enregistrements de dépense publique devienne
publiquement détectable.

Le sceau est un **ancrage forensique**, et non une certification
d'intégrité. Il consigne ce que l'autorité financière a déclaré le
jour où elle l'a déclaré, sous une forme qui ne peut pas être révisée
silencieusement par la suite sans produire une divergence
cryptographique publiquement visible.

---

## Ce que cette trousse NE FAIT PAS (à lire en premier)

Le sceau est un horodatage cryptographique de ce qui a été attesté. Il
ne peut pas vérifier si ce qui a été attesté était **licite, équitable
ou honnête**. Les modes d'échec suivants sont **hors du domaine du
sceau** :

1. **Corruption et rétrocommissions en amont.** Si un marché a été
   truqué, si un fournisseur a été sélectionné en raison d'un
   pot-de-vin, si une justification de source unique a été fabriquée,
   ou si un marché a été gonflé d'un pourcentage de rétrocommission
   convenu — le sceau ancre la transaction telle qu'enregistrée, avec
   le prix gonflé et le fournisseur favorisé, avec une haute
   intégrité. Le sceau observe la sortie du système financier ; il
   n'a aucune visibilité sur la corruption en amont de l'émission.
   L'*Operação Lava Jato* brésilienne a documenté des
   rétrocommissions systématiques d'environ 3 % administrées par un
   cartel sur des milliers de marchés Petrobras qui auraient été
   scellés à l'émission comme s'ils étaient parfaitement routiniers.

2. **Dissimulation de bénéficiaires effectifs par sociétés-écrans.**
   Un marché attribué à « Acme Construction Ltd. » est scellé avec le
   nom de l'entité tel qu'inscrit au registre public. Si « Acme » est
   en réalité contrôlée par une personne politiquement exposée non
   déclarée, ou est l'une de dizaines de sociétés-écrans contrôlées
   par un cartel unique, le sceau ancre l'entité de surface. La
   transparence des bénéficiaires effectifs est un régime SÉPARÉ
   (Recommandation 24 du GAFI, 5AMLD/6AMLD de l'UE, Corporate
   Transparency Act des États-Unis) dont la sortie nécessite son
   propre protocole de scellement.

3. **Fraude comptable en amont de l'émission.** Si l'autorité
   financière fabrique elle-même l'enregistrement avant qu'il ne soit
   scellé — marchés fantômes, employés fantômes sur la paie,
   réceptions de livrables fictives — le sceau ancre la fabrication.
   Le sceau ne peut pas détecter que l'enregistrement est faux au
   moment où il est enregistré ; il peut seulement détecter que
   l'enregistrement a été modifié APRÈS scellement.

4. **Publication sélective / « cherry-picking ».** Une autorité
   financière pourrait publier un *sous-ensemble* de transactions —
   les propres — et ne sceller que celles-ci. Le sceau ancre ce qui
   se trouve dans la publication ; il n'ancre pas l'univers des
   transactions qui auraient dû figurer dans la publication. Le
   FAIT 07 de cette trousse (divulgations compagnes et registre des
   refus) en est la défense structurelle, mais cela suppose que
   l'autorité émettrice soit honnête quant à ce qu'elle choisit de ne
   pas sceller.

5. **Dépenses hors-budget ou extrabudgétaires.** Les dépenses
   publiques acheminées par des entreprises publiques, des fonds
   souverains, des véhicules ad hoc ou des comptes fiduciaires
   extrabudgétaires peuvent ne pas figurer dans le budget que le
   sceau ancre. Le sceau consigne ce qui a été déclaré à l'intérieur
   du système budgétaire ; les dépenses hors du système sont hors du
   domaine du sceau. Les contentieux relatifs à la Coalition
   Provisional Authority (CPA) en Irak en 2003–2004 ont porté sur
   environ 9 milliards de USD de décaissements en espèces dont les
   registres ont été partiellement perdus ; sceller les registres qui
   existaient au moment du décaissement les aurait ancrés, mais
   n'aurait pas créé d'enregistrements que la CPA n'a pas tenus.

6. **Pression d'« explication » post-émission.** Un dépassement
   scellé, une attribution de gré à gré scellée ou un avenant scellé
   peut être renarré ultérieurement avec n'importe quel cadrage que
   le pouvoir politique souhaite. Le sceau ancre les FAITS à la date
   d'émission, mais ne préjuge pas du récit que ces faits viendront
   plus tard étayer.

7. **Attestation sous contrainte.** Si le mandant financier
   responsable est contraint de signer une attestation qui
   travestit les transactions, le sceau ancre l'attestation
   contrainte avec la signature contrainte. Le sceau vérifie QUI a
   signé (FAIT 08), non POURQUOI il a signé. Sceller une attestation
   sous contrainte produit un registre public permanent du produit
   contraint — utile pour la responsabilité ultérieure, mais non une
   défense contre la contrainte sur le moment.

8. **Comparaison entre juridictions.** Une dépense scellée n'est
   lisible que face au régime juridique de sa juridiction émettrice.
   « Pourquoi la Commune X a-t-elle payé Y pour le service Z quand
   la Commune W n'a payé que V ? » est une question d'analyse
   comparative en aval du scellement. L'étalonnage
   inter-juridictionnel est une tâche d'analyse sur les données
   scellées, et non une propriété du sceau.

**La section des limites honnêtes ci-dessus est la partie porteuse de
cette trousse.** Les responsables financiers et les responsables
politiques qui croient que sceller équivaut à intégrité l'utiliseront
comme bouclier. La trousse doit le dire clairement : il s'agit d'une
*primitive de non-répudiation pour le moment d'émission*, et non
d'une preuve de l'intégrité de la dépense.

---

## Ce que cette trousse DOIT REFUSER de sceller

La trousse est configurée pour rejeter les motifs factuels suivants,
même si un utilisateur disposant d'une autorité de signature valide
les soumet :

- **Noms individuels d'agents publics en deçà du niveau de
  signataire principal.** Aucun fait ne peut nommer le personnel
  individuel des bureaux de marchés, les agents individuels de la
  trésorerie, les membres individuels des comités d'évaluation, ni
  aucune personne physique n'exerçant pas un rôle public de
  reddition de comptes. Le risque de représailles encouru par le
  personnel d'exécution excède le bénéfice de transparence ; leur
  identité est scellée dans les contrôles internes (hash du FAIT 05
  du journal d'approbations), non dans le corps de l'attestation.

- **PII de fournisseur.** Aucun fait ne peut inclure de numéros de
  comptes bancaires de fournisseurs, de noms d'employés individuels
  de fournisseurs, d'adresses du domicile de fournisseurs,
  d'identifiants fiscaux de personnes physiques liées au
  fournisseur, de détails internes de prix qui contiendraient la
  structure de coûts du fournisseur, ni aucun autre champ de PII
  commerciale dont la publication nuirait aux intérêts du
  fournisseur sans servir la lutte anti-corruption. De telles
  informations peuvent être HACHÉES (FAIT 05) mais non publiées.

- **Dépenses classifiées de sécurité.** Les dépenses classifiées au
  titre de statuts de sécurité nationale NE SONT PAS éligibles au
  scellement dans le cadre de cette trousse. Le traitement de
  l'information classifiée est un problème distinct, avec des
  exigences cryptographiques et juridiques distinctes. L'exclusion
  elle-même est divulguée au FAIT 07 R3, afin que le lecteur sache
  que la publication est partielle par conception.

- **Exécution civile d'obligations fiscales contre des personnes
  physiques identifiées.** Bien que les coûts d'exécution soient
  une dépense publique, nommer des contribuables individuels en
  cours d'exécution est refusé : le préjudice à la vie privée
  excède le bénéfice de transparence, et une transparence parallèle
  existe au titre du rapportage de la juridiction fiscale.

- **Transactions pré-émission.** Aucun marché avant attribution
  formelle ; aucun décaissement avant émission formelle. Sceller un
  projet de marché ou un paiement en attente comme s'il était
  exécuté crée une fausse certitude.

- **Scellement par toute personne autre que le mandant financier
  responsable.** Un titulaire, un fournisseur, un conseiller
  municipal, un journaliste ou un observateur ne peut pas sceller
  « le registre de la dépense publique » à la place de l'autorité
  financière qui l'a émis. (Ils peuvent sceller leurs propres
  observations sous leur propre mandant, dans une publication
  séparée.)

- **Formulations de type « exempt de corruption ».** La trousse
  refuse de sceller toute formulation de la forme « cette dépense
  était licite et exempte de corruption » ou « le marché était
  manifestement équitable ». De telles affirmations sont
  épistémiquement hors du domaine de la trousse.

- **Publications qui omettent les divulgations compagnes du
  FAIT 07.** Une publication de transactions sans le registre
  accompagnateur de divulgation et de refus n'est pas une
  publication MYRIAM légitime dans le cadre de cette trousse.

Un refus lui-même peut être scellé comme fait (« Cette partie a
demandé le scellement de X ; la trousse a refusé en vertu de la règle
de refus Y »), créant un registre public d'une tentative d'usage
abusif. Dans un domaine où la pression politique sur les responsables
financiers est documentée, un registre des demandes *refusées* est en
lui-même un signal d'intégrité.

---

## Ce que cette trousse SCELLE bien

8 faits au moment de l'attestation de l'exécution budgétaire :

1. **Avis d'exemple** — déclare que la publication est un exemple
   (les attestations réelles suppriment ou remplacent cet avis).
2. **Juridiction et base légale** — quelle entité gouvernementale
   émet, en vertu de quelle autorité statutaire, sur quel exercice
   budgétaire.
3. **Référence d'autorisation budgétaire ou de ligne de budget** —
   les lignes spécifiques du budget adopté qui sont exécutées, avec
   les hachages de l'instrument budgétaire et de tous les
   amendements / virements / réaffectations appliqués.
4. **Manifeste des marchés ou décaissements** — enregistrement par
   transaction : montant, nom de l'entité légale du fournisseur
   (sans PII individuelle), objet, date, type de marché, base
   d'attribution, hachage du document contractuel.
5. **Hachages des documents justificatifs** — SHA-256 des
   sollicitations, évaluations, marchés exécutés, avenants,
   demandes de paiement, formulaires de réception de livrables,
   écritures du grand livre de la trésorerie, journaux
   d'approbation des contrôles. Hachages seulement, et non
   contenus — afin de protéger les PII commerciales et personnelles
   tout en permettant la vérification par re-hachage.
6. **État d'audit et de surveillance** — quel organe d'inspecteur
   général a juridiction, quelle institution supérieure de
   contrôle, quel organe procuratorial est compétent pour les
   infractions de corruption, échéances d'audit, état actuel de
   toute revue en cours.
7. **Divulgations compagnes et registre des refus** — recours en
   passation pendants, enquêtes internes pendantes, demandes
   d'accès à l'information en suspens, revues dissidentes,
   dépassements connus de lignes budgétaires ; liste explicite des
   motifs que la trousse a refusé de sceller.
8. **Mandant signataire** — agent financier responsable + rôle +
   responsabilité statutaire + co-signataires sous contrôle dual ;
   ce que chaque signataire atteste personnellement et ce qu'il
   n'atteste pas.

Chaque fait se termine par la convention du verrou de refus : *« Ce
fait n'affirme que X. Il n'affirme pas Y »* (où Y est le mode d'échec
le plus proche de la section « NE FAIT PAS » ci-dessus).

---

## Contre quoi cette trousse défend

- **Révision silencieuse, post-émission, des montants contractuels.**
  Toute modification d'un montant quelconque au FAIT 04 produit un
  SHA-256 différent, une racine de Merkle différente, et échoue à la
  vérification OTS.
- **Substitution silencieuse de fournisseur.** Le remplacement du
  « Fournisseur A » par le « Fournisseur B » sur un marché déjà émis
  est détectable à partir des octets scellés.
- **Antédatation d'avenants.** Le FAIT 04 fige la date et la
  justification de l'avenant à l'émission ; toute affirmation
  ultérieure selon laquelle « ceci a toujours été le périmètre
  convenu » doit composer avec l'enregistrement scellé de l'avenant.
- **Disparition silencieuse de transactions défavorables.** Toutes
  les transactions émises sur la période sont au FAIT 04 sous une
  unique racine de Merkle. Publier un sous-ensemble est détectable
  à partir de la liste des hachages de feuilles.
- **Suppression des divulgations compagnes.** Le FAIT 07 fige
  l'état des recours en passation pendants, des enquêtes pendantes
  et des demandes d'accès à l'information en suspens au moment de
  l'attestation. Toute affirmation ultérieure du type « nous n'avons
  jamais entendu parler de ce recours » est publiquement diffable.
- **Glissement de la juridiction d'audit.** Le FAIT 06 fige les
  organes qui ont juridiction de surveillance sur les transactions
  scellées. Une affirmation ultérieure selon laquelle tel
  inspecteur général « n'avait pas autorité » doit composer avec
  l'enregistrement scellé de juridiction.
- **Effacement du registre des refus.** Le FAIT 07 consigne ce que
  la trousse a refusé de sceller ; toute affirmation ultérieure du
  type « nous n'avons jamais rien refusé » contredit
  l'enregistrement scellé.

---

## Cas historiques dans lesquels la trousse aurait aidé

La trousse aurait produit un **ancrage forensique** utile — *non un
correctif, non une prévention, non un substitut à des poursuites
pénales* — dans des affaires du registre public documenté impliquant
une modification rétroactive silencieuse des enregistrements de
dépense publique :

- **Brésil — *Operação Lava Jato* / lignée Petrobras (2014–2021).**
  Les procureurs fédéraux brésiliens ont documenté un cartel des
  grandes entreprises de construction qui, pendant plus d'une
  décennie, a versé des rétrocommissions d'environ 3 % en moyenne
  sur des marchés Petrobras et d'autres marchés fédéraux
  d'infrastructure, la rétrocommission étant acheminée vers des
  politiciens et vers la coordination des prix du cartel lui-même.
  Les marchés tels qu'émis paraissaient routiniers ; la corruption
  était en amont de l'émission. Une trousse de scellement n'aurait
  PAS empêché Lava Jato (les rétrocommissions étaient intégrées au
  prix AVANT que le marché n'atteigne le sceau), mais aurait ancré
  les conditions du marché à l'émission — rendant la reconstruction
  forensique ultérieure de « ce que chaque marché disait réellement
  au moment de sa signature » énormément moins coûteuse. Le coût
  d'enquête de Lava Jato a été en grande partie le coût de
  reconstituer les chronologies à partir d'archives incohérentes.

- **Union européenne — contentieux relatifs aux fonds de
  développement régional (plusieurs États membres, années 2010 et
  2020).** Les rapports annuels de la Cour des comptes européenne
  ont identifié à plusieurs reprises des taux d'erreur matériels
  dans les dépenses des Fonds structurels et d'investissement
  européens (ESIF) et du Fonds de cohésion, dépassant certaines
  années le seuil de matérialité. Les contestations sur « ce qui a
  été effectivement réclamé » versus « ce qui a été effectivement
  livré » se répètent parce que la documentation des demandes peut
  être révisée entre la soumission et l'audit. Le scellement MYRIAM
  par émission de la demande-telle-que-soumise aurait ancré le
  contenu de chaque demande au moment de la soumission, en
  séparant « ce que le bénéficiaire a réclamé sur le moment » de
  « ce que la reconstruction post-audit a conclu ».

- **Irak — décaissements de la Coalition Provisional Authority
  (CPA), 2003–2004.** La CPA a décaissé environ 9 milliards de USD
  en espèces depuis le Development Fund for Iraq avec une
  documentation que le Special Inspector General for Iraq
  Reconstruction (SIGIR) et les rapports d'audit ultérieurs ont
  caractérisée comme substantiellement incomplète. Les
  contestations sur les enregistrements de décaissement persistent
  deux décennies plus tard. Sceller au moment du décaissement
  n'aurait pas créé d'enregistrements que la CPA n'a pas tenus —
  mais là où un enregistrement existait (livres tenus à la main,
  autorisations de transfert datées), un sceau contemporain aurait
  ancré l'état octet par octet de cet enregistrement au moment de
  son émission, séparant « l'enregistrement sur le moment » de
  « l'enregistrement tel que reconstruit ultérieurement ».

- **Grèce — révisions de la dette souveraine et du reporting des
  dépenses publiques (2009–2010).** Les audits d'Eurostat en
  2009–2010 ont documenté des révisions substantielles des données
  budgétaires grecques précédemment reportées, la méthodologie
  même de la révision étant contestée. Le scellement des rapports
  trimestriels de dépenses au moment de la publication originelle
  aurait rendu le *delta* entre les rapports originel et révisé
  publiquement diffable, plutôt que reconstructible seulement par
  comparaison d'archives. Le sceau n'aurait pas empêché la
  contestation méthodologique sous-jacente, mais aurait ancré
  chaque trimestre reporté au moment du rapport originel.

- **Royaume-Uni — marchés publics de la pandémie (2020–2022).**
  Les rapports du UK National Audit Office et des commissions
  parlementaires ont identifié des procédures de passation
  pendant 2020–2021 dans lesquelles des marchés ont été attribués
  au titre de dispositions d'urgence avec mise en concurrence
  réduite et documentation réduite ; certaines attributions ont
  été ultérieurement modifiées, annulées ou réglées. Le scellement
  par émission de chaque attribution de marché d'urgence aurait
  ancré la justification et les conditions de l'attribution au
  moment de l'attribution, faisant des modifications ultérieures
  un delta publiquement visible plutôt qu'un enregistrement
  silencieusement modifié.

- **Afrique du Sud — marchés d'entreprises publiques de l'ère de
  la capture de l'État (~2010–2018).** La Commission Zondo a
  documenté des marchés dans plusieurs entreprises publiques
  (Eskom, Transnet, Denel) dont la documentation était à divers
  degrés incomplète, révisée ou contestée. Le scellement de chaque
  attribution de marché à l'émission aurait ancré l'état
  tel-qu'attribué de l'enregistrement, séparant les sorties
  ultérieures de la reconstruction forensique de l'enregistrement
  contemporain.

La trousse n'aurait PAS empêché la corruption sous-jacente dans
aucun des cas ci-dessus. Dans plusieurs cas, le problème
sous-jacent était que la corruption était *en amont de l'émission* —
le sceau ancre le marché corrompu avec une haute intégrité, ce qui
est un type d'utilité différent (ancrage forensique pour la
responsabilité ultérieure) mais qui n'est pas la même chose que la
prévention. Dans d'autres cas (numéraire CPA, dépenses hors budget),
le problème sous-jacent était que les enregistrements à sceller
n'existaient pas ou n'étaient pas tenus — la trousse ne peut pas
créer d'enregistrements que l'autorité n'a pas produits.

Ces cas historiques ne sont nommés que par référence à des
constatations publiquement documentées (registres judiciaires,
rapports de commissions parlementaires, publications d'organes
d'audit). Aucune affirmation n'est formulée à l'encontre d'une
personne individuelle ; les constatations institutionnelles
documentées tiennent sur le registre public.

---

## Quand utiliser cette trousse

- Votre juridiction dispose d'un processus établi de reporting de
  l'exécution budgétaire et souhaite ajouter un ancrage public
  immuable.
- Vous anticipez un examen post-émission (demandes d'accès à
  l'information, audit, suivi de la société civile, enquête
  journalistique) et souhaitez un point de référence à
  inviolabilité détectable.
- Vous disposez de l'autorité légale, au titre de la législation
  de transparence / des registres ouverts, de publier l'ensemble
  de faits listé, dans le respect des exclusions de protection de
  la vie privée et de sécurité.
- Vous opérez dans le cadre d'un régime statutaire d'audit
  (inspecteur général, institution supérieure de contrôle) et
  souhaitez ancrer chaque clôture trimestrielle avant que le cycle
  d'audit ne l'atteigne.
- Vous publiez selon l'Open Contracting Data Standard ou IATI et
  souhaitez un complément cryptographique à la publication par
  portail.

## Quand NE PAS utiliser cette trousse

- **Ne l'utilisez pas comme substitut à l'audit statutaire, à la
  revue par inspecteur général, à l'enquête procuratoriale ou au
  suivi par la société civile.** La trousse est *additive*, et non
  un remplacement.
- **Ne l'utilisez pas comme certificat de légitimité.** Un
  enregistrement de dépense scellé n'est pas un certificat
  d'absence de corruption. Le traiter comme tel est précisément le
  mode d'échec que la structure d'abord-les-contraintes de la
  trousse existe pour empêcher.
- **Ne l'utilisez pas en milieu de période.** La trousse est
  destinée au moment de l'émission formelle (clôture
  trimestrielle, attribution de marché, décaissement par jalon).
  Les sceaux en milieu de période créent des points de référence
  trompeurs.
- **Ne l'utilisez pas pour affirmer que la dépense était licite,
  équitable ou exempte de corruption** — la trousse ne peut pas
  faire cela.
- **Ne l'utilisez pas pour sceller des dépenses classifiées, des
  PII individuelles d'employés ou des PII commerciales de
  fournisseurs.** La trousse refuse ces motifs ; tenter de le
  faire crée un registre de refus (FAIT 07).
- **Ne l'utilisez pas pour sceller des projets pré-émission.** Les
  projets peuvent être scellés sous un autre type d'attestation
  (« projet pour commentaires, non émis »), mais non sous le type
  d'émission de cette trousse.
- **Ne l'utilisez pas sous la pression d'omettre les divulgations
  du FAIT 07.** Refusez, et scellez le refus.
- **Ne l'utilisez pas si votre autorité financière est capturée.**
  Une dépense frauduleuse scellée est un registre public permanent
  de la fraude, et non une défense de celle-ci. La primitive coupe
  dans les deux sens ; telle est son honnêteté.

---

## Comment forker cette trousse pour une attestation réelle

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Timing critique :** scellez AU moment de l'émission formelle —
c'est-à-dire le moment où le mandant financier responsable signe la
clôture trimestrielle, le moment où un marché est formellement
attribué, ou le moment où un décaissement est formellement émis. Un
sceau antérieur à l'émission formelle crée une référence
faux-positive « ceci est l'enregistrement officiel ». Un sceau
longtemps postérieur à l'émission formelle est forensiquement plus
faible face aux modifications intermédiaires.

**Cadence :** la trousse est conçue par défaut pour des attestations
trimestrielles. Des cadences inférieures au trimestre (clôture
mensuelle, scellement par transaction) sont prises en charge en
ré-exécutant avec le périmètre approprié ; le scellement d'une
seule transaction de valeur élevée est un usage légitime.

---

## Intégration avec l'infrastructure existante de finances publiques

La trousse est conçue pour se composer avec, et non remplacer :

- **Open Contracting Data Standard (OCDS) v1.1.5.** Les cinq points
  de publication (planification, appel d'offres, attribution,
  marché, exécution) se mappent naturellement sur le FAIT 03
  (planification → autorisation budgétaire), le FAIT 04 (appel
  d'offres, attribution, marché, exécution → manifeste de
  transactions) et le FAIT 05 (hachages des documents
  justificatifs). L'export JSON OCDS lui-même est scellé au
  FAIT 05 (documents de contrôle). Une juridiction qui exécute la
  publication OCDS peut ajouter le scellement MYRIAM comme couche
  cryptographique au-dessus de son portail existant.

- **International Aid Transparency Initiative (IATI), standard
  v2.03.** Pour les dépenses financées en tout ou partie par de
  l'aide externe, le XML IATI peut être scellé comme document de
  contrôle ; le sceau fournit un complément cryptographique au
  modèle de publication HTTP du IATI Registry.

- **Engagements de l'Open Government Partnership (OGP).** Les
  Plans d'action nationaux de l'OGP incluent fréquemment des
  engagements de transparence budgétaire ; le scellement MYRIAM
  opérationnalise un engagement de « publication à inviolabilité
  détectable » d'une manière qui est indépendamment vérifiable par
  la société civile sans exiger de confiance dans le portail du
  gouvernement.

- **Recommandation de l'OCDE sur l'intégrité publique (2017).** La
  trousse soutient la Recommandation 4 (données ouvertes du
  gouvernement sur les finances publiques, sous forme lisible par
  machine et en temps utile) en rendant les données
  cryptographiquement ancrées aussi bien que lisibles par machine.

- **Convention des Nations Unies contre la Corruption (UNCAC), en
  particulier les Articles 9 (passation des marchés publics) et 13
  (participation de la société).** La trousse fournit une
  primitive forensique qui soutient les obligations de
  transparence de l'Article 9 et le contrôle par la société civile
  de l'Article 13.

- **Institutions supérieures de contrôle (ISC) — cadre INTOSAI.**
  Les ISC opérant selon les normes INTOSAI (ISSAI) peuvent
  consommer les publications scellées comme éléments probants à
  haute intégrité ; les hachages SHA-256 du FAIT 05 sont les mêmes
  hachages que les outils d'e-audit de l'ISC peuvent recalculer.

- **Bureaux d'inspecteurs généraux.** Les bureaux d'inspecteurs
  généraux nationaux ayant juridiction sur les dépenses scellées
  (FAIT 06) peuvent assigner les corps des documents dont les
  hachages sont scellés au FAIT 05 ; le sceau lie les corps de
  documents reçus sur assignation aux corps qui existaient à
  l'émission.

- **Lois sur l'accès à l'information et les registres ouverts.**
  Le sceau n'exempte pas l'autorité émettrice de ses obligations
  continues d'accès à l'information ; en fait, il rend une
  réponse sélective détectable comme une déviation par rapport à
  l'enregistrement scellé. Le FAIT 07 C3 ancre les demandes
  d'accès à l'information en suspens au moment de l'attestation.

- **Registres des bénéficiaires effectifs (Recommandation 24 du
  GAFI, directives AML de l'UE, Corporate Transparency Act des
  États-Unis).** Les données de bénéficiaires effectifs NE SONT
  PAS scellées dans le cadre de cette trousse (le FAIT 04 prend
  l'identité du fournisseur uniquement à partir du nom d'entité
  légale enregistré). La divulgation des bénéficiaires effectifs
  est un régime de scellement séparé qui peut produire une
  publication parallèle référencée par racine de Merkle.

- **Transparence administrée par les tribunaux (reporting des
  dépenses judiciaires, procédures de recouvrement d'actifs).**
  Les sorties des procédures judiciaires liées à la corruption
  ne relèvent pas du périmètre de cette trousse, mais peuvent
  être scellées sous des types d'attestation parallèles.

## Ce que cette trousse NE REMPLACE pas

- L'audit statutaire de l'exécution budgétaire par les organes
  d'inspecteur général
- La revue par l'institution supérieure de contrôle (GAO, NAO,
  TCU, CAG, AGN, BRH, Cour des comptes, équivalent)
- L'enquête procuratoriale des infractions de corruption
  (procureurs nationaux anti-corruption, organes de l'Article 36
  de la UNCAC)
- L'investigation menée par la société civile et le journalisme
- Les canaux de lanceurs d'alerte et les régimes de divulgation
  protégée
- La divulgation des bénéficiaires effectifs
- La revue par les pairs au plan international (OCDE, Évaluation
  de la transparence budgétaire du FMI, semestre européen, IATI
  Registry)
- Les procédures de recouvrement d'actifs administrées par les
  tribunaux

Le sceau est une primitive forensique qui abaisse le coût et
augmente la fiabilité de tout ce qui précède. Il n'est pas, et ne
peut pas être, un remplacement de l'un quelconque d'entre eux.

---

## Licence

Domaine public (CC0). Forkez-la. Aucune attribution requise.
