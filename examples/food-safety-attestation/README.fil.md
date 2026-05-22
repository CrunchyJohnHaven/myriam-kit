*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Kit ng Pagpapatunay sa Kaligtasan ng Pagkain

Isang turnkey na halimbawa ng myriam-kit para sa mga tagagawa ng
pagkain, mga inspektor sa kaligtasan ng pagkain, mga third-party
certifier, at mga awtoridad sa regulasyon na nais maglathala ng isang
naka-angkla sa Bitcoin, may ebidensya ng pakikialam, na selyo ng *kung
ano ang sinabi ng mga release test* at *kung anong release decision
ang ginawa*, sa sandali ng paglabas ng batch o pagpirma sa ulat ng
inspeksyon — upang ang tahimik na pagbabago pagkatapos ng paglabas sa
talaan ng pagsusuri, sa release decision, o sa mga pangako sa recall
ay napapansin ng publiko.

---

## Ano ang HINDI ginagawa ng kit na ito (basahin muna)

Ang selyo ay isang kriptograpikong timestamp ng KUNG ALING mga release
test ang ginawa sa KUNG ALING lot, ng KUNG ALING mga akreditadong
laboratoryo, sa ilalim ng KUNG ALING mga pamamaraan, na may KUNG ALING
mga resulta, at kung anong RELEASE DECISION ang ginawa ng QA authority
batay sa mga resultang iyon. Hindi nito masasagot ang anumang tanong
tungkol sa kaligtasan ng pagkain higit pa rito. Ang mga sumusunod ay
**nasa labas ng saklaw ng selyo**:

1. **Pag-iwas sa kontaminasyon.** Ang kit ay nag-aangkla ng kung ano
   ang SINABI ng mga resulta ng pagsubok sa paglabas. Maraming sanhi
   ang kontaminasyon — heterogenous na distribusyon ng mikrobyo sa
   loob ng isang lot, pagmamalabis sa temperatura pagkatapos ng
   paglabas sa distribusyon, mga pagkakamali sa retail handling, mga
   pagkakamali sa paghahanda ng konsumer, mga bagong o hindi
   na-screen na panganib (hal. adulterasyon ng melamine bago naging
   nakagawiang screening ang melamine), supply-chain fraud sa itaas
   ng saklaw ng pagsusuri ng manufacturer. Hindi pinipigilan ng
   selyo ang alinman sa mga ito at hindi rin ito inaangkin.

2. **Garantiya na lahat ng yunit sa isang passing na lot ay
   ligtas.** Ang microbiological contamination sa bulk na produktong
   pagkain ay HETEROGENOUS. Ang Listeria, Salmonella, at STEC
   pathogen ay nangyayari sa mga mababang prevalence na lokal na
   hotspot, hindi pantay na ipinamamahagi. Ang mga sampling plan ng
   ICMSF at Codex ay may dokumentadong, may-hangganang probabilidad
   ng pagtukoy sa kontaminasyong nasa mababang prevalence — ang
   probabilidad ay HINDI 1. Ang isang lot na pumasa sa release
   sampling ay maaari pa ring naglalaman ng mga kontaminadong yunit
   na hindi na-sample. Inaangkla ng selyo ang mga SAMPLE, hindi ang
   bulk. Ang paghihigpit na ito ay tahasang inuulit sa FACT 03 at
   ang nag-iisang pinakamahalagang tapat-na-limitasyon ng kit na
   ito.

3. **Pagsesertipika na ang mga release test ay tapat na isinagawa.**
   Inaangkla ng selyo kung ano ang iniulat ng mga test sa paglabas.
   Ang isang laboratoryong nag-uulat ng mapanlinlang na PASS sa
   paglabas ay nagbubunga ng isang kriptograpikong wastong selyo ng
   mapanlinlang na PASS. Ginagawa ng kit ang tahimik na pagbabago
   sa kalaunan na nahahanap, ngunit hindi nito natutukoy ang
   kasalukuyang fraud. Ang pagtuklas ng kasalukuyang fraud ay
   nangangailangan ng audit, pangangasiwa sa akreditasyon ng lab
   (surveillance sa ISO 17025), mga programa sa proficiency
   testing, at inspeksyon ng regulator — lahat ay nasa itaas ng
   selyo.

