# Kit zur Krankenhaus-Wiederaufnahme-Attestierung

*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

Ein schlüsselfertiges myriam-kit-Beispiel für Krankenhäuser,
Krankenhausnetzwerke, Chief Medical Officers, Qualitätsdirektoren,
staatliche Krankenhausverbände und Forscher des öffentlichen
Gesundheitswesens, die eine Bitcoin-verankerte, manipulationsbeständige
monatliche Versiegelung von *den tatsächlichen 30-Tage-
Wiederaufnahmeraten des Krankenhauses* und *deren Messung* veröffentlichen
möchten — damit stille nachträgliche Revisionen des Wiederaufnahmeregisters,
Beobachtungsstatus-Manipulation, Verlegungsmanipulation oder
Methodendrift zwischen Berichtsperioden über Monate hinweg öffentlich
nachweisbar werden.

Die Versiegelung ist so konzipiert, dass sie **gegen die Versiegelung
des nächsten Monats diffbar ist**. Diese Eigenschaft ist der ganze
Sinn. Eine einzelne Attestierung in Isolation ist nützlich; das
öffentliche Register eines Krankenhauses, das dieselbe Erkrankung
Monat für Monat unter derselben Methodik versiegelt, ist das
tragende Artefakt.

---

## Was dieses Kit NICHT tut (zuerst lesen)

Die Versiegelung ist ein kryptographischer Zeitstempel davon, WELCHE
Index-Aufnahmen in WELCHEM DRG-/Erkrankungs-Kohorte gezählt wurden,
WELCHE 30-Tage-Wiederaufnahmen beobachtet wurden, WELCHE
Beobachtungsstatus-Entlassungen und WELCHE Verlegungen erfasst wurden,
unter WELCHER CMS-Spezifikationsversion und WELCHEN
Ausschlusskriterien, signiert vom zertifizierenden Chief Medical Officer
und Quality Officer des Krankenhauses. Sie kann keine Frage zur
Versorgungsqualität jenseits davon beantworten. Folgendes liegt
**außerhalb der Domäne der Versiegelung**:

1. **Beweis, dass die Wiederaufnahmen unvermeidbar waren.** Eine
   30-Tage-Wiederaufnahme kann durch unzureichende Entlassungsplanung,
   unvermeidbares Krankheitsfortschreiten, Patienten-Nonadhärenz,
   soziale Determinanten außerhalb der Kontrolle des Krankenhauses,
   eine neue unabhängige Krankheit oder durch Fehler nach der
   Entlassung in einer nachgelagerten Einrichtung verursacht werden.
   Die Versiegelung erfasst die *Zahl*; sie entscheidet nicht über
   die *Ursache*. Ein Krankenhaus mit hoher versiegelter
   Wiederaufnahmerate ist dadurch nicht als fahrlässig erwiesen. Ein
   Krankenhaus mit niedriger versiegelter Wiederaufnahmerate ist
   dadurch nicht als exzellent erwiesen.

2. **Das Krankenhaus besser machen.** Eine Zahl zu versiegeln ist
   keine Qualitätsverbesserungs-Intervention. Die Versiegelung ist
   eine Manipulationsbeweis-Schicht über dem, was das Krankenhaus
   bereits berichtet; sie ändert nichts an Entlassungsplanung,
   Versorgungskoordination, postakutem Follow-up oder anderem
   operativen Input zur Wiederaufnahmerate. Ein Krankenhaus, das
   eine schlechte Rate versiegelt, hat eine öffentlich auditierbare
   schlechte Rate; das Schlechte bleibt unverändert, bis sich der
   zugrunde liegende Versorgungsprozess ändert. Die Versiegelung
   macht Behauptungen über die Rate auditierbar; sie macht die Rate
   nicht gut.

3. **Verteidigung gegen Voraufnahme-Patientenauswahl-Bias.** Ein
   Krankenhaus, das Hochrisiko-Patienten am vorderen Ende leise von
   der Aufnahme weglenkt (in Beobachtungsstatus, zur Verlegung in
   eine andere Einrichtung, zur Entlassung aus der Notaufnahme ohne
   Aufnahme), wird in den versiegelten Nennern mit einem gesünder
   aussehenden Fallmix erscheinen. Die Versiegelung verankert, was
   das Krankenhaus für die Kohorte als Index-Aufnahme gezählt hat;
   sie kann keine Patienten erkennen, die nie Index-Aufnahmen
   wurden, weil sie umgeleitet wurden. Front-End-Auswahl-Bias liegt
   stromaufwärts der Versiegelung.

4. **Verteidigung gegen Entlassung nach Hause mit Diensten auf
   Wegen, die fortgesetzte Versorgung verschleiern.** Ein Patient,
   der zu einer Home-Health-Agentur entlassen wird, die demselben
   Gesundheitssystem gehört, mit intensiver fortlaufender
   Versorgung, die anderswo funktional stationäre Versorgung wäre,
   zählt nicht als Wiederaufnahme, wenn er nicht wieder aufgenommen
   wird. Die Versiegelung erfasst Wiederaufnahmen; sie erfasst nicht
   die Intensität der unter einem Entlassungs-Label erbrachten
   fortgesetzten Versorgung. Der "nur dem Namen nach entlassene"
   Fehlermodus liegt stromabwärts des Entlassungscodes und ist
   nicht durch die Versiegelung verankert.

