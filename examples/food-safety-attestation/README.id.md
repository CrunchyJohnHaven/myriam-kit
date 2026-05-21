*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

# Kit Atestasi Keamanan Pangan

Contoh myriam-kit siap-pakai untuk produsen pangan, inspektur
keamanan pangan, sertifikator pihak ketiga, dan otoritas
regulasi yang ingin menerbitkan segel berlabuh Bitcoin yang
tahan-rusak atas *apa yang dikatakan uji pelepasan* dan
*keputusan pelepasan apa yang dibuat*, pada saat pelepasan
batch atau penandatanganan laporan inspeksi — sehingga
modifikasi diam-diam pasca-pelepasan atas catatan pengujian,
keputusan pelepasan, atau komitmen recall menjadi dapat
dideteksi secara publik.

---

## Apa yang TIDAK dilakukan kit ini (baca terlebih dahulu)

Segel adalah cap-waktu kriptografis atas uji pelepasan MANA yang
dilakukan pada lot MANA, oleh laboratorium terakreditasi MANA,
di bawah metode MANA, dengan hasil MANA, dan KEPUTUSAN
PELEPASAN apa yang dibuat oleh otoritas QA berdasarkan hasil
tersebut. Segel tidak dapat menjawab pertanyaan apa pun
mengenai keamanan pangan di luar itu. Berikut ini berada
**di luar domain segel**:

1. **Mencegah kontaminasi.** Kit berlabuh pada apa yang
   DIKATAKAN hasil uji pada saat pelepasan. Kontaminasi memiliki
   banyak penyebab — distribusi mikrobial heterogen dalam suatu
   lot, penyalahgunaan suhu pasca-pelepasan dalam distribusi,
   kegagalan penanganan retail, kegagalan penyiapan oleh
   konsumen, bahaya baru atau tidak-tersaring (mis. adulterasi
   melamin sebelum penyaringan melamin menjadi rutin), penipuan
   rantai-pasokan di hulu cakupan pengujian produsen. Segel
   tidak mencegah satu pun dari ini dan tidak mengklaim
   mencegahnya.

2. **Menjamin bahwa semua unit dalam lot yang lulus aman.**
   Kontaminasi mikrobiologis dalam produk pangan curah adalah
   HETEROGEN. Patogen Listeria, Salmonella, dan STEC terjadi
   dalam hotspot lokal dengan prevalensi-rendah, tidak
   terdistribusi seragam. Rencana sampling ICMSF dan Codex
   memiliki probabilitas terdokumentasi dan terbatas untuk
   mendeteksi kontaminasi yang hadir pada prevalensi-rendah —
   probabilitasnya BUKAN 1. Suatu lot yang lulus sampling
   pelepasan masih dapat berisi unit terkontaminasi yang tidak
   disampel. Segel berlabuh pada SAMPEL, bukan curah. Pembatasan
   ini dinyatakan kembali secara eksplisit dalam FAKTA 03 dan
   merupakan batas-jujur paling penting dari kit ini.

3. **Mensertifikasi bahwa uji pelepasan dijalankan dengan
   jujur.** Segel berlabuh pada apa yang dilaporkan uji pada
   saat pelepasan. Laboratorium yang melaporkan LULUS yang
   curang pada pelepasan menghasilkan segel yang valid secara
   kriptografis atas LULUS yang curang. Kit membuat modifikasi
   diam-diam kemudian dapat dideteksi, tetapi tidak mendeteksi
   penipuan sezaman. Deteksi penipuan sezaman memerlukan audit,
   pengawasan akreditasi laboratorium (pengawasan ISO 17025),
   program pengujian kemahiran, dan inspeksi regulator — semua
   yang berada di hulu segel.

4. **Mengganti pengajuan regulasi FSMA, FSIS, atau otoritas
   kompeten UE.** Catatan pelepasan di bawah FSMA, FSIS,
   Peraturan UE (EC) 178/2002, dan Codex Alimentarius
   dipelihara sesuai undang-undang dan diproduksi atas
   permintaan regulator. Segel menambahkan lapisan publik
   tahan-rusak DI ATAS pengajuan tersebut; segel TIDAK
   menggantinya. Publikasi tersegel bukan pengajuan regulasi.

