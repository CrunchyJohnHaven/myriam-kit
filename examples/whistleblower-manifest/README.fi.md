*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# Ilmiantajan manifestin sinetöintipakki

Avaimet käteen -mallinen myriam-kit-esimerkki ilmiantajille, jotka
kohtaavat sen erityisen vikatilanteen, jossa **todisteet haudataan,
muokataan tai välittäjät kiistävät ne ilmiantajan ja yleisön
välillä**. Kanoniset historialliset tapaukset, joita vastaan tämä
suojaa:

- Boeing 737 MAX (sisäiset turvallisuusraportit vähäteltyinä/haudattuina)
- Theranos (laboratoriotestihuolet vaiennettu vuosiksi)
- FDA:n tarkastajaraportit muokattuna jättämisen jälkeen
- Frances Haugen / Facebook (sinetöity manifesti olisi todistanut,
  että dokumentit olivat aitoja ja olemassa väitettynä ajankohtana)

Mitä tämä pakki suojaa (protokollatermein):

- T1–T3 [FACT 05:ssä](facts/05_threat_model.txt): julkinen
  dokumenttisisällön kiistäminen, väitteet siitä ettei dokumentteja
  ollut sinetöity väitettynä ajankohtana, väitteet takautuvasta
  väärentämisestä.
- T9: kolmannet osapuolet, jotka luovuttavat toimittajille muokattuja
  kopioita.

Mitä tämä pakki **ei** suojaa:

- Henkilökohtainen kosto ilmiantajaa kohtaan (T7).
- Painostus ilmiantajaa kohtaan, jotta tämä vetäisi sanansa takaisin
  (T4, osittain lievennetty siten, että FACT 07 tekee hiljaisen
  vetäytymisen julkisesti havaittavaksi).
- Oikeudelliset toimet ilmiantajaa vastaan itse paljastuksesta (T5).
- Ilmiantajan henkilön mustamaalaaminen (T8).
- Välittäjät, jotka antavat tarinan kuolla hiljaisesti (T10).

Jos olet ilmiantaja, joka harkitsee tämän pakin käyttöä, **lue tämä
README kokonaisuudessaan ensin**. Protokolla on työkalu. Protokolla
ei korvaa juridista neuvontaa, toimittajaa, sääntelyviranomaista tai
huolellista operatiivista turvallisuutta.

## Mitä tämä pakki tuottaa

Kryptografisesti sinetöity *manifesti* todisteista (ei itse
todisteita), joka todistaa:

1. Kunkin todistetiedoston tarkat tavut olivat olemassa
   sinetöintihetkellä.
2. Sinetöinti tapahtui tiettynä ajankohtana tai sitä ennen (Bitcoinin
   OTS-attestoinnin kautta).
3. Alkuperä, syyte, uhkamalli, vastaanottajaprotokolla ja
   ei-hiljaista-vetäytymistä-sitoumus julistettiin yhdessä.

Taustalla olevat dokumentit pysyvät hallussasi, kunnes lähetät ne
vastaanottajalle. Vastaanottajat varmistavat, että he saivat samat
tavut, jotka sinä sinetöit.

## Milloin tätä pakkia tulisi käyttää

Sinun tulisi harkita manifestin sinetöintiä **ennen** kuin siirrät
todisteita toimittajalle, sääntelyviranomaiselle tai asianajajalle,
jos kaikki seuraavat ovat totta:

- Sinulla on todisteita digitaalisessa muodossa (PDF:t, sähköpostit,
  kuvat jne.), jotka haluat säilyttää tavutarkasti aitoina.
- Odotat, että välittäjät saattavat muuttaa, kiistää tai haudata
  todisteet.
- Voit pitää taustalla olevat dokumentit hallussasi siirtoon asti.
- Voit julkaista manifestin julkisesti **ilman** dokumenttien
  sisällön paljastamista (vain hashit ovat julkisia).
- Olet punninnut riskejä siitä, että sinut tunnistetaan julkisesti
  ilmiantajaksi (signing-principal-kenttä). Jos anonyymi, käytä
  pseudonyymiä johdonmukaisesti kaikissa aiheeseen liittyvissä
  julkaisuissa.
