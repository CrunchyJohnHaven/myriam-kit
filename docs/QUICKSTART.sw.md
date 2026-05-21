*Tafsiri ya Kiswahili — kwa toleo asili la Kiingereza, tazama [QUICKSTART.md](QUICKSTART.md)*

# Anza Haraka

Dakika tano kutoka kuunduzi hadi chapisho lililotiwa muhuri. Imejaribiwa kwenye macOS;
Linux inapaswa kufanya kazi; watumiaji wa Windows watahitaji WSL.

## 0. Mahitaji ya kabla

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Andaa muundo

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Hariri ukweli

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Kila faili ni ukweli mmoja. UTF-8. Mwisho wa mstari wa LF. Mtindo wa jina la faili ni
`NN_short_name.txt` ambapo NN ni nambari ya tarakimu mbili zilizojaza sufuri. Zinapangwa
kileksikografia katika mti wa Merkle, hivyo 02 huja daima baada ya 01.

Kidokezo: andaa kila ukweli kama *tukio la kutaja au tangazo*, si kama
dai la kiontolojia kuhusu ulimwengu. "Acme Corp imetangaza kuwa bechi X
imepitisha jaribio Y" inaweza kuthibitishwa. "Bechi X ni salama" haiwezi.

## 3. Anzisha daemon ya IPFS (mara moja kwa kila mashine)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Tia muhuri

```bash
bash build/seal.sh
```

Hii itafanya:
1. Kuhashi kila ukweli (SHA-256), kuhesabu mzizi wa Merkle wa mtindo wa Bitcoin.
2. Kupiga muhuri wa wakati kwa mzizi kupitia OpenTimestamps kwa kalenda mbili huru
   (alice + finney kwa chaguo-msingi — badilisha kupitia `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Kubandika saraka ya `site/` kwenye IPFS na kuchapisha CID.

Jumla: ~sekunde 10 ikiwa na daemon ya IPFS iliyo tayari.

## 5. Hariri `site/index.html`

Badilisha vishika-nafasi vya kiolezo na ukweli wako halisi, hashi, na
mzizi wa Merkle. Hashi za kila ukweli zinazoonyeshwa lazima zilingane na faili za kila ukweli,
au ukurasa utashindwa kujithibitisha wenyewe.

Kwa kila ukweli, nakili maudhui ya faili ya .txt kwenye block ya `<div class="fact">`
na uweke SHA-256 katika `<div class="hash">` chini yake moja kwa moja.
Mzizi wa Merkle huenda katika sehemu ya muhuri-wa-kriptografia.

(Ndiyo, hii ingeweza kuzalishwa kiotomatiki. Haifanyiki hivyo, kwa makusudi: hatua
ya mwongozo ni hatua ya ukaguzi wa kibinadamu. Protokali hailindi
dhidi ya kuchapisha kitu ambacho hujakisoma.)

## 6. Thibitisha kwa ndani

```bash
python3 build/verify.py
```

Matokeo yanayotarajiwa:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" ni kawaida — kalenda ya OTS itainua uthibitisho hadi
uthibitisho kamili wa Bitcoin ndani ya saa chache.

## 7. Peleka

Chagua yoyote ya hizi:

- **Cloudflare Pages**: dashibodi → Pages → Direct upload → kokota `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` katika `site/`, sukuma kwa repo, washa Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (mwenyeji tuli umewashwa)
- **VPS yoyote ya kawaida**: `scp -r site/* user@host:/var/www/html/`

CID ya IPFS kutoka hatua ya 4 inakupa URL ya ziada yenye anwani ya
maudhui: `https://<CID>.ipfs.dweb.link/`. Itumie.

## 8. Inua risiti ya OTS (baadaye)

Ndani ya saa chache za kutia muhuri, endesha:

```bash
ots upgrade build/merkle_root.txt.ots
```

Hii inageuza uthibitisho unaosubiri wa kila kalenda kuwa uthibitisho
kamili wa Bitcoin unaorejea kwa block maalum. Peleka tena faili ya `.ots`
kwa wenyeji wako baada ya kuinua.

## 9. Hiyo ndio yote

Umechapisha seti ndogo ya ukweli kwa namna ambayo mtu yeyote wa nje anaweza:

- Kupata ukweli wote kupitia HTTP ya kawaida kutoka kwa mwenyeji wako
- Kuhesabu upya mzizi wa Merkle kutoka kwa baiti za ukweli
- Kulinganisha na mzizi wako uliochapishwa
- Kuthibitisha kuwa mzizi ulijitolea kwa Bitcoin kwa wakati uliotiwa muhuri wa OTS
- Kupata ukweli huo huo kwa kujitegemea kupitia IPFS kwenye CID iliyochapishwa
- Kuthibitisha kuwa hashi zote zinalingana

Ikiwa hatua yoyote ya hizo itashindwa, kuingiliwa kumetokea. Msomaji hahitaji
kukuamini. Wanahitaji tu kufanya hisabati.
