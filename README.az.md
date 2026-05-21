*Azərbaycan tərcüməsi — ingilis dilindəki orijinal versiya üçün, [README.md](README.md)-ə baxın*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Kiçik bir faktlar dəstini aşağıdakı qaydada dərc etmək üçün kiçik bir alətlər toplusu:

- Hər hansı bir faktda edilən hər hansı bir dəyişiklik ictimaiyyət tərəfindən aşkar edilə bilər (Merkle ağacı)
- Dərc anındakı vəziyyət Bitcoin blokçeyninə qarşı yoxlanıla bilər (OpenTimestamps)
- Məzmun istənilən tək hostinq provayderinin silinməsindən sonra da yaşamağa davam edir (IPFS)
- Bütün sistem 100 KB-dan azdır və təxminən 50 sətir Python ilə yoxlanıla bilər

Bu, blokçeyn deyil. Token yoxdur. İştirak ediləcək konsensus mexanizmi yoxdur. DAO yoxdur. Alət `sha256sum` + `ots` + `ipfs`-dir, yaxşı adlandırma konvensiyaları ilə bir-birinə bağlanmışdır.

O, ilk dəfə 2026-05-21 tarixində [disclosure.host](https://disclosure.host) saytında həyata keçirilmiş MYRIAM protokolunun şərəfinə adlandırılıb. Həmin səhifədə altı fakt, bir Merkle kökü və bir Bitcoin təsdiqi var. Bu kit həmin nümunənin ümumiləşdirilmiş halıdır.

## Status

- v0: macOS-da Python 3.10+, Homebrew və internet bağlantısı ilə işləyir. Linux test edilməyib, lakin işləməlidir. Windows: WSL gətirin.
- İctimai sahə (CC0). Onu istifadə edin, fork edin, repo-nuza əlavə edin, heç vaxt müəllif kimi qeyd etməyin. Məqsəd kreditləşdirmə deyil.

## Mövcud dillər

Bu README və bir neçə nümunə kit 17 dildə mövcuddur.
Tam indeks: [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Tərcümələr CC0 lisenziyası altındadır və icma PR-ləri ilə təkmilləşdirilə bilər.

## Onunla nə edə bilərsiniz

Bu nümunə kiçik bir faktlar dəstinin aşağıdakı xüsusiyyətlərə sahib olmalı olduğu hər yerə uyğundur:

- **Dərc edilə bilən** — geniş auditoriyaya adi HTTP üzərindən
- **Davamlı** — 30 il sonra oxucular hələ də yoxlaya bilməlidir
- **Saxtakarlığa qarşı sübutlu** — istənilən dəyişiklik aşkar edilə bilməlidir, mütləq qarşısı alınmalı deyil
- **Etibarsız** (trustless) — heç bir oxucu naşirə güvənməyə məcbur deyil (yalnız riyaziyyata)

Konkret istifadə halları [docs/USE_CASES.md](docs/USE_CASES.md) sənədindədir. Qısa siyahı:

| Sahə | Möhürlənmiş faktlar |
|---|---|
| İctimai səhiyyə | Peyvənd partiyası test nəticələri, dərman sınağı mərhələləri |
| Seçkilər | Təsdiqləmə anındakı seçki dairəsi səviyyəsində toplam saylar |
| Süni intellekt təhlükəsizliyi | Model çəkilərinin heşi + model kartı + buraxılış zamanı qiymətləndirmə balları |
| Jurnalistika | Whistleblower (informator) sənəd buraxılışları üçün mənbə sənədlərin manifesti (yalnız heşlər) |
| Elm | Xam məlumatın heşi + təhlil skriptinin heşi + iddia edilən nəticə |
| Məhkəmələr | Əldə etmə anındakı rəqəmsal sübutların heşi |
| Satınalmalar | İctimai xərcləmə məlumatlarının möhürlənmiş kökləri |

Bunların ümumi cəhəti: kiçik bir faktlar dəsti, güclü davamlılıq tələbi, bir-birinə güvənməyən bir neçə tərəf və çox kiçik bir saxlama büdcəsi. Bu alət məhz bu forma üçün hazırlanmışdır.

## Onun ETMƏDİYİ şeylər

- **Sirləri saxlamır.** `facts/` qovluğuna qoyduğunuz hər şey ictimaidir. Protokol dərc etmək üçündür, gizlətmək üçün deyil.
- **Böyük məlumat dəstlərinə miqyaslanmır.** Merkle ağacı yaxşı miqyaslanır; oxucunun diqqəti isə yox. Təxminən 20 faktdan sonra səhifə oxunmaz olur. Əgər bir milyon qeydi möhürləmək istəyirsinizsə, onları səhifədən kənar heşləyin və həmin yan ağacın Merkle kökünü bir fakta yerləşdirin.
- **Geri çağırışdan müdafiə etmir.** Bütün məqsəd ondan ibarətdir ki, möhürlədiyinizi dəyişdirə bilməyəsiniz. Əgər sonradan bir iddianı geri çağırmaq istəyə bilərsinizsə, onu möhürləməyin.
- **Qətiyyətli şübhəçini inandırmır.** Qətiyyətli bir şübhəçi `ipfs add -r --cid-version=1 -Q facts/` əmrini icra etməyəcək. Lakin sizi bütün quraşdırmanı uydurmaqda ittiham edəcək. İkinci uğursuzluq rejiminə qarşı protokol səviyyəsində müdafiə yoxdur. Riyaziyyatda deyil, insan motivasiyasında yaşayan heç bir şeyə qarşı protokol səviyyəsində müdafiə yoxdur.

## Necə istifadə edilməlidir

Beş dəqiqəlik təlimat: [docs/QUICKSTART.md](docs/QUICKSTART.md).
Tam protokol spesifikasiyası: [docs/SPEC.md](docs/SPEC.md).
Təhdid modeli: [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Bənzər sistemlərlə müqayisə (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave və s.): [docs/COMPARISON.md](docs/COMPARISON.md).

## Başqasının dərc etdiyini necə yoxlamaq olar

Üç seçim, əlçatanlıq sırası ilə:

1. **Brauzer**: istənilən müasir brauzerdə [`lib/verify.html`](lib/verify.html) faylını açın. Dərc URL-ini yapışdırın. Yoxlama düyməsinə basın. Heşləmə üçün `crypto.subtle` istifadə edilir — quraşdırma yoxdur, backend yoxdur, telemetriya yoxdur. Bitcoin təsdiqi addımı hələ də CLI alətinə ehtiyac duyur (yoxlayıcı səhifəsində 7-ci addıma baxın).
2. **Python**: dərc qovluğunun içindən `python3 lib/verify.py` əmrini icra edin. Yalnız stdlib; Bitcoin yoxlanması üçün `ots` lazımdır.
3. **Sıfırdan**: [`docs/SPEC.md §3`](docs/SPEC.md) sənədini oxuyun və yenidən tətbiq edin. Merkle alqoritmi istənilən dildə 30 sətirdən azdır.

## İşlənmiş nümunələr

Alətlər toplusu ilə birlikdə altı istehsalat səviyyəli nümunə kit gəlir. Hər biri möhürlənib, OTS ilə vaxt damğalanıb, IPFS-də qeydiyyatdan keçirilib (pinned), və real dünya halı üçün nə vaxt fork etmək lazım olduğunu və hansı uğursuzluq rejimlərinə qarşı müdafiə etdiyini izah edən bir adopsiya README-si daxildir.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) — Boeing 737 MAX / Theranos / FDA-müfəttiş-hesabat uğursuzluq rejimi üçün, burada sübutlar vasitəçilər tərəfindən basdırılır və ya dəyişdirilir.
- [`examples/ai-model-card/`](examples/ai-model-card/) — modelləri buraxan süni intellekt laboratoriyaları üçün, şifahi deyil, mexaniki olaraq aşkar edilə bilən təyinatdan əvvəlki öhdəliklərlə.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — klinik sınaq sponsorları üçün, post-hoc son nöqtə dəyişdirilməsini və seçici hesabatı (Vioxx, Paxil Study 329 uğursuzluq rejimləri) tutmaq.
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — peyvənd istehsalçıları və QA orqanları üçün, buraxılış test nəticələrini və geri çağırış öhdəliklərini lövbərləmək.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — tədqiqat qrupları üçün, p-hacking və HARKing-i ictimai aşkar edilə bilən etmək üçün təhlildən ƏVVƏL (məlumat, boru kəməri, gözlənilən nəticə) üçlüyünü lövbərləmək.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) — qraflıq seçki orqanları və seçki orqanları üçün, sertifikatlaşdırma anında təsdiq edilmiş ümumi nəticələri lövbərləmək ki, sessiz post-sertifikatlaşdırma düzəlişləri ictimai aşkar edilə bilsin.

Öz kitinizi yazmazdan əvvəl bunlardan birini oxuyun. İstifadə halınıza ən yaxın uyğun gələn adətən düzgün başlanğıc fork-dur.

## Sürətli başlanğıc

Bir sətirli versiya:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# facts/*.txt fayllarını həqiqətən möhürləmək istədiyiniz şeyi yazmaq üçün redaktə edin
./lib/seal.sh        # Merkle kökü qurur, OTS möhürləyir, IPFS-də pin edir
./lib/verify.sh      # hər şeyi yerli olaraq yenidən yoxlayır
# site/ qovluğunu hər hansı statik hosta yükləyin. Hər yerə. Fərqi yoxdur.
```

## Niyə bu mövcuddur

Kriptoqrafik primitivlər (Merkle ağacları, OpenTimestamps, IPFS) illərdir yetkindir. Çatışmayan ən kiçik mümkün yapışdırıcı idi — yan layihəyə əlavə edə biləcəyiniz və infrastruktur qurmadan, protokollar öyrənmədən, faktların özlərindən başqa bir sətir kod yazmadan bir günərzində möhürlənmiş dərc edilə bilən bir artefakta sahib ola biləcəyiniz bir kit.

Əksər kriptoqrafik dərc alətləri sizin node operatoru olmaq istədiyinizi fərz edir. Bu alət isə sizin altı mətn faylı dərc etmək istədiyinizi və bir daha kriptoqrafiya haqqında düşünmək istəmədiyinizi fərz edir.

## Təsirlər və əvvəlki sənət

- [Sigsum](https://www.sigsum.org/) — imzalar üçün şəffaflıq jurnalları
- [Sigstore](https://www.sigstore.dev/) — proqram təminatı tədarük zəncirinin bütövlüyü
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS sertifikat jurnalları
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin vaxt damğalama
- [IPFS](https://ipfs.tech/) — məzmuna ünvanlanan saxlama
- [The CALM protocol](https://disclosure.host) — ilk nümunənin (disclosure.host-da MYRIAM) müəlliflik etdiyi prinsipalı qoruyan dərc çərçivəsi

myriam-kit bunların ən kiçiyidir. Ruhən bir sistemdən daha çox Unix kanalına yaxındır.

## Ad haqqında qeyd

MYRIAM protokolu, John Bradley-in Myriam Proof adlı, qeyri-insan intellekti ilə ilk təmas nöqtəsinə dair bir məntiqi sübutun şərəfinə adlandırılıb. Protokol həmin sübutun doğru olmasından asılı deyil. Protokol istənilən kiçik faktlar dəsti üçün işləyir; sadəcə ki, ilk dəfə olaraq yad həyat açıqlaması ilə bağlı bir iddianı ehtiva edən altı faktı dərc etmək üçün istifadə olunub.

Əgər bu kiti peyvənd partiyalarını və ya seçki nəticələrini möhürləmək üçün fork etsəniz, onun ilkin olaraq yad həyat təması haqqında bir iddianı dərc etmək üçün istifadə edilməsi sizə əhəmiyyət vermir. Riyaziyyatın vecinə deyil.

Bununla belə: əgər siz BUNU yad həyat təması haqqında bir iddianı dərc etmək üçün istifadə edirsinizsə, protokol bu konkret arenada döyüş şəraitində sınanılıb. İlk MYRIAM tətbiqinin README-si açıq şəkildə bildirir ki, bu, Calm adlı LLM personasının bədii işidir, hər hansı yad həyat tərəfindən gələn ünsiyyət deyil. Siz də yəqin ki, eyni şeyi etməlisiniz. Əks halda oxucular sizin psixoloji vəziyyətiniz haqqında ən pisini düşünəcəklər.

## Saxlayır

Hələ heç kim. İctimai sahə. Fork edin. Təkmilləşdirin. İcazə istəmədən protokolu irəli aparın.
