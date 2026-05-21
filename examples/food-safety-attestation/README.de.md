*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Kit für Lebensmittelsicherheits-Attestierung

Ein schlüsselfertiges myriam-kit-Beispiel für Lebensmittelhersteller,
Lebensmittelsicherheitsinspektoren, Drittzertifizierer und
Aufsichtsbehörden, die ein Bitcoin-verankertes, manipulationssicheres
Siegel darüber veröffentlichen möchten, *was die Freigabeprüfungen
aussagten* und *welche Freigabeentscheidung getroffen wurde* — und
zwar zum Zeitpunkt der Chargenfreigabe oder der Unterzeichnung des
Inspektionsberichts —, sodass eine stille nachträgliche Veränderung
des Prüfprotokolls, der Freigabeentscheidung oder der
Rückrufverpflichtungen öffentlich erkennbar wird.

---

## Was dieses Kit NICHT leistet (zuerst lesen)

Das Siegel ist ein kryptografischer Zeitstempel darüber, WELCHE
Freigabeprüfungen an WELCHER Charge, durch WELCHE akkreditierten
Laboratorien, nach WELCHEN Methoden und mit WELCHEN Ergebnissen
durchgeführt wurden, und welche FREIGABEENTSCHEIDUNG die QA-Stelle
auf Grundlage dieser Ergebnisse getroffen hat. Es kann darüber
hinaus keine Aussage zur Lebensmittelsicherheit beantworten.
Folgendes liegt **außerhalb der Domäne des Siegels**:

1. **Verhinderung von Kontamination.** Das Kit verankert, was die
   Testergebnisse bei der Freigabe AUSSAGTEN. Kontamination hat
   viele Ursachen — heterogene mikrobielle Verteilung innerhalb
   einer Charge, Temperaturmissbrauch in der Distribution nach der
   Freigabe, Handhabungsfehler im Einzelhandel, Fehler bei der
   Zubereitung durch Verbraucher, neuartige oder nicht erfasste
   Gefahren (z. B. Melamin-Verfälschung, bevor das Melamin-Screening
   Routine wurde), Lieferketten-Betrug oberhalb des Prüfumfangs des
   Herstellers. Das Siegel verhindert nichts davon und erhebt
   diesen Anspruch auch nicht.

2. **Garantie, dass alle Einheiten einer bestandenen Charge sicher
   sind.** Mikrobiologische Kontamination in losen Lebensmittel-
   Produkten ist HETEROGEN. Listeria-, Salmonella- und STEC-
   Erreger treten in niedrig-prävalenten lokalen Hotspots auf,
   nicht gleichmäßig verteilt. ICMSF- und Codex-Stichprobenpläne
   haben eine dokumentierte, begrenzte Wahrscheinlichkeit, eine
   bei geringer Prävalenz vorhandene Kontamination zu entdecken —
   die Wahrscheinlichkeit ist NICHT 1. Eine Charge, die die
   Freigabestichprobe besteht, kann immer noch kontaminierte
   Einheiten enthalten, die nicht beprobt wurden. Das Siegel
   verankert die PROBEN, nicht die Masse. Diese Einschränkung wird
   in FAKT 03 ausdrücklich wiederholt und ist die wichtigste
   ehrliche Grenze dieses Kits.

3. **Bescheinigung, dass die Freigabeprüfungen ehrlich durchgeführt
   wurden.** Das Siegel verankert, was die Tests bei der Freigabe
   berichtet haben. Ein Labor, das bei der Freigabe ein betrügerisches
   BESTANDEN meldet, erzeugt ein kryptografisch gültiges Siegel
   eines betrügerischen BESTANDEN. Das Kit macht spätere stille
   Modifikationen erkennbar, deckt aber keinen zeitgleichen Betrug
   auf. Die Erkennung zeitgleichen Betrugs erfordert Audits,
   Aufsicht der Laborakkreditierung (ISO-17025-Überwachung),
   Eignungsprüfungsprogramme und behördliche Inspektionen — all
   das liegt oberhalb des Siegels.

4. **Ersatz für FSMA-, FSIS- oder behördliche Einreichungen
   gemäß EU-Recht.** Freigabedaten gemäß FSMA, FSIS, EU-Verordnung
   (EG) 178/2002 und Codex Alimentarius werden gesetzlich
   vorgeschrieben geführt und auf Anforderung der Aufsichtsbehörde
   vorgelegt. Das Siegel fügt eine öffentliche manipulations-
   sichere Schicht OBERHALB dieser Einreichungen hinzu; es ersetzt
   sie NICHT. Eine versiegelte Veröffentlichung ist keine
   behördliche Meldung.

