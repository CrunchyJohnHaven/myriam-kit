# İfşaçı manifesti möhürü dəsti

*Azərbaycan tərcüməsi — ingilis dilindəki orijinal versiya üçün, [README.md](README.md)-ə baxın*

İfşaçıların xüsusi uğursuzluq rejimi ilə üzləşdiyi hallar üçün açar
təslim myriam-kit nümunəsi, burada **dəlillər ifşaçı və ictimaiyyət
arasındakı vasitəçilər tərəfindən basdırılır, redaktə edilir və ya
mübahisəyə açılır**. Bu kitin müdafiə etdiyi kanonik tarixi hallar:

- Boeing 737 MAX (daxili təhlükəsizlik hesabatları azaldılıb/basdırılıb)
- Theranos (laboratoriya-test narahatlıqları illərlə yatırılıb)
- FDA müfəttiş hesabatları təqdimatdan sonra redaktə edilib
- Frances Haugen / Facebook (möhürlənmiş manifest sənədlərin həqiqi
  olduğunu və iddia edilən vaxtda mövcud olduğunu sübut edərdi)

Bu kitin müdafiə etdiyi (protokol terminlərində):

- T1–T3 [FACT 05](facts/05_threat_model.txt)-də: sənəd məzmununa
  ictimai etiraz, sənədlərin iddia edilən vaxtda möhürlənmədiyi
  iddiası, geriyə dönük saxtakarlıq iddiaları.
- T9: üçüncü tərəflərin jurnalistlərə dəyişdirilmiş nüsxələr verməsi.

Bu kitin müdafiə **etmədiyi**:

- İfşaçıya qarşı şəxsi qisas (T7).
- İfşaçıya geri çəkilmək üçün təzyiq (T4, FACT 07-nin səssiz geri
  çəkilməni ictimai olaraq aşkarlanmasını təmin etməsi ilə qismən
  azaldılır).
- Açıqlama üçün ifşaçıya qarşı hüquqi tədbirlər (T5).
- İfşaçının xarakterinin gözdən salınması (T8).
- Vasitəçilərin hekayəni səssizcə tərk etməsi (T10).

Bu kiti istifadə etməyi düşünən bir ifşaçısınızsa, **əvvəlcə bu bütün
README-i oxuyun**. Protokol bir alətdir. Protokol hüquq müşaviri,
jurnalist, tənzimləyici və ya diqqətli əməliyyat təhlükəsizliyinin
əvəzedicisi deyil.

## Bu kit nə istehsal edir

Sübut edən kriptoqrafik olaraq möhürlənmiş dəlillərin *manifestı*
(dəlilin özü deyil):

1. Hər bir dəlil faylının xüsusi baytları möhürləmə anında mövcud idi.
2. Möhürləmə xüsusi bir vaxtda və ya ondan əvvəl baş verdi (Bitcoin
   OTS təsdiqi vasitəsilə).
3. Mənşə, iddia, təhlükə modeli, alıcı protokolu və səssiz-geri-çəkilməmə
   öhdəliyi hamısı birlikdə bəyan edildi.

Əsas sənədlər alıcıya göndərənə qədər sizin sahibliyinizdə qalır.
Alıcılar möhürlədiyiniz eyni baytları aldıqlarını yoxlayır.

## Bu kiti nə vaxt istifadə etməli

Aşağıdakıların hamısı doğru olduqda, dəlilləri jurnalistə, tənzimləyiciyə
və ya vəkilə ötürməzdən **əvvəl** manifest möhürlənməsini nəzərdən
keçirməlisiniz:

- Baytwise həqiqi olaraq qorunmasını istədiyiniz rəqəmsal formada
  dəlilləriniz var (PDF-lər, e-poçtlar, şəkillər və s.).
- Vasitəçilərin dəlilləri dəyişdirə, mübahisə edə və ya basdıra
  biləcəyini gözləyirsiniz.
- Əsas sənədləri ötürməyə qədər sahibliyinizdə saxlaya bilərsiniz.
- Manifestı sənədlərin məzmununu açıqlamadan **ictimai olaraq** dərc
  edə bilərsiniz (yalnız hash-lər ictimaidir).
- İfşaçı olaraq ictimai olaraq tanınma risklərini ölçmüsünüz
  (imzalama-principal sahəsi). Anonim olsanız, bütün əlaqəli
  nəşrlərdə təxəllüsü ardıcıl olaraq istifadə edin.
