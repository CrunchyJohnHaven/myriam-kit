*Deutsche Übersetzung — für die englische Originalfassung siehe [README.md](README.md)*

# Kit für wissenschaftliche Reproduzierbarkeit

Ein schlüsselfertiges myriam-kit-Beispiel für Forschungsgruppen, Fachzeitschriften und reproduzierbarkeitsorientierte Einrichtungen, die ein Bitcoin-verankertes, manipulationssicheres Reproduzierbarkeits-Manifest neben einer Publikation oder einem Preprint veröffentlichen möchten.

## Was dieses Kit erzeugt

Eine versiegelte Veröffentlichung, die für eine Studie Folgendes enthält:

1. Identifikation der Studie (Titel der Publikation, Autoren, Institution, Geldgeber, Interessenkonflikte)
2. **SHA-256-Hash des Rohdaten-Archivs** — der kanonische Datensatz
3. **Hash der Analyse-Pipeline** — Skript + Docker-Image-Digest + festgesetzte Abhängigkeiten
4. **Hash des Bündels der erwarteten Ausgabe** — was ein treuer Reproduzent erzeugen sollte
5. Reproduktionsprotokoll + Veröffentlichungsverpflichtungen nach Vorliegen der Ergebnisse
6. Signierende(r) Prinzipal(e)

Die Versiegelung ist für die **Pre-Analyse-Phase** gedacht: Daten eingefroren, Pipeline finalisiert, erwartete Ausgabe berechnet — ALLES bevor irgendwelche Ergebnisse zum Zweck des Verfassens der Publikation eingesehen werden.

## Wogegen dieses Kit schützt

**Versagensmodi, die die Versiegelung aufdeckt:**

- **p-Hacking**: nachträgliche Änderungen an der Analyse, nachdem Ergebnisse gesehen wurden, sind über einen Diff zwischen versiegeltem FAKT 04 und veröffentlichter Pipeline erkennbar.
- **HARKing** (Hypothesizing After Results are Known — Hypothesenbildung nach Kenntnis der Ergebnisse): die vorab registrierte Hypothese in FAKT 02 ist byte-stabil.
- **Datenmanipulation nach Erscheinen der Publikation**: erneutes Hashen des Datenarchivs gegen FAKT 03 deckt jede Modifikation auf.
- **Pipeline-Drift**: erneutes Hashen der Analyse-Pipeline gegen FAKT 04 fängt stille Änderungen ab.
- **Autorschafts-Tricksereien**: stilles Hinzufügen oder Entfernen von Autoren nach der Veröffentlichung wird gegen versiegelten FAKT 02 erkennbar.

**Nicht abgedeckte Versagensmodi:**

- Betrug bei der Rohdatenerhebung (die Versiegelung verankert Daten zum Zeitpunkt des Versiegelns, nicht der Erhebung)
- Biologische / empirische Nicht-Reproduzierbarkeit (die Versiegelung verankert ausschließlich rechnerische Reproduzierbarkeit)
- Probleme mit Stichprobengröße oder Populationsvalidität (dies sind Fragen des Studiendesigns)
- Die Wahrheit des zugrundeliegenden Anspruchs (die Versiegelung verankert, was behauptet wurde, nicht ob die Welt der Behauptung entspricht)

## Wann dieses Kit eingesetzt werden sollte

Erwägen Sie eine Versiegelung, wenn:

- Sie eine Forschungsgruppe sind, die eine folgenreiche Analyse durchführt (klinische Studie, Evaluierung eines KI-Systems, Replikationsstudie) und forensische Integrität jenseits von OSF- / GitHub-Zeitstempeln wünschen
- Sie ein/e Nachwuchswissenschaftler/in sind, der/die asymmetrischen Reputationsschutz möchte: eine versiegelte Pre-Analyse bedeutet, dass künftige Vorwürfe "die haben p-gehackt" einen öffentlichen Falsifikator haben
- Sie Herausgeber/in einer Fachzeitschrift oder Leiter/in eines Replikationsprojekts sind und für einen Teilbereich von Publikationen eine Vorregistrierung in kryptografischer Qualität fördern möchten
- Sie an einer Analyse arbeiten, bei der nachträgliche Anpassungen relevante Konsequenzen im Fachgebiet haben (Psychologie, Verhaltensökonomie, medizinische Forschung)

