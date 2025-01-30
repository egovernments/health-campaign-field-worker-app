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



✨ Tech Stack/Core Dependencies
----------------------------

-   **Flutter**: Framework to build multi-platform apps.

-   **SQLite**: SQL offline database for structured data.

-   **ISAR**: NoSQL offline database for high-performance storage.

-   **Dio**: HTTP client for network communication.



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
-----------



As a part of the release, we have extracted the features of the Frontline Worker's App as individual packages:

1.  **Registration & Delivery Package**

2.  **Referral Reconciliation Package**

3.  **Inventory Management Package**

4.  **Attendance Management Package**

5.  **Closed Household Package**

6.  **DIGIT Scanner Package**

7.  **DIGIT Showcase Package**

8.  **Digit Data Model Package**

9.  **DIGIT DSS Package**

10. **Complaints Package**

11. **Survey Form Package**

12. **Sync Service Package**

These are the packages which are created for this.



* * * * *



📦 Getting Started (Generalized for All Packages)
----------------------------------------------

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



📦 **Closed Household Package**
----------------------------

The **Closed Household** package is a new module built as a Flutter package (`closed_household`). It will be a dependency for the **Registration and Delivery** package.


### Link to the Pub Package:

-   [closed_household | Flutter package](https://pub.dev/packages/closed_household)



### Role

-   **Distributor**



### Features:

-   **Create a Closed Household**: Enables creating a closed household record.


-   **Update Task**: Updates the task if a closed household is registered.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### Sequence Diagram

*(Add sequence diagram here)*



* * * * *



📦 **Registration & Delivery Package**
-----------------------------------

This package provides a way to register a household and individual members and deliver the resources to the registered households.


To learn more about Registration and Delivery, click here.



### Link to the Pub Package:

-   registration_delivery | Flutter package



### Role

-   **DISTRIBUTOR**



### Features:

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

✅ **These changes will enable the down sync of registration & delivery data.**



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



### **✨ Filtering Mechanism**

To enable better data access, we introduce **filters**:

-   **Registered**

-   **Unregistered**

-   **Closed**

-   **Combination of Filters**

-   **Proximity Enabled Search**

-   **Search by Name**

A **query builder** is used to fetch results dynamically (example below for an individual-based project).



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



### **✨ Closed House Data Capture**

-   A **new module** named **closed_household** has been built.

-   This will be a **dependency** of the **registration and delivery package**.



### **✨ Handling Unsuccessful Deliveries**

For **household-based flows**, a feature has been introduced to **capture reasons for unsuccessful deliveries**.



### **✨ Final Steps**

Once all the above modifications are implemented, rerun:

```
dart run build_runner build --delete-conflicting-outputs
```

This ensures proper integration of **Registration & Delivery** within the **HCM app**.



### Sequence Diagram

*(Add sequence diagram here)*



* * * * *



📦 **Inventory Management Package**
--------------------------------

This package enables the user to manage the stocks of a health campaign. The user can record the stocks received, issued, returned, damaged, and lost.


To learn more about Inventory Management, click here.



### Link to the Pub Package:

-   inventory_management | Flutter package



### Role

-   **DISTRIBUTOR**
-   **WAREHOUSE_MANAGER**



### Features:

-   **Manage Stocks**: Record the receipt, issue, return, damage, and loss of stocks.
-   **Stock Reconciliation**: Reconcile the stock data.
-   **View Reports**: View the reports of the stocks.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### Sequence Diagram

*(Add sequence diagram here)*



* * * * *



📦 **Referral Reconciliation Package**
-----------------------------------

This module will enable the health facility supervisors to track referrals made by on-field health workers to different health facilities digitally via the **Digit HCM app**.


To learn more about Referral Reconciliation, click here.



### Link to the Pub Package:

-   referral_reconciliation | Flutter package



### Role

-   **HEALTH_FACILITY_WORKER**



### Features:

-   **Track referrals made by on-field health workers**: Enables tracking of all referrals to various health facilities.


-   **Capture beneficiary referral details**: Includes the reason for referrals, diagnosis, and any further applicable details.


-   **Detailed record keeping**: Ensures all referral cases are documented digitally for better monitoring.


### **Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)



### Sequence Diagram

*(Add sequence diagram here)*



* * * * *



📦 **Attendance Management Package**
---------------------------------

The **Attendance Management package** is a comprehensive solution for tracking and managing attendance within the **Digit HCM app**.



### **To learn more about Attendance Management, click here.**



### **Link to the Pub Package:**

-   attendance_management | Flutter package



### **Role**

-   **SUPERVISOR**



### **Features**

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

*(Add sequence diagram here)*


* * * * *



📦 Digit Data Model Package
------------------------

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


**Integrating with the HCM Application:** [Getting Started](#getting-started-generalized-for-all-packages)


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



### Sequence Diagram

*(Add sequence diagram here)*


