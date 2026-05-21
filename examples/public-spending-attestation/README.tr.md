# Kamu Harcaması Tasdik Mühür Kiti

*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

Belediye, eyalet, il ve ulusal hükümetler için, bütçe icra kayıtlarını
(sözleşme verme, ödeme, teslim alma) yayımlandığı anda kriptografik
olarak çıpalamak ve böylece kamu harcama kayıtlarının sessizce geriye
dönük değiştirilmesini kamuoyu tarafından tespit edilebilir hâle
getirmek isteyenlere yönelik anahtar teslim bir myriam-kit örneği.

Mühür bir **adli çıpadır**, bütünlük sertifikası değildir. Mali
otoritenin bildirim gününde bildirdiği şeyi, sonradan sessizce
revize edildiğinde kamuoyu tarafından görülebilen kriptografik bir
tutarsızlık üretmeden değiştirilemeyecek bir biçimde kaydeder.

---

## Bu kitin YAPMADIĞI şeyler (önce okuyun)

Mühür, tasdik edilen şeyin kriptografik bir zaman damgasıdır. Tasdik
edilenin **yasal, adil veya dürüst** olup olmadığını doğrulayamaz.
Aşağıdaki başarısızlık modları **mührün alanı dışındadır**:

1. **Yukarı akış yolsuzluğu ve rüşvet.** Bir tedarik manipüle
   edildiyse, bir tedarikçi rüşvet nedeniyle seçildiyse, tek
   kaynaklı bir gerekçe uydurulduysa veya bir sözleşme üzerinde
   anlaşılmış rüşvet yüzdesiyle şişirildiyse — mühür, kayıtlı
   işlemi şişirilmiş fiyatla ve gözde tedarikçiyle yüksek
   bütünlükle çıpalar. Mühür, finans sisteminin çıktısını gözlemler;
   yayımlama öncesi yolsuzluğa görünürlüğü yoktur. Brezilya'nın
   *Operação Lava Jato* davası, binlerce Petrobras sözleşmesinde
   sistematik ~%3 kartel tarafından yönetilen rüşvet belgelemiştir
   ve bunlar yayımlanma anında tamamen rutinmiş gibi mühürlenecekti.

2. **Paravan şirketle gerçek faydalanan sahipliğin gizlenmesi.**
   "Acme Construction Ltd."ye verilen bir sözleşme, kamu sicilindeki
   tüzel kişi adıyla mühürlenir. Eğer "Acme" aslında açıklanmamış
   siyasi olarak nüfuzlu bir kişi tarafından kontrol ediliyorsa ya
   da tek bir kartel tarafından kontrol edilen düzinelerce paravan
   şirketten biriyse, mühür yüzey tüzel kişiyi çıpalar. Gerçek
   faydalanan sahipliği şeffaflığı AYRI bir rejimdir (FATF Tavsiye
   24, AB 5AMLD/6AMLD, ABD Corporate Transparency Act) ve çıktısı
   kendi mühürleme protokolünü gerektirir.

3. **Yayımlama öncesi muhasebe dolandırıcılığı.** Eğer mali otorite
   kaydı mühürlenmeden önce kendisi uyduruyorsa — hayalet
   sözleşmeler, bordrolardaki hayalet çalışanlar, kurgusal teslim
   alma kayıtları — mühür uydurmayı çıpalar. Mühür, kaydedildiği
   anda kaydın yanlış olduğunu tespit edemez; yalnızca kaydın
   mühürlemeden SONRA değiştirildiğini tespit edebilir.

4. **Seçici yayım / kiraz toplama.** Bir mali otorite, işlemlerin
   bir *alt kümesini* — temiz olanları — yayımlayıp yalnızca onları
   mühürleyebilir. Mühür yayımda ne varsa onu çıpalar; yayımda
   olması gereken tüm işlemler evrenini çıpalamaz. Bu kitin
   FACT 07'si (eşlik eden açıklamalar ve reddetme kaydı) yapısal
   savunmadır, ancak yayımlayan otoritenin neyi mühürlememeyi
   seçtiği konusunda dürüst olmasına bağlıdır.

