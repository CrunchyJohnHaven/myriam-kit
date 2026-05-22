# Sud dalili saqlash-zanjiri muhri to'plami

*O'zbek tilidagi tarjima — asl ingliz tilidagi versiyasi uchun, qarang [README.md](README.md)*

Forensik egallash guruhlari uchun — kompyuter forensikasi
ekspertlari, mobil-qurilma chiqarish texniklari, body-cam dalil
saqlovchilari, laboratoriya rahbarlari — raqamli dalillar
egallash paytida *qaysi baytlar olingani* va *qachon* olingani
to'g'risida Bitcoin-bog'langan, o'zgartirilishi aniqlanadigan
muhr bilan nashr etishni xohlaganlar uchun kalit-topshirish
myriam-kit namunasi, shunda saqlash-zanjiri bahslari ommaviy
langar bo'lishi mumkin.

---

## Bu to'plam QILMAYDIGAN ishlar (avval o'qing)

Muhr QANDAY FORENSIK TASVIRLAR olinganligining, QACHON
olinganligining, QAYSI AGENTLIK tomonidan, QAYSI ORDER ostida va
QAYSI METODOLOGIYA orqali olinganligining kriptografik vaqt
tamg'asidir. U ish haqida bundan tashqari hech qanday savolga
javob bera olmaydi. Quyidagilar **muhrning sohasidan tashqaridadir**:

1. **Federal Dalillar Qoidalari (yoki boshqa har qanday dalillar
   kodeksi) bo'yicha qabul qilinish.** Muhr baytlar va vaqt
   tamg'alarini langar qiladi. Dalilning qabul qilinishi —
   FRE 901 autentifikatsiyasi, FRE 702 ekspert guvohligi /
   Daubert, FRE 403 zarar muvozanati yoki har qanday shtat-sud
   ekvivalenti ostida — yuridik-tartibot savolidir. Mukammal
   muhrlangan egallash hali ham qabul qilinmaydigan deb
   topilishi mumkin; muhrlanmagan egallash hali ham qabul
   qilinishi mumkin. Muhr qabul qilinish hukmining o'rnini
   bosuvchi emas, balki butunlikning qo'shimcha dalilidir.

2. **Hibsga olish qonuniy edimi yoki yo'q.** To'rtinchi Tuzatishga
   muvofiqlik, orderning amal qilish muddati, ko'lamga rioya qilish,
   istisno qoidasining qo'llanilishi — bularning barchasi muhrning
   yuqori oqimidadir. Muhr egallash FICT-SW-2026-0188 raqamli
   order ostida sodir bo'lganini qayd qiladi; orderning qonuniy
   ravishda berilgani va qonuniy ravishda topshirilgani sud uchundir.

3. **Dalil ayblovchi, oqlanuvchi yoki neytralmi.** Muhr xeshlarni
   langar qiladi; bu xeshlarning nimani o'z ichiga olishi haqidagi
   talqinlar o'z aniqlanish va dalil tartibiga ega bo'lgan forensik
   tekshiruv hisobotiga tegishli. Muhr "FACT N: gumonlanuvchining
   noutbukida ayblovchi material bor edi" deb muhrlashdan rad
   etadi — rad-qoidasi R4-ga qarang.

4. **Saqlash-zanjiri tegishli shtatning dalillar qonuni bo'yicha
   tartibsizmi.** Muhr agentlikning bir vaqtda yuzaga keladigan
   saqlash-tadbir loglarini qayd qiladi (FACT 05). Bu loglar
   ma'lum bir shtatning saqlash-zanjiri talablariga javob beradimi
   sud dalillar tinglovida hal qiladi.