- Yurisdiksiyanızda ifşaçı qoruma qanunu haqqında vəkillə
  məsləhətləşmisiniz.

## Bu kiti nə vaxt istifadə ETMƏMƏK lazımdır

Aşağıdakı hallarda bu kiti istifadə ETMƏYİN:

- Sənədlərin özü üçüncü tərəflər (xəstələr, müştərilər, işçilər)
  haqqında ictimai-hashlənə bilməyəcək şəxsi məlumatlar ehtiva edir.
  Redaktə edilmiş versiyanı hash edin, orijinalı deyil.
- Manifestin dərc edilməsi özlüyündə ifşaçını razılaşmadığı şəkildə
  tanıyacaq.
- Hələ bir vəkillə məsləhətləşməmisiniz. Protokol bir alətdir;
  ifşaçı qoruma qanunu yurisdiksiya-spesifikdir və protokoldan
  kənarda yaşayır.
- Hər hansı bir iddianı sonra geri çəkmək istəyə bilərsiniz. Möhür
  qalıcıdır; yeni möhürlənmiş düzəlişlər redaktə etməyin yeganə
  dürüst yoludur.
- Bunu məcburiyyət və ya vaxt təzyiqi altında edirsiniz. Protokol
  məcburiyyəti gücləndirir; rədd qapısı (myriam-kit `SPEC §8`)
  ifşaçılara da, naşirlərə də tətbiq olunur.

## Bu kiti real bir açıqlama üçün necə fork etmək

```bash
# 1. Bu nümunəni yeni bir qovluğa kopyalayın
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Bədii məzmunu silin; real faktlarınızla əvəz edin.
# facts/ altındakı hər bir fayl bir faktdır. Hər birini oxuyun və əvəz edin.
$EDITOR facts/01_example_notice.txt   # real bir təqdimat bəyanatına dəyişin
$EDITOR facts/02_provenance.txt       # dəlillərinizin real mənşəyi
$EDITOR facts/03_evidence_manifest.txt # real sənədlərinizi hash edin və sadalayın
$EDITOR facts/04_allegation_summary.txt # real iddianız
$EDITOR facts/05_threat_model.txt     # real gözlənilən cavablarınız
$EDITOR facts/06_recipient_protocol.txt # alıcınız üçün uyğunlaşdırın
$EDITOR facts/07_no_retraction_commitment.txt # geri-çəkilməmə bəyanatınız
$EDITOR facts/08_signing_principal.txt # real imzalama şəxsiyyətiniz (və ya təxəllüs)

# 3. Real faktları əks etdirmək üçün site/index.html-i yeniləyin.
# seal.sh skripti HTML-i avtomatik populyatlaşdırmır; əl ilə redaktə
# insan-baxış addımıdır.
$EDITOR site/index.html

# 4. Möhürləyin.
bash build/seal.sh
# Çıxış: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Yerli olaraq yoxlayın.
python3 build/verify.py

# 6. Manifestı (sənədləri DEYİL) aşağıdakılardan birinə nəşr edin:
#    - Sizin tərəfdən idarə olunan statik host (Cloudflare Pages, GitHub Pages və s.)
#    - Çap edilmiş CID-də IPFS şəbəkəsi
#    - Hər ikisi (tövsiyə olunur)

# 7. Ayrıca, əsas sənədləri alıcıya seçdiyiniz təhlükəsiz kanal vasitəsilə
#    ötürün (Signal, SecureDrop və s.). Alıcı fayl hash-lərini manifestinizə
#    qarşı yoxlayır.
```

## Real dəlil faylları üçün hash-lərin hesablanması

SHA-256 ilə sənəd faylını hash etmək üçün:

```bash
shasum -a 256 my_document.pdf
```

İlk 64 hex simvol SHA-256-dır. Bunu manifestə qoyun.

Bir dəfədə bir çox faylı hash edə bilərsiniz:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Bu sizə `facts/03_evidence_manifest.txt` üçün məlumatlar verir.

## Əməliyyat təhlükəsizliyi qeydləri

MYRIAM protokolu əməliyyat təhlükəsizliyi TƏMİN ETMİR. O, *sübut
davamlılığını* təmin edir. Hələ də sizə lazımdır:

