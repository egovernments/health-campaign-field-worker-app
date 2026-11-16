import 'package:digit_flow_builder/action_handler/executors/close_popup_executor.dart';

import 'package:flutter/material.dart';
import 'action_config.dart';
import 'executors/action_executor.dart';
import 'executors/custom_data_executor.dart';
import 'executors/navigation_executor.dart';
import 'executors/back_navigation_executor.dart';
import 'executors/crud_executor.dart';
import 'executors/open_popup_executor.dart';
import 'executors/search_executor.dart';
import 'executors/refresh_search_executor.dart';
import 'executors/transformer_executor.dart';
import 'executors/toast_executor.dart';
import 'executors/clear_state_executor.dart';
import 'executors/open_scanner_executor.dart';
import 'executors/reverse_transformer_executor.dart';

/// Registry for managing action executors
class ActionExecutorRegistry {
  static final ActionExecutorRegistry _instance =
      ActionExecutorRegistry._internal();

  factory ActionExecutorRegistry() => _instance;

  ActionExecutorRegistry._internal() {
    // Register default executors
    registerDefaultExecutors();
  }

  final Map<String, ActionExecutor> _executors = {};

  /// Optional hook called after every successful action execution.
  void Function(
    String actionType,
    Map<dynamic, dynamic> properties,
    Map<String, dynamic> result,
  )? onExecute;

  /// Optional hook called when an action execution throws an error.
  void Function(
    String actionType,
    Map<dynamic, dynamic> properties,
    dynamic error,
  )? onExecuteError;

  /// Register default built-in executors
  void registerDefaultExecutors() {
    register('NAVIGATION', NavigationExecutor());
    register('BACK_NAVIGATION', BackNavigationExecutor());
    register('CREATE_EVENT', CrudExecutor());
    register('UPDATE_EVENT', UpdateExecutor());
    register('SEARCH_EVENT', SearchExecutor());
    register('REFRESH_SEARCH', RefreshSearchExecutor());
    register('FETCH_TRANSFORMER_CONFIG', TransformerExecutor());
    register('SHOW_TOAST', ToastExecutor());
    register('CLEAR_STATE', ClearStateExecutor());
    register('OPEN_SCANNER', OpenScannerExecutor());
    register('REVERSE_TRANSFORM', ReverseTransformerExecutor());
    register('OPEN_POPUP', OpenPopupExecutor());
    register('CLOSE_POPUP', ClosePopupExecutor());
    register('CUSTOM_DATA', CustomDataExecutor());
  }

  /// Register a custom executor
  void register(String actionType, ActionExecutor executor) {
    _executors[actionType] = executor;
  }

  /// Unregister an executor
  void unregister(String actionType) {
    _executors.remove(actionType);
  }

  /// Get executor for a specific action type
  ActionExecutor? getExecutor(String actionType) {
    return _executors[actionType];
  }

  /// Execute an action using the appropriate executor
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final executor = getExecutor(action.actionType);

    if (executor == null) {
      debugPrint('⚠️ No executor found for action type: ${action.actionType}');
      return contextData;
    }

    // Centralized handling: if action has parentScreenKey (from popup context),
    // inject it into contextData so all executors can access it
    final enrichedContextData = Map<String, dynamic>.from(contextData);
    final parentScreenKey = action.properties['parentScreenKey'] as String?;
    if (parentScreenKey != null) {
      enrichedContextData['parentScreenKey'] = parentScreenKey;
    }

    try {
      final result = await executor.execute(action, context, enrichedContextData);
      onExecute?.call(action.actionType, action.properties, result);
      return result;
    } catch (e, stackTrace) {
      debugPrint('❌ Error executing action ${action.actionType}: $e');
      debugPrint('Stack trace: $stackTrace');
      onExecuteError?.call(action.actionType, action.properties, e);
      return contextData;
    }
  }

  /// Check if an action type is supported
  bool isSupported(String actionType) {
    return _executors.containsKey(actionType);
  }

  /// Get list of all supported action types
  List<String> getSupportedActionTypes() {
    return _executors.keys.toList();
  }

  /// Clear all registered executors (useful for testing)
  void clear() {
    _executors.clear();
  }

  /// Reset to default executors
  void reset() {
    clear();
    registerDefaultExecutors();
  }
}
