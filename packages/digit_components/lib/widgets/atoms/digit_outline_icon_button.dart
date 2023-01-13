import 'package:flutter/material.dart';

class DigitOutlineIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? iconColor;

  const DigitOutlineIconButton({
    super.key,
    this.iconColor,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor ?? theme.colorScheme.secondary),
            Text(label,
                style:
                    TextStyle(color: iconColor ?? theme.colorScheme.secondary)),
          ],
        ),
      ),
    );
  }
}
