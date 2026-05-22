*Dansk oversættelse — for den originale engelske version, se [README.md](README.md)*

# Forseglingskit til varslermanifest

Et nøglefærdigt myriam-kit-eksempel for varslere, der står over for
det specifikke fejlscenarie, hvor **beviser bliver begravet, redigeret
eller bestridt af mellemled mellem varsleren og offentligheden**. De
kanoniske historiske sager, dette forsvarer imod:

- Boeing 737 MAX (interne sikkerhedsrapporter underkendt/begravet)
- Theranos (bekymringer om labtests undertrykt i årevis)
- FDA-inspektørrapporter redigeret efter indlevering
- Frances Haugen / Facebook (et forseglet manifest ville have bevist,
  at dokumenterne var autentiske og eksisterede på det hævdede tidspunkt)

Hvad dette kit forsvarer imod (i protokoltermer):

- T1–T3 i [FACT 05](facts/05_threat_model.txt): offentlig bestridelse
  af dokumentindhold, påstande om at dokumenter ikke var forseglet
  på det hævdede tidspunkt, påstande om tilbagevirkende fabrikation.
- T9: tredjeparter, der overdrager ændrede kopier til journalister.

Hvad dette kit **ikke** forsvarer imod:

- Personlig gengældelse mod varsleren (T7).
- Pres på varsleren om at trække tilbage (T4, delvist afhjulpet ved
  at FACT 07 gør stille tilbagetrækning offentligt opdagelig).
- Retslige skridt mod varsleren for selve afsløringen (T5).
- Miskreditering af varslerens karakter (T8).
- Mellemled, der stille lader historien falde (T10).

Hvis du er en varsler, der overvejer at bruge dette kit, **læs hele
denne README først**. Protokollen er et værktøj. Protokollen er ingen
erstatning for juridisk rådgivning, en journalist, en tilsynsmyndighed
eller omhyggelig operationel sikkerhed.

## Hvad dette kit producerer

Et kryptografisk forseglet *manifest* over beviser (ikke beviserne
selv), der beviser:

1. De specifikke bytes i hver bevisfil eksisterede i forseglingsøjeblikket.
2. Forseglingen skete på eller før et specifikt tidspunkt (via Bitcoin
   OTS-attestation).
3. Oprindelse, anklage, trusselsmodel, modtagerprotokol og
   ikke-stille-tilbagetrækning-forpligtelsen blev alle erklæret samlet.

De underliggende dokumenter forbliver i din besiddelse, indtil du
sender dem til en modtager. Modtagere verificerer, at de modtog de
samme bytes, som du forseglede.

## Hvornår dette kit skal bruges

Du bør overveje at forsegle et manifest **inden** du overfører beviser
til en journalist, tilsynsmyndighed eller advokat, hvis alt det
følgende er sandt:

