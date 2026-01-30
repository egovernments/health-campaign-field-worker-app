import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../utils/widget_parsers.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class TagWidget implements FlowWidget {
  @override
  String get format => 'tag';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final localization = LocalizationContext.maybeOf(context);
    final crudStateData = crudCtx?.stateData;
    final stateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    // Get form data from registry for resolving form field values
    final screenKey = crudCtx?.screenKey ?? getScreenKeyFromArgs(context);
    final formData = screenKey != null
        ? FlowCrudStateRegistry().get(screenKey)?.formData
        : null;

    // Create evaluation context
    final evalContext = {
      'item': crudCtx?.item,
      'contextData': crudCtx?.stateData?.rawState ?? {},
      ...crudStateData?.modelMap ?? {},
    };

    // Check visibility condition
    if (json['visible'] != null) {
      final visible = ConditionalEvaluator.evaluate(
        json['visible'],
        evalContext,
        stateData: crudStateData,
      );
      if (visible == false) {
        return const SizedBox.shrink();
      }
    }

    // Resolve template with localization support for mixed content
    final value = json['label'] ?? '';
    final valueText = resolveTemplate(
          value,
          crudCtx?.item != null ? crudCtx!.item : crudCtx?.stateData?.rawState,
          localization: localization,
        ) ??
        value;

    final properties = json['properties'] as Map<String, dynamic>?;

    return WidgetParsers.wrapWithBottomGap(
      Tag(
        isStroke: true,
        label: valueText,
        type: WidgetParsers.parseTagType(properties?['tagType']),
      ),
      properties,
    );
  }
}
