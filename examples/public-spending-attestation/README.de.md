*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Kit zur Versiegelung von Attestierungen öffentlicher Ausgaben

Ein schlüsselfertiges myriam-kit-Beispiel für kommunale,
bundesstaatliche, provinzielle und nationale Regierungen, die
Aufzeichnungen zur Haushaltsausführung (Auftragsvergaben,
Auszahlungen, Abnahmen von Leistungen) im Moment der Ausgabe
kryptografisch verankern möchten, sodass die stille rückwirkende
Änderung von Aufzeichnungen über öffentliche Ausgaben öffentlich
erkennbar wird.

Die Versiegelung ist ein **forensischer Anker**, keine
Integritätszertifizierung. Sie hält fest, was die Finanzbehörde am Tag
ihrer Mitteilung mitgeteilt hat, in einer Form, die später nicht
still revidiert werden kann, ohne eine öffentlich sichtbare
kryptografische Diskrepanz zu erzeugen.

---

## Was dieses Kit NICHT leistet (zuerst lesen)

Die Versiegelung ist ein kryptografischer Zeitstempel dessen, was
attestiert wurde. Sie kann nicht überprüfen, ob das Attestierte
**rechtmäßig, fair oder ehrlich** war. Die folgenden Versagensmodi
liegen **außerhalb der Domäne der Versiegelung**:

1. **Korruption und Schmiergelder stromaufwärts.** Wenn eine
   Beschaffung manipuliert wurde, ein Anbieter aufgrund von Bestechung
   ausgewählt wurde, eine Begründung für eine Einzelvergabe fabriziert
   wurde oder ein Auftrag um einen abgesprochenen Schmiergeldanteil
   aufgebläht wurde — die Versiegelung verankert die wie-aufgezeichnete
   Transaktion mit dem aufgeblähten Preis und dem bevorzugten Anbieter
   in hoher Integrität. Die Versiegelung beobachtet die Ausgabe des
   Finanzsystems; sie hat keinerlei Einsicht in die Korruption
   stromaufwärts der Ausgabe. Brasiliens *Operação Lava Jato*
   dokumentierte systematische, kartelladministrierte Schmiergelder
   von ca. 3 % über Tausende von Petrobras-Aufträgen, die bei
   Ausgabe als ob völlig routinemäßig versiegelt worden wären.

2. **Verschleierung der wirtschaftlich Berechtigten durch
   Briefkastenfirmen.** Ein Auftrag an "Acme Construction Ltd." wird
   mit dem im öffentlichen Register eingetragenen Entitätsnamen
   versiegelt. Wird "Acme" tatsächlich von einer nicht offengelegten
   politisch exponierten Person kontrolliert oder ist eine von
   Dutzenden Briefkastenfirmen unter Kontrolle eines einzigen
   Kartells, verankert die Versiegelung die Oberflächenentität.
   Transparenz wirtschaftlich Berechtigter ist ein SEPARATES Regime
   (FATF-Empfehlung 24, EU 5AMLD/6AMLD, US Corporate Transparency
   Act), dessen Output ein eigenes Versiegelungsprotokoll erfordert.

3. **Buchhaltungsbetrug stromaufwärts der Ausgabe.** Wenn die
   Finanzbehörde selbst den Datensatz vor der Versiegelung
   fabriziert — Phantomaufträge, Geistermitarbeiter auf der
   Gehaltsliste, fiktive Leistungsabnahmen —, verankert die
   Versiegelung die Fabrikation. Die Versiegelung kann nicht
   erkennen, dass der Datensatz im Moment der Aufzeichnung falsch
   ist; sie kann lediglich erkennen, dass der Datensatz NACH
   Versiegelung geändert wurde.

4. **Selektive Veröffentlichung / Rosinenpickerei.** Eine
   Finanzbehörde könnte eine *Teilmenge* der Transaktionen — die
   sauberen — veröffentlichen und nur diese versiegeln. Die
   Versiegelung verankert, was in der Veröffentlichung ist; sie
   verankert nicht das Universum der Transaktionen, das in der
   Veröffentlichung hätte sein sollen. FAKT 07 dieses Kits
   (begleitende Offenlegungen und Verweigerungsregister) ist die
   strukturelle Verteidigung dagegen, hängt aber davon ab, dass die
   ausgebende Behörde ehrlich darüber ist, was sie nicht zu
   versiegeln wählt.

