# Quickstart

Five minutes from clone to sealed publication. macOS-tested; Linux should
work; Windows users will need WSL.

## 0. Prerequisites

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Scaffold

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Edit facts

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Each file is one fact. UTF-8. LF line endings. Filename pattern is
`NN_short_name.txt` where NN is zero-padded. They are sorted
lexicographically into the Merkle tree, so 02 always comes after 01.

Tip: phrase every fact as a *naming or declaration event*, not as an
ontological claim about the world. "Acme Corp has declared that batch X
passed test Y" is verifiable. "Batch X is safe" is not.

## 3. Start the IPFS daemon (one-time per machine)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Seal

```bash
bash build/seal.sh
```

This will:
1. Hash each fact (SHA-256), compute the Bitcoin-style Merkle root.
2. Stamp the root with OpenTimestamps via two independent calendars
   (alice + finney by default — override via `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Pin the `site/` directory to IPFS and print the CID.

Total: ~10 seconds with a warm IPFS daemon.

## 5. Edit `site/index.html`

Replace the template placeholders with your actual facts, hashes, and
Merkle root. The displayed per-fact hashes must match the per-fact files,
or the page fails its own self-verification.

For each fact, copy the body of the .txt file into a `<div class="fact">`
block and put the SHA-256 in a `<div class="hash">` directly under it.
The Merkle root goes in the cryptographic-seal section.

(Yes, this could be auto-generated. It is not, deliberately: the
manual step is the human review step. The protocol does not protect
against publishing something you didn't read.)

## 6. Verify locally

```bash
python3 build/verify.py
```

Expected output:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

The "Pending" is normal — the OTS calendar will upgrade the attestation
to a full Bitcoin attestation within a few hours.

## 7. Deploy

Pick any of:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → drag `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` in `site/`, push to repo, enable Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (static hosting on)
- **Any plain VPS**: `scp -r site/* user@host:/var/www/html/`

The IPFS CID from step 4 gives you an additional content-addressed
URL: `https://<CID>.ipfs.dweb.link/`. Use it.

## 8. Upgrade the OTS receipt (later)

Within ~few hours of sealing, run:

```bash
ots upgrade build/merkle_root.txt.ots
```

This converts each calendar's pending attestation into a full Bitcoin
attestation that references a specific block. Re-deploy the `.ots` file
to your hosts after upgrading.

## 9. That's it

You've published a small set of facts in a way that any third party can:

- Fetch all facts via plain HTTP from your host
- Recompute the Merkle root from the fact bytes
- Compare to your published root
- Verify the root was committed to Bitcoin at the OTS-stamped time
- Independently fetch the same facts via IPFS at the published CID
- Confirm all hashes match

If any of those steps fails, tampering has occurred. The reader doesn't
have to trust you. They just have to do the math.
