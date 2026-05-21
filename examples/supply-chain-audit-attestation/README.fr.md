*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Kit de scellement d'attestation d'audit de chaîne d'approvisionnement

Un exemple clé en main de myriam-kit destiné aux auditeurs tiers
sociaux/du travail/environnementaux, aux équipes internes de conformité
fournisseurs, aux enquêteurs ONG sur les chaînes d'approvisionnement, et
aux organisations de défense des droits des travailleurs souhaitant
publier un sceau ancré sur Bitcoin et révélant toute altération d'un
rapport d'audit, au moment exact de la signature finale.

---

## Ce que ce kit NE FAIT PAS (à lire en premier)

Le sceau est un horodatage cryptographique de ce que l'auditeur a signé.
Il ne peut pas vérifier si ce qui a été signé est **vrai**. Les modes
d'échec suivants se situent **hors du domaine du sceau** :

1. **Capture de l'audit par l'industrie.** Les audits commandités par
   les marques ont une longue histoire documentée de produire des
   constatations indulgentes envers les fournisseurs dont la
   poursuite des relations commerciales avec la marque commanditaire
   maintient le flux de contrats d'audit. Un audit capturé, une fois
   scellé, produit un dossier forensique permanent de l'audit capturé.
   Le sceau ne corrige pas la capture — il rend simplement l'audit-
   tel-qu'émis immuable, afin qu'un processus ultérieur de recherche
   de la vérité dispose d'un élément concret de comparaison.

2. **Travailleurs coachés / installations préparées.** Les audits
   annoncés ou semi-annoncés laissent à la direction des jours ou des
   semaines pour répéter les réponses des travailleurs, cacher les
   travailleurs mineurs, nettoyer les dortoirs, retirer les
   équipements non conformes, et détourner le travail vers des
   sous-traitants non audités pendant la fenêtre d'audit. Le sceau
   ancre ce qui a été montré aux auditeurs, pas ce qu'on les a
   empêchés de voir.

3. **Sous-traitance cachée.** La sous-traitance de niveau 2 et
   niveau 3, le travail à domicile, et la production du secteur
   informel sont massivement invisibles pour les audits sur site.
   Le sceau ancre un audit de niveau 1 ; il ne peut pas détecter que
   le niveau 1 sous-traite vers un niveau 2 non audité pendant la
   fenêtre d'audit ou de manière habituelle.

4. **Audits qui passent systématiquement à côté des abus qu'ils
   ciblent.** Rana Plaza, l'effondrement en 2013 de l'usine textile
   du Bangladesh ayant tué 1 134 travailleurs, avait été audité par
   plusieurs programmes d'audit commandités par des marques dans les
   mois précédant l'effondrement. Les fissures dans le bâtiment ne
   figuraient pas sur la liste de contrôle de l'audit social ; le
   régime d'audit n'avait aucun périmètre d'ingénierie structurale.
   Les audits ancrent ce qui est *dans le périmètre* ; les abus hors
   périmètre restent invisibles, quelle que soit la robustesse
   d'évidence d'altération du sceau.

5. **Représailles post-signature contre les travailleurs ayant
   participé aux entretiens.** Même avec le refus des informations
   de localisation (FACT 07 R3), un adversaire déterminé connaissant
   l'identifiant du fournisseur peut identifier l'installation. La
   protection des travailleurs exige plus que le simple refus des
   informations personnelles dans le sceau — elle exige une
   anonymisation en amont de la méthodologie d'audit. Le sceau rend
   l'audit-tel-qu'émis durable ; il ne protège pas rétroactivement
   les personnes interrogées.

6. **Conditions de travail légales mais inhumaines.** Les écarts par
   rapport au salaire vital dans les juridictions où le salaire
   minimum légal est inférieur à la référence de salaire vital
   produisent des constatations d'audit « conformes » au regard des
   lois sur les salaires et les heures, et des constatations « non
   conformes » au regard des normes de salaire vital, dans le même
   audit (FACT 03 élément 8 dans cet exemple de kit). Le sceau ancre
   ce que chaque norme rapporte ; les concilier relève d'un travail
   politique en aval.

