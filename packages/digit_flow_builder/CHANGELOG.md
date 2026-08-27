## 0.2.1

- Popup action chains survive an ancestor rebuild between build and tap: `ButtonWidget` snapshots `Navigator`, `CrudBloc`, and `DigitScannerBloc` in `buildResolved` and threads them through `resolved.executeActions` into `contextData['_preCaptured']`; `close_popup_executor`, `crud_executor`, and `navigation_executor` prefer the captured handles over the button's possibly-deactivated `BuildContext`, falling back to `context.read` / `Navigator.of` when absent so non-button action triggers behave unchanged
- `label_pair_list`: hide pairs with an empty or null value at the widget level; drop the JSON `hideIfNull` knob. Applies to static entries and `iterate`-generated items alike
- `tag`: auto-hide the tag when any `{{path}}` placeholder in the raw label resolves to null — configs no longer need per-tag `hidden` filters for grouped-list items with missing keys
- `entity_grouper`: emit real `null` for the `groupKey` of field-less entities instead of a synthesised `null_N` string so display configs and the new `tag` auto-hide can filter cleanly; unique buckets preserved so unrelated null-keyed rows aren't merged
- `table`: pass `withColumnDividers: true` to `DigitTable` — works around a header text-width miscalculation in `digit_ui_components` `table_header.dart` where the inner container adds an unaccounted 8 px right padding when column dividers are off, causing long headers to spill into the neighbouring column and read as visual overlap
- `getScreenKeyFromArgs` / `getInstanceIdFromArgs`: guard against a deactivated context; `ModalRoute.of` asserts on inactive elements, and callers already tolerate a null screenKey

## 0.2.0

- Search bar: clear sibling-branch filters when switching between conditional search modes (e.g. name vs ID); generic across any set of `searchName`s declared in the config, with a stale-value guard in `_dispatchSearch` and Map type-guards on sub-actions
- Rename the search-widget property `name` to `searchMode` for clarity when multiple modes coexist in one field
- Transformer executor: add `hierarchyType` to the context map (`DigitDataModelSingleton.hierarchyType`, falling back to `selectedProject.additionalDetails.hierarchyType`); wire `hierarchyType` into the `complaintRegistration` mapping so PGR create requests carry it
- Persist the proximity-search toggle across searches so it survives filter/state resets

## 0.1.1

- Introduced the flow-builder package: dynamic layout rendering, `FlowRegistry`, `FlowCrudBloc`, `state_wrapper_builder`, widget registry, navigation registry, singleton, and JSON-driven screen composition
- Attendance flow suite: mark-attendance card, QR scanner flow, signature capture/compare, session entry/exit time, missed-days popup, `AttendanceLogModel`, group-by-teams, `CustomDataExecutor`
- Stock less/excess and unable-to-deliver flows with recon calculations, indirect-delivery config, accept/reject flows, project-facility mapping, and duplicate-scanner checks
- Polio/SMC registration & delivery flows: redose, eligibility checks (age/height/weight/dose criteria), unique beneficiary ID pool loader, caregiver consent, computed field/dose/cycle resolution
- New widgets/executors: QR scanner, proximity search, multi-select dropdown, selection card, expandable widget, labeled toggle, panel/tag/table widgets with `@condition` cells, action popup, no-result card
- Core engine: multi-entity tabs, `contains`/`notContains`, nested-path field access, `notExists` wrapper filter, `matches` JSON substring operator, `groupByType` wrapper filters, function registry, navigation params, dependent-page logic, `preventScreenCapture` flag
- Numerous fixes across state clearing, filter application, transformer config, visibility conditions, edit-flow additional fields, scroll/pagination refresh, cache invalidation, and boundary-scoped searches

## 0.1.0

- Flow builder: apply `wrapperConfig` filters in `groupByType` mode; support nested-path field access and `notExists` wrapper filter
- OPEN_SCANNER: added `parseJson` option to spread structured QR payloads into `formData`; route `parseJson` failures to `onError`
- Stock scan: thread `batchNumber`, `expiryDate`, `comments`, and `waybillNumber` into RECEIVED; produce RECEIVED on Accept and dedup receive list
- Function/transformer registry expansions and config-driven eligibility/dose-criteria improvements
- Memoize `FlowRegistry.setConfig` on same list reference
- Tokenize `{{fn:..}}` arg list respecting quoted strings; make missing `{{fn:xxx}}` calls loud in debug builds
- Separate localization keys from dynamic interpolation args via `labelArgs`/`descriptionArgs`
- Pass `compositeKey` to header and footer `LayoutMapper.map()` calls
- Bulk PB creation on search OPEN; proximity-toggle and search-card config fixes
- Short-circuit `listView` on null `CrudStateData` instead of crashing; guard layout body `removeLast` against empty list
- Debounce config-driven buttons against async `onAction` re-entry (later reverted)
- End-to-end boundary gate on both scanner sides
- Fix eligibility check for height/weight; fix dose criteria evaluator on chained comparisons
- Remove debug logs from computed field/list evaluators and eligibility check

## 0.0.1

- Initial release
- JSON-driven dynamic UI rendering framework
- Two screen types: FORM (via digit_forms_engine) and TEMPLATE (via WidgetRegistry)
- 12 built-in action types: CREATE_EVENT, UPDATE_EVENT, SEARCH_EVENT, REFRESH_SEARCH, FETCH_TRANSFORMER_CONFIG, REVERSE_TRANSFORM, NAVIGATION, BACK_NAVIGATION, OPEN_SCANNER, SHOW_TOAST, CLEAR_STATE, CLOSE_POPUP
- 26+ built-in widgets for TEMPLATE screens
- FlowRegistry for registering and retrieving flow configs
- Conditional action execution using digit_formula_parser
- Template interpolation with `{{key}}` syntax
- Bidirectional pagination with scroll listeners
- Multi-instance state management via FlowCrudStateRegistry
- Custom widget registration support
- Screen capture protection
