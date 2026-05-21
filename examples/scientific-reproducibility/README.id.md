*Terjemahan Bahasa Indonesia — untuk versi asli dalam bahasa Inggris, lihat [README.md](README.md)*

# Kit Reproduksibilitas Ilmiah

Sebuah contoh turnkey myriam-kit untuk kelompok riset, jurnal, dan institusi yang berfokus pada reproduksibilitas yang ingin menerbitkan manifes reproduksibilitas yang ditambatkan pada Bitcoin dan terbukti tidak diubah (tamper-evident) bersama dengan sebuah makalah atau praterbitan.

## Apa yang dihasilkan kit ini

Sebuah publikasi yang disegel berisi, untuk satu studi:

1. Identifikasi studi (judul makalah, penulis, institusi, pendana, COI)
2. **SHA-256 arsip data mentah** — dataset kanonik
3. **Hash pipeline analisis** — skrip + digest Docker image + dependensi yang disematkan
4. **Hash bundel keluaran yang diharapkan** — apa yang seharusnya dihasilkan oleh peneliti reproduktor yang setia
5. Protokol reproduksi + komitmen publikasi pasca-hasil
6. Pihak penandatangan

Segel ini dimaksudkan untuk tahap **pra-analisis**: data dibekukan, pipeline difinalisasi, keluaran yang diharapkan dihitung, SEMUA sebelum hasil apa pun dilihat untuk tujuan penulisan makalah.

## Apa yang dilindungi kit ini

**Mode kegagalan yang ditangkap oleh segel:**

- **p-hacking**: perubahan pasca-hoc pada analisis setelah melihat hasil dapat dideteksi melalui perbedaan antara FACT 04 yang disegel dan pipeline yang diterbitkan.
- **HARKing** (Hypothesizing After Results are Known): hipotesis yang dipra-registrasi dalam FACT 02 stabil pada tingkat byte.
- **Manipulasi data pasca-makalah**: meng-hash ulang arsip data terhadap FACT 03 mengungkap modifikasi apa pun.
- **Penyimpangan pipeline**: meng-hash ulang pipeline analisis terhadap FACT 04 menangkap perubahan diam-diam.
- **Permainan kepenulisan**: menambah atau menghapus penulis secara diam-diam setelah publikasi menjadi terdeteksi terhadap FACT 02 yang disegel.

**Mode kegagalan yang TIDAK dicakup:**

- Penipuan dalam pengumpulan data mentah (segel menambatkan data pada titik penyegelan, bukan pengumpulan)
- Non-reproduksibilitas biologis / empiris (segel menambatkan reproduksibilitas komputasional saja)
- Masalah ukuran sampel atau validitas populasi (ini adalah pertanyaan desain studi)
- Kebenaran klaim yang mendasari (segel menambatkan apa yang diklaim, bukan apakah dunia cocok dengan klaim tersebut)

## Kapan menggunakan kit ini

Pertimbangkan untuk menyegel jika:

- Anda adalah kelompok riset yang menjalankan analisis berisiko tinggi (uji klinis, evaluasi sistem AI, studi replikasi) dan menginginkan integritas forensik di luar stempel waktu OSF / GitHub
- Anda adalah peneliti karier awal yang menginginkan perlindungan reputasi yang asimetris: pra-analisis yang disegel berarti kritik masa depan "mereka melakukan p-hacking" memiliki falsifier publik
- Anda adalah editor jurnal atau pemimpin proyek replikasi yang ingin mendorong pra-registrasi kriptografi-tingkat untuk sebagian dari makalah
- Anda bekerja pada analisis di mana tweak pasca-hoc memiliki konsekuensi lapangan yang berarti (psikologi, ekonomi perilaku, riset medis)

## Preseden mortalitas / kerugian historis

Relevansi-mortalitas kit ini bersifat tidak langsung:

- **Ketidakreproduksibilitas riset sel punca / kanker:** beberapa makalah telah menyebabkan kerugian pasien melalui uji klinis yang salah arah. Pra-registrasi yang disegel dari pipeline asli akan menambatkan perbandingannya.
- **Kontroversi efektivitas Tamiflu:** tinjauan Cochrane memakan waktu bertahun-tahun sebagian karena akses data mentah diperdebatkan. Hash data yang disegel pada saat publikasi akan membuat sengketa akses data segera dapat diselesaikan.
- **Krisis ketidakreproduksibilitas umum:** biaya mortalitas tingkat-lapangan dari riset biomedis yang tidak dapat direproduksi sangat signifikan (Begley & Ellis 2012 memperkirakan >50% temuan praklinis tidak dapat direproduksi). Penambatan kriptografi adalah salah satu pengungkit struktural.

## Cara meng-fork kit ini

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## Integrasi dengan infrastruktur akademik yang ada

- **arXiv / bioRxiv / medRxiv**: sertakan URL segel MYRIAM atau IPFS CID dalam abstrak atau materi pelengkap
- **OSF**: lampirkan artefak segel ke proyek OSF bersama dengan formulir pra-registrasi konvensional
- **AsPredicted**: sertakan URL segel MYRIAM dalam dokumen pra-registrasi
- **GitHub**: hash commit pipeline analisis adalah yang ditambatkan oleh FACT 04; GitHub menyediakan sumber, MYRIAM menambatkan byte
- **Zenodo / Figshare / OpenAIRE**: deposit data mentah, kemudian segel hash deposit; segel secara forensik lebih sulit untuk diganti secara diam-diam dibanding metadata deposit
- **Materi pelengkap jurnal**: sertakan artefak segel MYRIAM sebagai file pelengkap pada saat pengajuan

## Apa yang TIDAK digantikan kit ini

- Persetujuan IRB / komite etika
- Tinjauan sejawat
- Studi replikasi (reproduksibilitas komputasional ≠ reproduksibilitas empiris)
- Perjanjian akses data untuk data sensitif

## Catatan tentang urutan penulis dan kredit

Segel menambatkan DAFTAR PENULIS pada waktu penyegelan. Perselisihan tentang kepenulisan yang muncul pasca-publikasi dapat dievaluasi terhadap daftar yang disegel. Ini adalah pengungkit akuntabilitas kecil — penting bagi ECR yang ditambahkan atau dihapus secara diam-diam.

## Lisensi

Domain publik (CC0). Gunakan, ubah, abaikan, fork.
