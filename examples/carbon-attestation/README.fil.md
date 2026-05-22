*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Carbon Attestation Seal Kit

Isang turnkey na halimbawa ng myriam-kit para sa mga developer ng
proyektong pangkarbono, mga third-party verifier, at mga registry na
nais maglathala ng Bitcoin-anchored, tamper-evident na selyo ng isang
pag-isyu ng carbon credit, pag-verify ng pagtanggal, o pangyayaring
emissions-attestation sa eksaktong sandali ng sertipikasyon — upang
ang mga tahimik na pagbabago pagkatapos ng pag-isyu ay maging
pampublikong matutukoy.

---

## Ano ang HINDI ginagawa ng kit na ito (basahin muna)

Ang mga carbon credit ay pulitikal at siyentipikong kontrobersyal. Ang
selyo ay isang cryptographic timestamp ng kung ano ang pinatutunayan.
Hindi nito mavi-verify kung ang pinatutunayan ay sumasalamin sa
tunay na benepisyong pangklima. Ang mga sumusunod na failure mode ay
**nasa labas ng saklaw ng selyo**, at ito ang bumubuo ng karamihan sa
mga mahahalagang katanungan tungkol sa integridad ng mga carbon
credit:

1. **Additionality.** Hindi mavi-verify ng selyo na ang aktibidad na
   na-credit ay hindi mangyayari kung walang carbon finance. Ang
   counterfactual ay hindi naoobserbahan sa prinsipyo. Itinatala ng
   selyo ang argumento ng methodology para sa additionality; hindi
   nito ito hinuhusgahan.

2. **Permanence.** Hindi mavi-verify ng selyo na ang nakulong na
   carbon ay mananatiling nakulong sa loob ng kaukulang time horizon
   (mga dekada hanggang daang taon para sa forest carbon, geological
   timescales para sa ilang removal). Ipinapakita ng kamakailang
   literatura (Badgley et al. 2022, Patterson et al. 2022) na ang mga
   buffer pool ay malaking naubos na dahil sa tunay na pangyayaring
   reversal. Ang isang naselyahang credit ay isang naselyahang *claim*
   ng permanence sa ilalim ng tinukoy na buffer-pool assumption,
   hindi katibayan ng permanence.

3. **Leakage.** Hindi mavi-verify ng selyo na ang mga naiwasang
   emission sa lugar ng proyekto ay hindi simpleng inilipat sa lugar
   na walang proyekto. Ang mga methodology-default na leakage
   deduction ay mga regulatory placeholder, hindi mga sukat. Iniaangkla
   ng selyo ang ipinatupad na deduction; hindi nito sinesertipika na
   tama ito.

4. **Co-benefits.** Hindi mavi-verify ng selyo ang mga claim ng
   pagpapaunlad ng komunidad o biodiversity. Ang mga co-benefit ay
   karaniwang sariling-iginiit at sinusuri ng verifier, hindi inaaudit
   sa lalim ng pagkukuwantipika ng carbon. Iniaangkla ng selyo ang
   mga document hash; wala nang iba pa.

5. **Free-Prior-and-Informed-Consent (FPIC) sufficiency.** Ang pahintulot
   ng katutubo at komunidad sa mga proyektong pangkarbono ay may
   nakatalang kasaysayan ng failure mode (pinilit na pahintulot,
   pahintulot mula sa mga di-representatibong katawan, post-hoc na
   "pahintulot" sa pamamagitan ng kompensasyon). Iniaangkla ng selyo
   ang dokumentasyon ng FPIC at mga hash ng grievance log; hindi nito
   masesertipika na ang proseso ng pahintulot ay tunay.

6. **Verifier independence.** Ang mga verifier ay binabayaran ng mga
   developer ng proyekto. Ito ay isang istrukturang conflict of
   interest na walang accreditation scheme ang nakalutas. Iniaangkla
   ng selyo ang independence declaration ng verifier; hindi nito
   sinesertipika na ang deklarasyon ay totoo.

