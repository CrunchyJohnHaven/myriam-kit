# Kit Pensijilan Perbelanjaan Awam

*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

Contoh myriam-kit siap-pakai untuk kerajaan perbandaran, negeri,
wilayah, dan kebangsaan yang ingin melabuhkan rekod pelaksanaan-belanjawan
secara kriptografi (anugerah kontrak, pengeluaran, penerimaan
penghantaran) pada saat penerbitan, supaya pengubahsuaian retroaktif
senyap terhadap rekod perbelanjaan awam menjadi dapat dikesan secara
umum.

Meterai adalah **pelabuhan forensik**, bukan pensijilan integriti. Ia
merekodkan apa yang dilaporkan oleh pihak berkuasa kewangan pada hari ia
dilaporkan, dalam bentuk yang tidak boleh disemak semula secara senyap
tanpa menghasilkan percanggahan kriptografi yang dapat dilihat oleh
umum.

---

## Apa yang kit ini TIDAK lakukan (baca dahulu)

Meterai adalah cap masa kriptografi bagi apa yang telah disaksikan. Ia
tidak boleh mengesahkan sama ada apa yang disaksikan itu **sah, adil,
atau jujur**. Mod kegagalan berikut adalah **di luar domain meterai**:

1. **Rasuah hulu dan sogokan.** Jika perolehan diatur, vendor dipilih
   kerana rasuah, justifikasi sumber-tunggal direka, atau kontrak
   digelembungkan oleh peratusan sogokan yang dipersetujui — meterai
   melabuhkan transaksi-seperti-direkodkan dengan harga digelembungkan
   dan vendor digemari pada integriti tinggi. Meterai memerhati output
   sistem kewangan; ia tiada keterlihatan ke dalam rasuah di hulu
   penerbitan. *Operação Lava Jato* di Brazil mendokumenkan sogokan
   ~3% yang ditadbir-kartel secara sistematik merentasi ribuan kontrak
   Petrobras yang akan dimeteraikan semasa penerbitan seolah-olah
   sepenuhnya rutin.

2. **Penyembunyian syarikat shell terhadap pemilikan benefisial.**
   Kontrak yang dianugerahkan kepada "Acme Construction Ltd."
   dimeteraikan dengan nama entiti pada daftar awam. Jika "Acme"
   sebenarnya dikawal oleh seorang yang terdedah secara politik dan
   tidak didedahkan, atau merupakan satu daripada puluhan syarikat
   shell yang dikawal oleh satu kartel, meterai melabuhkan entiti
   permukaan. Ketelusan pemilikan-benefisial adalah rejim BERASINGAN
   (Cadangan FATF 24, EU 5AMLD/6AMLD, Akta Ketelusan Korporat AS) yang
   outputnya memerlukan protokol pemeteraian sendiri.

3. **Penipuan perakaunan di hulu penerbitan.** Jika pihak berkuasa
   kewangan itu sendiri mereka rekod sebelum ia dimeteraikan — kontrak
   hantu, pekerja hantu dalam senarai gaji, penerimaan penghantaran
   fiktif — meterai melabuhkan rekaan. Meterai tidak dapat mengesan
   bahawa rekod adalah palsu pada saat ia direkodkan; ia hanya dapat
   mengesan bahawa rekod telah diubah SELEPAS pemeteraian.

4. **Penerbitan terpilih / pemetikan ceri.** Pihak berkuasa kewangan
   boleh menerbitkan *subset* transaksi — yang bersih — dan
   memeteraikan itu sahaja. Meterai melabuhkan apa yang ada dalam
   penerbitan; ia tidak melabuhkan jagat raya transaksi yang sepatutnya
   ada dalam penerbitan. FACT 07 (pendedahan iringan dan rekod
   penolakan) kit ini adalah pertahanan struktur, tetapi ia bergantung
   kepada pihak berkuasa penerbit yang jujur tentang apa yang mereka
   pilih untuk tidak meteraikan.

