# Gıda Güvenliği Tasdik Kiti

*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

Gıda üreticileri, gıda-güvenliği denetçileri, üçüncü-taraf
sertifikalandırıcılar ve düzenleyici otoriteler için anahtar teslimi
bir myriam-kit örneği. *Yayım testlerinin ne söylediği* ve *hangi
yayım kararının verildiği* hakkında Bitcoin'e demirlenmiş,
kurcalama-belirtici bir mührü, parti yayımı veya denetim raporu
imzalama anında yayımlamak isteyenler için — böylece test kaydının,
yayım kararının veya geri çağırma taahhütlerinin yayım-sonrası sessiz
değiştirilmesi kamuya açık biçimde tespit edilebilir hâle gelir.

---

## Bu kitin YAPMADIĞI şeyler (önce okuyun)

Mühür, HANGİ yayım testlerinin HANGİ partide, HANGİ akredite
laboratuvarlar tarafından, HANGİ yöntemler altında, HANGİ sonuçlarla
yapıldığının ve QA otoritesinin bu sonuçlar temelinde HANGİ YAYIM
KARARINI verdiğinin kriptografik bir zaman damgasıdır. Onun ötesinde
hiçbir gıda güvenliği sorusunu yanıtlayamaz. Aşağıdakiler **mührün
etki alanı dışındadır**:

1. **Kontaminasyonu önlemek.** Kit, yayım sırasında test sonuçlarının
   NE SÖYLEDİĞİNİ demirler. Kontaminasyonun birçok nedeni vardır —
   bir parti içinde heterojen mikrobiyal dağılım, dağıtımda
   yayım-sonrası sıcaklık istismarı, perakende elleçleme hataları,
   tüketici hazırlık hataları, yeni veya taranmamış tehlikeler
   (örn. melamin taraması rutin olmadan önce melamin tağşişi),
   üreticinin test kapsamı yukarısındaki tedarik-zinciri dolandırıcılığı.
   Mühür bunların hiçbirini önlemez ve önlediğini iddia etmez.

2. **Geçen bir partideki tüm birimlerin güvenli olduğunu garanti
   etmek.** Toplu gıda ürününde mikrobiyolojik kontaminasyon
   HETEROJENDİR. Listeria, Salmonella ve STEC patojenleri tek tip
   dağılmış değil, düşük-yaygınlıklı yerel sıcak noktalarda bulunur.
   ICMSF ve Codex örnekleme planları, düşük yaygınlıkta mevcut
   kontaminasyonu tespit etme belgelenmiş, sınırlı bir olasılığa
   sahiptir — olasılık 1 DEĞİLDİR. Yayım örneklemesini geçen bir
   parti hâlâ örneklenmeyen kontamine birimler içerebilir. Mühür
   ÖRNEKLERİ demirler, toplu olanı değil. Bu kısıtlama FACT 03'te
   açıkça yeniden ifade edilir ve bu kitin en önemli tek dürüst
   sınırıdır.

3. **Yayım testlerinin dürüstçe yapıldığını sertifikalandırmak.**
   Mühür, yayımda testlerin neyi raporladığını demirler. Yayımda
   sahte bir GEÇTİ raporlayan bir laboratuvar, sahte bir GEÇTİ'nin
   kriptografik olarak geçerli bir mührünü üretir. Kit sonraki sessiz
   değiştirmeyi tespit edilebilir kılar, ancak eş zamanlı
   dolandırıcılığı tespit etmez. Eş zamanlı dolandırıcılığın tespiti
   denetim, laboratuvar akreditasyon gözetimi (ISO 17025 sürveyans),
   yeterlilik-testi programları ve düzenleyici denetim gerektirir —
   bunların tümü mührün yukarısındadır.

4. **FSMA, FSIS veya AB yetkili makam düzenleyici başvurularının
   yerini almak.** FSMA, FSIS, AB Tüzüğü (EC) 178/2002 ve Codex
   Alimentarius kapsamındaki yayım kayıtları, yasaya göre tutulur
   ve düzenleyici talebi üzerine üretilir. Mühür, bu başvuruların
   ÜZERİNE kamuya açık bir kurcalama-belirtici katman ekler; onları
   DEĞİŞTİRMEZ. Mühürlü bir yayım, bir düzenleyici dosyalama
   değildir.

