*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pro zapečetění atestace veřejných výdajů

Hotová ukázková sada myriam-kit pro městské, krajské, provinční a
národní vlády, které chtějí kryptograficky zakotvit záznamy o
plnění rozpočtu (zadané zakázky, výplaty, převzetí dodávek) v
okamžiku jejich vydání, aby se tiché zpětné úpravy záznamů o
veřejných výdajích staly veřejně zjistitelnými.

Pečeť je **forenzní kotvou**, nikoli certifikací integrity.
Zaznamenává, co finanční orgán nahlásil v den, kdy to nahlásil, v
podobě, kterou nelze později tiše revidovat, aniž by vznikl
veřejně viditelný kryptografický rozpor.

---

## Co tato sada NEDĚLÁ (přečtěte si nejprve)

Pečeť je kryptografickým časovým razítkem toho, co bylo
attestováno. Nemůže ověřit, zda to, co bylo attestováno, bylo
**zákonné, spravedlivé nebo poctivé**. Následující selhání jsou
**mimo doménu pečetě**:

1. **Korupce na vstupu a úplatky.** Pokud bylo výběrové řízení
   zmanipulováno, dodavatel byl vybrán kvůli úplatku, odůvodnění
   jediného zdroje bylo zfalšováno nebo cena zakázky byla nadsazena
   o domluvené procento úplatku — pečeť zakotví transakci tak, jak
   byla zaznamenána, s nadsazenou cenou a zvýhodněným dodavatelem ve
   vysoké integritě. Pečeť pozoruje výstup finančního systému; nemá
   žádnou viditelnost do korupce na vstupu před vydáním. Brazilská
   *Operação Lava Jato* zdokumentovala systematické ~3% úplatky
   spravované kartelem napříč tisíci zakázek Petrobras, které by
   byly v okamžiku vydání zapečetěny, jako by byly zcela rutinní.

2. **Krycí firmy zakrývající skutečné vlastnictví.** Zakázka udělená
   firmě „Acme Construction Ltd." je zapečetěna pod jménem entity z
   veřejného rejstříku. Pokud je „Acme" ve skutečnosti ovládána
   nezveřejněnou politicky exponovanou osobou nebo je jednou z
   desítek krycích firem ovládaných jediným kartelem, pečeť zakotví
   povrchovou entitu. Transparentnost skutečného vlastnictví je
   SAMOSTATNÝM režimem (Doporučení FATF 24, EU 5AMLD/6AMLD, US
   Corporate Transparency Act), jehož výstup vyžaduje vlastní
   pečetící protokol.

3. **Účetní podvod před vydáním.** Pokud finanční orgán sám
   zfalšuje záznam, než je zapečetěn — fantomové zakázky, mrtvé duše
   na výplatní pásce, fiktivní převzetí dodávek — pečeť zakotví
   zfalšování. Pečeť nemůže odhalit, že záznam je nepravdivý v
   okamžiku jeho pořízení; může pouze odhalit, že záznam byl změněn
   PO zapečetění.

4. **Selektivní zveřejnění / vybírání rozinek.** Finanční orgán by
   mohl zveřejnit *podmnožinu* transakcí — ty čisté — a zapečetit
   pouze je. Pečeť zakotví to, co je v publikaci; nezakotví
   univerzum transakcí, které měly být v publikaci. FAKT 07 této
   sady (doprovodná zveřejnění a záznam odmítnutí) je strukturální
   obranou, ale závisí na tom, že vydávající orgán je upřímný o
   tom, co se rozhodl nezapečetit.

5. **Mimoknižní nebo mimorozpočtové výdaje.** Veřejné výdaje
   procházející státními podniky, suverénními investičními fondy,
   účelovými vozidly nebo mimorozpočtovými svěřenskými účty se
   nemusí objevit v rozpočtu, který pečeť zakotvuje. Pečeť
   zaznamenává, co bylo nahlášeno uvnitř rozpočtového systému;
   výdaje mimo systém jsou mimo doménu pečetě. Spory týkající se
   irácké Coalition Provisional Authority (CPA) v letech 2003–2004
   se týkaly přibližně 9 miliard USD v hotovostních výplatách,
   jejichž záznamy byly částečně ztraceny; zapečetění toho, jaké
   záznamy existovaly v okamžiku výplaty, by je zakotvilo, ale
   nevytvořilo by záznamy, které CPA neudržovala.

