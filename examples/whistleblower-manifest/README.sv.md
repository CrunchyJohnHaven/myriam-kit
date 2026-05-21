*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Förseglingskit för visselblåsarmanifest

Ett färdigt myriam-kit-exempel för visselblåsare som möter det specifika
felläget där **bevis begravs, redigeras eller bestrids av mellanhänder
mellan visselblåsaren och allmänheten**. De kanoniska historiska fall
detta försvarar mot:

- Boeing 737 MAX (interna säkerhetsrapporter förringade/begravda)
- Theranos (oro kring labbtester undertryckt i åratal)
- FDA-inspektörsrapporter redigerade efter inlämning
- Frances Haugen / Facebook (ett förseglat manifest hade bevisat
  att dokumenten var autentiska och existerade vid den hävdade tiden)

Vad detta kit försvarar mot (i protokolltermer):

- T1–T3 i [FACT 05](facts/05_threat_model.txt): offentligt bestridande
  av dokumentinnehåll, påståenden om att dokument inte var förseglade
  vid den hävdade tiden, påståenden om retroaktiv fabricering.
- T9: tredje parter som överlämnar förändrade kopior till journalister.

Vad detta kit **inte** försvarar mot:

- Personlig vedergällning mot visselblåsaren (T7).
- Tryck på visselblåsaren att dra tillbaka (T4, delvis mildrat genom
  att FACT 07 gör tyst tillbakadragande offentligt upptäckbart).
- Rättsliga åtgärder mot visselblåsaren för själva avslöjandet (T5).
- Att misskreditera visselblåsarens karaktär (T8).
- Mellanhänder som tyst släpper historien (T10).

Om du är en visselblåsare som överväger att använda detta kit, **läs
hela denna README först**. Protokollet är ett verktyg. Protokollet är
ingen ersättning för juridisk rådgivning, en journalist, en tillsynsmyndighet
eller noggrann operativ säkerhet.

## Vad detta kit producerar

Ett kryptografiskt förseglat *manifest* av bevis (inte själva beviset)
som bevisar:

1. De specifika byten i varje bevisfil existerade i förseglingsögonblicket.
2. Förseglingen skedde vid eller före en specifik tid (via Bitcoin
   OTS-attestering).
3. Härkomst, anklagelse, hotmodell, mottagarprotokoll och
   icke-tyst-tillbakadragande-åtagandet deklarerades alla tillsammans.

De underliggande dokumenten förblir i din besittning tills du skickar
dem till en mottagare. Mottagare verifierar att de mottog samma byten
som du förseglade.

## När detta kit ska användas

Du bör överväga att försegla ett manifest **innan** du överför bevis
till en journalist, tillsynsmyndighet eller advokat, om allt följande
är sant:

- Du har bevis i digital form (PDF:er, e-postmeddelanden, bilder etc.)
  som du vill bevara som byte-för-byte autentiska.
- Du förväntar dig att mellanhänder kan förändra, bestrida eller begrava
  beviset.
- Du kan behålla de underliggande dokumenten i din besittning tills
  överföringen.
- Du kan publicera manifestet offentligt **utan** att avslöja innehållet
  i dokumenten (endast hashar är offentliga).
- Du har vägt riskerna med att bli offentligt identifierbar som
  visselblåsare (signing-principal-fältet). Om anonym, använd en
  pseudonym konsekvent i alla relaterade publikationer.
- Du har konsulterat en advokat om visselblåsarskyddslagstiftning
  i din jurisdiktion.

## När detta kit INTE ska användas

Använd INTE detta kit om:

- Dokumenten själva innehåller personlig information om tredje parter
  (patienter, kunder, anställda) som inte bör göras offentligt-hashbar.
  Hasha en redigerad version, inte originalet.
- Själva publiceringen av manifestet skulle identifiera visselblåsaren
  på ett sätt de inte samtyckt till.
- Du ännu inte har konsulterat en advokat. Protokollet är ett verktyg;
  visselblåsarskyddslagstiftning är jurisdiktionsspecifik och lever
  utanför protokollet.
- Du kanske vill dra tillbaka en enskild anklagelse senare. Förseglingen
  är permanent; nya förseglade rättelser är det enda ärliga sättet att
  revidera.
- Du gör detta under tvång eller tidspress. Protokollet förstärker
  tvång; vägransporten (myriam-kit `SPEC §8`) gäller för visselblåsare
  såväl som för utgivare.

## Hur du forkar detta kit för ett verkligt avslöjande

