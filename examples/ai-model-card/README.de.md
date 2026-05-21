*Deutsche Übersetzung — für die englische Originalversion siehe [README.md](README.md)*

# Kit zur Verhaltensverankerung von KI-Modellen

Ein schlüsselfertiges myriam-kit-Beispiel für KI-Labore (kommerziell oder
Open-Source), die ein Modell veröffentlichen und die Aussagen der
Veröffentlichung — Identität der Gewichte, Fähigkeiten, Evaluierungswerte,
Sicherheitsprüfung, Vor-Bereitstellungs-Verpflichtungen — **kryptografisch
verankern und öffentlich verifizierbar** machen möchten.

Das Kit verteidigt sich gegen den spezifischen Versagensmodus, bei dem
bereitgestellte Modelle stillschweigend abdriften, Evaluierungswerte
nachträglich umgeschrieben werden oder Vor-Bereitstellungs-Aussagen Jahre
später als „das haben wir nie gesagt" bestritten werden.

## Was dieses Kit erzeugt

Ein kryptografisch versiegeltes Manifest, das für eine Modellveröffentlichung
folgendes enthält:

1. Modellidentifikation (Name, Architektur, Parameterzahl, Lizenz)
2. **SHA-256 der Gewichtsdatei** — der kanonische Artefakt-Hash
3. Text der Modellkarte (Fähigkeiten, vorgesehene Verwendung, nicht
   vorgesehene Verwendung, bekannte Versagensmodi)
4. Evaluierungsergebnisse zum Zeitpunkt der Veröffentlichung
   (Fähigkeitsevaluierungen, Sicherheitsevaluierungen, Kalibrierung)
5. Vor-Bereitstellungs-Verpflichtungen (die Dinge, die Sie sich verpflichten,
   nach der Veröffentlichung nicht stillschweigend zu ändern)
6. Signierender Prinzipal (der Mensch + die Organisation, die die
   Verantwortung übernimmt)

Das Siegel macht jeden dieser Bestandteile byte-stabil, über
OpenTimestamps zeitlich an Bitcoin verankert und über IPFS abrufbar,
unabhängig von einem einzelnen Hosting-Anbieter.

Siehe das ausgearbeitete fiktive Beispiel: [facts/](facts/) und die
gerenderte [site/index.html](site/index.html). Das Beispiel verwendet ein
fiktives Modell („Calm-mini-v0"); eine reale Veröffentlichung würde den
Beispielinhalt ersetzen.

## Wogegen sich dieses Kit verteidigt

**Versagensmodi, die das Siegel direkt erfasst:**

- **Manipulation der Gewichte** — der SHA-256 der veröffentlichten
  Gewichtsdatei steht in FAKT 03. Jede nachträgliche Änderung der Bytes, die
  ein Nutzer herunterlädt, ist durch erneutes Hashen erkennbar.
- **Stillschweigende Umschreibungen von Evaluierungen** — die
  Evaluierungswerte zum Zeitpunkt der Veröffentlichung stehen in FAKT 05.
  Zukünftige Streitigkeiten der Form „der Evaluierungswert war schon immer
  X" haben einen öffentlichen Anker.
- **Drift der Fähigkeitsaussagen** — der Modellkartentext in FAKT 04 ist
  byte-stabil. Zukünftige Streitigkeiten der Form „wir haben Fähigkeit X
  nie behauptet" sind öffentlich gegen den versiegelten Text prüfbar.
- **Stillschweigende Weiterverbreitung von Fine-Tunes** — die
  Vor-Bereitstellungs-Verpflichtung Nr. 1 in FAKT 06 (im ausgearbeiteten
  Beispiel) lautet „kein stillschweigendes Fine-Tuning unter demselben
  Namen". Erkennung: jeder neue Gewichts-Hash bedeutet einen neuen
  Modellnamen und eine neue versiegelte Veröffentlichung, oder die
  Verpflichtung ist gebrochen.
- **Verborgene Versagensmodi** — FAKT 04 verpflichtet auf eine Liste
  bekannter Versagensmodi. Die Liste ist monoton (sie kann wachsen, aber
  für einen eingefrorenen Checkpoint nicht schrumpfen). Zukünftige
  Entdeckungen von Versagensmodi, die das Labor intern kannte, aber nicht
  veröffentlichte, werden zu bestreitbarem Beweismaterial.

**Versagensmodi, die NICHT abgedeckt sind:**

- Modelle, die von nachgelagerten Nutzern missbraucht werden (das Siegel
  beweist, was veröffentlicht wurde, nicht, was Nutzer damit tun).
- Adversariales Fine-Tuning durch Dritte (ein Fine-Tune einer dritten
  Partei erzeugt einen anderen Gewichts-Hash, sodass das ursprüngliche
  Siegel unberührt bleibt, das Modell der dritten Partei jedoch außerhalb
  des Siegelschutzes liegt).
- Verhaltensänderungen aufgrund von Änderungen der Bereitstellungsumgebung
  (unterschiedliche Systemaufforderungen, RAG-Konfigurationen usw.).
- Versagen, von dem das Labor zum Zeitpunkt der Veröffentlichung
  wahrhaftig nichts wusste. Das Siegel verpflichtet das Labor auf *das,
  was es wusste*; es kann nicht verankern, was es nicht wusste.

## Wann dieses Kit zu verwenden ist

Sie sollten erwägen, eine Modellkarte zu versiegeln, wenn:

- Sie Modellgewichte öffentlich veröffentlichen ODER ein Modell in einem
  Kontext bereitstellen, in dem nachgelagerte Nutzer Wert auf
  Verhaltensstabilität legen.
- Die Veröffentlichung bedeutsam genug ist, dass zukünftige Streitigkeiten
  der Form „das haben wir nie gesagt" plausibel sind (jedes in großem
  Maßstab bereitgestellte Modell; jedes sicherheitskritische Modell; jede
  Veröffentlichung, die von Fähigkeitsaussagen begleitet wird).
