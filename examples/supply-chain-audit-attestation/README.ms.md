*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

# Kit Meterai Pengesahan Audit Rantaian Bekalan

Contoh myriam-kit siap pakai untuk juruaudit sosial/buruh/alam sekitar pihak ketiga, pasukan pematuhan pembekal dalaman, penyiasat rantaian bekalan NGO, dan organisasi hak pekerja yang ingin menerbitkan meterai berlabuh Bitcoin, kalis penggodaman, bagi laporan audit pada saat tepat penurunan tandatangan.

---

## Apa yang kit ini TIDAK lakukan (baca dahulu)

Meterai ialah cap masa kriptografi terhadap apa yang ditandatangani oleh juruaudit. Ia tidak boleh mengesahkan sama ada apa yang ditandatangani itu **benar**. Mod kegagalan berikut adalah **di luar domain meterai**:

1. **Penangkapan audit oleh industri.** Audit yang ditugaskan oleh jenama mempunyai sejarah panjang dan terdokumentasi menghasilkan penemuan lemah terhadap pembekal yang perniagaan berterusan mereka dengan jenama yang menugaskan mengekalkan aliran saluran audit. Audit yang ditangkap, apabila dimeterai, menghasilkan rekod forensik kekal tentang audit yang ditangkap itu. Meterai tidak membetulkan penangkapan — ia hanya menjadikan audit-sebagaimana-dikeluarkan kekal tidak boleh diubah, supaya proses pencarian kebenaran kemudiannya mempunyai sesuatu yang konkrit untuk dibandingkan.

2. **Pekerja yang dilatih / kemudahan yang disediakan.** Audit yang diumumkan atau separa-diumumkan memberi pengurusan beberapa hari atau minggu untuk melatih jawapan pekerja, menyembunyikan pekerja bawah umur, membersihkan asrama, mengalih keluar peralatan tidak patuh, dan mengalihkan kerja kepada subkontraktor yang tidak diaudit semasa tetingkap audit. Meterai melabuhkan apa yang ditunjukkan kepada juruaudit, bukan apa yang dihalang daripada mereka lihat.

3. **Subkontrak tersembunyi.** Subkontrak Tier-2 dan Tier-3, kerja rumahan, dan pengeluaran sektor tidak formal secara meluas tidak kelihatan kepada audit lantai kilang. Meterai melabuhkan audit Tier-1; ia tidak dapat mengesan bahawa Tier-1 mengalih subkontrak kepada Tier-2 yang tidak diaudit semasa tetingkap audit atau secara rutin.

4. **Audit yang secara sistematik terlepas penyalahgunaan yang disasarkan.** Rana Plaza, keruntuhan kilang pakaian Bangladesh 2013 yang membunuh 1,134 pekerja, telah diaudit oleh beberapa program audit yang ditugaskan jenama dalam bulan-bulan sebelumnya. Retakan di bangunan tidak ada dalam senarai semak audit sosial; rejim audit tidak mempunyai skop kejuruteraan struktur. Audit melabuhkan apa yang *dalam skop*; penyalahgunaan di luar skop tetap tidak kelihatan tanpa mengira betapa kalis penggodaman meterai itu.

5. **Pembalasan selepas tandatangan terhadap pekerja yang mengambil bahagian dalam temu bual.** Walaupun dengan maklumat lokasi yang ditolak (FAKTA 07 R3), musuh yang berazam yang mengetahui ID pembekal boleh mengenal pasti kemudahan. Perlindungan pekerja memerlukan lebih daripada sekadar menolak PII dalam meterai — ia memerlukan tanpa nama di hulu metodologi audit. Meterai menjadikan audit-sebagaimana-dikeluarkan tahan lama; ia tidak melindungi orang yang ditemu bual secara retroaktif.

6. **Keadaan pekerja yang sah tetapi tidak berperikemanusiaan.** Jurang upah hidup dalam bidang kuasa di mana upah minimum sah berada di bawah penanda aras upah hidup menghasilkan penemuan audit "patuh" terhadap undang-undang upah-dan-jam dan penemuan "tidak patuh" terhadap piawaian upah hidup dalam audit yang sama (FAKTA 03 elemen 8 dalam contoh kit ini). Meterai melabuhkan apa yang dilaporkan oleh setiap piawaian; mendamaikannya ialah kerja dasar hiliran.

