# Muhbir Manifesto Mühürleme Kiti

*Türkçe çeviri — İngilizce orijinali için bkz. [README.md](README.md)*

**Delilin muhbir ile kamuoyu arasındaki aracılar tarafından gömüldüğü,
düzenlendiği veya tartışmaya açıldığı** özel başarısızlık moduyla karşı
karşıya kalan muhbirler için anahtar teslim bir myriam-kit örneği. Bu kitin
savunduğu kanonik tarihsel vakalar:

- Boeing 737 MAX (iç güvenlik raporları küçümsenmiş/gömülmüştür)
- Theranos (laboratuvar testi kaygıları yıllarca bastırılmıştır)
- Sunum sonrası düzenlenen FDA müfettiş raporları
- Frances Haugen / Facebook (mühürlü bir manifesto, belgelerin özgün olduğunu
  ve iddia edilen zamanda var olduğunu kanıtlayacaktı)

Bu kitin neye karşı savunduğu (protokol terimleriyle):

- [FACT 05](facts/05_threat_model.txt) içindeki T1–T3: belge içeriklerinin
  kamuya açık biçimde tartışılması, belgelerin iddia edilen zamanda
  mühürlenmediğine ilişkin iddialar, geriye dönük uydurma iddiaları.
- T9: üçüncü tarafların gazetecilere değiştirilmiş kopyalar vermesi.

Bu kitin savunmadığı şeyler:

- Muhbire karşı kişisel misilleme (T7).
- Muhbir üzerinde geri çekme baskısı (T4, FACT 07'nin sessiz geri çekmeyi
  kamuya açık biçimde tespit edilebilir kılmasıyla kısmen hafifletilir).
- Açıklamanın kendisi için muhbire karşı hukuki işlem (T5).
- Muhbirin karakterini gözden düşürme (T8).
- Aracıların haberi sessizce düşürmesi (T10).

Eğer bu kiti kullanmayı düşünen bir muhbirseniz, **önce bu README'nin
tamamını okuyun**. Protokol bir araçtır. Protokol; bir hukuk danışmanının,
bir gazetecinin, bir düzenleyicinin veya dikkatli operasyonel güvenliğin
yerine geçmez.

## Bu kit ne üretir

Şunları kanıtlayan, delilin kendisinin değil, delilin *kriptografik olarak
mühürlü bir manifestosunu*:

1. Her bir delil dosyasının belirli bayt dizisinin mühürleme anında var olduğunu.
2. Mühürlemenin belirli bir zamanda veya öncesinde gerçekleştiğini (Bitcoin OTS
   tasdiki üzerinden).
3. Köken, iddia, tehdit modeli, alıcı protokolü ve sessiz-geri-çekme-yapılmaması
   taahhüdünün hep birlikte beyan edildiğini.

Asıl belgeler, bir alıcıya gönderene dek sizin tasarrufunuzda kalır.
Alıcılar, mühürlediğinizle aynı baytları aldıklarını doğrular.

## Bu kit ne zaman kullanılır

Aşağıdakilerin tamamı geçerliyse, delili bir gazeteciye, düzenleyiciye veya
avukata iletmeden **önce** bir manifesto mühürlemeyi düşünmelisiniz:

- Bayt düzeyinde özgün biçimde korunmasını istediğiniz dijital biçimde (PDF'ler,
  e-postalar, görüntüler vb.) deliliniz var.
- Aracıların delili değiştirebileceğini, tartışmaya açabileceğini veya
  gömebileceğini bekliyorsunuz.
- Asıl belgeleri iletime kadar tasarrufunuzda tutabiliyorsunuz.
- Manifestoyu, belgelerin içeriğini ifşa etmeksizin (yalnızca özetler kamuya
  açıktır) kamuya açık biçimde yayımlayabiliyorsunuz.
- Bir muhbir olarak kamuoyunda tanımlanabilir hâle gelmenin risklerini
  tartmışsınız (imza-sahibi alanı). Anonim kalıyorsanız, ilişkili tüm yayımlarda
  tutarlı bir takma ad kullanın.
