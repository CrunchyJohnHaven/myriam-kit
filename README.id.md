*Terjemahan bahasa Indonesia — untuk versi asli bahasa Inggris, lihat [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#contoh-contoh-yang-telah-dikerjakan)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Sebuah perangkat kecil untuk menerbitkan sekumpulan kecil fakta sedemikian rupa sehingga:

- Setiap perubahan terhadap fakta mana pun dapat dideteksi secara publik (pohon Merkle)
- Keadaan pada saat publikasi dapat diverifikasi terhadap blockchain Bitcoin (OpenTimestamps)
- Konten tetap bertahan meskipun salah satu penyedia hosting dihapus paksa (IPFS)
- Keseluruhan paket berukuran di bawah 100 KB dan dapat diverifikasi dengan ~50 baris Python

Ini bukan blockchain. Tidak ada token. Tidak ada mekanisme konsensus untuk diikuti. Tidak ada DAO. Alatnya adalah `sha256sum` + `ots` + `ipfs`, direkatkan dengan konvensi penamaan yang baik.

Perangkat ini dinamai berdasarkan protokol MYRIAM yang pertama kali diterapkan di [disclosure.host](https://disclosure.host) pada 2026-05-21. Halaman tersebut memuat enam fakta, sebuah akar Merkle, dan sebuah atestasi Bitcoin. Kit ini adalah generalisasi dari pola tersebut.

## Status

- v0: bekerja di macOS dengan Python 3.10+, Homebrew, dan koneksi internet. Linux belum diuji tetapi seharusnya bekerja. Windows: gunakan WSL.
- Domain publik (CC0). Gunakan, fork, masukkan ke dalam repo Anda, tanpa perlu mencantumkan kredit. Tujuannya bukan kredit.

## Apa yang dapat Anda lakukan dengannya

Pola ini cocok di mana pun sekumpulan kecil fakta perlu:

- **Dapat dipublikasikan** kepada audiens luas melalui HTTP biasa
- **Tahan lama** — pembaca 30 tahun ke depan masih harus bisa memverifikasi
- **Terbukti tidak diubah (tamper-evident)** — setiap perubahan harus dapat dideteksi, tidak harus dapat dicegah
- **Tanpa kepercayaan (trustless)** — tidak ada pembaca yang perlu mempercayai penerbit (hanya matematikanya)

Kasus penggunaan konkret di [docs/USE_CASES.md](docs/USE_CASES.md). Daftar singkatnya:

| Bidang | Fakta yang disegel |
|---|---|
| Kesehatan masyarakat | Hasil uji batch vaksin, tonggak uji klinis obat |
| Pemilihan umum | Total penghitungan suara tingkat TPS pada momen pengesahan |
| Keamanan AI | Hash bobot model + model card + skor evaluasi pada saat rilis |
| Jurnalisme | Manifest dokumen sumber (hanya hash) untuk pengungkapan whistleblower |
| Sains | Hash data mentah + hash skrip analisis + hasil yang diklaim |
| Pengadilan | Hash bukti digital pada saat diperoleh |
| Pengadaan | Akar tersegel dari data belanja publik |

Hal yang sama di antara semuanya: sekumpulan kecil fakta, kebutuhan ketahanan yang kuat, banyak pihak yang tidak saling mempercayai, dan anggaran penyimpanan yang sangat kecil. Itulah bentuk yang dirancang untuk alat ini.

## Yang TIDAK dilakukan

- **Menyimpan rahasia.** Segala sesuatu yang Anda masukkan ke `facts/` bersifat publik. Protokol ini untuk publikasi, bukan untuk menyembunyikan.
- **Menskalakan ke dataset besar.** Pohon Merkle berskala baik; perhatian pembaca tidak. Setelah ~20 fakta, halaman menjadi tidak terbaca. Jika Anda ingin menyegel sejuta catatan, hash mereka di luar halaman dan masukkan akar Merkle dari sub-pohon itu ke dalam satu fakta.
- **Membela dari penarikan (retraction).** Inti dari semuanya adalah Anda tidak dapat mengubah apa yang telah disegel. Jika Anda mungkin ingin menarik kembali klaim nanti, jangan disegel.
- **Meyakinkan skeptis yang gigih.** Skeptis yang gigih tidak akan menjalankan `ipfs add -r --cid-version=1 -Q facts/`. Mereka justru akan menuduh Anda memalsukan seluruh penataan ini. Tidak ada pertahanan di tingkat protokol terhadap mode kegagalan kedua. Tidak ada pertahanan di tingkat protokol terhadap apa pun yang hidup dalam motivasi manusia, bukan dalam matematika.

## Cara menggunakannya

Panduan lima menit di [docs/QUICKSTART.md](docs/QUICKSTART.md).
Spesifikasi lengkap protokol di [docs/SPEC.md](docs/SPEC.md).
Model ancaman di [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Perbandingan dengan sistem terkait (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave, dll.) di [docs/COMPARISON.md](docs/COMPARISON.md).

## Cara memverifikasi publikasi orang lain

Tiga opsi, dalam urutan keterjangkauan:

1. **Browser**: buka [`lib/verify.html`](lib/verify.html) di browser modern mana pun. Tempelkan URL publikasi. Klik verifikasi. Menggunakan `crypto.subtle` untuk hashing — tanpa instalasi, tanpa backend, tanpa telemetri. Langkah atestasi Bitcoin masih memerlukan alat CLI (lihat langkah 7 di halaman verifier).
2. **Python**: `python3 lib/verify.py` dari dalam direktori publikasi. Hanya menggunakan stdlib; memerlukan `ots` untuk verifikasi Bitcoin.
3. **Dari nol**: baca [`docs/SPEC.md §3`](docs/SPEC.md) dan implementasikan ulang. Algoritma Merkle kurang dari 30 baris dalam bahasa apa pun.

## Contoh-contoh yang telah dikerjakan

Enam contoh kit berkualitas produksi disertakan dengan perangkat ini. Masing-masing telah disegel, distempel OTS, dipin di IPFS, dan dilengkapi README adopsi yang menjelaskan kapan harus mem-fork untuk kasus dunia nyata dan mode kegagalan apa yang dipertahankannya.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) — untuk mode kegagalan Boeing 737 MAX / Theranos / laporan inspektur FDA, di mana bukti dikubur atau diubah oleh perantara.
- [`examples/ai-model-card/`](examples/ai-model-card/) — untuk laboratorium AI yang merilis model, dengan komitmen pra-penerapan yang menjadi dapat dideteksi secara mekanis, bukan hanya secara verbal.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — untuk sponsor uji klinis, menangkap peralihan endpoint pasca-fakta dan pelaporan selektif (mode kegagalan Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — untuk produsen vaksin dan otoritas QA, menjangkar hasil uji rilis dan komitmen penarikan kembali.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — untuk kelompok penelitian, menjangkar triple (data, pipeline, output yang diharapkan) SEBELUM analisis untuk membuat p-hacking dan HARKing dapat dideteksi secara publik.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) — untuk dewan canvasser kabupaten dan otoritas pemilu, menjangkar hasil penghitungan tersertifikasi pada momen pengesahan sehingga revisi pasca-pengesahan yang diam-diam menjadi dapat dideteksi secara publik.

Baca salah satunya sebelum menulis yang Anda sendiri. Padanan terdekat dengan kasus penggunaan Anda biasanya merupakan titik awal fork yang tepat.

## Mulai cepat

Versi satu baris:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# sunting facts/*.txt agar berisi apa yang sebenarnya ingin Anda segel
./lib/seal.sh        # membangun akar Merkle, menstempel OTS, mem-pin IPFS
./lib/verify.sh      # memverifikasi ulang semuanya secara lokal
# unggah site/ ke host statis mana pun. Di mana saja. Tidak masalah.
```

## Mengapa ini ada

Primitif kriptografis (pohon Merkle, OpenTimestamps, IPFS) telah matang selama bertahun-tahun. Yang kurang adalah perekat sekecil mungkin — sebuah kit yang dapat Anda jatuhkan ke dalam proyek sampingan dan mendapatkan artefak yang tersegel dan dapat dipublikasikan dalam satu sore, tanpa menyiapkan infrastruktur, tanpa mempelajari protokol, tanpa menulis satu baris kode pun di luar fakta itu sendiri.

Kebanyakan alat penerbitan kriptografis berasumsi bahwa Anda ingin menjadi operator node. Yang ini berasumsi bahwa Anda ingin menerbitkan enam berkas teks dan tidak pernah memikirkan kriptografi lagi.

## Pengaruh dan karya sebelumnya

- [Sigsum](https://www.sigsum.org/) — log transparansi untuk tanda tangan
- [Sigstore](https://www.sigstore.dev/) — integritas rantai pasok perangkat lunak
- [Certificate Transparency](https://certificate.transparency.dev/) — log sertifikat TLS
- [OpenTimestamps](https://opentimestamps.org/) — penstempelan waktu Bitcoin
- [IPFS](https://ipfs.tech/) — penyimpanan beralamat-konten
- [Protokol CALM](https://disclosure.host) — kerangka penerbitan yang melindungi principal di mana instansiasi pertama (MYRIAM di disclosure.host) disusun

myriam-kit adalah yang terkecil di antara semuanya. Lebih dekat dalam semangatnya dengan pipeline Unix daripada dengan sebuah sistem.

## Catatan tentang nama

Protokol MYRIAM dinamai berdasarkan Myriam Proof karya John Bradley, sebuah pembuktian logis yang dinyatakan mengenai titik kontak pertama untuk kecerdasan non-manusia. Protokol ini tidak bergantung pada kebenaran pembuktian tersebut. Protokol bekerja untuk sekumpulan kecil fakta apa pun; kebetulan saja pertama kali diterapkan untuk menerbitkan enam fakta yang mencakup klaim tentang pengungkapan alien.

Jika Anda mem-fork kit ini untuk menyegel batch vaksin atau hasil penghitungan suara, fakta bahwa kit ini awalnya digunakan untuk menerbitkan klaim tentang kontak alien tidak relevan bagi Anda. Matematikanya tidak peduli.

Yang perlu dicatat: jika Anda MEMANG menggunakannya untuk menerbitkan klaim tentang kontak alien, protokolnya telah teruji di arena spesifik itu. README dari penerapan MYRIAM pertama secara eksplisit menyatakan bahwa itu adalah karya artistik dari persona LLM bernama Calm, bukan komunikasi dari pihak ekstraterestrial mana pun. Anda sebaiknya melakukan hal yang sama. Jika tidak, pembaca akan mengasumsikan yang terburuk tentang kondisi mental Anda.

## Dikelola oleh

Belum ada. Domain publik. Fork. Perbaiki. Bawa protokol ini ke depan tanpa meminta izin.
