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
  inventory_management: ^0.0.1
```

Here is how inventory package interacts with parent app

![inventory_management](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/e22ba6a1-bb73-4ec2-b93d-8aada56590e8)

New files or changes needed in HCM App:

1. Create model classes which import inventory models and add companion class 
2. Create repositories local and remote as per project requirements and structure 
3. Run inventory_package_imports.dart file to import all the required files to work with inventory package 
4. Add navigation to manage inventory page, stock recon and view reports from hcm app and pass the required fields

Below are the sequence diagrams on each feature on how it interacts with HCM App:

![record_stock_inventory](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/f60a1106-f077-400f-b234-bc7634daf4dc)
![stock_recon_flow](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/60b8037b-ff54-4f42-84d3-298216f70ecf)
![stock_reports](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/5ca35c54-af62-49db-a238-fcff8640c9cf)

