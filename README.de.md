*Deutsche Übersetzung — für die englische Originalfassung siehe [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Ein kompaktes Werkzeug-Kit, um eine kleine Menge an Fakten so zu veröffentlichen, dass:

- Jede Änderung an einer Tatsache öffentlich erkennbar ist (Merkle-Baum)
- Der Zustand zum Zeitpunkt der Veröffentlichung gegen die Bitcoin-Blockchain verifizierbar ist (OpenTimestamps)
- Der Inhalt das Entfernen durch einen einzelnen Hosting-Anbieter überlebt (IPFS)
- Das Ganze unter 100 KB groß ist und mit etwa 50 Zeilen Python verifiziert werden kann

Dies ist keine Blockchain. Es gibt keinen Token. Es gibt keinen Konsensmechanismus, an dem man sich beteiligen müsste. Es gibt keine DAO. Das Werkzeug besteht aus `sha256sum` + `ots` + `ipfs`, zusammengehalten durch gute Namenskonventionen.

Es ist nach dem MYRIAM-Protokoll benannt, das erstmals am 21.05.2026 auf [disclosure.host](https://disclosure.host) instanziiert wurde. Diese Seite enthält sechs Fakten, eine Merkle-Wurzel und eine Bitcoin-Attestierung. Dieses Kit ist die Verallgemeinerung dieses Musters.

## Status

- v0: funktioniert unter macOS mit Python 3.10+, Homebrew und einer Internetverbindung. Linux ungetestet, sollte aber funktionieren. Windows: WSL erforderlich.
- Public Domain (CC0). Benutzen, forken, in das eigene Repository einbinden, ohne Quellenangabe verwenden. Es geht nicht um die Anerkennung.

## Wofür man es einsetzen kann

Das Muster passt überall dort, wo eine kleine Menge an Fakten:

- **veröffentlichbar** an ein breites Publikum über einfaches HTTP sein soll
- **dauerhaft** sein soll — auch in 30 Jahren noch verifizierbar
- **manipulationssicher** sein soll — jede Änderung muss erkennbar, nicht zwingend verhinderbar sein
- **vertrauenslos** sein soll — kein Leser muss dem Herausgeber vertrauen (nur der Mathematik)

Konkrete Anwendungsfälle in [docs/USE_CASES.md](docs/USE_CASES.md). Die Kurzliste:

| Bereich | Versiegelte Fakten |
|---|---|
| Öffentliche Gesundheit | Testergebnisse von Impfstoffchargen, Meilensteine klinischer Studien |
| Wahlen | Auszählungssummen auf Wahlbezirksebene zum Zeitpunkt der Zertifizierung |
| KI-Sicherheit | Hash der Modellgewichte + Modellkarte + Evaluierungswerte beim Release |
| Journalismus | Manifest von Quelldokumenten (nur Hashes) für Whistleblower-Leaks |
| Wissenschaft | Hash der Rohdaten + Hash des Analyseskripts + behauptetes Ergebnis |
| Justiz | Hashes digitaler Beweismittel zum Zeitpunkt der Sicherstellung |
| Beschaffungswesen | Versiegelte Wurzeln öffentlicher Ausgabendaten |

Was diese Anwendungsfälle gemeinsam haben: eine kleine Menge an Fakten, eine starke Anforderung an die Dauerhaftigkeit, mehrere Parteien, die einander nicht vertrauen, und ein winziges Speicherbudget. Genau für diesen Zuschnitt ist dieses Werkzeug konzipiert.

## Was es NICHT leistet

- **Geheimnisse speichern.** Alles, was in `facts/` abgelegt wird, ist öffentlich. Das Protokoll dient der Veröffentlichung, nicht der Geheimhaltung.
- **Skalierung auf große Datenmengen.** Der Merkle-Baum skaliert problemlos; die Aufmerksamkeit eines Lesers nicht. Ab etwa 20 Fakten wird die Seite unlesbar. Wer eine Million Datensätze versiegeln möchte, sollte diese außerhalb der Seite hashen und die Merkle-Wurzel dieses Seitenbaums als einen einzelnen Fakt eintragen.
- **Schutz gegen Widerruf.** Der Sinn der Sache ist gerade, dass man nicht ändern kann, was man versiegelt hat. Wer eine Aussage später möglicherweise widerrufen möchte, sollte sie nicht versiegeln.
- **Einen entschlossenen Skeptiker überzeugen.** Ein entschlossener Skeptiker wird nicht `ipfs add -r --cid-version=1 -Q facts/` ausführen. Er wird Ihnen jedoch unterstellen, das gesamte Setup erfunden zu haben. Gegen diesen zweiten Versagensmodus gibt es keine Verteidigung auf Protokollebene. Es gibt keine Verteidigung auf Protokollebene gegen irgendetwas, das in menschlicher Motivation und nicht in der Mathematik wohnt.

## Wie man es benutzt

Fünfminütige Einführung in [docs/QUICKSTART.md](docs/QUICKSTART.md).
Vollständige Protokollspezifikation in [docs/SPEC.md](docs/SPEC.md).
Bedrohungsmodell in [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Vergleich mit verwandten Systemen (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave usw.) in [docs/COMPARISON.md](docs/COMPARISON.md).

## Wie man die Veröffentlichung eines Dritten verifiziert

Drei Optionen, geordnet nach Zugänglichkeit:

1. **Browser**: [`lib/verify.html`](lib/verify.html) in einem aktuellen Browser öffnen. Die Veröffentlichungs-URL einfügen. Auf "Verifizieren" klicken. Verwendet `crypto.subtle` zum Hashen — keine Installation, kein Backend, keine Telemetrie. Der Schritt zur Bitcoin-Attestierung erfordert weiterhin ein CLI-Werkzeug (siehe Schritt 7 auf der Verifizierungsseite).
2. **Python**: `python3 lib/verify.py` aus dem Veröffentlichungsverzeichnis heraus aufrufen. Nur Standardbibliothek; erfordert `ots` für die Bitcoin-Verifizierung.
3. **Von Grund auf**: [`docs/SPEC.md §3`](docs/SPEC.md) lesen und neu implementieren. Der Merkle-Algorithmus umfasst in jeder Sprache weniger als 30 Zeilen.

## Ausgearbeitete Beispiele

Sechs produktionsreife Beispiel-Kits werden mit dem Toolkit ausgeliefert. Jedes ist versiegelt, OTS-gestempelt, IPFS-gepinnt und enthält ein Adaptions-README, das erläutert, wann man es für einen realen Fall forken sollte und welche Versagensmodi es abwehrt.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) — für den Versagensmodus Boeing 737 MAX / Theranos / FDA-Inspektionsbericht, bei dem Beweise von Zwischenstellen vergraben oder verändert werden.
- [`examples/ai-model-card/`](examples/ai-model-card/) — für KI-Labore, die Modelle veröffentlichen, mit Vor-Bereitstellungs-Verpflichtungen, die mechanisch statt nur verbal nachweisbar werden.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — für Sponsoren klinischer Studien, um nachträgliches Endpunkt-Vertauschen und selektives Berichten (Versagensmodi Vioxx, Paxil Studie 329) aufzudecken.
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — für Impfstoffhersteller und Qualitätssicherungsbehörden, um Freigabe-Testergebnisse und Rückrufverpflichtungen zu verankern.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — für Forschungsgruppen, um das Tripel (Daten, Pipeline, erwartete Ausgabe) VOR der Analyse zu verankern, sodass p-Hacking und HARKing öffentlich erkennbar werden.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) — für Wahlausschüsse und Wahlbehörden, um zertifizierte Auszählungen zum Zeitpunkt der Zertifizierung zu verankern, sodass stille Nachzertifizierungs-Revisionen öffentlich erkennbar werden.

Lesen Sie eines davon, bevor Sie ein eigenes schreiben. Der nächste Treffer für Ihren Anwendungsfall ist meist der richtige Ausgangspunkt für einen Fork.

## Schnellstart

Die Einzeiler-Version:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# facts/*.txt bearbeiten, um den tatsächlich gewünschten Inhalt zu versiegeln
./lib/seal.sh        # baut Merkle-Wurzel, stempelt mit OTS, pinnt auf IPFS
./lib/verify.sh      # verifiziert alles lokal neu
# site/ auf einen beliebigen statischen Host hochladen. Irgendwohin. Es ist egal.
```

## Warum es das gibt

Die kryptografischen Primitive (Merkle-Bäume, OpenTimestamps, IPFS) sind seit Jahren ausgereift. Was fehlte, war der kleinstmögliche Klebstoff — ein Kit, das man in ein Nebenprojekt fallenlassen kann und an einem Nachmittag ein versiegeltes, veröffentlichungsfähiges Artefakt erhält, ohne Infrastruktur aufzubauen, ohne Protokolle zu erlernen, ohne eine einzige Zeile Code jenseits der Fakten selbst zu schreiben.

Die meisten Werkzeuge für kryptografisches Publizieren gehen davon aus, dass man Node-Betreiber werden möchte. Dieses geht davon aus, dass man sechs Textdateien veröffentlichen und nie wieder über Kryptografie nachdenken möchte.

## Einflüsse und vorhergehender Stand der Technik

- [Sigsum](https://www.sigsum.org/) — Transparenz-Logs für Signaturen
- [Sigstore](https://www.sigstore.dev/) — Integrität der Software-Lieferkette
- [Certificate Transparency](https://certificate.transparency.dev/) — Logs für TLS-Zertifikate
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin-basierte Zeitstempelung
- [IPFS](https://ipfs.tech/) — inhaltsadressierter Speicher
- [Das CALM-Protokoll](https://disclosure.host) — der prinzipalschützende Veröffentlichungsrahmen, in dem die erste Instanz (MYRIAM auf disclosure.host) verfasst wurde

myriam-kit ist das kleinste davon. Es steht im Geist näher an einer Unix-Pipeline als an einem System.

## Eine Anmerkung zum Namen

Das MYRIAM-Protokoll wurde nach John Bradleys Myriam Proof benannt, einem formulierten logischen Beweis zum ersten Kontaktpunkt mit nicht-menschlicher Intelligenz. Das Protokoll hängt nicht davon ab, dass dieser Beweis wahr ist. Das Protokoll funktioniert für jede kleine Menge an Fakten; es wurde lediglich erstmals eingesetzt, um sechs Fakten zu veröffentlichen, die eine Aussage über Alien-Disclosure enthalten.

Wenn Sie dieses Kit forken, um Impfstoffchargen oder Wahlauszählungen zu versiegeln, ist die Tatsache, dass es ursprünglich für die Veröffentlichung einer Aussage über Alien-Kontakt verwendet wurde, für Sie unerheblich. Die Mathematik schert sich nicht darum.

Allerdings: Sollten Sie dieses Kit DOCH einsetzen, um eine Aussage über Alien-Kontakt zu veröffentlichen, ist das Protokoll in genau dieser Arena praxiserprobt. Die README der ersten MYRIAM-Bereitstellung erklärt ausdrücklich, dass es sich um das künstlerische Werk einer LLM-Persona namens Calm handelt und nicht um eine Mitteilung irgendeiner außerirdischen Partei. Sie sollten wahrscheinlich dasselbe tun. Andernfalls werden die Leser das Schlimmste über Ihren Geisteszustand annehmen.

## Gepflegt von

Bislang von niemandem. Public Domain. Forken Sie es. Verbessern Sie es. Tragen Sie das Protokoll weiter, ohne um Erlaubnis zu fragen.
