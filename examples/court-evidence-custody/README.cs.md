*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Soudní sada pro zapečetění řetězce úschovy důkazů

Hotová ukázková sada myriam-kit pro týmy forenzního získávání důkazů —
počítačové forenzní examinátory, techniky extrakce mobilních zařízení,
správce důkazů z tělových kamer, vedoucí laboratoří — kteří chtějí
zveřejnit zapečetění zakotvené v Bitcoinu a odolné vůči manipulaci,
prokazující *jaké bajty byly získány* a *kdy*, v okamžiku získání
digitálních důkazů, aby spory o řetězec úschovy měly veřejnou kotvu.

---

## Co tato sada NEDĚLÁ (přečtěte si nejprve)

Pečeť je kryptografickým časovým razítkem KTERÉ FORENZNÍ OBRAZY byly
získány, KDY byly získány, KTEROU AGENTUROU, POD KTERÝM PŘÍKAZEM K
PROHLÍDCE a JAKOU METODIKOU. Nemůže odpovědět na žádnou otázku
týkající se případu nad rámec tohoto. Následující je **mimo doménu
pečetě**:

1. **Přípustnost podle Federal Rules of Evidence (nebo jiného
   důkazního řádu).** Pečeť kotví bajty a časová razítka. Zda jsou
   důkazy přípustné — podle ověření FRE 901, znaleckého svědectví
   FRE 702 / Daubert, vyvažování zaujatosti FRE 403 nebo libovolné
   ekvivalentní normy státního soudu — je otázkou právní procedury.
   Dokonale zapečetěné získání může být stále označeno za nepřípustné;
   nezapečetěné získání může být stále připuštěno. Pečeť je dodatečný
   důkaz integrity, nikoli náhrada za rozhodnutí soudu o přípustnosti.

2. **Zda bylo zabavení zákonné.** Soulad s Fourth Amendment, platnost
   příkazu k prohlídce, dodržení rozsahu, použitelnost exclusionary-
   rule — vše toto leží nad pečetí. Pečeť zaznamenává, že získání
   proběhlo na základě příkazu k prohlídce FICT-SW-2026-0188; zda byl
   příkaz zákonně vydán a zákonně doručen, je věcí soudu.

3. **Zda jsou důkazy usvědčující, ospravedlňující nebo neutrální.**
   Pečeť kotví hashe; interpretace toho, co tyto hashe obsahují,
   patří do forenzní zprávy o vyšetření, která je vlastním dokumentem
   s vlastním discovery a důkazním režimem. Pečeť odmítne zapečetit
   "FAKT N: notebook podezřelého obsahoval usvědčující materiál" —
   viz refusal-rule R4.

4. **Zda je řetězec úschovy procedurálně správný podle příslušného
   důkazního práva státu.** Pečeť zaznamenává soudobý záznam událostí
   úschovy agentury (FAKT 05). Zda tento záznam splňuje požadavky
   konkrétního státu na řetězec úschovy, je věcí soudu při důkazním
   slyšení.

5. **Zda byla forenzní metodika spolehlivá.** Daubert a jeho
   pokračování (a státní obdoby jako Frye, kde stále platí) hodnotí
   metodologickou spolehlivost. Pečeť zaznamenává, KTERÉ nástroje a
   verze byly použity (FAKT 04); zda tyto nástroje splňují standard
   spolehlivosti konkrétního soudu, je věcí soudu. Chyby nástrojů
   byly v minulých případech zdokumentovány až po získání; úlohou
   pečetě je učinit záznam verze-a-binárního-hashe veřejně
   vyvratitelným, nikoli ručit za nástroje samotné.

6. **Zda byly důkazy upraveny PŘED získáním.** Pečeť kotví bajty
   od okamžiku zobrazení dále. Pokud podezřelý, úředník nebo třetí
   strana upravili zdrojové zařízení před jeho zobrazením, pečeť
   to nemůže odhalit — zapečetí upravené bajty se stejnou integritou,
   s jakou by zapečetila původní. Hodnota pečetě začíná v okamžiku
   časového razítka zobrazení.

