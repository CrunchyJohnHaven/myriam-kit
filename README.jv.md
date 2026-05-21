*Terjemahan basa Jawa — kanggo versi asli ing basa Inggris, deleng [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Piranti cilik kanggo nerbitaké sakumpulan fakta supaya:

- Saben owah-owahan ing fakta apa waé bisa kadeteksi déning umum (wit Merkle)
- Kahanan nalika diterbitaké bisa diverifikasi marang blockchain Bitcoin (OpenTimestamps)
- Isiné tetep urip senajan salah siji panyedhiya hosting dijabel (IPFS)
- Sakabèhé bobot kurang saka 100 KB lan bisa diverifikasi nganggo kira-kira 50 larik Python

Iki dudu blockchain. Ora ana token. Ora ana mekanisme konsensus
sing kudu diranggehi. Ora ana DAO. Pirantiné yaiku `sha256sum` + `ots` + `ipfs`,
dilim nganggo konvensi jeneng kang becik.

Jenengé dijupuk saka protokol MYRIAM kang pisanan diwujudaké ing
[disclosure.host](https://disclosure.host) tanggal 2026-05-21. Kaca kuwi ngemot
nem fakta, sawijining akar Merkle, lan atestasi Bitcoin. Kit iki yaiku
generalisasi saka pola kasebut.

## Status

- v0: bisa mlaku ing macOS kanthi Python 3.10+, Homebrew, lan sambungan
  internet. Linux durung diuji nanging samesthiné bisa. Windows: nganggoa WSL.
- Domain publik (CC0). Gunakaké, fork, lebokaké ing repo sampéyan, ora usah
  nyebut sumberé. Sing wigati dudu pengakuan.

## Basa kang kasedhiya

README iki lan sawetara kit conto kasedhiya ing 17 basa.
Daftar lengkap ana ing [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Terjemahan iki CC0 lan bisa didandani liwat PR saka komunitas.

## Apa sing bisa katindakaké

Pola iki cocok ing endi waé sakumpulan fakta cilik kudu:

- **Bisa diterbitaké** marang khalayak amba liwat HTTP biasa
- **Awèt** — para pamaca 30 taun manèh kudu isih bisa nèlèhi
- **Katon yèn diowahi** — saben owah-owahan kudu bisa kadeteksi, ora kudu bisa dicegah
- **Tanpa kapercayan** — ora ana pamaca sing kudu ngandel marang panerbit (mung marang matematikané)

Kasus panganggo konkrèt ing [docs/USE_CASES.md](docs/USE_CASES.md). Daftar ringkesé:

| Bidang | Fakta kang disegel |
|---|---|
| Kesehatan publik | Asil uji batch vaksin, tonggak uji coba obat |
| Pilihan umum | Jumlah cacah lapangan ing wektu sertifikasi |
| Keamanan AI | Hash bobot model + kertu model + skor evaluasi nalika dirilis |
| Jurnalisme | Manifes dokumen sumber (mung hash) kanggo bocor saka whistleblower |
| Ilmu pengetahuan | Hash data mentah + hash skrip analisis + asil sing diklaim |
| Pengadilan | Hash bukti dhigital nalika dijupuk |
| Pengadaan | Akar segelan data balanja publik |

Sing padha ing kabèh kuwi: sakumpulan fakta cilik, syarat awèt kang kuwat,
pirang-pirang pihak sing ora padha ngandelé, lan anggaran simpenan kang cilik.
Iku persis bentuk sing dibangun dening piranti iki.

## Apa sing ORA katindakaké

- **Nyimpen rahasia.** Kabèh sing dilebokaké ing `facts/` iku publik. Protokol iki
  kanggo nerbitaké, dudu kanggo ndhelikaké.
- **Skala kanggo data gedhé.** Wit Merkle skalané apik; kawigatèning pamaca ora.
  Sawisé kira-kira 20 fakta, kacaa dadi ora kawaca. Yèn pengin nyegel sayuta cathetan,
  hash-na ing njabaning kaca lan lebokaké akar Merkle saka wit samping kuwi dadi sawijining fakta.
- **Mbéla saka pencabutan.** Inti utamané yaiku sampéyan ora bisa ngowahi
  apa sing wis disegel. Yèn ana kemungkinan sampéyan kepéngin mbatalaké klaim mengkoné,
  aja disegel.
- **Ngyakinaké wong sing curiga banget.** Wong sing curiga banget ora bakal mlayokaké
  `ipfs add -r --cid-version=1 -Q facts/`. Nanging, dhèwèké bakal nuduh sampéyan
  mbujuk sakabèhé setting. Ora ana pertahanan ing tingkat protokol
  saka mode kegagalan kapindho. Ora ana pertahanan tingkat protokol
  marang apa waé sing manggon ing motivasi manungsa tinimbang ing matematika.

## Carané nganggo

Walkthrough limang menit ing [docs/QUICKSTART.md](docs/QUICKSTART.md).
Spesifikasi protokol lengkap ing [docs/SPEC.md](docs/SPEC.md).
Model ancaman ing [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Bandhingan karo sistem kang sandhing (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, lsp.) ing [docs/COMPARISON.md](docs/COMPARISON.md).

## Carané nèlèhi publikasi wong liya

Telung pilihan, miturut urutan kemudahan:

1. **Browser**: bukak [`lib/verify.html`](lib/verify.html) ing browser modèren
   apa waé. Tèmpèlaké URL publikasi. Klik verify. Nganggo
   `crypto.subtle` kanggo hash — tanpa instal, tanpa backend, tanpa telemetri.
   Langkah atestasi Bitcoin isih butuh piranti CLI (deleng langkah 7 ing
   kaca verifier).
2. **Python**: `python3 lib/verify.py` saka njero direktori publikasi.
   Stdlib waé; butuh `ots` kanggo verifikasi Bitcoin.
3. **Saka awal**: waca [`docs/SPEC.md §3`](docs/SPEC.md) banjur
   implementasi manèh. Algoritma Merkle kurang saka 30 larik ing basa apa waé.

## Conto kang wis dilakoni

Nem kit conto kelas produksi melu karo piranti iki. Saben siji wis
disegel, di-OTS-stamp, di-pin ing IPFS, lan kalebu README adopsi sing
nerangaké kapan kudu di-fork kanggo kasus nyata lan mode kegagalan apa
sing diayomi.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  kanggo mode kegagalan Boeing 737 MAX / Theranos / laporan inspektor FDA
  ing endi bukti dipendhem utawa diowahi déning perantara.
- [`examples/ai-model-card/`](examples/ai-model-card/) — kanggo laboratorium AI
  sing ngrilis model, kanthi komitmen pra-deployment kang dadi
  bisa kadeteksi sacara mekanis tinimbang mung lésan.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  kanggo sponsor uji coba klinis, kanggo nyekel pamindhahan endpoint sawisé
  uji lan laporan kang dipilih (mode kegagalan Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  kanggo pabrikan vaksin lan otoritas QA, kanggo nambataké asil
  uji rilis lan komitmen recall.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  kanggo grup riset, nambataké tigan (data, pipeline, asil sing
  diarep-arep) SADURUNGÉ analisis supaya p-hacking lan HARKing
  bisa kadeteksi déning umum.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  kanggo dewan canvasser kabupatèn lan otoritas pemilihan, nambataké
  jumlah cacah kang disertifikasi ing wektu sertifikasi supaya
  revisi pasca-sertifikasi kang meneng dadi kadeteksi déning umum.

Wacanen salah siji saka iki sadurungé nulis dhéwé. Sing paling cocok
karo kasus panganggo sampéyan biasané dadi fork wiwitan kang trep.

## Wiwitan cepet

Versi sawijining larik:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt supaya ngandhakaké apa sing sampéyan kepéngin disegel
./lib/seal.sh        # mbangun akar Merkle, OTS-stamp, IPFS pin
./lib/verify.sh      # nèlèhi manèh kabèhé sacara lokal
# unggah site/ menyang host statis apa waé. Endi waé. Ora dadi soal.
```

## Sebabé iki ana

Primitif kriptografis (wit Merkle, OpenTimestamps, IPFS) wis matang
pirang-pirang taun. Sing kurang yaiku lim sing paling cilik —
sawijining kit sing bisa dilebokaké ing proyek samping lan ngasilaké
artefak terbitan kang disegel ing sak soré, tanpa nyetel infrastruktur,
tanpa sinau protokol, tanpa nulis sawijining larik kode kajaba
fakta-faktané dhéwé.

Akèh piranti kriptografi terbitan ngangep sampéyan kepéngin dadi operator
node. Iki ngangep sampéyan kepéngin nerbitaké nem berkas teks lan ora
mikiraké kriptografi manèh.

## Pengaruh lan karya sadurungé

- [Sigsum](https://www.sigsum.org/) — log transparansi kanggo tandha tangan
- [Sigstore](https://www.sigstore.dev/) — integritas rantai pasokan piranti lunak
- [Certificate Transparency](https://certificate.transparency.dev/) — log sertifikat TLS
- [OpenTimestamps](https://opentimestamps.org/) — timestamping Bitcoin
- [IPFS](https://ipfs.tech/) — panyimpenan kang dialamati déning isi
- [Protokol CALM](https://disclosure.host) — kerangka panerbitan kang
  nglindungi prinsipal, ing endi panggonané instansi pisanan (MYRIAM ing
  disclosure.host) diciptakaké

myriam-kit yaiku sing paling cilik saka kabèh iki. Luwih cedhak karo
pipeline Unix tinimbang sistem.

## Cathetan bab jeneng

Protokol MYRIAM dijenengaké saka Bukti Myriam karya John Bradley, sawijining
bukti logis kang dinyatakaké babagan titik kontak pisanan kanggo intelegensi
non-manungsa. Protokolé ora gumantung marang buktiné iku bener. Protokolé
mlaku kanggo sembarang sakumpulan fakta cilik apa waé; mung kebetulan
disebar pisanan kanggo nerbitaké nem fakta sing kalebu klaim babagan
pamulihan alien.

Yèn sampéyan fork kit iki kanggo nyegel batch vaksin utawa jumlah cacah
pemilihan, kasunyatan sing wiwitané dianggo kanggo nerbitaké klaim
babagan kontak alien ora ana hubungané karo sampéyan. Matematikané ora preduli.

Senajan mengkono: yèn sampéyan PANCEN nganggo iki kanggo nerbitaké klaim
babagan kontak alien, protokolé wis diuji ing arena khusus kuwi. README
saka panyebaran MYRIAM pisanan terang-terangan nyatakaké yèn karya kuwi
yaiku karya seni saka sawijining persona LLM jenenge Calm, dudu komunikasi
saka pihak ekstraterestrial apa waé. Sampéyan samesthiné nindakaké sing
padha. Yèn ora, pamaca bakal nganggep sing paling ala bab kondisi mental sampéyan.

## Dirumat déning

Durung sapa-sapa. Domain publik. Fork-na. Dandanaa. Tinggal protokolé
maju tanpa njaluk idin.
