class ActionConfig {
  final String action;
  final String actionType;
  final Map<dynamic, dynamic> properties;
  final Map<String, dynamic>? condition;
  final List<ActionConfig>? actions;

  /// Debug-only: JSON path within the flow config, e.g. "initActions[2]"
  final String? configPath;

  /// Debug-only: screen key this action belongs to
  final String? screenKey;

  ActionConfig({
    required this.action,
    required this.actionType,
    required this.properties,
    this.condition,
    this.actions,
    this.configPath,
    this.screenKey,
  });

  factory ActionConfig.fromJson(Map<String, dynamic> json) {
    List<ActionConfig>? actions;
    if (json['actions'] != null) {
      actions = (json['actions'] as List)
          .map((actionJson) => ActionConfig.fromJson(actionJson))
          .toList();
    }

    return ActionConfig(
      action: json['action'] ?? '',
      actionType: json['actionType'] ?? '',
      properties: json['properties'] ?? {},
      condition: json['condition'],
      actions: actions,
    );
  }

  /// Create a copy with debug path information attached.
  ActionConfig withDebugPath({String? configPath, String? screenKey}) {
    return ActionConfig(
      action: action,
      actionType: actionType,
      properties: properties,
      condition: condition,
      actions: actions,
      configPath: configPath ?? this.configPath,
      screenKey: screenKey ?? this.screenKey,
    );
  }
}
