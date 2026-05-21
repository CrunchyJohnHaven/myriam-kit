# Quickstart

*မြန်မာဘာသာပြန် — မူရင်း အင်္ဂလိပ်ဗားရှင်းအတွက်၊ ကြည့်ပါ [QUICKSTART.md](QUICKSTART.md)*

clone မှ တံဆိပ်ခတ်ပြီး ထုတ်ဝေချက်အထိ ငါးမိနစ်။ macOS တွင် စမ်းသပ်ပြီးဖြစ်သည်၊ Linux တွင် အလုပ်လုပ်သင့်သည်၊ Windows အသုံးပြုသူများ WSL လိုအပ်ပါမည်။

## 0. ကြိုတင်လိုအပ်ချက်များ

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

## 2. အချက်အလက်များကို တည်းဖြတ်ပါ

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

ဖိုင်တစ်ခုစီသည် အချက်အလက်တစ်ခုဖြစ်သည်။ UTF-8။ LF line endings။ ဖိုင်နာမည် ပုံစံမှာ `NN_short_name.txt` ဖြစ်ပြီး NN သည် zero-padded ဖြစ်သည်။ ၎င်းတို့ကို Merkle tree ထဲသို့ lexicographically စဉ်ထားသည် — ထို့ကြောင့် 02 သည် 01 ၏နောက်တွင် အမြဲတမ်းရှိမည်။

အကြံပြုချက် — အချက်အလက်တိုင်းကို *အမည်ပေးခြင်း သို့မဟုတ် ကြေညာချက်ဖြစ်စဉ်* တစ်ခုအဖြစ် စကားပြောဆိုပါ — ကမ္ဘာအကြောင်း ontological တောင်းဆိုချက်အဖြစ် မဟုတ်ပါ။ "Acme Corp က batch X သည် test Y ကို အောင်မြင်ခဲ့သည်ဟု ကြေညာထားသည်" သည် စစ်ဆေးနိုင်သည်။ "Batch X သည် ဘေးကင်းသည်" ဆိုသည်မှာ မစစ်ဆေးနိုင်ပါ။

## 3. IPFS daemon ကို စတင်ပါ (စက်တစ်ခုလျှင် တစ်ကြိမ်သာ)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. တံဆိပ်ခတ်ပါ

```bash
bash build/seal.sh
```

ဤသည်သည် —
1. အချက်အလက်တစ်ခုစီကို hash (SHA-256) လုပ်ပြီး Bitcoin-style Merkle root ကို တွက်ချက်ပါမည်။
2. independent calendars နှစ်ခုဖြင့် OpenTimestamps မှတဆင့် root ကို တံဆိပ်ခတ်ပါမည်
   (default အရ alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B` မှ override လုပ်နိုင်)။
3. `site/` directory ကို IPFS တွင် pin လုပ်ပြီး CID ကို ထုတ်ဖော်ပြသပါမည်။

စုစုပေါင်း — warm IPFS daemon ဖြင့် ~10 စက္ကန့်ခန့်။

## 5. `site/index.html` ကို တည်းဖြတ်ပါ

template placeholder များကို သင်၏ အမှန်တကယ်အချက်အလက်များ၊ hash များနှင့် Merkle root တို့ဖြင့် အစားထိုးပါ။ ပြသထားသော per-fact hash များသည် per-fact ဖိုင်များနှင့် တိုက်ဆိုင်ရမည် — မဟုတ်လျှင် စာမျက်နှာသည် ၎င်း၏ self-verification တွင် ပျက်ကွက်ပါမည်။

အချက်အလက်တစ်ခုစီအတွက် .txt ဖိုင်၏ အကြောင်းအရာကို `<div class="fact">` block ထဲသို့ ကူးယူပြီး SHA-256 ကို ၎င်း၏အောက်တွင် တိုက်ရိုက် `<div class="hash">` တွင် ထည့်ပါ။ Merkle root သည် cryptographic-seal section တွင် သွားရောက်ပါမည်။

(ဟုတ်ပါသည်၊ ဤအဆင့်ကို auto-generate လုပ်နိုင်သည်။ ၎င်းကို တမင်တကာ မလုပ်ထားပါ — manual အဆင့်သည် လူသား ပြန်လည်သုံးသပ်ခြင်း အဆင့်ဖြစ်သည်။ Protocol သည် သင်မဖတ်ထားသော အရာတစ်ခုခုကို ထုတ်ဝေခြင်းမှ မကာကွယ်ပါ။)

## 6. local တွင် စစ်ဆေးပါ

```bash
python3 build/verify.py
```

မျှော်လင့်ထားသော output —
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" ဟူသည် ပုံမှန်ပင်ဖြစ်သည် — OTS calendar သည် နာရီအနည်းငယ်အတွင်း attestation ကို Bitcoin attestation အပြည့်အစုံအဖြစ် upgrade ပြုလုပ်ပါမည်။

## 7. Deploy

အောက်ပါတို့မှ မည်သည့်တစ်ခုကိုမဆို ရွေးချယ်ပါ —

- **Cloudflare Pages**: dashboard → Pages → Direct upload → `site/` ကို drag လုပ်ပါ
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/` ထဲတွင် `git init`၊ repo သို့ push လုပ်ပါ၊ Pages ကို enable လုပ်ပါ
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting on)
- **မည်သည့် plain VPS မဆို**: `scp -r site/* user@host:/var/www/html/`

