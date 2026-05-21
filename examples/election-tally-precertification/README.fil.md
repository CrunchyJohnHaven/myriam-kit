*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Kit sa Selyo ng Pre-Sertipikasyon ng Tally ng Halalan

Isang turnkey na halimbawa ng myriam-kit para sa mga lupon ng pagbilang sa antas ng county, mga awtoridad sa halalan sa antas ng estado, at mga tagamasid sa integridad ng halalan na nais maglathala ng selyo na naka-angkla sa Bitcoin, tamper-evident, ng isang tally sa eksaktong sandali ng sertipikasyon.

**Isinasara** ang [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Ano ang HINDI ginagawa ng kit na ito (basahin muna)

Ang selyo ay isang kriptograpikong timestamp ng kung ano ang naserap-tipiko. Hindi nito mapatutunayan kung tama ang naserap-tipiko. Ang mga sumusunod na uri ng pagkabigo ay **nasa labas ng saklaw ng selyo**:

1. **Pagkasira ng voting machine.** Kung ang firmware ay nasira o ang mga vote total ay hindi tama ang bilang, ang selyo ay mag-aangkla ng maling numero nang may mataas na integridad. Inoobserbahan ng selyo ang mga output ng sistema ng tabulasyon; wala itong nakikita sa loob mismo ng sistema.

2. **Pagsupil sa boto / strukturang pagkawala ng karapatan sa pagboto.** Pagsasara ng mga polling place, pagkakaiba-iba sa mga ID law, bias sa rate ng pagtanggi sa mail ballot, at mga purga sa rehistrasyon ay nasa itaas ng sertipikasyon. Itinatala ng selyo ang mga balota na nabilang, hindi ang mga balota na dapat ay nabilang.

3. **Disinpormasyon tungkol sa halalan.** Hindi humuhusga ang selyo sa mga claim tungkol sa halalan na ginawa ng mga kandidato, media, o platform. Ang isang sealed certification ay maaaring i-cite sa isang narrative ng disinpormasyon kasing dali ng pagdedepensa laban dito. Ang mga kriptograpikong timestamp ay neutral sa nilalaman.

4. **Pandaraya bago ang sertipikasyon sa panahon ng pagkolekta o pagbilang ng balota.** Mga kalokohan sa ballot harvesting, paggalaw sa mga drop box, pagkasira ng chain of custody sa loob ng window ng pagbibilang — lahat ay nangyayari bago ang sandali ng selyo. Hindi mahuhuli ng selyo ang mga ito nang retroactively.

5. **Pamimilit sa awtoridad na nagsesertipika.** Ang isang pinilit na sertipikasyon ay nagbubunga ng isang kriptograpikong wastong selyo ng isang pinilit na resulta. Pinatutunayan ng selyo na pumirma ang isang opisyal, hindi kung bakit.

6. **Maling sertipikasyon na hindi kailanman naitama sa kalaunan.** Ang halaga ng selyo ay nakadepende sa isang prosesong paghahanap-ng-katotohanan sa kalaunan (audit, recount, litigasyon) na kung saan ang selyo ay maaaring ihambing. Kung walang ganoong proseso ang naganap, ang selyo ay tatayo bilang ang tanging tala at maaaring magpatigas ng pagkakamali.

7. **Mga anomalyang istatistikal at pagtukoy ng pattern.** Hindi binabandera ng selyo ang hindi makatotohanang mga margin, mga anomalya sa heograpiya, o mga deviation sa Benford's law. Mga gawaing analitikal yaon sa naselyo na datos, hindi mga katangian ng selyo.

8. **Mga down-ballot na karera na may manipis na audit trail.** Ang mas maliliit na karera ay may mas mahihinang trigger ng recount; ang iisang selyo ay hindi makakapagsaklaw nang makahulugan sa lahat ng karera sa isang balota nang walang per-race na scoping.

**Ang seksyon ng honest-limits sa itaas ang nagdadala-bigat na bahagi ng kit na ito.** Ang mga opisyal na naniniwala na ang pagseselyo ay katumbas ng pagiging lehitimo ay gagamitin ito bilang panangga. Dapat sabihin ng kit nang prangka: ito ay isang *non-repudiation primitive para sa sandali ng sertipikasyon*, hindi isang patunay ng kawastuhan ng halalan.

---

## Ano ang DAPAT TUMANGGI selyuhan ng kit na ito

Ang kit ay naka-configure na tanggihan ang mga sumusunod na fact pattern kahit na ang isang user na may wastong signing authority ay magsumite ng mga ito:

- **Indibidwal na pagkakakilanlan ng botante.** Walang fact na maaaring magpangalan sa isang botante, mag-link ng balota sa isang botante, o maglantad ng anumang field na maaaring magpakilala muli ng isang tao.
- **Per-ballot na desisyon ng signature-match.** Puno ng PII; ang pagseselyo ay lumilikha ng mga permanenteng tala ng mga desisyon na maaaring tutulan sa kalaunan.
- **Anumang fact na ang paglalathala ay magpapakilala sa isang mahinang botante.** Kasama ang mga resulta sa antas ng precinct sa mga precinct na napakaliit na maaaring mabaybay ang pagpili ng boto (karaniwang <50 balota).
- **Mga tally na naselyo bago mabilang ang lahat ng balota.** Tinatanggihan ng kit ang mga partial count na inilalahad bilang "ang tally." Ang pre-sertipikasyon ay nangangahulugang *lahat ng balota ay nabilang, bago ang opisyal na sertipikasyon* — hindi *habang nagbibilang*.
- **Mga provisional o contingent na sertipikasyon.** Dapat masalamin ng selyo ang isang fact, hindi isang kondisyon.
- **Mga bilang na hindi kasama ang mga cohort na may nakabinbing litigasyon** nang walang tahasang sealed companion-fact na nagpapahayag ng pagbubukod.
- **Pagseselyo ng sinuman maliban sa awtoridad na nagsesertipika** para sa hurisdiksyong iyon.

Ang isang pagtanggi mismo ay maaaring iselyo bilang isang fact ("Hiniling ng awtoridad na ito ang pagseselyo ng X; tinanggihan ng kit ayon sa refusal-rule Y"), lumilikha ng isang pampublikong tala ng tinangkang maling paggamit.

---

## Ano ang SINESELYUHAN ng kit na ito

8 fact sa sandali ng sertipikasyon:

1. **Example notice** — nagdedeklara na ang publikasyon ay isang halimbawa (ang mga tunay na attestation ay nag-aalis o nagpapalit nito).
2. **Pagkakakilanlan ng hurisdiksyon** — county, petsa ng halalan, certifying authority, mga certifying official ayon sa pangalan + papel.
3. **Sertipikadong tally** — per-contest per-candidate na mga vote total + over/under-votes + write-ins.
4. **Pagsasakontabilidad at pagkakasundo ng balota** — kabuuang naipinakita, kabuuang naitabulate, kabuuang tinanggihan ayon sa kategorya, breakdown ng modo, denominator ng registered-voter.
5. **Manifest ng equipment at audit-trail** — modelo ng tabulator + firmware hash, hash ng CVR file, hash ng ballot-image archive, hash ng custody-log, hash ng signature-match policy.
6. **Mga threshold at trigger sa sertipikasyon** — signature-match threshold na epektibo, mga threshold ng recount-trigger, mga aktwal na margin per contest, RLA seed commitment.
7. **Mga companion disclosure at tala ng pagtanggi** — nakabinbing litigasyon, mga post-count na anomalya na sinusuri, mga ibinukod na cohort, mga dissenting board member; tahasang listahan ng mga pattern na tinanggihang selyuhan ng kit.
8. **Signing principal** — pagkakakilanlan ng Board of Canvassers + pangalan at partido ng bawat signatory + impormasyon ng kriptograpikong susi.

Bawat fact ay nagtatapos sa kombensiyon ng refusal-gate: *"Ipinapahayag lang ng fact na ito ang X. Hindi nito ipinapahayag ang Y"* (kung saan ang Y ay ang pinakamalapit na failure mode mula sa seksyong "HINDI ginagawa" sa itaas).

---

## Laban sa ano nagdedepensa ang kit na ito

- **Tahimik na post-certification na rebisyon ng mga vote total** — anumang integer na pagbabago sa FACT 03 ay nagbubunga ng ibang SHA-256, ibang Merkle root, at nabibigo sa OTS verification.
- **Tahimik na pag-absorb ng "found ballots"** — ang reconciliation arithmetic ng FACT 04 ay nakapirmi sa sertipikasyon.
- **Mga claim ng firmware-substitution** — pinapatigil ng FACT 05 ang manifest ng equipment sa sertipikasyon.
- **Pagpalit ng audit-artifact pagkatapos ng sertipikasyon** — nahuhuli ng hash manifest ng FACT 05 ang anumang post-cert na pagbabago sa CVR, ballot images, custody logs, o signature-match policy.
- **Muling pag-define ng threshold at trigger** — pinapatigil ng FACT 06 ang mga panuntunan na epektibo sa sertipikasyon (signature-match threshold, recount triggers, RLA risk limit).

## Mga makasaysayan o malapit-sa-kasaysayan na kaso kung saan nakatulong sana ang kit

Ang kit ay nakapagbigay sana ng kapaki-pakinabang na angkla — *hindi ng solusyon* — sa mga kaso na may kinalaman sa:

- **Antrim County, Michigan (2020).** Nagpakita ang mga inisyal na hindi opisyal na resulta ng candidate-swap na sa kalaunan ay naitama sa kabaligtaran ng resulta. Ang isang pre-correction na selyo ay nagbigay sana ng pampublikong reference para sa kung ano ang sinabi ng orihinal na anunsyo kumpara sa kung ano ang sinabi ng pagwawasto, na may kriptograpikong attestation sa pareho.
- **Maricopa County, Arizona (2020–2022).** Maraming iteration ng narecount/nareeksaminang total ang umiikot. Ang isang selyo ng sandali ng sertipikasyon ay nagbigay sana ng walang-malabong reference point laban sa kung saan ang bawat sumunod na bilang ay maaaring i-diff.
- **Florida 2000 (Bush v. Gore canvass).** Ang mga sertipikadong total per county ay nagbago sa ilalim ng presyon ng recount; ang isang per-county na pre-recount na selyo ay nagpreserba sana ng kung ano ang sinertipika ng bawat county bago nagsimula ang mga manwal na pamamaraan ng recount.
- **Iba't ibang dayuhang halalan na may dokumentadong post-certification na "mga pagwawasto."** Walang kinikilingang hurisdiksyon.

HINDI sana nareresolba ng kit ang pundamental na mga disputa tungkol sa integridad ng makina noong 2020, mga disputa sa patakaran ng mail-ballot, o anumang halalan kung saan ang pangunahing tanong ay pinaglalabanang fact sa halip na pinaglalabanang tala.

## Kailan gagamitin ang kit na ito

- Ang iyong hurisdiksyon ay may matatag, na-audit na proseso ng sertipikasyon at nais magdagdag ng hindi mababagong pampublikong angkla.
- Inaasahan mo ang post-certification na pagsusuri at nais ng tamper-evident na reference point.
- Ikaw ay may legal na awtoridad na ilathala ang nakalistang fact set nang hindi naglalantad ng PII.
- Mayroon kang parallel audit o RLA process upang ang selyo ay maihambing sa output ng truth-finding.

## Kailan HINDI gagamitin ang kit na ito

- **Huwag gamitin bilang kahalili para sa risk-limiting audits, hand recounts, o post-election audits.** Ang kit na ito ay *additive*, hindi replacement.
- **Huwag gamitin kung ang certifying official ay hindi ang aktwal na taga-desisyon** (lumilikha ng maling attribution).
- **Huwag gamitin sa kalagitnaan ng tabulasyon.** Ang kit ay para sa sandali ng sertipikasyon partikular. Ang partial-count na mga selyo ay lumilikha ng nakakalitong reference point.
- **Huwag gamitin upang i-claim na ang halalan ay patas, tumpak, o lehitimo** — hindi nito magagawa iyon.
- **Huwag gamitin sa ilalim ng presyon na selyuhan nang mas maaga kaysa sa sandali ng sertipikasyon, o tanggalin ang isang companion-fact disclosure.** Tumanggi, at selyuhan ang pagtanggi.
- **Huwag gamitin bilang legitimacy theater.** Ang isang selyo ng isang mapanlinlang na tally ay isang permanenteng pampublikong tala ng pandaraya, hindi isang depensa nito. Ang primitive ay pumupunit sa magkabilang gilid; iyon ang kanyang katapatan.

## Paano i-fork ang kit na ito para sa isang tunay na sertipikasyon

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # replace fictional content with real
bash build/seal.sh     # seal AT or after the official certification signature
python3 build/verify.py
```

**Kritikal na timing:** selyuhan SA sandali ng sertipikasyon, HINDI bago. Ang isang selyo bago ang opisyal na sertipikasyon ay lumilikha ng false-positive na "ito ang opisyal na resulta" na tala. Ang isang selyo pagkatapos ay konvensyonal na non-repudiation.

## Integrasyon sa umiiral na imprastruktura ng halalan

- **State Boards of Elections / EAC certification.** Naglalathala ang kit kasabay ng opisyal na dokumento ng sertipikasyon. Hindi nito pinapalitan ang statutory na sertipikasyon.
- **Risk-limiting audits.** Ang CVR hash sa FACT 05 ay ang parehong hash na kinokonsumo ng RLA tool. Iginagapos ng selyo ang na-audit na CVR sa sertipikadong total.
- **Mga pamamaraan ng recount.** Ang isang recount na na-trigger sa ilalim ng batas ng estado ay nagbubunga ng isang BAGONG sealed fact-set (ibang timestamp, ibang mga hash, parehong hurisdiksyon). Ang dalawang selyo ay nagsasama; walang nagpapatong sa isa't isa. Ang diff sa pagitan ng mga selyo ay ang pampublikong tala ng kung ano ang binago ng recount.
- **Election Markup Language (EML) at Common Data Format (CDF).** Ang mga fact body ay dapat na maaaring i-derive mula sa umiiral na EML/CDF output ng hurisdiksyon upang panatilihin ang kit na agnostic sa data format.
- **Bipartisan board-of-canvassers signing.** Ang multi-signature variant ay inirerekomenda para sa mga hurisdiksyon na may partisan-balanced canvass board.

## Ano ang HINDI pinapalitan ng kit na ito

- Statutory na sertipikasyon sa ilalim ng batas ng halalan ng estado
- EAC voting-system certification
- Risk-limiting audits / hand recounts
- Mga pamamaraan ng recount at post-election audits
- Mga utos ng korte o litigasyon sa election-contest

## Bakit umiiral ang kit na ito sa v0.3.0+

Ito ang ika-6 na worked example na ipinapadala kasama ng myriam-kit. Ang kit ay ginawa sa pamamagitan ng isang Karpathy-style na autoresearch process na dokumentado sa `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Tatlong prompt variant (imitation / first-principles / constraint-first) ang nagbunga ng parallel na mga balangkas ng kit; ang constraint-first na variant ay nakamit ang pinakamataas na marka sa isang weighted rubric, at ang panghuling kit ay nag-synthesize ng kanyang istruktura sa cohesion ng imitation variant at ang operational detail ng first-principles variant.

Ang autoresearch mismo ay dokumentado bilang isang prompt pattern sa `~/Genesis/calc/PROMPT_LIBRARY_v0.md` para sa hinaharap na paggamit.

## Lisensya

Public domain (CC0). I-fork mo ito. Walang kinakailangang attribution.
