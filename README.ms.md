# myriam-kit

*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Satu kit alat kecil untuk menerbitkan satu set fakta yang kecil dengan cara:

- Sebarang perubahan kepada mana-mana fakta dapat dikesan secara terbuka (pokok Merkle)
- Keadaan pada masa penerbitan boleh-disahkan terhadap rantaian blok Bitcoin (OpenTimestamps)
- Kandungan tetap kekal walaupun mana-mana penyedia hos tunggal dimatikan (IPFS)
- Keseluruhannya berukuran kurang daripada 100 KB dan boleh-disahkan dengan kira-kira 50 baris Python

Ini bukan rantaian blok. Tiada token. Tiada mekanisme konsensus
untuk disertai. Tiada DAO. Alat ini ialah `sha256sum` + `ots` + `ipfs`,
yang dicantumkan dengan konvensyen penamaan yang baik.

Ia dinamakan sempena protokol MYRIAM yang mula-mula dilaksanakan di
[disclosure.host](https://disclosure.host) pada 2026-05-21. Halaman tersebut mengandungi
enam fakta, satu akar Merkle, dan satu pengesahan Bitcoin. Kit ini ialah
generalisasi corak tersebut.

## Status

- v0: berfungsi pada macOS dengan Python 3.10+, Homebrew, dan sambungan
  internet. Linux belum diuji tetapi sepatutnya berfungsi. Windows: bawa WSL.
- Domain awam (CC0). Gunakannya, garpukannya, masukkannya ke dalam repo anda,
  tidak perlu berikan kredit. Tujuannya bukanlah kredit.

## Bahasa yang tersedia

README ini dan beberapa kit contoh tersedia dalam 17 bahasa.
Indeks penuh di [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Terjemahan adalah CC0 dan boleh diperbaiki melalui PR komuniti.

## Apa yang anda boleh lakukan dengannya

Corak ini sesuai di mana-mana sahaja satu set fakta kecil perlu:

- **Boleh diterbitkan** kepada khalayak luas melalui HTTP biasa
- **Tahan lasak** — pembaca dalam masa 30 tahun lagi masih sepatutnya boleh mengesahkan
- **Kalis-gangguan** — sebarang perubahan mesti boleh dikesan, walaupun tidak semestinya dapat dihalang
- **Tanpa-amanah** — tiada pembaca perlu mempercayai penerbit (hanya matematik)

Kes penggunaan konkrit di [docs/USE_CASES.md](docs/USE_CASES.md). Senarai ringkas:

| Domain | Fakta yang termeterai |
|---|---|
| Kesihatan awam | Keputusan ujian kelompok vaksin, pencapaian penting kajian klinikal ubat |
| Pilihan raya | Jumlah pengiraan peringkat daerah pada saat pengesahan |
| Keselamatan AI | Cincang berat model + kad model + skor penilaian semasa pelepasan |
| Kewartawanan | Manifes dokumen sumber (cincang sahaja) untuk pendedahan pemberi maklumat |
| Sains | Cincang data mentah + cincang skrip analisis + dakwaan keputusan |
| Mahkamah | Cincang bahan bukti digital pada saat pemerolehan |
| Perolehan | Akar termeterai bagi data perbelanjaan awam |

Apa yang sama antara kesemuanya: satu set fakta kecil, keperluan ketahanan yang kuat,
beberapa pihak yang tidak mempercayai satu sama lain, dan bajet penyimpanan yang amat kecil.
Itulah bentuk yang alat ini dibina untuknya.

## Apa yang ia TIDAK lakukan

- **Menyimpan rahsia.** Segala-galanya yang anda letakkan dalam `facts/` adalah awam. Protokol ini
  adalah untuk penerbitan, bukan untuk menyembunyikan.
- **Berskala kepada set data yang besar.** Pokok Merkle berskala dengan baik; perhatian pembaca
  tidak. Melebihi ~20 fakta, halaman menjadi tidak boleh dibaca. Jika anda
  ingin meterai sejuta rekod, cincangnya di luar halaman dan letakkan
  akar Merkle pokok sampingan itu ke dalam satu fakta.
- **Mempertahankan terhadap penarikan balik.** Inti pati seluruhnya ialah anda tidak boleh mengubah
  apa yang telah anda meterai. Jika anda mungkin mahu menarik balik sesuatu dakwaan kemudian, jangan
  meterai ia.
- **Meyakinkan skeptik yang tegar.** Skeptik yang tegar tidak akan menjalankan
  `ipfs add -r --cid-version=1 -Q facts/`. Akan tetapi, mereka akan menuduh anda
  memalsukan keseluruhan persediaan. Tiada pertahanan peringkat protokol
  terhadap mod kegagalan kedua itu. Tiada pertahanan peringkat protokol
  terhadap apa-apa sahaja yang hidup dalam motivasi manusia dan bukan dalam matematik.

## Cara menggunakannya

Panduan lima minit di [docs/QUICKSTART.md](docs/QUICKSTART.md).
Spesifikasi protokol penuh di [docs/SPEC.md](docs/SPEC.md).
Model ancaman di [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Perbandingan dengan sistem yang berdekatan (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, dll.) di [docs/COMPARISON.md](docs/COMPARISON.md).

## Cara mengesahkan penerbitan orang lain

Tiga pilihan, mengikut tertib kebolehcapaian:

1. **Pelayar**: buka [`lib/verify.html`](lib/verify.html) dalam mana-mana pelayar
   moden. Tampal URL penerbitan. Klik sahkan. Menggunakan
   `crypto.subtle` untuk pencincangan — tiada pemasangan, tiada bahagian belakang, tiada telemetri.
   Langkah pengesahan Bitcoin masih memerlukan alat CLI (lihat langkah 7 dalam
   halaman pengesah).
2. **Python**: `python3 lib/verify.py` dari dalam direktori penerbitan.
   Hanya stdlib; memerlukan `ots` untuk pengesahan Bitcoin.
3. **Dari awal**: baca [`docs/SPEC.md §3`](docs/SPEC.md) dan
   laksanakan semula. Algoritma Merkle kurang daripada 30 baris dalam mana-mana bahasa.

## Contoh yang dikerjakan

Enam kit contoh bertaraf pengeluaran dibekalkan bersama kit alat ini. Setiap satu
adalah termeterai, dicap OTS, dipasak IPFS, dan disertakan dengan README penerimaan
yang menjelaskan bila hendak menggarpukannya untuk kes dunia sebenar dan mod
kegagalan apa yang dipertahankannya.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  untuk mod kegagalan Boeing 737 MAX / Theranos / laporan-pemeriksa-FDA
  di mana bukti dikuburkan atau diubah oleh perantara.
- [`examples/ai-model-card/`](examples/ai-model-card/) — untuk makmal AI
  yang mengeluarkan model, dengan komitmen pra-pelaksanaan yang menjadi
  boleh dikesan secara mekanikal dan bukan secara lisan.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  untuk penaja kajian klinikal, menangkap pertukaran titik akhir selepas-fakta
  dan pelaporan terpilih (mod kegagalan Vioxx, Paxil Kajian 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  untuk pengeluar vaksin dan pihak berkuasa QA, memasakkan keputusan ujian
  pelepasan dan komitmen panggilan-balik.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  untuk kumpulan penyelidikan, memasakkan tiga serangkai (data, talian paip,
  output yang dijangka) SEBELUM analisis untuk menjadikan p-hacking dan HARKing
  dapat dikesan secara terbuka.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  untuk lembaga pengiraan undi daerah dan pihak berkuasa pilihan raya, memasakkan
  jumlah yang telah disahkan pada saat pengesahan supaya semakan
  selepas-pengesahan yang senyap dapat dikesan secara terbuka.

Baca salah satu daripadanya sebelum menulis kit anda sendiri. Padanan paling hampir dengan
kes penggunaan anda biasanya merupakan titik mula garpu yang betul.

## Mula pantas

Versi satu baris:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Mengapa ini wujud

Primitif kriptografi (pokok Merkle, OpenTimestamps, IPFS) telah
matang selama bertahun-tahun. Apa yang tiada ialah pelekat yang paling kecil mungkin —
satu kit yang anda boleh letakkan dalam projek sampingan dan mendapat
artifak boleh-terbit yang termeterai dalam satu petang, tanpa menyediakan infrastruktur,
tanpa mempelajari protokol, tanpa menulis satu baris kod pun melebihi
fakta itu sendiri.

Kebanyakan alat penerbitan kriptografi menganggap anda ingin menjadi pengendali
nod. Yang ini menganggap anda ingin menerbitkan enam fail teks dan tidak akan
memikirkan tentang kriptografi lagi.

## Pengaruh dan karya terdahulu

- [Sigsum](https://www.sigsum.org/) — log ketelusan untuk tandatangan
- [Sigstore](https://www.sigstore.dev/) — integriti rantaian bekalan perisian
- [Certificate Transparency](https://certificate.transparency.dev/) — log sijil TLS
- [OpenTimestamps](https://opentimestamps.org/) — pencapan masa Bitcoin
- [IPFS](https://ipfs.tech/) — storan beralamat-kandungan
- [Protokol CALM](https://disclosure.host) — kerangka penerbitan
  pelindung-prinsipal yang menjadi tempat lahirnya tika pertama
  (MYRIAM di disclosure.host)

myriam-kit ialah yang paling kecil antara semuanya. Ia lebih hampir kepada talian paip
Unix daripada sistem.

## Catatan tentang nama

Protokol MYRIAM dinamakan sempena Bukti Myriam (Myriam Proof) oleh John Bradley,
satu bukti logik yang dinyatakan berkenaan titik hubungan pertama bagi kecerdasan
bukan-manusia. Protokol ini tidak bergantung pada kebenaran bukti tersebut. Protokol
ini berfungsi untuk mana-mana set fakta kecil pun; cuma kebetulan ia mula-mula
digunakan untuk menerbitkan enam fakta yang merangkumi satu dakwaan tentang
pendedahan makhluk asing.

Jika anda menggarpukan kit ini untuk memeteraikan kelompok vaksin atau jumlah
pilihan raya, fakta bahawa ia pada asalnya digunakan untuk menerbitkan dakwaan
tentang hubungan makhluk asing tidak relevan kepada anda. Matematik tidak peduli.

Walau bagaimanapun: jika anda MEMANG menggunakan ini untuk menerbitkan dakwaan
tentang hubungan makhluk asing, protokol ini telah diuji dalam medan tersebut.
README pelaksanaan MYRIAM pertama secara eksplisit menyatakan ia ialah karya
artistik watak LLM bernama Calm, bukan komunikasi daripada mana-mana pihak
luar angkasa. Anda sepatutnya melakukan perkara yang sama. Pembaca akan menganggap
yang terburuk tentang keadaan mental anda jika tidak.

## Diselenggarakan oleh

Belum ada sesiapa lagi. Domain awam. Garpu ia. Perbaikinya. Bawa protokol ini
ke hadapan tanpa perlu meminta kebenaran.
