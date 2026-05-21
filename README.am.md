*የአማርኛ ትርጉም — ለዋናው የእንግሊዝኛ ስሪት [README.md](README.md)ን ይመልከቱ*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

ይህ አነስተኛ የሐቅ ስብስብን በሚከተሉት ባህሪዎች ለማተም የሚያገለግል ትንሽ መሣሪያ ስብስብ ነው፦

- በማንኛውም ሐቅ ላይ የሚደረግ ማናቸውም ለውጥ በሕዝብ ሊታወቅ የሚችል ነው (Merkle tree)
- በሚታተምበት ጊዜ ያለው ሁኔታ ከ Bitcoin blockchain ጋር ሊረጋገጥ ይችላል (OpenTimestamps)
- ይዘቱ ማንኛውም አንድ የማስተናገጃ አቅራቢ ቢወገድም ይተርፋል (IPFS)
- አጠቃላይ ጥቅሉ ከ100 KB በታች ሲሆን፣ በ~50 መስመር Python ሊረጋገጥ ይችላል

ይህ blockchain አይደለም። ምንም token የለም። ለመሳተፍ የሚገባ ምንም የስምምነት ዘዴ የለም። ምንም DAO የለም። መሣሪያው `sha256sum` + `ots` + `ipfs` ሲሆን፣ በመልካም የስያሜ ስምምነቶች የተጣመረ ነው።

