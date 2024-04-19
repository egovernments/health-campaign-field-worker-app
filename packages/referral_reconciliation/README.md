# Referral Reconciliation Package

This enables the user to manage the stocks of the health campaign. The user can record the stocks received, issued, returned, damaged and lost. The user can also reconcile the stock data with the parent application and view the reports of the stocks.

## Features

- Beneficiary Referral: This module will enable the health facility supervisors to track referrals made by on-field health workers to different health facilities digitally.
  ![manage_stocks](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/884566db-51c1-4712-b09c-cda508adb401)
  ![warehouse_details](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/48b272b5-45f5-401c-b775-2fa5ded07602)
  ![record_stock](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/9202691e-550c-4a6c-9c3f-56c95a2f3479)

## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  referral_reconciliation: ^0.0.1
```

Here is how referral reconciliation package interacts with parent app

![inventory_management](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/e22ba6a1-bb73-4ec2-b93d-8aada56590e8)

New files or changes needed in HCM App:

1. Create model classes which import referral reconciliation models and add companion class
2. Create repositories local and remote as per project requirements and structure
3. Run referral_reconciliation_imports.dart file to import all the required files to work with inventory package
4. Add navigation to search referral reconciliations page from hcm app and pass the required fields

Below are the sequence diagrams on each feature on how it interacts with HCM App:

![record_stock_inventory](https://github.com/egovernments/health-campaign-field-worker-app/assets/154230258/f60a1106-f077-400f-b234-bc7634daf4dc)


