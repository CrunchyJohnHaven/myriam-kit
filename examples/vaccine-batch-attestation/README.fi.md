*Suomenkielinen käännös — alkuperäisen englanninkielisen version löydät [README.md](README.md)*

# Rokote-eräattestointipakki

Avaimet käteen -mallinen myriam-kit-esimerkki rokotevalmistajille,
laadunvarmistusviranomaisille ja kansanterveysvirastoille, jotka haluavat julkaista
Bitcoiniin ankkuroidun, peukaloinnin paljastavan sinetin rokote-erän vapauttamisesta.

## Miltä tämä pakki suojaa

**Vikatilanteet, jotka sinetti saa kiinni:**

- **Hiljainen takautuva muutos vapautustestitulokseen.** Kaikki 8
  esimerkin vapautustestauksen PDF:ää on hashattu. Uudelleen hashaaminen vapauttamisen jälkeen
  paljastaa minkä tahansa muutoksen.
- **Kiistat siitä, mitkä spesifikaatiot pätivät vapautushetkellä.**
  Sinetöity FACT 02 sisältää erän virallisen tunnisteen ja
  valmistusrekisterin hashin. Tulevilla "spesifikaatio oli aina X" -kiistoilla
  on julkinen ankkuri.
- **Hiljainen takaisinveto-kattavuuden minimointi.** FACT 05:n
  lääkevalvontaa koskevat sitoumukset on sinetöity; niiden noudattamatta jättäminen on julkisesti havaittavissa.
- **Takautuva uudelleenmäärittely spesifikaatioiden ulkopuoliselle erälle.** Jos vapautustestin
  tulos oli tosiasiassa raja-arvon ohut HYVÄKSYTTY, joka luokitellaan uudelleen
  HYLÄTYKSI vapauttamisen jälkeen, sinetöidyt raporttihashit todistavat, mitä alkuperäinen
  tulos-PDF sanoi.

**Vikatilanteet, jotka EIVÄT kuulu suojan piiriin:**

- Petos itse valmistusprosessissa (sinetti ankkuroi testin
  tulokset, ei valmistuksen eheyttä).
- Haittavaikutukset, jotka ovat biologisia seurauksia muutoin
  hyväksyttävästi läpäisseestä erästä (sinetti ei sertifioi kliinistä turvallisuutta, vain
  dokumentaation eheyttä).
- Kiistat siitä, mikä versio sääntelyspesifikaatiosta on
  arvovaltainen.

## Milloin käyttää tätä pakkia

Harkitse erän vapauttamisen sinetöintiä, jos:

- Olet rokotevalmistaja, joka haluaa osoittaa vapautusasiakirjojen
  oikeuslääketieteellisen eheyden laajemmin kuin sääntely edellyttää
- Olet QA-tiimi, joka ottaa käyttöön "julkaisemme sen, mistä annamme attestaation" -käytännön
- Olet pieni tai kansallisen mittakaavan valmistaja lainkäyttöalueella,
  jolla on heikompi sääntelyinfrastruktuuri, ja haluat ankkuroida eräasiakirjat
  globaalia todentajaa vasten
- Olet kansanterveysviranomainen tai kansalaisjärjestö, joka pyörittää
  ei-kaupallista rokotetuotanto-ohjelmaa (esim. laiminlyötyihin tauteihin)

## Historiallinen kuolleisuusennakkotapaus

- **Hepariinin saastuminen (2008, Kiina):** väärennetty ylisulfattu
  kondroitiinisulfaatti hepariinierissä. Sinetöity vapautustestien
  manifesti olisi tehnyt testirekisterin hiljaisen muuttamisen vapauttamisen
  jälkeen kryptografisesti havaittavaksi.
- **Tylenol-syanidi (1982):** takautuvat kiistat peukaloinnin
  alkupisteestä. Sinetöity valmistusrekisterin hash ankkuroi
  jakelua edeltävän tilan.
- **Erilaiset rokote-eräpalautukset**, joissa kysymys "testattiinko tämä erä
  koskaan asianmukaisesti" muuttuu kiistanalaiseksi vuosia myöhemmin.

Pakki EI ole ratkaisu MIHINKÄÄN näistä tiukassa mielessä — mutta jokaisessa
tapauksessa sinetöidyt eräattestaatiot olisivat tarjonneet selkeämmän
oikeuslääketieteellisen aikajanan.

## Miten haarauttaa tämä pakki todelliseen erään

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # korvaa fiktiivinen sisältö oikealla erällä
bash build/seal.sh        # SINETÖI ENNEN kuin jakelu alkaa
python3 build/verify.py   # vahvista
```

**KRIITTINEN AJOITUS**: sinetöi QA-vapautushetkellä, ENNEN kuin erä
on jaettu. Jakelun jälkeen tehty sinetöinti on oikeuslääketieteellisesti heikompi.

## Integraatio olemassa olevaan farmaseuttiseen infrastruktuuriin

- **eCTD-jätökset (FDA / EMA):** sinetöityyn julkaisuun URL tai IPFS
  CID voidaan viitata moduulin 3 (laatu) osiossa
- **WHO Prequalification:** sinetöity manifesti osoittaa
  vapauttamista edeltävän testausketjun muille kuin FDA/EMA-lainkäyttöalueille
- **Lääkevalvonnan palaute:** FACT 05 sitouttaa valmistajan
  sinetöityyn aggregoitujen AE-määrien raportointiin 6 ja 12 kuukauden kohdalla
- **Takaisinvetojärjestelmät (RxConnect, MedWatch):** jos takaisinveto tarvitaan,
  takaisinvedon laajuus itse on sinetöity MYRIAM:n alla, mikä tarjoaa julkista
  todennusta siitä, että kaikki jaellut erät käsitellään

## Mitä tämä pakki EI korvaa

- FDA:n / EMA:n / WHO:n viranomaishakemuksia
- GMP-auditointiketjuja (sinetti ankkuroi TULOKSIA, ei raakaprosessitietueita)
- Lääkevalvontatietokantoja (VAERS / EudraVigilance)
- Takaisinvedon koordinointijärjestelmiä

## Lisenssi

Public domain (CC0). Haarauta se. Mainintaa ei tarvita.
