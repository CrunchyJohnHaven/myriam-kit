# የመድኃኒት ሙከራ ቅድመ-ምዝገባ ስብስብ

*የአማርኛ ትርጉም — ለመጀመሪያው የእንግሊዝኛ ስሪት፣ ይመልከቱ [README.md](README.md)*

ClinicalTrials.gov፣ EU CTR፣ ወይም ሌሎች የግዛት መዝገቦች ላይ ካለው ምዝገባ
**በተጨማሪ** በ tamper-evident፣ Bitcoin-anchored መንገድ ሙከራን ቅድመ-መመዝገብ
ለሚፈልጉ የክሊኒካዊ-ሙከራ sponsors እና አካዳሚካዊ ተመራማሪዎች የተዘጋጀ turnkey
myriam-kit ምሳሌ።

## በ MYRIAM ሥር *በተጨማሪ* ቅድመ-ለመመዝገብ ለምን?

ካሉት የሙከራ መዝገቦች (ClinicalTrials.gov፣ EU CTR፣ ISRCTN) የተመዘገቡ
የታማኝነት ድክመቶች አሉ፦

- ClinicalTrials.gov sponsors ከመጀመሪያው ምዝገባ **በኋላ** endpoints፣ የናሙና-መጠን
  ስሌቶችን፣ እና የመተንተኛ ዕቅዶችን እንዲያዘምኑ ይፈቅዳል፣ የማሻሻያ ቀኖች በመዝገቡ
  ውስጥ ይታያሉ ግን የ*ይዘት* ለውጦች ሁልጊዜ በ cryptographic መንገድ anchored
  አይደሉም።
- በርካታ ትላልቅ ጥናቶች (Goldacre et al., 2019፤ Mathieu et al., 2009) በዘርፉ ሁሉ
  ስርዓታዊ post-hoc endpoint switching መዝግበዋል።
- በመጽሔቶች የሚደረግ የአርትዖት ማስከበር (CONSORT፣ ICMJE) የተወሰኑ ጉዳዮችን
  ይይዛል፤ ብዙዎቹ ያመልጣሉ።

የ MYRIAM ማኅተም ይህን ክፍተት ይዘጋል። Merkle root + Bitcoin OTS ደረሰኝ
ለ*ቅድመ-ምዝገባ* primary endpoint፣ statistical analysis plan፣ ወይም የ subgroup
ዝርዝር የተደረገ ማንኛውንም post-hoc ለውጥ በ cryptographic መንገድ ሊታወቅ የሚችል
ያደርገዋል። ማኅተሙን retcon ለማድረግ ከራሱ ምዝገባ ይልቅ በፎረንሲክ የበለጠ
አስቸጋሪ ነው።

ይህ ስብስብ የግዛት መዝገቦችን **ተጨማሪ ነው፣ ምትክ አይደለም**። እውነተኛ ሙከራ
ተገቢ በሆነው መዝገብ ውስጥ መመዝገብ AND በ MYRIAM ሥር መታተም አለበት።

## ይህ ስብስብ ምን የሚከላከለው

ይህ ሊረዳቸው የሚችለው ታሪካዊ የሞት ጉዳዮች፦

- **Vioxx (Merck፣ 2004)**: በ APPROVe ሙከራ ውስጥ የልብና-ደም ስርዓት ክስተቶች
  ቅድመ-ምዝገብ የሆነ endpoint ነበር ነገር ግን የታተመው ትንታኔ የሚታየውን ጉዳት
  የቀነሰ cutoff ተጠቅሟል። የቅድመ-ምዝገብ cutoff ማኅተም ከታተመው ጽሑፍ በፊት
  post-hoc cutoff ለውጥን በሕዝብ ሊታወቅ የሚችል ያደርግ ነበር።
- **Paxil/Study 329 (GSK/SmithKline፣ 2001)**: በታዳጊዎች ራስን-ማጥፋት ላይ
  አሉታዊ የሙከራ ዳታ በ post-hoc ትንታኔ እንደገና ተቀምሮ ነበር። የ endpoints
  የታሸገ ቅድመ-ምዝገባ መልሶ-ቅርጹን በሕዝብ ሊታወቅ የሚችል ያደርግ ነበር።
- **በርካታ የ oncology ሙከራዎች** survival benefit ሳይታይ ሲቀር survival
  endpoints ወደ surrogate endpoints (progression-free survival፣ response rate)
  የተቀየሩባቸው።

**ማኅተሙ በቀጥታ የሚይዛቸው የውድቀት ሁኔታዎች፦**

- **Endpoint switching**: ትክክለኛው primary ሲወድቅ secondary endpoint ወደ
  "primary" በ post-hoc ማስፋፋት። የማኅተሙ FACT 05 የቅድመ-ምዝገብ primary
  endpoint ይዟል፤ የታተመው primary endpoint ከእሱ ጋር መመሳሰል አለበት።
