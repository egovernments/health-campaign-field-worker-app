import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class CardWidget implements FlowWidget {
  @override
  String get format => 'card';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = crudCtx?.stateData;

    // Create evaluation context
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

    return DigitCard(
      cardType: _parseCardType(json['type']?.toString() ?? 'primary'),
      children: (json['children'] as List).map<Widget>((childJson) {
        final processed = stateData != null
            ? preprocessConfigWithState(
                Map<String, dynamic>.from(childJson),
                stateData,
                listIndex: crudCtx?.listIndex,
                item: crudCtx?.item,
              )
            : Map<String, dynamic>.from(childJson);

        return CrudItemContext(
          stateData: stateData,
          listIndex: crudCtx?.listIndex,
          item: crudCtx?.item,
          screenKey: crudCtx?.screenKey,
          child: LayoutMapper.map(processed, stateData, context, onAction,
              item: crudCtx?.item, listIndex: crudCtx?.listIndex),
        );
      }).toList(),
    );
  }

  CardType _parseCardType(String? raw) {
    switch ((raw ?? '').toLowerCase()) {
      case 'primary':
        return CardType.primary;
      case 'secondary':
        return CardType.secondary;
      default:
        return CardType.primary;
    }
  }
}