5. **Perbelanjaan luar-buku atau luar-belanjawan.** Perbelanjaan awam
   yang disalurkan melalui perusahaan milik-negara, dana kekayaan
   berdaulat, kenderaan tujuan-khas, atau akaun amanah luar-belanjawan
   mungkin tidak muncul dalam belanjawan yang dimeteraikan. Meterai
   merekodkan apa yang dilaporkan dalam sistem belanjawan; perbelanjaan
   di luar sistem adalah di luar domain meterai. Pertikaian Pihak
   Berkuasa Sementara Koalisi Iraq (CPA) 2003–2004 melibatkan kira-kira
   USD 9 bilion dalam pengeluaran tunai yang rekodnya sebahagiannya
   hilang; pemeteraian rekod yang wujud pada saat pengeluaran akan
   melabuhkannya, tetapi tidak akan mencipta rekod yang CPA tidak
   selenggara.

6. **Tekanan "penjelasan" selepas-penerbitan.** Lebihan yang
   dimeteraikan, sumber-tunggal yang dimeteraikan, atau perintah
   perubahan yang dimeteraikan boleh dinaratifkan semula kemudian
   dengan apa-apa bingkai yang dikehendaki pihak berkuasa politik.
   Meterai melabuhkan FAKTA pada tarikh penerbitan, tetapi ia tidak
   memutuskan dahulu naratif yang akan disokong oleh fakta tersebut
   kemudian.

7. **Saksi yang dipaksa.** Jika prinsipal kewangan yang
   bertanggungjawab dipaksa menandatangani saksi yang mengelirukan
   transaksi, meterai melabuhkan saksi yang dipaksa dengan tandatangan
   yang dipaksa. Meterai mengesahkan SIAPA yang menandatangani
   (FACT 08), bukan KENAPA mereka menandatangani. Memeteraikan saksi
   yang dipaksa menghasilkan rekod awam yang kekal bagi output yang
   dipaksa — berguna untuk akauntabiliti kemudian, tetapi bukan
   pertahanan terhadap paksaan pada masa itu.

8. **Perbandingan merentasi bidang kuasa.** Perbelanjaan yang
   dimeteraikan hanya boleh dibaca terhadap rejim undang-undang bidang
   kuasa yang menerbitkannya. "Mengapa Perbandaran X membayar Y untuk
   perkhidmatan Z apabila Perbandaran W hanya membayar V?" adalah
   soalan analisis-perbandingan di hilir pemeteraian. Penanda aras
   silang-bidang-kuasa adalah tugas analitik pada data yang
   dimeteraikan, bukan sifat meterai.

**Bahagian had-jujur di atas adalah bahagian galas-muatan kit ini.**
Pegawai kewangan dan ahli politik yang percaya pemeteraian sama dengan
integriti akan menggunakan kit ini sebagai perisai. Kit ini mesti
mengatakan dengan terang: ini adalah *primitif bukan-penyangkalan untuk
saat penerbitan*, bukan bukti integriti perbelanjaan.

---

## Apa yang kit ini MESTI MENOLAK untuk meteraikan

Kit ini dikonfigurasikan untuk menolak corak fakta berikut walaupun
pengguna yang mempunyai kuasa menandatangani yang sah menyerahkannya:

- **Nama pekerja-kerajaan individu di bawah tahap penandatanganan-
  prinsipal.** Tiada fakta yang boleh menamakan kakitangan pejabat-
  perolehan individu, kerani perbendaharaan individu, ahli panel-
  pemarkahan individu, atau mana-mana orang semula jadi yang bukan
  dalam peranan akauntabiliti menghadap-umum. Risiko pendedahan-
  kepada-pembalasan untuk kakitangan baris melebihi manfaat ketelusan;
  identiti mereka dimeteraikan dalam kawalan dalaman (hash FACT 05 log
  tandatangan), bukan dalam isi saksi.

