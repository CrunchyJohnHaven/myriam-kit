*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

# Kit Penguncian Perilaku Model AI

Sebuah contoh myriam-kit siap pakai untuk laboratorium AI (komersial atau
sumber-terbuka) yang merilis sebuah model dan ingin menjadikan klaim-klaim
rilis tersebut — identitas bobot, kapabilitas, skor evaluasi, tinjauan
keamanan, komitmen pra-penerapan — **terjangkar secara kriptografis dan
dapat diverifikasi secara publik**.

Kit ini membela diri terhadap mode kegagalan spesifik di mana model yang
diterapkan diam-diam menyimpang, skor evaluasi diretcon, atau klaim
pra-penerapan dipertikaikan bertahun-tahun kemudian sebagai "kami tidak
pernah mengatakan itu."

## Apa yang dihasilkan kit ini

Sebuah manifes tersegel kriptografis yang berisi, untuk satu rilis model:

1. Identifikasi model (nama, arsitektur, jumlah parameter, lisensi)
2. **SHA-256 file bobot** — hash artefak kanonis
3. Teks kartu model (kapabilitas, penggunaan yang dimaksudkan, penggunaan
   di luar lingkup, mode kegagalan yang diketahui)
4. Hasil evaluasi pada saat rilis (evaluasi kapabilitas, evaluasi
   keamanan, kalibrasi)
5. Komitmen pra-penerapan (hal-hal yang Anda berkomitmen untuk tidak
   diam-diam ubah setelah rilis)
6. Prinsipal penanda tangan (manusia + organisasi yang mengambil
   tanggung jawab)

Segel tersebut membuat masing-masing dari ini stabil-byte, terjangkar
waktu ke Bitcoin melalui OpenTimestamps, dan dapat diambil melalui IPFS
secara independen dari pihak hosting tunggal mana pun.

Lihat contoh fiktif yang telah dikerjakan: [facts/](facts/) dan
[site/index.html](site/index.html) yang telah dirender. Contoh
menggunakan model fiktif ("Calm-mini-v0"); rilis nyata akan menggantikan
konten contoh.

## Terhadap apa kit ini membela diri

**Mode kegagalan yang ditangkap segel secara langsung:**

- **Pengrusakan bobot** — SHA-256 file bobot yang dirilis ada dalam
  FAKTA 03. Setiap perubahan pasca-rilis terhadap byte yang diunduh
  pengguna dapat dideteksi dengan hash ulang.
- **Retcon evaluasi yang diam-diam** — skor evaluasi pada saat rilis ada
  dalam FAKTA 05. Sengketa masa depan tentang "skor evaluasi selalu X"
  memiliki jangkar publik.
- **Penyimpangan klaim kapabilitas** — teks kartu model dalam FAKTA 04
  stabil-byte. Sengketa masa depan tentang "kami tidak pernah mengklaim
  kapabilitas X" dapat dicek secara publik terhadap teks yang tersegel.
- **Redistribusi fine-tune yang diam-diam** — komitmen pra-penerapan #1
  dalam FAKTA 06 (dalam contoh yang dikerjakan) adalah "tidak ada
  fine-tuning diam-diam di bawah nama yang sama." Deteksi: setiap hash
  bobot baru berarti nama model baru dan publikasi tersegel baru, atau
  komitmen tersebut dilanggar.
- **Mode kegagalan tersembunyi** — FAKTA 04 berkomitmen pada daftar
  mode-kegagalan-yang-diketahui. Daftar tersebut bersifat monoton (dapat
  bertambah, tidak dapat menyusut untuk checkpoint yang dibekukan).
  Penemuan masa depan tentang mode kegagalan yang laboratorium ketahui
  secara internal tetapi tidak dipublikasikan menjadi bukti yang dapat
  dipertikaikan.

**Mode kegagalan yang TIDAK dicakup:**

- Model disalahgunakan oleh pengguna hilir (segel membuktikan apa yang
  dirilis, bukan apa yang pengguna lakukan dengannya).
- Fine-tuning adversarial oleh pihak ketiga (fine-tune pihak ketiga
  menghasilkan hash bobot yang berbeda, sehingga segel asli tidak
  terpengaruh, tetapi model pihak ketiga tersebut berada di luar
  perlindungan segel).
- Perubahan perilaku akibat perubahan lingkungan-penerapan (prompt
  sistem yang berbeda, konfigurasi RAG, dll.).
- Kegagalan yang sungguh-sungguh tidak diketahui laboratorium pada saat
  rilis. Segel berkomitmen pada laboratorium tentang *apa yang mereka
  ketahui*; ia tidak dapat menjangkar apa yang tidak mereka ketahui.

## Kapan menggunakan kit ini

Anda sebaiknya mempertimbangkan menyegel kartu model jika:

- Anda merilis bobot model secara publik ATAU menerapkan model dalam
  konteks di mana pengguna hilir peduli pada stabilitas perilaku.