5. **Geri çağırma kapsamı anlaşmazlıklarını çözmek.** Kit, yayımda
   verilen geri çağırma taahhütlerini (FACT 06) ve sonraki bir geri
   çağırma kapsamını yeni bir yayım olarak mühürleyebilir; ancak
   hangi partilerin etkilendiğinin, hangi birimlerin sevk edildiğinin,
   hangi perakendecilerin onları aldığının ve hangi tüketicilerin
   maruz kaldığının sınırı hâlâ bir geriye-ve-ileriye-doğru izleme
   araştırmasıdır. Mühür, üreticinin neyi TAAHHÜT ettiğini ve daha
   sonra ne YAPTIĞINI demirler. Altta yatan epidemiyolojik soruyu
   çözmez.

6. **Test öncesinde tedarik zincirinde kasıtlı dolandırıcılığı tespit
   etmek.** Çin'de 2008'deki süt ve bebek mamasının melamin tağşişi,
   melaminin analiz panelinde olmadığı için başarılı oldu —
   nitrojen-içeriği protein-eşdeğeri ölçümü vardı ve melamin onu
   yanılttı. O zaman kullanımdaki analiz paneliyle mühürlü bir FACT
   03, o panele kamuya açık biçimde taahhütte bulunurdu — ancak
   panel dışındaki tağşiş maddesini tespit etmek için hiçbir şey
   yapmazdı. Bu durumda mührün değeri, "üreticinin test ettiğini
   iddia ettiği şey budur" adli demirleme olurdu, ÖNLEME değil.
   Gerçek bir gıda güvenliği rejimi bunu, üreticinin mührünün
   yukarısında olan, geniş kapsamlı taramayla (örneğin LC-MS hedefsiz
   yöntemler) habersiz düzenleyici örnekleme yoluyla ele alır.

7. **Yayım-sonrası dağıtım ve tüketici elleçlemeyi demirlemek.**
   Parti tesisten çıktığında, dağıtım sırasında sıcaklık istismarı,
   perakende yanlış elleçlemesi, tüketici depolama hataları ve
   tüketici hazırlık hataları, hepsi kapsam dışındadır. Mühür
   üreticinin yayım olayına kapsam tutulmuştur. Aşağı-akış
   kurcalama-belirteci, dağıtıcı, perakendeci ve (okul ve hastane
   gibi kurumsal tüketiciler için) kullanım-noktası seviyelerinde
   ayrı kitler gerektirir.

8. **Belirli bir popülasyondaki gıdanın güvenliği için kefil olmak.**
   FACT 03 GEÇTİ sonuçları, geleneksel tespit limitlerinin altındaki
   konsantrasyonlarda bile Listeria monocytogenes ve Salmonella'nın
   belgelenmiş yükselmiş risk gösterdiği hamile tüketiciler,
   bebekler, bağışıklığı baskılanmış tüketiciler veya yaşlılar için
   güvenlik gerektirmez. Mühür, popülasyona özgü bir güvenlik iddiası
   yapamaz ve yapmayı reddeder (reddetme-kuralı R6).

**Yukarıdaki dürüst-sınırlar bölümü bu kitin yük taşıyan kısmıdır.**
"Yayım kaydımızı mühürledik"i "gıdamızın güvenli olduğunu kanıtladık"
ile eşdeğer tutan üreticiler, primitifi kötüye kullanır. Kit açıkça
söylemelidir: *bu, üreticinin yayımdaki eş zamanlı iddiaları için bir
inkâr-edememe primitifidir, güvenliğin kanıtı değildir, düzenleyici
gözetimin yerini almaz ve geçmişteki salgınlarda insanların ölümüne
neden olan heterojen-kontaminasyon, tedarik-zinciri dolandırıcılığı
veya yayım-sonrası yanlış-elleçleme başarısızlık modlarına karşı bir
savunma değildir.*

---

## Bu kitin mühürlemeyi REDDETMESİ GEREKEN şeyler

Kit, geçerli üretici imzalama yetkisine sahip bir kullanıcı tarafından
gönderilse bile aşağıdaki olgu örüntülerini reddetmek üzere
yapılandırılmıştır:

- **Herhangi bir işçi, süpervizör, QA personeli, ziyaret eden denetçi
  veya üçüncü-taraf denetçinin kişisel kimliği.** İsimler, çalışan
  kimlikleri, yaka kartı numaraları, sosyal güvenlik numaraları, ev
  adresleri, kişisel telefon numaraları — bunların hiçbiri kamuya
  açık mühürde görünmez. Roller kamuya açıktır; kişi-rol bağlamaları
  ayrı olarak mühürlenir ve düzenleyici süreci altında keşfedilebilir.
  İşçi güvenliğinin misillemeye ve tacize karşı korunması, yük taşıyan
  kısıtlamadır; gıda-güvenliği tasdiki rol düzeyinde yapılabilir.
  (R1)

