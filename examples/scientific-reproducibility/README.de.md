*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Kit für wissenschaftliche Reproduzierbarkeit

Ein schlüsselfertiges myriam-kit-Beispiel für Forschungsgruppen,
Fachzeitschriften und reproduzierbarkeitsorientierte Einrichtungen, die
ein Bitcoin-verankertes, manipulationssicheres Reproduzierbarkeits-
Manifest neben einer Publikation oder einem Preprint veröffentlichen
möchten.

## Was dieses Kit erzeugt

Eine versiegelte Veröffentlichung, die für eine Studie Folgendes
enthält:

1. Studienidentifikation (Titel der Publikation, Autoren, Institution,
   Geldgeber, Interessenkonflikte)
2. **SHA-256 des Rohdatenarchivs** — der kanonische Datensatz
3. **Hash der Analyse-Pipeline** — Skript + Digest des Docker-Image +
   fixierte Abhängigkeiten
4. **Hash des erwarteten Ausgabe-Bundles** — was ein getreuer
   Reproduzent erzeugen sollte
5. Reproduktionsprotokoll + Veröffentlichungsverpflichtungen nach
   Vorliegen der Ergebnisse
6. Unterzeichnende Verantwortliche

Die Versiegelung ist für die **Voranalyse-Phase** gedacht: Daten
eingefroren, Pipeline finalisiert, erwartete Ausgabe berechnet, ALLES
bevor irgendein Ergebnis zum Zweck des Verfassens der Publikation
gesichtet wird.

## Wogegen dieses Kit absichert

**Versagensmodi, die die Versiegelung abfängt:**

- **p-Hacking**: nachträgliche Änderungen an der Analyse nach Sichtung
  der Ergebnisse werden über den Diff zwischen versiegeltem FACT 04 und
  veröffentlichter Pipeline erkennbar.
- **HARKing** (Hypothesizing After Results are Known, Hypothesenbildung
  nach Kenntnis der Ergebnisse): die in FACT 02 präregistrierte
  Hypothese ist byte-stabil.
- **Datenmanipulation nach Publikation**: das erneute Hashen des
  Datenarchivs gegen FACT 03 deckt jede Modifikation auf.
- **Pipeline-Drift**: das erneute Hashen der Analyse-Pipeline gegen
  FACT 04 erfasst stille Änderungen.
- **Manipulation der Autorenschaft**: das stillschweigende Hinzufügen
  oder Entfernen von Autoren nach der Publikation wird gegenüber dem
  versiegelten FACT 02 erkennbar.

**Versagensmodi, die NICHT abgedeckt sind:**

- Betrug bei der Rohdatenerhebung (die Versiegelung verankert die Daten
  zum Zeitpunkt der Versiegelung, nicht der Erhebung)
- Biologische / empirische Nicht-Reproduzierbarkeit (die Versiegelung
  verankert ausschließlich rechnerische Reproduzierbarkeit)
- Fragen der Stichprobengröße oder Populationsvalidität (das sind
  Fragen des Studiendesigns)
- Die Wahrheit der zugrunde liegenden Behauptung (die Versiegelung
  verankert, was behauptet wurde, nicht ob die Welt mit der Behauptung
  übereinstimmt)

## Wann dieses Kit zu verwenden ist

Eine Versiegelung sollte in Betracht gezogen werden, wenn:

- Sie eine Forschungsgruppe sind, die eine folgenreiche Analyse
  durchführt (klinische Studie, Evaluation eines KI-Systems,
  Replikationsstudie) und forensische Integrität jenseits von OSF- /
  GitHub-Zeitstempeln wünscht
- Sie eine Nachwuchsforscherin oder ein Nachwuchsforscher sind und
  asymmetrischen Reputationsschutz wünschen: eine versiegelte
  Voranalyse bedeutet, dass künftige „die haben p-Hacking betrieben"-
  Kritik einen öffentlichen Falsifizierer hat
- Sie Zeitschriftenredakteur oder Leitung eines Replikationsprojekts
  sind und für eine Teilmenge von Publikationen kryptografisch
  abgesicherte Präregistrierung fördern möchten
- Sie an einer Analyse arbeiten, bei der nachträgliche Anpassungen
  bedeutsame disziplinäre Folgen haben (Psychologie,
  Verhaltensökonomie, medizinische Forschung)

## Historischer Präzedenzfall für Mortalität / Schaden

Die Mortalitätsrelevanz dieses Kits ist mittelbar:

