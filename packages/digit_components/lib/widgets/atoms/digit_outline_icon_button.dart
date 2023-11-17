import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitOutlineIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const DigitOutlineIconButton({
    super.key,
    this.iconColor,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.buttonStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle ??
          OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.all(kPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Icon(
              icon,
              color: iconColor,
            )),
            const SizedBox(width: kPadding),
            Text(
              label,
              style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            ),
          ],
        ),
      ),
    );
  }
}