5. **Menyelesaikan perselisihan cakupan recall.** Kit dapat
   menyegel komitmen recall yang dibuat pada pelepasan (FAKTA
   06) dan cakupan recall berikutnya sebagai publikasi baru;
   tetapi batas lot mana yang terpengaruh, unit mana yang
   dikirim, peritel mana yang menerimanya, dan konsumen mana
   yang terpapar masih merupakan investigasi pelacakan-balik
   dan pelacakan-maju. Segel berlabuh pada apa yang
   DIKOMITMENKAN produsen dan apa yang kemudian DILAKUKAN-nya.
   Segel tidak menyelesaikan pertanyaan epidemiologis
   mendasar.

6. **Mendeteksi penipuan rantai-pasokan yang disengaja di hulu
   pengujian.** Adulterasi susu dan susu formula bayi dengan
   melamin di Tiongkok tahun 2008 berhasil karena melamin
   tidak ada dalam panel analit — pengukuran protein-ekuivalen
   berdasarkan kandungan nitrogen yang ada, dan melamin
   memalsukannya. FAKTA 03 yang disegel dengan panel analit
   yang digunakan pada saat itu akan berkomitmen pada panel
   tersebut secara publik — tetapi tidak akan melakukan apa
   pun untuk mendeteksi adulteran di luar panel. Nilai segel
   dalam kasus tersebut adalah penjangkaran forensik atas
   „inilah yang diklaim diuji produsen", BUKAN pencegahan.
   Rezim keamanan-pangan nyata mengatasi ini melalui sampling
   regulator tak-diumumkan dengan penyaringan cakupan-luas
   (metode tak-tertarget LC-MS, misalnya), yang berada di
   hulu segel produsen.

7. **Menjangkar distribusi pasca-pelepasan dan penanganan
   konsumen.** Setelah lot meninggalkan fasilitas,
   penyalahgunaan suhu selama distribusi, kesalahan penanganan
   di retail, kegagalan penyimpanan konsumen, dan kesalahan
   penyiapan konsumen semuanya berada di luar cakupan. Segel
   dicakup pada peristiwa pelepasan produsen. Bukti-rusak
   hilir memerlukan kit terpisah pada tingkat distributor,
   peritel, dan (untuk konsumen institusional seperti sekolah
   dan rumah sakit) titik-penggunaan.

8. **Menjamin keamanan pangan dalam populasi spesifik mana
   pun.** Hasil LULUS FAKTA 03 tidak menyiratkan keamanan
   bagi konsumen hamil, bayi, konsumen imunokompromis, atau
   lansia, yang Listeria monocytogenes dan Salmonella
   menyajikan risiko meningkat terdokumentasi bahkan pada
   konsentrasi di bawah batas deteksi konvensional. Segel
   tidak dapat membuat klaim keamanan spesifik-populasi dan
   menolak melakukannya (aturan-penolakan R6).

**Bagian batas-jujur di atas adalah bagian penyangga-beban kit
ini.** Produsen yang memperlakukan „kami menyegel catatan
pelepasan kami" sebagai setara dengan „kami membuktikan
pangan kami aman" menyalahgunakan primitif ini. Kit harus
mengatakan dengan jelas: *ini adalah primitif non-penyangkalan
untuk klaim sezaman produsen pada pelepasan, bukan bukti
keamanan, bukan pengganti untuk pengawasan regulator, dan
bukan pertahanan terhadap mode kegagalan
heterogen-kontaminasi, penipuan-rantai-pasokan, atau
salah-tangan pasca-pelepasan yang telah membunuh orang dalam
wabah masa lalu.*

---

## Apa yang HARUS DITOLAK kit ini untuk disegel

Kit dikonfigurasi untuk menolak pola fakta berikut bahkan jika
pengguna dengan otoritas penandatanganan produsen yang sah
mengirimkannya:

- **Identifikasi pribadi pekerja, supervisor, staf QA,
  inspektur kunjungan, atau auditor pihak ketiga mana pun.**
  Nama, ID karyawan, nomor lencana, nomor jaminan sosial,
  alamat rumah, nomor telepon pribadi — tidak satu pun dari
  ini muncul dalam segel publik. Peran bersifat publik;
  pengikatan orang-ke-peran disegel secara terpisah dan
  dapat ditemukan di bawah proses regulator. Keamanan pekerja
  terhadap pembalasan dan pelecehan adalah pembatasan
  penyangga-beban; atestasi keamanan-pangan dapat dilakukan
  pada tingkat-peran. (R1)