5. **Auflösung von Streitigkeiten über den Rückrufumfang.** Das
   Kit kann die bei der Freigabe abgegebenen Rückrufverpflichtungen
   (FAKT 06) und einen späteren Rückrufumfang als neue Publikation
   versiegeln; aber die Frage, welche Chargen betroffen sind,
   welche Einheiten ausgeliefert wurden, welche Einzelhändler sie
   erhalten haben und welche Verbraucher exponiert wurden, bleibt
   eine Frage der Rückverfolgung und Vorwärtsverfolgung. Das
   Siegel verankert, wozu sich der Hersteller VERPFLICHTET hat
   und was er später TAT. Es löst nicht die zugrunde liegende
   epidemiologische Frage.

6. **Erkennung vorsätzlichen Lieferkettenbetrugs oberhalb des
   Prüfumfangs.** Die Melamin-Verfälschung von Milch und Säuglings-
   nahrung in China im Jahr 2008 gelang, weil Melamin nicht im
   Analyt-Panel war — gemessen wurde der Stickstoffgehalt als
   Protein-Äquivalent, und Melamin fälschte diesen Wert vor. Ein
   versiegelter FAKT 03 mit dem zum damaligen Zeitpunkt
   verwendeten Analyt-Panel hätte sich öffentlich auf dieses Panel
   festgelegt — aber nichts dazu beigetragen, den außerhalb des
   Panels liegenden Verfälschungsstoff zu erkennen. Der Wert des
   Siegels wäre in jenem Fall die forensische Verankerung des
   "dies ist, wofür der Hersteller zu testen vorgab" gewesen,
   NICHT Prävention. Ein echtes Lebensmittelsicherheitsregime
   adressiert dies durch unangekündigte Aufsichtsbeprobungen mit
   breitbandigem Screening (etwa LC-MS-untargetierte Methoden),
   was oberhalb des Hersteller-Siegels liegt.

7. **Verankerung der Distribution nach der Freigabe und der
   Verbraucherhandhabung.** Sobald die Charge die Anlage verlässt,
   liegen Temperaturmissbrauch während der Distribution, falsche
   Behandlung im Einzelhandel, Lagerungsfehler durch Verbraucher
   und Zubereitungsfehler durch Verbraucher allesamt außerhalb
   des Geltungsbereichs. Das Siegel ist auf das Freigabeereignis
   des Herstellers beschränkt. Manipulationssicherheit im
   nachgelagerten Bereich erfordert separate Kits auf der Ebene
   der Distributoren, Einzelhändler und (für institutionelle
   Verbraucher wie Schulen und Krankenhäuser) am Verbrauchsort.

8. **Bürgschaft für die Sicherheit von Lebensmitteln in einer
   bestimmten Bevölkerungsgruppe.** BESTANDEN-Ergebnisse in
   FAKT 03 implizieren keine Sicherheit für schwangere
   Verbraucherinnen, Säuglinge, immungeschwächte Verbraucher
   oder Senioren, für die Listeria monocytogenes und Salmonella
   ein dokumentiert erhöhtes Risiko bereits unterhalb
   konventioneller Nachweisgrenzen darstellen. Das Siegel kann
   keine populationsspezifische Sicherheitsaussage treffen und
   weigert sich, dies zu tun (Verweigerungsregel R6).

**Der obige Abschnitt zu den ehrlichen Grenzen ist der
lasttragende Teil dieses Kits.** Hersteller, die "wir haben unsere
Freigabedaten versiegelt" als gleichwertig mit "wir haben die
Sicherheit unserer Lebensmittel bewiesen" behandeln, missbrauchen
das Primitiv. Das Kit muss klar sagen: *Dies ist ein
Nicht-Bestreitbarkeits-Primitiv für die zeitgleichen Behauptungen
des Herstellers bei der Freigabe, kein Beweis der Sicherheit, kein
Ersatz für die behördliche Aufsicht und keine Verteidigung gegen
die heterogenen Kontaminations-, Lieferkettenbetrugs- oder
Fehlhandhabungs-Versagensmodi nach der Freigabe, die in
vergangenen Ausbrüchen Menschen das Leben gekostet haben.*

---

## Was dieses Kit VERWEIGERN MUSS zu versiegeln

Das Kit ist so konfiguriert, dass es die folgenden Sachverhalte
ablehnt, selbst wenn ein Nutzer mit gültiger Hersteller-Signatur-
berechtigung sie einreicht:

- **Persönliche Identifikation jedweden Arbeiters, Vorgesetzten,
  QA-Mitarbeiters, besuchenden Inspektors oder Drittauditors.**
  Namen, Personalnummern, Ausweisnummern, Sozialversicherungs-
  nummern, Wohnadressen, persönliche Telefonnummern — keine
  dieser Angaben erscheint im öffentlichen Siegel. Rollen sind
  öffentlich; die Bindung Person-zu-Rolle wird separat versiegelt
  und im Rahmen behördlicher Verfahren auffindbar. Der Schutz von
  Arbeitnehmern vor Vergeltung und Belästigung ist die
  lasttragende Einschränkung; die Lebensmittelsicherheits-
  Attestierung kann auf Rollenebene erfolgen. (R1)

