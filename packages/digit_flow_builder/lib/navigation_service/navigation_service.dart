import 'package:auto_route/auto_route.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../blocs/flow_crud_bloc.dart';
import '../router/flow_builder_routes.gm.dart';

abstract class NavigationService {
  void navigateTo({
    required String type,
    required String name,
    Map<String, dynamic>? data,
  });

  void navigateToHome();
}

class FlowBuilderNavigationService implements NavigationService {
  final BuildContext context;
  final Map<String, PageRouteInfo Function(Map<String, dynamic>? data)>
      routeMap;

  FlowBuilderNavigationService(this.context, this.routeMap);

  @override
  void navigateTo({
    required String type,
    required String name,
    Map<String, dynamic>? data,
  }) {
    final key = '$type::$name';
    final builder = routeMap[key];

    if (builder != null) {
      final route = builder(data);
      context.router.push(route);
    } else {
      debugPrint('⚠️ No route found for key: $key');
      Toast.showToast(context,
          message: 'No route found for key: $key', type: ToastType.error);
    }
  }

  @override
  void navigateToHome() {
    try {
      context.router.popUntil((route) {
        // Check if the route is HomeRoute (the main app HomePage)
        return route.settings.name == 'HomeRoute';
      });
    } catch (e) {
      debugPrint('⚠️ Error navigating to HOME: $e');
      // Fallback: try to pop if possible
      if (context.router.canPop()) {
        context.router.pop();
      }
    }
  }
}

class NavigationRegistry {
  static late NavigationService _service;

  static void init(NavigationService service) {
    _service = service;
  }

  static void navigateTo(Map<String, dynamic> properties) {
    final type = properties['type'] as String? ?? '';
    final name = properties['name'] as String? ?? '';
    final dataList = properties['data'] as List<dynamic>? ?? [];

    // Special handling for HOME navigation
    if (name == 'HOME') {
      _service.navigateToHome();
      return;
    }

    final data = <String, dynamic>{};
    for (final entry in dataList) {
      data[entry['key']] = entry['value'];
    }

    // Update navigation params for the target page before navigating
    // Store with both key formats for robust retrieval
    if (data.isNotEmpty && name.isNotEmpty) {
      // Store with plain name (e.g., "ADD_MEMBER")
      FlowCrudStateRegistry().updateNavigationParams(name, data);
      // Also store with full screen key (e.g., "FORM::ADD_MEMBER") if type is provided
      if (type.isNotEmpty) {
        final fullKey = '$type::$name';
        FlowCrudStateRegistry().updateNavigationParams(fullKey, data);
      }
    }

    _service.navigateTo(type: type, name: name, data: data);
  }

  static void setupNavigation(BuildContext context) {
    final Map<String, PageRouteInfo<dynamic> Function(Map<String, dynamic>?)>
        routeMap = {};

    for (final flow in FlowRegistry.getAllConfigs().entries) {
      final screenType = flow.value['screenType'];
      final name = flow.value['name'];

      if (screenType != null && name != null) {
        final routeKey = '$screenType::$name';

        // Provide a function that returns the appropriate PageRouteInfo
        routeMap[routeKey] = (data) =>
            FlowBuilderHomeRoute(pageName: name, navigationParams: data);
      }
    }

    NavigationRegistry.init(FlowBuilderNavigationService(context, routeMap));
  }
}