7. **Zda byl respektován rozsah příkazu k prohlídce.** Příloha
   příkazu definuje, co může být získáno; pečeť zaznamenává, co
   BYLO získáno. Zda získání překročilo rozsah příkazu, je opět
   právní otázkou s vlastním prostředkem nápravy (návrh na potlačení
   podle příslušné procedury státu).

8. **Opětovná identifikace jakékoli soukromé strany vyšetřování.**
   Pečeť odmítá zveřejnit jakékoli jméno, identifikátor nebo otisk,
   který by mohl opětovně identifikovat podezřelého, obžalovaného,
   oběť, svědka nebo obyvatele prostor. Odkaz na soudní spis je
   vhodným úchopem pro strany s aktivní legitimací k nalezení
   případu.

**Sekce o čestných hranicích výše je nosnou částí této sady.**
Forenzní týmy, které věří, že zapečetění se rovná přípustnosti, ji
budou používat jako štít. Sada to musí říci jasně: *toto je primitivum
neodvolatelnosti pro okamžik získání, nikoli důkaz zákonného získání,
metodologické správnosti nebo soudem uznaného řetězce úschovy.*

---

## Co tato sada MUSÍ ODMÍTNOUT zapečetit

Sada je nakonfigurována k odmítnutí následujících vzorců faktů, i když
je odešle uživatel s platnou agenturní pravomocí podpisu:

- **Osobní identifikace podezřelých, obžalovaných, obětí, svědků
  nebo jakékoli soukromé třetí strany.** Odkaz na soudní spis je
  úchopem pro strany s aktivní legitimací; veřejná pečeť nesmí být
  rejstříkem opětovné identifikace.
- **Osobní jména forenzních examinátorů nebo jiných pracovníků
  agentury ve veřejné pečeti.** Role jsou veřejné; vazby osoba-role
  jsou pečetěny zvlášť a dohledatelné soudním procesem.
- **Hashe na úrovni souboru (nebo otisky) podezřelého materiálu
  zobrazujícího sexuální zneužívání dětí, biometrické šablony nebo
  jakákoli data opětovně identifikující zranitelné osoby — dokonce
  ani hashem.** SHA-256 jednotlivého souboru je trvalý vyhledatelný
  identifikátor; jeho zveřejnění ve veřejném registru může opětovně
  poškozovat subjekty prostřednictvím korelace se soukromými
  databázemi. Hashe na úrovni obrazu (úroveň forenzního obrazu)
  celých disků jsou přijatelné; hashe takového materiálu na úrovni
  souboru NIKDY přijatelné nejsou.
- **Závěry, interpretace, názory nebo závěry vyšetření o tom, co
  bajty znamenají.** Pečeť kotví KTERÉ BAJTY byly získány a KDY.
  Interpretace patří do dohledatelné zprávy o vyšetření, nikoli na
  veřejný registr odolný vůči manipulaci.