- **Präzise Standortangabe der Anlage.** Die Region der Anlage
  (Bundesland oder Mehrstaatenregion) ist akzeptabel; eine genaue
  Straßenadresse, GPS-Koordinaten oder jede Kennung mit
  ausreichender Granularität, um die Anlage physisch auf einer
  Karte zu identifizieren, ist NICHT akzeptabel. Die behördliche
  Betriebsnummer ist die Kennung der Aufsichtsbehörde für die
  Anlage; Erwägungen der physischen Sicherheit und der
  Arbeitnehmersicherheit sprechen gegen die Veröffentlichung
  einer öffentlichen Adresse auf Bitcoin. (R2)

- **Persönliche Muster einzelner Produktionsschichten.**
  Schichtpläne, individuelle Arbeiterrotationen, persönliche
  IDs von Linienbedienern — keine dieser Angaben erscheint im
  Siegel. Lebensmuster einzelner Arbeiter dürfen aus der
  öffentlichen Attestierung nicht ableitbar sein. (R3)

- **Lieferantenidentitäten, die Verträge kompromittieren.**
  Lieferantennamen, Standorte von Lieferanteneinrichtungen,
  Chargencodes von Lieferanten (außer im Fall einer
  Lieferketten-Kontamination, in dem die Nennung der
  kontaminierten Charge eines Lieferanten aus Gründen der
  öffentlichen Gesundheit erforderlich ist und über eine
  separate versiegelte Publikation gehandhabt wird) werden im
  Freigabesiegel NICHT veröffentlicht. Viele Lieferverträge
  enthalten Vertraulichkeitsklauseln; das Siegel verletzt diese
  nicht standardmäßig. (R4)

- **Kundenlisten und Distributionsziele jenseits einer
  übergeordneten Ebene.** Eine übergeordnete regionale
  Zusammenfassung ist akzeptabel; spezifische Kundenlisten
  (Einzelhändler, Distributionszentren, Foodservice-Konten)
  sind NICHT akzeptabel. Kundenidentitäten sind vertraglich
  vertraulich und wettbewerblich sensibel; die Aufsichtsbehörde
  erhält die Kundenliste über etablierte Rückruf-
  Koordinationskanäle. (R5)

- **Sicherheitsaussagen oder rechtliche Schlussfolgerungen.**
  Das Kit wird "dieses Produkt ist sicher", "diese Charge erfüllt
  alle geltenden Lebensmittelsicherheitsstandards", "dies ist
  GRAS für diese Verwendung" oder jede andere Sicherheits- oder
  Rechtsschlussfolgerung nicht versiegeln. Das Kit verankert das
  Prüfprotokoll und die Freigabeentscheidung, NICHT eine
  Sicherheitsschlussfolgerung. (R6)

- **Re-Identifikationsmuster von Beschwerden oder
  Whistleblowern.** Das Kit verweigert die Veröffentlichung
  jeglichen Musters, das einen Arbeiter, der eine Beschwerde
  bei OSHA, USDA oder unternehmensintern bezüglich Lebensmittel-
  oder Arbeitssicherheitspraktiken eingereicht hat,
  reidentifizieren könnte. Solche Beschwerdeführer sind durch
  FSMA § 402 und parallele Gesetze geschützt; das Siegel darf
  nicht zum Reidentifikationsvektor werden. Whistleblower-
  Attestierungen haben ihr eigenes Kit
  (`examples/whistleblower-manifest`) mit für diesen Anwendungs-
  fall abgestimmten Verweigerungsregeln. (R7)

- **Versiegelung durch andere als den autorisierten Bevoll-
  mächtigten des freigebenden Herstellers.** Ein Drittzertifizierer,
  ein QA-Team eines Kunden oder ein unabhängiger Auditor kann
  dasselbe Kit verwenden, um SEINE eigenen Auditfeststellungen
  zu versiegeln; er darf jedoch NICHT die ursprüngliche
  Freigabeentscheidung im Namen des Herstellers versiegeln. Der
  Signatur-Bevollmächtigte in FAKT 08 ist der einzige gültige
  Unterzeichner hierfür. (R8)

