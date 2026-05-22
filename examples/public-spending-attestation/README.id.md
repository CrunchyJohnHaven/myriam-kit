# Kit Segel Atestasi Belanja Publik

*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

Contoh myriam-kit siap pakai bagi pemerintah kota, negara bagian,
provinsi, dan nasional yang ingin menambatkan secara kriptografis
catatan eksekusi anggaran (pemberian kontrak, pencairan, penerimaan
hasil) pada saat penerbitan, sehingga modifikasi senyap retroaktif
catatan belanja publik menjadi dapat dideteksi publik.

Segel adalah **jangkar forensik**, bukan sertifikasi integritas. Ia
mencatat apa yang dilaporkan oleh otoritas keuangan pada hari
dilaporkan, dalam bentuk yang tidak dapat direvisi secara senyap di
kemudian hari tanpa menghasilkan ketidaksesuaian kriptografis yang
terlihat publik.

---

## Apa yang TIDAK dilakukan kit ini (baca dahulu)

Segel adalah stempel waktu kriptografis dari apa yang diatestasi. Ia
tidak dapat memverifikasi apakah yang diatestasi itu **sah, adil, atau
jujur**. Mode kegagalan berikut **berada di luar domain segel**:

1. **Korupsi hulu dan suap.** Jika pengadaan dimanipulasi, vendor
   dipilih karena suap, justifikasi sumber tunggal direkayasa, atau
   kontrak digelembungkan dengan persentase suap yang disepakati —
   segel menambatkan transaksi sebagaimana tercatat dengan harga
   yang digelembungkan dan vendor yang disukai pada integritas
   tinggi. Segel mengamati keluaran sistem keuangan; ia tidak
   memiliki visibilitas ke korupsi hulu dari penerbitan. *Operação
   Lava Jato* Brasil mendokumentasikan suap ~3% yang dikelola
   kartel secara sistematis di ribuan kontrak Petrobras yang akan
   disegel pada penerbitan seolah-olah seluruhnya rutin.

2. **Penyembunyian kepemilikan manfaat oleh perusahaan cangkang.**
   Kontrak yang diberikan kepada "Acme Construction Ltd." disegel
   dengan nama entitas pada registri publik. Jika "Acme"
   sebenarnya dikendalikan oleh orang yang diekspos secara politik
   yang tidak diungkapkan, atau merupakan salah satu dari puluhan
   perusahaan cangkang yang dikendalikan oleh satu kartel, segel
   menambatkan entitas permukaan. Transparansi kepemilikan manfaat
   adalah rezim TERPISAH (Rekomendasi FATF 24, EU 5AMLD/6AMLD, US
   Corporate Transparency Act) yang keluarannya memerlukan
   protokol penyegelan sendiri.

3. **Penipuan akuntansi hulu dari penerbitan.** Jika otoritas
   keuangan sendiri merekayasa catatan sebelum disegel — kontrak
   hantu, karyawan hantu pada daftar gaji, penerimaan hasil fiktif
   — segel menambatkan rekayasa. Segel tidak dapat mendeteksi
   bahwa catatan itu palsu pada saat dicatat; ia hanya dapat
   mendeteksi bahwa catatan telah diubah SETELAH penyegelan.

4. **Publikasi selektif / cherry-picking.** Otoritas keuangan dapat
   menerbitkan *subset* transaksi — yang bersih — dan menyegel
   hanya itu. Segel menambatkan apa yang ada dalam publikasi; ia
   tidak menambatkan jagat transaksi yang seharusnya ada dalam
   publikasi. FACT 07 kit ini (pengungkapan pendamping dan catatan
   penolakan) adalah pertahanan struktural, tetapi bergantung pada
   otoritas penerbit yang jujur tentang apa yang dipilihnya untuk
   tidak disegel.

5. **Belanja di luar buku atau di luar anggaran.** Pengeluaran
   publik yang disalurkan melalui perusahaan milik negara, dana
   kekayaan negara, kendaraan tujuan khusus, atau rekening
   perwalian di luar anggaran mungkin tidak muncul dalam anggaran
   yang ditambatkan segel. Segel mencatat apa yang dilaporkan di
   dalam sistem anggaran; pengeluaran di luar sistem berada di luar
   domain segel. Sengketa Otoritas Koalisi Sementara Irak (CPA)
   2003–2004 melibatkan sekitar USD 9 miliar pencairan tunai yang
   catatannya sebagian hilang; menyegel catatan yang ada pada saat
   pencairan akan menambatkannya, tetapi tidak akan menciptakan
   catatan yang tidak dipelihara oleh CPA.

