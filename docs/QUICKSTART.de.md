*Deutsche Übersetzung — für die englische Originalfassung siehe [QUICKSTART.md](QUICKSTART.md)*

# Schnellstart

Fünf Minuten vom Klonen bis zur versiegelten Veröffentlichung. Unter macOS getestet; Linux sollte funktionieren; Windows-Nutzer benötigen WSL.

## 0. Voraussetzungen

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Gerüst aufsetzen

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Fakten bearbeiten

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Jede Datei ist ein Fakt. UTF-8. LF-Zeilenenden. Das Dateinamen-Muster ist
`NN_short_name.txt`, wobei NN mit Nullen aufgefüllt wird. Sie werden
lexikografisch in den Merkle-Baum einsortiert, sodass 02 immer auf 01 folgt.

Tipp: Formulieren Sie jeden Fakt als ein *Benennungs- oder
Deklarationsereignis*, nicht als ontologische Aussage über die Welt.
"Acme Corp hat erklärt, dass Charge X den Test Y bestanden hat" ist
verifizierbar. "Charge X ist sicher" ist es nicht.

## 3. Den IPFS-Daemon starten (einmalig pro Rechner)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Versiegeln

```bash
bash build/seal.sh
```

Dies wird:
1. Jeden Fakt hashen (SHA-256) und die Bitcoin-konforme Merkle-Wurzel berechnen.
2. Die Wurzel mit OpenTimestamps über zwei unabhängige Kalender stempeln
   (standardmäßig alice + finney — überschreibbar via `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Das Verzeichnis `site/` auf IPFS pinnen und die CID ausgeben.

Gesamtdauer: ~10 Sekunden bei warmem IPFS-Daemon.

## 5. `site/index.html` bearbeiten

Ersetzen Sie die Vorlagen-Platzhalter durch Ihre tatsächlichen Fakten,
Hashes und die Merkle-Wurzel. Die angezeigten Hashes pro Fakt müssen mit
den Hashes der einzelnen Fakt-Dateien übereinstimmen, sonst scheitert die
Seite an ihrer eigenen Selbstverifizierung.

Kopieren Sie für jeden Fakt den Textkörper der .txt-Datei in einen
`<div class="fact">`-Block und setzen Sie den SHA-256 in ein
`<div class="hash">` direkt darunter. Die Merkle-Wurzel gehört in den
Abschnitt zur kryptografischen Versiegelung.

(Ja, das ließe sich automatisch generieren. Es wird bewusst nicht
automatisiert: Der manuelle Schritt ist der Schritt der menschlichen
Prüfung. Das Protokoll schützt nicht davor, etwas zu veröffentlichen,
das man nicht gelesen hat.)

## 6. Lokal verifizieren

```bash
python3 build/verify.py
```

Erwartete Ausgabe:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

Das "Pending" ist normal — der OTS-Kalender wird die Attestierung
innerhalb weniger Stunden zu einer vollständigen Bitcoin-Attestierung
hochstufen.

## 7. Bereitstellen

Wählen Sie eine der folgenden Möglichkeiten:

- **Cloudflare Pages**: Dashboard → Pages → Direct upload → `site/` per Drag&Drop hochladen
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` in `site/`, ins Repository pushen, Pages aktivieren
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (statisches Hosting aktiviert)
- **Beliebiger einfacher VPS**: `scp -r site/* user@host:/var/www/html/`

Die IPFS-CID aus Schritt 4 liefert Ihnen zusätzlich eine
inhaltsadressierte URL: `https://<CID>.ipfs.dweb.link/`. Nutzen Sie sie.

## 8. Die OTS-Quittung hochstufen (später)

Führen Sie innerhalb weniger Stunden nach dem Versiegeln aus:

```bash
ots upgrade build/merkle_root.txt.ots
```

Dies wandelt die ausstehende Attestierung jedes Kalenders in eine
vollständige Bitcoin-Attestierung um, die auf einen konkreten Block
verweist. Nach dem Hochstufen die `.ots`-Datei erneut auf Ihre Hosts
hochladen.

## 9. Das war's

Sie haben eine kleine Menge an Fakten so veröffentlicht, dass jeder Dritte:

- Alle Fakten über schlichtes HTTP von Ihrem Host abrufen kann
- Die Merkle-Wurzel aus den Fakt-Bytes neu berechnen kann
- Sie mit Ihrer veröffentlichten Wurzel vergleichen kann
- Verifizieren kann, dass die Wurzel zum OTS-gestempelten Zeitpunkt in Bitcoin verankert wurde
- Dieselben Fakten unabhängig über IPFS unter der veröffentlichten CID abrufen kann
- Bestätigen kann, dass alle Hashes übereinstimmen

Schlägt einer dieser Schritte fehl, hat eine Manipulation stattgefunden.
Der Leser muss Ihnen nicht vertrauen. Er muss nur rechnen.
