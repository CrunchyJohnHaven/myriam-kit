# Kit Meterai Manifes Pemberi Maklumat

*Terjemahan Bahasa Melayu — untuk versi asal dalam bahasa Inggeris, lihat [README.md](README.md)*

Satu contoh myriam-kit siap pakai untuk pemberi maklumat yang menghadapi mod
kegagalan khusus di mana **bukti dikuburkan, disunting, atau dipertikaikan oleh
perantara antara pemberi maklumat dan orang awam**. Kes-kes sejarah kanonik
yang dipertahankan oleh kit ini:

- Boeing 737 MAX (laporan keselamatan dalaman dikecilkan/dikuburkan)
- Theranos (kebimbangan ujian makmal disekat selama bertahun-tahun)
- Laporan pemeriksa FDA yang disunting selepas dihantar
- Frances Haugen / Facebook (manifes termeterai akan membuktikan
  dokumen adalah tulen dan wujud pada masa yang didakwa)

Apa yang kit ini pertahankan (dalam istilah protokol):

- T1–T3 dalam [FACT 05](facts/05_threat_model.txt): pertikaian awam berkenaan
  kandungan dokumen, dakwaan bahawa dokumen tidak termeterai pada masa yang
  didakwa, dakwaan pemalsuan secara retroaktif.
- T9: pihak ketiga yang menyerahkan salinan yang diubah kepada wartawan.

Apa yang kit ini **tidak** pertahankan:

- Tindakan balas peribadi terhadap pemberi maklumat (T7).
- Tekanan ke atas pemberi maklumat untuk menarik balik (T4, sebahagiannya
  diredakan oleh FACT 07 yang menjadikan penarikan balik secara senyap
  dapat dikesan secara terbuka).
- Tindakan undang-undang terhadap pemberi maklumat atas pendedahan itu sendiri (T5).
- Mendiskreditkan keperibadian pemberi maklumat (T8).
- Perantara yang menggugurkan cerita secara senyap (T10).

Jika anda seorang pemberi maklumat yang sedang mempertimbangkan untuk menggunakan
kit ini, **baca seluruh README ini dahulu**. Protokol ialah satu alat. Protokol
bukanlah pengganti penasihat undang-undang, wartawan, pengawal selia, atau keselamatan
operasi yang berhati-hati.

## Apa yang dihasilkan oleh kit ini

Satu *manifes* bukti yang dimeterai secara kriptografi (bukan bukti itu
sendiri) yang membuktikan:

1. Bait-bait tertentu setiap fail bukti telah wujud pada saat
   pemeteraian.
2. Pemeteraian itu berlaku pada atau sebelum masa tertentu (melalui
   pengesahan Bitcoin OTS).
3. Asal-usul, dakwaan, model ancaman, protokol penerima, dan
   komitmen tiada-penarikan-balik-senyap kesemuanya diisytiharkan bersama.

Dokumen yang mendasarinya kekal dalam milikan anda sehingga anda menghantarnya
kepada penerima. Penerima mengesahkan bahawa mereka menerima bait yang sama
seperti yang anda meterai.

## Bila hendak menggunakan kit ini

Anda patut mempertimbangkan untuk memeteraikan manifes **sebelum** menghantar
bukti kepada wartawan, pengawal selia, atau peguam, jika kesemua perkara berikut
adalah benar:

- Anda mempunyai bukti dalam bentuk digital (PDF, e-mel, imej, dsb.) yang
  anda ingin pelihara sebagai tulen bait demi bait.
- Anda menjangkakan bahawa perantara mungkin mengubah, mempertikaikan, atau
  mengubur bukti tersebut.
- Anda boleh menyimpan dokumen yang mendasarinya dalam milikan anda sehingga
  ia dihantar.
- Anda boleh menerbitkan manifes secara terbuka **tanpa** mendedahkan
  kandungan dokumen (hanya cincang sahaja yang awam).