7. **Double-counting sa iba't ibang registry o sa pambansang
   inventory.** Iniaangkla ng selyo ang registry-state snapshot sa
   oras ng attestation. Kung ang parehong aktibidad ay binibilang din
   ng host country sa kaniyang NDC, o iniaangkin din sa ibang
   registry, ginagawang diffable ng selyo ang estado ng registry
   ngunit hindi nito pinipigilan ang double count.

8. **Kawastuhan ng claim ng buyer.** Ang isang buyer na nag-retire ng
   isang naselyahang credit upang suportahan ang isang claim na "net
   zero" o "carbon neutral" ay gumagawa ng downstream claim na hindi
   sakop ng selyo. Itinatala ng selyo ang retirement; ang bisa ng
   marketing claim ng buyer ay isang hiwalay, downstream na
   katanungan.

9. **Kawastuhan ng methodology.** Itinatala ng selyo ang methodology
   citation + document hash na ipinatupad sa oras ng attestation.
   Hindi nito iginigiit na ang methodology ay siyentipikong balido.
   Nangyayari ang methodology reform; ang pag-seal sa ilalim ng isang
   methodology na sa kalaunan ay nirebisa ay hindi retroactively
   gumagawa sa mga credit na "mali" o "tama" — iniaangkla nito ang
   mga panuntunang ipinatupad sa pag-isyu.

**Ang honest-limits section sa itaas ay ang load-bearing na bahagi ng
kit na ito.** Halos lahat ng mahalagang katanungan tungkol sa
integridad ng isang carbon credit ay nasa isa sa siyam na bucket na
iyon. Sinasara ng selyo ang makitid na natitirang puwang: ang tahimik
na retroactive na pagbabago ng bytes-on-record. Ang puwang na iyon ay
totoo at karapat-dapat isara, ngunit ito ay maliit kumpara sa
kontrobersyal na teritoryo.

---

## Ano ang DAPAT TANGGIHANG selyuhan ng kit na ito

Ang kit ay naka-configure upang tanggihan ang sumusunod na fact
pattern kahit isumite ito ng isang user na may balidong signing
authority:

- **"Additionality" na ipinahayag bilang isang katotohanan.** Ang
  pag-seal sa additionality bilang katotohanan ay lumilikha ng isang
  mapanlinlang na talaan. Tumatanggap ang kit ng methodology-
  compliant na *argumentong* additionality, hindi additionality
  *claim*.
- **"Permanence" na walang malinaw na pagbubunyag ng time horizon at
  buffer pool.** Ang pag-seal sa permanence nang walang mga parameter
  na iyon ay nagtatago ng kung ano talaga ang ipinapangako ng
  proyekto.
- **"No leakage" na walang project-specific na pagsukat.** Ang mga
  methodology-default na leakage deduction ay hindi pagsukat at hindi
  ito ituturing ng selyo bilang gayon.
- **Mga pagkukuwantipika na binuo bago makumpleto ang third-party
  verification.** Ang isang pre-verification na selyo ay lumilikha ng
  isang false-positive na talaang "verified."
- **Mga talaan ng pag-isyu para sa mga credit na ini-isyu rin sa
  ibang registry nang walang malinaw na cross-registry na
  pagbubunyag** sa FACT 06.
- **Mga talaan ng retirement na hindi pinapangalanan ang retirement
  beneficiary.** Ang anonymous na retirement ay sumisira sa
  pampublikong-mabuting tungkulin ng retirement; tinatanggihan ito ng
  kit.
- **Mga claim ng FPIC na hindi sinusuportahan ng mga attestable na
  document hash.**
- **Article 6.2 / 6.4 na pag-isyu nang walang host-country letter-of-
  authorization (LoA) hash** na naselyahan sa FACT 06.
- **Pag-seal sa kahilingan ng sinumang partido maliban sa project
  developer + verifier nang magkasama** para sa proyektong iyon.
- **Mga claim ng co-benefits na naselyahan bilang "certified"** kung
  ang mga ito ay "self-asserted and verifier-reviewed" lamang.