5. **Außerbudgetäre oder Off-Books-Ausgaben.** Öffentliche Ausgaben,
   die über staatseigene Unternehmen, Staatsfonds, Zweckgesellschaften
   oder außerbudgetäre Treuhandkonten geleitet werden, erscheinen
   möglicherweise nicht in dem Haushalt, den die Versiegelung
   verankert. Die Versiegelung hält fest, was innerhalb des
   Haushaltssystems gemeldet wurde; Ausgaben außerhalb des Systems
   liegen außerhalb der Domäne der Versiegelung. Die Streitigkeiten
   um die Coalition Provisional Authority (CPA) im Irak 2003–2004
   betrafen rund 9 Milliarden USD an Barauszahlungen, deren
   Aufzeichnungen teilweise verloren gingen; die Versiegelung der
   Aufzeichnungen, die im Moment der Auszahlung existierten, hätte
   diese verankert, aber keine Aufzeichnungen geschaffen, die die
   CPA nicht geführt hat.

6. **Druck zur nachträglichen "Erklärung".** Eine versiegelte
   Überschreitung, eine versiegelte Einzelvergabe oder ein
   versiegelter Nachtrag kann später mit beliebigem Framing
   neuerzählt werden, das die politische Macht wünscht. Die
   Versiegelung verankert die FAKTEN am Tag der Ausgabe, präjudiziert
   aber nicht das Narrativ, das diese Fakten später stützen werden.

7. **Erzwungene Attestierung.** Wenn der verantwortliche
   Finanzprinzipal gezwungen wird, eine Attestierung zu
   unterzeichnen, die Transaktionen falsch darstellt, verankert die
   Versiegelung die erzwungene Attestierung mit der erzwungenen
   Unterschrift. Die Versiegelung verifiziert WER unterzeichnet hat
   (FAKT 08), nicht WARUM unterzeichnet wurde. Die Versiegelung
   einer erzwungenen Attestierung erzeugt einen dauerhaften
   öffentlichen Datensatz des erzwungenen Outputs — nützlich für
   spätere Rechenschaft, aber keine Verteidigung gegen Zwang im
   Moment.

8. **Vergleich über Jurisdiktionen hinweg.** Eine versiegelte
   Ausgabe ist nur gegen das Rechtsregime ihrer ausgebenden
   Jurisdiktion lesbar. "Warum hat Gemeinde X den Betrag Y für
   Dienstleistung Z gezahlt, wenn Gemeinde W nur V gezahlt hat?" ist
   eine Frage der vergleichenden Analyse stromabwärts der
   Versiegelung. Das Benchmarking zwischen Jurisdiktionen ist eine
   analytische Aufgabe auf versiegelten Daten, keine Eigenschaft der
   Versiegelung.

**Der Abschnitt zu den ehrlichen Grenzen oben ist der tragende Teil
dieses Kits.** Finanzbeamte und Politiker, die glauben, dass
Versiegelung Integrität entspricht, werden dieses Kit als Schild
verwenden. Das Kit muss es deutlich sagen: Dies ist eine
*Nicht-Abstreitbarkeits-Primitive für den Moment der Ausgabe*, kein
Nachweis der Ausgabenintegrität.

---

## Was dieses Kit zu versiegeln VERWEIGERN MUSS

Das Kit ist so konfiguriert, dass es die folgenden Faktenmuster
ablehnt, selbst wenn ein Nutzer mit gültiger Unterschriftsberechtigung
sie einreicht:

- **Individuelle Namen von Bediensteten unterhalb der Ebene des
  signierenden Prinzipals.** Kein Fakt darf einzelne Mitarbeiter
  des Beschaffungswesens, einzelne Sachbearbeiter der Finanzkasse,
  einzelne Mitglieder einer Bewertungskommission oder eine
  natürliche Person, die keine öffentliche Rechenschaftsrolle
  innehat, namentlich nennen. Das Vergeltungsrisiko für ausführendes
  Personal überwiegt den Transparenznutzen; ihre Identitäten sind
  in internen Kontrollen (Hash des Freigabe-Protokolls in FAKT 05)
  versiegelt, nicht im Körper der Attestierung.