- **Tvrzení o přípustnosti nebo jakýkoli jiný právní závěr** ("tento
  důkaz je přípustný", "příkaz k prohlídce byl zákonný", "řetězec
  úschovy byl řádný podle §X.Y"). Právní závěry jsou funkcemi soudu.
- **Zapečetění kýmkoli jiným než autorizovaným principálem získávající
  agentury.** Expert obhajoby může sadu použít k zapečetění svého
  vlastního nezávislého ověření manifestu; nesmí zapečetit PŮVODNÍ
  získání pod jménem získávající agentury.
- **Vazby role-jednotlivec uvnitř veřejné pečetě.** Vazby jsou
  zapečetěny v samostatném doprovodném záznamu (hashovaném ve FAKTU
  05) pod přístupovou kontrolou agentury.
- **Vyšetřovací fakty před zabavením nebo před příkazem k prohlídce.**
  Výpovědi informátorů, sledování před vydáním příkazu, vstupy
  parallel-construction — žádný z nich nepatří do pečetě získání.
  Pečeť je vymezena na událost získání.

Odmítnutí samotné může být zapečetěno jako fakt ("Tato agentura
požádala o zapečetění X; sada odmítla podle refusal-rule Y"), čímž
se vytvoří veřejný záznam o pokusu o zneužití.

---

## Co tato sada PEČETÍ

8 faktů v okamžiku získání:

1. **Oznámení o příkladu** — deklaruje publikaci jako příklad
   (skutečná osvědčení toto odstraní nebo nahradí).
2. **Kontext získání** — identifikátor případu, citace příkazu k
   prohlídce, získávající agentura, žádající orgán, datum/čas
   zabavení a získání, místo získání (místo zabavení je redigováno
   na samostatně zapečetěný doprovodný záznam, aby se zabránilo
   opětovné identifikaci prostor).
3. **Manifest důkazů** — pro každou položku forenzního obrazu:
   SHA-256 hash, velikost souboru, anonymizovaný identifikátor
   zdrojového zařízení, metoda získání, formát forenzního obrazu.
4. **Metodika získání** — názvy forenzních nástrojů a přesné verze
   (s hashi binárních souborů nástrojů), výrobce/model write-blockeru
   a firmware, odkaz na ověření NIST CFTT, použitý postup ověření,
   volba formátu obrazu.
5. **Záznam řetězce úschovy** — časová osa události po události od
   počátečního zabavení až po konec zobrazení, kustodi identifikovaní
   ROLÍ (nikoli jménem), s hashi samostatně zapečetěných doprovodných
   záznamů (vazba role-jednotlivec, GPS log přepravy, log přístupu
   k důkazní skříňce, fotografie pečetí proti manipulaci atd.).
6. **Kvalifikace examinátora podle role** — držené certifikace, stav
   dalšího vzdělávání, počet předchozích zkušeností jako znalec,
   expozice Daubertu, zveřejnění střetu zájmů — vše na úrovni role,
   nikoli osobní.
7. **Doprovodná zveřejnění a záznam o odmítnutích** — paralelní
   vyšetřování, probíhající napadení příkazu k prohlídce, návrhy
   na potlačení důkazů, platný protokol privilege-filter / taint-
   team, předchozí pokusy o získání, kontrola bug-trackeru
   dodavatele; explicitní seznam vzorců, které sada odmítla
   zapečetit.
8. **Podepisující principál** — identifikace získávající agentury +
   signatář na úrovni role (vedoucí examinátor) + spolusignatář na
   úrovni role (vedoucí jednotky) + informace o kryptografickém
   klíči.

Každý fakt končí konvencí refusal-gate: *"Tento fakt tvrdí pouze X.
Netvrdí Y"* (kde Y je nejbližší selhání ze sekce "NEDĚLÁ" výše).

---

## Proti čemu se tato sada brání

- **Tichá poúčelová úprava forenzního obrazu.** Jakákoli změna na
  úrovni bajtu v jakémkoli obrazu produkuje jiný SHA-256, a obraz
  po změně se neověří proti zapečetěnému manifestu FAKT 03.
- **Tvrzení, že "byly použity jiné nástroje".** FAKT 04 zaznamenává
  přesné verze nástrojů s hashi binárních souborů nástrojů; pozdější
  tvrzení "ve skutečnosti jsme použili v4.7.0, ne v4.7.1" jsou
  veřejně vyvratitelná.
- **Tvrzení, že write-blocker nebyl zapojen nebo použil jiný model.**
  FAKT 04 zamrazuje manifest write-blockeru.
- **Změna záznamu úschovy.** Jakákoli změna časové osy událostí
  úschovy FAKT 05 (přidání, odebrání nebo přečasování události)
  mění hash FAKTU 05 a je veřejně detekovatelná.
- **Substituce pověření jiného examinátora.** FAKT 06 zamrazuje
  profil pověření na úrovni role v okamžiku získání.
- **Selektivní opomenutí doprovodných zveřejnění.** FAKT 07
  vyjmenovává očekávané kategorie zveřejnění; prázdná kategorie
  musí být explicitně atestována ("nic v okamžiku získání"), takže
  pozdější "nezdálo se nám, že je to relevantní" je veřejně
  vyvratitelné.
- **Po-získání tvrzení, že examinátor měl nezveřejněný střet.**
  Zveřejnění střetu z FAKTU 06 je zamraženo v okamžiku získání;
  pozdější napadení lze testovat proti němu.

Sada se **nebrání** proti soudobé korupci — tým, který v okamžiku
získání úmyslně zapečetí falešná metadata, produkuje kryptograficky
platnou pečeť falešných metadat. Primitivum je k tomu poctivé: je
to primitivum neodvolatelnosti pro soudobá tvrzení agentury, nikoli
důkaz, že tato tvrzení jsou správná.

---

## Historické nebo téměř-historické případy, v nichž by sada pomohla

Sada by produkovala užitečnou kotvu — *nikoli vyřešení* — v minulých
případech, kde se řetězec úschovy digitálních důkazů stal sporným
důkazním problémem. Aby se zabránilo jmenování obžalovaných (kteří
jsou soukromými stranami i po odsouzení), jsou popsány podle typu
případu, nikoli podle jmenovaného jednotlivce:

- **Federální kontroverze chyby forenzního nástroje v polovině 2010.
  let**, ve které byl široce používaný nástroj forenzního zobrazování
  zjištěn po získání, že má hraniční chybu ovlivňující konkrétní typ
  zdrojového média. Zapečetěný manifest získání se zamraženými daty
  verze-nástroje-a-binárního-hashe by umožnil obhajobě a obžalobě
  dohodnout se přesně na tom, která verze byla použita, čímž by se
  odstranila jedna osa sporu.

- **Více státních případů zahrnujících sporné výstupy extrakce z
  mobilních zařízení**, kde dodavatel extrakčního nástroje později
  vydal opravnou záplatu a otázkou se stalo "ovlivnila chyba tento
  případ". Zapečetěný fakt metodiky umožňuje, aby byla otázka
  zodpovězena proti zamraženým údajům o verzování spíše než proti
  aktuální paměti agentury na to, která verze byla použita.

- **Spory o předávání záznamů z tělových kamer (BWC)** v případech,
  kdy bylo později tvrzeno, že dokovací systém dodavatele BWC
  umožňoval úpravu záznamů během přenosu. Zapečetěný manifest
  archivu tělové kamery v okamžiku přijetí agenturou kotví, jaké
  bajty agentura obdržela z dokovacího systému; pozdější úpravy
  na straně agentury jsou veřejně detekovatelné.

- **Kontroverze hashových kolizí v případech počítačové forenziky**,
  kde expert obhajoby tvrdil, že MD5 (stále používaný v některých
  starších pracovních postupech) je nedostatečný. Zapečetěné
  získání, které zaznamenává OBOJÍ MD5 a SHA-256, umožňuje SHA-256
  obstát, i když je MD5 zpochybněn.

- **Spory o vývoji metodiky vyšetření mezi získáním a soudním
  procesem.** Když případ leží mezi získáním a procesem roky,
  metodika, která byla standardní v okamžiku získání, mohla být v
  době procesu nahrazena. Zapečetěný záznam umožňuje soudu hodnotit
  metodiku oproti standardu, který byl aktuální v okamžiku získání,
  nikoli oproti pozdějšímu standardu.

Sada by NEVYŘEŠILA základní spory o vině či nevině v žádném z těchto
typů případů. Vyřešila by jeden konkrétní podspor o důkazech: zda
byly bajty, nástroje a postupy tím, co agentura tvrdí, že byly v
době, kdy to agentura tvrdí.

---

## Kdy tuto sadu používat

- Vaše agentura má stabilní forenzní SOP a chce přidat veřejné
  osvědčení zakotvené v Bitcoinu jako vrstvu odolnou vůči manipulaci
  nad stávající papírově-podpisový řetězec úschovy.
- Očekáváte, že tento případ zahrnuje významné napadení obhajobou
  forenzních důkazů (případ s vysokou sázkou, nová metodika, sporné
  verze nástrojů atd.).
- Můžete zveřejnit uvedenou sadu faktů bez vystavení PII nebo dat
  opětovně identifikujících zranitelné osoby. (Pravidla odmítnutí
  sady to vynucují; pokud by vaše fakty vyžadovaly porušení refusal-
  rule, sadu nepoužívejte.)
- Generální právník získávající agentury a kancelář prokurátora
  zkontrolovali plán zveřejnění. Veřejné zveřejnění artefaktu
  nesoucího identifikátor případu má důsledky pro probíhající
  vyšetřování; kontrola právníka není volitelná.
- Pravidla discovery obhajoby vaší jurisdikce jsou kompatibilní s
  tím, že agentura odděleně drží záznam o vazbě role-jednotlivec
  (hashovaný ve FAKTU 05). Pokud vaše jurisdikce vyžaduje veřejné
  zveřejnění jména examinátora, musíte sadu podle toho upravit.

## Kdy tuto sadu NEPOUŽÍVAT

- **Nepoužívejte jako náhradu za stávající dokumentaci řetězce
  úschovy agentury.** Tato sada je *doplňková*, nikoli náhradní.
  CMS agentury, záznam úschovy a povinnosti produkce v rámci
  discovery se nemění.
- **Nepoužívejte, pokud získání zahrnuje CSAM, biometrické šablony
  nebo jiná data opětovně identifikující zranitelné osoby na úrovni
  souboru.** Hashe celých disků na úrovni obrazu jsou přijatelné;
  hashe takového materiálu na úrovni souboru NIKDY přijatelné
  nejsou, ani pod výjimkou refusal-rule. Pokud nemůžete sestavit
  sadu faktů bez porušení R3, sadu nepoužívejte.
- **Nepoužívejte k tvrzení, že příkaz k prohlídce byl zákonný,
  zabavení bylo řádné nebo důkazy jsou přípustné** — sada to neumí
  a refusal-rule R5 odmítne jakékoli takové tvrzení.
- **Nepoužívejte pod tlakem zapečetit dříve, než je získání
  dokončeno.** Pečeť získání ve fázi rozpracovanosti zkresluje stav.
- **Nepoužívejte ke zveřejňování osobních jmen examinátorů**,
  pokud to vaše jurisdikce výslovně nevyžaduje a vaši examinátoři
  individuálně nesouhlasili. Výchozí je zveřejnění na úrovni role.
- **Nepoužívejte v zapečetěných nebo pod-zapečetěných případech**
  bez výslovného povolení soudu. Zveřejnění identifikátoru případu
  na Bitcoinu je nezvratné; pokud je případ později zapečetěn,
  veřejnou pečeť nelze stáhnout. Sada je pouze pro získání z
  veřejného záznamu.
- **Nepoužívejte jako divadlo legitimity.** Pečeť vadného získání
  je trvalým veřejným záznamem vad, nikoli obranou proti nim.
  Primitivum řeže oběma směry; to je jeho poctivost.

## Jak forknout tuto sadu pro skutečné získání

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # nahraďte fiktivní obsah skutečným
                       # aplikujte refusal rules R1-R8 v celém rozsahu
bash build/seal.sh     # pečetěte V OKAMŽIKU nebo těsně po dokončení zobrazení
python3 build/verify.py
```

**Kritické načasování:** pečeťte V OKAMŽIKU nebo těsně po skončení
zobrazení (FAKT 05 událost E17 v ukázkové časové ose). Pečeť během
zobrazování vytváří záznam získání ve fázi rozpracovanosti; pečeť
o mnoho později vytváří mezeru, během níž mohla agentura obrazy
upravit. Správné okno je bezprostředně po dokončení ověření obrazu
pro poslední položku v sadě exponátů.

**Kritická kontrola:** před zapečetěním nechte publikaci projít
druhým forenzním examinátorem (nikoli vedoucím) a právníkem
agentury. Po zapečetění je publikace trvalá.

## Integrace se stávající infrastrukturou řetězce úschovy

- **Agency Case Management System (CMS).** CMS zůstává primárním
  systémem evidence agentury. Pečeť CMS nenahrazuje; zavazuje se
  k bajtům a metodice, které CMS zaznamenává, takže pozdější úpravy
  CMS jsou veřejně detekovatelné.
- **Federal Rules of Evidence / Daubert / státní důkazní řády.**
  Pečeť přispívá k záznamu ověření FRE 901 poskytnutím integrity
  odolné vůči manipulaci. NESPLŇUJE FRE 702 / Daubert sama o sobě;
  spolehlivost metodiky je stále testována při důkazním slyšení.
- **Discovery obhajoby (FRCP 16, Brady, Giglio a státní ekvivalenty).**
  Doprovodné záznamy hashované ve FAKTU 05 (vazba role-jednotlivec,
  záznam úschovy, fotografie pečetí proti manipulaci atd.) zůstávají
  předmětem běžného discovery. Pečeť kotví, co tyto záznamy tvrdily
  v okamžiku získání, takže pozdější tvrzení "záznam byl v té době
  jiný" je veřejně vyvratitelné.
- **NIST Computer Forensics Tool Testing (CFTT).** Sada odkazuje na
  ověřovací záznamy CFTT ve FAKTU 04 / FAKTU 05; odkaz je hash,
  nikoli samotný záznam, takže procesy CFTT nejsou ovlivněny.
- **Soudem jmenovaní neutrální a experti obhajoby.** Kdokoli může
  znovu hashovat forenzní obrazy, které obdrží v discovery, proti
  manifestu FAKTU 03 nezávisle na spolupráci agentury. To je
  primární přidaná hodnota sady pro stranu obhajoby.
- **Odvolací přezkum.** O roky později může odvolací forenzní
  recenzent ověřit původní metodiku získání proti zapečetěnému
  záznamu FAKTU 04, nikoli proti možná-vyvinuté aktuální paměti
  agentury.

## Co tato sada NENAHRAZUJE

- Federal Rules of Evidence (nebo jakýkoli státní důkazní řád).
- Standardy spolehlivosti Daubert / Frye pro znalecké svědectví.
- Forenzní SOP agentury a CMS.
- Povinnosti discovery obhajoby podle FRCP 16 / Brady / Giglio /
  státních ekvivalentů.
- Soudní příkazy, návrhy na potlačení, důkazní slyšení nebo
  jakýkoli jiný soudem spravovaný proces.
- NIST CFTT nebo jiný režim testování nástrojů.
- Protokol privilege-filter / taint-team agentury.

## Proč tato sada existuje ve v0.4.0+

Toto je 8. zpracovaný příklad dodávaný s myriam-kit. Sleduje strukturu
constraint-first ověřenou autoresearchem zdokumentovanou v
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — varianta constraint-first
prompt získala nejvyšší skóre ve váženém rubriku napříč více
ukázkovými doménami. Úvodní sekce jsou nosnými částmi sady; obsah
manifestu je tou snadnou částí.

Návrh sady je úmyslně konzervativní vůči zveřejnění jména examinátora
a agresivní vůči disclaimeru "toto neustanovuje přípustnost".
Forenzní komunita má zdokumentovanou historii toho, že je napadána
za svou forenzní práci; sada se ve výchozím nastavení přiklání k
bezpečnější pozici pro examinátory. Agentury v jurisdikcích, kde
je vyžadováno veřejné osobní jmenování, mohou svůj fork odpovídajícím
způsobem upravit, ale výchozí odmítnutí preferuje bezpečnost
examinátora.

## Licence

Veřejná doména (CC0). Forkněte to. Bez nutnosti uvádění zdroje.
