import 'package:flutter/material.dart';

import '../blocs/flow_crud_bloc.dart';

/// Helper class to access state from any page in the flow

/// Helper class to access state from any page in the flow by passing page name
class PageStateAccessor {
  final String currentPageName;

  PageStateAccessor(this.currentPageName);

  /// Get form data of this page
  Map<String, dynamic>? getCurrentPageData() {
    return FlowCrudStateRegistry().get(currentPageName)?.formData;
  }

  /// Get wrapper state of this page
  FlowCrudState? getCurrentWrapperState() {
    return FlowCrudStateRegistry().get(currentPageName);
  }

  /// Get specific field from this page's data
  dynamic getFieldValue(String fieldName) {
    return getCurrentPageData()?[fieldName];
  }

  /// Get wrapper state field from this page's data
  dynamic getWrapperFieldValue(String fieldName) {
    return getCurrentWrapperState();
  }

  /// Access any other page's form data by name
  /// Tries both direct name and with screen type prefixes (TEMPLATE::, FORM::)
  FlowCrudState? getPageData(String pageName) {
    // First try direct lookup
    var state = FlowCrudStateRegistry().get(pageName);
    if (state != null) {
      return state;
    }

    // Try with TEMPLATE:: prefix
    state = FlowCrudStateRegistry().get('TEMPLATE::$pageName');
    if (state != null) {
      return state;
    }

    // Try with FORM:: prefix (uppercase name)
    state = FlowCrudStateRegistry().get('FORM::${pageName.toUpperCase()}');
    if (state != null) {
      return state;
    }

    // Try with FORM:: prefix (original case)
    state = FlowCrudStateRegistry().get('FORM::$pageName');
    return state;
  }

  /// Access any other page's wrapper state by name
  /// Tries both direct name and with screen type prefixes (TEMPLATE::, FORM::)
  FlowCrudState? getWrapperState(String pageName) {
    return getPageData(pageName);
  }
}

/// Component builder function with access to multi-page state
typedef ComponentBuilder = Widget Function(
  BuildContext context,
  PageStateAccessor stateAccessor,
);

/// Enhanced registry for custom components with single-page state access
class CustomComponentRegistry {
  static final CustomComponentRegistry _instance =
      CustomComponentRegistry._internal();

  factory CustomComponentRegistry() => _instance;

  CustomComponentRegistry._internal();

  final Map<String, Widget> _components = {};
  final Map<String, ComponentBuilder> _builders = {};

  /// Register a static custom component with a key name
  void register(String key, Widget component) {
    _components[key] = component;
    _builders.remove(key);
  }

  /// Register a dynamic component builder with single-page state access
  void registerBuilder(String key, ComponentBuilder builder) {
    _builders[key] = builder;
    _components.remove(key);
  }

  /// Build a component by key with access to the given page state
  Widget? buildComponent(
    String key,
    BuildContext context,
    String pageName, // page name is passed at build time
  ) {
    final stateAccessor = PageStateAccessor(pageName);

    if (_builders.containsKey(key)) {
      return _builders[key]!(context, stateAccessor);
    }

    return _components[key];
  }

  /// Get all components as Map<String, Widget> for forms engine
  /// For dynamic components, we require the page name to build them at runtime
  Map<String, Widget> getAllComponents(
    BuildContext context,
    String pageName, // page name is required here
  ) {
    final Map<String, Widget> result = {};
    final stateAccessor = PageStateAccessor(pageName);

    result.addAll(_components);

    for (final entry in _builders.entries) {
      result[entry.key] = entry.value(context, stateAccessor);
    }

    return result;
  }

  /// Check if a component with this key exists
  bool hasComponent(String key) {
    return _components.containsKey(key) || _builders.containsKey(key);
  }

  /// Check if a component is a dynamic builder
  bool isBuilder(String key) {
    return _builders.containsKey(key);
  }

  /// Get all registered component keys
  Set<String> getRegisteredKeys() {
    return {..._components.keys, ..._builders.keys};
  }

  /// Remove a specific component
  void unregister(String key) {
    _components.remove(key);
    _builders.remove(key);
  }

  /// Clear all registered components
  void clear() {
    _components.clear();
    _builders.clear();
  }

  /// Get count of registered components
  int get count => _components.length + _builders.length;

  /// Check if registry is empty
  bool get isEmpty => _components.isEmpty && _builders.isEmpty;

  /// Check if registry has components
  bool get isNotEmpty => !isEmpty;
}
