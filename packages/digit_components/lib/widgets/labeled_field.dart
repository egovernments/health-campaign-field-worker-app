import 'package:flutter/material.dart';

class LabeledField extends StatelessWidget {
  final Widget child;
  final String label;
  final IconData? icon;
  final String? toolTipMsg;

  const LabeledField(
      {super.key,
      required this.child,
      required this.label,
      this.icon,
      this.toolTipMsg});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                icon != null
                    ? Tooltip(
                        message: toolTipMsg ?? '',
                        preferBelow: false,
                        triggerMode: TooltipTriggerMode.tap,
                        child: Icon(icon ?? Icons.info_outline))
                    : Container()
              ],
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      );
}