5. **Erkennung von Mortalität, die Wiederaufnahme verdrängt.** Ein
   Patient, der innerhalb von 30 Tagen nach der Entlassung zu Hause
   stirbt, zählt nicht als Wiederaufnahme. Wenn ein Krankenhaus mit
   einer hohen Mortalitätsverschiebungsrate eine niedrige
   Wiederaufnahmerate produziert, sieht die Wiederaufnahmerate gut
   aus, während das zugrunde liegende Ergebnis schlechter ist. Die
   Versiegelung erfasst Wiederaufnahmen; das Mortalitäts-Follow-up
   ist eine separate Messung mit einer separaten (und notwendigen)
   Versiegelung. Die Versiegelung von Wiederaufnahmeraten ohne
   begleitende Mortalitätsdaten kann irreführen. Das Kit verweigert
   diese Konfiguration (siehe Verweigerungsregel R4 unten).

6. **Ersatz für CMS Hospital Compare, HRRP risikoadjustierte
   Messungen oder ein gesetzliches Qualitätsberichtsprogramm.** Die
   CMS-Einreichungen des Krankenhauses unter dem Hospital Readmissions
   Reduction Program (HRRP), dem Hospital Inpatient Quality
   Reporting Program (HIQR), MIPS und alle bundesstaatlichen
   Berichtspflichten werden gemäß Gesetz aufrechterhalten und auf
   Aufsichtsbehördenanforderung produziert. Die Versiegelung fügt
   eine öffentliche manipulationsbeständige Schicht ÜBER diesen
   Einreichungen hinzu; sie ersetzt sie NICHT. Eine versiegelte
   Veröffentlichung ist keine CMS-Einreichung.

7. **Beweis, dass das Krankenhaus "besser" oder "schlechter" als
   ein anderes Krankenhaus ist.** Der Krankenhausübergreifende
   Vergleich von Rohwiederaufnahmeraten ohne Fallmix-Anpassung ist
   methodisch unbegründet und ist genau der Grund, warum HRRP
   risikoadjustierte Maßnahmen verwendet. Die Versiegelung
   veröffentlicht Rohraten pro Erkrankung UND die CMS-Spezifikation-
   versionsspezifischen risikoadjustierten Raten UND die Nenner,
   sodass ein Forscher den fallmix-adjustierten Vergleich selbst
   neu ableiten kann. Die Versiegelung selbst rangiert keine
   Krankenhäuser.

8. **Erfassung gleichzeitigen Codierungsbetrugs.** Ein
   Krankenhaus-Codierungsteam, das eine Wiederaufnahme zum Zeitpunkt
   der Aufnahme als Neuaufnahme fehlklassifiziert, produziert eine
   versiegelte Rate, die intern mit der (betrügerischen) Codierung
   übereinstimmt. Die Versiegelung macht spätere stille Modifikation
   nachweisbar, erkennt aber keine gleichzeitige Fehlcodierung. Die
   Erkennung von gleichzeitigem Codierungsbetrug erfordert
   CMS-Recovery-Audit-Contractor (RAC)-Audits, Office-of-Inspector-
   General (OIG)-Überprüfung, interne Codierungsaudits und
   Whistleblower-Offenlegungen — die alle stromaufwärts der
   Versiegelung liegen.

**Der obige Abschnitt über ehrliche Grenzen ist der tragende Teil
dieses Kits.** Krankenhausverwalter, die "wir haben unsere
Wiederaufnahmerate versiegelt" als äquivalent zu "wir haben bewiesen,
dass wir gute Versorgung bieten" behandeln, missbrauchen das Primitiv.
Das Kit muss klar sagen: *Dies ist ein Nichtabstreitbarkeits-Primitiv
für die zeitgleichen Behauptungen des Krankenhauses über das
Wiederaufnahmeregister, keine Qualitätsmessung, kein Ersatz für die
CMS-Aufsicht und keine Verteidigung gegen die Front-End-Auswahl-,
Mortalitätsverdrängungs- oder Versorgungs-Verschiebungs-Fehlermodi,
die Wiederaufnahmeraten allein zu einem partiellen Bild der
Krankenhausqualität machen.*

---

## Was dieses Kit zu versiegeln VERWEIGERN MUSS

Das Kit ist konfiguriert, die folgenden Faktmuster abzulehnen, selbst
wenn ein Benutzer mit gültiger Krankenhaus-Signaturbehörde sie
einreicht:

- **Pro-Patienten-Ergebnisse.** Kein Fakt darf einen Patienten
  benennen, eine Wiederaufnahme mit einem Patienten verknüpfen,
  eine Krankenaktennummer offenlegen, eine Geburtsdatum-Aufnahmedatum-
  Kombination offenlegen, die in einer kleinen Zelle re-
  identifizierend sein könnte, oder einen HIPAA-geschützten
  Identifikator enthalten. Aggregierte Zählungen auf
  Erkrankungsebene sind die Analyseeinheit; alles Pro-Patient wird
  abgelehnt. (R1)

