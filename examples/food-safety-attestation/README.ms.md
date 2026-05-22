*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

# Kit Pengesahan Keselamatan Makanan

Contoh myriam-kit serah-kunci untuk pengeluar makanan, pemeriksa
keselamatan makanan, pengesah pihak ketiga, dan pihak berkuasa
pengawalseliaan yang ingin menerbitkan meterai yang dilabuhkan
pada Bitcoin dan boleh dikesan jika diusik, mengenai *apa yang
ujian pelepasan katakan* dan *keputusan pelepasan apa yang
dibuat*, pada saat pelepasan kelompok atau penandatanganan
laporan pemeriksaan — supaya pengubahsuaian senyap selepas
pelepasan terhadap rekod ujian, keputusan pelepasan, atau
komitmen panggilan balik dapat dikesan secara terbuka.

---

## Apa yang kit ini TIDAK lakukan (baca dahulu)

Meterai ialah cap masa kriptografi MANA ujian pelepasan yang
dijalankan ke atas MANA lot, oleh MANA makmal terakreditasi, di
bawah MANA kaedah, dengan MANA hasil, dan KEPUTUSAN PELEPASAN
apa yang dibuat oleh pihak berkuasa QA berdasarkan hasil
tersebut. Ia tidak boleh menjawab apa-apa soalan tentang
keselamatan makanan di luar itu. Berikut adalah **di luar
domain meterai**:

1. **Mencegah pencemaran.** Kit ini melabuhkan apa yang hasil
   ujian KATAKAN pada masa pelepasan. Pencemaran mempunyai
   banyak punca — taburan mikrob yang heterogen dalam satu lot,
   penyalahgunaan suhu selepas pelepasan dalam pengedaran,
   kegagalan pengendalian runcit, kegagalan penyediaan
   pengguna, bahaya baharu atau yang tidak ditapis (cth.
   penipuan melamin sebelum pemeriksaan melamin menjadi rutin),
   penipuan rantaian bekalan di hulu skop ujian pengeluar.
   Meterai tidak mencegah mana-mana ini dan tidak mendakwa
   demikian.

2. **Menjamin bahawa semua unit dalam lot yang lulus adalah
   selamat.** Pencemaran mikrobiologi dalam produk makanan
   pukal adalah HETEROGEN. Patogen Listeria, Salmonella, dan
   STEC berlaku dalam hotspot setempat dengan kelaziman rendah,
   tidak teragih secara seragam. Pelan persampelan ICMSF dan
   Codex mempunyai kebarangkalian yang didokumenkan dan
   terhad untuk mengesan pencemaran yang hadir pada kelaziman
   rendah — kebarangkaliannya BUKAN 1. Lot yang lulus
   persampelan pelepasan masih boleh mengandungi unit tercemar
   yang tidak disampel. Meterai melabuhkan SAMPEL, bukan
   pukal. Kekangan ini dinyatakan semula secara jelas dalam
   FAKTA 03 dan merupakan had jujur paling penting bagi kit
   ini.

3. **Mengesahkan bahawa ujian pelepasan dijalankan dengan
   jujur.** Meterai melabuhkan apa yang ujian laporkan pada
   masa pelepasan. Makmal yang melaporkan LULUS penipuan pada
   masa pelepasan menghasilkan meterai LULUS penipuan yang sah
   secara kriptografi. Kit ini membuat pengubahsuaian senyap
   kemudian dapat dikesan, tetapi tidak mengesan penipuan
   serentak. Pengesanan penipuan serentak memerlukan audit,
   pengawasan akreditasi makmal (penyeliaan ISO 17025), program
   ujian kecekapan, dan pemeriksaan pengawalseliaan — semua
   ini berada di hulu meterai.

4. **Menggantikan penyerahan pengawalseliaan FSMA, FSIS, atau
   pihak berkuasa kompeten EU.** Rekod pelepasan di bawah
   FSMA, FSIS, Peraturan EU (EC) 178/2002, dan Codex
   Alimentarius dikekalkan mengikut statut dan dihasilkan atas
   permintaan pengawal selia. Meterai menambah lapisan boleh
   kesan-usik awam DI ATAS penyerahan tersebut; ia TIDAK
   menggantikannya. Penerbitan bermeterai bukanlah pemfailan
   pengawalseliaan.

