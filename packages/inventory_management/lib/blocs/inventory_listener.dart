import 'package:inventory_management/models/entities/product_variant.dart';

import '../models/entities/inventory_facility.dart';
import '../models/entities/stock.dart';
import '../utils/utils.dart';

abstract class InventoryListener {
  void fetchFacilitiesForProjectId(
      Function(List<InventoryFacilityModel> facilitiesModel) facilities);

  void fetchProductVariants(
      Function(List<ProductVariantModel> productVariantsModel) productVariants);

  void saveStockDetails(SaveStockDetails saveStockDetails);

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

  void getFacilitiesForProjectId(
      Function(List<InventoryFacilityModel> facilitiesModel) facilities) {
    _inventoryListener?.fetchFacilitiesForProjectId(facilities);
  }

  void getProductVariants(
      Function(List<ProductVariantModel> productVariantsModel)
          productVariants) {
    _inventoryListener?.fetchProductVariants(productVariants);
  }

  void saveStockDetails(SaveStockDetails saveStockDetails) {
    _inventoryListener?.saveStockDetails(saveStockDetails);
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
