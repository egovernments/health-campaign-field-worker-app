import 'package:digit_ui_components/constants/icon_mapping.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/conditional_evaluator.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class MenuCardWidget extends ResolvedFlowWidget {
  @override
  String get format => 'menu_card';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final hasAction = json['onAction'] != null &&
        (json['onAction'] as List).isNotEmpty;

    void handleTap() {
      if (!hasAction) return;
      final actionsList = List<Map<String, dynamic>>.from(json['onAction']);
      final currentEvalContext = resolved.getFreshEvalContext();

      for (var actionJson in actionsList) {
        if (actionJson.containsKey('condition')) {
          final condition = actionJson['condition'] as Map<String, dynamic>?;
          final expression = condition?['expression'] as String?;

          bool conditionMet = false;
          if (expression == null || expression == 'DEFAULT') {
            conditionMet = true;
          } else {
            conditionMet = ConditionalEvaluator.evaluateExpression(
              expression,
              currentEvalContext,
            );
          }

          if (conditionMet) {
            final subActions = actionJson['actions'] as List<dynamic>? ?? [];
            for (var subActionJson in subActions) {
              final action = resolved.resolveAction(
                subActionJson as Map<String, dynamic>,
                currentEvalContext,
              );
              onAction(action);
            }
            break;
          }
        } else {
          final action = resolved.resolveAction(actionJson, currentEvalContext);
          onAction(action);
        }
      }
    }

    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final primaryColor = theme.colorTheme.primary.primary1;
    final heading = _localizeText(context, json['heading']) ?? '';
    final description = _localizeText(context, json['description']);
    final iconData = json['icon'] != null
        ? DigitIconMapping.getIcon(json['icon'])
        : null;

    return InkWell(
      onTap: hasAction ? handleTap : null,
      borderRadius: BorderRadius.circular(4),
      child: DigitCard(
        spacing: 12,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (iconData != null) ...[
                Icon(iconData, size: 24, color: primaryColor),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      heading,
                      style: textTheme.headingM.copyWith(
                        color: theme.colorTheme.primary.primary2,
                      ),
                    ),
                    if (description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: textTheme.bodyS.copyWith(
                          color: theme.colorTheme.text.primary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (hasAction) ...[
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: handleTap,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  String? _localizeText(BuildContext context, String? text) {
    if (text == null) return null;
    final localization = LocalizationContext.maybeOf(context);
    return localization?.translate(text) ?? text;
  }
}
