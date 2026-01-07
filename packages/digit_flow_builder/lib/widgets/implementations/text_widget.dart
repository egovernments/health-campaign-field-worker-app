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

    // Resolve template with localization support for mixed content
    final value = json['value'] ?? '';
    final resolvedValue = resolveTemplate(
          value,
          crudCtx?.item != null ? crudCtx!.item : crudCtx?.stateData?.rawState,
          localization: localization,
        ) ??
        value;

    return Text(resolvedValue);
  }
}
