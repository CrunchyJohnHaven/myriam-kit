*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Kit ng Pagseselyo ng Atestasyon ng Gastusin Pampubliko

Isang turnkey na halimbawa ng myriam-kit para sa mga munisipal, estado,
panlalawigan, at pambansang gobyerno na gustong cryptographically i-anchor
ang mga rekord ng pag-execute ng badyet (mga pagkakaloob ng kontrata,
mga pagbabayad, mga pagtanggap ng deliverable) sa sandali ng pag-isyu,
upang ang tahimik na retroactive na pagbabago ng mga rekord ng gastusin
pampubliko ay maging publicly detectable.

Ang selyo ay isang **forensic anchor**, hindi isang sertipikasyon ng
integridad. Itinatala nito kung ano ang iniulat ng awtoridad sa pananalapi
sa araw ng pag-uulat nito, sa isang anyo na hindi mababago nang tahimik
sa hinaharap nang hindi gumagawa ng publicly visible na cryptographic
discrepancy.

---

## Ano ang HINDI ginagawa ng kit na ito (basahin muna)

Ang selyo ay isang cryptographic timestamp ng kung ano ang inatestasyon.
Hindi nito maaaring i-verify kung ang inatestasyon ay **legal, patas, o
tapat**. Ang sumusunod na mga failure mode ay **nasa labas ng saklaw ng
selyo**:

1. **Korupsyon sa upstream at suhol.** Kung ang isang pagkuha ay rigged,
   ang isang vendor ay pinili dahil sa suhol, ang isang sole-source
   justification ay pinanggawa, o ang isang kontrata ay pinalaki ng isang
   napagkasunduang kickback percentage — ang selyo ay nag-aanchor sa
   as-recorded transaction kasama ang pinalaking presyo at pinaboran na
   vendor sa mataas na integridad. Ang selyo ay nagmamasid sa output ng
   sistema ng pananalapi; wala itong visibility sa korupsyon sa upstream
   ng pag-isyu. Ang *Operação Lava Jato* ng Brazil ay nagdokumento ng
   systematic ~3% cartel-administered na suhol sa libu-libong kontrata
   ng Petrobras na maaaring naseyo sa pag-isyu na para bang routine
   lamang.

2. **Pagtatago ng beneficial ownership sa pamamagitan ng shell
   companies.** Ang isang kontrata na ipinagkaloob sa "Acme
   Construction Ltd." ay naseyo gamit ang pangalan ng entidad sa
   pampublikong registry. Kung ang "Acme" ay sa katotohanan ay
   kontrolado ng isang undisclosed na politically exposed person, o
   isa sa dose-dosenang shell companies na kontrolado ng isang solong
   cartel, ang selyo ay nag-aanchor sa surface entity. Ang
   transparency ng beneficial ownership ay isang HIWALAY na regimen
   (FATF Recommendation 24, EU 5AMLD/6AMLD, US Corporate Transparency
   Act) na ang output ay nangangailangan ng sariling sealing protocol.

3. **Accounting fraud sa upstream ng pag-isyu.** Kung ang awtoridad sa
   pananalapi mismo ay nagpapanggap ng rekord bago iseyo — phantom
   contracts, ghost employees sa payroll, fictitious na deliverable
   acceptances — ang selyo ay nag-aanchor sa pagpapanggap. Hindi
   matutuklasan ng selyo na mali ang rekord sa sandaling ito ay
   naitala; matutukoy lamang nito na ang rekord ay nabago PAGKATAPOS
   ng pagseselyo.

4. **Selective publication / cherry-picking.** Maaaring mag-publish
   ang isang awtoridad sa pananalapi ng *subset* ng mga transaksyon —
   ang malilinis — at iseyo lamang ang mga iyon. Ang selyo ay
   nag-aanchor sa kung ano ang nasa publikasyon; hindi ito
   nag-aanchor sa universe ng mga transaksyon na dapat na nasa
   publikasyon. Ang FACT 07 (companion disclosures at refusal record)
   ng kit na ito ay ang structural na depensa, ngunit nakadepende ito
   sa pagiging tapat ng issuing authority tungkol sa kung ano ang
   pinipili nitong hindi iseyo.