5. **Forensik metodologiya ishonchli edimi.** Daubert va uning
   davomchilari (Frye kabi shtat-darajasi analoglari, qaerda
   hali ham qo'llaniladi) metodologik ishonchlilikni baholaydi.
   Muhr QANDAY asboblar va versiyalar ishlatilganini qayd qiladi
   (FACT 04); bu asboblar har qanday muayyan sudning ishonchlilik
   standartiga javob beradimi sud uchundir. Asbob xatolari o'tgan
   ishlarda egallashdan keyin hujjatlashtirilgan; muhrning roli
   versiya-va-binary-xesh yozuvini ommaviy ravishda rad etiladigan
   qilishdir, asboblarning o'ziga kafolat berish emas.

6. **Egallashdan OLDIN dalil o'zgartirilganmi.** Muhr tasvir olish
   paytidan oldinga qarab baytlarni langar qiladi. Agar gumonlanuvchi,
   ofitser yoki uchinchi shaxs manba qurilmasini tasvirga olishdan
   oldin o'zgartirsa, muhr buni aniqlay olmaydi — u o'zgartirilgan
   baytlarni asl nusxani muhrlaydigan bir xil butunlik bilan
   muhrlaydi. Muhrning qiymati tasvir olish vaqt tamg'asidan boshlanadi.

7. **Order ko'lami hurmat qilinganmi.** Order rideri nima olinishi
   mumkinligini belgilaydi; muhr nima OLINGANINI qayd qiladi.
   Egallashning order ko'lamini oshirib yuborganligi, yana, o'ziga
   xos davo bilan (tegishli shtatning tartibi ostidagi bostirish
   harakati) yuridik savol.

8. **Tergovning har qanday shaxsiy tomonini qayta-aniqlash.** Muhr
   gumonlanuvchi, sudlanuvchi, jabrlanuvchi, guvoh yoki bino aholisini
   qayta-aniqlay oladigan har qanday ism, identifikator yoki barmoq
   izini nashr etishdan rad etadi. Ish protokoli havolasi turishga
   huquqi bor tomonlar uchun ishni topish uchun mos havola nuqtasidir.

**Yuqoridagi halol-cheklovlar bo'limi ushbu to'plamning yuk-ko'taruvchi
qismidir.** Muhrlash qabul qilinishga teng deb hisoblaydigan
forensik guruhlar uni qalqon sifatida ishlatadilar. To'plam buni
ochiq aytishi kerak: *bu egallash payti uchun non-repudiation
primitividir, qonuniy egallash, metodologik mustahkamlik yoki sud
tomonidan tan olingan saqlash-zanjiri isboti emas.*

---

## Bu to'plam muhrlashga MAJBUR BO'LGAN ishlar

To'plam quyidagi fakt naqshlarini rad etish uchun konfiguratsiya
qilingan, hatto haqiqiy imzo qo'yish vakolatiga ega foydalanuvchi
ularni taqdim qilsa ham:

- **Gumonlanuvchilar, sudlanuvchilar, jabrlanuvchilar, guvohlar
  yoki har qanday shaxsiy uchinchi shaxsning shaxsiy identifikatsiyasi.**
  Ish protokoli havolasi turishga huquqi bor tomonlar uchun
  havoladir; ommaviy muhr qayta-aniqlash indeksi bo'lmasligi kerak.
- **Forensik ekspertlar yoki boshqa agentlik xodimlarining
  ommaviy muhrdagi shaxsiy ismlari.** Rollar ommaviy; shaxs-rol
  bog'lanishlari alohida muhrlanadi va sud jarayoni ostida
  aniqlanadi.
- **Bola jinsiy zo'ravonlik materialiga shubhalanilgan, biometrik
  shablonlar yoki har qanday zaif-shaxsni qayta-aniqlovchi
  ma'lumotlarning fayl-darajasidagi xeshlari (yoki barmoq izlari) —
  hatto xesh bilan ham.** Individual faylning SHA-256 doimiy
  qidiriladigan identifikatordir; uni ommaviy bukda nashr etish
  subyektlarni shaxsiy ma'lumotlar bazalari bilan korrelyatsiya
  orqali qayta-jabrlashga olib kelishi mumkin. To'liq disklarning
  tasvir-darajasidagi (forensik tasvir-darajasidagi) xeshlari qabul
  qilinadi; bunday materialning fayl-darajasidagi xeshlari HECH
  QACHON qabul qilinmaydi.
- **Tekshirish topilmalari, talqinlari, fikrlari yoki baytlar
  nimani anglatishi haqidagi xulosalar.** Muhr QAYSI BAYTLAR
  olinganini va QACHON olinganini langar qiladi. Talqin
  aniqlanadigan tekshiruv hisobotiga tegishli, o'zgartirilishi
  aniqlanadigan ommaviy bukka emas.
- **Qabul qilinish yoki har qanday boshqa yuridik xulosa
  da'volari** ("bu dalil qabul qilinadi", "order qonuniy edi",
  "saqlash-zanjiri §X.Y bo'yicha to'g'ri edi"). Yuridik xulosalar
  sud funktsiyalaridir.
