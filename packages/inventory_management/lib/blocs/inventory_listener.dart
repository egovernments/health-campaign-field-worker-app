import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:digit_data_model/data_model.dart';

import '../models/entities/inventory_transport_type.dart';
import '../models/entities/stock.dart';
import 'inventory_report.dart';

// This is an abstract class that defines the methods for inventory operations.
abstract class InventoryListener {
  // Fetches the facilities for a given project ID.
  Future<List<FacilityModel>> fetchFacilitiesForProjectId();

  // Fetches the product variants.
  Future<List<ProductVariantModel>> fetchProductVariants();

  // Saves the stock details.
  Future<bool> saveStockDetails(SaveStockDetails saveStockDetails);

  // Fetches the stock reconciliation details.
  Future<List<List<StockModel>>> fetchStockReconciliationDetails({
    required String productVariantId,
    required final String facilityId,
  });

  // Saves the stock reconciliation details.
  Future<bool> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel);

  // Handles the stock reconciliation report.
  Future<StockReconciliationReport> handleStockReconciliationReport(
      {required String facilityId, required String productVariantId});

  // Fetches the inventory reports.
  Future<Map<String, List<StockModel>>> fetchInventoryReports({
    required final InventoryReportType reportType,
    required final String facilityId,
    required final String productVariantId,
  });

  // Calls the sync method.
  void callSyncMethod();
}

// Class to hold the details for saving stock.
class SaveStockDetails {
  final StockModel stockModel;

  SaveStockDetails({
    required this.stockModel,
  });
}

// Class to hold the details for saving stock reconciliation.
class SaveStockReconciliationModel {
  final StockReconciliationModel stockReconciliationModel;
  final Map<String, Object> additionalData;

  SaveStockReconciliationModel({
    required this.stockReconciliationModel,
    required this.additionalData,
  });
}

// Class to hold the details for the stock reconciliation report.
class StockReconciliationReport {
  final Map<String, List<StockReconciliationModel>> stockReconModel;
  final Iterable<MapEntry<String, dynamic>> additionalData;

  StockReconciliationReport({
    required this.stockReconModel,
    required this.additionalData,
  });
}
