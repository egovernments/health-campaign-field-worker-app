export 'action_handler/action_config.dart';
export 'action_handler/action_handler.dart';
export 'custom_component_registry.dart';
export 'error_handler/error_handler.dart';
export 'error_handler/auto_error_logger.dart';
export 'flow_builder.dart';
export 'flow_builder_home_page.dart';
export 'layout_renderer.dart';
export 'navigation_service/navigation_service.dart';
export 'router/flow_builder_routes.dart';
export 'screen_builder.dart';
export 'utils/context_utility.dart';
export 'utils/utils.dart';
export 'widget_registry.dart';

class FlowRegistry {
  static final Map<String, Map<String, dynamic>> _flowMap = {};

  static void setConfig(List<Map<String, dynamic>> flows) {
    for (final flow in flows) {
      final name = flow['name'] ?? flow['pageName'];
      if (name != null) _flowMap[name] = flow;
    }
  }

  static Map<String, Map<String, dynamic>> getAllConfigs() {
    return Map.unmodifiable(_flowMap);
  }

  static Map<String, dynamic>? getByName(String name) => _flowMap[name];
}
