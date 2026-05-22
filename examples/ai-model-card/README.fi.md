*Suomennos — alkuperäisen englanninkielisen version löydät täältä: [README.md](README.md)*

# AI-mallin käyttäytymisen lukituspakki

Avaimet-käteen-myriam-kit-esimerkki tekoälylaboratorioille (kaupallisille tai
avoimen lähdekoodin) jotka julkaisevat mallin ja haluavat tehdä julkaisun
väittämistä — painojen identiteetti, kyvyt, arviointitulokset, turvallisuusarvio,
ennen käyttöönottoa annetut sitoumukset — **kryptografisesti ankkuroituja ja
julkisesti todennettavissa olevia**.

Pakki suojaa siltä erityiseltä vikatilanteelta, jossa käyttöönotetut mallit
ajautuvat hiljaa, arviointitulokset kirjoitetaan jälkikäteen uudelleen,
tai ennen käyttöönottoa annetut väitteet kiistetään vuosia myöhemmin
sanoin "emme koskaan sanoneet tuota".

## Mitä tämä pakki tuottaa

Kryptografisesti sinetöity manifesti, joka sisältää yhden mallijulkaisun osalta:

1. Mallin tunnistus (nimi, arkkitehtuuri, parametrimäärä, lisenssi)
2. **Painotiedoston SHA-256** — kanoninen artefaktin hash
3. Mallikortin teksti (kyvyt, suunniteltu käyttö, soveltamisalan ulkopuolinen
   käyttö, tunnetut vikatilanteet)
4. Arviointitulokset julkaisuhetkellä (kykyarvioinnit, turvallisuusarvioinnit,
   kalibrointi)
5. Ennen käyttöönottoa annetut sitoumukset (asiat, joita sitoudut olemaan
   hiljaa muuttamatta julkaisun jälkeen)
6. Allekirjoittava päämies (vastuun ottava henkilö + organisaatio)

Sinetti tekee jokaisesta näistä tavu-vakaan, ajallisesti Bitcoiniin OpenTimestampsin
kautta ankkuroidun ja IPFS:n kautta noudettavissa olevan riippumatta yhdestäkään
yksittäisestä isäntäpalvelusta.

Katso työstetty kuvitteellinen esimerkki: [facts/](facts/) ja renderöity
[site/index.html](site/index.html). Esimerkissä käytetään kuvitteellista mallia
("Calm-mini-v0"); todellinen julkaisu korvaisi esimerkkisisällön.

## Miltä tämä pakki suojaa

**Vikatilanteet, jotka sinetti suoraan napsahtaa kiinni:**

- **Painojen peukalointi** — julkaistun painotiedoston SHA-256 on
  FACT 03:ssa. Mikä tahansa julkaisunjälkeinen muutos käyttäjän lataamiin
  tavuihin on havaittavissa hashaamalla uudelleen.
- **Hiljaiset arviointien jälkikirjoitukset** — arviointitulokset julkaisuhetkellä ovat
  FACT 05:ssä. Tulevat "arviointitulos on aina ollut X" -kiistat
  saavat julkisen ankkurin.
- **Kykyväittämien ajautuminen** — mallikortin teksti FACT 04:ssä on
  tavu-vakaa. Tulevat "emme koskaan väittäneet kykyä X" -kiistat ovat
  julkisesti tarkistettavissa sinetöityä tekstiä vasten.
- **Hiljainen fine-tunen uudelleenjakelu** — ennen käyttöönottoa annettu sitoumus
  #1 FACT 06:ssa (työstetyssä esimerkissä) on "ei hiljaista fine-tuningia saman
  nimen alla". Tunnistus: mikä tahansa uusi painohash tarkoittaa uutta
  mallinimeä ja uutta sinetöityä julkaisua, tai sitoumus on rikottu.
- **Piilotetut vikatilanteet** — FACT 04 sitoutuu tunnettujen vikatilanteiden
  listaan. Lista on monotoninen (voi kasvaa, ei kutistua jäädytetylle
  tarkistuspisteelle). Tulevat löydökset vikatilanteista, jotka laboratorio tiesi
  sisäisesti mutta ei julkaissut, muuttuvat kiistettäväksi todistusaineistoksi.

**Vikatilanteet, jotka EIVÄT ole katettuja:**

- Mallin väärinkäyttö loppukäyttäjien toimesta (sinetti todistaa mitä
  julkaistiin, ei mitä käyttäjät tekevät sillä).
- Adversariaalinen fine-tuning kolmansien osapuolten toimesta (kolmannen osapuolen
  fine-tune tuottaa eri painohashin, joten alkuperäinen sinetti ei vahingoitu,
  mutta kolmannen osapuolen malli on sinetin suojan ulkopuolella).
- Käyttäytymismuutokset käyttöönottoympäristön muutoksista (eri
  järjestelmäkehotteet, RAG-konfiguraatiot jne.).
- Viat, joista laboratorio ei aidosti tiennyt julkaisuhetkellä. Sinetti
  sitoo laboratorion *siihen, mitä se tiesi*; se ei voi ankkuroida sitä
  mitä se ei tiennyt.

