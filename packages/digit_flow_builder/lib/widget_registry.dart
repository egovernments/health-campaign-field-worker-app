import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/switch.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import 'action_handler/action_config.dart';
import 'blocs/app_localization.dart';
import 'blocs/flow_crud_bloc.dart';
import 'utils/function_registry.dart';
import 'utils/interpolation.dart';
import 'widgets/flow_widget_interface.dart';
import 'widgets/widget_registration.dart';

/// Provides stateData, listIndex, item, screenKey automatically down the tree
class CrudItemContext extends InheritedWidget {
  final CrudStateData? stateData;
  final int? listIndex;
  final Map<String, dynamic>? item;
  final String? screenKey;

  const CrudItemContext({
    super.key,
    required super.child,
    this.stateData,
    this.listIndex,
    this.item,
    this.screenKey,
  });

  static CrudItemContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CrudItemContext>();
  }

  @override
  bool updateShouldNotify(CrudItemContext oldWidget) {
    final stateChanged = stateData?.rawState != oldWidget.stateData?.rawState;
    final listIndexChanged = listIndex != oldWidget.listIndex;
    final itemChanged = item.toString() != oldWidget.item.toString();
    final screenChanged = screenKey != oldWidget.screenKey;

    return stateChanged || listIndexChanged || itemChanged || screenChanged;
  }
}

typedef WidgetBuilderFn = Widget Function(
  Map<String, dynamic>,
  BuildContext,
  void Function(ActionConfig),
);

class WidgetRegistry {
  static bool _initialized = false;

  /// Initialize widget registry with all available widgets
  static void initialize() {
    if (_initialized) return;

    WidgetRegistration.initialize();
    initializeFunctionRegistry();

    _initialized = true;
  }

  static Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final format = json['format'] as String? ?? '';
    if (FlowWidgetFactory.hasWidget(format)) {
      return FlowWidgetFactory.build(json, context, onAction);
    }

    // Unknown widget format
    return Text('Unknown widget format: $format');
  }

}

// Legacy function for backward compatibility
void initializeDefaultWidgetRegistry() {
  WidgetRegistry.initialize();
}