- **Egallayotgan agentlikning vakolatli principal-dan boshqa har
  kim tomonidan muhrlash.** Mudofaa eksperti manifestning mustaqil
  tekshiruvini o'z nomidan muhrlash uchun to'plamdan foydalanishi
  mumkin; ular egallayotgan agentlikning nomi ostida ASL
  egallashni muhrlay olmaydi.
- **Ommaviy muhrdagi rol-individual bog'lanishlar.** Bog'lanishlar
  alohida hamroh yozuvda (FACT 05-da xeshlangan) agentlik kirish
  nazorati ostida muhrlanadi.
- **Hibsga olishdan oldingi yoki orderdan oldingi tergov faktlari.**
  Informator bayonotlari, orderdan oldingi kuzatuv, parallel-qurilish
  kirishlari — bularning hech biri egallash muhriga tegishli emas.
  Muhr egallash hodisasiga qaratilgan.

Rad o'zi fakt sifatida muhrlanishi mumkin ("Bu agentlik X-ni
muhrlashni so'radi; to'plam rad-qoidasi Y bo'yicha rad etdi"),
suiiste'mol urinishlarining ommaviy yozuvini yaratish.

---

## Bu to'plam muhrlaydigan ishlar

Egallash paytida 8 ta fakt:

1. **Namuna ogohlantirishi** — nashrni namuna deb e'lon qiladi
   (haqiqiy tasdiqlar buni olib tashlaydi yoki almashtiradi).
2. **Egallash konteksti** — ish identifikatori, order iqtibosi,
   egallayotgan agentlik, so'rovchi hokimiyat, hibsga olish va
   egallashning sanasi/vaqti, egallash joyi (hibsga olish joyi
   binoni qayta-aniqlashning oldini olish uchun alohida-muhrlangan
   hamroh yozuvga tahrirlanadi).
3. **Dalillar manifesti** — har bir forensik-tasvir bandi uchun:
   SHA-256 xesh, fayl hajmi, manba-qurilma anonimlashtirilgan
   identifikatori, egallash usuli, forensik tasvir formati.
4. **Egallash metodologiyasi** — forensik asbob nomlari va aniq
   versiyalari (asbob-binary xeshlari bilan), write-blocker
   marka/model va firmware, NIST CFTT tekshirish havolasi,
   foydalanilgan tekshirish tartibi, tasvir-format tanlovi.
5. **Saqlash-zanjiri jurnali** — boshlang'ich hibsga olishdan
   tasvir olishning oxirigacha tadbir bo'yicha vaqt jadvali,
   saqlovchilar ROL bilan aniqlanadi (ism bilan emas), alohida-
   muhrlangan hamroh yozuvlarning (rol-individual bog'lanish,
   transport GPS jurnali, dalillar-qulflagich kirish jurnali,
   o'zgartirish-muhr fotosuratlari va boshqalar) xeshlari bilan.
6. **Ekspert malakalari rol bo'yicha** — egallangan sertifikatlar,
   davom etayotgan ta'lim holati, oldingi ekspert-guvoh tajribasi
   soni, Daubert ta'siri, manfaatlar-to'qnashuvi oshkor qilishlari —
   hammasi rol-darajasidagi, shaxsiy emas.
7. **Hamroh oshkor qilishlar va rad yozuvi** — parallel tergovlar,
   kutilayotgan order chaqiriqlari, bostirilgan-dalil harakatlari,
   imtiyoz-filtr / taint-jamoa protokoli amalda, oldingi egallash
   urinishlari, sotuvchi bug-tracker ko'rib chiqilishi; to'plam
   muhrlashdan rad etgan naqshlarning ochiq ro'yxati.
8. **Imzo qo'yuvchi principal** — egallayotgan agentlikning
   identifikatsiyasi + rol-darajasidagi imzo qo'yuvchi (bosh
   ekspert) + rol-darajasidagi hamkor-imzo qo'yuvchi (bo'lim
   rahbari) + kriptografik kalit ma'lumoti.

