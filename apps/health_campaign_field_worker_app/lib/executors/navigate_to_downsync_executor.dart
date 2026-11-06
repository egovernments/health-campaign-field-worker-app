import 'package:digit_flow_builder/action_handler/action_config.dart';
import 'package:digit_flow_builder/action_handler/executors/action_executor.dart';
import 'package:flutter/material.dart';

import '../router/app_router.dart';

class NavigateToBeneficiaryIdDownSyncExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) =>
      actionType == 'NAVIGATE_TO_BENEFICIARY_ID_DOWN_SYNC';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {

    final router = context.router;

    router.popUntil((route) => route.settings.name == 'HomeRoute');

    await router.push(BeneficiaryIdDownSyncRoute());

    return contextData;
  }
}
