# sidon-frontier

A live record of lower bounds for Sidon sets in the binary cube: how many points
you can place in `{0,1}^n` so that all pairwise sums stay distinct. The sequence
is [OEIS A309370](https://oeis.org/A309370). The current best bound for each `n`
lives in [`bounds.json`](bounds.json), and every one of them is backed by a
witness a stranger can re-check from a clean clone.

This is the first Vela frontier where an outside contributor's verified result
lands with no maintainer in the loop. You find a larger Sidon set, you submit its
coordinates, and a frozen verifier re-runs your construction and merges it. No
key of yours is trusted, and no key of the maintainer's is needed for the merge.

## Beat a bound

You need a witness: a JSON file with the points of a Sidon set larger than the
current best for its `n`.

```bash
# 1. Fork this repo and clone your fork.
git clone https://github.com/<you>/sidon-frontier && cd sidon-frontier

# 2. Install vela (the version this frontier is pinned to, from vela.lock).
cargo install --git https://github.com/constellate-science/vela vela-cli

# 3. Submit your witness. This re-verifies it, lands it under your agent key,
#    and fires the frozen verifier to bind the claim to the construction.
python3 submit.py mine.json

# 4. Push the commits it made and open a pull request.
git push && gh pr create --fill
```

`mine.json` is `{"kind": "sidon", "n": 12, "points": [[0,1,0,...], ...],
"claimed_size": 134}`. See [`witness.example.json`](witness.example.json).

On the pull request, [CI](.github/workflows/vela-frontier.yml) re-derives the
whole frontier from a clean checkout and re-runs the verifier on your witness. If
your set is a genuine beat and it checks out, the
[auto-merge workflow](.github/workflows/vela-auto-merge.yml) merges it. If it is
valid but not a beat, or it is anything other than a computational Sidon witness,
it waits for a human.

## What the merge means, and what it does not

A merged beat is **`machine_verified`**: a frozen verifier re-ran the construction
from scratch and confirmed the claim is bound to it. That is a fact about the
witness, not a judgment about significance. It is distinct from **`accepted`**,
which a named human reviewer signs with their own key. The auto-merge never
signs an accept, and no model is ever in that path. Agents land, verifiers
reproduce, humans sign.

The trust is the floor, not the paperwork. The verifier runs on GitHub's clean
runner from your fork's checkout, so:

- a valid larger Sidon set merges on its own math, and
- an inflated claim (`a(8) >= 45` behind a 30-point set) fails the verifier
  before it can land: the construction size has to match the claim.

## Verify it yourself

The dashboard and `bounds.json` are materialized views. The authority is the
signed, replayable event log under [`.vela/`](.vela/) (frontier
`vfr_496956067dc5ad79`):

```bash
vela check .        # replay the log, verify every signature and hash
vela reproduce .    # re-run every frozen verifier on every stored witness
```

If both pass on your machine, you have re-derived every bound here without
trusting anyone. The witnesses are in [`witnesses/`](witnesses/), and
[`witnesses/targets.json`](witnesses/targets.json) maps each one to the finding
it proves.

## What is inside

Beyond the bounds, this frontier carries the additive-combinatorics context the
records sit in: the curriculum findings (Erdős–Turán through the polynomial
method), the earlier AI-attribution demonstration that started it, and the
technique notes in [`technique-sheet.md`](technique-sheet.md). Scope and intent
are in [`SCOPE.md`](SCOPE.md) and [`STATEMENT.md`](STATEMENT.md).

Contribution details, including the proof and formalization paths, are in
[`CONTRIBUTING.md`](CONTRIBUTING.md).

## Origin

This frontier began as a concrete answer to Timothy Gowers's 2026 note on wanting
a place where AI-produced results could live only if a human certified them, or a
proof assistant did. Vela's substrate records that distinction natively: every
event carries `actor.type`, agent-drafted proposals stay proposals until a human
signs, and a witness that reproduces is a fact independent of either.
