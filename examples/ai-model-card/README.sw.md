*Tafsiri ya Kiswahili — kwa toleo asili la Kiingereza, angalia [README.md](README.md)*

# Kifaa cha Kufunga Tabia ya Mfano wa AI

Mfano wa myriam-kit ulio tayari kutumika kwa maabara za AI (za kibiashara au za chanzo huria) zinazotoa mfano na kutaka kufanya madai ya kutolewa — utambulisho wa uzito, uwezo, alama za tathmini, mapitio ya usalama, ahadi za kabla ya kupelekwa — **kuwekwa nanga kwa njia ya kriptografia na kuthibitishika hadharani**.

Kifaa hiki kinajilinda dhidi ya hali maalum ya kushindwa ambapo mifano iliyopelekwa inajigeuza kimya, alama za tathmini zinaandikwa upya, au madai ya kabla ya kupelekwa yanapingwa miaka kadhaa baadaye kama "hatukuwahi kusema hivyo."

## Kile ambacho kifaa hiki kinazalisha

Manifesti iliyotiwa muhuri kwa njia ya kriptografia inayojumuisha, kwa utoaji mmoja wa mfano:

1. Utambulisho wa mfano (jina, usanifu, idadi ya parameta, leseni)
2. **SHA-256 ya faili ya uzito** — hashi ya kanuni ya kifaa
3. Maandishi ya kadi ya mfano (uwezo, matumizi yaliyokusudiwa, matumizi nje ya wigo, hali za kushindwa zinazojulikana)
4. Matokeo ya tathmini wakati wa kutolewa (tathmini za uwezo, tathmini za usalama, urekebishaji)
5. Ahadi za kabla ya kupelekwa (vitu ambavyo unaahidi kutobadilisha kimya baada ya kutolewa)
6. Mkuu anayetia saini (mtu + shirika linalochukua jukumu)

Muhuri unafanya kila moja ya haya kuwa thabiti-baiti, iliyowekwa nanga kwa wakati kwa Bitcoin kupitia OpenTimestamps, na inayoweza kupatikana kupitia IPFS bila kutegemea mtoa-huduma wa mwenyeji mmoja.

Tazama mfano wa kubuni uliofanyiwa kazi: [facts/](facts/) na [site/index.html](site/index.html) iliyorenderwa. Mfano huu unatumia mfano wa kubuni ("Calm-mini-v0"); utoaji halisi ungebadilisha maudhui ya mfano.

## Kile ambacho kifaa hiki kinajilinda dhidi yake

**Hali za kushindwa ambazo muhuri unanasa moja kwa moja:**

- **Kuingilia uzito** — SHA-256 ya faili ya uzito iliyotolewa iko katika FACT 03. Mabadiliko yoyote baada ya kutolewa ya baiti ambazo mtumiaji anapakua zinaweza kugunduliwa kwa kufanya hashing tena.
- **Marekebisho ya kimya ya tathmini** — alama za tathmini wakati wa kutolewa ziko katika FACT 05. Mizozo ya baadaye ya "alama ya tathmini ilikuwa daima X" ina nanga ya umma.
- **Kujigeuza kwa madai ya uwezo** — maandishi ya kadi ya mfano katika FACT 04 ni thabiti-baiti. Mizozo ya baadaye ya "hatukuwahi kudai uwezo X" inakaguliwa hadharani dhidi ya maandishi yaliyotiwa muhuri.
- **Usambazaji upya wa kimya wa fine-tune** — ahadi ya kabla ya kupelekwa ya #1 katika FACT 06 (katika mfano uliofanyiwa kazi) ni "hakuna fine-tuning ya kimya chini ya jina moja." Kugunduliwa: hashi yoyote mpya ya uzito inamaanisha jina jipya la mfano na chapisho jipya lililotiwa muhuri, au ahadi imevunjwa.
- **Hali za kushindwa zilizofichika** — FACT 04 inaahidi orodha ya hali za kushindwa zinazojulikana. Orodha ni monotoniki (inaweza kukua, sio kupungua kwa kituo cha ukaguzi kilichogandishwa). Ugunduzi wa baadaye wa hali za kushindwa ambazo maabara ilijua ndani lakini haikuzichapisha unakuwa ushahidi unaopingwa.

**Hali za kushindwa AMBAZO HAZIJAFUNIKWA:**

- Mifano kutumiwa vibaya na watumiaji wa chini (muhuri unathibitisha kile kilichotolewa, sio kile watumiaji wanachokifanya nayo).
- Fine-tuning ya kupinga na pande tatu (fine-tune ya mtu wa tatu inazalisha hashi tofauti ya uzito, kwa hivyo muhuri wa awali hauathiriki, lakini mfano wa mtu wa tatu uko nje ya ulinzi wa muhuri).
- Mabadiliko ya tabia kutokana na mabadiliko ya mazingira ya kupelekwa (system prompts tofauti, usanidi wa RAG, n.k.).
- Kushindwa ambako maabara haikujua kwa kweli wakati wa kutolewa. Muhuri unalazimisha maabara kwa *kile walichojua*; hauwezi kuweka nanga kile walichokijua.