- Anda telah menimbangkan risiko untuk menjadi pemberi maklumat yang
  dapat dikenal pasti secara terbuka (medan prinsipal-penandatangan). Jika
  tanpa nama, gunakan nama samaran secara konsisten merentas semua penerbitan
  berkaitan.
- Anda telah berunding dengan peguam tentang undang-undang perlindungan
  pemberi maklumat di bidang kuasa anda.

## Bila TIDAK boleh menggunakan kit ini

JANGAN gunakan kit ini jika:

- Dokumen itu sendiri mengandungi maklumat peribadi tentang pihak ketiga
  (pesakit, pelanggan, pekerja) yang tidak sepatutnya dijadikan boleh-dicincang
  secara awam. Cincang versi yang telah ditapis, bukan yang asal.
- Tindakan menerbitkan manifes itu sendiri akan mengenal pasti pemberi
  maklumat dengan cara yang mereka tidak persetujui.
- Anda belum berunding dengan peguam. Protokol ialah alat; undang-undang
  perlindungan pemberi maklumat adalah khusus mengikut bidang kuasa dan
  hidup di luar protokol.
- Anda mungkin ingin menarik balik mana-mana dakwaan tunggal kemudian.
  Meterai adalah kekal; pembetulan termeterai yang baharu ialah satu-satunya
  cara yang jujur untuk menyemak semula.
- Anda melakukan ini di bawah paksaan atau tekanan masa. Protokol ini
  menguatkan tekanan paksaan; pintu-penolakan (myriam-kit `SPEC §8`) terpakai
  kepada pemberi maklumat sebagaimana ia terpakai kepada penerbit.

## Cara menggarpukan kit ini untuk pendedahan sebenar

```bash
# 1. Copy this example into a new directory
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Remove the fictional content; replace with your real facts.
# Each file under facts/ is one fact. Read each and replace.
$EDITOR facts/01_example_notice.txt   # change to a real cover statement
$EDITOR facts/02_provenance.txt       # real provenance of your evidence
$EDITOR facts/03_evidence_manifest.txt # hash your real documents and list them
$EDITOR facts/04_allegation_summary.txt # your real allegation
$EDITOR facts/05_threat_model.txt     # your real expected responses
$EDITOR facts/06_recipient_protocol.txt # adjust for your recipient
$EDITOR facts/07_no_retraction_commitment.txt # your no-retraction declaration
$EDITOR facts/08_signing_principal.txt # your real signing identity (or pseudonym)

# 3. Update site/index.html to reflect the real facts.
# The seal.sh script does NOT auto-populate the HTML; the manual edit
# is the human-review step.
$EDITOR site/index.html

# 4. Seal.
bash build/seal.sh
# Outputs: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Verify locally.
python3 build/verify.py

# 6. Publish the manifest (NOT the documents) to any of:
#    - A static host you control (Cloudflare Pages, GitHub Pages, etc.)
#    - The IPFS network at the printed CID
#    - Both (recommended)

# 7. Separately, transmit the underlying documents to the recipient
#    via a secure channel of your choice (Signal, SecureDrop, etc.).
#    The recipient verifies file hashes against your manifest.
```

## Mengira cincang untuk fail-fail bukti sebenar

Untuk mencincang fail dokumen dengan SHA-256:

```bash
shasum -a 256 my_document.pdf
```

64 aksara heks yang pertama ialah SHA-256. Letakkan itu ke dalam manifes.

Anda boleh mencincang banyak fail serentak:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Itu memberikan data untuk `facts/03_evidence_manifest.txt`.

## Nota keselamatan operasi

Protokol MYRIAM TIDAK menyediakan keselamatan operasi. Ia menyediakan
*ketahanan keterangan*. Anda masih perlukan:

