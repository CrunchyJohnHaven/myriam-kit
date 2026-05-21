*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

# Kit Penyegelan Manifest Whistleblower

Sebuah contoh myriam-kit siap-pakai bagi whistleblower yang menghadapi mode kegagalan spesifik di mana **bukti dikubur, disunting, atau dipersengketakan oleh perantara di antara whistleblower dan publik**. Kasus historis kanonik yang dipertahankan oleh kit ini:

- Boeing 737 MAX (laporan keselamatan internal direndahkan/dikubur)
- Theranos (kekhawatiran hasil uji laboratorium ditekan selama bertahun-tahun)
- Laporan inspektur FDA yang disunting setelah diserahkan
- Frances Haugen / Facebook (manifest tersegel akan membuktikan bahwa dokumen tersebut autentik dan ada pada waktu yang diklaim)

Yang dipertahankan kit ini (dalam istilah protokol):

- T1–T3 dalam [FACT 05](facts/05_threat_model.txt): perselisihan publik atas isi dokumen, klaim bahwa dokumen tidak tersegel pada waktu yang diklaim, klaim pemalsuan retroaktif.
- T9: pihak ketiga menyerahkan salinan yang telah diubah kepada jurnalis.

Yang **tidak** dipertahankan kit ini:

- Pembalasan pribadi terhadap whistleblower (T7).
- Tekanan terhadap whistleblower untuk menarik kembali (T4, dimitigasi sebagian oleh FACT 07 yang membuat penarikan diam-diam menjadi dapat dideteksi publik).
- Tindakan hukum terhadap whistleblower atas pengungkapan itu sendiri (T5).
- Penghancuran karakter whistleblower (T8).
- Perantara yang diam-diam menjatuhkan cerita itu (T10).

Jika Anda adalah whistleblower yang sedang mempertimbangkan untuk menggunakan kit ini, **bacalah seluruh README ini terlebih dahulu**. Protokol adalah sebuah alat. Protokol bukanlah pengganti penasihat hukum, jurnalis, regulator, atau keamanan operasional yang cermat (operational security).

## Apa yang dihasilkan kit ini

Sebuah *manifest* bukti yang tersegel secara kriptografis (bukan bukti itu sendiri) yang membuktikan bahwa:

1. Byte-byte spesifik dari setiap berkas bukti ada pada saat penyegelan.
2. Penyegelan terjadi pada atau sebelum waktu tertentu (melalui atestasi Bitcoin OTS).
3. Provenans, tuduhan, model ancaman, protokol penerima, dan komitmen tanpa-penarikan-diam-diam dideklarasikan bersamaan.

Dokumen yang mendasarinya tetap berada dalam penguasaan Anda hingga Anda mengirimkannya kepada penerima. Penerima memverifikasi bahwa mereka menerima byte yang sama dengan yang Anda segel.

## Kapan menggunakan kit ini

Anda sebaiknya mempertimbangkan untuk menyegel sebuah manifest **sebelum** mengirimkan bukti kepada jurnalis, regulator, atau pengacara, jika semua kondisi berikut benar:

- Anda memiliki bukti dalam bentuk digital (PDF, email, gambar, dll.) yang ingin dilestarikan agar autentik byte demi byte.
- Anda memperkirakan bahwa perantara dapat mengubah, mempersengketakan, atau mengubur bukti.
- Anda dapat menjaga dokumen yang mendasarinya tetap dalam penguasaan Anda hingga saat transmisi.
- Anda dapat mempublikasikan manifest secara publik **tanpa** mengungkapkan isi dokumen (hanya hash yang publik).
- Anda telah menimbang risiko menjadi dapat diidentifikasi secara publik sebagai whistleblower (field signing-principal). Jika anonim, gunakan nama samaran (pseudonym) secara konsisten di seluruh publikasi terkait.
- Anda telah berkonsultasi dengan pengacara mengenai hukum perlindungan whistleblower di yurisdiksi Anda.

## Kapan TIDAK menggunakan kit ini

JANGAN menggunakan kit ini jika:

- Dokumen-dokumennya sendiri memuat informasi pribadi tentang pihak ketiga (pasien, pelanggan, karyawan) yang tidak boleh dijadikan hash publik. Hash versi yang telah diredaksi, bukan aslinya.
- Tindakan mempublikasikan manifest itu sendiri akan mengidentifikasi whistleblower dengan cara yang belum mereka setujui.
- Anda belum berkonsultasi dengan pengacara. Protokol adalah alat; hukum perlindungan whistleblower bersifat khas-yurisdiksi dan hidup di luar protokol.
- Anda mungkin ingin menarik kembali salah satu tuduhan di kemudian hari. Segel bersifat permanen; koreksi tersegel baru adalah satu-satunya cara yang jujur untuk merevisi.
- Anda melakukan ini di bawah paksaan atau tekanan waktu. Protokol memperkuat paksaan (amplifies coercion); gerbang penolakan (myriam-kit `SPEC §8`) berlaku bagi whistleblower sebagaimana juga bagi penerbit.

## Cara mem-fork kit ini untuk pengungkapan nyata

