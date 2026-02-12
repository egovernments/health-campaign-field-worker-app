/// Debug event types for the flow debugger.
enum DebugEventType {
  action,
  condition,
  stateChange,
  navigation,
  resolver,
}

/// Status of a debug event.
enum DebugEventStatus {
  success,
  failure,
  skipped,

  /// Action has started executing (in-progress).
  started,
}

/// Base class for all debug events logged by FlowDebugger.
class FlowDebugEvent {
  final String id;
  final DebugEventType type;
  final DateTime timestamp;
  final DebugEventStatus status;
  final String summary;
  final Duration? duration;
  final Map<String, dynamic> details;

  /// Error message when status is failure.
  final String? error;

  /// Stack trace string captured at the point of failure.
  final String? errorTrace;

  FlowDebugEvent({
    required this.id,
    required this.type,
    required this.timestamp,
    required this.status,
    required this.summary,
    this.duration,
    this.details = const {},
    this.error,
    this.errorTrace,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'timestamp': timestamp.toIso8601String(),
        'status': status.name,
        'summary': summary,
        if (duration != null) 'durationMs': duration!.inMilliseconds,
        'details': details,
        if (error != null) 'error': error,
        if (errorTrace != null) 'errorTrace': errorTrace,
      };
}

/// Debug event for action executions.
class ActionDebugEvent extends FlowDebugEvent {
  final String actionType;
  final Map<String, dynamic> properties;
  final String? errorMessage;

  /// JSON path within the flow config, e.g. "initActions[2]"
  final String? configPath;

  /// Screen key this action belongs to
  final String? screenKey;

  /// Snapshot of contextData at this execution point (deep-sanitized to JSON-safe types).
  final Map<String, dynamic> contextDataSnapshot;

  ActionDebugEvent({
    required super.id,
    required super.timestamp,
    required super.status,
    required this.actionType,
    this.properties = const {},
    List<String> inputContextKeys = const [],
    List<String> outputContextKeys = const [],
    this.errorMessage,
    this.configPath,
    this.screenKey,
    this.contextDataSnapshot = const {},
    super.duration,
    String? stackTrace,
  }) : super(
          type: DebugEventType.action,
          summary: '$actionType ${status.name}',
          error: errorMessage,
          errorTrace: stackTrace,
          details: {
            'actionType': actionType,
            'properties': properties,
            if (errorMessage != null) 'error': errorMessage,
            if (configPath != null) 'configPath': configPath,
            if (screenKey != null) 'screenKey': screenKey,
          },
        );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'actionType': actionType,
        'properties': properties,
        if (errorMessage != null) 'error': errorMessage,
        if (configPath != null) 'configPath': configPath,
        if (screenKey != null) 'screenKey': screenKey,
        if (contextDataSnapshot.isNotEmpty) 'contextData': contextDataSnapshot,
      };
}

/// Debug event for condition evaluations.
class ConditionDebugEvent extends FlowDebugEvent {
  final String expression;
  final Map<String, String> evaluationDataSnapshot;
  final bool result;

  /// JSON path within the flow config, e.g. "onAction[0].condition"
  final String? configPath;

  /// Screen key this condition belongs to
  final String? screenKey;

  ConditionDebugEvent({
    required super.id,
    required super.timestamp,
    required this.expression,
    this.evaluationDataSnapshot = const {},
    required this.result,
    this.configPath,
    this.screenKey,
    String? errorMessage,
    String? stackTrace,
  }) : super(
          type: DebugEventType.condition,
          status: errorMessage != null
              ? DebugEventStatus.failure
              : (result ? DebugEventStatus.success : DebugEventStatus.skipped),
          summary: errorMessage != null
              ? 'Condition ERROR: $expression'
              : 'Condition: ${result ? "TRUE" : "FALSE"}',
          error: errorMessage,
          errorTrace: stackTrace,
          details: {
            'expression': expression,
            'evaluationData': evaluationDataSnapshot,
            'result': result,
            if (configPath != null) 'configPath': configPath,
            if (screenKey != null) 'screenKey': screenKey,
          },
        );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'expression': expression,
        'evaluationData': evaluationDataSnapshot,
        'result': result,
        if (configPath != null) 'configPath': configPath,
        if (screenKey != null) 'screenKey': screenKey,
      };
}

