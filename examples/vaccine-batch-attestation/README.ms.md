# Kit Pensijilan Kelompok Vaksin

*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

Contoh myriam-kit siap-pakai untuk pengeluar vaksin, pihak berkuasa jaminan
kualiti, dan agensi kesihatan awam yang ingin menerbitkan meterai
pelepasan kelompok yang dilabuhkan-Bitcoin dan tahan-pengusikan.

## Apa yang kit ini pertahankan

**Mod kegagalan yang ditangkap oleh meterai:**

- **Pengubahsuaian senyap dan retroaktif terhadap keputusan ujian
  pelepasan.** Kesemua 8 PDF ujian-pelepasan dalam contoh ini di-hash.
  Hashing semula selepas pelepasan mendedahkan sebarang pengubahsuaian.
- **Pertikaian tentang spesifikasi mana yang terpakai semasa pelepasan.**
  FACT 02 yang dimeteraikan mengandungi pengenalan kanonik kelompok dan
  hash rekod-pembuatan. Pertikaian masa depan "spesifikasinya sentiasa X"
  mempunyai pelabuhan awam.
- **Pengecilan senyap skop penarikan balik.** Komitmen farmakovigilans
  dalam FACT 05 dimeteraikan; kegagalan untuk memenuhinya dapat
  diperhatikan secara umum.
- **Penspesifikasian-semula retroaktif bagi kelompok yang luar-spek.**
  Jika keputusan ujian-pelepasan sebenarnya adalah LULUS sempadan yang
  kemudian diklasifikasikan semula sebagai GAGAL selepas pelepasan, hash
  laporan yang dimeteraikan membuktikan apa yang dinyatakan oleh PDF
  keputusan asal.

**Mod kegagalan yang TIDAK dilindungi:**

- Penipuan dalam proses pembuatan itu sendiri (meterai melabuhkan
  keputusan ujian, bukan integriti pembuatan).
- Kejadian buruk yang merupakan akibat biologi daripada kelompok yang
  sebaliknya lulus (meterai tidak mengesahkan keselamatan klinikal,
  hanya integriti dokumentasi).
- Pertikaian tentang versi mana spesifikasi pengawalseliaan adalah
  berkuasa.

## Bila menggunakan kit ini

Pertimbangkan untuk memeteraikan pelepasan kelompok jika:

- Anda adalah pengeluar vaksin yang ingin menunjukkan integriti forensik
  rekod pelepasan melebihi apa yang dikehendaki oleh pengawal selia
- Anda adalah pasukan QA yang menerima amalan "terbitkan apa yang kami
  saksikan"
- Anda adalah pengeluar berskala kecil/nasional dalam bidang kuasa
  dengan infrastruktur pengawalseliaan yang lebih lemah, ingin melabuhkan
  rekod kelompok terhadap pengesah global
- Anda adalah agensi kesihatan awam atau NGO yang menjalankan program
  pengeluaran vaksin bukan-komersial (cth. untuk penyakit yang
  diabaikan)

## Preseden mortaliti sejarah

- **Pencemaran heparin (2008, China):** kondroitin sulfat tersulfat-
  berlebihan tiruan dalam kelompok heparin. Manifes ujian-pelepasan yang
  dimeteraikan akan menjadikan pengubahsuaian senyap selepas-pelepasan
  rekod ujian dapat dikesan secara kriptografi.
- **Sianida Tylenol (1982):** pertikaian retroaktif mengenai titik asal
  pengusikan. Hash rekod-pembuatan yang dimeteraikan melabuhkan keadaan
  pra-pengedaran.
- **Pelbagai penarikan balik kelompok vaksin** di mana persoalan "adakah
  kelompok ini pernah diuji dengan betul" menjadi dipertikaikan
  bertahun-tahun kemudian.

Kit ini BUKAN penyelesaian untuk MANA-MANA daripada ini dalam erti kata
yang ketat — tetapi dalam setiap kes, pensijilan kelompok yang
dimeteraikan akan menyediakan garis masa forensik yang lebih bersih.

## Cara meng-fork kit ini untuk kelompok sebenar

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # ganti kandungan fiksyen dengan kelompok sebenar
bash build/seal.sh        # METERAI SEBELUM pengedaran bermula
python3 build/verify.py   # sahkan
```

**MASA KRITIKAL**: meterai pada saat pelepasan QA, SEBELUM kelompok
diedarkan. Meterai selepas pengedaran adalah lebih lemah secara forensik.

## Integrasi dengan infrastruktur farmaseutikal sedia ada

- **Penyerahan eCTD (FDA / EMA):** URL penerbitan atau IPFS CID yang
  dimeteraikan boleh dirujuk dalam bahagian Modul 3 (kualiti)
- **Praprakelayakan WHO:** manifes yang dimeteraikan menunjukkan rantaian
  ujian pra-pelepasan kepada bidang kuasa bukan-FDA/EMA
- **Maklum balas farmakovigilans:** FACT 05 mengikat pengeluar kepada
  pelaporan termeteraikan kiraan AE agregat pada 6 dan 12 bulan
- **Sistem penarikan balik (RxConnect, MedWatch):** jika penarikan balik
  diperlukan, skop penarikan balik itu sendiri dimeteraikan di bawah
  MYRIAM, menyediakan pengesahan awam bahawa semua lot yang diedarkan
  sedang ditangani

## Apa yang kit ini TIDAK gantikan

- Penyerahan pengawalseliaan FDA / EMA / WHO
- Jejak audit GMP (meterai melabuhkan KEPUTUSAN, bukan rekod proses
  mentah)
- Pangkalan data farmakovigilans (VAERS / EudraVigilance)
- Sistem penyelarasan penarikan balik

## Lesen

Domain awam (CC0). Fork ia. Tiada atribusi diperlukan.
