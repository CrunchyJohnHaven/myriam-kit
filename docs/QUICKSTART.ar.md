*ترجمة عربية — للنسخة الإنجليزية الأصلية، راجع [QUICKSTART.md](QUICKSTART.md)*

# بداية سريعة

خمس دقائق من الاستنساخ إلى نشر مختوم. مُختبَر على macOS؛ من المتوقّع أن يعمل على Linux؛ أمّا مستخدمو Windows فسيحتاجون إلى WSL.

## 0. المتطلّبات المسبقة

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. السقالة (Scaffold)

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. تحرير الوقائع

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

كلّ ملفّ يمثّل واقعة واحدة. ترميز UTF-8. نهايات الأسطر LF. نمط التسمية هو `NN_short_name.txt` حيث NN عددٌ من رقمين بأصفار سابقة. تُرتَّب هذه الملفّات معجميّاً داخل شجرة Merkle، فيأتي 02 دائماً بعد 01.

ملاحظة: صُغ كلّ واقعة بوصفها *حدث تسمية أو إعلان*، لا بوصفها ادّعاءً وجوديّاً عن العالم. عبارة "أعلنت شركة Acme Corp أنّ الدفعة X اجتازت الفحص Y" قابلة للتحقّق. أمّا عبارة "الدفعة X آمنة" فليست كذلك.

## 3. تشغيل عفريت IPFS (مرّة واحدة لكلّ جهاز)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. الختم

```bash
bash build/seal.sh
```

سيقوم هذا بـ:
1. بصم كلّ واقعة (SHA-256)، وحساب جذر Merkle على نمط Bitcoin.
2. ختم الجذر زمنيّاً عبر OpenTimestamps باستخدام تقويمَين مستقلَّين
   (alice + finney افتراضيّاً — يمكن تجاوزهما عبر `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. تثبيت دليل `site/` على IPFS وطباعة الـ CID.

الإجمالي: نحو 10 ثوانٍ مع عفريت IPFS مُحمَّى مسبقاً.

## 5. تحرير `site/index.html`

استبدل العناصر النائبة في القالب بوقائعك الفعليّة، وبصماتها، وجذر Merkle الخاصّ بها. يجب أن تطابق البصمات المعروضة لكلّ واقعة الملفّاتِ الموافقة لها، وإلاّ ستفشل الصفحة في التحقّق من نفسها.

لكلّ واقعة، انسخ مضمون ملفّ .txt إلى كتلة `<div class="fact">`، وضع قيمة SHA-256 في `<div class="hash">` مباشرة تحتها. أمّا جذر Merkle فيوضَع في قسم الختم التشفيريّ.

(نعم، يمكن أتمتة هذا. لم يُؤتمَت عمداً: فالخطوة اليدويّة هي خطوة المراجعة البشريّة. لا يحمي البروتوكول من نشر شيء لم تقرأه.)

## 6. التحقّق محلّيّاً

```bash
python3 build/verify.py
```

المُخرَج المتوقّع:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

كلمة "Pending" أمر طبيعيّ — سيرفع تقويم OTS الإثباتَ إلى إثبات Bitcoin كامل خلال بضع ساعات.

## 7. النشر

اختر أيّاً ممّا يلي:

- **Cloudflare Pages**: لوحة التحكّم → Pages → Direct upload → اسحب `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` داخل `site/`، ادفع إلى المستودع، فعّل Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (مع تفعيل الاستضافة الساكنة)
- **أيّ خادم VPS عاديّ**: `scp -r site/* user@host:/var/www/html/`

يمنحك الـ CID المستخرَج من IPFS في الخطوة 4 رابطاً إضافيّاً معنوناً بالمحتوى: `https://<CID>.ipfs.dweb.link/`. استخدمه.

## 8. ترقية إيصال OTS (لاحقاً)

خلال بضع ساعات من الختم، نفّذ:

```bash
ots upgrade build/merkle_root.txt.ots
```

يحوّل هذا إثباتَ كلّ تقويمٍ من المُعلَّق إلى إثبات Bitcoin كامل يُشير إلى كتلة محدّدة. أعد نشر ملفّ `.ots` إلى مضيفاتك بعد الترقية.

## 9. وهذا كلّ ما في الأمر

لقد نشرت مجموعة محدودة من الوقائع بصورة تتيح لأيّ طرف ثالث أن:

- يجلب جميع الوقائع عبر HTTP عاديّ من مضيفك
- يُعيد حساب جذر Merkle من بايتات الوقائع
- يقارنه بالجذر المنشور
- يتحقّق من أنّ الجذر التُزِم به على Bitcoin في الوقت الذي ختمه فيه OTS
- يجلب الوقائع نفسها بصورة مستقلّة عبر IPFS باستخدام الـ CID المنشور
- يتأكّد من تطابق جميع البصمات

إذا فشلت أيّ من هذه الخطوات، فقد وقع عبث. لا يحتاج القارئ أن يثق بك. يكفيه أن يجري الحساب.
