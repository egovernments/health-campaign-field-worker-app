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