5. **Menyelesaikan pertikaian skop panggilan balik.** Kit boleh
   memeterai komitmen panggilan balik yang dibuat pada masa
   pelepasan (FAKTA 06) dan skop panggilan balik berikutnya
   sebagai penerbitan baharu; tetapi sempadan lot mana yang
   terjejas, unit mana yang dihantar, peruncit mana yang
   menerima, dan pengguna mana yang terdedah masih merupakan
   penyiasatan susur-balik-dan-ke-hadapan. Meterai melabuhkan
   apa yang pengeluar KOMITKAN dan apa yang mereka kemudian
   LAKUKAN. Ia tidak menyelesaikan soalan epidemiologi yang
   mendasari.

6. **Mengesan penipuan rantaian bekalan yang disengajakan di
   hulu ujian.** Penipuan melamin susu dan formula bayi di
   China pada 2008 berjaya kerana melamin tidak berada dalam
   panel analit — pengukuran kandungan nitrogen-setara protein
   ada, dan melamin menipunya. FAKTA 03 bermeterai dengan panel
   analit yang digunakan pada masa itu akan berkomitmen pada
   panel tersebut secara terbuka — tetapi tidak akan berbuat
   apa-apa untuk mengesan penipu di luar panel. Nilai meterai
   dalam kes itu adalah pelabuhan forensik bagi "ini adalah apa
   yang pengeluar dakwa diuji untuk," BUKAN pencegahan. Rejim
   keselamatan makanan sebenar menangani ini melalui
   persampelan pengawal selia yang tidak diumumkan dengan
   pemeriksaan skop luas (cth. kaedah LC-MS tidak bersasar),
   yang berada di hulu meterai pengeluar.

7. **Melabuhkan pengedaran selepas pelepasan dan pengendalian
   pengguna.** Sebaik sahaja lot meninggalkan fasiliti,
   penyalahgunaan suhu semasa pengedaran, salah pengendalian
   di peruncit, kegagalan penyimpanan pengguna, dan kesilapan
   penyediaan pengguna semuanya berada di luar skop. Meterai
   berskop kepada peristiwa pelepasan pengeluar. Boleh kesan-
   usik hiliran memerlukan kit berasingan di peringkat
   pengedar, peruncit, dan (untuk pengguna institusi seperti
   sekolah dan hospital) titik penggunaan.

8. **Menjamin keselamatan makanan dalam mana-mana populasi
   tertentu.** Hasil LULUS FAKTA 03 tidak menyiratkan
   keselamatan untuk pengguna hamil, bayi, pengguna imunosupresi,
   atau warga emas, yang mana Listeria monocytogenes dan
   Salmonella mempersembahkan risiko meningkat yang
   didokumenkan walaupun pada kepekatan di bawah had pengesanan
   konvensional. Meterai tidak boleh membuat tuntutan
   keselamatan khusus-populasi dan enggan berbuat demikian
   (peraturan keengganan R6).

**Bahagian had-jujur di atas adalah bahagian penting kit ini.**
Pengeluar yang menganggap "kami memeterai rekod pelepasan kami"
sebagai bersamaan dengan "kami membuktikan makanan kami selamat"
menyalahgunakan primitif. Kit mesti berkata dengan jelas: *ini
adalah primitif tidak-boleh-disangkal untuk dakwaan serentak
pengeluar pada masa pelepasan, bukan bukti keselamatan, bukan
pengganti pengawasan pengawal selia, dan bukan pertahanan
terhadap mod kegagalan pencemaran-heterogen, penipuan-rantaian-
bekalan, atau salah-pengendalian-selepas-pelepasan yang telah
membunuh orang dalam wabak lalu.*

---

## Apa yang kit ini MESTI ENGGAN memeterai

Kit dikonfigurasikan untuk menolak corak fakta berikut walaupun
pengguna dengan kuasa tandatangan pengeluar yang sah
menyerahkannya:

- **Pengenalan peribadi mana-mana pekerja, penyelia, kakitangan
  QA, pemeriksa lawatan, atau juruaudit pihak ketiga.** Nama,
  ID pekerja, nombor lencana, nombor keselamatan sosial, alamat
  rumah, nombor telefon peribadi — tidak satu pun daripada ini
  muncul dalam meterai awam. Peranan adalah awam; ikatan
  orang-ke-peranan dimeterai secara berasingan dan boleh
  ditemui di bawah proses pengawal selia. Perlindungan pekerja
  daripada pembalasan dan gangguan adalah kekangan penting;
  pengesahan keselamatan makanan boleh dilakukan pada peringkat
  peranan. (R1)

