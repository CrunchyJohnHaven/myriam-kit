*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pro zámek chování AI modelu

Připravený příklad myriam-kit pro AI laboratoře (komerční nebo open-source)
vydávající model a chtějící, aby tvrzení vydání —
identita vah, schopnosti, evaluační skóre, bezpečnostní přezkum,
předdistribuční závazky — byla **kryptograficky ukotvena a
veřejně ověřitelná**.

Sada se brání proti specifickému módu selhání, kdy nasazené modely
tiše driftují, evaluační skóre jsou zpětně přepisována nebo
předdistribuční tvrzení jsou roky později zpochybňována jako „to jsme nikdy neřekli".

## Co tato sada produkuje

Kryptograficky zapečetěný manifest obsahující pro jedno vydání modelu:

1. Identifikace modelu (název, architektura, počet parametrů, licence)
2. **SHA-256 souboru vah** — kanonický hash artefaktu
3. Text karty modelu (schopnosti, zamýšlené použití, použití mimo rozsah,
   známé módy selhání)
4. Evaluační výsledky při vydání (evaluace schopností, bezpečnostní evaluace,
   kalibrace)
5. Předdistribuční závazky (věci, k jejichž tichému neměnění
   po vydání se zavazujete)
6. Podepisující principal (osoba + organizace přebírající odpovědnost)

Pečeť činí každý z těchto prvků byte-stabilním, časově ukotveným k Bitcoinu prostřednictvím
OpenTimestamps a dohledatelným prostřednictvím IPFS nezávisle na jakékoli jednotlivé
hostingové straně.

Viz vypracovaný fiktivní příklad: [facts/](facts/) a vykreslený
[site/index.html](site/index.html). Příklad používá fiktivní model
(„Calm-mini-v0"); reálné vydání by nahradilo obsah příkladu.

## Proti čemu se tato sada brání

**Módy selhání, které pečeť přímo zachycuje:**

- **Manipulace s vahami** — SHA-256 vydaného souboru vah je
  v FACT 03. Jakákoli posléze provedená změna bajtů, které si uživatel
  stáhne, je detekovatelná opětovným hashováním.
- **Tiché zpětné přepisy evaluací** — evaluační skóre při vydání jsou v FACT 05.
  Budoucí spory typu „evaluační skóre vždy bylo X" mají veřejnou kotvu.
- **Drift tvrzení o schopnostech** — text karty modelu v FACT 04 je
  byte-stabilní. Budoucí spory typu „nikdy jsme netvrdili schopnost X" jsou
  veřejně ověřitelné proti zapečetěnému textu.
- **Tichá redistribuce fine-tuningu** — předdistribuční závazek č. 1
  v FACT 06 (ve vypracovaném příkladu) zní „žádný tichý fine-tuning pod
  stejným názvem". Detekce: každý nový hash vah znamená nový název
  modelu a novou zapečetěnou publikaci, jinak je závazek porušen.
- **Skryté módy selhání** — FACT 04 se zavazuje k seznamu známých módů
  selhání. Seznam je monotónní (může růst, nikoli se zmenšovat pro
  zmrazený kontrolní bod). Budoucí objevy módů selhání, které laboratoř
  znala interně, ale nezveřejnila, se stanou napadnutelným důkazem.

**Módy selhání, které NEJSOU pokryty:**

- Zneužití modelů uživateli níže v řetězci (pečeť dokazuje, co bylo
  vydáno, ne co s tím uživatelé dělají).
- Adversariální fine-tuning třetími stranami (fine-tune třetí strany
  produkuje jiný hash vah, takže původní pečeť není ovlivněna,
  ale model třetí strany je mimo ochranu pečetě).
- Změny chování v důsledku změn prostředí nasazení (různé
  systémové prompty, konfigurace RAG atd.).
- Selhání, o nichž laboratoř v době vydání skutečně nevěděla.
  Pečeť zavazuje laboratoř k *tomu, co věděla*; nemůže ukotvit, co
  nevěděla.

## Kdy tuto sadu používat

Měli byste zvážit zapečetění karty modelu, pokud:

- Vydáváte váhy modelu veřejně NEBO nasazujete model v kontextu, kde
  uživatelům níže v řetězci záleží na stabilitě chování.
- Vydání je natolik významné, že budoucí spory typu „to jsme nikdy
  neřekli" jsou pravděpodobné (jakýkoli model nasazený v měřítku;
  jakýkoli bezpečnostně-kritický model; jakékoli vydání doprovázené
  tvrzeními o schopnostech).
