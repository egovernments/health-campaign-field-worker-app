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
    // Prefer the Navigator captured by the calling widget at build time.
    // The button's own context may be deactivated by the time this runs
    // (e.g. an ancestor rebuild during the action chain), which would
    // make `Navigator.of(context)` throw a null-check error.
    final preCaptured =
        contextData['_preCaptured'] as Map<String, Object>?;
    NavigatorState? navigator = preCaptured?['navigator'] as NavigatorState?;
    if (navigator == null) {
      try {
        navigator = Navigator.of(context, rootNavigator: true);
      } catch (_) {
        // Context deactivated and no captured handle — popup is likely
        // already dismissed; treat as a no-op.
      }
    }
    if (navigator != null && navigator.canPop()) {
      navigator.pop();
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
