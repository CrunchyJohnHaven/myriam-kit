*Svensk översättning — för den engelska originalversionen, se [README.md](README.md)*

# Kit för låsning av AI-modellers beteende

Ett nyckelfärdigt myriam-kit-exempel för AI-laboratorier (kommersiella
eller öppen källkod) som släpper en modell och vill göra
releasens påståenden — viktidentitet, kapaciteter, utvärderingsresultat,
säkerhetsgranskning, åtaganden före driftsättning — **kryptografiskt
förankrade och offentligt verifierbara**.

Kitet skyddar mot det specifika felläget där driftsatta modeller
tyst driver iväg, utvärderingsresultat retconnas, eller åtaganden
före driftsättning bestrids år senare som "det sa vi aldrig."

## Vad detta kit producerar

Ett kryptografiskt förseglat manifest som för en modellrelease innehåller:

1. Modellidentifikation (namn, arkitektur, parameterantal, licens)
2. **SHA-256 för viktfilen** — den kanoniska artefakthashen
3. Modellkortstext (kapaciteter, avsedd användning, användning utanför
   ramarna, kända fellägen)
4. Utvärderingsresultat vid release (kapacitetsutvärderingar,
   säkerhetsutvärderingar, kalibrering)
5. Åtaganden före driftsättning (det du åtar dig att inte tyst
   ändra efter release)
6. Signerande huvudman (människan + organisationen som tar ansvaret)

Förseglingen gör vart och ett av dessa byte-stabilt, tidsförankrat
till Bitcoin via OpenTimestamps, och hämtningsbart via IPFS oberoende
av någon enskild värdpart.

Se det utarbetade fiktiva exemplet: [facts/](facts/) och den
renderade [site/index.html](site/index.html). Exemplet använder en
fiktiv modell ("Calm-mini-v0"); en verklig release skulle ersätta
exemplets innehåll.

## Vad detta kit skyddar mot

**Fellägen som förseglingen direkt fångar:**

- **Viktmanipulation** — den släppta viktfilens SHA-256 finns i
  FAKTUM 03. Varje förändring av byten som en användare laddar ner
  efter release är detekterbar genom att hasha om.
- **Tysta retroaktiva ändringar av utvärderingar** — utvärderings-
  resultaten vid release finns i FAKTUM 05. Framtida tvister om
  "utvärderingsresultatet var alltid X" har en offentlig förankring.
- **Drift i kapacitetspåståenden** — modellkortstexten i FAKTUM 04
  är byte-stabil. Framtida tvister om "vi har aldrig påstått
  kapacitet X" är offentligt kontrollerbara mot den förseglade
  texten.
- **Tyst omdistribution av finjusteringar** — åtagande #1 före
  driftsättning i FAKTUM 06 (i det utarbetade exemplet) är "ingen
  tyst finjustering under samma namn." Detektering: varje ny
  vikthash innebär ett nytt modellnamn och en ny förseglad
  publikation, annars är åtagandet brutet.
- **Dolda fellägen** — FAKTUM 04 förbinder sig till en lista över
  kända fellägen. Listan är monoton (kan växa, men inte krympa för
  en frusen checkpoint). Framtida upptäckter av fellägen som
  laboratoriet visste om internt men inte publicerade blir
  bestridbart bevis.

**Fellägen som INTE täcks:**

- Modeller som missbrukas av användare i senare led (förseglingen
  bevisar vad som släpptes, inte vad användarna gör med det).
- Adversariell finjustering av tredje parter (en tredje parts
  finjustering producerar en annan vikthash, så den ursprungliga
  förseglingen påverkas inte, men tredje partens modell ligger
  utanför förseglingens skydd).
- Beteendeförändringar på grund av förändringar i driftsättnings-
  miljön (olika systemprompter, RAG-konfigurationer osv.).
