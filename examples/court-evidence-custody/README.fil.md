*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Kit sa Selyo ng Chain-of-Custody ng Ebidensya sa Korte

Isang turnkey na halimbawa ng myriam-kit para sa mga forensic acquisition
team — mga eksaminer ng computer forensics, mga teknisyan sa pagkuha ng
mobile device, mga tagapagbantay ng ebidensya ng body cam, mga superbisor
ng laboratoryo — na nais maglathala ng selyo na naka-angkla sa Bitcoin,
tamper-evident, ng *kung anong mga byte ang nakuha* at *kailan*, sa
sandali ng pagkuha ng digital na ebidensya, upang ang mga hindi
pagkakaunawaan sa chain-of-custody ay magkaroon ng publikong angkla.

---

## Ano ang HINDI ginagawa ng kit na ito (basahin muna)

Ang selyo ay isang kriptograpikong timestamp ng KUNG ANONG FORENSIC
IMAGES ang nakuha, KAILAN sila nakuha, NG ALIN GAYA NG AHENSYA, SA ILALIM
NG ALIN GAYA NG WARRANT, at SA PAMAMAGITAN NG ALIN GAYA NG METODOLOHIYA.
Hindi nito masasagot ang anumang tanong tungkol sa kaso lampas doon.
Ang mga sumusunod ay **nasa labas ng saklaw ng selyo**:

1. **Pagtanggap sa ilalim ng Federal Rules of Evidence (o anumang ibang
   evidence code).** Ang selyo ay nag-aangkla ng mga byte at timestamp.
   Kung ang ebidensya ay tinatanggap — sa ilalim ng FRE 901
   authentication, FRE 702 expert testimony / Daubert, FRE 403
   prejudice balancing, o anumang katumbas sa state court — ay isang
   legal-procedural na tanong. Ang isang perpektong selyadong pagkuha
   ay maaari pa ring ideklarang hindi tanggap; ang isang hindi
   selyadong pagkuha ay maaari pa ring tanggapin. Ang selyo ay
   karagdagang ebidensya ng integridad, hindi kapalit ng desisyon ng
   korte sa pagtanggap.

2. **Kung ang pagkumpiska ay legal.** Ang pagsunod sa Fourth Amendment,
   pagiging balido ng warrant, pagsunod sa saklaw, kakayahan na ilapat
   ang exclusionary-rule — lahat ng ito ay nasa upstream ng selyo.
   Itinatala ng selyo na ang pagkuha ay naganap sa ilalim ng warrant
   FICT-SW-2026-0188; kung ang warrant ay legal na inilabas at legal na
   inihatid ay para sa korte.

3. **Kung ang ebidensya ay nagpapahiwatig ng kasalanan, exculpatory, o
   neutral.** Ang selyo ay nag-aangkla ng mga hash; ang interpretasyon
   ng nilalaman ng mga hash na iyon ay nabibilang sa report ng forensic
   examination, na sariling dokumento ito na may sariling diskobre at
   evidentiary regime. Tatanggi ang selyo na i-seal ang "FACT N: ang
   laptop ng suspek ay naglalaman ng materyal na nagpapahiwatig ng
   kasalanan" — tingnan ang refusal-rule R4.

4. **Kung ang chain-of-custody ay procedurally tama sa ilalim ng
   ebidensya batas ng applicable state.** Itinatala ng selyo ang
   contemporaneous na log ng custody event ng ahensya (FACT 05). Kung
   ang log na iyon ay nakatutugon sa mga partikular na kinakailangan
   ng chain-of-custody ng state ay para sa korte sa evidentiary hearing.

5. **Kung ang metodolohiyang forensic ay maaasahan.** Tinatasa ng
   Daubert at mga sumunod nito (at mga state-level na analog tulad ng
   Frye, kung saan ito pa rin nalalapat) ang pagiging maaasahan ng
   methodology. Itinatala ng selyo KUNG ALIN GAYA ng mga tool at
   bersyon ang ginamit (FACT 04); kung ang mga tool na iyon ay
   nakatutugon sa partikular na pamantayan ng pagiging maaasahan ng
   korte ay para sa korte. Ang mga bug sa tool ay naidokumento na
   post-acquisition sa mga nakaraang kaso; ang papel ng selyo ay upang
   gawing publikong refutable ang record ng bersyon at binary hash,
   hindi upang panagutin ang mga tool mismo.

