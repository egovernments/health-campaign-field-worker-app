import 'package:flutter/material.dart';

import '../../blocs/flow_crud_bloc.dart';
import '../../utils/interpolation.dart';
import '../action_config.dart';
import 'action_executor.dart';

/// Executor for CLEAR_STATE action
/// Clears both the CRUD state (search results) and widgetData (filter selections)
class ClearStateExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'CLEAR_STATE';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final screenKey = getScreenKeyFromArgs(context);

    if (screenKey != null) {
      // Clear the entire state for this screen
      FlowCrudStateRegistry().clear(screenKey);

      debugPrint('✅ CLEAR_STATE: Cleared state for screen: $screenKey');
    }

    return contextData;
  }
}
