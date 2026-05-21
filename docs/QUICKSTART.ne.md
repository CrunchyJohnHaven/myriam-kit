*नेपाली अनुवाद — मूल अङ्ग्रेजी संस्करणको लागि, हेर्नुहोस् [QUICKSTART.md](QUICKSTART.md)*

# छिटो सुरुवात

क्लोनदेखि छाप लगाइएको प्रकाशनसम्म पाँच मिनेट। macOS मा परीक्षण गरिएको; Linux ले काम गर्नुपर्छ; Windows प्रयोगकर्ताहरूलाई WSL चाहिनेछ।

## 0. पूर्व आवश्यकताहरू

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Scaffold

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. तथ्यहरू सम्पादन गर्नुहोस्

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

प्रत्येक फाइल एउटा तथ्य हो। UTF-8। LF लाइन अन्त्य। फाइल नाम ढाँचा `NN_short_name.txt` हो जहाँ NN शून्य-प्याडेड छ। तिनीहरू Merkle tree मा शब्दकोश क्रमानुसार छानिन्छन्, त्यसैले 02 सधैँ 01 पछि आउँछ।

सुझाव: प्रत्येक तथ्यलाई संसारको बारेमा ontological दावी नभई *नामकरण वा घोषणा घटना*को रूपमा अभिव्यक्त गर्नुहोस्। "Acme Corp ले ब्याच X ले परीक्षण Y पास गरेको घोषणा गरेको छ" प्रमाणीकरण योग्य छ। "ब्याच X सुरक्षित छ" होइन।

## 3. IPFS daemon सुरु गर्नुहोस् (प्रति यन्त्र एक पटक)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. छाप लगाउनुहोस्

```bash
bash build/seal.sh
```

यसले:
1. प्रत्येक तथ्यलाई hash गर्छ (SHA-256), Bitcoin-शैलीको Merkle root गणना गर्छ।
2. दुई स्वतन्त्र क्यालेन्डरसँग (पूर्वनिर्धारित रूपमा alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B` मार्फत override गर्नुहोस्) OpenTimestamps मार्फत root लाई stamp गर्छ।
3. `site/` डाइरेक्टरीलाई IPFS मा pin गर्छ र CID प्रिन्ट गर्छ।

जम्मा: न्यानो IPFS daemon सँग ~10 सेकेन्ड।

## 5. `site/index.html` सम्पादन गर्नुहोस्

टेम्प्लेट प्लेसहोल्डरहरूलाई आफ्ना वास्तविक तथ्यहरू, hashes, र Merkle root सँग प्रतिस्थापन गर्नुहोस्। देखाइएका प्रति-तथ्य hashes प्रति-तथ्य फाइलहरूसँग मेल खानुपर्छ, नभए पृष्ठ आफ्नै स्व-प्रमाणीकरणमा असफल हुन्छ।

प्रत्येक तथ्यका लागि, .txt फाइलको body लाई `<div class="fact">` block मा कपी गर्नुहोस् र ठीक तल `<div class="hash">` मा SHA-256 राख्नुहोस्। Merkle root cryptographic-seal खण्डमा जान्छ।

(हो, यो स्वतः-उत्पन्न गर्न सकिन्थ्यो। यो जानाजानी होइन: म्यानुअल चरण नै मानव समीक्षा चरण हो। प्रोटोकोलले तपाईंले नपढेको केही प्रकाशन गर्नबाट तपाईंलाई बचाउँदैन।)

## 6. स्थानीय रूपमा प्रमाणीकरण गर्नुहोस्

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

"Pending" सामान्य हो — OTS क्यालेन्डरले केही घण्टाभित्र प्रमाणीकरणलाई पूर्ण Bitcoin प्रमाणीकरणमा अपग्रेड गर्नेछ।

## 7. तैनात गर्नुहोस्

यीमध्ये कुनै पनि छान्नुहोस्:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → `site/` लाई ड्र्याग गर्नुहोस्
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/` मा `git init`, repo मा push गर्नुहोस्, Pages सक्षम पार्नुहोस्
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting on)
- **कुनै पनि सादा VPS**: `scp -r site/* user@host:/var/www/html/`

चरण 4 बाटको IPFS CID ले तपाईंलाई थप content-addressed URL दिन्छ: `https://<CID>.ipfs.dweb.link/`। यसको प्रयोग गर्नुहोस्।

## 8. OTS रसिद अपग्रेड गर्नुहोस् (पछि)

छाप लगाएको केही घण्टाभित्र, चलाउनुहोस्:

```bash
ots upgrade build/merkle_root.txt.ots
```

यसले प्रत्येक क्यालेन्डरको पेन्डिङ प्रमाणीकरणलाई कुनै विशिष्ट block लाई reference गर्ने पूर्ण Bitcoin प्रमाणीकरणमा परिवर्तन गर्छ। अपग्रेड गरेपछि `.ots` फाइललाई आफ्ना होस्टहरूमा पुन: तैनात गर्नुहोस्।

## 9. त्यति नै

तपाईंले तथ्यहरूको एउटा सानो समूह यस्तो तरिकाले प्रकाशन गर्नुभएको छ कि कुनै पनि तेस्रो पक्षले:

- तपाईंको होस्टबाट साधारण HTTP मार्फत सबै तथ्यहरू ल्याउन सक्छ
- तथ्य बाइटहरूबाट Merkle root पुन: गणना गर्न सक्छ
- तपाईंको प्रकाशित root सँग तुलना गर्न सक्छ
- root OTS-stamped समयमा Bitcoin मा commit गरिएको थियो भनेर प्रमाणीकरण गर्न सक्छ
- प्रकाशित CID मा IPFS मार्फत स्वतन्त्र रूपमा उही तथ्यहरू ल्याउन सक्छ
- सबै hashes मिल्छन् भनेर पुष्टि गर्न सक्छ

यीमध्ये कुनै पनि चरण असफल भयो भने, छेडछाड भएको छ। पाठकले तपाईंमाथि विश्वास गर्नुपर्दैन। उनीहरूले केवल गणित गर्नुपर्छ।
