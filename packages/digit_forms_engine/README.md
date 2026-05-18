# DIGIT Forms Engine

A dynamic form rendering engine for Flutter that builds multi-page, configurable forms from JSON schema. It handles field rendering, validation, conditional visibility, auto-fill, navigation, and summary generation — all driven by configuration, no hardcoded UI.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  digit_forms_engine: ^0.0.2-dev
```

Then run:

```bash
flutter pub get
```

## Features

- Render multi-page forms from JSON schema
- Support for 14+ field types — text, dropdown, radio, checkbox, date, DOB, numeric, GPS coordinates, QR/barcode scanner, locality search, and more
- Built-in validation — required, min/max length, min/max value, regex pattern, cross-field comparison
- Conditional field visibility — show or hide fields based on formula expressions at runtime
- Auto-fill fields based on conditions (e.g., auto-calculate age from date of birth)
- Conditional navigation — route to different pages based on field values
- Multi-entity tab view — capture same fields for multiple selected entities
- Summary page generation with edit support
- Custom widget integration using `BaseReactiveFieldWrapper`
- QR code and GS1 barcode scanning with validation
- Screenshot protection on sensitive pages
- Multi-language localization support

## Getting Started

### 1. Define Your Form Schema

Forms are defined as JSON schemas. Each schema has a `name`, `version`, and a map of `pages`. Each page contains `properties` — the individual form fields.

```json
{
  "name": "USER_REGISTRATION",
  "version": 1,
  "summary": true,
  "pages": {
    "personalInfo": {
      "type": "object",
      "label": "Personal Information",
      "order": 1,
      "properties": {
        "name": {
          "type": "string",
          "format": "text",
          "label": "Full Name",
          "order": 1,
          "validations": [
            { "type": "required", "value": true, "message": "Name is required" },
            { "type": "minLength", "value": 2, "message": "Minimum 2 characters" }
          ]
        },
        "dateOfBirth": {
          "type": "string",
          "format": "dob",
          "label": "Date of Birth",
          "order": 2,
          "validations": [
            { "type": "required", "value": true }
          ]
        },
        "gender": {
          "type": "string",
          "format": "dropdown",
          "label": "Gender",
          "order": 3,
          "isMultiSelect": false,
          "enums": [
            { "code": "M", "name": "MALE" },
            { "code": "F", "name": "FEMALE" }
          ]
        },
        "location": {
          "type": "string",
          "format": "latLng",
          "label": "GPS Location",
          "order": 4
        }
      }
    }
  }
}
```

### 2. Load and Display the Form

```dart
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Provide the FormsBloc
BlocProvider(
  create: (context) => FormsBloc(),
  child: YourFormWidget(),
)

// Load the form schema (pass JSON string)
context.read<FormsBloc>().add(
  FormsEvent.load(schemas: [yourSchemaJsonString]),
);

// Render the form
FormsRenderPage(
  pageName: 'personalInfo',
  currentSchemaKey: 'USER_REGISTRATION',
)
```

### 3. Handle Form Submission

```dart
BlocListener<FormsBloc, FormsState>(
  listener: (context, state) {
    if (state is FormsSubmittedState) {
      final formData = state.formData;
      // formData is Map<String, Map<String, dynamic>>
      // { "personalInfo": { "name": "John", "gender": "M", ... } }
      print('Form submitted: $formData');
    }
  },
  child: YourFormWidget(),
)

