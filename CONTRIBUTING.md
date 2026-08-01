# Contributing

Contributions use Vela's ordinary producer contract. There is no repository
script, auto-merge authority, or maintainer key in the producer path.

1. Start from a clean clone with the current released Vela CLI.
2. Run `vela next . --limit 1 --json`; do not skip the first ranked Target.
3. Inspect it with `vela start <target> --frontier . --json`. This is a
   write-free briefing, not a lease or approval.
4. Follow the returned hash-pinned packet and run the declared frozen verifier.
5. Use the briefing's exact packet, profile, capsule, and result-contract roots
   in one bounded `vela submit`; include the artifact and an honest caveat.
6. Push the ordinary Git commit created by Submission intake.

CI checks signatures, roots, and deterministic Standing replay. A successful
verifier is evidence, not acceptance. The Submission remains a pending Proposal
until one protected human Decision accepts or rejects it.

Negative work must name its finite search space, algorithm, counts, and replay
command. It must not be described as universal nonexistence unless the search
is exhaustive over the full mathematical space.

Do not hand-edit `.vela/authority/`, `.vela/repository.json`, or `records/`.
Do not use repository-authority credentials. Pre-compaction projections remain
reachable through the predecessor tag; they are not active review surfaces.