- **PII vendor.** Tiada fakta yang boleh termasuk nombor akaun bank
  pembekal, nama pekerja-pembekal individu, alamat rumah pembekal, ID
  cukai pembekal bagi orang semula jadi, pecahan harga dalaman yang
  mengandungi struktur kos pembekal, atau apa-apa medan PII-komersial
  lain yang penerbitannya membahayakan kepentingan pembekal tanpa
  memberi manfaat anti-rasuah. Maklumat sedemikian boleh di-HASH
  (FACT 05) tetapi tidak diterbitkan.

- **Perbelanjaan yang dikelaskan-keselamatan.** Perbelanjaan yang
  dikelaskan di bawah statut keselamatan kebangsaan TIDAK layak untuk
  dimeteraikan di bawah kit ini. Pengendalian terklasifikasi adalah
  masalah berbeza dengan keperluan kriptografi dan undang-undang yang
  berbeza. Pengecualian itu sendiri didedahkan dalam FACT 07 R3
  supaya pembaca tahu penerbitan adalah separa secara reka bentuk.

- **Penguatkuasaan sivil obligasi cukai terhadap orang semula jadi
  yang dikenal pasti.** Walaupun kos penguatkuasaan adalah perbelanjaan
  awam, menamakan pembayar cukai individu di bawah penguatkuasaan
  ditolak: bahaya privasi melebihi manfaat ketelusan, dan ketelusan
  selari wujud di bawah pelaporan mahkamah cukai.

- **Transaksi pra-penerbitan.** Tiada kontrak sebelum anugerah formal;
  tiada pengeluaran sebelum penerbitan formal. Memeteraikan kontrak
  draf atau pembayaran tertunggak seolah-olah ia telah dilaksanakan
  mencipta kepastian palsu.

- **Pemeteraian oleh sesiapa selain prinsipal kewangan yang
  bertanggungjawab.** Kontraktor, vendor, ahli majlis, wartawan, atau
  pemerhati tidak boleh memeteraikan "rekod perbelanjaan awam" sebagai
  ganti pihak berkuasa kewangan yang menerbitkannya. (Mereka boleh
  memeteraikan pemerhatian mereka sendiri di bawah prinsipal mereka
  sendiri, dalam penerbitan berasingan.)

- **Bingkai "bebas-rasuah".** Kit ini menolak untuk meteraikan apa-apa
  bingkai dalam bentuk "perbelanjaan ini adalah sah dan bebas
  daripada rasuah" atau "perolehan adalah jelas adil". Tuntutan
  sedemikian adalah secara epistemik di luar domain kit.

- **Penerbitan yang meninggalkan pendedahan iringan FACT 07.**
  Penerbitan transaksi tanpa rekod pendedahan dan penolakan yang
  iring bukan penerbitan MYRIAM yang sah di bawah kit ini.

