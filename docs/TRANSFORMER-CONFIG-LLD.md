# Dynamic Transformer Configuration — LLD

**Feature:** Transformer configuration served from MDMS instead of the APK
**Module:** digit_flow_builder / health_campaign_field_worker_app
**Issue:** https://github.com/egovernments/DIGIT-Frontend/issues/4445
**HLD:** [TRANSFORMER-CONFIG-HLD.md](./TRANSFORMER-CONFIG-HLD.md)
**Author:** Naveen Renati
**Version:** 0.1 (draft for review)
**Date:** 2026-10-06

---

## 1. Scope

No screen changes. The affected surface is the submit and edit paths of every
flow that declares `FETCH_TRANSFORMER_CONFIG` or `REVERSE_TRANSFORM`.

| Surface | Trigger | Change |
|---|---|---|
| Form submit | `FETCH_TRANSFORMER_CONFIG` action | Config resolved via registry, not the Dart constant |
| Edit / view prefill | `REVERSE_TRANSFORM` action | Same substitution |
| Project selection | `ProjectBloc` sync | One additional MDMS fetch + validated cache write |
| App start | Entrypoint | Registry seeded from the cache |

Naming note: `transformer config` in this document means one named entry under
`jsonConfig` (e.g. `groupVacChild`), not the file. The file is referred to as
the *bundled map*.

## 2. Component Structure

```
digit_flow_builder/lib/data/
  transformer_config.dart              bundled map (unchanged, frozen)
  transformer_config_registry.dart     NEW
        |
        +-- _remote : Map<String, dynamic>     MDMS layer, may be empty
        +-- setConfig(map)                     replaces _remote
        +-- get(name)   -> _remote[name] ?? jsonConfig[name]
        +-- merged      -> {...jsonConfig, ..._remote}
        +-- isRemote(name) -> bool
        |
        v
digit_flow_builder/lib/action_handler/executors/
  transformer_executor.dart            reads registry.get / registry.merged
  reverse_transformer_executor.dart    reads registry.get
```

`TransformerConfigRegistry` is a singleton, matching `FlowRegistry` and
`FlowBuilderSingleton` in the same package. It holds no I/O — seeding is the
app's responsibility, so the package stays free of `SharedPreferences`.

## 3. MDMS master

Schema code: `HCM-ADMIN-CONSOLE.TransformerConfigTemplate`
Filter: `{'project': <project referenceID>}`, identical to `FormConfigTemplate`.

```json
{
  "id": "<uuid>",
  "tenantId": "mz",
  "schemaCode": "HCM-ADMIN-CONSOLE.TransformerConfigTemplate",
  "uniqueIdentifier": "INVENTORY.TRANSFORMERS",
  "data": {
    "name": "INVENTORY",
    "version": 3,
    "configs": {
      "stockScanReceipt": {
        "fallbackModel": "StockModel",
        "models": {
          "StockModel": {
            "mappings": {
              "clientReferenceId": "__generate:uuid",
              "facilityId": "__context:userFacilityId",
              "quantity": "__context:quantity",
              "transactionType": "__context:transactionType",
              "additionalFields": {
                "sku": "__context:sku",
                "mrnNumber": "__context:mrnNumber"
              },
              "auditDetails": "__generate:audit"
            }
          }
        }
      }
    }
  }
}
```

`data.configs` is keyed exactly as the bundled map. Each value is a verbatim
copy of today's entry, so authoring is extraction rather than translation.

`data.name` groups configs per module so a campaign ships only what it
overrides. `data.version` is compared on fetch (§6).

## 4. Directive coverage

The schema is a passthrough — `FormEntityMapper` already interprets these at
runtime, so every supported scenario is covered by construction. Enumerated to
anchor the conformance fixtures:

| Scenario | Directive | Example |
|---|---|---|
| Direct mapping | plain path | `"memberCount": "householdDetails.memberCount"` |
| Nested form path | indexed path | `"latitude": "beneficiaryLocation.latLng[0]"` |
| Nested entity field | nested object | `"additionalFields": { ... }` |
| Generated value | `__generate:` | `uuid`, `audit`, `clientAudit`, `timestamp` |
| Literal | `__value:` | `__value:ACTIVE`, `__value:DATETIME.NOW` |
| Runtime context | `__context:` | `__context:projectId` |
| Cross-model reference | `__ref:` | `__ref:IndividualModel.clientReferenceId` |
| Conditional | `__switch:` | `__switch:type:{A:1,B:2}` |
| List handling | `list:` / `__listItem:` / `collect:` | `listMappings` block |
| Multi-entity | `fallbackModel`, `multiEntityField` | `beneficiaryRegistration` |

## 5. The Registry

