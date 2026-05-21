*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

# YZ Modeli Davranış Kilidi Kiti

Bir modeli yayımlayan ve yayımın iddialarını — ağırlık kimliği,
yetenekler, değerlendirme skorları, güvenlik incelemesi, dağıtım-öncesi
taahhütler — **kriptografik olarak çıpalanmış ve kamuya açık biçimde
doğrulanabilir** kılmak isteyen YZ laboratuvarları (ticari veya açık
kaynak) için anahtar-teslim bir myriam-kit örneği.

Kit, dağıtılan modellerin sessizce kayması, değerlendirme skorlarının
geriye dönük olarak değiştirilmesi (retcon) ya da dağıtım-öncesi
iddiaların yıllar sonra "biz öyle bir şey söylemedik" şeklinde
itiraza uğraması gibi belirli bir başarısızlık moduna karşı savunma
sağlar.

## Bu kit neyi üretir

Tek bir model yayımı için aşağıdakileri içeren, kriptografik olarak
mühürlenmiş bir manifesto:

1. Model tanımlaması (ad, mimari, parametre sayısı, lisans)
2. **Ağırlık dosyasının SHA-256'sı** — kanonik artefakt özeti
3. Model kartı metni (yetenekler, amaçlanan kullanım, kapsam dışı
   kullanım, bilinen başarısızlık modları)
4. Yayım anındaki değerlendirme sonuçları (yetenek değerlendirmeleri,
   güvenlik değerlendirmeleri, kalibrasyon)
5. Dağıtım-öncesi taahhütler (yayımdan sonra sessizce
   değiştirmemeyi taahhüt ettiğiniz şeyler)
6. İmza yetkilisi (sorumluluğu üstlenen insan + kuruluş)

Mühür, bu bileşenlerin her birini bayt-stabil yapar, OpenTimestamps
aracılığıyla Bitcoin'e zaman-çıpalı kılar ve herhangi bir tek
barındırma sağlayıcısından bağımsız olarak IPFS aracılığıyla
erişilebilir kılar.

İşlenmiş kurgusal örneğe bakın: [facts/](facts/) ve sunulmuş
[site/index.html](site/index.html). Örnek, kurgusal bir model
("Calm-mini-v0") kullanır; gerçek bir yayım örnek içeriğin yerini
alırdı.

## Bu kit neye karşı savunur

**Mührün doğrudan yakaladığı başarısızlık modları:**

- **Ağırlık kurcalama** — yayımlanan ağırlık dosyasının SHA-256'sı
  FACT 03'tedir. Bir kullanıcının indirdiği baytların yayım sonrası
  herhangi bir değiştirilmesi, yeniden hash'leme ile tespit edilebilir.
- **Sessiz değerlendirme retcon'ları** — yayım anındaki değerlendirme
  skorları FACT 05'tedir. Gelecekteki "değerlendirme skoru her zaman X
  idi" anlaşmazlıklarının kamuya açık bir çıpası vardır.
- **Yetenek iddiası kayması** — FACT 04'teki model kartı metni
  bayt-stabildir. Gelecekteki "biz hiçbir zaman X yeteneğini iddia
  etmedik" anlaşmazlıkları, mühürlü metne karşı kamuya açık biçimde
  denetlenebilir.
- **Sessiz fine-tune yeniden dağıtımı** — FACT 06'daki (işlenmiş
  örnekte) dağıtım-öncesi taahhüt #1, "aynı ad altında sessiz
  fine-tuning yok"tur. Tespit: yeni herhangi bir ağırlık özeti, yeni
  bir model adı ve yeni bir mühürlü yayım anlamına gelir; aksi takdirde
  taahhüt çiğnenmiştir.
- **Gizli başarısızlık modları** — FACT 04, bilinen-başarısızlık-
  modları listesine taahhüt eder. Liste monotondur (dondurulmuş bir
  kontrol noktası için büyüyebilir, küçülemez). Laboratuvarın
  dahilen bildiği ancak yayımlamadığı başarısızlık modlarının
  gelecekteki keşifleri, itiraz edilebilir kanıt hâline gelir.

