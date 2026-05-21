*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

# Kit Segel Atestasi Karbon

Contoh myriam-kit siap-pakai untuk pengembang proyek karbon,
verifikator pihak ketiga, dan registri yang ingin menerbitkan
segel berlabuh Bitcoin yang tahan-rusak atas peristiwa penerbitan
kredit karbon, verifikasi penghilangan, atau atestasi emisi pada
saat sertifikasi yang tepat — sehingga modifikasi diam-diam
pasca-penerbitan menjadi dapat dideteksi secara publik.

---

## Apa yang TIDAK dilakukan kit ini (baca terlebih dahulu)

Kredit karbon diperdebatkan secara politis dan ilmiah. Segel
adalah cap-waktu kriptografis atas apa yang diatestasikan. Segel
tidak dapat memverifikasi apakah apa yang diatestasikan
mencerminkan manfaat iklim yang nyata. Mode kegagalan berikut ini
berada **di luar domain segel**, dan mencakup sebagian besar
pertanyaan integritas yang bermakna tentang kredit karbon:

1. **Adisionalitas (Additionality).** Segel tidak dapat
   memverifikasi bahwa aktivitas yang dikreditkan tidak akan
   terjadi tanpa pembiayaan karbon. Kontrafaktualnya secara
   prinsip tidak dapat diamati. Segel mencatat argumen
   adisionalitas metodologi; segel tidak mengadili argumen
   tersebut.

2. **Permanensi (Permanence).** Segel tidak dapat memverifikasi
   bahwa karbon yang disekuestrasi akan tetap tersekuestrasi
   selama cakrawala waktu yang relevan (puluhan hingga ratusan
   tahun untuk karbon hutan, skala waktu geologis untuk beberapa
   penghilangan). Literatur terkini (Badgley dkk. 2022, Patterson
   dkk. 2022) menunjukkan bahwa kolam-penyangga (buffer pools)
   telah terkuras secara substantif akibat peristiwa pembalikan
   nyata. Kredit yang disegel adalah *klaim* yang disegel atas
   permanensi di bawah asumsi kolam-penyangga yang ditentukan,
   bukan bukti permanensi.

3. **Kebocoran (Leakage).** Segel tidak dapat memverifikasi bahwa
   emisi yang dihindari di area proyek tidak sekadar dipindahkan
   ke area non-proyek. Pengurangan kebocoran-default metodologi
   adalah penampung-regulasi, bukan pengukuran. Segel berlabuh
   pada pengurangan yang diterapkan; segel tidak menyertifikasinya
   sebagai benar.

4. **Manfaat-Sampingan (Co-benefits).** Segel tidak dapat
   memverifikasi klaim pembangunan masyarakat atau biodiversitas.
   Manfaat-sampingan biasanya diklaim sendiri dan ditinjau oleh
   verifikator, tidak diaudit pada kedalaman kuantifikasi karbon.
   Segel berlabuh pada hash dokumen; tidak lebih.

5. **Kecukupan Persetujuan Bebas, Pendahuluan, dan Berdasarkan
   Informasi (FPIC).** Persetujuan masyarakat adat dan komunitas
   dalam proyek karbon memiliki sejarah mode kegagalan yang
   terdokumentasi (persetujuan yang dipaksakan, persetujuan dari
   badan yang tidak representatif, „persetujuan" pasca-hoc melalui
   kompensasi). Segel berlabuh pada dokumentasi FPIC dan hash
   log-keluhan; segel tidak dapat menyertifikasi bahwa proses
   persetujuan adalah genuin.

6. **Independensi verifikator.** Verifikator dibayar oleh
   pengembang proyek. Ini adalah konflik kepentingan struktural
   yang belum diselesaikan oleh skema akreditasi mana pun. Segel
   berlabuh pada deklarasi independensi verifikator; segel tidak
   menyertifikasi bahwa deklarasi tersebut benar.

