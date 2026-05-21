*Tafsiri ya Kiswahili — kwa toleo asili la Kiingereza, angalia [README.md](README.md)*

# Kifaa cha Kutia Muhuri Manifesto ya Mpiga Filimbi

Mfano wa myriam-kit ulio tayari kutumika kwa wapiga filimbi wanaokabili
hali maalum ya kushindwa ambapo **ushahidi unazikwa, unahaririwa, au
unapingwa na wapatanishi kati ya mpiga filimbi na umma**. Kesi za kihistoria
kanuni ambazo kifaa hiki kinajilinda dhidi yake:

- Boeing 737 MAX (ripoti za usalama wa ndani zilipuuzwa/zilizikwa)
- Theranos (wasiwasi wa majaribio ya maabara ulibanwa kwa miaka)
- Ripoti za mkaguzi wa FDA zilihaririwa baada ya kuwasilishwa
- Frances Haugen / Facebook (manifesto iliyotiwa muhuri ingethibitisha kwamba
  nyaraka zilikuwa za kweli na zilikuwepo wakati uliodaiwa)

Kile kifaa hiki kinajilinda dhidi yake (kwa lugha ya protokali):

- T1–T3 katika [FACT 05](facts/05_threat_model.txt): mzozo wa hadhara
  kuhusu yaliyomo katika nyaraka, madai kwamba nyaraka hazikutiwa muhuri
  wakati uliodaiwa, madai ya kutunga nyuma.
- T9: pande za tatu kuwakabidhi wanahabari nakala zilizobadilishwa.

Kile kifaa hiki **hakijilindi** dhidi yake:

- Kisasi cha kibinafsi dhidi ya mpiga filimbi (T7).
- Shinikizo kwa mpiga filimbi kurudisha nyuma (T4, hupunguzwa kwa kiasi
  na FACT 07 inayofanya urejesho wa kimya uweze kugunduliwa hadharani).
- Hatua za kisheria dhidi ya mpiga filimbi kwa ufichuzi wenyewe (T5).
- Kuvunja sifa ya mpiga filimbi (T8).
- Wapatanishi kuangusha habari kimya kimya (T10).

Ikiwa wewe ni mpiga filimbi unayefikiria kutumia kifaa hiki, **soma README
hii nzima kwanza**. Protokali ni zana. Protokali si mbadala wa mshauri wa
sheria, mwanahabari, mdhibiti, au usalama wa uendeshaji uliofanyiwa
makini.

## Kifaa hiki kinazalisha nini

*Manifesto* iliyotiwa muhuri kwa njia ya kriptografia ya ushahidi (si
ushahidi wenyewe) ambayo inathibitisha:

1. Baiti maalum za kila faili ya ushahidi zilikuwepo wakati wa kutia muhuri.
2. Kutia muhuri kulitokea katika au kabla ya wakati maalum (kupitia
   tasdiki ya Bitcoin OTS).
3. Asili, dai, modeli ya tishio, protokali ya mpokeaji, na ahadi ya
   kutorejesha kimya — vyote vilitangazwa pamoja.

Nyaraka za msingi zinabaki mikononi mwako hadi utakapozituma kwa mpokeaji.
Wapokeaji huhakiki kwamba walipokea baiti zilezile ulizotia muhuri.

## Lini kutumia kifaa hiki

Unapaswa kuzingatia kutia muhuri manifesto **kabla** ya kupeleka ushahidi
kwa mwanahabari, mdhibiti, au wakili, ikiwa zote zifuatazo ni za kweli:

- Una ushahidi katika muundo wa kidijitali (PDFs, barua-pepe, picha, n.k.)
  unaotaka uhifadhiwe ukiwa wa kweli baiti kwa baiti.
- Unatarajia kwamba wapatanishi wanaweza kubadilisha, kubishana, au
  kuzika ushahidi.
- Unaweza kuhifadhi nyaraka za msingi mikononi mwako hadi wakati wa
  upelekaji.
- Unaweza kuchapisha manifesto hadharani **bila** kufichua yaliyomo
  katika nyaraka (hashi tu ndizo za umma).
- Umetafakari hatari za kutambulika hadharani kama mpiga filimbi (uwanja
  wa kanuni-saini). Ikiwa hujulikani, tumia jina la bandia kwa
  ushikamano katika machapisho yote yanayohusiana.
