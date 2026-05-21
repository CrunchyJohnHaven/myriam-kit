*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

# Mahkeme Delili Muhafaza Zinciri Mühür Kiti

Adli edinim ekipleri — bilgisayar adli bilişim uzmanları, mobil cihaz
çıkarım teknisyenleri, vücut kamerası delil koruyucuları, laboratuvar
yöneticileri — için bir kullanıma hazır myriam-kit örneği. Bu kit,
dijital delilin edinildiği anda *hangi baytların edinildiğine* ve *ne
zaman edinildiğine* dair Bitcoin'e bağlanmış, kurcalamaya karşı kanıt
sağlayan bir mühür yayımlamak ve böylece muhafaza zinciri
anlaşmazlıklarına kamuya açık bir bağlantı noktası sağlamak isteyen
ekipler içindir.

---

## Bu kitin YAPMADIĞI şeyler (önce okuyun)

Mühür, HANGİ ADLI GÖRÜNTÜLERİN edinildiğine, NE ZAMAN edinildiğine,
HANGİ KURUM tarafından, HANGİ ARAMA EMRİ kapsamında ve HANGİ
METODOLOJİ ile edinildiğine dair kriptografik bir zaman damgasıdır.
Davaya ilişkin bunun ötesinde hiçbir soruyu yanıtlayamaz. Aşağıdakiler
**mührün kapsamı dışındadır**:

1. **Federal Delil Kuralları (veya başka herhangi bir delil kanunu)
   altında kabul edilebilirlik.** Mühür baytları ve zaman damgalarını
   sabitler. Delilin kabul edilebilir olup olmadığı — FRE 901 kimlik
   doğrulaması, FRE 702 uzman tanıklığı / Daubert, FRE 403 önyargı
   dengelemesi veya herhangi bir eyalet-mahkemesi muadili altında —
   bir hukuki usul sorusudur. Mükemmel şekilde mühürlenmiş bir edinim
   yine de kabul edilemez ilan edilebilir; mühürsüz bir edinim yine
   de kabul edilebilir. Mühür, bütünlüğün ek delilidir, mahkemenin
   kabul edilebilirlik kararının yerine geçen bir şey değildir.

2. **El koymanın hukuka uygun olup olmadığı.** Dördüncü Anayasa
   Değişikliği'ne uygunluk, arama emrinin geçerliliği, kapsama
   uyulması, dışlama kuralının uygulanabilirliği — bunların tümü
   mührün öncesinde yer alır. Mühür, edinimin FICT-SW-2026-0188
   sayılı arama emri kapsamında gerçekleştiğini kaydeder; arama
   emrinin hukuka uygun şekilde çıkarılıp çıkarılmadığı ve hukuka
   uygun şekilde icra edilip edilmediği mahkemeye aittir.

3. **Delilin suçlayıcı, aklayıcı veya nötr olup olmadığı.** Mühür
   hash değerlerini sabitler; bu hash değerlerinin neyi barındırdığına
   ilişkin yorumlar adli inceleme raporunun konusudur ve bu raporun
   kendi açıklama (discovery) ve delil rejimi vardır. Mühür "GERÇEK N:
   şüphelinin dizüstü bilgisayarı suçlayıcı materyal içeriyordu"
   ifadesini mühürlemeyi reddedecektir — bkz. ret kuralı R4.

4. **Muhafaza zincirinin geçerli eyaletin delil hukuku kapsamında
   usulen doğru olup olmadığı.** Mühür, kurumun çağdaş muhafaza-olay
   günlüğünü kaydeder (GERÇEK 05). O günlüğün belirli bir eyaletin
   muhafaza zinciri gereklerini karşılayıp karşılamadığı, delil
   duruşmasında mahkemeye aittir.

