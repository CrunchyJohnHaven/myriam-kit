*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse d'attestation de lot vaccinal

Un exemple myriam-kit clé en main destiné aux fabricants de vaccins, aux
autorités d'assurance qualité et aux agences de santé publique souhaitant
publier un sceau de libération de lot ancré sur Bitcoin et révélateur de
toute altération.

## Contre quoi cette trousse se défend

**Modes d'échec que le sceau permet d'attraper :**

- **Modification rétroactive silencieuse des résultats des tests de
  libération.** Les huit PDF de tests de libération inclus dans
  l'exemple sont hachés. Un nouveau hachage après la libération révèle
  toute modification.
- **Litiges concernant les spécifications applicables à la libération.**
  Le FACT 02 scellé contient l'identification canonique du lot et le
  hachage du dossier de fabrication. Les futurs litiges du type « la
  spécification a toujours été X » disposent d'une ancre publique.
- **Réduction silencieuse de l'étendue d'un rappel.** Les engagements
  de pharmacovigilance contenus dans le FACT 05 sont scellés ; tout
  manquement à les honorer est publiquement observable.
- **Re-spécification rétroactive d'un lot hors spécifications.** Si un
  résultat de test de libération constituait en réalité un PASS limite
  reclassé en FAIL après la libération, les hachages des rapports
  scellés prouvent ce que le PDF de résultat original énonçait.

**Modes d'échec NON couverts :**

- Fraude au sein du processus de fabrication lui-même (le sceau ancre
  des résultats de tests, non l'intégrité de la fabrication).
- Événements indésirables qui constituent les conséquences biologiques
  d'un lot par ailleurs conforme (le sceau ne certifie pas la sécurité
  clinique, uniquement l'intégrité documentaire).
- Litiges sur la version d'une spécification réglementaire qui fait
  autorité.

## Quand utiliser cette trousse

Envisagez de sceller une libération de lot si :

- Vous êtes un fabricant de vaccins souhaitant démontrer une intégrité
  forensique des dossiers de libération au-delà de ce qu'exigent les
  autorités réglementaires
- Vous êtes une équipe d'assurance qualité adoptant la pratique « publier
  ce que nous attestons »
- Vous êtes un fabricant à petite échelle ou à l'échelle nationale dans
  une juridiction à infrastructure réglementaire plus faible, désireux
  d'ancrer les dossiers de lot face à un vérificateur global
- Vous êtes une agence de santé publique ou une ONG menant un programme
  de production vaccinale non commercial (par exemple pour les maladies
  négligées)

## Précédents historiques de mortalité

- **Contamination à l'héparine (2008, Chine) :** sulfate de
  chondroïtine sursulfaté contrefait dans des lots d'héparine. Un
  manifeste de tests de libération scellé aurait rendu toute
  modification silencieuse post-libération du dossier d'essais
  cryptographiquement détectable.
- **Tylenol au cyanure (1982) :** litiges rétroactifs sur le point
  d'origine de l'altération. Un hachage scellé du dossier de
  fabrication ancre l'état pré-distribution.
- **Divers rappels de lots vaccinaux** où la question « ce lot a-t-il
  jamais été correctement testé » devient contestée des années plus
  tard.

La trousse N'EST PAS une solution à AUCUN de ces cas au sens strict,
mais dans chaque cas, des attestations de lot scellées auraient fourni
une chronologie forensique plus claire.

## Comment forker cette trousse pour un lot réel

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # remplacez le contenu fictif par le lot réel
bash build/seal.sh        # SCELLEZ AVANT le début de la distribution
python3 build/verify.py   # vérifiez
```

**MOMENT CRITIQUE** : scellez à l'instant de la libération par
l'assurance qualité, AVANT que le lot ne soit distribué. Un sceau
postérieur à la distribution est forensiquement plus faible.

## Intégration avec l'infrastructure pharmaceutique existante

- **Soumissions eCTD (FDA / EMA) :** l'URL ou le CID IPFS de la
  publication scellée peut être référencé dans la section Module 3
  (qualité)
- **Préqualification de l'OMS :** le manifeste scellé démontre la chaîne
  de tests pré-libération auprès des juridictions hors FDA/EMA
- **Retour de pharmacovigilance :** le FACT 05 engage le fabricant à
  une déclaration scellée des comptes agrégés d'EI à 6 et 12 mois
- **Systèmes de rappel (RxConnect, MedWatch) :** si un rappel est
  nécessaire, son étendue elle-même est scellée sous MYRIAM, fournissant
  une vérification publique que tous les lots distribués sont pris en
  charge

## Ce que cette trousse NE remplace PAS

- Les soumissions réglementaires à la FDA / l'EMA / l'OMS
- Les pistes d'audit GMP (le sceau ancre des RÉSULTATS, et non les
  enregistrements bruts du processus)
- Les bases de données de pharmacovigilance (VAERS / EudraVigilance)
- Les systèmes de coordination des rappels

## Licence

Domaine public (CC0). Forkez-la. Aucune attribution requise.
