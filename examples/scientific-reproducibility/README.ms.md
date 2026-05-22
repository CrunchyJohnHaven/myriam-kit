*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

# Kit Kebolehulangan Saintifik

Satu contoh myriam-kit turnkey untuk kumpulan penyelidikan, jurnal, dan
institusi yang memfokuskan kepada kebolehulangan yang ingin menerbitkan
manifes kebolehulangan yang berlabuh pada Bitcoin dan tahan
gangguan bersama-sama dengan kertas kerja atau prapenerbitan.

## Apa yang dihasilkan oleh kit ini

Penerbitan yang dimeterai mengandungi, untuk satu kajian:

1. Pengenalan kajian (tajuk kertas, pengarang, institusi, penaja, COI)
2. **SHA-256 arkib data mentah** — dataset kanonik
3. **Hash saluran paip analisis** — skrip + cap imej Docker +
   kebergantungan yang dipinkan
4. **Hash himpunan output yang dijangka** — apa yang sepatutnya
   dihasilkan oleh pengulang yang setia
5. Protokol pengulangan + komitmen penerbitan pasca-keputusan
6. Prinsipal yang menandatangani

Meterai itu dimaksudkan untuk peringkat **pra-analisis**: data dibekukan,
saluran paip dimuktamadkan, output yang dijangka dihitung, SEMUA sebelum
sebarang keputusan dilihat untuk tujuan menulis kertas itu.

## Apa yang dipertahankan oleh kit ini

**Mod kegagalan yang ditangkap oleh meterai:**

- **p-hacking**: perubahan pasca-hoc kepada analisis selepas melihat
  keputusan boleh dikesan melalui perbezaan antara FAKTA 04 yang
  dimeterai dan saluran paip yang diterbitkan.
- **HARKing** (Hipotesis Selepas Keputusan Diketahui): hipotesis
  pra-pendaftaran dalam FAKTA 02 adalah bait-stabil.
- **Manipulasi data pasca-kertas**: meng-hash semula arkib data
  terhadap FAKTA 03 mendedahkan sebarang pengubahsuaian.
- **Pergeseran saluran paip**: meng-hash semula saluran paip analisis
  terhadap FAKTA 04 menangkap perubahan senyap.
- **Permainan pengarang**: menambah atau membuang pengarang secara
  senyap selepas penerbitan menjadi boleh dikesan terhadap FAKTA 02
  yang dimeterai.

**Mod kegagalan yang TIDAK ditangkap:**

- Penipuan dalam pengumpulan data mentah (meterai menambat data pada
  titik pemeteraian, bukan pengumpulan)
- Ketidakbolehulangan biologi / empirikal (meterai hanya menambat
  kebolehulangan pengkomputeran)
- Isu saiz sampel atau kesahan populasi (ini adalah persoalan reka
  bentuk kajian)
- Kebenaran dakwaan yang mendasari (meterai menambat apa yang didakwa,
  bukan sama ada dunia sepadan dengan dakwaan itu)

## Bila menggunakan kit ini

Pertimbangkan untuk memeterai jika:

- Anda adalah kumpulan penyelidikan yang menjalankan analisis
  berkepentingan tinggi (percubaan klinikal, penilaian sistem AI,
  kajian replikasi) dan inginkan integriti forensik melebihi cap
  masa OSF / GitHub
- Anda adalah penyelidik awal kerjaya yang inginkan perlindungan
  reputasi yang asimetri: pra-analisis yang dimeterai bermaksud
  kritikan "mereka p-hacked" pada masa hadapan mempunyai pemalsu awam
- Anda adalah penyunting jurnal atau ketua projek replikasi yang
  ingin menggalakkan pra-pendaftaran bertaraf kriptografi untuk
  sebahagian kertas
- Anda bekerja pada analisis di mana tweak pasca-hoc mempunyai akibat
  yang bererti dalam bidang (psikologi, ekonomi tingkah laku,
  penyelidikan perubatan)

## Preseden kematian / kemudaratan sejarah

Kaitan kematian kit ini adalah tidak langsung:

- **Ketidakbolehulangan penyelidikan sel stem / kanser:** beberapa
  kertas telah membawa kepada kemudaratan pesakit melalui percubaan
  klinikal yang tersalah arah. Pra-pendaftaran saluran paip asal
  yang dimeterai akan menambat perbandingan itu.
- **Kontroversi keberkesanan Tamiflu:** kajian semula Cochrane
  mengambil bertahun-tahun sebahagiannya kerana akses kepada data
  mentah dipertikaikan. Hash data yang dimeterai pada penerbitan
  akan menjadikan pertikaian akses-data segera diselesaikan.
- **Krisis ketidakbolehulangan umum:** kos kematian peringkat-bidang
  penyelidikan bioperubatan yang tidak boleh diulang adalah ketara
  (Begley & Ellis 2012 menganggarkan >50% penemuan praklinikal tidak
  boleh diulang). Penambatan kriptografi adalah satu tuas struktur.

## Cara fork kit ini

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# KRITIKAL: lakukan ini SEBELUM melihat sebarang keputusan
shasum -a 256 raw_data_v0.tar.gz       # hitung hash data kanonik
shasum -a 256 analysis.py              # hash saluran paip anda
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # isi dengan nilai sebenar
bash build/seal.sh                     # meterai SEBELUM menjalankan analisis
python3 build/verify.py                # sahkan

# Sekarang jalankan analisis. Hash output dan sahkan ia sepadan dengan FAKTA 05.
# Jika tidak sepadan, saluran paip itu tidak deterministik; betulkan dan meterai semula.
```

## Integrasi dengan infrastruktur ilmiah sedia ada

- **arXiv / bioRxiv / medRxiv**: sertakan URL meterai MYRIAM atau CID
  IPFS dalam abstrak atau bahan tambahan
- **OSF**: lampirkan artifak meterai pada projek OSF bersama-sama
  borang pra-pendaftaran konvensional
- **AsPredicted**: sertakan URL meterai MYRIAM dalam dokumen
  pra-pendaftaran
- **GitHub**: hash commit saluran paip analisis adalah apa yang
  FAKTA 04 tambat; GitHub menyediakan sumber, MYRIAM menambat bait
- **Zenodo / Figshare / OpenAIRE**: deposit data mentah, kemudian
  meterai hash deposit itu; meterai lebih sukar secara forensik untuk
  digantikan secara senyap berbanding metadata deposit
- **Bahan tambahan jurnal**: sertakan artifak meterai MYRIAM sebagai
  fail tambahan pada penyerahan

## Apa yang TIDAK digantikan oleh kit ini

- Kelulusan IRB / jawatankuasa etika
- Kajian rakan sebaya
- Kajian replikasi (kebolehulangan pengkomputeran ≠ kebolehulangan
  empirikal)
- Perjanjian akses data untuk data sensitif

## Nota tentang susunan pengarang dan kredit

Meterai menambat SENARAI PENGARANG pada masa pemeteraian. Pertikaian
tentang pengarang yang timbul selepas penerbitan boleh dinilai
terhadap senarai yang dimeterai. Ini adalah tuas akauntabiliti kecil
— penting untuk ECR yang ditambah atau dibuang secara senyap.

## Lesen

Domain awam (CC0). Gunakannya, ubah suainya, abaikannya, fork-nya.