5. **Off-books o extrabudgetary spending.** Ang public expenditure na
   nai-route sa pamamagitan ng state-owned enterprises, sovereign
   wealth funds, special-purpose vehicles, o extrabudgetary trust
   accounts ay maaaring hindi lumitaw sa badyet na nai-anchor ng
   selyo. Itinatala ng selyo kung ano ang iniulat sa loob ng
   budgetary system; ang spending sa labas ng system ay nasa labas
   ng saklaw ng selyo. Ang mga dispute ng Iraq Coalition Provisional
   Authority (CPA) 2003-2004 ay kasangkot sa humigit-kumulang USD 9
   bilyon sa cash disbursements na ang mga rekord ay bahagyang
   nawala; ang pagseselyo ng kung ano ang mga rekord ay umiiral sa
   sandali ng pagbabayad ay magkaka-anchor sa kanila, ngunit hindi
   gagawa ng mga rekord na hindi pinanatili ng CPA.

6. **Post-issuance "explanation" pressure.** Ang isang naseyong
   overrun, isang naseyong sole-source, o isang naseyong change
   order ay maaaring muling i-narrate sa ibang pagkakataon sa
   anumang framing na nais ng political authority. Ang selyo ay
   nag-aanchor sa mga KATOTOHANAN sa petsa ng pag-isyu, ngunit hindi
   nito pinag-uunahan ang narrative na susuportahan ng mga
   katotohanang iyon sa ibang pagkakataon.

7. **Coerced attestation.** Kung ang responsible na finance principal
   ay napilitang pumirma sa isang atestasyon na nagrepresenta
   nang mali sa mga transaksyon, ang selyo ay nag-aanchor sa
   coerced na atestasyon kasama ang coerced na lagda. Vine-verify
   ng selyo kung SINO ang pumirma (FACT 08), hindi BAKIT sila
   pumirma. Ang pagseselyo ng coerced na atestasyon ay gumagawa ng
   permanenteng pampublikong rekord ng coerced output — kapaki-pakinabang
   para sa later accountability, ngunit hindi depensa laban sa
   coercion sa sandali iyon.

8. **Paghahambing sa mga jurisdiction.** Ang isang naseyong
   gastusin ay nababasa lamang laban sa legal regime ng issuing
   jurisdiction nito. "Bakit nagbayad ang Munisipalidad X ng Y para
   sa serbisyo Z kapag ang Munisipalidad W ay nagbayad lamang ng
   V?" ay isang comparative-analysis na tanong sa downstream ng
   pagseselyo. Ang cross-jurisdiction benchmarking ay isang
   analytical task sa sealed data, hindi isang property ng selyo.

**Ang honest-limits section sa itaas ay ang load-bearing na bahagi ng
kit na ito.** Ang mga finance officials at politiko na naniniwala na
ang pagseselyo ay katumbas ng integridad ay gagamitin ang kit na ito
bilang panangga. Dapat sabihin ng kit nang malinaw: ito ay isang
*non-repudiation primitive para sa sandali ng pag-isyu*, hindi isang
patunay ng integridad ng gastusin.

---

## Ano ang DAPAT TUMANGGI iseyo ng kit na ito

Ang kit ay naka-configure na tumanggi sa sumusunod na mga pattern ng
fact kahit na isumite ng isang user na may valid signing authority:

- **Mga indibidwal na pangalan ng empleyado ng gobyerno sa ibaba ng
  principal-signing level.** Walang fact ang maaaring magpangalan ng
  mga indibidwal na staff ng procurement-office, indibidwal na
  treasury clerks, indibidwal na members ng scoring-panel, o sinumang
  natural person na hindi nasa public-facing accountability role. Ang
  exposure-to-retaliation risk para sa line staff ay lumalampas sa
  benepisyo ng transparency; ang kanilang mga identity ay naseyo sa
  internal controls (FACT 05 hash ng sign-off log), hindi sa katawan
  ng atestasyon.

- **Vendor PII.** Walang fact ang maaaring magsama ng supplier bank
  account numbers, indibidwal na pangalan ng supplier-employee,
  mga supplier home addresses, mga supplier tax IDs ng natural
  persons, internal pricing breakdowns na naglalaman ng supplier
  cost structure, o anumang iba pang commercial-PII field na ang
  publication ay nakakapinsala sa interes ng supplier nang hindi
  nagsisilbi sa anti-corruption. Ang ganitong impormasyon ay
  maaaring HASHED (FACT 05) ngunit hindi mai-publish.

