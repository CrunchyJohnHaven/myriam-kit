# MYRIAM-kit Protocol Specification

*Ntụgharị Igbo — maka mbipụta Bekee mbụ, lee [SPEC.md](SPEC.md)*

## 0. Ebumnobi

Akwụkwọ a na-akọwapụta usoro pere mpe maka ibipụta obere ihe eziokwu ederede
n'ụdị nke a na-achọpụta mmebi, nke a pụrụ ịkwado site na cryptography, nke
na-adịgide mgbe a kwụsịrị onye ọ bụla na-eweta ngalaba.

Ọ bụ nkpọsa nke usoro a buru ụzọ tinye n'ọrụ na [disclosure.host](https://disclosure.host)
n'okpuru aha "MYRIAM v1."

## 1. Ihe ndị ọ na-abụghị ebumnobi

- Nchekwa ihe nzuzo. Ihe niile bụ ihe ọha site n'ọkpụrụkpụ.
- Nnukwu dataset. Karịa eziokwu 20, usoro ahụ abụghị ụdị ziri ezi.
- Mbipụta n'oge ezigbo. Mbipụta ọ bụla bụ otu ihe omume mkpọchi pụrụ iche.
- Nweghachi. Usoro ahụ bụ nke a ga-agbakwunye naanị na ọkwa ụdị.

## 2. Ụdị eziokwu

EZIOKWU bụ faịlụ ederede UTF-8 nwere:

- Usoro aha faịlụ: `NN_short_name.txt` ebe NN bụ ndeksi mkpụrụokwu abụọ
  jupụtara na efu na-amalite na 01.
- Ụdị canonical: bytes dị ka e dere ya, enweghị mgbazi.
- Hash kwa-eziokwu: hex obere mkpụrụokwu nke `SHA-256(file_bytes)`.

SETỊ eziokwu ahụ bụ ndepụta ahaziri ahazi nke faịlụ niile na-adakọrịta usoro
ahụ n'okpuru `facts/`, ahaziri n'usoro mkpụrụ-okwu.

Mmachi: ahụ eziokwu ọ bụla SHOULD bụrụ nke a ga-akọwa dị ka *ihe omume ịkpọ aha*
ma ọ bụ *ihe omume nkwupụta* nke a ga-ekwu na ọ bụ nke otu onye. Nkwupụta
ontological ("ọnwa bụ nkume") na-emebi ọnụ ụzọ nkwado; naanị ihe omume
mbipụta ka a pụrụ ịkwado, ọ bụghị nkwupụta ahụ. "X ekwuola Y" bụ ụdị
kwesịrị ekwesị. "Y bụ eziokwu" abụghị.

## 3. Mgbọrọgwụ Merkle

Ụdị Bitcoin, dị ka ọ dị na v0 nke usoro MYRIAM e bukwasịrị:

1. Akwụkwọ: hash SHA-256 kwa-eziokwu n'usoro setị eziokwu.
2. Ọ bụrụ na ọkwa nwere ọnụọgụgụ ọnụ nke odd, megharịa ọnụ ikpeazụ.
3. Hash ụzọ abụọ ndị ọnụ dị nso: `parent = SHA-256(left_bytes || right_bytes)`,
   ebe `left_bytes` na `right_bytes` bụ ụkpụrụ hash 32-byte na-adịghị mma
   (ọ bụghị nnọchianya hex ha).
4. Megharịa ruo mgbe naanị otu ọnụ fọdụrụ. Nke ahụ bụ mgbọrọgwụ Merkle.

A na-ebipụta mgbọrọgwụ ahụ dị ka hex obere mkpụrụokwu na-enweghị newline
n'azụ.

### 3.1 Akara ule

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Mmejuputa ọ bụla dakọrọ MUST megharịa akara ndị a. E si na ezigbo
`lib/build.py` nweta ha, e nwekwara ike imegharị ha site na script ahụ.

## 4. Nkwado Bitcoin