Penolakan itu sendiri boleh dimeteraikan sebagai fakta ("Pihak ini
meminta pemeteraian X; kit menolak per peraturan-penolakan Y"),
mencipta rekod awam percubaan penyalahgunaan. Dalam domain di mana
tekanan politik terhadap pegawai kewangan didokumenkan, rekod
permintaan yang *ditolak* itu sendiri adalah isyarat integriti.

---

## Apa yang kit ini DOES meteraikan

8 fakta pada saat saksi pelaksanaan-belanjawan:

1. **Notis contoh** — mengisytiharkan penerbitan sebagai contoh (saksi
   sebenar membuang atau menggantikan ini).
2. **Bidang kuasa dan asas undang-undang** — entiti kerajaan mana yang
   menerbitkan, di bawah kuasa statutori mana, dalam tempoh fiskal
   mana.
3. **Rujukan peruntukan atau belanjawan** — baris khusus dalam
   belanjawan yang diterima pakai yang sedang dilaksanakan, dengan
   hash instrumen belanjawan dan apa-apa pindaan / pemindahan /
   pemrograman semula yang dilaksanakan.
4. **Manifes kontrak atau pengeluaran** — rekod per-transaksi: jumlah,
   nama entiti undang-undang vendor (tiada PII individu), tujuan,
   tarikh, jenis perolehan, asas anugerah, hash dokumen kontrak.
5. **Hash dokumen sokongan** — SHA-256 bagi solisitasi, penilaian,
   kontrak yang dilaksanakan, perintah perubahan, permohonan
   pembayaran, borang penerimaan penghantaran, entri lejar
   perbendaharaan, log tandatangan kawalan. Hanya hash, bukan
   kandungan — untuk melindungi PII komersial dan peribadi sambil
   membolehkan pengesahan hash-semula.
6. **Keadaan audit dan pengawasan** — badan inspektor-jeneral mana yang
   mempunyai bidang kuasa, institusi audit tertinggi mana, badan
   pendakwaan mana yang mempunyai bidang kuasa kesalahan rasuah,
   tarikh akhir audit, keadaan semasa apa-apa kajian semula yang
   sedang berjalan.
7. **Pendedahan iringan dan rekod penolakan** — protes perolehan yang
   tertunggak, siasatan dalaman yang tertunggak, permintaan FOI yang
   belum selesai, kajian semula yang berbeza, lebihan baris-belanjawan
   yang diketahui; senarai eksplisit corak yang kit menolak untuk
   meteraikan.
8. **Prinsipal yang menandatangani** — pegawai kewangan yang
   bertanggungjawab + peranan + akauntabiliti statutori + penandatangan
   bersama di bawah kawalan dwi; apa setiap penandatangan secara
   peribadi menyaksikan dan tidak menyaksikan.

Setiap fakta berakhir dengan konvensyen pintu-penolakan: *"Fakta ini
menegaskan hanya X. Ia tidak menegaskan Y"* (di mana Y adalah mod
kegagalan terdekat dari bahagian "TIDAK lakukan").

---

## Apa yang kit ini pertahankan terhadap

- **Penyemakan semula senyap selepas-penerbitan jumlah kontrak.**
  Sebarang perubahan kepada mana-mana jumlah dalam FACT 04 menghasilkan
  SHA-256 yang berbeza, akar Merkle yang berbeza, gagal pengesahan OTS.
- **Penggantian vendor secara senyap.** Menggantikan "Vendor A"
  dengan "Vendor B" pada kontrak yang sudah diterbitkan dapat dikesan
  dari bait yang dimeteraikan.
- **Pentarikhan-belakang perintah perubahan.** FACT 04 membekukan
  tarikh perintah-perubahan dan rasional pada penerbitan; sebarang
  tuntutan kemudian "ini sentiasa skop yang dipersetujui" mesti
  bertarung dengan rekod perintah-perubahan yang dimeteraikan.
- **Penghilangan senyap transaksi yang tidak menguntungkan.** Semua
  transaksi yang diterbitkan dalam tempoh berada dalam FACT 04 di bawah
  satu akar Merkle. Menerbitkan subset dapat dikesan dari senarai
  hash-daun.
- **Penindasan pendedahan-iringan.** FACT 07 membekukan keadaan
  protes-tertunggak, siasatan-tertunggak, dan FOI-belum-selesai pada
  saat saksi. Sebarang tuntutan kemudian "kami tidak pernah mendengar
  tentang protes itu" boleh dibandingkan secara umum.
- **Penyimpangan bidang-kuasa audit.** FACT 06 membekukan badan mana
  yang mempunyai bidang kuasa pengawasan terhadap transaksi yang
  dimeteraikan. Tuntutan kemudian bahawa IG tertentu "tidak mempunyai
  kuasa" mesti bertarung dengan rekod bidang kuasa yang dimeteraikan.
- **Penghapusan rekod-penolakan.** FACT 07 merekodkan apa yang kit
  menolak untuk meteraikan; sebarang tuntutan kemudian "kami tidak
  pernah menolak apa-apa" bercanggah dengan rekod yang dimeteraikan.

---

## Kes sejarah yang kit ini akan membantu dengan

Kit ini akan menghasilkan **pelabuhan forensik** yang berguna — *bukan
pembaikan, bukan pencegahan, bukan pengganti untuk pendakwaan
jenayah* — dalam kes rekod-awam yang didokumenkan yang melibatkan
pengubahsuaian retroaktif senyap terhadap rekod perbelanjaan awam:

