import 'package:digit_components/digit_components.dart';
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
            (e) => DigitOutlineIconButton(
              buttonStyle: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(
                  width: 1.0,
                  color: theme.colorScheme.secondary,
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width / 1.25,
                  50,
                ),
              ),
              icon: e.icon,
              label: e.label,
              onPressed: e.action,
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