4. **Pagpapalit sa FSMA, FSIS, o EU competent-authority na mga
   regulatory submission.** Ang mga record ng paglabas sa ilalim ng
   FSMA, FSIS, EU Regulation (EC) 178/2002, at Codex Alimentarius
   ay pinananatili ayon sa batas at ipinakikita kapag hiniling ng
   regulator. Nagdadagdag ang selyo ng pampublikong tamper-evident
   layer sa IBABAW ng mga submission na iyon; HINDI nito pinapalitan
   ang mga ito. Ang isang sealed na publication ay hindi isang
   regulatory filing.

5. **Paglutas sa mga hindi pagkakasundo sa saklaw ng recall.**
   Maaaring i-selyo ng kit ang mga pangako sa recall na ginawa sa
   paglabas (FACT 06) at isang kasunod na saklaw ng recall bilang
   isang bagong publikasyon; ngunit ang hangganan kung aling mga lot
   ang apektado, aling mga yunit ang ipinadala, aling mga retailer
   ang nakatanggap ng mga ito, at aling mga konsumer ang naapektuhan
   ay isa pa ring trace-back-and-forward investigation. Inaangkla
   ng selyo kung ano ang IPINANGAKO ng manufacturer at kung ano
   ang KANILANG GINAWA sa kalaunan. Hindi nito nilulutas ang
   underlying epidemiological na tanong.

6. **Pagtukoy sa sadyang supply-chain fraud sa itaas ng pagsusuri.**
   Ang 2008 na melamine adulteration ng gatas at infant formula sa
   China ay nagtagumpay dahil hindi kasama ang melamine sa analyte
   panel — ang nitrogen-content protein-equivalent measurement ay
   kasama, at ginaya ito ng melamine. Ang isang sealed FACT 03 na
   may analyte panel na ginagamit noon ay sana ay nangako sa
   publiko sa panel na iyon — ngunit walang gagawin upang matukoy
   ang adulterant sa labas ng panel. Ang halaga ng selyo sa kasong
   iyon ay magiging forensic na pag-angkla ng "ito ang inangkin ng
   manufacturer na susuriin," HINDI prebensyon. Tinutugunan ng
   isang tunay na food-safety regime ito sa pamamagitan ng hindi
   inanunsyong sampling ng regulator na may broad-scope screening
   (LC-MS untargeted methods, halimbawa), na nasa itaas ng selyo
   ng manufacturer.

7. **Pag-angkla sa distribusyon pagkatapos ng paglabas at handling
   ng konsumer.** Sa sandaling umalis ang lot sa pasilidad, ang
   pagmamalabis sa temperatura sa distribusyon, mga maling
   paghawak sa retail, mga pagkakamali sa pagtatago ng konsumer,
   at mga pagkakamali sa paghahanda ng konsumer ay nasa labas ng
   saklaw. Ang selyo ay nakatuon sa event ng paglabas ng
   manufacturer. Ang downstream tamper-evidence ay nangangailangan
   ng hiwalay na mga kit sa distributor, retailer, at (para sa
   institutional consumer tulad ng paaralan at ospital) sa antas
   ng point-of-use.

8. **Pagpapatunay sa kaligtasan ng pagkain sa anumang partikular
   na populasyon.** Ang mga FACT 03 PASS result ay hindi nagdulot
   ng kaligtasan para sa mga buntis na konsumer, sanggol,
   immunocompromised na konsumer, o matatanda, kung saan ang
   Listeria monocytogenes at Salmonella ay nagpapakita ng
   dokumentadong nakataas na panganib kahit sa mga konsentrasyong
   mas mababa sa karaniwang detection limit. Hindi maaaring
   gumawa ang selyo ng safety claim na partikular sa populasyon
   at tumatanggi itong gawin ito (refusal-rule R6).

**Ang seksyong honest-limits sa itaas ay ang loadbearing na bahagi
ng kit na ito.** Ang mga manufacturer na nagtuturing sa "in-selyo
namin ang aming release record" bilang katumbas ng "pinatunayan
namin na ligtas ang aming pagkain" ay maling gumagamit ng primitive.
Dapat sabihin ng kit ng tahasan: *ito ay isang non-repudiation
primitive para sa mga kontemporaryong claim ng manufacturer sa
paglabas, hindi isang patunay ng kaligtasan, hindi isang kapalit
sa pangangasiwa ng regulator, at hindi isang depensa laban sa
mga failure mode na heterogeneous-contamination, supply-chain-
fraud, o post-release-mishandling na pumatay sa mga tao sa nakaraang
mga outbreak.*

