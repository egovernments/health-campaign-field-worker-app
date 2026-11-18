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
      _resolveIcon(iconData?.toString() ?? ''),
      size: size,
      color: _parseIconColor(context, properties['color']?.toString()),
    );
  }

  /// Icons the app shows natively but [DigitIconMapping] has no key for.
  /// Checked only when Digit's map misses, so Digit stays the source of
  /// truth. `Send` is the home page's peer-to-peer (data share) icon, reused
  /// on the permissions screen for nearby devices.
  static const Map<String, IconData> _fallbackIcons = {
    'Send': Icons.send,
  };

  IconData _resolveIcon(String key) {
    if (DigitIconMapping.hasIcon(key)) return DigitIconMapping.getIcon(key);
    return _fallbackIcons[key] ?? DigitIconMapping.getIcon(key);
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