6. **Kung ang ebidensya ay nabago BAGO ang pagkuha.** Ang selyo ay
   nag-aangkla ng mga byte mula sa sandali ng imaging pasulong. Kung
   isang suspek, isang opisyal, o isang third party ang nagbago sa
   source device bago ito na-image, hindi ito makikita ng selyo —
   sinesealan nito ang nabagong mga byte na may parehong integridad na
   gagawin nito sa orihinal. Ang halaga ng selyo ay nagsisimula sa
   imaging timestamp.

7. **Kung iginagalang ang saklaw ng warrant.** Tinutukoy ng warrant
   rider kung ano ang maaaring kunin; itinatala ng selyo kung ano ang
   NAKUHA. Kung ang pagkuha ay lumampas sa saklaw ng warrant ay,
   muli, isang legal na tanong na may sariling remedyo (suppression
   motion sa ilalim ng angkop na proseso ng state).

8. **Pag-re-identify ng anumang private party sa imbestigasyon.**
   Tatanggi ang selyo na maglathala ng anumang pangalan, identifier, o
   fingerprint na maaaring mag-re-identify ng isang suspek, defendant,
   biktima, saksi, o okupante ng premises. Ang case docket reference
   ay ang angkop na hawakan para sa mga partido na may katayuan na
   hanapin ang kaso.

**Ang honest-limits section sa itaas ay ang load-bearing na bahagi ng
kit na ito.** Ang mga forensic team na naniniwalang ang sealing ay
katumbas ng admissibility ay gagamitin ito bilang sandata. Ang kit ay
dapat sabihin nang malinaw: *ito ay isang non-repudiation na primitibo
para sa sandali ng pagkuha, hindi isang patunay ng legal na pagkuha,
methodological soundness, o court-recognized chain-of-custody.*

---

## Ano ang DAPAT NA TUMANGGI ang kit na ito na i-seal

Ang kit ay naka-configure upang tanggihan ang mga sumusunod na
fact patterns kahit na ang isang user na may balidong agency signing
authority ay magsumite ng mga ito:

- **Personal identification ng mga suspek, defendants, biktima, saksi,
  o anumang private third party.** Ang case docket reference ang
  hawakan para sa mga partido na may katayuan; ang public seal ay
  hindi dapat maging re-identification index.
- **Personal na pangalan ng mga forensic examiner o iba pang staff ng
  ahensya sa public seal.** Ang mga papel ay publiko; ang person-to-role
  bindings ay sini-seal nang hiwalay at madidiskobre sa ilalim ng
  proseso ng korte.
- **File-level hashes (o fingerprints) ng pinaghihinalaang materyal
  ng child sexual abuse, biometric templates, o anumang vulnerable-
  person re-identifying data — kahit sa pamamagitan ng hash.** Ang
  isang SHA-256 ng isang indibidwal na file ay isang permanenteng
  searchable identifier; ang paglathala nito sa isang public ledger ay
  maaaring muling biktimahin ang mga subject sa pamamagitan ng
  correlation sa mga private database. Ang image-level (forensic-
  image-level) hashes ng full disks ay tinatanggap; ang file-level
  hashes ng nasabing materyal ay HINDI KAILANMAN tatanggapin.
- **Mga natuklasan, interpretasyon, opinyon, o konklusyon ng pagsusuri
  tungkol sa kung ano ang ibig sabihin ng mga byte.** Ang selyo ay
  nag-aangkla ng KUNG ANONG BYTE ang nakuha at KAILAN. Ang
  interpretasyon ay nabibilang sa madidiskobreng examination report,
  hindi sa isang tamper-evident public ledger.