- **Pro-Arzt-Ergebnisse.** Kein Fakt darf Wiederaufnahmezählungen
  einem benannten behandelnden Arzt, benannten Hospitalisten,
  benannten Chirurgen oder benannten entlassenden Kliniker
  zuschreiben. Dies ist aus zwei Gründen nicht verhandelbar: (a)
  Pro-Arzt-Wiederaufnahmeraten sind bei den Volumen, die die
  meisten Ärzte in einem Monat sehen, statistisch verrauscht und
  werden weitgehend missbraucht; (b) wichtiger noch, öffentliche
  Pro-Arzt-Bewertung schafft direkte Vergeltungsvektoren gegen
  Kliniker, die sich für kränkere, höhere Risiko, weniger
  versicherungsfreundliche Patienten einsetzen, gegen Kliniker, die
  Sicherheitsprobleme melden, und gegen Kliniker, die sich
  weigern, die Messung zu manipulieren. Die Versiegelung darf
  nicht zu einem Werkzeug zur Abkühlung der Kliniker-Fürsprache
  werden. Pro-Arzt-Qualitätsmessung gehört, wo angemessen, in
  interne Peer-Review- und Credentialing-Ausschüsse mit ihren
  eigenen Due-Process-Schutzmaßnahmen — nicht auf Bitcoin. (R2)

- **Nur-risikoadjustierte Raten ohne Rohraten.** Das Kit verweigert
  die Versiegelung eines Faktkörpers, der NUR die
  CMS-risikoadjustierte krankenhausweite Wiederaufnahmerate (oder
  jede andere angepasste Messung) ohne den entsprechenden
  Rohzähler, Rohnenner und Rohrate enthält. Risikoadjustierung ist
  aus der Perspektive eines externen Prüfers eine Blackbox; ohne
  die Rohraten ist eine Methodikänderung zwischen Monaten
  unsichtbar. Die Versiegelung MUSS Rohzählungen enthalten, damit
  die Versiegelung des nächsten Monats gegen die dieses Monats auf
  der Ebene von Rohdaten diffbar ist. (R3)

- **Aggregierte krankenhausweite Raten ohne Aufschlüsselung pro
  Erkrankung.** Eine einzelne krankenhausweite Wiederaufnahmerate
  verbirgt genau den Manipulationsvektor, den die Versiegelung
  sichtbar machen soll — ein Krankenhaus könnte leise Fallmix von
  Hoch-Wiederaufnahme-DRGs zu Niedrig-Wiederaufnahme-DRGs
  verschieben, während die krankenhausweite Rate stabil oder sich
  verbessernd aussieht. Raten pro Erkrankung (mindestens: AMI,
  Herzinsuffizienz, Pneumonie, COPD, CABG, THA/TKA, die
  HRRP-Kohorten) MÜSSEN erscheinen, mit Nennern pro Erkrankung.
  Die krankenhausweite Rate, falls berichtet, ist zusätzlich (nicht
  anstelle) zu den Raten pro Erkrankung. (R4)

- **Alles, was nicht gegen die Versiegelung des nächsten Monats
  diffbar wäre.** Der gesamte forensische Wert dieses Kits kommt
  aus der Monat-für-Monat-Vergleichbarkeit. Das Kit verweigert
  Faktkörper, die so strukturiert sind, dass die Versiegelung des
  nächsten Monats nicht gegen diese diffbar ist — zum Beispiel ein
  Freitext "unsere Wiederaufnahmerate beträgt etwa X Prozent" ohne
  einen festen Zähler, Nenner, Methodikversion und
  Ausschlusskriterienliste. Wenn der Analyst des nächsten Monats
  nicht berechnen kann, "diese Zahl ging von X auf Y wegen A und
  B", ist der Fakt fehlerhaft und das Kit verweigert die
  Versiegelung. (R5)

- **Mortalitätsdaten ohne begleitende Mortalitätsattestierung.**
  Die Versiegelung von Wiederaufnahmen ohne Versiegelung der
  30-Tage-Mortalität nach Entlassung ermöglicht den Manipulations-
  vektor "Patienten, die zu Hause sterben, zählen nicht als
  Wiederaufnahmen", der eine irreführend niedrige Wiederaufnahmerate
  produziert. Das Kit verweigert die Versiegelung einer
  Wiederaufnahme-Attestierung, die nicht entweder (a) die
  30-Tage-Mortalitätszählung nach Entlassung in derselben
  Veröffentlichung enthält oder (b) durch Merkle-Root auf eine
  begleitende Mortalitätsattestierung für denselben Zeitraum
  verweist. (R6)

- **Beobachtungsstatus-Zählungen, die die Begründungskategorie
  ausschließen.** Das Kit verweigert die Versiegelung einer
  Beobachtungsstatus-Zählung, die die Begründungskategorien
  (Brustschmerz-Ausschluss, Synkope, Dehydration usw.) und die
  Dauerverteilung nicht aufschlüsselt. Eine bloße aggregierte
  Beobachtungszählung ermöglicht genau das Manipulationsmuster,
  das diese Versiegelung sichtbar machen soll: eine stille
  Verschiebung von stationärer Aufnahme zu Beobachtungsstatus für
  Fälle, die sonst als Index-Aufnahmen gezählt worden wären. (R7)

