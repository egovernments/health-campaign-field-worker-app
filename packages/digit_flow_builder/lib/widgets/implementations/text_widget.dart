import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/app_localization.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class TextWidget implements FlowWidget {
  @override
  String get format => 'text';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);

    final valueText = resolveTemplate(
            json['value'] ?? '',
            crudCtx?.item != null
                ? crudCtx!.item
                : crudCtx?.stateData?.rawState) ??
        '';

    return Text(FlowBuilderLocalization.of(context).translate(
      valueText,
    ));
  }
}