Ang isang pagtanggi mismo ay maaaring selyuhan bilang isang
katotohanan ("Hiniling ng partidong ito ang pag-seal ng X; tumanggi
ang kit alinsunod sa refusal-rule Y"), lumilikha ng isang pampublikong
talaan ng tinangkang pagmamali.

---

## Ano ang DINIDIINSELYUHAN ng kit na ito

8 katotohanan sa sandali ng attestation:

1. **Example notice** — nagdedeklara na ang publikasyon ay isang
   halimbawa (sa mga totoong attestation ay aalisin o papalitan ito).
2. **Pagkakakilanlan ng proyekto** — pangalan ng proyekto, registry,
   registry project ID, methodology citation + hash, hash ng
   geographic boundary, vintage, project developer, claim ng
   co-benefits, status ng FPIC.
3. **Pagkukuwantipika ng emissions o removal** — gross tonnes CO2e,
   baseline counterfactual, leakage deduction, kontribusyon sa
   buffer pool, uncertainty deduction, net creditable claim, mga
   hash ng bawat numerical input.
4. **Methodology ng pagsukat** — mga remote-sensing data source,
   ground-truth plot network, hash ng instrument calibration log,
   classifier model hash + accuracy stat, carbon-density model,
   code-provenance + reproducibility manifest.
5. **Third-party verification** — verifier organization,
   accreditation, hash ng independence declaration, mga naunang
   engagement sa developer, hash ng site-visit photo archive, mga
   isinaayos at nalutas na finding, hash ng verification opinion
   document.
6. **Talaan ng pag-isyu o retirement** — kahilingan + pag-apruba ng
   pag-isyu, kabuuang credit na ini-isyu, serial range, deklarasyon
   sa iba't ibang registry, host-country LoA hash kung saan
   naaangkop, mga retirement serial range + beneficiary (para sa
   mga retirement attestation), mga hash ng registry-state snapshot.
7. **Mga karagdagang pagbubunyag at talaan ng pagtanggi** — mga
   nakabinbing dispute sa methodology, panganib ng di-permanence,
   mga caveat sa leakage, mga caveat sa additionality, mga hash ng
   FPIC + grievance log, caveat sa co-benefits, naunang engagement
   ng verifier; malinaw na listahan ng mga pattern na tinanggihang
   selyuhan ng kit.
8. **Signing principal** — project developer + verifier + registry,
   bawat isa ay may role + saklaw ng attestation + cryptographic
   key info.

Ang bawat katotohanan ay nagtatapos sa kombensiyon ng refusal-gate:
*"Iginigiit lamang ng katotohanang ito ang X. Hindi nito iginigiit
ang Y"* (kung saan ang Y ay ang pinakamalapit na failure mode mula sa
seksiyon ng "HINDI ginagawa" sa itaas).

---

## Ano ang ipinagtatanggol ng kit na ito

- **Tahimik na pagbabago ng pagkukuwantipika pagkatapos ng pag-isyu.**
  Anumang integer change sa FACT 03 ay magbubunga ng ibang SHA-256,
  ibang Merkle root, mabibigo sa OTS verification.
- **Tahimik na pagpapalit ng methodology.** Pinipigil ng FACT 02 ang
  methodology citation + document hash sa pag-isyu. Ang isang
  swap-in ng registry ng ibang bersyon ng methodology pagkatapos ng
  pag-isyu ay publikong diffable.
- **Tahimik na rebisyon ng baseline.** Naselyahan ang hash ng output
  ng baseline scenario model ng FACT 03. Ang isang post-hoc na
  baseline retune upang makagawa ng mas maraming credit ay
  natutukoy.
- **Tahimik na pagpapalit ng opinyon ng verifier.** Naselyahan ang
  hash ng opinion document ng FACT 05. Ang isang post-issuance na
  "lagi namang sinasabi ng verifier ang X" na rewrite ay natutukoy.
- **Tahimik na pagkawala ng talaan ng retirement.** Naselyahan ang
  registry-state snapshot ng FACT 06. Ang mga credit na misteryosong
  nagiging "available" muli pagkatapos na ma-mark na retired ay
  natutukoy laban sa selyo.