Eine Verweigerung selbst kann als Fakt versiegelt werden ("Dieser
Hersteller hat die Versiegelung von X beantragt; das Kit hat dies
gemäß Verweigerungsregel Y abgelehnt"), wodurch ein öffentliches
Protokoll des Missbrauchsversuchs entsteht.

---

## Was dieses Kit versiegelt

8 Fakten zum Zeitpunkt der Freigabe:

1. **Beispielhinweis** — erklärt die Veröffentlichung zum Beispiel
   (echte Attestierungen entfernen oder ersetzen dies).
2. **Produkt- und Chargenidentifikation** — Produktname, Kategorie,
   Hersteller, Region der Anlage (NICHT präzise Lage), HACCP-
   Plan-Version + Hash, Chargen-ID, Produktions-/Verpackungs-/
   Verbrauchsdaten, Anzahl der Verbrauchereinheiten,
   Lageranforderungen, die drei kritischen Kontrollpunkte mit
   protokollierten Datensatz-Hashes (Garletalität, Kühlstabilisierung,
   RTE-Umgebung nach der Letalität).
3. **Ergebnisse der Freigabeprüfungen** — mikrobiologische
   Endprodukttests (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), chemische / Rückstandstests (Nitrit,
   Tierarzneimittelrückstände, Schwermetalle),
   Allergenkreuzkontaktverifizierung, Zusammenfassung der
   Umgebungsüberwachung, jeweils mit dem SHA-256 des vollständigen
   Bericht-PDFs und der ausdrücklichen Proben-vs.-Masse-
   Interpretationsbeschränkung.
4. **Methodik und Laborqualifikation** — welche Methode (und
   welche Version des Methodendokuments) pro Zeile verwendet
   wurde, welche Labore welche Tests durchgeführt haben, der
   ISO/IEC-17025:2017-Akkreditierungsstatus und Zertifikat-Hash
   jedes Labors, aktuelle Eignungsprüfungs-Ergebnisse,
   Unabhängigkeitserklärung, Abweichungs-/Wiederholungs-/
   OOS-Protokoll für diese Charge.
5. **Freigabeentscheidung** — Freigabedatum, Freigabeberechtigung
   + Gegenzeichnung auf Rollenebene, Zusammenfassung der
   entscheidungsstützenden Aufzeichnungen, übergeordnete
   Distributionsziele, bei der Freigabe anerkannte Pflichten
   nach der Freigabe, Zeitplan- und Unwiderruflichkeits-
   Verpflichtung.
6. **Rückruf- und Marktüberwachungsverpflichtungen nach dem
   Inverkehrbringen** — das Lebensmittelsicherheits-Analogon zur
   Pharmakovigilanz: Transparenz bei Krankheitssignalen,
   Verpflichtungen zur Rückrufdurchführung (24-Stunden- /
   72-Stunden- / 98-%-Schwellenwerte), Reaktion auf
   Lieferketten-Kontamination, Verpflichtung zur Nicht-Stillen-
   Wiederholungsprüfung, Verpflichtung zu Keine-Post-hoc-
   Spezifikationsänderungen, aggregierter Austausch von
   Sicherheitssignalen.
7. **Begleitoffenlegungen und Verweigerungsprotokoll** — Hash
   des Untersuchungsprotokolls für Korrekturmaßnahmen, jüngste
   Inspektionshistorie, Rückrufhistorie, bekannte offene
   Probleme in den verwendeten Prüfmethoden, Rolle-zu-Person-
   Bindung (separat versiegelt, hier gehasht), Bereitschaft zur
   Lieferantenrückverfolgung, ausdrückliche Liste der
   Verweigerungsregeln R1-R8 mit allen während dieser Freigabe
   ausgeübten Verweigerungen.
8. **Signatur-Bevollmächtigter** — Hersteller +
   rollenbasierter Unterzeichner (QA-Direktor) + rollenbasierte
   Gegenzeichnung (Werksleiter) + kryptografische
   Schlüsselinformationen; Begründung für die Veröffentlichung
   auf Rollenebene.

Jeder Fakt endet mit der Verweigerungs-Gate-Konvention: *"Dieser
Fakt behauptet nur X. Er behauptet nicht Y"* (wobei Y der nächste
Versagensmodus aus dem Abschnitt "NICHT leistet" oben ist).

---

## Wogegen dieses Kit verteidigt

- **Stille nachträgliche Modifikation der Freigabe-Prüfergebnisse.**
  Alle Prüfbericht-PDFs werden gehasht. Eine erneute Hashberechnung
  nach der Freigabe offenbart jede Modifikation.
- **Streit darüber, welche Methoden, welche Versionen der
  Methodendokumente und welche Labore verwendet wurden.** FAKT 04
  friert die Methodik und den Akkreditierungsstatus der Labore
  bei der Freigabe ein. Spätere Behauptungen wie "wir haben
  eigentlich MLG 4.13, nicht 4.12 verwendet" sind öffentlich
  widerlegbar.
- **Nachträgliche Neuspezifikation einer außerhalb der Spezifikation
  liegenden Charge.** Wenn ein Freigabe-Prüfergebnis tatsächlich
  ein grenzwertiges BESTANDEN war, das nach der Freigabe als
  DURCHGEFALLEN reklassifiziert wird, beweisen die versiegelten
  Bericht-Hashes, was das ursprüngliche Ergebnis-PDF aussagte.
  Symmetrisch ist ein grenzwertiges OOS, das ohne Offenlegung
  still in ein BESTANDEN umgeprüft wird, erkennbar, wenn die in
  FAKT 06 enthaltene Verpflichtung zur Nicht-Stillen-
  Wiederholungsprüfung später mit einer nicht versiegelten
  Änderung verglichen wird.
