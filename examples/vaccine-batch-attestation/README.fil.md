*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Kit para sa Pagpapatunay ng Batch ng Bakuna

Isang turnkey na halimbawa ng myriam-kit para sa mga tagagawa ng bakuna,
mga awtoridad sa pagtiyak ng kalidad, at mga ahensya ng pampublikong
kalusugan na nais maglathala ng isang naka-angkla sa Bitcoin, na may
ebidensya ng pakikialam, na selyo ng paglabas ng batch.

## Anong ipinagtatanggol ng kit na ito

**Mga uri ng pagkabigo na nahuhuli ng selyo:**

- **Tahimik na pagbabago nang retroactive sa mga resulta ng pagsubok sa
  paglabas.** Lahat ng 8 PDF ng pagsubok sa paglabas sa halimbawa ay
  naka-hash. Ang muling pag-hash matapos ang paglabas ay nagpapakita ng
  anumang pagbabago.
- **Mga hindi pagkakasundo tungkol sa kung aling mga espesipikasyon ang
  inilapat sa paglabas.** Naglalaman ang nakasarang FACT 02 ng kanonikal
  na pagkakakilanlan ng batch at hash ng talaan ng paggawa. Ang mga
  hindi pagkakasundo sa hinaharap na "ang spec ay palaging X" ay may
  pampublikong angkla.
- **Tahimik na pagbawas ng saklaw ng recall.** Ang mga pangako sa
  pharmacovigilance sa FACT 05 ay nakasara; ang hindi pagtupad sa mga
  ito ay napapansin ng publiko.
- **Pagsasaayos nang retroactive ng espesipikasyon para sa isang
  out-of-spec na batch.** Kung ang isang resulta ng pagsubok sa paglabas
  ay aktwal na isang borderline na PASS na muling iniuri bilang FAIL
  matapos ang paglabas, ang mga hash ng nakasarang ulat ay
  nagpapatunay kung ano ang sinasabi ng orihinal na PDF ng resulta.

**Mga uri ng pagkabigo na HINDI saklaw:**

- Pandaraya sa mismong proseso ng paggawa (ang selyo ay umaangkla sa mga
  resulta ng pagsubok, hindi sa integridad ng paggawa).
- Mga di-kanais-nais na pangyayari na biyolohikal na kahihinatnan ng
  isang pumasa naman na batch (ang selyo ay hindi nagpapatunay ng
  kaligtasan sa klinika, dokumentong integridad lamang).
- Mga hindi pagkakasundo tungkol sa kung aling bersyon ng isang
  espesipikasyon ng regulasyon ang may awtoridad.

## Kailan gamitin ang kit na ito

Isaalang-alang ang pagsasara ng paglabas ng batch kung:

- Ikaw ay isang tagagawa ng bakuna na nais ipakita ang forensic na
  integridad ng mga talaan ng paglabas na higit pa sa hinihingi ng mga
  regulator
- Ikaw ay isang QA team na nag-aampon ng "ilathala ang aming
  pinatutunayan" na praktis
- Ikaw ay isang maliit/pambansang antas na tagagawa sa isang
  hurisdiksyon na may mas mahinang regulatory na imprastruktura, na nais
  iangkla ang mga talaan ng batch laban sa isang pandaigdigang
  tagapagpatunay
- Ikaw ay isang ahensya ng pampublikong kalusugan o NGO na nagpapatakbo
  ng isang hindi pang-komersyal na programa ng produksyon ng bakuna
  (hal. para sa mga napabayaang sakit)

## Pangkasaysayang precedent ng dami ng namatay

- **Heparin contamination (2008, China):** pekeng oversulfated chondroitin
  sulfate sa mga batch ng heparin. Ang isang nakasarang manifest ng
  pagsubok sa paglabas ay gagawing cryptographically detectable ang
  tahimik na post-release na pagbabago ng talaan ng pagsubok.
- **Tylenol cyanide (1982):** mga retroactive na hindi pagkakasundo
  tungkol sa pinagmulan ng pakikialam. Ang isang nakasarang hash ng
  talaan ng paggawa ay umaangkla sa estado bago ipinamahagi.
- **Iba't ibang recall ng batch ng bakuna** kung saan ang tanong na "ang
  batch ba na ito ay nasubukan nang tama" ay naging pinagtatalunan
  pagkalipas ng mga taon.

Ang kit ay HINDI isang solusyon para sa ALINMAN sa mga ito sa mahigpit na
kahulugan — ngunit sa bawat kaso, ang mga nakasarang pagpapatunay ng batch
ay magbibigay ng isang mas malinaw na forensic na linya ng panahon.

## Paano i-fork ang kit na ito para sa isang totoong batch

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # replace fictional content with real batch
bash build/seal.sh        # SEAL BEFORE distribution begins
python3 build/verify.py   # confirm
```

**KRITIKAL NA TIMING**: isara sa sandali ng paglabas ng QA, BAGO ipamahagi
ang batch. Ang isang selyo matapos ang pamamahagi ay forensically mas
mahina.

## Pagsasama sa umiiral na imprastruktura ng parmasyutiko

- **mga eCTD submission (FDA / EMA):** ang URL ng nakasarang publikasyon o
  IPFS CID ay maaaring banggitin sa Module 3 (kalidad) na seksyon
- **WHO Prequalification:** ang nakasarang manifest ay nagpapakita ng
  pre-release testing chain sa mga hurisdiksyon na hindi FDA/EMA
- **Feedback ng pharmacovigilance:** Ang FACT 05 ay nangangako sa
  tagagawa ng nakasarang pag-uulat ng pinagsama-samang bilang ng AE sa 6
  at 12 buwan
- **Mga sistema ng recall (RxConnect, MedWatch):** kung kailangang
  mag-recall, ang saklaw mismo ng recall ay nakasara sa ilalim ng
  MYRIAM, na nagbibigay ng pampublikong pagpapatunay na ang lahat ng
  ipinamahaging mga lot ay tinatalakay

## Ano ang HINDI pinapalitan ng kit na ito

- Mga regulatory na pagsumite ng FDA / EMA / WHO
- Mga GMP audit trail (ang selyo ay umaangkla sa mga RESULTA, hindi sa mga
  hilaw na talaan ng proseso)
- Mga database ng pharmacovigilance (VAERS / EudraVigilance)
- Mga sistema ng coordinate ng recall

## Lisensya

Public domain (CC0). I-fork ito. Walang kinakailangang attribution.
