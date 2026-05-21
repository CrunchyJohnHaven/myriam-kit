*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Kit zur Versiegelung von Lieferketten-Auditattestierungen

Ein schlüsselfertiges myriam-kit-Beispiel für externe Sozial-, Arbeits-
und Umweltauditoren, hauseigene Lieferanten-Compliance-Teams,
NGO-Lieferketten-Ermittler und Arbeitnehmerrechtsorganisationen, die
eine Bitcoin-verankerte, manipulationssichere Versiegelung eines
Auditberichts genau im Moment der Freigabe veröffentlichen möchten.

---

## Was dieses Kit NICHT leistet (zuerst lesen)

Die Versiegelung ist ein kryptografischer Zeitstempel dessen, was der
Auditor freigegeben hat. Sie kann nicht überprüfen, ob das Freigegebene
**wahr** ist. Die folgenden Versagensmodi liegen **außerhalb der
Domäne der Versiegelung**:

1. **Vereinnahmung des Audits durch die Industrie.** Markenseitig
   beauftragte Audits haben eine lange, dokumentierte Geschichte
   weicher Befunde bei Lieferanten, deren fortgesetztes Geschäft mit
   der beauftragenden Marke die Audit-Pipeline am Laufen hält. Ein
   vereinnahmtes Audit erzeugt, wenn versiegelt, einen dauerhaften
   forensischen Datensatz des vereinnahmten Audits. Die Versiegelung
   korrigiert die Vereinnahmung nicht — sie macht lediglich das
   Audit-wie-ausgegeben unveränderlich, sodass ein späterer
   Wahrheitsfindungsprozess etwas Konkretes zum Vergleich hat.

2. **Trainierte Arbeitnehmer / vorbereitete Betriebe.** Angekündigte
   oder halb-angekündigte Audits geben dem Management Tage oder Wochen
   Zeit, Antworten der Arbeitnehmer einzuüben, minderjährige
   Arbeitnehmer zu verstecken, Schlafsäle zu säubern, nicht
   konforme Ausrüstung zu entfernen und Arbeit während des
   Auditfensters an nicht auditierte Subunternehmer umzuleiten. Die
   Versiegelung verankert das, was den Auditoren gezeigt wurde, nicht
   das, was ihnen vorenthalten wurde.

3. **Verstecktes Subcontracting.** Subcontracting auf Tier-2- und
   Tier-3-Ebene, Heimarbeit und Produktion im informellen Sektor sind
   für Audits auf Betriebsebene durchgängig unsichtbar. Die
   Versiegelung verankert ein Tier-1-Audit; sie kann nicht erkennen,
   dass Tier-1 während des Auditfensters oder routinemäßig an einen
   nicht auditierten Tier-2 auslagert.

4. **Audits, die den Missbrauch, den sie ins Visier nehmen,
   systematisch verfehlen.** Rana Plaza, der Einsturz einer
   Bekleidungsfabrik in Bangladesch 2013, der 1.134 Arbeitnehmer
   tötete, war in den Monaten zuvor von mehreren markenseitig
   beauftragten Auditprogrammen geprüft worden. Die Risse im Gebäude
   standen nicht auf der Sozialaudit-Checkliste; das Auditregime
   hatte keine baustatische Reichweite. Audits verankern, was *im
   Umfang liegt*; Missbräuche außerhalb des Umfangs bleiben
   unsichtbar, unabhängig davon, wie manipulationssicher die
   Versiegelung ist.

5. **Vergeltung nach Freigabe gegen Arbeitnehmer, die an Interviews
   teilgenommen haben.** Selbst bei verweigerten Ortsangaben
   (FAKT 07 R3) kann ein entschlossener Gegner, der die
   Lieferanten-ID kennt, den Betrieb identifizieren. Der Schutz
   der Arbeitnehmer erfordert mehr als nur das Verweigern
   personenbezogener Daten in der Versiegelung — er erfordert
   Anonymisierung stromaufwärts der Audit-Methodik. Die Versiegelung
   macht das Audit-wie-ausgegeben dauerhaft; sie schützt
   Interviewteilnehmer nicht rückwirkend.

