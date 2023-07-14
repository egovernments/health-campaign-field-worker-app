import 'package:flutter/material.dart';

class LabeledField extends StatelessWidget {
  final Widget child;
  final String label;
  final IconData? icon;
  final String? tooltipMessage;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final bool preferToolTipBelow;
  final TooltipTriggerMode tooltipTriggerMode;

  const LabeledField({
    super.key,
    required this.child,
    required this.label,
    this.icon,
    this.tooltipMessage,
    this.labelStyle,
    this.padding,
    this.preferToolTipBelow = false,
    this.tooltipTriggerMode = TooltipTriggerMode.tap,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    label,
                    style: labelStyle ?? Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                icon != null
                    ? Tooltip(
                        message: tooltipMessage ?? '',
                        preferBelow: preferToolTipBelow,
                        triggerMode: tooltipTriggerMode,
                        child: Icon(icon ?? Icons.info_outline))
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      );
}
