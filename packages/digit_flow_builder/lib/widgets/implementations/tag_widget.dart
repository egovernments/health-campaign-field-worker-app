import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
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

    // Localize first, then resolve template
    final value = json['label'] ?? '';
    final localizedValue = localization?.translate(value) ?? value;
    final valueText = resolveTemplate(
            localizedValue,
            crudCtx?.item != null
                ? crudCtx!.item
                : crudCtx?.stateData?.rawState) ??
        localizedValue;

    return Tag(
      label: valueText,
      type: TagType.error,
    );
  }
}
