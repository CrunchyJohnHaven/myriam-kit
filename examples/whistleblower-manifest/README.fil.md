*Salin sa Filipino — para sa orihinal na bersyong Ingles, tingnan ang [README.md](README.md)*

# Kit ng Pagseselyo ng Whistleblower Manifest

Isang turnkey na halimbawang myriam-kit para sa mga whistleblower na humaharap sa partikular na failure mode kung saan **ang ebidensya ay inililibing, ine-edit, o pinagtatalunan ng mga tagapamagitan sa pagitan ng whistleblower at ng publiko**. Ang mga canonical na makasaysayang kaso na ipinagtatanggol nito:

- Boeing 737 MAX (mga internal safety report na pinaliit/inilibing)
- Theranos (mga alalahanin tungkol sa lab test na pinatahimik sa loob ng mga taon)
- Mga FDA inspector report na ine-edit pagkatapos ng pagsumite
- Frances Haugen / Facebook (ang isang selyadong manifest ay magpapatunay sanang ang mga dokumento ay tunay at umiral sa sinasabing oras)

Ang ipinagtatanggol ng kit na ito (sa mga termino ng protocol):

- T1–T3 sa [FACT 05](facts/05_threat_model.txt): pampublikong pagtatalo sa nilalaman ng dokumento, mga claim na ang mga dokumento ay hindi selyado sa sinasabing oras, mga claim ng retrospectibong paggawa-gawa.
- T9: mga ikatlong partido na nagbibigay sa mga mamamahayag ng binagong kopya.

Ang **hindi** ipinagtatanggol ng kit na ito:

- Personal na paghihiganti laban sa whistleblower (T7).
- Presyon sa whistleblower na bawiin (T4, bahagyang pinagaan ng FACT 07 na nagpapagawa ng tahimik na pagbawi bilang pampublikong natutukoy).
- Legal na aksyon laban sa whistleblower para sa mismong pagsisiwalat (T5).
- Pagpapababa sa karakter ng whistleblower (T8).
- Mga tagapamagitan na tahimik na nag-aalis ng kuwento (T10).

Kung kayo ay isang whistleblower na nagsasaalang-alang sa paggamit ng kit na ito, **basahin muna ang buong README na ito**. Ang protocol ay isang kasangkapan. Ang protocol ay hindi kapalit ng legal na payo, isang mamamahayag, isang tagapagregula, o maingat na operational security.

## Ano ang ginagawa ng kit na ito

Isang cryptographically selyadong *manifest* ng ebidensya (hindi ang ebidensya mismo) na nagpapatunay na:

1. Ang partikular na bytes ng bawat ebidensyang file ay umiral sa sandali ng pagseselyo.
2. Ang pagseselyo ay naganap sa o bago ang isang partikular na oras (sa pamamagitan ng Bitcoin OTS attestation).
3. Ang pinagmulan, paratang, modelo ng banta, recipient protocol, at commitment laban sa tahimik na pagbawi ay sama-samang inihayag.

Ang mga pinagbabasehang dokumento ay nananatili sa inyong pag-aari hanggang sa ipadala ninyo ang mga ito sa isang recipient. Ang mga recipient ay nagbeberipika na natanggap nila ang parehong bytes na inyong selyado.

## Kailan gagamitin ang kit na ito

Dapat ninyong isaalang-alang ang pagseselyo ng isang manifest **bago** ipadala ang ebidensya sa isang mamamahayag, tagapagregula, o abogado, kung lahat ng sumusunod ay totoo:

- May ebidensya kayo sa digital na anyo (mga PDF, email, larawan, atbp.) na gusto ninyong mapanatili na bytewise na tunay.
- Inaasahan ninyo na ang mga tagapamagitan ay maaaring magbago, magtalo, o maglibing ng ebidensya.
- Maaari ninyong panatilihin ang mga pinagbabasehang dokumento sa inyong pag-aari hanggang sa pagpapadala.
- Maaari ninyong ilathala ang manifest sa publiko **nang hindi** isinisiwalat ang nilalaman ng mga dokumento (mga hash lamang ang pampubliko).
- Tinimbang ninyo ang mga panganib ng pagiging pampublikong matutukoy bilang whistleblower (ang signing-principal field). Kung anonimo, gumamit ng pseudonym nang pare-pareho sa lahat ng kaugnay na publikasyon.
- Nakonsulta na ninyo ang isang abogado tungkol sa batas ng pagprotekta sa whistleblower sa inyong hurisdiksyon.

