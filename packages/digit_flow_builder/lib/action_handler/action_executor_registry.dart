import 'package:digit_flow_builder/action_handler/executors/close_popup_executor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../debug/debug_event.dart';
import '../debug/flow_debugger.dart';
import 'action_config.dart';
import 'executors/action_executor.dart';
import 'executors/navigation_executor.dart';
import 'executors/back_navigation_executor.dart';
import 'executors/crud_executor.dart';
import 'executors/search_executor.dart';
import 'executors/refresh_search_executor.dart';
import 'executors/transformer_executor.dart';
import 'executors/toast_executor.dart';
import 'executors/clear_state_executor.dart';
import 'executors/open_scanner_executor.dart';
import 'executors/reverse_transformer_executor.dart';

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
    register('CLOSE_POPUP', ClosePopupExecutor());
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
      if (kDebugMode) {
        FlowDebugger().logAction(
          actionType: action.actionType,
          status: DebugEventStatus.skipped,
          properties: Map<String, dynamic>.from(action.properties),
          inputContextKeys: contextData.keys.toList(),
          configPath: action.configPath,
          screenKey: action.screenKey,
        );
      }
      return contextData;
    }

    // Centralized handling: if action has parentScreenKey (from popup context),
    // inject it into contextData so all executors can access it
    final enrichedContextData = Map<String, dynamic>.from(contextData);
    final parentScreenKey = action.properties['parentScreenKey'] as String?;
    if (parentScreenKey != null) {
      enrichedContextData['parentScreenKey'] = parentScreenKey;
    }

    final Stopwatch? stopwatch = kDebugMode ? (Stopwatch()..start()) : null;

    // Log "started" event before execution so the viewer can show in-progress pointer
    if (kDebugMode) {
      FlowDebugger().logAction(
        actionType: action.actionType,
        status: DebugEventStatus.started,
        properties: Map<String, dynamic>.from(action.properties),
        inputContextKeys: enrichedContextData.keys.toList(),
        configPath: action.configPath,
        screenKey: action.screenKey,
        contextDataSnapshot: enrichedContextData,
      );
    }

    try {
      final result = await executor.execute(action, context, enrichedContextData);
      if (kDebugMode) {
        stopwatch!.stop();
        FlowDebugger().logAction(
          actionType: action.actionType,
          status: DebugEventStatus.success,
          properties: Map<String, dynamic>.from(action.properties),
          inputContextKeys: enrichedContextData.keys.toList(),
          outputContextKeys: result.keys.toList(),
          configPath: action.configPath,
          screenKey: action.screenKey,
          duration: stopwatch.elapsed,
          contextDataSnapshot: result,
        );
      }
      return result;
    } catch (e, stackTrace) {
      debugPrint('❌ Error executing action ${action.actionType}: $e');
      debugPrint('Stack trace: $stackTrace');

      if (kDebugMode) {
        stopwatch!.stop();
        FlowDebugger().logAction(
          actionType: action.actionType,
          status: DebugEventStatus.failure,
          properties: Map<String, dynamic>.from(action.properties),
          inputContextKeys: enrichedContextData.keys.toList(),
          errorMessage: e.toString(),
          stackTrace: stackTrace.toString(),
          configPath: action.configPath,
          screenKey: action.screenKey,
          duration: stopwatch.elapsed,
          contextDataSnapshot: enrichedContextData,
        );
      }

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