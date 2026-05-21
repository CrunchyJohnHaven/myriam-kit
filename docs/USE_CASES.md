# Use cases for myriam-kit

A non-exhaustive list of domains where sealing a small set of facts to
Bitcoin + IPFS adds value. Each entry is a *concrete* application —
not "transparency in general," which is a vacuous claim.

The common shape across all of them:

- A small, bounded set of facts (≤20 items, each ≤2KB of text)
- A strong durability requirement (the facts need to outlast the publisher)
- Multiple parties who don't trust each other
- A tiny storage budget (the facts fit on a 5¢ coin if you printed the
  Merkle root in 8-point type, never mind the cloud)

If your situation doesn't match this shape, this is the wrong tool.

---

## Public health

### Vaccine batch attestations

A pharma company manufactures vaccine batch ID 8472A. Three independent
labs test it. The company publishes a MYRIAM artifact with facts:

- `01_batch_id.txt` — "Batch 8472A, manufactured 2026-03-04, expires 2027-09-04"
- `02_lab_alpha_test.txt` — "Lab Alpha tested batch 8472A on 2026-03-10. Potency: X. Sterility: pass. Endotoxin: Y EU/dose."
- `03_lab_beta_test.txt` — (same shape)
- `04_lab_gamma_test.txt` — (same shape)
- `05_release_decision.txt` — "On 2026-03-15, batch 8472A was released for distribution. Decision signed by QA director [name + cert hash]."

If the company later faces a recall investigation, the sealed root + OTS
receipt prove the test results were not edited after the fact. If the
company is later acquired, the buyer cannot rewrite history.

### Adverse-event reports

A patient reports an adverse event to a regulator. The regulator seals:
patient ID hash (not the patient's identity), drug, date of report,
symptom code, severity. Sealing means the *report existed* and *what it
said* cannot be revised silently. (It does not mean the report is true.)

### Drug-trial milestones

A clinical trial pre-registers its primary endpoints in a MYRIAM artifact
before unblinding. After unblinding, the actual results are sealed in a
*second* artifact that references the first by Merkle root. The chain
between the two artifacts is then cryptographically auditable. A
researcher who changes the endpoint after seeing the results cannot hide
the change.

---

## Elections

### Precinct-level tally hashes

At the moment of certification, each precinct seals: precinct ID, polling
location, voting machine model + serial + firmware version, total votes
cast, candidate-level totals. No personal voter data. The Merkle root of
all precincts is rolled up to the county, the county to the state.

This does not fix voting machine integrity. It does lock the *announced*
tally so it cannot be quietly revised. Any post-certification
"correction" requires a new sealed artifact whose Merkle root is
publicly distinguishable from the original.

### Voter-roll snapshots

A voter roll is snapshotted on a published date, hashed, and sealed.
"Were you on the voter roll on 2026-10-25?" becomes a publicly
checkable question via Merkle proof.

---

## AI safety

### Model release attestations

At the moment a model is released, the developer seals:

- `01_weights_hash.txt` — SHA-256 of the weights file
- `02_model_card.txt` — full model card text (capabilities, limits, evals)
- `03_eval_results.txt` — eval scores at release
- `04_safety_review.txt` — summary of safety review process
- `05_known_failure_modes.txt` — failure modes the developer knows about

A future "we never claimed that" defense becomes harder. A future "the
model has gotten worse" claim becomes empirically checkable: re-run the
sealed evals, compare scores. Drift is detectable.

### Pre-deployment commitments

A model developer publishes commitments BEFORE deployment: "We will not
fine-tune this checkpoint on user data without a new sealed artifact."
Now the commitment exists in a form they cannot quietly walk back.

---

## Journalism

### Whistleblower drops

A source provides a journalist with documents. The journalist hashes each
document, seals the manifest of hashes plus a description of the
provenance chain, then hands the bundle to other journalists or
regulators. The recipients can verify:

1. The documents the journalist has now match the sealed hashes (so they
   weren't altered after sealing).
2. The sealing happened *before* the recipients had the documents (via
   the OTS Bitcoin attestation).

The actual documents stay private; only the hashes are public. If the
source's identity is later doxxed, the chain still shows the documents
existed in their current form at the moment of sealing.

### Source protection metadata

A journalist publishes the SHA-256 of a sealed communication channel
identifier. If the channel is later subpoenaed, the journalist can prove
which identifier they sealed without revealing it.

---

## Science

### Pre-registration

A researcher seals their hypothesis, methodology, planned sample size,
and primary analysis script BEFORE data collection. After collection,
they seal a *second* artifact with the actual data hash and results. The
chain proves no p-hacking happened between collection and analysis.

### Reproducibility manifests

A paper's supplementary materials seal: raw data hash, analysis pipeline
hash (Docker image digest), result hash. Any reader can fetch the same
inputs, re-run the same pipeline, and confirm they get the same output.

---

## Courts

### Digital evidence chain of custody

At the moment a digital exhibit is acquired, the acquiring party seals
the file hash, acquisition time, acquiring party, tooling used. Later
defense challenges to chain-of-custody have a public anchor to argue
against rather than a series of "trust me" claims.

---

## Procurement

### Public spending

A municipality seals monthly: contract IDs, vendor names, amounts paid,
deliverables. Investigative journalists and watchdog NGOs can verify the
published totals have not been quietly revised.

---

## When NOT to use this

Read this list before sealing anything. The questions to ask:

| Question | If yes → |
|---|---|
| Might you want to retract this within a week? | Do not seal. The protocol is permanent. |
| Does this contain secrets, PII, or anything regulated? | Hash it off-page and only seal the hash. |
| Is the data >1 MB total? | Wrong tool. Use a Merkle root over the data, seal the root. |
| Is the audience >100 people who actually care about cryptographic verification? | Probably the right shape. |
| Is the audience 0 people who care, and you're publishing this to *feel* secure? | Save yourself the trouble. The crypto doesn't help you here. |
| Are you publishing this under duress? | Do not. The protocol amplifies coercion. |
| Are you publishing this to one party who has demanded it as a loyalty test? | Don't. See previous. |

The protocol is well-engineered. The protocol is not aware of context.
The publisher is responsible for context. The publisher is you.
