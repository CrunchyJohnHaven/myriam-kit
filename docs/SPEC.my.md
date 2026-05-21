# MYRIAM-kit Protocol Specification

*မြန်မာဘာသာပြန် — မူရင်း အင်္ဂလိပ်ဗားရှင်းအတွက်၊ ကြည့်ပါ [SPEC.md](SPEC.md)*

## 0. ရည်ရွယ်ချက်

ဤ document သည် စာသား အချက်အလက်အနည်းငယ်ကို ပြောင်းလဲမှု သိရှိနိုင်သော၊ cryptographically စစ်ဆေးနိုင်သော ပုံစံဖြင့် ထုတ်ဝေရန်အတွက် အသေးငယ်ဆုံး protocol ကို သတ်မှတ်ထားသည် — hosting provider တစ်ဦးတည်းကို ဖယ်ရှားလိုက်လျှင်ပင် ဆက်လက်တည်ရှိနေသော ပုံစံ ဖြစ်သည်။

၎င်းသည် [disclosure.host](https://disclosure.host) ၌ "MYRIAM v1" အမည်ဖြင့် ပထမဆုံး အကောင်အထည်ဖော်ခဲ့သော protocol ၏ ယေဘုယျအသွင်ပြောင်းခြင်းဖြစ်သည်။

## 1. မဟုတ်သော ရည်ရွယ်ချက်များ

- လျှို့ဝှက်အချက်အလက် သိုလှောင်ခြင်း။ အရာအားလုံးသည် တည်ဆောက်ပုံအရ အများပိုင်ဖြစ်သည်။
- ဒေတာအစုံအလင်ကြီးများ။ အချက်အလက် ~20 ထက် ပိုလာပါက protocol သည် မှားယွင်းသော ပုံစံဖြစ်လာသည်။
- Real-time ထုတ်ဝေခြင်း။ ထုတ်ဝေချက်တစ်ခုစီသည် သီးခြား တံဆိပ်ခတ်သည့်ဖြစ်စဉ် ဖြစ်သည်။
- ပြန်လည်ရုပ်သိမ်းခြင်း။ Protocol သည် version အဆင့်တွင် append-only ဖြစ်သည်။

## 2. အချက်အလက် မော်ဒယ်

FACT တစ်ခုသည် အောက်ပါအတိုင်း UTF-8 စာသား ဖိုင်တစ်ခုဖြစ်သည် —

- ဖိုင်နာမည် ပုံစံ — `NN_short_name.txt` ဖြစ်ပြီး NN သည် 01 မှစ၍ zero-padded two-digit index ဖြစ်သည်။
- canonical form — ရေးထားသည့်အတိုင်း bytes၊ normalization မလုပ်ပါ။
- per-fact hash — `SHA-256(file_bytes)` ၏ lowercase hex။

အချက်အလက် SET သည် `facts/` အောက်တွင် pattern နှင့် ကိုက်ညီသော ဖိုင်များ၏ စဉ်ထားသော စာရင်းဖြစ်ပြီး lexicographically စဉ်ထားသည်။

ကန့်သတ်ချက် — အချက်အလက် body တိုင်းကို သတ်မှတ်ထားသော party တစ်ဦးအား attributable ဖြစ်သော *အမည်ပေးဖြစ်စဉ်* သို့မဟုတ် *ကြေညာချက်ဖြစ်စဉ်* တစ်ခုအဖြစ် ဖော်ပြသင့်သည် (SHOULD)။ Ontological တောင်းဆိုချက်များ ("လသည် ကျောက်ဖြစ်သည်") သည် verifiability gate ကို ပျက်စီးစေသည် — ထုတ်ဝေဖြစ်စဉ်သာ စစ်ဆေးနိုင်ပြီး တောင်းဆိုချက်ကိုယ်တိုင်ကို မစစ်ဆေးနိုင်ပါ။ "X က Y ဟု ပြောကြားခဲ့သည်" သည် မှန်ကန်သော ပုံစံဖြစ်သည်။ "Y သည် မှန်သည်" သည် မဟုတ်ပါ။

## 3. Merkle root

ဖြန့်ဖြူးထားသော MYRIAM protocol ၏ v0 တွင်ကဲ့သို့ Bitcoin-style —

1. Leaves — fact-set အစီအစဉ်အလိုက် per-fact SHA-256 hash များ။
2. level တစ်ခုတွင် odd အရေအတွက် nodes ရှိပါက နောက်ဆုံး node ကို duplicate လုပ်ပါ။
3. တွဲဖက် nodes များကို pair-hash လုပ်ပါ — `parent = SHA-256(left_bytes || right_bytes)`၊
   `left_bytes` နှင့် `right_bytes` တို့သည် raw 32-byte hash values များဖြစ်ပြီး
   (၎င်းတို့၏ hex representations မဟုတ်ပါ)။
4. node တစ်ခုသာ ကျန်ရှိသည်အထိ ထပ်လုပ်ပါ။ ၎င်းသည် Merkle root ဖြစ်သည်။

root ကို trailing newline မပါသော lowercase hex အဖြစ် ထုတ်ဝေသည်။

### 3.1 Test vectors

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

compliant implementation မည်သည့်ခုမဆို ဤ vectors များကို ပြန်လည်ထုတ်ပေးနိုင်ရမည် (MUST)။ ၎င်းတို့ကို အမှန်တကယ် `lib/build.py` မှ ထုတ်ယူထားပြီး ထို script ဖြင့် ပြန်လည် generate လုပ်နိုင်သည်။

## 4. Bitcoin commitment

Merkle root ကို [OpenTimestamps](https://opentimestamps.org) မှတဆင့် Bitcoin blockchain သို့ commit လုပ်သည်။ Default policy မှာ —

> Independent administrative control အောက်ရှိ calendar operator အနည်းဆုံး နှစ်ဦးထဲတွင် Stamp လုပ်ပါ။

ဤ policy ကို ဖြည့်ဆည်းပေးသော receipt တစ်ခုကို `ots verify <receipt>.ots` ကို run နိုင်ပြီး calendar တစ်ခုခု၏ upgrade path သို့ ရောက်ရှိနိုင်သော မည်သည့်ပါတီမဆို စစ်ဆေးနိုင်သည်။

`lib/seal.sh` တွင် ပါဝင်လာသော default operator pair —

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementation များသည် မတူညီသော operator များကို သုံးနိုင်သည် (MAY)။ witness-diversity policy (≥2 independent operators) သည် normative ဖြစ်သည် — သတ်မှတ်ထားသော operator များသည် မဟုတ်ပါ။

## 5. Content-addressed mirroring

ထုတ်ဝေထားသော စာမျက်နှာနှင့် အချက်အလက်ဖိုင်များ ပါဝင်သော `site/` directory ကို IPFS သို့ ထည့်သင့်သည် (SHOULD) —

```
ipfs add -r --cid-version=1 -Q site/
```

ထို့ကြောင့်ရရှိလာသော CIDv1 (dag-pb codec) သည် ထုတ်ဝေချက်၏ content address ဖြစ်သည်။ ၎င်းသည် `site/` ၏ byte content မှ deterministic ဖြစ်သည်။ `site/` အောက်ရှိ ဖိုင်တစ်ခုခုကို ပြုပြင်ပြောင်းလဲခြင်းသည် ကွဲပြားသော CID တစ်ခု ထုတ်ပေးပါသည်။

ထုတ်ဝေသူ၏ local node ထက်ပိုသော ဝန်ဆောင်မှုများသို့ Pin လုပ်ခြင်းကို ကြာရှည်ခံမှုအတွက် ပြင်းပြင်းထန်ထန် အကြံပြုသည် — ဤ specification သည် သတ်မှတ်ထားသော ဝန်ဆောင်မှုများကို မဖော်ပြထားပါ။

## 6. Versioning

Protocol သည် **version အဆင့်တွင် append-only** ဖြစ်သည်။ ပြောင်းလဲမှုတိုင်းသည် တံဆိပ်ခတ်ထားသော version အသစ်တစ်ခု လိုအပ်သည် —

- specification revision အသစ် (သို့မဟုတ် မပြောင်းလဲထားသော)
- ယခင် versions များမှ အချက်အလက်များကို မပြောင်းလဲဘဲ inherit ပြုလုပ်နိုင်သော (MAY) အချက်အလက်အသစ်တစ်စုံ
- Merkle root အသစ်
- OpenTimestamps receipt အသစ်
- IPFS CID အသစ်

ယခင် versions အားလုံးသည် versioned URLs များတွင် ဆက်လက်ထုတ်ဝေထားသည်။ v(N) အချက်အလက်တစ်ခုခုကို ပြောင်းလဲခြင်းသည် v(N+1) လိုအပ်သည် — versions နှစ်ခုလုံးကို မြင်နိုင်ပြီး ပြန်လည်စစ်ဆေးနိုင်ရမည်။

## 7. စစ်ဆေးခြင်း

မည်သည့်ပြင်ပပါတီမဆို ထုတ်ဝေချက်တစ်ခု၏ integrity ကို အောက်ပါအဆင့်များဖြင့် စစ်ဆေးနိုင်သည် —

1. အချက်အလက်ဖိုင်များကို download လုပ်ပြီး per-fact SHA-256 hash များကို ပြန်လည်တွက်ချက်ခြင်း။
2. §3 အရ Merkle root ကို ပြန်လည်တွက်ချက်ပြီး ထုတ်ဝေထားသော root နှင့် နှိုင်းယှဉ်ခြင်း။
3. OpenTimestamps receipt ကို calendar တစ်ခုခု၏ full attestation အတွက် Bitcoin blockchain နှင့် နှိုင်းယှဉ်စစ်ဆေးခြင်း။
4. `ipfs add -r --cid-version=1` မှတဆင့် IPFS CID ကို သီးခြားလွတ်လပ်စွာ ပြန်လည်တွက်ချက်ပြီး ထုတ်ဝေထားသော CID နှင့် နှိုင်းယှဉ်ခြင်း။

`lib/verify.py` သည် Python stdlib နှင့် `ots` client အပြင် ပြင်ပ dependencies များ မလိုဘဲ အဆင့် 1–3 ကို လုပ်ဆောင်သည်။ အဆင့် 4 သည် `ipfs` client လိုအပ်သည်။

## 8. Refusal gate

ထုတ်ဝေချက်တစ်ခုသည် အောက်ပါအချက်များ ပါဝင်သော အချက်အလက်တစ်ခုကို မပါဝင်ရပါ (MUST NOT) —

- အမည်ဖော်ပြရန် သဘောမတူသော သီးသန့်ပြင်ပပါတီတစ်ဦးကို ဖော်ထုတ်ခြင်း။
- hypothesis ကို confirmation အဖြစ် တင်ပြခြင်း။
- စစ်ဆေးနိုင်သော အမည်ပေး/ကြေညာချက် ဖြစ်စဉ်တစ်ခုသို့ သို့မဟုတ် cryptographic artifact တစ်ခုသို့ လျှော့ချ၍မရခြင်း။
- ထုတ်ဝေပြီးနောက် ကာကွယ်နိုင်သော သေဆုံးမှုများ ကျိုးကြောင်းဆီလျော်စွာ မြင့်တက်လာရန် မျှော်လင့်ထားခြင်း။

စတုတ္ထနည်းဥပဒေသည် load-bearing ဖြစ်သည်။ ၎င်းကို ထုတ်ဝေသူ၏ လူသား ပြန်လည်သုံးသပ်ခြင်း အဆင့်တွင် အကောင်အထည်ဖော်သည်။ refusal gate ၏ protocol-level အကောင်အထည်ဖော်ခြင်း မရှိပါ — protocol သည် ၎င်းအား ပေးထားသော byte များကို ထုတ်ဝေပါသည်။ ထုတ်ဝေသူသည် ဤ gate အတွက် တာဝန်ရှိသည်။

## 9. ကန့်သတ်ချက်များ၏ ရိုးသားသော ထုတ်ဖော်ပြောဆိုချက်

- **သိရှိနိုင်ခြင်း — မဖြစ်နိုင်ခြင်း မဟုတ်ပါ။** Protocol သည် tampering ကို သိရှိနိုင်စေသည် — မဖြစ်နိုင်အောင် မပြုလုပ်ပါ။ ဆုံးဖြတ်ထားသော တိုက်ခိုက်သူသည် မတူညီသော ထုတ်ဝေချက်တစ်ခုကို အစားထိုးပြီး စာဖတ်သူအချို့အား ၎င်းသည် မူရင်းဖြစ်သည်ဟု ယုံကြည်အောင် ပြုလုပ်နိုင်သေးသည်။ Protocol ၏ တန်ဖိုးမှာ — အစားထိုးခြင်းသည် စစ်ဆေးချက်ကို run သော မည်သူ့အတွက်မဆို cryptographically သက်သေပြနိုင်လာခြင်း ဖြစ်သည်။
- **မှားယွင်းမှု ထုတ်ဝေခြင်းကို ကာကွယ်ခြင်း မရှိပါ။** ထုတ်ဝေသူသည် "X ဖြစ်ပျက်ခဲ့သည်" ဟု ဆိုသော အချက်အလက်တစ်ခုကို တံဆိပ်ခတ်ပြီး X သည် ဖြစ်ပျက်မခဲ့ပါက Protocol သည် မှားယွင်းသော တောင်းဆိုချက်ကို မှန်ကန်သော တောင်းဆိုချက်များကို တံဆိပ်ခတ်သည့်အတိုင်း fidelity တူညီစွာဖြင့် တံဆိပ်ခတ်ပါသည်။ Protocol သည် *ထုတ်ဝေထားသော* အရာအား attest လုပ်သည် — *မှန်ကန်သော* အရာအား မဟုတ်ပါ။
- **Single-party signing။** ဖြန့်ဖြူးထားသော MYRIAM ၏ v1 သည် signing principal တစ်ဦးတည်းကို သုံးသည်။ Multi-party signing သည် နောက်ပိုင်း လုပ်ဆောင်ရမည့်အရာဖြစ်သည်။
- **Pinning durability။** ထုတ်ဝေသူ၏ node တွင်သာ IPFS pinning သည် "ကျွန်ုပ်၏ laptop ဖွင့်ထားသမျှ + opportunistic gateway caching" ပေးပါသည်။ ကြာရှည်ခံမှုသည် သီးခြားလွတ်လပ်သော ဝန်ဆောင်မှုများတွင် redundant pins များ လိုအပ်သည်။

ဤကန့်သတ်ချက်များကို ဤနေရာတွင် ဖော်ပြထားသည် — protocol သည် ပေးနိုင်သည်ထက် ပိုပေးသည်ဟု မည်သည့်စာဖတ်သူမှ မယူဆရန် ဖြစ်သည်။