Har bir fakt rad-eshigi konvensiyasi bilan tugaydi: *"Bu fakt
faqat X-ni tasdiqlaydi. U Y-ni tasdiqlamaydi"* (Y "QILMAYDI"
bo'limidan eng yaqin nosozlik rejimidir).

---

## Bu to'plam nimadan himoya qiladi

- **Forensik tasvirning egallashdan-keyingi jim o'zgartirilishi.**
  Har qanday tasvirdagi bayt-darajasidagi o'zgarish boshqa SHA-256
  ishlab chiqaradi va o'zgarishdan-keyingi tasvir muhrlangan FACT
  03 manifestga qarshi tekshirilmaydi.
- **"Boshqa asboblar ishlatilgan" da'vosi.** FACT 04 asbob-binary
  xeshlari bilan aniq asbob versiyalarini qayd qiladi; keyingi
  "biz aslida v4.7.0, v4.7.1 emas ishlatdik" da'volari ommaviy
  ravishda rad etiladi.
- **Write-blocker ishga tushirilmagan yoki boshqa model
  ishlatilgan da'vosi.** FACT 04 write-blocker manifestini
  muzlatadi.
- **Saqlash-jurnal o'zgartirilishi.** FACT 05 saqlash-tadbir
  vaqt jadvaliga har qanday o'zgartirish (tadbir qo'shish,
  olib tashlash yoki qayta-vaqt tamg'alash) FACT 05 xeshini
  o'zgartiradi va ommaviy ravishda aniqlanadi.
- **Boshqa ekspertning ishonchnomalarini almashtirish.** FACT 06
  egallash paytida rol-darajasidagi ishonchnoma profilini
  muzlatadi.
- **Hamroh oshkor qilishlarni tanlab tushirib qoldirish.** FACT 07
  kutilayotgan oshkor qilish toifalarini sanab o'tadi; bo'sh
  toifa aniq tasdiqlanishi kerak ("egallash paytida hech narsa"),
  shunda keyingi "biz buni dolzarb deb tushunmadik" da'vosi
  ommaviy ravishda rad etiladi.
- **Ekspertda oshkor qilinmagan manfaatlar to'qnashuvi bor degan
  egallashdan-keyingi da'volar.** FACT 06-ning manfaatlar to'qnashuvi
  oshkor qilishi egallashda muzlatiladi; keyingi chaqiriqlar
  unga qarshi sinab ko'rilishi mumkin.

To'plam bir vaqtda buzilishga qarshi **himoya qilmaydi** — egallash
paytida ataylab soxta metama'lumotlarni muhrlaydigan guruh soxta
metama'lumotlarning kriptografik ravishda haqiqiy muhrini ishlab
chiqaradi. Primitiv bu haqida halol: u agentlikning bir vaqtda
yuzaga keladigan da'volari uchun non-repudiation primitividir, bu
da'volar to'g'ri ekanligining isboti emas.

---

## Bu to'plam yordam berishi mumkin bo'lgan tarixiy yoki yaqin tarixiy ishlar

To'plam foydali langar — *yechim emas* — ishlab chiqargan bo'lar
edi raqamli dalillarning saqlash-zanjiri bahsli dalil masalasiga
aylangan o'tmishdagi ishlarda. Sudlanganlar (sudlangan bo'lsa ham
shaxsiy tomonlar) ni nomlamaslik uchun bular nomli individual
bilan emas, ish turi bilan tasvirlangan:

- **2010-yillarning o'rtalaridagi federal forensik-asbob-xato
  bahsi** qaerda keng tarqalgan forensik tasvir olish asbobi,
  egallashdan keyin, ma'lum manba-media turiga ta'sir qiladigan
  chekka-holat xatosiga ega ekanligi aniqlandi. Muzlatilgan asbob-
  versiya-va-binary-xesh ma'lumotlari bilan muhrlangan egallash
  manifesti mudofaa va ayblovga qaysi versiya ishlatilganligi
  haqida aniq kelishuvga ruxsat bergan bo'lar edi, bahsning bir
  o'qini olib tashlagan bo'lar edi.