7. **Bahaya iklim / alam sekitar dengan kausalitas tersebar.** Pelepasan karbon, sumbangan kepada penebangan hutan, kekurangan air, dan pelepasan pencemar daripada pembekal boleh dimeterai dalam penemuan audit, tetapi atribusi kausal kepada volum pesanan jenama tertentu ialah secara metodologi dipertikaikan. Meterai melabuhkan apa yang diukur di pembekal; ia tidak memberikan tanggungjawab moral atau undang-undang.

8. **Pertikaian tentang piawaian mana yang berwibawa.** SA8000 vs. BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. kod kelakuan khusus syarikat: setiap satu mempunyai skop, keterukan, dan proses pemulihan berbeza. Meterai melabuhkan *satu* audit di bawah *satu* piawaian. Perbandingan silang piawaian ialah masalah hiliran.

9. **Kecekapan juruaudit vs. kelayakan juruaudit.** "Berkelayakan" bukan "berkemampuan." Juruaudit yang menamatkan program latihan yang diakreditasi telah terlepas penyalahgunaan teruk dalam audit yang mendahului bencana yang kelihatan kepada umum. Meterai melabuhkan kelayakan; ia tidak mengesahkan kecekapan yang digunakan untuk melaksanakannya.

**Bahagian had-jujur di atas adalah bahagian penanggung beban dalam kit ini.** Jenama yang mahukan teater legitimasi akan menggunakan audit yang dimeterai sebagai perisai. Kit mesti menyatakan secara jelas: ini ialah *primitif tanpa-penafian untuk saat penurunan tandatangan laporan audit*, bukan bukti pematuhan pembekal atau kesejahteraan pekerja.

---

## Apa yang kit ini MESTI ENGGAN meterai

Kit dikonfigurasikan untuk menolak corak fakta berikut walaupun pengguna dengan kuasa badan audit yang sah menyerahkannya:

- **Pengenalan pekerja individu.** Tiada fakta boleh menamakan pekerja, mengaitkan petikan kepada pekerja, mendedahkan nombor lencana, kedudukan barisan, bilik asrama, jadual syif, gabungan demografi dengan N<5, atau mana-mana medan yang boleh mengenal pasti semula orang yang mengambil bahagian dalam temu bual. Petikan pekerja menggunakan token rawak; pemetaan tidak pernah dimeterai.
- **Sumber pemberi maklumat / informan.** Jika penemuan bergantung pada pendedahan oleh individu yang mengambil risiko untuk mendedahkan, individu tersebut tidak pernah dinamakan atau dikenal pasti dalam penerbitan yang dimeterai.
- **Maklumat lokasi tepat.** Tiada alamat jalan, GPS, imej satelit >1km resolusi, atau gambar luar bangunan. Negara dan wilayah adalah resolusi maksimum yang dimeterai. Rasional: pengenalan kemudahan membolehkan pembalasan terhadap peserta temu bual.
- **Tuntutan pensijilan audit bersih.** Kit enggan meterai sebarang pembingkaian dalam bentuk "audit ini membuktikan pembekal patuh" atau "tiada pelanggaran wujud." Tuntutan kebersihan tidak disokong secara epistemik oleh metodologi audit.
- **Penggantian meterai-sebagai-sijil.** Penerbitan yang meninggalkan metodologi (FAKTA 04), bebas (FAKTA 06), atau penolakan (FAKTA 07) bukan penerbitan MYRIAM yang sah di bawah kit ini.
- **Audit draf / pra-tandatangan.** Pemeteraian berlaku pada penurunan tandatangan, bukan sebelumnya. Audit sementara mencipta kepastian palsu.
- **Pemeteraian semula yang menguntungkan secara post-hoc.** Audit yang disemak memerlukan penerbitan yang BARU dimeterai yang merujuk asal dengan akar Merkle. Audit asal yang dimeterai kekal kelihatan secara kekal sebagai audit-sebagaimana-dikeluarkan.
- **Pemeteraian oleh mana-mana pihak selain badan audit.** Jenama, pembekal, badan pensijilan, atau pihak ketiga tidak boleh meterai "audit" sebagai ganti badan audit yang menandatangani laporan.

