*Traduction française — pour la version originale en anglais, voir [QUICKSTART.md](QUICKSTART.md)*

# Démarrage rapide

Cinq minutes du clonage jusqu'à la publication scellée. Testé sur macOS ;
devrait fonctionner sous Linux ; les utilisateurs de Windows auront besoin de WSL.

## 0. Prérequis

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Échafaudage

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Éditer les faits

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Chaque fichier est un fait. UTF-8. Fins de ligne LF. Le motif de nommage des
fichiers est `NN_short_name.txt` où NN est rempli de zéros à gauche. Ils sont
triés par ordre lexicographique dans l'arbre de Merkle, donc 02 vient toujours
après 01.

Astuce : formulez chaque fait comme un *événement de nommage ou de déclaration*,
et non comme une affirmation ontologique sur le monde. « Acme Corp a déclaré que
le lot X a passé le test Y » est vérifiable. « Le lot X est sûr » ne l'est pas.

## 3. Démarrer le démon IPFS (une fois par machine)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Sceller

```bash
bash build/seal.sh
```

Cela va :
1. Hacher chaque fait (SHA-256), calculer la racine de Merkle de style Bitcoin.
2. Horodater la racine via OpenTimestamps avec deux calendriers indépendants
   (alice + finney par défaut — surchargeables via `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Épingler le répertoire `site/` sur IPFS et afficher le CID.

Total : ~10 secondes avec un démon IPFS déjà chaud.

## 5. Éditer `site/index.html`

Remplacez les espaces réservés du gabarit par vos véritables faits, hachages et
racine de Merkle. Les hachages par fait affichés doivent correspondre aux
fichiers de faits, sinon la page échouera à sa propre auto-vérification.

Pour chaque fait, copiez le corps du fichier .txt dans un bloc
`<div class="fact">` et placez le SHA-256 dans un `<div class="hash">`
directement en dessous. La racine de Merkle va dans la section du sceau
cryptographique.

(Oui, cela pourrait être auto-généré. Cela ne l'est pas, délibérément : l'étape
manuelle est l'étape de relecture humaine. Le protocole ne vous protège pas
contre la publication de quelque chose que vous n'avez pas lu.)

## 6. Vérifier localement

```bash
python3 build/verify.py
```

Sortie attendue :
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

Le « Pending » est normal — le calendrier OTS mettra à niveau l'attestation pour
en faire une attestation Bitcoin complète d'ici quelques heures.

## 7. Déployer

Choisissez l'un des suivants :

- **Cloudflare Pages** : tableau de bord → Pages → Téléversement direct → glisser `site/`
- **Netlify** : `netlify deploy --dir=site --prod`
- **GitHub Pages** : `git init` dans `site/`, pousser vers le dépôt, activer Pages
- **S3** : `aws s3 sync site/ s3://your-bucket/ --delete` (hébergement statique activé)
- **N'importe quel VPS basique** : `scp -r site/* user@host:/var/www/html/`

Le CID IPFS issu de l'étape 4 vous donne une URL supplémentaire à adressage par
contenu : `https://<CID>.ipfs.dweb.link/`. Utilisez-la.

## 8. Mettre à niveau le reçu OTS (ultérieurement)

Dans les ~quelques heures suivant le scellement, exécutez :

```bash
ots upgrade build/merkle_root.txt.ots
```

Cela convertit l'attestation en attente de chaque calendrier en une attestation
Bitcoin complète qui référence un bloc précis. Redéployez le fichier `.ots`
chez vos hébergeurs après la mise à niveau.

## 9. C'est tout

Vous avez publié un petit ensemble de faits d'une manière qui permet à tout
tiers de :

- Récupérer tous les faits par simple HTTP depuis votre hébergeur
- Recalculer la racine de Merkle à partir des octets des faits
- La comparer à votre racine publiée
- Vérifier que la racine a été inscrite dans Bitcoin à l'instant horodaté par OTS
- Récupérer indépendamment les mêmes faits via IPFS au CID publié
- Confirmer que tous les hachages correspondent

Si l'une de ces étapes échoue, il y a eu altération. Le lecteur n'a pas besoin
de vous faire confiance. Il lui suffit de faire les calculs.
