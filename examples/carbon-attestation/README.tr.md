# Karbon Tasdiki Mühür Kiti

*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

Karbon proje geliştiricileri, üçüncü taraf doğrulayıcılar ve sicillere
yönelik anahtar teslimi bir myriam-kit örneği. Bir karbon kredisi
ihracı, uzaklaştırma doğrulaması veya emisyon tasdiki olayının tam
sertifikasyon anında Bitcoin'e demirlenmiş, kurcalama-belirtici bir
mührünü yayımlamak isteyenler için — böylece sessizce yapılan
ihraç-sonrası değişiklikler kamuya açık biçimde tespit edilebilir hâle
gelir.

---

## Bu kitin YAPMADIĞI şeyler (önce okuyun)

Karbon kredileri siyasi ve bilimsel olarak tartışmalıdır. Mühür,
tasdik edilenin kriptografik bir zaman damgasıdır. Tasdik edilenin
gerçek iklim faydasını yansıtıp yansıtmadığını doğrulayamaz. Aşağıdaki
başarısızlık modları **mührün etki alanı dışındadır** ve karbon
kredileri hakkındaki anlamlı bütünlük sorularının çoğunu oluştururlar:

1. **Ek nitelik (Additionality).** Mühür, kredilendirilen faaliyetin
   karbon finansmanı olmadan gerçekleşmeyeceğini doğrulayamaz.
   Karşı-olgusal senaryo ilkesel olarak gözlemlenemez. Mühür,
   metodolojinin ek nitelik argümanını kaydeder; onu hükme bağlamaz.

2. **Kalıcılık (Permanence).** Mühür, tutulan karbonun ilgili zaman
   ufku boyunca (orman karbonu için on yıllardan yüzyıllara, bazı
   uzaklaştırmalar için jeolojik zaman ölçekleri) tutulu kalacağını
   doğrulayamaz. Son literatür (Badgley et al. 2022, Patterson et al.
   2022), tampon havuzlarının gerçek geri çevrilme olayları nedeniyle
   önemli ölçüde tükendiğini gösteriyor. Mühürlü bir kredi, belirli
   tampon-havuz varsayımları altında kalıcılığa dair mühürlü bir
   *iddia*dır, kalıcılığın kanıtı değildir.

3. **Sızıntı (Leakage).** Mühür, proje alanındaki kaçınılmış
   emisyonların basitçe proje-dışı bir alana kaydırılmadığını
   doğrulayamaz. Metodoloji-varsayılan sızıntı indirimleri, ölçüm
   değil düzenleyici yer tutuculardır. Mühür uygulanan indirimi
   demirler; onu doğru olarak sertifikalandırmaz.

4. **Yan faydalar (Co-benefits).** Mühür, topluluk-kalkınma veya
   biyoçeşitlilik iddialarını doğrulayamaz. Yan faydalar tipik olarak
   öz-beyan edilmiş ve doğrulayıcı-incelemelidir, karbon
   ölçümlemesinin derinliğinde denetlenmemiştir. Mühür belge
   özetlerini demirler; başka hiçbir şeyi değil.

5. **Özgür-Önceden-Bilgilendirilmiş-Rıza (FPIC) yeterliliği.**
   Karbon projelerinde yerli ve topluluk rızasının belgelenmiş bir
   başarısızlık modu geçmişi vardır (zorlanmış rıza, temsili olmayan
   organlardan rıza, tazminat yoluyla post-hoc "rıza"). Mühür FPIC
   belgelerinin ve şikâyet-günlüğü özetlerini demirler; rıza sürecinin
   gerçek olduğunu sertifikalandıramaz.

6. **Doğrulayıcı bağımsızlığı.** Doğrulayıcılar proje geliştiricileri
   tarafından ücretlendirilir. Bu, hiçbir akreditasyon planının
   çözmediği yapısal bir çıkar çatışmasıdır. Mühür doğrulayıcının
   bağımsızlık beyanını demirler; beyanın doğru olduğunu
   sertifikalandırmaz.

