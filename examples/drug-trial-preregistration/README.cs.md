*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pro předregistraci klinické studie léčiva

Hotová příkladová sada myriam-kit pro sponzory klinických studií
a akademické výzkumníky, kteří chtějí předregistrovat studii
způsobem odolným vůči manipulaci a kotveným v Bitcoinu **navíc k**
registraci v ClinicalTrials.gov, EU CTR nebo jiných jurisdikčních
registrech.

## Proč předregistrovat *navíc* pod MYRIAM?

Existující registry studií (ClinicalTrials.gov, EU CTR, ISRCTN) mají
zdokumentované slabiny v oblasti integrity:

- ClinicalTrials.gov umožňuje sponzorům aktualizovat koncové body,
  výpočty velikosti vzorku a analytické plány **po** původní
  registraci, kdy data úprav jsou v registru viditelná, ale samotné
  *obsahové* změny nejsou vždy kryptograficky kotveny.
- Několik velkých studií (Goldacre et al., 2019; Mathieu et al.,
  2009) zdokumentovalo systematickou post-hoc záměnu koncových bodů
  napříč oborem.
- Redakční dohled časopisů (CONSORT, ICMJE) zachycuje některé
  případy; mnoho jich propadne.

Pečeť MYRIAM tuto mezeru uzavírá. Merkle-kořen + Bitcoin OTS účtenka
činí jakoukoli post-hoc změnu *předregistrovaného* primárního
koncového bodu, statistického analytického plánu nebo seznamu
podskupin kryptograficky detekovatelnou. Pečeť je forenzně obtížnější
zpětně přepsat než samotný registr.

Tato sada je **doplňkem k**, nikoli náhradou za, jurisdikční
registry. Skutečná studie by měla být registrována v příslušném
registru A zapečetěna pod MYRIAM.

## Proti čemu tato sada chrání

Historické případy úmrtnosti, kde by toto pomohlo:

- **Vioxx (Merck, 2004)**: kardiovaskulární příhody byly
  předregistrovaným koncovým bodem ve studii APPROVe, ale
  publikovaná analýza použila mezní hodnotu, která minimalizovala
  zjevné škody. Pečeť předregistrované mezní hodnoty by učinila
  post-hoc změnu mezní hodnoty veřejně detekovatelnou ještě před
  publikovaným článkem.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: negativní data studie
  o sebevražednosti u adolescentů byla přerámována pomocí post-hoc
  analýzy. Zapečetěná předregistrace koncových bodů by učinila
  přerámování veřejně detekovatelným.
- **Vícero onkologických studií**, kde byly koncové body přežití
  zaměněny za zástupné koncové body (přežití bez progrese, míra
  odpovědi), když se přínos pro přežití nepodařilo prokázat.

**Selhání, která pečeť přímo zachytí:**

- **Záměna koncových bodů**: post-hoc povýšení sekundárního koncového
  bodu na „primární", když skutečný primární selže. FACT 05 pečetě
  obsahuje předregistrovaný primární koncový bod; publikovaný
  primární koncový bod se musí shodovat.
- **Selektivní výběr výsledků**: selektivní reportování pouze těch
  analýz, které fungovaly. FACT 06 obsahuje úplný předregistrovaný
  analytický plán; publikované analýzy musí zahrnovat všechny
  předregistrované.
- **Post-hoc dolování podskupin**: tvrzení „lék funguje pro podskupinu
  X" po prohlédnutí dat. FACT 07 obsahuje předregistrovaný seznam
  podskupin; jakákoli jiná podskupina musí být označena jako post-hoc.
- **Revize velikosti vzorku**: zvýšení velikosti vzorku po pozorování
  průběžných trendů. FACT 06 obsahuje předregistrovanou velikost
  vzorku a výpočet síly.
- **Tiché odstranění nepohodlných sekundárních koncových bodů**:
  FACT 05 předem stanovuje pořadí sekundárních koncových bodů pro
  hierarchické testování; jakékoli přeuspořádání nebo odstranění je
  detekovatelné.
