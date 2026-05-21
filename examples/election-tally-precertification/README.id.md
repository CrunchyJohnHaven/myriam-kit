# Kit Segel Pra-Sertifikasi Penghitungan Suara Pemilu (Election Tally Pre-Certification Seal Kit)

*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

Sebuah contoh myriam-kit siap pakai untuk dewan canvasser kabupaten
(county boards of canvassers), otoritas pemilu tingkat negara
bagian/provinsi, dan pemantau integritas pemilu yang ingin
menerbitkan segel hasil penghitungan suara yang terjangkar di Bitcoin
dan terbukti tidak diubah (tamper-evident) pada saat persis pengesahan.

**Menutup** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Yang TIDAK dilakukan kit ini (baca dulu)

Segel ini adalah stempel waktu kriptografis atas apa yang disahkan.
Segel ini tidak dapat memverifikasi apakah yang disahkan itu benar.
Mode kegagalan berikut berada **di luar domain segel**:

1. **Kompromi mesin pemungutan suara (voting-machine compromise).**
   Jika firmware telah dirusak atau total suara salah dihitung, segel
   akan menjangkar angka yang keliru dengan integritas tinggi. Segel
   mengamati keluaran dari sistem tabulasi; ia tidak memiliki
   visibilitas ke dalam sistem itu sendiri.

2. **Penekanan suara / pencabutan hak pilih secara struktural (vote
   suppression / structural disenfranchisement).** Penutupan TPS,
   perbedaan penerapan undang-undang identitas, bias tingkat
   penolakan surat suara via pos, dan pembersihan daftar pemilih
   (registration purges) terjadi di hulu pengesahan. Segel mencatat
   surat suara yang dihitung, bukan surat suara yang seharusnya
   dihitung.

3. **Misinformasi pemilu (election misinformation).** Segel tidak
   menghakimi klaim tentang pemilu yang dibuat oleh kandidat, media,
   atau platform. Pengesahan yang tersegel dapat dikutip dalam
   narasi misinformasi semudah dalam pembelaan terhadapnya. Stempel
   waktu kriptografis bersifat netral terhadap konten.

4. **Kecurangan pra-pengesahan selama pengumpulan atau penghitungan
   surat suara (pre-certification fraud during ballot collection or
   counting).** Penyimpangan ballot-harvesting, perusakan kotak suara
   penampungan (drop-box), putusnya rantai kustodi (chain-of-custody)
   selama jendela penghitungan — semuanya terjadi sebelum momen segel.
   Segel tidak dapat mendeteksinya secara retroaktif.

5. **Pemaksaan terhadap otoritas yang mengesahkan (coercion of the
   certifying authority).** Pengesahan di bawah paksaan menghasilkan
   segel kriptografis yang sah atas hasil yang dipaksakan. Segel
   memverifikasi bahwa pejabat menandatangani, bukan mengapa.

6. **Pengesahan yang salah yang tidak pernah dikoreksi kemudian
   (wrong certifications that are never later corrected).** Nilai
   segel bergantung pada proses pencarian kebenaran selanjutnya
   (audit, hitung ulang, litigasi) yang dapat dibandingkan dengan
   segel tersebut. Jika proses semacam itu tidak pernah dijalankan,
   segel berdiri sebagai satu-satunya catatan dan dapat mengeraskan
   kesalahan.

7. **Anomali statistik dan deteksi pola (statistical anomalies and
   pattern detection).** Segel tidak menandai margin yang tidak masuk
   akal, anomali geografis, atau penyimpangan dari hukum Benford
   (Benford-law). Itu adalah tugas analitis terhadap data yang
   tersegel, bukan properti dari segelnya.

8. **Kontestasi di tingkat bawah surat suara dengan jejak audit yang
   tipis (down-ballot races with thin audit trails).** Kontestasi
   yang lebih kecil memiliki pemicu hitung ulang yang lebih lemah;
   satu segel tidak dapat secara bermakna mencakup semua kontestasi
   pada satu surat suara tanpa pengelompokan per kontestasi.

