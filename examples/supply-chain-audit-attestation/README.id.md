*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

# Kit Segel Atestasi Audit Rantai Pasok

Contoh myriam-kit siap pakai untuk auditor sosial/ketenagakerjaan/lingkungan
pihak ketiga, tim kepatuhan pemasok internal, investigator rantai pasok
LSM, dan organisasi hak-hak pekerja yang ingin menerbitkan segel audit
yang berlabuh di Bitcoin dan terbukti tahan-pengubahan pada saat
penandatanganan.

---

## Apa yang TIDAK dilakukan kit ini (baca dahulu)

Segel ini adalah cap waktu kriptografis dari apa yang ditandatangani
auditor. Segel ini tidak dapat memverifikasi apakah yang ditandatangani
itu **benar**. Mode kegagalan berikut **berada di luar domain segel**:

1. **Penangkapan audit oleh industri.** Audit yang ditugaskan oleh merek
   memiliki sejarah panjang dan terdokumentasi menghasilkan temuan lunak
   pada pemasok yang kelangsungan bisnisnya dengan merek pemberi tugas
   menjaga aliran pipeline audit. Audit yang tertangkap, ketika disegel,
   menghasilkan catatan forensik permanen dari audit yang tertangkap.
   Segel tidak mengoreksi penangkapan — ia hanya membuat audit-sebagai-
   diterbitkan menjadi tak-berubah, sehingga proses pencarian kebenaran
   kemudian memiliki sesuatu yang konkret untuk dibandingkan.

2. **Pekerja yang dilatih / fasilitas yang dipersiapkan.** Audit yang
   diumumkan atau semi-diumumkan memberi manajemen waktu berhari-hari
   atau berminggu-minggu untuk melatih jawaban pekerja, menyembunyikan
   pekerja di bawah umur, membersihkan asrama, menghapus peralatan
   yang tidak patuh, dan mengalihkan pekerjaan ke subkontraktor yang
   tidak diaudit selama jendela audit. Segel mengaitkan apa yang
   ditunjukkan kepada auditor, bukan apa yang dicegah agar tidak
   mereka lihat.

3. **Subkontrak tersembunyi.** Subkontrak Tingkat-2 dan Tingkat-3,
   pekerjaan rumahan, dan produksi sektor informal secara meluas
   tidak terlihat oleh audit lantai pabrik. Segel mengaitkan audit
   Tingkat-1; ia tidak dapat mendeteksi bahwa Tingkat-1 mengalihdayakan
   ke Tingkat-2 yang tidak diaudit selama jendela audit atau secara
   rutin.

4. **Audit yang secara sistematis melewatkan pelanggaran yang menjadi
   targetnya.** Rana Plaza, runtuhnya pabrik garmen Bangladesh tahun
   2013 yang menewaskan 1.134 pekerja, telah diaudit oleh berbagai
   program audit yang ditugaskan oleh merek dalam beberapa bulan
   sebelumnya. Retakan di bangunan tidak ada dalam daftar periksa
   audit-sosial; rezim audit tidak memiliki ruang lingkup rekayasa-
   struktural. Audit mengaitkan apa yang *dalam ruang lingkup*;
   pelanggaran di luar ruang lingkup tetap tidak terlihat terlepas
   dari seberapa tahan-pengubahan segelnya.

5. **Pembalasan pasca-penandatanganan terhadap pekerja yang
   berpartisipasi dalam wawancara.** Bahkan dengan informasi lokasi
   yang ditolak (FAKTA 07 R3), musuh yang gigih yang mengetahui ID
   pemasok dapat mengidentifikasi fasilitasnya. Perlindungan pekerja
   memerlukan lebih dari sekadar menolak PII dalam segel — ia
   memerlukan anonimisasi di hulu metodologi audit. Segel membuat
   audit-sebagai-diterbitkan tahan lama; ia tidak melindungi
   narasumber wawancara secara retroaktif.

6. **Kondisi pekerja yang sah secara hukum tetapi tidak manusiawi.**
   Kesenjangan upah-layak di yurisdiksi di mana upah minimum hukum
   berada di bawah patokan upah-layak menghasilkan temuan audit "patuh"
   terhadap undang-undang upah-dan-jam-kerja dan temuan "tidak patuh"
   terhadap standar upah-layak dalam audit yang sama (FAKTA 03 elemen
   8 dalam contoh kit ini). Segel mengaitkan apa yang dilaporkan
   setiap standar; merekonsiliasinya adalah pekerjaan kebijakan hilir.

