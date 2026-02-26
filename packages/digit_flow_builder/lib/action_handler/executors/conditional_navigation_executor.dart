import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../../flow_builder.dart';
import '../../router/flow_builder_routes.gm.dart';
import 'action_executor.dart';

/// Executor for CONDITIONAL_NAVIGATION action type
/// Evaluates conditions based on symptom type and additionalFields
/// and navigates to the appropriate screen
class ConditionalNavigationExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CONDITIONAL_NAVIGATION';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final conditions = action.properties['conditions'] as List<dynamic>?;

    if (conditions == null || conditions.isEmpty) {
      debugPrint('CONDITIONAL_NAVIGATION: No conditions provided');
      return contextData;
    }

    // Get current screen's state data for resolving values
    String? screenKey;
    try {
      screenKey =
          _getScreenKeyFromArgs(context) ?? AutoRouter.of(context).currentPath;
    } catch (_) {
      screenKey = null;
    }
    final currentState =
        screenKey != null ? FlowCrudStateRegistry().get(screenKey) : null;
    final stateWrapper = currentState?.stateWrapper;

    // Build evaluation context with entities from stateWrapper
    final evaluationContext = _buildEvaluationContext(
      contextData: contextData,
      stateWrapper: stateWrapper,
    );

    // Also add formData to evaluation context for easier access
    if (contextData.containsKey('formData')) {
      final formData = contextData['formData'];
      if (formData is Map) {
        evaluationContext['formData'] = formData;
        debugPrint('CONDITIONAL_NAVIGATION: formData = $formData');
      }
    }

    debugPrint(
        'CONDITIONAL_NAVIGATION: Evaluating ${conditions.length} conditions');
    debugPrint(
        'CONDITIONAL_NAVIGATION: Evaluation context keys: ${evaluationContext.keys}');

    // Evaluate each condition and find the first matching one
    for (final conditionItem in conditions) {
      if (conditionItem is! Map<String, dynamic>) continue;

      // Check for default condition
      if (conditionItem['default'] == true) {
        debugPrint('CONDITIONAL_NAVIGATION: Using default navigation');
        return _executeNavigation(
            conditionItem['navigateTo'], contextData, evaluationContext,
            context: context);
      }

      final condition = conditionItem['condition'] as String?;
      if (condition == null) continue;

      final isConditionTrue = _evaluateCondition(condition, evaluationContext);
      debugPrint(
          'CONDITIONAL_NAVIGATION: Condition "$condition" evaluated to $isConditionTrue');

      if (isConditionTrue) {
        // Check if we also need to verify additionalField is missing
        final checkAdditionalFieldMissing =
            conditionItem['checkAdditionalFieldMissing'] as String?;
        if (checkAdditionalFieldMissing != null) {
          final isFieldMissing = _isAdditionalFieldMissing(
              contextData, checkAdditionalFieldMissing);
          debugPrint(
              'CONDITIONAL_NAVIGATION: additionalField "$checkAdditionalFieldMissing" missing = $isFieldMissing');
          if (!isFieldMissing) {
            // Field exists, skip this condition
            continue;
          }
        }

        debugPrint('CONDITIONAL_NAVIGATION: Condition matched, navigating');
        return _executeNavigation(
            conditionItem['navigateTo'], contextData, evaluationContext,
            context: context);
      }
    }

    debugPrint('CONDITIONAL_NAVIGATION: No condition matched');
    return contextData;
  }

  /// Build evaluation context from contextData and stateWrapper
  Map<String, dynamic> _buildEvaluationContext({
    required Map<String, dynamic> contextData,
    List<dynamic>? stateWrapper,
  }) {
    final evalContext = Map<String, dynamic>.from(contextData);

    debugPrint('CONDITIONAL_NAVIGATION: Building evaluation context');
    debugPrint('CONDITIONAL_NAVIGATION: contextData keys: ${contextData.keys}');

    // PRIORITY 1: Check existingModels first (from REVERSE_TRANSFORM)
    // This contains actual EntityModel instances with correct field names
    if (contextData.containsKey('existingModels')) {
      final existingModels = contextData['existingModels'];
      if (existingModels is List && existingModels.isNotEmpty) {
        debugPrint(
            'CONDITIONAL_NAVIGATION: Found ${existingModels.length} existingModels');
        for (int i = 0; i < existingModels.length; i++) {
          final model = existingModels[i];
          if (model is EntityModel) {
            final typeName = getEntityTypeName(model);
            final modelMap = model.toMap();
            evalContext['$i.$typeName'] = modelMap;
            if (i == 0) {
              evalContext[typeName] = modelMap;
            }
            debugPrint(
                'CONDITIONAL_NAVIGATION: Added $i.$typeName from existingModels');
            debugPrint(
                'CONDITIONAL_NAVIGATION: $typeName.symptom = ${modelMap['symptom']}');
            debugPrint(
                'CONDITIONAL_NAVIGATION: $typeName.additionalFields = ${modelMap['additionalFields']}');
          }
        }
      }
    }

    // PRIORITY 2: Extract from 'item' key (current item in list views/templates)
    if (contextData.containsKey('item')) {
      final item = contextData['item'];
      if (item is Map) {
        item.forEach((entityType, entityData) {
          // Only add if not already present from existingModels
          final key0 = '0.$entityType';
          if (!evalContext.containsKey(key0)) {
            final mapData = _entityToMap(entityData);
            evalContext[key0] = mapData;
            evalContext[entityType.toString()] = mapData;
            debugPrint('CONDITIONAL_NAVIGATION: Added $key0 from item');
          }
        });
      } else if (item is EntityModel) {
        final typeName = getEntityTypeName(item);
        final key0 = '0.$typeName';
        if (!evalContext.containsKey(key0)) {
          final modelMap = item.toMap();
          evalContext[key0] = modelMap;
          evalContext[typeName] = modelMap;
          debugPrint(
              'CONDITIONAL_NAVIGATION: Added $key0 from item (EntityModel)');
        }
      }
    }

    // PRIORITY 3: Extract from 'wrappers' key
    if (contextData.containsKey('wrappers')) {
      final wrappers = contextData['wrappers'];
      if (wrappers is List && wrappers.isNotEmpty) {
        for (int i = 0; i < wrappers.length; i++) {
          final wrapper = wrappers[i];
          if (wrapper is Map) {
            wrapper.forEach((entityType, entityData) {
              final keyI = '$i.$entityType';
              if (!evalContext.containsKey(keyI)) {
                final mapData = _entityToMap(entityData);
                evalContext[keyI] = mapData;
                if (i == 0) {
                  evalContext[entityType.toString()] = mapData;
                }
                debugPrint('CONDITIONAL_NAVIGATION: Added $keyI from wrappers');
              }
            });
          } else if (wrapper is EntityModel) {
            final typeName = getEntityTypeName(wrapper);
            final keyI = '$i.$typeName';
            if (!evalContext.containsKey(keyI)) {
              final modelMap = wrapper.toMap();
              evalContext[keyI] = modelMap;
              if (i == 0) {
                evalContext[typeName] = modelMap;
              }
              debugPrint(
                  'CONDITIONAL_NAVIGATION: Added $keyI from wrappers (EntityModel)');
            }
          }
        }
      }
    }

    // PRIORITY 4: Add stateWrapper entities
    if (stateWrapper != null && stateWrapper.isNotEmpty) {
      for (int i = 0; i < stateWrapper.length; i++) {
        final item = stateWrapper[i];
        if (item is Map) {
          item.forEach((entityType, entityData) {
            final keyI = '$i.$entityType';
            if (!evalContext.containsKey(keyI)) {
              final mapData = _entityToMap(entityData);
              evalContext[keyI] = mapData;
              if (i == 0) {
                evalContext[entityType.toString()] = mapData;
              }
              debugPrint(
                  'CONDITIONAL_NAVIGATION: Added $keyI from stateWrapper');
            }
          });
        } else if (item is EntityModel) {
          final typeName = getEntityTypeName(item);
          final keyI = '$i.$typeName';
          if (!evalContext.containsKey(keyI)) {
            final modelMap = item.toMap();
            evalContext[keyI] = modelMap;
            if (i == 0) {
              evalContext[typeName] = modelMap;
            }
            debugPrint(
                'CONDITIONAL_NAVIGATION: Added $keyI from stateWrapper (EntityModel)');
          }
        }
      }
    }

    debugPrint(
        'CONDITIONAL_NAVIGATION: Final evalContext keys: ${evalContext.keys}');
    return evalContext;
  }

  /// Convert entity to map if it's an EntityModel
  dynamic _entityToMap(dynamic entity) {
    if (entity is EntityModel) {
      final map = entity.toMap();
      debugPrint(
          'CONDITIONAL_NAVIGATION: Converted EntityModel to map with keys: ${map.keys}');
      return map;
    }
    if (entity is Map) {
      return Map<String, dynamic>.from(entity);
    }
    return entity;
  }

  /// Evaluate a condition string against the context
  bool _evaluateCondition(String condition, Map<String, dynamic> context) {
    // Handle complex conditions with symptom type and additionalFields checks
    // Format: "0.HFReferralModel.additionalFields.fields.feverQ1==null&&0.HFReferralModel.symptom==FEVER"

    // Split by && for AND conditions
    if (condition.contains('&&')) {
      final parts = condition.split('&&').map((p) => p.trim()).toList();
      return parts.every((part) => _evaluateSingleCondition(part, context));
    }

    // Split by || for OR conditions
    if (condition.contains('||')) {
      final parts = condition.split('||').map((p) => p.trim()).toList();
      return parts.any((part) => _evaluateSingleCondition(part, context));
    }

    return _evaluateSingleCondition(condition, context);
  }

  /// Evaluate a single condition (no && or ||)
  bool _evaluateSingleCondition(
      String condition, Map<String, dynamic> context) {
    // Handle == comparison
    if (condition.contains('==')) {
      final parts = condition.split('==').map((p) => p.trim()).toList();
      if (parts.length == 2) {
        final leftPath = parts[0];
        final expectedValue = parts[1];

        final actualValue = _resolvePathValue(leftPath, context);
        debugPrint(
            'CONDITIONAL_NAVIGATION: Comparing path "$leftPath" (value: $actualValue) == $expectedValue');

        // Handle null comparison
        if (expectedValue == 'null') {
          return actualValue == null;
        }

        return actualValue?.toString() == expectedValue;
      }
    }

    // Handle != comparison
    if (condition.contains('!=')) {
      final parts = condition.split('!=').map((p) => p.trim()).toList();
      if (parts.length == 2) {
        final leftPath = parts[0];
        final expectedValue = parts[1];

        final actualValue = _resolvePathValue(leftPath, context);
        debugPrint(
            'CONDITIONAL_NAVIGATION: Comparing path "$leftPath" (value: $actualValue) != $expectedValue');

        // Handle null comparison
        if (expectedValue == 'null') {
          return actualValue != null;
        }

        return actualValue?.toString() != expectedValue;
      }
    }

    // Handle additionalFields.hasKey(KEY) pattern
    final hasKeyMatch =
        RegExp(r'additionalFields\.hasKey\(([^)]+)\)').firstMatch(condition);
    if (hasKeyMatch != null) {
      final keyToFind =
          hasKeyMatch.group(1)!.replaceAll(RegExp(r'''['"]'''), '').trim();
      return _checkAdditionalFieldsHasKey(context, keyToFind);
    }

    // Handle additionalFields.hasAnyKey(KEY1,KEY2) pattern
    final hasAnyKeyMatch =
        RegExp(r'additionalFields\.hasAnyKey\(([^)]+)\)').firstMatch(condition);
    if (hasAnyKeyMatch != null) {
      final keysStr = hasAnyKeyMatch.group(1)!;
      final keys = keysStr
          .split(',')
          .map((k) => k.replaceAll(RegExp(r'''['"]'''), '').trim())
          .toList();
      return keys.any((key) => _checkAdditionalFieldsHasKey(context, key));
    }

    return false;
  }

  /// Resolve a dot-separated path to a value in the context
  dynamic _resolvePathValue(String path, Map<String, dynamic> context) {
    final parts = path.split('.');
    dynamic current = context;

    debugPrint(
        'CONDITIONAL_NAVIGATION: Resolving path "$path" with ${parts.length} parts');

    for (int i = 0; i < parts.length; i++) {
      final part = parts[i];
      debugPrint(
          'CONDITIONAL_NAVIGATION: Processing part "$part", current type: ${current.runtimeType}');

      if (current == null) return null;

      if (current is Map) {
        // Direct key lookup
        if (current.containsKey(part)) {
          current = current[part];
          debugPrint(
              'CONDITIONAL_NAVIGATION: Found key "$part", new value type: ${current.runtimeType}');
          continue;
        }

        // Try to find compound keys starting from current position
        // This handles keys like "0.HFReferralModel" when path is "0.HFReferralModel.symptom"
        bool foundCompound = false;
        for (int j = i + 1; j <= parts.length; j++) {
          final compoundKey = parts.sublist(i, j).join('.');
          if (current.containsKey(compoundKey)) {
            current = current[compoundKey];
            debugPrint(
                'CONDITIONAL_NAVIGATION: Found compound key "$compoundKey", new value type: ${current.runtimeType}');
            // Skip the parts we just consumed
            i = j - 1; // -1 because loop will increment
            foundCompound = true;
            break;
          }
        }
        if (foundCompound) continue;

        // Try to find a compound key with remaining path (legacy behavior)
        final remainingPath = parts.sublist(i).join('.');
        if (current.containsKey(remainingPath)) {
          return current[remainingPath];
        }

        // Special handling for additionalFields.fields.KEY pattern
        // When we're at 'fields' and current has a 'fields' key
        if (part == 'fields' && current.containsKey('fields')) {
          current = current['fields'];
          debugPrint(
              'CONDITIONAL_NAVIGATION: Accessed fields list, length: ${current is List ? current.length : 'not a list'}');
          continue;
        }

        debugPrint('CONDITIONAL_NAVIGATION: Key "$part" not found in map');
        return null;
      }

      if (current is List) {
        // Index access
        final index = int.tryParse(part);
        if (index != null && index < current.length) {
          current = current[index];
          debugPrint('CONDITIONAL_NAVIGATION: Accessed list index $index');
          continue;
        }

        // Search for AdditionalField by key (List<AdditionalField> format: [{key, value}, ...])
        dynamic found;
        for (final item in current) {
          if (item is Map && item['key'] == part) {
            found = item['value'];
            debugPrint(
                'CONDITIONAL_NAVIGATION: Found AdditionalField with key "$part", value: $found');
            break;
          }
        }

        if (found != null) {
          current = found;
          continue;
        }

        // If we're looking for a key in a List but didn't find it, return null
        // This is important for checking "field==null" conditions
        debugPrint(
            'CONDITIONAL_NAVIGATION: Key "$part" not found in additionalFields list');
        return null;
      }

      // Handle EntityModel by converting to Map
      if (current is EntityModel) {
        try {
          final map = current.toMap();
          if (map.containsKey(part)) {
            current = map[part];
            continue;
          }
        } catch (_) {}
        return null;
      }

      return null;
    }

    return current;
  }

  /// Check if additionalFields contains a specific key
  bool _checkAdditionalFieldsHasKey(Map<String, dynamic> context, String key) {
    // Search through all entities in context
    for (final contextKey in context.keys) {
      final value = context[contextKey];
      if (value is Map<String, dynamic>) {
        // Check if this map has additionalFields
        if (value.containsKey('additionalFields')) {
          final additionalFields = value['additionalFields'];
          if (_hasKeyInAdditionalFields(additionalFields, key)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  /// Check if additionalFields structure contains the given key
  bool _hasKeyInAdditionalFields(dynamic additionalFields, String key) {
    if (additionalFields == null) return false;

    if (additionalFields is Map) {
      // Check direct key
      if (additionalFields.containsKey(key)) return true;

      // Check in fields list
      if (additionalFields.containsKey('fields')) {
        final fields = additionalFields['fields'];
        if (fields is List) {
          for (final field in fields) {
            if (field is Map && field['key'] == key) {
              return field['value'] != null;
            }
          }
        }
      }
    }

    return false;
  }

  /// Check if an additionalField key is missing from all entities in contextData
  bool _isAdditionalFieldMissing(
      Map<String, dynamic> contextData, String fieldKey) {
    // Check existingModels for additionalFields
    if (contextData.containsKey('existingModels')) {
      final existingModels = contextData['existingModels'];
      if (existingModels is List) {
        for (final model in existingModels) {
          if (model is EntityModel) {
            final modelMap = model.toMap();
            final additionalFields = modelMap['additionalFields'];
            if (additionalFields != null && additionalFields is Map) {
              final fields = additionalFields['fields'];
              if (fields is List) {
                for (final field in fields) {
                  if (field is Map &&
                      field['key'] == fieldKey &&
                      field['value'] != null) {
                    debugPrint(
                        'CONDITIONAL_NAVIGATION: Found additionalField "$fieldKey" with value: ${field['value']}');
                    return false; // Field exists with a value
                  }
                }
              }
            }
          }
        }
      }
    }

    // Check item for additionalFields
    if (contextData.containsKey('item')) {
      final item = contextData['item'];
      if (item is Map) {
        for (final entityData in item.values) {
          if (entityData is EntityModel) {
            final modelMap = entityData.toMap();
            final additionalFields = modelMap['additionalFields'];
            if (additionalFields != null && additionalFields is Map) {
              final fields = additionalFields['fields'];
              if (fields is List) {
                for (final field in fields) {
                  if (field is Map &&
                      field['key'] == fieldKey &&
                      field['value'] != null) {
                    return false;
                  }
                }
              }
            }
          }
        }
      }
    }

    debugPrint(
        'CONDITIONAL_NAVIGATION: additionalField "$fieldKey" is missing or null');
    return true; // Field is missing or null
  }

  /// Execute navigation based on navigateTo configuration
  Map<String, dynamic> _executeNavigation(
    dynamic navigateToConfig,
    Map<String, dynamic> contextData,
    Map<String, dynamic> evaluationContext, {
    BuildContext? context,
  }) {
    if (navigateToConfig == null || navigateToConfig is! Map<String, dynamic>) {
      return contextData;
    }

    final targetName = navigateToConfig['name'] as String?;
    final targetType = navigateToConfig['type'] as String?;
    final flowName = navigateToConfig['flow'] as String?;
    final navData = navigateToConfig['data'] as List<dynamic>?;

    if (targetName == null) return contextData;

    // Resolve template values in navigation data
    final resolvedNavParams = <String, dynamic>{};
    if (navData != null) {
      for (final item in navData) {
        if (item is Map<String, dynamic>) {
          final key = item['key'] as String?;
          var value = item['value'];

          // Resolve template values like {{formData.referralCode}}
          if (value is String && value.contains('{{') && value.contains('}}')) {
            value = _resolveTemplateValue(value, evaluationContext);
            debugPrint('CONDITIONAL_NAVIGATION: Resolved "$key" = $value');
          }

          if (key != null) {
            resolvedNavParams[key] = value;
          }
        }
      }
    }

    debugPrint(
        'CONDITIONAL_NAVIGATION: Navigating to $targetName (type: $targetType, flow: $flowName)');
    debugPrint('CONDITIONAL_NAVIGATION: Navigation params: $resolvedNavParams');

    // Handle FORM navigation - navigate to flow and specify starting page
    if (targetType?.toUpperCase() == 'FORM' && flowName != null) {
      // Build resolved data list including the starting page
      final resolvedDataList = <Map<String, dynamic>>[];

      // Add existing data items with resolved values
      if (navData != null) {
        for (final item in navData) {
          if (item is Map<String, dynamic>) {
            final key = item['key'] as String?;
            var value = item['value'];
            if (value is String &&
                value.contains('{{') &&
                value.contains('}}')) {
              value = _resolveTemplateValue(value, evaluationContext);
            }
            if (key != null) {
              resolvedDataList.add({'key': key, 'value': value});
            }
          }
        }
      }

      // Add the starting page name as a navigation parameter
      resolvedDataList.add({'key': 'startPage', 'value': targetName});

      // Store navigation params for both flow and page keys
      final flowScreenKey = 'FORM::$flowName';
      final pageScreenKey = 'FORM::$targetName';

      final navParamsWithPage = <String, dynamic>{
        ...resolvedNavParams,
        'startPage': targetName,
      };

      // Also pass existingModels if available
      if (contextData.containsKey('existingModels')) {
        navParamsWithPage['existingModels'] = contextData['existingModels'];
      }

      FlowCrudStateRegistry()
          .updateNavigationParams(flowScreenKey, navParamsWithPage);
      FlowCrudStateRegistry()
          .updateNavigationParams(pageScreenKey, navParamsWithPage);
      FlowCrudStateRegistry()
          .updateNavigationParams(flowName, navParamsWithPage);
      FlowCrudStateRegistry()
          .updateNavigationParams(targetName, navParamsWithPage);

      // Navigate to the FORM flow (not the individual page)
      final navigationProperties = <String, dynamic>{
        'name': flowName, // Use flow name for route lookup
        'type': 'FORM',
        'data': resolvedDataList,
      };

      debugPrint(
          'CONDITIONAL_NAVIGATION: Using FORM navigation with flow=$flowName, startPage=$targetName');
      debugPrint('CONDITIONAL_NAVIGATION: Navigation data: $resolvedDataList');
      debugPrint(
          'CONDITIONAL_NAVIGATION: Full navigation properties: $navigationProperties');
      debugPrint(
          'CONDITIONAL_NAVIGATION: navParamsWithPage stored: $navParamsWithPage');

      NavigationRegistry.navigateTo(navigationProperties);

      return {
        ...contextData,
        'navigation': navigationProperties,
      };
    }

    // Handle TEMPLATE navigation
    // Check if the target page already exists in the route stack.
    // If it does, pop back to it (preserves existing data) instead of
    // pushing a new empty page.
    if (context != null) {
      final router = AutoRouter.of(context);
      bool targetExists = false;
      for (final route in router.stack) {
        if (route.name?.contains('FlowBuilderHomeRoute') == true) {
          final args = route.arguments;
          if (args is FlowBuilderHomeRouteArgs &&
              args.pageName == targetName) {
            targetExists = true;
            break;
          }
        }
      }

      if (targetExists) {
        debugPrint(
            'CONDITIONAL_NAVIGATION: Target "$targetName" exists in stack, using popUntil');
        router.popUntil((route) {
          if (route.settings.name?.contains('FlowBuilderHomeRoute') == true) {
            final args = route.settings.arguments;
            if (args is FlowBuilderHomeRouteArgs) {
              return args.pageName == targetName;
            }
          }
          return false;
        });
        return contextData;
      }
    }

    // Target not in stack - push new page using NavigationRegistry
    final resolvedDataList = <Map<String, dynamic>>[];
    if (navData != null) {
      for (final item in navData) {
        if (item is Map<String, dynamic>) {
          final key = item['key'] as String?;
          var value = item['value'];
          if (value is String && value.contains('{{') && value.contains('}}')) {
            value = _resolveTemplateValue(value, evaluationContext);
          }
          if (key != null) {
            resolvedDataList.add({'key': key, 'value': value});
          }
        }
      }
    }

    final navigationProperties = <String, dynamic>{
      'name': targetName,
      'type': targetType ?? 'TEMPLATE',
      'data': resolvedDataList,
    };

    NavigationRegistry.navigateTo(navigationProperties);

    return {
      ...contextData,
      'navigation': navigationProperties,
    };
  }

  /// Resolve template values like {{formData.referralCode}}
  String? _resolveTemplateValue(String template, Map<String, dynamic> context) {
    final regex = RegExp(r'\{\{(.+?)\}\}');
    final match = regex.firstMatch(template);
    if (match != null) {
      final path = match.group(1)!.trim();
      final value = _resolvePathValue(path, context);
      return value?.toString();
    }
    return template;
  }
}

/// Helper to get screen key from route arguments
String? _getScreenKeyFromArgs(BuildContext context) {
  try {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map<String, dynamic>) {
      return args['screenKey'] as String?;
    }
  } catch (_) {}
  return null;
}
