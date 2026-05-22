*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

# Kit Meterai Rantaian Pengawasan Bahan Bukti Mahkamah

Contoh myriam-kit siap-pakai untuk pasukan pemerolehan forensik —
pemeriksa forensik komputer, juruteknik pengekstrakan peranti mudah-
alih, kustodian bahan bukti kamera badan, penyelia makmal — yang ingin
menerbitkan meterai berjangkar-Bitcoin dan kalis-gangguan tentang
*bait mana yang diperoleh* dan *bila*, pada saat pemerolehan bahan
bukti digital, supaya pertikaian rantaian pengawasan mempunyai
jangkar awam.

---

## Apa yang kit ini TIDAK lakukan (baca dahulu)

Meterai ialah cap masa kriptografi tentang IMEJ FORENSIK YANG MANA
diperoleh, BILA diperoleh, oleh AGENSI YANG MANA, di bawah WARAN
YANG MANA, dan melalui METODOLOGI YANG MANA. Ia tidak boleh menjawab
sebarang soalan tentang kes di luar itu. Yang berikut adalah **di luar
domain meterai**:

1. **Kebolehterimaan di bawah Federal Rules of Evidence (atau mana-mana
   kod bukti lain).** Meterai menjangkar bait dan cap masa. Sama ada
   bukti boleh diterima — di bawah pengesahan FRE 901, keterangan
   pakar FRE 702 / Daubert, pengimbangan prasangka FRE 403, atau
   padanan mahkamah negeri — ialah soalan prosedur perundangan.
   Pemerolehan yang dimeterai dengan sempurna pun masih boleh
   diputuskan tidak boleh diterima; pemerolehan tanpa meterai pun
   masih boleh diterima. Meterai ialah bukti integriti tambahan,
   bukan pengganti keputusan kebolehterimaan mahkamah.

2. **Sama ada rampasan itu sah.** Pematuhan Pindaan Keempat,
   kesahihan waran, pematuhan skop, kebolehgunaan exclusionary-rule —
   semua ini berada di hulu meterai. Meterai mencatat bahawa
   pemerolehan berlaku di bawah waran FICT-SW-2026-0188; sama ada
   waran dikeluarkan dan diserahkan secara sah adalah urusan
   mahkamah.

3. **Sama ada bukti itu memberatkan, meringankan, atau neutral.**
   Meterai menjangkar cincang; tafsiran tentang apa yang dikandung
   cincang tersebut tergolong dalam laporan pemeriksaan forensik,
   yang merupakan dokumen tersendiri dengan rejim discovery dan
   pembuktiannya sendiri. Meterai akan menolak memeterai "FAKTA N:
   komputer riba suspek mengandungi bahan yang memberatkan" — lihat
   peraturan penolakan R4.

4. **Sama ada rantaian pengawasan adalah betul secara prosedural di
   bawah undang-undang bukti negeri yang berkenaan.** Meterai
   mencatat log peristiwa pengawasan kontemporari agensi (FAKTA 05).
   Sama ada log itu memenuhi keperluan rantaian pengawasan negeri
   tertentu adalah untuk mahkamah pada perbicaraan pembuktian.

5. **Sama ada metodologi forensik boleh dipercayai.** Daubert dan
   keturunannya (dan analog peringkat negeri seperti Frye, di mana
   ia masih terpakai) menilai kebolehpercayaan metodologi. Meterai
   mencatat alat dan versi MANA yang digunakan (FAKTA 04); sama ada
   alat tersebut memenuhi piawai kebolehpercayaan mahkamah tertentu
   adalah untuk mahkamah. Pepijat alat telah didokumenkan
   pasca-pemerolehan dalam kes-kes terdahulu; peranan meterai ialah
   membuat rekod version-and-binary-hash boleh dibantah secara awam,
   bukan menjamin alat-alat itu sendiri.

6. **Sama ada bukti telah diusik SEBELUM pemerolehan.** Meterai
   menjangkar bait dari saat imaging dan seterusnya. Jika suspek,
   pegawai, atau pihak ketiga mengubah peranti sumber sebelum ia
   diimej, meterai tidak dapat mengesannya — ia akan memeterai
   bait yang telah diubah dengan integriti yang sama seperti yang
   akan diberikannya kepada yang asli. Nilai meterai bermula pada
   cap masa imaging.