**Kapsanmayan başarısızlık modları:**

- Modelin aşağı yöndeki kullanıcılar tarafından yanlış kullanılması
  (mühür, yayımlananı kanıtlar, kullanıcıların onunla ne yaptığını
  değil).
- Üçüncü taraflarca düşmanca (adversarial) fine-tuning (üçüncü taraf
  fine-tune'u farklı bir ağırlık özeti üretir, böylece orijinal mühür
  etkilenmez; ancak üçüncü tarafın modeli mührün koruması dışındadır).
- Dağıtım ortamı değişikliklerinden kaynaklanan davranış değişiklikleri
  (farklı sistem istemleri, RAG yapılandırmaları vb.).
- Laboratuvarın yayım zamanında gerçekten bilmediği başarısızlıklar.
  Mühür, laboratuvarı *bildikleriyle* taahhüt altına alır; bilmedikleri
  şeyi çıpalayamaz.

## Bu kit ne zaman kullanılır

Aşağıdaki durumlarda bir model kartını mühürlemeyi düşünmelisiniz:

- Model ağırlıklarını kamuya açık biçimde yayımlıyorsunuz YA DA aşağı
  yöndeki kullanıcıların davranış kararlılığını önemsediği bir bağlamda
  bir modeli dağıtıyorsunuz.
- Yayım, gelecekteki "biz öyle bir şey söylemedik" anlaşmazlıklarının
  makul olacağı kadar önemlidir (ölçekte dağıtılan herhangi bir model;
  güvenlik açısından kritik herhangi bir model; yetenek iddialarıyla
  birlikte yapılan herhangi bir yayım).
- Kuruluşunuz, gelecekteki eylemleri kısıtlayan dağıtım-öncesi
  taahhütler vermeye isteklidir (yük-taşıyan kısım budur — bir sonraki
  bölüme bakın).
- Yayım anında ağırlık dosyasının SHA-256'sını hesaplayabilirsiniz.

## Bu kit NE ZAMAN kullanılmamalıdır

Aşağıdaki durumlarda bu kiti KULLANMAYIN:

- Örneğin FACT 06'sındaki dağıtım-öncesi taahhütlerle bağlı kalmaya
  istekli değilseniz. Mühür, taahhütleri mekanik olarak tespit
  edilebilir kılar; bu hesap verebilirliğe hazır değilseniz, mühür
  vurmayın.
- Ağırlık dosyası sıkça değişecekse (örn. sürekli fine-tuning
  ardışık düzenleri). Her ağırlık değişikliği yeni bir mühürlü yayım
  gerektirir. Yayım başına mühürleme ağırdır; bu kit *dondurulmuş*
  kontrol noktaları içindir.
- Güvenlik incelemesini henüz yapmadıysanız. Mühür, güvenlik
  incelemesinin bulgularına taahhüt eder. Eksik bir inceleme
  mühürlerseniz, eksik bir incelemenin kalıcı kamuya açık bir kaydına
  sahip olursunuz.
- Daha sonra belirli bir değerlendirme skorunu geri çekmek
  isteyebilirseniz. Mühür kalıcıdır. Yeni mühürlü yayımlar yerine
  geçebilir, ancak orijinal silinemez.

## Yük-taşıyan dağıtım-öncesi taahhütler

Örneğin FACT 06'sı, yayımcıyı şuna taahhüt eder:

1. **Aynı ad altında sessiz fine-tuning yok.** Herhangi bir fine-tune,
   yeni bir model adı, yeni bir mühürlü yayım ve yeni bir ağırlık
   özeti üretir. Öncül, kanonik olarak adlandırılmış sürüm olarak
   kalır.

2. **Sessiz değerlendirme güncellemeleri yok.** Yeniden değerlendirmeler,
   orijinale Merkle kökü aracılığıyla referans veren yeni mühürlü
   yayımlar alır. Sürümler izlenir, üzerine yazılmaz.