- Rilis tersebut cukup signifikan sehingga sengketa masa depan tentang
  "kami tidak pernah mengatakan itu" masuk akal (setiap model yang
  diterapkan dalam skala besar; setiap model yang kritis-keamanan;
  setiap rilis yang disertai klaim kapabilitas).
- Organisasi Anda bersedia membuat komitmen pra-penerapan yang
  membatasi tindakan masa depan (ini adalah yang menanggung beban —
  lihat bagian berikutnya).
- Anda dapat menghitung SHA-256 file bobot pada saat rilis.

## Kapan TIDAK menggunakan kit ini

JANGAN gunakan kit ini jika:

- Anda tidak bersedia terikat oleh komitmen pra-penerapan dalam FAKTA 06
  dari contoh. Segel membuat komitmen dapat dideteksi secara mekanis;
  jika Anda tidak siap untuk akuntabilitas itu, jangan menyegel.
- File bobot akan sering berubah (misalnya, pipeline fine-tuning
  berkelanjutan). Setiap perubahan bobot memerlukan rilis tersegel
  baru. Penyegelan per-rilis berat; kit ini untuk checkpoint yang
  *dibekukan*.
- Anda belum melakukan tinjauan keamanan. Segel berkomitmen pada
  temuan tinjauan keamanan. Jika Anda menyegel tinjauan yang tidak
  lengkap, Anda memiliki catatan publik permanen dari tinjauan yang
  tidak lengkap.
- Anda mungkin ingin menarik kembali skor evaluasi tertentu di kemudian
  hari. Segel itu permanen. Publikasi tersegel baru dapat menggantikan,
  tetapi yang asli tidak dapat dibatalkan.

## Komitmen pra-penerapan yang menanggung beban

FAKTA 06 dari contoh berkomitmen kepada penerbit untuk:

1. **Tidak ada fine-tuning diam-diam di bawah nama yang sama.** Setiap
   fine-tune menghasilkan nama model baru, publikasi tersegel baru, hash
   bobot baru. Pendahulunya tetap secara kanonis sebagai versi
   bernama tersebut.

2. **Tidak ada pembaruan evaluasi diam-diam.** Evaluasi ulang
   mendapatkan publikasi tersegel baru yang merujuk pada yang asli
   melalui akar Merkle. Versi-versi dilacak, tidak ditimpa.

3. **Mode kegagalan yang diketahui boleh bertambah, tidak pernah
   menyusut.** Checkpoint yang dibekukan tidak dapat memiliki mode
   kegagalan yang diperbaiki. Jadi daftar yang dipublikasikan secara
   efektif monoton.

4. **Penanganan penarikan.** Jika dipaksa untuk menghapus model dari
   distribusi, laboratorium berkomitmen untuk menerbitkan pernyataan
   tersegel akhir mengenai penarikan tersebut.

Laboratorium yang mengadopsi kit ini perlu memutuskan mana dari
komitmen-komitmen tersebut yang dapat benar-benar dihormatinya. Jika
Anda tidak dapat menghormati keempatnya, modifikasi FAKTA 06 *sebelum*
menyegel untuk mencerminkan apa yang dapat Anda hormati, dan terima
perlindungan yang melemah sebagai akibatnya. Menyegel komitmen yang
tidak Anda niatkan untuk dihormati lebih buruk daripada tidak menyegel
sama sekali.

## Cara mem-fork kit ini untuk rilis nyata

```bash
# 1. Salin contoh ini ke dalam pipeline rilis Anda
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Sunting setiap fakta untuk rilis nyata Anda
$EDITOR facts/01_example_notice.txt   # HAPUS — rilis Anda bukan contoh
                                       # Ganti dengan pemberitahuan rilis untuk model Anda
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # kartu model kanonis
$EDITOR facts/05_eval_results.txt     # hasil evaluasi aktual
$EDITOR facts/06_release_commitments.txt # komitmen mana yang dapat Anda hormati

# 3. Perbarui site/index.html untuk mencerminkan rilis nyata.

# 4. Segel.
bash build/seal.sh

# 5. Verifikasi secara lokal.
python3 build/verify.py

# 6. Terapkan ke:
#    - Halaman rilis Anda (di samping kartu model dan bobot)
#    - Jaringan IPFS (skrip seal.sh sudah melakukan ini)
#    - Opsional: tautkan ke publikasi tersegel dari catatan rilis
#      Hugging Face / GitHub Anda
```

## Integrasi dengan pipeline rilis yang sudah ada

Kit ini dirancang untuk disusun dengan alat-alat yang sudah ada, bukan
menggantikannya:

- **Hugging Face**: sertakan URL atau IPFS CID publikasi tersegel dalam
  README.md kartu model. Arahkan pembaca ke segel untuk klaim rilis yang
  stabil-byte.