## Milloin tätä pakkia kannattaa käyttää

Sinun tulisi harkita mallikortin sinetöintiä, jos:

- Julkaiset mallipainoja julkisesti TAI otat mallin käyttöön kontekstissa,
  jossa loppukäyttäjille on tärkeää käyttäytymisen vakaus.
- Julkaisu on tarpeeksi merkittävä, että tulevat "emme koskaan sanoneet
  tuota" -kiistat ovat uskottavia (mikä tahansa malli, joka otetaan käyttöön
  mittakaavassa; mikä tahansa turvallisuuskriittinen malli; mikä tahansa
  julkaisu, johon liittyy kykyväittämiä).
- Organisaatiosi on valmis tekemään ennen käyttöönottoa annettuja sitoumuksia,
  jotka rajoittavat tulevia toimia (tämä on kantava kohta — katso
  seuraava osio).
- Voit laskea painotiedoston SHA-256:n julkaisuhetkellä.

## Milloin tätä pakkia EI kannata käyttää

ÄLÄ käytä tätä pakkia, jos:

- Et ole valmis olemaan sidottu ennen käyttöönottoa annettuihin sitoumuksiin
  esimerkin FACT 06:ssa. Sinetti tekee sitoumuksista mekaanisesti havaittavia;
  jos et ole valmis siihen tilivelvollisuuteen, älä sinetöi.
- Painotiedosto tulee muuttumaan usein (esim. jatkuvat
  fine-tuning-pipeline:t). Jokainen painomuutos vaatii uuden sinetöidyn
  julkaisun. Julkaisukohtainen sinetöinti on raskasta; tämä pakki on
  *jäädytettyjä* tarkistuspisteitä varten.
- Et ole vielä tehnyt turvallisuusarviota. Sinetti sitoutuu
  turvallisuusarvion löydöksiin. Jos sinetöit puutteellisen arvion, sinulla on
  pysyvä julkinen tietue puutteellisesta arvioista.
- Saatat haluta perua tietyn arviointituloksen myöhemmin. Sinetti on
  pysyvä. Uudet sinetöidyt julkaisut voivat syrjäyttää, mutta alkuperäistä
  ei voi peruuttaa.

## Kantavat ennen käyttöönottoa annetut sitoumukset

Esimerkin FACT 06 sitouttaa julkaisijan:

1. **Ei hiljaista fine-tuningia saman nimen alla.** Jokainen
   fine-tune tuottaa uuden mallinimen, uuden sinetöidyn julkaisun, uuden
   painohashin. Edeltäjä pysyy kanonisesti nimettynä versiona.

2. **Ei hiljaisia arviointien päivityksiä.** Uudelleenarvioinneille tehdään uudet
   sinetöidyt julkaisut, jotka viittaavat alkuperäiseen Merkle-juurella.
   Versioita seurataan, niitä ei kirjoiteta päälle.

3. **Tunnetut vikatilanteet voivat kasvaa, eivät koskaan kutistua.** Jäädytetyssä
   tarkistuspisteessä ei voi olla korjattuja vikatilanteita. Joten julkaistu
   lista on käytännössä monotoninen.

4. **Vetäytymisen käsittely.** Jos pakotetaan poistamaan malli jakelusta,
   laboratorio sitoutuu julkaisemaan lopullisen sinetöidyn lausunnon
   vetäytymisestä.

Tämän pakin omaksuvan laboratorion on päätettävä, mitä näistä sitoumuksista
se voi todella kunnioittaa. Jos et voi kunnioittaa kaikkia neljää, muokkaa
FACT 06:tta *ennen* sinetöintiä heijastamaan sitä, mitä voit kunnioittaa, ja
hyväksy seurauksena heikentynyt suoja. Sellaisten sitoumusten sinetöinti,
joita et aio kunnioittaa, on pahempaa kuin se, ettei sinetöi lainkaan.

## Miten haarauttaa tämä pakki todellista julkaisua varten

```bash
# 1. Copy this example into your release pipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Edit each fact for your real release
$EDITOR facts/01_example_notice.txt   # REMOVE — your release is not an example
                                       # Replace with a release notice for your model
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # the canonical model card
$EDITOR facts/05_eval_results.txt     # actual eval results
$EDITOR facts/06_release_commitments.txt # which commitments you can honor

# 3. Update site/index.html to reflect the real release.

# 4. Seal.
bash build/seal.sh

# 5. Verify locally.
python3 build/verify.py

# 6. Deploy to:
#    - Your release page (next to the model card and weights)
#    - The IPFS network (the seal.sh script already does this)
#    - Optionally: link to the sealed publication from your
#      Hugging Face / GitHub release notes
```

## Integraatio olemassa oleviin julkaisu-pipeline:eihin

Pakki on suunniteltu komponoitumaan olemassa olevien työkalujen kanssa,
ei korvaamaan niitä:

- **Hugging Face**: sisällytä sinetöidyn julkaisun URL tai IPFS CID
  mallikortin README.md:hen. Ohjaa lukijat sinetin pariin tavu-vakaiden
  julkaisuväittämien osalta.
