*Azərbaycan tərcüməsi — ingilis dilindəki orijinal versiya üçün, [QUICKSTART.md](QUICKSTART.md)-ə baxın*

# Sürətli Başlanğıc

Klonlamadan möhürlənmiş dərcə qədər beş dəqiqə. macOS-da sınanılıb; Linux-da işləməlidir; Windows istifadəçilərinə WSL lazım olacaq.

## 0. Ön şərtlər

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Skaffold

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Faktları redaktə edin

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Hər fayl bir faktdır. UTF-8. LF sətir sonluqları. Fayl adı şablonu `NN_short_name.txt`-dir, burada NN sıfırla doldurulmuşdur. Onlar Merkle ağacına leksikoqrafik olaraq çeşidlənir, beləliklə 02 həmişə 01-dən sonra gəlir.

Məsləhət: hər faktı *adlandırma və ya bəyanat hadisəsi* kimi ifadə edin, dünya haqqında ontoloji iddia kimi yox. "Acme Corp X partiyasının Y testindən keçdiyini bəyan edib" yoxlanıla biləndir. "X partiyası təhlükəsizdir" — yox.

## 3. IPFS demonunu başladın (hər maşın üçün bir dəfə)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Möhürləyin

```bash
bash build/seal.sh
```

Bu:
1. Hər faktı heşləyir (SHA-256), Bitcoin üslubunda Merkle kökünü hesablayır.
2. OpenTimestamps vasitəsilə iki müstəqil təqvim ilə (defolt olaraq alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B` ilə dəyişdirin) kökü möhürləyir.
3. `site/` qovluğunu IPFS-də pin edir və CID-i çap edir.

Cəmi: isti IPFS demonu ilə ~10 saniyə.

## 5. `site/index.html` faylını redaktə edin

Şablon yer tutucularını öz faktlarınızla, heşlərinizlə və Merkle kökünüzlə əvəz edin. Göstərilən hər-fakt heşləri hər-fakt fayllarına uyğun olmalıdır, əks halda səhifə öz özünü yoxlamadan keçə bilməz.

Hər fakt üçün, .txt faylının gövdəsini `<div class="fact">` blokuna kopyalayın və düz onun altındakı `<div class="hash">` içinə SHA-256-nı qoyun. Merkle kökü kriptoqrafik möhür bölməsinə gedir.

(Bəli, bu avtomatik yaradıla bilərdi. Qəsdən yaradılmır: əl ilə addım insan baxışı addımıdır. Protokol oxumadığınız bir şeyi dərc etməkdən qoruyur deyil.)

## 6. Yerli olaraq yoxlayın

```bash
python3 build/verify.py
```

Gözlənilən çıxış:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" normaldır — OTS təqvimi bir neçə saat ərzində təsdiqi tam Bitcoin təsdiqinə yüksəldəcək.

## 7. Yerləşdirin

İstənilənini seçin:

- **Cloudflare Pages**: idarə paneli → Pages → Direct upload → `site/` qovluğunu sürüşdürün
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/` qovluğunda `git init`, repoya push edin, Pages-i aktiv edin
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (statik hostinq aktiv)
- **İstənilən sadə VPS**: `scp -r site/* user@host:/var/www/html/`

4-cü addımdakı IPFS CID sizə əlavə məzmun-ünvanlanmış URL verir: `https://<CID>.ipfs.dweb.link/`. Ondan istifadə edin.

## 8. OTS qəbzini yüksəldin (sonra)

Möhürlədikdən bir neçə saat sonra icra edin:

```bash
ots upgrade build/merkle_root.txt.ots
```

Bu hər təqvimin gözləyən təsdiqini konkret bloka istinad edən tam Bitcoin təsdiqinə çevirir. Yüksəltdikdən sonra `.ots` faylını hostlarınıza yenidən yerləşdirin.

## 9. Hamısı bu qədər

Siz kiçik bir faktlar dəstini elə bir formada dərc etdiniz ki, istənilən üçüncü tərəf:

- Bütün faktları sizin hostunuzdan adi HTTP üzərindən gətirə bilər
- Fakt baytlarından Merkle kökünü yenidən hesablaya bilər
- Sizin dərc edilmiş kökünüzlə müqayisə edə bilər
- Kökün OTS-möhürlənmiş vaxtda Bitcoin-ə təqdim edildiyini yoxlaya bilər
- Eyni faktları IPFS vasitəsilə dərc edilmiş CID ilə müstəqil olaraq gətirə bilər
- Bütün heşlərin uyğun gəldiyini təsdiqləyə bilər

Bu addımlardan biri uğursuz olarsa, saxtakarlıq baş verib. Oxucu sizə güvənmək məcburiyyətində deyil. Onlar sadəcə riyaziyyatı yerinə yetirməlidirlər.
