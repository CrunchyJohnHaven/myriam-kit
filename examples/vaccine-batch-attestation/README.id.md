*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

# Kit Atestasi Batch Vaksin

Sebuah contoh myriam-kit siap pakai untuk produsen vaksin, otoritas
penjaminan mutu, dan lembaga kesehatan masyarakat yang ingin
menerbitkan segel rilis batch yang berlabuh pada Bitcoin dan terbukti
tidak diubah (tamper-evident).

## Apa yang dipertahankan kit ini

**Mode kegagalan yang ditangkap oleh segel:**

- **Modifikasi diam-diam atas hasil uji rilis secara surut.** Kedelapan
  PDF uji rilis dalam contoh ini di-hash. Hashing ulang setelah rilis
  akan mengungkap setiap modifikasi.
- **Sengketa mengenai spesifikasi mana yang berlaku saat rilis.** FACT
  02 yang disegel berisi identifikasi batch kanonik dan hash catatan
  produksi. Sengketa masa depan yang berbunyi "spesifikasinya selalu X"
  memiliki jangkar publik.
- **Minimalisasi cakupan penarikan secara diam-diam.** Komitmen
  farmakovigilans dalam FACT 05 disegel; kegagalan untuk memenuhinya
  dapat diamati secara publik.
- **Penetapan ulang spesifikasi secara surut untuk batch yang berada di
  luar spesifikasi.** Jika hasil uji rilis sebenarnya LULUS marginal
  yang kemudian direklasifikasi sebagai GAGAL pasca-rilis, hash laporan
  yang disegel membuktikan apa yang sebenarnya dinyatakan oleh PDF
  hasil aslinya.

**Mode kegagalan yang TIDAK dicakup:**

- Kecurangan dalam proses produksi itu sendiri (segel menjangkar hasil
  uji, bukan integritas produksi).
- Kejadian yang merugikan yang merupakan konsekuensi biologis dari
  batch yang sebenarnya lulus uji (segel tidak menyatakan keamanan
  klinis, hanya integritas dokumentasi).
- Sengketa mengenai versi spesifikasi regulasi yang otoritatif.

## Kapan menggunakan kit ini

Pertimbangkan untuk menyegel rilis batch jika:

- Anda adalah produsen vaksin yang ingin menunjukkan integritas
  forensik atas catatan rilis melebihi yang dipersyaratkan regulator
- Anda adalah tim QA yang mengadopsi praktik "terbitkan apa yang kami
  atestasikan"
- Anda adalah produsen skala kecil/nasional di yurisdiksi dengan
  infrastruktur regulasi yang lebih lemah, dan ingin menjangkar catatan
  batch terhadap verifier global
- Anda adalah lembaga kesehatan masyarakat atau LSM yang menjalankan
  program produksi vaksin non-komersial (misalnya untuk penyakit yang
  terabaikan)

## Preseden mortalitas historis

- **Kontaminasi heparin (2008, Tiongkok):** kondroitin sulfat
  tersulfasi-berlebih palsu dalam batch heparin. Manifes uji rilis yang
  disegel akan membuat modifikasi diam-diam pasca-rilis terhadap
  catatan pengujian dapat dideteksi secara kriptografis.
- **Sianida Tylenol (1982):** sengketa surut mengenai titik asal
  pemalsuan. Hash catatan produksi yang disegel menjangkar keadaan
  pra-distribusi.
- **Berbagai penarikan batch vaksin** di mana pertanyaan "apakah batch
  ini benar-benar pernah diuji dengan benar" menjadi perdebatan
  bertahun-tahun kemudian.

Kit ini BUKAN solusi untuk SETIAP kasus tersebut secara ketat — tetapi
dalam setiap kasus, atestasi batch yang disegel akan menyediakan
garis waktu forensik yang lebih bersih.

## Cara mem-fork kit ini untuk batch nyata

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # ganti konten fiktif dengan batch nyata
bash build/seal.sh        # SEGEL SEBELUM distribusi dimulai
python3 build/verify.py   # konfirmasi
```

**WAKTU YANG KRITIS**: segel pada saat rilis QA, SEBELUM batch
didistribusikan. Segel setelah distribusi secara forensik lebih lemah.

## Integrasi dengan infrastruktur farmasi yang ada

- **Pengajuan eCTD (FDA / EMA):** URL publikasi atau IPFS CID yang
  disegel dapat dirujuk dalam Modul 3 (kualitas)
- **Prakualifikasi WHO:** manifes yang disegel menunjukkan rantai
  pengujian pra-rilis kepada yurisdiksi non-FDA/EMA
- **Umpan balik farmakovigilans:** FACT 05 mewajibkan produsen untuk
  melakukan pelaporan agregat jumlah AE yang disegel pada bulan ke-6
  dan ke-12
- **Sistem penarikan (RxConnect, MedWatch):** jika penarikan diperlukan,
  cakupan penarikan itu sendiri disegel di bawah MYRIAM, memberikan
  verifikasi publik bahwa semua lot yang didistribusikan sedang
  ditangani

## Apa yang TIDAK digantikan oleh kit ini

- Pengajuan regulasi FDA / EMA / WHO
- Jejak audit GMP (segel menjangkar HASIL, bukan catatan proses mentah)
- Basis data farmakovigilans (VAERS / EudraVigilance)
- Sistem koordinasi penarikan

## Lisensi

Domain publik (CC0). Fork bebas. Tanpa atribusi yang diwajibkan.
