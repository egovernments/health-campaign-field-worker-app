import 'package:digit_flow_builder/utils/widget_parsers.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/interpolation.dart';
import '../../utils/utils.dart';
import '../../widget_registry.dart';
import '../flow_widget_interface.dart';
import '../localization_context.dart';
import '../resolved_flow_widget.dart';

class ActionPopupWidget extends ResolvedFlowWidget {
  @override
  String get format => 'actionPopup';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final localization = resolved.localization;
    final props = Map<String, dynamic>.from(json['properties'] ?? {});
    final popupConfig = props['popupConfig'] as Map<String, dynamic>?;

    // Use resolved state for context data
    final stateData = resolved.stateData;
    final item = resolved.state.itemData;
    final listIndex = resolved.state.listIndex;
    final screenKey = resolved.screenKey;
    final compositeKey = resolved.compositeKey;

    DigitButtonType type = WidgetParsers.parseButtonType(props['type']);
    DigitButtonSize size = WidgetParsers.parseButtonSize(props['size']);
    String? height = props['height'];
    String? width = props['width'];
    String? radius = props['radius'];
    String? borderPadding = props['borderPadding'];
    final bool alignCenter = props['align'] == 'center';
    final bool showBorder = props['showBorder'] == true;

    final button = DigitButton(
      isDisabled: resolved.isDisabled,
      capitalizeLetters: false,
      mainAxisSize: WidgetParsers.parseMainAxisSize(props['mainAxisSize']),
      mainAxisAlignment:
          WidgetParsers.parseMainAxisAlignment(props['mainAxisAlignment']),
      label: resolved.resolvedLabel ?? json['label'] ?? '',
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
              stateData, item, listIndex, compositeKey, resolved.evalContext);
        }
      },
      type: type,
      size: size,
      digitButtonThemeData: DigitButtonThemeData.defaultTheme(context).copyWith(
        smallDigitButtonHeight: (size == DigitButtonSize.small &&
                height != null)
            ? WidgetParsers.parseSize(height)
            : DigitButtonThemeData.defaultTheme(context).smallDigitButtonHeight,
        mediumDigitButtonHeight:
            (size == DigitButtonSize.medium && height != null)
                ? WidgetParsers.parseSize(height)
                : DigitButtonThemeData.defaultTheme(context)
                    .mediumDigitButtonHeight,
        largeDigitButtonHeight: (size == DigitButtonSize.large &&
                height != null)
            ? WidgetParsers.parseSize(height)
            : DigitButtonThemeData.defaultTheme(context).largeDigitButtonHeight,
        smallMediumRadius: ((size == DigitButtonSize.small ||
                    size == DigitButtonSize.medium) &&
                radius != null)
            ? BorderRadius.circular(WidgetParsers.parseSize(radius))
            : DigitButtonThemeData.defaultTheme(context).smallMediumRadius,
        largeRadius: (size == DigitButtonSize.large && radius != null)
            ? BorderRadius.circular(WidgetParsers.parseSize(radius))
            : DigitButtonThemeData.defaultTheme(context).largeRadius,
        smallDigitButtonTextStyle:
            DigitButtonThemeData.defaultTheme(context).mediumDigitButtonTextStyle,
        padding: const EdgeInsets.symmetric(horizontal: spacer3),
      ),
      suffixIcon: props['suffixIcon'] != null
          ? DigitIconMapping.getIcon(props['suffixIcon'])
          : null,
      prefixIcon: props['prefixIcon'] != null
          ? DigitIconMapping.getIcon(props['prefixIcon'])
          : null,
    );

    Widget content = button;
    if (showBorder) {
      final borderRadius = radius != null
          ? BorderRadius.circular(WidgetParsers.parseSize(radius))
          : BorderRadius.circular(4);
      content = Container(
        padding: EdgeInsets.symmetric(
          horizontal: borderPadding != null
              ? WidgetParsers.parseSize(borderPadding)
              : spacer3,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
          border: Border.all(
            color: Theme.of(context).colorTheme.primary.primary1,
            width: 1,
          ),
        ),
        child: button,
      );
    }

    if (width != null) {
      content = SizedBox(
        width: WidgetParsers.parseSize(width),
        child: content,
      );
    }

    return WidgetParsers.wrapWithBottomGap(
      alignCenter ? Center(child: content) : content,
      props,
    );
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
    Map<String, dynamic> evalContext,
  ) {
    final localization = LocalizationContext.maybeOf(context);
    final title = popupConfig['title'] as String? ?? 'Popup';

    // Resolve the description as a template so configs can interpolate live
    // values (e.g. {{fn:...}}) and named {KEY} placeholders, matching what
    // panelCard already supports. Popup renders **bold** spans, so a value
    // wrapped in ** in the copy comes through emphasised.
    String? description = popupConfig['description'] as String?;
    if (description != null) {
      description = resolveTemplate(
        description,
        evalContext,
        localization: localization,
        screenKey: screenKey,
        stateData: stateData,
      );
      final placeHolders =
          popupConfig['descriptionPlaceHolders'] as List<dynamic>?;
      if (placeHolders != null) {
        for (final ph in placeHolders) {
          if (ph is! Map) continue;
          final key = ph['key']?.toString();
          if (key == null || key.isEmpty) continue;
          final resolved = resolveTemplate(
            ph['value']?.toString() ?? '',
            evalContext,
            screenKey: screenKey,
            stateData: stateData,
          );
          description = description!.replaceAll('{$key}', resolved);
        }
      }
    }
    final titleIconName = popupConfig['titleIcon'] as String?;
    final titleIconColor = popupConfig['titleIconColor'] as String?;
    final showCloseButton = popupConfig['showCloseButton'] as bool? ?? true;
    final barrierDismissible =
        popupConfig['barrierDismissible'] as bool? ?? true;
    final bodyWidgets = popupConfig['body'] as List<dynamic>? ?? [];
    final footerActions = popupConfig['footerActions'] as List<dynamic>? ?? [];
    final popupType = popupConfig['type'] as String? ?? 'simple';

    return showCustomPopup(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        return Popup(
          type: _parsePopupType(popupType),
          title: localization?.translate(title) ?? title,
          description: (description?.trim().isNotEmpty ?? false)
              ? description
              : null,
          titleIcon: titleIconName != null
              ? Icon(
                  DigitIconMapping.getIcon(titleIconName),
                  // Defaults to the type-aware colour: alert popups carry the
                  // error red, simple popups (e.g. filter) the primary orange.
                  // `titleIconColor` overrides it for cases like Insufficient
                  // Stock, which uses the simple layout but an error icon.
                  color: _resolveTitleIconColor(ctx, titleIconColor, popupType),
                  size: spacer8,
                )
              : null,
          titleIconAlignment: CrossAxisAlignment.center,
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

  /// Resolves the popup's title-icon colour. An explicit `titleIconColor`
  /// wins; otherwise fall back to the type-aware default.
  Color _resolveTitleIconColor(
    BuildContext context,
    String? named,
    String? popupType,
  ) {
    final colorTheme = Theme.of(context).colorTheme;
    switch (named) {
      case 'error':
        return colorTheme.alert.error;
      case 'warning':
        return colorTheme.alert.warning;
      case 'success':
        return colorTheme.alert.success;
      case 'info':
        return colorTheme.alert.info;
      case 'primary':
        return colorTheme.primary.primary1;
    }
    return _parsePopupType(popupType) == PopUpType.alert
        ? colorTheme.alert.error
        : colorTheme.primary.primary1;
  }

  PopUpType _parsePopupType(String? type) {
    switch (type) {
      case 'alert':
        return PopUpType.alert;
      case 'simple':
      case 'default':
      default:
        return PopUpType.simple;
    }
  }
}
