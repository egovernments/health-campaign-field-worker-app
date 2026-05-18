import 'package:digit_ui_components/constants/constant.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../resolved_flow_widget.dart';

class IconWidget extends ResolvedFlowWidget {
  @override
  String get format => 'icon';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final iconData = json['value'];

    return Icon(DigitIconMapping.getIcon(iconData));
  }
}