- **Personenbezogene Daten von Lieferanten.** Kein Fakt darf
  Bankkontonummern von Lieferanten, Namen einzelner
  Lieferantenmitarbeiter, Privatanschriften von Lieferanten,
  Steuernummern natürlicher Personen bei Lieferanten, interne
  Preisaufschlüsselungen, die die Kostenstruktur des Lieferanten
  enthalten, oder andere kommerziell-personenbezogene Felder
  enthalten, deren Veröffentlichung den Interessen des Lieferanten
  schaden würde, ohne der Korruptionsbekämpfung zu dienen. Solche
  Informationen können GEHASHT (FAKT 05), aber nicht veröffentlicht
  werden.

- **Sicherheits-eingestufte Ausgaben.** Ausgaben, die nach Regeln
  der nationalen Sicherheit als Verschlusssache eingestuft sind,
  sind unter diesem Kit NICHT versiegelungsfähig. Die Behandlung
  von Verschlusssachen ist ein anderes Problem mit anderen
  kryptografischen und rechtlichen Anforderungen. Der Ausschluss
  selbst wird in FAKT 07 R3 offengelegt, damit der Leser weiß, dass
  die Veröffentlichung gestalterisch unvollständig ist.

- **Zivile Durchsetzung von Steuerverpflichtungen gegen
  identifizierte natürliche Personen.** Auch wenn
  Durchsetzungskosten öffentliche Ausgaben sind, wird die
  Nennung einzelner Steuerpflichtiger unter Durchsetzung
  verweigert: Der Schaden für die Privatsphäre überwiegt den
  Transparenznutzen, und parallele Transparenz existiert in der
  finanzgerichtlichen Berichterstattung.

- **Transaktionen vor der Ausgabe.** Kein Auftrag vor formaler
  Vergabe; keine Auszahlung vor formaler Ausgabe. Die Versiegelung
  eines Vertragsentwurfs oder einer ausstehenden Zahlung, als wäre
  sie ausgeführt, erzeugt falsche Gewissheit.

- **Versiegelung durch jemand anderen als den verantwortlichen
  Finanzprinzipal.** Ein Auftragnehmer, Lieferant, Ratsmitglied,
  Journalist oder Beobachter kann "den öffentlichen Ausgabendatensatz"
  nicht anstelle der ihn ausgebenden Finanzbehörde versiegeln. (Sie
  können ihre eigenen Beobachtungen unter ihrem eigenen Prinzipal in
  einer separaten Veröffentlichung versiegeln.)

- **Formulierungen "frei von Korruption".** Das Kit verweigert die
  Versiegelung jeder Formulierung der Form "diese Ausgabe war
  rechtmäßig und frei von Korruption" oder "die Beschaffung war
  nachweislich fair". Solche Aussagen liegen epistemisch außerhalb
  der Domäne des Kits.

- **Veröffentlichungen, die begleitende Offenlegungen in FAKT 07
  auslassen.** Eine Veröffentlichung von Transaktionen ohne den
  begleitenden Offenlegungs- und Verweigerungsdatensatz ist nach
  diesem Kit keine legitime MYRIAM-Veröffentlichung.

