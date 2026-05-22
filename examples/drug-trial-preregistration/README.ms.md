# Kit Pra-pendaftaran Ujian Ubat

*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

Contoh myriam-kit siap pakai untuk penaja ujian klinikal dan penyelidik
akademik yang ingin mendaftar ujian terlebih dahulu dengan cara yang
bukti-gangguan dan ditambat Bitcoin, **sebagai tambahan kepada**
pendaftaran di ClinicalTrials.gov, EU CTR, atau pendaftaran bidang
kuasa lain.

## Mengapa pra-daftar *secara tambahan* di bawah MYRIAM?

Pendaftaran ujian sedia ada (ClinicalTrials.gov, EU CTR, ISRCTN)
mempunyai kelemahan integriti yang didokumentasikan:

- ClinicalTrials.gov membenarkan penaja mengemas kini titik akhir,
  pengiraan saiz sampel, dan rancangan analisis **selepas** pendaftaran
  asal, dengan tarikh pengubahsuaian kelihatan dalam pendaftaran tetapi
  perubahan *kandungan* tidak sentiasa ditambat secara kriptografi.
- Beberapa kajian besar (Goldacre et al., 2019; Mathieu et al., 2009)
  telah mendokumentasikan penukaran titik akhir pos-hoc yang sistematik
  di seluruh bidang.
- Penguatkuasaan editorial oleh jurnal (CONSORT, ICMJE) menangkap
  beberapa kes; ramai yang terlepas.

Mohor MYRIAM menutup jurang ini. Akar Merkle + resit Bitcoin OTS
menjadikan sebarang perubahan pos-hoc kepada titik akhir utama,
rancangan analisis statistik, atau senarai subkumpulan *yang
didaftarkan terlebih dahulu* dapat dikesan secara kriptografi. Mohor
adalah lebih sukar secara forensik untuk diubah suai berbanding
pendaftaran itu sendiri.

Kit ini adalah **pelengkap kepada**, bukan pengganti, pendaftaran
bidang kuasa. Ujian sebenar harus didaftarkan dalam pendaftaran yang
sesuai DAN dimohor di bawah MYRIAM.

## Apa yang dipertahankan oleh kit ini

Kes kematian sejarah yang ini mungkin telah membantu:

- **Vioxx (Merck, 2004)**: peristiwa kardiovaskular adalah titik akhir
  pra-daftar dalam ujian APPROVe tetapi analisis yang diterbitkan
  menggunakan titik potong yang meminimumkan kemudaratan jelas. Mohor
  titik potong pra-daftar akan menjadikan perubahan titik potong
  pos-hoc dapat dikesan secara umum sebelum kertas yang diterbitkan.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: data ujian negatif
  mengenai kecenderungan bunuh diri remaja telah dibingkai semula
  melalui analisis pos-hoc. Pra-pendaftaran bermohor titik akhir akan
  menjadikan pembingkaian semula dapat dikesan secara umum.
- **Pelbagai ujian onkologi** di mana titik akhir kelangsungan hidup
  ditukar kepada titik akhir pengganti (kelangsungan hidup bebas
  perkembangan, kadar tindak balas) apabila manfaat kelangsungan
  hidup gagal terwujud.

**Mod kegagalan yang ditangkap secara langsung oleh mohor:**

- **Penukaran titik akhir**: kenaikan pos-hoc titik akhir sekunder
  menjadi "utama" apabila titik akhir utama sebenar gagal. FACT 05
  mohor mengandungi titik akhir utama pra-daftar; titik akhir utama
  yang diterbitkan mesti sepadan.
- **Pemilihan hasil ceri**: melaporkan secara terpilih hanya analisis
  yang berjaya. FACT 06 mengandungi rancangan analisis pra-daftar
  yang lengkap; analisis yang diterbitkan mesti termasuk semua yang
  pra-daftar.
- **Perlombongan subkumpulan pos-hoc**: mendakwa "ubat itu berkesan
  untuk subkumpulan X" selepas melihat data. FACT 07 mengandungi
  senarai subkumpulan pra-daftar; mana-mana subkumpulan lain mesti
  dilabel sebagai pos-hoc.
- **Semakan saiz sampel**: meningkatkan saiz sampel selepas melihat
  trend interim. FACT 06 mengandungi saiz sampel pra-daftar dan
  pengiraan kuasa.
- **Penyingkiran senyap titik akhir sekunder yang tidak selesa**:
  FACT 05 menyusun terlebih dahulu titik akhir sekunder untuk ujian
  hierarki; sebarang pengaturan semula atau penyingkiran dapat dikesan.