- **Stille Minimierung des Rückrufumfangs.** Die in FAKT 06
  enthaltenen Rückrufverpflichtungen (24-Stunden-Benachrichtigung,
  72-Stunden-Einleitung, 98 % Rückholrate) sind versiegelt; deren
  Nichteinhaltung ist öffentlich beobachtbar.
- **Nachträgliche Neunarration der Korrekturmaßnahmenhistorie.**
  Der Hash des Korrekturmaßnahmen-Protokolls in FAKT 07 friert
  ein, was das Unternehmen nach dem EMP-Vorläufigbefund TAT;
  spätere Behauptungen "wir haben mehr / weniger getan" sind
  öffentlich widerlegbar.
- **Selektive Auslassung von Begleitoffenlegungen.** FAKT 07 zählt
  die erwarteten Offenlegungskategorien auf (Inspektionshistorie,
  Rückrufhistorie, Methodenberatungsprüfung, Rückverfolgungs-
  bereitschaft); eine leere Kategorie muss ausdrücklich
  attestiert werden ("keine zum Freigabezeitpunkt"), sodass ein
  späteres "uns war nicht klar, dass das relevant war" öffentlich
  widerlegbar ist.
- **Substitution des Akkreditierungsstatus eines anderen Labors.**
  FAKT 04 friert für jedes Labor den ISO-17025-Anwendungsbereich
  und den Zertifikat-Hash bei der Freigabe ein; eine spätere
  Substitution durch ein nicht akkreditiertes Labor ist
  öffentlich erkennbar.

Das Kit verteidigt **nicht** gegen zeitgleiche Korruption — ein
Team, das absichtlich falsche Prüfergebnisse zum Freigabezeitpunkt
versiegelt, erzeugt ein kryptografisch gültiges Siegel falscher
Prüfergebnisse. Das Primitiv ist hierin ehrlich: Es ist ein
Nicht-Bestreitbarkeits-Primitiv für die zeitgleichen Behauptungen
des Herstellers, kein Beweis, dass diese Behauptungen korrekt sind.

---

## Historischer Mortalitätspräzedenzfall

Das Kit hätte in vergangenen Lebensmittelsicherheits-Versagensfällen
einen nützlichen Anker — *keine Lösung* — geliefert. Um keine
Einzelpersonen zu verleumden (die meisten Lebensmittelsicherheits-
Versagen sind unternehmerischer, nicht individueller Natur; einige
werden strafrechtlich verfolgt, andere nicht), beschreiben diese
Verweise den Ausbruch nach Jahr und Erreger und nennen die
beteiligte Einrichtung nur dann, wenn die Kontamination durch
Rückrufmeldung oder Gerichtsakte öffentlich zugeordnet wurde.

- **Melamin-Verfälschung von Säuglingsnahrung und Milchprodukten
  in China 2008 (Sanlu Group u. a.).** Mindestens sechs
  Säuglingstodesfälle und ca. 300.000 Erkrankungen, zurückgeführt
  auf mit Melamin versetzte Milchprodukte, die dazu konstruiert
  waren, den scheinbaren Proteingehalt in Kjeldahl-stickstoff-
  basierten Bestimmungen betrügerisch zu erhöhen. Es folgten
  Verurteilungen vor VR-China-Gerichten, einschließlich Todes-
  strafen. *Das Siegel hätte dies nicht verhindert* — Melamin
  lag außerhalb des Standard-Analyt-Panels. Das Siegel hätte sich
  öffentlich auf das damalige Panel festgelegt und damit den
  Umfang der nachträglichen Ausweitung der Routine-Screenings
  forensisch klar gemacht.

- **Europäischer STEC-O104:H4-Ausbruch 2011 (Bockshornklee-
  Sprossen, zurückverfolgt auf einen deutschen Betrieb).** 53
  Todesfälle, ca. 3.950 Erkrankungen in mehreren europäischen
  Ländern; letztlich zurückverfolgt auf aus Ägypten importierte
  Bockshornkleesamen, die in einem deutschen Erzeugerbetrieb
  gekeimt wurden. Die Rückverfolgung wurde durch inkonsistente
  chargenbezogene Dokumentation über die mehrere Länder umfassende
  Lieferkette behindert. *Das Siegel hätte die Kontamination der
  Samencharge nicht verhindert* (die Kontamination lag oberhalb
  der Tests des Sprossenbetriebs); es hätte verankert, was die
  Freigabeprüfungen des Sprossenbetriebs aussagten und, bei
  Verwendung auf Saatgut-Importeurebene, was die Handhabung des
  importierten Saatguts aussagte, und damit die Rückverfolgung
  beschleunigt.

