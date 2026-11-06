## 0.1.3

- `radio` fields now render `helpText`. `RadioList` has no `helpText` prop of its own, so the builder draws it under the options using the same style `DigitBaseFormInput` applies (bodyS, secondary text colour, truncated at 256 characters). An error suppresses it, matching how the components library replaces help text with the error rather than stacking both.
- Added the `multiSelectDropdown` field format: renders `MultiSelectDropDown` from the field's `enums` without the config also having to set `isMultiSelect: true`. Selections are stored dot-joined, and the summary page splits and localizes them like other multi-select fields. Composer fields declared as `"type": "array"` already fall back to `string`, so they pick this up.
- Location (`latLng`) capture rebuilt in the style of ODK Collect on the shared `Popup`: live accuracy, a Searching / Good / Fair / Low status chip, elapsed time, satellite count and a pulsing pin
- A reading at or below `accuracyThreshold` (default 5 m) is saved automatically with a "Location saved" toast; the 10 m fallback is gone. `unacceptableAccuracyThreshold` only adds a "fair" colour band; neither rule becomes a form validator
- New `popupTimer` property (`PopupTimer`: `enabled`, `minutes`, `seconds`; numbers or text). Once it runs out Save accepts any reading. Defaults to 30 s; `enabled: false` turns it off
- After 30 s without good accuracy the popup shows a hint chosen from accuracy and satellite count. Satellite count comes from the host on the `digit_forms_engine/gnss_satellites` `EventChannel`; hosts without it just don't show the line
- Closing the popup leaves the field empty, so a required field fails until captured. Recapture shows whenever there is no value or accuracy is above the threshold, and is hidden for read-only fields; a prefilled value is kept
- Fixed capture waiting forever on "Searching…" when a finished load returned the coordinates the bloc already held
- New `GpsWarmup`: shared, reference-counted high-accuracy GPS session that `FormsRenderPage` starts when the form has a `latLng` field, so the fix is already improving when the field is reached. It never requests permission. `location` is now a direct dependency
- New `notIn` validator: fails when the value matches a list or `navigation.*` entry (case- and space-insensitive). The scoped form `{from, scopeField}` checks per option of another field and re-validates when it changes (unique site names per type)
- Pages whose fields are all `hidden` are kept when a field sets `includeInForm` or `includeInSummary`; the form flow skips them, so a page can appear only on the summary
- Summary page: `includeInSummary: true` overrides `hidden`; empty fields are left out instead of showing `--`; boolean `checkbox` values show as read-only checkboxes; tighter card spacing
- Back on the summary page clears the form (`FormsClearFormEvent`) and returns to the opening screen, so the next entry starts empty
- A hidden `custom` field with `includeInForm: true` is built off screen (`Offstage`), so components that set their own value while building still send it
- `dob` picker: label above the card with the required asterisk; new `innerLabel` for the date input (falls back to `label`, then `CORE_COMMON_DOB`). A bare `{{name}}` in `minAge`/`maxAge` reads navigation params or a form control
- Selection card: deselecting the only option clears the value so the required error shows, instead of throwing and restoring the option
- Tests: `test/lat_lng_accuracy_test.dart` (accuracy levels, save rule, popup-timer parsing, hints, `GpsWarmup.schemaHasLocationField`) and a widget test for off-screen custom fields

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