---

## Ano ang DAPAT TUMANGGI na i-selyo ng kit na ito

Ang kit ay nakaayos upang tanggihan ang sumusunod na mga fact
pattern kahit pa isinusumite ng isang user na may wastong
manufacturer signing authority:

- **Personal identification ng sinumang manggagawa, supervisor, QA
  staff, bumibisitang inspektor, o third-party auditor.** Pangalan,
  employee ID, badge number, social security number, address sa
  bahay, personal na phone number — wala sa mga ito ang lumalabas
  sa pampublikong selyo. Ang mga role ay pampubliko; ang mga
  pagbubuklod ng tao-sa-role ay isinelyo ng hiwalay at
  matatagpuan sa ilalim ng proseso ng regulator. Ang kaligtasan
  ng manggagawa laban sa retaliation at harassment ay ang
  loadbearing constraint; ang food-safety attestation ay
  maaaring gawin sa role-level. (R1)

- **Tumpak na lokasyon ng pasilidad.** Tatanggapin ang rehiyon
  ng pasilidad (estado o multi-state region); HINDI tatanggapin
  ang tumpak na street address, GPS coordinates, o anumang
  identifier na sapat ang granularity upang pisikal na
  matukoy ang planta sa isang mapa. Ang regulatory
  establishment number ay ang handle ng regulator para sa
  pasilidad; ang mga konsiderasyon sa physical-security at
  worker-safety ay laban sa paglalathala ng pampublikong address
  sa Bitcoin. (R2)

- **Mga indibidwal na pattern ng tauhan sa production shift.**
  Mga iskedyul ng shift, indibidwal na rotation ng manggagawa,
  personal ID ng line operator — wala sa mga ito ang lumalabas
  sa selyo. Hindi dapat maipalabas mula sa pampublikong
  attestation ang pattern-of-life ng indibidwal na mga
  manggagawa. (R3)

- **Mga supplier identity na sumisira sa mga kontrata.** Pangalan
  ng supplier, lokasyon ng pasilidad ng supplier, supplier lot
  code (maliban sa kaso ng supply-chain-contamination kung saan
  ang pagpapangalan sa kontaminadong lot ng supplier ay
  kinakailangan para sa pampublikong kalusugan, at hinahawakan
  sa pamamagitan ng hiwalay na sealed publication) ay HINDI
  ipinapalabas sa release seal. Maraming kontrata sa supply
  ang naglalaman ng mga probisyon sa pagiging kompidensyal;
  hindi sinisira ng selyo ang mga ito sa default. (R4)

- **Mga listahan ng kustomer at mga destinasyon ng distribusyon
  higit pa sa high-level.** Katanggap-tanggap ang high-level
  regional summary; HINDI katanggap-tanggap ang mga partikular
  na listahan ng kustomer (mga retailer, distribution center,
  foodservice account). Ang pagkakakilanlan ng kustomer ay
  kontraktwal na kompidensyal at competitively sensitive;
  nakukuha ng regulator ang listahan ng kustomer sa
  pamamagitan ng nakatatag na recall-coordination channel. (R5)

- **Mga safety claim o legal na konklusyon.** Hindi ise-selyo ng
  kit ang "ligtas ang produktong ito," "natutugunan ng lot na
  ito ang lahat ng angkop na food-safety standard," "GRAS ito
  para sa paggamit na ito," o anumang iba pang konklusyon sa
  kaligtasan o legal. Inaangkla ng kit ang testing record at
  ang release decision, HINDI isang safety conclusion. (R6)

- **Mga pattern ng worker-complaint o whistleblower
  re-identification.** Tumatanggi ang kit na ilathala ang
  anumang pattern na maaaring muling tukuyin ang isang
  manggagawa na nagsampa ng OSHA, USDA, o panloob na
  complaint sa kompanya tungkol sa mga gawi sa food-safety o
  workplace-safety. Ang mga ganitong complainant ay
  pinoprotektahan sa ilalim ng FSMA Section 402 at mga
  katumbas na batas; hindi dapat maging vector ng
  re-identification ang selyo. May sariling kit ang mga
  whistleblower attestation (`examples/whistleblower-manifest`)
  na may mga refusal rule na nakatutok sa use case na iyon. (R7)

