import 'package:flutter/material.dart';

import '../action_config.dart';

/// Base interface for all action executors
abstract class ActionExecutor {
  /// Execute the action and return updated context data
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  );

  /// Check if this executor can handle the given action type
  bool canHandle(String actionType);
}
