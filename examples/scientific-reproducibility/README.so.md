*Turjumaad Soomaali — nooca asalka ah ee Ingiriisi, eeg [README.md](README.md)*

# Qalabka Ku-celcelinta Sayniska

Tusaale myriam-kit oo diyaar ah oo loogu talagalay kooxaha cilmi-baadhista, joornaalada, iyo hay'adaha xoogga saara ku-celcelinta oo doonaya inay daabacaan manifest ku-celcelin oo Bitcoin-ku-xidhan, oo aan la xukumi karin, dhinaca warqad ama soo-celin.

## Waxa qalabkani uu soo saaro

Daabacaad shaabadan oo ka kooban, daraasad keliya:

1. Aqoonsiga daraasadda (cinwaanka warqadda, qoraayada, hay'adda, deeq-bixiyaal, COI)
2. **SHA-256 archive xogta xagaale** — xogta canonical
3. **Hash-ka tuubo falanqaynta** — qoraal + xirasho image Docker +
   ku-tiirsanaanta la xidhay
4. **Hash-ka xirmada wax-soo-saarka la filayo** — waxa ku-celceliyaha aamin ah uu soo saaro
5. Hab-raaca ku-celcelinta + ballan-qaadyada daabacaadda natiijada-ka-dib
6. Madaxa/madaxa saxiixaya

Shaabaddu waxay loogu talagalay marxaladda **falanqaynta-ka-hor**: xogta la qaboojiyey, tuubo la dhammeystiray, wax-soo-saarka la filayo la xisaabiyey, OO DHAMMAANTOOD ka hor inta aan natiijo loo arkin ujeedo qoraalka warqadda.

## Waxa qalabkani uu ka difaaco

**Qaababka guuldarrada ee shaabaddu qabsato:**

- **p-hacking**: isbeddello dabagal ah oo falanqaynta marka natiijooyinka la arko waxaa lagu ogaadaa iyada oo loo marayo farqi u dhexeeya FACT 04 shaabadan iyo tuubaha la daabacay.
- **HARKing** (Mala-awaalka Natiijooyinka Marka La Ogaado kadib): mala-awaalka diiwaangashan ee FACT 02 waa byte-deggan.
- **Wax-ka-beddelka xogta daabacaadda kadib**: dib u hash-inta archive xogta ka soo horjeeda FACT 03 wuxuu shaaca ka qaadayaa wax kasta oo wax laga beddelay.
- **Tuubaha-ka-jeerinta**: dib u hash-inta tuubaha falanqaynta ka soo horjeeda FACT 04 wuxuu qabsadaa isbeddellada aamusan.
- **Ciyaarista qoraagga**: si aamusan kudarid ama ka-saarid qoraayada daabacaadda ka dib ayaa noqonaysa mid la ogaan karo ka soo horjeeda FACT 02 shaabadan.

**Qaababka guuldarrada AAN la dabooli:**

- Khiyaano ururinta xogta xagaale (shaabaddu waxay xidhaa xogta meesha shaabadaynta, ma aha ururinta)
- Aan-ku-celcelin biolojiyaadeed / empiriko (shaabaddu waxay xidhaa
  ku-celcelinta xisaabinta oo keliya)
- Arrimaha cabbirka-tijaabada ama ansaxnimo-dadweynaha (kuwan waa su'aalo qaab-dhismeedka-daraasadda)
- Runta sheegasho-ku-saleysan (shaabaddu waxay xidhaa waxa la sheegay, ma aha in adduunku la mid yahay sheegashada)

## Goorta la isticmaalo qalabkan

U fiirso shaabadda haddii:

- Tahay koox cilmi-baadhis oo ku jirta falanqaynta heer-sare (tijaabo clinical, qiimeynta nidaamka ZK, daraasadda dib-u-celcelinta) oo rabto daacadnimo forensig ah oo ka baxsan OSF / GitHub mohraha-wakhtiga
- Tahay cilmi-baadhe shaqo-bilow ah oo rabto difaac sumcad asymmetric: pre-falanqayn shaabadan macnaheedu yahay dhalleecaynta "way p-hacked" oo mustaqbalka leh diiddal dadweyne
- Tahay tifaftirayasha joornaal ama mas'uulka mashruuca dib-u-celcelin oo rabta inay kobcin pre-diiwaangelin cryptographic-grade oo loogu talagalay qayb ka mid ah warqadaha
- Tahay shaqaale falanqayn ah halka isbeddello dabagal ah ay leeyihiin natiijooyin meel-bare oo xushmadda muhiimka ah (psych, dabeecadda dhaqaalaha, baadhista caafimaadka)

## Cadayn taariikhi ah / dhibaato

Xidhiidhka dhimashada ee qalabkani waa mid aan toos ah:

- **Aan-ku-celcelinta cilmi-baadhista unugyada-asalka / kansarka:** dhowr warqadood ayaa horseed u noqday dhibaato bukaan iyada oo loo marayo tijaabooyin clinical oo aan toosnayn. Pre-diiwaangelin shaabadan oo tuubaha asalka ah waxay xidhi lahayd isbarbardhigga.
- **Khilaafadda hufnaanta Tamiflu:** dib-u-eegista Cochrane ayaa qaatay sannado qayb ahaan sababtoo ah helitaanka xog-xagaale ayaa la doodi jiray. Hash-yada xogta shaabadan ee daabacaadda ayaa ka dhigi lahaa khilaafaadka helitaanka xogta mid isla markaaba la xallin karo.
- **Xaalada guud ee aan-ku-celcelin:** qiimaha dhimashada meel-bare ee cilmi-baadhis caafimaad oo aan ku-celcelinin waa mid weyn (Begley & Ellis 2012 wuxuu qiyaasay > 50% oo natiijooyinka preclinical aan ku-celcelin). Goyninta cryptographic waa hal qodob hab-dhismeed ah.

## Sida loo fork-iyo qalabkan

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# MUHIIM: tan samee KA HOR inta aan la arkin natiijo
shasum -a 256 raw_data_v0.tar.gz       # xisaabi hash-ka xogta canonical
shasum -a 256 analysis.py              # hash tuubahaaga
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # ku buuxi qiimooyinka dhabta ah
bash build/seal.sh                     # shaabadayn KA HOR socodsiinta falanqaynta
python3 build/verify.py                # xaqiiji

# Hadda socodi falanqaynta. Hash wax-soo-saarka oo xaqiiji inuu la mid yahay FACT 05.
# Haddii uusan la mid ahayn, tuubuhu ma aha deterministic; saxe oo dib u shaabadayn.
```

## Isku-darka kaabayaasha aqoonta ee jira

- **arXiv / bioRxiv / medRxiv**: ku dar URL shaabadda MYRIAM ama IPFS CID
  ku jirta soo-koobida ama walxaha dheeraadka ah
- **OSF**: ku dheji qodobka shaabadda mashruuca OSF dhinaca foomka pre-diiwaangelinta caadiga ah
- **AsPredicted**: ku dar URL shaabadda MYRIAM ku jirta dukumiintiga pre-diiwaangelinta
- **GitHub**: hash-ka commit-ka tuubaha falanqaynta waa waxa FACT 04 xidho;
  GitHub wuxuu bixiyaa il-yaqaan, MYRIAM wuxuu xidhaa bytes-yada
- **Zenodo / Figshare / OpenAIRE**: keydso xog-xagaale, kadibna shaabadayn
  hash-ka keydka; shaabadda waa mid forensig ah oo aad uga adag inay aamusnaan ku replacedhsoo galaan tan oo metadata keydka
- **Walxaha dheeraadka ah ee joornaalka**: ku dar qodobka shaabadda MYRIAM
  sida fayl dheeraad ah marka la gudbinayo

## Waxa qalabkani aan bedelin

- IRB / oggolaanshaha guddiga anshaxa
- Dib-u-eegista facamoyaasha
- Daraasadaha ku-celcelinta (ku-celcelinta xisaabinta ≠ ku-celcelinta empiriko)
- Heshiisyada helitaanka-xogta ee xog dareem-leh

## Ogeysiis ku saabsan kala-saarka qoraagga iyo ammaanta

Shaabaddu waxay xidhaa LIISKA QORAAGGA wakhtiga shaabadda. Khilaafaadyada
qoraagga ee ka soo baxa daabacaadda-ka-dib waxaa la qiimeyn karaa ka soo horjeeda
liiska shaabadan. Tani waa qodob xisaabin oo yar — muhiim ECRs
oo aamusan loogu kudaray ama laga saaray.

## Shatiga

Diiwaanka dadweynaha (CC0). Isticmaal, beddel, iska indhasarac, fork samee.