- Vaše organizace je ochotna učinit předdistribuční závazky,
  které omezí budoucí akce (toto je nosný bod — viz
  další sekce).
- Můžete vypočítat SHA-256 souboru vah při vydání.

## Kdy tuto sadu NEPOUŽÍVAT

NEPOUŽÍVEJTE tuto sadu, pokud:

- Nejste ochotni být vázáni předdistribučními závazky v
  FACT 06 příkladu. Pečeť činí závazky mechanicky detekovatelnými;
  pokud nejste připraveni na tu odpovědnost, nepečeťte.
- Soubor vah se bude často měnit (např. kontinuální
  fine-tuningové pipeline). Každá změna vah vyžaduje novou zapečetěnou
  publikaci. Pečetění pro každé vydání je náročné; tato sada je pro *zmrazené*
  kontrolní body.
- Ještě jste neprovedli bezpečnostní přezkum. Pečeť zavazuje k zjištěním
  bezpečnostního přezkumu. Pokud zapečetíte neúplný přezkum, máte
  trvalý veřejný záznam o neúplném přezkumu.
- Mohli byste chtít později odvolat konkrétní evaluační skóre. Pečeť je
  trvalá. Nové zapečetěné publikace mohou nahradit, ale originál
  nelze odčinit.

## Nosné předdistribuční závazky

FACT 06 příkladu zavazuje vydavatele k:

1. **Žádný tichý fine-tuning pod stejným názvem.** Každý
   fine-tune produkuje nový název modelu, novou zapečetěnou publikaci,
   nový hash vah. Předchůdce kanonicky zůstává pojmenovanou
   verzí.

2. **Žádné tiché aktualizace evaluací.** Re-evaluace dostávají nové zapečetěné
   publikace odkazující na originál pomocí Merkleho kořene. Verze jsou
   sledovány, nikoli přepsány.

3. **Známé módy selhání mohou růst, nikdy se nezmenšovat.** Zmrazený
   kontrolní bod nemůže mít opravené módy selhání. Takže zveřejněný seznam
   je efektivně monotónní.

4. **Zacházení se stažením z trhu.** Pokud bude laboratoř nucena odstranit
   model z distribuce, zavazuje se zveřejnit závěrečné
   zapečetěné prohlášení o stažení.

Laboratoř přijímající tuto sadu musí rozhodnout, které z těchto závazků
může skutečně dodržet. Pokud nemůžete dodržet všechny čtyři, upravte
FACT 06 *před* zapečetěním tak, aby odrážel to, co můžete dodržet, a
přijměte výslednou oslabenou ochranu. Zapečetit závazky, které
nemíníte dodržet, je horší než nepečetit vůbec.

## Jak forknout tuto sadu pro reálné vydání

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

## Integrace s existujícími pipeline vydávání

Sada je navržena tak, aby skládala s existujícími nástroji, nikoli aby je
nahrazovala:

- **Hugging Face**: zahrňte URL zapečetěné publikace nebo IPFS CID do
  README.md karty modelu. Odkažte čtenáře na pečeť pro byte-stabilní
  tvrzení vydání.
- **GitHub vydání**: zahrňte potvrzení OpenTimestamps
  (`merkle_root.txt.ots`) jako asset vydání. Budoucí spory
  typu „vydání se změnilo" jsou pak ukotveny k Bitcoinu.
