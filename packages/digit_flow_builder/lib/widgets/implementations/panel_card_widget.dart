import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class PanelCardWidget extends ResolvedFlowWidget {
  @override
  String get format => 'panelCard';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    // Enrich evalContext with navigation params
    final navigationData = resolved.compositeKey != null
        ? FlowCrudStateRegistry()
            .getNavigationParams(resolved.compositeKey!)
        : null;

    final evalContext = {
      ...resolved.evalContext,
      if (navigationData != null) 'navigation': navigationData,
    };

    final localization = LocalizationContext.maybeOf(context);

    // Label/description need navigation context, so resolve with enriched evalContext
    final label = resolveTemplate(json['label'] ?? '', evalContext,
        localization: localization, screenKey: resolved.screenKey,
        stateData: resolved.stateData);
    String? description = resolveTemplate(json['description'] ?? '', evalContext,
        localization: localization, screenKey: resolved.screenKey,
        stateData: resolved.stateData);

    // Apply descriptionArgs ({1}, {2}, ...) substitution
    // Resolve each arg template via evalContext (which has navigation data)
    final descriptionArgs = json['descriptionArgs'] as List<dynamic>?;
    if (description != null &&
        descriptionArgs != null &&
        descriptionArgs.isNotEmpty) {
      for (int i = 0; i < descriptionArgs.length; i++) {
        final argTemplate = descriptionArgs[i]?.toString() ?? '';
        final resolvedArg = resolveTemplate(argTemplate, evalContext,
                screenKey: resolved.screenKey,
                stateData: resolved.stateData) ??
            argTemplate;
        description = description!.replaceAll('{${i + 1}}', resolvedArg);
      }
    }

    // Apply descriptionPlaceHolders ({KEY}) substitution — takes priority
    // Resolve each value template via evalContext (which has navigation data)
    final descriptionPlaceHolders =
        json['descriptionPlaceHolders'] as List<dynamic>?;
    if (description != null &&
        descriptionPlaceHolders != null &&
        descriptionPlaceHolders.isNotEmpty) {
      for (final ph in descriptionPlaceHolders) {
        if (ph is! Map) continue;
        final key = ph['key']?.toString();
        final valueTemplate = ph['value']?.toString() ?? '';
        if (key == null || key.isEmpty) continue;
        final resolvedValue = resolveTemplate(valueTemplate, evalContext,
                screenKey: resolved.screenKey,
                stateData: resolved.stateData) ??
            valueTemplate;
        description = description!.replaceAll('{$key}', resolvedValue);
      }
    }

    Map<String, dynamic>? primaryAction = json['primaryAction'];
    Map<String, dynamic>? secondaryAction = json['secondaryAction'];

    void handleAction(Map<String, dynamic>? actionJson) {
      if (actionJson == null) return;

      final actionsList = actionJson['onAction'];

      for (var actionMap in actionsList) {
        final action = resolved.resolveAction(
          actionMap,
          evalContext,
        );
        onAction(action);
      }
    }

    // Build additional widgets if provided
    final additionalWidgetsConfig =
        json['additionalWidgets'] as List<dynamic>?;
    List<Widget>? additionalWidgets;

    if (additionalWidgetsConfig != null &&
        additionalWidgetsConfig.isNotEmpty) {
      final widgets = <Widget>[];
      try {
        for (var widgetJson in additionalWidgetsConfig) {
          if (widgetJson is Map<String, dynamic>) {
            final widget = WidgetRegistry.build(
              widgetJson,
              context,
              onAction,
            );
            widgets.add(widget);
          }
        }
        if (widgets.isNotEmpty) {
          additionalWidgets = widgets;
        }
      } catch (e, stackTrace) {
        debugPrint('Error building additionalWidgets: $e');
        debugPrint('StackTrace: $stackTrace');
        additionalWidgets = null;
      }
    }

    return PanelCard(
      title: label,
      type: PanelType.success,
      description: description,
      additionWidgets: additionalWidgets,
      actions: [
        if (primaryAction != null)
          DigitButton(
            type: DigitButtonType.primary,
            size: DigitButtonSize.large,
            label: localization?.translate(primaryAction['label'] ?? '') ??
                (primaryAction['label'] ?? ''),
            onPressed: () => handleAction(json['primaryAction']),
          ),
        if (secondaryAction != null)
          DigitButton(
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
            label:
                localization?.translate(secondaryAction['label'] ?? '') ??
                    (secondaryAction['label'] ?? ''),
            onPressed: () => handleAction(json['secondaryAction']),
          ),
      ],
    );
  }
}