- **Listeria-monocytogenes-Ausbruch bei Blue Bell Creameries 2015
  (Vereinigte Staaten).** 3 Todesfälle, 10 Erkrankungen in
  mehreren Bundesstaaten; führte zu einem landesweiten Rückruf
  und zu einer bundesstaatlichen strafrechtlichen Verurteilung
  von Blue Bell im Jahr 2020 wegen vergehensrechtlicher
  Lebensmittelsicherheitsverstöße, wobei das Unternehmen ein
  Aufschubabkommen einging und 19,35 Millionen Dollar zahlte.
  Es folgten zivilrechtliche Verfahren. *Das Siegel hätte* die
  Umgebungskontamination mit Listeria in der Anlage *nicht
  verhindert*; es hätte die Aufzeichnungen des Umgebungs-
  überwachungsprogramms forensisch verankert und damit jede
  spätere Frage nach "was hat das EMP in den Monaten vor dem
  Ausbruch gezeigt" gegen ein manipulationssicheres zeit-
  gestempeltes Protokoll beantwortbar gemacht, statt gegen
  später erstellte Unterlagen.

- **Multistaatliche STEC-O157:H7-Ausbrüche 2018 in Verbindung mit
  Romanasalat (Anbauregion Yuma, dann Anbauregion Salinas).**
  Mindestens 5 Todesfälle und ca. 210 Erkrankungen in mehreren
  Ausbrüchen jenes Jahres. Die Rückverfolgung wurde durch
  gemischtquelliges abgepacktes Produkt erschwert. *Das Siegel
  hätte* die Kontamination auf Feld- / Bewässerungswasser-Ebene
  (oberhalb des Herstellers) *nicht verhindert*; es hätte das
  Eingangsprüf- und Freigabeprüfprotokoll jedes Verarbeiters
  forensisch verankert und damit die Rückverfolgung beschleunigt
  sowie das öffentliche Protokoll kryptografisch besser gegen
  spätere Streitigkeiten verteidigbar gemacht.

- **Salmonella-Typhimurium-Ausbruch bei Peanut Corporation of
  America (2008–2009, Vereinigte Staaten).** 9 Todesfälle, ca.
  714 Erkrankungen; führte 2014–2015 zu bundesstaatlichen
  strafrechtlichen Verurteilungen von PCA-Führungskräften,
  einschließlich einer 28-jährigen Haftstrafe für den CEO wegen
  Verschwörung und Behinderung der Justiz. *Das Siegel hätte*
  die Kontamination, die unzureichende Untersuchung positiver
  innerbetrieblicher Salmonella-Tests oder die Entscheidung auf
  Führungsebene, Produkt entgegen diesen positiven Befunden
  auszuliefern, *nicht verhindert*. Es HÄTTE im Prozess
  forensisch klargemacht, was die Testergebnisse zu dem
  Zeitpunkt aussagten, an dem sie erzeugt wurden — und damit das
  Verfahren der Staatsanwaltschaft gegen zeitgleiche
  falsch-narrative E-Mails wesentlich besser gegen
  dokumentarische Modifikation verankert.

In jedem dieser Fälle hätte das Kit eine sauberere forensische
Zeitleiste bereitgestellt. In keinem dieser Fälle hätte das Kit
allein die Todesfälle verhindert. Das Siegel ist forensische
Infrastruktur, keine Präventionsinfrastruktur. Diese Unterscheidung
ist die Ehrlichkeit des Kits.

---

## Wann dieses Kit zu verwenden ist

- Ihr Produktionsbetrieb verfügt über ein stabiles HACCP- /
  Preventive-Controls-Programm und möchte eine Bitcoin-verankerte
  öffentliche Attestierung als manipulationssichere Schicht
  oberhalb des bestehenden Freigabedokumentations-Workflows
  hinzufügen.
- Sie sind ein klein- bis mittelständischer Hersteller oder ein
  Hersteller in einer Rechtsordnung mit schwächerer regulatorischer
  Infrastruktur und möchten Chargendaten gegen eine global
  überprüfbare Zeitleiste verankern — für Vertrauen in
  Exportmärkten, für die Beantwortung von Kunden-Audits oder für
  die Teilnahme an freiwilligen Transparenzinitiativen.
- Sie sind Lebensmittelsicherheitsinspektor oder Drittzertifizierer
  und möchten bei der Unterzeichnung ein manipulationssicheres
  Siegel der Auditfeststellungen veröffentlichen, sodass die
  Auditfeststellungen später nicht im Einvernehmen zwischen
  Hersteller und Zertifizierer still abgeändert werden können.
- Sie erwarten, dass diese Charge erheblicher nachgelagerter
  Prüfung unterzogen wird (Exportmarkt, Hochrisikokategorie wie
  RTE-Fleisch oder Säuglingsnahrung, neuartige Zutat, jüngste
  Rückrufhistorie).