7. **Penghitungan-ganda lintas registri atau dengan inventaris
   nasional.** Segel berlabuh pada snapshot keadaan registri pada
   waktu atestasi. Jika aktivitas yang sama juga dihitung oleh
   negara tuan rumah ke arah NDC-nya, atau juga diklaim di
   registri lain, segel membuat keadaan registri dapat
   dibandingkan (diffable) tetapi tidak mencegah penghitungan
   ganda.

8. **Kebenaran klaim pembeli.** Pembeli yang menarik kredit yang
   disegel untuk mendukung klaim „nol bersih" atau „netral karbon"
   sedang membuat klaim hilir yang tidak dicakup segel. Segel
   mencatat penarikan; validitas klaim pemasaran pembeli adalah
   pertanyaan hilir yang terpisah.

9. **Kebenaran metodologi.** Segel mencatat kutipan metodologi +
   hash dokumen yang berlaku pada waktu atestasi. Segel tidak
   menegaskan bahwa metodologi tersebut valid secara ilmiah.
   Reformasi metodologi terjadi; menyegel di bawah metodologi
   yang kemudian direvisi tidak membuat kredit secara retroaktif
   „salah" atau „benar" — segel berlabuh pada aturan yang berlaku
   saat penerbitan.

**Bagian batas-jujur di atas adalah bagian penyangga-beban kit
ini.** Hampir setiap pertanyaan integritas yang bermakna tentang
kredit karbon berada di salah satu dari sembilan keranjang
tersebut. Segel menutup celah sempit yang tersisa: modifikasi
retroaktif diam-diam atas byte-dalam-rekaman. Celah itu nyata dan
layak ditutup, tetapi kecil relatif terhadap medan yang
diperdebatkan.

---

## Apa yang HARUS DITOLAK kit ini untuk disegel

Kit dikonfigurasi untuk menolak pola fakta berikut bahkan jika
pengguna dengan otoritas penandatanganan yang sah mengirimkannya:

- **„Adisionalitas" dinyatakan sebagai fakta.** Menyegel
  adisionalitas sebagai fakta menciptakan rekaman yang menyesatkan.
  Kit menerima *argumen* adisionalitas yang sesuai metodologi,
  bukan *klaim* adisionalitas.
- **„Permanensi" tanpa pengungkapan cakrawala-waktu dan
  kolam-penyangga yang eksplisit.** Menyegel permanensi tanpa
  parameter tersebut mengaburkan apa yang sebenarnya dijanjikan
  proyek.
- **„Tidak ada kebocoran" tanpa pengukuran spesifik-proyek.**
  Pengurangan kebocoran-default metodologi bukan pengukuran dan
  segel tidak akan memperlakukannya sebagai pengukuran.
- **Kuantifikasi yang dihasilkan sebelum verifikasi pihak ketiga
  selesai.** Segel pra-verifikasi menciptakan rekaman
  „terverifikasi" yang positif-palsu.
- **Catatan penerbitan untuk kredit yang juga diterbitkan di
  registri berbeda tanpa pengungkapan lintas-registri yang
  eksplisit** di FAKTA 06.
- **Catatan penarikan yang gagal menamai penerima penarikan.**
  Penarikan anonim merusak fungsi kebaikan-publik dari penarikan;
  kit menolak memungkinkannya.
- **Klaim FPIC yang tidak didukung oleh hash dokumentasi yang
  dapat diatestasi.**
- **Penerbitan Pasal 6.2 / 6.4 tanpa hash surat-otorisasi (LoA)
  negara tuan rumah** yang disegel di FAKTA 06.
- **Penyegelan atas permintaan pihak mana pun selain pengembang
  proyek + verifikator secara bersama-sama** untuk proyek
  tersebut.
- **Klaim manfaat-sampingan yang disegel sebagai „bersertifikat"**
  ketika mereka hanya „diklaim sendiri dan ditinjau oleh
  verifikator".