5. **Adli metodolojinin güvenilir olup olmadığı.** Daubert ve
   ardılları (ve hâlâ uygulandığı yerlerde Frye gibi eyalet düzeyindeki
   muadiller) metodolojik güvenilirliği değerlendirir. Mühür,
   HANGİ araçların ve sürümlerin kullanıldığını kaydeder (GERÇEK 04);
   bu araçların belirli bir mahkemenin güvenilirlik standartlarını
   karşılayıp karşılamadığı mahkemeye aittir. Geçmiş davalarda
   edinimden sonra araç hataları belgelenmiştir; mührün rolü
   sürüm-ve-ikili-hash kaydını kamuya açık şekilde çürütülebilir
   yapmaktır, araçların kendisine kefil olmak değildir.

6. **Delile edinimden ÖNCE müdahale edilip edilmediği.** Mühür,
   görüntüleme anından itibaren baytları sabitler. Bir şüpheli, bir
   memur veya üçüncü bir şahıs kaynak cihazı görüntülenmeden önce
   değiştirdiyse, mühür bunu tespit edemez — değiştirilmiş baytları,
   orijinali mühürleyeceği aynı bütünlükle mühürler. Mührün değeri
   görüntüleme zaman damgasından itibaren başlar.

7. **Arama emri kapsamına uyulup uyulmadığı.** Arama emri eki neyin
   edinilebileceğini tanımlar; mühür neyin edinildiğini kaydeder.
   Edinimin arama emri kapsamını aşıp aşmadığı, yine kendi
   çözümüne sahip bir hukuki sorudur (uygun eyalet usulü altında
   bastırma talebi).

8. **Soruşturmadaki herhangi bir özel tarafın yeniden tanımlanması.**
   Mühür, bir şüpheliyi, sanığı, kurbanı, tanığı veya yer sakinini
   yeniden tanımlayabilecek herhangi bir adı, tanımlayıcıyı veya
   parmak izini yayımlamayı reddeder. Dava dosya referansı,
   davayı bulma hak ve yetkisi olan taraflar için uygun tutamaktır.

**Yukarıdaki dürüst-sınırlar bölümü bu kitin yük taşıyan
parçasıdır.** Mühürlemenin kabul edilebilirlikle eşdeğer olduğuna
inanan adli ekipler bunu bir kalkan olarak kullanacaktır. Kit açıkça
şunu söylemelidir: *bu, edinim anı için bir non-repudiation
ilkel öğesidir, hukuka uygun edinimin, metodolojik sağlamlığın veya
mahkemece tanınan muhafaza zincirinin kanıtı değildir.*

---

## Bu kitin mühürlemeyi REDDETMESİ GEREKENLER

Kit, geçerli kurum imza yetkisine sahip bir kullanıcı tarafından
sunulsa bile aşağıdaki olgu örüntülerini reddedecek şekilde
yapılandırılmıştır:

- **Şüphelilerin, sanıkların, kurbanların, tanıkların veya herhangi bir
  özel üçüncü tarafın kişisel tanımlanması.** Hak ve yetkisi olan
  taraflar için tutamak dava dosya referansıdır; kamuya açık mühür
  bir yeniden-tanımlama indeksi olmamalıdır.
- **Adli inceleme uzmanlarının veya diğer kurum personelinin kişisel
  isimleri kamuya açık mühürde.** Roller kamuya açıktır;
  kişi-ile-rol bağlantıları ayrı olarak mühürlenir ve mahkeme süreci
  altında keşfedilebilir.
- **Şüpheli çocuk cinsel istismarı materyalinin, biyometrik
  şablonların veya herhangi bir savunmasız-kişi yeniden-tanımlayıcı
  verinin dosya düzeyindeki hash'leri (veya parmak izleri) — hash
  yoluyla bile.** Tek bir dosyanın SHA-256'sı kalıcı, aranabilir bir
  tanımlayıcıdır; bunu kamuya açık bir ledgerde yayımlamak, özel
  veri tabanlarıyla korelasyon yoluyla denekleri yeniden mağdur
  edebilir. Tam disklerin görüntü düzeyindeki (forensic-image-level)
  hash'leri kabul edilebilir; bu tür materyalin dosya düzeyindeki
  hash'leri ASLA kabul edilebilir değildir.
