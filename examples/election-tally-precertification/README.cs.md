*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pro předcertifikační zapečetění volebních sčítání

Příklad myriam-kit „na klíč" pro okresní (county) volební komise,
státní volební orgány a pozorovatele volební integrity, kteří chtějí
publikovat pečeť sčítání zakotvenou v Bitcoinu, odolnou proti
neoprávněné manipulaci, v přesném okamžiku certifikace.

**Uzavírá** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Co tato sada NEDĚLÁ (čtěte nejprve)

Pečeť je kryptografické časové razítko toho, co bylo certifikováno.
Nedokáže ověřit, zda to, co bylo certifikováno, bylo správné. Následující
selhání jsou **mimo doménu pečeti**:

1. **Kompromitace volebních strojů.** Pokud byl firmware pozměněn nebo
   byly celkové počty hlasů špatně spočítány, pečeť zakotví chybné
   číslo s vysokou integritou. Pečeť pozoruje výstupy sčítacího systému;
   nemá viditelnost do systému samotného.

2. **Potlačování voličů / strukturální zbavení volebního práva.**
   Uzavírky volebních místností, nerovnosti vyplývající ze zákonů o
   prokazování totožnosti, zaujatost v míře odmítání korespondenčních
   hlasů a čistky voličských seznamů probíhají proti proudu certifikace.
   Pečeť zaznamenává spočítané hlasovací lístky, nikoli ty, které měly
   být spočítány.

3. **Volební dezinformace.** Pečeť neposuzuje tvrzení o volbách
   pronesená kandidáty, médii či platformami. Zapečetěná certifikace
   může být citována v dezinformačním narativu stejně snadno jako k jeho
   vyvrácení. Kryptografická časová razítka jsou obsahově neutrální.

4. **Předcertifikační podvod během sběru nebo sčítání hlasovacích lístků.**
   Nesrovnalosti při ballot-harvestingu, manipulace s urnami pro odevzdání
   hlasů, narušení řetězce úschovy během sčítacího okna — všechny se
   odehrávají před okamžikem zapečetění. Pečeť je nedokáže detekovat
   zpětně.

5. **Donucení certifikačního orgánu.** Vynucená certifikace vyprodukuje
   kryptograficky platnou pečeť vynuceného výsledku. Pečeť ověřuje, že
   úředník podepsal, nikoli proč.

6. **Chybné certifikace, které nikdy nejsou později opraveny.** Hodnota
   pečeti závisí na pozdějším procesu zjišťování pravdy (audit, přepočet,
   soudní spor), s nímž lze pečeť porovnat. Pokud takový proces nikdy
   neproběhne, pečeť zůstává jediným záznamem a může chybu zafixovat.

7. **Statistické anomálie a detekce vzorců.** Pečeť neoznačuje
   nepravděpodobné rozdíly, geografické anomálie ani odchylky od
   Benfordova zákona. To jsou analytické úlohy nad zapečetěnými daty,
   nikoli vlastnosti pečeti.

8. **Nižší závody na hlasovacím lístku s tenkými auditními stopami.**
   Menší závody mají slabší spouštěče přepočtu; jediná pečeť nemůže
   smysluplně pokrýt všechny závody na hlasovacím lístku bez vymezení
   rozsahu pro každý závod zvlášť.

**Výše uvedená sekce o čestných mezích je nosnou částí této sady.**
Úředníci, kteří věří, že zapečetění se rovná legitimitě, ji budou
používat jako štít. Sada musí jasně říci: jde o *primitiv neodvolatelnosti
pro okamžik certifikace*, nikoli o důkaz správnosti voleb.

---

## Co tato sada MUSÍ ODMÍTNOUT zapečetit

Sada je nakonfigurována tak, aby odmítla následující skutkové vzorce
i v případě, že je předloží uživatel s platným podpisovým oprávněním:

- **Identifikace jednotlivých voličů.** Žádný fakt nesmí jmenovat
  voliče, propojit hlasovací lístek s voličem ani odhalit jakékoli
  pole, které by mohlo osobu znovu identifikovat.
- **Rozhodnutí o shodě podpisu na jednotlivých hlasovacích lístcích.**
  Plné PII; zapečetění vytváří trvalé záznamy o rozhodnutích, která
  mohou být později zpochybněna.
- **Jakýkoli fakt, jehož publikování by identifikovalo zranitelného
  voliče.** Včetně výsledků na úrovni okrsku v okrscích tak malých, že
  je volba odvoditelná (obvykle <50 hlasovacích lístků).
- **Sčítání zapečetěná dříve, než jsou spočítány všechny hlasovací
  lístky.** Sada odmítá částečné počty prezentované jako „sčítání".
  Předcertifikace znamená *všechny hlasovací lístky spočítány, před
  oficiální certifikací* — nikoli *během sčítání*.
