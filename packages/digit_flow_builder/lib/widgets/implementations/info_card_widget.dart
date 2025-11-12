import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_info_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/conditional_evaluator.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class InfoCardWidget implements FlowWidget {
  @override
  String get format => 'infoCard';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final items = crudCtx?.stateData?.rawState ?? [];
    final modelMap = crudCtx?.stateData?.modelMap ?? {};

    // Create evaluation context that includes modelMap for named entity access
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
      ...modelMap, // Include modelMap so {{stock}}, {{productVariant}} etc. can be resolved
    };

    // Check visibility condition
    final visible = ConditionalEvaluator.evaluate(
      json['visible'] ?? true,
      evalContext,
    );

    if (visible == false) {
      return const SizedBox.shrink();
    }

    if (items.isNotEmpty) return const SizedBox.shrink();
    return InfoCard(
      type: InfoType.info,
      title: json['label'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
