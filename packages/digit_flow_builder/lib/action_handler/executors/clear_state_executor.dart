import 'package:flutter/material.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../blocs/search_state_manager.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../action_config.dart';
import 'action_executor.dart';

/// Executor for CLEAR_STATE action
/// Clears specific filters, widgetData keys, or entire state
///
/// Properties:
/// - filterKeys: List<String> - Filter keys to remove from SearchStateManager
/// - widgetKeys: List<String> - Widget keys to remove from widgetData
/// - name: String - Search name (defaults to 'default')
/// - clearOrderBy: bool - If true, also clears orderBy
/// - triggerSearch: bool - If true, triggers search after clearing (via SearchStateManager callback)
/// - clearAll: bool - If true, clears entire state (original behavior)
/// - clearResults: bool - If true, clears stateWrapper (old results) while preserving widgetData
class ClearStateExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CLEAR_STATE';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    // Use getEffectiveScreenKey to handle popup context
    final crudCtx = CrudItemContext.of(context);
    final screenKey =
        crudCtx?.screenKey ?? getEffectiveScreenKey(context, contextData);

    // Get composite key for FlowCrudStateRegistry operations
    // IMPORTANT: Try CrudItemContext.compositeKey first - it's correctly passed
    // from popups via ActionPopupWidget. Only fall back to getEffectiveCompositeKey
    // when not in a popup context.
    final compositeKey =
        crudCtx?.compositeKey ?? getEffectiveCompositeKey(context, contextData);

    if (compositeKey == null) {
      debugPrint('⚠️ CLEAR_STATE: No compositeKey found, skipping');
      return contextData;
    }

    final properties = action.properties;
    final searchName = properties['name'] as String? ?? 'default';
    final clearAll = properties['clearAll'] as bool? ?? false;
    final triggerSearch = properties['triggerSearch'] as bool? ?? false;
    final clearOrderBy = properties['clearOrderBy'] as bool? ?? false;
    final clearResults = properties['clearResults'] as bool? ?? false;

    // Get filter keys to remove
    final filterKeys = <String>[];
    if (properties['filterKeys'] != null) {
      final keys = properties['filterKeys'];
      if (keys is List) {
        filterKeys.addAll(keys.map((k) => k.toString()));
      }
    }

    // Get widget keys to remove from widgetData
    final widgetKeys = <String>[];
    if (properties['widgetKeys'] != null) {
      final keys = properties['widgetKeys'];
      if (keys is List) {
        widgetKeys.addAll(keys.map((k) => k.toString()));
      }
    }

    // Save widgetData to contextData before clearing, so subsequent
    // conditional actions can still read widget values (e.g., selectedStatus)
    // even after FlowCrudStateRegistry is cleared.
    final currentState = FlowCrudStateRegistry().get(compositeKey);
    if (currentState?.widgetData != null) {
      final savedWidgetData = <String, dynamic>{};
      currentState!.widgetData!.forEach((key, value) {
        // Flatten single-element lists to match widgetData evaluation behavior
        if (value is List && value.length == 1) {
          savedWidgetData[key] = value.first;
        } else {
          savedWidgetData[key] = value;
        }
      });
      // Merge into formData so the action handler's condition evaluator picks it up
      final existingFormData =
          contextData['formData'] as Map<String, dynamic>? ?? {};
      contextData['formData'] = {...existingFormData, ...savedWidgetData};
      debugPrint('✅ CLEAR_STATE: Saved widgetData to contextData: ${savedWidgetData.keys.toList()}');
    }

    // If clearAll is true or no specific keys provided, clear everything
    if (clearAll || (filterKeys.isEmpty && widgetKeys.isEmpty && !clearOrderBy)) {
      // Clear entire state for this screen (original behavior)
      FlowCrudStateRegistry().clear(compositeKey);
      SearchStateManager().clear(compositeKey, searchName);

      debugPrint('✅ CLEAR_STATE: Cleared all state for screen: $compositeKey');
    } else {
      // Selective clearing

      // 1. Remove specific filters from SearchStateManager
      // Use removeFiltersByKeysForScreen to clear across ALL searchNames for this screen
      // This handles cases where filters were added with different 'name' values
      if (filterKeys.isNotEmpty) {
        SearchStateManager().removeFiltersByKeysForScreen(
          compositeKey,
          filterKeys,
          triggerSearch: false, // We'll trigger manually if needed
        );
        debugPrint('✅ CLEAR_STATE: Removed filters: $filterKeys for screen: $compositeKey');
      }

      // 2. Clear orderBy if requested
      if (clearOrderBy) {
        SearchStateManager().updateOrderBy(
          compositeKey,
          searchName,
          null,
          triggerSearch: false,
        );
        debugPrint('✅ CLEAR_STATE: Cleared orderBy');
      }

      // 3. Remove specific keys from widgetData
      if (widgetKeys.isNotEmpty) {
        final currentStateForWidgets = FlowCrudStateRegistry().get(compositeKey);
        if (currentStateForWidgets != null) {
          final updatedWidgetData =
              Map<String, dynamic>.from(currentStateForWidgets.widgetData ?? {});

          for (final key in widgetKeys) {
            updatedWidgetData.remove(key);
          }

          final updatedState = currentStateForWidgets.copyWith(
            widgetData: updatedWidgetData,
          );
          FlowCrudStateRegistry().update(compositeKey, updatedState);

          debugPrint('✅ CLEAR_STATE: Removed widgetData keys: $widgetKeys');
        }
      }
    }

    // Clear stateWrapper (old results) while preserving widgetData
    // This ensures old results are visually removed before new search results appear
    if (clearResults) {
      final stateForClear = FlowCrudStateRegistry().get(compositeKey);
      if (stateForClear != null) {
        final clearedState = FlowCrudState(
          widgetData: stateForClear.widgetData,
          formData: stateForClear.formData,
          isLoading: true,
        );
        FlowCrudStateRegistry().update(compositeKey, clearedState);
        debugPrint('✅ CLEAR_STATE: Cleared stateWrapper (preserving widgetData)');
      }
    }

    // Trigger search only if requested AND there are remaining filters
    // If all filters are cleared, clear the page state instead
    if (triggerSearch) {
      final hasRemainingFilters = SearchStateManager().hasFiltersForScreen(compositeKey);
      if (hasRemainingFilters) {
        SearchStateManager().updateFilters(
          compositeKey,
          searchName,
          [], // Empty list just to trigger the callback
          triggerSearch: true,
        );
        debugPrint('✅ CLEAR_STATE: Triggered search refresh (remaining filters exist)');
      } else {
        // No remaining filters - clear the page state
        SearchStateManager().updateFilters(
          compositeKey,
          searchName,
          [],
          triggerSearch: false,
        );
        FlowCrudStateRegistry().clear(compositeKey);
        debugPrint('✅ CLEAR_STATE: Cleared page state (no remaining filters)');
      }
    }

    return contextData;
  }
}