7. **Siciller arası veya ulusal envanterlerle çifte sayım.** Mühür,
   tasdik anındaki sicil-durum anlık görüntüsünü demirler. Aynı
   faaliyet ev sahibi ülke tarafından NDC'sine de sayılıyorsa veya
   başka bir sicilde de talep ediliyorsa, mühür sicil durumunu
   karşılaştırılabilir kılar ancak çifte sayımı engellemez.

8. **Alıcı iddiasının doğruluğu.** Bir "net sıfır" veya "karbon nötr"
   iddiasını desteklemek için mühürlü bir krediyi emekliye ayıran bir
   alıcı, mührün kapsamadığı bir aşağı-akış iddiasında bulunmaktadır.
   Mühür emekliye ayırmayı kaydeder; alıcının pazarlama iddiasının
   geçerliliği ayrı, aşağı-akış bir sorudur.

9. **Metodoloji doğruluğu.** Mühür, tasdik anında yürürlükte olan
   metodoloji atıfı + belge özetini kaydeder. Metodolojinin bilimsel
   olarak geçerli olduğunu öne sürmez. Metodoloji reformu olur; daha
   sonra gözden geçirilen bir metodoloji altında mühürlemek, kredileri
   geriye dönük olarak "yanlış" veya "doğru" yapmaz — ihraç
   sırasında hangi kuralların geçerli olduğunu demirler.

**Yukarıdaki dürüst-sınırlar bölümü bu kitin yük taşıyan kısmıdır.**
Bir karbon kredisinin bütünlüğü hakkındaki neredeyse her anlamlı soru
bu dokuz kovadan birinde bulunur. Mühür, dar kalan boşluğu kapatır:
kayıttaki baytların sessizce geriye dönük değiştirilmesi. O boşluk
gerçek ve kapatmaya değerdir, ancak tartışmalı alanla
karşılaştırıldığında küçüktür.

---

## Bu kitin mühürlemeyi REDDETMESİ GEREKEN şeyler

Kit, geçerli imzalama yetkisine sahip bir kullanıcı tarafından
gönderilse bile aşağıdaki olgu örüntülerini reddetmek üzere
yapılandırılmıştır:

- **"Ek nitelik" bir olgu olarak ifade edilmesi.** Ek niteliği bir
  olgu olarak mühürlemek yanıltıcı bir kayıt oluşturur. Kit,
  metodoloji-uyumlu ek nitelik *argümanlarını* kabul eder, ek nitelik
  *iddialarını* değil.
- **Zaman ufku ve tampon havuzu açıklaması olmaksızın "Kalıcılık".**
  Bu parametreler olmaksızın kalıcılığı mühürlemek, projenin gerçekten
  ne taahhüt ettiğini gizler.
- **Projeye özgü ölçüm olmaksızın "Sızıntı yok".**
  Metodoloji-varsayılan sızıntı indirimleri ölçüm değildir ve mühür
  bunları öyle ele almaz.
- **Üçüncü-taraf doğrulama tamamlanmadan üretilen ölçümlemeler.**
  Doğrulama-öncesi bir mühür, yanlış-pozitif "doğrulanmış" bir kayıt
  oluşturur.
- **Açık siciller-arası açıklama olmaksızın farklı bir sicilde de
  ihraç edilen krediler için ihraç kayıtları** — FACT 06'da.
- **Emekliye ayırma yararlanıcısını adlandırmayan emekliye ayırma
  kayıtları.** Anonim emekliye ayırma, emekliye ayırmanın kamu yararı
  işlevini zayıflatır; kit buna olanak vermeyi reddeder.
- **Tasdik edilebilir belge özetleriyle desteklenmemiş FPIC iddiaları.**
- **Ev sahibi ülke yetki mektubu (LoA) özeti olmaksızın Madde 6.2 /
  6.4 ihracı** — FACT 06'da mühürlü.
- **Proje geliştirici + doğrulayıcı dışında herhangi bir tarafın
  talebi üzerine mühürleme** — o proje için birlikte hareket
  etmeleri dışında.
- **"Sertifikalandırılmış" olarak mühürlenmiş yan fayda iddiaları**
  — sadece "öz-beyan edilmiş ve doğrulayıcı-incelemeli" olduklarında.

