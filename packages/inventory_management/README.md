# Inventory Management Package

This package is designed to manage the inventory of your application.

## Features

- Manage Stocks: Receipt, Issued, Returned, Damaged and Loss of stocks and send the data to parent application.
- Stock Reconciliation: Reconcile the stock data with the parent application.
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

1. Run inventory_imports.sh script to add the localization and add skeleton bloc
2. Create model classes which import attendance models and add companion class
3. Create repositories local and remote as per project requirements and structure
4. Add typedef for repositories in untils/typedef Initialize repo in network manager, and create oplog
5. Add navigation to manage attendance page from hcm app and pass the required fields

Below are the sequence diagrams on each feature on how it interacts with HCM App:

![record_stock_inventory](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/77a3a60b-38de-4aa7-8a00-bd1a3139549e)
![stock_recon_flow](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/60b8037b-ff54-4f42-84d3-298216f70ecf)
![stock_reports](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/1d78b9b2-0816-4e88-8332-12b0cdc8bcdf)
