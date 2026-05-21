# Quickstart

*മലയാള പരിഭാഷ — യഥാർത്ഥ ഇംഗ്ലീഷ് പതിപ്പിന് [QUICKSTART.md](QUICKSTART.md) കാണുക*

Clone-ൽ നിന്ന് സീൽ ചെയ്ത പ്രസിദ്ധീകരണത്തിലേക്ക് അഞ്ച് മിനിറ്റ്. macOS-ൽ
test ചെയ്തിട്ടുണ്ട്; Linux-ൽ പ്രവർത്തിക്കണം; Windows ഉപയോക്താക്കൾക്ക് WSL
ആവശ്യമാണ്.

## 0. മുൻകൂർ ആവശ്യകതകൾ

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

## 2. വസ്തുതകൾ എഡിറ്റ് ചെയ്യുക

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

ഓരോ ഫയലും ഒരു വസ്തുതയാണ്. UTF-8. LF line endings. ഫയൽനെയിം pattern
`NN_short_name.txt` ആണ്, ഇവിടെ NN zero-padded ആണ്. അവ Merkle tree-യിലേക്ക്
lexicographic ക്രമത്തിൽ സോർട്ട് ചെയ്യപ്പെടുന്നു, അതിനാൽ 02 എപ്പോഴും
01-ന് ശേഷം വരും.

Tip: ഓരോ വസ്തുതയും ലോകത്തെക്കുറിച്ചുള്ള ഒരു ontological claim ആയിട്ടല്ല,
ഒരു *naming അല്ലെങ്കിൽ declaration event* ആയി phrase ചെയ്യുക. "Acme Corp
declare ചെയ്തിരിക്കുന്നു batch X test Y pass ചെയ്തുവെന്ന്" എന്നത് verify
ചെയ്യാവുന്നതാണ്. "Batch X സുരക്ഷിതമാണ്" എന്നത് അല്ല.

## 3. IPFS daemon ആരംഭിക്കുക (ഓരോ മെഷീനിലും ഒരുതവണ)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. സീൽ ചെയ്യുക

```bash
bash build/seal.sh
```

ഇത് ഇനിപ്പറയുന്നവ ചെയ്യും:
1. ഓരോ വസ്തുതയും hash ചെയ്യുക (SHA-256), Bitcoin-style Merkle root കണക്കാക്കുക.
2. രണ്ട് സ്വതന്ത്ര calendars വഴി OpenTimestamps ഉപയോഗിച്ച് root stamp
   ചെയ്യുക (default ആയി alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B`
   വഴി override ചെയ്യാം).
3. `site/` ഡയറക്ടറി IPFS-ലേക്ക് pin ചെയ്ത് CID പ്രിന്റ് ചെയ്യുക.

ആകെ: warm IPFS daemon-ഉള്ളപ്പോൾ ~10 സെക്കൻഡ്.

## 5. `site/index.html` എഡിറ്റ് ചെയ്യുക

ടെംപ്ലേറ്റ് placeholders നിങ്ങളുടെ യഥാർത്ഥ വസ്തുതകൾ, hashes, Merkle
root എന്നിവ കൊണ്ട് മാറ്റിസ്ഥാപിക്കുക. പ്രദർശിപ്പിച്ച per-fact hashes
per-fact ഫയലുകളുമായി match ചെയ്യണം, അല്ലെങ്കിൽ പേജ് സ്വന്തം
self-verification-ൽ പരാജയപ്പെടും.

ഓരോ വസ്തുതയ്ക്കും, .txt ഫയലിന്റെ body ഒരു `<div class="fact">` block-ലേക്ക്
പകർത്തുക, അതിന് നേരെ താഴെ ഒരു `<div class="hash">`-ൽ SHA-256 ഇടുക. Merkle
root cryptographic-seal വിഭാഗത്തിലേക്ക് പോകുന്നു.

(അതെ, ഇത് auto-generate ചെയ്യാമായിരുന്നു. അത് ചെയ്തിട്ടില്ല, മനഃപൂർവ്വം:
manual step ആണ് human review step. നിങ്ങൾ വായിക്കാത്ത ഒന്ന് പ്രസിദ്ധീകരിക്കുന്നതിനെതിരെ
പ്രോട്ടോക്കോൾ പ്രതിരോധിക്കില്ല.)

## 6. ലോക്കലായി പരിശോധിക്കുക

```bash
python3 build/verify.py
```

പ്രതീക്ഷിത ഔട്ട്പുട്ട്:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" സാധാരണമാണ് — OTS calendar attestation-നെ ഏതാനും മണിക്കൂറുകൾക്കുള്ളിൽ
ഒരു പൂർണ്ണ Bitcoin attestation-ലേക്ക് upgrade ചെയ്യും.

## 7. Deploy ചെയ്യുക

ഇവയിൽ ഏതെങ്കിലും തിരഞ്ഞെടുക്കുക:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → `site/` drag ചെയ്യുക
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/`-ൽ `git init` ചെയ്യുക, repo-ലേക്ക് push ചെയ്യുക, Pages enable ചെയ്യുക
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting on ആയിരിക്കണം)
- **ഏതെങ്കിലും plain VPS**: `scp -r site/* user@host:/var/www/html/`

