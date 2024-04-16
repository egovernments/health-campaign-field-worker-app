import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_enums.dart';

import '../blocs/app_localization.dart';

class ReferralBeneficiaryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String? status;
  final String? statusType;

  const ReferralBeneficiaryCard({
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
          child: status == ReferralReconEnums.visited.toValue()
              ? DigitIconButton(
                  icon: Icons.check_circle,
                  iconText: ReferralReconLocalization.of(context)
                      .translate(status.toString()),
                  iconTextColor: theme.colorScheme.onSurfaceVariant,
                  iconColor: theme.colorScheme.onSurfaceVariant,
                )
              : DigitIconButton(
                  icon: Icons.info_rounded,
                  iconText: ReferralReconLocalization.of(context)
                      .translate(status.toString()),
                  iconTextColor: theme.colorScheme.error,
                  iconColor: theme.colorScheme.error,
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
