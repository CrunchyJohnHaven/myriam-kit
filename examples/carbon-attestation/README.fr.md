*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse de Scellement d'Attestation Carbone

Un exemple clé en main de myriam-kit pour les développeurs de projets
carbone, les vérificateurs tiers et les registres qui souhaitent publier
un sceau ancré sur Bitcoin et révélateur de toute manipulation, portant
sur l'émission d'un crédit carbone, la vérification d'une absorption
ou un événement d'attestation d'émissions au moment exact de la
certification — afin que toute modification silencieuse postérieure à
l'émission devienne publiquement détectable.

---

## Ce que cette trousse ne fait PAS (à lire en premier)

Les crédits carbone sont contestés sur les plans politique et
scientifique. Le sceau est un horodatage cryptographique de ce qui a
été attesté. Il ne peut pas vérifier si ce qui a été attesté reflète
un bénéfice climatique réel. Les modes d'échec suivants sont **hors
du domaine du sceau**, et représentent la majorité des questions
d'intégrité significatives au sujet des crédits carbone :

1. **Additionnalité.** Le sceau ne peut pas vérifier que l'activité
   créditée n'aurait pas eu lieu sans le financement carbone. Le
   contrefactuel est, par principe, inobservable. Le sceau enregistre
   l'argument d'additionnalité de la méthodologie ; il ne le tranche
   pas.

2. **Permanence.** Le sceau ne peut pas vérifier que le carbone
   séquestré le restera sur l'horizon temporel pertinent (décennies
   à siècles pour le carbone forestier, échelles géologiques pour
   certaines absorptions). La littérature récente (Badgley et al.
   2022, Patterson et al. 2022) montre que les réserves tampon
   (buffer pools) ont été substantiellement amenuisées par des
   événements réels d'inversion. Un crédit scellé est une
   *affirmation* scellée de permanence selon des hypothèses
   spécifiées de réserve tampon, et non une preuve de permanence.

3. **Fuites (leakage).** Le sceau ne peut pas vérifier que les
   émissions évitées dans la zone du projet ne sont pas simplement
   déplacées vers une zone hors-projet. Les déductions de fuites par
   défaut de la méthodologie sont des substituts réglementaires, pas
   des mesures. Le sceau ancre la déduction appliquée ; il ne la
   certifie pas comme correcte.

4. **Co-bénéfices.** Le sceau ne peut pas vérifier les revendications
   de développement communautaire ou de biodiversité. Les
   co-bénéfices sont typiquement auto-déclarés et examinés par le
   vérificateur, et non audités à la profondeur de la quantification
   du carbone. Le sceau ancre les hachages des documents ; rien de
   plus.

5. **Suffisance du Consentement Libre, Préalable et Éclairé (CLPE /
   FPIC).** Le consentement autochtone et communautaire dans les
   projets carbone a un historique documenté de modes d'échec
   (consentement contraint, consentement d'organes non
   représentatifs, "consentement" a posteriori par compensation).
   Le sceau ancre la documentation CLPE et les hachages du registre
   de griefs ; il ne peut pas certifier que le processus de
   consentement a été authentique.

6. **Indépendance du vérificateur.** Les vérificateurs sont payés
   par les développeurs de projet. Il s'agit d'un conflit d'intérêts
   structurel qu'aucun schéma d'accréditation n'a résolu. Le sceau
   ancre la déclaration d'indépendance du vérificateur ; il ne
   certifie pas que la déclaration soit véridique.

7. **Double comptabilisation entre registres ou avec les
   inventaires nationaux.** Le sceau ancre l'instantané de l'état
   du registre au moment de l'attestation. Si la même activité est
   également comptabilisée par un pays hôte au titre de sa CDN, ou
   également revendiquée sur un autre registre, le sceau rend l'état
   du registre comparable, mais n'empêche pas la double
   comptabilisation.

8. **Justesse de la revendication de l'acheteur.** Un acheteur qui
   retire un crédit scellé pour soutenir une revendication de
   "zéro net" ou de "neutralité carbone" formule une revendication
   en aval que le sceau ne couvre pas. Le sceau enregistre le
   retrait ; la validité de la revendication marketing de l'acheteur
   est une question distincte, située en aval.

