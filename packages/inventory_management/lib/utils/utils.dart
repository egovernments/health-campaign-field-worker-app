// Importing necessary packages and modules
import 'package:drift/drift.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';
import 'package:digit_data_model/data_model.dart';

import '../blocs/inventory_listener.dart';
import '../blocs/inventory_report.dart';
import '../models/entities/inventory_transport_type.dart';
import '../models/entities/stock.dart';

/// This class contains custom validators for form controls.
class CustomValidator {
  /// Validates that control's value must be `true`
  static Map<String, dynamic>? requiredMin(
    AbstractControl<dynamic> control,
  ) {
    return control.value == null ||
            control.value.toString().length >= 2 ||
            control.value.toString().trim().isEmpty
        ? null
        : {'required': true};
  }

  /// Validates that the control's value is a valid stock count.
  /// The value must be a non-negative integer less than or equal to 10000.
  static Map<String, dynamic>? validStockCount(
    AbstractControl<dynamic> control,
  ) {
    if (control.value == null || control.value.toString().isEmpty) {
      return {'required': true};
    }

    var parsed = int.tryParse(control.value) ?? 0;
    if (parsed < 0) {
      return {'min': true};
    } else if (parsed > 10000) {
      return {'max': true};
    }

    return null;
  }
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
  String? _userId = '';
  String? _boundaryName = '';
  bool _isDistributor = false;
  bool _isWareHouseMgr = false;
  List<InventoryTransportTypes>? _transportType = [];

  // Sets the initial data for the inventory.
  void setInitialData(
      {required InventoryListener inventoryListener,
      String? userId,
      required String projectId,
      required bool isDistributor,
      required bool isWareHouseMgr,
      List<InventoryTransportTypes>? transportTypes}) {
    _inventoryListener = inventoryListener;
    _projectId = projectId;
    _userId = userId;
    _transportType = transportTypes;
    _isDistributor = isDistributor;
    _isWareHouseMgr = isWareHouseMgr;
    _transportType = transportTypes;
  }

  void setBoundaryName({required String boundaryName}) {
    _boundaryName = boundaryName;
  }

  // Getters for the properties.
  get projectId => _projectId;
  get userId => _userId;
  get boundaryName => _boundaryName;
  get isDistributor => _isDistributor;
  get isWareHouseMgr => _isWareHouseMgr;
  get transportType => _transportType;

  // Fetches the facilities for a given project ID.
  Future<List<FacilityModel>?> getFacilitiesForProjectId() async {
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
