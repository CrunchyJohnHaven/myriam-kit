# myriam-kit

*Uhumusho lwesiZulu — ngenguqulo yokuqala yesiNgisi, bheka [README.md](README.md)*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Ithulkithi elincane lokushicilela iqoqo elincane lamaqiniso ngendlela yokuthi:

- Noma yiluphi ushintsho kunoma yiliphi iqiniso luyatholakala ngokusobala (isihlahla seMerkle)
- Isimo ngesikhathi sokushicilela siyaqinisekiseka ngokumelene neBitcoin blockchain (OpenTimestamps)
- Okuqukethwe kuyasinda ekususweni noma yimuphi umhlinzeki oyedwa wokuxhasa (IPFS)
- Konke lokhu kusinda ngaphansi kuka-100 KB futhi kuyaqinisekiseka ngemigqa engaba ngu-50 yePython

Lokhu akusona iblockchain. Akukho thokheni. Akukho ndlela yokuvumelana yokubamba iqhaza kuyo. Akukho DAO. Ithuluzi nguthi `sha256sum` + `ots` + `ipfs`, ahlanganiswe ndawonye ngezindlela ezinhle zokuqamba amagama.

Ithulkithi liqanjwe ngemuva komthethosivivinywa weMYRIAM owaqala ukuqaliswa
[disclosure.host](https://disclosure.host) ngo-2026-05-21. Lelo khasi liqukethe
amaqiniso ayisithupha, impande yeMerkle, kanye nobufakazi beBitcoin. Lo mthuluzi ungukwenziwa kabanzi
kwalelo phethini.

## Isimo

- v0: isebenza ku-macOS nge-Python 3.10+, Homebrew, kanye noxhumano lwe-inthanethi. ILinux ayikahlolwa kodwa kufanele isebenze. IWindows: phatha iWSL.
- Indawo yomphakathi (CC0). Yisebenzise, yihlukanise, yibeke endaweni yakho, ungalokothi
  uyivumele. Inhloso akusilo udumo.

## Izilimi ezitholakalayo

Le README kanye namathuluzi esibonelo ezimbalwa zitholakala ngezilimi eziyi-17.
Inkomba egcwele i-[TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Izinguqulo ziyi-CC0 futhi zingathuthukiswa nge-PR yomphakathi.

## Ongakwenza ngalo

Iphethini ifaneleka noma yikuphi lapho iqoqo elincane lamaqiniso lidinga ukuba:

- **Kushicileleke** ezihlokweni ezibanzi nge-HTTP elula
- **Kuhlale isikhathi eside** — abafundi eminyakeni engama-30 ezayo kufanele basakwazi ukuqinisekisa
- **Kubonakalise ukushintshwa** — noma yiluphi ushintsho kufanele lutholakale, hhayi ngempela luvinjelwe
- **Kungadingi ukwethemba** — akekho umfundi okufanele athembele kumshicileli (kuphela kumathematika)

Izindlela ezithile zokusebenzisa i-[docs/USE_CASES.md](docs/USE_CASES.md). Uhlu olufushane:

| Indawo | Amaqiniso avalelwe |
|---|---|
| Impilo yomphakathi | Imiphumela yokuhlolwa kweqembu lomgomo, izinhliziyo zokuhlolwa kwemithi |
| Ukhetho | Amanani okubalwa ezigodini ngomzuzu wokufakazelwa |
| Ukuphepha kwe-AI | I-hash yezisindo zemodeli + ikhadi lemodeli + amaphuzu okuhlola ngenkathi kukhululwa |
| Imithombo yezindaba | Manifesti yamadokhumenti omthombo (ama-hash kuphela) wokucwila kwabashicileli ezimfihlweni |
| Isayensi | I-hash yedatha eluhlaza + i-hash yeskripthi sokuhlaziya + umphumela othenjwayo |
| Izinkantolo | Ama-hash okuboniswa kudijithali ngomzuzu wokuthola |
| Ukuthengwa | Izimpande ezivalelwe zedatha yokusebenzisa imali yomphakathi |

Yini ezifana ngayo lezi: iqoqo elincane lamaqiniso, isidingo esinamandla sokuma isikhathi eside,
amaqembu amaningi angathembani, kanye nebhajethi encane yokugcina.
Lokho yibo bukhulu obumiswe lo mthuluzi.

## Yini ENGAYENZI

- **Igcine izimfihlo.** Konke okufaka ku-`facts/` kuyimfihlo yomphakathi. Iphrothokholi
  iyokushicilela, hhayi yokufihla.
- **Ukukala ngokwedatha enkulu.** Isihlahla seMerkle siyakwazi ukukala kahle; ukunaka komfundi
  akukwazi. Ngaphezu kwamaqiniso angaba ngu-20 ikhasi liba ngavumelekile ukufundwa. Uma
  ufuna ukuvala izinkulungwane ezisigidi, hash yazo ngaphandle kwekhasi futhi ufake
  impande yeMerkle yaleso sihlahla esisemaceleni eqinisweni elilodwa.
- **Ukuzivikela ekuhoxisweni.** Inhloso yonke ukuthi awukwazi ukushintsha
  okuvalile. Uma ungase ufune ukuhoxisa isimangalo kamuva, ungayivali.
- **Ukukholisa umzizi onesibindi.** Umzizi onesibindi ngeke asebenzise
  `ipfs add -r --cid-version=1 -Q facts/`. Kepha, uzokumangalela
  ngokuqamba konke ukusethwa. Akukho ukuvikelwa kwezinga lephrothokholi
  kuhlobo lwesibili lokwehluleka. Akukho ukuvikelwa kwezinga lephrothokholi
  kunoma yini ehlala kuzinhloso zabantu kunokuba kumathematika.

## Indlela yokuyisebenzisa

Ukuhamba kwemizuzu emihlanu ku-[docs/QUICKSTART.md](docs/QUICKSTART.md).
Inkambiso egcwele yephrothokholi i-[docs/SPEC.md](docs/SPEC.md).
Imodeli yobungozi ku-[docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Ukuqhathaniswa nezinhlelo eziseduze (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, njll.) ku-[docs/COMPARISON.md](docs/COMPARISON.md).

## Indlela yokuqinisekisa okushicilelwe komunye umuntu

Izindlela ezintathu, ngokulandelana kwesakhamuzi:

1. **Isiphequluli**: vula i-[`lib/verify.html`](lib/verify.html) kunoma yisiphi
   isiphequluli sanamuhla. Namathisela i-URL yokushicilela. Chofoza qinisekisa. Isebenzisa
   i-`crypto.subtle` ye-hashing — akukho kufaka, akukho backend, akukho telemetry.
   Isinyathelo sobufakazi beBitcoin sisadinga ithuluzi le-CLI (bheka isinyathelo 7 ekhasini
   lomqinisekisi).
2. **IPython**: `python3 lib/verify.py` ngaphakathi kwedayirektri yokushicilela.
   Kuphela kwe-stdlib; idinga i-`ots` yokuqinisekiseka kweBitcoin.
3. **Ngokwesula**: funda i-[`docs/SPEC.md §3`](docs/SPEC.md) futhi
   uphinde uyenze kabusha. I-algorithm yeMerkle ingaphansi kwemigqa engama-30 kunoma yiluphi ulimi.

## Izibonelo ezisebenzayo

Amathuluzi esibonelo ayisithupha angqongqoshe womkhiqizo athunyelwe nethulkithi. Ngalinye
livalwe, libekwe i-OTS-stamp, lifakwe i-IPFS, futhi lifaka i-README yokwamukela
echaza ukuthi nini ufanele uyihlukanise yendaba yangempela kanye nezindlela
zokwehluleka eziyivikelayo.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  yendlela yokwehluleka yeBoeing 737 MAX / Theranos / umbiko womhloli we-FDA
  lapho ubufakazi bungcwatshwa noma bushintshwa abadlulisi.
- [`examples/ai-model-card/`](examples/ai-model-card/) — yamasayilebhu e-AI
  akhipha amamodeli, namathekiselo angaphambi kokusetshenziswa abe
  nokutholakala okumikhuva esikhundleni sokuthi ngomlomo.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  yabaxhasi bemilando yokuhlolwa kwemithi, ukubamba ukushintsha
  kweminyombo emuva kwesikhathi kanye nokubika okukhethile (izindlela
  zokwehluleka zeVioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  yabakhiqizi bomgomo nabaphathi be-QA, ukubophezela imiphumela yokuhlolwa
  kokukhishwa kanye nokubophezela kokubuyiselwa.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  yamaqembu okucwaninga, ukubophezela ithriphili (idatha, ipayipi, umphumela
  olindelekile) NGAPHAMBI kokuhlaziya ukwenza i-p-hacking kanye
  ne-HARKing kuphephelo komphakathi.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  yamabhodi ezifunda nabaphathi bokhetho, ukubophezela ukubalwa
  okufakazelwe ngomzuzu wokufakazela ukuze ukuhlukunyezwa ngokuthuleyo
  ngemva kokufakazelwa kubonakale komphakathi.

Funda eyodwa yalezi ngaphambi kokubhala eyakho. Okufanelana kakhulu nesikhundla
sakho sokusebenza ngokuvamile yi-fork eqondile yokuqala.

## Ukuqala okusheshayo

Inguqulo yomugqa owodwa:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# hlela facts/*.txt ukusho lokho okufuna ukukuvala ngempela
./lib/seal.sh        # yakha impande yeMerkle, igxivize i-OTS, ihloma i-IPFS
./lib/verify.sh      # iphinda iqinisekise konke ngokomphakathi
# layisha i-site/ kunoma yikuphi okusakaza okuthi. Noma kuphi. Akubalulekile.
```

## Kungani kukhona

Izinto eziyisisekelo zokukhonkretha (izihlahla zeMerkle, OpenTimestamps, IPFS) sezivuthiwe
iminyaka. Okwakuntulekile kwakuyincazelo encane kakhulu — ithulkithi
ongafaka kuphrojekti ecaleni futhi ube nesithombe esivalwe esishicilelekayo
ngosuku, ngaphandle kokumisa ingqalasizinda, ngaphandle kokufunda
amaphrothokholi, ngaphandle kokubhala umgqa owodwa wekhodi ngaphezu kwamaqiniso
ngokwawo.

Amathuluzi amaningi okushicilela ngokukhonkretha athatha ukuthi ufuna ukuba ngumshayeli
we-node. Lona uthatha ukuthi ufuna ukushicilela amafayela amabhukana ayisithupha futhi ungalokothi
ucabange ngekhonkretha futhi.

## Imithombo nemisebenzi yangaphambili

- [Sigsum](https://www.sigsum.org/) — amalogi okusobala asayindwe
- [Sigstore](https://www.sigstore.dev/) — ubuqotho beshalichein yokuhlinzekwa kwesofthiwe
- [Certificate Transparency](https://certificate.transparency.dev/) — amalogi e-cert ye-TLS
- [OpenTimestamps](https://opentimestamps.org/) — uhlelo lwesikhathi se-Bitcoin
- [IPFS](https://ipfs.tech/) — isitoreji se-content-addressed
- [The CALM protocol](https://disclosure.host) — uhlaka lokushicilela
  oluvikela umphathi okusungulwa ngalo isibonelo sokuqala (i-MYRIAM e-disclosure.host)

I-myriam-kit yiyo encane kunazo zonke. Iseduze ngomoya nepayipi le-Unix
kunesistim.

## Inothi ngalelo gama

Iphrothokholi ye-MYRIAM yathiwa ngegama ngokweMyriam Proof kaJohn Bradley, ubufakazi
obugqamile bezombusazwe mayelana nepoyinti lokuqala lokuxhumana nobuhlakani obungebona
obabantu. Iphrothokholi ayincikile kulobo bufakazi obuyiqiniso. Iphrothokholi
isebenza kunoma yiliphi iqoqo elincane lamaqiniso noma yikuphi; kwenzeka nje ukuthi
yathunyelwa okokuqala ukushicilela amaqiniso ayisithupha afaka isimangalo mayelana
nokuhlanga abacaceleko.

Uma uhlukanisa lo mthuluzi ukuze uvale amaqembu omgomo noma amanani okubalwa kokhetho, iqiniso
elokuthi yasetshenziswa ekuqaleni ukushicilela isimangalo mayelana nokuxhumana nabacaceleko
alibalulekile kuwe. Imathematika ayinaki.

Konke lokho: uma U-ZE usebenzise lokhu ukushicilela isimangalo mayelana nokuxhumana nabacaceleko,
iphrothokholi ihlolwe empini kuleyo ndawo eqondile. I-README yokufakwa
kokuqala kwe-MYRIAM ngokucacile ithi yini umsebenzi wobuciko womlingiswa we-LLM
ogama lakhe linguCalm, hhayi ukuxhumana nanoma yiluphi iqembu lokuthi ungaphandle
komhlaba. Mhlawumbe nawe ufanele wenze njalo. Abafundi bazocabanga okubi kakhulu
mayelana nesimo sakho sengqondo uma kungenjalo.

## Iphethwe ngu

Akekho okwamanje. Indawo yomphakathi. Yihlukanise. Yithuthukise. Yiphathe iphrothokholi
phambili ngaphandle kokucela imvume.
