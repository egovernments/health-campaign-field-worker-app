import 'package:flutter/material.dart';

import '../action_handler/action_config.dart';
import '../utils/conditional_evaluator.dart';
import '../widget_registry.dart';

/// Base interface for all flow widgets
abstract class FlowWidget {
  /// The format identifier for this widget type
  String get format;

  /// Builds the widget from JSON configurationtree
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
    // Handle visibility check at factory level before building widget
    final crudCtx = CrudItemContext.of(context);
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
    };

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      evalContext,
    );

    if (visible == false) {
      return const SizedBox.shrink();
    }

    // Build the widget if visible
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