- **Verlegungszählungen, die die Empfangseinrichtungskategorie
  und das Within-System-Flag ausschließen.** Eine Verlegung in
  ein Schwesternkrankenhaus innerhalb desselben Gesundheitssystems
  ist funktional anders als eine Verlegung in eine unabhängige
  Einrichtung. Das Kit verweigert die Versiegelung von
  Verlegungszählungen ohne die Within-System-Aufschlüsselung. (R8)

- **Versiegelung durch jemand anderen als den zertifizierenden
  Chief Medical Officer UND einen separaten Quality Officer.**
  Zwei-Unterzeichner-Minimum für Krankenhausattestierungen, weil
  die hier auftretenden Manipulationsvektoren genau die Art sind,
  die ein einziger Unterzeichner an institutionellem Betrug
  verbirgt. Ein dritter Qualitätsberater, ein externes Register
  oder ein staatlicher Krankenhausverband kann dasselbe Kit
  verwenden, um IHRE eigene unabhängige Analyse zu versiegeln; sie
  dürfen NICHT die primäre Wiederaufnahmeattestierung des
  Krankenhauses unter dem Namen des Krankenhauses versiegeln. (R9)

Eine Verweigerung selbst kann als Fakt versiegelt werden ("Dieses
Krankenhaus beantragte die Versiegelung von X; das Kit verweigerte
gemäß Verweigerungsregel Y"), wodurch ein öffentliches Register
versuchten Missbrauchs entsteht.

---

## Was dieses Kit versiegelt

8 Fakten zum Zeitpunkt der monatlichen Attestierung:

1. **Beispielhinweis** — erklärt die Veröffentlichung als Beispiel
   (echte Attestierungen entfernen oder ersetzen dies).
2. **Krankenhausidentifikation** — Krankenhaus-Rechtsname,
   CMS-Zertifizierungsnummer (CCN), Einrichtungsregion,
   zertifizierende CMO-Rolle + Quality-Officer-Rolle +
   kryptographische Schlüsselinformationen.
3. **Attestierungszeitraum** — abgedeckter Kalendermonat, Daten-
   einfrierdatum, Attestierungsdatum, Erklärung, dass keine
   Aufzeichnungen nach dem Dateneinfrierdatum für den
   attestierten Zeitraum modifiziert wurden.
4. **Wiederaufnahmeraten** — Pro-DRG-/Pro-Erkrankungs-30-Tage-
   Wiederaufnahmeraten aller Ursachen, Rohzähler, Rohnenner,
   Rohrate mit 95%-Konfidenzintervall, UND die
   CMS-Spezifikationsversion risikoadjustierte Rate neben der
   Rohrate (gemäß Verweigerungsregel R3).
5. **Index-Aufnahmezählungen** — Nenner nach Erkrankung,
   Gesamtzahl der stationären Entlassungen für den Monat,
   Aufschlüsselung nach Hauptzahler (Medicare FFS / Medicare
   Advantage / Medicaid / kommerziell / Selbstzahler / sonstige)
   für Fallmix-Transparenz.
6. **Beobachtungsstatus-Offenlegung** — Anzahl der
   Beobachtungsstatus-Entlassungen, Aufschlüsselung der
   Begründungskategorien, Dauerverteilung (≤24h, 24-48h, >48h)
   und die Konversionszählung von stationär zu Beobachtung,
   falls vorhanden (das "Zwei-Mitternachts-Regel"-angrenzende
   Manipulationsmuster).
7. **Verlegungs-Offenlegung** — Anzahl der in andere stationäre
   Einrichtungen verlegten Patienten, aufgeschlüsselt nach
   within-system vs. unabhängige Empfangseinrichtung, nach
   Begründungskategorie (Eskalation der Versorgungsebene,
   Patientenwunsch, Kapazität, Versicherung) und Anzahl der als
   Verlegungen empfangenen Patienten (damit Nettofluss
   berechenbar ist).
8. **Methodik** — CMS-Spezifikationsversion (HRRP-Messjahr),
   angewandte Ausschlusskriterien, Handhabung der
   geplanten-Wiederaufnahme-Ausschlüsse, Verlegungs-Out-
   Zurechnungsrichtlinie, Beobachtungs-als-Index-Aufnahme-
   Richtlinie, Erklärung jeder Änderung gegenüber der versiegelten
   Methodik des Vormonats mit einem Merkle-Root-Verweis auf die
   Versiegelung der vorherigen Periode, kryptographische
   Schlüsselinformationen des signierenden Prinzipals.

Jeder Fakt endet mit der Konvention des Verweigerungs-Gates: *"Dieser
Fakt behauptet nur X. Er behauptet Y nicht"* (wobei Y der nächste
Fehlermodus aus dem Abschnitt "TUT NICHT" oben ist).

---

## Wogegen dieses Kit verteidigt

- **Stille rückwirkende Revision der Wiederaufnahmeraten.** Alle
  ratentragenden Fakten sind gehasht. Re-Hashing nach der
  Attestierung enthüllt jede Modifikation. Eine Aufsichtsbehörde,
  ein Forscher oder ein Whistleblower, der die versiegelte Root
  des Vormonats hat, kann jede stille Änderung der veröffentlichten
  Rate des Vormonats erkennen, wenn das Krankenhaus das nächste
  Mal berichtet.
