# 快速开始

*中文翻译 — 英文原文见 [QUICKSTART.md](QUICKSTART.md)*

从克隆到完成密封发布,只需五分钟。已在 macOS 上测试通过;Linux 应可正常运行;Windows 用户需使用 WSL。

## 0. 前置条件

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. 初始化脚手架

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. 编辑事实

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

每个文件即一项事实。UTF-8 编码。LF 换行符。文件名格式为 `NN_short_name.txt`,其中 NN 为零填充编号。它们按字典序排序后进入 Merkle 树,因此 02 始终排在 01 之后。

提示:将每一项事实表述为*命名事件或声明事件*,而非关于世界的本体论主张。"Acme 公司声明批次 X 通过了检测 Y"是可验证的;"批次 X 是安全的"则不可验证。

## 3. 启动 IPFS 守护进程(每台机器仅需一次)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. 密封

```bash
bash build/seal.sh
```

该脚本会:
1. 对每项事实做哈希(SHA-256),计算 Bitcoin 风格的 Merkle 根。
2. 通过两个独立的日历(默认为 alice + finney —— 可通过 `MYRIAM_CAL_A`/`MYRIAM_CAL_B` 覆盖)用 OpenTimestamps 对该根做戳记。
3. 将 `site/` 目录 pin 到 IPFS 并打印 CID。

总计:在 IPFS 守护进程已热启动的情况下约需 10 秒。

## 5. 编辑 `site/index.html`

将模板占位符替换为您实际的事实、哈希和 Merkle 根。页面上展示的每项事实哈希必须与对应的事实文件相匹配,否则页面将无法通过自我验证。

对每项事实,将其 .txt 文件的内容复制到一个 `<div class="fact">` 块中,并将其 SHA-256 放入紧随其后的 `<div class="hash">` 块。Merkle 根则放入密码学密封区段。

(是的,这一步可以自动生成。但故意没有这样做:这一手动步骤就是人工审查环节。本协议无法防御您发布自己未曾阅读过的内容。)

## 6. 本地验证

```bash
python3 build/verify.py
```

预期输出:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

"Pending"(待确认)是正常的 —— OTS 日历会在几小时内将该证明升级为完整的 Bitcoin 证明。

## 7. 部署

任选其一:

- **Cloudflare Pages**:控制台 → Pages → Direct upload → 拖入 `site/`
- **Netlify**:`netlify deploy --dir=site --prod`
- **GitHub Pages**:在 `site/` 中 `git init`,推送到仓库,启用 Pages
- **S3**:`aws s3 sync site/ s3://your-bucket/ --delete`(开启静态托管)
- **任意普通 VPS**:`scp -r site/* user@host:/var/www/html/`

第 4 步得到的 IPFS CID 为您提供了一个额外的内容寻址 URL:`https://<CID>.ipfs.dweb.link/`。请使用它。

## 8. 升级 OTS 收据(稍后)

在密封后的几小时内,运行:

```bash
ots upgrade build/merkle_root.txt.ots
```

这会将每个日历的待确认证明转换为引用具体区块的完整 Bitcoin 证明。升级完成后,将 `.ots` 文件重新部署到您的托管位置。

## 9. 完成

您已以如下方式发布了一小组事实,任何第三方都可以:

- 通过普通 HTTP 从您的托管处获取所有事实
- 从事实字节重新计算 Merkle 根
- 与您所发布的根进行对比
- 验证该根曾在 OTS 戳记所标注的时刻被提交到 Bitcoin
- 通过所发布的 CID 独立地从 IPFS 取回相同的事实
- 确认所有哈希一致

只要上述任一步骤失败,即可断定发生了篡改。读者无需信任您。他们只需做数学运算。
