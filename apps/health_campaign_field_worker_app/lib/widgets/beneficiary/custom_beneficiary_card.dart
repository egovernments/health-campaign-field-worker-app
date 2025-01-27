import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/models/entities/status.dart';

import '../../utils/utils.dart';

class CustomBeneficiaryCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? description;
  final String? status;
  final String? statusType;

  const CustomBeneficiaryCard({
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
          padding: const EdgeInsets.all(spacer1),
          child: Text(
            title,
            style: theme.textTheme.headlineSmall,
          ),
        ),
        if (status != null)
          Offstage(
            offstage: status == null,
            child: status == Status.visited.toValue() ||
                    status == Status.registered.toValue() ||
                    status == Status.administeredSuccess.toValue() ||
                    status == Status.delivered.toValue()
                ? DigitButton(
                    prefixIcon: Icons.check_circle,
                    label: RegistrationDeliveryLocalization.of(context)
                        .translate(status.toString() ==
                                Status.administeredSuccess.toValue()
                            ? status.toString()
                            : status.toString()),
                    capitalizeLetters: false,
                    textColor: theme.colorScheme.onSurfaceVariant,
                    iconColor: theme.colorScheme.onSurfaceVariant,
                    isDisabled: true,
                    onPressed: () {},
                    type: DigitButtonType.tertiary,
                    size: DigitButtonSize.medium,
                  )
                : DigitButton(
                    prefixIcon: Icons.info_rounded,
                    label: RegistrationDeliveryLocalization.of(context)
                        .translate(status.toString()),
                    textColor: theme.colorScheme.error,
                    iconColor: theme.colorScheme.error,
                    type: DigitButtonType.tertiary,
                    size: DigitButtonSize.medium,
                    isDisabled: true,
                    onPressed: () {},
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
