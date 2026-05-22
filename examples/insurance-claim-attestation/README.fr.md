*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Kit d'attestation de sinistres d'assurance

Un exemple myriam-kit clé en main pour les experts en sinistres
agréés aux États-Unis (auto, santé, IARD, vie, et branches
spécialisées) qui souhaitent publier un sceau ancré sur Bitcoin
et résistant à la falsification de *quelles preuves étaient au
dossier*, *comment la police était interprétée*, et *ce qui a
été approuvé ou refusé*, au moment d'une décision de couverture,
de sorte que la révision a posteriori du dossier par l'une ou
l'autre partie devient cryptographiquement détectable.

---

## Ce que ce kit NE FAIT PAS (à lire en premier)

Le sceau est un horodatage cryptographique de QUELLES PREUVES
étaient dans le dossier de sinistre au moment de la décision, ce
que l'assureur a lu que la police signifiait, et CE qui a été
approuvé ou refusé pour COMBIEN et sous QUELS CODES DE MOTIF. Il
ne peut répondre à aucune autre question sur le sinistre. Ce qui
suit est **hors du domaine du sceau** :

1. **Le sceau NE prouve PAS que le sinistre était légitime.** Si
   un demandeur a falsifié les preuves *avant* la soumission, le
   sceau ancre les preuves falsifiées avec la même intégrité qu'il
   ancrerait des preuves authentiques. La valeur du sceau commence
   au moment où la preuve entre dans le dossier de sinistre ; la
   fraude pré-soumission lui est invisible. Le sceau rend une
   chose spécifique plus difficile — l'altération post-soumission
   de l'une ou l'autre partie — pas toutes les formes de fraude
   d'assurance.

2. **Le sceau N'oblige PAS à couvrir ce qui n'était pas dans la
   police originale.** Le sceau enregistre la lecture
   contemporaine du contrat par l'assureur ; il ne lie aucun
   tribunal à cette lecture et il n'étend pas la couverture
   au-delà de ce que le contrat fournit réellement. Une
   approbation scellée de paiement sous une police qui en fait ne
   couvrait pas la perte est la décision volontaire de l'assureur
   de payer, non un agrandissement du contrat.

3. **Le sceau NE défend PAS contre un expert qui est lui-même
   capturé ou biaisé.** Un expert contraint ou capturé qui scelle
   une décision fausse produit un sceau cryptographiquement valide
   d'une décision fausse. Le sceau est honnête à ce sujet : c'est
   une primitive de non-répudiation pour la décision contemporaine
   de l'expert, non une preuve que la décision soit correcte.
   C'est le mode de défaillance "amplification-de-contrainte"
   commun à toutes les primitives d'attestation — un acteur de
   mauvaise foi avec autorité de signature produit des
   enregistrements durables de mauvaise foi. La structure de
   divulgation compagnonne dans FAIT 06 (structure d'incitation,
   sinistres antérieurs, examen du superviseur, historique de
   plaintes DOI) est conçue pour rendre les schémas
   d'expert-capturé plus visibles, mais elle n'élimine pas le
   mode de défaillance.

4. **Le sceau NE rend PAS l'assureur solvable pour l'obligation.**
   Une approbation scellée par un assureur insolvable reste une
   promesse non financée. La solvabilité de l'assureur est une
   matière prudentielle du DOI de l'État et une matière de
   protection de l'association de garantie de l'État ; le sceau
   ancre la décision mais non la capacité de l'assureur à la
   payer.

5. **Le sceau NE remplace PAS le processus de plaintes du DOI
   de l'État, la procédure d'appel de la police, ni le
   contentieux de mauvaise foi.** Les assurés et demandeurs
   tiers conservent tous les droits qu'ils avaient avant que le
   sceau soit généré. Le sceau est une preuve additive dans tout
   litige ultérieur, non un substitut aux mécanismes de
   résolution de litiges que la loi prévoit déjà.

