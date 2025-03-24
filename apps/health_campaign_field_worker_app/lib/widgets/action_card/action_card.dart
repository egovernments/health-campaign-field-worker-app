import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final List<ActionCardModel> items;

  const ActionCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(spacer2 / 2),
              child: DigitButton(
                type: DigitButtonType.secondary,
                size: DigitButtonSize.large,
                prefixIcon: e.icon,
                label: e.label,
                onPressed: e.action ?? () {},
              ),
            ),
          )
          .toList(),
    );
  }
}

class ActionCardModel {
  final IconData icon;
  final String label;
  final VoidCallback? action;

  const ActionCardModel({
    required this.icon,
    required this.label,
    required this.action,
  });
}