6. **Tlak na „vysvětlení" po vydání.** Zapečetěný překročený
   rozpočet, zapečetěná zakázka z jediného zdroje nebo zapečetěná
   změna zakázky mohou být později převyprávěny jakýmkoli rámcem,
   který si politická autorita přeje. Pečeť zakotvuje FAKTA k
   datu vydání, ale nepředjímá narativ, který tato fakta později
   podpoří.

7. **Vynucené attestace.** Pokud je odpovědný finanční principál
   donucen podepsat attestaci, která zkresluje transakce, pečeť
   zakotví vynucenou attestaci s vynuceným podpisem. Pečeť ověřuje,
   KDO podepsal (FAKT 08), nikoli PROČ podepsal. Zapečetění vynucené
   attestace vytváří trvalý veřejný záznam o vynuceném výstupu —
   užitečný pro pozdější odpovědnost, ale není obranou proti
   donucení v daný okamžik.

8. **Srovnání napříč jurisdikcemi.** Zapečetěný výdaj je čitelný
   pouze proti právnímu režimu jurisdikce, která jej vydala. „Proč
   obec X zaplatila Y za službu Z, když obec W zaplatila pouze V?"
   je otázkou srovnávací analýzy navazující na zapečetění.
   Srovnávání napříč jurisdikcemi je analytickým úkolem nad
   zapečetěnými daty, nikoli vlastností pečetě.

**Sekce o čestných hranicích výše je nosnou částí této sady.**
Finanční úředníci a politici, kteří věří, že zapečetění se rovná
integritě, budou používat tuto sadu jako štít. Sada musí říci
jasně: toto je *primitivum neodvolatelnosti pro okamžik vydání*,
nikoli důkaz integrity výdajů.

---

## Co tato sada MUSÍ ODMÍTNOUT zapečetit

Sada je nakonfigurována k odmítnutí následujících vzorců faktů, i
když je odešle uživatel s platnou pravomocí podpisu:

- **Jednotlivá jména vládních zaměstnanců pod úrovní podepisujícího
  principála.** Žádný fakt nesmí jmenovat jednotlivé zaměstnance
  zakázkové kanceláře, jednotlivé pokladní úředníky, jednotlivé
  členy hodnotící komise ani žádnou fyzickou osobu mimo veřejně
  exponovanou roli odpovědnosti. Riziko vystavení odvetě pro řadové
  zaměstnance převyšuje přínos transparentnosti; jejich identity
  jsou pečetěny v interních kontrolách (FAKT 05 hash protokolu o
  schválení), nikoli v těle attestace.

- **PII dodavatele.** Žádný fakt nesmí obsahovat čísla bankovních
  účtů dodavatelů, jednotlivá jména zaměstnanců dodavatelů, domácí
  adresy dodavatelů, daňová ID fyzických osob dodavatelů, vnitřní
  rozpis cen obsahující nákladovou strukturu dodavatele nebo
  jakékoli jiné pole komerčního PII, jehož zveřejnění poškozuje
  zájmy dodavatele bez služby boji proti korupci. Tyto informace
  mohou být HASHOVÁNY (FAKT 05), ale nikoli publikovány.

- **Bezpečnostně utajované výdaje.** Výdaje utajované podle
  statutů národní bezpečnosti NEJSOU způsobilé k zapečetění touto
  sadou. Utajované zacházení je odlišný problém s odlišnými
  kryptografickými a právními požadavky. Samotná výjimka je
  zveřejněna v FAKTU 07 R3, aby čtenář věděl, že publikace je
  záměrně částečná.