- **Beobachtungsstatus-als-Entlassungs-Manipulation, die
  unentdeckbar wird.** FACT 06 friert die Beobachtungszählung,
  die Verteilung der Begründungskategorien und die Dauerverteilung
  bei der Attestierung ein. Eine stille Monat-zu-Monat-
  Verschiebung von stationärer Entlassung zu Beobachtungsstatus
  (was das entfernen würde, was Index-Aufnahmen aus dem Nenner
  gewesen wären) ist über Versiegelungen hinweg öffentlich diffbar.
- **Methodikdrift zwischen CMS-Berichtsperioden.** FACT 08 friert
  die CMS-Spezifikationsversion, die Ausschlusskriterien und die
  Handhabung der geplanten-Wiederaufnahme-Ausschlüsse ein. Jede
  Änderung muss in FACT 08 des nächsten Monats mit einem Verweis
  auf die Merkle-Root dieses Monats offengelegt werden. Eine
  stille Methodikänderung zwischen Monaten, die eine günstige
  Ratenbewegung produziert, ist öffentlich nachweisbar.
- **Verlegungs-Out-Zurechnungsmanipulation.** FACT 07 friert
  Verlegungsmuster einschließlich Within-System-Flag und
  Begründungskategorie ein. Eine stille Verschiebung zur
  Verlegung von Hochrisiko-Patienten vor 30 Tagen (was sie unter
  einigen Spezifikationen aus dem Wiederaufnahme-Zähler entfernen
  würde) ist über Monate hinweg öffentlich nachweisbar.
- **Fallmix-Manipulation durch Zahler- oder DRG-Verschiebung.**
  Die Aufschlüsselung pro Erkrankung Nenner und Zahler von FACT 05
  friert den Fallmix für den Monat ein. Eine stille Verschiebung
  weg von Hoch-Wiederaufnahme-Erkrankungen (zum Beispiel weniger
  Herzinsuffizienz-Patienten aufzunehmen, während mehr elektive
  orthopädische Patienten aufgenommen werden) ist über Monate
  hinweg öffentlich diffbar.
- **Verwechslung von Roh- und risikoadjustierten Raten.** FACT 04
  verlangt beide. Eine zukünftige Behauptung "unsere
  risikoadjustierte Rate hat sich um X verbessert" ist öffentlich
  zusammen mit der Rohratenbewegung und der Nennerbewegung
  überprüfbar.
- **Post-hoc-Methodik-Neuerzählung.** FACT 08 wird bei der
  Attestierung versiegelt. Eine zukünftige Behauptung "wir haben
  immer Methodik Y verwendet" ist gegen die versiegelte Methodik
  des fraglichen Zeitraums öffentlich widerlegbar.

Das Kit verteidigt sich **nicht** gegen gleichzeitigen
Codierungsbetrug — ein Krankenhaus, das eine Wiederaufnahme zum
Zeitpunkt der Codierung als Neuaufnahme fehlklassifiziert, produziert
eine kryptographisch gültige Versiegelung einer betrügerischen Zahl.
Das Primitiv ist darüber ehrlich: Es ist ein Nichtabstreitbarkeits-
Primitiv für die zeitgleichen Behauptungen des Krankenhauses, kein
Beweis, dass diese Behauptungen korrekt sind.

---

## Wann dieses Kit verwenden

- Ihr Krankenhaus hat einen stabilen Fallmix-und-Codierungs-
  Workflow und möchte eine Bitcoin-verankerte monatliche
  öffentliche Attestierung als manipulationsbeständige Schicht
  über dem bestehenden HRRP-/HIQR-Berichtsworkflow hinzufügen.
- Sie sind ein Krankenhaussystem, das systemweite Transparenz
  über mehrere Einrichtungen hinweg veröffentlichen möchte,
  versiegelt pro Einrichtung pro Monat, sodass within-System-
  Variation öffentlich vergleichbar ist.
- Sie sind ein Forscher des öffentlichen Gesundheitswesens oder
  ein staatlicher Krankenhausverband, der ein freiwilliges
  Transparenzprogramm unter teilnehmenden Krankenhäusern
  durchführt, und möchten ein gemeinsames kryptographisches
  Primitiv, das alle teilnehmenden Krankenhäuser verwenden
  können, ohne einem zentralen Aggregator zu vertrauen.
- Sie sind ein Krankenhaus in einer Gerichtsbarkeit, deren
  gesetzliche Berichtsinfrastruktur schwach ist oder wo Sie eine
  erhebliche Prüfung Ihrer Wiederaufnahmeansprüche durch Zahler /
  Patient / Aufsichtsbehörden erwarten, und möchten eine global
  überprüfbare Zeitleiste dieser Ansprüche.
- Sie können den aufgeführten Faktensatz veröffentlichen, ohne die
  Verweigerungsregeln R1-R9 zu brechen. Wenn Ihre Fakten einen
  R1-R9-Bruch erfordern würden, verwenden Sie das Kit nicht;
  beheben Sie zuerst die Dateneingaben.
- Krankenhaus-Rechtsanwalt und Compliance haben den
  Veröffentlichungsplan überprüft. Die öffentliche Veröffentlichung
  eines CCN-tragenden, ratentragenden Artefakts hat Auswirkungen
  unter HIPAA (De-Identifizierungsstandards), HRRP (Wechselwirkung
  mit gesetzlicher Berichterstattung) und staatlichen
  Aufsichtsbehörden (Wechselwirkung mit Transparenzgesetzen auf
  Bundesstaatebene). Anwaltsprüfung ist nicht optional.