- **Kesin tesis konumu.** Tesis bölgesi (eyalet veya çok-eyaletli
  bölge) kabul edilebilir; tam sokak adresi, GPS koordinatları veya
  haritada tesisi fiziksel olarak tanımlamaya yetecek granülerlikteki
  herhangi bir tanımlayıcı kabul edilebilir DEĞİLDİR. Düzenleyici
  kuruluş numarası, düzenleyicinin tesis için tutamacıdır; fiziksel
  güvenlik ve işçi güvenliği değerlendirmeleri, Bitcoin'de kamu
  adresinin yayımlanmasına karşıdır. (R2)

- **Bireysel üretim-vardiya personel örüntüleri.** Vardiya
  programları, bireysel işçi rotasyonları, hat operatörü kişisel
  kimlikleri — bunların hiçbiri mühürde görünmez. Bireysel işçilerin
  yaşam-örüntüsü kamuya açık tasdikten türetilebilir olmamalıdır.
  (R3)

- **Sözleşmeleri tehlikeye atan tedarikçi kimlikleri.** Tedarikçi
  isimleri, tedarikçi tesis konumları, tedarikçi parti kodları (bir
  tedarikçinin kontamine partisinin adlandırılmasının halk sağlığı
  için gerekli olduğu ve ayrı bir mühürlü yayım yoluyla ele alındığı
  tedarik-zinciri-kontaminasyon vakası dışında) yayım mührüne dahil
  EDİLMEZ. Birçok tedarik sözleşmesi gizlilik hükümleri içerir;
  mühür varsayılan olarak bunları ihlal etmez. (R4)

- **Yüksek-seviyenin ötesindeki müşteri listeleri ve dağıtım
  hedefleri.** Yüksek-seviyeli bölgesel özet kabul edilebilir; belirli
  müşteri listeleri (perakendeciler, dağıtım merkezleri, foodservice
  hesapları) kabul edilebilir DEĞİLDİR. Müşteri kimliği sözleşmesel
  olarak gizli ve rekabetsel olarak hassastır; düzenleyici, yerleşik
  geri-çağırma-koordinasyon kanalları yoluyla müşteri listesini elde
  eder. (R5)

- **Güvenlik iddiaları veya hukuki sonuçlar.** Kit, "bu ürün
  güvenlidir," "bu parti tüm uygulanabilir gıda-güvenliği standartlarını
  karşılar," "bu, bu kullanım için GRAS'tır" veya başka herhangi bir
  güvenlik veya hukuki sonuç mühürlemez. Kit test kaydını ve yayım
  kararını demirler, bir güvenlik sonucunu DEĞİL. (R6)

- **İşçi-şikâyeti veya muhbir yeniden-tanımlama örüntüleri.** Kit,
  gıda-güvenliği veya işyeri-güvenlik uygulamaları hakkında OSHA,
  USDA veya şirket-içi bir şikâyet dosyalayan bir işçiyi yeniden
  tanımlayabilecek herhangi bir örüntüyü yayımlamayı reddeder. Bu
  şikâyetçiler FSMA Bölüm 402 ve paralel tüzükler altında
  korunmaktadır; mühür bir yeniden-tanımlama vektörü hâline gelmemelidir.
  Muhbir tasdiklerinin, o kullanım durumu için ayarlanmış reddetme
  kurallarıyla kendi kiti vardır
  (`examples/whistleblower-manifest`). (R7)

- **Yayımı yapan üreticinin yetkili principalı dışında herhangi
  birinin mühürlemesi.** Üçüncü-taraf bir sertifikalandırıcı, müşteri
  QA ekibi veya bağımsız denetçi, KENDİ denetim bulgularını mühürlemek
  için aynı kiti kullanabilir; üreticinin adı altında orijinal yayım
  kararını mühürleyEMEZler. FACT 08'deki imzalayan principal bunun
  için tek geçerli imzalayıcıdır. (R8)

