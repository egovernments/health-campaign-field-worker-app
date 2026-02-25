import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../blocs/flow_crud_bloc.dart';
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

    // Label/description need navigation context, so resolve manually here
    final label = resolved.resolveText(json['label'] ?? '');
    final description = resolved.resolveText(json['description'] ?? '');

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
