*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Kit de scellement de la chaîne de possession des preuves judiciaires

Un exemple clé en main de myriam-kit destiné aux équipes d'acquisition
forensique — examinateurs en informatique forensique, techniciens
d'extraction d'appareils mobiles, gardiens des preuves issues de caméras-
piétons, superviseurs de laboratoire — qui souhaitent publier un sceau
ancré sur Bitcoin, à inviolabilité détectable, indiquant *quels octets
ont été acquis* et *quand*, au moment même de l'acquisition de la preuve
numérique, afin que les contestations relatives à la chaîne de possession
disposent d'un point d'ancrage public.

---

## Ce que ce kit NE FAIT PAS (à lire en premier)

Le sceau constitue un horodatage cryptographique de QUELLES IMAGES
FORENSIQUES ont été acquises, QUAND elles l'ont été, par QUEL ORGANISME,
en vertu de QUEL MANDAT, et par QUELLE MÉTHODOLOGIE. Il ne peut répondre
à aucune autre question portant sur l'affaire. Les éléments suivants se
trouvent **hors du domaine du sceau** :

1. **L'admissibilité au regard des Federal Rules of Evidence (ou de tout
   autre code de la preuve).** Le sceau ancre des octets et des
   horodatages. La question de savoir si une preuve est admissible — au
   titre de l'authentification FRE 901, du témoignage d'expert FRE 702
   / Daubert, de l'équilibrage des préjudices FRE 403, ou de tout
   équivalent en juridiction d'État — est une question de procédure
   juridique. Une acquisition parfaitement scellée peut tout de même
   être déclarée inadmissible ; une acquisition non scellée peut tout
   de même être admise. Le sceau constitue une preuve additionnelle
   d'intégrité, et non un substitut à la décision d'admissibilité du
   tribunal.

2. **La légalité de la saisie.** Le respect du Quatrième Amendement, la
   validité du mandat, le respect de son périmètre, l'applicabilité de
   la règle d'exclusion — tous ces points sont en amont du sceau. Le
   sceau enregistre que l'acquisition a eu lieu en vertu du mandat
   FICT-SW-2026-0188 ; la question de savoir si ce mandat a été
   légalement délivré et légalement exécuté revient au tribunal.

3. **Le caractère incriminant, disculpatoire ou neutre de la preuve.**
   Le sceau ancre des empreintes ; l'interprétation de ce que ces
   empreintes contiennent relève du rapport d'examen forensique, qui
   constitue un document distinct soumis à son propre régime de
   divulgation et de preuve. Le sceau refusera de sceller « FAIT N : le
   portable du suspect contenait des éléments incriminants » — voir la
   règle de refus R4.

4. **La conformité procédurale de la chaîne de possession au regard du
   droit de la preuve de l'État applicable.** Le sceau enregistre le
   journal contemporain des événements de possession de l'organisme
   (FAIT 05). Le point de savoir si ce journal satisfait aux exigences
   en matière de chaîne de possession d'un État particulier revient au
   tribunal lors de l'audience probatoire.

5. **La fiabilité de la méthodologie forensique.** L'arrêt Daubert et
   sa descendance (ainsi que ses équivalents à l'échelle des États,
   comme Frye lorsqu'il s'applique encore) évaluent la fiabilité
   méthodologique. Le sceau enregistre QUELS outils et versions ont
   été utilisés (FAIT 04) ; la question de savoir si ces outils
   répondent à la norme de fiabilité d'un tribunal particulier revient
   à ce tribunal. Des bogues d'outils ont été documentés a posteriori
   dans des affaires passées ; le rôle du sceau est de rendre le
   relevé version-et-empreinte-de-binaire publiquement réfutable, et
   non de cautionner les outils eux-mêmes.

6. **La question de savoir si la preuve a été altérée AVANT
   l'acquisition.** Le sceau ancre les octets à partir du moment de
   l'imagerie. Si un suspect, un agent ou un tiers a modifié l'appareil
   source avant que celui-ci ne soit imagé, le sceau ne peut le
   détecter — il scellera les octets altérés avec la même intégrité
   qu'il scellerait les octets originaux. La valeur du sceau commence
   à l'horodatage de l'imagerie.