7. **Bahaya iklim / lingkungan dengan kausalitas yang menyebar.**
   Emisi karbon, kontribusi deforestasi, penipisan air, dan pelepasan
   polutan dari pemasok dapat disegel dalam temuan audit, tetapi
   atribusi kausal kepada volume pesanan merek tertentu secara
   metodologis diperdebatkan. Segel mengaitkan apa yang diukur di
   pemasok; ia tidak menugaskan tanggung jawab moral atau hukum.

8. **Perselisihan tentang standar mana yang otoritatif.** SA8000 vs.
   BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. kode-etik
   khusus perusahaan: masing-masing memiliki ruang lingkup,
   tingkat keparahan, dan proses remediasi yang berbeda. Segel
   mengaitkan *satu* audit di bawah *satu* standar. Perbandingan
   lintas-standar adalah masalah hilir.

9. **Kompetensi auditor vs. kredensial auditor.** "Berkredensial"
   bukan "kompeten." Auditor yang telah menyelesaikan program
   pelatihan terakreditasi telah melewatkan pelanggaran berat dalam
   audit yang mendahului bencana yang terlihat secara publik. Segel
   mengaitkan kredensial; ia tidak menyertifikasi kompetensi yang
   digunakan untuk menjalankannya.

**Bagian batas-jujur di atas adalah bagian penyangga-beban dari kit ini.**
Merek yang menginginkan teater legitimasi akan menggunakan audit
tersegel sebagai perisai. Kit harus mengatakan dengan jelas: ini adalah
*primitif non-penyangkalan untuk momen penandatanganan-laporan-audit*,
bukan bukti kepatuhan pemasok atau kesejahteraan pekerja.

---

## Apa yang HARUS DITOLAK kit ini untuk disegel

Kit dikonfigurasi untuk menolak pola fakta berikut bahkan jika pengguna
dengan otoritas badan-audit yang valid mengirimkannya:

- **Identifikasi pekerja individual.** Tidak ada fakta yang boleh
  menyebutkan nama pekerja, menghubungkan kutipan dengan pekerja,
  mengekspos nomor badge, posisi jalur, kamar asrama, jadwal shift,
  kombinasi demografis dengan N<5, atau bidang apa pun yang dapat
  mengidentifikasi-ulang seseorang yang berpartisipasi dalam wawancara.
  Kutipan pekerja menggunakan token acak; pemetaannya tidak pernah
  disegel.
- **Sumber pelapor / informan.** Jika sebuah temuan bertumpu pada
  pengungkapan oleh individu yang mengambil risiko untuk mengungkapkan,
  individu tersebut tidak pernah disebutkan namanya atau diidentifikasi
  dalam publikasi tersegel.
- **Informasi lokasi yang tepat.** Tidak ada alamat jalan, GPS, citra
  satelit resolusi >1km, atau foto bangunan eksternal. Negara dan
  wilayah adalah resolusi maksimum yang disegel. Alasan: identifikasi
  fasilitas memungkinkan pembalasan terhadap peserta wawancara.
- **Klaim sertifikasi audit-bersih.** Kit menolak untuk menyegel
  pembingkaian dalam bentuk "audit ini membuktikan pemasok patuh"
  atau "tidak ada pelanggaran." Klaim kebersihan secara epistemis
  tidak didukung oleh metodologi audit.
- **Substitusi segel-sebagai-sertifikat.** Publikasi yang menghilangkan
  metodologi (FAKTA 04), independensi (FAKTA 06), atau penolakan
  (FAKTA 07) bukan publikasi MYRIAM yang sah di bawah kit ini.
- **Draft / audit pra-penandatanganan.** Penyegelan terjadi pada
  penandatanganan, bukan sebelumnya. Audit provisional menciptakan
  kepastian palsu.
- **Penyegelan ulang yang menguntungkan secara pasca-fakta.** Audit
  yang direvisi memerlukan publikasi tersegel BARU yang merujuk
  pada yang asli dengan akar Merkle. Audit tersegel asli tetap
  terlihat secara permanen sebagai audit-sebagai-diterbitkan.
