# Dynamic Transformer Configuration — HLD

**Feature:** Transformer configuration served from MDMS instead of the APK
**Module:** digit_flow_builder / health_campaign_field_worker_app
**Issue:** https://github.com/egovernments/DIGIT-Frontend/issues/4445
**Author:** Naveen Renati
**Version:** 0.1 (draft for review)
**Date:** 2026-10-06

---

## 1. Problem

`transformer_config.dart` — the compiled Dart map that says how a submitted form
becomes a saved record — changed in **99 commits over the last 12 months**,
about twice a week. Every one of them required an APK build, QA and
redistribution to the field.

Form flows do not work this way. They come from MDMS under
`HCM-ADMIN-CONSOLE.FormConfigTemplate`, are fetched at project selection, and
change without an app release. The two are one logical configuration delivered
on two cadences, and they reference each other by exact form path:
`groupVacChild` maps `"ageBand": "childDetails.ageBand"`, which only resolves
while the MDMS flow still has a `childDetails` page with an `ageBand` field.

Drift between them is undetectable. A flow published ahead of its transformer
does not fail — it saves a record with the field missing, and nothing
server-side reveals which devices did so.

## 2. What is already solved

Every config now declares `fallbackModel`, so `_getUnmappedFields` sweeps any
form value no mapping consumed into that model's `additionalFields`
(`transformer_service.dart:68`). **A campaign adding a form field it wants
stored needs no transformer change at all.** That was the most common request
and it is closed.

It also changes the drift picture, and not for the better: a renamed page key
used to leave its typed column visibly unpopulated. The orphaned value is now
swept into `additionalFields` instead, so the record looks complete while the
column is empty. Detection matters more after this change, not less.

## 3. What still needs a release

| Case | Example from the last 12 months |
|---|---|
| A new flow | *Add Polio Group Vaccination flows for CLF and Transit Post* — four new config entries for flows whose forms came from MDMS |
| Mapping into a typed column | *Capture lat/lng/accuracy on unable-to-deliver and ineligible* — `latitude`/`longitude` are columns, which the fallback cannot reach |
| Changing a literal or switch | *Use action=OTHER for polio group-vaccination UserActions* |
| Fixing a mapping | *Stop overwriting server-assigned TaskResourceModel id from form data* |
| Retargeting | Moving a value from `additionalFields` into a column, or between models |

The pitch is therefore **"ship and fix flows without a release"**, not "let
campaigns add fields". Narrower than it first appeared, but it is the residue
of roughly two changes a week.

## 4. Goals

- A new flow ships without an app release, as its form already does.
- A mapping fix reaches the field at the cadence of the bug, not the build.
- Flow and transformer move together, so publishing one cannot silently
  invalidate the other.
- Drift fails loudly instead of writing a partial record.
- Offline-first behaviour preserved, including on a fresh install.

## 5. Not in scope

- **Fields needing a typed column.** A new column means a model change and a
  Drift migration, so it needs a release regardless. Config cannot help.
- **Additive fields destined for `additionalFields`** — already solved by
  `fallbackModel`, see §2.
- Changing the mapping directive vocabulary (`__generate:`, `__context:`,
  `__ref:`, `__switch:`, `list:`).
- An authoring UI in the admin console.

## 6. Existing Flow

Project selection → MDMS `FormConfigTemplate` fetched, filtered by project
referenceID → `storeSchema` writes to `app_config_schemas` → module tap →
`FlowNavigationUtils` reads the cache → `FlowRegistry.setConfig` → form renders.

Form submit → `FETCH_TRANSFORMER_CONFIG` → `jsonConfig[configName]` read from
the **compiled Dart map** → `FormEntityMapper` builds entities → `CREATE_EVENT`
persists.

## 7. Proposed flow

Project selection → `FormConfigTemplate` **and** `TransformerConfigTemplate`
fetched in the same step, **both filtered by project referenceID** → response
cached as last-known-good → `TransformerConfigRegistry.setConfig` → module tap →
form renders.

Form submit → `FETCH_TRANSFORMER_CONFIG` → `TransformerConfigRegistry.get(name)`
→ cached config if present, bundled config otherwise → `FormEntityMapper` builds
entities → `CREATE_EVENT` persists.

