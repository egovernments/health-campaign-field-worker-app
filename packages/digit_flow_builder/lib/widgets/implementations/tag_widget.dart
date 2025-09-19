import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

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
    final value = json['label'] ?? '';
    final valueText = resolveTemplate(
            value,
            crudCtx?.item != null
                ? crudCtx!.item
                : crudCtx?.stateData?.rawState) ??
        '';

    return Tag(
      label: valueText,
      type: TagType.error,
    );
  }
}
