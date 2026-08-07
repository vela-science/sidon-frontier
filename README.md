# sidon-frontier

> [!IMPORTANT]
> **Archived.** This repository is preserved exactly as signed and is no longer
> developed. Its history, records and authority events stay readable here.
>
> Vela's authority boundary was renamed and consolidated in
> [ADR 0039](https://github.com/vela-science/vela/blob/main/docs/adr/0039-repository-authority-and-derived-frontiers.md).
> `Frontier` was doing three jobs at once — authority boundary, topic boundary
> and product slice — and four repositories existed because there were four
> topics, not four authorities. They named one maintainer and one decision
> model between them, so four trust roots bought four Standing universes that
> could not see each other.
>
> A repository now exists because there is a new **authority**, never because
> there is a new topic. Current mathematical work lives in one repository under
> one authority. Nothing here was migrated into it: Claims are re-admitted
> deliberately through Submission, Verification and Decision, and these roots
> remain as their provenance.
>
> Tooling from `vela 0.967` onward does not read this repository. The last
> release that does is `0.966.4`.

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
vela replay . --json
```

`.vela/origin.json` binds compacted predecessor tag
`pre-compaction/d0915ecd4dd8`. `.vela/repository.json` indexes current Claims
and artifacts, `.vela/authority/` contains repository authority, and `records/`
contains content-addressed scientific objects.

## Verify the record

```bash
vela replay .
vela reproduce artifacts/sidon-a24-improvement.witness.json
node verification/verify-sidon-a24-7194.mjs \
  artifacts/sidon-a24-gpt56-7194.witness.json
```

Strict repository replay passes. The [auxiliary implementation-diverse
verification](verification/README.md) uses a separate JavaScript/base-3
implementation to check the 7,194-point witness and reject a deterministic
collision injection. It shares the same operator, machine, campaign, and
witness, so it is not organizationally or externally independent. It is
auxiliary evidence, not a retained Vela Verification Record or an acceptance
Decision.
Current accepted bounds are derived from the accepted Claim Records; this
repository intentionally carries no second hand-maintained status snapshot.
Witnesses and prior search artifacts are retained under `witnesses/` and
`discoveries/`. Scope is defined in `frontier.toml`, whose bytes are covered by
`profile_root`, and the question is stated in [STATEMENT.md](STATEMENT.md).

## Archived edition

The first archived edition, `v1.0-oeis-adopted`, is preserved at
[doi:10.5281/zenodo.20709455](https://doi.org/10.5281/zenodo.20709455). It
records the A309370 witnesses for `a(7)..a(24)` and the OEIS-adopted lower
bounds for `n=8..22` as of June 10, 2026. This citation is historical; current
Standing is derived only from the replayed Claim and Decision records.
