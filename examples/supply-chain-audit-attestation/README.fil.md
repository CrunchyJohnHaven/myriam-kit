*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Supply-Chain Audit Attestation Seal Kit

Isang turnkey na halimbawa ng myriam-kit para sa mga third-party na social/labor/environmental auditors, in-house na supplier-compliance teams, mga NGO supply-chain investigators, at mga organisasyon ng karapatang manggagawa na nais maglathala ng isang seal ng audit report na naka-anchor sa Bitcoin at tamper-evident sa eksaktong sandali ng pag-sign-off.

---

## Ano ang HINDI ginagawa ng kit na ito (basahin muna)

Ang seal ay isang cryptographic timestamp ng pinirmahan ng auditor. Hindi nito mabe-verify kung **totoo** ang pinirmahan. Ang mga sumusunod na failure modes ay **nasa labas ng domain ng seal**:

1. **Audit capture ng industriya.** Ang mga audit na inutusan ng brand ay may mahabang, dokumentadong kasaysayan ng paggawa ng mga malambot na findings sa mga supplier na ang patuloy na negosyo nila sa nag-uutos na brand ay nagpapanatili sa daloy ng audit pipeline. Ang isang nahuli na audit, kapag na-seal, ay gumagawa ng permanenteng forensic record ng nahuling audit. Hindi tinatama ng seal ang capture — ginagawa lamang nitong hindi nababago ang audit-as-issued, kaya may konkretong masasangguni ang isang susunod na proseso ng paghahanap ng katotohanan.

2. **Mga manggagawang pinaghandaang sumagot / mga handa nang pasilidad.** Ang mga inanunsyo o semi-inanunsyong mga audit ay nagbibigay sa management ng mga araw o linggo upang sanayin ang mga sagot ng manggagawa, itago ang mga underage na manggagawa, linisin ang mga dormitoryo, alisin ang non-compliant na equipment, at i-divert ang trabaho sa mga hindi nai-audit na subcontractors sa loob ng window ng audit. Ang seal ay nag-aanchor sa kung ano ang ipinakita sa mga auditor, hindi sa kung ano ang pinigilan nilang makita.

3. **Nakatagong subcontracting.** Ang Tier-2 at Tier-3 subcontracting, homeworking, at informal-sector production ay malawakang hindi nakikita sa mga audit sa sahig ng pabrika. Ang seal ay nag-aanchor sa isang Tier-1 audit; hindi nito mae-detect na ang Tier-1 ay nag-o-outsource sa isang hindi inaaudit na Tier-2 sa loob ng window ng audit o regular na nangyayari.

4. **Mga audit na sistematikong nakakaligta sa pang-aabuso na kanilang target.** Ang Rana Plaza, ang 2013 Bangladesh garment factory collapse na pumatay sa 1,134 na manggagawa, ay na-audit ng maraming brand-commissioned audit programs sa mga buwan bago ito bumagsak. Ang mga crack sa gusali ay wala sa social-audit checklist; ang audit regime ay walang structural-engineering scope. Ang mga audit ay nag-aanchor sa kung ano ang *nasa scope*; ang mga pang-aabuso sa labas ng scope ay nananatiling hindi nakikita anuman ang tamper-evident na seal.

5. **Pagkatapos-pirma na ganti sa mga manggagawang nakilahok sa mga interview.** Kahit na may tinanggihang locating information (FACT 07 R3), ang isang determinadong kalaban na nakakaalam ng supplier ID ay maaaring matukoy ang pasilidad. Ang proteksyon ng manggagawa ay nangangailangan ng higit pa sa pagtanggi lamang sa PII sa seal — nangangailangan ito ng anonymization sa upstream ng audit methodology. Ang seal ay ginagawang matibay ang audit-as-issued; hindi nito retroaktibong pinoprotektahan ang mga interviewee.

6. **Mga kondisyon ng manggagawa na legal ngunit di-makatao.** Ang mga living-wage gaps sa mga hurisdiksyon kung saan ang legal na minimum wage ay nasa ibaba ng living-wage benchmark ay gumagawa ng mga "compliant" na audit findings laban sa wage-and-hour laws at "non-compliant" na findings laban sa living-wage standards sa parehong audit (FACT 03 element 8 sa halimbawang kit na ito). Ang seal ay nag-aanchor sa kung ano ang iniuulat ng bawat standard; ang pag-reconcile sa mga ito ay downstream policy work.

