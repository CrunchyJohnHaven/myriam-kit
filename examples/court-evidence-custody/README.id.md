*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

# Kit Segel Rantai Pengawasan Barang Bukti Pengadilan

Sebuah contoh myriam-kit siap pakai untuk tim akuisisi forensik —
pemeriksa forensik komputer, teknisi ekstraksi perangkat seluler,
kustodian barang bukti kamera badan, supervisor laboratorium — yang
ingin mempublikasikan segel berjangkar Bitcoin, tahan-pemalsuan tentang
*byte mana yang diakuisisi* dan *kapan*, pada saat akuisisi barang
bukti digital, sehingga sengketa rantai pengawasan memiliki jangkar
publik.

---

## Apa yang TIDAK dilakukan kit ini (baca dahulu)

Segel adalah cap waktu kriptografis tentang CITRA FORENSIK MANA yang
diakuisisi, KAPAN diakuisisi, oleh INSTANSI MANA, di bawah SURAT
PERINTAH MANA, dan melalui METODOLOGI MANA. Segel tidak dapat menjawab
pertanyaan tentang kasus di luar itu. Hal-hal berikut **berada di luar
domain segel**:

1. **Penerimaan di bawah Federal Rules of Evidence (atau kode bukti
   lainnya).** Segel menjangkarkan byte dan cap waktu. Apakah bukti
   dapat diterima — di bawah autentikasi FRE 901, kesaksian ahli
   FRE 702 / Daubert, penyeimbangan prasangka FRE 403, atau padanan
   pengadilan negara bagian mana pun — adalah pertanyaan prosedur
   hukum. Akuisisi yang disegel dengan sempurna pun masih dapat
   diputuskan tidak dapat diterima; akuisisi tanpa segel pun masih
   dapat diterima. Segel adalah bukti integritas tambahan, bukan
   pengganti putusan penerimaan pengadilan.

2. **Apakah penyitaan itu sah.** Kepatuhan terhadap Amandemen
   Keempat, validitas surat perintah, kepatuhan terhadap cakupan,
   penerapan aturan pengecualian — semua ini berada di hulu dari
   segel. Segel mencatat bahwa akuisisi terjadi di bawah surat
   perintah FICT-SW-2026-0188; apakah surat perintah itu diterbitkan
   dan dijalankan secara sah adalah urusan pengadilan.

3. **Apakah bukti memberatkan, meringankan, atau netral.** Segel
   menjangkarkan hash; interpretasi tentang apa yang dikandung hash
   tersebut termasuk dalam laporan pemeriksaan forensik, yang
   merupakan dokumen tersendiri dengan rezim discovery dan
   pembuktiannya sendiri. Segel akan menolak menyegel "FAKTA N:
   laptop tersangka mengandung materi yang memberatkan" — lihat
   aturan penolakan R4.

4. **Apakah rantai pengawasan benar secara prosedural di bawah hukum
   bukti negara bagian yang berlaku.** Segel mencatat catatan
   peristiwa pengawasan kontemporer instansi (FAKTA 05). Apakah
   catatan tersebut memenuhi persyaratan rantai pengawasan negara
   bagian tertentu adalah urusan pengadilan pada sidang pembuktian.

5. **Apakah metodologi forensik dapat diandalkan.** Daubert dan
   turunannya (dan padanan tingkat negara bagian seperti Frye, di
   mana masih berlaku) menilai keandalan metodologis. Segel mencatat
   alat dan versi MANA yang digunakan (FAKTA 04); apakah alat-alat
   tersebut memenuhi standar keandalan pengadilan tertentu adalah
   urusan pengadilan. Bug alat telah didokumentasikan pasca-akuisisi
   dalam kasus-kasus terdahulu; peran segel adalah membuat catatan
   versi-dan-hash-biner dapat dibantah secara publik, bukan
   menjamin alat-alat itu sendiri.

6. **Apakah bukti dirusak SEBELUM akuisisi.** Segel menjangkarkan
   byte sejak momen imaging dan seterusnya. Jika tersangka, petugas,
   atau pihak ketiga mengubah perangkat sumber sebelum diimaging,
   segel tidak dapat mendeteksinya — segel akan menyegel byte yang
   telah diubah dengan integritas yang sama seperti yang akan
   diberikannya pada yang asli. Nilai segel dimulai pada cap waktu
   imaging.