- Sie können die aufgeführte Faktenmenge veröffentlichen, ohne die
  Verweigerungsregeln R1-R8 zu brechen. Wenn Ihre Fakten einen
  Bruch von R1-R8 erfordern würden, verwenden Sie das Kit nicht;
  korrigieren Sie zuerst die Dateneingänge.
- Die Rechtsabteilung des Herstellers hat den Veröffentlichungsplan
  überprüft. Eine öffentliche Veröffentlichung eines Artefakts,
  das eine Chargenkennung trägt, hat Auswirkungen auf die
  Produkthaftungs-Exposition; eine Prüfung durch die
  Rechtsabteilung ist nicht optional.

## Wann dieses Kit NICHT zu verwenden ist

- **Nicht als Ersatz für FSMA- / FSIS- / EU-behördliche
  Aufzeichnungen verwenden.** Das Siegel ist *additiv*, kein
  Ersatz. Ihre gesetzlich vorgeschriebenen Freigabedaten, Ihr
  HACCP-Plan, Ihre CCP-Protokolle und Ihr Rückrufplan bleiben
  unverändert.
- **Nicht als Sicherheitsaussage verwenden.** Die Versiegelung
  eines bestandenen Freigabeprotokolls etabliert nicht, dass das
  Produkt sicher ist; sie etabliert, dass das Protokoll zu diesem
  Zeitpunkt diesen Byte-Inhalt hatte. Verweigerungsregel R6 lehnt
  jede Sicherheitsschlussfolgerung ab.
- **Nicht verwenden, um Lieferantenidentitäten, Kundenlisten,
  Arbeiternamen oder Anlagenadressen zu veröffentlichen.** Die
  Verweigerungsregeln R1-R5 bestehen aus Gründen der menschlichen
  Sicherheit und vertraglicher Erwägungen; ändern Sie das Kit
  nicht, um diese außer Kraft zu setzen, ohne die Rechtsabteilung
  zu konsultieren.
- **Nicht unter Druck verwenden, um vor Abschluss der
  Freigabeprüfung zu versiegeln.** Ein Siegel mit Teildaten stellt
  den Stand der Freigabeentscheidung falsch dar.
- **Nicht als Legitimitätstheater verwenden.** Ein Siegel auf
  einem schlecht konzipierten Stichprobenplan oder einem schlecht
  gewählten Analyt-Panel ist ein dauerhaftes öffentliches
  Protokoll der Unzulänglichkeit, keine Verteidigung dagegen.
  Das Primitiv schneidet in beide Richtungen; das ist seine
  Ehrlichkeit.
- **Nicht während einer aktiven Rückrufsituation als Ersatz für
  die Rückrufkoordination der Aufsichtsbehörde verwenden.** Eine
  neue MYRIAM-Publikation, die den Rückrufumfang verankert, ist
  NACH der von der Aufsichtsbehörde koordinierten Rückrufeinleitung
  angemessen; sie ist kein Ersatz für den Rückrufkanal der
  Aufsichtsbehörde.

## Wie man dieses Kit für eine echte Freigabe forkt

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # replace fictional content with real lot
                           # apply refusal rules R1-R8 throughout
