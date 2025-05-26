import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

class BeneficiaryCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? description;

  const BeneficiaryCard({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(spacer1),
          child: Text(
            title,
            style: textTheme.headingS,
          ),
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              subtitle!,
              style: textTheme.bodyS,
            ),
          ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              description!,
              style: textTheme.bodyXS,
            ),
          ),
      ],
    );
  }
}
