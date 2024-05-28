# Attendance Management Package

The `attendance_management` package is a comprehensive solution for managing attendance.

## Features

- **Attendance Pages**: The package includes several pages like `mark_attendance.dart`, `manage_attendance.dart`, and `session_select.dart` that provide the user interface for managing attendance.

<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/dc86902d-de04-4f36-b972-825a301dd782" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/9cacba51-f6f4-4331-9a0c-e7cdfa9883d0" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/3e131131-9edf-4118-88ef-080d112d2c42" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/27f31af0-c6fc-46f3-8f5a-2aa9a9b5e300" width="280" height="480">

- **Attendance Blocs**: It provides various BLoCs for state management using the BLoC pattern. These BLoCs handle the business logic for the attendance management.
- **Attendance Models**: It defines various data models like `AttendanceRegisterModel`, `AttendanceLogModel`, etc. used in the attendance management process.
- **Attendance Repositories**: The package provides abstract classes for data repositories, `AttendanceRepository`, `RemoteAttendanceRepository`, and `LocalAttendanceRepository`, which can be extended to create repositories for different attendance models. It also includes error handling with `InvalidApiResponseException`.

## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  attendance_management: ^any
```

## Usage

To Navigate to any screens of the package:

First add attendance_router to your main app router

Navigate to the required screen using the below code:

```dart
context.router.push(ManageAttendanceRoute());
```

Attendance Management package requires below data to be passed from main app:

```dart
  String _projectId = '';
  String _loggedInIndividualId = '';
  String _loggedInUserUuid = '';
  String _appVersion = '';
  String _tenantId = '';
  PersistenceConfiguration _persistenceConfiguration;
```