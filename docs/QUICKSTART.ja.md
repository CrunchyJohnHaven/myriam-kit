# クイックスタート

*日本語訳 — 英語の原文は [QUICKSTART.md](QUICKSTART.md) を参照*

クローンから封緘済み公開までを 5 分で。macOS で検証済み。Linux でも動作するはずです。Windows のユーザーは WSL が必要です。

## 0. 前提条件

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. スキャフォールド

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. 事実(facts)を編集する

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

各ファイルが 1 つの事実です。UTF-8、改行は LF。ファイル名のパターンは `NN_short_name.txt` で、NN はゼロ埋めされた連番です。これらは辞書順にソートされて Merkle ツリーに組み込まれるため、02 は常に 01 の後に来ます。

ヒント: すべての事実を *世界に関する存在論的主張* ではなく、*命名イベント(naming event)* または *宣言イベント(declaration event)* として表現してください。「Acme Corp はバッチ X がテスト Y に合格したと宣言した」は検証可能です。「バッチ X は安全である」は検証可能ではありません。

## 3. IPFS デーモンを起動する(マシンごとに 1 回)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. 封緘(Seal)する

```bash
bash build/seal.sh
```

これは以下を行います。

1. 各事実をハッシュ化(SHA-256)し、Bitcoin 流の Merkle ルートを計算します。
2. ルートを OpenTimestamps を介して 2 つの独立したカレンダーでスタンプします(デフォルトでは alice + finney — `MYRIAM_CAL_A`/`MYRIAM_CAL_B` で上書き可能)。
3. `site/` ディレクトリを IPFS にピン留めし、CID を表示します。

合計所要時間: IPFS デーモンが温まっていれば約 10 秒。

## 5. `site/index.html` を編集する

テンプレートのプレースホルダを、実際の事実、ハッシュ、Merkle ルートで置き換えてください。表示される各事実のハッシュは、各事実ファイルと一致しなければなりません。一致しない場合、ページは自己検証に失敗します。

各事実について、.txt ファイルの本文を `<div class="fact">` ブロックにコピーし、そのすぐ下の `<div class="hash">` に SHA-256 を入れてください。Merkle ルートは暗号封緘(cryptographic seal)セクションに記載します。

(そう、これは自動生成できる。それを敢えてしていない: この手動ステップこそが人間によるレビューのステップだからである。プロトコルは、あなたが読んでいないものを公開してしまうことに対しては守ってくれない。)

## 6. ローカルで検証する

```bash
python3 build/verify.py
```

期待される出力:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

「Pending(保留)」は正常です — OTS カレンダーは数時間以内にこの証明を完全な Bitcoin による証明にアップグレードします。

## 7. デプロイ

以下のいずれかを選んでください。

- **Cloudflare Pages**: ダッシュボード → Pages → Direct upload → `site/` をドラッグ
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `site/` 内で `git init`、リポジトリに push、Pages を有効化
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete`(静的ホスティングをオン)
- **任意の素の VPS**: `scp -r site/* user@host:/var/www/html/`

ステップ 4 で得られた IPFS の CID は、コンテンツアドレッシングによる追加の URL を提供します: `https://<CID>.ipfs.dweb.link/`。これを使ってください。

## 8. OTS レシートをアップグレードする(後で)

封緘から数時間以内に、以下を実行します。

```bash
ots upgrade build/merkle_root.txt.ots
```

これにより、各カレンダーの保留中の証明が、特定のブロックを参照する完全な Bitcoin による証明に変換されます。アップグレード後は `.ots` ファイルをホストに再デプロイしてください。

## 9. 以上です

これで、第三者の誰もが以下を行える形で、少数の事実集合を公開したことになります。

- あなたのホストから素の HTTP で全ての事実を取得する
- 事実のバイト列から Merkle ルートを再計算する
- 公開されたルートと比較する
- そのルートが OTS スタンプの示す時刻に Bitcoin にコミットされたことを検証する
- 公開された CID から IPFS 経由で同じ事実を独立に取得する
- すべてのハッシュが一致することを確認する

これらのステップのいずれかが失敗した場合、改ざんが行われています。読者はあなたを信頼する必要がありません。ただ計算をするだけです。
