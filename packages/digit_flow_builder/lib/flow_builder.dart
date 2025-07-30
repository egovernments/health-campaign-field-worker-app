export 'action_handler/action_config.dart';
export 'action_handler/action_handler.dart';
export 'flow_builder.dart';
export 'flow_builder_home_page.dart';
export 'layout_renderer.dart';
export 'navigation_service/navigation_service.dart';
export 'router/flow_builder_routes.dart';
export 'screen_builder.dart';
export 'widget_registry.dart';

class FlowRegistry {
  static final Map<String, Map<String, dynamic>> _flowMap = {};

  static void setConfig(List<Map<String, dynamic>> flows) {
    for (final flow in flows) {
      final name = flow['name'] ?? flow['pageName'];
      if (name != null) _flowMap[name] = flow;
    }
  }

  static Map<String, dynamic>? getByName(String name) => _flowMap[name];
}
