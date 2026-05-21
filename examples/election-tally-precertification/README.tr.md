*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

# Seçim Sayımı Ön-Sertifikasyon Mühürleme Kiti

İlçe sayım kurulları, eyalet seçim makamları ve seçim-bütünlüğü gözlemcileri için anahtar teslim bir myriam-kit örneği; sertifikasyonun tam anında bir sayımın Bitcoin-bağlantılı, kurcalamaya karşı dirençli bir mührünü yayımlamak isteyenlere yöneliktir.

[issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4)'ü **kapatır**.

---

## Bu kitin YAPMADIĞI şeyler (önce bunu okuyun)

Mühür, sertifikalananın ne olduğuna ilişkin kriptografik bir zaman damgasıdır. Sertifikalananın doğru olup olmadığını doğrulayamaz. Aşağıdaki başarısızlık türleri **mührün etki alanı dışındadır**:

1. **Oy makinesinin tehlikeye girmesi (Voting-machine compromise).** Donanım yazılımı (firmware) kurcalanmışsa veya oy toplamları yanlış sayılmışsa, mühür yanlış bir sayıyı yüksek bütünlükle bağlar. Mühür, sayım sisteminin çıktılarını gözlemler; sistemin kendisine ilişkin hiçbir görünürlüğü yoktur.

2. **Oy bastırma / yapısal oy hakkından yoksun bırakma (Vote suppression / structural disenfranchisement).** Oy verme yerlerinin kapatılması, kimlik-yasası eşitsizlikleri, posta-oy reddetme oranı yanlılığı ve seçmen kütüğü temizliği (purges) sertifikasyonun yukarısındadır. Mühür, sayılan oyları kaydeder; sayılması gerekenleri değil.

3. **Seçim yanlış-bilgisi (Election misinformation).** Mühür, adaylar, medya veya platformlar tarafından seçim hakkında ileri sürülen iddialar hakkında karar vermez. Mühürlenmiş bir sertifikasyon, bir yanlış-bilgi anlatısında olduğu kadar ona karşı bir savunmada da kolaylıkla alıntılanabilir. Kriptografik zaman damgaları içerik açısından nötrdür.

4. **Oy toplama veya sayım sırasında sertifikasyon-öncesi yolsuzluk (Pre-certification fraud during ballot collection or counting).** Oy-toplama (ballot-harvesting) düzensizlikleri, oy kutusu kurcalama, sayım penceresi boyunca delil zinciri (chain-of-custody) kopmaları — tümü mühür anından önce gerçekleşir. Mühür bunları geriye dönük olarak tespit edemez.

5. **Sertifikalayan makamın zorlanması (Coercion of the certifying authority).** Zorlama altındaki bir sertifikasyon, zorlama altında bir sonucun kriptografik olarak geçerli bir mührünü üretir. Mühür, bir yetkilinin imzaladığını doğrular; neden imzaladığını değil.

6. **Daha sonra hiç düzeltilmeyen yanlış sertifikasyonlar (Wrong certifications that are never later corrected).** Mührün değeri, mührün karşılaştırılabileceği sonraki bir gerçeği-bulma sürecine (denetim, yeniden sayım, yargı süreci) bağlıdır. Eğer böyle bir süreç hiç yürütülmezse, mühür yegâne kayıt olarak durur ve hatayı katılaştırabilir.

7. **İstatistiksel anomaliler ve örüntü tespiti (Statistical anomalies and pattern detection).** Mühür, mantıksız farkları, coğrafi anomalileri veya Benford-yasası sapmalarını işaretlemez. Bunlar mühürlenmiş veri üzerindeki analitik görevlerdir; mührün özellikleri değil.

8. **Zayıf denetim izine sahip alt-pusula yarışları (Down-ballot races with thin audit trails).** Küçük yarışların yeniden-sayım tetikleyicileri daha zayıftır; tek bir mühür, yarış-bazlı kapsamlandırma olmadan bir oy pusulasındaki tüm yarışları anlamlı biçimde kapsayamaz.

