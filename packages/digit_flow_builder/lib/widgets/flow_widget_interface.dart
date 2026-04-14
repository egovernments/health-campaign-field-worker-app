import 'package:flutter/material.dart';

import '../action_handler/action_config.dart';
import '../blocs/flow_crud_bloc.dart';
import '../utils/conditional_evaluator.dart';
import '../utils/function_registry.dart';
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
    // Set context for FunctionRegistry so fn: functions can access repositories
    FunctionRegistry.setContext(context);

    // Handle visibility check at factory level before building widget
    final crudCtx = CrudItemContext.of(context);
    final modelMap = crudCtx?.stateData?.modelMap ?? {};
    final stateData = crudCtx?.stateData;

    // Get screenKey and widget data for visibility evaluation
    final screenKey = crudCtx?.screenKey;
    final flowState =
        screenKey != null ? FlowCrudStateRegistry().get(screenKey) : null;
    final widgetData = flowState?.widgetData ?? {};
    final formData = flowState?.formData ?? {};

    // Create evaluation context that includes modelMap for named entity access
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
      'context': crudCtx?.stateData?.modelMap ?? {},
      ...modelMap,
      // Include modelMap so {{stock}}, {{productVariant}} etc. can be resolved
      ...formData,
      // Include formData
      ...widgetData,
      // Include widgetData for {{selectedFacility}}, {{selectedProduct}} etc.
    };

    // Check hidden condition first (if hidden evaluates to true, widget is not visible)
    bool visible = true;
    if (json['hidden'] != null) {
      final hiddenResult = ConditionalEvaluator.evaluate(
        json['hidden'],
        evalContext,
        screenKey: screenKey,
        stateData: stateData,
      );
      if (hiddenResult == true) {
        visible = false;
      }
    }

    // If not hidden, check visible condition
    if (visible && json['visible'] != null) {
      final visibleResult = ConditionalEvaluator.evaluate(
        json['visible'],
        evalContext,
        screenKey: screenKey,
        stateData: stateData,
      );
      if (visibleResult == false) {
        visible = false;
      }
    }

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
