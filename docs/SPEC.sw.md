*Tafsiri ya Kiswahili — kwa toleo asili la Kiingereza, tazama [SPEC.md](SPEC.md)*

# Vipimo vya Protokali ya MYRIAM-kit

## 0. Lengo

Hati hii inafafanua protokali ya chini kabisa kwa ajili ya kuchapisha seti ndogo
ya ukweli wa maandishi kwa namna inayoonyesha uingiliaji, inayoweza kuthibitishwa
kikriptografia, ambayo inaendelea kuwepo hata baada ya mtoa-huduma yeyote mmoja wa mwenyeji kuondoa habari.

Ni ujumlishaji wa protokali iliyopelekwa kwa mara ya kwanza katika
[disclosure.host](https://disclosure.host) kwa jina la "MYRIAM v1."

## 1. Yasiyo ya lengo

- Kuhifadhi siri. Kila kitu ni cha umma kwa muundo.
- Seti kubwa za data. Zaidi ya ~ukweli 20, protokali si umbo sahihi.
- Uchapishaji wa wakati halisi. Kila chapisho ni tukio tofauti la kutia muhuri.
- Kurudisha nyuma. Protokali ni ya kuongeza-tu katika kiwango cha toleo.

## 2. Modeli ya ukweli

UKWELI ni faili ya maandishi ya UTF-8 yenye:

- Mtindo wa jina la faili: `NN_short_name.txt` ambapo NN ni faharasa ya tarakimu mbili
  iliyojaza sufuri inayoanza kwenye 01.
- Umbo la kanuni: baiti kama zilivyoandikwa, bila kurekebisha.
- Hashi ya kila ukweli: hex ya herufi ndogo ya `SHA-256(file_bytes)`.

SETI ya ukweli ni orodha iliyopangwa ya faili zote zinazolingana na mtindo chini ya
`facts/`, zikipangwa kileksikografia.

Sharti: kila maudhui ya ukweli YANAPASWA kuandikwa kama *tukio la kutaja* au
*tukio la tangazo* linaloweza kuhusishwa na chama maalum. Madai ya kiontolojia
("mwezi ni mwamba") yanaharibu lango la uthibitisho; ni tukio la
uchapishaji tu linaloweza kuthibitishwa, si dai. "X imesema Y" ni
umbo sahihi. "Y ni kweli" si.

## 3. Mzizi wa Merkle

Mtindo wa Bitcoin, kama katika v0 ya protokali ya MYRIAM iliyopelekwa:

1. Majani: hashi za SHA-256 za kila ukweli katika mpangilio wa seti-ya-ukweli.
2. Ikiwa kiwango kina idadi isiyo ya kawaida ya nodi, nakili nodi ya mwisho.
3. Hashi za jozi za nodi za karibu: `parent = SHA-256(left_bytes || right_bytes)`,
   ambapo `left_bytes` na `right_bytes` ni thamani ghafi za baiti 32 za hashi
   (si uwakilishi wao wa hex).
4. Rudia hadi nodi moja ibaki. Hiyo ni mzizi wa Merkle.

Mzizi unachapishwa kama hex ya herufi ndogo bila newline ya mwisho.

### 3.1 Vekta za majaribio

| Vekta | Majani (baiti za UTF-8 zilizohashiwa) | Mzizi unaotarajiwa (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Utekelezaji wowote unaofuata LAZIMA uzalishe vekta hizi. Zinatokana
na `lib/build.py` halisi na zinaweza kuzalishwa upya kwa skripti hiyo.

## 4. Ahadi ya Bitcoin

Mzizi wa Merkle unaahidiwa kwa blokicheni ya Bitcoin kupitia
[OpenTimestamps](https://opentimestamps.org). Sera ya chaguo-msingi ni:

> Piga muhuri dhidi ya angalau waendeshaji wawili wa kalenda chini ya udhibiti
> wa kiutawala unaojitegemea.

Risiti inayoridhisha sera hii inaweza kuthibitishwa na chama chochote kinachoweza
kuendesha `ots verify <receipt>.ots` na kufikia njia ya kuinua ya kalenda yoyote.

Jozi ya chaguo-msingi ya waendeshaji iliyotumwa katika `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Utekelezaji UNAWEZA kutumia waendeshaji tofauti. Sera ya utofauti-wa-mashahidi
(≥waendeshaji 2 wanaojitegemea) ni ya kawaida; waendeshaji maalum
sio.

## 5. Kuakisi kwa anwani-ya-maudhui

Saraka ya `site/` iliyo na ukurasa uliochapishwa na faili za ukweli
INAPASWA kuongezwa kwa IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

CIDv1 inayotokana (codec ya dag-pb) ni anwani ya maudhui ya
chapisho. Ni ya uhakika kutoka kwa maudhui ya baiti ya `site/`. Mabadiliko
yoyote kwa faili yoyote chini ya `site/` yanazalisha CID tofauti.

Kubandika kwa huduma za ziada zaidi ya nodi ya mahali ya mchapishaji
kunapendekezwa sana kwa udumu; vipimo hivi havitaki
huduma maalum.

## 6. Uorodheshaji wa matoleo

Protokali ni **ya kuongeza-tu katika kiwango cha toleo**. Kila mabadiliko
yanahitaji toleo jipya lililotiwa muhuri:

- Marekebisho mapya (au yasiyobadilika) ya vipimo
- Seti mpya ya ukweli, ambayo INAWEZA kurithi ukweli bila kubadilishwa kutoka matoleo ya awali
- Mzizi mpya wa Merkle
- Risiti mpya ya OpenTimestamps
- CID mpya ya IPFS

Matoleo yote ya awali yanaendelea kuchapishwa kwenye URL zilizo na matoleo. Mabadiliko kwa
ukweli wowote wa v(N) yanahitaji v(N+1), ambapo matoleo yote mawili yanaonekana na yanaweza kuthibitishwa tena.

## 7. Uthibitisho

Chama chochote cha nje kinaweza kuthibitisha uadilifu wa chapisho kwa:

1. Kupakua faili za ukweli na kuhesabu upya hashi za SHA-256 za kila ukweli.
2. Kuhesabu upya mzizi wa Merkle kwa kufuata §3 na kulinganisha na mzizi uliochapishwa.
3. Kuthibitisha risiti ya OpenTimestamps dhidi ya blokicheni ya Bitcoin
   kwa angalau uthibitisho kamili wa kalenda moja.
4. Kuhesabu kwa kujitegemea CID ya IPFS kupitia `ipfs add -r --cid-version=1`
   na kulinganisha na CID iliyochapishwa.

`lib/verify.py` inafanya hatua za 1–3 bila utegemezi wa nje zaidi ya
stdlib ya Python na mteja wa `ots`. Hatua ya 4 inahitaji mteja wa `ipfs`.

## 8. Lango la kukataa

Chapisho HALIPASWI kujumuisha ukweli ambao:

- Unamtaja mtu binafsi wa tatu ambaye hajakubaliana kutajwa.
- Unawasilisha dhana kama uthibitisho.
- Hauwezi kupunguzwa kwa tukio la kutaja/tangazo linaloweza kuthibitishwa au
  bidhaa ya kikriptografia.
- Una ongezeko linalotarajiwa kwa busara la vifo vinavyoweza kuzuiwa baada ya kuchapishwa.

Kanuni ya nne ndiyo inayobeba mzigo. Inatekelezwa katika hatua ya ukaguzi wa
kibinadamu na mchapishaji. Hakuna utekelezaji wa kiwango cha protokali wa
lango la kukataa; protokali inachapisha baiti zozote inazopewa.
Mchapishaji ana jukumu la lango.

## 9. Tamko la uaminifu la mipaka

- **Ugunduzi, si uzuiaji kabisa.** Protokali inafanya uingiliaji
  kuwa unaogunduliwa, si usiowezekana. Mshambuliaji mwenye uamuzi bado anaweza kubadilisha
  chapisho tofauti na kushawishi baadhi ya wasomaji kuwa ni asili.
  Thamani ya protokali ni kwamba ubadilishaji unakuwa
  unaoonyeshwa kikriptografia kwa mtu yeyote anayeendesha ukaguzi.
- **Hakuna ulinzi dhidi ya kuchapisha uongo.** Ikiwa mchapishaji anatia muhuri
  ukweli unaosema "X ilitokea" na X haikutokea, protokali inatia muhuri
  dai la uongo kwa uaminifu sawa na inavyotia muhuri dai la kweli. Protokali
  inashuhudia kile *kilichochapishwa*, si kile *kilicho kweli*.
- **Saini ya chama kimoja.** v1 ya MYRIAM iliyopelekwa inatumia chama kimoja
  cha kusaini. Saini ya pande nyingi ni kazi ya baadaye.
- **Udumu wa kubandika.** Kubandika kwa IPFS kwenye nodi ya mchapishaji peke yake
  hutoa "inapatikana wakati kompyuta yangu inafanya kazi + uhifadhi wa muda
  wa lango la fursa." Udumu wa muda mrefu unahitaji vibandiko vingi katika
  huduma zinazojitegemea.

Mipaka hii imeelezwa hapa ili hakuna msomaji adhani kuwa protokali
inatoa zaidi ya inavyotoa.