**Yukarıdaki dürüst-sınırlar bölümü, bu kitin yük-taşıyan kısmıdır.** Mühürlemenin meşruiyete eşit olduğuna inanan yetkililer onu bir kalkan olarak kullanacaktır. Kit açıkça şunu söylemelidir: bu *sertifikasyon anı için bir reddedilemezlik (non-repudiation) ilkelidir*, seçim doğruluğunun bir kanıtı değildir.

---

## Bu kitin mühürlemeyi REDDETMEK ZORUNDA OLDUĞU şeyler

Geçerli imzalama yetkisine sahip bir kullanıcı tarafından sunulsa bile, kit aşağıdaki olgu örüntülerini reddetmek üzere yapılandırılmıştır:

- **Bireysel seçmen tanımlama (Individual voter identification).** Hiçbir olgu bir seçmeni adlandıramaz, bir oyu bir seçmene bağlayamaz veya bir kişinin yeniden-tanımlanmasını sağlayacak herhangi bir alanı açığa çıkaramaz.
- **Oy-bazlı imza-eşleştirme kararları (Per-ballot signature-match decisions).** PII-yüklüdür; mühürleme, daha sonra itiraz edilebilecek kararların kalıcı kayıtlarını oluşturur.
- **Yayımlanması savunmasız bir seçmeni tanımlayacak herhangi bir olgu.** Oy tercihinin çıkarsanabildiği denli küçük seçim bölgelerinde (tipik olarak <50 oy) seçim-bölgesi düzeyindeki sonuçları içerir.
- **Tüm oylar sayılmadan önce mühürlenen sayımlar.** Kit, "sayım" olarak sunulan kısmi sayımları reddeder. Ön-sertifikasyon, *tüm oyların sayıldığı, ama resmi sertifikasyondan önceki an* anlamına gelir — *sayım sırasında* değil.
- **Geçici veya koşullu sertifikasyonlar (Provisional or contingent certifications).** Mühür bir olguyu yansıtmalıdır; bir koşulu değil.
- **Açık bir mühürlenmiş tamamlayıcı-olgu (companion-fact) ile dışlamayı bildirmeksizin**, devam eden dava topluluklarını dışlayan sayımlar.
- **O yargı yetkisi için sertifikalayan makam dışındaki herhangi biri tarafından yapılan mühürleme.**

Bir reddin kendisi bir olgu olarak mühürlenebilir ("Bu makam X'in mühürlenmesini talep etti; kit ret-kuralı Y uyarınca reddetti"), kötüye-kullanım girişiminin kamuya açık bir kaydını oluşturur.

---

## Bu kitin mühürlediği şeyler

Sertifikasyon anında 8 olgu:

1. **Örnek bildirim (Example notice)** — yayını bir örnek olarak beyan eder (gerçek tasdikler bunu kaldırır veya değiştirir).
2. **Yargı yetkisi tanımlaması (Jurisdiction identification)** — ilçe, seçim tarihi, sertifikalayan makam, sertifikalayan yetkililer adıyla + rolüyle.
3. **Sertifikalanmış sayım (Certified tally)** — yarış-bazlı, aday-bazlı oy toplamları + fazla/eksik oylar + yazılı oylar (write-ins).
4. **Oy muhasebesi ve mutabakatı (Ballot accounting and reconciliation)** — toplam atılan, toplam sayılan, kategoriye göre toplam reddedilen, mod dağılımı, kayıtlı-seçmen paydası.
5. **Donanım ve denetim-izi manifestosu (Equipment and audit-trail manifest)** — sayım cihazı modeli + firmware özeti (hash), CVR dosyası özeti, oy-imgesi arşivi özeti, gözetim-kaydı özeti, imza-eşleştirme politikası özeti.
6. **Sertifikasyon anında eşikler ve tetikleyiciler (Thresholds and triggers at certification)** — yürürlükteki imza-eşleştirme eşiği, yeniden-sayım tetikleyici eşikleri, yarış-bazlı gerçek farklar, RLA tohum taahhüdü.
7. **Tamamlayıcı bildirimler ve ret kaydı (Companion disclosures and refusal record)** — devam eden davalar, incelenen sayım-sonrası anomaliler, dışlanan topluluklar, muhalif kurul üyeleri; kitin mühürlemeyi reddettiği örüntülerin açık listesi.
8. **İmzalama esası (Signing principal)** — Sayım Kurulu tanımlaması + her imzalayanın adı ve partisi + kriptografik anahtar bilgileri.