6. **Arbeitsbedingungen, die legal, aber inhuman sind.** Lücken zum
   Existenzsichernden Lohn in Jurisdiktionen, in denen der gesetzliche
   Mindestlohn unter der Existenzsicherungs-Benchmark liegt, erzeugen
   im selben Audit "konforme" Befunde gegenüber Lohn- und
   Arbeitszeitgesetzen und "nicht konforme" Befunde gegenüber
   Standards für existenzsichernde Löhne (FAKT 03 Element 8 in diesem
   Beispiel-Kit). Die Versiegelung verankert das, was jeder Standard
   meldet; eine Versöhnung ist nachgelagerte politische Arbeit.

7. **Klima- / Umweltschäden mit diffuser Kausalität.**
   Kohlenstoffemissionen, Beiträge zur Entwaldung, Wasserentnahme und
   Schadstofffreisetzungen von Lieferanten können in Auditbefunden
   versiegelt werden, aber die kausale Zuordnung zum Bestellvolumen
   einer bestimmten Marke ist methodisch umstritten. Die Versiegelung
   verankert das, was beim Lieferanten gemessen wurde; sie weist
   keine moralische oder rechtliche Verantwortung zu.

8. **Streitigkeiten darüber, welcher Standard maßgeblich ist.** SA8000
   vs. BSCI vs. SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs.
   unternehmensspezifischer Verhaltenskodex: jeder hat
   unterschiedliche Geltungsbereiche, Schweregrade und
   Abhilfeprozesse. Die Versiegelung verankert *ein* Audit unter
   *einem* Standard. Der standardübergreifende Vergleich ist ein
   nachgelagertes Problem.

9. **Auditorenkompetenz vs. Auditorenakkreditierung.** "Akkreditiert"
   ist nicht "kompetent". Auditoren, die akkreditierte
   Schulungsprogramme abgeschlossen haben, haben in Audits, die
   öffentlich sichtbaren Katastrophen vorausgingen, schwere
   Missbräuche übersehen. Die Versiegelung verankert die
   Akkreditierungen; sie zertifiziert nicht die Kompetenz, mit der sie
   ausgeübt wurden.

**Der Abschnitt zu den ehrlichen Grenzen oben ist der tragende Teil
dieses Kits.** Eine Marke, die Legitimitätstheater wünscht, wird ein
versiegeltes Audit als Schild benutzen. Das Kit muss es deutlich
sagen: Dies ist eine *Nicht-Abstreitbarkeits-Primitive für den
Moment der Audit-Freigabe*, kein Nachweis der Lieferanten-Compliance
oder des Wohlergehens der Arbeitnehmer.

---

## Was dieses Kit zu versiegeln VERWEIGERN MUSS

Das Kit ist so konfiguriert, dass es die folgenden Faktenmuster
ablehnt, selbst wenn ein Nutzer mit gültiger Auditstellen-Autorität
sie einreicht:

- **Individuelle Identifizierung von Arbeitnehmern.** Kein Fakt darf
  einen Arbeitnehmer namentlich nennen, ein Zitat einem Arbeitnehmer
  zuordnen, eine Ausweisnummer, Linienposition, Schlafsaalzimmer, einen
  Schichtplan, eine demografische Kombination mit N<5 oder ein
  beliebiges Feld offenlegen, das eine Person, die an Interviews
  teilgenommen hat, re-identifizieren könnte. Arbeitnehmerzitate
  verwenden randomisierte Token; die Zuordnung wird niemals
  versiegelt.
- **Whistleblower- / Informantenquellen.** Wenn ein Befund auf der
  Offenlegung durch eine Person beruht, die für die Offenlegung ein
  Risiko eingegangen ist, wird diese Person in der versiegelten
  Veröffentlichung niemals namentlich genannt oder identifiziert.
- **Präzise Ortsangaben.** Keine Straßenadresse, GPS, Satellitenbild
  >1km Auflösung oder externe Gebäudeaufnahme. Land und Region sind
  die maximale versiegelte Auflösung. Begründung: Die Identifizierung
  des Betriebs ermöglicht Vergeltung gegen Interviewteilnehmer.