Penolakan itu sendiri boleh dimeterai sebagai fakta ("Pihak ini meminta pemeteraian X; kit enggan mengikut peraturan penolakan Y"), mencipta rekod awam percubaan penyalahgunaan. **Dalam industri dengan penangkapan audit yang meluas, penolakan-untuk-meterai itu sendiri boleh menjadi isyarat bermakna:** badan audit yang tidak akan meterai kerana jenama menekan untuk melembutkan penemuan mempunyai pilihan untuk merekodkan penolakan secara terbuka di bawah prinsipal mereka sendiri.

---

## Apa yang kit ini MEMETERAI

8 fakta pada saat penurunan tandatangan audit:

1. **Notis contoh** — mengisytiharkan penerbitan sebagai contoh (pengesahan sebenar mengeluarkan atau menggantikannya).
2. **Skop dan subjek audit** — piawaian audit, badan audit, juruaudit ketua, saiz pasukan audit, pengenal pembekal (tiada maklumat lokasi tepat), tetingkap audit, jenis pengumuman (diumumkan / separa-diumumkan / tidak diumumkan), tarikh laporan audit, versi penurunan tandatangan, jenama penerima yang dinamakan, pihak yang menugaskan.
3. **Manifes penemuan audit** — kesesuaian setiap elemen / NC-kecil / NC-besar / NC-kritikal terhadap piawaian, setiap satu dengan SHA-256 penulisan lengkap penemuan. Jumlah agregat. Saranan pensijilan pada penurunan tandatangan.
4. **Metodologi dan bukti** — peruntukan masa di tapak, kiraan temu bual (dengan stratifikasi: jantina, status migran, tempoh perkhidmatan), pecahan format temu bual, hubungan jurubahasa, ulasan dokumen dengan saiz sampel dan cincangan kandungan, artifak lawatan tapak (dengan muka pekerja dikaburkan), batasan metodologi yang diketahui.
5. **Tindakan pembetulan yang dikomitmen** — CAP setiap NC-besar dan setiap NC-kecil dengan punca asas yang dinyatakan, tarikh akhir, mekanisme pengesahan, komitmen peningkatan, komitmen tanpa-relaksasi-senyap.
6. **Kelayakan dan bebas juruaudit** — akreditasi badan audit, kepekatan pelanggan, kelayakan juruaudit ketua dan kecekapan bahasa, pengalaman sektor, deklarasi bebas (juruaudit-pembekal, juruaudit-jenama, pemisahan badan-pensijilan).
7. **Pendedahan iringan dan rekod penolakan** — konflik kepentingan (eksplisit), sejarah audit sebelumnya, saluran suara pekerja yang dikomunikasikan, siasatan selari, ketidaksetujuan dalaman badan-audit, senarai peraturan-penolakan, penolakan yang sebenarnya dipohon audit ini.
8. **Prinsipal yang menandatangani** — badan audit, juruaudit ketua, pasukan audit, pegawai yang memberi kuasa, maklumat kunci kriptografi.

Setiap fakta berakhir dengan konvensyen pintu-penolakan: *"Fakta ini menegaskan hanya X. Ia tidak menegaskan Y"* (di mana Y ialah mod kegagalan terdekat dari bahagian "TIDAK lakukan").

---

## Apa yang kit ini pertahankan

