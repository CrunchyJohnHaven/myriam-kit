*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pečetí osvědčení auditu dodavatelského řetězce

Hotová příkladová sada myriam-kit pro nezávislé sociální / pracovní /
environmentální auditory, interní týmy souladu dodavatelů, nevládní
vyšetřovatele dodavatelského řetězce a organizace pro práva pracovníků,
které chtějí zveřejnit pečeť odolnou vůči manipulaci s kotvou v
Bitcoinu auditní zprávy v přesný okamžik podpisu.

---

## Co tato sada NEDĚLÁ (čtěte nejprve)

Pečeť je kryptografické časové razítko toho, co auditor podepsal.
Nemůže ověřit, zda to, co bylo podepsáno, je **pravdivé**. Následující
režimy selhání jsou **mimo doménu pečeti**:

1. **Zachycení auditu průmyslem.** Audity zadané značkami mají
   dlouhou, zdokumentovanou historii produkování měkkých zjištění
   o dodavatelech, jejichž pokračující obchodní vztah se zadávající
   značkou udržuje audit-pipeline v chodu. Zachycený audit, když
   je zapečetěn, produkuje trvalý forenzní záznam zachyceného
   auditu. Pečeť nekoriguje zachycení — pouze činí audit-jak-vydán
   neměnným, aby pozdější proces hledání pravdy měl něco
   konkrétního k porovnání.

2. **Trénovaní pracovníci / připravené závody.** Ohlášené nebo
   poloohlášené audity dávají vedení dny nebo týdny na nacvičení
   odpovědí pracovníků, schování nezletilých pracovníků,
   vyčištění ubytoven, odstranění nevyhovujícího vybavení a
   přesměrování práce na neauditované subdodavatele během
   auditního okna. Pečeť kotví, co auditorům ukázali, ne to, čemu
   jim bylo zabráněno vidět.

3. **Skryté subdodávky.** Subdodávky Tier-2 a Tier-3, domácí práce
   a produkce v neformálním sektoru jsou rozšířeně neviditelné
   pro audity na úrovni továrny. Pečeť kotví audit Tier-1; nemůže
   detekovat, že Tier-1 outsourcuje neauditovanému Tier-2 během
   auditního okna nebo rutinně.

4. **Audity, které systematicky míjejí zneužívání, na něž jsou
   zaměřeny.** Rana Plaza, zhroucení textilní továrny v
   Bangladéši v roce 2013, které zabilo 1134 pracovníků, bylo
   auditováno více programy zadanými značkami v měsících před.
   Praskliny v budově nebyly na kontrolním seznamu sociálního
   auditu; auditní režim neměl rozsah strukturálního inženýrství.
   Audity kotví, co je *v rozsahu*; zneužívání mimo rozsah
   zůstává neviditelné bez ohledu na to, jak je pečeť odolná
   vůči manipulaci.

5. **Odveta po podpisu vůči pracovníkům, kteří se účastnili
   rozhovorů.** I s odmítnutými lokalizačními informacemi (FAKT
   07 R3) může odhodlaný protivník, který zná ID dodavatele,
   identifikovat zařízení. Ochrana pracovníků vyžaduje více než
   jen odmítnutí PII v pečeti — vyžaduje anonymizaci nahoře v
   metodologii auditu. Pečeť činí audit-jak-vydán trvalým;
   nechrání tazatele zpětně.

6. **Pracovní podmínky legální, ale nelidské.** Mezery životní
   mzdy v jurisdikcích, kde právní minimální mzda je pod
   referenční hodnotou životní mzdy, produkují "vyhovující"
   auditní zjištění vůči zákonům o mzdách a hodinách a
   "nevyhovující" zjištění vůči standardům životní mzdy ve
   stejném auditu (FAKT 03 prvek 8 v této příkladové sadě).
   Pečeť kotví, co každý standard hlásí; jejich smíření je
   politická práce dál po proudu.