- **Anspruch auf Clean-Audit-Zertifizierung.** Das Kit verweigert die
  Versiegelung jeder Formulierung der Form "dieses Audit beweist,
  dass der Lieferant compliant ist" oder "es bestehen keine
  Verstöße". Sauberkeitsansprüche sind durch die Audit-Methodik
  epistemisch nicht gestützt.
- **Ersetzung der Versiegelung durch ein Zertifikat.** Eine
  Veröffentlichung, die Methodik (FAKT 04), Unabhängigkeit
  (FAKT 06) oder Verweigerungen (FAKT 07) auslässt, ist nach diesem
  Kit keine legitime MYRIAM-Veröffentlichung.
- **Entwurfsaudits / Audits vor Freigabe.** Die Versiegelung erfolgt
  bei Freigabe, nicht davor. Vorläufige Audits erzeugen falsche
  Gewissheit.
- **Nachträgliche günstige Neuversiegelung.** Ein überarbeitetes Audit
  erfordert eine NEUE versiegelte Veröffentlichung, die das Original
  per Merkle-Wurzel referenziert. Das ursprünglich versiegelte Audit
  bleibt als Audit-wie-ausgegeben dauerhaft sichtbar.
- **Versiegelung durch eine andere Partei als die Auditstelle.** Eine
  Marke, ein Lieferant, eine Zertifizierungsstelle oder ein Dritter
  kann "das Audit" nicht anstelle der Auditstelle versiegeln, die den
  Bericht freigegeben hat.

Eine Verweigerung selbst kann als Fakt versiegelt werden ("Diese
Partei verlangte die Versiegelung von X; das Kit verweigerte gemäß
Verweigerungsregel Y") und schafft so einen öffentlichen Datensatz
versuchten Missbrauchs. **In einer Branche mit weitverbreiteter
Audit-Vereinnahmung kann die Verweigerung-zu-versiegeln selbst ein
aussagekräftiges Signal sein:** Eine Auditstelle, die nicht
versiegelt, weil eine Marke auf die Abmilderung von Befunden gedrängt
hat, hat die Möglichkeit, die Verweigerung unter ihrem eigenen
Prinzipal öffentlich aktenkundig zu machen.

---

## Was dieses Kit SEHR WOHL versiegelt

8 Fakten im Moment der Audit-Freigabe:

1. **Beispielhinweis** — erklärt die Veröffentlichung zu einem
   Beispiel (echte Attestierungen entfernen oder ersetzen diesen
   Hinweis).
2. **Auditumfang und -gegenstand** — Auditstandard, Auditstelle,
   leitender Auditor, Größe des Auditteams, Lieferantenkennung
   (keine präzisen Ortsangaben), Auditfenster, Ankündigungsart
   (angekündigt / halb-angekündigt / unangekündigt),
   Auditberichtsdatum, Freigabeversion, namentlich genannte
   Empfänger-Marken, beauftragende Partei.
3. **Manifest der Auditbefunde** — pro Element: Konformität /
   geringfügige NC / wesentliche NC / kritische NC gegen den
   Standard, jeweils mit einem SHA-256 der vollständigen
   Befundausführung. Aggregatsummen. Zertifizierungsempfehlung bei
   Freigabe.
4. **Methodik und Beweismittel** — Vor-Ort-Zeitverteilung,
   Interviewzählungen (mit Stratifizierung: Geschlecht, Migrationsstatus,
   Betriebszugehörigkeit), Aufschlüsselung des Interviewformats,
   Dolmetscherbeziehung, Dokumentenprüfung mit Stichprobengrößen und
   Inhalts-Hashes, Vor-Ort-Artefakte (mit unkenntlich gemachten
   Gesichtern der Arbeitnehmer), bekannte Methodik-Beschränkungen.
5. **Zugesagte Korrekturmaßnahmen** — pro wesentlicher NC und pro
   geringfügiger NC ein CAP mit angegebener Ursache, Frist,
   Verifizierungsmechanismus, Eskalationsverpflichtungen und
   Verpflichtung gegen stille Lockerung.
6. **Qualifikationen und Unabhängigkeit des Auditors** —
   Akkreditierung der Auditstelle, Kundenkonzentration,
   Qualifikationen und Sprachkompetenz des leitenden Auditors,
   Branchenerfahrung, Unabhängigkeitserklärungen
   (Auditor-Lieferant, Auditor-Marke, Trennung von
   Zertifizierungsstelle).
7. **Begleitende Offenlegungen und Verweigerungsregister** —
   Interessenkonflikte (explizit), Vorgeschichte der Audits,
   kommunizierte Worker-Voice-Kanäle, parallele Ermittlungen,
   interner Dissens der Auditstelle, Liste der Verweigerungsregeln,
   in diesem Audit tatsächlich geltend gemachte Verweigerungen.
8. **Signierender Prinzipal** — Auditstelle, leitender Auditor,
   Auditteam, autorisierender Beamter, kryptografische
   Schlüsselinformation.

Jeder Fakt endet mit der Konvention des Verweigerungstors: *"Dieser
Fakt behauptet nur X. Er behauptet nicht Y"* (wobei Y der
nächstgelegene Versagensmodus aus dem Abschnitt "leistet NICHT" ist).

