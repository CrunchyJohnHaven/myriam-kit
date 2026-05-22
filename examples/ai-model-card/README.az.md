*Azərbaycan tərcüməsi — ingilis dilindəki orijinal versiya üçün, [README.md](README.md)-ə baxın*

# Süni İntellekt Model Davranış Kilidləmə Dəsti

Model buraxan (kommersiya və ya açıq mənbə) Sİ laboratoriyaları üçün turnkey myriam-kit nümunəsi, buraxılışın iddialarını — çəkilərin kimliyi, imkanlar, qiymətləndirmə xalları, təhlükəsizlik baxışı, yerləşdirmə öncəsi öhdəliklər — **kriptoqrafik olaraq qoruyub ictimai olaraq yoxlanıla bilən** etmək üçün.

Dəst, yerləşdirilmiş modellərin səssizcə dəyişməsi, qiymətləndirmə xallarının geri çevrilməsi və ya yerləşdirmə öncəsi iddiaların illər sonra "biz heç bunu deməmişik" deyə mübahisəyə salınması kimi xüsusi nasazlıq rejimindən qoruyur.

## Bu dəst nə istehsal edir

Bir model buraxılışı üçün aşağıdakıları ehtiva edən kriptoqrafik olaraq möhürlənmiş manifest:

1. Model identifikasiyası (ad, arxitektura, parametr sayı, lisenziya)
2. **Çəkilər faylının SHA-256-sı** — kanonik artefakt hash-i
3. Model kartının mətni (imkanlar, nəzərdə tutulan istifadə, sahə xaricində istifadə, məlum nasazlıq rejimləri)
4. Buraxılış zamanı qiymətləndirmə nəticələri (qabiliyyət qiymətləndirmələri, təhlükəsizlik qiymətləndirmələri, kalibrləmə)
5. Yerləşdirmə öncəsi öhdəliklər (buraxılışdan sonra səssizcə dəyişdirməyəcəyiniz şeylər)
6. İmzalayan əsas (məsuliyyəti üzərinə götürən insan + təşkilat)

Möhür hər birini bayt-sabit, OpenTimestamps vasitəsilə Bitcoin-ə vaxt-bağlanmış və hər hansı bir hosting tərəfdən asılı olmadan IPFS vasitəsilə əldə edilə bilən edir.

İşlənmiş uydurma nümunəyə baxın: [facts/](facts/) və göstərilmiş [site/index.html](site/index.html). Nümunə uydurma bir model ("Calm-mini-v0") istifadə edir; əsl buraxılış nümunə məzmununu əvəz edər.

## Bu dəst nədən qoruyur

**Möhürün birbaşa tutduğu nasazlıq rejimləri:**

- **Çəki manipulyasiyası** — buraxılan çəkilər faylının SHA-256-sı FACT 03-dədir. İstifadəçinin yüklədiyi baytların buraxılışdan sonra hər hansı dəyişikliyi yenidən hash-ləmə ilə aşkar edilir.
- **Səssiz qiymətləndirmə geri-yazımları** — buraxılış zamanı qiymətləndirmə xalları FACT 05-dədir. Gələcəkdə "qiymətləndirmə xalı həmişə X idi" mübahisələri üçün ictimai lövbər var.
- **Qabiliyyət iddiası sürüşməsi** — FACT 04-də olan model kartı mətni bayt-sabitdir. Gələcəkdə "biz X qabiliyyətini heç iddia etməmişik" mübahisələri möhürlənmiş mətnə qarşı ictimai olaraq yoxlanıla bilər.
- **Səssiz incə-tənzimləmə yenidən paylanması** — FACT 06-da yerləşdirmə öncəsi öhdəlik #1 (işlənmiş nümunədə) "eyni ad altında səssiz incə-tənzimləmə yoxdur"-dur. Aşkarlama: hər hansı yeni çəki hash-i yeni model adı və yeni möhürlənmiş nəşr deməkdir, yoxsa öhdəlik pozulub.
- **Gizli nasazlıq rejimləri** — FACT 04 məlum-nasazlıq-rejimləri siyahısına öhdəlik götürür. Siyahı monotondur (donmuş yoxlama nöqtəsi üçün böyüyə bilər, kiçilə bilməz). Laboratoriyanın daxili olaraq bildiyi lakin nəşr etmədiyi nasazlıq rejimlərinin gələcək kəşfləri mübahisəli sübuta çevrilir.

