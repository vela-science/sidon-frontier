# sidon-frontier

This repository records explicit lower bounds for Sidon subsets of the binary
cube. A set is Sidon when all componentwise integer sums `a + b`, with `a <= b`,
are distinct. The sequence is [OEIS A309370](https://oeis.org/A309370).

Accepted state records the bounds in `records/claims/`. Historical witnesses
and searches remain retained evidence; their presence in Git is not scientific
acceptance.

## Work on the frontier

The current epoch has no configured Target Index, so `vela next` correctly
returns no offers. The obsolete unindexed a(24) packet and its broken refresh
script were removed; the exact historical packet root remains bound by the
retained exchange benchmark. Inspect and verify the repository with the current
Vela CLI:

```bash
vela status . --json
vela next . --limit 1 --json
vela check . --json
```

`.vela/origin.json` binds compacted predecessor tag
`pre-compaction/d0915ecd4dd8`. `.vela/repository.json` indexes current Claims
and artifacts, `.vela/authority/` contains repository authority, and `records/`
contains content-addressed scientific objects.

## Verify the record

```bash
vela check .
vela reproduce artifacts/sidon-a24-improvement.witness.json
node verification/verify-sidon-a24-7194.mjs \
  artifacts/sidon-a24-gpt56-7194.witness.json
```

Strict repository verification passes. The [auxiliary independent verification](verification/README.md)
uses a separate JavaScript/base-3 implementation to check the 7,194-point
witness and reject a deterministic collision injection. It is auxiliary
evidence, not a registered Vela verifier attachment or an acceptance decision.
Two historical artifact links target exact pending findings and remain
explicitly classified as provisional, unauthenticated evidence. They do not
enter accepted state; see [DEBT.md](DEBT.md).

Current accepted bounds are derived from the accepted Claim Records; this
repository intentionally carries no second hand-maintained status snapshot.
Witnesses and prior search artifacts are retained under `witnesses/` and
`discoveries/`. Scope is defined in [SCOPE.md](SCOPE.md) and
[STATEMENT.md](STATEMENT.md).