Eine Verweigerung selbst kann als Fakt versiegelt werden ("Diese
Partei verlangte die Versiegelung von X; das Kit verweigerte gemäß
Verweigerungsregel Y") und schafft so einen öffentlichen Datensatz
versuchten Missbrauchs. In einem Bereich, in dem politischer Druck
auf Finanzbeamte dokumentiert ist, ist ein Datensatz *abgelehnter*
Anfragen selbst ein Integritätssignal.

---

## Was dieses Kit SEHR WOHL versiegelt

8 Fakten im Moment der Attestierung der Haushaltsausführung:

1. **Beispielhinweis** — erklärt die Veröffentlichung zu einem
   Beispiel (echte Attestierungen entfernen oder ersetzen diesen
   Hinweis).
2. **Jurisdiktion und Rechtsgrundlage** — welche Regierungseinheit
   ausgibt, unter welcher gesetzlichen Autorität, in welcher
   Haushaltsperiode.
3. **Verweis auf Mittelzuweisung oder Haushaltslinie** — die
   spezifischen Linien im verabschiedeten Haushalt, die ausgeführt
   werden, mit Hashes des Haushaltsinstruments und etwaiger
   angewandter Änderungen / Übertragungen / Umwidmungen.
4. **Manifest von Aufträgen oder Auszahlungen** — Pro-Transaktion-
   Datensatz: Betrag, Name der juristischen Person des Lieferanten
   (keine individuellen personenbezogenen Daten), Zweck, Datum,
   Beschaffungsart, Vergabegrundlage, Hash des Vertragsdokuments.
5. **Hashes von Belegdokumenten** — SHA-256 von Ausschreibungen,
   Bewertungen, ausgeführten Verträgen, Nachträgen, Zahlungsanträgen,
   Abnahmeformularen für Leistungen, Buchungseinträgen der
   Finanzkasse, Kontroll-Freigabe-Protokollen. Nur Hashes, keine
   Inhalte — um kommerzielle und persönliche personenbezogene Daten
   zu schützen und gleichzeitig eine Re-Hash-Verifizierung zu
   ermöglichen.
6. **Audit- und Aufsichtszustand** — welche
   Generalinspektorats-Stelle zuständig ist, welche oberste
   Rechnungskontrollbehörde, welche staatsanwaltliche Stelle für
   Korruptionsdelikte zuständig ist, Audit-Fristen, aktueller Stand
   etwaiger laufender Prüfung.
7. **Begleitende Offenlegungen und Verweigerungsregister** —
   anhängige Vergaberügen, anhängige interne Untersuchungen,
   offene Informationsfreiheitsanfragen, abweichende Prüfungen,
   bekannte Überschreitungen von Haushaltslinien; explizite Liste
   der Muster, die das Kit zu versiegeln verweigert hat.
8. **Signierender Prinzipal** — verantwortlicher Finanzbeamter +
   Rolle + gesetzliche Verantwortlichkeit + Mitunterzeichner unter
   dualer Kontrolle; was jeder Unterzeichner persönlich attestiert
   und was nicht.

Jeder Fakt endet mit der Konvention des Verweigerungstors: *"Dieser
Fakt behauptet nur X. Er behauptet nicht Y"* (wobei Y der
nächstgelegene Versagensmodus aus dem Abschnitt "leistet NICHT" ist).

---

## Wogegen dieses Kit verteidigt

- **Stille Revision von Vertragsbeträgen nach Ausgabe.** Jede
  Änderung eines Betrags in FAKT 04 erzeugt einen anderen SHA-256,
  eine andere Merkle-Wurzel und scheitert an der OTS-Verifizierung.
- **Stille Lieferantensubstitution.** Das Ersetzen von "Lieferant A"
  durch "Lieferant B" in einem bereits ausgegebenen Vertrag ist
  anhand der versiegelten Bytes erkennbar.
- **Rückdatierung von Nachträgen.** FAKT 04 friert das Datum und die
  Begründung des Nachtrags zur Ausgabe ein; jede spätere Behauptung
  "dies war stets der vereinbarte Leistungsumfang" muss sich mit
  dem versiegelten Nachtragsdatensatz auseinandersetzen.
- **Stilles Verschwinden ungünstiger Transaktionen.** Alle in der
  Periode ausgegebenen Transaktionen befinden sich in FAKT 04
  unter einer Merkle-Wurzel. Die Veröffentlichung einer Teilmenge
  ist anhand der Blatt-Hash-Liste erkennbar.
- **Unterdrückung begleitender Offenlegungen.** FAKT 07 friert den
  Stand anhängiger Rügen, anhängiger Untersuchungen und offener
  Informationsfreiheitsanfragen zum Moment der Attestierung ein.
  Jede spätere Behauptung "wir haben nie von dieser Rüge gehört"
  ist öffentlich diffbar.
- **Drift der Audit-Zuständigkeit.** FAKT 06 friert ein, welche
  Stellen Aufsichtszuständigkeit über die versiegelten Transaktionen
  haben. Eine spätere Behauptung, ein bestimmter Generalinspekteur
  "habe keine Befugnis gehabt", muss sich mit dem versiegelten
  Zuständigkeitsdatensatz auseinandersetzen.
- **Löschung des Verweigerungsregisters.** FAKT 07 hält fest, was
  das Kit zu versiegeln verweigert hat; jede spätere Behauptung
  "wir haben nie etwas verweigert" widerspricht dem versiegelten
  Datensatz.

---

## Historische Fälle, bei denen das Kit geholfen hätte

Das Kit hätte einen nützlichen **forensischen Anker** geliefert —
*keine Korrektur, keine Prävention, kein Ersatz für strafrechtliche
Verfolgung* — in öffentlich dokumentierten Fällen, die stille
rückwirkende Modifikationen von Aufzeichnungen über öffentliche
Ausgaben betreffen:

- **Brasilien — *Operação Lava Jato* / Petrobras-Linie (2014–2021).**
  Brasilianische Bundesstaatsanwälte dokumentierten ein Kartell
  großer Bauunternehmen, das über mehr als ein Jahrzehnt
  Schmiergelder von durchschnittlich ca. 3 % auf Aufträge von
  Petrobras und anderen föderalen Infrastrukturaufträgen zahlte,
  wobei das Schmiergeld an Politiker und an die eigene
  Preiskoordinierung des Kartells geleitet wurde. Die Aufträge wie
  ausgegeben erschienen routinemäßig; die Korruption war
  stromaufwärts der Ausgabe. Ein Versiegelungs-Kit hätte Lava Jato
  NICHT verhindert (die Schmiergelder waren VOR Erreichen der
  Versiegelung in den Preis eingebettet), hätte aber die
  Vertragsbedingungen bei Ausgabe verankert — und damit die
  spätere forensische Rekonstruktion von "was jeder Vertrag bei
  Unterzeichnung tatsächlich sagte" enorm günstiger gemacht. Die
  Ermittlungskosten von Lava Jato waren zu einem großen Teil die
  Kosten, Zeitleisten aus widersprüchlichen archivierten
  Aufzeichnungen wieder zusammenzusetzen.

- **Europäische Union — Streitigkeiten um Regionalentwicklungsfonds
  (mehrere Mitgliedstaaten, 2010er–2020er Jahre).** Die
  Jahresberichte des Europäischen Rechnungshofs haben wiederholt
  wesentliche Fehlerraten in Ausgaben der Europäischen Struktur-
  und Investitionsfonds (ESIF) und des Kohäsionsfonds
  identifiziert, in einigen Jahren oberhalb der Wesentlichkeitsschwelle.
  Streitigkeiten über "was tatsächlich beantragt wurde" gegenüber
  "was tatsächlich erbracht wurde" treten wiederkehrend auf, weil
  Antragsdokumentation zwischen Einreichung und Audit revidiert
  werden kann. Eine MYRIAM-Versiegelung des Antrags-wie-eingereicht
  bei jeder Ausgabe hätte den Inhalt jedes Antrags zum Zeitpunkt
  der Einreichung verankert und "was der Begünstigte damals
  beantragte" von "was die Rekonstruktion nach dem Audit ergab"
  getrennt.

- **Irak — Auszahlungen der Coalition Provisional Authority (CPA),
  2003–2004.** Die CPA zahlte rund 9 Milliarden USD aus dem
  Development Fund for Iraq in bar aus, mit einer Dokumentation,
  die der Special Inspector General for Iraq Reconstruction
  (SIGIR) und spätere Auditberichte als wesentlich unvollständig
  charakterisierten. Streitigkeiten um Auszahlungsaufzeichnungen
  bestehen zwei Jahrzehnte später fort. Eine Versiegelung im
  Moment der Auszahlung hätte keine Aufzeichnungen geschaffen, die
  die CPA nicht geführt hat — aber wo eine Aufzeichnung existierte
  (handschriftliche Kassenbücher, datierte
  Überweisungsgenehmigungen), hätte eine zeitgenössische
  Versiegelung den byteweisen Zustand dieser Aufzeichnung zum
  Zeitpunkt der Ausgabe verankert und "die Aufzeichnung damals"
  von "der Aufzeichnung wie später rekonstruiert" getrennt.

- **Griechenland — Revisionen zu Staatsschulden und Berichterstattung
  über öffentliche Ausgaben (2009–2010).** Eurostat-Audits in
  2009–2010 dokumentierten substanzielle Revisionen zuvor gemeldeter
  griechischer Haushaltsdaten, wobei die Methodik der Revision
  selbst umstritten war. Eine Versiegelung der vierteljährlichen
  Ausgabenberichte im Moment der ursprünglichen Veröffentlichung
  hätte das *Delta* zwischen ursprünglichen und revidierten
  Berichten öffentlich diffbar gemacht, anstatt es nur durch
  Archivvergleich rekonstruierbar zu lassen. Die Versiegelung hätte
  den zugrunde liegenden methodischen Streit nicht verhindert,
  hätte aber jedes berichtete Quartal zum Moment des
  ursprünglichen Berichts verankert.