የተሰየመው 2026-05-21 በ[disclosure.host](https://disclosure.host) ላይ ለመጀመሪያ ጊዜ በተተገበረው MYRIAM ፕሮቶኮል ስም ነው። ያ ገጽ ስድስት ሐቆች፣ አንድ Merkle root እና አንድ Bitcoin attestation ይዟል። ይህ ስብስብ የዚያ ንድፍ አጠቃላይ ቅርጽ ነው።

## ሁኔታ

- v0: በ macOS ላይ ከ Python 3.10+፣ Homebrew እና የበይነመረብ ግንኙነት ጋር ይሠራል። Linux ላይ አልተሞከረም ግን መሥራት አለበት። Windows: WSL ይዘው ይምጡ።
- የሕዝብ ጎራ (CC0)። ይጠቀሙበት፣ ይቅረጹት፣ ወደ ራስዎ ማከማቻ ይውሰዱት፣ ምስጋናን አያስፈልጉም። ነጥቡ ምስጋና አይደለም።

## የሚገኙ ቋንቋዎች

ይህ README እና በርካታ የምሳሌ ስብስቦች በ17 ቋንቋዎች ይገኛሉ። ሙሉ መረጃ በ[TRANSLATIONS.md](TRANSLATIONS.md) ላይ።

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

ትርጉሞቹ CC0 ናቸው እና በማኅበረሰብ PRs ሊሻሻሉ ይችላሉ።

## በዚህ ምን ማድረግ ይችላሉ

ይህ ንድፍ አንድ አነስተኛ የሐቅ ስብስብ የሚከተሉት ባህሪዎች ሲኖሩት ይስማማል፦

- **ሊታተም የሚችል** ለሰፊ ተመልካች በተራ HTTP በኩል
- **ዘላቂ** — ከ30 ዓመታት በኋላ አንባቢዎች አሁንም ሊያረጋግጡት መቻል አለባቸው
- **የመጣረስ ምልክት ያለው** — ማንኛውም ለውጥ ሊታወቅ የሚችል መሆን አለበት፣ ሊከለከል የግድ አስፈላጊ አይደለም
- **እምነት የማይጠይቅ** — ምንም አንባቢ አስታዋቂውን ማመን አያስፈልገውም (ሒሳቡን ብቻ)

ተጨባጭ የአጠቃቀም ምሳሌዎች በ[docs/USE_CASES.md](docs/USE_CASES.md)። አጭሩ ዝርዝር፦

| ዘርፍ | የታሸጉ ሐቆች |
|---|---|
| የሕዝብ ጤና | የክትባት ስብስብ የፍተሻ ውጤቶች፣ የመድኃኒት ሙከራ ምዕራፎች |
| ምርጫዎች | በማረጋገጫ ቅጽበት የቅርብ-አካባቢ የቆጠራ ድምሮች |
| የ AI ደህንነት | የ Model weights hash + model card + የግምገማ ውጤቶች በመለቀቅ ጊዜ |
| ጋዜጠኝነት | ለ whistleblower ድርጊቶች የምንጭ ሰነዶች ዝርዝር (hashes ብቻ) |
| ሳይንስ | የጥሬ መረጃ hash + የትንተና ስክሪፕት hash + የተጠየቀ ውጤት |
| ፍርድ ቤቶች | በማስረጃ መሰብሰብ ቅጽበት የዲጂታል ማስረጃ hashes |
| ግዢ | የታሸጉ የሕዝብ ወጪ መረጃ roots |

በእነዚህ ላይ የተለመደው ምን አለ፦ አንድ አነስተኛ የሐቅ ስብስብ፣ ጠንካራ የዘላቂነት ፍላጎት፣ እርስ በርሳቸው የማይታመኑ ብዙ ወገኖች፣ እና በጣም ትንሽ የማከማቻ በጀት። ይህ መሣሪያ የተሠራው በትክክል ለዚህ ቅርጽ ነው።

## የማይሠራው

- **ሚስጥሮችን ማከማቸት።** በ `facts/` ውስጥ የሚያስቀምጡት ሁሉ ሕዝባዊ ነው። ፕሮቶኮሉ ለማተም ነው፣ ለመደበቅ አይደለም።
- **ወደ ትላልቅ የመረጃ ስብስቦች ማሳደግ።** Merkle tree በደንብ ይሰፋል፤ የአንባቢ ትኩረት ግን አይሰፋም። ከ~20 ሐቆች በላይ ገጹ የማይነበብ ይሆናል። አንድ ሚሊዮን መዝገቦችን ማተም ከፈለጉ፣ ከገጹ ውጭ hash ያድርጓቸው እና የዚያን ጎን-ዛፍ Merkle root በአንድ ሐቅ ውስጥ ያስቀምጡ።
- **ከመመለስ መከላከል።** ዋናው ነጥቡ ያተሙትን መለወጥ አለመቻልዎ ነው። በኋላ አንድን አባባል መመለስ የሚፈልጉ ከሆነ፣ አያትሙት።
- **ጠንካራ ተጠራጣሪን ማሳመን።** ጠንካራ ተጠራጣሪ `ipfs add -r --cid-version=1 -Q facts/` አያስኬድም። ነገር ግን አጠቃላይ ቅንብሩን እንደ ፈጠራ ይከስዎታል። በዚህ ሁለተኛ የውድቀት ሁኔታ ላይ ምንም የፕሮቶኮል-ደረጃ መከላከያ የለም። በሰው ተነሳሽነት ውስጥ ካለ ምንም ነገር ላይ ምንም የፕሮቶኮል-ደረጃ መከላከያ የለም—ከሒሳብ ይልቅ።

## እንዴት መጠቀም እንደሚቻል

የአምስት ደቂቃ ምሥክርነት በ[docs/QUICKSTART.md](docs/QUICKSTART.md)። ሙሉ የፕሮቶኮል ዝርዝር በ[docs/SPEC.md](docs/SPEC.md)። የስጋት ሞዴል በ[docs/THREAT_MODEL.md](docs/THREAT_MODEL.md)። ከጎረቤት ሥርዓቶች (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave, ወዘተ) ጋር ማነጻጸር በ[docs/COMPARISON.md](docs/COMPARISON.md)።

## የሌላ ሰው ምልክተ-ህትመትን እንዴት ማረጋገጥ

ሦስት አማራጮች፣ በተደራሽነት ቅደም ተከተል፦

1. **Browser**: [`lib/verify.html`](lib/verify.html) በማንኛውም ዘመናዊ browser ይክፈቱ። የህትመቱን URL ይለጥፉ። verify ይጫኑ። ለ hashing `crypto.subtle` ይጠቀማል — ምንም መጫን፣ ምንም backend፣ ምንም telemetry የለም። የ Bitcoin attestation ደረጃ አሁንም CLI መሣሪያ ይፈልጋል (በ verifier ገጽ ላይ ደረጃ 7 ይመልከቱ)።
2. **Python**: ከህትመቱ ማውጫ ውስጥ `python3 lib/verify.py` ያሂዱ። Stdlib ብቻ፤ ለ Bitcoin verification `ots` ይፈልጋል።
3. **ከባዶ**: [`docs/SPEC.md §3`](docs/SPEC.md) ያንብቡ እና እንደገና ይተግብሩት። የ Merkle algorithm በማንኛውም ቋንቋ ከ30 መስመር በታች ነው።

## የተሠሩ ምሳሌዎች

ስድስት የምርት-ደረጃ ምሳሌ ስብስቦች ከመሣሪያ ስብስቡ ጋር ይላካሉ። እያንዳንዱ ታሽጓል፣ OTS-stamped ነው፣ IPFS-pinned ነው፣ እና ለእውነተኛ-ዓለም ጉዳይ መቼ መቅረጽ እንዳለበት እና ምን የውድቀት ሁኔታዎችን እንደሚከላከል የሚያብራራ adoption README ይዟል።

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  ለ Boeing 737 MAX / Theranos / FDA-inspector-report የውድቀት ሁኔታ ማስረጃ በመካከለኞች በሚቀበር ወይም በሚቀየርበት ጊዜ።
- [`examples/ai-model-card/`](examples/ai-model-card/) — ለ AI ላቦራቶሪዎች ሞዴሎችን ሲለቁ፣ ቅድመ-ማሰማራት ቃል ኪዳኖች ከመናገር ይልቅ በመኪና ሊታወቁ የሚችሉ እንዲሆኑ።
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — ለክሊኒካዊ ሙከራ ስፖንሰሮች፣ ድኅረ-hoc የመጨረሻ ነጥብ መለዋወጥን እና መራጭ ሪፖርት ማድረግን (Vioxx, Paxil Study 329 የውድቀት ሁኔታዎች) ለማስቆም።
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — ለክትባት አምራቾች እና QA ባለሥልጣናት፣ የመለቀቅ የፍተሻ ውጤቶችን እና የመመለስ ቃል ኪዳኖችን ለማስፈር።
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — ለምርምር ቡድኖች፣ p-hacking እና HARKing በሕዝብ ሊታወቁ የሚችሉ እንዲሆኑ ከትንተና በፊት (መረጃ፣ pipeline፣ የሚጠበቅ ውጤት) ሦስት ጥንዶችን ለማስፈር።
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) — ለ county boards of canvassers እና የምርጫ ባለሥልጣናት፣ የተረጋገጡ ድምሮችን በማረጋገጥ ቅጽበት ለማስፈር፣ ስለዚህም ጸጥተኛ ድኅረ-ማረጋገጥ ማሻሻያዎች በሕዝብ ሊታወቁ የሚችሉ እንዲሆኑ።