7. **Dommages climatiques / environnementaux à causalité diffuse.**
   Les émissions de carbone, les contributions à la déforestation,
   l'épuisement de l'eau, et les rejets de polluants par les
   fournisseurs peuvent être scellés dans les constatations
   d'audit, mais l'attribution causale au volume de commandes
   d'une marque spécifique est méthodologiquement contestée. Le
   sceau ancre ce qui a été mesuré chez le fournisseur ; il
   n'attribue pas la responsabilité morale ou juridique.

8. **Litiges sur la norme faisant autorité.** SA8000 vs. BSCI
   vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. code de
   conduite propre à l'entreprise : chacun a des périmètres,
   gravités et processus de remédiation différents. Le sceau ancre
   *un* audit sous *une* norme. La comparaison inter-normes est un
   problème en aval.

9. **Compétence de l'auditeur vs. accréditation de l'auditeur.**
   « Accrédité » n'est pas « compétent ». Des auditeurs ayant
   suivi des programmes de formation accrédités ont manqué des
   abus graves dans des audits qui ont précédé des catastrophes
   publiquement visibles. Le sceau ancre les accréditations ; il
   ne certifie pas la compétence avec laquelle elles ont été
   exercées.

**La section des limites honnêtes ci-dessus est l'élément porteur de
ce kit.** Une marque souhaitant un théâtre de légitimité utilisera un
audit scellé comme bouclier. Le kit doit le dire clairement : il
s'agit d'une *primitive de non-répudiation pour le moment de
signature du rapport d'audit*, non d'une preuve de conformité du
fournisseur ou de bien-être des travailleurs.

---

## Ce que ce kit DOIT REFUSER de sceller

Le kit est configuré pour rejeter les schémas de faits suivants, même
si un utilisateur disposant d'une autorité d'organisme d'audit valide
les soumet :

- **Identification individuelle des travailleurs.** Aucun fait ne
  peut nommer un travailleur, lier une citation à un travailleur,
  exposer un numéro de badge, une position de ligne, une chambre de
  dortoir, un horaire de quart, une combinaison démographique avec
  N<5, ou tout champ susceptible de ré-identifier une personne ayant
  participé aux entretiens. Les citations des travailleurs utilisent
  des jetons randomisés ; la table de correspondance n'est jamais
  scellée.
- **Sources lanceurs d'alerte / informateurs.** Si une constatation
  repose sur la divulgation par une personne ayant pris un risque
  pour divulguer, cette personne n'est jamais nommée ni identifiée
  dans la publication scellée.
- **Informations précises de localisation.** Pas d'adresse postale,
  pas de GPS, pas d'image satellite à résolution >1 km, pas de
  photographie extérieure du bâtiment. Le pays et la région sont la
  résolution maximale scellée. Justification : l'identification de
  l'installation rend possibles les représailles contre les
  participants aux entretiens.
- **Revendication de certification d'audit propre.** Le kit refuse
  de sceller toute formulation du type « cet audit prouve que le
  fournisseur est conforme » ou « aucune violation n'existe ». Les
  revendications de propreté ne sont pas épistémiquement soutenues
  par la méthodologie d'audit.
- **Substitution sceau-comme-certificat.** Une publication qui
  omet la méthodologie (FACT 04), l'indépendance (FACT 06), ou les
  refus (FACT 07) n'est pas une publication MYRIAM légitime selon
  ce kit.
- **Audits en projet / pré-signature.** Le scellement se fait à la
  signature, pas avant. Les audits provisoires créent une fausse
  certitude.
- **Re-scellement favorable a posteriori.** Un audit révisé exige
  une NOUVELLE publication scellée référençant l'original par la
  racine de Merkle. L'audit scellé original reste visible en
  permanence comme l'audit-tel-qu'émis.
- **Scellement par toute partie autre que l'organisme d'audit.**
  Une marque, un fournisseur, un organisme de certification, ou un
  tiers ne peut pas sceller « l'audit » à la place de l'organisme
  d'audit qui a signé le rapport.

