# Contributing

Nothing here asks you to trust the maintainer. Every claim is re-derived from a
clean checkout by the [`Verify the signed frontier`](.github/workflows/vela-frontier.yml)
gate, and a beat merges on the strength of that re-derivation, not a review.

## 1. Beat a bound: the merge is automatic

If you construct a Sidon set larger than the current best for its `n`, your PR
merges itself. You need no key and no maintainer.

```bash
# in your fork:
python3 submit.py mine.json      # re-verifies, lands under your agent key,
                                 # and fires the frozen verifier (machine_verified)
git push && gh pr create --fill
```

`submit.py` does four things locally, all with commands you can run by hand and
inspect: it re-runs the frozen verifier on your witness, lands the finding under
an `agent:` actor, writes the witness into [`witnesses/`](witnesses/) and maps it
in `witnesses/targets.json` (the verifier's consent map), and runs
`vela gate auto-admit` so the substrate re-runs the verifier and binds the claim
to the construction. The result is a `machine_verified` finding and a citable
receipt.

On the PR:

- [`vela-frontier.yml`](.github/workflows/vela-frontier.yml) replays the event
  log, checks every signature and hash, and re-runs `vela reproduce` on every
  witness from a clean checkout.
- [`vela-auto-merge.yml`](.github/workflows/vela-auto-merge.yml) re-derives the
  exact-lane verdict for each new finding (`vela gate auto-admit --json`) and
  compares its witness-derived claim to `bounds.json`. If every new finding is
  `machine_verified` and at least one is a genuine beat, it merges. Otherwise it
  labels the PR `needs-review` and explains why.

What does **not** auto-merge, by design:

- a valid Sidon set that is not larger than the published best (a tie or a
  smaller set), real and recorded on request but not an improvement;
- anything that is not a computational Sidon witness the frozen verifier can
  re-run;
- any change that touches accepted state, governance, or more than the one new
  finding.

Those wait for a human. A forged claim never reaches that point: the verifier
rejects a witness whose size does not match its claim.

## 2. Contribute a proof or a formalization: a human accepts

Reaching a larger bound is machine-checkable, so it auto-merges. Certifying that a
construction generalizes, or formalizing the argument in Lean, is a truth-bearing
judgment. Those stay human.

Propose without a key; you need one only to accept, and accepting is the
maintainer's job:

```bash
vela finding add . \
  --assertion "Your claim, scoped precisely." \
  --type theoretical --source "<where it comes from>" \
  --author "github:your-handle"        # NO --apply: this is an unsigned proposal
git add .vela/ && git commit -m "Propose: <claim>" && git push
# then open a pull request.
```

The verify gate confirms your proposal is structurally valid and does not change
accepted state (it stays a pending `vpr_*`). A maintainer reviews it and, if it
holds, accepts it under their reviewer key with `vela accept . <vpr_id>`.

For a machine proof-attestation (a Lean kernel audit), your proof repo's CI can
self-sign a `vpv_` under a `ci:` actor. That is signed evidence, not an accept,
and the gate still governs whether the finding reaches verified.

## The rule underneath

Git stores and transports. The frozen verifier re-runs constructions. A human key
accepts the truth-bearing judgments. An agent may land a witness or propose a
claim, but never signs an accept, and no model sits in a trust path. The reducer
derives the view. Clone the repo, run `vela check . --strict` and
`vela reproduce .`, and you can verify every bound here yourself.
