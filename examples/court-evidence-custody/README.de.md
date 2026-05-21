*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Kit zur Versiegelung der Beweismittelkette bei Gericht

Ein schlüsselfertiges myriam-kit-Beispiel für forensische Sicherstellungsteams — IT-forensische Sachverständige, Techniker für die Auswertung mobiler Endgeräte, Verwahrer von Bodycam-Beweismitteln, Laborleitungen —, die ein Bitcoin-verankertes, manipulationssicheres Siegel darüber veröffentlichen möchten, *welche Bytes sichergestellt wurden* und *wann*, im Moment der digitalen Beweissicherung, damit Streitigkeiten über die Beweismittelkette einen öffentlichen Anker haben.

---

## Was dieses Kit NICHT leistet (zuerst lesen)

Das Siegel ist ein kryptografischer Zeitstempel darüber, WELCHE FORENSISCHEN ABBILDER sichergestellt wurden, WANN sie sichergestellt wurden, durch WELCHE BEHÖRDE, unter WELCHEM DURCHSUCHUNGSBESCHLUSS und mittels WELCHER METHODIK. Es kann darüber hinaus keine Frage zum Verfahren beantworten. Folgendes liegt **außerhalb des Wirkungsbereichs des Siegels**:

1. **Zulässigkeit nach den Federal Rules of Evidence (oder einer anderen Beweisordnung).** Das Siegel verankert Bytes und Zeitstempel. Ob ein Beweismittel zulässig ist — nach FRE 901 (Authentifizierung), FRE 702 (Sachverständigenaussage / Daubert), FRE 403 (Nachteilsabwägung) oder einem einzelstaatlichen Äquivalent — ist eine Rechtsverfahrensfrage. Eine einwandfrei versiegelte Sicherstellung kann dennoch als unzulässig zurückgewiesen werden; eine nicht versiegelte Sicherstellung kann dennoch zugelassen werden. Das Siegel ist zusätzlicher Integritätsbeweis, kein Ersatz für die Zulässigkeitsentscheidung des Gerichts.

2. **Ob die Sicherstellung rechtmäßig war.** Konformität mit dem Vierten Verfassungszusatz, Wirksamkeit des Durchsuchungsbeschlusses, Einhaltung des Umfangs, Anwendbarkeit der Beweisausschlussregel — all das liegt vor dem Siegel. Das Siegel hält fest, dass die Sicherstellung unter dem Beschluss FICT-SW-2026-0188 erfolgte; ob der Beschluss rechtmäßig erlassen und rechtmäßig vollstreckt wurde, ist Sache des Gerichts.

3. **Ob das Beweismittel be-, entlastend oder neutral ist.** Das Siegel verankert Hashes; Interpretationen dessen, was diese Hashes enthalten, gehören in den forensischen Untersuchungsbericht, der ein eigenes Dokument mit eigenem Discovery- und Beweisregime ist. Das Siegel wird sich weigern, „TATSACHE N: Das Laptop des Verdächtigen enthielt belastendes Material" zu versiegeln — siehe Ablehnungsregel R4.

4. **Ob die Beweismittelkette nach dem Beweisrecht des einschlägigen Bundesstaats verfahrensgemäß zustande gekommen ist.** Das Siegel verzeichnet das zeitgleich geführte Verwahrereignisprotokoll der Behörde (TATSACHE 05). Ob dieses Protokoll die Anforderungen an die Beweismittelkette eines bestimmten Bundesstaats erfüllt, entscheidet das Gericht in der Beweisaufnahme.

5. **Ob die forensische Methodik zuverlässig war.** Daubert und seine Nachkommen (sowie einzelstaatliche Pendants wie Frye, soweit anwendbar) prüfen methodische Zuverlässigkeit. Das Siegel hält fest, WELCHE Werkzeuge und Versionen verwendet wurden (TATSACHE 04); ob diese Werkzeuge den Zuverlässigkeitsstandard eines konkreten Gerichts erfüllen, ist Sache des Gerichts. Werkzeug-Bugs sind in vergangenen Fällen post-acquisition dokumentiert worden; die Rolle des Siegels besteht darin, den Versions- und Binär-Hash-Eintrag öffentlich widerlegbar zu machen, nicht darin, für die Werkzeuge selbst zu bürgen.

