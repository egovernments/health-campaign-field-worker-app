// create a singleton class for RegistrationDelivery package where set data and get data methods are defined

import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/templates/template_config.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:flutter/material.dart';

import 'function_registry.dart';

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

/// TODO: WILL REMOVE THIS FUNCTION ALSO : TEMPORARY
Map<String, dynamic> transformJson(Map<String, dynamic> inputJson) {
  try {
    final transformed = <String, dynamic>{
      'name': inputJson['name'],
      'version': inputJson['version'],
      'pages': <String, dynamic>{},
      'summary': inputJson['summary'],
      'templates': <String, dynamic>{},
    };

    for (final page in inputJson['pages'] as List<dynamic>) {
      final pageMap = page as Map<String, dynamic>;
      final pageKey = pageMap['page'];
      final type = pageMap['type'];

      final Map<String, dynamic> properties = {};

      for (final prop in pageMap['properties'] as List<dynamic>) {
        final property = prop as Map<String, dynamic>;
        final fieldName = property['fieldName'];
        if (fieldName != null) {
          properties[fieldName] = Map<String, dynamic>.from(property);
        }
      }

      final transformedPage = <String, dynamic>{
        'label': pageMap['label'],
        'order': pageMap['order'],
        'type': pageMap['type'],
        'format': pageMap['format'],
        'description': pageMap['description'],
        'actionLabel': pageMap['actionLabel'],
        'properties': properties,
        'value': pageMap['value'],
        'required': pageMap['required'],
        'hidden': pageMap['hidden'],
        'helpText': pageMap['helpText'],
        'innerLabel': pageMap['innerLabel'],
        'validations': pageMap['validations'],
        'tooltip': pageMap['tooltip'],
        'startDate': pageMap['startDate'],
        'endDate': pageMap['endDate'],
        'readOnly': pageMap['readOnly'],
        'charCount': pageMap['charCount'],
        'systemDate': pageMap['systemDate'],
        'isMultiSelect': pageMap['isMultiSelect'],
        'includeInForm': pageMap['includeInForm'],
        'includeInSummary': pageMap['includeInSummary'],
        'autoEnable': pageMap['autoEnable'],
        'prefixText': pageMap['prefixText'],
        'suffixText': pageMap['suffixText'],
        'navigateTo': pageMap['navigateTo'] is Map<String, dynamic>
            ? pageMap['navigateTo']
            : null,
        'showAlertPopUp': pageMap['showAlertPopUp']
      };

      if (type == 'template') {
        (transformed['templates'] as Map<String, dynamic>)[pageKey] =
            transformedPage;
      } else {
        (transformed['pages'] as Map<String, dynamic>)[pageKey] =
            transformedPage;
      }
    }

    return transformed;
  } catch (e, stackTrace) {
    // Log and rethrow to propagate error to the outer try-catch
    debugPrint('Error inside transformJson: $e');
    debugPrint('$stackTrace');
    rethrow;
  }
}

String? resolveValue(dynamic value, dynamic contextData) {
  if (value is String) {
    final interpolationRegex = RegExp(r'^\{\{(.+?)\}\}$');
    final match = interpolationRegex.firstMatch(value.trim());
    if (match != null) {
      var path = match.group(1)!.trim();
      if (path.startsWith('contextData.')) {
        path = path.substring('contextData.'.length);
      }
      if (path.startsWith('item.')) {
        path = path.substring('item.'.length);
      }
      if (path.startsWith('fn')) {
        final fnRegex = RegExp(r'\{\{\s*fn:(\w+)\((.*?)\)\s*\}\}');
        value = value.replaceAllMapped(fnRegex, (match) {
          final fnName = match.group(1)!;
          final argsExpr = match.group(2) ?? '';

          final resolvedArgs = argsExpr.trim().isEmpty
              ? <dynamic>[]
              : argsExpr.split(',').map((rawArg) {
                  final trimmed = rawArg.trim();
                  final placeholder = '{{ $trimmed }}';
                  return resolveValue(placeholder, contextData);
                }).toList();

          return FunctionRegistry.call(
                  fnName, resolvedArgs, CrudStateData({}, []))?.toString() ??
              '';
        });
        return value;
      }
      return _resolvePath(contextData, path);
    }
    return value;
  }
  return value?.toString();
}

/// Utility to resolve "contextData.householdModel.clientReferenceId" like paths
String? _resolvePath(dynamic root, String path) {
  var parts = path.split('.');

  dynamic current = root;
  for (var part in parts) {
    // Handle array index like members[0]
    final listMatch = RegExp(r'^(\w+)\[(\d+)\]$').firstMatch(part);
    if (listMatch != null) {
      final key = listMatch.group(1)!;
      final index = int.parse(listMatch.group(2)!);

      if (current is Map<String, dynamic> && current.containsKey(key)) {
        final listVal = current[key];
        if (listVal is List && index < listVal.length) {
          current = listVal[index];
        } else {
          return null;
        }
      } else {
        return null;
      }
    }
    // Normal map lookup
    else if (current is Map<String, dynamic>) {
      if (!current.containsKey(part)) return null;
      current = current[part];
    }
    // List access
    else if (current is List) {
      final idx = int.tryParse(part);
      if (idx != null) {
        if (idx < 0 || idx >= current.length) return null;
        current = current[idx];
      } else {
        dynamic foundItem;
        for (var item in current) {
          try {
            final typeString = item.runtimeType.toString().toLowerCase();
            if (typeString == part.toLowerCase()) {
              foundItem = item;
              break;
            }
          } catch (e) {
            // Ignore
          }
        }

        if (foundItem != null) {
          current = foundItem;
        } else {
          return null;
        }
      }
    }
    // EntityModel access
    else if (current is EntityModel) {
      final map = current.toMap();
      if (map.containsKey(part)) {
        current = map[part];
      } else {
        return null;
      }
    }
    // If it's an object (like EntityModel), try .toJson()
    else {
      try {
        if (current.toJson() is Map<String, dynamic>) {
          final map = current.toJson() as Map<String, dynamic>;
          current = map[part];
        } else {
          return null;
        }
      } catch (_) {
        return null;
      }
    }
  }
  return current?.toString();
}

Map<String, dynamic> flattenFormData(Map<String, dynamic> data,
    {String parentKey = ''}) {
  final Map<String, dynamic> flatMap = {};

  data.forEach((key, value) {
    final newKey = parentKey.isEmpty ? key : '$parentKey.$key';

    if (value is Map<String, dynamic>) {
      // Recursively flatten nested maps
      flatMap.addAll(flattenFormData(value, parentKey: newKey));
    } else {
      // Replace null with empty string
      flatMap[newKey] = value ?? '';
    }
  });

  return flatMap;
}
