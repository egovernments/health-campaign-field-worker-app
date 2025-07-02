ClosedHousehold helps health workers to mark a house hold closed after visiting and record the details like latitude and name of household head member.

## Features

* Create a closed household
* Update user actions like Resolved, Sprayed etc.

## Getting started
To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  closed_household: ^any
```

## Usage

To Navigate to any screens of the package:

First add closed_household_router to your main app router

Navigate to the required screen using the below code and pass the required data:

```dart
context.router.push(ClosedHouseholdDetailsRoute(),);
```

To Consume any bloc of the package in main app:

```dart
BlocProvider(create: (context) {return ClosedHouseholdBloc();},),
```

Closed Household package requires below data to be passed from main app:

```dart
String? _tenantId;
String? _loggedInUserUuid;
String? _projectId;
BoundaryModel? _boundaryModel;
PersistenceConfiguration? _persistenceConfiguration = PersistenceConfiguration
    .offlineFirst;
```

To set the required data use:

```dart
ClosedHouseholdSingleton().setInitialData();

