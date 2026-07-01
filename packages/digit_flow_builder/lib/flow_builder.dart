export 'action_handler/action_config.dart';
export 'action_handler/action_handler.dart';
export 'blocs/flow_crud_bloc.dart';
export 'blocs/form_submission_registry.dart';
export 'blocs/search_state_manager.dart';
export 'custom_component_registry.dart';
export 'flow_builder.dart';
export 'flow_builder_home_page.dart';
export 'layout_renderer.dart';
export 'navigation_service/navigation_service.dart';
export 'router/flow_builder_routes.dart';
export 'screen_builder.dart';
export 'utils/context_utility.dart';
export 'utils/utils.dart' hide resolveValue, flattenFormData;
export 'widget_registry.dart';
export 'widgets/localization_context.dart';

class FlowRegistry {
  static final Map<String, Map<String, dynamic>> _flowMap = {};
  // Identity of the most recently applied flows list. Callers that pass a
  // compile-time-constant sample-flows list (the common case for the
  // home-card path) hand us the same List reference on every card tap;
  // re-iterating and re-inserting 50+ Map entries costs ~50ms per tap
  // that adds nothing new to the registry. Compare by identity so callers
  // passing a freshly decoded list (e.g. from json.decode of server config)
  // still get updated correctly — those lists always have a new identity.
  static List<Map<String, dynamic>>? _lastFlowsRef;

  static void setConfig(List<Map<String, dynamic>> flows) {
    if (identical(flows, _lastFlowsRef)) return;
    _lastFlowsRef = flows;
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