**Bagian batasan jujur (honest-limits) di atas adalah bagian yang
menanggung beban (load-bearing) dari kit ini.** Pejabat yang percaya
bahwa penyegelan sama dengan legitimasi akan menggunakannya sebagai
tameng. Kit ini harus menyatakan dengan jelas: ini adalah *primitif
non-repudiation untuk momen pengesahan*, bukan bukti kebenaran
pemilu.

---

## Apa yang HARUS DITOLAK oleh kit ini untuk disegel

Kit ini dikonfigurasi untuk menolak pola fakta berikut bahkan jika
pengguna dengan otoritas penandatanganan yang sah mengirimkannya:

- **Identifikasi pemilih individu.** Tidak ada fakta yang boleh
  menyebut nama pemilih, menghubungkan surat suara ke pemilih, atau
  mengungkap bidang apa pun yang dapat mengidentifikasi ulang
  seseorang.
- **Keputusan pencocokan tanda tangan per surat suara.** Penuh PII;
  penyegelan menciptakan catatan permanen atas keputusan yang
  nantinya dapat ditantang.
- **Fakta apa pun yang publikasinya akan mengidentifikasi pemilih
  yang rentan.** Termasuk hasil di tingkat TPS pada TPS yang sangat
  kecil sehingga pilihan suara dapat disimpulkan (biasanya <50 surat
  suara).
- **Penghitungan yang disegel sebelum semua surat suara dihitung.**
  Kit menolak hitungan parsial yang disajikan sebagai "hasil
  penghitungan." Pra-sertifikasi (pre-certification) berarti *semua
  surat suara dihitung, sebelum pengesahan resmi* — bukan *selama
  penghitungan*.
- **Pengesahan provisional atau kondisional.** Segel harus
  mencerminkan fakta, bukan sebuah syarat.
- **Hitungan yang mengecualikan kohort dengan litigasi yang masih
  berjalan** tanpa fakta pendamping (companion-fact) tersegel
  eksplisit yang mengungkap pengecualian tersebut.
- **Penyegelan oleh siapa pun selain otoritas yang mengesahkan**
  untuk yurisdiksi tersebut.

