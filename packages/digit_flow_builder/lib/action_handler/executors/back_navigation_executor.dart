import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../flow_builder.dart';
import '../../router/flow_builder_routes.gm.dart';
import '../action_config.dart';
import 'action_executor.dart';

class BackNavigationExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'BACK_NAVIGATION';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final targetPageName = action.properties['name'] as String?;
    final router = context.router;

    if (targetPageName == null || targetPageName.isEmpty) {
      // If no target page specified, just do a single pop
      _performSinglePop(context);
      return contextData;
    }

    // First check if target page exists in the stack
    bool targetExists = false;
    final routeStack = router.stack;

    for (final route in routeStack) {
      if (route.name?.contains('FlowBuilderHomeRoute') == true) {
        // Try to get arguments from routeData
        final routeData = route.arguments;
        if (routeData != null) {
          final arguments = routeData;
          if (route.name?.contains('FlowBuilderHomeRoute') == true) {
            final args = route.arguments;
            if (args is FlowBuilderHomeRouteArgs) {
              final pageName = args.pageName;
              if (pageName == targetPageName) {
                targetExists = true;
                break;
              }
            }
          }
        }
      }
    }

    if (targetExists) {
      // Target exists in stack, safe to use popUntil
      try {
        router.popUntil((route) {
          if (route.settings.name?.contains('FlowBuilderHomeRoute') == true) {
            final args = route.settings.arguments;
            if (args is FlowBuilderHomeRouteArgs) {
              return args.pageName == targetPageName;
            }
          }
          return false;
        });
      } catch (e) {
        // If error occurs, do single pop
        _performSinglePop(context);
      }
    } else {
      // Target not found in stack, just do single pop
      _performSinglePop(context);
    }

    return contextData;
  }

  void _performSinglePop(BuildContext context) {
    final router = context.router;
    if (router.canPop()) {
      router.pop();
    }
  }
}
