# Bayanin Tsarin MYRIAM-kit

*Fassara zuwa Hausa — don ainihin sigar Turanci, duba [SPEC.md](SPEC.md)*

## 0. Manufa

Wannan takarda ta ƙayyade ƙaramin tsari don buga ƙaramin tarin gaskiya na
rubutu ta hanyar da ke bayyana tampering, ana iya tabbatar da shi ta
cryptography, kuma yana rayuwa ko da an cire shi daga kowane mai gida
ɗaya na hosting.

Shi ne gama-gari na tsarin da aka fara turawa a
[disclosure.host](https://disclosure.host) ƙarƙashin sunan "MYRIAM v1."

## 1. Abubuwan da ba manufa ba

- Adana sirri. Komai jama'a ne ta gini.
- Manyan tarin bayanai. Bayan kusan gaskiya 20, tsarin yana da
  kuskuren siffa.
- Bugawa a ainihin lokaci. Kowace bugawa al'amari ne na rufewa daban.
- Ja da baya. Tsarin yana ƙarawa kawai a matakin sigar.

## 2. Tsarin gaskiya

GASKIYA fayil ne na rubutun UTF-8 mai:

- Tsarin sunan fayil: `NN_short_name.txt` inda NN lambar lamba biyu mai
  sifili a gaba take farawa daga 01.
- Tsarin canonical: bytes kamar yadda aka rubuta, babu normalization.
- Hash na kowace gaskiya: hex mai ƙarami na `SHA-256(file_bytes)`.

TARIN gaskiya jeri ne mai oda na duk fayilolin da suka dace da tsarin
ƙarƙashin `facts/`, an shirya su a tsarin haruffa.

Iyaka: kowane jikin gaskiya SHOULD a bayyana shi a matsayin *al'amarin
suna* ko *al'amarin sanarwa* da ake danganta shi da takamaiman ɓangare.
Da'awa ta ontology ("wata dutse ne") suna lalata ƙofar tabbatarwa; kawai
al'amarin bugawa ne ana iya tabbatar da shi, ba da'awar ba. "X ya bayyana
Y" shi ne tsarin da ya dace. "Y gaskiya ne" ba ya.

## 3. Tushen Merkle

Salon Bitcoin, kamar yadda yake a cikin v0 na tsarin MYRIAM da aka tura:

1. Ganye: hashes na SHA-256 na kowace gaskiya bisa tsarin tarin gaskiya.
2. Idan matakin yana da adadin nodes mara ma'auni, kwafa node na ƙarshe.
3. Pair-hash nodes makwabta: `parent = SHA-256(left_bytes || right_bytes)`,
   inda `left_bytes` da `right_bytes` su ne ainihin ƙimomin hash na byte
   32 (ba wakilcin hex ɗinsu ba).
4. Maimaita har sai node ɗaya ya rage. Wannan shi ne tushen Merkle.

Ana buga tushen a matsayin hex mai ƙarami ba tare da newline mai bin ba.

### 3.1 Vectors na gwaji

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Duk wani aiwatarwa mai bin ka'ida MUST ya sake samar da waɗannan
vectors. An samo su daga ainihin `lib/build.py` kuma ana iya sake
samar da su da wancan script ɗin.

## 4. Ƙaddamarwar Bitcoin

Ana ƙaddamar da tushen Merkle zuwa blockchain na Bitcoin ta hanyar
[OpenTimestamps](https://opentimestamps.org). Tsohuwar manufar ita ce:

> Sa hatimi a kan aƙalla masu kula da kalanda biyu ƙarƙashin ikon
> gudanarwa mai zaman kansa.

Shaidar da ta cika wannan manufa ana iya tabbatar da ita ta kowane
ɓangare wanda zai iya gudanar da `ots verify <receipt>.ots` kuma ya isa
hanyar haɓakar kowane kalanda.

Tsohuwar nau'in ma'aikatan da aka kawo a cikin `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Aiwatarwa MAY suna amfani da masu gudanarwa daban. Manufar
bambancin-shaidu (≥2 masu gudanarwa masu zaman kansu) tana da matsayin
normative; takamaiman masu gudanarwa ba sa.

## 5. Madubin da aka adireshi ta abun ciki

Directory na `site/` da ke ƙunshe da shafin da aka buga da fayilolin
gaskiya SHOULD a ƙara su zuwa IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

CIDv1 da ya fito (dag-pb codec) shi ne adireshin abun ciki na bugawar.
Yana da tabbas daga abubuwan byte na `site/`. Duk wani gyara ga kowane
fayil ƙarƙashin `site/` yana samar da CID daban.

Ana ba da shawara mai ƙarfi ga pinning zuwa ƙarin ayyuka fiye da node na
mai bugawa na gida don dorewa; wannan bayanin tsari bai wajabta
takamaiman ayyuka ba.

## 6. Sigar

Tsarin yana **ƙarawa kawai a matakin sigar**. Kowane canji yana
buƙatar sabuwar sigar da aka rufe:

- Sabuwar (ko mai ba a canza ba) bita ta bayanin tsari
- Sabon tarin gaskiya, wanda MAY ya gaji gaskiya marasa canji daga
  siginan da suka gabata
- Sabuwar tushen Merkle
- Sabuwar shaidar OpenTimestamps
- Sabon CID na IPFS

Duk sigar da suka gabata sun rage suna bugawa a URLs masu sigar. Canji
ga kowace gaskiya ta v(N) yana buƙatar v(N+1), tare da siginan biyu suna
bayyane kuma ana iya sake tabbatar da su.

## 7. Tabbatarwa

Duk wani ɓangare na uku zai iya tabbatar da amincin bugawa ta:

1. Sauke fayilolin gaskiya kuma sake lissafa hashes na SHA-256 na kowace
   gaskiya.
2. Sake lissafa tushen Merkle bisa §3 kuma kwatanta da tushen da aka buga.
3. Tabbatar da shaidar OpenTimestamps a kan blockchain na Bitcoin
   don aƙalla cikakkiyar shaidar kalanda guda.
4. Da kansa sake lissafa CID na IPFS ta hanyar
   `ipfs add -r --cid-version=1` kuma kwatanta da CID da aka buga.

`lib/verify.py` yana yin matakai 1–3 ba tare da abubuwan dogaro na waje
ban da Python stdlib da abokin ciniki na `ots` ba. Mataki 4 yana
buƙatar abokin ciniki na `ipfs`.

## 8. Ƙofar ƙin yarda

Bugawa MUST NOT ta haɗa da gaskiya da:

- Ke gano ɓangare na uku mai zaman kansa wanda bai yarda a kira sunansa ba.
- Ke gabatar da hasashe a matsayin tabbaci.
- Ba za a iya rage shi zuwa al'amarin suna/sanarwa da ake iya tabbatarwa
  ko kayan tarihi na cryptographic ba.
- Yana da hauhawa mai ma'ana da ake tsammani a cikin mutuwar da ake iya
  hanawa idan an buga shi.

Doka ta huɗu ita ce ɗauke da nauyi. Ana aiwatar da ita a matakin sake
nazari na ɗan adam ta mai bugawa. Babu aiwatarwa a matakin tsari na
ƙofar ƙin yarda; tsarin yana buga duk wani bytes da aka ba shi. Mai
bugawa ne ke da alhakin ƙofar.

## 9. Bayani na gaskiya na iyaka

- **Ana iya ganowa, ba rashin yiwuwa ba.** Tsarin yana sanya tampering
  a iya ganowa, ba a iya yiwuwa ba. Mai kai hari mai ƙwazo har yanzu
  zai iya maye gurbin wata bugawa daban kuma ya rinjayi wasu masu karatu
  cewa ita ce ta asali. Darajar tsarin ita ce maye gurbin ya zama mai
  iya nuni ta cryptography ga duk wanda ya gudanar da gwajin.
- **Babu kariya daga buga ƙarya.** Idan mai bugawa ya rufe gaskiya
  da ke cewa "X ya faru" kuma X bai faru ba, tsarin yana rufe da'awar
  ƙarya da daidai amincin da yake rufe ainihin gaskiya. Tsarin yana
  shaida abin da aka *buga*, ba abin da yake *gaskiya* ba.
- **Sa hannu na ɓangare ɗaya.** v1 na MYRIAM da aka tura yana amfani da
  babban mai sa hannu ɗaya. Sa hannu na ɓangarori da yawa aikin nan
  gaba ne.
- **Dorewar pinning.** Pinning na IPFS a node na mai bugawa kawai yana
  ba da "samuwa yayin da laptop dina yake aiki + caching na ɗan dama
  daga gateway." Dorewa ta tsawon lokaci tana buƙatar pins masu
  yawa a cikin ayyuka masu zaman kansu.

An faɗi waɗannan iyaka a nan don kada wani mai karatu ya ɗauka cewa
tsarin yana ba da fiye da abin da yake bayarwa.
