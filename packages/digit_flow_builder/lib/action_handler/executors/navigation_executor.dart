import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context
        .read<DigitScannerBloc>()
        .add(const DigitScannerEvent.handleScanner());
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

    // Get composite key for current screen's FlowCrudStateRegistry operations
    final currentCompositeKey = getCompositeKey(context, screenKey: screenKey);
    var currentState =
        FlowCrudStateRegistry().get(currentCompositeKey ?? screenKey);

    // Fallback: getCompositeKey may return a stale/missing key when NAV fires
    // from a chain triggered outside the current screen's widget tree (e.g.
    // OPEN_SCANNER onSuccess). Look up the registry's registered instanceId
    // for the source screenKey and try that composite too.
    if (currentState?.stateWrapper == null || currentState!.stateWrapper!.isEmpty) {
      final bareScreenKey = screenKey?.split('::').last;
      if (bareScreenKey != null) {
        final registeredInstanceId =
            FlowCrudStateRegistry().getInstanceId(bareScreenKey);
        if (registeredInstanceId != null) {
          final fallbackKey = '$bareScreenKey::$registeredInstanceId';
          final fallbackState =
              FlowCrudStateRegistry().getByCompositeKey(fallbackKey);
          if (fallbackState?.stateWrapper != null &&
              fallbackState!.stateWrapper!.isNotEmpty) {
            currentState = fallbackState;
          }
        }
      }
    }
    final stateFormData = currentState?.formData;

    // Get navigation mode and popUntilPageName from action properties
    final navigationMode = action.properties['navigationMode'] as String?;
    final popUntilPageName = action.properties['popUntilPageName'] as String?;

    // First resolve navigation data if provided
    final navData = action.properties['data'] as List<dynamic>?;
    Map<String, dynamic> navigationProperties =
        Map<String, dynamic>.from(action.properties);

    // Add navigation mode properties
    if (navigationMode != null) {
      navigationProperties['navigationMode'] = navigationMode;
    }
    if (popUntilPageName != null) {
      navigationProperties['popUntilPageName'] = popUntilPageName;
    }

    if (navData != null) {
      // Build an enriched context that ALWAYS exposes the current screen's
      // stateWrapper (list) and its first item as `item`. This lets templates
      // like {{stateWrapper.0.X}} or {{item.X}} resolve when the action is
      // fired outside a list-widget context (e.g. from OPEN_SCANNER's
      // onSuccess chain, where widget-level resolveActionNavData never ran).
      final currentStateWrapper = currentState?.stateWrapper;
      final stateWrapperFirst =
          (currentStateWrapper?.isNotEmpty == true)
              ? currentStateWrapper?.first
              : null;
      final enrichedContext = <String, dynamic>{
        ...contextData,
        if (currentStateWrapper != null) 'stateWrapper': currentStateWrapper,
        if (stateWrapperFirst != null) 'item': stateWrapperFirst,
      };

      final resolvedData = navData.map((entry) {
        final key = entry['key'];
        final rawValue = entry['value'];

        final resolvedValue = resolveNavigationDataValue(
          rawValue: rawValue,
          stateFormData: stateFormData,
          stateWrapperFirst: stateWrapperFirst,
          contextData: enrichedContext,
        );

        return {
          "key": key,
          "value": resolvedValue,
        };
      }).toList();

      // create a copy with resolved data instead of modifying original
      navigationProperties['data'] = resolvedData;
    }

    final config = FlowRegistry.getByName(action.properties['name']);
    final targetName = config?["name"] ?? action.properties['name'];

    // Build correct screen key with type prefix (FORM::, TEMPLATE::)
    final targetScreenKey = targetName;

    // Generate instanceId for target page BEFORE navigation
    // This ensures we can store state with the same key the target page will use
    final targetInstanceId = generateInstanceId(targetScreenKey);
    final targetCompositeKey =
        createCompositeKey(targetScreenKey, targetInstanceId);

    // Add instanceId to navigation properties so target page receives it
    navigationProperties['_instanceId'] = targetInstanceId;

    // Clear target screen's FlowCrudState before navigation
    // This ensures the new page instance starts fresh without old state
    FlowCrudStateRegistry().clear(targetCompositeKey);

    NavigationRegistry.navigateTo(navigationProperties);
    final entities = contextData['entities'];

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
          final state = FlowCrudStateRegistry().get(targetCompositeKey);
          List<dynamic> existingWrapper = [];

          if (state?.stateWrapper != null &&
              (state!.stateWrapper as List).isNotEmpty) {
            existingWrapper = List<dynamic>.from(state.stateWrapper as List);
          }

          if (existingWrapper.isEmpty) {
            // Fall back to building new wrapper
            final wrapper = WrapperBuilder(
              (entities is List
                  ? entities.whereType<EntityModel>().toList()
                  : <EntityModel>[]),
              Map<String, dynamic>.from(config!['wrapperConfig'] as Map),
              screenKey: targetCompositeKey,
            ).build();
            final flowState = const FlowCrudState().copyWith(
              stateWrapper: wrapper,
            );
            FlowCrudStateRegistry().update(targetCompositeKey, flowState);
          } else {
            // Update entities within the existing wrapper structure
            // The wrapper items are Map<String, dynamic> with entity types as keys
            final updatedEntities =
                (entities as List).whereType<EntityModel>().toList();

            for (int i = 0; i < existingWrapper.length; i++) {
              final wrapperItem = existingWrapper[i];
              if (wrapperItem is Map<String, dynamic>) {
                // Update each entity type in the wrapper item
                for (final updatedEntity in updatedEntities) {
                  final entityType = getEntityTypeName(updatedEntity);
                  if (wrapperItem.containsKey(entityType)) {
                    wrapperItem[entityType] = updatedEntity;
                  }
                }
              }
            }

            final flowState = const FlowCrudState().copyWith(
              stateWrapper: existingWrapper,
            );
            FlowCrudStateRegistry().update(targetCompositeKey, flowState);
          }
        } else {
          // For create mode, build wrapper from entities as before
          final wrapper = WrapperBuilder(
            entities,
            Map<String, dynamic>.from(config?['wrapperConfig'] as Map),
            screenKey: targetCompositeKey,
          ).build();
          final flowState = const FlowCrudState().copyWith(
            stateWrapper: wrapper,
          );
          FlowCrudStateRegistry().update(targetCompositeKey, flowState);
        }
      }
    }

    // Determine which form data to use
    Map<String, dynamic>? formValuesToUse = contextData['formData'];

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
    final existingState = FlowCrudStateRegistry().get(targetCompositeKey);

    final mergedFormData = {
      ...?existingState?.formData,
      ...?formValuesToUse,
    };

    final flowState = (existingState ?? const FlowCrudState()).copyWith(
      formData: mergedFormData,
    );

    FlowCrudStateRegistry().update(targetCompositeKey, flowState);

    // Store existingModels in navigation params for edit mode
    // This allows FETCH_TRANSFORMER_CONFIG to use updateEntitiesFromForm
    final existingModels = contextData['existingModels'];
    if (existingModels != null) {
      // Store with composite key
      final currentNavParams =
          FlowCrudStateRegistry().getNavigationParams(targetCompositeKey) ?? {};
      FlowCrudStateRegistry().updateNavigationParams(targetCompositeKey, {
        ...currentNavParams,
        'existingModels': existingModels,
      });
    }

    return contextData;
  }
}