**The client always asks the same question: "what is the transformer config for
this project?"** It does not know that base and project-specific configs are
different things, and it never sees two candidates.

Server-side, most campaigns have no project-specific document at all — a
project-specific document is written only when its config differs from base
(see the backend doc). The backend resolves which applies and returns the
effective config. Two consequences follow for this design:

- The client has **two** layers, not three: the fetched config, and the bundled
  map as an offline floor. There is no base layer and no merge.
- Whether a campaign is running base or an override is invisible to the app,
  and deliberately so. It is answerable server-side, and the resolved version is
  logged per §11 so support can still establish what a device ran.

## 8. Where changes are needed

Three places. The MDMS side gains a new master **and the resolution behaviour
that picks base or project-specific for a given project referenceID** — the
substantive piece of work, covered in the backend doc. `ProjectBloc` gains a
fetch and a cache write next to the one it already does for form configs.
`digit_flow_builder` gains a registry that the two transformer executors read
from instead of importing the Dart constant directly.

## 9. Components

| Component | What it does | Status |
|---|---|---|
| `HCM-ADMIN-CONSOLE.TransformerConfigTemplate` | New MDMS master holding per-module transformer configs, filtered by project referenceID | New |
| `TransformerConfigRegistry` | Singleton in `digit_flow_builder`; resolves a config name to MDMS-cached first, bundled second | New |
| `ProjectBloc.storeTransformerConfig` | Validates and caches a fetched document, keeping last-known-good | New |
| `TransformerExecutor` | Reads from the registry instead of `jsonConfig`; fails loudly on a miss | Changed |
| `ReverseTransformerExecutor` | Same substitution for the edit/view path | Changed |
| `FormEntityMapper` | Receives the merged map so `__ref:` resolves across bundled and remote configs | Changed |
| `transformer_config.dart` | Retained as offline fallback; frozen rather than deleted | Unchanged |

## 10. Where data state is present

| State | Where it is present |
|---|---|
| Bundled transformer configs | `packages/digit_flow_builder/lib/data/transformer_config.dart` (compiled constant) |
| Fetched transformer configs | `SharedPreferences` key `app_transformer_configs`, keyed by module name |
| Active resolution layer | `TransformerConfigRegistry._remote`, in memory, seeded at app start and after each fetch |
| Form flows | `SharedPreferences` key `app_config_schemas` (existing) |
| Config version actually in use | `data.version` per module, logged to the sync log |

## 11. Data

Three elements are new or modified.

**`TransformerConfigTemplate` document.** Mirrors the form-config envelope —
`id`, `tenantId`, `schemaCode`, `uniqueIdentifier`, and a `data` object carrying
`name`, `version` and `configs`. The value under each key in `data.configs` is
byte-identical to today's entry in `jsonConfig`, so migration is a copy.

The client receives **one effective document per module** for the requested
project. Whether the backend resolved that from base or from a project-specific
override is not represented in what the client sees, and the client does not
branch on it.

**`app_transformer_configs` cache.** Same shape as `app_config_schemas`: a map
keyed by module name, each value wrapping the fetched document. Written only
after validation passes, so a malformed response leaves the previous good copy
intact.

**`data.version`.** An integer per module, used to reject a stale MDMS replica
and to record in the sync log which revision a device actually ran.

## 12. When the feature is active

Always, once shipped — the registry is the only resolution path. Whether a given
config comes from MDMS or the bundle is decided per config name at resolve time.
A project whose MDMS master is absent or empty behaves exactly as today, because
every lookup falls through to the bundled map.

## 13. How the flow is allowed

No new permission or role gate. Fetch is scoped by the same project referenceID
filter already used for form configs, so a user only ever receives transformer
configs for projects they can select.

## 14. Error handling

**Fetch fails.** The cached last-known-good copy is kept and the app continues.
On a fresh install with no prior cache, every lookup falls through to the
bundled map, which is the current behaviour.

**Document is malformed.** Rejected wholesale during validation — every value
under `data.configs` must be a map containing `models`, and every `models` entry
must contain `mappings`. The previous cache is left untouched. This is a shape
check on the client, not a substitute for the semantic validation the backend
performs at publish time.

**Backend cannot resolve base or override.** The client cannot distinguish this
from an empty response and does not try: an empty response means keep the cache,
or fall through to the bundled map if there is none.

