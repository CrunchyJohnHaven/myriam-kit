*اردو ترجمہ — اصل انگریزی نسخے کے لیے [QUICKSTART.md](QUICKSTART.md) / [SPEC.md](SPEC.md) دیکھیں*

# فوری آغاز

clone سے مہر بند اشاعت تک پانچ منٹ۔ macOS پر آزمایا گیا؛ Linux پر کام کرنا چاہیے؛ Windows صارفین کو WSL کی ضرورت ہوگی۔

## 0. پیشگی شرائط

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. ڈھانچہ تیار کریں

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. حقائق میں ترمیم کریں

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

ہر فائل ایک حقیقت ہے۔ UTF-8۔ LF لائن اینڈنگز۔ فائل نام کا نمونہ `NN_short_name.txt` ہے جہاں NN صفر کے ساتھ پیڈ کیا گیا ہے۔ انہیں Merkle درخت میں lexicographic ترتیب میں شامل کیا جاتا ہے، لہٰذا 02 ہمیشہ 01 کے بعد آتا ہے۔

نکتہ: ہر حقیقت کو *نام رکھنے یا اعلان کے واقعے* کے طور پر بیان کریں، نہ کہ دنیا کے بارے میں کسی وجودی دعوے کے طور پر۔ "Acme Corp نے اعلان کیا ہے کہ بیچ X نے ٹیسٹ Y پاس کیا" قابلِ تصدیق ہے۔ "بیچ X محفوظ ہے" نہیں ہے۔

## 3. IPFS daemon شروع کریں (ہر مشین پر ایک بار)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. مہر بند کریں

```bash
bash build/seal.sh
```

یہ کرے گا:
1. ہر حقیقت کو ہیش کرے گا (SHA-256)، Bitcoin طرز کی Merkle جڑ کا حساب کرے گا۔
2. جڑ کو OpenTimestamps کے ذریعے دو آزاد کیلنڈرز سے اسٹیمپ کرے گا
   (پہلے سے طے شدہ alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B` کے ذریعے override کریں)۔
3. `site/` ڈائریکٹری کو IPFS پر پن کرے گا اور CID پرنٹ کرے گا۔

کل: گرم IPFS daemon کے ساتھ ~10 سیکنڈ۔

## 5. `site/index.html` میں ترمیم کریں

ٹیمپلیٹ کے placeholders کو اپنے اصل حقائق، ہیشز، اور Merkle جڑ سے بدلیں۔ دکھائے گئے فی حقیقت ہیشز فی حقیقت فائلوں سے میل کھانے چاہئیں، ورنہ صفحہ اپنی خود کی تصدیق میں ناکام ہو جائے گا۔

ہر حقیقت کے لیے، .txt فائل کا بدن `<div class="fact">` بلاک میں کاپی کریں اور اس کے بالکل نیچے ایک `<div class="hash">` میں SHA-256 رکھیں۔ Merkle جڑ cryptographic-seal سیکشن میں جاتی ہے۔

(جی ہاں، یہ خودکار طور پر تیار ہو سکتا ہے۔ یہ جان بوجھ کر نہیں ہے: دستی قدم انسانی جائزے کا قدم ہے۔ پروٹوکول اس چیز کی اشاعت کے خلاف تحفظ فراہم نہیں کرتا جو آپ نے نہیں پڑھی۔)

## 6. مقامی طور پر تصدیق کریں

```bash
python3 build/verify.py
```

متوقع آؤٹ پٹ:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" معمول کی بات ہے — OTS کیلنڈر چند گھنٹوں کے اندر تصدیق کو مکمل Bitcoin تصدیق میں اپ گریڈ کر دے گا۔

## 7. تعینات کریں

ان میں سے کوئی بھی منتخب کریں:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → `site/` کو drag کریں
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/` میں `git init` کریں، repo پر push کریں، Pages فعال کریں
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting آن کر کے)
- **کوئی بھی سادہ VPS**: `scp -r site/* user@host:/var/www/html/`

مرحلہ 4 کا IPFS CID آپ کو ایک اضافی content-addressed URL دیتا ہے: `https://<CID>.ipfs.dweb.link/`۔ اسے استعمال کریں۔

## 8. OTS رسید کو اپ گریڈ کریں (بعد میں)

مہر بند کرنے کے ~چند گھنٹوں کے اندر، چلائیں:

```bash
ots upgrade build/merkle_root.txt.ots
```

یہ ہر کیلنڈر کی pending تصدیق کو ایک مکمل Bitcoin تصدیق میں تبدیل کرتا ہے جو ایک مخصوص block کا حوالہ دیتی ہے۔ اپ گریڈ کرنے کے بعد `.ots` فائل کو اپنے میزبانوں پر دوبارہ تعینات کریں۔

## 9. بس اتنا ہی

آپ نے حقائق کا ایک چھوٹا سا مجموعہ اس طرح شائع کیا ہے کہ کوئی بھی تیسرا فریق:

- آپ کے میزبان سے سادہ HTTP کے ذریعے تمام حقائق حاصل کر سکتا ہے
- حقیقت کے bytes سے Merkle جڑ کا دوبارہ حساب کر سکتا ہے
- آپ کی شائع کردہ جڑ سے موازنہ کر سکتا ہے
- تصدیق کر سکتا ہے کہ جڑ OTS اسٹیمپ شدہ وقت پر Bitcoin پر commit کی گئی تھی
- IPFS کے ذریعے شائع کردہ CID پر وہی حقائق آزادانہ طور پر حاصل کر سکتا ہے
- تصدیق کر سکتا ہے کہ تمام ہیشز میل کھاتے ہیں

اگر ان میں سے کوئی بھی مرحلہ ناکام ہوتا ہے، تو تبدیلی ہوئی ہے۔ قاری کو آپ پر بھروسہ کرنے کی ضرورت نہیں۔ اسے بس ریاضی کرنی ہے۔
