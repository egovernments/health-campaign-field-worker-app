import 'package:digit_ui_components/theme/digit_extended_theme.dart';
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
    final textTheme = theme.digitTextTheme(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(theme.spacerTheme.spacer2 / 2),
          child: Text(
            title,
            style: textTheme.headingS,
          ),
        ),
        Offstage(
          offstage: status == null,
          child: status == ReferralReconEnums.visited.toValue()
              ? Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: theme.colorTheme.alert.success,
                    ),
                    SizedBox(
                      width: theme.spacerTheme.spacer1,
                    ),
                    Text(
                      ReferralReconLocalization.of(context)
                          .translate(status.toString()),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: theme.spacerTheme.spacer4),
                    )
                  ],
                )
              : Row(
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: theme.colorTheme.alert.error,
                    ),
                    SizedBox(
                      width: theme.spacerTheme.spacer1,
                    ),
                    Text(
                      ReferralReconLocalization.of(context)
                          .translate(status.toString()),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: theme.spacerTheme.spacer4),
                    )
                  ],
                ),
        ),
        Padding(
          padding: EdgeInsets.all(theme.spacerTheme.spacer2 / 2),
          child: Text(
            subtitle,
            style: textTheme.bodyS,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(theme.spacerTheme.spacer2 / 2),
          child: Text(
            description,
            style: textTheme.bodyS,
          ),
        ),
      ],
    );
  }
}
