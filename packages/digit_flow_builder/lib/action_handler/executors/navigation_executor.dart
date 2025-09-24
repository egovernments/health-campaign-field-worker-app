import 'package:flutter/material.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../blocs/state_wrapper_builder.dart';
import '../../flow_builder.dart';
import '../../utils/utils.dart';
import 'action_executor.dart';

class NavigationExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'NAVIGATION';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    // First resolve navigation data if provided
    final navData = action.properties['data'] as List<dynamic>?;
    Map<String, dynamic> navigationProperties =
        Map<String, dynamic>.from(action.properties);

    if (navData != null) {
      final resolvedData = navData.map((entry) {
        final key = entry['key'];
        final rawValue = entry['value'];

        // resolve template value using contextData/entities
        final resolvedValue = resolveValue(rawValue, contextData);

        return {
          "key": key,
          "value": resolvedValue,
        };
      }).toList();

      // create a copy with resolved data instead of modifying original
      navigationProperties['data'] = resolvedData;
    }

    NavigationRegistry.navigateTo(navigationProperties);
    final entities = contextData['entities'];
    final config = FlowRegistry.getByName(action.properties['name']);
    if (entities != null) {
      final wrapper =
          WrapperBuilder(entities, config?['wrapperConfig']).build();
      final flowState = const FlowCrudState().copyWith(
        stateWrapper: wrapper,
      );

      FlowCrudStateRegistry().update(config?["name"], flowState);
    }

    // Determine which form data to use
    Map<String, dynamic>? formValuesToUse = contextData['formData'];
    final formDataConfig = action.properties['formDataConfig'];
    if (formDataConfig != null) {
      final collectedFormData =
          FlowCrudStateRegistry().get(formDataConfig)?.formData;
      if (collectedFormData != null) {
        // Merge collected data with current form data
        formValuesToUse = {...collectedFormData, ...contextData['formData']};
      }
    }

    final flowState = const FlowCrudState().copyWith(formData: formValuesToUse);

    FlowCrudStateRegistry().update(config?["name"], flowState);

    return contextData;
  }
}