7. **Mga climate / environmental harms na may diffuse causality.** Ang mga carbon emissions, kontribusyon sa deforestation, water depletion, at pollutant releases mula sa mga supplier ay maaaring i-seal sa audit findings, ngunit ang causal attribution sa partikular na order volume ng brand ay metodolohikal na pinag-aagawan. Ang seal ay nag-aanchor sa kung ano ang sinukat sa supplier; hindi nito itinatalaga ang moral o legal na responsibilidad.

8. **Mga pagtatalo tungkol sa kung anong standard ang awtoritatibo.** SA8000 vs. BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. company-specific code-of-conduct: bawat isa ay may iba't ibang scope, severity, at remediation processes. Ang seal ay nag-aanchor ng *isang* audit sa ilalim ng *isang* standard. Ang cross-standard comparison ay isang downstream na problema.

9. **Kakayahan ng auditor kumpara sa credential ng auditor.** Ang "credentialed" ay hindi "competent." Ang mga auditor na nakatapos ng mga accredited training programs ay nakaligtaan na ang mga matinding pang-aabuso sa mga audit na nauna sa mga publicly visible disasters. Ang seal ay nag-aanchor ng credentials; hindi nito sine-certify ang competence kung saan ginamit ang mga ito.

**Ang seksyong honest-limits sa itaas ay ang load-bearing na bahagi ng kit na ito.** Ang isang brand na nais ng legitimacy theater ay gagamit ng isang sealed audit bilang isang kalasag. Dapat sabihin nang malinaw ng kit: ito ay isang *non-repudiation primitive para sa sandali ng pag-sign-off ng audit report*, hindi isang patunay ng supplier compliance o welfare ng manggagawa.

---

## Ano ang DAPAT TANGGIHAN ng kit na ito na i-seal

Ang kit ay naka-configure na tanggihan ang mga sumusunod na pattern ng fact kahit na isumite ng isang user na may wastong audit-body authority:

- **Individual worker identification.** Walang fact na maaaring magpangalan ng manggagawa, mag-link ng quote sa manggagawa, magpakita ng badge number, posisyon sa line, kuwarto sa dormitoryo, schedule ng shift, demographic combination na may N<5, o anumang field na maaaring magre-identify ng taong nakilahok sa mga interview. Ang mga worker quote ay gumagamit ng randomized tokens; ang mapping ay hindi kailanman ina-seal.
- **Whistleblower / informant sources.** Kung ang isang finding ay nakasalalay sa pag-disclose ng isang indibidwal na nag-take ng risk para mag-disclose, ang indibidwal ay hindi kailanman pinapangalanan o tinukoy sa sealed publication.
- **Precise locating information.** Walang street address, GPS, satellite image na mas mataas sa 1km resolution, o external building photograph. Ang bansa at rehiyon ang maximum resolution na ina-seal. Rasyonal: ang facility identification ay nagbibigay-daan sa retaliation laban sa mga participant ng interview.
- **Clean-audit certification claim.** Tinatanggihan ng kit ang pag-seal ng anumang framing ng anyong "pinatutunayan ng audit na ito na compliant ang supplier" o "walang umiiral na paglabag." Ang mga claim ng kalinisan ay epistemikal na hindi suportado ng audit methodology.
- **Seal-as-certificate substitution.** Ang publikasyon na nag-iiwan ng methodology (FACT 04), independence (FACT 06), o refusals (FACT 07) ay hindi lehitimong MYRIAM publication sa ilalim ng kit na ito.
- **Draft / pre-sign-off audits.** Nangyayari ang sealing sa sign-off, hindi bago. Ang mga provisional audit ay gumagawa ng false certainty.
- **Post-hoc favorable resealing.** Ang isang nirebisang audit ay nangangailangan ng BAGONG sealed publication na nagre-reference sa orihinal sa pamamagitan ng Merkle root. Ang orihinal na sealed audit ay nananatiling permanenteng nakikita bilang ang audit-as-issued.
- **Pag-seal ng sinumang partido maliban sa audit body.** Ang isang brand, supplier, certification body, o third party ay hindi maaaring mag-seal ng "audit" bilang kapalit ng audit body na pumirma sa report.