- **Civilní vymáhání daňových povinností vůči identifikovaným
  fyzickým osobám.** Přestože jsou náklady na vymáhání veřejnými
  výdaji, jmenování jednotlivých daňových poplatníků pod vymáháním
  je odmítáno: újma na soukromí převyšuje přínos transparentnosti
  a paralelní transparentnost existuje v rámci daňového soudního
  výkaznictví.

- **Předvydávací transakce.** Žádná zakázka před formálním
  udělením; žádná výplata před formálním vydáním. Zapečetění návrhu
  zakázky nebo nevyřízené platby, jako by byly provedeny, vytváří
  falešnou jistotu.

- **Zapečetění kýmkoli jiným než odpovědným finančním principálem.**
  Dodavatel, prodejce, člen zastupitelstva, novinář nebo pozorovatel
  nemůže zapečetit „záznam veřejných výdajů" namísto finančního
  orgánu, který jej vydal. (Mohou zapečetit svá vlastní pozorování
  pod svým vlastním principálem v samostatné publikaci.)

- **Rámcování „bez korupce".** Sada odmítá zapečetit jakékoli
  rámcování formy „tento výdaj byl zákonný a bez korupce" nebo
  „zakázka byla prokazatelně spravedlivá". Takové nároky jsou
  epistemicky mimo doménu sady.

- **Publikace, které vynechávají doprovodná zveřejnění FAKTU 07.**
  Publikace transakcí bez doprovodného záznamu o zveřejnění a
  odmítnutí není legitimní publikací MYRIAM podle této sady.

Samotné odmítnutí může být zapečetěno jako fakt („Tato strana
požádala o zapečetění X; sada odmítla podle pravidla odmítnutí Y"),
čímž vzniká veřejný záznam o pokusu o zneužití. V doméně, kde je
zdokumentován politický tlak na finanční úředníky, je záznam
*odmítnutých* žádostí sám o sobě signálem integrity.

---

## Co tato sada ZAPEČETÍ

8 faktů v okamžiku attestace plnění rozpočtu:

1. **Upozornění na příklad** — prohlašuje publikaci za příklad
   (skutečné attestace toto odstraňují nebo nahrazují).
2. **Jurisdikce a právní základ** — která vládní entita vydává, pod
   jakou statutární pravomocí, v jakém fiskálním období.
3. **Odkaz na rozpočtovou položku nebo rozpočet** — konkrétní
   řádky v přijatém rozpočtu, které jsou plněny, s hashi rozpočtového
   nástroje a všech aplikovaných změn / převodů / přerozdělení.
4. **Manifest zakázek nebo výplat** — záznam o jednotlivých
   transakcích: částka, právní jméno entity dodavatele (žádné
   individuální PII), účel, datum, typ zakázky, základ udělení,
   hash dokumentu zakázky.
5. **Hashe podpůrných dokumentů** — SHA-256 vyhlášení, hodnocení,
   uzavřených smluv, změnových objednávek, žádostí o platbu,
   formulářů o převzetí dodávek, položek pokladní účetní knihy,
   protokolů o schválení kontrol. Pouze hashe, nikoli obsah — pro
   ochranu komerčního a osobního PII a zároveň umožnění ověření
   přepočtem hashe.
6. **Stav auditu a dohledu** — který orgán generálního inspektora má
   jurisdikci, která nejvyšší auditní instituce, který státní
   zastupitelský orgán má jurisdikci nad korupčními trestnými
   činy, termíny auditu, aktuální stav jakékoli probíhající revize.
7. **Doprovodná zveřejnění a záznam odmítnutí** — nevyřízené
   zakázkové protesty, nevyřízená interní vyšetřování, nevyřízené
   žádosti o informace, nesouhlasné revize, známé překročení
   rozpočtových položek; explicitní seznam vzorců, které sada
   odmítla zapečetit.
8. **Podepisující principál** — odpovědný finanční úředník + role +
   statutární odpovědnost + spolusignatáři pod dvojí kontrolou; co
   každý signatář osobně atestuje a co neatestuje.

Každý fakt končí konvencí odmítací brány: *„Tento fakt tvrdí pouze
X. Netvrdí Y"* (kde Y je nejbližší selhání ze sekce „NEDĚLÁ").

