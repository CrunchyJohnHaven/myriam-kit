# Quickstart

*বাংলা অনুবাদ — মূল ইংরেজি সংস্করণের জন্য [QUICKSTART.md](QUICKSTART.md) দেখুন*

ক্লোন থেকে সিল-করা প্রকাশনা পর্যন্ত পাঁচ মিনিট। macOS-এ পরীক্ষিত; Linux-এ কাজ করার কথা; Windows ব্যবহারকারীদের WSL প্রয়োজন হবে।

## ০. পূর্বশর্ত

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## ১. স্ক্যাফোল্ড

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## ২. তথ্য সম্পাদনা করুন

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

প্রতিটি ফাইল একটি তথ্য। UTF-8। LF লাইন এন্ডিং। ফাইলনামের প্যাটার্ন হলো `NN_short_name.txt` যেখানে NN হলো শূন্য-প্যাডেড। সেগুলিকে Merkle ট্রিতে অভিধানিক (lexicographic) ক্রমে সাজানো হয়, তাই 02 সর্বদা 01-এর পরে আসে।

পরামর্শ: প্রতিটি তথ্যকে একটি *নামকরণ বা ঘোষণা ঘটনা* হিসেবে প্রকাশ করুন, পৃথিবী সম্পর্কে কোনো অস্তিত্বমূলক (ontological) দাবি হিসেবে নয়। "Acme Corp ঘোষণা করেছে যে batch X পরীক্ষা Y উত্তীর্ণ হয়েছে" যাচাইযোগ্য। "Batch X নিরাপদ" নয়।

## ৩. IPFS ডিমন শুরু করুন (প্রতি মেশিনে একবার)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## ৪. সিল করুন

```bash
bash build/seal.sh
```

এটি করবে:
1. প্রতিটি তথ্য হ্যাশ করবে (SHA-256), Bitcoin-স্টাইলের Merkle root গণনা করবে।
2. দুটি স্বাধীন ক্যালেন্ডারের মাধ্যমে OpenTimestamps দিয়ে রুট স্ট্যাম্প করবে (ডিফল্টভাবে alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B` দিয়ে পরিবর্তন করুন)।
3. `site/` ডিরেক্টরিটি IPFS-এ পিন করবে এবং CID প্রিন্ট করবে।

মোট: গরম IPFS ডিমন থাকলে ~১০ সেকেন্ড।

## ৫. `site/index.html` সম্পাদনা করুন

টেমপ্লেট প্লেসহোল্ডারগুলি আপনার প্রকৃত তথ্য, হ্যাশ এবং Merkle root দিয়ে প্রতিস্থাপন করুন। প্রদর্শিত প্রতি-তথ্য হ্যাশগুলি অবশ্যই প্রতি-তথ্য ফাইলগুলির সঙ্গে মিলতে হবে, না হলে পৃষ্ঠাটি তার নিজস্ব স্ব-যাচাইকরণে ব্যর্থ হবে।

প্রতিটি তথ্যের জন্য, .txt ফাইলের বডিটি একটি `<div class="fact">` ব্লকে কপি করুন এবং সরাসরি তার নিচে একটি `<div class="hash">`-এ SHA-256 রাখুন। Merkle root যায় cryptographic-seal বিভাগে।

(হ্যাঁ, এটি স্বয়ংক্রিয়ভাবে তৈরি করা যেতে পারে। ইচ্ছাকৃতভাবে তা করা হয়নি: ম্যানুয়াল ধাপটি মানব-পর্যালোচনা ধাপ। প্রোটোকল আপনি না-পড়া কিছু প্রকাশ করার বিরুদ্ধে রক্ষা করে না।)

## ৬. স্থানীয়ভাবে যাচাই করুন

```bash
python3 build/verify.py
```

প্রত্যাশিত আউটপুট:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" স্বাভাবিক — OTS ক্যালেন্ডার কয়েক ঘণ্টার মধ্যে অ্যাটেস্টেশনটিকে পূর্ণাঙ্গ Bitcoin অ্যাটেস্টেশনে আপগ্রেড করবে।

## ৭. ডিপ্লয় করুন

যেকোনো একটি বেছে নিন:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → `site/` টেনে আনুন
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/`-এ `git init`, রিপোতে পুশ করুন, Pages সক্রিয় করুন
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (স্ট্যাটিক হোস্টিং চালু)
- **যেকোনো সাধারণ VPS**: `scp -r site/* user@host:/var/www/html/`

ধাপ ৪-এর IPFS CID আপনাকে একটি অতিরিক্ত কনটেন্ট-অ্যাড্রেসড URL দেয়: `https://<CID>.ipfs.dweb.link/`। এটি ব্যবহার করুন।

## ৮. OTS রসিদ আপগ্রেড করুন (পরে)

সিল করার ~কয়েক ঘণ্টার মধ্যে, চালান:

```bash
ots upgrade build/merkle_root.txt.ots
```

এটি প্রতিটি ক্যালেন্ডারের পেন্ডিং অ্যাটেস্টেশনকে একটি পূর্ণাঙ্গ Bitcoin অ্যাটেস্টেশনে রূপান্তর করে যা একটি নির্দিষ্ট ব্লকের রেফারেন্স দেয়। আপগ্রেড করার পর `.ots` ফাইলটি আপনার হোস্টগুলিতে পুনরায় ডিপ্লয় করুন।

## ৯. ব্যস, এটাই

আপনি অল্প কিছু তথ্য এমনভাবে প্রকাশ করেছেন যে যেকোনো তৃতীয় পক্ষ:

- আপনার হোস্ট থেকে সাধারণ HTTP-এর মাধ্যমে সমস্ত তথ্য আনতে পারবে
- তথ্য বাইট থেকে Merkle root পুনরায় গণনা করতে পারবে
- আপনার প্রকাশিত রুটের সঙ্গে তুলনা করতে পারবে
- OTS-স্ট্যাম্পড সময়ে রুটটি Bitcoin-এ কমিট করা হয়েছিল তা যাচাই করতে পারবে
- প্রকাশিত CID-এ IPFS-এর মাধ্যমে স্বাধীনভাবে একই তথ্য আনতে পারবে
- সমস্ত হ্যাশ মিলেছে কিনা নিশ্চিত করতে পারবে

এদের কোনোটি যদি ব্যর্থ হয়, বিকৃতি ঘটেছে। পাঠককে আপনাকে বিশ্বাস করতে হবে না। তাদের শুধু গণিতটা করতে হবে।
