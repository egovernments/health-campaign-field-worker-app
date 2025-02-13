Complaints package helps people to file complaints , they can provide Complaint type , location and details about the Complaint.

## Features

- **Complaints Pages**: The package includes several pages like `complaints_type.dart`, `complaints_location.dart`, `complaints_details.dart` that provide the user interface for Filing Complaint.

![complaint1](https://github.com/user-attachments/assets/454be978-0d0b-4e12-866e-52006e9d972e)
![complaint2](https://github.com/user-attachments/assets/02433295-1cb8-49e9-af45-a21db8a495fd)
![complaint3](https://github.com/user-attachments/assets/868ac97b-6d4d-4431-a95c-1c526cfc933e)
![complaint4](https://github.com/user-attachments/assets/ad8df099-58a7-49f9-897f-8d7f89137b84)
![complaint5](https://github.com/user-attachments/assets/9bc9505a-8b50-420c-a133-f80e3190a59b)
![complaint6](https://github.com/user-attachments/assets/908ded66-ac66-4c9f-b036-da22541ca667)

<img src="https://github.com/egovernments/health-campaign-field-worker-app/blob/f9f84469dc18c2a7d9c62ad8726181fc8ea70080/packages/complaints/assets/Images/Complaints_Inbox.png" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/blob/f9f84469dc18c2a7d9c62ad8726181fc8ea70080/packages/complaints/assets/Images/Complaints_type.png" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/blob/f9f84469dc18c2a7d9c62ad8726181fc8ea70080/packages/complaints/assets/Images/Location_details.png" width="280" height="480">
<img src="https://github.com/egovernments/health-campaign-field-worker-app/blob/f9f84469dc18c2a7d9c62ad8726181fc8ea70080/packages/complaints/assets/Images/Complaint_details.png" width="280" height="480">


- **Complaints Blocs**: It provides various BLoCs Like `ComplaintsInboxBloc`,`ComplaintsRegistrationBloc` for state management using the BLoC pattern. These BLoCs handle the business logic for Filing Complaints.
- **Complaints Models**: It defines various data models like `PgrAddressModel`, `PgrComplaintModel`, `PgrServiceModel` etc. used in the attendance management process.
- **Complaints Repositories**: The package provides abstract classes for data repositories, `PgrServiceLocalRepository`, `PgrServiceRemoteRepository`, which can be extended to create repositories for different complaint models.


## Getting started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  complaints: ^any
```

## Usage


To Navigate to any screens of the package:

First add complaint_router to your main app router

Navigate to the required screen using the below code:

```dart
context.router.push(ComplaintsInboxWrapperRoute()),
```

Complaints package requires below data to be passed from main app:

```dart
    String? tenantId;
    String? loggedInUserUuid;
    String? userMobileNumber;
    String? loggedInUserName;
    List<String>? complaintTypes;
    String? userName;
```