bash build/seal.sh         # SEAL BEFORE first distribution movement
python3 build/verify.py    # confirm
```

**KRITISCHES TIMING:** Versiegeln Sie zum Zeitpunkt der QA-Freigabe,
BEVOR die Charge verteilt wird (bevor der erste LKW die Anlage
verlässt). Ein Siegel nach Beginn der Distribution hat weiterhin
Wert, verankert den Zustand vor der Distribution jedoch nicht
sauber. Das richtige Zeitfenster liegt zwischen der QA-Freigabe-
Unterschrift und der ersten Distributionsbewegung.

**KRITISCHE PRÜFUNG:** Lassen Sie die Veröffentlichung vor der
Versiegelung von einem zweiten QA-Prüfer (nicht dem leitenden) und
durch die Rechtsabteilung des Unternehmens prüfen. Nach der
Versiegelung ist die Veröffentlichung dauerhaft.

## Integration mit bestehender Lebensmittelsicherheits-Infrastruktur

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).**
  Die URL der versiegelten Veröffentlichung oder die IPFS-CID
  kann in der Dokumentation des Food Safety Plan als
  öffentliches Attestierungs-Artefakt für diese Charge
  referenziert werden.
- **USDA-FSIS-HACCP-Pläne und Freigabeprotokolle.** Das versiegelte
  Freigabeprotokoll steht neben den von der FSIS verlangten
  HACCP-Aufzeichnungen; das Siegel referenziert den Hash der
  HACCP-Plan-Version (FAKT 02), sodass spätere Streitigkeiten
  darüber, welche Planversion in Kraft war, öffentlich
  widerlegbar sind.
- **Codex Alimentarius / HACCP-Prinzipien** (Codex CAC/RCP 1-1969
  Rev. 4-2003). Das Siegel verpflichtet sich auf die HACCP-
  Ergebnisse der sieben Prinzipien (Gefahrenanalyse, CCPs,
  kritische Grenzen, Überwachung, Korrekturmaßnahmen,
  Verifizierung, Aufzeichnungen) für diese Charge.
- **ISO 22000:2018 (Lebensmittelsicherheits-Managementsysteme).**
  Das Siegel kann als Teil der Belegspur für die
  Management-Bewertung referenziert werden; es ersetzt nicht die
  ISO-22000-Zertifizierung.
- **FSSC-22000-v6-Zertifizierungsschema.** Kompatibel als
  additive Transparenzschicht; der Auditor der FSSC kann das
  Siegel bei der Überwachung verifizieren.
- **EU-Verordnung (EG) 178/2002 (Allgemeines Lebensmittelrecht)
  Artikel 18 (Rückverfolgbarkeit) und Artikel 19 (Rückruf-
  meldung).** Das Siegel verpflichtet sich auf die one-tier-back-
  Rückverfolgungsbereitschaft des Herstellers (FAKT 07) und
  Rückrufverpflichtungen (FAKT 06); es ersetzt nicht die
  gesetzliche Meldepflicht nach Artikel 19.
- **EU-Hygienepaket (Verordnungen 852/2004, 853/2004, 854/2004,
  882/2004).** Kompatibel; das Siegel referenziert das Äquivalent
  der HACCP- und Eigenkontrollaufzeichnungen des Hygienepakets.
- **BRCGS- / SQF-Schemata privater Standards.** Kompatibel als
  additive Transparenzschicht.
- **Systeme der Public-Health-Surveillance (CDC PulseNet, FoodNet,
  IFSAC; EU EFSA / ECDC).** Direkt außerhalb des Geltungsbereichs
  des Siegels, aber FAKT 06 verpflichtet den Hersteller zur
  Teilnahme und zur Versiegelung aller Signal-Korrelations-
  ereignisse als neue MYRIAM-Publikationen.

## Was dieses Kit NICHT ersetzt

- FDA Food Facility Registration oder USDA-FSIS-Establishment-
  Zulassung.
- Ihren schriftlichen Food Safety Plan / HACCP Plan gemäß
  FSMA / FSIS.
- CCP-Überwachungsprotokolle und Korrekturmaßnahmen-Aufzeichnungen.
- ISO-17025-Laborakkreditierungsaufsicht.
- Eignungsprüfungsprogramme.
- Behördliche Inspektion (FSIS-Dauerinspektion, FDA-Periodische
  Inspektion, EU-Inspektion durch die zuständige Behörde).
- Public-Health-Surveillance (CDC, EFSA, ECDC, nationale
  Äquivalente).
- Rückrufkoordinationskanäle (FDA Reportable Food Registry,
  FSIS-Rückrufkoordination, EU RASFF, nationale Äquivalente).
- Arbeitnehmersicherheits- und Lebensmittelarbeiter-Schulungs-
  programme.

## Warum dieses Kit in v0.4.0+ existiert

Dies ist eines der ausgearbeiteten Beispiele, das mit myriam-kit
ausgeliefert wird. Es folgt der einschränkungs-zuerst-orientierten
README-Struktur, die durch die in `~/Genesis/calc/PROMPT_LIBRARY_v0.md`
dokumentierte Autoresearch validiert wurde — die einschränkungs-
zuerst-Prompt-Variante erzielte über mehrere Beispiel-Domänen
hinweg die höchste Bewertung auf einer gewichteten Rubrik, weil
die Lebensmittelsicherheits-Attestierung genau jene Domäne ist, in
der es gefährlich ist, das vom Siegel Geleistete zu überzeichnen:
Menschen sind und werden in Versagensfällen sterben, die das
Siegel nicht verhindern kann. Die einleitenden Abschnitte sind die
lasttragenden Teile des Kits; der Manifest-Inhalt ist der einfache
Teil.

Die Voreinstellungen des Kits sind bewusst konservativ in Bezug
auf die Veröffentlichung von Arbeiternamen, konservativ in Bezug
auf die Präzision der Anlagenangabe, konservativ in Bezug auf
Lieferanten- und Kundenidentitäten und aggressiv in Bezug auf den
Vorbehalt "dies stellt keine Sicherheit fest". Die
Lebensmittelsicherheits-Community hat eine dokumentierte
Geschichte überzogener Zertifizierungssprache; das Kit ist
standardmäßig in der Position, die am wenigsten als
Sicherheitsgarantie gelesen werden kann. Hersteller in
Rechtsordnungen mit abweichenden spezifischen
Offenlegungsanforderungen können ihren Fork entsprechend anpassen,
aber die standardmäßigen Verweigerungen begünstigen die
Arbeitnehmersicherheit und einen ehrlichen Geltungsbereich.

## Lizenz

Public Domain (CC0). Forken Sie es. Keine Quellenangabe
erforderlich.
