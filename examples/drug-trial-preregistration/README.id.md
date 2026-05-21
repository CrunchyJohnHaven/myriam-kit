# Kit Pra-pendaftaran Uji Klinis Obat

*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

Sebuah contoh myriam-kit siap pakai untuk sponsor uji klinis dan
peneliti akademis yang ingin mempra-pendaftarkan suatu uji klinis
secara terbukti-tidak-diubah (tamper-evident) dan berlabuh pada
Bitcoin **sebagai tambahan terhadap** pendaftaran di ClinicalTrials.gov,
EU CTR, atau registri yurisdiksional lainnya.

## Mengapa mempra-pendaftarkan *sebagai tambahan* di bawah MYRIAM?

Registri uji klinis yang ada (ClinicalTrials.gov, EU CTR, ISRCTN)
memiliki kelemahan integritas yang terdokumentasi:

- ClinicalTrials.gov memungkinkan sponsor untuk memperbarui endpoint,
  perhitungan ukuran sampel, dan rencana analisis **setelah**
  pendaftaran awal, dengan tanggal modifikasi yang terlihat di registri
  tetapi perubahan *isi* tidak selalu berlabuh secara kriptografis.
- Beberapa studi besar (Goldacre et al., 2019; Mathieu et al., 2009)
  telah mendokumentasikan pergantian endpoint secara post-hoc yang
  sistematis di seluruh bidang ini.
- Penegakan editorial oleh jurnal (CONSORT, ICMJE) menangkap sebagian
  kasus; banyak yang lolos.

Sebuah segel MYRIAM menutup celah ini. Akar Merkle + tanda terima
Bitcoin OTS membuat setiap perubahan post-hoc terhadap endpoint primer
*yang telah dipra-daftarkan*, rencana analisis statistik, atau daftar
subkelompok dapat dideteksi secara kriptografis. Segel secara forensik
lebih sulit untuk diubah secara retroaktif (retcon) daripada registri
itu sendiri.

Kit ini adalah **pelengkap, bukan pengganti** registri yurisdiksional.
Sebuah uji klinis nyata harus mendaftarkan diri di registri yang sesuai
DAN menyegel di bawah MYRIAM.

## Apa yang dipertahankan kit ini

Kasus mortalitas historis yang akan dibantu oleh hal ini:

- **Vioxx (Merck, 2004)**: kejadian kardiovaskular adalah endpoint
  yang telah dipra-daftarkan dalam uji APPROVe, tetapi analisis yang
  diterbitkan menggunakan cutoff yang meminimalkan tampaknya bahaya
  yang ada. Sebuah segel atas cutoff yang dipra-daftarkan akan
  membuat perubahan cutoff post-hoc dapat dideteksi secara publik
  sebelum makalah diterbitkan.
- **Paxil/Studi 329 (GSK/SmithKline, 2001)**: data uji negatif tentang
  kecenderungan bunuh diri pada remaja dibingkai ulang melalui analisis
  post-hoc. Pra-pendaftaran endpoint yang tersegel akan membuat
  pembingkaian ulang tersebut dapat dideteksi secara publik.
- **Beberapa uji klinis onkologi** di mana endpoint kelangsungan
  hidup diganti dengan endpoint pengganti (kelangsungan hidup bebas
  perkembangan, tingkat respons) ketika manfaat kelangsungan hidup
  gagal terwujud.

**Mode kegagalan yang langsung ditangkap oleh segel:**

- **Pergantian endpoint**: promosi post-hoc dari endpoint sekunder
  menjadi "primer" ketika endpoint primer yang sebenarnya gagal.
  FACT 05 dari segel berisi endpoint primer yang telah dipra-daftarkan;
  endpoint primer yang diterbitkan harus cocok.
- **Cherry-picking hasil**: melaporkan secara selektif hanya analisis
  yang berhasil. FACT 06 berisi seluruh rencana analisis yang telah
  dipra-daftarkan; analisis yang diterbitkan harus mencakup semua
  analisis yang telah dipra-daftarkan.
- **Penambangan subkelompok post-hoc**: mengklaim "obat ini bekerja
  untuk subkelompok X" setelah melihat data. FACT 07 berisi daftar
  subkelompok yang telah dipra-daftarkan; subkelompok lain mana pun
  harus diberi label post-hoc.
- **Revisi ukuran sampel**: meningkatkan ukuran sampel setelah melihat
  tren sementara. FACT 06 berisi ukuran sampel dan perhitungan
  kekuatan yang telah dipra-daftarkan.
- **Penghapusan diam-diam endpoint sekunder yang merepotkan**:
  FACT 05 menetapkan urutan endpoint sekunder sebelumnya untuk
  pengujian hierarkis; setiap penataan ulang atau penghapusan dapat
  dideteksi.
