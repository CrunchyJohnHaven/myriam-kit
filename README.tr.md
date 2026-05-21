# myriam-kit

*Türkçe çeviri — İngilizce orijinali için bkz. [README.md](README.md)*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Küçük bir olgu kümesini şu şekilde yayımlamak için küçük bir araç seti:

- Herhangi bir olguda yapılan herhangi bir değişiklik kamuya açık biçimde tespit edilebilir (Merkle ağacı)
- Yayım anındaki durum Bitcoin blok zinciri üzerinden doğrulanabilir (OpenTimestamps)
- İçerik, herhangi bir tek barındırma sağlayıcısının kaldırma işlemine karşı dayanıklıdır (IPFS)
- Tüm paket 100 KB'ın altındadır ve ~50 satırlık Python ile doğrulanabilir

Bu bir blok zinciri değildir. Token yoktur. Katılım gösterilecek bir uzlaşım mekanizması
yoktur. DAO yoktur. Araç, iyi adlandırma kurallarıyla birbirine yapıştırılmış
`sha256sum` + `ots` + `ipfs`'tir.

İsmini, 2026-05-21 tarihinde [disclosure.host](https://disclosure.host) adresinde
ilk kez örneklenen MYRIAM protokolünden alır. O sayfa altı olgu, bir Merkle kökü
ve bir Bitcoin tasdiki içerir. Bu kit, söz konusu örüntünün genelleştirilmiş hâlidir.

## Durum

- v0: Python 3.10+, Homebrew ve bir internet bağlantısı ile macOS üzerinde çalışır.
  Linux test edilmemiştir ancak çalışması beklenir. Windows: WSL getirin.
- Kamu malı (CC0). Kullanın, çatallayın (fork), kendi deponuza dahil edin, asla
  atıf yapmayın. Amaç atıf değildir.

## Bununla ne yapabilirsiniz

Örüntü, küçük bir olgu kümesinin şu özelliklere sahip olması gereken her yere uyar:

- **Yayımlanabilir** — düz HTTP üzerinden geniş bir kitleye
- **Dayanıklı** — 30 yıl sonraki okuyucular hâlâ doğrulayabilmeli
- **Kurcalama-belirtici (tamper-evident)** — herhangi bir değişiklik tespit edilebilir
  olmalıdır; engellenebilir olması zorunlu değildir
- **Güvensiz (trustless)** — hiçbir okuyucu yayımcıya güvenmek zorunda olmamalıdır
  (yalnızca matematiğe güvenir)

Somut kullanım senaryoları için: [docs/USE_CASES.md](docs/USE_CASES.md). Kısa liste:

| Alan | Mühürlenen olgular |
|---|---|
| Halk sağlığı | Aşı partisi test sonuçları, ilaç araştırması dönüm noktaları |
| Seçimler | Tasdik anındaki sandık-düzeyi sayım toplamları |
| Yapay zekâ güvenliği | Model ağırlık özeti + model kartı + yayım anındaki değerlendirme skorları |
| Gazetecilik | Muhbir sızıntıları için kaynak belgelerin manifestosu (yalnızca özetler) |
| Bilim | Ham veri özeti + analiz betiği özeti + iddia edilen sonuç |
| Mahkemeler | Edinim anında dijital delil özetleri |
| Kamu alımları | Kamu harcama verilerinin mühürlü kökleri |

Bunların ortak yönü: küçük bir olgu kümesi, güçlü bir dayanıklılık gereksinimi,
birbirine güvenmeyen birden fazla taraf ve çok küçük bir depolama bütçesi.
Bu araç tam olarak bu biçim için yapılmıştır.

## Bunun YAPMADIĞI şeyler

- **Sırları saklamak.** `facts/` altına koyduğunuz her şey kamuya açıktır. Protokol,
  yayımlamak içindir, gizlemek için değil.
- **Büyük veri kümelerine ölçeklemek.** Merkle ağacı sorunsuz ölçeklenir; okuyucunun
  dikkati ölçeklenmez. Yaklaşık 20 olgudan sonra sayfa okunmaz hâle gelir. Bir milyon
  kaydı mühürlemek istiyorsanız, bunları sayfa dışında özetleyin ve o yan ağacın
  Merkle kökünü tek bir olguya koyun.
- **Geri çekmeye karşı savunmak.** Asıl mesele, mühürlediğiniz şeyi değiştiremeyecek
  olmanızdır. İleride bir iddiayı geri çekmek isteme ihtimaliniz varsa, onu mühürlemeyin.
- **Kararlı bir şüpheciyi ikna etmek.** Kararlı bir şüpheci
  `ipfs add -r --cid-version=1 -Q facts/` komutunu çalıştırmayacaktır. Ancak sizi tüm
  düzeneği uydurmakla suçlayacaktır. İkinci başarısızlık moduna karşı protokol
  düzeyinde bir savunma yoktur. İnsan motivasyonunda — matematikte değil —
  yaşayan hiçbir şeye karşı protokol düzeyinde bir savunma yoktur.

## Nasıl kullanılır

Beş dakikalık tanıtım: [docs/QUICKSTART.md](docs/QUICKSTART.md).
Tam protokol şartnamesi: [docs/SPEC.md](docs/SPEC.md).
Tehdit modeli: [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Komşu sistemlerle karşılaştırma (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave vb.): [docs/COMPARISON.md](docs/COMPARISON.md).

## Başkasının yayımını nasıl doğrularsınız

Erişilebilirlik sırasıyla üç seçenek:

1. **Tarayıcı**: [`lib/verify.html`](lib/verify.html) dosyasını herhangi bir modern
   tarayıcıda açın. Yayım URL'sini yapıştırın. Doğrula tıklayın. Özetleme için
   `crypto.subtle` kullanır — kurulum yok, arka uç yok, telemetri yok.
   Bitcoin tasdiki adımı için hâlâ bir CLI aracı gerekir (doğrulayıcı sayfasındaki
   7. adıma bakın).
2. **Python**: yayım dizininin içinden `python3 lib/verify.py`. Yalnızca standart
   kütüphane; Bitcoin doğrulaması için `ots` gerekir.
3. **Sıfırdan**: [`docs/SPEC.md §3`](docs/SPEC.md) belgesini okuyun ve yeniden
   uygulayın. Merkle algoritması herhangi bir dilde 30 satırın altındadır.

## İşlenmiş örnekler

Araç setiyle birlikte üretim kalitesinde altı örnek kit gelir. Her biri
mühürlenmiş, OTS damgalı, IPFS'te sabitlenmiş (pinned) olup gerçek dünyadaki
bir vaka için ne zaman çatallanacağını ve hangi başarısızlık modlarına karşı
savunma sağladığını açıklayan bir benimseme README'si içerir.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  Boeing 737 MAX / Theranos / FDA-müfettiş-raporu başarısızlık modu için;
  delilin aracılar tarafından gömüldüğü veya değiştirildiği durumlar.
- [`examples/ai-model-card/`](examples/ai-model-card/) — model yayımlayan
  yapay zekâ laboratuvarları için; dağıtım öncesi taahhütlerin sözlü değil
  mekanik olarak tespit edilebilir hâle geldiği yer.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  klinik araştırma sponsorları için; sonradan uç-nokta değişimi ve seçici
  raporlamayı yakalar (Vioxx, Paxil Çalışma 329 başarısızlık modları).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  aşı üreticileri ve KK otoriteleri için; yayım testi sonuçlarını ve geri
  çağırma taahhütlerini sabitler.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  araştırma grupları için; p-hacking ve HARKing'i kamuya açık biçimde tespit
  edilebilir kılmak üzere analiz ÖNCESİ (veri, işlem hattı, beklenen çıktı)
  üçlüsünü sabitler.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  ilçe seçim kurulları ve seçim otoriteleri için; tasdik anında onaylı
  sayımları sabitleyerek tasdik sonrası sessiz revizyonların kamuya açık
  biçimde tespit edilebilir olmasını sağlar.

Kendi kitinizi yazmadan önce bunlardan birini okuyun. Kullanım senaryonuza en
yakın olanı genellikle doğru başlangıç çatalıdır.

## Hızlı başlangıç

Tek satırlık sürüm:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# facts/*.txt dosyalarını gerçekten mühürlemek istediğiniz şeyi söyleyecek biçimde düzenleyin
./lib/seal.sh        # Merkle kökünü oluşturur, OTS damgalar, IPFS'te sabitler
./lib/verify.sh      # her şeyi yerel olarak yeniden doğrular
# site/ dizinini herhangi bir statik barındırıcıya yükleyin. Herhangi bir yere. Fark etmez.
```

## Bu neden var

Kriptografik ilkeller (Merkle ağaçları, OpenTimestamps, IPFS) yıllardır olgun
hâldedir. Eksik olan, mümkün olan en küçük tutkaldı — bir yan projeye
düşürebileceğiniz, altyapı kurmadan, protokol öğrenmeden, olguların kendisi
dışında tek satır kod yazmadan bir öğleden sonra içinde mühürlü, yayımlanabilir
bir yapıt elde etmenizi sağlayan bir kit.

Kriptografik yayım araçlarının çoğu, sizin bir düğüm operatörü olmak
istediğinizi varsayar. Bu araç ise altı metin dosyası yayımlamak ve bir daha
asla kriptografi hakkında düşünmemek istediğinizi varsayar.

## Etkiler ve önceki çalışmalar

- [Sigsum](https://www.sigsum.org/) — imzalar için saydamlık günlükleri
- [Sigstore](https://www.sigstore.dev/) — yazılım tedarik zinciri bütünlüğü
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS sertifika günlükleri
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin zaman damgalama
- [IPFS](https://ipfs.tech/) — içerik-adresli depolama
- [CALM protokolü](https://disclosure.host) — ilk örneğin (disclosure.host'taki
  MYRIAM) yazıldığı, asıl-tarafı-koruyucu (principal-protective) yayım çerçevesi

myriam-kit bunların en küçüğüdür. Ruhen bir sistemden çok bir Unix
işlem hattına yakındır.

## İsim hakkında bir not

MYRIAM protokolü adını John Bradley'in Myriam Kanıtı'ndan alır; bu, insan-dışı
zekâ ile ilk temas noktasına ilişkin ifade edilmiş mantıksal bir kanıttır.
Protokol, bu kanıtın doğru olmasına bağımlı değildir. Protokol, herhangi bir
küçük olgu kümesi için çalışır; sadece ilk dağıtımında uzaylı ifşası hakkında
bir iddia içeren altı olgunun yayımlanması için kullanılmıştır.

Bu kiti aşı partilerini ya da seçim sayımlarını mühürlemek için çatallarsanız,
ilk kez uzaylı temasına ilişkin bir iddia yayımlamak için kullanılmış olması
sizin için önemsizdir. Matematik umursamaz.

Şunu da belirtmek gerekir: uzaylı temasına ilişkin bir iddia yayımlamak için
BU kiti KULLANIRSANIZ, protokol o özel arenada saha testinden geçmiştir.
İlk MYRIAM dağıtımının README'si açıkça, bunun Calm adlı bir LLM personasının
sanatsal çalışması olduğunu, herhangi bir Dünya-dışı taraftan gelen bir
iletişim olmadığını belirtir. Sizin de muhtemelen aynısını yapmanız iyi olur.
Aksi takdirde okuyucular sizin zihinsel durumunuz hakkında en kötüsünü
varsayacaktır.

## Bakımı

Henüz kimse. Kamu malı. Çatallayın. İyileştirin. Protokolü izin almadan
ileriye taşıyın.