Penolakan itu sendiri dapat disegel sebagai fakta („Pihak ini
meminta penyegelan X; kit menolak sesuai aturan-penolakan Y"),
menciptakan rekaman publik atas upaya penyalahgunaan.

---

## Apa yang DISEGEL kit ini

8 fakta pada saat atestasi:

1. **Pemberitahuan contoh** — mendeklarasikan publikasi sebagai
   contoh (atestasi nyata menghapus atau menggantinya).
2. **Identifikasi proyek** — nama proyek, registri, ID proyek
   registri, kutipan metodologi + hash, hash batas geografis,
   vintage, pengembang proyek, klaim manfaat-sampingan, status
   FPIC.
3. **Kuantifikasi emisi atau penghilangan** — ton CO2e bruto,
   kontrafaktual baseline, pengurangan kebocoran, kontribusi
   kolam-penyangga, pengurangan ketidakpastian, klaim kreditable
   bersih, hash setiap input numerik.
4. **Metodologi pengukuran** — sumber data penginderaan-jauh,
   jaringan plot ground-truth, hash log kalibrasi instrumen,
   hash model classifier + statistik akurasi, model kepadatan
   karbon, provenans-kode + manifest reproduksibilitas.
5. **Verifikasi pihak ketiga** — organisasi verifikator,
   akreditasi, hash deklarasi independensi, keterlibatan
   sebelumnya dengan pengembang, hash arsip foto kunjungan-lokasi,
   temuan yang diangkat + diselesaikan, hash dokumen opini
   verifikasi.
6. **Catatan penerbitan atau penarikan** — permintaan
   penerbitan + persetujuan, total kredit yang diterbitkan,
   rentang serial, deklarasi lintas-registri, hash LoA negara
   tuan rumah jika berlaku, rentang serial penarikan + penerima
   (untuk atestasi penarikan), hash snapshot keadaan registri.
7. **Pengungkapan-pendamping dan catatan penolakan** —
   perselisihan metodologi yang tertunda, risiko non-permanensi,
   peringatan kebocoran, peringatan adisionalitas, hash FPIC +
   log-keluhan, peringatan manfaat-sampingan, keterlibatan
   verifikator sebelumnya; daftar eksplisit pola yang ditolak
   kit untuk disegel.
8. **Prinsipal penandatangan** — pengembang proyek + verifikator
   + registri, masing-masing dengan peran + cakupan atestasi +
   info kunci kriptografis.

Setiap fakta diakhiri dengan konvensi gerbang-penolakan: *„Fakta
ini menegaskan hanya X. Fakta ini tidak menegaskan Y"* (di mana
Y adalah mode-kegagalan terdekat dari bagian „TIDAK dilakukan"
di atas).

---

## Apa yang dipertahankan kit ini

- **Modifikasi diam-diam pasca-penerbitan atas kuantifikasi.**
  Perubahan bilangan-bulat apa pun pada FAKTA 03 menghasilkan
  SHA-256 yang berbeda, root Merkle yang berbeda, gagal
  verifikasi OTS.
- **Substitusi metodologi diam-diam.** FAKTA 02 membekukan
  kutipan metodologi + hash dokumen pada penerbitan. Pertukaran
  registri dengan versi metodologi yang berbeda pasca-penerbitan
  dapat dibandingkan secara publik.
- **Revisi baseline diam-diam.** Hash output model skenario
  baseline FAKTA 03 disegel. Penyetelan-ulang baseline pasca-hoc
  untuk menghasilkan lebih banyak kredit dapat dideteksi.
- **Substitusi opini-verifikator diam-diam.** Hash dokumen opini
  FAKTA 05 disegel. Penulisan-ulang pasca-penerbitan „verifikator
  selalu mengatakan X" dapat dideteksi.
- **Hilangnya catatan-penarikan diam-diam.** Snapshot keadaan
  registri FAKTA 06 disegel. Kredit yang secara misterius
  menjadi „tersedia" kembali setelah ditandai ditarik dapat
  dideteksi terhadap segel.