အဆင့် 4 မှ IPFS CID သည် content-addressed URL တစ်ခု ထပ်မံပေးပါမည် —
`https://<CID>.ipfs.dweb.link/`။ ၎င်းကို သုံးပါ။

## 8. OTS receipt ကို upgrade ပြုလုပ်ပါ (နောက်ပိုင်းတွင်)

တံဆိပ်ခတ်ပြီးနောက် ~နာရီအနည်းငယ်အတွင်း ဤ command ကို run ပါ —

```bash
ots upgrade build/merkle_root.txt.ots
```

ဤသည်က calendar တစ်ခုစီ၏ pending attestation ကို သတ်မှတ်ထားသော block တစ်ခုကို ရည်ညွှန်းသော Bitcoin attestation အပြည့်အစုံအဖြစ် ပြောင်းပါမည်။ upgrade ပြုလုပ်ပြီးနောက် `.ots` ဖိုင်ကို သင်၏ host များသို့ ပြန်လည် deploy လုပ်ပါ။

## 9. ပြီးပါပြီ

သင်သည် အချက်အလက်အနည်းငယ်ကို ထုတ်ဝေပြီးပါပြီ၊ မည်သည့်ပြင်ပပါတီမဆို ဤအခြေအနေများကို ပြုလုပ်နိုင်သည် —

- သင်၏ host မှ plain HTTP ဖြင့် အချက်အလက်အားလုံးကို fetch လုပ်ခြင်း
- fact bytes မှ Merkle root ကို ပြန်လည်တွက်ချက်ခြင်း
- သင်ထုတ်ဝေထားသော root နှင့် နှိုင်းယှဉ်ခြင်း
- OTS-stamped အချိန်တွင် root သည် Bitcoin သို့ commit ပြုလုပ်ပြီးကြောင်း စစ်ဆေးခြင်း
- ထုတ်ဝေထားသော CID မှတဆင့် IPFS မှ တူညီသော အချက်အလက်များကို သီးခြားလွတ်လပ်စွာ fetch လုပ်ခြင်း
- hash အားလုံး တိုက်ဆိုင်ကြောင်း အတည်ပြုခြင်း

ထိုအဆင့်များ မည်သည့်တစ်ခုမဆို ပျက်ကွက်ပါက ပြောင်းလဲခြင်း (tampering) ဖြစ်ပွားခဲ့သည်။ စာဖတ်သူသည် သင့်ကို ယုံကြည်ရန် မလိုပါ။ ၎င်းတို့သည် သင်္ချာကိုသာ ပြုလုပ်ဖို့ လိုသည်။