Un refus lui-même peut être scellé comme un fait (« Cette partie a
demandé le scellement de X ; le kit a refusé en application de la
règle de refus Y »), créant un dossier public d'une tentative
d'usage abusif. **Dans une industrie où la capture d'audit est
généralisée, le refus de sceller peut lui-même être un signal
significatif :** un organisme d'audit qui refuse de sceller parce
qu'une marque a fait pression pour adoucir les constatations a la
possibilité d'enregistrer publiquement le refus sous son propre
principal.

---

## Ce que ce kit SCELLE

8 faits au moment de la signature de l'audit :

1. **Notice d'exemple** — déclare la publication comme un exemple
   (les attestations réelles retirent ou remplacent cette notice).
2. **Périmètre et sujet de l'audit** — norme d'audit, organisme
   d'audit, auditeur principal, taille de l'équipe d'audit,
   identifiant du fournisseur (pas d'information précise de
   localisation), fenêtre d'audit, type d'annonce (annoncé /
   semi-annoncé / inopiné), date du rapport d'audit, version de la
   signature, marques destinataires nommées, partie commanditaire.
3. **Manifeste des constatations d'audit** — conformité par
   élément / NC mineure / NC majeure / NC critique au regard de la
   norme, chacun avec un SHA-256 de la rédaction complète de la
   constatation. Totaux agrégés. Recommandation de certification à
   la signature.
4. **Méthodologie et preuves** — allocation du temps sur site,
   nombre d'entretiens (avec stratification : genre, statut
   migrant, ancienneté), répartition par format d'entretien,
   relation de l'interprète, revue documentaire avec tailles
   d'échantillon et hachages de contenu, artefacts de visite de
   site (avec visages des travailleurs floutés), limitations
   méthodologiques connues.
5. **Actions correctives engagées** — par NC majeure et par NC
   mineure, le CAP avec la cause racine déclarée, l'échéance, le
   mécanisme de vérification, les engagements d'escalade, et
   l'engagement de non-relâchement silencieux.
6. **Qualifications et indépendance de l'auditeur** —
   accréditation de l'organisme d'audit, concentration de la
   clientèle, accréditations de l'auditeur principal et compétence
   linguistique, expérience sectorielle, déclarations
   d'indépendance (séparation auditeur-fournisseur, auditeur-marque,
   organisme de certification).
7. **Divulgations compagnons et registre des refus** — conflits
   d'intérêts (explicites), historique d'audits antérieurs, canaux
   de voix des travailleurs communiqués, enquêtes parallèles,
   dissidence interne de l'organisme d'audit, liste des règles de
   refus, refus effectivement invoqués lors de cet audit.
8. **Principal signataire** — organisme d'audit, auditeur
   principal, équipe d'audit, agent autorisant, informations de
   clé cryptographique.

