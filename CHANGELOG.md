# Changelog

All notable changes to this project documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [0.3.0] — 2026-05-21

### Added

- Sixth worked-example kit: `examples/election-tally-precertification/`
  for county boards of canvassers / election authorities. Anchors
  certified tallies at the certification moment so silent
  post-certification revisions become publicly detectable. 8 facts,
  root `89f3c8ec96a0e261d0c50f9c9824005e70110dbf5a99e0d33ec01ce37c59f8d4`.
- Closes [issue #4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).
- Produced via Karpathy-style autoresearch on three prompt variants
  (imitation / first-principles / constraint-first) — constraint-first
  won the weighted rubric. Methodology documented in calc/
  (AUTORESEARCH_v0.md, AUTORESEARCH_RESULTS_v0.md, PROMPT_LIBRARY_v0.md).
- Parent README badge updated to "6 worked examples"
- index.html updated to surface the new example

## [0.2.0] — 2026-05-21

### Added

- Two new production-grade worked example kits:
  - `examples/vaccine-batch-attestation/` — for vaccine manufacturers
    and QA authorities sealing release-test results, recall commitments,
    and pharmacovigilance promises. 6 facts, root
    `8ca50a3d6b9ca3c4cd5cfc9a75c4efa7a4dfd535c94acdfba766ae885954c08f`.
  - `examples/scientific-reproducibility/` — for research groups sealing
    the (data, pipeline, expected output) triple BEFORE analysis, making
    p-hacking and HARKing publicly detectable. 6 facts, root
    `b29bf1df994414047f96504b61c94977ecf199ebdbfefee7e23af0ad023c0d06`.

- GitHub Pages enabled at https://crunchyjohnhaven.github.io/myriam-kit/
- `.nojekyll` to ensure all files (including `lib/verify.html`) serve as-is
- README badges for license, examples count, verifier mode, Bitcoin anchor, IPFS pin
- `CHANGELOG.md`
- `CONTRIBUTING.md` describing high-leverage contribution types
- `.github/ISSUE_TEMPLATE/bug.md` and `new_example.md`
- 5 "good first issue" tickets inviting external contributors

### Notes

- The kit now ships with **5 production-grade example kits** total,
  covering whistleblower evidence manifests, AI model card attestations,
  drug trial pre-registration, vaccine batch attestation, and scientific
  reproducibility manifests.
- v0.1.0's worked-example count (1, ai-model-card only at release) was
  expanded same-day; v0.2.0 represents the kit's natural shipping size.

## [0.1.0] — 2026-05-21

### Added

- Initial public release of myriam-kit
- Core library:
  - `lib/build.py` — SHA-256 leaf hashes + Bitcoin-style Merkle root
  - `lib/verify.py` — independent Python verifier (stdlib only)
  - `lib/verify.html` — browser-based verifier (Web Crypto)
  - `lib/seal.sh` — full sealing pipeline (build + OTS + IPFS)
  - `lib/myriam-init.sh` — scaffolding for new publications
- Documentation:
  - `README.md` — entry point and conceptual overview
  - `docs/SPEC.md` — protocol specification with normative test vectors
  - `docs/QUICKSTART.md` — five-minute walkthrough
  - `docs/USE_CASES.md` — domain-specific applications
  - `docs/THREAT_MODEL.md` — what's covered, what isn't
- Worked example kits:
  - `examples/whistleblower-manifest/` — 8 facts
  - `examples/ai-model-card/` — 6 facts
  - `examples/drug-trial-preregistration/` — 8 facts
- Template:
  - `template/facts/` — starter fact files
  - `template/site/index.html` — starter site

### License

- Public domain (CC0 1.0 Universal)