**Əhatə olunmayan nasazlıq rejimləri:**

- Modellərin aşağı axın istifadəçilər tərəfindən sui-istifadə edilməsi (möhür nəyin buraxıldığını sübut edir, istifadəçilərin onunla nə etdiyini deyil).
- Üçüncü tərəflər tərəfindən düşmən incə-tənzimləmə (üçüncü tərəf incə-tənzimləməsi fərqli çəki hash-i istehsal edir, ona görə də orijinal möhür təsirsiz qalır, lakin üçüncü tərəfin modeli möhürün qorunmasından kənardadır).
- Yerləşdirmə-mühitinin dəyişməsindən qaynaqlanan davranış dəyişiklikləri (fərqli sistem promptları, RAG konfiqurasiyaları və s.).
- Laboratoriyanın buraxılış zamanı həqiqətən bilmədiyi nasazlıqlar. Möhür laboratoriyaya *bildiklərinə* öhdəlik götürdür; bilmədiklərini lövbərləyə bilməz.

## Bu dəsti nə vaxt istifadə etməli

Aşağıdakı hallarda model kartını möhürləməyi nəzərdən keçirməlisiniz:

- Siz model çəkilərini ictimai olaraq buraxırsınız VƏ YA aşağı axın istifadəçilərin davranış sabitliyinə əhəmiyyət verdiyi kontekstdə model yerləşdirirsiniz.
- Buraxılış gələcəkdə "biz heç bunu deməmişik" mübahisələrinin ehtimal olunduğu qədər əhəmiyyətlidir (geniş miqyasda yerləşdirilmiş hər hansı model; təhlükəsizlik-kritik hər hansı model; qabiliyyət iddiaları ilə müşayiət olunan hər hansı buraxılış).
- Təşkilatınız gələcək hərəkətləri məhdudlaşdıran yerləşdirmə öncəsi öhdəliklər götürməyə hazırdır (bu, yükdaşıyan əsas məqamdır — növbəti hissəyə baxın).
- Buraxılış zamanı çəkilər faylının SHA-256-sını hesablaya bilərsiniz.

## Bu dəsti nə vaxt istifadə etməməli

Aşağıdakı hallarda bu dəsti İSTİFADƏ ETMƏYİN:

- Siz nümunənin FACT 06-da olan yerləşdirmə öncəsi öhdəliklərə bağlanmaq istəmirsinizsə. Möhür öhdəlikləri mexaniki olaraq aşkar edilə bilən edir; əgər siz o məsuliyyətə hazır deyilsinizsə, möhürləməyin.
- Çəkilər faylı tez-tez dəyişəcəksə (məsələn, davamlı incə-tənzimləmə pipeline-ları). Hər çəki dəyişikliyi yeni möhürlənmiş buraxılış tələb edir. Buraxılış başına möhürləmə ağırdır; bu dəst *donmuş* yoxlama nöqtələri üçündür.
- Hələ təhlükəsizlik baxışı keçirməmisiniz. Möhür təhlükəsizlik baxışının nəticələrinə öhdəlik götürür. Tam olmayan baxış möhürləsəniz, tam olmayan baxışın daimi ictimai qeydiniz olacaq.
- Hər hansı xüsusi qiymətləndirmə xalını sonradan geri çəkmək istəyə bilərsiniz. Möhür daimidir. Yeni möhürlənmiş nəşrlər əvəz edə bilər, lakin orijinalı geri qaytarmaq olmaz.

## Yükdaşıyan yerləşdirmə öncəsi öhdəliklər

Nümunənin FACT 06-sı nəşriyyatçını aşağıdakılara bağlayır:

1. **Eyni ad altında səssiz incə-tənzimləmə yoxdur.** Hər hansı incə-tənzimləmə yeni model adı, yeni möhürlənmiş nəşr, yeni çəki hash-i istehsal edir. Əvvəlki kanonik olaraq adlandırılmış versiya olaraq qalır.