- **Penindasan keputusan negatif**: FACT 08 mengandungi komitmen
  penerbitan; kegagalan untuk menerbitkan dalam tempoh yang
  dikomitmenkan dapat dilihat secara umum.

**Mod kegagalan yang TIDAK diliputi:**

- Salah laku dalam pelaksanaan ujian itu sendiri (data palsu, pendaftaran
  penipuan). Mohor menambat *rancangan*, bukan *pelaksanaan*.
- Pelaporan terpilih dalam penerbitan yang merangkumi semua analisis
  pra-daftar tetapi memutarbelitkannya dengan baik. Mohor menangkap
  apa yang hilang; ia tidak dapat menangkap bias tafsiran.
- Kemudaratan pesakit semasa ujian itu sendiri. Mohor adalah
  pengawalseliaan dan keterangan; ia tidak mengurangkan risiko
  pelaksanaan ujian.

## Bila hendak menggunakan kit ini

Anda harus mempertimbangkan untuk memohor pra-pendaftaran jika:

- Anda menaja atau menjalankan ujian klinikal — Fasa 1 hingga 4 —
  yang akan digunakan untuk memaklumkan keputusan perubatan atau
  pengawalseliaan.
- Anda sanggup terikat secara umum kepada reka bentuk, titik akhir,
  dan rancangan analisis pra-daftar.
- Anda boleh menanggung akibatnya: jika ujian gagal pada titik
  akhir pra-daftar, anda tidak boleh secara senyap mengubah suai
  kepada titik akhir lain yang berjaya.
- Anda mengambil bahagian dalam budaya penyelidikan (perubatan
  akademik, kumpulan kerjasama, penyelidikan dibiayai NIH) di mana
  integriti pra-pendaftaran semakin dituntut.

Kit ini *amat* berharga untuk:

- Ujian inisiatif penyiasat di institusi akademik (di mana tekanan
  penaja untuk menukar titik akhir pos-hoc adalah nyata tetapi di
  mana penyiasat akademik mempunyai insentif reputasi untuk menolak).
- Ujian sains terbuka dan kajian sains warganegara.
- Ujian pengubahsuaian ubat dalam bioteknologi kecil tanpa rekod
  prestasi pelaksanaan ujian yang panjang.
- Sebarang ujian yang bertujuan untuk memaklumkan penyerahan
  pengawalseliaan di mana hujah "kami tidak pernah berkata begitu"
  pada masa depan boleh dibuat.

## Bila JANGAN gunakan kit ini

JANGAN gunakan kit ini jika:

- Protokol ujian sebenarnya masih dalam fluks. Pra-daftar apabila
  protokol adalah muktamad, bukan sebelumnya.
- Anda tidak boleh berkomitmen untuk menerbitkan keputusan tanpa
  mengira arah. Mohor menjadikan kegagalan-untuk-menerbitkan dapat
  dikesan secara umum.
- Ujian melibatkan kerahsiaan industri kompetitif yang menghalang
  anda daripada menjadikan rancangan analisis umum. Mohor menjadikan
  rancangan analisis rekod awam kekal; tiada cara untuk memohor
  sesuatu secara persendirian.
- Anda tidak mempunyai kelulusan undang-undang dan etika ke atas
  protokol. Mohor merekodkan protokol seperti yang ANDA mohor; ia
  tidak boleh disokong secara retroaktif oleh IRB atau jawatankuasa
  etika.

## Cara mengefork kit ini untuk pra-pendaftaran sebenar

```bash
# 1. Salin contoh ini
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Gantikan kandungan fiksyen dengan kandungan protokol ujian sebenar.
# Setiap fakta sepadan dengan bahagian pra-pendaftaran standard:
$EDITOR facts/01_example_notice.txt   # GANTIKAN dengan kenyataan muka sebenar
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Kemas kini site/index.html untuk mencerminkan ujian sebenar.

# 4. Mohor (SEBELUM pendaftaran bermula, SEBELUM kunci pangkalan data):
bash build/seal.sh

# 5. Sahkan secara tempatan:
python3 build/verify.py

# 6. Galakkan:
#    - Terbitkan URL mohor ke laman web penaja ujian anda DAN
#    - Tambahkan CID IPFS ke medan "Description" atau "References"
#      rekod ClinicalTrials.gov ujian, supaya rekod pendaftaran
#      merujuk silang mohor kriptografi.
```

**MASA KRITIKAL**: mohor mesti dicipta SEBELUM pendaftaran bermula.
Pra-pendaftaran yang dimohor selepas pesakit pertama didaftarkan
adalah lebih lemah secara forensik. Sebaik-baiknya, mohor pada saat
kelulusan IRB.

