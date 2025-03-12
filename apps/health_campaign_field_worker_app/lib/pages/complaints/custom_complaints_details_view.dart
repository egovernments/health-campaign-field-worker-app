import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:complaints/blocs/localization/app_localization.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/label_value_summary.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import 'package:complaints/models/pgr_complaints.dart';
import '/blocs/localization/app_localization.dart';
import '/utils/i18_key_constants.dart' as i18;
import '/utils/utils.dart';
import '/widgets/header/back_navigation_help_header.dart';

@RoutePage()
class CustomComplaintsDetailsViewPage extends StatelessWidget {
  final PgrServiceModel complaint;

  const CustomComplaintsDetailsViewPage({
    Key? key,
    required this.complaint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final theme = Theme.of(context);
    final localizations = ComplaintsLocalization.of(context);
    final textTheme = theme.digitTextTheme(context);

    final String supervisorName = getSupervisorName(complaint);
    final String supervisorContactNumber =
        getSupervisorContactNumber(complaint);

    return Scaffold(
      body: ScrollableContent(
        enableFixedDigitButton: true,
        header: Column(
          children: [
            const BackNavigationHelpHeaderWidget(
              showHelp: false,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: spacer2, top: spacer2, bottom: spacer2),
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
                LabelValueSummary(padding: EdgeInsets.zero, items: [
                  LabelValueItem(
                    label: localizations
                        .translate(i18.complaints.inboxNumberLabel),
                    value: complaint.serviceRequestId ??
                        "${localizations.translate(i18.complaints.inboxNotGeneratedLabel)}\n${localizations.translate(i18.complaints.inboxSyncRequiredLabel)}",
                    valueTextStyle: complaint.serviceRequestId != null
                        ? textTheme.bodyS
                            .copyWith(color: theme.colorTheme.primary.primary1)
                        : null,
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label:
                        localizations.translate(i18.complaints.inboxTypeLabel),
                    value: localizations.translate(
                      complaint.serviceCode.snakeCase.toUpperCase().trim(),
                    ),
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label:
                        localizations.translate(i18.complaints.inboxDateLabel),
                    value: complaint.auditDetails?.createdTime.toDateTime
                            .getFormattedDate() ??
                        "",
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label:
                        localizations.translate(i18.complaints.complainantName),
                    value: complaint.user.name ?? "",
                    labelFlex: 5,
                  ),
                  LabelValueItem(
                    label:
                        localizations.translate(i18.complaints.inboxAreaLabel),
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
                    label: localizations
                        .translate(i18.complaints.inboxStatusLabel),
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
                  if (supervisorName.isNotEmpty)
                    LabelValueItem(
                      label: localizations
                          .translate(i18.complaints.supervisorName),
                      value: localizations.translate(
                        supervisorName.toString(),
                      ),
                      labelFlex: 5,
                    ),
                  if (supervisorContactNumber.isNotEmpty)
                    LabelValueItem(
                      label: localizations
                          .translate(i18.complaints.supervisorContactNumber),
                      value: localizations.translate(
                        supervisorContactNumber.toString(),
                      ),
                      labelFlex: 5,
                    ),
                ])
              ]),
        ],
      ),
    );
  }

  // info gets the supervisorContact name
  String getSupervisorName(PgrServiceModel complaint) {
    String name = "";
    var supervisorNameKey = "supervisorName";

    if (complaint == null || complaint.additionalDetail == null) {
      return name;
    } else {
      try {
        Map<String, dynamic> complaintAdditionalDetails =
            json.decode(complaint.additionalDetail ?? "");
        if (complaintAdditionalDetails.containsKey(supervisorNameKey)) {
          name = complaintAdditionalDetails[supervisorNameKey] ?? "";
        }
      } catch (e) {
        return "";
      }

      return name;
    }
  }

  // info gets the supervisorContact number
  String getSupervisorContactNumber(PgrServiceModel complaint) {
    String contactNumber = "";
    var supervisorContactNumberKey = "supervisorContactNumber";

    if (complaint == null || complaint.additionalDetail == null) {
      return contactNumber;
    } else {
      try {
        Map<String, dynamic> complaintAdditionalDetails =
            json.decode(complaint.additionalDetail ?? "");
        if (complaintAdditionalDetails
            .containsKey(supervisorContactNumberKey)) {
          contactNumber =
              complaintAdditionalDetails[supervisorContactNumberKey] ?? "";
        }
      } catch (e) {
        return "";
      }

      return contactNumber;
    }
  }
}
