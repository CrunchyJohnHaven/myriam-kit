*Český překlad — pro původní anglickou verzi viz [README.md](README.md)*

# Sada pro pečetění manifestu whistleblowera

Hotový příklad myriam-kit pro whistleblowery čelící specifickému
selhání, kdy **důkazy jsou pohřbeny, upraveny nebo zpochybňovány
zprostředkovateli mezi whistleblowerem a veřejností**. Kanonické
historické případy, proti nimž tato sada chrání:

- Boeing 737 MAX (interní bezpečnostní zprávy zlehčovány/pohřbeny)
- Theranos (obavy z laboratorních testů byly potlačovány po léta)
- Zprávy inspektorů FDA upravené po odevzdání
- Frances Haugen / Facebook (zapečetěný manifest by prokázal,
  že dokumenty byly autentické a existovaly v uvedeném čase)

Proti čemu tato sada chrání (v termínech protokolu):

- T1–T3 v [FACT 05](facts/05_threat_model.txt): veřejné zpochybnění
  obsahu dokumentů, tvrzení, že dokumenty nebyly v uvedeném čase
  zapečetěny, tvrzení o zpětné fabrikaci.
- T9: třetí strany předávající novinářům pozměněné kopie.

Proti čemu tato sada **nechrání**:

- Osobní odveta vůči whistlebloweri (T7).
- Tlak na whistleblowera, aby své tvrzení odvolal (T4, částečně
  zmírněno tím, že FACT 07 činí tiché odvolání veřejně detekovatelným).
- Právní kroky proti whistleblowerovi za samotné zveřejnění (T5).
- Diskreditace charakteru whistleblowera (T8).
- Zprostředkovatelé tiše ignorující příběh (T10).

Pokud jste whistleblower zvažující použití této sady, **přečtěte si
nejprve celý tento README**. Protokol je nástroj. Protokol není
náhradou za právního poradce, novináře, regulátora ani pečlivou
provozní bezpečnost.

## Co tato sada produkuje

Kryptograficky zapečetěný *manifest* důkazů (nikoli důkaz samotný),
který prokazuje:

1. Konkrétní bajty každého důkazního souboru existovaly v okamžiku
   pečetění.
2. Pečetění se uskutečnilo v určitém čase nebo dříve (pomocí Bitcoin
   OTS atestace).
3. Původ, obvinění, model hrozeb, protokol příjemce a závazek
   k netichému-neodvolání byly deklarovány společně.

Podkladové dokumenty zůstávají ve vašem držení, dokud je nepošlete
příjemci. Příjemci ověřují, že obdrželi stejné bajty, které jste
zapečetili.

## Kdy tuto sadu použít

Měli byste zvážit zapečetění manifestu **před** předáním důkazů
novináři, regulátorovi nebo právníkovi, pokud platí všechny tyto
podmínky:

- Máte důkazy v digitální podobě (PDF, e-maily, obrázky atd.), které
  chcete zachovat jako bajt-po-bajtu autentické.
- Očekáváte, že zprostředkovatelé mohou důkazy pozměnit, zpochybnit
  nebo pohřbít.
- Můžete podkladové dokumenty udržet ve svém držení až do předání.
- Můžete manifest veřejně zveřejnit **bez** odhalení obsahu dokumentů
  (veřejné jsou pouze hashe).
- Zvážili jste rizika, že se stanete veřejně identifikovatelnými jako
  whistleblower (pole signing-principal). Pokud jste anonymní,
  používejte konzistentně pseudonym ve všech souvisejících publikacích.
- Konzultovali jste s právníkem zákon na ochranu whistleblowerů
  ve vaší jurisdikci.

## Kdy tuto sadu NEPOUŽÍVAT

NEPOUŽÍVEJTE tuto sadu, pokud:

- Dokumenty samy obsahují osobní informace o třetích stranách
  (pacientech, zákaznících, zaměstnancích), které by neměly být
  veřejně hashovatelné. Hashujte redigovanou verzi, ne originál.
- Samotné zveřejnění manifestu by identifikovalo whistleblowera
  způsobem, s nímž nesouhlasil.
- Ještě jste nekonzultovali s právníkem. Protokol je nástroj;
  zákon na ochranu whistleblowerů je specifický pro jurisdikci
  a žije mimo protokol.
- Mohli byste chtít později odvolat některé jednotlivé obvinění.
  Pečeť je trvalá; nové zapečetěné opravy jsou jediným poctivým
  způsobem revize.
- Děláte to pod nátlakem nebo časovým tlakem. Protokol zesiluje
  donucení; brána odmítnutí (myriam-kit `SPEC §8`) platí pro
  whistleblowery stejně jako pro publikující.

## Jak forknout tuto sadu pro skutečné zveřejnění

