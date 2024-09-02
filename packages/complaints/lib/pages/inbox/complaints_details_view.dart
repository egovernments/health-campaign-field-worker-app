import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
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

    return Scaffold(
      body: ScrollableContent(
        enableFixedDigitButton: true,
        header: Column(
          children: [
            const BackNavigationHelpHeaderWidget(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: spacer2, top: spacer5),
                child: Text(
                  localizations
                      .translate(i18.complaints.complaintsDetailsLabel),
                  style: theme.textTheme.displayMedium,
                ),
              ),
            ),
          ],
        ),
        footer: DigitCard(
            cardType: CardType.primary,
            margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
            padding: const EdgeInsets.all(spacer2),
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
          DigitCard(cardType: CardType.primary, children: [
            Padding(
              padding: const EdgeInsets.only(top: spacer4, bottom: spacer4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      localizations.translate(i18.complaints.inboxNumberLabel),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      complaint.serviceRequestId ??
                          "${localizations.translate(i18.complaints.inboxNotGeneratedLabel)}\n${localizations.translate(i18.complaints.inboxSyncRequiredLabel)}",
                      style: TextStyle(
                        color: complaint.serviceRequestId != null
                            ? theme.colorScheme.secondary
                            : theme.colorTheme.text.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: spacer4, bottom: spacer4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      localizations.translate(i18.complaints.inboxTypeLabel),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      localizations.translate(
                        complaint.serviceCode.snakeCase.toUpperCase().trim(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: spacer4, bottom: spacer4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      localizations.translate(i18.complaints.inboxDateLabel),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      complaint.auditDetails?.createdTime.toDateTime
                              .getFormattedDate() ??
                          "",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: spacer4, bottom: spacer4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      localizations.translate(i18.complaints.complainantName),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      complaint.user.name ?? "",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: spacer4, bottom: spacer4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      localizations.translate(i18.complaints.inboxAreaLabel),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      complaint.address.locality?.name ?? "",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: spacer4, bottom: spacer4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      localizations.translate(
                        i18.complaints.complainantContactNumber,
                      ),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      complaint.user.mobileNumber ?? "",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: spacer4, bottom: spacer4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      localizations.translate(i18.complaints.inboxStatusLabel),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      localizations.translate(
                        "COMPLAINTS_STATUS_${complaint.applicationStatus.name.snakeCase.toUpperCase()}",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: spacer4, bottom: spacer4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      localizations
                          .translate(i18.complaints.complaintDescription),
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      localizations.translate(
                        complaint.description,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
