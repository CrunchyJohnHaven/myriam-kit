*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Kit zur Vorregistrierung klinischer Arzneimittelstudien

Ein schlüsselfertiges myriam-kit-Beispiel für Sponsoren klinischer Studien und akademische Prüfer, die eine Studie auf manipulationssichere, Bitcoin-verankerte Weise **zusätzlich zur** Registrierung bei ClinicalTrials.gov, im EU CTR oder in anderen jurisdiktionellen Registern vorregistrieren möchten.

## Warum *zusätzlich* unter MYRIAM vorregistrieren?

Bestehende Studienregister (ClinicalTrials.gov, EU CTR, ISRCTN) weisen dokumentierte Integritätsschwächen auf:

- ClinicalTrials.gov erlaubt es Sponsoren, Endpunkte, Fallzahlberechnungen und Analysepläne **nach** der ursprünglichen Registrierung zu aktualisieren, wobei die Änderungsdaten im Register sichtbar sind, die *inhaltlichen* Änderungen jedoch nicht immer kryptografisch verankert werden.
- Mehrere große Studien (Goldacre et al., 2019; Mathieu et al., 2009) haben systematisches nachträgliches Endpunkt-Vertauschen über das gesamte Fachgebiet hinweg dokumentiert.
- Die redaktionelle Durchsetzung durch Fachzeitschriften (CONSORT, ICMJE) erfasst einige Fälle; viele entgehen ihr.

Eine MYRIAM-Versiegelung schließt diese Lücke. Die Merkle-Wurzel + die Bitcoin-OTS-Quittung machen jede nachträgliche Änderung am *vorregistrierten* primären Endpunkt, am statistischen Analyseplan oder an der Subgruppenliste kryptografisch nachweisbar. Die Versiegelung ist forensisch schwerer im Nachhinein zu fälschen als das Register selbst.

Dieses Kit ist eine **Ergänzung zu**, kein Ersatz für jurisdiktionelle Register. Eine reale Studie sollte im zuständigen Register UND unter MYRIAM versiegelt registriert werden.

## Wogegen dieses Kit schützt

Historische Mortalitätsfälle, bei denen es geholfen hätte:

- **Vioxx (Merck, 2004)**: Kardiovaskuläre Ereignisse waren ein vorregistrierter Endpunkt in der APPROVe-Studie, doch die veröffentlichte Analyse verwendete einen Stichtag, der den scheinbaren Schaden minimierte. Eine Versiegelung des vorregistrierten Stichtags hätte die nachträgliche Stichtagsänderung vor der Publikation öffentlich nachweisbar gemacht.
- **Paxil/Studie 329 (GSK/SmithKline, 2001)**: Negative Studiendaten zur Suizidalität bei Jugendlichen wurden durch nachträgliche Analyse umgedeutet. Eine versiegelte Vorregistrierung der Endpunkte hätte die Umdeutung öffentlich nachweisbar gemacht.
- **Mehrere onkologische Studien**, bei denen Überlebens-Endpunkte gegen Surrogat-Endpunkte (progressionsfreies Überleben, Ansprechrate) ausgetauscht wurden, als sich kein Überlebensvorteil einstellte.

**Versagensmodi, die die Versiegelung unmittelbar aufdeckt:**

- **Endpunkt-Vertauschen**: nachträgliche Beförderung eines sekundären Endpunkts zum "primären", wenn der tatsächliche primäre Endpunkt scheitert. FAKT 05 der Versiegelung enthält den vorregistrierten primären Endpunkt; der veröffentlichte primäre Endpunkt muss übereinstimmen.
- **Selektive Auswahl von Resultaten (Cherry-Picking)**: selektives Berichten ausschließlich der Analysen, die funktioniert haben. FAKT 06 enthält den vollständigen vorregistrierten Analyseplan; die veröffentlichten Analysen müssen alle vorregistrierten enthalten.
- **Nachträgliches Subgruppen-Mining**: die Behauptung "das Medikament wirkt bei Subgruppe X" nach Sichtung der Daten. FAKT 07 enthält die vorregistrierte Subgruppenliste; jede andere Subgruppe muss als nachträglich (post-hoc) gekennzeichnet werden.
- **Fallzahl-Revision**: Erhöhung der Fallzahl nach Sichtung von Zwischentrends. FAKT 06 enthält die vorregistrierte Fallzahl und Poweranalyse.
- **Stilles Entfernen unbequemer sekundärer Endpunkte**: FAKT 05 ordnet die sekundären Endpunkte für die hierarchische Testung vorab; jede Umordnung oder Entfernung ist nachweisbar.
- **Unterdrückung negativer Ergebnisse**: FAKT 08 enthält die Veröffentlichungsverpflichtung; ein Ausbleiben der Publikation innerhalb des zugesagten Zeitfensters ist öffentlich sichtbar.

