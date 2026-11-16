/// Optional callbacks the host app can set to observe user interactions in
/// flow-builder screens. The package itself has no analytics dependency.
class FlowAnalyticsHooks {
  FlowAnalyticsHooks._();

  /// A configured widget (button, card, link, popup action, back link,
  /// search bar) was tapped and is about to execute its actions.
  /// [actionTypes] lists the `actionType` of every action, including nested
  /// conditional blocks.
  static void Function(
    String? screenKey,
    String? fieldName,
    String? labelKey,
    String? format,
    List<String> actionTypes,
    String? destination,
  )? onWidgetAction;

  /// The `properties.name` of the first NAVIGATION / BACK_NAVIGATION action,
  /// i.e. the page the tap leads to.
  static String? destinationOf(Iterable<dynamic>? actions) {
    if (actions == null) return null;
    for (final action in actions) {
      if (action is! Map) continue;
      final type = action['actionType'];
      final props = action['properties'];
      if ((type == 'NAVIGATION' || type == 'BACK_NAVIGATION') &&
          props is Map &&
          props['name'] is String) {
        return props['name'] as String;
      }
      final nested = destinationOf(action['actions'] as Iterable?);
      if (nested != null) return nested;
    }
    return null;
  }

  /// Flattens an `onAction` list (with nested `actions`) into action types.
  static List<String> actionTypesOf(Iterable<dynamic>? actions) {
    final types = <String>[];
    if (actions == null) return types;
    for (final action in actions) {
      if (action is! Map) continue;
      final type = action['actionType'];
      if (type is String) types.add(type);
      final nested = action['actions'];
      if (nested is Iterable) types.addAll(actionTypesOf(nested));
    }
    return types;
  }
}