6. **Tekanan "penjelasan" pasca-penerbitan.** Pembengkakan yang
   disegel, sumber tunggal yang disegel, atau perintah perubahan
   yang disegel dapat dinarasikan kembali kemudian dengan
   pembingkaian apa pun yang diinginkan otoritas politik. Segel
   menambatkan FAKTA pada tanggal penerbitan, tetapi tidak
   memprasangka narasi yang nantinya akan didukung fakta-fakta
   tersebut.

7. **Atestasi yang dipaksakan.** Jika prinsipal keuangan yang
   bertanggung jawab dipaksa menandatangani atestasi yang
   memutarbalikkan transaksi, segel menambatkan atestasi yang
   dipaksakan dengan tanda tangan yang dipaksakan. Segel
   memverifikasi SIAPA yang menandatangani (FACT 08), bukan
   MENGAPA mereka menandatangani. Menyegel atestasi yang dipaksakan
   menghasilkan catatan publik permanen dari keluaran yang
   dipaksakan — berguna untuk akuntabilitas di kemudian hari,
   tetapi bukan pertahanan terhadap paksaan pada saat itu.

8. **Perbandingan lintas yurisdiksi.** Pengeluaran yang disegel
   hanya dapat dibaca terhadap rezim hukum yurisdiksi
   penerbitannya. "Mengapa Kota X membayar Y untuk layanan Z
   ketika Kota W hanya membayar V?" adalah pertanyaan analisis
   komparatif di hilir penyegelan. Penilaian patokan lintas
   yurisdiksi adalah tugas analitis pada data yang disegel, bukan
   properti segel.

**Bagian batas-jujur di atas adalah bagian penopang dari kit ini.**
Pejabat keuangan dan politisi yang percaya penyegelan sama dengan
integritas akan menggunakan kit ini sebagai tameng. Kit harus
mengatakan dengan jelas: ini adalah *primitif non-repudiasi untuk
saat penerbitan*, bukan bukti integritas pengeluaran.

---

## Apa yang HARUS DITOLAK oleh kit ini untuk disegel

Kit dikonfigurasi untuk menolak pola fakta berikut bahkan jika
pengguna dengan otoritas penandatanganan yang sah mengajukannya:

- **Nama karyawan pemerintah individu di bawah tingkat
  penandatanganan prinsipal.** Tidak ada fakta yang boleh menyebut
  nama staf kantor pengadaan individu, juru tulis kas individu,
  anggota panel penilaian individu, atau orang alami mana pun yang
  bukan dalam peran akuntabilitas yang menghadap publik. Risiko
  paparan-pembalasan untuk staf garis melebihi manfaat transparansi;
  identitas mereka disegel dalam kontrol internal (FACT 05 hash log
  persetujuan), bukan dalam tubuh atestasi.

- **PII vendor.** Tidak ada fakta yang boleh memuat nomor rekening
  bank pemasok, nama karyawan pemasok individu, alamat rumah
  pemasok, NPWP orang alami pemasok, rincian harga internal yang
  berisi struktur biaya pemasok, atau bidang PII komersial lainnya
  yang publikasinya merugikan kepentingan pemasok tanpa melayani
  anti-korupsi. Informasi tersebut dapat di-HASH (FACT 05) tetapi
  tidak dipublikasikan.

- **Pengeluaran yang diklasifikasikan keamanan.** Pengeluaran yang
  diklasifikasikan di bawah undang-undang keamanan nasional TIDAK
  memenuhi syarat untuk disegel di bawah kit ini. Penanganan
  rahasia adalah masalah berbeda dengan persyaratan kriptografis
  dan hukum yang berbeda. Pengecualian itu sendiri diungkapkan
  dalam FACT 07 R3 sehingga pembaca tahu publikasi adalah parsial
  berdasarkan desain.

- **Penegakan perdata kewajiban pajak terhadap orang alami yang
  teridentifikasi.** Meskipun biaya penegakan adalah pengeluaran
  publik, penamaan pembayar pajak individu di bawah penegakan
  ditolak: bahaya privasi melebihi manfaat transparansi, dan
  transparansi paralel ada di bawah pelaporan pengadilan pajak.

