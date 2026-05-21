*Salin sa Filipino — para sa orihinal na bersyong Ingles, tingnan ang [SPEC.md](SPEC.md)*

# Espesipikasyon ng Protocol ng MYRIAM-kit

## 0. Layunin

Ang dokumentong ito ay nagtatakda ng pinakamaliit na protocol para sa
paglalathala ng kaunting hanay ng mga text na katotohanan sa isang anyo
na tamper-evident, cryptographically verifiable, at nakaliligtas sa
pag-aalis ng alinmang nag-iisang hosting provider.

Ito ang generalization ng protocol na unang ipinatupad sa
[disclosure.host](https://disclosure.host) sa ilalim ng pangalang
"MYRIAM v1."

## 1. Hindi mga layunin

- Pag-iimbak ng mga lihim. Lahat ay pampubliko sa pamamagitan ng konstruksiyon.
- Malalaking dataset. Lagpas ~20 katotohanan, mali na ang hugis ng protocol.
- Real-time na paglalathala. Ang bawat publikasyon ay isang diskretong
  sealing event.
- Pagbawi. Ang protocol ay append-only sa antas ng bersyon.

## 2. Modelo ng katotohanan

Ang FACT ay isang UTF-8 text file na may:

- Pattern ng pangalan ng file: `NN_short_name.txt` kung saan ang NN ay
  zero-padded na dalawang-digit na index na nagsisimula sa 01.
- Kanonikal na anyo: bytes na nakasulat, walang normalization.
- Per-fact hash: lowercase hex ng `SHA-256(file_bytes)`.

Ang fact SET ay ang ordered list ng lahat ng files na tumutugma sa
pattern sa ilalim ng `facts/`, na inayos nang leksikograpiko.

Konstreyint: ang bawat fact body ay DAPAT bigkasin bilang isang *naming
event* o *declaration event* na maaring iugnay sa isang partikular na
partido. Ang mga ontolohikal na pagtatangka ("ang buwan ay bato") ay
nagpapahina sa verifiability gate; ang publication event lamang ang
maaaring beberipikahin, hindi ang pagtatangka. "Nagsabi ang X na Y" ang
tamang anyo. "Y ay totoo" ay hindi.

## 3. Merkle root

Bitcoin-style, gaya ng nasa v0 ng na-deploy na MYRIAM protocol:

1. Mga dahon: per-fact SHA-256 hashes ayon sa pagkakasunod-sunod ng fact set.
2. Kung may isang level na may odd na bilang ng mga node, i-duplicate ang
   huling node.
3. Pair-hash ang mga kalapit na node:
   `parent = SHA-256(left_bytes || right_bytes)`, kung saan ang
   `left_bytes` at `right_bytes` ay ang raw 32-byte na hash values
   (hindi ang kanilang hex representation).
4. Ulitin hanggang matira ang isang node. Iyon ang Merkle root.

Ang root ay inilalathala bilang lowercase hex na walang trailing newline.

### 3.1 Mga test vector

| Vector | Mga dahon (UTF-8 bytes na hina-hash) | Inaasahang root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Anumang sumusunod na implementasyon ay DAPAT na muling makagawa ng mga
vector na ito. Galing sila sa aktwal na `lib/build.py` at maaaring
muling generahin gamit ang script na iyon.

## 4. Bitcoin commitment

Ang Merkle root ay ina-commit sa Bitcoin blockchain sa pamamagitan ng
[OpenTimestamps](https://opentimestamps.org). Ang default na patakaran:

> Mag-stamp laban sa hindi bababa sa dalawang calendar operator sa
> ilalim ng independiyenteng kontrol ng administrasyon.

Ang receipt na nakakatugon sa patakarang ito ay maaring beberipikahin ng
sinumang makakapagpatakbo ng `ots verify <receipt>.ots` at maa-abot ang
upgrade path ng alinmang kalendaryo.

Ang default na pares ng operator na isinama sa `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

PWEDENG gumamit ng ibang operator ang mga implementasyon. Ang patakaran
ng witness-diversity (≥2 independiyenteng operator) ay normatibo; ang
mga partikular na operator ay hindi.

## 5. Content-addressed na mirroring

Ang `site/` directory na naglalaman ng inilathalang pahina at ang mga
fact files ay DAPAT idagdag sa IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

Ang resultang CIDv1 (dag-pb codec) ang content address ng publikasyon.
Deterministiko ito mula sa byte content ng `site/`. Anumang modipikasyon
sa alinmang file sa loob ng `site/` ay magbubunga ng ibang CID.

Ang pag-pin sa karagdagang mga serbisyo bukod pa sa lokal na node ng
publisher ay matinding inirerekomenda para sa katatagan; hindi
ipinapaalam ng espesipikasyong ito ang mga partikular na serbisyo.

## 6. Bersyon

Ang protocol ay **append-only sa antas ng bersyon**. Ang bawat
pagbabago ay nangangailangan ng isang bagong selyadong bersyon:

- Isang bagong (o hindi nabagong) rebisyon ng espesipikasyon
- Isang bagong fact set, na MAARING magmana ng mga hindi nabagong
  katotohanan mula sa nakaraang mga bersyon
- Isang bagong Merkle root
- Isang bagong OpenTimestamps receipt
- Isang bagong IPFS CID

Lahat ng nakaraang bersyon ay nananatiling inilathala sa mga
naka-bersyong URL. Ang pagbabago sa alinmang v(N) fact ay nangangailangan
ng v(N+1), na ang parehong bersyon ay nakikita at muling beberipikahin.

## 7. Pag-verify

Ang sinumang third party ay maaaring mag-verify ng integridad ng
publikasyon sa pamamagitan ng:

1. Pag-download ng mga fact files at muling pag-compute ng mga per-fact
   SHA-256 hashes.
2. Muling pag-compute ng Merkle root ayon sa §3 at paghahambing sa
   inilathalang root.
3. Pag-verify ng OpenTimestamps receipt laban sa Bitcoin blockchain para
   sa hindi bababa sa isang buong attestation ng isang kalendaryo.
4. Independiyenteng muling pag-compute ng IPFS CID sa pamamagitan ng
   `ipfs add -r --cid-version=1` at paghahambing sa inilathalang CID.

Ang `lib/verify.py` ay nagsasagawa ng mga hakbang 1–3 nang walang
panlabas na dependency maliban sa Python stdlib at ang `ots` client.
Ang hakbang 4 ay nangangailangan ng `ipfs` client.

## 8. Refusal gate

Ang publikasyon ay HINDI dapat magsama ng katotohanan na:

- Tumutukoy sa pribadong third party na hindi pumayag na pangalanan.
- Nagpapakita ng hipotesis bilang kumpirmasyon.
- Hindi maaaring bawasan sa isang verifiable na naming/declaration
  event o cryptographic artifact.
- May makatuwirang inaasahang pagtaas sa mga maiiwasang kamatayan kapag
  inilathala.

Ang ikaapat na alituntunin ang pinaka-mabigat. Ipinatutupad ito sa
hakbang ng pagsusuri ng tao ng publisher. Walang pagpapatupad sa antas
ng protocol ng refusal gate; inilalathala ng protocol kung anumang bytes
ang ibibigay dito. Ang publisher ang may pananagutan sa gate.

## 9. Tapat na pahayag ng mga limitasyon

- **Pagiging matutukoy, hindi imposibilidad.** Ginagawang matutukoy ng
  protocol ang tampering, hindi imposible. Ang isang determinadong
  attacker ay maaari pa ring magpalit ng ibang publikasyon at
  hikayatin ang ilang mambabasa na ito ang orihinal. Ang halaga ng
  protocol ay na ang pagpapalit ay nagiging cryptographically
  demonstrable sa sinumang nagpapatakbo ng check.
- **Walang depensa laban sa paglalathala ng kasinungalingan.** Kung ang
  publisher ay nag-seal ng isang katotohanang nagsasaad ng "nangyari
  ang X" at hindi nangyari ang X, ang protocol ay nagse-seal ng maling
  paratang na may parehong katapatan na ginagamit nito sa pag-seal ng
  totoo. Ang protocol ay nag-aatesta sa kung ano ang *inilathala*,
  hindi sa kung ano ang *totoo*.
- **Pag-sign ng isang partido.** Ang v1 ng na-deploy na MYRIAM ay
  gumagamit ng iisang signing principal. Ang multi-party signing ay
  hinaharap na gawain.
- **Katatagan ng pinning.** Ang pag-pin sa IPFS sa node lamang ng
  publisher ay nagbibigay ng "available habang nakabukas ang laptop ko
  + oportunistikong gateway caching." Ang pangmatagalang katatagan ay
  nangangailangan ng redundant na pins sa iba't ibang independiyenteng
  serbisyo.

Ang mga limitasyong ito ay ipinapahayag dito upang walang mambabasa na
mag-akala na ang protocol ay nagbibigay ng higit pa sa kayang ibigay.