---

## Proti čemu tato sada chrání

- **Tichá revize částek zakázek po vydání.** Jakákoli změna jakékoli
  částky ve FAKTU 04 produkuje jiné SHA-256, jiný Merkle root,
  selže ověření OTS.
- **Tichá záměna dodavatele.** Nahrazení „Dodavatele A" za
  „Dodavatele B" v již vydané zakázce je detekovatelné ze
  zapečetěných bajtů.
- **Zpětné datování změnových objednávek.** FAKT 04 zmrazuje datum
  změnové objednávky a její odůvodnění při vydání; jakékoli pozdější
  tvrzení „to byl vždy dohodnutý rozsah" se musí potýkat se
  zapečetěným záznamem změnové objednávky.
- **Tiché zmizení nepříznivých transakcí.** Všechny transakce
  vydané v daném období jsou ve FAKTU 04 pod jedním Merkle rootem.
  Publikace podmnožiny je detekovatelná ze seznamu hashů listů.
- **Potlačení doprovodných zveřejnění.** FAKT 07 zmrazuje stav
  nevyřízených protestů, vyšetřování a nevyřízených žádostí o
  informace v okamžiku attestace. Jakékoli pozdější tvrzení „o tom
  protestu jsme nikdy neslyšeli" je veřejně diffovatelné.
- **Posun jurisdikce auditu.** FAKT 06 zmrazuje, které orgány mají
  jurisdikci dohledu nad zapečetěnými transakcemi. Pozdější tvrzení,
  že konkrétní generální inspektor „neměl pravomoc", se musí potýkat
  se zapečetěným záznamem jurisdikce.
- **Vymazání záznamu odmítnutí.** FAKT 07 zaznamenává, co sada
  odmítla zapečetit; jakékoli pozdější tvrzení „nikdy jsme nic
  neodmítli" je v rozporu se zapečetěným záznamem.

---

## Historické případy, kterým by sada pomohla

Sada by vytvořila užitečnou **forenzní kotvu** — *nikoli nápravu,
nikoli prevenci, nikoli náhradu trestního stíhání* — ve veřejně
zdokumentovaných případech zahrnujících tichou zpětnou modifikaci
záznamů o veřejných výdajích:

- **Brazílie — *Operação Lava Jato* / linie Petrobras (2014–2021).**
  Brazilští federální státní zástupci zdokumentovali kartel velkých
  stavebních firem, který po více než deset let platil úplatky v
  průměru ~3 % z infrastrukturních zakázek Petrobras a dalších
  federálních zakázek, přičemž úplatky byly směrovány politikům a
  na koordinaci cen samotného kartelu. Zakázky vypadaly při vydání
  rutinně; korupce byla na vstupu před vydáním. Pečetící sada by
  NEZABRÁNILA Lava Jato (úplatky byly zabudovány do ceny PŘED tím,
  než zakázka dosáhla pečetě), ale zakotvila by podmínky zakázky při
  vydání — díky čemuž by pozdější forenzní rekonstrukce „co každá
  zakázka skutečně říkala, když byla podepsána" byla enormně
  levnější. Vyšetřovací náklady Lava Jato byly z velké části náklady
  na opětovné sestavení časových os z nekonzistentních archivovaných
  záznamů.

- **Evropská unie — spory o regionální rozvojové fondy (více
  členských států, 2010–2020).** Výroční zprávy Evropského účetního
  dvora opakovaně identifikovaly materiální chybovost ve výdajích
  evropských strukturálních a investičních fondů (ESIF) a Fondu
  soudržnosti, v některých letech překračující materiální práh.
  Spory o tom, „co bylo skutečně nárokováno" versus „co bylo
  skutečně dodáno" se opakují, protože dokumentace nároků může být
  revidována mezi předložením a auditem. Per-vydávací zapečetění
  MYRIAM nároku tak, jak byl předložen, by zakotvilo obsah každého
  nároku při předložení, oddělující „co příjemce nárokoval v
  daný čas" od „co poaudítní rekonstrukce uzavřela".

