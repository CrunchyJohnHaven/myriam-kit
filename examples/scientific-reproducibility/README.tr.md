*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

# Bilimsel Tekrarlanabilirlik Kiti

Bir makale veya ön baskı (preprint) yanında, Bitcoin'e çıpalanmış,
kurcalama-belirtici bir tekrarlanabilirlik manifestosu yayımlamak
isteyen araştırma grupları, dergiler ve tekrarlanabilirliğe odaklı
kurumlar için anahtar-teslim bir myriam-kit örneği.

## Bu kit neyi üretir

Tek bir çalışma için aşağıdakileri içeren mühürlü bir yayım:

1. Çalışma tanımlaması (makale başlığı, yazarlar, kurum, finansörler,
   COI)
2. **Ham veri arşivinin SHA-256'sı** — kanonik veri kümesi
3. **Analiz ardışık düzeninin özeti** — betik + Docker imajının
   digest'i + sabitlenmiş bağımlılıklar
4. **Beklenen çıktı paketinin özeti** — sadık bir reproducer'ın
   üretmesi gereken
5. Tekrarlama protokolü + sonuç-sonrası yayım taahhütleri
6. İmza yetkili(ler)i

Mühür, **ön-analiz** aşaması için tasarlanmıştır: veri donduruldu,
ardışık düzen tamamlandı, beklenen çıktı hesaplandı; bunların TÜMÜ
makale yazma amacıyla herhangi bir sonuç görülmeden ÖNCE.

## Bu kit neye karşı savunur

**Mührün yakaladığı başarısızlık modları:**

- **p-hacking**: sonuçları gördükten sonra analizde yapılan post-hoc
  değişiklikler, mühürlü FACT 04 ile yayımlanan ardışık düzen
  arasındaki diff aracılığıyla tespit edilebilir.
- **HARKing** (Hypothesizing After Results are Known — Sonuçlar
  Bilindikten Sonra Hipotez Kurma): FACT 02'deki ön-kayıtlı hipotez
  bayt-stabildir.
- **Makale-sonrası veri manipülasyonu**: veri arşivinin FACT 03'e
  karşı yeniden hash'lenmesi, herhangi bir modifikasyonu ortaya
  çıkarır.
- **Ardışık düzen kayması**: analiz ardışık düzeninin FACT 04'e karşı
  yeniden hash'lenmesi, sessiz değişiklikleri yakalar.
- **Yazarlık oyunu (authorship gaming)**: yayımdan sonra yazarları
  sessizce eklemek veya çıkarmak, mühürlü FACT 02'ye karşı tespit
  edilebilir hâle gelir.

**Kapsanmayan başarısızlık modları:**

- Ham veri toplanmasındaki sahtekârlık (mühür, veriyi toplandığı anda
  değil, mühürlendiği anda çıpalar)
- Biyolojik / ampirik tekrarlanamazlık (mühür yalnızca hesaplamasal
  tekrarlanabilirliği çıpalar)
- Örneklem büyüklüğü veya popülasyon-geçerliliği sorunları (bunlar
  çalışma-tasarımı sorularıdır)
- Altta yatan iddianın doğruluğu (mühür neyin iddia edildiğini
  çıpalar, dünyanın iddiaya uyup uymadığını değil)

## Bu kit ne zaman kullanılır

Aşağıdaki durumlarda mühürlemeyi düşünün:

- Yüksek-risk bir analiz (klinik araştırma, YZ sistemi
  değerlendirmesi, replikasyon çalışması) yürüten bir araştırma
  grubusunuz ve OSF / GitHub zaman damgalarının ötesinde adli
  bütünlük istiyorsunuz
- Asimetrik itibar koruması isteyen erken-kariyer bir araştırmacısınız:
  mühürlü ön-analiz, gelecekteki "p-hacking yaptılar" eleştirisinin
  kamuya açık bir yanlışlayıcısı olduğu anlamına gelir
- Bir alt küme makale için kriptografik düzeyde ön-kayıdı teşvik
  etmek isteyen bir dergi editörü veya replikasyon-proje lideriniz
