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
        // Preserve the non-cleared filters in this searchName's bucket and
        // just re-fire the search. Passing `[]` here wipes the bucket
        // entirely — including filters added by initActions (e.g. tenantId
        // on the complaints inbox) — leaving `getAllFilters()` empty and the
        // list stuck on the prior (or blank) wrapper.
        final currentFilters =
            SearchStateManager().getFilters(compositeKey, searchName);
        SearchStateManager().updateFilters(
          compositeKey,
          searchName,
          currentFilters,
          triggerSearch: true,
        );
      } else {
        // No filters remain to drive a search. Drop the prior result wrapper
        // so stale rows from the last query (e.g. proximity-filtered list when
        // proximity was the sole filter) don't linger on screen. Preserve
        // widgetData / formData so other widgets retain their state.
        final currentState = FlowCrudStateRegistry().get(compositeKey);
        if (currentState != null && currentState.stateWrapper != null) {
          FlowCrudStateRegistry().update(
            compositeKey,
            FlowCrudState(
              base: currentState.base,
              stateWrapper: null,
              formData: currentState.formData,
              widgetData: currentState.widgetData,
              isLoading: false,
            ),
          );
        }
      }
    }

    return contextData;
  }
}
