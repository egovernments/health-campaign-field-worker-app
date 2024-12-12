import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../models/pgr_complaints.dart';
import '/blocs/localization/app_localization.dart';
import '/utils/i18_key_constants.dart' as i18;
import '/utils/utils.dart';
import '/widgets/header/back_navigation_help_header.dart';

@RoutePage()
class ComplaintsDetailsViewPage extends StatelessWidget {
  final PgrServiceModel complaint;

  const ComplaintsDetailsViewPage({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final theme = Theme.of(context);
    final localizations = ComplaintsLocalization.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      body: ScrollableContent(
        enableFixedDigitButton: true,
        header: Column(
          children: [
            const BackNavigationHelpHeaderWidget(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: spacer2, top: spacer2, bottom: spacer2),
                child: Text(
                  localizations
                      .translate(i18.complaints.complaintsDetailsLabel),
                  style: textTheme.headingXl,
                ),
              ),
            ),
          ],
        ),
        footer: DigitCard(
            cardType: CardType.primary,
            margin: const EdgeInsets.only(top: spacer2),
            children: [
              DigitButton(
                onPressed: () {
                  router.pop();
                },
                label: localizations.translate(i18.common.corecommonclose),
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
              ),
            ]),
        children: [
          DigitCard(
            margin: const EdgeInsets.all(spacer2),
              cardType: CardType.primary,
              children: [
            LabelValueSummary(
              padding: EdgeInsets.zero,
                items: [
                  LabelValueItem(
                      label: localizations.translate(i18.complaints.inboxNumberLabel),
                      value: complaint.serviceRequestId ??
                          "${localizations.translate(i18.complaints.inboxNotGeneratedLabel)}\n${localizations.translate(i18.complaints.inboxSyncRequiredLabel)}",
                      valueTextStyle: complaint.serviceRequestId !=null ? textTheme.bodyS.copyWith(color: theme.colorTheme.primary.primary1) : null ,
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                      label: localizations.translate(i18.complaints.inboxTypeLabel),
                      value: localizations.translate(
                        complaint.serviceCode.snakeCase.toUpperCase().trim(),
                      ),
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                      label: localizations.translate(i18.complaints.inboxDateLabel),
                      value: complaint.auditDetails?.createdTime.toDateTime
                          .getFormattedDate() ??
                          "",
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label: localizations.translate(i18.complaints.complainantName),
                    value: complaint.user.name ?? "",
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label: localizations.translate(i18.complaints.inboxAreaLabel),
                    value: complaint.address.locality?.name ?? "",
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label: localizations.translate(
                      i18.complaints.complainantContactNumber,
                    ),
                    value: complaint.user.mobileNumber ?? "",
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label: localizations.translate(i18.complaints.inboxStatusLabel),
                    value: localizations.translate(
                      "COMPLAINTS_STATUS_${complaint.applicationStatus.name.snakeCase.toUpperCase()}",
                    ),
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label: localizations
                        .translate(i18.complaints.complaintDescription),
                    value: localizations.translate(
                      complaint.description,
                    ),
                    labelFlex: 5,
                  ),
                ]
            )
          ]),
        ],
      ),
    );
  }
}
