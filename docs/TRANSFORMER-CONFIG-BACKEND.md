# Dynamic Transformer Configuration — Backend

**Feature:** Serving transformer configs from MDMS
**Module:** MDMS v2 + admin console (campaign-manager)
**Issue:** https://github.com/egovernments/DIGIT-Frontend/issues/4445
**HLD:** [TRANSFORMER-CONFIG-HLD.md](./TRANSFORMER-CONFIG-HLD.md)
**LLD (client):** [TRANSFORMER-CONFIG-LLD.md](./TRANSFORMER-CONFIG-LLD.md)
**Author:** Naveen Renati
**Version:** 0.2 (draft for review)
**Date:** 2026-10-07

---

## 1. What this is

A *transformer config* says how a submitted form becomes a saved record. Today
it is compiled into the APK. We are moving it to MDMS so it can change without
an app release.

Most campaigns need the same mapping. A few need something different. So we
store **one base config per module**, and a **project-specific config only for
the campaigns that differ**.

The app does not know any of this. It asks one question — *"what is the
transformer config for project X?"* — and the backend answers with whichever
config applies.

## 2. Worked example

Base config for the INVENTORY module maps a scanned stock receipt into
`StockModel`.

**Campaign A** runs it unchanged.
→ No project document is written. App asks for project A, gets base.

**Campaign B** must record the receiving storekeeper in the `senderId` column
rather than the default `__context:userFacilityId`.
→ A project document is written for B with that one mapping changed.
→ App asks for project B, gets B's config.

Later, base is corrected so `expiryDate` maps into the typed column.
→ Campaign A picks it up on next sync.
→ Campaign B does **not** — it has its own copy of that config. §6 is how we
make that visible.

Note what is *not* an example here. A campaign that simply wants a new form
field saved into `additionalFields` needs none of this: `fallbackModel` sweeps
unmapped form values automatically (`transformer_service.dart:68`), and every
config now declares one. And a field needing a new typed column needs a model
change and a Drift migration, so it needs an app release whatever we do. This
mechanism is for changing *how existing fields map* and for shipping *new
flows*.

## 3. The two documents

Both use schema code `HCM-ADMIN-CONSOLE.TransformerConfigTemplate`. They differ
only by whether a project is attached.

**Base** — one per module, no project:

```json
{
  "uniqueIdentifier": "INVENTORY.TRANSFORMERS.BASE",
  "isActive": true,
  "data": {
    "name": "INVENTORY",
    "scope": "BASE",
    "version": 7,
    "configs": { "stockScanReceipt": { "models": { "...": "..." } } }
  }
}
```

**Project-specific** — written only when different from base:

```json
{
  "uniqueIdentifier": "INVENTORY.TRANSFORMERS.CMP-2026-09-24-005390",
  "isActive": true,
  "data": {
    "name": "INVENTORY",
    "scope": "PROJECT",
    "project": "CMP-2026-09-24-005390",
    "version": 2,
    "basedOnVersion": 7,
    "configs": { "stockScanReceipt": { "models": { "...": "..." } } }
  }
}
```

A project document carries **only the configs that differ**, not a copy of the
whole module. If a campaign overrides `stockScanReceipt`, it still inherits
every other config in the module from base.

## 4. On publish: write only if different

When someone saves a campaign's transformer config:

```
compare submitted against base, per config name
        |
   identical  ->  write no project document
                  (deactivate an existing one — the campaign has
                   returned to base)
        |
  different   ->  write a project document containing only the
                  differing config names, with
                  basedOnVersion = current base version
```

**Compare canonicalised JSON**, not raw text — keys sorted, whitespace
normalised. Otherwise a reordered key looks like a change and every campaign
gets a document, which is the duplication we are removing.

**Deactivate, never delete.** Set `isActive: false`. The client already ignores
inactive documents, and the audit trail of what a campaign once ran is kept.

## 5. On read: return the right one

The app calls with a project referenceID and expects one config per module:

```
project document exists and isActive  ->  return it
otherwise                             ->  return base
neither                               ->  return empty
```

**This needs building.** MDMS `_search` is a plain filter query — ask it for
project X and it returns X's document or nothing. It will not fall back to base
on its own. So we need a resolving layer in front of MDMS that applies the rule
above.

The alternative — the app fetching both and choosing — was rejected: that puts
the rule inside every installed APK version, so changing it would need an app
release.

## 6. Keeping overrides honest

Two things worth surfacing in the console. Neither is visible to the app.

**An override has fallen behind base.** `basedOnVersion` is older than base's
current `version`, meaning base has been fixed since and this campaign did not
get it (the Campaign B case in §2). Show it as a prompt to review, not an error
— it still works.

**A transformer no longer matches its form.** A mapping reads
`childDetails.ageBand`, but that campaign's form config no longer has that
field. Nothing today detects this; the app silently saves a record with the
field missing. Cross-checking the two at publish is the only cheap place to
catch it, and it is the most valuable check in this document.

## 7. Validation against swagger

Mappings name target fields. A typo means the value is silently dropped, so we
check them at publish.

**Important: swagger alone is not enough.** Mappings target the *client* model,
which carries offline-first fields the server contract has never heard of —
`clientReferenceId`, `clientAuditDetails`, `rowVersion`, `nonRecoverableError`,
`isSync`. In the current config these appear 250+ times. Checking only against
swagger would reject almost everything.

Verified against
[Attendance-Service-1.0.0.yaml](https://editor.swagger.io/?url=https://raw.githubusercontent.com/egovernments/DIGIT-Works/master/backend/attendance/Attendance-Service-1.0.0.yaml):
`AttendanceLogModel` maps eight fields present in the `AttendanceLog` schema and
four that are not. `AttendeeModel` maps `latitude`, `longitude`, `boundaryCode`
and `projectId`, none of which exist in `IndividualEntry` — and its name does
not match any schema in that file.

So the validator needs two inputs:

| Input | Authoritative for |
|---|---|
| Client model definition | What a mapping is allowed to target |
| Service swagger | What survives the sync to server |

Plus a hand-maintained name map, because `AttendanceLogModel` → `AttendanceLog`
and `AttendeeModel` → `IndividualEntry` do not derive mechanically.

**Checks, in order of strictness:**

| Check | On failure |
|---|---|
| Target field exists on the client model | Reject — this is the typo catcher |
| `__value:` matches a declared enum | Reject |
| Field exists on the swagger schema | Warn — client model may lead the contract |
| Swagger `required` field unmapped (ignoring `readOnly`) | Warn |
| `__value:` type mismatches swagger type | Warn |
| Keys under `additionalFields` | Skip — free-form by design |

Two mechanics to know: the specs are OpenAPI 3.0 with schemas under
`components/schemas`, and shared objects like `AuditDetails` resolve by absolute
GitHub URL into a second repo — so validation needs network access or a
vendored copy.

## 8. Versioning

`data.version` increments per document. The app logs the version it resolved, so
support can establish what a device actually ran.

One constraint from the client: it currently discards the MDMS envelope and
keeps only `data`, so backend fields like `auditDetails` are invisible to it.
Simplest fix is for the publisher to mirror a server-derived version into
`data.version` rather than changing a method every MDMS caller shares.

## 9. Open questions

1. **Where does the resolving layer in §5 live** — a new endpoint, or inside an
   existing service? This blocks the client work.
2. **Where does the client model definition in §7 come from?** The backend has
   no access to the app's Dart models. Either the app publishes a model manifest
   at build time, or the name map is maintained by hand and client-only fields
   go unchecked.
3. **Is base global, per-tenant, or per-module?** Changes what "base" means when
   one tenant wants a different default.
4. **Should `FormConfigTemplate` adopt the same pattern?** It has the identical
   duplication problem — a document per project whether or not anything differs.
5. **Who reviews a base change?** It reaches every campaign that has not
   overridden, with no app release to act as a gate.
