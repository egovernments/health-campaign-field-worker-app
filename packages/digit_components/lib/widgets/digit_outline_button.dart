import 'package:flutter/material.dart';

class DigitOutLineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;

  const DigitOutLineButton({
    super.key,
    required this.label,
    this.onPressed,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Text(
          label,
          style: TextStyle(
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
