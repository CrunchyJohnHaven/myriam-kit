*Fandikan-teny Malagasy — ho an'ny kinova anglisy tany am-boalohany, jereo [README.md](README.md)*

# Fitaovana Fanaporofoana Vatra Vaksiny

Ohatra vonona avy amin'ny myriam-kit ho an'ireo mpamokatra vaksiny,
manampahefana fanaraha-maso ny kalitao, ary masoivohon'ny fahasalamam-bahoaka
maniry hamoaka tombo-kase ifaharan'i Bitcoin, tsy azo hovaina, amin'ny
famoahana vatra.

## Izay arovan'ity fitaovana ity

**Karazana fahadisoana izay tratran'ny tombo-kase:**

- **Fanovana mangina aorian'ny famoahana ny vokatry ny fitsapana
  famoahana.** Voapotehina daholo ireo 8 PDF fitsapana famoahana ao
  amin'ity ohatra ity. Famerenana ny hash aorian'ny famoahana dia
  mampiseho izay fanovana.
- **Ady momba ny famaritana izay nampiharina tamin'ny famoahana.** Ny
  FACT 02 voakase dia mirakitra ny famantarana ofisialy ny vatra sy
  ny hash an'ny rakitra fanamboarana. Ny ady ho avy hoe "ny famaritana
  dia X foana" dia manana fototra ho an'ny daholobe.
- **Fihenan'ny halehiben'ny famerenana mangina.** Ny adidy
  pharmacovigilance ao amin'ny FACT 05 dia voakase; ny tsy fanajana
  azy ireo dia hita mibahantra.
- **Famaritana indray taorian'ny vatra tsy tonga lanja.** Raha ny
  valim-pitsapana famoahana dia tena PASS sisin'ny faritra izay nadika
  ho FAIL aorian'ny famoahana, ny hash an'ny tatitra voakase dia
  manaporofo izay nolazain'ny PDF valiny tany am-boalohany.

**Karazana fahadisoana TSY voarakotra:**

- Hosoka amin'ny dingana fanamboarana mihitsy (ny tombo-kase dia mamatotra
  ny valim-pitsapana, fa tsy ny fahamarinan'ny fanamboarana).
- Trangan-javatra ratsy izay vokatra biolojika amin'ny vatra mandalo
  fanadinana (ny tombo-kase dia tsy manamarina ny fahasalaman'ny
  marary, fa ny fahamarinan'ny antontan-taratasy ihany).
- Ady momba ny kinova famaritana ara-dalàna inona no manana fahefana.

## Rahoviana hampiasaina ity fitaovana ity

Hevero ny fanaovana tombo-kase amin'ny famoahana vatra raha:

- Mpamokatra vaksiny ianao izay maniry hampisehoana ny fahamarinana
  forensika an'ny rakitra famoahana mihoatra noho izay takian'ny
  mpandinika
- Ekipa QA ianao izay mandray ny fanao "amoaka izay caddeevamy"
- Mpamokatra ambaratonga kely / nasionaly ianao any amin'ny faritany
  manana foto-drafitra fanaraha-maso malemy kokoa, te-hampifandray
  ny rakitry ny vatra amin'ny mpamarina manerantany
- Sampandraharaha fahasalamam-bahoaka na ONG mitantana fandaharanasa
  famokarana vaksiny tsy ara-barotra ianao (ohatra ho an'ny aretina
  navelan'ny olona)

## Taranja momba ny fahafatesana ara-tantara

- **Fandotoana heparin (2008, Sina):** sulfata chondroitin oversulfated
  sandoka tao amin'ny vatra heparin. Manifestasiona fitsapana famoahana
  voakase dia ho nahatonga ny fanovana mangina aorian'ny famoahana ny
  rakitry ny fitsapana ho azo hitan'ny kriptografika.
- **Tylenol cyanide (1982):** ady aorian'ny tantara momba ny niandohan'ny
  teboka fanesoresoana. Hash an'ny rakitry ny fanamboarana voakase dia
  mamatotra ny toetra mialoha-fizarana.
- **Ireo famerenana vatra vaksiny isan-karazany** izay manjary mafy ny
  fanontaniana hoe "voatsapa marina ve ity vatra ity" taona maro
  taty aoriana.

Tsy famahana ny fitaovana ho an'ireo rehetra ireo amin'ny dikany hentitra
— fa amin'ny tranga tsirairay, ny fanamarinana vatra voakase dia ho
nanome vita fotoana forensika mahasoa kokoa.

## Ahoana ny fomba famorinana an'ity fitaovana ity ho an'ny vatra marina

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # soloy votoatiny marina ny votoatiny noforonina
bash build/seal.sh        # HOKASEINA ALOHAN'NY hanombohan'ny fizarana
python3 build/verify.py   # hamarinina
```

**FOTOANA LEHIBE**: hokaseina amin'ny fotoanan'ny famoahana QA, ALOHAN'NY
hizarana ny vatra. Tombo-kase aorian'ny fizarana dia malemy forensikany.

## Fampidirana amin'ny foto-drafitra famokarana fanafody efa misy

- **Fanaterana eCTD (FDA / EMA):** ny URL famoahana voakase na CID
  IPFS dia azo tononina ao amin'ny fizarana Module 3 (kalitao)
- **WHO Prequalification:** ny manifestasiona voakase dia mampiseho
  ny rojo fitsapana mialoha-famoahana ho an'ny faritany tsy
  FDA/EMA
- **Famerenan-kevitra pharmacovigilance:** ny FACT 05 dia mamatotra
  ny mpamokatra amin'ny tatitra voakase ny isan'ny AE-na manontolo
  amin'ny volana 6 sy 12
- **Rafitra famerenana (RxConnect, MedWatch):** raha ilaina famerenana,
  ny halehiben'ny famerenana mihitsy dia voakase ao ambany MYRIAM,
  manome porofo ho an'ny daholobe fa ny anjara rehetra napariaka dia
  ho atrehina

## Izay TSY soloin'ity fitaovana ity

- Fanaterana ara-dalàna FDA / EMA / WHO
- Lalan'ny audit GMP (ny tombo-kase dia mamatotra ny VOKATRA, fa tsy
  ny rakitry ny dingana raha)
- Tahirin-kevitra pharmacovigilance (VAERS / EudraVigilance)
- Rafitra fandrindrana famerenana

## Lisansa

Domaine ho an'ny daholobe (CC0). Forky azy. Tsy mila famantarana.
