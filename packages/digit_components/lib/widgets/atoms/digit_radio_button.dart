import 'package:flutter/material.dart';

class DigitRadioListTile extends StatelessWidget {
  final Object groupValue;
  final Widget title;
  final Function onchange;
  final Object value;

  const DigitRadioListTile(
      {super.key,
      required this.groupValue,
      required this.title,
      required this.onchange,
      required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RadioListTile(
      groupValue: groupValue,
      title: title,
      dense: true,
      activeColor: theme.colorScheme.secondary,
      onChanged: (value) => onchange,
      value: value,
      contentPadding: const EdgeInsets.all(0),
    );
  }
}