Her olgu, ret-kapısı (refusal-gate) geleneğiyle sona erer: *"Bu olgu yalnızca X'i ileri sürer. Y'yi ileri sürmez"* (burada Y, yukarıdaki "YAPMAZ" bölümünden en yakın başarısızlık türüdür).

---

## Bu kitin karşı savunduğu şeyler

- **Oy toplamlarının sertifikasyon-sonrası sessiz revizyonu** — FACT 03'teki herhangi bir tamsayı değişimi farklı bir SHA-256, farklı bir Merkle kökü üretir; OTS doğrulamasında başarısız olur.
- **"Bulunan oyların" sessizce soğurulması** — FACT 04'ün mutabakat aritmetiği sertifikasyonda sabitlenir.
- **Firmware-değişimi iddiaları** — FACT 05, donanım manifestosunu sertifikasyonda dondurur.
- **Sertifikasyon-sonrası denetim-yapıtı değişimi** — FACT 05'in özet manifestosu, CVR, oy imgeleri, gözetim kayıtları veya imza-eşleştirme politikasına yapılacak sertifikasyon-sonrası herhangi bir değişikliği yakalar.
- **Eşik ve tetikleyici yeniden-tanımlaması** — FACT 06, sertifikasyon anında yürürlükteki kuralları (imza-eşleştirme eşiği, yeniden-sayım tetikleyicileri, RLA risk sınırı) dondurur.

## Kitin yardımcı olabileceği tarihsel veya yakın-tarihsel durumlar

Kit, aşağıdakileri kapsayan durumlarda yararlı bir bağlantı — *bir çare değil* — üretebilirdi:

- **Antrim County, Michigan (2020).** İlk gayri-resmi sonuçlar, daha sonra karşıt bir sonuca düzeltilen bir aday-değişimi gösteriyordu. Bir düzeltme-öncesi mühür, orijinal duyurunun ne dediği ile düzeltmenin ne dediği için kamuya açık bir referans sağlardı; her ikisi de kriptografik olarak tasdik edilmiş olurdu.
- **Maricopa County, Arizona (2020–2022).** Yeniden sayılan / yeniden incelenen toplamların pek çok yinelemesi dolaştı. Bir sertifikasyon-anı mührü, sonraki her sayımın karşılaştırılabileceği belirsizliği olmayan bir referans noktası sağlardı.
- **Florida 2000 (Bush v. Gore sayım denetimi).** İlçe-bazlı sertifikalanmış toplamlar yeniden-sayım baskısı altında değişti; ilçe-bazlı bir yeniden-sayım-öncesi mühür, manuel yeniden-sayım yordamları başlamadan önce her ilçenin neyi sertifikaladığını korurdu.
- **Belgelenmiş sertifikasyon-sonrası "düzeltmeleri" olan çeşitli yabancı seçimler.** Yargı yetkisinden bağımsızdır.

Kit, makine bütünlüğüne ilişkin 2020'deki temel anlaşmazlıkları, posta-oy politika anlaşmazlıklarını veya çekirdek sorusunun çekişmeli kayıt yerine çekişmeli olgu olduğu herhangi bir seçimi çözmezdi.

## Bu kit ne zaman kullanılır

- Yargı yetkiniz istikrarlı, denetlenmiş bir sertifikasyon sürecine sahiptir ve değiştirilemez bir kamu bağlantısı eklemek ister.
- Sertifikasyon-sonrası bir inceleme bekliyorsunuz ve kurcalamaya karşı dirençli bir referans noktası istiyorsunuz.
- Listelenen olgu kümesini PII'yi açığa çıkarmadan yayımlamak için yasal yetkiniz var.
- Mührün gerçeği-bulma çıktısıyla karşılaştırılabilmesi için paralel bir denetim veya RLA süreciniz var.

## Bu kit ne zaman kullanılmaz