- **Outcome cherry-picking**: የሰሩትን ትንታኔዎች ብቻ መርጦ ሪፖርት ማድረግ።
  FACT 06 ሙሉውን የቅድመ-ምዝገብ analysis plan ይዟል፤ የታተሙት ትንታኔዎች
  ሁሉንም የቅድመ-ምዝገብ ማካተት አለባቸው።
- **Post-hoc subgroup mining**: ዳታውን ካዩ በኋላ "መድኃኒቱ ለ subgroup X
  ይሰራል" ብለው መከራከር። FACT 07 የቅድመ-ምዝገብ subgroup ዝርዝር ይዟል፤
  ሌላ ማንኛውም subgroup እንደ post-hoc መታየት አለበት።
- **Sample size revision**: የመካከለኛ አዝማሚያዎችን ካዩ በኋላ የናሙና መጠን
  ማሳደግ። FACT 06 የቅድመ-ምዝገብ sample size እና power calculation ይዟል።
- **የማይመቹ secondary endpoints ጸጥ ማድረግ**: FACT 05 ለ hierarchical testing
  secondary endpoints ቅድመ-ያስከትላል፤ ማንኛውም መልሶ-ማስከተል ወይም
  ማስወገድ ሊታወቅ የሚችል ነው።
- **አሉታዊ ውጤቶችን ማፈን**: FACT 08 የህትመት ቃል ኪዳን ይዟል፤ በተቃጠረው
  ጊዜ-ገደብ ውስጥ ለመታተም ያለመቻል በሕዝብ ሊታይ የሚችል ነው።

**ያልተሸፈኑ የውድቀት ሁኔታዎች፦**

- በሙከራ ማስፈጸም ራሱ ላይ ጥፋት (የተጭበረበረ ዳታ፣ የተጭበረበረ ምዝገባ)።
  ማኅተሙ *ዕቅዱን* ያስፍራል፣ *ማስፈጸምን* አይደለም።
- ሁሉንም ቅድመ-ምዝገብ ትንታኔዎች የሚያካትቱ ግን በተመቻቸ መንገድ የሚተረጉሙ
  ህትመቶች ላይ የተመረጡ ሪፖርቶች። ማኅተሙ ምን እንደጎደለ ይይዛል፤
  የትርጓሜ አድልዎን ሊይዝ አይችልም።
- በሙከራው ጊዜ ለታካሚ የሚደርስ ጉዳት። ማኅተሙ ሕግ እና ማስረጃ ነው፤
  የሙከራ-ማስፈጸም አደጋን አይቀንስም።

## ይህን ስብስብ መቼ መጠቀም

ቅድመ-ምዝገባን ማተም ግምት ውስጥ ማስገባት ይኖርብዎታል ከሆነ፦

- ለሕክምና ወይም ለሕግ ውሳኔዎች መረጃ ለመስጠት የሚውል ክሊኒካዊ ሙከራ — Phase 1
  እስከ 4 — sponsor ወይም የሚያስፈጽሙ ከሆኑ።
- ለቅድመ-ምዝገብ design፣ endpoints፣ እና analysis plan በሕዝብ የመታሰር ፍላጎት
  ካለዎት።
- ውጤቱን መቋቋም ይችላሉ፦ ሙከራው በቅድመ-ምዝገብ endpoints ካልተሳካ፣
  በዝምታ ወደ ሌላ የሰራ endpoint retcon ማድረግ አይችሉም።
- የቅድመ-ምዝገባ ታማኝነት እያደገ የሚጠየቅበት የምርምር ባህል (አካዳሚካዊ ሕክምና፣
  cooperative groups፣ NIH-funded research) ውስጥ የሚሳተፉ ከሆኑ።

ይህ ስብስብ *በተለይ* ጠቃሚ ነው፦

- በአካዳሚካዊ ተቋማት ውስጥ ላሉ investigator-initiated ሙከራዎች (sponsor ግፊት
  endpoints ን post-hoc ለመቀየር እውነተኛ ሆኖ አካዳሚካዊ ተመራማሪ
  ለመቃወም የስም-ማስከበር መነሳሳት ባለበት ስፍራ)።
- ለ open-science ሙከራዎች እና citizen-science ጥናቶች።
- ለረዥም የሙከራ-ማስፈጸም ታሪክ ለሌላቸው አነስተኛ biotechs ውስጥ drug-repurposing
  ሙከራዎች።
- "ይህን አልተናገርንም" የሚሉ የወደፊት ክርክሮች ሊደረጉ ለሚችሉበት፣ ለሕግ
  ማስረከቢያዎች መረጃ ለመስጠት የተዘጋጀ ማንኛውም ሙከራ።