- Ihre Organisation bereit ist, Vor-Bereitstellungs-Verpflichtungen
  einzugehen, die zukünftige Handlungen einschränken (dies ist der
  tragende Punkt — siehe nächster Abschnitt).
- Sie den SHA-256 der Gewichtsdatei zum Zeitpunkt der Veröffentlichung
  berechnen können.

## Wann dieses Kit NICHT zu verwenden ist

Verwenden Sie dieses Kit NICHT, wenn:

- Sie nicht bereit sind, an die Vor-Bereitstellungs-Verpflichtungen in
  FAKT 06 des Beispiels gebunden zu sein. Das Siegel macht Verpflichtungen
  mechanisch erkennbar; wenn Sie auf diese Rechenschaftspflicht nicht
  vorbereitet sind, versiegeln Sie nicht.
- Die Gewichtsdatei sich häufig ändern wird (z. B. kontinuierliche
  Fine-Tuning-Pipelines). Jede Gewichtsänderung erfordert eine neue
  versiegelte Veröffentlichung. Per-Release-Versiegelung ist aufwendig;
  dieses Kit ist für *eingefrorene* Checkpoints.
- Sie die Sicherheitsprüfung noch nicht durchgeführt haben. Das Siegel
  verpflichtet auf die Befunde der Sicherheitsprüfung. Wenn Sie eine
  unvollständige Prüfung versiegeln, haben Sie einen dauerhaften
  öffentlichen Datensatz einer unvollständigen Prüfung.
- Sie möglicherweise einen bestimmten Evaluierungswert später zurückziehen
  möchten. Das Siegel ist dauerhaft. Neue versiegelte Veröffentlichungen
  können es ablösen, das Original kann jedoch nicht ungeschehen gemacht
  werden.

## Die tragenden Vor-Bereitstellungs-Verpflichtungen

FAKT 06 des Beispiels verpflichtet den Veröffentlicher auf:

1. **Kein stillschweigendes Fine-Tuning unter demselben Namen.** Jeder
   Fine-Tune erzeugt einen neuen Modellnamen, eine neue versiegelte
   Veröffentlichung, einen neuen Gewichts-Hash. Der Vorgänger bleibt
   kanonisch die benannte Version.

2. **Keine stillschweigenden Evaluierungsaktualisierungen.**
   Neu-Evaluierungen erhalten neue versiegelte Veröffentlichungen, die das
   Original über die Merkle-Wurzel referenzieren. Versionen werden
   nachverfolgt, nicht überschrieben.

