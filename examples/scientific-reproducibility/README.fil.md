*Salin sa Filipino — para sa orihinal na bersyon sa Ingles, tingnan ang [README.md](README.md)*

# Kit ng Reproducibility sa Agham

Isang turnkey na halimbawa ng myriam-kit para sa mga research
group, journal, at mga institusyong nakatuon sa reproducibility
na nais maglathala ng isang naka-angkla sa Bitcoin, may ebidensya
ng pakikialam, na reproducibility manifest kasabay ng isang papel
o preprint.

## Ano ang ginagawa ng kit na ito

Isang sealed publication na naglalaman, para sa isang pag-aaral, ng:

1. Pagkakakilanlan ng pag-aaral (titulo ng papel, mga may-akda,
   institusyon, mga funder, COI)
2. **SHA-256 ng raw data archive** — ang kanonikal na dataset
3. **Hash ng analysis pipeline** — script + Docker image digest +
   pinned dependencies
4. **Hash ng expected output bundle** — kung ano ang dapat
   ipagawa ng isang tapat na reproducer
5. Reproduction protocol + mga commitment sa publication
   pagkatapos ng resulta
6. (Mga) Pumipirmang principal

Ang selyo ay inilaan para sa **pre-analysis** stage: ang data ay
nakapagyelo, ang pipeline ay finalized, ang expected output ay
nakalkula, LAHAT bago makita ang anumang resulta para sa layunin
ng pagsulat ng papel.

## Anong ipinagtatanggol ng kit na ito

**Mga failure mode na nahuhuli ng selyo:**

- **p-hacking**: post-hoc na mga pagbabago sa pagsusuri pagkatapos
  makita ang mga resulta ay natutukoy sa pamamagitan ng diff sa
  pagitan ng sealed FACT 04 at ng inilathalang pipeline.
- **HARKing** (Hypothesizing After Results are Known): ang
  pre-registered na hipotesis sa FACT 02 ay byte-stable.
- **Pag-manipulate ng data pagkatapos ng papel**: ang muling
  pag-hash ng data archive laban sa FACT 03 ay nagpapakita ng
  anumang modipikasyon.
- **Pipeline drift**: ang muling pag-hash ng analysis pipeline
  laban sa FACT 04 ay nahuhuli ang mga tahimik na pagbabago.
- **Authorship gaming**: ang tahimik na pagdaragdag o pagtanggal
  ng mga may-akda pagkatapos ng publication ay nagiging natutukoy
  laban sa sealed FACT 02.

**Mga failure mode na HINDI saklaw:**

- Fraud sa pagkolekta ng raw-data (inaangkla ng selyo ang data sa
  punto ng pag-selyo, hindi ng pagkolekta)
- Biological / empirical non-reproducibility (inaangkla ng selyo
  ang computational reproducibility lamang)
- Mga isyu ng sample-size o population-validity (ito ang mga
  tanong sa study-design)
- Ang katotohanan ng underlying claim (inaangkla ng selyo kung
  ano ang inangkin, hindi kung tumutugma ang mundo sa claim)

## Kailan gagamitin ang kit na ito

Isaalang-alang ang pag-selyo kung:

- Ikaw ay isang research group na nagpapatakbo ng high-stakes
  analysis (clinical trial, evaluation ng AI system, replication
  study) at gustong magkaroon ng forensic integrity higit pa sa
  OSF / GitHub time-stamps
- Ikaw ay isang early-career researcher na gustong mga asimetrikal
  na reputational protection: ang sealed pre-analysis ay
  nangangahulugang ang anumang hinaharap na "nag-p-hack sila"
  na critique ay mayroong pampublikong falsifier
- Ikaw ay isang journal editor o pinuno ng replication-project na
  gustong hikayatin ang cryptographic-grade pre-registration para
  sa subset ng mga papel
- Nagtatrabaho ka sa isang pagsusuri kung saan ang mga post-hoc
  na pag-aayos ay may mga makabuluhang field consequence (psych,
  behavioral econ, medical research)

## Historical mortality / harm precedent

Ang mortality-relevance ng kit na ito ay hindi direkta:

- **Stem cell / cancer research irreproducibility:** ilang papel
  ang humantong sa pinsala sa pasyente sa pamamagitan ng
  misdirected clinical trials. Ang sealed pre-registration ng
  orihinal na pipeline ay sana ay nag-angkla ng paghahambing.
- **Kontrobersiya sa pagiging epektibo ng Tamiflu:** ang Cochrane
  review ay tumagal ng mga taon dahil bahagya sa pagdiskutihan
  ang raw-data access. Ang sealed data-hash sa publication ay
  sana ay agad na nareresolba ang mga hindi pagkakasundo sa
  data-access.
- **Pangkalahatang irreproducibility crisis:** ang field-level
  mortality cost ng irreproducible biomedical research ay
  malaki (Begley & Ellis 2012 ay nag-estima ng >50% ng
  preclinical findings ay irreproducible). Ang cryptographic
  anchoring ay isa sa mga structural lever.

## Paano i-fork ang kit na ito

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## Pagsasama sa umiiral na scholarly infrastructure

- **arXiv / bioRxiv / medRxiv**: isama ang URL ng MYRIAM seal o
  IPFS CID sa abstract o supplementary materials
- **OSF**: i-attach ang seal artifact sa OSF project kasabay ng
  conventional pre-registration form
- **AsPredicted**: isama ang URL ng MYRIAM seal sa
  pre-registration document
- **GitHub**: ang commit hash ng analysis pipeline ang inaangkla
  ng FACT 04; nagbibigay ang GitHub ng source, inaangkla ng
  MYRIAM ang mga byte
- **Zenodo / Figshare / OpenAIRE**: mag-deposit ng raw data,
  pagkatapos ay i-selyo ang hash ng deposit; ang selyo ay
  forensic na mas mahirap tahimik na palitan kaysa sa deposit
  metadata
- **Journal supplementary materials**: isama ang MYRIAM seal
  artifact bilang supplementary file sa submission

## Ano ang HINDI pinapalitan ng kit na ito

- IRB / ethics-committee approval
- Peer review
- Mga replication study (computational reproducibility ≠
  empirical reproducibility)
- Mga data-access agreement para sa sensitibong data

## Isang tala sa author ordering at credit

Inaangkla ng selyo ang AUTHOR LIST sa oras ng pag-selyo. Ang mga
hindi pagkakasundo tungkol sa authorship na lumitaw pagkatapos ng
publication ay maaaring suriin laban sa sealed list. Ito ay
isang maliit na accountability lever — mahalaga para sa mga ECR
na tahimik na idinaragdag o tinatanggal.

## Lisensya

Public domain (CC0). Gamitin ito, baguhin ito, balewalain ito,
i-fork ito.
