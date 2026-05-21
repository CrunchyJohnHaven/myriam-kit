*የአማርኛ ትርጉም — ለመጀመሪያው የእንግሊዝኛ ስሪት፣ ይመልከቱ [QUICKSTART.md](QUICKSTART.md)*

# ፈጣን ጅምር

ከ clone እስከ የታሸገ ምልክተ-ህትመት አምስት ደቂቃ። በ macOS ላይ ተፈትኗል፤ Linux መሥራት
አለበት፤ Windows ተጠቃሚዎች WSL ያስፈልጋቸዋል።

## 0. ቅድመ ሁኔታዎች

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. የመሠረት መዋቅር (Scaffold)

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. ሐቆችን ያርትዑ

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

እያንዳንዱ ፋይል አንድ ሐቅ ነው። UTF-8። LF line endings። የፋይል ስም ቅርጽ
`NN_short_name.txt` ሲሆን፣ NN በ zero የተሞላ ቁጥር ነው። ወደ Merkle tree
በሥርዓተ-ፊደል ይደረደራሉ፣ ስለዚህ 02 ሁልጊዜ ከ 01 በኋላ ይመጣል።

ምክር፦ እያንዳንዱን ሐቅ እንደ *የስያሜ ወይም የመግለጥ ድርጊት* ይግለጹት፣ ስለ ዓለም እንደ
ontological አባባል አይደለም። "Acme Corp ስብስብ X ፍተሻ Y አልፏል ብሎ ገልጧል"
ሊረጋገጥ የሚችል ነው። "ስብስብ X ደህንነቱ የተጠበቀ ነው" አይደለም።

## 3. የ IPFS daemon ይጀምሩ (በማሽን አንድ ጊዜ)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. ይታሸግ

```bash
bash build/seal.sh
```

ይህ ያደርጋል፦
1. እያንዳንዱን ሐቅ hash ያደርጋል (SHA-256)፣ የ Bitcoin-style Merkle root ያሠላል።
2. root-ን በ OpenTimestamps በኩል በሁለት ራሳቸውን የቻሉ ካላንዳሮች ይምታል
   (በነባሪ alice + finney — በ `MYRIAM_CAL_A`/`MYRIAM_CAL_B` በኩል ሊቀየር ይችላል)።
3. የ `site/` ማውጫን ወደ IPFS pin ያደርጋል እና CID ያትማል።

ድምር፦ ሙቅ IPFS daemon ካለ ~10 ሰከንዶች።

## 5. `site/index.html` ያርትዑ

የ template ቦታ-ያዢዎችን በትክክለኛ ሐቆችዎ፣ hashes ዎ እና Merkle root ዎ ይተኩ።
የሚታዩት የእያንዳንዱ-ሐቅ hashes ከእያንዳንዱ-ሐቅ ፋይሎች ጋር መመሳሰል አለባቸው፣
አለበለዚያ ገጹ የራሱን ራስ-ማረጋገጥ ይወድቃል።

ለእያንዳንዱ ሐቅ የ .txt ፋይሉን አካል ወደ `<div class="fact">` block ይቅዱ እና
SHA-256-ን በቀጥታ ከሥሩ ባለ `<div class="hash">` ውስጥ ያስቀምጡ። Merkle root
በ cryptographic-seal ክፍል ይገባል።

(አዎ፣ ይህ ራሱ-በራሱ ሊፈጠር ይችላል። ሆን ተብሎ አይደለም፦ የእጅ ደረጃው የሰው የግምገማ
ደረጃ ነው። ፕሮቶኮሉ ያላነበቡትን ነገር ከማተም አይከላከልዎትም።)

## 6. በአካባቢ ያረጋግጡ

```bash
python3 build/verify.py
```

የሚጠበቅ ውጤት፦
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" መደበኛ ነው — OTS calendar በጥቂት ሰዓታት ውስጥ attestation-ን ወደ
ሙሉ Bitcoin attestation ያሳድጋል።

## 7. ማሰማራት

ከእነዚህ ውስጥ ማንኛውንም ይምረጡ፦

- **Cloudflare Pages**: dashboard → Pages → Direct upload → `site/` ይጎትቱ
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: በ `site/` ውስጥ `git init`፣ ወደ repo push ያድርጉ፣ Pages ያንቁ
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting on)
- **ማንኛውም ተራ VPS**: `scp -r site/* user@host:/var/www/html/`

ከደረጃ 4 የተገኘው IPFS CID ተጨማሪ content-addressed URL ይሰጥዎታል፦
`https://<CID>.ipfs.dweb.link/`። ይጠቀሙበት።

## 8. የ OTS ደረሰኝ ያሳድጉ (በኋላ)

ከታሸገ በኋላ ~በጥቂት ሰዓታት ውስጥ፦

```bash
ots upgrade build/merkle_root.txt.ots
```

ይህ የእያንዳንዱን calendar pending attestation ወደ ሙሉ Bitcoin attestation
ይቀይራል፣ ይህም ወደ ልዩ ብሎክ ይያያዛል። ካሳደጉ በኋላ `.ots` ፋይሉን እንደገና ወደ
አስተናጋጆችዎ ያሰማሩ።

## 9. ይኼው ነው

አንድ አነስተኛ የሐቅ ስብስብን አሳትመዋል፣ ይህም ማንኛውም ሦስተኛ ወገን፦

- ሁሉንም ሐቆች ከአስተናጋጅዎ በተራ HTTP በኩል ሊወስድ ይችላል
- Merkle root-ን ከሐቅ bytes ሊያሠላ ይችላል
- ካተሙት root ጋር ሊያወዳድር ይችላል
- root በ OTS-stamped ጊዜ ለ Bitcoin እንደተገባ ሊያረጋግጥ ይችላል
- በታተመው CID ላይ ተመሳሳዮቹን ሐቆች በ IPFS በኩል ራሱን-ችሎ ሊወስድ ይችላል
- ሁሉም hashes እንደሚመሳሰሉ ሊያረጋግጥ ይችላል

ከእነዚህ ደረጃዎች ማንኛውም ካልተሳካ፣ መጣረስ ተከስቷል። አንባቢው እርስዎን ማመን
አያስፈልገውም። ሒሳቡን ብቻ ማድረግ አለበት።
