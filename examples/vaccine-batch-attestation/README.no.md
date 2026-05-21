*Norsk oversettelse — for original engelsk versjon, se [README.md](README.md)*

# Vaccine Batch Attestation Kit

Et nøkkelferdig myriam-kit-eksempel for vaksineprodusenter,
kvalitetssikringsmyndigheter og folkehelseetater som ønsker å publisere
en Bitcoin-forankret, tukling-tydelig forsegling av en partiutgivelse.

## Hva dette settet forsvarer mot

**Feilmoduser som forseglingen fanger opp:**

- **Stille tilbakevirkende endring av testresultater for utgivelse.** Alle 8
  PDF-er med utgivelsestesting i eksempelet er hashet. Re-hashing etter utgivelse
  avslører enhver endring.
- **Tvister om hvilke spesifikasjoner som gjaldt ved utgivelse.** Den
  forseglede FACT 02 inneholder den kanoniske partiidentifikasjonen og
  hashen av produksjonsjournalen. Fremtidige "spesifikasjonen var alltid X"-tvister
  har et offentlig anker.
- **Stille minimering av tilbakekallingsomfang.** Forpliktelser om
  legemiddelovervåkning i FACT 05 er forseglet; unnlatelse av å innfri dem er
  offentlig observerbar.
- **Tilbakevirkende re-spesifisering av et parti utenfor spesifikasjon.** Hvis et
  utgivelsestestresultat egentlig var en grenseverdi-BESTÅTT som blir
  omklassifisert til IKKE BESTÅTT etter utgivelse, beviser hashene av den
  forseglede rapporten hva den opprinnelige resultat-PDF-en sa.

**Feilmoduser som IKKE er dekket:**

- Svindel i selve produksjonsprosessen (forseglingen forankrer
  testresultater, ikke produksjonsintegritet).
- Bivirkninger som er biologiske konsekvenser av et ellers godkjent
  parti (forseglingen sertifiserer ikke klinisk sikkerhet, kun
  dokumentasjonsintegritet).
- Tvister om hvilken versjon av en regulatorisk spesifikasjon som
  er autoritativ.

## Når man bør bruke dette settet

Vurder å forsegle en partiutgivelse hvis:

- Du er en vaksineprodusent som ønsker å demonstrere rettsmedisinsk
  integritet av utgivelsesjournaler utover det regulatorer krever
- Du er et QA-team som adopterer en "publiser det vi attesterer"-praksis
- Du er en liten/nasjonal-skala produsent i en jurisdiksjon med
  svakere regulatorisk infrastruktur, og ønsker å forankre partijournaler
  mot en global verifikator
- Du er en folkehelseetat eller NGO som driver et ikke-kommersielt
  vaksineproduksjonsprogram (f.eks. for forsømte sykdommer)

## Historisk dødelighetsprøvedom

- **Heparin-forurensning (2008, Kina):** forfalsket oversulfatert
  kondroitinsulfat i heparin-partier. Et forseglet manifest av
  utgivelsestester ville ha gjort stille endring av testjournalen etter
  utgivelse kryptografisk oppdagbar.
- **Tylenol-cyanid (1982):** tilbakevirkende tvister om opprinnelsespunkt
  for tukling. En forseglet hash av produksjonsjournalen forankrer
  tilstanden før distribusjon.
- **Diverse tilbakekallinger av vaksinepartier** der spørsmålet "ble dette
  partiet noen gang ordentlig testet" blir omstridt år senere.

Settet er IKKE en løsning på NOEN av disse i streng forstand — men i hvert
tilfelle ville forseglede partiattestasjoner ha gitt en renere
rettsmedisinsk tidslinje.

## Hvordan forke dette settet for et reelt parti

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # replace fictional content with real batch
bash build/seal.sh        # SEAL BEFORE distribution begins
python3 build/verify.py   # confirm
```

**KRITISK TIDSPUNKT**: forsegle ved QA-utgivelsesøyeblikket, FØR partiet
distribueres. En forsegling etter distribusjon er rettsmedisinsk svakere.

## Integrasjon med eksisterende farmasøytisk infrastruktur

- **eCTD-innleveringer (FDA / EMA):** den forseglede publiserings-URL-en eller
  IPFS-CID-en kan refereres i Modul 3 (kvalitet)-seksjonen
- **WHO-prekvalifisering:** det forseglede manifestet demonstrerer
  testkjeden før utgivelse til ikke-FDA/EMA-jurisdiksjoner
- **Tilbakemeldinger fra legemiddelovervåkning:** FACT 05 forplikter produsenten
  til forseglet rapportering av aggregerte tellinger av bivirkninger ved 6 og 12 måneder
- **Tilbakekallingssystemer (RxConnect, MedWatch):** hvis en tilbakekalling er nødvendig,
  blir selve tilbakekallingsomfanget forseglet under MYRIAM, noe som gir offentlig
  verifikasjon av at alle distribuerte partier blir tatt hånd om

## Hva dette settet IKKE erstatter

- Regulatoriske innleveringer til FDA / EMA / WHO
- GMP-revisjonsspor (forseglingen forankrer RESULTATER, ikke rå prosessjournaler)
- Databaser for legemiddelovervåkning (VAERS / EudraVigilance)
- Koordineringssystemer for tilbakekalling

## Lisens

Allment tilgjengelig (CC0). Fork det. Ingen attribusjon kreves.