```dart
// packages/digit_flow_builder/lib/data/transformer_config_registry.dart
class TransformerConfigRegistry {
  static final _instance = TransformerConfigRegistry._();
  factory TransformerConfigRegistry() => _instance;
  TransformerConfigRegistry._();

  Map<String, dynamic> _remote = const {};

  void setConfig(Map<String, dynamic> configs) => _remote = configs;
  void clear() => _remote = const {};

  /// Remote first, bundled second. Per-config, so a partially authored
  /// master cannot break flows it does not mention.
  dynamic get(String configName) => _remote[configName] ?? jsonConfig[configName];

  /// FormEntityMapper needs the whole map to resolve `__ref:` across configs,
  /// which during migration may span both layers.
  Map<String, dynamic> get merged => {...jsonConfig, ..._remote};

  bool isRemote(String configName) => _remote.containsKey(configName);
}
```

## 6. Fetch, validate, cache

In `ProjectBloc`, immediately after the existing `FormConfigTemplate` block:

```dart
// apps/health_campaign_field_worker_app/lib/blocs/project/project.dart
reportSyncProgress('transformerConfig');
final transformerConfigs = await mdmsRepository.searchMDMS(
  envConfig.variables.mdmsApiPath,
  tenantId: envConfig.variables.tenantId,
  schemaCode: '${ModuleEnums.hcmAdminConsole.toValue()}.'
      '${MasterEnums.transformerConfig.toValue()}',
  filters: {'project': event.model.referenceID},
);
for (final config in transformerConfigs) {
  await storeTransformerConfig(config);
}
```

`storeTransformerConfig` mirrors `storeSchema`, with three additions:

1. **Validate before replacing.** Every value under `data.configs` must be a map
   containing `models`; every `models` entry must contain `mappings`. A document
   failing this is rejected wholesale.
2. **Compare versions.** A document whose `data.version` is lower than the
   cached one is ignored, so a stale replica cannot roll a device back.
3. **Write only on success.** A malformed or truncated response leaves the
   previous last-known-good copy intact.

```dart
Future<void> storeTransformerConfig(dynamic doc) async {
  final data = doc['data'];
  final name = data?['name'];
  final configs = data?['configs'];
  if (name == null || configs is! Map) return;              // reject

  for (final entry in configs.values) {
    final models = (entry is Map) ? entry['models'] : null;
    if (models is! Map || models.isEmpty) return;           // reject
    for (final m in models.values) {
      if (m is! Map || m['mappings'] is! Map) return;       // reject
    }
  }

  final prefs = await SharedPreferences.getInstance();
  const key = 'app_transformer_configs';
  final existing = prefs.getString(key) != null
      ? json.decode(prefs.getString(key)!) as Map<String, dynamic>
      : <String, dynamic>{};

  final cachedVersion = existing[name]?['data']?['version'] as int? ?? -1;
  final incomingVersion = data['version'] as int? ?? 0;
  if (incomingVersion < cachedVersion) return;              // stale replica

  existing[name] = {'data': data};
  await prefs.setString(key, json.encode(existing));
}
```

## 7. Seeding at app start

The registry must be populated before any flow runs, including an offline cold
start. In the app entrypoint, alongside the existing `SharedPreferences` reads:

```dart
final raw = prefs.getString('app_transformer_configs');
if (raw != null) {
  final decoded = json.decode(raw) as Map<String, dynamic>;
  final merged = <String, dynamic>{};
  for (final entry in decoded.values) {
    final configs = (entry['data']?['configs'] as Map?) ?? const {};
    merged.addAll(Map<String, dynamic>.from(configs));
  }
  TransformerConfigRegistry().setConfig(merged);
}
```

Decoded once per app start, never per submit.

## 8. Executor changes

```dart
// transformer_executor.dart — before
final configData = jsonConfig[configName];
final formEntityMapper = FormEntityMapper(config: jsonConfig);

// after
final registry = TransformerConfigRegistry();
final configData = registry.get(configName);
final formEntityMapper = FormEntityMapper(config: registry.merged);
```

```dart
// reverse_transformer_executor.dart — before
final transformerConfig = jsonConfig[configName];

// after
final transformerConfig = TransformerConfigRegistry().get(configName);
```

The `import '../../data/transformer_config.dart'` in each executor is replaced
by the registry import. Three lines plus two imports; no other call site reads
the bundled map.

## 9. Resolution order

```
FETCH_TRANSFORMER_CONFIG (configName)
        |
        +-- _remote[configName]        MDMS, current project    --> use
        |
        +-- jsonConfig[configName]     bundled fallback         --> use
        |
        +-- neither                    error log + onError chain --> abort
```

Step 3 is new. Today a miss returns `contextData` unchanged and the action chain
continues to `CREATE_EVENT` with no entities.

## 10. Making failure loud

Prerequisite for the whole change, and independently valuable.

| Where | Condition | Behaviour |
|---|---|---|
| `TransformerExecutor` | config or `models` missing | Error log with `configName` + `isRemote`; dispatch `onError` |
| `ReverseTransformerExecutor` | config missing | Same |
| Post-mapping | required entity field resolved null | Error log with config name and source path |
| Sync log | after each fetch | Record resolved `data.version` per module |