## Wakati wa kutumia kifaa hiki

Unapaswa kuzingatia kutia muhuri kadi ya mfano ikiwa:

- Unatoa uzito wa mfano hadharani AU unapeleka mfano katika mazingira ambapo watumiaji wa chini wanajali utulivu wa tabia.
- Utoaji una umuhimu wa kutosha kwamba mizozo ya baadaye ya "hatukuwahi kusema hivyo" ni ya kuaminika (mfano wowote unaopelekwa kwa kiwango; mfano wowote muhimu kwa usalama; utoaji wowote unaoambatana na madai ya uwezo).
- Shirika lako liko tayari kufanya ahadi za kabla ya kupelekwa zinazozuia vitendo vya baadaye (hii ndio nukta inayobeba mzigo — angalia sehemu inayofuata).
- Unaweza kuhesabu SHA-256 ya faili ya uzito wakati wa kutolewa.

## Wakati wa KUTOTUMIA kifaa hiki

USITUMIE kifaa hiki ikiwa:

- Huko tayari kufungwa na ahadi za kabla ya kupelekwa katika FACT 06 ya mfano. Muhuri unafanya ahadi ziwe zinaweza kugunduliwa kimitambo; ikiwa hujajiandaa kwa uwajibikaji huo, usitie muhuri.
- Faili ya uzito itabadilika mara kwa mara (mfano, mtiririko wa fine-tuning wa kuendelea). Kila mabadiliko ya uzito yanahitaji chapisho jipya lililotiwa muhuri. Kutia muhuri kwa kila utoaji ni nzito; kifaa hiki ni kwa vituo vya ukaguzi *vilivyogandishwa*.
- Bado hujafanya mapitio ya usalama. Muhuri unalazimisha kwa matokeo ya mapitio ya usalama. Ikiwa unatia muhuri mapitio yasiyo kamili, una rekodi ya umma ya kudumu ya mapitio yasiyo kamili.
- Unaweza kutaka kufuta alama maalum ya tathmini baadaye. Muhuri ni wa kudumu. Machapisho mapya yaliyotiwa muhuri yanaweza kuondoa, lakini asili haiwezi kufutwa.

## Ahadi za kabla ya kupelekwa zinazobeba mzigo

FACT 06 ya mfano inalazimisha mchapishaji:

1. **Hakuna fine-tuning ya kimya chini ya jina moja.** Kila fine-tune inazalisha jina jipya la mfano, chapisho jipya lililotiwa muhuri, hashi mpya ya uzito. Mtangulizi anabaki kanuni kama toleo lililoitwa.

2. **Hakuna masasisho ya kimya ya tathmini.** Tathmini upya zinapata machapisho mapya yaliyotiwa muhuri ambayo yanataja asili kwa mzizi wa Merkle. Matoleo yanafuatiliwa, hayaandikwi juu.

3. **Hali za kushindwa zinazojulikana zinaweza kukua, kamwe haziwezi kupungua.** Kituo cha ukaguzi kilichogandishwa hakiwezi kuwa na hali za kushindwa zilizorekebishwa. Kwa hivyo orodha iliyochapishwa ni monotoniki kwa ufanisi.

4. **Kushughulikia kuondolewa.** Ikiwa imelazimishwa kuondoa mfano kutoka kwa usambazaji, maabara inaahidi kuchapisha taarifa ya mwisho iliyotiwa muhuri ya kuondolewa.

Maabara inayopitisha kifaa hiki inahitaji kuamua ahadi gani kati ya hizo inaweza kweli kuheshimu. Ikiwa huwezi kuheshimu nne zote, badilisha FACT 06 *kabla ya* kutia muhuri kuonyesha kile unachoweza kuheshimu, na ukubali ulinzi uliopungua unaopata. Kutia muhuri ahadi ambazo hutakusudia kuheshimu ni mbaya zaidi kuliko kutotia muhuri kabisa.

## Jinsi ya kufanya fork kifaa hiki kwa utoaji halisi

```bash
# 1. Copy this example into your release pipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Edit each fact for your real release
$EDITOR facts/01_example_notice.txt   # REMOVE — your release is not an example
                                       # Replace with a release notice for your model
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # the canonical model card
$EDITOR facts/05_eval_results.txt     # actual eval results
$EDITOR facts/06_release_commitments.txt # which commitments you can honor

# 3. Update site/index.html to reflect the real release.

# 4. Seal.
bash build/seal.sh

# 5. Verify locally.
python3 build/verify.py

# 6. Deploy to:
#    - Your release page (next to the model card and weights)
#    - The IPFS network (the seal.sh script already does this)
#    - Optionally: link to the sealed publication from your
#      Hugging Face / GitHub release notes
```

## Ushirikishaji na mtiririko wa utoaji uliopo

Kifaa hiki kimeundwa kuongezea pamoja na zana zilizopo, sio kuzibadilisha:

- **Hugging Face**: jumuisha URL ya chapisho lililotiwa muhuri au IPFS CID katika README.md ya kadi ya mfano. Elekeza wasomaji kwenye muhuri kwa madai ya utoaji ya thabiti-baiti.
- **Matoleo ya GitHub**: jumuisha risiti ya OpenTimestamps (`merkle_root.txt.ots`) kama mali ya utoaji. Mizozo ya baadaye ya "utoaji ulibadilika" basi inawekwa nanga kwa Bitcoin.
- **Viwango vya kadi za mfano (Mitchell et al. 2019)**: kifaa kinaambatana. Sehemu za kawaida za kadi ya mfano zinahusiana na FACTS 02–05 za muhuri. Unatengeneza kadi ya mfano kawaida, na zaidi ya hayo unaitia muhuri.
- **Mfumo wa tathmini (lm-evaluation-harness, BIG-bench, n.k.)**: fanya hashi ya kamati halisi ya harness na JSON ya pato ghafi; rejea hashi hizo katika FACT 05. Kuendesha tena kwa baadaye basi kunaweza kufanywa upya kwa kujitegemea.

## Kuhesabu hashi ya uzito

Kwa faili moja ya safetensors:

```bash
shasum -a 256 model.safetensors
```

Kwa vituo vya ukaguzi vya faili nyingi (GGUF shards, safetensors zilizogawanywa):

```bash
# Concatenate hashes in sorted order, then hash again
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Hashi ya mwisho ndio inayoingia katika FACT 03. Jumuisha hashi za kila shard na hashi ya mwisho ya jumla ili watumiaji waweze kuthibitisha shards binafsi wakati wanapakua.

## Kile wapokeaji (watumiaji wa mfano wako) wanapaswa kujua

Utoaji wa mfano na chapisho lililotiwa muhuri-MYRIAM unamruhusu mtumiaji:

1. **Kuthibitisha uzito waliopakua** kwa kufanya hashi tena na kulinganisha na FACT 03.
2. **Kuthibitisha kuwa kadi ya mfano haijaandikwa upya** kwa kukagua FACT 04 iliyotiwa muhuri dhidi ya toleo la sasa lililochapishwa la maabara.
3. **Kuthibitisha kuwa alama za tathmini ni zile za wakati wa kutolewa** kwa kulinganisha madai ya sasa ya tathmini ya maabara na FACT 05 iliyotiwa muhuri.
4. **Kuiwajibisha maabara kwa ahadi zake za kabla ya kupelekwa** kwa kukagua tabia halisi dhidi ya FACT 06 iliyotiwa muhuri.

Mtumiaji anayepata tofauti ana ushahidi wa kriptografia wa tofauti hiyo. Anaweza kuchapisha ushahidi huo; chapisho la awali lililotiwa muhuri ni nanga.

## Kile ambacho kifaa hiki SI

- Sio mbadala wa kufanya mapitio halisi ya usalama. Muhuri ni *rekodi* ya mapitio ya usalama, sio mapitio yenyewe.
- Sio mbadala wa tathmini halisi. Muhuri unaweka nanga alama unazozalisha; hauthibitishi mbinu.
- Sio dhamana kwamba mfano ni salama. Muhuri unaandika kile maabara inadai kuhusu mfano wakati wa kutolewa; hauthibitishi madai hayo.
- Sio ulinzi dhidi ya matumizi mabaya ya mfano na watumiaji wa chini.

## Maelezo kuhusu fine-tuning ya kupinga

Wasiwasi wa kawaida wa usalama wa AI: mtu anafanya fine-tuning ya mfano wako kuondoa tabia za usalama na kuusambaza tena. Muhuri HAUWEZI kuzuia hili. Kile ambacho muhuri unaweza kufanya:

- Kuweka nanga kile ambacho mfano wa *awali* ulikusudia kufanya (FACT 04).
- Kuweka nanga alama za tathmini za awali zilikuwa nini (FACT 05).
- Kutoa nukta ya kumbukumbu ambayo dhidi yake fine-tunes za kupinga zinaweza kupimwa.

Mtumiaji anayekutana na usambazaji upya wa mtu wa tatu anaweza kuthibitisha ikiwa uzito unaambatana na hashi ya awali iliyotiwa muhuri. Ikiwa la, mtumiaji anajua kwamba ana mfano usio wa awali na kwamba madai yoyote ya usalama yanayohusishwa na maabara hayatumiki.

## Hitimisho

Kutia muhuri utoaji wa mfano ni kazi ndogo ya ziada kwa maabara: ~dakika 10 kuhesabu hashi na kuendesha skripti ya muhuri, kisha uamuzi wa sekunde 30 kuhusu ahadi zipi za kabla ya kupelekwa kujumuisha. Uwajibikaji ulioongezwa ni wa kutofautiana: gharama ndogo kwa maabara za uaminifu, kizuizi kikubwa kwa maabara ambazo vinginevyo zingejigeuza madai yake kimya.

Ikiwa wewe ni maabara ya AI inayofikiria kupitisha, kifaa ni mali ya umma (CC0). Fanya fork. Badilisha. Hisabati ndio sehemu inayobeba mzigo, sio utekelezaji maalum.

## Leseni

Mali ya umma (CC0). Hakuna kutaja chanzo kunakohitajika.