- **Baytların ne anlama geldiği konusunda inceleme bulguları,
  yorumlar, görüşler veya sonuçlar.** Mühür HANGİ BAYTLARIN
  edinildiğini ve NE ZAMAN edinildiğini sabitler. Yorum, keşfedilebilir
  inceleme raporunda yer alır, kurcalamaya karşı kanıt sağlayan
  kamuya açık bir ledgerde değil.
- **Kabul edilebilirlik veya başka herhangi bir hukuki sonuç
  iddiaları** ("bu delil kabul edilebilir," "arama emri hukuka
  uygundu," "muhafaza zinciri §X.Y kapsamında uygundu"). Hukuki
  sonuçlar mahkemenin işlevidir.
- **Ediniminci kurumun yetkili sorumlusu dışında herhangi biri
  tarafından mühürleme.** Bir savunma uzmanı, manifestonun kendi
  bağımsız doğrulamasını mühürlemek için kiti kullanabilir; ediniminci
  kurumun adı altında ASIL edinimi mühürleyemezler.
- **Kamuya açık mühür içinde rol-ile-birey bağlantıları.** Bağlantılar
  ayrı bir tamamlayıcı kayıtta (GERÇEK 05'te hash'lenmiş) kurum
  erişim kontrolü altında mühürlenir.
- **El koyma öncesi veya arama emri öncesi soruşturma olguları.**
  Muhbir ifadeleri, arama emri öncesi gözetim, paralel-yapılandırma
  girdileri — bunların hiçbiri edinim mühründe yer almaz. Mühür edinim
  olayıyla sınırlıdır.

Bir ret işleminin kendisi bir olgu olarak mühürlenebilir ("Bu kurum
X'in mühürlenmesini talep etti; kit ret kuralı Y uyarınca reddetti"),
böylece girişilen kötüye kullanımın kamuya açık bir kaydı oluşur.

---

## Bu kitin MÜHÜRLEDİĞİ şeyler

Edinim anında 8 olgu:

1. **Örnek bildirimi** — yayının bir örnek olduğunu beyan eder
   (gerçek tasdikler bunu kaldırır veya değiştirir).
2. **Edinim bağlamı** — dava tanımlayıcısı, arama emri atıfı,
   ediniminci kurum, talep eden makam, el koyma ve edinim
   tarihi/saati, edinim yeri (el koyma yeri, mekânın yeniden
   tanımlanmasını önlemek için ayrı mühürlenmiş bir tamamlayıcı
   kayda redakte edilir).
3. **Delil manifestosu** — her adli-görüntü-öğesi başına: SHA-256
   hash'i, dosya boyutu, anonimleştirilmiş kaynak-cihaz tanımlayıcısı,
   edinim yöntemi, adli görüntü formatı.
4. **Edinim metodolojisi** — adli araç adları ve tam sürümler
   (araç-ikili hash'leriyle), yazma-engelleyici marka/model ve
   firmware, NIST CFTT doğrulama referansı, kullanılan doğrulama
   prosedürü, görüntü-format seçimi.
5. **Muhafaza zinciri günlüğü** — ilk el koymadan görüntülemenin
   sonuna kadar olay başına zaman çizelgesi, koruyucular ROL ile
   tanımlanmış (adla değil), ayrıca mühürlenmiş tamamlayıcı
   kayıtların hash'leriyle (rol-ile-birey bağlantısı, taşıma GPS
   günlüğü, delil-dolabı erişim günlüğü, kurcalama-mührü fotoğrafları
   vb.).
6. **Role göre inceleme uzmanı yeterlilikleri** — sahip olunan
   sertifikalar, sürekli eğitim durumu, önceki uzman-tanık deneyim
   sayısı, Daubert maruziyeti, çıkar çatışması açıklamaları —
   tümü rol düzeyinde, kişisel değil.
7. **Tamamlayıcı açıklamalar ve ret kaydı** — paralel soruşturmalar,
   bekleyen arama emri itirazları, bastırılmış-delil talepleri,
   yürürlükte olan ayrıcalık-filtresi / kirlenme-ekibi protokolü,
   önceki edinim girişimleri, satıcı hata-takip incelemesi; kitin
   mühürlemeyi reddettiği örüntülerin açık listesi.
8. **İmzalayan sorumlu** — ediniminci kurum kimliği + rol düzeyinde
   imzalayan (baş inceleme uzmanı) + rol düzeyinde ortak imzalayan
   (birim amiri) + kriptografik anahtar bilgisi.

Her olgu ret-kapısı geleneğiyle sona erer: *"Bu olgu yalnızca X'i
ileri sürer. Y'yi ileri sürmez"* (burada Y, yukarıdaki "YAPMAZ"
bölümünden en yakın başarısızlık modudur).

---

## Bu kitin korumaya çalıştığı şeyler

- **Bir adli görüntüye edinim sonrası sessiz değişiklik.** Herhangi
  bir görüntüde herhangi bir bayt düzeyindeki değişiklik farklı bir
  SHA-256 üretir ve değişiklik sonrası görüntü, mühürlenmiş GERÇEK 03
  manifestosuna karşı doğrulanmayacaktır.
- **"Farklı araçlar kullanıldı" iddiası.** GERÇEK 04, araç-ikili
  hash'leriyle birlikte kesin araç sürümlerini kaydeder; sonradan
  yapılan "aslında v4.7.0 kullandık, v4.7.1 değil" iddiaları kamuya
  açık şekilde çürütülebilir.
- **Yazma-engelleyicinin devrede olmadığı veya farklı bir model
  kullanıldığı iddiası.** GERÇEK 04 yazma-engelleyici manifestosunu
  dondurur.
- **Muhafaza-günlüğü değişikliği.** GERÇEK 05 muhafaza-olay zaman
  çizelgesindeki herhangi bir değişiklik (bir olayı eklemek,
  kaldırmak veya yeniden zaman damgalamak) GERÇEK 05 hash'ini
  değiştirir ve kamuya açık şekilde tespit edilebilir.
- **Farklı bir inceleme uzmanının kimlik bilgilerinin
  değiştirilmesi.** GERÇEK 06, edinim anındaki rol düzeyindeki
  kimlik bilgisi profilini dondurur.
- **Tamamlayıcı açıklamaların seçici olarak atlanması.** GERÇEK 07,
  beklenen açıklama kategorilerini sayar; boş bir kategorinin açıkça
  beyan edilmesi gerekir ("edinim anında yok"), böylece sonradan
  "bunun alakalı olduğunu fark etmedik" iddiası kamuya açık şekilde
  çürütülebilir.
- **Edinim sonrası, inceleme uzmanının açıklanmamış bir çıkar
  çatışması olduğu iddiaları.** GERÇEK 06'nın çıkar çatışması
  açıklaması edinimde dondurulmuştur; sonraki itirazlar buna karşı
  test edilebilir.

Kit, çağdaş yolsuzluğa karşı koruma sağla**maz** — edinim anında
kasıtlı olarak yanlış metaveri mühürleyen bir ekip, yanlış
metaverinin kriptografik olarak geçerli bir mührünü üretir. İlkel öğe
bu konuda dürüsttür: kurumun çağdaş iddiaları için bir
non-repudiation ilkel öğesidir, o iddiaların doğru olduğunun kanıtı
değildir.

---

## Kitin yardımcı olabileceği tarihsel veya yakın-tarihsel davalar

Kit, dijital delil muhafaza zincirinin tartışmalı bir delil meselesi
haline geldiği geçmiş davalarda yararlı bir bağlantı noktası
üretirdi — *bir çözüm değil*. Sanıkların adlarını anmaktan kaçınmak
için (mahkûm edildiklerinde bile özel taraflardır), bunlar adlandırılmış
bireylere göre değil, dava tipine göre tanımlanmıştır:

- **2010'ların ortasında federal adli-araç-hata tartışması**: edinim
  sonrasında, yaygın olarak kullanılan bir adli görüntüleme aracında
  belirli bir kaynak-medya türünü etkileyen bir uç durum hatasının
  bulunması. Donmuş araç-sürüm-ve-ikili-hash verisi içeren
  mühürlenmiş bir edinim manifestosu, savunma ve savcılığın hangi
  sürümün kullanıldığını tam olarak kabul etmesini sağlayarak bir
  anlaşmazlık eksenini ortadan kaldırırdı.

- **Tartışmalı mobil-cihaz çıkarım çıktılarını içeren birden fazla
  eyalet davası**: çıkarım aracının satıcısı daha sonra bir hata
  düzeltme yaması yayımladı ve soru "hata bu davayı etkiledi mi"
  haline geldi. Mühürlenmiş bir metodoloji olgusu, sorunun, kurumun
  hangi sürümün kullanıldığına dair mevcut hafızasına karşı değil,
  dondurulmuş sürümleme verisine karşı yanıtlanmasına olanak tanır.

- **Vücut kamerası teslim anlaşmazlıkları**: BWC satıcısının dock
  sisteminin daha sonra aktarım sırasında görüntü değişikliğine izin
  verdiği iddia edilen davalar. Kurumun teslim alma anındaki vücut
  kamerası arşivinin mühürlenmiş bir manifestosu, kurumun dock
  sisteminden hangi baytları aldığını sabitler; kurum tarafındaki
  sonraki düzenlemeler kamuya açık şekilde tespit edilebilir.

- **Bilgisayar adli bilişim davalarında hash-çakışma tartışmaları**:
  bir savunma uzmanının MD5'in (bazı eski iş akışlarında hâlâ
  kullanımda) yetersiz olduğunu savunduğu davalar. Hem MD5 hem de
  SHA-256'yı kaydeden mühürlenmiş bir edinim, MD5 itiraz edilse
  bile SHA-256'nın geçerli kalmasına olanak tanır.

