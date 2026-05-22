*Tafsiri ya Kiswahili — kwa toleo asili la Kiingereza, angalia [README.md](README.md)*

# Kifaa cha Urudufishaji wa Kisayansi

Mfano wa myriam-kit ulio tayari kutumika kwa makundi ya utafiti, majarida, na taasisi zinazozingatia urudufishaji zinazotaka kuchapisha manifesto ya urudufishaji iliyotiwa nanga kwa Bitcoin, inayoonyesha uchezeaji, pamoja na karatasi ya kisayansi au pre-print.

## Kifaa hiki kinazalisha nini

Chapisho lililotiwa muhuri lenye, kwa utafiti mmoja:

1. Utambulisho wa utafiti (kichwa cha karatasi, waandishi, taasisi, wafadhili, COI)
2. **SHA-256 ya kumbukumbu ya data ghafi** — seti ya data ya kawaida
3. **Hash ya bomba la uchanganuzi** — skripti + digest ya picha ya Docker +
   utegemezi uliobandikwa
4. **Hash ya kifurushi cha matokeo yanayotarajiwa** — kile ambacho mrudufishaji
   mwaminifu anapaswa kuzalisha
5. Itifaki ya urudufishaji + ahadi za uchapishaji baada ya matokeo
6. Mkuu/Wakuu wanaosaini

Muhuri umekusudiwa kwa hatua ya **kabla-ya-uchanganuzi**: data imegandishwa,
bomba limekamilishwa, matokeo yanayotarajiwa yamehesabiwa, YOTE kabla ya
matokeo yoyote kuonekana kwa madhumuni ya kuandika karatasi.

## Kifaa hiki kinajilinda dhidi ya nini

**Hali za kushindwa ambazo muhuri unakamata:**

- **p-hacking**: mabadiliko ya baada-ya-tukio kwenye uchanganuzi baada ya
  kuona matokeo yanaweza kugunduliwa kupitia diff kati ya FACT 04 iliyotiwa
  muhuri na bomba lililochapishwa.
- **HARKing** (Kuweka Dhana Baada ya Matokeo Kujulikana): dhana iliyosajiliwa
  kabla katika FACT 02 ni thabiti baiti-kwa-baiti.
- **Udanganyifu wa data baada ya karatasi**: kuhashi tena kumbukumbu ya data
  dhidi ya FACT 03 hufichua mabadiliko yoyote.
- **Kuteleza kwa bomba**: kuhashi tena bomba la uchanganuzi dhidi ya FACT 04
  hukamata mabadiliko ya kimya.
- **Uchezeaji wa uandishi**: kuongeza au kuondoa waandishi kimya baada ya
  uchapishaji kunakuwa kunaweza kugunduliwa dhidi ya FACT 02 iliyotiwa muhuri.

**Hali za kushindwa ZISIZOFUNIKWA:**

- Udanganyifu katika ukusanyaji wa data ghafi (muhuri unaweka nanga data
  katika hatua ya kutiwa muhuri, si ukusanyaji)
- Kutorudufishika kibaiolojia / kiajiribuwa (muhuri unaweka nanga
  urudufishaji wa kihesabu pekee)
- Masuala ya ukubwa wa sampuli au uhalali wa idadi ya watu (haya ni
  maswali ya muundo wa utafiti)
- Ukweli wa dai la msingi (muhuri unaweka nanga kile kilichodaiwa, si iwapo
  dunia inalingana na dai hilo)

## Wakati wa kutumia kifaa hiki

Fikiria kutia muhuri ikiwa:

- Wewe ni kundi la utafiti linaloendesha uchanganuzi wa kiwango cha juu
  (jaribio la kliniki, tathmini ya mfumo wa AI, utafiti wa urudufishaji)
  na unataka uadilifu wa kimahakama zaidi ya alama za wakati za OSF / GitHub
- Wewe ni mtafiti wa mwanzoni wa kazi unayetaka ulinzi wa sifa usio
  ulinganifu: uchanganuzi-kabla uliotiwa muhuri humaanisha kwamba ukosoaji
  wa baadaye wa "walifanya p-hacking" una mthibitishaji wa umma
- Wewe ni mhariri wa jarida au kiongozi wa mradi wa urudufishaji unayetaka
  kuhamasisha usajili wa kabla wa kiwango cha kimaandishi-fiche kwa kundi
  dogo la karatasi