- **Tahimik na pagpapalit ng FPIC document.** Naselyahan ang mga
  hash ng FPIC + grievance log ng FACT 07. Ang mga kapalit na
  consent document ay natutukoy.
- **Tahimik na pag-alis ng mga di-komportableng pagbubunyag.**
  Naselyahan ang status ng companion-disclosure ng FACT 07. Ang
  tahimik na pagtanggal ng caveat ng non-permanence mula sa pahina
  ng project description ay natutukoy laban sa mga naselyahang
  byte.

HINDI ipinagtatanggol ng kit ang mga pinagbabatayang katanungan sa
integridad (additionality, permanence, leakage, FPIC sufficiency,
verifier independence, methodology validity). Ang mga iyon ang mas
mahihirap na problema at hindi nito malulutas ang mga iyon.

---

## Mga makasaysayan o malapit-makasaysayang kaso na natulungan sana ng kit

Ang kit ay makagagawa sana ng kapaki-pakinabang na anchor — *hindi
isang pag-aayos* — sa mga kaso na nagsasangkot ng tahimik na
retroactive na pagbabago ng mga talaan ng carbon attestation. HINDI
nito malulutas ang mga pinagbabatayang kontrobersyal na katanungan
sa anuman sa mga kasong ito.

- **Ang 2023 Guardian / Die Zeit / SourceMaterial na imbestigasyon
  ng mga Verra rainforest credit.** Natuklasan ng mga
  imbestigador na karamihan sa mga pinag-aralang REDD+ project ay
  nakagawa ng mga credit na ang inaangking naiwasang emisyon ay
  hindi tumugma sa pagkatapos na remote-sensing reanalysis.
  Kinailangan ng imbestigasyon ang pagbuo muli ng project
  documentation laban sa retroactively na binagong registry record.
  Ang isang naselyahang publikasyon sa bawat cycle ng pag-isyu ay
  magbibigay sana ng hindi maliwanag na reference byte para sa kung
  ano ang pinatutunayan sa bawat cycle — hindi isang pag-aayos para
  sa pinagbabatayang baseline problem, ngunit isang malinis na
  forensic timeline.

- **Ang 2020 California forest-offset reversal event.** Maraming
  forest-carbon project sa ilalim ng compliance market ng
  California ang nakaranas ng wildfire reversal na lumampas sa
  buffer-pool reserve na inilaan para sa kanila. Ang pagbuo muli ng
  kung ano ang pinatunayan ng bawat proyekto tungkol sa panganib ng
  non-permanence *sa pag-isyu* (kumpara sa kung ano ang inangkin ng
  proyekto na napatunayan nito sa kalaunan) ay kasalukuyang
  mahirap. Ang per-vintage na mga selyo ay gagawing canonically
  na-aabot ang pre-fire na mga attestation.

- **Iba't ibang REDD+ project kung saan ang mga reference-region
  baseline methodology ay retroactively pinuna bilang inflated.**
  Isang naselyahang methodology-document hash sa oras ng pag-isyu
  ay mag-aangkla sana kung aling bersyon ng methodology ang
  aktwal na ipinatupad sa aling vintage, gawing diffable ang
  "lagi namang X ang methodology" na depensa.

- **Ilang dispute sa Australian Carbon Credit Unit (ACCU) human-
  induced regeneration project (2022–2023).** Ang akademikong
  pagpuna sa kung ang regeneration ay aktwal na project-induced
  laban sa natural ay napunta sa mga dispute tungkol sa kung ano
  ang orihinal na inangkin ng proyekto. Ang mga naselyahang
  attestation ay magbibigay sana ng hindi maliwanag na
  per-vintage na talaan.

- **Mga retirement record ng carbon-offset na nagbago ng estado.**
  Ilang dokumentadong kaso ng mga retirement record sa
  boluntaryong-market na registry ang lumilitaw na nagbabago ng
  status pagkatapos ng retirement (nagiging "retired" para sa
  ibang dahilan, o iniaatang sa ibang beneficiary pagkatapos ng
  pangyayari). Ang per-retirement na mga selyo ay mag-aangkla sana
  ng estado sa sandali ng orihinal na retirement.