- **Transaksi pra-penerbitan.** Tidak ada kontrak sebelum
  pemberian formal; tidak ada pencairan sebelum penerbitan formal.
  Menyegel rancangan kontrak atau pembayaran yang tertunda seolah-
  olah telah dieksekusi menciptakan kepastian palsu.

- **Penyegelan oleh siapa pun selain prinsipal keuangan yang
  bertanggung jawab.** Kontraktor, vendor, anggota dewan, jurnalis,
  atau pengamat tidak dapat menyegel "catatan belanja publik"
  sebagai pengganti otoritas keuangan yang menerbitkannya. (Mereka
  dapat menyegel observasi mereka sendiri di bawah prinsipal
  mereka sendiri, dalam publikasi terpisah.)

- **Pembingkaian "bebas korupsi".** Kit menolak menyegel
  pembingkaian apa pun dalam bentuk "pengeluaran ini sah dan bebas
  korupsi" atau "pengadaan dapat dibuktikan adil." Klaim semacam
  itu secara epistemis berada di luar domain kit.

- **Publikasi yang menghilangkan pengungkapan pendamping FACT 07.**
  Publikasi transaksi tanpa catatan pengungkapan dan penolakan
  yang menyertainya bukanlah publikasi MYRIAM yang sah di bawah
  kit ini.

Penolakan itu sendiri dapat disegel sebagai fakta ("Pihak ini
meminta penyegelan X; kit menolak sesuai aturan penolakan Y"),
menciptakan catatan publik dari upaya penyalahgunaan. Dalam domain
di mana tekanan politik terhadap pejabat keuangan terdokumentasi,
catatan permintaan yang *ditolak* sendiri adalah sinyal integritas.

---

## Apa yang DISEGEL oleh kit ini

8 fakta pada saat atestasi eksekusi anggaran:

1. **Pemberitahuan contoh** — menyatakan publikasi sebagai contoh
   (atestasi nyata menghapus atau menggantikan ini).
2. **Yurisdiksi dan dasar hukum** — entitas pemerintah mana yang
   menerbitkan, di bawah otoritas statuter mana, dalam periode
   fiskal mana.
3. **Referensi alokasi atau anggaran** — baris spesifik dalam
   anggaran yang diadopsi yang sedang dieksekusi, dengan hash
   instrumen anggaran dan setiap amandemen / transfer / pemrograman
   ulang yang diterapkan.
4. **Manifes kontrak atau pencairan** — catatan per-transaksi:
   jumlah, nama entitas hukum vendor (tanpa PII individu), tujuan,
   tanggal, jenis pengadaan, dasar pemberian, hash dokumen kontrak.
5. **Hash dokumen pendukung** — SHA-256 dari undangan, evaluasi,
   kontrak yang dieksekusi, perintah perubahan, aplikasi
   pembayaran, formulir penerimaan hasil, entri buku besar kas,
   log persetujuan kontrol. Hanya hash, bukan isi — untuk
   melindungi PII komersial dan pribadi sambil memungkinkan
   verifikasi hash ulang.
6. **Status audit dan pengawasan** — badan inspektur jenderal mana
   yang memiliki yurisdiksi, lembaga audit tertinggi mana, badan
   kejaksaan mana yang memiliki yurisdiksi pelanggaran korupsi,
   tenggat audit, status saat ini dari setiap tinjauan yang
   sedang berlangsung.
7. **Pengungkapan pendamping dan catatan penolakan** — protes
   pengadaan yang tertunda, penyelidikan internal yang tertunda,
   permintaan FOI yang belum diselesaikan, tinjauan yang
   berbeda pendapat, pembengkakan baris anggaran yang diketahui;
   daftar eksplisit pola yang ditolak kit untuk disegel.
8. **Prinsipal penanda tangan** — pejabat keuangan yang
   bertanggung jawab + peran + akuntabilitas statuter + ko-penanda
   tangan di bawah kontrol ganda; apa yang secara pribadi
   diatestasi dan tidak diatestasi oleh setiap penanda tangan.

Setiap fakta diakhiri dengan konvensi gerbang penolakan: *"Fakta
ini menegaskan hanya X. Ia tidak menegaskan Y"* (di mana Y adalah
mode kegagalan terdekat dari bagian "TIDAK dilakukan").

---

## Apa yang dipertahankan kit ini

