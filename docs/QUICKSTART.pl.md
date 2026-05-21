*Polskie tłumaczenie — oryginalna wersja angielska: [QUICKSTART.md](QUICKSTART.md)*

# Szybki start

Pięć minut od sklonowania do zapieczętowanej publikacji. Przetestowane na macOS; Linux powinien działać; użytkownicy Windowsa będą potrzebowali WSL.

## 0. Wymagania wstępne

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Inicjalizacja szkieletu

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Edycja faktów

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Każdy plik to jeden fakt. UTF-8. Znaki końca linii LF. Wzorzec nazwy
pliku to `NN_short_name.txt`, gdzie NN jest indeksem uzupełnionym zerami.
Pliki są sortowane leksykograficznie do drzewa Merkle, więc 02 zawsze
następuje po 01.

Wskazówka: formułuj każdy fakt jako *zdarzenie nazwania lub deklaracji*,
a nie jako twierdzenie ontologiczne o świecie. „Acme Corp zadeklarowała,
że seria X przeszła test Y" jest weryfikowalne. „Seria X jest bezpieczna"
— nie.

## 3. Uruchomienie demona IPFS (jednorazowo na maszynę)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Pieczętowanie

```bash
bash build/seal.sh
```

Polecenie:
1. Zhashuje każdy fakt (SHA-256) i obliczy korzeń Merkle w stylu Bitcoin.
2. Ostempluje korzeń przez OpenTimestamps za pośrednictwem dwóch
   niezależnych kalendarzy (domyślnie alice + finney — można nadpisać
   przez `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Przypnie katalog `site/` do IPFS i wypisze CID.

Łącznie: ~10 sekund przy rozgrzanym demonie IPFS.

## 5. Edycja `site/index.html`

Zastąp symbole zastępcze szablonu twoimi rzeczywistymi faktami, hashami
i korzeniem Merkle. Wyświetlane hashe poszczególnych faktów muszą
zgadzać się z plikami faktów, w przeciwnym razie strona nie przejdzie
własnej samoweryfikacji.

Dla każdego faktu skopiuj treść pliku .txt do bloku `<div class="fact">`
i umieść SHA-256 w `<div class="hash">` bezpośrednio pod nim. Korzeń
Merkle trafia do sekcji pieczęci kryptograficznej.

(Tak, można to wygenerować automatycznie. Celowo tego nie zrobiono:
krok ręczny jest krokiem ludzkiej recenzji. Protokół nie chroni przed
opublikowaniem czegoś, czego nie przeczytałeś.)

## 6. Weryfikacja lokalna

```bash
python3 build/verify.py
```

Oczekiwane wyjście:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

„Pending" jest normalne — kalendarz OTS w ciągu kilku godzin podniesie
atestację do pełnej atestacji Bitcoin.

## 7. Wdrożenie

Wybierz dowolną opcję:

- **Cloudflare Pages**: panel → Pages → Direct upload → przeciągnij `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` w `site/`, wypchnij do repozytorium, włącz Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (z włączonym hostingiem statycznym)
- **Dowolny zwykły VPS**: `scp -r site/* user@host:/var/www/html/`

CID z IPFS z kroku 4 daje ci dodatkowy adres URL adresowany treścią:
`https://<CID>.ipfs.dweb.link/`. Użyj go.

## 8. Podniesienie pokwitowania OTS (później)

W ciągu kilku godzin od zapieczętowania uruchom:

```bash
ots upgrade build/merkle_root.txt.ots
```

To konwertuje oczekującą atestację każdego kalendarza na pełną atestację
Bitcoin odwołującą się do konkretnego bloku. Po podniesieniu wgraj
ponownie plik `.ots` na swoje hosty.

## 9. To wszystko

Opublikowałeś niewielki zbiór faktów w taki sposób, że dowolna strona trzecia może:

- Pobrać wszystkie fakty przez zwykłe HTTP z twojego hosta
- Ponownie obliczyć korzeń Merkle z bajtów faktów
- Porównać go z twoim opublikowanym korzeniem
- Zweryfikować, że korzeń został zakotwiczony w Bitcoinie w czasie ostemplowanym przez OTS
- Niezależnie pobrać te same fakty przez IPFS pod opublikowanym CID
- Potwierdzić zgodność wszystkich hashy

Jeśli którykolwiek z tych kroków zawiedzie, doszło do manipulacji.
Czytelnik nie musi ci ufać. Musi tylko policzyć.