- **Pelembutan senyap NC-besar selepas tandatangan.** Sebarang perubahan kepada FAKTA 03 (cth. MAJOR_NC diklasifikasikan semula kepada MINOR_NC, atau penemuan dipadamkan sepenuhnya) menghasilkan SHA-256 berbeza, akar Merkle berbeza, gagal pengesahan OTS.
- **Tarikh terdahulu penutupan tindakan-pembetulan.** FAKTA 05 membekukan CAP dan tarikh akhirnya pada penurunan tandatangan; sebarang tuntutan "kami menutup NC itu bulan lalu" yang bercanggah dengan tarikh akhir yang dimeterai boleh dibezakan secara awam.
- **Revisionisme metodologi.** FAKTA 04 membekukan kiraan temu bual, saiz sampel dokumen, dan jam di tapak pada penurunan tandatangan — menghalang pertahanan kemudian "kami melakukan siasatan mendalam" daripada tidak boleh dipalsukan.
- **Penerbitan semula selektif yang meninggalkan penemuan yang tidak menguntungkan.** Kesemua 8 fakta diikat oleh satu akar Merkle; memetik beberapa fakta sambil meninggalkan yang lain boleh dikesan dari senarai daun yang diterbitkan.
- **Penyimpangan tuntutan-kebebasan.** FAKTA 06 membekukan deklarasi bebas pada penurunan tandatangan. Tuntutan kemudian "audit ini bebas secara ketat" mesti berhadapan dengan peratus kepekatan-pelanggan yang dimeterai dan pendedahan jenama-membayar penugasan yang dimeterai.
- **Penghapusan rekod penolakan.** FAKTA 07 membekukan corak fakta yang ditolak oleh kit; sebarang tuntutan kemudian "kami tidak pernah menolak apa-apa" bercanggah dengan rekod yang dimeterai.

---

## Kes sejarah atau hampir-sejarah yang kit akan membantu

Kit akan menghasilkan **labuhan forensik** yang berguna — *bukan pembetulan atau pencegahan* — dalam kes yang melibatkan:

- **Rana Plaza (Bangladesh, 2013).** Keruntuhan bangunan Rana Plaza membunuh 1,134 pekerja pakaian dan mencederakan ~2,500. Beberapa jenama yang produknya dibuat dalam bangunan itu telah mengaudit pembekal Tier-1 dalam bangunan itu tidak lama sebelum runtuh. Audit menggunakan senarai semak audit sosial yang tidak termasuk skop kejuruteraan struktur. Fakta metodologi yang dimeterai (FAKTA 04) pada setiap audit tersebut akan menjadikan *jurang skop* kelihatan secara terbuka pada penurunan tandatangan — melabuhkan batasan yang didokumenkan yang program audit secara retroaktif mendakwa tidak ada. Meterai tidak akan menghalang keruntuhan. Ia akan menghalang tuntutan industri pasca-keruntuhan bahawa "tiada siapa tahu" daripada boleh dipertahankan secara epistemik.

- **Audit Apple / Foxconn (2010-an).** Pelbagai iterasi laporan audit kemudahan Foxconn yang menghasilkan untuk Apple diterbitkan dengan tahap keterukan penemuan, konteks kelompok bunuh diri pekerja, dan tuntutan pemulihan yang berbeza. Rekod saat-penurunan-tandatangan yang dimeterai untuk setiap audit akan menghalang pertikaian kemudian tentang "apa yang dikatakan audit pada masa itu" daripada bergantung pada salinan arkib, salinan bocor, atau pelepasan rasmi yang disemak.

- **Kobalt dari DRC (berterusan).** Perlombongan kobalt artisan di Republik Demokratik Congo, termasuk oleh kanak-kanak, menyumbang ke rantaian bekalan bateri untuk jenama elektronik dan EV utama. Pelbagai audit yang ditugaskan jenama dalam tempoh 2017-kini telah menghasilkan penemuan dengan keterukan berbeza. Kit yang digunakan pada setiap audit pada penurunan tandatangan akan melabuhkan audit-sebagaimana-dikeluarkan; kit yang digunakan pada fakta pendedahan-iringan (FAKTA 07 C2: sejarah audit sebelumnya) akan menjadikan warisan metodologi setiap juruaudit yang berikutnya tentang jurang sebelumnya kelihatan secara terbuka.

- **Mineral konflik (timah, tantalum, tungsten, emas dari DRC dan rantau Tasik Besar).** Dodd-Frank §1502 menghasilkan kewajipan audit-dan-dedah di bawah peraturan SEC 13p-1. Pertikaian tentang kecukupan audit peringkat smelter dan pengesahan rangkaian penjagaan hiliran berulang dalam tempoh 2014–2022. Meterai MYRIAM setiap audit akan melabuhkan setiap audit smelter pada penurunan tandatangan.

