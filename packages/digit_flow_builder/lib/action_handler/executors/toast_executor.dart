import 'package:flutter/material.dart';
import '../action_config.dart';
import 'action_executor.dart';

class ToastExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'SHOW_TOAST';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final message = action.properties['message'] ?? 'Unknown error';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    return contextData;
  }
}