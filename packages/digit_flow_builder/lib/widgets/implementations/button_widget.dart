import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:flutter/material.dart';

import '../../action_handler/action_config.dart';
import '../../utils/widget_parsers.dart';
import '../resolved_flow_widget.dart';

class ButtonWidget extends ResolvedFlowWidget {
  @override
  String get format => 'button';

  @override
  Widget buildResolved(
    Map<String, dynamic> json,
    BuildContext context,
    void Function(ActionConfig) onAction,
    ResolvedWidgetContext resolved,
  ) {
    final props = Map<String, dynamic>.from(json['properties'] ?? {});

    return WidgetParsers.wrapWithBottomGap(
      _AsyncDigitButton(
        json: json,
        props: props,
        resolved: resolved,
      ),
      props,
    );
  }
}

// Stateful wrapper that gates the button against re-entry while its async
// onAction chain is in flight. Without this guard, a double-tap on
// stock-accept (and any other async-action button) re-runs the chain — and
// because transformer configs mint fresh UUIDs per invocation, that produces
// duplicate writes the wrapper-level dedup can mask after the fact.
class _AsyncDigitButton extends StatefulWidget {
  const _AsyncDigitButton({
    required this.json,
    required this.props,
    required this.resolved,
  });

  final Map<String, dynamic> json;
  final Map<String, dynamic> props;
  final ResolvedWidgetContext resolved;

  @override
  State<_AsyncDigitButton> createState() => _AsyncDigitButtonState();
}

class _AsyncDigitButtonState extends State<_AsyncDigitButton> {
  bool _inFlight = false;

  @override
  Widget build(BuildContext context) {
    final props = widget.props;
    final json = widget.json;
    final resolved = widget.resolved;

    final DigitButtonType type = WidgetParsers.parseButtonType(props['type']);
    final DigitButtonSize size = WidgetParsers.parseButtonSize(props['size']);
    final String? height = props['height'];
    final String? radius = props['radius'];

    return DigitButton(
      crossAxisAlignment: CrossAxisAlignment.center,
      capitalizeLetters: false,
      label: resolved.resolvedLabel ?? '',
      isDisabled: resolved.isDisabled || _inFlight,
      onPressed: () async {
        if (_inFlight) return;
        if (json['onAction'] == null) return;
        setState(() => _inFlight = true);
        try {
          final actionsList =
              List<Map<String, dynamic>>.from(json['onAction']);
          await resolved.executeActions(actionsList, context);
        } finally {
          if (mounted) setState(() => _inFlight = false);
        }
      },
      type: type,
      size: size,
      digitButtonThemeData:
          DigitButtonThemeData.defaultTheme(context).copyWith(
        smallDigitButtonHeight:
            (size == DigitButtonSize.small && height != null)
                ? WidgetParsers.parseSize(height)
                : DigitButtonThemeData.defaultTheme(context)
                    .smallDigitButtonHeight,
        mediumDigitButtonHeight:
            (size == DigitButtonSize.medium && height != null)
                ? WidgetParsers.parseSize(height)
                : DigitButtonThemeData.defaultTheme(context)
                    .mediumDigitButtonHeight,
        largeDigitButtonHeight:
            (size == DigitButtonSize.large && height != null)
                ? WidgetParsers.parseSize(height)
                : DigitButtonThemeData.defaultTheme(context)
                    .largeDigitButtonHeight,
        smallMediumRadius: ((size == DigitButtonSize.small ||
                    size == DigitButtonSize.medium) &&
                radius != null)
            ? BorderRadius.circular(WidgetParsers.parseSize(radius))
            : DigitButtonThemeData.defaultTheme(context).smallMediumRadius,
        largeRadius: (size == DigitButtonSize.large && radius != null)
            ? BorderRadius.circular(WidgetParsers.parseSize(radius))
            : DigitButtonThemeData.defaultTheme(context).largeRadius,
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
  }
}
