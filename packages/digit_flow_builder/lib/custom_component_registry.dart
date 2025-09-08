import 'package:flutter/material.dart';

/// Simple registry for custom components that stores components as Map<String, Widget>
/// Main app registers components here, and flow builder uses them for forms
class CustomComponentRegistry {
  static final CustomComponentRegistry _instance = CustomComponentRegistry._internal();
  
  factory CustomComponentRegistry() => _instance;
  
  CustomComponentRegistry._internal();
  
  // Single map storing all custom components by their key names
  final Map<String, Widget> _components = {};
  
  /// Register a custom component with a key name
  /// This will be used in forms when fieldName matches the key
  void register(String key, Widget component) {
    _components[key] = component;
  }
  
  /// Get a specific component by key
  Widget? getComponent(String key) {
    return _components[key];
  }
  
  /// Get all registered components as Map<String, Widget>
  /// This is what gets passed to forms engine components parameter
  Map<String, Widget> getAllComponents() {
    return Map<String, Widget>.from(_components);
  }
  
  /// Check if a component with this key exists
  bool hasComponent(String key) {
    return _components.containsKey(key);
  }
  
  /// Get all registered component keys
  Set<String> getRegisteredKeys() {
    return _components.keys.toSet();
  }
  
  /// Remove a specific component
  void unregister(String key) {
    _components.remove(key);
  }
  
  /// Clear all registered components
  void clear() {
    _components.clear();
  }
  
  /// Get count of registered components
  int get count => _components.length;
  
  /// Check if registry is empty
  bool get isEmpty => _components.isEmpty;
  
  /// Check if registry has components
  bool get isNotEmpty => _components.isNotEmpty;
}