5. **Defter dışı veya bütçe dışı harcama.** Devlete ait
   kuruluşlar, ulusal varlık fonları, özel amaçlı araçlar veya
   bütçe dışı vakıf hesapları aracılığıyla yönlendirilen kamu
   harcaması, mührün çıpaladığı bütçede görünmeyebilir. Mühür,
   bütçe sistemi içinde bildirilenleri kaydeder; sistem dışındaki
   harcamalar mührün alanı dışındadır. Irak Koalisyon Geçici
   Otoritesi (CPA) 2003–2004 anlaşmazlıkları, kayıtları kısmen
   kaybolan yaklaşık 9 milyar ABD doları nakit ödemeyi içeriyordu;
   var olan kayıtların ödeme anında mühürlenmesi onları çıpalayacaktı
   ancak CPA'nın tutmadığı kayıtları oluşturmayacaktı.

6. **Yayımlama sonrası "açıklama" baskısı.** Mühürlenmiş bir aşma,
   mühürlenmiş bir tek kaynak veya mühürlenmiş bir değişiklik
   emri, daha sonra siyasi otoritenin istediği herhangi bir
   çerçeveyle yeniden anlatılabilir. Mühür GERÇEKLERİ yayımlama
   tarihinde çıpalar, ancak bu gerçeklerin daha sonra
   destekleyeceği anlatıyı önyargılı şekilde belirlemez.

7. **Zorla tasdik.** Sorumlu mali asilin, işlemleri yanlış
   yansıtan bir tasdiki imzalamaya zorlanması durumunda mühür,
   zorla alınmış tasdiki zorla alınmış imzayla çıpalar. Mühür KİMİN
   imzaladığını (FACT 08) doğrular, NİÇİN imzaladıklarını değil.
   Zorla alınmış bir tasdiki mühürlemek, zorlanmış çıktının kalıcı
   kamu kaydını üretir — sonraki hesap verebilirlik için yararlı,
   ancak o andaki zorlamaya karşı bir savunma değildir.

8. **Yargı yetkileri arasında karşılaştırma.** Mühürlü bir harcama
   yalnızca yayımlayan yargı yetkisinin yasal rejimine karşı
   okunabilir. "Belediye X, Hizmet Z için neden Y ödedi, oysa
   Belediye W yalnızca V ödedi?" mühürleme sonrası karşılaştırmalı
   analiz sorusudur. Yargı yetkileri arası kıyaslama, mühürlü
   veriler üzerinde analitik bir görevdir, mührün bir özelliği
   değildir.

**Yukarıdaki dürüst-sınırlar bölümü, bu kitin taşıyıcı parçasıdır.**
Mühürlemenin bütünlüğe eşit olduğuna inanan mali yetkililer ve
politikacılar, bu kiti kalkan olarak kullanacaktır. Kit açıkça
söylemelidir: bu, *yayımlama anı için bir inkâr edilemezlik
ilkesidir*, harcama bütünlüğünün kanıtı değil.

---

## Bu kitin mühürlemeyi REDDETMESİ GEREKEN şeyler

Kit, geçerli imza yetkisine sahip bir kullanıcı bunları sunsa bile
aşağıdaki olgu örüntülerini reddedecek şekilde yapılandırılmıştır:

- **Asil imzalama seviyesinin altındaki bireysel devlet çalışanı
  isimleri.** Hiçbir olgu, bireysel tedarik ofisi personelini,
  bireysel hazine memurlarını, bireysel puanlama paneli üyelerini
  veya kamuya açık hesap verebilirlik rolündeki olmayan herhangi
  bir gerçek kişiyi adlandıramaz. Hat personeli için misilleme
  riski, şeffaflık yararını aşar; kimlikleri iç kontrollerde
  (FACT 05 imza günlüğünün hash'i) mühürlenir, tasdikin gövdesinde
  değil.

- **Tedarikçi PII.** Hiçbir olgu, tedarikçi banka hesap
  numaralarını, bireysel tedarikçi çalışanı isimlerini, tedarikçi
  ev adreslerini, tedarikçi gerçek kişi vergi kimliklerini,
  tedarikçi maliyet yapısını içeren iç fiyat dökümlerini veya
  yayımlanması tedarikçi çıkarlarına zarar veren ve yolsuzlukla
  mücadeleye hizmet etmeyen başka herhangi bir ticari PII alanını
  içeremez. Bu tür bilgiler HASHLENEBİLİR (FACT 05) ancak
  yayımlanamaz.

- **Güvenlik gizliliği derecesine sahip harcamalar.** Ulusal
  güvenlik statüleri altında sınıflandırılmış harcamalar, bu kit
  altında mühürlemeye UYGUN DEĞİLDİR. Gizli işleme, farklı
  kriptografik ve yasal gerekliliklere sahip farklı bir
  problemdir. Hariç tutmanın kendisi FACT 07 R3'te açıklanır, böylece
  okuyucu yayımın tasarım gereği kısmî olduğunu bilir.

- **Belirlenmiş gerçek kişilere karşı vergi yükümlülüklerinin
  hukuki icrası.** İcra maliyetleri kamu harcaması olmasına rağmen,
  icra altındaki bireysel mükelleflerin adlandırılması reddedilir:
  mahremiyet zararı şeffaflık yararını aşar ve paralel şeffaflık
  vergi mahkemesi raporlaması altında mevcuttur.

- **Yayımlama öncesi işlemler.** Resmi ödüllendirmeden önce
  sözleşme yok; resmi yayımdan önce ödeme yok. Bir sözleşme
  taslağını veya bekleyen bir ödemeyi yürütülmüş gibi mühürlemek
  sahte kesinlik yaratır.

- **Sorumlu mali asilden başkası tarafından mühürleme.** Bir
  yüklenici, tedarikçi, meclis üyesi, gazeteci veya gözlemci, onu
  yayımlayan mali otoritenin yerine "kamu harcaması kaydını"
  mühürleyemez. (Kendi asilleri altında, ayrı bir yayımda kendi
  gözlemlerini mühürleyebilirler.)

- **"Yolsuzluktan arınmış" çerçeveler.** Kit, "bu harcama yasaldı
  ve yolsuzluktan arınmıştı" veya "tedarik kanıtlanabilir şekilde
  adildi" biçimindeki herhangi bir çerçeveyi mühürlemeyi reddeder.
  Bu tür iddialar bilgi-kuramsal olarak kitin alanı ötesindedir.

- **FACT 07 eşlik eden açıklamaları atlayan yayımlar.** Eşlik eden
  açıklama ve reddetme kaydı olmadan yapılan işlem yayımı, bu kit
  altında meşru bir MYRIAM yayımı değildir.

Reddin kendisi bir olgu olarak mühürlenebilir ("Bu taraf X'in
mühürlenmesini istedi; kit reddetme kuralı Y uyarınca reddetti"),
amaçlı kötüye kullanım girişiminin kamu kaydını yaratır. Mali
yetkililere yönelik siyasi baskının belgelendiği bir alanda,
*reddedilmiş* taleplerin kaydı kendisi bir bütünlük sinyalidir.

---

## Bu kitin mühürlediği şeyler

Bütçe icra tasdiki anındaki 8 olgu:

1. **Örnek bildirimi** — yayımı bir örnek olarak ilan eder (gerçek
   tasdikler bunu kaldırır veya değiştirir).
2. **Yargı yetkisi ve yasal dayanak** — hangi hükümet kuruluşunun,
   hangi yasal yetki altında, hangi mali dönemde yayımladığı.
3. **Ödenek veya bütçe referansı** — yürütülen kabul edilmiş
   bütçedeki belirli kalemler, uygulanmış bütçe enstrümanı ve
   herhangi bir değişiklik / aktarım / yeniden programlamanın
   hash'leri ile.
4. **Sözleşme veya ödeme manifestosu** — işlem başına kayıt: tutar,
   tedarikçi tüzel kişi adı (bireysel PII yok), amaç, tarih,
   tedarik türü, ödüllendirme dayanağı, sözleşme belgesi hash'i.
5. **Destekleyici belge hash'leri** — talepler, değerlendirmeler,
   yürütülen sözleşmeler, değişiklik emirleri, ödeme başvuruları,
   teslim alma formları, hazine defteri girişleri, kontrol imza
   günlüklerinin SHA-256'sı. Sadece hash'ler, içerik değil — ticari
   ve kişisel PII'yi korurken yeniden hashleme doğrulamasını
   sağlamak için.
6. **Denetim ve gözetim durumu** — hangi müfettiş genel kurumunun
   yargı yetkisi olduğu, hangi yüksek denetim kurumunun, hangi
   savcılık kurumunun yolsuzluk suçu yargı yetkisi olduğu, denetim
   son tarihleri, herhangi bir devam eden incelemenin mevcut
   durumu.
7. **Eşlik eden açıklamalar ve reddetme kaydı** — bekleyen tedarik
   itirazları, bekleyen iç soruşturmalar, açık FOI talepleri,
   muhalif incelemeler, bilinen bütçe kalemi aşımları; kitin
   mühürlemeyi reddettiği örüntülerin açık listesi.
8. **İmzalayan asil** — sorumlu mali yetkili + rol + yasal hesap
   verebilirlik + ikili kontrol altındaki eş imzalayanlar; her
   imzalayanın kişisel olarak neyi tasdik ettiği ve neyi
   tasdik etmediği.

Her olgu reddetme kapısı sözleşmesiyle biter: *"Bu olgu yalnızca
X'i iddia eder. Y'yi iddia etmez"* (burada Y, "YAPMADIĞI" bölümünden
en yakın başarısızlık modudur).

---

## Bu kitin savunduğu şeyler

- **Sözleşme tutarlarının sessiz yayımlama sonrası revizyonu.**
  FACT 04'teki herhangi bir tutardaki herhangi bir değişiklik farklı
  bir SHA-256, farklı bir Merkle kökü üretir, OTS doğrulamasında
  başarısız olur.
- **Sessiz tedarikçi değiştirme.** Önceden yayımlanmış bir
  sözleşmede "Tedarikçi A"yı "Tedarikçi B" ile değiştirmek
  mühürlü baytlardan tespit edilebilir.
- **Değişiklik emirlerinin geri tarihlendirilmesi.** FACT 04,
  yayımlama sırasında değişiklik emri tarihini ve gerekçesini
  dondurur; daha sonraki herhangi bir "bu hep üzerinde anlaşılan
  kapsamdı" iddiası mühürlü değişiklik emri kaydıyla mücadele
  etmek zorundadır.
- **Elverişsiz işlemlerin sessiz kaybolması.** Dönemde yayımlanan
  tüm işlemler tek bir Merkle kökü altında FACT 04'tedir. Bir alt
  kümeyi yayımlamak yaprak hash listesinden tespit edilebilir.
- **Eşlik eden açıklamaların bastırılması.** FACT 07, tasdik anında
  bekleyen itiraz, bekleyen soruşturma ve açık FOI durumunu
  dondurur. Daha sonraki herhangi bir "o itirazı asla duymadık"
  iddiası kamuya açık bir şekilde diff edilebilir.
- **Denetim yargı yetkisi kayması.** FACT 06, hangi kurumların
  mühürlenmiş işlemler üzerinde gözetim yargı yetkisine sahip
  olduğunu dondurur. Belirli bir IG'nin "yetkisi olmadığı"
  yönündeki sonraki bir iddia, mühürlü yargı yetkisi kaydıyla
  mücadele etmek zorundadır.
- **Reddetme kaydı silme.** FACT 07, kitin mühürlemeyi reddettiği
  şeyleri kaydeder; daha sonraki herhangi bir "hiçbir şeyi asla
  reddetmedik" iddiası mühürlü kayıtla çelişir.

---

## Kitin yardımcı olabileceği tarihsel vakalar

Kit, kamu harcaması kayıtlarının sessiz geriye dönük değiştirilmesini
içeren belgelenmiş kamuya açık vakalarda yararlı bir **adli çıpa**
üretebilirdi — *bir düzeltme değil, bir önleme değil, cezai
kovuşturmanın yerini tutmaz*:

- **Brezilya — *Operação Lava Jato* / Petrobras silsilesi
  (2014–2021).** Brezilyalı federal savcılar, on yılı aşkın bir
  süre boyunca Petrobras ve diğer federal altyapı sözleşmelerinde
  ortalama ~%3 rüşvet ödeyen, rüşvetin politikacılara ve kartelin
  kendi fiyat koordinasyonuna yönlendirildiği büyük inşaat
  firmalarından oluşan bir kartel belgelemiştir. Sözleşmeler
  yayımlandığı şekliyle rutin görünüyordu; yolsuzluk yayımlama
  öncesindeydi. Bir mühürleme kiti Lava Jato'yu ÖNLEMEYECEKTİ
  (rüşvetler sözleşme mühüre ulaşmadan ÖNCE fiyata gömülmüştü),
  ancak sözleşme şartlarını yayımlama anında çıpalayacaktı — daha
  sonraki "her sözleşmenin imzalandığında gerçekten ne söylediği"
  konusundaki adli yeniden inşayı muazzam ölçüde ucuzlatacaktı.
  Lava Jato'nun soruşturma maliyeti, büyük ölçüde tutarsız
  arşivlenmiş kayıtlardan zaman çizelgelerini yeniden bir araya
  getirme maliyetiydi.

- **Avrupa Birliği — bölgesel kalkınma fonu anlaşmazlıkları (birden
  fazla üye devlet, 2010'lar–2020'ler).** Avrupa Sayıştayı yıllık
  raporları, Avrupa Yapısal ve Yatırım Fonları (ESIF) ve Uyum
  Fonu harcamalarında bazı yıllarda önemlilik eşiğini aşan maddi
  hata oranlarını defalarca tespit etmiştir. "Gerçekte ne talep
  edildi" ile "gerçekte ne teslim edildi" arasındaki anlaşmazlıklar
  tekrarlanır çünkü talep belgeleri sunum ve denetim arasında
  revize edilebilir. Talebin sunulduğu şekliyle yayımlama başına
  MYRIAM mühürleme, her talebin içeriğini sunum sırasında
  çıpalayacaktı ve "yararlanıcının o sırada ne talep ettiğini"
  "denetim sonrası yeniden inşanın ne sonuca vardığından" ayıracaktı.

- **Irak — Koalisyon Geçici Otoritesi (CPA) ödemeleri, 2003–2004.**
  CPA, Irak Yeniden Yapılanma Özel Müfettişi Genel (SIGIR) ve
  daha sonraki denetim raporlarının önemli ölçüde eksik olarak
  nitelendirdiği belgelerle Irak Kalkınma Fonu'ndan yaklaşık 9
  milyar ABD doları nakit ödedi. Ödeme kayıtları hakkındaki
  anlaşmazlıklar yirmi yıl boyunca devam etmektedir. Ödeme anında
  mühürleme, CPA'nın tutmadığı kayıtları oluşturmayacaktı — ancak
  herhangi bir kaydın var olduğu yerlerde (elle yazılmış defterler,
  tarihli transfer yetkilendirmeleri), eşzamanlı bir mühür, o
  kaydın bayt durumunu yayımlama anında çıpalayacaktı ve "o
  zamanki kayıt" ile "daha sonra yeniden inşa edilen kayıt"
  arasında ayrım yapacaktı.

- **Yunanistan — egemen borç ve kamu harcaması raporlama
  revizyonları (2009–2010).** 2009–2010 Eurostat denetimleri,
  daha önce raporlanan Yunan mali verilerinde önemli revizyonları
  belgeleyen ve revizyon metodolojisinin kendisi tartışmalıydı.
  Çeyreklik harcama raporlarının orijinal yayımlama anında
  mühürlenmesi, orijinal ve revize edilmiş raporlar arasındaki
  *farkı* yalnızca arşiv karşılaştırması yoluyla yeniden inşa
  edilebilir olmaktan ziyade kamuya açık olarak diff edilebilir
  hâle getirecekti. Mühür, temel metodolojik anlaşmazlığı
  önlemeyecekti, ancak her raporlanan çeyreği orijinal rapor anında
  çıpalayacaktı.

- **Birleşik Krallık — pandemi tedariki (2020–2022).** Birleşik
  Krallık Ulusal Denetim Ofisi ve parlamento komitesi raporları,
  2020–2021 sırasında, azalan rekabet ve azalan belgelerle acil
  hükümler altında sözleşmelerin verildiği tedarik süreçlerini
  tespit etmiştir; bazı ödüller daha sonra değiştirilmiş, iptal
  edilmiş veya çözüme kavuşturulmuştur. Her acil tedarik ödülünün
  yayımlama başına mühürlenmesi, ödül gerekçesini ve şartlarını
  ödül anında çıpalayacaktı, daha sonraki değişiklikleri sessizce
  değiştirilmiş bir kayıt yerine kamuya açık olarak görülebilen bir
  fark hâline getirecekti.

- **Güney Afrika — devlet ele geçirme dönemi kamu kuruluşu
  sözleşmeleri (~2010–2018).** Zondo Komisyonu, belgeleri çeşitli
  şekillerde eksik, revize edilmiş veya tartışmalı olan birkaç
  devlete ait kuruluştaki (Eskom, Transnet, Denel) sözleşmeleri
  belgeledi. Her sözleşme ödülünün yayımlama sırasında mühürlenmesi,
  daha sonraki adli yeniden inşa çıktılarını eşzamanlı kayıttan
  ayırarak kaydın verildiği şekliyle durumunu çıpalayacaktı.

Kit, yukarıdaki vakaların hiçbirindeki temel yolsuzluğu ÖNLEYEMEYECEKTİ.
Birçok vakada temel sorun, yolsuzluğun *yayımlama öncesi* olmasıydı —
mühür yolsuz sözleşmeyi yüksek bütünlükle çıpalar, ki bu farklı bir
yararlılık türüdür (daha sonraki hesap verebilirlik için adli çıpa)
ancak önleme ile aynı şey değildir. Diğer vakalarda (CPA nakit, bütçe
dışı harcama) temel sorun, mühürlenen kayıtların var olmaması veya
tutulmamasıydı — kit, otoritenin üretmediği kayıtları oluşturamaz.

Bu tarihsel vakalar yalnızca kamuya açık olarak belgelenmiş bulgulara
(mahkeme kayıtları, parlamento komitesi raporları, denetim kurumu
yayımları) atıfta bulunarak adlandırılmıştır. Herhangi bir birey
hakkında iddiada bulunulmamıştır; belgelenmiş kurumsal bulgular kamu
kaydı üzerinde durmaktadır.

---

## Bu kit ne zaman kullanılmalı

- Yargı yetkiniz yerleşik bir bütçe icra raporlama sürecine sahip ve
  değişmez bir kamu çıpası eklemek istiyor.
- Yayımlama sonrası incelemeyi (FOI talepleri, denetim, sivil toplum
  izleme, gazetecilik soruşturması) bekliyor ve müdahaleye karşı
  açık bir referans noktasına sahip olmak istiyorsunuz.
- Listelenen olgu kümesini yayımlamak için şeffaflık / açık kayıt
  yasası altında yasal yetkiniz var ve mahremiyet/güvenlik
  istisnaları onurlandırılıyor.
- Yasal denetim rejimi altında (müfettiş genel, yüksek denetim
  kurumu) çalışıyor ve denetim döngüsünün her bir çeyreklik
  kapanışa ulaşmasından önce her birini çıpalamak istiyorsunuz.
- Open Contracting Data Standard veya IATI altında yayımlıyor ve
  portal tabanlı yayıma kriptografik bir tamamlayıcı istiyorsunuz.

## Bu kit ne zaman kullanılmamalı

- **Yasal denetim, müfettiş genel incelemesi, savcılık soruşturması
  veya sivil toplum izlemenin yerine kullanmayın.** Kit *toplamsal*
  bir bileşendir, bir yedek değildir.
- **Meşruiyet sertifikası olarak kullanmayın.** Mühürlü bir harcama
  kaydı bir yolsuzluktan arınmışlık sertifikası değildir. Onu öyle
  saymak, kitin kısıt öncelikli yapısının önlemek için var olduğu
  başarısızlık modunun ta kendisidir.
- **Dönem ortasında kullanmayın.** Kit, resmi yayımlama anı için
  tasarlanmıştır (çeyreklik kapanış, sözleşme ödülü, kilometre taşı
  ödemesi). Dönem ortası mühürler yanıltıcı referans noktaları
  yaratır.
- **Harcamanın yasal, adil veya yolsuzluk içermediğini iddia etmek
  için kullanmayın** — kit bunu yapamaz.
- **Gizli harcamaları, bireysel çalışan PII'sini veya tedarikçi
  ticari PII'sini mühürlemek için kullanmayın.** Kit bu örüntüleri
  reddeder; bunları denemek bir reddetme kaydı (FACT 07) yaratır.
- **Yayımlama öncesi taslakları mühürlemek için kullanmayın.**
  Taslaklar farklı bir tasdik türü altında mühürlenebilir
  ("yorum için taslak, yayımlanmamış") ancak bu kitin yayımlama
  türü altında değil.
- **FACT 07 açıklamalarını atlamak için baskı altında
  kullanmayın.** Reddedin ve reddi mühürleyin.
- **Mali otoriteniz ele geçirilmişse kullanmayın.** Mühürlü
  dolandırıcılık niteliğindeki bir harcama, dolandırıcılığın
  savunması değil, kalıcı kamu kaydıdır. İlke iki yönlü keser; bu
  onun dürüstlüğüdür.

---

## Gerçek bir tasdik için bu kit nasıl fork edilir

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # kurgusal içeriği gerçekle değiştirin
bash build/seal.sh         # resmi yayımlama anında mühürleyin
python3 build/verify.py    # doğrulayın
```

**Kritik zamanlama:** resmi yayımlama anında mühürleyin — yani,
sorumlu mali asilin çeyreklik kapanışı imzaladığı anda, bir
sözleşmenin resmi olarak verildiği anda veya bir ödemenin resmi
olarak yayımlandığı anda. Resmi yayımlama öncesinde bir mühür "bu
resmî kayıttır" yanlış-pozitif referans noktası yaratır. Resmi
yayımlamadan çok sonra atılan bir mühür, arada olan modifikasyonlara
karşı adli olarak daha zayıftır.

**Sıklık:** kit varsayılan olarak çeyreklik tasdikler için
tasarlanmıştır. Çeyreklik altı sıklıklar (aylık kapanış, işlem başına
mühürleme) uygun kapsamla yeniden çalıştırılarak desteklenir; tek bir
yüksek değerli işlemin mührü meşru bir kullanımdır.

---

## Mevcut kamu maliyesi altyapısıyla entegrasyon

Kit, değiştirmek için değil, birlikte çalışmak için tasarlanmıştır:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Beş yayım
  noktası (planlama, ihale, ödül, sözleşme, uygulama) doğal olarak
  FACT 03'e (planlama → ödenek), FACT 04'e (ihale, ödül, sözleşme,
  uygulama → işlem manifestosu) ve FACT 05'e (destekleyici belge
  hash'leri) eşleşir. OCDS JSON dışa aktarımının kendisi FACT
  05'te (kontrol belgeleri) mühürlenir. OCDS yayımı çalıştıran bir
  yargı yetkisi, mevcut portalının üzerine kriptografik bir
  katman olarak MYRIAM mühürlemesi ekleyebilir.

- **International Aid Transparency Initiative (IATI) standardı
  v2.03.** Tamamı veya bir kısmı dış yardımla finanse edilen
  harcamalar için, IATI XML bir kontrol belgesi olarak mühürlenebilir;
  mühür, IATI Registry'nin HTTP tabanlı yayım modeline kriptografik
  bir tamamlayıcı sağlar.

- **Open Government Partnership (OGP) taahhütleri.** OGP Ulusal
  Eylem Planları sıklıkla mali şeffaflık taahhütlerini içerir;
  MYRIAM mühürleme, hükümetin portalına güven gerektirmeden sivil
  toplum tarafından bağımsız olarak doğrulanabilir bir şekilde bir
  "müdahaleye karşı açık yayım" taahhüdünü işler hâle getirir.

- **OECD Kamu Bütünlüğü Tavsiyesi (2017).** Kit, verileri makine
  tarafından okunabilir olduğu kadar kriptografik olarak çıpalı
  yaparak Tavsiye 4'ü (kamu maliyesi hakkında makine tarafından
  okunabilir, zamanında biçimde açık hükümet verileri) destekler.

- **BM Yolsuzlukla Mücadele Sözleşmesi (UNCAC), özellikle Madde 9
  (tedarik) ve 13 (toplum katılımı).** Kit, Madde 9 şeffaflık
  yükümlülüklerini ve Madde 13 sivil toplum gözetimini destekleyen
  bir adli ilke sağlar.

- **Yüksek Denetim Kurumları (SAI) — INTOSAI çerçevesi.** INTOSAI
  standartları (ISSAI) altında çalışan SAI'ler, mühürlü yayımları
  yüksek bütünlükle kanıt olarak tüketebilir; FACT 05'teki
  SHA-256 hash'leri, SAI'nin e-denetim araçlarının yeniden
  hesaplayabileceği hash'lerin aynısıdır.

- **Müfettiş Genel ofisleri.** Mühürlü harcamalar üzerinde yargı
  yetkisine sahip yurt içi IG ofisleri (FACT 06), hash'leri
  FACT 05'te mühürlü olan belge gövdelerini celp edebilir; mühür,
  celp altında alınan belge gövdelerini yayımlama sırasında var
  olan gövdelere bağlar.

- **Bilgi edinme özgürlüğü ve açık kayıt statüleri.** Mühür,
  yayımlayan otoriteyi devam eden FOI yükümlülüklerinden muaf
  tutmaz; aslında seçici FOI yanıtını mühürlü kayıttan bir sapma
  olarak tespit edilebilir kılar. FACT 07 C3, tasdik anında açık
  FOI taleplerini çıpalar.

- **Gerçek faydalanan sahiplik sicilleri (FATF Tavsiye 24, AB AML
  direktifleri, ABD Corporate Transparency Act).** Gerçek
  faydalanan sahiplik verileri bu kit altında mühürlenmez (FACT 04
  yalnızca kayıtlı tüzel kişi adından tedarikçi kimliğini alır).
  Bir gerçek faydalanan sahiplik açıklaması, Merkle kökü ile
  başvurulan paralel bir yayım üretebilecek ayrı bir mühürleme
  rejimidir.

- **Mahkeme tarafından yönetilen şeffaflık (yargı harcama
  raporlaması, varlık geri kazanım işlemleri).** Yolsuzlukla ilgili
  mahkeme işlemlerinin çıktıları bu kitin kapsamı içinde değildir
  ancak paralel tasdik türleri altında mühürlenebilir.

## Bu kitin yerini ALMADIĞI şeyler

- Müfettiş genel kurumları tarafından yasal bütçe icra denetimi
- Yüksek denetim kurumu incelemesi (GAO, NAO, TCU, CAG, AGN, BRH,
  Cour des comptes veya eşdeğeri)
- Yolsuzluk suçlarının savcılık soruşturması (ulusal yolsuzlukla
  mücadele savcıları, UNCAC Madde 36 kurumları)
- Sivil toplum ve gazetecilik araştırmacı raporlama
- İhbarcı kanalları ve korunan açıklama rejimleri
- Gerçek faydalanan sahiplik açıklaması
- Uluslararası eş değerlendirme (OECD, IMF Mali Şeffaflık
  Değerlendirmesi, AB dönemleri, IATI sicili)
- Mahkeme tarafından yönetilen varlık geri kazanım işlemleri

Mühür, yukarıdakilerin tümünün maliyetini düşüren ve güvenilirliğini
artıran adli bir ilkedir. Bunlardan herhangi birinin yerini almaz ve
alamaz.

---

## Lisans

Kamu malı (CC0). Fork edin. Atıf gerekmez.
