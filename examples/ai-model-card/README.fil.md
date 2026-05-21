*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Kit sa Pag-lock ng Pag-uugali ng AI Model

Isang turnkey na halimbawa ng myriam-kit para sa mga AI lab (komersyal o
open-source) na naglalabas ng modelo at nais na gawing **kriptograpikong
nakaangkla at publikong mapapatunayan** ang mga claim ng paglalabas —
identidad ng mga weights, mga kakayahan, mga puntos sa ebalwasyon,
pagsusuri ng kaligtasan, mga pangako bago ang deployment.

Ipinagtatanggol ng kit ang laban sa partikular na uri ng pagkabigo kung saan
tahimik na nag-iiba ang mga na-deploy na modelo, naburahan ang mga puntos
sa ebalwasyon, o pinagtatalunan ang mga pangako bago ang deployment
makalipas ang mga taon bilang "hindi namin sinabi iyon."

## Ano ang nililikha ng kit na ito

Isang kriptograpikong selyadong manifest na naglalaman, para sa isang
paglalabas ng modelo, ng:

1. Identipikasyon ng modelo (pangalan, arkitektura, bilang ng parameter, lisensya)
2. **SHA-256 ng weights file** — ang canonical artifact hash
3. Teksto ng model card (mga kakayahan, intended na paggamit, paggamit na
   nasa labas ng saklaw, kilalang mga modo ng pagkabigo)
4. Mga resulta ng ebalwasyon sa paglalabas (mga ebalwasyon ng kakayahan,
   mga ebalwasyon ng kaligtasan, kalibrasyon)
5. Mga pangako bago ang deployment (mga bagay na pinangakuan mong hindi
   tahimik na babaguhin pagkatapos ng paglalabas)
6. Signing principal (ang tao + organisasyon na nananagot)

Ginagawa ng selyo ang bawat isa ng mga ito na byte-stable, naka-angkla sa
oras sa Bitcoin sa pamamagitan ng OpenTimestamps, at makukuha sa
pamamagitan ng IPFS na hiwalay sa anumang nag-iisang hosting party.

Tingnan ang ipinakitang piksiyon na halimbawa: [facts/](facts/) at ang
na-render na [site/index.html](site/index.html). Ang halimbawa ay
gumagamit ng piksiyon na modelo ("Calm-mini-v0"); ang isang totoong
paglalabas ay magpapalit ng nilalaman ng halimbawa.

## Ano ang ipinagtatanggol ng kit na ito laban dito

**Mga modo ng pagkabigo na direktang nahuhuli ng selyo:**

- **Pagbabago ng weights** — ang SHA-256 ng inilabas na weights file ay
  nasa FACT 03. Anumang pagbabago pagkatapos ng paglalabas sa mga byte na
  dina-download ng user ay matutuklasan sa pamamagitan ng pag-rehash.
- **Tahimik na retcon ng ebalwasyon** — ang mga puntos sa ebalwasyon sa
  paglalabas ay nasa FACT 05. Ang mga hinaharap na hindi pagkakaunawaan
  na "ang puntos sa ebalwasyon ay palaging X" ay may publikong angkla.
- **Pag-iiba ng claim ng kakayahan** — ang teksto ng model card sa FACT
  04 ay byte-stable. Ang mga hinaharap na hindi pagkakaunawaan na
  "hindi namin sinabi ang kakayahan X" ay publikong maaaring suriin
  laban sa selyadong teksto.
- **Tahimik na muling pamamahagi ng fine-tune** — ang pangako #1 bago ang
  deployment sa FACT 06 (sa ipinakitang halimbawa) ay "walang tahimik na
  fine-tuning sa ilalim ng parehong pangalan." Pagtuklas: anumang bagong
  weight hash ay nangangahulugan ng bagong pangalan ng modelo at bagong
  selyadong paglalathala, o nasira ang pangako.