Penolakan itu sendiri dapat disegel sebagai fakta ("Otoritas ini
meminta penyegelan atas X; kit menolak berdasarkan aturan-penolakan
Y"), sehingga menciptakan catatan publik atas upaya penyalahgunaan.

---

## Apa yang DISEGEL oleh kit ini

8 fakta pada momen pengesahan:

1. **Pemberitahuan contoh (example notice)** — menyatakan publikasi
   ini sebagai contoh (atestasi nyata menghapus atau mengganti
   bagian ini).
2. **Identifikasi yurisdiksi (jurisdiction identification)** —
   kabupaten, tanggal pemilu, otoritas yang mengesahkan, pejabat
   yang mengesahkan beserta nama + peran.
3. **Penghitungan suara yang disahkan (certified tally)** — total
   suara per-kontestasi per-kandidat + suara berlebih/kurang
   (over/under-votes) + write-in.
4. **Akuntansi dan rekonsiliasi surat suara (ballot accounting and
   reconciliation)** — total yang masuk, total yang ditabulasi,
   total yang ditolak per kategori, rincian per moda, penyebut
   pemilih terdaftar.
5. **Manifest peralatan dan jejak audit (equipment and audit-trail
   manifest)** — model tabulator + hash firmware, hash berkas CVR,
   hash arsip citra surat suara, hash log kustodi, hash kebijakan
   pencocokan tanda tangan.
6. **Ambang batas dan pemicu pada saat pengesahan (thresholds and
   triggers at certification)** — ambang pencocokan tanda tangan
   yang berlaku, ambang pemicu hitung ulang, margin sebenarnya per
   kontestasi, komitmen seed RLA (seed commitment).
7. **Pengungkapan pendamping dan catatan penolakan (companion
   disclosures and refusal record)** — litigasi yang sedang
   berjalan, anomali pasca-penghitungan yang sedang ditinjau,
   kohort yang dikecualikan, anggota dewan yang berbeda pendapat;
   daftar eksplisit pola yang ditolak kit untuk disegel.
8. **Principal penandatangan (signing principal)** — identifikasi
   Dewan Canvasser (Board of Canvassers) + nama setiap penandatangan
   dan partai + info kunci kriptografis.

Setiap fakta diakhiri dengan konvensi gerbang-penolakan
(refusal-gate): *"Fakta ini hanya menegaskan X. Ia tidak menegaskan
Y"* (di mana Y adalah mode kegagalan terdekat dari bagian "TIDAK
dilakukan" di atas).

---

## Yang dipertahankan oleh kit ini

- **Revisi diam-diam pasca-pengesahan terhadap total suara** —
  setiap perubahan bilangan bulat pada FACT 03 menghasilkan SHA-256
  yang berbeda, akar Merkle yang berbeda, dan gagal verifikasi OTS.
- **"Surat suara yang ditemukan" yang diam-diam diserap** —
  aritmatika rekonsiliasi pada FACT 04 dikunci pada saat pengesahan.
- **Klaim penggantian firmware** — FACT 05 membekukan manifest
  peralatan pada saat pengesahan.
- **Penggantian artefak audit pasca-pengesahan** — manifest hash di
  FACT 05 menangkap setiap perubahan pasca-pengesahan terhadap CVR,
  citra surat suara, log kustodi, atau kebijakan pencocokan tanda
  tangan.
- **Pendefinisian ulang ambang batas dan pemicu** — FACT 06
  membekukan aturan yang berlaku pada saat pengesahan (ambang
  pencocokan tanda tangan, pemicu hitung ulang, batas risiko RLA).

## Kasus historis atau hampir-historis yang akan terbantu oleh kit ini

Kit ini akan menghasilkan jangkar yang berguna — *bukan perbaikan* —
dalam kasus-kasus berikut:

- **Antrim County, Michigan (2020).** Hasil tidak resmi awal
  menunjukkan pertukaran kandidat (candidate-swap) yang kemudian
  dikoreksi menjadi hasil yang berlawanan. Segel pra-koreksi akan
  memberikan rujukan publik atas apa yang dinyatakan dalam
  pengumuman awal vs. apa yang dinyatakan dalam koreksi, dengan
  keduanya dijamin secara kriptografis.
- **Maricopa County, Arizona (2020–2022).** Beberapa iterasi total
  yang dihitung ulang/diperiksa ulang beredar. Segel pada momen
  pengesahan akan memberikan titik referensi yang jelas yang
  terhadapnya setiap penghitungan selanjutnya dapat dibandingkan.
- **Florida 2000 (canvass Bush v. Gore).** Total per-kabupaten yang
  disahkan bergeser di bawah tekanan hitung ulang; segel
  pra-hitung-ulang per-kabupaten akan menjaga apa yang disahkan
  setiap kabupaten sebelum prosedur hitung ulang manual dimulai.
- **Berbagai pemilu di luar negeri dengan "koreksi" pasca-pengesahan
  yang terdokumentasi.** Tidak terikat pada satu yurisdiksi.

Kit ini TIDAK akan menyelesaikan sengketa mendasar tentang
integritas mesin pada 2020, sengketa kebijakan surat suara via pos,
atau pemilu apa pun di mana pertanyaan intinya adalah fakta yang
diperdebatkan, bukan catatan yang diperdebatkan.

## Kapan menggunakan kit ini

- Yurisdiksi Anda memiliki proses pengesahan yang stabil dan
  teraudit serta ingin menambahkan jangkar publik yang tidak dapat
  diubah.
- Anda mengantisipasi pengawasan pasca-pengesahan dan ingin
  memiliki titik referensi yang terbukti tidak diubah.
- Anda memiliki kewenangan hukum untuk menerbitkan kumpulan fakta
  yang terdaftar tanpa membuka PII.
- Anda memiliki proses audit atau RLA paralel sehingga segel dapat
  dibandingkan dengan keluaran pencarian kebenaran.

## Kapan TIDAK menggunakan kit ini

- **Jangan gunakan sebagai pengganti audit pembatas risiko
  (risk-limiting audits, RLA), hitung ulang manual, atau audit
  pasca-pemilu.** Kit ini bersifat *tambahan*, bukan pengganti.
- **Jangan gunakan jika pejabat yang mengesahkan bukanlah pengambil
  keputusan yang sebenarnya** (menciptakan atribusi yang keliru).
- **Jangan gunakan di tengah-tengah tabulasi.** Kit ini secara
  khusus untuk momen pengesahan. Segel atas hitungan parsial
  menciptakan titik referensi yang menyesatkan.
- **Jangan gunakan untuk mengklaim bahwa pemilu adalah adil, akurat,
  atau sah** — kit ini tidak dapat melakukan itu.
- **Jangan gunakan di bawah tekanan untuk menyegel lebih awal dari
  momen pengesahan, atau untuk menghilangkan pengungkapan fakta
  pendamping.** Tolak, lalu segel penolakan tersebut.
- **Jangan gunakan sebagai teater legitimasi (legitimacy theater).**
  Segel atas penghitungan yang dicurangi adalah catatan publik
  permanen atas kecurangan, bukan pembelaan terhadapnya. Primitif
  ini memotong dua arah; itulah kejujurannya.

## Cara mem-fork kit ini untuk pengesahan nyata

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # ganti konten fiktif dengan yang sebenarnya
bash build/seal.sh     # segel PADA atau setelah tanda tangan pengesahan resmi
python3 build/verify.py
```

**Pengaturan waktu yang krusial:** segel PADA momen pengesahan, BUKAN
sebelumnya. Segel sebelum pengesahan resmi menciptakan catatan "ini
adalah hasil resmi" yang positif-palsu (false-positive). Segel
setelahnya adalah non-repudiation konvensional.

## Integrasi dengan infrastruktur pemilu yang ada

- **Pengesahan Dewan Pemilu Negara Bagian (State Boards of Elections)
  / EAC.** Kit menerbitkan bersamaan dengan dokumen pengesahan resmi.
  Ia tidak menggantikan pengesahan menurut undang-undang.
- **Audit pembatas risiko (RLA).** Hash CVR di FACT 05 adalah hash
  yang sama dengan yang dikonsumsi alat RLA. Segel mengikat CVR
  yang diaudit ke total yang disahkan.
- **Prosedur hitung ulang.** Hitung ulang yang dipicu menurut
  undang-undang negara bagian menghasilkan kumpulan fakta tersegel
  BARU (stempel waktu berbeda, hash berbeda, yurisdiksi sama).
  Kedua segel berdampingan; tidak ada yang menimpa yang lain.
  Selisih (diff) antara kedua segel adalah catatan publik tentang
  apa yang diubah oleh hitung ulang tersebut.
- **Election Markup Language (EML) dan Common Data Format (CDF).**
  Isi fakta sebaiknya dapat diturunkan dari keluaran EML/CDF yang
  sudah ada di yurisdiksi tersebut agar kit tetap agnostik terhadap
  format data.
- **Penandatanganan bipartisan oleh dewan canvasser.** Varian
  multi-tanda-tangan (multi-signature) direkomendasikan untuk
  yurisdiksi dengan dewan canvasser yang berimbang secara partai.

## Yang TIDAK digantikan oleh kit ini

- Pengesahan menurut undang-undang pemilu negara bagian
- Sertifikasi sistem pemungutan suara oleh EAC
- Audit pembatas risiko (RLA) / hitung ulang manual
- Prosedur hitung ulang dan audit pasca-pemilu
- Perintah pengadilan atau litigasi sengketa pemilu

## Mengapa kit ini ada di v0.3.0+

Ini adalah contoh ke-6 yang disertakan dengan myriam-kit. Kit ini
dihasilkan melalui proses autoresearch bergaya Karpathy yang
didokumentasikan di `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`.
Tiga varian prompt (imitasi / dari prinsip pertama / yang
mengutamakan kendala) menghasilkan kerangka kit paralel; varian yang
mengutamakan kendala mendapat skor tertinggi pada rubrik yang diberi
bobot, dan kit akhir mensintesis strukturnya dengan kohesi dari
varian imitasi dan detail operasional dari varian prinsip-pertama.

Autoresearch itu sendiri didokumentasikan sebagai pola prompt di
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` untuk penggunaan di masa depan.

## Lisensi

Domain publik (CC0). Fork. Tidak perlu mencantumkan kredit.
