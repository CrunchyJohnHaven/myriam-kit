# Məhkəmə dəlili saxlama-zəncir möhürü dəsti

*Azərbaycan tərcüməsi — ingilis dilindəki orijinal versiya üçün, [README.md](README.md)-ə baxın*

Forensik əldə etmə komandaları üçün — kompüter forensika ekspertləri,
mobil-cihaz çıxarma texnikləri, body-cam dəlil saxlayıcıları, laboratoriya
nəzarətçiləri — rəqəmsal dəlil əldə etmə anında *hansı baytların əldə
edildiyini* və *nə vaxt* Bitcoin-bağlı, dəyişdirilməsi aşkarlana bilən
möhürlə dərc etmək istəyənlər üçün açar təslim myriam-kit nümunəsi, belə
ki, saxlama-zəncir mübahisələri ictimai bir ankerə malik olsun.

---

## Bu kitin ETMƏDİYİ şeylər (əvvəlcə oxuyun)

Möhür HANSI FORENSIK GÖRÜNTÜLƏRİN əldə edildiyinin, NƏ VAXT əldə
edildiyinin, HANSI AGENTLIK tərəfindən, HANSI ORDER altında və HANSI
METODOLOGİYA vasitəsilə əldə edildiyinin kriptoqrafik vaxt damgasıdır.
O, işin bundan kənar hər hansı bir suala cavab verə bilməz. Aşağıdakılar
**möhürün sahəsindən kənardır**:

1. **Federal Sübut Qaydaları (və ya hər hansı digər sübut kodu) altında
   qəbul edilməsi.** Möhür baytları və vaxt damgalarını anker edir.
   Dəlilin qəbul edilib-edilməməsi — FRE 901 təsdiqi, FRE 702 ekspert
   ifadəsi / Daubert, FRE 403 zərər balansı və ya hər hansı dövlət-
   məhkəmə ekvivalenti altında — hüquqi-prosedura sualıdır. Mükəmməl
   möhürlənmiş əldə etmə hələ də qəbuledilməz hesab edilə bilər;
   möhürsüz əldə etmə hələ də qəbul edilə bilər. Möhür məhkəmənin
   qəbul edilməsi qərarının əvəzedicisi deyil, bütövlüyün əlavə
   dəlilidir.

2. **Müsadirənin qanuni olub-olmadığı.** Dördüncü Düzəlişə uyğunluq,
   orderin etibarlılığı, əhatə dairəsinə riayət, istisna qaydasının
   tətbiqi — bunların hamısı möhürün yuxarısındadır. Möhür əldə
   etmənin FICT-SW-2026-0188 nömrəli order altında baş verdiyini
   qeyd edir; orderin qanuni şəkildə verilib-verilmədiyi və qanuni
   şəkildə icra edilib-edilmədiyi məhkəmənin işidir.

3. **Dəlilin günahlandırıcı, bəraətverici və ya neytral olub-olmadığı.**
   Möhür hash-ları anker edir; o hash-ların nə ehtiva etdiyinin
   şərhləri öz aşkar olunma və sübutverici rejimi olan forensik
   müayinə hesabatında məxsusdur. Möhür "FACT N: şübhəlinin notebooku
   günahlandırıcı material ehtiva edir" möhürləməkdən imtina edəcək —
   rədd-qaydası R4-ə baxın.

4. **Saxlama-zənciri tətbiq olunan dövlətin dəlil qanunu altında
   prosedural olaraq düzgün olub-olmadığı.** Möhür agentliyin eyni
   vaxtda baş verən saxlama-tədbir loqunu qeyd edir (FACT 05). O
   loqun konkret bir dövlətin saxlama-zənciri tələblərini ödəyib-
   ödəmədiyi sübut dinləməsində məhkəmənin işidir.

