import 'dart:ffi';

import 'package:digit_data_model/data_model.dart';

// Singleton class for managing survey_form operations
class SurveyFormSingleton {
  static final SurveyFormSingleton _singleton = SurveyFormSingleton._internal();

  factory SurveyFormSingleton() {
    return _singleton;
  }

  SurveyFormSingleton._internal();

  String _projectId = '';
  String _projectName = '';
  String _loggedInIndividualId = '';
  String _loggedInUserUuid = '';
  String _appVersion = '';
  String _tenantId = '';
  Object _roles = [];
  BoundaryModel? _boundaryModel;
  PersistenceConfiguration _persistenceConfiguration = PersistenceConfiguration
      .offlineFirst; // Default to offline first persistence configuration

  void setBoundary({required BoundaryModel boundary}) {
    _boundaryModel = boundary;
  }

  // Method to set survey_form listeners and other information
  void setInitialData(
      {required String projectId,
      required String projectName,
      required String loggedInIndividualId,
      required String loggedInUserUuid,
      required String appVersion,
      required Object roles}) {
    _projectId = projectId;
    _projectName = projectName;
    _loggedInIndividualId = loggedInIndividualId;
    _loggedInUserUuid = loggedInUserUuid;
    _appVersion = appVersion;
    _roles = roles;
  }

  get projectId => _projectId;

  get projectName => _projectName;

  get loggedInIndividualId => _loggedInIndividualId;

  get loggedInUserUuid => _loggedInUserUuid;

  get appVersion => _appVersion;

  get tenantId => _tenantId;

  get persistenceConfiguration => _persistenceConfiguration;

  get roles => _roles;

  BoundaryModel? get boundary => _boundaryModel;

  void setTenantId(String tenantId) {
    _tenantId = tenantId;
  }

  void setPersistenceConfiguration(PersistenceConfiguration configuration) {
    _persistenceConfiguration = configuration;
  }
}

bool getSelectionType(AttributesModel model) {
  // Check if additionalFields is not null
  if (model.additionalFields != null) {
    // Loop through the fields to find the key 'selectionType'
    for (var field in model.additionalFields!.fields) {
      if (field.key == 'selectionType') {
        return field.value == 'multiple';
      }
    }
  }
  return false;
}

bool isSelectionCard(AttributesModel model) {
  // Check if additionalFields is not null
  if (model.additionalFields != null) {
    // Loop through the fields to find the key 'selectionType'
    for (var field in model.additionalFields!.fields) {
      if (field.key == 'widgetType') {
        return field.value == 'selectionCard';
      }
    }
  }
  return false;
}


List<String> getOptionLabels(AttributesModel model) {
  if (model.additionalFields != null) {
    for (var field in model.additionalFields!.fields) {
      if (field.value is Map && field.value.containsKey('options')) {
        var options = field.value['options'] as List;
        return options.map((option) => option['label'].toString()).toList();
      }
    }
  }
  // Return default values if no options are found
  return ['CORE_COMMON_YES', 'CORE_COMMON_NO'];
}

List<AttributesModel>? filterAttributesWithCondition({
  required List<AttributesModel>? attributes,
  DateTime? age,
  String? gender,
  bool? isChild,
}) {
  if (attributes == null) return [];

  return attributes.where((attribute) {
    var additionalFields = attribute.additionalFields?.fields;

    if (additionalFields is List) {
      var regexField = additionalFields?.firstWhere(
            (field) => field.key == "regexValue",
        orElse: () => const AdditionalField("", ""),
      );
      if (regexField?.value != "") {
        String condition = regexField?.value ?? "";
        return matchConditionWithUserData(
          condition: condition,
          age: age,
          gender: gender,
          isChild: isChild ?? false,
        );
      }
    }
    // If no regex condition exists, include the attribute by default
    return true;
  }).toList();
}


bool matchConditionWithUserData({
  required String condition,
  DateTime? age,
  String? gender,
  bool isChild = false,
}) {
  // Helper function to extract numeric age in months
  int getAgeInMonths(DateTime? birthDate) {
    if (birthDate == null) return 0;
    final now = DateTime.now();
    return (now.year - birthDate.year) * 12 + (now.month - birthDate.month);
  }

  // Replace actual values into the condition string
  final ageInMonths = getAgeInMonths(age);

  // Process the condition (logical AND/OR support)
  condition = condition.replaceAll('&&', ' && ').replaceAll('||', ' || ');
  final tokens = condition.split(' ');

  bool evaluateExpression(String exp) {
    final match = RegExp(r'(isChild|age|gender)([=!<>]+)(\w+)').firstMatch(exp);
    if (match == null) return false;

    final field = match.group(1);
    final operator = match.group(2);
    final value = match.group(3);

    if (field == 'isChild') {
      bool expected = value == 'true';
      return operator == '==' ? (isChild == expected) : (isChild != expected);
    }

    if (field == 'age') {
      int requiredAge = int.tryParse(value!.replaceAll(RegExp(r'\D'), '')) ?? 0;
      if (value.contains('month')) requiredAge *= 1;
      if (value.contains('year')) requiredAge *= 12;

      if (operator == '>=') return ageInMonths >= requiredAge;
      if (operator == '<=') return ageInMonths <= requiredAge;
      if (operator == '>') return ageInMonths > requiredAge;
      if (operator == '<') return ageInMonths < requiredAge;
      if (operator == '==') return ageInMonths == requiredAge;
    }

    if (field == 'gender') {
      return operator == '==' ? (gender == value) : (gender != value);
    }

    return false;
  }

  bool result = evaluateExpression(tokens.first);

  for (int i = 1; i < tokens.length - 1; i += 2) {
    final op = tokens[i];
    final nextCondition = evaluateExpression(tokens[i + 1]);

    if (op == '&&') {
      result = result && nextCondition;
    } else if (op == '||') {
      result = result || nextCondition;
    }
  }

  return result;
}