- **Pagselyo ng sinumang hindi ang awtorisadong principal ng
  naglalabas na manufacturer.** Maaaring gamitin ng isang
  third-party certifier, kustomer QA team, o independent auditor
  ang parehong kit upang i-selyo ang KANILANG sariling audit
  findings; HINDI nila maaaring i-selyo ang orihinal na
  release decision sa ilalim ng pangalan ng manufacturer. Ang
  signing principal sa FACT 08 ang tanging wastong pumirma para
  doon. (R8)

Ang isang pagtanggi mismo ay maaaring i-selyo bilang isang katotohanan
("Hiniling ng manufacturer na ito ang pag-selyo ng X; tumanggi ang
kit ayon sa refusal-rule Y"), na lumilikha ng pampublikong record
ng pagsubok na maling paggamit.

---

## Ano ang INASELYO ng kit na ito

8 fact sa sandali ng paglabas:

1. **Halimbawang abiso** — idinedeklara ang publikasyon bilang
   isang halimbawa (tinatanggal o pinapalitan ng mga totoong
   attestation ito).
2. **Pagkakakilanlan ng produkto at batch** — pangalan ng produkto,
   kategorya, manufacturer, rehiyon ng pasilidad (HINDI tumpak na
   lokasyon), bersyon ng HACCP-plan + hash, lot ID, mga petsa ng
   produksyon / pack / use-by, bilang ng consumer units, mga
   kinakailangan sa storage, ang tatlong critical control point
   na may mga hash ng logged-record (cook lethality, cooling
   stabilization, post-lethality RTE environment).
3. **Mga resulta ng release testing** — mga microbiological test
   ng tapos na produkto (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), mga chemical / residue test (nitrite,
   veterinary residue, heavy metals), allergen cross-contact
   verification, environmental monitoring summary, bawat isa na
   may SHA-256 ng buong ulat na PDF at ang tahasang
   sample-vs-bulk interpretation constraint.
4. **Methodology at qualification ng laboratoryo** — kung aling
   method (at kung aling bersyon ng method-document) ang
   ginamit kada row, kung aling mga lab ang nagpatakbo ng kung
   aling test, ang status ng ISO/IEC 17025:2017 accreditation
   ng bawat lab at hash ng sertipiko, kamakailang mga resulta ng
   proficiency test, independence statement, deviation / retest /
   OOS record para sa lot na ito.
5. **Release decision** — petsa ng paglabas, role-level release
   authority + counter-sign, buod ng decision-supporting record,
   high-level distribution destinations, mga post-release
   obligation na kinilala sa paglabas, timing-and-irreversibility
   commitment.
6. **Recall at post-market surveillance commitments** — ang
   food-safety analog ng pharmacovigilance: illness-signal
   transparency, recall execution commitments (24h / 72h / 98%
   thresholds), supply-chain contamination response,
   no-silent-retesting commitment, no-post-hoc-specification-
   changes commitment, aggregate safety-signal sharing.
7. **Companion disclosures at refusal record** — hash ng
   corrective-action investigation log, kamakailang inspection
   history, recall history, kilalang open issues sa mga testing
   method na ginamit, role-to-individual binding (in-selyo nang
   hiwalay, na-hash dito), supplier-traceback readiness,
   tahasang listahan ng refusal rules R1-R8 na may anumang
   pagtanggi na isinagawa sa panahon ng paglabas na ito.
8. **Signing principal** — manufacturer + role-level signatory
   (QA Director) + role-level counter-sign (Plant Manager) +
   kriptograpikong impormasyon ng key; katuwiran para sa
   role-level na publikasyon.

Bawat fact ay nagtatapos sa refusal-gate convention: *"Iginigiit
lamang ng fact na ito ang X. Hindi nito iginigiit ang Y"* (kung
saan ang Y ay ang pinakamalapit na failure mode mula sa seksyong
"HINDI ginagawa" sa itaas).

---

## Anong ipinagtatanggol ng kit na ito

- **Tahimik na retroactive na pagbabago sa mga resulta ng release
  test.** Lahat ng test-report PDF ay na-hash. Ang muling pag-hash
  pagkatapos ng paglabas ay nagpapakita ng anumang pagbabago.