- **Irák — výplaty Coalition Provisional Authority (CPA),
  2003–2004.** CPA vyplatila zhruba 9 miliard USD v hotovosti z
  Development Fund for Iraq s dokumentací, kterou Special Inspector
  General for Iraq Reconstruction (SIGIR) a pozdější auditní
  zprávy charakterizovaly jako podstatně neúplnou. Spory o
  výplatních záznamech přetrvávají dvě desetiletí. Zapečetění v
  okamžiku výplaty by nevytvořilo záznamy, které CPA neudržovala —
  ale tam, kde nějaký záznam existoval (ručně psané účetní knihy,
  datovaná oprávnění převodů), by současné zapečetění zakotvilo
  bajtový stav toho záznamu v okamžiku vydání, oddělujíc „záznam v
  daný čas" od „záznamu, jak byl později rekonstruován".

- **Řecko — státní dluh a revize výkaznictví veřejných výdajů
  (2009–2010).** Audity Eurostatu v letech 2009–2010 zdokumentovaly
  podstatné revize dříve vykázaných řeckých fiskálních dat, přičemž
  samotná metodika revize byla zpochybněna. Zapečetění čtvrtletních
  výdajových zpráv v okamžiku původního zveřejnění by učinilo
  *delta* mezi původními a revidovanými zprávami veřejně
  diffovatelnou, místo aby byla rekonstruovatelná pouze srovnáním
  archivů. Pečeť by nezabránila základní metodologické rozepři, ale
  zakotvila by každé vykázané čtvrtletí v okamžiku původní zprávy.

- **Spojené království — pandemické zakázky (2020–2022).** Zprávy
  britského National Audit Office a parlamentního výboru
  identifikovaly zakázkové procesy v letech 2020–2021, ve kterých
  byly zakázky uděleny pod nouzovými ustanoveními se sníženou
  konkurencí a sníženou dokumentací; některé udělené zakázky byly
  později modifikovány, zrušeny nebo vyrovnány. Per-vydávací
  zapečetění každé nouzové zakázky by zakotvilo odůvodnění a
  podmínky udělení v okamžiku udělení, díky čemuž by pozdější
  modifikace byly veřejně viditelným delta místo tiše modifikovaného
  záznamu.

- **Jihoafrická republika — zakázky veřejných podniků éry
  state-capture (~2010–2018).** Zondova komise zdokumentovala
  zakázky u několika státních podniků (Eskom, Transnet, Denel),
  jejichž dokumentace byla různě neúplná, revidovaná nebo
  zpochybněná. Zapečetění každé udělené zakázky při vydání by
  zakotvilo udělený stav záznamu, oddělující výstupy pozdější
  forenzní rekonstrukce od soudobého záznamu.

Sada by NEZABRÁNILA základní korupci v žádném z výše uvedených
případů. V několika případech byl základní problém, že korupce byla
*na vstupu před vydáním* — pečeť zakotvuje korupční zakázku ve
vysoké integritě, což je jiný druh užitečnosti (forenzní kotva pro
pozdější odpovědnost), ale není to totéž jako prevence. V jiných
případech (hotovost CPA, mimorozpočtové výdaje) byl základní
problém ten, že záznamy, které měly být zapečetěny, neexistovaly
nebo nebyly udržovány — sada nemůže vytvořit záznamy, které orgán
nevyprodukoval.

Tyto historické případy jsou jmenovány pouze s odkazem na veřejně
zdokumentovaná zjištění (soudní záznamy, zprávy parlamentních
výborů, publikace auditních orgánů). Žádné tvrzení není činěno o
žádné jednotlivé osobě; zdokumentovaná institucionální zjištění
stojí ve veřejném záznamu.

---

## Kdy tuto sadu použít

- Vaše jurisdikce má zavedený proces výkaznictví plnění rozpočtu a
  chce přidat neměnnou veřejnou kotvu.
- Očekáváte zkoumání po vydání (žádosti o informace, audit,
  monitoring občanské společnosti, novinářské vyšetřování) a chcete
  manipulačně-evidentní referenční bod.
