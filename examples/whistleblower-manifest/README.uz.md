*O'zbek tilidagi tarjima — asl ingliz tilidagi versiyasi uchun, qarang [README.md](README.md)*

# Sirni oshkor qiluvchi manifest muhrlash to'plami

**Dalillar sirni oshkor qiluvchi va omma o'rtasidagi vositachilar tomonidan
ko'miladi, tahrir qilinadi yoki tortishuvga sabab bo'ladi** degan aniq
xatolik turiga duch keladigan sirni oshkor qiluvchilar uchun tayyor
myriam-kit misoli. Buning oldini olish uchun mo'ljallangan kanonik tarixiy
holatlar:

- Boeing 737 MAX (ichki xavfsizlik hisobotlari rad etilgan/ko'milgan)
- Theranos (laboratoriya test xavotirlari yillar davomida bostirilgan)
- Yuborilganidan keyin tahrir qilingan FDA inspektorlik hisobotlari
- Frances Haugen / Facebook (muhrlangan manifest hujjatlarning haqiqiyligini
  va da'vo qilingan vaqtda mavjud bo'lganligini isbotlagan bo'lar edi)

Ushbu to'plam (protokol nuqtai nazaridan) nimaga qarshi himoya qiladi:

- [FACT 05](facts/05_threat_model.txt) dagi T1–T3: hujjat tarkibi haqidagi
  ommaviy bahs, hujjatlar da'vo qilingan vaqtda muhrlanmaganligi haqidagi
  da'volar, retroaktiv soxtalashtirish haqidagi da'volar.
- T9: uchinchi tomonlar jurnalistlarga o'zgartirilgan nusxalarni topshirishlari.

Ushbu to'plam nimaga qarshi himoya **qilmaydi**:

- Sirni oshkor qiluvchiga qarshi shaxsiy qasos (T7).
- Sirni oshkor qiluvchiga voz kechishga bosim (T4, sukut saqlab voz
  kechishni ommaviy aniqlanadigan qilib FACT 07 tomonidan qisman yumshatilgan).
- Sirni oshkor qiluvchining oshkor qilishning o'ziga qarshi yuridik harakatlar (T5).
- Sirni oshkor qiluvchining xarakterini obro'sizlantirish (T8).
- Vositachilarning hikoyani sukut saqlab tashlab yuborishi (T10).

Agar siz ushbu to'plamdan foydalanishni o'ylab ko'rayotgan sirni oshkor
qiluvchi bo'lsangiz, **avval ushbu README-ni to'liq o'qing**. Protokol —
asbob. Protokol — yuridik maslahat, jurnalist, regulyator yoki ehtiyotkor
operatsion xavfsizlikning o'rnini bosa olmaydi.

## Ushbu to'plam nima ishlab chiqaradi

Quyidagilarni isbotlovchi kriptografik tarzda muhrlangan dalillar
*manifesti* (dalillarning o'zi emas):

1. Har bir dalillar faylining aniq baytlari muhrlash paytida mavjud edi.
2. Muhrlash aniq vaqtda yoki undan oldin sodir bo'lgan (Bitcoin OTS
   attestatsiyasi orqali).
3. Manba, ayblov, tahdid modeli, qabul qiluvchi protokoli va sukut
   saqlab voz kechmaslik majburiyati hammasi birgalikda e'lon qilingan.

Asosiy hujjatlar siz qabul qiluvchiga yuborgunizgacha sizning egaligingizda
qoladi. Qabul qiluvchilar siz muhrlagan baytlarni olganligini tekshirishadi.

## Ushbu to'plamni qachon ishlatish kerak

Agar quyidagilarning barchasi to'g'ri bo'lsa, dalillarni jurnalist, regulyator
yoki advokatga uzatishdan **oldin** manifestni muhrlashni o'ylab ko'rishingiz
kerak:

- Sizda raqamli shaklda dalillar (PDF, e-pochta, rasm va boshqalar) bor
  bo'lib, ularni baytma-bayt haqiqiy holatda saqlamoqchisiz.
- Vositachilar dalillarni o'zgartirishi, bahslashishi yoki ko'mishi
  mumkinligini kutmoqdasiz.
- Uzatish vaqtigacha asosiy hujjatlarni o'z egaligingizda saqlay olasiz.
- Manifestni hujjatlar tarkibini oshkor qilmasdan **ommaviy ravishda**
  nashr qila olasiz (faqat xeshlar ochiq).
- Sirni oshkor qiluvchi sifatida ommaviy ravishda aniqlanishi xavflarini
  o'lchab ko'rgansiz (imzolovchi-asos maydoni). Agar anonim bo'lsangiz,
  barcha tegishli nashrlar bo'ylab izchil taxallusdan foydalaning.
- O'z yurisdiktsiyangizdagi sirni oshkor qiluvchini himoya qilish qonuni
  bo'yicha advokat bilan maslahatlashgansiz.

## Ushbu to'plamni QACHON ishlatmaslik kerak

Quyidagi hollarda ushbu to'plamni ishlatmang:

- Hujjatlarning o'zida uchinchi tomonlar (bemorlar, mijozlar, xodimlar)
  haqida ommaviy-xeshlanmasligi kerak bo'lgan shaxsiy ma'lumotlar bor
  bo'lsa. Asl nusxani emas, redaksiya qilingan versiyani xeshlang.
- Manifestni nashr qilishning o'zi sirni oshkor qiluvchini ular rozi
  bo'lmagan tarzda aniqlashi mumkin bo'lsa.
- Hali advokat bilan maslahatlashmagan bo'lsangiz. Protokol — asbob;
  sirni oshkor qiluvchini himoya qilish qonuni yurisdiktsiyaga xos
  bo'lib, protokoldan tashqarida yashaydi.
- Keyinroq biron bir ayblovdan voz kechishni xohlashingiz mumkin bo'lsa.
  Muhr doimiy; yangi muhrlangan tuzatishlar tahrir qilishning yagona
  halol usulidir.
- Buni majburlash yoki vaqt bosimi ostida qilayotgan bo'lsangiz. Protokol
  majburlashni kuchaytiradi; rad etish darvozasi (myriam-kit `SPEC §8`)
  nashr etuvchilarga ham, sirni oshkor qiluvchilarga ham taalluqlidir.

## Haqiqiy oshkor qilish uchun ushbu to'plamni qanday fork qilish

```bash
# 1. Ushbu misolni yangi katalogga nusxalang
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Xayoliy kontentni olib tashlang; haqiqiy faktlaringiz bilan almashtiring.
# facts/ ostidagi har bir fayl bitta fakt. Har birini o'qing va almashtiring.
$EDITOR facts/01_example_notice.txt   # haqiqiy muqova bayonnomasiga o'zgartiring
$EDITOR facts/02_provenance.txt       # dalillaringizning haqiqiy manbasi
$EDITOR facts/03_evidence_manifest.txt # haqiqiy hujjatlaringizni xeshlang va sanab chiqing
$EDITOR facts/04_allegation_summary.txt # sizning haqiqiy ayblovingiz
$EDITOR facts/05_threat_model.txt     # haqiqiy kutilayotgan javoblaringiz
$EDITOR facts/06_recipient_protocol.txt # qabul qiluvchingizga moslang
$EDITOR facts/07_no_retraction_commitment.txt # voz kechmaslik deklaratsiyangiz
$EDITOR facts/08_signing_principal.txt # haqiqiy imzolash shaxsingiz (yoki taxallus)

# 3. site/index.html ni haqiqiy faktlarni aks ettirish uchun yangilang.
# seal.sh skripti HTML-ni avtomatik to'ldirmaydi; qo'lda tahrir qilish —
# insoniy ko'rib chiqish bosqichidir.
$EDITOR site/index.html

# 4. Muhrlang.
bash build/seal.sh
# Chiqishlar: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Mahalliy ravishda tekshiring.
python3 build/verify.py

# 6. Manifestni (hujjatlarni EMAS) quyidagilardan birortasiga nashr qiling:
#    - Siz boshqaradigan statik host (Cloudflare Pages, GitHub Pages va boshqalar)
#    - Bosib chiqarilgan CID dagi IPFS tarmog'i
#    - Ikkalasini ham (tavsiya etiladi)

# 7. Alohida ravishda, asosiy hujjatlarni o'z tanlovingizdagi xavfsiz
#    kanal orqali qabul qiluvchiga uzatishadi (Signal, SecureDrop va boshqalar).
#    Qabul qiluvchi fayl xeshlarini manifestingizga nisbatan tekshiradi.
```

## Haqiqiy dalillar fayllari uchun xeshlarni hisoblash

SHA-256 bilan hujjat faylini xeshlash uchun:

```bash
shasum -a 256 my_document.pdf
```

Birinchi 64 ta o'n oltilik belgi SHA-256 hisoblanadi. Buni manifestga qo'ying.

Bir vaqtning o'zida ko'p fayllarni xeshlashingiz mumkin:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Bu sizga `facts/03_evidence_manifest.txt` uchun ma'lumotlarni beradi.

## Operatsion xavfsizlik bo'yicha eslatmalar

MYRIAM protokoli operatsion xavfsizlikni TA'MINLAMAYDI. U *isbotlovchi
bardoshlikni* ta'minlaydi. Sizga hali ham kerak:

- Advokatingiz bilan xavfsiz aloqa kanali ([Signal](https://signal.org/),
  shaxsiy uchrashuv yoki advokatingizning belgilangan xavfsiz kanali)
- Asosiy hujjatlar uchun xavfsiz saqlash joyi (dam olish paytida
  shifrlangan, ish beruvchingiz kira oladigan bulutli xizmatlarda emas)
- Muhrlash uchun toza qurilma (ish beruvchi hisoblari bilan bog'liq
  bo'lmagan shaxsiy noutbuk; afzal faqat shu maqsadda ishlatiladigani)
- Nashr qilish uchun toza tarmoq (ish beruvchingizning tarmog'i emas,
  ish beruvchingiz internet provayderingizga sud chaqiruvi yuborishi
  mumkin bo'lsa uy IP manzilingiz emas)

Sirni oshkor qiluvchilar uchun operatsion xavfsizlik bo'yicha tavsiya
etilgan o'qish:

- [The Intercept'ning SecureDrop hujjatlari](https://securedrop.org/)
- [Freedom of the Press Foundation manbalari](https://freedom.press/)
- [EFF kuzatuvga qarshi o'z-o'zini himoya qilish qo'llanmasi](https://ssd.eff.org/)

Muhrlash jarayonini boshlashdan OLDIN ular bilan maslahatlashing. Protokol
chaqirilishidan oldin qilingan yomon opsek tanlovlariga qarshi himoya
qilmaydi.

## Qabul qiluvchilar nimani bilishlari kerak

Qabul qiluvchilarga muhrlangan manifest bilan birga ushbu README-ni yuboring.
Manifestning o'zi qabul qiluvchi protokolini o'z ichiga oladi (FACT 06),
lekin README qabul qiluvchining rolini kengaytiradi:

- **Jurnalistlar**: avval manifestning o'z yaxlitligini tekshiring. Keyin
  alohida xavfsiz kanal orqali hujjatlarni so'rang. Nashr qilishdan oldin
  har bir hujjatning SHA-256 ni manifestga mos kelishini tekshiring.
  Sirni oshkor qiluvchining roziligisiz hujjatlarni NASHR QILMANG;
  muhrlangan manifestning mavjudligi va tekshirish xulosangizni nashr qiling.
- **Regulyatorlar**: bir xil tekshirish jarayoni. Muhrlangan manifest plus
  mos keladigan hujjatlar — rasmiy boshqaruv zanjiri yig'ilishidan tashqari
  mavjud bo'lgan eng kuchli isbotlovchi shakl.
- **Advokatlar**: muhrlangan manifest hujjatlarning da'vo qilingan vaqtda
  mavjudligi uchun ekspertiza bog'lanishini ta'minlaydi. Aniq yurisdiktsiyaning
  dalillar qoidalariga javob berishini siz aniqlaysiz.

## Ushbu to'plam nima EMAS

- Yuridik maslahat o'rnini bosadigan narsa emas.
- Hech kim sizning oshkor qilishingizga javob berishini kafolatlamaydi.
- Qasosga qarshi himoya emas.
- Hujjatlar tarkibining haqiqiyligini tasdiqlamaydi (faqat muhrlash
  paytidagi baytlarni).
- Hech kim bilan anonim aloqa qilish usuli emas — muhr ommaviy; agar
  imzolovchi-asos ismingiz haqiqiy bo'lsa, siz aniqlangansiz.

## Yopilish

Muhrlangan manifest — kichik narsa. U katta bayt oqimlari to'plami muayyan
shaklda muayyan vaqtda mavjud bo'lganligini isbotlovchi bitta bayt oqimi.
Uning kichikligi — uning kuchi: u faqat bitta narsa qiladi va o'sha bitta
narsani Bitcoin blokcheyni ishlash davri davomida qiladi.

Agar siz sirni oshkor qiluvchi bo'lishni o'ylab, buni o'qiyotgan bo'lsangiz,
iltimos: avval advokat bilan gaplashing. Yuqoridagi operatsion xavfsizlik
qo'llanmalaridan foydalaning. Keyin, agar va faqat o'sha barcha yuqori
oqim mulohazalari joyida bo'lsa, ushbu to'plamni oshkor qilishingizning
kriptografik o'zagi sifatida ko'rib chiqing. Kriptografiya — oson qism.
Kriptografiyadan yuqoridagi hamma narsa — haqiqiy xavf yashaydigan joy.

## Litsenziya

Ommaviy mulk (CC0). Fork qiling. Yaxshilang. Ruxsat so'ramasdan ishlating.