Bir reddin kendisi bir olgu olarak mühürlenebilir ("Bu taraf X'in
mühürlenmesini talep etti; kit reddetme kuralı Y uyarınca reddetti"),
bu da kötüye kullanım girişiminin kamu kaydını oluşturur.

---

## Bu kitin mühürlediği şeyler

Tasdik anında 8 olgu:

1. **Örnek bildirimi** — yayını bir örnek olarak ilan eder (gerçek
   tasdikler bunu kaldırır veya değiştirir).
2. **Proje tanımlaması** — proje adı, sicil, sicil proje kimliği,
   metodoloji atıfı + özet, coğrafi sınır özeti, vintage, proje
   geliştirici, yan fayda iddiası, FPIC durumu.
3. **Emisyon veya uzaklaştırma ölçümlemesi** — brüt ton CO2e, taban
   karşı-olgusal senaryo, sızıntı indirimi, tampon-havuz katkısı,
   belirsizlik indirimi, net kredilendirilebilir iddia, her sayısal
   girdinin özetleri.
4. **Ölçüm metodolojisi** — uzaktan-algılama veri kaynakları,
   yer-doğrulama parsel ağı, cihaz kalibrasyon günlüğü özeti,
   sınıflandırıcı model özeti + doğruluk istatistikleri, karbon-yoğunluk
   modeli, kod-kökeni + tekrarlanabilirlik manifestosu.
5. **Üçüncü-taraf doğrulama** — doğrulayıcı kuruluş, akreditasyon,
   bağımsızlık beyan özeti, geliştirici ile önceki katılımlar,
   saha-ziyaret fotoğraf arşivi özeti, gündeme getirilen + çözülen
   bulgular, doğrulama görüşü belge özeti.
6. **İhraç veya emekliye ayırma kaydı** — ihraç talebi + onayı, ihraç
   edilen toplam kredi sayısı, seri aralığı, siciller-arası beyan,
   uygulanabilir olduğunda ev sahibi ülke LoA özeti, emekliye ayırma
   seri aralıkları + yararlanıcılar (emekliye ayırma tasdikleri için),
   sicil-durum anlık görüntü özetleri.
7. **Eşlik eden açıklamalar ve reddetme kaydı** — bekleyen metodoloji
   anlaşmazlıkları, kalıcı-olmama riski, sızıntı çekinceleri, ek
   nitelik çekinceleri, FPIC + şikâyet-günlüğü özetleri, yan fayda
   çekincesi, önceki doğrulayıcı katılımı; kitin mühürlemeyi
   reddettiği örüntülerin açık listesi.
8. **İmzalayan principal** — proje geliştirici + doğrulayıcı + sicil,
   her biri rol + tasdik kapsamı + kriptografik anahtar bilgisi ile.

Her olgu reddetme-kapısı kuralı ile sona erer: *"Bu olgu yalnızca X'i
öne sürer. Y'yi öne sürmez"* (burada Y, yukarıdaki "YAPMADIĞI"
bölümünden en yakın başarısızlık modudur).

---

## Bu kitin savunduğu şeyler

- **İhraç-sonrası ölçümlemenin sessiz değiştirilmesi.** FACT 03'teki
  herhangi bir tam sayı değişikliği farklı bir SHA-256, farklı bir
  Merkle kökü üretir, OTS doğrulamasını geçemez.
- **Sessiz metodoloji ikamesi.** FACT 02, ihraç sırasındaki metodoloji
  atıfını + belge özetini dondurur. İhraç-sonrası farklı bir
  metodoloji sürümünün sicile takılması kamuya açık biçimde
  karşılaştırılabilir.
- **Sessiz taban revizyonu.** FACT 03'ün taban senaryo modeli çıktı
  özeti mühürlüdür. Daha fazla kredi üretmek için post-hoc taban
  yeniden ayarı tespit edilebilir.
- **Sessiz doğrulayıcı görüşü ikamesi.** FACT 05'in görüş belge özeti
  mühürlüdür. İhraç-sonrası "doğrulayıcı her zaman X dedi" yeniden
  yazımı tespit edilebilir.
- **Sessiz emekliye ayırma kaydı kaybolması.** FACT 06'nın
  sicil-durum anlık görüntüsü mühürlüdür. Emekliye ayrılmış olarak
  işaretlendikten sonra gizemli bir şekilde tekrar "kullanılabilir"
  hâle gelen krediler mühre karşı tespit edilebilir.