- **GitHub-julkaisut**: sisällytä OpenTimestamps-kuitti
  (`merkle_root.txt.ots`) julkaisun assetina. Tulevat
  "julkaisu muuttui" -kiistat ovat sitten ankkuroituneet Bitcoiniin.
- **Mallikorttistandardit (Mitchell et al. 2019)**: pakki on
  yhteensopiva. Standardit mallikorttikentät kuvautuvat sinetin
  FACTS 02–05:een. Tuotat mallikortin normaalisti, ja lisäksi sinetöit sen.
- **Arviointiharnessit (lm-evaluation-harness, BIG-bench jne.)**: hashaa
  täsmällinen harness-commit ja raaka tulostus-JSON; viittaa näihin
  hasheihin FACT 05:ssä. Tulevat uudelleenajot ovat sitten itsenäisesti
  toistettavissa.

## Painojen hashin laskeminen

Yhdelle safetensors-tiedostolle:

```bash
shasum -a 256 model.safetensors
```

Monitiedostoisille tarkistuspisteille (GGUF-shardit, shardatut safetensors):

```bash
# Concatenate hashes in sorted order, then hash again
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Lopullinen hash on se, mikä menee FACT 03:een. Sisällytä sekä per-shard-hashit
että lopullinen yhdistelmähash, jotta käyttäjät voivat verifioida yksittäisiä
shardeja latauksen aikana.

## Mitä vastaanottajien (mallisi käyttäjien) tulisi tietää

Mallijulkaisu MYRIAM-sinetöidyn julkaisun kanssa sallii käyttäjän:

1. **Verifioida lataamansa painot** hashaamalla uudelleen ja vertaamalla
   FACT 03:een.
2. **Verifioida, ettei mallikorttia ole kirjoitettu jälkikäteen uudelleen**
   tarkistamalla sinetöity FACT 04 laboratorion nykyistä julkaistua versiota vasten.
3. **Verifioida, että arviointitulokset ovat julkaisuhetken tulokset**
   vertaamalla laboratorion nykyisiä arviointiväittämiä sinetöityyn FACT 05:een.
4. **Pitää laboratoriota tilivelvollisena ennen käyttöönottoa annetuista
   sitoumuksistaan** tarkistamalla todellinen käyttäytyminen sinetöityä FACT 06:tta vasten.

Käyttäjällä, joka löytää eroavaisuuksia, on kryptografinen näyttö
eroavaisuudesta. Hän voi julkaista tuon näytön; alkuperäinen sinetöity
julkaisu on ankkuri.

## Mitä tämä pakki EI ole

- Ei korvaa todellista turvallisuusarvion tekemistä. Sinetti on turvallisuusarvion
  *tietue*, ei itse arvio.
- Ei korvaa todellisia arviointeja. Sinetti ankkuroi tuottamasi tulokset;
  se ei validoi metodologiaa.
- Ei takuu siitä, että malli on turvallinen. Sinetti dokumentoi sen, mitä
  laboratorio väittää mallista julkaisuhetkellä; se ei sertifioi noita
  väitteitä.
- Ei suojaa mallin väärinkäytöltä loppukäyttäjien toimesta.

## Huomautus adversariaalisesta fine-tuningista

Yleinen AI-turvallisuushuoli: joku tekee fine-tuningin mallillesi poistaakseen
turvallisuuskäyttäytymistä ja jakaa sen uudelleen. Sinetti EI VOI estää tätä.
Mitä sinetti voi tehdä:

- Ankkuroida sen, mitä *alkuperäisen* mallin oli tarkoitus tehdä (FACT 04).
- Ankkuroida sen, mitkä olivat alkuperäiset arviointitulokset (FACT 05).
- Tarjota viitepisteen, jota vasten adversariaaliset fine-tunet voidaan
  mitata.

Kolmannen osapuolen uudelleenjakeluun törmäävä käyttäjä voi verifioida,
vastaavatko painot alkuperäistä sinetöityä hashia. Jos eivät, käyttäjä tietää
omistavansa ei-alkuperäisen mallin ja että mikä tahansa laboratorioon
liitetty turvallisuusväittämä ei päde.

## Loppusanat

Mallijulkaisun sinetöinti on pieni lisätyö laboratoriolle: ~10 minuuttia
hashien laskemiseen ja sinetöintiskriptin ajamiseen, sitten 30 sekunnin
päätös siitä, mitkä ennen käyttöönottoa annetut sitoumukset sisällyttää.
Lisätty tilivelvollisuus on epäsymmetrinen: pieni kustannus rehellisille
laboratorioille, suuri rajoite laboratorioille, jotka muuten ajauttaisivat
väitteitään hiljaa.

Jos olet AI-laboratorio, joka harkitsee käyttöönottoa, pakki on julkista
omaisuutta (CC0). Haarauta se. Muokkaa sitä. Matematiikka on kantava osa,
ei tietty toteutus.

## Lisenssi

Julkinen omaisuus (CC0). Atribuutiota ei vaadita.
