import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/conditional_evaluator.dart';
import '../../utils/utils.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class BackLinkWidget extends ResolvedFlowWidget {
  @override
  String get format => 'backLink';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final label = resolved.resolvedLabel ?? (json['label'] ?? '');

    return DigitBackButton(
      label: label,
      handleBack: () {
        _handleBack(json, context, onAction, resolved);
      },
      digitBackButtonThemeData: const DigitBackButtonThemeData().copyWith(
        context: context,
        backDigitButtonIcon: Icon(
          Icons.arrow_left,
          size: Theme.of(context).spacerTheme.spacer5,
          color: Theme.of(context).colorTheme.primary.primary2,
        ),
      ),
    );
  }

  void _handleBack(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final popupConfig = json['popupConfig'] as Map<String, dynamic>?;

    if (popupConfig != null) {
      final conditionExpr = popupConfig['condition'];
      bool showPopup = false;

      if (conditionExpr != null) {
        final result = ConditionalEvaluator.evaluate(
          conditionExpr,
          resolved.state.evalContext,
          screenKey: resolved.state.screenKey,
          stateData: resolved.state.stateData,
        );
        showPopup = result == true;
      }

      if (showPopup) {
        _showConfirmationPopup(json, context, onAction, resolved, popupConfig);
        return;
      }
    }

    _executeBackActions(json, context, onAction, resolved);
  }

  void _executeBackActions(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    if (json['onAction'] != null) {
      final actionsList =
          List<Map<String, dynamic>>.from(json['onAction']);

      for (var actionJson in actionsList) {
        var action = ActionConfig.fromJson(actionJson);

        // Resolve navigation data if present
        final navData = action.properties['data'] as List<dynamic>?;

        if (navData != null) {
          final resolvedData = navData.map((entry) {
            final key = entry['key'] as String;
            final rawValue = entry['value'];

            // Resolve using evalContext which contains all data sources
            final resolvedValue =
                resolveValue(rawValue, resolved.evalContext);

            return {
              "key": key,
              "value":
                  resolvedValue == rawValue ? rawValue : resolvedValue,
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
  }

  void _showConfirmationPopup(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
    Map<String, dynamic> popupConfig,
  ) {
    final localization = LocalizationContext.maybeOf(context);
    final title = popupConfig['title'] as String? ?? '';
    final description = popupConfig['description'] as String? ?? '';
    final titleIconName = popupConfig['titleIcon'] as String?;
    final confirmLabel =
        popupConfig['confirmLabel'] as String? ?? 'CORE_COMMON_CONTINUE';
    final cancelLabel =
        popupConfig['cancelLabel'] as String? ?? 'CORE_COMMON_CANCEL';

    final translatedTitle =
        localization?.translate(title) ?? title;
    final translatedDescription =
        localization?.translate(description) ?? description;
    final translatedConfirm =
        localization?.translate(confirmLabel) ?? confirmLabel;
    final translatedCancel =
        localization?.translate(cancelLabel) ?? cancelLabel;

    showCustomPopup(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Popup(
          title: translatedTitle,
          description: translatedDescription.trim().isNotEmpty
              ? translatedDescription
              : null,
          titleIcon: titleIconName != null
              ? Icon(
                  DigitIconMapping.getIcon(titleIconName),
                  color: DigitTheme.instance.colorScheme.primary,
                )
              : null,
          onCrossTap: () {
            Navigator.of(ctx, rootNavigator: true).pop();
          },
          actions: [
            DigitButton(
              capitalizeLetters: false,
              label: translatedCancel,
              onPressed: () {
                Navigator.of(ctx, rootNavigator: true).pop();
              },
              type: DigitButtonType.secondary,
              size: DigitButtonSize.medium,
            ),
            DigitButton(
              capitalizeLetters: false,
              label: translatedConfirm,
              onPressed: () {
                Navigator.of(ctx, rootNavigator: true).pop();
                _executeBackActions(json, context, onAction, resolved);
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.medium,
            ),
          ],
          inlineActions: true,
        );
      },
    );
  }
}
