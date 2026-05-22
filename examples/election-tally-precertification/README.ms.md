*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

# Kit Meterai Pra-Pensijilan Kiraan Pilihan Raya

Satu contoh myriam-kit serah-kunci untuk lembaga kanvasser daerah, pihak berkuasa pilihan raya negeri, dan pemerhati integriti pilihan raya yang ingin menerbitkan meterai berlabuh-Bitcoin dan tahan-usik bagi suatu kiraan pada saat tepat pensijilan.

**Menutup** [isu #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Apa yang kit ini TIDAK lakukan (baca dahulu)

Meterai ialah cap masa kriptografi bagi apa yang disahkan. Ia tidak boleh mengesahkan sama ada apa yang disahkan itu betul. Mod kegagalan berikut adalah **di luar domain meterai**:

1. **Kompromi mesin pengundian.** Jika perisian tegar telah diusik atau jumlah undi disalah kira, meterai akan melabuhkan angka yang salah dengan integriti yang tinggi. Meterai memerhati keluaran sistem pentabulatan; ia tidak mempunyai keterlihatan ke dalam sistem itu sendiri.

2. **Penindasan undi / pelucutan hak struktur.** Penutupan tempat mengundi, ketidaksamaan undang-undang ID, bias kadar penolakan undi pos, dan pembersihan pendaftaran adalah hulu daripada pensijilan. Meterai merekodkan undi yang dikira, bukan undi yang sepatutnya dikira.

3. **Maklumat salah pilihan raya.** Meterai tidak mengadili tuntutan tentang pilihan raya yang dibuat oleh calon, media, atau platform. Pensijilan yang dimeterai boleh dipetik dalam naratif maklumat salah semudah dalam pertahanan terhadapnya. Cap masa kriptografi adalah neutral-kandungan.

4. **Penipuan pra-pensijilan semasa pengumpulan atau pengiraan undi.** Ketidakteraturan penuaian undi, gangguan kotak pengundian, putus rantaian jagaan semasa tetingkap pengiraan — semua berlaku sebelum saat meterai. Meterai tidak dapat mengesannya secara retroaktif.

5. **Paksaan terhadap pihak berkuasa pensijilan.** Pensijilan yang dipaksa menghasilkan meterai yang sah secara kriptografi bagi keputusan yang dipaksa. Meterai mengesahkan bahawa seorang pegawai telah menandatangani, bukan mengapa.

6. **Pensijilan yang salah yang tidak pernah diperbetulkan kemudian.** Nilai meterai bergantung pada proses pencarian kebenaran kemudian (audit, kiraan semula, litigasi) yang boleh dibandingkan dengan meterai. Jika proses sedemikian tidak pernah berjalan, meterai berdiri sebagai satu-satunya rekod dan mungkin mengeraskan kesilapan.

7. **Anomali statistik dan pengesanan corak.** Meterai tidak menandakan margin yang tidak munasabah, anomali geografi, atau sisihan undang-undang Benford. Itu adalah tugas analitikal terhadap data yang dimeterai, bukan sifat meterai.

8. **Perlumbaan papan-bawah dengan jejak audit yang nipis.** Perlumbaan yang lebih kecil mempunyai pencetus kiraan semula yang lebih lemah; satu meterai tunggal tidak dapat secara bermakna meliputi semua perlumbaan pada satu undi tanpa skop per-perlumbaan.

**Bahagian had-jujur di atas adalah bahagian penanggung-beban kit ini.** Pegawai yang percaya bahawa pemateraian sama dengan kesahihan akan menggunakannya sebagai perisai. Kit mesti berkata dengan terus terang: ini ialah *primitif tidak-boleh-disangkal untuk saat pensijilan*, bukan bukti ketepatan pilihan raya.

---

## Apa yang kit ini MESTI MENOLAK untuk memeterai

Kit ini dikonfigurasi untuk menolak corak fakta berikut walaupun pengguna dengan kuasa tandatangan yang sah mengemukakannya:

- **Pengenalan pengundi individu.** Tiada fakta boleh menamakan pengundi, mengaitkan undi kepada pengundi, atau mendedahkan apa-apa medan yang boleh mengenal pasti semula seseorang.
- **Keputusan padanan-tandatangan per-undi.** Sarat-PII; pemateraian mencipta rekod kekal keputusan yang mungkin dicabar kemudian.
- **Apa-apa fakta yang penerbitannya akan mengenal pasti pengundi yang terdedah.** Termasuk keputusan peringkat-cabang dalam cabang yang begitu kecil sehingga pilihan undi boleh disimpulkan (biasanya <50 undi).
- **Kiraan yang dimeterai sebelum semua undi dikira.** Kit menolak kiraan separa yang dipersembahkan sebagai "kiraan." Pra-pensijilan bermaksud *semua undi dikira, sebelum pensijilan rasmi* — bukan *semasa pengiraan*.
- **Pensijilan sementara atau bersyarat.** Meterai mesti mencerminkan suatu fakta, bukan satu syarat.
- **Kiraan yang mengecualikan kohort litigasi tertunda** tanpa fakta-pendamping yang dimeterai secara eksplisit yang mendedahkan pengecualian itu.
- **Pemateraian oleh sesiapa selain pihak berkuasa pensijilan** bagi bidang kuasa tersebut.

Penolakan itu sendiri boleh dimeterai sebagai fakta ("Pihak berkuasa ini meminta pemateraian X; kit menolak menurut peraturan-penolakan Y"), mencipta rekod awam penyalahgunaan yang cuba dilakukan.

---

## Apa yang kit ini MEMETERAIKAN

8 fakta pada saat pensijilan:

1. **Notis contoh** — mengisytiharkan penerbitan ini sebagai contoh (atestasi sebenar mengeluarkan atau menggantikan ini).
2. **Pengenalan bidang kuasa** — daerah, tarikh pilihan raya, pihak berkuasa pensijilan, pegawai pensijilan mengikut nama + peranan.
3. **Kiraan yang disahkan** — jumlah undi per-pertandingan per-calon + lebih/kurang-undi + tulisan-masuk.
4. **Perakaunan undi dan rekonsiliasi** — jumlah dilemparkan, jumlah ditabulasi, jumlah ditolak mengikut kategori, pecahan mod, penyebut pengundi-berdaftar.
5. **Manifes peralatan dan jejak-audit** — model tabulator + cincangan perisian tegar, cincangan fail CVR, cincangan arkib imej-undi, cincangan log jagaan, cincangan polisi padanan-tandatangan.
6. **Ambang dan pencetus pada pensijilan** — ambang padanan-tandatangan yang berkuat kuasa, ambang pencetus kiraan-semula, margin sebenar per-pertandingan, komitmen biji RLA.
7. **Pendedahan pendamping dan rekod penolakan** — litigasi tertunda, anomali pasca-kiraan dalam semakan, kohort yang dikecualikan, ahli lembaga yang membantah; senarai eksplisit corak yang kit menolak untuk memeterai.
8. **Prinsipal penandatangan** — pengenalan Lembaga Kanvasser + nama dan parti setiap penandatangan + maklumat kunci kriptografi.

Setiap fakta berakhir dengan konvensyen pintu-penolakan: *"Fakta ini menegaskan hanya X. Ia tidak menegaskan Y"* (di mana Y ialah mod kegagalan terdekat daripada bahagian "TIDAK lakukan" di atas).

---

## Apa yang kit ini bertahan terhadap

- **Semakan senyap pasca-pensijilan terhadap jumlah undi** — apa-apa perubahan integer kepada FAKTA 03 menghasilkan SHA-256 yang berbeza, akar Merkle yang berbeza, gagal pengesahan OTS.
- **"Undi dijumpai" diserap secara senyap** — aritmetik rekonsiliasi FAKTA 04 ditetapkan pada pensijilan.
- **Tuntutan penggantian perisian tegar** — FAKTA 05 membekukan manifes peralatan pada pensijilan.
- **Penggantian artifak-audit pasca-pensijilan** — manifes cincangan FAKTA 05 menangkap apa-apa perubahan pasca-pensijilan kepada CVR, imej undi, log jagaan, atau polisi padanan-tandatangan.
- **Definisi semula ambang dan pencetus** — FAKTA 06 membekukan peraturan yang berkuat kuasa pada pensijilan (ambang padanan-tandatangan, pencetus kiraan-semula, had risiko RLA).

## Kes bersejarah atau hampir-bersejarah yang kit ini boleh membantu

Kit ini akan menghasilkan sauh yang berguna — *bukan pembetulan* — dalam kes yang melibatkan:

- **Antrim County, Michigan (2020).** Keputusan tidak rasmi awal menunjukkan pertukaran-calon yang kemudian dibetulkan kepada hasil sebaliknya. Meterai pra-pembetulan akan memberikan rujukan awam bagi apa yang pengumuman asal katakan vs. apa yang pembetulan katakan, dengan kedua-duanya disahkan secara kriptografi.
- **Maricopa County, Arizona (2020–2022).** Beberapa lelaran jumlah yang dikira semula/diperiksa semula beredar. Meterai saat-pensijilan akan memberikan titik rujukan yang jelas yang setiap kiraan berikutnya boleh dibezakan.
- **Florida 2000 (kanvas Bush v. Gore).** Jumlah pensijilan daerah-demi-daerah beralih di bawah tekanan kiraan semula; meterai per-daerah pra-kiraan-semula akan memelihara apa yang setiap daerah sahkan sebelum prosedur kiraan-semula manual bermula.
- **Pelbagai pilihan raya asing dengan "pembetulan" pasca-pensijilan yang didokumenkan.** Bebas-bidang kuasa.

Kit ini TIDAK akan menyelesaikan pertikaian asas tentang integriti mesin pada 2020, pertikaian polisi undi pos, atau apa-apa pilihan raya di mana soalan teras adalah fakta yang dipertikaikan dan bukan rekod yang dipertikaikan.

## Bila menggunakan kit ini

- Bidang kuasa anda mempunyai proses pensijilan yang stabil dan diaudit serta ingin menambah sauh awam yang tidak berubah.
- Anda menjangka penelitian pasca-pensijilan dan ingin titik rujukan yang tahan-usik.
- Anda mempunyai kuasa undang-undang untuk menerbitkan set fakta yang disenaraikan tanpa mendedahkan PII.
- Anda mempunyai proses audit selari atau RLA supaya meterai boleh dibandingkan dengan output pencarian kebenaran.

## Bila TIDAK menggunakan kit ini

- **Jangan gunakan sebagai pengganti audit had-risiko, kiraan semula tangan, atau audit pasca-pilihan raya.** Kit ini *bertambah*, bukan penggantian.
- **Jangan gunakan jika pegawai pensijilan bukan pembuat keputusan sebenar** (mencipta atribusi palsu).
- **Jangan gunakan pertengahan-tabulasi.** Kit ini khusus untuk saat pensijilan. Meterai kiraan-separa mencipta titik rujukan yang mengelirukan.
- **Jangan gunakan untuk menuntut bahawa pilihan raya itu adil, tepat, atau sah** — ia tidak boleh berbuat demikian.
- **Jangan gunakan di bawah tekanan untuk memeterai lebih awal daripada saat pensijilan, atau untuk meninggalkan pendedahan fakta-pendamping.** Tolak, dan meterai penolakan itu.
- **Jangan gunakan sebagai teater kesahihan.** Meterai kiraan yang menipu adalah rekod awam kekal penipuan, bukan pertahanan terhadapnya. Primitif itu memotong kedua-dua belah; itulah kejujurannya.

## Bagaimana untuk membentuk semula kit ini untuk pensijilan sebenar

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # gantikan kandungan fiksyen dengan yang sebenar
bash build/seal.sh     # meterai PADA atau selepas tandatangan pensijilan rasmi
python3 build/verify.py
```

**Pemasaan kritikal:** meterai PADA saat pensijilan, BUKAN sebelumnya. Meterai sebelum pensijilan rasmi mencipta rekod "ini adalah keputusan rasmi" yang positif-palsu. Meterai selepas itu adalah tidak-boleh-disangkal konvensional.

## Integrasi dengan infrastruktur pilihan raya sedia ada

- **Lembaga Pilihan Raya Negeri / pensijilan EAC.** Kit menerbitkan bersama dokumen pensijilan rasmi. Ia tidak menggantikan pensijilan statutori.
- **Audit had-risiko.** Cincangan CVR dalam FAKTA 05 adalah cincangan yang sama yang dimakan oleh alat RLA. Meterai mengikat CVR yang diaudit kepada jumlah yang disahkan.
- **Prosedur kiraan semula.** Kiraan semula yang dicetuskan di bawah undang-undang negeri menghasilkan set-fakta yang dimeterai BAHARU (cap masa berbeza, cincangan berbeza, bidang kuasa sama). Kedua-dua meterai wujud bersama; tiada yang menulis ganti yang lain. Beza antara meterai adalah rekod awam tentang apa yang kiraan semula ubah.
- **Bahasa Penandaan Pilihan Raya (EML) dan Format Data Biasa (CDF).** Badan fakta sepatutnya boleh diterbitkan daripada keluaran EML/CDF sedia ada bidang kuasa untuk mengekalkan format-data agnostik kit.
- **Penandatangan lembaga kanvasser dwi-pihak.** Variasi pelbagai-tandatangan disyorkan untuk bidang kuasa dengan lembaga kanvas berimbang-parti.

## Apa yang kit ini TIDAK gantikan

- Pensijilan statutori di bawah undang-undang pilihan raya negeri
- Pensijilan sistem pengundian EAC
- Audit had-risiko / kiraan semula tangan
- Prosedur kiraan semula dan audit pasca-pilihan raya
- Perintah mahkamah atau litigasi pertikaian pilihan raya

## Mengapa kit ini wujud dalam v0.3.0+

Ini ialah contoh kerja ke-6 yang dihantar bersama myriam-kit. Kit ini dihasilkan melalui proses autopenyelidikan gaya-Karpathy yang didokumenkan dalam `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Tiga varian gesaan (peniruan / prinsip-pertama / kekangan-pertama) menghasilkan garis besar kit selari; varian kekangan-pertama mendapat markah tertinggi pada rubrik berwajaran, dan kit akhir mensintesis strukturnya dengan kekohesi varian peniruan dan perincian operasi varian prinsip-pertama.

Autopenyelidikan itu sendiri didokumenkan sebagai corak gesaan dalam `~/Genesis/calc/PROMPT_LIBRARY_v0.md` untuk kegunaan masa hadapan.

## Lesen

Domain awam (CC0). Cabang dia. Tiada atribusi diperlukan.