/// Debug event for state changes in FlowCrudStateRegistry.
class StateChangeDebugEvent extends FlowDebugEvent {
  final String compositeKey;
  final List<String> changedFields;
  final int? stateWrapperLength;
  final List<String> formDataKeys;
  final List<String> widgetDataKeys;
  final bool isLoading;

  StateChangeDebugEvent({
    required super.id,
    required super.timestamp,
    required this.compositeKey,
    this.changedFields = const [],
    this.stateWrapperLength,
    this.formDataKeys = const [],
    this.widgetDataKeys = const [],
    this.isLoading = false,
  }) : super(
          type: DebugEventType.stateChange,
          status: DebugEventStatus.success,
          summary: 'State: $compositeKey',
          details: {
            'compositeKey': compositeKey,
            'changedFields': changedFields,
            'stateWrapperLength': stateWrapperLength,
            'formDataKeys': formDataKeys,
            'widgetDataKeys': widgetDataKeys,
            'isLoading': isLoading,
          },
        );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'compositeKey': compositeKey,
        'changedFields': changedFields,
        'stateWrapperLength': stateWrapperLength,
        'formDataKeys': formDataKeys,
        'widgetDataKeys': widgetDataKeys,
        'isLoading': isLoading,
      };
}

/// Debug event for navigation transitions.
class NavigationDebugEvent extends FlowDebugEvent {
  final String? fromPage;
  final String toPage;
  final String navigationMode;
  final Map<String, String> params;
  final String? popUntilPageName;

  NavigationDebugEvent({
    required super.id,
    required super.timestamp,
    this.fromPage,
    required this.toPage,
    required this.navigationMode,
    this.params = const {},
    this.popUntilPageName,
  }) : super(
          type: DebugEventType.navigation,
          status: DebugEventStatus.success,
          summary: 'Nav: ${fromPage != null ? "$fromPage -> " : ""}$toPage',
          details: {
            if (fromPage != null) 'fromPage': fromPage,
            'toPage': toPage,
            'navigationMode': navigationMode,
            'params': params,
            if (popUntilPageName != null) 'popUntilPageName': popUntilPageName,
          },
        );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        if (fromPage != null) 'fromPage': fromPage,
        'toPage': toPage,
        'navigationMode': navigationMode,
        'params': params,
        if (popUntilPageName != null) 'popUntilPageName': popUntilPageName,
      };
}

/// Debug event for template/value resolver calls.
class ResolverDebugEvent extends FlowDebugEvent {
  /// The raw input template or value, e.g. "{{navigation.boundary}}"
  final String input;

  /// The resolved output value as a string
  final String resolvedValue;

  /// The resolved output value's runtime type
  final String resolvedType;

  /// Which resolver handled this: resolveValueRaw, resolveTemplate, interpolateWithCrudStates
  final String resolverName;

  /// The prefix/source path that matched, e.g. "navigation.", "item.", "singleton."
  final String? matchedPrefix;

  /// Full snapshot of the context data available during resolution (deep-sanitized).
  final Map<String, dynamic> contextDataSnapshot;

  ResolverDebugEvent({
    required super.id,
    required super.timestamp,
    required this.input,
    required this.resolvedValue,
    required this.resolvedType,
    required this.resolverName,
    this.matchedPrefix,
    this.contextDataSnapshot = const {},
    String? errorMessage,
    String? stackTrace,
  }) : super(
          type: DebugEventType.resolver,
          status: errorMessage != null
              ? DebugEventStatus.failure
              : (resolvedValue == 'null'
                  ? DebugEventStatus.failure
                  : DebugEventStatus.success),
          summary: errorMessage != null
              ? '$input -> ERROR: $errorMessage'
              : '$input -> $resolvedValue',
          error: errorMessage,
          errorTrace: stackTrace,
          details: {
            'input': input,
            'resolvedValue': resolvedValue,
            'resolvedType': resolvedType,
            'resolverName': resolverName,
            if (matchedPrefix != null) 'matchedPrefix': matchedPrefix,
          },
        );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'input': input,
        'resolvedValue': resolvedValue,
        'resolvedType': resolvedType,
        'resolverName': resolverName,
        if (matchedPrefix != null) 'matchedPrefix': matchedPrefix,
        if (contextDataSnapshot.isNotEmpty) 'contextData': contextDataSnapshot,
      };
}
