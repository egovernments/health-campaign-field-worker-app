# Custom Widgets Guide

## What is BaseReactiveFieldWrapper?

A utility widget that automatically handles validation messages for form fields.

## What It Does

- Takes your field's `PropertySchema` as input
- Extracts all validation rules (required, notEqualTo, pattern, min, max, etc.)
- Builds localized error messages automatically
- Displays errors when validation fails

## How to Use It

**Step 1:** Find your field's schema from FormsBloc

```dart
final pages = context.read<FormsBloc>().state.cachedSchemas['MANAGESTOCK']?.pages;

PropertySchema? fieldSchema;
void findSchema(Map<String, PropertySchema> node) {
  for (final entry in node.entries) {
    if (entry.key == 'myFieldName') {
      fieldSchema = entry.value;
      return;
    }
    if (entry.value.properties != null) {
      findSchema(entry.value.properties!);
    }
  }
}
findSchema(pages);
```

**Step 2:** Use BaseReactiveFieldWrapper with the schema

```dart
return BaseReactiveFieldWrapper(
  formControlName: 'myFieldName',
  schema: fieldSchema,  // All validations handled automatically
  builder: (field) {
    return YourCustomWidget(
      errorMessage: field.errorText,  // Shows localized error message
      onChanged: (value) {
        field.control.value = value;
      },
    );
  },
);
```

That's it! All validations from your schema work automatically.

## Complete Example

```dart
class ProductSelectionCard extends LocalizedStatefulWidget {
  final dynamic stateData;
  final String pageSchema;

  @override
  Widget build(BuildContext context) {
    // 1. Find the schema
    final pages = context.read<FormsBloc>()
        .state.cachedSchemas[pageSchema]?.pages;

    PropertySchema? fieldSchema;
    void findSchema(Map<String, PropertySchema> node) {
      for (final entry in node.entries) {
        if (entry.key == 'productdetail') {
          fieldSchema = entry.value;
          return;
        }
        if (entry.value.properties != null) {
          findSchema(entry.value.properties!);
        }
      }
    }
    findSchema(pages);

    // 2. Use BaseReactiveFieldWrapper
    return BaseReactiveFieldWrapper(
      formControlName: 'productdetail',
      schema: fieldSchema,
      builder: (field) {
        return MultiSelectDropDown(
          errorMessage: field.errorText,
          onOptionSelected: (selectedValues) {
            field.control.value = selectedValues;
          },
        );
      },
    );
  }
}
```

## Supported Validation Types

These are automatically handled from your schema:
- `required`
- `minLength` / `maxLength`
- `min` / `max` / `minValue` / `maxValue`
- `pattern`
- `notEqualTo`

## Schema Configuration

Define validations in your JSON schema:

```json
{
  "fieldName": "facilityFromWhich",
  "validations": [
    {
      "type": "required",
      "value": true,
      "message": "Field is required"
    },
    {
      "type": "notEqualTo",
      "value": "warehouseDetails.facilityToWhich",
      "message": "Facility from and to must be different"
    }
  ]
}
```

Error messages are automatically localized and displayed.

## Key Points

- **Simple**: Just find the schema and pass it to `BaseReactiveFieldWrapper`
- **Automatic**: All validation types are handled automatically
- **No base classes**: Custom widgets extend `LocalizedStatefulWidget` directly
- **Reusable**: Use `pageSchema` parameter to work with different schemas

## Examples

For complete examples, see:
- **Validation wrapper**: `packages/digit_forms_engine/lib/widgets/base_reactive_field_wrapper.dart`
- **Product selection**: `apps/health_campaign_field_worker_app/lib/widgets/inventory/custom_product_selection_card.dart`
- **Facility dropdown**: `apps/health_campaign_field_worker_app/lib/widgets/inventory/custom_facility_widgets.dart`