7. **Le respect du périmètre du mandat.** L'annexe du mandat définit
   ce qui peut être acquis ; le sceau enregistre ce qui A ÉTÉ acquis.
   La question de savoir si l'acquisition a dépassé le périmètre du
   mandat est, là encore, une question juridique dotée de son propre
   recours (requête en suppression selon la procédure de l'État
   applicable).

8. **La réidentification de toute partie privée à l'enquête.** Le sceau
   refuse de publier tout nom, identifiant ou empreinte susceptible de
   permettre la réidentification d'un suspect, d'un défendeur, d'une
   victime, d'un témoin ou de l'occupant des lieux. La référence au
   rôle de l'affaire constitue la poignée appropriée pour les parties
   disposant de la qualité pour localiser le dossier.

**La section ci-dessus sur les limites honnêtes est la partie porteuse
de ce kit.** Les équipes forensiques qui croient que sceller équivaut à
admissibilité l'utiliseront comme un bouclier. Le kit doit le dire
clairement : *il s'agit d'une primitive de non-répudiation pour le
moment de l'acquisition, et non d'une preuve d'acquisition légale, de
solidité méthodologique ou de chaîne de possession reconnue par le
tribunal.*

---

## Ce que ce kit DOIT REFUSER de sceller

Le kit est configuré pour rejeter les configurations factuelles
suivantes même si un utilisateur disposant d'une autorité de signature
valide pour l'organisme les soumet :

- **L'identification personnelle de suspects, défendeurs, victimes,
  témoins ou de toute tierce partie privée.** La référence au rôle de
  l'affaire constitue la poignée pour les parties disposant de la
  qualité ; le sceau public ne doit pas devenir un index de
  réidentification.
- **Les noms personnels des examinateurs forensiques ou de tout autre
  personnel de l'organisme dans le sceau public.** Les rôles sont
  publics ; les liaisons personne-à-rôle sont scellées séparément et
  divulgables par procédure judiciaire.
- **Les empreintes au niveau du fichier (ou empreintes digitales) de
  matériel suspecté d'abus sexuel sur enfants, de gabarits
  biométriques, ou de toute donnée de réidentification de personnes
  vulnérables — même par empreinte.** Une SHA-256 d'un fichier
  individuel est un identifiant recherchable permanent ; sa
  publication sur un registre public peut revictimiser les sujets par
  corrélation avec des bases de données privées. Les empreintes au
  niveau de l'image (au niveau de l'image forensique) de disques
  entiers sont acceptables ; les empreintes au niveau du fichier d'un
  tel matériel ne sont JAMAIS acceptables.
- **Les conclusions, interprétations, opinions ou résultats d'examen
  portant sur la signification des octets.** Le sceau ancre QUELS
  OCTETS ont été acquis et QUAND. L'interprétation appartient au
  rapport d'examen divulgable, et non à un registre public à
  inviolabilité détectable.
- **Les revendications d'admissibilité ou toute autre conclusion
  juridique** (« cette preuve est admissible », « le mandat était
  légal », « la chaîne de possession était conforme au §X.Y »). Les
  conclusions juridiques relèvent des fonctions du tribunal.
- **Le scellement par toute personne autre que le mandataire autorisé
  de l'organisme acquéreur.** Un expert de la défense peut utiliser le
  kit pour sceller sa propre vérification indépendante du manifeste ;
  il ne peut pas sceller l'acquisition ORIGINALE au nom de l'organisme
  acquéreur.
- **Les liaisons rôle-à-individu à l'intérieur du sceau public.** Les
  liaisons sont scellées dans un enregistrement compagnon distinct
  (haché dans le FAIT 05) sous le contrôle d'accès de l'organisme.
- **Les faits d'enquête antérieurs à la saisie ou au mandat.** Les
  déclarations d'informateurs, la surveillance pré-mandat, les
  intrants de construction parallèle — aucun de ces éléments ne
  relève du sceau d'acquisition. Le sceau est circonscrit à
  l'événement d'acquisition.

