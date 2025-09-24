import 'package:flutter/material.dart';
import 'action_config.dart';
import 'executors/action_executor.dart';
import 'executors/navigation_executor.dart';
import 'executors/crud_executor.dart';
import 'executors/search_executor.dart';
import 'executors/transformer_executor.dart';
import 'executors/toast_executor.dart';

/// Registry for managing action executors
class ActionExecutorRegistry {
  static final ActionExecutorRegistry _instance = ActionExecutorRegistry._internal();

  factory ActionExecutorRegistry() => _instance;

  ActionExecutorRegistry._internal() {
    // Register default executors
    registerDefaultExecutors();
  }

  final Map<String, ActionExecutor> _executors = {};

  /// Register default built-in executors
  void registerDefaultExecutors() {
    register('NAVIGATION', NavigationExecutor());
    register('CREATE_EVENT', CrudExecutor());
    register('SEARCH_EVENT', SearchExecutor());
    register('FETCH_TRANSFORMER_CONFIG', TransformerExecutor());
    register('SHOW_TOAST', ToastExecutor());
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

    try {
      return await executor.execute(action, context, contextData);
    } catch (e, stackTrace) {
      debugPrint('❌ Error executing action ${action.actionType}: $e');
      debugPrint('Stack trace: $stackTrace');

      // Return original context data if execution fails
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