- **Mga claim ng admissibility o anumang ibang legal na konklusyon**
  ("ang ebidensyang ito ay tinatanggap," "ang warrant ay legal," "ang
  chain-of-custody ay tama sa ilalim ng §X.Y"). Ang mga legal na
  konklusyon ay mga function ng korte.
- **Pag-seal ng sinuman maliban sa awtorisadong principal ng
  acquiring agency.** Ang isang defense expert ay maaaring gumamit ng
  kit upang i-seal ang kanilang independent na pag-verify ng manifest;
  hindi nila maaaring i-seal ang ORIHINAL na pagkuha sa ilalim ng
  pangalan ng acquiring agency.
- **Role-to-individual bindings sa loob ng public seal.** Ang mga
  bindings ay sini-seal sa isang hiwalay na companion record
  (na-hash sa FACT 05) sa ilalim ng agency access control.
- **Mga pre-seizure o pre-warrant na investigative facts.** Mga
  pahayag ng informant, pre-warrant surveillance, mga input ng
  parallel construction — wala sa mga ito ang nabibilang sa
  acquisition seal. Ang selyo ay naka-saklaw sa acquisition event.

Ang isang pagtanggi mismo ay maaaring i-seal bilang isang fact ("Ang
ahensyang ito ay humiling ng pag-seal ng X; tumanggi ang kit ayon sa
refusal-rule Y"), na lumilikha ng isang public record ng tinangka na
pang-aabuso.

---

## Ano ang SINI-SEAL ng kit na ito

8 facts sa sandali ng pagkuha:

1. **Example notice** — nagdeklara na ang publikasyon ay isang halimbawa
   (ang mga totoong attestation ay inaalis o pinapalitan ito).
2. **Konteksto ng pagkuha** — case identifier, warrant citation,
   acquiring agency, requesting authority, petsa/oras ng pagkumpiska at
   pagkuha, lokasyon ng pagkuha (ang lokasyon ng pagkumpiska ay
   ginagawang redacted sa isang hiwalay na sini-seal na companion record
   upang maiwasan ang pag-re-identify ng premises).
3. **Evidence manifest** — bawat forensic-image-item: SHA-256 hash,
   laki ng file, anonymized identifier ng source-device, acquisition
   method, format ng forensic image.
4. **Methodology ng pagkuha** — mga pangalan ng forensic tool at
   eksaktong bersyon (na may tool-binary hashes), make/model ng
   write-blocker at firmware, NIST CFTT verification reference,
   ginamit na verification procedure, pinili ng image format.
5. **Chain-of-custody log** — per-event na timeline mula sa unang
   pagkumpiska hanggang sa pagtatapos ng imaging, ang mga custodian
   ay tinukoy ayon sa PAPEL (hindi ayon sa pangalan), na may mga hash
   ng hiwalay na sini-seal na companion records (role-to-individual
   binding, transport GPS log, evidence-locker access log,
   tamper-seal photographs, atbp.).
6. **Examiner qualifications ayon sa role** — mga sertipikasyong
   hawak, status ng continuing education, bilang ng nakaraang expert-
   witness experience, Daubert exposure, conflict-of-interest
   disclosures — lahat sa role-level, hindi personal.
7. **Companion disclosures at refusal record** — mga parallel
   investigations, pending warrant challenges, suppressed-evidence
   motions, privilege-filter / taint-team protocol na may bisa, mga
   nakaraang acquisition attempts, vendor bug-tracker review; tahasang
   listahan ng mga pattern na tinanggihang i-seal ng kit.
8. **Signing principal** — pagkilala sa acquiring agency + role-level
   signatory (lead examiner) + role-level co-signatory (unit
   supervisor) + cryptographic key info.

Bawat fact ay nagtatapos sa kombensiyon ng refusal-gate: *"Ang fact
na ito ay nag-aassert lamang ng X. Hindi nito iniaassert ang Y"* (kung
saan ang Y ay ang pinakamalapit na failure mode mula sa "HINDI ginagawa"
section sa itaas).

---

## Ano ang ipinagtatanggol ng kit na ito laban dito

- **Tahimik na post-acquisition alteration ng forensic image.** Ang
  anumang byte-level na pagbabago sa anumang image ay nagbubunga ng
  iba't ibang SHA-256, at ang post-change image ay hindi mag-ve-verify
  laban sa sini-seal na FACT 03 manifest.
- **Claim na "iba't ibang tool ang ginamit."** Itinatala ng FACT 04
  ang eksaktong bersyon ng tool na may tool-binary hashes; ang mga
  bandang huling claim na "gumamit pala kami ng v4.7.0, hindi v4.7.1"
  ay publikong refutable.
- **Claim na ang write-blocker ay hindi engaged, o gumamit ng iba't
  ibang modelo.** Ino-freeze ng FACT 04 ang write-blocker manifest.
- **Custody-log alteration.** Ang anumang pagbabago sa FACT 05 custody-
  event timeline (pagdadagdag, pag-aalis, o pag-re-timestamp ng isang
  event) ay nagbabago sa FACT 05 hash at publikong nadetekta.
- **Substitusyon ng credentials ng ibang examiner.** Ino-freeze ng
  FACT 06 ang role-level na credential profile sa oras ng acquisition.
- **Selective omission ng companion disclosures.** Inilalahad ng FACT
  07 ang mga inaasahang disclosure categories; ang isang walang laman
  na kategorya ay dapat tahasang i-attest ("wala sa oras ng
  acquisition"), kaya't ang isang huling "hindi namin namamalayan na
  iyon ay may kaugnayan" ay publikong refutable.
- **Mga post-acquisition na claim na ang examiner ay may conflict na
  hindi naidisclose.** Ang conflict disclosure ng FACT 06 ay
  na-freeze sa acquisition; ang mga huling hamon ay maaaring subukin
  laban dito.

Ang kit ay **hindi** nagtatanggol laban sa contemporaneous corruption
— ang isang team na sadyang nagsi-seal ng maling metadata sa oras ng
acquisition ay nagbubunga ng cryptographically valid na seal ng maling
metadata. Ang primitibo ay matapat tungkol doon: ito ay isang
non-repudiation na primitibo para sa contemporaneous na mga claim ng
ahensya, hindi isang patunay na ang mga claim na iyon ay tama.

---

## Mga makasaysayan o malapit-sa-makasaysayang kaso na maaaring natulungan ng kit

Ang kit ay sana ay nakapagbigay ng kapaki-pakinabang na angkla — *hindi
isang kalutasan* — sa mga nakaraang kaso kung saan ang chain-of-custody
ng digital evidence ay naging isang pinagtatalunang evidentiary issue.
Upang maiwasan ang pagngangalan ng mga defendant (na mga private party
kahit pa nahatulan), ang mga ito ay inilalarawan ayon sa uri ng kaso,
hindi ayon sa pinangalanang indibidwal:

- **Ang mid-2010s federal forensic-tool-bug controversy** kung saan ang
  isang malawakang-ginagamit na forensic imaging tool ay natuklasan,
  post-acquisition, na may edge-case bug na nakakaapekto sa isang
  partikular na uri ng source-media. Ang isang sini-seal na acquisition
  manifest na may frozen na tool-version-and-binary-hash data ay
  nakapagpapahintulot sa defense at prosecution na sumang-ayon sa
  eksaktong bersyon na ginamit, na nag-aalis ng isang axis ng
  pagtatalo.

- **Maraming state cases na may kaugnayan sa pinagtatalunang mobile-
  device extraction outputs**, kung saan ang vendor ng extraction tool
  ay kalaunan ay naglabas ng bug-fix patch at ang tanong ay naging
  "naapektuhan ba ng bug ang kasong ito." Ang isang sini-seal na
  methodology fact ay nagpapahintulot sa tanong na masagot laban sa
  frozen versioning data, sa halip na laban sa kasalukuyang memorya
  ng ahensya kung anong bersyon ang ginamit.

- **Mga body-worn-camera handoff dispute** sa mga kaso kung saan ang
  BWC vendor's docking system ay kalaunan ay diumano'y nagpapahintulot
  ng pagbabago ng footage sa transit. Ang isang sini-seal na manifest
  ng body-cam archive sa sandali ng pagtanggap ng ahensya ay
  nag-aangkla kung anong mga byte ang natanggap ng ahensya mula sa
  docking system; ang mga huling pag-edit sa agency side ay publikong
  nadetekta.

- **Hash-collision controversies sa computer-forensics cases**, kung
  saan ang isang defense expert ay nag-argumento na ang MD5 (gamit pa
  rin sa ilang legacy workflows) ay hindi sapat. Ang isang sini-seal
  na acquisition na nagre-record ng PAREHONG MD5 at SHA-256 ay
  nagpapahintulot sa SHA-256 na tumayo kahit na ma-impeach ang MD5.

- **Mga dispute sa pag-evolve ng examination methodology sa pagitan ng
  acquisition at trial.** Kapag ang isang kaso ay nakaupo sa pagitan
  ng acquisition at trial sa loob ng mga taon, ang methodology na
  pamantayan sa acquisition ay maaaring napalitan na sa trial. Ang
  sini-seal na record ay nagpapahintulot sa korte na suriin ang
  methodology laban sa pamantayan na kasalukuyan sa sandali ng
  acquisition, hindi laban sa huling pamantayan.

Ang kit ay HINDI sana naka-resolve sa mga underlying disputes tungkol
sa kasalanan o kawalang-kasalanan sa alinman sa mga uring kaso na ito.
Ito sana ay nakaresolve sa isang partikular na evidentiary sub-dispute:
kung ang mga byte, tool, at procedures ay ang inaangkin ng ahensya na
sila sa oras na inaangkin ng ahensya.

---

## Kailan gagamitin ang kit na ito

- Ang iyong ahensya ay may stable na forensic SOP at nais magdagdag ng
  Bitcoin-anchored na public attestation bilang isang tamper-evident
  layer sa ibabaw ng umiiral na paper-and-signature chain-of-custody.
- Inaasahan mong ang kasong ito ay magkakaroon ng makabuluhang defense
  challenge sa forensic evidence (high-stakes case, novel methodology,
  contested tool versions, atbp.).
- Maaari mong ilathala ang nakalistang fact set nang hindi nailalantad
  ang PII o vulnerable-person re-identifying data. (Ang refusal rules
  ng kit ay nagpapatupad nito; kung ang iyong facts ay nangangailangan
  ng pag-break sa refusal-rule, huwag gamitin ang kit.)
- Ang general counsel ng acquiring agency at ang prosecutor's office ay
  nag-review ng publication plan. Ang public publication ng isang
  case-identifier-bearing artifact ay may implikasyon para sa mga
  ongoing investigations; ang counsel review ay hindi optional.
- Ang defense discovery rules ng iyong jurisdiction ay compatible sa
  hiwalay na pagkakahawak ng ahensya sa role-to-individual binding
  record (na-hash sa FACT 05). Kung ang iyong jurisdiction ay nag-
  rerequire ng public examiner-name disclosure, dapat mong amyendahan
  ang kit nang naaayon.

## Kailan HUWAG gagamitin ang kit na ito

- **Huwag gamitin bilang kapalit ng existing chain-of-custody
  documentation ng ahensya.** Ang kit na ito ay *additive*, hindi
  kapalit. Ang CMS ng ahensya, custody log, at discovery production
  obligations ay hindi nagbabago.
- **Huwag gamitin kung ang pagkuha ay may kasamang CSAM, biometric
  templates, o iba pang vulnerable-person re-identifying data sa
  file-level.** Ang image-level hashes ng full disks ay tinatanggap;
  ang file-level hashes ng nasabing materyal ay HINDI KAILANMAN
  tinatanggap, kahit pa sa ilalim ng refusal-rule waiver. Kung hindi
  ka makagawa ng fact set nang hindi sinisira ang R3, huwag gamitin
  ang kit.
- **Huwag gamitin upang angkinin na ang warrant ay legal, ang
  pagkumpiska ay tama, o ang ebidensya ay tinatanggap** — hindi ito
  magagawa ng kit, at tatanggi ang refusal-rule R5 ng anumang
  ganoong claim.
- **Huwag gamitin sa ilalim ng presyon na i-seal bago matapos ang
  pagkuha.** Ang isang partial-acquisition seal ay maling representasyon
  ng estado.
- **Huwag gamitin upang ilathala ang personal na pangalan ng examiner**
  maliban kung partikular na inirerequire ng iyong jurisdiction at
  ang iyong mga examiner ay nagbigay ng indibidwal na pahintulot.
  Ang default ay role-level publication.
- **Huwag gamitin sa mga nakaseal o under-seal na kaso** nang walang
  tahasang permiso ng korte. Ang paglathala ng case identifier sa
  Bitcoin ay irreversible; kung ang kaso ay kalaunan ay nase-seal,
  ang public seal ay hindi maaaring bawiin. Ang kit ay para sa
  public-record acquisitions lamang.
- **Huwag gamitin bilang legitimacy theater.** Ang isang seal ng
  isang flawed na pagkuha ay isang permanenteng public record ng mga
  flaws, hindi isang depensa laban sa mga ito. Ang primitibo ay
  pumuputol sa dalawang panig; iyon ang kanyang katapatan.

## Paano i-fork ang kit na ito para sa isang totoong pagkuha

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # palitan ang piksiyon na nilalaman ng totoo
                       # ilapat ang refusal rules R1-R8 sa buong kahabaan
bash build/seal.sh     # i-seal SA o pagkatapos lamang ng pagkumpleto ng imaging
python3 build/verify.py
```

**Kritikal na timing:** i-seal SA o pagkatapos lamang ng pagtatapos ng
imaging (FACT 05 event E17 sa example timeline). Ang isang seal sa
panahon ng imaging ay lumilikha ng partial-acquisition record; ang isang
seal nang mas mahaba pagkatapos ay lumilikha ng isang gap kung saan
maaaring nabago ng ahensya ang mga images. Ang tamang window ay
agad pagkatapos makumpleto ang image verification para sa huling item
sa exhibit set.

**Kritikal na pagsusuri:** bago mag-seal, patakbuhin ang publikasyon
sa pamamagitan ng pangalawang forensic examiner (hindi ang lead) at
sa pamamagitan ng agency counsel. Sa sandaling nase-seal, ang publikasyon
ay permanente.

## Integrasyon sa umiiral na chain-of-custody infrastructure

- **Agency Case Management System (CMS).** Ang CMS ay nananatili bilang
  pangunahing system of record ng ahensya. Ang seal ay hindi pumapalit
  sa CMS; ito ay nangangako sa mga byte at methodology na inire-record
  ng CMS, kaya't ang mga post-hoc CMS edits ay publikong nadetekta.
- **Federal Rules of Evidence / Daubert / state evidence codes.** Ang
  seal ay nag-aambag sa FRE 901 authentication record sa pamamagitan
  ng pagbibigay ng tamper-evident integrity. HINDI nito nasasagot ang
  FRE 702 / Daubert sa sarili nito; ang pagiging maaasahan ng
  methodology ay sinusubok pa rin sa evidentiary hearing.
- **Defense discovery (FRCP 16, Brady, Giglio, at state equivalents).**
  Ang mga companion records na na-hash sa FACT 05 (role-to-individual
  binding, custody log, tamper-seal photos, atbp.) ay nananatili sa
  ilalim ng normal na discovery. Ang seal ay nag-aangkla kung ano ang
  inaangkin ng mga record na iyon sa sandali ng acquisition, kaya't
  ang isang huling "iba ang record sa oras na iyon" na claim ay
  publikong refutable.
- **NIST Computer Forensics Tool Testing (CFTT).** Ang kit ay nag-
  rereferensya ng CFTT verification logs sa FACT 04 / FACT 05; ang
  reference ay isang hash, hindi ang log mismo, kaya ang mga proseso
  ng CFTT ay hindi naapektuhan.
- **Court-appointed neutrals at defense experts.** Maaaring re-hash ng
  alinman ang mga forensic image na natatanggap nila sa discovery
  laban sa FACT 03 manifest, nang independyente sa anumang kooperasyon
  ng ahensya. Ito ang pangunahing value-add ng kit para sa defense side.
- **Appellate review.** Mga taon mamaya, ang isang appellate forensic
  reviewer ay maaaring mag-verify ng original acquisition methodology
  laban sa sini-seal na FACT 04 record, sa halip na laban sa
  posibleng-naka-evolve na kasalukuyang recollection ng ahensya.

## Ano ang HINDI pinapalitan ng kit na ito

- Ang Federal Rules of Evidence (o anumang state evidence code).
- Ang mga pamantayan ng pagiging maaasahan ng Daubert / Frye para sa
  expert testimony.
- Ang forensic SOP at CMS ng ahensya.
- Mga obligasyon ng defense discovery sa ilalim ng FRCP 16 / Brady /
  Giglio / state equivalents.
- Mga court order, suppression motions, evidentiary hearings, o anumang
  ibang court-administered na proseso.
- NIST CFTT o anumang ibang regimen ng tool-testing.
- Ang privilege-filter / taint-team protocol ng ahensya.

## Bakit umiiral ang kit na ito sa v0.4.0+

Ito ang ika-8 worked example na ipinasama sa myriam-kit. Sinusundan
nito ang constraint-first structure na napatunayan ng autoresearch na
naidokumento sa `~/Genesis/calc/PROMPT_LIBRARY_v0.md` — ang constraint-
first prompt variant ay nag-iskor ng pinakamataas sa isang weighted
rubric sa maraming example domains. Ang mga opening sections ang
load-bearing na bahagi ng kit; ang manifest content ang madaling bahagi.

Ang disenyo ng kit ay sinasadyang konserbatibo sa publication ng
pangalan ng examiner at agresibo sa "hindi nito itinatatag ang
admissibility" na disclaimer. Ang komunidad ng forensic ay may
naidokumento na kasaysayan ng pagiging inaatake para sa kanilang
forensic work; ang kit ay nagde-default sa mas ligtas na posisyon para
sa mga examiner. Ang mga ahensya sa mga jurisdiction kung saan
inirerequire ang public personal-naming ay maaaring mag-amyenda ng
kanilang fork nang naaayon, ngunit ang default refusal ay pumapabor sa
kaligtasan ng examiner.

## Lisensya

Public domain (CC0). I-fork ito. Hindi kinakailangan ang pagkilala.
