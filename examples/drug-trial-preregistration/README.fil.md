*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Kit ng Pre-rehistrasyon ng Pagsubok sa Gamot

Isang turnkey na halimbawa ng myriam-kit para sa mga sponsor ng
clinical trial at mga akademikong investigator na nais mag-pre-
register ng isang trial sa isang tamper-evident, naka-angkla sa
Bitcoin na paraan **bilang karagdagan sa** rehistrasyon sa
ClinicalTrials.gov, EU CTR, o iba pang jurisdictional registries.

## Bakit mag-pre-register *karagdagan* sa ilalim ng MYRIAM?

Ang umiiral na mga trial registry (ClinicalTrials.gov, EU CTR,
ISRCTN) ay may mga dokumentadong kahinaan sa integridad:

- Pinapahintulutan ng ClinicalTrials.gov ang mga sponsor na
  i-update ang mga endpoint, mga kalkulasyon ng sample-size, at
  analysis plans **pagkatapos** ng orihinal na rehistrasyon, kung
  saan ang mga petsa ng modipikasyon ay nakikita sa registry ngunit
  ang mga pagbabago sa *nilalaman* ay hindi palaging kriptograpikong
  naka-angkla.
- Ilang malalaking pag-aaral (Goldacre et al., 2019; Mathieu et al.,
  2009) ang nag-dokumento ng systematic post-hoc endpoint switching
  sa buong field.
- Nakukuha ng editorial enforcement ng mga journal (CONSORT, ICMJE)
  ang ilang kaso; marami ang nakakalusot.

Ang isang MYRIAM seal ay nagsasara sa gap na ito. Ang Merkle root +
Bitcoin OTS receipt ay ginagawang kriptograpikong natutukoy ang
anumang post-hoc na pagbabago sa *pre-registered* na primary
endpoint, statistical analysis plan, o subgroup list. Ang selyo ay
forensic na mas mahirap i-retcon kaysa sa registry mismo.

Ang kit na ito ay isang **complement sa**, hindi kapalit ng,
jurisdictional registries. Ang isang totoong trial ay dapat
magparehistro sa angkop na registry AT mag-selyo sa ilalim ng MYRIAM.

## Anong ipinagtatanggol ng kit na ito

Mga makasaysayang kaso ng dami ng namatay na sana ay natulungan
nito:

- **Vioxx (Merck, 2004)**: ang cardiovascular events ay isang
  pre-registered endpoint sa APPROVe trial ngunit ang
  inilathalang pagsusuri ay gumamit ng cutoff na nagminimal ng
  apparent harm. Ang isang selyo ng pre-registered cutoff ay sana
  ay ginawang publikong matutukoy ang post-hoc cutoff change bago
  ang inilathalang papel.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: negative trial data
  sa adolescent suicidality ay ni-reframe sa pamamagitan ng
  post-hoc analysis. Ang sealed pre-registration ng mga endpoint
  ay sana ay ginawang publikong matutukoy ang reframing.
- **Maraming oncology trials** kung saan ang mga survival endpoint
  ay pinalitan sa mga surrogate endpoint (progression-free
  survival, response rate) kapag nabigo na lumitaw ang survival
  benefit.

**Mga failure mode na direktang nahuhuli ng selyo:**

- **Endpoint switching**: post-hoc promotion ng isang secondary
  endpoint sa "primary" kapag nabigo ang aktwal na primary. Ang
  FACT 05 ng selyo ay naglalaman ng pre-registered primary
  endpoint; ang inilathalang primary endpoint ay dapat tumugma.
- **Outcome cherry-picking**: pumipili lamang ng pag-uulat sa mga
  pagsusuri na nagtagumpay. Naglalaman ang FACT 06 ng buong
  pre-registered analysis plan; ang mga inilathalang pagsusuri ay
  dapat magsama ng lahat ng pre-registered.
- **Post-hoc subgroup mining**: pagsasabing "gumagana ang gamot
  para sa subgroup X" pagkatapos makita ang data. Naglalaman ang
  FACT 07 ng pre-registered subgroup list; ang anumang iba pang
  subgroup ay dapat i-label bilang post-hoc.
- **Sample size revision**: pagdaragdag ng sample size pagkatapos
  makita ang interim trends. Naglalaman ang FACT 06 ng
  pre-registered sample size at power calculation.
- **Tahimik na pagtanggal ng inconvenient secondary endpoints**:
  Ang FACT 05 ay nagpapakaayos ng mga secondary endpoint para sa
  hierarchical testing; ang anumang reordering o pagtanggal ay
  natutukoy.
