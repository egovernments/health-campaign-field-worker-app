# Checklist Package

The `checklist` package is a comprehensive solution for creating checklist.

## Features

- **Checklist Pages**: The package includes several pages like `checklist.dart`, `checklist_boundary_view.dart`, and `checklist_view.dart` that provide the user interface for creating checklist.

<img src="https://github.com/egovernments/health-campaign-field-worker-app/blob/checklist_shashwat/apps/health_campaign_field_worker_app/assets/checklist.dart.png?raw=true" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/blob/checklist_shashwat/apps/health_campaign_field_worker_app/assets/checklistboundary.png?raw=true" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/blob/checklist_shashwat/apps/health_campaign_field_worker_app/assets/checklistview.png?raw=true" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/blob/checklist_shashwat/apps/health_campaign_field_worker_app/assets/checklistPreview.png?raw=true" width="280" height="480">

- **Checklist Blocs**: It provides various BLoCs for state management using the BLoC pattern. These BLoCs handle the business logic for the checklist.
- **Checklist Models**: It defines various data models like `ServiceModel`, `ServiceDefinitionModel`, etc. used in the Checklist creation process.
- **Checklist Repositories**: The package provides abstract classes for data repositories, `ServiceDefinitionLocalRepository`, `ServiceLocalRepository`, `ServiceDefinitionRemoteRepository`, and `ServiceRemoteRepository` which can be extended to create repositories for different Service models. It also includes error handling with `InvalidApiResponseException`.

## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  checklist: ^any
```

## Usage

To Navigate to any screens of the package:

First add checklist_router to your main app router

Navigate to the required screen using the below code:

```dart
context.router.push(ChecklistWrapperRoute());
```

Checklist package requires below data to be passed from main app:

```dart
  String _projectId = '';
  String _projectName='';
  String _loggedInIndividualId = '';
  String _loggedInUserUuid = '';
  String _appVersion = '';
  String _tenantId = '';
  Object _roles;
  bool _isHealthFacilityWorker;
  BoundaryModel? _boundaryModel;
  PersistenceConfiguration _persistenceConfiguration;
```