7. **Apakah cakupan surat perintah dihormati.** Lampiran surat
   perintah mendefinisikan apa yang boleh diakuisisi; segel mencatat
   apa yang TELAH diakuisisi. Apakah akuisisi melampaui cakupan
   surat perintah, sekali lagi, adalah pertanyaan hukum dengan
   pemulihannya sendiri (mosi penindasan di bawah prosedur negara
   bagian yang sesuai).

8. **Mengidentifikasi ulang pihak privat mana pun dalam penyelidikan.**
   Segel menolak mempublikasikan nama, pengenal, atau sidik jari apa
   pun yang dapat mengidentifikasi ulang tersangka, terdakwa, korban,
   saksi, atau penghuni tempat. Referensi nomor perkara adalah
   pegangan yang sesuai untuk pihak-pihak dengan legal standing
   untuk menemukan kasus.

**Bagian batasan jujur di atas adalah bagian yang menanggung beban
dalam kit ini.** Tim forensik yang percaya bahwa menyegel sama
dengan dapat diterima akan menggunakannya sebagai perisai. Kit harus
menyatakan dengan jelas: *ini adalah primitif non-repudiasi untuk
momen akuisisi, bukan bukti akuisisi yang sah, kekokohan metodologis,
atau rantai pengawasan yang diakui pengadilan.*

---

## Apa yang HARUS DITOLAK kit ini untuk disegel

Kit dikonfigurasikan untuk menolak pola fakta berikut bahkan jika
pengguna dengan wewenang penandatanganan instansi yang sah
mengajukannya:

- **Identifikasi pribadi tersangka, terdakwa, korban, saksi, atau
  pihak ketiga pribadi mana pun.** Referensi nomor perkara adalah
  pegangan bagi pihak-pihak yang memiliki legal standing; segel
  publik tidak boleh menjadi indeks identifikasi-ulang.
- **Nama pribadi pemeriksa forensik atau staf instansi lainnya
  dalam segel publik.** Peran bersifat publik; pengikatan
  orang-ke-peran disegel secara terpisah dan dapat ditemukan di
  bawah proses pengadilan.
- **Hash tingkat-file (atau sidik jari) dari dugaan materi
  pelecehan seksual anak, template biometrik, atau data yang
  mengidentifikasi-ulang orang rentan — bahkan dengan hash.**
  SHA-256 dari sebuah file individu adalah pengenal yang dapat
  dicari secara permanen; mempublikasikannya pada ledger publik
  dapat memviktimisasi ulang subjek melalui korelasi dengan basis
  data privat. Hash tingkat-citra (forensic-image-level) dari disk
  penuh dapat diterima; hash tingkat-file dari materi semacam itu
  TIDAK PERNAH dapat diterima.
- **Temuan pemeriksaan, interpretasi, pendapat, atau kesimpulan
  tentang arti byte tersebut.** Segel menjangkarkan APA BYTE yang
  diakuisisi dan KAPAN. Interpretasi termasuk dalam laporan
  pemeriksaan yang dapat ditemukan, bukan pada ledger publik
  tahan-pemalsuan.