6. **Le sceau N'établit PAS que la police était en vigueur à la
   date de la perte.** La couverture en vigueur est une analyse
   de prime-et-annulation, et une piste d'examen séparée de la
   piste d'interprétation-de-couverture enregistrée dans FAIT
   04. Une vraie attestation de sinistre devrait être appariée
   avec la détermination de statut-en-vigueur de l'assureur,
   scellée séparément ou référencée par hachage.

7. **Le sceau NE ré-identifie AUCUNE partie privée.** Le SSN
   du demandeur, DOB au-delà de ce qui est nécessaire pour
   vérifier l'identité de la police, adresse complète,
   diagnostics médicaux, spécificités de traitement, et noms de
   témoins non publics sont tous refusés par le kit. Voir les
   règles de refus R1, R2, R3 dans FAIT 07.

**La section des limites honnêtes ci-dessus est la partie
porteuse de charge de ce kit.** Les assureurs qui croient que
sceller équivaut à correction l'utiliseront comme bouclier
contre un examen légitime post-paiement. Les experts sous
pression pour refuser seront tentés de sceller des rejets
pré-enquête comme s'il s'agissait de décisions finales (refusés
par R4 / R8). Les demandeurs qui croient que sceller leur donne
droit à un paiement qu'ils ne sont pas dus en vertu du contrat
seront déçus. Le kit doit le dire clairement : *c'est une
primitive de non-répudiation pour le moment de la décision de
couverture de l'assureur, non une preuve que la décision est
correcte, le sinistre est légitime, ou l'assureur peut financer
l'obligation.*

---

## Ce que ce kit DOIT REFUSER de sceller

Le kit est configuré pour rejeter les schémas suivants même si
un expert agréé du dossier avec autorité de signature valide les
soumet (texte complet dans FAIT 07) :

- **SSN du demandeur, DOB complet, adresse de domicile
  complète, ou numéro de téléphone.** Le dossier de sinistre de
  l'assureur les lie ; le sceau public n'en a pas besoin et ne
  doit pas les porter. Le sceau public n'est pas un index de
  ré-identification.
- **Narratifs de diagnostic, spécificités de traitement, ou
  codes de procédure qui pourraient identifier des conditions
  rares ou stigmatisantes.** Même par hachage. Le sceau public
  ne porte que les résumés de codes de facturation CPT/HCPCS et
  les montants facturés ; les diagnostics ICD-10, détail de
  santé mentale, statut VIH, traitement d'usage de substances,
  détail de santé reproductive, et indicateurs de maladies
  rares ne sont JAMAIS dans le sceau public, même par hachage.
- **Noms légaux de témoins**, sauf si le témoin est déjà
  registre public (officier répondant, représentant d'agence
  publique). Les témoins sont référencés par identifiant
  (W-1, W-2, ...) et liés à des identités légales dans le
  dossier de sinistre de l'assureur sous découverte normale.
- **Sceller une décision d'enquête-partielle présentée comme
  finale.** Une "décision" qui est en réalité un paiement
  intérimaire, une réservation de couverture, ou un rejet
  pré-enquête présenté comme final est refusée. Le statut de
  disposition et la date de décision doivent étiqueter avec
  précision si c'est la décision finale.
- **Scellement par toute personne autre que l'expert agréé du
  dossier.** Seul l'expert agréé du dossier (ou le principal
  signataire approprié agréé d'un TPA / MGA délégué) peut
  signer le sceau sous le nom de l'assureur. Les assurés et
  demandeurs peuvent utiliser le même kit pour sceller leur
  propre analyse indépendante (une fonctionnalité, pas un
  bogue), mais non pour sceller la décision de l'assureur sous
  le nom de l'assureur.
- **Réclamations de finalité légale ou préclusion.** Le kit ne
  scellera pas un corps de fait qui prétend que la décision est
  "contraignante," "finale et non-appelable," "préclusive," ou
  toute conclusion légale similaire. La finalité légale est une
  fonction judiciaire.
- **Changements rétroactifs d'interprétation-de-couverture dans
  un prétendu sceau d'"amendement".** Les révisions à
  l'interprétation de couverture ou aux montants de paiement
  DOIVENT être scellées comme une NOUVELLE publication
  référençant ce sceau par racine de Merkle, jamais comme un
  re-sceau modifié sous les mêmes identifiants.