- Kendi yargı yetkinizdeki muhbir-koruma yasası hakkında bir avukata danışmışsınız.

## Bu kit ne zaman KULLANILMAZ

Şu durumlarda bu kiti KULLANMAYIN:

- Belgelerin kendisi, kamuya-açık-özetlenmemesi gereken üçüncü taraflar
  (hastalar, müşteriler, çalışanlar) hakkında kişisel bilgi içeriyorsa.
  Orijinali değil, sansürlü bir sürümü özetleyin.
- Manifestoyu yayımlamanın kendisi, muhbiri rıza vermediği bir biçimde
  tanımlayacaksa.
- Henüz bir avukata danışmadıysanız. Protokol bir araçtır; muhbir-koruma
  yasası yargı-yetkisine özgüdür ve protokolün dışında yaşar.
- İleride tek bir iddiayı geri çekmek isteyebilirseniz. Mühür kalıcıdır;
  düzeltmenin tek dürüst yolu yeni mühürlü düzeltmelerdir.
- Bunu zorlama altında veya zaman baskısı altında yapıyorsanız. Protokol
  zorlamayı amplifiye eder; reddetme kapısı (myriam-kit `SPEC §8`) yayımcılar
  için olduğu kadar muhbirler için de geçerlidir.

## Gerçek bir ifşa için bu kit nasıl çatallanır

```bash
# 1. Bu örneği yeni bir dizine kopyalayın
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Kurgusal içeriği kaldırın; yerine gerçek olgularınızı koyun.
# facts/ altındaki her dosya bir olgudur. Her birini okuyun ve değiştirin.
$EDITOR facts/01_example_notice.txt   # gerçek bir kapak ifadesine değiştirin
$EDITOR facts/02_provenance.txt       # delilinizin gerçek kökeni
$EDITOR facts/03_evidence_manifest.txt # gerçek belgelerinizi özetleyin ve listeleyin
$EDITOR facts/04_allegation_summary.txt # gerçek iddianız
$EDITOR facts/05_threat_model.txt     # gerçek beklenen tepkileriniz
$EDITOR facts/06_recipient_protocol.txt # alıcınıza göre ayarlayın
$EDITOR facts/07_no_retraction_commitment.txt # geri-çekme-yapmama beyanınız
$EDITOR facts/08_signing_principal.txt # gerçek imza kimliğiniz (veya takma adınız)

# 3. site/index.html dosyasını gerçek olguları yansıtacak şekilde güncelleyin.
# seal.sh betiği HTML'i otomatik olarak doldurmaz; el ile düzenleme
# insan-incelemesi adımıdır.
$EDITOR site/index.html

# 4. Mühürleyin.
bash build/seal.sh
# Çıktılar: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Yerel olarak doğrulayın.
python3 build/verify.py

# 6. Manifestoyu (belgeleri DEĞİL) şunlardan herhangi birine yayımlayın:
#    - Kontrolünüzdeki bir statik barındırıcı (Cloudflare Pages, GitHub Pages vb.)
#    - Yazdırılan CID'de IPFS ağı
#    - Her ikisi (önerilen)

# 7. Ayrı olarak, asıl belgeleri alıcıya tercih ettiğiniz bir güvenli kanal
#    üzerinden iletin (Signal, SecureDrop vb.).
#    Alıcı, dosya özetlerini manifestonuza karşı doğrular.
```

## Gerçek delil dosyaları için özet hesaplama

Bir belge dosyasını SHA-256 ile özetlemek için:

```bash
shasum -a 256 my_document.pdf
```

İlk 64 onaltılık karakter SHA-256 değeridir. Bunu manifestoya koyun.

Aynı anda birçok dosyayı özetleyebilirsiniz:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Bu size `facts/03_evidence_manifest.txt` için verileri verir.

## Operasyonel güvenlik notları

MYRIAM protokolü operasyonel güvenlik sağlamaz. *Delil dayanıklılığı* sağlar.
Yine de şunlara ihtiyacınız vardır:

- Avukatınıza güvenli bir iletişim kanalı
  ([Signal](https://signal.org/), yüz yüze veya avukatınızın kurulu güvenli
  kanalı)
- Asıl belgeler için güvenli bir depolama yeri (durağan halde şifrelenmiş;
  işvereninizin erişebileceği bulut hizmetlerinde değil)
- Mühürleme için temiz bir cihaz (işveren hesaplarıyla ilişkili olmayan kişisel
  bir dizüstü; tercihen yalnızca bu amaç için kullanılan bir cihaz)
- Yayım için temiz bir ağ (işvereninizin ağı değil; işvereninizin İSS'nizi
  celp etme ihtimali varsa ev IP adresiniz de değil)

Muhbirler için operasyonel güvenlik üzerine önerilen okumalar:

- [The Intercept'in SecureDrop dokümantasyonu](https://securedrop.org/)
- [Freedom of the Press Foundation kaynakları](https://freedom.press/)
- [EFF'in gözetime karşı öz-savunma rehberi](https://ssd.eff.org/)

Mühürleme sürecine başlamadan ÖNCE bunlara başvurun. Protokol, protokol
çağrılmadan önce yapılan kötü opsec tercihlerine karşı koruma sağlamaz.

## Alıcıların bilmesi gerekenler

Alıcılara mühürlü manifesto ile birlikte bu README'yi de gönderin. Manifestonun
kendisi alıcı protokolünü (FACT 06) içerir, ancak README alıcı rolünü
genişletir:

- **Gazeteciler**: önce manifestonun kendi bütünlüğünü doğrulayın. Sonra
  belgeleri ayrı bir güvenli kanal üzerinden talep edin. Yayımlamadan önce her
  belgenin SHA-256 değerinin manifestoyla eşleştiğini doğrulayın. Belgeleri
  muhbirin rızası olmadan yayımlamayın; mühürlü manifestonun varlığını ve
  doğrulama sonucunuzu yayımlayın.
- **Düzenleyiciler**: aynı doğrulama süreci. Mühürlü manifesto artı eşleşen
  belgeler, biçimsel zincir-koruyucu toplama dışındaki en güçlü delil
  biçimidir.
- **Avukatlar**: mühürlü manifesto, belgelerin iddia edilen zamanda var
  olduğuna ilişkin adli sabitleme sağlar. Belirli bir yargı yetkisinin
  delil-kurallarını karşılayıp karşılamadığını belirlemek size aittir.

## Bu kitin NE OLMADIĞI

- Hukuk danışmanlığının yerine geçmez.
- Birinin sizin açıklamanız üzerine harekete geçeceğinin garantisi değildir.
- Misillemeye karşı bir koruma değildir.
- Belgelerin içeriklerinin kimlik doğrulaması değildir (yalnızca
  mühürleme-anı-baytlarının doğrulamasıdır).
- Kimseyle anonim iletişim kurmanın bir yolu değildir — mühür kamuya açıktır;
  imza-sahibi adınız gerçekse, tanımlanmışsınızdır.

## Kapanış

Mühürlü bir manifesto küçük bir şeydir. Belirli bir zamanda belirli bir
biçimde var olan daha büyük bir bayt akışı kümesini kanıtlayan tek bir bayt
akışıdır. Bu küçüklük onun gücüdür: yalnızca tek bir şey yapar ve bunu
Bitcoin blok zincirinin ömrü boyunca yapar.

Eğer bunu muhbir olmayı düşündüğünüz için okuyorsanız, lütfen: önce bir
avukatla konuşun. Yukarıdaki operasyonel güvenlik rehberlerini kullanın.
Sonra, yalnızca tüm bu yukarı-akış değerlendirmeleri yerli yerindeyse,
bu kiti ifşanızın kriptografik omurgası olarak düşünün. Kriptografi kolay
kısımdır. Kriptografinin yukarı-akışındaki her şey, gerçek riskin yaşadığı
yerdir.

## Lisans

Kamu malı (CC0). Çatallayın. İyileştirin. İzin almadan kullanın.
