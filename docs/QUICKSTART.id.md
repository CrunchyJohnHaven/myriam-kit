*Terjemahan bahasa Indonesia — untuk versi asli bahasa Inggris, lihat [QUICKSTART.md](QUICKSTART.md)*

# Mulai cepat

Lima menit dari clone hingga publikasi tersegel. Telah diuji di macOS;
seharusnya bekerja di Linux; pengguna Windows memerlukan WSL.

## 0. Prasyarat

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Penyiapan kerangka

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Sunting fakta

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Setiap berkas adalah satu fakta. UTF-8. Akhiran baris LF. Pola nama berkas
adalah `NN_short_name.txt` dengan NN diisi nol di depan. Berkas-berkas
diurutkan secara leksikografis ke dalam pohon Merkle, sehingga 02 selalu
berada setelah 01.

Tip: rumuskan setiap fakta sebagai *peristiwa penamaan atau pernyataan*,
bukan sebagai klaim ontologis tentang dunia. "Acme Corp telah menyatakan
bahwa batch X lulus uji Y" dapat diverifikasi. "Batch X aman" tidak.

## 3. Jalankan daemon IPFS (satu kali per mesin)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Segel

```bash
bash build/seal.sh
```

Perintah ini akan:
1. Meng-hash setiap fakta (SHA-256), menghitung akar Merkle gaya Bitcoin.
2. Menstempel akar tersebut dengan OpenTimestamps melalui dua kalender
   independen (alice + finney secara default — timpa via
   `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Mem-pin direktori `site/` ke IPFS dan mencetak CID-nya.

Total: ~10 detik dengan daemon IPFS yang sudah hangat.

## 5. Sunting `site/index.html`

Ganti placeholder template dengan fakta, hash, dan akar Merkle Anda yang
sesungguhnya. Hash per-fakta yang ditampilkan harus cocok dengan berkas
per-fakta, atau halaman akan gagal pada verifikasi-diri sendiri.

Untuk setiap fakta, salin isi berkas .txt ke dalam blok
`<div class="fact">` dan letakkan SHA-256-nya di dalam
`<div class="hash">` tepat di bawahnya. Akar Merkle ditempatkan di
bagian segel kriptografis.

(Ya, ini bisa dibuat otomatis. Sengaja tidak: langkah manual adalah
langkah peninjauan manusia. Protokol ini tidak melindungi dari
penerbitan sesuatu yang belum Anda baca.)

## 6. Verifikasi secara lokal

```bash
python3 build/verify.py
```

Keluaran yang diharapkan:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" adalah hal yang normal — kalender OTS akan meningkatkan
atestasi tersebut menjadi atestasi Bitcoin penuh dalam beberapa jam.

## 7. Deploy

Pilih salah satu:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → seret `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` di `site/`, push ke repo, aktifkan Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (hosting statis aktif)
- **VPS biasa apa pun**: `scp -r site/* user@host:/var/www/html/`

CID IPFS dari langkah 4 memberi Anda URL beralamat-konten tambahan:
`https://<CID>.ipfs.dweb.link/`. Gunakanlah.

## 8. Tingkatkan tanda terima OTS (nanti)

Dalam ~beberapa jam setelah menyegel, jalankan:

```bash
ots upgrade build/merkle_root.txt.ots
```

Perintah ini mengubah atestasi pending tiap kalender menjadi atestasi
Bitcoin penuh yang merujuk ke blok tertentu. Deploy ulang berkas `.ots`
ke host Anda setelah peningkatan.

## 9. Selesai

Anda telah menerbitkan sekumpulan kecil fakta dengan cara yang
memungkinkan pihak ketiga mana pun untuk:

- Mengambil semua fakta melalui HTTP biasa dari host Anda
- Menghitung ulang akar Merkle dari byte fakta
- Membandingkannya dengan akar yang Anda terbitkan
- Memverifikasi bahwa akar tersebut dikomitkan ke Bitcoin pada waktu
  stempel OTS
- Mengambil fakta yang sama secara independen melalui IPFS pada CID
  yang diterbitkan
- Mengonfirmasi bahwa semua hash cocok

Jika ada langkah yang gagal, telah terjadi tampering. Pembaca tidak
harus mempercayai Anda. Mereka hanya perlu melakukan perhitungannya.