- **Substitusi dokumen FPIC diam-diam.** Hash FPIC + log-keluhan
  FAKTA 07 disegel. Dokumen-persetujuan pengganti dapat
  dideteksi.
- **Penghapusan diam-diam atas pengungkapan yang tidak nyaman.**
  Status pengungkapan-pendamping FAKTA 07 disegel. Penghapusan
  diam-diam atas peringatan non-permanensi dari halaman
  deskripsi proyek dapat dideteksi terhadap byte yang disegel.

Kit ini TIDAK mempertahankan terhadap pertanyaan integritas
mendasar (adisionalitas, permanensi, kebocoran, kecukupan FPIC,
independensi verifikator, validitas metodologi). Itu adalah
masalah yang lebih sulit dan segel tidak dapat menyelesaikannya.

---

## Kasus historis atau hampir-historis di mana kit akan membantu

Kit akan menghasilkan jangkar yang berguna — *bukan perbaikan* —
dalam kasus-kasus yang melibatkan modifikasi retroaktif
diam-diam atas catatan atestasi-karbon. Kit TIDAK akan
menyelesaikan pertanyaan-pertanyaan yang diperdebatkan mendasari
dalam kasus mana pun ini.

- **Investigasi Guardian / Die Zeit / SourceMaterial tahun 2023
  atas kredit hutan-hujan Verra.** Penyelidik menemukan bahwa
  sebagian besar proyek REDD+ yang dipelajari menghasilkan kredit
  yang klaim emisi-yang-dihindari-nya tidak sesuai dengan
  reanalisis penginderaan-jauh kemudian. Investigasi memerlukan
  rekonstruksi dokumentasi proyek terhadap catatan registri yang
  dimodifikasi retroaktif. Publikasi tersegel di setiap siklus
  penerbitan akan memberikan byte referensi yang tidak ambigu
  atas apa yang diatestasikan di setiap siklus — bukan
  perbaikan untuk masalah baseline mendasar, tetapi garis waktu
  forensik yang bersih.

- **Peristiwa pembalikan offset hutan California tahun 2020.**
  Beberapa proyek karbon-hutan di bawah pasar kepatuhan
  California mengalami pembalikan akibat kebakaran-hutan yang
  melebihi cadangan kolam-penyangga yang disisihkan untuk
  mereka. Merekonstruksi apa yang diatestasikan setiap proyek
  tentang risiko non-permanensi *pada penerbitan* (vs apa yang
  proyek klaim kemudian telah diatestasikan) saat ini sulit.
  Segel per-vintage akan membuat atestasi pra-kebakaran dapat
  diambil secara kanonik.

- **Berbagai proyek REDD+ di mana metodologi baseline
  wilayah-referensi dikritik secara retroaktif sebagai
  diinflasi.** Hash dokumen-metodologi yang disegel pada waktu
  penerbitan akan menjangkar versi metodologi mana yang
  sebenarnya berlaku untuk vintage mana, membuat pembelaan
  „metodologi selalu X" dapat dibandingkan.

- **Beberapa perselisihan proyek regenerasi-yang-diinduksi-
  manusia Australian Carbon Credit Unit (ACCU) (2022-2023).**
  Kritik akademis tentang apakah regenerasi sebenarnya
  diinduksi-proyek vs. alami beralih ke perselisihan tentang
  apa yang awalnya diklaim proyek. Atestasi yang disegel akan
  memberikan catatan per-vintage yang tidak ambigu.

- **Catatan penarikan offset-karbon yang telah berubah keadaan.**
  Beberapa kasus terdokumentasi catatan penarikan di registri
  pasar-sukarela yang tampaknya berubah status pasca-penarikan
  (menjadi „ditarik" untuk alasan yang berbeda, atau dikaitkan
  dengan penerima yang berbeda setelah fakta). Segel
  per-penarikan akan menjangkar keadaan pada saat penarikan
  asli.