9. **Justesse de la méthodologie.** Le sceau enregistre la
   citation de la méthodologie + le hachage du document en vigueur
   au moment de l'attestation. Il n'affirme pas que la méthodologie
   est scientifiquement valide. Les réformes de méthodologie se
   produisent ; sceller au titre d'une méthodologie qui est
   ultérieurement révisée ne rend pas rétroactivement les crédits
   "faux" ou "justes" — cela ancre les règles qui s'appliquaient
   au moment de l'émission.

**La section ci-dessus sur les limites honnêtes est l'élément
porteur de cette trousse.** Presque toute question d'intégrité
significative au sujet d'un crédit carbone relève d'un de ces neuf
compartiments. Le sceau referme l'étroit interstice qui subsiste :
la modification rétroactive silencieuse des octets au registre. Cet
interstice est réel et mérite d'être refermé, mais il est étroit
comparé au terrain disputé.

---

## Ce que cette trousse DOIT REFUSER de sceller

La trousse est configurée pour rejeter les modèles factuels suivants,
même si un utilisateur disposant d'une autorité de signature valide
les soumet :

- **"Additionnalité" énoncée comme un fait.** Sceller
  l'additionnalité comme un fait crée un enregistrement trompeur. La
  trousse accepte les *arguments* d'additionnalité conformes à la
  méthodologie, pas les *revendications* d'additionnalité.
- **"Permanence" sans divulgation explicite de l'horizon temporel et
  de la réserve tampon.** Sceller la permanence sans ces paramètres
  occulte ce à quoi le projet s'engage réellement.
- **"Absence de fuites" sans mesure propre au projet.** Les
  déductions de fuites par défaut de la méthodologie ne sont pas une
  mesure et le sceau ne les traitera pas comme telles.
- **Quantifications générées avant l'achèvement de la vérification
  tierce.** Un sceau apposé avant la vérification crée un
  enregistrement faussement positif de "vérifié".
- **Enregistrements d'émission de crédits également émis sur un
  registre différent sans divulgation inter-registres explicite**
  dans le FAIT 06.
- **Enregistrements de retrait qui n'identifient pas le bénéficiaire
  du retrait.** Le retrait anonyme compromet la fonction de bien
  public du retrait ; la trousse refuse de le permettre.
- **Revendications CLPE non étayées par des hachages de
  documentation attestable.**
- **Émission au titre des Articles 6.2 / 6.4 sans hachage de la
  lettre d'autorisation (LoA) du pays hôte** scellé dans le FAIT 06.
- **Scellement à la demande de toute partie autre que le
  développeur de projet + le vérificateur conjointement** pour ce
  projet.
- **Revendications de co-bénéfices scellées comme "certifiées"**
  alors qu'elles sont seulement "auto-déclarées et examinées par le
  vérificateur".

Un refus peut lui-même être scellé comme un fait ("Cette partie a
demandé le scellement de X ; la trousse a refusé conformément à la
règle de refus Y"), créant un enregistrement public d'une tentative
de mésusage.

---

## Ce que cette trousse SCELLE bien

8 faits au moment de l'attestation :

1. **Avis d'exemple** — déclare que la publication est un exemple
   (les attestations réelles suppriment ou remplacent ceci).
2. **Identification du projet** — nom du projet, registre,
   identifiant du projet dans le registre, citation de la
   méthodologie + hachage, hachage de la frontière géographique,
   millésime, développeur du projet, revendication de co-bénéfices,
   statut CLPE.
3. **Quantification des émissions ou des absorptions** — tonnes
   brutes de CO2e, contrefactuel de référence, déduction de fuites,
   contribution à la réserve tampon, déduction d'incertitude,
   revendication créditable nette, hachages de chaque entrée
   numérique.
4. **Méthodologie de mesure** — sources de données de
   télédétection, réseau de placettes de vérification de terrain,
   hachage du journal d'étalonnage des instruments, hachage du
   modèle classifieur + statistiques de précision, modèle de
   densité de carbone, provenance du code + manifeste de
   reproductibilité.
5. **Vérification par un tiers** — organisme vérificateur,
   accréditation, hachage de la déclaration d'indépendance,
   engagements antérieurs avec le développeur, hachage de l'archive
   photographique de la visite de site, constatations soulevées +
   résolues, hachage du document d'opinion de vérification.
6. **Enregistrement d'émission ou de retrait** — demande +
   approbation d'émission, total des crédits émis, plage de
   numéros de série, déclaration inter-registres, hachage de la
   LoA du pays hôte le cas échéant, plages de numéros de série de
   retrait + bénéficiaires (pour les attestations de retrait),
   hachages de l'instantané de l'état du registre.
7. **Divulgations complémentaires et registre des refus** —
   contestations méthodologiques en cours, risque de non-permanence,
   réserves sur les fuites, réserves sur l'additionnalité, hachages
   du CLPE + registre des griefs, réserve sur les co-bénéfices,
   engagement antérieur du vérificateur ; liste explicite des
   modèles que la trousse a refusé de sceller.
8. **Principal signataire** — développeur de projet + vérificateur
   + registre, chacun avec son rôle + portée de l'attestation +
   informations sur la clé cryptographique.

Chaque fait se termine par la convention de la porte de refus : *"Ce
fait n'affirme que X. Il n'affirme pas Y"* (où Y est le mode d'échec
le plus proche issu de la section "ne fait PAS" ci-dessus).

