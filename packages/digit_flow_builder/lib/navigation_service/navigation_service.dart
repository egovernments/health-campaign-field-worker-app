import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class NavigationService {
  void navigateTo({
    required String type,
    required String name,
    Map<String, dynamic>? data,
  });
}

class AppNavigationService implements NavigationService {
  final BuildContext context;
  final Map<String, PageRouteInfo Function(Map<String, dynamic>? data)>
      routeMap;

  AppNavigationService(this.context, this.routeMap);

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
}