- **Penyegelan oleh pihak selain badan audit.** Merek, pemasok, badan
  sertifikasi, atau pihak ketiga tidak dapat menyegel "audit"
  menggantikan badan audit yang menandatangani laporan.

Penolakan itu sendiri dapat disegel sebagai fakta ("Pihak ini meminta
penyegelan X; kit menolak sesuai aturan-penolakan Y"), menciptakan
catatan publik tentang upaya penyalahgunaan. **Dalam industri dengan
penangkapan audit yang meluas, penolakan-untuk-menyegel itu sendiri
dapat menjadi sinyal yang bermakna:** badan audit yang tidak akan
menyegel karena merek memberikan tekanan untuk melunakkan temuan
memiliki opsi untuk mencatat penolakan tersebut secara publik di
bawah prinsipalnya sendiri.

---

## Apa yang DISEGEL kit ini

8 fakta pada saat penandatanganan audit:

1. **Pemberitahuan contoh** — menyatakan publikasi sebagai contoh
   (atestasi nyata menghapus atau mengganti ini).
2. **Ruang lingkup dan subjek audit** — standar audit, badan audit,
   auditor utama, ukuran tim-audit, pengenal pemasok (tanpa informasi
   lokasi yang tepat), jendela audit, jenis pengumuman (diumumkan /
   semi-diumumkan / tidak diumumkan), tanggal laporan audit, versi
   penandatanganan, merek penerima yang disebutkan, pihak pemberi
   tugas.
3. **Manifes temuan audit** — kesesuaian per-elemen /
   NC-minor / NC-major / NC-kritis terhadap standar, masing-masing
   dengan SHA-256 dari penulisan-lengkap temuan. Total agregat.
   Rekomendasi sertifikasi pada penandatanganan.
4. **Metodologi dan bukti** — alokasi waktu di lokasi, jumlah
   wawancara (dengan stratifikasi: gender, status migran, masa kerja),
   pemecahan format-wawancara, hubungan interpreter, peninjauan
   dokumen dengan ukuran sampel dan hash konten, artefak kunjungan-
   lokasi (dengan wajah pekerja diburamkan), keterbatasan metodologi
   yang diketahui.
5. **Tindakan korektif yang dikomitmenkan** — CAP per NC-major dan
   per NC-minor dengan akar penyebab yang dinyatakan, tenggat waktu,
   mekanisme verifikasi, komitmen eskalasi, komitmen tanpa-pelonggaran-
   diam.
6. **Kualifikasi dan independensi auditor** — akreditasi badan audit,
   konsentrasi pelanggan, kredensial dan kompetensi bahasa auditor
   utama, pengalaman sektor, deklarasi independensi (pemisahan
   auditor-pemasok, auditor-merek, badan-sertifikasi).
7. **Pengungkapan pendamping dan catatan penolakan** — konflik
   kepentingan (eksplisit), sejarah audit sebelumnya, saluran suara-
   pekerja yang dikomunikasikan, investigasi paralel, perbedaan
   pendapat internal badan audit, daftar aturan-penolakan, penolakan
   yang sebenarnya dipanggil dalam audit ini.
8. **Prinsipal penandatangan** — badan audit, auditor utama, tim audit,
   pejabat yang mengotorisasi, informasi kunci kriptografis.

Setiap fakta diakhiri dengan konvensi gerbang-penolakan: *"Fakta ini
hanya menegaskan X. Ia tidak menegaskan Y"* (di mana Y adalah mode
kegagalan terdekat dari bagian "TIDAK dilakukan").

---

## Apa yang dipertahankan kit ini

- **Pelunakan diam pasca-penandatanganan atas ketidaksesuaian besar.**
  Perubahan apa pun pada FAKTA 03 (mis. MAJOR_NC diklasifikasikan
  ulang sebagai MINOR_NC, atau temuan dihapus sepenuhnya) menghasilkan
  SHA-256 yang berbeda, akar Merkle yang berbeda, gagal verifikasi OTS.
- **Pemberian tanggal mundur pada penutupan tindakan-korektif.** FAKTA
  05 membekukan CAP dan tenggat waktunya pada penandatanganan; klaim
  apa pun "kami menutup NC itu bulan lalu" yang bertentangan dengan
  tenggat waktu yang disegel dapat dibandingkan secara publik.
