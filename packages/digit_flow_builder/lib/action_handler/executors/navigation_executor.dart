import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../blocs/state_wrapper_builder.dart';
import '../../flow_builder.dart';
import '../../utils/interpolation.dart';
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
    final targetPageName = action.properties['name'] as String?;
    final targetType = action.properties['type'] as String?;

    // Special handling for HOME - navigate to the main HomePage
    // Check both 'name' and 'type' properties for HOME
    if (targetPageName == 'HOME' || targetType == 'HOME') {
      NavigationRegistry.navigateTo({'name': 'HOME'});
      return contextData;
    }

    // Get current screen's state data for resolving navigation values
    final screenKey =
        getScreenKeyFromArgs(context) ?? context.router.currentPath;
    final currentState = FlowCrudStateRegistry().get(screenKey);
    final stateFormData = currentState?.formData;

    // First resolve navigation data if provided
    final navData = action.properties['data'] as List<dynamic>?;
    Map<String, dynamic> navigationProperties =
        Map<String, dynamic>.from(action.properties);

    if (navData != null) {
      final resolvedData = navData.map((entry) {
        final key = entry['key'];
        final rawValue = entry['value'];

        // Try to resolve from state form data first, fallback to contextData
        dynamic resolvedValue = resolveValue(rawValue, stateFormData);
        if (resolvedValue == rawValue || resolvedValue == null) {
          // If not resolved from state, try contextData
          resolvedValue = resolveValue(rawValue, contextData);
        }

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
    final targetName = config?["name"] ?? action.properties['name'];

    // Build correct screen key with type prefix (FORM::, TEMPLATE::)
    final targetScreenKey =
        targetType != null ? '$targetType::$targetName' : targetName;

    if (entities != null) {
      if (config?['wrapperConfig'] != null) {
        // Check if this is an edit mode - if so, merge updated entities into existing wrapper
        // Check from contextData['navigation'] which carries isEdit from the action chain
        final navContext = contextData['navigation'] as Map<String, dynamic>?;
        final isEditMode =
            navContext?['isEdit'] == true || navContext?['isEdit'] == 'true';

        if (isEditMode) {
          // For edit mode, update entities within the existing stateWrapper structure
          // The wrapper is a List<Map<String, dynamic>> not List<EntityModel>
          // Try multiple key formats to find the existing wrapper
          List<dynamic> existingWrapper = [];
          String? foundKey;
          final keysToTry = [
            targetScreenKey,
            targetName,
            if (targetType != null) '$targetType::$targetName',
          ];

          for (final key in keysToTry) {
            final state = FlowCrudStateRegistry().get(key);
            if (state?.stateWrapper != null &&
                (state!.stateWrapper as List).isNotEmpty) {
              existingWrapper = List<dynamic>.from(state.stateWrapper as List);
              foundKey = key;
              debugPrint(
                  'NAVIGATION: Found existing wrapper with key=$key, items=${existingWrapper.length}');
              break;
            }
          }

          if (existingWrapper.isEmpty) {
            debugPrint(
                'NAVIGATION: No existing wrapper found, building new wrapper');
            // Fall back to building new wrapper
            final wrapper =
                WrapperBuilder(entities as List<EntityModel>, config!['wrapperConfig']).build();
            final flowState = const FlowCrudState().copyWith(
              stateWrapper: wrapper,
            );
            FlowCrudStateRegistry().update(targetScreenKey, flowState);
          } else {
            // Update entities within the existing wrapper structure
            // The wrapper items are Map<String, dynamic> with entity types as keys
            final updatedEntities = (entities as List).whereType<EntityModel>().toList();
            debugPrint(
                'NAVIGATION: Updating ${updatedEntities.length} entities in existing wrapper');

            for (int i = 0; i < existingWrapper.length; i++) {
              final wrapperItem = existingWrapper[i];
              if (wrapperItem is Map<String, dynamic>) {
                // Update each entity type in the wrapper item
                for (final updatedEntity in updatedEntities) {
                  final entityType = updatedEntity.runtimeType.toString();
                  if (wrapperItem.containsKey(entityType)) {
                    wrapperItem[entityType] = updatedEntity;
                    debugPrint('NAVIGATION: Updated $entityType in wrapper');
                  }
                }
              }
            }

            debugPrint(
                'NAVIGATION: Edit mode - updated wrapper with ${updatedEntities.length} entities');

            final flowState = const FlowCrudState().copyWith(
              stateWrapper: existingWrapper,
            );
            FlowCrudStateRegistry().update(targetScreenKey, flowState);
          }
        } else {
          // For create mode, build wrapper from entities as before
          final wrapper =
              WrapperBuilder(entities, config?['wrapperConfig']).build();
          final flowState = const FlowCrudState().copyWith(
            stateWrapper: wrapper,
          );
          FlowCrudStateRegistry().update(targetScreenKey, flowState);
        }
      }
    }

    // Determine which form data to use
    Map<String, dynamic>? formValuesToUse = contextData['formData'];
    debugPrint('NAVIGATION: contextData formData: $formValuesToUse');
    debugPrint('NAVIGATION: targetScreenKey: $targetScreenKey');

    final formDataConfig = action.properties['formDataConfig'];
    if (formDataConfig != null) {
      final collectedFormData =
          FlowCrudStateRegistry().get(formDataConfig)?.formData;
      if (collectedFormData != null) {
        // Merge collected data with current form data
        formValuesToUse = {...collectedFormData, ...formValuesToUse ?? {}};
      }
    }

    // Get existing state to preserve stateWrapper and other data
    final existingState = FlowCrudStateRegistry().get(targetScreenKey);
    debugPrint(
        'NAVIGATION: existingState formData: ${existingState?.formData}');

    final mergedFormData = {
      ...?existingState?.formData,
      ...?formValuesToUse,
    };
    debugPrint('NAVIGATION: merged formData: $mergedFormData');

    final flowState = (existingState ?? const FlowCrudState()).copyWith(
      formData: mergedFormData,
    );

    FlowCrudStateRegistry().update(targetScreenKey, flowState);
    debugPrint(
        'NAVIGATION: Updated registry with formData for $targetScreenKey');

    // Store existingModels in navigation params for edit mode
    // This allows FETCH_TRANSFORMER_CONFIG to use updateEntitiesFromForm
    // Store with both keys (full screen key and plain name) for robust retrieval
    final existingModels = contextData['existingModels'];
    if (existingModels != null) {
      final modelsList = existingModels as List;
      debugPrint(
          'NAVIGATION: Storing existingModels (${modelsList.length} models)');

      // Store with full screen key (FORM::ADD_MEMBER)
      final currentNavParams =
          FlowCrudStateRegistry().getNavigationParams(targetScreenKey) ?? {};
      FlowCrudStateRegistry().updateNavigationParams(targetScreenKey, {
        ...currentNavParams,
        'existingModels': existingModels,
      });
      debugPrint('NAVIGATION: Stored existingModels for $targetScreenKey');

      // Also store with plain name for compatibility (ADD_MEMBER)
      if (targetName != targetScreenKey) {
        final plainNavParams =
            FlowCrudStateRegistry().getNavigationParams(targetName) ?? {};
        FlowCrudStateRegistry().updateNavigationParams(targetName, {
          ...plainNavParams,
          'existingModels': existingModels,
        });
        debugPrint('NAVIGATION: Also stored existingModels for $targetName');
      }
    }

    return contextData;
  }
}