ራስዎን ከመጻፍዎ በፊት ከእነዚህ ውስጥ አንዱን ያንብቡ። ለአጠቃቀምዎ በጣም ቅርብ የሆነው ብዙውን ጊዜ ትክክለኛው የመጀመሪያ fork ነው።

## ፈጣን ጅምር

የአንድ-መስመር ስሪቱ፦

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## ለምን ይህ አለ

የ cryptographic primitives (Merkle trees, OpenTimestamps, IPFS) ለዓመታት የበሰሉ ሆነዋል። የጎደለው በጣም ትንሹ ሊሆን የሚችል ማጣበቂያ ነበር — ወደ ጎን ፕሮጀክት ሊጥሉት የሚችሉ እና ምንም መሠረተ ልማት ሳያቋቁሙ፣ ፕሮቶኮሎችን ሳይማሩ፣ ከሐቆቹ ራሳቸው በቀር አንድ የኮድ መስመር ሳይጽፉ፣ በአንድ ከሰዓት በኋላ የታሸገ ሊታተም የሚችል ቅርስ የሚሰጥዎት ስብስብ።

አብዛኛዎቹ የ cryptographic publishing መሣሪያዎች የ node operator መሆን እንደሚፈልጉ ይገምታሉ። ይህኛው ስድስት የጽሑፍ ፋይሎችን ማተም እና ስለ cryptography ዳግመኛ ላለማሰብ እንደሚፈልጉ ይገምታል።