## Historischer Präzedenzfall zu Mortalität / Schaden

Die Mortalitätsrelevanz dieses Kits ist mittelbar:

- **Nicht-Reproduzierbarkeit in der Stammzell- / Krebsforschung:** mehrere Publikationen haben über fehlgeleitete klinische Studien zu Patientenschäden geführt. Eine versiegelte Vorregistrierung der ursprünglichen Pipeline hätte den Vergleichsmaßstab verankert.
- **Kontroverse um die Wirksamkeit von Tamiflu:** die Cochrane-Übersichtsarbeit zog sich teils deshalb über Jahre hin, weil der Zugang zu den Rohdaten umstritten war. Versiegelte Daten-Hashes zum Zeitpunkt der Veröffentlichung hätten Streitigkeiten über den Datenzugang unmittelbar entscheidbar gemacht.
- **Allgemeine Reproduzierbarkeitskrise:** die fachgebietsweite Mortalitätskosten nicht reproduzierbarer biomedizinischer Forschung sind erheblich (Begley & Ellis 2012 schätzten >50% der präklinischen Befunde als nicht reproduzierbar ein). Kryptografische Verankerung ist ein struktureller Hebel.

## Wie man dieses Kit forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# KRITISCH: dies VOR Einsicht in jegliche Ergebnisse durchführen
shasum -a 256 raw_data_v0.tar.gz       # kanonischen Daten-Hash berechnen
shasum -a 256 analysis.py              # Pipeline hashen
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # mit realen Werten befüllen
bash build/seal.sh                     # versiegeln VOR Ausführung der Analyse
python3 build/verify.py                # bestätigen

# Jetzt die Analyse ausführen. Ausgabe hashen und mit FAKT 05 abgleichen.
# Bei Abweichung ist die Pipeline nicht deterministisch; korrigieren und neu versiegeln.
```

## Integration mit bestehender Wissenschaftsinfrastruktur

- **arXiv / bioRxiv / medRxiv**: die MYRIAM-Versiegelungs-URL oder den IPFS-CID in das Abstract oder die Zusatzmaterialien aufnehmen
- **OSF**: das Versiegelungs-Artefakt dem OSF-Projekt neben dem konventionellen Pre-Registration-Formular beifügen
- **AsPredicted**: die MYRIAM-Versiegelungs-URL in das Pre-Registration-Dokument aufnehmen
- **GitHub**: der Commit-Hash der Analyse-Pipeline ist das, was FAKT 04 verankert; GitHub liefert den Quellcode, MYRIAM verankert die Bytes
- **Zenodo / Figshare / OpenAIRE**: Rohdaten ablegen, anschließend den Hash der Ablage versiegeln; das Versiegeln ist forensisch schwerer still zu ersetzen als die Ablage-Metadaten
- **Zusatzmaterialien einer Fachzeitschrift**: das MYRIAM-Versiegelungs-Artefakt bei Einreichung als Zusatzdatei beifügen

## Was dieses Kit NICHT ersetzt

- Genehmigung durch Ethikkommission / Institutional Review Board (IRB)
- Peer-Review
- Replikationsstudien (rechnerische Reproduzierbarkeit ≠ empirische Reproduzierbarkeit)
- Datenzugangsvereinbarungen für sensible Daten

## Eine Anmerkung zu Autorenreihenfolge und Anerkennung

Die Versiegelung verankert die AUTORENLISTE zum Zeitpunkt der Versiegelung. Nach der Veröffentlichung auftauchende Autorschaftsstreitigkeiten lassen sich gegen die versiegelte Liste prüfen. Dies ist ein kleiner Rechenschaftshebel — wichtig für Nachwuchswissenschaftler/innen, die still hinzugefügt oder entfernt werden.

## Lizenz

Public Domain (CC0). Benutzen, modifizieren, ignorieren, forken.