- **Lokasi fasilitas yang tepat.** Wilayah fasilitas (negara
  bagian atau wilayah multi-negara-bagian) dapat diterima;
  alamat jalan yang tepat, koordinat GPS, atau pengidentifikasi
  apa pun dengan granularitas yang cukup untuk
  mengidentifikasi pabrik secara fisik di peta TIDAK dapat
  diterima. Nomor pendirian regulasi adalah pegangan
  regulator untuk fasilitas tersebut; pertimbangan keamanan
  fisik dan keamanan-pekerja berdebat menentang penerbitan
  alamat publik di Bitcoin. (R2)

- **Pola personel shift-produksi individual.** Jadwal shift,
  rotasi pekerja individual, ID pribadi operator lini —
  tidak satu pun dari ini muncul dalam segel. Pola-hidup
  pekerja individual tidak boleh dapat diturunkan dari
  atestasi publik. (R3)

- **Identitas pemasok yang membahayakan kontrak.** Nama
  pemasok, lokasi fasilitas pemasok, kode lot pemasok
  (kecuali dalam kasus kontaminasi-rantai-pasokan di mana
  menamai lot terkontaminasi pemasok diperlukan untuk
  kesehatan publik, dan ditangani melalui publikasi
  tersegel terpisah) TIDAK diterbitkan dalam segel pelepasan.
  Banyak kontrak pasokan mengandung ketentuan kerahasiaan;
  segel tidak melanggarnya secara default. (R4)

- **Daftar pelanggan dan tujuan distribusi di luar
  tingkat-tinggi.** Ringkasan regional tingkat-tinggi dapat
  diterima; daftar pelanggan spesifik (peritel, pusat
  distribusi, akun layanan-pangan) TIDAK dapat diterima.
  Identitas pelanggan bersifat kontraktual rahasia dan
  sensitif secara kompetitif; regulator memperoleh daftar
  pelanggan melalui saluran koordinasi-recall yang sudah
  mapan. (R5)

- **Klaim keamanan atau kesimpulan hukum.** Kit tidak akan
  menyegel „produk ini aman", „lot ini memenuhi semua standar
  keamanan-pangan yang berlaku", „ini adalah GRAS untuk
  penggunaan ini", atau kesimpulan keamanan atau hukum
  lainnya. Kit berlabuh pada catatan pengujian dan keputusan
  pelepasan, BUKAN kesimpulan keamanan. (R6)

- **Pola re-identifikasi keluhan-pekerja atau whistleblower.**
  Kit menolak menerbitkan pola apa pun yang dapat
  mengidentifikasi-ulang pekerja yang telah mengajukan
  keluhan OSHA, USDA, atau internal-perusahaan tentang
  praktik keamanan-pangan atau keamanan-tempat-kerja. Pengadu
  semacam itu dilindungi di bawah FSMA Bagian 402 dan
  undang-undang paralel; segel tidak boleh menjadi vektor
  re-identifikasi. Atestasi whistleblower memiliki kit
  sendiri (`examples/whistleblower-manifest`) dengan aturan
  penolakan yang disetel untuk kasus penggunaan tersebut. (R7)

- **Penyegelan oleh siapa pun selain prinsipal yang berwenang
  dari produsen yang melepaskan.** Sertifikator pihak ketiga,
  tim QA pelanggan, atau auditor independen dapat
  menggunakan kit yang sama untuk menyegel temuan audit
  MEREKA sendiri; mereka TIDAK boleh menyegel keputusan
  pelepasan asli atas nama produsen. Prinsipal penandatangan
  di FAKTA 08 adalah satu-satunya penanda-tangan yang sah
  untuk itu. (R8)