- **Sceaux de refus dont le code de motif équivaut à "enquête
  incomplète mais refusant pour des raisons procédurales".** Un
  sceau de refus doit reposer sur des codes de motif
  substantiels liés à des dispositions spécifiques de la police
  (FAIT 04) et des preuves spécifiques (FAIT 03).
- **Clauses de non-divulgation opérant contre le demandeur à
  l'intérieur du corps du sceau.** Les décisions de couverture
  prises sous menace de non-divulgation post-règlement du
  demandeur sont un schéma établi de mauvaise foi ; le kit
  refuse d'être le véhicule. (Les assureurs peuvent inclure
  des termes NDA dans un accord de règlement séparé ; juste
  pas à l'intérieur du sceau public.)
- **Sceller pendant qu'un contentieux de mauvaise foi contre
  l'assureur est pendant sur ce sinistre, sans concurrence
  expresse du tribunal.** Un sceau de
  registre-contesté aux conditions de l'assureur est une
  fonction judiciaire.

Un refus lui-même peut être scellé comme un fait ("La partie X
a demandé le scellement du schéma Y ; le kit a refusé selon la
règle de refus Z"), créant un registre public de tentative de
mauvais usage.

---

## Ce que ce kit scelle

8 faits au moment de la décision de couverture :

1. **Avis d'exemple** — déclare la publication comme exemple
   (les attestations réelles suppriment ou remplacent ceci).
2. **Identification du sinistre** — numéro de sinistre,
   assureur, code NAIC, dépôt de formulaire de police, dates
   effectives de police, identifiants assuré/demandeur, date de
   perte, date de signalement du sinistre, canal de signalement,
   lieu de perte (rédigé à municipalité / État), couverture en
   cause, date de décision.
3. **Manifeste de preuves** — par élément de preuve : hachage
   SHA-256, taille de fichier, source, date de soumission.
   Inclut l'enregistrement FNOL, déclaration de l'assuré, photos
   de véhicule, rapport de police, expertise indépendante,
   estimation de réparation, résumé de demande et facture de
   tiers (CPT/HCPCS uniquement — voir R2), déclarations de
   témoins (par identifiant — voir R3), photos de scène côté
   assureur, mémo d'analyse de couverture.
4. **Interprétation de couverture** — formulaire de police et
   avenants régissant le sinistre, la lecture contemporaine de
   l'assureur des dispositions en cause, exclusions examinées et
   trouvées non applicables, et la divulgation de loi applicable
   (la lecture de l'assureur est la lecture de l'assureur ;
   l'interprétation finale repose sur un tribunal).
5. **Décision de paiement** — disposition globale, répartition
   du paiement par-élément avec codes de motif substantiels liés
   aux dispositions de FAIT 04, déboursement total de l'assureur,
   toutes réserves, et obligations post-décision.
6. **Divulgations compagnonnes** — contentieux de couverture
   pendant sur le même formulaire de police, sinistres
   antérieurs par le même assuré, récusations et conflits
   d'intérêt de l'expert, historique de révision / annulation
   superviseure, historique de plaintes du DOI de l'État,
   notifications aux réassureurs, problèmes connus de
   fournisseur / logiciel d'évaluation, régimes statutaires
   applicables.
7. **Registre de refus** — schémas que le kit a refusé de
   sceller (ou, où aucun refus n'a été déclenché, une
   attestation explicite "aucun au moment de la décision" par
   discipline de règle-de-refus).
8. **Principal signataire** — identité de l'assureur + code
   NAIC + nom légal de l'expert agréé du dossier et numéro de
   licence DOI de l'État + co-signataire superviseur + chaîne
   complète d'escalade.

Chaque fait se termine par la convention de porte-de-refus :
*"Ce fait n'affirme que X. Il n'affirme pas Y"* (où Y est le
mode de défaillance le plus proche de la section "NE FAIT PAS"
ci-dessus).

---

## Ce contre quoi ce kit défend

- **Renversement silencieux de refus post-paiement.** Les
  assureurs renversent occasionnellement les décisions de
  paiement après coup, alléguant erreur cléricale ou
  re-enquête. Le FAIT 05 scellé ancre la décision ; un
  renversement post-décision est publiquement détectable comme
  une nouvelle action incohérente avec le sceau, non une
  réécriture "toujours-c'était".
- **Réinterprétation rétroactive de couverture.** Une
  réclamation ultérieure de l'assureur que "la police a
  toujours exclu le type de perte X" est publiquement réfutable
  contre la lecture contemporaine de FAIT 04.
- **Accusations a posteriori de falsification-de-preuves
  contre des demandeurs honnêtes.** Un demandeur honnête dont
  les preuves soumises sont alléguées plus tard avoir été
  falsifiées peut re-hacher les preuves qu'il a soumises et
  démontrer qu'elles correspondent au manifeste FAIT 03 scellé
  au moment de la décision. Le sceau place la charge de la
  preuve sur l'accusateur pour identifier une discordance de
  hachage.
- **Réduction a posteriori du montant approuvé.** Un assureur
  qui essaie plus tard de payer moins que le montant approuvé
  dans FAIT 05 fait face à un registre publiquement ancré de
  ce qui a été approuvé.
- **"Le sinistre n'a jamais été reçu" / "nous n'avons aucun
  enregistrement" gaslighting.** Le hachage d'enregistrement
  FNOL scellé, numéro de sinistre, et date de décision prouvent
  que le sinistre était au dossier et décidé à partir de la
  date du sceau.
- **Omission sélective de preuves.** L'énumération de FAIT 03
  de toutes les preuves dans le dossier au moment de la
  décision signifie qu'une réclamation ultérieure "nous n'avons
  jamais eu ce rapport de police" est publiquement réfutable. À
  l'inverse, le "j'ai soumis X et vous l'avez ignoré" ultérieur
  de l'assuré est réfutable si X n'est pas dans le manifeste
  (et l'assuré peut sceller indépendamment ce qu'il a soumis,
  créant un contre-sceau que le sceau de l'assureur devrait
  aborder).
- **Substitution du nom d'un expert différent sur la décision.**
  FAIT 08 ancre l'expert agréé du dossier et la chaîne complète
  d'escalade ; une défense ultérieure d'"expert renégat a agi
  seul" est testable contre cet enregistrement.
- **Dérive d'interprétation-de-couverture entre sinistres
  similaires.** Les interprétations de couverture scellées à
  travers les sinistres de schéma-de-faits-similaire de
  l'assureur deviennent publiquement comparables ;
  l'interprétation sélective favorisant l'assureur dans certains
  cas et l'assuré dans d'autres est publiquement détectable.

Le kit **ne** défend **pas** contre la mauvaise foi
contemporaine — un expert capturé qui scelle une décision
fausse sous pression produit un sceau cryptographiquement
valide d'une décision fausse. La primitive est honnête à ce
sujet : c'est une primitive de non-répudiation pour la
réclamation contemporaine de l'expert, non une preuve que la
réclamation soit correcte. La structure de divulgation
compagnonne dans FAIT 06 est conçue pour faire émerger les
schémas d'expert-capturé (structure d'incitation, historique
de sinistres antérieurs, historique de plaintes DOI, examen du
superviseur) mais ne peut éliminer le mode de défaillance.

---

## Contexte historique

Le kit aurait produit une ancre utile — *non une résolution*
— dans des épisodes passés où l'intégrité du registre de
sinistre d'assurance est devenue un problème contesté :

- **Ouragan Katrina (2005) et la controverse du mémo "make me
  money".** Un assureur IARD majeur a été accusé d'avoir
  utilisé des conseils de cabinet-conseil priorisant la
  réduction du coût des sinistres sur la lecture du contrat ;
  de multiples actions de mauvaise foi et un jugement punitif
  de 2,5 M$ ont suivi. Les interprétations de couverture
  scellées (FAIT 04) et les divulgations d'incitations
  d'expert scellées (FAIT 06 C3) au moment de chaque décision
  de l'ère Katrina auraient rendu le schéma allégué de
  sous-paiement systématique publiquement comparable à travers
  les sinistres, plutôt que reconstructible seulement à
  travers des années de découverte par contentieux.

- **Sinistres santé des premiers répondants du World Trade
  Center du 9/11.** Les sinistres santé post-9/11 et
  d'indemnisation des travailleurs impliquant des premiers
  répondants exposés au WTC ont vu un schéma documenté de
  rétrécissement de couverture a posteriori à mesure que le
  tableau des effets santé à long terme évoluait. Les
  interprétations de couverture scellées au moment de chaque
  décision initiale auraient rendu le rétrécissement
  interprétatif ultérieur publiquement détectable et auraient
  donné aux décideurs politiques de l'ère Zadroga Act une
  ligne de base forensique plus propre.

- **Contentieux d'amiante (décennies).** Les litiges sur *ce
  qui était au registre quand* — quelles polices étaient en
  vigueur, quels avenants s'appliquaient, quelles exclusions
  étaient affirmées à quel moment — ont entraîné le
  contentieux de couverture d'amiante pendant plus de quarante
  ans. Les attestations par-sinistre scellées n'auraient pas
  empêché les litiges sous-jacents sur la couverture et
  l'exposition, mais auraient retiré un axe entier de litige
  (quels enregistrements disaient quoi à quel moment) de
  chaque dossier de sinistre individuel.

- **Renversements d'autorisation-préalable d'assurance-santé.**
  Un schéma documenté à travers plusieurs assureurs dans
  lequel une autorisation préalable pour une procédure est
  émise, la procédure est effectuée, et le sinistre est ensuite
  refusé pour des motifs qui contredisent le langage de
  pré-autorisation. Sceller l'autorisation préalable comme une
  décision d'interprétation-de-couverture sous ce kit rendrait
  la contradiction publiquement détectable.

- **Cas d'altération de dossier de sinistre
  d'assurance-invalidité.** Plusieurs cas rapportés
  d'assureurs d'invalidité à long terme altérant des dossiers
  de sinistre après la détermination favorable initiale pour
  soutenir une décision ultérieure de terminaison. Le
  manifeste de preuves FAIT 03 plus l'interprétation de
  couverture FAIT 04, scellés à la détermination favorable
  originale, auraient rendu l'altération de dossier
  post-détermination publiquement détectable.

Le kit N'aurait PAS résolu les litiges sous-jacents sur la
portée de couverture ou le droit du demandeur dans aucun de
ces épisodes. Il aurait résolu un sous-litige probatoire
spécifique : si le registre au moment de la décision était ce
qu'une partie ou l'autre prétendait plus tard qu'il était.

---

## Quand utiliser ce kit

- Vous êtes un expert agréé du dossier (ou un TPA / MGA avec
  autorité de signature appropriée déléguée) et votre assureur
  permet l'attestation publique volontaire des décisions de
  sinistre.
- Le sinistre implique des enjeux suffisamment élevés pour que
  le contentieux ultérieur ou l'examen du DOI de l'État soit
  plausible (IARD haut-dollar, BI tiers avec implications de
  limites-de-police, invalidité avec queue longue, santé avec
  complexité de pré-autorisation, vie avec questions de
  contestabilité).
- Vous pouvez publier l'ensemble de faits listé sans exposer
  les PII du demandeur, PHI, ou données de ré-identification
  de personne-vulnérable. (Les règles de refus du kit font
  respecter cela ; si vos faits nécessiteraient une rupture de
  règle-de-refus, n'utilisez pas le kit.)
- Le conseil général de l'assureur a examiné le plan de
  publication. La publication publique d'un artefact
  porteur-de-sinistre a des implications pour la gestion
  continue des sinistres, le reporting de réassurance, et les
  dépôts du DOI de l'État ; l'examen du conseil n'est pas
  optionnel.
- Le système de gestion des sinistres de l'assureur peut
  produire des instantanés stables au niveau octet de fichiers
  de preuves (pour que le re-hachage ultérieur reproduise les
  hachages de FAIT 03).

## Quand NE PAS utiliser ce kit

- **Ne pas utiliser comme substitut à la conformité du DOI de
  l'État, conformité du modèle NAIC de
  pratiques-injustes-de-sinistres, conformité de la
  procédure-de-sinistres ERISA, ou la documentation régulière
  du dossier de sinistre de l'assureur.** Ce kit est *additif*,
  non remplacement.
- **Ne pas utiliser si le sinistre implique des PHI qui ne
  peuvent pas être réduits à des résumés de codes de
  facturation CPT/HCPCS sans révéler le diagnostic.** Si la
  catégorie de sinistre expose intrinsèquement le diagnostic
  par la facturation (certains sinistres de maladies rares et
  pharmacie spécialisée), le sceau ne peut pas être émis sans
  enfreindre R2 ; n'utilisez pas le kit sur ces sinistres.
- **Ne pas utiliser pour sceller un refus motivé par une
  pression de coût agrégé plutôt qu'une analyse substantive de
  couverture.** La règle de refus R8 est conçue pour attraper
  ceci ; si vos codes de motif ne peuvent pas être liés à des
  dispositions spécifiques de police et des preuves
  spécifiques, ne scellez pas.
- **Ne pas utiliser sous pression pour sceller avant que
  l'enquête soit complète.** Un sceau d'enquête partielle
  déforme l'état. Les règles de refus R4 et R8 sont conçues
  pour attraper ceci.
- **Ne pas utiliser comme théâtre de légitimité.** Un sceau
  d'une décision de mauvaise foi est un registre public
  permanent de la décision de mauvaise foi, non une défense
  contre elle. La primitive coupe dans les deux sens ; c'est
  son honnêteté.
- **Ne pas utiliser dans les sinistres où l'assureur est déjà
  en contentieux de mauvaise foi concernant ce sinistre, sans
  concurrence expresse du tribunal** (règle de refus R10).
- **Ne pas utiliser pour publier des obligations de
  non-divulgation ou de non-dénigrement contre le demandeur**
  (règle de refus R9).

## Comment forker ce kit pour un sinistre réel

```bash
cp -r ~/Genesis/myriam-kit/examples/insurance-claim-attestation ~/claim-CLM-XXXX
cd ~/claim-CLM-XXXX
$EDITOR facts/*.txt       # replace fictional content with real claim
                          # apply refusal rules R1-R10 throughout
bash build/seal.sh        # seal AT the moment of coverage decision
python3 build/verify.py   # confirm
```

**Timing critique :** sceller AU moment de la décision de
couverture — même jour ouvré ou jour ouvré suivant au plus
tard. Un sceau beaucoup plus tard crée un écart pendant
lequel l'une ou l'autre partie aurait pu altérer le registre.
La bonne fenêtre est immédiatement après que la décision est
rendue et examinée par le superviseur et AVANT que le
demandeur reçoive la lettre de décision — pour que la lettre
de décision contienne une référence à la racine de Merkle du
sceau, verrouillant le raisonnement déclaré de l'assureur au
sceau.

**Examen critique :** avant de sceller, faites passer la
publication à travers le conseil général de l'assureur et (le
cas échéant) l'équipe de reporting de réassurance de
l'assureur. Une fois scellée, la publication est permanente.

## Intégration avec l'infrastructure existante de sinistres

- **Système de gestion des sinistres de l'assureur (CMS) :** le
  CMS reste le système primaire d'enregistrement de l'assureur.
  Le sceau ne remplace pas le CMS ; il engage les preuves et le
  raisonnement que le CMS enregistre, de sorte que les
  modifications post-décision du CMS sont publiquement
  détectables.
- **Enregistrement de transaction EDI / ACORD :** la décision
  FAIT 05 s'aligne avec la transaction de statut-de-sinistre
  ACORD ; la racine de Merkle du sceau peut être portée comme
  référence en forme-libre dans la charge EDI, de sorte que les
  consommateurs en aval (réassureurs, régulateurs, conseil de
  l'assuré) puissent vérifier le sceau indépendamment.
- **Processus de plaintes du Département d'Assurance de
  l'État :** un plaignant peut référencer la racine de Merkle
  du sceau dans une plainte DOI, permettant à l'examinateur du
  DOI de vérifier indépendamment ce qui était au dossier et
  quel était le raisonnement de l'assureur au moment de la
  décision.
- **Examens de conduite-de-marché NAIC :** les décisions
  scellées à travers un portefeuille produisent un registre
  publiquement auditable de schémas de
  traitement-des-sinistres ; un examinateur de
  conduite-de-marché peut exécuter une comparaison de
  décisions-scellées à travers les sinistres de
  schéma-de-faits-similaire gratuitement.
- **Reporting de réassurance :** la racine de Merkle du sceau
  dans le rapport de cession verrouille le raisonnement du
  dossier de sinistre de l'assureur au moment de la cession ;
  le réassureur peut vérifier indépendamment et l'altération
  du dossier de l'assureur post-cession est détectable.
- **Découverte de contentieux de mauvaise foi :** le sceau
  pré-engage l'assureur à l'état du dossier au moment de la
  décision, retirant un axe de litige de découverte (ce qui
  était dans le dossier quand) et focalisant la découverte sur
  la question substantive de mauvaise foi (la décision
  elle-même était-elle raisonnable sur l'état du dossier qui
  existait).
- **Contre-sceaux de l'assuré :** un assuré (ou le conseil du
  demandeur) peut utiliser le MÊME kit pour publier un hachage
  des preuves que l'assuré croit avoir soumises ; si le
  manifeste FAIT 03 de l'assureur omet le hachage de l'assuré,
  cette omission est publiquement détectable. C'est la valeur
  ajoutée principale du kit pour le côté assuré et c'est sans
  permission — l'assureur n'a pas besoin de coopérer.

## Ce que ce kit NE remplace PAS

- Exigences de traitement-des-sinistres du code d'assurance de
  l'État.
- Loi de l'État sur les Pratiques-Injustes-de-Règlement-des-
  Sinistres et les régulations modèles NAIC.
- Procédures de sinistres ERISA § 1133 et 29 C.F.R.
  § 2560.503-1 (pour les sinistres santé et invalidité
  régis par ERISA).
- Le cadre de régulation-d'État de la Loi McCarran-Ferguson.
- Les SOPs de sinistres de l'assureur, documentation du
  dossier de sinistre, ou CMS.
- Processus de plaintes du DOI de l'État.
- Procédures d'appel du titulaire de police spécifiées dans la
  police.
- Recours de droit-commun pour mauvaise-foi dans la
  juridiction du titulaire de police.
- Processus de subrogation, sauvetage et récupération.
- Processus de reporting et d'audit de réassurance.
- Adjudication judiciaire de couverture contestée.

## Valeur d'adoption

La fraude d'assurance américaine à travers auto, santé, IARD,
vie, et branches spécialisées est estimée à environ
\$300 milliards / an en pertes. Ajoutez environ \$50 milliards
/ an en sinistres légitimes contestés (coûts de contentieux
de mauvaise foi, pénalités de statuts de paiement-rapide,
règlement de cas de couverture-contestée) et la surface
adressable est d'environ \$350 milliards / an. Même une
réduction de 1% — par dissuasion d'altération de registres
a posteriori par l'une ou l'autre partie — serait
\$3,5 milliards / an en pertes économisées et coûts de litige
économisés.

À une équivalence conservatrice de \$5 000 / vie-sauvée (la
fourchette OMS pour interventions de santé coût-efficaces dans
les contextes à revenu faible et moyen), \$3,5 milliards / an
correspond à un chiffre de vies-équivalentes de l'ordre de
700 000 vies par an. Ce chiffre est offert comme un cadrage
d'ordre-de-grandeur de la valeur sociale de réduire la
surface des sinistres contestés, non comme une réclamation
directe de mortalité sur la fraude d'assurance américaine en
soi.

Le sceau est une primitive. L'adoption est volontaire. La
valeur s'accumule à travers un portefeuille une fois que
l'intégrité du dossier de sinistre de l'assureur devient
publiquement auditable.

## Licence

Domaine public (CC0). Forkez-le. Aucune attribution requise.