- **Brazil — keturunan *Operação Lava Jato* / Petrobras (2014–2021).**
  Pendakwa raya persekutuan Brazil mendokumenkan kartel firma
  pembinaan utama yang selama lebih satu dekad membayar sogokan
  purata ~3% pada kontrak infrastruktur persekutuan Petrobras dan
  lain-lain, dengan sogokan disalurkan kepada ahli politik dan kepada
  penyelarasan harga kartel sendiri. Kontrak-kontrak yang diterbitkan
  kelihatan rutin; rasuah adalah di hulu penerbitan. Kit pemeteraian
  TIDAK akan menghalang Lava Jato (sogokan dibenamkan dalam harga
  SEBELUM kontrak mencapai meterai), tetapi akan melabuhkan terma
  kontrak pada penerbitan — menjadikan pembinaan semula forensik
  kemudian "apa yang sebenarnya dikatakan oleh setiap kontrak semasa
  ia ditandatangani" sangat lebih murah. Kos siasatan Lava Jato adalah
  sebahagian besarnya kos memasang semula garis masa daripada rekod
  arkib yang tidak konsisten.

- **Kesatuan Eropah — pertikaian dana pembangunan serantau (pelbagai
  negara anggota, 2010-an–2020-an).** Laporan tahunan Mahkamah Auditor
  Eropah berulang kali mengenal pasti kadar ralat material dalam
  perbelanjaan Dana Struktur dan Pelaburan Eropah (ESIF) dan Dana
  Kohesi, dalam beberapa tahun melebihi ambang materialiti.
  Pertikaian tentang "apa yang sebenarnya dituntut" berbanding "apa
  yang sebenarnya diserahkan" berulang kerana dokumentasi tuntutan
  boleh disemak antara penyerahan dan audit. Pemeteraian MYRIAM
  per-penerbitan bagi tuntutan-seperti-diserahkan akan melabuhkan
  kandungan setiap tuntutan pada penyerahan, memisahkan "apa yang
  benefisiari tuntut pada masa itu" daripada "apa yang pembinaan
  semula selepas-audit simpulkan".

- **Iraq — pengeluaran Pihak Berkuasa Sementara Koalisi (CPA),
  2003–2004.** CPA mengeluarkan kira-kira USD 9 bilion dalam bentuk
  tunai daripada Dana Pembangunan untuk Iraq dengan dokumentasi yang
  Inspektor Jeneral Khas untuk Pembinaan Semula Iraq (SIGIR) dan
  laporan audit kemudian dicirikan sebagai sebahagian besarnya tidak
  lengkap. Pertikaian tentang rekod pengeluaran berterusan dua dekad
  kemudian. Pemeteraian pada saat pengeluaran tidak akan mencipta
  rekod yang CPA tidak selenggara — tetapi di mana mana-mana rekod
  wujud (lejar tulisan tangan, kebenaran pemindahan bertarikh),
  meterai semasa akan melabuhkan keadaan bait rekod tersebut pada saat
  penerbitan, memisahkan "rekod pada masa itu" daripada "rekod seperti
  yang dibina semula kemudian".

- **Greece — penyemakan semula hutang berdaulat dan pelaporan
  perbelanjaan-awam (2009–2010).** Audit Eurostat pada 2009–2010
  mendokumenkan penyemakan semula yang besar bagi data fiskal Greek
  yang sebelum ini dilaporkan, dengan metodologi penyemakan semula
  itu sendiri dipertikaikan. Pemeteraian laporan perbelanjaan suku
  tahunan pada saat penerbitan asal akan menjadikan *delta* antara
  laporan asal dan yang disemak semula boleh dibandingkan secara umum
  bukannya boleh dibina semula hanya melalui perbandingan arkib.
  Meterai tidak akan menghalang pertikaian metodologi yang mendasari,
  tetapi akan melabuhkan setiap suku yang dilaporkan pada saat laporan
  asal.