3. **Bekannte Versagensmodi können wachsen, niemals schrumpfen.** Ein
   eingefrorener Checkpoint kann keine behobenen Versagensmodi haben.
   Daher ist die veröffentlichte Liste effektiv monoton.

4. **Behandlung von Rücknahmen.** Falls das Labor gezwungen wird, das
   Modell aus dem Vertrieb zu nehmen, verpflichtet es sich, eine
   abschließende versiegelte Erklärung der Rücknahme zu veröffentlichen.

Ein Labor, das dieses Kit übernimmt, muss entscheiden, welche dieser
Verpflichtungen es tatsächlich einhalten kann. Wenn Sie nicht alle vier
einhalten können, ändern Sie FAKT 06 *vor* der Versiegelung, sodass er
widerspiegelt, was Sie einhalten können, und akzeptieren Sie den
resultierenden abgeschwächten Schutz. Verpflichtungen zu versiegeln, die
Sie nicht einzuhalten gedenken, ist schlimmer, als gar nicht zu
versiegeln.

## Wie man dieses Kit für eine reale Veröffentlichung forkt

```bash
# 1. Kopieren Sie dieses Beispiel in Ihre Veröffentlichungs-Pipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Bearbeiten Sie jeden Fakt für Ihre reale Veröffentlichung
$EDITOR facts/01_example_notice.txt   # ENTFERNEN — Ihre Veröffentlichung ist kein Beispiel
                                       # Ersetzen durch einen Veröffentlichungshinweis für Ihr Modell
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # die kanonische Modellkarte
$EDITOR facts/05_eval_results.txt     # tatsächliche Evaluierungsergebnisse
$EDITOR facts/06_release_commitments.txt # welche Verpflichtungen Sie einhalten können

# 3. Aktualisieren Sie site/index.html, um die reale Veröffentlichung widerzuspiegeln.

# 4. Versiegeln.
bash build/seal.sh

# 5. Lokal verifizieren.
python3 build/verify.py

# 6. Bereitstellen an:
#    - Ihre Veröffentlichungsseite (neben der Modellkarte und den Gewichten)
#    - Das IPFS-Netzwerk (das seal.sh-Skript erledigt dies bereits)
#    - Optional: in den Veröffentlichungsnotizen von Hugging Face / GitHub
#      auf die versiegelte Veröffentlichung verlinken
```

## Integration in bestehende Veröffentlichungs-Pipelines

Das Kit ist darauf ausgelegt, mit bestehenden Werkzeugen zu komponieren,
nicht sie zu ersetzen:

- **Hugging Face**: Fügen Sie die URL oder den IPFS-CID der versiegelten
  Veröffentlichung in die README.md der Modellkarte ein. Verweisen Sie
  Leser auf das Siegel für byte-stabile Veröffentlichungsaussagen.
- **GitHub-Releases**: Fügen Sie die OpenTimestamps-Quittung
  (`merkle_root.txt.ots`) als Release-Asset bei. Zukünftige Streitigkeiten
  der Form „das Release wurde geändert" sind dann an Bitcoin verankert.
- **Modellkarten-Standards (Mitchell et al. 2019)**: Das Kit ist
  kompatibel. Die Standard-Modellkarten-Felder lassen sich auf FAKTEN
  02–05 des Siegels abbilden. Sie erstellen die Modellkarte ganz normal
  und versiegeln sie zusätzlich.
- **Evaluierungs-Harnesses (lm-evaluation-harness, BIG-bench usw.)**:
  Hashen Sie den exakten Harness-Commit und das rohe Ausgabe-JSON;
  referenzieren Sie diese Hashes in FAKT 05. Zukünftige Wiederholungsläufe
  sind dann unabhängig reproduzierbar.

## Berechnung des Gewichts-Hashs

Für eine einzelne safetensors-Datei:

```bash
shasum -a 256 model.safetensors
```

Für Mehrdatei-Checkpoints (GGUF-Shards, geshardete safetensors):