## ይህን ስብስብ መቼ **አለመጠቀም**

ይህን ስብስብ **አይጠቀሙ** ከሆነ፦

- የሙከራ protocol በትክክል አሁንም በመለዋወጥ ላይ ከሆነ። ቅድመ-ይመዝገቡ protocol
  የመጨረሻ ሲሆን፣ ከዚያ በፊት አይደለም።
- ውጤቱ ምንም ይሁን ምን ለመታተም ቃል መግባት የማይችሉ ከሆነ። ማኅተሙ
  የመታተም-ውድቀትን በሕዝብ ሊታወቅ የሚችል ያደርጋል።
- ሙከራው analysis plan ለሕዝብ እንዳይታይ የሚከለክል የውድድር ኢንዱስትሪ
  ሚስጥራዊነት የሚያካትት ከሆነ። ማኅተሙ analysis plan ን ቋሚ የሕዝብ መዝገብ
  ያደርጋል፤ በግል አንድ ነገር የማተም መንገድ የለም።
- በ protocol ላይ ሕጋዊ እና ሥነ-ምግባራዊ ይሁንታ የሌለዎት ከሆነ። ማኅተሙ
  protocol ን እንደ ቃተሙት ይመዘግባል፤ በ IRB ወይም በስነ-ምግባር ኮሚቴ
  በ retroactive ሊጸድቅ አይችልም።

## ለእውነተኛ ቅድመ-ምዝገባ ይህን ስብስብ እንዴት fork ማድረግ

```bash
# 1. ይህን ምሳሌ ይቅዱ
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. ምናባዊ ይዘትን በእውነተኛ የሙከራ protocol ይዘት ይተኩ።
# እያንዳንዱ እውነታ ከመደበኛ ቅድመ-ምዝገባ ክፍል ጋር ይዛመዳል፦
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. እውነተኛውን ሙከራ ለማንጸባረቅ site/index.html ያዘምኑ።

# 4. ያስፍሩ (ምዝገባ ከመጀመሩ በፊት፣ database lock ከመደረጉ በፊት)፦
bash build/seal.sh

# 5. በአካባቢው ያረጋግጡ፦
python3 build/verify.py

# 6. ያሰማሩ፦
#    - የማኅተሙን URL ለሙከራዎ sponsor ድረ-ገጽ ላይ ያትሙ AND
#    - IPFS CID ን በሙከራው ClinicalTrials.gov መዝገብ "Description" ወይም
#      "References" መስክ ላይ ያክሉ፣ መዝገቡ የ cryptographic ማኅተምን ይሻገር።
```

**ወሳኝ ጊዜ**: ማኅተሙ ምዝገባ ከመጀመሩ በፊት መፈጠር አለበት። የመጀመሪያው
ታካሚ ከተመዘገበ በኋላ የተታሸገ ቅድመ-ምዝገባ በፎረንሲክ ብዙ የበለጠ ደካማ ነው።
ሐሳባዊ ሁኔታ፣ በ IRB ይሁንታ ቅጽበት ያስፍሩ።

## ካለ የቅድመ-ምዝገባ መሠረተ ልማት ጋር ውህደት

ስብስቡ ለመተካት ሳይሆን ለመቀላቀል የተነደፈ ነው፦

- **ClinicalTrials.gov / EU CTR / ISRCTN**: እንደ አስፈላጊነቱ ሙከራውን በግዛት
  መዝገብ ይመዝግቡ። ከዚያ በመዝገቡ "Description" ወይም "References" መስክ
  ውስጥ፣ MYRIAM-የታሸገ ህትመት ይገናኙ።
- **OSF (Open Science Framework)**: OSF ቅድመ-ምዝገባን በቀን ማኅተም ይደግፋል
  ነገር ግን Bitcoin anchoring አይደግፍም። MYRIAM ማኅተም በ OSF ምዝገባ ገጽ ላይ
  እንደ supplementary file ሊጨመር ይችላል፣ ይህም ሁለቱንም date-stamp እና
  Bitcoin-anchor ይሰጣል።
- **AsPredicted.org**: በተመሳሳይ — MYRIAM ማኅተምን እንደ supplementary URL
  ይገናኙ።
- **መጽሔቶች**: አንዳንድ መጽሔቶች (ለምሳሌ Trials፣ BMJ Open) ቅድመ-ምዝገባ
  URLs እንደ ማስረከቢያ ክፍል ይቀበላሉ። የ MYRIAM ማኅተም URL ከ registry URL
  ጋር ያካትቱ።

## ተቀባዮች (ተቆጣጣሪዎች፣ የመጽሔት ገምጋሚዎች፣ meta-analysts) የሚያገኙት

