# sidon-frontier

This repository records explicit lower bounds for Sidon subsets of the binary
cube. A set is Sidon when all componentwise integer sums `a + b`, with `a <= b`,
are distinct. The sequence is [OEIS A309370](https://oeis.org/A309370).

Accepted state records the bounds in `records/claims/`. Historical witnesses
and searches remain retained evidence; their presence in Git is not scientific
acceptance.

## Work on the frontier

The current epoch has no configured Target Index, so `vela next` correctly
returns no offers. Inspect and verify the migrated repository with Vela
`0.940.0`:

```bash
vela status . --json
vela next . --limit 1 --json
vela check . --strict --json
```

`.vela/epoch.json` binds predecessor tag
`pre-current-epoch/1c0316f51f09`. `.vela/repository.json` indexes current
claims and artifacts, `.vela/authority/` contains signed repository authority,
and `records/` contains content-addressed scientific objects.

## Verify the record

```bash
vela check . --strict
vela reproduce artifacts/sidon-a24-improvement.witness.json
node verification/verify-sidon-a24-7194.mjs \
  artifacts/sidon-a24-gpt56-7194.witness.json
```

Strict repository verification passes. The [independent Build Week verification](verification/README.md)
uses a separate JavaScript/base-3 implementation to check the 7,194-point
witness and reject a deterministic collision injection. It is auxiliary
evidence, not a registered Vela verifier attachment or an acceptance decision.
Two historical artifact links target exact pending findings and remain
explicitly classified as provisional, unauthenticated evidence. They do not
enter accepted state; see [DEBT.md](DEBT.md).

Current accepted bounds are projected in [bounds.json](bounds.json). Witnesses
and prior search artifacts are retained under `witnesses/` and `discoveries/`.
Scope is defined in [SCOPE.md](SCOPE.md) and [STATEMENT.md](STATEMENT.md).
