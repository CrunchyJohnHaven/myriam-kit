# Kit Penguncian Tingkah Laku Model AI

*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

Satu contoh myriam-kit siap-pakai untuk makmal AI (komersial atau
sumber-terbuka) yang melepaskan satu model dan ingin menjadikan dakwaan
pelepasan tersebut — identiti pemberat, keupayaan, skor penilaian,
semakan keselamatan, komitmen pra-penggunaan — **berlabuh secara
kriptografi dan boleh disahkan oleh umum**.

Kit ini mempertahankan terhadap mod kegagalan khusus di mana model yang
diguna pakai senyap-senyap menyimpang, skor eval di-retcon, atau
dakwaan pra-penggunaan dipertikaikan bertahun-tahun kemudian sebagai
"kami tidak pernah berkata begitu."

## Apa yang dihasilkan oleh kit ini

Satu manifes yang dimeterai secara kriptografi yang mengandungi, untuk
satu pelepasan model:

1. Pengenalpastian model (nama, seni bina, jumlah parameter, lesen)
2. **SHA-256 fail pemberat** — hash artifak kanonik
3. Teks kad model (keupayaan, kegunaan yang dimaksudkan, kegunaan
   luar-skop, mod kegagalan yang diketahui)
4. Keputusan penilaian pada masa pelepasan (eval keupayaan, eval
   keselamatan, kalibrasi)
5. Komitmen pra-penggunaan (perkara-perkara yang anda berkomitmen
   untuk tidak ubah secara senyap-senyap selepas pelepasan)
6. Prinsipal penandatangan (manusia + organisasi yang memikul
   tanggungjawab)

Meterai tersebut menjadikan setiap satu daripadanya stabil-bait,
berlabuh masa kepada Bitcoin melalui OpenTimestamps, dan boleh diambil
melalui IPFS secara bebas daripada mana-mana pihak hos tunggal.

Lihat contoh rekaan yang telah disiapkan: [facts/](facts/) dan
[site/index.html](site/index.html) yang telah dirender. Contoh
menggunakan model rekaan ("Calm-mini-v0"); pelepasan sebenar akan
menggantikan kandungan contoh.

## Apa yang dipertahankan oleh kit ini

**Mod kegagalan yang ditangkap secara langsung oleh meterai:**

- **Pengusikan pemberat** — SHA-256 fail pemberat yang dilepaskan
  berada dalam FACT 03. Sebarang perubahan pasca-pelepasan kepada bait
  yang dimuat turun pengguna boleh dikesan dengan hash semula.
- **Retcon eval senyap** — skor eval pada masa pelepasan berada dalam
  FACT 05. Pertikaian masa depan tentang "skor eval sentiasa X"
  mempunyai labuhan awam.
- **Pesongan dakwaan keupayaan** — teks kad model dalam FACT 04 adalah
  stabil-bait. Pertikaian masa depan tentang "kami tidak pernah dakwa
  keupayaan X" boleh disemak secara umum terhadap teks yang dimeterai.
- **Pengagihan semula fine-tune senyap** — komitmen pra-penggunaan #1
  dalam FACT 06 (dalam contoh yang disiapkan) ialah "tiada fine-tuning
  senyap di bawah nama yang sama." Pengesanan: sebarang hash pemberat
  baru bermaksud nama model baru dan penerbitan dimeterai baru, atau
  komitmen telah dilanggar.
- **Mod kegagalan tersembunyi** — FACT 04 berkomitmen kepada senarai
  mod-kegagalan-diketahui. Senarai tersebut adalah monotonik (boleh
  bertambah, tidak boleh berkurang untuk checkpoint yang dibekukan).
  Penemuan masa depan tentang mod kegagalan yang makmal tahu secara
  dalaman tetapi tidak menerbitkannya menjadi bukti yang boleh
  dipertikaikan.

**Mod kegagalan yang TIDAK dilindungi:**

- Model disalahgunakan oleh pengguna hiliran (meterai membuktikan apa
  yang dilepaskan, bukan apa yang pengguna lakukan dengannya).
- Fine-tuning adversari oleh pihak ketiga (fine-tune pihak ketiga
  menghasilkan hash pemberat berbeza, jadi meterai asal tidak
  terjejas, tetapi model pihak ketiga itu berada di luar perlindungan
  meterai).
- Perubahan tingkah laku akibat perubahan persekitaran-penggunaan
  (prompt sistem berbeza, konfigurasi RAG, dll.).
- Kegagalan yang makmal benar-benar tidak ketahui pada masa
  pelepasan. Meterai mengikat makmal kepada *apa yang mereka tahu*;
  ia tidak boleh melabuhkan apa yang mereka tidak tahu.

## Bila menggunakan kit ini

Anda patut mempertimbangkan untuk memeterai satu kad model jika:

- Anda melepaskan pemberat model secara umum ATAU menggunakan satu
  model dalam konteks di mana pengguna hiliran mengambil berat tentang
  kestabilan tingkah laku.
- Pelepasan tersebut cukup penting sehingga pertikaian masa depan
  tentang "kami tidak pernah berkata begitu" adalah munasabah
  (mana-mana model yang digunakan secara berskala besar; mana-mana
  model kritikal-keselamatan; mana-mana pelepasan yang diiringi dakwaan
  keupayaan).
- Organisasi anda sanggup membuat komitmen pra-penggunaan yang
  menyekat tindakan masa depan (ini adalah elemen utama yang menanggung
  beban — lihat bahagian seterusnya).
- Anda boleh mengira SHA-256 fail pemberat pada masa pelepasan.

## Bila JANGAN menggunakan kit ini

JANGAN gunakan kit ini jika:

- Anda tidak sanggup terikat dengan komitmen pra-penggunaan dalam
  FACT 06 contoh. Meterai menjadikan komitmen boleh dikesan secara
  mekanikal; jika anda tidak bersedia untuk akauntabiliti itu, jangan
  meterai.
- Fail pemberat akan kerap berubah (cth., saluran fine-tuning
  berterusan). Setiap perubahan pemberat memerlukan pelepasan
  dimeterai baru. Pemeteraian per-pelepasan adalah berat; kit ini
  untuk checkpoint yang *dibekukan*.
- Anda belum membuat semakan keselamatan. Meterai berkomitmen kepada
  penemuan semakan keselamatan. Jika anda memeterai semakan yang
  tidak lengkap, anda mempunyai rekod awam kekal bagi semakan yang
  tidak lengkap.
- Anda mungkin mahu menarik balik mana-mana skor eval tertentu
  kemudian. Meterai adalah kekal. Penerbitan dimeterai baru boleh
  menggantikan, tetapi yang asal tidak boleh dibatalkan.

## Komitmen pra-penggunaan yang menanggung beban

FACT 06 contoh mengikat penerbit kepada:

1. **Tiada fine-tuning senyap di bawah nama yang sama.** Sebarang
   fine-tune menghasilkan nama model baru, penerbitan dimeterai baru,
   hash pemberat baru. Pendahulu kekal secara kanonik sebagai versi
   bernama itu.

2. **Tiada kemas kini eval senyap.** Eval semula mendapat penerbitan
   dimeterai baru yang merujuk yang asal melalui akar Merkle. Versi
   dijejaki, bukan ditulis ganti.

3. **Mod kegagalan yang diketahui boleh bertambah, tidak boleh
   berkurang.** Checkpoint yang dibekukan tidak boleh mempunyai mod
   kegagalan dibaiki. Jadi senarai yang diterbitkan secara berkesan
   adalah monotonik.

4. **Pengendalian penarikan.** Jika dipaksa mengeluarkan model
   daripada pengedaran, makmal berkomitmen untuk menerbitkan kenyataan
   dimeterai akhir tentang penarikan tersebut.

Makmal yang menerima pakai kit ini perlu memutuskan komitmen mana yang
boleh ia hormati sebenarnya. Jika anda tidak boleh hormati keempat-empatnya,
ubah suai FACT 06 *sebelum* memeterai untuk mencerminkan apa yang
anda boleh hormati, dan terima perlindungan yang dilemahkan akibatnya.
Memeterai komitmen yang anda tidak berhasrat untuk hormati adalah
lebih buruk daripada tidak memeterai langsung.

## Cara fork kit ini untuk pelepasan sebenar

```bash
# 1. Salin contoh ini ke dalam saluran pelepasan anda
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Sunting setiap fakta untuk pelepasan sebenar anda
$EDITOR facts/01_example_notice.txt   # BUANG — pelepasan anda bukan contoh
                                       # Gantikan dengan notis pelepasan untuk model anda
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # kad model kanonik
$EDITOR facts/05_eval_results.txt     # keputusan eval sebenar
$EDITOR facts/06_release_commitments.txt # komitmen yang anda boleh hormati

# 3. Kemas kini site/index.html untuk mencerminkan pelepasan sebenar.

# 4. Meterai.
bash build/seal.sh

# 5. Sahkan secara tempatan.
python3 build/verify.py

# 6. Lepaskan ke:
#    - Halaman pelepasan anda (di sebelah kad model dan pemberat)
#    - Rangkaian IPFS (skrip seal.sh sudah melakukan ini)
#    - Pilihan: pautkan ke penerbitan dimeterai daripada nota
#      pelepasan Hugging Face / GitHub anda
```

## Integrasi dengan saluran pelepasan sedia ada

Kit ini direka untuk bergabung dengan alat sedia ada, bukan
menggantikannya:

- **Hugging Face**: sertakan URL atau IPFS CID penerbitan dimeterai
  dalam README.md kad model. Arahkan pembaca ke meterai untuk dakwaan
  pelepasan yang stabil-bait.