- **Bahsli mobil-qurilma chiqarish chiqishlari bilan bog'liq bir
  nechta shtat ishlari**, qaerda chiqarish asbobining sotuvchisi
  keyinroq xato-tuzatish yamog'ini chiqardi va savol "xato bu
  ishga ta'sir qildimi" bo'ldi. Muhrlangan metodologiya fakti
  savolga agentlikning qaysi versiya ishlatilganligi haqidagi
  hozirgi xotirasiga emas, balki muzlatilgan versiyalash
  ma'lumotlariga qarshi javob berishga imkon beradi.

- **Body-worn-camera topshirish bahslari** ishlarda, qaerda
  BWC sotuvchisining dock tizimi keyinroq tashish paytida
  videolarni o'zgartirishga ruxsat bergan deb da'vo qilingan.
  Body-cam arxivining agentlik qabul qilish paytidagi muhrlangan
  manifesti agentlikning dock tizimidan olgan baytlarini langar
  qiladi; agentlik tomonidagi keyingi tahrirlar ommaviy ravishda
  aniqlanadi.

- **Kompyuter-forensikasi ishlarida xesh-to'qnashuvi bahslari**,
  qaerda mudofaa eksperti MD5 (ba'zi eski ish oqimlarida hali
  ham ishlatiladigan) yetarli emasligini ta'kidladi. Ham MD5,
  ham SHA-256 ni qayd qiladigan muhrlangan egallash MD5 shubha
  ostiga olinsa ham SHA-256 ning turishiga imkon beradi.

- **Egallash va sud o'rtasida tekshirish metodologiyasi
  evolyutsiyasi haqidagi bahslar.** Ish egallash va sud o'rtasida
  yillarcha o'tirganda, egallashda standart bo'lgan metodologiya
  sud vaqtiga qadar o'zgartirilgan bo'lishi mumkin. Muhrlangan
  yozuv sudga metodologiyani keyingi standartga emas, balki
  egallash paytida joriy bo'lgan standartga qarshi baholashga
  imkon beradi.

To'plam bu ish turlarining hech birida aybdorlik yoki aybsizlik
haqidagi asosiy bahslarni HAL QILMAS edi. U bir o'ziga xos dalil
sub-bahsini hal qilar edi: baytlar, asboblar va tartiblar agentlik
ularni da'vo qilgan vaqtda agentlik da'vo qilgan narsa edimi.

---

## Bu to'plamni qachon ishlatish

- Sizning agentligingizning barqaror forensik SOPi bor va mavjud
  qog'oz-va-imzo saqlash-zanjiri ustiga Bitcoin-bog'langan ommaviy
  tasdiqlashni o'zgartirilishi aniqlanadigan qatlam sifatida
  qo'shmoqchi.
- Bu ish forensik dalillarga sezilarli mudofaa chaqiriqini jalb
  qilishini kutyapsiz (yuqori-tikilgan ish, yangi metodologiya,
  bahsli asbob versiyalari va boshqalar).
- Siz PII yoki zaif-shaxsni qayta-aniqlovchi ma'lumotlarni
  oshkor qilmasdan sanab o'tilgan fakt to'plamini nashr eta
  olasiz. (To'plamning rad qoidalari buni majbur qiladi; agar
  faktlaringiz rad-qoidasini buzishni talab qilsa, to'plamdan
  foydalanmang.)
- Egallayotgan agentlikning bosh maslahatchisi va prokuratura
  nashr rejasini ko'rib chiqdi. Ish-identifikator olib yuruvchi
  artefaktning ommaviy nashri davom etayotgan tergovlarga ta'sir
  qiladi; maslahat ko'rib chiqilishi tanlangan emas.
- Sizning yurisdiktsiyangizning mudofaa aniqlash qoidalari
  agentlikning rol-individual bog'lanish yozuvini alohida saqlashi
  bilan mos keladi (FACT 05-da xeshlangan). Agar yurisdiktsiyangiz
  ommaviy ekspert-ism oshkor qilishni talab qilsa, to'plamni
  mos ravishda o'zgartirishingiz kerak.

