import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:reactive_forms/reactive_forms.dart';

export 'extensions/extensions.dart';

//singleton class for complaints operations
class ComplaintsSingleton {
  static final ComplaintsSingleton _singleton = ComplaintsSingleton._internal();

  // Factory constructor that returns the singleton instance.
  factory ComplaintsSingleton() {
    return _singleton;
  }

  //Private constructor for the singleton pattern
  ComplaintsSingleton._internal();

  //various properties related to the Complaints
  String? _tenantId = '';
  String? _loggedInUserUuid = '';
  String? _userMobileNumber = '';
  String? _loggedInUserName = '';

  List<String>? _complaintTypes;
  BoundaryModel? _boundaryModel;
  String? _userName = '';

  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  Map<String, TemplateConfig>? _templateConfigs;
  String? _complaintConfig;

  void setInitialData({
    String? tenantId,
    String? loggedInUserUuid,
    String? userMobileNumber,
    String? loggedInUserName,
    List<String>? complaintTypes,
    String? userName,
  }) {
    _tenantId = tenantId;
    _loggedInUserUuid = loggedInUserUuid;
    _userMobileNumber = userMobileNumber;
    _loggedInUserName = loggedInUserName;

    _complaintTypes = complaintTypes;
    _userName = userName;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }

  void setTenantId({required String tenantId}) {
    _tenantId = tenantId;
  }

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  void setTemplateConfigs(Map<String, TemplateConfig> templateConfigs) {
    _templateConfigs = templateConfigs;
  }

  void setComplaintConfig(String complaintConfig) {
    _complaintConfig = complaintConfig;
  }

  get tenantId => _tenantId;
  get loggedInUserUuid => _loggedInUserUuid;
  get userMobileNumber => _userMobileNumber;
  get loggedInUserName => _loggedInUserName;
  get complaintTypes => _complaintTypes;
  get persistenceConfiguration => _persistenceConfiguration;

  get boundary => _boundaryModel;
  get userName => _userName;

  Map<String, TemplateConfig>? get templateConfigs => _templateConfigs;

  String? get complaintConfig => _complaintConfig;
}

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

  static Map<String, dynamic>? validMobileNumber(
    AbstractControl<dynamic> control,
  ) {
    if (control.value == null || control.value.toString().isEmpty) {
      return null;
    }

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    if (RegExp(pattern).hasMatch(control.value.toString())) return null;

    if (control.value.toString().length < 10) return {'mobileNumber': true};

    return {'mobileNumber': true};
  }
}
