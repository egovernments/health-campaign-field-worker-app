import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class ActionPopupWidget implements FlowWidget {
  @override
  String get format => 'actionPopup';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    final popupConfig = props['popupConfig'] as Map<String, dynamic>?;

    return DigitButton(
      mainAxisSize: _parseMainAxisSize(props['mainAxisSize']),
      mainAxisAlignment: _parseMainAxisAlignment(props['mainAxisAlignment']),
      label: json['label'] ?? '',
      onPressed: () async {
        // Trigger configured actions if any
        if (json['onAction'] != null && json['onAction'] is List) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          for (var raw in actionsList) {
            final action = ActionConfig.fromJson(raw);
            onAction(action);
          }
        }

        // Show popup if popupConfig is provided
        if (popupConfig != null) {
          await _showActionPopup(context, popupConfig, onAction);
        }
      },
      type: _parseButtonType(props['type']),
      size: _parseButtonSize(props['size']),
      suffixIcon: json['suffixIcon'] != null ? _parseIcon(json['suffixIcon']) : null,
      prefixIcon: json['prefixIcon'] != null ? _parseIcon(json['prefixIcon']) : null,
    );
  }

  /// Show the action popup based on configuration
  Future<dynamic> _showActionPopup(
    BuildContext context,
    Map<String, dynamic> popupConfig,
    void Function(ActionConfig) onAction,
  ) {
    final title = popupConfig['title'] as String? ?? 'Popup';
    final description = popupConfig['description'] as String?;
    final titleIconName = popupConfig['titleIcon'] as String?;
    final showCloseButton = popupConfig['showCloseButton'] as bool? ?? true;
    final barrierDismissible = popupConfig['barrierDismissible'] as bool? ?? true;
    final bodyWidgets = popupConfig['body'] as List<dynamic>? ?? [];
    final footerActions = popupConfig['footerActions'] as List<dynamic>? ?? [];

    return showCustomPopup(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) => Popup(
        title: title,
        description: description,
        titleIcon: titleIconName != null
            ? Icon(
                _parseIcon(titleIconName),
                color: DigitTheme.instance.colorScheme.primary,
              )
            : null,
        onCrossTap: showCloseButton
            ? () {
                Navigator.of(ctx, rootNavigator: true).pop();
              }
            : null,
        additionalWidgets: [
          // Build body widgets from config
          ...bodyWidgets.map((widgetJson) {
            if (widgetJson is Map<String, dynamic>) {
              return FlowWidgetFactory.build(
                widgetJson,
                ctx,
                onAction,
              );
            }
            return const SizedBox.shrink();
          }).toList(),
        ],
        actions: footerActions.isEmpty
            ? null
            : footerActions
                .where((actionJson) => actionJson is Map<String, dynamic>)
                .map((actionJson) {
                  return FlowWidgetFactory.build(
                    actionJson as Map<String, dynamic>,
                    ctx,
                    (ActionConfig action) {
                      // Handle CLOSE_POPUP action
                      if (action.actionType == 'CLOSE_POPUP') {
                        Navigator.of(ctx, rootNavigator: true).pop();
                      }
                      // Forward other actions
                      onAction(action);
                    },
                  ) as DigitButton;
                })
                .toList(),
      ),
    );
  }

  DigitButtonType _parseButtonType(String? type) {
    switch (type) {
      case 'primary':
        return DigitButtonType.primary;
      case 'secondary':
        return DigitButtonType.secondary;
      case 'tertiary':
        return DigitButtonType.tertiary;
      default:
        return DigitButtonType.primary;
    }
  }

  DigitButtonSize _parseButtonSize(String? size) {
    switch (size) {
      case 'small':
        return DigitButtonSize.small;
      case 'medium':
        return DigitButtonSize.medium;
      case 'large':
        return DigitButtonSize.large;
      default:
        return DigitButtonSize.large;
    }
  }

  MainAxisSize _parseMainAxisSize(String? size) {
    switch (size) {
      case 'max':
        return MainAxisSize.max;
      case 'min':
        return MainAxisSize.min;
      default:
        return MainAxisSize.min;
    }
  }

  MainAxisAlignment _parseMainAxisAlignment(String? alignment) {
    switch (alignment) {
      case 'start':
        return MainAxisAlignment.start;
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
      case 'spaceBetween':
        return MainAxisAlignment.spaceBetween;
      default:
        return MainAxisAlignment.start;
    }
  }

  IconData? _parseIcon(String? iconName) {
    switch (iconName) {
      case 'filter':
        return Icons.filter_alt_sharp;
      case 'edit':
        return Icons.edit;
      case 'warning':
        return Icons.warning;
      case 'info':
        return Icons.info;
      case 'delete':
        return Icons.delete;
      case 'add':
        return Icons.add;
      case 'close':
        return Icons.close;
      default:
        return null;
    }
  }
}
