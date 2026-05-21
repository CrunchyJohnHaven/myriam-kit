*Türkçe çeviri — İngilizce orijinali için bkz. [QUICKSTART.md](QUICKSTART.md)*

# Hızlı Başlangıç

Klonlamadan mühürlü yayıma beş dakika. macOS üzerinde test edilmiştir; Linux'ta da çalışması beklenir; Windows kullanıcılarının WSL'e ihtiyacı olacaktır.

## 0. Önkoşullar

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. İskeleyi oluştur

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Olguları düzenle

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Her dosya bir olgudur. UTF-8. LF satır sonları. Dosya adı kalıbı `NN_short_name.txt` biçimindedir; burada NN sıfır dolgulu (zero-padded) bir sayıdır. Dosyalar Merkle ağacına sözlük sırasına (lexicographic) göre yerleştirilir; yani 02 her zaman 01'den sonra gelir.

İpucu: her olguyu dünya hakkında ontolojik bir iddia olarak değil, bir *adlandırma ya da beyan olayı* olarak ifade edin. "Acme Corp, X partisinin Y testini geçtiğini beyan etmiştir" doğrulanabilirdir. "X partisi güvenlidir" değildir.

## 3. IPFS arka plan sürecini başlat (makine başına bir kez)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Mühürle

```bash
bash build/seal.sh
```

Bu komut şunları yapar:
1. Her olguyu özetler (SHA-256), Bitcoin tarzı Merkle kökünü hesaplar.
2. Kökü, iki bağımsız takvim üzerinden OpenTimestamps ile damgalar
   (öntanımlı olarak alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B` ile geçersiz kılınabilir).
3. `site/` dizinini IPFS'te sabitler (pin) ve CID'yi yazdırır.

Toplam: sıcak bir IPFS arka plan süreciyle ~10 saniye.

## 5. `site/index.html` dosyasını düzenle

Şablondaki yer tutucuları (placeholder) gerçek olgularınız, özetleriniz (hash) ve Merkle kökünüzle değiştirin. Görüntülenen olgu başına özetler, olgu başına dosyalarla eşleşmelidir; aksi takdirde sayfa kendi kendini doğrulamada başarısız olur.

Her olgu için, .txt dosyasının gövdesini bir `<div class="fact">` bloğuna kopyalayın ve hemen altına bir `<div class="hash">` içine SHA-256'yı yerleştirin. Merkle kökü kriptografik mühür bölümüne gider.

(Evet, bu otomatik olarak oluşturulabilirdi. Bilinçli olarak değildir: manuel adım insan inceleme adımıdır. Protokol, sizin okumadığınız bir şeyi yayımlamanıza karşı koruma sağlamaz.)

## 6. Yerelde doğrula

```bash
python3 build/verify.py
```

Beklenen çıktı:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending" durumu normaldir — OTS takvimi, tasdiki birkaç saat içinde tam bir Bitcoin tasdikine yükseltecektir.

## 7. Dağıt

Aşağıdakilerden herhangi birini seçin:

- **Cloudflare Pages**: kontrol paneli → Pages → Direct upload → `site/` dizinini sürükleyin
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/` içinde `git init`, depoya push, Pages'i etkinleştirin
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting on)
- **Sade herhangi bir VPS**: `scp -r site/* user@host:/var/www/html/`

4. adımdaki IPFS CID size ek olarak içerik-adresli bir URL verir: `https://<CID>.ipfs.dweb.link/`. Kullanın.

## 8. OTS makbuzunu yükselt (sonra)

Mühürlemeden ~birkaç saat sonra şunu çalıştırın:

```bash
ots upgrade build/merkle_root.txt.ots
```

Bu işlem, her takvimin bekleyen tasdikini, belirli bir bloğa atıfta bulunan tam bir Bitcoin tasdikine dönüştürür. Yükseltmeden sonra `.ots` dosyasını barındırıcılarınıza yeniden dağıtın.

## 9. Hepsi bu

Üçüncü herhangi bir tarafın şu işlemleri yapabileceği biçimde küçük bir olgu kümesi yayımladınız:

- Tüm olguları, sizin barındırıcınızdan düz HTTP üzerinden indirebilir
- Olgu baytlarından Merkle kökünü yeniden hesaplayabilir
- Yayımladığınız kökle karşılaştırabilir
- Kökün, OTS damgalı zamanda Bitcoin'e işlendiğini doğrulayabilir
- Aynı olguları, yayımlanan CID'de IPFS üzerinden bağımsız olarak getirebilir
- Tüm özetlerin eşleştiğini onaylayabilir

Bu adımlardan herhangi biri başarısız olursa, kurcalama gerçekleşmiş demektir. Okuyucunun size güvenmesi gerekmez. Sadece matematiği yapması yeterlidir.
