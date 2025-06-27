import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/digit_tag_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tag.dart';
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
        if (status != null)
          Offstage(
            offstage: status == null,
            child: status == Status.visited.toValue() ||
                    status == Status.registered.toValue() ||
                    status == Status.administeredSuccess.toValue() ||
                    status == Status.delivered.toValue()
                ? Tag(
                    label: RegistrationDeliveryLocalization.of(context)
                        .translate(status.toString() ==
                                Status.administeredSuccess.toValue()
                            ? '${RegistrationDeliverySingleton().selectedProject!.projectType}_${status.toString()}'
                            : status.toString()),
                    type: TagType.success,
                  )
                : Tag(
                    label: RegistrationDeliveryLocalization.of(context)
                        .translate(status.toString()),
                    type: TagType.error,
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