```bash
# 1. Salin contoh ini ke direktori baru
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Hapus konten fiktif; ganti dengan fakta nyata Anda.
# Setiap berkas di bawah facts/ adalah satu fakta. Baca setiap berkas dan ganti.
$EDITOR facts/01_example_notice.txt   # ubah ke pernyataan pengantar yang nyata
$EDITOR facts/02_provenance.txt       # provenans nyata dari bukti Anda
$EDITOR facts/03_evidence_manifest.txt # hash dokumen nyata Anda dan daftarkan
$EDITOR facts/04_allegation_summary.txt # tuduhan nyata Anda
$EDITOR facts/05_threat_model.txt     # respons yang diperkirakan secara nyata
$EDITOR facts/06_recipient_protocol.txt # sesuaikan untuk penerima Anda
$EDITOR facts/07_no_retraction_commitment.txt # deklarasi tanpa-penarikan Anda
$EDITOR facts/08_signing_principal.txt # identitas penanda tangan nyata (atau nama samaran)

# 3. Perbarui site/index.html untuk merefleksikan fakta nyata.
# Skrip seal.sh TIDAK otomatis mengisi HTML; pengeditan manual
# adalah langkah peninjauan manusia (human-review).
$EDITOR site/index.html

# 4. Segel.
bash build/seal.sh
# Output: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Verifikasi secara lokal.
python3 build/verify.py

# 6. Publikasikan manifest (BUKAN dokumen) ke salah satu dari:
#    - Host statis yang Anda kendalikan (Cloudflare Pages, GitHub Pages, dll.)
#    - Jaringan IPFS pada CID yang dicetak
#    - Keduanya (direkomendasikan)

# 7. Secara terpisah, kirimkan dokumen yang mendasarinya kepada penerima
#    melalui kanal aman pilihan Anda (Signal, SecureDrop, dll.).
#    Penerima memverifikasi hash berkas terhadap manifest Anda.
```

## Menghitung hash untuk berkas bukti nyata

Untuk meng-hash sebuah berkas dokumen dengan SHA-256:

```bash
shasum -a 256 my_document.pdf
```

64 karakter heksadesimal pertama adalah SHA-256-nya. Letakkan itu pada manifest.

Anda dapat meng-hash banyak berkas sekaligus:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Itu menyediakan data untuk `facts/03_evidence_manifest.txt`.

## Catatan keamanan operasional

Protokol MYRIAM TIDAK menyediakan keamanan operasional (operational security). Ia menyediakan *ketahanan evidentiari*. Anda masih membutuhkan:

- Kanal komunikasi yang aman kepada pengacara Anda ([Signal](https://signal.org/), tatap muka, atau kanal aman yang sudah ditetapkan pengacara Anda)
- Lokasi penyimpanan yang aman untuk dokumen yang mendasari (terenkripsi saat tidak digunakan, tidak pada layanan cloud yang dapat diakses majikan Anda)
- Perangkat yang bersih untuk penyegelan (laptop pribadi yang tidak terkait akun majikan; sebaiknya yang hanya digunakan untuk tujuan ini)
- Jaringan yang bersih untuk publikasi (bukan jaringan majikan Anda, juga bukan IP rumah Anda jika majikan Anda dapat mensubpoena ISP Anda)

Bacaan yang direkomendasikan tentang keamanan operasional bagi whistleblower:

- [Dokumentasi SecureDrop dari The Intercept](https://securedrop.org/)
- [Sumber daya Freedom of the Press Foundation](https://freedom.press/)
- [Panduan pertahanan diri dari pengawasan dari EFF](https://ssd.eff.org/)

Konsultasikan mereka SEBELUM Anda memulai proses penyegelan. Protokol tidak melindungi terhadap pilihan opsec yang buruk yang dibuat sebelum protokol dijalankan.

## Apa yang harus diketahui penerima

Kirimkan README ini kepada penerima bersama dengan manifest yang tersegel. Manifest itu sendiri memuat protokol penerima (FACT 06), tetapi README memperluas peran penerima:

- **Jurnalis**: verifikasi integritas manifest itu sendiri terlebih dahulu. Kemudian minta dokumen melalui kanal aman terpisah. Verifikasi bahwa SHA-256 setiap dokumen cocok dengan manifest sebelum publikasi. JANGAN mempublikasikan dokumen tanpa persetujuan whistleblower; publikasikan keberadaan manifest yang tersegel dan kesimpulan verifikasi Anda.
- **Regulator**: proses verifikasi yang sama. Manifest tersegel + dokumen yang cocok adalah bentuk evidentiari terkuat yang tersedia di luar pengumpulan rantai-pengamanan formal.
- **Pengacara**: manifest tersegel menyediakan penjangkaran forensik atas keberadaan dokumen pada waktu yang diklaim. Apakah ia memenuhi aturan-pembuktian yurisdiksi tertentu adalah penentuan yang harus Anda buat.

## Apa yang BUKAN kit ini

- Bukan pengganti penasihat hukum.
- Bukan jaminan bahwa siapa pun akan bertindak atas pengungkapan Anda.
- Bukan perlindungan terhadap pembalasan.
- Bukan otentikasi terhadap isi dokumen (hanya terhadap byte-pada-saat-penyegelan).
- Bukan cara untuk berkomunikasi secara anonim dengan siapa pun — segel bersifat publik; jika nama signing-principal Anda nyata, Anda teridentifikasi.

## Penutup

Sebuah manifest tersegel adalah hal yang kecil. Ia adalah satu aliran byte yang membuktikan bahwa sekumpulan aliran byte yang lebih besar ada dalam bentuk tertentu pada waktu tertentu. Kekecilan itulah kekuatannya: ia melakukan hanya satu hal, dan ia melakukan satu hal itu sepanjang hidup blockchain Bitcoin.

Jika Anda membaca ini karena Anda sedang mempertimbangkan menjadi seorang whistleblower, mohon: bicaralah dengan pengacara terlebih dahulu. Gunakan panduan keamanan operasional di atas. Kemudian, jika dan hanya jika semua pertimbangan hulu itu telah teratur, pertimbangkanlah kit ini sebagai tulang punggung kriptografis dari pengungkapan Anda. Kripto adalah bagian yang mudah. Segala sesuatu di hulu kripto adalah tempat risiko nyata berada.

## Lisensi

Domain publik (CC0). Fork-lah. Tingkatkan. Gunakan tanpa meminta izin.