- Post-hoc ince ayarların alanda anlamlı sonuçları olan bir analiz
  üzerinde çalışıyorsunuz (psikoloji, davranışsal ekonomi, tıbbi
  araştırma)

## Tarihsel ölüm / zarar emsali

Bu kitin ölüm-ilişkisi dolaylıdır:

- **Kök hücre / kanser araştırması tekrarlanamazlığı:** çeşitli
  makaleler, yanlış yönlendirilmiş klinik araştırmalar yoluyla hasta
  zararına yol açmıştır. Orijinal ardışık düzenin mühürlü ön-kaydı,
  karşılaştırmayı çıpalardı.
- **Tamiflu'nun etkinliği tartışması:** Cochrane incelemesi kısmen
  ham veri erişiminin tartışmalı olması nedeniyle yıllar aldı. Yayım
  anındaki mühürlü veri özetleri, veri-erişim anlaşmazlıklarını
  hemen çözülebilir kılardı.
- **Genel tekrarlanamazlık krizi:** tekrarlanamaz biyomedikal
  araştırmanın alan-düzeyindeki ölüm maliyeti önemlidir (Begley &
  Ellis 2012, ön-klinik bulguların >%50'sinin tekrarlanamaz olduğunu
  tahmin etmiştir). Kriptografik çıpalama, yapısal bir kaldıraçtır.

## Bu kiti nasıl çatallarsınız

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# KRİTİK: bunu herhangi bir sonucu görmeden ÖNCE yapın
shasum -a 256 raw_data_v0.tar.gz       # kanonik veri özetini hesaplayın
shasum -a 256 analysis.py              # ardışık düzeninizin hash'i
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # gerçek değerlerle doldurun
bash build/seal.sh                     # analizi çalıştırmadan ÖNCE mühürleyin
python3 build/verify.py                # onaylayın

# Şimdi analizi çalıştırın. Çıktıyı hash'leyin ve FACT 05 ile eşleştiğini onaylayın.
# Eşleşmiyorsa, ardışık düzen non-deterministiktir; düzeltin ve yeniden mühürleyin.
```

## Mevcut akademik altyapı ile entegrasyon

- **arXiv / bioRxiv / medRxiv**: MYRIAM mührü URL'sini veya IPFS CID'sini
  özet veya ek materyallere ekleyin
- **OSF**: mühür artefaktını, geleneksel ön-kayıt formuyla birlikte
  OSF projesine ekleyin
- **AsPredicted**: MYRIAM mührü URL'sini ön-kayıt belgesine ekleyin
- **GitHub**: analiz ardışık düzeninin commit hash'i FACT 04'ün
  çıpaladığı şeydir; GitHub kaynağı sağlar, MYRIAM baytları çıpalar
- **Zenodo / Figshare / OpenAIRE**: ham veriyi depolayın, sonra
  deponun hash'ini mühürleyin; mühür, depo meta verilerinden adli
  olarak sessizce değiştirilmesi daha zor olandır
- **Dergi ek materyalleri**: MYRIAM mühür artefaktını başvuruda bir
  ek dosya olarak ekleyin

## Bu kitin yerine GEÇMEDİĞİ şeyler

- IRB / etik komitesi onayı
- Hakem değerlendirmesi
- Replikasyon çalışmaları (hesaplamasal tekrarlanabilirlik ≠ ampirik
  tekrarlanabilirlik)
- Hassas veri için veri erişim anlaşmaları

## Yazar sıralaması ve kredi üzerine bir not

Mühür, mühürleme anındaki YAZAR LİSTESİ'ni çıpalar. Yayım sonrası
ortaya çıkan yazarlık anlaşmazlıkları, mühürlü listeye karşı
değerlendirilebilir. Bu küçük bir hesap verebilirlik kaldıracıdır —
sessizce eklenen veya çıkarılan erken-kariyer araştırmacılar için
önemlidir.

## Lisans

Kamu malı (CC0). Kullanın, değiştirin, görmezden gelin, çatallayın.