- **Potlačení negativních výsledků**: FACT 08 obsahuje publikační
  závazek; nesplnění publikace v rámci závazného okna je veřejně
  viditelné.

**Selhání, která NEJSOU pokryta:**

- Pochybení v samotném provádění studie (falešná data, podvodný
  nábor). Pečeť kotví *plán*, nikoli *provedení*.
- Selektivní reportování v publikacích, které obsahují všechny
  předregistrované analýzy, ale interpretují je příznivě. Pečeť
  zachytí to, co chybí; nemůže zachytit interpretační zaujatost.
- Poškození pacientů během samotné studie. Pečeť je regulační a
  důkazní; nesnižuje riziko provádění studie.

## Kdy tuto sadu použít

Měli byste zvážit zapečetění předregistrace, pokud:

- Sponzorujete nebo provádíte klinickou studii — Fáze 1 až 4 —
  která bude použita k informování lékařských nebo regulatorních
  rozhodnutí.
- Jste ochotni být veřejně vázáni předregistrovaným designem,
  koncovými body a analytickým plánem.
- Dokážete se vyrovnat s důsledkem: pokud studie selže ve svých
  předregistrovaných koncových bodech, nemůžete tiše přepsat
  k jinému koncovému bodu, který fungoval.
- Účastníte se výzkumné kultury (akademická medicína, kooperativní
  skupiny, NIH-financovaný výzkum), kde se integrita
  předregistrace stále více vyžaduje.

Tato sada je *obzvláště* cenná pro:

- Studie iniciované výzkumníkem na akademických institucích (kde je
  tlak sponzora na post-hoc změnu koncových bodů reálný, ale kde má
  akademický výzkumník reputační motivaci odolat).
- Studie otevřené vědy a občanské vědy.
- Studie přeúčelování léků v malých biotechnologických firmách bez
  dlouhých zkušeností s prováděním studií.
- Jakákoli studie určená k informování regulatorních podání, kde by
  v budoucnu mohly být vznášeny argumenty „nikdy jsme to neřekli".

## Kdy tuto sadu NEPOUŽÍVAT

Tuto sadu NEPOUŽÍVEJTE, pokud:

- Protokol studie je skutečně stále v pohybu. Předregistrujte, když
  je protokol finální, ne dříve.
- Nemůžete se zavázat k publikování výsledků bez ohledu na směr.
  Pečeť činí nezveřejnění veřejně detekovatelným.
- Studie zahrnuje konkurenční průmyslové utajení, které vám brání
  zveřejnit analytický plán. Pečeť činí analytický plán trvalým
  veřejným záznamem; neexistuje způsob, jak něco zapečetit
  soukromě.
- Nemáte právní a etické schválení protokolu. Pečeť zaznamenává
  protokol tak, JAK jste jej zapečetili; nemůže být zpětně
  schválena IRB nebo etickou komisí.

## Jak forkovat tuto sadu pro skutečnou předregistraci

```bash
# 1. Zkopírujte tento příklad
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Nahraďte fiktivní obsah skutečným obsahem protokolu studie.
# Každý fakt odpovídá oddílu standardní předregistrace:
$EDITOR facts/01_example_notice.txt   # NAHRAĎTE skutečným úvodním prohlášením
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMÁRNÍ + SEKUNDÁRNÍ + EXPLORATORNÍ
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Aktualizujte site/index.html, aby odrážel skutečnou studii.

# 4. Zapečeťte (PŘED zahájením náboru, PŘED uzamčením databáze):
bash build/seal.sh

# 5. Lokálně ověřte:
python3 build/verify.py

# 6. Nasaďte:
#    - Publikujte URL pečetě na webových stránkách sponzora studie A
#    - Přidejte IPFS CID do pole „Description" nebo „References"
#      záznamu studie v ClinicalTrials.gov, aby záznam v registru
#      křížově odkazoval na kryptografickou pečeť.
```

**KRITICKÉ ČASOVÁNÍ**: pečeť musí být vytvořena PŘED zahájením
náboru. Předregistrace zapečetěná po náboru prvního pacienta je
forenzně mnohem slabší. V ideálním případě zapečeťte v okamžiku
schválení IRB.

