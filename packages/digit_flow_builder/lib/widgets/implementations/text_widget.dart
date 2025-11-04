import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class TextWidget implements FlowWidget {
  @override
  String get format =>
      'textTemplate'; // add support to take multiple format types

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final localization = LocalizationContext.maybeOf(context);

    // Localize first, then resolve template
    final value = json['value'] ?? '';
    final localizedValue = localization?.translate(value) ?? value;

    final resolvedValue = resolveTemplate(
            localizedValue,
            crudCtx?.item != null
                ? crudCtx!.item
                : crudCtx?.stateData?.rawState) ??
        localizedValue;

    return Text(resolvedValue);
  }
}