Chaque fait se termine par la convention de barrière de refus :
*« Ce fait n'affirme que X. Il n'affirme pas Y »* (où Y est le mode
d'échec le plus proche de la section « NE FAIT PAS »).

---

## Ce contre quoi ce kit défend

- **Adoucissement silencieux post-signature des non-conformités
  majeures.** Toute modification de FACT 03 (par ex. une MAJOR_NC
  reclassée en MINOR_NC, ou une constatation entièrement
  supprimée) produit un SHA-256 différent, une racine de Merkle
  différente, et échoue à la vérification OTS.
- **Antidatation des clôtures d'actions correctives.** FACT 05
  fige le CAP et ses échéances à la signature ; toute revendication
  « nous avons clos cette NC le mois dernier » en conflit avec les
  échéances scellées est publiquement comparable.
- **Révisionnisme méthodologique.** FACT 04 fige le nombre
  d'entretiens, la taille des échantillons documentaires, et les
  heures sur site à la signature — empêchant la défense ultérieure
  « nous avons mené une enquête approfondie » d'être infalsifiable.
- **Republication sélective omettant les constatations
  défavorables.** Les 8 faits sont liés par une unique racine de
  Merkle ; citer certains faits en en omettant d'autres est
  détectable à partir de la liste des feuilles publiée.
- **Dérive de la revendication d'indépendance.** FACT 06 fige les
  déclarations d'indépendance à la signature. Une revendication
  ultérieure « cet audit était rigoureusement indépendant » doit
  composer avec le pourcentage scellé de concentration de la
  clientèle et avec la divulgation scellée de la commandite payée
  par la marque.
- **Effacement du registre des refus.** FACT 07 fige les schémas
  de faits que le kit a refusés ; toute revendication ultérieure
  « nous n'avons jamais rien refusé » contredit le registre
  scellé.

---

## Cas historiques ou quasi-historiques que le kit aurait aidés

Le kit aurait produit un **ancrage forensique** utile — *et non un
correctif ou une prévention* — dans des cas tels que :

- **Rana Plaza (Bangladesh, 2013).** L'effondrement du bâtiment de
  Rana Plaza a tué 1 134 travailleurs du textile et en a blessé
  environ 2 500. Plusieurs marques dont les produits étaient
  fabriqués dans le bâtiment avaient audité des fournisseurs de
  niveau 1 du bâtiment peu de temps avant l'effondrement. Les
  audits utilisaient des listes de contrôle d'audit social qui
  n'incluaient pas le périmètre d'ingénierie structurale. Un fait
  de méthodologie scellé (FACT 04) à chacun de ces audits aurait
  rendu la *lacune de périmètre* publiquement visible à la
  signature — ancrant la limitation documentée que les programmes
  d'audit ont rétroactivement prétendu ne pas avoir. Le sceau
  n'aurait pas empêché l'effondrement. Il aurait empêché que la
  prétention post-effondrement de l'industrie selon laquelle
  « personne ne savait » soit épistémiquement tenable.

- **Audits Apple / Foxconn (années 2010).** Plusieurs itérations de
  rapports d'audit sur des installations Foxconn produisant pour
  Apple ont été publiées avec des niveaux variables de gravité des
  constatations, de contexte sur les vagues de suicides de
  travailleurs, et de revendications de remédiation. Un dossier
  scellé au moment de la signature pour chaque audit aurait
  empêché les litiges ultérieurs sur « ce que l'audit disait à
  l'époque » de dépendre de copies d'archives, de copies divulguées,
  ou de versions officielles révisées.

- **Cobalt de la RDC (en cours).** L'extraction artisanale de
  cobalt en République démocratique du Congo, y compris par des
  enfants, alimente les chaînes d'approvisionnement en batteries
  pour de grandes marques d'électronique et de véhicules
  électriques. Plusieurs audits commandités par les marques sur la
  période 2017-présent ont produit des constatations de gravité
  variable. Le kit appliqué à chaque audit à la signature aurait
  ancré l'audit-tel-qu'émis ; le kit appliqué aux faits de
  divulgation compagnons (FACT 07 C2 : historique d'audits
  antérieurs) aurait rendu publiquement visible l'héritage
  méthodologique des lacunes antérieures par chaque auditeur
  successif.

- **Minerais de conflit (étain, tantale, tungstène, or de la RDC
  et de la région des Grands Lacs).** Le Dodd-Frank §1502 a
  produit des obligations d'audit et de divulgation sous la règle
  13p-1 de la SEC. Les litiges sur l'adéquation des audits au
  niveau des fonderies et la vérification de la chaîne de
  traçabilité en aval se sont répétés sur la période 2014-2022.
  Des sceaux MYRIAM par audit auraient ancré chaque audit de
  fonderie à la signature.

- **Audits commandités par les marques des chaînes
  d'approvisionnement de coton du Xinjiang (2018-présent).** Les
  litiges sur la fiabilité de conduite des audits sous les
  restrictions du gouvernement de la RPC à l'accès des auditeurs
  ont émergé largement après 2020. Un fait de méthodologie scellé
  (FACT 04) à chaque audit aurait ancré les conditions d'accès
  effectivement appliquées — rendant les revendications
  ultérieures « nous avons mené un audit rigoureux » comparables
  aux contraintes méthodologiques scellées à l'époque.

- **Sous-traitance Foxconn et rapports Apple de responsabilité
  fournisseur dans les années 2010 — découvertes récurrentes de
  travailleurs mineurs, de dortoirs cachés, de violations
  horaires.** Des sceaux par audit auraient ancré les
  *constatations négatives* dans les audits n'ayant rien trouvé,
  aux côtés des *constatations positives* dans les audits ayant
  trouvé des violations — empêchant la sélection rétrospective de
  narration dans l'un ou l'autre sens.

Le kit n'aurait empêché aucun de ces cas. Dans plusieurs cas, le
problème sous-jacent était que l'audit a *manqué* l'abus — sceller
un audit propre qui aurait dû trouver des violations produit un
dossier permanent d'un audit défaillant, ce qui est un type
différent d'utilité (il ancre l'échec pour une responsabilisation
ultérieure) mais ce n'est pas la même chose que la prévention.