- Máte právní pravomoc podle transparentnostního práva / práva
  otevřených záznamů publikovat uvedenou množinu faktů s
  dodržením soukromostních / bezpečnostních výjimek.
- Působíte pod statutárním auditním režimem (generální inspektor,
  nejvyšší auditní instituce) a chcete zakotvit každý čtvrtletní
  uzávěr před tím, než jej dosáhne auditní cyklus.
- Publikujete podle Open Contracting Data Standard nebo IATI a
  chcete kryptografický doplněk k portálové publikaci.

## Kdy NEPOUŽÍVAT tuto sadu

- **Nepoužívejte jako náhradu za statutární audit, revizi
  generálního inspektora, státní zastupitelské vyšetřování nebo
  monitoring občanské společnosti.** Sada je *aditivní*, nikoli
  náhradou.
- **Nepoužívejte jako certifikát legitimity.** Zapečetěný výdajový
  záznam není certifikát bez korupce. Zacházet s ním jako s
  takovým je přesně to selhání, jemuž má strukturně přednostní
  omezení sady zabránit.
- **Nepoužívejte uprostřed období.** Sada je pro okamžik formálního
  vydání (čtvrtletní uzávěr, udělení zakázky, milníková výplata).
  Pečetě uprostřed období vytvářejí zavádějící referenční body.
- **Nepoužívejte k tvrzení, že výdaj byl zákonný, spravedlivý nebo
  bez korupce** — sada to nemůže udělat.
- **Nepoužívejte k zapečetění utajených výdajů, individuálního
  zaměstnaneckého PII nebo komerčního PII dodavatele.** Sada tyto
  vzorce odmítá; pokus o ně vytváří záznam odmítnutí (FAKT 07).
