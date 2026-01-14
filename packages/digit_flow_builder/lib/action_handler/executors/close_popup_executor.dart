import 'package:flutter/material.dart';

import '../action_config.dart';
import 'action_executor.dart';

/// Executor for CLOSE_POPUP action
/// Closes the current popup/dialog by popping the navigator
/// Also passes any properties from the action to contextData for subsequent actions
class ClosePopupExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CLOSE_POPUP';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    // Close the popup if navigator can pop
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    // Pass any properties from action to contextData for subsequent actions
    // This allows CLOSE_POPUP to inject values like parentScreenKey
    final updatedContextData = Map<String, dynamic>.from(contextData);
    action.properties.forEach((key, value) {
      if (value != null) {
        updatedContextData[key] = value;
      }
    });

    return updatedContextData;
  }
}