## Wann dieses Kit NICHT verwenden

- **Verwenden Sie es nicht als Ersatz für CMS HRRP / HIQR /
  Hospital-Compare-Einreichungen.** Die Versiegelung ist
  *additiv*, kein Ersatz. Ihre gesetzlichen Einreichungen, Ihre
  CMS-Audit-Aufzeichnungen, Ihr internes Qualitätsprogramm —
  unverändert.
- **Verwenden Sie es nicht als Qualitätsanspruch.** Die
  Versiegelung einer niedrigen Wiederaufnahmerate stellt nicht
  fest, dass das Krankenhaus gute Versorgung bietet; sie stellt
  fest, dass das Register zu dieser Zeit diesen Byte-Inhalt hatte.
  Die Verweigerungsregeln R1-R9 lehnen Muster ab, die
  Attestierung mit Qualitätsbestätigung verwechseln.
- **Verwenden Sie es nicht zur Veröffentlichung von
  Pro-Patienten- oder Pro-Arzt-Daten.** Die Verweigerungsregeln
  R1-R2 existieren aus Gründen von HIPAA,
  Vergeltungsverhinderung und statistischer Solidität; ändern Sie
  das Kit nicht, um sie zu besiegen, ohne Anwalt und Ethikprüfung
  zu konsultieren.
- **Verwenden Sie es nicht unter Druck, vor dem endgültigen
  Dateneinfrieren des Monats zu versiegeln.** Eine Versiegelung
  mit Teildaten gibt den Attestierungszeitraum falsch wieder und
  schafft einen irreführenden Bezugspunkt.
- **Verwenden Sie es nicht ohne eine begleitende
  Mortalitätsattestierung.** Die Verweigerungsregel R6 wird
  Wiederaufnahmeattestierungen ablehnen, die Mortalität
  weglassen. Die beiden Maßnahmen zusammen sind partiell; jede
  allein ist irreführend.
- **Verwenden Sie es nicht als Legitimitätstheater.** Eine
  Versiegelung eines manipulierten Wiederaufnahmeregisters ist
  ein permanentes öffentliches Register der Manipulation, keine
  Verteidigung dagegen. Das Primitiv schneidet in beide
  Richtungen; das ist seine Ehrlichkeit.

## Wie dieses Kit für eine echte monatliche Attestierung forken

```bash
cp -r ~/Genesis/myriam-kit/examples/hospital-readmission-attestation ~/readmission-2026-04
cd ~/readmission-2026-04
$EDITOR facts/*.txt        # ersetzen Sie fiktiven Inhalt durch echten Monat
                           # wenden Sie Verweigerungsregeln R1-R9 durchgehend an
bash build/seal.sh         # VERSIEGELN BEI Monatsende + Dateneinfrieren + CMO/QO-Freigabe
python3 build/verify.py    # bestätigen
```

**KRITISCHES TIMING:** Versiegeln Sie BEI dem monatlichen
Dateneinfrieren + CMO- und Quality-Officer-Freigabemoment. Versiegeln
Sie nicht mitten im Monat. Versiegeln Sie nicht, nachdem das
krankenhausinterne Überprüfungstreffen die Möglichkeit hatte, die
Zahlen zu "anzupassen" — der ganze Sinn ist, zu verankern, was die
Daten beim Einfrieren vor Anpassungen sagten. Das richtige Fenster
liegt zwischen dem formalen Dateneinfrieren und dem ersten
öffentlichen Zitat der Rate.

**KRITISCHE ÜBERPRÜFUNG:** Vor der Versiegelung lassen Sie die
Veröffentlichung durch den Quality Officer (getrennt vom CMO), durch
Codierung / Compliance und durch den Anwalt laufen. Die
Zwei-Unterzeichner-Regel (FACT 02 und FACT 08) existiert, um
institutionellen Betrug durch einen einzigen Unterzeichner zu
verhindern.

**MONATLICHE KADENZ:** Der Wert des Kits potenziert sich über Monate
hinweg. Einmal zu versiegeln ist nützlich; jeden Monat ein Jahr
lang zu versiegeln ist das Artefakt. FACT 08 jedes neuen Monats
verweist auf die Merkle-Root des Vormonats, sodass die Kette der
Attestierungen öffentlich begehbar ist.

## Integration mit bestehender Krankenhaus-Qualitätsinfrastruktur

- **CMS Hospital Readmissions Reduction Program (HRRP).** Die
  versiegelte Veröffentlichungs-URL oder IPFS-CID kann in den
  öffentlichen Offenlegungsmaterialien des Krankenhauses
  referenziert werden. Die Versiegelung verpflichtet die
  Roh- und risikoadjustierten Raten pro Erkrankung, die das
  Krankenhaus an CMS meldet; spätere Streitigkeiten darüber, was
  gemeldet wurde, sind öffentlich widerlegbar.
- **CMS Hospital Inpatient Quality Reporting (HIQR) Program.**
  Die Versiegelung verpflichtet die zugrunde liegenden Zählungen,
  die HIQR-Messungen speisen; die Versiegelung ersetzt nicht die
  HIQR-Einreichung.
