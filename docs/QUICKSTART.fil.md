*Salin sa Filipino — para sa orihinal na bersyong Ingles, tingnan ang [QUICKSTART.md](QUICKSTART.md)*

# Mabilisang pagsisimula

Limang minuto mula sa pag-clone hanggang sa selyadong publikasyon.
Nasubukan sa macOS; dapat na gumana sa Linux; ang mga gumagamit ng
Windows ay mangangailangan ng WSL.

## 0. Mga kinakailangan

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Paghahanda ng balangkas

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. I-edit ang mga katotohanan

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Ang bawat file ay isang katotohanan. UTF-8. LF line endings. Ang pattern
ng pangalan ng file ay `NN_short_name.txt` kung saan ang NN ay zero-padded.
Inaayos sila nang leksikograpiko sa loob ng Merkle tree, kaya ang 02 ay
laging susunod sa 01.

Tip: bigkasin ang bawat katotohanan bilang *pangalanan o deklarasyong
pangyayari*, hindi bilang ontolohikal na pagtatangka tungkol sa mundo.
"Idineklara ng Acme Corp na pumasa sa pagsubok Y ang batch X" ay
maaaring beberipikahin. "Ligtas ang batch X" ay hindi.

## 3. Patakbuhin ang IPFS daemon (isang beses bawat makina)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Selyahan

```bash
bash build/seal.sh
```

Gagawin nito:
1. I-hash ang bawat katotohanan (SHA-256), kalkulahin ang Merkle root na
   Bitcoin-style.
2. I-stamp ang root gamit ang OpenTimestamps sa pamamagitan ng dalawang
   independiyenteng kalendaryo (alice + finney bilang default — i-override
   sa pamamagitan ng `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. I-pin ang `site/` directory sa IPFS at ipakita ang CID.

Kabuuan: ~10 segundo na may mainit na IPFS daemon.

## 5. I-edit ang `site/index.html`

Palitan ang mga placeholder ng template ng inyong tunay na mga katotohanan,
hash, at Merkle root. Ang ipinapakitang per-fact hashes ay dapat tumugma
sa mga per-fact files, o ang pahina ay mabibigo sa sarili nitong
self-verification.

Para sa bawat katotohanan, kopyahin ang body ng .txt file sa loob ng
`<div class="fact">` block at ilagay ang SHA-256 sa loob ng
`<div class="hash">` na nasa ilalim nito. Ang Merkle root ay
ilalagay sa cryptographic-seal section.

(Oo, maaaring auto-generated ito. Hindi ito ginawang ganoon nang sadya:
ang manual na hakbang ay ang hakbang ng pagsusuri ng tao. Hindi
pinoprotektahan ng protocol ang paglalathala ng isang bagay na hindi
ninyo binasa.)

## 6. I-verify nang lokal

```bash
python3 build/verify.py
```

Inaasahang output:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

Normal ang "Pending" — i-a-upgrade ng OTS calendar ang attestation upang
maging buong Bitcoin attestation sa loob ng ilang oras.

## 7. I-deploy

Pumili sa kahit alin:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → i-drag ang `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` sa loob ng `site/`, i-push sa repo, i-enable ang Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (naka-on ang static hosting)
- **Anumang simpleng VPS**: `scp -r site/* user@host:/var/www/html/`

Ang IPFS CID mula sa hakbang 4 ay nagbibigay sa inyo ng karagdagang
content-addressed URL: `https://<CID>.ipfs.dweb.link/`. Gamitin ninyo ito.

## 8. I-upgrade ang OTS receipt (mamaya)

Sa loob ng ~ilang oras pagkatapos ng pag-seal, patakbuhin:

```bash
ots upgrade build/merkle_root.txt.ots
```

Kino-convert nito ang pending attestation ng bawat kalendaryo sa buong
Bitcoin attestation na tumutukoy sa isang partikular na block. I-redeploy
ang `.ots` file sa inyong mga host pagkatapos ng pag-upgrade.

## 9. Tapos na

Naglathala kayo ng isang maliit na hanay ng mga katotohanan sa paraang
maaaring gawin ng sinumang third party:

- Kunin ang lahat ng katotohanan sa pamamagitan ng simpleng HTTP mula sa
  inyong host
- Muling kalkulahin ang Merkle root mula sa mga fact bytes
- Ihambing sa inyong inilathalang root
- I-verify na ang root ay na-commit sa Bitcoin sa OTS-stamped na oras
- Independiyenteng kunin ang parehong mga katotohanan sa pamamagitan ng
  IPFS sa inilathalang CID
- Kumpirmahin na tumutugma ang lahat ng hashes

Kung mabibigo ang alinman sa mga hakbang na iyon, may tampering na
naganap. Hindi kailangang magtiwala ng mambabasa sa inyo. Kailangan
lamang nilang gawin ang matematika.