---

## Ce contre quoi cette trousse défend

- **Modification silencieuse de la quantification après l'émission.**
  Toute modification entière du FAIT 03 produit un SHA-256
  différent, une racine de Merkle différente, et échoue à la
  vérification OTS.
- **Substitution silencieuse de méthodologie.** Le FAIT 02 fige la
  citation de la méthodologie + le hachage du document au moment de
  l'émission. Une substitution par le registre d'une version
  différente de la méthodologie après l'émission est publiquement
  comparable.
- **Révision silencieuse de la référence.** Le hachage de la sortie
  du modèle de scénario de référence du FAIT 03 est scellé. Un
  réajustement post hoc de la référence pour produire davantage de
  crédits est détectable.
- **Substitution silencieuse de l'opinion du vérificateur.** Le
  hachage du document d'opinion du FAIT 05 est scellé. Une
  réécriture après émission du type "le vérificateur a toujours dit
  X" est détectable.
- **Disparition silencieuse d'un enregistrement de retrait.**
  L'instantané de l'état du registre du FAIT 06 est scellé. Les
  crédits qui redeviennent mystérieusement "disponibles" après
  avoir été marqués comme retirés sont détectables par rapport au
  sceau.
- **Substitution silencieuse de documents CLPE.** Les hachages du
  CLPE + registre des griefs du FAIT 07 sont scellés. Les documents
  de consentement de remplacement sont détectables.
- **Suppression silencieuse de divulgations gênantes.** Le statut de
  divulgation complémentaire du FAIT 07 est scellé. La suppression
  silencieuse d'une réserve sur la non-permanence figurant dans la
  page de description d'un projet est détectable par rapport aux
  octets scellés.

La trousse ne défend PAS contre les questions d'intégrité
sous-jacentes (additionnalité, permanence, fuites, suffisance du
CLPE, indépendance du vérificateur, validité de la méthodologie).
Ce sont les problèmes les plus difficiles et le sceau ne peut les
résoudre.

---

## Cas historiques ou quasi historiques où la trousse aurait aidé

La trousse aurait fourni un ancrage utile — *non un remède* — dans
les cas impliquant une modification rétroactive silencieuse
d'enregistrements d'attestation carbone. Elle N'AURAIT PAS résolu
les questions contestées sous-jacentes dans aucun de ces cas.

- **L'enquête de 2023 du Guardian / Die Zeit / SourceMaterial sur
  les crédits de forêt tropicale de Verra.** Les enquêteurs ont
  constaté que la plupart des projets REDD+ étudiés produisaient
  des crédits dont les émissions évitées revendiquées ne
  correspondaient pas à une réanalyse ultérieure par
  télédétection. L'enquête a nécessité de reconstruire la
  documentation des projets face à des enregistrements de registre
  modifiés rétroactivement. Une publication scellée à chaque cycle
  d'émission aurait fourni des octets de référence sans ambiguïté
  de ce qui était attesté à chaque cycle — non un remède au
  problème de référence sous-jacent, mais une chronologie
  forensique nette.

- **Les événements d'inversion des compensations forestières de
  Californie en 2020.** Plusieurs projets de carbone forestier
  relevant du marché de conformité californien ont subi des
  inversions par incendies de forêt dépassant la réserve tampon
  mise de côté pour eux. Reconstruire ce que chaque projet avait
  attesté concernant le risque de non-permanence *au moment de
  l'émission* (par opposition à ce que le projet a affirmé
  ultérieurement avoir attesté) est actuellement difficile. Des
  sceaux par millésime auraient rendu les attestations
  pré-incendies canoniquement récupérables.