---

## Wogegen dieses Kit verteidigt

- **Stille Abmilderung wesentlicher Nichtkonformitäten nach
  Freigabe.** Jede Änderung an FAKT 03 (z. B. eine in MINOR_NC
  umklassifizierte MAJOR_NC oder ein vollständig gelöschter Befund)
  erzeugt einen anderen SHA-256, eine andere Merkle-Wurzel und
  scheitert an der OTS-Verifizierung.
- **Rückdatierung von Abschlüssen bei Korrekturmaßnahmen.**
  FAKT 05 friert den CAP und seine Fristen bei Freigabe ein; jede
  Behauptung "wir haben diese NC letzten Monat geschlossen", die
  mit den versiegelten Fristen kollidiert, ist öffentlich diffbar.
- **Methodik-Revisionismus.** FAKT 04 friert Interviewzählungen,
  Dokumenten-Stichprobengrößen und Vor-Ort-Stunden bei Freigabe
  ein — und verhindert damit, dass die spätere Verteidigung "wir
  haben eine tiefgehende Untersuchung durchgeführt" unwiderlegbar
  bleibt.
- **Selektive Neuveröffentlichung, die ungünstige Befunde
  auslässt.** Alle 8 Fakten sind durch eine einzige Merkle-Wurzel
  gebunden; das Zitieren einiger Fakten unter Auslassung anderer
  ist anhand der veröffentlichten Blattliste erkennbar.
- **Drift bei Unabhängigkeitsansprüchen.** FAKT 06 friert die
  Unabhängigkeitserklärungen zum Zeitpunkt der Freigabe ein. Ein
  späterer Anspruch "dieses Audit war rigoros unabhängig" muss sich
  mit dem versiegelten Prozentsatz der Kundenkonzentration und der
  versiegelten Offenlegung der markenfinanzierten Beauftragung
  auseinandersetzen.
- **Löschung des Verweigerungsregisters.** FAKT 07 friert ein,
  welche Faktenmuster das Kit verweigert hat; jeder spätere
  Anspruch "wir haben nie etwas verweigert" widerspricht dem
  versiegelten Datensatz.

---

## Historische oder fast historische Fälle, bei denen das Kit geholfen hätte

Das Kit hätte einen nützlichen **forensischen Anker** geliefert —
*keine Korrektur und keine Prävention* — in Fällen, die Folgendes
betreffen:

- **Rana Plaza (Bangladesch, 2013).** Der Gebäudeeinsturz von Rana
  Plaza tötete 1.134 Bekleidungsarbeiter und verletzte ~2.500.
  Mehrere Marken, deren Produkte im Gebäude hergestellt wurden,
  hatten kurz vor dem Einsturz Tier-1-Lieferanten innerhalb des
  Gebäudes auditiert. Die Audits verwendeten
  Sozialaudit-Checklisten, die keinen baustatischen
  Geltungsbereich enthielten. Ein versiegelter Methodik-Fakt
  (FAKT 04) bei jedem dieser Audits hätte die *Geltungsbereichslücke*
  bei Freigabe öffentlich sichtbar gemacht — und damit die
  dokumentierte Einschränkung verankert, die Auditprogramme
  rückwirkend abstritten, gehabt zu haben. Die Versiegelung hätte
  den Einsturz nicht verhindert. Sie hätte verhindert, dass die
  Behauptung der Branche nach dem Einsturz "niemand hat es gewusst"
  epistemisch haltbar bleibt.

