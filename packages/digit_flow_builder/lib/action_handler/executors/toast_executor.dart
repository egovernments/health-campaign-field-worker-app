import 'package:digit_ui_components/digit_components.dart';
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
    final typeStr = action.properties['type']?.toString() ?? 'error';

    final ToastType toastType;
    switch (typeStr) {
      case 'success':
        toastType = ToastType.success;
        break;
      case 'warning':
        toastType = ToastType.warning;
        break;
      case 'info':
        toastType = ToastType.info;
        break;
      default:
        toastType = ToastType.error;
    }

    Toast.showToast(context, message: message, type: toastType);
    return contextData;
  }
}
