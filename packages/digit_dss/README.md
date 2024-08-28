# Digit DSS

DSS Dashboard for campaign management

## Features
* Dashboard Metric and Table Charts support


## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  digit_dss: ^any
```

## Usage
To Navigate to any screens of the package:

First add digit_dss_router to your main app router

Navigate to the required screen using the below code and pass the required data:

```dart
context.router.push(UserDashboardRoute(),);
```

Digit DSS package requires below data to be passed from main app:

```dart

String? _tenantId;
String? _projectId;
String? _actionPath;
String? _appVersion;
ProjectModel? _selectedProject;
DashboardConfigSchema? _dashboardConfig;
```

To set the required data use:

```dart
DashboardSingleton().setInitialData();
