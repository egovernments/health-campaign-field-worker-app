import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitAcknowledgement extends StatelessWidget {
  final String label;
  final String description;
  final IconData icon;
  final VoidCallback action;
  final String actionLabel;
  final double cardHeight;
  final Color color;

  const DigitAcknowledgement({
    super.key,
    required this.label,
    required this.icon,
    required this.description,
    required this.action,
    required this.actionLabel,
    required this.cardHeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          height: cardHeight,
          color: color,
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                label,
                style: theme.textTheme.labelMedium,
              ),
              Icon(icon)
            ],
          )),
        ),
        Text(description),
        DigitElevatedButton(
          onPressed: action,
          child: Text(actionLabel),
        )
      ],
    );
  }
}
