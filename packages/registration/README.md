# Registration 

This package provides a way to register a household and individual members.

## Features

* Search existing households and individuals

<img src="https://github.com/user-attachments/assets/a9307190-5b29-4452-a9dc-e6d02418ce4d" width="280" height="480">

* Register new households and individuals.

<img src="https://github.com/user-attachments/assets/3bf5e8d5-c8f0-4a55-a2ae-67120d8ca089" width="280" height="480">

<img src="https://github.com/user-attachments/assets/1b86985d-92ef-403b-9062-f518e8e0df7f" width="280" height="480">

<img src="https://github.com/user-attachments/assets/3e6ea0a8-f5ce-42b5-a728-f3a32c79af45" width="280" height="480">

<img src="https://github.com/user-attachments/assets/17842b84-c51f-40e0-a853-f2639bcbcce2" width="280" height="480">

<img src="https://github.com/user-attachments/assets/7f9b64be-164b-4789-acab-9b43fc05d1bd" width="280" height="480">

<img src="https://github.com/user-attachments/assets/3eb87047-6671-40e2-aac7-a29cc229696e" width="280" height="480">

* Update details for existing households and individuals.

<img src="https://github.com/user-attachments/assets/17136189-184a-4a51-9b0c-ce7029255670" width="280" height="480">


## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  registration: ^any
```

## Usage

To Navigate to any screens of the package:

First add registration_router to your main app router

Navigate to the required screen using the below code and pass the required data:

```dart
context.router.push(SearchBeneficiaryRoute(),);
```

To Consume any bloc of the package in main app:

```dart
BlocProvider(create: (context) {return SearchBlocWrapper();},),
```

Registration package requires below data to be passed from main app:

```dart

String? _tenantId;
String? _loggedInUserUuid;

double? _maxRadius;
String? _projectId;
BeneficiaryType? _beneficiaryType;
ProjectTypeModel? _projectType;
ProjectModel? _selectedProject;
BoundaryModel? _boundaryModel;
PersistenceConfiguration? _persistenceConfiguration;
List<String>? _genderOptions;
List<String>? _idTypeOptions;
List<String>? _householdDeletionReasonOptions;
List<String>? _householdMemberDeletionReasonOptions;
List<String>? _searchHouseHoldFilter, _searchCLFFilters;
List<String>? _houseStructureTypes;


```

To set the required data use:

```dart
RegistrationSingleton().setInitialData();
```