- **Mga security-classified expenditures.** Ang mga gastusin na
  classified sa ilalim ng national-security statutes ay HINDI eligible
  para sa pagseselyo sa ilalim ng kit na ito. Ang classified
  handling ay isang ibang problema na may iba't ibang cryptographic
  at legal requirements. Ang exclusion mismo ay nai-disclose sa FACT
  07 R3 upang malaman ng reader na ang publikasyon ay bahagi sa
  pagdidisenyo.

- **Civil enforcement ng tax obligations laban sa identified
  natural persons.** Bagaman ang enforcement costs ay public
  expenditures, ang pagpapangalan sa indibidwal na taxpayers sa
  ilalim ng enforcement ay tinanggihan: ang privacy harm ay
  lumalampas sa transparency benefit, at parallel transparency ay
  umiiral sa ilalim ng tax-court reporting.

- **Pre-issuance transactions.** Walang kontrata bago ang formal
  award; walang disbursement bago ang formal issuance. Ang
  pagseselyo ng draft contract o ng pending payment na para bang
  na-execute ay gumagawa ng false certainty.

- **Pagseselyo ng sinuman maliban sa responsible finance principal.**
  Ang isang contractor, vendor, council member, journalist, o
  observer ay hindi maaaring magseyo ng "rekord ng public spending"
  bilang kapalit ng finance authority na nag-isyu nito. (Maaari
  nilang i-seal ang sarili nilang mga observations sa ilalim ng
  sarili nilang principal, sa hiwalay na publikasyon.)

- **Mga framing na "Free of corruption."** Ang kit ay tumatanggi
  na mag-seal ng anumang framing ng anyo na "ang gastusing ito ay
  legal at walang corruption" o "ang procurement ay demonstrably
  patas." Ang ganitong mga claim ay epistemically beyond ng domain
  ng kit.

- **Mga publikasyon na nag-omit ng FACT 07 companion disclosures.**
  Ang isang publikasyon ng mga transaksyon nang walang kasamang
  disclosure at refusal record ay hindi isang legitimate MYRIAM
  publication sa ilalim ng kit na ito.