- **Sessiz FPIC belge ikamesi.** FACT 07'nin FPIC + şikâyet-günlüğü
  özetleri mühürlüdür. Yedek rıza belgeleri tespit edilebilir.
- **Rahatsız edici açıklamaların sessiz kaldırılması.** FACT 07'nin
  eşlik-eden açıklama durumu mühürlüdür. Bir proje açıklama
  sayfasından bir kalıcı-olmama çekincesinin sessizce silinmesi,
  mühürlü baytlara karşı tespit edilebilir.

Kit, altta yatan bütünlük sorularına (ek nitelik, kalıcılık, sızıntı,
FPIC yeterliliği, doğrulayıcı bağımsızlığı, metodoloji geçerliliği)
karşı savunma YAPMAZ. Bunlar daha zor sorunlardır ve mühür onları
çözemez.

---

## Kitin yardımcı olacağı tarihsel veya tarihsele yakın vakalar

Kit, karbon-tasdik kayıtlarının sessiz geriye dönük değiştirilmesini
içeren vakalarda yararlı bir demir — *bir düzeltme değil* — üretirdi.
Bu vakaların hiçbirinde altta yatan tartışmalı soruları
çözMEZdi.

- **Verra yağmur ormanı kredilerinin 2023 Guardian / Die Zeit /
  SourceMaterial soruşturması.** Soruşturmacılar, incelenen REDD+
  projelerinin çoğunun, kaçınılmış emisyonlarının daha sonraki
  uzaktan-algılama yeniden analizine uymadığı krediler ürettiğini
  buldu. Soruşturma, geriye dönük olarak değiştirilen sicil
  kayıtlarına karşı proje belgelerinin yeniden inşa edilmesini
  gerektirdi. Her ihraç döngüsünde mühürlü bir yayın, her döngüde
  tasdik edilenin belirsiz referans baytlarını sağlardı — altta yatan
  taban sorununun düzeltilmesi değil, ancak temiz bir adli zaman
  çizelgesi.

- **2020 Kaliforniya orman-ofset geri çevrilme olayları.**
  Kaliforniya uyum piyasası altında birden fazla orman-karbon
  projesi, kendileri için ayrılmış tampon-havuz rezervini aşan orman
  yangını geri çevrilmeleri yaşadı. Her projenin kalıcı-olmama riski
  hakkında *ihraç sırasında* ne tasdik ettiğinin (projenin daha sonra
  tasdik ettiğini iddia ettiğine karşı) yeniden inşası şu anda zor.
  Vintage-başına mühürler, yangın öncesi tasdikleri kanonik olarak
  geri getirilebilir kılardı.

- **Referans-bölge taban metodolojileri geriye dönük olarak şişirilmiş
  olarak eleştirilen çeşitli REDD+ projeleri.** İhraç sırasında
  mühürlü bir metodoloji-belge özeti, hangi metodoloji sürümünün
  hangi vintage'a fiilen uygulandığını demirler, "metodoloji her
  zaman X idi" savunmasını karşılaştırılabilir hâle getirirdi.

- **Avustralya Karbon Kredi Birimi (ACCU) insan-uyarımlı yenilenme
  projesi anlaşmazlıkları (2022–2023).** Yenilenmenin gerçekten
  proje-uyarımlı mı yoksa doğal mı olduğuna dair akademik eleştiri,
  projenin başlangıçta neyi iddia ettiğine dair anlaşmazlıklara
  döndü. Mühürlü tasdikler vintage-başına belirsiz kayıtlar sağlardı.

- **Durumu değişen karbon-ofset emekliye ayırma kayıtları.** Gönüllü
  piyasa sicillerinde emekliye ayırma kayıtlarının emekliye ayırma
  sonrası durum değiştirdiği (farklı bir nedenle "emekli" hâle
  gelmek veya daha sonra farklı bir yararlanıcıya atfedilmek)
  görünen birkaç belgelenmiş vaka. Emekliye-ayırma-başına mühürler,
  orijinal emekliye ayırma anındaki durumu demirlerdi.