New localization codes required:

- `TRANSFORMER_CONFIG_MISSING_ERROR`
- `TRANSFORMER_CONFIG_MAPPING_FAILED_ERROR`

## 11. Files

**New:**

- `packages/digit_flow_builder/lib/data/transformer_config_registry.dart`
- `docs/TRANSFORMER-CONFIG-HLD.md`
- `docs/TRANSFORMER-CONFIG-LLD.md`
- `packages/digit_flow_builder/test/transformer_config_fixtures/` (one payload +
  expected-entity pair per config)

**Changed:**

- `packages/digit_flow_builder/lib/action_handler/executors/transformer_executor.dart`
- `packages/digit_flow_builder/lib/action_handler/executors/reverse_transformer_executor.dart`
- `apps/health_campaign_field_worker_app/lib/blocs/project/project.dart`
- `apps/health_campaign_field_worker_app/lib/utils/constants.dart` (new master enum)
- app entrypoint (registry seeding)

**Frozen:**

- `packages/digit_flow_builder/lib/data/transformer_config.dart` — CI check
  asserting it is not edited, so changes are forced through MDMS.

## 12. Phasing

**Phase 0 — make the current failure visible.** Land §10 against the bundled
map. Confirm in the field that no existing flow is already silently dropping
fields. Without this, a migration bug looks identical to normal operation.

**Phase 1 — registry, bundled-only.** Add the registry, repoint both executors
and the mapper. Remote layer stays empty, so every `get()` falls through. Full
regression pass must be green; this is the backward-compatibility baseline.

**Phase 2 — fetch, validate, cache.** Add the master, the `ProjectBloc` fetch,
`storeTransformerConfig`, and app-start seeding. Author **one** low-risk module
first — `complaintRegistration` or `closeHouseholdRegistration`, both
single-model and low-volume.

**Phase 3 — migrate module by module.** Port the rest in dependency order,
leaving multi-entity configs (`beneficiaryRegistration`, `delivery`) last since
they exercise `__ref:` and `multiEntityField`. Diff against the fixture baseline
after each.

**Phase 4 — demonstrate the goal.** Change a form field and its mapping,
publish both, re-select the project on an unmodified APK, confirm the field
persists.

**Phase 5 — freeze the bundle.** Add the CI check. Do not delete the file;
first-run-offline depends on it.

## 13. Edge cases

- **Fresh install, no connectivity.** No cache exists; every lookup falls
  through to the bundled map. Current behaviour, preserved.
- **MDMS supplies a config name the bundle does not have.** Resolves from
  remote. Intended — this is how a new flow ships without an APK.
- **MDMS omits a config the bundle has.** Falls through to bundled. Intended
  during migration.
- **A remote config `__ref:`s a bundled one.** Works, because `merged` spans
  both layers. Intentional during migration; verify none remain before Phase 5.
- **Project switched mid-session.** `setConfig` replaces the whole remote layer
  on each project selection, so configs from the previous project cannot leak.
- **Two projects, same config name, different mappings.** Each fetch is filtered
  by referenceID, so the layer always reflects the selected project only.
- **Version absent on an incoming document.** Treated as `0`; a cached document
  with any explicit version wins.

## 14. Tests

**Registry**
- `get` returns remote when present, bundled when absent, null when neither.
- `merged` contains every bundled key plus remote overrides.
- `setConfig` fully replaces rather than merges into the previous layer.

**Validation**
- A document missing `models` on any config is rejected and the cache is unchanged.
- A document missing `mappings` on any model is rejected.
- A lower `data.version` than cached is ignored.
- A truncated / non-JSON response leaves the previous cache intact.

**Conformance (per config, 36 total)**
- Recorded form payload produces an entity set byte-identical to the bundled
  baseline, asserted field by field.
- Repeated with the config served from the remote layer.

**Executors**
- A missing config dispatches `onError` instead of returning `contextData`.
- A required field mapping to null is logged with config name and path.

**End-to-end**
- Form field added in `FormConfigTemplate` + mapping added in
  `TransformerConfigTemplate` → published → project re-selected on an unmodified
  APK → field persists.
- Airplane mode after a successful fetch → submit still produces correct entities
  from cache.
- Fresh install in airplane mode → submit produces correct entities from the bundle.

**Regression**
- Full existing suite green at Phase 1 with an empty remote layer.
- `beneficiaryRegistration` and `delivery` verified last, covering `__ref:` and
  `multiEntityField`.

**Performance**
- App start to home render, project selection total, and
  submit-to-acknowledgement on `beneficiaryRegistration`, measured before and
  after on a reference device.

## 15. Open questions

See HLD §19 for the product-level questions. One implementation question: should
`merged` be computed once on `setConfig` and cached, rather than rebuilt per
call? It is currently called once per `FETCH_TRANSFORMER_CONFIG`, so the rebuild
is cheap, but that assumption should be re-checked if `FormEntityMapper` ever
resolves `__ref:` lazily.