- **Mga hindi pagkakasundo tungkol sa kung aling mga method, aling
  bersyon ng method-document, at aling lab ang ginamit.** Ang
  FACT 04 ay nagyeyelo sa methodology at sa accreditation status
  ng lab sa paglabas. Ang mga huling "MLG 4.13 talaga ang ginamit
  namin, hindi 4.12" claim ay maaaring publikong pabulaanan.
- **Retroactive re-spec para sa isang out-of-spec batch.** Kung
  ang isang resulta ng release-test ay aktwal na isang borderline
  PASS na muling iniuri bilang FAIL pagkatapos ng paglabas, ang
  mga sealed report hash ay nagpapatunay kung ano ang sinabi ng
  orihinal na resulta sa PDF. Magkasunduang, ang isang borderline
  OOS na tahimik na na-retest sa PASS nang walang disclosure ay
  matutukoy kung ang no-silent-retesting commitment ng FACT 06 ay
  ihinambing sa kalaunan sa isang hindi sealed na amendment.
- **Tahimik na pagminimal ng saklaw ng recall.** Ang mga recall
  commitments sa FACT 06 (24h notification, 72h initiation, 98%
  recoverability) ay isinelyo; ang hindi pagtupad sa mga ito ay
  publikong nakikita.
- **Post-hoc na pag-narrate muli ng corrective-action history.**
  Ang FACT 07 corrective-action log hash ay nagyeyelo sa kung ano
  ang SINABI ng kompanya na ginawa nila pagkatapos ng EMP
  presumptive; ang mga huling "ginawa namin nang higit / mas
  kaunti kaysa diyan" claim ay maaaring publikong pabulaanan.
- **Selective omission ng companion disclosures.** Ang FACT 07
  ay nagtatakda ng inaasahang mga kategorya ng disclosure
  (inspection history, recall history, method-advisory review,
  traceback readiness); ang isang walang laman na kategorya ay
  dapat tahasang attested ("wala sa oras ng paglabas"), upang
  ang isang huling "hindi namin naisip na may kaugnayan iyon"
  ay maaaring publikong pabulaanan.
- **Pagpapalit ng accreditation status ng ibang lab.** Ang
  FACT 04 ay nagyeyelo sa ISO 17025 scope at certificate hash
  ng bawat lab sa paglabas; ang isang huling pagpapalit ng
  non-accredited na lab ay publikong natutukoy.

Ang kit ay **hindi** nagtatanggol laban sa kontemporaryong
korapsyon — ang isang team na sinasadyang nag-seselyo ng maling
test results sa oras ng paglabas ay nagbubunga ng isang
kriptograpikong wastong selyo ng mga maling test result. Tapat ang
primitive tungkol dito: ito ay isang non-repudiation primitive
para sa kontemporaryong claims ng manufacturer, hindi isang
patunay na tama ang mga claim na iyon.

---

## Historical mortality precedent

Ang kit ay magkakaroon ng kapaki-pakinabang na angkla — *hindi
isang resolusyon* — sa mga nakaraang food-safety failures. Upang
maiwasan ang paninirang-puri sa mga indibidwal (karamihan ng mga
food-safety failures ay corporate, hindi indibidwal; ilang
litigatedang criminal at ilang hindi), ang mga reference na ito ay
naglalarawan sa outbreak sa pamamagitan ng taon at pathogen at
nagpapangalan sa kasangkot na entity lamang kapag ang kontaminasyon
ay publikong naitalaga sa pamamagitan ng recall notice o court
record.

- **2008 China melamine adulteration ng infant formula at dairy
  (Sanlu Group + iba pa).** Hindi bababa sa anim na pagkamatay ng
  sanggol at ~300,000 sakit na maiuugnay sa melamine-spiked dairy
  products na idinisenyo upang mapanlinlang na palakihin ang
  apparent protein content sa Kjeldahl nitrogen-based assays.
  Sumunod ang convictions sa mga korte ng PRC, kabilang ang mga
  capital sentence. *Hindi nito mapipigilan ng selyo ito* — ang
  melamine ay nasa labas ng karaniwang analyte panel. Ang selyo
  ay sana ay publikong nakikipag-commit sa kung ANO ang panel,
  na ginagawang forensically clear ang saklaw ng post-incident
  expansion ng karaniwang screening.

