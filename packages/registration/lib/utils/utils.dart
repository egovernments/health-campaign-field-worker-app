// Importing necessary packages and modules
import 'dart:math';

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/household_type.dart';
import 'package:formula_parser/formula_parser.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration/models/entities/status.dart';

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

  static Map<String, dynamic>? sizeLessThan2(AbstractControl<dynamic> control) {
    return control.value != null && control.value.toString().length <= 2
        ? {'sizeLessThan2': true}
        : null;
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

  static Map<String, dynamic>? minPhoneNumValidation(
    AbstractControl<dynamic> control,
  ) {
    if (control.value != null &&
        control.value.toString().isNotEmpty &&
        control.value.toString().length < 9) {
      return {'minLength': true};
    }
  }
}

String maskString(String input) {
  // Define the character to use for masking (e.g., "*")
  const maskingChar = '*';

  // Create a new string with the same length as the input string
  final maskedString =
      List<String>.generate(input.length, (index) => maskingChar).join();

  return maskedString;
}

class CustomFormulaParser {
  // Modify the function to accept stringKeys as nullable
  static Map<String, dynamic> parseCondition(
    String condition,
    Map<String, dynamic> variables, {
    List<String>? stringKeys,
  } // Accept stringKeys as nullable
      ) {
    // If stringKeys is null or empty, default to FormulaParser for all conditions
    if (stringKeys == null || stringKeys.isEmpty) {
      return _parseAsFormula(condition, variables);
    }

    // Loop through stringKeys and check for string comparison in the condition
    for (var key in stringKeys) {
      if (condition.contains('$key==')) {
        // Extract the expected value after '==' for string comparison
        var value = condition.split('==')[1].trim();
        if (variables.containsKey(key) && variables[key] is String) {
          return _compareString(condition, value, variables[key]);
        }
      }
    }

    // If no string-specific comparison, use FormulaParser for numeric evaluation
    return _parseAsFormula(condition, variables);
  }

  // Handle string comparison
  static Map<String, dynamic> _compareString(
      String condition, String expectedValue, String actualValue) {
    // Compare string values directly
    bool comparisonResult = actualValue == expectedValue;
    return {'value': comparisonResult};
  }

  // Handle numeric evaluation using FormulaParser
  static Map<String, dynamic> _parseAsFormula(
      String condition, Map<String, dynamic> variables) {
    final expression = FormulaParser(
      condition,
      variables,
    );
    final error = expression.parse;
    return error; // Parsing the numeric expression
  }
}

class Coordinate {
  final double? latitude;
  final double? longitude;

  Coordinate(this.latitude, this.longitude);
}

double? calculateDistance(Coordinate? start, Coordinate? end) {
  const double earthRadius = 6371.0; // Earth's radius in kilometers

  double toRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  if (start?.latitude != null &&
      start?.longitude != null &&
      end?.latitude != null &&
      end?.longitude != null) {
    double lat1Rad = toRadians(start!.latitude!);
    double lon1Rad = toRadians(start.longitude!);
    double lat2Rad = toRadians(end!.latitude!);
    double lon2Rad = toRadians(end.longitude!);

    double dLat = lat2Rad - lat1Rad;
    double dLon = lon2Rad - lon1Rad;

    double a = pow(sin(dLat / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    double distance = earthRadius * c;

    return distance;
  }

  return null;
}

// create a singleton class for RegistrationDelivery package where set data and get data methods are defined

class RegistrationDeliverySingleton {
  static final RegistrationDeliverySingleton _singleton =
      RegistrationDeliverySingleton._internal();

  factory RegistrationDeliverySingleton() {
    return _singleton;
  }

  RegistrationDeliverySingleton._internal();

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
  List<String>? _genderOptions;
  List<String>? _idTypeOptions;
  List<String>? _householdDeletionReasonOptions;
  List<String>? _householdMemberDeletionReasonOptions;

  List<String>? _searchHouseHoldFilter, _searchCLFFilters;

  List<String>? _houseStructureTypes;

  HouseholdType? _householdType;

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
    required List<String>? genderOptions,
    required List<String>? idTypeOptions,
    required List<String>? householdDeletionReasonOptions,
    required List<String>? householdMemberDeletionReasonOptions,
    required List<String>? searchHouseHoldFilter,
    required List<String>? searchCLFFilters,
    required List<String>? houseStructureTypes,
    required UserModel? loggedInUser,
  }) {
    _loggedInUserUuid = loggedInUserUuid;
    _maxRadius = maxRadius;
    _projectId = projectId;
    _beneficiaryType = selectedBeneficiaryType;
    _projectType = projectType;
    _selectedProject = selectedProject;
    _genderOptions = genderOptions;
    _idTypeOptions = idTypeOptions;
    _householdDeletionReasonOptions = householdDeletionReasonOptions;
    _householdMemberDeletionReasonOptions =
        householdMemberDeletionReasonOptions;

    _searchHouseHoldFilter = searchHouseHoldFilter;
    _searchCLFFilters = searchCLFFilters;

    _houseStructureTypes = houseStructureTypes;

    _loggedInUser = loggedInUser;
  }

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setHouseholdType(HouseholdType? householdType) {
    _householdType = householdType;
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

  List<String>? get genderOptions => _genderOptions;

  List<String>? get idTypeOptions => _idTypeOptions;

  List<String>? get householdDeletionReasonOptions =>
      _householdDeletionReasonOptions;

  List<String>? get householdMemberDeletionReasonOptions =>
      _householdMemberDeletionReasonOptions;

  List<String>? get searchHouseHoldFilter => _searchHouseHoldFilter;

  List<String>? get searchCLFFilters => _searchCLFFilters;

  List<String>? get houseStructureTypes => _houseStructureTypes;

  UserModel? get loggedInUser => _loggedInUser;

  HouseholdType? get householdType => _householdType;
}

String getStatus(String selectedFilter) {
  final statusMap = {
    Status.closeHousehold.toValue(): Status.closeHousehold,
    Status.registered.toValue(): Status.registered,
    Status.notRegistered.toValue(): Status.notRegistered,
  };

  var mappedStatus = statusMap.entries
      .where((element) => element.value.name == selectedFilter)
      .first
      .key;
  if (mappedStatus != null) {
    return mappedStatus;
  } else {
    return selectedFilter;
  }
}