- **CMS Hospital Compare / Care Compare öffentliche Website.**
  Die Versiegelung steht neben Hospital Compare als unabhängige
  Attestierung; das Krankenhaus kann seine versiegelten
  monatlichen Veröffentlichungen in patientenorientierten
  Materialien referenzieren.
- **Berichterstattung staatlicher Krankenhausverbände (z.B. PHC4
  in Pennsylvania, OSHPD/HCAI in Kalifornien, NYSDOH in New
  York).** Kompatibel als additive Transparenzschicht; die
  Pro-Erkrankungs-Zählungen der Versiegelung können mit
  staatlichen Berichtskategorien gekreuzt werden, wo Definitionen
  übereinstimmen.
- **The Leapfrog Group, US News & World Report-Rankings,
  Healthgrades, Vizient-Kohortenprogramme.** Kompatibel. Diese
  Programme aggregieren Krankenhaus-Qualitätsdaten; eine
  versiegelte monatliche Attestierung lässt sie (und die
  Öffentlichkeit) überprüfen, ob die Ansprüche des Krankenhauses
  ihnen gegenüber mit den Ansprüchen des Krankenhauses anderswo
  übereinstimmen.
- **Joint-Commission-Akkreditierung.** Kompatibel. Versiegelte
  Attestierungen sind dokumentarische Beweise, die der
  Joint-Commission-Prüfer während Akkreditierungsbesuchen
  überprüfen kann.
- **Interne Credentialing und Peer-Review (gemäß Healthcare
  Quality Improvement Act von 1986).** Außerhalb des
  Versiegelungsumfangs direkt. Pro-Arzt-Daten erscheinen nicht
  in der Versiegelung (Verweigerungsregel R2). Internes
  Peer-Review bleibt unter HCQIA-Schutz.
- **CMS MIPS (Merit-based Incentive Payment System) für
  einzelne Ärzte.** Außerhalb des Umfangs; die Versiegelung ist
  nur auf Krankenhausebene.

## Was dieses Kit NICHT ersetzt

- CMS-HRRP-Einreichung.
- CMS-HIQR-Einreichung.
- CMS-Hospital-Compare-/Care-Compare-Datenfeed.
- Bundesstaatliche Krankenhaus-Berichterstattung (PHC4, OSHPD/HCAI,
  NYSDOH, bundesstaatliche Entsprechungen).
- Joint-Commission-Akkreditierung.
- Interne Peer-Review und Credentialing.
- CMS-Recovery-Audit-Contractor (RAC)-Audits.
- HHS-Office-of-Inspector-General (OIG)-Aufsicht.
- CMS-Quality-Improvement-Organization (QIO)-Überprüfung.
- Patientensicherheits-Ereignisberichterstattung (CMS Conditions
  of Participation, bundesstaatliche Anforderungen, PSO-
  Berichterstattung).
- Begleitende 30-Tage-Mortalitätsattestierung nach Entlassung
  (die unter einer separaten myriam-kit-Veröffentlichung für
  denselben Zeitraum versiegelt werden sollte — siehe
  Verweigerungsregel R6).

## Adoptionswert und ehrliche Wirkungsschätzung

Das Hospital Readmissions Reduction Program (HRRP) verhängt
derzeit Zahlungsstrafen auf US-Krankenhäuser, deren
risikoadjustierte 30-Tage-Wiederaufnahmeraten die erwartete Rate
von CMS überschreiten. Veröffentlichte Schätzungen der jährlichen
HRRP-Strafsummen liegen in den **mittleren hundert Millionen
Dollar pro Jahr landesweit** (die FY2023-Strafsumme wurde von
CMS mit ungefähr 320 Millionen Dollar gemeldet; die kumulierte
Lebensdauer des Programms liegt in Milliarden). Die
Strafstruktur schafft messbare finanzielle Anreize für
Krankenhäuser, Wiederaufnahmen durch
Beobachtungsstatus-Manipulation, Verlegungs-Out-Manipulation,
Fallmix-Verschiebung und stille Revision von Grenzfällen zu
unterrepräsentieren — die alle in der peer-reviewed Literatur
dokumentiert sind (Wadhera et al., JAMA 2018-2019; Khera et
al., JAMA 2018; Gupta et al., JAMA Cardiol 2018; Zuckerman et
al., NEJM 2016 und Folgekritiken).

**Die ehrliche Wirkungsschätzung:**

Eine versiegelte monatliche Wiederaufnahmeattestierung reduziert
nicht den Anreiz zur Manipulation; sie macht eine Kategorie der
Manipulation nachweisbar. Wenn versiegelte Attestierungen von
Krankenhäusern angenommen werden, die ~20 Prozent der
HRRP-berechtigten Aufnahmen über 5 Jahre vertreten, und wenn
die resultierende Nachweisbarkeit auch nur ~10 Prozent der
Manipulation abschreckt, die sonst auftreten würde, liegt der
öffentliche Gesundheitswert in besserer Entlassungsplanung für
einen Teil der Patienten, die sonst zur-Manipulation-entlassen
worden wären statt zur-tatsächlichen-Genesung-entlassen. Dies in
eine Zahl von Leben zu übersetzen ist schwierig, und das Kit
verweigert die Veröffentlichung einer einzigen
Opferzahlenschätzung, die als maßgeblich zitiert würde — die
Inferenzkette von "Manipulation reduziert um X" zu "verhinderte
Todesfälle Y" läuft durch mehrere schlecht identifizierte
Parameter (welcher Anteil manipulierter Entlassungen
vermeidbare Mortalität produzierte, die kontrafaktische
Versorgungsqualität, die Risikoverteilung über
manipulations-anfällige Kohorten), und jede spezifische als
Opferzahlenschätzung zitierte Zahl würde Präzision erfinden,
die die Daten nicht stützen.