- **2011 European STEC O104:H4 outbreak (fenugreek sprouts na
  natunton sa isang sakahan sa Alemanya).** 53 patay, ~3,950 na
  sakit sa maraming bansa sa Europa; sa wakas ay natunton sa
  fenugreek seeds na na-import mula sa Egypt at ginawang sprout
  sa isang German producer. Ang traceback ay hinadlangan ng
  hindi pare-parehong lot-level documentation sa multi-country
  supply chain. *Hindi nito mapipigilan ng selyo ang kontaminasyon
  ng seed lot* (ang kontaminasyon ay sa itaas ng mga test ng
  sprouter); inaangkla nito kung ano ang inangkin ng release
  tests ng sprouter at, kung ginamit sa antas ng seed importer,
  kung ano ang inangkin ng imported-seed handling, na ginagawang
  mas mabilis ang traceback.

- **2015 Blue Bell Creameries Listeria monocytogenes outbreak
  (United States).** 3 patay, 10 sakit sa maraming estado;
  humantong sa national recall at sa 2020 federal criminal
  conviction ng Blue Bell sa misdemeanor food-safety charges,
  kung saan pumasok ang kompanya sa deferred-prosecution
  agreement at nagbayad ng $19.35 million. Sumunod na civil
  litigation. *Hindi nito mapipigilan ng selyo* ang in-plant
  Listeria environmental contamination; forensic na inaangkla
  nito ang mga record ng environmental-monitoring program,
  ginagawang masasagot ang anumang post-incident na tanong na
  "ano ang ipinakita ng EMP sa mga buwan bago ang outbreak"
  laban sa isang tamper-evident timestamped record sa halip ng
  laban sa mga huling-ginawang dokumento.

- **2018 multistate STEC O157:H7 outbreaks na nauugnay sa
  romaine lettuce (Yuma growing region, pagkatapos ay Salinas
  growing region).** Hindi bababa sa 5 patay at ~210 sakit sa
  maraming outbreaks noong taong iyon. Pinapalubha ang traceback
  ng mixed-source bagged product. *Hindi nito mapipigilan ng
  selyo* ang kontaminasyon sa antas ng field / irrigation-water
  (sa itaas ng manufacturer); forensic na inaangkla nito ang
  intake-testing at release-testing record ng bawat processor,
  na ginagawang mas mabilis ang trace-back at mas kriptograpikong
  maipagtatanggol ang pampublikong record laban sa mga huling
  hindi pagkakasundo.

- **Peanut Corporation of America Salmonella Typhimurium outbreak
  (2008-2009, United States).** 9 patay, ~714 sakit; humantong
  sa 2014-2015 federal criminal convictions ng mga PCA
  ehekutibo, kabilang ang 28-taong prison sentence para sa CEO
  sa mga conspiracy at obstruction charge. *Hindi nito
  mapipigilan ng selyo* ang kontaminasyon, ang under-
  investigation ng positive in-plant Salmonella test, o ang
  desisyon sa antas-ehekutibo na ipadala ang produkto laban sa
  mga positive na finding na iyon. Ito SANA ay nagpapaliwanag
  ng forensically clear, sa pagsubok, sa kung ano ang SINABI ng
  test results sa sandali ng kanilang pagkalikha — ginagawang
  higit na nakaangkla laban sa documentary modification ang
  kaso ng prosekusyon laban sa kontemporaryong mga email ng
  maling-narratibo.

Sa bawat isa sa mga kasong ito, ang kit ay sana ay nagbigay ng
mas malinis na forensic timeline. Sa wala sa mga kasong ito ang
kit mismo ay sana ay nakapigil sa mga pagkamatay. Ang selyo ay
forensic infrastructure, hindi prevention infrastructure. Ang
pagkakaiba na iyon ay ang katapatan ng kit.

---

## Kailan gagamitin ang kit na ito

- Ang inyong operasyon ng pagmamanupaktura ay may matatag na
  programa ng HACCP / Preventive Controls at nais magdagdag ng
  isang Bitcoin-anchored na pampublikong attestation bilang
  tamper-evident layer sa ibabaw ng umiiral na workflow ng
  release-documentation.
- Ikaw ay isang small-to-mid-sized manufacturer o isang
  manufacturer sa isang jurisdiction na may mas mahinang
  regulatory infrastructure, nais mong i-angkla ang mga batch
  record laban sa isang globally verifiable timeline — para sa
  tiwala sa export-market, para sa pagtugon sa customer-audit, o
  para sa pakikilahok sa mga boluntaryong inisyatibong
  transparency.
