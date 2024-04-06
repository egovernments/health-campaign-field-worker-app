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
  Future<bool> saveStockDetails(SaveStockDetails saveStockDetails);

  // Fetches the stock reconciliation details.
  Future<List<List<StockModel>>> fetchStockReconciliationDetails({
    final String productVariantId,
    final String facilityId,
  });

  // Saves the stock reconciliation details.
  Future<bool> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel);

  // Handles the stock reconciliation report.
  Future<StockReconciliationReport> handleStockReconciliationReport(
      {String facilityId, String productVariantId});

  // Fetches the inventory reports.
  Future<Map<String, List<StockModel>>> fetchInventoryReports({
    final InventoryReportType reportType,
    final String facilityId,
    final String productVariantId,
  });

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
  Future<bool?> saveStockDetails(SaveStockDetails saveStockDetails) async {
    return await _inventoryListener?.saveStockDetails(saveStockDetails);
  }

  // Fetches the stock reconciliation details.
  Future<List<List<StockModel>>> fetchStockReconciliationDetails({
    required final String productVariantId,
    required final String facilityId,
  }) async {
    return await (_inventoryListener?.fetchStockReconciliationDetails(
            productVariantId: productVariantId, facilityId: facilityId) ??
        Future.value([]));
  }

  // Saves the stock reconciliation details.
  Future<bool?> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel) async {
    return Future(
      () => _inventoryListener?.saveStockReconciliationDetails(
        stockReconciliationModel,
      ),
    );
  }

  // Fetches the inventory reports.
  Future<Map<String, List<StockModel>>> fetchInventoryReports({
    required final InventoryReportType reportType,
    required final String facilityId,
    required final String productVariantId,
  }) async {
    return await (_inventoryListener?.fetchInventoryReports(
            facilityId: facilityId,
            reportType: reportType,
            productVariantId: productVariantId) ??
        Future.value({}));
  }

  // Handles the stock reconciliation report.
  Future<StockReconciliationReport?> handleStockReconciliationReport(
      {required String productVariantId, required String facilityId}) async {
    return await _inventoryListener?.handleStockReconciliationReport(
      facilityId: facilityId,
      productVariantId: productVariantId,
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

  SaveStockDetails({
    required this.stockModel,
    required this.additionalData,
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
