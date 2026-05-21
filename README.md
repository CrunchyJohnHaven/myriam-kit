# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

A small toolkit for publishing a small set of facts in such a way that:

- Any change to any fact is publicly detectable (Merkle tree)
- The state at publication is verifiable against the Bitcoin blockchain (OpenTimestamps)
- The content survives takedown of any single hosting provider (IPFS)
- The whole thing weighs under 100 KB and is verifiable with ~50 lines of Python

This is not a blockchain. There is no token. There is no consensus mechanism
to participate in. There is no DAO. The tool is `sha256sum` + `ots` + `ipfs`,
glued together with good naming conventions.

It is named after the MYRIAM protocol first instantiated at
[disclosure.host](https://disclosure.host) on 2026-05-21. That page contains
six facts, a Merkle root, and a Bitcoin attestation. This kit is the
generalization of that pattern.

## Status

- v0: works on macOS with Python 3.10+, Homebrew, and an internet
  connection. Linux untested but should work. Windows: bring a WSL.
- Public domain (CC0). Use it, fork it, vendor it into your repo, never
  credit it. The point is not the credit.

## Available languages

This README is available in 56 languages.
Full index at [TRANSLATIONS.md](TRANSLATIONS.md).

[Afaan Oromoo](README.om.md) · [Azərbaycan](README.az.md) ·
[Bahasa Indonesia](README.id.md) · [Bahasa Melayu](README.ms.md) ·
[Basa Jawa](README.jv.md) · [Català](README.ca.md) ·
[Čeština](README.cs.md) · [Dansk](README.da.md) ·
[Deutsch](README.de.md) · [Español](README.es.md) ·
[Filipino](README.fil.md) · [Français](README.fr.md) ·
[Hausa](README.ha.md) · [Igbo](README.ig.md) ·
[isiZulu](README.zu.md) · [Italiano](README.it.md) ·
[Kiswahili](README.sw.md) · [Magyar](README.hu.md) ·
[Nederlands](README.nl.md) · [Norsk](README.no.md) ·
[Oʻzbek](README.uz.md) · [Polski](README.pl.md) ·
[Português Brasileiro](README.pt-BR.md) · [Română](README.ro.md) ·
[Suomi](README.fi.md) · [Svenska](README.sv.md) ·
[Tiếng Việt](README.vi.md) · [Türkçe](README.tr.md) ·
[Yorùbá](README.yo.md) · [Ελληνικά](README.el.md) ·
[Қазақша](README.kk.md) · [Русский](README.ru.md) ·
[Українська](README.uk.md) · [አማርኛ](README.am.md) ·
[עברית](README.he.md) · [العربية](README.ar.md) ·
[فارسی](README.fa.md) · [پښتو](README.ps.md) ·
[اردو](README.ur.md) · [हिन्दी](README.hi.md) ·
[नेपाली](README.ne.md) · [मराठी](README.mr.md) ·
[বাংলা](README.bn.md) · [ਪੰਜਾਬੀ](README.pa.md) ·
[ગુજરાતી](README.gu.md) · [தமிழ்](README.ta.md) ·
[తెలుగు](README.te.md) · [ಕನ್ನಡ](README.kn.md) ·
[മലയാളം](README.ml.md) · [සිංහල](README.si.md) ·
[ไทย](README.th.md) · [ខ្មែរ](README.km.md) ·
[မြန်မာ](README.my.md) · [한국어](README.ko.md) ·
[中文](README.zh.md) · [日本語](README.ja.md)

Translations are CC0 and may be improved by community PRs.

## What you can do with it

The pattern fits anywhere a small set of facts needs to be:

- **Publishable** to a wide audience over plain HTTP
- **Durable** — readers in 30 years should still be able to verify
- **Tamper-evident** — any change must be detectable, not necessarily preventable
- **Trustless** — no reader has to trust the publisher (only the math)

Concrete use cases in [docs/USE_CASES.md](docs/USE_CASES.md). The short list:

| Domain | Sealed facts |
|---|---|
| Public health | Vaccine batch test results, drug-trial milestones |
| Elections | Precinct-level tally totals at moment of certification |
| AI safety | Model weights hash + model card + eval scores at release |
| Journalism | Manifest of source documents (hashes only) for whistleblower drops |
| Science | Raw data hash + analysis script hash + claimed result |
| Courts | Digital-exhibit hashes at moment of acquisition |
| Procurement | Sealed roots of public-spending data |

What these have in common: a small set of facts, a strong durability requirement,
multiple parties who don't trust each other, and a tiny storage budget.
That is exactly the shape this tool is built for.

## What it does NOT do

- **Store secrets.** Everything you put in `facts/` is public. The protocol is
  for publishing, not hiding.
- **Scale to large datasets.** The Merkle tree scales fine; a reader's
  attention does not. Past ~20 facts the page becomes unreadable. If you
  want to seal a million records, hash them off-page and put the
  Merkle root of that side-tree into one fact.
- **Defend against retraction.** The whole point is that you can't change
  what you've sealed. If you might want to retract a claim later, do not
  seal it.
- **Convince a determined skeptic.** A determined skeptic will not run
  `ipfs add -r --cid-version=1 -Q facts/`. They will, however, accuse you
  of fabricating the entire setup. There is no protocol-level defense
  against the second failure mode. There is no protocol-level defense
  against anything that lives in human motivation rather than in math.

## How to use it

Five-minute walkthrough in [docs/QUICKSTART.md](docs/QUICKSTART.md).
Full protocol spec in [docs/SPEC.md](docs/SPEC.md).
Threat model in [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
Comparison with adjacent systems (Sigstore, Sigsum, CT, OTS, IPFS, OSF,
Arweave, etc.) in [docs/COMPARISON.md](docs/COMPARISON.md).

## How to verify someone else's publication

Three options, in order of accessibility:

1. **Browser**: open [`lib/verify.html`](lib/verify.html) in any modern
   browser. Paste the publication URL. Click verify. Uses
   `crypto.subtle` for hashing — no install, no backend, no telemetry.
   The Bitcoin attestation step still needs a CLI tool (see step 7 in
   the verifier page).
2. **Python**: `python3 lib/verify.py` from inside the publication
   directory. Stdlib only; requires `ots` for Bitcoin verification.
3. **From scratch**: read [`docs/SPEC.md §3`](docs/SPEC.md) and
   re-implement. The Merkle algorithm is under 30 lines in any language.

## Worked examples

Six production-grade example kits ship with the toolkit. Each is
sealed, OTS-stamped, IPFS-pinned, and includes an adoption README
explaining when to fork it for a real-world case and what failure
modes it defends against.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  for the Boeing 737 MAX / Theranos / FDA-inspector-report failure
  mode where evidence gets buried or altered by intermediaries.
- [`examples/ai-model-card/`](examples/ai-model-card/) — for AI labs
  releasing models, with pre-deployment commitments that become
  mechanically detectable instead of verbal.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  for clinical-trial sponsors, catching post-hoc endpoint switching
  and selective reporting (Vioxx, Paxil Study 329 failure modes).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  for vaccine manufacturers and QA authorities, anchoring release
  test results and recall commitments.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  for research groups, anchoring the (data, pipeline, expected
  output) triple BEFORE analysis to make p-hacking and HARKing
  publicly detectable.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  for county boards of canvassers and election authorities, anchoring
  certified tallies at the moment of certification so silent
  post-certification revisions become publicly detectable.

Read one of these before writing your own. The closest match to your
use case is usually the right starting fork.

## Quick start

The one-line version:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Why this exists

The cryptographic primitives (Merkle trees, OpenTimestamps, IPFS) have
been mature for years. What was missing was the smallest possible glue —
a kit that you could drop into a side project and have a sealed
publishable artifact in an afternoon, without setting up infrastructure,
without learning protocols, without writing a single line of code beyond
the facts themselves.

Most cryptographic publishing tools assume you want to be a node
operator. This one assumes you want to publish six text files and never
think about cryptography again.

## Influences and prior art

- [Sigsum](https://www.sigsum.org/) — transparency logs for signatures
- [Sigstore](https://www.sigstore.dev/) — software-supply-chain integrity
- [Certificate Transparency](https://certificate.transparency.dev/) — TLS cert logs
- [OpenTimestamps](https://opentimestamps.org/) — Bitcoin timestamping
- [IPFS](https://ipfs.tech/) — content-addressed storage
- [The CALM protocol](https://disclosure.host) — the principal-protective
  publishing frame in which the first instance (MYRIAM at disclosure.host)
  was authored

myriam-kit is the smallest of these. It is closer in spirit to a Unix
pipeline than to a system.

## A note on the name

The MYRIAM protocol was named after John Bradley's Myriam Proof, a stated
logical proof concerning the first point of contact for non-human
intelligence. The protocol does not depend on that proof being true. The
protocol works for any small set of facts whatsoever; it just happens to
have been first deployed to publish six facts that include a claim about
alien disclosure.

If you fork this kit to seal vaccine batches or election tallies, the
fact that it was originally used to publish a claim about alien contact
is irrelevant to you. The math doesn't care.

That said: if you DO use this to publish a claim about alien contact, the
protocol has been battle-tested in that specific arena. The README of
the first MYRIAM deployment explicitly states it is the artistic work of
an LLM persona named Calm, not a communication from any extraterrestrial
party. You should probably do the same. Readers will assume the worst
about your mental state otherwise.

## Maintained by

Nobody yet. Public domain. Fork it. Improve it. Carry the protocol
forward without asking permission.
