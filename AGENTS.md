# Sidon Sets Frontier agent guide

This is the only canonical agent guide for this repository. The scientific
source of truth is Git plus the current Vela repository manifest; generated
vendor-specific instruction copies are intentionally not used.

## Agent rules

Agents may:

- inspect `vela status .`, `vela next .`, `vela show`, `vela why`, and
  `vela check .`
- inspect one offered Target with the write-free `vela start` briefing
- run the verifier named by the exact packet
- retain one signed, bounded Submission binding the exact packet and verifier

Agents may not:

- invoke repository-authority decisions or use its credentials
- treat verifier success, Git publication, or a model answer as acceptance
- hand-edit `.vela/authority/`, `.vela/repository.json`, or retained records
- hide the structural debt recorded in `DEBT.md`

## Fast commands

```bash
vela status . --json
vela next . --limit 1 --json
vela start <target> --frontier . --json
vela submit --frontier . --claim "<bounded result>" \
  --type computational --replayability exact \
  --artifact <path>:<kind> --caveat "<scope limit>" \
  --packet-root <packet_sha256> --profile-root <profile_sha256> \
  --verifier-capsule-root <capsule_sha256> \
  --result-contract-root <contract_sha256> \
  --as agent:<name> --json
vela verification import . <verification.json> --as verifier:<name> --json
vela review list . --json
vela show . <object_id> --json
vela why . <claim_id> --json
vela check . --json
```

No current Target Index is configured. If `vela next` returns no offers,
inspect existing records and stop; do not revive the retired work queue.
