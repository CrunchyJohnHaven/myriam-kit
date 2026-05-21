*Terjemahan bahasa Indonesia — untuk versi asli bahasa Inggris, lihat [SPEC.md](SPEC.md)*

# Spesifikasi Protokol MYRIAM-kit

## 0. Tujuan

Dokumen ini menentukan protokol minimal untuk menerbitkan sekumpulan
kecil fakta teks dalam bentuk yang terbukti tidak diubah (tamper-evident)
dan dapat diverifikasi secara kriptografis, yang bertahan walaupun ada
penghapusan paksa oleh penyedia hosting tunggal mana pun.

Ini adalah generalisasi dari protokol yang pertama kali diterapkan di
[disclosure.host](https://disclosure.host) dengan nama "MYRIAM v1."

## 1. Bukan tujuan

- Penyimpanan rahasia. Segala sesuatu bersifat publik secara konstruksi.
- Dataset besar. Lewat ~20 fakta, bentuk protokol ini menjadi salah.
- Publikasi waktu nyata. Setiap publikasi adalah peristiwa penyegelan
  yang diskret.
- Penarikan. Protokol ini bersifat append-only pada level versi.

## 2. Model fakta

Sebuah FAKTA adalah berkas teks UTF-8 dengan:

- Pola nama berkas: `NN_short_name.txt` dengan NN sebagai indeks dua
  digit yang diisi nol di depan, dimulai dari 01.
- Bentuk kanonis: byte sebagaimana ditulis, tanpa normalisasi.
- Hash per-fakta: hex huruf kecil dari `SHA-256(file_bytes)`.

HIMPUNAN fakta adalah daftar terurut dari semua berkas yang cocok dengan
pola di bawah `facts/`, diurutkan secara leksikografis.

Batasan: setiap isi fakta SEBAIKNYA dirumuskan sebagai *peristiwa
penamaan* atau *peristiwa pernyataan* yang dapat diatribusikan kepada
pihak tertentu. Klaim ontologis ("bulan adalah batu") meruntuhkan gerbang
keterverifikasian; hanya peristiwa publikasinya yang dapat diverifikasi,
bukan klaimnya. "X telah menyatakan Y" adalah bentuk yang tepat. "Y
adalah benar" tidak.

## 3. Akar Merkle

Gaya Bitcoin, seperti pada v0 dari protokol MYRIAM yang diterapkan:

1. Daun: hash SHA-256 per-fakta dalam urutan himpunan fakta.
2. Jika sebuah tingkat memiliki jumlah node ganjil, duplikatkan node
   terakhir.
3. Hash berpasangan untuk node bersebelahan:
   `parent = SHA-256(left_bytes || right_bytes)`, dengan `left_bytes`
   dan `right_bytes` adalah nilai hash mentah 32-byte (bukan
   representasi hex-nya).
4. Ulangi hingga tersisa satu node. Itulah akar Merkle.

Akar diterbitkan sebagai hex huruf kecil tanpa newline di akhir.

### 3.1 Vektor uji

| Vektor | Daun (byte UTF-8 yang di-hash) | Akar yang diharapkan (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Setiap implementasi yang patuh HARUS mereproduksi vektor-vektor ini.
Vektor diturunkan dari `lib/build.py` yang sesungguhnya dan dapat
dihasilkan ulang dengan skrip tersebut.

## 4. Komitmen Bitcoin

Akar Merkle dikomitkan ke blockchain Bitcoin melalui
[OpenTimestamps](https://opentimestamps.org). Kebijakan default adalah:

> Stempel terhadap setidaknya dua operator kalender di bawah kendali
> administratif yang independen.

Tanda terima yang memenuhi kebijakan ini dapat diverifikasi oleh
siapa pun yang dapat menjalankan `ots verify <receipt>.ots` dan
menjangkau jalur upgrade salah satu kalender.

Pasangan operator default yang disertakan di `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementasi BOLEH menggunakan operator yang berbeda. Kebijakan
keberagaman saksi (≥2 operator independen) bersifat normatif; operator
spesifiknya tidak.

## 5. Mirror beralamat-konten

Direktori `site/` yang berisi halaman yang diterbitkan dan berkas-berkas
fakta SEBAIKNYA ditambahkan ke IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

CIDv1 yang dihasilkan (codec dag-pb) adalah alamat-konten dari
publikasi tersebut. Ia deterministik dari isi byte `site/`. Modifikasi
apa pun terhadap berkas mana pun di bawah `site/` menghasilkan CID
yang berbeda.

Mem-pin ke layanan tambahan di luar node lokal penerbit sangat
disarankan untuk daya tahan; spesifikasi ini tidak mewajibkan layanan
tertentu.

## 6. Versi

Protokol ini bersifat **append-only pada level versi**. Setiap
perubahan memerlukan versi tersegel yang baru:

- Sebuah revisi spesifikasi yang baru (atau tidak berubah)
- Sebuah himpunan fakta baru, yang BOLEH mewarisi fakta yang tidak
  diubah dari versi sebelumnya
- Sebuah akar Merkle baru
- Sebuah tanda terima OpenTimestamps yang baru
- Sebuah CID IPFS yang baru

Semua versi sebelumnya tetap diterbitkan pada URL berversi. Perubahan
pada fakta v(N) mana pun memerlukan v(N+1), dengan kedua versi tetap
terlihat dan dapat diverifikasi ulang.

## 7. Verifikasi

Pihak ketiga mana pun dapat memverifikasi integritas publikasi dengan:

1. Mengunduh berkas-berkas fakta dan menghitung ulang hash SHA-256
   per-fakta.
2. Menghitung ulang akar Merkle sesuai §3 dan membandingkannya dengan
   akar yang diterbitkan.
3. Memverifikasi tanda terima OpenTimestamps terhadap blockchain
   Bitcoin untuk setidaknya satu atestasi penuh dari satu kalender.
4. Menghitung ulang CID IPFS secara independen melalui
   `ipfs add -r --cid-version=1` dan membandingkannya dengan CID yang
   diterbitkan.

`lib/verify.py` melakukan langkah 1–3 tanpa dependensi eksternal di
luar stdlib Python dan klien `ots`. Langkah 4 memerlukan klien `ipfs`.

## 8. Gerbang penolakan

Sebuah publikasi DILARANG menyertakan fakta yang:

- Mengidentifikasi pihak ketiga privat yang belum menyetujui untuk
  disebutkan namanya.
- Menyajikan hipotesis sebagai konfirmasi.
- Tidak dapat direduksi menjadi peristiwa penamaan/pernyataan yang
  dapat diverifikasi atau artefak kriptografis.
- Memiliki ekspektasi yang wajar untuk meningkatkan kematian yang
  dapat dicegah saat dipublikasikan.

Aturan keempat adalah yang menanggung beban. Aturan ini ditegakkan
pada langkah peninjauan manusia oleh penerbit. Tidak ada penegakan
gerbang penolakan pada tingkat protokol; protokol menerbitkan byte
apa pun yang diberikan kepadanya. Penerbitlah yang bertanggung jawab
atas gerbang tersebut.

## 9. Pernyataan jujur tentang batasan

- **Dapat dideteksi, bukan tidak mungkin.** Protokol ini membuat
  tampering dapat dideteksi, bukan tidak mungkin. Penyerang yang
  bertekad tetap dapat menggantikan dengan publikasi berbeda dan
  meyakinkan sebagian pembaca bahwa itulah yang asli. Nilai protokol
  ini adalah bahwa penggantian tersebut menjadi dapat ditunjukkan
  secara kriptografis kepada siapa pun yang menjalankan pemeriksaan.
- **Tidak ada pertahanan terhadap penerbitan ketidakbenaran.** Jika
  penerbit menyegel fakta yang menyatakan "X terjadi" sementara X
  tidak terjadi, protokol menyegel klaim yang salah itu dengan
  kesetiaan yang sama seperti ketika ia menyegel yang benar. Protokol
  membuktikan apa yang *diterbitkan*, bukan apa yang *benar*.
- **Penandatanganan oleh satu pihak.** v1 dari MYRIAM yang diterapkan
  menggunakan satu principal penandatangan. Penandatanganan
  multi-pihak adalah pekerjaan masa depan.
- **Daya tahan pinning.** Mem-pin IPFS hanya pada node penerbit
  memberikan "tersedia selama laptop saya menyala + caching gateway
  yang oportunistik." Daya tahan jangka panjang memerlukan pin
  redundan di berbagai layanan independen.

Batasan-batasan ini dinyatakan di sini agar tidak ada pembaca yang
beranggapan bahwa protokol memberikan lebih dari yang sebenarnya.