- **Audit yang ditugaskan jenama bagi rantaian bekalan kapas Xinjiang (2018-kini).** Pertikaian tentang sama ada audit boleh dijalankan dengan boleh dipercayai di bawah sekatan akses juruaudit kerajaan PRC muncul secara meluas selepas 2020. Fakta metodologi yang dimeterai (FAKTA 04) pada setiap audit akan melabuhkan keadaan akses yang sebenarnya digunakan — menjadikan tuntutan kemudian "kami menjalankan audit yang ketat" boleh dibezakan dengan kekangan metodologi yang dimeterai pada masa itu.

- **Subkontrak Foxconn dan laporan tanggungjawab pembekal Apple pada 2010-an — penemuan berulang pekerja bawah umur, asrama tersembunyi, pelanggaran jam.** Meterai setiap audit akan melabuhkan *penemuan negatif* dalam audit yang tidak menjumpai apa-apa, di samping *penemuan positif* dalam audit yang menjumpai pelanggaran — menghalang pemilihan ceri naratif retrospektif daripada mana-mana arah.

Kit TIDAK akan menghalang mana-mana daripada ini. Dalam beberapa kes masalah asasnya ialah audit *terlepas* penyalahgunaan — meterai audit bersih yang sepatutnya menjumpai pelanggaran menghasilkan rekod kekal audit yang gagal, yang merupakan jenis kegunaan berbeza (ia melabuhkan kegagalan untuk akauntabiliti kemudian) tetapi bukan sama dengan pencegahan.

---

## Bila menggunakan kit ini

- Anda ialah badan audit yang mengamalkan amalan "terbitkan apa yang kami tandatangan" sebagai pertahanan terhadap tekanan pelembutan selepas tandatangan.
- Anda ialah NGO yang menjalankan siasatan rantaian bekalan selari dan mahukan titik rujukan kalis penggodaman pada saat siasatan anda ditutup.
- Anda ialah organisasi hak pekerja yang telah memperoleh laporan audit dan mahu melabuhkan kandungan semasanya sebelum badan audit atau jenama mempunyai peluang untuk menyemaknya.
- Anda ialah jenama yang komited kepada ketelusan tentang audit yang anda telah tugaskan, dan anda mahukan rekod forensik yang boleh disahkan.
- Anda ialah wartawan, pengawal selia, atau mahkamah yang melabuhkan kandungan audit tertentu pada saat tertentu untuk litigasi atau pelaporan kemudian.

## Bila JANGAN menggunakan kit ini

- **Jangan gunakan sebagai pengganti pemantauan dipimpin-pekerja, siasatan NGO bebas, atau pengorganisasian pekerja.** Kit adalah *tambahan*, bukan pengganti mana-mana itu.
- **Jangan gunakan untuk mendakwa pembekal patuh.** Audit yang dimeterai bersih adalah pada terbaik satu input kepada penilaian pematuhan. Menganggap audit yang dimeterai sebagai sijil pematuhan ialah tepat teater legitimasi yang peraturan penolakan kekangan-dahulu wujud untuk dihalang.
- **Jangan gunakan di tengah audit.** Pemeteraian sebelum penurunan tandatangan mencipta rekod positif palsu "ini ialah laporan audit akhir".
- **Jangan gunakan untuk meterai draf yang anda berhasrat untuk menyemak.** Setiap versi penurunan tandatangan mendapat meterainya sendiri; semakan merujuk asal dengan akar Merkle.
- **Jangan gunakan di bawah tekanan untuk meterai lebih awal daripada penurunan tandatangan, atau untuk meninggalkan pendedahan fakta-iringan.** Tolak, dan (jika prinsipal anda membenarkan) meterai penolakan.
- **Jangan gunakan sebagai asas untuk tuntutan pemasaran "perdagangan adil" atau "sumber beretika" tanpa mendedahkan had metodologi yang dimeterai di sebelah meterai.** Memetik meterai tanpa memetik had ialah mod kegagalan teater-legitimasi yang mentakrifkan penangkapan audit.
- **Jangan gunakan jika badan audit anda ditangkap secara struktur dan tidak boleh menerbitkan penemuan terhadap kepentingan komersial jenama yang menugaskan.** Dalam kes itu, pemeteraian menghasilkan rekod awam kekal audit yang ditangkap. Itu mungkin masih bernilai — tetapi bukan sama dengan pertahanan terhadap penangkapan.