6. **Ob das Beweismittel VOR der Sicherstellung manipuliert wurde.** Das Siegel verankert Bytes ab dem Moment des Imaging. Falls ein Verdächtiger, ein Beamter oder ein Dritter das Quellgerät vor dem Imaging verändert hat, kann das Siegel das nicht erkennen — es versiegelt die veränderten Bytes mit derselben Integrität, mit der es das Original versiegeln würde. Der Wert des Siegels beginnt mit dem Imaging-Zeitstempel.

7. **Ob der Umfang des Durchsuchungsbeschlusses gewahrt wurde.** Der Beschluss-Rider legt fest, was sichergestellt werden darf; das Siegel hält fest, was sichergestellt WURDE. Ob die Sicherstellung den Umfang des Beschlusses überschritten hat, ist erneut eine Rechtsfrage mit eigenem Rechtsbehelf (Antrag auf Beweisverwertungsverbot nach dem Verfahren des jeweiligen Bundesstaats).

8. **Wiederidentifizierung einer privaten Verfahrensbeteiligten.** Das Siegel weigert sich, jeden Namen, jede Kennung oder jeden Fingerabdruck zu veröffentlichen, mit der/dem ein Verdächtiger, Angeklagter, Geschädigter, Zeuge oder ein anwesender Bewohner wiedererkannt werden könnte. Die Aktenzeichen-Referenz ist die geeignete Kennung für Beteiligte mit Standing zur Auffindung des Falles.

**Der Abschnitt über die ehrlichen Grenzen oben ist der tragende Teil dieses Kits.** Forensische Teams, die meinen, Versiegelung sei gleichbedeutend mit Zulässigkeit, werden es als Schutzschild verwenden. Das Kit muss klar sagen: *Dies ist ein Nicht-Abstreitbarkeits-Primitiv für den Sicherstellungsmoment, kein Nachweis rechtmäßiger Sicherstellung, methodischer Stichhaltigkeit oder gerichtlich anerkannter Beweismittelkette.*

---

## Was dieses Kit ABLEHNEN MUSS zu versiegeln

Das Kit ist so konfiguriert, dass es die folgenden Tatsachenmuster ablehnt, selbst wenn ein Nutzer mit gültiger Behörden-Signaturberechtigung sie einreicht:

- **Personenbezogene Identifizierung von Verdächtigen, Angeklagten, Geschädigten, Zeugen oder beliebigen privaten Dritten.** Die Aktenzeichen-Referenz ist die Kennung für Beteiligte mit Standing; das öffentliche Siegel darf kein Wiedererkennungsindex sein.
- **Personennamen forensischer Sachverständiger oder anderer Behördenmitarbeiter im öffentlichen Siegel.** Rollen sind öffentlich; Personen-Rollen-Zuordnungen werden separat versiegelt und sind im Wege gerichtlicher Anordnung zugänglich.
- **Datei-Hashes (oder Fingerprints) mutmaßlichen Materials sexuellen Kindesmissbrauchs, biometrischer Templates oder beliebiger personenwiedererkennbarer Daten verletzlicher Personen — auch per Hash.** Ein SHA-256 einer einzelnen Datei ist eine dauerhafte, durchsuchbare Kennung; ihre Veröffentlichung auf einem öffentlichen Ledger kann Betroffene durch Korrelation mit privaten Datenbanken erneut viktimisieren. Abbild-Hashes (auf forensischer Abbild-Ebene) ganzer Festplatten sind zulässig; Datei-Hashes solchen Materials sind NIEMALS zulässig.
- **Untersuchungsergebnisse, Interpretationen, Auffassungen oder Schlussfolgerungen darüber, was die Bytes bedeuten.** Das Siegel verankert WELCHE BYTES sichergestellt wurden und WANN. Die Interpretation gehört in den Discovery-pflichtigen Untersuchungsbericht, nicht auf ein manipulationssicheres öffentliches Ledger.
- **Zulässigkeitsaussagen oder andere rechtliche Schlussfolgerungen** („dieses Beweismittel ist zulässig", „der Beschluss war rechtmäßig", „die Beweismittelkette war ordnungsgemäß nach §X.Y"). Rechtliche Schlussfolgerungen sind Aufgabe des Gerichts.
- **Versiegelung durch andere als den autorisierten Vertreter der sicherstellenden Behörde.** Ein Sachverständiger der Verteidigung kann das Kit verwenden, um seine eigene unabhängige Verifikation des Manifests zu versiegeln; er darf nicht die URSPRÜNGLICHE Sicherstellung im Namen der sicherstellenden Behörde versiegeln.
- **Rollen-zu-Personen-Zuordnungen innerhalb des öffentlichen Siegels.** Zuordnungen werden in einem separaten Begleit-Datensatz (gehasht in TATSACHE 05) unter Zugriffskontrolle der Behörde versiegelt.
- **Ermittlungstatsachen vor der Sicherstellung oder vor dem Beschluss.** Informantenaussagen, Vorab-Überwachung vor dem Beschluss, parallel construction-Inputs — nichts davon gehört auf das Sicherstellungssiegel. Das Siegel ist auf das Sicherstellungsereignis beschränkt.

Eine Ablehnung selbst kann als Tatsache versiegelt werden („Diese Behörde hat die Versiegelung von X beantragt; das Kit hat unter Ablehnungsregel Y abgelehnt") und erzeugt damit ein öffentliches Protokoll des Versuchs missbräuchlicher Nutzung.

---

## Was dieses Kit versiegelt

8 Tatsachen im Moment der Sicherstellung:

1. **Beispiel-Hinweis** — erklärt die Veröffentlichung zum Beispiel (echte Bezeugungen entfernen oder ersetzen dies).
2. **Sicherstellungskontext** — Aktenzeichen, Beschluss-Zitat, sicherstellende Behörde, anfordernde Stelle, Datum/Uhrzeit der Sicherstellung und der Sicherung, Ort der Sicherung (der Ort der Sicherstellung wird in einen separat versiegelten Begleit-Datensatz redigiert, um die Wiedererkennung der Räumlichkeiten zu vermeiden).
3. **Beweismittel-Manifest** — pro forensischem Abbild: SHA-256-Hash, Dateigröße, anonymisierte Quellgerätekennung, Sicherungsmethode, forensisches Abbildformat.
4. **Sicherungsmethodik** — Namen der forensischen Werkzeuge und genaue Versionen (mit Hashes der Werkzeug-Binärdateien), Marke/Modell und Firmware des Write-Blockers, NIST-CFTT-Verifikationsreferenz, verwendete Verifikationsprozedur, Wahl des Abbildformats.
5. **Beweismittelkettenprotokoll** — Zeitlinie pro Ereignis von der ersten Sicherstellung bis zum Ende des Imaging, Verwahrer nach ROLLE (nicht nach Namen) identifiziert, mit Hashes separat versiegelter Begleit-Datensätze (Rollen-zu-Personen-Zuordnung, Transport-GPS-Log, Beweismittelschrank-Zugriffslog, Fotografien der manipulationssicheren Versiegelung usw.).
6. **Qualifikation des Sachverständigen nach Rolle** — gehaltene Zertifizierungen, Status der Fortbildung, Anzahl früherer Sachverständigeneinsätze, Daubert-Exposition, Offenlegung von Interessenkonflikten — alles auf Rollenebene, nicht personenbezogen.
7. **Begleitende Offenlegungen und Ablehnungsprotokoll** — parallele Ermittlungen, anhängige Anfechtungen des Beschlusses, Anträge auf Beweisverwertungsverbot, geltendes Privilegienfilter- / Taint-Team-Protokoll, frühere Sicherstellungsversuche, Auswertung der Anbieter-Bugtracker; ausdrückliche Liste der vom Kit abgelehnten Muster.
8. **Unterzeichnender Vertreter** — Identifikation der sicherstellenden Behörde + Unterzeichner auf Rollenebene (leitender Sachverständiger) + Mit-Unterzeichner auf Rollenebene (Einheits-Supervisor) + Informationen zum kryptografischen Schlüssel.

Jede Tatsache endet mit der Konvention des Ablehnungs-Gates: *„Diese Tatsache behauptet nur X. Sie behauptet nicht Y"* (wobei Y der nächstgelegene Versagensmodus aus dem obigen Abschnitt „NICHT leistet" ist).

---

## Wogegen dieses Kit absichert

- **Stille nachträgliche Veränderung eines forensischen Abbilds.** Jede Veränderung auf Byte-Ebene eines beliebigen Abbilds erzeugt einen anderen SHA-256, und das veränderte Abbild lässt sich nicht gegen das versiegelte TATSACHE-03-Manifest verifizieren.
- **Behauptung, „andere Werkzeuge wurden verwendet".** TATSACHE 04 hält genaue Werkzeugversionen mit Binär-Hashes fest; spätere Behauptungen wie „wir haben tatsächlich v4.7.0 statt v4.7.1 verwendet" sind öffentlich widerlegbar.
- **Behauptung, der Write-Blocker sei nicht angeschlossen oder ein anderes Modell gewesen.** TATSACHE 04 friert das Write-Blocker-Manifest ein.
- **Veränderung des Verwahrprotokolls.** Jede Änderung der TATSACHE-05-Ereigniszeitlinie (Hinzufügen, Entfernen oder Umzeitstempelung eines Ereignisses) ändert den TATSACHE-05-Hash und ist öffentlich erkennbar.
- **Substitution der Qualifikationsnachweise eines anderen Sachverständigen.** TATSACHE 06 friert das Qualifikationsprofil auf Rollenebene zum Sicherstellungszeitpunkt ein.
- **Selektives Auslassen begleitender Offenlegungen.** TATSACHE 07 zählt die erwarteten Offenlegungskategorien auf; eine leere Kategorie muss ausdrücklich attestiert werden („keine zum Sicherstellungszeitpunkt"), sodass ein späteres „wir haben nicht erkannt, dass das relevant war" öffentlich widerlegbar ist.
- **Nachträgliche Behauptungen, der Sachverständige habe einen nicht offengelegten Interessenkonflikt gehabt.** Die Konfliktoffenlegung in TATSACHE 06 ist zum Sicherstellungszeitpunkt eingefroren; spätere Einwände können dagegen geprüft werden.

Das Kit sichert **nicht** gegen zeitgleiche Korruption ab — ein Team, das vorsätzlich falsche Metadaten zum Sicherstellungszeitpunkt versiegelt, erzeugt ein kryptografisch gültiges Siegel falscher Metadaten. Das Primitiv ist hierin ehrlich: Es ist ein Nicht-Abstreitbarkeits-Primitiv für die zeitgleichen Behauptungen der Behörde, kein Nachweis dafür, dass diese Behauptungen richtig sind.

---

## Historische oder fast historische Fälle, bei denen das Kit geholfen hätte

Das Kit hätte einen nützlichen Anker — *keine Lösung* — in vergangenen Fällen geliefert, in denen die digitale Beweismittelkette zum streitigen Beweisthema wurde. Um keine Angeklagten zu benennen (die auch nach Verurteilung Privatpersonen bleiben), werden diese nach Fallart und nicht nach Person beschrieben:

- **Die bundesweite Forensik-Werkzeug-Bug-Kontroverse Mitte der 2010er Jahre**, bei der ein weit verbreitetes forensisches Imaging-Werkzeug nach der Sicherstellung als fehlerbehaftet bei einer bestimmten Quellmedienart entdeckt wurde. Ein versiegeltes Sicherstellungs-Manifest mit eingefrorenen Daten zu Werkzeugversion und Binär-Hash hätte Verteidigung und Anklage erlaubt, sich genau auf die verwendete Version zu einigen und damit eine Streitachse zu beseitigen.

- **Mehrere einzelstaatliche Fälle mit umstrittenen Mobilgeräte-Auswerteergebnissen**, in denen der Werkzeughersteller später einen Bugfix-Patch veröffentlichte und die Frage lautete, „ob der Bug diesen Fall betraf". Eine versiegelte Methodik-Tatsache erlaubt es, die Frage gegen eingefrorene Versionsdaten zu beantworten, statt gegen die aktuelle Erinnerung der Behörde an die verwendete Version.

- **Streitigkeiten um die Übergabe von Bodycam-Material** in Fällen, in denen später behauptet wurde, das Docking-System des Bodycam-Anbieters habe die Veränderung des Materials beim Transfer ermöglicht. Ein versiegeltes Manifest des Bodycam-Archivs zum Zeitpunkt der Übernahme durch die Behörde verankert, welche Bytes die Behörde vom Docking-System erhielt; spätere Bearbeitungen auf Behördenseite sind öffentlich erkennbar.

- **Hash-Kollisions-Kontroversen in IT-forensischen Fällen**, in denen ein Sachverständiger der Verteidigung argumentierte, dass MD5 (noch in einigen Legacy-Workflows in Gebrauch) unzureichend sei. Eine versiegelte Sicherstellung, die SOWOHL MD5 ALS AUCH SHA-256 festhält, lässt den SHA-256 bestehen, selbst wenn der MD5 angefochten wird.

- **Streitigkeiten über die Entwicklung der Untersuchungsmethodik zwischen Sicherstellung und Verhandlung.** Wenn ein Fall jahrelang zwischen Sicherstellung und Verhandlung liegt, kann die zum Zeitpunkt der Sicherstellung standardgemäße Methodik zum Verhandlungszeitpunkt überholt sein. Der versiegelte Datensatz erlaubt es dem Gericht, die Methodik gegen den zum Sicherstellungszeitpunkt aktuellen Standard zu bewerten, nicht gegen den späteren Standard.

Das Kit hätte die zugrunde liegenden Streitigkeiten über Schuld oder Unschuld in keinem dieser Falltypen gelöst. Es hätte einen spezifischen Beweisteilstreit gelöst: ob Bytes, Werkzeuge und Verfahren das waren, was die Behörde zum behaupteten Zeitpunkt behauptet hat.

---

## Wann dieses Kit einzusetzen ist

- Ihre Behörde verfügt über eine stabile forensische SOP und möchte eine Bitcoin-verankerte öffentliche Bezeugung als manipulationssichere Schicht über die bestehende papier- und unterschriftenbasierte Beweismittelkette legen.
- Sie erwarten in diesem Verfahren eine erhebliche Verteidigungsanfechtung des forensischen Beweismaterials (Hochrisikofall, neuartige Methodik, umstrittene Werkzeugversionen usw.).
- Sie können den aufgeführten Tatsachensatz veröffentlichen, ohne PII oder personenwiedererkennbare Daten verletzlicher Personen offenzulegen. (Die Ablehnungsregeln des Kits erzwingen dies; falls Ihre Tatsachen einen Bruch einer Ablehnungsregel erfordern würden, verwenden Sie das Kit nicht.)
- Die Rechtsabteilung der sicherstellenden Behörde und die Staatsanwaltschaft haben den Veröffentlichungsplan geprüft. Die öffentliche Veröffentlichung eines aktenzeichenführenden Artefakts hat Implikationen für laufende Ermittlungen; die Prüfung durch die Rechtsabteilung ist nicht optional.
- Die Discovery-Regeln der Verteidigung in Ihrer Jurisdiktion sind damit vereinbar, dass die Behörde den Rollen-zu-Personen-Zuordnungs-Datensatz (gehasht in TATSACHE 05) separat führt. Verlangt Ihre Jurisdiktion die öffentliche Offenlegung von Sachverständigennamen, müssen Sie das Kit entsprechend anpassen.

## Wann dieses Kit NICHT einzusetzen ist

- **Nicht als Ersatz für die bestehende Beweismittelketten-Dokumentation der Behörde verwenden.** Dieses Kit ist *additiv*, nicht ersetzend. CMS, Verwahrprotokoll und Discovery-Pflichten der Behörde bleiben unverändert.
- **Nicht verwenden, wenn die Sicherstellung CSAM, biometrische Templates oder andere personenwiedererkennbare Daten verletzlicher Personen auf Dateiebene umfasst.** Abbild-Hashes ganzer Festplatten sind zulässig; Datei-Hashes solchen Materials sind NIEMALS zulässig, auch nicht im Wege der Verzichtsregelung der Ablehnungsregel. Wenn Sie keinen Tatsachensatz konstruieren können, ohne R3 zu brechen, verwenden Sie das Kit nicht.
- **Nicht verwenden, um zu behaupten, der Beschluss sei rechtmäßig, die Sicherstellung sei ordnungsgemäß oder das Beweismittel sei zulässig** — das Kit kann das nicht leisten, und Ablehnungsregel R5 weist jede solche Behauptung zurück.
- **Nicht unter Druck verwenden, vor Abschluss der Sicherstellung zu versiegeln.** Ein Siegel über eine unvollständige Sicherstellung stellt den Zustand falsch dar.
- **Nicht verwenden, um Personennamen von Sachverständigen zu veröffentlichen**, sofern Ihre Jurisdiktion dies nicht ausdrücklich verlangt und Ihre Sachverständigen nicht jeweils zugestimmt haben. Standard ist die Veröffentlichung auf Rollenebene.
- **Nicht in versiegelten oder unter Verschluss stehenden Verfahren** ohne ausdrückliche gerichtliche Erlaubnis verwenden. Die Veröffentlichung eines Aktenzeichens auf Bitcoin ist unumkehrbar; wird das Verfahren später unter Verschluss gestellt, kann das öffentliche Siegel nicht zurückgezogen werden. Das Kit ist nur für öffentlich-aktenkundige Sicherstellungen geeignet.
- **Nicht als Legitimitätstheater verwenden.** Ein Siegel einer mangelhaften Sicherstellung ist ein dauerhaftes öffentliches Protokoll der Mängel, keine Verteidigung dagegen. Das Primitiv schneidet in beide Richtungen; das ist seine Ehrlichkeit.

## Wie man dieses Kit für eine reale Sicherstellung forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # fiktiven Inhalt durch echten ersetzen
                       # Ablehnungsregeln R1-R8 durchgängig anwenden
bash build/seal.sh     # ZUM Zeitpunkt oder unmittelbar nach Abschluss des Imaging versiegeln
python3 build/verify.py
```

**Kritisches Timing:** Versiegeln SIE ZUM Zeitpunkt oder unmittelbar nach Abschluss des Imaging (Ereignis E17 in TATSACHE 05 der Beispiel-Zeitlinie). Ein Siegel während des Imaging erzeugt einen Datensatz über eine Teil-Sicherstellung; ein viel späteres Siegel erzeugt eine Lücke, in der die Behörde die Abbilder hätte verändern können. Das richtige Fenster ist unmittelbar nach Abschluss der Abbildverifikation für den letzten Posten des Beweismittelsatzes.

**Kritische Begutachtung:** Lassen Sie die Veröffentlichung vor der Versiegelung durch einen zweiten forensischen Sachverständigen (nicht den leitenden) und durch die Rechtsabteilung der Behörde laufen. Einmal versiegelt, ist die Veröffentlichung dauerhaft.

## Integration mit bestehender Beweismittelketten-Infrastruktur

- **Behördliches Case-Management-System (CMS).** Das CMS bleibt das primäre System of Record der Behörde. Das Siegel ersetzt das CMS nicht; es verpflichtet sich auf Bytes und Methodik, die das CMS protokolliert, sodass nachträgliche CMS-Bearbeitungen öffentlich erkennbar sind.
- **Federal Rules of Evidence / Daubert / einzelstaatliche Beweisordnungen.** Das Siegel trägt zur Authentifizierungsdokumentation nach FRE 901 durch manipulationssichere Integrität bei. Es erfüllt FRE 702 / Daubert NICHT für sich allein; die methodische Zuverlässigkeit wird weiterhin in der Beweisaufnahme geprüft.
- **Discovery der Verteidigung (FRCP 16, Brady, Giglio und einzelstaatliche Äquivalente).** Die in TATSACHE 05 gehashten Begleit-Datensätze (Rollen-zu-Personen-Zuordnung, Verwahrprotokoll, Fotografien der manipulationssicheren Versiegelung usw.) unterliegen weiterhin der gewöhnlichen Discovery. Das Siegel verankert, was diese Datensätze zum Sicherstellungszeitpunkt behaupteten, sodass ein späteres „der Datensatz war damals anders" öffentlich widerlegbar ist.
- **NIST Computer Forensics Tool Testing (CFTT).** Das Kit referenziert CFTT-Verifikationslogs in TATSACHE 04 / TATSACHE 05; die Referenz ist ein Hash, nicht das Log selbst, sodass CFTT-Prozesse unberührt bleiben.
- **Gerichtlich bestellte Neutrale und Sachverständige der Verteidigung.** Beide können die forensischen Abbilder, die sie in der Discovery erhalten, gegen das TATSACHE-03-Manifest rehashen, unabhängig von einer Kooperation der Behörde. Dies ist der wichtigste Mehrwert des Kits für die Verteidigungsseite.
- **Revisionsverfahren.** Jahre später kann ein forensischer Berufungsgutachter die ursprüngliche Sicherstellungsmethodik gegen den versiegelten TATSACHE-04-Datensatz prüfen, statt gegen die möglicherweise weiterentwickelte aktuelle Erinnerung der Behörde.

## Was dieses Kit NICHT ersetzt

- Die Federal Rules of Evidence (oder eine einzelstaatliche Beweisordnung).
- Daubert- / Frye-Zuverlässigkeitsstandards für Sachverständigenaussagen.
- Die forensische SOP und das CMS der Behörde.
- Die Discovery-Pflichten der Verteidigung nach FRCP 16 / Brady / Giglio / einzelstaatlichen Äquivalenten.
- Gerichtliche Anordnungen, Beweisverwertungsanträge, Beweisaufnahmen oder andere gerichtlich verwaltete Verfahren.
- NIST CFTT oder ein anderes Werkzeug-Testregime.
- Das Privilegienfilter- / Taint-Team-Protokoll der Behörde.

## Warum dieses Kit in v0.4.0+ existiert

Dies ist das 8. ausgearbeitete Beispiel, das mit dem myriam-kit ausgeliefert wird. Es folgt der constraint-first-Struktur, die durch die in `~/Genesis/calc/PROMPT_LIBRARY_v0.md` dokumentierte Autoresearch validiert wurde — die constraint-first-Prompt-Variante erzielte in einer gewichteten Rubrik über mehrere Beispieldomänen die höchste Punktzahl. Die einleitenden Abschnitte sind die tragenden Teile des Kits; der Manifestinhalt ist der leichte Teil.

Das Design des Kits ist bei der Veröffentlichung von Sachverständigennamen bewusst zurückhaltend und beim Disclaimer „dies begründet keine Zulässigkeit" bewusst nachdrücklich. Die forensische Community hat eine dokumentierte Geschichte, für ihre forensische Arbeit angegriffen zu werden; das Kit nimmt die sicherere Position für Sachverständige als Voreinstellung an. Behörden in Jurisdiktionen, in denen die öffentliche personenbezogene Nennung verpflichtend ist, können ihren Fork entsprechend anpassen, aber die Voreinstellung der Ablehnung begünstigt die Sicherheit der Sachverständigen.

## Lizenz

Public Domain (CC0). Forken Sie es. Keine Namensnennung erforderlich.
