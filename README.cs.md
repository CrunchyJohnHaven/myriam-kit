*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Malá sada nástrojů pro zveřejňování drobné množiny faktů tak, aby:

- Jakákoli změna kteréhokoli faktu byla veřejně zjistitelná (Merkleho strom)
- Stav v okamžiku zveřejnění byl ověřitelný proti blockchainu Bitcoin (OpenTimestamps)
- Obsah přežil odstranění jakéhokoli jednotlivého poskytovatele hostingu (IPFS)
- Celek vážil méně než 100 KB a byl ověřitelný pomocí ~50 řádků jazyka Python

Toto není blockchain. Není zde žádný token. Není zde žádný konsenzuální mechanismus,
kterého by bylo možné se účastnit. Není zde žádná DAO. Nástrojem je `sha256sum` + `ots` + `ipfs`,
spojené dohromady dobrými konvencemi pojmenování.

Je pojmenován podle protokolu MYRIAM, který byl poprvé instancován na adrese
[disclosure.host](https://disclosure.host) dne 2026-05-21. Tato stránka obsahuje
šest faktů, kořen Merkleho stromu a osvědčení Bitcoinu. Tato sada je
zobecněním tohoto vzoru.

## Stav

- v0: funguje na macOS s Python 3.10+, Homebrew a internetovým
  připojením. Linux netestován, ale měl by fungovat. Windows: přineste si WSL.
- Veřejná doména (CC0). Použijte to, forkněte, vložte do svého repozitáře, nikdy
  to neuvádějte jako zásluhu. Smyslem nejsou zásluhy.

## Dostupné jazyky

Toto README a několik ukázkových sad je k dispozici v 17 jazycích.
Úplný rejstřík v [TRANSLATIONS.md](TRANSLATIONS.md).

[العربية](README.ar.md) · [বাংলা](README.bn.md) · [Deutsch](README.de.md) ·
[Español](README.es.md) · [Français](README.fr.md) · [हिन्दी](README.hi.md) ·
[Bahasa Indonesia](README.id.md) · [Italiano](README.it.md) ·
[日本語](README.ja.md) · [한국어](README.ko.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Русский](README.ru.md) ·
[Kiswahili](README.sw.md) · [Türkçe](README.tr.md) ·
[Tiếng Việt](README.vi.md) · [中文](README.zh.md)

Překlady jsou pod licencí CC0 a mohou být vylepšovány komunitními PR.

## K čemu to lze použít

Vzor se hodí všude tam, kde malá množina faktů potřebuje být:

- **Zveřejnitelná** širokému publiku přes prostý HTTP
- **Trvanlivá** — čtenáři za 30 let by ji stále měli být schopni ověřit
- **Odolná proti manipulaci** — jakákoli změna musí být zjistitelná, nikoli nutně preventovatelná
- **Bez nutnosti důvěry** — žádný čtenář nemusí důvěřovat vydavateli (pouze matematice)

Konkrétní případy užití v [docs/USE_CASES.md](docs/USE_CASES.md). Krátký seznam:

| Doména | Zapečetěné fakty |
|---|---|
| Veřejné zdraví | Výsledky testů šarží vakcín, milníky klinických studií léků |
| Volby | Součty hlasů na úrovni okrsku v okamžiku certifikace |
| Bezpečnost AI | Hash vah modelu + karta modelu + skóre evaluací při vydání |
| Žurnalistika | Manifest zdrojových dokumentů (pouze hashe) pro úniky informátorů |
| Věda | Hash surových dat + hash analytického skriptu + tvrzený výsledek |
| Soudy | Hashe digitálních důkazů v okamžiku získání |
| Veřejné zakázky | Zapečetěné kořeny dat o veřejných výdajích |

Co mají tyto případy společné: malou množinu faktů, silný požadavek na trvanlivost,
více stran, které si vzájemně nedůvěřují, a drobný rozpočet úložiště.
Přesně pro tento tvar je nástroj postaven.

## Co tento nástroj NEDĚLÁ

- **Neukládá tajemství.** Vše, co vložíte do `facts/`, je veřejné. Protokol je
  pro zveřejňování, nikoli pro skrývání.
- **Neškáluje na velké datové sady.** Merkleho strom škáluje dobře; pozornost
  čtenáře nikoli. Po ~20 faktech se stránka stává nečitelnou. Pokud
  chcete zapečetit milion záznamů, hashujte je mimo stránku a vložte
  kořen Merkleho stromu tohoto vedlejšího stromu do jednoho faktu.
- **Nebrání proti odvolání.** Celý smysl spočívá v tom, že nemůžete změnit,
  co jste zapečetili. Pokud byste mohli chtít později nějaké tvrzení odvolat,
  nepečeťte ho.
- **Nepřesvědčí zarytého skeptika.** Zarytý skeptik nepoběží
  `ipfs add -r --cid-version=1 -Q facts/`. Bude vás však obviňovat
  z toho, že jste celé nastavení vyfabrikovali. Na úrovni protokolu neexistuje
  obrana proti druhému módu selhání. Na úrovni protokolu neexistuje obrana
  proti čemukoli, co spočívá v lidské motivaci spíše než v matematice.

## Jak to používat

Pětiminutový průvodce v [docs/QUICKSTART.md](docs/QUICKSTART.md).
Úplná specifikace protokolu v [docs/SPEC.md](docs/SPEC.md).
Hrozební model v [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Srovnání s příbuznými systémy (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave atd.) v [docs/COMPARISON.md](docs/COMPARISON.md).

## Jak ověřit cizí publikaci

Tři možnosti, v pořadí podle dostupnosti:

1. **Prohlížeč**: otevřete [`lib/verify.html`](lib/verify.html) v jakémkoli moderním
   prohlížeči. Vložte URL publikace. Klikněte na ověřit. Používá
   `crypto.subtle` pro hashování — žádná instalace, žádný backend, žádná telemetrie.
   Krok osvědčení Bitcoinu stále vyžaduje nástroj CLI (viz krok 7 na
   stránce ověřovače).
2. **Python**: `python3 lib/verify.py` z adresáře publikace.
   Pouze standardní knihovna; pro ověření Bitcoinu je vyžadován `ots`.
3. **Od základů**: přečtěte si [`docs/SPEC.md §3`](docs/SPEC.md) a
   znovu implementujte. Algoritmus Merkle je v jakémkoli jazyce kratší než 30 řádků.

## Vypracované příklady

S touto sadou nástrojů je dodáváno šest příkladových sad v produkční kvalitě. Každá je
zapečetěná, opatřená razítkem OTS, připnutá v IPFS a obsahuje README pro adopci
vysvětlující, kdy ji forknout pro reálný případ a proti jakým módům selhání
chrání.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  pro mód selhání typu Boeing 737 MAX / Theranos / zpráva inspektora FDA,
  kdy se důkazy zaprašují nebo upravují zprostředkovateli.
- [`examples/ai-model-card/`](examples/ai-model-card/) — pro laboratoře AI
  vydávající modely, kde se předdistribuční závazky stávají
  mechanicky detekovatelnými místo verbálních.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  pro sponzory klinických studií, zachycující dodatečnou změnu cílových
  parametrů a selektivní reporting (módy selhání Vioxx, Paxil studie 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  pro výrobce vakcín a orgány zajištění kvality, kotvící výsledky
  uvolňovacích testů a závazky stahování z trhu.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  pro výzkumné skupiny, kotvící trojici (data, pipeline, očekávaný
  výstup) PŘED analýzou, aby se p-hacking a HARKing staly
  veřejně zjistitelnými.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  pro okresní volební komise a volební orgány, kotvící
  certifikované součty v okamžiku certifikace, aby se tiché
  postcertifikační revize staly veřejně zjistitelnými.

Před napsáním vlastní si přečtěte jeden z těchto příkladů. Nejbližší shoda s vaším
případem užití je obvykle správným výchozím forkem.

## Rychlý start

Jednořádková verze:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# upravte facts/*.txt, aby říkaly to, co skutečně chcete zapečetit
./lib/seal.sh        # sestaví kořen Merkle, orazítkuje OTS, připne IPFS
./lib/verify.sh      # lokálně vše znovu ověří
# nahrajte site/ na jakýkoli statický hosting. Kamkoli. Nezáleží na tom.
```

## Proč to existuje

Kryptografické primitivy (Merkleho stromy, OpenTimestamps, IPFS) jsou
zralé už léta. Co chybělo, bylo co nejmenší lepidlo —
sada, kterou byste mohli vložit do vedlejšího projektu a mít zapečetěný
publikovatelný artefakt za odpoledne, bez nastavování infrastruktury,
bez učení protokolů, bez napsání jediného řádku kódu nad rámec
samotných faktů.

Většina nástrojů pro kryptografické publikování předpokládá, že chcete být
provozovatelem uzlu. Tento předpokládá, že chcete publikovat šest textových
souborů a už nikdy nepřemýšlet o kryptografii.

## Vlivy a předchozí práce

- [Sigsum](https://www.sigsum.org/) — logy průhlednosti pro podpisy
- [Sigstore](https://www.sigstore.dev/) — integrita softwarového dodavatelského řetězce
- [Certificate Transparency](https://certificate.transparency.dev/) — logy certifikátů TLS
- [OpenTimestamps](https://opentimestamps.org/) — časové razítkování přes Bitcoin
- [IPFS](https://ipfs.tech/) — úložiště adresované obsahem
- [Protokol CALM](https://disclosure.host) — princip-protektivní
  publikační rámec, v němž byla autorizována první instance
  (MYRIAM na disclosure.host)

myriam-kit je nejmenší z nich. Duchem je blíže unixovému
pipelinu než systému.

## Poznámka k názvu

Protokol MYRIAM byl pojmenován podle Myriam Proof Johna Bradleyho, vysloveného
logického důkazu týkajícího se prvního bodu kontaktu s nelidskou
inteligencí. Protokol nezávisí na tom, zda je tento důkaz pravdivý. Protokol
funguje pro jakoukoli malou množinu faktů; jen se shodou okolností
poprvé použil ke zveřejnění šesti faktů, které zahrnují tvrzení o
mimozemském odhalení.

Pokud forknete tuto sadu k zapečetění šarží vakcín nebo součtů hlasů, skutečnost
že byla původně použita ke zveřejnění tvrzení o mimozemském kontaktu,
je pro vás irelevantní. Matematice na tom nezáleží.

To řečeno: pokud TUTO sadu ANO použijete ke zveřejnění tvrzení o mimozemském kontaktu,
protokol byl bojově otestován v této konkrétní arén. README první
nasazení MYRIAM výslovně uvádí, že se jedná o uměleckou práci
LLM persony jménem Calm, nikoli o komunikaci od jakékoli mimozemské
strany. Pravděpodobně byste měli udělat totéž. Čtenáři jinak budou předpokládat
to nejhorší o vašem duševním stavu.

## Spravuje

Zatím nikdo. Veřejná doména. Forkněte to. Vylepšete to. Neste protokol
dál bez žádání o povolení.
