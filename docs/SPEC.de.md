*Deutsche Übersetzung — für die englische Originalfassung siehe [SPEC.md](SPEC.md)*

# MYRIAM-kit Protokollspezifikation

## 0. Zweck

Dieses Dokument spezifiziert ein minimales Protokoll, um eine kleine Menge
an Textfakten in einer manipulationssichtbaren, kryptografisch
verifizierbaren Form zu veröffentlichen, die das Entfernen durch einen
einzelnen Hosting-Anbieter überlebt.

Es ist die Verallgemeinerung des Protokolls, das erstmals auf
[disclosure.host](https://disclosure.host) unter dem Namen "MYRIAM v1"
zum Einsatz kam.

## 1. Nicht-Ziele

- Geheimnisspeicherung. Alles ist konstruktionsbedingt öffentlich.
- Große Datensätze. Ab etwa 20 Fakten passt das Protokoll nicht mehr.
- Echtzeit-Veröffentlichung. Jede Veröffentlichung ist ein diskretes Versiegelungsereignis.
- Widerruf. Das Protokoll ist auf Versionsebene strikt anhängend (append-only).

## 2. Fakt-Modell

Ein FAKT ist eine UTF-8-Textdatei mit:

- Dateinamen-Muster: `NN_short_name.txt`, wobei NN ein mit Nullen
  aufgefüllter zweistelliger Index ist, der bei 01 beginnt.
- Kanonischer Form: Bytes wie geschrieben, ohne Normalisierung.
- Hash pro Fakt: Kleinbuchstaben-Hex von `SHA-256(file_bytes)`.

Die Fakt-MENGE ist die geordnete Liste aller Dateien unter `facts/`, die
dem Muster entsprechen, lexikografisch sortiert.

Einschränkung: Jeder Faktkörper SOLLTE als *Benennungsereignis* oder
*Deklarationsereignis* formuliert sein, das einer konkreten Partei
zurechenbar ist. Ontologische Aussagen ("der Mond besteht aus Gestein")
untergraben das Verifizierbarkeits-Gatter; nur das Veröffentlichungs­ereignis
ist verifizierbar, nicht die Aussage selbst. "X hat Y erklärt" ist die
richtige Form. "Y ist wahr" nicht.

## 3. Merkle-Wurzel

Bitcoin-konform, wie in v0 des eingesetzten MYRIAM-Protokolls:

1. Blätter: SHA-256-Hashes pro Fakt in Reihenfolge der Fakt-Menge.
2. Hat eine Ebene eine ungerade Anzahl von Knoten, wird der letzte Knoten dupliziert.
3. Paarweises Hashen benachbarter Knoten: `parent = SHA-256(left_bytes || right_bytes)`,
   wobei `left_bytes` und `right_bytes` die rohen 32-Byte-Hashwerte sind
   (nicht ihre Hex-Darstellungen).
4. Wiederholen, bis nur noch ein Knoten übrig ist. Das ist die Merkle-Wurzel.

Die Wurzel wird als Kleinbuchstaben-Hex ohne abschließenden Zeilenumbruch veröffentlicht.

### 3.1 Testvektoren

| Vektor | Blätter (gehashte UTF-8-Bytes) | Erwartete Wurzel (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Jede konforme Implementierung MUSS diese Vektoren reproduzieren. Sie sind
aus dem tatsächlichen `lib/build.py` abgeleitet und können mit diesem
Skript neu erzeugt werden.

## 4. Bitcoin-Verankerung

Die Merkle-Wurzel wird über
[OpenTimestamps](https://opentimestamps.org) in der Bitcoin-Blockchain
verankert. Die Standard-Richtlinie lautet:

> Gegen mindestens zwei Kalender-Betreiber unter unabhängiger
> administrativer Kontrolle stempeln.

Eine Quittung, die diese Richtlinie erfüllt, ist für jede Partei
verifizierbar, die `ots verify <receipt>.ots` ausführen und den
Upgrade-Pfad eines der beiden Kalender erreichen kann.

Das in `lib/seal.sh` ausgelieferte Standard-Betreiberpaar:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementierungen DÜRFEN andere Betreiber verwenden. Die Richtlinie zur
Zeugenvielfalt (≥2 unabhängige Betreiber) ist normativ; die konkreten
Betreiber sind es nicht.

## 5. Inhaltsadressierte Spiegelung

Das Verzeichnis `site/`, das die veröffentlichte Seite und die
Fakt-Dateien enthält, SOLLTE zu IPFS hinzugefügt werden:

```
ipfs add -r --cid-version=1 -Q site/
```

Die resultierende CIDv1 (dag-pb-Codec) ist die Inhaltsadresse der
Veröffentlichung. Sie ist deterministisch aus dem Byte-Inhalt von
`site/` ableitbar. Jede Änderung an einer Datei unter `site/` erzeugt
eine andere CID.

Pinning auf zusätzlichen Diensten über den lokalen Knoten des
Herausgebers hinaus wird zur Sicherung der Dauerhaftigkeit dringend
empfohlen; diese Spezifikation schreibt keine konkreten Dienste vor.

## 6. Versionierung

Das Protokoll ist **auf Versionsebene strikt anhängend (append-only)**.
Jede Änderung erfordert eine neue versiegelte Version:

- Eine neue (oder unveränderte) Spezifikations-Revision
- Eine neue Fakt-Menge, die Fakten aus früheren Versionen unverändert übernehmen DARF
- Eine neue Merkle-Wurzel
- Eine neue OpenTimestamps-Quittung
- Eine neue IPFS-CID

Alle früheren Versionen bleiben unter versionierten URLs veröffentlicht.
Eine Änderung an einem v(N)-Fakt erfordert v(N+1), wobei beide Versionen
sichtbar und erneut verifizierbar bleiben.

## 7. Verifizierung

Jeder Dritte darf die Integrität einer Veröffentlichung verifizieren, indem er:

1. Die Fakt-Dateien herunterlädt und die SHA-256-Hashes pro Fakt neu berechnet.
2. Die Merkle-Wurzel gemäß §3 neu berechnet und mit der veröffentlichten Wurzel vergleicht.
3. Die OpenTimestamps-Quittung für die vollständige Attestierung
   mindestens eines Kalenders gegen die Bitcoin-Blockchain verifiziert.
4. Die IPFS-CID unabhängig über `ipfs add -r --cid-version=1` neu
   berechnet und mit der veröffentlichten CID vergleicht.

`lib/verify.py` führt die Schritte 1–3 ohne externe Abhängigkeiten jenseits
der Python-Standardbibliothek und des `ots`-Clients aus. Schritt 4
erfordert den `ipfs`-Client.

## 8. Refusal-Gatter (Verweigerungsklausel)

Eine Veröffentlichung DARF NICHT einen Fakt enthalten, der:

- Eine private dritte Partei identifiziert, die nicht in die Nennung eingewilligt hat.
- Eine Hypothese als Bestätigung darstellt.
- Sich nicht auf ein verifizierbares Benennungs-/Deklarationsereignis
  oder ein kryptografisches Artefakt reduzieren lässt.
- Mit einem vernünftigerweise erwartbaren Anstieg vermeidbarer Todesfälle
  bei Veröffentlichung einhergeht.

Die vierte Regel ist die tragende. Sie wird im Schritt der menschlichen
Prüfung durch den Herausgeber durchgesetzt. Auf Protokollebene gibt es
keine Durchsetzung des Refusal-Gatters; das Protokoll veröffentlicht alle
Bytes, die es erhält. Für das Gatter ist der Herausgeber verantwortlich.

## 9. Ehrliche Aussage zu Grenzen

- **Erkennbarkeit, nicht Unmöglichkeit.** Das Protokoll macht
  Manipulationen erkennbar, nicht unmöglich. Ein entschlossener Angreifer
  kann immer noch eine abweichende Veröffentlichung einsetzen und einige
  Leser davon überzeugen, sie sei das Original. Der Wert des Protokolls
  besteht darin, dass die Substitution für jeden, der die Prüfung
  durchführt, kryptografisch nachweisbar wird.
- **Kein Schutz gegen die Veröffentlichung von Unwahrheiten.** Wenn der
  Herausgeber einen Fakt mit der Aussage "X ist geschehen" versiegelt
  und X nicht geschehen ist, versiegelt das Protokoll die falsche Aussage
  mit derselben Genauigkeit wie eine wahre. Das Protokoll bezeugt, was
  *veröffentlicht* wurde, nicht, was *wahr* ist.
- **Signieren durch eine einzelne Partei.** v1 des eingesetzten MYRIAM
  verwendet einen einzigen signierenden Prinzipal. Mehr-Parteien-Signieren
  ist Gegenstand künftiger Arbeit.
- **Dauerhaftigkeit des Pinnings.** IPFS-Pinning allein am Knoten des
  Herausgebers bietet "verfügbar, solange mein Laptop läuft, plus
  opportunistisches Gateway-Caching". Langfristige Dauerhaftigkeit
  erfordert redundante Pins über unabhängige Dienste hinweg.

Diese Grenzen werden hier benannt, damit kein Leser annimmt, das
Protokoll leiste mehr, als es tut.
