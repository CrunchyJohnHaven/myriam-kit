*Norsk oversettelse — for den engelske originalen, se [README.md](README.md)*

# Forseglingssett for varslermanifest

Et nøkkelferdig myriam-kit-eksempel for varslere som står overfor den
spesifikke feilmodusen der **bevis blir begravd, redigert eller bestridt
av mellomledd mellom varsleren og offentligheten**. De kanoniske
historiske sakene dette forsvarer mot:

- Boeing 737 MAX (interne sikkerhetsrapporter underkjent/begravd)
- Theranos (bekymringer om labtester undertrykt i årevis)
- FDA-inspektørrapporter redigert etter innlevering
- Frances Haugen / Facebook (et forseglet manifest ville ha bevist
  at dokumentene var autentiske og eksisterte på det hevdede tidspunktet)

Hva dette settet forsvarer mot (i protokolltermer):

- T1–T3 i [FACT 05](facts/05_threat_model.txt): offentlig bestridelse
  av dokumentinnhold, påstander om at dokumenter ikke var forseglet
  på det hevdede tidspunktet, påstander om tilbakevirkende fabrikasjon.
- T9: tredjeparter som overleverer endrede kopier til journalister.

Hva dette settet **ikke** forsvarer mot:

- Personlig represalie mot varsleren (T7).
- Press på varsleren om å trekke tilbake (T4, delvis avhjulpet ved
  at FACT 07 gjør stille tilbaketrekning offentlig oppdagbar).
- Rettslige skritt mot varsleren for selve avsløringen (T5).
- Mistenkeliggjøring av varslerens karakter (T8).
- Mellomledd som stille lar saken falle (T10).

Hvis du er en varsler som vurderer å bruke dette settet, **les hele
denne README-en først**. Protokollen er et verktøy. Protokollen er
ingen erstatning for juridisk rådgivning, en journalist, en
tilsynsmyndighet eller nøye operasjonell sikkerhet.

## Hva dette settet produserer

Et kryptografisk forseglet *manifest* over bevis (ikke beviset selv)
som beviser:

1. De spesifikke bytene i hver bevisfil eksisterte i forseglingsøyeblikket.
2. Forseglingen skjedde på eller før et spesifikt tidspunkt (via Bitcoin
   OTS-attestasjon).
3. Opphav, anklage, trusselmodell, mottakerprotokoll og
   ikke-stille-tilbaketrekning-forpliktelsen ble alle erklært samlet.

De underliggende dokumentene forblir i din besittelse inntil du sender
dem til en mottaker. Mottakere verifiserer at de mottok de samme bytene
du forseglet.

## Når dette settet skal brukes

Du bør vurdere å forsegle et manifest **før** du overfører bevis til
en journalist, tilsynsmyndighet eller advokat, hvis alt det følgende
er sant:

- Du har bevis i digital form (PDF-er, e-poster, bilder osv.) som du
  vil bevare som byte-for-byte autentiske.
- Du forventer at mellomledd kan endre, bestride eller begrave
  beviset.
- Du kan beholde de underliggende dokumentene i din besittelse inntil
  overføringen.
- Du kan publisere manifestet offentlig **uten** å avsløre innholdet
  i dokumentene (kun hashene er offentlige).
- Du har veid risikoen ved å bli offentlig identifiserbar som
  varsler (signing-principal-feltet). Hvis anonym, bruk et pseudonym
  konsekvent på tvers av alle relaterte publikasjoner.
- Du har konsultert en advokat om varslervernlovgivning i din
  jurisdiksjon.

## Når dette settet IKKE skal brukes

Bruk IKKE dette settet hvis:

- Dokumentene selv inneholder personopplysninger om tredjeparter
  (pasienter, kunder, ansatte) som ikke bør gjøres offentlig-hashbare.
  Hash en sladdet versjon, ikke originalen.
- Selve publiseringen av manifestet ville identifisere varsleren på
  en måte vedkommende ikke har samtykket til.
- Du ennå ikke har konsultert en advokat. Protokollen er et verktøy;
  varslervernlovgivning er jurisdiksjonsspesifikk og lever utenfor
  protokollen.
- Du kanskje vil trekke tilbake en enkelt anklage senere. Forseglingen
  er permanent; nye forseglede rettelser er den eneste ærlige måten å
  revidere på.
- Du gjør dette under tvang eller tidspress. Protokollen forsterker
  tvang; avslagsporten (myriam-kit `SPEC §8`) gjelder for varslere
  så vel som for utgivere.

## Hvordan forke dette settet for en reell avsløring