## Integrace s existující infrastrukturou předregistrace

Sada je navržena tak, aby se s ní skládala, ne aby ji nahrazovala:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: zaregistrujte studii v
  jurisdikčním registru dle požadavků. Poté v poli „Description"
  nebo „References" registru odkažte na publikaci zapečetěnou
  MYRIAM.
- **OSF (Open Science Framework)**: OSF podporuje předregistraci s
  datovými razítky, ale ne s Bitcoin-kotvením. Pečeť MYRIAM lze
  připojit jako doplňkový soubor na registrační stránku OSF, čímž
  získáte jak datové razítko, tak Bitcoin-kotvení.
- **AsPredicted.org**: podobné — připojte pečeť MYRIAM jako
  doplňkovou URL.
- **Časopisy**: některé časopisy (např. Trials, BMJ Open) přijímají
  URL předregistrace jako součást podání. Zahrňte URL pečetě MYRIAM
  vedle URL registru.

## Co příjemci (regulátoři, recenzenti časopisů, meta-analytici) získají

Studie předregistrovaná pod MYRIAM dává recenzentům:

1. **Kryptografický důkaz, že protokol byl finalizován v konkrétním
   čase.** Recenzenti mohou ověřit čas pečetě prostřednictvím OTS
   účtenky.
2. **Bajtová stabilita textu protokolu.** Recenzenti porovnávající
   publikovaný oddíl metod s předregistrovaným designem to mohou
   učinit znak po znaku.
3. **Detekce záměny koncových bodů.** Jednoduchý diff mezi
   zapečetěným FACT 05 a publikovaným primárním koncovým bodem
   odhaluje jakoukoli záměnu.
4. **Detekce odchylky analytického plánu.** Jednoduchý diff mezi
   zapečetěným FACT 06 a publikovanými statistickými metodami
   odhaluje úpravy.
5. **Detekce selektivního reportování podskupin.** Zapečetěný FACT 07
   obsahuje všechny předregistrované podskupiny; každá v publikaci,
   která není v pečeti, musí být označena jako post-hoc.

Toto činí systematický přehled a meta-analýzu podstatně snazší než
současná praxe.

## Co tato sada NENÍ

- Není náhradou za schválení IRB / etické komise.
- Není náhradou za registraci v jurisdikčním registru.
- Není zárukou, že studie bude provedena podle plánu.
- Není způsobem, jak ukotvit souhlas pacienta nebo jiné etické
  dokumenty (ty potřebují vlastní pečetící mechanismus).
- Není ochranou proti kritice designu studie po publikaci.

## Poznámka o publikování negativních výsledků

Závazek č. 1 ve FACT 08 („publikace bez ohledu na směr") je jediný
závazek pečetě s nejvyšším dopadem na úmrtnost. Historické
potlačování negativních výsledků studií (zejména u psychiatrických
léků u adolescentů, onkologických léků u starších populací a
kardiovaskulárních léků u žen) pravděpodobně přispělo k tisícům
preventabilních úmrtí za desetiletí prostřednictvím nadměrného
předepisování založeného na zaujatých odhadech účinnosti.

Zapečetěný závazek publikovat negativní výsledky je sám o sobě
jedním z veřejně-zdravotnických kroků s nejvyšší pákou, které
sponzor může učinit. Pečeť poskytuje externí odpovědnost za tento
závazek způsobem, který samoregulační publikační politiky
neposkytují.

## Závěr

Předregistrace klinické studie léčiva pod MYRIAM je malá práce navíc
pro sponzora: ~30 minut na naplnění fakt, ~10 sekund na zapečetění.
Odpovědnost, kterou přidává, je asymetrická: malé náklady pro
poctivé provedení studie, velké omezení pro post-hoc manévrování,
které přispělo k historickým zaujatostem v evidenční základně.

Pokud jste sponzor nebo hlavní výzkumník zvažující tuto sadu, sada
je ve veřejné doméně (CC0). Použijte ji. Upravujte ji. Vylepšujte
ji.

## Licence

Veřejná doména (CC0). Není vyžadována žádná atribuce.