Ang isang refusal mismo ay maaaring i-seal bilang isang fact ("Hiniling ng partidong ito ang pag-seal ng X; tinanggihan ng kit ayon sa refusal-rule Y"), na lumilikha ng public record ng tinangkang maling paggamit. **Sa industriya na may laganap na audit capture, ang refusal-to-seal ay maaaring mismong maging makabuluhang signal:** ang isang audit body na ayaw mag-seal dahil idiniin ng isang brand ang pag-soften ng mga finding ay may opsyon na publicly i-record ang refusal sa ilalim ng kanilang sariling principal.

---

## Ano ang INISESEAL ng kit na ito

8 facts sa sandali ng pag-sign-off ng audit:

1. **Example notice** — idinedeklara ang publikasyon bilang isang halimbawa (tinatanggal o pinapalitan ito ng mga tunay na attestation).
2. **Audit scope at subject** — audit standard, audit body, lead auditor, audit-team size, supplier identifier (walang precise locating information), audit window, announcement type (announced / semi-announced / unannounced), audit report date, sign-off version, pinangalanang recipient brands, commissioning party.
3. **Audit findings manifest** — per-element na conformance / minor-NC / major-NC / critical-NC laban sa standard, bawat isa ay may SHA-256 ng buong finding write-up. Aggregate totals. Certification recommendation sa sign-off.
4. **Methodology at evidence** — on-site time allocation, interview counts (na may stratification: kasarian, migrant status, tenure), interview-format breakdown, interpreter relationship, document review na may sample sizes at content hashes, site-visit artifacts (na may mga mukha ng manggagawa na blurred), kilalang methodology limitations.
5. **Mga corrective action na ipinangako** — bawat major-NC at bawat minor-NC CAP na may nakasaad na root cause, deadline, verification mechanism, escalation commitments, no-silent-relaxation commitment.
6. **Auditor qualifications at independence** — audit body accreditation, customer concentration, lead-auditor credentials at language competence, sector experience, independence declarations (auditor-supplier, auditor-brand, certification-body separation).
7. **Companion disclosures at refusal record** — conflicts of interest (tahasan), nakaraang audit history, mga worker-voice channels na ipinarating, parallel investigations, audit-body internal dissent, refusal-rule list, mga refusal na aktwal na ginamit sa audit na ito.
8. **Signing principal** — audit body, lead auditor, audit team, authorizing officer, cryptographic key info.

Ang bawat fact ay nagtatapos sa kombensyon ng refusal-gate: *"Ang fact na ito ay nagsasaad lamang ng X. Hindi nito sinasaad ang Y"* (kung saan ang Y ay ang pinakamalapit na failure mode mula sa seksyong "HINDI ginagawa").

---

## Laban sa ano nagdedepensa ang kit na ito

- **Silent na post-sign-off na pag-soften ng major non-conformances.** Anumang pagbabago sa FACT 03 (hal. isang MAJOR_NC na nire-classify bilang MINOR_NC, o isang finding na buong-buong tinanggal) ay gumagawa ng ibang SHA-256, ibang Merkle root, nabigo sa OTS verification.
- **Backdating ng pagsasara ng corrective action.** Ina-freeze ng FACT 05 ang CAP at ang mga deadline nito sa sign-off; anumang claim na "isinara namin yang NC noong nakaraang buwan" na sumasalungat sa mga sealed deadline ay publicly diffable.
- **Methodology revisionism.** Ina-freeze ng FACT 04 ang interview counts, document sample sizes, at on-site hours sa sign-off — pinipigilan ang depensang "gumawa kami ng malalim na investigation" na hindi maitatatwa.
- **Selektibong republikasyon na nag-iiwan ng hindi paborableng findings.** Lahat ng 8 facts ay nakatali sa iisang Merkle root; ang pag-quote ng ilang facts habang inaalis ang iba ay matutukoy mula sa publikadong leaf list.
- **Pag-drift ng independence claim.** Ina-freeze ng FACT 06 ang mga independence declaration sa sign-off. Ang isang susunod na claim na "ang audit na ito ay rigorously independent" ay dapat lumaban sa sealed na customer-concentration percentage at sa sealed na brand-paid commissioning disclosure.
- **Pag-erase ng refusal record.** Ina-freeze ng FACT 07 kung anong mga pattern ng fact ang tinanggihan ng kit; ang anumang susunod na claim na "wala kaming tinanggihan" ay sumasalungat sa sealed record.