```bash
# 1. Zkopírujte tento příklad do nového adresáře
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Odstraňte fiktivní obsah; nahraďte ho skutečnými fakty.
# Každý soubor v facts/ je jedno fakt. Přečtěte si každý a nahraďte.
$EDITOR facts/01_example_notice.txt   # změňte na skutečné průvodní prohlášení
$EDITOR facts/02_provenance.txt       # skutečný původ vašeho důkazu
$EDITOR facts/03_evidence_manifest.txt # hashujte své skutečné dokumenty a vypište je
$EDITOR facts/04_allegation_summary.txt # vaše skutečné obvinění
$EDITOR facts/05_threat_model.txt     # vaše skutečné očekávané reakce
$EDITOR facts/06_recipient_protocol.txt # přizpůsobte svému příjemci
$EDITOR facts/07_no_retraction_commitment.txt # vaše prohlášení o neodvolání
$EDITOR facts/08_signing_principal.txt # vaše skutečná podpisová identita (nebo pseudonym)

# 3. Aktualizujte site/index.html, aby odrážel skutečná fakta.
# Skript seal.sh HTML automaticky NEPLNÍ; ruční úprava je krokem
# lidské revize.
$EDITOR site/index.html

# 4. Zapečetěte.
bash build/seal.sh
# Výstupy: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Ověřte lokálně.
python3 build/verify.py

# 6. Zveřejněte manifest (NIKOLI dokumenty) na některém z:
#    - Statického hostingu pod vaší kontrolou (Cloudflare Pages, GitHub Pages atd.)
#    - Sítě IPFS pod vytištěným CID
#    - Obou (doporučeno)

# 7. Samostatně předejte podkladové dokumenty příjemci
#    přes bezpečný kanál dle vašeho výběru (Signal, SecureDrop atd.).
#    Příjemce ověřuje hashe souborů proti vašemu manifestu.
```

## Výpočet hashů pro skutečné důkazní soubory

K hashování dokumentu pomocí SHA-256:

```bash
shasum -a 256 my_document.pdf
```

Prvních 64 hexadecimálních znaků je SHA-256. Vložte je do manifestu.

Můžete hashovat mnoho souborů najednou:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

To vám dá data pro `facts/03_evidence_manifest.txt`.

## Poznámky k provozní bezpečnosti

Protokol MYRIAM NEPOSKYTUJE provozní bezpečnost. Poskytuje
*důkazní trvanlivost*. Stále potřebujete:

- Bezpečný komunikační kanál se svým právníkem
  ([Signal](https://signal.org/), osobně nebo zavedený bezpečný
  kanál vašeho právníka)
- Bezpečné úložiště pro podkladové dokumenty (šifrované
  v klidu, ne v cloudových službách, k nimž má váš zaměstnavatel
  přístup)
- Čisté zařízení pro pečetění (osobní notebook, který není spojen
  s účty zaměstnavatele; nejlépe používaný pouze k tomuto účelu)
- Čistou síť pro publikaci (ne sítě vašeho zaměstnavatele, ne
  vaši domácí IP, pokud by váš zaměstnavatel mohl předvolat
  vašeho ISP)

Doporučená literatura o provozní bezpečnosti pro whistleblowery:

- [Dokumentace SecureDrop od The Intercept](https://securedrop.org/)
- [Zdroje Freedom of the Press Foundation](https://freedom.press/)
- [Průvodce sebeobranou před sledováním od EFF](https://ssd.eff.org/)

Konzultujte je PŘED zahájením procesu pečetění. Protokol nechrání
před špatnými opsec rozhodnutími učiněnými před vyvoláním protokolu.

## Co by měli příjemci vědět

Pošlete příjemcům tento README spolu se zapečetěným manifestem.
Manifest sám obsahuje protokol příjemce (FACT 06), ale README
rozšiřuje roli příjemce:

- **Novináři**: nejprve ověřte integritu samotného manifestu. Poté
  si vyžádejte dokumenty přes samostatný bezpečný kanál. Ověřte,
  že SHA-256 každého dokumentu odpovídá manifestu před publikací.
  NEZVEŘEJŇUJTE dokumenty bez souhlasu whistleblowera; zveřejněte
  však existenci zapečetěného manifestu a svůj ověřovací závěr.
- **Regulátoři**: stejný ověřovací proces. Zapečetěný manifest plus
  odpovídající dokumenty je nejsilnější důkazní forma dostupná
  mimo formální shromažďování řetězce dohledu.
- **Právníci**: zapečetěný manifest poskytuje forenzní ukotvení
  existence dokumentů v uvedeném čase. Zda splňuje konkrétní
  pravidla dokazování konkrétní jurisdikce, je na vás, abyste
  rozhodli.

## Co tato sada NENÍ

- Není náhradou za právního poradce.
- Není zárukou, že kdokoli bude jednat na základě vašeho zveřejnění.
- Není ochranou proti odvetě.
- Není autentizací obsahu dokumentů (pouze jejich
  bajtů-v-době-pečetění).
- Není způsobem anonymní komunikace s kýmkoli — pečeť je
  veřejná; pokud je vaše jméno signing-principal skutečné, jste
  identifikováni.

## Závěr

Zapečetěný manifest je malá věc. Je to jeden bajtový proud
prokazující, že větší sada bajtových proudů existovala v určité
formě v určitém čase. Tato malost je jeho silou: dělá pouze jednu
věc a dělá tuto jednu věc po celou dobu životnosti Bitcoin
blockchainu.

Pokud čtete toto, protože zvažujete, že se stanete whistleblowerem,
prosím: nejprve mluvte s právníkem. Použijte výše uvedené průvodce
provozní bezpečností. Pak, a pouze pokud jsou všechny tyto výše
postavené úvahy v pořádku, zvažte tuto sadu jako kryptografickou
páteř vašeho zveřejnění. Krypto je ta snadná část. Vše nad kryptem
je tam, kde žije skutečné riziko.

## Licence

Veřejná doména (CC0). Forkujte to. Vylepšete to. Používejte to
bez žádosti o povolení.