- Misslyckanden som laboratoriet uppriktigt inte visste om vid
  releasetidpunkten. Förseglingen förbinder laboratoriet till *vad
  de visste*; den kan inte förankra det de inte visste.

## När man ska använda detta kit

Du bör överväga att försegla ett modellkort om:

- Du släpper modellvikter offentligt ELLER driftsätter en modell i
  ett sammanhang där användare i senare led bryr sig om
  beteendestabilitet.
- Releasen är betydande nog att framtida tvister om "det sa vi
  aldrig" är troliga (varje modell driftsatt i stor skala; varje
  säkerhetskritisk modell; varje release åtföljd av kapacitets-
  påståenden).
- Din organisation är villig att göra åtaganden före driftsättning
  som begränsar framtida åtgärder (detta är det lastbärande — se
  nästa avsnitt).
- Du kan beräkna SHA-256 för viktfilen vid release.

## När man INTE ska använda detta kit

Använd INTE detta kit om:

- Du inte är villig att vara bunden av åtagandena före driftsättning
  i FAKTUM 06 i exemplet. Förseglingen gör åtaganden mekaniskt
  detekterbara; om du inte är beredd på den ansvarsskyldigheten,
  försegla inte.
- Viktfilen kommer att ändras ofta (t.ex. kontinuerliga
  finjusteringspipelines). Varje viktändring kräver en ny förseglad
  release. Försegling per release är tung; detta kit är för
  *frysta* checkpoints.
- Du har inte gjort säkerhetsgranskningen ännu. Förseglingen
  förbinder säkerhetsgranskningens fynd. Om du förseglar en
  ofullständig granskning har du ett permanent offentligt register
  av en ofullständig granskning.
- Du kan vilja återkalla något specifikt utvärderingsresultat
  senare. Förseglingen är permanent. Nya förseglade publikationer
  kan ersätta, men originalet kan inte ogöras.

## De lastbärande åtagandena före driftsättning

Exemplets FAKTUM 06 förbinder utgivaren till:

1. **Ingen tyst finjustering under samma namn.** Varje finjustering
   producerar ett nytt modellnamn, en ny förseglad publikation, en
   ny vikthash. Föregångaren förblir kanoniskt den namngivna
   versionen.

2. **Inga tysta uppdateringar av utvärderingar.** Omvärderingar
   får nya förseglade publikationer som refererar till originalet
   via Merkle-rot. Versioner spåras, inte överskrivs.

3. **Kända fellägen kan växa, aldrig krympa.** En frusen checkpoint
   kan inte få fellägen åtgärdade. Så den publicerade listan är i
   praktiken monoton.

4. **Hantering av borttagning.** Om laboratoriet tvingas att ta
   bort modellen från distribution åtar de sig att publicera ett
   slutligt förseglat uttalande om borttagningen.

Ett laboratorium som antar detta kit behöver bestämma vilka av
dessa åtaganden det faktiskt kan hedra. Om du inte kan hedra alla
fyra, modifiera FAKTUM 06 *innan* försegling för att återspegla
det du kan hedra, och acceptera det resulterande försvagade
skyddet. Att försegla åtaganden du inte avser att hedra är värre
än att inte försegla alls.

## Hur man forkar detta kit för en verklig release

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

## Integration med befintliga releasepipelines

Kitet är utformat för att komponeras med befintliga verktyg, inte
ersätta dem:

- **Hugging Face**: inkludera den förseglade publikationens URL
  eller IPFS-CID i modellkortets README.md. Hänvisa läsarna till
  förseglingen för byte-stabila releasepåståenden.
- **GitHub-releaser**: inkludera OpenTimestamps-kvittot
  (`merkle_root.txt.ots`) som en releaseresurs. Framtida tvister om
  "releasen har ändrats" är då förankrade till Bitcoin.
- **Modellkortsstandarder (Mitchell et al. 2019)**: kitet är
  kompatibelt. Standardmodellkortfälten mappas till FAKTA 02–05
  i förseglingen. Du producerar modellkortet normalt och förseglar
  det dessutom.
