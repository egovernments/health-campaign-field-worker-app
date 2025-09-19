import 'package:flutter/material.dart';
import '../action_handler/action_config.dart';

/// Base interface for all flow widgets
abstract class FlowWidget {
  /// The format identifier for this widget type
  String get format;

  /// Builds the widget from JSON configuration
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  );
}

/// Factory for registering and creating flow widgets
class FlowWidgetFactory {
  static final Map<String, FlowWidget> _widgets = {};

  /// Register a widget implementation
  static void register(FlowWidget widget) {
    _widgets[widget.format] = widget;
  }

  /// Build a widget from JSON configuration
  static Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final format = json['format'] as String? ?? '';
    final widget = _widgets[format];

    if (widget != null) {
      return widget.build(json, context, onAction);
    }

    return Text('Unknown widget format: $format');
  }

  /// Check if a format is registered
  static bool hasWidget(String format) {
    return _widgets.containsKey(format);
  }

  /// Get all registered formats
  static List<String> getFormats() {
    return _widgets.keys.toList();
  }
}