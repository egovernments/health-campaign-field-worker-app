📦 Health Campaign Management V1.6 - Field Worker's App
====================================================



✨ Overview
--------

The Health Campaign Management (HCM) [latest version](https://github.com/egovernments/health-campaign-field-worker-app/tags) field worker's app is part of the DIGIT Health Platform. It empowers frontline teams to manage health campaigns efficiently, even in low or no network coverage areas. With its offline-first functionality and configurable design, the app is built to address the unique needs of field workers, ensuring seamless data collection, beneficiary management, and campaign tracking.

--------

✨ Key Features
------------

-   **Offline Mode**: Perform all tasks without active internet connectivity.

-   **Four New Modules**: Enable efficient task execution for frontline workers.

-   **Configurable Design**: Adaptable to various campaign needs through server-based configurations.

-   **Multi-Round Campaign Support**: Manage multiple campaign cycles with eligibility checks, delivery tracking, and side-effect recording.

-   **Sync Mechanism**: Bidirectional sync (up and down) ensures consistent data between the app and server.

-   **Beneficiary Data Management**: Optimized retrieval and duplication prevention for beneficiary records.

-   **Permission-Based Access**: Data sync tailored to user roles and assigned projects.

--------

✨ Architecture
------------

The high-level architecture of the app is divided into three core parts:

1.  **Frontend**: Built using Flutter for a multi-platform, user-friendly experience.

2.  **Backend Services**: Syncs with MDMS, localisation, and other backend services.

3.  **Database**: Combines SQLite and ISAR for flexible offline data storage.

--------

✨ Tech Stack/Core Dependencies
----------------------------

-   **Flutter**: Framework to build multi-platform apps.

-   **SQLite**: SQL offline database for structured data.

-   **ISAR**: NoSQL offline database for high-performance storage.

-   **Dio**: HTTP client for network communication.

--------

✨ Design Considerations
---------------------



###  ✅ General Considerations

-   Works seamlessly in low/no network coverage areas.

-   Highly configurable, with settings managed through MDMS.

-   Designed for Android devices, ensuring compatibility with users who have low-tech literacy.



###  ✅ Sync Mechanism

-   **Sync Down**: Fetch configurations and data from the server (e.g., localisation, master data).

-   **Sync Up**: Upload collected data to the server.

-   **Login & Sync**: Syncing can only occur while the user is online.



###  ✅ Configurability

Key configurations include:

-   Offline-first or online-only mode.

-   Backend service URLs and endpoints (no app rebuild required for updates).

-   Data refresh intervals for previously fetched configurations.

-   Supported languages and localisation data.



###  ✅ Operational Log (Op Log)

All offline actions are logged and processed during sync-up to ensure data consistency and integrity.



###  ✅ Network Manager

A network manager component abstracts the online/offline logic, enabling seamless data handling by other app components.

--------

✨ Modules and Features
--------------------



###  ✅ Down Sync of Beneficiaries

Ensures the local device database is updated with the latest beneficiary data while preventing duplicate records.

**Key Features:**

-   Uses offset and limit for efficient pagination.

-   Adapts batch size based on internet speed.

-   Essential for reducing redundancy within the same boundary.

**Use Case:**

-   Particularly useful in multi-user scenarios where teams operate in the same geographical boundary.



###  ✅ Multi-Round Campaigns

Supports tracking and delivery processes across multiple cycles.

**Key Features:**

-   Fetches configurations dynamically from MDMS.

-   Checks eligibility criteria based on age and project configurations.

-   Tracks delivery status, side effects, and referrals.

-   Resets statuses (e.g., Beneficiary Refused) for each new cycle.

**Delivery Status Tracking:**

-   **Not Eligible**: Fails age or cycle eligibility criteria.

-   **Beneficiary Refused**: User declined the delivery.

-   **Beneficiary Referred**: Referred to a health facility.

-   **Visited**: Delivery successfully completed.

-   **Not Visited**: Delivery not completed.



* * * * *



📦 Packages
====================



As a part of the release, we have extracted the features of the Frontline Worker's App as individual packages:

1.  [**Registration & Delivery Package**](#registration-delivery)

2.  [**Referral Reconciliation Package**](#referral-reconciliation)

3.  [**Inventory Management Package**](#inventory-management)

4.  [**Attendance Management Package**](#attendance-management)

5.  [**Closed Household Package**](#closed-household)

6.  [**DIGIT Scanner Package**](#digit-scanner)

7.  [**DIGIT Showcase Package**](#digit-showcase)

8.  [**Digit Data Model Package**](#digit-data-model)

9.  [**DIGIT DSS Package**](#digit-dss)

10. [**Complaints Package**](#complaints)

11. [**Survey Form Package**](#survey-form)

12. [**Sync Service Package**](#sync-service)

These are the packages which are created for this.



* * * * *



Getting Started (Generalized for All Packages)
====================

To get started with any package, follow these steps:

### **Step 1: Add Dependencies**

Add the following dependencies in your **pubspec.yaml** file:

```
dependencies:
  <package_name>: ^latest_version
```

### **Step 2: Run the Import Script**

To integrate this package with the HCM Application, locate the main function for integration in the respective tool's import file. For example, `health-campaign-field-worker-app/tools/<package_name>_imports.dart`.

```
health-campaign-field-worker-app/tools/<package_name>_imports.dart
```

This will automatically handle:\
✅ Imports\
✅ Mapper initializers\
✅ Route configuration\
✅ Initial data setup\
✅ Repository initialization


### **Step 3: Run Build Runner**

Ensure you are in the correct project directory:

```
apps/health_campaign_field_worker_app
```

Run the following command:

```
dart run build_runner build --delete-conflicting-outputs
```

This will add the package route to **router.gr.dart**.


### **Step 4: Install the Application**

After running the build command, install the application on your device to have the module integrated with your base app.


### **Step 5: Sync Data**

To ensure proper data synchronization, follow any additional steps for down-syncing or up-syncing based on your use case.

By following these general steps, you can successfully integrate and use any of the packages within your application.



* * * * *


<a name="closed-household"></a>
🏚️ **Closed Household Package**
====================

The **Closed Household** package is a new module built as a Flutter package (`closed_household`). It will be a dependency for the **Registration and Delivery** package.


### Link to the Pub Package:

-   [closed_household | Flutter package](https://pub.dev/packages/closed_household)



🎭 Role
-------

👤 **Distributor**



✨ Features
----------

-   **Create a Closed Household**: Enables creating a closed household record.


-   **Update Task**: Updates the task if a closed household is registered.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### Sequence Diagram


![closed_household](https://github.com/user-attachments/assets/00af8e4c-ec07-4843-a573-fd01f090584d)


* * * * *


<a name="registration-delivery"></a>
📝 **Registration & Delivery Package**
====================

This package provides a way to register a household and individual members and deliver the resources to the registered households.


To learn more about Registration and Delivery, click here.



### Link to the Pub Package:

-   registration_delivery | Flutter package



🎭 Role
-------

👤 **DISTRIBUTOR**



✨ Features
----------

-   **Register new households and individuals**: Register new records for households and individuals.


-   **Search existing households and individuals**: Easily search for already registered records.


-   **Update existing records**: Modify details for existing households and individuals.


-   **Record service delivery**: Track healthcare interventions delivered to households and individuals for a single-round campaign.


-   **Auto-calculation of resources**: Automatically calculate resources to be delivered to a household or individual based on the configured rules.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### **✨ Downsyncing Data During Boundary Selection**

If you need to **downsync registration-delivery data** during boundary selection, modify **project_beneficiaries_downsync.dart** by including the following repositories:

```
final LocalRepository<HouseholdModel, HouseholdSearchModel> householdLocalRepository;
final LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel> householdMemberLocalRepository;
final LocalRepository<ProjectBeneficiaryModel, ProjectBeneficiarySearchModel> projectBeneficiaryLocalRepository;
final LocalRepository<TaskModel, TaskSearchModel> taskLocalRepository;
final LocalRepository<SideEffectModel, SideEffectSearchModel> sideEffectLocalRepository;
final LocalRepository<ReferralModel, ReferralSearchModel> referralLocalRepository;
```

Next, locate the method:

```
networkManager.writeToEntityDb
```

Ensure it includes the repositories:

```
householdLocalRepository,
householdMemberLocalRepository,
projectBeneficiaryLocalRepository,
taskLocalRepository,
sideEffectLocalRepository,
referralLocalRepository,
```

**These changes will enable the down sync of registration & delivery data.**

* * * * *

### **✨ Registries Update**

When users **downsync data** by passing **project ID & boundary code**, the server returns responses **only for the selected boundary**.



#### **✅ Response Entities:**

-   **Household**

-   **Individual**

-   **House Member**



#### **Scenarios**

1️⃣ **Updating project-specific data**\
2️⃣ **Creating new project-specific data**

-   **Beneficiary (Mandatory)**

-   **Task & related entities (Optional)**

* * * * *

### **✨ Filtering Mechanism**

To enable better data access, we introduce **filters**:

-   **Registered**

-   **Unregistered**

-   **Closed**

-   **Combination of Filters**

-   **Proximity Enabled Search**

-   **Search by Name**

A **query builder** is used to fetch results dynamically (example below for an individual-based project).


![registration1](https://github.com/user-attachments/assets/0811967a-19fd-4e8c-bfa0-9e55dba84f3f)


* * * * *

### **✨ Fields in Registration Flow**

#### **✅ GPS Accuracy**

-   Captured on the **Household Location** screen.



#### **✅ Pregnant Women & Children Count**

-   Entered on the **Member Screen**.

-   Stored in the **Additional Fields Object** of the **Household Member entity**.



#### **✅ Household Structure Selection**

-   A new screen has been added to **capture household structure**.

-   Structure data is fetched from **MDMS** and displayed as a **card selection UI**.

-   The selected value is stored in the **Additional Details Object** in the **Household Entity**.

* * * * *

### **✨ Closed House Data Capture**

-   A **new module** named **closed_household** has been built.

-   This will be a **dependency** of the **registration and delivery package**.

* * * * *

### **✨ Handling Unsuccessful Deliveries**

For **household-based flows**, a feature has been introduced to **capture reasons for unsuccessful deliveries**.

* * * * *

### **✨ Final Steps**

Once all the above modifications are implemented, rerun:

```
dart run build_runner build --delete-conflicting-outputs
```

This ensures proper integration of **Registration & Delivery** within the **HCM app**.



### Sequence Diagram


![registration4_sequence](https://github.com/user-attachments/assets/80596e68-1cc5-4caf-b0e5-f37bf11c1142)

![registration5_sequence png](https://github.com/user-attachments/assets/f9e76ba5-015f-4c7d-8afc-1b1de600b794)


* * * * *


<a name="inventory-management"></a>
📦 **Inventory Management Package**
====================

This package enables the user to manage the stocks of a health campaign. The user can record the stocks received, issued, returned, damaged, and lost.


To learn more about Inventory Management, click here.



### Link to the Pub Package:

-   inventory_management | Flutter package



🎭 Role
-------

👤 **DISTRIBUTOR**
👤 **WAREHOUSE_MANAGER**



✨ Features
----------

-   **Manage Stocks**: Record the receipt, issue, return, damage, and loss of stocks.
-   **Stock Reconciliation**: Reconcile the stock data.
-   **View Reports**: View the reports of the stocks.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### Sequence Diagram


![Inventory](https://github.com/user-attachments/assets/a7f26405-2af5-4148-8ca7-d8ed5bf1a92d)


* * * * *


<a name="referral-reconciliation"></a>
🔄 **Referral Reconciliation Package**
====================

This module will enable the health facility supervisors to track referrals made by on-field health workers to different health facilities digitally via the **Digit HCM app**.


To learn more about Referral Reconciliation, click here.



### Link to the Pub Package:

-   referral_reconciliation | Flutter package



🎭 Role
-------

👤 **HEALTH_FACILITY_WORKER**



✨ Features
----------

-   **Track referrals made by on-field health workers**: Enables tracking of all referrals to various health facilities.


-   **Capture beneficiary referral details**: Includes the reason for referrals, diagnosis, and any further applicable details.


-   **Detailed record keeping**: Ensures all referral cases are documented digitally for better monitoring.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### Sequence Diagram


![referral_reconcilation](https://github.com/user-attachments/assets/3165fccf-3b62-41ca-a8ca-0dbb875f2a59)


* * * * *


<a name="attendance-management"></a>
🕒 **Attendance Management Package**
====================

The **Attendance Management package** is a comprehensive solution for tracking and managing attendance within the **Digit HCM app**.



### **To learn more about Attendance Management, click here.**



### **Link to the Pub Package:**

-   attendance_management | Flutter package



🎭 Role
-------

👤 **SUPERVISOR**



✨ Features
----------

-   **Attendance Pages**:\
    The package includes several UI pages for attendance management:

    -   **mark_attendance.dart** -- Allows users to mark attendance.

    -   **manage_attendance.dart** -- Provides an interface for managing and updating attendance records.

    -   **session_select.dart** -- Enables users to select attendance sessions conveniently.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### **✅ Fetch Attendance Registers & Attendee Data**

Navigate to the **Project Bloc**, where attendance data should be fetched after login.

Add the following repositories:

```
final RemoteRepository<AttendanceRegisterModel, AttendanceRegisterSearchModel>
  attendanceRemoteRepository;

final LocalRepository<AttendanceRegisterModel, AttendanceRegisterSearchModel>
  attendanceLocalRepository;

final LocalRepository<AttendanceLogModel, AttendanceLogSearchModel>
  attendanceLogLocalRepository;

final RemoteRepository<AttendanceLogModel, AttendanceLogSearchModel>
  attendanceLogRemoteRepository;
```

* * * * *

### **✅ Fetch Attendance Data Based on User Role**

Find the section where **project staff search** is handled.\
Modify the **try-catch block** to fetch attendance data based on role:

```
if (context.loggedInUserRoles
        .where(
          (role) => role.code == RolesType.districtSupervisor.toValue(),
        )
        .toList()
        .isNotEmpty) {
      final individual = await individualRemoteRepository.search(
        IndividualSearchModel(
          userUuid: [projectStaff.userId.toString()],
        ),
      );
      final attendanceRegisters = await attendanceRemoteRepository.search(
        AttendanceRegisterSearchModel(
          staffId: individual.first.id,
          referenceId: projectStaff.projectId,
        ),
      );
      await attendanceLocalRepository.bulkCreate(attendanceRegisters);

      for (final register in attendanceRegisters) {
        if (register.attendees != null &&
            (register.attendees ?? []).isNotEmpty) {
          try {
            final individuals = await individualRemoteRepository.search(
              IndividualSearchModel(
                id: register.attendees!
                    .map((e) => e.individualId!)
                    .toList(),
              ),
            );
            await individualLocalRepository.bulkCreate(individuals);
            final logs = await attendanceLogRemoteRepository.search(
              AttendanceLogSearchModel(
                registerId: register.id,
              ),
            );
            await attendanceLogLocalRepository.bulkCreate(logs);
          } catch (_) {
            emit(state.copyWith(
              loading: false,
              syncError: ProjectSyncErrorType.project,
            ));

            return;
          }
        }
      }
    }
```

* * * * *

### **✅ Run Build Runner Again**

Ensure you are still in:

```
apps/health_campaign_field_worker_app
```

Then, run the build runner command again:

```
dart run build_runner build --delete-conflicting-outputs
```

This will ensure the package route is properly integrated into **router.gr.dart**.



### Sequence Diagram


![attendance](https://github.com/user-attachments/assets/fb278b1d-9877-43a3-a2d5-551bae2db4e4)


* * * * *


<a name="digit-data-model"></a>
🔢 Digit Data Model Package
====================

The `digit_data_model` package is a comprehensive data modeling library for the project. It defines various **classes, enums, and functions** used throughout the project. The package is written in **Dart** and is primarily used in **Flutter applications**.



✨ Features
----------

-   **Data Models** -- Provides predefined models like `DataModel`, `EntityModel`, `EntitySearchModel`, `AdditionalFields`, `AuditDetails`, etc.

-   **Model Provider** -- Includes a `ModelProvider` abstract class and a `ModelProviderRegistry` to register and retrieve models.

-   **Data Model Type Enum** -- Defines a `DataModelType` enum representing different model types.

-   **Mapping Annotations** -- Uses `dart_mappable` for generating mapping code, enabling **JSON serialization/deserialization**.

-   **Data Repositories** -- Provides `DataRepository`, `RemoteRepository`, and `LocalRepository` for handling data operations.

-   **SQL Store** -- Uses `Drift` for SQLite database integration with **reactive persistence**.

-   **Schema Versioning** -- Supports **database migrations** through schema versioning.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)


Below are some examples of how you can use this package:



📖 Examples
-----------

### ✅ Creating a Custom Search Model

```
class ExampleSearchModel extends EntitySearchModel {
  ExampleSearchModel({
    required this.employeeId,
    required this.attendanceDate,
    required this.status,
  });
}
```


### ✅ Creating Additional Fields

```
class ExampleAdditionalFields extends AdditionalFields {
  ExampleAdditionalFields({
    required this.field1,
    required this.field2,
  });
}
```


### ✅ Implementing a Local Repository

```
class ExampleLocalRepository
    extends LocalRepository<ExampleModel, ExampleSearchModel> {
  ExampleLocalRepository(super.sql, super.opLogManager);
}
```


### ✅ Implementing a Remote Repository

```
class ExampleRemoteRepository
    extends RemoteRepository<ExampleModel, ExampleSearchModel> {
  ExampleRemoteRepository(super.apiClient, super.opLogManager);
}
```


* * * * *

<a name="digit-dss"></a>
📊 DIGIT DSS Package
====================


**Digit_dss** is a Flutter package designed to facilitate the seamless integration of dynamic dashboards into your mobile application. This package allows developers to configure and render various types of charts directly from a dashboard configuration, enabling a flexible and customizable approach to data visualization.

✨ Features
----------

-  Dynamic charts configuration\
-  Support for **Metric Charts**\
-  Support for **Table Charts**

🎭 Role
-------

👤 **DISTRICT_SUPERVISOR**


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### Sequence Diagram


![Digit_dss](https://github.com/user-attachments/assets/d2a14ab2-19b7-4023-a5e5-aecd6c75d3ab)


* * * * *


<a name="complaints"></a>
📢 Complaints Package
=====================


The **Complaints Package** provides a streamlined way for users to register complaints related to **health campaigns**. It enables users to:\
✔️ File complaints specifying the type and detailed information\
✔️ Choose from predefined categories to classify complaints\
✔️ Access past complaint records

🎭 Role
-------

👤 **DISTRIBUTOR**

✨ Features
----------

-   📝 **Register complaints** easily

-   📜 **Access past complaint records** for tracking

-   📂 **Choose from predefined categories** to classify complaints


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)


### Sequence Diagram


![complaints](https://github.com/user-attachments/assets/8bc35c49-700c-42da-b317-d2ab0c47cd0d)


* * * * *


<a name="survey-form"></a>
📝 Survey Form Package
======================


The **Survey Form Package** enables users to fill out **questionnaires** efficiently. It provides a user-friendly interface for submitting responses, ensuring that **health campaign-related feedback** and data are collected **accurately**.

🎭 Role
-------

👤 **DISTRIBUTOR**

✨ Features
----------

✔️ **Selection Box, Check-Box, and Text Fields** to support various data types\
✔️ **Accurately captures employee-specific boundaries** for relevant survey responses\
✔️ **Allows employees to view their submitted responses**


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)


### Sequence Diagram


![survey](https://github.com/user-attachments/assets/d5815a0e-7fe1-405c-920e-845c818d0d7b)


* * * * *


<a name="sync-service"></a>
🔄 Sync Service Package
=======================


The **Sync Service Package** provides access to **sync-related configurations and listeners**, ensuring seamless data synchronization. It includes key components such as **SyncEntityMapperListener, syncDownRetryCount, and persistenceConfiguration**.

✨ Features
----------

✔️ **SyncBloc:** Handles refresh and sync operations\
✔️ **SyncEntityMapperListener:** Defines methods for sync entity mapping\
✔️ **SyncService:** Performs sync operations like `performSync`, `writeToEntityDB`, and `getPendingSyncRecordsCount`\
✔️ **Repositories:** Manages local and remote repositories with `getRemoteForType` and `getLocalForType`\
✔️ **Sync Operations:** `PerformSyncDown` and `PerformSyncUp` for bidirectional sync\
✔️ **Models:** Bandwidth Model


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)

### 🛠 Usage

#### 1️⃣ Extend the `SyncUpOperation` class and implement the required methods:

```
class CustomSyncRegistry implements SyncUpOperation {
  CustomSyncRegistry({this.remote});
}
```

#### 2️⃣ Extend the `SyncEntityMapperListener` class and implement the required methods:

```
class SyncServiceMapper extends SyncEntityMapperListener {
  // Implement required methods
}
```


* * * * *


<a name="digit-scanner"></a>
🔍 DIGIT Scanner Package
========================


The **DIGIT Scanner Package** is used for scanning **QR codes** and **GS1 barcodes** in Flutter applications.

✨ Features
----------

✔️ **Scan QR Codes & GS1 Barcodes**\
✔️ **Manage Scanner State using Bloc**\
✔️ **Navigate to Scanner Page with Custom Parameters**\
✔️ **Listen & Retrieve Scanned Codes Easily**


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)


🚀 How to Use
-------------

### 1️⃣ Initialize **DigitScannerBloc**

```
BlocProvider(
  create: (_) => DigitScannerBloc(const DigitScannerState()),
),
```

### 2️⃣ Clear the Scanner State

```
context.read<DigitScannerBloc>().add(
  const DigitScannerEvent.handleScanner(),
);
```

### 3️⃣ Navigate to the **DIGIT Scanner Page**

```
context.router.push(
  DigitScannerRoute(
    quantity: 1,     // Max number of codes to be scanned
    isGS1code: false, // Set to true for GS1 barcode scanning
    singleValue: true, // Set to false for scanning multiple codes
  ),
);
```

### 4️⃣ Listen to Scanner State Changes

```
BlocListener<DigitScannerBloc, DigitScannerState>(
  listener: (context, scannerState) {
    if (scannerState.qrCodes.isNotEmpty) {
      // Handle scanned codes
    }
  },
  child: BlocBuilder<DigitScannerBloc, DigitScannerState>(
    builder: (context, scannerState) {
      if (scannerState.qrCodes.isNotEmpty) {
        return Text(scannerState.qrCodes.last);
      } else {
        return Container();
      }
    },
  ),
);
```


![scanner](https://github.com/user-attachments/assets/613c2934-9379-4fb7-8103-d9ba7c0383ed)


* * * * *


<a name="digit-showcase"></a>
📦 DIGIT Showcase Package
========================


The **Digit Showcase Package** provides an easy way to **highlight** or **showcase** widgets in your Flutter application. It helps guide users by visually emphasizing UI elements.

✨ Features
----------

✔️ **Highlight widgets dynamically**\
✔️ **Guide users through the UI with visual cues**\
✔️ **Enable automatic scrolling to showcased widgets**\
✔️ **Supports localization for messages**


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)


🚀 How to Use
-------------

### 1️⃣ Wrap the **Top Layer** with `ShowcaseWidget`

```
ShowcaseWidget(
  enableAutoScroll: true,
  builder: Builder(
    builder: (context) {
      // Your widget tree
    },
  ),
);
```

### 2️⃣ Provide Localization for the Showcase Widget

```
final date = ShowcaseItemBuilder(
  messageLocalizationKey: i18.showcase_date.date,
);
```

### 3️⃣ Use `.buildWith` to Highlight the Widget

```
date.buildWith(
  child: Text('Date'),
);
```

## Showcase Configuration

Showcase is configured using [showcaseview](https://pub.dev/packages/showcaseview). A fork is created
at `packages/digit_showcase` to handle customizations.

### Configuration steps

#### Add i18n strings

Add constants to `lib/utils/i18_key_constants.dart`

```dart

const checklistDataShowcase = ChecklistDataShowcase();

class ChecklistDataShowcase {
  const ChecklistDataShowcase();

  String get date {
    return 'CHECKLIST_DATA_SHOWCASE_DATE';
  }

  String get administrativeUnit {
    return 'CHECKLIST_DATA_SHOWCASE_ADMINISTRATIVE_UNIT';
  }
}
```

#### Add Showcase configuration

##### Add `part` file

`checklist_data.dart`

```dart
part of 'showcase_constants.dart';

class _ChecklistDataShowcaseData {
  static final _ChecklistDataShowcaseData _instance =
  _ChecklistDataShowcaseData._();

  _ChecklistDataShowcaseData._();

  factory _ChecklistDataShowcaseData() => _instance;

  List<ShowcaseItemBuilder> get showcaseData =>
      [
        date,
        administrativeUnit,
      ];

  final date = ShowcaseItemBuilder(
    messageLocalizationKey: i18.checklistDataShowcase.date,
  );

  final administrativeUnit = ShowcaseItemBuilder(
    messageLocalizationKey: i18.checklistDataShowcase.administrativeUnit,
  );
}
```

##### Export as global variable

`showcase_constants.dart`

```dart
import '../../../utils/i18_key_constants.dart' as i18;
import '../showcase_wrappers.dart';

part 'survey_form_data.dart';

final checklistDataShowcaseData = _ChecklistDataShowcaseData();
```

#### Activate showcase on route navigation

`showcase_button.dart`

```dart
import 'package:digit_showcase/showcase_widget.dart';
import 'package:flutter/material.dart';

import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';
import 'config/showcase_constants.dart';

class ShowcaseButton extends LocalizedStatefulWidget {
  final Iterable<GlobalKey>? showcaseFor;

  const ShowcaseButton({super.key, this.showcaseFor});

  @override
  LocalizedState<ShowcaseButton> createState() => _ShowcaseButtonState();
}

class _ShowcaseButtonState extends LocalizedState<ShowcaseButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (widget.showcaseFor?.isNotEmpty == true) {
          ShowcaseWidget.of(context).startShowCase(
            widget.showcaseFor!.toList(),
          );

          return;
        }

        final current = context.router.current.name;
        final paths = _showcasePathsForRoute(current);

        if (paths == null) return;
        if (paths.isEmpty) return;

        ShowcaseWidget.of(context).startShowCase(paths.toList());
      },
      child: Row(
        children: [
          Text(localizations.translate(i18.common.coreCommonHelp)),
          const Icon(Icons.help_outline),
        ],
      ),
    );
  }

  Iterable<GlobalKey>? _showcasePathsForRoute(String routeName) {
    return switch (routeName) {
    // Add this config
      ChecklistBoundaryViewRoute.name =>
          checklistDataShowcaseData.showcaseData.map((e) => e.showcaseKey),
      _ => null,
    };
  }
}
```

#### Wrap target widget with showcase wrapper which acts as a HoC

```dart
class _ChecklistBoundaryViewPageState extends LocalizedState<ChecklistBoundaryViewPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: const Column(children: [
          BackNavigationHelpHeaderWidget(
            // Add showcase button
            showcaseButton: ShowcaseButton(),
          ),
        ]),
        footer: DigitCard(
          child: DigitElevatedButton(
            onPressed: () => context.router.push(ChecklistViewRoute()),
            child: Text(localizations.translate(
              i18.common.coreCommonContinue,
            )),
          ),
        ),
        slivers: [
          SliverToBoxAdapter(
            child: DigitCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    localizations.translate(
                      i18.checklist.checklistDetailLabel,
                    ),
                    style: theme.textTheme.displayMedium,
                  ),
                  // Wrap with showcase wrapper
                  checklistDataShowcaseData.date.buildWith(
                    child: DigitTextField(
                      readOnly: true,
                      label: localizations.translate(
                        i18.checklist.checklistdate,
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.date_range_outlined,
                        ),
                      ),
                      controller: TextEditingController(
                        text: DateFormat('dd MMMM yyyy').format(DateTime.now()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

<img src="https://github.com/user-attachments/assets/61ac10fa-5cbf-4b13-970a-d3f33f4cc346" alt="Showcase" width="300">

<img src="https://github.com/user-attachments/assets/5cc40377-8c2e-4d03-8c73-609bcfd89a28" alt="Showcase" width="300">



* * * * *



🔄 Data Sync
========================

Currently, the app is configured to run only on `PersistenceConfiguration.offlineFirst` mode. With the offline first
approach the local data store is considered as the **Source of truth**. Data persisted in the local data store is synced
to the remote data store.

![Sync Sequence Diagram](puml/sync.png)

### Data Creation

The following steps describe the data creation process:

1. The user initiates the data creation by performing a Submit action.
2. The UI receives the action and requests the repository from the Network Manager.
3. The Network Manager returns the Local repository.
4. The UI creates the data and stores it in the Local repository.
5. The Local repository creates an entry in the OpLog.
6. Success is returned to the UI.
7. The Local repository persists the data in the SQLite database.
8. Success is returned to the UI.

### Manual Sync

The following steps describe the manual synchronization process:

1. The user initiates the manual sync by selecting the Sync now option.
2. The UI sends a SyncSyncUpEvent to the Sync Bloc.
3. The Sync Bloc performs the sync operation.
4. The Network Manager retrieves the items to be synced down from the Local repository.
5. The Local repository queries the OpLog for pending down sync operations and returns a list of OpLog entries.
6. The network manager groups the OpLog entries by type.
7. For each entry group:
    - The network manager sends a Bulk Search request to the Remote repository using the Client Reference IDs.
    - The Remote repository returns the remote entities with Server Generated IDs.
    - The network manager updates the server-generated ID in the OpLog and returns success.
    - The network manager updates the server-generated ID in the SQLite database and returns success.
8. Success is returned to complete the sync down process.

9. The network manager retrieves the items to be synced up from the Local repository.
10. The Local repository queries the OpLog for pending up sync operations and returns a list of OpLog entries.
11. The network manager groups the OpLog entries by type and data operation.
12. For each entry group:
    - If it is a CREATE operation:
        - The network manager sends a Bulk create request to the Remote repository and returns success.
    - If it is an UPDATE operation:
        - The network manager sends a Bulk update request to the Remote repository and returns success.
    - If it is a DELETE operation:
        - The network manager sends a Bulk delete request to the Remote repository and returns success.
    - If it is a SINGLE_CREATE operation:
        - The network manager sends a Single create request to the Remote repository and returns success.
13. Success is returned to complete the sync up process.


* * * * *


Codebase
--------

The source code is available on GitHub: [**Health Campaign Field Worker App Repository**](https://github.com/egovernments/health-campaign-field-worker-app)

Installation
------------

### Prerequisites

-   Flutter SDK (latest stable version)

-   Android device or emulator

### Steps

1.  Clone the repository:

    ```
    git clone https://github.com/egovernments/health-campaign-field-worker-app.git
    ```

2.  Navigate to the project directory:

    ```
    cd health-campaign-field-worker-app
    ```

3.  Install dependencies:

    ```
    flutter pub get
    ```

4.  Create a `.env` file and add the following environment variables:

    ```
    BASE_URL=
    MDMS_API_PATH=
    TENANT_ID=
    ACTIONS_API_PATH=
    SYNC_DOWN_RETRY_COUNT=
    RETRY_TIME_INTERVAL=
    CONNECT_TIMEOUT=
    RECEIVE_TIMEOUT=
    SEND_TIMEOUT=
    HIERARCHY_TYPE="MICROPLAN"
    CHECK_BANDWIDTH_API="/project/check/bandwidth"
    ENV_NAME="DEMO"
    ```

5.  Run the app:

    ```
    flutter run
    ```

Contributing
------------

Contributions are welcome! Follow these steps to contribute:

1.  Fork the repository.

2.  Create a feature branch:

    ```
    git checkout -b feature-name
    ```

3.  Commit your changes:

    ```
    git commit -m "Add some feature"
    ```

4.  Push to the branch:

    ```
    git push origin feature-name
    ```

5.  Open a pull request.


Documentation
-------------

For more detailed documentation, visit the [DIGIT Health Platform](https://health.digit.org/).

