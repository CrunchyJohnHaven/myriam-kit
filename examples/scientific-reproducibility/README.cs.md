*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pro vědeckou reprodukovatelnost

Sada myriam-kit „na klíč" pro výzkumné skupiny, vědecké časopisy a instituce zaměřené na reprodukovatelnost, které chtějí spolu s článkem nebo preprintem zveřejnit reprodukovatelnostní manifest ukotvený v Bitcoinu a odolný vůči manipulaci.

## Co tato sada produkuje

Zapečetěnou publikaci obsahující pro jednu studii:

1. Identifikaci studie (název článku, autoři, instituce, financovatelé, střet zájmů)
2. **SHA-256 archivu surových dat** — kanonický soubor dat
3. **Hash analytické pipeline** — skript + Docker image digest + připnuté závislosti
4. **Hash svazku očekávaného výstupu** — to, co by věrný reprodukující subjekt měl získat
5. Reprodukční protokol + závazky k publikaci po získání výsledků
6. Podepisující principál(y)

Pečeť je určena pro fázi **před analýzou**: data zmrazena, pipeline finalizována, očekávaný výstup vypočten, VŠE před tím, než jsou viděny jakékoli výsledky za účelem napsání článku.

## Proti čemu se tato sada brání

**Selhání, která pečeť zachytí:**

- **p-hacking**: dodatečné změny analýzy po zhlédnutí výsledků jsou detekovatelné prostřednictvím rozdílu mezi zapečetěným FAKTEM 04 a publikovanou pipeline.
- **HARKing** (Hypothesizing After Results are Known — formulování hypotéz až po zjištění výsledků): předem zaregistrovaná hypotéza ve FAKTU 02 je bajtově stabilní.
- **Manipulace dat po publikaci**: opětovné hashování datového archivu proti FAKTU 03 odhalí jakoukoli modifikaci.
- **Drift pipeline**: opětovné hashování analytické pipeline proti FAKTU 04 zachytí tiché změny.
- **Manipulace s autorstvím**: tiché přidávání nebo odebírání autorů po publikaci se stává detekovatelným proti zapečetěnému FAKTU 02.

**Selhání, která NEJSOU pokryta:**

- Podvod při sběru surových dat (pečeť ukotvuje data v okamžiku zapečetění, nikoli sběru)
- Biologická / empirická nereprodukovatelnost (pečeť ukotvuje pouze výpočetní reprodukovatelnost)
- Otázky velikosti vzorku nebo validity populace (jsou to otázky designu studie)
- Pravdivost tvrzení samotného (pečeť ukotvuje to, co bylo tvrzeno, nikoli zda svět odpovídá tvrzení)

## Kdy tuto sadu použít

Zvažte zapečetění, pokud:

- Jste výzkumná skupina provádějící analýzu s vysokými sázkami (klinická studie, hodnocení AI systému, replikační studie) a chcete forenzní integritu nad rámec časových razítek z OSF / GitHubu
- Jste výzkumník na začátku kariéry, který chce asymetrickou ochranu reputace: zapečetěná předanalýza znamená, že budoucí kritika typu „p-hackovali" má veřejného vyvraceče
- Jste redaktor vědeckého časopisu nebo vedoucí replikačního projektu a chcete podpořit kryptograficky kvalitní předregistraci pro podmnožinu článků
- Pracujete na analýze, kde mají dodatečné úpravy smysluplné důsledky pro obor (psychologie, behaviorální ekonomie, lékařský výzkum)

## Historický precedens úmrtnosti / újmy

Relevance této sady k úmrtnosti je nepřímá:

- **Nereprodukovatelnost ve výzkumu kmenových buněk / rakoviny:** několik článků vedlo k poškození pacientů prostřednictvím chybně směrovaných klinických studií. Zapečetěná předregistrace původní pipeline by ukotvila srovnání.
- **Kontroverze ohledně účinnosti Tamiflu:** Cochranovský přehled trval roky částečně proto, že přístup k surovým datům byl zpochybňován. Zapečetěné datové hashe při publikaci by spory o přístup k datům okamžitě řešily.
- **Obecná krize nereprodukovatelnosti:** úmrtnostní náklady nereprodukovatelného biomedicínského výzkumu na úrovni oboru jsou významné (Begley & Ellis 2012 odhadli, že >50 % preklinických zjištění je nereprodukovatelných). Kryptografické ukotvení je jednou strukturální pákou.

## Jak forkovat tuto sadu

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## Integrace se stávající vědeckou infrastrukturou

- **arXiv / bioRxiv / medRxiv**: zahrňte URL pečeti MYRIAM nebo IPFS CID do abstraktu nebo doplňkových materiálů
- **OSF**: připojte artefakt pečeti k projektu OSF vedle konvenčního formuláře předregistrace
- **AsPredicted**: zahrňte URL pečeti MYRIAM do dokumentu předregistrace
- **GitHub**: commit hash analytické pipeline je to, co FAKT 04 ukotvuje; GitHub poskytuje zdroj, MYRIAM ukotvuje bajty
- **Zenodo / Figshare / OpenAIRE**: deponujte surová data, poté zapečeťte hash depozitu; pečeť je forenzně obtížnější tiše nahradit než metadata depozitu
- **Doplňkové materiály časopisů**: zahrňte artefakt pečeti MYRIAM jako doplňkový soubor při podání

## Co tato sada NENAHRAZUJE

- Schválení od IRB / etické komise
- Recenzní řízení
- Replikační studie (výpočetní reprodukovatelnost ≠ empirická reprodukovatelnost)
- Smlouvy o přístupu k datům pro citlivá data

## Poznámka k pořadí autorů a uznání

Pečeť ukotvuje SEZNAM AUTORŮ v okamžiku zapečetění. Spory o autorství, které vzniknou po publikaci, lze posuzovat proti zapečetěnému seznamu. Toto je malá páka odpovědnosti — důležitá pro výzkumníky na začátku kariéry, kteří jsou tiše přidáváni nebo odebíráni.

## Licence

Veřejná doména (CC0). Použijte to, modifikujte to, ignorujte to, forkujte to.
