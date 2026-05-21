*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pečetí pro atestaci uhlíku

Hotová příkladová sada myriam-kit pro vývojáře uhlíkových projektů,
nezávislé verifikátory třetích stran a registry, kteří chtějí
zveřejnit pečeť s ukotvením v Bitcoinu odolnou vůči manipulaci pro
událost vydání uhlíkového kreditu, ověření odstranění nebo atestace
emisí v přesném okamžiku certifikace — aby tiché pozdější úpravy po
vydání byly veřejně zjistitelné.

---

## Co tato sada NEDĚLÁ (čtěte první)

Uhlíkové kredity jsou politicky i vědecky sporné. Pečeť je
kryptografické časové razítko toho, co bylo atestováno. Nemůže
ověřit, zda to, co bylo atestováno, odráží skutečný klimatický
přínos. Následující režimy selhání jsou **mimo doménu pečeti** a
představují většinu významných otázek integrity uhlíkových
kreditů:

1. **Dodatečnost (Additionality).** Pečeť nemůže ověřit, že
   započítaná aktivita by se neuskutečnila bez uhlíkového
   financování. Kontrafaktická situace je principiálně
   nepozorovatelná. Pečeť zaznamenává argument metodologie ohledně
   dodatečnosti; nerozhoduje o něm.

2. **Permanence (Permanence).** Pečeť nemůže ověřit, že sekvestrovaný
   uhlík zůstane sekvestrován po relevantním časovém horizontu
   (desetiletí až staletí pro lesní uhlík, geologické časové měřítko
   pro některé formy odstranění). Nedávná literatura (Badgley et al.
   2022, Patterson et al. 2022) ukazuje, že nárazníkové fondy
   (buffer pools) byly podstatně vyčerpány skutečnými událostmi
   zvratu. Zapečetěný kredit je zapečetěné *tvrzení* o permanenci
   za stanovených předpokladů nárazníkového fondu, nikoli důkaz
   permanence.

3. **Únik (Leakage).** Pečeť nemůže ověřit, že emise, jimž bylo
   v oblasti projektu zabráněno, nejsou jednoduše přemístěny do
   oblasti mimo projekt. Metodologicky výchozí odpočty úniku jsou
   regulatorní zástupné hodnoty, nikoli měření. Pečeť kotví použitý
   odpočet; necertifikuje jej jako správný.

4. **Spolupřínosy (Co-benefits).** Pečeť nemůže ověřit tvrzení
   o rozvoji komunity nebo biodiverzitě. Spolupřínosy jsou
   typicky samodeklarované a přezkoumané verifikátorem, nikoli
   auditované v hloubce kvantifikace uhlíku. Pečeť kotví hashe
   dokumentů; nic víc.

