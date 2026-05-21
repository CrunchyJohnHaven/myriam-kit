*Azərbaycan tərcüməsi — ingilis dilindəki orijinal versiya üçün, [SPEC.md](SPEC.md)-ə baxın*

# MYRIAM-kit Protokol Spesifikasiyası

## 0. Məqsəd

Bu sənəd, kiçik bir mətn faktları dəstini istənilən tək hostinq provayderinin silinməsindən sağ çıxan, saxtakarlığa qarşı sübutlu və kriptoqrafik olaraq yoxlanıla bilən formada dərc etmək üçün minimal bir protokolu spesifikasiya edir.

Bu, ilk dəfə [disclosure.host](https://disclosure.host) saytında "MYRIAM v1" adı altında yerləşdirilmiş protokolun ümumiləşdirilmiş halıdır.

## 1. Məqsəd olmayanlar

- Sirlərin saxlanması. Hər şey konstruksiya etibarilə ictimaidir.
- Böyük məlumat dəstləri. Təxminən 20 faktdan sonra, protokol səhv formadadır.
- Real-vaxt dərcetmə. Hər dərc ayrı möhürləmə hadisəsidir.
- Geri çağırış. Protokol versiya səviyyəsində yalnız əlavə edilə biləndir.

## 2. Fakt modeli

Bir FAKT, aşağıdakı xüsusiyyətlərə malik UTF-8 mətn faylıdır:

- Fayl adı şablonu: `NN_short_name.txt`, burada NN 01-dən başlayan sıfırla doldurulmuş iki rəqəmli indeksdir.
- Kanonik forma: yazıldığı kimi baytlar, normallaşdırma yoxdur.
- Hər-fakt heşi: `SHA-256(file_bytes)`-in kiçik hərflərlə altılıq forması.

Fakt DƏSTİ, `facts/` altında şablona uyğun gələn bütün faylların leksikoqrafik olaraq çeşidlənmiş sıralı siyahısıdır.

Məhdudiyyət: hər fakt gövdəsi SHOULD konkret bir tərəfə aid edilə bilən *adlandırma hadisəsi* və ya *bəyanat hadisəsi* kimi ifadə edilməlidir. Ontoloji iddialar ("ay daşdandır") yoxlanılabilirlik qapısını zəiflədir; yalnız dərcetmə hadisəsi yoxlanıla biləndir, iddia özü deyil. "X Y dediyini bəyan edib" düzgün formadır. "Y doğrudur" düzgün deyil.

## 3. Merkle kökü

Bitcoin üslubunda, yerləşdirilmiş MYRIAM protokolunun v0-ında olduğu kimi:

1. Yarpaqlar: fakt-dəsti sırasında hər-fakt SHA-256 heşləri.
2. Səviyyədə tək sayda node varsa, sonuncu node-u təkrarlayın.
3. Bitişik node-ları cüt-heşləyin: `parent = SHA-256(left_bytes || right_bytes)`, burada `left_bytes` və `right_bytes` xam 32-baytlıq heş dəyərləridir (onların altılıq təsvirləri deyil).
4. Bir node qalana qədər təkrar edin. Bu Merkle köküdür.

Kök kiçik hərflərlə altılıq formada, sonunda sətir sonu olmadan dərc edilir.

### 3.1 Test vektorları

| Vektor | Yarpaqlar (heşlənmiş UTF-8 baytlar) | Gözlənilən kök (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Hər hansı uyğun tətbiq MUST bu vektorları yenidən istehsal etməlidir. Onlar faktiki `lib/build.py`-dən əldə edilmişdir və həmin skriptlə yenidən yaradıla bilər.

## 4. Bitcoin öhdəliyi

Merkle kökü [OpenTimestamps](https://opentimestamps.org) vasitəsilə Bitcoin blokçeyninə təqdim edilir. Defolt siyasət:

> Müstəqil inzibati idarə altında olan ən azı iki təqvim operatorunda möhürləyin.

Bu siyasətə cavab verən qəbz, `ots verify <receipt>.ots` icra edə bilən və hər hansı təqvimin yüksəltmə yolu ilə əlaqə qura bilən istənilən tərəf tərəfindən yoxlanıla bilər.

`lib/seal.sh`-də göndərilən defolt operator cütü:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Tətbiqlər MAY fərqli operatorlardan istifadə edə bilər. Şahid-müxtəlifliyi siyasəti (≥2 müstəqil operator) normativdir; konkret operatorlar normativ deyil.

## 5. Məzmun-ünvanlanmış güzgüləmə

Dərc edilmiş səhifəni və fakt fayllarını saxlayan `site/` qovluğu SHOULD IPFS-ə əlavə edilməlidir:

```
ipfs add -r --cid-version=1 -Q site/
```

Yaranan CIDv1 (dag-pb codec) dərcin məzmun ünvanıdır. O, `site/` baytlarından deterministikdir. `site/` altındakı istənilən fayla edilən hər hansı dəyişiklik fərqli CID istehsal edir.

Naşirin yerli node-undan əlavə xidmətlərə pin etmək davamlılıq üçün şiddətlə tövsiyə olunur; bu spesifikasiya konkret xidmətlərə mandat vermir.

## 6. Versiyalaşdırma

Protokol **versiya səviyyəsində yalnız əlavə edilə biləndir**. Hər dəyişiklik yeni möhürlənmiş versiya tələb edir:

- Yeni (və ya dəyişdirilməmiş) spesifikasiya revizionu
- Yeni fakt dəsti, MAY əvvəlki versiyalardan dəyişdirilməmiş faktları irsən ala bilər
- Yeni Merkle kökü
- Yeni OpenTimestamps qəbzi
- Yeni IPFS CID

Bütün əvvəlki versiyalar versiyalı URL-lərdə dərc edilmiş qalır. v(N) faktına edilən hər hansı dəyişiklik v(N+1) tələb edir, hər iki versiya görünər və yenidən-yoxlanıla bilən olur.

## 7. Yoxlama

İstənilən üçüncü tərəf dərcin bütövlüyünü aşağıdakı yollarla yoxlaya bilər:

1. Fakt fayllarını yükləmək və hər-fakt SHA-256 heşlərini yenidən hesablamaq.
2. §3-ə görə Merkle kökünü yenidən hesablamaq və dərc edilmiş köklə müqayisə etmək.
3. OpenTimestamps qəbzini Bitcoin blokçeyninə qarşı ən azı bir təqvimin tam təsdiqi üçün yoxlamaq.
4. `ipfs add -r --cid-version=1` vasitəsilə müstəqil olaraq IPFS CID-i yenidən hesablamaq və dərc edilmiş CID ilə müqayisə etmək.

`lib/verify.py`, Python stdlib və `ots` müştərisi xaricində xarici asılılıq olmadan 1-3 addımları yerinə yetirir. 4-cü addım `ipfs` müştərisi tələb edir.

## 8. İmtina qapısı

Dərc MUST NOT belə bir fakt daxil etməməlidir:

- Adının çəkilməsinə razılıq verməmiş özəl üçüncü tərəfi tanıdır.
- Bir hipotezi təsdiq kimi təqdim edir.
- Yoxlanıla bilən adlandırma/bəyanat hadisəsinə və ya kriptoqrafik artefakta endirilə bilmir.
- Dərcdən sonra qarşısı alına bilən ölümlərdə əsaslı gözlənilən artımı var.

Dördüncü qayda yük daşıyan olanıdır. O naşir tərəfindən insan baxışı addımında tətbiq edilir. İmtina qapısının protokol səviyyəsində tətbiqi yoxdur; protokol ona verilən hər hansı baytları dərc edir. Qapıya görə naşir məsuldur.

## 9. Limitlərin dürüst bəyanı

- **Aşkarlanma, mümkünsüzlük deyil.** Protokol saxtakarlığı aşkarlanan edir, mümkünsüz yox. Qətiyyətli bir hücumçu hələ də fərqli bir dərc əvəz edə və bəzi oxucuları bunun orijinal olduğuna inandıra bilər. Protokolun dəyəri ondadır ki, əvəzetmə yoxlamanı icra edən hər kəs üçün kriptoqrafik olaraq nümayiş etdirilə bilən olur.
- **Yalanı dərc etməyə qarşı müdafiə yoxdur.** Əgər naşir "X baş verdi" deyən bir faktı möhürləyirsə və X baş verməyibsə, protokol həmin saxta iddianı doğru iddiaları möhürlədiyi eyni dəqiqliklə möhürləyir. Protokol *dərc edilənə* təsdiq verir, *doğru olana* yox.
- **Tək-tərəfli imzalama.** Yerləşdirilmiş MYRIAM-ın v1-i tək imzalama prinsipalından istifadə edir. Çox-tərəfli imzalama gələcək işidir.
- **Pinləmə davamlılığı.** Yalnız naşirin node-unda IPFS pinləməsi "noutbukum işləyərkən + fürsətçi gateway keşləməsi ilə əlçatandır" təmin edir. Uzunmüddətli davamlılıq müstəqil xidmətlərdə artıq pinlər tələb edir.

Bu limitlər burada qeyd olunur ki, heç bir oxucu protokolun verdiyindən artığını verdiyini güman etməsin.