- **Revisi senyap pasca-penerbitan jumlah kontrak.** Setiap
  perubahan pada setiap jumlah dalam FACT 04 menghasilkan SHA-256
  yang berbeda, akar Merkle yang berbeda, gagal verifikasi OTS.
- **Substitusi vendor secara senyap.** Mengganti "Vendor A" dengan
  "Vendor B" pada kontrak yang sudah diterbitkan dapat dideteksi
  dari byte yang disegel.
- **Pen-tanggal-an mundur perintah perubahan.** FACT 04 membekukan
  tanggal perintah perubahan dan alasan pada penerbitan; setiap
  klaim selanjutnya "ini selalu merupakan lingkup yang disepakati"
  harus berhadapan dengan catatan perintah perubahan yang
  disegel.
- **Hilangnya senyap transaksi yang tidak menguntungkan.** Semua
  transaksi yang diterbitkan dalam periode berada dalam FACT 04 di
  bawah satu akar Merkle. Menerbitkan subset dapat dideteksi dari
  daftar hash daun.
- **Penekanan pengungkapan pendamping.** FACT 07 membekukan
  status protes yang tertunda, penyelidikan yang tertunda, dan
  FOI yang belum diselesaikan pada saat atestasi. Setiap klaim
  selanjutnya "kami tidak pernah mendengar tentang protes itu"
  dapat di-diff secara publik.
- **Pergeseran yurisdiksi audit.** FACT 06 membekukan badan mana
  yang memiliki yurisdiksi pengawasan atas transaksi yang
  disegel. Klaim selanjutnya bahwa IG tertentu "tidak memiliki
  otoritas" harus berhadapan dengan catatan yurisdiksi yang
  disegel.
- **Penghapusan catatan penolakan.** FACT 07 mencatat apa yang
  ditolak kit untuk disegel; setiap klaim selanjutnya "kami tidak
  pernah menolak apa pun" bertentangan dengan catatan yang
  disegel.

---

## Kasus historis yang akan dibantu oleh kit

Kit akan menghasilkan **jangkar forensik** yang berguna — *bukan
perbaikan, bukan pencegahan, bukan pengganti penuntutan pidana* —
dalam kasus catatan publik terdokumentasi yang melibatkan modifikasi
senyap retroaktif catatan belanja publik:

- **Brasil — *Operação Lava Jato* / silsilah Petrobras
  (2014–2021).** Jaksa federal Brasil mendokumentasikan kartel
  perusahaan konstruksi besar yang selama lebih dari satu dekade
  membayar suap rata-rata ~3% pada kontrak Petrobras dan kontrak
  infrastruktur federal lainnya, dengan suap diarahkan kepada
  politisi dan koordinasi harga kartel sendiri. Kontrak seperti
  yang diterbitkan tampak rutin; korupsi berada di hulu penerbitan.
  Kit penyegelan TIDAK akan mencegah Lava Jato (suap tertanam
  dalam harga SEBELUM kontrak mencapai segel), tetapi akan
  menambatkan ketentuan kontrak pada penerbitan — membuat
  rekonstruksi forensik selanjutnya tentang "apa yang sebenarnya
  dikatakan setiap kontrak ketika ditandatangani" jauh lebih
  murah. Biaya investigasi Lava Jato sebagian besar adalah biaya
  perakitan ulang garis waktu dari catatan arsip yang tidak
  konsisten.

- **Uni Eropa — sengketa dana pembangunan regional (beberapa
  negara anggota, 2010-an–2020-an).** Laporan tahunan Pengadilan
  Auditor Eropa berulang kali mengidentifikasi tingkat kesalahan
  material dalam pengeluaran Dana Struktural dan Investasi Eropa
  (ESIF) dan Dana Kohesi, dalam beberapa tahun melebihi ambang
  materialitas. Sengketa tentang "apa yang sebenarnya diklaim"
  versus "apa yang sebenarnya disampaikan" berulang karena
  dokumentasi klaim dapat direvisi antara penyampaian dan audit.
  Penyegelan MYRIAM per-penerbitan dari klaim-sebagaimana-
  disampaikan akan menambatkan isi setiap klaim pada penyampaian,
  memisahkan "apa yang diklaim penerima pada saat itu" dari "apa
  yang disimpulkan oleh rekonstruksi pasca-audit."

