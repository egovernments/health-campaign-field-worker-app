// Importing necessary packages and modules
import 'package:digit_data_model/data_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../models/entities/inventory_transport_type.dart';

/// This class contains custom validators for form controls.
class CustomValidator {
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

  // Various properties related to the inventory.
  String _projectId = '';
  UserModel? _loggedInUser;
  String? _loggedInUserUuid = '';
  String? _boundaryName = '';
  BoundaryModel? _boundaryModel;
  String? _tenantId = '';
  bool _isDistributor = false;
  bool _isWareHouseMgr = false;
  List<InventoryTransportTypes>? _transportType = [];
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  // Sets the initial data for the inventory.
  void setInitialData({
    String? loggedInUserUuid,
    required String projectId,
    required bool isDistributor,
    required bool isWareHouseMgr,
    List<InventoryTransportTypes>? transportTypes,
    UserModel? loggedInUser,
  }) {
    _projectId = projectId;
    _loggedInUserUuid = loggedInUserUuid;
    _transportType = transportTypes;
    _isDistributor = isDistributor;
    _isWareHouseMgr = isWareHouseMgr;
    _transportType = transportTypes;
    _loggedInUser = loggedInUser;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }

  void setBoundaryName({required String boundaryName}) {
    _boundaryName = boundaryName;
  }

  void setTenantId({required String tenantId}) {
    _tenantId = tenantId;
  }

  // Getters for the properties.
  get projectId => _projectId;
  get loggedInUserUuid => _loggedInUserUuid;
  get boundaryName => _boundaryName;
  BoundaryModel? get boundary => _boundaryModel;
  get isDistributor => _isDistributor;
  get isWareHouseMgr => _isWareHouseMgr;
  get transportType => _transportType;
  get tenantId => _tenantId;
  get persistenceConfiguration => _persistenceConfiguration;
  UserModel? get loggedInUser => _loggedInUser;
}