**Nicht abgedeckte Versagensmodi:**

- Fehlverhalten bei der Durchführung der Studie selbst (gefälschte Daten, betrügerische Rekrutierung). Die Versiegelung verankert den *Plan*, nicht die *Durchführung*.
- Selektives Berichten in Publikationen, die zwar alle vorregistrierten Analysen enthalten, diese jedoch günstig interpretieren. Die Versiegelung deckt auf, was fehlt; sie kann interpretative Verzerrung nicht aufdecken.
- Patientenschaden während der Studie selbst. Die Versiegelung ist regulatorisch und beweisbezogen; sie reduziert das Risiko bei der Studiendurchführung nicht.

## Wann dieses Kit einzusetzen ist

Eine Versiegelung der Vorregistrierung sollte erwogen werden, wenn:

- Sie eine klinische Studie sponsern oder durchführen — Phase 1 bis 4 —, die zur Information medizinischer oder regulatorischer Entscheidungen dienen wird.
- Sie bereit sind, sich öffentlich an das vorregistrierte Design, die Endpunkte und den Analyseplan zu binden.
- Sie mit der Konsequenz umgehen können: Scheitert die Studie an ihren vorregistrierten Endpunkten, können Sie nicht im Stillen zu einem anderen, funktionierenden Endpunkt umdeuten.
- Sie an einer Forschungskultur teilhaben (akademische Medizin, kooperative Gruppen, NIH-geförderte Forschung), in der Integrität bei der Vorregistrierung zunehmend eingefordert wird.

Dieses Kit ist *besonders* wertvoll für:

- Vom Prüfer initiierte Studien (investigator-initiated trials) an akademischen Einrichtungen (wo Sponsorendruck zur nachträglichen Endpunktänderung real ist, der akademische Prüfer jedoch einen reputationsbezogenen Anreiz hat, sich zu widersetzen).
- Open-Science-Studien und Citizen-Science-Studien.
- Drug-Repurposing-Studien in kleinen Biotech-Unternehmen ohne lange Erfolgsbilanz in der Studiendurchführung.
- Jede Studie, die regulatorische Einreichungen informieren soll, bei der spätere "das haben wir nie gesagt"-Argumente vorgebracht werden könnten.

## Wann dieses Kit NICHT einzusetzen ist

Setzen Sie dieses Kit NICHT ein, wenn:

- Das Studienprotokoll noch tatsächlich im Fluss ist. Vorregistrieren, wenn das Protokoll final ist, nicht vorher.
- Sie sich nicht verpflichten können, die Ergebnisse unabhängig von der Richtung zu publizieren. Die Versiegelung macht Nicht-Publikation öffentlich nachweisbar.
- Die Studie wettbewerbsrelevante industrielle Geheimhaltung beinhaltet, die Sie daran hindert, den Analyseplan öffentlich zu machen. Die Versiegelung macht den Analyseplan zu einem dauerhaften öffentlichen Datensatz; es gibt keine Möglichkeit, etwas privat zu versiegeln.
- Sie keine rechtliche und ethische Freigabe für das Protokoll haben. Die Versiegelung dokumentiert das Protokoll so, wie SIE es versiegelt haben; sie kann nicht rückwirkend von einer Ethikkommission oder einem IRB gebilligt werden.

## Wie dieses Kit für eine reale Vorregistrierung geforkt wird

```bash
# 1. Copy this example
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Replace fictional content with the real trial protocol content.
# Each fact corresponds to a section of a standard pre-registration:
$EDITOR facts/01_example_notice.txt   # REPLACE with real cover statement
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # PRIMARY + SECONDARY + EXPLORATORY
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Update site/index.html to reflect the real trial.

# 4. Seal (BEFORE enrollment begins, BEFORE database lock):
bash build/seal.sh

# 5. Verify locally:
python3 build/verify.py

# 6. Deploy:
#    - Publish the seal URL to your trial sponsor's website AND
#    - Add the IPFS CID to the trial's ClinicalTrials.gov record's
#      "Description" or "References" field, so the registry record
#      cross-references the cryptographic seal.
```

**KRITISCHES TIMING**: Die Versiegelung muss erstellt werden, BEVOR die Rekrutierung beginnt. Eine Vorregistrierung, die nach der Aufnahme des ersten Patienten versiegelt wurde, ist forensisch wesentlich schwächer. Idealerweise wird zum Zeitpunkt der IRB-Genehmigung versiegelt.

## Integration mit bestehender Vorregistrierungs-Infrastruktur