- Olet konsultoinut asianajajaa ilmiantajansuojalainsäädännöstä
  lainkäyttöalueellasi.

## Milloin tätä pakkia EI tulisi käyttää

ÄLÄ käytä tätä pakkia, jos:

- Itse dokumentit sisältävät henkilötietoja kolmansista osapuolista
  (potilaista, asiakkaista, työntekijöistä), joita ei tulisi tehdä
  julkisesti hashittaviksi. Hashita sensuroitu versio, älä alkuperäistä.
- Itse manifestin julkaiseminen tunnistaisi ilmiantajan tavalla, johon
  hän ei ole suostunut.
- Et ole vielä konsultoinut asianajajaa. Protokolla on työkalu;
  ilmiantajansuojalainsäädäntö on lainkäyttöaluekohtaista ja elää
  protokollan ulkopuolella.
- Saatat haluta perua yksittäisen syytöksen myöhemmin. Sinetti on
  pysyvä; uudet sinetöidyt oikaisut ovat ainoa rehellinen tapa
  korjata.
- Teet tämän pakon tai aikapaineen alaisena. Protokolla vahvistaa
  pakkoa; kieltäytymisportti (myriam-kit `SPEC §8`) koskee yhtä
  lailla ilmiantajia kuin julkaisijoita.

## Miten haarauttaa tämä pakki todelliseen paljastukseen

```bash
# 1. Kopioi tämä esimerkki uuteen hakemistoon
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Poista fiktiivinen sisältö; korvaa todellisilla faktoilla.
# Jokainen tiedosto facts/-hakemistossa on yksi fakta. Lue jokainen ja korvaa.
$EDITOR facts/01_example_notice.txt   # vaihda todelliseksi saatelauseeksi
$EDITOR facts/02_provenance.txt       # todisteittesi todellinen alkuperä
$EDITOR facts/03_evidence_manifest.txt # hashita todelliset dokumentit ja listaa ne
$EDITOR facts/04_allegation_summary.txt # todellinen syytöksesi
$EDITOR facts/05_threat_model.txt     # todelliset odotetut vastaukset
$EDITOR facts/06_recipient_protocol.txt # mukauta vastaanottajalle
$EDITOR facts/07_no_retraction_commitment.txt # ei-peruuttamis-julistuksesi
$EDITOR facts/08_signing_principal.txt # todellinen allekirjoitusidentiteettisi (tai pseudonyymi)

# 3. Päivitä site/index.html heijastamaan todellisia faktoja.
# seal.sh-skripti EI täytä HTML:ää automaattisesti; manuaalinen
# muokkaus on ihmistarkastusvaihe.
$EDITOR site/index.html

# 4. Sinetöi.
bash build/seal.sh
# Tuotokset: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Vahvista paikallisesti.
python3 build/verify.py

# 6. Julkaise manifesti (EI dokumentteja) johonkin seuraavista:
#    - Hallinnoimaasi staattiseen isäntään (Cloudflare Pages, GitHub Pages jne.)
#    - IPFS-verkkoon tulostettuun CID:hen
#    - Molempiin (suositus)

# 7. Siirrä erikseen taustalla olevat dokumentit vastaanottajalle
#    valitsemaasi turvallista kanavaa pitkin (Signal, SecureDrop jne.).
#    Vastaanottaja vahvistaa tiedostohashit manifestiasi vasten.
```

## Hashien laskeminen todellisille todistetiedostoille

Dokumenttitiedoston hashaaminen SHA-256:lla:

```bash
shasum -a 256 my_document.pdf
```

Ensimmäiset 64 heksamerkkiä ovat SHA-256. Laita se manifestiin.

Voit hashata monia tiedostoja kerralla:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Se antaa sinulle datan tiedostoon `facts/03_evidence_manifest.txt`.

## Operatiivisen turvallisuuden huomiot

MYRIAM-protokolla EI tarjoa operatiivista turvallisuutta. Se tarjoaa
*näytöllistä kestävyyttä*. Tarvitset edelleen:

- Turvallisen viestintäkanavan asianajajaasi
  ([Signal](https://signal.org/), henkilökohtaisesti tai asianajajasi
  vakiintunut turvallinen kanava)
- Turvallisen säilytyspaikan taustalla oleville dokumenteille
  (lepotilassa salattuna, ei pilvipalveluissa, joihin työnantajasi
  pääsee käsiksi)
- Puhtaan laitteen sinetöintiä varten (henkilökohtainen kannettava,
  joka ei ole yhteydessä työnantajan tileihin; mieluiten sellainen,
  jota käytetään vain tähän tarkoitukseen)
- Puhtaan verkon julkaisemista varten (ei työnantajasi verkko,
  ei kotisi IP, jos työnantajasi voi haastaa ISP:si)

Suositeltua luettavaa operatiivisesta turvallisuudesta ilmiantajille:

- [The Interceptin SecureDrop-dokumentaatio](https://securedrop.org/)
- [Freedom of the Press Foundationin resurssit](https://freedom.press/)
- [EFF:n valvonnan itsepuolustusopas](https://ssd.eff.org/)

Konsultoi niitä ENNEN sinetöintiprosessin aloittamista. Protokolla
ei suojaa huonoilta opsec-valinnoilta, jotka on tehty ennen
protokollan käynnistämistä.

## Mitä vastaanottajien tulisi tietää

Lähetä vastaanottajille tämä README sinetöidyn manifestin kanssa.
Manifesti itsessään sisältää vastaanottajaprotokollan (FACT 06), mutta
README laajentaa vastaanottajan roolia:

- **Toimittajat**: varmista ensin manifestin oma eheys. Pyydä sitten
  dokumentit erillistä turvallista kanavaa pitkin. Varmista, että
  kunkin dokumentin SHA-256 vastaa manifestia ennen julkaisua. ÄLÄ
  julkaise dokumentteja ilman ilmiantajan suostumusta; julkaise
  kuitenkin sinetöidyn manifestin olemassaolo ja
  varmistuspäätelmäsi.
- **Sääntelyviranomaiset**: sama varmistusprosessi. Sinetöity
  manifesti yhdessä vastaavien dokumenttien kanssa on vahvin
  näytön muoto, joka on saatavilla virallisen
  chain-of-custody-keräyksen ulkopuolella.
- **Asianajajat**: sinetöity manifesti tarjoaa forensisen ankkuroinnin
  dokumenttien olemassaololle väitettynä ajankohtana. Se, täyttääkö
  se jonkin tietyn lainkäyttöalueen näyttösäännöt, on sinun
  ratkaistavissasi.

## Mikä tämä pakki EI ole

- Ei korvaa juridista neuvontaa.
- Ei takaa, että kukaan toimii paljastuksesi pohjalta.
- Ei suojaa kostotoimilta.
- Ei dokumenttien sisällön todentamista (vain niiden tavujen
  sinetöintihetkellä).
- Ei keino kommunikoida anonyymisti kenenkään kanssa — sinetti on
  julkinen; jos signing-principal-nimesi on todellinen, sinut on
  tunnistettu.

## Loppusanat

Sinetöity manifesti on pieni asia. Se on yksi tavuvirta, joka todistaa,
että suurempi joukko tavuvirtoja oli olemassa tietyssä muodossa
tiettynä ajankohtana. Tuo pienuus on sen vahvuus: se tekee vain yhden
asian, ja se tekee tuon yhden asian Bitcoinin lohkoketjun koko eliniän
ajan.

Jos luet tätä, koska harkitset ilmiantajaksi ryhtymistä, ole hyvä:
puhu ensin asianajajan kanssa. Käytä yllä olevia operatiivisia
turvallisuusoppaita. Sitten, jos ja vain jos kaikki nämä yläpuoliset
seikat ovat kunnossa, harkitse tätä pakkia paljastuksesi
kryptografisena selkärankana. Kryptografia on helppo osa. Kaikki
kryptografian yläpuolella on siellä, missä todellinen riski elää.

## Lisenssi

Public domain (CC0). Haarauta se. Paranna sitä. Käytä sitä lupaa
pyytämättä.
