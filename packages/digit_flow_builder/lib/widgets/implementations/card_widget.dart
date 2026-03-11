import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../layout_renderer.dart';
import '../../utils/interpolation.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../resolved_flow_widget.dart';

class CardWidget extends ResolvedFlowWidget {
  @override
  String get format => 'card';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = resolved.stateData;

    // Read spacing from properties (can be conditional, e.g., 0 when child is hidden)
    final spacingValue = json['properties']?['spacing'];
    final double? spacing =
        spacingValue is num ? spacingValue.toDouble() : null;

    return DigitCard(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),
      spacing: spacing,
      cardType: WidgetParsers.parseCardType(
          json['properties']?['type']?.toString() ?? 'primary'),
      onPressed: () {
        if (json['onAction'] != null) {
          final actionsList =
              List<Map<String, dynamic>>.from(json['onAction']);
          final currentEvalContext = resolved.getFreshEvalContext();

          for (var actionJson in actionsList) {
            final action =
                resolved.resolveAction(actionJson, currentEvalContext);
            onAction(action);
          }
        }
      },
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
          compositeKey: resolved.compositeKey,
          child: LayoutMapper.map(processed, stateData, context, onAction,
              item: crudCtx?.item,
              listIndex: crudCtx?.listIndex,
              compositeKey: resolved.compositeKey),
        );
      }).toList(),
    );
  }
}
