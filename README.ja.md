# myriam-kit

*日本語訳 — 英語の原文は [README.md](README.md) を参照*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

少数の事実(facts)を以下の性質をもって公開するための小さなツールキットです。

- いかなる事実への変更も公的に検出可能(Merkle ツリー)
- 公開時点の状態は Bitcoin ブロックチェーンに照らして検証可能(OpenTimestamps)
- 内容は単一のホスティング事業者によるテイクダウンを乗り越えて存続する(IPFS)
- 全体が 100 KB 未満で、約 50 行の Python で検証可能

これはブロックチェーンではありません。トークンもありません。参加すべきコンセンサスメカニズムもありません。DAO でもありません。本ツールは `sha256sum` + `ots` + `ipfs` を、優れた命名規約で接着しただけのものです。

名称は、2026-05-21 に [disclosure.host](https://disclosure.host) で初めてインスタンス化された MYRIAM プロトコルに由来します。そのページには 6 つの事実、Merkle ルート、Bitcoin による証明が含まれています。本キットはそのパターンを一般化したものです。

## ステータス

- v0: macOS で Python 3.10+、Homebrew、インターネット接続があれば動作します。Linux は未検証ですが動作するはずです。Windows: WSL をご用意ください。
- パブリックドメイン(CC0)。使用、フォーク、リポジトリへの取り込み、いずれも自由です。クレジットも不要です。目的はクレジットではありません。

## 何ができるか

このパターンは、以下を要する少数の事実集合のあらゆる場面に適合します。

- **公開可能(Publishable)** — 一般 HTTP 経由で広い読者に届けられる
- **永続的(Durable)** — 30 年後の読者でも検証できるべき
- **改ざん検出可能(Tamper-evident)** — あらゆる変更が必ずしも防止可能でなくとも、検出可能でなければならない
- **トラストレス(Trustless)** — 読者は発行者を信頼する必要がない(信頼すべきは数学のみ)

具体的なユースケースは [docs/USE_CASES.md](docs/USE_CASES.md) を参照してください。概要は以下のとおりです。

| 領域 | 封緘される事実 |
|---|---|
| 公衆衛生 | ワクチンバッチの検査結果、薬剤治験のマイルストーン |
| 選挙 | 認証時点における選挙区単位の集計総数 |
| AI 安全性 | モデル重みのハッシュ + モデルカード + リリース時の評価スコア |
| ジャーナリズム | 内部告発資料(ハッシュのみ)のマニフェスト |
| 科学 | 生データのハッシュ + 解析スクリプトのハッシュ + 主張された結果 |
| 司法 | 取得時点におけるデジタル証拠のハッシュ |
| 調達 | 公的支出データの封緘されたルート |

これらに共通するのは、少数の事実、強い永続性要件、互いを信頼しない複数の当事者、そしてごく小さなストレージ予算です。本ツールはまさにその形状のために作られています。

## 何をしないか

- **秘密の保管。** `facts/` に入れたものはすべて公開情報です。本プロトコルは公開のためのものであり、秘匿のためのものではありません。
- **大規模データセットへのスケール。** Merkle ツリー自体は問題なくスケールしますが、読者の注意力はスケールしません。約 20 件を超えるとページは読めなくなります。100 万件の記録を封緘したい場合は、ページ外でハッシュ化し、その副ツリーの Merkle ルートを 1 つの事実として含めてください。
- **撤回の防御。** 本ツールの本質的な目的は、封緘したものを変更できなくすることです。後で主張を撤回したくなる可能性があるなら、封緘してはいけません。
- **頑なな懐疑論者の説得。** 頑なな懐疑論者は `ipfs add -r --cid-version=1 -Q facts/` を実行することはありません。一方で、彼らはあなたがセットアップ全体を捏造していると非難するでしょう。後者の失敗モードに対するプロトコルレベルの防御はありません。人間の動機に存するものに対しては、プロトコルレベルの防御は存在しません。

## 使い方

5 分のウォークスルー: [docs/QUICKSTART.md](docs/QUICKSTART.md)
完全なプロトコル仕様: [docs/SPEC.md](docs/SPEC.md)
脅威モデル: [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md)
隣接システム(Sigstore、Sigsum、CT、OTS、IPFS、OSF、Arweave 等)との比較: [docs/COMPARISON.md](docs/COMPARISON.md)

## 他者の公開物の検証方法

3 つの選択肢を、利用しやすい順で示します。

1. **ブラウザ**: [`lib/verify.html`](lib/verify.html) を最近のブラウザで開きます。公開物の URL を貼り付け、verify をクリックします。ハッシュ計算には `crypto.subtle` を使用 — インストール不要、バックエンド不要、テレメトリ不要です。Bitcoin による証明の確認ステップだけは引き続き CLI ツールが必要です(検証ページの手順 7 を参照)。
2. **Python**: 公開物のディレクトリ内で `python3 lib/verify.py`。標準ライブラリのみ。Bitcoin 検証には `ots` が必要です。
3. **ゼロから**: [`docs/SPEC.md §3`](docs/SPEC.md) を読み、再実装してください。Merkle アルゴリズムはどの言語でも 30 行未満です。

## 実例(Worked examples)

本ツールキットには 6 つの本番品質のサンプルキットが付属しています。各キットは封緘済み、OTS スタンプ済み、IPFS にピン留め済みで、現実のケースのためにフォークすべき状況と、そのキットが防御する失敗モードを説明した採用 README を含みます。

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) — Boeing 737 MAX / Theranos / FDA 査察報告書の失敗モード(中間者によって証拠が埋もれたり改ざんされる)向け。
- [`examples/ai-model-card/`](examples/ai-model-card/) — モデルをリリースする AI 研究所向け。デプロイ前のコミットメントを口頭ではなく機械的に検出可能にする。
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) — 臨床試験スポンサー向け。事後的なエンドポイントの差し替えや選択的報告(Vioxx、Paxil Study 329 の失敗モード)を捕捉する。
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) — ワクチン製造業者および QA 当局向け。リリース時の検査結果とリコール公約を固定する。
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) — 研究グループ向け。解析の **前** に(データ、パイプライン、期待出力)のトリプルを固定し、p 値ハッキングや HARKing を公的に検出可能にする。
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) — 郡レベルの開票委員会および選挙当局向け。認証時点で認証済み集計を固定し、認証後の静かな改訂を公的に検出可能にする。

