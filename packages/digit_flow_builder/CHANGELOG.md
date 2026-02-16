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