- **Nicht-Reproduzierbarkeit in der Stammzell- / Krebsforschung:**
  mehrere Publikationen haben über fehlgeleitete klinische Studien zu
  Patientenschäden geführt. Eine versiegelte Präregistrierung der
  ursprünglichen Pipeline hätte den Vergleichsmaßstab verankert.
- **Kontroverse um die Wirksamkeit von Tamiflu:** die Cochrane-Review
  dauerte unter anderem deshalb Jahre, weil der Zugang zu den
  Rohdaten umstritten war. Versiegelte Datenhashes zum
  Publikationszeitpunkt hätten Streitigkeiten über den Datenzugang
  unmittelbar entscheidbar gemacht.
- **Allgemeine Reproduzierbarkeitskrise:** die feldweiten
  Mortalitätskosten nicht reproduzierbarer biomedizinischer Forschung
  sind erheblich (Begley & Ellis 2012 schätzten, dass >50 % der
  präklinischen Befunde nicht reproduzierbar sind). Kryptografische
  Verankerung ist einer der strukturellen Hebel.

## Wie man dieses Kit forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# KRITISCH: dies muss erfolgen, BEVOR irgendwelche Ergebnisse gesehen werden
shasum -a 256 raw_data_v0.tar.gz       # berechnet den kanonischen Daten-Hash
shasum -a 256 analysis.py              # hasht Ihre Pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # mit echten Werten füllen
bash build/seal.sh                     # versiegeln VOR Ausführung der Analyse
python3 build/verify.py                # bestätigen

# Nun die Analyse ausführen. Die Ausgabe hashen und Übereinstimmung mit FACT 05 bestätigen.
# Bei Abweichung ist die Pipeline nicht deterministisch; beheben und erneut versiegeln.
```

## Integration mit bestehender wissenschaftlicher Infrastruktur

- **arXiv / bioRxiv / medRxiv**: die MYRIAM-Versiegelungs-URL oder den
  IPFS-CID in den Abstract oder das Zusatzmaterial aufnehmen
- **OSF**: das Versiegelungsartefakt zusätzlich zum konventionellen
  Präregistrierungsformular dem OSF-Projekt beifügen
- **AsPredicted**: die MYRIAM-Versiegelungs-URL in das
  Präregistrierungsdokument aufnehmen
- **GitHub**: der Commit-Hash der Analyse-Pipeline ist das, was FACT 04
  verankert; GitHub liefert den Quelltext, MYRIAM verankert die Bytes
- **Zenodo / Figshare / OpenAIRE**: die Rohdaten hinterlegen und dann
  den Hash der Einreichung versiegeln; die Versiegelung ist forensisch
  schwieriger stillschweigend zu ersetzen als die Metadaten der
  Einreichung
- **Zusatzmaterialien von Fachzeitschriften**: das MYRIAM-
  Versiegelungsartefakt bei der Einreichung als Zusatzdatei beilegen

## Was dieses Kit NICHT ersetzt

- IRB- / Ethikkommissionsgenehmigung
- Peer-Review
- Replikationsstudien (rechnerische Reproduzierbarkeit ≠ empirische
  Reproduzierbarkeit)
- Datenzugriffsvereinbarungen für sensible Daten

## Eine Anmerkung zur Autorenreihenfolge und zur Zuschreibung

Die Versiegelung verankert die AUTORENLISTE zum Versiegelungszeitpunkt.
Streitigkeiten über die Autorenschaft, die nach der Publikation
entstehen, lassen sich gegen die versiegelte Liste beurteilen. Dies ist
ein kleiner Hebel für Rechenschaftspflicht — besonders wichtig für
Nachwuchsforschende, die stillschweigend hinzugefügt oder entfernt
werden.

## Anmerkung zu den Grenzen der Versiegelung

Seien Sie sich selbst und Ihren Leserinnen und Lesern gegenüber klar:
das Versiegeln des Voranalyse-Protokolls macht p-Hacking **öffentlich
erkennbar**, aber die Versiegelung **kann eine unethische Analyse nicht
verhindern und das Problem menschlicher Motivation nicht beheben**.
Eine Forscherin, die ihr versiegeltes Protokoll bewusst verletzt, kann
das weiterhin tun; die Versiegelung garantiert nur, dass der Verstoß
aktenkundig wird. Die Wissenschaftssoziologie — Karriereanreize,
Publikationsverzerrung, Drittmitteldruck — liegt oberhalb jeder
kryptografischen Schicht. Dieses Kit liefert einen Falsifizierer, keine
Tugend.

## Lizenz

Public Domain (CC0). Verwenden, modifizieren, ignorieren, forken.