በ MYRIAM ሥር የተመዘገበ ሙከራ ለገምጋሚዎች የሚሰጠው፦

1. **protocol በተወሰነ ጊዜ የተጠናቀቀ መሆኑን ያረጋግጥ cryptographic ማስረጃ።**
   ገምጋሚዎች የማኅተሙን ጊዜ በ OTS receipt በኩል ማረጋገጥ ይችላሉ።
2. **የ protocol ጽሑፍ የ bytewise ጽናት።** የታተመውን methods section ከቅድመ-ምዝገብ
   design ጋር በመስፈር-በመስፈር ማወዳደር የሚችሉ ገምጋሚዎች።
3. **Endpoint switching መለየት።** በታሸገው FACT 05 እና የታተመው primary endpoint
   መካከል ቀላል diff ማንኛውንም መተካት ያሳያል።
4. **Analysis-plan deviation መለየት።** በታሸገው FACT 06 እና በታተሙት
   statistical methods መካከል ቀላል diff ማሻሻያዎችን ያሳያል።
5. **Selective subgroup reporting መለየት።** የታሸገው FACT 07 ሁሉንም
   የቅድመ-ምዝገብ subgroups ይዟል፤ በህትመቱ ውስጥ ያሉ ግን በማኅተሙ ውስጥ
   የሌሉ እንደ post-hoc መታየት አለባቸው።

ይህ systematic review እና meta-analysis ን ካለው ልምድ የበለጠ ቀላል ያደርጋል።

## ይህ ስብስብ ምን **አይደለም**

- ለ IRB / ethics-committee ይሁንታ ምትክ አይደለም።
- ለግዛት መዝገብ ምዝገባ ምትክ አይደለም።
- ሙከራው እንደታቀደ የሚካሄድ መሆኑ ዋስትና አይደለም።
- የታካሚ ስምምነት ወይም ሌሎች ሥነ-ምግባራዊ ሰነዶችን ለማስፈር መንገድ
  አይደለም (እነዚያ የራሳቸውን የማተም ዘዴ ይፈልጋሉ)።
- ከህትመት-በኋላ የሙከራ design ሂስ ጥበቃ አይደለም።

## በአሉታዊ-ውጤት ህትመት ላይ አንድ ማስታወሻ

በ FACT 08 ውስጥ Commitment #1 ("ምንም አቅጣጫ ቢኖር ህትመት") በማኅተሙ ውስጥ
ብቸኛው ከፍተኛ-የሞት-ተጽዕኖ ቃል ኪዳን ነው። የአሉታዊ የሙከራ ውጤቶች
ታሪካዊ ማፈን (በተለይ ለታዳጊዎች የስነ-ልቦና መድኃኒቶች፣ ለአዛውንቶች የ
oncology መድኃኒቶች፣ እና ለሴቶች የልብና-ደም ስርዓት መድኃኒቶች) ምክንያታዊ
ሆኖ በአድልዎ የተሞላ የውጤታማነት ግምቶችን መሰረት ባደረገ ከመጠን ያለፈ
መውጣት በኩል በአስርት ዓመታት ሊከላከሉ ይችሉ የነበሩ በሺዎች የሚቆጠሩ
ሞቶችን አስከትሏል።

አሉታዊ ውጤቶችን ለማተም የተታሸገ ቃል ኪዳን፣ በራሱ፣ sponsor ሊያደርግ
ከሚችለው ከፍተኛ-ተጽዕኖ ካላቸው የሕዝብ-ጤና እርምጃዎች አንዱ ነው። ማኅተሙ
በራስ የሚደረጉ የህትመት ፖሊሲዎች የማይሰጡት ለዚያ ቃል ኪዳን ውጫዊ
ተጠያቂነት ይሰጣል።

## መዝጊያ

በ MYRIAM ሥር የመድኃኒት ሙከራ ቅድመ-ምዝገባ ለ sponsor ትንሽ ተጨማሪ ስራ ነው፦
እውነታዎችን ለመሙላት ~30 ደቂቃ፣ ለማተም ~10 seconds። የሚጨምረው ተጠያቂነት
ያልተመጣጠነ ነው፦ ለታማኝ የሙከራ ምግባር ትንሽ ወጪ፣ በታሪክ የማስረጃ መሠረት
ላይ አድልዎ ላስከተለ post-hoc ማንቀሳቀስ ላይ ትልቅ ገደብ።

ይህን ስብስብ የሚያስቡ sponsor ወይም principal investigator ከሆኑ፣ ስብስቡ
የሕዝብ ጎራ (CC0) ነው። ይጠቀሙበት። ይቀይሩት። ያሻሽሉት።

## ፍቃድ

የሕዝብ ጎራ (CC0)። ምስጋና አያስፈልግም።