- **Vereinigtes Königreich — Pandemiebeschaffung (2020–2022).**
  Berichte des UK National Audit Office und parlamentarischer
  Ausschüsse identifizierten Beschaffungsprozesse während
  2020–2021, in denen Aufträge unter Notbestimmungen mit
  reduziertem Wettbewerb und reduzierter Dokumentation vergeben
  wurden; einige Vergaben wurden später geändert, storniert oder
  verglichen. Eine Versiegelung pro Ausgabe jedes Notvergabe-Auftrags
  hätte die Vergabe-Begründung und die Bedingungen zum Moment der
  Vergabe verankert und spätere Änderungen zu einem öffentlich
  sichtbaren Delta gemacht, anstatt zu einem still modifizierten
  Datensatz.

- **Südafrika — Aufträge an Staatsunternehmen aus der Ära der
  State Capture (~2010–2018).** Die Zondo-Kommission dokumentierte
  Aufträge an mehreren Staatsunternehmen (Eskom, Transnet, Denel),
  deren Dokumentation in unterschiedlichem Maße unvollständig,
  revidiert oder umstritten war. Die Versiegelung jeder
  Auftragsvergabe bei Ausgabe hätte den Wie-vergeben-Zustand des
  Datensatzes verankert und spätere forensische
  Rekonstruktionsergebnisse von der zeitgenössischen Aufzeichnung
  getrennt.

Das Kit hätte die zugrunde liegende Korruption in keinem der oben
genannten Fälle verhindert. In mehreren Fällen war das zugrunde
liegende Problem, dass die Korruption *stromaufwärts der Ausgabe*
lag — die Versiegelung verankert den korrupten Vertrag in hoher
Integrität, was eine andere Art von Nutzen ist (forensischer Anker
für spätere Rechenschaft), aber nicht dasselbe wie Prävention. In
anderen Fällen (CPA-Bargeld, außerbudgetäre Ausgaben) bestand das
zugrunde liegende Problem darin, dass die zu versiegelnden
Aufzeichnungen nicht existierten oder nicht geführt wurden — das Kit
kann keine Aufzeichnungen schaffen, die die Behörde nicht erstellt
hat.

Diese historischen Fälle werden nur mit Verweis auf öffentlich
dokumentierte Feststellungen genannt (Gerichtsakten, Berichte
parlamentarischer Ausschüsse, Veröffentlichungen von
Rechnungshöfen). Es wird keine Aussage über eine einzelne Person
getroffen; die dokumentierten institutionellen Feststellungen
stehen für sich auf dem öffentlichen Register.

---

## Wann dieses Kit einzusetzen ist

- Ihre Jurisdiktion verfügt über einen etablierten Prozess zur
  Berichterstattung über die Haushaltsausführung und möchte einen
  unveränderlichen öffentlichen Anker hinzufügen.
- Sie erwarten eine Prüfung nach Ausgabe (Anfragen nach dem
  Informationsfreiheitsgesetz, Audit, zivilgesellschaftliches
  Monitoring, journalistische Recherche) und möchten einen
  manipulationssicheren Bezugspunkt.
- Sie verfügen unter Transparenz- / Akteneinsichtsrecht über die
  rechtliche Befugnis, die aufgelistete Faktenmenge zu
  veröffentlichen, unter Wahrung der Datenschutz-/
  Sicherheitsausschlüsse.
- Sie arbeiten unter einem gesetzlichen Audit-Regime
  (Generalinspekteur, oberste Rechnungskontrollbehörde) und
  möchten jeden Quartalsabschluss verankern, bevor der Audit-Zyklus
  ihn erreicht.
- Sie veröffentlichen nach dem Open Contracting Data Standard oder
  IATI und möchten eine kryptografische Ergänzung zur
  portalbasierten Veröffentlichung.

## Wann dieses Kit NICHT einzusetzen ist

- **Nicht als Ersatz für gesetzliche Audits, Prüfung durch
  Generalinspekteure, staatsanwaltliche Ermittlung oder
  zivilgesellschaftliches Monitoring verwenden.** Das Kit ist
  *additiv*, kein Ersatz.
- **Nicht als Legitimitätszertifikat verwenden.** Ein versiegelter
  Ausgabendatensatz ist kein Zertifikat der Korruptionsfreiheit.
  Ihn als solches zu behandeln, ist genau der Versagensmodus, den
  die zuerst-die-Beschränkungen-Struktur des Kits verhindern soll.
- **Nicht mitten in der Periode verwenden.** Das Kit ist für den
  Moment der formalen Ausgabe gedacht (Quartalsabschluss,
  Auftragsvergabe, Meilenstein-Auszahlung). Mid-Period-Versiegelungen
  erzeugen irreführende Bezugspunkte.