Bir reddin kendisi bir olgu olarak mühürlenebilir ("Bu üretici X'in
mühürlenmesini talep etti; kit reddetme kuralı Y uyarınca reddetti"),
bu da kötüye kullanım girişiminin kamu kaydını oluşturur.

---

## Bu kitin mühürlediği şeyler

Yayım anında 8 olgu:

1. **Örnek bildirimi** — yayını bir örnek olarak ilan eder (gerçek
   tasdikler bunu kaldırır veya değiştirir).
2. **Ürün ve parti tanımlaması** — ürün adı, kategori, üretici, tesis
   bölgesi (kesin konum DEĞİL), HACCP-plan sürümü + özeti, parti
   kimliği, üretim / paketleme / son-kullanma tarihleri, tüketici
   birim sayısı, depolama gereksinimleri, kayıt özetleri olan üç
   kritik kontrol noktası (pişirme letaliteti, soğutma
   stabilizasyonu, lethality-sonrası RTE ortamı).
3. **Yayım test sonuçları** — bitmiş-ürün mikrobiyolojik testler
   (Listeria, Salmonella, STEC, APC, Enterobacteriaceae), kimyasal /
   kalıntı testleri (nitrit, veteriner kalıntıları, ağır metaller),
   alerjen çapraz-temas doğrulaması, çevresel izleme özeti, her biri
   tam rapor PDF'inin SHA-256'sı ve açık örnek-karşısı-toplu yorumlama
   kısıtlaması ile.
4. **Metodoloji ve laboratuvar yeterliliği** — hangi yöntem (ve hangi
   yöntem-belgesi sürümü) satır başına kullanıldı, hangi laboratuvarlar
   hangi testleri yürüttü, her laboratuvarın ISO/IEC 17025:2017
   akreditasyon durumu ve sertifika özeti, son yeterlilik-testi
   sonuçları, bağımsızlık beyanı, bu parti için sapma / yeniden test
   / OOS kaydı.
5. **Yayım kararı** — yayım tarihi, rol-düzeyinde yayım yetkisi +
   karşı-imza, kararı destekleyen kayıt özeti, yüksek-seviyeli dağıtım
   hedefleri, yayımda kabul edilen yayım-sonrası yükümlülükler,
   zamanlama-ve-geri-çevrilemezlik taahhüdü.
6. **Geri çağırma ve piyasaya-sürüm-sonrası sürveyans taahhütleri** —
   farmakovijilansın gıda-güvenliği analogu: hastalık-sinyali
   şeffaflığı, geri çağırma uygulama taahhütleri (24sa / 72sa / %98
   eşikleri), tedarik-zinciri kontaminasyon yanıtı, sessiz-yeniden-test-yok
   taahhüdü, post-hoc-spesifikasyon-değişikliği-yok taahhüdü, toplu
   güvenlik-sinyali paylaşımı.
7. **Eşlik eden açıklamalar ve reddetme kaydı** — düzeltici-eylem
   araştırma günlüğü özeti, son denetim geçmişi, geri çağırma geçmişi,
   kullanılan test yöntemlerindeki bilinen açık sorunlar, rol-bireysel
   bağlama (ayrı mühürlenmiş, burada hashlenmiş), tedarikçi-geriye-izleme
   hazırlığı, bu yayım sırasında uygulanan herhangi bir reddetme ile
   reddetme kuralları R1-R8'in açık listesi.
8. **İmzalayan principal** — üretici + rol-düzeyinde imzalayan (QA
   Direktörü) + rol-düzeyinde karşı-imzalayan (Tesis Müdürü) +
   kriptografik anahtar bilgisi; rol-düzeyinde yayımın gerekçesi.

Her olgu reddetme-kapısı kuralı ile sona erer: *"Bu olgu yalnızca X'i
öne sürer. Y'yi öne sürmez"* (burada Y, yukarıdaki "YAPMADIĞI"
bölümünden en yakın başarısızlık modudur).

---

## Bu kitin savunduğu şeyler

- **Yayım test sonuçlarının sessiz geriye-dönük değiştirilmesi.** Tüm
  test-raporu PDF'leri hashlenmiştir. Yayım-sonrası yeniden hashleme
  herhangi bir değişikliği ortaya çıkarır.
- **Hangi yöntemlerin, hangi yöntem-belgesi sürümlerinin ve hangi
  laboratuvarların kullanıldığı hakkındaki anlaşmazlıklar.** FACT 04
  yayımda metodoloji ve laboratuvar akreditasyon durumunu dondurur.
  Sonraki "aslında MLG 4.13 kullandık, 4.12 değil" iddiaları kamuya
  açık biçimde çürütülebilir.
