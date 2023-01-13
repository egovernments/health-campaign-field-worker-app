import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final List<ActionCardModel> items;

  const ActionCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items
          .map(
            (e) => DigitOutlineIconButton(
              icon: e.icon,
              label: e.label,
              onPressed: e.callback,
            ),
          )
          .toList(),
    );
  }
}

class ActionCardModel {
  final IconData icon;
  final String label;
  final VoidCallback callback;
  const ActionCardModel(this.icon, this.label, this.callback);
}