2. **Səssiz qiymətləndirmə yeniləmələri yoxdur.** Yenidən-qiymətləndirmələr orijinala Merkle root vasitəsilə istinad edən yeni möhürlənmiş nəşrlər alır. Versiyalar izlənir, üzərinə yazılmır.

3. **Məlum nasazlıq rejimləri böyüyə bilər, heç vaxt kiçilməz.** Donmuş yoxlama nöqtəsində nasazlıq rejimləri düzəldilə bilməz. Ona görə nəşr olunan siyahı effektiv olaraq monotondur.

4. **Geri çəkilmənin idarə edilməsi.** Modeli paylaşmadan çıxarmağa məcbur edilərsə, laboratoriya geri çəkilmənin son möhürlənmiş bəyanatını nəşr etməyə öhdəlik götürür.

Bu dəsti qəbul edən laboratoriya bu öhdəliklərdən hansılarını həqiqətən yerinə yetirə biləcəyini qərara almalıdır. Əgər dördünü də yerinə yetirə bilmirsinizsə, möhürləmədən *əvvəl* yerinə yetirə biləcəklərinizi əks etdirmək üçün FACT 06-nı dəyişdirin və nəticədə zəifləyən qorumanı qəbul edin. Yerinə yetirmək niyyətində olmadığınız öhdəliklərə möhür vurmaq möhürləməməkdən pisdir.

## Əsl buraxılış üçün bu dəsti necə şaxələndirməli

```bash
# 1. Bu nümunəni buraxılış pipeline-ınıza kopyalayın
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Əsl buraxılışınız üçün hər faktı redaktə edin
$EDITOR facts/01_example_notice.txt   # SİLİN — sizin buraxılış nümunə deyil
                                       # Modeliniz üçün buraxılış bildirişi ilə əvəz edin
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # kanonik model kartı
$EDITOR facts/05_eval_results.txt     # əsl qiymətləndirmə nəticələri
$EDITOR facts/06_release_commitments.txt # yerinə yetirə biləcəyiniz öhdəliklər

# 3. Əsl buraxılışı əks etdirmək üçün site/index.html-i yeniləyin.

# 4. Möhürləyin.
bash build/seal.sh

# 5. Yerli olaraq yoxlayın.
python3 build/verify.py

# 6. Aşağıdakılara yerləşdirin:
#    - Buraxılış səhifəniz (model kartı və çəkilərin yanında)
#    - IPFS şəbəkəsi (seal.sh skripti artıq bunu edir)
#    - İstəyə bağlı: möhürlənmiş nəşrə
#      Hugging Face / GitHub buraxılış qeydlərindən link verin
```

## Mövcud buraxılış pipeline-ları ilə inteqrasiya

Dəst, mövcud alətləri əvəz etmək üçün deyil, onlarla bir yerdə işləmək üçün hazırlanıb:

- **Hugging Face**: möhürlənmiş nəşrin URL-i və ya IPFS CID-i model kartının README.md-sinə daxil edin. Oxucuları bayt-sabit buraxılış iddiaları üçün möhürə yönəldin.
- **GitHub buraxılışları**: OpenTimestamps qəbzini (`merkle_root.txt.ots`) buraxılış aktivi kimi daxil edin. Gələcəkdə "buraxılış dəyişdirildi" mübahisələri Bitcoin-ə bağlanır.
- **Model kartı standartları (Mitchell et al. 2019)**: dəst uyğundur. Standart model kartı sahələri möhürün FACTS 02–05-nə uyğunlaşır. Model kartını normal şəkildə istehsal edirsiniz və əlavə olaraq möhürləyirsiniz.
- **Qiymətləndirmə qoşqu-ları (lm-evaluation-harness, BIG-bench və s.)**: dəqiq qoşqunun commit-ini və xam çıxış JSON-unu hash-ləyin; FACT 05-də o hash-lərə istinad edin. Gələcək yenidən-icralar müstəqil olaraq təkrarlana bilər.

## Çəkilər hash-ini hesablamaq

Tək safetensors faylı üçün:

```bash
shasum -a 256 model.safetensors
```

Çox-fayllı yoxlama nöqtələri üçün (GGUF parçaları, parçalanmış safetensors):

