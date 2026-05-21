*Salin sa Filipino — para sa orihinal na bersyong Ingles, tingnan ang [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#mga-halimbawang-naipatupad)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Isang maliit na toolkit para sa paglalathala ng kaunting hanay ng mga katotohanan sa paraang:

- Anumang pagbabago sa alinmang katotohanan ay matutukoy ng publiko (Merkle tree)
- Ang estado sa oras ng paglalathala ay mababalida laban sa Bitcoin blockchain (OpenTimestamps)
- Ang nilalaman ay nakaliligtas sa pag-aalis ng alinmang hosting provider (IPFS)
- Ang kabuuan ay mas mababa sa 100 KB at mababalida sa humigit-kumulang 50 linya ng Python

Hindi ito blockchain. Walang token. Walang mekanismo ng konsensus na sasalihan. Walang DAO. Ang kasangkapan ay `sha256sum` + `ots` + `ipfs`, na pinagdugtong sa pamamagitan ng mahusay na mga kombensiyon sa pagpapangalan.

Pinangalanan ito alinsunod sa MYRIAM protocol na unang ipinatupad sa [disclosure.host](https://disclosure.host) noong 2026-05-21. Ang pahinang iyon ay naglalaman ng anim na katotohanan, isang Merkle root, at isang Bitcoin attestation. Ang kit na ito ay ang pangkalahatang anyo ng pattern na iyon.

## Katayuan

- v0: gumagana sa macOS na may Python 3.10+, Homebrew, at koneksyon sa internet. Hindi pa nasusubukan sa Linux ngunit dapat na gumana. Windows: magdala ng WSL.
- Pampublikong domain (CC0). Gamitin, i-fork, ilagay sa inyong repo, huwag nang magbigay ng credit. Ang punto ay hindi ang credit.

## Ano ang magagawa ninyo dito

Ang pattern ay angkop sa kahit saan na kailangang maging:

- **Mailalathala** sa malawak na madla sa pamamagitan ng simpleng HTTP
- **Matagalan** — ang mga mambabasa sa loob ng 30 taon ay dapat pa ring makapag-verify
- **Nakikita kapag nabago** — anumang pagbabago ay dapat matukoy, hindi naman kinakailangang mapigilan
- **Walang pinagkakatiwalaan** — walang mambabasa na kailangang magtiwala sa naglalathala (basta't sa matematika lamang)

Mga kongkretong gamit sa [docs/USE_CASES.md](docs/USE_CASES.md). Ang maikling listahan:

| Larangan | Mga selyadong katotohanan |
|---|---|
| Pampublikong kalusugan | Mga resulta ng pagsubok sa batch ng bakuna, mga milestone ng drug-trial |
| Halalan | Mga kabuuan ng tally sa antas ng presinto sa sandali ng sertipikasyon |
| Kaligtasan ng AI | Hash ng model weights + model card + mga eval score sa paglabas |
| Pamamahayag | Manifest ng mga pinagmulang dokumento (mga hash lamang) para sa whistleblower drops |
| Agham | Hash ng raw data + hash ng analysis script + sinasabing resulta |
| Hukuman | Mga hash ng digital exhibit sa sandali ng pagkuha |
| Pagkuha ng kontrata | Mga selyadong root ng datos ng paggastos ng publiko |

Ang pinagkakatulad ng mga ito: isang maliit na hanay ng mga katotohanan, isang matinding pangangailangan sa katibayan, maraming partido na hindi nagtitiwala sa isa't isa, at isang munting badyet sa storage. Iyon ang eksaktong hugis kung saan ginawa ang tool na ito.

## Ano ang HINDI nito ginagawa

- **Mag-imbak ng mga lihim.** Lahat ng ilalagay ninyo sa `facts/` ay pampubliko. Ang protocol ay para sa paglalathala, hindi sa pagtatago.
- **I-scale sa malalaking dataset.** Ang Merkle tree ay maayos na nag-iiskala; ang atensyon ng mambabasa ay hindi. Lagpas sa humigit-kumulang 20 katotohanan, hindi na mababasa ang pahina. Kung gusto ninyong i-seal ang isang milyong record, i-hash ang mga ito sa labas ng pahina at ilagay ang Merkle root ng side-tree na iyon sa isang katotohanan.
- **Magtanggol laban sa pagbawi.** Ang buong punto ay hindi ninyo mababago ang naselyahan ninyo. Kung maaaring gustuhin ninyong bawiin ang isang claim mamaya, huwag itong i-seal.
- **Manghikayat ng determinadong skeptiko.** Ang determinadong skeptiko ay hindi magpapatakbo ng `ipfs add -r --cid-version=1 -Q facts/`. Sa halip, paratangan nila kayong nag-imbento ng kabuuang setup. Walang depensa sa antas ng protocol laban sa pangalawang failure mode. Walang depensa sa antas ng protocol laban sa anumang nakatira sa motibasyon ng tao sa halip na sa matematika.

## Paano ito gamitin

Limang-minutong gabay sa [docs/QUICKSTART.md](docs/QUICKSTART.md).
Buong spec ng protocol sa [docs/SPEC.md](docs/SPEC.md).
Modelo ng banta sa [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Paghahambing sa mga kalapit na sistema (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave, atbp.) sa [docs/COMPARISON.md](docs/COMPARISON.md).

## Paano i-verify ang publikasyon ng iba

Tatlong opsyon, ayon sa pagkakasunod ng accessibility:

1. **Browser**: buksan ang [`lib/verify.html`](lib/verify.html) sa anumang makabagong browser. I-paste ang URL ng publikasyon. I-click ang verify. Gumagamit ng `crypto.subtle` para sa hashing — walang install, walang backend, walang telemetry. Ang hakbang ng Bitcoin attestation ay kailangan pa rin ng CLI tool (tingnan ang hakbang 7 sa pahina ng verifier).
2. **Python**: `python3 lib/verify.py` mula sa loob ng directory ng publikasyon. Stdlib lamang; nangangailangan ng `ots` para sa Bitcoin verification.
3. **Mula sa simula**: basahin ang [`docs/SPEC.md §3`](docs/SPEC.md) at muling ipatupad. Ang Merkle algorithm ay mas mababa sa 30 linya sa anumang wika.

## Mga halimbawang naipatupad

Anim na production-grade na halimbawang kit ang kasama sa toolkit. Bawat isa ay naselyahan, may OTS-stamp, naka-pin sa IPFS, at may kasamang adoption README na nagpapaliwanag kung kailan ito i-fork para sa isang totoong sitwasyon at kung anong mga failure mode ang ipinagtatanggol nito.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  para sa failure mode na tulad ng Boeing 737 MAX / Theranos / FDA-inspector-report kung saan ang ebidensya ay inililibing o binabago ng mga tagapamagitan.
- [`examples/ai-model-card/`](examples/ai-model-card/) — para sa mga AI lab na naglalabas ng mga modelo, na may mga pre-deployment commitment na nagiging mekanikal na natutukoy sa halip na pasalita.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  para sa mga sponsor ng clinical trial, na sumasalo sa post-hoc endpoint switching at selective reporting (mga failure mode ng Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  para sa mga manufacturer ng bakuna at QA authorities, na nag-aangkla sa mga resulta ng release test at mga commitment sa recall.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  para sa mga grupo ng mananaliksik, na nag-aangkla sa triple ng (data, pipeline, inaasahang output) BAGO ang analysis upang gawing pampublikong natutukoy ang p-hacking at HARKing.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  para sa mga county board of canvassers at election authorities, na nag-aangkla sa mga sertipikadong tally sa sandali ng sertipikasyon upang ang mga tahimik na pagrerebisa pagkatapos ng sertipikasyon ay maging pampublikong natutukoy.

Basahin ang isa sa mga ito bago kayo magsulat ng inyong sariling kit. Ang pinakamalapit na tumutugma sa inyong use case ay karaniwang ang tamang panimulang fork.

## Mabilisang pagsisimula

Ang isang-linyang bersyon:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# i-edit ang facts/*.txt para sabihin kung ano talaga ang gusto ninyong i-seal
./lib/seal.sh        # bubuo ng Merkle root, mag-istamp ng OTS, mag-pin sa IPFS
./lib/verify.sh      # muling beberipikahin ang lahat nang lokal
# i-upload ang site/ sa anumang static host. Kahit saan. Walang pinagkaiba.
```

## Bakit umiiral ito

Ang mga primitive na cryptographic (Merkle trees, OpenTimestamps, IPFS) ay matagal nang mature. Ang nawawala ay ang pinakamaliit na posibleng pandugtong — isang kit na maaari ninyong ihulog sa isang side project at magkaroon ng selyadong artifact na mailalathala sa loob ng isang hapon, nang hindi nagse-set up ng infrastructure, nang hindi natututo ng mga protocol, nang hindi nagsusulat ng kahit isang linya ng code maliban sa mga katotohanan mismo.

Karamihan sa mga cryptographic publishing tool ay nag-aakalang gusto ninyong maging node operator. Ito ay nag-aakalang gusto lamang ninyong maglathala ng anim na text file at hindi na isipin ang cryptography muli.

## Mga impluwensya at naunang gawa

- [Sigsum](https://www.sigsum.org/) — transparency logs para sa mga signature
- [Sigstore](https://www.sigstore.dev/) — integridad ng software-supply-chain
- [Certificate Transparency](https://certificate.transparency.dev/) — mga log ng TLS cert
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin timestamping
- [IPFS](https://ipfs.tech/) — content-addressed storage
- [Ang CALM protocol](https://disclosure.host) — ang principal-protective publishing frame kung saan isinulat ang unang instance (MYRIAM sa disclosure.host)

Ang myriam-kit ang pinakamaliit sa mga ito. Mas malapit ito sa diwa ng isang Unix pipeline kaysa sa isang sistema.

## Isang tala tungkol sa pangalan

Ang MYRIAM protocol ay pinangalanan sa Myriam Proof ni John Bradley, isang sinabing logical proof tungkol sa unang punto ng kontak para sa di-makataong intelihensya. Ang protocol ay hindi nakadepende sa katotohanan ng patunay na iyon. Gumagana ang protocol para sa anumang maliit na hanay ng mga katotohanan; nagkataon lamang na unang ginamit ito upang maglathala ng anim na katotohanan na kinabibilangan ng isang claim tungkol sa alien disclosure.

Kung iyong i-fork ang kit na ito para selyahan ang mga batch ng bakuna o mga tally ng halalan, walang kinalaman sa inyo ang katotohanang orihinal itong ginamit para maglathala ng claim tungkol sa kontak ng alien. Hindi ito pinapansin ng matematika.

Gayunpaman: kung GAGAMITIN ninyo ito para maglathala ng claim tungkol sa kontak ng alien, ang protocol ay nasubukan na sa partikular na arena na iyon. Ang README ng unang MYRIAM deployment ay tahasang sinasabi na ito ay artistikong gawa ng isang LLM persona na nagngangalang Calm, hindi isang komunikasyon mula sa anumang extraterrestrial party. Marahil ay dapat din ninyong gawin ang katulad. Sa kabilang banda, palagay ng mga mambabasa ang pinakamasama tungkol sa inyong kalagayang pangkaisipan.

## Pinananatili ng

Wala pa. Pampublikong domain. I-fork. Pahusayin. Dalhin pasulong ang protocol nang hindi humihingi ng pahintulot.
