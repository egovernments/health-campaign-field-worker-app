## 0.2.2

- New `appliedFilterChips` widget: shows a list's applied filters as removable chips; `onRemove` runs on delete
- New `WidgetReadinessRegistry` and screen-level `waitForWidget` (name or `{name, timeoutMs}`, default 3000 ms): `initActions` can wait for a sibling widget's init signal so the first search carries both sets of filters
- `ScreenBuilder`: pages with `initActions` start in `isLoading`, so the empty-state card no longer flashes before the first search
- `searchBar`: headless `proximity` block (`radius`, `searchName`, `filterKey`, `root`) takes one GPS fix, sends one `within` search and signals the readiness registry
- `proximitySearch`: an explicit `false` sticks while an unset value uses `defaultValue`; a default-on switch applies once GPS resolves. Adds `hideSwitch`, passes `root` through and supports `operation: withinOrUnlocated`
- `listView`: opt-in `showLoader` (spinner while loading with no items) and configurable `emptyChild`. `layout_renderer` shows its load-more and refresh loaders only when content is already on screen
- `menu_card`: optional `styling` block (`alignment`, `iconPosition: top`, `descriptionAlignment`, `iconSize`, `elevated`)
- `button`: optional `shadow: true`. `card`: `properties.padding` accepts a number, spacer token or per-side map
- `text`: renders the translated `label` when there is no `value`; adds `textStyle` (`color`, `fontSize`, `fontWeight`, `fontFamily`, `lineHeight`) and `textAlign`; `maxLines: 0` is unbounded
- `icon`: `properties.size` and theme `color`, plus fallback icons for keys `DigitIconMapping` lacks. `no_result_card`: `image` overrides the default illustration
- `action_popup`: `onCloseAction` runs on cross-tap; the dialog only skips its own pop when that list closes the popup itself
- Bare numeric values (counts, ids) are no longer localized, so a stale catalog row keyed on a digit can't blank a cell
- `interpolateWithCrudStates`: list path segments support `.length`, `.first`, `.last` and numeric indexes
- Entity type names are obfuscation-safe (`getEntityTypeName` instead of `runtimeType.toString()`), fixing `rootEntity` lookups in release builds
- Wrapper `entity_filter`: adds `contains` (case-insensitive, optional `minChars`), `notEquals`, `notIn`, and `{{key}}` `equals` values from widget data
- `computed_evaluator`: bare `from`/`field` paths are treated as templates and `EntityModel` items are converted to maps for reduce
- `search_executor`: a searchName's filter bucket is replaced instead of merged, so unrelated searches (e.g. name then QR scan) no longer AND together. `clear_state_executor` re-runs the search with the bucket's remaining filters, keeping `initActions` filters such as `tenantId`
- `crud_executor`: `awaitCreate: true` writes through `CrudService` and waits, for flows that leave the page and read the record back
- `toast_executor`: falls back to static localization and the pre-captured navigator when the context is gone, or skips the toast instead of breaking the action chain
- `DigitCrudService`: optional `repositoryOverride`; `FacilityModel` is routed to the facility repository
- `FlowBuilderSingleton`: `setActiveDeliveryMethod` narrows cycle deliveries to the active delivery method (raw copies kept); adds `hasDeliveryMethod`, `setParentBoundary`/`parentBoundary` and `setProjectId`. `activeDeliveryMethod` and `boundaryAndParentCodes` are exposed to the state context
- New `parentBoundaryCodeOf` helper; header and `administrativeArea` use `BoundaryModel.displayName`, so a new settlement shows its own name
- Transformer context adds `parentBoundaryCode`, `parentBoundaryName`, `selectedBoundaryName` and `selectedBoundaryHierarchyCode`
- Function registry: dose and eligibility helpers count only deliveries of the active delivery method; a `VACCINATED_ELSEWHERE` task in the current cycle means nothing left to deliver. Adds `countLocatedSites`, `siteNamesByType`, `getBoundaryAndParentOptions`, `wasAbsentOrRefusedForCurrentCycle` and `hasVaccinatedElsewhereForCurrentCycle`. Locality dropdown labels use the last segment of `address.locality.code`
- `transformJson` passes through `labelPlaceHolders` and `descriptionPlaceHolders`
- `transformer_config.dart`:
    - New `transitSite` / `clfSite` (a `FacilityModel` with usage `TRANSIT_POST` / `OUTSIDE_HOUSEHOLD_PLACES` plus a `ProjectFacilityModel`), `newSettlement` (`NEW_SETTLEMENT` user action) and `groupVacChild` / `groupVacReferral` (`action: OTHER`, tagged to the session via `resourceTag`)
    - `memberCount` uses `__default:2:householdDetails.memberCount`; task and address lat/lng come from `__context:householdLatLng`; ineligible and unable-to-deliver read location from their own pages (also fixes the `locationAccuracy` mapping)
    - Vaccinated elsewhere: task status `VACCINATED_ELSEWHERE`, adds `revisit`, `vaccinationLocation` / `vaccinationLocationOther`, drops `siteName` / `region`; redose tasks get `revisit: true`
    - PGR `locality.code` and `boundaryCode` use `selectedBoundaryHierarchyCode`
    - Polio vials configs gain `totalMixingSyringes`, `totalDiluentsIssued`, `unusedDiluentsReturned`, `spoiledDiluentsReturned`; explicit `fallbackModel` on 9 existing configs

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