5. **Forensik metodologiyanın etibarlı olub-olmadığı.** Daubert və
   onun davamçıları (və Frye kimi dövlət-səviyyəli analoqları, harada
   ki, hələ də tətbiq olunur) metodoloji etibarlılığı qiymətləndirir.
   Möhür HANSI alətlərin və versiyaların istifadə edildiyini qeyd
   edir (FACT 04); o alətlərin hər hansı bir məhkəmənin etibarlılıq
   standartını ödəyib-ödəmədiyi məhkəmənin işidir. Keçmiş işlərdə
   alət xətaları əldə etmədən sonra sənədləşdirilmişdir; möhürün rolu
   versiya-və-ikili-hash qeydini ictimai olaraq təkzib edilə bilən
   etməkdir, alətlərin özünə zəmanət vermək deyil.

6. **Dəlilin əldə etmədən ƏVVƏL təhrif edilib-edilmədiyi.** Möhür
   görüntü çəkmə anından irəli olaraq baytları anker edir. Şübhəli,
   bir polis əməkdaşı və ya üçüncü tərəf görüntü çəkilməzdən əvvəl
   mənbə cihazını dəyişdirsə, möhür bunu aşkar edə bilməz — o,
   dəyişdirilmiş baytları orijinalı möhürləyəcəyi eyni bütövlüklə
   möhürləyir. Möhürün dəyəri görüntü çəkmə vaxt damgasından başlayır.

7. **Order əhatə dairəsinin gözlənilib-gözlənilmədiyi.** Order rideri
   nəyin əldə edilə biləcəyini müəyyən edir; möhür nəyin əldə
   edildiyini qeyd edir. Əldə etmənin order əhatə dairəsini aşıb-
   aşmadığı, yenə də, müvafiq dövlət prosedurası altında öz öz
   müalicəsi olan hüquqi sualdır (sıxma motoru).

8. **İstintaqın hər hansı şəxsi tərəfinin yenidən-tanınması.** Möhür
   şübhəli, müttəhim, qurban, şahid və ya bina sakinini yenidən
   tanıya biləcək hər hansı bir ad, identifikator və ya barmaq izi
   dərc etməkdən imtina edir. İş protokolu istinadı dayanma hüququ
   olan tərəflərin işi tapması üçün uyğun istinad nöqtəsidir.

**Yuxarıdakı dürüst-məhdudiyyətlər bölməsi bu kitin yük-daşıyan
hissəsidir.** Möhürləmənin qəbul edilməyə bərabər olduğuna inanan
forensik komandalar onu qalxan kimi istifadə edəcəklər. Kit bunu
açıq şəkildə deməlidir: *bu, əldə etmə anı üçün non-repudiation
primitivdir, qanuni əldə etmə, metodoloji səslilik və ya məhkəmə
tərəfindən tanınan saxlama-zəncir sübutu deyil.*

---

## Bu kitin möhürləməyə MƏCBUR OLDUĞU şeylər

Kit, etibarlı imzalama səlahiyyəti olan istifadəçi onları təqdim etsə
belə, aşağıdakı fakt nümunələrini rədd etmək üçün konfiqurasiya
edilmişdir:

- **Şübhəli, müttəhim, qurban, şahid və ya hər hansı bir şəxsi
  üçüncü tərəfin şəxsi identifikasiyası.** İş protokolu istinadı
  dayanma hüququ olan tərəflər üçün istinaddır; ictimai möhür
  yenidən-tanıma indeksi olmamalıdır.
- **Forensik ekspertlərin və ya digər agentlik personalının
  ictimai möhürdə şəxsi adları.** Rollar ictimaidir; şəxs-rol
  bağları ayrıca möhürlənir və məhkəmə prosesi altında aşkar
  olunur.
- **Şübhəli uşaq cinsi istismarı materialının, biometrik şablonların
  və ya hər hansı zəif-şəxsi yenidən-tanıyan məlumatların fayl-
  səviyyəli hash-ları (və ya barmaq izləri) — hətta hash ilə
  belə.** Fərdi faylın SHA-256-sı daimi axtarıla bilən
  identifikatordur; onu ictimai bir kitabda dərc etmək, şəxsi
  verilənlər bazaları ilə korrelyasiya yolu ilə subyektləri
  yenidən qurban edə bilər. Tam disklərin görüntü-səviyyəli (forensik
  görüntü-səviyyəli) hash-ları məqbuldur; bu cür materialın fayl-
  səviyyəli hash-ları HEÇ VAXT məqbul deyil.
