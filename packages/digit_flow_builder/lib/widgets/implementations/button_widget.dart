import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';

class ButtonWidget implements FlowWidget {
  @override
  String get format => 'button';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final crudCtx = CrudItemContext.of(context);
    final stateData = (crudCtx?.item != null && crudCtx!.item!.isNotEmpty)
        ? crudCtx.item
        : crudCtx?.stateData?.rawState != null &&
                crudCtx!.stateData!.rawState.isNotEmpty
            ? crudCtx.stateData?.rawState.first
            : null;

    final props = Map<String, dynamic>.from(json['properties'] ?? {});

    return DigitButton(
      label: resolveTemplate(json['label'], stateData) ?? '',
      onPressed: () {
        if (json['onAction'] != null) {
          final actionsList = List<Map<String, dynamic>>.from(json['onAction']);

          for (var actionJson in actionsList) {
            var action = ActionConfig.fromJson(actionJson);

            // Resolve navigation data if present
            final navData = action.properties['data'] as List<dynamic>?;

            if (navData != null && stateData != null) {
              final resolvedData = navData.map((entry) {
                final key = entry['key'] as String;
                final rawValue = entry['value'];
                final resolvedValue = resolveValue(rawValue, stateData);

                return {
                  "key": key,
                  "value": resolvedValue,
                };
              }).toList();

              action = ActionConfig(
                action: action.action,
                actionType: action.actionType,
                properties: {
                  ...action.properties,
                  'data': resolvedData,
                },
                condition: action.condition,
                actions: action.actions,
              );
            }

            onAction(action);
          }
        }
      },
      type: _parseButtonType(props['type']),
      size: _parseButtonSize(props['size']),
      mainAxisSize: _parseMainAxisSize(props['mainAxisSize']),
      mainAxisAlignment: _parseMainAxisAlignment(props['mainAxisAlignment']),
      suffixIcon:
          json['suffixIcon'] != null ? _parseIcon(json['suffixIcon']) : null,
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
      default:
        return null;
    }
  }
}