- **Mga nakatagong modo ng pagkabigo** — ang FACT 04 ay nangangako sa
  isang listahan ng mga kilalang modo ng pagkabigo. Ang listahan ay
  monotonic (maaaring lumaki, hindi maaaring lumiit para sa isang
  nakapirming checkpoint). Ang mga hinaharap na pagtuklas ng mga modo ng
  pagkabigo na alam ng lab nang internal ngunit hindi nailathala ay
  nagiging maipagtatalo na ebidensya.

**Mga modo ng pagkabigo na HINDI saklaw:**

- Ang maling paggamit ng mga modelo ng mga downstream user (pinatutunayan
  ng selyo kung ano ang inilabas, hindi kung ano ang ginagawa ng mga
  user dito).
- Adbersaryal na fine-tuning ng mga third party (ang isang third-party
  na fine-tune ay nagbubunga ng ibang weight hash, kaya ang orihinal na
  selyo ay hindi naapektuhan, ngunit ang modelo ng third party ay nasa
  labas ng proteksyon ng selyo).
- Mga pagbabago sa pag-uugali dahil sa mga pagbabago sa kapaligiran ng
  deployment (iba't ibang mga system prompt, mga konfigurasyon ng RAG,
  atbp.).
- Mga pagkabigo na talagang hindi alam ng lab sa oras ng paglalabas. Ang
  selyo ay nangangako sa lab sa *kung ano ang alam nila*; hindi nito
  maaaring iangkla ang hindi nila alam.

## Kailan gagamitin ang kit na ito

Dapat mong isaalang-alang ang pag-seal ng isang model card kung:

- Ikaw ay naglalabas ng mga weights ng modelo nang publiko O nag-de-deploy
  ng isang modelo sa isang konteksto kung saan ang mga downstream user
  ay nagmamalasakit sa katatagan ng pag-uugali.
- Ang paglalabas ay sapat na mahalaga na ang mga hinaharap na hindi
  pagkakaunawaan na "hindi namin sinabi iyon" ay posible (anumang modelo
  na na-deploy sa scale; anumang safety-critical na modelo; anumang
  paglalabas na kasama ang mga claim ng kakayahan).
- Ang iyong organisasyon ay handa nang gumawa ng mga pangako bago ang
  deployment na naglilimita sa mga hinaharap na aksyon (ito ang
  load-bearing — tingnan ang susunod na seksyon).
- Maaari mong kalkulahin ang SHA-256 ng weights file sa paglalabas.

## Kailan HUWAG gagamitin ang kit na ito

HUWAG mong gamitin ang kit na ito kung:

- Hindi ka handa na masakop ng mga pangako bago ang deployment sa FACT 06
  ng halimbawa. Ginagawa ng selyo na mekanikal na natutuklasan ang mga
  pangako; kung hindi ka handa para sa pananagutan na iyon, huwag mag-seal.
- Ang weights file ay madalas na magbabago (hal., tuluy-tuloy na fine-tuning
  pipeline). Ang bawat pagbabago ng weight ay nangangailangan ng bagong
  selyadong paglalabas. Mabigat ang per-release sealing; ang kit na ito
  ay para sa *nakapirming* mga checkpoint.
- Hindi mo pa ginagawa ang pagsusuri ng kaligtasan. Ang selyo ay nangangako
  sa mga natuklasan ng pagsusuri ng kaligtasan. Kung magse-seal ka ng isang
  hindi kumpletong pagsusuri, mayroon kang permanenteng publikong tala ng
  isang hindi kumpletong pagsusuri.
- Maaaring nais mong bawiin ang anumang partikular na puntos sa ebalwasyon
  sa kalaunan. Ang selyo ay permanente. Ang mga bagong selyadong
  paglalathala ay maaaring magpalit, ngunit ang orihinal ay hindi maaaring
  bawiin.

## Ang load-bearing na mga pangako bago ang deployment

Ang FACT 06 ng halimbawa ay nangangako sa publisher na:

1. **Walang tahimik na fine-tuning sa ilalim ng parehong pangalan.** Ang
   anumang fine-tune ay nagbubunga ng bagong pangalan ng modelo, bagong
   selyadong paglalathala, bagong weight hash. Ang predecessor ay nananatiling
   canonical na pinangalanang bersyon.