Sa wala sa mga kasong ito malulutas ng kit kung ang pinagbabatayang
credit ay kumakatawan sa tunay na benepisyong pangklima. Iniaangkla
ng kit ang mga talaan; iyon lamang ang ginagawa nito.

---

## Kailan gagamitin ang kit na ito

- Kayo ay isang project developer na nais maglathala ng isang
  tamper-evident na attestation kasabay ng inyong standard registry
  filing.
- Kayo ay isang third-party verifier na nais na ang inyong
  verification opinion ay maging publikong mavi-verify laban sa mas
  bagong representasyon ng registry ng "kung ano ang sinabi ng
  verifier."
- Kayo ay isang registry na nais magbigay ng karagdagang integrity
  layer sa mga talaan ng pag-isyu at retirement — partikular para sa
  mga proyekto sa mga hurisdiksyon na may mas mahinang rule-of-law
  backstop para sa integridad ng registry.
- Kayo ay isang mamamahayag, akademiko, o NGO na nagpapatakbo ng
  isang multi-year longitudinal na pagsusuri ng mga proyektong
  pangkarbono at kailangan ng isang pampublikong anchor upang
  ibahin ang mas bagong representasyon ng isang proyekto laban sa
  mga byte ng oras ng pag-isyu nito.
- Kayo ay isang buyer (corporate net-zero, airline compliance) na
  nais na ang mga credit na inyong ire-retire ay ma-retire laban sa
  mga publikong nakaangklang talaan, upang ang inyong downstream
  marketing claim ay maaaring i-audit laban sa isang matatag na
  forensic timeline.

## Kailan HUWAG gamitin ang kit na ito

- **Huwag gamitin bilang kapalit ng accredited third-party
  verification.** Hindi pinapalitan ng selyo ang ISO 14064-3
  verification; ipinagsasama ito.
- **Huwag gamitin upang ipangaral na ang isang proyekto ay
  "additional," "permanent," o "low-leakage."** Hindi mavi-verify
  ng selyo ang mga katangiang iyon. Ang paggamit ng selyo upang
  igiit ang mga ito ay pagmamali.
- **Huwag gamitin bilang legitimacy theater para sa mga credit na
  mababa ang kalidad.** Ang isang cryptographic seal sa isang
  poor-quality na credit ay isang permanenteng forensic record ng
  mababang kalidad, hindi isang depensa nito. Ang primitive ay
  nagtatapos sa dalawang dako; iyon ang kanyang katapatan.
- **Huwag gamitin upang selyuhan ang mga credit na binibilang din
  ng isang host country sa kaniyang NDC** nang walang malinaw na
  corresponding-adjustment disclosure sa FACT 06.
- **Huwag i-seal bago ang verification.** Ang isang selyo bago
  pinal ang opinyon ng verifier ay lumilikha ng isang
  false-positive na talaang "verified."
- **Huwag gamitin sa ilalim ng presyon upang alisin ang isang
  companion-fact disclosure sa FACT 07** (mga nakabinbing dispute
  sa methodology, isyu ng FPIC, naunang engagement ng verifier).
  Tumanggi, at selyuhan ang pagtanggi.
- **Huwag gamitin bilang isang marketing badge.** Ang
  "MYRIAM-sealed" ay hindi isang quality claim; ito ay isang
  forensic property. Ang pag-trato dito bilang isang quality badge
  ay eksaktong ang pagmamali na sinusubukang pigilan ng
  constraint-first design.

