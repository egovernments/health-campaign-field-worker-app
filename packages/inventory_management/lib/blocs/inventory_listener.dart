import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';

import '../models/entities/inventory_facility.dart';
import '../models/entities/inventory_transport_type.dart';
import '../models/entities/stock.dart';
import 'inventory_report.dart';

// This is an abstract class that defines the methods for inventory operations.
abstract class InventoryListener {
  // Fetches the facilities for a given project ID.
  Future<List<InventoryFacilityModel>> fetchFacilitiesForProjectId();

  // Fetches the product variants.
  Future<List<ProductVariantModel>> fetchProductVariants();

  // Saves the stock details.
  Future<void> saveStockDetails(SaveStockDetails saveStockDetails);

  // Fetches the stock reconciliation details.
  Future<void> fetchStockReconciliationDetails(
      FetchStockReconDetails fetchStockReconDetails);

  // Saves the stock reconciliation details.
  Future<void> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel);

  // Handles the stock reconciliation report.
  Future<void> handleStockReconciliationReport(
      StockReconciliationReport stockReconciliationReport);

  // Fetches the inventory reports.
  Future<void> fetchInventoryReports(
      FetchInventoryReports fetchInventoryReports);

  // Calls the sync method.
  void callSyncMethod();
}

// This is a singleton class for inventory operations.
class InventorySingleton {
  static final InventorySingleton _singleton = InventorySingleton._internal();

  // Factory constructor that returns the singleton instance.
  factory InventorySingleton() {
    return _singleton;
  }

  // Private constructor for the singleton pattern.
  InventorySingleton._internal();

  // Instance of the InventoryListener.
  InventoryListener? _inventoryListener;

  // Various properties related to the inventory.
  String _projectId = '';
  String _userId = '';
  String _boundaryName = '';
  bool _isDistributor = false;
  bool _isWareHouseMgr = false;
  List<InventoryTransportTypes>? _transportType = [];

  // Sets the initial data for the inventory.
  void setInitialData(
      {required InventoryListener inventoryListener,
      required String userId,
      required String boundaryName,
      required String projectId,
      required bool isDistributor,
      required bool isWareHouseMgr,
      required List<InventoryTransportTypes>? transportTypes}) {
    _inventoryListener = inventoryListener;
    _projectId = projectId;
    _userId = userId;
    _transportType = transportTypes;
    _boundaryName = boundaryName;
    _isDistributor = isDistributor;
    _isWareHouseMgr = isWareHouseMgr;
  }

  // Getters for the properties.
  get projectId => _projectId;
  get userId => _userId;
  get boundaryName => _boundaryName;
  get isDistributor => _isDistributor;
  get isWareHouseMgr => _isWareHouseMgr;
  get transportType => _transportType;

  // Fetches the facilities for a given project ID.
  Future<List<InventoryFacilityModel>?> getFacilitiesForProjectId() async {
    return await _inventoryListener?.fetchFacilitiesForProjectId();
  }

  // Fetches the product variants.
  Future<List<ProductVariantModel>?> getProductVariants() async {
    return await _inventoryListener?.fetchProductVariants();
  }

  // Saves the stock details.
  Future<void> saveStockDetails(SaveStockDetails saveStockDetails) async {
    return Future(
      () => _inventoryListener?.saveStockDetails(saveStockDetails),
    );
  }

  // Fetches the stock reconciliation details.
  Future<void> fetchStockReconciliationDetails(
      FetchStockReconDetails fetchStockReconDetails) async {
    return Future(
      () => _inventoryListener?.fetchStockReconciliationDetails(
        fetchStockReconDetails,
      ),
    );
  }

  // Saves the stock reconciliation details.
  Future<void> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel) async {
    return Future(
      () => _inventoryListener?.saveStockReconciliationDetails(
        stockReconciliationModel,
      ),
    );
  }

  // Fetches the inventory reports.
  Future<void> fetchInventoryReports(
      FetchInventoryReports fetchInventoryReports) async {
    return Future(
      () => _inventoryListener?.fetchInventoryReports(
        fetchInventoryReports,
      ),
    );
  }

  // Handles the stock reconciliation report.
  Future<void> handleStockReconciliationReport(
      StockReconciliationReport stockReconciliationReport) async {
    return Future(
      () => _inventoryListener?.handleStockReconciliationReport(
        stockReconciliationReport,
      ),
    );
  }

  // Calls the sync method.
  void callSync() {
    _inventoryListener?.callSyncMethod();
  }
}

// Class to hold the details for saving stock.
class SaveStockDetails {
  final StockModel stockModel;
  final Map<String, Object> additionalData;
  final Function(bool isStockSaved) isStockSaved;

  SaveStockDetails(
      {required this.stockModel,
      required this.additionalData,
      required this.isStockSaved});
}

// Class to hold the details for fetching stock reconciliation.
class FetchStockReconDetails {
  final String productVariantId;
  final String facilityId;
  final Function(List<StockModel> sentStocks, List<StockModel> receivedStocks)
      stockReconDetails;

  FetchStockReconDetails({
    required this.productVariantId,
    required this.facilityId,
    required this.stockReconDetails,
  });
}

// Class to hold the details for saving stock reconciliation.
class SaveStockReconciliationModel {
  final StockReconciliationModel stockReconciliationModel;
  final Map<String, Object> additionalData;
  final Function(bool isStockReconciliationSaved) isStockReconciliationSaved;

  SaveStockReconciliationModel({
    required this.stockReconciliationModel,
    required this.additionalData,
    required this.isStockReconciliationSaved,
  });
}

// Class to hold the details for the stock reconciliation report.
class StockReconciliationReport {
  final String facilityId;
  final String productVariantId;
  final Function(Map<String, List<StockReconciliationModel>> data,
      Iterable<Iterable<MapEntry<String, dynamic>>>) stockReconciliationReport;

  StockReconciliationReport({
    required this.facilityId,
    required this.productVariantId,
    required this.stockReconciliationReport,
  });
}

// Class to hold the details for fetching inventory reports.
class FetchInventoryReports {
  final InventoryReportType reportType;
  final String facilityId;
  final String productVariantId;
  final Function(
    Map<String, List<StockModel>> groupedData,
  ) stocks;

  FetchInventoryReports({
    required this.reportType,
    required this.facilityId,
    required this.productVariantId,
    required this.stocks,
  });
}