- **Edinim ile dava arasında inceleme metodolojisi evrimi üzerine
  anlaşmazlıklar.** Bir dava edinim ile dava arasında yıllarca
  oturduğunda, edinim sırasında standart olan metodoloji dava
  zamanına kadar yerini başka bir metodolojiye bırakmış olabilir.
  Mühürlenmiş kayıt, mahkemenin metodolojiyi sonraki standarda karşı
  değil, edinim anındaki güncel standarda karşı değerlendirmesine
  olanak tanır.

Kit bu dava tiplerinden hiçbirinde suçluluk veya masumiyete ilişkin
altta yatan anlaşmazlıkları ÇÖZMEZDİ. Bir spesifik delil
alt-anlaşmazlığını çözerdi: baytların, araçların ve prosedürlerin,
kurumun iddia ettiği zamanlarda kurumun iddia ettiği şeyler olup
olmadığı.

---

## Bu kit ne zaman kullanılır

- Kurumunuzun istikrarlı bir adli SOP'u var ve mevcut kâğıt-ve-imza
  muhafaza zincirinin üzerine kurcalamaya karşı kanıt sağlayan bir
  katman olarak Bitcoin'e bağlanmış bir kamuya açık tasdik eklemek
  istiyorsunuz.
- Bu davanın adli delillere yönelik önemli bir savunma itirazı
  içereceğini bekliyorsunuz (yüksek riskli dava, yeni metodoloji,
  tartışmalı araç sürümleri vb.).
