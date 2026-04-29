import 'package:digit_flow_builder/utils/flow_widget_state.dart';
import 'package:digit_flow_builder/utils/interpolation.dart';
import 'package:digit_flow_builder/widget_registry.dart';
import 'package:digit_flow_builder/widgets/flow_widget_interface.dart';
import 'package:digit_flow_builder/widgets/localization_context.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/widget_parsers.dart';
import '../resolved_flow_widget.dart';

class SelectButtonWidget extends ResolvedFlowWidget {
  @override
  String get format => 'selectButton';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final fieldKey = resolved.resolveField(json['fieldKey']) as String?;
    final fieldValue = resolved.resolveField(json['fieldValue']) as String?;
    final selectionConditions = json['selectionConditions'] as List?;
    final groupKey = resolved.resolveField(json['groupKey']) as String?;

    final hide = resolved.resolveField(json['hide']);

    if (hide == true) {
      return const SizedBox.shrink();
    }

    final popupConfig = json['popupConfig'] as Map<String, dynamic>?;
    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    String padding = props['padding'] ?? 'spacer2';

    // Use resolved state for context data
    final stateData = resolved.stateData;
    final item = resolved.state.itemData;
    final listIndex = resolved.state.listIndex;
    final screenKey = resolved.screenKey;
    final compositeKey = resolved.compositeKey;

    var selectedData;
    var isSelected = false;

    if ((fieldKey == null || fieldValue == null) &&
        selectionConditions == null) {
      return const SizedBox
          .shrink(); // If required data for selection is not provided, return empty widget.
    }

    return WidgetStateContext.reactive(context, (ctx, state) {
      if (selectionConditions != null) {
        isSelected = _resolveSelectionCondition(selectionConditions, resolved);
      } else {
        selectedData = (groupKey != null
                ? (state.widgetData[groupKey]?[fieldKey])
                : state.widgetData[fieldKey]) ??
            false;
      }

      return DigitButton(
        crossAxisAlignment: CrossAxisAlignment.center,
        label: resolved.resolvedLabel ?? '',
        isDisabled: resolved.isDisabled,
        onPressed: () async {
          // Show popup if popupConfig is provided
          if (popupConfig != null) {
            // Execute onOpenAction before showing popup
            final onOpenActions = popupConfig['onOpenAction'] as List<dynamic>?;
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
          if (json['onAction'] != null) {
            final actionsList =
                List<Map<String, dynamic>>.from(json['onAction']);
            await resolved.executeActions(actionsList, context);
          }
          if (selectionConditions == null) {
            if (groupKey != null) {
              state.updateWidgetData(groupKey,
                  {...?state.widgetData[groupKey], fieldKey: fieldValue});
            } else {
              state.updateWidgetData(fieldKey!, fieldValue);
            }
          }
        },
        type: WidgetParsers.parseButtonType(
            isSelected || (selectedData != null && selectedData == fieldValue)
                ? props['selectedType']
                : resolved.resolveField(props['type'])),
        size: WidgetParsers.parseButtonSize(props['size']),
        digitButtonThemeData: DigitButtonThemeData(
          primaryDigitButtonColor: DigitButtonThemeData.defaultTheme(context)
              .primaryDigitButtonColor,
          DigitButtonColor: colorMap[resolved.resolveField(props["color"])] ??
              DigitButtonThemeData.defaultTheme(context).DigitButtonColor,
          disabledColor:
              DigitButtonThemeData.defaultTheme(context).disabledColor,
          radius: BorderRadius.circular(spacer3),
          largeRadius: BorderRadius.circular(spacer3),
          smallMediumRadius: BorderRadius.circular(spacer3),
          padding: EdgeInsets.all(WidgetParsers.parseSize(padding)),
        ),
        mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
        mainAxisAlignment:
            WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
        suffixIcon: json['suffixIcon'] != null
            ? DigitIconMapping.getIcon(json['suffixIcon'])
            : null,
        prefixIcon: json['prefixIcon'] != null
            ? DigitIconMapping.getIcon(json['prefixIcon'])
            : null,
      );
    });
  }

  Map<String, Color> colorMap = {'green': Colors.green};

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
          description: description != null &&
                  localization!.translate(description).trim().isNotEmpty
              ? description
              : null,
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
                        context,
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

  _resolveSelectionCondition(
      List selectionConditions, ResolvedWidgetContext resolved) {
    bool result = false;
    for (var selectionCondition in selectionConditions) {
      final condition = selectionCondition["condition"];
      final target = resolved.resolveField(selectionCondition["target"]);
      final value = resolved.resolveField(selectionCondition["value"]);
      if (target == null) continue; // If target is null, skip this condition.
      if (condition == "EMPTY") {
        result = (target == null || target.toString().isEmpty);
      } else if (condition == "NOT_EMPTY") {
        result = (target != null && target.toString().isNotEmpty);
      } else if (condition == "EQUALS") {
        if (target is Map) {
          var key = resolved.resolveText(value.toString().split("==")[0]);
          var expectedValue = value.toString().split("==")[1];
          result = target[key] == expectedValue;
        }
        result = (target == value);
      } else if (condition == "CONTAINS") {
        if (target is Map) {
          result = target.containsKey(value);
        } else if (target is List) {
          result = target.contains(value);
        }
      } else if (condition == "IS_TRUE") {
        result = (target == true);
      }
    }
    if (result == false) {
      return false; // If any condition is false, return false immediately.
    }
    return result;
  }
}
