*Tafsiri ya Kiswahili — kwa toleo asili la Kiingereza, tazama [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#mifano-iliyofanyiwa-kazi)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Kifaa kidogo cha kuchapisha seti ndogo ya ukweli kwa namna ambayo:

- Mabadiliko yoyote kwa ukweli wowote yanaweza kugunduliwa hadharani (mti wa Merkle)
- Hali ya wakati wa kuchapisha inaweza kuthibitishwa dhidi ya blokicheni ya Bitcoin (OpenTimestamps)
- Maudhui yanaendelea kuwepo hata baada ya mtoa-huduma yeyote mmoja kuondoa habari (IPFS)
- Mradi mzima una uzito wa chini ya KB 100 na unaweza kuthibitishwa kwa takriban mistari 50 ya Python

Hii si blokicheni. Hakuna tokeni. Hakuna utaratibu wa makubaliano wa kushiriki. Hakuna DAO. Zana hii ni `sha256sum` + `ots` + `ipfs`, vilivyounganishwa pamoja kwa kanuni nzuri za majina.

Imepewa jina baada ya protokali ya MYRIAM iliyoanzishwa kwa mara ya kwanza katika [disclosure.host](https://disclosure.host) tarehe 2026-05-21. Ukurasa huo una ukweli sita, mzizi wa Merkle, na uthibitisho wa Bitcoin. Kifaa hiki ni ujumlishaji wa muundo huo.

## Hali ya sasa

- v0: inafanya kazi kwenye macOS ikiwa na Python 3.10+, Homebrew, na muunganisho
  wa intaneti. Linux haijajaribiwa lakini inapaswa kufanya kazi. Windows: leta WSL.
- Mali ya umma (CC0). Itumie, ifanye fork, iingize kwenye repo yako, usitoe sifa kamwe. Lengo si sifa.

## Unachoweza kufanya nayo

Muundo huu unafaa popote seti ndogo ya ukweli inahitajika kuwa:

- **Inayoweza kuchapishwa** kwa hadhira pana kupitia HTTP ya kawaida
- **Yenye kudumu** — wasomaji wa miaka 30 mbele wanapaswa bado kuweza kuthibitisha
- **Inayoonyesha kuingiliwa** — mabadiliko yoyote lazima yagunduliwe, si lazima yazuiwe
- **Bila kuhitaji uaminifu** — hakuna msomaji anayepaswa kumwamini mchapishaji (ila tu hisabati)

Matumizi maalum yapo katika [docs/USE_CASES.md](docs/USE_CASES.md). Orodha fupi:

| Eneo | Ukweli uliotiwa muhuri |
|---|---|
| Afya ya umma | Matokeo ya majaribio ya bechi ya chanjo, hatua muhimu za majaribio ya dawa |
| Uchaguzi | Jumla ya kura za ngazi ya kituo wakati wa uthibitisho |
| Usalama wa AI | Hashi ya uzito wa modeli + kadi ya modeli + alama za tathmini wakati wa kutolewa |
| Uandishi wa habari | Orodha ya nyaraka chanzo (hashi tu) kwa ajili ya kuvujisha kwa wapiga filimbi |
| Sayansi | Hashi ya data ghafi + hashi ya skripti ya uchanganuzi + matokeo yanayodaiwa |
| Mahakama | Hashi za ushahidi wa kidijitali wakati wa kupatikana |
| Manunuzi | Mizizi iliyotiwa muhuri ya data ya matumizi ya umma |

Kinachowafanya hawa kufanana: seti ndogo ya ukweli, mahitaji makubwa ya udumu, pande nyingi ambazo haziaminiani, na bajeti ndogo sana ya kuhifadhi. Hiyo ndiyo hasa hali ambayo zana hii imejengewa.

## Kile ambacho HAIFANYI

- **Kuhifadhi siri.** Kila kitu unachoweka katika `facts/` ni cha umma. Protokali hii ni kwa ajili ya
  kuchapisha, si kuficha.
- **Kuongezeka hadi seti kubwa za data.** Mti wa Merkle unaongezeka vizuri; umakini wa
  msomaji haungezeki. Baada ya takriban ukweli 20 ukurasa unakuwa hauwezi kusomeka. Ikiwa
  unataka kutia muhuri rekodi milioni, fanya hashi nje ya ukurasa na uweke
  mzizi wa Merkle wa mti huo wa pembeni katika ukweli mmoja.
- **Kujilinda dhidi ya kufuta.** Lengo zima ni kwamba huwezi kubadilisha
  kile ulichokitia muhuri. Ikiwa unaweza kutaka kufuta dai baadaye, usilitie muhuri.
- **Kumshawishi mtu mwenye shaka aliyeazimia.** Mtu mwenye shaka aliyeazimia hatakimbiza
  `ipfs add -r --cid-version=1 -Q facts/`. Hata hivyo, atakushtaki
  kwa kutunga utaratibu mzima. Hakuna ulinzi wa kiwango cha protokali
  dhidi ya hali hiyo ya pili ya kushindwa. Hakuna ulinzi wa kiwango cha protokali
  dhidi ya kitu chochote kinachoishi katika nia ya kibinadamu badala ya hisabati.

## Jinsi ya kuitumia

Mwongozo wa dakika tano upo katika [docs/QUICKSTART.md](docs/QUICKSTART.md).
Maelezo kamili ya protokali yapo katika [docs/SPEC.md](docs/SPEC.md).
Modeli ya vitisho ipo katika [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Ulinganisho na mifumo jirani (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, n.k.) upo katika [docs/COMPARISON.md](docs/COMPARISON.md).

## Jinsi ya kuthibitisha chapisho la mtu mwingine

Chaguzi tatu, kwa mpangilio wa upatikanaji:

1. **Kivinjari**: fungua [`lib/verify.html`](lib/verify.html) katika kivinjari chochote cha
   kisasa. Bandika URL ya chapisho. Bofya "verify". Inatumia
   `crypto.subtle` kwa hashing — hakuna usakinishaji, hakuna backend, hakuna telemetry.
   Hatua ya uthibitisho wa Bitcoin bado inahitaji zana ya CLI (tazama hatua ya 7
   katika ukurasa wa verifier).
2. **Python**: `python3 lib/verify.py` kutoka ndani ya saraka ya
   chapisho. Stdlib tu; inahitaji `ots` kwa uthibitisho wa Bitcoin.
3. **Kutoka mwanzo**: soma [`docs/SPEC.md §3`](docs/SPEC.md) na
   utengeneze upya. Algoriti ya Merkle ni chini ya mistari 30 katika lugha yoyote.

## Mifano iliyofanyiwa kazi

Vifaa sita vya mfano vya kiwango cha uzalishaji vinakuja na zana hii. Kila kimoja
kimetiwa muhuri, kimeshikiliwa kwa OTS, kimebandikwa kwa IPFS, na kinajumuisha README ya kupitisha
inayoeleza wakati wa kuifanya fork kwa kesi halisi na njia gani za kushindwa
inajilinda dhidi yake.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  kwa hali ya kushindwa ya Boeing 737 MAX / Theranos / ripoti ya
  mkaguzi wa FDA ambapo ushahidi unazikwa au unabadilishwa na watu wa kati.
- [`examples/ai-model-card/`](examples/ai-model-card/) — kwa maabara za AI
  zinazotoa modeli, zikiwa na ahadi za kabla ya kupelekwa ambazo zinakuwa
  zinazoweza kugunduliwa kimitambo badala ya kwa maneno tu.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  kwa wadhamini wa majaribio ya kliniki, ili kukamata mabadiliko ya mwisho ya hatua za
  matokeo na ripoti ya kuchagua (hali za kushindwa za Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  kwa watengenezaji wa chanjo na mamlaka za QA, kuweka nanga
  matokeo ya majaribio ya kutolewa na ahadi za kuita bidhaa.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  kwa vikundi vya utafiti, kuweka nanga utatu wa (data, mfumo wa
  uchanganuzi, matokeo yanayotarajiwa) KABLA ya uchanganuzi ili kufanya p-hacking
  na HARKing zigundulike hadharani.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  kwa bodi za uhakiki wa kura za wilaya na mamlaka za uchaguzi, kuweka nanga
  jumla zilizothibitishwa wakati wa uthibitisho ili mabadiliko ya kimya
  baada ya uthibitisho yaweze kugunduliwa hadharani.

Soma mojawapo ya hivi kabla ya kuandika kifaa chako mwenyewe. Kinachofanana zaidi na
matumizi yako kwa kawaida ndio kianzio sahihi cha fork.

## Anzia haraka

Toleo la mstari mmoja:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# hariri facts/*.txt ili kueleza kile unachokitaka kutiwa muhuri
./lib/seal.sh        # inaunda mzizi wa Merkle, inashikilia OTS, inabandika IPFS
./lib/verify.sh      # inathibitisha tena kila kitu kwa mahali
# pakia site/ kwa mwenyeji wowote wa tovuti tuli. Mahali popote. Haijalishi.
```

## Kwa nini zana hii ipo

Vipengele vya kimsingi vya kriptografia (miti ya Merkle, OpenTimestamps, IPFS) vimekuwa
vya kukomaa kwa miaka. Kilichokosekana ni gundi ndogo zaidi inayowezekana —
kifaa ambacho ungeweza kukidondoshea katika mradi wa pembeni na kuwa na bidhaa
iliyotiwa muhuri inayoweza kuchapishwa katika alasiri moja, bila kuanzisha miundombinu,
bila kujifunza protokali, bila kuandika mstari mmoja wa kodi zaidi ya
ukweli wenyewe.

Zana nyingi za uchapishaji wa kriptografia zinadhani unataka kuwa mwendeshaji wa
nodi. Hii inadhani unataka kuchapisha faili sita za maandishi na usifikirie kuhusu
kriptografia tena kamwe.

## Athari na kazi za awali

- [Sigsum](https://www.sigsum.org/) — kumbukumbu za uwazi kwa saini
- [Sigstore](https://www.sigstore.dev/) — uadilifu wa mnyororo wa usambazaji wa programu
- [Certificate Transparency](https://certificate.transparency.dev/) — kumbukumbu za vyeti vya TLS
- [OpenTimestamps](https://opentimestamps.org/) — muhuri wa wakati wa Bitcoin
- [IPFS](https://ipfs.tech/) — uhifadhi wenye anwani ya maudhui
- [Protokali ya CALM](https://disclosure.host) — mfumo wa uchapishaji
  wa kumlinda mkuu ambamo mfano wa kwanza (MYRIAM katika disclosure.host)
  uliandikwa

myriam-kit ni ndogo zaidi kati ya hizi. Iko karibu zaidi kiroho na bomba la Unix
kuliko mfumo.

## Maelezo kuhusu jina

Protokali ya MYRIAM ilipewa jina kutoka kwa Myriam Proof ya John Bradley, uthibitisho wa
kimantiki uliotamkwa kuhusu mahali pa kwanza pa mawasiliano kwa akili isiyo ya
binadamu. Protokali haitegemei uthibitisho huo kuwa wa kweli. Protokali
inafanya kazi kwa seti yoyote ndogo ya ukweli yoyote; inatokea tu kuwa
ilipelekwa kwa mara ya kwanza kuchapisha ukweli sita ambao unajumuisha dai kuhusu
ufichuzi wa wageni.

Ikiwa unafanya fork kifaa hiki ili kutia muhuri bechi za chanjo au jumla za uchaguzi,
ukweli kwamba kilitumika hapo awali kuchapisha dai kuhusu mawasiliano ya wageni
hauhusiani na wewe. Hisabati haijali.

Hivyo: ikiwa UTATUMIA hii kuchapisha dai kuhusu mawasiliano ya wageni,
protokali imejaribiwa kivita katika uwanja huo maalum. README ya
upelekaji wa kwanza wa MYRIAM inaeleza wazi kwamba ni kazi ya kisanaa ya
mhusika wa LLM aitwaye Calm, si mawasiliano kutoka kwa mtu yeyote wa
nje ya dunia. Pengine unapaswa kufanya hivyo hivyo. Wasomaji watadhani mabaya kuhusu
hali yako ya akili vinginevyo.

## Inadumishwa na

Bado hakuna. Mali ya umma. Ifanye fork. Iboresha. Endelea kuipeleka protokali
mbele bila kuomba ruhusa.