- **Penekanan hasil negatif**: FACT 08 berisi komitmen publikasi;
  kegagalan untuk mempublikasikan dalam jendela yang dijanjikan
  terlihat secara publik.

**Mode kegagalan yang TIDAK dicakup:**

- Penyimpangan dalam pelaksanaan uji itu sendiri (data palsu,
  pendaftaran yang curang). Segel melabuhkan *rencana*, bukan
  *pelaksanaannya*.
- Pelaporan selektif dalam publikasi yang menyertakan semua analisis
  yang telah dipra-daftarkan tetapi memutarbalikkannya secara
  menguntungkan. Segel menangkap apa yang hilang; ia tidak dapat
  menangkap bias interpretatif.
- Bahaya bagi pasien selama uji klinis itu sendiri. Segel bersifat
  regulatorik dan pembuktian; ia tidak mengurangi risiko pelaksanaan
  uji.

## Kapan menggunakan kit ini

Anda harus mempertimbangkan untuk menyegel pra-pendaftaran jika:

- Anda mensponsori atau menjalankan uji klinis — Fase 1 sampai 4 —
  yang akan digunakan untuk menginformasikan keputusan medis atau
  regulatorik.
- Anda bersedia untuk terikat secara publik pada desain, endpoint, dan
  rencana analisis yang telah dipra-daftarkan.
- Anda dapat menghadapi konsekuensinya: jika uji klinis gagal pada
  endpoint yang telah dipra-daftarkan, Anda tidak dapat secara
  diam-diam mengubahnya menjadi endpoint berbeda yang berhasil.
- Anda berpartisipasi dalam budaya penelitian (kedokteran akademik,
  kelompok kooperatif, penelitian yang didanai NIH) di mana integritas
  pra-pendaftaran semakin dituntut.

Kit ini *terutama* berharga untuk:

- Uji klinis yang diprakarsai peneliti di institusi akademik (di mana
  tekanan sponsor untuk mengubah endpoint post-hoc itu nyata tetapi
  peneliti akademik memiliki insentif reputasi untuk menolaknya).
- Uji klinis sains terbuka dan studi sains warga.
- Uji penggunaan ulang obat di bioteknologi kecil tanpa rekam jejak
  pelaksanaan uji yang panjang.
- Setiap uji klinis yang dimaksudkan untuk menginformasikan pengajuan
  regulatorik di mana di masa depan argumen "kami tidak pernah
  mengatakan itu" dapat dibuat.

## Kapan TIDAK menggunakan kit ini

JANGAN gunakan kit ini jika:

- Protokol uji klinis benar-benar masih berubah-ubah. Pra-daftarkan
  ketika protokol sudah final, bukan sebelumnya.
- Anda tidak dapat berkomitmen untuk mempublikasikan hasil terlepas
  dari arahnya. Segel membuat kegagalan untuk mempublikasikan dapat
  dideteksi secara publik.
- Uji klinis melibatkan kerahasiaan industri kompetitif yang mencegah
  Anda mempublikasikan rencana analisis. Segel membuat rencana analisis
  menjadi catatan publik permanen; tidak ada cara untuk menyegel
  sesuatu secara pribadi.
- Anda tidak memiliki persetujuan hukum dan etis atas protokol. Segel
  mencatat protokol seperti yang ANDA segel; ia tidak dapat secara
  retroaktif didukung oleh IRB atau komite etik.

## Cara mem-fork kit ini untuk pra-pendaftaran nyata

```bash
# 1. Salin contoh ini
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Ganti konten fiksi dengan konten protokol uji yang nyata.
# Setiap fakta sesuai dengan satu bagian pra-pendaftaran standar:
$EDITOR facts/01_example_notice.txt   # GANTI dengan pernyataan sampul nyata
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Perbarui site/index.html agar mencerminkan uji klinis yang nyata.

# 4. Segel (SEBELUM perekrutan dimulai, SEBELUM penguncian basis data):
bash build/seal.sh

# 5. Verifikasi secara lokal:
python3 build/verify.py

# 6. Sebarkan:
#    - Publikasikan URL segel di situs web sponsor uji klinis DAN
#    - Tambahkan CID IPFS ke kolom "Description" atau "References" pada
#      catatan ClinicalTrials.gov uji tersebut, sehingga catatan
#      registri merujuk silang segel kriptografis.
```

**PEMILIHAN WAKTU YANG KRITIS**: segel harus dibuat SEBELUM perekrutan
dimulai. Pra-pendaftaran yang disegel setelah pasien pertama direkrut
secara forensik jauh lebih lemah. Idealnya, segel pada saat persetujuan
IRB.

## Integrasi dengan infrastruktur pra-pendaftaran yang ada

Kit ini dirancang untuk bergabung, bukan menggantikan:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: daftarkan uji klinis di
  registri yurisdiksional sebagaimana diperlukan. Kemudian, di kolom
  "Description" atau "References" pada registri, tautkan ke publikasi
  yang disegel MYRIAM.