- **Pelepasan GitHub**: sertakan resit OpenTimestamps
  (`merkle_root.txt.ots`) sebagai aset pelepasan. Pertikaian masa depan
  tentang "pelepasan telah berubah" kemudian dilabuhkan ke Bitcoin.
- **Standard kad model (Mitchell et al. 2019)**: kit ini serasi. Medan
  kad-model standard dipetakan ke FACTS 02–05 meterai. Anda
  menghasilkan kad model seperti biasa, dan sebagai tambahan,
  memeteraikannya.
- **Harnes eval (lm-evaluation-harness, BIG-bench, dll.)**: hash
  commit harnes yang tepat dan JSON output mentah; rujuk hash-hash
  tersebut dalam FACT 05. Run semula masa depan kemudian boleh
  diterbitkan semula secara bebas.

## Mengira hash pemberat

Untuk satu fail safetensors tunggal:

```bash
shasum -a 256 model.safetensors
```

Untuk checkpoint berbilang-fail (shard GGUF, safetensors yang
di-shard):

```bash
# Cantumkan hash dalam urutan tersusun, kemudian hash semula
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Hash akhir adalah apa yang masuk dalam FACT 03. Sertakan kedua-dua
hash per-shard dan hash agregat akhir agar pengguna boleh mengesahkan
shard individu semasa mereka memuat turun.

## Apa yang perlu diketahui oleh penerima (pengguna model anda)

Satu pelepasan model dengan penerbitan dimeterai-MYRIAM membenarkan
pengguna:

1. **Mengesahkan pemberat yang dimuat turun** dengan hash semula dan
   membandingkan dengan FACT 03.
2. **Mengesahkan kad model belum di-retcon** dengan menyemak FACT 04
   yang dimeterai terhadap versi yang sedang diterbitkan oleh makmal.
3. **Mengesahkan skor eval ialah yang berada pada masa pelepasan**
   dengan membandingkan dakwaan eval semasa makmal terhadap FACT 05
   yang dimeterai.
4. **Menuntut makmal bertanggungjawab terhadap komitmen pra-penggunaan**
   dengan menyemak tingkah laku sebenar terhadap FACT 06 yang
   dimeterai.

Pengguna yang menemui percanggahan mempunyai bukti kriptografi tentang
percanggahan tersebut. Mereka boleh menerbitkan bukti tersebut;
penerbitan dimeterai asal adalah labuhannya.

## Apa kit ini BUKAN

- Bukan pengganti untuk benar-benar melakukan semakan keselamatan.
  Meterai adalah *rekod* semakan keselamatan, bukan semakan itu
  sendiri.
- Bukan pengganti untuk eval sebenar. Meterai melabuhkan skor yang
  anda hasilkan; ia tidak mengesahkan kaedah.
- Bukan jaminan bahawa model itu selamat. Meterai mendokumenkan apa
  yang didakwa makmal tentang model pada masa pelepasan; ia tidak
  memperakui dakwaan tersebut.
- Bukan perlindungan terhadap penyalahgunaan model oleh pengguna
  hiliran.

## Satu nota tentang fine-tuning adversari

Satu kebimbangan AI-keselamatan yang biasa: seseorang fine-tune model
anda untuk membuang tingkah laku keselamatan dan mengedarkannya
semula. Meterai TIDAK BOLEH menghalang ini. Apa yang boleh dilakukan
meterai ialah:

- Labuhkan apa yang sepatutnya dilakukan oleh model *asal* (FACT 04).
- Labuhkan apakah skor eval asal (FACT 05).
- Sediakan titik rujukan terhadap mana fine-tune adversari boleh
  diukur.

Pengguna yang menemui pengagihan semula pihak ketiga boleh mengesahkan
sama ada pemberat sepadan dengan hash dimeterai asal. Jika tidak,
pengguna tahu bahawa mereka mempunyai model bukan-asal dan bahawa
sebarang dakwaan keselamatan yang diatributkan kepada makmal tidak
terpakai.

## Penutup

Memeterai satu pelepasan model adalah kerja tambahan kecil bagi
makmal: ~10 minit untuk mengira hash dan menjalankan skrip pemeteraian,
kemudian keputusan 30-saat tentang komitmen pra-penggunaan mana untuk
dimasukkan. Akauntabiliti yang ditambahkannya adalah tidak simetri:
kos kecil untuk makmal yang jujur, kekangan besar untuk makmal yang
sebaliknya akan senyap-senyap menyimpangkan dakwaan mereka.

Jika anda satu makmal AI yang sedang mempertimbangkan untuk menerima
pakai, kit ini adalah domain awam (CC0). Fork ia. Ubah suai ia.
Matematik adalah bahagian yang menanggung beban, bukan pelaksanaan
khusus.

## Lesen

Domain awam (CC0). Tiada atribusi diperlukan.
