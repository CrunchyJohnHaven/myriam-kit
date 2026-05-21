*Türkçe çeviri — orijinal İngilizce sürüm için bkz. [README.md](README.md)*

# Aşı Partisi Tasdik Kiti

Aşı üreticileri, kalite güvence makamları ve halk sağlığı kurumları
için anahtar teslim bir myriam-kit örneği; bir parti çıkışına ilişkin
Bitcoin'e demirlenmiş, kurcalama-belirtici (tamper-evident) bir mührü
yayımlamak isteyenlere yöneliktir.

## Bu kitin neye karşı koruduğu

**Mührün yakaladığı arıza modları:**

- **Çıkış testi sonuçlarının sessizce geriye dönük değiştirilmesi.**
  Örnekteki 8 çıkış-testi PDF'inin tamamı hashlenir. Çıkış sonrası
  yeniden hashleme, herhangi bir değişikliği açığa çıkarır.
- **Çıkışta hangi spesifikasyonların geçerli olduğuna dair
  uyuşmazlıklar.** Mühürlenmiş FACT 02; kanonik parti kimliğini ve
  üretim kaydının hash'ini içerir. Gelecekteki "spesifikasyon her
  zaman X idi" türü tartışmaların açık bir kamusal demir noktası olur.
- **Geri çağırma kapsamının sessizce küçültülmesi.** FACT 05'teki
  farmakovijilans taahhütleri mühürlenir; bunların yerine
  getirilmemesi kamuya açık biçimde gözlemlenebilir.
- **Spesifikasyon dışı kalmış bir parti için geriye dönük yeniden
  spesifikasyon.** Bir çıkış-testi sonucu aslında sınırda GEÇTİ idiyse
  ve çıkış sonrasında KALDI olarak yeniden sınıflandırılırsa,
  mühürlenmiş rapor hash'leri orijinal sonuç PDF'inin ne dediğini
  ispat eder.

**KAPSANMAYAN arıza modları:**

- Üretim sürecinin kendisindeki sahtekârlık (mühür, test sonuçlarını
  demirler; üretim bütünlüğünü değil).
- Aksi takdirde testleri geçen bir partinin biyolojik sonucu olan
  advers olaylar (mühür klinik güvenliği belgelemez, yalnızca
  belgesel bütünlüğü belgeler).
- Hangi düzenleyici spesifikasyon sürümünün yetkili olduğuna ilişkin
  uyuşmazlıklar.

## Bu kit ne zaman kullanılır

Aşağıdaki durumlarda bir parti çıkışını mühürlemeyi düşünün:

- Aşı üreticisisiniz ve çıkış kayıtlarının adli bütünlüğünü
  düzenleyicilerin gerektirdiğinin ötesinde göstermek istiyorsunuz
- "Tasdik ettiğimizi yayımlarız" pratiğini benimseyen bir QA
  ekibisiniz
- Düzenleyici altyapısı daha zayıf bir yargı bölgesinde küçük/ulusal
  ölçekli bir üreticisiniz ve parti kayıtlarını küresel bir
  doğrulayıcıya karşı demirlemek istiyorsunuz
- Ticari olmayan bir aşı üretim programı (ör. ihmal edilmiş
  hastalıklar için) yürüten bir halk sağlığı kuruluşu veya STK'sınız

## Tarihsel mortalite emsali

- **Heparin kontaminasyonu (2008, Çin):** heparin partilerinde sahte
  aşırı sülfatlanmış kondroitin sülfat. Mühürlü bir çıkış-testi
  manifestosu, çıkış sonrası test kaydının sessizce değiştirilmesini
  kriptografik olarak tespit edilebilir kılardı.
- **Tylenol siyanür (1982):** kurcalama başlangıç noktasına ilişkin
  geriye dönük uyuşmazlıklar. Mühürlü bir üretim-kaydı hash'i,
  dağıtım öncesi durumu demirler.
- **Çeşitli aşı parti geri çağırmaları**, "bu parti hiç düzgün test
  edildi mi" sorusunun yıllar sonra tartışmalı hâle geldiği vakalar.

Kit, bu vakaların HİÇBİRİ için kesin anlamda bir çözüm DEĞİLDİR —
ancak her birinde mühürlenmiş parti tasdikleri daha temiz bir adli
zaman çizelgesi sağlardı.

## Bu kit gerçek bir parti için nasıl fork edilir

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # kurgusal içeriği gerçek partiyle değiştirin
bash build/seal.sh        # dağıtım başlamadan ÖNCE MÜHÜRLEYİN
python3 build/verify.py   # doğrulayın
```

**KRİTİK ZAMANLAMA**: QA çıkışı anında, parti dağıtılmadan ÖNCE
mühürleyin. Dağıtım sonrası bir mühür adli olarak daha zayıftır.

## Mevcut ilaç altyapısı ile entegrasyon

- **eCTD başvuruları (FDA / EMA):** mühürlü yayım URL'si veya IPFS
  CID'si, Modül 3 (kalite) bölümünde referans gösterilebilir
- **WHO Ön Yeterlilik (Prequalification):** mühürlü manifesto,
  çıkış öncesi test zincirini FDA/EMA dışı yargı bölgelerine
  gösterir
- **Farmakovijilans geri bildirimi:** FACT 05, üreticiyi 6 ve 12
  ayda agregat AE sayımlarının mühürlü raporlamasıyla yükümler
- **Geri çağırma sistemleri (RxConnect, MedWatch):** bir geri
  çağırma gerekirse, geri çağırma kapsamının kendisi MYRIAM altında
  mühürlenir; bu, dağıtılmış tüm partilerin ele alındığının kamusal
  doğrulamasını sağlar

## Bu kitin yerini ALMADIĞI şeyler

- FDA / EMA / WHO düzenleyici başvuruları
- GMP denetim izleri (mühür SONUÇLARI demirler, ham süreç kayıtlarını
  değil)
- Farmakovijilans veritabanları (VAERS / EudraVigilance)
- Geri çağırma koordinasyon sistemleri

## Lisans

Kamu malı (CC0). Fork edin. Atıf gerekmez.