- **Apple- / Foxconn-Audits (2010er Jahre).** Mehrere Iterationen von
  Auditberichten zu Foxconn-Betrieben, die für Apple produzierten,
  wurden mit unterschiedlichen Schweregraden der Befunde, Kontext
  zu Arbeitnehmer-Suizidclustern und Abhilfeansprüchen
  veröffentlicht. Ein versiegelter Datensatz zum Freigabezeitpunkt
  für jedes Audit hätte spätere Streitigkeiten darüber, "was das
  Audit damals sagte", davon abhängig gemacht, nicht mehr von
  Archivkopien, durchgesickerten Kopien oder revidierten offiziellen
  Veröffentlichungen.

- **Kobalt aus der DR Kongo (laufend).** Artisanaler Kobaltabbau in
  der Demokratischen Republik Kongo, einschließlich durch Kinder,
  speist Batterie-Lieferketten für große Elektronik- und
  E-Mobilitätsmarken. Mehrere markenseitig beauftragte Audits im
  Zeitraum 2017 bis heute haben Befunde unterschiedlicher Schwere
  hervorgebracht. Das Kit, angewandt auf jedes Audit bei Freigabe,
  hätte das Audit-wie-ausgegeben verankert; das Kit, angewandt auf
  begleitende Offenlegungs-Fakten (FAKT 07 C2: Vorgeschichte der
  Audits), hätte das methodische Erbe vorheriger Lücken bei jedem
  nachfolgenden Auditor öffentlich sichtbar gemacht.

- **Konfliktmineralien (Zinn, Tantal, Wolfram, Gold aus der DR
  Kongo und der Region der Großen Seen).** Dodd-Frank §1502 erzeugte
  Pflichten zur Prüfung und Offenlegung gemäß SEC-Regel 13p-1.
  Streitigkeiten über die Angemessenheit von Audits auf
  Hütten-Ebene und der nachgelagerten Lieferketten-Verifizierung
  traten im Zeitraum 2014–2022 wiederkehrend auf. Pro-Audit
  MYRIAM-Versiegelungen hätten jedes Hüttenaudit bei Freigabe
  verankert.

- **Markenseitig beauftragte Audits von
  Xinjiang-Baumwoll-Lieferketten (2018 bis heute).** Streitigkeiten
  darüber, ob Audits unter Beschränkungen der VR China zum
  Auditorenzugang zuverlässig durchgeführt werden konnten, traten
  nach 2020 weitläufig zutage. Ein versiegelter Methodik-Fakt
  (FAKT 04) bei jedem Audit hätte verankert, welche
  Zugangsbedingungen tatsächlich galten — und spätere Behauptungen
  "wir haben ein rigoroses Audit durchgeführt" gegen die
  versiegelten Methodik-Beschränkungen zum damaligen Zeitpunkt
  diffbar gemacht.

- **Foxconn-Subcontracting und Apple-Lieferantenverantwortungs-
  Berichte in den 2010er Jahren — wiederkehrende Entdeckungen von
  Minderjährigen, versteckten Schlafsälen, Arbeitszeitverstößen.**
  Pro-Audit-Versiegelungen hätten die *negativen Befunde* in Audits,
  die nichts gefunden haben, neben den *positiven Befunden* in
  Audits, die Verstöße gefunden haben, verankert — und damit
  rückwirkende Narrativ-Auslese aus beiden Richtungen verhindert.

Das Kit hätte KEINEN dieser Fälle verhindert. In mehreren Fällen
bestand das zugrunde liegende Problem darin, dass das Audit den
Missbrauch *übersehen* hat — die Versiegelung eines sauberen Audits,
das Verstöße hätte feststellen müssen, erzeugt einen dauerhaften
Datensatz eines gescheiterten Audits. Das ist eine andere Art von
Nutzen (es verankert das Versagen für eine spätere Rechenschaft),
aber nicht dasselbe wie Prävention.

---

## Wann dieses Kit einzusetzen ist

