import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
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
    final heading = _localizeText(context, json['heading']) ?? "";
    final description = _localizeText(context, json['description']);
    final icon = DigitIconMapping.getIcon(json['icon']);
    void handleTap() => _runOnTap(json, resolved, onAction);

    final styling = json['styling'];
    if (styling is! Map) {
      // No styling override — call the package widget so existing cards
      // render exactly as before.
      return MenuCard(
        onTap: handleTap,
        heading: heading,
        description: description,
        icon: icon,
      );
    }

    return _StyledMenuCard(
      heading: heading,
      description: description,
      icon: icon,
      onTap: handleTap,
      alignment: styling['alignment'] as String?,
      iconPosition: styling['iconPosition'] as String?,
      descriptionAlignment: styling['descriptionAlignment'] as String?,
    );
  }

  void _runOnTap(
    Map<String, dynamic> json,
    ResolvedWidgetContext resolved,
    void Function(ActionConfig) onAction,
  ) {
    if (json['onAction'] == null) return;
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

  String? _localizeText(BuildContext context, String? text) {
    if (text == null) return null;
    final localization = LocalizationContext.maybeOf(context);
    return localization?.translate(text) ?? text;
  }
}

/// MenuCard with JSON-driven layout. Mirrors the package `MenuCard`'s
/// theme tokens (icon size, colours, text styles, hover border) so a
/// styled card sits next to a default card without visual drift —
/// everything that differs comes from `styling.*`.
class _StyledMenuCard extends StatefulWidget {
  final String heading;
  final String? description;
  final IconData? icon;
  final VoidCallback? onTap;
  final String? alignment;
  final String? iconPosition;
  final String? descriptionAlignment;

  const _StyledMenuCard({
    required this.heading,
    required this.description,
    required this.icon,
    required this.onTap,
    required this.alignment,
    required this.iconPosition,
    required this.descriptionAlignment,
  });

  @override
  State<_StyledMenuCard> createState() => _StyledMenuCardState();
}

class _StyledMenuCardState extends State<_StyledMenuCard> {
  bool _isHovered = false;

  MainAxisAlignment _mainAxis(String? v) {
    switch (v) {
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
      default:
        return MainAxisAlignment.start;
    }
  }

  CrossAxisAlignment _crossAxis(String? v) {
    switch (v) {
      case 'center':
        return CrossAxisAlignment.center;
      case 'end':
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }

  TextAlign _textAlign(String? v) {
    switch (v) {
      case 'center':
        return TextAlign.center;
      case 'end':
        return TextAlign.end;
      default:
        return TextAlign.start;
    }
  }

  AlignmentGeometry _alignmentGeometry(String? v) {
    switch (v) {
      case 'center':
        return Alignment.center;
      case 'end':
        return Alignment.centerRight;
      default:
        return Alignment.centerLeft;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final isMobile = AppView.isMobileView(MediaQuery.of(context).size);
    final isTab = AppView.isTabletView(MediaQuery.of(context).size);

    final iconSize = isMobile ? 24.0 : (isTab ? 32.0 : 32.0);
    final iconWidget = widget.icon == null
        ? null
        : Icon(
            widget.icon,
            size: iconSize,
            color: theme.colorTheme.primary.primary1,
          );

    final headingAlign = widget.alignment;
    final descriptionAlign = widget.descriptionAlignment ?? headingAlign;
    final isTopLayout = widget.iconPosition == 'top';

    final headingText = Text(
      widget.heading,
      textAlign: _textAlign(headingAlign),
      style: textTheme.headingM.copyWith(
        color: theme.colorTheme.primary.primary2,
      ),
    );

    // Leading layout mirrors the package default: icon on the left, then
    // a spacer, then a heading that fills the remaining width. The
    // `Expanded` is what makes a left-aligned pair hug the edge — for
    // non-default alignments we drop it so the Row can shrink-wrap and
    // the Align wrapper actually moves the pair.
    Widget iconAndHeading;
    if (isTopLayout) {
      iconAndHeading = Column(
        crossAxisAlignment: _crossAxis(headingAlign),
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconWidget != null) iconWidget,
          if (iconWidget != null) const SizedBox(height: spacer2),
          headingText,
        ],
      );
    } else {
      final useExpandedHeading = headingAlign == null || headingAlign == 'start';
      iconAndHeading = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: _mainAxis(headingAlign),
        mainAxisSize: useExpandedHeading ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (iconWidget != null) iconWidget,
          if (iconWidget != null) const SizedBox(width: spacer2),
          if (useExpandedHeading) Expanded(child: headingText) else headingText,
        ],
      );
    }

    // Column/Row above decide internal composition. The horizontal
    // placement inside the DigitCard needs an Align wrapper that owns
    // the full card width — without it a `mainAxisSize: min` Column just
    // sits wherever the parent crossAxis alignment places it (left, by
    // default), which is why the icon + heading hugged the edge while
    // the description centred correctly on its own `SizedBox(infinity)`.
    iconAndHeading = Align(
      alignment: _alignmentGeometry(headingAlign),
      child: iconAndHeading,
    );

    final descriptionWidget = widget.description == null
        ? null
        : SizedBox(
            width: double.infinity,
            child: Text(
              widget.description!,
              textAlign: _textAlign(descriptionAlign),
              style: textTheme.bodyS.copyWith(
                color: theme.colorTheme.text.primary,
              ),
            ),
          );

    return InkWell(
      onHover: (hover) => setState(() => _isHovered = hover),
      onTap: widget.onTap,
      child: Container(
        decoration: widget.onTap != null && _isHovered
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(spacer1),
                border: Border.all(
                  width: 1,
                  color: theme.colorTheme.primary.primary1,
                ),
              )
            : null,
        child: DigitCard(
          spacing: 12,
          children: [
            iconAndHeading,
            if (descriptionWidget != null) descriptionWidget,
          ],
        ),
      ),
    );
  }
}
