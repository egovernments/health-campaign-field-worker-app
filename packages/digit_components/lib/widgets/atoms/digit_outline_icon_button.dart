import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitOutlineIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final ButtonStyle? buttonStyle;

  const DigitOutlineIconButton(
      {super.key,
      this.iconColor,
      required this.label,
      required this.icon,
      required this.onPressed,
      this.buttonStyle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Icon(icon)),
          const SizedBox(width: kPadding),
          Text(label),
        ],
      ),
    );
  }
}