- **Pagsupil ng negative results**: Naglalaman ang FACT 08 ng
  commitment ng publication; ang pagkabigong maglathala sa loob
  ng committed window ay publikong nakikita.

**Mga failure mode na HINDI saklaw:**

- Misconduct sa trial execution mismo (pekeng data, mapanlinlang
  na enrollment). Inaangkla ng selyo ang *plano*, hindi ang
  *pagsasagawa*.
- Selective reporting sa mga publikasyon na nagsasama ng lahat ng
  pre-registered analyses ngunit pinipinta ang mga ito nang
  paborable. Nahuhuli ng selyo kung ano ang nawawala; hindi nito
  mahuhuli ang interpretive bias.
- Pinsala sa pasyente sa panahon mismo ng trial. Ang selyo ay
  regulatory at evidentiary; hindi nito binabawasan ang
  trial-conduct risk.

## Kailan gagamitin ang kit na ito

Dapat mong isaalang-alang ang pag-selyo ng isang pre-registration
kung:

- Ikaw ay sumusuporta o nagpapatakbo ng isang clinical trial —
  Phase 1 hanggang 4 — na gagamitin upang ipaalam sa medikal o
  regulatory na desisyon.
- Handa kang publikong itali sa pre-registered design, endpoints,
  at analysis plan.
- Maaari mong harapin ang konsekwensya: kung mabigo ang trial sa
  mga pre-registered endpoint nito, hindi mo basta-basta maaaring
  i-retcon sa isang ibang endpoint na nagtagumpay.
- Lumalahok ka sa isang research culture (academic medicine,
  cooperative groups, NIH-funded research) kung saan ang
  integridad ng pre-registration ay lalo nang hinihingi.

Ang kit na ito ay *partikular na* mahalaga para sa:

- Mga investigator-initiated trial sa academic institutions (kung
  saan totoo ang sponsor pressure na baguhin ang mga endpoint
  post-hoc ngunit kung saan ang academic investigator ay may
  reputational incentive na tumutol).
- Mga open-science trial at citizen-science studies.
- Mga drug-repurposing trial sa mga maliliit na biotech na walang
  matagal na track record ng pagsasagawa ng trial.
- Anumang trial na nilalayong magbigay-alam sa mga regulatory
  submission kung saan maaaring gawin sa hinaharap ang mga "hindi
  namin sinabi iyon" na argumento.

## Kailan HUWAG gamitin ang kit na ito

HUWAG gumamit ng kit na ito kung:

- Ang trial protocol ay tunay pa ring nagbabago. Mag-pre-register
  kapag pinal na ang protocol, hindi bago.
- Hindi ka makakapag-commit na maglathala ng resulta anuman ang
  direksyon. Ginagawa ng selyo na publikong natutukoy ang
  failure-to-publish.
- Ang trial ay sangkot sa competitive industry secrecy na
  pumipigil sa iyo na gawing pampubliko ang analysis plan. Ang
  selyo ay gumagawa ng analysis plan na permanenteng pampublikong
  record; walang paraan upang mag-selyo ng isang bagay nang
  pribado.
- Wala kang legal at ethical sign-off sa protocol. Itinatala ng
  selyo ang protocol HABANG sinelyuhan mo ito; hindi ito maaaring
  retroactively na ma-endorso ng isang IRB o ethics committee.

## Paano i-fork ang kit na ito para sa isang totoong pre-rehistrasyon

```bash
# 1. Copy this example
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Replace fictional content with the real trial protocol content.
# Each fact corresponds to a section of a standard pre-registration:
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Update site/index.html to reflect the real trial.

# 4. Seal (BEFORE enrollment begins, BEFORE database lock):
bash build/seal.sh

# 5. Verify locally:
python3 build/verify.py

# 6. Deploy:
#    - Publish the seal URL to your trial sponsor's website AND
#    - Add the IPFS CID to the trial's ClinicalTrials.gov record's
#      "Description" or "References" field, so the registry record
#      cross-references the cryptographic seal.
```

**KRITIKAL NA TIMING**: ang selyo ay dapat gawin BAGO magsimula
ang enrollment. Ang isang pre-registration na sinelyuhan pagkatapos
ma-enroll ang unang pasyente ay forensic na mas mahina. Ideyal,
mag-selyo sa sandali ng IRB approval.

## Pagsasama sa umiiral na pre-rehistrasyon infrastructure

