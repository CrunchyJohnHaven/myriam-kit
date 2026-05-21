*Traduction française — pour la version originale en anglais, voir [README.md](README.md)*

# Trousse de scellement de manifeste pour lanceurs d'alerte

Un exemple clé en main de myriam-kit pour les lanceurs d'alerte confrontés au
mode d'échec spécifique où **les preuves sont enterrées, modifiées ou
contestées par des intermédiaires situés entre le lanceur d'alerte et le
public**. Les cas historiques de référence contre lesquels la trousse défend :

- Boeing 737 MAX (rapports internes de sécurité minimisés ou enterrés)
- Theranos (préoccupations relatives aux tests de laboratoire étouffées pendant des années)
- Rapports d'inspecteurs de la FDA modifiés après dépôt
- Frances Haugen / Facebook (un manifeste scellé aurait prouvé que
  les documents étaient authentiques et existaient au moment indiqué)

Contre quoi cette trousse défend (en termes de protocole) :

- T1–T3 dans le [FACT 05](facts/05_threat_model.txt) : contestation publique
  du contenu des documents, allégations selon lesquelles les documents
  n'étaient pas scellés au moment indiqué, allégations de fabrication rétroactive.
- T9 : tiers remettant aux journalistes des copies altérées.

Contre quoi cette trousse **ne** défend **pas** :

- Représailles personnelles contre le lanceur d'alerte (T7).
- Pressions sur le lanceur d'alerte pour qu'il se rétracte (T4, partiellement
  atténué par le FACT 07 qui rend la rétractation silencieuse publiquement détectable).
- Action en justice contre le lanceur d'alerte pour le seul fait de la divulgation (T5).
- Atteintes au caractère du lanceur d'alerte (T8).
- Intermédiaires abandonnant silencieusement l'affaire (T10).

Si vous êtes un lanceur d'alerte qui envisage d'utiliser cette trousse,
**lisez ce README en entier d'abord**. Le protocole est un outil. Le protocole
n'est pas un substitut à un conseil juridique, à un journaliste, à une autorité
de régulation ou à une discipline rigoureuse de sécurité opérationnelle.

## Ce que cette trousse produit

Un *manifeste* cryptographiquement scellé des preuves (et non les preuves
elles-mêmes) qui prouve :

1. Que les octets spécifiques de chaque fichier de preuve existaient au moment
   du scellement.
2. Que le scellement a eu lieu à un instant donné ou avant cet instant (via
   une attestation OTS sur Bitcoin).
3. Que la provenance, l'allégation, le modèle de menace, le protocole du
   destinataire et l'engagement de non-rétractation-silencieuse ont tous été
   déclarés conjointement.

Les documents sous-jacents restent en votre possession jusqu'à ce que vous les
transmettiez à un destinataire. Les destinataires vérifient qu'ils ont reçu
les mêmes octets que ceux que vous avez scellés.

## Quand utiliser cette trousse

Vous devriez envisager de sceller un manifeste **avant** de transmettre des
preuves à un journaliste, à une autorité de régulation ou à un avocat, si
toutes les conditions suivantes sont remplies :

- Vous disposez de preuves sous forme numérique (PDF, courriels, images, etc.)
  que vous souhaitez préserver comme authentiques octet par octet.
- Vous prévoyez que des intermédiaires pourraient altérer, contester ou
  enterrer les preuves.
- Vous pouvez conserver les documents sous-jacents en votre possession jusqu'à
  la transmission.
- Vous pouvez publier le manifeste publiquement **sans** révéler le contenu
  des documents (seuls les hachages sont publics).
- Vous avez pesé les risques de devenir publiquement identifiable comme
  lanceur d'alerte (le champ du principal signataire). Si vous êtes anonyme,
  utilisez un pseudonyme de manière cohérente dans toutes les publications liées.
- Vous avez consulté un avocat sur le droit de la protection des lanceurs
  d'alerte dans votre juridiction.

## Quand NE PAS utiliser cette trousse

N'utilisez PAS cette trousse si :

- Les documents eux-mêmes contiennent des informations personnelles sur des
  tiers (patients, clients, employés) qui ne devraient pas devenir
  publiquement hachables. Hachez une version expurgée, pas l'original.
- Le seul fait de publier le manifeste identifierait le lanceur d'alerte
  d'une manière à laquelle il n'a pas consenti.
- Vous n'avez pas encore consulté d'avocat. Le protocole est un outil ; le
  droit de la protection des lanceurs d'alerte est spécifique à chaque
  juridiction et vit en dehors du protocole.
- Vous pourriez vouloir rétracter ultérieurement l'une quelconque des
  allégations. Le sceau est permanent ; de nouvelles corrections scellées
  sont la seule manière honnête de réviser.
- Vous agissez sous la contrainte ou sous pression temporelle. Le protocole
  amplifie la coercition ; la porte de refus (myriam-kit `SPEC §8`)
  s'applique aux lanceurs d'alerte comme aux éditeurs.

## Comment forker cette trousse pour une divulgation réelle