- **Předběžné nebo podmínečné certifikace.** Pečeť musí odrážet fakt,
  nikoli podmínku.
- **Počty, které vylučují kohorty čekající na soudní spor** bez
  výslovného zapečetěného doprovodného faktu odhalujícího vyloučení.
- **Zapečetění kýmkoli jiným než certifikačním orgánem** pro danou
  jurisdikci.

Samotné odmítnutí může být zapečetěno jako fakt („Tento orgán požadoval
zapečetění X; sada odmítla podle pravidla odmítnutí Y") a vytváří tak
veřejný záznam o pokusu o zneužití.

---

## Co tato sada SKUTEČNĚ pečetí

8 faktů v okamžiku certifikace:

1. **Příkladové oznámení** — prohlašuje publikaci za příklad (skutečné
   atestace toto odstraňují nebo nahrazují).
2. **Identifikace jurisdikce** — county, datum voleb, certifikační
   orgán, certifikující úředníci podle jména + role.
3. **Certifikované sčítání** — celkové počty hlasů pro každého kandidáta
   v každém závodě + nadbytečné/chybějící hlasy + write-in hlasy.
4. **Účetnictví a sesouhlasení hlasovacích lístků** — celkem odevzdaných,
   celkem tabelovaných, celkem odmítnutých podle kategorie, rozpis podle
   modu, jmenovatel zapsaných voličů.
5. **Manifest zařízení a auditní stopy** — model tabulátoru + hash
   firmwaru, hash souboru CVR, hash archivu obrazů hlasovacích lístků,
   hash logu úschovy, hash politiky shody podpisů.
6. **Prahové hodnoty a spouštěče v okamžiku certifikace** — platná
   prahová hodnota shody podpisu, prahové hodnoty spouštěčů přepočtu,
   skutečné rozdíly v každém závodě, RLA seed commitment.
7. **Doprovodná zveřejnění a záznam o odmítnutích** — probíhající
   soudní spory, ponaopočtové anomálie pod přezkumem, vyloučené
   kohorty, nesouhlasící členové komise; výslovný seznam vzorců, které
   sada odmítla zapečetit.
8. **Podepisující principál** — identifikace Board of Canvassers + jméno
   a strana každého signatáře + kryptografická informace o klíči.

Každý fakt končí konvencí brány odmítnutí: *„Tento fakt tvrdí pouze X.
Netvrdí Y"* (kde Y je nejbližší selhání ze sekce „NEDĚLÁ" výše).

---

## Proti čemu se tato sada brání

- **Tichá revize celkových počtů hlasů po certifikaci** — jakákoli
  celočíselná změna v FACT 03 vyprodukuje jiný SHA-256, jiný Merkle
  root, selže ověření OTS.
- **„Nalezené hlasovací lístky" tiše vstřebané** — aritmetika sesouhlasení
  v FACT 04 je fixována při certifikaci.
- **Tvrzení o záměně firmwaru** — FACT 05 zmrazí manifest zařízení při
  certifikaci.
- **Záměna auditních artefaktů po certifikaci** — hash manifest v FACT 05
  zachytí jakoukoli pocertifikační změnu CVR, obrazů hlasovacích lístků,
  logů úschovy či politiky shody podpisů.
- **Redefinice prahových hodnot a spouštěčů** — FACT 06 zmrazí pravidla
  platná při certifikaci (prahová hodnota shody podpisů, spouštěče
  přepočtu, RLA riziková mez).

## Historické nebo téměř historické případy, kde by sada pomohla

Sada by poskytla užitečnou kotvu — *nikoli nápravu* — v případech
zahrnujících:

- **Antrim County, Michigan (2020).** Počáteční neoficiální výsledky
  ukazovaly záměnu kandidátů, která byla později opravena na opačný
  výsledek. Pečeť před opravou by poskytla veřejnou referenci pro to,
  co řekla původní oznámení vs. co řekla oprava, obojí kryptograficky
  atestováno.
- **Maricopa County, Arizona (2020–2022).** Kolovalo více iterací
  přepočítaných/přezkoumaných součtů. Pečeť okamžiku certifikace by
  poskytla jednoznačný referenční bod, vůči němuž mohl být každý
  následný počet diffován.
- **Florida 2000 (Bush v. Gore canvass).** Certifikované součty podle
  county se posouvaly pod tlakem přepočtů; pečeť před přepočtem podle
  county by zachovala, co každý county certifikoval předtím, než
  začaly manuální postupy přepočtu.
- **Různé zahraniční volby s doloženými pocertifikačními „opravami".**
  Jurisdikčně agnostické.

