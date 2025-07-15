# digit_forms_engine

`digit_forms_engine` is a dynamic form rendering engine for Flutter, built on top of the `digit_ui_components` package. It allows you to define flexible, multi-page forms using a JSON schema. The engine renders fields and pages based on configuration, with automatic validation, navigation, and summary generation.

---

## ✨ Features

- JSON-driven multi-page forms
- Dynamic rendering of widgets: dropdowns, text fields, geolocation, etc.
- Locality and LatLng field types supported
- Custom page-level and field-level configurations
- Validation and conditional logic support
- Theming via `digit_ui_components`
- Built-in form state management using `Bloc`

---

## Installation

```yaml
dependencies:
  digit_forms_engine: ^0.0.1-dev
  ````

### Install the dependency:

```yaml
flutter pub get
  ````

### 🧾 Configuration Example

```json
{
  "name": "ADDRESS_FLOW",
  "version": 1,
  "pages": {
    "beneficiaryLocation": {
      "type": "object",
      "label": "Beneficiary Location Screen",
      "properties": {
        "administrativeArea": {
          "type": "string",
          "format": "locality",
          "label": "Administrative Area *",
          "value": ""
        },
        "latlng": {
          "type": "string",
          "format": "latLng",
          "label": "Lat/Long *"
        },
        "addressLine1": {
          "type": "string",
          "label": "Address Line 1"
        },
        "addressLine2": {
          "type": "string",
          "label": "Address Line 2"
        },
        "landmark": {
          "type": "string",
          "label": "Land Mark"
        },
        "pinCode": {
          "type": "string",
          "label": "PostalCode"
        }
      }
    }
  }
}
````

### 🛠️ Usage

#### Load a form:

```dart
final schema = jsonEncode(yourSchemaMap);
context.read<FormsBloc>().add(FormsEvent.load(schemas: [schema]));
```

#### Clear a form:
```dart
context.read<FormsBloc>().add(
const FormsEvent.clearForm(schemaKey: 'ADDRESS_FLOW'),
);
```

#### Listen for submission state:
```dart
BlocListener<FormsBloc, FormsState>(
listener: (context, formState) {
if (formState is FormsSubmittedState) {
final formData = formState.formData;
if (formData.isEmpty) return;

// Use submitted formData here
}
},
);
```

### 🧩 Schema Concepts

- **`pages`**: A map of page names to their config
- **`properties`**: A map of field names to their configuration

#### Field Types
- `string`
- `integer`
- etc.

#### Format Options
- `dropdown`
- `locality`
- `latLng`
- `text`
- etc.



