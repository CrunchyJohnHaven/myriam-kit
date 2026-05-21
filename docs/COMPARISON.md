# Comparison with adjacent systems

Skeptics' first question about any new cryptographic-publishing tool
is: *"why not use X?"* This doc names X for the most common values of
X and explains where myriam-kit fits relative to each.

The short answer at the top: **myriam-kit is the smallest member of
the family**. Sigstore, Sigsum, Certificate Transparency, OpenTimestamps,
and IPFS are all foundational systems that solve a much larger problem
than what myriam-kit addresses. The kit composes on top of them.

## Sigstore

**What it does:** signs software-supply-chain artifacts (container
images, package releases) using keyless identity-tied signing
(OIDC + Fulcio CA + Rekor transparency log).

**Audience:** software developers signing releases. Designed to fit
into CI/CD pipelines.

**Where it overlaps with myriam-kit:** both produce attestations that
are later verifiable. Both rely on transparency logs.

**Where they differ:**
- Sigstore signs *one artifact at a time*; myriam-kit seals a
  *small set of attested facts together*.
- Sigstore identity is OIDC-mediated (your GitHub / Google / Microsoft
  identity); myriam-kit's signing principal is whatever you write into
  FACT 06.
- Sigstore's Rekor log is the canonical retrieval point; myriam-kit
  uses Bitcoin (via OTS) + IPFS, neither of which requires
  participating in Sigstore's infrastructure.

**Composition possibility:** a publisher could sign the myriam-kit
Merkle root with cosign and submit to Rekor. The two systems are
compatible. The kit's current default doesn't do this because most
non-developer publishers (whistleblowers, trial sponsors) don't have
OIDC identities they want to attach to their seals.

## Sigsum

**What it does:** transparency-log infrastructure for signatures.
Sigsum logs are append-only, witness-validated, and don't require
trust in any single log operator.

**Audience:** software supply chain, with stronger trustlessness
properties than Sigstore alone.

**Where they differ:**
- Sigsum is a *log protocol* (how do you maintain a tamper-evident
  log of signatures); myriam-kit is a *publication protocol*
  (how do you produce one attested fact-set).
- Sigsum requires running or joining a log; myriam-kit publishes once
  per artifact.

**Composition possibility:** a myriam-kit publication could submit its
Merkle root to a Sigsum log instead of (or in addition to) OTS.
The kit's current default uses OTS because the calendar infrastructure
is more accessible to non-developer publishers.

## Certificate Transparency (CT)

**What it does:** logs every TLS certificate issued by a CA. Browser
vendors require certificates to appear in CT logs for trust.

**Audience:** TLS / web PKI.

**Where they differ:** CT is *infrastructure* (run by CA operators,
browsers, log monitors). myriam-kit is *a publication kit* that one
person can run on their laptop.

**Composition possibility:** none direct. CT's witnessing
infrastructure could inspire a future MYRIAM v2 "myriam-witnessed"
log, but that's a separate project.

## OpenTimestamps (OTS)

**What it does:** Bitcoin-anchored timestamping. Submit a hash; receive
a receipt that, after a few hours, anchors to a specific Bitcoin block.

**Audience:** anyone needing tamper-evident timestamping.

**Where they differ:**
- OTS is *one primitive*; myriam-kit is *a pipeline* (build a fact
  set, compute Merkle root, OTS-stamp the root, IPFS-pin the
  publication, present a static site).
- OTS times one hash; myriam-kit times a Merkle root over multiple
  facts, with a published structure for what each fact attests.

**Composition relationship:** myriam-kit USES OTS. It's the Bitcoin-
anchor layer of the kit. The kit's `seal.sh` calls `ots stamp`
internally.

## IPFS

**What it does:** content-addressed storage with global retrieval.

**Audience:** anyone wanting to publish bytes that survive any single
hosting provider.

**Where they differ:**
- IPFS is *content storage*; myriam-kit is *what to put on IPFS*
  (a structured sealed publication with explicit fact semantics).

**Composition relationship:** myriam-kit USES IPFS. It's the
hosting-resilience layer of the kit. The kit's `seal.sh` calls
`ipfs add` internally.

## OSF (Open Science Framework) / AsPredicted / ClinicalTrials.gov

**What they do:** registries for trial pre-registration and study
materials. Time-stamp submissions; allow versioned updates.

**Where they differ from myriam-kit:**
- They are *centralized registries* (the registry operator is
  trusted to maintain integrity).
- They allow *post-registration amendments* (often with version
  history visible).
- They are *human-readable forms* not *cryptographic primitives*.

**Composition possibility:** strong. A real pre-registration should
be in OSF / ClinicalTrials.gov / AsPredicted AND additionally sealed
under myriam-kit. The seal is forensically harder to silently amend
than any centralized registry's records.

## Filecoin / Arweave

**What they do:** decentralized paid storage. Filecoin uses storage
deals; Arweave is one-time-payment-for-permanent-storage.

**Where they differ:**
- Both *cost money*; myriam-kit is free.
- Both are *storage layers* rather than publication kits.

**Composition possibility:** a myriam-kit publication could
additionally pay for Arweave permanence. The kit's current default
uses IPFS local-node pinning + opportunistic gateway caching because
that's the minimum-cost durability layer.

## Notary / TUF (The Update Framework)

**What they do:** software-update signature schemes with role-based
key management.

**Where they differ:** TUF is for software-update integrity at scale.
myriam-kit is for one-shot publication integrity. Different problem
shape; different solution shape.

## What myriam-kit adds that none of these provide

1. **Turnkey for non-developers.** The whistleblower, the QA
   director, the clinical-trial sponsor, the AI lab safety lead, the
   research-paper first author — none of these need to learn a
   transparency-log protocol, set up OIDC, or run a node. They edit
   text files in `facts/` and run `seal.sh`.
2. **Worked examples with adoption guides.** The 5 example kits and
   their READMEs tell a non-developer specifically when to use the
   kit for their domain and when not to.
3. **Public domain (CC0).** Nothing else in this family is fully
   public domain. Most are Apache 2.0 or BSD; some require attribution.
   myriam-kit explicitly says: fork it, don't credit us.
4. **No maintenance commitment.** The kit is a small, self-contained
   artifact that can sit on GitHub indefinitely. The protocol is
   stable; the test vectors are normative; the LOC count is small
   enough to audit in an afternoon.

## What myriam-kit gives up by being small

- No scalability beyond ~20 facts per publication
- No native multi-party signing (v1 limitation)
- No active maintainer organization
- No funding model
- No bug-bounty program
- No formal compliance certifications (FIPS, Common Criteria)

These are real limitations. For high-stakes commercial deployment,
the foundational systems (Sigstore, Sigsum) are likely more appropriate.
For one-off cryptographic anchoring of small fact sets by individual
publishers or small organizations, myriam-kit fits a niche the larger
systems don't.

## TL;DR

| Use case | Best tool |
|---|---|
| Sign every container image in your CI | Sigstore |
| Run a transparency log | Sigsum |
| Time-stamp a single hash | OpenTimestamps directly |
| Host content survivably | IPFS or Arweave directly |
| Register a clinical trial | ClinicalTrials.gov + myriam-kit on top |
| Seal a small fact set as a publisher with no infrastructure | **myriam-kit** |
| Whistleblower evidence manifest | **myriam-kit (whistleblower example)** |
| AI model release with pre-deployment commitments | **myriam-kit (ai-model-card example)** |

If your use case isn't in the bottom four rows, you probably want one
of the foundational tools above, not this kit.