7. **Klimatické / environmentální škody s rozptýlenou
   příčinností.** Emise uhlíku, příspěvky k odlesňování, ubývání
   vody a uvolňování polutantů od dodavatelů mohou být zapečetěny
   v auditních zjištěních, ale příčinné přiřazení k objemu
   objednávek konkrétní značky je metodologicky sporné. Pečeť
   kotví, co bylo měřeno u dodavatele; nepřiřazuje morální ani
   právní odpovědnost.

8. **Spory o to, který standard je směrodatný.** SA8000 vs. BSCI
   vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. kodex chování
   specifický pro firmu: každý má jiné rozsahy, závažnosti a
   procesy nápravy. Pečeť kotví *jeden* audit pod *jedním*
   standardem. Mezistandardní srovnání je problémem dál po proudu.

9. **Kompetence auditora vs. osvědčení auditora.** "S osvědčením"
   není "kompetentní". Auditoři, kteří dokončili akreditované
   školicí programy, přehlédli závažná zneužívání v auditech,
   které předcházely veřejně viditelným katastrofám. Pečeť kotví
   pověření; necertifikuje kompetenci, se kterou byla vykonávána.

**Sekce o poctivých omezeních výše je nosnou částí této sady.**
Značka, která chce divadlo legitimity, použije zapečetěný audit
jako štít. Sada musí jasně říci: toto je *primitivum nepopiratelnosti
pro okamžik podpisu auditní zprávy*, nikoli důkaz souladu dodavatele
nebo blahobytu pracovníka.

---

## Co tato sada MUSÍ ODMÍTNOUT zapečetit

Sada je nakonfigurována tak, aby odmítla následující vzory faktů, i
když je předloží uživatel s platným oprávněním auditního orgánu:

- **Identifikace jednotlivého pracovníka.** Žádný fakt nesmí
  jmenovat pracovníka, spojovat citát s pracovníkem, vystavovat
  číslo odznaku, pozici na lince, ubytovenský pokoj, harmonogram
  směn, demografickou kombinaci s N<5 nebo jakékoli pole, které
  by mohlo zpětně identifikovat osobu, která se účastnila
  rozhovorů. Citáty pracovníků používají náhodné tokeny; mapování
  není nikdy zapečetěno.
- **Zdroje informátorů / whistleblowerů.** Pokud zjištění spočívá
  na odhalení jednotlivcem, který riskoval, aby odhalil, jedinec
  není v zapečetěné publikaci nikdy jmenován ani identifikován.
- **Přesné lokalizační informace.** Žádná adresa ulice, GPS,
  satelitní obraz >1 km rozlišení nebo externí fotografie budovy.
  Země a region jsou maximální zapečetěné rozlišení. Důvod:
  identifikace zařízení umožňuje odvetu vůči účastníkům rozhovorů.
- **Tvrzení o čistém auditu.** Sada odmítá pečetit jakékoli
  vyjádření ve formě "tento audit dokazuje, že dodavatel je v
  souladu" nebo "neexistují žádná porušení". Tvrzení o čistotě
  jsou epistemicky nepodložená metodologií auditu.
- **Substituce pečeť-jako-certifikát.** Publikace, která vynechává
  metodologii (FAKT 04), nezávislost (FAKT 06) nebo odmítnutí
  (FAKT 07), není legitimní MYRIAM publikací v rámci této sady.
- **Návrhy / před-podpisové audity.** Pečetění se děje při podpisu,
  ne dříve. Provizorní audity vytvářejí falešnou jistotu.
- **Post-hoc příznivé znovuzapečetění.** Revidovaný audit vyžaduje
  NOVOU zapečetěnou publikaci odkazující na původní podle kořene
  Merkleho stromu. Původní zapečetěný audit zůstává trvale
  viditelný jako audit-jak-vydán.
- **Pečetění kteroukoli stranou jinou než auditní orgán.** Značka,
  dodavatel, certifikační orgán nebo třetí strana nemohou
  zapečetit "audit" jménem auditního orgánu, který zprávu
  podepsal.