- Sie sind eine Auditstelle, die eine Praxis des "Veröffentlichens
  des Freigegebenen" als Verteidigung gegen Druck zur Abmilderung
  nach Freigabe übernimmt.
- Sie sind eine NGO, die eine parallele Lieferketten-Untersuchung
  durchführt, und möchten einen manipulationssicheren Bezugspunkt
  im Moment des Abschlusses Ihrer Untersuchung haben.
- Sie sind eine Arbeitnehmerrechtsorganisation, die einen
  Auditbericht erhalten hat, und wollen seinen aktuellen Inhalt
  verankern, bevor die Auditstelle oder Marke Gelegenheit zur
  Überarbeitung hat.
- Sie sind eine Marke, die sich zu Transparenz über von Ihnen
  beauftragte Audits verpflichtet, und Sie möchten einen
  verifizierbaren forensischen Datensatz.
- Sie sind ein Journalist, eine Regulierungsbehörde oder ein
  Gericht und verankern den Inhalt eines bestimmten Audits zu
  einem bestimmten Moment für spätere Streitverfahren oder
  Berichterstattung.

## Wann dieses Kit NICHT einzusetzen ist

- **Nicht als Ersatz für arbeitnehmergeführtes Monitoring,
  unabhängige NGO-Untersuchungen oder gewerkschaftliche
  Organisierung verwenden.** Das Kit ist *additiv*, kein Ersatz für
  eines dieser Elemente.
- **Nicht verwenden, um zu behaupten, ein Lieferant sei compliant.**
  Ein sauberes versiegeltes Audit ist bestenfalls ein Input in eine
  Compliance-Bewertung. Ein versiegeltes Audit als
  Compliance-Zertifikat zu behandeln, ist genau das
  Legitimitätstheater, das die zuerst-die-Beschränkungen-Regeln
  verhindern sollen.
- **Nicht mitten im Audit verwenden.** Eine Versiegelung vor der
  Freigabe erzeugt einen falsch-positiven "dies ist der finale
  Auditbericht"-Datensatz.
- **Nicht verwenden, um einen Entwurf zu versiegeln, den Sie zu
  überarbeiten beabsichtigen.** Jede Freigabeversion erhält ihre
  eigene Versiegelung; Revisionen referenzieren Originale per
  Merkle-Wurzel.
- **Nicht unter Druck einsetzen, früher als bei Freigabe zu
  versiegeln oder die Offenlegung eines Begleit-Fakts auszulassen.**
  Verweigern Sie und versiegeln Sie (falls Ihr Prinzipal es
  erlaubt) die Verweigerung.
- **Nicht als Grundlage für eine "Fair Trade"- oder
  "Ethical Sourcing"-Marketingaussage verwenden, ohne die
  versiegelten Methodik-Beschränkungen zusammen mit der
  Versiegelung offenzulegen.** Die Versiegelung zu zitieren, ohne
  die Beschränkungen zu zitieren, ist der Versagensmodus
  Legitimitätstheater, der Audit-Vereinnahmung definiert.
- **Nicht verwenden, wenn Ihre Auditstelle strukturell vereinnahmt
  ist und keine Befunde gegen das Geschäftsinteresse der
  beauftragenden Marke veröffentlichen kann.** In diesem Fall
  erzeugt die Versiegelung einen dauerhaften öffentlichen Datensatz
  des vereinnahmten Audits. Das kann immer noch wertvoll sein —
  aber es ist nicht dasselbe wie eine Verteidigung gegen
  Vereinnahmung.

---

## Wie man dieses Kit für ein reales Audit forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Kritisches Timing:** Versiegeln Sie IM Moment der Freigabe —
d. h. wenn der leitende Auditor den finalen Bericht unterzeichnet
und dieser zur offiziellen Position der Auditstelle wird. Eine
Versiegelung vor der Freigabe erzeugt einen falsch-positiven
"dies ist das finale Audit"-Datensatz. Eine Versiegelung lange nach
Freigabe ist forensisch schwächer gegen zwischenzeitliche
Änderungen.

---

## Integration mit bestehender Lieferketten-Audit-Infrastruktur

Das Kit ist dafür konzipiert, sich zusammenzufügen mit, nicht zu
ersetzen:

- **SA8000 (Social Accountability International).**
  SA8000-Auditberichte und CAP-Dokumente lassen sich natürlich auf
  FAKT 03 + FAKT 05 abbilden. Die SAAS-Akkreditierungsreferenz
  passt zu FAKT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment
  Program).** Die Auditbefunde der RBA lassen sich auf FAKT 03
  abbilden; die Regeln der RBA zur Unabhängigkeit der Auditfirma
  lassen sich auf FAKT 06 abbilden.
- **SMETA (Sedex Members Ethical Trade Audit).** Die 2-Säulen- und
  4-Säulen-Auditbefunde von SMETA lassen sich auf FAKT 03 abbilden;
  die Sedex-Plattform hostet den Rohbericht — die MYRIAM-Versiegelung
  verankert einen Inhalts-Hash des plattformgehosteten Berichts.
- **amfori BSCI.** Die Mechanik der BSCI-A–E-Bewertung lässt sich
  auf die Zertifizierungsempfehlung in FAKT 03 abbilden;
  Marken-Mitgliederbeauftragung lässt sich auf die Offenlegung der
  Kundenkonzentration in FAKT 06 und auf FAKT 07 C1 abbilden.
- **FSC Chain-of-Custody.** Für Lieferketten von Forstprodukten
  passen die Chain-of-Custody-Zertifikate und Re-Audit-Pläne in die
  Auditfenster- und CAP-Struktur.
- **B Lab / B Corp Impact Assessment.** Die B-Corp-Zertifizierung
  ist kein Drittparteien-Audit im Sinne von SA8000, aber die
  Verifizierer-Berichte zum Impact Assessment können unter diesem
  Kit versiegelt werden (mit Fakten, die neu auf Impact Assessment
  statt Arbeitsaudit zugeschnitten sind).
- **ISO 26000.** ISO 26000 ist Leitlinie, nicht zertifizierbar; das
  Kit hat keine direkte ISO-26000-Auditbericht-Integration, aber
  die Taxonomie sozialer Verantwortung kann die Element-Struktur
  von FAKT 03 für hauseigene Audits informieren.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program /
  andere branchenspezifische Regime).** Branchenspezifische
  Auditprogramme können unter diesem Kit versiegelt werden; das
  Auditstandard-Feld in FAKT 02 gibt an, welches.
- **Fair Labor Association.** FLA-Fabrikmonitoring-Berichte lassen
  sich auf FAKT 03 + FAKT 05 abbilden; der FLA-Rahmen
  unabhängiger Beobachter lässt sich auf die
  Unabhängigkeitserklärungen in FAKT 06 abbilden.
- **Higg Index (Sustainable Apparel Coalition).**
  Betriebsebenen-Ausgaben von Higg FEM (Facility Environmental
  Module) und Higg FSLM (Facility Social & Labor Module) können
  unter diesem Kit versiegelt werden.
- **EU CSRD / CSDDD.** Die EU Corporate Sustainability Reporting
  Directive und die Corporate Sustainability Due Diligence
  Directive schaffen Offenlegungspflichten, deren
  Verifizierungsdokumente unter diesem Kit versiegelt werden
  können. Das Kit verankert die Offenlegung-wie-ausgegeben, nicht
  ihre inhaltliche Angemessenheit.

## Was dieses Kit NICHT ersetzt

- Arbeitnehmergeführtes Monitoring (das zuverlässigste Signal zur
  Missbrauchserkennung in jeder Lieferkette)
- Unabhängige NGO-Untersuchungen (CCC, Labour Behind the Label,
  China Labour Bulletin, Workers' Rights Consortium usw.)
- Regulatorische Inspektion (nationale Arbeitsbehörden,
  OSHA-Äquivalente, Länderbüros-Programme der ILO)
- Gewerkschaftliche Organisierung und Tarifverhandlungen
- Streitverfahren, Schiedsgerichtsbarkeit und Abhilfe nach
  inländischem Arbeitsrecht
- Markenseitige Due-Diligence-Rahmenwerke (UNGP, OECD-Leitlinien
  für die Sorgfaltspflicht, EU CSDDD, deutsches LkSG)

## Lizenz

Public Domain (CC0). Forken Sie es. Keine Namensnennung
erforderlich.
