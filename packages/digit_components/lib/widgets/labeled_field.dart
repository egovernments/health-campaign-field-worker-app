import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class LabeledField extends StatelessWidget {
  final Widget child;
  final String? label;
  final IconData? icon;
  final String? tooltipMessage;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final bool preferToolTipBelow;
  final TooltipTriggerMode tooltipTriggerMode;
  final TextStyle? textStyle;
  final bool isRequired;

  const LabeledField({
    super.key,
    required this.child,
    this.label,
    this.icon,
    this.tooltipMessage,
    this.labelStyle,
    this.padding,
    this.preferToolTipBelow = false,
    this.tooltipTriggerMode = TooltipTriggerMode.tap,
    this.textStyle,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.only(top: kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if(label != null)
            Row(
              children: [
                Flexible(
                  child: Text(
                    label!,
                    style: labelStyle ??
                        DigitTheme.instance.mobileTheme.textTheme.labelSmall,
                  ),
                ),
                if(isRequired) Text(' *', style: labelStyle ??
                    DigitTheme.instance.mobileTheme.textTheme.labelSmall,),
                icon != null
                    ? Tooltip(
                        message: tooltipMessage ?? '',
                        preferBelow: preferToolTipBelow,
                        triggerMode: tooltipTriggerMode,
                        child: Icon(icon ?? Icons.info_outline))
                    : const SizedBox.shrink()
              ],
            ),
            if(label != null)
            const SizedBox(height: 8),
            child,
          ],
        ),
      );
}
