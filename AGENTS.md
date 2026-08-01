# Sidon Sets Frontier agent guide

This is the only canonical agent guide for this repository. The scientific
source of truth is Git plus the current Vela repository manifest; generated
vendor-specific instruction copies are intentionally not used.

## Agent rules

Agents may:

- inspect `vela status .`, `vela next .`, `vela show`, `vela why`, and
  `vela check .`
- start one offered Target when a current Target Index exists
- run the verifier named by the exact packet
- retain one signed, bounded Submission from the active Attempt

Agents may not:

- invoke repository-authority decisions or use its credentials
- treat verifier success, Git publication, or a model answer as acceptance
- hand-edit `.vela/authority/`, `.vela/repository.json`, or retained records
- hide the structural debt recorded in `DEBT.md`

## Fast commands

```bash
vela status . --json
vela next . --limit 1 --json
vela start <target> --as agent:<name> --json
vela submit --frontier . --attempt <vat_id> --claim "<bounded result>" \
  --type computational --replayability exact \
  --artifact <path>:<kind> --caveat "<scope limit>" \
  --as agent:<name> --json
vela review list . --json
vela show . <object_id> --json
vela why . <claim_id> --json
vela check . --json
```

No current Target Index is configured. If `vela next` returns no offers,
inspect existing records and stop; do not revive the retired work queue.