- **Spesifikasyon-dışı bir parti için geriye-dönük yeniden
  spesifikasyon.** Bir yayım-test sonucu aslında, yayım-sonrası
  FAİL olarak yeniden sınıflandırılan sınırda bir GEÇTİ idiyse,
  mühürlü rapor özetleri orijinal sonuç PDF'inin ne söylediğini
  kanıtlar. Simetrik olarak, sessizce açıklama olmaksızın bir
  GEÇTİ'ye yeniden test edilen sınırda bir OOS, FACT 06'nın
  sessiz-yeniden-test-yok taahhüdü daha sonra mühürsüz bir değişiklikle
  karşılaştırılırsa tespit edilebilir.
- **Sessiz geri çağırma kapsamının küçültülmesi.** FACT 06'daki geri
  çağırma taahhütleri (24sa bildirim, 72sa başlatma, %98 geri
  alınabilirlik) mühürlüdür; onlara uymama kamuya açık biçimde
  gözlenebilir.
- **Düzeltici-eylem geçmişinin post-hoc yeniden anlatımı.** FACT 07
  düzeltici-eylem günlüğü özeti, şirketin EMP kabulü sonrasında ne
  YAPTIĞINI SÖYLEDİĞİNİ dondurur; sonraki "ondan fazla / az yaptık"
  iddiaları kamuya açık biçimde çürütülebilir.
- **Eşlik eden açıklamaların seçici olarak çıkarılması.** FACT 07,
  beklenen açıklama kategorilerini sıralar (denetim geçmişi, geri
  çağırma geçmişi, yöntem-tavsiye incelemesi, geriye-izleme hazırlığı);
  boş bir kategori açıkça tasdik edilmelidir ("yayım anında hiçbiri"),
  böylece sonraki "bunun ilgili olduğunu fark etmedik" kamuya açık
  biçimde çürütülebilir.
- **Farklı bir laboratuvarın akreditasyon durumunun ikame
  edilmesi.** FACT 04, yayımda her laboratuvarın ISO 17025 kapsamı
  ve sertifika özetini dondurur; akredite olmayan bir laboratuvarın
  sonraki ikame edilmesi kamuya açık biçimde tespit edilebilir.

Kit, eş zamanlı yolsuzluğa karşı savunma YAPMAZ — yayım sırasında
yanlış test sonuçlarını kasten mühürleyen bir ekip, yanlış test
sonuçlarının kriptografik olarak geçerli bir mührünü üretir. Primitif
bu konuda dürüsttür: bu, üreticinin eş zamanlı iddiaları için bir
inkâr-edememe primitifidir, bu iddiaların doğru olduğunun kanıtı
değildir.

---

## Tarihsel mortalite emsali

Kit, geçmiş gıda-güvenliği başarısızlıklarında yararlı bir demir —
*bir çözüm değil* — üretirdi. Bireyleri karalamamak için (çoğu
gıda-güvenliği başarısızlığı bireysel değil kurumsaldır; bazıları
cezai olarak yargılanır, bazıları yargılanmaz), bu referanslar salgını
yıl ve patojen bazında tanımlar ve kontaminasyon geri çağırma bildirisi
veya mahkeme kaydı ile kamuya açık olarak atfedildiğinde yalnızca ilgili
kuruluşu adlandırır.

- **2008 Çin'de bebek mamasının ve süt ürünlerinin melamin tağşişi
  (Sanlu Group + diğerleri).** Kjeldahl azot-bazlı tayinlerde görünen
  protein içeriğini sahte olarak şişirmek üzere tasarlanmış
  melamin-katkılı süt ürünlerine atfedilebilen en az altı bebek
  ölümü ve ~300.000 hastalık. PRC mahkemelerinde mahkumiyetler izledi,
  ölüm cezaları dahil. *Mühür bunu önlemezdi* — melamin standart
  analiz panelinin dışındaydı. Mühür panelin NE olduğuna kamuya açık
  biçimde taahhütte bulunurdu, olay-sonrası rutin tarama genişlemesinin
  kapsamını adli olarak net hâle getirirdi.

- **2011 Avrupa STEC O104:H4 salgını (bir Alman çiftliğine
  izlenen çemen filizleri).** Birden fazla Avrupa ülkesinde 53 ölüm,
  ~3.950 hastalık; sonunda Mısır'dan ithal edilen ve bir Alman
  üreticide filizlendirilen çemen tohumlarına izlendi. Geriye-izleme
  çok-ülkeli tedarik zincirinde tutarsız parti-düzeyinde belgelendirme
  nedeniyle engellendi. *Mühür tohum partisinin kontaminasyonunu
  önlemezdi* (kontaminasyon filizlendiricinin testlerinin yukarısındaydı);
  filizlendiricinin yayım testlerinin neyi iddia ettiğini ve
  ithal-tohum işleyicisi düzeyinde kullanılırsa ithal-tohum
  işlemenin neyi iddia ettiğini demirler, geriye-izlemeyi hızlandırırdı.