```bash
# 1. Copiez cet exemple dans un nouveau répertoire
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Supprimez le contenu fictif ; remplacez-le par vos faits réels.
# Chaque fichier sous facts/ est un fait. Lisez chacun et remplacez.
$EDITOR facts/01_example_notice.txt   # passer à une vraie déclaration de couverture
$EDITOR facts/02_provenance.txt       # vraie provenance de vos preuves
$EDITOR facts/03_evidence_manifest.txt # hachez vos vrais documents et listez-les
$EDITOR facts/04_allegation_summary.txt # votre véritable allégation
$EDITOR facts/05_threat_model.txt     # vos vraies réponses attendues
$EDITOR facts/06_recipient_protocol.txt # adapter à votre destinataire
$EDITOR facts/07_no_retraction_commitment.txt # votre déclaration de non-rétractation
$EDITOR facts/08_signing_principal.txt # votre véritable identité de signature (ou pseudonyme)

# 3. Mettez à jour site/index.html pour refléter les faits réels.
# Le script seal.sh ne pré-remplit PAS automatiquement le HTML ; l'édition manuelle
# constitue l'étape de relecture humaine.
$EDITOR site/index.html

# 4. Scellez.
bash build/seal.sh
# Sorties : merkle_root.txt, merkle_root.txt.ots, CID IPFS

# 5. Vérifiez localement.
python3 build/verify.py

# 6. Publiez le manifeste (PAS les documents) sur l'un des canaux suivants :
#    - Un hébergeur statique que vous contrôlez (Cloudflare Pages, GitHub Pages, etc.)
#    - Le réseau IPFS au CID imprimé
#    - Les deux (recommandé)

# 7. Séparément, transmettez les documents sous-jacents au destinataire
#    via un canal sécurisé de votre choix (Signal, SecureDrop, etc.).
#    Le destinataire vérifie les hachages de fichiers par rapport à votre manifeste.
```

## Calcul des hachages pour les véritables fichiers de preuve

Pour hacher un fichier de document avec SHA-256 :

```bash
shasum -a 256 my_document.pdf
```

Les 64 premiers caractères hexadécimaux constituent le SHA-256. Mettez-le
dans le manifeste.

Vous pouvez hacher plusieurs fichiers à la fois :

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Cela vous fournit les données pour `facts/03_evidence_manifest.txt`.

## Notes de sécurité opérationnelle

Le protocole MYRIAM ne fournit PAS de sécurité opérationnelle. Il fournit
une *durabilité probatoire*. Vous avez encore besoin de :

- Un canal de communication sécurisé avec votre avocat
  ([Signal](https://signal.org/), en personne, ou le canal sécurisé établi
  de votre avocat)
- Un emplacement de stockage sécurisé pour les documents sous-jacents
  (chiffrés au repos, pas sur des services en nuage auxquels votre employeur
  pourrait accéder)
- Un appareil propre pour le scellement (un ordinateur portable personnel non
  associé à des comptes d'employeur ; de préférence un appareil utilisé
  uniquement à cette fin)
- Un réseau propre pour la publication (pas le réseau de votre employeur,
  pas votre adresse IP domestique si votre employeur peut adresser une
  réquisition à votre fournisseur d'accès)

Lectures recommandées sur la sécurité opérationnelle pour les lanceurs d'alerte :

- [Documentation SecureDrop de The Intercept](https://securedrop.org/)
- [Ressources de la Freedom of the Press Foundation](https://freedom.press/)
- [Guide d'autodéfense contre la surveillance de l'EFF](https://ssd.eff.org/)

Consultez-les AVANT de commencer le processus de scellement. Le protocole ne
protège pas contre les mauvais choix d'opsec faits avant son invocation.

## Ce que les destinataires doivent savoir

Envoyez aux destinataires ce README accompagné du manifeste scellé. Le
manifeste lui-même contient le protocole du destinataire (FACT 06), mais le
README développe le rôle du destinataire :

- **Journalistes** : vérifiez d'abord l'intégrité du manifeste lui-même.
  Demandez ensuite les documents par un canal sécurisé distinct. Vérifiez
  que le SHA-256 de chaque document correspond au manifeste avant publication.
  NE publiez PAS les documents sans le consentement du lanceur d'alerte ;
  publiez en revanche l'existence du manifeste scellé et la conclusion de
  votre vérification.
- **Autorités de régulation** : même processus de vérification. Le manifeste
  scellé accompagné des documents correspondants constitue la forme
  probatoire la plus solide disponible en dehors d'une collecte formelle
  selon une chaîne de traçabilité.
- **Avocats** : le manifeste scellé fournit un ancrage forensique de
  l'existence des documents au moment indiqué. La question de savoir s'il
  satisfait aux règles probatoires d'une juridiction particulière relève de
  votre appréciation.

## Ce que cette trousse N'EST PAS

- Pas un substitut à un conseil juridique.
- Pas une garantie que quiconque agira sur la base de votre divulgation.
- Pas une protection contre les représailles.
- Pas une authentification du contenu des documents (seulement de leurs
  octets au moment du scellement).
- Pas un moyen de communiquer anonymement avec qui que ce soit — le sceau est
  public ; si le nom de votre principal signataire est réel, vous êtes
  identifié. Même avec un pseudonyme, un manifeste scellé peut servir à
  identifier un lanceur d'alerte si des métadonnées venaient à fuiter ; le
  protocole ne peut pas défendre contre une identification du principal par
  d'autres moyens.

## Conclusion

Un manifeste scellé est une petite chose. C'est un seul flux d'octets qui
prouve qu'un plus grand ensemble de flux d'octets a existé sous une forme
particulière à un moment particulier. Cette petitesse est sa force : elle ne
fait qu'une seule chose, et elle la fait sur toute la durée de vie de la
blockchain Bitcoin.

Si vous lisez ceci parce que vous envisagez de devenir lanceur d'alerte,
s'il vous plaît : parlez d'abord à un avocat. Utilisez les guides de
sécurité opérationnelle ci-dessus. Ensuite, et seulement si toutes ces
considérations en amont sont en ordre, considérez cette trousse comme la
colonne vertébrale cryptographique de votre divulgation. La cryptographie
est la partie facile. Tout ce qui est en amont de la cryptographie, c'est
là que vit le risque réel.

## Licence

Domaine public (CC0). Forkez-la. Améliorez-la. Utilisez-la sans demander
la permission.
