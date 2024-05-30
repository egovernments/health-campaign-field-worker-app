# Registration and Delivery

This package provides a way to register a household and individual members and deliver the resources to the registered households.

## Features

* Search existing households and individuals

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/907b124e-4be9-428f-ae70-121329d5e59c" width="280" height="480">

* Register new households and individuals.

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/253997cf-4954-4c76-827a-3979e623b3eb" width="280" height="480">

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/b32b8cf7-5bf1-420b-bc31-d5251fa9bb7e" width="280" height="480">

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/15fa6f1f-5553-4966-8e9b-a535b31c3c3d" width="280" height="480">

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/17a21101-e87a-4e42-bb66-092e55cfaeb9" width="280" height="480">

* Update details for existing households and individuals.
* Record service delivery of healthcare interventions to households and individuals for a single round campaign.
* Auto-calculation of resources to be delivered to a household or individuals based on the configured rule.

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/2b6e2364-ae91-4d1d-a86b-700e1d869f3f" width="280" height="480">

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/9f76f3d3-82f5-422c-baee-3c7b407c6389" width="280" height="480">

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/074e2b4a-5f28-43ad-8f14-ab85f0f8688d" width="280" height="480">

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