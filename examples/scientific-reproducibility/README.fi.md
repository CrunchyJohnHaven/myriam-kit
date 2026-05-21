*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Tieteellisen toistettavuuden pakki

Avaimet käteen -tyyppinen myriam-kit-esimerkki tutkimusryhmille, tieteellisille lehdille ja toistettavuuteen keskittyville instituutioille, jotka haluavat julkaista Bitcoiniin ankkuroidun, peukaloinnista todistavan toistettavuusmanifestin artikkelin tai preprintin yhteydessä.

## Mitä tämä pakki tuottaa

Sinetöity julkaisu, joka sisältää yhden tutkimuksen osalta:

1. Tutkimuksen tunnistetiedot (artikkelin otsikko, kirjoittajat, instituutio, rahoittajat, eturistiriidat)
2. **Raakadata-arkiston SHA-256** — kanoninen tietoaineisto
3. **Analyysipipelinen hash** — skripti + Docker-imagen digesti + lukitut riippuvuudet
4. **Odotetun tulosnipun hash** — mitä uskollisen toistajan pitäisi tuottaa
5. Toistoprotokolla + tulosten jälkeiset julkaisusitoumukset
6. Allekirjoittava(t) prinsipaali(t)

Sinetti on tarkoitettu **esi-analyysivaiheeseen**: data jäädytetty, pipeline viimeistelty, odotettu tulos laskettu, KAIKKI ennen kuin yhtäkään tulosta on nähty artikkelin kirjoittamista varten.

## Mitä vastaan tämä pakki suojaa

**Vikatilat, jotka sinetti havaitsee:**

- **p-hacking**: jälkikäteen tehdyt muutokset analyysiin tulosten näkemisen jälkeen ovat havaittavissa diffillä sinetöidyn FAKTAN 04 ja julkaistun pipelinen välillä.
- **HARKing** (Hypothesizing After Results are Known — hypoteesien muotoileminen sen jälkeen kun tulokset ovat tiedossa): FAKTAAN 02 ennakkorekisteröity hypoteesi on tavustasolla vakaa.
- **Datan manipulointi julkaisun jälkeen**: data-arkiston uudelleenhashaaminen FAKTAA 03 vasten paljastaa minkä tahansa muokkauksen.
- **Pipelinen ajautuminen**: analyysipipelinen uudelleenhashaaminen FAKTAA 04 vasten havaitsee hiljaiset muutokset.
- **Kirjoittajuuden manipulointi**: kirjoittajien hiljainen lisääminen tai poistaminen julkaisun jälkeen muuttuu havaittavaksi sinetöityä FAKTAA 02 vasten.

**Vikatilat, joita EI kateta:**

- Vilppi raakadatan keräyksessä (sinetti ankkuroi datan sinetöintihetkellä, ei keräyshetkellä)
- Biologinen / empiirinen toistamattomuus (sinetti ankkuroi vain laskennallisen toistettavuuden)
- Otoskoon tai populaation validiteetin kysymykset (nämä ovat tutkimusasetelman kysymyksiä)
- Pohjana olevan väitteen totuus (sinetti ankkuroi sen, mitä väitettiin, ei sitä, vastaako maailma väitettä)

## Milloin käyttää tätä pakkia

Harkitse sinetöintiä, jos:

- Olet tutkimusryhmä, joka suorittaa korkean panoksen analyysiä (kliininen tutkimus, tekoälyjärjestelmän arviointi, replikaatiotutkimus) ja haluat forensisen eheyden, joka ylittää OSF:n / GitHubin aikaleimat
- Olet uransa alkuvaiheen tutkija, joka haluaa epäsymmetristä mainesuojaa: sinetöity esi-analyysi tarkoittaa, että tuleva „he p-hackasivat" -kritiikki saa julkisen falsifioijan
- Olet tieteellisen lehden toimittaja tai replikaatiohankkeen johtaja, joka haluaa kannustaa kryptografisen tason ennakkorekisteröintiä artikkelien osajoukolle
- Työskentelet analyysin parissa, jossa jälkikäteistwäkäyksillä on merkityksellisiä alakohtaisia seurauksia (psykologia, käyttäytymistaloustiede, lääketieteellinen tutkimus)

## Historiallinen kuolleisuus-/haittaennakkotapaus

Tämän pakin merkitys kuolleisuuden kannalta on epäsuora:

- **Kantasolu- / syöpätutkimuksen toistamattomuus:** useat artikkelit ovat johtaneet potilashaittoihin harhaan johdettujen kliinisten tutkimusten kautta. Alkuperäisen pipelinen sinetöity ennakkorekisteröinti olisi ankkuroinut vertailun.
- **Tamiflun tehokkuuskiista:** Cochrane-katsaus kesti vuosia osittain siksi, että raakadataan pääsystä kiisteltiin. Sinetöidyt datahasht julkaisuhetkellä olisivat tehneet datan saatavuutta koskevista kiistoista välittömästi ratkottavia.
- **Yleinen toistamattomuuskriisi:** toistamattoman biolääketieteellisen tutkimuksen alakohtainen kuolleisuuskustannus on merkittävä (Begley & Ellis 2012 arvioivat, että >50 % prekliinisistä löydöksistä on toistamattomia). Kryptografinen ankkurointi on yksi rakenteellinen vipu.

## Kuinka forkata tämä pakki

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## Integraatio olemassa olevan tieteellisen infrastruktuurin kanssa

- **arXiv / bioRxiv / medRxiv**: sisällytä MYRIAM-sinetin URL tai IPFS-CID tiivistelmään tai liitemateriaaleihin
- **OSF**: liitä sinettiartefakti OSF-projektiin perinteisen ennakkorekisteröintilomakkeen rinnalle
- **AsPredicted**: sisällytä MYRIAM-sinetin URL ennakkorekisteröintidokumenttiin
- **GitHub**: analyysipipelinen commit-hash on se, minkä FAKTA 04 ankkuroi; GitHub tarjoaa lähteen, MYRIAM ankkuroi tavut
- **Zenodo / Figshare / OpenAIRE**: talleta raakadata, sinetöi sitten talletuksen hash; sinetti on forensisesti vaikeampi hiljaa korvata kuin talletuksen metatiedot
- **Lehtien liitemateriaalit**: sisällytä MYRIAM-sinettiartefakti liitetiedostona toimitettaessa

## Mitä tämä pakki EI korvaa

- IRB:n / eettisen toimikunnan hyväksyntää
- Vertaisarviointia
- Replikaatiotutkimuksia (laskennallinen toistettavuus ≠ empiirinen toistettavuus)
- Arkaluonteisten tietojen pääsyä koskevia sopimuksia

## Huomautus kirjoittajien järjestyksestä ja ansioista

Sinetti ankkuroi KIRJOITTAJALISTAN sinetöintihetkellä. Julkaisun jälkeen syntyvät kirjoittajuutta koskevat kiistat voidaan arvioida sinetöityä listaa vasten. Tämä on pieni vastuullisuusvipu — tärkeä uransa alkuvaiheen tutkijoille, joita lisätään tai poistetaan hiljaa.

## Lisenssi

Public domain (CC0). Käytä sitä, muokkaa sitä, jätä se huomiotta, forkkaa se.