## Integrasi dengan infrastruktur pra-pendaftaran sedia ada

Kit direka untuk menggubah, bukan menggantikan:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: daftarkan ujian dalam
  pendaftaran bidang kuasa seperti yang diperlukan. Kemudian, dalam
  medan "Description" atau "References" pendaftaran, pautkan ke
  penerbitan dimohor MYRIAM.
- **OSF (Open Science Framework)**: OSF menyokong pra-pendaftaran
  dengan setem tarikh tetapi bukan penambatan Bitcoin. Mohor MYRIAM
  boleh dilampirkan sebagai fail tambahan pada halaman pendaftaran
  OSF, memberikan kedua-dua setem-tarikh dan tambat-Bitcoin.
- **AsPredicted.org**: serupa — pautkan mohor MYRIAM sebagai URL
  tambahan.
- **Jurnal**: beberapa jurnal (cth., Trials, BMJ Open) menerima URL
  pra-pendaftaran sebagai sebahagian daripada penyerahan. Sertakan
  URL mohor MYRIAM bersama URL pendaftaran.

## Apa yang penerima (pengawal selia, pengulas jurnal, meta-penganalisis) dapat

Ujian pra-daftar di bawah MYRIAM memberi pengulas:

1. **Bukti kriptografi protokol dimuktamadkan pada masa tertentu.**
   Pengulas boleh mengesahkan masa mohor melalui resit OTS.
2. **Kestabilan bait-bijaksana teks protokol.** Pengulas yang
   membandingkan bahagian kaedah yang diterbitkan dengan reka bentuk
   pra-daftar boleh berbuat demikian aksara demi aksara.
3. **Pengesanan penukaran titik akhir.** Diff mudah antara FACT 05
   yang dimohor dan titik akhir utama yang diterbitkan mendedahkan
   sebarang penggantian.
4. **Pengesanan penyimpangan rancangan analisis.** Diff mudah antara
   FACT 06 yang dimohor dan kaedah statistik yang diterbitkan
   mendedahkan pengubahsuaian.
5. **Pengesanan pelaporan subkumpulan terpilih.** FACT 07 yang dimohor
   mengandungi semua subkumpulan pra-daftar; mana-mana dalam penerbitan
   yang tidak dalam mohor mesti dilabel sebagai pos-hoc.

Ini menjadikan tinjauan sistematik dan meta-analisis lebih mudah
daripada amalan semasa.

## Apa kit ini BUKAN

- Bukan pengganti kelulusan IRB / jawatankuasa etika.
- Bukan pengganti pendaftaran pendaftaran bidang kuasa.
- Bukan jaminan bahawa ujian akan dijalankan seperti yang dirancang.
- Bukan cara untuk menambat persetujuan pesakit atau dokumen etika
  lain (yang memerlukan mekanisme pemohoran mereka sendiri).
- Bukan perlindungan terhadap kritikan pasca-penerbitan reka bentuk
  ujian.

## Nota mengenai penerbitan keputusan negatif

Komitmen #1 dalam FACT 08 ("penerbitan tanpa mengira arah") adalah
satu-satunya komitmen impak-kematian tertinggi dalam mohor. Penindasan
sejarah keputusan ujian negatif (terutamanya untuk ubat psikiatri
pada remaja, ubat onkologi dalam populasi tua, dan ubat kardiovaskular
dalam wanita) mungkin telah menyumbang kepada ribuan kematian yang
boleh dicegah selama beberapa dekad melalui preskripsi berlebihan
berdasarkan anggaran keberkesanan yang berat sebelah.

Komitmen bermohor untuk menerbitkan keputusan negatif, dengan
sendirinya, adalah salah satu langkah kesihatan awam paling
berleveraj yang boleh dibuat oleh penaja. Mohor menyediakan
akauntabiliti luaran untuk komitmen itu dengan cara yang tidak
dilakukan oleh dasar penerbitan yang dipantau sendiri.

## Penutup

Pra-pendaftaran ujian ubat di bawah MYRIAM adalah kerja tambahan kecil
untuk penaja: ~30 minit untuk mengisi fakta, ~10 saat untuk memohor.
Akauntabiliti yang ditambahkannya adalah asimetri: kos kecil kepada
pelaksanaan ujian jujur, sekatan besar pada manuver pos-hoc yang
telah menyumbang kepada bias sejarah dalam asas bukti.

Jika anda penaja atau penyiasat utama yang mempertimbangkan kit ini,
kit adalah domain awam (CC0). Gunakannya. Ubah suai. Tingkatkan.

## Lesen

Domain awam (CC0). Tiada atribusi diperlukan.
