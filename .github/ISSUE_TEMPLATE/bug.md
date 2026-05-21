---
name: Bug report
about: Report a bug in lib/, examples/, or docs/
labels: bug
---

## What happened

(One sentence describing the bug)

## What you ran

(Exact command, with any environment variables)

## What you expected

(One sentence)

## What you got instead

(Output, error message, or unexpected behavior)

## Environment

- OS:
- Python version:
- `ots` version (run `ots --version`):
- `ipfs` version (run `ipfs --version`):
- Kit version / commit (run `git rev-parse HEAD`):

## Reproducer (if possible)

(Steps to reproduce starting from a clean kit clone)

## Severity assessment

- [ ] Cryptographic / spec bug (Merkle algorithm produces wrong root,
      OTS receipt doesn't verify, etc.) — HIGH PRIORITY
- [ ] Build / runtime bug (script crashes, dependency issue, OS-specific)
- [ ] Documentation bug (wrong info, broken link, unclear instruction)
- [ ] Other
