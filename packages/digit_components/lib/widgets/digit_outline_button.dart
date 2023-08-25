import 'package:digit_components/theme/colors.dart';
import 'package:flutter/material.dart';

class DigitOutLineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? backgroundColor;
  final BoxShadow boxShadow;

  const DigitOutLineButton({
    super.key,
    required this.label,
    this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.boxShadow = const BoxShadow(
      color: Colors.black12,
      offset: Offset(2, 2),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: const DigitColors().burningOrange, width: 1.0),
              color: const DigitColors().white,
              boxShadow: [boxShadow],
            ),
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  label,
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
