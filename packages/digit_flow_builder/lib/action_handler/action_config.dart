class ActionConfig {
  final String action;
  final String actionType;
  final Map<String, dynamic> properties;

  ActionConfig(
      {required this.action,
      required this.actionType,
      required this.properties});

  factory ActionConfig.fromJson(Map<String, dynamic> json) {
    return ActionConfig(
      action: json['action'] ?? '',
      actionType: json['actionType'] ?? '',
      properties: json['properties'] ?? {},
    );
  }
}