- **Lokasi fasiliti yang tepat.** Wilayah fasiliti (negeri atau
  rantau berbilang negeri) boleh diterima; alamat jalan tepat,
  koordinat GPS, atau apa-apa pengecam dengan butiran yang
  mencukupi untuk mengenal pasti loji secara fizikal di atas
  peta TIDAK boleh diterima. Nombor penubuhan pengawalseliaan
  adalah pemegang pengawal selia untuk fasiliti tersebut;
  pertimbangan keselamatan fizikal dan keselamatan pekerja
  membantah penerbitan alamat awam pada Bitcoin. (R2)

- **Corak peribadi syif pengeluaran individu.** Jadual syif,
  rotasi pekerja individu, ID peribadi pengendali lini —
  tidak satu pun daripada ini muncul dalam meterai. Corak
  hidup pekerja individu mesti tidak boleh diterbitkan
  daripada pengesahan awam. (R3)

- **Identiti pembekal yang menjejaskan kontrak.** Nama
  pembekal, lokasi fasiliti pembekal, kod lot pembekal (kecuali
  dalam kes pencemaran rantaian bekalan di mana penamaan lot
  tercemar pembekal diperlukan untuk kesihatan awam, dan
  dikendalikan melalui penerbitan bermeterai berasingan) TIDAK
  diterbitkan dalam meterai pelepasan. Banyak kontrak bekalan
  mengandungi peruntukan kerahsiaan; meterai tidak melanggar
  ini secara lalai. (R4)

- **Senarai pelanggan dan destinasi pengedaran melebihi peringkat
  tinggi.** Ringkasan rantau peringkat tinggi boleh diterima;
  senarai pelanggan tertentu (peruncit, pusat pengedaran, akaun
  perkhidmatan makanan) TIDAK boleh diterima. Identiti pelanggan
  adalah sulit secara kontrak dan sensitif secara persaingan;
  pengawal selia memperoleh senarai pelanggan melalui saluran
  penyelarasan panggilan balik yang ditetapkan. (R5)

- **Tuntutan keselamatan atau kesimpulan undang-undang.** Kit
  tidak akan memeterai "produk ini selamat," "lot ini memenuhi
  semua standard keselamatan makanan yang berkenaan," "ini
  adalah GRAS untuk penggunaan ini," atau apa-apa kesimpulan
  keselamatan atau undang-undang lain. Kit melabuhkan rekod
  ujian dan keputusan pelepasan, BUKAN kesimpulan keselamatan.
  (R6)

- **Corak pengenalan semula aduan-pekerja atau pemberi
  maklumat.** Kit enggan menerbitkan apa-apa corak yang boleh
  mengenal pasti semula pekerja yang telah memfailkan aduan
  OSHA, USDA, atau dalaman-syarikat mengenai amalan keselamatan
  makanan atau keselamatan tempat kerja. Pengadu sedemikian
  dilindungi di bawah FSMA Seksyen 402 dan statut selari;
  meterai mesti tidak menjadi vektor pengenalan semula.
  Pengesahan pemberi maklumat mempunyai kitnya sendiri
  (`examples/whistleblower-manifest`) dengan peraturan
  keengganan yang ditala untuk kes penggunaan tersebut. (R7)

- **Pemeteraian oleh sesiapa selain prinsipal yang diberi kuasa
  oleh pengeluar yang melepaskan.** Pengesah pihak ketiga,
  pasukan QA pelanggan, atau juruaudit bebas boleh menggunakan
  kit yang sama untuk memeterai penemuan audit MEREKA sendiri;
  mereka TIDAK boleh memeterai keputusan pelepasan asal di
  bawah nama pengeluar. Prinsipal penandatanganan dalam FAKTA
  08 adalah satu-satunya penandatangan yang sah untuk itu.
  (R8)

