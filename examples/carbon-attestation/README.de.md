*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Carbon Attestation Seal Kit (Siegelpaket für Kohlenstoff-Attestierungen)

Ein schlüsselfertiges myriam-kit-Beispiel für Entwickler von
Kohlenstoffprojekten, unabhängige Verifizierer und Register, die zum
genauen Zeitpunkt der Zertifizierung ein Bitcoin-verankertes,
manipulationssichtbares Siegel einer Emissionsgutschriften-Ausstellung,
einer Senken-/Removal-Verifizierung oder eines Emissions-
Attestierungsereignisses veröffentlichen möchten — damit stille
Modifikationen nach Ausstellung öffentlich erkennbar werden.

---

## Was dieses Kit NICHT leistet (zuerst lesen)

Kohlenstoffgutschriften sind politisch wie wissenschaftlich umstritten.
Das Siegel ist ein kryptografischer Zeitstempel dessen, was attestiert
wurde. Es kann nicht verifizieren, ob das Attestierte einen
tatsächlichen Klimanutzen widerspiegelt. Die folgenden Versagensmodi
liegen **außerhalb des Geltungsbereichs des Siegels** und machen die
meisten der inhaltlich bedeutsamen Integritätsfragen zu
Kohlenstoffgutschriften aus:

1. **Zusätzlichkeit (Additionality).** Das Siegel kann nicht
   verifizieren, dass die kreditierte Aktivität ohne
   Kohlenstoff-Finanzierung nicht stattgefunden hätte. Das
   Kontrafaktische ist prinzipiell nicht beobachtbar. Das Siegel
   protokolliert das Zusätzlichkeitsargument der Methodik; es
   entscheidet nicht darüber.

2. **Permanenz (Permanence).** Das Siegel kann nicht verifizieren,
   dass sequestrierter Kohlenstoff über den relevanten Zeithorizont
   sequestriert bleibt (Jahrzehnte bis Jahrhunderte bei
   Waldkohlenstoff, geologische Zeitskalen bei einigen Removals).
   Neuere Literatur (Badgley et al. 2022, Patterson et al. 2022)
   zeigt, dass Pufferpools (buffer pools) durch reale
   Umkehrereignisse substanziell aufgezehrt wurden. Eine versiegelte
   Gutschrift ist eine versiegelte *Behauptung* der Permanenz unter
   spezifizierten Pufferpool-Annahmen, kein Nachweis von Permanenz.

3. **Verlagerung (Leakage).** Das Siegel kann nicht verifizieren,
   dass im Projektgebiet vermiedene Emissionen nicht schlicht in ein
   Nicht-Projektgebiet verschoben werden. Methodik-Standard-Abzüge
   für Verlagerung sind regulatorische Platzhalter, keine Messungen.
   Das Siegel verankert den angewandten Abzug; es zertifiziert ihn
   nicht als korrekt.

4. **Zusatznutzen (Co-benefits).** Das Siegel kann
   Gemeindeentwicklungs- oder Biodiversitätsbehauptungen nicht
   verifizieren. Zusatznutzen werden typischerweise selbst
   deklariert und vom Verifizierer geprüft, nicht in der Tiefe der
   Kohlenstoffquantifizierung auditiert. Das Siegel verankert die
   Dokument-Hashes; nicht mehr.

5. **Hinlänglichkeit der freien, vorherigen und informierten
   Zustimmung (Free, Prior and Informed Consent — FPIC).**
   Indigene und gemeindliche Zustimmung in Kohlenstoffprojekten hat
   eine dokumentierte Geschichte von Versagensmodi (erzwungene
   Zustimmung, Zustimmung nicht-repräsentativer Organe, nachträgliche
   "Zustimmung" durch Entschädigung). Das Siegel verankert die
   FPIC-Dokumentation und die Hashes des Beschwerdejournals; es kann
   nicht zertifizieren, dass der Zustimmungsprozess authentisch war.

6. **Unabhängigkeit des Verifizierers.** Verifizierer werden von
   Projektentwicklern bezahlt. Dies ist ein struktureller
   Interessenkonflikt, den kein Akkreditierungssystem gelöst hat. Das
   Siegel verankert die Unabhängigkeitserklärung des Verifizierers;
   es zertifiziert nicht, dass die Erklärung zutrifft.

