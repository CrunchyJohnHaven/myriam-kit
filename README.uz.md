*O'zbek tilidagi tarjima — asl ingliz tilidagi versiyasi uchun, qarang [README.md](README.md)*

# myriam-kit

[![Litsenziya: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Misollar: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#ishlab-chiqilgan-misollar)
[![Tekshiruvchi: brauzer](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: bog'langan](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: mahkamlangan](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-mos](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Kichik faktlar to'plamini quyidagi tarzda nashr qilish uchun mo'ljallangan kichik
asboblar to'plami:

- Har qanday faktdagi har qanday o'zgarish ommaviy ravishda aniqlanishi mumkin (Merkle daraxti)
- Nashr paytidagi holat Bitcoin blokcheyniga nisbatan tekshiriladi (OpenTimestamps)
- Kontent har qanday yagona hosting provayderi tomonidan o'chirilsa ham saqlanib qoladi (IPFS)
- Butun to'plam 100 KB dan kichik bo'lib, Python tilida ~50 satr kod bilan tekshirilishi mumkin

Bu blokcheyn emas. Hech qanday token yo'q. Ishtirok etish uchun konsensus
mexanizmi yo'q. DAO yo'q. Asbob — `sha256sum` + `ots` + `ipfs`,
ya'ni yaxshi nomlash konvensiyalari yordamida bir-biriga ulangan.

U 2026-05-21 da [disclosure.host](https://disclosure.host) saytida birinchi marta
joriy etilgan MYRIAM protokoli nomi bilan atalgan. Bu sahifa olti faktni, Merkle
ildizini va Bitcoin attestatsiyasini o'z ichiga oladi. Ushbu to'plam o'sha
naqshning umumlashtirilgan versiyasidir.

## Holati

- v0: macOS-da Python 3.10+, Homebrew va internet ulanishi bilan ishlaydi.
  Linux sinovdan o'tkazilmagan, lekin ishlashi kerak. Windows: WSL olib keling.
- Ommaviy mulk (CC0). Foydalaning, fork qiling, omboringizga qo'shing, hech
  qachon kreditni eslamang. Maqsad — krediт emas.

## Mavjud tillar

Ushbu README va bir nechta misol to'plamlari 17 tilda mavjud.
To'liq indeks: [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Tarjimalar CC0 ostida va hamjamiyat PR-lari orqali yaxshilanishi mumkin.

## Bu bilan nima qilishingiz mumkin

Naqsh kichik faktlar to'plamini quyidagi xususiyatlarga ega bo'lishi kerak
bo'lgan har qanday joyda ishlaydi:

- **Nashr qilinadigan** — keng auditoriya uchun oddiy HTTP orqali
- **Bardoshli** — 30 yildan keyin ham o'quvchilar tekshira olishi kerak
- **Buzilish-aniqlanadigan** — har qanday o'zgarish aniqlanishi shart, oldini olish shart emas
- **Ishonchsiz** — hech bir o'quvchi nashr etuvchiga ishonishi shart emas (faqat matematikaga)

Aniq foydalanish holatlari: [docs/USE_CASES.md](docs/USE_CASES.md). Qisqa ro'yxat:

| Soha | Muhrlangan faktlar |
|---|---|
| Davlat sog'liqni saqlash | Vaksina partiyasi test natijalari, dori sinov bosqichlari |
| Saylovlar | Sertifikatlash paytidagi uchastka darajasidagi umumiy ovozlar |
| AI xavfsizligi | Chiqarish paytidagi model og'irliklari xeshi + model kartasi + baholash ballari |
| Jurnalistika | Sirni oshkor qiluvchining manba hujjatlari manifesti (faqat xeshlar) |
| Fan | Xom ma'lumotlar xeshi + tahlil skripti xeshi + da'vo qilingan natija |
| Sudlar | Olish paytidagi raqamli dalillar xeshlari |
| Davlat xaridlari | Davlat xarajatlari ma'lumotlarining muhrlangan ildizlari |

Bularning umumiy jihati: kichik faktlar to'plami, kuchli bardoshlik talabi,
bir-biriga ishonmaydigan ko'plab tomonlar va kichik saqlash byudjeti.
Asbob aynan shu shakl uchun yaratilgan.

## Bu asbob nima qilMAYDI

- **Sirlarni saqlamaydi.** `facts/` ichiga qo'ygan hamma narsa ochiq. Protokol
  yashirish uchun emas, nashr qilish uchun.
- **Katta ma'lumotlar to'plamlariga mos ravishda kengaymaydi.** Merkle daraxti yaxshi
  kengayadi; o'quvchining e'tibori esa yo'q. ~20 dan ortiq fakt bo'lsa sahifa
  o'qib bo'lmaydigan holga keladi. Agar million yozuvni muhrlamoqchi bo'lsangiz,
  ularni sahifadan tashqarida xeshlang va o'sha yon-daraxtning Merkle ildizini
  bitta faktga qo'ying.
- **Voz kechishdan himoya qilmaydi.** Asosiy maqsad — muhrlagan narsangizni
  o'zgartira olmasligingiz. Agar keyinroq da'vodan voz kechmoqchi bo'lsangiz,
  uni muhrlamang.
- **Qattiq shubhalanuvchini ishontirmaydi.** Qattiq shubhalanuvchi
  `ipfs add -r --cid-version=1 -Q facts/` ni ishga tushirmaydi. Buning o'rniga
  sizni butun konfiguratsiyani uydirma deb ayblaydi. Ikkinchi xatolik turiga
  qarshi protokol darajasida himoya yo'q. Matematikada emas, inson niyatlarida
  yashaydigan hech narsaga qarshi protokol darajasida himoya yo'q.

## Qanday foydalanish kerak

Besh daqiqalik qo'llanma: [docs/QUICKSTART.md](docs/QUICKSTART.md).
To'liq protokol spetsifikatsiyasi: [docs/SPEC.md](docs/SPEC.md).
Tahdid modeli: [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Qo'shni tizimlar bilan taqqoslash (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave va boshqalar): [docs/COMPARISON.md](docs/COMPARISON.md).

## Boshqa birovning nashrini qanday tekshirish

Uch variant, foydalanish qulayligi tartibida:

1. **Brauzer**: har qanday zamonaviy brauzerda [`lib/verify.html`](lib/verify.html)
   ni oching. Nashr URL-ni joylashtiring. "Tekshirish" tugmasini bosing.
   Xeshlash uchun `crypto.subtle` ishlatiladi — o'rnatish, backend va
   telemetriya yo'q. Bitcoin attestatsiya bosqichi hali ham CLI asbobini
   talab qiladi (tekshiruvchi sahifasining 7-bosqichiga qarang).
2. **Python**: nashr katalogi ichidan `python3 lib/verify.py`. Faqat
   standart kutubxona; Bitcoin tekshiruvi uchun `ots` talab qilinadi.
3. **Noldan**: [`docs/SPEC.md §3`](docs/SPEC.md) ni o'qing va qayta
   amalga oshiring. Merkle algoritmi har qanday tilda 30 satrdan kam.

## Ishlab chiqilgan misollar

To'plam bilan birga oltita ishlab chiqarish darajasidagi misol to'plamlari
keladi. Har biri muhrlangan, OTS-shtampli, IPFS-mahkamlangan va qachon real
hodisa uchun fork qilishni hamda qanday xatolik turlariga qarshi himoya
qilishini tushuntiruvchi qabul qilish README-si bilan ta'minlangan.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  Boeing 737 MAX / Theranos / FDA inspektorlik hisoboti kabi vositachilar
  tomonidan dalillar ko'milgan yoki o'zgartirilgan xatolik turi uchun.
- [`examples/ai-model-card/`](examples/ai-model-card/) — modellarni
  chiqarayotgan AI laboratoriyalari uchun, og'zaki emas, balki mexanik
  ravishda aniqlanadigan deploydan oldingi majburiyatlar bilan.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  klinik sinov homiylari uchun, post-hoc oxirgi nuqtalarni o'zgartirish va
  tanlab hisobot berishni aniqlash uchun (Vioxx, Paxil Study 329 xatolik turlari).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  chiqarish testi natijalari va eslab olish majburiyatlarini bog'lash uchun
  vaksina ishlab chiqaruvchilari va sifat nazorati organlari uchun.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  tadqiqot guruhlari uchun, p-hacking va HARKing-ni ommaviy aniqlash uchun
  tahlildan OLDIN (ma'lumotlar, quvur liniyasi, kutilgan natija) uchligini
  bog'lash uchun.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  tuman ovoz hisoblash boshqaruvlari va saylov organlari uchun, sertifikatlash
  paytida tasdiqlangan natijalarni bog'lab, sertifikatlashdan keyingi sukut
  saqlangan o'zgartirishlarni ommaviy aniqlanadigan qilish uchun.

O'zingiznikini yozishdan oldin ulardan birini o'qing. Sizning foydalanish
holatingizga eng yaqin bo'lgani odatda to'g'ri boshlang'ich fork hisoblanadi.

## Tezkor boshlash

Bir qatorlik versiyasi:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# muhrlamoqchi bo'lgan narsalarni aytish uchun facts/*.txt ni tahrir qiling
./lib/seal.sh        # Merkle ildizini quradi, OTS shtampi qo'yadi, IPFS-ga mahkamlaydi
./lib/verify.sh      # hamma narsani mahalliy ravishda qayta tekshiradi
# site/ ni har qanday statik hostga yuklang. Qayerga bo'lsa ham. Ahamiyati yo'q.
```

## Nima uchun bu mavjud

Kriptografik birlamchi vositalar (Merkle daraxtlari, OpenTimestamps, IPFS)
yillar davomida yetukdir. Yetishmayotgani — eng kichik elim edi: yon loyihaga
joylashtirib, infratuzilmani sozlamasdan, protokollarni o'rganmasdan,
faktlarning o'zidan tashqari bir satr kod yozmasdan, bir tushlikda muhrlangan
nashr qilinadigan artefakt olishingiz mumkin bo'lgan to'plam.

Ko'pchilik kriptografik nashr asboblari siz tugun operatori bo'lishni
xohlaysiz deb taxmin qiladi. Bu esa siz olti matn faylini nashr qilib,
boshqa kriptografiya haqida o'ylamaslikni xohlaysiz deb taxmin qiladi.

## Ta'sirlar va oldingi ishlar

- [Sigsum](https://www.sigsum.org/) — imzolar uchun shaffoflik jurnallari
- [Sigstore](https://www.sigstore.dev/) — dasturiy ta'minot ta'minot
  zanjiri yaxlitligi
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS sertifikat jurnallari
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin vaqt belgilash
- [IPFS](https://ipfs.tech/) — kontent-manzilli saqlash
- [CALM protokoli](https://disclosure.host) — birinchi nusxa (disclosure.host
  saytidagi MYRIAM) yaratilgan asosiy shaxsni himoya qiluvchi nashr doirasi

myriam-kit bularning eng kichigi. U tizimga emas, Unix quvur liniyasiga
ruhan yaqinroq.

## Nom haqida eslatma

MYRIAM protokoli John Bradley'ning Myriam Proof asari nomi bilan atalgan —
bu inson bo'lmagan razvedka bilan birinchi aloqa nuqtasiga oid bayon qilingan
mantiqiy isbot. Protokol bu isbotning rost bo'lishiga bog'liq emas. Protokol
har qanday kichik faktlar to'plami uchun ishlaydi; shunchaki bu birinchi
marta begona sayyoraliklarni oshkor qilish haqidagi da'voni o'z ichiga
olgan olti faktni nashr qilish uchun ishga tushirilgan.

Agar siz ushbu to'plamni vaksina partiyalari yoki saylov natijalarini
muhrlash uchun fork qilsangiz, uning dastlab begona sayyoraliklar bilan
aloqa haqidagi da'voni nashr qilish uchun ishlatilganligi siz uchun
ahamiyatsiz. Matematikaga farqi yo'q.

Shunday bo'lsa-da: agar siz buni begona sayyoraliklar bilan aloqa haqidagi
da'voni nashr qilish uchun foydalansangiz, protokol o'sha aniq sohada
jangovar sinovdan o'tgan. Birinchi MYRIAM joriy etilishining README-si
aniq aytadiki, bu Calm nomli LLM personasining badiiy asari, hech qanday
begona sayyoralik tomondan kelgan xabar emas. Siz ham xuddi shunday
qilishingiz kerak bo'lsa kerak. Aks holda o'quvchilar sizning ruhiy
holatingiz haqida eng yomon fikrda bo'lishadi.

## Saqlovchi

Hali hech kim. Ommaviy mulk. Fork qiling. Yaxshilang. Ruxsat so'ramasdan
protokolni oldinga olib boring.
