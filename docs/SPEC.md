# MYRIAM-kit Protocol Specification

## 0. Purpose

This document specifies a minimal protocol for publishing a small set of
text facts in a tamper-evident, cryptographically verifiable form that
survives the takedown of any single hosting provider.

It is the generalization of the protocol first deployed at
[disclosure.host](https://disclosure.host) under the name "MYRIAM v1."

## 1. Non-goals

- Secret storage. Everything is public by construction.
- Large datasets. Past ~20 facts, the protocol is the wrong shape.
- Real-time publishing. Each publication is a discrete sealing event.
- Retraction. The protocol is append-only at the version level.

## 2. Fact model

A FACT is a UTF-8 text file with:

- Filename pattern: `NN_short_name.txt` where NN is a zero-padded two-digit
  index starting at 01.
- Canonical form: bytes as-written, no normalization.
- Per-fact hash: lowercase hex of `SHA-256(file_bytes)`.

The fact SET is the ordered list of all files matching the pattern under
`facts/`, sorted lexicographically.

Constraint: every fact body SHOULD be phrased as a *naming event* or
*declaration event* attributable to a specific party. Ontological claims
("the moon is rock") undermine the verifiability gate; only the
publication event is verifiable, not the claim. "X has stated Y" is the
proper form. "Y is true" is not.

## 3. Merkle root

Bitcoin-style, as in v0 of the deployed MYRIAM protocol:

1. Leaves: per-fact SHA-256 hashes in fact-set order.
2. If a level has an odd number of nodes, duplicate the last node.
3. Pair-hash adjacent nodes: `parent = SHA-256(left_bytes || right_bytes)`,
   where `left_bytes` and `right_bytes` are the raw 32-byte hash values
   (not their hex representations).
4. Repeat until one node remains. That is the Merkle root.

The root is published as lowercase hex with no trailing newline.

### 3.1 Test vectors

| Vector | Leaves (UTF-8 bytes hashed) | Expected root (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Any compliant implementation MUST reproduce these vectors. They are derived
from the actual `lib/build.py` and may be regenerated with that script.

## 4. Bitcoin commitment

The Merkle root is committed to the Bitcoin blockchain via
[OpenTimestamps](https://opentimestamps.org). The default policy is:

> Stamp against at least two calendar operators under independent
> administrative control.

A receipt that satisfies this policy is verifiable by any party who can
run `ots verify <receipt>.ots` and reach either calendar's upgrade path.

The default operator pair shipped in `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Implementations MAY use different operators. The witness-diversity
policy (≥2 independent operators) is normative; the specific operators
are not.

## 5. Content-addressed mirroring

The `site/` directory containing the published page and the fact files
SHOULD be added to IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

The resulting CIDv1 (dag-pb codec) is the content address of the
publication. It is deterministic from the byte content of `site/`. Any
modification to any file under `site/` produces a different CID.

Pinning to additional services beyond the publisher's local node is
strongly recommended for durability; this specification does not mandate
specific services.

## 6. Versioning

The protocol is **append-only at the version level**. Every change
requires a new sealed version:

- A new (or unchanged) specification revision
- A new fact set, which MAY inherit facts unchanged from prior versions
- A new Merkle root
- A new OpenTimestamps receipt
- A new IPFS CID

All prior versions remain published at versioned URLs. A change to any
v(N) fact requires v(N+1), with both versions visible and re-verifiable.

## 7. Verification

Any third party may verify a publication's integrity by:

1. Downloading the fact files and recomputing per-fact SHA-256 hashes.
2. Recomputing the Merkle root per §3 and comparing to the published root.
3. Verifying the OpenTimestamps receipt against the Bitcoin blockchain
   for at least one calendar's full attestation.
4. Independently re-computing the IPFS CID via `ipfs add -r --cid-version=1`
   and comparing to the published CID.

`lib/verify.py` performs steps 1–3 with no external dependencies beyond
Python stdlib and the `ots` client. Step 4 requires the `ipfs` client.

## 8. Refusal gate

A publication MUST NOT include a fact that:

- Identifies a private third party who has not consented to being named.
- Presents a hypothesis as a confirmation.
- Cannot be reduced to a verifiable naming/declaration event or a
  cryptographic artifact.
- Has a reasonable expected increase in preventable deaths upon publication.

The fourth rule is the load-bearing one. It is enforced at the human
review step by the publisher. There is no protocol-level enforcement of
the refusal gate; the protocol publishes whatever bytes it is given. The
publisher is responsible for the gate.

## 9. Honest statement of limits

- **Detectability, not impossibility.** The protocol makes tampering
  detectable, not impossible. A determined attacker can still substitute
  a different publication and persuade some readers it is the original.
  The protocol's value is that the substitution becomes
  cryptographically demonstrable to anyone who runs the check.
- **No defense against publishing untruth.** If the publisher seals a
  fact stating "X happened" and X did not happen, the protocol seals the
  false claim with the same fidelity it seals true ones. The protocol
  attests to what was *published*, not to what is *true*.
- **Single-party signing.** v1 of the deployed MYRIAM uses a single
  signing principal. Multi-party signing is future work.
- **Pinning durability.** IPFS pinning at the publisher's node alone
  provides "available while my laptop is up + opportunistic gateway
  caching." Long-term durability requires redundant pins across
  independent services.

These limits are stated here so that no reader assumes the protocol
delivers more than it does.