- **Klaim penerimaan atau kesimpulan hukum lainnya** ("bukti ini
  dapat diterima," "surat perintah itu sah," "rantai pengawasan
  benar di bawah §X.Y"). Kesimpulan hukum adalah fungsi pengadilan.
- **Penyegelan oleh siapa pun selain pejabat penandatangan yang
  berwenang dari instansi pengakuisisi.** Seorang ahli pembelaan
  dapat menggunakan kit untuk menyegel verifikasi independen mereka
  sendiri atas manifes; mereka tidak boleh menyegel akuisisi ASLI
  atas nama instansi pengakuisisi.
- **Pengikatan peran-ke-individu di dalam segel publik.**
  Pengikatan disegel dalam catatan pendamping terpisah (di-hash
  dalam FAKTA 05) di bawah kontrol akses instansi.
- **Fakta investigasi pra-penyitaan atau pra-surat perintah.**
  Pernyataan informan, pengawasan pra-surat perintah, masukan
  konstruksi paralel — tidak satu pun dari ini termasuk pada segel
  akuisisi. Segel terbatas pada peristiwa akuisisi.

Penolakan itu sendiri dapat disegel sebagai fakta ("Instansi ini
meminta penyegelan X; kit menolak sesuai aturan penolakan Y"),
menciptakan catatan publik atas upaya penyalahgunaan.

---

## Apa yang DISEGEL kit ini

8 fakta pada saat akuisisi:

1. **Pemberitahuan contoh** — menyatakan bahwa publikasi adalah
   sebuah contoh (atestasi nyata menghapus atau menggantinya).
2. **Konteks akuisisi** — pengenal perkara, kutipan surat perintah,
   instansi pengakuisisi, otoritas pemohon, tanggal/waktu penyitaan
   dan akuisisi, lokasi akuisisi (lokasi penyitaan diredaksi ke
   catatan pendamping yang disegel terpisah untuk menghindari
   identifikasi-ulang tempat).
3. **Manifes bukti** — per forensic-image-item: hash SHA-256, ukuran
   file, pengenal perangkat-sumber yang dianonimkan, metode
   akuisisi, format citra forensik.
4. **Metodologi akuisisi** — nama alat forensik dan versi tepat
   (dengan hash biner alat), make/model write-blocker dan firmware,
   referensi verifikasi NIST CFTT, prosedur verifikasi yang
   digunakan, pilihan format citra.
5. **Catatan rantai pengawasan** — timeline per-peristiwa dari
   penyitaan awal hingga akhir imaging, kustodian diidentifikasi
   dengan PERAN (bukan dengan nama), dengan hash dari catatan
   pendamping yang disegel terpisah (pengikatan peran-ke-individu,
   catatan GPS transportasi, catatan akses loker bukti, foto segel
   anti-rusak, dll.).
6. **Kualifikasi pemeriksa berdasarkan peran** — sertifikasi yang
   dimiliki, status pendidikan berkelanjutan, jumlah pengalaman
   saksi ahli sebelumnya, paparan Daubert, pengungkapan konflik
   kepentingan — semua tingkat-peran, bukan pribadi.
7. **Pengungkapan pendamping dan catatan penolakan** — investigasi
   paralel, tantangan surat perintah yang tertunda, mosi
   pengeluaran bukti, protokol filter-keistimewaan / taint-team
   yang berlaku, upaya akuisisi sebelumnya, ulasan pelacak bug
   vendor; daftar eksplisit pola yang ditolak kit untuk disegel.
8. **Pejabat penandatangan** — identifikasi instansi pengakuisisi +
   penandatangan tingkat-peran (pemeriksa utama) + co-signatory
   tingkat-peran (supervisor unit) + informasi kunci kriptografis.

Setiap fakta diakhiri dengan konvensi refusal-gate: *"Fakta ini hanya
menegaskan X. Fakta ini tidak menegaskan Y"* (di mana Y adalah mode
kegagalan terdekat dari bagian "DOES NOT do" di atas).

---

## Apa yang dilawan kit ini

- **Perubahan diam-diam pasca-akuisisi pada citra forensik.**
  Perubahan tingkat-byte apa pun pada citra mana pun menghasilkan
  SHA-256 berbeda, dan citra pasca-perubahan tidak akan
  diverifikasi terhadap manifes FAKTA 03 yang disegel.
- **Klaim bahwa "alat berbeda digunakan."** FAKTA 04 mencatat versi
  alat tepat dengan hash biner alat; klaim "kami sebenarnya
  menggunakan v4.7.0, bukan v4.7.1" di kemudian hari dapat
  dibantah secara publik.
- **Klaim bahwa write-blocker tidak aktif, atau menggunakan model
  berbeda.** FAKTA 04 membekukan manifes write-blocker.
- **Perubahan catatan pengawasan.** Perubahan apa pun pada timeline
  peristiwa pengawasan FAKTA 05 (menambahkan, menghapus, atau
  meng-ulang-cap-waktu peristiwa) mengubah hash FAKTA 05 dan dapat
  dideteksi secara publik.
- **Penggantian kredensial pemeriksa lain.** FAKTA 06 membekukan
  profil kredensial tingkat-peran pada waktu akuisisi.
- **Kelalaian selektif pengungkapan pendamping.** FAKTA 07
  menyebutkan kategori pengungkapan yang diharapkan; kategori
  kosong harus diatestasikan secara eksplisit ("tidak ada pada
  waktu akuisisi"), sehingga "kami tidak menyadari hal itu
  relevan" di kemudian hari dapat dibantah secara publik.
- **Klaim pasca-akuisisi bahwa pemeriksa memiliki konflik yang
  tidak diungkapkan.** Pengungkapan konflik FAKTA 06 dibekukan pada
  saat akuisisi; tantangan di kemudian hari dapat diuji terhadapnya.

Kit **tidak** melawan korupsi kontemporer — tim yang dengan sengaja
menyegel metadata palsu pada waktu akuisisi menghasilkan segel yang
valid secara kriptografis atas metadata palsu. Primitif jujur tentang
itu: ini adalah primitif non-repudiasi untuk klaim instansi yang
kontemporer, bukan bukti bahwa klaim tersebut benar.

---

## Kasus historis atau hampir-historis yang akan dibantu kit ini

Kit akan menghasilkan jangkar yang berguna — *bukan penyelesaian* —
dalam kasus-kasus lampau di mana rantai pengawasan bukti digital
menjadi isu pembuktian yang dipersengketakan. Untuk menghindari
menyebut nama terdakwa (yang merupakan pihak privat bahkan ketika
divonis), ini dijelaskan berdasarkan jenis kasus, bukan oleh individu
yang dinamai:

- **Kontroversi bug alat forensik federal pertengahan 2010-an** di
  mana sebuah alat imaging forensik yang banyak digunakan
  ditemukan, pasca-akuisisi, memiliki bug edge-case yang
  memengaruhi jenis media-sumber tertentu. Manifes akuisisi yang
  disegel dengan data versi-dan-hash-biner-alat yang dibekukan
  akan memungkinkan pembelaan dan penuntutan menyepakati versi
  mana yang tepat digunakan, menghilangkan satu sumbu sengketa.

- **Banyak kasus negara bagian yang melibatkan keluaran ekstraksi
  perangkat seluler yang disengketakan**, di mana vendor alat
  ekstraksi kemudian merilis tambalan perbaikan bug dan
  pertanyaan menjadi "apakah bug memengaruhi kasus ini." Fakta
  metodologi yang disegel memungkinkan pertanyaan dijawab terhadap
  data versi yang dibekukan, bukan terhadap ingatan instansi saat
  ini tentang versi mana yang digunakan.

- **Sengketa serah-terima kamera badan** dalam kasus-kasus di mana
  sistem docking vendor BWC kemudian dituduh memungkinkan
  modifikasi rekaman saat transit. Manifes yang disegel atas
  arsip kamera badan pada saat penerimaan instansi menjangkarkan
  byte mana yang diterima instansi dari sistem docking;
  pengeditan di kemudian hari di sisi instansi dapat dideteksi
  secara publik.

- **Kontroversi tabrakan hash dalam kasus forensik komputer**, di
  mana ahli pembelaan berargumen bahwa MD5 (masih digunakan dalam
  beberapa alur kerja warisan) tidak memadai. Akuisisi yang
  disegel yang mencatat MD5 DAN SHA-256 memungkinkan SHA-256 tetap
  berdiri bahkan jika MD5 didiskreditkan.

- **Sengketa atas evolusi metodologi pemeriksaan antara akuisisi
  dan persidangan.** Ketika kasus berada di antara akuisisi dan
  persidangan selama bertahun-tahun, metodologi yang standar pada
  saat akuisisi mungkin telah digantikan pada waktu persidangan.
  Catatan yang disegel memungkinkan pengadilan mengevaluasi
  metodologi terhadap standar yang berlaku pada saat akuisisi,
  bukan terhadap standar yang lebih baru.

Kit TIDAK akan menyelesaikan sengketa mendasar tentang kesalahan
atau ketidakbersalahan dalam salah satu jenis kasus ini. Kit akan
menyelesaikan satu sub-sengketa pembuktian spesifik: apakah byte,
alat, dan prosedur seperti yang diklaim instansi pada saat yang
diklaim instansi.

---

## Kapan menggunakan kit ini

- Instansi Anda memiliki SOP forensik yang stabil dan ingin
  menambahkan atestasi publik berjangkar Bitcoin sebagai lapisan
  tahan-pemalsuan di atas rantai pengawasan kertas-dan-tanda-tangan
  yang sudah ada.
- Anda mengharapkan kasus ini melibatkan tantangan pembelaan yang
  signifikan terhadap bukti forensik (kasus berisiko tinggi,
  metodologi baru, versi alat yang dipersengketakan, dll.).
- Anda dapat mempublikasikan rangkaian fakta yang terdaftar tanpa
  mengungkap PII atau data yang mengidentifikasi-ulang orang
  rentan. (Aturan penolakan kit menegakkan ini; jika fakta Anda
  memerlukan pelanggaran aturan penolakan, jangan gunakan kit.)
- Penasihat umum instansi pengakuisisi dan kantor jaksa telah
  meninjau rencana publikasi. Publikasi publik dari artefak yang
  membawa pengenal kasus memiliki implikasi untuk investigasi yang
  sedang berlangsung; tinjauan penasihat tidak opsional.
- Aturan discovery pembelaan yurisdiksi Anda kompatibel dengan
  instansi yang menyimpan secara terpisah catatan pengikatan
  peran-ke-individu (di-hash dalam FAKTA 05). Jika yurisdiksi Anda
  memerlukan pengungkapan nama pemeriksa publik, Anda harus
  mengubah kit sesuai dengan itu.

## Kapan TIDAK menggunakan kit ini

- **Jangan gunakan sebagai pengganti dokumentasi rantai pengawasan
  instansi yang sudah ada.** Kit ini *tambahan*, bukan pengganti.
  CMS instansi, catatan pengawasan, dan kewajiban produksi
  discovery tidak berubah.
- **Jangan gunakan jika akuisisi melibatkan CSAM, template
  biometrik, atau data yang mengidentifikasi-ulang orang rentan
  lainnya pada tingkat-file.** Hash tingkat-citra dari disk penuh
  dapat diterima; hash tingkat-file dari materi semacam itu TIDAK
  PERNAH dapat diterima, bahkan di bawah pengesampingan aturan
  penolakan. Jika Anda tidak dapat membuat rangkaian fakta tanpa
  melanggar R3, jangan gunakan kit.
- **Jangan gunakan untuk mengklaim surat perintah itu sah,
  penyitaan itu benar, atau bukti dapat diterima** — kit tidak
  dapat melakukan itu, dan aturan penolakan R5 akan menolak
  klaim semacam itu.
- **Jangan gunakan di bawah tekanan untuk menyegel sebelum akuisisi
  selesai.** Segel akuisisi parsial merepresentasikan keadaan
  secara keliru.
- **Jangan gunakan untuk mempublikasikan nama pribadi pemeriksa**
  kecuali yurisdiksi Anda secara khusus memerlukannya dan
  pemeriksa Anda telah menyetujui secara individual. Default
  adalah publikasi tingkat-peran.
- **Jangan gunakan dalam kasus yang disegel atau di bawah segel**
  tanpa izin pengadilan yang eksplisit. Mempublikasikan pengenal
  kasus pada Bitcoin tidak dapat dibalikkan; jika kasus kemudian
  disegel, segel publik tidak dapat ditarik. Kit hanya untuk
  akuisisi catatan publik.
- **Jangan gunakan sebagai teater legitimasi.** Segel atas akuisisi
  yang cacat adalah catatan publik permanen atas cacat tersebut,
  bukan pembelaan terhadapnya. Primitif memotong dua arah; itulah
  kejujurannya.

## Cara mem-fork kit ini untuk akuisisi nyata

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Waktu kritis:** segel PADA atau tepat setelah berakhirnya imaging
(peristiwa E17 FAKTA 05 dalam timeline contoh). Segel selama imaging
menciptakan catatan akuisisi parsial; segel yang jauh kemudian
menciptakan celah selama instansi dapat mengubah citra. Jendela yang
tepat segera setelah verifikasi citra selesai untuk item terakhir
dalam rangkaian barang bukti.

**Tinjauan kritis:** sebelum menyegel, jalankan publikasi melalui
pemeriksa forensik kedua (bukan yang utama) dan melalui penasihat
instansi. Setelah disegel, publikasi bersifat permanen.

## Integrasi dengan infrastruktur rantai pengawasan yang sudah ada

- **Sistem Manajemen Kasus Instansi (CMS).** CMS tetap merupakan
  sistem pencatatan utama instansi. Segel tidak menggantikan CMS;
  segel berkomitmen pada byte dan metodologi yang dicatat CMS,
  sehingga pengeditan CMS post-hoc dapat dideteksi secara publik.
- **Federal Rules of Evidence / Daubert / kode bukti negara
  bagian.** Segel berkontribusi pada catatan autentikasi FRE 901
  dengan menyediakan integritas tahan-pemalsuan. Segel TIDAK
  memuaskan FRE 702 / Daubert dengan sendirinya; keandalan
  metodologi masih diuji pada sidang pembuktian.
- **Discovery pembelaan (FRCP 16, Brady, Giglio, dan padanan
  negara bagian).** Catatan pendamping yang di-hash dalam FAKTA 05
  (pengikatan peran-ke-individu, catatan pengawasan, foto segel
  anti-rusak, dll.) tetap tunduk pada discovery normal. Segel
  menjangkarkan apa yang diklaim catatan-catatan tersebut pada
  saat akuisisi, sehingga klaim "catatan itu berbeda pada waktu
  itu" di kemudian hari dapat dibantah secara publik.
- **NIST Computer Forensics Tool Testing (CFTT).** Kit mereferensi
  catatan verifikasi CFTT dalam FAKTA 04 / FAKTA 05; referensinya
  adalah hash, bukan catatan itu sendiri, sehingga proses CFTT
  tidak terpengaruh.
- **Pihak netral yang ditunjuk pengadilan dan ahli pembelaan.**
  Salah satu dapat mem-hash-ulang citra forensik yang mereka
  terima dalam discovery terhadap manifes FAKTA 03, secara
  independen dari kerja sama instansi mana pun. Ini adalah
  nilai-tambah utama kit untuk sisi pembelaan.
- **Tinjauan banding.** Bertahun-tahun kemudian, peninjau forensik
  banding dapat memverifikasi metodologi akuisisi asli terhadap
  catatan FAKTA 04 yang disegel, daripada terhadap ingatan
  instansi saat ini yang mungkin telah berevolusi.

## Apa yang TIDAK digantikan kit ini

- Federal Rules of Evidence (atau kode bukti negara bagian mana
  pun).
- Standar keandalan Daubert / Frye untuk kesaksian ahli.
- SOP forensik dan CMS instansi.
- Kewajiban discovery pembelaan di bawah FRCP 16 / Brady / Giglio /
  padanan negara bagian.
- Perintah pengadilan, mosi penindasan, sidang pembuktian, atau
  proses lain yang dikelola pengadilan.
- NIST CFTT atau rezim pengujian alat lainnya.
- Protokol filter-keistimewaan / taint-team instansi.

## Mengapa kit ini ada di v0.4.0+

Ini adalah contoh kerja kedelapan yang dikirimkan dengan myriam-kit.
Kit mengikuti struktur constraint-first yang divalidasi oleh
autoresearch yang didokumentasikan dalam
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — varian prompt constraint-first
mendapat skor tertinggi pada rubrik berbobot di berbagai domain
contoh. Bagian pembuka adalah bagian yang menanggung beban dalam kit;
isi manifes adalah bagian yang mudah.

Desain kit secara sengaja konservatif terhadap publikasi nama
pemeriksa dan agresif terhadap penafian "ini tidak menetapkan
penerimaan." Komunitas forensik memiliki sejarah terdokumentasi
diserang atas pekerjaan forensik mereka; kit menetapkan default ke
posisi yang lebih aman bagi pemeriksa. Instansi di yurisdiksi di mana
penamaan pribadi publik diwajibkan dapat memodifikasi fork mereka
sesuai dengan itu, tetapi penolakan default memihak keamanan
pemeriksa.

## License

Public domain (CC0). Fork it. No attribution required.