- Unafanyia kazi uchanganuzi ambapo marekebisho ya baada-ya-tukio yana
  matokeo muhimu kwa uwanja (saikolojia, uchumi wa kitabia, utafiti wa
  kitiba)

## Mfano wa vifo / madhara wa kihistoria

Umuhimu wa kifaa hiki kwa vifo ni wa moja kwa moja:

- **Kutorudufishika kwa utafiti wa seli mama / saratani:** karatasi kadhaa
  zimepelekea madhara kwa wagonjwa kupitia majaribio ya kliniki
  yaliyoelekezwa vibaya. Usajili wa kabla uliotiwa muhuri wa bomba la
  awali ungekuwa umeweka nanga ulinganisho.
- **Mzozo wa ufanisi wa Tamiflu:** mapitio ya Cochrane yalichukua miaka
  kwa kiasi kwa sababu upatikanaji wa data ghafi ulibishaniwa. Hashi za
  data zilizotiwa muhuri wakati wa uchapishaji zingefanya mizozo ya
  upatikanaji wa data kutatulika mara moja.
- **Mgogoro wa jumla wa kutorudufishika:** gharama ya vifo katika kiwango
  cha uwanja wa utafiti wa kitiba usiorudufishika ni kubwa (Begley &
  Ellis 2012 walikadiria zaidi ya 50% ya matokeo ya kabla-ya-kliniki
  hayawezi kurudufishwa). Uwekaji nanga wa kimaandishi-fiche ni mojawapo
  ya levers ya kimuundo.

## Jinsi ya kufanya fork ya kifaa hiki

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# MUHIMU: fanya hivi KABLA ya kuona matokeo yoyote
shasum -a 256 raw_data_v0.tar.gz       # hesabu hash ya kawaida ya data
shasum -a 256 analysis.py              # hash ya bomba lako
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # jaza na thamani halisi
bash build/seal.sh                     # tia muhuri KABLA ya kuendesha uchanganuzi
python3 build/verify.py                # thibitisha

# Sasa endesha uchanganuzi. Hash matokeo na uthibitishe yanalingana na FACT 05.
# Ikiwa hayalingani, bomba si la deterministic; rekebisha na utie muhuri tena.
```

## Ujumuishaji na miundombinu ya kitaaluma iliyopo

- **arXiv / bioRxiv / medRxiv**: jumuisha URL ya muhuri wa MYRIAM au CID ya
  IPFS katika muhtasari au vifaa vya nyongeza
- **OSF**: ambatanisha artifact ya muhuri kwenye mradi wa OSF pamoja na
  fomu ya kawaida ya usajili wa kabla
- **AsPredicted**: jumuisha URL ya muhuri wa MYRIAM katika hati ya usajili
  wa kabla
- **GitHub**: hash ya commit ya bomba la uchanganuzi ndiyo ambayo FACT 04
  inatia nanga; GitHub inatoa chanzo, MYRIAM inatia nanga baiti
- **Zenodo / Figshare / OpenAIRE**: weka data ghafi, kisha tia muhuri hash
  ya amana; muhuri ni mgumu kimahakama kubadilishwa kimya kuliko metadata
  ya amana
- **Vifaa vya nyongeza vya jarida**: jumuisha artifact ya muhuri wa MYRIAM
  kama faili la nyongeza wakati wa kuwasilisha

## Kile kifaa hiki HAKIBADILISHI

- Idhini ya IRB / kamati ya maadili
- Mapitio ya wenzao
- Tafiti za urudufishaji (urudufishaji wa kihesabu ≠ urudufishaji wa
  kiajiribuwa)
- Mikataba ya upatikanaji wa data kwa data nyeti

## Maelezo kuhusu mpangilio wa waandishi na sifa

Muhuri unaweka nanga ORODHA YA WAANDISHI wakati wa kutiwa muhuri. Mizozo
kuhusu uandishi inayoibuka baada ya uchapishaji inaweza kutathminiwa dhidi
ya orodha iliyotiwa muhuri. Hii ni lever ndogo ya uwajibikaji — muhimu
kwa watafiti wa mwanzoni wa kazi wanaoongezwa au kuondolewa kimya.

## Leseni

Kikoa cha umma (CC0). Itumie, irekebishe, ipuuze, ifanyie fork.
