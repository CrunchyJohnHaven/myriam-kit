# ሳይንሳዊ Reproducibility ስብስብ (Scientific Reproducibility Kit)

*የአማርኛ ትርጉም — ለመጀመሪያው የእንግሊዝኛ ስሪት፣ ይመልከቱ [README.md](README.md)*

ለምርምር ቡድኖች፣ ለ journals፣ እና ለ reproducibility-ላይ-የተመሠረቱ ተቋማት የተዘጋጀ turnkey myriam-kit ምሳሌ ነው፣ ከጽሑፍ ወይም preprint ጎን ለጎን Bitcoin-anchored፣ የመጣረስ-ምልክት ያለው የ reproducibility manifest ለማተም ለሚፈልጉ።

## ይህ ስብስብ የሚያመነጨው

ለአንድ ጥናት፣ የታሸገ ሕትመት የሚከተሉትን ይይዛል፦

1. የጥናት መታወቂያ (የጽሑፍ ርዕስ፣ ደራሲዎች፣ ተቋም፣ ገንዘብ-ሰጪዎች፣ COI)
2. **የጥሬ መረጃ archive SHA-256** — ቀኖናዊ የመረጃ ስብስብ
3. **የ Analysis pipeline hash** — script + Docker image digest + pinned dependencies
4. **የተጠበቀ የ output bundle hash** — ታማኝ reproducer ማመንጨት ያለበት
5. የ Reproduction protocol + ድኅረ-ውጤት የሕትመት ቃል ኪዳኖች
6. የመፈረም principal(s)

ማኅተሙ ለ **ቅድመ-analysis** ደረጃ የተወሰነ ነው፦ መረጃው ቀዝቅዟል፣ pipeline ተጠናቋል፣ የተጠበቀው output ተሰልቷል፣ ለጽሑፍ ጽሑፍ ለመጻፍ ዓላማ ምንም ውጤት ከመታየቱ በፊት ሁሉም።

## ይህ ስብስብ የሚከላከለው

**ማኅተሙ የሚይዛቸው የውድቀት ሁኔታዎች፦**

- **p-hacking**: ውጤቶችን ካዩ በኋላ ለ analysis post-hoc ለውጦች በታሸገው FACT 04 እና በታተመው pipeline መካከል ባለ diff ሊታወቁ ይችላሉ።
- **HARKing** (Hypothesizing After Results are Known): በ FACT 02 ውስጥ ያለው ቅድመ-የተመዘገበ መላምት byte-stable ነው።
- **ድኅረ-ጽሑፍ የመረጃ ማታለል**: በ FACT 03 ላይ የመረጃ archive ን እንደገና-hashing ማንኛውንም ማሻሻያ ያሳያል።
- **የ Pipeline drift**: በ FACT 04 ላይ የ analysis pipeline ን እንደገና-hashing ጸጥተኛ ለውጦችን ይይዛል።
- **የደራሲነት gaming**: ከህትመት በኋላ ደራሲዎችን በጸጥታ መጨመር ወይም ማስወገድ በታሸገው FACT 02 ላይ ሊታወቅ የሚችል ይሆናል።

**ያልተሸፈኑ የውድቀት ሁኔታዎች፦**

- በጥሬ-መረጃ ስብስብ ላይ ማጭበርበር (ማኅተሙ መረጃውን በማተም ቅጽበት ላይ ያስፍራል፣ በስብስብ ቅጽበት አይደለም)
- ባዮሎጂያዊ / ተጨባጭ የ Reproducibility-አለመኖር (ማኅተሙ ስሌታዊ reproducibility ብቻ ያስፍራል)
- የ Sample-size ወይም የሕዝብ-ቅቡልነት ጉዳዮች (እነዚህ የጥናት-ንድፍ ጥያቄዎች ናቸው)
- የመሠረታዊ ይገባኛል ጥያቄ እውነት (ማኅተሙ የተባለውን ያስፍራል፣ ዓለም ከይገባኛል ጥያቄው ጋር የሚስማማ ስለመሆኑ አይደለም)

## ይህን ስብስብ መቼ መጠቀም

በሚከተሉት ሁኔታዎች ላይ ማተምን ያስቡበት፦