3. **Bilinen başarısızlık modları büyüyebilir, asla küçülmez.**
   Dondurulmuş bir kontrol noktasının başarısızlık modları
   düzeltilemez. Bu yüzden yayımlanan liste etkili biçimde monotondur.

4. **Kaldırma işleminin ele alınması.** Modeli dağıtımdan kaldırmaya
   zorlanırsa, laboratuvar kaldırma hakkında nihai bir mühürlü beyan
   yayımlamayı taahhüt eder.

Bu kiti benimseyen bir laboratuvarın, bu taahhütlerden hangilerini
gerçekten yerine getirebileceğine karar vermesi gerekir. Dördünü de
yerine getiremiyorsanız, mühürlemeden *önce* FACT 06'yı yerine
getirebileceklerinizi yansıtacak şekilde değiştirin ve sonuçtaki
zayıflamış korumayı kabul edin. Yerine getirme niyetinde olmadığınız
taahhütleri mühürlemek, hiç mühürlememekten daha kötüdür.

## Bu kiti gerçek bir yayım için nasıl çatallarsınız

```bash
# 1. Bu örneği yayım ardışık düzeninize kopyalayın
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Her olguyu gerçek yayımınıza göre düzenleyin
$EDITOR facts/01_example_notice.txt   # KALDIR — yayımınız bir örnek değil
                                       # Modeliniz için bir yayım bildirimi ile değiştirin
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # kanonik model kartı
$EDITOR facts/05_eval_results.txt     # gerçek değerlendirme sonuçları
$EDITOR facts/06_release_commitments.txt # yerine getirebileceğiniz taahhütler

# 3. site/index.html'i gerçek yayımı yansıtacak şekilde güncelleyin.

# 4. Mühürleyin.
bash build/seal.sh

# 5. Yerel olarak doğrulayın.
python3 build/verify.py

# 6. Şuralara dağıtın:
#    - Yayım sayfanız (model kartı ve ağırlıkların yanına)
#    - IPFS ağı (seal.sh betiği zaten bunu yapar)
#    - Opsiyonel: mühürlü yayıma Hugging Face / GitHub yayım
#      notlarınızdan bağlantı verin
```

## Mevcut yayım ardışık düzenleriyle entegrasyon

Kit, mevcut araçların yerini almak için değil, onlarla birlikte
çalışmak için tasarlanmıştır:

- **Hugging Face**: mühürlü yayımın URL'sini veya IPFS CID'sini model
  kartının README.md'sine ekleyin. Okuyucuları bayt-stabil yayım
  iddiaları için mühüre yönlendirin.
- **GitHub yayımları**: OpenTimestamps makbuzunu
  (`merkle_root.txt.ots`) bir yayım varlığı olarak ekleyin.
  Gelecekteki "yayım değişti" anlaşmazlıkları o zaman Bitcoin'e
  çıpalanmış olur.
- **Model kartı standartları (Mitchell et al. 2019)**: kit uyumludur.
  Standart model-kartı alanları, mührün FACTS 02–05'ine eşlenir. Model
  kartını normal şekilde üretirsiniz ve ek olarak onu mühürlersiniz.
- **Değerlendirme harness'leri (lm-evaluation-harness, BIG-bench, vb.)**:
  tam harness commit'ini ve ham çıktı JSON'unu hash'leyin; bu
  hash'leri FACT 05'te referans gösterin. Gelecekteki yeniden çalıştırmalar
  o zaman bağımsız olarak yeniden üretilebilir hâle gelir.

## Ağırlık özetinin hesaplanması

Tek bir safetensors dosyası için:

```bash
shasum -a 256 model.safetensors
```

Çok dosyalı kontrol noktaları için (GGUF parçaları, parçalanmış
safetensors):