- Saluran komunikasi yang selamat kepada peguam anda
  ([Signal](https://signal.org/), berhadapan, atau saluran selamat yang
  telah ditetapkan oleh peguam anda)
- Lokasi simpanan yang selamat untuk dokumen yang mendasarinya (disulitkan
  semasa rehat, bukan di perkhidmatan awan yang boleh diakses oleh majikan anda)
- Peranti yang bersih untuk pemeteraian (komputer riba peribadi yang tidak
  dikaitkan dengan akaun majikan; sebaik-baiknya hanya digunakan untuk
  tujuan ini sahaja)
- Rangkaian yang bersih untuk penerbitan (bukan rangkaian majikan anda,
  bukan IP rumah anda jika majikan anda mungkin memanggil ISP anda dengan sapina)

Bacaan yang dicadangkan tentang keselamatan operasi untuk pemberi maklumat:

- [Dokumentasi SecureDrop oleh The Intercept](https://securedrop.org/)
- [Sumber Freedom of the Press Foundation](https://freedom.press/)
- [Panduan pertahanan-diri pengawasan oleh EFF](https://ssd.eff.org/)

Rujuk panduan tersebut SEBELUM anda memulakan proses pemeteraian. Protokol
tidak melindungi terhadap pilihan opsec yang buruk yang dibuat sebelum protokol
dipanggil.

## Apa yang penerima patut tahu

Hantarkan kepada penerima README ini bersama manifes yang termeterai. Manifes
itu sendiri mengandungi protokol penerima (FACT 06), tetapi README ini
mengembangkan peranan penerima:

- **Wartawan**: sahkan integriti manifes itu sendiri dahulu. Kemudian
  minta dokumen melalui saluran selamat yang berasingan. Sahkan
  bahawa SHA-256 setiap dokumen sepadan dengan manifes sebelum penerbitan.
  JANGAN terbitkan dokumen tanpa kebenaran pemberi maklumat;
  terbitkan kewujudan manifes yang termeterai dan kesimpulan pengesahan anda.
- **Pengawal selia**: proses pengesahan yang sama. Manifes yang termeterai
  beserta dokumen yang sepadan ialah bentuk keterangan yang paling kukuh
  yang ada di luar pengumpulan rantaian-jagaan rasmi.
- **Peguam**: manifes yang termeterai memberikan pemasakan forensik untuk
  kewujudan dokumen pada masa yang didakwa. Sama ada ia memenuhi peraturan
  keterangan bidang kuasa tertentu adalah untuk anda menentukan.

## Apa kit ini BUKAN

- Bukan pengganti penasihat undang-undang.
- Bukan jaminan bahawa sesiapa akan bertindak ke atas pendedahan anda.
- Bukan perlindungan terhadap tindakan balas.
- Bukan pengesahan kandungan dokumen (hanya bait-pada-masa-pemeteraian).
- Bukan cara untuk berkomunikasi dengan sesiapa secara tanpa nama — meterai
  itu awam; jika nama prinsipal-penandatangan anda adalah sebenar, anda
  dikenal pasti.

## Penutup

Manifes yang termeterai adalah benda kecil. Ia ialah satu aliran bait yang
membuktikan satu set aliran bait yang lebih besar telah wujud dalam bentuk
tertentu pada masa tertentu. Kekecilan itulah kekuatannya: ia hanya melakukan
satu perkara, dan ia melakukan satu perkara itu sepanjang hayat rantaian
blok Bitcoin.

Jika anda sedang membaca ini kerana anda sedang mempertimbangkan untuk menjadi
pemberi maklumat, sila: berbincang dengan peguam dahulu. Gunakan panduan
keselamatan operasi di atas. Kemudian, hanya jika dan setelah kesemua
pertimbangan huluan tersebut beres, pertimbangkan kit ini sebagai tulang
belakang kriptografi pendedahan anda. Kripto itulah bahagian yang mudah.
Segala-galanya di hulu kripto adalah tempat risiko sebenar tinggal.

## Lesen

Domain awam (CC0). Garpu ia. Perbaikinya. Gunakannya tanpa perlu meminta kebenaran.
