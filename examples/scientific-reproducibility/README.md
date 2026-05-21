# Scientific Reproducibility Kit

A turnkey myriam-kit example for research groups, journals, and
reproducibility-focused institutions wanting to publish a Bitcoin-
anchored, tamper-evident reproducibility manifest alongside a paper or
preprint.

## What this kit produces

A sealed publication containing, for one study:

1. Study identification (paper title, authors, institution, funders, COI)
2. **Raw data archive SHA-256** — the canonical dataset
3. **Analysis pipeline hash** — script + Docker image digest +
   pinned dependencies
4. **Expected output bundle hash** — what a faithful reproducer should
   produce
5. Reproduction protocol + post-result publication commitments
6. Signing principal(s)

The seal is intended for the **pre-analysis** stage: data frozen,
pipeline finalized, expected output computed, ALL before any results
are seen for the purpose of writing the paper.

## What this kit defends against

**Failure modes the seal catches:**

- **p-hacking**: post-hoc changes to analysis after seeing results are
  detectable via diff between sealed FACT 04 and published pipeline.
- **HARKing** (Hypothesizing After Results are Known): the
  pre-registered hypothesis in FACT 02 is byte-stable.
- **Data manipulation post-paper**: re-hashing the data archive against
  FACT 03 reveals any modification.
- **Pipeline drift**: re-hashing the analysis pipeline against FACT 04
  catches silent changes.
- **Authorship gaming**: silently adding or removing authors after
  publication becomes detectable against sealed FACT 02.

**Failure modes NOT covered:**

- Fraud in raw-data collection (the seal anchors data at the point of
  sealing, not collection)
- Biological / empirical non-reproducibility (the seal anchors
  computational reproducibility only)
- Sample-size or population-validity issues (these are study-design
  questions)
- The truth of the underlying claim (the seal anchors what was claimed,
  not whether the world matches the claim)

## When to use this kit

Consider sealing if:

- You are a research group running a high-stakes analysis (clinical
  trial, AI system evaluation, replication study) and want forensic
  integrity beyond OSF / GitHub time-stamps
- You are an early-career researcher who wants asymmetric reputational
  protection: sealed pre-analysis means future "they p-hacked" critique
  has a public falsifier
- You are a journal editor or replication-project lead wanting to
  encourage cryptographic-grade pre-registration for a subset of
  papers
- You are working on an analysis where post-hoc tweaks have meaningful
  field consequences (psych, behavioral econ, medical research)

## Historical mortality / harm precedent

This kit's mortality-relevance is indirect:

- **Stem cell / cancer research irreproducibility:** several papers
  have led to patient harm via misdirected clinical trials. Sealed
  pre-registration of the original pipeline would have anchored the
  comparison.
- **Tamiflu's effectiveness controversy:** the Cochrane review took
  years partly because raw-data access was contested. Sealed
  data-hashes at publication would have made data-access disputes
  immediately resolvable.
- **General irreproducibility crisis:** the field-level mortality cost
  of irreproducible biomedical research is significant (Begley &
  Ellis 2012 estimated >50% of preclinical findings irreproducible).
  Cryptographic anchoring is one structural lever.

## How to fork this kit

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## Integration with existing scholarly infrastructure

- **arXiv / bioRxiv / medRxiv**: include the MYRIAM seal URL or IPFS CID
  in the abstract or supplementary materials
- **OSF**: attach the seal artifact to the OSF project alongside the
  conventional pre-registration form
- **AsPredicted**: include the MYRIAM seal URL in the pre-registration
  document
- **GitHub**: the analysis pipeline's commit hash is what FACT 04
  anchors; GitHub provides the source, MYRIAM anchors the bytes
- **Zenodo / Figshare / OpenAIRE**: deposit raw data, then seal the
  deposit's hash; the seal is forensically harder to silently replace
  than the deposit metadata
- **Journal supplementary materials**: include the MYRIAM seal artifact
  as a supplementary file at submission

## What this kit does NOT replace

- IRB / ethics-committee approval
- Peer review
- Replication studies (computational reproducibility ≠ empirical
  reproducibility)
- Data-access agreements for sensitive data

## A note on author ordering and credit

The seal anchors the AUTHOR LIST at sealing time. Disputes about
authorship that arise post-publication can be evaluated against the
sealed list. This is a small accountability lever — important for ECRs
who get added or removed silently.

## License

Public domain (CC0). Use it, modify it, ignore it, fork it.