Un refus peut lui-même être scellé comme un fait (« Cet organisme a
demandé le scellement de X ; le kit a refusé en application de la
règle de refus Y »), créant ainsi un registre public des tentatives
d'usage abusif.

---

## Ce que ce kit SCELLE bel et bien

8 faits au moment de l'acquisition :

1. **Avis d'exemple** — déclare que la publication est un exemple (les
   attestations réelles suppriment ou remplacent ce fait).
2. **Contexte d'acquisition** — identifiant de l'affaire, citation du
   mandat, organisme acquéreur, autorité requérante, date et heure de
   la saisie et de l'acquisition, lieu de l'acquisition (le lieu de la
   saisie est expurgé vers un enregistrement compagnon scellé
   séparément afin d'éviter de réidentifier les lieux).
3. **Manifeste de preuves** — par élément d'image forensique :
   empreinte SHA-256, taille du fichier, identifiant anonymisé de
   l'appareil source, méthode d'acquisition, format d'image
   forensique.
4. **Méthodologie d'acquisition** — noms et versions exactes des
   outils forensiques (avec empreintes des binaires d'outils), marque
   et modèle ainsi que micrologiciel du bloqueur d'écriture, référence
   de vérification NIST CFTT, procédure de vérification utilisée,
   choix du format d'image.
5. **Journal de la chaîne de possession** — chronologie événement par
   événement depuis la saisie initiale jusqu'à la fin de l'imagerie,
   gardiens identifiés par RÔLE (et non par nom), avec empreintes des
   enregistrements compagnons scellés séparément (liaison rôle-à-
   individu, journal GPS du transport, journal d'accès au casier de
   preuves, photographies des scellés anti-altération, etc.).
6. **Qualifications des examinateurs par rôle** — certifications
   détenues, statut de formation continue, nombre d'expériences
   antérieures en tant que témoin expert, exposition à Daubert,
   divulgations de conflits d'intérêts — le tout au niveau du rôle,
   non personnel.
7. **Divulgations compagnons et registre de refus** — enquêtes
   parallèles, contestations de mandat en cours, requêtes de
   suppression de preuve, protocole de filtre de privilège / équipe
   de cloisonnement en vigueur, tentatives d'acquisition antérieures,
   examen du suivi de bogues du fournisseur ; liste explicite des
   configurations que le kit a refusé de sceller.
8. **Mandataire signataire** — identification de l'organisme
   acquéreur + signataire de niveau rôle (examinateur principal) +
   co-signataire de niveau rôle (superviseur d'unité) + informations
   cryptographiques sur la clé.

Chaque fait se termine par la convention du verrou de refus : *« Ce
fait n'affirme que X. Il n'affirme pas Y »* (où Y est le mode de
défaillance le plus proche issu de la section « NE FAIT PAS » ci-
dessus).

---

## Ce contre quoi ce kit se défend

- **Altération silencieuse post-acquisition d'une image forensique.**
  Toute modification au niveau de l'octet d'une image quelconque
  produit une SHA-256 différente, et l'image modifiée a posteriori
  ne se vérifiera pas par rapport au manifeste scellé du FAIT 03.
- **L'affirmation selon laquelle « d'autres outils ont été utilisés ».**
  Le FAIT 04 enregistre les versions exactes des outils avec les
  empreintes des binaires d'outils ; les affirmations ultérieures
  du type « nous avons en réalité utilisé v4.7.0, pas v4.7.1 » sont
  publiquement réfutables.
- **L'affirmation selon laquelle le bloqueur d'écriture n'a pas été
  engagé, ou qu'un modèle différent a été utilisé.** Le FAIT 04 fige
  le manifeste du bloqueur d'écriture.
- **Altération du journal de possession.** Toute modification de la
  chronologie événementielle de possession du FAIT 05 (ajout,
  suppression ou nouvel horodatage d'un événement) modifie l'empreinte
  du FAIT 05 et est publiquement détectable.
- **Substitution des qualifications d'un autre examinateur.** Le
  FAIT 06 fige le profil de qualifications de niveau rôle au moment
  de l'acquisition.
- **Omission sélective de divulgations compagnons.** Le FAIT 07
  énumère les catégories de divulgation attendues ; une catégorie
  vide doit être attestée explicitement (« aucune au moment de
  l'acquisition »), de sorte qu'un « nous n'avions pas réalisé que
  c'était pertinent » ultérieur soit publiquement réfutable.
- **Affirmations post-acquisition selon lesquelles l'examinateur
  avait un conflit qui n'a pas été divulgué.** La divulgation de
  conflit du FAIT 06 est figée au moment de l'acquisition ; les
  contestations ultérieures peuvent être confrontées à elle.

Le kit ne se défend **pas** contre la corruption contemporaine — une
équipe qui scelle intentionnellement de fausses métadonnées au moment
de l'acquisition produit un sceau cryptographiquement valide de
fausses métadonnées. La primitive est honnête à ce sujet : il s'agit
d'une primitive de non-répudiation des affirmations contemporaines de
l'organisme, et non d'une preuve que ces affirmations sont exactes.

---

## Affaires historiques ou quasi historiques pour lesquelles le kit aurait aidé

Le kit aurait produit un point d'ancrage utile — *et non une
résolution* — dans des affaires passées où la chaîne de possession de
la preuve numérique est devenue un point probatoire contesté. Afin
d'éviter de nommer les défendeurs (qui sont des parties privées même
lorsqu'ils sont condamnés), ces affaires sont décrites par type
d'affaire, non par individu nommé :

- **La controverse fédérale du milieu des années 2010 sur un bogue
  d'outil forensique** dans laquelle un outil d'imagerie forensique
  largement utilisé a été découvert, après acquisition, comme
  présentant un bogue de cas limite affectant un type particulier de
  média source. Un manifeste d'acquisition scellé contenant des
  données figées de version d'outil et d'empreinte de binaire aurait
  permis à la défense et à l'accusation de s'accorder précisément
  sur la version utilisée, éliminant ainsi un axe de litige.

- **Plusieurs affaires d'État portant sur des résultats contestés
  d'extraction d'appareils mobiles**, où le fournisseur de l'outil
  d'extraction a publié par la suite un correctif et où la question
  est devenue « le bogue a-t-il affecté cette affaire ». Un fait de
  méthodologie scellé permet de répondre à la question en s'appuyant
  sur des données de versionnage figées, plutôt que sur le souvenir
  actuel de l'organisme quant à la version utilisée.

- **Litiges sur le transfert d'images de caméras-piétons** dans des
  affaires où il a été allégué par la suite que le système de
  station d'accueil du fournisseur de caméra-piéton avait permis la
  modification des enregistrements en transit. Un manifeste scellé
  de l'archive de caméra-piéton au moment de la réception par
  l'organisme ancre quels octets l'organisme a reçus du système de
  station d'accueil ; les modifications ultérieures du côté de
  l'organisme sont publiquement détectables.

- **Controverses sur les collisions de hachage dans les affaires
  d'informatique forensique**, où un expert de la défense soutenait
  que MD5 (encore utilisé dans certains flux de travail hérités)
  était inadéquat. Une acquisition scellée enregistrant À LA FOIS
  MD5 et SHA-256 permet à la SHA-256 de subsister même si la MD5
  est récusée.

- **Litiges sur l'évolution de la méthodologie d'examen entre
  l'acquisition et le procès.** Lorsqu'une affaire reste en attente
  entre l'acquisition et le procès pendant des années, la
  méthodologie qui était standard au moment de l'acquisition peut
  avoir été supplantée au moment du procès. L'enregistrement scellé
  permet au tribunal d'évaluer la méthodologie au regard du standard
  qui prévalait au moment de l'acquisition, et non au regard du
  standard ultérieur.

Le kit n'aurait PAS résolu les litiges sous-jacents sur la
culpabilité ou l'innocence dans aucun de ces types d'affaires. Il
aurait résolu un sous-litige probatoire spécifique : la question de
savoir si les octets, les outils et les procédures étaient bien ce
que l'organisme prétend qu'ils étaient au moment où l'organisme
prétend qu'ils l'étaient.

---

## Quand utiliser ce kit

- Votre organisme dispose d'une procédure opérationnelle forensique
  stable et souhaite ajouter une attestation publique ancrée sur
  Bitcoin comme couche à inviolabilité détectable au-dessus de la
  chaîne de possession existante sur papier et par signature.
- Vous prévoyez que cette affaire impliquera une contestation
  significative par la défense des éléments de preuve forensiques
  (affaire à fort enjeu, méthodologie inédite, versions d'outils
  contestées, etc.).
- Vous pouvez publier l'ensemble de faits indiqués sans exposer
  d'informations à caractère personnel ni de données de
  réidentification de personnes vulnérables. (Les règles de refus
  du kit le font respecter ; si vos faits exigeaient une dérogation
  à une règle de refus, n'utilisez pas le kit.)
- Le conseiller juridique général de l'organisme acquéreur et le
  bureau du procureur ont examiné le plan de publication. La
  publication publique d'un artefact portant un identifiant
  d'affaire a des implications pour les enquêtes en cours ; la
  revue par le conseiller juridique n'est pas optionnelle.
- Les règles de divulgation de la défense de votre juridiction sont
  compatibles avec le fait que l'organisme conserve séparément
  l'enregistrement de liaison rôle-à-individu (haché dans le
  FAIT 05). Si votre juridiction exige la divulgation publique du
  nom des examinateurs, vous devez amender le kit en conséquence.

## Quand NE PAS utiliser ce kit

- **Ne l'utilisez pas comme substitut à la documentation de chaîne
  de possession existante de l'organisme.** Ce kit est *additif*,
  non remplaçant. Le CMS, le journal de possession et les
  obligations de production des éléments à divulgation de
  l'organisme restent inchangés.
- **Ne l'utilisez pas si l'acquisition implique du CSAM, des
  gabarits biométriques ou d'autres données de réidentification de
  personnes vulnérables au niveau du fichier.** Les empreintes au
  niveau de l'image de disques entiers sont acceptables ; les
  empreintes au niveau du fichier d'un tel matériel ne sont JAMAIS
  acceptables, même sous dérogation à une règle de refus. Si vous
  ne pouvez pas constituer un ensemble de faits sans rompre R3,
  n'utilisez pas le kit.
- **Ne l'utilisez pas pour affirmer que le mandat était légal, que
  la saisie était conforme ou que la preuve est admissible** — le
  kit ne peut pas faire cela, et la règle de refus R5 rejettera
  toute affirmation de ce type.
- **Ne l'utilisez pas sous pression pour sceller avant que
  l'acquisition ne soit terminée.** Un sceau d'acquisition
  partielle dénature l'état.
- **Ne l'utilisez pas pour publier les noms personnels des
  examinateurs** à moins que votre juridiction ne l'exige
  spécifiquement et que vos examinateurs n'aient consenti
  individuellement. Par défaut, la publication se fait au niveau
  du rôle.
- **Ne l'utilisez pas dans des affaires scellées ou sous scellés**
  sans autorisation explicite du tribunal. La publication d'un
  identifiant d'affaire sur Bitcoin est irréversible ; si l'affaire
  est ultérieurement placée sous scellés, le sceau public ne peut
  être rétracté. Le kit est réservé aux acquisitions relevant du
  registre public.
- **Ne l'utilisez pas comme théâtre de légitimité.** Un sceau
  d'une acquisition viciée est un registre public permanent des
  vices, non une défense contre eux. La primitive coupe dans les
  deux sens ; c'est là son honnêteté.

## Comment forker ce kit pour une acquisition réelle

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Cadencement critique :** scellez DÈS ou juste après la conclusion de
l'imagerie (événement E17 du FAIT 05 dans la chronologie de l'exemple).
Un sceau en cours d'imagerie crée un enregistrement d'acquisition
partielle ; un sceau beaucoup plus tardif crée une lacune durant
laquelle l'organisme aurait pu altérer les images. La bonne fenêtre se
situe immédiatement après l'achèvement de la vérification de l'image
pour le dernier élément du jeu de pièces à conviction.

**Revue critique :** avant le scellement, faites passer la publication
par un second examinateur forensique (autre que l'examinateur
principal) et par le conseiller juridique de l'organisme. Une fois
scellée, la publication est permanente.

## Intégration avec l'infrastructure existante de chaîne de possession

- **Système de gestion des affaires (CMS) de l'organisme.** Le CMS
  demeure le système d'enregistrement principal de l'organisme. Le
  sceau ne remplace pas le CMS ; il s'engage sur les octets et la
  méthodologie que le CMS enregistre, de sorte que les modifications
  a posteriori du CMS soient publiquement détectables.
- **Federal Rules of Evidence / Daubert / codes de la preuve des
  États.** Le sceau contribue au registre d'authentification FRE 901
  en fournissant une intégrité à inviolabilité détectable. Il ne
  satisfait PAS à lui seul à la FRE 702 / Daubert ; la fiabilité
  méthodologique est encore éprouvée lors de l'audience probatoire.
- **Divulgation à la défense (FRCP 16, Brady, Giglio et équivalents
  des États).** Les enregistrements compagnons hachés dans le
  FAIT 05 (liaison rôle-à-individu, journal de possession,
  photographies des scellés anti-altération, etc.) demeurent soumis
  à la divulgation ordinaire. Le sceau ancre ce que ces
  enregistrements affirmaient au moment de l'acquisition, de sorte
  qu'une affirmation ultérieure du type « l'enregistrement était
  différent à l'époque » soit publiquement réfutable.
- **NIST Computer Forensics Tool Testing (CFTT).** Le kit fait
  référence aux journaux de vérification CFTT dans le FAIT 04 / le
  FAIT 05 ; la référence est une empreinte, et non le journal lui-
  même, de sorte que les procédures du CFTT ne sont pas affectées.
- **Neutres désignés par le tribunal et experts de la défense.**
  Les uns ou les autres peuvent re-hacher les images forensiques
  reçues lors de la divulgation et les confronter au manifeste du
  FAIT 03, indépendamment de toute coopération de l'organisme.
  C'est là la principale valeur ajoutée du kit pour la défense.
- **Revue en appel.** Des années plus tard, un examinateur
  forensique en appel peut vérifier la méthodologie d'acquisition
  d'origine au regard de l'enregistrement scellé du FAIT 04, plutôt
  qu'au regard du souvenir actuel, potentiellement modifié, de
  l'organisme.

## Ce que ce kit ne remplace PAS

- Les Federal Rules of Evidence (ou tout code de la preuve d'État).
- Les standards de fiabilité Daubert / Frye pour le témoignage
  d'expert.
- La procédure opérationnelle forensique et le CMS de l'organisme.
- Les obligations de divulgation à la défense au titre de FRCP 16 /
  Brady / Giglio / équivalents des États.
- Les ordonnances judiciaires, les requêtes en suppression, les
  audiences probatoires, ou tout autre processus administré par le
  tribunal.
- Le NIST CFTT ou tout autre régime de test d'outils.
- Le protocole de filtre de privilège / équipe de cloisonnement de
  l'organisme.

## Pourquoi ce kit existe dans la v0.4.0+

Il s'agit du 8e exemple concret livré avec myriam-kit. Il suit la
structure contrainte-d'abord validée par l'autorecherche documentée
dans `~/Genesis/calc/PROMPT_LIBRARY_v0.md` — la variante d'invite
contrainte-d'abord a obtenu le score le plus élevé selon une grille
pondérée à travers plusieurs domaines d'exemple. Les sections
d'ouverture sont les parties porteuses du kit ; le contenu du
manifeste est la partie facile.

La conception du kit est délibérément conservatrice en ce qui
concerne la publication du nom des examinateurs et agressive sur la
clause de non-responsabilité « ceci n'établit pas l'admissibilité ».
La communauté forensique a un historique documenté d'attaques dont
elle fait l'objet pour ses travaux forensiques ; le kit s'aligne par
défaut sur la position la plus sûre pour les examinateurs. Les
organismes situés dans des juridictions où la désignation publique
des personnes est requise peuvent amender leur fork en conséquence,
mais le refus par défaut privilégie la sécurité des examinateurs.

## Licence

Domaine public (CC0). Forkez-le. Aucune attribution requise.
