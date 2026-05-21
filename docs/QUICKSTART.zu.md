# Ukuqala Okusheshayo

*Uhumusho lwesiZulu — ngenguqulo yokuqala yesiNgisi, bheka [QUICKSTART.md](QUICKSTART.md)*

Imizuzu emihlanu kusukela ekuqopheni kuya ekushicilelweni okuvaliwe. Kuhlolwe ku-macOS;
ILinux kufanele isebenze; abasebenzisi beWindows bazodinga iWSL.

## 0. Izimfuneko zangaphambili

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Ukwakha ulwakhiwo

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Hlela amaqiniso

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Ifayela ngalinye liyiqiniso elilodwa. UTF-8. Iziphetho zomugqa ze-LF. Iphethini yegama lefayela
ithi `NN_short_name.txt` lapho i-NN igcwaliswe ngo-zero. Zihlungwa
ngokolimi lwesichazamazwi esihlahleni seMerkle, ngakho i-02 ihlala ilandela i-01.

Iseluleko: kuchaze njengento yokuqamba gama noma njengomcimbi wokumemezela noma yiliphi iqiniso,
hhayi njengesimangalo se-ontology mayelana nomhlaba. "I-Acme Corp imemezele ukuthi ibhetshi X
ladlula ukuhlolwa Y" kuyaqinisekiseka. "I-Bhetshi X liphephile" akuqinisekiseki.

## 3. Qala i-IPFS daemon (kanye komshini ngamunye)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Vala

```bash
bash build/seal.sh
```

Lokhu kuzokwenza:
1. I-hash yeqiniso ngalinye (SHA-256), kubalwa impande yeMerkle eyaka-Bitcoin.
2. Kugxiviza impande nge-OpenTimestamps ngamakhalenda amabili azimele
   (alice + finney ngokuzenzakalelayo — chibiyela nge-`MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Ihloma idayirektri ye-`site/` ku-IPFS futhi iprinte i-CID.

Isamba: ~10 wamasekhondi nge-IPFS daemon efudumele.

## 5. Hlela i-`site/index.html`

Faka esikhundleni sezindawo zokugcwalisa zethemplethi ngamaqiniso akho angempela, ama-hash,
nempande yeMerkle. Ama-hash kweqiniso ngalinye aboniswayo kufanele afane namafayela eqiniso ngalinye,
ngale kwalokho ikhasi liyakwehluleka ekuziqinisekiseni kwalo.

Iqiniso ngalinye, kopisha umzimba wefayela le-.txt liye kubhloki `<div class="fact">`
futhi ufake i-SHA-256 kubhloki `<div class="hash">` ngqo ngaphansi kwayo.
Impande yeMerkle iya esigabeni se-cryptographic-seal.

(Yebo, lokhu kungase kwenziwe ngokuzenzakalelayo. Akwenziwa kanjalo, ngamabomu: isinyathelo
sesandla siyisinyathelo sokubuyekeza komuntu. Iphrothokholi ayivikeli
ekushicilelweni okuthile ongakufundanga.)

## 6. Qinisekisa endaweni

```bash
python3 build/verify.py
```

Umphumela olindelekile:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

I-"Pending" ijwayelekile — ikhalenda ye-OTS izothuthukisa ubufakazi
ibe ngubufakazi obugcwele beBitcoin ngaphakathi kwamahora ambalwa.

## 7. Yethula

Khetha noma yiluphi lwalezi:

- **Cloudflare Pages**: i-dashboard → Pages → Direct upload → hudula i-`site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` ku-`site/`, sundezela ku-repo, vumela iPages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting ivuliwe)
- **Noma iyiphi i-VPS evamile**: `scp -r site/* user@host:/var/www/html/`

I-IPFS CID esuka esinyathelweni 4 ikunika i-URL eyengeziwe ehlonzwa ngokuqukethwe:
`https://<CID>.ipfs.dweb.link/`. Yisebenzise.

## 8. Thuthukisa irisithi ye-OTS (kamuva)

Ngaphakathi kwamahora ambalwa kusukela ekuvaleni, gijimisa:

```bash
ots upgrade build/merkle_root.txt.ots
```

Lokhu kuguqula ubufakazi obukhulekayo bekhalenda ngalinye bube ngubufakazi obugcwele
beBitcoin obubhekisela kuyibhloki ethile. Phinda uyethule ifayela le-`.ots`
kubasingathi bakho ngemuva kokuthuthukisa.

## 9. Yilokho kuphela

Usushicilele iqoqo elincane lamaqiniso ngendlela yokuthi noma iyiphi inkampani yangaphandle ingakwazi:

- Ukulanda wonke amaqiniso nge-HTTP elula kumsingathi wakho
- Ukuphinda ibale impande yeMerkle isuka kumabhayithi eqiniso
- Ukuqhathanisa nempande yakho eshicilelwe
- Ukuqinisekisa ukuthi impande yethulwe ku-Bitcoin ngesikhathi sokugxiviza kwe-OTS
- Ukulanda ngokuzimele amaqiniso afanayo nge-IPFS kwi-CID eshicilelwe
- Ukuqinisekisa ukuthi wonke ama-hash ayafana

Uma noma yisiphi salezi zinyathelo sehluleka, ushintsho lwenzekile. Umfundi akadingi
ukukuthemba. Kufanele nje enze imathematika.
