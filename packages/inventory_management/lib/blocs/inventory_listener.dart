import '../models/entities/inventory_facility.dart';

abstract class InventoryListener {
  void fetchFacilitiesForProjectId(
      Function(List<InventoryFacilityModel> facilitiesModel) facilities);

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

  void setInitialData(
      {required InventoryListener inventoryListener,
      required String userId,
      required String projectId,
      required String appVersion}) {
    _inventoryListener = inventoryListener;
    _projectId = projectId;
    _userId = userId;
    _appVersion = appVersion;
  }

  get projectId => _projectId;
  get userId => _userId;
  get appVersion => _appVersion;

  void getFacilitiesForProjectId(
      Function(List<InventoryFacilityModel> facilitiesModel) facilities) {
    _inventoryListener?.fetchFacilitiesForProjectId(facilities);
  }

  void callSync() {
    _inventoryListener?.callSyncMethod();
  }
}
