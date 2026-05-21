*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

# İlaç Klinik Çalışması Ön Kayıt Kiti

Klinik çalışma sponsorları ve akademik araştırmacılar için anahtar
teslim bir myriam-kit örneği; ClinicalTrials.gov, EU CTR veya diğer
yargı bölgesi sicillerine kayda **ek olarak**, kurcalama-belirtici
(tamper-evident) ve Bitcoin'e demirlenmiş bir biçimde bir çalışmayı
ön kayıt altına almak isteyenlere yöneliktir.

## Neden *ek olarak* MYRIAM altında ön kayıt yapılır?

Mevcut çalışma sicilleri (ClinicalTrials.gov, EU CTR, ISRCTN)
belgelenmiş bütünlük zayıflıklarına sahiptir:

- ClinicalTrials.gov, sponsorlara orijinal kayıttan **sonra** son
  noktaları, örneklem büyüklüğü hesaplamalarını ve analiz planlarını
  güncelleme izni verir; değişiklik tarihleri sicilde görünür olsa da
  *içerik* değişiklikleri her zaman kriptografik olarak demirlenmez.
- Birkaç büyük çalışma (Goldacre ve diğerleri, 2019; Mathieu ve
  diğerleri, 2009) alan genelinde sistematik post-hoc son nokta
  değiştirmeyi belgelemiştir.
- Dergilerin (CONSORT, ICMJE) editoryal denetimi bazı vakaları
  yakalar; birçoğu süzülüp gider.

Bir MYRIAM mührü bu boşluğu kapatır. Merkle kökü + Bitcoin OTS makbuzu,
*ön kaydedilmiş* birincil son noktada, istatistiksel analiz planında
veya alt grup listesinde yapılan herhangi bir post-hoc değişikliği
kriptografik olarak tespit edilebilir kılar. Mühür, sicilin kendisinden
adli olarak daha zor geri retconnenir.

Bu kit, yargı bölgesi sicillerinin **yerine geçmez, onları tamamlar.**
Gerçek bir çalışma uygun sicile kaydedilmeli VE MYRIAM altında
mühürlenmelidir.

## Bu kitin neye karşı koruduğu

Bu çözümün yardımcı olacağı, mortalite sonuçlu tarihsel vakalar:

- **Vioxx (Merck, 2004)**: APPROVe çalışmasında kardiyovasküler
  olaylar ön kaydedilmiş bir son noktaydı, ancak yayımlanan analiz
  görünür zararı asgariye indiren bir kesim noktası kullandı. Ön
  kaydedilmiş kesim noktasının bir mührü, post-hoc kesim noktası
  değişikliğini yayımlanan makaleden önce kamuya açık biçimde tespit
  edilebilir kılardı.
- **Paxil/Çalışma 329 (GSK/SmithKline, 2001)**: ergenlerde
  intihar eğilimi konusundaki olumsuz çalışma verileri post-hoc
  analizle yeniden çerçevelendi. Son noktaların mühürlü ön kaydı, bu
  yeniden çerçevelemeyi kamuya açık biçimde tespit edilebilir kılardı.
- **Çok sayıda onkoloji çalışması**, sağkalım son noktalarının
  sağkalım faydası ortaya çıkmadığında vekil son noktalarla (ilerlemesiz
  sağkalım, yanıt oranı) değiştirildiği vakalar.

**Mührün doğrudan yakaladığı arıza modları:**

- **Son nokta değiştirme**: gerçek birincil başarısız olduğunda
  ikincil bir son noktanın post-hoc "birincil" konumuna yükseltilmesi.
  Mührün FACT 05'i ön kaydedilmiş birincil son noktayı içerir;
  yayımlanan birincil son noktanın bununla örtüşmesi zorunludur.
- **Sonuç ayıklama (cherry-picking)**: yalnızca işe yarayan analizleri
  seçici biçimde raporlama. FACT 06, ön kaydedilmiş tam analiz planını
  içerir; yayımlanan analizler ön kaydedilmiş olanların tümünü
  kapsamalıdır.
- **Post-hoc alt grup madenciliği**: verileri gördükten sonra
  "ilaç X alt grubunda çalışıyor" iddiasında bulunma. FACT 07, ön
  kaydedilmiş alt grup listesini içerir; başka herhangi bir alt grup
  post-hoc olarak etiketlenmelidir.
- **Örneklem büyüklüğü revizyonu**: ara eğilimler görüldükten sonra
  örneklem büyüklüğünün artırılması. FACT 06, ön kaydedilmiş örneklem
  büyüklüğünü ve güç hesabını içerir.
- **Rahatsız edici ikincil son noktaların sessizce çıkarılması**:
  FACT 05, ikincil son noktaları hiyerarşik test için önceden sıralar;
  herhangi bir yeniden sıralama veya çıkarma tespit edilebilir.
