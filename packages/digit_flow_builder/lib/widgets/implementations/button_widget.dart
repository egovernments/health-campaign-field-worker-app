import 'package:digit_ui_components/digit_components.dart';
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
      _DebouncedButton(
        json: json,
        resolved: resolved,
        props: props,
      ),
      props,
    );
  }
}

/// Stateful wrapper that prevents multiple rapid taps on flow buttons.
class _DebouncedButton extends StatefulWidget {
  final Map<String, dynamic> json;
  final ResolvedWidgetContext resolved;
  final Map<String, dynamic> props;

  const _DebouncedButton({
    required this.json,
    required this.resolved,
    required this.props,
  });

  @override
  State<_DebouncedButton> createState() => _DebouncedButtonState();
}

class _DebouncedButtonState extends State<_DebouncedButton> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return DigitButton(
      crossAxisAlignment: CrossAxisAlignment.center,
      capitalizeLetters: false,
      label: widget.resolved.resolvedLabel ?? '',
      isDisabled: widget.resolved.isDisabled || _isProcessing,
      onPressed: () async {
        if (_isProcessing) return;

        setState(() => _isProcessing = true);

        try {
          if (widget.json['onAction'] != null) {
            final actionsList =
                List<Map<String, dynamic>>.from(widget.json['onAction']);
            await widget.resolved.executeActions(actionsList, context);
          }
        } finally {
          if (mounted) {
            setState(() => _isProcessing = false);
          }
        }
      },
      type: WidgetParsers.parseButtonType(widget.props['type']),
      size: WidgetParsers.parseButtonSize(widget.props['size']),
      mainAxisSize:
          WidgetParsers.parseMainAxisSize(widget.props['mainAxisSize']),
      mainAxisAlignment: WidgetParsers.parseMainAxisAlignment(
          widget.props['mainAxisAlignment']),
      suffixIcon: widget.json['suffixIcon'] != null
          ? DigitIconMapping.getIcon(widget.json['suffixIcon'])
          : null,
      prefixIcon: widget.json['prefixIcon'] != null
          ? DigitIconMapping.getIcon(widget.json['prefixIcon'])
          : null,
    );
  }
}