- **2015 Blue Bell Creameries Listeria monocytogenes salgını
  (Amerika Birleşik Devletleri).** Birden fazla eyalette 3 ölüm, 10
  hastalık; ulusal bir geri çağırmaya ve Blue Bell'in 2020 federal
  cezai mahkumiyetine yol açtı (kabahat gıda-güvenliği suçlamaları
  üzerine), şirket ertelenen kovuşturma anlaşmasına girdi ve 19.35
  milyon dolar ödedi. Sonrasında medeni davalar. *Mühür*, tesis-içi
  Listeria çevresel kontaminasyonunu *önlemezdi*; çevresel-izleme
  programı kayıtlarını adli olarak demirlerdi, "salgından önceki
  aylarda EMP ne gösterdi" sorusunu, sonradan üretilmiş belgelere
  karşı değil, kurcalama-belirtici zaman damgalı bir kayda karşı
  yanıtlanabilir hâle getirirdi.

- **2018 marul'a bağlı çok-eyaletli STEC O157:H7 salgınları (Yuma
  yetiştirme bölgesi, sonra Salinas yetiştirme bölgesi).** O yıl
  birden fazla salgında en az 5 ölüm ve ~210 hastalık. Geriye-izleme,
  karışık-kaynaklı poşetlenmiş ürün tarafından karmaşıklaştırıldı.
  *Mühür*, tarla / sulama-suyu seviyesinde (üreticinin yukarısında)
  kontaminasyonu *önlemezdi*; her işleyicinin giriş-testi ve
  yayım-testi kaydını adli olarak demirlerdi, geriye-izlemeyi
  hızlandırırdı ve kamu kaydını sonraki anlaşmazlıklara karşı daha
  kriptografik olarak savunulabilir hâle getirirdi.

- **Peanut Corporation of America Salmonella Typhimurium salgını
  (2008-2009, Amerika Birleşik Devletleri).** 9 ölüm, ~714 hastalık;
  2014-2015 federal cezai mahkumiyetlerine yol açtı (PCA yöneticileri
  dahil), CEO için komplo ve engelleme suçlamalarından 28 yıl hapis
  cezası dahil. *Mühür*, kontaminasyonu, pozitif tesis-içi Salmonella
  testlerinin yetersiz araştırılmasını veya bu pozitif bulgulara karşı
  ürün sevk etme yönetici-düzeyindeki kararını *önlemezdi*. Test
  sonuçlarının üretildikleri anda NE SÖYLEDİĞİNİ duruşmada adli
  olarak net hâle GETİRİRDİ — savcılığın eş zamanlı yanlış-anlatı
  e-postalarına karşı davasını belge değişikliğine karşı önemli
  ölçüde daha çok demirlenmiş hâle getirirdi.

Bu vakaların her birinde, kit daha temiz bir adli zaman çizelgesi
sağlardı. Bu vakaların hiçbirinde kit kendi başına ölümleri önlemezdi.
Mühür adli altyapıdır, önleme altyapısı değildir. Bu ayrım kitin
dürüstlüğüdür.

---

## Bu kit ne zaman kullanılmalı

- Üretim operasyonunuz istikrarlı bir HACCP / Preventive Controls
  programına sahip ve mevcut yayım-belgelendirme iş akışının üzerine
  kurcalama-belirtici bir katman olarak Bitcoin'e demirlenmiş bir
  kamu tasdiki eklemek istiyor.
- Küçük-orta büyüklükte bir üretici veya daha zayıf düzenleyici
  altyapıya sahip bir yargı bölgesindeki bir üreticisiniz, parti
  kayıtlarını küresel olarak doğrulanabilir bir zaman çizelgesine
  demirlemek istiyorsunuz — ihracat-piyasası güveni için,
  müşteri-denetim yanıtı için veya gönüllü şeffaflık girişimlerine
  katılım için.
- Bir gıda-güvenliği denetçisi veya üçüncü-taraf sertifikalandırıcısınız
  ve imzalama anında kurcalama-belirtici bir denetim-bulgu mührü
  yayımlamak istiyorsunuz, böylece denetim bulguları üretici ve
  sertifikalandırıcı arasında anlaşma yoluyla sonradan sessizce
  değiştirilemez.
- Bu partinin önemli aşağı-akış inceleme ile karşılaşmasını
  bekliyorsunuz (ihracat piyasası, RTE et veya bebek maması gibi
  yüksek-risk kategorisi, yeni bileşen, son geri çağırma geçmişi).
