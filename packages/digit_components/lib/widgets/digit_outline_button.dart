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
      style: onPressed != null
          ? buttonStyle
          : OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(
                width: 1.0,
                color: theme.colorScheme.outline,
              ),
              minimumSize: Size(
                MediaQuery.of(context).size.width / 1.25,
                50,
              ),
            ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: onPressed != null
                ? theme.colorScheme.secondary
                : theme.colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