7. **Sama ada skop waran dihormati.** Lampiran waran mentakrifkan
   apa yang boleh diperoleh; meterai mencatat apa yang TELAH
   diperoleh. Sama ada pemerolehan melebihi skop waran, sekali lagi,
   ialah soalan perundangan dengan remedinya sendiri (usul
   penindasan di bawah prosedur negeri yang sesuai).

8. **Mengenal pasti semula mana-mana pihak persendirian dalam
   penyiasatan.** Meterai menolak menerbitkan sebarang nama,
   pengecam, atau cap jari yang boleh mengenal pasti semula suspek,
   tertuduh, mangsa, saksi, atau penghuni premis. Rujukan nombor
   kes ialah pemegang yang sesuai untuk pihak yang mempunyai
   kepentingan untuk mengesan kes itu.

**Bahagian batasan-jujur di atas adalah bahagian yang menanggung
beban dalam kit ini.** Pasukan forensik yang percaya bahawa memeterai
bersamaan dengan kebolehterimaan akan menggunakannya sebagai perisai.
Kit mesti menyatakan dengan jelas: *ini adalah primitif
non-repudiasi untuk saat pemerolehan, bukan bukti pemerolehan yang
sah, kekukuhan metodologi, atau rantaian pengawasan yang diiktiraf
mahkamah.*

---

## Apa yang kit ini MESTI MENOLAK untuk dimeterai

Kit dikonfigurasi untuk menolak corak fakta berikut walaupun pengguna
dengan kuasa menandatangani agensi yang sah menyerahkannya:

- **Pengenalan peribadi suspek, tertuduh, mangsa, saksi, atau
  mana-mana pihak ketiga persendirian.** Rujukan nombor kes ialah
  pemegang untuk pihak yang mempunyai kepentingan; meterai awam
  tidak seharusnya menjadi indeks pengenalan semula.
- **Nama peribadi pemeriksa forensik atau kakitangan agensi lain
  dalam meterai awam.** Peranan adalah awam; ikatan orang-ke-peranan
  dimeterai secara berasingan dan boleh didiskaver di bawah proses
  mahkamah.
- **Cincang peringkat-fail (atau cap jari) bahan CSAM yang
  disyaki, templat biometrik, atau sebarang data pengenalan-semula
  orang-yang-mudah-terjejas — walaupun melalui cincang.** SHA-256
  bagi fail individu ialah pengecam carian kekal; menerbitkannya
  pada lejar awam boleh menjadikan subjek mangsa semula melalui
  korelasi dengan pangkalan data persendirian. Cincang peringkat-
  imej (peringkat-imej-forensik) bagi cakera penuh boleh diterima;
  cincang peringkat-fail bahan sedemikian TIDAK PERNAH boleh
  diterima.
- **Penemuan pemeriksaan, tafsiran, pendapat, atau kesimpulan
  tentang apa yang dimaksudkan oleh bait.** Meterai menjangkar
  BAIT MANA yang diperoleh dan BILA. Tafsiran tergolong dalam
  laporan pemeriksaan yang boleh didiskaver, bukan pada lejar awam
  kalis-gangguan.
