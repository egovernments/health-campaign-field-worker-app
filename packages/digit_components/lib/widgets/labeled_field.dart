import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class LabeledField extends StatelessWidget {
  final Widget child;
  final String label;
  final String? description;
  final IconData? icon;
  final String? tooltipMessage;
  final TextStyle? labelStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsets? padding;
  final bool preferToolTipBelow;
  final TooltipTriggerMode tooltipTriggerMode;
  final TextStyle? textStyle;

  const LabeledField({
    super.key,
    required this.child,
    required this.label,
    this.description,
    this.descriptionStyle,
    this.icon,
    this.tooltipMessage,
    this.labelStyle,
    this.padding,
    this.preferToolTipBelow = false,
    this.tooltipTriggerMode = TooltipTriggerMode.tap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.only(top: kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    label,
                    style: labelStyle ??
                        DigitTheme.instance.mobileTheme.textTheme.labelSmall,
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
            description != null
                ? Flexible(
                    child: Text(
                      description ?? '',
                      style: descriptionStyle ??
                          DigitTheme.instance.mobileTheme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w100),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 8),
            child,
          ],
        ),
      );
}