```bash
# Hash-ləri sıralanmış qaydada birləşdirin, sonra yenidən hash-ləyin
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Son hash FACT 03-ə daxil olunur. İstifadəçilərin tək-tək parçaları yüklədikcə yoxlaya bilməsi üçün həm parça başına hash-ləri, həm də son aqreqat hash-i daxil edin.

## Alıcılar (modelinizin istifadəçiləri) nə bilməlidir

MYRIAM-möhürlənmiş nəşri olan model buraxılışı istifadəçiyə imkan verir:

1. **Yüklədikləri çəkiləri yoxlamaq** yenidən hash-ləyib FACT 03 ilə müqayisə etməklə.
2. **Model kartının geri yazılmadığını yoxlamaq** möhürlənmiş FACT 04-ü laboratoriyanın hazırkı nəşr olunmuş versiyası ilə yoxlamaqla.
3. **Qiymətləndirmə xallarının buraxılış zamanı olanlar olduğunu yoxlamaq** laboratoriyanın hazırkı qiymətləndirmə iddialarını möhürlənmiş FACT 05 ilə müqayisə etməklə.
4. **Laboratoriyanı yerləşdirmə öncəsi öhdəliklərinə görə məsuliyyətli tutmaq** faktiki davranışı möhürlənmiş FACT 06 ilə yoxlamaqla.

Uyğunsuzluq tapan istifadəçinin uyğunsuzluğun kriptoqrafik sübutu var. Onlar həmin sübutu nəşr edə bilərlər; orijinal möhürlənmiş nəşr lövbərdir.

## Bu dəst NƏ DEYİL

- Təhlükəsizlik baxışını həqiqətən etməyin əvəzi deyil. Möhür təhlükəsizlik baxışının *qeydidir*, baxışın özü deyil.
- Əsl qiymətləndirmələrin əvəzi deyil. Möhür istehsal etdiyiniz xalları lövbərləyir; metodologiyanı təsdiq etmir.
- Modelin təhlükəsiz olduğuna zəmanət deyil. Möhür laboratoriyanın buraxılışda model haqqında nə iddia etdiyini sənədləşdirir; bu iddiaları sertifikatlaşdırmır.
- Aşağı axın istifadəçilər tərəfindən model sui-istifadəsindən qorunma deyil.

## Düşmən incə-tənzimləmə haqqında qeyd

Ümumi Sİ-təhlükəsizlik narahatlığı: kimsə modelinizi incə-tənzimləyir və təhlükəsizlik davranışlarını silir və onu yenidən paylayır. Möhür bunun qarşısını ALA BİLMƏZ. Möhürün edə biləcəyi:

- *Orijinal* modelin nə etməli olduğunu lövbərləmək (FACT 04).
- Orijinal qiymətləndirmə xallarının nə olduğunu lövbərləmək (FACT 05).
- Düşmən incə-tənzimləmələrin ölçülə biləcəyi istinad nöqtəsi təmin etmək.

Üçüncü tərəf yenidən paylanması ilə qarşılaşan istifadəçi çəkilərin orijinal möhürlənmiş hash-ə uyğun olub-olmadığını yoxlaya bilər. Əgər uyğun deyilsə, istifadəçi orijinal olmayan modelə sahib olduğunu və laboratoriyaya aid edilən hər hansı təhlükəsizlik iddialarının tətbiq olunmadığını bilir.

## Yekun

Model buraxılışını möhürləmək laboratoriya üçün kiçik əlavə işdir: hash-ləri hesablamaq və möhür skriptini icra etmək üçün ~10 dəqiqə, sonra hansı yerləşdirmə öncəsi öhdəlikləri daxil edəcəyiniz haqqında 30-saniyəlik qərar. Əlavə etdiyi məsuliyyət asimmetrikdir: dürüst laboratoriyalara kiçik xərc, başqa cür iddialarını səssizcə sürüşdürəcək laboratoriyalara böyük məhdudiyyət.

Əgər siz qəbul etməyi düşünən bir Sİ laboratoriyasınızsa, dəst ictimai mülkdür (CC0). Şaxələndirin. Dəyişdirin. Yükdaşıyan parça riyaziyyatdır, xüsusi tətbiq deyil.

## Lisenziya

İctimai mülk (CC0). Atribut tələb olunmur.
