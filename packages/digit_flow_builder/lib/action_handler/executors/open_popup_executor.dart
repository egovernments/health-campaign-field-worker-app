import 'dart:async';

import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

import '../../utils/interpolation.dart';
import '../../widget_registry.dart';
import '../../widgets/flow_widget_interface.dart';
import '../../widgets/localization_context.dart';
import '../action_config.dart';
import '../action_handler.dart';
import 'action_executor.dart';

/// Executor for OPEN_POPUP action.
///
/// Supports either:
/// 1. `properties.popupConfig` (same shape as `actionPopup` widget), or
/// 2. inline popup properties directly under `properties`.
class OpenPopupExecutor extends ActionExecutor {
  @override
  bool canHandle(String actionType) => actionType == 'OPEN_POPUP';

  @override
  Future<Map<String, dynamic>> execute(
    ActionConfig action,
    BuildContext context,
    Map<String, dynamic> contextData,
  ) async {
    final popupConfig = _extractPopupConfig(action.properties);
    if (popupConfig == null) {
      debugPrint('OPEN_POPUP: Missing popup configuration in properties.');
      return contextData;
    }

    var updatedContextData = Map<String, dynamic>.from(contextData);

    // Resolve screen context for popup-triggered actions.
    final crudCtx = CrudItemContext.of(context);
    final parentScreenKey = action.properties['parentScreenKey'] as String? ??
        crudCtx?.screenKey ??
        getEffectiveScreenKey(context, updatedContextData);

    final parentCompositeKey = crudCtx?.compositeKey ??
        getEffectiveCompositeKey(
          context,
          {
            ...updatedContextData,
            if (parentScreenKey != null) 'parentScreenKey': parentScreenKey,
          },
        );

    final onOpenActions = popupConfig['onOpenAction'] as List<dynamic>?;
    if (onOpenActions != null && onOpenActions.isNotEmpty) {
      updatedContextData = await ActionHandler.executeActions(
        onOpenActions,
        context,
        {
          ...updatedContextData,
          if (parentScreenKey != null) 'parentScreenKey': parentScreenKey,
          if (parentCompositeKey != null) '_compositeKey': parentCompositeKey,
        },
      );
    }

    await _showPopup(
      context: context,
      popupConfig: popupConfig,
      contextData: updatedContextData,
      parentScreenKey: parentScreenKey,
      parentCompositeKey: parentCompositeKey,
      crudCtx: crudCtx,
    );

    return updatedContextData;
  }

  Map<String, dynamic>? _extractPopupConfig(Map<dynamic, dynamic> properties) {
    final rawPopupConfig = properties['popupConfig'];
    if (rawPopupConfig is Map) {
      return Map<String, dynamic>.from(rawPopupConfig as Map);
    }

    // Allow inline config directly under properties.
    if (properties.isEmpty) return null;
    return Map<String, dynamic>.from(properties);
  }