Ang refusal mismo ay maaaring i-seal bilang isang fact ("Ang party
na ito ay humiling na i-seal ang X; tumanggi ang kit ayon sa
refusal-rule Y"), na gumagawa ng pampublikong rekord ng tinangkang
maling paggamit. Sa isang domain kung saan documented ang political
pressure sa finance officials, ang isang rekord ng *tinanggihang*
mga kahilingan ay mismong isang integrity signal.

---

## Ano ang ISINESEYO ng kit na ito

8 facts sa sandali ng atestasyon ng budget-execution:

1. **Example notice** — nagdedeklara na ang publikasyon ay isang
   halimbawa (tinatanggal o pinapalitan ng tunay na mga atestasyon
   ito).
2. **Jurisdiction at legal basis** — kung aling government entity
   ang nag-iisyu, sa ilalim ng aling statutory authority, sa aling
   fiscal period.
3. **Appropriation o budget reference** — ang mga specific lines sa
   adopted budget na ine-execute, kasama ang mga hash ng budget
   instrument at anumang mga amendments / transfers / reprogrammings
   na inilapat.
4. **Contract o disbursement manifest** — per-transaction record:
   halaga, vendor legal entity name (walang individual PII),
   layunin, petsa, procurement type, award basis, contract document
   hash.
5. **Supporting document hashes** — SHA-256 ng mga solicitations,
   evaluations, executed contracts, change orders, pay applications,
   deliverable acceptance forms, treasury ledger entries, controls
   sign-off logs. Mga hash lamang, hindi nilalaman — upang protektahan
   ang commercial at personal PII habang pinagana ang re-hash
   verification.
6. **Audit at oversight state** — aling inspector-general body ang
   may jurisdiction, aling supreme audit institution, aling
   prosecutorial body ang may corruption-offense jurisdiction, mga
   audit deadlines, kasalukuyang state ng anumang ongoing review.
7. **Companion disclosures at refusal record** — mga pending
   procurement protests, pending internal investigations,
   outstanding FOI requests, dissenting reviews, mga kilalang
   budget-line overruns; explicit list ng mga pattern na tinanggihan
   ng kit na i-seal.
8. **Signing principal** — responsible finance official + role +
   statutory accountability + co-signatories sa ilalim ng dual
   control; kung ano ang ina-attest at hindi inaattes ng bawat
   signatory sa personal na batayan.

Ang bawat fact ay nagtatapos sa refusal-gate convention: *"Ang fact
na ito ay nag-a-assert lamang ng X. Hindi ito nag-a-assert ng Y"*
(kung saan ang Y ay ang pinakamalapit na failure mode mula sa
seksyong "HINDI ginagawa").

---

## Ano ang ipinagtatanggol ng kit na ito

- **Tahimik na post-issuance revision ng contract amounts.** Anumang
  pagbabago sa anumang halaga sa FACT 04 ay gumagawa ng ibang
  SHA-256, ibang Merkle root, nabigo ang OTS verification.
- **Tahimik na vendor substitution.** Ang pagpapalit sa "Vendor A"
  ng "Vendor B" sa isang naipakaloob nang kontrata ay matutukoy mula
  sa mga sealed bytes.
- **Backdating ng change orders.** Pinapatag ng FACT 04 ang
  change-order date at rationale sa pag-isyu; anumang later claim
  ng "ito ay laging napagkasunduang scope" ay dapat harapin ang
  sealed change-order record.
- **Tahimik na pagkawala ng unfavorable transactions.** Lahat ng
  mga transaksyon na inisyu sa panahon ay nasa FACT 04 sa ilalim ng
  isang Merkle root. Ang pag-publish ng subset ay matutukoy mula sa
  leaf-hash list.
- **Companion-disclosure suppression.** Pinapatag ng FACT 07 ang
  pending-protest, pending-investigation, at outstanding-FOI state
  sa sandali ng atestasyon. Anumang later claim ng "hindi namin
  nabalitaan ang protest na iyon" ay publicly diffable.
- **Audit-jurisdiction drift.** Pinapatag ng FACT 06 kung aling
  bodies ang may oversight jurisdiction sa mga sealed transactions.
  Ang later claim na hindi nagkaroon ng authority ang isang IG ay
  dapat harapin ang sealed jurisdiction record.
- **Refusal-record erasure.** Itinatala ng FACT 07 kung ano ang
  tinanggihan ng kit na i-seal; anumang later claim ng "wala kaming
  tinanggihan kahit kailan" ay sumasalungat sa sealed record.

---

## Mga historikal na kaso kung saan tutulong ang kit

Ang kit ay gagawa ng kapaki-pakinabang na **forensic anchor** —
*hindi isang ayos, hindi prevention, hindi substitute para sa
criminal prosecution* — sa mga publicly-documented na kaso na
kasangkot sa tahimik na retroactive na pagbabago ng mga rekord ng
public-spending:

- **Brazil — *Operação Lava Jato* / Petrobras lineage (2014-2021).**
  Idinokumento ng mga federal prosecutor ng Brazil ang isang cartel
  ng mga major construction firms na sa mahigit isang dekada ay
  nagbayad ng mga suhol na mga ~3% sa mga kontrata ng Petrobras at
  iba pang federal infrastructure, na ang suhol ay na-route sa mga
  politiko at sa cartel's own price coordination. Ang mga kontrata
  bilang iniisyu ay nagmumukhang routine; ang corruption ay nasa
  upstream ng pag-isyu. Ang sealing kit ay HINDI mapipigilan ang
  Lava Jato (ang mga suhol ay naka-embed sa presyo BAGO umabot ang
  kontrata sa seal), ngunit i-aanchor ang mga termino ng kontrata
  sa pag-isyu — ginagawang enormously mas mura ang later forensic
  reconstruction ng "ano ang aktwal na sinabi ng bawat kontrata noong
  ito ay nilagdaan." Ang investigative cost ng Lava Jato ay malaking
  bahagi ang cost ng pag-assemble ng mga timeline mula sa
  inconsistent archived records.

- **European Union — regional development fund disputes (multiple
  member states, 2010s-2020s).** Ang annual reports ng European
  Court of Auditors ay paulit-ulit na nakilala ang material error
  rates sa European Structural and Investment Fund (ESIF) at Cohesion
  Fund expenditures, sa ilang taon ay lumalagpas sa materiality
  threshold. Ang mga dispute tungkol sa "kung ano ang aktwal na
  ininaangkin" laban sa "kung ano ang aktwal na inihatid" ay
  paulit-ulit na nangyari dahil ang claim documentation ay maaaring
  i-revise sa pagitan ng submission at audit. Ang per-issuance
  MYRIAM sealing ng claim-as-submitted ay i-aanchor ang nilalaman
  ng bawat claim sa submission, ihihiwalay ang "kung ano ang
  ininaangkin ng beneficiary sa oras na iyon" mula sa "kung ano ang
  napag-alaman ng post-audit reconstruction."

- **Iraq — Coalition Provisional Authority (CPA) disbursements,
  2003-2004.** Ang CPA ay nag-disburse ng humigit-kumulang USD 9
  bilyon sa cash mula sa Development Fund for Iraq na may
  dokumentasyon na pinangalan ng Special Inspector General for Iraq
  Reconstruction (SIGIR) at later audit reports na substantially
  incomplete. Ang mga dispute tungkol sa disbursement records ay
  nagpapatuloy hanggang dalawang dekada pagkatapos. Ang pagseselyo
  sa sandali ng disbursement ay hindi gagawa ng mga rekord na hindi
  pinanatili ng CPA — ngunit kung saan may anumang rekord na umiiral
  (handwritten ledgers, dated transfer authorizations), ang isang
  contemporaneous seal ay i-aanchor ang bytewise state ng rekord na
  iyon sa sandali ng pag-isyu, ihihiwalay ang "rekord sa oras na
  iyon" mula sa "rekord bilang later reconstructed."

- **Greece — sovereign debt at public-expenditure-reporting
  revisions (2009-2010).** Ang Eurostat audits sa 2009-2010 ay
  nag-document ng substantial revisions sa previously reported
  Greek fiscal data, na ang methodology ng revision mismo ay
  contested. Ang pagseselyo ng quarterly expenditure reports sa
  sandali ng original publication ay gagawing publicly diffable
  ang *delta* sa pagitan ng original at revised reports sa halip
  na reconstructible lamang sa pamamagitan ng archive comparison.
  Ang seal ay hindi mapipigilan ang underlying methodological
  dispute, ngunit i-aanchor ang bawat quarter na iniulat sa sandali
  ng original report.

- **United Kingdom — pandemic procurement (2020-2022).** Ang UK
  National Audit Office at parliamentary committee reports ay
  nakilala ang mga procurement processes sa 2020-2021 kung saan
  ang mga kontrata ay ipinagkaloob sa ilalim ng emergency provisions
  na may reduced competition at reduced documentation; ang ilang
  awards ay later modified, cancelled, o settled. Ang per-issuance
  sealing ng bawat emergency-procurement award ay i-aanchor ang
  award rationale at terms sa sandali ng award, ginagawang ang
  later modifications na publicly visible na delta sa halip na
  tahimik na binagong rekord.

- **South Africa — state-capture-era public-enterprise contracts
  (~2010-2018).** Ang Zondo Commission ay nag-document ng mga
  kontrata sa ilang state-owned enterprises (Eskom, Transnet, Denel)
  na ang dokumentasyon ay variously incomplete, revised, o
  contested. Ang pagseselyo ng bawat contract award sa pag-isyu ay
  i-aanchor ang as-awarded state ng rekord, ihihiwalay ang later
  forensic-reconstruction outputs mula sa contemporaneous record.

Ang kit ay HINDI mapipigilan ang underlying corruption sa anumang
kaso sa itaas. Sa ilang kaso, ang underlying problem ay ang
corruption ay *upstream ng pag-isyu* — ang seal ay nag-aanchor sa
corrupt contract sa mataas na integridad, na isang iba't ibang uri
ng pagiging kapaki-pakinabang (forensic anchor para sa later
accountability) ngunit hindi pareho sa prevention. Sa iba pang mga
kaso (CPA cash, off-budget spending) ang underlying problem ay ang
mga rekord na ineseyo ay hindi umiiral o hindi pinanatili — ang kit
ay hindi maaaring gumawa ng mga rekord na hindi ginawa ng authority.

Ang mga historikal na kaso na ito ay binanggit lamang nang may
reference sa publicly documented findings (court records,
parliamentary committee reports, audit-body publications). Walang
claim na ginawa tungkol sa sinumang indibidwal; ang documented
institutional findings ay tumitindig sa public record.

---

## Kailan gagamitin ang kit na ito

- Ang inyong jurisdiction ay may established budget-execution
  reporting process at gustong magdagdag ng immutable public
  anchor.
- Inaasahan ninyo ang post-issuance scrutiny (FOI requests, audit,
  civil-society monitoring, journalistic investigation) at gusto ng
  tamper-evident reference point.
- May legal authority kayo sa ilalim ng transparency / open-records
  law upang i-publish ang listed fact set, na ang privacy/security
  exclusions ay iginagalang.
- Nag-o-operate kayo sa ilalim ng statutory audit regime (inspector
  general, supreme audit institution) at gustong i-anchor ang bawat
  quarterly close bago abutin ito ng audit cycle.
- Nag-publish kayo sa ilalim ng Open Contracting Data Standard o
  IATI at gusto ng cryptographic complement sa portal-based
  publication.

## Kailan HINDI gagamitin ang kit na ito

- **Huwag gamitin bilang substitute para sa statutory audit,
  inspector-general review, prosecutorial investigation, o
  civil-society monitoring.** Ang kit ay *additive*, hindi
  replacement.
- **Huwag gamitin bilang legitimacy certificate.** Ang isang
  sealed expenditure record ay hindi corruption-free certificate.
  Ang pag-treat dito bilang ganoon ay eksaktong ang failure mode
  na umiiral upang pigilan ng kit's constraint-first structure.
- **Huwag gamitin sa kalagitnaan ng panahon.** Ang kit ay para sa
  sandali ng formal issuance (quarterly close, contract award,
  milestone disbursement). Ang mid-period seals ay gumagawa ng
  misleading reference points.
- **Huwag gamitin upang i-claim na ang gastusin ay legal, patas,
  o non-corrupt** — hindi magagawa iyon ng kit.
- **Huwag gamitin upang i-seal ang classified expenditures,
  individual employee PII, o supplier commercial PII.** Tinatanggihan
  ng kit ang mga pattern na ito; ang pagtatangka sa mga ito ay
  gumagawa ng refusal record (FACT 07).
- **Huwag gamitin upang i-seal ang pre-issuance drafts.** Ang mga
  drafts ay maaaring i-seal sa ilalim ng ibang attestation type
  ("draft for comment, not issued"), ngunit hindi sa ilalim ng
  issuance type ng kit na ito.
- **Huwag gamitin sa ilalim ng pressure upang i-omit ang FACT 07
  disclosures.** Tumanggi, at i-seal ang refusal.
- **Huwag gamitin kung ang inyong finance authority ay captured.**
  Ang isang sealed fraudulent expenditure ay isang permanente na
  public record ng fraud, hindi depensa nito. Ang primitive ay
  pumuputol sa magkabilang direksyon; iyon ang katapatan nito.

---

## Paano i-fork ang kit na ito para sa tunay na atestasyon

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Critical timing:** mag-seal SA sandali ng formal issuance — ibig
sabihin, ang sandali na pumirma ang responsible finance principal sa
quarterly close, ang sandali na isang kontrata ay pormal na
ipinagkaloob, o ang sandali na ang disbursement ay pormal na
inilabas. Ang seal bago ang formal issuance ay gumagawa ng
false-positive na "ito ang opisyal na rekord" reference. Ang seal
matagal na pagkatapos ng formal issuance ay forensically mas mahina
laban sa mga intervening modifications.

**Cadence:** ang kit ay idinisenyo para sa quarterly attestations
bilang default. Ang sub-quarterly cadences (monthly close,
per-transaction sealing) ay suportado sa pamamagitan ng pag-rerun
nang may appropriate scope; ang seal ng isang solong high-value
transaction ay isang legitimate na paggamit.

---

## Integration sa existing na public-finance infrastructure

Ang kit ay idinisenyo upang i-compose sa, hindi palitan:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Ang limang
  publication points (planning, tender, award, contract,
  implementation) ay nag-mamap naturally sa FACT 03 (planning →
  appropriation), FACT 04 (tender, award, contract, implementation
  → transaction manifest), at FACT 05 (supporting document hashes).
  Ang OCDS JSON export mismo ay naseyo sa FACT 05 (control
  documents). Ang isang jurisdiction na nagpapatakbo ng OCDS
  publication ay maaaring magdagdag ng MYRIAM sealing bilang
  cryptographic layer sa ibabaw ng existing portal nito.

- **International Aid Transparency Initiative (IATI) standard
  v2.03.** Para sa mga gastusin na pinondohan nang buo o bahagi ng
  external aid, ang IATI XML ay maaaring i-seal bilang control
  document; ang seal ay nagbibigay ng cryptographic complement sa
  HTTP-based publication model ng IATI Registry.

- **Mga commitment ng Open Government Partnership (OGP).** Ang
  OGP National Action Plans ay madalas magsama ng mga
  fiscal-transparency commitments; ang MYRIAM sealing ay
  nag-operationalize ng isang "tamper-evident publication"
  commitment sa paraang independently verifiable ng civil society
  nang hindi nangangailangan ng trust sa government portal.

- **OECD Recommendation on Public Integrity (2017).** Sinusuportahan
  ng kit ang Recommendation 4 (open government data sa public
  finance sa machine-readable, timely form) sa pamamagitan ng
  paggawa ng data na cryptographically anchored pati na rin
  machine-readable.

- **UN Convention against Corruption (UNCAC), particularly Articles
  9 (procurement) at 13 (participation of society).** Ang kit ay
  nagbibigay ng forensic primitive na sumusuporta sa Article 9
  transparency obligations at Article 13 civil-society oversight.

- **Supreme Audit Institutions (SAIs) — INTOSAI framework.** Ang
  mga SAI na nag-o-operate sa ilalim ng INTOSAI standards (ISSAI)
  ay maaaring kumonsumo ng sealed publications bilang evidence na
  may mataas na integrity; ang SHA-256 hashes sa FACT 05 ay ang
  parehong hashes na maaaring i-re-compute ng e-audit tools ng SAI.

- **Mga inspector-general offices.** Ang mga domestic IG offices na
  may jurisdiction sa sealed expenditures (FACT 06) ay maaaring
  mag-subpoena ng document bodies na ang mga hash ay naseyo sa
  FACT 05; ang seal ay nag-bind sa document bodies na natanggap sa
  ilalim ng subpoena sa bodies na umiiral sa pag-isyu.

- **Freedom-of-information at open-records statutes.** Ang seal ay
  hindi nag-e-exempt sa issuing authority mula sa continuing FOI
  obligations; sa katunayan, ginagawa nito ang selective FOI
  response na detectable bilang deviation mula sa sealed record.
  Ang FACT 07 C3 ay nag-aanchor ng outstanding FOI requests sa
  attestation time.

- **Beneficial-ownership registries (FATF Recommendation 24, EU
  AML directives, US Corporate Transparency Act).** Ang
  beneficial-ownership data ay HINDI naseyo sa ilalim ng kit na
  ito (ang FACT 04 ay nag-source ng vendor identity mula sa
  registered legal-entity name lamang). Ang beneficial-ownership
  disclosure ay isang hiwalay na sealing regime na maaaring gumawa
  ng parallel publication na ni-reference ng Merkle root.

- **Court-administered transparency (judicial expenditure
  reporting, asset-recovery proceedings).** Ang mga output ng
  corruption-related court proceedings ay wala sa scope ng kit na
  ito ngunit maaaring i-seal sa ilalim ng parallel attestation
  types.

## Ano ang HINDI pinapalitan ng kit na ito

- Statutory budget-execution audit ng inspector-general bodies
- Supreme-audit-institution review (GAO, NAO, TCU, CAG, AGN, BRH,
  Cour des comptes, equivalent)
- Prosecutorial investigation ng corruption offenses (national
  anti-corruption prosecutors, UNCAC Article 36 bodies)
- Civil-society at journalistic investigative reporting
- Mga whistleblower channels at protected-disclosure regimes
- Beneficial-ownership disclosure
- International peer review (OECD, IMF Fiscal Transparency
  Evaluation, EU semester, IATI registry)
- Court-administered asset-recovery proceedings

Ang seal ay isang forensic primitive na nagpapababa sa gastos at
nagpapataas sa reliability ng lahat ng nasa itaas. Ito ay hindi, at
hindi maaaring, isang kapalit para sa anumang isa sa kanila.

---

## Lisensya

Public domain (CC0). I-fork ito. Walang kinakailangang attribution.
