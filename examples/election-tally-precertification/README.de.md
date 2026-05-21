*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Kit zur Vor-Zertifizierungsversiegelung von Wahlauszählungen

Ein schlüsselfertiges myriam-kit-Beispiel für Wahlausschüsse auf
Bezirksebene, Wahlbehörden auf Landesebene und Beobachter der
Wahlintegrität, die ein an Bitcoin verankertes, manipulationserkennendes
Siegel einer Auszählung zum exakten Zeitpunkt der Zertifizierung
veröffentlichen möchten.

**Schließt** [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Was dieses Kit NICHT leistet (zuerst lesen)

Das Siegel ist ein kryptografischer Zeitstempel dessen, was zertifiziert
wurde. Es kann nicht verifizieren, ob das, was zertifiziert wurde,
korrekt war. Die folgenden Versagensmodi liegen **außerhalb der Domäne
des Siegels**:

1. **Kompromittierung der Wahlmaschinen.** Falls die Firmware manipuliert
   wurde oder Stimmenzahlen falsch ausgezählt wurden, verankert das
   Siegel eine falsche Zahl mit hoher Integrität. Das Siegel beobachtet
   die Ausgaben des Tabulationssystems; es hat keine Sichtbarkeit in das
   System selbst.

2. **Wählerunterdrückung / strukturelle Entrechtung.** Schließungen von
   Wahllokalen, Ungleichbehandlungen durch Ausweisgesetze, Verzerrungen
   bei den Ablehnungsraten von Briefwahlstimmen und Säuberungen der
   Wählerverzeichnisse liegen stromaufwärts der Zertifizierung. Das
   Siegel erfasst gezählte Stimmen, nicht Stimmen, die hätten gezählt
   werden sollen.

3. **Wahlbezogene Desinformation.** Das Siegel urteilt nicht über
   Behauptungen zur Wahl, die von Kandidaten, Medien oder Plattformen
   geäußert werden. Eine versiegelte Zertifizierung kann in einem
   Desinformationsnarrativ ebenso leicht zitiert werden wie zu deren
   Abwehr. Kryptografische Zeitstempel sind inhaltsneutral.

4. **Vor-Zertifizierungsbetrug während der Stimmzettelsammlung oder
   -auszählung.** Unregelmäßigkeiten beim Stimmzettel-Sammeln,
   Manipulationen an Wahlurnen, Brüche der Beweiskette während des
   Auszählungsfensters — all dies geschieht vor dem Siegelmoment. Das
   Siegel kann sie nicht rückwirkend erkennen.

5. **Nötigung der zertifizierenden Behörde.** Eine genötigte
   Zertifizierung erzeugt ein kryptografisch gültiges Siegel eines
   genötigten Ergebnisses. Das Siegel verifiziert, dass ein Amtsträger
   unterschrieben hat, nicht warum.

6. **Falsche Zertifizierungen, die später nie korrigiert werden.** Der
   Wert des Siegels hängt von einem späteren Wahrheitsfindungsprozess
   (Prüfung, Neuauszählung, Rechtsstreit) ab, mit dem das Siegel
   verglichen werden kann. Falls ein solcher Prozess nie stattfindet,
   bleibt das Siegel der einzige Datensatz und kann den Fehler
   verfestigen.

7. **Statistische Anomalien und Mustererkennung.** Das Siegel
   kennzeichnet keine unplausiblen Stimmenabstände, geografische
   Anomalien oder Abweichungen vom Benford-Gesetz. Diese sind
   analytische Aufgaben an den versiegelten Daten, nicht Eigenschaften
   des Siegels.

8. **Nachgeordnete Wahlen mit dünnen Prüfpfaden.** Kleinere Wahlrennen
   haben schwächere Neuauszählungs-Auslöser; ein einzelnes Siegel kann
   nicht sinnvoll alle Rennen auf einem Stimmzettel abdecken, ohne den
   Geltungsbereich pro Rennen festzulegen.

**Der obige Abschnitt zu ehrlichen Grenzen ist der tragende Teil dieses
Kits.** Amtsträger, die glauben, Versiegelung sei gleichbedeutend mit
Legitimität, werden es als Schild verwenden. Das Kit muss unmissverständlich
sagen: dies ist eine *Nicht-Abstreitbarkeits-Primitive für den
Zertifizierungsmoment*, kein Beweis der Wahlrichtigkeit.

---

## Was dieses Kit zu versiegeln VERWEIGERN MUSS

Das Kit ist so konfiguriert, dass es die folgenden Faktenmuster
zurückweist, selbst wenn ein Nutzer mit gültiger Signaturberechtigung sie
einreicht:

- **Individuelle Wähleridentifikation.** Kein Fakt darf einen Wähler
  benennen, einen Stimmzettel mit einem Wähler verknüpfen oder ein Feld
  preisgeben, das eine Re-Identifikation einer Person ermöglichen könnte.
- **Entscheidungen zur Signaturübereinstimmung pro Stimmzettel.**
  PII-belastet; eine Versiegelung schafft dauerhafte Datensätze von
  Entscheidungen, die später angefochten werden könnten.
- **Jeder Fakt, dessen Veröffentlichung einen verletzlichen Wähler
  identifizieren würde.** Eingeschlossen sind Ergebnisse auf
  Wahllokal-Ebene in so kleinen Wahllokalen, dass die Stimmwahl ableitbar
  ist (typischerweise <50 Stimmzettel).
- **Auszählungen, die vor der Zählung aller Stimmzettel versiegelt
  werden.** Das Kit weist Teilauszählungen, die als „die Auszählung"
  präsentiert werden, zurück. Vor-Zertifizierung bedeutet *alle
  Stimmzettel gezählt, vor der offiziellen Zertifizierung* — nicht
  *während der Auszählung*.
- **Vorläufige oder bedingte Zertifizierungen.** Das Siegel muss einen
  Fakt widerspiegeln, keine Bedingung.
- **Zählungen, die anhängige Rechtsstreitkohorten ausschließen**, ohne
  einen expliziten versiegelten Begleitfakt, der den Ausschluss
  offenlegt.
- **Versiegelung durch jeden anderen als die zertifizierende Behörde**
  für diese Jurisdiktion.

Eine Verweigerung kann selbst als Fakt versiegelt werden („Diese Behörde
hat die Versiegelung von X angefordert; das Kit hat dies gemäß
Verweigerungsregel Y abgelehnt"), wodurch ein öffentlicher Datensatz
versuchten Missbrauchs entsteht.

---

## Was dieses Kit WIRKLICH versiegelt

8 Fakten zum Zeitpunkt der Zertifizierung:

1. **Beispielhinweis** — erklärt die Veröffentlichung zum Beispiel
   (reale Bezeugungen entfernen oder ersetzen diesen).
2. **Identifikation der Jurisdiktion** — Bezirk, Wahltag,
   zertifizierende Behörde, zertifizierende Amtsträger mit Name und
   Funktion.
3. **Zertifizierte Auszählung** — Stimmgesamtsummen pro Rennen und pro
   Kandidat + Über-/Unterstimmen + Eintragungen (write-ins).
4. **Stimmzettelbuchhaltung und -abgleich** — gesamt abgegebene, gesamt
   tabulierte, gesamt abgelehnte (nach Kategorie), Modusaufschlüsselung,
   Nenner registrierter Wähler.
5. **Geräte- und Prüfpfad-Manifest** — Tabulator-Modell + Firmware-Hash,
   CVR-Datei-Hash, Hash des Stimmzettelbild-Archivs, Hash des
   Custody-Logs, Hash der Signaturübereinstimmungs-Richtlinie.
6. **Schwellenwerte und Auslöser bei der Zertifizierung** — geltender
   Signaturübereinstimmungs-Schwellenwert, Neuauszählungs-Auslöseschwellen,
   tatsächliche Stimmenabstände pro Rennen, RLA-Seed-Commitment.
7. **Begleitende Offenlegungen und Verweigerungsdatensatz** — anhängige
   Rechtsstreitigkeiten, in Prüfung befindliche Nachzählungs-Anomalien,
   ausgeschlossene Kohorten, abweichende Vorstandsmitglieder; explizite
   Liste der Muster, deren Versiegelung das Kit verweigert hat.
8. **Signierender Prinzipal** — Identifikation des Wahlausschusses
   (Board of Canvassers) + Name und Partei jedes Unterzeichners +
   kryptografische Schlüsselinformation.

Jeder Fakt endet mit der Verweigerungs-Gate-Konvention: *„Dieser Fakt
behauptet nur X. Er behauptet nicht Y"* (wobei Y der nächstliegende
Versagensmodus aus dem obigen Abschnitt „NICHT leistet" ist).

---

## Wogegen sich dieses Kit verteidigt

- **Stillschweigende Nach-Zertifizierungs-Revisionen von
  Stimmgesamtsummen** — jede ganzzahlige Änderung an FAKT 03 erzeugt
  einen anderen SHA-256, eine andere Merkle-Wurzel und scheitert bei der
  OTS-Verifikation.
- **„Aufgefundene Stimmzettel", die stillschweigend absorbiert werden** —
  die Abgleichsarithmetik in FAKT 04 ist zum Zertifizierungszeitpunkt
  fixiert.
- **Firmware-Austausch-Behauptungen** — FAKT 05 friert das
  Gerätemanifest bei der Zertifizierung ein.
- **Austausch von Prüfartefakten nach der Zertifizierung** — der
  Hash-Manifest von FAKT 05 erfasst jede nach der Zertifizierung
  vorgenommene Änderung an CVR, Stimmzettelbildern, Custody-Logs oder
  Signaturübereinstimmungs-Richtlinien.
- **Neudefinition von Schwellenwerten und Auslösern** — FAKT 06 friert
  die zum Zertifizierungszeitpunkt geltenden Regeln ein
  (Signaturübereinstimmungs-Schwellenwert, Neuauszählungs-Auslöser,
  RLA-Risikolimit).

## Historische oder zeitnahe Fälle, in denen das Kit geholfen hätte

Das Kit hätte einen nützlichen Anker — *keine Behebung* — in Fällen
geliefert wie:

- **Antrim County, Michigan (2020).** Erste inoffizielle Ergebnisse
  zeigten einen Kandidaten-Tausch, der später zum gegenteiligen Ausgang
  korrigiert wurde. Ein Vor-Korrektur-Siegel hätte einen öffentlichen
  Referenzpunkt für das geliefert, was die ursprüngliche Ankündigung
  sagte, gegenüber dem, was die Korrektur sagte, beides kryptografisch
  bezeugt.
- **Maricopa County, Arizona (2020–2022).** Mehrere Iterationen
  nachgezählter/neu untersuchter Gesamtsummen kursierten. Ein Siegel
  zum Zertifizierungsmoment hätte einen unmissverständlichen
  Referenzpunkt geliefert, gegen den jede nachfolgende Zählung
  abgeglichen werden konnte.
- **Florida 2000 (Bush v. Gore-Auszählung).** Die zertifizierten
  Gesamtsummen pro Bezirk verschoben sich unter Neuauszählungsdruck;
  ein Vor-Neuauszählungs-Siegel pro Bezirk hätte bewahrt, was jeder
  Bezirk zertifiziert hatte, bevor manuelle Neuauszählungsverfahren
  begannen.
- **Verschiedene ausländische Wahlen mit dokumentierten
  Nach-Zertifizierungs-„Korrekturen".** Jurisdiktionsneutral.

Das Kit hätte NICHT die zugrunde liegenden Streitigkeiten über die
Maschinenintegrität von 2020, die Streitigkeiten über die
Briefwahl-Politik oder eine Wahl gelöst, deren Kernfrage eine umstrittene
Tatsache und nicht ein umstrittener Datensatz war.

## Wann dieses Kit zu verwenden ist

- Ihre Jurisdiktion verfügt über einen stabilen, geprüften
  Zertifizierungsprozess und möchte einen unveränderlichen öffentlichen
  Anker hinzufügen.
- Sie erwarten eine Prüfung nach der Zertifizierung und möchten einen
  manipulationserkennenden Referenzpunkt.
- Sie haben die rechtliche Befugnis, das aufgeführte Faktenset zu
  veröffentlichen, ohne PII offenzulegen.
- Sie haben einen parallelen Prüf- oder RLA-Prozess, sodass das Siegel
  mit der Ausgabe der Wahrheitsfindung verglichen werden kann.

## Wann dieses Kit NICHT zu verwenden ist

- **Nicht als Ersatz für risikolimitierende Audits, manuelle
  Neuauszählungen oder Nachwahl-Prüfungen verwenden.** Dieses Kit ist
  *additiv*, nicht ersetzend.
- **Nicht verwenden, wenn der zertifizierende Amtsträger nicht der
  tatsächliche Entscheidungsträger ist** (erzeugt falsche Zuschreibung).
- **Nicht während der Tabulation verwenden.** Das Kit ist speziell für
  den Zertifizierungsmoment gedacht. Teilauszählungssiegel schaffen
  irreführende Referenzpunkte.
- **Nicht verwenden, um zu behaupten, die Wahl sei fair, korrekt oder
  legitim gewesen** — das kann es nicht leisten.
- **Nicht unter Druck verwenden, früher als zum Zertifizierungsmoment zu
  versiegeln oder eine Begleitfakt-Offenlegung wegzulassen.** Verweigern
  Sie, und versiegeln Sie die Verweigerung.
- **Nicht als Legitimitätstheater verwenden.** Ein Siegel einer
  betrügerischen Auszählung ist ein dauerhafter öffentlicher Datensatz
  des Betrugs, keine Verteidigung dagegen. Die Primitive schneidet in
  beide Richtungen; das ist ihre Ehrlichkeit.

## Wie man dieses Kit für eine reale Zertifizierung forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # fiktiven Inhalt durch realen ersetzen
bash build/seal.sh     # ZUM oder nach dem Zeitpunkt der offiziellen Zertifizierungsunterschrift versiegeln
python3 build/verify.py
```

**Kritisches Timing:** Versiegeln Sie ZUM Zertifizierungsmoment, NICHT
davor. Ein Siegel vor der offiziellen Zertifizierung erzeugt einen
Falsch-Positiv-Datensatz „dies ist das offizielle Ergebnis". Ein Siegel
danach ist konventionelle Nicht-Abstreitbarkeit.

## Integration in bestehende Wahlinfrastruktur

- **State Boards of Elections / EAC-Zertifizierung.** Das Kit
  veröffentlicht neben dem offiziellen Zertifizierungsdokument. Es
  ersetzt nicht die gesetzliche Zertifizierung.
- **Risikolimitierende Audits.** Der CVR-Hash in FAKT 05 ist derselbe
  Hash, den das RLA-Werkzeug verarbeitet. Das Siegel bindet die
  geprüfte CVR an die zertifizierte Gesamtsumme.
- **Neuauszählungsverfahren.** Eine nach Landesrecht ausgelöste
  Neuauszählung erzeugt ein NEUES versiegeltes Faktenset (anderer
  Zeitstempel, andere Hashes, dieselbe Jurisdiktion). Beide Siegel
  koexistieren; keines überschreibt das andere. Die Differenz zwischen
  den Siegeln ist der öffentliche Datensatz dessen, was die
  Neuauszählung verändert hat.
- **Election Markup Language (EML) und Common Data Format (CDF).** Fakt-
  Inhalte sollten aus den bestehenden EML/CDF-Ausgaben der Jurisdiktion
  ableitbar sein, um das Kit datenformatneutral zu halten.
- **Überparteiliche Unterzeichnung durch den Wahlausschuss.** Für
  Jurisdiktionen mit überparteilich ausgewogenen Wahlausschüssen wird
  eine Multi-Signatur-Variante empfohlen.

## Was dieses Kit NICHT ersetzt

- Gesetzliche Zertifizierung nach Landeswahlgesetz
- EAC-Wahlsystem-Zertifizierung
- Risikolimitierende Audits / manuelle Neuauszählungen
- Neuauszählungsverfahren und Nachwahl-Prüfungen
- Gerichtsbeschlüsse oder Wahlanfechtungsverfahren

## Warum dieses Kit in v0.3.0+ existiert

Dies ist das 6. ausgearbeitete Beispiel, das mit myriam-kit ausgeliefert
wird. Das Kit wurde mittels eines Karpathy-artigen Autoresearch-Prozesses
erzeugt, dokumentiert in `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`.
Drei Prompt-Varianten (Imitation / First-Principles / Constraint-First)
erzeugten parallele Kit-Entwürfe; die Constraint-First-Variante erzielte
in einer gewichteten Bewertungsmatrix die höchste Punktzahl, und das
finale Kit synthetisiert ihre Struktur mit der Kohäsion der
Imitations-Variante und dem operativen Detailgrad der
First-Principles-Variante.

Die Autoresearch selbst ist als Prompt-Muster in
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` für zukünftige Verwendung
dokumentiert.

## Lizenz

Gemeinfrei (CC0). Forken Sie es. Keine Namensnennung erforderlich.