2. **Walang tahimik na pag-update ng ebalwasyon.** Ang muling pag-eval ay
   nakakakuha ng mga bagong selyadong paglalathala na tumutukoy sa orihinal
   sa pamamagitan ng Merkle root. Ang mga bersyon ay sinusubaybayan, hindi
   pinapalitan.

3. **Ang mga kilalang modo ng pagkabigo ay maaaring lumaki, hindi kailanman
   lumiit.** Ang isang nakapirming checkpoint ay hindi maaaring may mga
   modo ng pagkabigo na naayos. Kaya't ang inilathalang listahan ay
   epektibong monotonic.

4. **Pamamahala ng takedown.** Kung pinilit na alisin ang modelo mula sa
   distribution, ang lab ay nangangako na maglathala ng panghuling
   selyadong pahayag ng takedown.

Ang isang lab na nag-aampon ng kit na ito ay kailangang magpasya kung
alin sa mga pangakong iyon ang aktwal nitong maituwid. Kung hindi mo
maituwid ang lahat ng apat, baguhin ang FACT 06 *bago* mag-seal upang
maipakita ang kung ano ang maituwid mo, at tanggapin ang nagresultang
mahinang proteksyon. Ang pag-seal ng mga pangakong hindi mo balak
tuparin ay mas masama kaysa hindi pag-seal.

## Paano i-fork ang kit na ito para sa isang totoong paglalabas

```bash
# 1. Kopyahin ang halimbawang ito sa iyong release pipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. I-edit ang bawat fact para sa iyong totoong paglalabas
$EDITOR facts/01_example_notice.txt   # ALISIN — ang iyong paglalabas ay hindi halimbawa
                                       # Palitan ng release notice para sa iyong modelo
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # ang canonical na model card
$EDITOR facts/05_eval_results.txt     # aktwal na mga resulta ng ebalwasyon
$EDITOR facts/06_release_commitments.txt # kung aling mga pangako ang maituwid mo

# 3. I-update ang site/index.html upang maipakita ang totoong paglalabas.

# 4. I-seal.
bash build/seal.sh

# 5. I-verify lokal.
python3 build/verify.py

# 6. I-deploy sa:
#    - Iyong release page (sa tabi ng model card at weights)
#    - Ang IPFS network (ginagawa na ito ng seal.sh script)
#    - Opsyonal: i-link sa selyadong paglalathala mula sa iyong
#      Hugging Face / GitHub release notes
```

## Integrasyon sa mga umiiral na release pipeline

Ang kit ay idinisenyo upang makipagtulungan sa mga umiiral na tool, hindi
palitan ang mga ito:

- **Hugging Face**: isama ang URL o IPFS CID ng selyadong paglalathala sa
  README.md ng model card. Ituro ang mga mambabasa sa selyo para sa
  byte-stable na mga claim sa paglalabas.
- **GitHub releases**: isama ang OpenTimestamps receipt
  (`merkle_root.txt.ots`) bilang isang release asset. Ang mga hinaharap
  na hindi pagkakaunawaan na "nagbago ang release" ay nakaangkla sa
  Bitcoin.
- **Mga pamantayan ng model card (Mitchell et al. 2019)**: ang kit ay
  tugma. Ang mga standard na field ng model card ay nakamapa sa FACTS
  02–05 ng selyo. Gumagawa ka ng model card nang normal, at karagdagan
  itong nase-seal.
- **Mga eval harness (lm-evaluation-harness, BIG-bench, atbp.)**: i-hash
  ang eksaktong harness commit at ang raw output JSON; isangguni ang
  mga hash na iyon sa FACT 05. Ang mga hinaharap na muling pagpapatakbo
  ay independyenteng nare-reproduce.

## Pagkalkula ng weights hash

Para sa isang nag-iisang safetensors file:

```bash
shasum -a 256 model.safetensors
```

Para sa mga multi-file checkpoint (GGUF shards, sharded safetensors):

