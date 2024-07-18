
// create a singleton class for Closed Household package where set data and get data methods are defined

import 'package:digit_data_model/models/entities/boundary.dart';
import 'package:digit_data_model/utils/utils.dart';

class ClosedHouseholdSingleton {
  static final ClosedHouseholdSingleton _singleton =
  ClosedHouseholdSingleton._internal();

  factory ClosedHouseholdSingleton() {
    return _singleton;
  }

  ClosedHouseholdSingleton._internal();

  String? _tenantId;
  String? _loggedInUserUuid;
  String? _projectId;
  BoundaryModel? _boundaryModel;
  PersistenceConfiguration? _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  void setPersistenceConfiguration(
      {required PersistenceConfiguration persistenceConfiguration}) {
    _persistenceConfiguration = persistenceConfiguration;
  }

  void setInitialData({
    required String loggedInUserUuid,
    required String projectId,
  }) {
    _loggedInUserUuid = loggedInUserUuid;
    _projectId = projectId;
  }

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  String? get tenantId => _tenantId;
  String? get loggedInUserUuid => _loggedInUserUuid;
  String? get projectId => _projectId;
  PersistenceConfiguration? get persistenceConfiguration =>
      _persistenceConfiguration;
  BoundaryModel? get boundary => _boundaryModel;
}