- ከ OSF / GitHub time-stamps ባለፈ የፎረንሲክ ታማኝነት የሚፈልጉ የከፍተኛ-አደጋ analysis (clinical trial፣ AI system evaluation፣ replication study) የሚያካሂድ የምርምር ቡድን ከሆኑ
- አለመመጣጠን ስም-መከላከያ የሚፈልጉ ቀደምት-ሙያ ተመራማሪ ከሆኑ፦ የታሸገ ቅድመ-analysis ማለት የወደፊት "p-hack አደረጉ" ትችት የሕዝብ falsifier አለው
- ለጽሑፎች ንዑስ-ስብስብ cryptographic-grade pre-registration ለማበረታታት የሚፈልግ የ Journal editor ወይም የ replication-project መሪ ከሆኑ
- Post-hoc tweaks ትርጉም ያላቸው የመስክ ውጤቶች ያላቸው analysis ላይ የሚሠሩ ከሆኑ (psych, behavioral econ, medical research)

## ታሪካዊ የሞት / የጉዳት ቀዳሚ ምሳሌ

የዚህ ስብስብ የሞት-ተዛማጅነት ቀጥተኛ ያልሆነ ነው፦

- **የ Stem cell / cancer ምርምር Reproducibility-አለመኖር:** በርካታ ጽሑፎች በተሳሳተ መንገድ የተመረቱ clinical trials በኩል ለታካሚ ጉዳት አስከትለዋል። የመጀመሪያው pipeline የታሸገ ቅድመ-ምዝገባ ንፅፅሩን ያስፍር ነበር።
- **የ Tamiflu ውጤታማነት ክርክር:** የጥሬ-መረጃ መዳረሻ ስለተከራከረ Cochrane review ዓመታት ፈጀ። በሕትመት ጊዜ የታሸጉ የመረጃ-hashes የመረጃ-መዳረሻ ክርክሮችን ወዲያውኑ ሊፈቱ የሚችሉ ያደርጋቸው ነበር።
- **አጠቃላይ የ Reproducibility-አለመኖር ቀውስ:** የ Reproducibility-የሌለው biomedical ምርምር የመስክ-ደረጃ የሞት ወጪ ጠቃሚ ነው (Begley & Ellis 2012 ከ50% በላይ የ preclinical ግኝቶች reproducibility-የሌላቸው እንደሆኑ ገምተዋል)። Cryptographic anchoring አንድ መዋቅራዊ ሌቨር ነው።

## ይህን ስብስብ እንዴት fork ማድረግ

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## ካለ የምሁር መሠረተ ልማት ጋር ውህደት

- **arXiv / bioRxiv / medRxiv**: በ abstract ወይም በተጨማሪ ቁሳቁሶች ውስጥ የ MYRIAM ማኅተም URL ወይም IPFS CID ይጨምሩ
- **OSF**: ከባህላዊው ቅድመ-ምዝገባ ቅጽ ጎን የ Seal artifact ን ለ OSF ፕሮጀክት ያያይዙ
- **AsPredicted**: በቅድመ-ምዝገባ ሰነድ ውስጥ የ MYRIAM ማኅተም URL ይጨምሩ
- **GitHub**: የ analysis pipeline commit hash የ FACT 04 የሚያስፍረው ነው፤ GitHub ምንጩን ይሰጣል፣ MYRIAM bytes ን ያስፍራል
- **Zenodo / Figshare / OpenAIRE**: ጥሬ መረጃውን ያስቀምጡ፣ ከዚያም የ Deposit ን hash ያትሙ፤ ማኅተሙ ከ Deposit metadata ይልቅ በጸጥታ ለመተካት forensically ይበልጥ ከባድ ነው
- **የ Journal ተጨማሪ ቁሳቁሶች**: በ submission ጊዜ የ MYRIAM ማኅተም artifact ን እንደ ተጨማሪ ፋይል ይጨምሩ

## ይህ ስብስብ የማይተካው

- IRB / የ ethics-committee ማጽደቅ
- Peer review
- Replication ጥናቶች (ስሌታዊ reproducibility ≠ ተጨባጭ reproducibility)
- ለ Sensitive መረጃ የመረጃ-መዳረሻ ስምምነቶች

## ስለ ደራሲ ቅደም ተከተል እና ምስጋና ማስታወሻ

ማኅተሙ በሚታተምበት ጊዜ AUTHOR LIST ን ያስፍራል። ድኅረ-ህትመት የሚነሱ የደራሲነት ክርክሮች በታሸገው ዝርዝር ላይ ሊገመገሙ ይችላሉ። ይህ ትንሽ ተጠያቂነት-ሌቨር ነው — በጸጥታ ለሚታከሉ ወይም ለሚነሱ ECRs ጠቃሚ።

## ፍቃድ

የሕዝብ ጎራ (CC0)። ይጠቀሙበት፣ ይቀይሩት፣ ችላ ይበሉት፣ ይቅረጹት።