- **Müayinə tapıntıları, şərhləri, fikirləri və ya baytların nə
  demək olduğu barədə nəticələr.** Möhür HANSI BAYTLARIN əldə
  edildiyini və NƏ VAXT əldə edildiyini anker edir. Şərh
  aşkarlana bilən müayinə hesabatına aiddir, dəyişdirilməsi
  aşkarlana bilən ictimai kitaba deyil.
- **Qəbul edilməsi və ya hər hansı digər hüquqi nəticə iddiaları**
  ("bu dəlil qəbul edilə biləndir", "order qanuni idi", "saxlama-
  zənciri §X.Y altında uyğun idi"). Hüquqi nəticələr məhkəmə
  funksiyalarıdır.
- **Əldə edən agentliyin səlahiyyətli principalından başqa hər
  kəs tərəfindən möhürləmə.** Müdafiə eksperti manifestin müstəqil
  yoxlamasını öz adından möhürləmək üçün kiti istifadə edə bilər;
  onlar əldə edən agentliyin adı altında ORİJİNAL əldə etməni
  möhürləyə bilməzlər.
- **İctimai möhürdə rol-fərd bağları.** Bağlar ayrı yardımçı
  qeyddə (FACT 05-də hashlanmış) agentlik girişi nəzarəti altında
  möhürlənir.
- **Müsadirə öncəsi və ya order öncəsi araşdırma faktları.**
  İnformator ifadələri, order öncəsi müşahidə, paralel-quruluş
  girişləri — bunların heç biri əldə etmə möhürünə aid deyil.
  Möhür əldə etmə hadisəsinə əhatə olunur.

Rədd özlüyündə bir fakt olaraq möhürlənə bilər ("Bu agentlik X-in
möhürlənməsini istədi; kit rədd-qaydası Y görə imtina etdi"),
sui-istifadə cəhdlərinin ictimai qeydini yaradaraq.

---

## Bu kitin möhürlədiyi şeylər

Əldə etmə anında 8 fakt:

1. **Nümunə bildirişi** — dərc edilməni bir nümunə kimi bəyan edir
   (real təsdiqlər bunu silir və ya əvəz edir).
2. **Əldə etmə konteksti** — iş identifikatoru, order sitatı, əldə
   edən agentlik, istəyən səlahiyyət, müsadirənin və əldə etmənin
   tarixi/saatı, əldə etmə yeri (müsadirə yeri binanın yenidən-
   tanınmasının qarşısını almaq üçün ayrıca-möhürlənmiş yardımçı
   qeydə redaktə edilir).
3. **Dəlil manifesti** — forensik görüntü maddəsi başına: SHA-256
   hash, fayl ölçüsü, mənbə-cihaz anonimləşdirilmiş identifikator,
   əldə etmə metodu, forensik görüntü formatı.
4. **Əldə etmə metodologiyası** — forensik alət adları və dəqiq
   versiyaları (alət-ikili hashları ilə), write-blocker marka/model
   və firmware, NIST CFTT yoxlama istinadı, istifadə olunan yoxlama
   proseduru, görüntü-format seçimi.
5. **Saxlama-zənciri loqu** — ilkin müsadirədən görüntü çəkmənin
   sonuna qədər tədbir başına vaxt cədvəli, saxlayıcılar ROL ilə
   tanınır (ad ilə deyil), ayrıca-möhürlənmiş yardımçı qeydlərin
   (rol-fərd bağı, daşıma GPS loqu, dəlil-kilid girişi loqu,
   dəyişdirmə-möhür şəkilləri və s.) hash-ları ilə.
6. **Ekspert qualifikasiyaları rola görə** — sahib olunan sertifikatlar,
   davam edən təhsil statusu, əvvəlki ekspert-şahid təcrübəsi sayı,
   Daubert məruzəsi, maraq-toqquşması açıqlamaları — hamısı rol-
   səviyyəli, şəxsi deyil.
7. **Yardımçı açıqlamalar və rədd qeydi** — paralel araşdırmalar,
   gözləyən order çağırışları, bastırılmış-dəlil hərəkətləri,
   imtiyaz-filtr / taint-komanda protokolu qüvvədə, əvvəlki əldə
   etmə cəhdləri, satıcı bug-tracker baxışı; kitin möhürləməkdən
   imtina etdiyi nümunələrin açıq siyahısı.
8. **İmzalama principal** — əldə edən agentlik identifikasiyası +
   rol-səviyyəli imzalayıcı (baş ekspert) + rol-səviyyəli ortaq-
   imzalayıcı (bölmə nəzarətçisi) + kriptoqrafik açar məlumatı.

Hər bir fakt rədd-qapısı konvensiyası ilə bitir: *"Bu fakt yalnız
X-i təsdiq edir. O Y-i təsdiq etmir"* (Y "ETMƏDİYİ" bölməsindən ən
yaxın uğursuzluq rejimidir).

---

## Bu kit nədən qoruyur

- **Forensik görüntünün post-əldə-etmə səssiz dəyişdirilməsi.** Hər
  hansı bir görüntüdə bayt-səviyyəli dəyişiklik fərqli SHA-256
  istehsal edir və post-dəyişiklik görüntüsü möhürlənmiş FACT 03
  manifestə qarşı yoxlanılmayacaq.
- **"Fərqli alətlər istifadə olundu" iddiası.** FACT 04 alət-ikili
  hashları ilə dəqiq alət versiyalarını qeyd edir; sonrakı "biz
  əslində v4.7.0 istifadə etdik, v4.7.1 deyil" iddiaları ictimai
  olaraq təkzib edilə bilər.
- **Write-blocker-in işlədilmədiyi və ya fərqli model istifadə
  edildiyi iddiası.** FACT 04 write-blocker manifestini dondurur.
- **Saxlama-loq dəyişikliyi.** FACT 05 saxlama-tədbir vaxt cədvəlinə
  hər hansı dəyişiklik (tədbir əlavə etmə, silmə və ya yenidən-
  vaxt damgalama) FACT 05 hashını dəyişdirir və ictimai olaraq
  aşkarlana bilər.
- **Fərqli ekspertin etimadnaməsinin əvəz edilməsi.** FACT 06 əldə
  etmə anında rol-səviyyəli etimadnamə profilini dondurur.
- **Yardımçı açıqlamaların seçici buraxılması.** FACT 07 gözlənilən
  açıqlama kateqoriyalarını sadalayır; boş kateqoriya açıq şəkildə
  təsdiqlənməlidir ("əldə etmə anında heç bir"), beləliklə sonrakı
  "biz bunun aktual olduğunu başa düşmədik" iddiası ictimai olaraq
  təkzib edilə bilər.
- **Eksperti açıqlanmamış maraq-toqquşmasına sahib olması haqqında
  post-əldə-etmə iddiaları.** FACT 06-nın maraq-toqquşması
  açıqlaması əldə etmə anında dondurulur; sonrakı çağırışlar
  ona qarşı sınanıla bilər.

Kit eyni vaxtda olan korrupsiyaya qarşı **qorumur** — əldə etmə
anında qəsdən saxta metaməlumatları möhürləyən komanda saxta
metaməlumatların kriptoqrafik olaraq etibarlı möhürünü istehsal
edir. Primitiv bu barədə dürüstdür: o, agentliyin eyni vaxtda
baş verən iddiaları üçün bir non-repudiation primitivdir, bu
iddiaların düzgün olduğunun sübutu deyil.

---

## Bu kitin kömək edə biləcəyi tarixi və ya yaxın tarixi işlər

Kit faydalı bir anker — *həll yox* — istehsal edərdi keçmiş işlərdə,
harada ki, rəqəmsal dəlil saxlama-zənciri mübahisəli bir sübutverici
məsələ oldu. Müttəhimləri (məhkum edildikdə belə şəxsi tərəflərdir)
adlandırmamaq üçün bunlar adı olan fərd ilə deyil, iş növü ilə
təsvir olunur:

- **2010-cu illərin ortalarında federal forensik-alət-xətası
  mübahisəsi**, harada ki, geniş istifadə olunan forensik görüntü
  çəkmə aləti, post-əldə-etmədən, müəyyən mənbə-media növünə təsir
  edən bir kənar-case xətasına sahib olduğu aşkar edildi. Dondurulmuş
  alət-versiya-və-ikili-hash məlumatları ilə möhürlənmiş əldə etmə
  manifesti müdafiə və ittihamın hansı versiyanın istifadə edildiyinə
  dair tam razılaşmasına icazə verərdi, mübahisənin bir oxunu aradan
  qaldırardı.

- **Mübahisəli mobil-cihaz çıxarma çıxışları olan birdən çox dövlət
  işi**, harada ki, çıxarma alətinin satıcısı sonradan bir xəta-
  düzəltmə yaması buraxdı və sual "xəta bu işə təsir etdimi" oldu.
  Möhürlənmiş metodologiya faktı sualın agentliyin hansı versiyanın
  istifadə edildiyinə dair hazırkı yaddaşına qarşı deyil, dondurulmuş
  versiyalama məlumatlarına qarşı cavablandırılmasına icazə verir.

- **Body-worn-camera ötürmə mübahisələri** işlərdə, harada ki, BWC
  satıcısının dock sistemi sonradan tranzit zamanı görüntülərin
  dəyişdirilməsinə icazə verdiyi iddia edildi. Body-cam arxivinin
  agentliyin alma anında möhürlənmiş manifesti agentliyin dock
  sistemindən aldığı baytları anker edir; agentlik tərəfindəki
  sonrakı redaktələr ictimai olaraq aşkarlana bilər.

- **Kompüter-forensika işlərində hash-toqquşması mübahisələri**,
  harada ki, müdafiə eksperti MD5-in (bəzi köhnə iş axınlarında
  hələ də istifadə olunan) yetərsiz olduğunu iddia etdi. Həm
  MD5-i, həm də SHA-256-nı qeyd edən möhürlənmiş əldə etmə MD5
  şübhə altına alınsa belə SHA-256-nın dayanmasına icazə verir.

- **Əldə etmə və məhkəmə arasında müayinə metodologiyasının
  inkişafı mübahisələri.** Bir iş əldə etmə və məhkəmə arasında
  illərlə oturduqda, əldə etmə zamanı standart olan metodologiya
  məhkəmə vaxtına qədər üstələnmiş ola bilər. Möhürlənmiş qeyd
  məhkəməyə metodologiyanı sonrakı standartla deyil, əldə etmə
  anında hazırkı standartla qarşı qiymətləndirməyə icazə verir.

Kit bu iş növlərinin heç birində günah və ya günahsızlıq haqqında
əsas mübahisələri həll ETMƏZDİ. O, bir xüsusi sübutverici alt-
mübahisəni həll edərdi: baytların, alətlərin və prosedurların
agentliyin onları iddia etdiyi vaxtda agentliyin iddia etdiyi
şey olub-olmadığı.

---

## Bu kiti nə vaxt istifadə etməli

- Sizin agentliyinizin sabit forensik SOP-u var və mövcud kağız-və-
  imza saxlama-zənciri üzərində dəyişdirilməsi aşkarlana bilən bir
  qat olaraq Bitcoin-bağlı ictimai təsdiq əlavə etmək istəyir.
- Bu işin forensik dəlilə əhəmiyyətli müdafiə çağırışını cəlb
  edəcəyini gözləyirsiniz (yüksək-mərclər iş, yeni metodologiya,
  mübahisəli alət versiyaları və s.).
- Siz PII və ya zəif-şəxsi yenidən-tanıyan məlumatları açıqlamadan
  sadalanan fakt dəstini dərc edə bilərsiniz. (Kitin rədd qaydaları
  bunu tətbiq edir; faktlarınız rədd-qaydası pozulması tələb edirsə,
  kiti istifadə etməyin.)
- Əldə edən agentliyin baş hüquq müşaviri və prokurorluq dərc
  planını nəzərdən keçirib. İş-identifikator daşıyan artefaktın
  ictimai dərci davam edən araşdırmalara təsir göstərir; məsləhət
  baxışı seçimli deyil.
- Sizin yurisdiksiyanızın müdafiə aşkarlama qaydaları agentliyin
  rol-fərd bağı qeydini ayrıca saxlamaqla uyğundur (FACT 05-də
  hashlanmış). Sizin yurisdiksiyanız ictimai ekspert-adı açıqlamasını
  tələb edirsə, kiti müvafiq şəkildə dəyişdirməlisiniz.

## Bu kiti nə vaxt istifadə ETMƏMƏLİ

- **Agentliyin mövcud saxlama-zənciri sənədləşdirməsinin əvəzedicisi
  olaraq istifadə etməyin.** Bu kit *əlavə*dir, əvəzedici deyil.
  Agentliyin CMS-i, saxlama loqu və aşkarlama istehsalı öhdəlikləri
  dəyişməz qalır.
- **Əldə etmə CSAM, biometrik şablonlar və ya digər zəif-şəxsi
  yenidən-tanıyan məlumatları fayl-səviyyəli daxildirsə, istifadə
  etməyin.** Tam disklərin görüntü-səviyyəli hash-ları məqbuldur;
  bu cür materialın fayl-səviyyəli hash-ları HEÇ VAXT məqbul deyil,
  hətta rədd-qaydası imtina altında belə. R3-ü pozmadan fakt dəsti
  qura bilmirsinizsə, kiti istifadə etməyin.
- **Orderin qanuni olduğunu, müsadirənin lazımi olduğunu və ya
  dəlilin qəbul edilə bilən olduğunu iddia etmək üçün istifadə
  etməyin** — kit bunu edə bilməz və rədd-qaydası R5 hər hansı
  belə iddianı rədd edəcək.
- **Əldə etmə tamamlanmadan əvvəl möhürləmə üçün təzyiq altında
  istifadə etməyin.** Qismən-əldə etmə möhürü vəziyyəti səhv
  təqdim edir.
- **Yurisdiksiyanız xüsusi olaraq tələb etmədikcə və ekspertləriniz
  fərdi olaraq razılaşmadıqca, ekspert şəxsi adlarını dərc etmək
  üçün istifadə etməyin.** Standart rol-səviyyəli dərc etmədir.
- **Açıq məhkəmə icazəsi olmadan möhürlənmiş və ya möhür altında
  işlərdə istifadə etməyin.** Bitcoin-də iş identifikatorunun
  dərc edilməsi geri dönülməzdir; iş sonradan möhürlənərsə,
  ictimai möhür geri çəkilə bilməz. Kit yalnız ictimai-qeyd
  əldə etmələri üçündür.
- **Qanunilik teatrı olaraq istifadə etməyin.** Qüsurlu əldə
  etmənin möhürü qüsurların daimi ictimai qeydidir, onlara qarşı
  müdafiə deyil. Primitiv hər iki istiqamətdə kəsir; bu onun
  dürüstlüyüdür.

## Bu kiti real bir əldə etmə üçün necə fork etmək

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # bədii məzmunu real ilə əvəz edin
                       # bütün boyunca rədd qaydaları R1-R8 tətbiq edin
bash build/seal.sh     # görüntü çəkmənin tamamlanması anında və ya bir az sonra möhürləyin
python3 build/verify.py
```

**Kritik zamanlama:** görüntü çəkmənin nəticəsində və ya bir az
sonra möhürləyin (nümunə vaxt cədvəlində FACT 05 hadisə E17).
Görüntü çəkmə zamanı möhür qismən-əldə etmə qeydi yaradır; çox
sonra möhür agentliyin görüntüləri dəyişdirə biləcəyi boşluq
yaradır. Düzgün pəncərə sərgi dəstindəki son maddə üçün görüntü
yoxlamasının tamamlanmasından dərhal sonradır.

**Kritik baxış:** möhürləmədən əvvəl dərcin ikinci forensik
ekspert (baş deyil) və agentlik müşaviri vasitəsilə işlədin. Bir
dəfə möhürləndikdən sonra dərc daimi olur.

## Mövcud saxlama-zəncir infrastrukturu ilə inteqrasiya

- **Agentlik İş İdarəetmə Sistemi (CMS).** CMS agentliyin əsas
  qeyd sistemi olaraq qalır. Möhür CMS-i əvəz etmir; CMS-in qeyd
  etdiyi baytlara və metodologiyaya öhdəlik götürür, beləliklə
  post-hoc CMS redaktələri ictimai olaraq aşkarlana bilər.
- **Federal Sübut Qaydaları / Daubert / dövlət sübut kodları.**
  Möhür dəyişdirilməsi aşkarlana bilən bütövlüyü təmin edərək
  FRE 901 təsdiqi qeydinə töhfə verir. O FRE 702 /Daubert-i təkbaşına
  ÖDƏMİR; metodologiya etibarlılığı hələ də sübut dinləməsində
  sınanılır.
- **Müdafiə aşkarlama (FRCP 16, Brady, Giglio və dövlət
  ekvivalentləri).** FACT 05-də hashlanmış yardımçı qeydlər (rol-
  fərd bağı, saxlama loqu, dəyişdirmə-möhür şəkilləri və s.) normal
  aşkarlamaya tabe olaraq qalır. Möhür o qeydlərin əldə etmə anında
  iddia etdiyini anker edir, beləliklə sonrakı "qeyd o vaxt fərqli
  idi" iddiası ictimai olaraq təkzib edilə bilər.
- **NIST Kompüter Forensikası Aləti Testləşdirməsi (CFTT).** Kit
  FACT 04 / FACT 05-də CFTT yoxlama loqlarına istinad edir;
  istinad hashdır, loqun özü deyil, beləliklə CFTT prosesləri
  təsirsiz qalır.
- **Məhkəmə tərəfindən təyin edilmiş neytrallar və müdafiə
  ekspertləri.** Hər biri aşkarlamada aldıqları forensik görüntüləri
  agentlik əməkdaşlığından asılı olmayaraq FACT 03 manifestə
  qarşı yenidən hash edə bilər. Bu kitin müdafiə tərəfi üçün
  əsas əlavə-dəyəridir.
- **Apellyasiya baxışı.** İllər sonra, apellyasiya forensik
  baxıcısı agentliyin mümkün-inkişaf etmiş hazırkı xatirinə qarşı
  deyil, möhürlənmiş FACT 04 qeyninə qarşı orijinal əldə etmə
  metodologiyasını yoxlaya bilər.

## Bu kit nəyi əvəz etmir

- Federal Sübut Qaydaları (və ya hər hansı dövlət sübut kodu).
- Ekspert ifadəsi üçün Daubert / Frye etibarlılıq standartları.
- Agentliyin forensik SOP və CMS.
- FRCP 16 / Brady / Giglio / dövlət ekvivalentləri altında müdafiə
  aşkarlama öhdəlikləri.
- Məhkəmə əmrləri, sıxma hərəkətləri, sübut dinləmələri və ya hər
  hansı digər məhkəmə-idarə edilən proses.
- NIST CFTT və ya hər hansı digər alət-testləşdirmə rejimi.
- Agentliyin imtiyaz-filtr / taint-komanda protokolu.

## Bu kit niyə v0.4.0+ -da mövcuddur

Bu, myriam-kit ilə göndərilən 8-ci işlənmiş nümunədir. O,
`~/Genesis/calc/PROMPT_LIBRARY_v0.md`-də sənədləşdirilmiş
autoresearch tərəfindən təsdiqlənmiş məhdudiyyət-əvvəl strukturuna
uyğun gəlir — məhdudiyyət-əvvəl prompt variantı çoxsaylı nümunə
domenlərində çəkili rubrikada ən yüksək balı qazandı. Açılış
bölmələri kitin yük-daşıyan hissələridir; manifest məzmunu asan
hissədir.

Kitin dizaynı ekspert-adı dərcində qəsdən mühafizəkardır və "bu
qəbul edilməni təsdiqləmir" sorumluluqdan imtina barədə aqressivdir.
Forensik birlik öz forensik işi üçün hücum edilməsinin sənədləşdirilmiş
tarixinə malikdir; kit ekspertlər üçün daha təhlükəsiz mövqe ilə
default olur. İctimai şəxsi-adlandırmanın tələb olunduğu yurisdiksiyalarda
agentliklər öz forkunu müvafiq şəkildə dəyişdirə bilər, lakin
default rədd ekspert təhlükəsizliyini üstün tutur.

## Lisenziya

İctimai mülkiyyət (CC0). Fork edin. İstinad tələb olunmur.