5. **Dostatečnost svobodného, předchozího a informovaného souhlasu
   (FPIC).** Souhlas původních obyvatel a komunit v uhlíkových
   projektech má zdokumentovanou historii režimů selhání (vynucený
   souhlas, souhlas od nereprezentativních orgánů, dodatečný
   „souhlas" prostřednictvím kompenzace). Pečeť kotví dokumentaci
   FPIC a hashe protokolu stížností; nemůže certifikovat, že proces
   souhlasu byl skutečný.

6. **Nezávislost verifikátora.** Verifikátoři jsou placeni vývojáři
   projektů. Toto je strukturální střet zájmů, který žádné
   akreditační schéma nevyřešilo. Pečeť kotví prohlášení verifikátora
   o nezávislosti; necertifikuje, že toto prohlášení je pravdivé.

7. **Dvojí započítání mezi registry nebo s národními inventáři.**
   Pečeť kotví snímek stavu registru v okamžiku atestace. Pokud je
   tatáž aktivita započítána i hostitelskou zemí do jejího NDC nebo
   nárokována i v jiném registru, pečeť činí stav registru
   porovnatelným, ale nezabraňuje dvojímu započítání.

8. **Správnost tvrzení kupujícího.** Kupující, který vyřadí
   zapečetěný kredit na podporu tvrzení o „čistých nulových emisích"
   nebo „uhlíkové neutralitě", činí navazující tvrzení, které pečeť
   nepokrývá. Pečeť zaznamenává vyřazení; platnost marketingového
   tvrzení kupujícího je oddělená, navazující otázka.

9. **Správnost metodologie.** Pečeť zaznamenává citaci metodologie
   + hash dokumentu platného v okamžiku atestace. Netvrdí, že
   metodologie je vědecky platná. Reforma metodologie nastává;
   zapečetění podle metodologie, která je později revidována,
   nečiní kredity zpětně „špatnými" nebo „správnými" — kotví
   pravidla, která platila při vydání.

**Výše uvedená sekce poctivých omezení je nosnou částí této sady.**
Téměř každá významná otázka integrity uhlíkového kreditu spadá do
jednoho z těchto devíti rámců. Pečeť uzavírá úzkou zbývající
mezeru: tichou zpětnou modifikaci bytů v záznamu. Tato mezera je
reálná a stojí za uzavření, ale je malá v porovnání se sporným
terénem.

---

## Co tato sada MUSÍ ODMÍTNOUT zapečetit

Sada je nakonfigurována tak, aby odmítla následující vzorce faktů,
i když je předloží uživatel s platným podpisovým oprávněním:

- **„Dodatečnost" uvedená jako fakt.** Zapečetění dodatečnosti jako
  faktu vytváří zavádějící záznam. Sada přijímá metodologicky
  konformní *argumenty* dodatečnosti, nikoli *tvrzení* o
  dodatečnosti.
- **„Permanence" bez explicitního zveřejnění časového horizontu a
  nárazníkového fondu.** Zapečetění permanence bez těchto parametrů
  zakrývá, k čemu se projekt skutečně zavazuje.
- **„Žádný únik" bez měření specifického pro projekt.**
  Metodologicky výchozí odpočty úniku nejsou měření a pečeť s nimi
  tak nebude zacházet.
- **Kvantifikace vygenerované před dokončením verifikace třetí
  stranou.** Pečeť před verifikací vytváří falešně pozitivní
  „ověřený" záznam.
- **Záznamy o vydání pro kredity vydávané i v jiném registru bez
  explicitního zveřejnění napříč registry** ve FAKTU 06.
- **Záznamy o vyřazení, které neuvádějí příjemce vyřazení.**
  Anonymní vyřazení podkopává veřejný účel vyřazení; sada to
  odmítá umožnit.
- **Tvrzení o FPIC nepodložená atestovatelnými hashi dokumentace.**
- **Vydání podle článku 6.2 / 6.4 bez hashe pověřovacího dopisu
  hostitelské země (LoA)** zapečetěného ve FAKTU 06.
- **Pečetění na žádost jakékoli strany jiné než vývojáře projektu
  + verifikátora společně** pro daný projekt.
- **Tvrzení o spolupřínosech zapečetěná jako „certifikovaná"**,
  pokud jsou pouze „samodeklarovaná a přezkoumaná verifikátorem".

Samo odmítnutí může být zapečetěno jako fakt („Tato strana
požádala o zapečetění X; sada to odmítla podle pravidla odmítnutí
Y"), čímž vzniká veřejný záznam pokusu o zneužití.

---

## Co tato sada zapečeťuje

8 faktů v okamžiku atestace:

1. **Oznámení o příkladu** — deklaruje publikaci jako příklad
   (skutečné atestace toto odstraňují nebo nahrazují).
2. **Identifikace projektu** — název projektu, registr, ID projektu
   v registru, citace metodologie + hash, hash geografické hranice,
   ročník, vývojář projektu, tvrzení o spolupřínosech, status FPIC.
3. **Kvantifikace emisí nebo odstranění** — hrubé tuny CO2e,
   základní kontrafaktická situace, odpočet úniku, příspěvek do
   nárazníkového fondu, odpočet nejistoty, čisté započitatelné
   tvrzení, hashe každého číselného vstupu.
4. **Metodologie měření** — zdroje dat dálkového průzkumu, síť
   pozemních referenčních ploch, hash protokolu kalibrace přístrojů,
   hash klasifikačního modelu + statistiky přesnosti, model hustoty
   uhlíku, provenience kódu + manifest reprodukovatelnosti.
5. **Verifikace třetí stranou** — verifikační organizace, akreditace,
   hash prohlášení o nezávislosti, předchozí zakázky s vývojářem,
   hash archivu fotografií z prohlídky lokality, vznesené + vyřešené
   nálezy, hash dokumentu verifikačního stanoviska.
6. **Záznam o vydání nebo vyřazení** — žádost o vydání + schválení,
   celkový počet vydaných kreditů, sériový rozsah, prohlášení napříč
   registry, hash LoA hostitelské země, je-li relevantní, sériové
   rozsahy vyřazení + příjemci (pro atestace vyřazení), hashe
   snímku stavu registru.
7. **Doprovodná zveřejnění a záznam odmítnutí** — probíhající
   metodologické spory, riziko nepermanence, výhrady k úniku,
   výhrady k dodatečnosti, hashe FPIC + protokolu stížností,
   výhrada ke spolupřínosům, předchozí zakázka verifikátora;
   explicitní seznam vzorců, které sada odmítla zapečetit.
8. **Podepisující principál** — vývojář projektu + verifikátor +
   registr, každý s rolí + rozsahem atestace + informací
   o kryptografickém klíči.

Každý fakt končí konvencí brány odmítnutí: *„Tento fakt tvrdí
pouze X. Netvrdí Y"* (kde Y je nejbližší režim selhání ze sekce
„NEDĚLÁ" výše).

---

## Proti čemu tato sada chrání

- **Tiché pozdější úpravy kvantifikace po vydání.** Jakákoli
  celočíselná změna FAKTU 03 produkuje jiný SHA-256, jiný kořen
  Merkleho stromu, selže ověření OTS.
- **Tichá substituce metodologie.** FAKT 02 zmrazuje citaci
  metodologie + hash dokumentu při vydání. Záměna jiné verze
  metodologie registrem po vydání je veřejně porovnatelná.
- **Tichá revize základní linie.** Hash výstupu modelu základního
  scénáře z FAKTU 03 je zapečetěn. Dodatečné přeladění základní
  linie pro produkci více kreditů je detekovatelné.
- **Tichá substituce stanoviska verifikátora.** Hash dokumentu
  stanoviska z FAKTU 05 je zapečetěn. Přepis „verifikátor vždy
  říkal X" po vydání je detekovatelný.
- **Tiché zmizení záznamu o vyřazení.** Snímek stavu registru
  z FAKTU 06 je zapečetěn. Kredity, které se záhadně stanou znovu
  „dostupnými" poté, co byly označeny jako vyřazené, jsou
  detekovatelné oproti pečeti.
- **Tichá substituce dokumentu FPIC.** Hashe FPIC + protokolu
  stížností z FAKTU 07 jsou zapečetěny. Nahrazené dokumenty
  o souhlasu jsou detekovatelné.
- **Tiché odstranění nepříjemných zveřejnění.** Status doprovodných
  zveřejnění z FAKTU 07 je zapečetěn. Tichá deletace výhrady
  k nepermanenci ze stránky popisu projektu je detekovatelná oproti
  zapečetěným bytům.

Sada NECHRÁNÍ proti základním otázkám integrity (dodatečnost,
permanence, únik, dostatečnost FPIC, nezávislost verifikátora,
platnost metodologie). To jsou těžší problémy a pečeť je nemůže
vyřešit.

---

## Historické nebo téměř-historické případy, ve kterých by sada pomohla

Sada by produkovala užitečné ukotvení — *nikoli nápravu* — v
případech zahrnujících tichou zpětnou modifikaci záznamů
uhlíkových atestací. NEVYŘEŠILA by základní sporné otázky v žádném
z těchto případů.

- **Vyšetřování Guardianu / Die Zeit / SourceMaterial z roku 2023
  ohledně dešťových pralesních kreditů Verra.** Vyšetřovatelé
  zjistili, že většina studovaných projektů REDD+ produkovala
  kredity, jejichž tvrzené odvrácené emise neodpovídaly pozdější
  reanalýze dálkového průzkumu. Vyšetřování vyžadovalo
  rekonstrukci projektové dokumentace oproti zpětně upraveným
  záznamům registru. Zapečetěná publikace v každém cyklu vydání by
  poskytla jednoznačné referenční byty toho, co bylo atestováno
  v každém cyklu — nikoli nápravu pro základní problém základní
  linie, ale čistou forenzní časovou osu.

- **Události zvratu kalifornských lesních offsetů z roku 2020.**
  Více lesních uhlíkových projektů v rámci kalifornského trhu
  s povinnou účastí utrpělo zvraty způsobené požáry, které
  přesáhly rezervu nárazníkového fondu vyhrazenou pro ně.
  Rekonstrukce toho, co každý projekt atestoval ohledně rizika
  nepermanence *při vydání* (oproti tomu, co projekt později
  tvrdil, že atestoval), je v současnosti obtížná. Pečeti za každý
  ročník by učinily atestace před požárem kanonicky obnovitelnými.

- **Různé projekty REDD+, kde byly metodologie základních linií
  referenčních regionů zpětně kritizovány jako nadhodnocené.**
  Zapečetěný hash dokumentu metodologie v době vydání by ukotvil,
  která verze metodologie skutečně platila pro který ročník, čímž
  by byla obrana „metodologie byla vždy X" porovnatelná.

- **Několik sporů ohledně projektů obnovy vyvolané člověkem
  v rámci jednotek Australského uhlíkového kreditu (ACCU) (2022–
  2023).** Akademická kritika toho, zda obnova byla skutečně
  vyvolána projektem nebo přirozená, vedla ke sporům o tom, co
  projekt původně tvrdil. Zapečetěné atestace by poskytly
  jednoznačné záznamy za každý ročník.

- **Záznamy o vyřazení uhlíkových offsetů, které změnily stav.**
  Několik zdokumentovaných případů záznamů o vyřazení v registrech
  dobrovolného trhu, které zjevně mění stav po vyřazení (stávají
  se „vyřazenými" z jiného důvodu nebo jsou přiřazeny jinému
  příjemci dodatečně). Pečeti za každé vyřazení by ukotvily stav
  v okamžiku původního vyřazení.

V žádném z těchto případů by sada nevyřešila, zda základní kredit
představoval skutečný klimatický přínos. Sada kotví záznamy; to je
vše, co dělá.

---

## Kdy tuto sadu použít

- Jste vývojář projektu, který chce zveřejnit atestaci odolnou vůči
  manipulaci společně se standardním podáním do registru.
- Jste verifikátor třetí strany, který chce, aby vaše verifikační
  stanovisko bylo veřejně ověřitelné oproti pozdější reprezentaci
  registru toho, „co verifikátor řekl".
- Jste registr, který chce poskytnout další vrstvu integrity nad
  záznamy o vydání a vyřazení — zejména pro projekty v
  jurisdikcích se slabšími právními zárukami integrity registru.
- Jste novinář, akademik nebo NNO, který provádí víceletou
  longitudinální analýzu uhlíkových projektů a potřebuje veřejné
  ukotvení k porovnání pozdějších reprezentací projektu oproti
  jeho bytům z doby vydání.
- Jste kupující (firemní čisté nuly, soulad leteckých společností),
  který chce, aby kredity, které vyřazujete, byly vyřazovány oproti
  veřejně ukotveným záznamům, aby vaše navazující marketingové
  tvrzení mohlo být auditováno oproti stabilní forenzní časové ose.

## Kdy tuto sadu NEPOUŽÍVAT

- **Nepoužívat jako náhradu za akreditovanou verifikaci třetí
  stranou.** Pečeť nenahrazuje verifikaci ISO 14064-3; skládá se
  s ní.
- **Nepoužívat k tvrzení, že projekt je „dodatečný", „permanentní"
  nebo „s nízkým únikem".** Pečeť nemůže ověřit tyto vlastnosti.
  Použití pečeti k jejich tvrzení je zneužitím.
- **Nepoužívat jako legitimizační divadlo pro nekvalitní kredity.**
  Kryptografická pečeť na nekvalitním kreditu je permanentní
  forenzní záznam nekvality, nikoli obrana proti ní. Tato primitiva
  funguje oběma směry; v tom je její poctivost.
- **Nepoužívat k pečetění kreditů, které jsou rovněž započítávány
  hostitelskou zemí do jejího NDC** bez explicitního zveřejnění
  odpovídající úpravy ve FAKTU 06.
- **Nepečetit před verifikací.** Pečeť před tím, než je stanovisko
  verifikátora konečné, vytváří falešně pozitivní „ověřený"
  záznam.
- **Nepoužívat pod tlakem na vynechání doprovodného zveřejnění
  faktu ve FAKTU 07** (probíhající metodologické spory, problémy
  FPIC, předchozí zakázka verifikátora). Odmítněte a zapečeťte
  odmítnutí.
- **Nepoužívat jako marketingový odznak.** „MYRIAM-zapečetěno"
  není tvrzení o kvalitě; je to forenzní vlastnost. Zacházení
  s tím jako s odznakem kvality je přesně to zneužití, kterému se
  design založený na omezeních snaží předejít.

## Jak rozštěpit tuto sadu pro skutečnou atestaci

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Kritické načasování:** pečeťte V okamžiku nebo PO oficiální
události vydání registru, NIKOLI před. Pečeť před vydáním vytváří
falešně pozitivní „vydaný" záznam. U atestací vyřazení pečeťte
V okamžiku vyřazení. U průběžných monitorovacích atestací mezi
vydáním a vyřazením pečeťte v každém monitorovacím cyklu
podepsaném verifikátorem — ale ve FAKTU 01 jasně uveďte, že
atestace je monitorovací aktualizace, nikoli vydání.

## Integrace se stávající uhlíkovou infrastrukturou

- **Verra (VCS).** URL zapečetěné publikace nebo IPFS CID lze
  připojit k stránce projektu VCS jako doplňkovou dokumentaci.
  Pečeť nenahrazuje verifikaci VCS; skládá se s ní.
- **Gold Standard.** Stejný integrační model — doplňková atestace
  vedle dokumentace o vydání Gold Standard. Důraz Gold Standard
  na spolupřínosy + dokumentaci přínosů komunity přirozeně
  mapuje na FAKT 02 + FAKT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Stejný integrační model.
- **Článek 6.4 (mechanismus Dohlížecího orgánu Pařížské dohody).**
  Hash LoA hostitelské země ve FAKTU 06 je specificky navržen pro
  sledovatelnost ITMO podle článku 6.4 / 6.2. Zveřejnění
  odpovídající úpravy je pole s bránou odmítnutí.
- **EU ETS MRV.** Pro emitenty v rámci trhu s povinnou účastí
  hash zprávy MRV mapuje na hash kvantifikační tabulky z FAKTU 03.
  Pečeť se skládá s — nenahrazuje — provozovatelovu ověřenou
  zprávu o emisích.
- **CDP (Carbon Disclosure Project) firemní zveřejnění.** Pro
  korporace citující vyřazené kredity v podáních CDP je záznam
  o vyřazení zapečetěný ve FAKTU 06 kanonickým obnovitelným
  záznamem. Jazyk podání CDP může odkazovat na kořen Merkleho
  stromu nebo IPFS CID zapečetěné publikace.
- **ISO 14064-2 (projekt) / ISO 14064-3 (verifikace) / ISO 14065
  (akreditace).** Pečeť zaznamenává prohlášení o shodě + hashe;
  neprovádí posouzení shody.
- **Štítky TSVCM Core Carbon Principles (CCP) / ICVCM.** Pokud
  byl projekt posouzen oproti CCP ICVCM, hash výsledku posouzení
  může být zapečetěn ve FAKTU 07 jako doprovodné zveřejnění.

## Co tato sada NENAHRAZUJE

- Akreditovanou verifikaci třetí stranou (ISO 14064-3)
- Pracovní postupy vydání a vyřazení v registru
- Posouzení souladu s metodologií
- Procesy autorizace hostitelské země pro transakce podle článku 6
- Procesy MRV trhu s povinnou účastí (EU ETS, kalifornský
  Cap-and-Trade, RGGI atd.)
- Iniciativy integrity dobrovolného trhu (ICVCM, VCMI)
- Nezávislé posouzení klimatického dopadu

## Proč tato sada existuje od v0.4.0+

Toto je 7. zpracovaný příklad dodávaný s myriam-kit. Sada existuje,
protože trhy s uhlíkovými kredity mají dobře zdokumentovanou
historii tichých zpětných úprav — metodologií, které jsou zpětně
reinterpretovány, základních linií, které jsou zpětně revidovány,
záznamů o vyřazení, které mění stav, a projektových zveřejnění,
která časem tiše opouštějí nepříjemné výhrady.

Pečeť uzavírá *úzkou* mezeru bytů v okamžiku atestace. Neřeší — a
nemůže řešit — širší sporné otázky dodatečnosti, permanence, úniku
nebo autenticity spolupřínosů. Poctivé zarámování tohoto omezení
v sadě je její nejdůležitější vlastností.

## Licence

Veřejná doména (CC0). Rozštěpte ji. Žádné uvedení autora není
vyžadováno.
