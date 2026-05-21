*Traduction française — pour la version originale en anglais, voir [SPEC.md](SPEC.md)*

# Spécification du protocole MYRIAM-kit

## 0. Objet

Ce document spécifie un protocole minimal pour publier un petit ensemble de
faits textuels sous une forme inviolabilité-détectable et cryptographiquement
vérifiable, qui survit au retrait par n'importe quel hébergeur unique.

Il s'agit de la généralisation du protocole déployé pour la première fois sur
[disclosure.host](https://disclosure.host) sous le nom de « MYRIAM v1 ».

## 1. Non-objectifs

- Stockage de secrets. Tout est public par construction.
- Grands ensembles de données. Au-delà de ~20 faits, le protocole est de la
  mauvaise forme.
- Publication en temps réel. Chaque publication est un événement de scellement
  discret.
- Rétractation. Le protocole est en ajout uniquement au niveau de la version.

## 2. Modèle de fait

Un FAIT est un fichier texte UTF-8 avec :

- Motif de nommage : `NN_short_name.txt` où NN est un index à deux chiffres
  rempli de zéros à gauche commençant à 01.
- Forme canonique : octets tels qu'écrits, sans normalisation.
- Hachage par fait : hexadécimal en minuscules de `SHA-256(file_bytes)`.

L'ENSEMBLE de faits est la liste ordonnée de tous les fichiers correspondant au
motif sous `facts/`, triés par ordre lexicographique.

Contrainte : tout corps de fait DEVRAIT être formulé comme un *événement de
nommage* ou un *événement de déclaration* attribuable à une partie précise. Les
affirmations ontologiques (« la lune est de la roche ») compromettent le seuil
de vérifiabilité ; seul l'événement de publication est vérifiable, pas
l'affirmation. « X a déclaré Y » est la forme appropriée. « Y est vrai » ne
l'est pas.

## 3. Racine de Merkle

Style Bitcoin, comme dans la v0 du protocole MYRIAM déployé :

1. Feuilles : hachages SHA-256 par fait dans l'ordre de l'ensemble de faits.
2. Si un niveau a un nombre impair de nœuds, dupliquer le dernier nœud.
3. Hacher par paires les nœuds adjacents :
   `parent = SHA-256(left_bytes || right_bytes)`, où `left_bytes` et
   `right_bytes` sont les valeurs de hachage brutes de 32 octets (et non leurs
   représentations hexadécimales).
4. Répéter jusqu'à ce qu'il ne reste qu'un seul nœud. C'est la racine de Merkle.

La racine est publiée en hexadécimal minuscule sans saut de ligne final.

### 3.1 Vecteurs de test

| Vecteur | Feuilles (octets UTF-8 hachés) | Racine attendue (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Toute implémentation conforme DOIT reproduire ces vecteurs. Ils sont dérivés du
fichier `lib/build.py` réel et peuvent être régénérés avec ce script.

## 4. Engagement Bitcoin

La racine de Merkle est inscrite dans la blockchain Bitcoin via
[OpenTimestamps](https://opentimestamps.org). La politique par défaut est :

> Horodater auprès d'au moins deux opérateurs de calendrier sous contrôle
> administratif indépendant.

Un reçu qui satisfait cette politique est vérifiable par toute partie capable
d'exécuter `ots verify <receipt>.ots` et d'atteindre le chemin de mise à niveau
de l'un ou l'autre des calendriers.

La paire d'opérateurs par défaut livrée dans `lib/seal.sh` :

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Les implémentations PEUVENT utiliser des opérateurs différents. La politique de
diversité des témoins (≥2 opérateurs indépendants) est normative ; les
opérateurs spécifiques ne le sont pas.

## 5. Miroir à adressage par contenu

Le répertoire `site/` contenant la page publiée et les fichiers de faits
DEVRAIT être ajouté à IPFS :

```
ipfs add -r --cid-version=1 -Q site/
```

Le CIDv1 résultant (codec dag-pb) est l'adresse de contenu de la publication.
Il est déterministe à partir du contenu en octets de `site/`. Toute modification
d'un fichier quelconque sous `site/` produit un CID différent.

L'épinglage auprès de services supplémentaires au-delà du nœud local du
publieur est fortement recommandé pour la durabilité ; cette spécification
n'impose pas de services précis.

## 6. Versionnage

Le protocole est **en ajout uniquement au niveau de la version**. Tout
changement nécessite une nouvelle version scellée :

- Une révision de spécification nouvelle (ou inchangée)
- Un nouvel ensemble de faits, qui PEUT hériter de faits inchangés des versions
  antérieures
- Une nouvelle racine de Merkle
- Un nouveau reçu OpenTimestamps
- Un nouveau CID IPFS

Toutes les versions antérieures restent publiées à des URL versionnées. Un
changement d'un fait quelconque de la v(N) nécessite la v(N+1), les deux
versions restant visibles et re-vérifiables.

## 7. Vérification

Tout tiers peut vérifier l'intégrité d'une publication en :

1. Téléchargeant les fichiers de faits et recalculant les hachages SHA-256 par
   fait.
2. Recalculant la racine de Merkle conformément au §3 et la comparant à la
   racine publiée.
3. Vérifiant le reçu OpenTimestamps par rapport à la blockchain Bitcoin pour au
   moins l'attestation complète d'un calendrier.
4. Recalculant indépendamment le CID IPFS via
   `ipfs add -r --cid-version=1` et le comparant au CID publié.

`lib/verify.py` réalise les étapes 1 à 3 sans dépendance externe au-delà de la
bibliothèque standard de Python et du client `ots`. L'étape 4 nécessite le
client `ipfs`.

## 8. Seuil de refus

Une publication NE DOIT PAS inclure un fait qui :

- Identifie un tiers privé qui n'a pas consenti à être nommé.
- Présente une hypothèse comme une confirmation.
- Ne peut être réduit à un événement vérifiable de nommage/déclaration ou à un
  artefact cryptographique.
- A une augmentation raisonnablement attendue de morts évitables lors de sa
  publication.

La quatrième règle est celle qui porte la charge. Elle est appliquée à l'étape
de relecture humaine par le publieur. Il n'y a aucune application au niveau du
protocole du seuil de refus ; le protocole publie tels quels les octets qu'on
lui donne. Le publieur est responsable du seuil.

## 9. Énoncé honnête des limites

- **Détectabilité, pas impossibilité.** Le protocole rend l'altération
  détectable, pas impossible. Un attaquant déterminé peut toujours substituer
  une publication différente et persuader certains lecteurs qu'il s'agit de
  l'originale. La valeur du protocole, c'est que la substitution devient
  cryptographiquement démontrable pour quiconque exécute la vérification.
- **Aucune défense contre la publication d'une contre-vérité.** Si le publieur
  scelle un fait énonçant « X est arrivé » alors que X n'est pas arrivé, le
  protocole scelle la fausse affirmation avec la même fidélité qu'il scelle les
  vraies. Le protocole atteste de ce qui a été *publié*, pas de ce qui est
  *vrai*.
- **Signature mono-partie.** La v1 du MYRIAM déployé utilise un seul mandant
  signataire. La signature multi-partie reste un travail futur.
- **Durabilité de l'épinglage.** L'épinglage IPFS sur le seul nœud du publieur
  fournit « disponible tant que mon portable est allumé + mise en cache
  opportuniste par les passerelles ». Une durabilité de long terme exige des
  épinglages redondants sur des services indépendants.

Ces limites sont énoncées ici afin qu'aucun lecteur ne suppose que le protocole
livre davantage qu'il ne le fait.