- Umemshauri wakili kuhusu sheria ya ulinzi wa wapiga filimbi katika
  mamlaka yako.

## Lini USITUMIE kifaa hiki

USITUMIE kifaa hiki ikiwa:

- Nyaraka zenyewe zina taarifa za kibinafsi kuhusu pande za tatu
  (wagonjwa, wateja, wafanyakazi) ambazo hazipaswi kufanywa hashable
  hadharani. Tia hashi toleo lililorekebishwa, si la asili.
- Kitendo cha kuchapisha manifesto chenyewe kingemtambulisha mpiga
  filimbi kwa namna ambayo hajaikubali.
- Bado hujamshauri wakili. Protokali ni zana; sheria ya ulinzi wa
  wapiga filimbi ni maalum kwa mamlaka na huishi nje ya protokali.
- Unaweza kutaka kurejesha dai lolote moja baadaye. Muhuri ni wa
  kudumu; marekebisho mapya yaliyotiwa muhuri ndiyo njia pekee
  ya uaminifu ya kurekebisha.
- Unafanya hivi chini ya shuruti au shinikizo la wakati. Protokali
  inakuza shuruti; lango la kukataa (myriam-kit `SPEC §8`) linatumika
  kwa wapiga filimbi pia kama linavyotumika kwa wachapishaji.

## Jinsi ya kufanya fork ya kifaa hiki kwa ufichuzi halisi

```bash
# 1. Nakili mfano huu katika saraka mpya
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Ondoa maudhui ya kubuni; badilisha na ukweli wako halisi.
# Kila faili chini ya facts/ ni ukweli mmoja. Soma kila moja na ubadilishe.
$EDITOR facts/01_example_notice.txt   # badilisha kuwa taarifa halisi ya jalada
$EDITOR facts/02_provenance.txt       # asili halisi ya ushahidi wako
$EDITOR facts/03_evidence_manifest.txt # tia hashi nyaraka zako halisi na uorodheshe
$EDITOR facts/04_allegation_summary.txt # dai lako halisi
$EDITOR facts/05_threat_model.txt     # majibu yako halisi yanayotarajiwa
$EDITOR facts/06_recipient_protocol.txt # rekebisha kwa mpokeaji wako
$EDITOR facts/07_no_retraction_commitment.txt # tamko lako la kutorejesha
$EDITOR facts/08_signing_principal.txt # utambulisho wako halisi wa kusaini (au jina la bandia)

# 3. Sasisha site/index.html kuonyesha ukweli halisi.
# Skripti ya seal.sh HAIJAZI HTML kiotomatiki; uhariri wa mkono
# ni hatua ya ukaguzi wa kibinadamu.
$EDITOR site/index.html

# 4. Tia muhuri.
bash build/seal.sh
# Matokeo: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Hakiki kwa ndani.
python3 build/verify.py

# 6. Chapisha manifesto (SI nyaraka) katika yoyote ya:
#    - Mwenyeji wa tuli unaomdhibiti (Cloudflare Pages, GitHub Pages, n.k.)
#    - Mtandao wa IPFS kwa CID iliyochapishwa
#    - Vyote viwili (vinapendekezwa)

# 7. Kwa kujitenga, peleka nyaraka za msingi kwa mpokeaji
#    kupitia njia salama ya chaguo lako (Signal, SecureDrop, n.k.).
#    Mpokeaji huhakiki hashi za faili dhidi ya manifesto yako.
```

## Kuhesabu hashi kwa faili halisi za ushahidi

Kutia hashi faili ya nyaraka kwa SHA-256:

```bash
shasum -a 256 my_document.pdf
```

Herufi 64 za kwanza za hex ni SHA-256. Weka hiyo katika manifesto.

Unaweza kutia hashi faili nyingi kwa wakati mmoja:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Hiyo inakupa data kwa ajili ya `facts/03_evidence_manifest.txt`.

## Maelezo ya usalama wa uendeshaji

Protokali ya MYRIAM HAITOI usalama wa uendeshaji. Inatoa *udumu wa
ushahidi*. Bado unahitaji:

- Njia salama ya mawasiliano kwa wakili wako
  ([Signal](https://signal.org/), ana kwa ana, au njia salama
  iliyoanzishwa ya wakili wako)
- Mahali salama pa kuhifadhi nyaraka za msingi (zilizofungwa kwa
  funguo wakati wa kupumzika, si kwenye huduma za wingu ambazo
  mwajiri wako anaweza kufikia)
- Kifaa safi kwa ajili ya kutia muhuri (laptopu ya kibinafsi
  isiyohusishwa na akaunti za mwajiri; ikiwezekana ambayo
  hutumiwa kwa kusudi hili pekee)
- Mtandao safi kwa ajili ya kuchapisha (si mtandao wa mwajiri wako,
  si IP ya nyumbani kwako ikiwa mwajiri wako anaweza kuandika
  faragha kwa ISP yako)

Usomaji unaopendekezwa kuhusu usalama wa uendeshaji kwa wapiga filimbi:

- [Nyaraka za SecureDrop za The Intercept](https://securedrop.org/)
- [Rasilimali za Freedom of the Press Foundation](https://freedom.press/)
- [Mwongozo wa kujihami dhidi ya ufuatiliaji wa EFF](https://ssd.eff.org/)

Shauriana nazo KABLA ya kuanza mchakato wa kutia muhuri. Protokali
hailindi dhidi ya maamuzi mabaya ya opsec yaliyofanywa kabla ya
protokali kuanzishwa.

## Kile wapokeaji wanapaswa kujua

Tuma wapokeaji README hii pamoja na manifesto iliyotiwa muhuri.
Manifesto yenyewe ina protokali ya mpokeaji (FACT 06), lakini README
inapanua jukumu la mpokeaji:

- **Wanahabari**: hakiki uadilifu wa manifesto yenyewe kwanza. Kisha
  omba nyaraka kupitia njia tofauti salama. Hakiki SHA-256 ya kila
  nyaraka inalingana na manifesto kabla ya kuchapisha. USICHAPIShE
  nyaraka bila idhini ya mpiga filimbi; chapisha uwepo wa manifesto
  iliyotiwa muhuri na hitimisho lako la uhakiki.
- **Wadhibiti**: mchakato uleule wa uhakiki. Manifesto iliyotiwa
  muhuri pamoja na nyaraka zinazolingana ni muundo wa ushahidi wenye
  nguvu zaidi unaopatikana nje ya ukusanyaji rasmi wa chain-of-custody.
- **Mawakili**: manifesto iliyotiwa muhuri inatoa anchorage ya kimahakama
  kwa uwepo wa nyaraka wakati uliodaiwa. Iwapo inakidhi kanuni za
  ushahidi za mamlaka yoyote maalum ni kwa wewe kuamua.

## Kile kifaa hiki SI

- Si mbadala wa mshauri wa sheria.
- Si dhamana kwamba mtu yeyote atatenda kuhusu ufichuzi wako.
- Si ulinzi dhidi ya kisasi.
- Si uthibitisho wa yaliyomo katika nyaraka (ni wa baiti-wakati-wa-
  kutia-muhuri tu).
- Si njia ya kuwasiliana bila kujulikana na yeyote — muhuri ni wa
  umma; ikiwa jina lako la kanuni-saini ni la kweli, umejulikana.

## Kufunga

Manifesto iliyotiwa muhuri ni kitu kidogo. Ni mkondo mmoja wa baiti
unaothibitisha kuwa seti kubwa ya mikondo ya baiti ilikuwepo katika
muundo maalum wakati maalum. Udogo huo ndio nguvu yake: hufanya jambo
moja tu, na hufanya jambo hilo moja katika maisha yote ya blokicheni
ya Bitcoin.

Ikiwa unasoma hii kwa sababu unafikiria kuwa mpiga filimbi, tafadhali:
zungumza na wakili kwanza. Tumia miongozo ya usalama wa uendeshaji hapo
juu. Kisha, ikiwa na tu ikiwa mazingatio yote hayo ya juu yapo sawa,
zingatia kifaa hiki kama uti wa mgongo wa kriptografia wa ufichuzi
wako. Kriptografia ni sehemu rahisi. Kila kitu kilicho juu ya
kriptografia ndipo hatari halisi inaishi.

## Leseni

Mali ya umma (CC0). Ifanyie fork. Iboreshe. Itumie bila kuomba ruhusa.
