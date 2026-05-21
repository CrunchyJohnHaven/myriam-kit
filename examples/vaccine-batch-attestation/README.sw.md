*Tafsiri ya Kiswahili — kwa toleo asili la Kiingereza, tazama [README.md](README.md)*

# Kifaa cha Uthibitisho wa Bechi ya Chanjo

Mfano wa myriam-kit ulio tayari kutumika kwa watengenezaji wa chanjo, mamlaka za uhakikisho wa ubora, na mashirika ya afya ya umma yanayotaka kuchapisha muhuri uliotiwa nanga ya Bitcoin, unaoonyesha kuingiliwa, wa kutolewa kwa bechi.

## Kifaa hiki kinajilinda dhidi ya nini

**Hali za kushindwa ambazo muhuri unakamata:**

- **Mabadiliko ya kimya ya nyuma ya matokeo ya majaribio ya kutolewa.** PDF zote 8
  za majaribio ya kutolewa katika mfano zimewekewa hashi. Kuweka hashi tena baada ya kutolewa
  kunafichua mabadiliko yoyote.
- **Migogoro kuhusu maelezo gani yalitumika wakati wa kutolewa.** FACT 02
  iliyotiwa muhuri ina utambulisho rasmi wa bechi na hashi ya rekodi ya utengenezaji. Migogoro ya baadaye ya "maelezo yalikuwa daima X"
  ina nanga ya umma.
- **Upunguzaji wa kimya wa upeo wa kuita bidhaa.** Ahadi za pharmacovigilance
  katika FACT 05 zimetiwa muhuri; kushindwa kuziheshimu kunaweza kuonekana hadharani.
- **Kufanya tena maelezo nyuma kwa bechi iliyotoka nje ya maelezo.** Ikiwa matokeo
  ya jaribio la kutolewa kwa kweli yalikuwa PASS ya mpakani ambayo yanapangwa upya kama
  FAIL baada ya kutolewa, hashi za ripoti zilizotiwa muhuri zinathibitisha kile ripoti
  ya asili ya PDF iliyosema.

**Hali za kushindwa ZISIZOFUNIKWA:**

- Udanganyifu katika mchakato wa utengenezaji wenyewe (muhuri unaweka nanga matokeo ya
  majaribio, si uadilifu wa utengenezaji).
- Matukio mabaya ambayo ni matokeo ya kibaiolojia ya bechi iliyofaulu vinginevyo (muhuri
  hauthibitishi usalama wa kliniki, ni uadilifu wa nyaraka tu).
- Migogoro kuhusu toleo gani la maelezo ya udhibiti ndilo lenye mamlaka.

## Wakati wa kutumia kifaa hiki

Fikiria kutia muhuri kutolewa kwa bechi ikiwa:

- Wewe ni mtengenezaji wa chanjo unayetaka kuonyesha uadilifu wa kimahakama
  wa rekodi za kutolewa zaidi ya kile wadhibiti wanachohitaji
- Wewe ni timu ya QA inayopitisha utamaduni wa "chapisha kile tunachothibitisha"
- Wewe ni mtengenezaji wa kiwango kidogo/cha kitaifa katika eneo lenye
  miundombinu dhaifu ya udhibiti, unayetaka kuweka nanga rekodi za bechi
  dhidi ya mthibitishaji wa kimataifa
- Wewe ni shirika la afya ya umma au NGO inayoendesha programu ya
  uzalishaji wa chanjo isiyo ya kibiashara (k.m. kwa magonjwa yaliyopuuzwa)

## Mfano wa kihistoria wa vifo

- **Uchafuzi wa Heparin (2008, China):** chondroitin sulfate ya kuongezwa sulfate
  bandia katika bechi za heparin. Orodha iliyotiwa muhuri ya jaribio la kutolewa
  ingefanya mabadiliko ya kimya baada ya kutolewa ya rekodi ya
  jaribio kuwa yanayoweza kugunduliwa kwa njia ya kriptografia.
- **Tylenol cyanide (1982):** migogoro ya nyuma kuhusu mahali pa
  kuingiliwa. Hashi iliyotiwa muhuri ya rekodi ya utengenezaji inaweka nanga
  hali ya kabla ya usambazaji.
- **Kuita bidhaa kwa bechi mbalimbali za chanjo** ambapo swali "je bechi hii
  ilikaguliwa ipasavyo" linakuwa la kubishaniwa miaka kadhaa baadaye.

Kifaa hiki SI suluhisho la KAMILI kwa lolote la haya kwa maana kali — lakini katika kila
hali, uthibitisho wa bechi uliotiwa muhuri ungetoa muda wa
kimahakama ulio safi zaidi.

## Jinsi ya kufanya fork ya kifaa hiki kwa bechi halisi

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # badilisha maudhui ya kubuni na bechi halisi
bash build/seal.sh        # TIA MUHURI KABLA ya usambazaji kuanza
python3 build/verify.py   # thibitisha
```

**MUDA MUHIMU**: tia muhuri wakati wa kutolewa kwa QA, KABLA bechi
haijasambazwa. Muhuri baada ya usambazaji ni dhaifu kimahakama.

## Ujumuishaji na miundombinu ya dawa iliyopo

- **Mawasilisho ya eCTD (FDA / EMA):** URL ya chapisho lililotiwa muhuri au CID ya IPFS
  inaweza kurejelewa katika sehemu ya Module 3 (ubora)
- **WHO Prequalification:** orodha iliyotiwa muhuri inaonyesha
  mnyororo wa majaribio kabla ya kutolewa kwa maeneo yasiyo ya FDA/EMA
- **Maoni ya Pharmacovigilance:** FACT 05 inamfunga mtengenezaji kufanya
  ripoti iliyotiwa muhuri ya jumla ya hesabu za AE katika miezi 6 na 12
- **Mifumo ya kuita bidhaa (RxConnect, MedWatch):** ikiwa kuita bidhaa kunahitajika,
  upeo wa kuita wenyewe unatiwa muhuri chini ya MYRIAM, ukitoa uthibitisho wa umma
  kwamba mafungu yote yaliyosambazwa yanashughulikiwa

## Kile ambacho kifaa hiki HAKIBADILISHI

- Mawasilisho ya udhibiti ya FDA / EMA / WHO
- Mizizi ya ukaguzi wa GMP (muhuri unaweka nanga MATOKEO, si rekodi za mchakato ghafi)
- Hifadhidata za Pharmacovigilance (VAERS / EudraVigilance)
- Mifumo ya uratibu wa kuita bidhaa

## Leseni

Mali ya umma (CC0). Fanya fork. Hakuna sifa inayohitajika.
