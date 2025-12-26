import 'package:flutter/material.dart';

import '../action_config.dart';
import 'action_executor.dart';

/// Executor for CLOSE_POPUP action
/// Closes the current popup/dialog by popping the navigator
/// Note: When used from ActionPopupWidget, the popup is already closed
/// by the inline handler before this executor runs. This executor
/// handles cases where CLOSE_POPUP is called from other contexts.
class ClosePopupExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CLOSE_POPUP';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    // Check if this is from a popup context (already handled inline)
    final isFromPopup = action.properties['_popupContext'] == true;

    // If not from popup context and navigator can pop, pop it
    if (!isFromPopup && Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    return contextData;
  }
}