// Trigger submission
context.read<FormsBloc>().add(
  FormsEvent.submit(schemaKey: 'USER_REGISTRATION'),
);
```

## Schema Configuration Keys

### SchemaObject (Top-Level)

| Key | Type | Required | Description |
|-----|------|----------|-------------|
| `name` | `String` | Yes | Unique form identifier |
| `version` | `int` | Yes | Schema version number |
| `summary` | `bool` | No | Show summary page before submission (default: false) |
| `pages` | `Map<String, PropertySchema>` | Yes | Map of page name to page configuration |
| `showAlertPopUp` | `Object` | No | Alert dialog configuration |
| `actionSchema` | `List` | No | Custom action buttons |

### PropertySchema (Page/Field Configuration)

| Key | Type | Required | Description |
|-----|------|----------|-------------|
| `type` | `String` | Yes | Data type: `object`, `string`, `integer`, `boolean`, `dynamic` |
| `format` | `String` | No | Field display format (see Supported Field Types below) |
| `label` | `String` | No | Field label (supports localization keys) |
| `order` | `double` | No | Display order within the page |
| `value` | `dynamic` | No | Default value |
| `hidden` | `bool` | No | Hide field from UI |
| `readOnly` | `bool` | No | Make field read-only |
| `hint` | `String` | No | Placeholder hint text |
| `helpText` | `String` | No | Help text displayed below field |
| `tooltip` | `String` | No | Tooltip text |
| `description` | `String` | No | Page heading / field description |
| `enums` | `List<Option>` | No | Options for dropdown/radio (each with `code` and `name`) |
| `isMultiSelect` | `bool` | No | Allow multiple selections for dropdowns |
| `validations` | `List<ValidationRule>` | No | Validation rules for the field |
| `properties` | `Map<String, PropertySchema>` | No | Nested fields (for `type: object`) |
| `includeInForm` | `bool` | No | Include hidden field value in form submission |
| `includeInSummary` | `bool` | No | Show field in summary page |
| `preventScreenCapture` | `bool` | No | Prevent screenshots on this page |
| `systemDate` | `bool` | No | Auto-set to current date |
| `charCount` | `bool` | No | Show character count |
| `startDate` | `String` | No | Minimum date for date pickers |
| `endDate` | `String` | No | Maximum date for date pickers |
| `prefixText` | `String` | No | Prefix text for input fields |
| `suffixText` | `String` | No | Suffix text for input fields |

### Conditional Visibility

Show or hide fields based on runtime conditions using `digit_formula_parser`:

```json
{
  "fieldName": "ageInMonths",
  "type": "integer",
  "format": "numeric",
  "visibilityCondition": {
    "expression": [
      { "condition": "calculateAgeInMonths(dateOfBirth) >= 0" }
    ]
  }
}
```

### Display Behavior

Show/hide fields based on whether other fields have values:

```json
{
  "displayBehavior": {
    "behavior": "show",
    "oneOf": ["dateOfBirth"],
    "allOf": ["firstName", "lastName"]
  }
}
```

| Key | Description |
|-----|-------------|
| `behavior` | `show` or `hide` |
| `oneOf` | Show if ANY of these fields have a value |
| `allOf` | Show if ALL of these fields have values |

### Auto-Fill Conditions

Automatically fill a field when a condition is met:

```json
{
  "autoFillCondition": [
    {
      "expression": "calculateAgeInMonths(dateOfBirth) >= 0",
      "value": "{calculateAgeInMonths(dateOfBirth)}"
    }
  ]
}
```

### Conditional Navigation

Navigate to different pages based on field values:

```json
{
  "conditionalNavigateTo": [
    {
      "condition": "productCount > 5",
      "navigateTo": {
        "type": "form",
        "name": "nextFormName"
      }
    }
  ]
}
```

## Supported Field Types

| Format | Type | Description |
|--------|------|-------------|
| `text` | string | Plain text input |
| `textArea` | string | Multi-line text input |
| `numeric` | string | Number input with min/max constraints |
| `dropdown` | string | Single or multi-select dropdown |
| `radio` | string | Radio button group |
| `checkbox` | boolean | Boolean checkbox |
| `date` | string | Date picker with range support |
| `dob` | string | Date of birth picker with age calculation |
| `mobileNumber` | string | Phone number with format validation |
| `latLng` | string | GPS coordinates (latitude, longitude, accuracy) |
| `locality` | string | Location search / autocomplete |
| `scanner` | string | QR code and GS1 barcode scanner |
| `idPopulator` | string | Auto-generated ID field |
| `custom` | any | Plug in any custom widget |

## Supported Validations

| Type | Value | Description |
|------|-------|-------------|
| `required` | `true` | Field must not be empty |
| `minLength` | `int` | Minimum string length |
| `maxLength` | `int` | Maximum string length |
| `min` / `minValue` | `int` | Minimum numeric value |
| `max` / `maxValue` | `int` | Maximum numeric value |
| `pattern` | `String` (regex) | Regex pattern matching |
| `notEqualTo` | `String` (field name) | Must not equal another field's value |
| `scanLimit` | `int` | Maximum number of QR/barcode scans |
| `isGS1` | `true` | Validate GS1 barcode format |

Validation messages support localization keys:

```json
{
  "validations": [
    {
      "type": "required",
      "value": true,
      "message": "REGISTRATION_NAME_REQUIRED_ERROR"
    }
  ]
}
```

## Custom Widget Integration

Use `BaseReactiveFieldWrapper` to plug in your own widgets:

```dart
BaseReactiveFieldWrapper(
  formControlName: 'myField',
  schema: fieldSchema,
  builder: (field) {
    return MyCustomWidget(
      errorMessage: field.errorText,
      onChanged: (value) {
        field.control.value = value;
      },
    );
  },
)
```

## FormsBloc Events

| Event | Description |
|-------|-------------|
| `FormsEvent.load(schemas)` | Parse and load JSON schemas |
| `FormsEvent.updateField(schemaKey, key, value)` | Update a single field value |
| `FormsEvent.update(schema, schemaKey)` | Replace entire schema |
| `FormsEvent.clearPage(schemaKey, pageKey)` | Clear all fields on a page |
| `FormsEvent.clearForm(schemaKey)` | Reset form to initial state |
| `FormsEvent.submit(schemaKey)` | Collect and submit form data |

## FormsBloc States

| State | Description |
|-------|-------------|
| `FormsState` | Default state with `cachedSchemas` map |
| `FormsSubmittedState` | Emitted on submission with `formData` |

## Core Exports

```dart
import 'package:digit_forms_engine/forms_engine.dart';

// Gives you access to:
// - FormsBloc, FormsEvent, FormsState, FormsSubmittedState
// - FormsRenderPage
// - PropertySchema, PropertySchemaType, PropertySchemaFormat
// - SchemaObject, SummaryItem, ActionSchema
// - ScreenProtectionManager
```