- Vəkilinizə təhlükəsiz əlaqə kanalı ([Signal](https://signal.org/),
  şəxsən və ya vəkilinizin yaradılmış təhlükəsiz kanalı)
- Əsas sənədlər üçün təhlükəsiz saxlama yeri (işəgötürəninizin
  giriş edə biləcəyi bulud xidmətlərində deyil, istirahət zamanı
  şifrələnmiş)
- Möhürləmə üçün təmiz cihaz (işəgötürən hesabları ilə əlaqəli
  olmayan şəxsi notebook; tercihen yalnız bu məqsəd üçün istifadə
  edilən biri)
- Nəşr üçün təmiz şəbəkə (işəgötürəninizin şəbəkəsi deyil,
  işəgötürən ISP-nizi çağıra bilərsə, ev IP-niz deyil)

İfşaçılar üçün əməliyyat təhlükəsizliyi haqqında tövsiyə olunan oxu:

- [The Intercept-in SecureDrop sənədləri](https://securedrop.org/)
- [Freedom of the Press Foundation resursları](https://freedom.press/)
- [EFF-in nəzarət öz-müdafiəsi bələdçisi](https://ssd.eff.org/)

Möhürləmə prosesinə başlamazdan ƏVVƏL bunlarla məsləhətləşin. Protokol
protokol başlamazdan əvvəl edilən pis opsec seçimlərinə qarşı qoruma
təmin etmir.

## Alıcıların bilməsi lazımdır

Alıcılara bu README-i möhürlənmiş manifestlə birlikdə göndərin. Manifest
özü alıcı protokolunu ehtiva edir (FACT 06), lakin README alıcı rolunu
genişləndirir:

- **Jurnalistlər**: əvvəlcə manifestin öz bütövlüyünü yoxlayın. Sonra
  ayrı təhlükəsiz kanal vasitəsilə sənədləri istəyin. Nəşrdən əvvəl
  hər sənədin SHA-256-nın manifestə uyğun olduğunu yoxlayın.
  Sənədləri ifşaçının razılığı olmadan dərc ETMƏYİN; möhürlənmiş
  manifestin mövcudluğunu və yoxlama nəticənizi dərc edin.
- **Tənzimləyicilər**: eyni yoxlama prosesi. Möhürlənmiş manifest
  plus uyğun sənədlər rəsmi pahpanma-zəncir kolleksiyasından kənarda
  mövcud olan ən güclü sübut formasıdır.
- **Vəkillər**: möhürlənmiş manifest sənədlərin iddia edilən vaxtda
  mövcudluğu üçün forensik ankerleme təmin edir. Hər hansı xüsusi
  yurisdiksiyanın sübut-qaydalarını qarşılayıb-qarşılamadığı sizin
  müəyyən etməyiniz üçündür.

## Bu kit nə DEYİL

- Hüquq müşavirinin əvəzedicisi deyil.
- Hər kəsin açıqlamanıza əməl edəcəyinin zəmanəti deyil.
- Qisasa qarşı qoruma deyil.
- Sənədlərin məzmununun (yalnız möhürləmə anındakı baytlarının)
  təsdiqlənməsi deyil.
- Hər kəslə anonim əlaqə qurmaq üçün bir yol deyil — möhür
  ictimaidir; imzalama-principal adınız real olsa, tanındınız.

## Bağlanış

Möhürlənmiş manifest kiçik bir şeydir. O, daha böyük bayt axınları
toplusunun xüsusi bir formada xüsusi bir vaxtda mövcud olduğunu sübut
edən bir bayt axınıdır. Bu kiçiklik onun gücüdür: o, yalnız bir iş
görür və bu bir işi Bitcoin blokçeyninin ömrü boyu görür.

İfşaçı olmağı düşündüyünüz üçün bunu oxuyursunuzsa, xahiş edirəm:
əvvəlcə bir vəkillə danışın. Yuxarıdakı əməliyyat təhlükəsizliyi
bələdçilərini istifadə edin. Sonra, və yalnız bütün bu yuxarı axın
nəzərə alınmaları qaydada olarsa, bu kiti açıqlamanızın kriptoqrafik
onurğası olaraq nəzərdən keçirin. Kripto asan hissədir. Kriptodan
yuxarı hər şey real riskin yaşadığı yerdir.

## Lisenziya

İctimai mülkiyyət (CC0). Fork edin. Təkmilləşdirin. İcazə istəmədən
istifadə edin.