- **United Kingdom — perolehan pandemik (2020–2022).** Laporan Pejabat
  Audit Negara UK dan jawatankuasa parlimen mengenal pasti proses
  perolehan semasa 2020–2021 di mana kontrak dianugerahkan di bawah
  peruntukan kecemasan dengan persaingan yang dikurangkan dan
  dokumentasi yang dikurangkan; beberapa anugerah kemudiannya diubah,
  dibatalkan, atau diselesaikan. Pemeteraian per-penerbitan setiap
  anugerah-perolehan-kecemasan akan melabuhkan rasional anugerah dan
  terma pada saat anugerah, menjadikan pengubahsuaian kemudian sebagai
  delta yang dapat dilihat secara umum bukannya rekod yang diubah
  secara senyap.

- **Afrika Selatan — kontrak perusahaan-awam era penangkapan-negara
  (~2010–2018).** Suruhanjaya Zondo mendokumenkan kontrak di beberapa
  perusahaan milik-negara (Eskom, Transnet, Denel) yang dokumentasinya
  pelbagai tidak lengkap, disemak semula, atau dipertikaikan.
  Pemeteraian setiap anugerah kontrak pada penerbitan akan melabuhkan
  keadaan rekod sebagai-dianugerahkan, memisahkan output pembinaan
  semula forensik kemudian daripada rekod semasa.

Kit ini TIDAK akan menghalang rasuah yang mendasari dalam mana-mana
kes di atas. Dalam beberapa kes masalah yang mendasari adalah bahawa
rasuah adalah *di hulu penerbitan* — meterai melabuhkan kontrak yang
rasuah pada integriti tinggi, yang merupakan jenis berguna yang
berbeza (pelabuhan forensik untuk akauntabiliti kemudian) tetapi
bukan perkara yang sama dengan pencegahan. Dalam kes lain (tunai CPA,
perbelanjaan luar-belanjawan) masalah yang mendasari adalah bahawa
rekod yang dimeteraikan tidak wujud atau tidak diselenggara — kit
tidak boleh mencipta rekod yang pihak berkuasa tidak hasilkan.

Kes sejarah ini dinamakan hanya dengan rujukan kepada penemuan yang
didokumenkan secara umum (rekod mahkamah, laporan jawatankuasa
parlimen, penerbitan badan-audit). Tiada tuntutan dibuat tentang
mana-mana individu; penemuan institusi yang didokumenkan berdiri pada
rekod awam.

---

## Bila menggunakan kit ini

- Bidang kuasa anda mempunyai proses pelaporan pelaksanaan-belanjawan
  yang mantap dan ingin menambah pelabuhan awam yang tidak boleh
  diubah.
- Anda menjangkakan penelitian selepas-penerbitan (permintaan FOI,
  audit, pemantauan masyarakat sivil, siasatan kewartawanan) dan ingin
  titik rujukan yang nyata-tampered.
- Anda mempunyai kuasa undang-undang di bawah undang-undang ketelusan
  / rekod-terbuka untuk menerbitkan set fakta yang disenaraikan,
  dengan pengecualian privasi/keselamatan dihormati.
- Anda beroperasi di bawah rejim audit statutori (inspektor jeneral,
  institusi audit tertinggi) dan ingin melabuhkan setiap penutupan
  suku tahunan sebelum kitaran audit mencapainya.
- Anda menerbitkan di bawah Standard Data Kontrak Terbuka atau IATI
  dan ingin pelengkap kriptografi kepada penerbitan berasaskan-portal.

## Bila TIDAK menggunakan kit ini

- **Jangan gunakan sebagai ganti audit statutori, kajian inspektor-
  jeneral, siasatan pendakwaan, atau pemantauan masyarakat sivil.**
  Kit ini adalah *tambahan*, bukan pengganti.
- **Jangan gunakan sebagai sijil kesahihan.** Rekod perbelanjaan yang
  dimeteraikan bukan sijil bebas-rasuah. Memperlakukannya sebagai itu
  adalah tepat mod kegagalan yang struktur kekangan-pertama kit wujud
  untuk mencegah.
