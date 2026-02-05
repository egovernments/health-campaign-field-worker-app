import 'package:digit_ui_components/constants/constant.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
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
    final iconData = json['value'];

    return Icon(DigitIconMapping.getIcon(iconData));
  }
}
