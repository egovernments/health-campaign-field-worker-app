import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import 'action_executor.dart';

/// Executor for conditional navigation based on runtime conditions
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

    // Get current screen's state data for resolving condition values
    final screenKey =
        getScreenKeyFromArgs(context) ?? context.router.currentPath;
    final currentState = FlowCrudStateRegistry().get(screenKey);
    final stateFormData = currentState?.formData;
    final stateWrapper = currentState?.stateWrapper;

    debugPrint('CONDITIONAL_NAVIGATION: screenKey: $screenKey');
    debugPrint('CONDITIONAL_NAVIGATION: contextData keys: ${contextData.keys}');
    debugPrint('CONDITIONAL_NAVIGATION: stateWrapper: $stateWrapper');

    // Build combined context with stateWrapper data
    Map<String, dynamic> combinedContext = Map<String, dynamic>.from(contextData);
    if (stateWrapper != null && stateWrapper is List && stateWrapper.isNotEmpty) {
      // Add stateWrapper items to context for path resolution
      for (int i = 0; i < stateWrapper.length; i++) {
        combinedContext['$i'] = stateWrapper[i];
      }
      debugPrint('CONDITIONAL_NAVIGATION: Added stateWrapper to context, first item: ${stateWrapper[0]}');
    }

    // Evaluate each condition
    for (final conditionEntry in conditions) {
      final conditionMap = conditionEntry as Map<String, dynamic>;
      final conditionExpr = conditionMap['condition'] as String?;
      final isDefault = conditionMap['default'] == true;
      final navigateTo = conditionMap['navigateTo'] as Map<String, dynamic>?;

      if (navigateTo == null) {
        debugPrint(
            'CONDITIONAL_NAVIGATION: No navigateTo for condition: $conditionExpr');
        continue;
      }

      bool shouldNavigate = false;

      if (isDefault) {
        // Default case - always matches if no other condition matched
        shouldNavigate = true;
        debugPrint('CONDITIONAL_NAVIGATION: Using default navigation');
      } else if (conditionExpr != null) {
        // Evaluate the condition expression
        shouldNavigate = _evaluateCondition(
          conditionExpr,
          combinedContext,
          stateFormData,
        );
        debugPrint(
            'CONDITIONAL_NAVIGATION: Condition "$conditionExpr" evaluated to: $shouldNavigate');
      }

      if (shouldNavigate) {
        // Execute the navigation
        await _executeNavigation(
          context,
          navigateTo,
          combinedContext,
          stateFormData,
        );
        break; // Stop after first matching condition
      }
    }

    return contextData;
  }

  /// Evaluate a condition expression against the context data
  bool _evaluateCondition(
    String conditionExpr,
    Map<String, dynamic> contextData,
    Map<String, dynamic>? stateFormData,
  ) {
    // Handle multiple conditions separated by &&
    final subConditions = conditionExpr.split('&&');

    for (final subCondition in subConditions) {
      final trimmedCondition = subCondition.trim();
      if (!_evaluateSingleCondition(
          trimmedCondition, contextData, stateFormData)) {
        return false;
      }
    }

    return true;
  }

  /// Evaluate a single condition (e.g., "HFReferralModel.symptom==FEVER")
  bool _evaluateSingleCondition(
    String condition,
    Map<String, dynamic> contextData,
    Map<String, dynamic>? stateFormData,
  ) {
    // Handle == operator
    if (condition.contains('==')) {
      final parts = condition.split('==');
      if (parts.length != 2) return false;

      final leftPath = parts[0].trim();
      final rightValue = parts[1].trim();

      // Resolve the left side value
      final leftValue = _resolvePathValue(leftPath, contextData, stateFormData);
      debugPrint(
          'CONDITIONAL_NAVIGATION: Comparing "$leftValue" == "$rightValue"');

      // Handle null check
      if (rightValue.toLowerCase() == 'null') {
        return leftValue == null ||
            leftValue.toString().isEmpty ||
            leftValue.toString().toLowerCase() == 'null';
      }

      // Compare values
      if (leftValue == null) return false;
      return leftValue.toString() == rightValue;
    }

    // Handle != operator
    if (condition.contains('!=')) {
      final parts = condition.split('!=');
      if (parts.length != 2) return false;

      final leftPath = parts[0].trim();
      final rightValue = parts[1].trim();

      final leftValue = _resolvePathValue(leftPath, contextData, stateFormData);

      // Handle null check
      if (rightValue.toLowerCase() == 'null') {
        return leftValue != null &&
            leftValue.toString().isNotEmpty &&
            leftValue.toString().toLowerCase() != 'null';
      }

      if (leftValue == null) return true;
      return leftValue.toString() != rightValue;
    }

    return false;
  }

  /// Resolve a path like "HFReferralModel.additionalFields.fields.feverQ1"
  /// from the context data
  /// Handles special case where 'fields' is an array of {key, value} objects
  dynamic _resolvePathValue(
    String path,
    Map<String, dynamic> contextData,
    Map<String, dynamic>? stateFormData,
  ) {
    debugPrint('CONDITIONAL_NAVIGATION: Resolving path: $path');

    // Try to resolve using the interpolation utility first
    final interpolatedValue = resolveValue('{{ $path }}', contextData);
    if (interpolatedValue != '{{ $path }}' && interpolatedValue != null) {
      debugPrint('CONDITIONAL_NAVIGATION: Resolved via interpolation: $interpolatedValue');
      return interpolatedValue;
    }

    // Try state form data
    if (stateFormData != null) {
      final stateValue = resolveValue('{{ $path }}', stateFormData);
      if (stateValue != '{{ $path }}' && stateValue != null) {
        debugPrint('CONDITIONAL_NAVIGATION: Resolved via stateFormData: $stateValue');
        return stateValue;
      }
    }

    // Manual path resolution for nested objects
    final pathParts = path.split('.');
    dynamic current = contextData;
    debugPrint('CONDITIONAL_NAVIGATION: Manual resolution, pathParts: $pathParts');

    for (int i = 0; i < pathParts.length; i++) {
      final part = pathParts[i];
      if (current == null) {
        debugPrint('CONDITIONAL_NAVIGATION: Current is null at part: $part');
        return null;
      }

      debugPrint('CONDITIONAL_NAVIGATION: Processing part "$part", current type: ${current.runtimeType}');

      if (current is Map<String, dynamic>) {
        current = current[part];
        debugPrint('CONDITIONAL_NAVIGATION: Map<String, dynamic> access, result: ${current?.runtimeType}');
      } else if (current is Map) {
        current = current[part];
        debugPrint('CONDITIONAL_NAVIGATION: Map access, result: ${current?.runtimeType}');
      } else if (current is List) {
        // Handle array of {key, value} objects (like additionalFields.fields)
        // If we're at 'fields' array and need to find a specific key
        final fieldKey = part;
        dynamic foundValue;
        debugPrint('CONDITIONAL_NAVIGATION: List with ${current.length} items, searching for key: $fieldKey');
        for (final item in current) {
          debugPrint('CONDITIONAL_NAVIGATION: Checking item: $item');
          if (item is Map && item['key'] == fieldKey) {
            foundValue = item['value'];
            debugPrint('CONDITIONAL_NAVIGATION: Found value: $foundValue');
            break;
          }
        }
        current = foundValue;
      } else {
        // Try to get property via reflection/dynamic access
        debugPrint('CONDITIONAL_NAVIGATION: Trying toMap() on ${current.runtimeType}');
        try {
          final map = (current as dynamic).toMap();
          debugPrint('CONDITIONAL_NAVIGATION: toMap() result: $map');
          current = map[part];
        } catch (e) {
          debugPrint('CONDITIONAL_NAVIGATION: toMap() failed: $e');
          return null;
        }
      }
    }

    debugPrint('CONDITIONAL_NAVIGATION: Final resolved value: $current');
    return current;
  }

  /// Execute navigation to the target
  Future<void> _executeNavigation(
    BuildContext context,
    Map<String, dynamic> navigateTo,
    Map<String, dynamic> contextData,
    Map<String, dynamic>? stateFormData,
  ) async {
    final targetName = navigateTo['name'] as String?;
    final targetType = navigateTo['type'] as String?;
    final targetFlow = navigateTo['flow'] as String?;
    final navData = navigateTo['data'] as List<dynamic>?;

    if (targetName == null) {
      debugPrint('CONDITIONAL_NAVIGATION: No target name specified');
      return;
    }

    // Resolve navigation data
    Map<String, dynamic> navigationProperties = {
      'name': targetName,
      'type': targetType,
      if (targetFlow != null) 'flow': targetFlow,
    };

    if (navData != null) {
      final resolvedData = navData.map((entry) {
        final key = entry['key'];
        final rawValue = entry['value'];

        // Try to resolve from state form data first, fallback to contextData
        dynamic resolvedValue = resolveValue(rawValue, stateFormData);
        if (resolvedValue == rawValue || resolvedValue == null) {
          resolvedValue = resolveValue(rawValue, contextData);
        }

        return {
          "key": key,
          "value": resolvedValue,
        };
      }).toList();

      navigationProperties['data'] = resolvedData;
    }

    // The flow name is what getScreenKeyFromArgs returns (e.g., "REFERRAL_CREATE")
    // This is the key that the target screen will use
    final flowName = targetFlow ?? targetName;

    // Store formData from REVERSE_TRANSFORM for the target screen to use
    // This enables auto-population of form fields when navigating to edit/update screens
    final formData = contextData['formData'] as Map<String, dynamic>?;
    if (formData != null && formData.isNotEmpty) {
      debugPrint('CONDITIONAL_NAVIGATION: Storing formData for target screen');
      debugPrint('CONDITIONAL_NAVIGATION: formData keys: ${formData.keys.toList()}');

      // Store formData in FlowCrudStateRegistry for the target screen
      // Use FORM:: prefix as that's what screen_builder uses for form screens
      final formKey = 'FORM::$flowName';
      final currentState = FlowCrudStateRegistry().get(formKey);
      final updatedState = (currentState ?? const FlowCrudState()).copyWith(
        formData: formData,
      );
      FlowCrudStateRegistry().update(formKey, updatedState);
      debugPrint('CONDITIONAL_NAVIGATION: Stored formData for $formKey');

      // Also store under plain flow name for compatibility
      final plainState = FlowCrudStateRegistry().get(flowName);
      final updatedPlainState = (plainState ?? const FlowCrudState()).copyWith(
        formData: formData,
      );
      FlowCrudStateRegistry().update(flowName, updatedPlainState);
      debugPrint('CONDITIONAL_NAVIGATION: Stored formData for $flowName');
    }

    // Store existingModels in navigation params for edit mode
    // This allows FETCH_TRANSFORMER_CONFIG to use updateEntitiesFromForm
    final existingModels = contextData['existingModels'];
    if (existingModels != null) {
      final modelsList = existingModels as List;
      debugPrint(
          'CONDITIONAL_NAVIGATION: Storing existingModels (${modelsList.length} models)');

      // Store with multiple key formats that TransformerExecutor might try:
      // 1. Plain flow name (e.g., "REFERRAL_CREATE")
      final plainNavParams =
          FlowCrudStateRegistry().getNavigationParams(flowName) ?? {};
      FlowCrudStateRegistry().updateNavigationParams(flowName, {
        ...plainNavParams,
        'existingModels': existingModels,
      });
      debugPrint(
          'CONDITIONAL_NAVIGATION: Stored existingModels for $flowName');

      // 2. FORM::flowName (e.g., "FORM::REFERRAL_CREATE")
      final formKey = 'FORM::$flowName';
      final formNavParams =
          FlowCrudStateRegistry().getNavigationParams(formKey) ?? {};
      FlowCrudStateRegistry().updateNavigationParams(formKey, {
        ...formNavParams,
        'existingModels': existingModels,
      });
      debugPrint(
          'CONDITIONAL_NAVIGATION: Stored existingModels for $formKey');

      // 3. TEMPLATE::flowName (e.g., "TEMPLATE::REFERRAL_CREATE")
      final templateKey = 'TEMPLATE::$flowName';
      final templateNavParams =
          FlowCrudStateRegistry().getNavigationParams(templateKey) ?? {};
      FlowCrudStateRegistry().updateNavigationParams(templateKey, {
        ...templateNavParams,
        'existingModels': existingModels,
      });
      debugPrint(
          'CONDITIONAL_NAVIGATION: Stored existingModels for $templateKey');
    }

    debugPrint(
        'CONDITIONAL_NAVIGATION: Navigating to $targetName with type $targetType');
    NavigationRegistry.navigateTo(navigationProperties);
  }
}