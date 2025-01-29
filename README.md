Health Campaign Management V1.6 - Field Worker's App
====================================================

Overview
--------

The Health Campaign Management (HCM) [latest version](https://github.com/egovernments/health-campaign-field-worker-app/tags) field worker's app is part of the DIGIT Health Platform. It empowers frontline teams to manage health campaigns efficiently, even in low or no network coverage areas. With its offline-first functionality and configurable design, the app is built to address the unique needs of field workers, ensuring seamless data collection, beneficiary management, and campaign tracking.

Key Features
------------

-   **Offline Mode**: Perform all tasks without active internet connectivity.

-   **Four New Modules**: Enable efficient task execution for frontline workers.

-   **Configurable Design**: Adaptable to various campaign needs through server-based configurations.

-   **Multi-Round Campaign Support**: Manage multiple campaign cycles with eligibility checks, delivery tracking, and side-effect recording.

-   **Sync Mechanism**: Bidirectional sync (up and down) ensures consistent data between the app and server.

-   **Beneficiary Data Management**: Optimized retrieval and duplication prevention for beneficiary records.

-   **Permission-Based Access**: Data sync tailored to user roles and assigned projects.

Architecture
------------

The high-level architecture of the app is divided into three core parts:

1.  **Frontend**: Built using Flutter for a multi-platform, user-friendly experience.

2.  **Backend Services**: Syncs with MDMS, localisation, and other backend services.

3.  **Database**: Combines SQLite and ISAR for flexible offline data storage.

Tech Stack/Core Dependencies
----------------------------

-   **Flutter**: Framework to build multi-platform apps.

-   **SQLite**: SQL offline database for structured data.

-   **ISAR**: NoSQL offline database for high-performance storage.

-   **Dio**: HTTP client for network communication.

Design Considerations
---------------------

### General Considerations

-   Works seamlessly in low/no network coverage areas.

-   Highly configurable, with settings managed through MDMS.

-   Designed for Android devices, ensuring compatibility with users who have low-tech literacy.

### Sync Mechanism

-   **Sync Down**: Fetch configurations and data from the server (e.g., localisation, master data).

-   **Sync Up**: Upload collected data to the server.

-   **Login & Sync**: Syncing can only occur while the user is online.

### Configurability

Key configurations include:

-   Offline-first or online-only mode.

-   Backend service URLs and endpoints (no app rebuild required for updates).

-   Data refresh intervals for previously fetched configurations.

-   Supported languages and localisation data.

### Operational Log (Op Log)

All offline actions are logged and processed during sync-up to ensure data consistency and integrity.

### Network Manager

A network manager component abstracts the online/offline logic, enabling seamless data handling by other app components.

Modules and Features
--------------------

### Down Sync of Beneficiaries

Ensures the local device database is updated with the latest beneficiary data while preventing duplicate records.

**Key Features:**

-   Uses offset and limit for efficient pagination.

-   Adapts batch size based on internet speed.

-   Essential for reducing redundancy within the same boundary.

**Use Case:**

-   Particularly useful in multi-user scenarios where teams operate in the same geographical boundary.

### Multi-Round Campaigns

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

Packages
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

Getting Started (Generalized for All Packages)
----------------------------------------------

To get started with any package, follow these steps:

1.  **Add Dependency**: Add the relevant package to your `pubspec.yaml` file:

    ```
    dependencies:
      <package_name>: ^latest_version
    ```

2.  **Integrating with the HCM Application**:

    -   Locate the main function for integration in the respective tool's import file. For example, `health-campaign-field-worker-app/tools/<package_name>_imports.dart`.

    -   Run the integration script to automatically add necessary imports, mappers, route configurations, and repository initializations.

    Example command to run:

    ```
    dart run build_runner build --delete-conflicting-outputs
    ```

3.  **Install the Application**: After running the build command, install the application on your device to have the module integrated with your base app.

4.  **Sync Data**: To ensure proper data synchronization, follow any additional steps for down-syncing or up-syncing based on your use case.

By following these general steps, you can successfully integrate and use any of the packages within your application.

* * * * *

**Closed Household Package**
----------------------------


The **Closed Household** package is a new module built as a Flutter package (`closed_household`). It will be a dependency for the **Registration and Delivery** package.


### Link to the Pub Package:


-   [closed_household | Flutter package](https://pub.dev/packages/closed_household)


### Role


**Distributor**


### Features:


-   **Create a Closed Household**: Enables creating a closed household record.


-   **Update Task**: Updates the task if a closed household is registered.


### Sequence Diagram


*(Add sequence diagram here)*


* * * * *


**Registration & Delivery Package**
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


### Sequence Diagram


*(Add sequence diagram here)*


**Inventory Management Package**
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


### Sequence Diagram


*(Add sequence diagram here)*


**Referral Reconciliation Package**
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


### Sequence Diagram


*(Add sequence diagram here)*


**Attendance Management Package**
---------------------------------


The Attendance Management package is a comprehensive solution for managing attendance in the **Digit HCM app**.


To learn more about Attendance Management, click here.


### Link to the Pub Package:


-   attendance_management | Flutter package


### Role


-   **SUPERVISOR**


### Features


-   **Attendance Pages**:\
    The package includes several pages to provide a user interface for managing attendance:
-   **mark_attendance.dart**: Allows users to mark attendance for individuals.
-   **manage_attendance.dart**: Provides an interface for managing and updating attendance records.
-   **session_select.dart**: Enables users to select attendance sessions conveniently.


### Sequence Diagram


*(Add sequence diagram here)*

