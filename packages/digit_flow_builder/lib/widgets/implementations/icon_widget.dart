import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class IconWidget implements FlowWidget {
  @override
  String get format => 'icon';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);

    final valueText = json['value'];

    return Icon(valueText as IconData);
  }
}
