import 'package:flutter/material.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../blocs/search_state_manager.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../action_config.dart';
import 'action_executor.dart';

/// Executor for SNAPSHOT_STATE action.
///
/// Lets a popup remember what its widgetData *and* actively-applied search
/// filters looked like right before something reset them (e.g. a popup's own
/// `onOpenAction` clearing filters so its dropdown options are computed from
/// the full dataset), and restore both on close-without-apply — so closing a
/// filter popup without hitting "Apply" puts things back exactly as they
/// were, instead of leaving the last-*applied* filter wiped.
///
/// Properties:
/// - mode: 'save' | 'restore' (required)
/// - widgetKeys: List<String> - widgetData keys to snapshot/restore
/// - searchName: String - optional; if provided, the search filter bucket
///   for this name is also snapshotted/restored (restore re-triggers search)
///
/// Typical wiring on a popup config — SNAPSHOT_STATE save must run BEFORE
/// any CLEAR_STATE/SEARCH_EVENT in the same onOpenAction list:
///   "onOpenAction": [
///     { "actionType": "SNAPSHOT_STATE",
///       "properties": { "mode": "save", "searchName": "pgrService",
///         "widgetKeys": ["assignTo", "complaintType", "locality"] } },
///     { "actionType": "CLEAR_STATE", ... },
///     { "actionType": "SEARCH_EVENT", ... }
///   ]
///   "onCloseAction": [
///     { "actionType": "SNAPSHOT_STATE",
///       "properties": { "mode": "restore", "searchName": "pgrService",
///         "widgetKeys": ["assignTo", "complaintType", "locality"] } },
///     { "actionType": "CLOSE_POPUP", "properties": {} }
///   ]
class SnapshotStateExecutor extends ActionExecutor {
  static const _snapshotPrefix = '__snapshot_';
  static const _snapshotFiltersKey = '__snapshot_filters_';

  @override
  bool canHandle(String actionType) => actionType == 'SNAPSHOT_STATE';

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
    final mode = properties['mode'] as String?;
    final searchName = properties['searchName'] as String?;
    final widgetKeys = <String>[];
    final keys = properties['widgetKeys'];
    if (keys is List) {
      widgetKeys.addAll(keys.map((k) => k.toString()));
    }

    if (mode == null || (widgetKeys.isEmpty && searchName == null)) {
      return contextData;
    }

    final currentState = FlowCrudStateRegistry().get(compositeKey);
    final widgetData =
        Map<String, dynamic>.from(currentState?.widgetData ?? {});

    if (mode == 'save') {
      for (final key in widgetKeys) {
        if (widgetData.containsKey(key)) {
          widgetData['$_snapshotPrefix$key'] = widgetData[key];
        } else {
          widgetData.remove('$_snapshotPrefix$key');
        }
      }
      if (searchName != null) {
        final currentFilters =
            SearchStateManager().getFilters(compositeKey, searchName);
        widgetData['$_snapshotFiltersKey$searchName'] =
            List<dynamic>.from(currentFilters);
      }
    } else if (mode == 'restore') {
      for (final key in widgetKeys) {
        final snapshotKey = '$_snapshotPrefix$key';
        if (widgetData.containsKey(snapshotKey)) {
          widgetData[key] = widgetData[snapshotKey];
        } else {
          widgetData.remove(key);
        }
      }
      if (searchName != null) {
        final snapshotFiltersKey = '$_snapshotFiltersKey$searchName';
        final snapshotFilters = widgetData[snapshotFiltersKey];
        if (snapshotFilters is List) {
          SearchStateManager().updateFilters(
            compositeKey,
            searchName,
            List<dynamic>.from(snapshotFilters),
            triggerSearch: true,
          );
        }
      }
    }

    final updatedState = (currentState ?? const FlowCrudState()).copyWith(
      widgetData: widgetData,
    );
    FlowCrudStateRegistry().update(compositeKey, updatedState);

    return contextData;
  }
}
