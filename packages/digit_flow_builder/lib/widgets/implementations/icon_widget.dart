import 'package:digit_ui_components/constants/constant.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
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
    final properties = json['properties'] as Map<String, dynamic>? ?? {};
    final size = (properties['size'] as num?)?.toDouble();

    return Icon(
      DigitIconMapping.getIcon(iconData),
      size: size,
      color: _parseIconColor(context, properties['color']?.toString()),
    );
  }

  /// Theme colour for the icon. Null when unset, leaving the ambient
  /// [IconTheme] in charge — which is what every existing `icon` config
  /// relies on, so adding this changes nothing for them.
  Color? _parseIconColor(BuildContext context, String? colorKey) {
    if (colorKey == null) return null;

    final theme = Theme.of(context);
    switch (colorKey) {
      // `primary1` is the accent (orange) the menu card used for its icon;
      // `primary2` is the darker heading tone.
      case 'primary':
        return theme.colorTheme.primary.primary1;
      case 'primaryDark':
        return theme.colorTheme.primary.primary2;
      case 'text':
        return theme.colorTheme.text.primary;
      case 'secondary':
        return theme.colorTheme.text.secondary;
      case 'error':
        return theme.colorTheme.alert.error;
      case 'success':
        return theme.colorTheme.alert.success;
      default:
        return null;
    }
  }
}