- **Irak — pencairan Otoritas Koalisi Sementara (CPA), 2003–2004.**
  CPA mencairkan sekitar USD 9 miliar tunai dari Dana Pembangunan
  untuk Irak dengan dokumentasi yang Inspektur Jenderal Khusus
  untuk Rekonstruksi Irak (SIGIR) dan laporan audit selanjutnya
  karakteristikkan sebagai sangat tidak lengkap. Sengketa tentang
  catatan pencairan bertahan dua dekade kemudian. Penyegelan pada
  saat pencairan tidak akan menciptakan catatan yang tidak
  dipelihara CPA — tetapi di mana catatan ada (buku besar tulisan
  tangan, otorisasi transfer bertanggal), segel kontemporer akan
  menambatkan keadaan byte catatan itu pada saat penerbitan,
  memisahkan "catatan pada saat itu" dari "catatan seperti yang
  direkonstruksi kemudian."

- **Yunani — utang berdaulat dan revisi pelaporan pengeluaran
  publik (2009–2010).** Audit Eurostat pada 2009–2010
  mendokumentasikan revisi substansial dari data fiskal Yunani
  yang sebelumnya dilaporkan, dengan metodologi revisi itu
  sendiri diperdebatkan. Penyegelan laporan pengeluaran triwulanan
  pada saat publikasi asli akan membuat *delta* antara laporan
  asli dan yang direvisi dapat di-diff secara publik daripada
  hanya dapat direkonstruksi melalui perbandingan arsip. Segel
  tidak akan mencegah sengketa metodologis yang mendasari, tetapi
  akan menambatkan setiap kuartal yang dilaporkan pada saat
  laporan asli.

- **Britania Raya — pengadaan pandemi (2020–2022).** Laporan
  Kantor Audit Nasional Britania Raya dan komite parlemen
  mengidentifikasi proses pengadaan selama 2020–2021 di mana
  kontrak diberikan di bawah ketentuan darurat dengan persaingan
  yang dikurangi dan dokumentasi yang dikurangi; beberapa
  pemberian kemudian dimodifikasi, dibatalkan, atau diselesaikan.
  Penyegelan per-penerbitan dari setiap pemberian pengadaan
  darurat akan menambatkan alasan dan ketentuan pemberian pada
  saat pemberian, membuat modifikasi selanjutnya menjadi delta
  yang terlihat publik daripada catatan yang dimodifikasi secara
  senyap.

- **Afrika Selatan — kontrak perusahaan publik era penangkapan
  negara (~2010–2018).** Komisi Zondo mendokumentasikan kontrak
  di beberapa perusahaan milik negara (Eskom, Transnet, Denel)
  yang dokumentasinya bervariasi tidak lengkap, direvisi, atau
  diperdebatkan. Penyegelan setiap pemberian kontrak pada
  penerbitan akan menambatkan keadaan catatan sebagaimana
  diberikan, memisahkan keluaran rekonstruksi forensik
  selanjutnya dari catatan kontemporer.

Kit TIDAK akan mencegah korupsi yang mendasari dalam kasus
manapun di atas. Dalam beberapa kasus masalah yang mendasari
adalah bahwa korupsi berada *di hulu penerbitan* — segel
menambatkan kontrak yang korup pada integritas tinggi, yang
merupakan jenis berguna yang berbeda (jangkar forensik untuk
akuntabilitas selanjutnya) tetapi bukan hal yang sama dengan
pencegahan. Dalam kasus lain (uang tunai CPA, pembelanjaan di luar
anggaran) masalah yang mendasari adalah bahwa catatan yang
disegel tidak ada atau tidak dipelihara — kit tidak dapat
menciptakan catatan yang tidak diproduksi otoritas.

Kasus historis ini dinamai hanya dengan referensi pada temuan yang
terdokumentasi publik (catatan pengadilan, laporan komite parlemen,
publikasi badan audit). Tidak ada klaim yang dibuat tentang individu
mana pun; temuan kelembagaan yang terdokumentasi berdiri pada
catatan publik.

---

## Kapan menggunakan kit ini

- Yurisdiksi Anda memiliki proses pelaporan eksekusi anggaran yang
  mapan dan ingin menambahkan jangkar publik yang tidak dapat
  diubah.
- Anda mengharapkan pengawasan pasca-penerbitan (permintaan FOI,
  audit, pemantauan masyarakat sipil, investigasi jurnalistik) dan
  menginginkan titik referensi yang bukti-perusakan.
