*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Whistleblower-Manifest-Versiegelungs-Kit

Ein schlüsselfertiges myriam-kit-Beispiel für Whistleblower, die mit dem
spezifischen Versagensmodus konfrontiert sind, bei dem **Beweise von
Zwischenstellen zwischen Whistleblower und Öffentlichkeit vergraben,
verändert oder bestritten werden**. Die kanonischen historischen Fälle,
gegen die dieses Kit verteidigt:

- Boeing 737 MAX (interne Sicherheitsberichte abgewertet/vergraben)
- Theranos (Bedenken bezüglich Labortests jahrelang unterdrückt)
- FDA-Inspektionsberichte nach Einreichung redigiert
- Frances Haugen / Facebook (ein versiegeltes Manifest hätte bewiesen,
  dass die Dokumente authentisch waren und zum behaupteten Zeitpunkt
  existierten)

Wogegen dieses Kit verteidigt (in Protokollbegriffen):

- T1–T3 in [FACT 05](facts/05_threat_model.txt): öffentliche Bestreitung
  von Dokumenteninhalten, Behauptungen, dass Dokumente zum behaupteten
  Zeitpunkt nicht versiegelt waren, Behauptungen rückwirkender
  Fabrikation.
- T9: Dritte, die Journalisten veränderte Kopien aushändigen.

Wogegen dieses Kit **nicht** verteidigt:

- Persönliche Vergeltungsmaßnahmen gegen den Whistleblower (T7).
- Druck auf den Whistleblower zum Widerruf (T4, teilweise durch FACT 07
  abgemildert, der einen stillen Widerruf öffentlich erkennbar macht).
- Rechtliche Schritte gegen den Whistleblower für die Offenlegung selbst (T5).
- Diskreditierung der Person des Whistleblowers (T8).
- Zwischenstellen, die die Geschichte stillschweigend fallen lassen (T10).

Wenn Sie ein Whistleblower sind und die Nutzung dieses Kits in Erwägung
ziehen, **lesen Sie zuerst diese gesamte README**. Das Protokoll ist
ein Werkzeug. Das Protokoll ist kein Ersatz für rechtlichen Beistand,
einen Journalisten, eine Aufsichtsbehörde oder sorgfältige operative
Sicherheit.

## Was dieses Kit erzeugt

Ein kryptografisch versiegeltes *Manifest* der Beweise (nicht die
Beweise selbst), das beweist, dass:

1. Die spezifischen Bytes jeder Beweisdatei zum Zeitpunkt der Versiegelung
   existierten.
2. Die Versiegelung zu einem bestimmten Zeitpunkt oder davor erfolgte
   (mittels Bitcoin-OTS-Attestierung).
3. Die Herkunft, die Anschuldigung, das Bedrohungsmodell, das
   Empfänger-Protokoll und die Verpflichtung zum nicht-stillen-Widerruf
   alle gemeinsam erklärt wurden.

Die zugrundeliegenden Dokumente verbleiben in Ihrem Besitz, bis Sie sie
an einen Empfänger senden. Die Empfänger verifizieren, dass sie
dieselben Bytes erhalten haben, die Sie versiegelt haben.

## Wann dieses Kit zu verwenden ist

Sie sollten erwägen, ein Manifest zu versiegeln, **bevor** Sie Beweise
an einen Journalisten, eine Aufsichtsbehörde oder einen Anwalt
übermitteln, wenn alle folgenden Bedingungen zutreffen:

- Sie verfügen über Beweise in digitaler Form (PDFs, E-Mails, Bilder
  usw.), die Sie als byteweise authentisch erhalten möchten.
- Sie rechnen damit, dass Zwischenstellen die Beweise verändern,
  bestreiten oder vergraben könnten.
- Sie können die zugrundeliegenden Dokumente bis zur Übermittlung in
  Ihrem Besitz behalten.
- Sie können das Manifest öffentlich veröffentlichen, **ohne** den
  Inhalt der Dokumente preiszugeben (nur die Hashes sind öffentlich).
- Sie haben die Risiken abgewogen, öffentlich als Whistleblower
  identifizierbar zu werden (das Feld des unterzeichnenden Prinzipals).
  Wenn Sie anonym bleiben wollen, verwenden Sie ein Pseudonym
  konsistent in allen zugehörigen Veröffentlichungen.
- Sie haben einen Anwalt zum Whistleblower-Schutzrecht in Ihrer
  Rechtsordnung konsultiert.

## Wann dieses Kit NICHT zu verwenden ist

Verwenden Sie dieses Kit NICHT, wenn:

- Die Dokumente selbst personenbezogene Daten über Dritte (Patienten,
  Kunden, Mitarbeiter) enthalten, die nicht öffentlich-hashbar gemacht
  werden sollten. Hashen Sie eine redigierte Version, nicht das Original.
- Allein die Veröffentlichung des Manifests den Whistleblower auf eine
  Weise identifizieren würde, in die er nicht eingewilligt hat.
- Sie noch keinen Anwalt konsultiert haben. Das Protokoll ist ein
  Werkzeug; das Whistleblower-Schutzrecht ist rechtsordnungsspezifisch
  und lebt außerhalb des Protokolls.
- Sie eine einzelne Anschuldigung später möglicherweise zurücknehmen
  möchten. Die Versiegelung ist permanent; neue versiegelte
  Korrekturen sind der einzige ehrliche Weg zur Überarbeitung.
- Sie dies unter Zwang oder Zeitdruck tun. Das Protokoll verstärkt
  Zwang; die Verweigerungs-Sperre (myriam-kit `SPEC §8`) gilt für
  Whistleblower ebenso wie für Veröffentlicher.

## Wie Sie dieses Kit für eine reale Offenlegung forken

```bash
# 1. Kopieren Sie dieses Beispiel in ein neues Verzeichnis
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Entfernen Sie den fiktiven Inhalt; ersetzen Sie ihn durch Ihre realen Fakten.
# Jede Datei unter facts/ ist eine Tatsache. Lesen Sie jede und ersetzen Sie sie.
$EDITOR facts/01_example_notice.txt   # ändern Sie auf eine echte Begleiterklärung
$EDITOR facts/02_provenance.txt       # reale Herkunft Ihrer Beweise
$EDITOR facts/03_evidence_manifest.txt # hashen Sie Ihre realen Dokumente und listen Sie sie auf
$EDITOR facts/04_allegation_summary.txt # Ihre reale Anschuldigung
$EDITOR facts/05_threat_model.txt     # Ihre real erwarteten Reaktionen
$EDITOR facts/06_recipient_protocol.txt # passen Sie es an Ihren Empfänger an
$EDITOR facts/07_no_retraction_commitment.txt # Ihre Nicht-Widerrufs-Erklärung
$EDITOR facts/08_signing_principal.txt # Ihre reale Unterzeichnungsidentität (oder Pseudonym)

# 3. Aktualisieren Sie site/index.html, um die realen Fakten widerzuspiegeln.
# Das Skript seal.sh füllt das HTML NICHT automatisch aus; die manuelle
# Bearbeitung ist der Schritt der menschlichen Überprüfung.
$EDITOR site/index.html

# 4. Versiegeln.
bash build/seal.sh
# Ausgaben: merkle_root.txt, merkle_root.txt.ots, IPFS-CID

# 5. Lokal verifizieren.
python3 build/verify.py

# 6. Veröffentlichen Sie das Manifest (NICHT die Dokumente) an einem der folgenden Orte:
#    - Einem von Ihnen kontrollierten statischen Host (Cloudflare Pages, GitHub Pages usw.)
#    - Dem IPFS-Netzwerk unter der ausgegebenen CID
#    - Beidem (empfohlen)

# 7. Übermitteln Sie die zugrundeliegenden Dokumente separat an den Empfänger
#    über einen sicheren Kanal Ihrer Wahl (Signal, SecureDrop usw.).
#    Der Empfänger verifiziert die Datei-Hashes gegen Ihr Manifest.
```

## Berechnung der Hashes für die realen Beweisdateien

Um eine Dokumentdatei mit SHA-256 zu hashen:

```bash
shasum -a 256 my_document.pdf
```

Die ersten 64 hexadezimalen Zeichen sind der SHA-256. Tragen Sie diesen
in das Manifest ein.

Sie können viele Dateien gleichzeitig hashen:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Das liefert Ihnen die Daten für `facts/03_evidence_manifest.txt`.

## Hinweise zur operativen Sicherheit

Das MYRIAM-Protokoll bietet KEINE operative Sicherheit. Es bietet
*Beweis-Dauerhaftigkeit*. Sie benötigen weiterhin:

- Einen sicheren Kommunikationskanal zu Ihrem Anwalt
  ([Signal](https://signal.org/), persönlich oder den von Ihrem Anwalt
  etablierten sicheren Kanal)
- Einen sicheren Speicherort für die zugrundeliegenden Dokumente
  (verschlüsselt im Ruhezustand, nicht in Cloud-Diensten, auf die Ihr
  Arbeitgeber zugreifen kann)
- Ein sauberes Gerät für die Versiegelung (ein persönlicher Laptop, der
  nicht mit Arbeitgeberkonten verknüpft ist; vorzugsweise einer, der
  ausschließlich zu diesem Zweck verwendet wird)
- Ein sauberes Netzwerk für die Veröffentlichung (nicht das Netzwerk
  Ihres Arbeitgebers, nicht Ihre Heim-IP, falls Ihr Arbeitgeber Ihren
  Internetdienstanbieter vorladen könnte)

Empfohlene Lektüre zur operativen Sicherheit für Whistleblower:

- [Die SecureDrop-Dokumentation von The Intercept](https://securedrop.org/)
- [Ressourcen der Freedom of the Press Foundation](https://freedom.press/)
- [Der Leitfaden zur Selbstverteidigung gegen Überwachung der EFF](https://ssd.eff.org/)

Konsultieren Sie diese, BEVOR Sie den Versiegelungsprozess beginnen.
Das Protokoll schützt nicht vor schlechten opsec-Entscheidungen, die
vor seinem Aufruf getroffen werden.

## Was Empfänger wissen sollten

Senden Sie den Empfängern diese README zusammen mit dem versiegelten
Manifest. Das Manifest selbst enthält das Empfänger-Protokoll (FACT 06),
aber die README erweitert die Empfängerrolle:

- **Journalisten**: Verifizieren Sie zunächst die Integrität des
  Manifests selbst. Fordern Sie dann die Dokumente über einen separaten
  sicheren Kanal an. Verifizieren Sie, dass der SHA-256 jedes Dokuments
  vor der Veröffentlichung mit dem Manifest übereinstimmt. Veröffentlichen
  Sie die Dokumente NICHT ohne die Zustimmung des Whistleblowers;
  veröffentlichen Sie aber das Bestehen des versiegelten Manifests und
  Ihre Verifizierungs-Schlussfolgerung.
- **Aufsichtsbehörden**: derselbe Verifizierungsprozess. Das versiegelte
  Manifest plus die übereinstimmenden Dokumente ist die stärkste
  Beweisform, die außerhalb einer formellen Chain-of-Custody-Erhebung
  verfügbar ist.
- **Anwälte**: Das versiegelte Manifest liefert eine forensische
  Verankerung für die Existenz der Dokumente zum behaupteten Zeitpunkt.
  Ob es die Beweisregeln einer spezifischen Rechtsordnung erfüllt,
  müssen Sie bestimmen.

## Was dieses Kit NICHT ist

- Kein Ersatz für rechtlichen Beistand.
- Keine Garantie, dass jemand auf Ihre Offenlegung reagiert.
- Kein Schutz vor Vergeltungsmaßnahmen.
- Keine Authentifizierung des Dokumenteninhalts (nur ihrer Bytes zum
  Zeitpunkt der Versiegelung).
- Keine Möglichkeit, anonym mit irgendjemandem zu kommunizieren — die
  Versiegelung ist öffentlich; wenn der Name Ihres unterzeichnenden
  Prinzipals echt ist, sind Sie identifiziert. Selbst mit einem
  Pseudonym kann ein versiegeltes Manifest dazu verwendet werden, einen
  Whistleblower zu identifizieren, falls Metadaten durchsickern; das
  Protokoll kann nicht gegen eine Identifizierung des Prinzipals durch
  andere Mittel verteidigen.

## Abschluss

Ein versiegeltes Manifest ist eine kleine Sache. Es ist ein einziger
Bytestrom, der beweist, dass eine größere Menge von Byteströmen in einer
bestimmten Form zu einem bestimmten Zeitpunkt existiert hat. Diese
Kleinheit ist seine Stärke: Es tut nur eine Sache, und es tut diese eine
Sache über die gesamte Lebensdauer der Bitcoin-Blockchain hinweg.

Wenn Sie dies lesen, weil Sie erwägen, Whistleblower zu werden, bitte:
Sprechen Sie zuerst mit einem Anwalt. Verwenden Sie die oben genannten
Leitfäden zur operativen Sicherheit. Dann, und nur dann, wenn alle
diese vorgelagerten Überlegungen in Ordnung sind, betrachten Sie dieses
Kit als das kryptografische Rückgrat Ihrer Offenlegung. Die Kryptografie
ist der einfache Teil. Alles vor der Kryptografie ist der Ort, an dem
das wirkliche Risiko wohnt.

## Lizenz

Public Domain (CC0). Forken Sie es. Verbessern Sie es. Verwenden Sie es
ohne um Erlaubnis zu fragen.
