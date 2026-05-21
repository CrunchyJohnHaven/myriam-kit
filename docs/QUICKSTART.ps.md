# چټک پیل

*پښتو ژباړه — د اصلي انګلیسي بڼې لپاره، وګورئ [QUICKSTART.md](QUICKSTART.md)*

له کلون څخه تر مهر شوي خپرونې پنځه دقیقې. په macOS کې ازمول شوی؛ Linux باید
کار وکړي؛ د Windows کاروونکو ته به WSL ته اړتیا وي.

## ۰. مخکینۍ اړتیاوې

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## ۱. د بنسټ جوړول

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## ۲. د حقایقو سمول

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

هر فایل یو حقیقت دی. UTF-8. د LF د کرښې پایونه. د فایل د نوم بڼه
`NN_short_name.txt` ده چېرته چې NN صفر-ډک شوی دی. دوی په لغوي توګه د Merkle
ونې ته ترتیب کیږي، نو 02 تل د 01 وروسته راځي.

نکته: هر حقیقت د *نومونې یا اعلان پېښې* په توګه عبارت کړئ، نه د نړۍ په اړه د
یوې هستي ادعا په توګه. «اکمی شرکت اعلان کړی چې X کڅوړې د Y ازموینه پاس کړې»
د تایید وړ دی. «X کڅوړه خوندي ده» نه ده.

## ۳. د IPFS ډیمن پیل کول (په هرې ماشین کې یو ځل)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## ۴. مهرول

```bash
bash build/seal.sh
```

دا به:
1. هر حقیقت هش کړي (SHA-256)، د Bitcoin-سبک Merkle ریښه محاسبه کړي.
2. ریښه د OpenTimestamps له لارې د دوو خپلواکو کیلنډرونو په وسیله مهر کړي
   (په ډیفالټ توګه alice + finney — د `MYRIAM_CAL_A`/`MYRIAM_CAL_B` له لارې یې پر ځای کړئ).
3. د `site/` لارښود IPFS ته پن کړي او CID وڅاپي.

ټوله: د ګرم IPFS ډیمن سره ~۱۰ ثانیې.

## ۵. د `site/index.html` سمول

د کټ ځای پر ځای کوونکي د خپلو اصلي حقایقو، هشونو، او Merkle ریښې سره بدل کړئ.
د هر حقیقت لپاره ښودل شوي هشونه باید د هر حقیقت فایلونو سره مطابقت ولري،
که نه نو پاڼه د خپل-ځان تایید کې ناکامیږي.

د هر حقیقت لپاره، د .txt فایل بدن یوې `<div class="fact">` بلاک ته کاپي کړئ
او د SHA-256 یوې `<div class="hash">` کې مستقیما د هغه لاندې واچوئ.
د Merkle ریښه د کریپټوګرافیک-مهر برخه کې ځي.

(هو، دا د خود-تولید وړ دی. په قصد سره نه دی: لاسي پړاو د انساني کتنې پړاو
دی. پروتوکول د هغه څه د خپرولو په وړاندې دفاع نه کوي چې تاسو نه دي لوستلي.)

## ۶. په محلي توګه تایید

```bash
python3 build/verify.py
```

تمه شوې پایله:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

«Pending» نورماله ده — د OTS کیلنډر به په څو ساعتونو کې تصدیق یو بشپړ
Bitcoin تصدیق ته اپګریډ کړي.

## ۷. ځای پر ځای کول

د لاندې هر یو وټاکئ:

- **Cloudflare Pages**: ډاشبورډ → Pages → مستقیم اپلوډ → `site/` کش کړئ
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: په `site/` کې `git init`، ریپو ته پوش کړئ، Pages فعال کړئ
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (د سټاټیک کوربه توب فعال)
- **هر ساده VPS**: `scp -r site/* user@host:/var/www/html/`

د ۴ پړاو څخه د IPFS CID تاسو ته یو اضافي د منځپانګې-پته شوی
URL درکوي: `https://<CID>.ipfs.dweb.link/`. وکاروئ یې.

## ۸. د OTS رسید اپګریډ کول (وروسته)

د مهرولو څخه ~څو ساعتونو په دننه کې، وچلوئ:

```bash
ots upgrade build/merkle_root.txt.ots
```

دا د هر کیلنډر په تمه تصدیق یو بشپړ Bitcoin تصدیق بدلوي چې یو ځانګړي
بلاک ته اشاره کوي. د اپګریډ وروسته `.ots` فایل بېرته خپلو کوربانو ته
ځای پر ځای کړئ.

## ۹. همدا دی

تاسو د حقایقو یوه وړه ټولګه په داسې ډول خپره کړې چې هر دریم اړخ کولی شي:

- ستاسو له کوربه څخه د عام HTTP له لارې ټول حقایق ترلاسه کړي
- د حقیقت بایټونو څخه Merkle ریښه بیا محاسبه کړي
- ستاسو له خپرې شوې ریښې سره یې پرتله کړي
- تایید کړي چې ریښه د OTS-مهر شوي وخت کې Bitcoin ته ژمن شوې وه
- په خپلواکه توګه IPFS له لارې د خپرې شوې CID په وسیله ورته حقایق ترلاسه کړي
- تایید کړي چې ټول هشونه مطابقت لري

که د دغو پړاوونو څخه کوم یو ناکام شي، لاسوهنه شوې ده. لوستونکی اړ نه دی چې
پر تاسو باور وکړي. هغه یوازې اړ دی چې ریاضي وکړي.