7. **Doppelzählung über Register hinweg oder gegenüber nationalen
   Inventaren.** Das Siegel verankert den Schnappschuss des
   Registerzustands zum Zeitpunkt der Attestierung. Wenn dieselbe
   Aktivität zugleich von einem Gastland auf dessen NDC angerechnet
   oder zugleich in einem anderen Register beansprucht wird, macht
   das Siegel den Registerzustand vergleichbar (diffable), verhindert
   die Doppelzählung jedoch nicht.

8. **Richtigkeit der Käuferbehauptung.** Ein Käufer, der eine
   versiegelte Gutschrift zur Stützung einer "Netto-Null"- oder
   "Klimaneutralität"-Behauptung stilllegt, formuliert eine
   nachgelagerte Behauptung, die das Siegel nicht abdeckt. Das
   Siegel protokolliert die Stilllegung; die Gültigkeit der
   Marketingbehauptung des Käufers ist eine eigenständige,
   nachgelagerte Frage.

9. **Richtigkeit der Methodik.** Das Siegel protokolliert die
   Methodik-Zitation + den Dokument-Hash, der zum Zeitpunkt der
   Attestierung in Kraft war. Es behauptet nicht, dass die Methodik
   wissenschaftlich valide ist. Methodik-Reformen finden statt; eine
   Versiegelung unter einer später revidierten Methodik macht die
   Gutschriften nicht rückwirkend "falsch" oder "richtig" — sie
   verankert, welche Regeln zum Ausstellungszeitpunkt galten.

**Der vorstehende Abschnitt über die ehrlichen Grenzen ist das
tragende Element dieses Kits.** Nahezu jede inhaltlich bedeutsame
Integritätsfrage zu einer Kohlenstoffgutschrift gehört in einen
dieser neun Kästen. Das Siegel schließt die schmale verbleibende
Lücke: die stille rückwirkende Modifikation der aktenkundigen Bytes.
Diese Lücke ist real und es lohnt sich, sie zu schließen, doch sie
ist klein im Vergleich zum umstrittenen Terrain.

---

## Was dieses Kit zu versiegeln VERWEIGERN MUSS

Das Kit ist so konfiguriert, dass es die folgenden Sachmuster auch
dann ablehnt, wenn ein Nutzer mit gültiger Signaturbefugnis sie
einreicht:

- **"Zusätzlichkeit" als Tatsache formuliert.** Das Versiegeln von
  Zusätzlichkeit als Tatsache erzeugt einen irreführenden Datensatz.
  Das Kit akzeptiert methodikkonforme Zusätzlichkeits-*Argumente*,
  keine Zusätzlichkeits-*Behauptungen*.
- **"Permanenz" ohne ausdrückliche Offenlegung von Zeithorizont und
  Pufferpool.** Permanenz ohne diese Parameter zu versiegeln,
  verschleiert, worauf sich das Projekt tatsächlich verpflichtet.
- **"Keine Verlagerung" ohne projektspezifische Messung.**
  Methodik-Standard-Abzüge für Verlagerung sind keine Messung, und
  das Siegel behandelt sie nicht als solche.
- **Quantifizierungen, die vor Abschluss der unabhängigen
  Verifizierung erzeugt wurden.** Ein Siegel vor Verifizierung
  erzeugt einen Datensatz mit dem Falschpositiv "verifiziert".
- **Ausstellungsdatensätze für Gutschriften, die auch in einem
  anderen Register ausgestellt werden, ohne ausdrückliche
  registerübergreifende Offenlegung** in FACT 06.
- **Stilllegungsdatensätze, die den Stilllegungs-Begünstigten nicht
  benennen.** Anonyme Stilllegung untergräbt die Gemeingut-Funktion
  der Stilllegung; das Kit verweigert, dies zu ermöglichen.
- **FPIC-Behauptungen, die nicht durch attestierbare Dokument-Hashes
  gestützt sind.**
- **Article-6.2-/-6.4-Ausstellung ohne einen in FACT 06 versiegelten
  Hash der Ermächtigungserklärung (Letter of Authorization, LoA) des
  Gastlandes**.
- **Versiegelung auf Anforderung einer anderen Partei als des
  Projektentwicklers + des Verifizierers gemeinsam** für dieses
  Projekt.
- **Zusatznutzen-Behauptungen, die als "zertifiziert" versiegelt
  werden,** obwohl sie nur "selbst deklariert und vom Verifizierer
  geprüft" sind.