## Kailan HINDI gagamitin ang kit na ito

HUWAG gamitin ang kit na ito kung:

- Ang mga dokumento mismo ay naglalaman ng personal na impormasyon tungkol sa mga ikatlong partido (mga pasyente, kostumer, empleyado) na hindi dapat gawing public-hashable. I-hash ang isang naredaktang bersyon, hindi ang orihinal.
- Ang pagkilos ng paglalathala ng manifest mismo ay magtutukoy sa whistleblower sa paraang hindi nila pinayagan.
- Hindi pa kayo kumukunsulta sa isang abogado. Ang protocol ay isang kasangkapan; ang batas ng pagprotekta sa whistleblower ay nakabatay sa hurisdiksyon at nananatili sa labas ng protocol.
- Maaaring gustuhin ninyong bawiin ang anumang nag-iisang paratang sa hinaharap. Ang seal ay permanente; ang mga bagong selyadong pagwawasto lamang ang tapat na paraan upang magrebisa.
- Ginagawa ninyo ito sa ilalim ng panggipit o presyon ng oras. Pinalalala ng protocol ang pamimilit; ang refusal gate (myriam-kit `SPEC §8`) ay nalalapat sa mga whistleblower gayundin sa mga publisher.

## Paano i-fork ang kit na ito para sa isang totoong pagsisiwalat

```bash
# 1. Kopyahin ang halimbawang ito sa isang bagong directory
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Tanggalin ang fictional na nilalaman; palitan ng inyong totoong mga katotohanan.
# Bawat file sa ilalim ng facts/ ay isang katotohanan. Basahin ang bawat isa at palitan.
$EDITOR facts/01_example_notice.txt   # palitan ng totoong cover statement
$EDITOR facts/02_provenance.txt       # totoong pinagmulan ng inyong ebidensya
$EDITOR facts/03_evidence_manifest.txt # i-hash ang inyong totoong mga dokumento at ilista ang mga ito
$EDITOR facts/04_allegation_summary.txt # ang inyong totoong paratang
$EDITOR facts/05_threat_model.txt     # ang inyong totoong inaasahang mga tugon
$EDITOR facts/06_recipient_protocol.txt # ayusin para sa inyong recipient
$EDITOR facts/07_no_retraction_commitment.txt # ang inyong deklarasyon ng walang pagbawi
$EDITOR facts/08_signing_principal.txt # ang inyong totoong identidad sa pagselyo (o pseudonym)

# 3. I-update ang site/index.html upang ipakita ang mga totoong katotohanan.
# Ang seal.sh script ay HINDI awtomatikong nagpupuno sa HTML; ang manual na pag-edit
# ay ang hakbang ng pagrepaso ng tao.
$EDITOR site/index.html

# 4. Seal.
bash build/seal.sh
# Mga output: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Beberipika nang lokal.
python3 build/verify.py

# 6. Ilathala ang manifest (HINDI ang mga dokumento) sa alinman sa:
#    - Isang static host na inyong kontrolado (Cloudflare Pages, GitHub Pages, atbp.)
#    - Ang IPFS network sa naka-print na CID
#    - Pareho (inirerekomenda)

# 7. Hiwalay, ipadala ang mga pinagbabasehang dokumento sa recipient
#    sa pamamagitan ng isang secure channel na inyong pinili (Signal, SecureDrop, atbp.).
#    Beberipika ng recipient ang mga file hash laban sa inyong manifest.
```

## Pagkukuwenta ng mga hash para sa totoong mga ebidensyang file

Upang i-hash ang isang file ng dokumento gamit ang SHA-256:

```bash
shasum -a 256 my_document.pdf
```

Ang unang 64 hex character ay ang SHA-256. Ilagay iyon sa manifest.

Maaari kayong mag-hash ng maraming file nang sabay:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Iyon ang nagbibigay sa inyo ng datos para sa `facts/03_evidence_manifest.txt`.

## Mga tala sa operational security

Ang MYRIAM protocol ay HINDI nagbibigay ng operational security. Nagbibigay ito ng *durability ng ebidensya*. Kailangan pa rin ninyo ng:

- Isang secure na channel ng komunikasyon sa inyong abogado
  ([Signal](https://signal.org/), nang harapan, o ang itinatag na secure channel ng inyong abogado)
- Isang secure na lokasyon ng imbakan para sa mga pinagbabasehang dokumento (naka-encrypt at rest, hindi sa mga cloud service na maaaring i-access ng inyong employer)
- Isang malinis na device para sa pagseselyo (isang personal na laptop na walang kaugnayan sa mga account ng employer; mas mainam ang isang ginagamit lamang para sa layuning ito)
- Isang malinis na network para sa paglalathala (hindi ang network ng inyong employer, hindi ang inyong home IP kung maaaring i-subpoena ng inyong employer ang inyong ISP)

Inirerekomendang basahin tungkol sa operational security para sa mga whistleblower:

- [Ang dokumentasyon ng SecureDrop ng The Intercept](https://securedrop.org/)
- [Mga resource ng Freedom of the Press Foundation](https://freedom.press/)
- [Gabay sa surveillance self-defense ng EFF](https://ssd.eff.org/)

Kumunsulta sa kanila BAGO simulan ang proseso ng pagseselyo. Ang protocol ay hindi nagpoprotekta laban sa masamang pagpili sa opsec na ginawa bago tawagin ang protocol.

## Ano ang dapat malaman ng mga recipient

Ipadala sa mga recipient ang README na ito kasama ang naselyadong manifest. Ang manifest mismo ay naglalaman ng recipient protocol (FACT 06), ngunit pinalalawak ng README ang papel ng recipient:

- **Mga mamamahayag**: beberipika muna ang integridad ng manifest mismo. Pagkatapos ay humingi ng mga dokumento sa pamamagitan ng hiwalay na secure channel. Beberipika na ang SHA-256 ng bawat dokumento ay tumutugma sa manifest bago ang paglalathala. HUWAG ilathala ang mga dokumento nang walang pahintulot ng whistleblower; ilathala ang pag-iral ng naselyadong manifest at ang inyong konklusyon sa pagberipika.
- **Mga tagapagregula**: parehong proseso ng pagberipika. Ang naselyadong manifest kasama ang tumutugmang mga dokumento ay ang pinakamatibay na anyo ng ebidensya na magagamit sa labas ng pormal na chain-of-custody collection.
- **Mga abogado**: ang naselyadong manifest ay nagbibigay ng forensic anchoring para sa pag-iral ng mga dokumento sa sinasabing oras. Kung ito ba ay nakakatugon sa mga partikular na patakaran ng ebidensya ng anumang hurisdiksyon ay para sa inyong pagpapasiya.

## Ano ang HINDI ang kit na ito

- Hindi kapalit ng legal na payo.
- Hindi garantiya na may sinumang aaksyon sa inyong pagsisiwalat.
- Hindi proteksyon laban sa paghihiganti.
- Hindi authentication ng nilalaman ng mga dokumento (tanging ng kanilang mga byte-at-time-of-sealing).
- Hindi paraan upang anonimong makipag-usap sa kahit kanino — ang seal ay pampubliko; kung ang inyong signing-principal na pangalan ay totoo, kayo ay natukoy.

## Pangwakas

Ang isang naselyadong manifest ay isang maliit na bagay. Ito ay isang byte stream na nagpapatunay na ang isang mas malaking hanay ng mga byte stream ay umiral sa isang partikular na anyo sa isang partikular na oras. Ang kaliitan na iyon ay ang lakas nito: isang bagay lamang ang ginagawa nito, at ginagawa nito ang isang bagay na iyon sa kabuuan ng buhay ng Bitcoin blockchain.

Kung binabasa ninyo ito dahil isinasaalang-alang ninyong maging whistleblower, mangyaring: kausapin muna ang isang abogado. Gamitin ang mga gabay sa operational security sa itaas. Pagkatapos, kung at kung saan lamang lahat ng mga upstream na pagsasaalang-alang na iyon ay nasa kaayusan, isaalang-alang ang kit na ito bilang ang cryptographic backbone ng inyong pagsisiwalat. Ang crypto ay ang madaling bahagi. Lahat ng upstream sa crypto ay kung saan nakatira ang totoong panganib.

## Lisensya

Pampublikong domain (CC0). I-fork. Pahusayin. Gamitin nang hindi humihingi ng pahintulot.