## Bu to'plamni qachon ISHLATMASLIK

- **Agentlikning mavjud saqlash-zanjiri hujjatlashtirishining
  o'rnini bosuvchi sifatida ishlatmang.** Bu to'plam *qo'shimcha*,
  o'rnini bosuvchi emas. Agentlikning CMS, saqlash jurnali va
  aniqlash ishlab chiqarish majburiyatlari o'zgarmagan.
- **Egallash CSAM, biometrik shablonlar yoki boshqa zaif-shaxsni
  qayta-aniqlovchi ma'lumotlarni fayl-darajasida o'z ichiga olsa,
  ishlatmang.** To'liq disklarning tasvir-darajasidagi xeshlari
  qabul qilinadi; bunday materialning fayl-darajasidagi xeshlari
  HECH QACHON qabul qilinmaydi, hatto rad-qoidasi voz kechishi
  ostida ham. Agar R3-ni buzmasdan fakt to'plamini qura olmasangiz,
  to'plamdan foydalanmang.
- **Order qonuniy edi, hibsga olish to'g'ri edi yoki dalil qabul
  qilinadi deb da'vo qilish uchun ishlatmang** — to'plam buni
  qila olmaydi va rad-qoidasi R5 har qanday bunday da'voni rad
  etadi.
- **Egallash tugamaguncha muhrlash uchun bosim ostida ishlatmang.**
  Qisman-egallash muhri holatni noto'g'ri taqdim qiladi.
- **Sizning yurisdiktsiyangiz aniq talab qilmasa va ekspertlaringiz
  individual ravishda rozi bo'lmasa, ekspert shaxsiy ismlarini
  nashr etish uchun ishlatmang.** Standart rol-darajasidagi nashrdir.
- **Aniq sud ruxsatisiz muhrlangan yoki muhr ostidagi ishlarda
  ishlatmang.** Bitcoin-da ish identifikatorini nashr etish
  qaytarib bo'lmaydigan; agar ish keyinroq muhrlansa, ommaviy
  muhr qaytarib olinmaydi. To'plam faqat ommaviy-yozuv egallashlari
  uchundir.
- **Qonuniylik teatri sifatida ishlatmang.** Nuqsonli egallashning
  muhri kamchiliklarning doimiy ommaviy yozuvidir, ularga qarshi
  himoya emas. Primitiv ikkala tomonga kesadi; bu uning halolligidir.

## Bu to'plamni haqiqiy egallash uchun qanday fork qilish

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # badiiy mazmunni haqiqiy bilan almashtiring
                       # butunlay rad qoidalari R1-R8 ni qo'llang
