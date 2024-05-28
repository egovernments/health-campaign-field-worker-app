# Registration and Delivery

This package provides a way to register a household and individual members and deliver the resources to the registered households.

## Features

* Register new households and individuals.
* Search existing households and individuals
* Update details for existing households and individuals.
* Record service delivery of healthcare interventions to households and individuals for a single round campaign.
* Auto-calculation of resources to be delivered to a household or individuals based on the configured rule.

## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  registration_delivery: ^any
```

## Usage

To Navigate to any screens of the package:

First add registration_delivery_router to your main app router

Navigate to the required screen using the below code and pass the required data:

```dart
context.router.push(SearchBeneficiaryRoute(),);
```

To Consume any bloc of the package in main app:

```dart
BlocProvider(create: (context) {return SearchBlocWrapper();},),
```

Registration Delivery package requires below data to be passed from main app:

```dart
RegistrationDeliveryListener? _registrationDeliveryListener;

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
List<String>? _deliveryCommentOptions;
List<String>? _symptomsTypes;
List<String>? _referralReasons;
```

To set the required data use:

```dart
RegistrationDeliverySingleton().setInitialData();
```