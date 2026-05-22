*Fandikan-teny Malagasy — ho an'ny kinova anglisy tany am-boalohany, jereo [README.md](README.md)*

# Fitaovana Famerenana Siantifika

Ohatra myriam-kit vonona hampiasaina ho an'ny vondrona fikarohana, gazety, ary andrim-panjakana mifantoka amin'ny famerenana izay maniry hamoaka manifesta famerenana nofantsihana amin'ny Bitcoin, izay tsy azo ovaina, miaraka amin'ny taratasy na pre-print.

## Izay vokarin'ity fitaovana ity

Famoahana voaisy tombo-kase ahitana, ho an'ny fianarana iray:

1. Famantarana ny fianarana (lohatenin'ny taratasy, mpanoratra, andrim-panjakana, mpamatsy vola, COI)
2. **SHA-256 amin'ny tahirim-baovao** — ny database canonika
3. **Hash ny tantanin'ny famakafakana** — script + sary Docker digest + ny dependensia mifatotra
4. **Hash ny fonon'ny vokatra andrasana** — izay tokony hamokarin'ny mpanontany marina
5. Protokôla famerenana + ny fanekena famoahana aorian'ny vokatra
6. Mpiantsoroka manao sonia

Ny tombo-kase dia natao ho an'ny dingana **alohan'ny famakafakana**: voafatotra ny vaovao, vita ny tantana, voakajy ny vokatra andrasana, MIALOHAN'NY ahitana vokatra ho an'ny tanjon'ny fanoratana ny taratasy.

## Izay arovan'ity fitaovana ity

**Fombafomba tsy fahombiazana izay azon'ny tombo-kase:**

- **p-hacking**: ny fiovana aorian'ny famakafakana rehefa hita ny vokatra dia azon'ny besinimaro tsapa amin'ny alalan'ny diff eo amin'ny FACT 04 voaisy tombo-kase sy ny tantana navoaka.
- **HARKing** (Famolavolana Hypôtezy aorian'ny Fahafantarana ny Vokatra): ny hypôtezy voarakitra mialoha ao amin'ny FACT 02 dia byte-marin-toerana.
- **Fanovana vaovao aorian'ny taratasy**: ny fanavaozana ny hash amin'ny tahirim-baovao mifanohitra amin'ny FACT 03 dia mampiseho ny fiovana rehetra.
- **Fivilan'ny tantana**: ny fanavaozana ny hash amin'ny tantanin'ny famakafakana mifanohitra amin'ny FACT 04 dia mahatsapa ny fiovana mangina.
- **Filalaovana ny mpanoratra**: ny fanampiana na fanesorana mangina mpanoratra aorian'ny famoahana dia lasa azo tsapa mifanohitra amin'ny FACT 02 voaisy tombo-kase.

**Fombafomba tsy fahombiazana TSY voarakotra:**

- Hosoka amin'ny fanangonana ny vaovao tany am-boalohany (ny tombo-kase dia mametaka vaovao amin'ny fotoanan'ny tombo-kase, fa tsy ny fanangonana)
- Tsy famerenana biolojika / empirika (ny tombo-kase dia mametaka ny famerenana ny kajy fotsiny)
- Olana amin'ny haben'ny santionany na fankatoavana ny mponina (ireo dia fanontaniana momba ny famolavolan'ny fianarana)
- Ny fahamarinan'ny filazana fototra (ny tombo-kase dia mametaka izay nolazaina, fa tsy raha mifanaraka amin'ny filazana ny tontolo iainana)

## Rehefa hampiasa ity fitaovana ity

Heveriana ny fametahana tombo-kase raha:

- Ianao dia vondrona fikarohana mampandeha famakafakana avo lenta (fitsapana ara-pitsaboana, fanombanana rafitra AI, fianarana famerenana) ary maniry ny fahamarinan-toetra forensika mihoatra ny marika fotoanan'ny OSF / GitHub
- Ianao dia mpikaroka manomboka asa izay maniry fiarovana laza tsy mitovy: pre-famakafakana voaisy tombo-kase dia midika hoe ny tsikera "namily ny p-haka" amin'ny ho avy dia manana mpanaporofo ho an'ny besinimaro
- Ianao dia tonian'ny gazety na mpitarika tetikasa famerenana izay maniry hampiroborobo ny pre-fisoratana anarana cryptographic-grade ho an'ny ampahany amin'ny taratasy
- Ianao dia miasa amin'ny famakafakana izay manana fiantraikany lehibe amin'ny sehatra ny fanovana aorian'ny vokatra (psych, toe-tsainy ara-toekarena, fikarohana ara-pitsaboana)

## Tantara taloha ny fahafatesana / fahasimbana

Ny fifandraisan'ny fahafatesan'ity fitaovana ity dia tsy mivantana:

- **Fikarohana sela-fototra / kansera tsy azo averina:** taratasy maro no nitarika ho amin'ny fahasimban'ny marary tamin'ny alalan'ny fitsapana ara-pitsaboana voakitsoka. Ny pre-fisoratana voaisy tombo-kase amin'ny tantana tany am-boalohany dia ho nafantsihan'ny fampitahana.
- **Ady momba ny mahomby an'i Tamiflu:** ny famerenan'ny Cochrane dia naharitra taona maro satria ny fahazoana ny vaovao tany am-boalohany dia iadian-kevitra. Ny hash vaovao voaisy tombo-kase amin'ny famoahana dia ho nahatonga ny ady momba ny fidirana amin'ny vaovao ho azo vahana avy hatrany.
- **Krizy ankapobeny tsy famerenana:** ny vidin'ny fahafatesana amin'ny sehatra ny fikarohana biomedika tsy azo averina dia lehibe (Begley & Ellis 2012 nanombana hoe > 50% amin'ny fikarohana preclinical no tsy azo averina). Ny fametahana cryptographic dia lalana iray ho an'ny rafitra.

## Ahoana ny fork-ana ity fitaovana ity

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# MAVESA-DANJA: ataovy izany MIALOHAN'NY ahitana vokatra rehetra
shasum -a 256 raw_data_v0.tar.gz       # kajio ny hash amin'ny vaovao canonika
shasum -a 256 analysis.py              # hash ny tantana
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # fenoy amin'ny sanda tena izy
bash build/seal.sh                     # ametaho tombo-kase MIALOHAN'NY fampandehanana ny famakafakana
python3 build/verify.py                # hamafiso

# Mampandehana ny famakafakana ankehitriny. Hash ny vokatra ary hamafiso fa mifanaraka amin'ny FACT 05.
# Raha tsy mifanaraka, tsy déterministe ny tantana; ahitsio sy ametaho tombo-kase indray.
```

## Fampidirana amin'ny fotodrafitrasa ara-pahaizana efa misy

- **arXiv / bioRxiv / medRxiv**: ampidiro ny URL tombo-kase MYRIAM na IPFS CID
  ao amin'ny soratra fohy na ireo fitaovana fanampiny
- **OSF**: ampifandraiso amin'ny tetikasa OSF ny artefakta tombo-kase eo akaikin'ny endrika pre-fisoratana mahazatra
- **AsPredicted**: ampidiro ny URL tombo-kase MYRIAM ao amin'ny antontan-taratasy pre-fisoratana
- **GitHub**: ny hash commit ny tantana famakafakana no ametahan'ny FACT 04;
  GitHub dia manome ny loharano, MYRIAM dia mametaka ny bytes
- **Zenodo / Figshare / OpenAIRE**: apetraho ny vaovao tany am-boalohany, dia ametaho tombo-kase
  ny hash an'ny petraka; ny tombo-kase dia sarotra kokoa amin'ny forensika ny fanoloana mangina noho ny metadata ny petraka
- **Fitaovana fanampin'ny gazety**: ampidiro ny artefakta tombo-kase MYRIAM ho rakitra fanampiny amin'ny fanaterana

## Izay TSY soloin'ity fitaovana ity

- Fankatoavana IRB / komity etika
- Famerenan'ny mpiara-miasa
- Fianarana famerenana (famerenana ny kajy ≠ famerenana empirika)
- Fifanarahana fahazoana vaovao ho an'ny vaovao saro-pady

## Fanamarihana momba ny filaharan'ny mpanoratra sy ny tombontsoa

Ny tombo-kase dia mametaka ny LISITRA NY MPANORATRA amin'ny fotoanan'ny fametahana tombo-kase. Ny ady momba ny mpanoratra izay mipoitra aorian'ny famoahana dia azo tombanana mifanohitra amin'ny lisitra voaisy tombo-kase. Izany dia lalana fitanisana kely — manan-danja ho an'ny ECRs izay nampian'ny anarana na nesorina mangina.

## Fahazoan-dàlana

Sehatry ny besinimaro (CC0). Ampiasao izany, ovay izany, tsy raharahaina izany, fork izany.