---

## Mga historikal o malapit-historikal na kaso na natulungan sana ng kit

Ang kit ay gumawa sana ng kapaki-pakinabang na **forensic anchor** — *hindi isang fix o pag-iwas* — sa mga kasong kasangkot:

- **Rana Plaza (Bangladesh, 2013).** Ang pagbagsak ng Rana Plaza building ay pumatay sa 1,134 na manggagawang garment at nasugatan ang ~2,500. Maraming brand na ang mga produkto ay ginawa sa loob ng gusali ay nag-audit ng mga Tier-1 supplier sa loob ng gusali sa ilang sandali bago bumagsak. Gumamit ang mga audit ng social-audit checklists na walang structural-engineering scope. Isang sealed methodology fact (FACT 04) sa bawat isa sa mga audit na iyon ang gagawing publicly visible ang *scope gap* sa sign-off — i-aanchor ang dokumentadong limitasyon na retroactively na inangkin ng audit programs na wala. Hindi sana napigilan ng seal ang pagbagsak. Pinigilan sana nito ang post-collapse industry claim na "walang nakakaalam" na maging epistemikal na tenable.

- **Apple / Foxconn audits (2010s).** Maraming iteration ng audit reports sa Foxconn facilities na gumagawa para sa Apple ay nai-publish na may iba't ibang antas ng finding severity, konteksto ng worker-suicide-cluster, at mga claim ng remediation. Ang sealed sign-off-moment record para sa bawat audit ay sana ay pumigil sa mga susunod na pagtatalo tungkol sa "ano ang sinabi ng audit noong panahon na iyon" mula sa pagdepende sa mga archive copy, leaked copy, o nirebisang official release.

- **Cobalt mula sa DRC (ongoing).** Ang artisanal cobalt mining sa Democratic Republic of Congo, kasama ang mga bata, ay pumapasok sa battery supply chains para sa malalaking electronics at EV brands. Maraming brand-commissioned audits sa panahon ng 2017–kasalukuyan ay gumawa ng mga finding na iba-iba ang severity. Ang kit na inilapat sa bawat audit sa sign-off ay sana ay nag-anchor ng audit-as-issued; ang kit na inilapat sa companion-disclosure facts (FACT 07 C2: nakaraang audit history) ay sana ay gumawang publicly visible ang methodological inheritance ng bawat sumusunod na auditor sa mga nakaraang gaps.

- **Conflict minerals (tin, tantalum, tungsten, ginto mula sa DRC at Great Lakes region).** Ang Dodd-Frank §1502 ay gumawa ng audit-and-disclose obligations sa ilalim ng SEC rule 13p-1. Ang mga pagtatalo tungkol sa kasapatan ng smelter-level audits at downstream chain-of-custody verification ay paulit-ulit sa panahon ng 2014–2022. Ang per-audit MYRIAM seals ay sana ay nag-anchor sa bawat smelter audit sa sign-off.

- **Brand-commissioned audits ng Xinjiang cotton supply chains (2018–kasalukuyan).** Ang mga pagtatalo tungkol sa kung mapagkakatiwalaang maisasagawa ang mga audit sa ilalim ng mga paghihigpit ng PRC government sa access ng auditor ay malawakang lumitaw pagkatapos ng 2020. Ang isang sealed methodology fact (FACT 04) sa bawat audit ay sana ay nag-anchor sa kung ano talagang mga kondisyon ng access ang inilapat — gumagawa sa "nagsagawa kami ng masusing audit" na mga susunod na claim na ma-diff laban sa mga sealed methodology constraints sa panahong iyon.

