---
name: New use-case example proposal
about: Propose a new worked example kit for examples/
labels: example, enhancement
---

## Domain

(e.g. "vaccine batch attestation," "election tally," "scientific
reproducibility manifest," "court evidence chain")

## Why this use case fits myriam-kit

The kit fits when:
- A small set of facts (≤20) needs to be published
- Durability is required (decades or longer)
- Multiple parties don't trust each other
- Storage budget is tiny

(Explain how your proposed use case matches this shape.)

## Historical mortality / harm precedent

(If applicable, name 1–3 historical cases where cryptographically-
sealed publication of this fact-shape would have helped reduce
preventable harm. Use named cases, not vague "in general" arguments.)

## Proposed fact set (5–10 facts)

  FACT 01: ...
  FACT 02: ...
  ...

(Body of each fact need not be complete — just a one-line summary of
what each fact would attest.)

## What this kit defends against (specific failure modes)

(List specific failure modes the seal catches, mapped to your domain.)

## What this kit does NOT defend against (out-of-scope failures)

(Be explicit about what the seal cannot protect against in this
domain. Honest scoping is more useful than overpromising.)

## Recipient verification protocol

(How does a recipient of the underlying artifacts verify them against
the sealed manifest?)

## Are you willing to write the example kit?

- [ ] Yes, I'll submit a PR with the full example + README adoption guide.
- [ ] I'll write the facts but need help with the site/index.html.
- [ ] I'm proposing this for someone else to pick up.
