import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class OutLineButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const OutLineButton(
      {super.key, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: DigitTheme.instance.colorScheme.secondary),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              label,
              style: TextStyle(
                color: DigitTheme.instance.colorScheme.secondary,
              ),
            )));
  }
}