- **Foxconn subcontracting at Apple supplier-responsibility reports noong 2010s — paulit-ulit na pagtuklas ng mga underage workers, nakatagong dormitories, paglabag sa oras.** Ang per-audit seals ay sana ay nag-anchor sa *negative findings* sa mga audit na walang natagpuan, kasama ang *positive findings* sa mga audit na nakatagpo ng mga paglabag — pumipigil sa retrospective narrative cherry-picking mula sa alinmang direksyon.

Hindi sana napigilan ng kit ang alinman sa mga ito. Sa maraming kaso ang underlying na problema ay ang audit ay *nakaligtaan* ang pang-aabuso — ang pag-seal ng isang malinis na audit na dapat ay nakatagpo ng paglabag ay gumagawa ng permanenteng record ng nabigong audit, na isang ibang uri ng kapaki-pakinabang (in-anchor nito ang pagkabigo para sa susunod na pananagutan) ngunit hindi pareho sa pag-iwas.

---

## Kailan gamitin ang kit na ito

- Ikaw ay isang audit body na umaangkop sa "i-publish kung ano ang pinirmahan namin" na praktis bilang depensa laban sa post-sign-off na soften pressure.
- Ikaw ay isang NGO na nagpapatakbo ng parallel supply-chain investigation at gusto ng tamper-evident reference point sa sandaling magsasara ang inyong imbestigasyon.
- Ikaw ay isang organisasyon ng karapatang manggagawa na nakakuha ng audit report at gusto i-anchor ang kasalukuyang nilalaman nito bago magkaroon ng pagkakataon ang audit body o brand na rebisahin ito.
- Ikaw ay isang brand na nakatuon sa transparency tungkol sa mga audit na ipinatupad ninyo, at gusto ninyo ng isang verifiable forensic record.
- Ikaw ay isang journalist, regulator, o korte na nag-aanchor ng nilalaman ng partikular na audit sa isang tiyak na sandali para sa susunod na litigation o reporting.

## Kailan HINDI gamitin ang kit na ito

- **Huwag gamitin bilang kapalit ng worker-led monitoring, independent NGO investigations, o worker organizing.** Ang kit ay *karagdagan*, hindi pamalit sa alinman sa mga ito.
- **Huwag gamitin para mag-claim na ang isang supplier ay compliant.** Ang isang malinis na sealed audit ay sa pinakamabuti ay isang input lamang sa compliance assessment. Ang pagturing sa sealed audit bilang compliance certificate ay tiyakang ang legitimacy theater na ang constraint-first refusal rules ay umiiral para pigilan.
- **Huwag gamitin sa kalagitnaan ng audit.** Ang pag-seal bago mag-sign-off ay gumagawa ng false-positive na "ito ang final audit report" record.
- **Huwag gamitin para mag-seal ng draft na balak ninyong rebisahin.** Ang bawat sign-off version ay nakakakuha ng sariling seal; ang mga rebisyon ay nagre-reference sa mga orihinal sa pamamagitan ng Merkle root.
- **Huwag gamitin sa ilalim ng pressure na mag-seal nang mas maaga sa sign-off, o mag-iwan ng companion-fact disclosure.** Tanggihan, at (kung pinapahintulutan ng inyong principal) i-seal ang refusal.
- **Huwag gamitin bilang batayan para sa isang "fair trade" o "ethical sourcing" marketing claim nang hindi inihahayag ang mga sealed methodology limits kasama ng seal.** Ang pag-cite sa seal nang hindi cinacite ang mga limits ay ang legitimacy-theater failure mode na tumutukoy sa audit capture.
- **Huwag gamitin kung ang inyong audit body ay strukturang nahuli at hindi makakapag-publish ng mga finding laban sa interes pang-komersyal ng commissioning brand.** Sa kasong iyon, ang pag-seal ay gumagawa ng permanenteng public record ng captured audit. Maaaring valuable pa rin ito — ngunit hindi pareho sa pagdepensa laban sa capture.

---