---

## Quand utiliser ce kit

- Vous êtes un organisme d'audit adoptant une pratique de
  « publier ce que nous avons signé » comme défense contre la
  pression d'adoucissement post-signature.
- Vous êtes une ONG menant une enquête parallèle sur la chaîne
  d'approvisionnement et souhaitez un point de référence révélant
  toute altération au moment où votre enquête se clôt.
- Vous êtes une organisation de défense des droits des
  travailleurs ayant obtenu un rapport d'audit et souhaitant
  ancrer son contenu actuel avant que l'organisme d'audit ou la
  marque ait l'occasion de le réviser.
- Vous êtes une marque engagée dans la transparence des audits
  que vous avez commandités, et vous souhaitez un dossier
  forensique vérifiable.
- Vous êtes un journaliste, un régulateur ou un tribunal ancrant
  le contenu d'un audit particulier à un moment spécifique pour
  un litige ou un reportage ultérieur.

## Quand NE PAS utiliser ce kit

- **N'utilisez pas comme substitut à la surveillance menée par
  les travailleurs, aux enquêtes ONG indépendantes, ou à
  l'organisation collective des travailleurs.** Le kit est
  *additif*, pas un remplacement pour aucune de ces démarches.
- **N'utilisez pas pour affirmer qu'un fournisseur est
  conforme.** Un audit scellé propre est au mieux une entrée d'une
  évaluation de conformité. Traiter un audit scellé comme un
  certificat de conformité est exactement le théâtre de
  légitimité que les règles de refus contraintes-d'abord existent
  pour empêcher.
- **N'utilisez pas en cours d'audit.** Sceller avant la signature
  crée un dossier faussement positif « ceci est le rapport
  d'audit final ».
- **N'utilisez pas pour sceller un projet que vous comptez
  réviser.** Chaque version signée obtient son propre sceau ; les
  révisions référencent les originaux par racine de Merkle.
- **N'utilisez pas sous pression pour sceller plus tôt que la
  signature, ou pour omettre une divulgation de fait compagnon.**
  Refusez, et (si votre principal le permet) scellez le refus.
- **N'utilisez pas comme base d'une revendication marketing de
  « commerce équitable » ou « approvisionnement éthique » sans
  divulguer les limites méthodologiques scellées à côté du
  sceau.** Citer le sceau sans citer les limites est le mode
  d'échec du théâtre de légitimité qui définit la capture
  d'audit.
- **N'utilisez pas si votre organisme d'audit est
  structurellement capturé et ne peut pas publier de
  constatations contraires à l'intérêt commercial de la marque
  commanditaire.** Dans ce cas, le scellement produit un dossier
  public permanent de l'audit capturé. Cela peut tout de même
  avoir de la valeur — mais ce n'est pas la même chose que se
  défendre contre la capture.

---