- Ikaw ay isang food-safety inspector o third-party certifier at
  nais maglathala ng isang tamper-evident audit-finding seal sa
  sign-off, upang ang audit findings ay hindi maaaring tahimik
  na baguhin sa kalaunan sa pamamagitan ng kasunduan sa pagitan
  ng manufacturer at certifier.
- Inaasahan mong haharapin ng lot na ito ang malaking
  downstream scrutiny (export market, high-risk category gaya
  ng RTE meat o infant formula, novel ingredient, kamakailang
  kasaysayan ng recall).
- Maaari mong ilathala ang nakalistang fact set nang hindi
  binabali ang mga refusal rule R1-R8. Kung ang inyong mga fact
  ay mangangailangan ng R1-R8 break, huwag gamitin ang kit;
  ayusin muna ang mga data input.
- Sinuri ng manufacturer counsel ang publikasyon na plano.
  May mga implikasyon sa product-liability exposure ang
  pampublikong publikasyon ng isang artifact na may lot-
  identifier; ang counsel review ay hindi opsyonal.

## Kailan HUWAG gamitin ang kit na ito

- **Huwag gamitin bilang kapalit sa FSMA / FSIS / EU regulatory
  records.** Ang selyo ay *additive*, hindi replacement. Ang
  inyong mga statutory release record, HACCP plan, CCP log, at
  recall plan ay hindi nagbabago.
- **Huwag gamitin bilang safety claim.** Ang pag-selyo sa isang
  passing release record ay hindi nagtatag na ligtas ang produkto;
  itinatag nito na ang record ay may byte content na ito sa
  oras na ito. Tatanggihan ng refusal-rule R6 ang anumang safety
  conclusion.
- **Huwag gamitin upang ilathala ang mga supplier identity,
  customer list, pangalan ng manggagawa, o address ng pasilidad.**
  Umiiral ang mga refusal rule R1-R5 para sa human-safety at
  contract na mga kadahilanan; huwag baguhin ang kit upang
  talunin ang mga ito nang hindi kumukunsulta sa counsel.
- **Huwag gamitin sa ilalim ng pressure na mag-selyo bago
  matapos ang release testing.** Ang partial-data seal ay
  maling-kumakatawan sa estado ng release decision.
- **Huwag gamitin bilang legitimacy theater.** Ang isang selyo ng
  isang mahinang dinisenyong sampling plan o isang mahinang
  napiling analyte panel ay isang permanenteng pampublikong
  record ng kakulangan, hindi isang depensa laban dito. Pumuputol
  ang primitive sa parehong direksyon; iyon ang katapatan nito.
- **Huwag gamitin sa panahon ng aktibong recall situation bilang
  kapalit sa recall coordination ng regulator.** Ang isang bagong
  publikasyon ng MYRIAM na nag-aangkla sa saklaw ng recall ay
  angkop PAGKATAPOS magsimula ang regulator-coordinated recall;
  hindi ito kapalit sa recall channel ng regulator.

## Paano i-fork ang kit na ito para sa isang totoong release

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**KRITIKAL NA TIMING:** mag-selyo sa sandali ng QA release, BAGO
ipinamamahagi ang lot (bago umalis ang unang truck sa pasilidad).
Ang isang selyo pagkatapos magsimula ang distribusyon ay may
halaga pa rin ngunit hindi nito malinis na nakakaangkla ang
pre-distribution na estado. Ang tamang window ay sa pagitan ng
QA release signature at ng unang distribution movement.

**KRITIKAL NA PAGSUSURI:** bago mag-selyo, ipasa ang publikasyon
sa pangalawang QA reviewer (hindi ang lead) at sa company counsel.
Sa sandaling na-selyo, ang publikasyon ay permanente.

## Pagsasama sa umiiral na food-safety infrastructure

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  Ang sealed publication URL o IPFS CID ay maaaring i-reference
  sa Food Safety Plan documentation bilang ang public-attestation
  artifact para sa lot na ito.
- **USDA FSIS HACCP plans at release records.** Ang sealed
  release record ay nakaupo sa tabi ng mga FSIS-required HACCP
  record; ang selyo ay nagre-reference sa HACCP-plan-version
  hash (FACT 02) kaya ang mga huling hindi pagkakasundo tungkol
  sa kung aling bersyon ng plan ang ipinatupad ay publikong
  mapapabulaanan.