Bu vakaların hiçbirinde kit, altta yatan kredinin gerçek iklim
faydasını temsil edip etmediğini çözmezdi. Kit kayıtları demirler;
yaptığı tek şey budur.

---

## Bu kit ne zaman kullanılmalı

- Standart sicil dosyalama işleminizin yanında kurcalama-belirtici
  bir tasdik yayımlamak isteyen bir proje geliştiricisiniz.
- Doğrulama görüşünüzün bir sicilin sonraki "doğrulayıcının söyledikleri"
  temsiline karşı kamuya açık biçimde doğrulanabilir olmasını isteyen
  bir üçüncü taraf doğrulayıcısınız.
- İhraç ve emekliye ayırma kayıtlarına ek bir bütünlük katmanı
  sağlamak isteyen bir sicilsiniz — özellikle sicil bütünlüğü için
  daha zayıf hukukun-üstünlüğü güvencelerine sahip yargı bölgelerindeki
  projeler için.
- Çok yıllı boyuna karbon proje analizi yürüten ve bir projenin
  sonraki temsillerini ihraç-zamanı baytlarına karşı karşılaştırmak
  için kamuya açık bir demire ihtiyaç duyan bir gazeteci, akademisyen
  veya STK'sınız.
- Emekliye ayırdığınız kredilerin kamuya açık biçimde demirlenmiş
  kayıtlara karşı emekliye ayrılmasını isteyen bir alıcısınız (şirket
  net-sıfır, havayolu uyumu), böylece aşağı-akış pazarlama iddianız
  istikrarlı bir adli zaman çizelgesine karşı denetlenebilir.

## Bu kit ne zaman kullanılMAmalı

- **Akredite üçüncü-taraf doğrulamasının yerine kullanMAyın.** Mühür
  ISO 14064-3 doğrulamasının yerini almaz; onunla birleşir.
- **Bir projenin "ek", "kalıcı" veya "düşük-sızıntılı" olduğunu iddia
  etmek için kullanMAyın.** Mühür bu özellikleri doğrulayamaz. Mührü
  bunları öne sürmek için kullanmak kötüye kullanımdır.
- **Düşük-kaliteli krediler için meşruiyet tiyatrosu olarak
  kullanMAyın.** Düşük-kaliteli bir kredi üzerinde kriptografik bir
  mühür, düşük kalitenin kalıcı bir adli kaydıdır, onun savunması
  değil. Primitif her iki yöne de keser; bu onun dürüstlüğüdür.
- **Ev sahibi ülkenin NDC'sine de saydığı kredileri mühürlemek için
  kullanMAyın** — FACT 06'da açık karşılık-ayarlaması açıklaması
  olmaksızın.
- **Doğrulama öncesi mühürleMeyin.** Doğrulayıcının görüşü
  sonuçlandırılmadan önce bir mühür yanlış-pozitif "doğrulanmış" bir
  kayıt oluşturur.
- **FACT 07'deki bir eşlik-eden olgu açıklamasını atlamak için baskı
  altında kullanMAyın** (bekleyen metodoloji anlaşmazlıkları, FPIC
  sorunları, önceki doğrulayıcı katılımı). Reddedin ve reddi
  mühürleyin.
- **Bir pazarlama rozeti olarak kullanMAyın.** "MYRIAM-mühürlü" bir
  kalite iddiası değildir; adli bir özelliktir. Bunu bir kalite
  rozeti olarak ele almak, kısıtlama-öncelikli tasarımın önlemeye
  çalıştığı tam olarak o kötüye kullanımdır.

