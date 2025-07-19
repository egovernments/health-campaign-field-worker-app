# digit_forms_engine

A dynamic form rendering engine for Flutter, built on top of the `digit_ui_components` package. It allows you to define flexible, multi-page forms using a JSON schema. The engine renders fields and pages based on configuration, with automatic validation, navigation, and summary generation.

[![pub package](https://img.shields.io/pub/v/digit_forms_engine.svg)](https://pub.dev/packages/digit_forms_engine)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

---

## ✨ Features

- **JSON-driven multi-page forms** - Define complex forms using simple JSON schemas
- **Dynamic widget rendering** - Supports dropdowns, text fields, geolocation, checkboxes, radio buttons, and more
- **Built-in validation** - Field-level and page-level validation with custom rules
- **Navigation management** - Automatic page navigation with back/forward support
- **Form state management** - Powered by BLoC pattern for efficient state handling
- **Theming support** - Integrates seamlessly with `digit_ui_components` theming
- **Localization ready** - Built-in support for multi-language forms
- **Type-safe** - Full type safety with generated models
- **Memory efficient** - Optimized for large forms with many fields

---

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  digit_forms_engine: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Quick Start

### 1. Define Your Form Schema

```json
{
  "name": "USER_REGISTRATION",
  "version": 1,
  "pages": {
    "personalInfo": {
      "type": "object",
      "label": "Personal Information",
      "required": ["name", "email", "dateOfBirth"],
      "properties": {
        "name": {
          "type": "string",
          "label": "Full Name",
          "hint": "Enter your full name",
          "minLength": 2,
          "maxLength": 50
        },
        "email": {
          "type": "string",
          "label": "Email Address",
          "format": "email",
          "hint": "Enter your email address"
        },
        "dateOfBirth": {
          "type": "string",
          "format": "date",
          "label": "Date of Birth",
          "hint": "Select your date of birth"
        },
        "gender": {
          "type": "string",
          "label": "Gender",
          "format": "dropdown",
          "enums": ["Male", "Female", "Other", "Prefer not to say"]
        }
      }
    },
    "address": {
      "type": "object",
      "label": "Address Information",
      "properties": {
        "addressLine1": {
          "type": "string",
          "label": "Address Line 1"
        },
        "city": {
          "type": "string",
          "format": "locality",
          "label": "City"
        },
        "location": {
          "type": "string",
          "format": "latLng",
          "label": "Location"
        }
      }
    }
  }
}
```

### 2. Load and Display the Form

```dart
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormsBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('User Registration')),
        body: BlocBuilder<FormsBloc, FormsState>(
          builder: (context, state) {
            // Load the form schema
            if (state.cachedSchemas.isEmpty) {
              context.read<FormsBloc>().add(
                FormsEvent.load(schemas: [yourSchemaJson]),
              );
              return Center(child: CircularProgressIndicator());
            }

            // Get the first page
            final schema = state.cachedSchemas['USER_REGISTRATION'];
            final firstPage = schema.pages.keys.first;
            
            return FormsRenderPage(
              pageName: firstPage,
              currentSchemaKey: 'USER_REGISTRATION',
            );
          },
        ),
      ),
    );
  }
}
```

### 3. Handle Form Submission

```dart
BlocListener<FormsBloc, FormsState>(
  listener: (context, state) {
    if (state is FormsSubmittedState) {
      final formData = state.formData;
      
      // Process the submitted form data
      print('Form submitted: $formData');
      
      // Navigate to next screen or show success message
      Navigator.pushNamed(context, '/success');
    }
  },
  child: YourFormWidget(),
)
```

---

## 📚 API Reference

### Core Classes

#### `FormsBloc`
The main BLoC for managing form state and operations.

**Events:**
- `FormsEvent.load(schemas: List<String>)` - Load form schemas
- `FormsEvent.submit(schemaKey: String)` - Submit the form
- `FormsEvent.clearForm(schemaKey: String)` - Reset form to initial state
- `FormsEvent.updateField(schemaKey: String, key: String, value: dynamic)` - Update field value

**States:**
- `FormsState` - Default state with cached schemas
- `FormsSubmittedState` - Emitted when form is submitted

#### `FormsRenderPage`
The main widget for rendering forms.

**Parameters:**
- `pageName: String` - Name of the page to render
- `currentSchemaKey: String` - Key of the schema to use
- `isSummary: bool` - Whether to show summary view
- `isEdit: bool` - Whether in edit mode
- `defaultValues: Map<String, dynamic>?` - Default values for fields

### Field Types

The engine supports various field types through the `type` and `format` properties:

#### Basic Types
- `string` - Text input
- `integer` - Number input
- `boolean` - Checkbox

#### Format Types
- `dropdown` - Dropdown selection
- `radio` - Radio button group
- `date` - Date picker
- `latLng` - Location picker
- `locality` - Location search
- `scanner` - QR/Barcode scanner
- `dob` - Date of birth picker

### Validation

Fields support various validation rules:

```json
{
  "name": {
    "type": "string",
    "label": "Name",
    "minLength": 2,
    "maxLength": 50,
    "pattern": "^[a-zA-Z\\s]+$"
  },
  "age": {
    "type": "integer",
    "label": "Age",
    "minimum": 18,
    "maximum": 100
  }
}
```

---

## 🎨 Customization

### Custom Field Builders

You can create custom field builders by extending `JsonSchemaBuilder`:

```dart
class CustomFieldBuilder extends JsonSchemaBuilder<String> {
  const CustomFieldBuilder({
    required super.formControlName,
    required super.form,
    super.label,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      decoration: InputDecoration(labelText: label),
    );
  }
}
```

### Theming

The package integrates with `digit_ui_components` theming:

```dart
MaterialApp(
  theme: DigitTheme.light,
  home: YourFormPage(),
)
```

---

## 🧪 Testing

The package includes comprehensive testing utilities:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:digit_forms_engine/forms_engine.dart';

void main() {
  group('FormsBloc Tests', () {
    blocTest<FormsBloc, FormsState>(
      'emits loaded state when schema is loaded',
      build: () => FormsBloc(),
      act: (bloc) => bloc.add(FormsEvent.load(schemas: [testSchema])),
      expect: () => [isA<FormsState>()],
    );
  });
}
```

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Setup

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build` to generate code
4. Run tests with `flutter test`

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Built on top of [digit_ui_components](https://pub.dev/packages/digit_ui_components)
- Uses [reactive_forms](https://pub.dev/packages/reactive_forms) for form handling
- Powered by [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management