Samotné odmítnutí může být zapečetěno jako fakt ("Tato strana
požádala o zapečetění X; sada odmítla podle pravidla odmítnutí Y"),
čímž vytváří veřejný záznam pokusu o zneužití. **V odvětví s
rozšířeným zachycením auditu může být odmítnutí-zapečetit samo o
sobě smysluplným signálem:** auditní orgán, který nechce pečetit,
protože značka vyvinula tlak na změkčení zjištění, má možnost
veřejně zaznamenat odmítnutí pod vlastním principalem.

---

## Co tato sada PEČETÍ

8 faktů v okamžiku podpisu auditu:

1. **Příkladové oznámení** — prohlašuje publikaci za příklad
   (skutečná osvědčení toto odstraňují nebo nahrazují).
2. **Rozsah a předmět auditu** — auditní standard, auditní orgán,
   vedoucí auditor, velikost auditního týmu, identifikátor
   dodavatele (žádné přesné lokalizační informace), auditní
   okno, typ ohlášení (ohlášený / poloohlášený / neohlášený),
   datum auditní zprávy, podpisová verze, jmenované značky
   příjemců, zadávající strana.
3. **Manifest auditních zjištění** — soulad / minor-NC / major-NC /
   critical-NC na prvek vůči standardu, každý se SHA-256 plného
   zápisu zjištění. Agregované součty. Doporučení certifikace při
   podpisu.
4. **Metodologie a důkazy** — alokace času na místě, počty
   rozhovorů (se stratifikací: pohlaví, status migranta, doba
   služby), rozdělení formátu rozhovorů, vztah tlumočníka, přezkum
   dokumentů s velikostmi vzorků a hashy obsahu, artefakty
   návštěvy na místě (se zamlženými tvářemi pracovníků), známá
   omezení metodologie.
5. **Zavázané nápravné akce** — CAP na major-NC a na minor-NC s
   uvedenou kořenovou příčinou, termínem, ověřovacím mechanismem,
   eskalačními závazky, závazek bez tichého uvolnění.
6. **Kvalifikace auditora a nezávislost** — akreditace auditního
   orgánu, koncentrace zákazníků, pověření vedoucího auditora a
   jazyková kompetence, sektorová zkušenost, deklarace
   nezávislosti (auditor-dodavatel, auditor-značka, oddělení
   certifikačního orgánu).
7. **Doprovodná zveřejnění a záznam odmítnutí** — konflikty zájmů
   (explicitně), historie předchozích auditů, sdělené kanály hlasu
   pracovníků, paralelní šetření, vnitřní nesouhlas auditního
   orgánu, seznam pravidel odmítnutí, odmítnutí skutečně použitá v
   tomto auditu.
8. **Podpisový principal** — auditní orgán, vedoucí auditor,
   auditní tým, autorizující úředník, informace o kryptografickém
   klíči.

Každý fakt končí konvencí brány odmítnutí: *"Tento fakt tvrdí pouze
X. Netvrdí Y"* (kde Y je nejbližší režim selhání ze sekce "NEDĚLÁ").

---

## Proti čemu tato sada brání

- **Tiché po-podpisové změkčení významných neshod.** Jakákoli
  změna ve FAKTU 03 (např. MAJOR_NC zreklasifikované na MINOR_NC
  nebo zjištění úplně smazané) produkuje jiný SHA-256, jiný
  kořen Merkleho stromu, selže verifikace OTS.
- **Antidatování uzávěr nápravných akcí.** FAKT 05 zmrazuje CAP a
  jeho termíny při podpisu; jakékoli tvrzení "uzavřeli jsme to NC
  minulý měsíc", které je v rozporu se zapečetěnými termíny, je
  veřejně porovnatelné.
- **Metodologický revisionismus.** FAKT 04 zmrazuje počty
  rozhovorů, velikosti vzorků dokumentů a hodiny na místě při
  podpisu — brání tomu, aby pozdější obhajoba "provedli jsme
  hloubkové šetření" byla nefalsifikovatelná.
- **Selektivní opětovná publikace vynechávající nepříznivá
  zjištění.** Všech 8 faktů je vázáno jediným kořenem Merkleho
  stromu; citování některých faktů při vynechávání jiných je
  detekovatelné ze zveřejněného seznamu listů.
- **Drift tvrzení o nezávislosti.** FAKT 06 zmrazuje deklarace
  nezávislosti k okamžiku podpisu. Pozdější tvrzení "tento audit
  byl přísně nezávislý" se musí vypořádat se zapečetěným procentem
  koncentrace zákazníků a zapečetěným ujištěním o značkou-placeném
  zadání.
- **Vymazání záznamu odmítnutí.** FAKT 07 zmrazuje, které vzory
  faktů sada odmítla; jakékoli pozdější tvrzení "nikdy jsme nic
  neodmítli" je v rozporu se zapečetěným záznamem.

---

## Historické nebo téměř historické případy, kterým by sada pomohla

Sada by produkovala užitečný **forenzní záchytný bod** — *nikoli
nápravu ani prevenci* — v případech zahrnujících:

- **Rana Plaza (Bangladéš, 2013).** Zhroucení budovy Rana Plaza
  zabilo 1134 textilních pracovníků a zranilo ~2500. Více značek,
  jejichž produkty byly vyráběny v budově, auditovalo dodavatele
  Tier-1 v budově krátce před zhroucením. Audity používaly
  kontrolní seznamy sociálního auditu, které nezahrnovaly rozsah
  strukturálního inženýrství. Zapečetěný metodologický fakt
  (FAKT 04) u každého z těchto auditů by učinil *mezeru rozsahu*
  veřejně viditelnou při podpisu — kotvící zdokumentované
  omezení, které auditní programy zpětně tvrdily, že neměly.
  Pečeť by nezabránila zhroucení. Zabránila by tomu, aby
  po-zhroucení průmyslové tvrzení "nikdo nevěděl" bylo
  epistemicky udržitelné.

- **Apple / Foxconn audity (2010s).** Více iterací auditních zpráv
  zařízení Foxconn vyrábějících pro Apple bylo publikováno s
  různými úrovněmi závažnosti zjištění, kontextem klastru
  sebevražd pracovníků a tvrzeními o nápravě. Zapečetěný záznam
  okamžiku podpisu pro každý audit by zabránil pozdějším sporům
  o "co audit říkal v té době" od závislosti na archivních
  kopiích, uniklých kopiích nebo revidovaných oficiálních
  vydáních.

- **Kobalt z DRC (probíhající).** Řemeslná těžba kobaltu v
  Demokratické republice Kongo, včetně dětí, krmí dodavatelské
  řetězce baterií pro hlavní značky elektroniky a EV. Více
  značkou-zadaných auditů během období 2017–současnost
  produkovalo zjištění s různou závažností. Sada aplikovaná na
  každý audit při podpisu by kotvila audit-jak-vydán; sada
  aplikovaná na fakta doprovodných zveřejnění (FAKT 07 C2:
  historie předchozích auditů) by učinila metodologické
  zděděné mezery každého následujícího auditora veřejně
  viditelné.

- **Konfliktní minerály (cín, tantal, wolfram, zlato z DRC a
  oblasti Velkých jezer).** Dodd-Frank §1502 vytvořil
  audit-a-zveřejni povinnosti pod SEC rule 13p-1. Spory o
  přiměřenost auditů na úrovni hutí a verifikaci řetězce
  poslední úschovy dál po proudu se opakovaly v období
  2014–2022. Pečetě MYRIAM na audit by kotvily každý audit
  hutě při podpisu.

- **Značkou-zadané audity dodavatelských řetězců bavlny z
  Xinjiangu (2018–současnost).** Spory o to, zda audity mohou
  být spolehlivě prováděny v rámci omezení vlády ČLR na přístup
  auditorů, se rozšířeně objevily po roce 2020. Zapečetěný
  metodologický fakt (FAKT 04) u každého auditu by kotvil, jaké
  podmínky přístupu skutečně platily — činíc pozdější tvrzení
  "provedli jsme přísný audit" porovnatelnými se zapečetěnými
  metodologickými omezeními v té době.

- **Subdodávky Foxconnu a zprávy o odpovědnosti dodavatelů Apple
  v 2010s — opakující se objevy nezletilých pracovníků, skrytých
  ubytoven, porušení hodin.** Pečetě na audit by kotvily
  *negativní zjištění* v auditech, které nic nenašly, vedle
  *pozitivních zjištění* v auditech, které našly porušení —
  brání zpětnému selektivnímu citování z obou směrů.

Sada by NEZABRÁNILA žádnému z nich. V několika případech byl
základním problémem to, že audit *minul* zneužívání —
zapečetění čistého auditu, který měl najít porušení, produkuje
trvalý záznam neúspěšného auditu, což je jiný druh užitečnosti
(kotví neúspěch pro pozdější odpovědnost), ale ne totéž jako
prevence.

---

## Kdy použít tuto sadu

- Jste auditní orgán přijímající praxi "publikujeme to, co jsme
  podepsali" jako obrana proti po-podpisovému tlaku na změkčení.
- Jste NGO provádějící paralelní šetření dodavatelského řetězce
  a chcete odolný vůči manipulaci referenční bod v okamžiku, kdy
  se šetření uzavírá.
- Jste organizace práv pracovníků, která získala auditní zprávu a
  chce kotvit její aktuální obsah dříve, než ji auditní orgán
  nebo značka stihne revidovat.
- Jste značka oddaná transparentnosti o auditech, které jste
  zadali, a chcete ověřitelný forenzní záznam.
- Jste novinář, regulátor nebo soud kotvící obsah konkrétního
  auditu v konkrétním okamžiku pro pozdější soudní spor nebo
  reportáž.

## Kdy NEPOUŽÍVAT tuto sadu

- **Nepoužívejte jako substitut pro monitorování vedené
  pracovníky, nezávislá vyšetřování NGO nebo organizování
  pracovníků.** Sada je *přídavná*, nikoli náhrada za žádné z
  nich.
- **Nepoužívejte k tvrzení, že dodavatel je v souladu.** Čistý
  zapečetěný audit je v nejlepším případě jeden vstup do
  posouzení souladu. Zacházení se zapečetěným auditem jako s
  certifikátem souladu je přesně to divadlo legitimity, kterému
  pravidla odmítnutí zaměřená nejprve na omezení mají zabránit.
- **Nepoužívejte uprostřed auditu.** Pečetění před podpisem
  vytváří falešně pozitivní záznam "toto je konečná auditní
  zpráva".
- **Nepoužívejte k zapečetění návrhu, který hodláte revidovat.**
  Každá podpisová verze dostane svou vlastní pečeť; revize
  odkazují na originály podle kořene Merkleho stromu.
- **Nepoužívejte pod tlakem zapečetit dříve, než je podpis, nebo
  vynechat zveřejnění doprovodného faktu.** Odmítněte a (pokud
  váš principal dovolí) zapečeťte odmítnutí.
- **Nepoužívejte jako základ pro marketingové tvrzení "fair
  trade" nebo "etické zdrojování" bez zveřejnění zapečetěných
  metodologických omezení vedle pečeti.** Citování pečeti bez
  citování omezení je režim selhání divadla legitimity, který
  definuje zachycení auditu.
- **Nepoužívejte, pokud je váš auditní orgán strukturálně
  zachycen a nemůže publikovat zjištění proti obchodnímu zájmu
  zadávající značky.** V takovém případě pečetění produkuje
  trvalý veřejný záznam zachyceného auditu. To může být stále
  cenné — ale není to totéž jako obrana proti zachycení.

---

## Jak forknout tuto sadu pro skutečný audit

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # nahraďte fiktivní obsah skutečným
bash build/seal.sh        # PEČEŤTE PŘI podpisu, ne dříve, ne později
python3 build/verify.py   # potvrďte
```

**Kritický timing:** pečeťte PŘI okamžiku podpisu — tj. když vedoucí
auditor podepisuje konečnou zprávu a ta se stává oficiální pozicí
auditního orgánu. Pečeť před podpisem vytváří falešně pozitivní
záznam "toto je konečný audit". Pečeť dlouho po podpisu je forenzně
slabší proti mezizávislým modifikacím.

---

## Integrace s existující infrastrukturou auditu dodavatelského řetězce

Sada je navržena pro skládání s, nikoli nahrazení:

- **SA8000 (Social Accountability International).** Auditní zprávy
  SA8000 a dokumenty CAP se přirozeně mapují na FAKT 03 + FAKT 05.
  Odkaz na akreditaci SAAS se hodí do FAKTU 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Auditní zjištění RBA se mapují na FAKT 03; pravidla
  nezávislosti auditní firmy RBA se mapují na FAKT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Auditní zjištění
  SMETA 2-pilíře a 4-pilíře se mapují na FAKT 03; platforma Sedex
  hostuje surovou zprávu — pečeť MYRIAM kotví hash obsahu zprávy
  hostované na platformě.
- **amfori BSCI.** Mechanika hodnocení BSCI A–E se mapuje na
  doporučení certifikace FAKTU 03; zadání členství značky se
  mapuje na zveřejnění koncentrace zákazníků FAKTU 06 a FAKT 07 C1.
- **FSC chain-of-custody.** Pro lesnické dodavatelské řetězce se
  certifikáty řetězce poslední úschovy a harmonogramy opětovných
  auditů hodí do struktury auditního okna a CAP.
- **B Lab / B Corp impact assessment.** Certifikace B Corp není
  audit třetí strany ve smyslu SA8000, ale zprávy ověřovatele
  hodnocení dopadu mohou být zapečetěny v rámci této sady (s
  fakty přesměrovanými na hodnocení dopadu, ne pracovní audit).
- **ISO 26000.** ISO 26000 je vodítko, ne certifikovatelné; sada
  nemá přímou integraci auditní zprávy ISO 26000, ale taxonomie
  sociální odpovědnosti může informovat strukturu prvků FAKTU 03
  pro interní audity.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  další sektorové režimy).** Sektorově specifické auditní programy
  mohou být zapečetěny v rámci této sady; pole auditního standardu
  FAKTU 02 identifikuje, který.
- **Fair Labor Association.** Zprávy o monitorování továren FLA se
  mapují na FAKT 03 + FAKT 05; rámec nezávislého monitora FLA se
  mapuje na deklarace nezávislosti FAKTU 06.
- **Higg Index (Sustainable Apparel Coalition).** Výstupy na
  úrovni zařízení Higg FEM (Facility Environmental Module) a Higg
  FSLM (Facility Social & Labor Module) mohou být zapečetěny v
  rámci této sady.
- **EU CSRD / CSDDD.** Směrnice EU o reportování udržitelnosti
  podniků a Směrnice o náležité péči podniků v oblasti
  udržitelnosti vytvářejí povinnosti zveřejnění, jejichž
  verifikační dokumenty mohou být zapečetěny v rámci této sady.
  Sada kotví zveřejnění-jak-vydáno, nikoli jeho věcnou
  přiměřenost.

## Co tato sada NENAHRAZUJE

- Monitorování vedené pracovníky (nejspolehlivější signál detekce
  zneužívání v jakémkoli dodavatelském řetězci)
- Nezávislá vyšetřování NGO (CCC, Labour Behind the Label, China
  Labour Bulletin, Workers' Rights Consortium atd.)
- Regulační inspekce (národní úřady práce, ekvivalenty OSHA,
  programy národních úřadů ILO)
- Organizování pracovníků a kolektivní vyjednávání
- Soudní spor, arbitráž a nápravu podle vnitrostátního pracovního
  práva
- Rámce náležité péče na straně značky (UNGP, OECD Due Diligence
  Guidance, EU CSDDD)

## Licence

Veřejná doména (CC0). Forkněte. Atribuce není vyžadována.