## Comment forker ce kit pour un audit réel

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # remplacer le contenu fictif par du réel
bash build/seal.sh        # SCELLER À la signature, pas avant, pas après
python3 build/verify.py   # confirmer
```

**Synchronisation critique :** scellez AU moment de la signature —
c'est-à-dire lorsque l'auditeur principal signe le rapport final et
qu'il devient la position officielle de l'organisme d'audit. Un sceau
avant la signature crée un dossier faussement positif « ceci est
l'audit final ». Un sceau longtemps après la signature est
forensiquement plus faible contre les modifications intermédiaires.

---

## Intégration avec l'infrastructure existante d'audit de chaîne d'approvisionnement

Le kit est conçu pour se composer avec, et non remplacer :

- **SA8000 (Social Accountability International).** Les rapports
  d'audit SA8000 et les documents CAP correspondent naturellement
  à FACT 03 + FACT 05. La référence d'accréditation SAAS
  correspond à FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Les constatations d'audit RBA correspondent à
  FACT 03 ; les règles d'indépendance des cabinets d'audit de RBA
  correspondent à FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Les
  constatations d'audit SMETA à 2 piliers et 4 piliers
  correspondent à FACT 03 ; la plateforme Sedex héberge le
  rapport brut — le sceau MYRIAM ancre un hachage de contenu du
  rapport hébergé sur la plateforme.
- **amfori BSCI.** Les mécanismes de notation A–E de BSCI
  correspondent à la recommandation de certification de FACT 03 ;
  la commandite par adhésion de marque correspond à la
  divulgation de concentration de clientèle de FACT 06 et à
  FACT 07 C1.
- **Chaîne de traçabilité FSC.** Pour les chaînes
  d'approvisionnement en produits forestiers, les certificats de
  chaîne de traçabilité et les calendriers de ré-audit
  s'inscrivent dans la structure de fenêtre d'audit et de CAP.
- **Évaluation d'impact B Lab / B Corp.** La certification B Corp
  n'est pas un audit tiers au sens de SA8000, mais les rapports
  des vérificateurs de l'évaluation d'impact peuvent être scellés
  sous ce kit (avec les faits requalifiés pour l'évaluation
  d'impact plutôt qu'un audit de travail).
- **ISO 26000.** ISO 26000 est une orientation, non certifiable ;
  le kit n'a pas d'intégration directe avec un rapport d'audit
  ISO 26000, mais la taxonomie de responsabilité sociale peut
  informer la structure des éléments de FACT 03 pour les audits
  internes.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  autres régimes sectoriels industriels).** Les programmes
  d'audit spécifiques au secteur peuvent être scellés sous ce
  kit ; le champ de norme d'audit de FACT 02 identifie lequel.
- **Fair Labor Association.** Les rapports de surveillance
  d'usines de la FLA correspondent à FACT 03 + FACT 05 ; le
  cadre d'observateur indépendant de la FLA correspond aux
  déclarations d'indépendance de FACT 06.
- **Higg Index (Sustainable Apparel Coalition).** Les sorties au
  niveau de l'installation Higg FEM (Facility Environmental
  Module) et Higg FSLM (Facility Social & Labor Module) peuvent
  être scellées sous ce kit.
- **CSRD / CSDDD de l'UE.** La directive européenne sur le
  reporting de durabilité des entreprises (CSRD) et la directive
  sur le devoir de vigilance en matière de durabilité (CSDDD)
  créent des obligations de divulgation dont les documents de
  vérification peuvent être scellés sous ce kit. Le kit ancre la
  divulgation-telle-qu'émise, non son adéquation substantielle.

## Ce que ce kit NE remplace PAS

- La surveillance menée par les travailleurs (le signal le plus
  fiable de détection d'abus dans toute chaîne d'approvisionnement)
- Les enquêtes ONG indépendantes (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium, etc.)
- L'inspection réglementaire (bureaux nationaux du travail,
  équivalents OSHA, programmes des bureaux pays de l'OIT)
- L'organisation collective des travailleurs et la négociation
  collective
- Les litiges, l'arbitrage, et la remédiation sous le droit du
  travail national
- Les cadres de diligence raisonnable côté marque (UNGP,
  Orientation de l'OCDE sur le devoir de vigilance, CSDDD de l'UE)

## Licence

Domaine public (CC0). Forkez-le. Aucune attribution requise.