- **Nicht verwenden, um zu behaupten, die Ausgabe sei rechtmäßig,
  fair oder korruptionsfrei** — das Kit kann das nicht.
- **Nicht verwenden, um eingestufte Ausgaben, individuelle
  personenbezogene Daten von Bediensteten oder kommerzielle
  personenbezogene Daten von Lieferanten zu versiegeln.** Das Kit
  verweigert diese Muster; ein Versuch erzeugt einen
  Verweigerungsdatensatz (FAKT 07).
- **Nicht verwenden, um Entwürfe vor der Ausgabe zu versiegeln.**
  Entwürfe können unter einem anderen Attestierungstyp ("Entwurf
  zur Stellungnahme, nicht ausgegeben") versiegelt werden, aber
  nicht unter dem Ausgabe-Typ dieses Kits.
- **Nicht unter Druck einsetzen, Offenlegungen in FAKT 07
  auszulassen.** Verweigern Sie und versiegeln Sie die
  Verweigerung.
- **Nicht verwenden, wenn Ihre Finanzbehörde vereinnahmt ist.** Eine
  versiegelte betrügerische Ausgabe ist ein dauerhafter
  öffentlicher Datensatz des Betrugs, keine Verteidigung
  desselben. Die Primitive schneidet in beide Richtungen; das ist
  ihre Ehrlichkeit.

---

## Wie man dieses Kit für eine reale Attestierung forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # replace fictional content with real
bash build/seal.sh         # seal at the moment of formal issuance
python3 build/verify.py    # confirm
```

**Kritisches Timing:** Versiegeln Sie IM Moment der formalen
Ausgabe — d. h. dem Moment, in dem der verantwortliche
Finanzprinzipal den Quartalsabschluss unterzeichnet, dem Moment, in
dem ein Auftrag formal vergeben wird, oder dem Moment, in dem eine
Auszahlung formal ausgegeben wird. Eine Versiegelung vor der
formalen Ausgabe erzeugt einen falsch-positiven "dies ist die
offizielle Aufzeichnung"-Bezugspunkt. Eine Versiegelung lange nach
der formalen Ausgabe ist forensisch schwächer gegen zwischenzeitliche
Änderungen.

**Kadenz:** Das Kit ist standardmäßig für vierteljährliche
Attestierungen ausgelegt. Subquartale Kadenzen (monatlicher
Abschluss, Versiegelung pro Transaktion) werden durch erneutes
Ausführen mit entsprechendem Umfang unterstützt; die Versiegelung
einer einzelnen hochbewerteten Transaktion ist ein legitimer
Anwendungsfall.

---

## Integration mit bestehender Infrastruktur des öffentlichen Finanzwesens

Das Kit ist dafür konzipiert, sich zusammenzufügen mit, nicht zu
ersetzen:

- **Open Contracting Data Standard (OCDS) v1.1.5.** Die fünf
  Veröffentlichungspunkte (Planung, Ausschreibung, Vergabe,
  Vertrag, Umsetzung) lassen sich natürlich abbilden auf FAKT 03
  (Planung → Mittelzuweisung), FAKT 04 (Ausschreibung, Vergabe,
  Vertrag, Umsetzung → Transaktionsmanifest) und FAKT 05 (Hashes
  von Belegdokumenten). Der OCDS-JSON-Export selbst wird in FAKT 05
  (Kontrolldokumente) versiegelt. Eine Jurisdiktion, die
  OCDS-Veröffentlichung betreibt, kann MYRIAM-Versiegelung als
  kryptografische Schicht oberhalb ihres bestehenden Portals
  hinzufügen.

- **International Aid Transparency Initiative (IATI) Standard
  v2.03.** Für Ausgaben, die vollständig oder teilweise durch
  externe Hilfe finanziert werden, kann IATI-XML als
  Kontrolldokument versiegelt werden; die Versiegelung liefert
  eine kryptografische Ergänzung zum HTTP-basierten
  Veröffentlichungsmodell des IATI Registry.

- **Verpflichtungen der Open Government Partnership (OGP).** Die
  nationalen Aktionspläne der OGP enthalten häufig
  Fiskaltransparenzverpflichtungen; MYRIAM-Versiegelung
  operationalisiert eine "manipulationssichere"-Veröffentlichungsverpflichtung
  auf eine Weise, die von der Zivilgesellschaft unabhängig
  verifizierbar ist, ohne Vertrauen in das Regierungsportal zu
  erfordern.

- **OECD-Empfehlung zur öffentlichen Integrität (2017).** Das Kit
  unterstützt Empfehlung 4 (offene Regierungsdaten zu öffentlichen
  Finanzen in maschinenlesbarer, zeitnaher Form), indem es die
  Daten kryptografisch ebenso verankert wie maschinenlesbar macht.

- **UN-Konvention gegen Korruption (UNCAC), insbesondere die Artikel
  9 (Beschaffung) und 13 (Beteiligung der Gesellschaft).** Das Kit
  liefert eine forensische Primitive, die die
  Transparenzverpflichtungen des Artikels 9 und die
  zivilgesellschaftliche Aufsicht nach Artikel 13 unterstützt.

- **Oberste Rechnungskontrollbehörden (SAIs) — INTOSAI-Rahmenwerk.**
  SAIs, die nach INTOSAI-Standards (ISSAI) arbeiten, können
  versiegelte Veröffentlichungen als Beweismittel mit hoher
  Integrität konsumieren; die SHA-256-Hashes in FAKT 05 sind
  dieselben Hashes, die die E-Audit-Werkzeuge der SAI
  nachberechnen können.

- **Generalinspektorats-Büros.** Inländische
  Generalinspektorats-Büros mit Zuständigkeit für die versiegelten
  Ausgaben (FAKT 06) können die Dokumentenkörper, deren Hashes in
  FAKT 05 versiegelt sind, im Wege der Vorladung anfordern; die
  Versiegelung bindet die per Vorladung erhaltenen Dokumentenkörper
  an die Körper, die zum Zeitpunkt der Ausgabe existierten.

- **Informationsfreiheits- und Akteneinsichtsgesetze.** Die
  Versiegelung befreit die ausgebende Behörde nicht von fortlaufenden
  Verpflichtungen nach dem Informationsfreiheitsrecht; sie macht
  vielmehr selektive Antworten als Abweichung vom versiegelten
  Datensatz erkennbar. FAKT 07 C3 verankert offene
  Informationsfreiheitsanfragen zur Attestierungszeit.

- **Transparenzregister wirtschaftlich Berechtigter
  (FATF-Empfehlung 24, EU-AML-Richtlinien, US Corporate
  Transparency Act).** Daten wirtschaftlich Berechtigter werden
  unter diesem Kit NICHT versiegelt (FAKT 04 bezieht die
  Lieferantenidentität ausschließlich aus dem registrierten
  Namen der juristischen Person). Eine Offenlegung wirtschaftlich
  Berechtigter ist ein separates Versiegelungsregime, das eine
  parallele Veröffentlichung erzeugen kann, die per Merkle-Wurzel
  referenziert wird.

- **Gerichtlich verwaltete Transparenz (justizielle
  Ausgabenberichterstattung, Verfahren zur Vermögensabschöpfung).**
  Outputs korruptionsbezogener Gerichtsverfahren liegen außerhalb
  des Anwendungsbereichs dieses Kits, können aber unter parallelen
  Attestierungstypen versiegelt werden.

## Was dieses Kit NICHT ersetzt

- Gesetzliche Audits der Haushaltsausführung durch
  Generalinspektorats-Stellen
- Prüfung durch die oberste Rechnungskontrollbehörde (GAO, NAO,
  Bundesrechnungshof, TCU, CAG, AGN, BRH, Cour des comptes,
  Äquivalent)
- Staatsanwaltliche Ermittlung von Korruptionsdelikten (nationale
  Antikorruptions-Staatsanwälte, Stellen nach Artikel 36 UNCAC)
- Investigative Berichterstattung durch Zivilgesellschaft und
  Journalismus
- Whistleblower-Kanäle und geschützte Offenlegungsregime
- Offenlegung wirtschaftlich Berechtigter
- Internationale Peer-Reviews (OECD, Fiscal Transparency
  Evaluation des IWF, EU-Semester, IATI Registry)
- Gerichtlich verwaltete Verfahren zur Vermögensabschöpfung

Die Versiegelung ist eine forensische Primitive, die die Kosten
senkt und die Zuverlässigkeit aller oben genannten Mechanismen
erhöht. Sie ist und kann kein Ersatz für irgendeinen davon sein.

---

## Lizenz

Public Domain (CC0). Forken Sie es. Keine Namensnennung
erforderlich.