  Future<void> _showPopup({
    required BuildContext context,
    required Map<String, dynamic> popupConfig,
    required Map<String, dynamic> contextData,
    required String? parentScreenKey,
    required String? parentCompositeKey,
    required CrudItemContext? crudCtx,
  }) async {
    final localization = LocalizationContext.maybeOf(context);
    final title = popupConfig['title'] as String? ?? 'Popup';
    final description = popupConfig['description'] as String?;
    final titleIconName = popupConfig['titleIcon'] as String?;
    final showCloseButton = _toBool(popupConfig['showCloseButton'], true);
    final barrierDismissible = _toBool(popupConfig['barrierDismissible'], true);
    final bodyWidgets = popupConfig['body'] as List<dynamic>? ?? [];
    final footerActions = popupConfig['footerActions'] as List<dynamic>? ?? [];

    String? translatedDescription;
    if (description != null) {
      final resolvedDescription =
          localization?.translate(description) ?? description;
      if (resolvedDescription.trim().isNotEmpty) {
        translatedDescription = resolvedDescription;
      }
    }

    await showCustomPopup(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (popupContext) {
        return Popup(
          title: localization?.translate(title) ?? title,
          description: translatedDescription,
          titleIcon: titleIconName != null
              ? Icon(
                  DigitIconMapping.getIcon(titleIconName),
                  color: DigitTheme.instance.colorScheme.primary,
                )
              : null,
          onCrossTap: showCloseButton
              ? () {
                  Navigator.of(popupContext, rootNavigator: true).pop();
                }
              : null,
          actionSpacing: spacer2,
          additionalWidgets: bodyWidgets
              .whereType<Map<String, dynamic>>()
              .map(
                (widgetJson) => _wrapPopupWidget(
                  child: Builder(
                    builder: (innerCtx) => FlowWidgetFactory.build(
                      widgetJson,
                      innerCtx,
                      (popupAction) {
                        final enrichedAction = _withParentScreenKey(
                          popupAction,
                          parentScreenKey,
                        );

                        unawaited(
                          ActionHandler.execute(
                            enrichedAction,
                            innerCtx,
                            {
                              ...contextData,
                              if (parentScreenKey != null)
                                'parentScreenKey': parentScreenKey,
                              if (parentCompositeKey != null)
                                '_compositeKey': parentCompositeKey,
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  localization: localization,
                  crudCtx: crudCtx,
                  parentScreenKey: parentScreenKey,
                  parentCompositeKey: parentCompositeKey,
                ),
              )
              .toList(),
          actions: footerActions.isEmpty
              ? null
              : footerActions
                  .whereType<Map<String, dynamic>>()
                  .map(
                    (actionJson) => _wrapPopupWidget(
                      child: Builder(
                        builder: (innerCtx) => FlowWidgetFactory.build(
                          actionJson,
                          innerCtx,
                          (popupAction) {
                            final enrichedAction = _withParentScreenKey(
                              popupAction,
                              parentScreenKey,
                            );

                            unawaited(
                              ActionHandler.execute(
                                enrichedAction,
                                innerCtx,
                                {
                                  ...contextData,
                                  if (parentScreenKey != null)
                                    'parentScreenKey': parentScreenKey,
                                  if (parentCompositeKey != null)
                                    '_compositeKey': parentCompositeKey,
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      localization: localization,
                      crudCtx: crudCtx,
                      parentScreenKey: parentScreenKey,
                      parentCompositeKey: parentCompositeKey,
                    ),
                  )
                  .whereType<DigitButton>()
                  .toList(),
          inlineActions: true,
        );
      },
    );
  }

  Widget _wrapPopupWidget({
    required Widget child,
    required dynamic localization,
    required CrudItemContext? crudCtx,
    required String? parentScreenKey,
    required String? parentCompositeKey,
  }) {
    final wrapped = CrudItemContext(
      stateData: crudCtx?.stateData,
      screenKey: parentScreenKey ?? crudCtx?.screenKey,
      compositeKey: parentCompositeKey ?? crudCtx?.compositeKey,
      item: crudCtx?.item,
      listIndex: crudCtx?.listIndex,
      child: child,
    );

    if (localization == null) {
      return wrapped;
    }

    return LocalizationContext(
      localization: localization,
      child: wrapped,
    );
  }

  ActionConfig _withParentScreenKey(ActionConfig action, String? screenKey) {
    if (screenKey == null || action.properties['parentScreenKey'] != null) {
      return action;
    }

    return ActionConfig(
      action: action.action,
      actionType: action.actionType,
      properties: {
        ...action.properties,
        'parentScreenKey': screenKey,
      },
      condition: action.condition,
      actions: action.actions,
    );
  }

  bool _toBool(dynamic value, bool fallback) {
    if (value is bool) return value;
    if (value is String) {
      final normalized = value.toLowerCase().trim();
      if (normalized == 'true') return true;
      if (normalized == 'false') return false;
    }
    return fallback;
  }
}
