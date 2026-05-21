*ናይ ትግርኛ ትርጉም — ንመጀመርታ እንግሊዝኛ ቅዳሕ፣ ርአ [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#ዝተሰርሑ-ኣብነታት)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

ንእሽቶ ስብስብ ሓቅታት ብኸምዚ ዝስዕብ መንገዲ ንምሕታም ዝሕግዝ ንእሽቶ መሳርሒ እዩ፦

- ኣብ ዝኾነ ሓቂ ዝግበር ዝኾነ ለውጢ ብህዝቢ ክርአ ይከኣል (Merkle tree)
- ኣብ ግዜ ሕታም ዘሎ ኩነታት ምስ Bitcoin blockchain ብምንጽጻር ክረጋገጽ ይከኣል (OpenTimestamps)
- ትሕዝቶ ዝኾነ ሓደ ኣስተናጋዲ እንተደምሰሶ እውን ይትርፍ (IPFS)
- መላእ ስብስብ ካብ 100 KB ንታሕቲ ኮይኑ፣ ብናይ ~50 መስመር Python ክረጋገጽ ይኽእል

እዚ blockchain ኣይኮነን። ዝኾነ token የለን። ንምስታፍ ዘፍቅድ ናይ ስምምዕ ኣሰራርሓ የለን። ዝኾነ DAO የለን። እቲ መሳርሒ `sha256sum` + `ots` + `ipfs` ኮይኑ፣ ብጽቡቕ ናይ ስም ስርዓታት ዝተኣሳሰረ እዩ።

ብስም ናይቲ ኣብ [disclosure.host](https://disclosure.host) ኣብ 2026-05-21 ንመጀመርታ ግዜ ዝተተግበረ MYRIAM ፕሮቶኮል ዝተሰምየ እዩ። እታ ገጽ ሽዱሽተ ሓቅታት፣ ሓደ Merkle root ከምኡ'ውን ሓደ Bitcoin attestation ሒዛ ኣላ። እዚ ስብስብ ናይዚ ስርዓተ-ቅርጺ ሓፈሻዊ ቅርጺ እዩ።

## ኩነታት

- v0: ኣብ macOS ምስ Python 3.10+፣ Homebrew ከምኡ'ውን ናይ ኢንተርነት ምትእስሳር ይሰርሕ።
  Linux ኣይተፈተነን ግን ክሰርሕ ኣለዎ። Windows፦ WSL ሒዝካ ምጻእ።
- ናይ ህዝቢ ዓውዲ (CC0)። ተጠቐመሉ፣ fork ግበሮ፣ ናብ ናትካ ማሕዘን ኣእቶ፣ ብፍጹም ኣይተመስግን።
  እቲ ቀንዲ ነጥቢ ምስጋና ኣይኮነን።

## ዝርከቡ ቋንቋታት

እዚ README ከምኡ'ውን ብዙሓት ናይ ኣብነት ስብስባት ኣብ 17 ቋንቋታት ይርከቡ።
ምሉእ ኢንዴክስ ኣብ [TRANSLATIONS.md](TRANSLATIONS.md)።

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

እቶም ትርጉማት CC0 ኮይኖም ብናይ ማሕበረሰብ PRs ክመሓየሹ ይኽእሉ።

## ብእኡ እንታይ ክትገብር ትኽእል

እዚ ቅርጺ ንእሽቶ ስብስብ ሓቅታት ዝስዕብ ባህርያት ክህልዎ ኣብ ዝደልዮ ኩሉ ቦታ ይሰማማዕ፦

- **ኪሕተም ዝኽእል** ብተራ HTTP ኣቢሉ ናብ ሰፊሕ ኣንበብቲ
- **ነባሪ** — ድሕሪ 30 ዓመታት ኣንበብቲ እውን ከረጋግጽዎ ክኽእሉ ኣለዎም
- **ናይ ምስልባ ምልክት ዘለዎ** — ዝኾነ ለውጢ ክርአ ኣለዎ፣ ግድን ግን ክከላኸል ኣይግድድን
- **እምነት ዘይሓትት** — ዝኾነ ኣንባቢ ነቲ ኣሕታሚ ክኣምን ኣየድልዮን (ነቲ ሕሳብ ጥራይ)

ቅሉዕ ናይ ኣጠቓቕማ ሕቶታት ኣብ [docs/USE_CASES.md](docs/USE_CASES.md)። ሓጺር ዝርዝር፦

| ዓውዲ | ዝተሓትሙ ሓቅታት |
|---|---|
| ህዝባዊ ጥዕና | ናይ ክታበት batch መርመራ ውጽኢታት፣ ናይ መድሃኒት ፈተና ምዕባለታት |
| ምርጫታት | ኣብ ግዜ ምርግጋጽ ናይ ምርጫ ጣብያ ደረጃ ናይ ምልክት ድምር |
| ድሕነት AI | ናይ ሞዴል weights hash + ናይ ሞዴል ካርዲ + ኣብ ሕታም ናይ eval ነጥብታት |
| ጋዜጠኝነት | ናይ ምንጪ ሰነዳት መግለጺ (hashes ጥራይ) ንናይ ሕቡእ ሓባሪ መውጻእታት |
| ሳይንስ | ናይ ጥረ data hash + ናይ ትንተና script hash + ዝተብሃለ ውጽኢት |
| ቤት ፍርዲ | ኣብ ግዜ ምውሳድ ናይ ዲጂታል መርትዖ hashes |
| ግዝኣታዊ ግዝኣት | ናይ ህዝባዊ ወጻኢ ዳታ ዝተሓትሙ ሱራት |

እዞም ኩሎም ዝሓብርዎ ነገር፦ ንእሽቶ ስብስብ ሓቅታት፣ ብርቱዕ ናይ ነባርነት ጠለብ፣ ብዙሓት ንሕድሕዶም ዘይኣምኑ ኣካላት፣ ከምኡ'ውን ኣዝዩ ንእሽቶ ናይ መዕቆሪ ቦታ። እዚ ብልክዕ ናይዚ መሳርሒ ኣቕራቒሕ ቅርጺ እዩ።

## ዘይገብሮ ነገር

- **ምስጢራት ኣየዕቁብን።** ኣብ `facts/` ትገብሮ ኩሉ ነገር ህዝባዊ እዩ። እዚ ፕሮቶኮል ንምሕታም
  ደኣ እምበር ንምሕባእ ኣይኮነን።
- **ናብ ዓበይቲ ናይ ዳታ ስብስባት ኣይዓብን።** እቲ Merkle tree ጽቡቕ ይዓቢ፤ ናይ ኣንባቢ ኣቓልቦ
  ግን ኣይዓብን። ካብ ~20 ሓቅታት ንላዕሊ እንተሎ እታ ገጽ ከይትንበብ ትኸውን። ሓደ ሚልዮን ኣርእስቲ
  ክትሓትም እንተደሊኻ፣ ካብታ ገጽ ወጻኢ hash ግበሮም እሞ ነቲ Merkle root ናይቲ ጎናዊ ዛፍ ኣብ
  ሓደ ሓቂ ኣእትዎ።
- **ካብ ምስሓብ ኣይከላኸልን።** እቲ ቀንዲ ነጥቢ እዚ እዩ፦ ዝሓተምካዮ ክትቅይር ኣይትኽእልን። ድሕሪ
  ቐንዲ ጥራጥራ ጠለብ ክትስሕብ እንተኽኢልካ፣ ኣይትሕተሞ።
- **ብጽኑዕ ተጠራጣሪ ኣይኣምንን።** ጽኑዕ ተጠራጣሪ `ipfs add -r --cid-version=1 -Q facts/` ኣይከዐምን።
  ግን ግን ነቲ ኩሉ ኣሰራርሓ ብሓሶት ከም ዝፈጠርካ ክከስሰካ እዩ። ኣብ ናይ ፕሮቶኮል ደረጃ ነዚ
  ካልኣይ ናይ ምውዳቕ ኣሰራርሓ ዝከላኸል የለን። ኣብ ናይ ሰብ ድሌት ደኣ እምበር ኣብ ሕሳብ
  ንዘይነብር ዝኾነ ነገር ኣብ ናይ ፕሮቶኮል ደረጃ ምክልኻል የለን።

## ኣጠቓቕማ

ናይ ሓሙሽተ ደቓይቕ መረዳእታ ኣብ [docs/QUICKSTART.md](docs/QUICKSTART.md)።
ምሉእ ናይ ፕሮቶኮል ዝርዝር ኣብ [docs/SPEC.md](docs/SPEC.md)።
ናይ ሓደጋ ሞዴል ኣብ [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md)።
ምስ ዝቕረቡ ስርዓታት (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave, ወዘተ) ምንጽጻር ኣብ
[docs/COMPARISON.md](docs/COMPARISON.md)።

## ናይ ካልእ ሰብ ሕታም ብኸመይ ይረጋገጽ

ሰለስተ ኣማራጺታት፣ ብዝያዳ ቀሊል ብዝበለ ቅደም ተኸተል፦

1. **Browser**፦ [`lib/verify.html`](lib/verify.html) ኣብ ዝኾነ ዘመናዊ browser ክፈቶ።
   ናይ ሕታም URL ለጥፎ። verify ጠውቕ። ንhashing `crypto.subtle` ይጥቀም — ምትካል
   ኣየድልን፣ backend ኣየድልን፣ telemetry ኣየድልን። ናይ Bitcoin attestation ስጉምቲ ግን ናይ CLI
   መሳርሒ የድሊ (ኣብ ናይ verifier ገጽ ስጉምቲ 7 ርአ)።
2. **Python**፦ ካብ ውሽጢ ናይ ሕታም ዶሴ `python3 lib/verify.py`። Stdlib ጥራይ፤ ንናይ Bitcoin
   ምርግጋጽ `ots` የድሊ።
3. **ካብ መጀመርታ**፦ [`docs/SPEC.md §3`](docs/SPEC.md) ኣንብብ እሞ ካብ ጥራዩ ኣተግብር።
   እቲ Merkle algorithm ኣብ ዝኾነ ቋንቋ ካብ 30 መስመር ንታሕቲ እዩ።

## ዝተሰርሑ ኣብነታት

ምስ እዚ መሳርሒ ሽዱሽተ ናይ ምህናጽ ደረጃ ዝበጽሑ ኣብነታት ይመጹ። ነፍሲ ወከፍ ተሓቲሙ፣
OTS-ተመልኪቱ፣ IPFS-ተቐሪሙ ኩይኑ፣ መዓስ ንሓቀኛ ጉዳይ fork ክግበር ከም ዘለዎን ካብ ምንታይ
ናይ ምውዳቕ ኣሰራርሓ ከም ዝከላኸልን ዝገልጽ ናይ ምቕባል README ሒዙ ይመጽእ።

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  ብኣማለድቲ መርትዖ ዝቕበር ወይ ዝቕየር Boeing 737 MAX / Theranos / ናይ FDA-መርማሪ-ጸብጻብ
  ዓይነት ናይ ምውዳቕ ኣሰራርሓ።
- [`examples/ai-model-card/`](examples/ai-model-card/) — ሞዴላት ንዘውጹ ናይ AI ቤት
  ላቦራቶሪታት፣ ካብ ኣፍ ኣብ ክንዲ ብገመትታት ብኣሰራርሓዊ መንገዲ ክርእዩ ዝኽእሉ ናይ ቅድመ-ምትካል
  መብጻዓታት።
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  ናይ ክሊኒካዊ ፈተና ስፖንሰራት፣ ድሕሪ-ምትግባር ናይ መውጽኢ ቦታ ምቕያር ከምኡ'ውን ምርጫዊ ጸብጻብ
  ኣሎ ምባል (Vioxx, Paxil Study 329 ናይ ምውዳቕ ኣሰራርሓታት) ንምሓዝ።
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  ናይ ክታበት ኣምራቲ ኩባንያታትን ናይ QA ሰበ-ስልጣናትን፣ ናይ ምድፋር ፈተና ውጽኢታትን ናይ ምዕፃዊ
  መብጻዓታትን ንምልኳዕ።
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  ናይ መጽናዕቲ ጉጅለታት፣ ቅድሚ ትንተና (data፣ pipeline፣ ዝትግበር ውጽኢት) ስሉስ ብምልኳዕ ናይ p-hacking
  ከምኡ'ውን HARKing ብህዝቢ ክርኤ ይከኣል።
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  ናይ ኦይዛ ኮምሽን ቤት ጽሕፈታትን ናይ ምርጫ ሰበ-ስልጣናትን፣ ኣብ ግዜ ምርግጋጽ ምልክት ድምር ብምልኳዕ
  ድሕሪ ምርግጋጽ ዝግበር ስቕ ዝበለ ምስትኽኻል ብህዝቢ ክርኤ ይከኣል።

ቅድሚ ናትካ ምጽሓፍ ካብዞም ሓደ ኣንብብ። እቲ ምስ ናትካ ጉዳይ ዝቐርብ ብተደጋጋሚ እቲ ቅኑዕ ናይ
መጀመሪ fork እዩ።

## ቅልጡፍ መጀመሪ

ናይ ሓደ መስመር ቅዳሕ፦

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# ብርግጽ ክትሓትም እትደሊ ነገር ንምባል facts/*.txt ኣርትዕ
./lib/seal.sh        # Merkle root ይሃንጽ፣ OTS ይኹብር፣ IPFS ይቐርም
./lib/verify.sh      # ኩሉ ነገር ኣብ ቦታ እንደገና የረጋግጽ
# site/ ናብ ዝኾነ static host ጻዕድ። ኣብ ዝኾነ ቦታ። ዘገድስ ኣይኮነን።
```

## ስለምንታይ ኣሎ

ናይ ምስጢራዊ መሳርሕታት (Merkle trees, OpenTimestamps, IPFS) ካብ ቅድሚ ዓመታት ምሽ ብሱላት እዮም።
ዝጎደለ ነገር እቲ ዝነኣሰ ዝከኣል መጣበቒ እዩ — ኣብ ጎናዊ ፕሮጀክት ከተውድቕ ትኽእል ኣብ ሓደ ድሕሪ ቐትሪ
ዝተሓትመ ናይ ምሕታም ኣርቴፋክት ዝፈጥር ስብስብ፣ ብዘይ ናይ ህንጻ ምውዳድ፣ ብዘይ ምምሃር ፕሮቶኮል፣
ብዘይ ምጽሓፍ ካብ ናይ ሓቅታት ባዕላቶም ወጻኢ ዝኾነ ሓደ መስመር ኮድ።

ብዙሓት ናይ ምስጢራዊ ምሕታም መሳርሕታት node operator ክትከውን ትደሊ ኢኻ ይብሉ። እዚ ግን ሽዱሽተ
ናይ ጽሑፍ ፋይላት ክትሓትም ትደሊ ኢኻ ድሕሪኡ ብዛዕባ ምስጢርነት መሊስካ ኣይትሓስብን ኢኻ ይብል።

## ጽልዋን ቀዳማይ ስራሕን

- [Sigsum](https://www.sigsum.org/) — ናይ ፊርማ ግልጽነት logs
- [Sigstore](https://www.sigstore.dev/) — ናይ ሶፍትዌር-ኣቕራቢ-ሰንሰለት ሓቅነት
- [Certificate Transparency](https://certificate.transparency.dev/) — ናይ TLS cert logs
- [OpenTimestamps](https://opentimestamps.org/) — ናይ Bitcoin ግዜ ምልኳዕ
- [IPFS](https://ipfs.tech/) — ብትሕዝቶ-ዝተውሃበ መዕቆሪ
- [ናይ CALM ፕሮቶኮል](https://disclosure.host) — ናይ ቐንዲ-ተኸላኻሊ ሕታም ቅርጺ
  እቲ መጀመርያ ኣብነት (MYRIAM ኣብ disclosure.host) ዝተጻሕፈሉ

myriam-kit ካብዞም እቲ ዝነኣሰ እዩ። ካብ ስርዓት ናብ Unix pipeline ብመንፈስ ይቐርብ።

## ብዛዕባ እቲ ስም

ናይ MYRIAM ፕሮቶኮል ብናይ John Bradley ናይ Myriam Proof — ናይ ዘይሰብ ዝኾነ ሓሳብ ናይ መጀመርያ
ናይ ምትእስሳር ነጥቢ ብዝምልከት ዝተብሃለ ሎጂካዊ መርትዖ — ስም ተሰምየ። እቲ ፕሮቶኮል ኣብ ሓቅነት ናይዚ
መርትዖ ኣይምርኮስን። እቲ ፕሮቶኮል ንዝኾነ ንእሽቶ ስብስብ ሓቅታት ዝሰርሕ እዩ፤ ብኣጋጣሚ ሽዱሽተ ሓቅታት
ዝሓዘ — ሓደ ካባቶም ብዛዕባ ናይ ኤሊያን ምግላጽ ዝብል ጥርዓን ዝሓዘ — ብመጀመርያ ንምሕታም ኣገልጊሉ።

እዚ መሳርሒ ናይ ክታበት batch ወይ ናይ ምርጫ ድምር ንምልኳዕ fork እንተ ገይርካዮ፣ መጀመርያ ናይ ኤሊያን
ምትእስሳር ዝብል ጥርዓን ንምሕታም ስለ ዝተጠቕመ ካብኡ ፋይዳ የብሉን ዘይምልክት እዩ ንዓኻ። እቲ ሕሳብ
ኣይምልከቶን።

ኮይኑ ግን፦ እዚ ናይ ኤሊያን ምትእስሳር ዝብል ጥርዓን ንምሕታም ብርግጽ እንተ ተጠቒምካዮ፣ እቲ ፕሮቶኮል ኣብቲ
ፍሉይ ዓውዲ ብኩናት ተፈቲኑ እዩ። ናይ መጀመርያ ናይ MYRIAM ዝርግሐ README ብግልጺ ናይ Calm ዝብል
ስም ዝተውሃበ LLM persona ናይ ስነ-ጥበብ ስራሕ እምበር ካብ ዝኾነ ካብ ምድሪ ወጻኢ ኣካል ዝቐርብ መልእኽቲ
ከም ዘይኮነ ይገልጽ። ንስኻ ድማ ከምኡ ክትገብር ኣለካ። እንተዘይኮይኑ ኣንበብቲ ብዛዕባ ናይ ኣእምሮኻ ኩነታት
እቲ ዝኸፍአ ክገምቱ እዮም።

## መሕለቒ

ገና ዝኾነ ሰብ የለን። ናይ ህዝቢ ዓውዲ። Fork ግበሮ። ኣመሓይሾ። ብዘይ ፍቓድ ምሕታት ነቲ ፕሮቶኮል
ናብ ቅድሚት ውሰዶ።