- **Risk-sınırlayıcı denetimlerin (risk-limiting audits), elle yeniden-sayımların veya seçim-sonrası denetimlerin yerine kullanmayın.** Bu kit *eklemelidir*, yerine geçmez.
- **Sertifikalayan yetkili gerçek karar-vericisi değilse kullanmayın** (yanlış atfa yol açar).
- **Sayım esnasında kullanmayın.** Kit özel olarak sertifikasyon anı içindir. Kısmi-sayım mühürleri yanıltıcı referans noktaları yaratır.
- **Seçimin adil, doğru veya meşru olduğunu iddia etmek için kullanmayın** — bunu yapamaz.
- **Sertifikasyon anından önce mühürlemek için veya bir tamamlayıcı-olgu bildirimini atlamak için baskı altında kullanmayın.** Reddedin; ve reddi mühürleyin.
- **Meşruiyet tiyatrosu olarak kullanmayın.** Hileli bir sayımın mührü, hilenin kalıcı kamu kaydıdır; ona karşı bir savunma değil. Bu ilkel iki tarafı da keser; bu, onun dürüstlüğüdür.

## Gerçek bir sertifikasyon için bu kit nasıl çatallanır

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # kurgusal içeriği gerçek içerikle değiştirin
bash build/seal.sh     # resmi sertifikasyon imzasında veya sonrasında mühürleyin
python3 build/verify.py
```

**Kritik zamanlama:** sertifikasyon anında mühürleyin, ÖNCESİNDE DEĞİL. Resmi sertifikasyondan önceki bir mühür, "bu, resmi sonuçtur" yanlış-pozitif kaydını oluşturur. Sonraki bir mühür ise geleneksel reddedilemezliktir.

## Mevcut seçim altyapısı ile bütünleştirme

- **Eyalet Seçim Kurulları / EAC sertifikasyonu.** Kit, resmi sertifikasyon belgesi ile birlikte yayımlanır. Yasal sertifikasyonun yerine geçmez.
- **Risk-sınırlayıcı denetimler (Risk-limiting audits).** FACT 05'teki CVR özeti, RLA aracının tükettiği özetle aynıdır. Mühür, denetlenen CVR'ı sertifikalanmış toplama bağlar.
- **Yeniden-sayım yordamları.** Eyalet yasası uyarınca tetiklenen bir yeniden-sayım YENİ bir mühürlenmiş olgu-kümesi (farklı zaman damgası, farklı özetler, aynı yargı yetkisi) üretir. İki mühür birlikte var olur; biri diğerini üzerine yazmaz. İki mühür arasındaki fark, yeniden-sayımın neyi değiştirdiğine ilişkin kamu kaydıdır.
- **Seçim İşaretleme Dili (Election Markup Language, EML) ve Ortak Veri Formatı (Common Data Format, CDF).** Olgu gövdeleri, kiti veri-formatından bağımsız tutmak için yargı yetkisinin mevcut EML/CDF çıktılarından türetilebilmelidir.
- **İki-partili sayım-kurulu imzası.** Partizan dengeli sayım kurullarına sahip yargı yetkileri için çoklu-imza varyantı önerilir.

## Bu kitin yerine GEÇMEDİĞİ şeyler

- Eyalet seçim yasası uyarınca yasal sertifikasyon
- EAC oy-sistemi sertifikasyonu
- Risk-sınırlayıcı denetimler / elle yeniden-sayımlar
- Yeniden-sayım yordamları ve seçim-sonrası denetimler
- Mahkeme kararları veya seçim-itiraz davaları

## Bu kit neden v0.3.0+ içinde var

Bu, myriam-kit ile birlikte sevk edilen 6. tamamlanmış örnektir. Kit, `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md` içinde belgelenen Karpathy tarzı bir otomatik-araştırma süreci aracılığıyla üretildi. Üç istem varyantı (taklit / ilk-ilkeler / kısıt-öncelikli) paralel kit taslakları üretti; kısıt-öncelikli varyant ağırlıklı bir rubrikte en yüksek puanı aldı ve nihai kit, onun yapısını taklit varyantının uyumu ve ilk-ilkeler varyantının operasyonel ayrıntısıyla bir araya getirdi.

Otomatik-araştırmanın kendisi, ileride kullanılmak üzere `~/Genesis/calc/PROMPT_LIBRARY_v0.md` içinde bir istem örüntüsü olarak belgelenmiştir.

## Lisans

Kamu malı (CC0). Çatallayın. Atıf gerekmez.
