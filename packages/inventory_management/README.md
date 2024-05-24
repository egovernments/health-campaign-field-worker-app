# Inventory Management Package

This enables the user to manage the stocks of the health campaign. The user can record the stocks received, issued, returned, damaged and lost. The user can also reconcile the stock data with the parent application and view the reports of the stocks.

## Features

- Manage Stocks: Receipt, Issued, Returned, Damaged and Loss of stocks and send the data to parent application.
  ![manage_stocks](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/884566db-51c1-4712-b09c-cda508adb401)
  ![warehouse_details](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/48b272b5-45f5-401c-b775-2fa5ded07602)
  ![record_stock](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/9202691e-550c-4a6c-9c3f-56c95a2f3479)

- Stock Reconciliation: Reconcile the stock data with the parent application.
  ![stock_recon](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/f2df8d87-2000-44ac-a90b-b52d6689b3aa)

- View Reports: View the reports of the stocks.

## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  inventory_management: ^0.0.0-dev.1
```

To Navigate to any screens of the package: 

First add inventory_router to your main app router

Navigate to the required screen using the below code:

```dart
context.router.push(ManageStocksRoute());
```
Inventory Management package requires below data to be passed from main app:

```dart
String _projectId;
String? _loggedInUserUuid;
String? _boundaryName;
String? _tenantId;
bool _isDistributor;
bool _isWareHouseMgr;
List<InventoryTransportTypes>? _transportType;
PersistenceConfiguration _persistenceConfiguration;
```

Below are the flow diagrams of flow:

![record_stock](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/b0817363-6ead-4b7e-8791-e719c0f2ae8c)
![stock_recon](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/ccc4b50b-5e43-4784-9bdb-17ece68022a7)
![report_selection](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/2e9affca-e82d-41bf-83a2-7241b44cbe56)