- Listelenen olgu setini PII veya savunmasız-kişi yeniden-tanımlayıcı
  veriyi açığa çıkarmadan yayımlayabilirsiniz. (Kitin ret kuralları
  bunu zorunlu kılar; olgularınız bir ret kuralı ihlali gerektirecek
  olursa, kiti kullanmayın.)
- Ediniminci kurumun genel danışmanı ve savcılık ofisi yayın
  planını gözden geçirmiştir. Dava tanımlayıcısı taşıyan bir eserin
  kamuya açık yayımlanmasının devam eden soruşturmalar için
  sonuçları vardır; danışman incelemesi isteğe bağlı değildir.
- Yargı yetkinizin savunma keşif kuralları, kurumun rol-ile-birey
  bağlantı kaydını ayrı tutmasıyla (GERÇEK 05'te hash'lenmiş)
  uyumludur. Yargı yetkiniz kamuya açık inceleme uzmanı adı
  açıklamasını gerektiriyorsa, kiti buna göre değiştirmeniz gerekir.

## Bu kit ne zaman KULLANILMAZ

- **Kurumun mevcut muhafaza zinciri belgelerinin yerine
  kullanmayın.** Bu kit *ek*tir, yerine geçen değildir. Kurumun
  CMS'i, muhafaza günlüğü ve keşif üretim yükümlülükleri
  değişmemiştir.