Sada by NEVYŘEŠILA základní spory o integritu strojů v roce 2020, spory
o politiku korespondenčního hlasování ani jakékoli volby, kde jádrem
sporu byla sporná fakta, nikoli sporný záznam.

## Kdy tuto sadu použít

- Vaše jurisdikce má stabilní, auditovaný certifikační proces a chce
  přidat neměnnou veřejnou kotvu.
- Očekáváte pocertifikační přezkum a chcete referenční bod odolný
  vůči manipulaci.
- Máte zákonné oprávnění publikovat uvedenou množinu faktů bez
  odhalení PII.
- Máte paralelní auditní nebo RLA proces, aby pečeť mohla být
  porovnána s výstupem zjišťování pravdy.

## Kdy tuto sadu NEPOUŽÍVAT

- **Nepoužívejte ji jako náhradu za risk-limiting audity, ruční
  přepočty nebo povolební audity.** Tato sada je *aditivní*, nikoli
  náhradou.
- **Nepoužívejte ji, pokud certifikující úředník není skutečným
  rozhodujícím orgánem** (vytváří falešnou atribuci).
- **Nepoužívejte uprostřed tabulace.** Sada je určena specificky pro
  okamžik certifikace. Pečetě částečných počtů vytvářejí zavádějící
  referenční body.
- **Nepoužívejte ji k tvrzení, že volby byly spravedlivé, přesné nebo
  legitimní** — to nedokáže.
- **Nepoužívejte ji pod tlakem zapečetit dříve než v okamžiku
  certifikace nebo vynechat zveřejnění doprovodného faktu.** Odmítněte
  a zapečeťte odmítnutí.
- **Nepoužívejte ji jako divadlo legitimity.** Pečeť podvodného sčítání
  je trvalým veřejným záznamem podvodu, nikoli jeho obhajobou.
  Primitiv řeže oběma směry; v tom spočívá jeho čestnost.

## Jak forknout tuto sadu pro skutečnou certifikaci

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # nahraďte fiktivní obsah skutečným
bash build/seal.sh     # zapečeťte V okamžiku oficiálního podpisu certifikace nebo po něm
python3 build/verify.py
```

**Kritické načasování:** zapečeťte V okamžiku certifikace, NIKOLI
předtím. Pečeť před oficiální certifikací vytváří falešně pozitivní
záznam „toto je oficiální výsledek". Pečeť po certifikaci je
konvenční neodvolatelnost.

## Integrace se stávající volební infrastrukturou

- **State Boards of Elections / EAC certifikace.** Sada publikuje
  vedle oficiálního certifikačního dokumentu. Nenahrazuje statutární
  certifikaci.
- **Risk-limiting audity.** CVR hash v FACT 05 je tentýž hash, který
  konzumuje nástroj RLA. Pečeť váže auditovaný CVR k certifikovanému
  součtu.
- **Postupy přepočtu.** Přepočet spuštěný podle státního práva vytvoří
  NOVOU zapečetěnou množinu faktů (jiné časové razítko, jiné hashe,
  stejná jurisdikce). Obě pečetě koexistují; ani jedna nepřepisuje
  druhou. Diff mezi pečetěmi je veřejný záznam toho, co přepočet
  změnil.
- **Election Markup Language (EML) a Common Data Format (CDF).** Těla
  faktů by měla být odvoditelná ze stávajících EML/CDF výstupů
  jurisdikce, aby sada zůstala nezávislá na datovém formátu.
- **Dvoustranný podpis board of canvassers.** Multi-signature varianta
  se doporučuje pro jurisdikce se stranicky vyváženými canvass
  komisemi.

## Co tato sada NENAHRAZUJE

- Statutární certifikaci podle státního volebního práva
- EAC certifikaci hlasovacího systému
- Risk-limiting audity / ruční přepočty
- Postupy přepočtu a povolební audity
- Soudní příkazy nebo volebně-sporné soudní řízení

## Proč tato sada existuje ve v0.3.0+

Toto je 6. propracovaný příklad dodávaný s myriam-kit. Sada byla
vyrobena pomocí autoresearch procesu v Karpathyho stylu zdokumentovaného
v `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Tři varianty promptu
(imitation / first-principles / constraint-first) vyprodukovaly
paralelní obrysy sady; varianta constraint-first dosáhla nejvyššího
skóre na vážené rubrice a finální sada syntetizuje její strukturu
s kohezí varianty imitation a operativním detailem varianty
first-principles.

Samotný autoresearch je zdokumentován jako prompt vzor v
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` pro budoucí použití.

## Licence

Public domain (CC0). Forkněte. Atribuce není vyžadována.