Ang kit ay dinisenyo upang mag-compose, hindi mag-replace:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: irehistro ang trial
  sa jurisdictional registry ayon sa hinihingi. Pagkatapos, sa
  field na "Description" o "References" ng registry, i-link sa
  MYRIAM-sealed publication.
- **OSF (Open Science Framework)**: Sinusuportahan ng OSF ang
  pre-registration na may mga date stamp ngunit walang Bitcoin
  anchoring. Ang MYRIAM seal ay maaaring i-attach bilang isang
  supplementary file sa OSF registration page, na nagbibigay ng
  parehong date-stamp at Bitcoin-anchor.
- **AsPredicted.org**: katulad — i-link ang MYRIAM seal bilang
  isang supplementary URL.
- **Journals**: ilang journal (hal., Trials, BMJ Open) ay
  tumatanggap ng mga pre-registration URL bilang bahagi ng
  submission. Isama ang MYRIAM seal URL kasabay ng registry URL.

## Anong nakukuha ng mga recipient (regulators, journal reviewers, meta-analysts)

Ang isang trial na pre-registered sa ilalim ng MYRIAM ay nagbibigay
sa mga reviewer ng:

1. **Kriptograpikong patunay na ang protocol ay finalized sa
   isang partikular na oras.** Maaaring i-verify ng mga reviewer
   ang oras ng selyo sa pamamagitan ng OTS receipt.
2. **Bytewise stability ng protocol text.** Ang mga reviewer na
   naghahambing ng inilathalang methods section sa pre-registered
   design ay maaaring gawin ito character-by-character.
3. **Pagtukoy ng endpoint switching.** Ang isang simpleng diff
   sa pagitan ng sealed FACT 05 at ng inilathalang primary
   endpoint ay nagpapakita ng anumang substitution.
4. **Pagtukoy ng analysis-plan deviation.** Ang isang simpleng
   diff sa pagitan ng sealed FACT 06 at ng inilathalang
   statistical methods ay nagpapakita ng mga modipikasyon.
5. **Pagtukoy ng selective subgroup reporting.** Ang sealed FACT
   07 ay naglalaman ng lahat ng pre-registered subgroup; ang
   anumang nasa publication na wala sa selyo ay dapat i-label
   bilang post-hoc.

Ginagawa nitong mas madali nang malaki ang systematic review at
meta-analysis kaysa sa kasalukuyang practice.

## Ano ang HINDI ng kit na ito

- Hindi kapalit ng IRB / ethics-committee approval.
- Hindi kapalit ng jurisdictional registry registration.
- Hindi garantiya na ang trial ay isasagawa ayon sa plano.
- Hindi paraan upang i-angkla ang patient consent o iba pang
  ethical document (kailangan nila ng kanilang sariling
  mekanismo ng pag-selyo).
- Hindi proteksyon laban sa post-publication critique ng trial
  design.

## Isang tala sa publication ng negative-result

Ang Commitment #1 sa FACT 08 ("publication anuman ang direksyon")
ay ang nag-iisang pinakamataas-na-mortality-impact na commitment
sa selyo. Ang makasaysayang pagsupil ng negative trial result
(lalo na para sa mga gamot na psychiatric sa mga adolescent, mga
gamot na oncology sa elderly population, at mga gamot na
cardiovascular sa mga babae) ay malamang na nag-ambag sa libu-
libong napipigilang pagkamatay sa loob ng mga dekada sa
pamamagitan ng over-prescription batay sa biased efficacy
estimates.

Ang isang sealed commitment na maglathala ng negative results ay,
sa kanyang sarili, isa sa mga pinakamataas-na-leverage na
public-health move na maaaring gawin ng isang sponsor. Ang selyo
ay nagbibigay ng external accountability para sa commitment na
iyon sa isang paraan na hindi kayang gawin ng self-policed
publication policies.

## Pangwakas

Ang pre-registration ng drug trial sa ilalim ng MYRIAM ay maliit
na extra work para sa sponsor: ~30 minuto upang punan ang mga
fact, ~10 segundo upang mag-selyo. Ang accountability na
idinaragdag nito ay asimetrikal: maliit na gastos sa tapat na
pagsasagawa ng trial, malaking constraint sa post-hoc na
maneuvering na nag-ambag sa makasaysayang biases sa evidence
base.

Kung ikaw ay isang sponsor o principal investigator na nag-
iisip ng kit na ito, ang kit ay public domain (CC0). Gamitin ito.
Baguhin ito. Pagandahin ito.

## Lisensya

Public domain (CC0). Walang kinakailangang attribution.