Dalam tidak satu pun dari kasus-kasus ini kit akan menyelesaikan
apakah kredit mendasari mewakili manfaat iklim nyata. Kit
menjangkar catatan; itulah semua yang dilakukannya.

---

## Kapan menggunakan kit ini

- Anda adalah pengembang proyek yang ingin menerbitkan atestasi
  tahan-rusak bersama pengarsipan registri standar Anda.
- Anda adalah verifikator pihak ketiga yang ingin opini
  verifikasi Anda dapat diverifikasi secara publik terhadap
  representasi „apa yang dikatakan verifikator" oleh registri
  kemudian.
- Anda adalah registri yang ingin menyediakan lapisan integritas
  tambahan pada catatan penerbitan dan penarikan — khususnya
  untuk proyek di yurisdiksi dengan dukungan aturan-hukum yang
  lebih lemah untuk integritas registri.
- Anda adalah jurnalis, akademisi, atau LSM yang menjalankan
  analisis longitudinal multi-tahun atas proyek karbon dan
  memerlukan jangkar publik untuk membandingkan representasi
  proyek kemudian terhadap byte waktu penerbitannya.
- Anda adalah pembeli (korporat nol-bersih, kepatuhan
  maskapai-penerbangan) yang ingin kredit yang Anda tarik
  ditarik terhadap catatan yang dijangkar publik, sehingga
  klaim pemasaran hilir Anda dapat diaudit terhadap garis-waktu
  forensik yang stabil.

## Kapan TIDAK menggunakan kit ini

- **Jangan gunakan sebagai pengganti verifikasi pihak-ketiga
  terakreditasi.** Segel tidak menggantikan verifikasi ISO
  14064-3; segel disusun bersamanya.
- **Jangan gunakan untuk mengklaim proyek „tambahan",
  „permanen", atau „rendah-kebocoran".** Segel tidak dapat
  memverifikasi properti-properti tersebut. Menggunakan segel
  untuk menegaskannya adalah penyalahgunaan.
- **Jangan gunakan sebagai teater legitimasi untuk kredit
  berkualitas-rendah.** Segel kriptografis pada kredit
  berkualitas-buruk adalah catatan forensik permanen atas
  kualitas-buruk itu, bukan pembelaan terhadapnya. Primitif ini
  memotong dua arah; itulah kejujurannya.
- **Jangan gunakan untuk menyegel kredit yang juga sedang
  dihitung oleh negara tuan rumah ke arah NDC-nya** tanpa
  pengungkapan penyesuaian-yang-sesuai eksplisit di FAKTA 06.
- **Jangan menyegel pra-verifikasi.** Segel sebelum opini
  verifikator final menciptakan catatan „terverifikasi" yang
  positif-palsu.
- **Jangan gunakan di bawah tekanan untuk menghilangkan
  pengungkapan-fakta-pendamping di FAKTA 07** (perselisihan
  metodologi yang tertunda, masalah FPIC, keterlibatan
  verifikator sebelumnya). Tolak, dan segel penolakannya.
- **Jangan gunakan sebagai lencana pemasaran.** „MYRIAM-tersegel"
  bukan klaim kualitas; itu adalah properti forensik.
  Memperlakukannya sebagai lencana kualitas adalah persis
  penyalahgunaan yang dicoba dicegah oleh desain
  batasan-pertama.

## Cara meng-fork kit ini untuk atestasi nyata

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Pengaturan-waktu kritis:** segel PADA atau SETELAH peristiwa
penerbitan resmi registri, BUKAN sebelumnya. Segel
pra-penerbitan menciptakan catatan „diterbitkan" yang
positif-palsu. Untuk atestasi penarikan, segel PADA saat
penarikan. Untuk atestasi pemantauan yang berkelanjutan antara
penerbitan dan penarikan, segel di setiap siklus pemantauan
yang ditandatangani-verifikator — tetapi jelaskan di FAKTA 01
bahwa atestasi adalah pembaruan pemantauan, bukan penerbitan.

