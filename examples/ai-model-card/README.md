# AI Model Behavior Lock Kit

A turnkey myriam-kit example for AI labs (commercial or open-source)
releasing a model and wanting to make the release's claims —
weights identity, capabilities, evaluation scores, safety review,
pre-deployment commitments — **cryptographically anchored and
publicly verifiable**.

The kit defends against the specific failure mode where deployed models
silently drift, eval scores get retconned, or pre-deployment claims get
disputed years later as "we never said that."

## What this kit produces

A cryptographically sealed manifest containing, for one model release:

1. Model identification (name, architecture, parameter count, license)
2. **Weights file SHA-256** — the canonical artifact hash
3. Model card text (capabilities, intended use, out-of-scope use,
   known failure modes)
4. Evaluation results at release (capability evals, safety evals,
   calibration)
5. Pre-deployment commitments (the things you commit not to silently
   change after release)
6. Signing principal (the human + organization taking responsibility)

The seal makes each of these byte-stable, time-anchored to Bitcoin via
OpenTimestamps, and retrievable via IPFS independent of any single
hosting party.

See the worked fictional example: [facts/](facts/) and the rendered
[site/index.html](site/index.html). The example uses a fictional model
("Calm-mini-v0"); a real release would replace the example content.

## What this kit defends against

**Failure modes the seal directly catches:**

- **Weight tampering** — the released weights file's SHA-256 is in
  FACT 03. Any post-release alteration of the bytes a user downloads
  is detectable by re-hashing.
- **Silent eval retcons** — the eval scores at release are in FACT 05.
  Future "the eval score was always X" disputes have a public anchor.
- **Capability claim drift** — the model card text in FACT 04 is
  byte-stable. Future "we never claimed capability X" disputes are
  publicly checkable against the sealed text.
- **Silent fine-tune redistribution** — pre-deployment commitment #1
  in FACT 06 (in the worked example) is "no silent fine-tuning under
  same name." Detection: any new weight hash means a new model name
  and a new sealed publication, or the commitment is broken.
- **Hidden failure modes** — FACT 04 commits to a known-failure-modes
  list. The list is monotonic (can grow, not shrink for a frozen
  checkpoint). Future discoveries of failure modes the lab knew about
  internally but didn't publish become contestable evidence.

**Failure modes NOT covered:**

- Models being misused by downstream users (the seal proves what was
  released, not what users do with it).
- Adversarial fine-tuning by third parties (a third-party fine-tune
  produces a different weight hash, so the original seal is unaffected,
  but the third party's model is outside the seal's protection).
- Behavior changes due to deployment-environment changes (different
  system prompts, RAG configurations, etc.).
- Failures the lab genuinely did not know about at release time. The
  seal commits the lab to *what they knew*; it cannot anchor what
  they didn't.

## When to use this kit

You should consider sealing a model card if:

- You are releasing model weights publicly OR deploying a model in a
  context where downstream users care about behavior stability.
- The release is significant enough that future "we never said that"
  disputes are plausible (any model deployed at scale; any
  safety-critical model; any release accompanied by capability
  claims).
- Your organization is willing to make pre-deployment commitments
  that constrain future actions (this is the load-bearing one — see
  next section).
- You can compute the SHA-256 of the weights file at release.

## When NOT to use this kit

Do NOT use this kit if:

- You are not willing to be bound by the pre-deployment commitments in
  FACT 06 of the example. The seal makes commitments mechanically
  detectable; if you're not prepared for that accountability, don't
  seal.
- The weights file is going to change frequently (e.g., continuous
  fine-tuning pipelines). Each weight change requires a new sealed
  release. Per-release sealing is heavy; this kit is for *frozen*
  checkpoints.
- You haven't done the safety review yet. The seal commits the safety
  review's findings. If you seal an incomplete review, you have a
  permanent public record of an incomplete review.
- You might want to retract any specific eval score later. The seal is
  permanent. New sealed publications can supersede, but the original
  cannot be unmade.

## The load-bearing pre-deployment commitments

The example's FACT 06 commits the publisher to:

1. **No silent fine-tuning under the same name.** Any fine-tune
   produces a new model name, a new sealed publication, a new weight
   hash. The predecessor remains canonically the named version.

2. **No silent eval updates.** Re-evals get new sealed publications
   that reference the original by Merkle root. Versions are tracked,
   not overwritten.

3. **Known failure modes may grow, never shrink.** A frozen checkpoint
   cannot have failure modes fixed. So the published list is
   effectively monotonic.