- **Revisionisme metodologi.** FAKTA 04 membekukan jumlah wawancara,
  ukuran sampel dokumen, dan jam di lokasi pada penandatanganan —
  mencegah pertahanan "kami melakukan investigasi mendalam" yang
  belakangan menjadi tidak-dapat-difalsifikasi.
- **Penerbitan-ulang selektif yang menghilangkan temuan yang tidak
  menguntungkan.** Semua 8 fakta diikat oleh satu akar Merkle;
  mengutip beberapa fakta sambil menghilangkan yang lain dapat
  dideteksi dari daftar daun yang diterbitkan.
- **Pergeseran klaim-independensi.** FAKTA 06 membekukan deklarasi
  independensi pada penandatanganan. Klaim belakangan "audit ini
  independen secara ketat" harus bersaing dengan persentase
  konsentrasi-pelanggan yang disegel dan pengungkapan pemberian-tugas
  yang dibayar-merek yang disegel.
- **Penghapusan catatan penolakan.** FAKTA 07 membekukan pola fakta
  apa yang ditolak kit; klaim belakangan "kami tidak pernah menolak
  apa pun" bertentangan dengan catatan yang disegel.

---

## Kasus historis atau hampir-historis yang akan dibantu kit ini

Kit akan menghasilkan **jangkar forensik** yang berguna — *bukan
perbaikan atau pencegahan* — dalam kasus yang melibatkan:

- **Rana Plaza (Bangladesh, 2013).** Runtuhnya bangunan Rana Plaza
  menewaskan 1.134 pekerja garmen dan melukai ~2.500. Beberapa merek
  yang produknya dibuat di gedung itu telah mengaudit pemasok
  Tingkat-1 di dalam gedung tidak lama sebelum runtuh. Audit
  menggunakan daftar periksa audit-sosial yang tidak mencakup ruang
  lingkup rekayasa-struktural. Fakta metodologi tersegel (FAKTA 04)
  di setiap audit tersebut akan membuat *kesenjangan ruang lingkup*
  terlihat secara publik pada penandatanganan — mengaitkan
  keterbatasan terdokumentasi yang secara retroaktif program audit
  klaim tidak miliki. Segel tidak akan mencegah keruntuhan. Ia akan
  mencegah klaim industri pasca-keruntuhan bahwa "tidak ada yang
  tahu" dari menjadi dapat-dipertahankan secara epistemik.

- **Audit Apple / Foxconn (2010-an).** Beberapa iterasi laporan audit
  fasilitas Foxconn yang memproduksi untuk Apple diterbitkan dengan
  tingkat keparahan temuan yang bervariasi, konteks klaster-bunuh-
  diri-pekerja, dan klaim remediasi. Catatan momen-penandatanganan
  tersegel untuk setiap audit akan mencegah perselisihan belakangan
  tentang "apa yang dikatakan audit pada saat itu" dari bergantung
  pada salinan arsip, salinan yang bocor, atau rilis resmi yang
  direvisi.

- **Kobalt dari DRC (sedang berlangsung).** Penambangan kobalt
  artisanal di Republik Demokratik Kongo, termasuk oleh anak-anak,
  memberi makan ke rantai pasok baterai untuk merek elektronik dan
  EV utama. Beberapa audit yang ditugaskan oleh merek selama periode
  2017–sekarang telah menghasilkan temuan dengan tingkat keparahan
  yang bervariasi. Kit yang diterapkan pada setiap audit pada
  penandatanganan akan mengaitkan audit-sebagai-diterbitkan; kit
  yang diterapkan pada fakta pengungkapan-pendamping (FAKTA 07 C2:
  sejarah audit sebelumnya) akan membuat warisan metodologis dari
  kesenjangan sebelumnya dari setiap auditor berikutnya terlihat
  secara publik.

- **Mineral konflik (timah, tantalum, tungsten, emas dari DRC dan
  wilayah Great Lakes).** Dodd-Frank §1502 menghasilkan kewajiban
  audit-dan-pengungkapan di bawah aturan SEC 13p-1. Perselisihan
  tentang kecukupan audit tingkat-smelter dan verifikasi rantai-
  kustodi hilir berulang selama periode 2014–2022. Segel MYRIAM
  per-audit akan mengaitkan setiap audit smelter pada penandatanganan.