- **Nepoužívejte k zapečetění předvydávacích návrhů.** Návrhy mohou
  být zapečetěny pod jiným typem attestace („návrh ke komentování,
  nevydáno"), ale ne pod typem vydání této sady.
- **Nepoužívejte pod tlakem na vynechání zveřejnění FAKTU 07.**
  Odmítněte a zapečeťte odmítnutí.
- **Nepoužívejte, pokud je váš finanční orgán zajat.** Zapečetěný
  podvodný výdaj je trvalým veřejným záznamem podvodu, nikoli jeho
  obhajobou. Primitivum jde oběma směry; v tom spočívá jeho
  čestnost.

---

## Jak forknout tuto sadu pro skutečnou attestaci

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Kritické načasování:** zapečeťte V okamžiku formálního vydání —
tj. v okamžiku, kdy odpovědný finanční principál podepíše
čtvrtletní uzávěr, v okamžiku, kdy je zakázka formálně udělena,
nebo v okamžiku, kdy je výplata formálně vydána. Pečeť před
formálním vydáním vytváří falešně pozitivní referenci „toto je
oficiální záznam". Pečeť dlouho po formálním vydání je forenzně
slabší proti mezitímním modifikacím.

**Kadence:** sada je navržena pro čtvrtletní attestace jako
výchozí. Subčtvrtletní kadence (měsíční uzávěr, per-transakční
zapečetění) jsou podporovány opětovným spuštěním s odpovídajícím
rozsahem; pečeť jedné vysokohodnotové transakce je legitimní
použití.

---

## Integrace s existující infrastrukturou veřejných financí

Sada je navržena tak, aby se skládala s, nikoli aby nahrazovala:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Pět publikačních
  bodů (plánování, výzva, udělení, zakázka, implementace) se
  přirozeně mapuje na FAKT 03 (plánování → rozpočtová položka),
  FAKT 04 (výzva, udělení, zakázka, implementace → manifest
  transakcí) a FAKT 05 (hashe podpůrných dokumentů). Samotný export
  OCDS JSON je zapečetěn ve FAKTU 05 (kontrolní dokumenty).
  Jurisdikce provozující publikaci OCDS může přidat zapečetění
  MYRIAM jako kryptografickou vrstvu nad svým existujícím portálem.

- **International Aid Transparency Initiative (IATI) standard
  v2.03.** Pro výdaje financované zcela nebo částečně z externí
  pomoci může být IATI XML zapečetěn jako kontrolní dokument; pečeť
  poskytuje kryptografický doplněk k HTTP-založenému publikačnímu
  modelu IATI Registry.

- **Závazky Open Government Partnership (OGP).** Národní akční
  plány OGP často zahrnují závazky fiskální transparentnosti;
  zapečetění MYRIAM operacionalizuje závazek „manipulačně-evidentní
  publikace" způsobem, který je nezávisle ověřitelný občanskou
  společností bez nutnosti důvěřovat vládnímu portálu.

- **OECD Doporučení o veřejné integritě (2017).** Sada podporuje
  Doporučení 4 (otevřená vládní data o veřejných financích ve
  strojově čitelné, včasné podobě) tím, že činí data kryptograficky
  zakotvenými i strojově čitelnými.

- **Úmluva OSN proti korupci (UNCAC), zejména články 9 (zakázky) a
  13 (účast společnosti).** Sada poskytuje forenzní primitivum,
  které podporuje transparentnostní povinnosti článku 9 a dohled
  občanské společnosti článku 13.

- **Nejvyšší auditní instituce (SAIs) — rámec INTOSAI.** SAIs
  fungující podle standardů INTOSAI (ISSAI) mohou konzumovat
  zapečetěné publikace jako důkaz s vysokou integritou; SHA-256
  hashe ve FAKTU 05 jsou tytéž hashe, které mohou nástroje e-auditu
  SAI přepočítat.

- **Kanceláře generálních inspektorů.** Domácí kanceláře GI s
  jurisdikcí nad zapečetěnými výdaji (FAKT 06) mohou předvolávat
  těla dokumentů, jejichž hashe jsou zapečetěny ve FAKTU 05; pečeť
  váže těla dokumentů obdržená pod předvoláním na těla, která
  existovala při vydání.

- **Statuty o svobodě informací a otevřených záznamech.** Pečeť
  nevyjímá vydávající orgán z pokračujících povinností FOI; ve
  skutečnosti činí selektivní odpověď FOI detekovatelnou jako
  odchylku od zapečetěného záznamu. FAKT 07 C3 zakotvuje
  nevyřízené žádosti FOI v čase attestace.

- **Rejstříky skutečných vlastníků (Doporučení FATF 24, směrnice EU
  AML, US Corporate Transparency Act).** Data o skutečném
  vlastnictví NEJSOU zapečetěna touto sadou (FAKT 04 zdrojuje
  identitu dodavatele pouze z registrovaného jména právní entity).
  Zveřejnění skutečného vlastnictví je samostatný pečetící režim,
  který může produkovat paralelní publikaci odkazovanou Merkle
  rootem.

- **Soudně spravovaná transparentnost (výkaznictví soudních
  výdajů, řízení o navrácení majetku).** Výstupy korupčně
  souvisejících soudních řízení nejsou v rámci této sady, ale mohou
  být zapečetěny pod paralelními typy attestací.

## Co tato sada NENAHRAZUJE

- Statutární audit plnění rozpočtu orgány generálního inspektora
- Revize nejvyšších auditních institucí (GAO, NAO, TCU, CAG, AGN,
  BRH, Cour des comptes, ekvivalent)
- Státní zastupitelské vyšetřování korupčních trestných činů
  (národní protikorupční státní zástupci, orgány článku 36 UNCAC)
- Vyšetřovací reportáže občanské společnosti a novinářů
- Whistleblower kanály a režimy chráněného zveřejnění
- Zveřejnění skutečného vlastnictví
- Mezinárodní vzájemné hodnocení (OECD, IMF Fiscal Transparency
  Evaluation, EU semestr, IATI registr)
- Soudně spravovaná řízení o navrácení majetku

Pečeť je forenzní primitivum, které snižuje náklady a zvyšuje
spolehlivost všech výše uvedených. Není a nemůže být náhradou za
žádné z nich.

---

## Licence

Public domain (CC0). Forkněte to. Není vyžadováno žádné uznání.