- **Olumsuz sonuçların bastırılması**: FACT 08, yayım taahhüdünü
  içerir; taahhüt edilen pencere içinde yayımlanmama kamuya açık
  biçimde görülür.

**KAPSANMAYAN arıza modları:**

- Çalışmanın kendi yürütülmesindeki suistimal (uydurma veriler,
  hileli kayıt). Mühür *planı* demirler, *yürütmeyi* değil.
- Tüm ön kaydedilmiş analizleri içeren ancak bunları olumlu yönde
  yorumlayan yayınlarda seçici raporlama. Mühür eksiği yakalar;
  yorumlayıcı önyargıyı yakalayamaz.
- Çalışmanın kendisi sırasında hasta zararı. Mühür düzenleyici ve
  kanıtsaldır; çalışma yürütme riskini azaltmaz.

## Bu kit ne zaman kullanılır

Aşağıdaki durumlarda bir ön kaydı mühürlemeyi düşünün:

- Tıbbi veya düzenleyici kararları bilgilendirmek için kullanılacak
  bir klinik çalışmaya — Faz 1'den 4'e — sponsor oluyor ya da
  yürütüyorsunuz.
- Ön kaydedilen tasarım, son noktalar ve analiz planıyla kamuya açık
  şekilde bağlı kalmaya istekliyesiniz.
- Sonuçla başa çıkabilirsiniz: çalışma ön kaydedilmiş son noktalarında
  başarısız olursa, işe yaramış olan farklı bir son noktaya sessizce
  retconlanamazsınız.
- Ön kayıt bütünlüğünün giderek daha fazla talep edildiği bir
  araştırma kültürüne (akademik tıp, kooperatif gruplar, NIH destekli
  araştırma) katılıyorsunuz.

Bu kit *özellikle* şunlar için değerlidir:

- Akademik kurumlardaki araştırmacı tarafından başlatılan çalışmalar
  (sponsorun son noktaları post-hoc değiştirme baskısının gerçek
  olduğu, ancak akademik araştırmacının buna direnme yönünde
  itibara dayalı teşviği bulunduğu durumlar).
- Açık bilim çalışmaları ve yurttaş bilimi çalışmaları.
- Uzun çalışma yürütme geçmişi olmayan küçük biyotek
  şirketlerinde ilaç yeniden konumlandırma çalışmaları.
- Gelecekte "biz bunu hiç söylemedik" argümanlarının öne
  sürülebileceği, düzenleyici başvuruları bilgilendirmesi amaçlanan
  herhangi bir çalışma.

## Bu kit ne zaman kullanılMAMAlıdır

Aşağıdaki durumlarda bu kiti kullanMAYIN:

- Çalışma protokolü gerçekten hâlâ değişim halindeyse. Protokol
  kesinleştiğinde ön kayıt yapın, daha önce değil.
- Sonuçları, yönünden bağımsız olarak yayımlamayı taahhüt
  edemiyorsanız. Mühür, yayımlamamayı kamuya açık biçimde tespit
  edilebilir kılar.
- Çalışma, analiz planını kamuya açık hale getirmenizi engelleyen
  rekabetçi endüstriyel gizlilik içeriyorsa. Mühür analiz planını
  kalıcı kamu kaydı haline getirir; özel bir şey mühürlemenin yolu
  yoktur.
- Protokol için yasal ve etik onayınız yoksa. Mühür, protokolü
  SİZİN onu mühürlediğiniz gibi kaydeder; bir IRB veya etik kurul
  tarafından geriye dönük olarak onaylanamaz.

## Bu kit gerçek bir ön kayıt için nasıl fork edilir

```bash
# 1. Copy this example
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Replace fictional content with the real trial protocol content.
# Each fact corresponds to a section of a standard pre-registration:
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Update site/index.html to reflect the real trial.

# 4. Seal (BEFORE enrollment begins, BEFORE database lock):
bash build/seal.sh

# 5. Verify locally:
python3 build/verify.py

# 6. Deploy:
#    - Publish the seal URL to your trial sponsor's website AND
#    - Add the IPFS CID to the trial's ClinicalTrials.gov record's
#      "Description" or "References" field, so the registry record
#      cross-references the cryptographic seal.
```

**KRİTİK ZAMANLAMA**: mühür, hasta alımının başlamasından ÖNCE
oluşturulmalıdır. İlk hasta alındıktan sonra mühürlenen bir ön kayıt
adli olarak çok daha zayıftır. İdeali, IRB onayı anında mühürlemektir.

## Mevcut ön kayıt altyapısı ile entegrasyon