## Paano i-fork ang kit na ito para sa isang tunay na audit

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # palitan ang fictional content ng real
bash build/seal.sh        # I-SEAL SA sign-off, hindi bago, hindi pagkatapos
python3 build/verify.py   # kumpirmahin
```

**Kritikal na timing:** mag-seal SA sandali ng sign-off — i.e., kapag ang lead auditor ay pumirma sa final report at ito ay naging opisyal na posisyon ng audit body. Ang isang seal bago mag-sign-off ay gumagawa ng false-positive na "ito ang final audit" record. Ang isang seal nang matagal pagkatapos ng sign-off ay forensikong mas mahina laban sa intervening modifications.

---

## Integrasyon sa umiiral na supply-chain audit infrastructure

Ang kit ay idinisenyo upang makipag-compose, hindi mag-palit:

- **SA8000 (Social Accountability International).** Ang mga SA8000 audit report at CAP document ay natural na nakakatugma sa FACT 03 + FACT 05. Ang SAAS accreditation reference ay tugma sa FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment Program).** Ang audit findings ng RBA ay nakakatugma sa FACT 03; ang mga audit-firm independence rules ng RBA ay nakakatugma sa FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Ang 2-pillar at 4-pillar audit findings ng SMETA ay nakakatugma sa FACT 03; nag-host ang Sedex platform ng raw report — ang MYRIAM seal ay nag-anchor ng content hash ng platform-hosted report.
- **amfori BSCI.** Ang BSCI A–E rating mechanics ay nakakatugma sa FACT 03 certification recommendation; ang brand-membership commissioning ay nakakatugma sa FACT 06 customer-concentration disclosure at FACT 07 C1.
- **FSC chain-of-custody.** Para sa forest-product supply chains, ang chain-of-custody certificates at re-audit schedules ay tugma sa audit-window at CAP structure.
- **B Lab / B Corp impact assessment.** Ang sertipikasyon ng B Corp ay hindi isang third-party audit sa diwa ng SA8000, ngunit ang verifier reports ng impact assessment ay maaaring i-seal sa ilalim ng kit na ito (na may mga fact na re-scoped sa impact-assessment sa halip na labor audit).
- **ISO 26000.** Ang ISO 26000 ay guidance, hindi certifiable; ang kit ay walang direct ISO 26000 audit-report integration ngunit ang social-responsibility taxonomy ay maaaring magbigay-impormasyon sa FACT 03 element structure para sa mga in-house audit.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program / iba pang mga sektor-specific na regime).** Ang sector-specific audit programs ay maaaring i-seal sa ilalim ng kit na ito; ang FACT 02 audit-standard field ang nagtukoy kung alin.
- **Fair Labor Association.** Ang FLA factory-monitoring reports ay nakakatugma sa FACT 03 + FACT 05; ang FLA independent-monitor framework ay nakakatugma sa FACT 06 independence declarations.
- **Higg Index (Sustainable Apparel Coalition).** Ang facility-level Higg FEM (Facility Environmental Module) at Higg FSLM (Facility Social & Labor Module) outputs ay maaaring i-seal sa ilalim ng kit na ito.
- **EU CSRD / CSDDD.** Ang EU Corporate Sustainability Reporting Directive at Corporate Sustainability Due Diligence Directive ay gumagawa ng disclosure obligations na ang verification documents ay maaaring i-seal sa ilalim ng kit na ito. Ina-anchor ng kit ang disclosure-as-issued, hindi ang substantive adequacy nito.

## Ano ang HINDI pinapalit ng kit na ito

- Worker-led monitoring (ang pinaka-mapagkakatiwalaang abuse-detection signal sa anumang supply chain)
- Independent NGO investigations (CCC, Labour Behind the Label, China Labour Bulletin, Workers' Rights Consortium, atbp.)
- Regulatory inspection (national labor bureaus, OSHA-equivalents, ILO Country Office programs)
- Worker organizing at collective bargaining
- Litigation, arbitration, at remediation sa ilalim ng domestic labor law
- Brand-side due-diligence frameworks (UNGP, OECD Due Diligence Guidance, EU CSDDD)

## Lisensya

Public domain (CC0). I-fork ito. Walang kailangang attribution.
