# Attendance Management Package

The `attendance_management` package is a comprehensive solution for managing attendance.

## Features


- **Attendance Pages**: The package includes several pages like `mark_attendance.dart`, `manage_attendance.dart`, and `session_select.dart` that provide the user interface for managing attendance.
- Improved attendance marking with scanner functionality for ease of marking attendance and verification
<img src="https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/dc86902d-de04-4f36-b972-825a301dd782" width="280" height="480">
<img src="https://github.com/user-attachments/assets/682b37cf-ecba-4d13-a9a7-9c0e53cc2181" width="280" height="480"/>
<img src="https://github.com/user-attachments/assets/9679e6b1-9524-41fa-8b60-19c913784f1e" width="280" height="480"/>
<img src="https://github.com/user-attachments/assets/96b12362-0b11-4281-b825-22d112c03f69" width="280" height="480"/>
<img src="https://github.com/user-attachments/assets/9728013e-1633-467b-8d24-81be8c5ffba2" width="280" height="480"/>
<img src="https://github.com/user-attachments/assets/af9f17ef-9583-4463-9731-f427e2a9e3e8" width="280" height="480"/>


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
