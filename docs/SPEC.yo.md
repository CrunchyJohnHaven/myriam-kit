*Ìtumọ̀ sí Yorùbá — fún ìtẹ̀jáde Gẹ̀ẹ́sì àkọ́kọ́, wo [SPEC.md](SPEC.md)*

# Ìpèsè Ìlànà MYRIAM-kit

## 0. Èrèdí

Àkọsílẹ̀ yìí ṣe ìpèsè ìlànà kékeré jùlọ fún títẹ àkójọ kékeré ti àwọn òtítọ́
ọ̀rọ̀ jáde ní ọ̀nà tí ó fi ìfọwọ́sí hàn, tí a sì lè jẹ́rìí nípa-ìṣirò-ìkọ̀kọ̀,
tí ó sì yè bọ́ kúrò nínú yíyọ kúrò láti ọwọ́ olùpèsè-ìgbàlejò èyíkéyìí kọ̀ọ̀kan.

Ó jẹ́ ìfilọ́nà-gbogbogbòò ti ìlànà tí a kọ́kọ́ fi sí ṣíṣe ní
[disclosure.host](https://disclosure.host) lábẹ́ orúkọ "MYRIAM v1."

## 1. Àwọn ohun tí kì í ṣe èrèdí

- Ìtọ́jú àṣírí. Gbogbo ohun jẹ́ ti gbogbo ènìyàn nípa ìṣẹ̀dá.
- Àwọn àkójọ-data ńlá. Ní àkójọ ju nǹkan bí 20 òtítọ́ lọ, ìlànà náà jẹ́ ìrísí tí kò tọ́.
- Ìtẹ̀jáde àkókò-gidi. Ìtẹ̀jáde kọ̀ọ̀kan jẹ́ ìṣẹ̀lẹ̀ ìfi-èdìdì-lù-ọ̀tọ̀.
- Ìfagilé. Ìlànà náà jẹ́ ìfikún-nìkan ní ìpele ẹ̀dà.

## 2. Awoṣe òtítọ́

ÒTÍTỌ́ jẹ́ fáìlì ọ̀rọ̀ UTF-8 pẹ̀lú:

- Àpẹẹrẹ orúkọ fáìlì: `NN_short_name.txt` níbi tí NN ti jẹ́ olùṣàfihàn nọ́mbà
  ẹlẹ́ní-méjì tí a fi òdo dí ní iwájú tí ó bẹ̀rẹ̀ ní 01.
- Ìrísí ìpilẹ̀: àwọn báìtì gẹ́gẹ́ bí a ti kọ wọ́n, láìsí ìmúdọ́gba.
- Hash fún òtítọ́ kọ̀ọ̀kan: hex aláwòṣẹ́sẹ̀ ti `SHA-256(file_bytes)`.

ÀKÓJỌ òtítọ́ ni àtòjọ tí a ṣe ìtòlẹ́sẹẹsẹ rẹ̀ ti gbogbo àwọn fáìlì tí ó bá àpẹẹrẹ
yìí mu lábẹ́ `facts/`, tí a ṣe ìtòjọ pẹ̀lú àwọn ọ̀rọ̀.

Àkáwọ̀: ara òtítọ́ kọ̀ọ̀kan SHOULD ni a sọ̀rọ̀ rẹ̀ gẹ́gẹ́ bí *ìṣẹ̀lẹ̀ ìdánilórúkọ*
tàbí *ìṣẹ̀lẹ̀ ìfìsílẹ̀-òfin* tí a lè dá lórí ẹgbẹ́ pàtó kan. Àwọn ẹ̀sùn ontolojíìkì
("òṣùpá jẹ́ àpáta") ba ẹnu-bodè ìjẹ́rìí jẹ́; ìṣẹ̀lẹ̀ ìtẹ̀jáde nìkan ni a lè jẹ́rìí,
kì í ṣe ẹ̀sùn náà fúnra rẹ̀. "X ti sọ Y" ni ìrísí tí ó tọ́. "Y jẹ́ òtítọ́" kò jẹ́.

## 3. Gbòǹgbò Merkle

Aṣa Bitcoin, gẹ́gẹ́ bí ó ti wà ní v0 ti ìlànà MYRIAM tí a ti fi sí ṣíṣe:

1. Àwọn ewé: hash SHA-256 fún òtítọ́ kọ̀ọ̀kan ní ìtòlẹ́sẹẹsẹ àkójọ òtítọ́.
2. Bí ìpele kan bá ní iye àwọn nóòdù tí kò pé, ṣe àdàkọ nóòdù ìkẹyìn.
3. Ṣe hash àwọn nóòdù tí ó wà lẹ́gbẹ̀ẹ́ ara wọn ní méjì méjì:
   `parent = SHA-256(left_bytes || right_bytes)`,
   níbi tí `left_bytes` àti `right_bytes` ti jẹ́ àwọn iye hash báìtì-32 ní àìlórí
   (kì í ṣe àwọn ìṣàfihàn hex wọn).
4. Tún èyí ṣe títí ọ̀kan nóòdù yóò fi kù. Ìyẹn ni gbòǹgbò Merkle.

A tẹ gbòǹgbò náà jáde gẹ́gẹ́ bí hex aláwòṣẹ́sẹ̀ láì sí ìlà tuntun ní ìparí.

### 3.1 Àwọn vector ìdánwò

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Ìmúṣe èyíkéyìí tí ó bá mu MUST tún ṣe àwọn vector wọ̀nyí. A jẹ́ wọn láti
inú `lib/build.py` gan-an, a sì lè dá wọn padà pẹ̀lú skríìpù náà.

## 4. Ìfaramọ́ Bitcoin

A fi gbòǹgbò Merkle náà sí bulọ́ọ̀kuchain Bitcoin nípasẹ̀
[OpenTimestamps](https://opentimestamps.org). Ìlànà àyàsọ́tọ̀ ni:

> Fi èdìdì lù sí àwọn olùṣiṣẹ́ kalẹ́ńdà ó kéré jù méjì lábẹ́ ìṣàkóso
> ìṣèjọba ọ̀tọ̀ọ̀tọ̀.

Ìjẹ́rìí tí ó bá ìlànà yìí mu jẹ́ ohun tí ẹgbẹ́ èyíkéyìí lè jẹ́rìí tí ó lè
ṣiṣẹ́ `ots verify <receipt>.ots` tí ó sì lè dé ọ̀nà ìgbéga ti kalẹ́ńdà
èyíkéyìí.

Àwọn olùṣiṣẹ́ àyàsọ́tọ̀ tí a fi rán nínú `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Àwọn ìmúṣe MAY lo àwọn olùṣiṣẹ́ ọ̀tọ̀ọ̀tọ̀. Ìlànà ọ̀nà-pàtàkì-ẹlẹ́rí
(≥2 àwọn olùṣiṣẹ́ ọ̀tọ̀ọ̀tọ̀) jẹ́ àìlétò; àwọn olùṣiṣẹ́ pàtó náà kì í ṣe bẹ́ẹ̀.

## 5. Àdàkọ-àwòrán tí a dá-lórí-àkóónú-àdírẹ́sì

Ìtọ́sọ́nà `site/` tí ó ní ojú-ìwé tí a tẹ jáde àti àwọn fáìlì òtítọ́ SHOULD
ni a fi sí IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

CIDv1 (codec dag-pb) tí ó jáde ni àdírẹ́sì àkóónú ti ìtẹ̀jáde náà. Ó jẹ́ ohun tí
a pinnu láti àkóónú báìtì ti `site/`. Ìyípadà èyíkéyìí sí fáìlì èyíkéyìí lábẹ́
`site/` ń dá CID tí ó yàtọ̀.

A gba ọ́ níyànjú gan-an láti pin sí àwọn iṣẹ́ àfikún ní ìta nóòdù àdúgbò ti
olùtẹ̀-jáde fún ìdúró-pẹ́; ìpèsè yìí kò pàṣẹ àwọn iṣẹ́ pàtó.

## 6. Ìpèsè-ẹ̀dà

Ìlànà náà jẹ́ **ìfikún-nìkan ní ìpele ẹ̀dà**. Ìyípadà gbogbo nílò ẹ̀dà tuntun
tí a fi èdìdì lù:

- Àtúnyẹ̀wò ìpèsè tuntun (tàbí tí kò yípadà)
- Àkójọ òtítọ́ tuntun, tí ó MAY jogún àwọn òtítọ́ láìyípadà láti àwọn ẹ̀dà
  ìṣáájú
- Gbòǹgbò Merkle tuntun
- Ìjẹ́rìí OpenTimestamps tuntun
- CID IPFS tuntun

Gbogbo àwọn ẹ̀dà ìṣáájú ń wà ní títẹ jáde ní àwọn URL ti ẹ̀dà. Ìyípadà sí òtítọ́
èyíkéyìí ní v(N) nílò v(N+1), pẹ̀lú àwọn ẹ̀dà méjèèjì tí a lè rí tí a sì lè
tún jẹ́rìí.

## 7. Ìjẹ́rìí

Ẹgbẹ́ kẹta èyíkéyìí lè jẹ́rìí ìfaramọ́ ti ìtẹ̀jáde kan nípa:

1. Gbígba àwọn fáìlì òtítọ́ wọlé àti títún ṣe ìṣirò hash SHA-256 fún òtítọ́ kọ̀ọ̀kan.
2. Títún ṣe ìṣirò gbòǹgbò Merkle gẹ́gẹ́ bí §3 àti fífi wé gbòǹgbò tí a tẹ jáde.
3. Jíjẹ́rìí ìjẹ́rìí OpenTimestamps lòdì sí bulọ́ọ̀kuchain Bitcoin fún ìjẹ́rìí
   pípé ti kalẹ́ńdà kan ó kéré jù.
4. Lọ́nà-ọ̀tọ̀ọ̀tọ̀ títún ṣe ìṣirò CID IPFS nípasẹ̀ `ipfs add -r --cid-version=1`
   àti fífi wé CID tí a tẹ jáde.

`lib/verify.py` ṣe àwọn ìgbésẹ̀ 1–3 láìsí àwọn ìgbáralé ìta ní ìta stdlib
Python àti olùsoso `ots`. Ìgbésẹ̀ 4 nílò olùsoso `ipfs`.

## 8. Ẹnu-bodè ìkọ̀sílẹ̀

Ìtẹ̀jáde MUST NOT ní òtítọ́ kan tí ó:

- Ṣe ìdánilórúkọ ẹgbẹ́ kẹta àdáni tí kò gba láti dárúkọ.
- Fi èrò-èrò sí gẹ́gẹ́ bí ìjẹ́rìí.
- Kò lè dín sí ìṣẹ̀lẹ̀ ìdánilórúkọ/ìfìsílẹ̀-òfin tí a lè jẹ́rìí tàbí ohun-ìṣe
  ìṣirò-ìkọ̀kọ̀.
- Ní ìfojúsọ́nà ìbísí ìwọ̀ndéédéé nínú àwọn ikú tí ó ṣeé ṣe láti dáàbò bò
  pẹ̀lú ìtẹ̀jáde.

Òfin kẹrin ni ó gbé ẹrù náà. A mú un ṣiṣẹ́ ní ìgbésẹ̀ àyẹ̀wò ènìyàn láti ọwọ́
olùtẹ̀-jáde. Kò sí ìmúṣiṣẹ́ ní ìpele-ìlànà ti ẹnu-bodè ìkọ̀sílẹ̀; ìlànà náà ń
tẹ ohunkóhun jáde tí a fún un. Olùtẹ̀-jáde ni ó jẹ́ ojúṣe fún ẹnu-bodè náà.

## 9. Ìfìfọwọ́sọ òtítọ́ ti àwọn ààlà

- **Ṣíṣe-àwárí, kì í ṣe àìṣeéṣe.** Ìlànà náà mú ìfọwọ́sí jẹ́ ohun tí a lè
  ṣàwárí, kì í ṣe àìṣeéṣe. Olùkọlù tí ó pinnu ṣì lè rọ́pò ìtẹ̀jáde mìíràn
  kí ó sì yí àwọn oníkàwé kan lójú pé òun ni ìpilẹ̀ṣẹ̀. Iye ìlànà náà ni
  pé ìrọ́pò náà di ohun tí a lè fi hàn nípa-ìṣirò-ìkọ̀kọ̀ sí ẹnikẹ́ni tí
  ó ṣiṣẹ́ àyẹ̀wò náà.
- **Kò sí ààbò lòdì sí títẹ àìṣòótọ́ jáde.** Bí olùtẹ̀-jáde bá fi èdìdì lu
  òtítọ́ tí ó sọ pé "X ṣẹlẹ̀" tí X kò sì ṣẹlẹ̀, ìlànà náà fi èdìdì lu ẹ̀sùn
  àìṣòótọ́ pẹ̀lú àdúgbò kannáà gẹ́gẹ́ bí ó ti fi èdìdì lu àwọn òtítọ́ tòótọ́.
  Ìlànà náà jẹ́rìí ohun tí a *tẹ jáde*, kì í ṣe ohun tí ó jẹ́ *òtítọ́*.
- **Ìfọwọ́sí-ẹgbẹ́-ẹyọ.** v1 ti MYRIAM tí a fi sí ṣíṣe ń lo olúwa ìfọwọ́sí
  ẹyọ kan. Ìfọwọ́sí-ẹgbẹ́-ọ̀pọ̀ jẹ́ iṣẹ́ ọjọ́ iwájú.
- **Ìdúró-pẹ́ ti pinning.** Pinning IPFS ní nóòdù olùtẹ̀-jáde nìkan ń pèsè
  "wà bí laptop mi ti ṣiṣẹ́ + caching ẹnu-ọ̀nà tí ó bá ṣẹlẹ̀." Ìdúró-pẹ́
  fún ìgbà pípẹ́ nílò pin tí ó pọ̀ rẹpẹtẹ kọjá àwọn iṣẹ́ ọ̀tọ̀ọ̀tọ̀.

A sọ àwọn ààlà wọ̀nyí níbí kí ó má bàa sí oníkàwé tí ó rò pé ìlànà náà ń mú
jù bí ó ti ń ṣe lọ.