4. **Takedown handling.** If compelled to remove the model from
   distribution, the lab commits to publishing a final sealed
   statement of the takedown.

A lab adopting this kit needs to decide which of those commitments it
can actually honor. If you can't honor all four, modify FACT 06 *before*
sealing to reflect what you can honor, and accept the resulting
weakened protection. Sealing commitments you don't intend to honor is
worse than not sealing at all.

## How to fork this kit for a real release

```bash
# 1. Copy this example into your release pipeline
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Edit each fact for your real release
$EDITOR facts/01_example_notice.txt   # REMOVE — your release is not an example
                                       # Replace with a release notice for your model
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # the canonical model card
$EDITOR facts/05_eval_results.txt     # actual eval results
$EDITOR facts/06_release_commitments.txt # which commitments you can honor

# 3. Update site/index.html to reflect the real release.

# 4. Seal.
bash build/seal.sh

# 5. Verify locally.
python3 build/verify.py

# 6. Deploy to:
#    - Your release page (next to the model card and weights)
#    - The IPFS network (the seal.sh script already does this)
#    - Optionally: link to the sealed publication from your
#      Hugging Face / GitHub release notes
```

## Integration with existing release pipelines

The kit is designed to compose with existing tools, not replace them:

- **Hugging Face**: include the sealed publication's URL or IPFS CID in
  the model card's README.md. Point readers to the seal for byte-stable
  release claims.
- **GitHub releases**: include the OpenTimestamps receipt
  (`merkle_root.txt.ots`) as a release asset. Future "the release
  changed" disputes are then anchored to Bitcoin.
- **Model card standards (Mitchell et al. 2019)**: the kit is
  compatible. The standard model-card fields map to FACTS 02–05 of the
  seal. You produce the model card normally, and additionally seal it.
- **Eval harnesses (lm-evaluation-harness, BIG-bench, etc.)**: hash the
  exact harness commit and the raw output JSON; reference those hashes
  in FACT 05. Future re-runs are then independently reproducible.

## Computing the weights hash

For a single safetensors file:

```bash
shasum -a 256 model.safetensors
```

For multi-file checkpoints (GGUF shards, sharded safetensors):

```bash
# Concatenate hashes in sorted order, then hash again
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

The final hash is what goes in FACT 03. Include both the per-shard
hashes and the final aggregate hash so users can verify individual
shards as they download.

## What recipients (users of your model) should know

A model release with a MYRIAM-sealed publication lets the user:

1. **Verify the weights they downloaded** by re-hashing and comparing
   to FACT 03.
2. **Verify the model card hasn't been retconned** by checking the
   sealed FACT 04 against the lab's current published version.
3. **Verify the eval scores are the ones at release** by comparing
   the lab's current eval claims against the sealed FACT 05.
4. **Hold the lab accountable to its pre-deployment commitments** by
   checking actual behavior against the sealed FACT 06.

A user who finds discrepancies has cryptographic evidence of the
discrepancy. They can publish that evidence; the original sealed
publication is the anchor.

## What this kit is NOT

- Not a substitute for actually doing safety review. The seal is the
  *record* of safety review, not the review itself.
- Not a substitute for actual evals. The seal anchors the scores you
  produce; it doesn't validate the methodology.
- Not a guarantee the model is safe. The seal documents what the lab
  claims about the model at release; it doesn't certify those claims.
- Not protection against model misuse by downstream users.

## A note on adversarial fine-tuning

A common AI-safety concern: someone fine-tunes your model to remove
safety behaviors and redistributes it. The seal CANNOT prevent this.
What the seal can do is:

- Anchor what the *original* model was supposed to do (FACT 04).
- Anchor what the original eval scores were (FACT 05).
- Provide a reference point against which adversarial fine-tunes can
  be measured.

A user encountering a third-party redistribution can verify whether
the weights match the original sealed hash. If not, the user knows
they have a non-original model and that any safety claims attributed
to the lab do not apply.

## Closing

Sealing a model release is small extra work for the lab: ~10 minutes
to compute hashes and run the seal script, then a 30-second decision
about which pre-deployment commitments to include. The accountability
it adds is asymmetric: small cost to honest labs, large constraint on
labs that would otherwise quietly drift their claims.

If you are an AI lab considering adoption, the kit is public domain
(CC0). Fork it. Modify it. The math is the load-bearing piece, not the
specific implementation.

## License

Public domain (CC0). No attribution required.
