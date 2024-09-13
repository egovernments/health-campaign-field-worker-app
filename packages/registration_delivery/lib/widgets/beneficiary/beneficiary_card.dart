import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/blocs/app_localization.dart';

import '../../models/entities/status.dart';
import '../../utils/utils.dart';

class BeneficiaryCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? description;
  final String? status;
  final String? statusType;

  const BeneficiaryCard({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
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
          child: status == Status.visited.toValue() ||
                  status == Status.registered.toValue() ||
                  status == Status.administeredSuccess.toValue()
              ? DigitIconButton(
                  icon: Icons.check_circle,
                  iconText: RegistrationDeliveryLocalization.of(context)
                      .translate(status.toString() ==
                              Status.administeredSuccess.toValue()
                          ? '${RegistrationDeliverySingleton().selectedProject!.name}_${status.toString()}'
                          : status.toString()),
                  iconTextColor: theme.colorScheme.onSurfaceVariant,
                  iconColor: theme.colorScheme.onSurfaceVariant,
                )
              : DigitIconButton(
                  icon: Icons.info_rounded,
                  iconText: RegistrationDeliveryLocalization.of(context)
                      .translate(status.toString()),
                  iconTextColor: theme.colorScheme.error,
                  iconColor: theme.colorScheme.error,
                ),
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              subtitle!,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              description!,
              style: theme.textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}
