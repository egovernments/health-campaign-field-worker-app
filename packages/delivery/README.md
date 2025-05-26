# Registration 

This package provides a way to deliver the resources to the registered household and individual members.

## Features

* Search existing households and individuals

<img src="https://github.com/user-attachments/assets/a9307190-5b29-4452-a9dc-e6d02418ce4d" width="280" height="480">


* Record service delivery of healthcare interventions to households and individuals for a  
  single round campaign.    
* Auto-calculation of resources to be delivered to a household or individuals based on the 
  configured rule.

<img src="https://github.com/user-attachments/assets/7a51e66f-bccf-492b-88b7-a2301b6f0600" width="280" height="480">

<img src="https://github.com/user-attachments/assets/06fd4e4b-822f-47bc-b53f-b39c4d3e0f54" width="280" height="480">

<img src="https://github.com/user-attachments/assets/d2992e52-8909-4c53-b13c-e4493999654e" width="280" height="480">

<img src="https://github.com/user-attachments/assets/d2992e52-8909-4c53-b13c-e4493999654e" width="280" height="480">

<img src="https://github.com/user-attachments/assets/2c8daae3-d087-41b8-81e8-619e698f37a4" width="280" height="480">

## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  delivery: ^any
```

## Usage

To Navigate to any screens of the package:

First add delivery_router to your main app router

Navigate to the required screen using the below code and pass the required data:

```dart
context.router.push(SearchBeneficiaryDeliveryRoute(),);
```

To Consume any bloc of the package in main app:

```dart
BlocProvider(create: (context) {return SearchBlocDeliveryWrapper();},),
```

Delivery package requires below data to be passed from main app:

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
List<String>? deliveryCommentOptions,
List<String>? symptomsTypes,
List<String>? referralReasons,
List<String>? refusalReasons,
UserModel? loggedInUser,


```

To set the required data use:

```dart
DeliverySingleton().setInitialData();
```