- **Dakwaan kebolehterimaan atau sebarang kesimpulan perundangan
  lain** ("bukti ini boleh diterima," "waran adalah sah," "rantaian
  pengawasan adalah betul di bawah §X.Y"). Kesimpulan perundangan
  adalah fungsi mahkamah.
- **Memeterai oleh sesiapa selain dari principal yang diberi kuasa
  oleh agensi pemerolehan.** Pakar pembelaan boleh menggunakan kit
  untuk memeterai pengesahan bebas mereka sendiri terhadap manifes;
  mereka tidak boleh memeterai pemerolehan ASAL atas nama agensi
  pemerolehan.
- **Ikatan peranan-ke-individu di dalam meterai awam.** Ikatan
  dimeterai dalam rekod sahabat berasingan (dicincang dalam FAKTA
  05) di bawah kawalan capaian agensi.
- **Fakta penyiasatan pra-rampasan atau pra-waran.** Kenyataan
  pemberi maklumat, pengawasan pra-waran, input parallel-construction
  — tiada satu pun daripadanya tergolong dalam meterai pemerolehan.
  Meterai adalah berskop kepada peristiwa pemerolehan.

Penolakan itu sendiri boleh dimeterai sebagai fakta ("Agensi ini
meminta pemeteraian X; kit menolak mengikut peraturan penolakan Y"),
mewujudkan rekod awam percubaan penyalahgunaan.

---

## Apa yang kit ini DIMETERAI

8 fakta pada saat pemerolehan:

1. **Notis contoh** — mengisytiharkan penerbitan sebagai contoh
   (atestasi sebenar membuang atau menggantikan ini).
2. **Konteks pemerolehan** — pengecam kes, petikan waran, agensi
   pemerolehan, pihak berkuasa meminta, tarikh/masa rampasan dan
   pemerolehan, lokasi pemerolehan (lokasi rampasan dipinda kepada
   rekod sahabat yang dimeterai berasingan untuk mengelakkan
   pengenalan semula premis).
3. **Manifes bukti** — setiap forensic-image-item: cincang SHA-256,
   saiz fail, pengecam tanpa-nama peranti-sumber, kaedah pemerolehan,
   format imej forensik.
4. **Metodologi pemerolehan** — nama alat forensik dan versi tepat
   (dengan cincang tool-binary), buat/model write-blocker dan
   firmware, rujukan pengesahan NIST CFTT, prosedur pengesahan
   yang digunakan, pilihan format imej.
5. **Log rantaian pengawasan** — garis masa setiap-peristiwa dari
   rampasan awal sehingga akhir imaging, kustodian dikenal pasti
   mengikut PERANAN (bukan mengikut nama), dengan cincang rekod
   sahabat yang dimeterai berasingan (ikatan peranan-ke-individu,
   log GPS pengangkutan, log capaian almari-bukti, foto meterai-
   gangguan, dsb.).
6. **Kelayakan pemeriksa mengikut peranan** — pensijilan yang
   dipegang, status pendidikan-berterusan, kiraan pengalaman
   keterangan-pakar terdahulu, pendedahan Daubert, pendedahan
   konflik-kepentingan — semuanya peringkat-peranan, bukan peribadi.
7. **Pendedahan sahabat dan rekod penolakan** — siasatan selari,
   cabaran waran tertangguh, usul-bukti-ditindas, protokol
   tapisan-keistimewaan / taint-team yang berkuat kuasa, percubaan
   pemerolehan terdahulu, semakan bug-tracker vendor; senarai
   eksplisit corak yang kit tolak untuk dimeterai.
8. **Principal penandatanganan** — pengenalan agensi pemerolehan +
   penandatangan peringkat-peranan (pemeriksa utama) + penandatangan-
   bersama peringkat-peranan (penyelia unit) + maklumat kunci
   kriptografi.

Setiap fakta diakhiri dengan konvensyen refusal-gate: *"Fakta ini
hanya menegaskan X. Ia tidak menegaskan Y"* (di mana Y ialah mod
kegagalan terdekat dari bahagian "TIDAK lakukan" di atas).

---

## Apa yang kit ini lindungi

- **Pengubahan senyap pasca-pemerolehan imej forensik.** Sebarang
  perubahan peringkat-bait kepada mana-mana imej menghasilkan SHA-256
  yang berbeza, dan imej pasca-perubahan tidak akan disahkan terhadap
  manifes FAKTA 03 yang dimeterai.
- **Dakwaan bahawa "alat berbeza telah digunakan."** FAKTA 04
  mencatat versi alat yang tepat dengan cincang tool-binary; dakwaan
  kemudian "kami sebenarnya menggunakan v4.7.0, bukan v4.7.1" boleh
  dibantah secara awam.
- **Dakwaan bahawa write-blocker tidak diaktifkan, atau menggunakan
  model berbeza.** FAKTA 04 membekukan manifes write-blocker.
- **Pengubahan log pengawasan.** Sebarang perubahan kepada garis
  masa peristiwa-pengawasan FAKTA 05 (menambah, membuang, atau
  mencap-masa-semula peristiwa) mengubah cincang FAKTA 05 dan
  boleh dikesan secara awam.
- **Penggantian kelayakan pemeriksa yang berbeza.** FAKTA 06
  membekukan profil kelayakan peringkat-peranan pada masa
  pemerolehan.
- **Penghilangan terpilih pendedahan sahabat.** FAKTA 07
  menyenaraikan kategori pendedahan yang dijangka; kategori kosong
  mesti dilantik secara eksplisit ("tiada pada masa pemerolehan"),
  jadi "kami tidak menyedari itu berkaitan" kemudian boleh dibantah
  secara awam.
- **Dakwaan pasca-pemerolehan bahawa pemeriksa mempunyai konflik
  yang tidak didedahkan.** Pendedahan konflik FAKTA 06 dibekukan
  pada pemerolehan; cabaran kemudian boleh diuji terhadapnya.

Kit **tidak** lindungi daripada rasuah kontemporari — pasukan yang
sengaja memeterai metadata palsu pada masa pemerolehan menghasilkan
meterai metadata palsu yang sah secara kriptografi. Primitif adalah
jujur tentang itu: ia adalah primitif non-repudiasi untuk dakwaan
kontemporari agensi, bukan bukti bahawa dakwaan tersebut adalah
betul.

---

## Kes bersejarah atau hampir-bersejarah yang akan dibantu oleh kit

Kit akan menghasilkan jangkar yang berguna — *bukan resolusi* —
dalam kes-kes lampau di mana rantaian pengawasan bukti digital
menjadi isu pembuktian yang dipertikaikan. Untuk mengelak menamakan
tertuduh (yang merupakan pihak persendirian walaupun apabila
disabitkan), ini diterangkan mengikut jenis kes, bukan oleh individu
yang dinamakan:

- **Kontroversi pepijat-alat-forensik persekutuan pertengahan
  2010-an** di mana alat imaging forensik yang digunakan secara
  meluas didapati, pasca-pemerolehan, mempunyai pepijat edge-case
  yang menjejaskan jenis media-sumber tertentu. Manifes pemerolehan
  yang dimeterai dengan data tool-version-and-binary-hash yang
  dibekukan akan membolehkan pembelaan dan pendakwaan bersetuju
  dengan tepat versi mana yang digunakan, menghapuskan satu paksi
  pertikaian.

- **Pelbagai kes negeri yang melibatkan output pengekstrakan
  peranti mudah-alih yang dipertikaikan**, di mana vendor alat
  pengekstrakan kemudian mengeluarkan tampalan bug-fix dan soalan
  menjadi "adakah pepijat menjejaskan kes ini." Fakta metodologi
  yang dimeterai membenarkan soalan dijawab terhadap data versioning
  yang dibekukan, bukan terhadap ingatan semasa agensi tentang
  versi mana yang digunakan.

- **Pertikaian penyerahan kamera-yang-dipakai-pada-badan** dalam
  kes di mana sistem dok vendor BWC kemudian didakwa membenarkan
  pengubahsuaian rakaman dalam transit. Manifes arkib body-cam
  yang dimeterai pada saat penerimaan agensi menjangkar bait apa
  yang diterima agensi daripada sistem dok; suntingan kemudian
  di pihak agensi boleh dikesan secara awam.

- **Kontroversi pelanggaran-cincang dalam kes forensik-komputer**,
  di mana pakar pembelaan berhujah bahawa MD5 (masih digunakan dalam
  beberapa aliran kerja legasi) tidak mencukupi. Pemerolehan yang
  dimeterai yang merekodkan KEDUA-DUA MD5 dan SHA-256 membenarkan
  SHA-256 berdiri walaupun MD5 dipertikaikan.

- **Pertikaian tentang evolusi metodologi pemeriksaan antara
  pemerolehan dan perbicaraan.** Apabila kes terbiar antara
  pemerolehan dan perbicaraan selama bertahun-tahun, metodologi
  yang menjadi piawai pada pemerolehan mungkin telah digantikan
  pada masa perbicaraan. Rekod yang dimeterai membenarkan mahkamah
  menilai metodologi terhadap piawai yang semasa pada saat
  pemerolehan, bukan terhadap piawai kemudian.

Kit TIDAK AKAN menyelesaikan pertikaian asas tentang kesalahan atau
ketidakbersalahan dalam mana-mana daripada jenis kes tersebut. Ia
akan menyelesaikan satu sub-pertikaian pembuktian tertentu: sama ada
bait, alat, dan prosedur adalah seperti yang didakwa oleh agensi
pada masa agensi mendakwanya.

---

## Bila menggunakan kit ini

- Agensi anda mempunyai SOP forensik yang stabil dan ingin
  menambah atestasi awam berjangkar-Bitcoin sebagai lapisan
  kalis-gangguan di atas rantaian pengawasan kertas-dan-tandatangan
  sedia ada.
- Anda menjangkakan kes ini akan melibatkan cabaran pembelaan yang
  ketara terhadap bukti forensik (kes berkepentingan-tinggi,
  metodologi baru, versi alat yang dipertikaikan, dsb.).
- Anda boleh menerbitkan set fakta tersenarai tanpa mendedahkan
  PII atau data pengenalan-semula orang-yang-mudah-terjejas.
  (Peraturan penolakan kit menguatkuasakan ini; jika fakta anda
  memerlukan pelanggaran peraturan-penolakan, jangan gunakan kit.)
- Kaunsel umum agensi pemerolehan dan pejabat pendakwa raya telah
  menyemak pelan penerbitan. Penerbitan awam artifak yang membawa
  pengecam kes mempunyai implikasi untuk siasatan berterusan;
  semakan kaunsel bukan pilihan.
- Peraturan discovery pembelaan bidang kuasa anda serasi dengan
  agensi memegang rekod ikatan peranan-ke-individu secara berasingan
  (dicincang dalam FAKTA 05). Jika bidang kuasa anda memerlukan
  pendedahan nama pemeriksa awam, anda mesti meminda kit dengan
  sewajarnya.

## Bila TIDAK menggunakan kit ini

- **Jangan gunakan sebagai pengganti dokumentasi rantaian
  pengawasan sedia ada agensi.** Kit ini adalah *tambahan*, bukan
  pengganti. CMS agensi, log pengawasan, dan obligasi pengeluaran
  discovery tidak berubah.
- **Jangan gunakan jika pemerolehan melibatkan CSAM, templat
  biometrik, atau data pengenalan-semula orang-yang-mudah-terjejas
  yang lain pada peringkat-fail.** Cincang peringkat-imej bagi
  cakera penuh boleh diterima; cincang peringkat-fail bahan
  sedemikian TIDAK PERNAH boleh diterima, walaupun di bawah
  pengecualian peraturan-penolakan. Jika anda tidak boleh membina
  set fakta tanpa memecahkan R3, jangan gunakan kit.
- **Jangan gunakan untuk mendakwa waran adalah sah, rampasan
  adalah betul, atau bukti boleh diterima** — kit tidak boleh
  melakukan itu, dan peraturan-penolakan R5 akan menolak sebarang
  dakwaan sedemikian.
- **Jangan gunakan di bawah tekanan untuk memeterai sebelum
  pemerolehan selesai.** Meterai pemerolehan-separa salah-
  menggambarkan keadaan.
- **Jangan gunakan untuk menerbitkan nama peribadi pemeriksa**
  melainkan bidang kuasa anda secara khusus memerlukannya dan
  pemeriksa anda telah bersetuju secara individu. Lalai adalah
  penerbitan peringkat-peranan.
- **Jangan gunakan dalam kes dimeterai atau di-bawah-meterai**
  tanpa kebenaran mahkamah eksplisit. Menerbitkan pengecam kes
  pada Bitcoin tidak boleh dipulihkan; jika kes kemudian
  dimeterai, meterai awam tidak boleh ditarik balik. Kit adalah
  untuk pemerolehan rekod-awam sahaja.
- **Jangan gunakan sebagai teater kesahihan.** Meterai pemerolehan
  yang cacat adalah rekod awam kekal tentang kecacatan tersebut,
  bukan pertahanan terhadapnya. Primitif memotong kedua-dua arah;
  itulah kejujurannya.

## Cara fork kit ini untuk pemerolehan sebenar

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Pemasaan kritikal:** meterai PADA atau sebaik selepas tamat
imaging (peristiwa E17 FAKTA 05 dalam garis masa contoh). Meterai
semasa imaging mewujudkan rekod pemerolehan-separa; meterai lama
kemudian mewujudkan jurang di mana agensi boleh mengubah imej.
Tetingkap yang betul adalah sebaik selepas pengesahan imej selesai
untuk item terakhir dalam set bahan bukti.

**Semakan kritikal:** sebelum memeterai, jalankan penerbitan
melalui pemeriksa forensik kedua (bukan ketua) dan melalui kaunsel
agensi. Setelah dimeterai, penerbitan adalah kekal.

## Integrasi dengan infrastruktur rantaian-pengawasan sedia ada

- **Sistem Pengurusan Kes Agensi (CMS).** CMS kekal sebagai sistem
  rekod utama agensi. Meterai tidak menggantikan CMS; ia commit
  kepada bait dan metodologi yang dicatatkan CMS, jadi suntingan
  CMS pasca-fakta boleh dikesan secara awam.
- **Federal Rules of Evidence / Daubert / kod bukti negeri.**
  Meterai menyumbang kepada rekod pengesahan FRE 901 dengan
  menyediakan integriti kalis-gangguan. Ia TIDAK memenuhi FRE 702
  / Daubert dengan sendirinya; kebolehpercayaan metodologi masih
  diuji pada perbicaraan pembuktian.
- **Discovery pembelaan (FRCP 16, Brady, Giglio, dan padanan
  negeri).** Rekod sahabat yang dicincang dalam FAKTA 05 (ikatan
  peranan-ke-individu, log pengawasan, foto meterai-gangguan, dsb.)
  kekal tertakluk kepada discovery normal. Meterai menjangkar apa
  yang didakwa rekod tersebut pada saat pemerolehan, jadi dakwaan
  kemudian "rekod adalah berbeza pada masa itu" boleh dibantah
  secara awam.
- **NIST Computer Forensics Tool Testing (CFTT).** Kit merujuk
  log pengesahan CFTT dalam FAKTA 04 / FAKTA 05; rujukan adalah
  cincang, bukan log itu sendiri, jadi proses CFTT tidak terjejas.
- **Neutral yang dilantik mahkamah dan pakar pembelaan.** Sama ada
  boleh mencincang-semula imej forensik yang mereka terima dalam
  discovery terhadap manifes FAKTA 03, secara bebas daripada
  sebarang kerjasama agensi. Ini adalah value-add utama kit untuk
  pihak pembelaan.
- **Semakan rayuan.** Bertahun-tahun kemudian, penyemak forensik
  rayuan boleh mengesahkan metodologi pemerolehan asal terhadap
  rekod FAKTA 04 yang dimeterai, bukan terhadap ingatan agensi
  yang mungkin-telah-berkembang sekarang.

## Apa yang kit ini TIDAK gantikan

- Federal Rules of Evidence (atau mana-mana kod bukti negeri).
- Piawai kebolehpercayaan Daubert / Frye untuk keterangan pakar.
- SOP forensik dan CMS agensi.
- Obligasi discovery pembelaan di bawah FRCP 16 / Brady / Giglio /
  padanan negeri.
- Perintah mahkamah, usul penindasan, perbicaraan pembuktian, atau
  sebarang proses lain yang ditadbir-mahkamah.
- NIST CFTT atau mana-mana rejim ujian-alat yang lain.
- Protokol tapisan-keistimewaan / taint-team agensi.

## Mengapa kit ini wujud dalam v0.4.0+

Ini ialah contoh ke-8 yang berfungsi dihantar bersama myriam-kit.
Ia mengikuti struktur constraint-first yang disahkan oleh autoresearch
yang didokumenkan dalam `~/Genesis/calc/PROMPT_LIBRARY_v0.md` —
varian gesaan constraint-first mencatat skor tertinggi pada rubrik
berwajaran merentas pelbagai domain contoh. Bahagian pembukaan
adalah bahagian penanggung-beban kit; kandungan manifes adalah
bahagian yang mudah.

Reka bentuk kit secara sengaja konservatif terhadap penerbitan
nama-pemeriksa dan agresif terhadap penafian "ini tidak menetapkan
kebolehterimaan". Komuniti forensik mempunyai sejarah terdokumen
diserang kerana kerja forensik mereka; kit lalai kepada kedudukan
yang lebih selamat untuk pemeriksa. Agensi dalam bidang kuasa di
mana penamaan-peribadi awam diperlukan boleh meminda fork mereka
dengan sewajarnya, tetapi penolakan lalai memihak kepada
keselamatan pemeriksa.

## Lesen

Domain awam (CC0). Fork ia. Tiada penghargaan diperlukan.
