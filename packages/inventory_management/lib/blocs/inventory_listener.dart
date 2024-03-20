import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';

import '../models/entities/inventory_facility.dart';
import '../models/entities/stock.dart';
import '../utils/utils.dart';
import 'inventory_report.dart';

abstract class InventoryListener {
  Future<List<InventoryFacilityModel>> fetchFacilitiesForProjectId();

  Future<List<ProductVariantModel>> fetchProductVariants();

  Future<void> saveStockDetails(SaveStockDetails saveStockDetails);

  Future<void> fetchStockReconciliationDetails(
      FetchStockReconDetails fetchStockReconDetails);

  Future<void> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel);

  Future<void> handleStockReconciliationReport(
      StockReconciliationReport stockReconciliationReport);

  Future<void> fetchInventoryReports(
      FetchInventoryReports fetchInventoryReports);

  void callSyncMethod();
}

class InventorySingleton {
  static final InventorySingleton _singleton = InventorySingleton._internal();

  factory InventorySingleton() {
    return _singleton;
  }

  InventorySingleton._internal();

  InventoryListener? _inventoryListener;
  String _projectId = '';
  String _userId = '';
  String _appVersion = '';
  String _boundaryName = '';
  bool _isDistributor = false;
  bool _isWareHouseMgr = false;
  List<InventoryTransportTypes>? _transportType = [];

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

  get projectId => _projectId;
  get userId => _userId;
  get boundaryName => _boundaryName;
  get isDistributor => _isDistributor;
  get isWareHouseMgr => _isWareHouseMgr;
  get transportType => _transportType;

  Future<List<InventoryFacilityModel>?> getFacilitiesForProjectId() async {
    return await _inventoryListener?.fetchFacilitiesForProjectId();
  }

  Future<List<ProductVariantModel>?> getProductVariants() async {
    return await _inventoryListener?.fetchProductVariants();
  }

  Future<void> saveStockDetails(SaveStockDetails saveStockDetails) async {
    return Future(
      () => _inventoryListener?.saveStockDetails(saveStockDetails),
    );
  }

  Future<void> fetchStockReconciliationDetails(
      FetchStockReconDetails fetchStockReconDetails) async {
    return Future(
      () => _inventoryListener?.fetchStockReconciliationDetails(
        fetchStockReconDetails,
      ),
    );
  }

  Future<void> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel) async {
    return Future(
      () => _inventoryListener?.saveStockReconciliationDetails(
        stockReconciliationModel,
      ),
    );
  }

  Future<void> fetchInventoryReports(
      FetchInventoryReports fetchInventoryReports) async {
    return Future(
      () => _inventoryListener?.fetchInventoryReports(
        fetchInventoryReports,
      ),
    );
  }

  void callSync() {
    _inventoryListener?.callSyncMethod();
  }
}

class SaveStockDetails {
  final StockModel stockModel;
  final Map<String, Object> additionalData;
  final Function(bool isStockSaved) isStockSaved;

  SaveStockDetails(
      {required this.stockModel,
      required this.additionalData,
      required this.isStockSaved});
}

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

class StockReconciliationReport {
  final String facilityId;
  final String productVariantId;
  final Function(Map<String, List<StockReconciliationModel>> data)
      stockReconciliationReport;

  StockReconciliationReport({
    required this.facilityId,
    required this.productVariantId,
    required this.stockReconciliationReport,
  });
}

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