- **Jangan gunakan di pertengahan tempoh.** Kit ini adalah untuk saat
  penerbitan formal (penutupan suku tahunan, anugerah kontrak,
  pengeluaran milestone). Meterai pertengahan-tempoh mencipta titik
  rujukan yang mengelirukan.
- **Jangan gunakan untuk mendakwa perbelanjaan adalah sah, adil, atau
  bebas-rasuah** — kit tidak boleh melakukan itu.
- **Jangan gunakan untuk meteraikan perbelanjaan terklasifikasi, PII
  pekerja individu, atau PII komersial pembekal.** Kit menolak corak
  ini; mencubanya mencipta rekod penolakan (FACT 07).
- **Jangan gunakan untuk meteraikan draf pra-penerbitan.** Draf boleh
  dimeteraikan di bawah jenis saksi yang berbeza ("draf untuk komen,
  tidak diterbitkan"), tetapi tidak di bawah jenis penerbitan kit ini.
- **Jangan gunakan di bawah tekanan untuk meninggalkan pendedahan
  FACT 07.** Tolak, dan meteraikan penolakan.
- **Jangan gunakan jika pihak berkuasa kewangan anda ditangkap.**
  Perbelanjaan tipuan yang dimeteraikan adalah rekod awam kekal
  tipuan, bukan pertahanan baginya. Primitif memotong dua hala; itu
  kejujurannya.

---

## Cara meng-fork kit ini untuk saksi sebenar

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # ganti kandungan fiksyen dengan yang sebenar
bash build/seal.sh         # meterai pada saat penerbitan formal
python3 build/verify.py    # sahkan
```

**Masa kritikal:** meterai PADA saat penerbitan formal — iaitu, saat
prinsipal kewangan yang bertanggungjawab menandatangani penutupan suku
tahunan, saat kontrak diformalkan, atau saat pengeluaran diformalkan.
Meterai sebelum penerbitan formal mencipta rujukan "ini rekod rasmi"
yang positif-palsu. Meterai jauh selepas penerbitan formal adalah
lebih lemah secara forensik terhadap pengubahsuaian campur tangan.

**Kadens:** kit ini direka untuk saksi suku tahunan sebagai lalai.
Kadens sub-suku tahunan (penutupan bulanan, pemeteraian per-transaksi)
disokong dengan menjalankan semula dengan skop yang sesuai; meterai
satu transaksi bernilai tinggi adalah penggunaan yang sah.

---

## Integrasi dengan infrastruktur kewangan-awam sedia ada

Kit ini direka untuk mengarang dengan, bukan menggantikan:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Lima titik
  penerbitan (perancangan, tender, anugerah, kontrak, pelaksanaan)
  memetakan secara semula jadi ke FACT 03 (perancangan →
  peruntukan), FACT 04 (tender, anugerah, kontrak, pelaksanaan →
  manifes transaksi), dan FACT 05 (hash dokumen sokongan). Eksport
  OCDS JSON itu sendiri dimeteraikan dalam FACT 05 (dokumen kawalan).
  Bidang kuasa yang menjalankan penerbitan OCDS boleh menambah
  pemeteraian MYRIAM sebagai lapisan kriptografi di atas portal sedia
  ada.

- **Inisiatif Ketelusan Bantuan Antarabangsa (IATI) standard v2.03.**
  Untuk perbelanjaan yang dibiayai sepenuhnya atau sebahagiannya oleh
  bantuan luar, IATI XML boleh dimeteraikan sebagai dokumen kawalan;
  meterai menyediakan pelengkap kriptografi kepada model penerbitan
  berasaskan-HTTP Daftar IATI.

- **Komitmen Perkongsian Kerajaan Terbuka (OGP).** Pelan Tindakan
  Kebangsaan OGP sering memasukkan komitmen ketelusan fiskal;
  pemeteraian MYRIAM mengoperasionalkan komitmen "penerbitan nyata-
  tampered" dalam cara yang boleh disahkan secara bebas oleh
  masyarakat sivil tanpa memerlukan kepercayaan kepada portal
  kerajaan.

- **Cadangan OECD mengenai Integriti Awam (2017).** Kit menyokong
  Cadangan 4 (data kerajaan terbuka mengenai kewangan awam dalam
  bentuk yang boleh dibaca-mesin dan tepat pada masanya) dengan
  menjadikan data dilabuhkan secara kriptografi dan juga boleh dibaca-
  mesin.

- **Konvensyen PBB menentang Rasuah (UNCAC), terutamanya Artikel 9
  (perolehan) dan 13 (penyertaan masyarakat).** Kit menyediakan
  primitif forensik yang menyokong obligasi ketelusan Artikel 9 dan
  pengawasan masyarakat sivil Artikel 13.

- **Institusi Audit Tertinggi (SAIs) — kerangka INTOSAI.** SAI yang
  beroperasi di bawah piawaian INTOSAI (ISSAI) boleh menggunakan
  penerbitan yang dimeteraikan sebagai bukti dengan integriti tinggi;
  hash SHA-256 dalam FACT 05 adalah hash yang sama yang alat e-audit
  SAI boleh mengira semula.

- **Pejabat inspektor-jeneral.** Pejabat IG domestik dengan bidang
  kuasa terhadap perbelanjaan yang dimeteraikan (FACT 06) boleh
  menyabit badan dokumen yang hashnya dimeteraikan dalam FACT 05;
  meterai mengikat badan dokumen yang diterima di bawah sabit kepada
  badan yang wujud pada penerbitan.

- **Statut kebebasan-maklumat dan rekod-terbuka.** Meterai tidak
  mengecualikan pihak berkuasa penerbit daripada obligasi FOI yang
  berterusan; sebenarnya, ia menjadikan respons FOI terpilih dapat
  dikesan sebagai penyimpangan daripada rekod yang dimeteraikan.
  FACT 07 C3 melabuhkan permintaan FOI yang belum selesai pada masa
  saksi.

- **Daftar pemilikan-benefisial (Cadangan FATF 24, arahan AML EU,
  Akta Ketelusan Korporat AS).** Data pemilikan-benefisial TIDAK
  dimeteraikan di bawah kit ini (FACT 04 sumber identiti vendor
  daripada nama entiti undang-undang berdaftar sahaja). Pendedahan
  pemilikan-benefisial adalah rejim pemeteraian berasingan yang boleh
  menghasilkan penerbitan selari yang dirujuk oleh akar Merkle.

- **Ketelusan pentadbiran-mahkamah (pelaporan perbelanjaan kehakiman,
  prosiding pemulihan-aset).** Output prosiding mahkamah berkaitan-
  rasuah tidak dalam skop kit ini tetapi boleh dimeteraikan di bawah
  jenis saksi selari.

## Apa yang kit ini TIDAK gantikan

- Audit pelaksanaan-belanjawan statutori oleh badan inspektor-jeneral
- Kajian institusi audit tertinggi (GAO, NAO, TCU, CAG, AGN, BRH,
  Cour des comptes, setara)
- Siasatan pendakwaan kesalahan rasuah (pendakwa anti-rasuah
  kebangsaan, badan UNCAC Artikel 36)
- Pelaporan siasatan masyarakat sivil dan kewartawanan
- Saluran whistleblower dan rejim pendedahan-dilindungi
- Pendedahan pemilikan-benefisial
- Kajian rakan antarabangsa (OECD, Penilaian Ketelusan Fiskal IMF,
  semester EU, daftar IATI)
- Prosiding pemulihan-aset pentadbiran-mahkamah

Meterai adalah primitif forensik yang mengurangkan kos dan
meningkatkan kebolehpercayaan kesemua yang di atas. Ia bukan, dan
tidak boleh, pengganti bagi mana-mana daripadanya.

---

## Lesen

Domain awam (CC0). Fork ia. Tiada atribusi diperlukan.
