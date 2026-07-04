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
