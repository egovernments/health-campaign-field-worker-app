import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'debug_event.dart';

/// Singleton runtime debugger for the flow builder.
///
/// Logs action executions, condition evaluations, state changes,
/// and navigation events. All logging is no-op when [enabled] is false
/// or when running in release mode.
///
/// Usage:
/// ```dart
/// FlowDebugger().enabled = true;
/// FlowDebugger().logAction(...);
/// ```
class FlowDebugger {
  static final FlowDebugger _instance = FlowDebugger._internal();

  factory FlowDebugger() => _instance;

  FlowDebugger._internal();

  /// Whether debug logging is active. Must be true AND running in debug mode.
  bool enabled = false;

  /// Maximum events to retain (ring buffer).
  int maxEvents = 500;

  /// Observable list of debug events. UI listens via ValueListenableBuilder.
  final ValueNotifier<List<FlowDebugEvent>> events =
      ValueNotifier<List<FlowDebugEvent>>([]);

  int _idCounter = 0;

  String _nextId() => '${++_idCounter}';

  bool get _active => enabled && !kReleaseMode;

  /// Log an action execution.
  void logAction({
    required String actionType,
    required DebugEventStatus status,
    Map<String, dynamic> properties = const {},
    List<String> inputContextKeys = const [],
    List<String> outputContextKeys = const [],
    String? errorMessage,
    String? stackTrace,
    String? configPath,
    String? screenKey,
    Duration? duration,
    Map<String, dynamic> contextDataSnapshot = const {},
  }) {
    if (!_active) return;
    _addEvent(ActionDebugEvent(
      id: _nextId(),
      timestamp: DateTime.now(),
      status: status,
      actionType: actionType,
      properties: _sanitize(properties),
      inputContextKeys: inputContextKeys,
      outputContextKeys: outputContextKeys,
      errorMessage: errorMessage,
      stackTrace: stackTrace,
      configPath: configPath,
      screenKey: screenKey,
      duration: duration,
      contextDataSnapshot: _deepSanitize(contextDataSnapshot),
    ));
  }

  /// Log a condition evaluation.
  void logCondition({
    required String expression,
    Map<String, dynamic> evaluationData = const {},
    required bool result,
    String? errorMessage,
    String? stackTrace,
    String? configPath,
    String? screenKey,
  }) {
    if (!_active) return;
    _addEvent(ConditionDebugEvent(
      id: _nextId(),
      timestamp: DateTime.now(),
      expression: expression,
      evaluationDataSnapshot: _sanitizeToStringMap(evaluationData),
      result: result,
      errorMessage: errorMessage,
      stackTrace: stackTrace,
      configPath: configPath,
      screenKey: screenKey,
    ));
  }

  /// Log a state change in FlowCrudStateRegistry.
  void logStateChange({
    required String compositeKey,
    List<String> changedFields = const [],
    int? stateWrapperLength,
    List<String> formDataKeys = const [],
    List<String> widgetDataKeys = const [],
    bool isLoading = false,
  }) {
    if (!_active) return;
    _addEvent(StateChangeDebugEvent(
      id: _nextId(),
      timestamp: DateTime.now(),
      compositeKey: compositeKey,
      changedFields: changedFields,
      stateWrapperLength: stateWrapperLength,
      formDataKeys: formDataKeys,
      widgetDataKeys: widgetDataKeys,
      isLoading: isLoading,
    ));
  }

  /// Log a navigation event.
  void logNavigation({
    String? fromPage,
    required String toPage,
    required String navigationMode,
    Map<String, dynamic> params = const {},
    String? popUntilPageName,
  }) {
    if (!_active) return;
    _addEvent(NavigationDebugEvent(
      id: _nextId(),
      timestamp: DateTime.now(),
      fromPage: fromPage,
      toPage: toPage,
      navigationMode: navigationMode,
      params: _sanitizeToStringMap(params),
      popUntilPageName: popUntilPageName,
    ));
  }

  /// Log a template/value resolution.
  void logResolver({
    required String input,
    required dynamic resolvedValue,
    required String resolverName,
    String? matchedPrefix,
    Map<String, dynamic> contextData = const {},
    String? errorMessage,
    String? stackTrace,
  }) {
    if (!_active) return;
    final valStr = resolvedValue?.toString() ?? 'null';
    _addEvent(ResolverDebugEvent(
      id: _nextId(),
      timestamp: DateTime.now(),
      input: input,
      resolvedValue: valStr.length > 300 ? '${valStr.substring(0, 300)}...' : valStr,
      resolvedType: resolvedValue?.runtimeType.toString() ?? 'Null',
      resolverName: resolverName,
      matchedPrefix: matchedPrefix,
      contextDataSnapshot: _deepSanitize(contextData),
      errorMessage: errorMessage,
      stackTrace: stackTrace,
    ));
  }

  /// Clear all events.
  void clear() {
    events.value = [];
    _idCounter = 0;
  }

  void _addEvent(FlowDebugEvent event) {
    final list = List<FlowDebugEvent>.from(events.value);
    list.add(event);
    if (list.length > maxEvents) {
      list.removeRange(0, list.length - maxEvents);
    }
    // Defer notification to avoid setState during build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      events.value = list;
    });
  }

  /// Convert map values to strings to avoid holding entity references.
  Map<String, dynamic> _sanitize(Map<String, dynamic> data) {
    return data.map((key, value) {
      if (value is Map || value is List) {
        return MapEntry(key, value.toString().length > 200
            ? '${value.toString().substring(0, 200)}...'
            : value.toString());
      }
      return MapEntry(key, value);
    });
  }

  /// Convert all values to strings for safe storage.
  Map<String, String> _sanitizeToStringMap(Map<String, dynamic> data) {
    return data.map((key, value) {
      final str = value?.toString() ?? 'null';
      return MapEntry(key, str.length > 200 ? '${str.substring(0, 200)}...' : str);
    });
  }

  /// Recursively convert any value to a JSON-safe structure, preserving
  /// Maps/Lists as real objects so the browser viewer can render a tree.
  /// Uses [depth] to prevent infinite recursion on circular references.
  Map<String, dynamic> _deepSanitize(Map<String, dynamic> data, [int depth = 0]) {
    if (depth > 6) return {'_truncated': 'max depth reached'};
    return data.map((key, value) => MapEntry(key, _deepSanitizeValue(value, depth)));
  }

  dynamic _deepSanitizeValue(dynamic value, [int depth = 0]) {
    if (depth > 6) return '<max depth>';
    if (value == null || value is num || value is bool) return value;
    if (value is String) {
      return value.length > 500 ? '${value.substring(0, 500)}...' : value;
    }
    if (value is DateTime) return value.toIso8601String();
    if (value is Duration) return '${value.inMilliseconds}ms';
    if (value is List) {
      return value.map((e) => _deepSanitizeValue(e, depth + 1)).toList();
    }
    if (value is Map) {
      return value.map(
        (k, v) => MapEntry(k.toString(), _deepSanitizeValue(v, depth + 1)),
      );
    }
    // Try toMap() for EntityModel and similar objects
    try {
      final map = (value as dynamic).toMap() as Map;
      return _deepSanitizeValue(map, depth + 1);
    } catch (_) {}
    // Try toJson() as fallback
    try {
      final json = (value as dynamic).toJson();
      if (json is Map || json is List) return _deepSanitizeValue(json, depth + 1);
      if (json is String) return json;
    } catch (_) {}
    final str = value.toString();
    return str.length > 500 ? '${str.substring(0, 500)}...' : str;
  }
}
