// create a singleton class for Closed Household package where set data and get data methods are defined

import 'package:digit_data_model/data_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
}

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
  BeneficiaryType? _beneficiaryType;

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
    required BeneficiaryType beneficiaryType,
  }) {
    _loggedInUserUuid = loggedInUserUuid;
    _projectId = projectId;
    _beneficiaryType = beneficiaryType;
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
  BeneficiaryType? get beneficiaryType => _beneficiaryType;
}
