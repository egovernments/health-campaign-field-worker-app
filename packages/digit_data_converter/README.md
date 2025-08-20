# digit_data_converter

`digit_data_converter` is a powerful and flexible Dart package for transforming structured form data into Dart model objects. It is designed to handle deeply nested structures, dynamic values, and context-aware transformations.

---

## Features

- Supports field-to-model mapping
- Handles nested objects and lists
- Captures unmapped fields into a fallback model
- Injects context-aware values using `__context`
- Enables field referencing with `__ref`
- Implements conditional logic using `__switch`
- Dynamically generates fields such as UUIDs, client metadata, and audit logs

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  digit_data_converter: ^0.0.1-dev
  ````

### Install the dependency:

```yaml
flutter pub get
  ````

# Usage
```yaml
final transformer = FormDataTransformer(config);
final transformedModel = transformer.transform(formData, contextData);
  ````


## ⚙️ Configuration Guide

The transformation engine uses a JSON configuration to describe how form fields map to model fields.

---

### 🔁 Basic Mappings

```json
{
  "mappings": {
    "childCount": "houseDetails.childCount",
    "memberCount": "houseDetails.memberCount"
  }
}
```

---

### 🔁 Object Mappings

```json
{
  "mappings": {
    "address": {
      "id": "address.id",
      "doorNo": "address.doorNo",
      "latitude": "address.latitude",
      "longitude": "address.longitude"
    }
  }
}
```

---

### 🔁 List Mappings

```json
{
  "mappings": {
    "identifiers": "list:IdentifierModel"
  },
  "listMappings": {
    "IdentifierModel": {
      "mappings": {
        "id": "individual.id",
        "identifierType": "individualDetails.identifierType"
      }
    }
  }
}
```

---

### 🔁 Additional Fields Mappings

```json
{
  "mappings": {
    "additionalFields": {
      "childrenCount": "HouseHoldDetails.childrenCount",
      "pregnantWomenCount": "HouseHoldDetails.pregnantWomenCount"
    }
  }
}
```

---

### 🔁 Fallback for Unmapped Fields

```json
{
  "fallbackModel": "HouseholdModel"
}
```

### 🧠 Special Field Behaviors

You can use special syntax in the mapping configuration to control transformation behavior:

| Behavior                  | Description                                      |
|---------------------------|--------------------------------------------------|
| `__context:<key>`         | Injects a runtime context value                  |
| `__ref:<Model.field>`     | References a value from another model            |
| `__switch:<key>:<map>`    | Applies conditional mapping                      |
| `__generate:uuid`         | Auto-generates a UUID                            |
| `__generate:client`       | Injects client metadata                          |
| `__generate:audit`        | Populates audit fields (e.g., `createdBy`)       |
