import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class BeneficiaryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String? status;
  final String? statusType;

  const BeneficiaryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    this.status,
    this.statusType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            title,
            style: theme.textTheme.headlineSmall,
          ),
        ),
        Offstage(
          offstage: status == null,
          child: DigitIconButton(
            icon: Icons.info_rounded,
            iconText: status,
            iconTextColor: theme.errorColor,
            iconColor: theme.errorColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            subtitle,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            description,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