- **Audit yang ditugaskan merek atas rantai pasok kapas Xinjiang
  (2018–sekarang).** Perselisihan tentang apakah audit dapat
  dilakukan secara andal di bawah pembatasan pemerintah RRT
  terhadap akses auditor muncul secara luas setelah 2020. Fakta
  metodologi tersegel (FAKTA 04) di setiap audit akan mengaitkan
  kondisi akses apa yang sebenarnya berlaku — membuat klaim
  belakangan "kami melakukan audit yang ketat" dapat dibandingkan
  dengan kendala metodologi yang disegel pada saat itu.

- **Subkontrak Foxconn dan laporan tanggung-jawab-pemasok Apple
  pada 2010-an — penemuan berulang pekerja di bawah umur, asrama
  tersembunyi, pelanggaran jam kerja.** Segel per-audit akan
  mengaitkan *temuan negatif* dalam audit yang tidak menemukan apa-
  apa, di samping *temuan positif* dalam audit yang menemukan
  pelanggaran — mencegah pemilihan-narasi retrospektif dari kedua
  arah.

Kit TIDAK akan mencegah kasus mana pun di atas. Dalam beberapa kasus,
masalah yang mendasarinya adalah audit *melewatkan* pelanggaran —
menyegel audit bersih yang seharusnya menemukan pelanggaran
menghasilkan catatan permanen audit yang gagal, yang merupakan jenis
kegunaan yang berbeda (ia mengaitkan kegagalan untuk akuntabilitas
nanti) tetapi tidak sama dengan pencegahan.

---

## Kapan menggunakan kit ini

- Anda adalah badan audit yang mengadopsi praktik "publikasikan apa
  yang kami tandatangani" sebagai pertahanan terhadap tekanan
  pelunakan pasca-penandatanganan.
- Anda adalah LSM yang menjalankan investigasi rantai-pasok paralel
  dan menginginkan titik referensi tahan-pengubahan pada saat
  investigasi Anda ditutup.
- Anda adalah organisasi hak-hak pekerja yang telah memperoleh
  laporan audit dan ingin mengaitkan isi saat ini sebelum badan
  audit atau merek memiliki kesempatan untuk merevisinya.
- Anda adalah merek yang berkomitmen pada transparansi tentang audit
  yang telah Anda tugaskan, dan Anda menginginkan catatan forensik
  yang dapat diverifikasi.
- Anda adalah jurnalis, regulator, atau pengadilan yang mengaitkan
  isi audit tertentu pada momen tertentu untuk litigasi atau
  pelaporan nanti.

## Kapan TIDAK menggunakan kit ini

- **Jangan gunakan sebagai pengganti pemantauan yang dipimpin pekerja,
  investigasi LSM independen, atau pengorganisasian pekerja.** Kit
  bersifat *aditif*, bukan pengganti untuk salah satu dari itu.
- **Jangan gunakan untuk mengklaim pemasok itu patuh.** Audit
  tersegel yang bersih paling banter adalah satu masukan untuk
  penilaian kepatuhan. Memperlakukan audit tersegel sebagai
  sertifikat kepatuhan persis adalah teater legitimasi yang ada
  untuk dicegah oleh aturan penolakan kendala-pertama.
- **Jangan gunakan di tengah-tengah audit.** Penyegelan sebelum
  penandatanganan menciptakan catatan positif-palsu "ini adalah
  laporan audit final".
- **Jangan gunakan untuk menyegel draft yang ingin Anda revisi.**
  Setiap versi penandatanganan mendapatkan segelnya sendiri; revisi
  merujuk pada yang asli dengan akar Merkle.
- **Jangan gunakan di bawah tekanan untuk menyegel lebih awal
  daripada penandatanganan, atau untuk menghilangkan pengungkapan
  fakta-pendamping.** Tolak, dan (jika prinsipal Anda mengizinkan)
  segel penolakan.
- **Jangan gunakan sebagai dasar untuk klaim pemasaran "perdagangan
  yang adil" atau "sumber etis" tanpa mengungkapkan batas metodologi
  tersegel di samping segel.** Mengutip segel tanpa mengutip batas
  adalah mode kegagalan teater-legitimasi yang mendefinisikan
  penangkapan audit.
- **Jangan gunakan jika badan audit Anda tertangkap secara struktural
  dan tidak dapat menerbitkan temuan terhadap kepentingan komersial
  merek pemberi tugas.** Dalam hal itu, penyegelan menghasilkan
  catatan publik permanen dari audit yang tertangkap. Itu mungkin
  masih berharga — tetapi tidak sama dengan bertahan terhadap
  penangkapan.

