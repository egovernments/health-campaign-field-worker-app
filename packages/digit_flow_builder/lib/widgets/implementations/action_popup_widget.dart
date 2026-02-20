import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/flow_widget_state.dart';
import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';

class ActionPopupWidget implements FlowWidget {
  @override
  String get format => 'actionPopup';

  @override
  Widget build(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
  ) {
    final flowState = WidgetStateContext.of(context);
    final localization = LocalizationContext.maybeOf(context);
    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    final popupConfig = props['popupConfig'] as Map<String, dynamic>?;

    // Use flowState for context data
    final stateData = flowState.stateData;
    final item = flowState.itemData;
    final listIndex = flowState.listIndex;
    final screenKey = flowState.screenKey;
    final compositeKey = flowState.compositeKey;

    return DigitButton(
        mainAxisSize: _parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment: _parseMainAxisAlignment(props['mainAxisAlignment']),
        label: localization?.translate( json['label']) ?? json['label'] ?? '',
        onPressed: () async {
          // Trigger configured actions if any
          if (json['onAction'] != null && json['onAction'] is List) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onAction']);

            for (var raw in actionsList) {
              final action = ActionConfig.fromJson(raw);
              onAction(action);
            }
          }

          // Show popup if popupConfig is provided
          if (popupConfig != null) {
            // Execute onOpenAction before showing popup
            final onOpenActions =
                popupConfig['onOpenAction'] as List<dynamic>?;
            if (onOpenActions != null) {
              for (var raw in onOpenActions) {
                if (raw is Map<String, dynamic>) {
                  final action = ActionConfig.fromJson(raw);
                  onAction(action);
                }
              }
            }

            await _showActionPopup(context, popupConfig, onAction, screenKey,
                stateData, item, listIndex, compositeKey);
          }
        },
        type: _parseButtonType(props['type']),
        size: _parseButtonSize(props['size']),
        suffixIcon: props['suffixIcon'] != null
            ? DigitIconMapping.getIcon(props['suffixIcon'])
            : null,
        prefixIcon: props['prefixIcon'] != null
            ? DigitIconMapping.getIcon(props['prefixIcon'])
            : null);
  }

  /// Show the action popup based on configuration
  Future<dynamic> _showActionPopup(
    BuildContext context,
    Map<String, dynamic> popupConfig,
    void Function(ActionConfig) onAction,
    String? screenKey,
    CrudStateData? stateData,
    Map<String, dynamic>? item,
    int? listIndex,
    String? compositeKey,
  ) {
    final localization = LocalizationContext.maybeOf(context);
    final title = popupConfig['title'] as String? ?? 'Popup';
    final description = popupConfig['description'] as String?;
    final titleIconName = popupConfig['titleIcon'] as String?;
    final showCloseButton = popupConfig['showCloseButton'] as bool? ?? true;
    final barrierDismissible =
        popupConfig['barrierDismissible'] as bool? ?? true;
    final bodyWidgets = popupConfig['body'] as List<dynamic>? ?? [];
    final footerActions = popupConfig['footerActions'] as List<dynamic>? ?? [];

    return showCustomPopup(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        return Popup(
          title: localization?.translate(title) ?? title,
          description: description!=null && localization!.translate(description).trim().isNotEmpty ? description : null,
          titleIcon: titleIconName != null
              ? Icon(
                  DigitIconMapping.getIcon(titleIconName),
                  color: DigitTheme.instance.colorScheme.primary,
                )
              : null,
          onCrossTap: showCloseButton
              ? () {
                  Navigator.of(ctx, rootNavigator: true).pop();
                }
              : null,
          actionSpacing: spacer2,
          additionalWidgets: [
            // Build body widgets from config
            // Wrap in LocalizationContext and CrudItemContext so widgets inside popup can access context data
            ...bodyWidgets.map((widgetJson) {
              if (widgetJson is Map<String, dynamic>) {
                return LocalizationContext(
                  localization: localization!,
                  child: CrudItemContext(
                    stateData: stateData,
                    screenKey: screenKey,
                    compositeKey: compositeKey,
                    item: item,
                    listIndex: listIndex,
                    child: Builder(
                      builder: (innerCtx) => FlowWidgetFactory.build(
                        widgetJson,
                        innerCtx,
                        onAction,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
          actions: footerActions.isEmpty
              ? null
              : footerActions
                  .whereType<Map<String, dynamic>>()
                  .map((actionJson) {
                  // Footer actions use original context which has LocalizationContext in its tree
                  return FlowWidgetFactory.build(
                    actionJson,
                    context,
                    onAction,
                  ) as DigitButton;
                }).toList(),
          inlineActions: true,
        );
      },
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
}