- **Rilis GitHub**: sertakan tanda terima OpenTimestamps
  (`merkle_root.txt.ots`) sebagai aset rilis. Sengketa masa depan tentang
  "rilis berubah" kemudian terjangkar ke Bitcoin.
- **Standar kartu model (Mitchell et al. 2019)**: kit ini kompatibel.
  Bidang kartu-model standar dipetakan ke FAKTA 02–05 dari segel. Anda
  menghasilkan kartu model secara normal, dan tambahan menyegelnya.
- **Harness evaluasi (lm-evaluation-harness, BIG-bench, dll.)**: hash
  commit harness yang persis dan JSON keluaran mentah; rujuk hash-hash
  tersebut dalam FAKTA 05. Run ulang masa depan kemudian dapat
  direproduksi secara independen.

## Menghitung hash bobot

Untuk file safetensors tunggal:

```bash
shasum -a 256 model.safetensors
```

Untuk checkpoint multi-file (shard GGUF, safetensors yang di-shard):

```bash
# Gabungkan hash dalam urutan tersortir, lalu hash lagi
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Hash akhir adalah yang masuk ke FAKTA 03. Sertakan baik hash per-shard
maupun hash agregat akhir agar pengguna dapat memverifikasi shard
individual saat mereka mengunduh.

## Apa yang harus diketahui penerima (pengguna model Anda)

Sebuah rilis model dengan publikasi tersegel-MYRIAM memungkinkan
pengguna:

1. **Memverifikasi bobot yang mereka unduh** dengan menghash ulang dan
   membandingkan dengan FAKTA 03.
2. **Memverifikasi kartu model belum diretcon** dengan memeriksa FAKTA
   04 yang tersegel terhadap versi yang sedang dipublikasikan
   laboratorium.
3. **Memverifikasi skor evaluasi adalah yang ada pada saat rilis**
   dengan membandingkan klaim evaluasi laboratorium saat ini terhadap
   FAKTA 05 yang tersegel.
4. **Menuntut laboratorium bertanggung jawab atas komitmen
   pra-penerapannya** dengan memeriksa perilaku aktual terhadap FAKTA
   06 yang tersegel.

Pengguna yang menemukan ketidaksesuaian memiliki bukti kriptografis
tentang ketidaksesuaian tersebut. Mereka dapat mempublikasikan bukti
tersebut; publikasi tersegel asli adalah jangkarnya.

## Apa yang BUKAN merupakan kit ini

- Bukan pengganti untuk benar-benar melakukan tinjauan keamanan. Segel
  adalah *catatan* tinjauan keamanan, bukan tinjauan itu sendiri.
- Bukan pengganti untuk evaluasi aktual. Segel menjangkar skor yang
  Anda hasilkan; ia tidak memvalidasi metodologi.
- Bukan jaminan bahwa model itu aman. Segel mendokumentasikan apa yang
  diklaim laboratorium tentang model pada saat rilis; ia tidak
  mensertifikasi klaim-klaim tersebut.
- Bukan perlindungan terhadap penyalahgunaan model oleh pengguna hilir.

## Catatan tentang fine-tuning adversarial

Kekhawatiran umum dalam keamanan AI: seseorang melakukan fine-tune
terhadap model Anda untuk menghapus perilaku keamanan dan
mendistribusikannya kembali. Segel TIDAK DAPAT mencegah ini. Yang dapat
dilakukan segel adalah:

- Menjangkar apa yang seharusnya dilakukan oleh model *asli* (FAKTA 04).
- Menjangkar apa skor evaluasi asli (FAKTA 05).
- Memberikan titik referensi terhadap mana fine-tune adversarial dapat
  diukur.

Pengguna yang menjumpai redistribusi pihak ketiga dapat memverifikasi
apakah bobot cocok dengan hash tersegel asli. Jika tidak, pengguna
mengetahui bahwa mereka memiliki model non-asli dan bahwa setiap klaim
keamanan yang dikaitkan dengan laboratorium tidak berlaku.

## Penutup

Menyegel sebuah rilis model adalah pekerjaan tambahan yang kecil bagi
laboratorium: ~10 menit untuk menghitung hash dan menjalankan skrip
penyegelan, kemudian keputusan 30 detik tentang komitmen pra-penerapan
mana yang akan disertakan. Akuntabilitas yang ditambahkannya bersifat
asimetris: biaya kecil bagi laboratorium yang jujur, kendala besar bagi
laboratorium yang sebaliknya akan diam-diam menyimpang dari klaim
mereka.

Jika Anda adalah laboratorium AI yang mempertimbangkan adopsi, kit ini
berada dalam domain publik (CC0). Fork-lah. Modifikasi-lah. Matematika
adalah bagian yang menanggung beban, bukan implementasi spesifiknya.

## Lisensi

Domain publik (CC0). Tidak diperlukan atribusi.
