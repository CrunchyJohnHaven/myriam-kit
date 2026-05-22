*Turjumaad Soomaali — nooca asalka ah ee Ingiriisi, eeg [README.md](README.md)*

# Kit Shaabad ee Manifesto Whistleblower-ka

Tusaale turnkey myriam-kit ah oo loogu talagalay whistleblower-rada wajahaya nooca khaaska ah ee fashilka oo ah **caddaynta lagu aaso, la tafatiro, ama lagu doodo dhexdhexaadiyeyaasha u dhexeeya whistleblower-ka iyo dadweynaha**. Kiisaska taariikheed ee canonical-ka ah ee tan ka difaaca:

- Boeing 737 MAX (warbixinnada amniga gudaha la qiimeeyay/la aasay)
- Theranos (welwelka tijaabada shaybaarka oo sannado loo cabbudhiyey)
- Warbixinnada kormeeraha FDA oo la tafatiray ka dib soo gudbinta
- Frances Haugen / Facebook (manifesto shaabadan ayaa caddayn lahaa in dukumiintiyadu ay ahaayeen kuwo dhab ah oo jiray waqtigii la sheegay)

Waxa kit-kani ka difaaco (ereyada protocol-ka):

- T1–T3 ee [FACT 05](facts/05_threat_model.txt): muran dadweyne oo ku saabsan waxa ku jira dukumiintiga, sheegasho ah in dukumiintigu aanan shaabadan lahayn waqtigii la sheegay, sheegasho ah samaynta dib u dhalad.
- T9: dhinacyo saddexaad oo siiya saxafiyiinta nuqul la beddelay.

Waxa kit-kani **aan** ka difaaceyn:

- Aargoosi shakhsi ah oo lala beegsado whistleblower-ka (T7).
- Cadaadis lagu hayo whistleblower-ka inuu ka noqdo (T4, qayb ahaan waxaa yareeya FACT 07 oo ka dhigaysa noqoshada aamuska ah mid si dadweyne loo ogaado).
- Tallaabo sharci oo lagu qaado whistleblower-ka shaaca u dhigista lafteeda (T5).
- Sumcad u dhimid jilaalka whistleblower-ka (T8).
- Dhexdhexaadiyeyaasha oo si aamus ah u tuura sheekada (T10).

Haddii aad tahay whistleblower fikiraya inuu isticmaalo kit-kan, **akhri README-kan oo dhan marka hore**. Protocol-ku waa qalab. Protocol-ku ma aha beddel u ah la-talinta sharci, saxafi, regulator, ama amni hawlgalka taxaddar ah.

## Waxa kit-kani soo saaro

Manifesto cadaynta oo shaabadan loo sameeyay (ma aha cadaynta lafteeda) oo caddayn ah:

1. Bytes-yada gaarka ah ee feyl kasta oo caddayn ah ayaa jiray waqtiga shaabaddu samaysmay.
2. Shaabaddu waxay dhacday waqti gaar ah ama ka hor (iyada oo loo marayo caddayn Bitcoin OTS).
3. Asalka, dacwadda, qaabka khatarta, protocol-ka qaataha, iyo ballanqaadka aan-aamus-ka-noqon ee waxaa lagu dhawaaqay isla mar.

Dukumiintiyada hoose waxay ku sii jiraan haynta gacantaada ilaa aad u dirayso qaate. Qaatayaashu way xaqiijiyaan inay heleen isla bytes-yadii aad shaabaddday.

## Goorta la isticmaalo kit-kan

Waa inaad ka fikirtaa shaabadda manifesto **ka hor** inta aanad u gudbin caddaynta saxafi, regulator, ama qareen, haddii dhammaan kuwan soo socda ay run yihiin:

- Waxaad haysataa caddayn qaab dijital ah (PDF-yo, emails, sawirro, iwm) oo aad rabto in lagu ilaaliyo qaab byte-by-byte ah oo dhab ah.
- Waxaad filaysaa in dhexdhexaadiyeyaasha ay beddeli karaan, doodi karaan, ama aasi karaan caddaynta.
- Waxaad ku haysan kartaa dukumiintiyada hoose gacantaada ilaa la gudbiyo.
- Waxaad daabici kartaa manifesto-ga si dadweyne ah **iyada oo aan** la muujin waxa ku jira dukumiintiyada (oo keliya hashes-ka ayaa dadweyne ah).
- Waxaad miisaantay halista ah inaad si dadweyne ah loogu aqoonsado sidii whistleblower (goobta principal-ka saxiixa). Haddii lagu aqoon waayo, isticmaal magac been-abuur ah si joogto ah ahaan dhammaan daabacaadaha la xiriira.
- Waxaad la tashanaysay qareen ku saabsan sharciga ilaalinta whistleblower-ka ee xukunkaaga.