- Du har beviser i digital form (PDF'er, e-mails, billeder osv.), som
  du vil bevare som byte-for-byte autentiske.
- Du forventer, at mellemled kan ændre, bestride eller begrave
  beviserne.
- Du kan beholde de underliggende dokumenter i din besiddelse indtil
  overførslen.
- Du kan publicere manifestet offentligt **uden** at afsløre
  indholdet i dokumenterne (kun hasherne er offentlige).
- Du har afvejet risikoen ved at blive offentligt identificerbar som
  varsler (signing-principal-feltet). Hvis anonym, brug et pseudonym
  konsekvent på tværs af alle relaterede publikationer.
- Du har konsulteret en advokat om varslerbeskyttelseslovgivning i
  din jurisdiktion.

## Hvornår dette kit IKKE skal bruges

Brug IKKE dette kit hvis:

- Dokumenterne selv indeholder personoplysninger om tredjeparter
  (patienter, kunder, ansatte), der ikke bør gøres offentligt-hashbare.
  Hash en redigeret version, ikke originalen.
- Selve publiceringen af manifestet ville identificere varsleren på
  en måde, vedkommende ikke har samtykket til.
- Du endnu ikke har konsulteret en advokat. Protokollen er et værktøj;
  varslerbeskyttelseslovgivning er jurisdiktionsspecifik og lever
  uden for protokollen.
- Du måske vil trække en enkelt anklage tilbage senere. Forseglingen
  er permanent; nye forseglede rettelser er den eneste ærlige måde
  at revidere på.
- Du gør dette under tvang eller tidspres. Protokollen forstærker
  tvang; afslagsporten (myriam-kit `SPEC §8`) gælder for varslere
  såvel som for udgivere.

## Hvordan du forker dette kit til en reel afsløring

```bash
# 1. Kopier dette eksempel til en ny mappe
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Fjern det fiktive indhold; erstat med dine reelle fakta.
# Hver fil under facts/ er ét faktum. Læs hver og erstat.
$EDITOR facts/01_example_notice.txt   # ændr til en reel følgeskrivelse
$EDITOR facts/02_provenance.txt       # reel oprindelse af dit bevis
$EDITOR facts/03_evidence_manifest.txt # hash dine reelle dokumenter og opfør dem
$EDITOR facts/04_allegation_summary.txt # din reelle anklage
$EDITOR facts/05_threat_model.txt     # dine reelle forventede reaktioner
$EDITOR facts/06_recipient_protocol.txt # juster for din modtager
$EDITOR facts/07_no_retraction_commitment.txt # din ikke-tilbagetrækning-erklæring
$EDITOR facts/08_signing_principal.txt # din reelle signeringsidentitet (eller pseudonym)

# 3. Opdater site/index.html for at afspejle de reelle fakta.
# seal.sh-scriptet udfylder IKKE HTML'en automatisk; den manuelle
# redigering er trinnet til menneskelig gennemgang.
$EDITOR site/index.html

# 4. Forsegl.
bash build/seal.sh
# Output: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Verificer lokalt.
python3 build/verify.py

# 6. Publicer manifestet (IKKE dokumenterne) til en af følgende:
#    - En statisk vært, du kontrollerer (Cloudflare Pages, GitHub Pages osv.)
#    - IPFS-netværket på den udskrevne CID
#    - Begge (anbefalet)

# 7. Overfør separat de underliggende dokumenter til modtageren
#    via en sikker kanal efter eget valg (Signal, SecureDrop osv.).
#    Modtageren verificerer filhasher mod dit manifest.
```

## Beregning af hasher for de reelle bevisfiler

For at hashe en dokumentfil med SHA-256:

```bash
shasum -a 256 my_document.pdf
```

De første 64 hex-tegn er SHA-256. Sæt det i manifestet.

Du kan hashe mange filer på én gang:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Det giver dig dataene til `facts/03_evidence_manifest.txt`.

## Bemærkninger om operationel sikkerhed

MYRIAM-protokollen tilbyder IKKE operationel sikkerhed. Den tilbyder
*bevismæssig holdbarhed*. Du har stadig brug for:

- En sikker kommunikationskanal til din advokat
  ([Signal](https://signal.org/), personligt, eller din advokats
  etablerede sikre kanal)
- En sikker opbevaringsplacering for de underliggende dokumenter
  (krypteret i hvile, ikke på skytjenester, som din arbejdsgiver kan
  få adgang til)
- En ren enhed til forseglingen (en personlig bærbar pc, der ikke er
  forbundet med arbejdsgiverkonti; helst en, der kun bruges til
  dette formål)
- Et rent netværk til publicering (ikke din arbejdsgivers netværk,
  ikke din hjemme-IP hvis din arbejdsgiver kan stævne din ISP)

Anbefalet læsning om operationel sikkerhed for varslere:

- [The Intercept's SecureDrop-dokumentation](https://securedrop.org/)
- [Freedom of the Press Foundations ressourcer](https://freedom.press/)
- [EFF's guide til selvforsvar mod overvågning](https://ssd.eff.org/)

Konsulter dem FØR du starter forseglingsprocessen. Protokollen
beskytter ikke mod dårlige opsec-valg foretaget før protokollen
påkaldes.

## Hvad modtagere bør vide

Send modtagere denne README sammen med det forseglede manifest.
Manifestet selv indeholder modtagerprotokollen (FACT 06), men README'en
udvider modtagerrollen:

- **Journalister**: verificer først manifestets egen integritet. Bed
  derefter om dokumenterne gennem en separat sikker kanal. Verificer,
  at hvert dokuments SHA-256 stemmer med manifestet før publicering.
  Publicer IKKE dokumenterne uden varslerens samtykke; publicer dog
  eksistensen af det forseglede manifest og din verifikationskonklusion.
- **Tilsynsmyndigheder**: samme verifikationsproces. Det forseglede
  manifest plus matchende dokumenter er den stærkeste bevisform, der
  er tilgængelig uden for formel chain-of-custody-indsamling.
- **Advokater**: det forseglede manifest giver forensisk forankring
  for dokumenternes eksistens på det hævdede tidspunkt. Hvorvidt det
  opfylder en bestemt jurisdiktions bevisregler, er op til dig at
  afgøre.

## Hvad dette kit IKKE er

- Ingen erstatning for juridisk rådgivning.
- Ingen garanti for, at nogen vil handle på din afsløring.
- Ingen beskyttelse mod gengældelse.
- Ingen autentificering af dokumenternes indhold (kun af bytes
  på forseglingstidspunktet).
- Ingen måde at kommunikere anonymt med nogen på — forseglingen er
  offentlig; hvis dit signing-principal-navn er reelt, er du
  identificeret.

## Afslutning

Et forseglet manifest er en lille ting. Det er én bytestrøm, der
beviser, at et større sæt af bytestrømme eksisterede i en bestemt
form på et bestemt tidspunkt. Den lidenhed er dets styrke: det gør
kun én ting, og det gør den ene ting i hele Bitcoin-blockchainens
levetid.

Hvis du læser dette, fordi du overvejer at blive varsler, så venligst:
tal med en advokat først. Brug de operationelle sikkerhedsguider
ovenfor. Derefter, hvis og kun hvis alle disse opstrøms overvejelser
er på plads, overvej dette kit som den kryptografiske rygrad i din
afsløring. Kryptografien er den nemme del. Alt opstrøms for
kryptografien er der, hvor den reelle risiko lever.

## Licens

Almen ejendom (CC0). Fork det. Forbedr det. Brug det uden at bede
om tilladelse.