```bash
# 1. Kopier dette eksempelet til en ny katalog
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Fjern det fiktive innholdet; erstatt med dine reelle fakta.
# Hver fil under facts/ er ett faktum. Les hver og erstatt.
$EDITOR facts/01_example_notice.txt   # endre til en reell følgeskrivelse
$EDITOR facts/02_provenance.txt       # reelt opphav til ditt bevis
$EDITOR facts/03_evidence_manifest.txt # hash dine reelle dokumenter og list dem opp
$EDITOR facts/04_allegation_summary.txt # din reelle anklage
$EDITOR facts/05_threat_model.txt     # dine reelle forventede reaksjoner
$EDITOR facts/06_recipient_protocol.txt # juster for din mottaker
$EDITOR facts/07_no_retraction_commitment.txt # din ikke-tilbaketrekning-erklæring
$EDITOR facts/08_signing_principal.txt # din reelle signeringsidentitet (eller pseudonym)

# 3. Oppdater site/index.html for å reflektere de reelle fakta.
# seal.sh-skriptet fyller IKKE ut HTML-en automatisk; den manuelle
# redigeringen er steget for menneskelig gjennomgang.
$EDITOR site/index.html

# 4. Forsegle.
bash build/seal.sh
# Utdata: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Verifiser lokalt.
python3 build/verify.py

# 6. Publiser manifestet (IKKE dokumentene) til en av følgende:
#    - En statisk vert du kontrollerer (Cloudflare Pages, GitHub Pages osv.)
#    - IPFS-nettverket på den utskrevne CID-en
#    - Begge (anbefalt)

# 7. Overfør separat de underliggende dokumentene til mottakeren
#    via en sikker kanal etter eget valg (Signal, SecureDrop osv.).
#    Mottakeren verifiserer filhasher mot ditt manifest.
```

## Beregne hasher for de reelle bevisfilene

For å hashe en dokumentfil med SHA-256:

```bash
shasum -a 256 my_document.pdf
```

De første 64 hex-tegnene er SHA-256. Sett det inn i manifestet.

Du kan hashe mange filer på en gang:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Det gir deg dataene for `facts/03_evidence_manifest.txt`.

## Merknader om operasjonell sikkerhet

MYRIAM-protokollen tilbyr IKKE operasjonell sikkerhet. Den tilbyr
*evidensiell holdbarhet*. Du trenger fortsatt:

- En sikker kommunikasjonskanal til din advokat
  ([Signal](https://signal.org/), personlig eller advokatens
  etablerte sikre kanal)
- En sikker lagringsplassering for de underliggende dokumentene
  (kryptert i hvile, ikke på skytjenester som din arbeidsgiver kan få
  tilgang til)
- En ren enhet for forseglingen (en personlig bærbar PC som ikke er
  knyttet til arbeidsgiverkontoer; helst en som kun brukes til dette
  formålet)
- Et rent nettverk for publisering (ikke din arbeidsgivers nettverk,
  ikke din hjemme-IP hvis din arbeidsgiver kan stevne din ISP)

Anbefalt lesning om operasjonell sikkerhet for varslere:

- [The Intercept's SecureDrop-dokumentasjon](https://securedrop.org/)
- [Freedom of the Press Foundations ressurser](https://freedom.press/)
- [EFFs guide for selvforsvar mot overvåking](https://ssd.eff.org/)

Konsulter dem FØR du starter forseglingsprosessen. Protokollen
beskytter ikke mot dårlige opsec-valg gjort før protokollen påkalles.

## Hva mottakere bør vite

Send mottakere denne README-en sammen med det forseglede manifestet.
Manifestet selv inneholder mottakerprotokollen (FACT 06), men README-en
utdyper mottakerrollen:

- **Journalister**: verifiser først manifestets egen integritet. Be
  deretter om dokumentene gjennom en separat sikker kanal. Verifiser
  at hvert dokuments SHA-256 stemmer med manifestet før publisering.
  Publiser IKKE dokumentene uten varslerens samtykke; publiser
  imidlertid eksistensen av det forseglede manifestet og din
  verifikasjonskonklusjon.
- **Tilsynsmyndigheter**: samme verifikasjonsprosess. Det forseglede
  manifestet pluss samsvarende dokumenter er den sterkeste
  evidensformen tilgjengelig utenfor formell chain-of-custody-innsamling.
- **Advokater**: det forseglede manifestet gir forensisk forankring
  for dokumentenes eksistens på det hevdede tidspunktet. Hvorvidt det
  oppfyller en spesifikk jurisdiksjons bevisregler, er opp til deg
  å avgjøre.

## Hva dette settet IKKE er

- Ingen erstatning for juridisk rådgivning.
- Ingen garanti for at noen vil handle på din avsløring.
- Ingen beskyttelse mot represalier.
- Ingen autentisering av dokumentenes innhold (kun av bytene
  på forseglingstidspunktet).
- Ingen måte å kommunisere anonymt med noen på — forseglingen er
  offentlig; hvis ditt signing-principal-navn er reelt, er du
  identifisert.

## Avslutning

Et forseglet manifest er en liten ting. Det er én bytestrøm som
beviser at et større sett av bytestrømmer eksisterte i en bestemt
form på et bestemt tidspunkt. Den litenheten er dets styrke: det
gjør kun én ting, og det gjør den ene tingen gjennom hele
Bitcoin-blokkjedens levetid.

Hvis du leser dette fordi du vurderer å bli varsler, vennligst:
snakk med en advokat først. Bruk de operasjonelle sikkerhetsguidene
ovenfor. Deretter, hvis og bare hvis alle disse oppstrøms hensynene
er på plass, vurder dette settet som den kryptografiske ryggraden
i din avsløring. Kryptografien er den enkle delen. Alt oppstrøms
fra kryptografien er der den reelle risikoen lever.

## Lisens

Allment tilgjengelig (CC0). Fork det. Forbedre det. Bruk det uten
å be om tillatelse.