- **Standardy karet modelů (Mitchell et al. 2019)**: sada je
  kompatibilní. Standardní pole karty modelu se mapují na FACTS 02–05
  pečetě. Kartu modelu produkujete obvyklým způsobem a navíc ji pečetíte.
- **Evaluační harnessy (lm-evaluation-harness, BIG-bench atd.)**:
  hashujte přesný commit harnessu a surový výstupní JSON; odkazujte na tyto
  hashe v FACT 05. Budoucí opakovaná spuštění jsou pak nezávisle
  reprodukovatelná.

## Výpočet hashe vah

Pro jeden soubor safetensors:

```bash
shasum -a 256 model.safetensors
```

Pro vícesouborové kontrolní body (GGUF shards, shardované safetensors):

```bash
# Concatenate hashes in sorted order, then hash again
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Finální hash je to, co jde do FACT 03. Zahrňte jak hashe per-shard,
tak finální agregovaný hash, aby uživatelé mohli ověřovat jednotlivé
shardy během stahování.

## Co by měli příjemci (uživatelé vašeho modelu) vědět

Vydání modelu s MYRIAM-zapečetěnou publikací umožňuje uživateli:

1. **Ověřit stažené váhy** opětovným hashováním a porovnáním
   s FACT 03.
2. **Ověřit, že karta modelu nebyla zpětně přepsána** kontrolou
   zapečetěného FACT 04 oproti aktuální zveřejněné verzi laboratoře.
3. **Ověřit, že evaluační skóre jsou ta při vydání** porovnáním
   aktuálních tvrzení laboratoře o evaluacích se zapečetěným FACT 05.
4. **Volat laboratoř k odpovědnosti za její předdistribuční závazky**
   kontrolou skutečného chování oproti zapečetěnému FACT 06.

Uživatel, který najde nesrovnalosti, má kryptografický důkaz
nesrovnalosti. Může tento důkaz zveřejnit; původní zapečetěná
publikace je kotvou.

## Co tato sada NENÍ

- Není náhradou za skutečné provádění bezpečnostního přezkumu. Pečeť je
  *záznam* bezpečnostního přezkumu, nikoli samotný přezkum.
- Není náhradou za skutečné evaluace. Pečeť ukotvuje skóre, která
  produkujete; nevaliduje metodologii.
- Není zárukou, že model je bezpečný. Pečeť dokumentuje, co laboratoř
  o modelu při vydání tvrdí; necertifikuje tato tvrzení.
- Není ochranou proti zneužití modelu uživateli níže v řetězci.

## Poznámka k adversariálnímu fine-tuningu

Běžná obava AI bezpečnosti: někdo provede fine-tuning vašeho modelu
a odstraní bezpečnostní chování a redistribuuje jej. Pečeť TOTO nedokáže
zabránit. Co pečeť dokáže:

- Ukotvit, co měl *původní* model dělat (FACT 04).
- Ukotvit, jaká byla původní evaluační skóre (FACT 05).
- Poskytnout referenční bod, vůči kterému lze adversariální fine-tuny
  měřit.

Uživatel narazivší na redistribuci třetí stranou může ověřit, zda
váhy odpovídají původnímu zapečetěnému hashi. Pokud ne, uživatel ví,
že má nepůvodní model a že jakákoli bezpečnostní tvrzení přisuzovaná
laboratoři neplatí.

## Závěr

Zapečetění vydání modelu je malá dodatečná práce pro laboratoř: ~10 minut
na výpočet hashů a spuštění skriptu pro pečetění, plus 30vteřinové
rozhodnutí o tom, které předdistribuční závazky zahrnout. Přidaná
odpovědnost je asymetrická: malý náklad pro poctivé laboratoře, velké
omezení pro laboratoře, které by jinak tiše driftovaly své tvrzení.

Pokud jste AI laboratoř zvažující přijetí, sada je veřejnou doménou
(CC0). Forkněte ji. Modifikujte ji. Matematika je nosný kus, nikoli
specifická implementace.

## Licence

Veřejná doména (CC0). Žádná atribuce není vyžadována.