## Gerçek bir tasdik için bu kit nasıl çatallanır

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # kurgusal içeriği gerçek olanla değiştirin
bash build/seal.sh         # sicil ihracında VEYA SONRASINDA mühürleyin, önce değil
python3 build/verify.py    # onaylayın
```

**Kritik zamanlama:** sicilin resmi ihraç olayında VEYA SONRASINDA
mühürleyin, ÖNCE değil. İhraç-öncesi bir mühür yanlış-pozitif
"ihraç edilmiş" bir kayıt oluşturur. Emekliye ayırma tasdikleri için
emekliye ayırma ANINDA mühürleyin. İhraç ile emekliye ayırma arasındaki
devam eden izleme tasdikleri için her doğrulayıcı-imzalı izleme
döngüsünde mühürleyin — ancak FACT 01'de tasdiğin bir ihraç değil,
izleme güncellemesi olduğunu açıkça belirtin.

## Mevcut karbon altyapısı ile entegrasyon

- **Verra (VCS).** Mühürlü yayının URL'si veya IPFS CID'si, VCS
  proje sayfasına tamamlayıcı belge olarak eklenebilir. Mühür VCS
  doğrulamasının yerini almaz; onunla birleşir.
- **Gold Standard.** Aynı entegrasyon modeli — Gold Standard ihraç
  belgelendirmesinin yanında tamamlayıcı tasdik. Gold Standard'ın yan
  faydalara + topluluk yararı belgelendirmesine yaptığı vurgu, FACT
  02 + FACT 07'ye doğal olarak eşlenir.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Aynı entegrasyon modeli.
- **Madde 6.4 (Paris Anlaşması Denetim Organı mekanizması).** FACT
  06'daki ev sahibi ülke LoA özeti, özellikle Madde 6.4 / 6.2 ITMO
  izlenebilirliği için tasarlanmıştır. Karşılık-ayarlaması
  açıklaması, reddetme-kapılı bir alandır.
- **EU ETS MRV.** Uyum piyasası ihraççıları için MRV raporu özeti,
  FACT 03'ün ölçümleme elektronik tablo özetine eşlenir. Mühür
  operatörün doğrulanmış emisyon raporu ile birleşir — onun yerini
  almaz.
- **CDP (Carbon Disclosure Project) kurumsal açıklama.** CDP
  başvurularında emekliye ayrılmış kredilere atıfta bulunan kurumlar
  için, FACT 06 altında mühürlü emekliye ayırma kaydı kanonik geri
  getirilebilir kayıttır. CDP başvuru dili, mühürlü yayının Merkle
  kökü veya IPFS CID'sine atıfta bulunabilir.
- **ISO 14064-2 (proje) / ISO 14064-3 (doğrulama) / ISO 14065
  (akreditasyon).** Mühür uygunluk iddiası + özetleri kaydeder;
  uygunluk değerlendirmesini yapmaz.
- **TSVCM Temel Karbon İlkeleri (CCP) / ICVCM etiketleri.** Bir
  projenin ICVCM CCP'lere göre değerlendirildiği yerlerde,
  değerlendirme sonuç özeti FACT 07'de eşlik eden bir açıklama
  olarak mühürlenebilir.

## Bu kitin yerine geçmediği şeyler

- Akredite üçüncü-taraf doğrulama (ISO 14064-3)
- Sicil ihraç ve emekliye ayırma iş akışları
- Metodoloji uygunluk değerlendirmesi
- Madde 6 işlemleri için ev sahibi ülke yetkilendirme süreçleri
- Uyum piyasası MRV süreçleri (EU ETS, California Cap-and-Trade,
  RGGI vb.)
- Gönüllü piyasa bütünlük girişimleri (ICVCM, VCMI)
- Bağımsız iklim-etki değerlendirmesi

## Bu kit neden v0.4.0+ sürümünde var

Bu, myriam-kit ile gönderilen 7. işlenmiş örnektir. Kit, karbon-kredisi
piyasalarının iyi belgelenmiş bir sessiz geriye-dönük değiştirme
geçmişine sahip olması nedeniyle vardır — geriye-dönük olarak yeniden
yorumlanan metodolojiler, geriye-dönük olarak revize edilen taban
senaryoları, durum değiştiren emekliye-ayırma kayıtları ve zamanla
rahatsız edici çekinceleri sessizce çıkaran proje açıklamaları.

Mühür, tasdik-anındaki-baytlar *dar* boşluğunu kapatır. Daha geniş
tartışmalı ek nitelik, kalıcılık, sızıntı veya yan fayda gerçekliği
sorularına değinmez — ve değinemez. Bu sınırlamanın kit tarafından
dürüst çerçevelenmesi onun en önemli özelliğidir.

## Lisans

Kamu malı (CC0). Çatallayın. Atıf gerekmez.
