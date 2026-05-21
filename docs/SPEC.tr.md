*Türkçe çeviri — İngilizce orijinali için bkz. [SPEC.md](SPEC.md)*

# MYRIAM-kit Protokol Şartnamesi

## 0. Amaç

Bu belge, küçük bir metin olgu kümesini, herhangi bir tek barındırma sağlayıcısının kaldırma işlemine karşı dayanıklı, kurcalama-belirtici (tamper-evident) ve kriptografik olarak doğrulanabilir bir biçimde yayımlamak için minimal bir protokolü tanımlar.

Bu, ilk olarak [disclosure.host](https://disclosure.host) adresinde "MYRIAM v1" adı altında dağıtılan protokolün genelleştirilmiş hâlidir.

## 1. Hedef olmayanlar

- Sır depolama. Her şey, inşa gereği kamuya açıktır.
- Büyük veri kümeleri. ~20 olgudan sonra protokol yanlış biçimdedir.
- Gerçek zamanlı yayım. Her yayım, ayrık bir mühürleme olayıdır.
- Geri çekme. Protokol, sürüm düzeyinde yalnızca-ekleme (append-only) biçimindedir.

## 2. Olgu modeli

Bir OLGU, aşağıdaki özelliklere sahip bir UTF-8 metin dosyasıdır:

- Dosya adı kalıbı: `NN_short_name.txt`; burada NN, 01'den başlayan sıfır dolgulu iki haneli bir endekstir.
- Kanonik biçim: yazıldığı haldeki baytlar, normalleştirme yoktur.
- Olgu başına özet: `SHA-256(file_bytes)` ifadesinin küçük harf onaltılık (hex) gösterimi.

Olgu KÜMESİ, `facts/` altında bu kalıpla eşleşen ve sözlük sırasına (lexicographic) göre sıralanmış tüm dosyaların sıralı listesidir.

Kısıt: her olgu gövdesi, belirli bir tarafa atfedilebilecek bir *adlandırma olayı* veya *beyan olayı* olarak ifade EDİLMELİDİR (SHOULD). Ontolojik iddialar ("ay kayadır") doğrulanabilirlik kapısını çürütür; yalnızca yayım olayı doğrulanabilirdir, iddia kendisi değil. "X, Y'yi belirtmiştir" uygun biçimdir. "Y doğrudur" değildir.

## 3. Merkle kökü

Dağıtılmış MYRIAM protokolünün v0'ında olduğu gibi Bitcoin tarzı:

1. Yapraklar: olgu kümesi sırasında olgu başına SHA-256 özetleri.
2. Bir seviyenin tek sayıda düğümü varsa, son düğümü çoğaltın.
3. Komşu düğümleri çift-özetleyin: `parent = SHA-256(left_bytes || right_bytes)`;
   burada `left_bytes` ve `right_bytes` ham 32 baytlık özet değerleridir
   (onaltılık gösterimleri değil).
4. Tek bir düğüm kalana dek tekrarlayın. O, Merkle köküdür.

Kök, sonunda satır sonu olmaksızın küçük harf onaltılık olarak yayımlanır.

### 3.1 Test vektörleri

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Uyumlu olduğunu iddia eden herhangi bir uygulama, bu vektörleri yeniden üretMELİDİR (MUST). Bu vektörler gerçek `lib/build.py` dosyasından türetilmiştir ve o betikle yeniden oluşturulabilir.

## 4. Bitcoin taahhüdü

Merkle kökü, [OpenTimestamps](https://opentimestamps.org) aracılığıyla Bitcoin blok zincirine taahhüt edilir. Öntanımlı politika şudur:

> Bağımsız idari kontrol altındaki en az iki takvim işletmecisine karşı damgalayın.

Bu politikayı karşılayan bir makbuz, `ots verify <receipt>.ots` komutunu çalıştırabilen ve herhangi bir takvimin yükseltme yoluna ulaşabilen herhangi bir tarafça doğrulanabilirdir.

`lib/seal.sh` içinde gönderilen öntanımlı işletmeci çifti:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Uygulamalar farklı işletmeciler kullanABİLİR (MAY). Tanıklık-çeşitliliği (witness-diversity) politikası (≥2 bağımsız işletmeci) normatiftir; spesifik işletmeciler değildir.

## 5. İçerik-adresli aynalama (mirroring)

Yayımlanan sayfayı ve olgu dosyalarını içeren `site/` dizini IPFS'e EKLENMELİDİR (SHOULD):

```
ipfs add -r --cid-version=1 -Q site/
```

Ortaya çıkan CIDv1 (dag-pb codec), yayımın içerik adresidir. `site/` dizininin bayt içeriğinden deterministik olarak türetilir. `site/` altındaki herhangi bir dosyada yapılan herhangi bir değişiklik, farklı bir CID üretir.

Yayımcının yerel düğümünün ötesinde ek hizmetlere de sabitleme (pinning) yapılması, dayanıklılık için şiddetle önerilir; bu şartname belirli hizmetleri zorunlu kılmaz.

## 6. Sürümlendirme

Protokol, **sürüm düzeyinde yalnızca-ekleme** (append-only) biçimindedir. Her değişiklik yeni bir mühürlü sürüm gerektirir:

- Yeni (veya değişmemiş) bir şartname revizyonu
- Yeni bir olgu kümesi (önceki sürümlerden değiştirilmemiş olguları miras alABİLİR (MAY))
- Yeni bir Merkle kökü
- Yeni bir OpenTimestamps makbuzu
- Yeni bir IPFS CID

Önceki tüm sürümler, sürümlü URL'lerde yayımda kalır. Herhangi bir v(N) olgusundaki bir değişiklik v(N+1) gerektirir ve her iki sürüm de görünür ve yeniden doğrulanabilir hâlde kalır.

## 7. Doğrulama

Herhangi bir üçüncü taraf, bir yayımın bütünlüğünü şu şekilde doğrulayabilir:

1. Olgu dosyalarını indirip olgu başına SHA-256 özetlerini yeniden hesaplayarak.
2. §3'e göre Merkle kökünü yeniden hesaplayıp yayımlanan kökle karşılaştırarak.
3. OpenTimestamps makbuzunu, en az bir takvimin tam tasdiki için Bitcoin
   blok zincirine karşı doğrulayarak.
4. `ipfs add -r --cid-version=1` üzerinden IPFS CID'sini bağımsız olarak yeniden
   hesaplayıp yayımlanan CID ile karşılaştırarak.

`lib/verify.py`, Python standart kütüphanesi ve `ots` istemcisi dışında dış bağımlılık olmaksızın 1–3. adımları gerçekleştirir. 4. adım için `ipfs` istemcisi gereklidir.

## 8. Reddetme kapısı

Bir yayım, şu özelliklere sahip bir olguyu içermeMELİDİR (MUST NOT):

- Adlandırılmaya rıza göstermemiş özel bir üçüncü tarafı tanımlayan.
- Bir varsayımı (hipotezi) bir teyit olarak sunan.
- Doğrulanabilir bir adlandırma/beyan olayına ya da kriptografik bir yapıta indirgenemeyen.
- Yayımlanması üzerine, önlenebilir ölümlerde makul ölçüde beklenen bir artışa neden olan.

Dördüncü kural, yükü taşıyan kuraldır. Yayımcı tarafından, insan inceleme adımında uygulanır. Reddetme kapısının protokol düzeyinde bir uygulanması yoktur; protokol, kendisine verilen baytları olduğu gibi yayımlar. Yayımcı, kapıdan sorumludur.

## 9. Sınırların dürüst beyanı

- **Tespit edilebilirlik, imkânsızlık değil.** Protokol, kurcalamayı imkânsız değil
  tespit edilebilir kılar. Kararlı bir saldırgan, hâlâ farklı bir yayımla yerine
  koyup bazı okuyucuları bunun aslı olduğuna ikna edebilir. Protokolün değeri,
  yerine koymanın, kontrolü yapan herkese kriptografik olarak gösterilebilir
  hâle gelmesidir.
- **Gerçeğe aykırı yayıma karşı savunma yok.** Yayımcı "X gerçekleşti" diyen bir
  olguyu mühürler ve X gerçekleşmediyse, protokol bu yanlış iddiayı doğru olanları
  mühürlediği titizlikle mühürler. Protokol, *neyin yayımlandığını* tasdik eder,
  *neyin doğru olduğunu* değil.
- **Tek taraflı imzalama.** Dağıtılan MYRIAM'ın v1 sürümü tek bir imzalayan asıl
  tarafı (principal) kullanır. Çok taraflı imzalama, gelecekteki bir çalışmadır.
- **Sabitleme dayanıklılığı.** Yalnızca yayımcının düğümünde IPFS sabitlemesi
  "dizüstüm açıkken ulaşılabilir + fırsatçı geçit (gateway) önbelleklemesi"
  sağlar. Uzun vadeli dayanıklılık, bağımsız hizmetler arasında yedekli sabitleme
  gerektirir.

Bu sınırlar burada şunu sağlamak için belirtilmiştir: hiçbir okuyucu, protokolün gerçekte sunduğundan daha fazlasını sunduğunu varsaymasın.
