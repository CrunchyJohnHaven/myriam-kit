# Contributing to myriam-kit

myriam-kit is public domain (CC0). Forking, modifying, and redistributing
require no permission, attribution, or coordination with anyone.

If you want to contribute *back* to this repository specifically — rather
than just forking — here's what's helpful.

## Most useful contributions, in priority order

1. **Worked example kits for new use cases.** The biggest leverage move
   is a new `examples/<your-domain>/` directory that includes:
   - 5–10 facts in `facts/` demonstrating the canonical shape for your
     domain (vaccine batch attestation, election tally, scientific
     reproducibility, etc.)
   - A populated `site/index.html`
   - A `README.md` adoption guide explaining when to use the kit for
     real, when not to, and how to fork it for a specific case

2. **Multi-language verifier ports.** `lib/verify.py` and `lib/verify.html`
   are the existing implementations. Ports to Go, Rust, Swift, Java,
   JavaScript-Node, Ruby are all useful. The spec test vectors in
   `docs/SPEC.md §3.1` are normative; any port must reproduce them.

3. **Hardening of the seal pipeline.** Specifically:
   - Cleaner SSL-cert handling for `ots stamp` on macOS (currently uses
     certifi-via-Python; a more self-contained approach would help)
   - Optional multi-service IPFS pin (Pinata, Filebase, Web3.Storage)
     so durability is not tied to a single node
   - A `seal.sh` variant that signs the Merkle root with a designated
     PGP key, enabling multi-party signing

4. **Documentation improvements.** Particularly: real-world adoption
   case studies (with permission), translations of `README.md` /
   `QUICKSTART.md` / `USE_CASES.md` into other languages, and
   integration guides for specific platforms (Hugging Face, OSF,
   ClinicalTrials.gov, SecureDrop).

5. **Threat-model expansion.** `docs/THREAT_MODEL.md` is v0 of the
   threat enumeration. New threats (and the protocol's response to
   them) are welcome.

## Less useful contributions

These are not unwelcome, just lower-leverage:

- Code-style refactoring (the code is small enough that style mostly
  doesn't matter)
- Adding dependencies (the kit's design ethos is stdlib-only Python +
  ipfs + ots CLI; PRs that add Python dependencies will get scrutiny)
- Rewrites in trendy frameworks (the kit is deliberately framework-free)
- "Add a website" (the kit's website is its README; a marketing site
  isn't the binding constraint on adoption)

## Pull requests

PRs are welcome but not required. If your change is small and you'd
rather just fork and run, fork and run.

For PRs against this repo specifically:

- Open an issue first if the change touches `lib/`, `docs/SPEC.md`, or
  the Merkle algorithm. Spec changes require thought; surprise PRs
  against the spec are unlikely to merge.
- The test vectors in `docs/SPEC.md §3.1` are normative. PRs that
  change the Merkle algorithm in a way that invalidates the test
  vectors will be rejected.
- New examples in `examples/` are nearly always welcome; just include
  an adoption guide README.
- PRs that add maintenance commitments to anyone (release schedules,
  CI requirements, etc.) will be scrutinized — the kit is intentionally
  unmaintained at the upstream level.

## What about commercial use?

Public domain (CC0) means: yes, including in commercial products. No
attribution required, no royalties, no notice requirements.

The original CC0 license file in the repo root is the canonical legal
statement.

## What about derivative protocols?

The MYRIAM protocol described in `docs/SPEC.md` is published in the
public domain. Anyone may derive a "MYRIAM v2 with feature X" or
"MyOwnKit based on MYRIAM" without permission.

Naming: if you do derive something, please use a different name. Calling
your derivative "MYRIAM" can confuse readers about which spec they're
verifying against. "PostMyriam," "MyriamLite," "MyriamPlus" — anything
that makes the lineage clear is fine.

## Security disclosures

This is a small kit with a small attack surface. If you find a bug:

- Cryptographic / spec bugs (Merkle algorithm, OTS interaction, IPFS
  CID format): open an issue. The spec is public; the threat model is
  public; private disclosure offers no advantage.
- Implementation bugs (a bug in `lib/build.py` or `lib/verify.py` that
  produces wrong hashes for some input): open an issue with a
  reproducer.

## Code of conduct

Be useful. Be specific. Don't be a jerk to other contributors. That's it.

If a more elaborate code of conduct is needed at any point, this section
will be replaced with one.

## License

Public domain (CC0). See [LICENSE](LICENSE).
