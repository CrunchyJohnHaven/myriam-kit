*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pro osvědčení šarže vakcíny

Hotová příkladová sada myriam-kit pro výrobce vakcín, orgány
zajištění kvality a agentury veřejného zdraví, které chtějí
publikovat pečeť uvolnění šarže odolnou vůči manipulaci a kotvenou
v Bitcoinu.

## Proti čemu tato sada chrání

**Selhání, která pečeť zachytí:**

- **Tichá zpětná úprava výsledků uvolňovacích testů.** Všech 8 PDF
  souborů s uvolňovacími testy v příkladu je hashováno. Opětovné
  hashování po uvolnění odhalí jakoukoli úpravu.
- **Spory o to, které specifikace platily při uvolnění.** Zapečetěný
  FACT 02 obsahuje kanonickou identifikaci šarže a hash výrobního
  záznamu. Budoucí spory typu „specifikace byla vždy X" mají veřejnou
  kotvu.
- **Tichá minimalizace rozsahu stažení z trhu.** Závazky farmakovigilance
  ve FACT 05 jsou zapečetěny; jejich neplnění je veřejně pozorovatelné.
- **Zpětná respecifikace šarže mimo specifikace.** Pokud byl výsledek
  uvolňovacího testu ve skutečnosti hraniční PASS, který je po
  uvolnění překlasifikován jako FAIL, hashe zapečetěných zpráv
  dokazují, co původní výsledkové PDF říkalo.

**Selhání, která NEJSOU pokryta:**

- Podvod v samotném výrobním procesu (pečeť kotví výsledky testů,
  nikoli integritu výroby).
- Nežádoucí účinky, které jsou biologickými důsledky jinak vyhovující
  šarže (pečeť necertifikuje klinickou bezpečnost, pouze integritu
  dokumentace).
- Spory o to, která verze regulatorní specifikace je směrodatná.

## Kdy tuto sadu použít

Zvažte zapečetění uvolnění šarže, pokud:

- Jste výrobce vakcín, který chce prokázat forenzní integritu
  uvolňovacích záznamů nad rámec toho, co regulátoři vyžadují
- Jste tým QA, který přijímá praxi „publikovat to, co osvědčujeme"
- Jste malý/národní výrobce v jurisdikci se slabší regulatorní
  infrastrukturou, který chce kotvit záznamy o šaržích vůči
  globálnímu ověřovateli
- Jste agentura veřejného zdraví nebo nezisková organizace
  provozující nekomerční program výroby vakcín (např. pro
  zanedbávaná onemocnění)

## Historický precedens v oblasti úmrtnosti

- **Kontaminace heparinu (2008, Čína):** padělaný oversulfátovaný
  chondroitin sulfát v šaržích heparinu. Zapečetěný manifest
  uvolňovacích testů by učinil tichou pozdější úpravu záznamu
  o testování kryptograficky detekovatelnou.
- **Tylenol s kyanidem (1982):** zpětné spory o místo původu
  manipulace. Zapečetěný hash výrobního záznamu kotví stav před
  distribucí.
- **Různá stažení šarží vakcín z trhu**, kde se otázka „byla tato
  šarže někdy řádně otestována" stává spornou po letech.

Tato sada NENÍ řešením pro ŽÁDNÝ z těchto případů v přísném smyslu —
ale v každém případě by zapečetěná osvědčení šarží poskytla čistší
forenzní časovou osu.

## Jak forkovat tuto sadu pro skutečnou šarži

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # nahraďte fiktivní obsah skutečnou šarží
bash build/seal.sh        # ZAPEČEŤTE PŘED zahájením distribuce
python3 build/verify.py   # potvrďte
```

**KRITICKÉ NAČASOVÁNÍ**: zapečeťte v okamžiku uvolnění QA, PŘED
distribucí šarže. Pečeť po distribuci je forenzně slabší.

## Integrace se stávající farmaceutickou infrastrukturou

- **eCTD podání (FDA / EMA):** URL nebo IPFS CID zapečetěné publikace
  může být odkazován v sekci Modul 3 (kvalita)
- **Předkvalifikace WHO:** zapečetěný manifest demonstruje řetězec
  testování před uvolněním pro jurisdikce mimo FDA/EMA
- **Zpětná vazba farmakovigilance:** FACT 05 zavazuje výrobce k
  zapečetěnému vykazování agregovaných počtů nežádoucích účinků
  v 6 a 12 měsících
- **Systémy stahování z trhu (RxConnect, MedWatch):** pokud je
  potřeba stažení, samotný rozsah stažení je zapečetěn pod MYRIAM,
  což poskytuje veřejné ověření, že všechny distribuované šarže jsou
  řešeny

## Co tato sada NENAHRAZUJE

- Regulatorní podání FDA / EMA / WHO
- Auditní stopy GMP (pečeť kotví VÝSLEDKY, nikoli surové procesní
  záznamy)
- Databáze farmakovigilance (VAERS / EudraVigilance)
- Systémy koordinace stahování z trhu

## Licence

Public domain (CC0). Forkujte to. Žádné uvedení autorství není
vyžadováno.