## Integrasi dengan infrastruktur karbon yang ada

- **Verra (VCS).** URL publikasi tersegel atau IPFS CID dapat
  dilampirkan ke halaman proyek VCS sebagai dokumentasi
  pelengkap. Segel tidak menggantikan verifikasi VCS; segel
  disusun bersamanya.
- **Gold Standard.** Model integrasi yang sama — atestasi
  pelengkap di samping dokumentasi penerbitan Gold Standard.
  Penekanan Gold Standard pada manfaat-sampingan + dokumentasi
  manfaat-komunitas memetakan secara alami ke FAKTA 02 + FAKTA
  07.
- **American Carbon Registry (ACR), Climate Action Reserve
  (CAR).** Model integrasi yang sama.
- **Pasal 6.4 (mekanisme Badan-Pengawas Perjanjian Paris).**
  Hash LoA negara-tuan-rumah di FAKTA 06 dirancang khusus untuk
  ketertelusuran ITMO Pasal 6.4 / 6.2. Pengungkapan
  penyesuaian-yang-sesuai adalah bidang dengan
  gerbang-penolakan.
- **EU ETS MRV.** Untuk emiten pasar kepatuhan, hash laporan
  MRV memetakan ke hash spreadsheet kuantifikasi FAKTA 03.
  Segel disusun bersama — tidak menggantikan — laporan emisi
  terverifikasi operator.
- **Pengungkapan korporat CDP (Carbon Disclosure Project).**
  Untuk korporat yang mengutip kredit yang ditarik dalam
  pengajuan CDP, catatan penarikan yang disegel di bawah FAKTA
  06 adalah catatan kanonik yang dapat diambil. Bahasa
  pengajuan CDP dapat mereferensikan root Merkle atau IPFS CID
  publikasi tersegel.
- **ISO 14064-2 (proyek) / ISO 14064-3 (verifikasi) / ISO
  14065 (akreditasi).** Segel mencatat penegasan kesesuaian +
  hash; segel tidak melakukan penilaian kesesuaian.
- **TSVCM Core Carbon Principles (CCP) / label ICVCM.** Di
  mana proyek telah dinilai terhadap CCP ICVCM, hash hasil
  penilaian dapat disegel di FAKTA 07 sebagai pengungkapan
  pelengkap.

## Apa yang TIDAK digantikan kit ini

- Verifikasi pihak-ketiga terakreditasi (ISO 14064-3)
- Alur kerja penerbitan dan penarikan registri
- Penilaian kepatuhan metodologi
- Proses otorisasi negara-tuan-rumah untuk transaksi Pasal 6
- Proses MRV pasar-kepatuhan (EU ETS, California
  Cap-and-Trade, RGGI, dll.)
- Inisiatif integritas pasar-sukarela (ICVCM, VCMI)
- Penilaian dampak-iklim independen

## Mengapa kit ini ada di v0.4.0+

Ini adalah contoh terkerja ke-7 yang dikirim dengan myriam-kit.
Kit ada karena pasar kredit-karbon memiliki sejarah modifikasi
retroaktif diam-diam yang terdokumentasi dengan baik —
metodologi yang ditafsirkan-ulang secara retroaktif, baseline
yang direvisi secara retroaktif, catatan penarikan yang berubah
status, dan pengungkapan proyek yang secara diam-diam
menghilangkan peringatan yang tidak nyaman seiring waktu.

Segel menutup celah *sempit* dari byte-pada-waktu-atestasi.
Segel tidak mengatasi — dan tidak dapat mengatasi —
pertanyaan-pertanyaan yang lebih besar yang diperdebatkan
tentang adisionalitas, permanensi, kebocoran, atau autentisitas
manfaat-sampingan. Pembingkaian jujur dari batasan tersebut
oleh kit adalah fitur paling pentingnya.

## Lisensi

Domain publik (CC0). Fork-kan. Tidak diperlukan atribusi.