ഘട്ടം 4-ലെ IPFS CID നിങ്ങൾക്ക് ഒരു അധിക content-addressed URL നൽകുന്നു:
`https://<CID>.ipfs.dweb.link/`. ഇത് ഉപയോഗിക്കുക.

## 8. OTS receipt upgrade ചെയ്യുക (പിന്നീട്)

സീൽ ചെയ്ത് ~ഏതാനും മണിക്കൂറുകൾക്കുള്ളിൽ ഇത് റൺ ചെയ്യുക:

```bash
ots upgrade build/merkle_root.txt.ots
```

ഇത് ഓരോ calendar-ന്റെയും pending attestation-നെ ഒരു specific block-നെ
പരാമർശിക്കുന്ന ഒരു പൂർണ്ണ Bitcoin attestation-ലേക്ക് മാറ്റുന്നു. Upgrade
ചെയ്തതിന് ശേഷം `.ots` ഫയൽ നിങ്ങളുടെ hosts-ലേക്ക് വീണ്ടും deploy ചെയ്യുക.

## 9. അത്രയേയുള്ളൂ

ഏതെങ്കിലും മൂന്നാം കക്ഷിക്ക് ഇനിപ്പറയുന്നവ ചെയ്യാൻ കഴിയുന്ന വിധത്തിൽ
ഒരു ചെറിയ കൂട്ടം വസ്തുതകൾ നിങ്ങൾ പ്രസിദ്ധീകരിച്ചിരിക്കുന്നു:

- നിങ്ങളുടെ host-ൽ നിന്ന് plain HTTP വഴി എല്ലാ വസ്തുതകളും Fetch ചെയ്യാം
- ഫാക്ട് bytes-ൽ നിന്ന് Merkle root വീണ്ടും കണക്കാക്കാം
- നിങ്ങൾ പ്രസിദ്ധീകരിച്ച root-മായി താരതമ്യം ചെയ്യാം
- OTS-stamp ചെയ്ത സമയത്ത് root Bitcoin-ലേക്ക് commit ചെയ്തുവെന്ന് പരിശോധിക്കാം
- പ്രസിദ്ധീകരിച്ച CID-യിൽ IPFS വഴി അതേ വസ്തുതകൾ സ്വതന്ത്രമായി fetch ചെയ്യാം
- എല്ലാ hashes-ഉം match ചെയ്യുന്നുവെന്ന് സ്ഥിരീകരിക്കാം

ആ ഘട്ടങ്ങളിൽ ഏതെങ്കിലും പരാജയപ്പെട്ടാൽ, tampering സംഭവിച്ചിട്ടുണ്ട്.
വായനക്കാരൻ നിങ്ങളെ വിശ്വസിക്കേണ്ടതില്ല. അവർ ഗണിതം ചെയ്താൽ മതി.