- Anda memiliki otoritas hukum di bawah hukum transparansi /
  catatan terbuka untuk menerbitkan kumpulan fakta yang
  tercantum, dengan pengecualian privasi/keamanan dihormati.
- Anda beroperasi di bawah rezim audit statuter (inspektur jenderal,
  lembaga audit tertinggi) dan ingin menambatkan setiap penutupan
  triwulanan sebelum siklus audit mencapainya.
- Anda menerbitkan di bawah Open Contracting Data Standard atau
  IATI dan ingin pelengkap kriptografis untuk publikasi berbasis
  portal.

## Kapan TIDAK menggunakan kit ini

- **Jangan gunakan sebagai pengganti audit statuter, tinjauan
  inspektur jenderal, investigasi kejaksaan, atau pemantauan
  masyarakat sipil.** Kit ini bersifat *aditif*, bukan pengganti.
- **Jangan gunakan sebagai sertifikat legitimasi.** Catatan
  pengeluaran yang disegel bukan sertifikat bebas korupsi.
  Memperlakukannya sebagaimana demikian adalah mode kegagalan yang
  tepat dimana struktur kit yang mengedepankan kendala ada untuk
  dicegah.
- **Jangan gunakan di tengah periode.** Kit ditujukan untuk saat
  penerbitan formal (penutupan triwulanan, pemberian kontrak,
  pencairan pencapaian). Segel di tengah periode menciptakan titik
  referensi yang menyesatkan.
- **Jangan gunakan untuk mengklaim pengeluaran itu sah, adil,
  atau bebas korupsi** — kit tidak dapat melakukan itu.
- **Jangan gunakan untuk menyegel pengeluaran yang
  diklasifikasikan, PII karyawan individu, atau PII komersial
  pemasok.** Kit menolak pola-pola ini; mencobanya menciptakan
  catatan penolakan (FACT 07).
- **Jangan gunakan untuk menyegel rancangan pra-penerbitan.**
  Rancangan dapat disegel di bawah jenis atestasi yang berbeda
  ("rancangan untuk komentar, belum diterbitkan"), tetapi tidak di
  bawah jenis penerbitan kit ini.
- **Jangan gunakan di bawah tekanan untuk menghilangkan
  pengungkapan FACT 07.** Tolak, dan segel penolakannya.
- **Jangan gunakan jika otoritas keuangan Anda telah ditangkap.**
  Pengeluaran palsu yang disegel adalah catatan publik permanen
  dari penipuan, bukan pembelaan terhadapnya. Primitif memotong
  kedua arah; itulah kejujurannya.

---

