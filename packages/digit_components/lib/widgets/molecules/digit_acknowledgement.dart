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
          margin: const EdgeInsets.all(8),
          height: cardHeight,
          width: MediaQuery.of(context).size.width,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  textAlign: TextAlign.center,
                  label,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onPrimary,
                  )),
              Padding(
                  padding: DigitTheme.instance.containerMargin,
                  child: Icon(
                    icon,
                    size: 32,
                    color: theme.colorScheme.onPrimary,
                  ))
            ],
          ),
        ),
        Padding(
          padding: DigitTheme.instance.containerMargin,
          child: Text(
            description,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        DigitElevatedButton(
          onPressed: action,
          child: Text(actionLabel),
        )
      ],
    );
  }
}
