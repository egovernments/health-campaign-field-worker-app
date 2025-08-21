class ActionConfig {
  final String action;
  final String actionType;
  final Map<String, dynamic> properties;
  final Map<String, dynamic>? condition;
  final List<ActionConfig>? actions;

  ActionConfig({
    required this.action,
    required this.actionType,
    required this.properties,
    this.condition,
    this.actions,
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
}