- **Utvärderingsharnskor (lm-evaluation-harness, BIG-bench, etc.)**:
  hasha den exakta harnsk-commit och rådata-JSON-utdata; referera
  till dessa hashes i FAKTUM 05. Framtida omkörningar är då
  oberoende reproducerbara.

## Att beräkna vikthashen

För en enskild safetensors-fil:

```bash
shasum -a 256 model.safetensors
```

För flerfils-checkpoints (GGUF-shards, sharded safetensors):

```bash
# Concatenate hashes in sorted order, then hash again
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Den slutliga hashen är det som hamnar i FAKTUM 03. Inkludera både
hashes per shard och den slutliga aggregerade hashen så att
användare kan verifiera enskilda shards när de laddar ner dem.

## Vad mottagare (användare av din modell) bör veta

En modellrelease med en MYRIAM-förseglad publikation låter användaren:

1. **Verifiera vikterna de laddat ner** genom att hasha om och
   jämföra med FAKTUM 03.
2. **Verifiera att modellkortet inte har retroaktivt ändrats** genom
   att kontrollera det förseglade FAKTUM 04 mot laboratoriets
   nuvarande publicerade version.
3. **Verifiera att utvärderingsresultaten är de som gällde vid
   release** genom att jämföra laboratoriets nuvarande utvärderings-
   påståenden mot det förseglade FAKTUM 05.
4. **Hålla laboratoriet ansvarigt för dess åtaganden före
   driftsättning** genom att kontrollera faktiskt beteende mot det
   förseglade FAKTUM 06.

En användare som hittar avvikelser har kryptografiskt bevis på
avvikelsen. De kan publicera det beviset; den ursprungliga
förseglade publikationen är förankringen.

## Vad detta kit INTE är

- Inte en ersättning för att faktiskt utföra säkerhetsgranskning.
  Förseglingen är *register* över säkerhetsgranskning, inte
  granskningen i sig.
- Inte en ersättning för faktiska utvärderingar. Förseglingen
  förankrar de resultat du producerar; den validerar inte
  metodiken.
- Inte en garanti för att modellen är säker. Förseglingen
  dokumenterar vad laboratoriet påstår om modellen vid release;
  den certifierar inte dessa påståenden.
- Inte skydd mot modellmissbruk av användare i senare led.

## En anmärkning om adversariell finjustering

En vanlig AI-säkerhetsfråga: någon finjusterar din modell för att
ta bort säkerhetsbeteenden och omdistribuerar den. Förseglingen
KAN INTE förhindra detta. Vad förseglingen kan göra är:

- Förankra vad den *ursprungliga* modellen skulle göra (FAKTUM 04).
- Förankra vilka de ursprungliga utvärderingsresultaten var
  (FAKTUM 05).
- Tillhandahålla en referenspunkt mot vilken adversariella
  finjusteringar kan mätas.

En användare som stöter på en omdistribution från tredje part kan
verifiera om vikterna matchar den ursprungliga förseglade hashen.
Om inte vet användaren att de har en icke-original modell och att
eventuella säkerhetspåståenden som tillskrivs laboratoriet inte
gäller.

## Avslutning

Att försegla en modellrelease är litet extraarbete för
laboratoriet: ~10 minuter att beräkna hashes och köra
förseglingsskriptet, sedan ett 30-sekunders beslut om vilka
åtaganden före driftsättning som ska inkluderas. Den
ansvarsskyldighet det tillför är asymmetrisk: liten kostnad för
ärliga laboratorier, stor begränsning för laboratorier som annars
skulle tyst driva iväg sina påståenden.

Om du är ett AI-laboratorium som överväger införande är kitet
public domain (CC0). Forka det. Modifiera det. Matematiken är
det lastbärande, inte den specifika implementationen.

## License

Public domain (CC0). No attribution required.