## Goorta AAN la isticmaalin kit-kan

HA isticmaalin kit-kan haddii:

- Dukumiintiyada lafteeda ay ka kooban yihiin macluumaadka shakhsi ahaaneed ee dhinacyada saddexaad (bukaano, macaamiisha, shaqaalaha) oo aan loo dhigi karin hash-public. Hash nooca la khalkhaliyay, ma aha asalka.
- Falka daabacaadda manifesto-ga lafteeda ayaa aqoonsan lahaa whistleblower-ka qaab uusan ku ogolaan.
- Aadan weli la tashan qareen. Protocol-ku waa qalab; sharciga ilaalinta whistleblower-ka waa mid xukun-gaar ah oo ku nool meel ka baxsan protocol-ka.
- Waxaa laga yaabaa inaad rabto inaad ka noqoto mid kasta oo ka mid ah dacwooyinka markii dambe. Shaabaddu waa mid joogto ah; daabacaadaha shaabadda cusub ee saxaha ayaa ah hab keliya oo daacad ah oo dib loo eego.
- Tan waxaad samaynaysaa cadaadis hoostiisa ama cadaadis waqti. Protocol-ku waxay weynaynaysaa qasab; albaabka diidmada (myriam-kit `SPEC §8`) ayaa lagu dabaqaa whistleblower-rada sidii daabacayaasha.

## Sida loo fork-garaynayo kit-kan shaaca-u-dhig dhab ah

```bash
# 1. Koobi tusaalahan oo geli direktoorad cusub
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Ka saar waxa been-abuurka ah; beddel xaqiiqooyinkaaga dhab ah.
# Feyl kasta oo ku jira facts/ waa hal xaqiiqo. Akhri mid kasta oo beddel.
$EDITOR facts/01_example_notice.txt   # u beddel hadal daboolka ah oo dhab ah
$EDITOR facts/02_provenance.txt       # asalka dhabta ah ee caddayntaada
$EDITOR facts/03_evidence_manifest.txt # hash dukumiintiyadaada dhabta ah oo liis garee
$EDITOR facts/04_allegation_summary.txt # dacwaddaada dhabta ah
$EDITOR facts/05_threat_model.txt     # jawaabaha aad filaysid dhab ah
$EDITOR facts/06_recipient_protocol.txt # u hagaaji qaataha
$EDITOR facts/07_no_retraction_commitment.txt # dhawaaqaagaaga aan-ka-noqon
$EDITOR facts/08_signing_principal.txt # aqoonsigaaga dhabta ah ee saxiixa (ama been-abuur)

# 3. Cusboonaysii site/index.html si uu u muujiyo xaqiiqooyinka dhabta ah.
# Script-ka seal.sh si toos ah uma buuxiyo HTML-ka; tafatirka gacanta
# ayaa ah tallaabada dib-u-eegista bini'aadamka.
$EDITOR site/index.html

# 4. Shaabad.
bash build/seal.sh
# Soo saara: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Xaqiiji gudaha.
python3 build/verify.py

# 6. Daabac manifesto-ga (MAYA dukumiintiyada) mid kasta oo ka mid ah:
#    - Marti gelin static aad adigu xukunto (Cloudflare Pages, GitHub Pages, iwm)
#    - Shabakadda IPFS ee CID-ga la daabacay
#    - Labadaba (lagu talinayo)

# 7. Si gooni ah, u gudbi dukumiintiyada hoose qaataha
#    iyada oo la maraayo kanaal amni ah oo aad doorato (Signal, SecureDrop, iwm).
#    Qaatuhu wuxuu xaqiijiyaa hashes-ka feylka oo ka soo horjeeda manifesto-gaaga.
```

## Xisaabinta hashes-ka feylasha caddayn ee dhabta ah

Si aad u hash garayso feyl dukumiinti SHA-256:

```bash
shasum -a 256 my_document.pdf
```

64-ka xaraf hex-ka ah ee ugu horreeya waa SHA-256. Geli taas manifesto-ga.

Waxaad hash garayn kartaa feylal badan hal mar:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Taasi waxay ku siinaysaa xogta loogu talagalay `facts/03_evidence_manifest.txt`.

## Tilmaamaha amniga hawlgalka

Protocol-ka MYRIAM MA bixiyo amni hawlgal. Waxay bixisaa
*joogtaynta caddaynta*. Wali waxaad u baahan tahay:

- Kanaal isgaarsiineed oo amni ah oo aad la xiriirto qareenkaaga
  ([Signal](https://signal.org/), wajiyaad-iska-wajiyaad, ama kanaalka amniga
  ee qareenkaaga la dejiyay)
- Goob kayd ah oo amni leh oo loogu talagalay dukumiintiyada hoose (laga aaso
  nasashada, ma aha adeegyada cloud-ka oo loo shaqeeyaha si gali karo)
- Aalad nadiif ah oo loogu talagalay shaabadda (laptop shakhsi ah oo aan la xiriirin
  account-yada loo shaqeeyaha; si fiican kaliya loo isticmaalay ujeedadan)
- Shabakad nadiif ah oo loogu talagalay daabacaadda (ma aha shabakadda loo shaqeeyaha, ma aha
  IP guriga haddii loo shaqeeyaha uu yeelan karo subpoena ISP-gaaga)

Akhrin lagu talinayo amniga hawlgalka loogu talagalay whistleblower-rada:

- [Dukumiintiyada SecureDrop ee The Intercept](https://securedrop.org/)
- [Kheyraadka Freedom of the Press Foundation](https://freedom.press/)
- [Hagaha is-difaaca ilaalinta ee EFF](https://ssd.eff.org/)

La tasho HOR inta aanad bilaabin habka shaabadda. Protocol-ku
ma ilaaliyo doorashooyin amni xun oo la sameeyay ka hor inta protocol-ka aan la qaadin.

## Waxa qaatayaashu waa inay ogaadaan

U dir qaatayaasha README-kan oo wata manifesto-ga shaabadan ah. Manifesto-ga
lafteeda waxaa ku jira protocol-ka qaataha (FACT 06), laakiin README-gu
wuxuu kordhinayaa doorka qaataha:

- **Saxafiyiinta**: marka hore xaqiiji daacadnimada manifesto-ga laftiisa. Kadibna
  ka codso dukumiintiyada iyadoo loo marayo kanaal gooni ah oo amni ah. Xaqiiji
  in SHA-256 ee dukumiinti kasta uu ku habboon yahay manifesto-ga ka hor daabacaadda.
  HA daabicin dukumiintiyada iyadoon la ogolaan whistleblower-ku;
  daabac jiritaanka manifesto-ga shaabadan iyo gabagabada xaqiijintaada.
- **Regulators**: hab xaqiijin oo isku mid ah. Manifesto-ga shaabadan iyo
  dukumiintiyada ku habboon waa qaabka caddayn ee ugu xoogga badan ee la heli karo
  meel ka baxsan ururinta silsiladda-ilaalinta rasmiga ah.
- **Qareennada**: manifesto-ga shaabadan ayaa bixiya xidhitaan forensic ah oo loogu talagalay
  jiritaanka dukumiintiyada waqtiga la sheegay. In ay buuxiso
  xukun gaar ah oo qawaaniinta caddaynta waa adiga inaad go'aamiso.

## Waxa kit-kani AAN ahayn

- Ma aha beddel u ah la-talinta sharci.
- Ma aha damaanad ah in qof uu wax ka qaban doono shaaca-u-dhigistaada.
- Ma aha ilaalin ka aargoosiga.
- Ma aha caddayn waxa ku jira dukumiintiyada (kaliya bytes-kooda-marka-shaabadda lagu samaynayo).
- Ma aha hab loo gaadho mid kasta si qarsoodi ah — shaabaddu waa
  dadweyne; haddii magacaaga principal-ka saxiixa uu yahay mid dhab ah, waad la garanayaa.

## Xidhitaanka

Manifesto shaabadan waa shay yar. Waa hal nooc oo byte-stream ah oo caddaynaya
in koox weyn oo bytes-stream ah ay jireen qaab gaar ah waqti gaar ah
ah. Yaraantaas ayaa ah xoogga: waxay sameysaa hal shay oo keliya, waxayna
samaysaa shaygaas hal mar muddo nolosha blockchain-ka Bitcoin.

Haddii aad akhrineyso tan sababtoo ah waxaad ka fikirayaa inaad noqoto
whistleblower, fadlan: la hadal qareen marka hore. Isticmaal hagayaasha amniga
hawlgalka ee kor ku xusan. Markaa, kaliya haddii dhammaan tixgelinada hore
ay isku habboon yihiin, ka fikir kit-kan inuu noqdo laf-dhabarta cryptography ah
ee shaaca-u-dhigistaada. Crypto-gu waa qaybta sahlan. Wax kasta oo
ka kor crypto-ga ayaa ah halka ay khatarta dhabta ah ku nool tahay.

## Shati

Domain dadweyne (CC0). Fork-gareeyey. Hagaaji. Isticmaal iyada oo aan la weydiinin ogolaansho.