```bash
# Hash'leri sıralı düzende birleştirin, sonra yeniden hash'leyin
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Nihai hash, FACT 03'e konulan şeydir. Kullanıcıların indirirken
bireysel parçaları doğrulayabilmesi için hem parça başına hash'leri
hem de nihai toplu hash'i dahil edin.

## Alıcılar (modelinizin kullanıcıları) ne bilmelidir

MYRIAM-mühürlü bir yayımı olan bir model yayımı, kullanıcının şunları
yapmasına olanak tanır:

1. **İndirdikleri ağırlıkları doğrulamak**, yeniden hash'leyerek
   FACT 03 ile karşılaştırarak.
2. **Model kartının geriye dönük değiştirilmediğini doğrulamak**,
   mühürlü FACT 04'ü laboratuvarın mevcut yayımlanan sürümüne karşı
   kontrol ederek.
3. **Değerlendirme skorlarının yayım anındakiler olduğunu
   doğrulamak**, laboratuvarın mevcut değerlendirme iddialarını
   mühürlü FACT 05 ile karşılaştırarak.
4. **Laboratuvarı dağıtım-öncesi taahhütlerine hesap verebilir
   tutmak**, gerçek davranışı mühürlü FACT 06'ya karşı kontrol ederek.

Tutarsızlık bulan bir kullanıcının, tutarsızlığa dair kriptografik
kanıtı vardır. Bu kanıtı yayımlayabilirler; orijinal mühürlü yayım
çıpadır.

## Bu kit NE DEĞİLDİR

- Aslında güvenlik incelemesi yapmanın yerine geçmez. Mühür,
  güvenlik incelemesinin *kaydıdır*, incelemenin kendisi değil.
- Gerçek değerlendirmelerin yerine geçmez. Mühür, sizin ürettiğiniz
  skorları çıpalar; metodolojiyi doğrulamaz.
- Modelin güvenli olduğunun garantisi değildir. Mühür, laboratuvarın
  yayım anında model hakkında ne iddia ettiğini belgeler; bu iddiaları
  onaylamaz.
- Aşağı yöndeki kullanıcıların modeli kötüye kullanmasına karşı
  koruma değildir.

## Düşmanca fine-tuning üzerine bir not

Yaygın bir YZ-güvenliği endişesi: biri, güvenlik davranışlarını
kaldırmak için modelinizi fine-tune eder ve yeniden dağıtır. Mühür
bunu ÖNLEYEMEZ. Mührün yapabileceği şudur:

- *Orijinal* modelin ne yapması gerektiğini çıpalar (FACT 04).
- Orijinal değerlendirme skorlarının ne olduğunu çıpalar (FACT 05).
- Düşmanca fine-tune'ların karşılaştırılabileceği bir referans noktası
  sağlar.

Üçüncü taraf bir yeniden dağıtımla karşılaşan bir kullanıcı,
ağırlıkların orijinal mühürlü özetle eşleşip eşleşmediğini doğrulayabilir.
Eşleşmiyorsa, kullanıcı, orijinal olmayan bir modele sahip olduğunu ve
laboratuvara atfedilen herhangi bir güvenlik iddiasının uygulanmadığını
bilir.

## Kapanış

Bir model yayımını mühürlemek, laboratuvar için küçük bir ek
çalışmadır: ~10 dakikalık hash hesaplama ve mühürleme betiğini
çalıştırma, ardından hangi dağıtım-öncesi taahhütlerin dahil edileceğine
ilişkin 30 saniyelik bir karar. Eklediği hesap verebilirlik
asimetriktir: dürüst laboratuvarlar için küçük bir maliyet, aksi
takdirde iddialarını sessizce kaydıracak laboratuvarlar için büyük
bir kısıtlama.

Benimsemeyi düşünen bir YZ laboratuvarıysanız, kit kamu malıdır (CC0).
Çatallayın. Değiştirin. Yük-taşıyan parça matematiktir, belirli
uygulama değil.

## Lisans

Kamu malı (CC0). Atıf gerekmez.