## Paano i-fork ang kit na ito para sa isang totoong attestation

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # palitan ang fictional content ng totoo
bash build/seal.sh         # I-SEAL SA O PAGKATAPOS ng registry issuance, hindi bago
python3 build/verify.py    # kumpirmahin
```

**Kritikal na timing:** i-seal SA o PAGKATAPOS ng opisyal na issuance
event ng registry, HINDI bago. Ang isang pre-issuance seal ay
lumilikha ng isang false-positive na talaang "issued." Para sa mga
retirement attestation, i-seal SA sandali ng retirement. Para sa mga
ongoing monitoring attestation sa pagitan ng pag-isyu at retirement,
i-seal sa bawat verifier-signed na monitoring cycle — ngunit linawin
sa FACT 01 na ang attestation ay isang monitoring update, hindi
issuance.

## Pagsasama sa umiiral na carbon infrastructure

- **Verra (VCS).** Ang URL ng naselyahang publikasyon o IPFS CID ay
  maaaring ikabit sa VCS project page bilang karagdagang
  dokumentasyon. Hindi pinapalitan ng selyo ang VCS verification;
  ipinagsasama ito.
- **Gold Standard.** Parehong integration model — karagdagang
  attestation kasabay ng Gold Standard issuance documentation. Ang
  diin ng Gold Standard sa co-benefits + community benefit
  documentation ay natural na umaayon sa FACT 02 + FACT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Parehong integration model.
- **Article 6.4 (Paris Agreement Supervisory Body mechanism).** Ang
  host-country LoA hash sa FACT 06 ay partikular na dinisenyo para
  sa Article 6.4 / 6.2 ITMO traceability. Ang corresponding-
  adjustment disclosure ay isang refusal-gated na field.
- **EU ETS MRV.** Para sa mga compliance market issuer, ang hash ng
  MRV report ay umaayon sa hash ng quantification spreadsheet ng
  FACT 03. Ipinagsasama ng selyo — hindi pinapalitan — ang verified
  emissions report ng operator.
- **CDP (Carbon Disclosure Project) corporate disclosure.** Para sa
  mga korporasyon na sinasaad ang retired credit sa CDP submission,
  ang retirement record na naselyahan sa ilalim ng FACT 06 ay ang
  canonical na maaabot na talaan. Ang wika ng CDP submission ay
  maaaring magtukoy sa Merkle root o IPFS CID ng naselyahang
  publikasyon.
- **ISO 14064-2 (project) / ISO 14064-3 (verification) / ISO 14065
  (accreditation).** Itinatala ng selyo ang conformance assertion +
  mga hash; hindi nito ginagawa ang conformance assessment.
- **TSVCM Core Carbon Principles (CCP) / mga label ng ICVCM.** Kung
  saan ang isang proyekto ay sinuri laban sa ICVCM CCP, ang hash ng
  resulta ng assessment ay maaaring selyuhan sa FACT 07 bilang isang
  karagdagang pagbubunyag.

## Ano ang HINDI pinapalitan ng kit na ito

- Accredited third-party verification (ISO 14064-3)
- Mga workflow ng registry issuance at retirement
- Pagtatasa sa pagsunod sa methodology
- Mga proseso ng pahintulot ng host-country para sa mga transaksyon
  ng Article 6
- Mga proseso ng compliance-market MRV (EU ETS, California Cap-and-
  Trade, RGGI, atbp.)
- Mga inisyatiba sa integridad ng boluntaryong-market (ICVCM, VCMI)
- Independent na pagtatasa ng climate-impact

## Bakit umiiral ang kit na ito sa v0.4.0+

Ito ang ika-7 worked example na ipinadala kasama ng myriam-kit.
Umiiral ang kit dahil ang mga carbon-credit market ay may
mahusay-na-dokumentadong kasaysayan ng tahimik na retroactive na
pagbabago — mga methodology na retroactively binigyang-kahulugan
muli, mga baseline na retroactively rinebisa, mga retirement record
na nagbabago ng estado, at mga project disclosure na tahimik na
nag-aalis ng di-komportableng caveat sa paglipas ng panahon.

Sinasara ng selyo ang *makitid* na puwang ng bytes-at-time-of-
attestation. Hindi nito tinutugunan — at hindi maaaring tugunan — ang
mas malalaking kontrobersyal na katanungan ng additionality,
permanence, leakage, o pagiging tunay ng co-benefit. Ang tapat na
paghahain ng kit ng limitasyong iyon ang kanyang pinakamahalagang
katangian.

## Lisensya

Pampublikong domain (CC0). I-fork ito. Walang kinakailangang
atribusyon.
