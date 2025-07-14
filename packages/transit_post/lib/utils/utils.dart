import 'package:digit_data_model/models/entities/boundary.dart';
import 'package:digit_data_model/models/entities/project_product_variant.dart';
import 'package:digit_data_model/utils/utils.dart';

class TransitPostSingleton {
  static final TransitPostSingleton _singleton =
      TransitPostSingleton._internal();

  factory TransitPostSingleton() {
    return _singleton;
  }

  TransitPostSingleton._internal();

  PersistenceConfiguration? _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  List<ProjectProductVariantModel>? _resources;
  List<String>? _transitPostType;
  String? _tenantId;
  String? _loggedInUserUuid;
  String? _projectId;
  BoundaryModel? _boundaryModel;
  int? _minAge;
  int? _maxAge;

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  void setPersistenceConfiguration(
      {required PersistenceConfiguration persistenceConfiguration}) {
    _persistenceConfiguration = persistenceConfiguration;
  }

  void setInitialData({
    required List<ProjectProductVariantModel>? resources,
    required List<String>? transitPostType,
    required String loggedInUserUuid,
    required String projectId,
    int? minAge,
    int? maxAge,
  }) {
    _resources = resources;
    _loggedInUserUuid = loggedInUserUuid;
    _projectId = projectId;
    _minAge = minAge;
    _maxAge = maxAge;
    _transitPostType = transitPostType;
  }

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  PersistenceConfiguration? get persistenceConfiguration =>
      _persistenceConfiguration;

  List<ProjectProductVariantModel>? get resources => _resources;
  String? get loggedInUserUuid => _loggedInUserUuid;
  String? get projectId => _projectId;
  String? get tenantId => _tenantId;
  BoundaryModel? get boundary => _boundaryModel;
  int? get minAge => _minAge;
  int? get maxAge => _maxAge;
  List<String>? get transitPostType => _transitPostType;
}
