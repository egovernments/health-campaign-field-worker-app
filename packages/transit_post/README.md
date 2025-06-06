The Transit Post Package is a Flutter-based module designed to manage transit post selections, including scanning resources and tracking delivery count. It integrates with Bloc for state management and supports reactive forms for user inputs.

## Features

- **Transit Post Pages**: The package includes several pages like 'transit_post_selection.dart', 'transit_post_record_vaccination.dart', 'transit_post_acknowledgment.dart' and 'transit_post_wrapper.dart' to record resource delivery.

- **Transit Post Blocs**: It provides various Blocs for state management.
- **Transit Post Repositories**: The package provides abstract classes for data repositories, 'UserActionLocalRepository', 'UserActionRemoteRepository'.

## Getting Started

To use this package, add the following dependency to your 'pubspec.yaml' file:

```yaml
dependencies:
    transit_post: ^any
```

## Usage

To Navigate to any screens of the package:

First add transit_post_router to your main app router

Navigate to the required screen using the below code:

```dart
context.router.push(TransitPostWrapperRoute()),
```
Transit_post package requires below data to be passed from main app:

```dart
List<ProjectProductVariantModel>? _resources;
  List<String>? _transitPostType;
  String? _tenantId;
  String? _loggedInUserUuid;
  String? _projectId;
  BoundaryModel? _boundaryModel;
  int? _minAge;
  int? _maxAge;
```

Flow:

![transit_post_flow](https://github.com/user-attachments/assets/718919dd-a0b8-4aff-af72-15386031c11d)
