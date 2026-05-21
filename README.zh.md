# myriam-kit

*中文翻译 — 英文原文见 [README.md](README.md)*

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

一个小型工具包,用于以如下方式发布一小组事实:

- 对任何事实的任何改动都可被公开检测(Merkle 树)
- 发布时的状态可对照 Bitcoin 区块链进行验证(OpenTimestamps)
- 任何单一托管服务被下架后,内容仍可存续(IPFS)
- 整个工具包体积不到 100 KB,可用约 50 行 Python 代码完成验证

这不是区块链。没有代币。没有可参与的共识机制。没有 DAO。本工具就是 `sha256sum` + `ots` + `ipfs`,通过良好的命名约定粘合在一起。

它以 MYRIAM 协议命名,该协议于 2026-05-21 在 [disclosure.host](https://disclosure.host) 首次实例化。该页面包含六项事实、一个 Merkle 根和一个 Bitcoin 见证。本工具包是该模式的泛化。

## 状态

- v0:在 macOS 上配合 Python 3.10+、Homebrew 与互联网连接可正常工作。Linux 未经测试但应可运行。Windows 用户:请使用 WSL。
- 公有领域(CC0)。请使用、派生、嵌入到您的代码仓中,无需任何署名。重点不在署名。

## 它能用来做什么

该模式适用于任何一组小规模事实需要满足以下要求的场景:

- **可发布** —— 通过普通 HTTP 面向广大受众
- **可持久** —— 30 年后的读者仍应能完成验证
- **可察觉篡改** —— 任何改动必须可被检测,不必然可被阻止
- **无需信任** —— 读者无需信任发布者(只需信任数学)

具体用例见 [docs/USE_CASES.md](docs/USE_CASES.md)。简要列表:

| 领域 | 被密封的事实 |
|---|---|
| 公共卫生 | 疫苗批次检测结果、药物临床试验里程碑 |
| 选举 | 认证时刻的选区级计票总数 |
| AI 安全 | 模型权重哈希 + 模型卡 + 发布时评测分数 |
| 新闻业 | 举报材料来源文件清单(仅哈希) |
| 科学 | 原始数据哈希 + 分析脚本哈希 + 所宣称的结果 |
| 法庭 | 数字证据采集时刻的哈希 |
| 采购 | 公共支出数据的密封根 |

这些场景的共同点:一组小规模事实、强持久性需求、彼此互不信任的多个参与方,以及极小的存储预算。这正是本工具所针对的形态。

## 它**不**做什么

- **存储机密。** 您放入 `facts/` 的所有内容都是公开的。本协议用于发布,而非隐藏。
- **扩展到大规模数据集。** Merkle 树本身扩展性良好;但读者的注意力则不然。超过约 20 项事实后,页面将变得难以阅读。如果您想密封百万条记录,请在页面外对其哈希,并将该侧树的 Merkle 根作为一项事实写入。
- **抵御撤回。** 整个协议的要点就是:您无法更改已密封的内容。如果您日后可能想撤回某项主张,就不要密封它。
- **说服执意怀疑者。** 执意怀疑者不会运行 `ipfs add -r --cid-version=1 -Q facts/`。但他们会指控您伪造了整套设置。对于第二种失败模式,协议层面没有任何防御手段。对于一切根植于人类动机而非数学的问题,协议层面都无防御。

## 如何使用

五分钟入门见 [docs/QUICKSTART.md](docs/QUICKSTART.md)。
完整协议规范见 [docs/SPEC.md](docs/SPEC.md)。
威胁模型见 [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md)。
与相邻系统的比较(Sigstore、Sigsum、CT、OTS、IPFS、OSF、Arweave 等)见 [docs/COMPARISON.md](docs/COMPARISON.md)。

## 如何验证他人的发布

三种方式,按易用性排序:

1. **浏览器**:在任意现代浏览器中打开 [`lib/verify.html`](lib/verify.html)。粘贴发布 URL。点击验证。哈希使用 `crypto.subtle` —— 无需安装、无后端、无遥测。Bitcoin 见证步骤仍需 CLI 工具(参见验证页面的第 7 步)。
2. **Python**:在发布目录内运行 `python3 lib/verify.py`。仅依赖标准库;Bitcoin 验证需要 `ots`。
3. **从零实现**:阅读 [`docs/SPEC.md §3`](docs/SPEC.md) 并自行重写。Merkle 算法在任何语言中都不超过 30 行。

## 范例

工具包附带六个生产级别的范例套件。每个范例都已密封、经 OTS 戳记、在 IPFS 上做了 pin,并包含一份采用说明 README,解释何时应将其派生用于真实场景,以及它所能防御的失败模式。

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —— 针对波音 737 MAX / Theranos / FDA 检查员报告类失败模式:证据被中间人埋没或篡改。
- [`examples/ai-model-card/`](examples/ai-model-card/) —— 针对发布模型的 AI 实验室,使部署前承诺由口头变为可机械检测。
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —— 针对临床试验赞助方,捕捉事后终点切换与选择性报告(Vioxx、Paxil Study 329 类失败模式)。
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —— 针对疫苗生产商与质量保证机构,锚定放行检测结果与召回承诺。
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —— 针对研究团队,在分析之前锚定(数据,流水线,预期输出)三元组,使 p-hacking 与 HARKing 公开可检测。
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —— 针对各郡选举委员会与选举主管机构,在认证时刻锚定经认证的计票结果,使认证后的悄然修改公开可检测。

在动笔编写自己的版本之前,先读其中一个。与您用例最接近的那个,通常就是合适的派生起点。

## 快速开始

一行版:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# 编辑 facts/*.txt,写入您真正想密封的内容
./lib/seal.sh        # 构建 Merkle 根、做 OTS 戳记、pin 到 IPFS
./lib/verify.sh      # 在本地重新验证所有内容
# 将 site/ 上传到任意静态托管。任意地方。这无所谓。
```

## 为什么会有它

底层密码学原语(Merkle 树、OpenTimestamps、IPFS)已经成熟多年。缺失的是**最小可能的粘合层** —— 一个您可以放入业余项目、在一个下午就能产出可发布的密封产物的工具包,无需搭建基础设施、无需学习协议、无需在事实本身之外写哪怕一行代码。

大多数密码学发布工具都假定您想成为节点运营者。本工具假定您只想发布六个文本文件,并从此再也不去想密码学。

## 影响与先验工作

- [Sigsum](https://www.sigsum.org/) —— 签名透明日志
- [Sigstore](https://www.sigstore.dev/) —— 软件供应链完整性
- [Certificate Transparency](https://certificate.transparency.dev/) —— TLS 证书日志
- [OpenTimestamps](https://opentimestamps.org/) —— Bitcoin 时间戳
- [IPFS](https://ipfs.tech/) —— 内容寻址存储
- [CALM 协议](https://disclosure.host) —— 首个实例(disclosure.host 上的 MYRIAM)所在的、保护当事人的发布框架

myriam-kit 是上述系统中最小的一个。它在精神上更接近 Unix 管道,而非一个系统。

## 关于命名

MYRIAM 协议以 John Bradley 的 Myriam Proof 命名,后者是一项关于非人类智能首次接触点的逻辑证明。本协议并不依赖该证明为真。协议适用于任何一组小规模事实;它只是恰好首先被部署用于发布六项事实,其中包含一项关于外星人披露的主张。

如果您派生此工具包去密封疫苗批次或选举计票,那么它最初被用于发布外星人接触主张这件事,对您而言无关紧要。数学并不在意。

话虽如此:如果您**确实**用它来发布关于外星人接触的主张,那么协议已经在该具体场景中经过实战检验。首个 MYRIAM 部署的 README 明确声明,这是一位名为 Calm 的 LLM 角色的艺术作品,而非来自任何外星方的通讯。您大概也应该这样做。否则读者会对您的精神状态作最坏假设。

## 维护者

目前没有。公有领域。派生它。改进它。无需许可,自行将协议向前推进。