- **Codex Alimentarius / HACCP principles** (Codex CAC/RCP
  1-1969 Rev. 4-2003). Ang selyo ay nakikipag-commit sa
  seven-principle HACCP outputs (hazard analysis, CCPs, critical
  limits, monitoring, corrective actions, verification,
  recordkeeping) para sa lot na ito.
- **ISO 22000:2018 (Food Safety Management Systems).** Ang selyo
  ay maaaring i-reference bilang bahagi ng management-review
  evidence trail; hindi nito pinapalitan ang ISO 22000
  certification.
- **FSSC 22000 v6 certification scheme.** Tugma bilang isang
  additive transparency layer; ang auditor ng FSSC ay maaaring
  i-verify ang selyo sa panahon ng surveillance.
- **EU Regulation (EC) 178/2002 (General Food Law) Article 18
  (traceability) at Article 19 (recall notification).** Ang
  selyo ay nagco-commit sa one-tier-back traceback readiness
  (FACT 07) at recall commitments (FACT 06) ng manufacturer;
  hindi nito pinapalitan ang statutory Article 19 notification
  obligation.
- **EU Hygiene Package (Regulations 852/2004, 853/2004,
  854/2004, 882/2004).** Tugma; ang selyo ay nagre-reference sa
  katumbas ng HACCP at own-checks record ng Hygiene Package.
- **BRCGS / SQF private-standard schemes.** Tugma bilang isang
  additive transparency layer.
- **Public-health surveillance systems (CDC PulseNet, FoodNet,
  IFSAC; EU EFSA / ECDC).** Nasa labas ng saklaw ng selyo nang
  direkta, ngunit ang FACT 06 ay nakikipag-commit sa
  manufacturer na lumahok at i-selyo ang anumang signal-
  correlation events bilang mga bagong publikasyon ng MYRIAM.

## Ano ang HINDI pinapalitan ng kit na ito

- FDA Food Facility Registration o USDA FSIS Establishment
  approval.
- Ang inyong nakasulat na Food Safety Plan / HACCP Plan sa
  ilalim ng FSMA / FSIS.
- CCP monitoring logs at mga corrective-action record.
- ISO 17025 lab accreditation oversight.
- Mga programa sa proficiency testing.
- Regulator inspection (FSIS continuous inspection, FDA
  periodic inspection, EU competent-authority inspection).
- Public-health surveillance (CDC, EFSA, ECDC, national
  equivalents).
- Recall coordination channels (FDA Reportable Food Registry,
  FSIS recall coordination, EU RASFF, national equivalents).
- Worker safety at mga food-worker training program.

## Bakit umiiral ang kit na ito sa v0.4.0+

Ito ay isa sa mga worked example na ipinapadala kasama ng
myriam-kit. Sinusunod nito ang constraint-first README structure
na napatunayan ng autoresearch na nakadokumento sa
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — ang constraint-first
prompt variant ay nakakuha ng pinakamataas na puntos sa weighted
rubric sa iba't ibang example domain, dahil ang food-safety
attestation ay eksaktong domain kung saan mapanganib ang
pagmamalabis sa kung ano ang pinatutunayan ng selyo: namatay ang
mga tao, mamamatay, sa mga failure na hindi kayang pigilan ng
selyo. Ang mga panimulang seksyon ay ang loadbearing na bahagi ng
kit; ang nilalaman ng manifest ay ang madaling bahagi.

Ang mga default ng kit ay sadyang conservative sa worker-name
publication, conservative sa precision ng facility-location,
conservative sa supplier at customer identity, at agresibo sa
"hindi nito tinatatag ang kaligtasan" na disclaimer. Ang
food-safety community ay may dokumentadong kasaysayan ng
overstated certification language; ang kit ay nag-default sa
posisyong pinakamababang posibilidad na basahin bilang safety
guarantee. Maaaring iangkop ng mga manufacturer sa mga
jurisdiction kung saan iba ang mga partikular na pampublikong
disclosure requirement ang kanilang fork nang naaayon, ngunit
ang default refusals ay pumapaboran sa kaligtasan ng manggagawa
at sa tapat na saklaw.

## Lisensya

Public domain (CC0). I-fork ito. Walang kinakailangang
attribution.