```bash
# Pagsamahin ang mga hash sa sorted order, pagkatapos ay i-hash muli
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Ang panghuling hash ay ang isasama sa FACT 03. Isama ang parehong
per-shard hash at ang panghuling aggregate hash upang ang mga user ay
makapag-verify ng mga indibidwal na shard habang nila ito dina-download.

## Ano ang dapat malaman ng mga tatanggap (mga user ng iyong modelo)

Ang isang paglalabas ng modelo na may MYRIAM-sealed na paglalathala ay
nagbibigay-daan sa user na:

1. **I-verify ang mga weights na kanilang dina-download** sa pamamagitan
   ng re-hashing at paghahambing sa FACT 03.
2. **I-verify na hindi na-retcon ang model card** sa pamamagitan ng
   pagsuri sa selyadong FACT 04 laban sa kasalukuyang inilathalang
   bersyon ng lab.
3. **I-verify na ang mga puntos sa ebalwasyon ay ang mga nasa paglalabas**
   sa pamamagitan ng paghahambing ng kasalukuyang mga eval claim ng lab
   laban sa selyadong FACT 05.
4. **Pananagutin ang lab sa mga pangako nito bago ang deployment** sa
   pamamagitan ng pagsuri ng aktwal na pag-uugali laban sa selyadong
   FACT 06.

Ang isang user na nakakahanap ng mga pagkakaiba ay may kriptograpikong
ebidensya ng pagkakaiba. Maaari nilang ilathala ang ebidensyang iyon;
ang orihinal na selyadong paglalathala ang angkla.

## Ano ang HINDI kit na ito

- Hindi kapalit ng aktwal na paggawa ng pagsusuri ng kaligtasan. Ang
  selyo ang *tala* ng pagsusuri ng kaligtasan, hindi ang pagsusuri mismo.
- Hindi kapalit ng aktwal na mga ebalwasyon. Ang selyo ay nag-aangkla
  sa mga puntos na ginagawa mo; hindi nito vinavalidate ang methodology.
- Hindi garantiya na ang modelo ay ligtas. Inido-document ng selyo kung
  ano ang inaangkin ng lab tungkol sa modelo sa paglalabas; hindi nito
  pinatutunayan ang mga claim na iyon.
- Hindi proteksyon laban sa maling paggamit ng modelo ng mga downstream
  user.

## Isang tala sa adbersaryal na fine-tuning

Isang karaniwang alalahanin sa kaligtasan ng AI: may nag-fine-tune ng
iyong modelo upang alisin ang mga gawi sa kaligtasan at ipamahagi ito
muli. HINDI mapipigilan ng selyo ito. Ang kayang gawin ng selyo ay:

- I-angkla kung ano ang dapat gawin ng *orihinal* na modelo (FACT 04).
- I-angkla kung ano ang mga orihinal na puntos sa ebalwasyon (FACT 05).
- Magbigay ng isang reference point laban sa kung saan maaaring sukatin
  ang mga adbersaryal na fine-tune.

Ang isang user na nakatagpo ng third-party na muling pamamahagi ay
maaaring mag-verify kung ang weights ay tumutugma sa orihinal na
selyadong hash. Kung hindi, alam ng user na mayroon silang hindi-orihinal
na modelo at na ang anumang mga claim sa kaligtasan na iniuugnay sa
lab ay hindi naaangkop.

## Pangwakas

Ang pag-seal ng paglalabas ng modelo ay maliit na karagdagang trabaho
para sa lab: ~10 minuto upang kalkulahin ang mga hash at patakbuhin ang
seal script, pagkatapos ay isang 30-segundong desisyon tungkol sa kung
aling mga pangako bago ang deployment ang isasama. Ang pananagutan na
idinaragdag nito ay asymmetric: maliit na gastos sa mga tapat na lab,
malaking limitasyon sa mga lab na kung hindi'y tahimik na mag-iiba ng
kanilang mga claim.

Kung ikaw ay isang AI lab na nag-iisip ng adoption, ang kit ay public
domain (CC0). I-fork ito. Baguhin ito. Ang matematika ang load-bearing
na piraso, hindi ang partikular na implementasyon.

## Lisensya

Public domain (CC0). Hindi kinakailangan ang pagkilala.