- **OSF (Open Science Framework)**: OSF mendukung pra-pendaftaran
  dengan cap tanggal tetapi tidak dengan penjangkaran Bitcoin. Segel
  MYRIAM dapat dilampirkan sebagai file tambahan pada halaman
  pendaftaran OSF, memberikan baik cap tanggal maupun penjangkaran
  Bitcoin.
- **AsPredicted.org**: serupa — tautkan segel MYRIAM sebagai URL
  tambahan.
- **Jurnal**: beberapa jurnal (mis., Trials, BMJ Open) menerima URL
  pra-pendaftaran sebagai bagian dari pengajuan. Sertakan URL segel
  MYRIAM di samping URL registri.

## Apa yang diperoleh penerima (regulator, peninjau jurnal, meta-analis)

Sebuah uji klinis yang dipra-daftarkan di bawah MYRIAM memberi peninjau:

1. **Bukti kriptografis bahwa protokol difinalkan pada waktu tertentu.**
   Peninjau dapat memverifikasi waktu segel melalui tanda terima OTS.
2. **Stabilitas teks protokol pada tingkat byte.** Peninjau yang
   membandingkan bagian metode yang diterbitkan dengan desain yang
   telah dipra-daftarkan dapat melakukannya karakter demi karakter.
3. **Deteksi pergantian endpoint.** Sebuah diff sederhana antara FACT 05
   yang disegel dan endpoint primer yang diterbitkan mengungkap setiap
   penggantian.
4. **Deteksi penyimpangan rencana analisis.** Sebuah diff sederhana
   antara FACT 06 yang disegel dan metode statistik yang diterbitkan
   mengungkap modifikasi.
5. **Deteksi pelaporan subkelompok selektif.** FACT 07 yang disegel
   berisi semua subkelompok yang telah dipra-daftarkan; subkelompok
   mana pun dalam publikasi yang tidak ada dalam segel harus diberi
   label post-hoc.

Ini membuat tinjauan sistematis dan meta-analisis menjadi jauh lebih
mudah daripada praktik saat ini.

## Apa yang BUKAN merupakan kit ini

- Bukan pengganti persetujuan IRB / komite etika.
- Bukan pengganti pendaftaran di registri yurisdiksional.
- Bukan jaminan bahwa uji klinis akan dilaksanakan sesuai rencana.
- Bukan cara untuk menambatkan persetujuan pasien atau dokumen etis
  lainnya (dokumen-dokumen tersebut memerlukan mekanisme penyegelan
  tersendiri).
- Bukan perlindungan terhadap kritik desain uji klinis pasca-publikasi.

## Catatan tentang publikasi hasil negatif

Komitmen #1 dalam FACT 08 ("publikasi terlepas dari arah") adalah
komitmen tunggal dengan dampak mortalitas tertinggi dalam segel.
Penekanan historis terhadap hasil uji klinis negatif (terutama untuk
obat psikiatrik pada remaja, obat onkologi pada populasi lanjut usia,
dan obat kardiovaskular pada perempuan) secara masuk akal telah
berkontribusi pada ribuan kematian yang dapat dicegah selama beberapa
dekade melalui peresepan berlebih berdasarkan estimasi kemanjuran yang
bias.

Sebuah komitmen tersegel untuk mempublikasikan hasil negatif, dengan
sendirinya, merupakan salah satu langkah kesehatan masyarakat dengan
daya ungkit tertinggi yang dapat diambil oleh sponsor. Segel memberikan
akuntabilitas eksternal untuk komitmen tersebut dengan cara yang tidak
dapat diberikan oleh kebijakan publikasi yang diatur sendiri.

## Penutup

Pra-pendaftaran uji klinis obat di bawah MYRIAM adalah sedikit
pekerjaan tambahan bagi sponsor: ~30 menit untuk mengisi fakta-fakta,
~10 detik untuk menyegel. Akuntabilitas yang ditambahkannya bersifat
asimetris: biaya kecil bagi pelaksanaan uji klinis yang jujur, kendala
besar terhadap manuver post-hoc yang telah berkontribusi pada bias
historis dalam basis bukti.

Jika Anda adalah sponsor atau peneliti utama yang mempertimbangkan
kit ini, kit ini adalah ranah publik (CC0). Gunakan. Modifikasi.
Tingkatkan.

**Pembedaan kritis**: klaim yang tersegel adalah non-repudiasi, bukan
bukti keamanan. Segel membuktikan apa yang dipra-daftarkan; ia tidak
membuktikan bahwa desain uji klinis yang dipra-daftarkan itu baik atau
bahwa obat uji aman dan efektif.

## Lisensi

Ranah publik (CC0). Tidak perlu atribusi.