**Config name not found at resolve time.** Today this is a silent no-op. It
becomes an error-level log naming the config and whether a remote entry existed,
plus dispatch of the action's `onError` chain — every config already declares
one on `FETCH_TRANSFORMER_CONFIG`.

**Mapping resolves to null for a required field.** Logged with config name and
source path. This is the drift detector; it is what would catch a renamed page
key today.

## 15. Accessibility

No UI surface is added or changed, so no new accessibility considerations. The
one user-visible effect is the error toast on a failed transform, which uses the
existing `SHOW_TOAST` action and inherits its contrast and screen-reader
behaviour. Error copy must be written as a localized code, not a raw string, so
it is translatable like every other message.

## 16. Decisions

**The backend resolves base versus project-specific; the client always asks by
project referenceID.** The alternative — the client fetching both and preferring
the project one — puts product logic in 36 installed APK versions, which is the
coupling this change exists to remove. It also means a change to the resolution
rule would need an app release. The cost is that MDMS `_search` has no
inheritance semantics, so the backend needs a resolving layer in front of it;
that work is specified in the backend doc and is a prerequisite, not a
follow-up.

**Project-specific documents are written only when they differ from base.**
Today a document is created per project regardless, which duplicates base across
every campaign and makes a base fix require rewriting every project document.
Since the client asks the same question either way, this is purely a server-side
authoring decision with no client impact.

**Fetch alongside form configs, in the same block, rather than on its own
schedule.** This is what makes flow and transformer version together. Fetching
them independently would add a second way for them to drift, which is the
problem we are trying to close, not an optimisation to trade away.

**Per-config fallback rather than all-or-nothing.** Resolution is by config
name, so MDMS can supply `groupVacChild` while `stockReceipt` still comes from
the bundle. This permits module-by-module migration and means a partially
authored master cannot break flows it doesn't mention.

**Keep the bundled map rather than deleting it.** It is the only thing that
makes a fresh offline install work, and it is the compatibility baseline the
migration is verified against. It gets frozen by a CI check instead, so changes
are forced through MDMS.

## 17. Risks

**A bad config now reaches devices without a build.** That is the point of the
change and also its main risk — the APK cycle currently acts as an unintended
review gate. Validation on fetch and loud failure at resolve time are the
compensating controls; a publish-time review step in the console is the real
one.

**Offline-first depends on the cache being correct.** Field workers operate
without connectivity for long stretches. A device that cached a broken-but-valid
config carries it until the next successful fetch. Validation reduces this to
configs that are structurally sound but semantically wrong — which is exactly
what the drift detector in §14 is for.

**The format is developer-facing.** Mapping directives and entity field names
are implementation detail. Without an authoring UI, moving to MDMS changes who
*deploys* but not who *writes*, so the release-latency gain may be smaller in
practice than it looks.

## 18. Testing strategy

Backward compatibility is established structurally and then verified. The
indirection ships first with an empty remote layer, so any regression at that
point is attributable to the refactor rather than the data.

The regression gate is a fixture-diff harness: for each of the 36 configs, a
recorded form payload maps to a recorded entity set, asserted field by field.
The same fixtures are replayed once a config is authored in MDMS, and the
generated entities must be byte-identical to the bundled baseline.

End-to-end, the goal case is exercised directly — change a form field in
`FormConfigTemplate` and its mapping in `TransformerConfigTemplate`, publish
both, re-select the project on an unmodified APK, confirm the new field
persists.

Performance is measured before and after on a reference device: app start to
home render, project selection total, and submit-to-acknowledgement on
`beneficiaryRegistration`.

## 19. Open questions

1. **Per-project or per-tenant granularity?** Resolved for the client: it always
   asks by project referenceID. The open part is server-side — whether base is
   global, per-tenant or per-module, which changes what "base" means when one
   tenant wants a different default. Needs confirmation from the console team.
2. **Who authors these, given the format is developer-facing?** Decide whether
   "developers edit MDMS instead of Dart" is sufficient for the goal, or whether
   an authoring surface is a prerequisite.
3. **Does publish-time validation belong in this scope?** Nothing enforces that
   a published transformer matches its flow. Fetching both together makes them
   usually consistent, but the real fix is server-side and currently out of
   scope.