## Cara fork kit ini untuk atestasi nyata

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # ganti konten fiktif dengan yang nyata
bash build/seal.sh         # segel pada saat penerbitan formal
python3 build/verify.py    # konfirmasi
```

**Waktu kritis:** segel PADA saat penerbitan formal — yaitu, saat
prinsipal keuangan yang bertanggung jawab menandatangani penutupan
triwulanan, saat kontrak secara formal diberikan, atau saat
pencairan secara formal diterbitkan. Segel sebelum penerbitan formal
menciptakan referensi positif-palsu "ini catatan resmi". Segel jauh
setelah penerbitan formal secara forensik lebih lemah terhadap
modifikasi yang terjadi di antara waktu tersebut.

**Irama:** kit dirancang untuk atestasi triwulanan sebagai default.
Irama sub-triwulanan (penutupan bulanan, penyegelan per-transaksi)
didukung dengan menjalankan ulang dengan lingkup yang sesuai; segel
dari satu transaksi bernilai tinggi adalah penggunaan yang sah.

---

## Integrasi dengan infrastruktur keuangan publik yang ada

Kit dirancang untuk berkomposisi dengan, bukan menggantikan:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Lima titik
  publikasi (perencanaan, tender, pemberian, kontrak, pelaksanaan)
  secara alami memetakan ke FACT 03 (perencanaan → alokasi), FACT
  04 (tender, pemberian, kontrak, pelaksanaan → manifes transaksi),
  dan FACT 05 (hash dokumen pendukung). Ekspor JSON OCDS itu
  sendiri disegel dalam FACT 05 (dokumen kontrol). Yurisdiksi yang
  menjalankan publikasi OCDS dapat menambahkan penyegelan MYRIAM
  sebagai lapisan kriptografis di atas portal yang ada.

- **International Aid Transparency Initiative (IATI) standar
  v2.03.** Untuk pengeluaran yang dibiayai seluruhnya atau
  sebagian oleh bantuan eksternal, IATI XML dapat disegel sebagai
  dokumen kontrol; segel memberikan pelengkap kriptografis untuk
  model publikasi berbasis HTTP IATI Registry.

- **Komitmen Open Government Partnership (OGP).** Rencana Aksi
  Nasional OGP sering mencakup komitmen transparansi fiskal;
  penyegelan MYRIAM mengoperasionalkan komitmen "publikasi bukti-
  perusakan" dengan cara yang dapat diverifikasi secara independen
  oleh masyarakat sipil tanpa memerlukan kepercayaan pada portal
  pemerintah.

- **Rekomendasi OECD tentang Integritas Publik (2017).** Kit
  mendukung Rekomendasi 4 (data pemerintah terbuka tentang
  keuangan publik dalam bentuk yang dapat dibaca mesin dan tepat
  waktu) dengan membuat data ditambatkan secara kriptografis serta
  dapat dibaca mesin.

- **Konvensi PBB Anti-Korupsi (UNCAC), khususnya Pasal 9
  (pengadaan) dan 13 (partisipasi masyarakat).** Kit menyediakan
  primitif forensik yang mendukung kewajiban transparansi Pasal 9
  dan pengawasan masyarakat sipil Pasal 13.

- **Lembaga Audit Tertinggi (SAI) — kerangka INTOSAI.** SAI yang
  beroperasi di bawah standar INTOSAI (ISSAI) dapat mengonsumsi
  publikasi yang disegel sebagai bukti dengan integritas tinggi;
  hash SHA-256 dalam FACT 05 adalah hash yang sama yang dapat
  dihitung ulang oleh alat e-audit SAI.

- **Kantor inspektur jenderal.** Kantor IG domestik dengan
  yurisdiksi atas pengeluaran yang disegel (FACT 06) dapat
  menyita tubuh dokumen yang hash-nya disegel dalam FACT 05;
  segel mengikat tubuh dokumen yang diterima di bawah panggilan
  ke tubuh yang ada pada penerbitan.

- **Statuta kebebasan informasi dan catatan terbuka.** Segel tidak
  membebaskan otoritas penerbit dari kewajiban FOI yang
  berkelanjutan; sebenarnya, ia membuat respons FOI selektif
  dapat dideteksi sebagai penyimpangan dari catatan yang disegel.
  FACT 07 C3 menambatkan permintaan FOI yang belum diselesaikan
  pada waktu atestasi.

- **Registri kepemilikan manfaat (Rekomendasi FATF 24, direktif
  AML UE, US Corporate Transparency Act).** Data kepemilikan
  manfaat TIDAK disegel di bawah kit ini (FACT 04 mengambil
  identitas vendor hanya dari nama entitas hukum terdaftar).
  Pengungkapan kepemilikan manfaat adalah rezim penyegelan
  terpisah yang dapat menghasilkan publikasi paralel yang
  dirujuk oleh akar Merkle.

- **Transparansi yang dikelola pengadilan (pelaporan pengeluaran
  yudisial, proses pemulihan aset).** Keluaran dari proses
  pengadilan terkait korupsi tidak berada dalam lingkup kit ini
  tetapi dapat disegel di bawah jenis atestasi paralel.

## Apa yang TIDAK digantikan kit ini

- Audit eksekusi anggaran statuter oleh badan inspektur jenderal
- Tinjauan lembaga audit tertinggi (GAO, NAO, TCU, CAG, AGN, BRH,
  Cour des comptes, setara)
- Investigasi kejaksaan atas pelanggaran korupsi (jaksa anti-
  korupsi nasional, badan Pasal 36 UNCAC)
- Pelaporan investigatif masyarakat sipil dan jurnalistik
- Saluran whistleblower dan rezim pengungkapan yang dilindungi
- Pengungkapan kepemilikan manfaat
- Tinjauan sejawat internasional (OECD, IMF Fiscal Transparency
  Evaluation, semester UE, registri IATI)
- Proses pemulihan aset yang dikelola pengadilan

Segel adalah primitif forensik yang menurunkan biaya dan
meningkatkan keandalan semua hal di atas. Itu bukan, dan tidak
dapat menjadi, pengganti untuk salah satu dari mereka.

---

## Lisensi

Domain publik (CC0). Fork itu. Tidak ada atribusi yang diperlukan.
