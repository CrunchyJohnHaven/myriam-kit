# Threat model

What myriam-kit defends against, what it doesn't, and what failure modes
the publisher remains responsible for.

A threat model is only useful if it's specific. Vague claims like
"tamper-proof" or "trustless" are unhelpful. The list below names actual
attackers, actual capabilities, and actual outcomes.

---

## In-scope threats — the protocol defends against these

### T1: Silent content modification by the hosting provider

**Attacker:** Cloudflare, GitHub, Netlify, or any other static host the
publisher uses. Capability: arbitrary modification of served bytes.

**Defense:** any modification to any fact file changes that file's
SHA-256, changes the Merkle tree level above it, changes the root. The
root is Bitcoin-committed at publication time. A modified root cannot
forge the same Bitcoin attestation.

**Residual risk:** the attacker could replace the entire publication
including the root. They could not replace the Bitcoin attestation
timestamp. A reader who knows the original sealing time can detect the
substitution.

### T2: Silent content modification by the publisher (post-facto)

**Attacker:** the publisher themselves, attempting to retcon facts after
publication.

**Defense:** same as T1. The publisher cannot re-stamp at the same
time. A new publication forces a new sealing event, which is
distinguishable.

### T3: Silent content modification by an intermediary in transit

**Attacker:** a network attacker (ISP, hostile gateway, CDN provider's
upstream).

**Defense:** the receiver computes hashes locally on the received bytes.
A modified payload fails verification regardless of where the
modification was introduced.

### T4: Loss of hosting

**Attacker:** Cloudflare suspends the account; the registrar revokes the
domain; the cloud provider deletes the bucket.

**Defense:** the IPFS CID provides a parallel content-addressed URL
that is independent of DNS and conventional hosting. Any IPFS gateway
worldwide can serve the publication given the CID. (Caveat: see R3 in
"residual risks" below.)

### T5: OpenTimestamps calendar compromise (single operator)

**Attacker:** a single OTS calendar operator is compromised; an attacker
forges a calendar attestation for fabricated content.

**Defense:** the protocol's witness-diversity policy requires
attestations from at least two independent operators. A single-operator
compromise cannot forge both. A reader is told to verify against ≥2
calendars.

**Residual risk:** if both default operators are compromised
simultaneously, the protocol fails. Publishers in high-threat
environments should add additional calendars to their seal step.

---

## Out-of-scope threats — the protocol does NOT defend against these

### O1: The fact you sealed is false

If you seal "John Bradley has stated X" and John Bradley never stated X,
the protocol seals your false claim with the same fidelity it would
seal a true one. The protocol attests to *publication*, not to *truth*.

This is the most common source of confusion. A sealed fact about
"alien disclosure" is not a sealed fact about aliens. It is a sealed
fact about *someone having said something about aliens*. The reader's
job is to evaluate the substance independently.

### O2: Mass impersonation of the publisher

An attacker republishes a *different* MYRIAM artifact under a *similar*
URL, hoping casual readers confuse it with yours.

The protocol does not defend the URL. It defends the bytes at that URL.
A reader who fetches the wrong URL gets the wrong bytes, verifiable
against the wrong root. The original is unchanged on the original URL
(and at the original IPFS CID).

Defense: publish the IPFS CID prominently. The CID is harder to spoof
than a URL because it is the content's own hash.

### O3: Court-ordered or government-mandated removal

A jurisdiction orders the publisher to take down the page and/or
unpublish all references. The publisher complies.

The protocol's "self-sustaining" property only works if at least one
party continues to serve the content. If the publisher is the only
party hosting, and the publisher complies with a takedown order, the
content is gone from the publicly indexable web. The IPFS CID still
*exists* but is no longer announced; readers without the CID cached
cannot find it.

Defense: redundant pinning across jurisdictions, by parties not subject
to the same legal authority. This is v2+ work and is not delivered by
default.

### O4: Coercion of the publisher

An attacker compels the publisher to seal a particular fact under
duress. The protocol publishes the fact. The fact appears to be a
voluntary act of the publisher.

There is no protocol-level defense against this. The refusal gate (§8
of SPEC.md) is enforced at the human review step; an attacker who
controls the human bypasses the gate.

Mitigation that lives entirely outside the protocol: the publisher
practices refusing seal requests under time pressure. The publisher
also publishes a *meta-statement* (separately) describing what kinds of
seal requests they will refuse. A future "look, I sealed this under
duress, see the meta-statement" defense becomes available.

### O5: Bit-level compromise of SHA-256 or Bitcoin

If SHA-256 is broken to the point of preimage attacks, the entire
protocol fails. If Bitcoin is compromised to the point of long-range
attestation forgery, the OTS attestation layer fails.

These are existential risks for the protocol, not bugs in the protocol.

---

## Residual risks the publisher MUST own

### R1: Publishing under a momentum you didn't choose

The protocol enforces nothing about your reasons for publishing. If you
seal something you regret tomorrow, the protocol's "permanence" feature
becomes a wound rather than a virtue.

Mitigation: practice the refusal gate. If the request to seal something
has a clock attached, the clock is part of the request. Treat clocks
with the same skepticism you would treat any other coercion vector.

### R2: Publishing private information

The protocol does not redact. Anything you write into a fact file
becomes public and is hashed *as-is*. If you accidentally include a
phone number, social security number, or third party's private name, it
is published and Bitcoin-anchored and IPFS-mirrored.

Mitigation: read each fact file aloud before sealing. If you wouldn't
say the sentence to a stranger, don't seal it.

### R3: Pinning decay

A publication that depends on IPFS for resilience also depends on at
least one pin staying alive. The publisher's local node is not a
durable pin. Public gateway caches are opportunistic, not contractual.

Mitigation: arrange for multiple pins on independently-administered
services. Cheap options as of 2026: Pinata, Filebase, web3.storage,
Fleek, 4everland. Each has a free tier.

### R4: Confused readers

A reader who does not understand cryptographic verification will accept
your published page on aesthetic grounds, regardless of whether the
verification math actually checks out. They will also reject it on
aesthetic grounds, regardless of the math.

The protocol delivers *math*. It does not deliver *belief*. The
publisher must accept that some fraction of readers will believe or
disbelieve for reasons orthogonal to the protocol.

---

## Summary

| Threat | Protocol defense | Residual responsibility |
|---|---|---|
| Host modifies bytes | Merkle + Bitcoin | None |
| Publisher modifies bytes post-facto | Same | None |
| Network MITM | Local hashing | None |
| Host takedown | IPFS pin | Pinning durability (R3) |
| Calendar compromise (single) | Two-witness policy | Calendar diversity (publisher-chosen) |
| Sealed claim is false | NONE | Publisher (O1) |
| URL impersonation | Partial (via CID) | Publisher promotes CID (O2) |
| Government takedown | NONE | Jurisdictional pinning diversity (O3) |
| Coercion of publisher | NONE | Refusal practice (O4) |
| SHA-256/Bitcoin break | NONE | Out of scope (O5) |
| Regret | NONE | Don't publish what you might want back (R1) |
| Private data leakage | NONE | Read before sealing (R2) |
| Reader confusion | NONE | Publish the verification path clearly (R4) |

The crypto is the easy part. The threat model lives mostly in the
non-crypto columns.