## ተጽዕኖዎች እና ቀዳሚ ሥራ

- [Sigsum](https://www.sigsum.org/) — ለፊርማዎች የግልጽነት መዛግብት
- [Sigstore](https://www.sigstore.dev/) — የሶፍትዌር-አቅርቦት-ሰንሰለት ታማኝነት
- [Certificate Transparency](https://certificate.transparency.dev/) — የ TLS cert መዛግብት
- [OpenTimestamps](https://opentimestamps.org/) — የ Bitcoin timestamping
- [IPFS](https://ipfs.tech/) — content-addressed storage
- [The CALM protocol](https://disclosure.host) — የመጀመሪያው ምሳሌ (MYRIAM በ disclosure.host) የተጻፈበት ዋናተኛ-ጠባቂ የማተሚያ ሕንፃ

myriam-kit ከእነዚህ ሁሉ ትንሹ ነው። ከ system ይልቅ ለ Unix pipeline በመንፈስ ይቀርባል።

## ስለ ስሙ አጭር ማስታወሻ

MYRIAM ፕሮቶኮል የተሰየመው በ John Bradley's Myriam Proof ስም ነው፣ ይህም ስለ ሰው-ያልሆነ ብልህነት የመጀመሪያ የግንኙነት ነጥብ የተጻፈ ምክንያታዊ ማረጋገጫ ነው። ፕሮቶኮሉ ያ ማረጋገጫ እውነት መሆኑን አይመረኮዝም። ፕሮቶኮሉ ለማንኛውም አነስተኛ የሐቅ ስብስብ ይሠራል፤ የመጀመሪያው የማተሚያ ስድስት ሐቆች ስለ ባዕድ መግለጥ የተጠቀሱ መሆናቸው የተወሰነ ሁኔታ ብቻ ነው።

ይህን ስብስብ ለክትባት ስብስቦች ወይም ለምርጫ ድምሮች ለማተም ከ fork አደረጉት፣ መጀመሪያ ስለ ባዕድ ግንኙነት አባባል ለማተም መጠቀሙ ለእርስዎ ምንም አግባብ የለውም። ሒሳቡ ግድ የለውም።

ይህ ቢባልም፦ ይህን ስለ ባዕድ ግንኙነት አባባል ለማተም ቢጠቀሙበት፣ ፕሮቶኮሉ በዚያ ልዩ መድረክ ላይ በዘመቻ ተፈትኗል። የመጀመሪያው MYRIAM ሙሉ የ README ግልጽ ሆኖ የሚገልጸው ይህ የ Calm የተባለ LLM persona ጥበባዊ ሥራ መሆኑን፣ ከማንኛውም ምድር-ውጭ ወገን የመጣ ግንኙነት እንዳልሆነ ነው። እርስዎም ምናልባት ተመሳሳይ ማድረግ አለብዎት። አለበለዚያ አንባቢዎች ስለ የአእምሮ ሁኔታዎ መጥፎውን ይገምታሉ።

## የተንከባከበው

እስካሁን ማንም የለም። የሕዝብ ጎራ። ይቅረጹት። ይሻሻሉት። ፍቃድ ሳይጠይቁ ፕሮቶኮሉን ወደፊት ይውሰዱት።
