import 'package:digit_data_converter/src/reverse_transformer_service.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../data/transformer_config.dart';
import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import 'action_executor.dart';

/// Executor for REVERSE_TRANSFORM action type
/// Maps entity models back to form data for prefilling forms
///
/// Usage in config:
/// ```json
/// {
///   "actionType": "REVERSE_TRANSFORM",
///   "properties": {
///     "configName": "stock",           // Key in jsonConfig for transformer config
///     "sourceScreenKey": "TEMPLATE::manageStock",  // Optional: screen key to get entities from
///     "entityTypes": ["StockModel"],   // Optional: filter specific entity types
///     "onError": [...]                 // Actions to execute on error
///   }
/// }
/// ```
class ReverseTransformerExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'REVERSE_TRANSFORM';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final configName = action.properties['configName'] as String?;
    final sourceScreenKey = action.properties['sourceScreenKey'] as String?;
    final entityTypes = action.properties['entityTypes'] as List<dynamic>?;
    final onErrorActions = action.properties['onError'] as List<dynamic>?;

    // Get current screen key
    final crudCtx = CrudItemContext.of(context);
    final currentScreenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);

    try {
      if (configName == null) {
        debugPrint('REVERSE_TRANSFORM: configName is required');
        return contextData;
      }

      // Get transformer config
      final transformerConfig = jsonConfig[configName];
      if (transformerConfig == null) {
        debugPrint('REVERSE_TRANSFORM: Config not found for: $configName');
        return contextData;
      }

      // Get entities from stateWrapper
      List<EntityModel> modelInstances = [];

      // Try to get from contextData first
      if (contextData['entities'] != null && contextData['entities'] is List) {
        modelInstances = (contextData['entities'] as List)
            .whereType<EntityModel>()
            .toList();
      }

      // If no entities in context, try to get from FlowCrudStateRegistry
      if (modelInstances.isEmpty) {
        final screenKeyToUse = sourceScreenKey ?? currentScreenKey;
        if (screenKeyToUse != null) {
          final flowState = FlowCrudStateRegistry().get(screenKeyToUse);
          final stateWrapper = flowState?.stateWrapper;

          if (stateWrapper != null && stateWrapper is List) {
            // Extract EntityModel instances from stateWrapper
            modelInstances = _extractEntitiesFromWrapper(stateWrapper);
          }
        }
      }

      if (modelInstances.isEmpty) {
        debugPrint('REVERSE_TRANSFORM: No entities found to transform');
        return contextData;
      }

      // Filter by entity types if specified
      if (entityTypes != null && entityTypes.isNotEmpty) {
        modelInstances = modelInstances.where((entity) {
          return entityTypes.contains(entity.runtimeType.toString());
        }).toList();
      }

      debugPrint(
          'REVERSE_TRANSFORM: Transforming ${modelInstances.length} entities');

      // Use ReverseFormMapper to convert entities to form data
      final mapper = ReverseFormMapper(
        formConfig: transformerConfig,
        modelInstances: modelInstances,
      );

      final formData = mapper.buildFormData();

      debugPrint('REVERSE_TRANSFORM: Generated form data: $formData');

      // Update the current screen's state with the form data
      if (currentScreenKey != null) {
        final currentState = FlowCrudStateRegistry().get(currentScreenKey);
        final existingFormData = currentState?.formData ?? {};

        // Merge with existing form data (new data takes precedence)
        final mergedFormData = {
          ...existingFormData,
          ...formData,
        };

        final updatedState =
            (currentState ?? const FlowCrudState()).copyWith(
          formData: mergedFormData,
          stateWrapper: currentState?.stateWrapper,
        );

        FlowCrudStateRegistry().update(currentScreenKey, updatedState);
      }

      // Return updated context with form data and existing models for update
      return {
        ...contextData,
        'formData': {
          ...?contextData['formData'] as Map<String, dynamic>?,
          ...formData,
        },
        'reverseTransformResult': formData,
        // Pass existing models for updateEntitiesFromForm in edit mode
        'existingModels': modelInstances,
      };
    } catch (e, stackTrace) {
      debugPrint('REVERSE_TRANSFORM: Error: $e');
      debugPrint('Stack trace: $stackTrace');

      if (onErrorActions != null && onErrorActions.isNotEmpty) {
        // Execute error actions would be handled by caller
        return {
          ...contextData,
          'errorType': 'reverseTransformError',
          'errorMessage': e.toString(),
        };
      }
    }

    return contextData;
  }

  /// Extracts EntityModel instances from a stateWrapper list
  /// The stateWrapper may contain wrapped objects or direct EntityModel instances
  List<EntityModel> _extractEntitiesFromWrapper(List<dynamic> wrapper) {
    final entities = <EntityModel>[];

    for (final item in wrapper) {
      if (item is EntityModel) {
        entities.add(item);
      } else if (item is Map<String, dynamic>) {
        // Try to extract entities from wrapped objects
        _extractFromMap(item, entities);
      } else if (item is List) {
        // Recursively extract from nested lists
        entities.addAll(_extractEntitiesFromWrapper(item));
      }
    }

    return entities;
  }

  /// Recursively extracts EntityModel instances from a map
  void _extractFromMap(Map<String, dynamic> map, List<EntityModel> entities) {
    for (final value in map.values) {
      if (value is EntityModel) {
        entities.add(value);
      } else if (value is List) {
        for (final item in value) {
          if (item is EntityModel) {
            entities.add(item);
          } else if (item is Map<String, dynamic>) {
            _extractFromMap(item, entities);
          }
        }
      } else if (value is Map<String, dynamic>) {
        _extractFromMap(value, entities);
      }
    }
  }
}