bash build/seal.sh     # tasvir olish tugashida yoki bir oz keyin muhrlang
python3 build/verify.py
```

**Muhim vaqt:** tasvir olish tugashida yoki bir oz keyin muhrlang
(namuna vaqt jadvalida FACT 05 hodisa E17). Tasvir olish paytida
muhr qisman-egallash yozuvini yaratadi; juda keyin muhr agentlik
tasvirlarni o'zgartirishi mumkin bo'lgan bo'shliq yaratadi. To'g'ri
deraza ko'rgazma to'plamining oxirgi bandi uchun tasvir tekshirish
tugashidan keyin darhol.

**Muhim ko'rib chiqish:** muhrlashdan oldin nashrni ikkinchi
forensik ekspert (bosh emas) va agentlik maslahatchisi orqali
o'tkazing. Bir marta muhrlangandan keyin, nashr doimiy bo'ladi.

## Mavjud saqlash-zanjiri infratuzilmasi bilan integratsiyalashuv

- **Agentlik Ish Boshqarish Tizimi (CMS).** CMS agentlikning
  asosiy yozuv tizimi sifatida qoladi. Muhr CMS-ni almashtirmaydi;
  u CMS qayd qiladigan baytlar va metodologiyaga sodiq qoladi,
  shunday qilib post-hoc CMS tahrirlari ommaviy ravishda aniqlanadi.
- **Federal Dalillar Qoidalari / Daubert / shtat dalillar
  kodlari.** Muhr o'zgartirilishi aniqlanadigan butunlikni ta'minlash
  orqali FRE 901 autentifikatsiya yozuviga hissa qo'shadi. U FRE
  702 /Daubert-ni o'zicha QONDIRMAYDI; metodologiya ishonchliligi
  hali ham dalillar tinglovida sinab ko'riladi.
- **Mudofaa aniqlash (FRCP 16, Brady, Giglio va shtat
  ekvivalentlari).** FACT 05-da xeshlangan hamroh yozuvlar (rol-
  individual bog'lanish, saqlash jurnali, o'zgartirish-muhr
  fotosuratlari va boshqalar) normal aniqlashga bo'ysunadi. Muhr
  egallash paytida bu yozuvlar nima da'vo qilganini langar qiladi,
  shunda keyingi "o'sha paytda yozuv boshqacha edi" da'vosi
  ommaviy ravishda rad etiladi.
- **NIST Kompyuter Forensikasi Asbobi Sinovi (CFTT).** To'plam
  FACT 04 / FACT 05-da CFTT tekshirish jurnallariga havola qiladi;
  havola xesh, jurnalning o'zi emas, shunday qilib CFTT jarayonlari
  ta'sirsiz qoladi.
- **Sud tomonidan tayinlangan neytrallar va mudofaa ekspertlari.**
  Har biri aniqlashda olgan forensik tasvirlarni har qanday agentlik
  hamkorligidan mustaqil ravishda FACT 03 manifestga qarshi qayta-
  xeshlashi mumkin. Bu to'plamning mudofaa tomoni uchun asosiy
  qo'shimcha-qiymatidir.
- **Apellyatsiya ko'rib chiqilishi.** Yillar o'tgach, apellyatsiya
  forensik ko'rib chiqaruvchisi asl egallash metodologiyasini
  agentlikning ehtimol-rivojlangan hozirgi xotirasiga emas, balki
  muhrlangan FACT 04 yozuviga qarshi tekshirishi mumkin.

## Bu to'plam nimani almashtirmaydi

- Federal Dalillar Qoidalari (yoki har qanday shtat dalillar
  kodeksi).
- Ekspert guvohligi uchun Daubert / Frye ishonchlilik standartlari.
- Agentlikning forensik SOP va CMS.
- FRCP 16 / Brady / Giglio / shtat ekvivalentlari ostidagi mudofaa
  aniqlash majburiyatlari.
- Sud buyruqlari, bostirish harakatlari, dalillar tinglovlari yoki
  boshqa sud-boshqariladigan jarayonlar.
- NIST CFTT yoki boshqa har qanday asbob-sinov tartibi.
- Agentlikning imtiyoz-filtr / taint-jamoa protokoli.

## Bu to'plam nima uchun v0.4.0+ -da mavjud

Bu myriam-kit bilan yetkazib beriladigan 8-chi ishlab chiqilgan
namunadir. U `~/Genesis/calc/PROMPT_LIBRARY_v0.md`-da
hujjatlashtirilgan autoresearch tomonidan tasdiqlangan cheklov-
birinchi tuzilishiga ergashadi — cheklov-birinchi prompt varianti
bir nechta namuna domenlari bo'yicha vaznli rubrikada eng yuqori
ball oldi. Ochilish bo'limlari to'plamning yuk-ko'taruvchi
qismlari; manifest mazmuni oson qismdir.

To'plamning dizayni ekspert-ism nashrida ataylab konservativ va
"bu qabul qilinishni o'rnatmaydi" javobgarlikdan voz kechishida
agressiv. Forensik jamoa o'z forensik ishi uchun hujum qilinishining
hujjatlashtirilgan tarixiga ega; to'plam ekspertlar uchun
xavfsizroq pozitsiyaga default bo'ladi. Ommaviy shaxsiy-nomlash
talab qilinadigan yurisdiktsiyalardagi agentliklar o'z forkini
mos ravishda o'zgartirishi mumkin, lekin default rad ekspert
xavfsizligiga ustunlik beradi.

## Litsenziya

Ommaviy mulk (CC0). Fork qiling. Iqtibos talab qilinmaydi.
