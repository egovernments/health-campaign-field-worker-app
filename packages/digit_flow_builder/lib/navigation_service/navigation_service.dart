import 'package:auto_route/auto_route.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../router/flow_builder_routes.gm.dart';

/// Navigation modes for controlling how pages are added/removed from the stack
enum NavigationMode {
  /// Default: Push new page on top of existing stack
  push,

  /// Replace current page with new page (back button skips replaced page)
  replace,

  /// Pop current page then push new page
  popAndPush,

  /// Pop until a specific page is reached, then push new page
  popUntilAndPush,

  /// Pop until a specific page is reached (without pushing)
  popUntil,

  /// Pop until a specific page is reached, pop that page, then push a fresh instance
  /// This ensures initActions are triggered on the fresh page instance
  popUntilAndReplace,
}

abstract class NavigationService {
  void navigateTo({
    required String type,
    required String name,
    Map<String, dynamic>? data,
    NavigationMode navigationMode = NavigationMode.push,
    String? popUntilPageName,
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
    NavigationMode navigationMode = NavigationMode.push,
    String? popUntilPageName,
  }) {
    final key = name;
    final builder = routeMap[key];

    if (builder != null) {
      final route = builder(data);
      final router = context.router;

      switch (navigationMode) {
        case NavigationMode.push:
          // Default: push on top of stack
          router.push(route);
          break;

        case NavigationMode.replace:
          // Replace current page - back button skips this page
          router.replace(route);
          break;

        case NavigationMode.popAndPush:
          // Pop current page then push new page
          if (router.canPop()) {
            router.maybePop();
          }
          router.push(route);
          break;

        case NavigationMode.popUntilAndPush:
          // Pop until a specific page is reached, then push new page
          if (popUntilPageName != null && popUntilPageName.isNotEmpty) {
            _popUntilPage(router, popUntilPageName);
          }
          router.push(route);
          break;

        case NavigationMode.popUntil:
          // Pop until a specific page is reached (without pushing)
          if (popUntilPageName != null && popUntilPageName.isNotEmpty) {
            _popUntilPage(router, popUntilPageName);
          }
          break;

        case NavigationMode.popUntilAndReplace:
          // Pop until a specific page is reached, pop that page, then push fresh instance
          // This ensures initActions are triggered on the fresh page
          if (popUntilPageName != null && popUntilPageName.isNotEmpty) {
            _popUntilPage(router, popUntilPageName);
            // Pop the target page itself
            if (router.canPop()) {
              router.maybePop();
            }
          }
          // Push fresh instance of the page
          router.push(route);
          break;
      }
    } else {
      debugPrint('⚠️ No route found for key: $key');
      Toast.showToast(context,
          message: 'No route found for key: $key', type: ToastType.error);
    }
  }

    /// Pops routes until the specified page name is found
    void _popUntilPage(StackRouter router, String targetPageName) {
      // Special handling for HOME - exit the entire flow by popping all
      // FlowBuilderHomeRoute pages, landing on whatever is below (e.g. CurrentBoundary)
      if (targetPageName == 'HOME') {
        router.popUntil((route) =>
            route.settings.name?.contains('FlowBuilderHomeRoute') != true);
        return;
      }

      // Check if target page exists in the stack
      bool targetExists = false;
      for (final route in router.stack) {
        if (route.name?.contains('FlowBuilderHomeRoute') == true) {
          final args = route.arguments;
          if (args is FlowBuilderHomeRouteArgs &&
              args.pageName == targetPageName) {
            targetExists = true;
            break;
          }
        }
      }

      if (targetExists) {
        router.popUntil((route) {
          if (route.settings.name?.contains('FlowBuilderHomeRoute') == true) {
            final args = route.settings.arguments;
            if (args is FlowBuilderHomeRouteArgs) {
              return args.pageName == targetPageName;
            }
          }
          return false;
        });
      }
    }

  @override
  void navigateToHome() {
    try {
      context.router.popUntil((route) {
        // Exit the entire flow by popping all FlowBuilderHomeRoute pages
        return route.settings.name?.contains('FlowBuilderHomeRoute') != true;
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

    // Use instanceId from properties if provided (from navigation executor),
    // otherwise generate a new one (fallback for direct navigation calls)
    final instanceId = properties['_instanceId'] as String? ??
        '${type}_${name}_${DateTime.now().millisecondsSinceEpoch}';
    data['_instanceId'] = instanceId;
    debugPrint('NavigationRegistry: Using instanceId $instanceId for $name');

    // Update navigation params for the target page before navigating
    // Store with multiple key formats for robust retrieval
    if (data.isNotEmpty && name.isNotEmpty) {
      // Store with plain name (e.g., "deliverySuccess")
      FlowCrudStateRegistry().updateNavigationParams(name, data);

      // Store with composite key (e.g., "deliverySuccess::instanceId123")
      // This is the key format used by widgets to retrieve navigation params
      final compositeKey = createCompositeKey(name, instanceId);
      FlowCrudStateRegistry().updateNavigationParams(compositeKey, data);
      debugPrint('NavigationRegistry: Stored navigation params with compositeKey=$compositeKey');
    }

    // Parse navigation mode from properties
    final navigationModeStr = properties['navigationMode'] as String?;
    final popUntilPageName = properties['popUntilPageName'] as String?;
    final navigationMode = _parseNavigationMode(navigationModeStr);

    _service.navigateTo(
      type: type,
      name: name,
      data: data,
      navigationMode: navigationMode,
      popUntilPageName: popUntilPageName,
    );
  }

  /// Parses string navigation mode to enum
  static NavigationMode _parseNavigationMode(String? mode) {
    switch (mode?.toLowerCase()) {
      case 'replace':
        return NavigationMode.replace;
      case 'popandpush':
      case 'pop_and_push':
        return NavigationMode.popAndPush;
      case 'popuntilandpush':
      case 'pop_until_and_push':
        return NavigationMode.popUntilAndPush;
      case 'popuntil':
      case 'pop_until':
        return NavigationMode.popUntil;
      case 'popuntilandreplace':
      case 'pop_until_and_replace':
        return NavigationMode.popUntilAndReplace;
      case 'push':
      default:
        return NavigationMode.push;
    }
  }

  static void setupNavigation(BuildContext context) {
    final Map<String, PageRouteInfo<dynamic> Function(Map<String, dynamic>?)>
        routeMap = {};

    for (final flow in FlowRegistry.getAllConfigs().entries) {
      final screenType = flow.value['screenType'];
      final name = flow.value['name'];

      if (screenType != null && name != null) {
        final routeKey = name;

        // Provide a function that returns the appropriate PageRouteInfo
        routeMap[routeKey] = (data) =>
            FlowBuilderHomeRoute(pageName: name, navigationParams: data);
      }
    }

    NavigationRegistry.init(FlowBuilderNavigationService(context, routeMap));
  }
}