- **Plusieurs projets REDD+ dans lesquels les méthodologies de
  référence de région de référence ont été rétroactivement
  critiquées comme étant gonflées.** Un hachage du document
  méthodologique scellé au moment de l'émission aurait ancré
  quelle version de la méthodologie s'appliquait effectivement à
  quel millésime, rendant comparable la défense "la méthodologie a
  toujours été X".

- **Plusieurs litiges concernant des projets de régénération
  induite par l'homme dans le cadre de l'Australian Carbon Credit
  Unit (ACCU) (2022–2023).** La critique académique sur la question
  de savoir si la régénération était effectivement induite par le
  projet ou résultait d'une reconversion naturelle s'est résolue
  en litiges sur ce que le projet avait initialement revendiqué.
  Des attestations scellées auraient fourni des enregistrements
  sans ambiguïté par millésime.

- **Enregistrements de retrait de compensations carbone qui ont
  changé d'état.** Plusieurs cas documentés d'enregistrements de
  retrait dans des registres de marché volontaire semblent
  changer de statut après le retrait (en devenant "retirés" pour
  une raison différente, ou en étant attribués à un bénéficiaire
  différent a posteriori). Des sceaux par retrait auraient ancré
  l'état au moment du retrait initial.

Dans aucun de ces cas la trousse n'aurait permis de trancher si le
crédit sous-jacent représentait un bénéfice climatique réel. La
trousse ancre des enregistrements ; c'est tout ce qu'elle fait.

---

## Quand utiliser cette trousse

- Vous êtes un développeur de projet qui souhaite publier une
  attestation révélatrice de toute manipulation aux côtés de votre
  dépôt standard au registre.
- Vous êtes un vérificateur tiers qui souhaite que son opinion de
  vérification soit publiquement vérifiable face à la
  représentation ultérieure du registre de "ce que le vérificateur
  a dit".
- Vous êtes un registre qui souhaite fournir une couche
  supplémentaire d'intégrité sur les enregistrements d'émission et
  de retrait — en particulier pour les projets dans des
  juridictions où les garde-fous d'état de droit pour l'intégrité
  du registre sont plus faibles.
- Vous êtes un journaliste, universitaire ou ONG menant une
  analyse longitudinale pluriannuelle des projets carbone et avez
  besoin d'un ancrage public pour comparer les représentations
  ultérieures d'un projet aux octets de son moment d'émission.
- Vous êtes un acheteur (zéro net d'entreprise, conformité
  aérienne) qui souhaite que les crédits que vous retirez soient
  retirés face à des enregistrements ancrés publiquement, afin
  que votre revendication marketing en aval puisse être auditée
  face à une chronologie forensique stable.

## Quand NE PAS utiliser cette trousse

- **Ne l'utilisez pas en remplacement d'une vérification tierce
  accréditée.** Le sceau ne remplace pas la vérification
  ISO 14064-3 ; il se compose avec elle.
- **Ne l'utilisez pas pour revendiquer qu'un projet est
  "additionnel", "permanent" ou "à faibles fuites".** Le sceau ne
  peut pas vérifier ces propriétés. Utiliser le sceau pour les
  affirmer constitue un mésusage.
- **Ne l'utilisez pas comme théâtre de légitimité pour des crédits
  de faible qualité.** Un sceau cryptographique apposé sur un
  crédit de mauvaise qualité est un enregistrement forensique
  permanent de la mauvaise qualité, et non une défense de
  celle-ci. La primitive coupe dans les deux sens ; c'est son
  honnêteté.
- **Ne l'utilisez pas pour sceller des crédits qui sont également
  comptabilisés par un pays hôte au titre de sa CDN** sans
  divulgation explicite d'ajustement correspondant dans le
  FAIT 06.
- **Ne scellez pas avant vérification.** Un sceau apposé avant que
  l'opinion du vérificateur ne soit définitive crée un
  enregistrement faussement positif de "vérifié".
- **Ne l'utilisez pas sous la pression d'omettre une divulgation
  de fait complémentaire dans le FAIT 07** (contestations
  méthodologiques en cours, problèmes CLPE, engagements antérieurs
  du vérificateur). Refusez et scellez le refus.
