import 'package:auto_route/auto_route.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

import '../router/flow_builder_routes.gm.dart';

abstract class NavigationService {
  void navigateTo({
    required String type,
    required String name,
    Map<String, dynamic>? data,
  });
}

class FlowBuilderNavigationService implements NavigationService {
  final BuildContext context;
  final Map<String, PageRouteInfo Function(Map<String, dynamic>? data)>
      routeMap;

  FlowBuilderNavigationService(this.context, this.routeMap);

  @override
  void navigateTo({
    // TODO: add pop all or replace all routes to clear the stack
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

    final data = <String, dynamic>{};
    for (final entry in dataList) {
      data[entry['key']] = entry['value'];
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