- **Edinim CSAM, biyometrik şablonlar veya diğer savunmasız-kişi
  yeniden-tanımlayıcı veriyi dosya düzeyinde içeriyorsa
  kullanmayın.** Tam disklerin görüntü düzeyindeki hash'leri kabul
  edilebilir; bu tür materyalin dosya düzeyindeki hash'leri ret
  kuralı feragatı altında bile ASLA kabul edilebilir değildir.
  R3'ü ihlal etmeden bir olgu seti oluşturamıyorsanız, kiti
  kullanmayın.
- **Arama emrinin hukuka uygun olduğunu, el koymanın uygun
  olduğunu veya delilin kabul edilebilir olduğunu iddia etmek için
  kullanmayın** — kit bunu yapamaz ve ret kuralı R5 böyle bir
  iddiayı reddedecektir.
- **Edinim tamamlanmadan önce mühürlemek için baskı altında
  kullanmayın.** Kısmi edinim mührü durumu yanlış temsil eder.
- **İnceleme uzmanlarının kişisel isimlerini yayımlamak için
  kullanmayın**, yargı yetkiniz özellikle bunu gerektirmediği ve
  inceleme uzmanlarınız bireysel olarak rıza göstermediği sürece.
  Varsayılan rol düzeyinde yayındır.
- **Mühürlü veya gizli davalarda açık mahkeme izni olmadan
  kullanmayın.** Bitcoin'de bir dava tanımlayıcısı yayımlamak geri
  alınamaz; dava daha sonra mühürlenirse, kamuya açık mühür geri
  çekilemez. Kit yalnızca kamuya açık kayıtlı edinimler içindir.
- **Meşruiyet tiyatrosu olarak kullanmayın.** Kusurlu bir edinimin
  mührü, kusurların kalıcı bir kamuya açık kaydıdır, onlara karşı
  bir savunma değildir. İlkel öğe her iki yönde de keser; dürüstlüğü
  budur.

## Bu kiti gerçek bir edinim için nasıl fork edersiniz

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Kritik zamanlama:** mührü görüntülemenin bitiminde veya hemen
sonrasında uygulayın (örnek zaman çizelgesinde GERÇEK 05 olayı E17).
Görüntüleme sırasındaki bir mühür kısmi edinim kaydı oluşturur;
çok sonraki bir mühür, kurumun görüntüleri değiştirebileceği bir
boşluk oluşturur. Doğru pencere, kanıt setindeki son öğe için
görüntü doğrulaması tamamlandıktan hemen sonradır.

**Kritik inceleme:** mühürlemeden önce, yayını ikinci bir adli
inceleme uzmanından (baş uzman değil) ve kurum danışmanından
geçirin. Bir kez mühürlendikten sonra, yayın kalıcıdır.

## Mevcut muhafaza zinciri altyapısı ile entegrasyon

- **Kurum Dava Yönetim Sistemi (CMS).** CMS kurumun birincil kayıt
  sistemi olmaya devam eder. Mühür CMS'in yerine geçmez; CMS'in
  kaydettiği baytlara ve metodolojiye bağlanır, böylece sonradan
  yapılan CMS düzenlemeleri kamuya açık şekilde tespit edilebilir.