Kit, değiştirmek için değil, birlikte çalışmak için tasarlanmıştır:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: çalışmayı gerektiği
  şekilde yargı bölgesi siciline kaydedin. Ardından, sicil kaydının
  "Description" veya "References" alanında MYRIAM ile mühürlenmiş
  yayına bağlantı verin.
- **OSF (Open Science Framework)**: OSF, zaman damgalı ön kaydı
  destekler ancak Bitcoin demirlemesi sunmaz. MYRIAM mührü, OSF
  kayıt sayfasına tamamlayıcı bir dosya olarak eklenebilir; bu, hem
  zaman damgası hem de Bitcoin demirlemesi sağlar.
- **AsPredicted.org**: benzer biçimde — MYRIAM mührünü tamamlayıcı
  bir URL olarak bağlayın.
- **Dergiler**: bazı dergiler (örn. Trials, BMJ Open) gönderim
  sürecinin bir parçası olarak ön kayıt URL'lerini kabul eder. MYRIAM
  mührünün URL'sini sicilin URL'siyle birlikte ekleyin.

## Alıcıların (düzenleyiciler, dergi hakemleri, meta-analistler) elde ettiği

MYRIAM altında ön kaydedilmiş bir çalışma hakemlere şunları sunar:

1. **Protokolün belirli bir zamanda kesinleştirildiğine dair
   kriptografik kanıt.** Hakemler mühür zamanını OTS makbuzu üzerinden
   doğrulayabilir.
2. **Protokol metninin bayt düzeyinde kararlılığı.** Yayımlanan
   yöntemler bölümünü ön kaydedilmiş tasarımla karşılaştıran hakemler
   bunu karakter karakter yapabilir.
3. **Son nokta değiştirmenin tespiti.** Mühürlenmiş FACT 05 ile
   yayımlanan birincil son nokta arasındaki basit bir diff, herhangi
   bir ikamenin ortaya çıkmasını sağlar.
4. **Analiz planından sapmanın tespiti.** Mühürlenmiş FACT 06 ile
   yayımlanan istatistiksel yöntemler arasındaki basit bir diff,
   değişiklikleri ortaya çıkarır.
5. **Seçici alt grup raporlamasının tespiti.** Mühürlenmiş FACT 07
   tüm ön kaydedilmiş alt grupları içerir; yayında olup mühürde
   bulunmayan herhangi bir alt grup post-hoc olarak etiketlenmelidir.

Bu, sistematik derleme ve meta-analizi mevcut uygulamaya göre önemli
ölçüde kolaylaştırır.

## Bu kitin ne OLMADIĞI

- IRB / etik kurul onayının yerine geçen bir şey değildir.
- Yargı bölgesi sicil kaydının yerine geçen bir şey değildir.
- Çalışmanın planlandığı şekilde yürütüleceğinin garantisi değildir.
- Hasta onamını veya diğer etik belgeleri demirlemenin bir yolu
  değildir (bunların kendi mühürleme mekanizmaları gerekir).
- Çalışma tasarımına yönelik yayım sonrası eleştirilere karşı bir
  koruma değildir.

## Olumsuz sonuçların yayımlanmasına dair bir not

FACT 08'deki Taahhüt #1 ("yöne bakılmaksızın yayım"), mühürdeki
mortalite üzerindeki tek bir taahhüt olarak en yüksek etkili olanıdır.
Olumsuz çalışma sonuçlarının tarihsel olarak bastırılması (özellikle
ergenlerde psikiyatrik ilaçlar, yaşlı popülasyonlarda onkoloji ilaçları
ve kadınlarda kardiyovasküler ilaçlar için), önyargılı etkililik
tahminlerine dayalı aşırı reçetelendirme yoluyla onlarca yıl içinde
binlerce önlenebilir ölüme makul olarak katkıda bulunmuştur.

Olumsuz sonuçları yayımlama yönündeki mühürlü bir taahhüt, tek başına,
bir sponsorun atabileceği en yüksek kaldıraçlı halk sağlığı
hamlelerinden biridir. Mühür, bu taahhüt için, öz-denetimli yayım
politikalarının sağlayamayacağı bir biçimde dışsal hesap verebilirlik
sağlar.

## Kapanış

MYRIAM altında ilaç klinik çalışması ön kaydı, sponsor için küçük bir
ek iştir: gerçekleri doldurmak için ~30 dakika, mühürlemek için
~10 saniye. Eklediği hesap verebilirlik asimetriktir: dürüst çalışma
yürütme için küçük maliyet, kanıt tabanındaki tarihsel önyargılara
katkıda bulunan post-hoc manevralar üzerinde büyük kısıt.

Bu kiti değerlendiren bir sponsor veya baş araştırmacıysanız, kit
kamu malıdır (CC0). Kullanın. Değiştirin. İyileştirin.

## Lisans

Kamu malı (CC0). Atıf gerekmez.
