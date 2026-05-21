# Quickstart

*मराठी भाषांतर — मूळ इंग्रजी आवृत्तीसाठी, पहा [QUICKSTART.md](QUICKSTART.md)*

क्लोनपासून मुद्रांकित प्रकाशनापर्यंत पाच मिनिटे. macOS-चाचणी झालेले; Linux ने
कार्य करावे; Windows वापरकर्त्यांना WSL आवश्यक असेल.

## 0. पूर्वावश्यकता

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. आराखडा (Scaffold)

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. तथ्ये संपादित करा

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

प्रत्येक फाईल एक तथ्य आहे. UTF-8. LF ओळ-अंत. फाईलनावाचा आकृतिबंध
`NN_short_name.txt` आहे जिथे NN शून्य-पॅड केलेले आहे. त्यांना Merkle वृक्षात
शब्दकोश-क्रमाने (lexicographically) क्रमवारी लावले जाते, त्यामुळे 02 नेहमी 01
नंतर येतो.

टीप: प्रत्येक तथ्य एका *नामकरण किंवा घोषणा घटना* म्हणून मांडा, जगाबद्दलच्या
सत्तामीमांसक (ontological) दावा म्हणून नव्हे. "Acme Corp ने घोषित केले आहे
की बॅच X ने चाचणी Y उत्तीर्ण केली" हे पडताळणीयोग्य आहे. "बॅच X सुरक्षित आहे"
हे नाही.

## 3. IPFS daemon सुरू करा (प्रति मशीन एकदा)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. मुद्रांकित करा (Seal)

```bash
bash build/seal.sh
```

हे पुढील गोष्टी करेल:
1. प्रत्येक तथ्याचा हॅश काढेल (SHA-256), Bitcoin-शैलीतील Merkle मूळ मोजेल.
2. दोन स्वतंत्र कॅलेंडरांद्वारे (मूलतः alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B`
   द्वारे ओव्हरराइड करा) OpenTimestamps सह मुळावर मुद्रांक मारेल.
3. `site/` डिरेक्टरीला IPFS वर पिन करेल आणि CID छापेल.

एकूण: उष्ण IPFS daemon सह ~10 सेकंद.

## 5. `site/index.html` संपादित करा

टेम्पलेटमधील जागाधारकांना (placeholders) आपल्या प्रत्यक्ष तथ्ये, हॅश आणि
Merkle मुळासह बदला. प्रदर्शित प्रति-तथ्य हॅशांनी प्रति-तथ्य फाईलींशी जुळले
पाहिजे, अन्यथा पान त्याच्या स्वतःच्या स्व-पडताळणीत अपयशी ठरते.

प्रत्येक तथ्यासाठी, .txt फाईलचा मजकूर एका `<div class="fact">` ब्लॉकमध्ये कॉपी
करा आणि SHA-256 थेट त्याखाली एका `<div class="hash">` मध्ये ठेवा. Merkle मूळ
cryptographic-seal विभागात जाते.

(होय, हे स्वयंचलितपणे जनरेट केले जाऊ शकते. ते हेतुपुरस्सर नाही: हस्तचलित पायरी
ही मानवी पुनरावलोकनाची पायरी आहे. आपण न वाचलेले काही प्रकाशित केल्याविरुद्ध
प्रोटोकॉल संरक्षण देत नाही.)

## 6. स्थानिकरित्या पडताळणी करा

```bash
python3 build/verify.py
```

अपेक्षित आउटपुट:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" सामान्य आहे — OTS कॅलेंडर काही तासांत साक्षांकनाला पूर्ण Bitcoin
साक्षांकनात श्रेणीसुधारित करेल.

## 7. तैनाती (Deploy)

खालीलपैकी कोणतेही निवडा:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → `site/` ओढून सोडा
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/` मध्ये `git init`, repo वर push, Pages सक्षम करा
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting चालू)
- **कोणताही साधा VPS**: `scp -r site/* user@host:/var/www/html/`

पायरी 4 मधील IPFS CID आपणास एक अतिरिक्त आशय-पत्ता-आधारित URL देतो:
`https://<CID>.ipfs.dweb.link/`. त्याचा वापर करा.

## 8. OTS पावती श्रेणीसुधारित करा (नंतर)

मुद्रांकनानंतर ~काही तासांत, चालवा:

```bash
ots upgrade build/merkle_root.txt.ots
```

हे प्रत्येक कॅलेंडरच्या प्रलंबित साक्षांकनाला एका विशिष्ट ब्लॉकचा संदर्भ
देणाऱ्या पूर्ण Bitcoin साक्षांकनात रूपांतरित करते. श्रेणीसुधारणेनंतर `.ots` फाईल
आपल्या होस्टांवर पुन्हा तैनात करा.

## 9. इतकेच

आपण तथ्यांचा एक लहान संच अशा प्रकारे प्रकाशित केला आहे की कोणताही तृतीय
पक्ष हे करू शकतो:

- आपल्या होस्टकडून साध्या HTTP द्वारे सर्व तथ्ये आणणे
- तथ्य-बाइटसमधून Merkle मूळ पुन्हा मोजणे
- आपल्या प्रकाशित मुळाशी तुलना करणे
- मूळ हे OTS-मुद्रांकित वेळी Bitcoin वर बांधले गेले होते याची पडताळणी करणे
- प्रकाशित CID वर IPFS द्वारे स्वतंत्रपणे तीच तथ्ये आणणे
- सर्व हॅश जुळतात याची पुष्टी करणे

यांपैकी कोणतीही पायरी अपयशी ठरल्यास, छेडछाड झाली आहे. वाचकाला आपल्यावर
विश्वास ठेवण्याची गरज नाही. त्यांना फक्त गणित करावे लागते.
