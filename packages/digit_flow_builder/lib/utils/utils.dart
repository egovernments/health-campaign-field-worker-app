// create a singleton class for RegistrationDelivery package where set data and get data methods are defined

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/templates/template_config.dart';

class FlowBuilderSingleton {
  static final FlowBuilderSingleton _singleton =
      FlowBuilderSingleton._internal();

  factory FlowBuilderSingleton() {
    return _singleton;
  }

  FlowBuilderSingleton._internal();

  String? _tenantId;
  String? _loggedInUserUuid;
  UserModel? _loggedInUser;
  double? _maxRadius;
  String? _projectId;
  BeneficiaryType? _beneficiaryType;
  ProjectTypeModel? _projectType;
  ProjectModel? _selectedProject;
  BoundaryModel? _boundaryModel;
  PersistenceConfiguration? _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration
  Map<String, TemplateConfig>? _templateConfigs;

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  void setPersistenceConfiguration(
      {required PersistenceConfiguration persistenceConfiguration}) {
    _persistenceConfiguration = persistenceConfiguration;
  }

  void setInitialData({
    required String loggedInUserUuid,
    required double maxRadius,
    required String projectId,
    required BeneficiaryType selectedBeneficiaryType,
    required ProjectTypeModel? projectType,
    required ProjectModel selectedProject,
    required UserModel? loggedInUser,
  }) {
    _loggedInUserUuid = loggedInUserUuid;
    _maxRadius = maxRadius;
    _projectId = projectId;
    _beneficiaryType = selectedBeneficiaryType;
    _projectType = projectType;
    _selectedProject = selectedProject;
    _loggedInUser = loggedInUser;
  }

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setTemplateConfigs(Map<String, TemplateConfig> templateConfigs) {
    _templateConfigs = templateConfigs;
  }

  String? get tenantId => _tenantId;

  String? get loggedInUserUuid => _loggedInUserUuid;

  double? get maxRadius => _maxRadius;

  String? get projectId => _projectId;

  BeneficiaryType? get beneficiaryType => _beneficiaryType;

  ProjectTypeModel? get projectType => _projectType;

  ProjectModel? get selectedProject => _selectedProject;

  BoundaryModel? get boundary => _boundaryModel;

  PersistenceConfiguration? get persistenceConfiguration =>
      _persistenceConfiguration;

  UserModel? get loggedInUser => _loggedInUser;

  Map<String, TemplateConfig>? get templateConfigs => _templateConfigs;
}