Keengganan itu sendiri boleh dimeterai sebagai fakta ("Pengeluar
ini meminta pemeteraian X; kit menolak mengikut peraturan
keengganan Y"), mencipta rekod awam tentang percubaan
penyalahgunaan.

---

## Apa yang kit ini memeterai

8 fakta pada saat pelepasan:

1. **Notis contoh** — mengisytiharkan penerbitan sebagai contoh
   (pengesahan sebenar mengeluarkan atau menggantikan ini).
2. **Pengenalpastian produk dan kelompok** — nama produk,
   kategori, pengeluar, wilayah fasiliti (BUKAN lokasi tepat),
   versi pelan HACCP + hash, ID lot, tarikh pengeluaran /
   pembungkusan / digunakan sebelum, bilangan unit pengguna,
   keperluan penyimpanan, tiga titik kawalan kritikal dengan
   hash rekod yang dilog (cook lethality, cooling
   stabilization, post-lethality RTE environment).
3. **Hasil ujian pelepasan** — ujian mikrobiologi produk akhir
   (Listeria, Salmonella, STEC, APC, Enterobacteriaceae),
   ujian kimia / sisa (nitrit, sisa veterinar, logam berat),
   pengesahan kontak silang alergen, ringkasan pemantauan
   alam sekitar, setiap satu dengan SHA-256 daripada PDF
   laporan penuh dan kekangan tafsiran sampel-vs-pukal yang
   jelas.
4. **Metodologi dan kelayakan makmal** — kaedah mana (dan
   versi dokumen kaedah mana) yang digunakan setiap baris,
   makmal mana yang menjalankan ujian mana, status akreditasi
   ISO/IEC 17025:2017 dan hash sijil setiap makmal, hasil
   ujian kecekapan terkini, kenyataan kebebasan, rekod
   penyimpangan / ujian semula / OOS untuk lot ini.
5. **Keputusan pelepasan** — tarikh pelepasan, kuasa
   pelepasan + tandatangan balas peringkat peranan, ringkasan
   rekod yang menyokong keputusan, destinasi pengedaran
   peringkat tinggi, kewajipan selepas pelepasan yang diakui
   pada pelepasan, komitmen pemasaan-dan-tidak-boleh-balik.
6. **Komitmen panggilan balik dan pengawasan pasca pasaran**
   — analog keselamatan makanan kepada farmakovigilans:
   ketelusan isyarat penyakit, komitmen pelaksanaan panggilan
   balik (ambang 24j / 72j / 98%), tindak balas pencemaran
   rantaian bekalan, komitmen tiada-ujian-semula-senyap,
   komitmen tiada-perubahan-spesifikasi-pasca-hoc, perkongsian
   isyarat keselamatan agregat.
7. **Pendedahan pendamping dan rekod keengganan** — hash log
   siasatan tindakan pembetulan, sejarah pemeriksaan terkini,
   sejarah panggilan balik, isu terbuka yang diketahui dalam
   kaedah ujian yang digunakan, ikatan peranan-ke-individu
   (dimeterai berasingan, di-hash di sini), kesediaan susur-
   balik pembekal, senarai eksplisit peraturan keengganan
   R1-R8 dengan mana-mana keengganan yang dilaksanakan
   semasa pelepasan ini.
8. **Prinsipal penandatangan** — pengeluar + penandatangan
   peringkat peranan (Pengarah QA) + tandatangan balas
   peringkat peranan (Pengurus Loji) + maklumat kunci
   kriptografi; rasional untuk penerbitan peringkat peranan.

Setiap fakta berakhir dengan konvensyen pintu-keengganan:
*"Fakta ini hanya menegaskan X. Ia tidak menegaskan Y"* (di mana
Y adalah mod kegagalan terdekat daripada bahagian "TIDAK
lakukan" di atas).

---

## Apa yang dipertahankan oleh kit ini

- **Pengubahsuaian retroaktif senyap hasil ujian pelepasan.**
  Semua PDF laporan-ujian di-hash. Pengulangan hash selepas
  pelepasan mendedahkan apa-apa pengubahsuaian.
- **Pertikaian mengenai kaedah mana, versi dokumen kaedah mana,
  dan makmal mana yang digunakan.** FAKTA 04 membekukan
  metodologi dan status akreditasi makmal pada pelepasan.
  Tuntutan kemudian "kami sebenarnya menggunakan MLG 4.13,
  bukan 4.12" boleh disangkal secara terbuka.
- **Spesifikasi semula retroaktif untuk kelompok di luar
  spesifikasi.** Jika hasil ujian pelepasan sebenarnya
  merupakan LULUS sempadan yang diklasifikasikan semula sebagai
  GAGAL selepas pelepasan, hash laporan bermeterai membuktikan
  apa yang PDF hasil asal katakan. Secara simetri, OOS sempadan
  yang secara senyap diuji semula menjadi LULUS tanpa
  pendedahan boleh dikesan jika komitmen tiada-ujian-semula-
  senyap dalam FAKTA 06 kemudian dibandingkan dengan pindaan
  yang tidak dimeterai.
- **Pengurangan senyap skop panggilan balik.** Komitmen
  panggilan balik dalam FAKTA 06 (notifikasi 24j, permulaan
  72j, kebolehkutipan 98%) dimeterai; kegagalan untuk
  menghormati mereka boleh diperhatikan secara terbuka.
- **Penceritaan semula retroaktif sejarah tindakan pembetulan.**
  Hash log tindakan-pembetulan FAKTA 07 membekukan apa yang
  syarikat KATA ia lakukan selepas EMP presumptif; tuntutan
  kemudian "kami melakukan lebih / kurang daripada itu" boleh
  disangkal secara terbuka.
- **Peninggalan selektif pendedahan pendamping.** FAKTA 07
  menyenaraikan kategori pendedahan yang diharapkan (sejarah
  pemeriksaan, sejarah panggilan balik, semakan nasihat
  kaedah, kesediaan susur-balik); kategori kosong mesti
  disahkan secara eksplisit ("tiada pada masa pelepasan"),
  jadi "kami tidak menyedari itu relevan" kemudian boleh
  disangkal secara terbuka.
- **Penggantian status akreditasi makmal lain.** FAKTA 04
  membekukan skop ISO 17025 dan hash sijil setiap makmal pada
  pelepasan; penggantian kemudian oleh makmal yang tidak
  diakreditasi boleh dikesan secara terbuka.

Kit ini **tidak** mempertahankan terhadap rasuah serentak —
pasukan yang sengaja memeterai hasil ujian palsu pada masa
pelepasan menghasilkan meterai hasil ujian palsu yang sah secara
kriptografi. Primitif jujur tentang ini: ia adalah primitif
tidak-boleh-disangkal untuk dakwaan serentak pengeluar, bukan
bukti bahawa dakwaan tersebut betul.

---

## Preseden kematian sejarah

Kit akan menghasilkan pelabuhan yang berguna — *bukan resolusi*
— dalam kegagalan keselamatan makanan lalu. Untuk mengelakkan
memfitnah individu (kebanyakan kegagalan keselamatan makanan
adalah korporat, bukan individu; sebahagiannya didakwa secara
jenayah dan sebahagiannya tidak), rujukan ini menerangkan wabak
mengikut tahun dan patogen dan menamakan entiti yang terlibat
hanya apabila pencemaran dikaitkan secara terbuka melalui notis
panggilan balik atau rekod mahkamah.

- **Penipuan melamin 2008 China terhadap formula bayi dan
  tenusu (Sanlu Group dan lain-lain).** Sekurang-kurangnya
  enam kematian bayi dan ~300,000 penyakit yang boleh
  dikaitkan dengan produk tenusu yang berlapis melamin yang
  direka untuk menggelumbungkan kandungan protein dengan
  penipuan dalam asai berdasarkan nitrogen Kjeldahl. Sabitan
  jenayah diikuti dalam mahkamah PRC, termasuk hukuman mati.
  *Meterai tidak akan menghalang ini* — melamin berada di
  luar panel analit standard. Meterai akan berkomitmen secara
  terbuka pada panel APA, menjadikan skop pengembangan
  pemeriksaan rutin pasca-insiden jelas secara forensik.

- **Wabak STEC O104:H4 Eropah 2011 (pucuk halba ditelusuri ke
  ladang Jerman).** 53 kematian, ~3,950 penyakit di seluruh
  beberapa negara Eropah; akhirnya ditelusuri ke biji halba
  yang diimport dari Mesir dan dipucukkan di pengeluar
  Jerman. Susur-balik telah dihalang oleh dokumentasi
  peringkat-lot yang tidak konsisten merentas rantaian
  bekalan berbilang negara. *Meterai tidak akan mencegah
  pencemaran lot biji* (pencemaran berada di hulu ujian
  pembuat pucuk); ia akan melabuhkan apa yang ujian pelepasan
  pembuat pucuk dakwa dan, jika digunakan di peringkat
  pengimport biji, apa yang pengendalian biji yang diimport
  dakwa, menjadikan susur-balik lebih cepat.

- **Wabak Listeria monocytogenes Blue Bell Creameries 2015
  (Amerika Syarikat).** 3 kematian, 10 penyakit merentasi
  beberapa negeri; membawa kepada panggilan balik kebangsaan
  dan sabitan jenayah persekutuan 2020 terhadap Blue Bell atas
  tuduhan kesalahan kecil keselamatan makanan, dengan syarikat
  memasuki perjanjian pendakwaan tertangguh dan membayar $19.35
  juta. Litigasi sivil seterusnya. *Meterai tidak akan
  mencegah* pencemaran alam sekitar Listeria dalam loji; ia
  akan melabuhkan secara forensik rekod program pemantauan
  alam sekitar, menjadikan apa-apa soalan pasca-insiden tentang
  "apa yang EMP tunjukkan dalam bulan-bulan sebelum wabak"
  boleh dijawab terhadap rekod cap-masa boleh kesan-usik dan
  bukannya terhadap dokumen yang dihasilkan kemudian.

- **Wabak STEC O157:H7 berbilang negeri 2018 yang dikaitkan
  dengan salad romaine (rantau penanaman Yuma, kemudian rantau
  penanaman Salinas).** Sekurang-kurangnya 5 kematian dan ~210
  penyakit merentasi beberapa wabak tahun itu. Susur-balik
  dirumitkan oleh produk berbungkus bercampur-sumber.
  *Meterai tidak akan mencegah* pencemaran di peringkat ladang
  / air pengairan (di hulu pengeluar); ia akan melabuhkan
  secara forensik rekod ujian-pengambilan dan ujian-pelepasan
  setiap pemproses, menjadikan susur-balik lebih cepat dan
  rekod awam lebih dipertahankan secara kriptografi terhadap
  pertikaian kemudian.

- **Wabak Salmonella Typhimurium Peanut Corporation of
  America (2008–2009, Amerika Syarikat).** 9 kematian, ~714
  penyakit; mengakibatkan sabitan jenayah persekutuan
  2014–2015 terhadap eksekutif PCA, termasuk hukuman penjara
  28 tahun untuk CEO atas tuduhan konspirasi dan halangan.
  *Meterai tidak akan mencegah* pencemaran, kurangnya
  penyiasatan ujian Salmonella positif dalam loji, atau
  keputusan peringkat-eksekutif untuk menghantar produk
  terhadap penemuan positif tersebut. Ia AKAN menjadikan jelas
  secara forensik, semasa perbicaraan, apa yang hasil ujian
  KATAKAN pada saat ia dihasilkan — menjadikan kes pendakwaan
  terhadap e-mel naratif palsu serentak jauh lebih dilabuhkan
  terhadap pengubahsuaian dokumen.

Dalam setiap kes ini, kit akan menyediakan garis masa forensik
yang lebih jelas. Dalam tiada satu pun daripada kes ini kit
sendiri akan menghalang kematian. Meterai ialah infrastruktur
forensik, bukan infrastruktur pencegahan. Perbezaan itu ialah
kejujuran kit.

---

## Bila menggunakan kit ini

- Operasi pembuatan anda mempunyai program HACCP / Kawalan
  Pencegahan yang stabil dan ingin menambah pengesahan awam
  yang dilabuhkan Bitcoin sebagai lapisan boleh kesan-usik di
  atas aliran kerja dokumentasi pelepasan sedia ada.
- Anda adalah pengeluar kecil-ke-pertengahan atau pengeluar
  dalam bidang kuasa dengan infrastruktur pengawalseliaan
  yang lebih lemah, ingin melabuhkan rekod kelompok terhadap
  garis masa yang boleh diverifikasi secara global — untuk
  kepercayaan pasaran eksport, untuk respons audit pelanggan,
  atau untuk penyertaan dalam inisiatif ketelusan sukarela.
- Anda adalah pemeriksa keselamatan makanan atau pengesah
  pihak ketiga dan ingin menerbitkan meterai penemuan audit
  yang boleh kesan-usik semasa penandatanganan, supaya
  penemuan audit tidak boleh diubah secara senyap kemudian
  dengan persetujuan antara pengeluar dan pengesah.
- Anda menjangkakan lot ini akan menghadapi penelitian hiliran
  yang ketara (pasaran eksport, kategori berisiko tinggi
  seperti daging RTE atau formula bayi, ramuan baharu, sejarah
  panggilan balik terkini).
- Anda boleh menerbitkan set fakta yang disenaraikan tanpa
  melanggar peraturan keengganan R1-R8. Jika fakta anda
  memerlukan pelanggaran R1-R8, jangan gunakan kit; baiki
  input data terlebih dahulu.
- Penasihat undang-undang pengeluar telah menyemak rancangan
  penerbitan. Penerbitan awam artifak yang membawa-pengecam-lot
  mempunyai implikasi untuk pendedahan tanggungan produk;
  semakan penasihat tidak pilihan.

## Bila JANGAN gunakan kit ini

- **Jangan gunakan sebagai pengganti rekod pengawalseliaan
  FSMA / FSIS / EU.** Meterai adalah *aditif*, bukan
  pengganti. Rekod pelepasan statutori anda, pelan HACCP anda,
  log CCP anda, dan pelan panggilan balik anda tidak berubah.
- **Jangan gunakan sebagai tuntutan keselamatan.** Memeterai
  rekod pelepasan yang lulus tidak menetapkan bahawa produk
  selamat; ia menetapkan bahawa rekod mempunyai kandungan bait
  ini pada masa ini. Peraturan keengganan R6 akan menolak apa-
  apa kesimpulan keselamatan.
- **Jangan gunakan untuk menerbitkan identiti pembekal,
  senarai pelanggan, nama pekerja, atau alamat fasiliti.**
  Peraturan keengganan R1-R5 wujud atas sebab-sebab keselamatan
  manusia dan kontrak; jangan pinda kit untuk mengalahkan
  mereka tanpa berunding dengan penasihat.
- **Jangan gunakan di bawah tekanan untuk memeterai sebelum
  ujian pelepasan selesai.** Meterai data separa salah
  menggambarkan keadaan keputusan pelepasan.
- **Jangan gunakan sebagai teater keabsahan.** Meterai pelan
  persampelan yang direka dengan buruk atau panel analit yang
  dipilih dengan buruk adalah rekod awam kekal kekurangan,
  bukan pertahanan terhadapnya. Primitif memotong dua arah;
  itu kejujurannya.
- **Jangan gunakan semasa situasi panggilan balik aktif sebagai
  pengganti penyelarasan panggilan balik pengawal selia.**
  Penerbitan MYRIAM baharu yang melabuhkan skop panggilan
  balik adalah sesuai SELEPAS panggilan balik yang
  diselaraskan-pengawal-selia dimulakan; ia bukan pengganti
  untuk saluran panggilan balik pengawal selia.

## Bagaimana untuk membuat fork kit ini untuk pelepasan
sebenar

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**PEMASAAN KRITIKAL:** memeterai pada saat pelepasan QA, SEBELUM
lot diedarkan (sebelum trak pertama berlepas dari fasiliti).
Meterai selepas pengedaran bermula masih mempunyai nilai tetapi
tidak melabuhkan keadaan pra-pengedaran dengan bersih. Tetingkap
yang betul adalah antara tandatangan pelepasan QA dan pergerakan
pengedaran pertama.

**SEMAKAN KRITIKAL:** sebelum memeterai, jalankan penerbitan
melalui penyemak QA kedua (bukan ketua) dan melalui penasihat
syarikat. Setelah dimeterai, penerbitan adalah kekal.

## Integrasi dengan infrastruktur keselamatan makanan sedia ada

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  URL penerbitan bermeterai atau CID IPFS boleh dirujuk dalam
  dokumentasi Pelan Keselamatan Makanan sebagai artifak
  pengesahan-awam untuk lot ini.
- **Pelan HACCP USDA FSIS dan rekod pelepasan.** Rekod
  pelepasan bermeterai berada di sebelah rekod HACCP yang
  diperlukan FSIS; meterai merujuk hash versi-pelan-HACCP
  (FAKTA 02) supaya pertikaian kemudian mengenai versi pelan
  yang berkuat kuasa boleh disangkal secara terbuka.
- **Codex Alimentarius / prinsip HACCP** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Meterai berkomitmen pada output HACCP tujuh-
  prinsip (analisis bahaya, CCP, had kritikal, pemantauan,
  tindakan pembetulan, pengesahan, simpan rekod) untuk lot ini.
- **ISO 22000:2018 (Sistem Pengurusan Keselamatan Makanan).**
  Meterai boleh dirujuk sebagai sebahagian daripada jejak
  bukti semakan-pengurusan; ia tidak menggantikan pensijilan
  ISO 22000.
- **Skim pensijilan FSSC 22000 v6.** Serasi sebagai lapisan
  ketelusan tambahan; juruaudit FSSC boleh mengesahkan meterai
  semasa pengawasan.
- **Peraturan EU (EC) 178/2002 (Undang-Undang Makanan Umum)
  Artikel 18 (kebolehkesanan) dan Artikel 19 (notifikasi
  panggilan balik).** Meterai berkomitmen pada kesediaan
  susur-balik-satu-peringkat-belakang pengeluar (FAKTA 07) dan
  komitmen panggilan balik (FAKTA 06); ia tidak menggantikan
  kewajipan notifikasi Artikel 19 statutori.
- **Pakej Kebersihan EU (Peraturan 852/2004, 853/2004,
  854/2004, 882/2004).** Serasi; meterai merujuk setara
  rekod HACCP dan semakan-sendiri Pakej Kebersihan.
- **Skim standard swasta BRCGS / SQF.** Serasi sebagai
  lapisan ketelusan tambahan.
- **Sistem pengawasan kesihatan awam (CDC PulseNet, FoodNet,
  IFSAC; EU EFSA / ECDC).** Di luar skop meterai secara
  langsung, tetapi FAKTA 06 berkomitmen pengeluar untuk
  mengambil bahagian dan memeterai apa-apa peristiwa korelasi-
  isyarat sebagai penerbitan MYRIAM baharu.

## Apa yang kit ini TIDAK gantikan

- Pendaftaran Fasiliti Makanan FDA atau kelulusan Establishment
  USDA FSIS.
- Pelan Keselamatan Makanan / Pelan HACCP bertulis anda di
  bawah FSMA / FSIS.
- Log pemantauan CCP dan rekod tindakan pembetulan.
- Pengawasan akreditasi makmal ISO 17025.
- Program ujian kecekapan.
- Pemeriksaan pengawal selia (pemeriksaan berterusan FSIS,
  pemeriksaan berkala FDA, pemeriksaan pihak-berkuasa-kompeten
  EU).
- Pengawasan kesihatan awam (CDC, EFSA, ECDC, setara
  kebangsaan).
- Saluran penyelarasan panggilan balik (FDA Reportable Food
  Registry, penyelarasan panggilan balik FSIS, EU RASFF, setara
  kebangsaan).
- Program keselamatan pekerja dan latihan pekerja makanan.

## Mengapa kit ini wujud dalam v0.4.0+

Ini adalah salah satu contoh yang dikerjakan yang dihantar
dengan myriam-kit. Ia mengikut struktur README kekangan-pertama
yang disahkan oleh autoresearch yang didokumenkan dalam
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — varian prompt
kekangan-pertama mendapat markah tertinggi pada rubrik berwajaran
merentas pelbagai domain contoh, kerana pengesahan keselamatan
makanan adalah tepat domain di mana berlebih-lebihan tentang
apa yang dibuktikan oleh meterai adalah bahaya: orang telah mati,
akan mati, dalam kegagalan yang meterai tidak boleh halang.
Bahagian pembukaan adalah bahagian penting kit; kandungan
manifesto adalah bahagian mudah.

Lalai kit secara sengaja konservatif pada penerbitan nama
pekerja, konservatif pada ketepatan lokasi fasiliti, konservatif
pada identiti pembekal dan pelanggan, dan agresif pada penafian
"ini tidak menetapkan keselamatan". Komuniti keselamatan
makanan mempunyai sejarah bahasa pensijilan yang berlebihan yang
didokumenkan; kit lalai pada kedudukan yang paling kurang
berkemungkinan dibaca sebagai jaminan keselamatan. Pengeluar
dalam bidang kuasa di mana keperluan pendedahan-awam tertentu
berbeza boleh meminda fork mereka mengikutnya, tetapi keengganan
lalai memihak kepada keselamatan pekerja dan skop yang jujur.

## Lesen

Domain awam (CC0). Fork ia. Tiada atribusi diperlukan.