A na-etinye mgbọrọgwụ Merkle ahụ na blọkchain Bitcoin site na
[OpenTimestamps](https://opentimestamps.org). Iwu ndabara bụ:

> Tinye akara megide opekata mpe ndị na-arụ kalenda abụọ n'okpuru njikwa
> nchịkwa na-emeghị onwe ya.

Akwụkwọ nnata na-emezu iwu a bụ nke onye ọ bụla nwere ike igba `ots verify
<receipt>.ots` ma ruo otu n'ime ụzọ mbuli kalenda ahụ.

Ụzọ ndị na-arụ ọrụ ndabara e bunyere na `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Mmejuputa MAY iji ndị na-arụ ọrụ dị iche. Iwu ngosi-iche-iche akaebe (≥2
ndị na-arụ ọrụ na-emeghị onwe ya) bụ normative; ndị na-arụ ọrụ kpọmkwem
abụghị.

## 5. Nnyocha a na-eduzi site n'ọdịnaya

Ndekọ aha `site/` nke nwere ibe a bipụtara na faịlụ eziokwu SHOULD
abụ nke a tinyere na IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

CIDv1 (codec dag-pb) a wepụtara bụ adreesị ọdịnaya nke mbipụta ahụ.
Ọ bụ ihe a kara aka site n'ọdịnaya byte nke `site/`. Mgbanwe ọ bụla na
faịlụ ọ bụla n'okpuru `site/` na-emepụta CID dị iche.

A na-akwado nke ukwuu ka a mara ya na ọrụ ndị ọzọ karịa node mpaghara nke
onye na-ebipụta maka nnọgide; nkọwapụta a anaghị ekwenye na ọrụ ndị akọwapụtara.

## 6. Ọkwa ụdị

Usoro ahụ bụ **nke a ga-agbakwunye naanị na ọkwa ụdị**. Mgbanwe ọ bụla
na-achọ ụdị ọhụrụ a kpọchiri akpọchi:

- Ndezigharị nkọwapụta ọhụrụ (ma ọ bụ nke agbanwebeghị)
- Setị eziokwu ọhụrụ, nke MAY ketara eziokwu ndị agbanweghị site na ụdị mbụ
- Mgbọrọgwụ Merkle ọhụrụ
- Akwụkwọ nnata OpenTimestamps ọhụrụ
- CID IPFS ọhụrụ

Ụdị mbụ niile na-anọgide na-ebipụta na URL nwere ụdị. Mgbanwe ọ bụla na
eziokwu v(N) na-achọ v(N+1), na ụdị abụọ ahụ niile na-ahụ anya na nke a
ga-akwadoghachi.

## 7. Nkwado

Onye nke atọ ọ bụla nwere ike ịkwado izu okè nke mbipụta site na:

1. Ibudata faịlụ eziokwu ma gbakọọzie hash SHA-256 kwa-eziokwu.
2. Igbakọzie mgbọrọgwụ Merkle dị ka §3 ma tụnyere ya na mgbọrọgwụ e
   bipụtara.
3. Ịkwado akwụkwọ nnata OpenTimestamps megide blọkchain Bitcoin maka
   opekata mpe akwụkwọ ọtụtụ zuru oke nke otu kalenda.
4. Igbakọzie CID IPFS n'onwe ya site na `ipfs add -r --cid-version=1` ma
   tụnyere ya na CID e bipụtara.

`lib/verify.py` na-arụ nzọụkwụ 1-3 na-enweghị ndabere mpụga ọ bụla karịa
stdlib Python na onye ahịa `ots`. Nzọụkwụ 4 na-achọ onye ahịa `ipfs`.

## 8. Ọnụ ụzọ nzọrọ

Mbipụta MUST NOT gụnye eziokwu nke:

- Na-akọwapụta onye nke atọ nzuzo nke na-ekwetabeghị na a ga-akpọ aha ya.
- Na-egosipụta echiche dị ka nkwenye.
- Enweghị ike ibelata ya gaa n'ihe omume ịkpọ aha/nkwupụta a pụrụ ịkwado
  ma ọ bụ ihe arịa cryptographic.
- Nwere mmụba ezi uche dị na ya a tụrụ anya ya nke ọnwụ ndị a pụrụ
  igbochi mgbe e bipụtara ya.

Iwu nke anọ ahụ bụ nke ibu. A na-etinye ya n'ọrụ na nzọụkwụ nyocha mmadụ
site n'aka onye na-ebipụta. Enweghị nkwado n'ọkwa usoro nke ọnụ ụzọ
nzọrọ; usoro ahụ na-ebipụta bytes ọ bụla e nyere ya. Onye na-ebipụta na-
azaghachi maka ọnụ ụzọ ahụ.

## 9. Nkwupụta ezi obi nke oke

- **Nchọpụta, ọ bụghị enweghị ike.** Usoro ahụ na-eme ka mmebi bụrụ nke a
  pụrụ ịchọpụta, ọ bụghị nke na-enweghị ike ime. Onye ọtụ siri ike ka
  nwere ike ịdochi mbipụta dị iche ma mee ka ụfọdụ ndị na-agụ ya kwere na
  ọ bụ nke mbụ. Uru nke usoro ahụ bụ na nnọchi anya ahụ na-aghọ nke a
  pụrụ igosi site na cryptography nye onye ọ bụla na-agba nyocha ahụ.
- **Enweghị nchebe megide ibipụta ụgha.** Ọ bụrụ na onye na-ebipụta
  kpọchie eziokwu na-ekwu "X mere" ma X emeghị, usoro ahụ na-akpọchi
  nkwupụta ụgha ahụ jiri otu ikwesị ntụkwasị obi ọ na-akpọchi ndị eziokwu.
  Usoro ahụ na-agba akaebe banyere ihe e *bipụtara*, ọ bụghị banyere ihe
  bụ *eziokwu*.
- **Mbinye aka nke otu ndị otu.** v1 nke MYRIAM e bukwasịrị na-eji otu
  onye isi mbinye aka. Mbinye aka nke ọtụtụ ndị otu bụ ọrụ ọdịnihu.
- **Nnọgide nke ịmara aha.** Ịmara aha IPFS na naanị node nke onye na-
  ebipụta na-enye "ọ dị mgbe laptọọpụ m kwụ ọtọ + nchekwa ụzọ mbata
  enwere ohere." Nnọgide ogologo oge na-achọ aha ndị emebere nke ọzọ
  n'ofe ọrụ ndị na-emeghị onwe ha.

A na-ekwu oke ndị a ebe a ka onye na-agụ ọ bụla wee ghara iche na usoro
ahụ na-eweta karịa ihe ọ na-eweta.
