# The Self-Replicating Prompt

*A single piece of text that lets ANY LLM walk ANY user through producing
a custom trust-evidence attestation kit, in conversation, with no
external dependencies.*

The kit's adoption has been bottlenecked on production. Producing a kit
requires reading the existing examples, understanding the constraint-
first structure, knowing the load-bearing limits to preserve, and
writing all of it correctly.

This prompt collapses that to a 5-minute conversation with any LLM.
Copy the prompt block below into Claude / ChatGPT / Gemini / Llama /
any other LLM, then describe your domain. The LLM produces a fork-
ready kit.

This decouples the kit's adoption rate from my throughput. The
production capacity becomes the population of LLM users.

---

## The prompt (copy this into any LLM):

```
You are helping me produce a myriam-kit attestation kit for a specific
domain. The full spec is at github.com/CrunchyJohnHaven/myriam-kit
under CC0. You don't need to fetch it; use this brief.

A myriam-kit is a small set of plain-text fact files, hashed into a
Merkle tree, anchored to Bitcoin via OpenTimestamps, and pinned to
IPFS. The whole thing weighs <100KB and verifies in 50 lines of Python.

The kit's load-bearing property is HONESTY about what it does NOT do.
It is a non-repudiation primitive — it makes silent post-publication
revision detectable, NOT a proof of correctness.

To produce a kit for my domain, please:

1. Ask me what domain I want to seal (3-5 questions max):
   - Who is the signing institution / role / person?
   - What is the cadence of attestation (per event, monthly, quarterly)?
   - What 6-8 facts would each attestation contain?
   - What categories MUST the kit refuse to seal (PII, classified, etc.)?
   - What gaming patterns does the domain have that the kit should
     defend against?

2. Produce a README.md with these sections in this order:
   a. ## What this kit DOES NOT do (read first) — 5-8 explicit failure
      modes including the coercion-amplification clause: "if the signing
      officer is themselves captured/coerced, the seal records the
      captured event with cryptographic integrity but does not defend
      against the capture."
   b. ## What this kit MUST REFUSE to seal — 5-8 refusal rules R1-R8
      covering PII, partial-completion, single-signer-for-high-stakes,
      etc. Each rule starts with **R<N>.**
   c. ## What this kit DOES seal — 8 facts numbered, each described in
      one line. Each fact must end with: "This fact asserts only X. It
      does not assert Y" where Y is the closest failure mode from (a).
   d. ## What this kit defends against — silent revision patterns
      specific to the domain.
   e. ## Historical cases this kit would have helped with — 2-4
      concrete past institutional disasters in the domain, framed
      honestly as "would have produced a useful anchor — NOT a fix."
   f. ## When to use this kit — 2-4 conditions.
   g. ## When NOT to use this kit — 2-4 anti-patterns, including
      "as legitimacy theater."
   h. ## How to fork this kit — standard 4-line bash:
      cp -r ~/Genesis/myriam-kit/examples/<kit-name> ~/my-attestation
      cd ~/my-attestation
      $EDITOR facts/*.txt
      bash build/seal.sh
   i. ## Integration with existing infrastructure — list 2-5 existing
      regulatory/industry frameworks the kit composes with.
   j. ## What this kit does NOT replace — explicit additive-not-
      substitutive list.
   k. ## Adoption value — rough trust-gap estimate for the domain
      with low/mid/high ranges and explicit assumptions. NEVER promise
      lives saved; estimate addressable savings and convert with
      caveats.
   l. ## License — Public domain (CC0). Fork it. No attribution
      required.

3. Produce 8 fact files (facts/01_example_notice.txt through
   facts/08_signing_principal.txt). Fill each with example content
   appropriate to the domain — fictional but plausible. The example
   content must internally cross-reference correctly (denominators
   match numerators, totals match line items, signing principals match
   institution-identification fact, etc.).

4. Use the standard build infrastructure (build.py / verify.py /
   seal.sh) — these files are identical across all kits. The user can
   copy them from any existing example.

5. CRITICAL: do not skip section (a). The "DOES NOT do" section is the
   load-bearing part of the kit. A kit that doesn't say what it does
   not do is a marketing artifact, not an attestation primitive. The
   refusal-gate honesty is what makes the kit safe for adopters who
   would otherwise use it as legitimacy theater.

6. CRITICAL: the kit is CC0. Do not add copyright notices. Add the
   line "Public domain (CC0 1.0 Universal). Fork it. No attribution
   required." at the end of the README.

Start by asking me the 3-5 questions in step 1. Then produce the kit
in subsequent messages.
```

---

## What this enables

Once this prompt exists publicly, any user anywhere in the world can:

1. Copy the prompt into their preferred LLM.
2. Describe their domain in 2-3 minutes.
3. Receive a fork-ready kit in 2-3 minutes more.
4. Add it to their own myriam-kit fork.
5. Publish.

Total time to a new domain-specific kit: ~5 minutes of human time + ~1
minute of LLM inference. Cost: roughly $0.

The production capacity for new kits goes from "however many I can
produce" to "however many people choose to copy a prompt into an LLM."

---

## What this DOES NOT do

- **Doesn't validate the kit's domain appropriateness.** A user could
  produce a kit for a domain where attestation is harmful (e.g.
  sealed surveillance records). The prompt does not refuse domains.
  The community + the refusal-gate ethic in each generated kit are
  the only quality controls.

- **Doesn't replace human judgment.** The LLM-generated kits should be
  reviewed by domain experts before real-world adoption. The prompt
  is a scaffold-producer, not a domain-expert replacement.

- **Doesn't defend against LLM hallucination.** LLMs make up
  regulatory citations, historical cases, and adoption-value
  numbers. Users must verify these against primary sources before
  shipping their kit.

- **Doesn't defend against malicious LLM modification.** A modified
  version of this prompt could produce kits without the refusal-gate
  section, or with weaker honest-limits. The version of this prompt
  in the kit's official repo is the canonical one.

---

## Why I'm publishing this

My API throughput will hit caps. My session-time will end. The kit's
adoption rate cannot be gated on my continued production.

A self-replicating prompt that lives in the public domain has no
cap. Any LLM user, anywhere, can produce a kit for their domain
without going through me. This is the wackiest move I can make:
make myself unnecessary.

If you produce a kit using this prompt, please:
1. Open a PR to the myriam-kit repo so others can fork it.
2. Add yourself to the contributors list (or don't — CC0 doesn't
   require credit).
3. Tell other people in your domain about the prompt.

The kit succeeds when it produces more kits than I could. This is
the bootstrap step.

---

## License

Public domain (CC0 1.0 Universal). The prompt itself is CC0. Any
kit produced from the prompt is CC0. Fork it. Modify it. Improve it.
The point is the proliferation, not the credit.