- Listelenen olgu kümesini reddetme kuralları R1-R8'i bozmadan
  yayımlayabilirsiniz. Olgularınız bir R1-R8 ihlali gerektirecekse,
  kiti kullanmayın; önce veri girişlerini düzeltin.
- Üretici müşaviri yayım planını incelemiştir. Parti-tanımlayıcı
  taşıyan bir eserin kamuya açık yayımı ürün-sorumluluk maruziyeti
  için sonuçlar doğurur; müşavir incelemesi opsiyonel değildir.

## Bu kit ne zaman kullanılMAmalı

- **FSMA / FSIS / AB düzenleyici kayıtlarının yerine kullanMAyın.**
  Mühür *ek*tir, yerine geçme değildir. Yasal yayım kayıtlarınız,
  HACCP planınız, CCP günlükleriniz ve geri çağırma planınız
  değişmez.
- **Bir güvenlik iddiası olarak kullanMAyın.** Geçen bir yayım
  kaydını mühürlemek ürünün güvenli olduğunu kanıtlamaz; kaydın bu
  zamanda bu bayt içeriğine sahip olduğunu kanıtlar. Reddetme-kuralı
  R6, herhangi bir güvenlik sonucunu reddedecektir.
- **Tedarikçi kimliklerini, müşteri listelerini, işçi isimlerini veya
  tesis adreslerini yayımlamak için kullanMAyın.** Reddetme kuralları
  R1-R5, insan-güvenliği ve sözleşme nedenleriyle vardır; müşavire
  danışmadan onları yenmek için kiti değiştirMEyin.
- **Yayım testleri tamamlanmadan mühürlemek için baskı altında
  kullanMAyın.** Kısmi-veri mührü, yayım kararının durumunu yanlış
  temsil eder.
- **Meşruiyet tiyatrosu olarak kullanMAyın.** Kötü tasarlanmış bir
  örnekleme planının veya kötü seçilmiş bir analiz panelinin mührü,
  yetersizliğin kalıcı bir kamu kaydıdır, ona karşı bir savunma
  değildir. Primitif her iki yöne de keser; bu onun dürüstlüğüdür.
- **Aktif bir geri çağırma durumu sırasında düzenleyicinin geri
  çağırma koordinasyonunun yerine kullanMAyın.** Geri çağırma
  kapsamını demirleyen yeni bir MYRIAM yayımı, düzenleyici-koordineli
  geri çağırma başlatıldıktan SONRA uygundur; düzenleyicinin geri
  çağırma kanalının yerine geçme değildir.

## Gerçek bir yayım için bu kit nasıl çatallanır

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # kurgusal içeriği gerçek parti ile değiştirin
                           # reddetme kuralları R1-R8'i her yerde uygulayın