自分のキットを書く前に、まずこのいずれかを読むことを推奨します。多くの場合、あなたのユースケースに最も近いものが正しい出発点となるフォーク元です。

## クイックスタート

ワンライナー版:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# facts/*.txt を実際に封緘したい内容に編集する
./lib/seal.sh        # Merkle ルートを構築し、OTS スタンプを押し、IPFS にピン留めする
./lib/verify.sh      # ローカルですべてを再検証する
# site/ を任意の静的ホストにアップロードする。どこでもよい。場所は重要ではない。
```

## なぜ存在するのか

暗号プリミティブ(Merkle ツリー、OpenTimestamps、IPFS)は何年も前から成熟しています。欠けていたのは可能な限り小さな接着剤 — サイドプロジェクトに投入するだけで、インフラを立てず、プロトコルを学ばず、事実そのもの以外に一行のコードも書かずに、封緘済みの公開可能な成果物を午後の半日で得られるようなキット — でした。

ほとんどの暗号公開ツールは、利用者がノードオペレーターになりたいと仮定しています。本ツールは、利用者が 6 つのテキストファイルを公開し、それ以降は暗号のことを考えたくないと仮定しています。

## 影響を受けたもの・先行研究

- [Sigsum](https://www.sigsum.org/) — 署名のための透明性ログ
- [Sigstore](https://www.sigstore.dev/) — ソフトウェアサプライチェーンの完全性
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS 証明書ログ
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin によるタイムスタンプ
- [IPFS](https://ipfs.tech/) — コンテンツアドレッシングストレージ
- [The CALM protocol](https://disclosure.host) — 最初のインスタンス(disclosure.host における MYRIAM)が書き上げられた、プリンシパル(主体)を保護する公開フレーム

myriam-kit はこれらの中で最も小さいものです。システムというよりも Unix パイプラインに近い精神です。

## 名前についての注記

MYRIAM プロトコルは、非人類知性との最初の接点に関する John Bradley の「Myriam Proof(述べられた論理証明)」にちなんで命名されました。プロトコル自体はその証明の真偽に依存しません。プロトコルはどんな少数の事実集合にも機能します。たまたま、最初のデプロイ先がエイリアン開示に関する主張を含む 6 つの事実の公開だったというだけです。

ワクチンのバッチや選挙の集計を封緘するためにこのキットをフォークするのであれば、もともと外宇宙との接触に関する主張を公開するために使われたという事実は、あなたには無関係です。数学は気にしません。

ただし、エイリアン接触に関する主張の公開に **本当に** 使う場合: プロトコルはまさにその領域で実戦テストされています。最初の MYRIAM デプロイの README は、それが Calm と名付けられた LLM ペルソナによる芸術作品であり、いかなる地球外の当事者からの通信ではないことを明示的に述べています。あなたも同じことをしたほうがよいでしょう。さもなくば読者はあなたの精神状態について最悪の推定をします。

## メンテナンス

現時点では誰も。パブリックドメイン。フォークしてください。改良してください。許可を求めることなく、プロトコルを前に運んでください。