Das Kit ist auf Kombination, nicht auf Ersatz ausgelegt:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: Registrieren Sie die Studie wie vorgeschrieben im jurisdiktionellen Register. Verlinken Sie anschließend im Feld "Beschreibung" oder "Referenzen" des Registereintrags auf die MYRIAM-versiegelte Publikation.
- **OSF (Open Science Framework)**: OSF unterstützt Vorregistrierung mit Zeitstempeln, jedoch keine Bitcoin-Verankerung. Die MYRIAM-Versiegelung kann als ergänzende Datei auf der OSF-Registrierungsseite angehängt werden, was sowohl Zeitstempel als auch Bitcoin-Verankerung liefert.
- **AsPredicted.org**: ähnlich — verlinken Sie die MYRIAM-Versiegelung als ergänzende URL.
- **Fachzeitschriften**: Einige Zeitschriften (z. B. Trials, BMJ Open) akzeptieren URLs zur Vorregistrierung als Teil der Einreichung. Geben Sie die URL der MYRIAM-Versiegelung neben der URL des Registers an.

## Was Empfänger (Regulatoren, Zeitschriftengutachter, Meta-Analytiker) erhalten

Eine unter MYRIAM vorregistrierte Studie liefert Gutachtern:

1. **Kryptografischen Nachweis, dass das Protokoll zu einem bestimmten Zeitpunkt finalisiert wurde.** Gutachter können den Zeitpunkt der Versiegelung über die OTS-Quittung verifizieren.
2. **Bytweise Stabilität des Protokolltextes.** Gutachter, die den veröffentlichten Methoden-Abschnitt mit dem vorregistrierten Design vergleichen, können dies Zeichen für Zeichen tun.
3. **Erkennung von Endpunkt-Vertauschungen.** Ein einfacher Diff zwischen versiegeltem FAKT 05 und veröffentlichtem primärem Endpunkt deckt jede Substitution auf.
4. **Erkennung von Abweichungen vom Analyseplan.** Ein einfacher Diff zwischen versiegeltem FAKT 06 und den veröffentlichten statistischen Methoden deckt Modifikationen auf.
5. **Erkennung selektiver Subgruppen-Berichterstattung.** Der versiegelte FAKT 07 enthält alle vorregistrierten Subgruppen; jede Subgruppe in der Publikation, die nicht in der Versiegelung enthalten ist, muss als nachträglich (post-hoc) gekennzeichnet werden.

Dies erleichtert systematische Reviews und Meta-Analysen erheblich gegenüber der aktuellen Praxis.

## Was dieses Kit NICHT ist

- Kein Ersatz für die Genehmigung durch IRB / Ethikkommission.
- Kein Ersatz für die Registrierung im jurisdiktionellen Register.
- Keine Garantie dafür, dass die Studie wie geplant durchgeführt wird.
- Kein Mittel, um Patienteneinwilligungen oder andere ethische Dokumente zu verankern (diese benötigen ihren eigenen Versiegelungsmechanismus).
- Kein Schutz vor Kritik am Studiendesign nach der Publikation.

## Hinweis zur Publikation negativer Ergebnisse

Verpflichtung #1 in FAKT 08 ("Publikation unabhängig von der Richtung") ist die mortalitätsrelevanteste einzelne Verpflichtung in der Versiegelung. Die historische Unterdrückung negativer Studienergebnisse (insbesondere bei Psychopharmaka für Jugendliche, onkologischen Arzneimitteln in älteren Populationen und Herz-Kreislauf-Medikamenten bei Frauen) hat über Jahrzehnte plausibel zu Tausenden vermeidbarer Todesfälle durch Überverordnung auf Basis verzerrter Wirksamkeitsschätzungen beigetragen.

Eine versiegelte Verpflichtung zur Publikation negativer Ergebnisse ist für sich allein einer der hebelstärksten Schritte für die öffentliche Gesundheit, den ein Sponsor unternehmen kann. Die Versiegelung schafft externe Rechenschaft für diese Verpflichtung in einer Weise, die selbst-überwachte Publikationsrichtlinien nicht bieten.

## Abschluss

Die Vorregistrierung klinischer Arzneimittelstudien unter MYRIAM bedeutet wenig zusätzliche Arbeit für den Sponsor: ~30 Minuten, um die Fakten zu befüllen, ~10 Sekunden, um zu versiegeln. Die hinzugefügte Rechenschaft ist asymmetrisch: geringe Kosten für eine integre Studiendurchführung, große Beschränkung für das nachträgliche Manövrieren, das zu historischen Verzerrungen der Evidenzbasis beigetragen hat.

Falls Sie als Sponsor oder Hauptprüfer (Principal Investigator) dieses Kit erwägen — das Kit ist gemeinfrei (CC0). Nutzen Sie es. Modifizieren Sie es. Verbessern Sie es.

## Lizenz

Gemeinfrei (CC0). Keine Namensnennung erforderlich.