```bash
# 1. Kopiera detta exempel till en ny katalog
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Ta bort det fiktiva innehållet; ersätt med dina verkliga fakta.
# Varje fil under facts/ är ett faktum. Läs varje och ersätt.
$EDITOR facts/01_example_notice.txt   # ändra till ett verkligt täckande uttalande
$EDITOR facts/02_provenance.txt       # verklig härkomst av ditt bevis
$EDITOR facts/03_evidence_manifest.txt # hasha dina verkliga dokument och lista dem
$EDITOR facts/04_allegation_summary.txt # din verkliga anklagelse
$EDITOR facts/05_threat_model.txt     # dina verkliga förväntade svar
$EDITOR facts/06_recipient_protocol.txt # justera för din mottagare
$EDITOR facts/07_no_retraction_commitment.txt # din icke-tillbakadragande-deklaration
$EDITOR facts/08_signing_principal.txt # din verkliga signeringsidentitet (eller pseudonym)

# 3. Uppdatera site/index.html för att återspegla de verkliga fakta.
# Skriptet seal.sh fyller INTE i HTML automatiskt; den manuella
# redigeringen är steget för mänsklig granskning.
$EDITOR site/index.html

# 4. Försegla.
bash build/seal.sh
# Utdata: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Verifiera lokalt.
python3 build/verify.py

# 6. Publicera manifestet (INTE dokumenten) till någon av:
#    - En statisk värd du kontrollerar (Cloudflare Pages, GitHub Pages etc.)
#    - IPFS-nätverket på den utskrivna CID:n
#    - Båda (rekommenderas)

# 7. Överför separat de underliggande dokumenten till mottagaren
#    via en säker kanal efter ditt val (Signal, SecureDrop etc.).
#    Mottagaren verifierar filhashar mot ditt manifest.
```

## Beräkna hashar för de verkliga bevisfilerna

För att hasha en dokumentfil med SHA-256:

```bash
shasum -a 256 my_document.pdf
```

De första 64 hex-tecknen är SHA-256. Sätt det i manifestet.

Du kan hasha många filer på en gång:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Det ger dig data för `facts/03_evidence_manifest.txt`.

## Operativa säkerhetsanteckningar

MYRIAM-protokollet TILLHANDAHÅLLER INTE operativ säkerhet. Det
tillhandahåller *bevisbeständighet*. Du behöver fortfarande:

- En säker kommunikationskanal till din advokat
  ([Signal](https://signal.org/), personligen, eller din advokats
  etablerade säkra kanal)
- En säker lagringsplats för de underliggande dokumenten (krypterade
  i vila, inte på molntjänster som din arbetsgivare kan komma åt)
- En ren enhet för förseglingen (en personlig bärbar dator som inte
  är associerad med arbetsgivarkonton; helst en som endast används
  för detta ändamål)
- Ett rent nätverk för publicering (inte din arbetsgivares nätverk,
  inte din hem-IP om din arbetsgivare kan stämma in din ISP)

Rekommenderad läsning om operativ säkerhet för visselblåsare:

- [The Intercepts SecureDrop-dokumentation](https://securedrop.org/)
- [Freedom of the Press Foundations resurser](https://freedom.press/)
- [EFF:s guide för självförsvar mot övervakning](https://ssd.eff.org/)

Konsultera dem INNAN du startar förseglingsprocessen. Protokollet
skyddar inte mot dåliga opsec-val gjorda innan protokollet åberopas.

## Vad mottagare bör veta

Skicka mottagare denna README tillsammans med det förseglade manifestet.
Manifestet självt innehåller mottagarprotokollet (FACT 06), men README
utvidgar mottagarrollen:

- **Journalister**: verifiera först manifestets egen integritet. Begär
  sedan dokumenten genom en separat säker kanal. Verifiera att varje
  dokuments SHA-256 matchar manifestet före publicering. Publicera INTE
  dokumenten utan visselblåsarens samtycke; publicera dock existensen
  av det förseglade manifestet och din verifieringsslutsats.
- **Tillsynsmyndigheter**: samma verifieringsprocess. Det förseglade
  manifestet plus matchande dokument är den starkaste bevisformen
  tillgänglig utanför formell chain-of-custody-insamling.
- **Advokater**: det förseglade manifestet ger forensisk förankring
  för dokumentens existens vid den hävdade tiden. Huruvida det
  uppfyller någon specifik jurisdiktions bevisregler är upp till dig
  att avgöra.

## Vad detta kit INTE är

- Ingen ersättning för juridisk rådgivning.
- Ingen garanti att någon kommer att agera på ditt avslöjande.
- Inget skydd mot vedergällning.
- Ingen autentisering av dokumentens innehåll (endast av deras
  byten-vid-förseglingstidpunkten).
- Inget sätt att kommunicera anonymt med någon — förseglingen är
  offentlig; om ditt signing-principal-namn är verkligt, är du
  identifierad.

## Avslutning

Ett förseglat manifest är en liten sak. Det är en byteström som
bevisar att en större uppsättning byteströmmar existerade i en
viss form vid en viss tid. Den litenheten är dess styrka: det gör
endast en sak, och det gör den ena saken under hela Bitcoin-blockkedjans
livstid.

Om du läser detta för att du överväger att bli visselblåsare,
snälla: prata med en advokat först. Använd de operativa säkerhets-
guiderna ovan. Sedan, om och endast om alla dessa uppströms hänsyn
är i ordning, betrakta detta kit som den kryptografiska ryggraden
i ditt avslöjande. Kryptot är den enkla delen. Allt uppströms från
kryptot är där den verkliga risken lever.

## Licens

Allmän egendom (CC0). Forka det. Förbättra det. Använd det utan
att be om tillstånd.
