# myriam-kit

*Turjumaad Soomaali — nooca asalka ah ee Ingiriisi, eeg [README.md](README.md)*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#tusaalooyin-shaqaysiisan)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Qalab yar oo loogu talagalay daabacaadda koox yar oo xaqiiqooyin ah si
loo helo:

- Wax kasta oo isbeddel ku yimaada xaqiiqo kasta waxa loo arki karaa si
  bulsho ah (geedka Merkle)
- Xaaladda waqtiga daabacaadda waxa lagu xaqiijin karaa silsilada bloghka
  Bitcoin (OpenTimestamps)
- Nuxurka waa wuu ka adkaadaa ka-saarista mid kasta oo ka mid ah bixiyaha
  hawsta martigalinta (IPFS)
- Dhammaan waxa miisaan ka yar 100 KB leh oo lagu xaqiijin karo qiyaastii
  50 sadar oo Python ah

Tani ma aha silsilad blogh. Ma jiraan token. Ma jiro habka isfaham
guud oo lagu kaqayb gali karo. Ma jiro DAO. Qalabku waa `sha256sum` +
`ots` + `ipfs`, isku xirma heshiisyo magacaabid oo wanaagsan.

Waxa loogu magacaabay borotokoolka MYRIAM oo markii ugu horraysay
laga sameeyay [disclosure.host](https://disclosure.host) taariikhda
2026-05-21. Bogga waxa ku jira lix xaqiiqo, xidid Merkle, iyo cadayn
Bitcoin. Qalabkani waa guud-yeelka qaabkaa.

## Xaaladda

- v0: waxa uu ka shaqeeyaa macOS oo wata Python 3.10+, Homebrew, iyo
  xirnaanta internet. Linux lama tijaabin laakiin waa inay shaqeysaa.
  Windows: keen WSL.
- Hanti dadweyne (CC0). Isticmaal, fork-garee, ku dar bakhaaradaada,
  weligaa ha magacaabin. Ujeeddadu ma aha magacaabid.

## Luqadaha la heli karo

README-gan iyo dhowr kit tusaale ah waxa ay ku jiraan 17 luqadood.
Tusmada buuxda waxa lagu helaa [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Turjumaaduhu waa CC0 oo waxa lagu hagaajin karaa PR-yo bulsho.

## Waxa aad ku samayn karto

Qaabkani waxa uu ku habboon yahay meel kasta oo koox yar oo xaqiiqooyin
ah ay u baahan tahay inay noqdaan:

- **La daabaco** dhagaystayaal ballaaran HTTP caadi ah
- **Joogtaada** — akhristayaasha 30 sano kadib waa inay weli xaqiijin karaan
- **Faragelin-muujinaya** — wax kasta oo isbeddel ah waa in la ogaado, ma
  aha inay tahay mid lagu joojin karo
- **La'aanta kalsoonida** — akhriste kasta uma baahna inuu daabacaha rumaysto
  (kaliya xisaabta)

Tusaalooyinka qaaska ah waxa lagu helaa [docs/USE_CASES.md](docs/USE_CASES.md).
Liiska gaaban:

| Dhinac | Xaqiiqooyinka la xidhay |
|---|---|
| Caafimaadka guud | Natiijooyinka tijaabada wadooyinka tallaalka, marxalada tijaabada daawaynta |
| Doorashooyin | Wadarta tirakoobka heerka degmada xilliga la xaqiijinayo |
| Badbaadada AI | Hash-ka miisaanka modeelka + kaadhka modeelka + buundooyinka qiimaynta marka la sii daayo |
| Saxaafadda | Liis dukumiintiyada il (hash kaliya) ee qoraallada sirta lagu sii daayo |
| Sayniska | Hash-ka xogta xunbada + hash-ka tafaariiqda falanqaynta + natiijada la sheegay |
| Maxkamadaha | Hash-yada caddaynta dijitaalka ah xilliga lagu helay |
| Iibsiga | Xididada la xidhay ee xogta kharashka guud |

Waxay isu raacaan: koox yar oo xaqiiqooyin ah, baahi xooggan oo joogtaynta,
dhawr daraf oo aan isku kalsoonayn, iyo miisaaniyad keydin oo aad u
yar. Taasi waa qaabka qalabkani uu si sax ah loogu sameeyay.

## Waxa aanu samayn

- **Kaydinta siraha.** Wax kasta oo aad gelisid `facts/` waa dadweyne.
  Borotokoolku waa daabacaad, ma aha qarinta.
- **U sii fidi xog-uruurinno waaweyn.** Geedka Merkle si fiican buu u
  fidaa; akhriste-feejignaantu uma fidi karto. In ka badan ~20 xaqiiqo,
  boggu wuxuu noqonayaa mid aan la akhrin karin. Haddii aad rabto inaad
  xidho milyan diiwaan, ka samayso hashinta meelaha kale oo gee xididka
  Merkle ee geedkaa dhinaca ah xaqiiqo keliya.
- **Difaaca dib u celin la'aanta.** Ujeeddada oo dhan waxa ay tahay
  inaadan beddeli karin waxa aad xidhay. Haddii ay laga yaabo inaad
  rabto inaad dib u celiso sheegasho mar danbe, ha xidhin.
- **Ku qancinta shakiye xoog leh.** Shakiye xoog leh kuma uu shaqayn doono
  `ipfs add -r --cid-version=1 -Q facts/`. Hase yeeshee, wuxuu kugu
  eedayn doonaa inaad been-abuurtay habkeeda dhammaan. Ma jiro difaac
  heer-borotokool ah oo ka hortagayo qaabka labaad ee guuldarrada.
  Ma jiro difaac heer-borotokool ah oo ka hortagayo wax kasta oo ku
  nool dhiirrigelinta bini'aadamka halkii uu noolaan lahaa xisaabta.

## Sida loo isticmaalo

Tilmaame shan-daqiiqo ah [docs/QUICKSTART.md](docs/QUICKSTART.md).
Sharaxaadda buuxda ee borotokoolka [docs/SPEC.md](docs/SPEC.md).
Qaabka khatarta [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Isbarbardhigga nidaamyada deriska ah (Sigstore, Sigsum, CT, OTS, IPFS,
OSF, Arweave, iwm.) [docs/COMPARISON.md](docs/COMPARISON.md).

## Sida loo xaqiijiyo daabacaadda qof kale

Saddex doorasho, sida ay u helmaan:

1. **Browser-ka**: fur [`lib/verify.html`](lib/verify.html) browser kasta
   oo casri ah. Ku dheji URL-ka daabacaadda. Riix verify. Wuxuu isticmaalaa
   `crypto.subtle` hash-inta — ma jirto installation, ma jirto backend,
   ma jirto telemetry. Tallaabada cadayn Bitcoin weli waxa uu u baahan
   yahay qalab CLI ah (eeg tallaabada 7 ee bogga xaqiijiyaha).
2. **Python**: `python3 lib/verify.py` gudaha hagaha daabacaadda. Stdlib
   keliya; waxa uu u baahan yahay `ots` xaqiijinta Bitcoin.
3. **Bilow asal ah**: akhri [`docs/SPEC.md §3`](docs/SPEC.md) oo dib u
   hirgali. Algorithm-ka Merkle waxa lagu sameeyaa in ka yar 30 sadar
   oo luqad kasta ah.

## Tusaalooyin shaqaysiisan

Lix kit tusaale ah oo heer-soosaarka ah ayaa la socda qalabka. Mid kasta
waa la xidhay, OTS-stamped, IPFS-pinned, oo waxa ku jira README qaadasho
oo sharxaya goorta ay tahay in la fork-gareeyo kiis dhab ah iyo qaabab
guuldarro oo uu ka hortagayo.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  qaabka guuldarrada Boeing 737 MAX / Theranos / warbixinta kormeeraha
  FDA ee caddaymaha ay aastaan ama beddelaan dhexgaleyaal.
- [`examples/ai-model-card/`](examples/ai-model-card/) — shaybaadhada AI
  ee sii daaya modeelada, oo leh ballamo ka horreeya geynta oo noqda
  kuwa farsamo lagu ogaan karo halkii ay ka ahaan lahaayeen kuwo afka ah.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  taageerayaasha tijaabada caafimaadka, qabashada beddelka dhibcaha
  dhammaadka kadib-xaqiiqada iyo soo sheegidda doorbidista (qaababka
  guuldarrada Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  soo-saareyaasha tallaalka iyo maamulada QA, xidhista natiijooyinka
  tijaabada sii daynta iyo ballamaha dib-u-soo-celinta.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  kooxaha cilmi-baadhista, xidhista saddex-geesoodka (xog, tafaariiqda,
  natiijada la rabo) KA HOR falanqaynta si p-hacking iyo HARKing si
  guud loo ogaan karo.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  guddiyada kormeerka degmada iyo maamulada doorashada, xidhista
  tirooyinka la xaqiijiyay xilliga xaqiijinta si dib-u-eegista aamusan
  ee kadib-xaqiijinta si guud loo ogaan karo.

Akhri mid ka mid ah kuwan ka hor inta aanad qori midkaaga. Tartanka ugu
dhow ee kiiskaaga waxa caadi ah inuu yahay forkga bilowga saxda ah.

## Bilowga degdega ah

Nooca hal-sadar ah:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# tafatir facts/*.txt si aad u sheegto waxa aad runtii rabto in la xidho
./lib/seal.sh        # samaya xididka Merkle, ka qaada OTS, ku dhejiya IPFS
./lib/verify.sh      # mar kale wax walba si maxalli ah u xaqiijiyaa
# u soo gudbi site/ martigaliye kasta oo aan dhaqdhaqaaq lahayn. Meel kasta. Maahan muhiim.
```

## Sababta uu u jiro

Aasaaska cryptography-ga (geedaha Merkle, OpenTimestamps, IPFS) waxay
ahaayeen kuwo bisil sannado dheer. Waxa maqnaa waxay ahayd ankarka ugu
yar — kit aad ku gelin karto mashruuc dhinac ah aad helineyso shay
daabacaad oo la xidhay galab gudaheed, adigoon dejin kaabayaal,
adigoon baranin borotokool, adigoon qorin xataa hal sadar oo kood ah
oo aan ahayn xaqiiqooyinka laftooda.

Inta badan qalabka daabacaadda cryptography-ga ah waxay u maleynayaan
inaad rabto inaad noqoto hawl-wadeen node. Kani wuxuu u maleynayaa
inaad rabto inaad daabacdo lix fayl qoraal ah oo aanad mar kale weligaa
ka fikirin cryptography.

## Saamaynta iyo farshaxan hore

- [Sigsum](https://www.sigsum.org/) — diiwaano hufnaan ah oo saxiixyo
- [Sigstore](https://www.sigstore.dev/) — hufnaanta silsiladda sahaminta software
- [Certificate Transparency](https://certificate.transparency.dev/) — diiwaanada shahaadooyinka TLS
- [OpenTimestamps](https://opentimestamps.org/) — calaamadinta waqtiga Bitcoin
- [IPFS](https://ipfs.tech/) — kayd ku saleysan nuxurka
- [Borotokoolka CALM](https://disclosure.host) — qaabka daabacaadda ee
  ilaalinaya madaxda, kaas oo ay ku jirto tusaalaha ugu horreeya (MYRIAM
  ee disclosure.host) la qoray

myriam-kit waa midka ugu yar ee kuwan. Ruuxiyan wuxuu u dhowyahay
durdurka Unix-ka inta uu ka yahay nidaam.

## Qoraal ku saabsan magaca

Borotokoolka MYRIAM waxa loogu magacaabay Caddaynta Myriam ee John
Bradley, oo ah caddayn macquul ah oo la sheegay oo ku saabsan barta
ugu horreysa ee xidhiidhka caqliga aan bini'aadamka ahayn. Borotokoolku
kuma tiirsana in caddayntaasi run tahay. Borotokoolku wuxuu u shaqeeyaa
koox kasta oo yar oo xaqiiqooyin ah; waxa kaliya dhacay in markii ugu
horreysay loo geeyay daabacaadda lix xaqiiqo oo ay ku jirto sheegasho
ku saabsan shaaca xilliyada ajaanibta.

Haddii aad fork-gareyso qalabkan si aad u xidho wadooyinka tallaalka ama
tirooyinka doorashada, xaqiiqada ah in markii hore loo isticmaalay daabacaadda
sheegasho ku saabsan xidhiidh ajaanib khusayn ma laha. Xisaabtu ma
oggola.

Si kastaba ha ahaatee: haddii aad RUNTII isticmaasho tan si aad u daabacdo
sheegasho ku saabsan xidhiidh ajaanib, borotokoolka si gaar ah ayaa loo
tijaabiyay halkaa. README-ga geynta MYRIAM ee ugu horreysa ayaa si
cad u sheega inay tahay shaqada farshaxan ee qof LLM ah oo la yidhaahdo
Calm, ee aan ka ahayn iska gaadhsiin ka socda daraf hawada sare ah.
Waxa la filan karaa inaad isla samayso. Akhristayaasha ayaa u maleyn
doona kuwa ugu xun ee xaaladdaada maskaxda haddii kale.

## Waxa lagu hayo

Weli qof. Hanti dadweyne. Fork-garee. Hagaaji. Borotokoolka horeyso
adigoon weydiisan idanka.