- **Ne l'utilisez pas comme insigne marketing.** "Scellé par
  MYRIAM" n'est pas une revendication de qualité ; c'est une
  propriété forensique. La traiter comme un insigne de qualité,
  c'est exactement le mésusage que la conception centrée sur les
  contraintes cherche à prévenir.

## Comment forker cette trousse pour une attestation réelle

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Synchronisation critique :** scellez AU moment ou APRÈS
l'événement officiel d'émission du registre, et NON avant. Un sceau
préalable à l'émission crée un enregistrement faussement positif
"émis". Pour les attestations de retrait, scellez AU moment du
retrait. Pour les attestations de surveillance continue entre
émission et retrait, scellez à chaque cycle de surveillance signé
par le vérificateur — mais précisez clairement dans le FAIT 01 que
l'attestation est une mise à jour de surveillance, et non une
émission.

## Intégration avec l'infrastructure carbone existante

- **Verra (VCS).** L'URL de la publication scellée ou le CID IPFS
  peut être joint à la page du projet VCS en tant que documentation
  complémentaire. Le sceau ne remplace pas la vérification VCS ; il
  se compose avec elle.
- **Gold Standard.** Même modèle d'intégration — attestation
  complémentaire aux côtés de la documentation d'émission de Gold
  Standard. L'accent mis par Gold Standard sur les co-bénéfices +
  la documentation des bénéfices communautaires se mappe
  naturellement sur le FAIT 02 + le FAIT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Même modèle d'intégration.
- **Article 6.4 (mécanisme de l'Organe de Supervision de l'Accord
  de Paris).** Le hachage de la LoA du pays hôte dans le FAIT 06
  est spécifiquement conçu pour la traçabilité des ITMO au titre
  des Articles 6.4 / 6.2. La divulgation de l'ajustement
  correspondant est un champ régi par la porte de refus.
- **MRV de l'EU ETS.** Pour les émetteurs du marché de conformité,
  le hachage du rapport MRV correspond au hachage du tableur de
  quantification du FAIT 03. Le sceau se compose avec — et ne
  remplace pas — le rapport d'émissions vérifié de l'exploitant.
- **Divulgation d'entreprise CDP (Carbon Disclosure Project).**
  Pour les entreprises citant des crédits retirés dans leurs
  soumissions CDP, l'enregistrement de retrait scellé au titre du
  FAIT 06 est l'enregistrement canonique récupérable. La rédaction
  de la soumission CDP peut renvoyer à la racine de Merkle ou au
  CID IPFS de la publication scellée.
- **ISO 14064-2 (projet) / ISO 14064-3 (vérification) / ISO 14065
  (accréditation).** Le sceau enregistre l'affirmation de
  conformité + les hachages ; il ne réalise pas l'évaluation de
  conformité.
- **Principes Fondamentaux du Carbone (CCP) du TSVCM / labels
  ICVCM.** Lorsqu'un projet a été évalué au regard des CCP de
  l'ICVCM, le hachage du résultat de l'évaluation peut être scellé
  dans le FAIT 07 en tant que divulgation complémentaire.

## Ce que cette trousse NE remplace PAS

- La vérification tierce accréditée (ISO 14064-3)
- Les flux de travail d'émission et de retrait des registres
- L'évaluation de la conformité méthodologique
- Les processus d'autorisation par le pays hôte pour les
  transactions au titre de l'Article 6
- Les processus MRV du marché de conformité (EU ETS, Cap-and-Trade
  de Californie, RGGI, etc.)
- Les initiatives d'intégrité du marché volontaire (ICVCM, VCMI)
- L'évaluation indépendante de l'impact climatique

## Pourquoi cette trousse existe en v0.4.0+

Voici le septième exemple concret livré avec myriam-kit. La trousse
existe parce que les marchés de crédits carbone ont un historique
bien documenté de modification rétroactive silencieuse — des
méthodologies qui sont réinterprétées rétroactivement, des
références qui sont révisées rétroactivement, des enregistrements
de retrait qui changent d'état, et des divulgations de projets qui
laissent silencieusement tomber des réserves gênantes au fil du
temps.

Le sceau referme l'*étroit* interstice des octets au moment de
l'attestation. Il ne traite pas — et ne peut pas traiter — les
questions contestées plus vastes d'additionnalité, de permanence,
de fuites ou d'authenticité des co-bénéfices. Le cadrage honnête
de cette limitation par la trousse est sa caractéristique la plus
importante.

## Licence

Domaine public (CC0). Forkez. Aucune attribution requise.
