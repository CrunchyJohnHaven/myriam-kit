# Kit zur Impfstoffchargen-Attestierung

*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

Ein schlüsselfertiges myriam-kit-Beispiel für Impfstoffhersteller,
Qualitätssicherungsbehörden und Gesundheitsbehörden, die ein
Bitcoin-verankertes, manipulationssicheres Siegel einer Chargenfreigabe
veröffentlichen wollen.

## Wogegen dieses Kit schützt

**Versagensmodi, die das Siegel erfasst:**

- **Stille rückwirkende Änderung der Freigabeprüfungs-Ergebnisse.** Alle
  8 Freigabeprüfungs-PDFs im Beispiel sind gehasht. Erneutes Hashen nach
  der Freigabe deckt jede Änderung auf.
- **Streitigkeiten darüber, welche Spezifikationen bei der Freigabe
  galten.** Der versiegelte FACT 02 enthält die maßgebliche
  Chargenkennung und den Hash der Herstellungsaufzeichnung. Spätere
  Streitigkeiten nach dem Muster „die Spezifikation war schon immer X"
  erhalten einen öffentlichen Anker.
- **Stille Einengung des Rückrufumfangs.** Die in FACT 05 hinterlegten
  Pharmakovigilanz-Verpflichtungen sind versiegelt; deren Nichteinhaltung
  ist öffentlich beobachtbar.
- **Rückwirkende Umdeklarierung der Spezifikation für eine
  außerhalb-der-Spezifikation-Charge.** Falls ein
  Freigabeprüfungsergebnis tatsächlich ein grenzwertiges PASS war und
  nach der Freigabe in ein FAIL umklassifiziert wird, belegen die
  versiegelten Berichts-Hashes, was im ursprünglichen Ergebnis-PDF
  tatsächlich stand.

**Versagensmodi, die NICHT abgedeckt sind:**

- Betrug im Herstellungsprozess selbst (das Siegel verankert
  Prüfergebnisse, nicht die Integrität der Herstellung).
- Unerwünschte Ereignisse, die biologische Folgen einer ansonsten
  bestandenen Charge sind (das Siegel zertifiziert keine klinische
  Sicherheit, sondern lediglich die Integrität der Dokumentation).
- Streitigkeiten darüber, welche Fassung einer regulatorischen
  Spezifikation maßgeblich ist.

## Wann dieses Kit zum Einsatz kommen sollte

Die Versiegelung einer Chargenfreigabe ist erwägenswert, wenn:

- Sie ein Impfstoffhersteller sind und die forensische Integrität der
  Freigabeunterlagen über das hinaus belegen wollen, was die
  Aufsichtsbehörden verlangen
- Sie ein QA-Team sind, das die Praxis „wir veröffentlichen, was wir
  attestieren" einführt
- Sie ein kleiner oder national tätiger Hersteller in einer
  Rechtsordnung mit schwächerer regulatorischer Infrastruktur sind und
  Chargenaufzeichnungen gegenüber einem globalen Verifizierer verankern
  wollen
- Sie eine Gesundheitsbehörde oder eine NGO sind, die ein nicht
  kommerzielles Impfstoff-Produktionsprogramm (etwa für vernachlässigte
  Krankheiten) betreibt

## Historische Mortalitäts-Präzedenzfälle

- **Heparin-Kontamination (Heparin 2008, China):** gefälschtes
  übersulfatiertes Chondroitinsulfat in Heparin-Chargen. Ein
  versiegeltes Manifest der Freigabeprüfungen hätte eine stille,
  freigabe-nachträgliche Manipulation der Prüfaufzeichnungen
  kryptographisch detektierbar gemacht.
- **Tylenol-Zyanid (Tylenol 1982):** rückwirkende Streitigkeiten über
  den Ursprungspunkt der Manipulation. Ein versiegelter Hash der
  Herstellungsaufzeichnungen verankert den Zustand vor der Verteilung.
- **Diverse Rückrufe von Impfstoffchargen**, bei denen die Frage „wurde
  diese Charge je ordnungsgemäß geprüft" Jahre später streitig wurde.

Das Kit ist im strengen Sinne KEINE Lösung für irgendeines dieser
Probleme — in jedem dieser Fälle hätten versiegelte
Chargen-Attestierungen jedoch eine sauberere forensische Zeitlinie
geliefert.

## Wie man dieses Kit für eine reale Charge forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # replace fictional content with real batch
bash build/seal.sh        # SEAL BEFORE distribution begins
python3 build/verify.py   # confirm
```

**KRITISCHES TIMING**: Im Moment der QA-Freigabe versiegeln, **bevor**
die Verteilung der Charge beginnt. Eine Versiegelung nach der Verteilung
ist forensisch schwächer.

## Integration in bestehende pharmazeutische Infrastruktur

- **eCTD-Einreichungen (FDA / EMA):** Die versiegelte
  Veröffentlichungs-URL bzw. der IPFS-CID kann im Abschnitt Module 3
  (Qualität) referenziert werden
- **WHO Prequalification:** Das versiegelte Manifest weist die
  Prüfkette vor der Freigabe gegenüber Rechtsordnungen außerhalb von
  FDA/EMA nach
- **Pharmakovigilanz-Rückmeldung:** FACT 05 verpflichtet den Hersteller
  zur versiegelten Berichterstattung über aggregierte AE-Zählungen nach
  6 und 12 Monaten
- **Rückrufsysteme (RxConnect, MedWatch):** Wird ein Rückruf
  erforderlich, so wird der Rückrufumfang selbst unter MYRIAM
  versiegelt und liefert eine öffentliche Verifizierbarkeit, dass alle
  ausgelieferten Chargen erfasst werden

## Was dieses Kit NICHT ersetzt

- Regulatorische Einreichungen bei FDA / EMA / WHO
- GMP-Audit-Trails (das Siegel verankert **Ergebnisse**, nicht die
  rohen Prozessaufzeichnungen)
- Pharmakovigilanz-Datenbanken (VAERS / EudraVigilance)
- Rückruf-Koordinationssysteme

## License

Public domain (CC0). Fork it. No attribution required.