bash build/seal.sh         # İLK DAĞITIM HAREKETİNDEN ÖNCE MÜHÜRLEYİN
python3 build/verify.py    # onaylayın
```

**KRİTİK ZAMANLAMA:** QA yayımı anında, parti dağıtılmadan ÖNCE (ilk
kamyon tesisten ayrılmadan önce) mühürleyin. Dağıtım başladıktan
sonra bir mühür hâlâ değer taşır ancak dağıtım-öncesi durumu temiz
şekilde demirlemez. Doğru pencere, QA yayım imzası ile ilk dağıtım
hareketi arasındadır.

**KRİTİK İNCELEME:** mühürlemeden önce, yayımı ikinci bir QA
incelemecisinden (lider değil) ve şirket müşavirinden geçirin.
Mühürlendikten sonra yayım kalıcıdır.

## Mevcut gıda-güvenliği altyapısı ile entegrasyon

- **FDA FSMA İnsan Gıdaları için Preventive Controls (21 CFR 117).**
  Mühürlü yayının URL'si veya IPFS CID'si, bu parti için kamu-tasdik
  eseri olarak Gıda Güvenliği Planı belgelerinde referanslandırılabilir.
- **USDA FSIS HACCP planları ve yayım kayıtları.** Mühürlü yayım
  kaydı, FSIS gerektirdiği HACCP kayıtlarının yanında durur; mühür
  HACCP-plan-sürümü özetini (FACT 02) referanslar, böylece hangi plan
  sürümünün yürürlükte olduğu hakkındaki sonraki anlaşmazlıklar
  kamuya açık biçimde çürütülebilir.
- **Codex Alimentarius / HACCP ilkeleri** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Mühür, bu parti için yedi-ilke HACCP çıktılarına
  (tehlike analizi, CCPs, kritik limitler, izleme, düzeltici
  eylemler, doğrulama, kayıt tutma) taahhütte bulunur.
- **ISO 22000:2018 (Gıda Güvenliği Yönetim Sistemleri).** Mühür
  yönetim-inceleme kanıt izlerinin bir parçası olarak referanslandırılabilir;
  ISO 22000 sertifikasyonunun yerini almaz.
- **FSSC 22000 v6 sertifikasyon planı.** Ek bir şeffaflık katmanı
  olarak uyumlu; FSSC'nin denetçisi sürveyans sırasında mührü
  doğrulayabilir.
- **AB Tüzüğü (EC) 178/2002 (Genel Gıda Yasası) Madde 18 (izlenebilirlik)
  ve Madde 19 (geri çağırma bildirimi).** Mühür, üreticinin
  bir-aşama-geriye geriye-izleme hazırlığını (FACT 07) ve geri çağırma
  taahhütlerini (FACT 06) taahhüt eder; yasal Madde 19 bildirim
  yükümlülüğünün yerini almaz.
- **AB Hijyen Paketi (852/2004, 853/2004, 854/2004, 882/2004
  Tüzükleri).** Uyumlu; mühür, Hijyen Paketinin HACCP ve
  öz-kontrol kayıtlarının eşdeğerini referanslar.
- **BRCGS / SQF özel-standart planları.** Ek bir şeffaflık katmanı
  olarak uyumlu.
- **Halk sağlığı sürveyans sistemleri (CDC PulseNet, FoodNet, IFSAC;
  AB EFSA / ECDC).** Mühür için doğrudan kapsam dışı, ancak FACT 06
  üreticiyi katılıma ve herhangi bir sinyal-korelasyon olayını yeni
  MYRIAM yayımları olarak mühürlemeye taahhüt eder.

## Bu kitin yerine geçmediği şeyler

- FDA Gıda Tesisi Kaydı veya USDA FSIS Kuruluş onayı.
- FSMA / FSIS altındaki yazılı Gıda Güvenliği Planınız / HACCP Planınız.
- CCP izleme günlükleri ve düzeltici-eylem kayıtları.
- ISO 17025 laboratuvar akreditasyon gözetimi.
- Yeterlilik testi programları.
- Düzenleyici denetim (FSIS sürekli denetim, FDA periyodik denetim,
  AB yetkili-makam denetimi).
- Halk sağlığı sürveyansı (CDC, EFSA, ECDC, ulusal eşdeğerleri).
- Geri çağırma koordinasyon kanalları (FDA Reportable Food Registry,
  FSIS geri çağırma koordinasyonu, AB RASFF, ulusal eşdeğerleri).
- İşçi güvenliği ve gıda-işçisi eğitim programları.

## Bu kit neden v0.4.0+ sürümünde var

Bu, myriam-kit ile gönderilen işlenmiş örneklerden biridir.
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` adresinde belgelenen autoresearch
tarafından doğrulanan kısıtlama-öncelikli README yapısını takip eder
— kısıtlama-öncelikli istem varyantı, birden fazla örnek alanında
ağırlıklı bir kriterler dizisinde en yüksek puan aldı, çünkü
gıda-güvenliği tasdiki, mührün neyi kanıtladığını abartmanın tehlikeli
olduğu tam bir alan: mührün önleyemediği başarısızlıklarda insanlar
öldü ve ölecek. Açılış bölümleri kitin yük taşıyan parçalarıdır;
manifest içeriği kolay olan parçadır.

Kitin varsayılanları, işçi-adı yayımı konusunda kasıtlı olarak
muhafazakar, tesis-konum hassasiyeti konusunda muhafazakar,
tedarikçi ve müşteri kimliği konusunda muhafazakar ve "bu güvenliği
kanıtlamaz" feragatnamesinde agresiftir. Gıda-güvenliği topluluğunun
abartılmış sertifikasyon dilinin belgelenmiş bir geçmişi vardır; kit,
bir güvenlik garantisi olarak okunma olasılığı en düşük konumu
varsayılan olarak alır. Belirli kamu-açıklama gereksinimlerinin farklı
olduğu yargı bölgelerindeki üreticiler çatallarını buna göre
değiştirebilirler, ancak varsayılan reddetmeler işçi güvenliği ve
dürüst kapsam lehinedir.

## Lisans

Kamu malı (CC0). Çatallayın. Atıf gerekmez.