---

## Cara fork kit ini untuk audit sebenar

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Pemasaan kritikal:** meterai PADA saat penurunan tandatangan — iaitu, apabila juruaudit ketua menandatangani laporan akhir dan ia menjadi kedudukan rasmi badan audit. Meterai sebelum penurunan tandatangan mencipta rekod positif palsu "ini ialah audit akhir". Meterai lama selepas penurunan tandatangan lebih lemah secara forensik terhadap pengubahsuaian campur tangan.

---

## Integrasi dengan infrastruktur audit rantaian bekalan sedia ada

Kit direka untuk gubahan dengan, bukan menggantikan:

- **SA8000 (Social Accountability International).** Laporan audit SA8000 dan dokumen CAP memetakan secara semula jadi kepada FAKTA 03 + FAKTA 05. Rujukan akreditasi SAAS sesuai FAKTA 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment Program).** Penemuan audit RBA memetakan kepada FAKTA 03; peraturan bebas firma-audit RBA memetakan kepada FAKTA 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Penemuan audit 2-tonggak dan 4-tonggak SMETA memetakan kepada FAKTA 03; platform Sedex menjadi tuan rumah laporan mentah — meterai MYRIAM melabuhkan cincangan kandungan laporan yang dijadi tuan rumah platform.
- **amfori BSCI.** Mekanik penarafan BSCI A–E memetakan kepada saranan pensijilan FAKTA 03; penugasan keahlian jenama memetakan kepada pendedahan kepekatan-pelanggan FAKTA 06 dan FAKTA 07 C1.
- **FSC chain-of-custody.** Untuk rantaian bekalan produk hutan, sijil rangkaian penjagaan dan jadual audit semula sesuai dengan tetingkap audit dan struktur CAP.
- **B Lab / B Corp impact assessment.** Pensijilan B Corp bukan audit pihak ketiga dalam erti SA8000, tetapi laporan pengesah penilaian impak boleh dimeterai di bawah kit ini (dengan fakta diskop semula kepada penilaian impak dan bukannya audit buruh).
- **ISO 26000.** ISO 26000 ialah panduan, bukan boleh disahkan; kit tidak mempunyai integrasi laporan audit ISO 26000 langsung tetapi taksonomi tanggungjawab sosial boleh memaklumkan struktur elemen FAKTA 03 untuk audit dalaman.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program / rejim sektor industri lain).** Program audit khusus sektor boleh dimeterai di bawah kit ini; medan piawaian audit FAKTA 02 mengenal pasti yang mana.
- **Fair Labor Association.** Laporan pemantauan kilang FLA memetakan kepada FAKTA 03 + FAKTA 05; rangka kerja pemantau bebas FLA memetakan kepada deklarasi bebas FAKTA 06.
- **Higg Index (Sustainable Apparel Coalition).** Output peringkat kemudahan Higg FEM (Facility Environmental Module) dan Higg FSLM (Facility Social & Labor Module) boleh dimeterai di bawah kit ini.
- **EU CSRD / CSDDD.** EU Corporate Sustainability Reporting Directive dan Corporate Sustainability Due Diligence Directive mencipta kewajipan pendedahan yang dokumen pengesahannya boleh dimeterai di bawah kit ini. Kit melabuhkan pendedahan-sebagaimana-dikeluarkan, bukan kecukupan substantifnya.

## Apa yang kit ini TIDAK gantikan

- Pemantauan dipimpin-pekerja (isyarat pengesanan penyalahgunaan paling dipercayai dalam mana-mana rantaian bekalan)
- Siasatan NGO bebas (CCC, Labour Behind the Label, China Labour Bulletin, Workers' Rights Consortium, dll.)
- Pemeriksaan kawal selia (biro buruh kebangsaan, setara OSHA, program Pejabat Negara ILO)
- Pengorganisasian pekerja dan rundingan kolektif
- Litigasi, timbang tara, dan pemulihan di bawah undang-undang buruh domestik
- Rangka kerja usaha wajar sebelah jenama (UNGP, OECD Due Diligence Guidance, EU CSDDD)

## Lesen

Domain awam (CC0). Fork ia. Tiada atribusi diperlukan.