**Die ehrliche Rahmung:**

Der Adoptionsfall lautet nicht "dieses Kit wird N Leben retten".
Er lautet: *wenn Sie glauben, dass die veröffentlichte
HRRP-Manipulationsliteratur (Wadhera, Khera, Gupta, Zuckerman
und andere) ungefähr korrekt ist, dass Manipulation einen
messbaren Bruchteil der scheinbaren HRRP-Verbesserung seit 2012
ausmacht, dann ist eine manipulationsbeständige monatliche
Attestierung das billigste verfügbare Primitiv, das diese
Manipulation öffentlich über Monate hinweg diffbar macht. Die
Versiegelung stoppt die Manipulation nicht; sie macht einen
Kanal davon auditierbar. Diese Auditierbarkeit ist es, die
sozialen Druck auf Krankenhäuser erzeugt, nicht zu manipulieren.
Der soziale Druck ist es, der (einen Bruchteil der)
tatsächlichen Versorgungsverbesserung erzeugt. Die geretteten
Leben liegen stromabwärts von drei kausalen Schritten, die die
Versiegelung selbst nicht ausführt. Adoptieren Sie das Kit auf
diesem Verständnis, nicht auf einem Lebensrettungs-Versprechen.*

Die Kit-Voreinstellungen sind absichtlich konservativ bei
Pro-Patienten-Daten (Verweigerungsregel R1), aggressiv bei
Pro-Arzt-Vergeltungsverhinderung (Verweigerungsregel R2) und
aggressiv beim "dies ist kein Qualitätsanspruch"-Disclaimer.
Krankenhäuser in Gerichtsbarkeiten, in denen spezifische
öffentliche Offenlegungsanforderungen unterschiedlich sind, können
ihren Fork entsprechend ändern, aber die Standardverweigerungen
begünstigen Patientenprivatsphäre, Schutz der
Kliniker-Fürsprache und ehrlichen Umfang.

## Historische Muster, bei denen das Kit geholfen hätte

Das Kit hätte ein nützliches Monat-für-Monat-forensisches Register
produziert — *keine Behebung* — in den folgenden dokumentierten
Mustern:

- **HRRP-Ära Wachstum des Beobachtungsstatus.** Mehrere Studien
  dokumentierten ein erhebliches Wachstum von Beobachtungsstatus-
  Entlassungen über US-Krankenhäuser hinweg, das mit der
  HRRP-Implementierung zusammenfiel (Sheehy et al.; Zuckerman et
  al.). Eine pro-Krankenhaus versiegelte monatliche
  Beobachtungszählung mit Aufschlüsselung der Begründungskategorie
  (FACT 06) hätte den Zeitpunkt und das Ausmaß des Beitrags jedes
  Krankenhauses zu diesem Muster öffentlich diffbar gemacht,
  anstatt erst Jahre später in retrospektiver landesweiter
  aggregierter Forschung sichtbar zu sein.
- **HRRP-Strafdisparitäten, die Sicherheitsnetz-Krankenhäuser
  betreffen.** Krankenhäuser, die mehr benachteiligte Bevölkerungen
  versorgen, sehen sich höheren HRRP-Strafen unter der
  Standard-Risikoadjustierung gegenüber (pro mehreren Khera et
  al.-Analysen); eine versiegelte monatliche Zahler-Aufschlüsselung
  (FACT 05) würde es der Öffentlichkeit ermöglichen, Fallmix-
  Änderungen separat von Ratenänderungen für jedes Krankenhaus zu
  verfolgen, was es ermöglicht, tatsächliche Ratenverbesserung von
  Fallmix-Verschiebung zu unterscheiden.
- **Within-System-Verlegungsmuster in
  Mehrere-Einrichtungen-Gesundheitssystemen.** Einige
  Mehrkrankenhaussysteme wurden dokumentiert, Bedürfnisse nach der
  Entlassung durch within-System-Einrichtungen auf Wegen zu
  leiten, die nicht immer als Verlegungen in HRRP-Messungen
  erscheinen. Eine versiegelte monatliche Verlegungszählung mit
  Within-System-Flag (FACT 07) würde dies pro Einrichtung pro
  Monat öffentlich nachverfolgbar machen.

Das Kit hätte die zugrunde liegenden Streitigkeiten über die
HRRP-Risikoadjustierungsmethodik, darüber, ob HRRP per Saldo
hilfreich oder schädlich für Patientenergebnisse ist, oder darüber,
ob die Strafstruktur geändert werden sollte, NICHT gelöst. Das sind
politische Debatten stromaufwärts der Versiegelung.

## Lizenz

Public Domain (CC0). Forken Sie es. Keine Zuschreibung erforderlich.