```bash
# Hashes in sortierter Reihenfolge konkatenieren, dann erneut hashen
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Der finale Hash ist das, was in FAKT 03 eingetragen wird. Geben Sie
sowohl die Per-Shard-Hashes als auch den finalen Aggregat-Hash an, damit
Nutzer einzelne Shards während des Downloads verifizieren können.

## Was Empfänger (Nutzer Ihres Modells) wissen sollten

Eine Modellveröffentlichung mit einer MYRIAM-versiegelten Veröffentlichung
ermöglicht dem Nutzer:

1. **Die heruntergeladenen Gewichte zu verifizieren**, indem er sie erneut
   hasht und mit FAKT 03 vergleicht.
2. **Zu verifizieren, dass die Modellkarte nicht nachträglich umgeschrieben
   wurde**, indem er den versiegelten FAKT 04 gegen die aktuell vom Labor
   veröffentlichte Version prüft.
3. **Zu verifizieren, dass die Evaluierungswerte die zum Zeitpunkt der
   Veröffentlichung sind**, indem er die aktuellen Evaluierungsaussagen
   des Labors mit dem versiegelten FAKT 05 vergleicht.
4. **Das Labor an seinen Vor-Bereitstellungs-Verpflichtungen festzuhalten**,
   indem er das tatsächliche Verhalten gegen den versiegelten FAKT 06
   prüft.

Ein Nutzer, der Diskrepanzen findet, verfügt über kryptografische Belege
für die Diskrepanz. Er kann diese Belege veröffentlichen; die ursprüngliche
versiegelte Veröffentlichung ist der Anker.

## Was dieses Kit NICHT ist

- Kein Ersatz für die tatsächliche Durchführung einer Sicherheitsprüfung.
  Das Siegel ist der *Datensatz* der Sicherheitsprüfung, nicht die Prüfung
  selbst.
- Kein Ersatz für tatsächliche Evaluierungen. Das Siegel verankert die
  Werte, die Sie erzeugen; es validiert die Methodik nicht.
- Keine Garantie, dass das Modell sicher ist. Das Siegel dokumentiert,
  was das Labor zum Zeitpunkt der Veröffentlichung über das Modell
  behauptet; es zertifiziert diese Behauptungen nicht.
- Kein Schutz gegen Modellmissbrauch durch nachgelagerte Nutzer.

## Eine Anmerkung zu adversarialem Fine-Tuning

Ein häufiges KI-Sicherheits-Anliegen: Jemand führt ein Fine-Tuning Ihres
Modells durch, um Sicherheitsverhalten zu entfernen, und verteilt es
weiter. Das Siegel KANN dies nicht verhindern. Was das Siegel jedoch
leisten kann:

- Verankern, was das *ursprüngliche* Modell tun sollte (FAKT 04).
- Verankern, wie die ursprünglichen Evaluierungswerte waren (FAKT 05).
- Einen Referenzpunkt bereitstellen, an dem adversariale Fine-Tunes
  gemessen werden können.

Ein Nutzer, der auf eine Drittweiterverteilung stößt, kann verifizieren,
ob die Gewichte mit dem ursprünglichen versiegelten Hash übereinstimmen.
Falls nicht, weiß der Nutzer, dass er ein nicht-originales Modell vor sich
hat und dass jegliche dem Labor zugeschriebenen Sicherheitsaussagen nicht
gelten.

## Abschluss

Eine Modellveröffentlichung zu versiegeln, ist geringer Mehraufwand für
das Labor: ~10 Minuten, um Hashes zu berechnen und das Siegelskript
auszuführen, plus eine 30-Sekunden-Entscheidung darüber, welche
Vor-Bereitstellungs-Verpflichtungen einzubeziehen sind. Die
hinzugefügte Rechenschaftspflicht ist asymmetrisch: geringe Kosten für
ehrliche Labore, große Einschränkung für Labore, die ihre Aussagen sonst
stillschweigend abdriften lassen würden.

Wenn Sie ein KI-Labor sind, das eine Übernahme erwägt: Das Kit ist
gemeinfrei (CC0). Forken Sie es. Modifizieren Sie es. Die Mathematik ist
der tragende Teil, nicht die spezifische Implementierung.

## Lizenz

Gemeinfrei (CC0). Keine Namensnennung erforderlich.