- **Federal Delil Kuralları / Daubert / eyalet delil kanunları.**
  Mühür, kurcalamaya karşı kanıt sağlayan bütünlük sağlayarak FRE
  901 kimlik doğrulama kaydına katkıda bulunur. Tek başına FRE 702 /
  Daubert'i KARŞILAMAZ; metodoloji güvenilirliği hâlâ delil
  duruşmasında test edilir.
- **Savunma keşfi (FRCP 16, Brady, Giglio ve eyalet muadilleri).**
  GERÇEK 05'te hash'lenmiş tamamlayıcı kayıtlar (rol-ile-birey
  bağlantısı, muhafaza günlüğü, kurcalama-mührü fotoğrafları vb.)
  normal keşfe tabi olmaya devam eder. Mühür, bu kayıtların edinim
  anında ne iddia ettiğini sabitler, böylece sonradan "kayıt o
  zaman farklıydı" iddiası kamuya açık şekilde çürütülebilir.
- **NIST Bilgisayar Adli Bilişim Aracı Testi (CFTT).** Kit, CFTT
  doğrulama günlüklerine GERÇEK 04 / GERÇEK 05'te referans verir;
  referans bir hash'tir, günlüğün kendisi değildir, dolayısıyla
  CFTT süreçleri etkilenmez.
- **Mahkemece atanan tarafsız bilirkişiler ve savunma uzmanları.**
  Her ikisi de keşifte aldıkları adli görüntüleri GERÇEK 03
  manifestosuna karşı yeniden hash'leyebilir, herhangi bir kurum
  işbirliğinden bağımsız olarak. Bu, kitin savunma tarafı için
  birincil katma değeridir.
- **Temyiz incelemesi.** Yıllar sonra, bir temyiz adli incelemecisi,
  orijinal edinim metodolojisini, kurumun olası-evrimleşmiş mevcut
  hatırlamasına karşı değil, mühürlenmiş GERÇEK 04 kaydına karşı
  doğrulayabilir.

## Bu kitin YERİNE GEÇMEDİĞİ şeyler

- Federal Delil Kuralları (veya herhangi bir eyalet delil
  kanunu).
- Uzman tanıklığı için Daubert / Frye güvenilirlik standartları.
- Kurumun adli SOP'u ve CMS'i.
- FRCP 16 / Brady / Giglio / eyalet muadilleri altındaki savunma
  keşif yükümlülükleri.
- Mahkeme emirleri, bastırma talepleri, delil duruşmaları veya
  başka herhangi bir mahkeme tarafından yürütülen süreç.
- NIST CFTT veya başka herhangi bir araç-test rejimi.
- Kurumun ayrıcalık-filtresi / kirlenme-ekibi protokolü.

## Bu kit v0.4.0+ içinde neden var

Bu, myriam-kit ile sevk edilen 8. çalışılmış örnektir.
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` içinde belgelenen autoresearch
tarafından doğrulanan kısıt-öncelikli yapıyı izler — kısıt-öncelikli
prompt çeşidi, birden çok örnek alanında ağırlıklı bir rubrik
üzerinde en yüksek skoru aldı. Açılış bölümleri kitin yük taşıyan
parçalarıdır; manifesto içeriği kolay parçadır.

Kitin tasarımı, inceleme uzmanı adının yayımlanması konusunda
bilinçli olarak muhafazakâr ve "bu kabul edilebilirliği oluşturmaz"
feragatnamesi konusunda saldırgan. Adli topluluğun adli çalışmaları
nedeniyle saldırıya uğradığına dair belgelenmiş bir tarihi var; kit
inceleme uzmanları için daha güvenli konumu varsayılan olarak alır.
Kamuya açık kişisel-adlandırmanın gerekli olduğu yargı yetkilerindeki
kurumlar fork'larını buna göre değiştirebilir, ancak varsayılan
ret inceleme uzmanı güvenliğini tercih eder.

## License

Public domain (CC0). Fork it. No attribution required.
