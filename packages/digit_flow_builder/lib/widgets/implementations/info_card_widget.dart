import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_info_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/flow_widget_state.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class InfoCardWidget implements FlowWidget {
  @override
  String get format => 'infoCard';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);
    final items = flowState.contextData ?? [];

    // Get navigation params for visibility evaluation
    final navigationParams = flowState.screenKey != null
        ? FlowCrudStateRegistry().getNavigationParams(flowState.screenKey!) ?? {}
        : <String, dynamic>{};

    // Build evaluation context with navigation params
    final evalContext = {
      ...flowState.evalContext,
      'navigation': navigationParams,
    };

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      evalContext,
      screenKey: flowState.screenKey,
    );

    if (visible == false || items.isNotEmpty) {
      return const SizedBox.shrink();
    }

    // Determine info type from config (default to info)
    final typeString = json['type']?.toString().toLowerCase() ?? 'info';
    final infoType = typeString == 'error'
        ? InfoType.error
        : typeString == 'warning'
            ? InfoType.warning
            : typeString == 'success'
                ? InfoType.success
                : InfoType.info;

    if (items.isNotEmpty) return const SizedBox.shrink();

    final localization = LocalizationContext.maybeOf(context);

    return InfoCard(
      type: InfoType.info,
      title:
          localization?.translate(json['label'] ?? '') ?? (json['label'] ?? ''),
      description: localization?.translate(json['description'] ?? '') ??
          (json['description'] ?? ''),
    );
  }
}
