*የአማርኛ ትርጉም — ለመጀመሪያው የእንግሊዝኛ ስሪት፣ ይመልከቱ [SPEC.md](SPEC.md)*

# MYRIAM-kit ፕሮቶኮል ዝርዝር

## 0. ዓላማ

ይህ ሰነድ አንድ አነስተኛ የጽሑፍ-ሐቅ ስብስብን በመጣረስ-ምልክት ባለበት፣ በ cryptographic
ሊረጋገጥ በሚችል ቅርጽ ለማተም የሚያገለግል አነስተኛ ፕሮቶኮል ይዘረዝራል፣ ይህም ማንኛውም
አንድ የማስተናገጃ አቅራቢ ቢወገድም የሚተርፍ ነው።

በ[disclosure.host](https://disclosure.host) ላይ "MYRIAM v1" በሚል ስም
ለመጀመሪያ ጊዜ የተተገበረው የፕሮቶኮል ጠቅላላ ቅርጽ ነው።

## 1. ያልሆኑ ዓላማዎች

- ሚስጥር ማከማቸት። ሁሉም ነገር በመዋቅሩ ሕዝባዊ ነው።
- ትላልቅ የመረጃ ስብስቦች። ከ~20 ሐቆች በላይ፣ ፕሮቶኮሉ የተሳሳተ ቅርጽ ነው።
- የቅጽበት ህትመት። እያንዳንዱ ህትመት የተለየ የመታሸግ ድርጊት ነው።
- መመለስ። ፕሮቶኮሉ በ version ደረጃ append-only ነው።

## 2. የሐቅ ሞዴል

FACT አንድ UTF-8 የጽሑፍ ፋይል ሲሆን፦

- የፋይል ስም ቅርጽ፦ `NN_short_name.txt` ሲሆን፣ NN በ zero የተሞላ ሁለት-አሃዝ
  ቁጥር ሆኖ ከ 01 የሚጀምር።
- canonical ቅርጽ፦ እንደተጻፉ bytes፣ ምንም normalization የለም።
- የእያንዳንዱ-ሐቅ hash፦ `SHA-256(file_bytes)` lowercase hex።

የሐቅ SET በ `facts/` ሥር ቅርጹን የሚያሟሉ ሁሉም ፋይሎች በሥርዓተ-ፊደል የተደረደሩ
ቅደም ተከተል ያለው ዝርዝር ነው።

ገደብ፦ እያንዳንዱ የሐቅ አካል SHOULD እንደ *የስያሜ ድርጊት* ወይም *የመግለጥ ድርጊት*
ለልዩ ወገን ሊዛመድ በሚችል ሁኔታ ይግለጽ። Ontological አባባሎች ("ጨረቃ ድንጋይ ነው")
የሚረጋገጥ-መሆን በሩን ያዳክማሉ፤ የሚረጋገጠው የህትመት ድርጊቱ ብቻ ነው፣ አባባሉ
አይደለም። "X ሰው Y ብሏል" ትክክለኛው ቅርጽ ነው። "Y እውነት ነው" አይደለም።

## 3. Merkle root

Bitcoin-style፣ በተተገበረው MYRIAM ፕሮቶኮል v0 ላይ እንዳለው፦

1. ቅጠሎች፦ የእያንዳንዱ-ሐቅ SHA-256 hashes በሐቅ-ስብስብ ቅደም ተከተል።
2. አንድ ደረጃ ኢ-ሕልው-ቁጥር nodes ካለው፣ የመጨረሻውን node ይድገሙ።
3. የተጎራባች nodes-ን ጥንድ-hash ያድርጉ፦ `parent = SHA-256(left_bytes || right_bytes)`፣
   `left_bytes` እና `right_bytes` ጥሬ 32-byte hash እሴቶቹ ናቸው (የ hex
   ውክልናዎቻቸው አይደሉም)።
4. አንድ node እስኪቀር ድረስ ይድገሙት። ያ Merkle root ነው።

root በ lowercase hex ይታተማል ያለ trailing newline።

### 3.1 የፍተሻ ቬክተሮች

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

ማንኛውም ተስማሚ ትግበራ MUST እነዚህን ቬክተሮች እንደገና ያፍራ። ከትክክለኛው
`lib/build.py` የተገኙ ናቸው እና በዚያ ስክሪፕት እንደገና ሊፈጠሩ ይችላሉ።

## 4. የ Bitcoin ቃል-ኪዳን

Merkle root ወደ Bitcoin blockchain የሚገባው በ
[OpenTimestamps](https://opentimestamps.org) በኩል ነው። ነባሪው ፖሊሲ ይህ ነው፦

> ራሳቸውን በቻሉ የአስተዳደር ቁጥጥር ሥር ቢያንስ በሁለት calendar operators ላይ ይምቱ።

ይህን ፖሊሲ የሚያሟላ ደረሰኝ `ots verify <receipt>.ots` ሊያሂድ እና ከ
calendar-አንዱ upgrade path ሊደርስ በሚችል ማንኛውም ወገን ሊረጋገጥ ይችላል።

በ `lib/seal.sh` ውስጥ የሚላከው ነባሪ operator ጥንድ፦

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

ትግበራዎች MAY የተለያዩ operators ይጠቀሙ። የ witness-diversity ፖሊሲ
(≥2 ራሳቸውን የቻሉ operators) normative ነው፤ ልዩዎቹ operators አይደሉም።

## 5. Content-addressed mirroring

የታተመውን ገጽ እና የሐቅ ፋይሎችን የያዘው `site/` ማውጫ SHOULD ወደ IPFS ይጨመር፦

```
ipfs add -r --cid-version=1 -Q site/
```

የተገኘው CIDv1 (dag-pb codec) የህትመቱ content address ነው። ከ `site/` byte
ይዘት deterministic ነው። በ `site/` ሥር ለማንኛውም ፋይል የተደረገ ማንኛውም
ለውጥ የተለየ CID ያፈራል።

ከአስታዋቂው አካባቢያዊ node በላይ ለተጨማሪ አገልግሎቶች Pinning ለዘላቂነት በጣም
ይመከራል፤ ይህ ዝርዝር ልዩ አገልግሎቶችን አይያስገድድም።

## 6. ስሪት-መስጠት

ፕሮቶኮሉ **በ version ደረጃ append-only** ነው። እያንዳንዱ ለውጥ አዲስ የታሸገ
version ይፈልጋል፦

- አዲስ (ወይም ያልተቀየረ) የዝርዝር ክለሳ
- አዲስ የሐቅ ስብስብ፣ ይህም MAY ከቀደምት ስሪቶች ያልተቀየሩ ሐቆችን ይውረስ
- አዲስ Merkle root
- አዲስ OpenTimestamps ደረሰኝ
- አዲስ IPFS CID

ሁሉም ቀደምት ስሪቶች በ versioned URLs ላይ ታትመው ይቆያሉ። ለማንኛውም v(N) ሐቅ
የተደረገ ለውጥ v(N+1) ይፈልጋል፣ ሁለቱም ስሪቶች የሚታዩ እና እንደገና-የሚረጋገጡ ሆነው።

## 7. ማረጋገጥ

ማንኛውም ሦስተኛ ወገን የህትመትን ታማኝነት እንዲህ ሊያረጋግጥ ይችላል፦

1. የሐቅ ፋይሎችን በማውረድ የእያንዳንዱን-ሐቅ SHA-256 hashes እንደገና በማስላት።
2. Merkle root-ን በ §3 መሠረት እንደገና በማስላት እና ከታተመው root ጋር በማወዳደር።
3. OpenTimestamps ደረሰኝን ቢያንስ ለአንድ calendar ሙሉ attestation በ Bitcoin
   blockchain ላይ በማረጋገጥ።
4. IPFS CID-ን በ `ipfs add -r --cid-version=1` ራሱን-ችሎ እንደገና በማስላት
   እና ከታተመው CID ጋር በማወዳደር።

`lib/verify.py` ከ Python stdlib እና `ots` client በላይ ምንም ውጫዊ
ጥገኝነቶች ሳይኖሩ ደረጃዎች 1–3-ን ያከናውናል። ደረጃ 4 የ `ipfs` client ይፈልጋል።

## 8. የመከልከያ በር

አንድ ህትመት የሚከተለውን ሐቅ MUST NOT ያካትት፦

- ለመሰየም ያልተስማማ የግል ሦስተኛ ወገንን ይለያል።
- ግምትን እንደ ማረጋገጫ ያቀርባል።
- ወደ ሊረጋገጥ የሚችል የስያሜ/የመግለጥ ድርጊት ወይም cryptographic artifact ሊቀነስ
  አይችልም።
- በሚታተምበት ጊዜ ሊከለከሉ የሚችሉ ሞቶችን በተመጣጣኝ ሁኔታ ሊጨምር የሚጠበቅ።

አራተኛው ሕግ load-bearing ነው። በሰው የግምገማ ደረጃ በአስታዋቂው ይተገበራል።
የመከልከያ በሩን የሚተገብር ምንም የፕሮቶኮል-ደረጃ ኃይል የለም፤ ፕሮቶኮሉ የተሰጠውን
ማንኛውንም bytes ያትማል። አስታዋቂው ለበሩ ኃላፊነት አለበት።

## 9. የገደቦች ቀጥተኛ መግለጫ

- **ሊታወቅ የሚችል መሆን፣ የማይቻል መሆን አይደለም።** ፕሮቶኮሉ መጣረስን ሊታወቅ
  የሚችል ያደርጋል፣ የማይቻል አይደለም። የተወሰነ አጥቂ አሁንም የተለየ ህትመት ሊተካ
  እና አንዳንድ አንባቢዎችን እንዲያምኑ ሊያሳምን ይችላል። የፕሮቶኮሉ ዋጋ መተካቱ
  ፍተሻውን በሚያሂድ ለማንኛውም ሰው cryptographically ሊረጋገጥ የሚችል መሆኑ ነው።
- **ውሸት ከማተም ምንም መከላከያ የለም።** አስታዋቂው "X ሆኗል" የሚል ሐቅ ቢያትም
  እና X ካልሆነ፣ ፕሮቶኮሉ ሐሰተኛውን አባባል እውነተኛውን በሚታሽግበት ተመሳሳይ
  ታማኝነት ያሽጋል። ፕሮቶኮሉ ለ*ታተመው* ይመሰክራል፣ ለ*እውነተኛው* አይደለም።
- **አንድ-ወገን ፊርማ።** የተተገበረው MYRIAM v1 አንድ የፊርማ ዋናተኛ ይጠቀማል።
  ብዙ-ወገን ፊርማ የወደፊት ሥራ ነው።
- **የ Pinning ዘላቂነት።** በአስታዋቂው node ብቻ የሚደረግ IPFS pinning
  "ላፕቶፔ እያለ ሥራ ላይ + የግድ ያልሆነ gateway caching" ያቀርባል። ለረጅም-ጊዜ
  ዘላቂነት ራሳቸውን በቻሉ አገልግሎቶች ላይ ተደጋጋሚ pins ይፈልጋል።

እነዚህ ገደቦች እዚህ የተገለጹት ምንም አንባቢ ፕሮቶኮሉ ከሚሰጠው በላይ እንደሚሰጥ
እንዳይገምት ነው።