Eine Verweigerung kann ihrerseits als Tatsache versiegelt werden
("Diese Partei hat die Versiegelung von X angefordert; das Kit hat
gemäß Verweigerungsregel Y abgelehnt") und so einen öffentlichen
Datensatz versuchter Fehlverwendung schaffen.

---

## Was dieses Kit versiegelt

8 Fakten zum Zeitpunkt der Attestierung:

1. **Beispielhinweis** — erklärt die Veröffentlichung zu einem
   Beispiel (echte Attestierungen entfernen oder ersetzen dies).
2. **Projektidentifikation** — Projektname, Register,
   Register-Projekt-ID, Methodik-Zitation + Hash, Hash der
   geografischen Abgrenzung, Vintage, Projektentwickler,
   Zusatznutzen-Behauptung, FPIC-Status.
3. **Emissions- oder Removal-Quantifizierung** — Bruttotonnen CO2e,
   kontrafaktische Baseline, Verlagerungsabzug, Pufferpool-Beitrag,
   Unsicherheitsabzug, netto kreditierbare Behauptung, Hashes jeder
   numerischen Eingabe.
4. **Messmethodik** — Fernerkundungs-Datenquellen, Ground-Truth-
   Plotnetz, Hash des Instrumentkalibrierungsprotokolls, Hash des
   Klassifikatormodells + Genauigkeitsstatistiken,
   Kohlenstoffdichtemodell, Code-Herkunft +
   Reproduzierbarkeitsmanifest.
5. **Unabhängige Verifizierung** — Verifizierer-Organisation,
   Akkreditierung, Hash der Unabhängigkeitserklärung, frühere
   Aufträge mit dem Entwickler, Hash des
   Vor-Ort-Foto-Archivs, gestellte und gelöste Feststellungen, Hash
   des Verifizierungs-Gutachtendokuments.
6. **Ausstellungs- oder Stilllegungsdatensatz** —
   Ausstellungsantrag + Genehmigung, Gesamtzahl ausgestellter
   Gutschriften, Seriennummernbereich, registerübergreifende
   Erklärung, gegebenenfalls Hash der LoA des Gastlandes,
   Stilllegungs-Seriennummernbereiche + Begünstigte (bei
   Stilllegungs-Attestierungen), Hashes der Schnappschüsse des
   Registerzustands.
7. **Begleitende Offenlegungen und Verweigerungsprotokoll** —
   anhängige Methodikstreitigkeiten, Risiko der Nicht-Permanenz,
   Verlagerungs-Vorbehalte, Zusätzlichkeits-Vorbehalte, Hashes von
   FPIC + Beschwerdejournal, Zusatznutzen-Vorbehalt, frühere
   Verifizierer-Beauftragung; ausdrückliche Liste der Muster, die
   das Kit zu versiegeln verweigert hat.
8. **Signierende Hauptbeteiligte** — Projektentwickler +
   Verifizierer + Register, jeweils mit Rolle + Umfang der
   Attestierung + kryptografischen Schlüsselangaben.

Jede Tatsache endet mit der Verweigerungstor-Konvention: *"Diese
Tatsache behauptet nur X. Sie behauptet nicht Y"* (wobei Y der
nächstliegende Versagensmodus aus dem obigen Abschnitt "Was dieses
Kit NICHT leistet" ist).

---

## Wogegen dieses Kit verteidigt

- **Stille Modifikation der Quantifizierung nach Ausstellung.**
  Jede ganzzahlige Änderung an FACT 03 ergibt einen anderen
  SHA-256, eine andere Merkle-Wurzel und schlägt bei der
  OTS-Verifizierung fehl.
- **Stille Methodik-Substitution.** FACT 02 friert die
  Methodik-Zitation + den Dokument-Hash zum Ausstellungszeitpunkt
  ein. Das nachträgliche Einsetzen einer anderen Methodikversion
  durch das Register ist öffentlich vergleichbar (diffable).
- **Stille Baseline-Revision.** Der Hash der
  Baseline-Szenario-Modellausgabe in FACT 03 ist versiegelt. Ein
  nachträgliches Nachjustieren der Baseline zur Erzeugung von mehr
  Gutschriften ist detektierbar.
- **Stille Substitution des Verifizierer-Gutachtens.** Der
  Dokument-Hash des Gutachtens in FACT 05 ist versiegelt. Eine
  Umschreibung nach Ausstellung im Sinne von "Der Verifizierer hat
  schon immer X gesagt" ist detektierbar.
- **Stilles Verschwinden eines Stilllegungsdatensatzes.** Der
  Schnappschuss des Registerzustands in FACT 06 ist versiegelt.
  Gutschriften, die nach einer als Stilllegung markierten Phase
  geheimnisvoll wieder "verfügbar" werden, sind gegen das Siegel
  detektierbar.
- **Stille Substitution von FPIC-Dokumenten.** Die Hashes von FPIC +
  Beschwerdejournal in FACT 07 sind versiegelt.
  Ersatz-Zustimmungsdokumente sind detektierbar.
- **Stille Entfernung unbequemer Offenlegungen.** Der Status der
  begleitenden Offenlegungen in FACT 07 ist versiegelt. Das stille
  Löschen eines Nicht-Permanenz-Vorbehalts aus einer
  Projektbeschreibungsseite ist gegen die versiegelten Bytes
  detektierbar.

Das Kit verteidigt NICHT gegen die zugrundeliegenden
Integritätsfragen (Zusätzlichkeit, Permanenz, Verlagerung,
FPIC-Hinlänglichkeit, Verifizierer-Unabhängigkeit, Validität der
Methodik). Das sind die schwierigeren Probleme, und das Siegel kann
sie nicht lösen.

---

## Historische oder nahezu historische Fälle, bei denen das Kit geholfen hätte

Das Kit hätte einen nützlichen Anker — *keine Lösung* — in Fällen
geliefert, in denen Kohlenstoff-Attestierungsdatensätze still
rückwirkend modifiziert wurden. Es hätte die zugrundeliegenden
umstrittenen Fragen in keinem dieser Fälle gelöst.

- **Die Verra-Regenwald-Gutschriften-Untersuchung 2023 durch The
  Guardian / Die Zeit / SourceMaterial.** Die Untersucher fanden,
  dass die meisten der studierten REDD+-Projekte Gutschriften
  hervorbrachten, deren behauptete vermiedene Emissionen nicht zu
  einer späteren Fernerkundungs-Reanalyse passten. Die Untersuchung
  musste die Projektdokumentation gegen rückwirkend modifizierte
  Registerdatensätze rekonstruieren. Eine versiegelte Veröffentlichung
  bei jedem Ausstellungszyklus hätte unzweideutige
  Referenz-Bytes dafür geliefert, was in jedem Zyklus attestiert
  wurde — keine Lösung für das zugrundeliegende Baseline-Problem,
  aber eine saubere forensische Zeitleiste.

- **Die kalifornischen Wald-Offset-Umkehrungsereignisse 2020.**
  Mehrere Waldkohlenstoff-Projekte im Compliance-Markt Kaliforniens
  erlebten Waldbrand-Umkehrungen, die die für sie zurückgelegte
  Pufferpool-Reserve überstiegen. Zu rekonstruieren, was jedes
  Projekt *bei Ausstellung* über das Nicht-Permanenz-Risiko
  attestiert hatte (gegenüber dem, was das Projekt später behauptete,
  attestiert zu haben), ist derzeit schwierig. Vintage-bezogene
  Siegel hätten die Vorbrand-Attestierungen kanonisch abrufbar
  gemacht.

- **Diverse REDD+-Projekte, in denen Referenzregion-Baseline-
  Methodiken rückwirkend als überhöht kritisiert wurden.** Ein zum
  Ausstellungszeitpunkt versiegelter Methodik-Dokument-Hash hätte
  verankert, welche Methodikversion tatsächlich für welche Vintage
  galt, und die Verteidigung "die Methodik war schon immer X"
  vergleichbar (diffable) gemacht.

- **Mehrere Streitigkeiten zu australischen Carbon-Credit-Unit-
  (ACCU)-Projekten zur menschlich induzierten Regeneration
  (2022–2023).** Die akademische Kritik, ob die Regeneration
  tatsächlich projektinduziert oder natürlich war, wandelte sich in
  Streitigkeiten darüber, was das Projekt ursprünglich behauptet
  hatte. Versiegelte Attestierungen hätten je Vintage unzweideutige
  Datensätze geliefert.

- **Stilllegungsdatensätze für Kohlenstoff-Offsets, die ihren Zustand
  geändert haben.** Mehrere dokumentierte Fälle, in denen
  Stilllegungsdatensätze in Registern des Freiwilligenmarktes nach
  der Stilllegung anscheinend ihren Status ändern (aus einem anderen
  Grund "stillgelegt" werden oder nachträglich einem anderen
  Begünstigten zugeordnet werden). Per-Stilllegung-Siegel hätten den
  Zustand im Moment der ursprünglichen Stilllegung verankert.

In keinem dieser Fälle hätte das Kit aufgelöst, ob die
zugrundeliegende Gutschrift einen realen Klimanutzen abbildete. Das
Kit verankert Datensätze; mehr tut es nicht.

---

## Wann dieses Kit einzusetzen ist

- Sie sind Projektentwickler und möchten neben der üblichen
  Registereinreichung eine manipulationssichtbare Attestierung
  veröffentlichen.
- Sie sind unabhängiger Verifizierer und möchten, dass Ihr
  Verifizierungsgutachten gegen eine spätere Register-Darstellung
  "was der Verifizierer gesagt hat" öffentlich verifizierbar ist.
- Sie sind ein Register und möchten eine zusätzliche
  Integritätsschicht für Ausstellungs- und Stilllegungsdatensätze
  anbieten — insbesondere für Projekte in Jurisdiktionen mit
  schwächerer rechtsstaatlicher Absicherung der Registerintegrität.
- Sie sind Journalistin/Journalist, akademisch tätig oder NGO und
  führen eine mehrjährige Längsschnittanalyse von
  Kohlenstoffprojekten durch und benötigen einen öffentlichen Anker,
  um spätere Darstellungen eines Projekts gegen seine Bytes zum
  Ausstellungszeitpunkt zu vergleichen.
- Sie sind Käufer (Konzern-Netto-Null, Luftfahrt-Compliance) und
  möchten, dass die von Ihnen stillgelegten Gutschriften gegen
  öffentlich verankerte Datensätze stillgelegt werden, sodass Ihre
  nachgelagerte Marketingbehauptung gegen eine stabile forensische
  Zeitleiste auditierbar ist.

## Wann dieses Kit NICHT einzusetzen ist

- **Nicht als Ersatz für akkreditierte unabhängige Verifizierung.**
  Das Siegel ersetzt keine ISO-14064-3-Verifizierung; es komponiert
  mit ihr.
- **Nicht zur Behauptung, ein Projekt sei "zusätzlich",
  "permanent" oder "verlagerungsarm".** Das Siegel kann diese
  Eigenschaften nicht verifizieren. Das Siegel zu deren Behauptung
  zu nutzen, ist Fehlverwendung.
- **Nicht als Legitimitätstheater für minderwertige Gutschriften.**
  Ein kryptografisches Siegel auf einer minderwertigen Gutschrift
  ist ein dauerhafter forensischer Datensatz der schlechten
  Qualität, keine Verteidigung derselben. Das Primitiv schneidet in
  beide Richtungen; das ist seine Ehrlichkeit.
- **Nicht zum Versiegeln von Gutschriften nutzen, die zugleich von
  einem Gastland auf dessen NDC angerechnet werden,** ohne
  ausdrückliche Offenlegung einer entsprechenden Anpassung
  (corresponding adjustment) in FACT 06.
- **Nicht vor der Verifizierung versiegeln.** Ein Siegel vor
  endgültigem Verifizierer-Gutachten erzeugt einen Datensatz mit
  dem Falschpositiv "verifiziert".
- **Nicht unter Druck einsetzen, um eine begleitende
  Tatsachen-Offenlegung in FACT 07 auszulassen** (anhängige
  Methodikstreitigkeiten, FPIC-Fragen, frühere
  Verifizierer-Beauftragung). Lehnen Sie ab und versiegeln Sie die
  Ablehnung.
- **Nicht als Marketing-Plakette einsetzen.** "MYRIAM-versiegelt"
  ist keine Qualitätsbehauptung; es ist eine forensische
  Eigenschaft. Als Qualitätssiegel behandelt zu werden, ist genau
  die Fehlverwendung, die das constraint-first-Design zu verhindern
  sucht.

## Wie man dieses Kit für eine reale Attestierung forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # SEAL AT or AFTER registry issuance, not before
python3 build/verify.py    # confirm
```

**Kritischer Zeitpunkt:** SIEGEL ZUM oder NACH dem offiziellen
Ausstellungsereignis des Registers setzen, NICHT davor. Ein
Vorab-Siegel erzeugt einen Datensatz mit dem Falschpositiv
"ausgestellt". Bei Stilllegungs-Attestierungen wird ZUM Moment der
Stilllegung versiegelt. Bei laufenden Monitoring-Attestierungen
zwischen Ausstellung und Stilllegung wird bei jedem vom Verifizierer
unterzeichneten Monitoring-Zyklus versiegelt — aber FACT 01 muss
klarstellen, dass die Attestierung ein Monitoring-Update ist und
keine Ausstellung.

## Integration mit bestehender Kohlenstoff-Infrastruktur

- **Verra (VCS).** Die URL der versiegelten Veröffentlichung bzw.
  die IPFS-CID kann als ergänzende Dokumentation an die
  VCS-Projektseite angehängt werden. Das Siegel ersetzt nicht die
  VCS-Verifizierung; es komponiert mit ihr.
- **Gold Standard.** Gleiches Integrationsmodell — ergänzende
  Attestierung neben der Gold-Standard-Ausstellungsdokumentation.
  Gold Standards Schwerpunkt auf Zusatznutzen- und
  Gemeindenutzen-Dokumentation lässt sich natürlich auf FACT 02 +
  FACT 07 abbilden.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Gleiches Integrationsmodell.
- **Article 6.4 (Aufsichtsmechanismus des Pariser Abkommens).** Der
  Hash der LoA des Gastlandes in FACT 06 ist speziell für die
  ITMO-Rückverfolgbarkeit nach Article 6.4 / 6.2 ausgelegt. Die
  Offenlegung der entsprechenden Anpassung ist ein
  verweigerungstor-geschützes Feld.
- **MRV im EU ETS.** Für Emittenten im Compliance-Markt bildet der
  Hash des MRV-Berichts den Hash der Quantifizierungs-Tabelle in
  FACT 03 ab. Das Siegel komponiert mit dem verifizierten
  Emissionsbericht des Betreibers; es ersetzt ihn nicht.
- **CDP (Carbon Disclosure Project) — Unternehmensoffenlegung.** Für
  Unternehmen, die stillgelegte Gutschriften in CDP-Einreichungen
  zitieren, ist der unter FACT 06 versiegelte Stilllegungsdatensatz
  der kanonische abrufbare Datensatz. Die Einreichungstexte des CDP
  können die Merkle-Wurzel oder die IPFS-CID der versiegelten
  Veröffentlichung referenzieren.
- **ISO 14064-2 (Projekt) / ISO 14064-3 (Verifizierung) / ISO 14065
  (Akkreditierung).** Das Siegel protokolliert die
  Konformitätsbehauptung + Hashes; es führt die
  Konformitätsbewertung nicht durch.
- **TSVCM Core Carbon Principles (CCP) / ICVCM-Label.** Wenn ein
  Projekt gegen die ICVCM-CCPs bewertet wurde, kann der Hash des
  Bewertungsergebnisses in FACT 07 als begleitende Offenlegung
  versiegelt werden.

## Was dieses Kit NICHT ersetzt

- Akkreditierte unabhängige Verifizierung (ISO 14064-3)
- Workflows zur Ausstellung und Stilllegung in Registern
- Bewertung der Methodikkonformität
- Ermächtigungsprozesse des Gastlandes für Article-6-Transaktionen
- MRV-Prozesse im Compliance-Markt (EU ETS, California
  Cap-and-Trade, RGGI usw.)
- Integritätsinitiativen für den Freiwilligenmarkt (ICVCM, VCMI)
- Unabhängige Bewertung der Klimawirkung

## Warum dieses Kit in v0.4.0+ existiert

Dies ist das 7. mit myriam-kit ausgelieferte ausgearbeitete Beispiel.
Das Kit existiert, weil Kohlenstoffgutschriften-Märkte eine
gut dokumentierte Geschichte stiller rückwirkender Modifikation
haben — Methodiken, die rückwirkend neu interpretiert werden,
Baselines, die rückwirkend revidiert werden, Stilllegungsdatensätze,
die ihren Zustand ändern, und Projekt-Offenlegungen, die im Laufe
der Zeit unbequeme Vorbehalte stillschweigend fallen lassen.

Das Siegel schließt die *schmale* Lücke der Bytes zum Zeitpunkt der
Attestierung. Es adressiert — und kann — die größeren umstrittenen
Fragen zu Zusätzlichkeit, Permanenz, Verlagerung oder Authentizität
des Zusatznutzens nicht. Die ehrliche Einordnung dieser Begrenzung
ist das wichtigste Merkmal des Kits.

## Lizenz

Public Domain (CC0). Forken Sie es. Keine Quellenangabe erforderlich.
