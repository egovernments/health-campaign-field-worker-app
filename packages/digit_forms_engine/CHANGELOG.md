## 0.1.2

- Fix multi-select summary rendering: gate the dot-split on the `isMultiSelect` schema flag instead of a regex that only accepted purely alphabetic dot-joined tokens, so enum codes with underscores or digits (e.g. `MOB_VAN`, `HEALTH_WORKER`) now localize instead of being shown raw with dots. Remove the now-unused `isDotSeparatedKey` helper.

## 0.1.1

- Introduced the forms-engine package with schema-driven forms, MDMS schema fetch, and `BaseReactiveFieldWrapper` for auto-localized validation
- Added GS1 barcode scan support: edit, deserialization helpers, non-empty-field serializer, duplicate-scan check, viewer, and scan-limit fix
- Added multi-entity tab functionality mapping `_item_N_suffix` fields to base names; `ValueNotifier`-driven fit-or-scroll tab index
- Added dependent-field / features-config support, dynamic tab change on errors, validation toast naming invalid fields, hidden/readonly/isActive handling
- DOB validator with conditional values; min/max/length fallbacks; `DateFormat` regex check; alert-popup form submission; emoji blocker
- Fix checkbox fields sending `null` instead of `false`; scanner issues; dependency handling; prefix conflicts in multi-tab views; edit-flow beneficiary-ID restoration
- Added `preventScreenCapture` flag and `ScreenProtectionManager` for secure form pages; atomic localization cache swap; O(1) `translate()` lookups
- Added `navigationParams`, custom widgets (facility, productVariant), multi-select dropdown, referral custom component, forms-engine visibility support

## 0.1.0

- Added `navigationParams` on form control and JSON form schemas for richer inter-page data handoff
- Added conditional value support in DOB validator; corrected age validation
- Added hidden condition while building forms
- Added alert-popup support for form submission with customizable actions
- Added scanner spread and CDD identity QR payload handling in warehouse dispatch flow
- Guarded `form.control()` in `JsonSchemaScannerBuilder` against missing schema control
- Enhanced beneficiary ID handling in form control for edit mode; restore original ID number when switching identifierType back
- End-to-end boundary gate on both scanner sides

## 0.0.1

- Dynamic form rendering engine based on JSON schema
- Multi-page form support with automatic navigation
- Support for multiple field types: text, dropdown, date, latLng, locality, scanner, and more
- Validation support using reactive_forms
- Form state management using BLoC pattern
- Summary page generation
- Localization support
- Theming support via digit_ui_components
- Added mobile number format support for string type fields
- Fixed min and maxLength validation skipping for empty strings
- Added dependency field logic
- Integrated formula parser for conditional visibility and validation
- Fixed issue with multiple submit buttons
- Added support for multiple scanning
- Added validation for scanning
- Added dynamic validator resolver context

## 0.0.12-dev

- Added dynamic validator resolver context

## 0.0.11-dev

- Added support for multiple scanning
- Added validation for scanning

## 0.0.10-dev

- Fixed issue with multiple submit buttons

## 0.0.8-dev

- Added dependency field logic
- Integrated formula parser for conditional visibility and validation

## 0.0.4-dev

- Fixed min and maxLength validation skipping for empty strings

## 0.0.3-dev

- Added mobile number format support for string type fields

## 0.0.2-dev

- Dynamic form rendering engine based on JSON schema
- Multi-page form support with automatic navigation
- Support for multiple field types: text, dropdown, date, latLng, locality, scanner, and more
- Validation support using reactive_forms
- Form state management using BLoC pattern
- Summary page generation
- Localization support
- Theming support via digit_ui_components

## 0.0.1-dev

- Initial development release
