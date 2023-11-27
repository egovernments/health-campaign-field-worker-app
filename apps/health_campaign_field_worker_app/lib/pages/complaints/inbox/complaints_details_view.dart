import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../../blocs/localization/app_localization.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/header/back_navigation_help_header.dart';

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
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: ScrollableContent(
        enableFixedButton: true,
        header: Column(
          children: [
            const BackNavigationHelpHeaderWidget(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 20.0),
                child: Text(
                  localizations
                      .translate(i18.complaints.complaintsDetailsLabel),
                  style: theme.textTheme.displayMedium,
                ),
              ),
            ),
          ],
        ),
        footer: SizedBox(
          child: DigitCard(
            margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
            padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
            child: DigitElevatedButton(
              onPressed: () {
                router.pop();
              },
              child: Center(
                child: Text(
                  localizations.translate(i18.common.corecommonclose),
                ),
              ),
            ),
          ),
        ),
        children: [
          DigitCard(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          localizations
                              .translate(i18.complaints.inboxNumberLabel),
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
                                : const DigitColors().woodsmokeBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const DigitDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          localizations
                              .translate(i18.complaints.inboxTypeLabel),
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          localizations.translate(
                            complaint.serviceCode.snakeCase
                                .toUpperCase()
                                .trim(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const DigitDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          localizations
                              .translate(i18.complaints.inboxDateLabel),
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
                const DigitDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          localizations
                              .translate(i18.complaints.complainantName),
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
                const DigitDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          localizations
                              .translate(i18.complaints.inboxAreaLabel),
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
                const DigitDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
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
                const DigitDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          localizations
                              .translate(i18.complaints.inboxStatusLabel),
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
                const DigitDivider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