Penolakan itu sendiri dapat disegel sebagai fakta („Produsen
ini meminta penyegelan X; kit menolak sesuai aturan-penolakan
Y"), menciptakan rekaman publik atas upaya penyalahgunaan.

---

## Apa yang DISEGEL kit ini

8 fakta pada saat pelepasan:

1. **Pemberitahuan contoh** — mendeklarasikan publikasi sebagai
   contoh (atestasi nyata menghapus atau menggantinya).
2. **Identifikasi produk dan batch** — nama produk, kategori,
   produsen, wilayah fasilitas (BUKAN lokasi yang tepat),
   versi rencana HACCP + hash, ID lot, tanggal
   produksi / pengemasan / kedaluwarsa, jumlah unit konsumen,
   persyaratan penyimpanan, tiga titik kontrol kritis dengan
   hash catatan-terlog (letalitas pemasakan, stabilisasi
   pendinginan, lingkungan RTE pasca-letalitas).
3. **Hasil pengujian pelepasan** — uji mikrobiologis produk-jadi
   (Listeria, Salmonella, STEC, APC, Enterobacteriaceae),
   uji kimia / residu (nitrit, residu veteriner, logam berat),
   verifikasi kontak-silang alergen, ringkasan pemantauan
   lingkungan, masing-masing dengan SHA-256 PDF laporan-lengkap
   dan batasan interpretasi sampel-vs-curah yang eksplisit.
4. **Metodologi dan kualifikasi laboratorium** — metode mana
   (dan versi dokumen-metode mana) yang digunakan per baris,
   lab mana yang menjalankan uji mana, status akreditasi
   ISO/IEC 17025:2017 dan hash sertifikat setiap lab, hasil
   uji-kemahiran terkini, pernyataan independensi, catatan
   deviasi / uji-ulang / OOS untuk lot ini.
5. **Keputusan pelepasan** — tanggal pelepasan, otoritas
   pelepasan tingkat-peran + penanda-tangan-saksi, ringkasan
   catatan-pendukung keputusan, tujuan distribusi
   tingkat-tinggi, kewajiban pasca-pelepasan yang diakui pada
   pelepasan, komitmen waktu-dan-tak-dapat-dibalikkan.
6. **Komitmen recall dan pengawasan pasca-pasar** — analog
   keamanan-pangan dari farmakovigilan: transparansi
   sinyal-penyakit, komitmen eksekusi recall (ambang 24j /
   72j / 98%), respons kontaminasi rantai-pasokan, komitmen
   tidak-ada-uji-ulang-diam-diam, komitmen
   tidak-ada-perubahan-spesifikasi-pasca-hoc, berbagi
   sinyal-keamanan agregat.
7. **Pengungkapan-pendamping dan catatan penolakan** — hash
   log investigasi tindakan-korektif, riwayat inspeksi
   terkini, riwayat recall, masalah terbuka yang diketahui
   dalam metode pengujian yang digunakan, pengikatan
   peran-ke-individu (disegel terpisah, dihash di sini),
   kesiapan pelacakan-balik pemasok, daftar eksplisit aturan
   penolakan R1-R8 dengan setiap penolakan yang dijalankan
   selama pelepasan ini.
8. **Prinsipal penandatangan** — produsen + penanda-tangan
   tingkat-peran (Direktur QA) + penanda-tangan-saksi
   tingkat-peran (Manajer Pabrik) + info kunci kriptografis;
   alasan untuk publikasi tingkat-peran.

Setiap fakta diakhiri dengan konvensi gerbang-penolakan:
*„Fakta ini menegaskan hanya X. Fakta ini tidak menegaskan Y"*
(di mana Y adalah mode-kegagalan terdekat dari bagian „TIDAK
dilakukan" di atas).

---

## Apa yang dipertahankan kit ini

- **Modifikasi retroaktif diam-diam atas hasil uji pelepasan.**
  Semua PDF laporan-uji di-hash. Hashing-ulang pasca-pelepasan
  mengungkap modifikasi apa pun.
- **Perselisihan tentang metode mana, versi dokumen-metode
  mana, dan lab mana yang digunakan.** FAKTA 04 membekukan
  metodologi dan status akreditasi lab pada pelepasan.
  Klaim „kami sebenarnya menggunakan MLG 4.13, bukan 4.12"
  kemudian dapat dibantah secara publik.
- **Pen-spec-ulang retroaktif untuk batch di-luar-spec.** Jika
  hasil uji-pelepasan sebenarnya adalah LULUS perbatasan yang
  direklasifikasi sebagai GAGAL pasca-pelepasan, hash
  laporan tersegel membuktikan apa yang dikatakan PDF hasil
  asli. Secara simetris, OOS perbatasan yang diuji-ulang
  secara diam-diam menjadi LULUS tanpa pengungkapan dapat
  dideteksi jika komitmen tidak-ada-uji-ulang-diam-diam
  FAKTA 06 kemudian dibandingkan terhadap amandemen
  yang-tidak-tersegel.
- **Minimisasi cakupan recall diam-diam.** Komitmen recall
  dalam FAKTA 06 (pemberitahuan 24j, inisiasi 72j,
  pemulihan 98%) disegel; kegagalan untuk menghormati
  mereka dapat diamati secara publik.
- **Re-narasi pasca-hoc atas riwayat tindakan-korektif.**
  Hash log tindakan-korektif FAKTA 07 membekukan apa yang
  KATAKAN perusahaan dilakukannya setelah EMP presumtif;
  klaim „kami melakukan lebih / kurang dari itu" kemudian
  dapat dibantah secara publik.
- **Pelalaian selektif atas pengungkapan-pendamping.** FAKTA
  07 menghitung kategori pengungkapan yang diharapkan
  (riwayat inspeksi, riwayat recall, tinjauan
  metode-advisory, kesiapan pelacakan-balik); kategori
  kosong harus diatestasi secara eksplisit („tidak ada pada
  waktu pelepasan"), sehingga „kami tidak menyadari itu
  relevan" kemudian dapat dibantah secara publik.
- **Substitusi status akreditasi lab yang berbeda.** FAKTA 04
  membekukan cakupan ISO 17025 dan hash sertifikat setiap
  lab pada pelepasan; substitusi kemudian dari lab
  tidak-terakreditasi dapat dideteksi secara publik.

Kit ini **tidak** mempertahankan terhadap korupsi sezaman —
tim yang dengan sengaja menyegel hasil uji palsu pada waktu
pelepasan menghasilkan segel yang valid secara kriptografis
atas hasil uji palsu. Primitif jujur tentang hal ini: ini
adalah primitif non-penyangkalan untuk klaim sezaman produsen,
bukan bukti klaim tersebut benar.

---

## Preseden kematian historis

Kit akan menghasilkan jangkar yang berguna — *bukan resolusi* —
dalam kegagalan keamanan-pangan masa lalu. Untuk menghindari
pencemaran nama baik individu (kebanyakan kegagalan
keamanan-pangan adalah korporasi, bukan individu; beberapa
diadili secara pidana dan beberapa tidak), referensi ini
menjelaskan wabah berdasarkan tahun dan patogen dan menamai
entitas yang terlibat hanya ketika kontaminasi secara publik
diatribusikan oleh pemberitahuan recall atau catatan
pengadilan.

- **Adulterasi melamin susu formula bayi dan susu di Tiongkok
  tahun 2008 (Sanlu Group + lainnya).** Setidaknya enam
  kematian bayi dan ~300.000 penyakit yang dapat diatribusikan
  pada produk susu yang dipalsukan dengan melamin yang dirancang
  untuk menggelembungkan kandungan protein-tampak secara
  curang pada uji Kjeldahl berbasis nitrogen. Penghukuman
  diikuti di pengadilan RRC, termasuk hukuman mati. *Segel
  tidak akan mencegah ini* — melamin berada di luar panel
  analit standar. Segel akan berkomitmen secara publik pada
  apa panel ITU, membuat cakupan perluasan pasca-insiden dari
  penyaringan rutin secara forensik jelas.

- **Wabah STEC O104:H4 Eropa tahun 2011 (kecambah fenugreek
  yang ditelusuri ke peternakan Jerman).** 53 kematian,
  ~3.950 penyakit di banyak negara Eropa; akhirnya ditelusuri
  ke benih fenugreek yang diimpor dari Mesir dan dikecambahkan
  di produsen Jerman. Pelacakan-balik terhambat oleh
  dokumentasi tingkat-lot yang tidak konsisten di rantai
  pasokan multi-negara. *Segel tidak akan mencegah kontaminasi
  lot benih* (kontaminasi berada di hulu uji pengecambah);
  segel akan menjangkar apa yang diklaim uji pelepasan
  pengecambah dan, jika digunakan di tingkat importir benih,
  apa yang diklaim penanganan benih-impor, membuat
  pelacakan-balik lebih cepat.

- **Wabah Listeria monocytogenes Blue Bell Creameries tahun
  2015 (Amerika Serikat).** 3 kematian, 10 penyakit di banyak
  negara bagian; mengarah pada recall nasional dan vonis
  federal pidana 2020 atas Blue Bell pada tuduhan
  keamanan-pangan misdemeanor, dengan perusahaan masuk ke
  perjanjian penangguhan-penuntutan dan membayar $19,35 juta.
  Litigasi sipil berikutnya. *Segel tidak akan mencegah*
  kontaminasi lingkungan Listeria dalam-pabrik; segel akan
  secara forensik menjangkar catatan program pemantauan
  lingkungan, membuat pertanyaan pasca-insiden „apa yang
  ditunjukkan EMP dalam bulan-bulan sebelum wabah" dapat
  dijawab terhadap rekaman cap-waktu tahan-rusak daripada
  terhadap dokumen yang diproduksi-kemudian.

- **Wabah STEC O157:H7 multi-negara-bagian tahun 2018 yang
  ditautkan ke selada romaine (wilayah penanaman Yuma,
  kemudian wilayah penanaman Salinas).** Setidaknya 5
  kematian dan ~210 penyakit di banyak wabah tahun itu.
  Pelacakan-balik diperumit oleh produk dikemas
  bersumber-campuran. *Segel tidak akan mencegah* kontaminasi
  di tingkat lapangan / air-irigasi (di hulu produsen);
  segel akan secara forensik menjangkar catatan uji-asupan
  dan uji-pelepasan setiap pemroses, membuat pelacakan-balik
  lebih cepat dan rekaman publik lebih dapat dipertahankan
  secara kriptografis terhadap perselisihan kemudian.

- **Wabah Salmonella Typhimurium Peanut Corporation of
  America (2008-2009, Amerika Serikat).** 9 kematian, ~714
  penyakit; mengakibatkan vonis federal pidana 2014-2015 atas
  eksekutif PCA, termasuk hukuman penjara 28 tahun untuk CEO
  atas tuduhan konspirasi dan penghalangan. *Segel tidak akan
  mencegah* kontaminasi, kurang-investigasi atas uji
  Salmonella dalam-pabrik yang positif, atau keputusan
  tingkat-eksekutif untuk mengirim produk terhadap temuan
  positif tersebut. Segel AKAN membuat secara forensik jelas,
  di persidangan, apa yang DIKATAKAN hasil uji pada saat
  mereka dihasilkan — membuat kasus penuntutan terhadap email
  narasi-palsu sezaman secara substansial lebih terjangkar
  terhadap modifikasi dokumen.

Dalam setiap kasus ini, kit akan memberikan kronologi forensik
yang lebih bersih. Dalam tidak satu pun dari kasus ini kit
dengan sendirinya akan mencegah kematian. Segel adalah
infrastruktur forensik, bukan infrastruktur pencegahan.
Pembedaan itu adalah kejujuran kit.

---

## Kapan menggunakan kit ini

- Operasi manufaktur Anda memiliki program HACCP / Kontrol
  Pencegahan yang stabil dan ingin menambahkan atestasi
  publik berlabuh-Bitcoin sebagai lapisan tahan-rusak di
  atas alur kerja dokumentasi pelepasan yang ada.
- Anda adalah produsen kecil-hingga-menengah atau produsen di
  yurisdiksi dengan infrastruktur regulasi yang lebih lemah,
  yang ingin menjangkar catatan batch terhadap garis-waktu
  yang dapat diverifikasi secara global — untuk kepercayaan
  pasar-ekspor, untuk respons audit-pelanggan, atau untuk
  partisipasi dalam inisiatif transparansi sukarela.
- Anda adalah inspektur keamanan-pangan atau sertifikator
  pihak-ketiga dan ingin menerbitkan segel temuan-audit
  tahan-rusak pada penandatanganan, sehingga temuan audit
  tidak dapat secara diam-diam diamandemen kemudian dengan
  kesepakatan antara produsen dan sertifikator.
- Anda mengharapkan lot ini menghadapi pengawasan hilir yang
  signifikan (pasar ekspor, kategori risiko-tinggi seperti
  daging RTE atau susu formula bayi, bahan baru, riwayat
  recall terkini).
- Anda dapat menerbitkan set fakta yang terdaftar tanpa
  melanggar aturan penolakan R1-R8. Jika fakta Anda akan
  memerlukan pelanggaran R1-R8, jangan gunakan kit; perbaiki
  input data dulu.
- Penasihat produsen telah meninjau rencana publikasi.
  Publikasi publik atas artefak yang membawa-pengidentifikasi-
  lot memiliki implikasi untuk paparan tanggung-jawab-
  produk; tinjauan penasihat bukan opsional.

## Kapan TIDAK menggunakan kit ini

- **Jangan gunakan sebagai pengganti catatan regulasi
  FSMA / FSIS / UE.** Segel bersifat *aditif*, bukan
  pengganti. Catatan pelepasan statutori Anda, rencana HACCP
  Anda, log CCP Anda, dan rencana recall Anda tidak berubah.
- **Jangan gunakan sebagai klaim keamanan.** Menyegel catatan
  pelepasan yang lulus tidak menetapkan bahwa produk aman;
  itu menetapkan bahwa catatan memiliki konten byte ini pada
  waktu ini. Aturan-penolakan R6 akan menolak kesimpulan
  keamanan apa pun.
- **Jangan gunakan untuk menerbitkan identitas pemasok,
  daftar pelanggan, nama pekerja, atau alamat fasilitas.**
  Aturan penolakan R1-R5 ada untuk alasan
  keamanan-manusia dan kontrak; jangan amandemen kit untuk
  mengalahkan mereka tanpa berkonsultasi penasihat.
- **Jangan gunakan di bawah tekanan untuk menyegel sebelum
  pengujian pelepasan selesai.** Segel data-parsial salah
  merepresentasikan keadaan keputusan pelepasan.
- **Jangan gunakan sebagai teater legitimasi.** Segel atas
  rencana sampling yang dirancang-buruk atau panel analit
  yang dipilih-buruk adalah catatan publik permanen atas
  ketidakcukupan, bukan pertahanan terhadapnya. Primitif
  memotong dua arah; itulah kejujurannya.
- **Jangan gunakan selama situasi recall aktif sebagai
  pengganti untuk koordinasi recall regulator.** Publikasi
  MYRIAM baru yang menjangkar cakupan recall sesuai SETELAH
  recall yang dikoordinasikan-regulator dimulai; itu bukan
  pengganti untuk saluran recall regulator.

## Cara meng-fork kit ini untuk pelepasan nyata

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**PENGATURAN-WAKTU KRITIS:** segel pada saat pelepasan QA,
SEBELUM lot didistribusikan (sebelum truk pertama meninggalkan
fasilitas). Segel setelah distribusi dimulai masih memiliki
nilai tetapi tidak menjangkar keadaan pra-distribusi dengan
bersih. Jendela yang tepat adalah antara tanda-tangan
pelepasan QA dan pergerakan distribusi pertama.

**TINJAUAN KRITIS:** sebelum menyegel, jalankan publikasi
melalui peninjau QA kedua (bukan yang utama) dan melalui
penasihat perusahaan. Setelah disegel, publikasi bersifat
permanen.

## Integrasi dengan infrastruktur keamanan-pangan yang ada

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  URL publikasi tersegel atau IPFS CID dapat dirujuk dalam
  dokumentasi Food Safety Plan sebagai artefak
  atestasi-publik untuk lot ini.
- **Rencana HACCP dan catatan pelepasan USDA FSIS.** Catatan
  pelepasan tersegel duduk bersama catatan HACCP yang
  diharuskan FSIS; segel mereferensikan hash versi rencana
  HACCP (FAKTA 02) sehingga perselisihan kemudian tentang
  versi rencana mana yang berlaku dapat dibantah secara
  publik.
- **Codex Alimentarius / prinsip HACCP** (Codex CAC/RCP
  1-1969 Rev. 4-2003). Segel berkomitmen pada keluaran
  HACCP tujuh-prinsip (analisis bahaya, CCP, batas kritis,
  pemantauan, tindakan korektif, verifikasi, perekaman)
  untuk lot ini.
- **ISO 22000:2018 (Sistem Manajemen Keamanan Pangan).** Segel
  dapat dirujuk sebagai bagian dari jejak bukti tinjauan
  manajemen; segel tidak menggantikan sertifikasi ISO 22000.
- **Skema sertifikasi FSSC 22000 v6.** Kompatibel sebagai
  lapisan transparansi aditif; auditor FSSC dapat memverifikasi
  segel selama pengawasan.
- **Peraturan UE (EC) 178/2002 (Hukum Pangan Umum) Pasal 18
  (ketertelusuran) dan Pasal 19 (pemberitahuan recall).**
  Segel berkomitmen kesiapan pelacakan-balik satu-tier-balik
  produsen (FAKTA 07) dan komitmen recall (FAKTA 06); segel
  tidak menggantikan kewajiban pemberitahuan statutori
  Pasal 19.
- **Paket Higiene UE (Peraturan 852/2004, 853/2004, 854/2004,
  882/2004).** Kompatibel; segel mereferensikan setara dari
  HACCP Paket Higiene dan catatan pemeriksaan-sendiri.
- **Skema standar-privat BRCGS / SQF.** Kompatibel sebagai
  lapisan transparansi aditif.
- **Sistem pengawasan kesehatan-publik (CDC PulseNet,
  FoodNet, IFSAC; UE EFSA / ECDC).** Di luar cakupan untuk
  segel langsung, tetapi FAKTA 06 berkomitmen produsen untuk
  berpartisipasi dan untuk menyegel peristiwa
  korelasi-sinyal apa pun sebagai publikasi MYRIAM baru.

## Apa yang TIDAK digantikan kit ini

- Pendaftaran Fasilitas Pangan FDA atau persetujuan Pendirian
  USDA FSIS.
- Food Safety Plan / HACCP Plan tertulis Anda di bawah FSMA
  / FSIS.
- Log pemantauan CCP dan catatan tindakan-korektif.
- Pengawasan akreditasi lab ISO 17025.
- Program pengujian kemahiran.
- Inspeksi regulator (inspeksi terus-menerus FSIS, inspeksi
  berkala FDA, inspeksi otoritas-kompeten UE).
- Pengawasan kesehatan-publik (CDC, EFSA, ECDC, ekivalen
  nasional).
- Saluran koordinasi recall (FDA Reportable Food Registry,
  koordinasi recall FSIS, RASFF UE, ekivalen nasional).
- Program keamanan-pekerja dan pelatihan pekerja-pangan.

## Mengapa kit ini ada di v0.4.0+

Ini adalah salah satu contoh terkerja yang dikirim dengan
myriam-kit. Kit mengikuti struktur README berdasar-batasan
yang divalidasi oleh autoresearch yang didokumentasikan dalam
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — varian prompt
berdasar-batasan mendapat skor tertinggi pada rubrik berbobot
di seluruh domain contoh, karena atestasi keamanan-pangan
adalah persis domain di mana melebih-lebihkan apa yang
dibuktikan segel berbahaya: orang-orang telah meninggal, akan
meninggal, dalam kegagalan yang tidak dapat dicegah segel.
Bagian pembuka adalah bagian penyangga-beban kit; konten
manifes adalah bagian yang mudah.

Default kit secara sengaja konservatif tentang publikasi
nama-pekerja, konservatif tentang ketepatan lokasi-fasilitas,
konservatif tentang identitas pemasok dan pelanggan, dan
agresif pada disclaimer „ini tidak menetapkan keamanan".
Komunitas keamanan-pangan memiliki sejarah terdokumentasi
bahasa sertifikasi yang dilebih-lebihkan; kit secara default
ke posisi yang paling kecil kemungkinannya untuk dibaca
sebagai jaminan keamanan. Produsen di yurisdiksi di mana
persyaratan pengungkapan-publik spesifik berbeda dapat
mengamandemen fork mereka sesuai, tetapi penolakan default
menyukai keamanan-pekerja dan cakupan-jujur.

## Lisensi

Domain publik (CC0). Fork-kan. Tidak diperlukan atribusi.