---

## Cara membuat fork kit ini untuk audit nyata

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Waktu kritis:** segel PADA momen penandatanganan — yaitu, ketika
auditor utama menandatangani laporan final dan menjadi posisi resmi
badan audit. Segel sebelum penandatanganan menciptakan catatan
positif-palsu "ini adalah audit final". Segel jauh setelah
penandatanganan secara forensik lebih lemah terhadap modifikasi yang
mengintervensi.

---

## Integrasi dengan infrastruktur audit rantai-pasok yang ada

Kit dirancang untuk dikomposisikan dengan, bukan menggantikan:

- **SA8000 (Social Accountability International).** Laporan audit
  SA8000 dan dokumen CAP secara alami dipetakan ke FAKTA 03 + FAKTA
  05. Referensi akreditasi SAAS cocok dengan FAKTA 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Temuan audit RBA dipetakan ke FAKTA 03; aturan
  independensi firma-audit RBA dipetakan ke FAKTA 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Temuan audit 2-pilar
  dan 4-pilar SMETA dipetakan ke FAKTA 03; platform Sedex menjadi
  tuan rumah laporan mentah — segel MYRIAM mengaitkan hash konten
  laporan yang dihosting platform.
- **amfori BSCI.** Mekanika peringkat BSCI A–E dipetakan ke
  rekomendasi sertifikasi FAKTA 03; pemberian-tugas keanggotaan
  merek dipetakan ke pengungkapan konsentrasi-pelanggan FAKTA 06
  dan FAKTA 07 C1.
- **Rantai kustodi FSC.** Untuk rantai pasok produk hutan, sertifikat
  rantai kustodi dan jadwal audit-ulang sesuai dengan struktur
  jendela-audit dan CAP.
- **Penilaian dampak B Lab / B Corp.** Sertifikasi B Corp bukan audit
  pihak ketiga dalam pengertian SA8000, tetapi laporan verifikator
  penilaian dampak dapat disegel di bawah kit ini (dengan fakta
  yang dilingkupi-ulang ke penilaian-dampak daripada audit
  ketenagakerjaan).
- **ISO 26000.** ISO 26000 adalah panduan, tidak dapat disertifikasi;
  kit tidak memiliki integrasi laporan-audit ISO 26000 langsung
  tetapi taksonomi tanggung-jawab-sosial dapat menginformasikan
  struktur elemen FAKTA 03 untuk audit internal.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  rezim sektor-industri lainnya).** Program audit khusus-sektor
  dapat disegel di bawah kit ini; bidang standar-audit FAKTA 02
  mengidentifikasi yang mana.
- **Fair Labor Association.** Laporan pemantauan-pabrik FLA
  dipetakan ke FAKTA 03 + FAKTA 05; kerangka monitor-independen
  FLA dipetakan ke deklarasi independensi FAKTA 06.
- **Indeks Higg (Sustainable Apparel Coalition).** Output Higg FEM
  (Facility Environmental Module) dan Higg FSLM (Facility Social &
  Labor Module) tingkat-fasilitas dapat disegel di bawah kit ini.
- **EU CSRD / CSDDD.** Corporate Sustainability Reporting Directive
  dan Corporate Sustainability Due Diligence Directive UE
  menciptakan kewajiban pengungkapan yang dokumen verifikasinya
  dapat disegel di bawah kit ini. Kit mengaitkan pengungkapan-
  sebagai-diterbitkan, bukan kecukupan substantifnya.

## Apa yang TIDAK digantikan kit ini

- Pemantauan yang dipimpin pekerja (sinyal deteksi pelanggaran
  paling andal dalam rantai pasok apa pun)
- Investigasi LSM independen (CCC, Labour Behind the Label, China
  Labour Bulletin, Workers' Rights Consortium, dll.)
- Inspeksi regulasi (biro tenaga kerja nasional, setara OSHA,
  program Kantor Negara ILO)
- Pengorganisasian pekerja dan tawar-menawar kolektif
- Litigasi, arbitrase, dan remediasi di bawah hukum tenaga kerja
  domestik
- Kerangka uji-tuntas sisi-merek (UNGP, OECD Due Diligence
  Guidance, EU CSDDD)

## Lisensi

Domain publik (CC0). Buat fork. Tidak diperlukan atribusi.
