import 'package:digit_logger/digit_logger.dart';
import 'package:flutter/material.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../blocs/search_state_manager.dart';
import '../../utils/interpolation.dart';
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
    final screenKey = getEffectiveScreenKey(context, contextData);

    if (screenKey == null) {
      DigitLogger.warn('CLEAR_STATE: No screenKey found, skipping', category: LogCategory.state);
      return contextData;
    }

    final properties = action.properties;
    final searchName = properties['name'] as String? ?? 'default';
    final clearAll = properties['clearAll'] as bool? ?? false;
    final triggerSearch = properties['triggerSearch'] as bool? ?? false;
    final clearOrderBy = properties['clearOrderBy'] as bool? ?? false;

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

    // If clearAll is true or no specific keys provided, clear everything
    if (clearAll || (filterKeys.isEmpty && widgetKeys.isEmpty && !clearOrderBy)) {
      // Clear entire state for this screen (original behavior)
      FlowCrudStateRegistry().clear(screenKey);
      SearchStateManager().clear(screenKey, searchName);

      DigitLogger.debug('CLEAR_STATE: Cleared all state for screen', category: LogCategory.state, context: {'screenKey': screenKey});
    } else {
      // Selective clearing

      // 1. Remove specific filters from SearchStateManager
      // Use removeFiltersByKeysForScreen to clear across ALL searchNames for this screen
      // This handles cases where filters were added with different 'name' values
      if (filterKeys.isNotEmpty) {
        SearchStateManager().removeFiltersByKeysForScreen(
          screenKey,
          filterKeys,
          triggerSearch: false, // We'll trigger manually if needed
        );
        DigitLogger.debug('CLEAR_STATE: Removed filters', category: LogCategory.state, context: {'filterKeys': filterKeys, 'screenKey': screenKey});
      }

      // 2. Clear orderBy if requested
      if (clearOrderBy) {
        SearchStateManager().updateOrderBy(
          screenKey,
          searchName,
          null,
          triggerSearch: false,
        );
        DigitLogger.debug('CLEAR_STATE: Cleared orderBy', category: LogCategory.state);
      }

      // 3. Remove specific keys from widgetData
      if (widgetKeys.isNotEmpty) {
        final currentState = FlowCrudStateRegistry().get(screenKey);
        if (currentState != null) {
          final updatedWidgetData =
              Map<String, dynamic>.from(currentState.widgetData ?? {});

          for (final key in widgetKeys) {
            updatedWidgetData.remove(key);
          }

          final updatedState = currentState.copyWith(
            widgetData: updatedWidgetData,
          );
          FlowCrudStateRegistry().update(screenKey, updatedState);

          DigitLogger.debug('CLEAR_STATE: Removed widgetData keys', category: LogCategory.state, context: {'widgetKeys': widgetKeys});
        }
      }
    }

    // Trigger search only if requested AND there are remaining filters
    // If all filters are cleared, clear the page state instead
    if (triggerSearch) {
      final hasRemainingFilters = SearchStateManager().hasFiltersForScreen(screenKey);
      if (hasRemainingFilters) {
        SearchStateManager().updateFilters(
          screenKey,
          searchName,
          [], // Empty list just to trigger the callback
          triggerSearch: true,
        );
        DigitLogger.debug('CLEAR_STATE: Triggered search refresh (remaining filters exist)', category: LogCategory.state);
      } else {
        // No remaining filters - clear the page state
        SearchStateManager().updateFilters(
          screenKey,
          searchName,
          [],
          triggerSearch: false,
        );
        FlowCrudStateRegistry().clear(screenKey);
        DigitLogger.debug('CLEAR_STATE: Cleared page state (no remaining filters)', category: LogCategory.state);
      }
    }

    return contextData;
  }
}
