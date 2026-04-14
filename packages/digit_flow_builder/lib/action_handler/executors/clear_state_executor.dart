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
class ClearStateExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CLEAR_STATE';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final crudCtx = CrudItemContext.of(context);
    final compositeKey =
        crudCtx?.compositeKey ?? getEffectiveCompositeKey(context, contextData);

    if (compositeKey == null) {
      return contextData;
    }

    final properties = action.properties;
    final searchName = properties['name'] as String? ?? 'default';
    final clearAll = properties['clearAll'] as bool? ?? false;
    final triggerSearch = properties['triggerSearch'] as bool? ?? false;
    final clearOrderBy = properties['clearOrderBy'] as bool? ?? false;

    final filterKeys = <String>[];
    if (properties['filterKeys'] != null) {
      final keys = properties['filterKeys'];
      if (keys is List) {
        filterKeys.addAll(keys.map((k) => k.toString()));
      }
    }

    final widgetKeys = <String>[];
    if (properties['widgetKeys'] != null) {
      final keys = properties['widgetKeys'];
      if (keys is List) {
        widgetKeys.addAll(keys.map((k) => k.toString()));
      }
    }

    if (clearAll ||
        (filterKeys.isEmpty && widgetKeys.isEmpty && !clearOrderBy)) {
      FlowCrudStateRegistry().clear(compositeKey);
      SearchStateManager().clear(compositeKey, searchName);
    } else {
      if (filterKeys.isNotEmpty) {
        SearchStateManager().removeFiltersByKeysForScreen(
          compositeKey,
          filterKeys,
          triggerSearch: false,
        );
      }

      if (clearOrderBy) {
        SearchStateManager().updateOrderBy(
          compositeKey,
          searchName,
          null,
          triggerSearch: false,
        );
      }

      if (widgetKeys.isNotEmpty) {
        final currentState = FlowCrudStateRegistry().get(compositeKey);
        if (currentState != null) {
          final updatedWidgetData =
              Map<String, dynamic>.from(currentState.widgetData ?? {});

          for (final key in widgetKeys) {
            updatedWidgetData.remove(key);
          }

          final updatedState = currentState.copyWith(
            widgetData: updatedWidgetData,
          );
          FlowCrudStateRegistry().update(compositeKey, updatedState);
        }
      }
    }

    if (triggerSearch) {
      final hasRemainingFilters =
          SearchStateManager().hasFiltersForScreen(compositeKey);
      if (hasRemainingFilters) {
        SearchStateManager().updateFilters(
          compositeKey,
          searchName,
          [],
          triggerSearch: true,
        );
      } else {
        SearchStateManager().updateFilters(
          compositeKey,
          searchName,
          [],
          triggerSearch: false,
        );
      }
    }

    return contextData;
  }
}
