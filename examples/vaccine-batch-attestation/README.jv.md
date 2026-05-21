*Terjemahan basa Jawa — kanggo versi asli ing basa Inggris, deleng [README.md](README.md)*

# Kit Atestasi Batch Vaksin

Conto myriam-kit kang turnkey kanggo pabrikan vaksin, otoritas
jaminan mutu, lan lembaga kesehatan publik sing kepéngin nerbitaké
segel rilis batch kang kanambataké marang Bitcoin lan katon yèn diowahi.

## Apa sing diayomi déning kit iki

**Mode kegagalan sing kacekel déning segel iki:**

- **Modifikasi retroaktif kang meneng marang asil uji rilis.** Kabèh 8
  PDF uji-rilis ing conto iki di-hash. Hash maneh sawisé rilis bakal
  mbukak owah-owahan apa waé.
- **Sengketa babagan spesifikasi endi sing ditrapaké nalika rilis.** FACT 02
  kang disegel ngemot identifikasi batch kanonis lan hash cathetan
  manufaktur. Sengketa mengko "spec-é wis tansah X" duwé jangkar publik.
- **Penyusutan ruang lingkup recall kang meneng.** Komitmen pharmacovigilance
  ing FACT 05 disegel; gagal nuhoni iku bisa dideleng déning umum.
- **Re-spec retroaktif kanggo batch sing njaba spesifikasi.** Yèn asil
  uji rilis sejatiné PASS kang nyenggol watesan banjur direklasifikasi
  dadi FAIL sawisé rilis, hash laporan kang disegel mbuktèkaké apa
  sing diunèkaké déning PDF asil asli.

**Mode kegagalan sing ORA katutupan:**

- Penipuan ing proses manufaktur dhéwé (segelé nambataké asil uji,
  dudu integritas manufaktur).
- Kedadéyan kang ora dikarepaké sing dadi akibat biologis saka batch
  kang sejatiné lulus (segelé ora nyertifikasi keamanan klinis, mung
  integritas dokumentasi).
- Sengketa babagan versi spesifikasi regulasi endi sing dadi otoritatif.

## Kapan kudu nganggo kit iki

Coba pikiraké nyegel rilis batch yèn:

- Sampéyan pabrikan vaksin sing kepéngin nuduhaké integritas forensik
  saka cathetan rilis luwih saka apa sing dibutuhaké déning regulator
- Sampéyan tim QA sing nganut praktèk "nerbitaké apa sing kita atestasiaké"
- Sampéyan pabrikan skala cilik/nasional ing yurisdiksi kanthi infrastruktur
  regulasi kang luwih ringkih, sing kepéngin nambataké cathetan batch
  marang verifier global
- Sampéyan lembaga kesehatan publik utawa NGO sing nglakokaké program
  produksi vaksin non-komersial (umpamané kanggo penyakit kang dilalèkaké)

## Preseden mortalitas historis

- **Kontaminasi Heparin (2008, China):** chondroitin sulfat sing
  dipalsu kanthi oversulfasi ing batch heparin. Manifes uji-rilis kang
  disegel bakal nggawé modifikasi kang meneng marang cathetan uji sawisé
  rilis kadeteksi sacara kriptografis.
- **Tylenol sianida (1982):** sengketa retroaktif babagan titik asal
  gangguan. Hash cathetan manufaktur kang disegel nambataké kahanan
  pra-distribusi.
- **Macem-macem recall batch vaksin** sing pitakon "apa batch iki
  pancen tau diuji kanthi bener" dadi disengketakaké pirang-pirang
  taun mengkoné.

Kit iki DUDU ndandani sembarang saka iki kanthi ketat — nanging ing
saben kasus, atestasi batch kang disegel bakal nyediakaké
timeline forensik kang luwih resik.

## Carané fork kit iki kanggo batch nyata

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # gantenana isi fiktif karo batch nyata
bash build/seal.sh        # SEAL SADURUNGÉ distribusi diwiwiti
python3 build/verify.py   # konfirmasi
```

**TIMING KRITIS**: segelaa ing wektu rilis QA, SADURUNGÉ batch
disebaraké. Segel sawisé distribusi luwih ringkih sacara forensik.

## Integrasi karo infrastruktur farmasi sing wis ana

- **Pengajuan eCTD (FDA / EMA):** URL publikasi kang disegel utawa CID
  IPFS bisa diacu ing bagéan Module 3 (mutu)
- **Prakualifikasi WHO:** manifes kang disegel nuduhaké rantai uji
  pra-rilis marang yurisdiksi non-FDA/EMA
- **Umpan balik pharmacovigilance:** FACT 05 ngiket pabrikan kanggo
  laporan kang disegel babagan cacah AE agregat ing wulan 6 lan 12
- **Sistem recall (RxConnect, MedWatch):** yèn recall dibutuhaké,
  ruang lingkup recall dhéwé disegel ing sangisoré MYRIAM, nyediakaké
  verifikasi publik yèn kabèh lot sing wis disebaraké lagi ditangani

## Apa sing kit iki ORA gantèni

- Pengajuan regulasi FDA / EMA / WHO
- Jejak audit GMP (segelé nambataké ASIL, dudu cathetan proses mentah)
- Database pharmacovigilance (VAERS / EudraVigilance)
- Sistem koordinasi recall

## Lisensi

Domain publik (CC0). Fork-na. Ora butuh atribusi.
