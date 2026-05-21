*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [QUICKSTART.md](QUICKSTART.md)*

# Pika-aloitus

Viisi minuuttia kloonista sinetöityyn julkaisuun. Testattu macOS:ssä; Linuxin
pitäisi toimia; Windows-käyttäjät tarvitsevat WSL:n.

## 0. Esivaatimukset

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Luo runko

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Muokkaa tosiasioita

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Jokainen tiedosto on yksi tosiasia. UTF-8. LF-rivinvaihdot. Tiedostonimen kaava
on `NN_short_name.txt`, jossa NN on nollalla täytetty. Ne lajitellaan
leksikografisesti Merkle-puuhun, joten 02 tulee aina 01:n jälkeen.

Vinkki: muotoile jokainen tosiasia *nimeämis- tai julistustapahtumana*,
ei ontologisena väitteenä maailmasta. "Acme Corp on ilmoittanut, että erä X
läpäisi testin Y" on todennettavissa. "Erä X on turvallinen" ei ole.

## 3. Käynnistä IPFS-demoni (kerran konetta kohden)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Sinetöi

```bash
bash build/seal.sh
```

Tämä:
1. Hashaa jokaisen tosiasian (SHA-256), laskee Bitcoin-tyylisen Merkle-juuren.
2. Leimaa juuren OpenTimestampsilla kahta itsenäistä kalenteria vasten
   (oletuksena alice + finney — ohita ympäristömuuttujilla `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Pinnaa `site/`-hakemiston IPFS:ään ja tulostaa CID:n.

Yhteensä: ~10 sekuntia lämpimällä IPFS-demonilla.

## 5. Muokkaa `site/index.html`-tiedostoa

Korvaa mallipohjan paikkamerkit todellisilla tosiasioillasi, hasheilla ja
Merkle-juurellasi. Näkyvien tosiasiakohtaisten hashien on vastattava
tosiasiatiedostoja, muuten sivu epäonnistuu omassa itseverifikaatiossaan.

Jokaista tosiasiaa kohden, kopioi .txt-tiedoston runko `<div class="fact">`-lohkoon
ja laita SHA-256 suoraan sen alle olevaan `<div class="hash">`-elementtiin.
Merkle-juuri menee kryptografisen sinetöinnin osioon.

(Kyllä, tämä voitaisiin generoida automaattisesti. Sitä ei tehdä,
tarkoituksella: manuaalinen vaihe on ihmistarkastusvaihe. Protokolla ei
suojaa siltä, että julkaiset jotain, jota et ole lukenut.)

## 6. Todenna paikallisesti

```bash
python3 build/verify.py
```

Odotettu tuloste:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" on normaalia — OTS-kalenteri päivittää attestaation
täydeksi Bitcoin-attestaatioksi muutaman tunnin kuluessa.

## 7. Käyttöönotto

Valitse mikä tahansa seuraavista:

- **Cloudflare Pages**: hallintapaneeli → Pages → Direct upload → vedä `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` hakemistossa `site/`, työnnä repoon, ota Pages käyttöön
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (staattinen hosting päällä)
- **Mikä tahansa tavallinen VPS**: `scp -r site/* user@host:/var/www/html/`

Vaiheen 4 IPFS-CID antaa sinulle lisäksi sisältöosoitetun
URL:n: `https://<CID>.ipfs.dweb.link/`. Käytä sitä.

## 8. Päivitä OTS-kuitti (myöhemmin)

Noin muutaman tunnin sisällä sinetöinnistä, suorita:

```bash
ots upgrade build/merkle_root.txt.ots
```

Tämä muuntaa kunkin kalenterin odottavan attestaation täydeksi
Bitcoin-attestaatioksi, joka viittaa tiettyyn lohkoon. Käytä `.ots`-tiedosto
uudelleen palvelimillesi päivityksen jälkeen.

## 9. Siinä se

Olet julkaissut pienen joukon tosiasioita tavalla, jolla mikä tahansa
kolmas osapuoli voi:

- Hakea kaikki tosiasiat tavallisen HTTP:n yli isäntäsi palvelimelta
- Laskea Merkle-juuren uudelleen tosiasioiden bittijonoista
- Verrata julkaisemaasi juureen
- Todentaa, että juuri sitoutettiin Bitcoiniin OTS-leimatulla hetkellä
- Riippumattomasti hakea samat tosiasiat IPFS:n kautta julkaistulla CID:llä
- Vahvistaa, että kaikki hashit täsmäävät

Jos jokin näistä vaiheista epäonnistuu, on tapahtunut peukalointi. Lukijan ei
tarvitse luottaa sinuun. Hänen tarvitsee vain tehdä laskutoimitukset.
